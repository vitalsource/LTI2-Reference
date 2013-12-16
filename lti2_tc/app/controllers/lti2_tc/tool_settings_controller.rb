require_dependency "lti2_tc/application_controller"

module Lti2Tc
  class ToolSettingsController < ApplicationController
    def initialize
      @acceptable_headers = ['application/vnd.ims.lti.v2.toolsettings+json',
                             'application/vnd.ims.lti.v2.toolsettings.simple+json']
      @tool_setting_binding_map = {:Tool => :ToolProxy, :Context => :ToolProxyBinding, :Ltilink => :LtiLink}
    end

    def self.add_ancestor_settings(target_matches)
      tool_id = target_matches.first.tool_id
      node_id = target_matches.first.scopeable_id
      now_collection_type = target_matches.first.scopeable_type
      if now_collection_type == 'Ltilink'
        # we have link in hand, now find courses for link
        course_id = Lti2Tc::Link.find(node_id).course.id
        target_matches << Lti2Tc::ToolSetting.where(:tool_id => tool_id, :scopeable_type => 'Context', :scopeable_id => course_id)
        now_node_id = course_id
        now_collection_type = 'Context'
      end
      if now_collection_type == 'Context'
        # we have course settings, now find tool settings for that course
        target_matches << Lti2Tc::ToolSetting.where(:tool_id => tool_id, :scopeable_type => 'Tool')
        now_collection_type == 'Context'
      end
      target_matches.flatten
    end

    def self.get_collection_type(path)
      Lti2Tc::ToolSetting.parse_uri(path)[0]
    end

    def self.get_distinct_matches(matches)
      dupe_check_set = Set.new
      all_matches = []
      matches.each do |match|
        unless dupe_check_set.include?(match.name)
          all_matches << match
          dupe_check_set.add(match.name)
        end
      end
    end

    def self.get_trimmed_request_uri(uri)
      uri.split('?').first
    end

    def self.get_target_matches(collection_type, tool_guid, node_id)
      tool = Lti2Tc::Tool.where(:key => tool_guid).first
      case collection_type
        when 'Tool'
          Lti2Tc::ToolSetting.where(:tool_id => tool.id, :scopeable_type => 'Tool')
        when 'Context'
          Lti2Tc::ToolSetting.where(:tool_id => tool.id, :scopeable_type => 'Context', :scopeable_id => node_id)
        when 'Ltilink'
          Lti2Tc::ToolSetting.where(:tool_id => tool.id, :scopeable_type => 'Ltilink', :scopeable_id => node_id)
        else
          nil
      end
    end

    def is_header_full_not_simple(header)
      @acceptable_headers.index(header) == 0
    end

    def is_unacceptable(header)
      !@acceptable_headers.include?(header)
    end

    def show
      tool_guid = params[:tool_guid]
      collection_type = ToolSettingsController.get_collection_type(request.path)
      node_id = collection_type == 'tool' ? nil : params[:node_id]
      bubble = params[:bubble]

      accept = request.headers['ACCEPT']
      (render :text => "Unacceptable ACCEPT header for ToolSettings", :status => 406 if is_unacceptable(accept)) and return

      target_matches = ToolSettingsController.get_target_matches(collection_type, tool_guid, node_id)
      (render :text => "No matching ToolSettings", :status => 404 if target_matches.nil?) and return

      if bubble.present?
        target_matches = ToolSettingsController.add_ancestor_settings(target_matches)
      end

      result = {}
      if is_header_full_not_simple(accept)
        target_matches = ToolSettingsController.get_distinct_matches(target_matches) if bubble == 'distinct'
        result[:@context] = @acceptable_headers[0]
        result[:@graph] = []
        current_match_type = nil
        @match_dict = nil
        target_matches.each do |match|
          if match.scopeable_type != current_match_type
            graph_element = {}
            result[:@graph] << graph_element
            graph_element['@type'] = @tool_setting_binding_map[match.scopeable_type.to_sym]
            graph_element['@id'] = match.to_uri
            graph_element['custom_url'] = graph_element['@id']
            @match_dict = {}
            graph_element['custom'] = @match_dict
            current_match_type = match.scopeable_type
          end
          @match_dict[match.name] = match.value
        end
      else
        # simple only allows 'distinct' output
        target_matches.flatten
        target_matches = ToolSettingsController.get_distinct_matches(target_matches)
        target_matches.each {|match| result[match.name] = match.value}
      end

      render :json => result
    end

    def update
      tool_guid = params[:tool_guid]
      collection_type = ToolSettingsController.get_collection_type(request.path)
      node_id = collection_type == 'Tool' ? nil : params[:node_id]

      content_type = request.headers['CONTENT_TYPE']
      (render :text => "Unacceptable Content_Type header for ToolSettings", :status => 406 if is_unacceptable(content_type)) and return

      if is_header_full_not_simple(content_type)

      else
        body_str = request.body.read
        json_str = CGI::unescape body_str
        settings = JsonWrapper.new(json_str)
      end

      scopeable_type, tool_guid, scopeable_id = ToolSetting.parse_uri(request.path)
      tool = Tool.where(:key => tool_guid).first

      # first clear out the old data
      if scopeable_type == 'Tool'
        ToolSetting.where(:scopeable_type => scopeable_type, :tool_id => tool.id).delete_all
      else
        ToolSetting.where(:scopeable_type => scopeable_type, :tool_id => tool.id, :scopeable_id => scopeable_id).delete_all
      end

      settings.root.each_pair do |k,v|
        ts = ToolSetting.create(:scopeable_type => scopeable_type, :tool_id => tool.id, :scopeable_id => scopeable_id,
                                :name => k, :value => v)
        ts.save
      end

      render :json => "Successfully updated #{settings.root.length} values"
    end
  end

end

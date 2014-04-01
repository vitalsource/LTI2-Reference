require_dependency "lti2_tc/application_controller"

module Lti2Tc

  class ToolSettingsController < ApplicationController

    before_filter :pre_process_tenant   # look in ApplicationController

    def initialize
      @acceptable_headers = ['application/vnd.ims.lti.v2.toolsettings+json',
                             'application/vnd.ims.lti.v2.toolsettings.simple+json']
      @tool_setting_binding_map = {:Tool => :ToolProxy, :Context => :ToolProxyBinding, :Ltilink => :LtiLink}
    end

    def self.add_ancestor_settings(target_matches)
      return if target_matches.blank?
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
      all_matches
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
      (render :text => "Authentication error", :status => 401 if @oauth_error) and return

      tool_guid = params[:tool_guid]
      collection_type = ToolSettingsController.get_collection_type(request.path)
      node_id = collection_type == 'tool' ? nil : params[:node_id]
      bubble = params[:bubble]

      accept = request.headers['ACCEPT']

      (render :json => {}, :status => 406 if is_unacceptable(accept)) and return

      puts "collection_type: #{collection_type}"
      puts "accept: #{accept}"

      all_match_names = Set.new
      result = {}
      if is_header_full_not_simple(accept)
        content_type = 'application/vnd.ims.lti.v2.toolsettings+json'
        target_matches = ToolSettingsController.get_target_matches(collection_type, tool_guid, node_id)

        if bubble.present?
          reverse_collections = Lti2Tc::ToolSetting::COLLECTION_TYPES.reverse
          collection_index = reverse_collections.find_index(collection_type.to_sym)
          all_collection_types = reverse_collections[collection_index..-1]
          target_matches = ToolSettingsController.add_ancestor_settings(target_matches)
          reachable_uris = Lti2Tc::ToolSetting.create_reachable_uris(tool_guid, collection_type, node_id)
        else
          all_collection_types = [collection_type]
          reachable_uris = {}
          reachable_uris[collection_type.to_sym] = Lti2Tc::ToolSetting.create_uri(tool_guid, collection_type, node_id)
        end

        result[:@context] = 'http://purl.imsglobal.org/ctx/lti/v2/ToolSettings'
        result[:@graph] = []

        all_collection_types.each do |collect_type|
          @match_dict = nil
          graph_element = {}
          result[:@graph] << graph_element
          collection_matches = target_matches.select {|match| match.scopeable_type == collect_type.to_s}
          #if collection_matches.length > 0
            graph_element['@type'] = @tool_setting_binding_map[collect_type.to_sym]
            a_match = collection_matches[0]
            uri = reachable_uris[collect_type.to_sym]
            graph_element['@id'] = uri
            @match_dict = {}
            graph_element['custom'] = @match_dict

            target_matches = ToolSettingsController.get_distinct_matches(target_matches) if bubble == 'distinct'

            target_matches.each do |match|
              if match.scopeable_type.to_sym == collect_type.to_sym
                unless all_match_names.include? match.name
                  @match_dict[match.name] = match.value
                  all_match_names << match.name if bubble == 'distinct'
                end
              end
            end
          #end
        end
      else
        content_type = 'application/vnd.ims.lti.v2.toolsettings.simple+json'
        target_matches = ToolSettingsController.get_target_matches(collection_type, tool_guid, node_id)

        if bubble.present?
          if bubble == 'all' && accept == 'application/vnd.ims.lti.v2.toolsettings.simple+json'
            (render :text => 'bubble=all option cannot be used for toolsettings.simple media type', :status => 400) and return
          end
          target_matches = ToolSettingsController.add_ancestor_settings(target_matches)
        end

        # simple only allows 'distinct' output
        target_matches.flatten
        target_matches = ToolSettingsController.get_distinct_matches(target_matches)
        target_matches.each {|match| result[match['name']] = match['value']}
      end

      puts JSON.pretty_generate(result)

      render :json => result, :content_type => content_type
    end

    def update
      (render :text => "Authentication error", :status => 401 if @oauth_error) and return

      tool_guid = params[:tool_guid]
      collection_type = ToolSettingsController.get_collection_type(request.path)
      node_id = collection_type == 'Tool' ? nil : params[:node_id]

      content_type = request.headers['CONTENT_TYPE']
      (render :text => "Unacceptable Content_Type header for ToolSettings", :status => 406 if is_unacceptable(content_type)) and return

      body_str = request.body.read
      json_str = CGI::unescape body_str

      if is_header_full_not_simple(content_type)
        settings_object = JSON.load(json_str)
        (render :json => "Multiple level tool setting updates not allowed", :status => 400 if settings_object['@graph'].length > 1) and return
        settings = settings_object['@graph'][0]['custom']
      else
        settings = JSON.load(json_str)
      end

      scopeable_type, tool_guid, scopeable_id = ToolSetting.parse_uri(request.path)
      tool = Tool.where(:key => tool_guid).first

      # for Tool only
      scopeable_id = tool.id if scopeable_type == 'Tool'

      # first clear out the old data
      if scopeable_type == 'Tool'
        ToolSetting.where(:scopeable_type => scopeable_type, :tool_id => tool.id).delete_all
      else
        ToolSetting.where(:scopeable_type => scopeable_type, :tool_id => tool.id, :scopeable_id => scopeable_id).delete_all
      end

      settings.each_pair do |k,v|
        ts = ToolSetting.create(:scopeable_type => scopeable_type, :tool_id => tool.id, :scopeable_id => scopeable_id,
                                :name => k, :value => v)
        ts.save
      end

      render :json => "Successfully updated #{settings.length} values"
    end

  end

end

require "lti2_commons/json_wrapper"

TOOL_PROXY_DIR = File.expand_path('../../closet/toolproxy_collection')

def error(message, node, extra_node=nil)
  warn(message, node)
  exit
end

def warn(message, node, extra_node=nil)
  puts(message)
  puts(node.inspect)
  puts(extra_node.inspect) if extra_node
end

def compare_structure(tp_model, tp_test)
  compare_node(tp_model.root, tp_test.root)
end

def compare_node(model_node, test_node)
  unless model_node.class == test_node.class
    warn("Mistyped node--model: #{model_node.class} and test: #{test_node.class}", model_node, test_node)
    return
  end
  if model_node.is_a? Hash
    # check that corresponding test key exists
    model_node.keys.each do |model_key|
      unless test_node.include?(model_key)
        warn("Model key #{model_key} is missing in Test", test_node)
      end
    end
  end
  if test_node.is_a? Hash
    test_node.keys.each do |test_key|
      unless test_node.include?(test_key)
        warn("Test key #{test_key} is missing in Model", model_node)
      end
    end
  end

  # recurse
  if model_node.is_a? Hash
    model_node.each_pair do |k,v|
      new_model_node = v
      new_test_node = test_node[k]
      #puts "HashEntry: #{k}"
      compare_node(new_model_node, new_test_node)
    end
  elsif model_node.is_a? Array
    if model_node.length > 0
      first_model_element = model_node[0]
      # loop over test elements comparing to first model element

      test_node.each do |test_element|
        compare_node(first_model_element, test_element)
      end
    end
  end
end

def get_tool_proxy(filename)
 json_str = File.read(File::open(File.join(TOOL_PROXY_DIR, filename)))
 Lti2Commons::JsonWrapper.new(json_str)
end

compare_structure(get_tool_proxy('lum_fab_tp.json'), get_tool_proxy('lum_vst_tp.json'))


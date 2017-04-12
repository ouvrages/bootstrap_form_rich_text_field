module RichTextField
  def rich_text_field(method, options = {})
    name = "#{self.object_name}[#{method.to_s}]"

    classes = []
    classes << "sr-only" if options[:hide_label]

    config_option = options[:config]
    case config_option
    when nil
      config = TinyMCE::Rails.configuration[:default]
    when String, Symbol
      config = TinyMCE::Rails.configuration[config_option]
    when Hash
      config = TinyMCE::Rails.configuration[:default].merge(config_option)
    end
    config_js = config.to_javascript

    content_tag(:div, class: "row") do
      content_tag(:div, class: "col-xs-12") do
        content_tag(
          :label,
          options.delete(:label) || self.object.class.human_attribute_name(method),
          class: classes.join(" "),
        ) + content_tag(
          :textarea,
          self.object.send(method),
          name: name,
          class: ["rich-textarea", options.delete(:class)].join(" "),
          id: options.delete(:id) || name,
          data: {
            tinymce_config: config_js,
          },
          **options)
      end
    end
  end
end

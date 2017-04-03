module RichTextField
  def rich_text_field(method, options = {})
    name = "#{self.object_name}[#{method.to_s}]"

    classes = []
    classes << "sr-only" if options[:hide_label]

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
          class: ["tinymce", options.delete(:class)].join(" "),
          id: options.delete(:id) || name,
          **options)
      end
    end
  end
end

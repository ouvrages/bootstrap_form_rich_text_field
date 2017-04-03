require "bootstrap_form_rich_text_field/version"
require "bootstrap_form_rich_text_field/rich_text_field"
require "bootstrap_form/form_builder"
require "tinymce-rails"

module BootstrapFormRichTextField
  include RichTextField
end

module BootstrapForm
  class FormBuilder
    include BootstrapFormRichTextField
  end
end

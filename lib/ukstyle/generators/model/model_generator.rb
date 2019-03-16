# frozen_string_literal: true

require "rails/generators/model_helpers"

module Ukstyle
  module Generators
    class ModelGenerator < Rails::Generators::NamedBase # :nodoc:
      include Rails::Generators::ModelHelpers
      argument :attributes, type: :array, default: [], banner: "field[:type][:index] field[:type][:index]"

      hook_for :orm, required: true, desc: "ORM to be invoked"
    end
  end
end
# frozen_string_literal: true

require 'rake'
require 'byebug'

module Ukstyle
  class Railtie < ::Rails::Railtie
    # Load tasks
    Dir.glob("#{__dir__}/../tasks/**/*.rake").each { |file| load file }
  end
end

require 'test_helper'
require "rails"

class RakeTaskTest < ActiveSupport::TestCase
  setup do
    Rails.application.load_tasks
    Rake::Task['ukstyle:install'].invoke
    Rake::Task['ukstyle:install'].reenable

    # FileUtils.remove_file initializer_file, force: true
  end

  def test_app_path
    File.expand_path("../dummy", __dir__)
  end

  # def initializer_file
  #   @initializer_file ||= Rails.root.join('config', 'initializers', 'ukstyle.rb')
  # end

  def application_js_path
    "#{test_app_path}/app/assets/javascripts/application.js"
  end

  def application_scss_path
    "#{test_app_path}/app/assets/stylesheets/application.scss"
  end

  test 'rake tasks' do
    output = Dir.chdir(test_app_path) { `rake -T` }
    assert_includes output, 'ukstyle:install'
  end

  test 'inject uikit path to javascript asset' do
    # Rake::Task['ukstyle:install'].invoke 
    # assert FileTest.exist? initializer_file
    js = File.read(application_js_path)
    assert_match 'uikit.min.js', js
    assert_match 'uikit-icons.min.js', js
  end

  test 'generate stylesheets scss' do
    assert FileTest.exist? application_scss_path
  end
end
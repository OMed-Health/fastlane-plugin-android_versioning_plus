$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

# This module is only used to check the environment is currently a testing env
module SpecHelper
end

require 'fastlane' # to import the Action super class
require 'fastlane/plugin/android_versioning_plus' # import the actual plugin

Fastlane.load_actions # load other actions (in case your plugin calls other actions or shared values)

def copy_build_fixture
  FileUtils.mkdir_p("/tmp/fastlane")
  source = "./spec/fixtures"
  destination = "/tmp/fastlane"

  FileUtils.cp_r(source, destination)
end

def remove_fixture
  source = "/tmp/fastlane/fixtures"
  destination = "./spec"
  [
    "#{destination}/fixtures/app/build.gradle"
  ].each do |f|
    FileUtils.rm f
  end
  FileUtils.cp_r(source, destination)
  FileUtils.rm_r(source)
end

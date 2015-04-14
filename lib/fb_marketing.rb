require 'fb_graph2'
require 'active_record'
require 'active_support'
require 'active_support/core_ext'
require 'rack/oauth2'

module FbMarketing
	mattr_accessor :root_url, :api_version
	self.root_url = "https://graph.facebook.com"
	self.api_version = "v2.2"

	 class << self

	 end
end

require_relative 'fb_marketing/attribute_assigner'
require_relative 'fb_marketing/node'
Dir[File.join(__dir__, 'fb_marketing/*.rb')].each do |file|
  require file
end
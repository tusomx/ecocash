require 'httparty'
require 'ecocash/configuration'
require 'ecocash/client'
require 'ecocash/version'

module Ecocash
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end

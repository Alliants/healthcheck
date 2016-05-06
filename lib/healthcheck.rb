require "healthcheck/version"
require "healthcheck/middleware"
require "healthcheck/railtie"

module Healthcheck
  def self.add(&block)
    @healthcheck = block
  end

  def self.remove
    @healthcheck = nil
  end

  def self.passed?
    return true if @healthcheck.nil?
    @healthcheck.call
  end
end

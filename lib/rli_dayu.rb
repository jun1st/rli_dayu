require 'rli_dayu/version'
require 'rli_dayu/sms'

module RliDayu
  class << self
    attr_accessor :app_key, :secret
  end
end

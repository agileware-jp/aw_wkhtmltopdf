# frozen_string_literal: true

require 'pathname'
require 'rbconfig'

require_relative 'aw_wkhtmltopdf_binary/version'

module AwWkhtmltopdfBinary
  LIBEXEC_PATH = Pathname(__dir__).parent.join('libexec').expand_path

  class << self
    def path
      cpu, os, suffix = determine_cpu_os_suffix
      exe_path = LIBEXEC_PATH.join("wkhtmltopdf-#{cpu}_#{os}#{suffix}")
      exe_path
    end

    private

    # returns similar to [host_cpu, host_os, executable suffix]
    def determine_cpu_os_suffix
      host_os = RbConfig::CONFIG['host_os']
      case host_os
      # ruby-2.6.10: "linux-gnu"
      # later: "linux"
      when /linux/
        return ['x86_64', 'linux', nil]
      # "darwin22", "darwin20", ...
      when /darwin/
        # If "host_cpu" is "arm64", it probably uses Rosetta.
        return ['x86_64', 'darwin', nil]
      # https://magazine.rubyist.net/articles/0017/0017-CodeReview.html#%E3%83%97%E3%83%A9%E3%83%83%E3%83%88%E3%83%95%E3%82%A9%E3%83%BC%E3%83%A0%E3%81%AE%E5%88%A4%E5%88%A5
      when /mswin(?!ce)|mingw|cygwin|bccwin/
        return ['x64', 'mingw32', '.exe']
      end

      raise NotSupportedPlatformError, "not supported platform: host_os=#{host_os.inspect}"
    end
  end

  class Error < StandardError
  end

  class NotSupportedPlatformError < Error
  end
end

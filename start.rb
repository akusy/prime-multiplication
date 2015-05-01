#!/usr/bin/env ruby

require_relative 'config'
require_all 'lib'

Cli.new(ARGV).call

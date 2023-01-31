#!/usr/bin/env ruby
puts ARGV[0].scan(/\bfrom:+?[0-9A-Za-z]+\,\bto:+?[0-9A-Za-z]+\,\bflags:+?(.*)/).join

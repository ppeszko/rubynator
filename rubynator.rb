#!/usr/bin/env ruby

dirs = ARGV

dirs_with_code_lines = ARGV.map do |arg|
  `grep "def " -r #{arg}`
end

methods = []
dirs_with_code_lines.each do |dir_with_lines|
  dir_with_lines.split("\n").map do |method_name|
    if method_name =~ /.*def (self\.)?(\w*)(\(.*\))?/
      methods << $2
    end
  end
end

puts "all methods:"
p methods


puts "potentialy not used methods:"
methods.each do |method_name|
  results = `egrep --color "[^_]#{method_name}[^_]?" -r #{dirs.join(' ')} | egrep --color -v "def "`
  if results == ''
    p method_name
  end
end


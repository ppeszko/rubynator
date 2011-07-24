dir = ARGV[0]

methods = []
lines_with_methods = `grep "def " -r #{dir}`

lines_with_methods.split("\n").map do |method_name|
  if method_name =~ /.*def (self\.)?(\w*)(\(.*\))?/
    methods << $2
  end
end

puts "all methods:"
p methods


puts "potentialy not used methods:"
methods.each do |method_name|
  results = `egrep --color "[^_]#{method_name}[^_]?" -r #{dir} | egrep --color -v "def "`
  if results == ''
    p method_name
  end
end


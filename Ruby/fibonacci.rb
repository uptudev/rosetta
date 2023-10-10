a = 0
puts a
b = 1
puts b

while true
  c = a + b
  
  if c > 18446744073709551615
    puts "Overflowed!"
    break
  end

  cstr = "%u" % c
  puts cstr

  a = b
  b = c
end

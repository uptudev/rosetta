local a = math.tointeger(0)
print(a)
local b = math.tointeger(1)
print(b)
local c = math.tointeger(a + b)

repeat
    print(string.format("%u", c))
    a = b
    b = c
    c = math.tointeger(a + b)
until (c < b)

print(string.format("%u", c))
print("Overflowed!")

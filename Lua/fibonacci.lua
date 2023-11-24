local a = math.tointeger(0)
print(a)
local b = math.tointeger(1)
print(b)

repeat
    local c = math.tointeger(a + b)
    print(string.format("%u", c))
    a = b
    b = c
until (b < 0)

print("Overflowed!")

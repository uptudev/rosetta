local a = math.tointeger(0)
print(a)
local b = math.tointeger(1)
print(b)
local c = math.tointeger(a + b)
local cstr = string.format("%u", c)

repeat
    print(cstr)
    a = b
    b = c
    c = math.tointeger(a + b)
    cstr = string.format("%u", c)
until (c < b)

print(cstr)
print("Overflowed!")

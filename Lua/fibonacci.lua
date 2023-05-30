local a = math.tointeger(0)
print(a)
local b = math.tointeger(1)
print(b)

while(true)
do
    local c = math.tointeger(a + b)
    local cstr = string.format("%u", c)
    print(cstr)

    if(c < b)
    then
        print("Overflowed!")
        break
    end

    a = b
    b = c
end

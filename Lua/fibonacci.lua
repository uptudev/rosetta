-- Note that Lua's `integer` subtype is the equivalent of an i64, not a u64.
-- As such, it will max out at a value one iteration before the languages supporting unsigned integers.

local a = math.tointeger(0)
print(a)
local b = math.tointeger(1)
print(b)

while(true)
do
    local c = math.tointeger(a + b)

    if(c < b)
    then
        print("Overflowed!")
        break
    end

    print(c)
    a = b
    b = c
end


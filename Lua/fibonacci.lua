-- Lua >5.3 officially supports only signed 64-bit values with the `integer` subtype.
-- As such, even though the `string.format` call below interprets it as a u64,
-- the internal value is still calculated via i64 math.
-- Because of this, technically the i64 will "overflow" one iteration early,
-- so we have to account for this with control flow even if the formatter can "pretend" its a u64.

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


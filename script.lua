local getrawmetatable = getrawmetatable or debug.getmetatable
local make_writeable = make_writeable or setreadonly or changereadonly or change_writeable
make_writeable(getrawmetatable(game), false)
local backup = getrawmetatable(game).__namecall
getrawmetatable(game).__namecall = function(u, ...)
   local m = ({...})[select('#', ...)]
   local packed = {...}
   local a = {}
   for i = 1, #packed - 1 do
       a[i] = packed[i]
   end
   if m == 'Kick' then
       warn('Kick attempt at ' .. os.time() .. ' (' .. tostring(unpack(a)) .. ')')
       return true
   end
   return backup and backup(u, ...) or u[m](u, unpack(a))
end

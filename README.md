# RBLXAntiKick
Here's a script that prevents the client from kicking itself. This won't work if the server tries to kick you, but most anti exploits kick you from the client anyways (like The Streets or Phantom Forces).
This will tell you when the client tries to kick itself, the time at which it happened (well, seconds since epoch) and the message it that it tries to kick you with.

# Script
```lua
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
```

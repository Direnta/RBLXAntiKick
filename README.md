# RBLXAntiKick
Here's a script that prevents the client from kicking itself. This won't work if the server tries to kick you, but most anti exploits kick you from the client anyways (like The Streets or Phantom Forces).
This will tell you when the client tries to kick itself, the time at which it happened (well, seconds since epoch) and the message it that it tries to kick you with.

# Script
```
-- RBLXAnti-Kick
-- Made By Direnta, check out my stuff on https://github.com/Direnta
local b=getrawmetatable or debug.getmetatable local a=make_writeable or setreadonly or changereadonly or change_writeable a(b(game),false)local a=b(game).__namecall b(game).__namecall=function(d,...)local c=({...})[select('#',...)]local b={...}local e={}for a=1,#b-1 do e[a]=b[a]end if c=='Kick'then warn('Kick attempt at '..os.time()..' ('..tostring(unpack(e))..')')return true end return a and a(d,...)or d[c](d,unpack(e))end
```

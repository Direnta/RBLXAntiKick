# RBLXAntiKick
Here's a script that prevents the client from kicking itself. This won't work if the server tries to kick you, but most anti exploits kick you from the client anyways (like The Streets or Phantom Forces).
This will tell you when the client tries to kick itself, the time at which it happened (well, seconds since epoch) and the message it that it tries to kick you with.

# Script
```
-- RBLXAnti-Kick
-- Made By Direnta, check out my stuff on https://github.com/Direnta
local a=getrawmetatable or debug.getmetatable;local b=make_writeable or setreadonly or changereadonly or change_writeable;b(a(game),false)local b=a(game).__namecall;a(game).__namecall=function(c,...)local d=({...})[select('#',...)]local a={...}local e={}for b=1,#a-1 do e[b]=a[b]end;if d=='Kick'then warn('Kick attempt at '..os.time()..' ('..tostring(unpack(e))..')')return true end;return b and b(c,...)or c[d](c,unpack(e))end
```

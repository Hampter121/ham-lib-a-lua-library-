# ham-lib-a-lua-library-


a quick tutorial to set up hamlib in your lua files make a file called "libs" and then in a script type

package.path = package.path .. ";C:/Program Files/lua/libs/?.lua"

and then type
local hamlib = require("hamlib")

and then it works

# example script

package.path = package.path .. ";C:/Program Files/lua/libs/?.lua"


local ham = require("hamlib")

-- Test random functions
ham.pr("Random integer 1-10: " .. ham.rint(1,10))
ham.pr("Random float 0-1: " .. ham.rfloat(0,1))
ham.pr("Random Â±1: " .. ham.rsign())

-- Pick a random element from a table
local colors = {"red","green","blue"}
ham.pr("Random color: " .. ham.trand(colors))

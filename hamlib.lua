-- hamlib 0.3.1
-- by Hampter

local ham = {}


ham.pr = print           
ham.mrand = math.random     
ham.msq = math.sqrt       
ham.sform = string.format   
ham.ssub = string.sub      
ham.slen = string.len    
ham.mflo = math.floor  
ham.mceil  = math.ceil
ham.mabs   = math.abs
ham.mpow   = math.pow
ham.tr = true
ham.fs = false
ham.srev = string.reverse   
ham.slwr = string.lower     
ham.supr = string.upper     
ham.sfind = string.find      
ham.msign  = function(x) return x>0 and 1 or (x<0 and -1 or 0) end
ham.mclamp = function(x,min,max) return x<min and min or (x>max and max or x) end
ham.rsign = function() return math.random(0,1)==0 and -1 or 1 end   
ham.rfloat = function(min,max) return min + (max-min)*math.random() end  
ham.rint = function(min,max) return math.random(min,max) end          
ham.exp   = math.exp
ham.log   = math.log       
ham.log10 = math.log10
ham.deg  = math.deg   
ham.rad  = math.rad   
ham.pi   = math.pi
ham.huge = math.huge
ham.inf  = math.huge   
ham.chance = function(percent) return math.random(1,100) <= percent end
ham.wait = function(seconds)
    local t0 = os.clock()
    while os.clock() - t0 < seconds do end
end
ham.swap = function(a,b) return b,a end
ham.wrap = function(x, min, max)  
    return ((x - min) % (max - min + 1)) + min
end
ham.flip = function(b) return not b end  
ham.iff = function(cond,a,b) return cond and a or b end
ham.timestamp = function() return os.time() end
ham.datefmt = function(fmt) return os.date(fmt) end
ham.osti = os.time
ham.oscl = os.clock
ham.bwait = function(seconds)
    local t0 = ham.oscl()
    while ham.oscl() - t0 < seconds do end
end
ham.timestamp = function(fmt)
    fmt = fmt or "%Y-%m-%d %H:%M:%S"
    return os.date(fmt, ham.osti())
end

-- Table helpers
ham.tlen = function(tbl)
    local c = 0
    for _ in pairs(tbl) do c = c + 1 end
    return c
end

ham.tclone = function(tbl)
    local new = {}
    for k, v in pairs(tbl) do
        new[k] = v
    end
    return new
end

ham.tmerge = function(t1, t2)
    local new = ham.tclone(t1)
    for k, v in pairs(t2) do
        new[k] = v
    end
    return new
end

ham.tcontains = function(tbl, val)
    for _, v in pairs(tbl) do
        if v == val then return true end
    end
    return false
end

ham.tindexof = function(tbl, val)
    for i, v in ipairs(tbl) do
        if v == val then return i end
    end
    return nil
end

ham.tmap = function(tbl, func)
    local new = {}
    for i, v in ipairs(tbl) do
        new[i] = func(v, i)
    end
    return new
end

ham.tfilter = function(tbl, func)
    local new = {}
    for i, v in ipairs(tbl) do
        if func(v, i) then table.insert(new, v) end
    end
    return new
end

ham.trand = function(tbl)
    return tbl[ham.mrand(1, #tbl)]
end

ham.tkeys = function(tbl)
    local keys = {}
    for k, _ in pairs(tbl) do
        table.insert(keys, k)
    end
    return keys
end

ham.tvalues = function(tbl)
    local vals = {}
    for _, v in pairs(tbl) do
        table.insert(vals, v)
    end
    return vals
end









ham.treduce = function(tbl, func, initial)
    local acc = initial
    for i,v in ipairs(tbl) do
        acc = func(acc, v)
    end
    return acc
end

ham.tfind = function(tbl, func)
    for i,v in ipairs(tbl) do
        if func(v,i) then return v end
    end
    return nil
end

ham.tableof = function(...) return {...} end
ham.merge = function(t1,t2)
    local new = {}
    for k,v in pairs(t1) do new[k]=v end
    for k,v in pairs(t2) do new[k]=v end
    return new
end


ham.rbool = function() return math.random(0,1)==1 end
ham.rchoose = function(...)
    local args = {...}
    return args[math.random(1,#args)]
end
ham.roll = function(n) return math.random(1,n) end
ham.chancep = function(p) return math.random(1,100) <= p end


ham.clamp = function(x,min,max) return x<min and min or (x>max and max or x) end
ham.sign = function(x) return x>0 and 1 or (x<0 and -1 or 0) end
ham.mod = function(x,y) return x % y end


ham.rev = string.reverse
ham.up = string.upper
ham.low = string.lower
ham.fmt = string.format


ham.sleep = function(s)
    local t0 = os.clock()
    while os.clock() - t0 < s do end
end
ham.clock = os.clock
ham.time = os.time


return ham
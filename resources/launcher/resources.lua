local launcher = {}
launcher.__index = launcher

function launcher:new(name, priority)
    local resource = {}
    setmetatable(resource, launcher)
    resource.name = name
    resource.priority = priority or 0
    return resource
end

function launcher:launch()
    print("Starting "..self.name)
    Resource.getFromName(self.name):start()
end

-- Resource listesi
local resources = {
    -- isim, sıra/öncelik
    launcher:new("mysql", 1),
    launcher:new("fonts", 2),
    launcher:new("auth", 3),
    launcher:new("save", 4),
    launcher:new("items", 5),
}

table.sort(resources, function(a,b) return a.priority < b.priority end)

for _, resource in ipairs(resources) do
    resource:launch()
end
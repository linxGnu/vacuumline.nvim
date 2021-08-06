local function StaticValue(value)
  return function()
    return value
  end
end

return StaticValue

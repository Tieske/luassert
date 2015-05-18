
describe("Output testing using string comparison with the equal assertion", function()
  local getoutput = function(...)
    local success, message = pcall(assert.are.equal, ...)
    if message == nil then return nil end
    return tostring(message)
  end

  it("Should compare strings correctly; nil-string", function()
    --assert.are.equal(nil, "string")
    local output = getoutput(nil, "string")
    local ok = output:find("Passed in:\n%(string%) 'string'")
    assert(ok, "Output check 1 failed, comparing nil-string;\n    " .. output:gsub("\n","\n    "))
    local ok = output:find("Expected:\n%(nil%)")
    assert(ok, "Output check 2 failed, comparing nil-string;\n    " .. output:gsub("\n","\n    "))
  end)

  it("Should compare strings correctly; nil-string-nil", function()
    --assert.are.equal(nil, "string", nil)
    local output = getoutput(nil, "string", nil)
    local ok = output:find("Passed in:\n%(string%) 'string'")
    assert(ok, "Output check 1 failed, comparing nil-string-nil;\n    " .. output:gsub("\n","\n    "))
    local ok = output:find("Expected:\n%(nil%)")
    assert(ok, "Output check 2 failed, comparing nil-string-nil;\n    " .. output:gsub("\n","\n    "))
  end)

  it("Should compare strings correctly; nil-string-string", function()
    --assert.are.equal(nil, "string", "string")
    local output = getoutput(nil, "string", "string")
    local ok = output:find("Passed in:\n%(string%) 'string'")
    assert(ok, "Output check 1 failed, comparing nil-string-string;\n    " .. output:gsub("\n","\n    "))
    local ok = output:find("Expected:\n%(nil%)")
    assert(ok, "Output check 2 failed, comparing nil-string-string;\n    " .. output:gsub("\n","\n    "))
  end)

  it("Should compare strings correctly; string-nil", function()
    --assert.are.equal("string", nil)
    local output = getoutput("string", nil)
    local ok = output:find("Passed in:\n%(nil%)")
    assert(ok, "Output check 1 failed, comparing string-nil;\n    " .. output:gsub("\n","\n    "))
    local ok = output:find("Expected:\n%(string%) 'string'")
    assert(ok, "Output check 2 failed, comparing string-nil;\n    " .. output:gsub("\n","\n    "))
  end)

  it("Should compare strings correctly; string-nil-nil", function()
    --assert.are.equal("string", nil, nil)
    local output = getoutput("string", nil)
    local ok = output:find("Passed in:\n%(nil%)")
    assert(ok, "Output check 1 failed, comparing string-nil-nil;\n    " .. output:gsub("\n","\n    "))
    local ok = output:find("Expected:\n%(string%) 'string'")
    assert(ok, "Output check 2 failed, comparing string-nil-nil;\n    " .. output:gsub("\n","\n    "))
  end)

  it("Should compare strings correctly; string-string-nil", function()
    --assert.are.equal("string", "string", nil)
    local output = getoutput("string", nil)
    local ok = output:find("Passed in:\n%(nil%)")
    assert(ok, "Output check 1 failed, comparing string-string-nil;\n    " .. output:gsub("\n","\n    "))
    local ok = output:find("Expected:\n%(string%) 'string'")
    assert(ok, "Output check 2 failed, comparing string-string-nil;\n    " .. output:gsub("\n","\n    "))
  end)

  it("Should compare strings correctly; string-nil-string", function()
    --assert.are.equal("string", nil, "string")
    local output = getoutput("string", nil)
    local ok = output:find("Passed in:\n%(nil%)")
    assert(ok, "Output check 1 failed, comparing string-nil-string;\n    " .. output:gsub("\n","\n    "))
    local ok = output:find("Expected:\n%(string%) 'string'")
    assert(ok, "Output check 2 failed, comparing string-nil-string;\n    " .. output:gsub("\n","\n    "))
  end)

end)

describe("Output testing using string comparison with the has_error assertion", function()
  local getoutput = function(...)
    local success, message = pcall(assert.has_error, ...)
    if message == nil then return nil end
    return tostring(message)
  end

  it("Should report no error caught, but error expected; noerror-nil", function()
    --assert.has_error(function() end)
    local output = getoutput(function() end)
    local ok = output:find("Caught:\n%(no error%)")
    assert(ok, "Output check 1 failed, comparing noerror-nil;\n    " .. output:gsub("\n","\n    "))
    local ok = output:find("Expected:\n%(error%)")
    assert(ok, "Output check 2 failed, comparing noerror-nil;\n    " .. output:gsub("\n","\n    "))
  end)

  it("Should report no error caught, but error string expected; noerror-string", function()
    --assert.has_error(function() end, "string")
    local output = getoutput(function() end, 'string')
    local ok = output:find("Caught:\n%(no error%)")
    assert(ok, "Output check 1 failed, comparing noerror-string;\n    " .. output:gsub("\n","\n    "))
    local ok = output:find("Expected:\n%(string%) 'string'")
    assert(ok, "Output check 2 failed, comparing noerror-string;\n    " .. output:gsub("\n","\n    "))
  end)

  it("Should compare error strings correctly; nil-string", function()
    --assert.has_error(function() error() end, "string")
    local output = getoutput(function() error() end, "string")
    local ok = output:find("Caught:\n%(nil%)")
    assert(ok, "Output check 1 failed, comparing nil-string;\n    " .. output:gsub("\n","\n    "))
    local ok = output:find("Expected:\n%(string%) 'string'")
    assert(ok, "Output check 2 failed, comparing nil-string;\n    " .. output:gsub("\n","\n    "))
  end)

  it("Should compare error strings correctly; string-string", function()
    --assert.has_error(function() error("string") end, "string_")
    local output = getoutput(function() error("string") end, "string_")
    local ok = output:find("Caught:\n%(string%) '.*string'")
    assert(ok, "Output check 1 failed, comparing string-string;\n    " .. output:gsub("\n","\n    "))
    local ok = output:find("Expected:\n%(string%) 'string_'")
    assert(ok, "Output check 2 failed, comparing string-string;\n    " .. output:gsub("\n","\n    "))
  end)

  it("Should compare error strings correctly; table-string", function()
    --assert.has_error(function() error({}) end, "string")
    local output = getoutput(function() error({}) end, "string")
    local ok = output:find("Caught:\n%(table%) { }")
    assert(ok, "Output check 1 failed, comparing table-string;\n    " .. output:gsub("\n","\n    "))
    local ok = output:find("Expected:\n%(string%) 'string'")
    assert(ok, "Output check 2 failed, comparing table-string;\n    " .. output:gsub("\n","\n    "))
  end)

  it("Should compare error strings correctly; string-table", function()
    --assert.has_error(function() error("string") end, {})
    local output = getoutput(function() error("string") end, {})
    local ok = output:find("Caught:\n%(string%) 'string'")
    assert(ok, "Output check 1 failed, comparing string-table;\n    " .. output:gsub("\n","\n    "))
    local ok = output:find("Expected:\n%(table%) { }")
    assert(ok, "Output check 2 failed, comparing string-table;\n    " .. output:gsub("\n","\n    "))
  end)

  it("Should compare error objects correctly; table-table", function()
    --assert.has_error(function() error({}) end, { "table" })
    local output = getoutput(function() error({}) end, { "table" })
    local ok = output:find("Caught:\n%(table%) { }")
    assert(ok, "Output check 1 failed, comparing table-table;\n    " .. output:gsub("\n","\n    "))
    local ok = output:find("Expected:\n%(table%) {\n  %[1] = 'table' }")
    assert(ok, "Output check 2 failed, comparing table-table;\n    " .. output:gsub("\n","\n    "))
  end)

end)

describe("Output testing using string comparison with the same assertion", function()
  local getoutput = function(...)
    local success, message = pcall(assert.are.same, ...)
    if message == nil then return nil end
    return tostring(message)
  end

  it("Should compare tables correctly", function()
    -- assert.are.same({1}, {2})
    local output = getoutput({1}, {2})
    local ok = output:find("Passed in:\n(table) {\n *[1] = 2 }", nil, true)
    assert(ok, "Output check 1 failed, comparing table-table;\n    " .. output:gsub("\n","\n    "))
    local ok = output:find("Expected:\n(table) {\n *[1] = 1 }", nil, true)
    assert(ok, "Output check 2 failed, comparing table-table;\n    " .. output:gsub("\n","\n    "))
  end)

  it("Should compare tables correctly and highlight differences", function()
    -- assert.are.same(t1, t2)
    local t1 = {1, {"a", "b", {"foo", "bar"} }, "c"}
    local t2 = {1, {"a", "b", {"bar", "bar"} }, "c"}
    local output = getoutput(t1, t2)
    local ok = output:find("Passed in:\n.*%*%[2].*%*%[3].*%*%[1] = 'bar'\n")
    assert(ok, "Output check 1 failed, comparing table-table;\n    " .. output:gsub("\n","\n    "))
    local ok = output:find("Expected:\n.*%*%[2].*%*%[3].*%*%[1] = 'foo'\n")
    assert(ok, "Output check 2 failed, comparing table-table;\n    " .. output:gsub("\n","\n    "))
  end)

end)

--
-- Created by IntelliJ IDEA.
-- User: Kunkka
-- Date: 5/19/17
-- Time: 13:41
-- To change this template use File | Settings | File Templates.
--

local config = {}

config.supportNodes = {
    { type = "cc.Node", },
    { type = "cc.Sprite", },
    {
        type = "ccui.Scale9Sprite",
        capInsets = cc.rect(0, 0, 0, 0),
    },
    { type = "cc.Label", string = "label", fontFile = { en = "Arial" }, fontSize = 24, },
    { type = "ZoomButton", },
    { type = "SpriteButton", normalSprite = "gk/res/texture/btn_bg.png" },
    { type = "ToggleButton", },
    { type = "CheckBox", normalSprite = "gk/res/texture/check_box_normal.png", selectedSprite = "gk/res/texture/check_box_selected.png" },
    {
        type = "ccui.EditBox",
        normalSprite = "gk/res/texture/edbox_bg.png",
        selectedSprite = "gk/res/texture/edbox_bg.png",
        disabledSprite = "gk/res/texture/edbox_bg.png",
        capInsets = cc.rect(20, 20, 20, 20),
        width = 200,
        height = 45,
    },
    {
        type = "cc.Layer",
        width = "$fill",
        height = "$fill",
    },
    {
        type = "cc.LayerColor",
        width = "$fill",
        height = "$fill",
        color = cc.c4b(153, 153, 153, 255),
    },
    {
        type = "cc.LayerGradient",
        width = "$fill",
        height = "$fill",
        startColor = cc.c4b(0, 0, 0, 255),
        endColor = cc.c4b(255, 255, 255, 255),
    },
    {
        type = "cc.ScrollView",
        _fold = true,
        width = 200,
        height = 500,
        _fold = true,
        viewSize = cc.size(200, 300),
    },
    {
        type = "cc.TableView",
        _fold = true,
        width = 200,
        height = 500,
        _fold = true,
        viewSize = cc.size(200, 300),
    },
    { type = "cc.ClippingNode" },
    { type = "cc.ClippingRectangleNode", clippingRegion = cc.rect(0, 0, 100, 100), },
    {
        type = "cc.ProgressTimer",
        sprite = { file = "", type = "cc.Sprite", _voidContent = true, _lock = 1 },
    },
    {
        type = "cc.TMXTiledMap",
        tmx = "gk/res/data/default.tmx",
    },
    {
        type = "cc.ParticleSystemQuad",
        particle = "gk/res/particle/Galaxy.plist",
    },
}

-- defValues, not modified properties, will not be saved, minimize gen file size
config.defValues = {
    _isWidget = false,
    _voidContent = false,
    _lock = 1,
    _fold = false,
    scaleX = "1",
    scaleY = "1",
    skewX = 0,
    skewY = 0,
    rotation = 0,
    opacity = 255,
    scaleXY = { x = "1", y = "1" },
    scaleSize = { w = "1", h = "1" },
    scaleViewSize = { w = "1", h = "1" },
    scaleOffset = { x = "1", y = "1" },
    localZOrder = 0,
    tag = -1,
    visible = 0,
    cascadeOpacityEnabled = 1,
    cascadeColorEnabled = 1,
    --    centerRect = cc.rect(0, 0, 0, 0),
    -- Dialog
    popOnTouchOutsideBg = 1,
    popOnTouchInsideBg = 1,
    -- cc.LayerGradient
    compressedInterpolation = 0,
    GLProgram = "ShaderPositionTextureColor_noMVP",
    selectedGLProgram = "ShaderPositionTextureColor_noMVP",
    disabledGLProgram = "ShaderPositionTextureColor_noMVP",

    -- scrollView
    bounceable = 0,
    clipToBD = 0,
    direction = 2,
    touchEnabled = 0,
    -- label
    additionalKerning = 0,
    enableBold = 1,
    enableGlow = 1,
    enableItalics = 1,
    enableOutline = 1,
    enableShadow = 1,
    enableStrikethrough = 1,
    enableUnderline = 1,
    vAlign = 0,
    hAlign = 0,
    lineHeight = -1,
    overflow = 0,
    outlineSize = 0,
    enableWrap = 0,
    lineBreakWithoutSpace = 1,
    shadow = {
        a = 0,
        b = 0,
        g = 0,
        h = 0,
        r = 0,
        radius = 0,
        w = 0
    },
    textColor = {
        a = 255,
        b = 255,
        g = 255,
        r = 255,
    },
    effectColor = {
        a = 255,
        b = 0,
        g = 0,
        r = 0
    },
    onClicked = "-",
    onSelectChanged = "-",
    onEnableChanged = "-",
    onLongPressed = "-",
    onSelectedTagChanged = "-",
}

config.macroFuncs = {
    -- Scale
    minScale = function() return gk.display:minScale() end,
    maxScale = function() return gk.display:maxScale() end,
    xScale = function() return gk.display:xScale() end,
    yScale = function() return gk.display:yScale() end,
    scaleX = function(key, node, ...) return gk.display:scaleX(...) end,
    scaleY = function(key, node, ...) return gk.display:scaleY(...) end,
    scaleXRvs = function(key, node, ...) return gk.display:scaleXRvs(...) end,
    scaleYRvs = function(key, node, ...) return gk.display:scaleYRvs(...) end,
    scaleTP = function(key, node, ...) return gk.display:scaleTP(...) end,
    scaleBT = function(key, node, ...) return gk.display:scaleBT(...) end,
    scaleLT = function(key, node, ...) return gk.display:scaleLT(...) end,
    scaleRT = function(key, node, ...) return gk.display:scaleRT(...) end,
    ["win.w"] = function() return gk.display:winSize().width end,
    ["win.h"] = function() return gk.display:winSize().height end,
    -- contentSize, ViewSize
    fill = function(key, node)
        local parent = node:getParent()
        if not parent and node.__info and node.__info.parentId and node.__rootTable then
            parent = node.__rootTable[node.__info.parentId]
        end
        return parent and parent:getContentSize()[key] or gk.display:winSize()[key]
    end,
}

config.editableProps = {
    type = {
        getter = function(node) return node.__cname or tolua.type(node) end,
    },
    -- cc.Node
    x = {
        getter = function(node) return 0 end,
        setter = function(node, x)
            local x = gk.generator:parseX(node, x, node.__info.scaleXY.x)
            node:setPositionX(x)
        end
    },
    y = {
        getter = function(node) return 0 end,
        setter = function(node, y)
            local y = gk.generator:parseY(node, y, node.__info.scaleXY.y)
            node:setPositionY(y)
        end
    },
    scaleXY = {
        getter = function(_) return { x = "1", y = "1" } end,
        setter = function(node, var)
            local x = gk.generator:parseX(node, node.__info.x, var.x)
            local y = gk.generator:parseY(node, node.__info.y, var.y)
            node:setPosition(x, y)
        end
    },
    width = {
        getter = function(node)
            if gk.util:instanceof(node, "cc.Label") then
                return node:getWidth()
            else
                return node:getContentSize().width
            end
        end,
        setter = function(node, var)
            if gk.util:instanceof(node, "Button") or (gk.util:instanceof(node, "cc.Sprite") and not gk.util:instanceof(node, "ccui.Scale9Sprite")) or gk.util:instanceof(node, "TableView") then
                return
            end
            local width = gk.generator:parseValue("width", node, var)
            local ss = node.__info.scaleSize
            local scaleW = gk.generator:parseValue("w", node, ss.w)
            width = width * scaleW
            if gk.util:instanceof(node, "cc.Label") then
                node:setWidth(width)
            else
                local size = node:getContentSize()
                size.width = width
                node:setContentSize(size)
            end
            gk.generator:updateSize(node, "width")
        end
    },
    height = {
        getter = function(node)
            if gk.util:instanceof(node, "cc.Label") then
                return node:getHeight()
            else
                return node:getContentSize().height
            end
        end,
        setter = function(node, var)
            if gk.util:instanceof(node, "Button") or (gk.util:instanceof(node, "cc.Sprite") and not gk.util:instanceof(node, "ccui.Scale9Sprite")) or gk.util:instanceof(node, "TableView") then
                return
            end
            if gk.util:instanceof(node, "cc.Label") and node.__info.overflow == 3 then
                return
            end
            local height = gk.generator:parseValue("height", node, var)
            local ss = node.__info.scaleSize
            local scaleH = gk.generator:parseValue("h", node, ss.h)
            height = height * scaleH
            if gk.util:instanceof(node, "cc.Label") then
                node:setHeight(height)
            else
                local size = node:getContentSize()
                size.height = height
                node:setContentSize(size)
            end
            gk.generator:updateSize(node, "height")
        end
    },
    scaleSize = {
        getter = function(_) return { w = "1", h = "1" } end,
        setter = function(node, var)
            if gk.util:instanceof(node, "Button") or (gk.util:instanceof(node, "cc.Sprite") and not gk.util:instanceof(node, "ccui.Scale9Sprite")) or gk.util:instanceof(node, "TableView") then
                return
            end
            local w = gk.generator:parseValue("width", node, node.__info.width)
            local h = gk.generator:parseValue("height", node, node.__info.height)
            if not w or not h then
                return
            end
            local scaleW = gk.generator:parseValue("w", node, var.w)
            local scaleH = gk.generator:parseValue("h", node, var.h)
            local size = cc.size(w * scaleW, h * scaleH)
            if gk.util:instanceof(node, "cc.Label") then
                node:setDimensions(size.width, size.height)
            else
                node:setContentSize(size)
            end
            gk.generator:updateSize(node, "width")
            gk.generator:updateSize(node, "height")
        end
    },
    scaleViewSize = {
        getter = function(_) return { w = "1", h = "1" } end,
        setter = function(node, var)
            local vs = node.__info.viewSize
            local w = gk.generator:parseValue("width", node, vs.width)
            local h = gk.generator:parseValue("height", node, vs.height)
            if not w or not h then
                return
            end
            local scaleW = gk.generator:parseValue("w", node, var.w)
            local scaleH = gk.generator:parseValue("h", node, var.h)
            node:setViewSize(cc.size(w * scaleW, h * scaleH))
            if gk.util:instanceof(node, "cc.TableView") then
                node:reloadData()
            end
        end
    },
    -- cc.Sprite
    file = {
        getter = function(_) return "" end,
        setter = function(node, var)
            if gk.util:instanceof(node, "ccui.Scale9Sprite") then
                local sf = gk.create_sprite_frame(var)
                if not node.__info.capInsets or node.__info.capInsets.width == 0 or node.__info.capInsets.height == 0 then
                    local rect = sf:getRect()
                    node.__info.capInsets = cc.rect(rect.width / 3, rect.height / 3, rect.width / 3, rect.height / 3)
                end
                node:setSpriteFrame(sf, node.__info.capInsets)
                -- need refresh ...
                node.__info.width, node.__info.height = node.__info.width, node.__info.height
            else
                node:setSpriteFrame(gk.create_sprite_frame(var))
            end
        end
    },
    -- cc.Label
    string = {
        getter = function(node) return node:getString() end,
        setter = function(node, var)
            local value = var
            if value:len() > 0 and value:sub(1, 1) == "@" then
                value = gk.resource:getString(value:sub(2, #value))
            end
            node:setString(value)
        end
    },
    lineHeight = {
        getter = function(node) return -1 end,
        setter = function(node, var)
            if not gk.isSystemFont(node.__info.fontFile[gk.resource:getCurrentLan()]) then
                if var > 0 then
                    node:setLineHeight(var)
                end
            end
        end
    },
    fontFile = {
        getter = function(node) return {} end,
        setter = function(node, var)
            -- recreate node
            local lan = gk.resource:getCurrentLan()
            local fontFile = var[lan]
            gk.log("set fontFile_%s %s", lan, fontFile)
            if gk.isTTF(fontFile) then
                local config = node:getTTFConfig()
                config.fontFilePath = fontFile
                config.fontSize = node.__info.fontSize
                node:setTTFConfig(config)
            elseif gk.isBMFont(fontFile) then
                node:setBMFontFilePath(fontFile, cc.p(0, 0), node.__info.fontSize)
            else
                node:setSystemFontName(fontFile)
                node:setSystemFontSize(node.__info.fontSize)
            end
        end
    },
    fontSize = {
        getter = function(node)
            if gk.util:instanceof(node, "ccui.EditBox") then
                return node:getFontSize()
            else
                return 24
            end
        end,
        setter = function(node, var)
            if gk.util:instanceof(node, "ccui.EditBox") then
                node:setFontSize(var)
                return
            end
            local lan = gk.resource:getCurrentLan()
            local fontFile = node.__info.fontFile[lan]
            if gk.isTTF(fontFile) then
                local config = node:getTTFConfig()
                config.fontSize = var
                node:setTTFConfig(config)
            elseif gk.isBMFont(fontFile) then
                node:setBMFontSize(var)
            else
                node:setSystemFontSize(var)
            end
        end
    },
    textColor = {
        getter = function(node)
            local lan = gk.resource:getCurrentLan()
            local fontFile = node.__info.fontFile[lan]
            return not gk.isBMFont(fontFile) and node:getTextColor()
        end,
        setter = function(node, var)
            local lan = gk.resource:getCurrentLan()
            local fontFile = node.__info.fontFile[lan]
            if not gk.isBMFont(fontFile) then
                node:setTextColor(var)
            end
        end
    },
    additionalKerning = {
        getter = function(node)
            return not gk.isSystemFont(node.__info.fontFile[gk.resource:getCurrentLan()]) and node:getAdditionalKerning()
        end,
        setter = function(node, var)
            local lan = gk.resource:getCurrentLan()
            local fontFile = node.__info.fontFile[lan]
            if gk.isTTF(fontFile) then
                node:setAdditionalKerning(var)
            elseif gk.isBMFont(fontFile) then
                node:setAdditionalKerning(var)
            else
            end
        end
    },
    enableWrap = {
        getter = function(node) return node:isWrapEnabled() and 0 or 1 end,
        setter = function(node, var) node:enableWrap(var == 0) end
    },
    lineBreakWithoutSpace = {
        getter = function(node) return false end,
        setter = function(node, var) node:setLineBreakWithoutSpace(var == 0) end
    },
    enableShadow = {
        getter = function(node) return false end,
        setter = function(node, var)
            if var == 0 then
                local shadow = node.__info.shadow
                if shadow then
                    node:enableShadow(cc.c4b(shadow.r, shadow.g, shadow.b, shadow.a), cc.size(shadow.w, shadow.h), shadow.radius)
                end
            else
                node:disableEffect(cc.LabelEffect.SHADOW)
            end
        end
    },
    shadow = {
        getter = function(node)
            local color = node:getShadowColor()
            local size = node:getShadowOffset()
            local radius = node:getShadowBlurRadius()
            return { r = color.r * 255, g = color.g * 255, b = color.b * 255, a = color.a * 255, w = size.width, h = size.height, radius = radius }
        end,
        setter = function(node, var)
            if node.__info.enableShadow == 0 then
                node:enableShadow(cc.c4b(var.r, var.g, var.b, var.a), cc.size(var.w, var.h), var.radius)
            end
        end
    },
    enableOutline = {
        getter = function(node) return false end,
        setter = function(node, var)
            if var == 0 then
                node.__info.enableGlow = 1
                node:enableOutline(node.__info.effectColor, node.__info.outlineSize)
            else
                node:disableEffect(cc.LabelEffect.OUTLINE)
            end
        end
    },
    enableGlow = {
        getter = function(node) return false end,
        setter = function(node, var)
            if var == 0 then
                node.__info.enableOutline = 1
                gk.log("enableGlow")
                node:enableGlow(node.__info.effectColor)
            else
                --            gk.log("disableEffect")
                node:disableEffect(cc.LabelEffect.GLOW)
            end
        end
    },
    outlineSize = {
        getter = function(node) return node:getOutlineSize() end,
        setter = function(node, var)
            if node.__info.enableOutline == 0 then
                node:enableOutline(node.__info.effectColor, var)
            end
        end
    },
    effectColor = {
        getter = function(node)
            local color = node:getEffectColor()
            return { r = color.r * 255, g = color.g * 255, b = color.b * 255, a = color.a * 255 }
        end,
        setter = function(node, var)
            if node.__info.enableOutline == 0 then
                local outlineSize = node.__info.outlineSize
                node:enableOutline(var, outlineSize)
            elseif node.__info.enableGlow == 0 then
                node:enableGlow(var)
            end
        end
    },
    enableItalics = {
        getter = function(node) return false end,
        setter = function(node, var)
            if var == 0 then
                node:enableItalics()
            else
                node:disableEffect(4)
            end
        end
    },
    enableBold = {
        getter = function(node) return false end,
        setter = function(node, var)
            if var == 0 then
                node:enableBold()
            else
                node:disableEffect(5)
            end
        end
    },
    enableUnderline = {
        getter = function(node) return false end,
        setter = function(node, var)
            if var == 0 then
                node:enableUnderline()
            else
                node:disableEffect(6)
            end
        end
    },
    enableStrikethrough = {
        getter = function(node) return false end,
        setter = function(node, var)
            if var == 0 then
                node:enableStrikethrough()
            else
                node:disableEffect(7)
            end
        end
    },
    -- cc.ScrollView
    viewSize = {
        getter = function(node) return node:getViewSize() end,
        setter = function(node, var)
            local w = gk.generator:parseValue("width", node, var.width)
            local h = gk.generator:parseValue("height", node, var.height)
            local ss = node.__info.scaleSize
            local scaleW = gk.generator:parseValue("w", node, ss.w)
            local scaleH = gk.generator:parseValue("h", node, ss.h)
            node:setViewSize(cc.size(w * scaleW, h * scaleH))
            if gk.util:instanceof(node, "cc.TableView") then
                node:reloadData()
            end
        end
    },
    -- ccui.Scale9Sprite, ccui.EditBox
    capInsets = {
        getter = function(_) return cc.rect(0, 0, 0, 0) end,
        setter = function(node, var)
            if gk.util:instanceof(node, "ccui.Scale9Sprite") then
                node:setCapInsets(var)
            end
        end
    },
    -- ccui.EditBox, SpriteButton, CheckBox
    normalSprite = {
        getter = function(_) return "" end,
        setter = function(node, var)
            if gk.util:instanceof(node, "SpriteButton") then
                node:setNormalSprite(var)
                gk.event:post("displayNode", node)
            end
        end
    },
    selectedSprite = {
        getter = function(_) return "" end,
        setter = function(node, var)
            if gk.util:instanceof(node, "SpriteButton") then
                node:setSelectedSprite(var)
            end
        end
    },
    disabledSprite = {
        getter = function(_) return "" end,
        setter = function(node, var)
            if gk.util:instanceof(node, "SpriteButton") then
                node:setDisabledSprite(var)
            end
        end
    },
    -- cc.ScrollView
    contentOffset = {
        getter = function(node) return node:getContentOffset() end,
        setter = function(node, var)
            local w = gk.generator:parseValue("x", node, var.x)
            local h = gk.generator:parseValue("y", node, var.y)
            local ss = node.__info.scaleOffset
            local scaleW = gk.generator:parseValue("x", node, ss.x)
            local scaleH = gk.generator:parseValue("y", node, ss.y)
            local offset = cc.p(w * scaleW, h * scaleH)
            node:setContentOffset(offset)
        end
    },
    scaleOffset = {
        getter = function(_) return { x = "1", y = "1" } end,
        setter = function(node, var)
            local ss = node.__info.contentOffset
            local w = gk.generator:parseValue("x", node, ss.x)
            local h = gk.generator:parseValue("y", node, ss.y)
            local scaleW = gk.generator:parseValue("x", node, var.x)
            local scaleH = gk.generator:parseValue("y", node, var.y)
            local offset = cc.p(w * scaleW, h * scaleH)
            node:setContentOffset(offset)
        end
    },
    -- cc.ParticleSystemQuad
    displayFrame = {
        getter = function(_) return "" end,
        setter = function(node, var)
            if var and var ~= "" then
                node:setDisplayFrame(gk.create_sprite_frame(var))
            end
        end
    },
    autoRemoveOnFinish = {
        getter = function(node) return node:isAutoRemoveOnFinish() end,
        setter = function(node, var)
            if gk.mode ~= gk.MODE_EDIT then
                node:setAutoRemoveOnFinish(var == 0)
            end
        end
    },
    -- GLProgram(shader)
    GLProgram = {
        getter = function(node) return "ShaderPositionTextureColor_noMVP" end,
        setter = function(node, var)
            if var and var ~= "" then
                local program = cc.GLProgramState:getOrCreateWithGLProgramName(var)
                if program then
                    node:setGLProgramState(program)
                else
                    gk.log("error, getOrCreateWithGLProgramName --> %s, return nil", var)
                end
            end
        end
    },
}

function config:registerProp(key, alias)
    local alias = alias or (string.upper(key:sub(1, 1)) .. key:sub(2, key:len()))
    config.editableProps[key] = {
        getter = function(node) return node["get" .. alias](node) end,
        setter = function(node, var)
            local v = gk.generator:parseValue(key, node, var)
            node["set" .. alias](node, v)
        end
    }
end

function config:registerStringProp(key, alias)
    local alias = alias or (string.upper(key:sub(1, 1)) .. key:sub(2, key:len()))
    config.editableProps[key] = {
        getter = function(node) return node["get" .. alias](node) end,
        setter = function(node, var)
            local v = gk.generator:parseValue(key, node, var)
            node["set" .. alias](node, v)
        end
    }
end

function config:registerFloatProp(key, alias)
    local alias = alias or (string.upper(key:sub(1, 1)) .. key:sub(2, key:len()))
    config.editableProps[key] = {
        getter = function(node) return math.shrink(node["get" .. alias](node), 3) end,
        setter = function(node, var)
            local v = gk.generator:parseValue(key, node, var)
            node["set" .. alias](node, v)
        end
    }
end

function config:registerBoolProp(key, alias)
    local alias = alias or (string.upper(key:sub(1, 1)) .. key:sub(2, key:len()))
    config.editableProps[key] = {
        getter = function(node) return node["is" .. alias](node) and 0 or 1 end,
        setter = function(node, var) node["set" .. alias](node, var == 0) end
    }
end

function config:registerFuncProp(key)
    config.editableProps[key] = {
        getter = function(node) return "-" end,
        setter = function(node, var)
            local func, macro = gk.generator:parseCustomMacroFunc(node, var)
            if func then
                node[key](node, function(...)
                    gk.log("[%s] %s", node.__rootTable.__cname, macro)
                    func(node.__rootTable, ...)
                end)
            end
        end
    }
end

function config:registerScriptHandler(key, handler)
    config.editableProps[key] = {
        getter = function(node) return "-" end,
        setter = function(node, var)
            local func, macro = gk.generator:parseCustomMacroFunc(node, var)
            if func then
                node:registerScriptHandler(function(...)
                    return func(node.__rootTable, ...)
                end, handler)
            end
        end
    }
end

function config:registerPlaneProp(key, default)
    config.editableProps[key] = {
        getter = function(node) return default end,
        setter = function(node, var) end
    }
end

function config:registerDefaultGetterProp(key, defaultValue)
    config.editableProps[key] = {
        getter = function(_) return defaultValue end,
    }
end

config:registerPlaneProp("_isWidget", false)
config:registerPlaneProp("_voidContent", false)
config:registerPlaneProp("_lock", 1)
config:registerPlaneProp("_fold", false)
config:registerPlaneProp("parentId", "")
config:registerPlaneProp("id", "")

-- cc.Node
config:registerProp("anchor", "AnchorPoint")
config:registerBoolProp("ignoreAnchor", "IgnoreAnchorPointForPosition")
config:registerFloatProp("scaleX")
config:registerFloatProp("scaleY")
config:registerFloatProp("skewX")
config:registerFloatProp("skewY")
config:registerFloatProp("rotation")
config:registerProp("opacity")
config:registerProp("localZOrder")
config:registerProp("tag")
config:registerProp("color")
config:registerBoolProp("cascadeOpacityEnabled")
config:registerBoolProp("cascadeColorEnabled")
config:registerBoolProp("visible")

-- cc.Sprite
config:registerProp("blendFunc")
--config:registerProp("centerRect") -- for slice
-- cc.Sprite, ccui.Scale9Sprite
config:registerBoolProp("flippedX")
-- ccui.Scale9Sprite
config:registerBoolProp("flippedY")
config:registerProp("renderingType")
config:registerProp("state")

-- Button
config:registerFuncProp("onClicked")
config:registerFuncProp("onSelectChanged")
config:registerFuncProp("onEnableChanged")
config:registerFuncProp("onLongPressed")
config:registerBoolProp("enabled")
config:registerProp("clickedSid")
config:registerProp("selectedGLProgram")
config:registerProp("disabledGLProgram")
config:registerBoolProp("cascadeGLProgramEnabled")

-- ZoomButton
config:registerProp("zoomScale")
config:registerBoolProp("zoomEnabled")
-- ToggleButton
config:registerFuncProp("onSelectedTagChanged")
config:registerProp("selectedTag")
config:registerBoolProp("autoToggle")

-- cc.Layer, cc.Dialog
config:registerBoolProp("swallowTouches")
config:registerBoolProp("enableKeyPad")
config:registerBoolProp("popOnBack")
-- cc.Layer, cc.Dialog, cc.ScrollView
config:registerBoolProp("touchEnabled")
-- cc.Dialog
config:registerBoolProp("popOnTouchOutsideBg")
config:registerBoolProp("popOnTouchInsideBg")
-- cc.LayerGradient
config:registerProp("startColor")
config:registerProp("endColor")
config:registerProp("startOpacity")
config:registerProp("endOpacity")
config:registerProp("vector")
config:registerBoolProp("compressedInterpolation")
-- ccui.Layout
--config:registerProp("layoutType")

-- cc.Label
config:registerProp("hAlign", "HorizontalAlignment")
config:registerProp("vAlign", "VerticalAlignment")
config:registerProp("overflow")

-- cc.ScrollView, cc.TableView
config:registerProp("direction")
config:registerBoolProp("clipToBD", "ClippingToBounds")
config:registerBoolProp("bounceable")
config:registerScriptHandler("didScroll", cc.SCROLLVIEW_SCRIPT_SCROLL)

-- cc.TableView
config:registerProp("verticalFillOrder")
config:registerScriptHandler("cellNums", cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
config:registerScriptHandler("cellSizeForIndex", cc.TABLECELL_SIZE_FOR_INDEX)
config:registerScriptHandler("cellAtIndex", cc.TABLECELL_SIZE_AT_INDEX)
config:registerScriptHandler("cellTouched", cc.TABLECELL_TOUCHED)

-- cc.ClippingNode
config:registerBoolProp("inverted")
config:registerProp("alphaThreshold")
-- cc.ClippingRectangleNode
config:registerProp("clippingRegion")
config:registerBoolProp("clippingEnabled")
-- cc.ProgressTimer
config:registerProp("barType", "Type")
config:registerProp("percentage")
config:registerBoolProp("reverseDirection")
config:registerProp("midpoint")
config:registerProp("barChangeRate")

-- CheckBox
config:registerBoolProp("selected")

-- ccui.EditBox
config:registerProp("text")
config:registerProp("placeHolder")
config:registerFloatProp("placeholderFontSize")
config:registerFloatProp("maxLength")
config:registerProp("textHAlign", "TextHorizontalAlignment")
config:registerProp("inputMode")
config:registerProp("inputFlag")
config:registerProp("returnType")

-- cc.TMXTiledMap
config:registerPlaneProp("tmx")

-- cc.ParticleSystemQuad
config:registerPlaneProp("particle")
config:registerStringProp("totalParticles")
config:registerProp("gravity")
config:registerBoolProp("blendAdditive")
config:registerFloatProp("duration")
config:registerProp("emitterMode")
config:registerProp("positionType")

function config:getDefaultValue(node, key)
    local prop = config.editableProps[key]
    if prop then
        -- must clone value
        return clone(prop.getter(node))
    end
    gk.log("[Error] config:getDefaultValue, not registered prop, type = %s, prop = %s", node and node.__info.type or "?", key)
    return nil
end

function config:setValue(node, key, value)
    local prop = config.editableProps[key]
    if prop and prop.setter then
        -- must clone value
        prop.setter(node, value)
    else
        -- some props do not have setter
    end
end

return config
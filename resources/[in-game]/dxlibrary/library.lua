_functions = [[
    screen = Vector2(guiGetScreenSize())
    tick = getTickCount()

    function isInBox(x, y, w, h, type)
       if isCursorShowing() then
            local cx, cy = getCursorPosition()
            cx, cy = cx*screen.x, cy*screen.y
            if (cx >= x and cx <= x+w and cy >= y and cy <= y+h) then
                if type then
                    exports.cursor:setPointer(type)
                end
                return true
            end
       end
       return false
    end

    function dxDrawShadowedText(text, leftX, topY, rightX, bottomY, color, scale, font, ...)
        local black = tocolor(5, 5, 5, 155)
        dxDrawText(text, leftX+1, topY, rightX+1, bottomY, black, scale, font, ...)
        dxDrawText(text, leftX-1, topY, rightX-1, bottomY, black, scale, font, ...)
        dxDrawText(text, leftX, topY+1, rightX, bottomY+1, black, scale, font, ...)
        dxDrawText(text, leftX, topY-1, rightX, bottomY-1, black, scale, font, ...)
        dxDrawText(text, leftX, topY, rightX, bottomY, color, scale, font, ...)
    end

    function dxDrawRoundedRectangle(x, y, width, height, radius, color)
        local diameter = radius * 2
        dxDrawCircle(x + radius, y + radius, radius, 180, 270, color)
        dxDrawCircle(x + width - radius, y + radius, radius, 270, 360, color)
        dxDrawCircle(x + radius, y + height - radius, radius, 90, 180, color)
        dxDrawCircle(x + width - radius, y + height - radius, radius, 0, 90, color)
        dxDrawRectangle(x + radius, y, width - diameter, height, color)
        dxDrawRectangle(x, y + radius, radius, height - diameter, color)
        dxDrawRectangle(x + width - radius, y + radius, radius, height - diameter, color)
        dxDrawRectangle(x + radius, y + radius, width - diameter, height - diameter, tocolor(0, 0, 0, 0))
    end
	
    function dxDrawOuterBorder(x, y, w, h, borderSize, borderColor, postGUI)
       borderSize = borderSize or 2
       borderColor = borderColor or tocolor(0, 0, 0, 255)
       dxDrawRectangle(x - borderSize, y - borderSize, w + (borderSize * 2), borderSize, borderColor, postGUI)
       dxDrawRectangle(x, y + h, w, borderSize, borderColor, postGUI)
       dxDrawRectangle(x - borderSize, y, borderSize, h + borderSize, borderColor, postGUI)
       dxDrawRectangle(x + w, y, borderSize, h + borderSize, borderColor, postGUI)
    end
	
    function isClicked()
       if getKeyState("mouse1") and tick < getTickCount() then 
	  tick = getTickCount()+500 
	  return true
       end
       return false
    end

]]

--// assert(loadstring(exports.dxlibrary:loadFunctions()))()
function loadFunctions()
    return _functions
end

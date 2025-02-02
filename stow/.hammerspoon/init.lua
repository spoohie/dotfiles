-- Hammerspoon script to swap all windows between two external monitors

-- Function to swap windows between two external screens with smooth animation
local function swapWindowsBetweenExternalScreens()
    local externalScreens = hs.fnutils.filter(hs.screen.allScreens(), function(screen)
        return screen:name() ~= "Built-in Retina Display"
    end)
    
    if #externalScreens ~= 2 then
        hs.alert.show("Exactly two external monitors are required")
        return
    end

    local screen1, screen2 = externalScreens[1], externalScreens[2]

    
    local windowsOnScreen1 = hs.fnutils.filter(hs.window.visibleWindows(), function(win)
        return win:screen() == screen1 and (win:application():name() == "Google Chrome" or win:application():name() == "Firefox" or win:application():name() == "Cursor")
    end)
    local windowsOnScreen2 = hs.fnutils.filter(hs.window.visibleWindows(), function(win)
        return win:screen() == screen2 and (win:application():name() == "Google Chrome" or win:application():name() == "Firefox" or win:application():name() == "Cursor")
    end)

    local animationDuration = 0.3 -- Set animation duration for smooth transition

    -- Store window positions before moving
    local windowsToMove1 = {}
    local windowsToMove2 = {}
    
    for _, win in ipairs(windowsOnScreen1) do
        table.insert(windowsToMove1, win)
    end
    for _, win in ipairs(windowsOnScreen2) do
        table.insert(windowsToMove2, win)
    end

    -- Perform the moves
    for _, win in ipairs(windowsToMove1) do
        win:moveToScreen(screen2, true, true, animationDuration)
    end
    for _, win in ipairs(windowsToMove2) do
        win:moveToScreen(screen1, true, true, animationDuration)
    end

    -- Clean up after animation completes
    hs.timer.doAfter(animationDuration + 0.1, function()
        for _, win in ipairs(windowsToMove1) do
            win:focus()
        end
        for _, win in ipairs(windowsToMove2) do
            win:focus()
        end
        -- Force desktop refresh
        hs.window.desktop():focus()
    end)
end

-- Bind the function to a hotkey (Ctrl + Alt + Cmd + S)
hs.hotkey.bind({"ctrl", "cmd"}, "S", swapWindowsBetweenExternalScreens)


-- -- version with resizing windows for different screen sizes
-- -- Function to swap windows between two external screens with smooth animation
-- local function swapWindowsBetweenExternalScreens()
--     print(hs.inspect(hs.screen.allScreens()))
--     local externalScreens = hs.fnutils.filter(hs.screen.allScreens(), function(screen)
--         return screen:name() ~= "Built-in Retina Display"
--     end)
    
--     if #externalScreens ~= 2 then
--         hs.alert.show("Exactly two external monitors are required")
--         return
--     end

--     local screen1, screen2 = externalScreens[1], externalScreens[2]
--     local windowsOnScreen1 = hs.fnutils.filter(hs.window.visibleWindows(), function(win)
--         return win:screen() == screen1
--     end)
--     local windowsOnScreen2 = hs.fnutils.filter(hs.window.visibleWindows(), function(win)
--         return win:screen() == screen2
--     end)

--     local animationDuration = 0.15  -- Reduced from 0.3 to 0.15 for snappier response

--     -- Store window positions before moving
--     local windowsToMove1 = {}
--     local windowsToMove2 = {}
    
--     -- Calculate screen ratios for proportional resizing
--     local screen1Frame = screen1:frame()
--     local screen2Frame = screen2:frame()
--     local widthRatio1to2 = screen2Frame.w / screen1Frame.w
--     local heightRatio1to2 = screen2Frame.h / screen1Frame.h
--     local widthRatio2to1 = screen1Frame.w / screen2Frame.w
--     local heightRatio2to1 = screen1Frame.h / screen2Frame.h
    
--     for _, win in ipairs(windowsOnScreen1) do
--         table.insert(windowsToMove1, {
--             window = win,
--             frame = win:frame()
--         })
--     end
--     for _, win in ipairs(windowsOnScreen2) do
--         table.insert(windowsToMove2, {
--             window = win,
--             frame = win:frame()
--         })
--     end

--     -- Move windows with optimized timing
--     for _, winInfo in ipairs(windowsToMove1) do
--         local win = winInfo.window
--         local oldFrame = winInfo.frame
--         local relativeX = (oldFrame.x - screen1Frame.x) / screen1Frame.w
--         local relativeY = (oldFrame.y - screen1Frame.y) / screen1Frame.h
        
--         -- Combine move and resize into a single operation
--         local newFrame = {
--             w = oldFrame.w * widthRatio1to2,
--             h = oldFrame.h * heightRatio1to2,
--             x = screen2Frame.x + (relativeX * screen2Frame.w),
--             y = screen2Frame.y + (relativeY * screen2Frame.h)
--         }
        
--         win:moveToScreen(screen2)  -- Instant move without animation
--         win:setFrame(newFrame, animationDuration)  -- Single smooth animation
--     end
    
--     -- Small delay before moving second group of windows
--     hs.timer.doAfter(0.05, function()
--         for _, winInfo in ipairs(windowsToMove2) do
--             local win = winInfo.window
--             local oldFrame = winInfo.frame
--             local relativeX = (oldFrame.x - screen2Frame.x) / screen2Frame.w
--             local relativeY = (oldFrame.y - screen2Frame.y) / screen2Frame.h
            
--             local newFrame = {
--                 w = oldFrame.w * widthRatio2to1,
--                 h = oldFrame.h * heightRatio2to1,
--                 x = screen1Frame.x + (relativeX * screen1Frame.w),
--                 y = screen1Frame.y + (relativeY * screen1Frame.h)
--             }
            
--             win:moveToScreen(screen1)  -- Instant move without animation
--             win:setFrame(newFrame, animationDuration)  -- Single smooth animation
--         end
        
--         -- Cleanup after all animations complete
--         hs.timer.doAfter(animationDuration + 0.1, function()
--             for _, win in ipairs(windowsToMove1) do
--                 win:focus()
--             end
--             for _, win in ipairs(windowsToMove2) do
--                 win:focus()
--             end
--             -- Force desktop refresh
--             hs.window.desktop():focus()
--         end)
--     end)
-- end
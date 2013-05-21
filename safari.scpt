#!/usr/bin/env osascript

-- Open new window to google play music
on openWindow()
  tell application "Safari" to open location "http://play.google.com/music"
end openWindow

-- Does action to google play music window.
-- Returns true if google play music window is open, false otherwise
on sendAction(action)
  tell application "Safari"
    -- Pause the track
    repeat with w in (every window)
      repeat with t in (every tab whose URL contains "play.google.com/music") of w
        tell t to do JavaScript "SJBpost('" & action & "');"
        return true
      end repeat
    end repeat
  end tell
  return false
end sendAction

on run argv
  set action to "playPause"
  if count of argv is greater than 0 then
    set action to item 1 of argv
  end if
  if sendAction(action) is false and action is "playPause" then
    openWindow()
  end if
end run

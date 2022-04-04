#!/usr/bin/osascript

tell application "iTerm2"
  tell current session of current window
    split horizontally with default profile
    split horizontally with default profile
    split horizontally with default profile
    split horizontally with default profile
  end tell

  tell first session of current tab of current window
    write text "ssh switowsk@cds-wn-01.cern.ch"
  end tell
  tell second session of current tab of current window
    write text "ssh switowsk@cds-wn-02.cern.ch"
  end tell
  tell third session of current tab of current window
    write text "ssh switowsk@cds-wn-03.cern.ch"
  end tell
  tell fourth session of current tab of current window
    write text "ssh switowsk@cds-wn-04.cern.ch"
  end tell
  tell fifth session of current tab of current window
    write text "ssh switowsk@cds-wn-05.cern.ch"
  end tell
end tell

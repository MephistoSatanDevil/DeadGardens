EXTEND_BOTTOM ~WINNKEEP~ 0
	IF ~Global("GGDGMQ","GLOBAL",2)~ THEN REPLY ~I'm looking for Alliast. You seen him?~  GOTO seenAlliast
END

APPEND WINNKEEP

IF ~~ THEN BEGIN seenAlliast
	SAY ~That one? Gods, no, not in this fine establishment! Check a place of worse repute.~
	IF ~~ THEN EXIT
END

END

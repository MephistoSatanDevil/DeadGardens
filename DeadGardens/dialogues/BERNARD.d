EXTEND_BOTTOM ~BERNARD~ 0 22 37
	IF ~Global("GGDGMQ","GLOBAL",2)~ THEN REPLY @100 /* I'm looking for Alliast. You seen him? */ GOTO seenAlliast
END

APPEND BERNARD

IF ~~ THEN BEGIN seenAlliast
	SAY @101 /* That one? Yeah, he's around here somewhere. In the back, most like. */
		IF ~~ THEN EXIT
END

END

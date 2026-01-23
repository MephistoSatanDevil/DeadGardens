EXTEND_BOTTOM ~FFBART~ 0 7 10 16 21
	IF ~Global("GGDGMQ","GLOBAL",2)~ THEN REPLY @800 /* I'm looking for Alliast. You seen him? */  GOTO seenAlliast
END

APPEND FFBART

IF ~~ THEN BEGIN seenAlliast
	SAY @801 /* That one? No, me friend, his type isn't welcome 'round here. */
		IF ~~ THEN EXIT
END

END

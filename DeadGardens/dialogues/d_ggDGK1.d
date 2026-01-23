BEGIN d_ggDGK1

//////////////////////////////////////////////////
//Assassin dialogue
//////////////////////////////////////////////////

IF ~True()~ THEN BEGIN 0
	SAY @300 /* Eh? Who are you, and why shouldn't I gut you? */
	++ @301 /* I'm just here to partake. */ GOTO 1
	++ @302 /* Are you Alliast? */ GOTO 2
END

IF ~~ THEN BEGIN 1
	SAY @303 /* Do it somewhere else. */
		IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 2
	SAY @304 /* What's it to you? */
	++ @305 /* Just wondering. */ GOTO 1
	++ @306 /* Rianor wants you dead. */ GOTO 3
END

IF ~~ THEN BEGIN 3
	SAY @307 /* Does he, now? Old fool finally realised he should've let me be sacrificed! Ha! It's too late for that now! */
		IF ~~ THEN DO ~Enemy()~ EXIT
END

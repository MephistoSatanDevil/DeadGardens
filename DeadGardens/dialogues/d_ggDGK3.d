BEGIN d_ggDGK3

//////////////////////////////////////////////////
//Cleric dialogue
//////////////////////////////////////////////////

IF ~TRUE()~ THEN BEGIN 0
	SAY @500 /* Yes? What may I do for you? */
	++ @501 /* Do you have any services? */ GOTO 1
	++ @502 /* Are you Ceranan? */ GOTO 2
END

IF ~~ THEN BEGIN 1
	SAY @503 /* I'm afraid not. You'll have to speak with the Dawnmaster for those. */
		IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 2
	SAY @504 /* Yes, that is my name. Why do you ask? */
	++ @505 /* Just wondering. */ GOTO 3
	++ @506 /* Rianor wants you dead. */ GOTO 4
//	+CheckStatGT(Player1,11,CHR)+ ~I was wondering if we could get a drink?~ GOTO 5
END		//you can ask cleric on date to get her out of the area/away from witnesses

IF ~~ THEN BEGIN 3
	SAY @507 /* Er... yes. Happy to help.. */
		IF ~~ THEN EXIT
END


IF ~~ THEN BEGIN 4
	SAY @508 /* Rianor? You mean.... that name's familiar.... The druid! The one that saved me all those years ago wants me dead now? But why? */
	++ @509 /* It's a long story, and I don't tell long stories to the dead. */ GOTO 6
	++ @510 /* (Explain the situation) */ GOTO 7
END

IF ~~ THEN BEGIN 6
	SAY @511 /* But--you can't be serious! I've done nothing! */
		IF ~~ THEN DO ~Enemy()~ EXIT
END

IF ~~ THEN BEGIN 7
	SAY @512 /* That's terrible! I can't believe... no. There's nothing--this is just. Thank you for telling me. I'll get out of here, in case he sends someone else after me. Please, put Rianor to rest. He doesn't deserve this. */
 IF ~~ THEN DO ~EscapeArea()~ EXIT
END

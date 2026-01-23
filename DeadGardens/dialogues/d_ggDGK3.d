BEGIN d_ggDGK3

//////////////////////////////////////////////////
//Cleric dialogue
//////////////////////////////////////////////////

IF ~TRUE()~ THEN BEGIN 0
	SAY ~Yes? What may I do for you?~
	++ ~Do you have any services?~ GOTO 1
	++ ~Are you Ceranan?~ GOTO 2
END

IF ~~ THEN BEGIN 1
	SAY ~I'm afraid not. You'll have to speak with the Dawnmaster for those.~
		IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 2
	SAY ~Yes, that is my name. Why do you ask?~
	++ ~Just wondering.~ GOTO 3
	++ ~Rianor wants you dead.~ GOTO 4
//	+CheckStatGT(Player1,11,CHR)+ ~I was wondering if we could get a drink?~ GOTO 5
END		//you can ask cleric on date to get her out of the area/away from witnesses

IF ~~ THEN BEGIN 3
	SAY ~Er... yes. Happy to help..~
		IF ~~ THEN EXIT
END


IF ~~ THEN BEGIN 4
	SAY ~Rianor? You mean.... that name's familiar.... The druid! The one that saved me all those years ago wants me dead now? But why?~
	++ ~It's a long story, and I don't tell long stories to the dead.~ GOTO 6
	++ ~(Explain the situation)~ GOTO 7
END

IF ~~ THEN BEGIN 6
	SAY ~But--you can't be serious! I've done nothing!~
		IF ~~ THEN DO ~Enemy()~ EXIT
END

IF ~~ THEN BEGIN 7
	SAY ~That's terrible! I can't believe... no. There's nothing--this is just. Thank you for telling me. I'll get out of here, in case he sends someone else after me. Please, put Rianor to rest. He doesn't deserve this.~
 IF ~~ THEN DO ~EscapeArea()~ EXIT
END

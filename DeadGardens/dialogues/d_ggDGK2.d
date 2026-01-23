BEGIN d_ggDGK2 //shadow druid dialogue

//////////////////////////////////////
//Shadow Druid dialogue. You can Noober him into attacking you
//Later, he will have a small quest for the player, so GGDGSDA has been set up
//////////////////////////////////////

IF ~NumTimesTalkedTo(0) Global("GGDGSDA","GLOBAL",0)~ THEN BEGIN 0
	SAY @400 /* I have nothing to say to you. */
		IF ~~ THEN EXIT
END

IF ~NumTimesTalkedTo(1) Global("GGDGSDA","GLOBAL",0)~ THEN BEGIN 1
	SAY @401 /* I told you I had nothing to say, didn't I? */
	++ @402 /* What's a Shadow Druid doing in Trademeet? */ GOTO 2
	++ @403 /* But you're saying something to me now. Saying that you have nothing to say is still having something to say, isn't it? */ GOTO 3
	++ @404 /* Right, sorry. I thought maybe you'd have something to say this time. */ GOTO 8
END

IF ~NumTimesTalkedTo(2) Global("GGDGSDA","GLOBAL",0)~ THEN BEGIN 10
	SAY @401 /* I told you I had nothing to say, didn't I? */
	++ @402 /* What's a Shadow Druid doing in Trademeet? */ GOTO 2
	++ @403 /* But you're saying something to me now. Saying that you have nothing to say is still having something to say, isn't it? */ GOTO 3
	++ @404 /* Right, sorry. I thought maybe you'd have something to say this time. */ GOTO 8
END

IF ~NumTimesTalkedTo(3) Global("GGDGSDA","GLOBAL",0)~ THEN BEGIN 11
	SAY @401 /* I told you I had nothing to say, didn't I? */
	++ @402 /* What's a Shadow Druid doing in Trademeet? */ GOTO 2
	++ @403 /* But you're saying something to me now. Saying that you have nothing to say is still having something to say, isn't it? */ GOTO 3
	++ @404 /* Right, sorry. I thought maybe you'd have something to say this time. */ GOTO 8
END

IF ~NumTimesTalkedTo(4) Global("GGDGSDA","GLOBAL",0)~ THEN BEGIN 12
	SAY @405 /* That's enough! You've pestered me one time too many! */
		IF ~~ THEN DO ~Enemy()~ EXIT
END

IF ~~ THEN BEGIN 3
	SAY @406 /* That's enough. I don't need to humor you. */
	++ @407 /* I restored peace here. You're a Shadow Druid and very much need to humor me. Otherwise, you're going to have to leave. */ GOTO 4
	++ @408 /* I'm looking for Dalomin.You wouldn't happen to know anything about him, would you? */ GOTO 5
	++ @409 /* Maybe I could help you. Surely you're here for a reason. */ GOTO 6
END

IF ~~ THEN BEGIN 2
	SAY @410 /* That is none of your concern. */ 
	++ @411 /* I restored peace here. Your presence very much is my concern. */ GOTO 4
	++ @408 /* I'm looking for Dalomin.You wouldn't happen to know anything about him, would you? */ GOTO 5
	++ @409 /* Maybe I could help you. Surely you're here for a reason. */ GOTO 6
END

IF ~~ THEN BEGIN 4
	SAY @412 /* You! You killed Faldorn?! You're the so-called "Hero of Trademeet"? In the name of Nature, I will end you! */
		IF ~~ THEN DO ~Enemy()~ EXIT
END

IF ~~ THEN BEGIN 5
	SAY @413 /* Dalomin? Why do you ask? */
	++ @414 /* Oh, no reason. */ GOTO 8
	++ @415 /* Archdruid Rianor wishes to correct his mistake. */ GOTO 9
END

IF ~~ THEN BEGIN 6
	SAY @416 /* Hmmm... Generous of you, but no. My task is mine and mine alone. */
		IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 8
	SAY @417 /* Quit pestering me. */
		IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 9
	SAY @418 /* Does he now? And he's too incompetent to do it himself. Come then! In the name of Nature, I will destory you! */
		IF ~~ THEN DO ~Enemy()~ EXIT
END

BEGIN d_ggDGDD




//////////////////////////////////////////////////
//Initial dialouge to see what's up. Happens once/
//////////////////////////////////////////////////
// if talked to archdruid, and first time talking to this guy

IF ~Global("GGDGMQ","GLOBAL",1) NumTimesTalkedTo(0)~ THEN BEGIN 0
	SAY @200 /* Who comes here? You are not of the Circle… Arianelle sent you, did she not? */
		++ @201 /* How did you know? */ GOTO 1
		++ @202 /* What prevents your rest? */ GOTO 2
END

IF ~~ THEN BEGIN 1
	SAY @203 /*  I know her well, as I knew all members of our Circle. Yet they knew me well not. There are too many secrets, too many things they do not know. How can you know someone if you do not know their secrets? */
		++ @202 /* What prevents your rest? */ GOTO 2
END

IF ~~ THEN BEGIN 2
	SAY @204 /* You are not of the Circle, so perhaps I may confess my sins. You could parade my shame to the other druids. There would be nothing I could do to stop you, though, to fix my mistakes, trusting you may be necessary… */
		++ @205 /* Go on. */ GOTO 2A
END

IF ~~ THEN BEGIN 2A
	SAY @206 /* It was many years ago. I came across a sacrifice. Three children, hunted and caught, were to be sacrificed to Malar. I… interfered. I rescued the children and returned them to civilization. They were fated to die that day. I took them out of the hands of the gods and into the hands of myself. I saved their lives, and thus… thus I feel I bear some responsibility for their actions. Perhaps they should have died that day. Perhaps the world is worse off for my meddling. */
		++ @205 /* Go on. */ GOTO 2B
END

IF ~~ THEN BEGIN 2B
	SAY @207 /* There were three children. I would hear from them, from time to time. And then, I stopped hearing from them… and started hearing *about* them instead. Alliast, an assassin in Athkatla cloaked in the most colorful of rumors. Dalomin, a Shadow Druid, who has twisted all that I hold dear. And Ceranan, who became a cleric of Lathander. */
		++ @208 /* You linger because you saved some children? */ GOTO 2C
		++ @209 /* What would you have me do? */ GOTO 2D
		++ @210 /* I’m not doing this. */ GOTO 3
END

IF ~~ THEN BEGIN 2C
	SAY @211 /* I linger because I am responsible for the lives I saved. I am partially responsible for every sin, every blessing, every atrocity they commit. They should have died that day. I interfered. If it weren’t for me… none of the good nor the bad would have happened. If the children stayed within the Balance or within the light, it would be one thing. But as it is… */
		++ @209 /* What would you have me do? */ GOTO 2D
		++ @210 /* I’m not doing this. */ GOTO 3
END

IF ~~ THEN BEGIN 2D
	SAY @212 /* I would have you… correct my mistake. Kill them. They are children no longer, which will make it both easier and harder for you. */
		++ @213 /* I will help you. */ GOTO 2E
		++ @210 /* I’m not doing this. */ GOTO 3
END

//PC accepts quest
IF ~~ THEN BEGIN 2E
	SAY @214 /* Thank you. I will linger here until you return. */
		IF ~~ THEN DO ~SetGlobal("GGDGMQ","GLOBAL",2) SetGlobal("GGDGMQA","GLOBAL",1) AddJournalEntry(@5101, QUEST)~ EXIT
END

//PC rejects quest
IF ~~ THEN BEGIN 3
	SAY @215 /* Then I shall linger here. */ IF ~~ THEN EXIT
		IF ~~ THEN DO ~SetGlobal("GGDGMQ","GLOBAL",2) ~ EXIT 
END					


//////////////////////////////////////
//rejected quest, talked to again ////
/////////////////////////////////////
IF ~!NumTimesTalkedTo(0) Global("GGDGMQA","GLOBAL",0) Global("GGDGMQGG","GLOBAL",0)~ THEN BEGIN 10
	SAY @216 /* You return. Do you intend to help me find peace? */
		++ @209 /* What would you have me do? */ GOTO 10D
		++ @210 /* I’m not doing this. */ GOTO 11
END

IF ~~ THEN BEGIN 10D
	SAY @217 /* I would have you… correct my mistake. Kill them. They are children no longer, which will make it both easier and harder for you. Mutilate the bodies, so that they cannot be resurrected. */
		++ @213 /* I will help you. */ GOTO 10E
		++ @210 /* I’m not doing this. */ GOTO 11
END

IF ~~ THEN BEGIN 10E
	SAY @214 /* Thank you. I will linger here until you return. */
		IF ~~ THEN DO ~SetGlobal("GGDGMQA","GLOBAL",1) AddJournalEntry(@5101, QUEST)~ EXIT //variable Acceptedquest = 1
END

IF ~~ THEN BEGIN 11
	SAY @215 /* Then I shall linger here. */
		IF ~~ THEN EXIT
END					


/////////////////////////////////////
//rejected quest, talked to again AFTER AA////
/////////////////////////////////////
IF ~!NumTimesTalkedTo(0) Global("GGDGMQA","GLOBAL",0) Global("GGDGMQGG","GLOBAL",1)~ THEN BEGIN 20
	SAY @216 /* You return. Do you intend to help me find peace? */
		++ @209 /* What would you have me do? */ GOTO 20D
		+~InParty("Jaheira") InParty("Cernd") CheckStatGT(Player1,15,CHR)~+ @218 /* I will not do this! Why don't we talk, instead? */ GOTO smiteTimeTrivial
		+~!InParty("Jaheira") InParty("Cernd") CheckStatGT(Player1,15,CHR)~+ @218 /* I will not do this! Why don't we talk, instead? */ GOTO smiteTimeEasy		
		+~InParty("Jaheira") !InParty("Cernd") CheckStatGT(Player1,15,CHR)~+ @218 /* I will not do this! Why don't we talk, instead? */ GOTO smiteTimeEasy	
		+~InParty("Jaheira") InParty("Cernd") !CheckStatGT(Player1,15,CHR)~+ @218 /* I will not do this! Why don't we talk, instead? */ GOTO smiteTimeEasy
		+~!InParty("Jaheira") !InParty("Cernd") CheckStatGT(Player1,15,CHR)~+ @218 /* I will not do this! Why don't we talk, instead? */ GOTO smiteTimeMedium	
		+~InParty("Jaheira") !InParty("Cernd") !CheckStatGT(Player1,15,CHR)~+ @218 /* I will not do this! Why don't we talk, instead? */ GOTO smiteTimeMedium	
		+~!InParty("Jaheira") InParty("Cernd") !CheckStatGT(Player1,15,CHR)~+ @218 /* I will not do this! Why don't we talk, instead? */ GOTO smiteTimeMedium	
		++ @219 /* I’m not doing this, though I'm not going to try to convince you either. */ GOTO 1000
END

IF ~~ THEN BEGIN 20D
	SAY @217 /* I would have you… correct my mistake. Kill them. They are children no longer, which will make it both easier and harder for you. Mutilate the bodies, so that they cannot be resurrected. */
		++ @213 /* I will help you. */ GOTO 20E
		+~InParty("Jaheira") InParty("Cernd") CheckStatGT(Player1,15,CHR)~+ @218 /* I will not do this! Why don't we talk, instead? */ GOTO smiteTimeTrivial
		+~!InParty("Jaheira") InParty("Cernd") CheckStatGT(Player1,15,CHR)~+ @218 /* I will not do this! Why don't we talk, instead? */ GOTO smiteTimeEasy		
		+~InParty("Jaheira") !InParty("Cernd") CheckStatGT(Player1,15,CHR)~+ @218 /* I will not do this! Why don't we talk, instead? */ GOTO smiteTimeEasy	
		+~InParty("Jaheira") InParty("Cernd") !CheckStatGT(Player1,15,CHR)~+ @218 /* I will not do this! Why don't we talk, instead? */ GOTO smiteTimeEasy
		+~!InParty("Jaheira") !InParty("Cernd") CheckStatGT(Player1,15,CHR)~+ @218 /* I will not do this! Why don't we talk, instead? */ GOTO smiteTimeMedium	
		+~InParty("Jaheira") !InParty("Cernd") !CheckStatGT(Player1,15,CHR)~+ @218 /* I will not do this! Why don't we talk, instead? */ GOTO smiteTimeMedium	
		+~!InParty("Jaheira") InParty("Cernd") !CheckStatGT(Player1,15,CHR)~+ @218 /* I will not do this! Why don't we talk, instead? */ GOTO smiteTimeMedium	
		++ @219 /* I’m not doing this, though I'm not going to try to convince you either. */ GOTO 1000
END

IF ~~ THEN BEGIN 20E
	SAY @214 /* Thank you. I will linger here until you return. */
		IF ~~ THEN DO ~SetGlobal("GGDGMQA","GLOBAL",1) AddJournalEntry(@5101, QUEST)~ EXIT //variable Acceptedquest = 1
END

IF ~~ THEN BEGIN 1000
	SAY @215 /* Then I shall linger here. */
		IF ~~ THEN EXIT
END						

/////////////////////////////////////////
///Double-cross dialogue
///////////////////////////////////////
IF ~Global("GGDGMQA","GLOBAL",1) Global("GGDGMQGG","GLOBAL",1) !Dead("ggAlliast") GLOBAL("GGDGMQE","GLOBAL",0) GLOBAL("GGDGMQM","GLOBAL",0)~ THEN BEGIN 30
	SAY @220 /* You return, but Alliast, the assassin in Athkatla, still lives. */
		++ @221 /* I'm working on it. */ GOTO 31
		+~InParty("Jaheira") InParty("Cernd") CheckStatGT(Player1,15,CHR)~+ @218 /* I will not do this! Why don't we talk, instead? */ GOTO smiteTimeTrivial
		+~!InParty("Jaheira") InParty("Cernd") CheckStatGT(Player1,15,CHR)~+ @218 /* I will not do this! Why don't we talk, instead? */ GOTO smiteTimeEasy		
		+~InParty("Jaheira") !InParty("Cernd") CheckStatGT(Player1,15,CHR)~+ @218 /* I will not do this! Why don't we talk, instead? */ GOTO smiteTimeEasy	
		+~InParty("Jaheira") InParty("Cernd") !CheckStatGT(Player1,15,CHR)~+ @218 /* I will not do this! Why don't we talk, instead? */ GOTO smiteTimeEasy
		+~!InParty("Jaheira") !InParty("Cernd") CheckStatGT(Player1,15,CHR)~+ @218 /* I will not do this! Why don't we talk, instead? */ GOTO smiteTimeMedium	
		+~InParty("Jaheira") !InParty("Cernd") !CheckStatGT(Player1,15,CHR)~+ @218 /* I will not do this! Why don't we talk, instead? */ GOTO smiteTimeMedium	
		+~!InParty("Jaheira") InParty("Cernd") !CheckStatGT(Player1,15,CHR)~+ @218 /* I will not do this! Why don't we talk, instead? */ GOTO smiteTimeMedium	
END

IF ~Global("GGDGMQA","GLOBAL",1) Global("GGDGMQGG","GLOBAL",1) !Dead("ggDalomin") GLOBAL("GGDGMQE","GLOBAL",0) GLOBAL("GGDGMQM","GLOBAL",0)~ THEN BEGIN 30
	SAY @222 /* You return, but Dalomin, the Shadow Druid, still lives. */
		++ @221 /* I'm working on it. */ GOTO 31
		+~InParty("Jaheira") InParty("Cernd") CheckStatGT(Player1,15,CHR)~+ @218 /* I will not do this! Why don't we talk, instead? */ GOTO smiteTimeTrivial
		+~!InParty("Jaheira") InParty("Cernd") CheckStatGT(Player1,15,CHR)~+ @218 /* I will not do this! Why don't we talk, instead? */ GOTO smiteTimeEasy		
		+~InParty("Jaheira") !InParty("Cernd") CheckStatGT(Player1,15,CHR)~+ @218 /* I will not do this! Why don't we talk, instead? */ GOTO smiteTimeEasy	
		+~InParty("Jaheira") InParty("Cernd") !CheckStatGT(Player1,15,CHR)~+ @218 /* I will not do this! Why don't we talk, instead? */ GOTO smiteTimeEasy
		+~!InParty("Jaheira") !InParty("Cernd") CheckStatGT(Player1,15,CHR)~+ @218 /* I will not do this! Why don't we talk, instead? */ GOTO smiteTimeMedium	
		+~InParty("Jaheira") !InParty("Cernd") !CheckStatGT(Player1,15,CHR)~+ @218 /* I will not do this! Why don't we talk, instead? */ GOTO smiteTimeMedium	
		+~!InParty("Jaheira") InParty("Cernd") !CheckStatGT(Player1,15,CHR)~+ @218 /* I will not do this! Why don't we talk, instead? */ GOTO smiteTimeMedium	
END

IF ~Global("GGDGMQA","GLOBAL",1) Global("GGDGMQGG","GLOBAL",1) !Dead("ggCeranan") GLOBAL("GGDGMQE","GLOBAL",0) GLOBAL("GGDGMQM","GLOBAL",0)~ THEN BEGIN 30
	SAY @222 /* You return, but Dalomin, the Shadow Druid, still lives. */
		++ @221 /* I'm working on it. */ GOTO 31
		+~InParty("Jaheira") InParty("Cernd") CheckStatGT(Player1,15,CHR)~+ @218 /* I will not do this! Why don't we talk, instead? */ GOTO smiteTimeTrivial
		+~!InParty("Jaheira") InParty("Cernd") CheckStatGT(Player1,15,CHR)~+ @218 /* I will not do this! Why don't we talk, instead? */ GOTO smiteTimeEasy		
		+~InParty("Jaheira") !InParty("Cernd") CheckStatGT(Player1,15,CHR)~+ @218 /* I will not do this! Why don't we talk, instead? */ GOTO smiteTimeEasy	
		+~InParty("Jaheira") InParty("Cernd") !CheckStatGT(Player1,15,CHR)~+ @218 /* I will not do this! Why don't we talk, instead? */ GOTO smiteTimeEasy
		+~!InParty("Jaheira") !InParty("Cernd") CheckStatGT(Player1,15,CHR)~+ @218 /* I will not do this! Why don't we talk, instead? */ GOTO smiteTimeMedium	
		+~InParty("Jaheira") !InParty("Cernd") !CheckStatGT(Player1,15,CHR)~+ @218 /* I will not do this! Why don't we talk, instead? */ GOTO smiteTimeMedium	
		+~!InParty("Jaheira") InParty("Cernd") !CheckStatGT(Player1,15,CHR)~+ @218 /* I will not do this! Why don't we talk, instead? */ GOTO smiteTimeMedium	
END

IF ~~ THEN BEGIN 31
	SAY @215 /* Then I shall linger here. */ IF ~~ THEN EXIT
END

////////////////////////////////////////
//everyone  dead///
///////////////////////////////////////

IF ~Dead("ggAlliast") Dead("ggDalomin") Dead("ggCeranan")~ THEN BEGIN 40
	SAY @223 /* At last. I felt their souls pass through to the Fugue Plane. My mistake has been corrected. I linger here no more... */
		IF ~~ THEN DO ~SetGlobal("GGDGMQ","GLOBAL",9) AddJournalEntry(@5105, QUEST) DestroySelf()~ EXIT 
END


////////////////////////////////////////
//BASIC SMITING TIME CHALLENGE TRIVIAL//
////////////////////////////////////////

CHAIN IF ~InParty("Jaheira") InParty("Cernd") CheckStatGT(Player1,15,CHR)~ THEN d_ggDGDD smiteTimeTrivial
	@224 /* You want to... talk? There is nothing to talk about. I made a mistake. It must be rectified. */
	== JaheiraJ IF ~InParty("Jaheira")~ THEN @225 /* You are making a mistake now! This is not the natural order of things! As a druid, you know this. */
	== CERNDJ IF ~InParty("Cernd")~ THEN @226 /* You would not blame the life-nourishing rainclouds for the floods they may inadvertantly bring, nor should you blame yourself for this. */
END
	++ @227 /* You had no idea that two of the three children you saved were going to become evil. You cannot blame yourself this. */ + smiteTrivialResult	

APPEND d_ggDGDD

IF ~~ THEN BEGIN smiteTrivialResult
	SAY @228 /* Perhaps... Perhaps. And as the rainclouds cannot undo the rain they have brought, neither can I undo what I have done. I see that now. Here, I gift you my staff. Return to Arianelle. I am sorry. */
		IF ~~ THEN DO ~AddJournalEntry(@5105, QUEST) GiveItemCreate("GGDGS2",Player1,1,1,0) SetGlobal("GGDGMQ","GLOBAL",9) DestroySelf()~ EXIT 
END
END

/////////////////////////////////////
//BASIC SMITING TIME CHALLENGE EASY | Cernd, Jah, Cha, pick 2
////////////////////////////////////
CHAIN IF ~~ THEN d_ggDGDD smiteTimeEasy
	@224 /* You want to... talk? There is nothing to talk about. I made a mistake. It must be rectified. */
	== JaheiraJ IF ~InParty("Jaheira")~ THEN @225 /* You are making a mistake now! This is not the natural order of things! As a druid, you know this. */
	== CERNDJ IF ~InParty("Cernd")~ THEN @226 /* You would not blame the life-nourishing rainclouds for the floods they may inadvertantly bring, nor should you blame yourself for this. */
END
	++ @227 /* You had no idea that two of the three children you saved were going to become evil. You cannot blame yourself this. */ + smiteEasyResult	

APPEND d_ggDGDD

IF ~~ THEN BEGIN smiteEasyResult
	SAY @229 /* Perhaps not. But still, the fact remains that they have committed atrocities. This needs to be changed; if not for my sake, then for the sake of others. Alliast is the worst of the three, an assassin in Athkatla. If his soul travels through the Fugue Plane, then I shall do the same. */
		IF ~~ THEN DO ~SetGlobal("GGDGMQE","GLOBAL",1) AddJournalEntry(@5103, QUEST)~ EXIT 
END
END

/////////////////////////////////////
//BASIC SMITING TIME CHALLENGE MEDIUM |  Cernd, Jah, Cha, pick 1
////////////////////////////////////
CHAIN IF ~~ THEN d_ggDGDD smiteTimeMedium
	@224 /* You want to... talk? There is nothing to talk about. I made a mistake. It must be rectified. */
	== JaheiraJ IF ~InParty("Jaheira")~ THEN @225 /* You are making a mistake now! This is not the natural order of things! As a druid, you know this. */
	== CERNDJ IF ~InParty("Cernd")~ THEN @226 /* You would not blame the life-nourishing rainclouds for the floods they may inadvertantly bring, nor should you blame yourself for this. */
END
	++ @227 /* You had no idea that two of the three children you saved were going to become evil. You cannot blame yourself this. */ + smiteMediumResult	

APPEND d_ggDGDD

IF ~~ THEN BEGIN smiteMediumResult
	SAY @230 /* Perhaps not. But still, the fact remains that they have committed atrocities. This needs to be changed; if not for my sake, then for the sake of others. Alliast and Dalomin are the worst of the three, an assassin in Athkatla and a Shadow Druid near Trademeet. If their souls travels through the Fugue Plane, then I shall do the same. */
		IF ~~ THEN DO ~SetGlobal("GGDGMQM","GLOBAL",1) AddJournalEntry(@5104, QUEST)~ EXIT 
END


//////////////////////////////
//RETURNING EASY
/////////////////////////////

IF ~Global("GGDGMQE","GLOBAL",1) !Dead("ggAlliast")~ THEN BEGIN 100
	SAY @231 /* Alliast yet lives. Go to Athkatla. Find the assassin, and rectify my mistake. */
		IF ~~ THEN EXIT
END

IF ~Global("GGDGMQE","GLOBAL",1) Dead("ggAlliast")~ THEN BEGIN 101
	SAY @232 /* At last. I felt his soul pass through to the Fugue Plane. Part of my mistake has been corrected. As promised, I linger here no more... */
		IF ~~ THEN DO ~SetGlobal("GGDGMQ","GLOBAL",9) AddJournalEntry(@5105, QUEST) DestroySelf()~ EXIT
END

//////////////////////////////
//RETURNING MEDIUM
/////////////////////////////

IF ~Global("GGDGMQM","GLOBAL",1) !Dead("ggAlliast")~ THEN BEGIN 200
	SAY @231 /* Alliast yet lives. Go to Athkatla. Find the assassin, and rectify my mistake. */
		IF ~~ THEN EXIT
END

IF ~Global("GGDGMQM","GLOBAL",1) !Dead("ggDalomin")~ THEN BEGIN 201
	SAY @233 /* Dalomin yet lives. Find him skulking about near Shadow Druid activity, and rectify my mistake. */
		IF ~~ THEN EXIT 
END

IF ~Global("GGDGMQM","GLOBAL",1) Dead("ggAlliast") Dead("ggDalomin")~ THEN BEGIN 202
	SAY @234 /* At last. I felt their souls pass through to the Fugue Plane. Part of my mistake has been corrected. As promised, I linger here no more... */
		IF ~~ THEN DO ~SetGlobal("GGDGMQ","GLOBAL",9) AddJournalEntry(@5105, QUEST) DestroySelf()~ EXIT
END
END



 
BEGIN d_ggDGMQ

  
/////////////////////////////////////
//Initial quest giving dialogue/////
///////////////////////////////////
IF ~Global("GGDGMQ","GLOBAL",0)~ THEN BEGIN 0
	SAY @600 /* Ho, there! You are <CHARNAME>, are you not? I am Arianelle, an archdruid of the Forest of Tethyr, and I would ask a favor of you. */
		++ @601 /* Ask away. */ GOTO 1
		++ @602 /* You travelled all the way here to talk to me? */ GOTO 2
		++ @603 /* Sorry, not right now. */ GOTO 3
END

IF ~~ THEN BEGIN 1
	SAY @604 /* I am telling you about this because I believe that your actions show sympathy to druidic plights and a reverence for balance and nature. A previous member of our Circle has returned from beyond the veil. Something is clearly wrong, there is clearly a reason why his spirit lingers in the Prime Material, but he refuses to speak with us! I would ask you to speak with him, to see if there is any way you can bring peace to him. */
		++ @605 /* I will look into it. */ GOTO 1A
		++ @606 /* Why would he talk with me, when he has refused to talk to any of your Circle? */ GOTO 1B
		++ @603 /* Sorry, not right now. */ GOTO 3
END

IF ~~ THEN BEGIN 2
	SAY @607 /* Not… necessarily. I came all the way to talk to someone sympathetic to druidic plights and an outsider of Tethyr. */
		++ @608 /* I see. Ask away. */ GOTO 1
		++ @603 /* Sorry, not right now. */ GOTO 3
END

//////////////////////
//first journal entry
//////////////////
IF ~~ THEN BEGIN 1A
	SAY @609 /* Thank you, <CHARNAME>. May you succeed where we have failed. You can find the undead archdruid in a cave in the forest of Tethyr, in the southeast. We interred him in that cave, and he lingers there. At least he doesn’t cause problems…yet. I will mark the forest on your map. */
		IF ~~ THEN DO ~SetGlobal("GGDGMQ","GLOBAL",1) RevealAreaOnMap("AR2600") AddJournalEntry(@5100, QUEST)~ EXIT
END

IF ~~ THEN BEGIN 1B
	SAY @610 /* We think he may be hiding something. He feels guilty, perhaps. Perhaps there are things easier to admit to a stranger than to a friend. You are an outsider to our Circle. He may refuse to speak to you as well, but we have to try. */
		++ @605 /* I will look into it. */ GOTO 1A
		++ @603 /* Sorry, not right now. */ GOTO 3
END


IF ~~ THEN BEGIN 3
	SAY @611 /* Very well, I cannot force you. I will remain here, until you or someone else resolves this situation. */
		IF ~~ THEN EXIT
END

//////////////////////////////////////////////////////////
//started quest, haven't spoken to the Undead Druid yet
/////////////////////////////////////////////////////////
IF ~Global("GGDGMQ","GLOBAL",1)~ THEN BEGIN 10
	SAY @612 /* Go to the Forest of Tethyr. Discover why our brother cannot rest. */
		IF ~~ THEN EXIT
END

///////////////////////////////////////////////////////
//talked to Undead Druid, chance to snitch
///////////////////////////////////////////////////////
IF ~ Global("GGDGMQ","GLOBAL",2) Global("GGDGMQGG","GLOBAL",0)~ THEN BEGIN 20 // GGDGMQGG = glitter...MQG gives advice
	SAY @613 /* Has he talked to you? */
		++ @614 /* Yes, and I'm working on it. */ GOTO 21
		++ @615 /* Yes, he wants me to kill three people he once saved. (Explain the situation) */ GOTO 22
END

IF ~~ THEN BEGIN 21
	SAY @616 /* He spoke with you? That's great news! I wish you success in your task. */
		IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 22
	SAY @617 /* He wants you to WHAT?! I've heard that undeath can corrupt and distort a spirit, but this... You cannot do this! Please, figure out some way to talk him out of it. Do not bother trying to fight him. Unlife has likely made him even more powerful, and even if you destroy him, his spirit will just reform later. Please talk to him. */ 
		IF ~~ THEN DO ~SetGlobal("GGDGMQGG","GLOBAL",1) AddJournalEntry(@5100, QUEST) ~ EXIT
END


IF ~ Global("GGDGMQ","GLOBAL",2) Global("GGDGMQGG","GLOBAL",1)~ THEN BEGIN 25
	SAY @618 /* Do not do what he asks. Please, talk him out of it. */
		IF ~~ THEN EXIT
END


/////////////////////////////////////////////////
//Talked undead druid into leaving ending
////////////////////////////////////////////////
IF ~ Global("GGDGMQ","GLOBAL",9)~ THEN BEGIN 40
	SAY @619 /* He is at rest now? You talked him into leaving peacefully? Thank you, <CHARNAME>, you have done us a great service. Take this staff as a reward--it once belonged to a Shadow Druid, though it will serve better in your hands. I must return to my duties. May you walk in Balance. */
		IF ~~ THEN DO ~GiveItemCreate("GGDGS0",Player1,1,1,0)
						AddJournalEntry(@5106, QUEST_DONE)
						AddXPObject(Player1,20000)
						AddXPObject(Player2,20000)
						AddXPObject(Player3,20000)
						AddXPObject(Player4,20000)
						AddXPObject(Player5,20000)
						AddXPObject(Player6,20000)
						EscapeArea()~ EXIT
END

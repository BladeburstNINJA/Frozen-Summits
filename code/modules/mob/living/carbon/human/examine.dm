/mob/living/carbon/human/proc/on_examine_face(mob/living/carbon/human/user)
	if(!istype(user))
		return
	if(user.mind)
		user.mind.i_know_person(src)
	var/datum/species/self_species = dna.species
	var/datum/species/examiner_species = user.dna.species
	if(self_species.stress_examine && self_species.type != examiner_species.type && !HAS_TRAIT(user, TRAIT_TOLERANT))
		var/event_type = /datum/stressevent/shunned_race
		if(HAS_TRAIT(user, TRAIT_XENOPHOBIC))
			event_type = /datum/stressevent/shunned_race_xenophobic
		var/datum/stressevent/event = user.add_stress(event_type)
		event.desc = self_species.stress_desc
	if(user.has_flaw(/datum/charflaw/paranoid))	//We hate different species, that are stronger than us, and aren't racist themselves
		if(dna.species.name != user.dna.species.name && (STASTR - user.STASTR) > 1 && !has_flaw(/datum/charflaw/paranoid))
			user.add_stress(/datum/stressevent/parastr)
	if(HAS_TRAIT(user, TRAIT_JESTERPHOBIA) && job == "Jester")
		user.add_stress(/datum/stressevent/jesterphobia)
	if(HAS_TRAIT(src, TRAIT_BEAUTIFUL))
		user.add_stress(/datum/stressevent/beautiful)

/mob/living/carbon/human/examine(mob/user)
	var/observer_privilege = isobserver(user)
	var/t_He = p_they(TRUE)
	var/t_his = p_their()
//	var/t_him = p_them()
	var/t_has = p_have()
	var/t_is = p_are()
	var/obscure_name = FALSE
	var/race_name = dna.species.name
	var/datum/antagonist/maniac/maniac = user.mind?.has_antag_datum(/datum/antagonist/maniac)
	if(maniac && (user != src))
		race_name = "disgusting pig"

	var/m1 = "[t_He] [t_is]"
	var/m2 = "[t_his]"
	var/m3 = "[t_He] [t_has]"
	if(user == src)
		m1 = "I am"
		m2 = "my"
		m3 = "I have"

	if(isliving(user))
		var/mob/living/L = user
		if(HAS_TRAIT(L, TRAIT_PROSOPAGNOSIA))
			obscure_name = TRUE

	var/static/list/unknown_names = list(
		"Unknown",
		"Unknown Man",
		"Unknown Woman",
	)
	if(get_visible_name() in unknown_names)
		obscure_name = TRUE

	if(observer_privilege)
		obscure_name = FALSE

	if(obscure_name)
		. = list("<span class='info'>ø ------------ ø\nThis is <EM>Unknown</EM>.")
	else
		on_examine_face(user)
		var/used_name = name
		var/used_title = get_role_title()
		var/display_as_wanderer = FALSE
		var/is_returning = FALSE
		if(observer_privilege)
			used_name = real_name
		if(migrant_type)
			var/datum/migrant_role/migrant = MIGRANT_ROLE(migrant_type)
			if(migrant.show_wanderer_examine)
				display_as_wanderer = TRUE
		else if(job)
			var/datum/job/J = SSjob.GetJob(job)
			if(!J || J.wanderer_examine)
				display_as_wanderer = TRUE
			if(islatejoin)
				is_returning = TRUE
		if(display_as_wanderer)
			. = list("<span class='info'>ø ------------ ø\nThis is <EM>[used_name]</EM>, the wandering [custom_race_name] ([race_name]).")
		else if(used_title)
			. = list("<span class='info'>ø ------------ ø\nThis is <EM>[used_name]</EM>, the [is_returning ? "returning " : ""][custom_race_name] ([race_name]) [used_title].")
		else
			. = list("<span class='info'>ø ------------ ø\nThis is the <EM>[used_name]</EM>, the [race_name].")

		if(GLOB.lord_titles[name])
			. += span_notice("[m3] been granted the title of \"[GLOB.lord_titles[name]]\".")

		if(HAS_TRAIT(src, TRAIT_NOBLE))
			if(HAS_TRAIT(user, TRAIT_NOBLE))
				. += span_notice("A fellow noble.")
			else
				. += span_notice("A noble!")

		if(ishuman(user))
			var/mob/living/carbon/human/stranger = user
			if(RomanticPartner(stranger))
				. += "<span class='love'>It's my spouse.</span>"
			if(family_datum == stranger.family_datum && family_datum)
				var/family_text = ReturnRelation(user)
				if(family_text)
					. += family_text

		if(name in GLOB.excommunicated_players)
			. += span_userdanger("CURSED!")

		if(name in GLOB.outlawed_players)
			. += span_userdanger("OUTLAW!")

		if(name in GLOB.court_agents)
			var/datum/job/J = SSjob.GetJob(user.mind.assigned_role)
			if(J.department_flag & GARRISON || J.department_flag & NOBLEMEN)
			//if(GLOB.noble_positions.Find(J.title) || GLOB.garrison_positions.Find(J.title))
				. += span_greentext("<b>[m1] an agent of the court!</b>")
		
		if(has_flaw(/datum/charflaw/addiction/lovefiend) && user.has_flaw(/datum/charflaw/addiction/lovefiend))
			. += span_aiprivradio("[m1] as lovesick as I.")
		
		if(has_flaw(/datum/charflaw/addiction/junkie) && user.has_flaw(/datum/charflaw/addiction/junkie))
			. += span_deadsay("[m1] carrying the same dust marks on their nose as I.")

		if(has_flaw(/datum/charflaw/addiction/smoker) && user.has_flaw(/datum/charflaw/addiction/smoker))
			. += span_suppradio("[m1] enveloped by the familiar, faint stench of smoke. I know it well.")

		if(has_flaw(/datum/charflaw/addiction/alcoholic) && user.has_flaw(/datum/charflaw/addiction/alcoholic))
			. += span_syndradio("[m1] struggling to hide the hangover, and the stench of spirits. We're alike.")

		var/commie_text
		if(mind)
			if(mind.special_role == "Bandit")
				if(HAS_TRAIT(user, TRAIT_COMMIE))
					commie_text = span_notice("Free man!")
				/*else
					commie_text = span_userdanger("BANDIT!")*/
			if(mind.special_role == "Vampire Lord")
				. += span_userdanger("A MONSTER!")
			if(mind.assigned_role == "Lunatic")
				. += span_userdanger("LUNATIC!")
		if(HAS_TRAIT(src, TRAIT_MANIAC_AWOKEN))
			. += span_userdanger("MANIAC!")

		if(commie_text)
			. += commie_text
		else if(HAS_TRAIT(src, TRAIT_COMMIE) && HAS_TRAIT(user, TRAIT_COMMIE))
			. += span_notice("Comrade!")
		else if(HAS_TRAIT(src, TRAIT_CABAL) && HAS_TRAIT(user, TRAIT_CABAL))
			. += span_notice("Another of the Cabal!")
		else if(HAS_TRAIT(src, TRAIT_HORDE) && HAS_TRAIT(user, TRAIT_HORDE))
			. += span_notice("Anointed!")
		else if(HAS_TRAIT(src, TRAIT_DEPRAVED) && HAS_TRAIT(user, TRAIT_DEPRAVED))
			. += span_notice("Debased!")

		if(has_flaw(/datum/charflaw/paranoid) && user.has_flaw(/datum/charflaw/paranoid))
			if(ishuman(user))
				var/mob/living/carbon/human/H = user
				if(dna.species.name == H.dna.species.name)
					. += span_nicegreen("[m1] privy to the dangers of all these strangers around us. Just like me.")
				else
					. += span_nicegreen("[m1] one of the good ones. He hates other faces as much as I.")
		if(has_flaw(/datum/charflaw/masochist) && user.has_flaw(/datum/charflaw/addiction/sadist))
			. += span_secradio("[m1] marked by scars inflicted for pleasure. A delectable target for my urges.")
		if(has_flaw(/datum/charflaw/addiction/sadist) && user.has_flaw(/datum/charflaw/masochist))
			. += span_secradio("[m1] looking with eyes filled with a desire to inflict pain. So exciting.")


	if(leprosy == 1)
		. += span_necrosis("A LEPER...")
	
	if (HAS_TRAIT(src, TRAIT_BEAUTIFUL))
		switch (pronouns)
			if (HE_HIM)
				. += span_beautiful_masc("[m1] handsome!")
			if (SHE_HER)
				. += span_beautiful_fem("[m1] beautiful!")
			if (THEY_THEM, THEY_THEM_F, IT_ITS)
				. += span_beautiful_nb("[m1] good-looking!")

	if(user != src)
		var/datum/mind/Umind = user.mind
		if(Umind && mind)
			for(var/datum/antagonist/aD in mind.antag_datums)
				for(var/datum/antagonist/bD in Umind.antag_datums)
					var/shit = bD.examine_friendorfoe(aD,user,src)
					if(shit)
						. += shit
			if(user.mind.has_antag_datum(/datum/antagonist/vampirelord) || user.mind.has_antag_datum(/datum/antagonist/vampire))
				. += span_userdanger("Blood Volume: [blood_volume]")

	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))

	if(wear_shirt && !(SLOT_SHIRT in obscured))
		. += "[m3] [wear_shirt.get_examine_string(user)]."

	//uniform
	if(wear_pants && !(SLOT_PANTS in obscured))
		//accessory
		var/accessory_msg
		if(istype(wear_pants, /obj/item/clothing/under))
			var/obj/item/clothing/under/U = wear_pants
			if(U.attached_accessory)
				accessory_msg += " with [icon2html(U.attached_accessory, user)] \a [U.attached_accessory]"

		. += "[m3] [wear_pants.get_examine_string(user)][accessory_msg]."

	//head
	if(head && !(SLOT_HEAD in obscured))
		. += "[m3] [head.get_examine_string(user)] on [m2] head."
	//suit/armor
	if(wear_armor && !(SLOT_ARMOR in obscured))
		. += "[m3] [wear_armor.get_examine_string(user)]."
		//suit/armor storage
		if(s_store && !(SLOT_S_STORE in obscured))
			. += "[m1] carrying [s_store.get_examine_string(user)] on [m2] [wear_armor.name]."
	//back
//	if(back)
//		. += "[m3] [back.get_examine_string(user)] on [m2] back."

	//cloak
	if(cloak && !(SLOT_CLOAK in obscured))
		. += "[m3] [cloak.get_examine_string(user)] on [m2] shoulders."

	//right back
	if(backr && !(SLOT_BACK_R in obscured))
		. += "[m3] [backr.get_examine_string(user)] on [m2] back."

	//left back
	if(backl && !(SLOT_BACK_L in obscured))
		. += "[m3] [backl.get_examine_string(user)] on [m2] back."

	//Hands
	for(var/obj/item/I in held_items)
		if(!(I.item_flags & ABSTRACT))
			. += "[m1] holding [I.get_examine_string(user)] in [m2] [get_held_index_name(get_held_index_of_item(I))]."

	var/datum/component/forensics/FR = GetComponent(/datum/component/forensics)
	//gloves
	if(gloves && !(SLOT_GLOVES in obscured))
		. += "[m3] [gloves.get_examine_string(user)] on [m2] hands."
	else if(FR && length(FR.blood_DNA))
		var/hand_number = get_num_arms(FALSE)
		if(hand_number)
			. += "[m3][hand_number > 1 ? "" : " a"] <span class='bloody'>blood-stained</span> hand[hand_number > 1 ? "s" : ""]!"

	//belt
	if(belt && !(SLOT_BELT in obscured))
		. += "[m3] [belt.get_examine_string(user)] about [m2] waist."

	//right belt
	if(beltr && !(SLOT_BELT_R in obscured))
		. += "[m3] [beltr.get_examine_string(user)] on [m2] belt."

	//left belt
	if(beltl && !(SLOT_BELT_L in obscured))
		. += "[m3] [beltl.get_examine_string(user)] on [m2] belt."

	//shoes
	if(shoes && !(SLOT_SHOES in obscured))
		. += "[m3] [shoes.get_examine_string(user)] on [m2] feet."

	//mask
	if(wear_mask && !(SLOT_WEAR_MASK in obscured))
		. += "[m3] [wear_mask.get_examine_string(user)] on [m2] face."

	//mouth
	if(mouth && !(SLOT_MOUTH in obscured))
		. += "[m3] [mouth.get_examine_string(user)] in [m2] mouth."

	//neck
	if(wear_neck && !(SLOT_NECK in obscured))
		. += "[m3] [wear_neck.get_examine_string(user)] around [m2] neck."

	//eyes
	if(!(SLOT_GLASSES in obscured))
		if(glasses)
			. += "[m3] [glasses.get_examine_string(user)] covering [m2] eyes."
		else if(eye_color == BLOODCULT_EYE && iscultist(src) && HAS_TRAIT(src, CULT_EYES))
			. += span_warning("<B>[m2] eyes are glowing an unnatural red!</B>")

	//ears
	if(ears && !(SLOT_HEAD in obscured))
		. += "[m3] [ears.get_examine_string(user)] on [m2] ears."

	//ID
	if(wear_ring && !(SLOT_RING in obscured))
		. += "[m3] [wear_ring.get_examine_string(user)] on [m2] hands."

	//wrists
	if(wear_wrists && !(SLOT_WRISTS in obscured))
		. += "[m3] [wear_wrists.get_examine_string(user)] on [m2] wrists."

	//handcuffed?
	if(handcuffed)
		if(user == src)
			. += "<span class='warning'>[m1] tied up with \a [handcuffed]!</span>"
		else
			. += "<A href='?src=[REF(src)];item=[SLOT_HANDCUFFED]'><span class='warning'>[m1] tied up with \a [handcuffed]!</span></A>"

	if(legcuffed)
		. += "<A href='?src=[REF(src)];item=[SLOT_LEGCUFFED]'><span class='warning'>[m3] \a [legcuffed] around [m2] legs!</span></A>"

	//Gets encapsulated with a warning span
	var/list/msg = list()

	var/appears_dead = FALSE
	if(stat == DEAD || (HAS_TRAIT(src, TRAIT_FAKEDEATH)))
		appears_dead = TRUE

	var/temp = getBruteLoss() + getFireLoss() //no need to calculate each of these twice

	if(!(user == src && src.hal_screwyhud == SCREWYHUD_HEALTHY)) //fake healthy
		// Damage
		switch(temp)
			if(5 to 25)
				msg += "[m1] a little wounded."
			if(25 to 50)
				msg += "[m1] wounded."
			if(50 to 100)
				msg += "<B>[m1] severely wounded.</B>"
			if(100 to INFINITY)
				msg += span_danger("[m1] gravely wounded.")

	// Blood volume
	switch(blood_volume)
		if(-INFINITY to BLOOD_VOLUME_SURVIVE)
			msg += span_artery("<B>[m1] extremely pale and sickly.</B>")
		if(BLOOD_VOLUME_SURVIVE to BLOOD_VOLUME_BAD)
			msg += span_artery("<B>[m1] very pale.</B>")
		if(BLOOD_VOLUME_BAD to BLOOD_VOLUME_OKAY)
			msg += span_artery("[m1] pale.")
		if(BLOOD_VOLUME_OKAY to BLOOD_VOLUME_SAFE)
			msg += span_artery("[m1] a little pale.")


	// Bleeding
	var/bleed_rate = get_bleed_rate()
	if(bleed_rate)
		var/bleed_wording = "bleeding"
		switch(bleed_rate)
			if(0 to 1)
				bleed_wording = "bleeding slightly"
			if(1 to 5)
				bleed_wording = "bleeding"
			if(5 to 10)
				bleed_wording = "bleeding a lot"
			if(10 to INFINITY)
				bleed_wording = "bleeding profusely"
		var/list/bleeding_limbs = list()
		var/static/list/bleed_zones = list(
			BODY_ZONE_HEAD,
			BODY_ZONE_CHEST,
			BODY_ZONE_R_ARM,
			BODY_ZONE_L_ARM,
			BODY_ZONE_R_LEG,
			BODY_ZONE_L_LEG,
		)
		for(var/bleed_zone in bleed_zones)
			var/obj/item/bodypart/bleeder = get_bodypart(bleed_zone)
			if(!bleeder?.get_bleed_rate() || (!observer_privilege && !get_location_accessible(src, bleeder.body_zone)))
				continue
			bleeding_limbs += parse_zone(bleeder.body_zone)
		if(length(bleeding_limbs))
			if(bleed_rate >= 5)
				msg += span_bloody("<B>[capitalize(m2)] [english_list(bleeding_limbs)] [bleeding_limbs.len > 1 ? "are" : "is"] [bleed_wording]!</B>")
			else
				msg += span_bloody("[capitalize(m2)] [english_list(bleeding_limbs)] [bleeding_limbs.len > 1 ? "are" : "is"] [bleed_wording]!")
		else
			if(bleed_rate >= 5)
				msg += span_bloody("<B>[m1] [bleed_wording]</B>!")
			else
				msg += span_bloody("[m1] [bleed_wording]!")

	// Missing limbs
	var/missing_head = FALSE
	var/list/missing_limbs = list()
	for(var/missing_zone in get_missing_limbs())
		if(missing_zone == BODY_ZONE_HEAD)
			missing_head = TRUE
		missing_limbs += parse_zone(missing_zone)

	if(length(missing_limbs))
		var/missing_limb_message = "<B>[capitalize(m2)] [english_list(missing_limbs)] [missing_limbs.len > 1 ? "are" : "is"] gone.</B>"
		if(missing_head)
			missing_limb_message = span_dead("[missing_limb_message]")
		else
			missing_limb_message = span_danger("[missing_limb_message]")
		msg += missing_limb_message

	//Grabbing
	if(pulledby && pulledby.grab_state)
		msg += "[m1] being grabbed by [pulledby]."

	//Nutrition
	if(nutrition < (NUTRITION_LEVEL_STARVING - 50))
		msg += "[m1] looking starved."
//	else if(nutrition >= NUTRITION_LEVEL_FAT)
//		if(user.nutrition < NUTRITION_LEVEL_STARVING - 50)
//			msg += "[t_He] [t_is] plump and delicious looking - Like a fat little piggy. A tasty piggy."
//		else
//			msg += "[t_He] [t_is] quite chubby."

	//Fire/water stacks
	if(fire_stacks > 0)
		msg += "[m1] covered in something flammable."
	else if(fire_stacks < 0)
		msg += "[m1] soaked."

	//Status effects
	var/list/status_examines = status_effect_examines()
	if(length(status_examines))
		msg += status_examines

	//Disgusting behemoth of stun absorption
	if(islist(stun_absorption))
		for(var/i in stun_absorption)
			if(stun_absorption[i]["end_time"] > world.time && stun_absorption[i]["examine_message"])
				msg += "[m1][stun_absorption[i]["examine_message"]]"

	if(!appears_dead)
		if(!skipface)
			//Disgust
			switch(disgust)
				if(DISGUST_LEVEL_SLIGHTLYGROSS to DISGUST_LEVEL_GROSS)
					msg += "[m1] a little disgusted."
				if(DISGUST_LEVEL_GROSS to DISGUST_LEVEL_VERYGROSS)
					msg += "[m1] disgusted."
				if(DISGUST_LEVEL_VERYGROSS to DISGUST_LEVEL_DISGUSTED)
					msg += "[m1] really disgusted."
				if(DISGUST_LEVEL_DISGUSTED to INFINITY)
					msg += "<B>[m1] extremely disgusted.</B>"

			//Drunkenness
			switch(drunkenness)
				if(11 to 21)
					msg += "[m1] slightly flushed."
				if(21.01 to 41) //.01s are used in case drunkenness ends up to be a small decimal
					msg += "[m1] flushed."
				if(41.01 to 51)
					msg += "[m1] quite flushed and [m2] breath smells of alcohol."
				if(51.01 to 61)
					msg += "[m1] very flushed, with breath reeking of alcohol."
				if(61.01 to 91)
					msg += "[m1] looking like a drunken mess."
				if(91.01 to INFINITY)
					msg += "[m1] a shitfaced, slobbering wreck."

			//Stress
			var/stress = get_stress_amount()
			if(HAS_TRAIT(user, TRAIT_EMPATH))
				switch(stress)
					if(20 to INFINITY)
						msg += "[m1] extremely stressed."
					if(10 to 19)
						msg += "[m1] very stressed."
					if(1 to 9)
						msg += "[m1] a little stressed."
					if(-9 to 0)
						msg += "[m1] not stressed."
					if(-19 to -10)
						msg += "[m1] somewhat at peace."
					if(-20 to INFINITY)
						msg += "[m1] at peace inside."
			else if(stress > 10)
				msg += "[m3] stress all over [m2] face."

		//Jitters
		switch(jitteriness)
			if(300 to INFINITY)
				msg += "<B>[m1] convulsing violently!</B>"
			if(200 to 300)
				msg += "[m1] extremely jittery."
			if(100 to 200)
				msg += "[m1] twitching ever so slightly."

		if(InCritical())
			msg += span_warning("[m1] barely conscious.")
		else
			if(stat >= UNCONSCIOUS)
				msg += "[m1] [IsSleeping() ? "sleeping" : "unconscious"]."
			else if(eyesclosed)
				msg += "[capitalize(m2)] eyes are closed."
			else if(has_status_effect(/datum/status_effect/debuff/sleepytime))
				msg += "[m1] looking a little tired."
	else
		msg += "[m1] unconscious."
//		else
//			if(HAS_TRAIT(src, TRAIT_DUMB))
//				msg += "[m3] a stupid expression on [m2] face."
//			if(InCritical())
//				msg += "[m1] barely conscious."
//		if(getorgan(/obj/item/organ/brain))
//			if(!key)
//				msg += span_deadsay("[m1] totally catatonic. The stresses of life in deep-space must have been too much for [t_him]. Any recovery is unlikely.")
//			else if(!client)
//				msg += "[m3] a blank, absent-minded stare and appears completely unresponsive to anything. [t_He] may snap out of it soon."

	if(length(msg))
		. += span_warning("[msg.Join("\n")]")

	// Show especially large embedded objects at a glance
	for(var/obj/item/bodypart/part in bodyparts)
		if (LAZYLEN(part.embedded_objects))
			for(var/obj/item/stuck_thing in part.embedded_objects)
				if (stuck_thing.w_class >= WEIGHT_CLASS_SMALL)
					. += span_bloody("<b>[m3] \a [stuck_thing] stuck in [m2] [part.name]!</b>")

	if((user != src) && isliving(user))
		var/mob/living/L = user
		var/final_str = STASTR
		if(HAS_TRAIT(src, TRAIT_DECEIVING_MEEKNESS))
			final_str = 5
		var/strength_diff = final_str - L.STASTR
		switch(strength_diff)
			if(5 to INFINITY)
				. += span_warning("<B>[t_He] look[p_s()] much stronger than I.</B>")
			if(1 to 5)
				. += span_warning("[t_He] look[p_s()] stronger than I.")
			if(0)
				. += "[t_He] look[p_s()] about as strong as I."
			if(-5 to -1)
				. += span_warning("[t_He] look[p_s()] weaker than I.")
			if(-INFINITY to -5)
				. += span_warning("<B>[t_He] look[p_s()] much weaker than I.</B>")
			
	if((HAS_TRAIT(user,TRAIT_INTELLECTUAL)))
		var/mob/living/L = user
		var/final_int = STAINT
		var/addition
		if(HAS_TRAIT(src, TRAIT_DECEIVING_MEEKNESS))
			addition = " [t_He] tries to hide it."
		var/int_diff = final_int - L.STAINT
		switch(int_diff)
			if(5 to INFINITY)
				. += span_revenwarning("[t_He] look[p_s()] far more intelligent than I.")
			if(2 to 5)
				. += span_revenminor("[t_He] look[p_s()] smarter than I.")
			if(-1 to 1)
				. += "[t_He] look[p_s()] about as intelligent as I."
			if(-5 to -2)
				. += span_revennotice("[t_He] look[p_s()] dumber than I.")
			if(-INFINITY to -5)
				. += span_revennotice("[t_He] look[p_s()] as blunt-minded as a rock.")
		if(addition)
			. += addition

		//The Nymphomaniac Underground
		if((!appears_dead) && stat == CONSCIOUS && src.has_flaw(/datum/charflaw/addiction/lovefiend))
			var/datum/charflaw/addiction/bonercheck = src.charflaw
			if((bonercheck) && (bonercheck.sated == 0))
				if(user.has_flaw(/datum/charflaw/addiction/lovefiend)) //Takes one to know one
					switch(rand(1,5))
						if(1)
							. += span_love("I can sense [m2] <B>need</B> for a good time.")
						if(2)
							. += span_love("[m1] <B>aching</B> for a release.")
						if(3)
							. += span_love("A carnal hunger <B>stirs</B> within [m2] core.")
						if(4)
							. += span_love("I can practically hear the <B>thrum</B> of [m2] heartbeat.")
						if(5)
							. += span_love("Embers of desire <B>smolder</B> within [m2] eyes.")
					user.advance_addiction(60) //Don't look now!
				else if(Adjacent(user)) //No nympho, but close enough to notice.
					switch(rand(1,4))
						if(1)
							. += span_love("[m1] blushing quite fiercely.")
						if(2)
							. += span_love("I can see [m2] face is flushed.")
						if(3)
							. += span_love("[m3] an odd way of breathing.")
						if(4)
							. += span_love("[m1] restless, for some reason.")

	if(maniac)
		var/obj/item/organ/heart/heart = getorganslot(ORGAN_SLOT_HEART)
		if(heart?.inscryption && (heart.inscryption_key in maniac.key_nums))
			. += span_danger("[t_He] know[p_s()] [heart.inscryption_key], I AM SURE OF IT!")

	if(Adjacent(user))
		if(observer_privilege)
			var/static/list/check_zones = list(
				BODY_ZONE_HEAD,
				BODY_ZONE_CHEST,
				BODY_ZONE_R_ARM,
				BODY_ZONE_L_ARM,
				BODY_ZONE_R_LEG,
				BODY_ZONE_L_LEG,
			)
			for(var/zone in check_zones)
				var/obj/item/bodypart/bodypart = get_bodypart(zone)
				if(!bodypart)
					continue
				. += "<a href='?src=[REF(src)];inspect_limb=[zone]'>Inspect [parse_zone(zone)]</a>"
			. += "<a href='?src=[REF(src)];check_hb=1'>Check Heartbeat</a>"
		else
			var/checked_zone = check_zone(user.zone_selected)
			. += "<a href='?src=[REF(src)];inspect_limb=[checked_zone]'>Inspect [parse_zone(checked_zone)]</a>"
			if(!(mobility_flags & MOBILITY_STAND) && user != src && (user.zone_selected == BODY_ZONE_CHEST))
				. += "<a href='?src=[REF(src)];check_hb=1'>Listen to Heartbeat</a>"

	if((!obscure_name || client?.prefs.masked_examine) && (flavortext || headshot_link || ooc_notes))
		. += "<a href='?src=[REF(src)];task=view_headshot;'>Examine closer</a>"
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(get_dist(src, H) <= 2 + clamp(floor(((H.STAPER - 10) / 2)),-1, 2) && (!obscure_name || client?.prefs.masked_examine))
			. += "<a href='?src=[REF(src)];task=assess;'>Assess</a>"

	var/list/lines = build_cool_description(get_mob_descriptors(obscure_name, user), src)
	for(var/line in lines)
		. += span_info(line)

	var/trait_exam = common_trait_examine()
	if(!isnull(trait_exam))
		. += trait_exam

	var/traitstring = get_trait_string()

	var/perpname = get_face_name(get_id_name(""))
	if(perpname && (HAS_TRAIT(user, TRAIT_SECURITY_HUD) || HAS_TRAIT(user, TRAIT_MEDICAL_HUD)))
		var/datum/data/record/R = find_record("name", perpname, GLOB.data_core.general)
		if(R)
			. += "<span class='deptradio'>Rank:</span> [R.fields["rank"]]\n<a href='?src=[REF(src)];hud=1;photo_front=1'>\[Front photo\]</a><a href='?src=[REF(src)];hud=1;photo_side=1'>\[Side photo\]</a>"
		if(HAS_TRAIT(user, TRAIT_MEDICAL_HUD))
			var/cyberimp_detect
			for(var/obj/item/organ/cyberimp/CI in internal_organs)
				if(CI.status == ORGAN_ROBOTIC && !CI.syndicate_implant)
					cyberimp_detect += "[name] is modified with a [CI.name]."
			if(cyberimp_detect)
				. += "Detected cybernetic modifications:"
				. += cyberimp_detect
			if(R)
				var/health_r = R.fields["p_stat"]
				. += "<a href='?src=[REF(src)];hud=m;p_stat=1'>\[[health_r]\]</a>"
				health_r = R.fields["m_stat"]
				. += "<a href='?src=[REF(src)];hud=m;m_stat=1'>\[[health_r]\]</a>"
			R = find_record("name", perpname, GLOB.data_core.medical)
			if(R)
				. += "<a href='?src=[REF(src)];hud=m;evaluation=1'>\[Medical evaluation\]</a><br>"
			if(traitstring)
				. += "<span class='info'>Detected physiological traits:\n[traitstring]"

		if(HAS_TRAIT(user, TRAIT_SECURITY_HUD))
			if(!user.stat && user != src)
			//|| !user.canmove || user.restrained()) Fluff: Sechuds have eye-tracking technology and sets 'arrest' to people that the wearer looks and blinks at.
				var/criminal = "None"

				R = find_record("name", perpname, GLOB.data_core.security)
				if(R)
					criminal = R.fields["criminal"]

				. += "<span class='deptradio'>Criminal status:</span> <a href='?src=[REF(src)];hud=s;status=1'>\[[criminal]\]</a>"
				. += jointext(list("<span class='deptradio'>Security record:</span> <a href='?src=[REF(src)];hud=s;view=1'>\[View\]</a>",
					"<a href='?src=[REF(src)];hud=s;add_crime=1'>\[Add crime\]</a>",
					"<a href='?src=[REF(src)];hud=s;view_comment=1'>\[View comment log\]</a>",
					"<a href='?src=[REF(src)];hud=s;add_comment=1'>\[Add comment\]</a>"), "")
	. += "ø ------------ ø</span>"

/mob/living/proc/status_effect_examines(pronoun_replacement) //You can include this in any mob's examine() to show the examine texts of status effects!
	var/list/dat = list()
	if(!pronoun_replacement)
		pronoun_replacement = p_they(TRUE)
	for(var/V in status_effects)
		var/datum/status_effect/E = V
		if(E.examine_text)
			var/new_text = replacetext(E.examine_text, "SUBJECTPRONOUN", pronoun_replacement)
			new_text = replacetext(new_text, "[pronoun_replacement] is", "[pronoun_replacement] [p_are()]") //To make sure something become "They are" or "She is", not "They are" and "She are"
			dat += "[new_text]\n" //dat.Join("\n") doesn't work here, for some reason
	if(dat.len)
		return dat.Join()

/// Returns patron-related examine text for the mob, if any. Can return null.
/mob/living/proc/get_heretic_text(mob/examiner)
	var/heretic_text
	if(HAS_TRAIT(src, TRAIT_COMMIE) && HAS_TRAIT(examiner, TRAIT_COMMIE))
		heretic_text += "Comrade!"
	else if(HAS_TRAIT(src, TRAIT_CABAL) && HAS_TRAIT(examiner, TRAIT_CABAL))
		heretic_text += "Another of the Cabal!"
	else if(HAS_TRAIT(src, TRAIT_HORDE) && HAS_TRAIT(examiner, TRAIT_HORDE))
		heretic_text += "Anointed!"
	else if(HAS_TRAIT(src, TRAIT_DEPRAVED) && HAS_TRAIT(examiner, TRAIT_DEPRAVED))
		heretic_text += "Debased!"
	
	return heretic_text

/// Same as get_heretic_text, but returns a simple symbol depending on the type of heretic!
/mob/living/proc/get_heretic_symbol(mob/examiner)
	var/heretic_text
	if(HAS_TRAIT(src, TRAIT_COMMIE) && HAS_TRAIT(examiner, TRAIT_COMMIE))
		heretic_text += "♠"
	else if(HAS_TRAIT(src, TRAIT_CABAL) && HAS_TRAIT(examiner, TRAIT_CABAL))
		heretic_text += "♦"
	else if(HAS_TRAIT(src, TRAIT_HORDE) && HAS_TRAIT(examiner, TRAIT_HORDE))
		heretic_text += "♠"
	else if(HAS_TRAIT(src, TRAIT_DEPRAVED) && HAS_TRAIT(examiner, TRAIT_DEPRAVED))
		heretic_text += "♥"
	
	return heretic_text


// Used for Inquisition tags
/mob/living/proc/get_inquisition_text(mob/examiner)
	var/inquisition_text
	if(HAS_TRAIT(src, TRAIT_INQUISITION) && HAS_TRAIT(examiner, TRAIT_INQUISITION))
		inquisition_text += "Fellow Member of the Inquisition"

	return inquisition_text

/// Returns antagonist-related examine text for the mob, if any. Can return null.
/mob/living/proc/get_villain_text(mob/examiner)
	var/villain_text
	if(mind)
		if(mind.special_role == "Bandit")
			if(HAS_TRAIT(examiner, TRAIT_COMMIE))
				villain_text = span_notice("Free man!")
			/*else
				villain_text = span_userdanger("BANDIT!")*/
		if(mind.special_role == "Vampire Lord")
			var/datum/antagonist/vampirelord/VD = mind.has_antag_datum(/datum/antagonist/vampirelord)
			if(VD) 
				if(!VD.disguised)
					villain_text += span_userdanger("A MONSTER!")
		if(mind.assigned_role == "Lunatic")
			villain_text += span_userdanger("LUNATIC!")

	return villain_text

/obj/machinery/light/rogue/cauldron
	name = "cauldron"
	desc = "Double, double toil and trouble. A great iron cauldron for brewing potions."
	icon = 'icons/roguetown/misc/alchemy.dmi'
	icon_state = "cauldron1"
	base_state = "cauldron"
	density = TRUE
	opacity = FALSE
	anchored = TRUE
	max_integrity = 300
	var/list/ingredients = list()
	var/maxingredients = 4
	var/brewing = 0
	var/mob/living/carbon/human/lastuser
	fueluse = 20 MINUTES
	crossfire = FALSE

/obj/machinery/light/rogue/cauldron/update_icon()
	..()
	cut_overlays()
	if(reagents.total_volume > 0)
		if(!brewing)
			var/mutable_appearance/filling = mutable_appearance('icons/roguetown/misc/alchemy.dmi', "cauldron_full")
			filling.color = mix_color_from_reagents(reagents.reagent_list)
			filling.alpha = mix_alpha_from_reagents(reagents.reagent_list)
			add_overlay(filling)
		if(brewing > 0)
			var/mutable_appearance/filling = mutable_appearance('icons/roguetown/misc/alchemy.dmi', "cauldron_boiling")
			filling.color = mix_color_from_reagents(reagents.reagent_list)
			filling.alpha = mix_alpha_from_reagents(reagents.reagent_list)
			add_overlay(filling)
	return

/obj/machinery/light/rogue/cauldron/Initialize()
	create_reagents(500, DRAINABLE | AMOUNT_VISIBLE | REFILLABLE)
	. = ..()

/obj/machinery/light/rogue/cauldron/Destroy()
	chem_splash(loc, 2, list(reagents))
	qdel(reagents)
	..()

/obj/machinery/light/rogue/cauldron/burn_out()
	brewing = 0
	..()

/*
/obj/machinery/light/rogue/cauldron/examine(mob/user)
	if(ingredients.len)//ingredients.len
		DISABLE_BITFIELD(reagents.flags, AMOUNT_VISIBLE)
	else
		ENABLE_BITFIELD(reagents.flags, AMOUNT_VISIBLE)
	. = ..()
*/

/obj/machinery/light/rogue/cauldron/process()
	..()
	update_icon()
	if(on)
		if(ingredients.len)
			if(brewing < 20)
				if(prob(10))
					playsound(src, "bubbles", 100, FALSE)
				brewing++
			else if(brewing == 20)
				var/datum/alchemy_recipe/found_recipe = find_recipe()
				if(found_recipe != null)
					for(var/obj/item/ing in src.ingredients)
						qdel(ing)
					if(reagents)
						var/in_cauldron = src.reagents.get_reagent_amount(found_recipe.required_base)
						src.reagents.remove_reagent(found_recipe.required_base, in_cauldron)
					if(found_recipe.output_reagents.len)
						src.reagents.add_reagent_list(found_recipe.output_reagents)
					if(found_recipe.output_items.len)
						for(var/itempath in found_recipe.output_items)
							new itempath(get_turf(src))
					//handle player perception and reset for next time
					src.visible_message("<span class='info'>The cauldron finishes boiling with a faint [found_recipe.smells_like] smell.</span>")
					//give xp for /datum/skill/craft/alchemy
					var/boon = lastuser.mind?.get_learning_boon(/datum/skill/craft/alchemy)
					var/amt2raise = lastuser.STAINT*2
					lastuser?.mind?.adjust_experience(/datum/skill/craft/alchemy, amt2raise * boon, FALSE)
					playsound(src, "bubbles", 100, TRUE)
					playsound(src,'sound/misc/smelter_fin.ogg', 30, FALSE)
					ingredients = list()
					brewing = 21
				else
					brewing = 0
					src.visible_message("<span class='info'>The ingredients in the [src] fail to meld together at all...</span>")
					playsound(src,'sound/misc/smelter_fin.ogg', 30, FALSE)

///Loops through all alch recipes and returns the first it finds that matches.
/obj/machinery/light/rogue/cauldron/proc/find_recipe()
	for(var/datum/alchemy_recipe/possible_recipe in GLOB.alchemy_recipes)
		if(!src.reagents.has_reagent(possible_recipe.required_base,possible_recipe.required_base_amount))
			continue
		for(var/needed in possible_recipe.required_items)
			var/found = 0
			var/total_needed = possible_recipe.required_items[needed]
			if(!total_needed)
				total_needed = 1 //We're gonna assume they just needed one.
			for(var/obj/item/in_caul in src.ingredients)
				if(istype(in_caul,needed))
					found++
			if(found < total_needed)
				continue
		//everything matches up, this is probably it.
		return possible_recipe
	return null //we didnt find anything....

/obj/machinery/light/rogue/cauldron/attackby(obj/item/I, mob/user, params)
	if(!istype(I,/obj/item/reagent_containers/glass)) //I hate this.
		if(ingredients.len >= maxingredients)
			to_chat(user, "<span class='warning'>Nothing else can fit.</span>")
			return TRUE
		if(!user.transferItemToLoc(I,src))
			to_chat(user, "<span class='warning'>[I] is stuck to my hand!</span>")
			return TRUE
		to_chat(user, "<span class='info'>I add [I] to [src].</span>")
		ingredients += I
		brewing = 0
		lastuser = user
		playsound(src, "bubbles", 100, TRUE)
		cut_overlays()
		var/mutable_appearance/filling = mutable_appearance('icons/roguetown/misc/alchemy.dmi', "cauldron_boiling")
		filling.color = mix_color_from_reagents(reagents.reagent_list)
		filling.alpha = mix_alpha_from_reagents(reagents.reagent_list)
		add_overlay(filling)
		sleep(30)
		update_icon()
		return TRUE
	..()

/obj/machinery/light/rogue/cauldron/attack_hand(mob/user, params)
	if(on)
		if(ingredients.len)
			to_chat(user, "<span class='warning'>Something's brewing.</span>")
			return
		else
			to_chat(user, "<span class='info'>Nothing's brewing.</span>")
			return
	else
		if(ingredients.len)
			var/obj/item/I = ingredients[ingredients.len]
			ingredients -= I
			I.loc = user.loc
			user.put_in_active_hand(I)
			user.visible_message("<span class='info'>[user] pulls [I] from [src].</span>")
			return
		to_chat(user, "<span class='info'>It's empty.</span>")
		return ..()

/obj/machinery/light/rogue/cauldron/onkick(mob/user)
	if(ingredients.len)
		for(var/obj/item/in_caul in ingredients)
			ingredients -= in_caul
			in_caul.forceMove(get_turf(user))
		chem_splash(loc, 2, list(reagents))
		user.visible_message("<span class='info'>[user] kicks [src],spilling it's contents!</span>")
	playsound(src, 'sound/items/beartrap2.ogg', 100, FALSE)
	return ..()

/datum/crafting_recipe/roguetown/sewing
	tools = list(/obj/item/needle)
	skillcraft = /datum/skill/misc/sewing

/* craftdif of 0 */

/datum/crafting_recipe/roguetown/sewing/headband
	name = "headband"
	result = list(/obj/item/clothing/head/roguetown/headband)
	reqs = list(/obj/item/natural/cloth = 1)
	craftdiff = 0

/datum/crafting_recipe/roguetown/sewing/maid_headband
	name = "maid headband"
	result = list(/obj/item/clothing/head/roguetown/maid)
	reqs = list(/obj/item/natural/cloth = 1)
	craftdiff = 0

/datum/crafting_recipe/roguetown/sewing/maid_dress
	name = "maid dress"
	result = list(/obj/item/clothing/suit/roguetown/shirt/undershirt/maid_dress)
	reqs = list(/obj/item/natural/cloth = 3)
	craftdiff = 0

/datum/crafting_recipe/roguetown/sewing/peasantcap
	name = "peasant cap"
	result = list(/obj/item/clothing/head/roguetown/armingcap)
	reqs = list(/obj/item/natural/cloth = 1)
	craftdiff = 0

/datum/crafting_recipe/roguetown/sewing/apron_waist
	name = "waist apron"
	result = list(/obj/item/clothing/cloak/apron/waist)
	reqs = list(/obj/item/natural/cloth = 3) // 3 because it thas a storage, but it really just a apron.
	craftdiff = 0

/datum/crafting_recipe/roguetown/sewing/apron/blacksmith
	name = "leather apron"
	result = list(/obj/item/clothing/cloak/apron/blacksmith)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/hide = 1)
	craftdiff = 0

/datum/crafting_recipe/roguetown/sewing/rags
	name = "rags"
	result = list(/obj/item/clothing/suit/roguetown/shirt/rags)
	reqs = list(/obj/item/natural/cloth = 2)
	craftdiff = 0

/datum/crafting_recipe/roguetown/sewing/burial_shroud
	name = "winding sheet"
	result = list(/obj/item/burial_shroud)
	reqs = list(/obj/item/natural/cloth = 2)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/loincloth
	name = "loincloth"
	result = list(/obj/item/clothing/under/roguetown/loincloth)
	reqs = list(/obj/item/natural/cloth = 1)
	craftdiff = 0

/datum/crafting_recipe/roguetown/sewing/ragglove
	name = "hand wrappings - (cloth; NONE)"
	result = list(/obj/item/clothing/gloves/roguetown/wrap)
	reqs = list(/obj/item/natural/cloth = 1)
	craftdiff = 0

/datum/crafting_recipe/roguetown/sewing/brownloincloth
	name = "brown loincloth"
	result = list(/obj/item/clothing/under/roguetown/loincloth/brown)
	reqs = list(/obj/item/natural/cloth = 1)
	craftdiff = 0


/datum/crafting_recipe/roguetown/sewing/linedanklet
	name = "cloth anklet"
	result = list(/obj/item/clothing/shoes/roguetown/boots/clothlinedanklets)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 2)
	craftdiff = 0

/* craftdif of 1 */

/datum/crafting_recipe/roguetown/sewing/clothgloves
	name = "cloth gloves"
	result = list(/obj/item/clothing/gloves/roguetown/fingerless)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/tunic
	name = "tunic"
	result = list(/obj/item/clothing/suit/roguetown/shirt/tunic/white)
	reqs = list(/obj/item/natural/cloth = 2)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/clothshirt
	name = "cloth shirt"
	result = list(/obj/item/clothing/suit/roguetown/shirt/undershirt)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/clothtrou
	name = "cloth trousers"
	result = list(/obj/item/clothing/under/roguetown/trou)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/longcoat
	name = "longcoat"
	result = list(/obj/item/clothing/suit/roguetown/armor/longcoat)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 2)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/workervest
	name = "striped tunic"
	result = list(/obj/item/clothing/suit/roguetown/armor/workervest)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 2)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/tights
	name = "tights"
	result = list(/obj/item/clothing/under/roguetown/tights/random)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/Reyepatch
	name = "right eye patch"
	result = list(/obj/item/clothing/mask/rogue/eyepatch)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/Leyepatch
	name = "left eye patch"
	result = list(/obj/item/clothing/mask/rogue/eyepatch/left)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/knitcap
	name = "knit cap"
	result = list(/obj/item/clothing/head/roguetown/knitcap)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/strawhat
	name = "straw hat"
	result = list(/obj/item/clothing/head/roguetown/strawhat)
	reqs = list(/obj/item/natural/fibers = 3)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/sack
	name = "sack hood"
	result = list(/obj/item/clothing/head/roguetown/menacing)
	reqs = list(/obj/item/natural/cloth = 3,)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/basichood
	name = "hood"
	result = list(/obj/item/clothing/head/roguetown/roguehood)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/lgambeson
    name = "light gambeson"
    result = list(/obj/item/clothing/suit/roguetown/armor/gambeson/light)
    reqs = list(/obj/item/natural/cloth = 2,
                /obj/item/natural/fibers = 1)
    craftdiff = 1

/* craftdif of 2+ */

/datum/crafting_recipe/roguetown/sewing/wrappings
	name = "solar wrappings"
	result = list(/obj/item/clothing/wrists/roguetown/wrappings)
	reqs = list(/obj/item/natural/cloth = 2)
	craftdiff = 2

/datum/crafting_recipe/roguetown/sewing/nocwrappings
	name = "moon wrappings"
	result = list(/obj/item/clothing/wrists/roguetown/nocwrappings)
	reqs = list(/obj/item/natural/cloth = 2)
	craftdiff = 2

/datum/crafting_recipe/roguetown/sewing/nunveil
	name = "nun veil"
	result = list(/obj/item/clothing/head/roguetown/nun)
	reqs = list(/obj/item/natural/cloth = 1)
	craftdiff = 2
/datum/crafting_recipe/roguetown/sewing/fauld
	name = "fauld - (2 cloths, fiber; APPRENTICE)"
	result = list(/obj/item/clothing/cloak/fauld)
	reqs =  list(/obj/item/natural/cloth = 2,
                /obj/item/natural/fibers = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/sewing/fauld
	name = "battle skirt - (2 cloths, fiber; APPRENTICE)"
	result = list(/obj/item/clothing/cloak/fauld/battleskirt)
	reqs =  list(/obj/item/natural/cloth = 2,
                /obj/item/natural/fibers = 1)
	craftdiff = 2
/* craftdif of 3 = JOURNEYMAN */

/datum/crafting_recipe/roguetown/sewing/nunhabit
	name = "nun habit"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/nun)
	reqs = list(/obj/item/natural/cloth = 2)
	craftdiff = 2

/datum/crafting_recipe/roguetown/sewing/necramask
	name = "death mask"
	result = list(/obj/item/clothing/head/roguetown/necramask)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1,
				/obj/item/natural/bone = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/sewing/coif
	name = "coif"
	result = list(/obj/item/clothing/neck/roguetown/coif)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/tabard
	name = "tabard"
	result = list(/obj/item/clothing/cloak/tabard)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/stabard
	name = "surcoat"
	result = list(/obj/item/clothing/cloak/stabard)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/itharoth
	name = "Ao tabard"
	result = list(/obj/item/clothing/cloak/templar/psydon)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/astrata
	name = "radiant tabard"
	result = list(/obj/item/clothing/cloak/templar/astrata)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/noc
	name = "mystran tabard"
	result = list(/obj/item/clothing/cloak/templar/noc)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/dendor
	name = "Silvanus tabard"
	result = list(/obj/item/clothing/cloak/templar/dendor)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/necra
	name = "death tabard"
	result = list(/obj/item/clothing/cloak/templar/necra)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/abyssor
	name = "umberlee tabard"
	result = list(/obj/item/clothing/cloak/templar/abyssor)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/malum
	name = "moradin tabard"
	result = list(/obj/item/clothing/cloak/templar/malum)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/eora
	name = "Sune tabard"
	result = list(/obj/item/clothing/cloak/templar/eora)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/pestra
	name = "ilmaters tabard"
	result = list(/obj/item/clothing/cloak/templar/pestra)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/ravox
	name = "helm tabard"
	result = list(/obj/item/clothing/cloak/templar/ravox)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/xylix
	name = "Lucky tabard"
	result = list(/obj/item/clothing/cloak/templar/xylix)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/stabard/guard
	name = "guard surcoat"
	result = list(/obj/item/clothing/cloak/stabard/guard)

/datum/crafting_recipe/roguetown/sewing/stabard/bog
	name = "bog surcoat"
	result = list(/obj/item/clothing/cloak/stabard/bog)

/datum/crafting_recipe/roguetown/sewing/robe
	name = "robes"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/bardress
	name = "bar dress"
	result = list(/obj/item/clothing/suit/roguetown/shirt/dress)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/sewing/stockdress
	name = "dress"
	result = list(/obj/item/clothing/suit/roguetown/shirt/dress/gen)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/sewing/Bladress
	name = "black dress"
	result = list(/obj/item/clothing/suit/roguetown/shirt/dress/gen/black)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/sewing/Bludress
	name = "blue dress"
	result = list(/obj/item/clothing/suit/roguetown/shirt/dress/gen/blue)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/sewing/Purdress
	name = "purple dress"
	result = list(/obj/item/clothing/suit/roguetown/shirt/dress/gen/purple)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/sewing/fancyhat
	name = "fancy hat"
	result = list(/obj/item/clothing/head/roguetown/fancyhat)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 4
	sellprice = 14

/datum/crafting_recipe/roguetown/sewing/gambeson
	name = "gambeson"
	result = /obj/item/clothing/suit/roguetown/armor/gambeson
	reqs = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 1)
	tools = list(/obj/item/needle)
	craftdiff = 3
	sellprice = 20

/datum/crafting_recipe/roguetown/sewing/paddedcap
	name = "padded Cap"
	result = /obj/item/clothing/head/roguetown/paddedcap
	reqs = list(/obj/item/natural/fibers = 5)
	tools = list(/obj/item/needle)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/bardhat
	name = "bard hat"
	result = list(/obj/item/clothing/head/roguetown/bardhat)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 4
	sellprice = 14

/datum/crafting_recipe/roguetown/sewing/bucklehat
	name = "buckle hat"
	result = list(/obj/item/clothing/head/roguetown/bucklehat)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 4
	sellprice = 14

/datum/crafting_recipe/roguetown/sewing/archer
	name = "archer cap"
	result = list(/obj/item/clothing/head/roguetown/archercap)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 4
	sellprice = 14

/datum/crafting_recipe/roguetown/sewing/duelist
	name = "duelist hat"
	result = list(/obj/item/clothing/head/roguetown/duelhat)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 4
	sellprice = 14

/datum/crafting_recipe/roguetown/sewing/witchhat
	name = "witch hat"
	result = list(/obj/item/clothing/head/roguetown/witchhat)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 4
	sellprice = 14

/datum/crafting_recipe/roguetown/sewing/hgambeson
    name = "padded gambeson"
    result = list(/obj/item/clothing/suit/roguetown/armor/gambeson/heavy)
    reqs = list(/obj/item/natural/cloth = 6,
                /obj/item/natural/fibers = 4)
    craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/chaperon
	name = "chaperon hat"
	result = list(/obj/item/clothing/head/roguetown/chaperon)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 4
	sellprice = 14

/datum/crafting_recipe/roguetown/sewing/jupon
	name = "jupon"
	result = list(/obj/item/clothing/cloak/stabard/surcoat)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/sewing/armordress
	name = "armored dress"
	result = list(/obj/item/clothing/suit/roguetown/armor/armordress)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1,
				/obj/item/natural/hide = 1)
	craftdiff = 3
	sellprice = 30

/datum/crafting_recipe/roguetown/sewing/ragmask
	name = "rag mask"
	result = list(/obj/item/clothing/mask/rogue/ragmask)
	reqs = list(/obj/item/natural/cloth = 1)
	craftdiff = 0
	sellprice = 3

/datum/crafting_recipe/roguetown/sewing/cape
	name = "cape"
	result = list(/obj/item/clothing/cloak/cape)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3
	sellprice = 12

/datum/crafting_recipe/roguetown/sewing/sexydress
	name = "sexy dress of legendary sewists"
	result = list(/obj/item/clothing/suit/roguetown/shirt/dress/gen/sexy)
	reqs = list(/obj/item/natural/cloth = 6,
				/obj/item/natural/fibers = 3)
	craftdiff = 6
	sellprice = 25

/datum/crafting_recipe/roguetown/sewing/wizhatblue
	name = "blue wizard hat"
	result = list(/obj/item/clothing/head/roguetown/wizhat)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3
	sellprice = 12

/datum/crafting_recipe/roguetown/sewing/wizhatred
	name = "red wizard hat"
	result = list(/obj/item/clothing/head/roguetown/wizhat/red)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3
	sellprice = 12

/datum/crafting_recipe/roguetown/sewing/wizhatyellow
	name = "yellow wizard hat"
	result = list(/obj/item/clothing/head/roguetown/wizhat/yellow)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3
	sellprice = 12

/datum/crafting_recipe/roguetown/sewing/wizhatgreen
	name = "green wizard hat"
	result = list(/obj/item/clothing/head/roguetown/wizhat/green)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3
	sellprice = 12

/datum/crafting_recipe/roguetown/sewing/wizhatblack
	name = "black wizard hat"
	result = list(/obj/item/clothing/head/roguetown/wizhat/black)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3
	sellprice = 12

/datum/crafting_recipe/roguetown/sewing/cape/desert
	name = "desert cape"
	result = list(/obj/item/clothing/cloak/cape/crusader)
	reqs = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 2)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/cape/rider
	name = "rider cloak"
	result = list(/obj/item/clothing/cloak/half/rider)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/cape/half
	name = "half cloak"
	result = list(/obj/item/clothing/cloak/half)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/undervestments
	name = "undervestments"
	result = list(/obj/item/clothing/suit/roguetown/shirt/undershirt/priest)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/keffiyeh
	name = "Keffiyeh"
	result = list(/obj/item/clothing/head/roguetown/roguehood/shalal)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/hijab
	name = "Hijab"
	result = list(/obj/item/clothing/head/roguetown/roguehood/shalal/hijab)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/heavyhood
	name = "Heavy Hood"
	result = list(/obj/item/clothing/head/roguetown/roguehood/shalal/heavyhood)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

//////////////////////////////////////////
// Fogislander Cultured Crafting Area,  //
//////////////////////////////////////////


/datum/crafting_recipe/roguetown/sewing/yugake
	name = "yugake gloves {fl}"
	result = list(/obj/item/clothing/gloves/roguetown/fingerless/yugake)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)

/datum/crafting_recipe/roguetown/sewing/monkgarb
	name = "monk garbs {fl}"
	result = list(/obj/item/clothing/suit/roguetown/shirt/rags/monkgarb)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)

/datum/crafting_recipe/roguetown/sewing/kimono
	name = "kimono {fl}"
	result = list(/obj/item/clothing/suit/roguetown/shirt/tunic/kimono)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)

/datum/crafting_recipe/roguetown/sewing/kamishimo
	name = "kamishimo upperside {fl}"
	result = list(/obj/item/clothing/suit/roguetown/shirt/tunic/kamishimo)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)

/datum/crafting_recipe/roguetown/sewing/hakama
	name = "hakama {fl}"
	result = list(/obj/item/clothing/under/roguetown/tights/hakama)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)

/datum/crafting_recipe/roguetown/sewing/takuhatsugasa
	name = "takuhatsugasa hat {fl}"
	result = list(/obj/item/clothing/head/roguetown/takuhatsugasa)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)

/datum/crafting_recipe/roguetown/sewing/torioigasa
	name = "torioigasa hat {fl}"
	result = list(/obj/item/clothing/head/roguetown/tengai/torioigasa)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 2)

/datum/crafting_recipe/roguetown/sewing/gasa
	name = "gasa hat {fl}"
	result = list(/obj/item/clothing/head/roguetown/tengai/gasa)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)

/datum/crafting_recipe/roguetown/sewing/lillys
	name = "small lilly {fl}"
	result = list(/obj/item/clothing/head/roguetown/lilly/small)
	reqs = list(/obj/item/natural/fibers = 3)

/datum/crafting_recipe/roguetown/sewing/lillym
	name = "medium lilly {fl}"
	result = list(/obj/item/clothing/head/roguetown/lilly/medium)
	reqs = list(/obj/item/natural/fibers = 4)

/datum/crafting_recipe/roguetown/sewing/lillyb
	name = "big lilly {fl}"
	result = list(/obj/item/clothing/head/roguetown/lilly/big)
	reqs = list(/obj/item/natural/fibers = 5)

/datum/crafting_recipe/roguetown/sewing/eyeband
	name = "eyeband"
	result = list(/obj/item/clothing/mask/rogue/kaizoku/eyeband)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)

/datum/crafting_recipe/roguetown/sewing/tribal
	name = "tribal garb {fl}"
	result = list(/obj/item/clothing/under/roguetown/kaizoku/tribal)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)

/*.............. recipes requiring skill 1 ..............*/

/datum/crafting_recipe/roguetown/sewing/tengai
	name = "tengai hat {fl}"
	result = list(/obj/item/clothing/head/roguetown/tengai)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 3)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/roningasa
	name = "roningasa hat {fl}"
	result = list(/obj/item/clothing/head/roguetown/tengai/roningasa)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 2)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/soheicloth
	name = "sohei headcovering {fl}"
	result = list(/obj/item/clothing/head/roguetown/soheicloth)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 2)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/sandogasa
	name = "sandogasa hat {fl}"
	result = list(/obj/item/clothing/head/roguetown/tengai/sandogasa)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 3)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/mino
	name = "mino cloak {fl}"
	result = list(/obj/item/clothing/cloak/raincloak/mino)
	reqs = list(/obj/item/natural/fibers = 8,
				/obj/item/natural/fibers = 2)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/tobi
	name = "tobi trousers {fl}"
	result = list(/obj/item/clothing/under/roguetown/trou/tobi)
	reqs = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/sewing/hitatare
	name = "light hitatare {fl}"
	result = list(/obj/item/clothing/suit/roguetown/armor/gambeson/light/hitatare)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 1

/*.............. recipes requiring skill 2 ..............*/

/datum/crafting_recipe/roguetown/sewing/ruankai
	name = "ruankai jacque {fl}"
	result = /obj/item/clothing/suit/roguetown/armor/gambeson/ruankai
	reqs = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 1)
	tools = list(/obj/item/needle)
	craftdiff = 2

/datum/crafting_recipe/roguetown/sewing/jinbaori
	name = "jinbaori {fl}"
	result = list(/obj/item/clothing/cloak/jinbaori)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/sewing/zukin
	name = "stealthy hood {fl}"
	result = list(/obj/item/clothing/head/roguetown/shinobi_zukin)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	craftdiff = 2
/*
/datum/crafting_recipe/roguetown/sewing/zubon
	name = "stealthy trousers {fl}"
	result = list(/obj/item/clothing/under/roguetown/trou/leather/shinobizubon)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 2)
	craftdiff = 2
*/
/*.............. recipes requiring skill 3 ..............*/

/datum/crafting_recipe/roguetown/sewing/onmyojigood
	name = "war onmyoji hat {fl}"
	result = list(/obj/item/clothing/head/roguetown/wizhat/onmyoji)
	reqs = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 3)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/onmyojigoofy
	name = "onmyoji hat {fl}"
	result = list(/obj/item/clothing/head/roguetown/wizhat/onmyoji/eboshi)
	reqs = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 3)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/guardiancape
	name = "guardianship cape {fl}"
	result = list(/obj/item/clothing/cloak/raincloak/guardiancloak)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/sewing/onmyojigoofy
	name = "haramaki bellyband {fl}"
	result = list(/obj/item/clothing/cloak/haramaki)
	reqs = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 3)
	craftdiff = 3

/* .............. recipes requiring skill 4 ..............*/

/datum/crafting_recipe/roguetown/sewing/heartfelthat
	name = "heartfelt hat {fl}"
	result = list(/obj/item/clothing/head/roguetown/bardhat/bloodhunter)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/sewing/odoshi
	name = "odoshi bodylacing {fl}"
	result = list(/obj/item/clothing/cloak/haramaki/odoshi)
	reqs = list(/obj/item/natural/cloth = 5,
				/obj/item/natural/fibers = 3)
	craftdiff = 4

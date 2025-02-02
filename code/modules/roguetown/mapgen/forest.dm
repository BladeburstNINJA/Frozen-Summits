//genstuff
/obj/effect/landmark/mapGenerator/rogue/forest
	mapGeneratorType = /datum/mapGenerator/forest
	endTurfX = 255
	endTurfY = 255
	startTurfX = 1
	startTurfY = 1


/datum/mapGenerator/forest
	modules = list(/datum/mapGeneratorModule/ambushing,/datum/mapGeneratorModule/forestgrassturf,/datum/mapGeneratorModule/forest,/datum/mapGeneratorModule/forestroad,/datum/mapGeneratorModule/forestgrass)


/datum/mapGeneratorModule/forest
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/dirt)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableAtoms = list(/obj/structure/flora/newtree = 30,
							/obj/structure/flora/roguegrass/bush = 55,
							/obj/structure/flora/roguegrass = 100,
							/obj/structure/flora/roguegrass/maneater = 13,
							/obj/structure/flora/roguegrass/herb/random = 75,
							/obj/structure/flora/roguegrass/swampweed = 32,
							/obj/structure/flora/roguegrass/pyroclasticflowers = 21,
							/obj/item/natural/stone = 23,
							/obj/item/natural/rock = 6,
							/obj/item/grown/log/tree/stick = 16,
							/obj/structure/flora/roguetree/stump/log = 3,
							/obj/structure/flora/roguetree/stump = 4,
							/obj/structure/closet/dirthole/closed/loot=3,
							/obj/structure/flora/roguegrass/maneater/real=3)
	spawnableTurfs = list(/turf/open/floor/rogue/dirt/road=2,
						/turf/open/water/swamp=1)
	allowed_areas = list(/area/rogue/outdoors/woods,/area/rogue/outdoors/shadow_fell)

/datum/mapGeneratorModule/forestroad
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableAtoms = list(/obj/item/natural/stone = 9,/obj/item/grown/log/tree/stick = 6)

/datum/mapGeneratorModule/forestgrassturf
	clusterCheckFlags = CLUSTER_CHECK_NONE
	allowed_turfs = list(/turf/open/floor/rogue/dirt)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableTurfs = list(/turf/open/floor/rogue/grass = 100)
	allowed_areas = list(/area/rogue/outdoors/woods,/area/rogue/outdoors/shadow_fell)

/datum/mapGeneratorModule/forestgrass
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/grass, /turf/open/floor/rogue/grassred, /turf/open/floor/rogue/grassyel, /turf/open/floor/rogue/grasscold)
	excluded_turfs = list()
	allowed_areas = list(/area/rogue/outdoors/woods,/area/rogue/outdoors/shadow_fell)
	spawnableAtoms = list(/obj/structure/flora/roguetree = 65,
							/obj/structure/flora/roguetree/wise=4,
							/obj/structure/flora/roguegrass/bush = 25,
							/obj/structure/flora/roguegrass = 100,
							/obj/structure/flora/roguegrass/maneater = 13,
							/obj/structure/flora/roguegrass/herb/random = 75,
							/obj/structure/flora/roguegrass/maneater/real=2,
							/obj/structure/flora/roguegrass/swampweed = 15,
							/obj/item/natural/stone = 21,
							/obj/item/natural/rock = 10,
							/obj/item/grown/log/tree/stick = 21,
							/obj/structure/flora/roguetree/stump/log = 21)

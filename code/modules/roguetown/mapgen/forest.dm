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
							/obj/structure/flora/roguegrass/bush = 25,
							/obj/structure/flora/roguegrass = 100,
							/obj/structure/flora/roguegrass/herb/random = 15,
							/obj/structure/flora/roguegrass/maneater = 13,
							/obj/structure/flora/roguegrass/swampweed = 15,
							/obj/structure/flora/roguegrass/pyroclasticflowers = 5,
							/obj/item/natural/stone = 23,
							/obj/item/natural/rock = 6,
							/obj/item/grown/log/tree/stick = 16,
							/obj/structure/flora/roguetree/stump/log = 7,
							/obj/structure/flora/roguetree/stump = 7,
							/obj/structure/closet/dirthole/closed/loot=7,
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
	spawnableTurfs = list(/turf/open/floor/rogue/grass = 200)
	allowed_areas = list(/area/rogue/outdoors/woods,/area/rogue/outdoors/shadow_fell)

/datum/mapGeneratorModule/forestgrass
	clusterCheckFlags =  CLUSTER_CHECK_SAME_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/grass, /turf/open/floor/rogue/grassred, /turf/open/floor/rogue/grassyel, /turf/open/floor/rogue/grasscold)
	excluded_turfs = list()
	allowed_areas = list(/area/rogue/outdoors/woods,/area/rogue/outdoors/shadow_fell)
	spawnableAtoms = list(/obj/structure/flora/roguetree = 30,
							/obj/structure/flora/roguetree/wise=1,
							/obj/structure/flora/roguegrass/bush = 25,
							/obj/structure/flora/roguegrass = 100,
							/obj/structure/flora/roguegrass/herb/random = 15,
							/obj/structure/flora/roguegrass/maneater = 13,
							/obj/structure/flora/roguegrass/maneater/real=2,
							/obj/structure/flora/roguegrass/swampweed = 15,
							/obj/item/natural/stone = 6,
							/obj/item/natural/rock = 1,
							/obj/item/grown/log/tree/stick = 3,
							/obj/structure/flora/roguetree/stump/log = 3)

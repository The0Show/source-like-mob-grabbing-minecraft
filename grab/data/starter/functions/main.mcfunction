execute unless entity @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",Count:1b}}] run tag @e[tag=grab] remove grab
execute at @a if score @a[dx=0,limit=1] rightclick matches 1.. if block ~ ~ ~ air positioned ^ ^ ^0.5 run function starter:look
execute at @a run teleport @e[tag=grab] ^-0.3 ^1 ^2
scoreboard players reset @a[scores={rightclick=1..}] rightclick
effect give @e[tag=grab] minecraft:glowing 1 255 true
effect give @e[tag=grab] minecraft:resistance 1 3 true
execute at @e[tag=grab] if entity @a[scores={ungrab=1..,sneak=1..}] run data merge entity @e[tag=grab,dx=0,limit=1] {Motion:[1.0,1.0,1.0]}
execute at @e[tag=grab] if entity @a[scores={ungrab=1..,sneak=1..}] run playsound minecraft:entity.generic.explode master @a ~ ~ ~ 100000000000000000000000 2
execute at @e[tag=grab] if entity @a[scores={ungrab=1..,sneak=1..}] run particle minecraft:spit ~ ~ ~ 0 0 0 1 100
scoreboard players reset @a[scores={sneak=1..}] sneak
execute at @a[scores={ungrab=1..}] run tag @e[type=!player] remove grab
execute at @a[scores={ungrab=1..}] run effect clear @e[type=!player] minecraft:glowing
scoreboard players reset @a[scores={ungrab=1..}] ungrab
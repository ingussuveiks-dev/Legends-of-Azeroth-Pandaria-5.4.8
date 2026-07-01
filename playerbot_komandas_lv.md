# Playerbot komandas

Komandas raksti spele chat loga ar GM character. Lai nomainitu spec/talentus, vispirms iezime botu targeta un tad palaid attiecigo `.npcbot setspec N` komandu.

Svarigi:

- Pievienot botu pec klases: `.npcbot addclass CLASS`
- Pievienot konkretu jau esosu character botu: `.npcbot add PLAYERNAME`
- Nonemt botu: `.npcbot remove PLAYERNAME`
- Parbaudit sarakstu: `.npcbot list`
- `addclass` izvele random botu no pieejama pool un pielidzina tavam levelim.
- `setspec` resetos target bota talentus/spec un pargerbos ekipumu.
- Botiem talanti tiek likti automatiski, jo configa ir `AiPlayerbot.AutoPickTalents = 1`.

## Default talanti/spec pec addclass

Pec `.npcbot addclass CLASS` bots tiek randomizets un tam tiek uzlikti premade talanti pec izveleta spec. Tas nav viens garantets default specs katrai klasei. Ja vajag konkretu lomu, targeto botu un uzreiz palaid atbilstoso `.npcbot setspec N`.

Praktiskais noteikums:

- Ja vajag tanku, vienmer manuali uzliec tank spec.
- Ja vajag healu, vienmer manuali uzliec heal spec.
- Ja der jebkads DPS, var atstat default/random spec.

Pieejamie premade spec/talenti:

| Klase | Random/default iespējas | Ja vajag konkretu |
| --- | --- | --- |
| Warrior | arms, fury, prot | tank = `.npcbot setspec 2`, DPS = `0` vai `1` |
| Paladin | holy, prot, ret | heal = `.npcbot setspec 0`, tank = `1`, DPS = `2` |
| Hunter | bm, mm, surv | visi ir DPS: `0`, `1`, `2` |
| Rogue | assassination, combat, subtlety | visi ir DPS: `0`, `1`, `2` |
| Priest | disc, holy, shadow | heal = `0` vai `1`, DPS = `2` |
| Death Knight | blood, frost, unholy | tank = `0`, DPS = `1` vai `2` |
| Shaman | elemental, enhancement, resto | caster DPS = `0`, melee DPS = `1`, heal = `2` |
| Mage | arcane, fire, frost | visi ir DPS: `0`, `1`, `2` |
| Warlock | affliction, demonology, destruction | visi ir DPS: `0`, `1`, `2` |
| Monk | configa premade spec ir nepilns/unused | meginat `0`, `1`, `2`, bet parbaudit spele |
| Druid | balance, bear, resto, cat | caster DPS = `0`, tank = `1`, heal = `2`, melee DPS = `3` |

Piemers: ja pievienoji warrior un vajag, lai vins noteikti ir tanks:

```text
.npcbot addclass warrior
```

Targeto warrior botu:

```text
.npcbot setspec 2
```

Spec parbaude:

- Gatava `.npcbot getspec` vai `.npcbot spec` komanda saja modulii nav atrasta.
- Spele vari targetot botu un izmantot parasto Inspect logu, jo bots ir player character.
- Worldserver loga pie bota login paradas rinda ar numeric spec: `Bot NAME logged in - Active spec tab: X Spec: Y`.
- Ja vajag garantetu lomu, nelauzies ar parbaudi: targeto botu un palaid vajadzigo `.npcbot setspec N`.

## Atrie testi

```text
.npcbot list
```

```text
.npcbot addclass mage
```

```text
.npcbot remove BOTNAME
```

## Instance / dungeon strategijas

Instance/dungeon strategijas nav atseviska `.npcbot add...` komanda. Tas ir ieslegts configa un pieliekas automatiski, kad grupa ieiet instance, ja konkretajai instancei/bossam strategija ir implementeta:

```ini
AiPlayerbot.ApplyInstanceStrategies = 1
```

Tava aktivaja configa tas jau ir ieslegts:

```text
Build/bin/RelWithDebInfo/playerbots.conf
AiPlayerbot.ApplyInstanceStrategies = 1
```

Manuali vari mainit botu combat/non-combat strategijas caur botu chat komandam. Raksti chat, nevis GM punktkomandu.

Combat strategijas:

```text
co +dps,+dps assist,-threat
```

AOE damage:

```text
co +dps aoe
```

Atpakal uz assist damage:

```text
co -dps aoe,+dps assist
```

Tankam noder:

```text
co +tank,+tank assist,+threat,+tank face
```

Healerim noder:

```text
co +heal
```

Non-combat seko tev:

```text
nc +follow,-stay
```

Non-combat stav uz vietas:

```text
nc +stay,-follow
```

Piezime: `co` maina combat strategijas, `nc` maina non-combat strategijas. Priekssa ir `+` lai pieliktu strategiju, `-` lai nonemtu.

## Atrie teleporti uz instancem

Teleporti nak no `world.game_tele` tabulas. Visertak ir lietot `.tele NAME`, jo koordinatas jau ir datubaze. Ja gribi teleportet visu grupu, iezime sevi vai citu grupas speletaju un lieto `.tele group NAME`.

Pats uz instu:

```text
.tele TempleoftheJadeSerpent
```

Visa grupa uz instu:

```text
.tele group TempleoftheJadeSerpent
```

Ieteicamais process ar botiem:

```text
.tele TempleoftheJadeSerpent
.npcbot addclass warrior
.npcbot addclass priest
.npcbot addclass mage
.npcbot addclass hunter
.npcbot addclass rogue
```

Tad sataisi spec/talentus, ieej instance ar botiem grupaa, un instance strategijas pieslegsies automatiski. Parasti labak botus pievienot pie ieejas pirms ieiesanas instance, nevis jau instance iekspuse. Ieksa ari var meginat, bet pie ieejas ir mazak problemu ar summon, bind, LOS un instance state.

MoP dungeons:

```text
.tele TempleoftheJadeSerpent
.tele StormstoutBrewery
.tele ShadoPanMonastery
.tele MogushanPalace
.tele GateoftheSettingSun
.tele SiegeofNiuzaoTemple
```

MoP raids:

```text
.tele MogushanVaults
.tele HearthofFear
.tele TerraceofEndlessSpring
.tele ThroneofThunder
.tele SiegeofOrgrimmar
```

Classic / old dungeons:

```text
.tele RagefireChasm
.tele Deadmines
.tele ShadowFangKeep
.tele ScarletMonastery
.tele Scholomance
.tele BlackrockDepths
.tele BlackrockSpire
```

Old raids:

```text
.tele MoltenCore
.tele BlackwingLair
.tele Karazhan
.tele Naxxramas
.tele Ulduar
.tele IcecrownCitadelRaid
.tele Firelands
.tele DragonSoul
```

Ja vajag tiesas koordinatas, sis ir tas pats MoP saraksts `.go xyz` forma:

```text
.go xyz 961.39 -2463.32 180.58 870
.go xyz -706.39 1265.21 136.02 870
.go xyz 3595.63 2547.25 768.58 870
.go xyz 1383.72 446.93 479.03 870
.go xyz 685.09 2079.15 371.71 870
.go xyz 1342.53 5005.28 116.35 870
.go xyz 3990.67 1101.01 497.16 870
.go xyz 170.54 4042.16 255.91 870
.go xyz 954.38 -56.93 511.16 870
.go xyz 7241.38 5038.15 76.22 1064
.go xyz 1198.17 650.10 347.51 870
```

## Warrior

Pievienot warrior:

```text
.npcbot addclass warrior
```

Talenti/spec, ja bots ir targeta:

Arms PVE:

```text
.npcbot setspec 0
```

Fury PVE:

```text
.npcbot setspec 1
```

Protection PVE:

```text
.npcbot setspec 2
```

## Paladin

Pievienot paladin:

```text
.npcbot addclass paladin
```

Talenti/spec, ja bots ir targeta:

Holy PVE:

```text
.npcbot setspec 0
```

Protection PVE:

```text
.npcbot setspec 1
```

Retribution PVE:

```text
.npcbot setspec 2
```

## Hunter

Pievienot hunter:

```text
.npcbot addclass hunter
```

Talenti/spec, ja bots ir targeta:

Beast Mastery PVE:

```text
.npcbot setspec 0
```

Marksmanship PVE:

```text
.npcbot setspec 1
```

Survival PVE:

```text
.npcbot setspec 2
```

## Rogue

Pievienot rogue:

```text
.npcbot addclass rogue
```

Talenti/spec, ja bots ir targeta:

Assassination PVE:

```text
.npcbot setspec 0
```

Combat PVE:

```text
.npcbot setspec 1
```

Subtlety PVE:

```text
.npcbot setspec 2
```

## Priest

Pievienot priest:

```text
.npcbot addclass priest
```

Talenti/spec, ja bots ir targeta:

Discipline PVE:

```text
.npcbot setspec 0
```

Holy PVE:

```text
.npcbot setspec 1
```

Shadow PVE:

```text
.npcbot setspec 2
```

## Death Knight

Pievienot death knight. Komanda izmanto `dk`, nevis `deathknight`:

```text
.npcbot addclass dk
```

Talenti/spec, ja bots ir targeta:

Blood PVE:

```text
.npcbot setspec 0
```

Frost PVE:

```text
.npcbot setspec 1
```

Unholy PVE:

```text
.npcbot setspec 2
```

Double Aura Blood PVE:

```text
.npcbot setspec 3
```

## Shaman

Pievienot shaman:

```text
.npcbot addclass shaman
```

Talenti/spec, ja bots ir targeta:

Elemental PVE:

```text
.npcbot setspec 0
```

Enhancement PVE:

```text
.npcbot setspec 1
```

Restoration PVE:

```text
.npcbot setspec 2
```

## Mage

Pievienot mage:

```text
.npcbot addclass mage
```

Talenti/spec, ja bots ir targeta:

Arcane PVE:

```text
.npcbot setspec 0
```

Fire PVE:

```text
.npcbot setspec 1
```

Frost PVE:

```text
.npcbot setspec 2
```

## Warlock

Pievienot warlock:

```text
.npcbot addclass warlock
```

Talenti/spec, ja bots ir targeta:

Affliction PVE:

```text
.npcbot setspec 0
```

Demonology PVE:

```text
.npcbot setspec 1
```

Destruction PVE:

```text
.npcbot setspec 2
```

## Monk

Pievienot monk:

```text
.npcbot addclass monk
```

Piezime: si projekta `playerbots.conf` faila monk premade spec/talentu linki ir `unused`, tapec `setspec` var neuzlikt pilnu premade talentu koku ka citam klasem.

Ja gribi meginat spec parslēgsanu ar targetotu monk botu:

Brewmaster:

```text
.npcbot setspec 0
```

Mistweaver:

```text
.npcbot setspec 1
```

Windwalker:

```text
.npcbot setspec 2
```

## Druid

Pievienot druid:

```text
.npcbot addclass druid
```

Talenti/spec, ja bots ir targeta:

Balance PVE:

```text
.npcbot setspec 0
```

Bear/Guardian PVE:

```text
.npcbot setspec 1
```

Restoration PVE:

```text
.npcbot setspec 2
```

Cat/Feral PVE:

```text
.npcbot setspec 3
```

## Gatavi grupas piemers

Tank + heal + 3 DPS:

```text
.npcbot addclass warrior
.npcbot addclass priest
.npcbot addclass mage
.npcbot addclass hunter
.npcbot addclass rogue
```

Pec pievienosanas targeto warrior botu un uzliec tank spec:

```text
.npcbot setspec 2
```

Targeto priest botu un uzliec heal spec:

```text
.npcbot setspec 1
```

Targeto mage botu un uzliec frost:

```text
.npcbot setspec 2
```

## Klases nosaukumi addclass komandai

```text
warrior
paladin
hunter
rogue
priest
dk
shaman
mage
warlock
monk
druid
```

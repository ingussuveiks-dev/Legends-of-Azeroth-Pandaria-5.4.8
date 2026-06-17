/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.4.9-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: world
-- ------------------------------------------------------
-- Server version	5.7.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `access_requirement`
--

DROP TABLE IF EXISTS `access_requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `access_requirement` (
  `mapId` mediumint(8) unsigned NOT NULL,
  `difficulty` enum('DUNGEON_NORMAL','DUNGEON_HEROIC','RAID_10MAN_NORMAL','RAID_25MAN_NORMAL','RAID_10MAN_HEROIC','RAID_25MAN_HEROIC','RAID_25MAN_LFR','DUNGEON_CHALLENGE','RAID_40MAN','UNUSED','SCENARIO_HEROIC','SCENARIO_NORMAL','UNUSED2','RAID_1025MAN_FLEX') COLLATE utf8mb4_bin NOT NULL DEFAULT 'DUNGEON_NORMAL',
  `level_min` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `level_max` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `item_level` smallint(5) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest_done_A` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest_done_H` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `completed_achievement` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest_failed_text` text COLLATE utf8mb4_bin,
  `comment` text COLLATE utf8mb4_bin,
  PRIMARY KEY (`mapId`,`difficulty`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Access Requirements';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `achievement_criteria_data`
--

DROP TABLE IF EXISTS `achievement_criteria_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `achievement_criteria_data` (
  `criteria_id` mediumint(9) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `value1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `value2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ScriptName` char(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`criteria_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Achievment system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `achievement_dbc`
--

DROP TABLE IF EXISTS `achievement_dbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `achievement_dbc` (
  `ID` int(10) unsigned NOT NULL,
  `RequiredFaction` int(11) NOT NULL DEFAULT '-1',
  `MapID` int(11) NOT NULL DEFAULT '-1',
  `Points` int(10) unsigned NOT NULL DEFAULT '0',
  `Flags` int(10) unsigned NOT NULL DEFAULT '0',
  `Count` int(10) unsigned NOT NULL DEFAULT '0',
  `RefAchievement` int(10) unsigned NOT NULL DEFAULT '0',
  `CriteriaTree` int(11) DEFAULT NULL,
  `Comment` text COLLATE utf8mb4_bin,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `achievement_reward`
--

DROP TABLE IF EXISTS `achievement_reward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `achievement_reward` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title_A` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title_H` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell` mediumint(9) NOT NULL DEFAULT '0' COMMENT 'positive - cast, negative - learn',
  `sender` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `text` text COLLATE utf8mb4_bin,
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `achievement_reward_locale`
--

DROP TABLE IF EXISTS `achievement_reward_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `achievement_reward_locale` (
  `ID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Locale` varchar(4) CHARACTER SET utf8 NOT NULL,
  `Subject` text COLLATE utf8mb4_bin,
  `Body` text COLLATE utf8mb4_bin,
  PRIMARY KEY (`ID`,`Locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `areatrigger_involvedrelation`
--

DROP TABLE IF EXISTS `areatrigger_involvedrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `areatrigger_involvedrelation` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Trigger System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `areatrigger_queststarter`
--

DROP TABLE IF EXISTS `areatrigger_queststarter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `areatrigger_queststarter` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `areatrigger_scripts`
--

DROP TABLE IF EXISTS `areatrigger_scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `areatrigger_scripts` (
  `entry` mediumint(9) NOT NULL,
  `ScriptName` char(64) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `areatrigger_tavern`
--

DROP TABLE IF EXISTS `areatrigger_tavern`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `areatrigger_tavern` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `name` text CHARACTER SET utf8,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Trigger System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `areatrigger_teleport`
--

DROP TABLE IF EXISTS `areatrigger_teleport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `areatrigger_teleport` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `name` text CHARACTER SET utf8,
  `target_map` smallint(5) unsigned NOT NULL DEFAULT '0',
  `target_position_x` float NOT NULL DEFAULT '0',
  `target_position_y` float NOT NULL DEFAULT '0',
  `target_position_z` float NOT NULL DEFAULT '0',
  `target_orientation` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  FULLTEXT KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Trigger System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bad_word`
--

DROP TABLE IF EXISTS `bad_word`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bad_word` (
  `bad_word` varchar(32) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `convert` varchar(100) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`bad_word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Bad word';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bad_word_mail`
--

DROP TABLE IF EXISTS `bad_word_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bad_word_mail` (
  `bad_word` varchar(32) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`bad_word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Bad word for mail';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_pay_boost_items`
--

DROP TABLE IF EXISTS `battle_pay_boost_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `battle_pay_boost_items` (
  `specialization` int(10) unsigned NOT NULL DEFAULT '0',
  `slot` enum('EQUIPMENT_SLOT_HEAD','EQUIPMENT_SLOT_NECK','EQUIPMENT_SLOT_SHOULDERS','EQUIPMENT_SLOT_BODY','EQUIPMENT_SLOT_CHEST','EQUIPMENT_SLOT_WAIST','EQUIPMENT_SLOT_LEGS','EQUIPMENT_SLOT_FEET','EQUIPMENT_SLOT_WRISTS','EQUIPMENT_SLOT_HANDS','EQUIPMENT_SLOT_FINGER1','EQUIPMENT_SLOT_FINGER2','EQUIPMENT_SLOT_TRINKET1','EQUIPMENT_SLOT_TRINKET2','EQUIPMENT_SLOT_BACK','EQUIPMENT_SLOT_MAINHAND','EQUIPMENT_SLOT_OFFHAND','EQUIPMENT_SLOT_RANGED','EQUIPMENT_SLOT_TABARD') CHARACTER SET utf8 NOT NULL DEFAULT 'EQUIPMENT_SLOT_HEAD',
  `itemId` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`specialization`,`slot`,`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_pay_entry`
--

DROP TABLE IF EXISTS `battle_pay_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `battle_pay_entry` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `productId` int(10) unsigned NOT NULL DEFAULT '0',
  `groupId` int(10) unsigned NOT NULL DEFAULT '0',
  `idx` int(11) NOT NULL DEFAULT '0',
  `title` varchar(55) CHARACTER SET utf8 NOT NULL,
  `description` varchar(500) CHARACTER SET utf8 NOT NULL,
  `icon` int(10) unsigned NOT NULL DEFAULT '0',
  `displayId` int(10) unsigned NOT NULL DEFAULT '0',
  `banner` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_pay_group`
--

DROP TABLE IF EXISTS `battle_pay_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `battle_pay_group` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `idx` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(16) CHARACTER SET utf8 NOT NULL,
  `icon` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`idx`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_pay_product`
--

DROP TABLE IF EXISTS `battle_pay_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `battle_pay_product` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(50) CHARACTER SET utf8 NOT NULL,
  `description` varchar(500) CHARACTER SET utf8 NOT NULL,
  `icon` int(10) unsigned NOT NULL DEFAULT '0',
  `price` int(10) unsigned NOT NULL DEFAULT '0',
  `discount` int(10) unsigned NOT NULL DEFAULT '0',
  `displayId` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `choiceType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  `flagsInfo` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_pay_product_items`
--

DROP TABLE IF EXISTS `battle_pay_product_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `battle_pay_product_items` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `itemId` int(10) unsigned NOT NULL DEFAULT '0',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  `productId` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `productId` (`itemId`,`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_pet_breed`
--

DROP TABLE IF EXISTS `battle_pet_breed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `battle_pet_breed` (
  `species` smallint(5) unsigned NOT NULL DEFAULT '0',
  `breed` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`species`,`breed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_pet_item_to_species`
--

DROP TABLE IF EXISTS `battle_pet_item_to_species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `battle_pet_item_to_species` (
  `itemId` int(11) NOT NULL DEFAULT '0',
  `species` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemId`,`species`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_pet_quality`
--

DROP TABLE IF EXISTS `battle_pet_quality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `battle_pet_quality` (
  `species` smallint(5) unsigned NOT NULL DEFAULT '0',
  `quality` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`species`,`quality`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_pet_wild_pool`
--

DROP TABLE IF EXISTS `battle_pet_wild_pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `battle_pet_wild_pool` (
  `zone` int(10) unsigned NOT NULL DEFAULT '0',
  `species` smallint(5) unsigned NOT NULL DEFAULT '0',
  `entry` int(10) unsigned NOT NULL DEFAULT '0',
  `max` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `minLevel` tinyint(3) unsigned DEFAULT '0',
  `maxLevel` tinyint(3) unsigned DEFAULT '0',
  `comment` varchar(100) CHARACTER SET utf8 DEFAULT '',
  PRIMARY KEY (`zone`,`species`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battleground_template`
--

DROP TABLE IF EXISTS `battleground_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `battleground_template` (
  `id` mediumint(8) unsigned NOT NULL,
  `MinPlayersPerTeam` smallint(5) unsigned NOT NULL DEFAULT '0',
  `MaxPlayersPerTeam` smallint(5) unsigned NOT NULL DEFAULT '0',
  `MinLvl` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MaxLvl` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `AllianceStartLoc` mediumint(8) unsigned NOT NULL,
  `AllianceStartO` float NOT NULL,
  `HordeStartLoc` mediumint(8) unsigned NOT NULL,
  `HordeStartO` float NOT NULL,
  `StartMaxDist` float NOT NULL DEFAULT '0',
  `Weight` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `ScriptName` char(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Comment` char(32) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battlemaster_entry`
--

DROP TABLE IF EXISTS `battlemaster_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `battlemaster_entry` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Entry of a creature',
  `bg_template` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Battleground template id',
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blackmarket_template`
--

DROP TABLE IF EXISTS `blackmarket_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `blackmarket_template` (
  `Id` int(10) unsigned NOT NULL DEFAULT '0',
  `MarketId` int(10) unsigned NOT NULL DEFAULT '0',
  `SellerID` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemEntry` int(10) unsigned NOT NULL DEFAULT '0',
  `Quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `MinBid` int(11) NOT NULL DEFAULT '0',
  `Chance` float DEFAULT '0',
  PRIMARY KEY (`ItemEntry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bonus_loot_template`
--

DROP TABLE IF EXISTS `bonus_loot_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bonus_loot_template` (
  `entry` int(10) unsigned NOT NULL,
  `spell` int(10) unsigned NOT NULL,
  `currency` smallint(5) unsigned NOT NULL,
  `loot_id_normal` int(10) unsigned NOT NULL,
  `loot_id_heroic` int(10) unsigned NOT NULL,
  `loot_source` enum('LOOT_SOURCE_CREATURE','LOOT_SOURCE_GO') CHARACTER SET utf8 NOT NULL,
  `comment` text CHARACTER SET utf8,
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `broadcast_text`
--

DROP TABLE IF EXISTS `broadcast_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `broadcast_text` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `LanguageID` int(10) unsigned NOT NULL DEFAULT '0',
  `Text` text COLLATE utf8mb4_bin NOT NULL,
  `Text1` text COLLATE utf8mb4_bin NOT NULL,
  `EmoteID1` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteID2` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteID3` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay1` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay2` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay3` int(10) unsigned NOT NULL DEFAULT '0',
  `SoundEntriesID` int(10) unsigned NOT NULL DEFAULT '0',
  `EmotesID` int(10) unsigned NOT NULL DEFAULT '0',
  `Flags` int(10) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `broadcast_text_locale`
--

DROP TABLE IF EXISTS `broadcast_text_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `broadcast_text_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_bin NOT NULL,
  `Text` text COLLATE utf8mb4_bin,
  `Text1` text COLLATE utf8mb4_bin,
  `VerifiedBuild` smallint(6) DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `broken_quests`
--

DROP TABLE IF EXISTS `broken_quests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `broken_quests` (
  `questId` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_bin NOT NULL,
  UNIQUE KEY `questId` (`questId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `challenge_mode_rewards`
--

DROP TABLE IF EXISTS `challenge_mode_rewards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `challenge_mode_rewards` (
  `map` int(10) unsigned NOT NULL DEFAULT '0',
  `none_money` int(10) unsigned NOT NULL DEFAULT '0',
  `bronze_money` int(10) unsigned NOT NULL DEFAULT '0',
  `silver_money` int(10) unsigned NOT NULL DEFAULT '0',
  `gold_money` int(10) unsigned NOT NULL DEFAULT '0',
  `none_valor` int(10) unsigned NOT NULL DEFAULT '0',
  `bronze_valor` int(10) unsigned NOT NULL DEFAULT '0',
  `silver_valor` int(10) unsigned NOT NULL DEFAULT '0',
  `gold_valor` int(10) unsigned NOT NULL DEFAULT '0',
  `title` int(10) unsigned NOT NULL DEFAULT '0',
  `platinum_achievement` int(10) unsigned NOT NULL DEFAULT '0',
  `comment` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`map`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `characters_npcbot_logs`
--

DROP TABLE IF EXISTS `characters_npcbot_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `characters_npcbot_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `entry` int(10) unsigned NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL DEFAULT '-1',
  `mapid` int(11) NOT NULL DEFAULT '-1',
  `inmap` tinyint(4) NOT NULL DEFAULT '-1',
  `inworld` tinyint(4) NOT NULL DEFAULT '-1',
  `type` smallint(5) unsigned NOT NULL DEFAULT '0',
  `param1` varchar(51) DEFAULT NULL,
  `param2` varchar(51) DEFAULT NULL,
  `param3` varchar(51) DEFAULT NULL,
  `param4` varchar(51) DEFAULT NULL,
  `param5` varchar(51) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `charsections_dbc`
--

DROP TABLE IF EXISTS `charsections_dbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `charsections_dbc` (
  `Id` int(11) NOT NULL DEFAULT '0',
  `Race` int(11) NOT NULL DEFAULT '0',
  `Gender` int(11) NOT NULL DEFAULT '0',
  `GenType` int(11) NOT NULL DEFAULT '0',
  `TexturePath1` varchar(100) DEFAULT NULL,
  `TexturePath2` varchar(100) DEFAULT NULL,
  `TexturePath3` varchar(100) DEFAULT NULL,
  `Flags` int(11) NOT NULL DEFAULT '0',
  `Type` int(11) NOT NULL DEFAULT '0',
  `Color` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `command`
--

DROP TABLE IF EXISTS `command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `command` (
  `name` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `security` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `help` text CHARACTER SET utf8,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Chat System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conditions`
--

DROP TABLE IF EXISTS `conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `conditions` (
  `SourceTypeOrReferenceId` mediumint(9) NOT NULL DEFAULT '0',
  `SourceGroup` int(10) unsigned NOT NULL DEFAULT '0',
  `SourceEntry` mediumint(9) NOT NULL DEFAULT '0',
  `SourceId` int(11) NOT NULL DEFAULT '0',
  `ElseGroup` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ConditionTypeOrReference` mediumint(9) NOT NULL DEFAULT '0',
  `ConditionTarget` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ConditionValue1` int(10) unsigned NOT NULL DEFAULT '0',
  `ConditionValue2` int(10) unsigned NOT NULL DEFAULT '0',
  `ConditionValue3` int(10) unsigned NOT NULL DEFAULT '0',
  `NegativeCondition` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ErrorType` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ErrorTextId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ScriptName` char(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Comment` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Condition System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature`
--

DROP TABLE IF EXISTS `creature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature` (
  `guid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Global Unique Identifier',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Creature Identifier',
  `map` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `zoneId` int(10) unsigned NOT NULL DEFAULT '0',
  `areaId` int(10) unsigned NOT NULL DEFAULT '0',
  `spawnMask` int(10) unsigned NOT NULL DEFAULT '1',
  `phaseMask` int(10) unsigned NOT NULL DEFAULT '1',
  `phaseId` int(10) unsigned NOT NULL DEFAULT '0',
  `phaseGroup` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `equipment_id` tinyint(4) NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `spawntimesecs` int(10) unsigned NOT NULL DEFAULT '120',
  `spawntimesecs_max` int(10) unsigned NOT NULL DEFAULT '0',
  `wander_distance` float NOT NULL DEFAULT '0',
  `currentwaypoint` int(10) unsigned NOT NULL DEFAULT '0',
  `curhealth` int(10) unsigned NOT NULL DEFAULT '1',
  `curmana` int(10) unsigned NOT NULL DEFAULT '0',
  `MovementType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `npcflag` bigint(20) unsigned NOT NULL DEFAULT '0',
  `npcflag2` int(10) unsigned NOT NULL DEFAULT '0',
  `unit_flags` int(10) unsigned NOT NULL DEFAULT '0',
  `unit_flags2` int(10) unsigned NOT NULL DEFAULT '0',
  `dynamicflags` int(10) unsigned NOT NULL DEFAULT '0',
  `ScriptName` char(64) CHARACTER SET utf8 DEFAULT '',
  `walk_mode` float unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`),
  KEY `idx_map` (`map`),
  KEY `idx_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4000078 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Creature System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_addon`
--

DROP TABLE IF EXISTS `creature_addon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_addon` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `path_id` int(10) unsigned NOT NULL DEFAULT '0',
  `mount` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `MountCreatureID` int(10) unsigned NOT NULL DEFAULT '0',
  `StandState` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `AnimTier` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VisFlags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SheathState` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `PvPFlags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `emote` int(10) unsigned NOT NULL DEFAULT '0',
  `aiAnimKit` smallint(6) NOT NULL DEFAULT '0',
  `movementAnimKit` smallint(6) NOT NULL DEFAULT '0',
  `meleeAnimKit` smallint(6) NOT NULL DEFAULT '0',
  `visibilityDistanceType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `auras` text CHARACTER SET utf8,
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_classlevelstats`
--

DROP TABLE IF EXISTS `creature_classlevelstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_classlevelstats` (
  `level` tinyint(4) NOT NULL,
  `class` tinyint(4) NOT NULL,
  `basehp0` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `basehp1` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `basehp2` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `basehp3` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `basehp4` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `basemana` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `basearmor` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `damage_base` float NOT NULL DEFAULT '0',
  `damage_exp1` float NOT NULL DEFAULT '0',
  `damage_exp2` float NOT NULL DEFAULT '0',
  `damage_exp3` float NOT NULL DEFAULT '0',
  `damage_exp4` float NOT NULL DEFAULT '0',
  `attackpower` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rangedattackpower` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`level`,`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_difficulty`
--

DROP TABLE IF EXISTS `creature_difficulty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_difficulty` (
  `id` int(10) unsigned NOT NULL,
  `difficulty` enum('DUNGEON_NORMAL','DUNGEON_HEROIC','RAID_10MAN_NORMAL','RAID_25MAN_NORMAL','RAID_10MAN_HEROIC','RAID_25MAN_HEROIC','RAID_25MAN_LFR','DUNGEON_CHALLENGE','RAID_40MAN','UNUSED','SCENARIO_HEROIC','SCENARIO_NORMAL','UNUSED2','RAID_1025MAN_FLEX','BG_DIFFICULTY_0','BG_DIFFICULTY_1','BG_DIFFICULTY_2','BG_DIFFICULTY_3','BG_DIFFICULTY_4','BG_DIFFICULTY_5','BG_DIFFICULTY_6','BG_DIFFICULTY_7','BG_DIFFICULTY_8','BG_DIFFICULTY_9') CHARACTER SET utf8 NOT NULL DEFAULT 'DUNGEON_NORMAL',
  `health_mod` float DEFAULT '1',
  `damage_mod` float DEFAULT '1',
  `level_min` tinyint(3) unsigned DEFAULT '1',
  `level_max` tinyint(3) unsigned DEFAULT '1',
  `attackpower` int(10) unsigned DEFAULT '0',
  `mindmg` float DEFAULT '1',
  `maxdmg` float DEFAULT '1',
  `rangedattackpower` int(11) NOT NULL DEFAULT '0',
  `minrangedmg` float DEFAULT '1',
  `maxrangedmg` float DEFAULT '1',
  PRIMARY KEY (`id`,`difficulty`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_equip_template`
--

DROP TABLE IF EXISTS `creature_equip_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_equip_template` (
  `CreatureID` int(10) unsigned NOT NULL DEFAULT '0',
  `ID` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `ItemID1` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemID2` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemID3` int(10) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) DEFAULT '0',
  PRIMARY KEY (`CreatureID`,`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_formations`
--

DROP TABLE IF EXISTS `creature_formations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_formations` (
  `leaderGUID` int(10) unsigned NOT NULL,
  `memberGUID` int(10) unsigned NOT NULL,
  `dist` float unsigned NOT NULL,
  `angle` float unsigned NOT NULL,
  `groupAI` int(10) unsigned NOT NULL,
  `point_1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `point_2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`memberGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_loot_currency`
--

DROP TABLE IF EXISTS `creature_loot_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_loot_currency` (
  `entry` mediumint(8) unsigned NOT NULL,
  `lootmode` set('REGULAR','DUNGEON_NORMAL','DUNGEON_HEROIC','RAID_10MAN_NORMAL','RAID_25MAN_NORMAL','RAID_10MAN_HEROIC','RAID_25MAN_HEROIC','RAID_25MAN_LFR','DUNGEON_CHALLENGE','RAID_40MAN','UNUSED','SCENARIO_HEROIC','SCENARIO_NORMAL','UNUSED2','RAID_1025MAN_FLEX') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `currency` smallint(5) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entry`,`currency`,`lootmode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_loot_template`
--

DROP TABLE IF EXISTS `creature_loot_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(9) NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `lootmode` set('REGULAR','DUNGEON_NORMAL','DUNGEON_HEROIC','RAID_10MAN_NORMAL','RAID_25MAN_NORMAL','RAID_10MAN_HEROIC','RAID_25MAN_HEROIC','RAID_25MAN_LFR','DUNGEON_CHALLENGE','RAID_40MAN','UNUSED','SCENARIO_HEROIC','SCENARIO_NORMAL','UNUSED2','RAID_1025MAN_FLEX') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`item`,`lootmode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_model_info`
--

DROP TABLE IF EXISTS `creature_model_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_model_info` (
  `modelid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `bounding_radius` float NOT NULL DEFAULT '0',
  `combat_reach` float NOT NULL DEFAULT '0',
  `gender` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `modelid_other_gender` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`modelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Creature System (Model related info)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_movement_override`
--

DROP TABLE IF EXISTS `creature_movement_override`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_movement_override` (
  `SpawnId` int(10) unsigned NOT NULL DEFAULT '0',
  `Ground` tinyint(3) unsigned DEFAULT NULL,
  `Swim` tinyint(3) unsigned DEFAULT NULL,
  `Flight` tinyint(3) unsigned DEFAULT NULL,
  `Rooted` tinyint(3) unsigned DEFAULT NULL,
  `Chase` tinyint(3) unsigned DEFAULT NULL,
  `Random` tinyint(3) unsigned DEFAULT NULL,
  `InteractionPauseTimer` int(10) unsigned DEFAULT NULL COMMENT 'Time (in milliseconds) during which creature will not move after interaction with player',
  PRIMARY KEY (`SpawnId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_onkill_reputation`
--

DROP TABLE IF EXISTS `creature_onkill_reputation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_onkill_reputation` (
  `creature_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Creature Identifier',
  `RewOnKillRepFaction1` smallint(6) NOT NULL DEFAULT '0',
  `RewOnKillRepFaction2` smallint(6) NOT NULL DEFAULT '0',
  `MaxStanding1` tinyint(4) NOT NULL DEFAULT '0',
  `IsTeamAward1` tinyint(4) NOT NULL DEFAULT '0',
  `RewOnKillRepValue1` mediumint(9) NOT NULL DEFAULT '0',
  `MaxStanding2` tinyint(4) NOT NULL DEFAULT '0',
  `IsTeamAward2` tinyint(4) NOT NULL DEFAULT '0',
  `RewOnKillRepValue2` mediumint(9) NOT NULL DEFAULT '0',
  `TeamDependent` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`creature_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Creature OnKill Reputation gain';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_questender`
--

DROP TABLE IF EXISTS `creature_questender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_questender` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Creature System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_queststarter`
--

DROP TABLE IF EXISTS `creature_queststarter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_queststarter` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Creature System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_scaling`
--

DROP TABLE IF EXISTS `creature_scaling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_scaling` (
  `entry` int(10) unsigned NOT NULL,
  `group_size` int(11) NOT NULL DEFAULT '0',
  `health` float NOT NULL DEFAULT '0',
  `damage_mod` float NOT NULL DEFAULT '0',
  `comment` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`entry`,`group_size`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_sparring_template`
--

DROP TABLE IF EXISTS `creature_sparring_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_sparring_template` (
  `creature_id` mediumint(8) unsigned NOT NULL,
  `health_limit_pct` float DEFAULT '0',
  `comment` varchar(255) CHARACTER SET utf8 DEFAULT '',
  PRIMARY KEY (`creature_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_summon_groups`
--

DROP TABLE IF EXISTS `creature_summon_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_summon_groups` (
  `summonerId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `summonerType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `groupId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `summonType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `summonTime` int(10) unsigned NOT NULL DEFAULT '0',
  `Comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_template`
--

DROP TABLE IF EXISTS `creature_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `difficulty_entry_1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `difficulty_entry_2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `difficulty_entry_3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `difficulty_entry_4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `difficulty_entry_5` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `KillCredit1` int(10) unsigned NOT NULL DEFAULT '0',
  `KillCredit2` int(10) unsigned NOT NULL DEFAULT '0',
  `name` char(100) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `femaleName` char(100) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `subname` char(100) CHARACTER SET utf8 DEFAULT NULL,
  `IconName` char(100) CHARACTER SET utf8 DEFAULT NULL,
  `gossip_menu_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `minlevel` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `maxlevel` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `exp` smallint(6) NOT NULL DEFAULT '0',
  `exp_unk` smallint(6) NOT NULL DEFAULT '0',
  `faction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `npcflag` bigint(20) unsigned NOT NULL DEFAULT '0',
  `npcflag2` int(10) unsigned NOT NULL DEFAULT '0',
  `speed_walk` float NOT NULL DEFAULT '1' COMMENT 'Result of 2.5/2.5, most common value',
  `speed_run` float NOT NULL DEFAULT '1.14286' COMMENT 'Result of 8.0/7.0, most common value',
  `scale` float NOT NULL DEFAULT '1',
  `rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mindmg` float NOT NULL DEFAULT '0',
  `maxdmg` float NOT NULL DEFAULT '0',
  `dmgschool` tinyint(4) NOT NULL DEFAULT '0',
  `attackpower` int(10) unsigned NOT NULL DEFAULT '0',
  `dmg_multiplier` float NOT NULL DEFAULT '1',
  `BaseAttackTime` int(10) unsigned NOT NULL DEFAULT '0',
  `RangeAttackTime` int(10) unsigned NOT NULL DEFAULT '0',
  `unit_class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `unit_flags` int(10) unsigned NOT NULL DEFAULT '0',
  `unit_flags2` int(10) unsigned NOT NULL DEFAULT '0',
  `dynamicflags` int(10) unsigned NOT NULL DEFAULT '0',
  `family` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `trainer_type` tinyint(4) NOT NULL DEFAULT '0',
  `trainer_class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `trainer_race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `minrangedmg` float NOT NULL DEFAULT '0',
  `maxrangedmg` float NOT NULL DEFAULT '0',
  `rangedattackpower` smallint(5) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `type_flags` int(10) unsigned NOT NULL DEFAULT '0',
  `type_flags2` int(10) unsigned NOT NULL DEFAULT '0',
  `lootid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pickpocketloot` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `skinloot` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `resistance1` smallint(6) NOT NULL DEFAULT '0',
  `resistance2` smallint(6) NOT NULL DEFAULT '0',
  `resistance3` smallint(6) NOT NULL DEFAULT '0',
  `resistance4` smallint(6) NOT NULL DEFAULT '0',
  `resistance5` smallint(6) NOT NULL DEFAULT '0',
  `resistance6` smallint(6) NOT NULL DEFAULT '0',
  `spell1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell5` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell6` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell7` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell8` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `PetSpellDataId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `VehicleId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mingold` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `maxgold` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `AIName` char(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `MovementType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `HoverHeight` float NOT NULL DEFAULT '1',
  `Health_mod` float NOT NULL DEFAULT '1',
  `Mana_mod` float NOT NULL DEFAULT '1',
  `Mana_mod_extra` float NOT NULL DEFAULT '1',
  `Armor_mod` float NOT NULL DEFAULT '1',
  `RacialLeader` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `questItem1` int(10) unsigned NOT NULL DEFAULT '0',
  `questItem2` int(10) unsigned NOT NULL DEFAULT '0',
  `questItem3` int(10) unsigned NOT NULL DEFAULT '0',
  `questItem4` int(10) unsigned NOT NULL DEFAULT '0',
  `questItem5` int(10) unsigned NOT NULL DEFAULT '0',
  `questItem6` int(10) unsigned NOT NULL DEFAULT '0',
  `movementId` int(10) unsigned NOT NULL DEFAULT '0',
  `RegenHealth` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `VignetteID` int(10) unsigned NOT NULL DEFAULT '0',
  `TrackingQuestID` int(10) unsigned NOT NULL DEFAULT '0',
  `mechanic_immune_mask` int(10) unsigned NOT NULL DEFAULT '0',
  `flags_extra` int(10) unsigned NOT NULL DEFAULT '0',
  `ScriptName` char(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `VerifiedBuild` smallint(6) DEFAULT '18414',
  PRIMARY KEY (`entry`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Creature System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_template_addon`
--

DROP TABLE IF EXISTS `creature_template_addon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_template_addon` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `path_id` int(10) unsigned NOT NULL DEFAULT '0',
  `mount` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `MountCreatureID` int(10) unsigned NOT NULL DEFAULT '0',
  `StandState` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `AnimTier` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VisFlags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SheathState` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `PvPFlags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `emote` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `aiAnimKit` smallint(6) NOT NULL DEFAULT '0',
  `movementAnimKit` smallint(6) NOT NULL DEFAULT '0',
  `meleeAnimKit` smallint(6) NOT NULL DEFAULT '0',
  `visibilityDistanceType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `auras` text CHARACTER SET utf8,
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_template_locale`
--

DROP TABLE IF EXISTS `creature_template_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_template_locale` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) CHARACTER SET utf8 NOT NULL,
  `Name` text COLLATE utf8mb4_bin,
  `FemaleName` text COLLATE utf8mb4_bin,
  `Title` text COLLATE utf8mb4_bin,
  `VerifiedBuild` int(11) DEFAULT '0',
  PRIMARY KEY (`entry`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_template_model`
--

DROP TABLE IF EXISTS `creature_template_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_template_model` (
  `CreatureID` int(10) unsigned NOT NULL,
  `Idx` int(10) unsigned NOT NULL DEFAULT '0',
  `CreatureDisplayID` int(10) unsigned NOT NULL,
  `DisplayScale` float NOT NULL DEFAULT '1',
  `Probability` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`CreatureID`,`CreatureDisplayID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_template_movement`
--

DROP TABLE IF EXISTS `creature_template_movement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_template_movement` (
  `CreatureId` int(10) unsigned NOT NULL DEFAULT '0',
  `Ground` tinyint(3) unsigned DEFAULT NULL,
  `Swim` tinyint(3) unsigned DEFAULT NULL,
  `Flight` tinyint(3) unsigned DEFAULT NULL,
  `Rooted` tinyint(3) unsigned DEFAULT NULL,
  `Chase` tinyint(3) unsigned DEFAULT NULL,
  `Random` tinyint(3) unsigned DEFAULT NULL,
  `InteractionPauseTimer` int(10) unsigned DEFAULT NULL COMMENT 'Time (in milliseconds) during which creature will not move after interaction with player',
  PRIMARY KEY (`CreatureId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_text`
--

DROP TABLE IF EXISTS `creature_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_text` (
  `CreatureID` int(10) unsigned NOT NULL DEFAULT '0',
  `GroupID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Text` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Language` tinyint(4) NOT NULL DEFAULT '0',
  `Probability` float NOT NULL DEFAULT '0',
  `Emote` int(10) unsigned NOT NULL DEFAULT '0',
  `Duration` int(10) unsigned NOT NULL DEFAULT '0',
  `Sound` int(10) unsigned NOT NULL DEFAULT '0',
  `SoundType` int(10) unsigned NOT NULL DEFAULT '0',
  `BroadcastTextId` int(11) NOT NULL DEFAULT '0',
  `TextRange` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`CreatureID`,`GroupID`,`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `creature_text_locale`
--

DROP TABLE IF EXISTS `creature_text_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_text_locale` (
  `CreatureID` int(10) unsigned NOT NULL DEFAULT '0',
  `GroupID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Locale` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Text` text COLLATE utf8mb4_bin,
  PRIMARY KEY (`CreatureID`,`GroupID`,`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `db_version_ytdb`
--

DROP TABLE IF EXISTS `db_version_ytdb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_version_ytdb` (
  `version` varchar(120) CHARACTER SET utf8 NOT NULL,
  `727_FIX_24398` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Used YTDB version notes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `disables`
--

DROP TABLE IF EXISTS `disables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `disables` (
  `sourceType` int(10) unsigned NOT NULL,
  `entry` int(10) unsigned NOT NULL,
  `flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `params_0` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `params_1` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`sourceType`,`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `disenchant_loot_template`
--

DROP TABLE IF EXISTS `disenchant_loot_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `disenchant_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Recommended id selection: item_level*100 + item_quality',
  `item` mediumint(9) NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `lootmode` set('REGULAR','DUNGEON_NORMAL','DUNGEON_HEROIC','RAID_10MAN_NORMAL','RAID_25MAN_NORMAL','RAID_10MAN_HEROIC','RAID_25MAN_HEROIC','RAID_25MAN_LFR','DUNGEON_CHALLENGE','RAID_40MAN','UNUSED','SCENARIO_HEROIC','SCENARIO_NORMAL','UNUSED2','RAID_1025MAN_FLEX') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`item`,`lootmode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emotetextsound_dbc`
--

DROP TABLE IF EXISTS `emotetextsound_dbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `emotetextsound_dbc` (
  `Id` int(11) NOT NULL DEFAULT '0',
  `EmotesTextId` int(11) NOT NULL DEFAULT '0',
  `RaceId` int(11) NOT NULL DEFAULT '0',
  `SexId` int(11) NOT NULL DEFAULT '0',
  `SoundId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_scripts`
--

DROP TABLE IF EXISTS `event_scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_scripts` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `dataint` int(11) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exploration_basexp`
--

DROP TABLE IF EXISTS `exploration_basexp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `exploration_basexp` (
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `basexp` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Exploration System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fishing_loot_template`
--

DROP TABLE IF EXISTS `fishing_loot_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fishing_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(9) NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `lootmode` set('REGULAR','DUNGEON_NORMAL','DUNGEON_HEROIC','RAID_10MAN_NORMAL','RAID_25MAN_NORMAL','RAID_10MAN_HEROIC','RAID_25MAN_HEROIC','RAID_25MAN_LFR','DUNGEON_CHALLENGE','RAID_40MAN','UNUSED','SCENARIO_HEROIC','SCENARIO_NORMAL','UNUSED2','RAID_1025MAN_FLEX') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`item`,`lootmode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_event`
--

DROP TABLE IF EXISTS `game_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_event` (
  `eventEntry` tinyint(3) unsigned NOT NULL COMMENT 'Entry of the game event',
  `start_time` timestamp NOT NULL DEFAULT '1999-12-31 16:00:00' COMMENT 'Absolute start date, the event will never start before',
  `end_time` timestamp NOT NULL DEFAULT '2037-12-31 16:00:00' COMMENT 'Absolute end date, the event will never start afler',
  `occurence` bigint(20) unsigned NOT NULL DEFAULT '5184000' COMMENT 'Delay in minutes between occurences of the event',
  `length` bigint(20) unsigned NOT NULL DEFAULT '2592000' COMMENT 'Length in minutes of the event',
  `holiday` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Client side holiday id',
  `holidayStage` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Description of the event displayed in console',
  `world_event` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 if normal event, 1 if world event',
  `ScriptName` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `announce` tinyint(3) unsigned DEFAULT '2' COMMENT '0 dont announce, 1 announce, 2 value from config',
  `world_state` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Needs for achievements',
  PRIMARY KEY (`eventEntry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_event_arena_seasons`
--

DROP TABLE IF EXISTS `game_event_arena_seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_event_arena_seasons` (
  `eventEntry` tinyint(3) unsigned NOT NULL COMMENT 'Entry of the game event',
  `season` tinyint(3) unsigned NOT NULL COMMENT 'Arena season number',
  UNIQUE KEY `season` (`season`,`eventEntry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_event_battleground_holiday`
--

DROP TABLE IF EXISTS `game_event_battleground_holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_event_battleground_holiday` (
  `eventEntry` tinyint(3) unsigned NOT NULL COMMENT 'Entry of the game event',
  `bgflag` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`eventEntry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_event_condition`
--

DROP TABLE IF EXISTS `game_event_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_event_condition` (
  `eventEntry` tinyint(3) unsigned NOT NULL COMMENT 'Entry of the game event',
  `condition_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `req_num` float DEFAULT '0',
  `max_world_state_field` smallint(5) unsigned NOT NULL DEFAULT '0',
  `done_world_state_field` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(25) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`eventEntry`,`condition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_event_creature`
--

DROP TABLE IF EXISTS `game_event_creature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_event_creature` (
  `eventEntry` tinyint(4) NOT NULL COMMENT 'Entry of the game event. Put negative entry to remove during event.',
  `guid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`guid`,`eventEntry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_event_creature_quest`
--

DROP TABLE IF EXISTS `game_event_creature_quest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_event_creature_quest` (
  `eventEntry` tinyint(3) unsigned NOT NULL COMMENT 'Entry of the game event.',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_event_gameobject`
--

DROP TABLE IF EXISTS `game_event_gameobject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_event_gameobject` (
  `eventEntry` tinyint(4) NOT NULL COMMENT 'Entry of the game event. Put negative entry to remove during event.',
  `guid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`guid`,`eventEntry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_event_gameobject_quest`
--

DROP TABLE IF EXISTS `game_event_gameobject_quest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_event_gameobject_quest` (
  `eventEntry` tinyint(3) unsigned NOT NULL COMMENT 'Entry of the game event',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`quest`,`eventEntry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_event_model_equip`
--

DROP TABLE IF EXISTS `game_event_model_equip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_event_model_equip` (
  `eventEntry` tinyint(4) NOT NULL COMMENT 'Entry of the game event.',
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `equipment_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_event_npc_vendor`
--

DROP TABLE IF EXISTS `game_event_npc_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_event_npc_vendor` (
  `eventEntry` tinyint(4) NOT NULL COMMENT 'Entry of the game event.',
  `guid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `slot` smallint(6) NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `maxcount` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `incrtime` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ExtendedCost` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`guid`,`item`,`ExtendedCost`,`type`),
  KEY `slot` (`slot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_event_npcflag`
--

DROP TABLE IF EXISTS `game_event_npcflag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_event_npcflag` (
  `eventEntry` tinyint(3) unsigned NOT NULL COMMENT 'Entry of the game event',
  `guid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `npcflag` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`eventEntry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_event_pool`
--

DROP TABLE IF EXISTS `game_event_pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_event_pool` (
  `eventEntry` tinyint(4) NOT NULL COMMENT 'Entry of the game event. Put negative entry to remove during event.',
  `pool_entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Id of the pool',
  PRIMARY KEY (`pool_entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_event_prerequisite`
--

DROP TABLE IF EXISTS `game_event_prerequisite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_event_prerequisite` (
  `eventEntry` tinyint(3) unsigned NOT NULL COMMENT 'Entry of the game event',
  `prerequisite_event` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`eventEntry`,`prerequisite_event`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_event_quest_condition`
--

DROP TABLE IF EXISTS `game_event_quest_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_event_quest_condition` (
  `eventEntry` tinyint(3) unsigned NOT NULL COMMENT 'Entry of the game event.',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `num` float DEFAULT '0',
  PRIMARY KEY (`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_event_seasonal_questrelation`
--

DROP TABLE IF EXISTS `game_event_seasonal_questrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_event_seasonal_questrelation` (
  `questId` int(10) unsigned NOT NULL COMMENT 'Quest Identifier',
  `eventEntry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Entry of the game event',
  PRIMARY KEY (`questId`,`eventEntry`),
  KEY `idx_quest` (`questId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Player System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_graveyard_zone`
--

DROP TABLE IF EXISTS `game_graveyard_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_graveyard_zone` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ghost_zone` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `faction` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`ghost_zone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Trigger System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_tele`
--

DROP TABLE IF EXISTS `game_tele`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_tele` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `map` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1863 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Tele Command';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_weather`
--

DROP TABLE IF EXISTS `game_weather`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_weather` (
  `zone` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spring_rain_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `spring_snow_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `spring_storm_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `summer_rain_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `summer_snow_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `summer_storm_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `fall_rain_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `fall_snow_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `fall_storm_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `winter_rain_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `winter_snow_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `winter_storm_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `ScriptName` char(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`zone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Weather System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gameobject`
--

DROP TABLE IF EXISTS `gameobject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `gameobject` (
  `guid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Global Unique Identifier',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Gameobject Identifier',
  `map` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `zoneId` int(10) unsigned NOT NULL DEFAULT '0',
  `areaId` int(10) unsigned NOT NULL DEFAULT '0',
  `spawnMask` int(11) DEFAULT NULL,
  `phaseMask` int(10) unsigned NOT NULL DEFAULT '1',
  `phaseId` int(10) unsigned NOT NULL DEFAULT '0',
  `phaseGroup` int(10) unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `rotation0` float NOT NULL DEFAULT '0',
  `rotation1` float NOT NULL DEFAULT '0',
  `rotation2` float NOT NULL DEFAULT '0',
  `rotation3` float NOT NULL DEFAULT '0',
  `spawntimesecs` int(11) NOT NULL DEFAULT '0',
  `animprogress` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ScriptName` char(64) CHARACTER SET utf8 DEFAULT '',
  `VerifiedBuild` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB AUTO_INCREMENT=4000077 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Gameobject System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gameobject_addon`
--

DROP TABLE IF EXISTS `gameobject_addon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `gameobject_addon` (
  `guid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `invisibilityType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `invisibilityValue` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gameobject_loot_template`
--

DROP TABLE IF EXISTS `gameobject_loot_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `gameobject_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(9) NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `lootmode` set('REGULAR','DUNGEON_NORMAL','DUNGEON_HEROIC','RAID_10MAN_NORMAL','RAID_25MAN_NORMAL','RAID_10MAN_HEROIC','RAID_25MAN_HEROIC','RAID_25MAN_LFR','DUNGEON_CHALLENGE','RAID_40MAN','UNUSED','SCENARIO_HEROIC','SCENARIO_NORMAL','UNUSED2','RAID_1025MAN_FLEX') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`item`,`lootmode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gameobject_questender`
--

DROP TABLE IF EXISTS `gameobject_questender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `gameobject_questender` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gameobject_queststarter`
--

DROP TABLE IF EXISTS `gameobject_queststarter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `gameobject_queststarter` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gameobject_scripts`
--

DROP TABLE IF EXISTS `gameobject_scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `gameobject_scripts` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `dataint` int(11) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gameobject_swap`
--

DROP TABLE IF EXISTS `gameobject_swap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `gameobject_swap` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Gameobject Identifier',
  `map` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `zoneId` int(10) unsigned NOT NULL DEFAULT '0',
  `areaId` int(10) unsigned NOT NULL DEFAULT '0',
  `spawnMask` int(11) DEFAULT NULL,
  `phaseMask` int(10) unsigned NOT NULL DEFAULT '1',
  `phaseId` int(10) unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `rotation0` float NOT NULL DEFAULT '0',
  `rotation1` float NOT NULL DEFAULT '0',
  `rotation2` float NOT NULL DEFAULT '0',
  `rotation3` float NOT NULL DEFAULT '0',
  `spawntimesecs` int(11) NOT NULL DEFAULT '0',
  `animprogress` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `entry_id` tinyint(4) DEFAULT NULL COMMENT 'Entry of the game event. Put negative entry to remove during event.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gameobject_template`
--

DROP TABLE IF EXISTS `gameobject_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `gameobject_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `displayId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `IconName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `castBarCaption` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `unk1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `size` float NOT NULL DEFAULT '1',
  `questItem1` int(10) unsigned NOT NULL DEFAULT '0',
  `questItem2` int(10) unsigned NOT NULL DEFAULT '0',
  `questItem3` int(10) unsigned NOT NULL DEFAULT '0',
  `questItem4` int(10) unsigned NOT NULL DEFAULT '0',
  `questItem5` int(10) unsigned NOT NULL DEFAULT '0',
  `questItem6` int(10) unsigned NOT NULL DEFAULT '0',
  `data0` int(10) unsigned DEFAULT '0',
  `data1` int(11) NOT NULL DEFAULT '-1',
  `data2` int(10) unsigned NOT NULL DEFAULT '0',
  `data3` int(10) unsigned NOT NULL DEFAULT '0',
  `data4` int(10) unsigned NOT NULL DEFAULT '0',
  `data5` int(10) unsigned NOT NULL DEFAULT '0',
  `data6` int(11) NOT NULL DEFAULT '-1',
  `data7` int(10) unsigned NOT NULL DEFAULT '0',
  `data8` int(10) unsigned NOT NULL DEFAULT '0',
  `data9` int(10) unsigned NOT NULL DEFAULT '0',
  `data10` int(10) unsigned NOT NULL DEFAULT '0',
  `data11` int(10) unsigned NOT NULL DEFAULT '0',
  `data12` int(10) unsigned NOT NULL DEFAULT '0',
  `data13` int(10) unsigned NOT NULL DEFAULT '0',
  `data14` int(10) unsigned NOT NULL DEFAULT '0',
  `data15` int(10) unsigned NOT NULL DEFAULT '0',
  `data16` int(10) unsigned NOT NULL DEFAULT '0',
  `data17` int(10) unsigned NOT NULL DEFAULT '0',
  `data18` int(10) unsigned NOT NULL DEFAULT '0',
  `data19` int(10) unsigned NOT NULL DEFAULT '0',
  `data20` int(10) unsigned NOT NULL DEFAULT '0',
  `data21` int(10) unsigned NOT NULL DEFAULT '0',
  `data22` int(10) unsigned NOT NULL DEFAULT '0',
  `data23` int(10) unsigned NOT NULL DEFAULT '0',
  `data24` int(10) unsigned NOT NULL DEFAULT '0',
  `data25` int(10) unsigned NOT NULL DEFAULT '0',
  `data26` int(10) unsigned NOT NULL DEFAULT '0',
  `data27` int(10) unsigned NOT NULL DEFAULT '0',
  `data28` int(10) unsigned NOT NULL DEFAULT '0',
  `data29` int(10) unsigned NOT NULL DEFAULT '0',
  `data30` int(10) unsigned NOT NULL DEFAULT '0',
  `data31` int(10) unsigned NOT NULL DEFAULT '0',
  `unkInt32` int(10) unsigned NOT NULL DEFAULT '0',
  `AIName` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ScriptName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `VerifiedBuild` smallint(6) DEFAULT '1',
  PRIMARY KEY (`entry`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Gameobject System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gameobject_template_addon`
--

DROP TABLE IF EXISTS `gameobject_template_addon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `gameobject_template_addon` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `faction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  `mingold` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `maxgold` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `maxDuplicates` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gameobject_template_locale`
--

DROP TABLE IF EXISTS `gameobject_template_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `gameobject_template_locale` (
  `entry` int(10) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_bin NOT NULL,
  `name` text COLLATE utf8mb4_bin,
  `castBarCaption` text COLLATE utf8mb4_bin,
  `VerifiedBuild` smallint(6) DEFAULT '0',
  PRIMARY KEY (`entry`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gossip_menu`
--

DROP TABLE IF EXISTS `gossip_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `gossip_menu` (
  `MenuID` int(10) unsigned NOT NULL DEFAULT '0',
  `TextID` int(10) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`MenuID`,`TextID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gossip_menu_option`
--

DROP TABLE IF EXISTS `gossip_menu_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `gossip_menu_option` (
  `MenuID` int(10) unsigned NOT NULL DEFAULT '0',
  `OptionID` int(10) unsigned NOT NULL DEFAULT '0',
  `OptionIcon` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `OptionText` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `OptionBroadcastTextID` int(10) unsigned NOT NULL DEFAULT '0',
  `OptionType` int(10) unsigned NOT NULL DEFAULT '0',
  `OptionNpcflag` bigint(20) unsigned NOT NULL DEFAULT '0',
  `ActionMenuID` int(10) unsigned NOT NULL DEFAULT '0',
  `ActionPoiID` int(10) unsigned NOT NULL DEFAULT '0',
  `BoxCoded` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `BoxMoney` int(10) unsigned NOT NULL DEFAULT '0',
  `BoxText` mediumtext COLLATE utf8mb4_bin,
  `BoxBroadcastTextID` int(10) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`MenuID`,`OptionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gossip_menu_option_locale`
--

DROP TABLE IF EXISTS `gossip_menu_option_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `gossip_menu_option_locale` (
  `MenuID` int(10) unsigned NOT NULL DEFAULT '0',
  `OptionID` int(10) unsigned NOT NULL DEFAULT '0',
  `Locale` varchar(4) COLLATE utf8mb4_bin NOT NULL,
  `OptionText` text COLLATE utf8mb4_bin,
  `BoxText` text COLLATE utf8mb4_bin,
  PRIMARY KEY (`MenuID`,`OptionID`,`Locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `graveyard_orientation`
--

DROP TABLE IF EXISTS `graveyard_orientation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `graveyard_orientation` (
  `Id` int(10) unsigned NOT NULL DEFAULT '0',
  `Orientation` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Orientations used by graveyards';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guild_challenge_reward`
--

DROP TABLE IF EXISTS `guild_challenge_reward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `guild_challenge_reward` (
  `Type` int(10) unsigned DEFAULT NULL,
  `Experience` int(10) unsigned DEFAULT NULL,
  `Gold` int(10) unsigned DEFAULT NULL,
  `Gold2` int(10) unsigned DEFAULT NULL,
  `Count` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guild_rewards`
--

DROP TABLE IF EXISTS `guild_rewards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `guild_rewards` (
  `entry` int(10) unsigned NOT NULL DEFAULT '0',
  `standing` tinyint(3) unsigned DEFAULT '0',
  `racemask` int(11) DEFAULT '0',
  `price` bigint(20) unsigned DEFAULT '0',
  `achievements` varchar(256) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guild_xp_for_level`
--

DROP TABLE IF EXISTS `guild_xp_for_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `guild_xp_for_level` (
  `lvl` int(10) unsigned NOT NULL,
  `xp_for_next_level` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lvl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `holiday_dates`
--

DROP TABLE IF EXISTS `holiday_dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `holiday_dates` (
  `id` int(10) unsigned NOT NULL,
  `date_id` tinyint(3) unsigned NOT NULL,
  `date_value` int(10) unsigned NOT NULL,
  `holiday_duration` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`date_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hotfix_data`
--

DROP TABLE IF EXISTS `hotfix_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotfix_data` (
  `entry` int(10) unsigned NOT NULL,
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `hotfixDate` datetime NOT NULL,
  PRIMARY KEY (`entry`,`type`,`hotfixDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `instance_encounters`
--

DROP TABLE IF EXISTS `instance_encounters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `instance_encounters` (
  `entry` int(10) unsigned NOT NULL COMMENT 'Unique entry from DungeonEncounter.dbc',
  `difficulty` enum('DUNGEON_NORMAL','DUNGEON_HEROIC','RAID_10MAN_NORMAL','RAID_25MAN_NORMAL','RAID_10MAN_HEROIC','RAID_25MAN_HEROIC','RAID_25MAN_LFR','DUNGEON_CHALLENGE','RAID_40MAN','UNUSED','SCENARIO_HEROIC','SCENARIO_NORMAL','UNUSED2','RAID_1025MAN_FLEX') CHARACTER SET utf8 NOT NULL DEFAULT 'DUNGEON_NORMAL',
  `creditType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `creditEntry` int(10) unsigned NOT NULL DEFAULT '0',
  `lastEncounterDungeon` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'If not 0, LfgDungeon.dbc entry for the instance it is last encounter in',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`entry`,`difficulty`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `instance_mogushan_system`
--

DROP TABLE IF EXISTS `instance_mogushan_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `instance_mogushan_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creature_id` int(11) NOT NULL DEFAULT '0',
  `generated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `resettime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `instance_template`
--

DROP TABLE IF EXISTS `instance_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `instance_template` (
  `map` smallint(5) unsigned NOT NULL,
  `parent` smallint(5) unsigned NOT NULL,
  `script` varchar(128) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `allowMount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`map`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_enchantment_template`
--

DROP TABLE IF EXISTS `item_enchantment_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_enchantment_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ench` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `chance` float unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`ench`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Item Random Enchantment System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_loot_template`
--

DROP TABLE IF EXISTS `item_loot_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(9) NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `lootmode` set('REGULAR','DUNGEON_NORMAL','DUNGEON_HEROIC','RAID_10MAN_NORMAL','RAID_25MAN_NORMAL','RAID_10MAN_HEROIC','RAID_25MAN_HEROIC','RAID_25MAN_LFR','DUNGEON_CHALLENGE','RAID_40MAN','UNUSED','SCENARIO_HEROIC','SCENARIO_NORMAL','UNUSED2','RAID_1025MAN_FLEX') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`item`,`lootmode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_script_names`
--

DROP TABLE IF EXISTS `item_script_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_script_names` (
  `Id` int(10) unsigned NOT NULL,
  `ScriptName` varchar(64) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_template`
--

DROP TABLE IF EXISTS `item_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `subclass` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SoundOverrideSubclass` tinyint(4) NOT NULL DEFAULT '-1',
  `name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `displayid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Quality` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Flags` bigint(20) NOT NULL DEFAULT '0',
  `FlagsExtra` int(10) unsigned NOT NULL DEFAULT '0',
  `Flags3` int(10) unsigned NOT NULL DEFAULT '0',
  `Unk430_1` float unsigned NOT NULL DEFAULT '1',
  `Unk430_2` float NOT NULL DEFAULT '1',
  `BuyCount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `BuyPrice` bigint(20) NOT NULL DEFAULT '0',
  `SellPrice` int(10) unsigned NOT NULL DEFAULT '0',
  `InventoryType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `AllowableClass` int(11) NOT NULL DEFAULT '-1',
  `AllowableRace` int(11) NOT NULL DEFAULT '-1',
  `ItemLevel` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RequiredSkill` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredSkillRank` smallint(5) unsigned NOT NULL DEFAULT '0',
  `requiredspell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `requiredhonorrank` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredCityRank` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredReputationFaction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredReputationRank` smallint(5) unsigned NOT NULL DEFAULT '0',
  `maxcount` int(11) NOT NULL DEFAULT '0',
  `stackable` int(11) DEFAULT '1',
  `ContainerSlots` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_type1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value1` smallint(6) NOT NULL DEFAULT '0',
  `stat_unk1_1` int(11) NOT NULL DEFAULT '0',
  `stat_unk2_1` float NOT NULL DEFAULT '0',
  `stat_type2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value2` smallint(6) NOT NULL DEFAULT '0',
  `stat_unk1_2` int(11) NOT NULL DEFAULT '0',
  `stat_unk2_2` float NOT NULL DEFAULT '0',
  `stat_type3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value3` smallint(6) NOT NULL DEFAULT '0',
  `stat_unk1_3` int(11) NOT NULL DEFAULT '0',
  `stat_unk2_3` float NOT NULL DEFAULT '0',
  `stat_type4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value4` smallint(6) NOT NULL DEFAULT '0',
  `stat_unk1_4` int(11) NOT NULL DEFAULT '0',
  `stat_unk2_4` float NOT NULL DEFAULT '0',
  `stat_type5` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value5` smallint(6) NOT NULL DEFAULT '0',
  `stat_unk1_5` int(11) NOT NULL DEFAULT '0',
  `stat_unk2_5` float NOT NULL DEFAULT '0',
  `stat_type6` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value6` smallint(6) NOT NULL DEFAULT '0',
  `stat_unk1_6` int(11) NOT NULL DEFAULT '0',
  `stat_unk2_6` float NOT NULL DEFAULT '0',
  `stat_type7` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value7` smallint(6) NOT NULL DEFAULT '0',
  `stat_unk1_7` int(11) NOT NULL DEFAULT '0',
  `stat_unk2_7` float NOT NULL DEFAULT '0',
  `stat_type8` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value8` smallint(6) NOT NULL DEFAULT '0',
  `stat_unk1_8` int(11) NOT NULL DEFAULT '0',
  `stat_unk2_8` float NOT NULL DEFAULT '0',
  `stat_type9` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value9` smallint(6) NOT NULL DEFAULT '0',
  `stat_unk1_9` int(11) NOT NULL DEFAULT '0',
  `stat_unk2_9` float NOT NULL DEFAULT '0',
  `stat_type10` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value10` smallint(6) NOT NULL DEFAULT '0',
  `stat_unk1_10` int(11) NOT NULL DEFAULT '0',
  `stat_unk2_10` float NOT NULL DEFAULT '0',
  `ScalingStatDistribution` smallint(6) NOT NULL DEFAULT '0',
  `ScalingStatValue` int(11) NOT NULL DEFAULT '0',
  `DamageType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `delay` smallint(5) unsigned NOT NULL DEFAULT '1000',
  `RangedModRange` float NOT NULL DEFAULT '0',
  `spellid_1` mediumint(9) NOT NULL DEFAULT '0',
  `spelltrigger_1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spellcharges_1` smallint(6) DEFAULT NULL,
  `spellcooldown_1` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_1` int(11) NOT NULL DEFAULT '-1',
  `spellid_2` mediumint(9) NOT NULL DEFAULT '0',
  `spelltrigger_2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spellcharges_2` smallint(6) DEFAULT NULL,
  `spellcooldown_2` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_2` int(11) NOT NULL DEFAULT '-1',
  `spellid_3` mediumint(9) NOT NULL DEFAULT '0',
  `spelltrigger_3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spellcharges_3` smallint(6) DEFAULT NULL,
  `spellcooldown_3` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_3` int(11) NOT NULL DEFAULT '-1',
  `spellid_4` mediumint(9) NOT NULL DEFAULT '0',
  `spelltrigger_4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spellcharges_4` smallint(6) DEFAULT NULL,
  `spellcooldown_4` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_4` int(11) NOT NULL DEFAULT '-1',
  `spellid_5` mediumint(9) NOT NULL DEFAULT '0',
  `spelltrigger_5` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spellcharges_5` smallint(6) DEFAULT NULL,
  `spellcooldown_5` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_5` int(11) NOT NULL DEFAULT '-1',
  `bonding` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `PageText` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `LanguageID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `PageMaterial` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `startquest` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lockid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Material` tinyint(4) NOT NULL DEFAULT '0',
  `sheath` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RandomProperty` mediumint(9) NOT NULL DEFAULT '0',
  `RandomSuffix` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `itemset` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `MaxDurability` smallint(5) unsigned NOT NULL DEFAULT '0',
  `area` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Map` smallint(6) NOT NULL DEFAULT '0',
  `BagFamily` mediumint(9) NOT NULL DEFAULT '0',
  `TotemCategory` mediumint(9) NOT NULL DEFAULT '0',
  `socketColor_1` tinyint(4) NOT NULL DEFAULT '0',
  `socketContent_1` mediumint(9) NOT NULL DEFAULT '0',
  `socketColor_2` tinyint(4) NOT NULL DEFAULT '0',
  `socketContent_2` mediumint(9) NOT NULL DEFAULT '0',
  `socketColor_3` tinyint(4) NOT NULL DEFAULT '0',
  `socketContent_3` mediumint(9) NOT NULL DEFAULT '0',
  `socketBonus` mediumint(9) NOT NULL DEFAULT '0',
  `GemProperties` mediumint(9) NOT NULL DEFAULT '0',
  `ArmorDamageModifier` float NOT NULL DEFAULT '0',
  `duration` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemLimitCategory` smallint(6) NOT NULL DEFAULT '0',
  `HolidayId` int(10) unsigned NOT NULL DEFAULT '0',
  `StatScalingFactor` float NOT NULL DEFAULT '0',
  `CurrencySubstitutionId` int(10) unsigned NOT NULL DEFAULT '0',
  `CurrencySubstitutionCount` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredDisenchantSkill` int(11) NOT NULL DEFAULT '0',
  `flagsCustom` int(10) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) DEFAULT '1',
  PRIMARY KEY (`entry`),
  KEY `idx_name` (`name`),
  KEY `items_index` (`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Item System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_template_addon`
--

DROP TABLE IF EXISTS `item_template_addon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_template_addon` (
  `Id` int(10) unsigned NOT NULL,
  `FlagsCu` int(10) unsigned NOT NULL DEFAULT '0',
  `FoodType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MinMoneyLoot` int(10) unsigned NOT NULL DEFAULT '0',
  `MaxMoneyLoot` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellPPMChance` float unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_template_locale`
--

DROP TABLE IF EXISTS `item_template_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_template_locale` (
  `ID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_bin NOT NULL,
  `Name` text CHARACTER SET utf8,
  `Description` text CHARACTER SET utf8,
  `VerifiedBuild` smallint(6) DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `itemextendedcost_18414`
--

DROP TABLE IF EXISTS `itemextendedcost_18414`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemextendedcost_18414` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `Reqhonorpoints` int(10) unsigned NOT NULL DEFAULT '0',
  `Reqarenapoints` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredArenaSlot` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredItem_1` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredItem_2` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredItem_3` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredItem_4` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredItem_5` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredItemCount_1` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredItemCount_2` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredItemCount_3` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredItemCount_4` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredItemCount_5` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredPersonalArenaRating` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemPurchaseGroup` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredCurrency_1` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredCurrency_2` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredCurrency_3` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredCurrency_4` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredCurrency_5` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredCurrencyCount_1` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredCurrencyCount_2` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredCurrencyCount_3` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredCurrencyCount_4` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredCurrencyCount_5` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredFactionId` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredFactionStanding` int(10) unsigned NOT NULL DEFAULT '0',
  `RequirementFlags` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredGuildLevel` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredAchievement` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keychain_db2`
--

DROP TABLE IF EXISTS `keychain_db2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `keychain_db2` (
  `keyId` int(10) unsigned NOT NULL DEFAULT '0',
  `k1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `k2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `k3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `k4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `k5` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `k6` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `k7` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `k8` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `k9` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `k10` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `k11` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `k12` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `k13` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `k14` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `k15` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `k16` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `k17` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `k18` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `k19` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `k20` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `k21` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `k22` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `k23` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `k24` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `k25` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `k26` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `k27` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `k28` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `k29` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `k30` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `k31` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `k32` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`keyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `legendary_quest_loot_template`
--

DROP TABLE IF EXISTS `legendary_quest_loot_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `legendary_quest_loot_template` (
  `entry` int(10) unsigned NOT NULL,
  `quest` int(10) unsigned NOT NULL,
  `item` int(10) unsigned NOT NULL,
  `chance` float DEFAULT '100',
  `count_min` smallint(5) unsigned NOT NULL DEFAULT '1',
  `count_max` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`quest`,`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `letter_analogs`
--

DROP TABLE IF EXISTS `letter_analogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `letter_analogs` (
  `letter` varchar(1) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `analogs` varchar(128) CHARACTER SET utf8 DEFAULT '',
  PRIMARY KEY (`letter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin MAX_ROWS=26 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lfg_dungeon_rewards`
--

DROP TABLE IF EXISTS `lfg_dungeon_rewards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lfg_dungeon_rewards` (
  `dungeonId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Dungeon entry from dbc',
  `maxLevel` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Max level at which this reward is rewarded',
  `firstQuestId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest id with rewards for first dungeon this day',
  `otherQuestId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest id with rewards for Nth dungeon this day',
  PRIMARY KEY (`dungeonId`,`maxLevel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lfg_dungeon_template`
--

DROP TABLE IF EXISTS `lfg_dungeon_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lfg_dungeon_template` (
  `dungeonId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Unique id from LFGDungeons.dbc',
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `requiredItemLevel` smallint(6) DEFAULT '0',
  PRIMARY KEY (`dungeonId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `linked_respawn`
--

DROP TABLE IF EXISTS `linked_respawn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `linked_respawn` (
  `guid` int(10) unsigned NOT NULL COMMENT 'dependent creature',
  `linkedGuid` int(10) unsigned NOT NULL COMMENT 'master creature',
  `linkType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`linkType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Creature Respawn Link System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locales_battle_pay_entry`
--

DROP TABLE IF EXISTS `locales_battle_pay_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `locales_battle_pay_entry` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `title_loc1` longtext COLLATE utf8mb4_bin,
  `title_loc2` longtext COLLATE utf8mb4_bin,
  `title_loc3` longtext COLLATE utf8mb4_bin,
  `title_loc4` longtext COLLATE utf8mb4_bin,
  `title_loc5` longtext COLLATE utf8mb4_bin,
  `title_loc6` longtext COLLATE utf8mb4_bin,
  `title_loc7` longtext COLLATE utf8mb4_bin,
  `title_loc8` longtext COLLATE utf8mb4_bin,
  `title_loc9` longtext COLLATE utf8mb4_bin,
  `title_loc10` longtext COLLATE utf8mb4_bin,
  `title_loc11` longtext COLLATE utf8mb4_bin,
  `description_loc1` longtext COLLATE utf8mb4_bin,
  `description_loc2` longtext COLLATE utf8mb4_bin,
  `description_loc3` longtext COLLATE utf8mb4_bin,
  `description_loc4` longtext COLLATE utf8mb4_bin,
  `description_loc5` longtext COLLATE utf8mb4_bin,
  `description_loc6` longtext COLLATE utf8mb4_bin,
  `description_loc7` longtext COLLATE utf8mb4_bin,
  `description_loc8` longtext COLLATE utf8mb4_bin,
  `description_loc9` longtext COLLATE utf8mb4_bin,
  `description_loc10` longtext COLLATE utf8mb4_bin,
  `description_loc11` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locales_battle_pay_group`
--

DROP TABLE IF EXISTS `locales_battle_pay_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `locales_battle_pay_group` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `name_loc1` longtext COLLATE utf8mb4_bin,
  `name_loc2` longtext COLLATE utf8mb4_bin,
  `name_loc3` longtext COLLATE utf8mb4_bin,
  `name_loc4` longtext COLLATE utf8mb4_bin,
  `name_loc5` longtext COLLATE utf8mb4_bin,
  `name_loc6` longtext COLLATE utf8mb4_bin,
  `name_loc7` longtext COLLATE utf8mb4_bin,
  `name_loc8` longtext COLLATE utf8mb4_bin,
  `name_loc9` longtext COLLATE utf8mb4_bin,
  `name_loc10` longtext COLLATE utf8mb4_bin,
  `name_loc11` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locales_battle_pay_product`
--

DROP TABLE IF EXISTS `locales_battle_pay_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `locales_battle_pay_product` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `title_loc1` longtext COLLATE utf8mb4_bin,
  `title_loc2` longtext COLLATE utf8mb4_bin,
  `title_loc3` longtext COLLATE utf8mb4_bin,
  `title_loc4` longtext COLLATE utf8mb4_bin,
  `title_loc5` longtext COLLATE utf8mb4_bin,
  `title_loc6` longtext COLLATE utf8mb4_bin,
  `title_loc7` longtext COLLATE utf8mb4_bin,
  `title_loc8` longtext COLLATE utf8mb4_bin,
  `title_loc9` longtext COLLATE utf8mb4_bin,
  `title_loc10` longtext COLLATE utf8mb4_bin,
  `title_loc11` longtext COLLATE utf8mb4_bin,
  `description_loc1` longtext COLLATE utf8mb4_bin,
  `description_loc2` longtext COLLATE utf8mb4_bin,
  `description_loc3` longtext COLLATE utf8mb4_bin,
  `description_loc4` longtext COLLATE utf8mb4_bin,
  `description_loc5` longtext COLLATE utf8mb4_bin,
  `description_loc6` longtext COLLATE utf8mb4_bin,
  `description_loc7` longtext COLLATE utf8mb4_bin,
  `description_loc8` longtext COLLATE utf8mb4_bin,
  `description_loc9` longtext COLLATE utf8mb4_bin,
  `description_loc10` longtext COLLATE utf8mb4_bin,
  `description_loc11` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mail_level_reward`
--

DROP TABLE IF EXISTS `mail_level_reward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mail_level_reward` (
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `raceMask` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mailTemplateId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `senderEntry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`level`,`raceMask`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Mail System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mail_loot_template`
--

DROP TABLE IF EXISTS `mail_loot_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mail_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(9) NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `lootmode` set('REGULAR','DUNGEON_NORMAL','DUNGEON_HEROIC','RAID_10MAN_NORMAL','RAID_25MAN_NORMAL','RAID_10MAN_HEROIC','RAID_25MAN_HEROIC','RAID_25MAN_LFR','DUNGEON_CHALLENGE','RAID_40MAN','UNUSED','SCENARIO_HEROIC','SCENARIO_NORMAL','UNUSED2','RAID_1025MAN_FLEX') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`item`,`lootmode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `milling_loot_template`
--

DROP TABLE IF EXISTS `milling_loot_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `milling_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(9) NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `lootmode` set('REGULAR','DUNGEON_NORMAL','DUNGEON_HEROIC','RAID_10MAN_NORMAL','RAID_25MAN_NORMAL','RAID_10MAN_HEROIC','RAID_25MAN_HEROIC','RAID_25MAN_LFR','DUNGEON_CHALLENGE','RAID_40MAN','UNUSED','SCENARIO_HEROIC','SCENARIO_NORMAL','UNUSED2','RAID_1025MAN_FLEX') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`item`,`lootmode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `npc_spellclick_spells`
--

DROP TABLE IF EXISTS `npc_spellclick_spells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `npc_spellclick_spells` (
  `npc_entry` int(10) unsigned NOT NULL COMMENT 'reference to creature_template',
  `spell_id` int(10) unsigned NOT NULL COMMENT 'spell which should be casted ',
  `cast_flags` tinyint(3) unsigned NOT NULL COMMENT 'first bit defines caster: 1=player, 0=creature; second bit defines target, same mapping as caster bit',
  `user_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'relation with summoner: 0-no 1-friendly 2-raid 3-party player can click',
  PRIMARY KEY (`npc_entry`,`spell_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `npc_teleport`
--

DROP TABLE IF EXISTS `npc_teleport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `npc_teleport` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu` int(10) unsigned NOT NULL DEFAULT '0',
  `submenu` int(10) unsigned NOT NULL DEFAULT '0',
  `icon` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `cost` int(10) unsigned NOT NULL DEFAULT '0',
  `faction` int(10) unsigned NOT NULL DEFAULT '0',
  `map` int(10) unsigned NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `npc_text`
--

DROP TABLE IF EXISTS `npc_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `npc_text` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `text0_0` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `text0_1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `BroadcastTextID0` int(11) NOT NULL DEFAULT '0',
  `lang0` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Probability0` float NOT NULL DEFAULT '0',
  `EmoteDelay0_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Emote0_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay0_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Emote0_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay0_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Emote0_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `text1_0` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `text1_1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `BroadcastTextID1` int(11) NOT NULL DEFAULT '0',
  `lang1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Probability1` float NOT NULL DEFAULT '0',
  `EmoteDelay1_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Emote1_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay1_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Emote1_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay1_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Emote1_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `text2_0` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `text2_1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `BroadcastTextID2` int(11) NOT NULL DEFAULT '0',
  `lang2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Probability2` float NOT NULL DEFAULT '0',
  `EmoteDelay2_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Emote2_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay2_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Emote2_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay2_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Emote2_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `text3_0` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `text3_1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `BroadcastTextID3` int(11) NOT NULL DEFAULT '0',
  `lang3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Probability3` float NOT NULL DEFAULT '0',
  `EmoteDelay3_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Emote3_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay3_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Emote3_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay3_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Emote3_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `text4_0` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `text4_1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `BroadcastTextID4` int(11) NOT NULL DEFAULT '0',
  `lang4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Probability4` float NOT NULL DEFAULT '0',
  `EmoteDelay4_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Emote4_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay4_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Emote4_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay4_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Emote4_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `text5_0` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `text5_1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `BroadcastTextID5` int(11) NOT NULL DEFAULT '0',
  `lang5` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Probability5` float NOT NULL DEFAULT '0',
  `EmoteDelay5_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Emote5_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay5_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Emote5_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay5_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Emote5_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `text6_0` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `text6_1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `BroadcastTextID6` int(11) NOT NULL DEFAULT '0',
  `lang6` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Probability6` float NOT NULL DEFAULT '0',
  `EmoteDelay6_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Emote6_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay6_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Emote6_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay6_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Emote6_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `text7_0` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `text7_1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `BroadcastTextID7` int(11) NOT NULL DEFAULT '0',
  `lang7` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Probability7` float NOT NULL DEFAULT '0',
  `EmoteDelay7_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Emote7_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay7_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Emote7_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay7_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Emote7_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `npc_text_locale`
--

DROP TABLE IF EXISTS `npc_text_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `npc_text_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Locale` varchar(4) COLLATE utf8mb4_bin NOT NULL,
  `Text0_0` longtext COLLATE utf8mb4_bin,
  `Text0_1` longtext COLLATE utf8mb4_bin,
  `Text1_0` longtext COLLATE utf8mb4_bin,
  `Text1_1` longtext COLLATE utf8mb4_bin,
  `Text2_0` longtext COLLATE utf8mb4_bin,
  `Text2_1` longtext COLLATE utf8mb4_bin,
  `Text3_0` longtext COLLATE utf8mb4_bin,
  `Text3_1` longtext COLLATE utf8mb4_bin,
  `Text4_0` longtext COLLATE utf8mb4_bin,
  `Text4_1` longtext COLLATE utf8mb4_bin,
  `Text5_0` longtext COLLATE utf8mb4_bin,
  `Text5_1` longtext COLLATE utf8mb4_bin,
  `Text6_0` longtext COLLATE utf8mb4_bin,
  `Text6_1` longtext COLLATE utf8mb4_bin,
  `Text7_0` longtext COLLATE utf8mb4_bin,
  `Text7_1` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`ID`,`Locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `npc_trainer`
--

DROP TABLE IF EXISTS `npc_trainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `npc_trainer` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell` mediumint(9) NOT NULL DEFAULT '0',
  `spellcost` int(10) unsigned NOT NULL DEFAULT '0',
  `reqskill` smallint(5) unsigned NOT NULL DEFAULT '0',
  `reqskillvalue` smallint(5) unsigned NOT NULL DEFAULT '0',
  `reqlevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `npc_vendor`
--

DROP TABLE IF EXISTS `npc_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `npc_vendor` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `slot` smallint(6) NOT NULL DEFAULT '0',
  `item` mediumint(9) NOT NULL DEFAULT '0',
  `maxcount` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `incrtime` int(10) unsigned NOT NULL DEFAULT '0',
  `ExtendedCost` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`item`,`ExtendedCost`,`type`),
  KEY `slot` (`slot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Npc System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `object_visibility`
--

DROP TABLE IF EXISTS `object_visibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_visibility` (
  `type` enum('Creature','GameObject','DynamicObject') CHARACTER SET utf8 NOT NULL,
  `entry` mediumint(9) NOT NULL,
  `distance` float NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `importance` enum('Critical','Large','DistantScenery','FlyingScenery','GroundScenery','FlyingClutter','GroundClutter') CHARACTER SET utf8 DEFAULT NULL,
  `comment` tinytext CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`type`,`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `object_visibility_state`
--

DROP TABLE IF EXISTS `object_visibility_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_visibility_state` (
  `type` enum('GameObject','Creature') CHARACTER SET utf8 NOT NULL,
  `entryorguid` int(11) NOT NULL,
  `visibilityQuestID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `visibilityQuestState` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`type`,`entryorguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `outdoorpvp_template`
--

DROP TABLE IF EXISTS `outdoorpvp_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `outdoorpvp_template` (
  `TypeId` tinyint(3) unsigned NOT NULL,
  `ScriptName` char(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `comment` text CHARACTER SET utf8,
  PRIMARY KEY (`TypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='OutdoorPvP Templates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `page_text`
--

DROP TABLE IF EXISTS `page_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_text` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `text` longtext CHARACTER SET utf8 NOT NULL,
  `next_page` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) DEFAULT '1',
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Item System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `page_text_locale`
--

DROP TABLE IF EXISTS `page_text_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_text_locale` (
  `ID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_bin NOT NULL,
  `Text` text COLLATE utf8mb4_bin,
  `VerifiedBuild` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `personal_loot_item`
--

DROP TABLE IF EXISTS `personal_loot_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_loot_item` (
  `entry` int(10) unsigned NOT NULL,
  `item` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entry`,`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `personal_loot_template`
--

DROP TABLE IF EXISTS `personal_loot_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_loot_template` (
  `entry` int(10) unsigned NOT NULL,
  `money_bag` int(10) unsigned NOT NULL,
  `money_bag_flex` int(10) unsigned NOT NULL,
  `quest` int(10) unsigned NOT NULL DEFAULT '0',
  `legendary_quest_loot` set('MOGU_SEALS','SECRETS_OF_THE_EMPIRE','TITAN_RUNESTONE','CHIMERA_OF_FEAR','HEART_OF_THUNDER_KING') CHARACTER SET utf8 DEFAULT NULL,
  `comment` text CHARACTER SET utf8,
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pet_levelstats`
--

DROP TABLE IF EXISTS `pet_levelstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet_levelstats` (
  `creature_entry` mediumint(8) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `hp` smallint(5) unsigned NOT NULL,
  `mana` smallint(5) unsigned NOT NULL,
  `armor` int(10) unsigned NOT NULL DEFAULT '0',
  `str` smallint(5) unsigned NOT NULL,
  `agi` smallint(5) unsigned NOT NULL,
  `sta` smallint(5) unsigned NOT NULL,
  `inte` smallint(5) unsigned NOT NULL,
  `spi` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`creature_entry`,`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin PACK_KEYS=0 ROW_FORMAT=DYNAMIC COMMENT='Stores pet levels stats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pet_name_generation`
--

DROP TABLE IF EXISTS `pet_name_generation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet_name_generation` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `word` tinytext CHARACTER SET utf8 NOT NULL,
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `half` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=314 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pet_scaling`
--

DROP TABLE IF EXISTS `pet_scaling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet_scaling` (
  `entry` int(10) unsigned NOT NULL,
  `ap_per_spd` float NOT NULL DEFAULT '0',
  `ap_per_ap` float NOT NULL DEFAULT '0',
  `spd_per_spd` float NOT NULL DEFAULT '0',
  `spd_per_ap` float NOT NULL DEFAULT '0',
  `hp_per_hp` float NOT NULL DEFAULT '0',
  `base_damage_coeff` float NOT NULL DEFAULT '1',
  `comment` text CHARACTER SET utf8,
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `phase_area`
--

DROP TABLE IF EXISTS `phase_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phase_area` (
  `AreaId` int(10) unsigned NOT NULL,
  `PhaseId` int(10) unsigned NOT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`AreaId`,`PhaseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `phase_definitions`
--

DROP TABLE IF EXISTS `phase_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phase_definitions` (
  `zoneId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `entry` smallint(5) unsigned NOT NULL,
  `phasemask` bigint(20) unsigned NOT NULL DEFAULT '0',
  `phaseId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `terrainswapmap` smallint(5) unsigned NOT NULL DEFAULT '0',
  `worldMapArea` smallint(5) unsigned NOT NULL DEFAULT '0',
  `flags` tinyint(3) unsigned DEFAULT '0',
  `comment` text CHARACTER SET utf8,
  PRIMARY KEY (`zoneId`,`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pickpocketing_loot_template`
--

DROP TABLE IF EXISTS `pickpocketing_loot_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pickpocketing_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(9) NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `lootmode` set('REGULAR','DUNGEON_NORMAL','DUNGEON_HEROIC','RAID_10MAN_NORMAL','RAID_25MAN_NORMAL','RAID_10MAN_HEROIC','RAID_25MAN_HEROIC','RAID_25MAN_LFR','DUNGEON_CHALLENGE','RAID_40MAN','UNUSED','SCENARIO_HEROIC','SCENARIO_NORMAL','UNUSED2','RAID_1025MAN_FLEX') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`item`,`lootmode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `player_class_spells`
--

DROP TABLE IF EXISTS `player_class_spells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_class_spells` (
  `class` tinyint(3) unsigned NOT NULL,
  `spell` mediumint(8) unsigned NOT NULL,
  `comment` text CHARACTER SET utf8,
  PRIMARY KEY (`class`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `player_factionchange_achievement`
--

DROP TABLE IF EXISTS `player_factionchange_achievement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_factionchange_achievement` (
  `alliance_id` int(10) unsigned NOT NULL,
  `horde_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `player_factionchange_items`
--

DROP TABLE IF EXISTS `player_factionchange_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_factionchange_items` (
  `race_A` int(10) unsigned NOT NULL,
  `alliance_id` int(10) unsigned NOT NULL,
  `commentA` text CHARACTER SET utf8,
  `race_H` int(10) unsigned NOT NULL,
  `horde_id` int(10) unsigned NOT NULL,
  `commentH` text CHARACTER SET utf8,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `player_factionchange_quests`
--

DROP TABLE IF EXISTS `player_factionchange_quests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_factionchange_quests` (
  `alliance_id` int(10) unsigned NOT NULL,
  `horde_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`),
  UNIQUE KEY `alliance_uniq` (`alliance_id`),
  UNIQUE KEY `horde_uniq` (`horde_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `player_factionchange_reputations`
--

DROP TABLE IF EXISTS `player_factionchange_reputations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_factionchange_reputations` (
  `alliance_id` int(10) unsigned NOT NULL,
  `horde_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `player_factionchange_spells`
--

DROP TABLE IF EXISTS `player_factionchange_spells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_factionchange_spells` (
  `alliance_id` int(10) unsigned NOT NULL,
  `horde_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `player_factionchange_titles`
--

DROP TABLE IF EXISTS `player_factionchange_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_factionchange_titles` (
  `alliance_id` int(11) NOT NULL,
  `horde_id` int(11) NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `player_levelstats`
--

DROP TABLE IF EXISTS `player_levelstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_levelstats` (
  `race` tinyint(3) unsigned NOT NULL,
  `class` tinyint(3) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `str` tinyint(3) unsigned NOT NULL,
  `agi` tinyint(3) unsigned NOT NULL,
  `sta` tinyint(3) unsigned NOT NULL,
  `inte` tinyint(3) unsigned NOT NULL,
  `spi` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`race`,`class`,`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin PACK_KEYS=0 ROW_FORMAT=DYNAMIC COMMENT='Stores levels stats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `player_xp_for_level`
--

DROP TABLE IF EXISTS `player_xp_for_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_xp_for_level` (
  `lvl` tinyint(3) unsigned NOT NULL,
  `xp_for_next_level` int(10) unsigned NOT NULL,
  PRIMARY KEY (`lvl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playerbots_rpg_races`
--

DROP TABLE IF EXISTS `playerbots_rpg_races`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `playerbots_rpg_races` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entry` int(11) DEFAULT NULL,
  `race` int(11) DEFAULT NULL,
  `minl` int(11) DEFAULT NULL,
  `maxl` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry` (`entry`)
) ENGINE=InnoDB AUTO_INCREMENT=442 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playercreateinfo`
--

DROP TABLE IF EXISTS `playercreateinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `playercreateinfo` (
  `race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `map` smallint(5) unsigned NOT NULL DEFAULT '0',
  `zone` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`race`,`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playercreateinfo_action`
--

DROP TABLE IF EXISTS `playercreateinfo_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `playercreateinfo_action` (
  `race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `button` smallint(5) unsigned NOT NULL DEFAULT '0',
  `action` int(10) unsigned NOT NULL DEFAULT '0',
  `type` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`race`,`class`,`button`),
  KEY `playercreateinfo_race_class_index` (`race`,`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playercreateinfo_cast_spell`
--

DROP TABLE IF EXISTS `playercreateinfo_cast_spell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `playercreateinfo_cast_spell` (
  `raceMask` bigint(20) unsigned NOT NULL,
  `classMask` int(10) unsigned NOT NULL DEFAULT '0',
  `spell` int(10) unsigned NOT NULL DEFAULT '0',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`raceMask`,`classMask`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playercreateinfo_item`
--

DROP TABLE IF EXISTS `playercreateinfo_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `playercreateinfo_item` (
  `race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `itemid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `amount` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`race`,`class`,`itemid`),
  KEY `playercreateinfo_race_class_index` (`race`,`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playercreateinfo_skills`
--

DROP TABLE IF EXISTS `playercreateinfo_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `playercreateinfo_skills` (
  `raceMask` int(10) unsigned NOT NULL,
  `classMask` int(10) unsigned NOT NULL,
  `skill` smallint(5) unsigned NOT NULL,
  `rank` smallint(5) unsigned NOT NULL DEFAULT '0',
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`raceMask`,`classMask`,`skill`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `playercreateinfo_spell_custom`
--

DROP TABLE IF EXISTS `playercreateinfo_spell_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `playercreateinfo_spell_custom` (
  `racemask` int(10) unsigned NOT NULL DEFAULT '0',
  `classmask` int(10) unsigned NOT NULL DEFAULT '0',
  `Spell` int(10) unsigned NOT NULL DEFAULT '0',
  `Note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`racemask`,`classmask`,`Spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `players_reports_status`
--

DROP TABLE IF EXISTS `players_reports_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `players_reports_status` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `creation_time` int(10) unsigned NOT NULL DEFAULT '0',
  `average` float NOT NULL DEFAULT '0',
  `total_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  `speed_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  `fly_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  `jump_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  `waterwalk_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  `teleportplane_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  `climb_reports` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `points_of_interest`
--

DROP TABLE IF EXISTS `points_of_interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `points_of_interest` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `PositionX` float NOT NULL DEFAULT '0',
  `PositionY` float NOT NULL DEFAULT '0',
  `Icon` int(10) unsigned NOT NULL DEFAULT '0',
  `Flags` int(10) unsigned NOT NULL DEFAULT '0',
  `Importance` int(10) unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `VerifiedBuild` smallint(6) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `points_of_interest_locale`
--

DROP TABLE IF EXISTS `points_of_interest_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `points_of_interest_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_bin NOT NULL,
  `Name` text COLLATE utf8mb4_bin,
  `VerifiedBuild` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pool_creature`
--

DROP TABLE IF EXISTS `pool_creature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pool_creature` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `pool_entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `chance` float unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`guid`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pool_gameobject`
--

DROP TABLE IF EXISTS `pool_gameobject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pool_gameobject` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `pool_entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `chance` float unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`guid`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pool_pool`
--

DROP TABLE IF EXISTS `pool_pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pool_pool` (
  `pool_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mother_pool` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `chance` float NOT NULL DEFAULT '0',
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`pool_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pool_quest`
--

DROP TABLE IF EXISTS `pool_quest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pool_quest` (
  `entry` int(10) unsigned NOT NULL DEFAULT '0',
  `pool_entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `chance` float unsigned NOT NULL DEFAULT '0' COMMENT 'Avoid mixing explicit-chanced and equal-chanced quest pool objects',
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`entry`),
  KEY `idx_guid` (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pool_template`
--

DROP TABLE IF EXISTS `pool_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pool_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Pool entry',
  `max_limit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Max number of objects (0) is no limit',
  `description` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prospecting_loot_template`
--

DROP TABLE IF EXISTS `prospecting_loot_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `prospecting_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(9) NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `lootmode` set('REGULAR','DUNGEON_NORMAL','DUNGEON_HEROIC','RAID_10MAN_NORMAL','RAID_25MAN_NORMAL','RAID_10MAN_HEROIC','RAID_25MAN_HEROIC','RAID_25MAN_LFR','DUNGEON_CHALLENGE','RAID_40MAN','UNUSED','SCENARIO_HEROIC','SCENARIO_NORMAL','UNUSED2','RAID_1025MAN_FLEX') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`item`,`lootmode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quest_details`
--

DROP TABLE IF EXISTS `quest_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `quest_details` (
  `ID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Emote1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Emote2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Emote3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Emote4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay1` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay2` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay3` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay4` int(10) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quest_objective`
--

DROP TABLE IF EXISTS `quest_objective`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `quest_objective` (
  `questId` int(10) unsigned NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `index` tinyint(4) NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `objectId` int(11) NOT NULL DEFAULT '0',
  `amount` int(11) NOT NULL DEFAULT '0',
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8,
  PRIMARY KEY (`id`,`questId`,`index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quest_objective_effects`
--

DROP TABLE IF EXISTS `quest_objective_effects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `quest_objective_effects` (
  `objectiveId` int(10) unsigned NOT NULL DEFAULT '0',
  `visualEffect` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`objectiveId`,`visualEffect`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quest_objectives_locale`
--

DROP TABLE IF EXISTS `quest_objectives_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `quest_objectives_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_bin NOT NULL,
  `QuestId` int(10) unsigned NOT NULL DEFAULT '0',
  `StorageIndex` tinyint(4) NOT NULL DEFAULT '0',
  `Description` mediumtext COLLATE utf8mb4_bin,
  `VerifiedBuild` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quest_offer_reward`
--

DROP TABLE IF EXISTS `quest_offer_reward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `quest_offer_reward` (
  `ID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Emote1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Emote2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Emote3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Emote4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay1` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay2` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay3` int(10) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay4` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardText` text,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quest_offer_reward_locale`
--

DROP TABLE IF EXISTS `quest_offer_reward_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `quest_offer_reward_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_bin NOT NULL,
  `RewardText` mediumtext COLLATE utf8mb4_bin,
  `VerifiedBuild` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quest_poi`
--

DROP TABLE IF EXISTS `quest_poi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `quest_poi` (
  `QuestID` int(10) unsigned NOT NULL DEFAULT '0',
  `Idx1` int(10) unsigned NOT NULL DEFAULT '0',
  `ObjectiveIndex` int(11) NOT NULL DEFAULT '0',
  `QuestObjectiveId` int(10) unsigned NOT NULL DEFAULT '0',
  `MapID` int(10) unsigned NOT NULL DEFAULT '0',
  `WorldMapAreaId` int(10) unsigned NOT NULL DEFAULT '0',
  `Floor` int(10) unsigned NOT NULL DEFAULT '0',
  `Priority` int(10) unsigned NOT NULL DEFAULT '0',
  `Flags` int(10) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) DEFAULT '0',
  PRIMARY KEY (`QuestID`,`Idx1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quest_poi_points`
--

DROP TABLE IF EXISTS `quest_poi_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `quest_poi_points` (
  `QuestID` int(11) NOT NULL DEFAULT '0',
  `BlobIndex` int(11) NOT NULL DEFAULT '0',
  `Idx1` int(11) NOT NULL DEFAULT '0',
  `Idx2` int(11) NOT NULL DEFAULT '0',
  `X` int(11) NOT NULL DEFAULT '0',
  `Y` int(11) NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) DEFAULT '0',
  PRIMARY KEY (`QuestID`,`BlobIndex`,`Idx1`,`Idx2`),
  KEY `questId_id` (`QuestID`,`BlobIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quest_request_items`
--

DROP TABLE IF EXISTS `quest_request_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `quest_request_items` (
  `ID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `EmoteOnComplete` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EmoteOnIncomplete` smallint(5) unsigned NOT NULL DEFAULT '0',
  `CompletionText` text,
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quest_request_items_locale`
--

DROP TABLE IF EXISTS `quest_request_items_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `quest_request_items_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_bin NOT NULL,
  `CompletionText` mediumtext COLLATE utf8mb4_bin,
  `VerifiedBuild` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quest_template`
--

DROP TABLE IF EXISTS `quest_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `quest_template` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `QuestType` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `QuestLevel` smallint(6) NOT NULL DEFAULT '1',
  `MinLevel` smallint(6) NOT NULL DEFAULT '0',
  `QuestPackageID` int(10) unsigned NOT NULL DEFAULT '0',
  `QuestSortID` smallint(6) NOT NULL DEFAULT '0',
  `QuestInfoID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SuggestedGroupNum` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RewardNextQuest` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardXPDifficulty` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardMoney` int(11) NOT NULL DEFAULT '0',
  `RewardBonusMoney` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardDisplaySpell` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardSpell` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardHonor` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardKillHonor` int(10) unsigned NOT NULL DEFAULT '0',
  `StartItem` int(10) unsigned NOT NULL DEFAULT '0',
  `Flags` int(10) unsigned NOT NULL DEFAULT '0',
  `FlagsEx` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardItem1` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardAmount1` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardItem2` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardAmount2` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardItem3` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardAmount3` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardItem4` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardAmount4` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemDrop1` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemDropQuantity1` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemDrop2` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemDropQuantity2` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemDrop3` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemDropQuantity3` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemDrop4` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemDropQuantity4` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemID1` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemQuantity1` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemID2` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemQuantity2` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemID3` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemQuantity3` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemID4` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemQuantity4` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemID5` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemQuantity5` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemID6` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemQuantity6` int(10) unsigned NOT NULL DEFAULT '0',
  `POIContinent` int(10) unsigned NOT NULL DEFAULT '0',
  `POIx` float NOT NULL DEFAULT '0',
  `POIy` float NOT NULL DEFAULT '0',
  `POIPriority` int(11) NOT NULL DEFAULT '0',
  `RewardTitle` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardArenaPoints` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardSkillLineID` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardNumSkillUps` int(10) unsigned NOT NULL DEFAULT '0',
  `PortraitGiver` int(10) unsigned NOT NULL DEFAULT '0',
  `PortraitTurnIn` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardFactionID1` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardFactionValue1` int(11) NOT NULL DEFAULT '0',
  `RewardFactionOverride1` int(11) NOT NULL DEFAULT '0',
  `RewardFactionID2` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardFactionValue2` int(11) NOT NULL DEFAULT '0',
  `RewardFactionOverride2` int(11) NOT NULL DEFAULT '0',
  `RewardFactionID3` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardFactionValue3` int(11) NOT NULL DEFAULT '0',
  `RewardFactionOverride3` int(11) NOT NULL DEFAULT '0',
  `RewardFactionID4` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardFactionValue4` int(11) NOT NULL DEFAULT '0',
  `RewardFactionOverride4` int(11) NOT NULL DEFAULT '0',
  `RewardFactionID5` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardFactionValue5` int(11) NOT NULL DEFAULT '0',
  `RewardFactionOverride5` int(11) NOT NULL DEFAULT '0',
  `RewardFactionFlags` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardCurrencyID1` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardCurrencyQty1` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardCurrencyID2` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardCurrencyQty2` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardCurrencyID3` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardCurrencyQty3` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardCurrencyID4` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardCurrencyQty4` int(10) unsigned NOT NULL DEFAULT '0',
  `AcceptedSoundKitID` int(10) unsigned NOT NULL DEFAULT '0',
  `CompleteSoundKitID` int(10) unsigned NOT NULL DEFAULT '0',
  `AreaGroupID` int(10) unsigned NOT NULL DEFAULT '0',
  `TimeAllowed` bigint(20) NOT NULL DEFAULT '0',
  `AllowableRaces` bigint(20) unsigned DEFAULT '0',
  `LogTitle` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `LogDescription` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `QuestDescription` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `AreaDescription` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `PortraitGiverText` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `PortraitGiverName` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `PortraitTurnInText` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `PortraitTurnInName` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `QuestCompletionLog` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Quest System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quest_template_addon`
--

DROP TABLE IF EXISTS `quest_template_addon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `quest_template_addon` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `MaxLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `AllowableClasses` int(10) unsigned NOT NULL DEFAULT '0',
  `SourceSpellID` int(10) unsigned NOT NULL DEFAULT '0',
  `PrevQuestID` int(11) NOT NULL DEFAULT '0',
  `NextQuestID` int(10) unsigned NOT NULL DEFAULT '0',
  `ExclusiveGroup` int(11) NOT NULL DEFAULT '0',
  `RewardMailTemplateID` int(10) unsigned NOT NULL DEFAULT '0',
  `RewardMailDelay` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiredSkillID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredSkillPoints` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredMinRepFaction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredMaxRepFaction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredMinRepValue` int(11) NOT NULL DEFAULT '0',
  `RequiredMaxRepValue` int(11) NOT NULL DEFAULT '0',
  `ProvidedItemCount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SpecialFlags` int(10) unsigned NOT NULL DEFAULT '0',
  `ScriptName` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quest_template_locale`
--

DROP TABLE IF EXISTS `quest_template_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `quest_template_locale` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_bin NOT NULL,
  `LogTitle` mediumtext COLLATE utf8mb4_bin,
  `LogDescription` mediumtext COLLATE utf8mb4_bin,
  `QuestDescription` mediumtext COLLATE utf8mb4_bin,
  `AreaDescription` mediumtext COLLATE utf8mb4_bin,
  `PortraitGiverText` mediumtext COLLATE utf8mb4_bin,
  `PortraitGiverName` mediumtext COLLATE utf8mb4_bin,
  `PortraitTurnInText` mediumtext COLLATE utf8mb4_bin,
  `PortraitTurnInName` mediumtext COLLATE utf8mb4_bin,
  `QuestCompletionLog` mediumtext COLLATE utf8mb4_bin,
  `VerifiedBuild` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reclass_routine`
--

DROP TABLE IF EXISTS `reclass_routine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reclass_routine` (
  `class` tinyint(3) unsigned NOT NULL,
  `entry` int(10) unsigned NOT NULL,
  `learn` tinyint(3) unsigned DEFAULT NULL,
  `data` int(10) unsigned NOT NULL DEFAULT '0',
  `flag` int(10) unsigned NOT NULL DEFAULT '0',
  `comment` text CHARACTER SET utf8,
  PRIMARY KEY (`class`,`entry`,`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Need for reclass operation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reference_loot_template`
--

DROP TABLE IF EXISTS `reference_loot_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reference_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(9) NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `lootmode` set('REGULAR','DUNGEON_NORMAL','DUNGEON_HEROIC','RAID_10MAN_NORMAL','RAID_25MAN_NORMAL','RAID_10MAN_HEROIC','RAID_25MAN_HEROIC','RAID_25MAN_LFR','DUNGEON_CHALLENGE','RAID_40MAN','UNUSED','SCENARIO_HEROIC','SCENARIO_NORMAL','UNUSED2','RAID_1025MAN_FLEX') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`item`,`lootmode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reputation_reward_rate`
--

DROP TABLE IF EXISTS `reputation_reward_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reputation_reward_rate` (
  `faction` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest_rate` float NOT NULL DEFAULT '1',
  `quest_daily_rate` float NOT NULL DEFAULT '1',
  `quest_weekly_rate` float NOT NULL DEFAULT '1',
  `quest_repeteable_rate` float NOT NULL DEFAULT '1',
  `quest_monthly_rate` float NOT NULL DEFAULT '1',
  `quest_repeatable_rate` float NOT NULL DEFAULT '1',
  `creature_rate` float NOT NULL DEFAULT '1',
  `spell_rate` float NOT NULL DEFAULT '1',
  PRIMARY KEY (`faction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reputation_spillover_template`
--

DROP TABLE IF EXISTS `reputation_spillover_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reputation_spillover_template` (
  `faction` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction entry',
  `faction1` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction to give spillover for',
  `rate_1` float NOT NULL DEFAULT '0' COMMENT 'the given rep points * rate',
  `rank_1` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'max rank,above this will not give any spillover',
  `faction2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `rate_2` float NOT NULL DEFAULT '0',
  `rank_2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `faction3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `rate_3` float NOT NULL DEFAULT '0',
  `rank_3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `faction4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `rate_4` float NOT NULL DEFAULT '0',
  `rank_4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `faction5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `rate_5` float NOT NULL DEFAULT '0',
  `rank_5` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`faction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Reputation spillover reputation gain';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `research_digsite_data`
--

DROP TABLE IF EXISTS `research_digsite_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `research_digsite_data` (
  `digsiteId` int(11) NOT NULL,
  `branchId` tinyint(3) unsigned NOT NULL,
  `requiredSkillValue` int(11) NOT NULL DEFAULT '0',
  `requiredLevel` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`digsiteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `research_digsite_finds`
--

DROP TABLE IF EXISTS `research_digsite_finds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `research_digsite_finds` (
  `guid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Global Unique Identifier',
  `digsiteId` int(11) NOT NULL,
  `goEntry` int(11) NOT NULL,
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB AUTO_INCREMENT=5197 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `research_project_requirements`
--

DROP TABLE IF EXISTS `research_project_requirements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `research_project_requirements` (
  `projectId` int(11) NOT NULL,
  `requiredSkillValue` int(11) NOT NULL DEFAULT '0',
  `chance` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`projectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scenario_poi`
--

DROP TABLE IF EXISTS `scenario_poi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `scenario_poi` (
  `CriteriaTreeID` int(11) NOT NULL DEFAULT '0',
  `BlobIndex` int(11) NOT NULL DEFAULT '0',
  `Idx1` int(11) NOT NULL DEFAULT '0',
  `MapID` int(11) NOT NULL DEFAULT '0',
  `WorldMapAreaId` int(11) NOT NULL DEFAULT '0',
  `Floor` int(11) NOT NULL DEFAULT '0',
  `Priority` int(11) NOT NULL DEFAULT '0',
  `Flags` int(11) NOT NULL DEFAULT '0',
  `WorldEffectID` int(11) NOT NULL DEFAULT '0',
  `PlayerConditionID` int(11) NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) DEFAULT '0',
  PRIMARY KEY (`CriteriaTreeID`,`BlobIndex`,`Idx1`),
  KEY `idx` (`CriteriaTreeID`,`BlobIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scenario_poi_points`
--

DROP TABLE IF EXISTS `scenario_poi_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `scenario_poi_points` (
  `CriteriaTreeID` int(11) NOT NULL DEFAULT '0',
  `Idx1` int(11) NOT NULL DEFAULT '0',
  `Idx2` int(11) NOT NULL DEFAULT '0',
  `X` int(11) NOT NULL DEFAULT '0',
  `Y` int(11) NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) DEFAULT '0',
  PRIMARY KEY (`CriteriaTreeID`,`Idx1`,`Idx2`),
  KEY `questId_id` (`CriteriaTreeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scene_template`
--

DROP TABLE IF EXISTS `scene_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `scene_template` (
  `SceneId` int(10) unsigned NOT NULL,
  `Flags` int(10) unsigned NOT NULL DEFAULT '0',
  `ScriptPackageID` int(10) unsigned NOT NULL DEFAULT '0',
  `ScriptName` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`SceneId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `script_waypoint`
--

DROP TABLE IF EXISTS `script_waypoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `script_waypoint` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'creature_template entry',
  `pointid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `location_x` float NOT NULL DEFAULT '0',
  `location_y` float NOT NULL DEFAULT '0',
  `location_z` float NOT NULL DEFAULT '0',
  `waittime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'waittime in millisecs',
  `point_comment` text CHARACTER SET utf8,
  PRIMARY KEY (`entry`,`pointid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Script Creature waypoints';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skill_discovery_template`
--

DROP TABLE IF EXISTS `skill_discovery_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill_discovery_template` (
  `spellId` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'SpellId of the discoverable spell',
  `reqSpell` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'spell requirement',
  `reqSkillValue` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'skill points requirement',
  `chance` float NOT NULL DEFAULT '0' COMMENT 'chance to discover',
  PRIMARY KEY (`spellId`,`reqSpell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Skill Discovery System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skill_extra_item_template`
--

DROP TABLE IF EXISTS `skill_extra_item_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill_extra_item_template` (
  `spellId` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'SpellId of the item creation spell',
  `requiredSpecialization` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Specialization spell id',
  `additionalCreateChance` float NOT NULL DEFAULT '0' COMMENT 'chance to create add',
  `additionalMaxNum` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'max num of adds',
  PRIMARY KEY (`spellId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Skill Specialization System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skill_fishing_base_level`
--

DROP TABLE IF EXISTS `skill_fishing_base_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill_fishing_base_level` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Area identifier',
  `skill` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Base skill level requirement',
  PRIMARY KEY (`entry`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Fishing system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skinning_loot_template`
--

DROP TABLE IF EXISTS `skinning_loot_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `skinning_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(9) NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `lootmode` set('REGULAR','DUNGEON_NORMAL','DUNGEON_HEROIC','RAID_10MAN_NORMAL','RAID_25MAN_NORMAL','RAID_10MAN_HEROIC','RAID_25MAN_HEROIC','RAID_25MAN_LFR','DUNGEON_CHALLENGE','RAID_40MAN','UNUSED','SCENARIO_HEROIC','SCENARIO_NORMAL','UNUSED2','RAID_1025MAN_FLEX') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`item`,`lootmode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `smart_scripts`
--

DROP TABLE IF EXISTS `smart_scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smart_scripts` (
  `entryorguid` int(11) NOT NULL,
  `source_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `link` smallint(5) unsigned NOT NULL DEFAULT '0',
  `event_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `event_phase_mask` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `event_chance` tinyint(3) unsigned NOT NULL DEFAULT '100',
  `event_flags` int(10) unsigned NOT NULL DEFAULT '0',
  `event_param1` int(10) unsigned NOT NULL DEFAULT '0',
  `event_param2` int(10) unsigned NOT NULL DEFAULT '0',
  `event_param3` int(10) unsigned NOT NULL DEFAULT '0',
  `event_param4` int(10) unsigned NOT NULL DEFAULT '0',
  `event_param5` int(10) unsigned NOT NULL DEFAULT '0',
  `action_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `action_param1` int(10) unsigned NOT NULL DEFAULT '0',
  `action_param2` int(10) unsigned NOT NULL DEFAULT '0',
  `action_param3` int(10) unsigned NOT NULL DEFAULT '0',
  `action_param4` int(10) unsigned NOT NULL DEFAULT '0',
  `action_param5` int(10) unsigned NOT NULL DEFAULT '0',
  `action_param6` int(10) unsigned NOT NULL DEFAULT '0',
  `target_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `target_param1` int(10) unsigned NOT NULL DEFAULT '0',
  `target_param2` int(10) unsigned NOT NULL DEFAULT '0',
  `target_param3` int(10) unsigned NOT NULL DEFAULT '0',
  `target_param4` int(10) unsigned NOT NULL DEFAULT '0',
  `target_x` float NOT NULL DEFAULT '0',
  `target_y` float NOT NULL DEFAULT '0',
  `target_z` float NOT NULL DEFAULT '0',
  `target_o` float NOT NULL DEFAULT '0',
  `comment` text CHARACTER SET utf8 NOT NULL COMMENT 'Event Comment',
  PRIMARY KEY (`entryorguid`,`source_type`,`id`,`link`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_area`
--

DROP TABLE IF EXISTS `spell_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_area` (
  `spell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `area` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest_start` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest_end` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `aura_spell` mediumint(9) NOT NULL DEFAULT '0',
  `racemask` int(10) unsigned NOT NULL DEFAULT '0',
  `gender` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `autocast` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `quest_start_status` int(11) NOT NULL DEFAULT '64',
  `quest_end_status` int(11) NOT NULL DEFAULT '11',
  PRIMARY KEY (`spell`,`area`,`quest_start`,`aura_spell`,`racemask`,`gender`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_areatrigger_template`
--

DROP TABLE IF EXISTS `spell_areatrigger_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_areatrigger_template` (
  `Entry` int(10) unsigned NOT NULL,
  `Flags` int(10) unsigned NOT NULL,
  `CollisionType` int(10) unsigned NOT NULL,
  `Radius` float unsigned NOT NULL,
  `ScaleX` float unsigned NOT NULL,
  `ScaleY` float unsigned NOT NULL,
  `ScriptName` varchar(64) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`Entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_bonus_data`
--

DROP TABLE IF EXISTS `spell_bonus_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_bonus_data` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `direct_bonus` float NOT NULL DEFAULT '0',
  `dot_bonus` float NOT NULL DEFAULT '0',
  `ap_bonus` float NOT NULL DEFAULT '0',
  `ap_dot_bonus` float NOT NULL DEFAULT '0',
  `comments` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_custom_attribute`
--

DROP TABLE IF EXISTS `spell_custom_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_custom_attribute` (
  `spell` int(10) unsigned NOT NULL,
  `attribute` enum('SPELL_ATTR0_CU_ENCHANT_PROC','SPELL_ATTR0_CU_CONE_BACK','SPELL_ATTR0_CU_CONE_LINE','SPELL_ATTR0_CU_SHARE_DAMAGE','SPELL_ATTR0_CU_NO_INITIAL_THREAT','SPELL_ATTR0_CU_IGNORE_PVP_POWER','SPELL_ATTR0_CU_AURA_CC','SPELL_ATTR0_CU_HAS_NEGATIVE_EFFECT','SPELL_ATTR0_CU_DONT_SET_IN_COMBAT_STATE','SPELL_ATTR0_CU_CHARGE','SPELL_ATTR0_CU_PICKPOCKET','SPELL_ATTR0_CU_SPELL_REFLECT','SPELL_ATTR0_CU_NEGATIVE','SPELL_ATTR0_CU_PERSISTENT','SPELL_ATTR0_CU_IGNORE_RESILIENCE','SPELL_ATTR0_CU_IGNORE_ARMOR','SPELL_ATTR0_CU_REQ_TARGET_FACING_CASTER','SPELL_ATTR0_CU_REQ_CASTER_BEHIND_TARGET','SPELL_ATTR0_CU_DONT_SAVE_AURA_TO_DB','SPELL_ATTR0_CU_SERVERSIDE_ONLY','SPELL_ATTR0_CU_CAN_STACK_FROM_DIFF_CASTERS','SPELL_ATTR0_CU_ALWAYS_CHECK_LOS','SPELL_ATTR0_CU_ALWAYS_SEND_TO_CLIENT') CHARACTER SET utf8 NOT NULL,
  `comment` text CHARACTER SET utf8,
  PRIMARY KEY (`spell`,`attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_dbc`
--

DROP TABLE IF EXISTS `spell_dbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_dbc` (
  `Id` int(10) unsigned NOT NULL,
  `SpellAuraOptionsId` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellCastingRequirementsId` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellCategoriesId` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellClassOptionsId` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellEquippedItemsId` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellLevelsId` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellTargetRestrictionsId` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellInterruptsId` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellMiscId` int(10) unsigned NOT NULL,
  `Comment` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Custom spell.dbc entries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_enchant_proc_data`
--

DROP TABLE IF EXISTS `spell_enchant_proc_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_enchant_proc_data` (
  `entry` int(10) unsigned NOT NULL,
  `customChance` int(10) unsigned NOT NULL DEFAULT '0',
  `PPMChance` float unsigned NOT NULL DEFAULT '0',
  `procEx` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Spell enchant proc data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_group`
--

DROP TABLE IF EXISTS `spell_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_group` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `spell_id` int(11) NOT NULL DEFAULT '0',
  `comment` varchar(100) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`,`spell_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Spell System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_group_stack_rules`
--

DROP TABLE IF EXISTS `spell_group_stack_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_group_stack_rules` (
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `stack_rule` tinyint(4) NOT NULL DEFAULT '0',
  `comment` text CHARACTER SET utf8,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_learn_spell`
--

DROP TABLE IF EXISTS `spell_learn_spell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_learn_spell` (
  `entry` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellID` int(10) unsigned NOT NULL DEFAULT '0',
  `Active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`SpellID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Item System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_linked_spell`
--

DROP TABLE IF EXISTS `spell_linked_spell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_linked_spell` (
  `spell_trigger` mediumint(9) NOT NULL,
  `spell_effect` mediumint(9) NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `comment` text CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `trigger_effect_type` (`spell_trigger`,`spell_effect`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Spell System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_loot_template`
--

DROP TABLE IF EXISTS `spell_loot_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(9) NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `lootmode` set('REGULAR','DUNGEON_NORMAL','DUNGEON_HEROIC','RAID_10MAN_NORMAL','RAID_25MAN_NORMAL','RAID_10MAN_HEROIC','RAID_25MAN_HEROIC','RAID_25MAN_LFR','DUNGEON_CHALLENGE','RAID_40MAN','UNUSED','SCENARIO_HEROIC','SCENARIO_NORMAL','UNUSED2','RAID_1025MAN_FLEX') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`item`,`lootmode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Loot System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_pet_auras`
--

DROP TABLE IF EXISTS `spell_pet_auras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_pet_auras` (
  `spell` mediumint(8) unsigned NOT NULL COMMENT 'dummy spell id',
  `effectId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pet` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'pet id; 0 = all',
  `aura` mediumint(8) unsigned NOT NULL COMMENT 'pet aura id',
  PRIMARY KEY (`spell`,`effectId`,`pet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_phase`
--

DROP TABLE IF EXISTS `spell_phase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_phase` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `phasemask` bigint(20) unsigned NOT NULL DEFAULT '1',
  `terrainswapmap` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_proc`
--

DROP TABLE IF EXISTS `spell_proc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_proc` (
  `spellId` mediumint(9) NOT NULL DEFAULT '0',
  `schoolMask` tinyint(4) NOT NULL DEFAULT '0',
  `spellFamilyName` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellFamilyMask0` int(10) unsigned NOT NULL DEFAULT '0',
  `spellFamilyMask1` int(10) unsigned NOT NULL DEFAULT '0',
  `spellFamilyMask2` int(10) unsigned NOT NULL DEFAULT '0',
  `typeMask` int(10) unsigned NOT NULL DEFAULT '0',
  `spellTypeMask` int(10) unsigned NOT NULL DEFAULT '0',
  `spellPhaseMask` int(11) NOT NULL DEFAULT '0',
  `hitMask` int(11) NOT NULL DEFAULT '0',
  `attributesMask` int(10) unsigned NOT NULL DEFAULT '0',
  `ratePerMinute` float NOT NULL DEFAULT '0',
  `chance` float NOT NULL DEFAULT '0',
  `cooldown` float unsigned NOT NULL DEFAULT '0',
  `charges` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`spellId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_proc_event`
--

DROP TABLE IF EXISTS `spell_proc_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_proc_event` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `SchoolMask` tinyint(4) NOT NULL DEFAULT '0',
  `SpellFamilyName` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyMask0` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyMask1` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyMask2` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyMask3` int(10) unsigned NOT NULL DEFAULT '0',
  `procFlags` int(10) unsigned NOT NULL DEFAULT '0',
  `procEx` int(10) unsigned NOT NULL DEFAULT '0',
  `phase` set('PROC_PHASE_HIT','PROC_PHASE_CAST','PROC_PHASE_AFTER_CAST') CHARACTER SET utf8 NOT NULL DEFAULT 'PROC_PHASE_HIT',
  `ppmRate` float NOT NULL DEFAULT '0',
  `CustomChance` float NOT NULL DEFAULT '0',
  `Cooldown` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_ranks`
--

DROP TABLE IF EXISTS `spell_ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_ranks` (
  `first_spell_id` int(10) unsigned NOT NULL DEFAULT '0',
  `spell_id` int(10) unsigned NOT NULL DEFAULT '0',
  `rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`first_spell_id`,`rank`),
  UNIQUE KEY `spell_id` (`spell_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Spell Rank Data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_required`
--

DROP TABLE IF EXISTS `spell_required`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_required` (
  `spell_id` mediumint(9) NOT NULL DEFAULT '0',
  `req_spell` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`spell_id`,`req_spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Spell Additinal Data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_script_names`
--

DROP TABLE IF EXISTS `spell_script_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_script_names` (
  `spell_id` int(11) NOT NULL,
  `ScriptName` char(64) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `spell_id` (`spell_id`,`ScriptName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_scripts`
--

DROP TABLE IF EXISTS `spell_scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_scripts` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `effIndex` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `dataint` int(11) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_target_position`
--

DROP TABLE IF EXISTS `spell_target_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_target_position` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `effIndex` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `target_map` smallint(5) unsigned NOT NULL DEFAULT '0',
  `target_position_x` float NOT NULL DEFAULT '0',
  `target_position_y` float NOT NULL DEFAULT '0',
  `target_position_z` float NOT NULL DEFAULT '0',
  `target_orientation` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`effIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Spell System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spell_threat`
--

DROP TABLE IF EXISTS `spell_threat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_threat` (
  `entry` mediumint(8) unsigned NOT NULL,
  `flatMod` int(11) DEFAULT NULL,
  `pctMod` float NOT NULL DEFAULT '1' COMMENT 'threat multiplier for damage/healing',
  `apPctMod` float NOT NULL DEFAULT '0' COMMENT 'additional threat bonus from attack power',
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spelleffect_dbc`
--

DROP TABLE IF EXISTS `spelleffect_dbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `spelleffect_dbc` (
  `Id` int(10) unsigned NOT NULL,
  `Effect` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectValueMultiplier` float unsigned NOT NULL DEFAULT '0',
  `EffectApplyAuraName` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectAplitude` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectBasePoints` int(11) NOT NULL DEFAULT '0',
  `EffectBonusMultiplier` float unsigned NOT NULL DEFAULT '0',
  `EffectDamageMultiplier` float unsigned NOT NULL DEFAULT '0',
  `EffectChainTarget` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectDieSides` int(11) NOT NULL DEFAULT '0',
  `EffectMechanic` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectMiscValue` int(11) NOT NULL DEFAULT '0',
  `EffectMiscValueB` int(11) NOT NULL DEFAULT '0',
  `EffectRadiusIndex` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectRadiusIndexMax` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectRealPointsPerLevel` float unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskA` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskB` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskC` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskD` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectTriggerSpell` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetA` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetB` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellId` int(10) unsigned NOT NULL,
  `EffectIndex` int(10) unsigned NOT NULL,
  `EffectAttributes` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `spellmisc_dbc`
--

DROP TABLE IF EXISTS `spellmisc_dbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `spellmisc_dbc` (
  `Id` int(10) unsigned NOT NULL,
  `Attributes` int(10) unsigned NOT NULL DEFAULT '0',
  `AttributesEx` int(10) unsigned NOT NULL DEFAULT '0',
  `AttributesEx2` int(10) unsigned NOT NULL DEFAULT '0',
  `AttributesEx3` int(10) unsigned NOT NULL DEFAULT '0',
  `AttributesEx4` int(10) unsigned NOT NULL DEFAULT '0',
  `AttributesEx5` int(10) unsigned NOT NULL DEFAULT '0',
  `AttributesEx6` int(10) unsigned NOT NULL DEFAULT '0',
  `AttributesEx7` int(10) unsigned NOT NULL DEFAULT '0',
  `AttributesEx8` int(10) unsigned NOT NULL DEFAULT '0',
  `AttributesEx9` int(10) unsigned NOT NULL DEFAULT '0',
  `AttributesEx10` int(10) unsigned NOT NULL DEFAULT '0',
  `AttributesEx11` int(10) unsigned NOT NULL DEFAULT '0',
  `AttributesEx12` int(10) unsigned NOT NULL DEFAULT '0',
  `AttributesEx13` int(10) unsigned NOT NULL DEFAULT '0',
  `CastingTimeIndex` int(10) unsigned NOT NULL DEFAULT '1',
  `DurationIndex` int(10) unsigned NOT NULL DEFAULT '0',
  `RangeIndex` int(10) unsigned NOT NULL DEFAULT '1',
  `SchoolMask` int(10) unsigned NOT NULL DEFAULT '0',
  `Comment` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Custom spellmisc.dbc entries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `terrain_phase_info`
--

DROP TABLE IF EXISTS `terrain_phase_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `terrain_phase_info` (
  `Id` int(10) unsigned NOT NULL,
  `TerrainSwapMap` int(10) unsigned NOT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`,`TerrainSwapMap`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `terrain_swap_defaults`
--

DROP TABLE IF EXISTS `terrain_swap_defaults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `terrain_swap_defaults` (
  `MapId` int(10) unsigned NOT NULL,
  `TerrainSwapMap` int(10) unsigned NOT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MapId`,`TerrainSwapMap`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `terrain_worldmap`
--

DROP TABLE IF EXISTS `terrain_worldmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `terrain_worldmap` (
  `TerrainSwapMap` int(10) unsigned NOT NULL,
  `WorldMapArea` int(10) unsigned NOT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TerrainSwapMap`,`WorldMapArea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transports`
--

DROP TABLE IF EXISTS `transports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `transports` (
  `guid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` text CHARACTER SET utf8,
  PRIMARY KEY (`guid`),
  UNIQUE KEY `idx_entry` (`entry`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Transports';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trinity_string`
--

DROP TABLE IF EXISTS `trinity_string`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `trinity_string` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `content_default` text CHARACTER SET utf8 NOT NULL,
  `content_loc1` text CHARACTER SET utf8,
  `content_loc2` text CHARACTER SET utf8,
  `content_loc3` text CHARACTER SET utf8,
  `content_loc4` text CHARACTER SET utf8,
  `content_loc5` text CHARACTER SET utf8,
  `content_loc6` text CHARACTER SET utf8,
  `content_loc7` text CHARACTER SET utf8,
  `content_loc8` text CHARACTER SET utf8,
  `content_loc9` text CHARACTER SET utf8,
  `content_loc10` text CHARACTER SET utf8,
  `content_loc11` text CHARACTER SET utf8,
  `content_female` text CHARACTER SET utf8,
  `content_female_loc1` text CHARACTER SET utf8,
  `content_female_loc2` text CHARACTER SET utf8,
  `content_female_loc3` text CHARACTER SET utf8,
  `content_female_loc4` text CHARACTER SET utf8,
  `content_female_loc5` text CHARACTER SET utf8,
  `content_female_loc6` text CHARACTER SET utf8,
  `content_female_loc7` text CHARACTER SET utf8,
  `content_female_loc8` text CHARACTER SET utf8,
  `content_female_loc9` text CHARACTER SET utf8,
  `content_female_loc10` text CHARACTER SET utf8,
  `content_female_loc11` text CHARACTER SET utf8,
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vehicle_accessory`
--

DROP TABLE IF EXISTS `vehicle_accessory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_accessory` (
  `guid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `accessory_entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `seat_id` tinyint(4) NOT NULL DEFAULT '0',
  `minion` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8 NOT NULL,
  `summontype` tinyint(3) unsigned NOT NULL DEFAULT '6' COMMENT 'see enum TempSummonType',
  `summontimer` int(10) unsigned NOT NULL DEFAULT '30000' COMMENT 'timer, only relevant for certain summontypes',
  PRIMARY KEY (`guid`,`seat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vehicle_template_accessory`
--

DROP TABLE IF EXISTS `vehicle_template_accessory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_template_accessory` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `accessory_entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `seat_id` tinyint(4) NOT NULL DEFAULT '0',
  `minion` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8 NOT NULL,
  `summontype` tinyint(3) unsigned NOT NULL DEFAULT '6' COMMENT 'see enum TempSummonType',
  `summontimer` int(10) unsigned NOT NULL DEFAULT '30000' COMMENT 'timer, only relevant for certain summontypes',
  PRIMARY KEY (`entry`,`seat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `version` (
  `core_version` varchar(120) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT 'Core revision dumped at startup.',
  `core_revision` varchar(120) CHARACTER SET utf8 DEFAULT NULL,
  `db_version` varchar(120) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Version of world DB.',
  `cache_id` int(11) DEFAULT '0',
  PRIMARY KEY (`core_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Version Notes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `warden_checks`
--

DROP TABLE IF EXISTS `warden_checks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `warden_checks` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned DEFAULT NULL,
  `data` varchar(48) CHARACTER SET utf8 DEFAULT NULL,
  `str` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `address` int(10) unsigned DEFAULT NULL,
  `length` tinyint(3) unsigned DEFAULT NULL,
  `result` varchar(24) CHARACTER SET utf8 DEFAULT NULL,
  `locale` enum('enUS','koKR','frFR','deDE','zhCN','zhTW','esES','esMX','ruRU') CHARACTER SET utf8 DEFAULT NULL,
  `negative` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `action` tinyint(3) unsigned DEFAULT NULL,
  `group` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `comment` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=787 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `waypoint_data`
--

DROP TABLE IF EXISTS `waypoint_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `waypoint_data` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Creature GUID',
  `point` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `move_flag` tinyint(4) NOT NULL DEFAULT '0',
  `action` int(11) NOT NULL DEFAULT '0',
  `action_chance` smallint(6) NOT NULL DEFAULT '100',
  `wpguid` int(11) NOT NULL DEFAULT '0',
  `entry` text CHARACTER SET utf8,
  PRIMARY KEY (`id`,`point`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `waypoint_scripts`
--

DROP TABLE IF EXISTS `waypoint_scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `waypoint_scripts` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` int(10) unsigned NOT NULL DEFAULT '0',
  `datalong` int(10) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `dataint` int(10) unsigned NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `guid` int(11) NOT NULL DEFAULT '0',
  `Comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `waypoints`
--

DROP TABLE IF EXISTS `waypoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `waypoints` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pointid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float DEFAULT NULL,
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `point_comment` text CHARACTER SET utf8,
  PRIMARY KEY (`entry`,`pointid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='Creature waypoints';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `world_drop_loot_template`
--

DROP TABLE IF EXISTS `world_drop_loot_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `world_drop_loot_template` (
  `item` int(10) unsigned NOT NULL,
  `chance` float NOT NULL,
  `expansion` tinyint(3) unsigned NOT NULL,
  `level_min` tinyint(3) unsigned NOT NULL,
  `level_max` tinyint(3) unsigned NOT NULL,
  `group` int(10) unsigned NOT NULL DEFAULT '0',
  `info` text CHARACTER SET utf8,
  PRIMARY KEY (`item`,`level_min`,`level_max`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `world_map_template`
--

DROP TABLE IF EXISTS `world_map_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `world_map_template` (
  `mapID` int(10) unsigned NOT NULL DEFAULT '0',
  `ScriptName` text COLLATE utf8mb4_bin,
  PRIMARY KEY (`mapID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'world'
--

--
-- Dumping routines for database 'world'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-06-17 13:09:04

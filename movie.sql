-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: 2017-05-14 01:14:43
-- 服务器版本： 5.5.42
-- PHP Version: 5.5.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `movie`
--

-- --------------------------------------------------------

--
-- 表的结构 `movie`
--

CREATE TABLE `movie` (
  `id` int(11) NOT NULL,
  `Mname` varchar(128) NOT NULL,
  `PicUrl` varchar(50) NOT NULL,
  `Actor` text CHARACTER SET latin1 NOT NULL,
  `showTime` varchar(20) NOT NULL,
  `content` text NOT NULL,
  `movieUrl` varchar(128) NOT NULL,
  `moviePlayTime` varchar(28) NOT NULL,
  `fid` int(11) NOT NULL,
  `enable` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `movie`
--

INSERT INTO `movie` (`id`, `Mname`, `PicUrl`, `Actor`, `showTime`, `content`, `movieUrl`, `moviePlayTime`, `fid`, `enable`) VALUES
(1, '沉默(英语高清720P)', 'http://navod.scse.com.cn/', 'asdasdas', '2017-3-1', '《沉默》改编自著名日本作家远藤周作的同名小说。故事发生在德川幕府时代禁教令下长崎附近的小村子，一个葡萄牙耶稣会的教士偷渡到日本传教，并调查恩师因遭受「穴吊」酷刑而宣誓弃教一事，因为这事在当时欧洲人的眼中，不只是个人的挫折，同时也是整个欧洲信仰、思想的耻辱和失败。在传教与寻访的过程中，信仰与反叛、圣洁与背德、强权与卑微、受难与恐惧、坚贞与隐忍、挣扎与超脱……所有的两难情境都面临了，逼迫着他对基督的信仰进行更深层且更现实的思索，最终，他彷佛也走过一趟恩师的心路历程，拥有自己对信仰的诠释与实践。', 'http://navod.scse.com.cn/', '108min', 2, 0),
(2, '西葫芦的生活(法语高清720P)', 'http://navod.scse.com.cn/', 'sadasd', '2017-4-25', '孤儿院里，西葫芦刚开始总被学校的痞孩子Simon戏耍，最后他们成为最好的朋友。孤儿院来了一个新伙伴Camille，西葫芦爱上了她。最后西葫芦和Camille都被可爱的警察收为自己的儿女。', 'http://navod.scse.com.cn/', '100min', 4, 0),
(3, '美国队长2', 'http://navod.scse.com.cn/', 'asdasd', '2017-3-22', ' 渐渐习惯了现代生活的美国队长史蒂夫·罗杰斯（克里斯·埃文斯 Chris Evans 饰），在一次行动后隐隐嗅到神盾局内部所弥漫出来的凶险气味。而当得知神盾局正秘密进行的“洞察计划”后，他更为此感到愤怒。某天，神盾局指挥官尼克-法瑞（塞缪尔·杰克逊 Samuel L. Jackson 饰）遭到一群武装分子袭击，他拼尽全力将一支U盘交到美国队长手中，这里面藏着该局二战以来最重要且最可怕的秘密。在此之后，美国队长因涉嫌杀害尼克而遭到前局长亚历山大·皮尔斯（罗伯特·雷德福/Robert Redford 饰）的通缉和追杀，逃亡中他得到黑寡妇（斯嘉丽·约翰逊 Scarlett Johansson 饰）和退伍老兵“猎鹰”（安东尼·麦凯 Anthony Mackie 饰）的帮助。 他们必须争分夺秒解开神盾局的秘密，阻止“洞察计划”的施行……', 'baidu.com', '120min', 1, 0),
(5, 'AV', '', '13213', '2017-03-23', '1231243423423', './upload/video/video-149372374120077354077.mp4', '123minmin', 2, 1),
(6, 'test', './upload/banner/upload-149372567673386991517.jpg', '45235', '2017-2-1', '32423', './upload/video/video-14937256851836255886.mp4', '123min', 4, 1),
(7, 'dddddd', '', '12312', '2014-05-01', 'dasdasdasf', '', '123min', 2, 0),
(8, 'test', './upload/banner/upload-149372567673386991517.jpg', '45235', '2017-02-01', '32423', './upload/video/video-149381817491578129570.mp4', '123min', 4, 0),
(10, 'shit', './upload/banner/upload-149372567673386991517.jpg', '45235', '2017-02-01', '32423', './upload/video/video-149381817491578129570.mp4', '123min', 2, 1),
(11, 'shit', './upload/banner/upload-149372567673386991517.jpg', '45235', '2017-02-01', '32423', './upload/video/video-149381817491578129570.mp4', '123min', 2, 1),
(12, 'shit', './upload/banner/upload-149372567673386991517.jpg', '45235', '2017-02-01', '32423', './upload/video/video-149381817491578129570.mp4', '123min', 2, 1),
(13, '沉默(英语高清720P)', 'http://navod.scse.com.cn/', 'asdasdas', '2017-3-1', '《沉默》改编自著名日本作家远藤周作的同名小说。故事发生在德川幕府时代禁教令下长崎附近的小村子，一个葡萄牙耶稣会的教士偷渡到日本传教，并调查恩师因遭受「穴吊」酷刑而宣誓弃教一事，因为这事在当时欧洲人的眼中，不只是个人的挫折，同时也是整个欧洲信仰、思想的耻辱和失败。在传教与寻访的过程中，信仰与反叛、圣洁与背德、强权与卑微、受难与恐惧、坚贞与隐忍、挣扎与超脱……所有的两难情境都面临了，逼迫着他对基督的信仰进行更深层且更现实的思索，最终，他彷佛也走过一趟恩师的心路历程，拥有自己对信仰的诠释与实践。', 'http://navod.scse.com.cn/', '108min', 2, 1),
(14, '美国队长2', 'http://navod.scse.com.cn/', 'asdasd', '2017-3-22', ' 渐渐习惯了现代生活的美国队长史蒂夫·罗杰斯（克里斯·埃文斯 Chris Evans 饰），在一次行动后隐隐嗅到神盾局内部所弥漫出来的凶险气味。而当得知神盾局正秘密进行的“洞察计划”后，他更为此感到愤怒。某天，神盾局指挥官尼克-法瑞（塞缪尔·杰克逊 Samuel L. Jackson 饰）遭到一群武装分子袭击，他拼尽全力将一支U盘交到美国队长手中，这里面藏着该局二战以来最重要且最可怕的秘密。在此之后，美国队长因涉嫌杀害尼克而遭到前局长亚历山大·皮尔斯（罗伯特·雷德福/Robert Redford 饰）的通缉和追杀，逃亡中他得到黑寡妇（斯嘉丽·约翰逊 Scarlett Johansson 饰）和退伍老兵“猎鹰”（安东尼·麦凯 Anthony Mackie 饰）的帮助。 他们必须争分夺秒解开神盾局的秘密，阻止“洞察计划”的施行……', 'baidu.com', '120min', 1, 1),
(15, 'dddddd', '', '12312', '2014-05-01', 'dasdasdasf', '', '123min', 2, 1),
(16, '美国队长2', 'http://navod.scse.com.cn/', 'asdasd', '2017-3-22', ' 渐渐习惯了现代生活的美国队长史蒂夫·罗杰斯（克里斯·埃文斯 Chris Evans 饰），在一次行动后隐隐嗅到神盾局内部所弥漫出来的凶险气味。而当得知神盾局正秘密进行的“洞察计划”后，他更为此感到愤怒。某天，神盾局指挥官尼克-法瑞（塞缪尔·杰克逊 Samuel L. Jackson 饰）遭到一群武装分子袭击，他拼尽全力将一支U盘交到美国队长手中，这里面藏着该局二战以来最重要且最可怕的秘密。在此之后，美国队长因涉嫌杀害尼克而遭到前局长亚历山大·皮尔斯（罗伯特·雷德福/Robert Redford 饰）的通缉和追杀，逃亡中他得到黑寡妇（斯嘉丽·约翰逊 Scarlett Johansson 饰）和退伍老兵“猎鹰”（安东尼·麦凯 Anthony Mackie 饰）的帮助。 他们必须争分夺秒解开神盾局的秘密，阻止“洞察计划”的施行……', 'baidu.com', '120min', 1, 1),
(17, 'shit', './upload/banner/upload-149372567673386991517.jpg', '45235', '2017-02-01', '32423', './upload/video/video-149381817491578129570.mp4', '123min', 2, 1),
(18, 'AV', '', '13213', '2017-3-23', '1231243423423', './upload/video/video-149372374120077354077.mp4', '123min', 3, 1),
(20, 'test', './upload/banner/upload-149372567673386991517.jpg', '45235', '2017-2-1', '32423', './upload/video/video-14937256851836255886.mp4', '123min', 4, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `movie`
--
ALTER TABLE `movie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
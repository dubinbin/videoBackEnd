-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Apr 09, 2017 at 01:28 AM
-- Server version: 5.5.42
-- PHP Version: 5.5.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `movie`
--

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `id` int(11) unsigned NOT NULL,
  `title` varchar(24) NOT NULL,
  `url` varchar(50) NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`id`, `title`, `url`, `enable`) VALUES
(1, 'banner1', 'www.baidu.com', 1),
(2, 'banner2', 'www.google.con.hk', 1);

-- --------------------------------------------------------

--
-- Table structure for table `FirstCatrgory`
--

CREATE TABLE `FirstCatrgory` (
  `fid` int(11) NOT NULL,
  `name` varchar(128) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `FirstCatrgory`
--

INSERT INTO `FirstCatrgory` (`fid`, `name`) VALUES
(1, '美国电影'),
(2, '韩国电影'),
(3, '日本电影'),
(4, '法国电影');

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `id` int(11) NOT NULL,
  `Mname` varchar(128) CHARACTER SET utf8 NOT NULL,
  `PicUrl` varchar(50) CHARACTER SET utf8 NOT NULL,
  `showTime` date NOT NULL,
  `content` text CHARACTER SET utf8 NOT NULL,
  `movieUrl` varchar(128) CHARACTER SET utf8 NOT NULL,
  `moviePlayTime` varchar(28) CHARACTER SET utf8 NOT NULL,
  `fid` int(11) NOT NULL,
  `enable` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`id`, `Mname`, `PicUrl`, `showTime`, `content`, `movieUrl`, `moviePlayTime`, `fid`, `enable`) VALUES
(1, '沉默(英语高清720P)', 'http://navod.scse.com.cn/', '2017-03-08', '《沉默》改编自著名日本作家远藤周作的同名小说。故事发生在德川幕府时代禁教令下长崎附近的小村子，一个葡萄牙耶稣会的教士偷渡到日本传教，并调查恩师因遭受「穴吊」酷刑而宣誓弃教一事，因为这事在当时欧洲人的眼中，不只是个人的挫折，同时也是整个欧洲信仰、思想的耻辱和失败。在传教与寻访的过程中，信仰与反叛、圣洁与背德、强权与卑微、受难与恐惧、坚贞与隐忍、挣扎与超脱……所有的两难情境都面临了，逼迫着他对基督的信仰进行更深层且更现实的思索，最终，他彷佛也走过一趟恩师的心路历程，拥有自己对信仰的诠释与实践。', 'http://navod.scse.com.cn/', '108min', 2, 1),
(2, '西葫芦的生活(法语高清720P)', 'http://navod.scse.com.cn/', '2017-03-02', '孤儿院里，西葫芦刚开始总被学校的痞孩子Simon戏耍，最后他们成为最好的朋友。孤儿院来了一个新伙伴Camille，西葫芦爱上了她。最后西葫芦和Camille都被可爱的警察收为自己的儿女。', 'http://navod.scse.com.cn/', '100min', 4, 1),
(3, '美国队长2', 'http://navod.scse.com.cn/', '2017-04-06', ' 渐渐习惯了现代生活的美国队长史蒂夫·罗杰斯（克里斯·埃文斯 Chris Evans 饰），在一次行动后隐隐嗅到神盾局内部所弥漫出来的凶险气味。而当得知神盾局正秘密进行的“洞察计划”后，他更为此感到愤怒。某天，神盾局指挥官尼克-法瑞（塞缪尔·杰克逊 Samuel L. Jackson 饰）遭到一群武装分子袭击，他拼尽全力将一支U盘交到美国队长手中，这里面藏着该局二战以来最重要且最可怕的秘密。在此之后，美国队长因涉嫌杀害尼克而遭到前局长亚历山大·皮尔斯（罗伯特·雷德福/Robert Redford 饰）的通缉和追杀，逃亡中他得到黑寡妇（斯嘉丽·约翰逊 Scarlett Johansson 饰）和退伍老兵“猎鹰”（安东尼·麦凯 Anthony Mackie 饰）的帮助。 他们必须争分夺秒解开神盾局的秘密，阻止“洞察计划”的施行……', 'baidu.com', '120min', 1, 1),
(4, '假设这是韩国电影', 'http://navod.scse.com.cn/', '2017-03-01', '假设这是韩国电影', 'baidu.com', '110min', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE `topic` (
  `tid` int(11) NOT NULL,
  `tname` varchar(120) NOT NULL,
  `content` text NOT NULL,
  `category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `topic`
--

INSERT INTO `topic` (`tid`, `tname`, `content`, `category`) VALUES
(1, 'topic1', 'asdasdasdasdasasdasdasdasdasasdasdasdasdas', 1),
(2, 'topic2', 'asdasdasdasdasasdasdasdasdasasdasdasdasdas', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(128) NOT NULL,
  `thumb` varchar(20) NOT NULL DEFAULT 'no_image.jpg',
  `enable` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `thumb`, `enable`) VALUES
(1, 'admin', '6234b53ad37ba5cfc0fa9d04ffb25fd0', 'IMG_0507', 1),
(2, 'du', '2e707b949d98fe415d523806bcaf0bc6', 'img123123', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
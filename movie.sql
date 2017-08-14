-- phpMyAdmin SQL Dump
-- version 4.0.10.20
-- https://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2017-06-23 16:48:27
-- 服务器版本: 5.5.54
-- PHP 版本: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `movie`
--

-- --------------------------------------------------------

--
-- 表的结构 `advise`
--

CREATE TABLE IF NOT EXISTS `advise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `time` text NOT NULL,
  `contact` text NOT NULL,
  `uName` varchar(100) NOT NULL,
  `enable` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `advise`
--

INSERT INTO `advise` (`id`, `title`, `content`, `time`, `contact`, `uName`, `enable`) VALUES
(2, '1111', '666', '2017-05-31 22:51', '666', 'admin', 1),
(3, '111', '345345', '2017-05-31 22:57', '546456', '访客', 1),
(4, '3345345', '1231231', '2017-05-31 22:58', '34534534', '访客', 1),
(5, '45645645', '7567567', '2017-05-31 22:58', '56756756', 'du', 1),
(6, '测试', '测试测试', '2017-06-01 09:37', '734854291', 'admin', 1),
(7, '23333', '移动端测试', '2017-06-05 10:47', '734854291', 'test', 1),
(8, '吼呀', '蛤蛤蛤', '2017-06-13 19:45', 'jak@jm.com', '访客', 1),
(9, '', '111111', '2017-06-16 15:16', '15602331841', '访客', 1),
(10, '', '', '2017-06-20 17:20', '', '访客', 1);

-- --------------------------------------------------------

--
-- 表的结构 `banner`
--

CREATE TABLE IF NOT EXISTS `banner` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(24) NOT NULL,
  `url` varchar(50) NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- 转存表中的数据 `banner`
--

INSERT INTO `banner` (`id`, `title`, `url`, `enable`) VALUES
(21, '四月新番介绍', './upload/banner/banner-149728155310087066492.jpg', 1),
(22, 'cos大赛评选投票', './upload/banner/banner-149728163852555287721.jpg', 1),
(24, '拔剑吧', './upload/banner/banner-149802231911093126841.jpg', 1);

-- --------------------------------------------------------

--
-- 表的结构 `danmu`
--

CREATE TABLE IF NOT EXISTS `danmu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `time` int(100) NOT NULL,
  `position` int(100) NOT NULL,
  `color` text NOT NULL,
  `size` int(11) NOT NULL,
  `enable` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- 转存表中的数据 `danmu`
--

INSERT INTO `danmu` (`id`, `text`, `time`, `position`, `color`, `size`, `enable`) VALUES
(1, '43534', 3, 0, '#ffffff', 1, 1),
(2, 'asdasda', 3, 0, '#ffffff', 1, 1),
(3, '测试一下', 103, 0, '#ffffff', 1, 1),
(4, '1111', 3, 0, '#ffffff', 1, 1),
(5, '然后个人好', 3, 0, '#ffffff', 1, 1),
(6, '54645645', 86, 0, '#ffffff', 1, 1),
(7, '889234234', 115, 0, '#ffffff', 1, 1),
(8, '11111111111', 4, 0, '#ffffff', 1, 1),
(9, 'vvvvvvvvv', 3, 0, '#ffffff', 1, 1),
(10, 'vbbbvcbx', 3, 0, '#ffffff', 1, 1),
(11, '1212', 3, 0, '#ffffff', 1, 1),
(12, '1123', 3, 0, '#ffffff', 1, 1),
(13, '123', 3, 0, '#ffffff', 1, 1),
(14, '123', 3, 0, '#ffffff', 1, 1),
(15, '出差出差出差出差', 200, 0, '#ffffff', 1, 1),
(16, '66666666', 81, 0, '#ffffff', 1, 1),
(17, '66666', 25, 0, '#ffffff', 1, 1),
(18, '在这种重中之重重中之重', 3, 0, '#ffffff', 1, 1),
(19, '测试测试', 143, 0, '#ffffff', 1, 1),
(20, '重中之重子', 121, 0, '#ffffff', 1, 1),
(21, '6666', 3, 0, '#ffffff', 1, 1),
(22, 'aaa', 3, 0, '#ffffff', 1, 1),
(23, 'fhhbhi', 3, 0, '#ffffff', 1, 1),
(24, '乐墩路口', 3, 0, '#ffffff', 1, 1),
(25, '12313', 19, 0, '#ffffff', 1, 1),
(26, '鲜榨橙汁现场', 110, 0, '#ffffff', 1, 1),
(27, '1323123', 275, 0, '#ffffff', 1, 1),
(28, 'tuyi', 3, 0, '#ffffff', 1, 1),
(29, '选择性', 3, 0, '#ffffff', 1, 1),
(30, 'hhh', 4, 0, '#ffffff', 1, 1),
(31, '嗨', 3, 0, '#ffffff', 1, 1),
(32, '弹幕', 3, 0, '#ffffff', 1, 1),
(33, '看哪里', 3, 0, '#ffffff', 1, 1),
(34, '哈哈哈', 3, 0, '#ffffff', 1, 1),
(35, 'xhdhdh', 103, 0, '#ffffff', 1, 1),
(36, 'dhdhdh', 3, 0, '#ffffff', 1, 1),
(37, 'hdhd', 3, 0, '#ffffff', 1, 1),
(38, '66666', 3, 0, '#ffffff', 1, 1),
(39, 'shdhdh', 3, 0, '#ffffff', 1, 1),
(40, 'hdhdhx', 3, 0, '#ffffff', 1, 1),
(41, 'qqa', 3, 0, '#ffffff', 1, 1),
(42, '5555565', 3, 0, '#ffffff', 1, 1),
(43, 'chhh', 3, 0, '#ffffff', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `movie`
--

CREATE TABLE IF NOT EXISTS `movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Mname` varchar(128) NOT NULL,
  `PicUrl` varchar(50) NOT NULL,
  `Actor` text CHARACTER SET latin1 NOT NULL,
  `showTime` varchar(20) NOT NULL,
  `content` text NOT NULL,
  `movieUrl` varchar(128) NOT NULL,
  `moviePlayTime` varchar(28) NOT NULL,
  `fid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `enable` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- 转存表中的数据 `movie`
--

INSERT INTO `movie` (`id`, `Mname`, `PicUrl`, `Actor`, `showTime`, `content`, `movieUrl`, `moviePlayTime`, `fid`, `uid`, `enable`) VALUES
(15, '夏目友人帐 第六季(第9集) 第9集', './upload/moviePic/movie-144066615.jpg', 'no', '2014-05-01', '低调才是最牛逼的炫耀？且看小米平板3，除了联发科还有啥！', './upload/video/video-144066615.mp4', '123min', 2, 1, 1),
(16, '颜值即正义？ 100秒看懂小米平板3', './upload/moviePic/movie-144066616.jpg', 'no', '2017-3-22', ' 渐渐习惯了现代生活的美国队长史蒂夫·罗杰斯（克里斯·埃文斯 Chris Evans 饰），在一次行动后隐隐嗅到神盾局内部所弥漫出来的凶险气味。而当得知神盾局正秘密进行的“洞察计划”后，他更为此感到愤怒。某天，神盾局指挥官尼克-法瑞（塞缪尔·杰克逊 Samuel L. Jackson 饰）遭到一群武装分子袭击，他拼尽全力将一支U盘交到美国队长手中，这里面藏着该局二战以来最重要且最可怕的秘密。在此之后，美国队长因涉嫌杀害尼克而遭到前局长亚历山大·皮尔斯（罗伯特·雷德福/Robert Redford 饰）的通缉和追杀，逃亡中他得到黑寡妇（斯嘉丽·约翰逊 Scarlett Johansson 饰）和退伍老兵“猎鹰”（安东尼·麦凯 Anthony Mackie 饰）的帮助。 他们必须争分夺秒解开神盾局的秘密，阻止“洞察计划”的施行……', './upload/video/video-144066616.mp4', '120min', 4, 1, 1),
(13, '三星S8发布国行定价5688元起', './upload/moviePic/movie-144066613.jpg', 'no', '2014-05-01', '5月22日消息，关于三星S8国行什么时候发布，三星S8国行发布时间一再上星期正式发布，关于三星S8国行售价多少钱，三星S8国行价格5688元起。', './upload/video/video-144066613.mp4', '123min', 4, 1, 1),
(14, '时钟机关之星(第10集) 第10集', './upload/moviePic/movie-144066614.jpg', 'no', '2014-05-01', '电视动画《时钟机关之星》改编自榎宫祐和暇奈椿的同名轻小说，于2015年12月宣布了动画化企划的消息。[1-2] 动画于2017年4月6日开播，由XEBEC负责动画制作。——虽然很突然。但世界已经灭亡了。 1000年前一度毁灭的地球， 由名为“Y”的传说中的时钟技师以时钟装置再构筑而成的世界。 吊车尾高中生·见浦直人， 与“Y”所留下的自动人偶琉紫， 以及天才时钟技师少女·玛莉相遇了。 当他们的能力相互咬合时，命运的齿轮开始转动。 不断重复破裂与延命， 将即将崩坏的地球（“时钟机关之星”）修复的 时钟朋克·幻想剧！', './upload/video/video-144066614.mp4', '123min', 2, 1, 1),
(12, '进击的巨人 第二季(第10集) 第10集', './upload/moviePic/movie-144066612.jpg', 'no', '2017-3-22', '自从人类的和平被超大型巨人打破的那天起，艾伦·耶格尔便每天持续着没有尽头的战斗...。 因为眼睁睁看着母亲被巨人撕裂，艾伦发誓要将世间的巨人一只不留地杀灭。 但是，在严酷的战斗中，艾伦自身也会变成巨人的姿态。 为了人类的自由，艾伦施展着巨人的力量，并和女人型的巨人发生了冲突。 巨人间的战斗中艾伦最终得以胜出。 巨人不断地造访，下一轮的战斗已经宣告开始。 对于接连而来的巨人，人类将如何去面对？', './upload/video/video-144066612.mp4', '120min', 2, 2, 1),
(8, '房间装饰品和家具分享', './upload/moviePic/movie-14406668.jpg', 'no', '2017-02-01', '大家好，我是Lola，每周都会有video更新，请大家订阅我的频道', './upload/video/video-14406668.mp4', '123min', 5, 1, 1),
(9, '锋味全球美食地图 09', './upload/moviePic/movie-14406669.jpg', 'no', '2017-02-01', '《锋味全球美食地图》是一档由谢霆锋主持的美食节目，一起来跟谢大厨品尝日本的便利店美食～', './upload/video/video-14406669.mp4', '123min', 5, 1, 1),
(10, '回形針的二十個改裝妙招20 Paper Clip Hacks for Survival & Everyday Uses', './upload/moviePic/movie-144066610.jpg', 'no', '2017-02-01', '生活小常识，回形針的二十個改裝妙招', './upload/video/video-144066610.mp4', '123min', 5, 2, 1),
(11, '火影忍者 博人传(第10集) 第10集', './upload/moviePic/movie-144066611.jpg', 'no', '2017-3-1', '随着和平的到来而走向近代化的木叶忍者村。高楼林立，巨大显示屏中播放出影像，连结各区域的电车在村里奔驰。虽说是忍者村，但一般民众也增多，忍者的生存方式也在逐渐改变的这个时代—— 村子的领袖，第七代火影·漩涡鸣人的儿子慕留人，进入了培育忍者的学校“忍者学校”。周围的学生们带着“火影的儿子”这样偏见的目光看待慕留人，但慕留人凭借天生的破天荒性格将这种小事轻松越过！ 慕留人与新的伙伴相遇，他将如何挑战突然发生的神秘事件？ 在众人心中如疾风般狂奔的“漩涡慕留人”的物语，现在开始！！', './upload/video/video-144066611.mp4', '108min', 2, 1, 1),
(2, '3分钟揭示健身小白与健身大牛真正的区别', './upload/moviePic/movie-14406662.jpg', 'no', '2017-4-25', '《家庭健身》是一档健身生活类节目。节目用最简单的方法教大家轻轻松松在家里就能完成健身，喜欢健身的朋友不要错', './upload/video/video-14406662.mp4', '100min', 5, 2, 1),
(3, 'ID-0(第9集) 第9集', './upload/moviePic/movie-14406663.jpg', 'no', '2017-3-22', ' I-Machine——那是在极限环境下作业的大型机器人的总称。 联盟学院学生三栗麻耶在使用I-Machine的途中被卷入事故， 得到驾驶着I-Machine、如同海贼一般挖掘欧利哈特矿石的埃斯卡维特公司的宇宙船的帮助，并演变成要身为公司的一员进行工作的局面……。 在各有特点的成员们当中生活的同时，麻耶开始逐渐了解何为“人类”。 ——隐藏在失去的记忆中的，是希望还是绝望——', './upload/video/video-14406663.mp4', '120min', 2, 1, 1),
(4, 'iPhone篇：最全 iOS 11 体验，看这个就够了', './upload/moviePic/movie-14406664.jpg', 'no', '2017-03-23', '主持人亲自体验iphone IOS 11系统的感受，最全最新', './upload/video/video-14406664.mp4', '123minmin', 4, 1, 1),
(5, 'Rokid：人工智能产品进入新的时代，一切从认识你开始', './upload/moviePic/movie-14406665.jpg', 'no', '2017-2-1', 'Rokid团队刚发布最新的产品视频，充分展示了旗下产品若琪.月石的最新成果——声纹识别', './upload/video/video-14406665.mp4', '123min', 4, 2, 1),
(6, 'Room Mate(第9集) 第9集', './upload/moviePic/movie-14406666.jpg', 'no', '2014-05-01', '《Room Mate》是2017年1月播出的《One Room》日本原创短篇电视动画得男性角色版本，由台风Graphics制作，于在2017年4月播出。本作的主角是观众。观众可以通过这部作品以主观视角体验和喜欢的人一起生活的日常。 观众成为了一个西洋风公寓的管理员，并与在3个住在那里的男人相遇。从此和独具个性的他们过这欢乐刺激，又甜蜜纠结的每一天。', './upload/video/video-14406666.mp4', '123min', 2, 2, 1),
(7, '《科技早报在台北》探秘亚洲唯一女生科技媒体的秘密基地', './upload/moviePic/movie-14406667.jpg', 'no', '2017-02-01', '中国第一科技门户探访台湾女生科技媒体', './upload/video/video-14406667.mp4', '123min', 4, 2, 1),
(1, '金土豆奖PGC#去黑头还想缩', './upload/moviePic/movie-14406661.jpg', 'no', '2017-3-1', '简介：【女子力科学社】去黑头还想缩毛孔？快试试这个方法吧！鼻子上的小黑点们，不挤看着难受，挤了不光痛，还会让毛孔越来越明显！怎么办？你们的烦恼女子力科学社学姐都知道!', './upload/video/video-14406661.mp4', '108min', 5, 1, 1),
(17, '这种煎饼在中国流行了1千多年', './upload/moviePic/movie-144066617.jpg', 'no', '2017-02-01', '农村大妈古法制作，外地人开车运几千张', './upload/video/video-144066617.mp4', '123min', 5, 2, 1),
(18, '王者荣耀新版本：6月6日更新后的孙尚香 强壮无敌！', './upload/moviePic/movie-144066618.jpg', 'no', '2017-3-1', '王者荣耀：玩射手的必须看！六月六日更新后的孙尚香很强势', './upload/video/video-144066618.mp4', '108min', 1, 1, 1),
(19, '英雄联盟世界大赛上，faker被各国中单单杀的那些美好画面！', './upload/moviePic/movie-144066619.jpg', 'no', '2017-4-25', '今日头条搬运观众老爷们，大家好，我们是老湿鸡，我们会每天定期为大家带来精彩又搞笑的视频，喜欢的老铁就关注我们', './upload/video/video-144066619.mp4', '100min', 1, 2, 1),
(20, '新游尝鲜坊《兽人必须死》我们才是主角', './upload/moviePic/movie-144066620.jpg', 'no', '2017-3-1', '新游尝鲜坊《兽人必须死》我们才是主角', './upload/video/video-144066620.mp4', '108min', 1, 1, 1),
(21, '捻心：生命之跃——心跳战！', './upload/moviePic/movie-144066621.jpg', 'no', '2017-4-25', '捻心：生命之跃——心跳战！', './upload/video/video-144066621.mp4', '100min', 1, 2, 1),
(22, '【Mario×冥月】若当来世【狐妖小红娘月红篇OP】', './upload/moviePic/movie-144066622.jpg', 'no', '2017-3-1', '【Mario×冥月】若当来世【狐妖小红娘月红篇OP】', './upload/video/video-144066622.mp4', '108min', 3, 1, 1),
(23, '祈Inory×wis×雪霏岚岚】超时空要塞△OP 粤语版 《如果只有一次恋爱》', './upload/moviePic/movie-144066623.jpg', 'no', '2017-4-25', '是不是很有TVB动画片主题曲的感觉？感谢小祈和wis陪我一起填这个坑~给各位staff们表个白♪要在银河内  以这光  照亮时代F写的词也超棒的！！效率超高！希望大家也喜欢啦0w0', './upload/video/video-144066623.mp4', '100min', 3, 2, 1),
(24, '【Saneyori】花朵艳丽 终散落【原创PV】【东方Project】', './upload/moviePic/movie-144066624.jpg', 'no', '2017-3-1', '「色は匂へど散りぬるを」——幻想万华镜~春雪异变之章OP“枯萎逝去的生命哟 变的梦幻而坚强 像时间一样 冷酷而温柔”◆Mp3：http://music.163.com/#/album?id=35375268（网易云）◆Vocal：里桜Saneyori ◆Original：senya◇Mix：夏萝 ◇Illustration：faiya ◇Poster：钴蓝 ◇PV：宫村琴美', './upload/video/video-144066624.mp4', '108min', 3, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `movieCategory`
--

CREATE TABLE IF NOT EXISTS `movieCategory` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `movieCategory`
--

INSERT INTO `movieCategory` (`fid`, `name`) VALUES
(1, '游戏'),
(2, '动漫'),
(3, '音乐'),
(4, '科技'),
(5, '生活'),
(6, '测试');

-- --------------------------------------------------------

--
-- 表的结构 `movieComment`
--

CREATE TABLE IF NOT EXISTS `movieComment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text NOT NULL,
  `time` text NOT NULL,
  `mid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `enable` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=69 ;

--
-- 转存表中的数据 `movieComment`
--

INSERT INTO `movieComment` (`id`, `comment`, `time`, `mid`, `uid`, `enable`) VALUES
(68, '5555555', '2017-06-23 15:32', 3, 3, 1),
(67, 'hahaha', '2017-06-22 16:15', 3, 3, 1),
(62, '', '2017-06-13 23:55', 12, 3, 1),
(63, '', '2017-06-13 23:55', 12, 3, 1),
(64, 'Fdfdfdd', '2017-06-15 15:23', 7, 3, 1),
(65, '6666', '2017-06-19 20:18', 3, 6, 1),
(61, '哈哈哈哈哈哈哈哈哈哈哈哈', '2017-06-13 00:05', 3, 3, 1),
(66, '666666', '2017-06-22 15:52', 3, 1, 1),
(60, '啦咯啦咯啦咯啦咯', '2017-06-12 23:56', 3, 3, 1),
(58, '评论测试', '2017-06-10 18:12', 13, 1, 0),
(59, '测试', '2017-06-12 10:52', 2, 3, 1);

-- --------------------------------------------------------

--
-- 表的结构 `topic`
--

CREATE TABLE IF NOT EXISTS `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tname` varchar(120) NOT NULL,
  `content` text NOT NULL,
  `coverPic` text NOT NULL,
  `time` text NOT NULL,
  `categoryId` int(11) NOT NULL,
  `article` text NOT NULL,
  `uid` int(11) NOT NULL,
  `enable` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- 转存表中的数据 `topic`
--

INSERT INTO `topic` (`id`, `tname`, `content`, `coverPic`, `time`, `categoryId`, `article`, `uid`, `enable`) VALUES
(30, '66666666', '66666', './upload/editor/upload-149811973223642679613.jpg', '2017-06-22 16:24', 1, '<p><b><i>然后有一套图 u 兔兔图图 u 天</i></b></p><p><b><i><br></i></b></p><p style="text-align: center; "><b><br></b></p>', 0, 1),
(29, '测试3', '测试3', './upload/editor/upload-149728189894282425655.jpg', '2017-06-12 23:38', 1, '<p><img style="width: 100%;" src="http://back.dubinbin.cn:8080/upload/editor/upload-149728190884116719228.jpg"></p><p>富文本编辑器测试</p>', 0, 1),
(27, '测试1', '仅作测试(想不到别的词)', './upload/editor/upload-149728175944378901139.jpg', '2017-06-12 23:37', 1, '<p><img style="width: 100%;" src="http://back.dubinbin.cn:8080/upload/editor/upload-149728177247014353902.jpg"><br></p>', 0, 1),
(28, '测试2', '测试2', './upload/editor/upload-149728180416724335430.jpg', '2017-06-12 23:38', 1, '<p><img style="width: 100%;" src="http://back.dubinbin.cn:8080/upload/editor/upload-149728181159665380196.jpg"></p><p><span style="font-size: 16px; background-color: rgb(255, 255, 255);">富文本编辑器测试</span><br></p>', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `topicCategory`
--

CREATE TABLE IF NOT EXISTS `topicCategory` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `topicCategory`
--

INSERT INTO `topicCategory` (`tid`, `name`) VALUES
(1, '话题中心'),
(2, '活动中心'),
(3, '游戏中心'),
(4, '兴趣圈');

-- --------------------------------------------------------

--
-- 表的结构 `topicComment`
--

CREATE TABLE IF NOT EXISTS `topicComment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text NOT NULL,
  `time` text NOT NULL,
  `tid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `enable` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `topicComment`
--

INSERT INTO `topicComment` (`id`, `comment`, `time`, `tid`, `uid`, `enable`) VALUES
(3, 'test', '2017-06-13 12:45', 27, 1, 1),
(4, 'test', '2017-06-13 12:46', 27, 3, 1);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(128) NOT NULL,
  `thumb` varchar(50) DEFAULT './upload/user/user.png',
  `mobile` varchar(13) NOT NULL,
  `enable` int(11) NOT NULL DEFAULT '1',
  `level` int(11) NOT NULL,
  `collect` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `thumb`, `mobile`, `enable`, `level`, `collect`) VALUES
(1, 'admin', '6234b53ad37ba5cfc0fa9d04ffb25fd0', './upload/user/user-149708950335353135841.jpg', '15521305646', 1, 0, ',5,3,6'),
(2, 'du', '81dc9bdb52d04dc20036dbd8313ed055', './upload/user/user-149606955685369453380.jpg', '13620967305', 1, 1, ',3,5,2'),
(3, 'test', '2e707b949d98fe415d523806bcaf0bc6', './upload/user/user-149811817749111289925.jpg', '12345678901', 1, 1, ',1,11,6,2,3'),
(4, 'root', '6234b53ad37ba5cfc0fa9d04ffb25fd0', './upload/user/user-149784137110073629694.jpg', '15521305646', 1, 1, ''),
(6, 'excited', '6234b53ad37ba5cfc0fa9d04ffb25fd0', './upload/user/user-149787468283597131096.jpg', '15521305646', 1, 1, ''),
(7, 'minmin', '698d51a19d8a121ce581499d7b701668', './upload/user/user.png', '15602331841', 1, 1, ',13,18,3'),
(8, 'kk', 'e10adc3949ba59abbe56e057f20f883e', './upload/user/user.png', '13138380055', 1, 1, ',18,3,12');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

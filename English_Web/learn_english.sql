-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2024-12-02 00:14:35
-- 服务器版本： 10.4.32-MariaDB
-- PHP 版本： 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `learn_english`
--

-- --------------------------------------------------------

--
-- 表的结构 `eng_words`
--

CREATE TABLE `eng_words` (
  `id` int(11) NOT NULL,
  `word` varchar(50) DEFAULT NULL COMMENT '单词',
  `Soundmark` varchar(50) DEFAULT NULL COMMENT '音标',
  `word_Class` varchar(5) DEFAULT NULL COMMENT '词性',
  `MeaningOfword` varchar(100) DEFAULT NULL COMMENT '词义',
  `Example_Sentence` varchar(200) DEFAULT NULL COMMENT '例句',
  `Synonyms` varchar(30) DEFAULT NULL COMMENT '同义词',
  `Status` int(11) DEFAULT 0 COMMENT '标记删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='词汇表';

--
-- 转存表中的数据 `eng_words`
--

INSERT INTO `eng_words` (`id`, `word`, `Soundmark`, `word_Class`, `MeaningOfword`, `Example_Sentence`, `Synonyms`, `Status`) VALUES
(1, 'apple', '/ˈæpl/', 'n.', '苹果', 'She ate an apple for breakfast.', 'fruit, pome', 0),
(2, 'book', '/bʊk/', 'n.', '书籍', 'I borrowed a book from the library.', 'novel, text', 0),
(3, 'dog', '/dɔɡ/', 'n.', '狗', 'The dog is playing in the yard.', 'puppy, canine', 0),
(4, 'cat', '/kæt/', 'n.', '猫', 'The cat slept on the couch all day.', 'kitten, feline', 0),
(5, 'car', '/kɑːr/', 'n.', '汽车', 'He drove his car to work.', 'vehicle, automobile', 0),
(6, 'ball', '/bɔːl/', 'n.', '球', 'The kids are playing with a ball in the park.', 'sphere, orb', 0),
(7, 'sky', '/skaɪ/', 'n.', '天空', 'The sky is clear and blue today.', 'heavens, atmosphere', 0),
(8, 'tree', '/triː/', 'n.', '树', 'The tree provides shade on a hot day.', 'plant, sapling', 0),
(9, 'mountain', '/ˈmaʊntɪn/', 'n.', '山', 'They climbed to the top of the mountain.', 'hill, peak', 0),
(10, 'house', '/haʊs/', 'n.', '房子', 'We just moved into a new house.', 'home, residence', 0),
(11, 'friend', '/frɛnd/', 'n.', '朋友', 'She is my best friend.', 'companion, buddy', 0),
(12, 'rain', '/reɪn/', 'n.', '雨', 'The rain started pouring down suddenly.', 'precipitation, shower', 0),
(13, 'sun', '/sʌn/', 'n.', '太阳', 'The sun is shining brightly today.', 'star, sunlight', 0),
(14, 'moon', '/muːn/', 'n.', '月亮', 'The moon looks beautiful tonight.', 'satellite, lunar', 0),
(15, 'water', '/ˈwɔːtə(r)/', 'n.', '水', 'Please drink a glass of water.', 'liquid, H2O', 0),
(16, 'food', '/fuːd/', 'n.', '食物', 'They cooked a lot of food for the party.', 'meal, nourishment', 0),
(17, 'computer', '/kəmˈpjuːtə(r)/', 'n.', '计算机', 'I use my computer for work and entertainment.', 'PC, laptop', 0),
(18, 'phone', '/fəʊn/', 'n.', '电话', 'She answered the phone quickly.', 'cellphone, mobile', 0),
(19, 'desk', '/dɛsk/', 'n.', '书桌', 'She is sitting at her desk, writing a letter.', 'table, workstation', 0),
(20, 'chair', '/tʃɛə(r)/', 'n.', '椅子', 'There are four chairs around the dining table.', 'seat, armchair', 0),
(21, 'window', '/ˈwɪndəʊ/', 'n.', '窗户', 'The window is open to let in some fresh air.', 'glass, opening', 0),
(22, 'door', '/dɔːr/', 'n.', '门', 'The door is locked for safety.', 'entrance, gateway', 0),
(23, 'key', '/kiː/', 'n.', '钥匙', 'He forgot the key at home.', 'unlocker, tool', 0),
(24, 'light', '/laɪt/', 'n.', '光', 'She switched on the light to read.', 'lamp, illumination', 0),
(25, 'music', '/ˈmjuːzɪk/', 'n.', '音乐', 'She loves listening to classical music.', 'melody, tune', 0),
(26, 'love', '/lʌv/', 'n.', '爱', 'They are in love with each other.', 'affection, passion', 0),
(27, 'anger', '/ˈæŋɡə(r)/', 'n.', '愤怒', 'His anger was evident on his face.', 'rage, fury', 0),
(28, 'peace', '/piːs/', 'n.', '和平', 'They are working for world peace.', 'calm, tranquility', 0),
(29, 'happiness', '/ˈhæpɪnɪs/', 'n.', '幸福', 'She found true happiness in her family.', 'joy, contentment', 0),
(30, 'sadness', '/ˈsædnəs/', 'n.', '悲伤', 'He felt a deep sadness after hearing the news.', 'sorrow, grief', 0),
(31, 'freedom', '/ˈfriːdəm/', 'n.', '自由', 'They fought for freedom and justice.', 'liberty, autonomy', 0),
(32, 'justice', '/ˈdʒʌstɪs/', 'n.', '正义', 'The court will deliver justice to the victim.', 'fairness, righteousness', 0),
(33, 'courage', '/ˈkʌrɪdʒ/', 'n.', '勇气', 'She showed great courage during the crisis.', 'bravery, valor', 0),
(34, 'strength', '/strɛŋθ/', 'n.', '力量', 'He is admired for his physical strength.', 'power, force', 0),
(35, 'intelligence', '/ɪnˈtɛlɪdʒəns/', 'n.', '智慧', 'Her intelligence helped her solve the problem.', 'wit, cleverness', 0),
(36, 'bravery', '/ˈbreɪvəri/', 'n.', '勇敢', 'The soldier\'s bravery was commendable.', 'courage, valor', 0),
(37, 'health', '/hɛlθ/', 'n.', '健康', 'A good diet is essential for good health.', 'well-being, fitness', 0),
(38, 'knowledge', '/ˈnɒlɪdʒ/', 'n.', '知识', 'He has a lot of knowledge about history.', 'wisdom, understanding', 0),
(39, 'education', '/ˌedjuˈkeɪʃən/', 'n.', '教育', 'Education is the key to success.', 'learning, schooling', 0),
(40, 'science', '/ˈsaɪəns/', 'n.', '科学', 'She is studying science at university.', 'research, knowledge', 0),
(41, 'art', '/ɑːt/', 'n.', '艺术', 'The museum displays a lot of modern art.', 'creativity, painting', 0),
(42, 'history', '/ˈhɪstəri/', 'n.', '历史', 'They studied the history of ancient Rome.', 'past, record', 0),
(43, 'language', '/ˈlæŋɡwɪdʒ/', 'n.', '语言', 'She is learning a new language.', 'speech, dialect', 0),
(44, 'mathematics', '/ˌmæθəˈmætɪks/', 'n.', '数学', 'Mathematics is essential for many sciences.', 'math, arithmetic', 0),
(45, 'chemistry', '/ˈkɛmɪstri/', 'n.', '化学', 'She is studying chemistry at university.', 'science, organic chemistry', 0),
(46, 'physics', '/ˈfɪzɪks/', 'n.', '物理学', 'Physics explains many natural phenomena.', 'science, mechanics', 0),
(47, 'technology', '/tɛkˈnɒlədʒi/', 'n.', '技术', 'Advances in technology are changing the world.', 'innovation, engineering', 0),
(48, 'environment', '/ɪnˈvaɪərənmənt/', 'n.', '环境', 'We need to protect the environment for future generations.', 'nature, surroundings', 0),
(49, 'economy', '/ɪˈkɒnəmi/', 'n.', '经济', 'The economy is growing steadily this year.', 'finance, market', 0),
(50, 'government', '/ˈɡʌvənmənt/', 'n.', '政府', 'The government is introducing new policies.', 'administration, authority', 0),
(51, 'society', '/səˈsaɪəti/', 'n.', '社会', 'She is an active member of the society.', 'community, civilization', 0),
(52, 'culture', '/ˈkʌltʃə(r)/', 'n.', '文化', 'They studied the culture of ancient Egypt.', 'heritage, tradition', 0),
(53, 'nature', '/ˈneɪtʃə(r)/', 'n.', '自然', 'Nature is beautiful, especially in spring.', 'environment, wilderness', 0),
(54, 'planet', '/ˈplænɪt/', 'n.', '行星', 'Earth is the third planet from the sun.', 'world, orb', 0),
(55, 'star', '/stɑː(r)/', 'n.', '星星', 'The night sky was full of stars.', 'celestial body, asteroid', 0),
(56, 'universe', '/ˈjuːnɪvɜːs/', 'n.', '宇宙', 'The universe is vast and full of mysteries.', 'cosmos, space', 0),
(57, 'spider', '/spai.dər/', 'n.', '蜘蛛', 'Spider man Spider man,our hero spider!', 'This word does not have any sy', 0),
(58, 'spider-man', '/spai.dər mæn/', 'n.', '蜘蛛侠', 'Spider man Spider man,our hero spider!', 'This word does not have any sy', 1);

--
-- 转储表的索引
--

--
-- 表的索引 `eng_words`
--
ALTER TABLE `eng_words`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `eng_words`
--
ALTER TABLE `eng_words`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

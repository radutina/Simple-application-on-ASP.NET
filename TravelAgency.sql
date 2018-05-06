-- phpMyAdmin SQL Dump
-- version 4.4.15.7
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 28 2017 г., 19:22
-- Версия сервера: 5.5.50
-- Версия PHP: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `TravelAgency`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Country`
--

CREATE TABLE IF NOT EXISTS `Country` (
  `id_country` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Country`
--

INSERT INTO `Country` (`id_country`, `name`) VALUES
(1, 'USA'),
(2, 'Australia'),
(3, 'Austria'),
(4, 'Argentina'),
(5, 'Bułgaria'),
(6, 'Barbados'),
(7, 'Belgium'),
(8, 'Białoruś'),
(9, 'Francja'),
(10, 'Cypr'),
(11, 'Francja'),
(12, 'Grecja'),
(13, 'Luksemburg'),
(14, 'Monako'),
(15, 'Niemcy'),
(16, 'Polska'),
(17, 'Portugalia'),
(18, 'Serbia'),
(19, 'Szwajcaria'),
(20, 'Turcja'),
(21, 'Watykan'),
(22, 'Węgry'),
(23, 'Włochy');

-- --------------------------------------------------------

--
-- Структура таблицы `Customer`
--

CREATE TABLE IF NOT EXISTS `Customer` (
  `id_customer` int(11) NOT NULL,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(40) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Customer`
--

INSERT INTO `Customer` (`id_customer`, `first_name`, `last_name`, `phone`, `email`) VALUES
(1, ' Stanisław ', ' Kowalski ', '577894388', '  s.kowalski@gmail.com '),
(2, ' Teresa ', ' Kaczmarek ', '5778789655', '  t.kaczmarek@gmail.com '),
(3, ' Grażyna ', ' Borowska ', '5778229655', '  g.borowska@gmail.com ');

-- --------------------------------------------------------

--
-- Структура таблицы `Deal`
--

CREATE TABLE IF NOT EXISTS `Deal` (
  `id_deal` int(11) NOT NULL,
  `id_tour` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Deal`
--

INSERT INTO `Deal` (`id_deal`, `id_tour`, `id_customer`, `id_employee`, `date`) VALUES
(1, 1, 1, 1, '0000-00-00'),
(2, 4, 2, 1, '0000-00-00'),
(3, 4, 3, 1, '0000-00-00');

-- --------------------------------------------------------

--
-- Структура таблицы `Eployee`
--

CREATE TABLE IF NOT EXISTS `Eployee` (
  `id_employee` int(11) NOT NULL,
  `first_name` varchar(40) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `login` varchar(8) NOT NULL,
  `passwords` varchar(8) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Eployee`
--

INSERT INTO `Eployee` (`id_employee`, `first_name`, `last_name`, `phone`, `email`, `login`, `passwords`) VALUES
(1, 'Mariia', 'Radutina', '588897466', 'mariaradutina@gmail.com', 'admin', '1');

-- --------------------------------------------------------

--
-- Структура таблицы `Kurort`
--

CREATE TABLE IF NOT EXISTS `Kurort` (
  `id_kurort` int(11) NOT NULL,
  `id_country` int(11) NOT NULL,
  `hotel` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `about` varchar(1000) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Kurort`
--

INSERT INTO `Kurort` (`id_kurort`, `id_country`, `hotel`, `name`, `city`, `about`) VALUES
(1, 6, 'Accra Beach Hotel & Spa', 'Barbadoss Pasha Beach Club', 'Barbados ', 'Odkryj jedno z najpiękniejszych miejsc na Karaibach w Accra Beach hotel & Spa. Schowany wśród bujnych tropikalnych ogrodów i drzew palmowych, w naszej rodzinie nowoczesny styl życia ośrodka zapewnia niezrównaną wakacje na południowym wybrzeżu Barbadosu.\r\n\r\nAccra Beach hotel & SPA położony jest bezpośrednio przy piaszczystej plaży Rockley – zawsze jest uważana za jedną z najlepszych plaż Barbados – i nasze 3.5 ha otoczony jest sklepami, restauracjami i atrakcjami.\r\n\r\nNasz rodzinny sposób ośrodek dysponuje dużym odkrytym basenem z barem, cichy basen tylko dla dorosłych, a także basen dla dzieci i spa z pełnym zakresem usług, tworząc doskonały wybór dla wyspy-kurortu. Możemy również serwuje pyszne dania kuchni międzynarodowej w trzech restauracjach na terenie hotelu i przyjmującej cotygodniowe imprezy rozrywkowe, jak karaoke, taniec limbo i wesołych floorshows z глотателями ognia i muzyka na żywo.'),
(2, 2, 'Adelaide', 'Mayfair Hotel', 'Adelaide ', 'Adelaide jest stolicą stanu Australia Południowa, słynącą z dużej liczby zabytkowych kościołów różnych wyznań, ciekawego układu urbanistycznego oraz dzielnicy nadmorskiej. Co ciekawe, w Adelaide mieszka wiele osób polskiego pochodzenia, a mieście funkcjonuje kilka środowisk polonijnych, w tym Dom Polski i Dom Kopernika.'),
(3, 4, 'Fierro Hotel Buenos Aires', 'Buenos Aires', 'Buenos Aires', 'Główne atrakcje stolicy Argentyny, Buenos Aires to niewątpliwie, założonym jeszcze w 1580 r. plac Plaza de Mayo, którego otaczają okazałe budowle pochodzące z XIX wieku. W samym Buenos Aires starsza jest jeszcze katedra metropolitarna, z lat 1687 - 1729, w której to znajduje się grobowiec słynnego Josego de San Martín najbardziej czczonego w Argentynie bohatera narodowego, który zasłynął z prowadzenia walk na rzecz niepodległość. Niebywałą atrakcją turystyczną jest tak zwany Różowy Dom (Casa Rosada) będący pałacem prezydenckim i udostępnionym do zwiedzania po upadku dyktatury w 1983 r. Będąc w okolicy warto zobaczyć również takie miejsca jak; Teatr Kolumba (Teatro Colon, będący jednym z największych teatrów operowych na świecie), Plac Kongresowy (Plaza del Congreso) wraz z pomnikiem kongresmanów upamiętniającym uzyskanie niepodległości, deptak i promenadę Avenida de Mayo calle Florida,'),
(4, 4, 'Tierra Patagonia Hotel & Spa', 'Patagonia ', 'Patagonia', 'Patagonia to przepiękna i mistyczna kraina geograficzna położona w południowej części Argentyny jak i całej Ameryki Południowej. Na zachodzie i południu Patagonia obejmuje część Andów (Kordyliera Patagońska) oraz Ziemię Ognistą, na północy ograniczona jest Pampą i niziną La Platy, natomiast na wschodzie sięga do Oceanu Atlantyckiego. Na jej terenie znajduje się m.in. Wyżyna Patagońska, Cieśnina Magellana oraz przylądek Horn. Jednym z najwspanialszych miejsc w Patagonii są niewątpliwie (zaliczane do dziedzictwa światowego UNESCO) lodowce, (słynny Perito Moreno) które pokrywają obszar 13 000 km2, i przyciągają turystów i podróżnych z całego świata. Te magiczne błękitne płaty lodu podziwiać można w Parku Narodowym Los Glaciers z specjalnie przygotowanych tarasów widokowych lub też, (co zdecydowanie polecamy) udać się na wycieczkę statkiem wycieczkowym, która zabierze nas do odległych i najbardziej zapomnianych i przepięknych zakątków świata. '),
(5, 10, 'Hilton Cyprus', 'Nikozja', 'Nikazja', 'NIKOZJA (gr. Lefkosia, tur. Lefkoşa) jest stolicą Cypru, ośrodkiem administracyjnym dystryktu Nikozja, położona w północnej części wyspy, na nizinie Mesaria. W starożytności znana była jako Ledra, a następnie jako Leukosia. Od IV w. była siedzibą biskupa. Za panowania dynastii Lusignanów (1192-1489) została stolicą Cypru. Pod rządami Wenecjan (1489-1571) otoczono ją murami obronnymi. Następnie, wraz z całym Cyprem, znalazła się w imperium osmańskim. Od roku 1878 była stolicą kolonii brytyjskiej, od roku 1960 stolicą niepodległej Republiki Cypryjskiej. Od roku 1974 (data tureckiej inwazja na Cypr) północna część miasta (z byłym międzynarodowym portem lotniczym) pozostaje pod kontrolą międzynarodowych sił pokojowych ONZ, które nadzorują granicę między Republiką Cypryjską a Republiką Turecką Cypru Północnego.'),
(6, 10, 'Lordos Beach Hotel', 'Larnaka', 'Larnaka', 'Larnaka jest starym miastem z długą historią. W czasach antycznych na terenie dzisiejszej Larnaki znajdowało się miasto Kition.\r\nNa początku średniowiecza Larnaka była dużym centrum wydobycia soli. W tych czasach miasto nazywało się Salina. Współczesna nazwa miasta pochodzi od greckiego słowa larnaks, oznaczającego naczynie, pojemnik lub sarkofag służące do przechowywania doczesnych szczątków zmarłego, a nadana została przez Wenecjan w XVII w.\r\nKition zostało założone przez fenickich kolonistów w XII wieku p. n. e. i było obok Kadyksu czy Kartaginy jedną z najstarszych fenickich kolonii. Było też fenicką enklawą na skolonizowanym przez Greków starożytnym Cyprze. Stąd pochodził jeden z najsławniejszych filozofów starożytnej Grecji, twórca stoicyzmu, Zenon z Kition, który według Diogenesa Laertiosa był narodowości fenickiej.  '),
(7, 10, 'Sunrise Gardens Hotel', 'Protaras', 'Protaras', ' Kurort Protaras znajduje się na południowym - wschodzie wyspy. Dojazd z międzynarodowego lotniska Larnaki zajmuje około godziny.\r\nPodobnie jak inne turystyczne miejscowości Protaras był stosunkowo niedawno niedużą wioską.. Protaras słynie z dwóch rzeczy: malowniczych wiatraków i wspaniałych piaszczystych plaż. W kurorcie panuje szczególnie przytulna atmosfera. Jest tu bardzo spokojnie i cicho. Planując kurort architekci zachowali niepowtarzalną atmosferę miasta.\r\nTo idealne miejsce dla spokojnego, rodzinnego odpoczynku. '),
(8, 11, 'Langley Hôtel Tignes ', 'Tignes', 'Tignes', ' Tignes i pobliskie Val d’Isere należą do Espace Killy - jednego z najpiękniejszych terenów narciarskich na świecie. To też jeden z największych obszarów dla miłośników białego szaleństwa, bo oferuje aż 300 km tras. W Tignes działa 79 wyciągów, a dla wielbicieli freestyle’u dwa snowparki i SuperPipe. To druga - po Val Thorens - najwyżej położona stacja narciarska w Europie, dlatego sezon trwa tu najdłużej w Alpach. Kolejka Funiculaire inspirowana metrem wwozi narciarzy pod lodowiec Grande Motte na wysokość 3032 m n.p.m. w zaledwie kilka minut. Kurort swoją ofertę kieruje głównie do ludzi młodych (25-45 lat) oraz rodzin, raczej dobrych narciarzy. Tignes słynie też z rozrywki klubowej oraz licznych barów i restauracji, w których można dobrze zjeść i bawić się do białego rana. Na spektakularnych (darmowych!) imprezach pod gołym niebem, przy muzyce największych gwiazd, potrafi bawić się nawet kilkanaście tys. osób. .  '),
(9, 11, 'Bahia ', 'Nicea', 'Nicea', ' Nicea  – miasto we Francji, w regionie Prowansja-Alpy-Lazurowe Wybrzeże, w departamencie Alpy Nadmorskie. Jest piątym co do wielkości miastem Francji z liczbą ludności wynoszącą 342 295 osób w granicach administracyjnych. Zespół miejski ma około 1 milion mieszkańców.\r\nNicea leży u podnóża Alp, nad Morzem Śródziemnym, na Lazurowym Wybrzeżu. Wzdłuż wybrzeża ciągnie się Promenada Anglików o długości 7 km. W mieście funkcjonują porty morskie: handlowy, pasażerski i rybacki oraz międzynarodowy port lotniczy Nicea-Lazurowe Wybrzeże (trzeci pod względem liczby pasażerów we Francji). Jest drugim co do wielkości francuskim miastem nad Morzem Śródziemnym.\r\nRozwinięte usługi; przemysł głównie maszynowy, elektrotechniczny i spożywczy (olejarski). Miasto posiada połączenie magistralną linią kolejową i autostradą z Paryżem. W okolicy Nicei rozwinięta uprawa drzew cytrusowych, oliwek, winorośli i kwiatów (plantacje goździków, róż, mimozy).   '),
(10, 12, 'Hotel Medusa Kriopig ', 'Kriopigi', 'Kriopigi', ' Chalkidiki to charakterystyczny, "trójpalczasty" półwysep grecki, który poszczycić się może jednymi z ładniejszych i najczystszych plaż Grecji. Aż 42 plaże tego półwyspu oznaczono "Błękitna Flagą", która jest przyznawana za czystość wody i piasku. Najpopularniejszym z cypli jest Kassandra z pięknymi piaszczystymi plażami, gajami piniowymi i wspaniałymi zatokami. I właśnie tutaj, w miejscowości Kriopigi, znajduje się rodzinny, wybudowany w 2009 roku, hotel Medusa. W Kriopigi, położonym na wzniesieniu,znajdują się sklepy, restauracje i tawerny, które oferują kameralną atmosferę zbliżoną do tej, jaką znajdziemy w tradycyjnych greckich kawiarniach. W miejscowości kursuje pociąg turystyczny, dojeżdzający m.in. do plaży (bilet kosztuje ok. 1 EUR). Około 4 km od Krioipigi znajduje się turystyczna miejscowość Kalithea, gdzie kwitnie życie nocne. Do lotniska w Salonikach jest ok. 90 km.\r\n  '),
(11, 12, 'Saint Tropez hotel ', 'Saint Tropez', 'Saint Tropez', ' Europejski synonim luksusu. Na Saint Tropez przybywają bogaci turyści spragnieni wypoczynku w prestiżowej lokalizacji. Kurort położony jest na słynnym Lazurowym Wybrzeżu i oferuje naprawdę przepiękne widoki.\r\nSaint Tropez stanowiło również miejsce kręcenia wielu filmów. Pamiętacie „Żandarma z Saint Tropez”?   ');

-- --------------------------------------------------------

--
-- Структура таблицы `Tour`
--

CREATE TABLE IF NOT EXISTS `Tour` (
  `id_tour` int(11) NOT NULL,
  `id_kurort` int(11) NOT NULL,
  `count_day` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Tour`
--

INSERT INTO `Tour` (`id_tour`, `id_kurort`, `count_day`, `price`, `name`) VALUES
(1, 1, 5, 5000, 'Barbados lite'),
(2, 2, 5, 3400, 'Australia lite'),
(3, 3, 15, 13400, 'Argentina lite'),
(4, 4, 15, 16800, 'Patagonica'),
(5, 5, 10, 10800, 'Nikazja Cypr');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Country`
--
ALTER TABLE `Country`
  ADD PRIMARY KEY (`id_country`);

--
-- Индексы таблицы `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Индексы таблицы `Deal`
--
ALTER TABLE `Deal`
  ADD PRIMARY KEY (`id_deal`),
  ADD KEY `id_tour` (`id_tour`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `id_employee` (`id_employee`);

--
-- Индексы таблицы `Eployee`
--
ALTER TABLE `Eployee`
  ADD PRIMARY KEY (`id_employee`);

--
-- Индексы таблицы `Kurort`
--
ALTER TABLE `Kurort`
  ADD PRIMARY KEY (`id_kurort`),
  ADD KEY `id_country` (`id_country`);

--
-- Индексы таблицы `Tour`
--
ALTER TABLE `Tour`
  ADD PRIMARY KEY (`id_tour`),
  ADD KEY `id_kurort` (`id_kurort`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Country`
--
ALTER TABLE `Country`
  MODIFY `id_country` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT для таблицы `Customer`
--
ALTER TABLE `Customer`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `Deal`
--
ALTER TABLE `Deal`
  MODIFY `id_deal` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `Eployee`
--
ALTER TABLE `Eployee`
  MODIFY `id_employee` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `Kurort`
--
ALTER TABLE `Kurort`
  MODIFY `id_kurort` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT для таблицы `Tour`
--
ALTER TABLE `Tour`
  MODIFY `id_tour` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Deal`
--
ALTER TABLE `Deal`
  ADD CONSTRAINT `deal_ibfk_1` FOREIGN KEY (`id_tour`) REFERENCES `Tour` (`id_tour`),
  ADD CONSTRAINT `deal_ibfk_2` FOREIGN KEY (`id_customer`) REFERENCES `Customer` (`id_customer`),
  ADD CONSTRAINT `deal_ibfk_3` FOREIGN KEY (`id_employee`) REFERENCES `Eployee` (`id_employee`);

--
-- Ограничения внешнего ключа таблицы `Kurort`
--
ALTER TABLE `Kurort`
  ADD CONSTRAINT `kurort_ibfk_1` FOREIGN KEY (`id_country`) REFERENCES `Country` (`id_country`);

--
-- Ограничения внешнего ключа таблицы `Tour`
--
ALTER TABLE `Tour`
  ADD CONSTRAINT `tour_ibfk_1` FOREIGN KEY (`id_kurort`) REFERENCES `Kurort` (`id_kurort`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

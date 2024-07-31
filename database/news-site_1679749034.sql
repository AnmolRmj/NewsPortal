-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2023 at 07:24 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `news-site`
--

-- --------------------------------------------------------

--
-- Table structure for table `advertisments`
--

CREATE TABLE `advertisments` (
  `ads_id` int(11) NOT NULL,
  `ads_name` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `advertisments`
--

INSERT INTO `advertisments` (`ads_id`, `ads_name`, `image`) VALUES
(6, 'tata', '1679582127-tata moters.jpg'),
(7, 'jcb', '1679583970-jcb.jpg'),
(8, 'cite', '1679724862-cite.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `post` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `post`) VALUES
(34, 'Sports', 2),
(31, 'Entertainment', 4),
(32, 'Politics', 6),
(33, 'Health', 2),
(42, 'International', 4),
(40, 'National', 4);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `comments` text NOT NULL,
  `post_id` int(11) NOT NULL,
  `comment_date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `comments`, `post_id`, `comment_date`) VALUES
(1, 'Nice comment', 79, '22 Mar, 2023'),
(2, 'comment testing', 78, '22 Mar, 2023'),
(3, 'this is the testing data', 78, '22 Mar, 2023'),
(4, 'good news', 79, '23 Mar, 2023'),
(5, 'Nice game', 85, '23 Mar, 2023'),
(6, 'sit what\'s this', 91, '24 Mar, 2023'),
(7, 'good', 91, '24 Mar, 2023 19:26'),
(8, 'bhayo?', 91, '25 Mar, 2023 00:16'),
(9, 'good news', 92, '25 Mar, 2023 00:25');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `post_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `category` varchar(100) NOT NULL,
  `post_date` varchar(50) NOT NULL,
  `author` int(11) NOT NULL,
  `post_img` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`post_id`, `title`, `description`, `category`, `post_date`, `author`, `post_img`) VALUES
(79, '  VISUAL STORIES Coalition partners’ student wings protest against MCC', 'Tension ran high in New Baneshwor in front of the Parliament building on Friday as demonstrators protesting an American grant burned tires and clashed with police.\r\nStudent wings of the Communist Party of Nepal (Maoist Centre) and CPN (Unified Socialist)—the two coalition partners in the Deuba government—protested against the Millennium Challenge Corporation-Nepal Compact as Parliament convened its meeting.\r\n\r\nProtesters and police clashed as the demonstrators tried to breach the police barricade to enter the prohibited zone.\r\n\r\nPolice fired tear gas shells to disperse the protesters.\r\n\r\nIn recent months, the $500 million US grant has become a divisive issue, with many questioning the American intent for providing it to Nepal and the need for the parliamentary ratification of the programmes.', '40', '05 Mar, 2022', 39, '1646491300-2739279424713086478108424771028364887007732n-1645172741.jpg'),
(83, 'project ', 'defence', '36', '06 Mar, 2022', 39, '1646554476-1580696078-business.jpg'),
(77, 'Manang ends up with the  title', 'the defending champions has successflly defend the title again. Despite having multiple key players got injured in the beginning of the season Manang still managed to defend the title. Manang beat down Tribhuvan army to tii-breaker. ', '34', '05 Mar, 2022', 39, '1646490060-mmc.jpg'),
(78, 'Russia Invades territory of Ukraine', 'The war has just began between the two neighboring countries of the Europe. the one is Russia and another one is Ukraine. Russia invades some areas of the Ukraine and is under control. In the maps some places totally under control after Russian attack. Remember Russia is considered as the most powerful country in nuclear power.', '42', '05 Mar, 2022', 39, '1646490588-_123536953_ukraine_invasion_south_map_2x640.jpg'),
(76, 'Russia-Ukraine live news: Partial evacuations on hold', 'Ukraine accuses Russian forces of breaking temporary ceasefire; Moscow blames Ukrainian ‘nationalists’ of preventing civilians from leaving.\r\nRussian forces declare a ceasefire to allow humanitarian corridors out of the Ukrainian cities of Mariupol and Volnovakha.\r\nBut in Mariupol, local officials say the evacuation has been put in hold, accusing Russian forces of ceasefire violations. Russia’s defence ministry accuses Ukrainian “nationalists” of preventing civilians from leaving.\r\nMultiple news outlets say they will pause their work inside Russia, citing a new law that could mean jail for those found to be intentionally spreading “fake” news.\r\nRussia says it is blocking Facebook and restricting access to Twitter, citing restrictions on Russian media.\r\n', '42', '05 Mar, 2022', 44, '1646489862-ukraine.jpg'),
(75, 'NASA Mars Perseverance Rover Has a Rock Hitchhiking in One of Its Wheels', 'If you\'ve ever gotten a pebble stuck in your shoe, you\'ll have sympathy for NASA\'s Perseverance rover. The rolling Mars explorer picked up a rock in one of its wheels, and it has stuck around for some time. The rock isn\'t a boulder, but it\'s not a tiny pebble, either.\r\n\r\nSpace fans have noticed the rock. The public voted a shot from Feb. 25 as Perseverance\'s \"Image of the Week\" for last week. The most recent view of the hitchhiker is from March 2. \r\nNASA posts the rover\'s raw images on a rolling basis. In looking back through the archives, I found the rock appeared in the vehicle\'s hazard avoidance camera images at least as far back as Feb. 6, though I didn\'t do an exhaustive historical survey.\r\n\r\nSince Perseverance seems to have adopted a pet rock, I reached out to NASA to see if anyone has given it a nickname yet. If not, I would suggest \"Rocco\" would be a good one.\r\n\r\n', '42', '05 Mar, 2022', 45, '1646489478-nasa.jpg'),
(45, 'Russia says it won\'t start a war as Ukraine tensions mount', 'MOSCOW, JANUARY 28Russia\'s top diplomat said Friday that Moscow will not start a war in Ukraine but warned that it wouldn\'t allow the West to trample on its security interests, amid fears it is planning to invade its neighbor. US President Joe Biden warned Ukraine\'s leader a day earlier that there is a \"distinct possibility\" that Russia could take military action against the former Soviet state in February. \"There won\'t be a war as far as it depends on the Russian Federation, we don\'t want a war,\" Foreign Minister Sergey Lavrov said in a live interview with Russian radio stations. \"But we won\'t let our interests be rudely trampled on and ignored.\" Tensions have soared in recent weeks, and the United States and its NATO allies warily eyed a buildup of more than 100,000 Russian troops near Ukraine, worrying that Moscow was preparing to attack. Russia has repeatedly denied having any such plans, but has demanded that NATO promise Ukraine will never be allowed to join and that the alliance roll back deployments of troops and military equipment in Eastern Europe. The US and NATO formally rejected those demands this week, though Washington outlined areas where discussions are possible, offering hope that there could be a way to avoid war. Russia\'s official response to those proposals will come from President Vladimir Putin, but the Kremlin has said there was \"little ground for optimism.\" Lavrov echoed noted that grim note Friday. \"While they say they won\'t change their positions, we won\'t change ours,\" he said. \"I don\'t see any room for compromise here.\" Putin opened the weekly meeting of his Security Council on Friday, saying only that it would address foreign policy issues. Kremlin spokesman Dmitry Peskov said that the Russian leader may also discuss his reaction to the U.S. rejection with French President Emmanuel Macron during their video call the same day. Lavrov noted that the US suggested the two sides could talk about limits on the deployment of intermediate-range missiles, restrictions on military drills and rules to prevent accidents between warships and aircraft. He said that Russia proposed discussing those issues years ago - but Washington and its allies never took them up on it until now. While he described the US offers as reasonable, he emphasized that Russia\'s main concerns are to stop both NATO\'s expansion and the deployment of the alliance weapons near Russia\'s borders. He noted that international agreements say that the security of one nation must not come at the expense of others\' - and that he would send letters to ask his Western counterparts to address that obligation. \"It will be hard for them to wiggle out from answering why they aren\'t fulfilling the obligations sealed by their leaders not to strengthen their security at the expense of others,\" he said. As tensions build, Washington warned Moscow of devastating sanctions if it invades Ukraine, including penalties targeting top Russian officials and key economic sectors. Several senior US officials also said Thursday that Germany would not allow a newly constructed pipeline - which is meant to bring gas directly from Russia - to begin operations if Russia invades Ukraine. Asked about possible sanctions, Lavrov said that Moscow had warned Washington that their introduction would amount to a complete severing of ties. While Moscow and the West are mulling their next steps, NATO said it was bolstering its deterrence in the Baltic Sea region, and the US ordered 8,500 troops on higher alert for potential deployment to Europe. Russia has launched a series of military drills involving motorized infantry and artillery units in southwestern Russia, warplanes in Kaliningrad on the Baltic Sea, and dozens of warships in the Black Sea and the Arctic. Russian troops have also headed to Belarus for sweeping joint drills, raising Western fears that Moscow could stage an attack on Ukraine from the north. The Ukrainian capital is just 75 kilometers (50 miles) from the border with Belarus. Despite the alarming rhetoric, Ukrainian officials have repeatedly tried to project calm. Ukraine\'s Defense Minister Oleksii Reznikov told parliament Friday that the total number of Russian troops near Ukraine - about 130,000 - is comparable to Moscow\'s military buildup in the spring of 2021, when Moscow eventually pulled its forces back after massive military exercises. \"We haven\'t observed any events or actions of military character that significantly differ from what was going on last spring,\" with the exception of the deployment to Belarus, Reznikov said. But that has so far not reassured many in the West. Biden warned Ukrainian President Volodymyr Zelenskyy in Thursday\'s call that the U.S. believed there was a high degree of likelihood that Russia could invade when the ground freezes and Russian forces could attack Ukrainian territory from north of Kyiv, according to two people familiar with the conversation who were not authorized to comment publicly. While concerns rise about an invasion, Ukraine is already beset by conflict. Following the 2014 ouster of a Kremlin-friendly president in Kyiv, Moscow annexed Ukraine\'s Crimean Peninsula and backed an insurgency in the country\'s eastern industrial heartland. Fighting between Ukrainian forces and Russia-backed rebels has killed over 14,000 people, and efforts to reach a settlement have stalled.', '32', '29 Jan, 2022', 39, '1643425804-1.jpg'),
(46, 'Spider-Man’ To Top Box Office For 5th Weekend As No Wide Releases Open', '                    Until just a few weeks ago, Spider-Man: No Way Home was set to face Spidey nemesis Morbius at the box office this weekend. Sony decided to push its “SSU” (Sony’s Spider-Man Universe) film starring Jared Leto back to April, and nothing has come to fill the vacated slot. Without any new wide releases, the webslinger will have yet another weekend where it rules the box office. After reclaiming the top spot from Scream last weekend, the MCU film is set to have its fifth number one weekend, a feat only a few films in recent decades have achieved.\r\n\r\nIf Spider-Man continues with its 30-40% drops, it will fall below $10 million in a weekend for the first time, and on Monday it fell below $1 million in a day for the first time. Of course, this is nothing to fret about for the fourth top domestic grosser ever, currently at $723 million. It will continue to inch closer toAvatar’s $760 million cume, and in the coming weeks we will see whether it has enough gas left in it to hurdle past that milestone to become the third biggest film of all time. It may get there slowly but surely, just as SSU film Venom: Let There Be Carnage passed the first Venom’s $213.5 million gross on Tuesday, the 117th day of its release.\r\n\r\nDespite No Way Home’s still impressive numbers, last weekend’s overall box office ($45.7 million) was the third lowest since last May before the summer blockbuster season started with Cruella and A Quiet Place Part II. This weekend could end up with the lowest overall box office since then if it falls below September 24-26’s $38.8 million overall gross, and it may even end up as the lowest grossing weekend of the year.\r\n\r\nScream should end up in second place again, and we shall see if it holds pace with the successful sequels Scream 2 and Scream 3. It is currently less than 10% behind both films when looking at their cumes after weekend two, and it is already around 40% ahead of the disappointing fourth installment’s final gross.\r\n\r\nNotable among the new limited releases is Sony Pictures Classics Compartment Number 6, which shared the Grand Prix award at Cannes last year. The acclaimed film (88% on Rotten Tomatoes) from director Juho Kuosmanen (The Happiest Day in the Life of Olli Mäki) is in Russian and Finnish and takes place largely on a train, telling the story of a Finnish student who bonds with the Russian miner she is sharing a sleeping compartment with. Compartment No. 6 is Finland’s Oscar entry and it has made the short list to become a potential nominee.\r\n\r\nAlso releasing in limited is Clean from IFC. Adrien Brody stars and Paul Solet directs. Solet wrote the script with Brody, who is making his screenwriting debut in this crime tale of a garbage man with a dark past. Reviews thus far are mostly negative (38% on Rotten Tomatoes). Better reviewed are Charli XCX: Alone Together (92% on Rotten Tomatoes), the documentary from Greenwich about the pop star, and Sundown (73% on Rotten Tomatoes), the drama from Bleecker Street starring Tim Roth and Charlotte Gainsbourg and directed by Mexican auteur Michel Franco.\r\n\r\nWhile uncertainty remains about both the box office and the pandemic, January will likely go down as one of the year’s lowest grossing months, if not the lowest grossing month. Between the Omicron wave, only a single significant new release, and all December releases other than Spider-Man and Sing 2 running out of steam before the new year, January hardly stood a chance. However, February is looking brighter, and 2022’s box office should finally get under way as the next month sees the releases of Jackass Forever, Moonfall, Marry Me, Death on the Nile, Dog, Uncharted, and Cyrano, among others. The box office fate of these titles is unknown, but the consistent slate of promising wide releases should push us well beyond the doldrums of January and ferry us to The Batman, which awaits in March, with a blockbuster packed summer to follow.                ', '31', '29 Jan, 2022', 39, '1643426558-spiderman.jpg'),
(93, 'CITE college', 'College of Information. Technology and Engineering.\r\n\r\nTinkune,Kathmandu', '31', '24 Mar, 2023', 53, '1679683481-cite.jpg'),
(56, 'kailash', 'katrina ', '40', '03 Mar, 2022', 39, '1646326847-1641718672-1580696078-business.jpg'),
(74, 'What Will Germany\'s Biggest Military Since World War II Look Like? No One Knows', 'Wenden is a perfectly ordinary German word. You can use it to say you want to flip a pancake, turn to a friend, tighten a screw, round a corner, consult an authority, or appeal to the public. But when Germans say die Wende, they mean only one thing: the collapse of the Soviet Union, including the fall of the Berlin Wall and the reunification of Germany. Chancellor Olaf Scholz could hardly have chosen a more heavily laden word to describe the changes wrought by the Russian invasion of Ukraine than Zeitenwende. For Germans, the idea that the events of the last week constitute a Wende necessarily implies a reversal of the wave of democratization and commercialization that swept across Europe in the late 80s and early 90s.\r\nScholz needed a big word to justify the big spending package he was announcing—a 100 billion Euro one-time subsidy intended to bring the German military up to speed, followed by a proposed increase of military funding to amount to 2% of Germany’s gross domestic product by 2024. The spending represents a new era for the Bundeswehr, which has been kept deliberately small since the Second World War. The news—which sent the stocks of defense contractors sky-rocketing—fundamentally changes the nature of the German military. “My goal, our goal is to have one of the most powerful militaries in Europe,” Finance Minister Christian Lindner told the ARD Morgenmagazin. According to reporting by Die Welt, the Bundeswehr will replace the outdated Tornado strike aircraft, potentially with American F-35s, while continuing to develop the costly Eurofighter. They’ll be new transport helicopters to replace the aging CH-53s, most likely American Chinooks or CH-53Ks. Germany’s Puma tanks will likely be retrofitted in advance of the deployment of a “supertank,” and the navy will build two new submarines in a joint venture with Norway.\r\n', '42', '05 Mar, 2022', 39, '1646489337-ukraine.jpg'),
(67, 'War in Ukraine: Families run for cover as Russian air strikes hit Chernihiv', 'Russia escalated its air campaign against Ukraine on Thursday and Friday, killing dozens of civilians in the northern city of Chernihiv and continuing to lay siege to residential areas elsewhere.\r\n\r\nAt least 47 people died in Chernihiv, according to Ukrainian emergency services, after aerial attacks damaged high-rise apartments buildings, clinics and a hospital and sent residents fleeing into the streets and to underground bunkers.\r\n\r\n\"We can hear the sounds right now of air strikes nearby,\" said Svitlana, 40, who was hiding on Friday morning under her dining table with her two children, aged six and three, and her neighbours in a five-floor apartment building. An apartment building 500m away was destroyed on Thursday, she said.\r\n\r\n\"There are no military targets here, there is only a cemetery, residential buildings, clinics and a hospital, why are they bombing us?\" Svitlana said.\r\n\r\nSvitlana\'s apartment sits just 50m from a children\'s hospital which treats cancer patients. She said children from the oncology ward had been taken to a shelter between the two buildings, but medical staff were not able to create a sterile environment there and were struggling to find a way to evacuate the children.\r\n\r\nReached on Friday morning, Sergey Zosimenko, a charity worker supporting the hospital, told the BBC that the staff were in the process of attempting an evacuation.', '32', '04 Mar, 2022', 39, '1646402618-ukraine.jpg'),
(72, 'Highest glacier on Mt Everest is melting at a rapid pace, a new study shows  https://tkpo.st/3osglj6', 'The rate at which the glacier is thinning is blamed on climate change and it’s a cause for concern for countries relying on Himalayas for water, irrigation and hydropower.\r\nHuman-induced climate change is causing the highest glacier on Mt Everest to melt at a rapid pace which may lead the South Col Glacier to be completely wiped out by the middle of the current century, a new study has found.\r\nThe study, published in Nature Portfolio Journal Climate and Atmospheric Science, revealed that the South Col Glacier, which sits around 7,906m (25,938 ft) above sea level, has lost as much as 55m of thickness in the last 25 years.\r\n\r\nIt is thinning over 80 times faster than the 2,000 years it took to form the ice, according to the study conducted by researchers led by the US-based University of Maine.\r\n\r\nA team of scientists and climbers, including six from the University of Maine, visited the glacier in 2019 and extracted samples from a 10-metre-long (around 32 feet) ice core. They also installed the world\'s two highest automatic weather stations to collect data and answer a question whether the earth\'s most out-of-reach glaciers were impacted by human-linked climate change.\r\n\r\n“The answer is a resounding yes, and very significantly since the late 1990s,” Paul Mayewski, the expedition leader and the director of the Climate Change Institute at the University of Maine, told CNN.\r\n\r\nResearchers noted that the glacier\'s thick snowpack has been eroded, exposing the underlying black ice to the sun and accelerating the melting process. This transformation from snowpack to ice means the glacier can no longer reflect radiation from the sun, making it melt more rapidly.\r\n\r\nAccording to the study, the transition from a permanent snow/firn surface to majority ice-cover could have been triggered by climate change since 1950, with sublimation enhanced by rising air temperatures playing the critical role. “But the ice loss has been most intense since the late 1990s,” the report states.\r\n\r\n“At an estimated thinning rate approaching 2,000 mm (2m) annually, even glaciers such as South Col Glacier that are above 8,000m may disappear by mid-century.”\r\n\r\nThe finding of the new study is consistent with the conclusion of a team of French researchers who found that the world\'s glaciers are melting at an accelerating rate.\r\n\r\nAccording to a BBC report, researchers found glaciers to have lost almost 270 billion tonnes of ice a year over the opening two decades of the 21st Century. The meltwater produced now accounts for about a fifth of global sea-level rise, the scientists told Nature journal.\r\n\r\nThe worldwide retreat of mountain glaciers in recent decades is well documented and this study has further reinforced the impact of climate change on the Himalayan mountains, according to the experts.\r\n\r\n“The findings of the new study show there has been a massive impact of climate change in our Himalayas,” said Manjit Dhakal, a climate change expert. “We can generalise that the glaciers in other Himalayan mountains are also depleting fast.”\r\n\r\nA study published in Nature in August 2020 showed that glacial lakes are rapidly growing in response to climate change and glacier retreat. The global glacier lake volume increased by around 48 percent to 156.5?km, between 1990 and 2018, according to the study.\r\n\r\nAs the glaciers in the Hindu Kush Himalaya Region are melting fast, the trend will continue in the days to come, according to a study released in February 2019. The Hindu Kush Himalaya region runs from Afghanistan to Myanmar and is the planet’s “third pole.”\r\n\r\n“Even if carbon emissions are dramatically and rapidly cut and succeed in limiting global warming to 1.5 degrees Celsius, 36 percent of the glaciers along the Hindu Kush and Himalaya range will have gone by 2100,” says a study report of International Centre for Integrated Mountain Development tilted “The Hindu Kush Himalaya Assessment”. “If emissions are not cut, the loss soars to two-thirds,\" the report found.\r\n\r\nIf the global temperature rise is 2 degrees Celsius, half of the glaciers are projected to melt away by 2100, according to the report.\r\n\r\nClimbers have already seen the visible impact of retreating snowpacks in Nepal\'s Himalayan mountains.\r\n\r\n“Nowadays we observe more rocks in the Himalayan mountains and rock falls instead of snow falling down,” said Kami Rita Sherpa, a mountain guide who broke his own record by climbing the world\'s tallest mountain for the 25th time in May last year.\r\n\r\nHe said that growing portions of rocks in the mountain could affect the future expeditions to the mountain because the climbers could face more exposed bedrock and ice cover, making it difficult to climb the Himalayan mountains.', '40', '05 Mar, 2022', 45, '1646488742-everest.jpg'),
(70, 'Nepal Launches Nurturing Excellence in Higher Education Program!', 'With an aim to improve higher education in the country, the Nepali Government launched Nurturing Excellence in Higher Education Program (NEHEP).\r\n\r\nThe government launched the NEHEP program with a budget of USD 60 million, with the support of the World Bank.\r\n\r\nThe University Grants Commission, Ministry of Education, Science and Technology, and the World Bank jointly launched the five-year program.\r\n\r\n ', '36', '05 Mar, 2022', 44, '1646488359-education.jpg'),
(71, 'Keanu Reeves Felt That Lana Wachowski Made Fun of ‘The Matrix’ With ‘Matrix Resurrections’', 'Recently, Keanu Reeves and Carrie-Anne Moss reprised their roles as Neo and Trinity respectively in Matrix Resurrections. The film didn’t garner the same amount of critical acclaim as the original Matrix. However, the cast and crew were still proud of what they were able to achieve. Reeves, in particular, felt the Matrix Resurrections might have been making fun of The Matrix. But in a good way.', '31', '05 Mar, 2022', 44, '1646488449-matrix.jpg'),
(73, 'Outrage in Nepal over India\'s plan to widen the road to Lipulekh', 'NEW DELHI: The proposal for widening of the road to the Lipulekh Pass area in Uttarakhand has led to another round of outrage in Nepal with both Opposition and parties in the ruling coalition asking India to not undermine Nepal\'s sovereignty and territorial integrity. Nepal claims Lipulekh, Limpiyadhura and Kalapani area near the tri-junction with China as its own and issued a new political map earlier to justify its claim.\r\nWhile the Nepal coalition government has so far remained silent on remarks by PM Narendra Modi last month on expansion of the road, the main ruling party, Nepali Congress, said in a statement Friday that India\'s decision to further expand the road was objectionable. It also called upon India to immediately recall its troops from the area.\r\n', '32', '05 Mar, 2022', 45, '1646488850-1642410092-lipulekh.jpg'),
(84, 'Govt giving Rs 200,000 to each ‘disqualified’ Maoist fighter as relief', 'Kathmandu, March 22\r\n\r\nThe government is preparing to give Rs 200,000 to each of the Maoist fighters who were certified as ‘disqualified’ for army integration as a part of the peace process.\r\n\r\nA cabinet meeting held on Monday made a decision in this regard, and the Ministry of Home Affairs is preparing to formulate a standard operating procedure for that, informs Home Secretary Binod Prasad Singh.\r\n\r\nThe move comes at a time when the government is under fire for failing to take the transitional justice process forward.\r\n\r\nAs per the Comprehensive Peace Accord, 2006, a UN mission, popularly known as UNMIN, was called to facilitate the army integration process. The UN mission had disqualified 4,009 of the 19,602 Maoist fighters for integration into the Nepal Army.\r\n\r\nOf the qualified fighters, around 1,400 joined the national army organisation whereas the rest went for a voluntary exit scheme. Those choosing the exit were also given money as a relief.', '32', '23 Mar, 2023', 39, '1679579779-sports.jpg'),
(85, 'Nepal beats UAE by 9 runs', 'Kathmandu, 23 March\r\n\r\nIn WCL 2 Nepal beats UAE by 9 runs and place to world cup qualifier\r\n\r\n\r\n\r\n\r\nbjkhaskjcdjskacfjkshefkclsklfcnkslk\r\n\r\nsndkncslknlkcsnkl\r\ns,dnnkncklsdnkcskl\r\nsndb cjksbckjsbkjcbsjk\r\n', '34', '23 Mar, 2023', 53, '1679580329-cricket.jpg'),
(86, 'Nepal Band', 'bjkcsajkdhdcjkahbdkjhbajkdcbkcbjk\r\nkcsebkjdcbsjdckj\r\nkcsknkjnckesnck\r\njksnkjdcskjncklncdskncksndckhsklchklshkdclklwhhsdkl\r\n\r\n\r\n      hfiehwihfdilehcdlkshdcxkshxkhsakxh\r\nbjckdsbckjbsdkcnkldsncklsdnclms.mcldsmnclksd', '33', '23 Mar, 2023', 53, '1679583752-digital marketing.png'),
(87, 'Govt giving Rs 200,000 to each ‘disqualified’ Maoist fighter', 'Kathmandu, March 22\r\n\r\nThe government is preparing to give Rs 200,000 to each of the Maoist fighters who were certified as ‘disqualified’ for army integration as a part of the peace process.\r\n\r\nA cabinet meeting held on Monday made a decision in this regard, and the Ministry of Home Affairs is preparing to formulate a standard operating procedure for that, informs Home Secretary Binod Prasad Singh.\r\n\r\nThe move comes at a time when the government is under fire for failing to take the transitional justice process forward.', '32', '23 Mar, 2023', 53, '1679583871-tata moters.jpg'),
(88, 'Rahul is passed the BE computer', 'Tinkune 24 March 2023\r\n\r\nbkjcbjdksckldsncksdnvkdnvknsdkvnsdlnvlsdnvk kbsdkhvklshncls khlkshvkhsdl khklhklkhvkfdslhvlkdsjvlkjds.\r\n\r\nbcjkdsbgckshbcklshcklshcklcnjklsjnck hklcshkhck khlkschlkch mhlkschlkhckslhclkslcjhslkchklsdnlnclskjcondkjhioc jhckshcijosd;jc;\r\nbcsjdkbckjsnd.\r\n\r\n3.njckdbcjkdsbcklnckj jhcdskjclksncklnlsdnsl', '31', '24 Mar, 2023', 53, '1679671922-sports.jpg'),
(92, '29,164,578: Nepal population as per the 2021 census', 'Kathmandu, March 24\r\n\r\nAfter months of delay, the government of Nepal on Friday published the full and final report of the Nepal population census 2021, according to which 29,164,578 is the official population size of Nepal.\r\n\r\nLast year, a preliminary report was launched, which had put the figure as 29,192,480  But, the final report shows 27,902 fewer people than the previous record.\r\n\r\nPrime Minister Pushpa Kamal Dahal made the report public amid a function organised by the National Statistics Office, the successor of the erstwhile Central Bureau of Statistics (CBS), this morning.\r\n\r\nAs per the report, the annual population growth rate of the country is 0,92 per cent whereas the population density per square km is 198\r\n\r\nFor the first time in Nepal’s history, the Nepal population census 2021 has counted people belonging to other gender groups except for males and females. The report says there are 2,928 people in other sexual groups.\r\n\r\nBut, in calculating the sex ratio, this figure does not exist. The report says there are 14,253,551 males (48,98 per cent) and 14,911,027 males (51,02 per cent). The ratio between the two sexes is 1000.', '40', '24 Mar, 2023', 54, '1679683155-national-population-census.jpg'),
(91, 'Gandhi sentenced to jail for Modi \'thieves\' remark', 'India\'s parliament has disqualified senior opposition leader Rahul Gandhi, a day after he was sentenced to two years in prison in a defamation case.\r\n\r\nA parliament notice said that Mr Gandhi \"stands disqualified from the membership of Lok Sabha\", alluding to the lower house of parliament.\r\n\r\nHe was convicted by the court for 2019 comments about PM Narendra Modi\'s surname at a election rally.\r\n\r\nMr Gandhi was a Congress party MP from Wayanad in the state of Kerala.\r\n\r\nHe remains on bail for 30 days and has said he will appeal the verdict given by a court in Gujarat state.\r\n\r\nMr Gandhi\'s party had termed the verdict \"erroneous and unsustainable\" and pledged to fight the disqualification \"both legally and politically\".', '32', '24 Mar, 2023', 53, '1679681831-news.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `websitename` varchar(60) NOT NULL,
  `logo` varchar(50) NOT NULL,
  `footerdesc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `websitename`, `logo`, `footerdesc`) VALUES
(1, 'Online News Portal', 'news.jpg', '© Copyright 2023 News | Powered by <a href=\"https://www.onlinenewsportal.net\">Online News Portal</a>');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `role` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `username`, `password`, `role`) VALUES
(44, 'Shailendra ', 'Karki', 'shailendra', 'a1b086247defee88e1ee49b399d9fa11', 0),
(54, 'Surya', 'Malla', 'surya', 'aff8fbcbf1363cd7edc85a1e11391173', 0),
(46, 'Roshan ', 'Singh', 'roshan', 'd6dfb33a2052663df81c35e5496b3b1b', 2),
(39, 'anmol', 'anmol', 'anmol', '6b974b8d0a6b6053d93553eb5e09ca57', 1),
(53, 'Deb Kant', 'Chaudhary', 'admin', '21232f297a57a5a743894a0e4a801fc3', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advertisments`
--
ALTER TABLE `advertisments`
  ADD PRIMARY KEY (`ads_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`post_id`),
  ADD UNIQUE KEY `post_id` (`post_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advertisments`
--
ALTER TABLE `advertisments`
  MODIFY `ads_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

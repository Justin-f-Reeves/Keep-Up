DROP DATABASE IF EXISTS keep_up_seeds;
CREATE DATABASE keep_up_seeds;
USE keep_up_seeds; 

CREATE TABLE users (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    hashed_pw VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE authors (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL
);

CREATE TABLE journals (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    j_name VARCHAR(255) UNIQUE NOT NULL,
    ranking INTEGER NOT NULL,
    hindex INTEGER NOT NULL,
    field VARCHAR(255) NOT NULL
);

CREATE TABLE papers (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    pub_date DATE NOT NULL,
    journal_id INTEGER NOT NULL,
    src_url VARCHAR(255) NOT NULL,
    abstract VARCHAR(3000) NOT NULL,
    sum_sentence VARCHAR(1500) NOT NULL,
    FOREIGN KEY(journal_id) REFERENCES journals(id)
);

CREATE TABLE paper_authors (
    paper_id INTEGER NOT NULL,
    author_id INTEGER NOT NULL,
    FOREIGN KEY(author_id) REFERENCES authors(id),
    FOREIGN KEY(paper_id) REFERENCES papers(id),
    PRIMARY KEY(paper_id, author_id)
);

CREATE TABLE keywords (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    keyword_name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE paper_keywords (
    keyword_id INTEGER NOT NULL,
    paper_id INTEGER NOT NULL,
    FOREIGN KEY(keyword_id) REFERENCES keywords(id),
    FOREIGN KEY(paper_id) REFERENCES papers(id),
    PRIMARY KEY(paper_id, keyword_id)
);

INSERT INTO authors(first_name, last_name) VALUES (
    'Abraham', 'Singer'),
    ('Emiel', 'Awad'), 
    ('Clement', 'Minaudier'),
    ('Matias', 'Iaryczower'),
    ('Gabriel', 'Lopez-Moctezuma'), 
    ('Adam', 'Meirowitz'),
    ('Jessica', 'Gottlieb'), 
    ('Amanda', 'Kennard'),
    ('MICHAEL', 'GIBILISCO'),
    ('JESSICA', 'STEINBERG'), 
    ('KILLIAN', 'CLARKE'),
    ('WENDY', 'PEARLMAN'), 
    ('CHRISTOPHER', 'WRATIL'),
    ('JENS', 'WÄCKERLE'),
    ('SVEN-OLIVER', 'PROKSCH'), 
    ('JANE', 'ESBERG'),
    ('ALEXANDRA', 'SIEGEL'), 
    ('JAMES', 'BISBEE'),
    ('UGUR', 'AYTAC'), 
    ('ENZO', 'ROSSI'),
    ('DAVID', 'MILLER'
);

INSERT INTO journals(j_name, ranking, hindex, field) VALUES (
    'American Journal of Political Science', 1, 69, 'Political Science'),
    ('American Political Science Review', 2, 68, 'Political Science'
);

INSERT INTO papers(title, pub_date, journal_id, src_url, abstract, sum_sentence) VALUES (
    'Can the Unfree Be Held Morally Responsible? A Douglassonian Conception of Freedom and Distributed Moral Agency',
    '2022-12-19',
    1,
    'https://onlinelibrary.wiley.com/doi/full/10.1111/ajps.12760', 
    "Can those dominated and oppressed by racialized power structures be held responsible for their actions? On some plausible accounts of moral responsibility, the answer is “no”: domination exempts the oppressed from moral obligations because they are structurally deprived of the freedom to make choices for which one might be blameworthy. In this article, I use the work of Frederick Douglass to offer a different understanding of moral responsibility. Attending to specific arguments that Douglass makes regarding the moral responsibility of slaves, and the tensions it raises with other parts of his corpus, I argue that one's ability to act as a moral agent is deeply tied to the environmental resources at their disposal. Drawing on distributed theories of cognition, I offer a Douglassonian conception of “distributed moral agency,” contending that Douglass's writings draw our attention to various environmental factors that can scaffold moral responsibility, even among the enslaved.",
    "This article argues that an individual's ability to act as a moral agent is dependent on the environmental resources available to them and proposes a 'Douglassonian' conception of distributed moral agency based on the work of Frederick Douglass, which suggests that certain environmental factors can support moral responsibility in those who are oppressed and dominated by racialized power structures."),
    ('Friendly Lobbying under Time Pressure',
    '2022-12-16',
    1,
    'https://onlinelibrary.wiley.com/doi/full/10.1111/ajps.12754', 
    "Lobbyists often target legislators who are aligned with them rather than opponents. The choice of whom to lobby affects both what information becomes available to legislators and how much influence special interest groups exert on policies. However, the conditions under which aligned legislators are targeted are not well understood. We investigate how the pressure to conclude policies quickly affects the strategic decision of whom to lobby. We derive conditions on the cost of delaying policies and on the distribution of legislators' preferences for lobbyists to prefer targeting allies. We show that the use of allied intermediaries has important implications for the duration of policymaking and the quality of policies. Counterintuitively, an increase in time pressure can increase the duration of policymaking and a longer duration does not always lead to better informed policies.",
    "This article investigates how the pressure to quickly conclude policies affects lobbyists' strategic decision of whom to target for lobbying efforts and analyzes the effects of using allied intermediaries on the duration of policymaking and the quality of policies, finding that an increase in time pressure can unexpectedly increase the duration of policymaking and that a longer duration does not always result in better informed policies."),
    ('Career Concerns and the Dynamics of Electoral Accountability',
    '2022-11-09',
    1, 
    'https://onlinelibrary.wiley.com/doi/full/10.1111/ajps.12740', 
    "Quantifying the value that legislators give to reelection relative to policy is crucial to understanding electoral accountability. We estimate the preferences for office and policy of members of the U.S. Senate, using a structural approach that exploits variation in polls, position-taking, and advertising throughout the electoral cycle. We then combine these preference estimates with estimates of the electoral effectiveness of policy moderation and political advertising to quantify electoral accountability in competitive and uncompetitive elections. We find that senators differ markedly in the value they give to securing office relative to policy gains: While over a fourth of senators are highly ideological, a sizable number of senators are willing to make relatively large policy concessions to attain electoral gains. Nevertheless, electoral accountability is only moderate on average, due to the relatively low impact of changes in senators' policy stance on voter support.",
    "Understanding legislators' preferences for reelection and policy is crucial for quantifying electoral accountability, which can vary significantly among senators, with some willing to make policy concessions for electoral gains and others highly ideological, but is generally only moderate due to the relatively low impact of changes in senators' policy stance on voter support."),
    ('How Economic Informality Constrains Demand for Programmatic Policy',
    '2022-11-9',
    1, 
    'https://onlinelibrary.wiley.com/doi/full/10.1111/ajps.12746', 
    "The majority of economic actors in the developing world participate in the informal sector, and yet little is known about the political implications of this constituency. I argue that, particularly in weak-state democracies, economic informality constrains the rise of programmatic politics. An uncertain, undocumented, and irregular economic relationship with the state conveys signals about the state that affect citizens’ demand for and ability to coordinate on programmatic policy. Novel survey evidence from urban Senegal illustrates that greater irregularity is associated with weaker perceptions of tax compliance, lower expectations of government, and weaker coordination capacity and that informality is associated with weaker programmatic demands. Experimentally providing information about a salutary fiscal policy causes some informal sector members to positively update expectations about government performance and electoral coordination capacity. Field experiments in two other African democracies increase confidence in the proposition that informality inhibits the formation of a constituency for programmatic politics.",
    "Economic informality in the developing world can have political implications, particularly in weak-state democracies, by constraining the rise of programmatic politics through uncertain, undocumented, and irregular economic relationships with the state, which affect citizens' perceptions of tax compliance, expectations of government, and coordination capacity, and may be associated with weaker programmatic demands."),
    ('Who Controls the Past: Far-Sighted Bargaining in International Regimes',
    '2022-10-27',    
    1, 
    'https://onlinelibrary.wiley.com/doi/full/10.1111/ajps.12747', 
    "How do international regimes change over time? Regimes facilitate cooperation by linking together otherwise ad hoc negotiations. These linkages endogenize the status quo from which subsequent negotiations depart. I develop a theory of endogenous status quo within international regimes: prior outcomes implicitly define the status quo of new negotiations by acting as focal points and by creating inconsistency costs. I test observable implications of the theory in the context of the multilateral trade regime, focusing on new member accession negotiations. These negotiations attract interest from a surprising subset of World Trade Organization members, many with few observable trade ties or other economic incentives to participate. Nonetheless participation enables states to shape the emergent status quo strategically, with potentially far-reaching implications for future bargaining. I employ a text-as-data approach—together with a novel corpus of negotiating documents—finding consistent support for the theory and mechanisms.",
    "International regimes can change over time through negotiations that are facilitated by linkages, which create endogenous status quo by acting as focal points and creating inconsistency costs, and can be studied by examining new member accession negotiations in the context of the multilateral trade regime, where participation enables states to shape the emergent status quo strategically through a text-as-data approach and a novel corpus of negotiating documents."),

    ('Strategic Reporting: A Formal Model of Biases in Conflict Data',
    '2022-12-21',
    2, 
    'https://www.cambridge.org/core/journals/american-political-science-review/article/strategic-reporting-a-formal-model-of-biases-in-conflict-data/449156A0BAFBD187801AE451B4CD750B', 
    "During violent conflict, governments may acknowledge their use of illegitimate violence (e.g., noncombatant casualties) even though such violence can depress civilian support. Why would they do so? We model the strategic incentives affecting government disclosures of illegitimate violence in the face of potential NGO investigations, where disclosures, investigations, and support are endogenous. We highlight implications for the analysis of conflict data generated from government and NGO reports and for the emergence of government transparency. Underreporting bias in government disclosures positively correlates with underreporting bias in NGO reports. Furthermore, governments exhibit greater underreporting bias relative to NGOs when NGOs face higher investigative costs. We also illustrate why it is difficult to estimate negative effects of illegitimate violence on support using government data: with large true effects, governments have incentives to conceal such violence, leading to strategic attenuation bias. Finally, there is a U-shaped relationship between NGO investigative costs and government payoffs.",
    "During violent conflict, governments may acknowledge their use of illegitimate violence to NGOs even though it can depress civilian support due to strategic incentives, which can affect the analysis of conflict data from government and NGO reports and the emergence of government transparency, and can lead to underreporting bias in government and NGO reports and strategic attenuation bias in estimating the negative effects of illegitimate violence on support, with a U-shaped relationship between NGO investigative costs and government payoffs."),
    ('Revolutionary Violence and Counterrevolution',
    '2022-12-19',
    2, 
    'https://www.cambridge.org/core/journals/american-political-science-review/article/revolutionary-violence-and-counterrevolution/F39A56769C951BA7EE35166F03C4A80D', 
    "What type of revolutions are most vulnerable to counterrevolutions? I argue that violent revolutions are less likely than nonviolent ones to be reversed because they produce regimes with strong and loyal armies that are able to defeat counterrevolutionary threats. I leverage an original dataset of counterrevolutions from 1900 to 2015, which allows us for the first time to document counterrevolutionary emergence and success worldwide. These data reveal that revolutions involving more violence are less at risk of counterrevolution and that this relationship exists primarily because violence lowers the likelihood of counterrevolutionary success—but not counterrevolutionary emergence. I demonstrate mechanisms by comparing Cuba’s nonviolent 1933 uprising (which succumbed to a counterrevolution) and its 1959 revolutionary insurgency (which defeated multiple counterrevolutions). Though nonviolence may be superior to violence when it comes to toppling autocrats, it is less effective in bringing about lasting change and guaranteeing that these autocrats never return.",
    "Violent revolutions are less likely than nonviolent ones to be reversed due to the presence of strong and loyal armies that can defeat counterrevolutionary threats, as demonstrated through an original dataset of counterrevolutions from 1900 to 2015 and a comparison of Cuba's 1933 nonviolent uprising and 1959 revolutionary insurgency, although nonviolence may be superior in toppling autocrats, it is less effective in bringing about lasting change and preventing their return."),
    ('Emotional Sensibility: Exploring the Methodological and Ethical Implications of Research Participants’ Emotions',
    '2022-12-14',
    2, 
    'https://www.cambridge.org/core/journals/american-political-science-review/article/abs/emotional-sensibility-exploring-the-methodological-and-ethical-implications-of-research-participants-emotions/30B814A5F92E5CBD8DE63F15DD7B4539', 
    "Although political science increasingly investigates emotions as variables, it often ignores emotions’ larger significance due to their inherence in research with human subjects. Integrating emotions into conversations on methods and ethics, I build on the term “ethnographic sensibility” to conceptualize an “emotional sensibility” that seeks to glean the emotional experiences of people who participate in research. Methodologically, emotional sensibility sharpens attention to how participants’ emotions are data, influence other data, and affect future data collection. Ethically, it supplements Institutional Review Boards’ rationalist emphasis on information and cognitive capacity with appreciation for how emotions infuse consent, risk, and benefit. It thereby encourages thinking not only about emotional harm but also about emotions apart from harm and about emotional harms apart from trauma and vulnerability. I operationalize emotional sensibility by tracking four dimensions of research that affect participants’ emotions: the content of research, the context in which research occurs, researchers’ positionality, and researchers’ conduct.",
    "The concept of 'emotional sensibility' in research with human subjects emphasizes the importance of considering the emotional experiences of participants, how emotions can be data, the influence of emotions on other data and future data collection, and the role of emotions in consent, risk, and benefit, in addition to rationalist considerations of information and cognitive capacity, with the goal of improving the ethical treatment of participants and encouraging thinking about emotions beyond harm and trauma."),
    ('Government Rhetoric and the Representation of Public Opinion in International Negotiations',
    '2022-09-22',
    2, 
    'https://www.cambridge.org/core/journals/american-political-science-review/article/government-rhetoric-and-the-representation-of-public-opinion-in-international-negotiations/688B979DEF27F2FBBE335BC41584FE16', 
    "The role of domestic public opinion is an important topic in research on international negotiations, yet we know little about how exactly it manifests itself. We focus on government rhetoric during negotiations and develop a conceptual distinction between implicit and explicit manifestations of public opinion. Drawing on a database of video recordings of negotiations of the Council of the European Union and a quantitative text analysis of government speeches, we find that public opinion matters implicitly, with the exact pattern depending on governments’ stance toward the EU. Pro-EU governments are responsive to public opinion in their support for compromises and attempts to stall negotiations, whereas Euroskeptic governments tend to remain silent when confronted with a public positively disposed toward the EU. Our results show that although governments implicitly represent public opinion, they do not systematically invoke their voters explicitly, suggesting the public matters but in different ways than often assumed.",
    "The role of domestic public opinion in international negotiations is studied through analysis of government rhetoric and a distinction between implicit and explicit manifestations, finding that pro-EU governments are responsive to public opinion in their support for compromises and attempts to stall negotiations while Euroskeptic governments tend to remain silent when confronted with a positive public opinion, suggesting that public opinion matters but in different ways than often assumed."),
    ('How Exile Shapes Online Opposition: Evidence from Venezuela',
    '2022-12-19',
    2, 
    'https://www.cambridge.org/core/journals/american-political-science-review/article/how-exile-shapes-online-opposition-evidence-from-venezuela/68653BB1429AA6A5FF644A47FB017C21', 
    "How does exile affect online dissent? By internationalizing activists’ networks and removing them from day-to-day life under the regime, we argue that exile fundamentally alters activists’ political opportunities and strategic behavior. We test the effect of exile on activists’ public discourse in the case of Venezuela, through an analysis of over 5 million tweets by 357 activists spanning seven years. Our results suggest that after going into exile activists increasingly emphasize foreign-led interventions to shape their home country politics, focus less on local grievances, and become more harshly critical of the regime. This is partly due to the changes in exiles’ networks: after leaving, activists increase their interactions with foreign actors and tweet more in English. This work contributes to our understanding of the relationship between exile—one of the most ubiquitous yet understudied forms of repression—and dissent in the digital age.",
    "Exile affects online dissent by internationalizing activists' networks, altering their political opportunities and strategic behavior, as demonstrated through an analysis of tweets by Venezuelan activists who increasingly emphasize foreign-led interventions, focus less on local grievances, and become more harshly critical of the regime after going into exile, partly due to increased interactions with foreign actors and increased tweeting in English."),
    ('BARP: Improving Mister P Using Bayesian Additive Regression Trees — CORRIGENDUM',
    '2019-08-06',
    2, 
    'https://www.cambridge.org/core/journals/american-political-science-review/article/abs/barp-improving-mister-p-using-bayesian-additive-regression-trees/630866EB47F9366EDB3C22CFD951BB6F', 
    "Multilevel regression and post-stratification (MRP) is the current gold standard for extrapolating opinion data from nationally representative surveys to smaller geographic units. However, innovations in nonparametric regularization methods can further improve the researcher’s ability to extrapolate opinion data to a geographic unit of interest. I test an ensemble of regularization algorithms and find that there is room for substantial improvement on the multilevel model via more flexible methods of regularization. I propose a modified version of MRP that replaces the multilevel model with a nonparametric approach called Bayesian additive regression trees (BART or, when combined with post-stratification, BARP). I compare both methods across a number of data contexts, demonstrating the benefits of applying more powerful regularization methods to extrapolate opinion data to target geographical units. I provide an R package that implements the BARP method.",
    "Multilevel regression and post-stratification is the current standard for extrapolating opinion data from nationally representative surveys to smaller geographic units, but can be improved upon with nonparametric regularization methods, specifically Bayesian additive regression trees, which are demonstrated to be more powerful for extrapolating opinion data to target geographical units in various data contexts, and are provided in an R package."),
    ('Ideology Critique without Morality: A Radical Realist Approach',
    '2022-12-13',
    2, 
    'https://www.cambridge.org/core/journals/american-political-science-review/article/ideology-critique-without-morality-a-radical-realist-approach/7916283E0F8CF19331B0596024475190', 
    "What is the point of ideology critique? Prominent Anglo-American philosophers recently proposed novel arguments for the view that ideology critique is moral critique, and ideologies are flawed insofar as they contribute to injustice or oppression. We criticize that view and make the case for an alternative and more empirically oriented approach, grounded in epistemic rather than moral commitments. We make two related claims: (a) ideology critique can debunk beliefs and practices by uncovering how, empirically, they are produced by self-justifying power and (b) the self-justification of power should be understood as an epistemic rather than moral flaw. Drawing on the recent realist revival in political theory, we argue that this genealogical approach has more radical potential, despite being more parsimonious than morality-based approaches. We demonstrate the relative advantages of our view by discussing the results of empirical studies on the contemporary phenomenon of neopatriarchy in the Middle East and North Africa.",
    "An alternative approach to understanding the point of ideology critique as moral critique is proposed, arguing that ideology critique can debunk beliefs and practices through understanding how they are produced by self-justifying power as an epistemic flaw, demonstrated through empirical studies on neopatriarchy in the Middle East and North Africa, and having more radical potential than morality-based approaches."),
    ('The President Will See Whom Now? Presidential Engagement with Organized Interests',
    '2022-12-07',
    2, 
    'https://www.cambridge.org/core/journals/american-political-science-review/article/abs/president-will-see-whom-now-presidential-engagement-with-organized-interests/E5055D85579ECCC2915821D3874AF3C3', 
    "Though presidents often criticize organized interests, presidents also expend considerable effort engaging them. Using original elite interviews, a survey of lobbyists, and administrative data, I consider how this engagement manifests, why presidents engage interests, and with which interests presidents engage. Unlike in other institutions, presidents exercise substantial control over engagement with interests, and they engage to mobilize interests’ institutional resources in service of their goals. To optimize mobilization, presidents focus engagement on well-resourced interests and interests who share presidents’ preferences. Pairing over seven million White House visitor log entries from two administrations with lobbying and campaign finance records, I demonstrate that presidential engagement is informed by interests’ electoral and policy resources and partisan alignment, though these characteristics’ substantive effects are modest. My findings highlight coalition building with interests as an underappreciated source of presidential power and elucidate the degree to which presidents amplify the political voice of well-resourced and copartisan interests.",
    "Presidents engage with organized interests to mobilize their resources in service of their goals, focusing on well-resourced and copartisan interests, as demonstrated through analysis of White House visitor logs and lobbying and campaign finance records, highlighting coalition building with interests as an important source of presidential power."
);

INSERT INTO keywords(keyword_name) VALUES (
    'moral responsibility'), ('racialized power structures'), ('distributed moral agency'),
    ('lobbyists'), ('legislators'), ('policymaking'), 
    ('electoral accountability'), ('legislator preferences'), ('policy concessions'),
    ('informal sector'), ('programmatic politics'), ('economic informality'), 
    ('international regimes'), ('negotiations'), ('endogenous status quo'), 
    ('violent conflict'), ('illegitimate violence'), ('government transparency'),
    ('counterrevolutions'), ('violent revolutions'), ('nonviolent revolutions'), 
    ('Emotions'), ('Ethical considerations'), ('Human subjects research'),
    ('Domestic public opinion'), ('International negotiations'), ('Government rhetoric'), 
    ('Exile'), ('Online dissent'), ('Activism'), 
    ('Multilevel regression and post-stratification (MRP)'), ('Nonparametric regularization methods'), ('Extrapolation of opinion data'),
    ('Ideology critique'), ('Epistemic commitments'), ('Self-justifying power'),
    ('Presidential engagement with organized interests'), ('Mobilization of interests resources'), ('Coalition building'
);

INSERT INTO paper_keywords(keyword_id, paper_id) VALUES (
     1,1), (2,1),(3,1),
    (4,2), (5,2),(6,2), 
    (7,3), (8,3),(9,3), 
    (10,4), (11,4),(12,4), 
    (13,5), (14,5),(15,5), 
    (16,6), (17,6),(18,6), 
    (19,7), (20,7),(21,7), 
    (22,8), (23,8),(24,8), 
    (25,9), (26,9),(27,9), 
    (28,10), (29,10),(30,10), 
    (31,11), (32,11),(33,11), 
    (34,12), (35,12),(36,12),
    (34,13), (35,13),(36,13
);

INSERT INTO paper_authors(paper_id, author_id) VALUES (
     1,1),
    (2,2), (2,3), 
    (3,4), (3,5), (3,6), 
    (4,7),  
    (5,8), 
    (6,9), (6,10), 
    (7,11), 
    (8,12),  
    (9,13), (9,14), (9,15), 
    (10,16), (10,17), 
    (11,18), 
    (12,19), (12,20),
    (13,21
);


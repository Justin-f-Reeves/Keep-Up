# Keep-Up

Keep-Up is an API for scholars and practitioners who want to simplify and automate the process of staying updated on developments in their field. 

Drawing from a continuously updated dynamic database of research publications, the API serves requests for summary data on all papers from top-tier journals that match client selected parameters. These parameters include keywords provided by authors, journals, and AI. 

**"Wait, isn't this just a more limited version of Google Scholar?"**

**Yes, and no.**

Google Scholar's search algorithms are broad and messy, which is great if one is trying to compile a comprehensive formal literature review for a given topic and you need to capture everything and anything that is even remotely relevant.  This is highly inefficent, however, for those who only need to keep abreast of the most impactful developments in their field with a quick survey of recent publications, or a review of past top publications. 

By design, Keep-Up, returns only results from the top 20 journals of a given sub-discipline (as measured by [H-index](https://en.wikipedia.org/wiki/H-index)). This removes a lot of extgraneous noise and provides clients with an immediate listing of the more limited and uncluttered results they need. 

Moreover, Keep-Up employs AI to distill 500 word paper abstracts down to merely 1 sentence, with remarkable accuracy. This gives users the ability to ***very*** quickly digest the gist of recent work before deciding whether and if they want to investigate that work in greater detail. For each publicataion, the API offers one-sentence abstracts, full-abstracts, or links to the entire paper, depending on client requests.   

With Keep-Up, a task that would require lots of manual searching, navigating, and needless processing of irrelevant text, now takes only seconds. 

### Example abstract (full form):
> Low-information elections have been shown to hinder the success of female candidates, especially where party-based cues are absent due to intraparty competition. We test whether access to candidates’ biographical information increases voter support for female candidates with two separate survey experiments conducted during open-list proportional representation elections for Japan’s House of Councillors in 2016 and 2019. We also test the effect of compulsory preference voting (i.e., excluding the option of casting a party-level vote), which may counteract gender-based inequalities in participation and encourage voters to seek out information on (female) candidates. We find that providing information about candidates, as well as making preference voting compulsory, significantly increases votes for female candidates. The effects are docu- mented both with the actual candidates running in the elections, and with a conjoint experiment of hypothetical candidates, and highlight how seemingly simple changes can significantly increase women’s political representation in preferential voting systems.

### Example AI-generated summary (1-sentence form):
> Providing information about candidates and making preference voting compulsory can significantly increase votes for female candidates in proportional representation elections, as shown by two survey experiments conducted during elections for Japan's House of Councillors in 2016 and 2019, and a conjoint experiment of hypothetical candidates.

### Example parameters that Keep-Up API will match the above paper on:
**Keywords defined by authors:**
> gender representation, survey experiment, conjoint analysis, preferential voting, Japan

**Keywords defined by AI:**
> Low-information elections, Female candidates, Proportional representation elections
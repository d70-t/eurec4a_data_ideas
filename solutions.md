# Solution ideas

## live communication
As latency is more important than bandwidth efficienty (it's not so much data), a central chat system is most likely suited best.
Currently there are multiple options, which are evaluated:

### RocketChat

* Free software, hosted by GWDG
* Allows desktop and mobile use
* Has groups
* During pre-campaign in OP, messages were not delivered on time (sometimes as late as the next day)

### Threema

* Can be used on desktop but not without concurrently active smartphone
* Costs 2.67€ once per user for non-Work variant
* Costs 8.24€ once per user for Work Education variant (better groups etc)
* Normal groups are invite-only
* Was the most reliable messenger during pre-campaign in OP

### Telegram

### Slack

* Costs 6€ per user and month

### Mattermost

* Free software, hosted by CEN
* Good group feature
* Works on desktop and smartphone
* Was least reliable messenger during pre-campaign in OP

## folder structure
A unified folder structure, which is synchronize between all participants will most likely solve most of the user stories (quicklooks, measurement data, manuals, protocols and maybe blog).
The folder structure may have to handle in the order of 10GB per day of data growth.

Synchronization of such a folder structure is generally a challange if multiple writers can potentially change the same thing at the same time, which will result in race conditions. This might be solved by defining a folder structure with separate subtrees for each instrument / working group / site.
Separating writers this way allows to define a single synchronization direction for each subtree and thus avoids race conditions.

Such unidirectional synchronization channels might be feasible to set up between site-local servers (e.g. one server in HH, one at Divi, one on each Ship). Futher synchronization between scientist laptops and the respective local server can maybe acchieved using ownCloud?

Synchronization between sites can be limited on a per-folder or per-file level. Synchronization between site-server and laptop can be configured using the ownCloud client.

### open questions

* is it possible to synchronize mutliple ownClouds using rsync oder similar?
* what will happen if someone edits a file from another site on the laptop an synchronizes it with the local owncloud

### other ideas
Content adressable storage eliminates this problem, but (excep in the form of git) is not in such widespread use and might need more testing. Some ideas are written in [data distribution design](data_distribution_design.md). DAT seems to be the most approprivate variant amongst these.

# blog
A blog might be created periodically from the folder structure using a static website generator (e.g. [Jekyll](https://jekyllrb.com/), [Hugo](https://gohugo.io/), [Pelican](https://blog.getpelican.com/), [Hakyll](https://jaspervdj.be/hakyll/)).
This would allow to upload the blog to a central webserver as well as to create and host it locally at the different sites.

DAT with Beakerbrowser would similarly allow to integrate a dynamic website generator inside the DAT archives, such that the Blog automatically updates as soon as the folder structure gets updated.

Having a blog wich is generated from a unified folder structure would also allow to create overview pages of quicklook data automatically.

# overview about communication media
As a central information point about all available communication media, a website with basic information (IP-Adresses, tools, where is what?) will be created.


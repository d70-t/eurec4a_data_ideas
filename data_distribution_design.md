# Near-Time Data Distribution for EUREC4A

## Goals

During the EUREC4A field campaign, mutliple vessles, facilities and sites are to work in close collaboration.
Many data will be created at different places which are valuable for planning and checking of instrument performance during the campaign.
To support the field campaign activities, a system which allows to share data in near time and over limited network resources in an efficient manner.

### Kinds of data

* raw measurement data
* processed data
* model output
* maps
* planning documents
* blog articles
* manuals / instrument description

### Typical site layout

A site can be a conference room, a ship, a university or similar.
These kinds of sites generally may provide a computer which can act as local server.
At the site, many computers may exist, from which data is generated (e.g. instruments, model output) which may be connected to the local server via a fast but possibly intermittent connection.
The local server can be connected to the internet, using a mostly stable connection but with generally a low bandwidth.
Nevertheless, interruptions of the internet connection has to be expected.

## Design ideas

Data should be stored / cached locally to prevent data from being transferred multiple times over a slow and costly internet connection.
As people might want to quickly upload a file and than leave the site's wifi to do something else, also uploads should be cached locally.
These criteria enforce a system which is capable of synchronizing multiple masters.
Synchronization conflicts must be avoided, because they can appear after the data producer has left the site and generally, resolving conflicts is tedious manual work, for which personal resources might not be available.
Possible solutions to avoid conflicts are:

* Every site has one master, which is assigned a dedicated exclusive part of the data space. The site is the only place which is allowed to write to that location. This is a less flexible approach but allows mutation in a simple way.
* Data is content-addressed: The name of the datum is generated as a hash of the content, ensuring that same content is de-duplicated and different contend gets different names. This is a very general approach, but data located at a given name is per definition immutable. If information should be upgraded (like an index page), a mutation scheme must be added on top.

Does the system have to be strongly private?
Is it enough to have unknown, but in priciple public links?

Some sites might have severly limited and / or costly internet connections (i.e. satellite links).
In order to cope with that situation, it should be possible to selectively synchronize only parts of all data over specific links.
The selection should be topic-based, such that e.g. high-resolution measurement data might be ommitted while quicklooks are being synchronized.

## Candidates

* shared folders and rsync
* [IPFS](https://ipfs.io/)
* [Perkeep](https://perkeep.org)
* [Dat](https://datproject.org/)
* git

### Comparison of Dat and IPFS

(taken from [medium](https://medium.com/blue-link-labs/so-you-want-your-decentralized-browser-to-work-correctly-c06c4038ab12))

    User: I’d like to make a new website, please.

    Beaker: Splendid! Would you like to use Dat or IPFS?

    User: Uh, what’s the difference?

    Beaker: Well, one has a focus on static hash-addressed bundles,
    while the other is focused on dynamic public-key-addressed archives,
    but TBH both can do either! ¯\_(")_/¯

### IPFS

IPFS is a distributed storage for content indicated by it's hash.
By some form of trading, nodes are encouraged to hold copies of data, improving the availability in the network.
It is also possible to pin data, which forces a node to hold a copy of a defined dataset.
IPFS Cluster seems to be some software to manage collections of pinned data (pinset).
[ipfs-pack](https://github.com/ipfs/ipfs-pack) might be interesting.

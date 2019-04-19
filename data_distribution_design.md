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

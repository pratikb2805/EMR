import 'package:emr/objectbox.g.dart';
// import 'package:emr/MOCK_DATA.json' as data;
import 'dart:convert';

void main() {
  final store = Store(getObjectBoxModel());
  String jsonData = '''
  [{"name":"Melodee Airth","start":"2020-12-10 20:24:24","email":"mairth0@go.com","phone":"482 690 6567","end":"2021-02-16 06:45:49","description":""},
{"name":"Kalil Brett","start":"2020-09-15 12:46:51","email":"kbrett1@loc.gov","phone":"643 494 3024","end":"2020-08-01 13:34:22","description":""},
{"name":"Andrus Tregiddo","start":"2020-10-17 16:16:11","email":"atregiddo2@cnbc.com","phone":"474 445 0975","end":"2020-09-10 09:00:57","description":""},
{"name":"Fredelia Slatford","start":"2020-08-15 20:30:50","email":"fslatford3@elegantthemes.com","phone":"683 682 7022","end":"2021-02-12 14:28:20","description":""},
{"name":"Shell Vittel","start":"2020-04-30 17:58:13","email":"svittel4@wordpress.org","phone":"599 881 7838","end":"2020-09-03 11:07:22","description":""},
{"name":"Bernelle Jobbings","start":"2020-08-02 18:48:17","email":"bjobbings5@e-recht24.de","phone":"633 941 1553","end":"2021-04-29 00:31:30","description":""},
{"name":"Clayborn Ceccoli","start":"2020-05-19 21:13:27","email":"cceccoli6@youtube.com","phone":"114 814 0854","end":"2020-06-27 08:14:49","description":""},
{"name":"Jenna Devereux","start":"2021-05-14 17:06:11","email":"jdevereux7@chron.com","phone":"923 752 5803","end":"2020-07-10 04:14:13","description":""},
{"name":"Milena Capelen","start":"2020-08-12 08:02:57","email":"mcapelen8@wikipedia.org","phone":"752 527 1994","end":"2020-06-27 12:00:58","description":""},
{"name":"Pauli Kimberley","start":"2020-09-01 11:17:32","email":"pkimberley9@cnbc.com","phone":"793 417 0487","end":"2021-04-01 21:14:29","description":""},
{"name":"Eadith Longhorn","start":"2020-10-13 17:16:15","email":"elonghorna@twitpic.com","phone":"367 815 1468","end":"2020-11-25 17:12:04","description":""},
{"name":"Lilias Nayer","start":"2020-04-01 20:26:57","email":"lnayerb@livejournal.com","phone":"425 613 3823","end":"2020-10-12 18:08:10","description":""},
{"name":"Grantley Leaney","start":"2020-03-24 12:36:12","email":"gleaneyc@deliciousdays.com","phone":"370 739 5975","end":"2020-09-15 04:00:56","description":""},
{"name":"Dominga Maingot","start":"2021-05-29 22:28:28","email":"dmaingotd@zdnet.com","phone":"534 960 0932","end":"2021-05-15 04:43:02","description":""},
{"name":"Perry Attride","start":"2020-10-09 05:30:33","email":"pattridee@histats.com","phone":"496 309 6239","end":"2021-04-01 05:44:17","description":""},
{"name":"Gaylene Howels","start":"2020-10-12 14:12:19","email":"ghowelsf@eventbrite.com","phone":"364 394 2691","end":"2020-08-26 09:25:04","description":""},
{"name":"Jacquelin Tithecott","start":"2021-05-26 09:56:00","email":"jtithecottg@360.cn","phone":"547 537 3362","end":"2021-04-12 11:04:48","description":""},
{"name":"Ogdon Galsworthy","start":"2021-03-07 11:46:01","email":"ogalsworthyh@surveymonkey.com","phone":"111 210 9909","end":"2020-08-07 17:55:48","description":""},
{"name":"Patricio Bragge","start":"2020-09-03 02:09:07","email":"pbraggei@foxnews.com","phone":"745 252 4221","end":"2021-05-18 20:58:07","description":""},
{"name":"Florian Billyard","start":"2021-04-14 23:15:16","email":"fbillyardj@engadget.com","phone":"939 440 8318","end":"2021-05-29 23:36:55","description":""},
{"name":"Cordi Peirce","start":"2020-10-21 07:58:05","email":"cpeircek@sitemeter.com","phone":"818 296 2805","end":"2020-11-27 09:30:58","description":""},
{"name":"Raina Mackison","start":"2020-06-20 19:29:12","email":"rmackisonl@spotify.com","phone":"885 279 9971","end":"2021-03-25 10:18:08","description":""},
{"name":"Rolf Rushforth","start":"2020-11-14 03:44:35","email":"rrushforthm@tiny.cc","phone":"869 655 0797","end":"2020-12-04 14:57:04","description":""},
{"name":"Ahmed Luchelli","start":"2020-07-25 17:46:56","email":"aluchellin@mtv.com","phone":"437 238 3223","end":"2020-09-27 00:19:06","description":""},
{"name":"Joseito McCool","start":"2021-02-25 08:11:01","email":"jmccoolo@foxnews.com","phone":"104 163 7535","end":"2020-09-15 16:28:57","description":""},
{"name":"Johnathan Cornau","start":"2021-05-01 18:48:06","email":"jcornaup@desdev.cn","phone":"919 674 6828","end":"2021-05-24 08:18:35","description":""},
{"name":"Morry Vala","start":"2020-10-15 22:03:32","email":"mvalaq@bing.com","phone":"459 825 6304","end":"2021-04-20 17:05:20","description":""},
{"name":"Deane Rate","start":"2021-04-16 11:38:37","email":"drater@cocolog-nifty.com","phone":"290 623 9684","end":"2020-08-27 18:59:56","description":""},
{"name":"Abagael Whithalgh","start":"2021-04-07 03:55:16","email":"awhithalghs@nba.com","phone":"108 158 5578","end":"2021-04-30 04:01:32","description":""},
{"name":"Berni Leynagh","start":"2020-03-14 03:55:07","email":"bleynaght@ovh.net","phone":"387 372 9351","end":"2020-10-14 17:49:15","description":""},
{"name":"Paddie Aizikovich","start":"2020-06-09 11:07:58","email":"paizikovichu@nba.com","phone":"676 187 7208","end":"2021-01-02 06:30:37","description":""},
{"name":"Braden Elsley","start":"2020-11-16 20:18:14","email":"belsleyv@ask.com","phone":"711 272 9392","end":"2021-03-03 11:36:28","description":""},
{"name":"Waylen Batchan","start":"2020-06-25 12:39:16","email":"wbatchanw@sphinn.com","phone":"845 930 0081","end":"2020-06-23 19:39:24","description":""},
{"name":"Orelie Brandt","start":"2020-10-05 20:19:07","email":"obrandtx@google.com","phone":"883 948 1303","end":"2021-05-15 10:53:03","description":""},
{"name":"Norine Garratty","start":"2021-05-09 02:46:23","email":"ngarrattyy@wisc.edu","phone":"410 442 8298","end":"2020-12-03 08:34:15","description":""},
{"name":"Dennet Coggill","start":"2020-10-23 06:33:54","email":"dcoggillz@chron.com","phone":"492 609 9832","end":"2021-04-28 17:59:42","description":""},
{"name":"Felicio Cornilli","start":"2020-06-21 22:38:31","email":"fcornilli10@aol.com","phone":"455 520 2521","end":"2020-12-30 09:18:02","description":""},
{"name":"Harri Pillington","start":"2020-04-21 18:37:53","email":"hpillington11@qq.com","phone":"212 917 7685","end":"2020-09-14 21:54:14","description":""},
{"name":"Demetris Willetts","start":"2021-03-14 09:44:59","email":"dwilletts12@intel.com","phone":"685 521 5544","end":"2021-02-17 23:26:12","description":""},
{"name":"Colly Sandbach","start":"2021-04-28 21:55:43","email":"csandbach13@chron.com","phone":"138 935 3729","end":"2020-08-30 17:03:24","description":""},
{"name":"Haywood Laite","start":"2020-10-17 22:44:09","email":"hlaite14@psu.edu","phone":"907 719 6339","end":"2020-07-08 04:47:28","description":""},
{"name":"Davidson Medlin","start":"2020-03-29 23:37:26","email":"dmedlin15@oaic.gov.au","phone":"267 651 6068","end":"2020-07-18 09:17:37","description":""},
{"name":"Ganny Boddy","start":"2020-07-27 18:51:44","email":"gboddy16@whitehouse.gov","phone":"616 739 2755","end":"2020-10-14 10:36:29","description":""},
{"name":"Leif Sudddard","start":"2020-12-14 17:05:19","email":"lsudddard17@washington.edu","phone":"968 377 5822","end":"2020-12-31 10:01:11","description":""},
{"name":"Joyce Gosalvez","start":"2021-01-16 03:38:04","email":"jgosalvez18@statcounter.com","phone":"909 360 6331","end":"2021-01-08 05:58:16","description":""},
{"name":"Cecil Danilchenko","start":"2020-12-08 20:25:36","email":"cdanilchenko19@youtube.com","phone":"735 919 3599","end":"2020-11-23 09:09:18","description":""},
{"name":"Iver Heffernon","start":"2020-04-19 03:41:45","email":"iheffernon1a@cisco.com","phone":"133 318 7627","end":"2021-03-03 02:22:42","description":""},
{"name":"Fletcher Ethridge","start":"2021-06-05 19:31:09","email":"fethridge1b@prnewswire.com","phone":"930 383 3222","end":"2020-11-28 19:23:29","description":""},
{"name":"Katuscha Palfreman","start":"2021-01-28 15:02:33","email":"kpalfreman1c@goo.ne.jp","phone":"605 813 7656","end":"2020-08-18 10:43:53","description":""},
{"name":"Amos Taffarello","start":"2020-10-24 15:04:26","email":"ataffarello1d@wunderground.com","phone":"408 738 1800","end":"2020-08-26 09:33:27","description":""}]
  ''';
  final datj = json.decode(jsonData);
  for (var name in datj) {
    print('$name \n');
  }
  store.close();
}

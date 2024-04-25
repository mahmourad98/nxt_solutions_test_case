# nxt_test_case

This is a test case for the NXT team. 
The app is a simple app that fetches data from a REST API and displays it in a list.

I provided a link to download the APK file of the app:
(https://www.dropbox.com/scl/fi/94kxju2o7zo5xtfu5201e/nxt_solutions_test_case_app_release.apk?rlkey=0vje6ni5tklsj8rf9iq50o8jr&st=d6l399tq&dl=0)

screenshots of the app:
(https://www.dropbox.com/scl/fi/ac89ivut9i0sx5qkse2o4/Screenrecorder-2024-04-25-03-15-45-337.mp4?rlkey=fj7i3ybehfcrbesyug779i5fx&st=59gsnppg&dl=0)

The app is built using the Flutter framework 3.16.9 and Dart language 3.2.6.
it is recommended to use the FVM as well.

in this app you will find to main paths:
1. core folder: contains the main logic of the app such as data, domain, presentation layers.
2. extras folder: contains outer dependencies of the app such as services, helpers, utilities.

this app is built using the clean architecture pattern and the stacked package for state management, 
aligned with the dependency injection tool and reactive objects.
data layer: contains the data models which reflects the json scheme, 
repositories, and data sources.
domain layer: contains the use cases and the entity models which will be passed to our presentation layer.
presentation layer: contains the view models and the views of the app including shared widgets.

the app is divided into 3 main screens:
1. home screen: contains the list of the fetched data.
2. info screen: contains the information of the selected item.
3. details screen: contains the details of the selected item.

some code templates were used, like in Material App, DIO networs service, navigation service, localization services.
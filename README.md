## Table of Contents
1. [General Info](#general-info)
2. [Screenshots](#screenshots)
3. [Showcase](#showcase)
4. [Technologies](#technologies)
5. [GIFs](#gifs)

### General Info

# Running this project

1. pub global run intl_utils:generate

***
# Firebase DB Template
  This is a template project which serves the purpose of firestore database management, state management, route management, localisation management & app theme management.
  Fetching, Adding, updating & deleting of the entries from firestore database is implemented in this template with the help of firebase dependencies and crud firestore data source and repository impl classes.
  State management, route management & app theme management is also implemented with the use of "GetX" library.
  State management is performed with the help of "GetX controllers" along with some core classes which handles lots of basic functionalities like search, filters, pagination etc.
  Route management is performed with the help of "Bindings".
  App theme management is performed with the use of controllers and "GetX" functions.
  Localisation with the support of two languages "EN" & "ES" is also implemented in this template with the help of flutter_intl & GetX controllers.

  Following are some modules included in this project.

  1. Dashboard
  2. Grocery
  3. Settings

### Screenshots
***

 #### Light Mode

 | Splash page                 | Grocery list page              | Settings page                 | Add Grocery popUp                  |
 | -----------                 | -----------------              | -------------                 | -------------                      |
 | ![](/screenshots/splash.png)| ![](/screenshots/groceries.png)| ![](/screenshots/settings.png)| ![](/screenshots/add_groceries.png)|


 #### Dark Mode

 | Splash page                     | Grocery list page                  | Settings page                     | Add Grocery popUp                      |
 | -----------                     | -----------------                  | -------------                     | -------------                          |
 | ![](/screenshots/splash_drk.png)| ![](/screenshots/groceries_drk.png)| ![](/screenshots/settings_drk.png)| ![](/screenshots/add_groceries_drk.png)|


 #### Spanish language (ES)

 | Grocery list page                 | Settings page                    | Add Grocery popUp                     |
 | -----------------                 | -------------                    | -------------                         |
 | ![](/screenshots/groceries_es.png)| ![](/screenshots/settings_es.png)| ![](/screenshots/add_groceries_es.png)|

### Showcase
***

  This project is build to Showcase following things implemented in this project.

  1. Firestore database management.
  2. Clean Architecture
  3. State management using GetX.
  4. Route management using GetX.
  5. Advance code structure.
  6. Firestore datastore CRUD impl.
  7. Localisation.
  8. App Theme management using GetX.

### Folder Structure

    .
    ├── _config                             # files for enviornment related settings DEV, PROD 
    ├── _core                               # core file independent of project/app  
    ├── _shared                             # project dependent but app independent   
    ├── app                                 # app-specific files modules based on clean architecture. 
    │   ├── di                              # a centralized place to manage all dependencies in app
    │   ├── extra                           # common files like enums, images, fields files
    │   ├── modules                         # various functional modules/features of app
    │   │   ├── grocery                     # gorcery specific files 
    │   │   │   ├── data                    # responsible for data fetching from remote or local database  
    │   │   │   │   ├── sources             # various data sources like local, remote to communicate with respetive source.
    │   │   │   │   └── repositories        # Reponsible for managing data sources. It has actual implementation.
    │   │   │   ├── domain                  # This is the central layer of the feature with all business logic.
    │   │   │   │   ├── entities            # The model class which is mapped from data model class.
    │   │   │   │   ├── repositories        # Rules of what needs to be implemented to obtain domain model.
    │   │   │   │   └── usecases            # A unique use case for every logic inside a particular feature.
    │   │   │   └── presentation            # UI layer for data showing and user interactions.
    │   │   │       ├── controllers         # Unit tests
    │   │   │       ├── pages               # representing a single screen of the feature
    │   │   │       └── widgets             # Resuable widgets
    │   │   └── dashboad                      
    │   ├── ui                              # app theme, style guides, resusable ui components
    │   ├── utils                           # app specific utils
    │   └── widgets                         # common resusable ui components
    ├── generated                           # automatic generated language files
    ├── l10n                                # supported language files
    └── main.dart                           # Entry point


### Technologies
***

   Following technologies are used in this project.

   #### core packages

   1. [dartz] (https://pub.dev/packages/dartz)
   2. [equatable] (https://pub.dev/packages/equatable)

   #### shared dependency

   1. [get_storage] (https://pub.dev/packages/get_storage)
   2. [logger] (https://pub.dev/packages/logger)

   #### app dependency

   1. [intl] (https://pub.dev/packages/intl)
   2. [intl_utils] (https://pub.dev/packages/intl_utils)
   3. [get] (flutter sdk)
   4. [get_it] (flutter sdk)
   5. [flutter_localizations] (flutter sdk)
   6. [cupertino_icons] (https://pub.dev/packages/cupertino_icons)
   7. [persistent_bottom_nav_bar] (https://pub.dev/packages/persistent_bottom_nav_barr)
   8. [fluttertoast] (https://pub.dev/packages/fluttertoast)
   9. [sized_context] (https://pub.dev/packages/sized_context)
   10.[time] (https://pub.dev/packages/time)
   11.[timeago] (https://pub.dev/packages/timeago)
   12.[connectivity] (https://pub.dev/packages/connectivity)

   #### firebase dependency

   1. [firebase_core] (https://pub.dev/packages/firebase_core)
   2. [firebase_storage] (https://pub.dev/packages/firebase_storage)
   3. [firebase_auth] (https://pub.dev/packages/firebase_auth)
   4. [cloud_firestore] (https://pub.dev/packages/cloud_firestore)
   5. [cloud_functions] (https://pub.dev/packages/cloud_functions)


### GIFs
***

   #### Sample for adding data to firestore DB.

   ![Adding item to FB Database](/screenshots/add_data_db.gif)

   #### Sample for changing app theme mode.

   ![App theme change](/screenshots/app_mode_change.gif)

   #### Sample for deleting data from firestore DB.

   ![Deleting item from FB Database](/screenshots/delete_data.gif)

   #### Sample for changing app language.

   ![App language change](/screenshots/language_change.gif)

   #### Sample for search implemented in app.

   ![Searching items](/screenshots/search.gif)





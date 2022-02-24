# currency_calculator

A new Flutter project for calculating the excahnge between Euros and six other currencies.

## Getting Started

This project is a starting point for a Flutter application.

## Screenshot

![Simulator Screen Shot - iPhone 8 - 2022-02-24 at 12 50 53](https://user-images.githubusercontent.com/54381642/155527648-ab87f2c5-68c4-48d6-bb58-c1ab0e417755.png)

![Simulator Screen Shot - iPhone 8 - 2022-02-24 at 12 51 00](https://user-images.githubusercontent.com/54381642/155527687-0fa07e7e-b67b-4433-9dc2-e89e15c3fe8f.png)

![Simulator Screen Shot - iPhone 8 - 2022-02-24 at 13 54 31](https://user-images.githubusercontent.com/54381642/155528045-bcdf85ce-7e07-45f2-b254-9bfb890505cf.png)

![Simulator Screen Shot - iPhone 8 - 2022-02-24 at 13 54 43](https://user-images.githubusercontent.com/54381642/155528073-e07b8b96-f4e1-4258-91b9-2aa31272bf6b.png)

![Simulator Screen Shot - iPhone 8 - 2022-02-24 at 13 54 58](https://user-images.githubusercontent.com/54381642/155528089-f3f41571-fded-4ad3-a14a-5c7bd2eb7ec5.png)

## Installing
To install this app

```
git clone https://github.com/Rhemi7/euro_currency_converter.git
```

And then install the required dependencies

```
flutter pub get
```
Run the app

```
flutter run --no-sound-null-safety
```

## Running the tests
To run test cases

```
flutter test --no-sound-null-safety
```

## App Development Info
Folder Structure

  - Core: This contains things that were reused throughout thr project.
  - Feature: This is where every major feature in the project is located.
     - data: all calls made to the remote data/api are included here.
     - domain: represents bridge between the data layer and presentation layer, here all abstractions are made before being sent to the presentation layer
     - presentation: includes all classes and methods that make up the screens/pages of the app.

## Plugins
| Name | Description |
| --- | --- |
| Flutter Riverpod | Used for state management |
| Get it | Dependency Injection |
| FL Chart | Used for chart feature |
| Dartz | Functional programming in Dart |
| Mockito | Used for testing |


## APK
For the APK of the project:

- [Click here](https://drive.google.com/file/d/1ohNRMilB5bwrLaBXRdsIPbpMg3WvzX7X/view?usp=sharing)

For the APK folder of the project:

- [Click here](https://drive.google.com/drive/folders/1EooxXqdCfwGkP8SSg1STFXfNsfs2SGNH?usp=sharing)


## Note
Please note that API key expires after 100 calls


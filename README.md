# flutter_cinemapedia

# Dev
1. Copy `.env.example` to `.env` and fill in your API keys
2. Run `flutter pub get`
3. Run `flutter run`

## How to integrate a new request
0. Add `Domain -> Entities -> model`
1. Add `Infrastructure -> models -> model_folder -> model` with the response to json function (quicktype)
2. Add `Infrastructure -> Mappers -> model_mapper`
3. Add `Domain -> Datasources -> model_datasource`
4. Add Future to abstract class Datasource
5. Add the same Future function to `Domain -> Repositories -> model_repository`
6. Go to `Infrastructure -> Datasources -> model_datasource` and add missing @override function
7. Add await http request to created fucntion
8. Go to `Infrastructure -> Repositories -> model_repository_impl` and add missing @override function
9. Go to `Presentation -> Providers -> model -> model_repository_provider` add reference to modal_repository_impl and connect it with `Infrascrutucture -> Datasources -> model_datasource`
10. Go to `Presentation -> Providers -> model -> model_provider` and add reference to `model_repository_provider`
11. Go to `Presentation -> Screens -> custom screen` and use the provider in the state widget, change widget to `ConsumerStatefulWidget` or `ConsumerWidget`
12. Add the provider in the `initState` function with the `ref.read` function
13. Add the provider in the `build` function with the `ref.watch` function

## Cambios en la entidad, hay que ejecutar el comando
```
flutter pub run build_runner build
```
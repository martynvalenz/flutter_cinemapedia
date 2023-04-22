# flutter_cinemapedia

# Dev
1. Copy `.env.example` to `.env` and fill in your API keys
2. Run `flutter pub get`
3. Run `flutter run`

## How to integrate a new model/function
1. `Domain -> Datasources -> model_datasource`
2. Add Future to abstract class Datasource
3. Add the same Future function to `Domain -> Repositories -> model_repository`
# 🎬 CinéAPI
[🇫🇷 Français](#fr) | [🇬🇧 English](#en)




## <a id="en"></a>🇬🇧 Description (English)
CinéAPI is an advanced educational application developed with Ruby on Rails. It facilitates the exploration of relationships between movies, actors, and directors, while integrating modern features such as JWT authentication, route protection via middleware, and efficient JSON responses with Jbuilder.



## 🚀 Features
- Management of movies, actors, and directors.

- Secure authentication using both session-based and JWT tokens.

- Request rate limiting per IP using ``rack-attack``.

- Efficient JSON response generation with Jbuilder.

- Database seeded with 580 movies to enrich the dataset.

## 🔐 Security
- **Authentication:** Implemented via both session-based and JWT methods, with middleware to secure routes..

- **Request Limiting**:

  - rack-attack is configured to limit requests to 5 every 2 seconds per IP.

  - rack-attack is also set up to block specific IP addresses.

## 🧪 Testing

### RSpec
- The project uses [RSpec](https://rspec.info/) for unit and integration testing.
- Model tests and API endpoint tests are implemented.
- Request specs are used to simulate real HTTP requests to the API.

### Factories
- [FactoryBot](https://github.com/thoughtbot/factory_bot_rails) is used to generate test data for models (users, movies).

### Request Specs
- API endpoints are tested using RSpec request specs, ensuring realistic simulation of client requests and responses.

### Code Coverage
- [SimpleCov](https://github.com/simplecov-ruby/simplecov) is integrated to measure code coverage of the test suite.
- To view coverage, run your tests and open the generated `coverage/index.html` file.

### How to run tests

```sh
bundle exec rspec
```
## <a id="fr"></a>🇫🇷 Description (Français)

CinéAPI est une application pédagogique avancée développée avec Ruby on Rails. Elle facilite l’exploration des relations entre films, acteurs et réalisateurs, tout en intégrant des fonctionnalités modernes telles que l’authentification JWT, la protection des routes via un middleware et des réponses JSON efficaces grâce à Jbuilder.

## 🚀 Fonctionnalités
- Gestion des films, acteurs et réalisateurs.
- Authentification sécurisée par sessions et tokens JWT.
- Limitation du nombre de requêtes par IP avec `rack-attack`.
- Génération efficace de réponses JSON avec Jbuilder.
- Base de données enrichie avec 580 films.

## 🔐 Sécurité
- **Authentification :** Mise en place via sessions et JWT, avec middleware pour sécuriser les routes.
- **Limitation des requêtes :**
  - `rack-attack` limite à 5 requêtes toutes les 2 secondes par IP.
  - Blocage possible de certaines adresses IP.

## 🧪 Tests

### RSpec
- Le projet utilise [RSpec](https://rspec.info/) pour les tests unitaires et d’intégration.
- Des tests de modèles et des tests d’API sont implémentés.
- Les request specs simulent de vraies requêtes HTTP vers l’API.

### Factories
- [FactoryBot](https://github.com/thoughtbot/factory_bot_rails) est utilisé pour générer des données de test pour les modèles (utilisateurs, films, acteurs, réalisateurs, rôles).

### Request Specs
- Les endpoints de l’API sont testés avec des request specs RSpec, pour une simulation réaliste des requêtes et réponses client.

### Couverture de code
- [SimpleCov](https://github.com/simplecov-ruby/simplecov) est intégré pour mesurer la couverture des tests.
- Pour consulter la couverture, lancez les tests puis ouvrez le fichier `coverage/index.html`.

### Lancer les tests

```sh
bundle exec rspec
```

# 🎬 CinéAPI
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

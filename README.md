## 📚 API Documentation (Swagger / OpenAPI)

Interactive API documentation built with **Rswag** using the "Documentation as Code" approach.

 🚀 Quick Start
1. Start the Rails server:
   ```bash
   rails s
   ```
2. Open **[http://localhost:3000/api-docs](http://localhost:3000/api-docs)** in your browser.

### 🏛️ Architecture
* Versioning:  Endpoints are namespaced under `/api/v1/` (`config/routes.rb`).
* **Specs Location:** Request specs and documentation definitions reside in `spec/requests/`.
* **Schema Output:** The compiled OpenAPI definition is stored at `swagger/v1/swagger.json`.
* **Configuration:** Managed in `spec/swagger_helper.rb`.

### 🛠️ Updating Documentation
After modifying endpoints and their RSpec tests, regenerate the schema by running:
```bash
bundle exec rake rswag:specs:swaggerize
```
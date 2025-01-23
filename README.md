# Flutter App Architecture Example

**Available in English 🇺🇸 and Portuguese 🇧🇷**

🇺🇸

This repository showcases a practical implementation of the **Flutter App Architecture**, the official architecture guide provided by Google for Flutter applications. The project is designed to demonstrate best practices for structuring a Flutter app, focusing on modularity, testability, and scalability.

---

## 📖 **Official Documentation**

For an in-depth understanding of Flutter's recommended architecture, please refer to the [official guide](https://docs.flutter.dev/app-architecture/guide).

---

## 🚀 **Getting Started**

Follow these steps to explore this example:

1. **Clone the repository**:

   ```bash
   git clone https://github.com/FlutterConcepts/app_architecture_example.git
   ```

2. **Open the project in VSCode or your preferred IDE**.

3. **Run the project**:

   - Press `F5` or run the following command to start the app:
     ```bash
     flutter run
     ```

4. **Run the tests**:
   ```bash
   flutter test
   ```

---

## 📂 **Project Structure**

The project adheres to the modular and layered architecture recommended by Google, as detailed in the [Flutter App Architecture Guide](https://docs.flutter.dev/app-architecture/guide). Below is an overview of the layers and their responsibilities:

### **Layered Architecture**

- **Presentation Layer (UI + ViewModel)**:

  - Handles user interactions and updates the UI based on state changes.
  - Interacts with the `Application Layer` to execute business logic.
  - Uses Flutter’s state management solutions, such as `ChangeNotifier`, `ValueNotifier`, or third-party tools like `Bloc`.

- **Application Layer (Use Cases)**:

  - Encapsulates the business logic of the application.
  - Acts as the intermediary between the `Presentation Layer` and the `Data Layer`.
  - Defines **Use Cases** to represent the core functionalities of the app.

- **Data Layer**:
  - Manages data retrieval and persistence.
  - Responsible for interacting with APIs, databases, or other external data sources.
  - Converts raw data into entities that the `Application Layer` understands.

---

## 🔄 **Data Flow**

The architecture promotes unidirectional data flow, ensuring a predictable and maintainable codebase:

1. **User Interaction**:

   - A user triggers an action in the `Presentation Layer` (e.g., clicking a button).

2. **Business Logic**:

   - The `Application Layer` processes the request using a `Use Case`.

3. **Data Retrieval**:

   - The `Data Layer` fetches the required data from an API or database.

4. **State Update**:

   - The `Application Layer` processes the data and updates the state.

5. **UI Update**:
   - The `Presentation Layer` listens for state changes and updates the user interface.

---

## 🎨 **Simplified Layer Diagram**

```
Presentation Layer
    ↓
Application Layer
    ↓
Data Layer
```

---

## 💡 **Key Features**

- **Modularity**:

  - Each layer is independently testable and follows the separation of concerns principle.

- **Scalability**:

  - The architecture is designed to handle large, complex applications by enforcing clear boundaries between layers.

- **Testability**:
  - Unit tests are focused on `Use Cases` and `Data Sources`, while integration and widget tests ensure the overall app functionality.

---

## 🧪 **Testing Strategy**

- **Unit Tests**:

  - Test individual `Use Cases` and `Data Sources`.

- **Widget Tests**:

  - Verify the functionality of UI components.

- **Integration Tests**:
  - Ensure the app works as expected when all parts are integrated.

Run all tests with:

```bash
flutter test
```

---

## 💡 **How to Contribute**

Contributions are very welcome! Feel free to open issues or pull requests to improve this example.

---

🇧🇷

Este repositório demonstra uma implementação prática da **Flutter App Architecture**, o guia oficial de arquitetura da Google para aplicativos Flutter. O projeto é projetado para demonstrar as melhores práticas para estruturar um app Flutter, com foco em modularidade, testabilidade e escalabilidade.

---

## 📖 **Documentação Oficial**

Para um entendimento aprofundado da arquitetura recomendada pelo Flutter, consulte o [guia oficial](https://docs.flutter.dev/app-architecture/guide).

---

## 🚀 **Começando**

Siga os passos abaixo para explorar este exemplo:

1. **Clone o repositório**:

   ```bash
   git clone https://github.com/FlutterConcepts/app_architecture_example.git
   ```

2. **Abra o projeto no VSCode ou na IDE de sua preferência**.

3. **Execute o projeto**:

   - Pressione `F5` ou execute o seguinte comando:
     ```bash
     flutter run
     ```

4. **Execute os testes**:
   ```bash
   flutter test
   ```

---

## 📂 **Estrutura do Projeto**

O projeto segue a arquitetura modular e em camadas recomendada pela Google, conforme detalhado no [guia oficial de arquitetura do Flutter](https://docs.flutter.dev/app-architecture/guide). Abaixo está uma visão geral das camadas e suas responsabilidades:

### **Arquitetura em Camadas**

- **Camada de Apresentação (UI + ViewModel)**:

  - Lida com interações do usuário e atualiza a interface com base em alterações de estado.
  - Interage com a `Camada de Aplicação` para executar a lógica de negócios.
  - Usa soluções de gerenciamento de estado do Flutter, como `ChangeNotifier`, `ValueNotifier` ou ferramentas de terceiros como `Bloc`.

- **Camada de Aplicação (Casos de Uso)**:

  - Encapsula a lógica de negócios da aplicação.
  - Atua como intermediária entre a `Camada de Apresentação` e a `Camada de Dados`.
  - Define os **Casos de Uso** que representam as principais funcionalidades do app.

- **Camada de Dados**:
  - Gerencia a recuperação e persistência de dados.
  - Responsável por interagir com APIs, bancos de dados ou outras fontes de dados externas.
  - Converte dados brutos em entidades que a `Camada de Aplicação` entende.

---

## 🔄 **Fluxo de Dados**

A arquitetura promove um fluxo de dados unidirecional, garantindo previsibilidade e manutenibilidade do código:

1. **Interação do Usuário**:

   - O usuário dispara uma ação na `Camada de Apresentação` (por exemplo, clicando em um botão).

2. **Lógica de Negócios**:

   - A `Camada de Aplicação` processa a solicitação usando um `Caso de Uso`.

3. **Recuperação de Dados**:

   - A `Camada de Dados` busca os dados necessários de uma API ou banco de dados.

4. **Atualização de Estado**:

   - A `Camada de Aplicação` processa os dados e atualiza o estado.

5. **Atualização da UI**:
   - A `Camada de Apresentação` ouve as alterações de estado e atualiza a interface do usuário.

---

## 🎨 **Diagrama Simplificado**

```
Camada de Apresentação
    ↓
Camada de Aplicação
    ↓
Camada de Dados
```

---

## 💡 **Recursos Principais**

- **Modularidade**:

  - Cada camada é testável independentemente e segue o princípio de separação de responsabilidades.

- **Escalabilidade**:

  - A arquitetura foi projetada para lidar com aplicativos grandes e complexos, definindo limites claros entre as camadas.

- **Testabilidade**:
  - Os testes unitários focam nos `Casos de Uso` e `Fontes de Dados`, enquanto os testes de integração e widget garantem a funcionalidade geral do app.

---

## 🧪 **Estratégia de Testes**

- **Testes Unitários**:

  - Testam `Casos de Uso` individuais e `Fontes de Dados`.

- **Testes de Widget**:

  - Verificam a funcionalidade de componentes de UI.

- **Testes de Integração**:
  - Garantem que o aplicativo funcione como esperado quando todas as partes estão integradas.

Execute todos os testes com:

```bash
flutter test
```

---

## 💡 **Como Contribuir**

Contribuições são muito bem-vindas! Sinta-se à vontade para abrir issues ou pull requests para melhorar este exemplo.

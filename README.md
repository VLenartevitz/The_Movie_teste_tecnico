
# 📽️ The Movie DB - Flutter App

Aplicativo desenvolvido em Flutter como teste técnico, que consome a API do [TMDB](https://www.themoviedb.org/) para listar filmes populares e realizar buscas por título. O app possui tratamento de estados com Riverpod, feedback de erro e interface responsiva.

## 🚀 Funcionalidades

- Listagem de filmes populares
- Busca de filmes por nome
- UI responsiva e moderna
- Loading e tratamento de erro
- Arquitetura com `Repository`, `Controller` e `Model`
- Gerenciamento de estado com `Riverpod`

## 🧰 Tecnologias

- Flutter 3.x
- Dart
- Riverpod
- HTTP
- TMDB API

## 📦 Dependências

As principais dependências utilizadas no projeto:

```yaml
dependencies:
  flutter:
    sdk: flutter

  flutter_riverpod: ^2.5.1
  http: ^1.2.1
  flutter_dotenv: ^5.1.0
```

> Obs.: Consulte o `pubspec.yaml` para visualizar todas as dependências com suas versões exatas.

## 📥 Instalação

1. **Clone o repositório**
```bash
git clone https://github.com/VLenartevitz/The_Movie_teste_tecnico.git
cd The_Movie_teste_tecnico
```

2. **Instale as dependências**
```bash
flutter pub get
```

3. **Crie sua conta no [TMDB](https://www.themoviedb.org/) e obtenha sua API Key**

4. **Crie o arquivo `.env` na raiz do projeto e adicione sua API Key**
```env
TMDB_API_KEY=sua_api_key_aqui
```

5. **Rode o app**
```bash
flutter run
```

> ✅ O app já está preparado para tratar estados de loading e erro. Basta ter conexão com a internet para visualizar os filmes.

## 📝 Estrutura de Pastas

```
lib/
├── models/           # Modelos de dados (Movie)
├── providers/        # Providers do Riverpod
├── repositories/     # Camada de repositório (requisições HTTP)
├── controllers/      # Camada de lógica (AsyncNotifier)
├── modules/          # Telas e componentes por módulo
└── shared/           # Componentes reutilizáveis
```

## ⚠️ Importante

Certifique-se de **não versionar o `.env`**, pois ele contém informações sensíveis. Verifique se o arquivo `.gitignore` contém a linha:

```
.env
```

## ✨ Contribuições

Sinta-se à vontade para abrir issues ou pull requests.

## 🧑‍💻 Desenvolvido por

Vinícius Lenartevitz  
[LinkedIn](https://www.linkedin.com/in/vlenartevitz)

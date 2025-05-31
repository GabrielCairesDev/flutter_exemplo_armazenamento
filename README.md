# 💾 Armazenamento Local no Flutter

Este projeto demonstra como **salvar dados localmente em Flutter** utilizando duas abordagens distintas, ideais para diferentes cenários de uso:

- [`SharedPreferences`](https://pub.dev/packages/shared_preferences): para salvar dados simples e não sensíveis, como preferências do usuário, flags, temas, etc.
- [`FlutterSecureStorage`](https://pub.dev/packages/flutter_secure_storage): para salvar dados sensíveis de forma segura e criptografada, como tokens de autenticação, senhas e dados confidenciais.

> 🧠 O projeto utiliza boas práticas de arquitetura com `ChangeNotifier`, `ViewModel`, `Service Abstraction`, e componentes reutilizáveis de feedback visual.

---

## 📚 Artigo no Medium

Para uma explicação completa com exemplos práticos, leia o artigo:

👉 [Flutter: Como salvar localmente usando SharedPreferences ou Flutter Secure Storage](https://medium.com/@gabriel.araujo.caires/flutter-como-salvar-localmente-usando-shared-preferences-ou-flutter-secure-storage-4ba349f9c8dd)

---

## 🚀 Funcionalidades

- ✅ Criar, ler, atualizar e excluir dados com `SharedPreferences`.
- 🔐 Armazenamento seguro com `FlutterSecureStorage`.
- 📦 Serviços genéricos reutilizáveis e desacoplados.
- 🧠 Gerenciamento de estado com `ChangeNotifier`.
- 🛠 Arquitetura limpa e modularizada.
- 📲 Feedback visual com SnackBars customizados.
- 💡 Pronto para testes unitários e injeção de dependência.

---

![Exemplo de armazenamento local no Flutter](https://miro.medium.com/v2/resize:fit:4800/format:webp/1*CTejC1v9tUwjj1oYiSsYvA.png)

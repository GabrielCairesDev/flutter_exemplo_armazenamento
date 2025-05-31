import 'package:flutter/material.dart';
import 'package:flutter_exemplo_armazenamento/features/presentation/flutter_secure_storage/view/secure_storage_view.dart';
import 'package:flutter_exemplo_armazenamento/features/presentation/home/presentation/view/home_view.dart';
import 'package:flutter_exemplo_armazenamento/features/presentation/shared_preferences/view/shared_preferences_view.dart';

// Classe responsável por definir e organizar as rotas nomeadas do aplicativo.
// Isso ajuda a centralizar a navegação e facilita a manutenção e escalabilidade do app.
class AppRoutes {
  // Constantes para os caminhos das rotas. Usar constantes evita erros de digitação e facilita refatorações.
  static const String home = '/home';
  static const String sharedPrefs = '/sharedPrefs';
  static const String secureStorage = '/secureStorage';

  // Mapa de rotas que associa os caminhos a seus respectivos builders de tela (widgets).
  // Usado pelo MaterialApp.routes para definir a navegação por nome.
  static Map<String, WidgetBuilder> get routes => {
    // Rota principal ou inicial do app, exibida ao iniciar o aplicativo.
    home: (context) => HomeView(),

    // Rota para a tela que demonstra o uso de SharedPreferences (armazenamento local simples).
    sharedPrefs: (context) => const SharedPreferencesView(),

    // Rota para a tela que demonstra o uso de Secure Storage (armazenamento seguro, criptografado).
    secureStorage: (context) => const SecureStorageView(),
  };
}

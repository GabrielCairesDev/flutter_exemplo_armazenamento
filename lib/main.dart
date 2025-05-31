import 'package:flutter/material.dart';
import 'package:flutter_exemplo_armazenamento/app/config/app_config.dart';

// Função principal (entry point) da aplicação Flutter.
// O Flutter executa este método ao iniciar o app.
void main() {
  // runApp é a função que inicializa o widget tree do Flutter.
  // Neste caso, o widget raiz é AppConfig.
  runApp(const AppConfig());
}

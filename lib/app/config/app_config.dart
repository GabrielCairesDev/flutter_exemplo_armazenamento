import 'package:flutter/material.dart';
import 'package:flutter_exemplo_armazenamento/app/routes/app_routes.dart';
import 'package:flutter_exemplo_armazenamento/features/presentation/home/presentation/view/home_view.dart';

// Define uma classe AppConfig que estende StatelessWidget, usada para configurar o MaterialApp da aplicação.
// Essa classe encapsula a configuração principal do app, como título, rota inicial e o mapa de rotas.
class AppConfig extends StatelessWidget {
  // Construtor constante para permitir otimizações de compilação em tempo de compilação.
  const AppConfig({super.key});

  @override
  Widget build(BuildContext context) {
    // Retorna um widget MaterialApp que é o ponto de entrada para o app Flutter baseado em Material Design.
    return MaterialApp(
      // Define o título da aplicação, usado em algumas plataformas (como Android) para identificar o app.
      title: 'Flutter Demo',

      // Define o widget inicial da aplicação, que será exibido quando o app for carregado.
      home: HomeView(),

      // Define o mapa de rotas nomeadas que podem ser usadas para navegação dentro do app.
      // AppRoutes.routes deve ser um Map<String, WidgetBuilder>
      routes: AppRoutes.routes,
    );
  }
}

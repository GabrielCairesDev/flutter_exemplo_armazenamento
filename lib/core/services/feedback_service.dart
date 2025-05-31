import 'package:flutter/material.dart';

// Interface abstrata que define um serviço de feedback visual ao usuário.
// Neste caso, o método showMessage é responsável por exibir uma mensagem,
// como uma snackbar, dialog, toast, etc.
// Isso permite desacoplar a lógica de apresentação de mensagens da implementação específica.
abstract class FeedbackService {
  // Exibe uma mensagem genérica para o usuário.
  // Pode ser usada tanto para mensagens de erro quanto de sucesso/informação.
  // Parâmetro opcional 'isError' altera o estilo da apresentação.
  void showMessage(
    BuildContext context,
    String message, {
    bool isError = false,
  });
}

// Implementação concreta da interface FeedbackService usando SnackBar para exibir mensagens.
// Utiliza o ScaffoldMessenger do Flutter para apresentar uma snackbar na tela.
class SnackbarFeedbackService implements FeedbackService {
  @override
  void showMessage(
    BuildContext context,
    String message, {
    bool isError = false,
  }) {
    // Cria uma SnackBar com o conteúdo da mensagem e cor de fundo baseada no tipo de feedback.
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: isError ? Colors.red : Colors.indigoAccent,
    );

    // Usa o ScaffoldMessenger para mostrar a snackbar no contexto atual da interface.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

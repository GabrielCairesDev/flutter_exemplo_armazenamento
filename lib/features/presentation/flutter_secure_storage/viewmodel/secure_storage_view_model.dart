import 'package:flutter/material.dart';
import 'package:flutter_exemplo_armazenamento/core/services/feedback_service.dart';
import 'package:flutter_exemplo_armazenamento/core/services/secure_storage/secure_storage_helper.dart';

// ViewModel responsável por gerenciar a lógica de interação com o armazenamento seguro
// e pelo estado associado, seguindo o padrão ChangeNotifier do Flutter.
// Ideal para ser usado com Provider, Riverpod ou qualquer solução reativa.
class SecureStorageViewModel extends ChangeNotifier {
  // Dependência concreta responsável por acessar o armazenamento seguro.
  final SecureStorageHelper _storageHelper = SecureStorageHelper();

  // Serviço de feedback visual que exibe mensagens ao usuário (via SnackBar, neste caso).
  final SnackbarFeedbackService _feedbackService = SnackbarFeedbackService();

  // Controlador para capturar o valor inserido pelo usuário.
  final TextEditingController textEditingController = TextEditingController();

  // Chave usada para identificar o valor salvo no storage.
  final String _key = 'exemplo_secure_storage';

  // Valor armazenado internamente. Pode ser nulo se não houver nada salvo.
  String? _secureValue;

  // Getter público que fornece uma string legível ao consumidor da ViewModel.
  String get value => _secureValue ?? 'Nenhum valor salvo';

  // Cria um novo valor no armazenamento seguro. Se já existir, lança exceção.
  Future<void> create(BuildContext context) async {
    try {
      final existingValue = await _storageHelper.read(_key);
      if (existingValue != null) {
        throw Exception('Já existe um valor para essa chave.');
      }
      await _storageHelper.create(_key, textEditingController.text);
      _secureValue = textEditingController.text;

      // Exibe feedback visual apenas se o contexto estiver montado (evita erros após navegação).
      if (context.mounted) {
        _feedbackService.showMessage(context, 'Valor salvo com sucesso!');
      }
      notifyListeners(); // Notifica a UI para atualizar-se.
    } catch (e) {
      if (context.mounted) {
        _feedbackService.showMessage(context, _parseError(e), isError: true);
      }
    }
  }

  // Lê o valor do armazenamento seguro e atualiza o estado interno.
  Future<void> read(BuildContext context) async {
    try {
      final stored = await _storageHelper.read(_key);
      if (stored == null) {
        throw Exception('Nenhum dado encontrado.');
      }
      _secureValue = stored;
      if (context.mounted) {
        _feedbackService.showMessage(context, 'Valor lido com sucesso!');
      }
      notifyListeners();
    } catch (e) {
      if (context.mounted) {
        _feedbackService.showMessage(context, _parseError(e), isError: true);
      }
    }
  }

  // Atualiza o valor existente no armazenamento seguro.
  Future<void> update(BuildContext context) async {
    try {
      final existingValue = await _storageHelper.read(_key);
      if (existingValue == null) {
        throw Exception('Nenhum valor salvo para atualizar.');
      }
      await _storageHelper.update(_key, textEditingController.text);
      _secureValue = textEditingController.text;
      if (context.mounted) {
        _feedbackService.showMessage(context, 'Valor atualizado com sucesso!');
      }
      notifyListeners();
    } catch (e) {
      if (context.mounted) {
        _feedbackService.showMessage(context, _parseError(e), isError: true);
      }
    }
  }

  // Deleta o valor associado à chave no armazenamento seguro.
  Future<void> delete(BuildContext context) async {
    try {
      final existingValue = await _storageHelper.read(_key);
      if (existingValue == null) {
        throw Exception('Nenhum valor salvo para deletar.');
      }
      await _storageHelper.delete(_key);
      _secureValue = '';
      if (context.mounted) {
        _feedbackService.showMessage(context, 'Valor deletado com sucesso!');
      }
      notifyListeners();
    } catch (e) {
      if (context.mounted) {
        _feedbackService.showMessage(context, _parseError(e), isError: true);
      }
    }
  }

  // Função auxiliar que limpa o prefixo da exceção para mostrar mensagens amigáveis.
  String _parseError(Object e) {
    return e.toString().replaceFirst('Exception: ', '');
  }
}

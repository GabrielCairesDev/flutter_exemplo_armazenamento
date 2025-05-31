import 'package:flutter/material.dart';
import 'package:flutter_exemplo_armazenamento/core/services/feedback_service.dart';
import 'package:flutter_exemplo_armazenamento/core/services/shared_prefs/shared_prefs_helper.dart';

// ViewModel responsável pela manipulação do armazenamento local usando SharedPreferences.
// Usa ChangeNotifier para notificar a UI sobre mudanças de estado.
// Ideal para ser consumido com Provider, ChangeNotifierProvider, etc.
class SharedPreferencesViewModel extends ChangeNotifier {
  // Implementação concreta do serviço de armazenamento usando SharedPreferences.
  final SharedPrefsHelper _prefsHelper = SharedPrefsHelper();

  // Serviço de feedback visual baseado em SnackBar.
  final SnackbarFeedbackService _feedbackService = SnackbarFeedbackService();

  // Controlador para entrada de texto do usuário, geralmente vinculado a um TextField.
  final TextEditingController textEditingController = TextEditingController();

  // Chave fixa usada para salvar/recuperar dados no SharedPreferences.
  final String _key = 'exemplo_shared_preferences';

  // Valor atual salvo na memória, carregado a partir do SharedPreferences.
  String? _sharedPreferenceValue;

  // Getter exposto para a UI que fornece uma string amigável.
  String get value => _sharedPreferenceValue ?? 'Nenhum valor salvo';

  // Cria um valor no SharedPreferences, se ainda não existir.
  Future<void> create(BuildContext context) async {
    try {
      final existingValue = await _prefsHelper.read(_key);
      if (existingValue != null) {
        throw Exception('Já foi criado um valor para essa chave.');
      }

      await _prefsHelper.create(_key, textEditingController.text);
      _sharedPreferenceValue = textEditingController.text;

      if (context.mounted) {
        _feedbackService.showMessage(context, 'Valor criado com sucesso!');
      }

      notifyListeners(); // Atualiza a UI
    } catch (e) {
      if (context.mounted) {
        _feedbackService.showMessage(context, _parseError(e), isError: true);
      }
    }
  }

  // Lê um valor salvo no SharedPreferences.
  Future<void> read(BuildContext context) async {
    try {
      final stored = await _prefsHelper.read(_key);
      if (stored == null) {
        throw Exception('Nenhum dado foi encontrado para exibição.');
      }

      _sharedPreferenceValue = stored;

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

  // Atualiza um valor existente no SharedPreferences.
  Future<void> update(BuildContext context) async {
    try {
      final existingValue = await _prefsHelper.read(_key);
      if (existingValue == null) {
        throw Exception('Não há valor salvo para atualizar.');
      }

      await _prefsHelper.update(_key, textEditingController.text);
      _sharedPreferenceValue = textEditingController.text;

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

  // Deleta o valor associado à chave no SharedPreferences.
  Future<void> delete(BuildContext context) async {
    try {
      final existingValue = await _prefsHelper.read(_key);
      if (existingValue == null) {
        throw Exception('Não há valor salvo para remover.');
      }

      await _prefsHelper.delete(_key);
      _sharedPreferenceValue = '';

      notifyListeners(); // Atualiza a UI para refletir a exclusão
    } catch (e) {
      if (context.mounted) {
        _feedbackService.showMessage(context, _parseError(e), isError: true);
      }
    }
  }

  // Método auxiliar que remove o prefixo da exceção para mostrar uma mensagem limpa.
  String _parseError(Object e) {
    return e.toString().replaceFirst('Exception: ', '');
  }
}

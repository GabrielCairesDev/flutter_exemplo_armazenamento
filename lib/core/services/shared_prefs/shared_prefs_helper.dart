import 'package:shared_preferences/shared_preferences.dart';
import 'shared_prefs_service.dart';

// Implementa a interface SharedPrefsService, que define as operações básicas de CRUD
// para armazenamento local simples usando SharedPreferences.
// Ideal para armazenar dados não sensíveis (como flags, configurações ou cache leve).
class SharedPrefsHelper implements SharedPrefsService {
  // Cria um novo valor com a chave especificada.
  // Se a chave já existir, o valor será sobrescrito.
  @override
  Future<void> create(String key, String value) async {
    final prefs =
        await SharedPreferences.getInstance(); // Recupera a instância de SharedPreferences
    await prefs.setString(key, value); // Salva o valor como string
  }

  // Lê o valor associado à chave fornecida.
  // Retorna null se a chave não existir.
  @override
  Future<String?> read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  // Atualiza o valor de uma chave existente.
  // Neste contexto, update é funcionalmente igual a create, pois setString sobrescreve o valor.
  @override
  Future<void> update(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  // Remove a chave e o valor do armazenamento local.
  @override
  Future<void> delete(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'secure_storage_service.dart';

// Implementa a interface SecureStorageService, que define a abstração para operações de armazenamento seguro.
// Isso facilita a troca da implementação ou a realização de testes com mocks ou fakes.
class SecureStorageHelper implements SecureStorageService {
  // Instância do FlutterSecureStorage para realizar operações criptografadas no armazenamento seguro.
  // Essa biblioteca utiliza Keychain (iOS) e Keystore (Android) para segurança nativa.
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // Cria um novo par chave/valor no armazenamento seguro.
  // Se a chave já existir, o valor será sobrescrito.
  @override
  Future<void> create(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  // Lê o valor armazenado associado à chave fornecida.
  // Retorna null se a chave não existir.
  @override
  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  // Atualiza o valor de uma chave existente.
  // O método write do FlutterSecureStorage serve tanto para criar quanto para atualizar.
  @override
  Future<void> update(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  // Remove a chave e o valor associados do armazenamento seguro.
  @override
  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }
}

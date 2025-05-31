// Define um contrato (interface abstrata) para serviços de armazenamento seguro.
// Essa abstração permite desacoplar a lógica de armazenamento da implementação concreta,
// facilitando testes, manutenção e possíveis mudanças tecnológicas futuras.
abstract class SecureStorageService {
  // Cria um novo item no armazenamento seguro com a chave e valor fornecidos.
  // Se a chave já existir, pode sobrescrever (dependendo da implementação).
  Future<void> create(String key, String value);

  // Lê e retorna o valor associado à chave fornecida.
  // Retorna null se a chave não for encontrada.
  Future<String?> read(String key);

  // Atualiza o valor de uma chave existente.
  // Em algumas implementações, isso pode ser idêntico ao método `create`.
  Future<void> update(String key, String value);

  // Remove do armazenamento seguro a chave (e seu valor) fornecida.
  Future<void> delete(String key);
}

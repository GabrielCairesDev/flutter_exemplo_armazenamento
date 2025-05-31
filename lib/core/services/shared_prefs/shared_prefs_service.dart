// Interface abstrata que define um contrato para manipulação de dados
// no armazenamento local com SharedPreferences.
// Permite a criação de implementações que seguem o princípio da inversão de dependência (DIP - SOLID),
// facilitando testes e a manutenção do código.
abstract class SharedPrefsService {
  // Cria ou define um valor associado a uma chave no armazenamento local.
  // Se a chave já existir, o valor será sobrescrito.
  Future<void> create(String key, String value);

  // Recupera o valor associado a uma chave.
  // Retorna null caso a chave não exista.
  Future<String?> read(String key);

  // Atualiza o valor associado a uma chave existente.
  // Normalmente, pode reutilizar a lógica de create.
  Future<void> update(String key, String value);

  // Remove a chave (e o valor) do armazenamento local.
  Future<void> delete(String key);
}

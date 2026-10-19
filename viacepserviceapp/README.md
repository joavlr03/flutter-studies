# 📍 Consulta ViaCEP

Aplicação desenvolvida em **Flutter** para consultar endereços brasileiros utilizando a API pública do **ViaCEP**.

## 📱 Funcionalidades

- Consulta de endereço por CEP.
- Validação para aceitar apenas números.
- Exibição de:
  - Logradouro
  - Bairro
  - Cidade
  - Estado (UF)
- Tratamento de CEP inválido ou não encontrado.
- Botão para limpar a consulta.
- Interface responsiva utilizando Material 3.

---

## 📸 Tela da aplicação




<img width="504" height="693" alt="Captura de tela 2026-08-06 212032" src="https://github.com/user-attachments/assets/3f839866-2b23-4264-8df5-d05c593edfa6" />

<img width="496" height="696" alt="Captura de tela 2026-08-06 212023" src="https://github.com/user-attachments/assets/ddaba7ba-4d33-4d86-9e8f-ee97bf86871b" />




## 🚀 Tecnologias utilizadas

- Flutter
- Dart
- Material 3
- HTTP
- API ViaCEP

---

## 📂 Estrutura do projeto

```
lib/
│
├── components/
│   └── endereco_card.dart
│
├── data/
│   └── viacep_service.dart
│
├── model/
│   └── endereco.dart
│
├── screens/
│   └── home_screen.dart
│
├── main.dart
```

---

## 🌐 API utilizada

A aplicação consome a API pública do ViaCEP.

Endpoint utilizado:

```
https://viacep.com.br/ws/{CEP}/json/
```

Exemplo:

```
https://viacep.com.br/ws/01001000/json/
```

---

## ▶️ Como executar

### Clone o repositório

```bash
git clone https://github.com/seu-usuario/viacepserviceapp.git
```

### Entre na pasta

```bash
cd viacepserviceapp
```

### Instale as dependências

```bash
flutter pub get
```

### Execute o projeto

```bash
flutter run
```

---

## 📦 Dependências

Exemplo do `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter

  http: ^1.2.0
```

---

## 💡 Como utilizar

1. Digite um CEP com 8 números.
2. Clique em **Consultar CEP**.
3. Aguarde o retorno da API.
4. O endereço será exibido na tela.

Caso o CEP seja inválido ou inexistente, uma mensagem de erro será apresentada.

---

## 🛠️ Melhorias futuras

- Histórico de consultas.
- Consulta automática ao digitar o CEP.
- Compartilhamento do endereço.
- Copiar endereço para a área de transferência.
- Modo escuro.
- Testes unitários.
- Cache das consultas.

---

## 📄 Licença

Este projeto é distribuído sob a licença MIT.

---

## 👨‍💻 Autor

Desenvolvido como projeto de estudo utilizando Flutter e a API ViaCEP.

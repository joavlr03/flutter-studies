# 🕹️ JoKenPokemonApp

Um aplicativo mobile desenvolvido em **Flutter** que recria o clássico
jogo **Jokenpô (Pedra, Papel e Tesoura)** utilizando personagens do
universo Pokémon.

Neste jogo, o usuário escolhe um Pokémon para batalhar contra o
computador. Cada Pokémon representa uma jogada do Jokenpô:

-   🔥 **Charmander** vence **Bulbasaur**
-   🌱 **Bulbasaur** vence **Squirtle**
-   💧 **Squirtle** vence **Charmander**

O aplicativo sorteia automaticamente a escolha do computador e exibe o
resultado da batalha na tela.

------------------------------------------------------------------------

# 📱 Demonstração do jogo

Fluxo básico do aplicativo:

1.  O jogador escolhe um Pokémon.
2.  O computador escolhe um Pokémon aleatoriamente.
3.  O sistema compara as escolhas.
4.  O resultado da batalha é exibido.
5.  O placar é atualizado.

------------------------------------------------------------------------

# 🚀 Funcionalidades

-   Escolha de Pokémon para batalhar
-   Escolha aleatória do computador
-   Sistema de regras estilo **Jokenpô**
-   Exibição visual da batalha
-   Resultado colorido (vitória, derrota ou empate)
-   Placar de pontos entre jogador e computador
-   Botão para reiniciar o placar
-   Interface inspirada no universo Pokémon

------------------------------------------------------------------------

# 🧩 Tecnologias utilizadas

-   **Flutter**
-   **Dart**
-   Material Design
-   Widgets Stateless e Stateful
-   Gerenciamento de estado com `setState`

Flutter é um framework desenvolvido pela Google para criação de
aplicações multiplataforma a partir de um único código‑fonte.

------------------------------------------------------------------------

# 📂 Estrutura do projeto

    lib/
     ├── main.dart
     ├── widgets/
     │   ├── battle_arena
     │   ├── pokemon_card
     │   ├── scoreboard
     │   └── pokemon_footer
    images/
     ├── charmander.png
     ├── bulbasaur.png
     ├── squirtle.png
     ├── pokeball_selected.png
     └── pokeball_unselected.png

------------------------------------------------------------------------

# ▶️ Como executar o projeto

### 1️⃣ Instalar o Flutter

Certifique-se de ter o **Flutter SDK** instalado.

Verifique com:

``` bash
flutter doctor
```

------------------------------------------------------------------------

### 2️⃣ Clonar o repositório

``` bash
git clone https://github.com/joavlr03/JokenPokemonApp.git
```

------------------------------------------------------------------------

### 3️⃣ Acessar a pasta do projeto

``` bash
cd JokenPokemonApp
```

------------------------------------------------------------------------

### 4️⃣ Instalar as dependências

``` bash
flutter pub get
```

------------------------------------------------------------------------

### 5️⃣ Executar o aplicativo

``` bash
flutter run
```

Você pode executar o app em:

-   Android Emulator
-   Dispositivo Android físico
-   iOS Simulator
-   Web (Chrome)

------------------------------------------------------------------------

# 🎮 Regras do jogo

  Jogador         Computador      Resultado
  --------------- --------------- -----------
  Charmander      Bulbasaur       Vitória
  Bulbasaur       Squirtle        Vitória
  Squirtle        Charmander      Vitória
  Mesmo Pokémon   Mesmo Pokémon   Empate

------------------------------------------------------------------------

# 👨‍💻 Autor

Projeto desenvolvido para fins de aprendizado em **Flutter e
desenvolvimento mobile**.


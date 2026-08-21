🎮 Quem é Esse Pokémon?

Acesse em:
https://joavlr03.github.io/quem_eh_esse_pokemon/


Um aplicativo de quiz desenvolvido em Flutter no qual o jogador precisa descobrir qual Pokémon está sendo apresentado.

📱 Sobre o projeto

Quem é Esse Pokémon? é um jogo de perguntas e respostas baseado no universo Pokémon.

O objetivo é identificar corretamente o Pokémon apresentado e acumular pontos ao longo da partida.

✨ Funcionalidades
🎯 Quiz de Pokémon
🖼️ Exibição de Pokémon para identificação
✅ Verificação das respostas
🏆 Sistema de pontuação
🔄 Possibilidade de jogar novamente
📱 Interface desenvolvida com Flutter
🌐 Suporte para Web
🎨 Interface inspirada no universo Pokémon
🛠️ Tecnologias
Flutter
Dart
Material Design
📋 Pré-requisitos

Para executar o projeto, você precisa ter instalado:

Flutter
Dart SDK
Chrome, Android Studio ou outro ambiente compatível

Verifique se o Flutter está configurado corretamente:

flutter doctor

🚀 Instalação

Clone o repositório:

git clone <URL_DO_REPOSITORIO>


Entre na pasta:

cd quem_e_esse_pokemon


Instale as dependências:

flutter pub get

▶️ Executando o projeto

Para executar normalmente:

flutter run


Para executar no Chrome:

flutter run -d chrome

📂 Estrutura do projeto
quem_e_esse_pokemon/
├── android/
├── ios/
├── lib/
│   ├── main.dart
│   ├── screens/
│   ├── widgets/
│   ├── models/
│   └── services/
├── test/
├── web/
├── pubspec.yaml
└── README.md


A estrutura pode mudar conforme o desenvolvimento do projeto.

🎨 Tema

O projeto utiliza o sistema de temas do Flutter.

Caso seja utilizado um tema personalizado, ele pode ser organizado da seguinte maneira:

lib/
└── theme/
    └── app_theme.dart


Nesse caso, o main.dart pode utilizar:

theme: AppTheme.light,
darkTheme: AppTheme.dark,


É necessário que a classe AppTheme esteja definida e corretamente importada.

🧪 Testes

Execute os testes com:

flutter test


Para verificar problemas no código:

flutter analyze

🌐 Build para Web

Para gerar a versão Web:

flutter build web


Os arquivos serão gerados em:

build/web/

📦 Build para Android

Para gerar um APK:

flutter build apk

🔧 Solução de problemas

Se o projeto apresentar erros após alterações ou atualizações das dependências, execute:

flutter clean
flutter pub get
flutter run


Caso apareça um erro relacionado a AppTheme, verifique se a classe existe e se o arquivo correspondente foi importado.

Por exemplo:

import 'theme/app_theme.dart';

🗺️ Próximos passos
 Adicionar mais Pokémon
 Criar diferentes níveis de dificuldade
 Adicionar sistema de vidas
 Adicionar cronômetro
 Melhorar o sistema de pontuação
 Criar ranking
 Adicionar efeitos sonoros
 Adicionar animações
 Criar modo claro e escuro
 Adicionar tela inicial
 Adicionar tela de resultados
 Integrar com uma API de Pokémon
 Adicionar persistência dos recordes
🤝 Contribuição

Contribuições são bem-vindas!

Faça um fork do projeto.
Crie uma nova branch:
git checkout -b minha-feature

Faça suas alterações.
Execute os testes:
flutter test

Faça o commit:
git commit -m "Adiciona nova funcionalidade"

Envie a branch:
git push origin minha-feature

Abra um Pull Request.
📄 Licença

Este projeto pode ser distribuído sob a licença definida pelo autor do repositório.

Pokémon e suas respectivas marcas, personagens e imagens pertencem aos seus respectivos detentores de direitos. Este projeto é destinado a fins educacionais e de desenvolvimento de software.


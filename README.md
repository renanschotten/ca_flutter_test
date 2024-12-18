# Conta Azul - Flutter Test

## Considerações iniciais

Esse projeto foi desenvolvido e validado apenas em Android devido a indisponibilidade de acesso ao sistema macOS.

### O que foi utilizado

Para o desenvolvimento desse desafio, foram utilizados os seguintes padrões e dependencias:

    - Arquitetura MiniCore;
    - Flutter Modular para navegação e injeção de dependência;
    - ValueNotifier para gerenciamento de estados;
    - InternetConnectionChecker para verificar a disponibilidade de internet;
    - Pacote http para requisições http;
    - FirebaseAuth para autenticação.

## Features

### Login

A autenticação é realizada utilizando o serviço FirebaseAuth com as seguintes credenciais:

    - teste@teste.com
    - !teste@1234

### Home

A HomePage lista todos os posts retornados pela API, com os estados de carregamento, falha e sucesso.

Na HomePage existem as seguintes ações:

    - Ao clicar no ListTile é redirecionado para a página de detalhes do post;
    - LabelButton na AppBar com o texto "Favoritos" navega para a página de posts favoritosç
    - IconButton de estrala no ListTile de post para favoritar ou desfavoritar o post;
    - FloatingActionButton navega para a página de buscar post por ID.

## Imagens

### Splash

<img src="./assets/app_images/splash.png" width="300" height="200">

### Login

![Login](./assets/app_images/login1.png)
![Login](./assets/app_images/login2.png)
![Login](./assets/app_images/login3.png)

### Home

![Home](./assets/app_images/home1.png)
![Home](./assets/app_images/home2.png)
![Home](./assets/app_images/home3.png)
![Home](./assets/app_images/home4.png)

### Detalhes

![Detalhes](./assets/app_images/detalhes1.png)
![Detalhes](./assets/app_images/detalhes2.png)

### Posts Favoritos

![Favoritos](./assets/app_images/favoritos1.png)
![Favoritos](./assets/app_images/favoritos2.png)

### Post não encontrado

![Post nao encontrado](./assets/app_images/post_nao_encontrado.png)

### Sem conexão

![Sem internet](./assets/app_images/sem_internet.png)

### Procurar post

![Procurar post](./assets/app_images/procurarpost1.png)
![Procurar post](./assets/app_images/procurarpost2.png)

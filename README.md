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

<img src="./assets/app_images/splash.png" style="width:50%; height:50%;">

### Login

<img src="./assets/app_images/login1.png" style="width:50%; height:50%;">
<img src="./assets/app_images/login2.png" style="width:50%; height:50%;">
<img src="./assets/app_images/login3.png" style="width:50%; height:50%;">

### Home

<img src="./assets/app_images/home1.png" style="width:50%; height:50%;">
<img src="./assets/app_images/home2.png" style="width:50%; height:50%;">
<img src="./assets/app_images/home3.png" style="width:50%; height:50%;">
<img src="./assets/app_images/home4.png" style="width:50%; height:50%;">

### Detalhes

<img src="./assets/app_images/detalhes1.png" style="width:50%; height:50%;">
<img src="./assets/app_images/detalhes2.png" style="width:50%; height:50%;">

### Posts Favoritos

<img src="./assets/app_images/favoritos1.png" style="width:50%; height:50%;">
<img src="./assets/app_images/favoritos2.png" style="width:50%; height:50%;">

### Post não encontrado

<img src="./assets/app_images/post_nao_encontrado.png" style="width:50%; height:50%;">

### Sem conexão

<img src="./assets/app_images/sem_internet.png" style="width:50%; height:50%;">

### Procurar post

<img src="./assets/app_images/procurarpost1.png" style="width:50%; height:50%;">
<img src="./assets/app_images/procurarpost2.png" style="width:50%; height:50%;">

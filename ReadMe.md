# Regras de Negócio

As regras de negócio descritas abaixo definem as restrições estruturais, operacionais e de integridade do banco de dados da plataforma de distribuição digital de jogos:

1. **Unicidade de Conta do Usuário (`USUARIO`):** Cada usuário cadastrado na plataforma deve possuir um `nickname` e um `email` exclusivos, não sendo permitido que dois usuários compartilhem o mesmo apelido ou endereço de e-mail.
2. **Controle Financeiro da Carteira (`USUARIO`):** O saldo da carteira digital do usuário (`saldo_carteira`) inicia em zero (`0.00`) no momento do cadastro e nunca pode assumir valores negativos.
3. **Vínculo Obrigatório com Empresa Desenvolvedora (`EMPRESA` e `JOGO`):** Todo jogo publicado no catálogo deve estar obrigatoriamente associado a uma única empresa desenvolvedora (`id_empresa`), enquanto uma mesma empresa pode desenvolver diversos jogos.
4. **Classificação por Gêneros (`JOGO` e `GENERO`):** Um jogo pode ser classificado em vários gêneros simultaneamente (ex: Ação, RPG, Indie) e um gênero pode agrupar múltiplos jogos, devendo cada jogo possuir ao menos um gênero vinculado (`JOGO_GENERO`).
5. **Hierarquia entre Jogo Base e DLC (`JOGO` — Autorrelacionamento):** Um jogo pode ser cadastrado como título principal (`id_jogo_base` nulo) ou como conteúdo adicional/DLC (`id_jogo_base` preenchido), caso em que deve referenciar obrigatoriamente um jogo base já existente no catálogo.
6. **Dependência Existencial de Conquistas (`JOGO` e `CONQUISTA` — Entidade Fraca):** Cada conquista pertence exclusivamente a um único jogo e é identificada em conjunto com ele (`id_jogo`, `id_conquista`); caso o jogo seja excluído do sistema, todas as suas conquistas são removidas automaticamente.
7. **Posse Única na Biblioteca e Histórico de Preço (`USUARIO`, `JOGO` e `BIBLIOTECA`):** Um usuário pode adquirir cada jogo apenas uma vez para sua biblioteca pessoal, registrando a data da compra (`data_compra`) e o valor efetivamente pago (`preco_pago`), que permanece inalterado mesmo se o preço base do jogo (`preco_base`) sofrer alterações futuras.
8. **Avaliação Condicionada à Posse (`BIBLIOTECA`):** Um usuário só pode atribuir uma nota de avaliação (`nota_avaliacao`) a um jogo que esteja presente em sua biblioteca, sendo a avaliação opcional (valor nulo permitido) e restrita a uma escala inteira de `1` a `5`.
9. **Desbloqueio de Conquistas Condicionado à Biblioteca (`BIBLIOTECA`, `CONQUISTA` e `USUARIO_CONQUISTA`):** Um usuário só pode desbloquear conquistas referentes a jogos que já possua em sua biblioteca, podendo registrar cada conquista de um mesmo jogo no máximo uma única vez.
10. **Cálculo Dinâmico de Métricas Derivadas (`JOGO` e `USUARIO`):** A nota média de um jogo (`nota_media`) e a pontuação total de experiência de um usuário (`xp_total`) não são informadas manualmente, sendo obtidas dinamicamente a partir da média das avaliações registradas na biblioteca e da soma dos `pontos_xp` das conquistas desbloqueadas, respectivamente.

# Iniciar o projeto

#### Subir o container

- docker compose up -d

#### Parar o container

- docker compose down

#### Ver os containers up

- docker compose ps

#### Logs

- docker compose logs -f mysql

#### Acessar o banco via terminal

- docker compose exec mysql mysql -u bcd_app -p bcd_projeto_final

#### Ver as tabelas

- SHOW TABLES;
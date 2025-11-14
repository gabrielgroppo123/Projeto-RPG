# 🏰 RPG Console em Swift

---

## 📝 Sobre o jogo
Este é um jogo de RPG em modo console, criado na linguagem Swift.  
Você controla um personagem que pode ser um **Bárbaro 🪓**, **Espadachim 🗡️** ou **Arqueiro 🏹**, cada um com atributos diferentes de vida e dano.  

O objetivo do jogo é **explorar batalhas**, **coletar ouro e equipamentos**, **evoluir seu personagem** e **sobreviver a inimigos cada vez mais desafiadores**.  

Durante o jogo, você pode:  
- **Lutar contra inimigos 🐉**: monstros aleatórios surgem com níveis diferentes e podem se tornar chefes (bosses).  
- **Gerenciar inventário 🎒**: coletar e equipar armas e armaduras para melhorar suas estatísticas.  
- **Comprar itens na loja 🏪**: adquira armas, armaduras ou poções para fortalecer seu personagem.  
- **Acompanhar status 📊**: visualize vida, dano total, defesa e ouro acumulado a qualquer momento.  
- **Sobreviver e renascer ⚡**: se o personagem morrer, ele volta à vida com a vida cheia, mas perde todo o ouro, mantendo o desafio do jogo.

---

## 🎯 Como jogar
Para jogar, siga estes passos detalhados:  

1. **Abrir o jogo**: abra o arquivo `main.swift` em um compilador Swift ou ambiente compatível (como Xcode ou algum compilador online).  
2. **Executar o programa**: inicie a execução do código e acompanhe as instruções que aparecerão no console.  
3. **Escolher o nome do personagem**: você poderá digitar o nome que quiser para o seu herói. Se não digitar nada, o nome padrão será "Herói".  
4. **Escolher a classe do personagem**:  
   - **Bárbaro 🪓**: mais vida, menos dano; ideal para quem quer resistir a muitos ataques.  
   - **Espadachim 🗡️**: equilíbrio entre vida e dano; bom para quem quer um estilo versátil.  
   - **Arqueiro 🏹**: menos vida, mais dano; perfeito para ataques rápidos e estratégicos.  
5. **Interagir com o menu principal**:  
   - **Batalhar ⚔️**: enfrente inimigos que aparecem aleatoriamente. Alguns inimigos podem ser chefes (bosses) mais fortes.  
   - **Inventário 🎒**: visualize itens coletados e equipe armas ou armaduras para aumentar seu dano e defesa.  
   - **Loja 🏪**: compre novas armas, armaduras ou poções usando o ouro que você ganha nas batalhas.  
   - **Status 📈**: confira detalhadamente a vida, dano total, defesa, ouro e equipamentos do seu personagem.  
   - **Sair 🚪**: encerre o jogo quando quiser.  
6. **Batalhas e estratégia**: durante os combates, você atacará os inimigos e receberá ataques de volta. Use poções para recuperar vida e planeje qual item equipar para maximizar suas chances de vitória.  
7. **Morte e renascimento ⚡**: se seu personagem morrer, ele renasce com a vida cheia, mas perde todo o ouro. O inimigo que matou você continuará esperando para que você possa enfrentá-lo novamente.  


---

## 🔧 Como o código funciona
O código é organizado de forma simples e didática, usando conceitos básicos de Swift. Aqui está uma explicação detalhada de cada parte:  

1. **Variáveis e dicionários**: armazenam informações sobre o personagem (vida, dano, classe, ouro), itens (armas, armaduras, poções) e inimigos (nome, vida, dano, se é chefe).  
2. **Funções**: cada ação do jogo é organizada em funções, como:  
   - `batalhar()`: realiza o combate com inimigos, calcula danos e verifica se o personagem ou o inimigo morreu.  
   - `abrirLoja()`: mostra os itens disponíveis, permite comprar armas, armaduras e poções.  
   - `mostrarInventario()` e `equiparItem()`: exibem e permitem equipar os itens que o jogador possui.  
   - `mostrarStatus()`: imprime todas as estatísticas do personagem no console.  
3. **Laços de repetição e condicionais**: o menu principal é exibido em loop até o jogador escolher sair, permitindo múltiplas ações. Condicionais são usadas para verificar escolhas válidas do jogador e para definir o resultado de combates.  
4. **Randomização**: inimigos e algumas recompensas são gerados aleatoriamente. Isso garante que cada partida seja diferente, com inimigos e níveis variados.  
5. **Sistema de renascimento**: quando o personagem morre, ele renasce com a vida cheia, mas perde todo o ouro. O inimigo que matou o jogador continua esperando para que ele possa enfrentá-lo novamente, adicionando desafio ao jogo.  
6. **Integração de itens e equipamentos**: armas e armaduras adicionam valor ao dano e defesa do personagem, enquanto poções recuperam vida instantaneamente. O jogador deve decidir estrategicamente quando usar cada item.  


---

## 🧑‍💻 Sobre o autor
**Gabriel Groppo**  
Este projeto faz parte do processo seletivo da **Apple Academy** do **Centro Universitário Senac Santo Amaro**.

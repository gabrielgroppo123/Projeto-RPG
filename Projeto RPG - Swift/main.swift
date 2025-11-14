import Foundation

// ------------------------------
// ERROS PERSONALIZADOS
// ------------------------------
enum InputError: Error {
    case invalido
}

// ------------------------------
// VARIÁVEIS DO PERSONAGEM
// ------------------------------
var nome = ""
var vida = 0
var danoBase = 0
var defesaBase = 5
var ouro = 0
var classe = ""

var armaEquipada: [String: Any] = ["nome": "Punhos", "tipo": "arma", "valor": 0]
var armaduraEquipada: [String: Any] = ["nome": "Roupas Rasgadas", "tipo": "armadura", "valor": 0]
var inventario: [[String: Any]] = []

// ------------------------------
// ITENS UNIVERSAIS
// ------------------------------
let armaduras: [[String: Any]] = [
    ["nome": "Armadura de Couro", "tipo": "armadura", "valor": 2, "preco": 20],
    ["nome": "Armadura de Madeira", "tipo": "armadura", "valor": 3, "preco": 35],
    ["nome": "Armadura de Ferro", "tipo": "armadura", "valor": 5, "preco": 60],
    ["nome": "Armadura de Aço", "tipo": "armadura", "valor": 7, "preco": 100],
    ["nome": "Armadura de Ouro", "tipo": "armadura", "valor": 10, "preco": 150]
]

let pocaoDeVida: [[String: Any]] = [
    ["nome": "Poção de Vida Pequena", "tipo": "poção", "valor": 30, "preco": 50],
    ["nome": "Poção de Vida Grande", "tipo": "poção", "valor": 50, "preco": 80]
]

// ------------------------------
// LOJAS POR CLASSE (APENAS ARMAS)
// ------------------------------
let lojaBarbaro: [[String: Any]] = [
    ["nome": "Machado de Madeira", "tipo": "arma", "valor": 3, "preco": 25],
    ["nome": "Machado de Ferro", "tipo": "arma", "valor": 6, "preco": 60],
    ["nome": "Machado de Aço", "tipo": "arma", "valor": 8, "preco": 90],
    ["nome": "Machado de Ouro", "tipo": "arma", "valor": 12, "preco": 150]
]

let lojaEspadachim: [[String: Any]] = [
    ["nome": "Espada de Madeira", "tipo": "arma", "valor": 2, "preco": 20],
    ["nome": "Espada de Ferro", "tipo": "arma", "valor": 5, "preco": 50],
    ["nome": "Espada de Aço", "tipo": "arma", "valor": 7, "preco": 80],
    ["nome": "Espada de Ouro", "tipo": "arma", "valor": 10, "preco": 120]
]

let lojaLadino: [[String: Any]] = [
    ["nome": "Adaga de Ferro", "tipo": "arma", "valor": 4, "preco": 40],
    ["nome": "Adaga de Aço", "tipo": "arma", "valor": 6, "preco": 70],
    ["nome": "Adaga de Ouro", "tipo": "arma", "valor": 9, "preco": 120]
]

let lojaTemplario: [[String: Any]] = [
    ["nome": "Lança de Madeira", "tipo": "arma", "valor": 3, "preco": 25],
    ["nome": "Lança de Ferro", "tipo": "arma", "valor": 6, "preco": 60],
    ["nome": "Lança de Aço", "tipo": "arma", "valor": 8, "preco": 90],
    ["nome": "Lança de Ouro", "tipo": "arma", "valor": 12, "preco": 150]
]

let lojaArqueiro: [[String: Any]] = [
    ["nome": "Arco de Madeira", "tipo": "arma", "valor": 3, "preco": 25],
    ["nome": "Arco de Ferro", "tipo": "arma", "valor": 6, "preco": 60],
    ["nome": "Arco de Aço", "tipo": "arma", "valor": 8, "preco": 90],
    ["nome": "Crossbow de Madeira", "tipo": "arma", "valor": 5, "preco": 50],
    ["nome": "Crossbow de Ferro", "tipo": "arma", "valor": 9, "preco": 120]
]

// ------------------------------
// FUNÇÕES DE CÁLCULO
// ------------------------------
func danoTotal() -> Int { danoBase + (armaEquipada["valor"] as! Int) }
func defesaTotal() -> Int { defesaBase + (armaduraEquipada["valor"] as! Int) }

// ------------------------------
// STATUS
// ------------------------------
func mostrarStatus() {
    print("""
    
===== STATUS =====
Nome: \(nome)
Classe: \(classe)
Vida: \(vida)
Dano total: \(danoTotal())
Defesa total: \(defesaTotal())
Ouro: \(ouro)
Arma equipada: \(armaEquipada["nome"]!)
Armadura equipada: \(armaduraEquipada["nome"]!)
==================
""")
}

// ------------------------------
// ESCOLHA DE NOME
// ------------------------------
func escolherNome() {
    print("Digite o nome do seu personagem:")
    if let input = readLine(), !input.isEmpty {
        nome = input
    } else {
        nome = "Herói"
    }
}

// ------------------------------
// ESCOLHA DE CLASSE
// ------------------------------
func escolherClasse() {
    print("Escolha a classe do seu personagem:")
    print("1 - Bárbaro (Vida: 150, Dano: 15)")
    print("2 - Espadachim (Vida: 100, Dano: 17)")
    print("3 - Ladino (Vida: 80, Dano: 20)")
    print("4 - Templário (Vida: 200, Dano: 8)")
    print("5 - Arqueiro (Vida: 90, Dano: 18)")

    var escolhendo = true
    while escolhendo {
        do {
            guard let input = readLine(), let escolha = Int(input), (1...5).contains(escolha) else {
                throw InputError.invalido
            }
            switch escolha {
            case 1: vida = 150; danoBase = 15; classe = "Bárbaro"
            case 2: vida = 100; danoBase = 17; classe = "Espadachim"
            case 3: vida = 80; danoBase = 20; classe = "Ladino"
            case 4: vida = 200; danoBase = 8; classe = "Templário"
            case 5: vida = 90; danoBase = 18; classe = "Arqueiro"
            default: break
            }
            escolhendo = false
        } catch {
            print("Entrada inválida! Digite um número de 1 a 5.")
        }
    }
}
// ------------------------------
// BATALHA
// ------------------------------
// ------------------------------
// BATALHA COM NOMES ALEATÓRIOS E PERDA DE OURO
// ------------------------------
func batalhar() {
    let tiposDeInimigos = ["Goblin", "Esqueleto", "Zumbi", "Orc", "Troll", "Lobo", "Slime", "Bandido", "Múmia", "Diabo Menor"]
    let nomeInimigo = tiposDeInimigos.randomElement()!
    
    let vidaInimigo = Int.random(in: 10...30)
    let danoInimigo = Int.random(in: 15...25)
    var inimigoAtual = vidaInimigo
    
    print("\nUm \(nomeInimigo) apareceu! Vida: \(inimigoAtual), Dano: \(danoInimigo)\n")
    
    while vida > 0 && inimigoAtual > 0 {
        print("Você atacou e causou \(danoTotal()) de dano!")
        inimigoAtual -= danoTotal()
        
        if inimigoAtual <= 0 {
            print("Você derrotou o \(nomeInimigo)!")
            let ganho = Int.random(in: 15...40)
            ouro += ganho
            print("Você ganhou \(ganho) ouro!\n")
            return
        }
        
        print("Vida do \(nomeInimigo) agora: \(inimigoAtual)")
        
        let danoRecebido = max(danoInimigo - defesaTotal(), 0)
        vida -= danoRecebido
        print("O \(nomeInimigo) te atacou e causou \(danoRecebido) de dano.")
        print("Sua vida agora: \(vida)\n")
    }
    
    if vida <= 0 {
        print("Você morreu! Perdeu todo o ouro e renasceu com a vida cheia\n")
        ouro = 0
        // Restaura a vida de acordo com a classe
        switch classe {
        case "Bárbaro": vida = 150
        case "Espadachim": vida = 100
        case "Ladino": vida = 80
        case "Templário": vida = 200
        case "Arqueiro": vida = 90
        default: vida = 100
        }
    }
}

// ------------------------------
// MOSTRAR INVENTÁRIO
// ------------------------------
func mostrarInventario() {
    print("\n===== INVENTÁRIO =====")
    
    if inventario.isEmpty {
        print("Seu inventário está vazio.")
    } else {
        for (i, item) in inventario.enumerated() {
            print("\(i + 1) - \(item["nome"]!) (+\(item["valor"]!) \(item["tipo"]!))")
        }
    }
    
    print("0 - Voltar")
    print("=======================")
}

// ------------------------------
// EQUIPAR ITEM
// ------------------------------
func equiparItem() {
    mostrarInventario()
    print("Digite o número do item para equipar:")

    do {
        guard let input = readLine(), let escolha = Int(input), escolha > 0, escolha <= inventario.count else {
            throw InputError.invalido
        }
        let item = inventario[escolha - 1]
        if item["tipo"] as! String == "arma" {
            armaEquipada = item
            print("Você equipou a arma: \(item["nome"]!)")
        } else if item["tipo"] as! String == "armadura" {
            armaduraEquipada = item
            print("Você equipou a armadura: \(item["nome"]!)")
        } else {
            print("Este item não pode ser equipado.")
        }
    } catch {
        print("Entrada inválida! Digite um número válido do inventário.")
    }
}

// ------------------------------
// LOJA PERSONALIZADA POR CLASSE
// ------------------------------
func abrirLoja() {
    var lojaClasse: [[String: Any]] = []
    switch classe {
    case "Bárbaro": lojaClasse = lojaBarbaro
    case "Espadachim": lojaClasse = lojaEspadachim
    case "Ladino": lojaClasse = lojaLadino
    case "Templário": lojaClasse = lojaTemplario
    case "Arqueiro": lojaClasse = lojaArqueiro
    default: lojaClasse = []
    }

    let itensLoja = lojaClasse + armaduras + pocaoDeVida

    print("\n===== LOJA =====")
    for (i, item) in itensLoja.enumerated() {
        print("\(i + 1) - \(item["nome"]!) (+\(item["valor"]!)) - \(item["preco"]!) ouro")
    }
    print("0 - Voltar")
    print("=================")
    print("Digite o número do item para comprar:")

    do {
        guard let input = readLine(), let escolha = Int(input), escolha > 0, escolha <= itensLoja.count else {
            throw InputError.invalido
        }
        let item = itensLoja[escolha - 1]
        let preco = item["preco"] as! Int
        
        if ouro >= preco {
            ouro -= preco
            if item["tipo"] as! String == "poção" {
                vida += item["valor"] as! Int
                print("Você usou uma \(item["nome"]!) e recuperou \(item["valor"]!) de vida. Vida atual: \(vida)")
            } else {
                inventario.append(item)
                print("Você comprou \(item["nome"]!)")
            }
        } else {
            print("Você não tem ouro suficiente para comprar \(item["nome"]!).")
        }
    } catch {
        print("Entrada inválida! Digite um número válido da lista.")
    }
}

// ------------------------------
// MENU PRINCIPAL
// ------------------------------
func menu() {
    var rodando = true
    while rodando {
        print("""
        
===== MENU =====
1 - Batalhar
2 - Inventário
3 - Loja
4 - Status
0 - Sair
Escolha:
""")
        do {
            guard let input = readLine(), let escolha = Int(input) else {
                throw InputError.invalido
            }
            switch escolha {
            case 1: batalhar()
            case 2: equiparItem()
            case 3: abrirLoja()
            case 4: mostrarStatus()
            case 0:
                print("Saindo do jogo...")
                rodando = false
            default:
                print("Opção inválida!")
            }
        } catch {
            print("Entrada inválida! Digite um número válido do menu.")
        }
    }
}

// ------------------------------
// INÍCIO DO JOGO
// ------------------------------
escolherNome()
escolherClasse()
menu()
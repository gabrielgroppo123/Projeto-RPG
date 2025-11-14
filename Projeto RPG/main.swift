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
var vidaMaxima = 0
var danoBase = 0
var defesaBase = 5
var ouro = 0
var classe = ""
// equipamento e inventário
var armaEquipada: [String: Any] = ["nome": "Punhos", "tipo": "arma", "valor": 0]
var armaduraEquipada: [String: Any] = ["nome": "Roupas Rasgadas", "tipo": "armadura", "valor": 0]
var inventario: [[String: Any]] = []
// ------------------------------
// ITENS UNIVERSAIS
// ------------------------------
let armaduras: [[String: Any]] = [
    ["nome": "Armadura de Couro", "tipo": "armadura", "valor": 4, "preco": 20],
    ["nome": "Armadura de Madeira", "tipo": "armadura", "valor": 5, "preco": 35],
    ["nome": "Armadura de Ferro", "tipo": "armadura", "valor": 7, "preco": 60],
    ["nome": "Armadura de Aço", "tipo": "armadura", "valor": 10, "preco": 100],
    ["nome": "Armadura de Ouro", "tipo": "armadura", "valor": 15, "preco": 150]
]
let pocaoDeVida: [[String: Any]] = [
    ["nome": "Poção de Vida Pequena", "tipo": "poção", "valor": 30, "preco": 30],
    ["nome": "Poção de Vida Média", "tipo": "poção", "valor": 50, "preco": 50],
    ["nome": "Poção de Vida Grande", "tipo": "poção", "valor": 100, "preco": 80]
]
// ------------------------------
// LOJAS POR CLASSE (APENAS ARMAS)
// ------------------------------
let lojaBarbaro: [[String: Any]] = [
    ["nome": "Machado de Madeira", "tipo": "arma", "valor": 4, "preco": 20],
    ["nome": "Machado de Ferro", "tipo": "arma", "valor": 7, "preco": 60],
    ["nome": "Machado de Aço", "tipo": "arma", "valor": 10, "preco": 90],
    ["nome": "Machado de Ouro", "tipo": "arma", "valor": 15, "preco": 150]
]
let lojaEspadachim: [[String: Any]] = [
    ["nome": "Espada de Madeira", "tipo": "arma", "valor": 4, "preco": 20],
    ["nome": "Espada de Ferro", "tipo": "arma", "valor": 7, "preco": 50],
    ["nome": "Espada de Aço", "tipo": "arma", "valor": 9, "preco": 80],
    ["nome": "Espada de Ouro", "tipo": "arma", "valor": 15, "preco": 120]
]
let lojaArqueiro: [[String: Any]] = [
    ["nome": "Arco de Madeira", "tipo": "arma", "valor": 5, "preco": 20],
    ["nome": "Arco de Ferro", "tipo": "arma", "valor": 8, "preco": 60],
    ["nome": "Arco de Aço", "tipo": "arma", "valor": 10, "preco": 90],
    ["nome": "Crossbow de Madeira", "tipo": "arma", "valor": 7, "preco": 50],
    ["nome": "Crossbow de Ferro", "tipo": "arma", "valor": 15, "preco": 120]
]
// ------------------------------
// TIPOS DE INIMIGOS E EMOJIS
// ------------------------------
var tiposDeInimigos = [
    "Goblin": "🧌","Esqueleto": "💀","Zumbi": "🧟","Orc": "🪓","Troll": "🐸","Lobo": "🐺","Slime": "🟢","Bandido": "🏴‍☠️"
]
var batalhasTotais = 0
var ultimoInimigoSalvo: [String: Any]? = nil
// ------------------------------
// FUNÇÕES AUXILIARES PARA DICIONÁRIOS
// ------------------------------
func intDoDict(_ d: [String: Any], _ chave: String, _ padrao: Int) -> Int {
    if let v = d[chave] as? Int { return v }
    return padrao
}
func strDoDict(_ d: [String: Any], _ chave: String, _ padrao: String) -> String {
    if let v = d[chave] as? String { return v }
    return padrao
}
func boolDoDict(_ d: [String: Any], _ chave: String, _ padrao: Bool) -> Bool {
    if let v = d[chave] as? Bool { return v }
    return padrao
}
// ------------------------------
// CÁLCULOS DE DANO E DEFESA
// ------------------------------
func danoTotal() -> Int {
    return danoBase + intDoDict(armaEquipada, "valor", 0)
}
func defesaTotal() -> Int {
    return defesaBase + intDoDict(armaduraEquipada, "valor", 0)
}
// ------------------------------
// STATUS
// ------------------------------
func mostrarStatus() {
    print("""
    
===== STATUS =====
🧝 Nome: \(nome)
⚔️ Classe: \(classe)
❤️ Vida: \(vida)/\(vidaMaxima)
💥 Dano total: \(danoTotal())
🛡️ Defesa total: \(defesaTotal())
💰 Ouro: \(ouro)
🗡️ Arma equipada: \(strDoDict(armaEquipada, "nome", "Punhos"))
🥋 Armadura equipada: \(strDoDict(armaduraEquipada, "nome", "Roupas Rasgadas"))
==================
""")
}
// ------------------------------
// ESCOLHA DE NOME
// ------------------------------
func escolherNome() {
    print("Digite o nome do seu personagem:")
    if let input = readLine(), !input.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
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
    print("1 - Bárbaro 🛡️ (Vida: 200, Dano: 15)")
    print("2 - Espadachim 🗡️ (Vida: 150, Dano: 25)")
    print("3 - Arqueiro 🏹 (Vida: 100, Dano: 30)")
    var escolhendo = true
    while escolhendo {
        do {
            if let input = readLine(), let escolha = Int(input), (1...3).contains(escolha) {
                switch escolha {
                case 1:
                    vidaMaxima = 200; vida = vidaMaxima; danoBase = 15; classe = "Bárbaro"
                case 2:
                    vidaMaxima = 150; vida = vidaMaxima; danoBase = 25; classe = "Espadachim"
                case 3:
                    vidaMaxima = 100; vida = vidaMaxima; danoBase = 30; classe = "Arqueiro"
                default: break
                }
                escolhendo = false
            } else {
                throw InputError.invalido
            }
        } catch {
            print("⚠️ Entrada inválida! Digite um número de 1 a 3.")
        }
    }
}
// ------------------------------
// GERAÇÃO DE INIMIGO
// ------------------------------
func gerarInimigoNormal(level: Int) -> [String: Any] {
    var inimigo: [String: Any] = [:]
    let nomeBase = tiposDeInimigos.keys.randomElement() ?? "Monstro"
    let emoji = tiposDeInimigos[nomeBase] ?? "👾"
    let vidaBaseSort = Int.random(in: 10...30)
    let danoBaseSort = Int.random(in: 15...25)
    let vidaComLevel = vidaBaseSort + (level * 3)
    let danoComLevel = danoBaseSort + (level * 2)
    
    if level % 5 == 0 {
        inimigo["isBoss"] = true
        inimigo["nome"] = "Boss \(nomeBase) \(emoji)"
        inimigo["level"] = level
        inimigo["vidaMax"] = vidaComLevel * 1.5
        inimigo["vidaAtual"] = vidaComLevel * 1.5
        inimigo["dano"] = danoComLevel * 1.5
    } else {
        inimigo["isBoss"] = false
        inimigo["nome"] = "\(nomeBase) \(emoji)"
        inimigo["level"] = level
        inimigo["vidaMax"] = vidaComLevel
        inimigo["vidaAtual"] = vidaComLevel
        inimigo["dano"] = danoComLevel
    }
    return inimigo
}
// ------------------------------
// BATALHAS
// ------------------------------
func batalhar() {
    let nivelInimigo = batalhasTotais + 1
    batalhasTotais += 1
    var inimigoAtual: [String: Any] = ultimoInimigoSalvo ?? gerarInimigoNormal(level: nivelInimigo)
    
    if ultimoInimigoSalvo != nil {
        print("\n💥 VINGANÇA! Você encontrou novamente: \(strDoDict(inimigoAtual, "nome", "Monstro")) (Level \(intDoDict(inimigoAtual, "level", 1)))\n")
        ultimoInimigoSalvo = nil
    } else {
        print("\n⚔️ Um \(strDoDict(inimigoAtual, "nome", "Monstro")) apareceu! Vida: \(intDoDict(inimigoAtual, "vidaAtual", 0)), Dano: \(intDoDict(inimigoAtual, "dano", 0)) (Level \(intDoDict(inimigoAtual, "level", 1)))\n")
    }
    while vida > 0 && intDoDict(inimigoAtual, "vidaAtual", 0) > 0 {
        let ataque = danoTotal()
        var vidaInim = intDoDict(inimigoAtual, "vidaAtual", 0)
        vidaInim -= ataque
        inimigoAtual["vidaAtual"] = vidaInim
        print("🗡️ Você atacou e causou \(ataque) de dano!")
        
        if vidaInim <= 0 {
            print("☠️ Você matou o \(strDoDict(inimigoAtual, "nome", "Monstro"))!")
            let ganho = boolDoDict(inimigoAtual, "isBoss", false) ? Int.random(in: 80...150) : Int.random(in: 15...40)
            ouro += ganho
            print("💰 Você ganhou \(ganho) ouro!\n")
            return
        }
        
        let danoInimigo = intDoDict(inimigoAtual, "dano", 0)
        let danoRecebido = max(0, danoInimigo - defesaTotal())
        vida -= danoRecebido
        print("🩸 Vida do \(strDoDict(inimigoAtual, "nome", "Monstro")) agora: \(intDoDict(inimigoAtual, "vidaAtual", 0))")
        print("💀 O \(strDoDict(inimigoAtual, "nome", "Monstro")) te atacou e causou \(danoRecebido) de dano.")
        print("❤️ Sua vida agora: \(vida)\n")
    }
    
    if vida <= 0 {
        print("☠️ Você morreu! Perdeu todo o ouro e renasceu com a vida cheia\n")
        ouro = 0
        switch classe {
        case "Bárbaro": vidaMaxima = 150
        case "Espadachim": vidaMaxima = 100
        case "Arqueiro": vidaMaxima = 90
        default: vidaMaxima = 100
        }
        vida = vidaMaxima
        ultimoInimigoSalvo = inimigoAtual
    }
}
// ------------------------------
// INVENTÁRIO
// ------------------------------
func mostrarInventario() {
    print("\n🎒===== INVENTÁRIO =====")
    if inventario.isEmpty {
        print("Seu inventário está vazio.")
    } else {
        for (i, item) in inventario.enumerated() {
            print("\(i+1) - \(strDoDict(item, "nome", "Item")) (+\(intDoDict(item, "valor",0)) \(strDoDict(item, "tipo","desconhecido")))")
        }
    }
    print("0 - Voltar")
    print("=======================")
}
func equiparItem() {
    if inventario.isEmpty { print("Seu inventário está vazio."); return }
    mostrarInventario()
    print("Digite o número do item para equipar:")
    do {
        if let input = readLine(), let escolha = Int(input), escolha > 0 && escolha <= inventario.count {
            let item = inventario[escolha-1]
            switch strDoDict(item, "tipo", "") {
            case "arma": armaEquipada = item; print("🗡️ Você equipou a arma: \(strDoDict(item, "nome","Arma"))")
            case "armadura": armaduraEquipada = item; print("🥋 Você equipou a armadura: \(strDoDict(item, "nome","Armadura"))")
            default: print("Este item não pode ser equipado.")
            }
        } else { throw InputError.invalido }
    } catch {
        print("⚠️ Entrada inválida! Digite um número válido do inventário.")
    }
}
// ------------------------------
// LOJA
// ------------------------------
func abrirLoja() {
    var lojaClasse: [[String: Any]] = []
    switch classe {
    case "Bárbaro": lojaClasse = lojaBarbaro
    case "Espadachim": lojaClasse = lojaEspadachim
    case "Arqueiro": lojaClasse = lojaArqueiro
    default: break
    }
    let itensLoja = lojaClasse + armaduras + pocaoDeVida
    print("\n🏪===== LOJA =====")
    for (i, item) in itensLoja.enumerated() {
        print("\(i+1) - \(strDoDict(item,"nome","Item")) (+\(intDoDict(item,"valor",0))) - \(intDoDict(item,"preco",0)) ouro")
    }
    print("0 - Voltar")
    print("💰 Ouro total: \(ouro)")
    print("=================")
    print("Digite o número do item para comprar:")
    do {
        if let input = readLine(), let escolha = Int(input), escolha > 0 && escolha <= itensLoja.count {
            let item = itensLoja[escolha-1]
            let preco = intDoDict(item,"preco",0)
            if ouro >= preco {
                ouro -= preco
                if strDoDict(item,"tipo","") == "poção" {
                    vida += intDoDict(item,"valor",0)
                    if vida > vidaMaxima { vida = vidaMaxima }
                    print("🧪 Você usou uma \(strDoDict(item,"nome","Poção")) e recuperou \(intDoDict(item,"valor",0)) de vida. ❤️ Vida atual: \(vida)")
                } else {
                    inventario.append(item)
                    print("🛒 Você comprou \(strDoDict(item,"nome","Item"))")
                }
            } else { print("❌ Você não tem ouro suficiente para comprar \(strDoDict(item,"nome","Item")).") }
        } else { throw InputError.invalido }
    } catch {
        print("⚠️ Entrada inválida! Digite um número válido da lista.")
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
1 - Batalhar ⚔️
2 - Inventário 🎒
3 - Loja 🏪
4 - Status 📊
0 - Sair 🚪
Escolha:
""")
        do {
            if let input = readLine(), let escolha = Int(input) {
                switch escolha {
                case 1: batalhar()
                case 2: equiparItem()
                case 3: abrirLoja()
                case 4: mostrarStatus()
                case 0: rodando = false; print("👋 Saindo do jogo...")
                default: print("⚠️ Opção inválida!")
                }
            } else { throw InputError.invalido }
        } catch {
            print("⚠️ Entrada inválida! Digite um número válido do menu.")
        }
    }
}
// ------------------------------
// INÍCIO DO JOGO
// ------------------------------
escolherNome()
escolherClasse()
print("\n🎉 Bem-vindo, \(nome) o \(classe)! Boa sorte!\n")
menu()

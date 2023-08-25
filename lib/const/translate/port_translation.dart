const portugueseLanguage = {
  "home": {
    "home": {
      "name": "Principal",
      "alert": {
        "text": ["Novo projeto", "Importar"],
        "btns": ["Cancelar", "OK"],
        "hint": "Digite o nome",
        "problem": "O nome pode conter apenas letras latinas e números"
      }
    },
    "view": "Resultado",
    "main-settings": {
      "name": "Configurações",
      "language": "língua",
      "topPanel": "Painel superior no resultado",
    },
    "project-settings": {
      "change": "Alterar nome",
      "saved": "Salvo na pasta",
      "delete": "Excluir projeto",
      "just-put": "Criar arquivo Just Put",
      "html": "Criar arquivo HTML",
      "file-saved": "Arquivo salvo em /Download/JustPut",
    },
    "paint": {
      "name": "Pintar",
      "option-list": ["Escala", "Cor", "Opções", "Figuras"],
      "start-dialog": {
        "title": "Tamanho da tela",
        "inputs": ["Largura", "Altura"],
        "btn": "Aplicar"
      },
      "leaving-dialog": {
        "title": "Você realmente quer sair?",
        "btns": ["Não", "Sim"]
      }
    }
  },
  "html": {
    "name-add-block": "Adicionar bloco",
    "nav": ["Configurações", "Arquivos", "Pedaços"],
    "main-fab-btn": [
      "Propriedades",
      "Gerenciamento",
      "Objetos",
      "Dados",
      "Iniciar",
    ],
    "files-fab": ["Música", "Pintar", "Arquivos", "URL"],
    "btns-edit-params": ["Código", "Texto", "OK", "+"],
    "formuls": {
      "group-name": [
        "Dados",
        "Eventos do mouse",
        "Arquivos",
        "Matemática",
        "Propriedades",
        "Lógica",
        "Função",
        "Minhas funções",
        "Outros"
      ],
      "btns": [
        "+Criar",
        "posição do mouse",
        "mouseX",
        "mouseY",
        "colisão com toque({",
        "Tipo de clique",
        "Alvo",
        "objeto pressionado",
        "hgtrthgfsddfeghj",
        "potência",
        "aleatório",
        "raiz quadrada",
        "seno",
        "cosseno",
        "tangente",
        "arcoseno",
        "arcocosseno",
        "arcotangente",
        "arcotangente2",
        "máximo",
        "mínimo",
        "absoluto",
        "sinal",
        "arredondamento para cima",
        "arredondamento para baixo",
        "arredondamento",
        "parte inteira",
        "obter módulo",
        "logaritmo",
        "logaritmo10",
        "Pi",
        ".x",
        ".y",
        ".largura",
        ".altura",
        ".cor",
        ".raio",
        ".direção",
        ".ângulo inicial",
        ".ângulo final",
        ".duração",
        ".tempo atual",
        "Largura da tela",
        "Altura da tela",
        "=",
        "!=",
        ">",
        "<",
        ">=",
        "<=",
        "e",
        "ou",
        "não",
        "verdadeiro",
        "falso",
        "indefinido",
        "mostrar mensagem",
        "solicitação",
        "confirmar",
        "JSON.stringify",
        "JSON.parse",
        "unir linhas",
        "graus em radianos",
        "inteiro aleatório",
        "colisão entre",
        "colisão completa",
        "distância entre",
        ".comprimento",
        ".índice por valor",
        ".índice por valor do final",
        ".contém",
        ".matriz",
        "Objeto.chaves",
        "+Criar",
        "[",
        "]",
        "{",
        "}",
        "()=>",
        "ternário",
        "+",
        "Código em HTML",
      ]
    },
    "message": {
      "writeText": "Escreva o texto",
      "writeCode": "Escreva o código",
      "writeName": "Digite o nome",
      "writeURL": "Escreva o URL",
      "createFunction": "Criar função",
      "createData": "Criar variável",
      "createPiece": "Criar pedaço",
      "delete": "Excluir",
      "edit": "Editar",
      "isAudio": "É áudio?",
      "btns": ["VOLTAR", "OK"],
      "notRecomended": [
        "Não recomendado",
        "Use o URL em vez disso",
        "Imagens grandes e áudio serão processados ​​por muito tempo"
      ],
      "alreadyIncledes": ["JÁ EXISTE", "Começa com um número", "Apenas latim"]
    },
    "elements": [
      {
        "text": ["Função name(params)", "Fim"]
      },
      {
        "text": ["Coment"]
      },
      {
        "text": ["Definir //a valor 2"]
      },
      {
        "text": ["//code"]
      },
      {
        "text": ["Chamar //name('a')"]
      },
      {
        "text": ["Se condition então", "Fim"]
      },
      {
        "text": ["Se condition, senão", "Senão", "Fim"]
      },
      {
        "text": ["mostrar mensagem(Text)"]
      },
      {
        "text": ["Criar retângulo myName"],
        "textInWhere":
            "myName: x: myX, y: myY, largura: myW, altura: myH, direção: myDir, cor: myColor, raio: myR, textura: myIMG"
      },
      {
        "text": ["Criar círculo myName"],
        "textInWhere":
            "myName: x: myX, y: myY, raio: myR, ângulo inicial(radianos): myS, ângulo final(radianos): myE, rotação do relógio: myCl, cor: myColor, direção: myDir"
      },
      {
        "text": ["Ciclo de desenho", "Fim do desenho"],
        "textInWhere": "Ciclo de desenho (limpar fundo: true, Obter FPS)",
      },
      {
        "text": ["Desenhar //Object"],
        "textInWhere":
            "Desenhar //Object, com borda: undefined, transparência: 'one'",
      },
      {
        "text": ["Cena pressionada", "Fim da pressão"],
        "textInWhere":
            "Pressão <span style='font-size:10px;'>(apenas no fundo)</span> objeto pressionado://Object <span style='font-size:10px;'>(não obrigatório)</span>"
      },
      {
        "text": ["Desenhar Texto: myText"],
        "textInWhere":
            "myText: x: myX, y: myY, cor: myColor, estilo de texto: myStyle, alinhamento: myAligned, transparência: myOpacity"
      },
      {
        "text": ["Pressão em //Object", "Fim da pressão"],
      },
      {
        "text": ["Definir //Object myX, myY"],
        "textInWhere": "Definir coordenadas //Object x: myX, y: myY"
      },
      {
        "text": ["Mover //Object X para 100"],
      },
      {
        "text": ["Mover //Object Y para 101"],
      },
      {
        "text": ["//Object.largura = 50"],
      },
      {
        "text": ["//Object.altura = 60"],
      },
      {
        "text": ["//Object.raio = 30"],
      },
      {
        "text": ["//Object.cor = myColor"],
      },
      {
        "text": ["//Object.direção = myDirection"],
      },
      {
        "text": ["Gradiente linear myName"],
        "textInWhere":
            "myName:<span style=\"font-size:10px;\">(posição absoluta)</span> X inicial: myX, Y inicial: myY, X final: myfX, Y final: myfY, Lista de cores: myColor, Lista de pontos adicionais: points"
      },
      {
        "text": ["Gradiente radial myName"],
        "textInWhere":
            "myName:<span style=\"font-size:10px;\">(posição absoluta)</span> Posição X do primeiro círculo: myX, Y: myY, raio: myR1, Posição X do segundo círculo: myfX, Y: myfY, raio: myR2, Lista de cores: myColor, Lista de pontos adicionais: points"
      },
      {
        "text": ["Movimento do mouse", "Fim do toque"],
        "textInWhere":
            "Mouse ou toque em movimento, objeto pressionado://Object<span style='font-size:10px;'>(não obrigatório)</span>"
      },
      {
        "text": ["Fim do movimento do mouse", "Fim do toque"],
        "textInWhere":
            "O mouse parou de se mover, objeto pressionado://Object<span style='font-size:10px;'>(não obrigatório)</span>"
      },
      {
        "text": ["Atraso por some ms", "Fim do atraso"],
        "textInWhere":
            "Atraso por some milissegundos <span style='font-size:10px;'>(1s/1000)</span>"
      },
      {
        "text": ["Repetir a cada some ms", "Fim das repetições"],
        "textInWhere":
            "Repetir a cada some milissegundos <span style='font-size:10px;'>(1s/1000)</span> Nome para repetição: myInterval <span style='font-size:8px;'>Depois você pode pará-lo</span>"
      },
      {
        "text": ["Parar repetição myInterval"],
      },
      {
        "text": ["Cortar texture"],
        "textInWhere":
            "Cortar texture: X inicial: myStartX, Y inicial: myStartY, Largura do corte: myWidth, Altura do corte: myHeight"
      },
      {
        "text": ["//a adicionar 1 "],
      },
      {
        "text": ["//a multiplicar por 2 "],
      },
      {
        "text": ["//a dividir por 2 "],
      },
      {
        "text": ["//a = JSON.parse(REALDATA)"],
      },
      {
        "text": ["Repetir 10 vezes", "Fim da repetição"],
        "textInWhere": "Repetir 10 vezes, número da repetição: index"
      },
      {
        "text": ["Adicionar newElement em array"]
      },
      {
        "text": ["Excluir último elemento em array"]
      },
      {
        "text": ["Novo primeiro elemento em array"]
      },
      {
        "text": ["Excluir primeiro elemento array"]
      },
      {
        "text": ["array.paraCada(element, index)", "Fim da repetição"]
      },
      {
        "text": ["Em array1 transformar array2", "Fim da transformação"],
        "textInWhere":
            "Nova lista: array1, array2.iteração(element, index) <span style='font-size:14px;'>Usar com \"Retornar\"</span>"
      },
      {
        "text": ["Em array1 filtrar array2", "Fim da filtragem"],
        "textInWhere":
            "Nova lista: array1, array2.filtrar(element, index) <span style='font-size:14px;'>Usar com \"Retornar\"</span>"
      },
      {
        "text": ["Em array1 reduzir array2", "Fim do reduce"],
        "textInWhere":
            "Nova lista: array1, array2.reduce(previousResult, currentValue, index) <span style='font-size:14px;'>Usar com \"Retornar\"</span>"
      },
      {
        "text": ["Excluir some elementos"],
        "textInWhere":
            "Na posição where em array excluir some elementos (método splice em JS)"
      },
      {
        "text": ["Adicionar elements em array"],
        "textInWhere":
            "Na posição where em array adicionar elements (método splice em JS)"
      },
      {
        "text": ["array.encontrar(element, index)", "Fim da busca"],
        "textInWhere":
            "Na lista: array1, inserir elementos encontrados em array2 (element, index) <span style='font-size:14px;'>Usar com \"Retornar\"</span>"
      },
      {
        "text": ["array.encontrarÍndice(element, index)", "Fim da busca"],
        "textInWhere":
            "Na lista: array1, inserir índices de elementos encontrados na lista: array2 (element, index) <span style='font-size:14px;'>Usar com \"Retornar\"</span>"
      },
      {
        "text": ["array.ordenar(+)"]
      },
      {
        "text": ["array.inverter"]
      },
      {
        "text": ["array.embaralhar"]
      },
      {
        "text": ["array1 juntar com array2"]
      },
      {
        "text": ["Retornar", "Fim"],
      },
      {
        "text": ["Continuar"]
      },
      {
        "text": ["Parar"]
      },
      {
        "text": ["Ir //Object HowSteps passos"],
      },
      {
        "text": ["Aumentar fundo X, Y"],
      },
      {
        "text": ["Transformar fundo X, Y"],
        "textInWhere":
            "Transformação do fundo <span style='font-size:14px;'>Escala horizontal:</span>HSc, <span style='font-size:14px;'>Inclinação vertical:</span>VSk, <span style='font-size:14px;'>Inclinação horizontal:</span>HSk, <span style='font-size:14px;'>Escala vertical:</span>VSc, x: X, y: Y"
      },
      {
        "text": ["Girar fundo angle"],
      },
      {
        "text": ["Adicionar a //Object X 10"],
      },
      {
        "text": ["Adicionar a //Object Y 10"],
      },
      {
        "text": ["Adicionar a //Object Largura 20"],
      },
      {
        "text": ["Adicionar a //Object Altura 20"],
      },
      {
        "text": ["Adicionar a //Object Direção 20"],
      },
      {
        "text": ["moverSuavemente myName para endX, endY"],
        "textInWhere":
            "myName Mover suavemente para x: endX, y: endY por duration milissegundos<span style='font-size:10px;'>(1s/1000)</span>"
      },
      {
        "text": ["Cor de fundo: myColor"],
      },
      {
        "text": ["Salvar variable"],
      },
      {
        "text": ["Ler variable"],
      },
      {
        "text": ["Excluir Variable do armazenamento"],
      },
      {
        "text": ["Método GET variable url"],
        "textInWhere": "Método GET, salvar em variable, link: url"
      },
      {
        "text": ["Método POST variable url"],
        "textInWhere":
            "Método POST, salvar em variable, link: url, corpo: myBODY, cabeçalhos: myHEADERS"
      },
      {
        "text": ["Método PUT variable url"],
        "textInWhere":
            "Método PUT, salvar em variable, link: url, corpo: myBODY, cabeçalhos: myHEADERS"
      },
      {
        "text": ["Método PATCH variable url"],
        "textInWhere":
            "Método PATCH, salvar em variable, link: url, corpo: myBODY, cabeçalhos: myHEADERS"
      },
      {
        "text": ["Método DELETE url"]
      },
      {
        "text": ["Criar \"Text\" em HTML"],
        "textInWhere":
            "Criar \"Text\" em HTML(myId), coordenadas absolutas x: myX y: myY, estilo: myStyle"
      },
      {
        "text": ["Campo de texto(myId)"],
        "textInWhere":
            "Criar campo de texto(myId), dados iniciais: standartValue, dica: myPlaceholder, comprimento máximo: myLenth, estilo: myStyle, salvar dados em myName, é senha: isPassword, coordenadas absolutas x: myX, y: myY"
      },
      {
        "text": ["Slider(myId)"],
        "textInWhere":
            "Criar Slider(myId), dados iniciais: standartValue, número mínimo: myMIN, número máximo: myMAX, um passo: oneStep, salvar dados em myName, estilo: myStyle, coordenadas absolutas: myX, y: myY"
      },
      {
        "text": ["Paleta(myId)"],
        "textInWhere":
            "Criar paleta(myId), cor: standartValue, salvar dados em myName, coordenadas absolutas: myX, y: myY"
      },
      {
        "text": ["Alternador(myId)"],
        "textInWhere":
            "Criar Alternador(myId), dados iniciais: standartValue, dica: myHint, salvar dados em myName, estilo: myStyle, coordenadas absolutas: myX, y: myY"
      },
      {
        "text": ["Botão de rádio(myId)"],
        "textInWhere":
            "Criar botão de rádio(groupName) id: myId, dados: standartValue, dica: myHint, salvar dados em myName, estilo: myStyle, coordenadas absolutas: myX, y: myY"
      },
      {
        "text": ["Botão(myId)"],
        "textInWhere":
            "Criar Botão(myId), texto: myText, ao clicar executar: myCode, coordenadas absolutas: myX, y: myY, estilo: myStyle"
      },
      {
        "text": ["Imagem(myId)"],
        "textInWhere":
            "Criar imagem(myId), textura: myTexture, coordenadas absolutas: myX, y: myY, estilo: myStyle"
      },
      {
        "text": ["Excluir elemento HTML myId"]
      },
      {
        "text": ["Object.newProperty = 10"]
      },
      {
        "text": ["Adicionar a object.myProperty -1"]
      },
      {
        "text": ["Object.textura = myIMG"]
      },
      {
        "text": ["Início da pressão", "Fim da pressão"],
        "textInWhere":
            "Início da pressão objeto pressionado://Object <span style='font-size:10px;'>(não obrigatório)</span>"
      },
      {
        "text": ["Lista vazia //a"],
      },
      {
        "text": ["Reproduzir MyAudio"],
        "textInWhere": "Reproduzir MyAudio, tempo de início: StartTime"
      },
      {
        "text": ["Parar MyAudio"],
      },
      {
        "text": ["Volume MyAudio 50%"],
      },
      {
        "text": ["Desativar som MyAudio true"]
      },
      {
        "text": ["MyAudio parou", "Fim"]
      },
      {
        "text": ["//Object.tamanho = 100px"],
      },
      {
        "text": ["Continuar pedaço Main"],
      },
      {
        "text": ["myId.valor = newValue"],
      },
      {
        "text": ["Criar Polígono myName"],
        "textInWhere":
            "myName: x: myX, y: myY, vértices: myVertices, cor: myColor, direção: myDir"
      },
    ]
  }
};

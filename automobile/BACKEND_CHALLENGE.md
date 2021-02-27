# Backend challenge

## Introdução

Você deverá desenvolver uma API de classificação de corrida automobilística, em que as classificações sejam separadas por corrida e temporada/campeonato, recebendo arquivos de cada corrida realizada.

## Pontos Principais

* Importar arquivo da corrida definindo data da corrida;
* Auto cadastrar piloto pelo nome;
* Auto cadastrar automóvel pelo número;
* Auto cadastrar temporada definido pelo ano da corrida;
* Calcular pontos;
* Exibir classificação por corrida e por temporada.

## Regras gerais

* O automóvel é identificado pelo número do automóvel;
* Um automóvel pode haver pilotos diferentes em diferente corridas;
* Um mesmo piloto pode pilotar diferentes automóveis em diferentes corridas;
* Uma temporada da corrida é definida pelo ano da data da corrida;
* Não deverá existir mais de um automóvel com o mesmo número;
* Não deverá existir mais de um piloto com o mesmo nome;
* Não deverá existir mais de um resultado por piloto na corrida;
* Somente é permitida uma única corrida por dia;
* Serão somente 14 pilotos/automóveis por corrida;
* Em uma corrida, pilotos/automóveis podem ter abandonado a corrida, logo ele pode ter um tempo de volta total menor que o primeiro colocado.

## Regras de pontuação

* +1 ponto para a volta mais rápida, ignorando aquele que não completar a corrida, passando o ponto para o próximo com a volta mais rápida e que tenha completado a corrida;
* +1 ponto para pole, ignorando aquele que não completar a corrida, passando o ponto para o próximo colocado no starting grid que tenha completado a corrida;
* +12 pontos para o primeiro colocado
* +10 pontos para o segundo colocado
* +8 pontos para o terceiro colocado
* +6 pontos para o quarto colocado
* +4 pontos para o quinto colocado
* +2 pontos para o sexto colocado
* +1 pontos para os demais pilotos que completaram todas as voltas
* Aqueles que não completaram todas as voltas, não pontuam (incluindo os pontos extras de volta mais rápida e pole)

## Regras de desempate da corrida

1. Tempo da melhor volta
2. Média de velocidade

## Regras de desempate da temporada

1. Maior número de vitórias;
2. Maior número de segundos lugares;
3. Maior número de terceiros lugares;
4. Melhor colocação na última corrida;

## Endpoints necessários

### POST `/race`

Endpoint onde será recebido o arquivo da corrida. O nome do arquivo é no formato `race_<year>_<month>_<day>.csv`. Você deverá efetuar o parse no nome do arquivo para definir a data da corrida.

Exemplo:

```json
{
  "race_file": "@~/race_2019_01_31.csv"
}
```

### GET `/tournaments`

Listagem dos campeonatos contendo ano, total de corridas, total de pilotos participantes e total de automóveis participantes.

Exemplo:

```json
[
  {
    "tournament": 2019,
    "races": 22,
    "pilots": 15,
    "automobiles": 14,
    "tournament_url": "/tournaments/2019"
  },
  {
    "tournament": 2020,
    "races": 21,
    "pilots": 14,
    "automobiles": 14,
    "tournament_url": "/tournaments/2020"
  }
]
```

### GET `/tournaments/<year>`

Listagem do campeonato contendo as informações anteriores para somente essa corrida.

Exemplo:

```json
{
  "tournament": 2019,
  "races": 22,
  "pilots": 15,
  "automobiles": 14,
  "tournament_races_url": "/tournaments/2019/races",
  "tournament_classification_url": "/tournaments/2019/classification",
  "tournament_automobiles_url": "/tournaments/2019/automobiles",
  "tournament_pilots_url": "/tournaments/2019/pilots"
}
```

### GET `/tournaments/<year>/races`

Listagem das corridas contendo data, total de voltas, total de automóveis, total de pilotos e o piloto vencedor.

Exemplo:

```json
[
  {
    "race": "2019/01/31",
    "laps": 19,
    "automobiles": 10,
    "pilots": 10,
    "winner": "Jeffery Schimmel III",
    "tournament_race_classification_url": "/tournaments/2019/races/01/31/classification"
  },
  {
    "race": "2019/02/12",
    "laps": 25,
    "automobiles": 14,
    "pilots": 14,
    "winner": "Major Beier",
    "tournament_race_classification_url": "/tournaments/2019/races/02/12/classification"
  }
]
```

### GET `/tournaments/<year>/races/<date>/classification`

Classificação da corrida contendo todas as informações do arquivo, mais a posição de cada piloto e o total de pontos recebidos nessa corrida.

Exemplo:

```json
[
  {
    "position": 1,
    "points": 12,
    "automobile": 3,
    "name": "Jeffery Schimmel III",
    "total_laps": 20,
    "total_time": "05:32.495",
    "best_lap": 20,
    "time_best_lap": "00:13.416",
    "diff": "",
    "gap": "",
    "starting_grid": 1,
    "average_velocity": 52.2
  },
  {
    "position": 2,
    "points": 11,
    "automobile": 4,
    "name": "Major Beier",
    "total_laps": 20,
    "total_time": "05:32.615",
    "best_lap": 20,
    "time_best_lap": "00:13.390",
    "diff": "00:0.120",
    "gap": "00:0.120",
    "starting_grid": 2,
    "average_velocity": 51.9
  }
]
```

### GET `/tournaments/<year>/classification`

Classificação do campeonato, contendo informações de pontos e posição de cada piloto.

Exemplo:

```json
[
  {
    "name": "Major Beier",
    "points": 23,
    "position": 1
  },
  {
    "name": "Jeffery Schimmel III",
    "points": 12,
    "position": 2
  },
]
```

### GET `/tournaments/<year>/automobiles`

Listagem dos automóveis com os pilotos que participaram do campeonato.

```json
[
  {
    "automobile": 3,
    "pilots": ["Jeffery Schimmel III", "Major Beier"]
  },
  {
    "automobile": 4,
    "pilots": ["Major Beier"]
  },
]
```

### GET `/tournaments/<year>/pilots`

Listagem dos pilotos que participaram do campeonato e os automóveis por eles pilotados.

Exemplo:

```json
[
  {
    "pilot": "Jeffery Schimmel III",
    "automobiles": [3]
  },
  {
    "pilot": "Major Beier",
    "automobiles": [3, 4]
  }
]
```

### GET `/rules`

Regras das pontuações.

Exemplo:

```json
[
  {
    "points": 12,
    "description": "First place in the race"
  },
  {
    "points": 10,
    "description": "Second place in the race"
  }
]
```

## Exemplo do arquivo

```csv
Automobile,Name,TotalLaps,TotalTime,BestLap,TimeBestLap,Diff,Gap,StartingGrid,AverageVelocity
3,Jeffery Schimmel III,20,05:32.495,20,00:13.416,,,1,54.3
4,Major Beier,20,05:32.615,20,00:13.390,00:0.120,00:0.120,2,54.3
289,Leanne Hills,20,05:32.913,10,00:13.408,00:0.418,00:0.298,4,54.3
24,Brandi Hauck,20,05:33.525,15,00:13.440,00:1.030,00:0.612,3,54.2
505,Josefine Shanahan,20,05:35.109,13,00:13.531,00:2.614,00:1.584,5,54.1
123,Stanton Predovic,20,05:35.406,14,00:13.527,00:2.911,00:0.297,6,54.1
79,Marquis Bashirian III,20,05:36.364,14,00:13.501,00:3.869,00:0.958,7,53.9
49,Luisa Smith,20,05:36.619,14,00:13.523,00:4.124,00:0.255,8,53.9
00,Antione Bartoletti,20,05:38.171,18,00:13.592,00:5.676,00:1.552,10,53.7
25,Prof. Star Rippin,20,05:38.763,12,00:13.505,00:6.268,00:0.592,11,53.6
124,Mitchell Barrows,20,05:40.844,12,00:13.789,00:8.349,00:2.081,12,50.3
65,Santiago Marvin DC,20,05:41.028,12,00:13.696,00:8.533,00:0.184,13,50.2
1,Loura Yundt VM,20,05:43.675,15,00:13.844,00:11.180,00:2.647,14,49.9
47,August Zemlak,16,04:45.861,4,00:13.820,,,9,48.8
```

### Atributos

* **Automobile**: Número do automóvel. Exemplo: `3`;
* **Name**: Nome do piloto. Exemplo: `Jeffery Schimmel III`;
* **TotalLaps**: Total de voltas que o automóvel/piloto efetuaram durante a corrida. Exemplo: `20`;
* **TotalTime**: Tempo total de corrida que o automóvel/piloto efetuou durante a corrida. Exemplo: `05:32.913`;
* **BestLap**: Número da melhor volta feita pelo automóvel/piloto. Exemplo: `10`;
* **TimeBestLap**: Tempo da melhor volta feita pelo automóvel/piloto. Exemplo: `00:13.408`;
* **Diff**: Tempo de diferença do término da corrida em relação ao líder vitorioso. Exemplo: `00:0.418`. __ATENÇÃO__: Também haverá a possibilidade de valores nulos, quando esse recebeu uma volta a mais(retardatário) ou foi o vitorioso da corrida;
* **Gap**: Tempo de diferença para o piloto que terminou a corrida a sua frente. Exemplo: `00:0.298`. __ATENÇÃO__: Também haverá a possibilidade de valores nulos, quando esse recebeu uma volta a mais(retardatário) ou foi o vitorioso da corrida;
* **StartingGrid**: Posição de largada do automóvel/piloto. Exemplo: `2`;
* **AverageVelocity**: Velocidade média do automóvel/piloto em kilometros por hora. Exemplo: `55.2`.
  
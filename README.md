# UBS API
## Objetivos Planejados
1. Importar os dados de UBSs disponíveis em formato CSV no site: [Portal Brasileiro de dados Abertos](http://dados.gov.br/dataset/unidades-basicas-de-saude-ubs)
1. Desenvolver uma aplicação Web API, bem simples, com apenas uma rota de
consulta para essas informações.

### Rota
GET: api/v1/find_ubs

Parâmetros | Exemplo | Descrição
------------ | ------------- | -------------
query | -23.604936,-46.692999 | Lat/Log para pesquisa
page | 2 | Página atual
per_page| 10 | Itens por página (default: 10)

### Formato dos dados
Propriedade | Tipo | Descrição
------------ | ------------- | -------------
id | Number | Id da ubs
name | String | Nome
address | String | Endereço
city | String | Cidade
phone | String | Telefone
geocode.lat| Number | Latitude
geocode.long |Number | Longitude
scores.size | Number | Estrutura física/Tamanho da UBS
scores.adaptation_for_seniors | Number | Adaptações para idosos
scores.medical_equipment | Number | Equipamentos disponíveis
scores.medicine | Number | Medicamentos disponíveis

### Exemplo Planjejado
GET: /find_ubs?query=-23.604936,-46.692999&page=1&per_page=1

```
{
  current_page: 1,
  per_page: 1,
  total_entries: 37690,
  entries: [{
    id: 39860,
    name: "UBS REAL PQ PAULO MANGABEIRA ALBERNAZ FILHO",
    address: "RUA BARAO MELGACO",
    city: "São Paulo",
    phone: "1137582329",
    geocode: {
      lat: -23.6099946498864,
      long: -46.7057347297655
    },
    scores: {
      size: 3,
      adaptation_for_seniors: 3,
      medical_equipment: 1,
      medicine: 3
    }
  }]
}
```
## Objetivos Alcançados
1. Importação dos dados realizada com sucesso. Um processo simples, visto que os dados não apresentavam erros de tipo ou campos em branco.
1. Web API simples com uma rota de consulta baseada em altitude e longitude. A chamada retorna uma lista com as UBS num raio de 2 Km do ponto(latitude, longitude) informado. Caso não exista nenhuma UBS no raio, retorna uma lista vazia.
1. Deploy no Heroku: [UBS API - exemplo de chamada](http://shielded-mountain-74029.herokuapp.com/api/v1/find_ubs?query=-23.604936,-46.692999)
1. Limite de 5 requisições por IP/segundo

### Exemplo Implementado
GET: /api/v1/find_ubs?query=-23.604936,-46.692999&page=1
```
[{
  "id":1333,
  "name":"UBS MENINOPOLIS MARIO FRANCISCO NAPOLITANO",
  "address":"RUA OSCAR GOMES CARDIM",
  "city":"São Paulo",
  "phone":"1150961058",
  "geocode":{
    "latitude":-23.620895,
    "longitude":-46.687689
  },
  "scores":{
    "size":2,
    "adaptation_for_seniors":1,
    "medical_equipment":1,
    "medicine":2
  }},
  {
    "id":2752,
    "name":"UBS REAL PQ PAULO MANGABEIRA ALBERNAZ FILHO",
    "address":"RUA BARAO MELGACO",
    "city":"São Paulo",
    "phone":"1137582329",
    "geocode":{
      "latitude":-23.609995,
      "longitude":-46.705735
    },
    "scores":{
      "size":3,
      "adaptation_for_seniors":3,
      "medical_equipment":1,
      "medicine":3}
      }]
```
## Aprimoramentos Posíveis
* Escrita de testes de requisição para a API.
* Adição dos campos referentes à paginação no JSON retornado pela API.
* Validação dos valores de latitude e longitude informados pelo usuário.
* Mensagens de erro relacionadas aos parâmetros de paginação.

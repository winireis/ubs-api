# UBS API
## Objetivos
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

### Exemplo
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

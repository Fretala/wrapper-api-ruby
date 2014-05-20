Freta la - API
===============

Este projeto é uma interface para a nossa API. A documentação da API está detalhada [neste link][apidocs].

Uso
---

Todos os exemplos aqui citados estão em example.rb:

### Instanciar objeto:
É necessário instanciar a nossa classe para fazer qualquer chamada:
```ruby
require './fretalaAPI.rb'  

freta = FretalaAPI.new('uvXTwX7Ub/t7aCGxDR3VTVO/GNBxHykhQC03DTjmvIY=', 'sandbox')
```
### Inserir Cartão:
```ruby
card = {
 'name' => '234',
 'number' => '4111111111111111',
 'cvv' => '123',
 'expDate' => '201812'
}
insertCardRtn = freta.insertCard(card)
```

### Deletar Cartão:
```ruby
deleteCardRtn = freta.deleteCard('car_2cc2750e0e6172cc24be429ee8e4e24af9a89973')
```

### Listar cartões:
```ruby
getCardsRtn = freta.getCards()
```

### Calcular rota:
```ruby
route = {
 'from' => {
   'number' => '234',
   'street' => 'Rua Rio de Janeiro 653',
   'city' => 'Belo Horizonte', 
   'state' => 'Minas Gerais'
 },
 'to' => '30140-122'
}
costRtn = freta.cost(route)
```

### Pedir frete:
```ruby
frete = {
 'id' => 'MM8513110213',
 'productValue' => '6000',
 'ccToken' => 'car_d27f413bc5ba5acdcaed319838d3b971cd33478f',
 'from' => {
   'number' => '234',
   'street' => 'Rua Rio de Janeiro',
   'city' => 'Belo Horizonte', 
   'state' => 'Minas Gerais'
 },
 'to' => {
   'number' => '2500',
   'street' => 'Rua Timbiras 2500',
   'city' => 'Belo Horizonte', 
   'state' => 'Minas Gerais'
 }
}
insertFreteRtn = freta.insertFrete(frete)
```

[apidocs]:http://freta.la/apidocs/

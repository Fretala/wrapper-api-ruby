require './fretalaAPI.rb'  

freta = FretalaAPI.new('uvXTwX7Ub/t7aCGxDR3VTVO/GNBxHykhQC03DTjmvIY=', 'sandbox')

card = {
 'name' => '234',
 'number' => '4111111111111111',
 'cvv' => '123',
 'expDate' => '201812'
}

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

route = {
 'from' => {
   'number' => '234',
   'street' => 'Rua Rio de Janeiro 653',
   'city' => 'Belo Horizonte', 
   'state' => 'Minas Gerais'
 },
 'to' => '30140-122'
}

insertCardRtn  = freta.insertCard(card)
deleteCardRtn  = freta.deleteCard('car_2cc2750e0e6172cc24be429ee8e4e24af9a89973')
getCardsRtn    = freta.getCards()
insertFreteRtn = freta.insertFrete(frete)
costRtn        = freta.cost(route)

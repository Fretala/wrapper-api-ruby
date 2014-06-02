require 'fretala'

auth = {
  'clientId' => 'ecommerce',
  'clientSecret' => 'Q6eH4nxD',
  'username' => 'EMAIL_HERE',
  'password' => 'PASSWORD_HERE'
};
fretala = Fretala.new('sandbox', auth)

card = {
 'name' => '234',
 'number' => '4111111111111111',
 'cvv' => '123',
 'expDate' => '201812'
}

frete = {
 'id' => 'MM8513110213',
 'productValue' => '6000',
 'ccToken' => 'car_4004f0709b385d804d0219ed138b1ada17440eb9',
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
 'to' => '13564-331'
}

#remova o comentário da chamada que quiser testar

insertCardRtn  = fretala.insertCard(card)
puts(insertCardRtn)
#deleteCardRtn  = fretala.deleteCard('car_df78411db544f246a1c2b87e011f126ac7745e20')
#getCardsRtn    = fretala.getCards()
#insertFreteRtn = fretala.insertFrete(frete)
#costRtn        = fretala.cost(route)

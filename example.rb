require_relative 'lib/fretala'

auth = {
  'clientId' => 'ecommerce',
  'clientSecret' => 'Q6eH4nxD',
  'username' => 'YOUR_EMAIL_HERE',
  'password' => 'YOUR_PASSWORD_HERE'
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
 'to' => '30140-903'
}

#exemplo de inserção de frete:
#insertFreteRtn = fretala.insertFrete(frete)

#exemplo de custo com tratamento de erros:
begin
  costRtn = fretala.cost(route)
  puts(costRtn);
rescue Fretala::ValidationError => e
  puts('Validation Error: ' + e.message)
rescue Fretala::BadRequestError => e
  puts('Bad Request Error: ' + e.message)
rescue Fretala::InternalError => e
  puts('Internal Error: ' + e.message)
rescue => e
  puts('Error: ' + e.message)
end

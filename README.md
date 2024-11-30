# Dio-BD

Feito os conceitos da professora

Para o exercicio:

Separei o cliente em PF e PJ
Pois podem ser 1 cliente para muitos pedidos

Pedido para produto, 
São n para n, pois podem haver diversos pedidos e produtos corelacioandos

Em produto tem:
  Produto para terceiro (vendedor) e Fornecedor -  n para n, pois podem haver varios fornecedores com os produtos, ou vice versa

Do produto liga para Estoque, onde verifica se há disponibilidade imediata dos produtos.

DO estoque ligamos para Metodo de pagamento, que pode representar diversos métodos de pagamento 1 para n, para o cliente acertar o pedido

Do método de pagamento, direcionamos para Entrega, onde conseguiremos acomapnhar os status da entrega dos produtos, esse item ficou de 1 para n, onde 1 método de pagamento, pode pagar varios pepdidos

Da entrega, em 1 para n, onde a entrega notifica os status dos pedidos do cliente.

![e-Commerce mwb](https://github.com/user-attachments/assets/da746a07-5b86-4763-869f-b36d704c2548)


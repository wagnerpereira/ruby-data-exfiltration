# Cliente UDP em Ruby para Envio de Resultados de Comandos

Este é um cliente UDP simples em Ruby que permite enviar o resultado de comandos especificados como parâmetro para um servidor UDP em uma máquina remota.

## Pré-requisitos

Antes de usar este cliente, verifique se você atende aos seguintes requisitos:

- Ruby instalado na sua máquina.
- Permissões para executar comandos no sistema operacional local.

## Uso

Siga estas etapas para usar o cliente UDP em Ruby:

1. Abra um terminal.
2. Navegue até o diretório onde o código Ruby está localizado.

### Comandos

O cliente espera um comando como argumento na linha de comando. Você pode especificar qualquer comando que você normalmente executaria no terminal. O resultado desse comando será enviado ao servidor UDP.

Para executar o cliente e enviar o resultado de um comando, utilize o seguinte formato:

```bash
ruby udp_client.rb "seu_comando_aqui"
```

Substitua "seu_comando_aqui" pelo comando que você deseja executar. Por exemplo:

```bash
ruby udp_client.rb "ls -l"
```

### Resultado
O cliente UDP enviará o resultado do comando especificado para o servidor UDP remoto, que deve estar em execução no IP e porta configurados nas variáveis target_host e target_port no código Ruby.

O resultado enviado para o servidor será impresso no console após o envio bem-sucedido.

Exemplo de Servidor UDP
Para que este cliente funcione corretamente, você também precisa configurar um servidor UDP para receber os dados enviados. Aqui está um exemplo simples de um servidor UDP em Ruby:

```ruby
require "socket"

IP = "0.0.0.0"
PORT = 4321
bufferSize = 4096

server = UDPSocket.new
server.bind(IP, PORT)

loop do
  bytes_address = server.recvfrom(bufferSize)
  message = bytes_address[0]
  address = bytes_address[1]

  # Faça o processamento necessário com a mensagem recebida, se desejado.
  
  puts "Mensagem recebida de #{address[3]}:#{address[1]}:"
  puts message
end
```

Este é apenas um exemplo básico de um servidor UDP. Você pode personalizá-lo para atender às suas necessidades específicas.

Lembre-se de que é importante que o cliente e o servidor estejam configurados com as mesmas configurações de IP e porta para que a comunicação funcione corretamente. Certifique-se de ajustar essas configurações conforme necessário.

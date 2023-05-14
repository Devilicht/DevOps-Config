## DevOps Tools Installer
Este código é um script de shell em bash que instala várias ferramentas, como Git, Docker, Ansible e Jenkins. Ele começa verificando se o usuário que está executando o script é o root (administrador do sistema). Se não for o root, ele exibe uma mensagem de erro e sai do script.

Em seguida, existem quatro funções que instalas as ferramentas mencionadas acima. Cada função verifica se a instalação foi bem-sucedida e exibe uma mensagem apropriada em caso de erro ou sucesso.

Por fim, há um bloco "case" que processa os argumentos fornecidos na linha de comando. Se o argumento corresponder a um dos casos definidos ("install-git", "install-docker", "install-ansible", "install-jenkins" ou "install-all"), ele chama a função apropriada. Caso contrário, exibe uma mensagem de ajuda que lista as opções disponíveis.

## Como usar
É necessario passar um argumento para o script, ao executar o script sem argumento ele ja exibe todos argumentos disponiveis.

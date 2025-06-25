# SSH

Para se conectar a instancia vultr que executa Vulkey. A chave pública sera adicionada como secret no repositório do Github. Assim poderá ser usada quando a instancia for provisionada.

Altere os valores:

- PASSPHRASE
- KEY_PATH_NAME
- KEY_COMMENT

# Linux

## Torne o script executável:

`chmod +x gerar_chave_ssh_linux.sh`

# Windows

Para rodar um script Bash no Windows, você precisa de um ambiente que o suporte, como:

- Git Bash: Vem com a instalação do Git para Windows e fornece um terminal Bash.
- WSL (Windows Subsystem for Linux): Permite rodar um ambiente Linux completo (como Ubuntu) dentro do Windows.
- Cygwin: Outro ambiente que simula um sistema Unix-like no Windows.

-----

## Gerador de Chaves SSH Personalizável para Windows (via Git Bash / WSL)

Este script é praticamente idêntico à versão Linux, pois ele será executado em um ambiente Bash (Git Bash ou WSL) que simula o comportamento do Linux no Windows.

Salve o conteúdo abaixo em um arquivo com a extensão `.sh`, por exemplo, `gerar_chave_ssh_win.sh`.

### Como Usar o Script no Windows:

Para que este script funcione, você precisará de um ambiente Bash no seu Windows.

1.  **Instale o Git para Windows (Recomendado para a maioria dos devs):**
    A forma mais comum e simples é instalar o [Git para Windows](https://git-scm.com/download/win). Ele inclui o **Git Bash**, que é um terminal que emula um ambiente Bash.

2.  **Salve o script:**
    Cole o conteúdo acima em um arquivo de texto e salve-o com a extensão `.sh` (por exemplo, `gerar_chave_ssh_win.sh`). Você pode salvar em qualquer lugar, mas seu diretório de usuário (ex: `C:\Users\SeuUsuario\`) é um bom local.

3.  **Edite as variáveis:**
    Abra o arquivo `.sh` em um editor de texto (como Notepad++, VS Code, ou o próprio Bloco de Notas) e modifique as variáveis `PASSPHRASE`, `KEY_PATH_NAME` e `KEY_COMMENT` de acordo com suas preferências.

      * **`KEY_PATH_NAME`**: `$HOME/.ssh/id_rsa_vultr_win` resultará em algo como `C:\Users\SeuUsuario\.ssh\id_rsa_vultr_win` (Git Bash) ou `/home/seu_usuario/.ssh/id_rsa_vultr_win` (WSL).

4.  **Execute o script:**

      * **Via Git Bash:** Navegue até o diretório onde salvou o script e execute-o.

        ```bash
        cd /c/Users/SeuUsuario/SeuDiretorio
        ./gerar_chave_ssh_win.sh
        ```

      * **Via WSL (Ubuntu/Debian, etc.):** Inicie seu terminal WSL, navegue até o local onde salvou o script (se estiver no sistema de arquivos do Windows, será algo como `/mnt/c/Users/SeuUsuario/SeuDiretorio`) e execute-o.

        ```bash
        cd /mnt/c/Users/SeuUsuario/SeuDiretorio
        chmod +x gerar_chave_ssh_win.sh # Torna o script executável
        ./gerar_chave_ssh_win.sh
        ```

O script guiará você pelo processo de geração das chaves, assim como a versão para Linux. As chaves serão criadas no diretório `.ssh` dentro do seu perfil de usuário do Windows (se estiver usando Git Bash) ou no diretório `.ssh` do seu usuário WSL (se estiver usando WSL).

--- 

Gerado com ajuda de _IA_ 🤖
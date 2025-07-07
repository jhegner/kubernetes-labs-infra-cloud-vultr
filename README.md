# kubernetes-labs-infra-vultr

Repositório de infraestrutura para provisionar recursos específicos no cloud provider Vultr.

## Recursos Provisionados

Os recursos são organizados em módulos na pasta `modules/`. Cada módulo representa um componente da infraestrutura:

- **network**: Criação de redes privadas para comunicação interna entre recursos.
- **firewall**: Definição de regras de firewall para controlar o tráfego de entrada e saída.
- **instance**: Provisionamento de instâncias (VMs) para execução de workloads.
- **loadbalancer**: Balanceamento de carga entre instâncias para alta disponibilidade.
- **dns**: Gerenciamento de registros DNS para exposição de serviços.
- **databases**: Servicos gerenciados de banco de dados

## Relação entre os Recursos

```text
+---------+      +-----------+      +-------------+
|  DNS    |<---->| LoadBalancer |<-->|  Instance   |
+---------+      +-----------+      +-------------+
                                   /       |      \
                                  /        |       \
                        +---------+   +---------+   +---------+
                        | Instance|   | Instance|   | Instance|
                        +---------+   +---------+   +---------+
                             ^              ^             ^
                             |              |             |
                        +--------------------------------------+
                        |              Network                |
                        +--------------------------------------+
                                   |
                             +-----------+
                             |  Firewall |
                             +-----------+
```

- O **firewall** protege a **network** e os recursos internos.
- A **network** conecta todas as **instances**.
- O **loadbalancer** distribui o tráfego entre as **instances**.
- O **dns** aponta para o **loadbalancer** para expor serviços externamente.

## Estrutura de Pastas

```
modules/
├── dns/
├── firewall/
├── instance/
├── database/
├── loadbalancer/
└── network/
```

Cada subpasta contém os arquivos Terraform para provisionamento do respectivo recurso.

## Cloud Provider

Todos os recursos são provisionados no Vultr, utilizando os módulos acima para garantir uma infraestrutura modular, segura e escalável.

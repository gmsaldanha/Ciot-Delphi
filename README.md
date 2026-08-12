# Ciot-Delphi
Projeto Delphi para Geração de CIOT - Sistema de Gestão de Frota Própria

📋 Descrição
Este projeto é uma aplicação desenvolvida em Delphi que implementa a geração do Código Identificador da Operação de Transporte (CIOT), conforme exigido pela Agência Nacional de Transportes Terrestres (ANTT).

A partir de 24 de maio de 2026, a emissão do CIOT torna-se obrigatória para todas as operações de transporte rodoviário remunerado de cargas. Este sistema permite que empresas com frota própria realizem o cadastramento completo das operações de transporte, gerando o CIOT para cada viagem.

🎯 Funcionalidades
Principais Operações
✅ Geração de CIOT - Declaração de operação de transporte

✅ Consulta de CIOT - Verificação de CIOTs gerados

✅ Cancelamento de CIOT - Cancelamento de operações

✅ Encerramento de CIOT - Encerramento de operações concluídas

✅ Consulta de Frota - Verificação de veículos cadastrados

✅ Consulta de Transportador - Verificação de situação do transportador

✅ Consulta de Exceção - Verificação de lista de exceção da ANTT

Dados da Operação
🔹 Transportador (CNPJ/CPF e RNTRC)

🔹 Contratante do Frete (CNPJ/CPF)

🔹 Destinatário (CNPJ/CPF)

🔹 Veículos (Placa e RNTRC)

🔹 Origem e Destino (Municípios)

🔹 Carga (Natureza, Peso, Tipo)

🔹 Valores (Valor do Frete)

🔹 Pagamento (Tipo e forma de pagamento)

🚀 Pré-requisitos
Software
Delphi (versão com suporte a componentes ACBr)

ACBr Framework (com suporte a CIOT)

OpenSSL (para comunicação HTTPS)

Windows (10/11 ou Server)

Certificado Digital
Certificado digital A1 ou A3 (PFX)

Válido e com CNPJ compatível com a operação

Instalado no computador ou armazenado em token/cartão

Credenciais
CNPJ da Empresa (Transportador)

RNTRC (Registro Nacional de Transportadores Rodoviários de Carga)

Certificado Digital do transportador

📦 Instalação
1. Clonar o Repositório
bash
git clone https://github.com/seu-usuario/ciot-frota-propria.git
cd ciot-frota-propria
2. Instalar Componentes ACBr
text
- Baixe o ACBr Framework em: https://acbr.sourceforge.io/
- Instale os componentes no Delphi
- Certifique-se de que o componente ACBrCIOT está disponível
3. Configurar OpenSSL
text
- Instale o OpenSSL no sistema
- Configure o PATH para os binários do OpenSSL
- Verifique as DLLs necessárias (libeay32.dll, ssleay32.dll)
4. Compilar o Projeto
text
- Abra o projeto no Delphi
- Compile a aplicação
- Execute o arquivo .EXE gerado
⚙️ Configuração
Primeira Execução
Certificado Digital

Clique em "Selecionar Certificado" (🔍)

Escolha o arquivo PFX do certificado

Informe a senha do certificado

Clique em "Carregar Certificado"

Dados da Empresa

Informe o CNPJ do transportador

Informe o RNTRC (9 dígitos)

Clique em "Salvar Dados"

Dados do Contratante

CNPJ do contratante do frete

Nome/Razão Social

Dados bancários (opcional)

Ambiente

Selecione Produção ou Homologação

Configure os parâmetros de SSL/TLS

Dados de Frota
Para operações com frota própria:

Cadastre as placas dos veículos no campo "Placas"

Separe múltiplas placas por vírgula (ex: ABC1234, DEF5678)

Selecione o Tipo de Veículo:

trCavaloMecanico - Caminhão com reboque

trTruck - Caminhão simples

trToco - Caminhão pequeno

⚠️ Importante: Para cavalo mecânico, informe também o reboque.

📝 Como Usar
1. Gerar CIOT (Nova Operação)
Passo 1: Preencher Dados

text
1. ID Operação: Número único da operação
2. Transportador: CNPJ e RNTRC (preenchidos automaticamente)
3. Contratante: CNPJ do contratante do frete
4. Destinatário: CNPJ do destinatário da carga
5. Veículos: Selecione o tipo e informe as placas
6. Origem/Destino: Códigos dos municípios
7. Carga: Natureza, peso e tipo
8. Valor: Informe o valor do frete
Passo 2: Enviar Declaração

text
- Clique em "Declarar Operação"
- Aguarde a resposta da ANTT
- O sistema exibirá o CIOT gerado (ID da Operação)
Passo 3: Salvar CIOT

text
- Copie o ID da Operação (CIOT) gerado
- Armazene para consultas e encerramento futuros
2. Consultar CIOT
text
1. Informe o ID da Operação (CIOT)
2. Clique em "Consultar CIOT"
3. Visualize os dados da operação:
   - Protocolo
   - Código Verificador
   - Status da operação
   - Mensagens de retorno
3. Cancelar CIOT
text
1. Consulte o CIOT primeiro (para obter os dados)
2. Clique em "Cancelar CIOT"
3. Confirme o cancelamento
4. Sistema retornará a confirmação
4. Encerrar CIOT
text
1. Consulte o CIOT primeiro
2. Após concluir a viagem, clique em "Encerrar CIOT"
3. O sistema confirma o encerramento da operação
🔍 Funcionalidades de Consulta
Consultar Frota
text
- Preencha as placas dos veículos (separadas por vírgula)
- Clique em "Consultar Frota"
- Verifica se os veículos pertencem ao transportador
- Retorna situação de cada veículo na frota
Consultar Situação do Transportador
text
- Verifica situação do RNTRC
- Confirma se está ativo
- Retorna dados cadastrais do transportador
Consultar Exceção
text
- Verifica se o transportador está na lista de exceção
- Útil para confirmar elegibilidade
🏗️ Estrutura do Código
Principais Métodos
GerarCIOT
Gera um novo CIOT para a operação de transporte.

pascal
function TForm1.GerarCIOT: Boolean;
begin
  // 1. Monta o JSON da declaração
  JsonCIOT := MontarJsonCIOT;
  
  // 2. Envia para a ANTT
  Resposta := DeclararOperacao(JsonCIOT);
  
  // 3. Processa resposta
  // 4. Retorna sucesso/falha
end;
MontarJsonCIOT
Constrói o JSON com todos os dados da operação.

pascal
function TForm1.MontarJsonCIOT: String;
begin
  // Adiciona dados do transportador
  // Adiciona dados do contratante
  // Adiciona dados do destinatário
  // Adiciona veículos
  // Adiciona origem/destino
  // Adiciona carga e valores
end;
MontarArrayVeiculos
Estrutura os dados dos veículos para a frota própria.

pascal
procedure TForm1.MontarArrayVeiculos(J: TJSONObject; RNTRC: string);
begin
  // Para frota própria, todos veículos têm o mesmo RNTRC
  // Adiciona veículo principal
  // Se for cavalo mecânico, adiciona reboque
end;
📊 Exemplo de JSON Enviado
json
{
  "IdOperacaoTransporte": "202600001",
  "TipoOperacao": 2,
  "CpfCnpjContratado": "12345678000199",
  "RNTRCContratado": "012345678",
  "CpfCnpjContratante": "98765432000188",
  "CpfCnpjDestinatario": "12345678000199",
  "DataDeclaracao": "2026-05-20T10:30:00",
  "DataInicioViagem": "2026-05-20",
  "DataFimViagem": "2026-05-30",
  "IndContingencia": false,
  "ValorFrete": 100.00,
  "Veiculos": [
    {
      "Placa": "ABC1234",
      "RNTRCVeiculo": "012345678",
      "NumeroEixos": "3"
    }
  ],
  "OrigemDestino": [
    {
      "Origem": {
        "CodigoMunicipioOrigem": "9999999"
      },
      "Destino": {
        "CodigoMunicipioDestino": "99999999"
      },
      "DistanciaPercorrida": 100
    }
  ],
  "DadosCarga": {
    "CodigoNaturezaCarga": "2101",
    "PesoCarga": 1000.00,
    "CodigoTipoCarga": "5",
    "ContratantesCargFrac": [
      "12345678000199"
    ]
  },
  "InfPagamento": [
    {
      "TipoPagamento": 5,
      "IndPagamento": 0,
      "CpfCnpjCreditado": "98765432000188"
    }
  ]
}
⚠️ Regras Importantes para Frota Própria
RNTRC Único: Todos os veículos da frota própria devem ter o mesmo RNTRC (da empresa transportadora)

Contratante ≠ Contratante da Carga: O contratante do frete NÃO pode ser igual ao contratante da carga fracionada

Veículos Cadastrados: Para consulta de frota, os veículos devem estar cadastrados na ANTT

Cavalo Mecânico: Requer obrigatoriamente um reboque cadastrado

Validade do CIOT: O CIOT deve ser encerrado até a data final da viagem

Piso Mínimo: O valor do frete deve respeitar o piso mínimo estabelecido pela ANTT

🔒 Segurança
Certificado Digital: Necessário para autenticação

HTTPS: Comunicação criptografada via TLS 1.2

Dados Sensíveis: Armazenados localmente no arquivo .INI

Validações: Múltiplas verificações antes do envio

🐛 Solução de Problemas
Erro: "Certificado não carregado"
text
- Verifique se o arquivo PFX existe
- Confirme a senha do certificado
- Verifique a validade do certificado
Erro: "RNTRC inválido"
text
- RNTRC deve ter 9 dígitos (completar com zero à esquerda)
- Verificar se está ativo na ANTT
Erro: "Transportador não possui frota"
text
- Verifique se os veículos estão cadastrados
- Confirme se os veículos pertencem ao transportador
Erro de Conexão
text
- Verifique a conexão com a internet
- Confirme se o ambiente está correto (Produção/Homologação)
- Verifique as configurações de proxy
📁 Estrutura de Arquivos
text
CIOT-Frota-Propria/
├── Main.pas              # Código principal
├── Main.dfm              # Interface do formulário
├── CIOT.ini              # Arquivo de configuração
├── README.md             # Este documento
└── LICENSE               # Licença do projeto
🔄 Atualizações e Manutenção
Versão Atual: 1.0.0
✅ Geração de CIOT para frota própria

✅ Consulta de CIOT

✅ Cancelamento e encerramento

✅ Consulta de frota

✅ Suporte a ambiente de homologação

Próximas Atualizações
□ Interface melhorada
□ Histórico de operações
□ Relatórios
□ Integração com sistemas ERP
□ Emissão em lote
📞 Suporte
Documentação Oficial ANTT
Manual do CIOT

Consulta Pública CIOT

Calculadora de Frete

Legislação
MP 1.343/2026: Obrigatoriedade do CIOT

Resolução ANTT 6.078/2026: Regulamentação do CIOT

Portaria SUROC 6/2026: Regras operacionais

📄 Licença
Este projeto está licenciado sob a MIT License - veja o arquivo LICENSE para detalhes.

🤝 Contribuições
Contribuições são bem-vindas! Por favor:

Faça um Fork do projeto

Crie sua feature branch (git checkout -b feature/AmazingFeature)

Commit suas mudanças (git commit -m 'Add some AmazingFeature')

Push para a branch (git push origin feature/AmazingFeature)

Abra um Pull Request

Desenvolvido para atender à obrigatoriedade da ANTT a partir de 24/05/2026

⚠️ Aviso Legal: Este software é fornecido "como está", sem garantias de qualquer tipo. A responsabilidade pelo uso correto e conformidade com a legislação é do usuário. Sempre verifique as atualizações das regras da ANTT.





# 💰 **APOIE O PROJETO**

> ⭐ **Se este projeto te ajudou, considere fazer uma doação para apoiar o desenvolvimento contínuo!** ⭐

---

## 📱 **QR Code Pix**

<p align="center">
  <a href="images/qrcodegmsaldanhaMP.png" target="_blank">
    <img src="images/qrcodegmsaldanhaMP.png" alt="QR Code Pix - Doação" width="200"/>
  </a>
</p>

<p align="center">
  <strong>🔑 Chave Pix:</strong> <code>gmscomputadores@bol.com.br</code>
</p>

unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Controls, Forms,IniFiles,FileCtrl, Dialogs, ComCtrls, OleCtrls, SHDocVw, StdCtrls, Buttons, ExtCtrls,
  blcksock, ACBrDFeSSL, urlmon, IdHTTP, pcnConversao, ACBrDFeOpenSSL,ACBrDFeUtil,  System.JSON,
  System.Types, System.UITypes, System.DateUtils,  IdBaseComponent, IdComponent,  IdTCPConnection,
  IdTCPClient, IdCTypes, IdSSLOpenSSLHeaders, IdServerIOHandler, IdSSL, IdSSLOpenSSL,System.TypInfo,
  ACBrCIOT, ACBrBase, ACBrDFe;
type
  TForm1 = class(TForm)
    ACBrCIOT1: TACBrCIOT;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label69: TLabel;
    Label75: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label76: TLabel;
    BitBtn31: TBitBtn;
    BitBtn27: TBitBtn;
    BitBtn26: TBitBtn;
    BitBtn30: TBitBtn;
    BitBtn29: TBitBtn;
    BitBtn28: TBitBtn;
    Panel5: TPanel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label65: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    edcnpjcontratante: TEdit;
    comboformpag: TComboBox;
    edcontratante: TEdit;
    EDTCNPJBANCO: TEdit;
    edtcodbanco: TEdit;
    edtagencia: TEdit;
    Button1: TButton;
    edtproduto: TEdit;
    edtncmpred: TEdit;
    edtean: TEdit;
    Memo4: TMemo;
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    edcnpjemp: TEdit;
    edrntc: TEdit;
    Button2: TButton;
    BitBtn33: TBitBtn;
    edtplacas: TEdit;
    Label70: TLabel;
    BitBtn34: TBitBtn;
    BitBtn32: TBitBtn;
    BitBtn43: TBitBtn;
    PageControl2: TPageControl;
    TabSheet4: TTabSheet;
    PageControl4: TPageControl;
    TabSheet5: TTabSheet;
    lSSLLib: TLabel;
    lCryptLib: TLabel;
    lHttpLib: TLabel;
    lXmlSign: TLabel;
    gbCertificado: TGroupBox;
    Label59: TLabel;
    Label2: TLabel;
    sbtnCaminhoCert: TSpeedButton;
    Label4: TLabel;
    sbtnNumSerie: TSpeedButton;
    edtCaminho: TEdit;
    edtSenha: TEdit;
    edtNumSerie_1: TEdit;
    cbSSLLib: TComboBox;
    cbCryptLib: TComboBox;
    cbHttpLib: TComboBox;
    cbXmlSignLib: TComboBox;
    TabSheet6: TTabSheet;
    rgNormalHomolog: TRadioGroup;
    rgNormalContingencia: TRadioGroup;
    cbSSLTypeCiot: TComboBox;
    Label25: TLabel;
    cbUF: TComboBox;
    Label5: TLabel;
    BitBtn35: TBitBtn;
    edidoperacao: TEdit;
    edprotocolo: TEdit;
    edcodver: TEdit;
    edcodigo: TEdit;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    OpenDialog1: TOpenDialog;
    Label51: TLabel;
    ComboBox1: TComboBox;
    procedure Label75Click(Sender: TObject);
    procedure Label76Click(Sender: TObject);
    procedure BitBtn31Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn33Click(Sender: TObject);
    procedure BitBtn34Click(Sender: TObject);
    procedure BitBtn32Click(Sender: TObject);
    procedure BitBtn35Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure sbtnCaminhoCertClick(Sender: TObject);
    procedure sbtnNumSerieClick(Sender: TObject);
    procedure BitBtn26Click(Sender: TObject);
    procedure BitBtn27Click(Sender: TObject);
    procedure BitBtn28Click(Sender: TObject);
    procedure BitBtn30Click(Sender: TObject);
    procedure BitBtn29Click(Sender: TObject);
  private
    function OnlyLettersAndNumbers(const AValue: string): string;
    function OnlyNumbers(const AValue: string): string;
    function ConsultarSituacaoTransportador(const ACpfCnpjInteressado,
      ACpfCnpjTransportador, ARNTRCTransportador: string): string;
    function CompletarRNTRC(const ARNTRC: string): string;
    function ProcessarPlacasDoEdit(const APlacasText: string): TArray<string>;
    function ConsultarCIOT(const ACIOT: string): string;
    function ConsultarExcecao(const ACpfCnpjTransportador: string): string;
    function ConsultarFrotaTransportador(const ACpfCnpjInteressado,
      ACpfCnpjTransportador, ARNTRCTransportador: string;
     const APlacas: TArray<string>): string;
    procedure ConfiguraComponente;
    procedure VerificarCertificadoProducao;
    function GerarCIOT: Boolean;
    function MontarJsonCIOT: String;
    procedure MontarArrayVeiculos(J: TJSONObject; RNTRC: string);
    function DeclararOperacao(const AJson: string): string;
    function CancelarOperacao(const ACIOT, AMotivo: string): string;
    function EncerrarOperacao(const AJson: string): string;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
function TForm1.OnlyNumbers(const AValue: string): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(AValue) do
    if AValue[i] in ['0'..'9'] then
      Result := Result + AValue[i];
end;
function TForm1.OnlyLettersAndNumbers(const AValue: string): string;
var
  i: Integer;
  ch: Char;
begin
  Result := '';
  for i := 1 to Length(AValue) do
  begin
    ch := AValue[i];
    if ch in ['A'..'Z', 'a'..'z', '0'..'9'] then
      Result := Result + UpperCase(ch);
  end;
end;
function TForm1.ConsultarCIOT(const ACIOT: string): string;
var
  JsonRequest: TJSONObject;
  ConteudoXML: string;
  URL: string;
  JsonResp: TJSONObject;
begin
  Result := '';

  JsonRequest := TJSONObject.Create;
  try
    JsonRequest.AddPair('CodigoIdentificacaoOperacao', ACIOT);
    JsonRequest.AddPair('AnoDeclaracao',TJSONNumber.Create(YearOf(Now)));

    ConteudoXML := JsonRequest.ToJSON;
    memo4.Lines.Add('JSON Consulta: ' + ConteudoXML);
    if rgNormalHomolog.ItemIndex = 0 then
      URL := 'https://appservices.antt.gov.br/pefServices/api/ConsultarCIOTGerado'
    else
      URL := 'https://appservices-hml.antt.gov.br/pefServices/api/ConsultarCIOTGerado';

    Result := ACBrCIOT1.SSL.Enviar(
      ConteudoXML,
      URL,
      '',
      'application/json; charset=utf-8',
      '',
      False
    );

     memo4.Lines.Add(UTF8ToString('Consulta Status: ' + IntToStr(ACBrCIOT1.SSL.HTTPResultCode)));
     memo4.Lines.Add(UTF8ToString('Resposta Consulta: ' + Result));

    JsonResp := TJSONObject.ParseJSONValue(Result) as TJSONObject;
    try
      if JsonResp <> nil then
      begin

        edidoperacao.Text := JsonResp.GetValue<string>('IdOperacaoTransporte', '');
        edprotocolo.Text:= JsonResp.GetValue<string>('Protocolo', '');
        edcodver.Text  := JsonResp.GetValue<string>('CodigoVerificador', '');
        edcodigo.Text:= JsonResp.GetValue<string>('Codigo', '');
        memo1.Text:= JsonResp.GetValue<string>('Mensagem', '');
        memo4.Lines.Add('IdOperacao: ' + edidoperacao.Text);
        memo4.Lines.Add('Protocolo: ' + edprotocolo.Text);
        memo4.Lines.Add('Código Verificador: ' + edcodver.Text);
        memo4.Lines.Add('Código Retorno: ' + edcodigo.Text);
        memo4.Lines.Add('Mensagem: ' + memo1.Text);

      end;
    finally
      JsonResp.Free;
    end;

  finally
    JsonRequest.Free;
  end;
end;

function TForm1.CompletarRNTRC(const ARNTRC: string): string;
begin
  Result := OnlyNumbers(ARNTRC);
  if Length(Result) = 8 then
    Result := '0' + Result
  else if Length(Result) = 7 then
    Result := '00' + Result
  else if Length(Result) < 7 then
    Result := StringOfChar('0', 9 - Length(Result)) + Result;
end;


function TForm1.ConsultarSituacaoTransportador(const ACpfCnpjInteressado, ACpfCnpjTransportador, ARNTRCTransportador: string): string;
var
  JsonRequest: TJSONObject;
  ConteudoXML: string;
  URL: string;
  Resposta: string;
  JsonResposta: TJSONObject;
begin
  Result := '';

  JsonRequest := TJSONObject.Create;
  try
    // Monta o JSON conforme documentação
    if ACpfCnpjInteressado <> '' then
      JsonRequest.AddPair('CpfCnpjInteressado', OnlyNumbers(ACpfCnpjInteressado));

    if ACpfCnpjTransportador <> '' then
      JsonRequest.AddPair('CpfCnpjTransportador', OnlyNumbers(ACpfCnpjTransportador));

    if ARNTRCTransportador <> '' then
    begin
      // Garante 9 dígitos (completa com zero à esquerda)
      JsonRequest.AddPair('RNTRCTransportador', CompletarRNTRC(ARNTRCTransportador));
    end;

    ConteudoXML := JsonRequest.ToJSON;
    memo4.Lines.Add('JSON ConsultaSituacaoTransportador: ' + ConteudoXML);

    if rgNormalHomolog.ItemIndex=0 then
    URL := 'https://appservices.antt.gov.br/pefServices/api/ConsultarSituacaoTransportador'
   else
    URL := 'https://appservices-hml.antt.gov.br/pefServices/api/ConsultarSituacaoTransportador';



    Resposta := ACBrCIOT1.SSL.Enviar(ConteudoXML,URL,'','application/json; charset=utf-8','',False);


    memo4.Lines.Add('Status Code: ' + IntToStr(ACBrCIOT1.SSL.HTTPResultCode));
    memo4.Lines.Add('Resposta: ' + Resposta);

    // Processa a resposta
    JsonResposta := TJSONObject.ParseJSONValue(Resposta) as TJSONObject;
    if JsonResposta <> nil then
    begin
      try
        memo4.Lines.Add('=== DADOS DO TRANSPORTADOR ===');
        memo4.Lines.Add('CNPJ/CPF: ' + JsonResposta.GetValue<string>('CpfCnpjTransportador', ''));
        memo4.Lines.Add('RNTRC: ' + JsonResposta.GetValue<string>('RNTRCTransportador', ''));
        memo4.Lines.Add('Razão Social: ' + JsonResposta.GetValue<string>('NomeRazaoSocialTransportador', ''));
        memo4.Lines.Add('RNTRC Ativo: ' + BoolToStr(JsonResposta.GetValue<Boolean>('RNTRCAtivo', False), True));
        memo4.Lines.Add('Tipo Transportador: ' + JsonResposta.GetValue<string>('TipoTransportador', ''));
        memo4.Lines.Add('Equiparado TAC: ' + BoolToStr(JsonResposta.GetValue<Boolean>('EquiparadoTAC', False), True));
        memo4.Lines.Add('Protocolo: ' + JsonResposta.GetValue<string>('Protocolo', ''));
        memo4.Lines.Add('Código: ' + JsonResposta.GetValue<string>('Codigo', ''));
        memo4.Lines.Add('Mensagem: ' + JsonResposta.GetValue<string>('Mensagem', ''));
      finally
        JsonResposta.Free;
      end;
    end;

    Result := Resposta;

  finally
    JsonRequest.Free;
  end;
end;

function TForm1.ProcessarPlacasDoEdit(const APlacasText: string): TArray<string>;
var
  ListaPlacas: TStringList;
  i: Integer;
begin
  Result := nil;

  if Trim(APlacasText) = '' then
  begin
    memo4.Lines.Add('Nenhuma placa informada!');
    Exit;
  end;

  ListaPlacas := TStringList.Create;
  try
    // Substitui vírgula por quebra de linha para usar o DelimitedText
    ListaPlacas.DelimitedText := APlacasText;
    ListaPlacas.Delimiter := ',';

    // Remove espaços e converte para maiúsculo
    for i := 0 to ListaPlacas.Count - 1 do
      ListaPlacas[i] := Trim(UpperCase(ListaPlacas[i]));

    // Converte para array
    SetLength(Result, ListaPlacas.Count);
    for i := 0 to ListaPlacas.Count - 1 do
      Result[i] := ListaPlacas[i];

    memo4.Lines.Add(Format('%d placa(s) processada(s): %s', [ListaPlacas.Count, ListaPlacas.CommaText]));

  finally
    ListaPlacas.Free;
  end;
end;
procedure TForm1.sbtnCaminhoCertClick(Sender: TObject);
begin
OpenDialog1.Title := 'Selecione o Certificado';
OpenDialog1.DefaultExt := '*.pfx';
OpenDialog1.Filter := 'Arquivos PFX (*.pfx)|*.pfx|Todos os Arquivos (*.*)|*.*';
if OpenDialog1.Execute then
begin
edtCaminho.Text := OpenDialog1.FileName;
end;
end;

procedure TForm1.sbtnNumSerieClick(Sender: TObject);
begin
edtNumSerie_1.Text := ACBRciot1.SSL.SelecionarCertificado;
end;

function TForm1.ConsultarExcecao(const ACpfCnpjTransportador: string): string;
var
  URL: string;
  LResponse: string;
  JsonResposta: TJSONObject;
  RetornoObj: TJSONObject;
  IdHTTP: TIdHTTP;
  SSLHandler: TIdSSLIOHandlerSocketOpenSSL;
begin
  Result := '';


  if rgNormalHomolog.ItemIndex = 0 then
    URL := 'https://appservices.antt.gov.br/pefServices/api/ConsultarExcecao?CPFCNPJTransportador="' + OnlyNumbers(ACpfCnpjTransportador)+'"'
  else
    URL := 'https://appservices-hml.antt.gov.br/pefServices/api/ConsultarExcecao?CPFCNPJTransportador="' + OnlyNumbers(ACpfCnpjTransportador)+'"';

  memo4.Lines.Add('URL ConsultaExcecao: ' + URL);
  IdHTTP := TIdHTTP.Create(nil);
  SSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create(IdHTTP);
  try
   try
    // Configura o SSL para TLS 1.2
    SSLHandler.SSLOptions.Method := sslvTLSv1_2;
    SSLHandler.SSLOptions.SSLVersions := [sslvTLSv1_2];
    SSLHandler.SSLOptions.Mode := sslmUnassigned;
    SSLHandler.SSLOptions.VerifyMode := [];
    SSLHandler.SSLOptions.VerifyDepth := 0;
    IdHTTP.IOHandler := SSLHandler;
    IdHTTP.Request.Clear;
    IdHTTP.Request.UserAgent := 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36';
    IdHTTP.Request.Accept := 'application/json, text/plain, */*';
    IdHTTP.Request.ContentType := 'application/json';
    LResponse := IdHTTP.Get(URL);
    memo4.Lines.Add('Status Code: ' + IntToStr(IdHTTP.ResponseCode));
    memo4.Lines.Add('Resposta: ' + LResponse);

    JsonResposta := TJSONObject.ParseJSONValue(LResponse) as TJSONObject;
    if JsonResposta <> nil then
    begin
      try
        if JsonResposta.TryGetValue<TJSONObject>('Retorno', RetornoObj) then
        begin
          memo4.Lines.Add('=== VERIFICAÇÃO DE EXCEÇÃO ===');
          memo4.Lines.Add('CNPJ/CPF: ' + RetornoObj.GetValue<string>('CpfCnpjTransportador', ''));
          memo4.Lines.Add('Está na lista de exceção: ' + BoolToStr(RetornoObj.GetValue<Boolean>('Flag', False), True));
        end;
        memo4.Lines.Add('Código: ' + JsonResposta.GetValue<string>('Codigo', ''));
        memo4.Lines.Add('Mensagem: ' + JsonResposta.GetValue<string>('Mensagem', ''));
      finally
        JsonResposta.Free;
      end;
    end;
    Result := LResponse;
    except
    on E: EIdHTTPProtocolException do
    begin
      memo4.Lines.Add('Erro HTTP: ' + IntToStr(E.ErrorCode) + ' - ' + E.Message);
      memo4.Lines.Add('Resposta de erro: ' + E.ErrorMessage);
      Result := 'Erro: ' + E.Message;
    end;
    on E: Exception do
    begin
      memo4.Lines.Add('Erro geral: ' + E.Message);
      Result := 'Erro: ' + E.Message;
    end;
   end;
    finally
    IdHTTP.Free;
    end;


end;


function TForm1.ConsultarFrotaTransportador(
  const ACpfCnpjInteressado, ACpfCnpjTransportador, ARNTRCTransportador: string;
  const APlacas: TArray<string>): string;
var
  JsonRequest: TJSONObject;
  PlacasArray: TJSONArray;
  ConteudoXML: string;
  URL: string;
  Resposta: string;
  JsonResposta: TJSONObject;
  FrotaArray: TJSONArray;
  i: Integer;
  PlacaVeiculo: string;
  Situacao: Integer;
begin
  Result := '';

  JsonRequest := TJSONObject.Create;
  try
    // Adiciona campos obrigatórios
    if ACpfCnpjInteressado <> '' then
      JsonRequest.AddPair('CpfCnpjInteressado', OnlyNumbers(ACpfCnpjInteressado));

    if ACpfCnpjTransportador <> '' then
      JsonRequest.AddPair('CpfCnpjTransportador', OnlyNumbers(ACpfCnpjTransportador));

    if ARNTRCTransportador <> '' then
      JsonRequest.AddPair('RNTRCTransportador', CompletarRNTRC(ARNTRCTransportador));

    // Adiciona array de placas
    if Length(APlacas) > 0 then
    begin
      PlacasArray := TJSONArray.Create;
      for i := 0 to High(APlacas) do
        PlacasArray.Add(OnlyLettersAndNumbers(APlacas[i]));
      JsonRequest.AddPair('Placas', PlacasArray);
    end;

    ConteudoXML := JsonRequest.ToJSON;
    memo4.Lines.Add('JSON ConsultarFrotaTransportador: ' + ConteudoXML);

    if rgNormalHomolog.ItemIndex=0 then
    URL := 'https://appservices.antt.gov.br/pefServices/api/ConsultarFrotaTransportador'
    else
    URL := 'https://appservices-hml.antt.gov.br/pefServices/api/ConsultarFrotaTransportador';
    Resposta := ACBrCIOT1.SSL.Enviar(
      ConteudoXML,
      URL,
      '',
      'application/json; charset=utf-8',
      '',
      False
    );

    memo4.Lines.Add('Status Code: ' + IntToStr(ACBrCIOT1.SSL.HTTPResultCode));
    memo4.Lines.Add('Resposta: ' + Resposta);

    // Processa a resposta
    JsonResposta := TJSONObject.ParseJSONValue(Resposta) as TJSONObject;
    if JsonResposta <> nil then
    begin
      try
        memo4.Lines.Add('=== DADOS DA FROTA ===');
        memo4.Lines.Add('CNPJ/CPF: ' + JsonResposta.GetValue<string>('CpfCnpjTransportador', ''));
        memo4.Lines.Add('RNTRC: ' + JsonResposta.GetValue<string>('RNTRCTransportador', ''));
        memo4.Lines.Add('Razão Social: ' + JsonResposta.GetValue<string>('NomeRazaoSocialTransportador', ''));
        memo4.Lines.Add('RNTRC Ativo: ' + BoolToStr(JsonResposta.GetValue<Boolean>('RNTRCAtivo', False), True));

        // Processa array de frota
        if JsonResposta.TryGetValue<TJSONArray>('Frota', FrotaArray) then
        begin
          memo4.Lines.Add('--- VEÍCULOS ---');
          for i := 0 to FrotaArray.Count - 1 do
          begin
            PlacaVeiculo := FrotaArray.Items[i].GetValue<string>('PlacaVeiculo', '');
            Situacao := FrotaArray.Items[i].GetValue<Integer>('SituacaoVeiculoFrotaTransportador', 0);
            memo4.Lines.Add(Format('Placa: %s - Pertence: %s', [PlacaVeiculo, BoolToStr(Situacao = 1, True)]));
          end;
        end;

        memo4.Lines.Add('Protocolo: ' + JsonResposta.GetValue<string>('Protocolo', ''));
        memo4.Lines.Add('Código: ' + JsonResposta.GetValue<string>('Codigo', ''));
        memo4.Lines.Add('Mensagem: ' + JsonResposta.GetValue<string>('Mensagem', ''));

      finally
        JsonResposta.Free;
      end;
    end;

    Result := Resposta;

  finally
    JsonRequest.Free;
  end;
end;
function TForm1.MontarJsonCIOT: String;
var
  J: TJSONObject;
  OrigemDestino: TJSONArray;
  OD: TJSONObject;
  Origem, Destino: TJSONObject;
  DadosCarga: TJSONObject;
  InfPagamento: TJSONArray;
  Pagamento: TJSONObject;
  CNPJTransportador: string;
  CNPJDestinatario: string;
  CNPJContratanteFrete: string;
  CNPJContratanteCarga: string;
  RNTRC: string;
  ContratantesArray: TJSONArray;
  TipoVeiculo: string;
  FS: TFormatSettings;
begin
  J := TJSONObject.Create;
  try
    // Dados da empresa transportadora
    CNPJTransportador := OnlyNumbers(edcnpjemp.Text);
    RNTRC := OnlyNumbers(edrntc.text);
    TipoVeiculo := combobox1.Text;

    // Destinatário
    CNPJDestinatario := OnlyNumbers(EDTCNPJBANCO.Text);
    if CNPJDestinatario = '' then begin
     showmessage('Informe o CnpjCpf do Destinatario.');
     exit;
      end;

    // Contratante do frete (quem contrata o transporte)
    CNPJContratanteFrete := OnlyNumbers(edcnpjcontratante.Text);
    if CNPJContratanteFrete = '' then begin
     showmessage('Informe o CnpjCpf do Contratante.');
     exit;
      end;

    // CRÍTICO: Contratante da carga fracionada NÃO pode ser igual ao contratante do frete
    // Use o CNPJ do destinatário ou outro CNPJ válido diferente
    CNPJContratanteCarga := CNPJDestinatario;
    if (CNPJContratanteCarga = CNPJContratanteFrete) or (CNPJContratanteCarga = '') then begin
     showmessage('Informe o CnpjCpf do Contratante da carga.');
     exit;
      end;

    // 1. ID da operação (do endpoint /gerar)
     if edidoperacao.Text<>''  then begin
     J.AddPair('IdOperacaoTransporte', edidoperacao.Text)
     end else begin
     showmessage('ID Operação Transporte nao Informado.');
     exit;
      end;


    J.AddPair('TipoOperacao', TJSONNumber.Create(2));

    // 2. Transportador
    J.AddPair('CpfCnpjContratado', CNPJTransportador);
    J.AddPair('RNTRCContratado', RNTRC);

    // 3. Contratante do frete
    J.AddPair('CpfCnpjContratante', CNPJContratanteFrete);

    // 4. Destinatário
    J.AddPair('CpfCnpjDestinatario', CNPJDestinatario);

    // 5. Datas
    J.AddPair('DataDeclaracao', FormatDateTime('yyyy-mm-dd"T"hh:nn:ss', Now));
    J.AddPair('DataInicioViagem', FormatDateTime('yyyy-mm-dd', Now));
    J.AddPair('DataFimViagem', FormatDateTime('yyyy-mm-dd', Now + 10));

    //modo contingencia
    if rgNormalContingencia.ItemIndex = 0 then begin
    J.AddPair('IndContingencia',TJSONFalse.Create);
    end else begin
    J.AddPair('IndContingencia',TJSONTrue.Create);
    J.AddPair('JustificativaContingencia', 'Instabilidade na ANTT');

    end;

    // 6. Valor do frete
    FS := TFormatSettings.Create;
    FS.DecimalSeparator := '.';
    J.AddPair('ValorFrete',StringReplace(FloatToStr(100.00, FS),',','.',[rfReplaceAll]));

    // 7. Veículos - SOMENTE se não for cavalo mecânico ou se tiver reboque
    if (TipoVeiculo = 'trCavaloMecanico') and (Trim('ZZZ0000') = '') then
    begin
      memo4.Lines.Add('ERRO: Cavalo mecânico requer reboque. Use trToco para teste.');
      Result := '';
      Exit;
    end;

    MontarArrayVeiculos(J, RNTRC);

    // 8. Origem e Destino
    OrigemDestino := TJSONArray.Create;
    OD := TJSONObject.Create;

    Origem := TJSONObject.Create;
    Origem.AddPair('CodigoMunicipioOrigem', '9999999');
    OD.AddPair('Origem', Origem);

    Destino := TJSONObject.Create;
    Destino.AddPair('CodigoMunicipioDestino','99999999');
    OD.AddPair('Destino', Destino);

    OD.AddPair('DistanciaPercorrida', TJSONNumber.Create(100));
    OrigemDestino.Add(OD);
    J.AddPair('OrigemDestino', OrigemDestino);

    // 9. Dados da Carga
    DadosCarga := TJSONObject.Create;
    DadosCarga.AddPair('CodigoNaturezaCarga', '2101');
    DadosCarga.AddPair('PesoCarga',StringReplace(FormatFloat('0.00', 1000.00),',','.',[rfReplaceAll]));
    DadosCarga.AddPair('CodigoTipoCarga', '5');
    ContratantesArray := TJSONArray.Create;
    ContratantesArray.Add(CNPJContratanteCarga);
    DadosCarga.AddPair('ContratantesCargFrac', ContratantesArray);
    J.AddPair('DadosCarga', DadosCarga);


    InfPagamento := TJSONArray.Create;
    Pagamento := TJSONObject.Create;
   // Pagamento.AddPair('TipoPagamento', '5');
    Pagamento.AddPair('TipoPagamento',TJSONNumber.Create(5));
    Pagamento.AddPair('IndPagamento',TJSONNumber.Create(0));
    Pagamento.AddPair('CpfCnpjCreditado', CNPJContratanteFrete);
    InfPagamento.Add(Pagamento);
    J.AddPair('InfPagamento', InfPagamento);

    Result := J.ToJSON;
    memo4.Lines.Add('JSON Enviado: ' + Result);

  finally
    J.Free;
  end;
end;
function TForm1.DeclararOperacao(const AJson: string): string;
var
ConteudoXML: string;
ciot_protocolo,ciot_codigoverificador,ciot_codigo,ciot_mensagem,ciot_idoperacao: string;
JsonResp: TJSONObject;
begin
ConteudoXML := AJson;
  Result := '';
  try
  if rgNormalHomolog.ItemIndex=0 then begin
    Result := ACBrCIOT1.SSL.Enviar(
      ConteudoXML,
      'https://appservices.antt.gov.br/pefServices/api/DeclaracaoOperacaoTransporte',
      '',
      'application/json; charset=utf-8',
      '',
      False
    );
  end else begin
    Result := ACBrCIOT1.SSL.Enviar(
      ConteudoXML,
      'https://appservices-hml.antt.gov.br/pefServices/api/DeclaracaoOperacaoTransporte',
      '',
      'application/json; charset=utf-8',
      '',
      False
    );
  end;





    memo4.Lines.Add('Status Code: ' + IntToStr(ACBrCIOT1.SSL.HTTPResultCode));
    memo4.Lines.Add(UTF8ToString('Resposta: ' + Result));
    JsonResp := TJSONObject.ParseJSONValue(Result) as TJSONObject;
    try
      if JsonResp <> nil then
      begin
        ciot_idoperacao := JsonResp.GetValue<string>('IdOperacaoTransporte', '');

        memo4.Lines.Add('IdOperacao: ' + ciot_idoperacao);
        memo4.Lines.Add('Protocolo: ' + ciot_protocolo);
        memo4.Lines.Add('Código Verificador: ' + ciot_codigoverificador);
        memo4.Lines.Add('Código Retorno: ' + ciot_codigo);
        memo4.Lines.Add('Mensagem: ' + ciot_mensagem);

      end;
    finally
      JsonResp.Free;
    end;

  except
    on E: Exception do
    begin
      memo4.Lines.Add('Erro: ' + E.Message);
      memo4.Lines.Add('HTTP Result Code: ' + IntToStr(ACBrCIOT1.SSL.HTTPResultCode));
    end;
  end;
end;
function TForm1.GerarCIOT: Boolean;
var
  JsonCIOT: string;
  Resposta: string;
begin
  Result := False;

  JsonCIOT := MontarJsonCIOT;
  if JsonCIOT = '' then
  begin
    memo4.Lines.Add('ERRO: JSON vazio');
    Exit;
  end;

memo4.Lines.Add('CNPJ enviado: ' +OnlyNumbers(edcnpjcontratante.Text));
memo4.Lines.Add('Certificado CNPJ: ' +  ACBrCIOT1.SSL.CertCNPJ);

  Resposta := DeclararOperacao(JsonCIOT);
memo4.Lines.Add('HTTPResultCode: ' + IntToStr(ACBrCIOT1.SSL.HTTPResultCode));
memo4.Lines.Add(UTF8ToString('Resposta RAW: [' + Resposta + ']'));

  if Resposta <> '' then
  begin

    if Pos('erro', LowerCase(Resposta)) = 0 then
    begin
      Result := True;
    end
    else
      memo4.Lines.Add(UTF8ToString('Falha ao gerar CIOT: ' + Resposta));
  end
  else
    memo4.Lines.Add('Falha ao gerar CIOT: Resposta vazia');
end;
procedure TForm1.MontarArrayVeiculos(J: TJSONObject; RNTRC: string);
var
  Veiculos: TJSONArray;
  Veiculo, Implemento: TJSONObject;
  TipoVeiculo: string;
  PlacaImplemento: string;
begin
  Veiculos := TJSONArray.Create;
  TipoVeiculo := combobox1.TEXT;

  Veiculo := TJSONObject.Create;
  Veiculo.AddPair('Placa', 'ZZZ0000');
  Veiculo.AddPair('RNTRCVeiculo', RNTRC);
 MEMO4.Lines.Add('TIPO ESCOLHIDO '+TipoVeiculo);
  if TipoVeiculo = 'trCavaloMecanico' then
    Veiculo.AddPair('NumeroEixos', '3')
  else if TipoVeiculo = 'trTruck' then
    Veiculo.AddPair('NumeroEixos', '3')
  else if TipoVeiculo = 'trToco' then
    Veiculo.AddPair('NumeroEixos', '2')
  else
    Veiculo.AddPair('NumeroEixos', '2');

  Veiculos.Add(Veiculo);

  if (TipoVeiculo = 'trCavaloMecanico') or (TipoVeiculo = 'trTruck') then
  begin

    if Trim('ZZZ0000') <> '' then
    begin
      Implemento := TJSONObject.Create;
      PlacaImplemento := OnlyLettersAndNumbers(Trim('ZZZ0000'));
      Implemento.AddPair('Placa', PlacaImplemento);
      Implemento.AddPair('RNTRCVeiculo', RNTRC);
      Implemento.AddPair('NumeroEixos', '2');
      Veiculos.Add(Implemento);
      memo4.Lines.Add('Reboque adicionado: ' + PlacaImplemento);
    end
    else
    begin
      memo4.Lines.Add('ERRO: ' + TipoVeiculo + ' requer um reboque cadastrado!');
      memo4.Lines.Add('Por favor, cadastre o reboque na tabela TBLMDFE_REBOQUE');
      J.AddPair('Veiculos', Veiculos);
      Exit;
    end;
  end;

  J.AddPair('Veiculos', Veiculos);
end;
procedure TForm1.ConfiguraComponente;
var
 Ok: Boolean;
 PathMensal: String;
begin

  ACBrCIOT1.SSL.DescarregarCertificado;
  ACBrCIOT1.Configuracoes.Certificados.ArquivoPFX  := edtCaminho.Text;
  ACBrCIOT1.Configuracoes.Certificados.Senha       := edtSenha.Text;
  ACBrCIOT1.Configuracoes.Certificados.NumeroSerie := edtNumSerie_1.text;
  ACBrCIOT1.SSL.SSLType := TSSLType(cbSSLTypeCiot.ItemIndex );
  ACBrCIOT1.Configuracoes.geral.SSLLib                := TSSLLib(cbSSLLib.ItemIndex);
  ACBrCIOT1.Configuracoes.geral.SSLCryptLib           := TSSLCryptLib(cbCryptLib.ItemIndex);
  ACBrCIOT1.Configuracoes.geral.SSLHttpLib            := TSSLHttpLib(cbHttpLib.ItemIndex);
  ACBrCIOT1.Configuracoes.geral.SSLXmlSignLib         := TSSLXmlSignLib(cbXmlSignLib.ItemIndex);

  with ACBrCIOT1.Configuracoes.WebServices do
  begin
    UF:= cbUF.Text;
    if rgNormalHomolog.ItemIndex=0 then
    Ambiente   := StrToTpAmb(Ok,IntToStr(1)) else
    Ambiente   := StrToTpAmb(Ok,IntToStr(2))

  end;

end;
procedure TForm1.VerificarCertificadoProducao;
begin
  memo4.Lines.Add('');
  memo4.Lines.Add('=== INFORMAÇÕES DO CERTIFICADO ===');
  memo4.Lines.Add('CNPJ: ' + ACBrCIOT1.SSL.CertCNPJ);
  memo4.Lines.Add('Razão Social: ' + ACBrCIOT1.SSL.CertRazaoSocial);
  memo4.Lines.Add('Certificadora: ' + ACBrCIOT1.SSL.CertCertificadora);
  memo4.Lines.Add('Número Série: ' + ACBrCIOT1.SSL.CertNumeroSerie);
  memo4.Lines.Add('Validade: ' + FormatDateTime('dd/mm/yyyy', ACBrCIOT1.SSL.CertDataVenc));

  // Usando GetEnumName - precisa da unit System.TypInfo
  memo4.Lines.Add('Tipo: ' + GetEnumName(TypeInfo(TSSLTipoCertificado), Integer(ACBrCIOT1.SSL.CertTipo)));
  memo4.Lines.Add('Certificado Lido: ' + BoolToStr(ACBrCIOT1.SSL.CertificadoLido, True));
  memo4.Lines.Add('Ambiente: ' + GetEnumName(TypeInfo(TpcnTipoAmbiente),Integer(ACBrCIOT1.Configuracoes.WebServices.Ambiente)));
  end;
procedure TForm1.BitBtn1Click(Sender: TObject);
var
  Ini: TIniFile;
  IniFile: String;
begin
  IniFile := ChangeFileExt(Application.ExeName, '.ini');
  Ini := TIniFile.Create(IniFile);

    Ini.WriteInteger('Certificado', 'Ambiente',     rgNormalHomolog.ItemIndex);
    Ini.WriteInteger('Certificado', 'Contingencia',   rgNormalContingencia.ItemIndex);
    Ini.WriteInteger('Certificado', 'SSLLib',     cbSSLLib.ItemIndex);
    Ini.WriteInteger('Certificado', 'CryptLib',   cbCryptLib.ItemIndex);
    Ini.WriteInteger('Certificado', 'HttpLib',    cbHttpLib.ItemIndex);
    Ini.WriteInteger('Certificado', 'XmlSignLib', cbXmlSignLib.ItemIndex);
    Ini.WriteString( 'Certificado', 'Caminho',    edtCaminho.Text);
    Ini.WriteString( 'Certificado', 'Senha',      edtSenha.Text);
    Ini.WriteString( 'Certificado', 'NumSerie',   Trim(edtNumSerie_1.Text));
    Ini.WriteString( 'WebService', 'UF',         cbUF.Text);
    Ini.WriteInteger('WebService', 'SSLType',    cbSSLTypeciot.ItemIndex);
    ini.Free;
end;

procedure TForm1.BitBtn26Click(Sender: TObject);
begin
ConfiguraComponente;
VerificarCertificadoProducao;

GerarCIOT;
end;

procedure TForm1.BitBtn27Click(Sender: TObject);
var
  Resposta: string;
begin


  if edidoperacao.Text = '' then
  begin
    ShowMessage('Digite o número do CIOT primeiro!');
    Exit;
  end;
ConfiguraComponente;
VerificarCertificadoProducao;
  Resposta := ConsultarCIOT(edidoperacao.Text);
  memo4.Lines.Add(UTF8ToString('Resultado Consulta: ' + Resposta));

end;

function TForm1.CancelarOperacao(const ACIOT, AMotivo: string): string;
var
  JsonRequest: TJSONObject;
  ConteudoXML: string;
  URL: string;
  JsonResp: TJSONObject;
begin
  Result := '';

  JsonRequest := TJSONObject.Create;
  try
    JsonRequest.AddPair('CodigoIdentificacaoOperacao', ACIOT);
    JsonRequest.AddPair('MotivoCancelamento', AMotivo);

    ConteudoXML := JsonRequest.ToJSON;
    memo4.Lines.Add('JSON Cancelamento Enviado: ' + ConteudoXML);

    if rgNormalHomolog.ItemIndex=0 then
    URL := 'https://appservices.antt.gov.br/pefServices/api/CancelamentoOperacaoTransporte'
    else
    URL := 'https://appservices-hml.antt.gov.br/pefServices/api/CancelamentoOperacaoTransporte';


    Result := ACBrCIOT1.SSL.Enviar(
      ConteudoXML,
      URL,
      '',
      'application/json; charset=utf-8',
      '',
      False
    );

    memo4.Lines.Add('Status Code: ' + IntToStr(ACBrCIOT1.SSL.HTTPResultCode));
    memo4.Lines.Add(UTF8ToString('Resposta Cancelamento: ' + Result));
  finally
    JsonRequest.Free;
  end;
end;
procedure TForm1.BitBtn28Click(Sender: TObject);
var
  Resposta: string;
  JsonResposta: TJSONObject;
  Mensagem, Codigo: string;
  JsonResp: TJSONObject;
begin
  // Verifica se o ACBr está configurado
  if not ACBrCIOT1.SSL.CertificadoLido then
  begin
    ShowMessage('Certificado não carregado. Configure o certificado primeiro!');
    Exit;
  end;

  // Verifica se o CIOT foi informado
  if Trim(edidoperacao.Text) = '' then
  begin
    ShowMessage('Digite o número do CIOT primeiro!');
    Exit;
  end;
ConfiguraComponente;
VerificarCertificadoProducao;
  // Confirmação do usuário
  if MessageDlg('Confirmar cancelamento do CIOT ' + edprotocolo.Text + '?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    memo4.Lines.Add('');
    memo4.Lines.Add('=== SOLICITANDO CANCELAMENTO DO CIOT ===');
    memo4.Lines.Add('CIOT: ' + edprotocolo.Text);

    // Chama o cancelamento
    Resposta := CancelarOperacao(edprotocolo.Text, 'Operacao cancelada pelo Emitente');
     // memo4.Lines.Add(UTF8ToString('Resposta completa: ' + Resposta));
    // Tenta fazer o parse da resposta JSON
    try
      JsonResposta := TJSONObject.ParseJSONValue(Resposta) as TJSONObject;
      if JsonResposta <> nil then
      begin
        try
          // Extrai as informações da resposta
          if JsonResposta.TryGetValue<string>('Codigo', Codigo) then
            memo4.Lines.Add(UTF8ToString('Código Retorno: ' + Codigo));

          if JsonResposta.TryGetValue<string>('Mensagem', Mensagem) then
            memo4.Lines.Add(UTF8ToString('Mensagem: ' + Mensagem));

          // Se cancelou com sucesso, mostra data e protocolo
          if (Codigo = '200') or (Pos('sucesso', LowerCase(Mensagem)) > 0) then
          begin
            memo4.Lines.Add('>>> CANCELAMENTO REALIZADO COM SUCESSO! <<<');
            ShowMessage('CIOT ' + edprotocolo.Text + ' cancelado com sucesso!');
          end
          else
            ShowMessage('Falha no cancelamento: ' + Mensagem);

        finally
          JsonResposta.Free;
        end;
      end
      else
      begin
        memo4.Lines.Add('Resposta não está em formato JSON');
        memo4.Lines.Add(UTF8ToString('Resposta bruta: ' + Resposta));
      end;
    except
      on E: Exception do
        memo4.Lines.Add('Erro ao processar resposta: ' + E.Message);
    end;
  end;
end;
function TForm1.EncerrarOperacao(const AJson: string): string;
var
  URL: string;
  ConteudoXML:string;
  JsonResp: TJSONObject;
begin
  Result := '';

  if rgNormalHomolog.ItemIndex = 0 then
    URL := 'https://appservices.antt.gov.br/pefServices/api/EncerramentoOperacaoTransporte'
  else
    URL := 'https://appservices-hml.antt.gov.br/pefServices/api/EncerramentoOperacaoTransporte';

  memo4.Lines.Add('Encerrando URL: ' + URL);
  memo4.Lines.Add('JSON Enviado: ' + AJson);
  ConteudoXML := AJson;
  try
    Result := ACBrCIOT1.SSL.Enviar(
      ConteudoXML,
      URL,
      '',
      'application/json; charset=utf-8',
      '',
      False
    );

    memo4.Lines.Add('Status Code: ' +
      IntToStr(ACBrCIOT1.SSL.HTTPResultCode));
   memo4.Lines.Add(UTF8ToString('Resposta Encerramento: ' + Result));

  except
    on E: Exception do
    begin
      memo4.Lines.Add('Erro: ' + E.Message);
      memo4.Lines.Add('HTTP Result Code: ' +
        IntToStr(ACBrCIOT1.SSL.HTTPResultCode));
    end;
  end;
end;
procedure TForm1.BitBtn29Click(Sender: TObject);
var
  JsonEncerramento: string;
  Resposta: string;

begin
ConfiguraComponente;
VerificarCertificadoProducao;
  JsonEncerramento := '{"CodigoIdentificacaoOperacao":"' + edprotocolo.Text + '"}';

  Resposta := EncerrarOperacao(JsonEncerramento);
  memo4.Lines.Add('Resultado Encerramento: ' + Resposta);
end;

procedure TForm1.BitBtn30Click(Sender: TObject);
begin
ConfiguraComponente;
VerificarCertificadoProducao;
DeclararOperacao('Declarar');
end;

procedure TForm1.BitBtn31Click(Sender: TObject);
var
  Http: TIdHTTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
  JsonEnvio: TStringStream;
  Resposta: string;
  URL: string;
  ciot, Token: string;
  JsonResposta: TJSONObject;
  DadosObj: TJSONObject;
begin
  // 1. OBTER TOKEN
  URL := 'https://mtcuybq605.execute-api.sa-east-1.amazonaws.com/api-ciot-prd/GeradorCIOT/token';

  Http := TIdHTTP.Create(nil);
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  SSL.SSLOptions.Method := sslvTLSv1_2;
  SSL.SSLOptions.SSLVersions := [sslvTLSv1_2];

  try
    Http.IOHandler := SSL;
    Http.Request.ContentType := 'application/json';
    Http.Request.Accept := 'application/json';
    Http.Request.CustomHeaders.Values['chave'] := '3UwR]CYTeAQRF';

    JsonEnvio := TStringStream.Create('{}', TEncoding.UTF8);
    try
      Resposta := Http.Post(URL, JsonEnvio);
      memo4.Lines.Add('Token HTTP: ' + IntToStr(Http.ResponseCode));
      memo4.Lines.Add('Resposta Token: ' + Resposta);
    finally
      JsonEnvio.Free;
    end;

    // Extrai o token
    JsonResposta := TJSONObject.ParseJSONValue(Resposta) as TJSONObject;
    if JsonResposta <> nil then
    begin
      try
        Token := JsonResposta.GetValue<string>('token', '');
        memo4.Lines.Add('Token obtido: ' + Token);
      finally
        JsonResposta.Free;
      end;
    end;

    if Token = '' then
    begin
      memo4.Lines.Add('ERRO: Não foi possível obter o token');
      Exit;
    end;

    // 2. GERAR CIOT
    URL := 'https://mtcuybq605.execute-api.sa-east-1.amazonaws.com/api-ciot-prd/GeradorCIOT/gerar';
    Http.Request.CustomHeaders.Values['Authorization'] := 'Bearer ' + Token;

    JsonEnvio := TStringStream.Create(
      '{"cpfCnpj":"' + OnlyNumbers(edcnpjemp.Text) + '"}',
      TEncoding.UTF8
    );

    try
      Resposta := Http.Post(URL, JsonEnvio);
      memo4.Lines.Add('Gerar HTTP: ' + IntToStr(Http.ResponseCode));
      memo4.Lines.Add('Resposta Gerar: ' + Resposta);
    finally
      JsonEnvio.Free;
    end;

    // 3. EXTRAIR O CIOT (CORRIGIDO - está dentro do objeto "dados")
    JsonResposta := TJSONObject.ParseJSONValue(Resposta) as TJSONObject;
    if JsonResposta <> nil then
    begin
      try
        memo4.Lines.Add('=== DADOS DO RETORNO ===');

        // Verifica se o campo "dados" existe
        if JsonResposta.TryGetValue<TJSONObject>('dados', DadosObj) then
        begin
          // Agora sim, pega o CIOT dentro de "dados"
          ciot := DadosObj.GetValue<string>('ciot', '');
          memo4.Lines.Add('CIOT gerado: ' + ciot);
          memo4.Lines.Add('CNPJ: ' + DadosObj.GetValue<string>('cnpj', ''));
          memo4.Lines.Add('Data Geração: ' + DadosObj.GetValue<string>('dataGeracao', ''));
        end
        else
        begin
          // Se não tiver "dados", tenta mensagem de erro
          memo4.Lines.Add('Mensagem: ' + JsonResposta.GetValue<string>('mensagem', ''));
        end;

      finally
        JsonResposta.Free;
      end;
    end;

    // 4. SALVAR CIOT
    if ciot <> '' then
    begin
      if MessageDlg('Confirmar Inclusão CIOT ' + ciot + '?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        edidoperacao.Text:=ciot;
        memo4.Lines.Add('CIOT gerado com sucesso: ' + ciot);
      end;
    end
    else
    begin
      memo4.Lines.Add('ERRO: CIOT não foi gerado ou não pôde ser extraído');
    end;

  except
    on E: Exception do
    begin
      memo4.Lines.Add('ERRO: ' + E.Message);
      if Assigned(Http.Response) then
        memo4.Lines.Add('HTTP: ' + IntToStr(Http.ResponseCode));
    end;
  end;

  SSL.Free;
  Http.Free;
end;

procedure TForm1.BitBtn32Click(Sender: TObject);
var
  Resposta: string;
begin


  if edidoperacao.Text = '' then
  begin
    ShowMessage('Digite o número do CIOT primeiro!');
    Exit;
  end;
ConfiguraComponente;
VerificarCertificadoProducao;
  Resposta := ConsultarCIOT(edidoperacao.Text);
  memo4.Lines.Add(UTF8ToString('Resultado Consulta: ' + Resposta));

end;

procedure TForm1.BitBtn33Click(Sender: TObject);
begin
ConfiguraComponente;
VerificarCertificadoProducao;
  memo4.Lines.Add('');
  memo4.Lines.Add('=== INFORMAÇÕES DO CERTIFICADO ===');
  memo4.Lines.Add('CNPJ: ' + ACBrCIOT1.SSL.CertCNPJ);
  memo4.Lines.Add('Razão Social: ' + ACBrCIOT1.SSL.CertRazaoSocial);
  memo4.Lines.Add('Certificadora: ' + ACBrCIOT1.SSL.CertCertificadora);
  memo4.Lines.Add('Número Série: ' + ACBrCIOT1.SSL.CertNumeroSerie);
  memo4.Lines.Add('Validade: ' + FormatDateTime('dd/mm/yyyy', ACBrCIOT1.SSL.CertDataVenc));

  // Usando GetEnumName - precisa da unit System.TypInfo
  memo4.Lines.Add('Tipo: ' + GetEnumName(TypeInfo(TSSLTipoCertificado), Integer(ACBrCIOT1.SSL.CertTipo)));
  memo4.Lines.Add('Certificado Lido: ' + BoolToStr(ACBrCIOT1.SSL.CertificadoLido, True));
  memo4.Lines.Add('Ambiente: ' + GetEnumName(TypeInfo(TpcnTipoAmbiente),Integer(ACBrCIOT1.Configuracoes.WebServices.Ambiente)));


  // Verifica se o certificado está carregado
  if not ACBrciot1.SSL.CertificadoLido then
  begin
    ShowMessage('Certificado não carregado. Configure o certificado primeiro!');
    Exit;
  end;
  ConsultarSituacaoTransportador(
    OnlyNumbers(edcnpjemp.Text),  // CPF/CNPJ Interessado
    OnlyNumbers(edcnpjemp.Text),  // CPF/CNPJ Transportador
    edrntc.Text         // RNTRC
  );
end;

procedure TForm1.BitBtn34Click(Sender: TObject);
var
  Placas: TArray<string>;
  Resposta: string;
begin
ConfiguraComponente;
VerificarCertificadoProducao;
  memo4.Lines.Add('');
  memo4.Lines.Add('=== INFORMAÇÕES DO CERTIFICADO ===');
  memo4.Lines.Add('CNPJ: ' + ACBrCIOT1.SSL.CertCNPJ);
  memo4.Lines.Add('Razão Social: ' + ACBrCIOT1.SSL.CertRazaoSocial);
  memo4.Lines.Add('Certificadora: ' + ACBrCIOT1.SSL.CertCertificadora);
  memo4.Lines.Add('Número Série: ' + ACBrCIOT1.SSL.CertNumeroSerie);
  memo4.Lines.Add('Validade: ' + FormatDateTime('dd/mm/yyyy', ACBrCIOT1.SSL.CertDataVenc));

  // Usando GetEnumName - precisa da unit System.TypInfo
  memo4.Lines.Add('Tipo: ' + GetEnumName(TypeInfo(TSSLTipoCertificado), Integer(ACBrCIOT1.SSL.CertTipo)));
  memo4.Lines.Add('Certificado Lido: ' + BoolToStr(ACBrCIOT1.SSL.CertificadoLido, True));
  memo4.Lines.Add('Ambiente: ' + GetEnumName(TypeInfo(TpcnTipoAmbiente),Integer(ACBrCIOT1.Configuracoes.WebServices.Ambiente)));


  // Verifica se o certificado está carregado
  if not ACBrciot1.SSL.CertificadoLido then
  begin
    ShowMessage('Certificado não carregado. Configure o certificado primeiro!');
    Exit;
  end;

  // Processa as placas do Edit (separadas por vírgula)
  Placas := ProcessarPlacasDoEdit(edtPlacas.Text);

  if Length(Placas) = 0 then
  begin
    ShowMessage('Informe pelo menos uma placa no campo edtPlacas (separadas por vírgula)');
    Exit;
  end;

  memo4.Lines.Add('');
  memo4.Lines.Add('=== CONSULTANDO FROTA ===');

  // Chama a consulta
  Resposta := ConsultarFrotaTransportador(
    OnlyNumbers(edcnpjemp.Text),      // CNPJ Interessado (pode ser um Edit)
    OnlyNumbers(edcnpjemp.Text),    // CNPJ Transportador (pode ser um Edit)
    edrntc.Text,                             // RNTRC (pode ser um Edit)
    Placas                                     // Array de placas
  );


  memo4.Lines.Add('Resposta Completa: ' + Resposta);
end;

procedure TForm1.BitBtn35Click(Sender: TObject);
begin
ConfiguraComponente;
VerificarCertificadoProducao;
  memo4.Lines.Add('');
  memo4.Lines.Add('=== INFORMAÇÕES DO CERTIFICADO ===');
  memo4.Lines.Add('CNPJ: ' + ACBrCIOT1.SSL.CertCNPJ);
  memo4.Lines.Add('Razão Social: ' + ACBrCIOT1.SSL.CertRazaoSocial);
  memo4.Lines.Add('Certificadora: ' + ACBrCIOT1.SSL.CertCertificadora);
  memo4.Lines.Add('Número Série: ' + ACBrCIOT1.SSL.CertNumeroSerie);
  memo4.Lines.Add('Validade: ' + FormatDateTime('dd/mm/yyyy', ACBrCIOT1.SSL.CertDataVenc));

  // Usando GetEnumName - precisa da unit System.TypInfo
  memo4.Lines.Add('Tipo: ' + GetEnumName(TypeInfo(TSSLTipoCertificado), Integer(ACBrCIOT1.SSL.CertTipo)));
  memo4.Lines.Add('Certificado Lido: ' + BoolToStr(ACBrCIOT1.SSL.CertificadoLido, True));
  memo4.Lines.Add('Ambiente: ' + GetEnumName(TypeInfo(TpcnTipoAmbiente),Integer(ACBrCIOT1.Configuracoes.WebServices.Ambiente)));


  // Verifica se o certificado está carregado
  if not ACBrciot1.SSL.CertificadoLido then
  begin
    ShowMessage('Certificado não carregado. Configure o certificado primeiro!');
    Exit;
  end;
ConsultarExcecao(OnlyNumbers(edcnpjemp.Text));
end;


procedure TForm1.Button2Click(Sender: TObject);
var
ini:tinifile;
IniFile: String;
begin
IniFile := ChangeFileExt(Application.ExeName, '.ini');
Ini := TIniFile.Create(IniFile);
INI.WriteString('Dados_Empresa','cnpj',edcnpjemp.Text);
INI.WriteString('Dados_Empresa','rntc',edrntc.Text);

INI.WriteString('Dados_Contrato','cnpjcontratante',edcnpjcontratante.Text);
INI.WriteString('Dados_Contrato','contratante',edcontratante.Text);
INI.WriteString('Dados_Contrato','cnpjbanco',edtcnpjbanco.Text);
INI.WriteString('Dados_Contrato','codbanco',edtcodbanco.Text);
INI.WriteString('Dados_Contrato','agencia',edtagencia.Text);
ini.Free;

end;


procedure TForm1.FormCreate(Sender: TObject);
var
ini:tinifile;
IniFile: String;
  Flags1: OLEVariant;
   dados_obs:string;

   T: TSSLLib;
  I: TpcnTipoEmissao;
  U: TSSLCryptLib;
  V: TSSLHttpLib;
  X: TSSLXmlSignLib;
  Y: TSSLType;
begin

    cbSSLLib.Items.Clear;
  for T := Low(TSSLLib) to High(TSSLLib) do
    cbSSLLib.Items.Add( GetEnumName(TypeInfo(TSSLLib), integer(T) ) );
  cbSSLLib.ItemIndex := 0;

  cbCryptLib.Items.Clear;
  for U := Low(TSSLCryptLib) to High(TSSLCryptLib) do
    cbCryptLib.Items.Add( GetEnumName(TypeInfo(TSSLCryptLib), integer(U) ) );
  cbCryptLib.ItemIndex := 0;

  cbHttpLib.Items.Clear;
  for V := Low(TSSLHttpLib) to High(TSSLHttpLib) do
    cbHttpLib.Items.Add( GetEnumName(TypeInfo(TSSLHttpLib), integer(V) ) );
  cbHttpLib.ItemIndex := 0;

  cbXmlSignLib.Items.Clear;
  for X := Low(TSSLXmlSignLib) to High(TSSLXmlSignLib) do
    cbXmlSignLib.Items.Add( GetEnumName(TypeInfo(TSSLXmlSignLib), integer(X) ) );
  cbXmlSignLib.ItemIndex := 0;
  cbSSLTypeCiot.Items.Clear;
  for Y := Low(TSSLType) to High(TSSLType) do
  cbSSLTypeCiot.Items.Add( GetEnumName(TypeInfo(TSSLType), integer(Y) ) );
  cbSSLTypeCiot.ItemIndex := 0;


IniFile := ChangeFileExt(Application.ExeName, '.ini');
Ini := TIniFile.Create(IniFile);
rgNormalHomolog.ItemIndex:= Ini.ReadInteger('Certificado', 'Ambiente', 0);
rgNormalContingencia.ItemIndex:=Ini.ReadInteger('Certificado', 'Contingencia',   0);
cbSSLLib.ItemIndex:= Ini.ReadInteger('Certificado', 'SSLLib',     0);
cbCryptLib.ItemIndex:= Ini.ReadInteger('Certificado', 'CryptLib',   0);
cbHttpLib.ItemIndex:= Ini.ReadInteger('Certificado', 'HttpLib',    0);
cbXmlSignLib.ItemIndex:= Ini.ReadInteger('Certificado', 'XmlSignLib', 0);
cbSSLTypeciot.ItemIndex:= Ini.ReadInteger('WebService', 'SSLType', 0);
edtCaminho.Text:= Ini.ReadString( 'Certificado', 'Caminho','');
edtSenha.Text:= Ini.ReadString( 'Certificado', 'Senha','');
edtNumSerie_1.Text:= Ini.ReadString( 'Certificado', 'NumSerie','');

cbUF.ItemIndex:= cbUF.Items.IndexOf(Ini.ReadString( 'WebService', 'UF','')) ;
edcnpjemp.Text:=INI.readString('Dados_Empresa','cnpj','');
edrntc.Text:=INI.readString('Dados_Empresa','rntc','');

edcnpjcontratante.Text:=INI.readString('Dados_Contrato','cnpjcontratante','');
edcontratante.Text:=INI.readString('Dados_Contrato','contratante','');
EDTCNPJBANCO.Text:=INI.readString('Dados_Contrato','cnpjbanco','');
edtcodbanco.Text:=INI.readString('Dados_Contrato','codbanco','');
edtagencia.Text:=INI.readString('Dados_Contrato','agencia','');

edtplacas.Text:=INI.readString('Frota','Placas','');
ini.Free;

TRY
 ConfiguraComponente;
EXCEPT;

END;
end;

procedure TForm1.Label75Click(Sender: TObject);
begin
HlinkNavigateString(nil,'https://calculadorafrete.antt.gov.br/?Length=4');
end;

procedure TForm1.Label76Click(Sender: TObject);
begin
HlinkNavigateString(nil,'https://consultapublica.antt.gov.br/Site/ConsultaCIOT.aspx');
end;

end.

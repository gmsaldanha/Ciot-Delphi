object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Gerador Ciot'
  ClientHeight = 500
  ClientWidth = 955
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 955
    Height = 500
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Principal'
      object Label69: TLabel
        Left = 142
        Top = 75
        Width = 138
        Height = 13
        Caption = 'IdOperacaoTransporte CIOT'
      end
      object Label75: TLabel
        Left = 320
        Top = 97
        Width = 60
        Height = 13
        Caption = 'Frete Minimo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = Label75Click
      end
      object Label71: TLabel
        Left = 24
        Top = 145
        Width = 73
        Height = 13
        Caption = 'Protocolo CIOT'
      end
      object Label72: TLabel
        Left = 164
        Top = 145
        Width = 79
        Height = 13
        Caption = 'Cod Verificvador'
      end
      object Label73: TLabel
        Left = 249
        Top = 145
        Width = 33
        Height = 13
        Caption = 'Codigo'
      end
      object Label76: TLabel
        Left = 342
        Top = 276
        Width = 125
        Height = 13
        Caption = 'Consultar Situa'#231#227'o do Ciot'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = Label76Click
      end
      object Label70: TLabel
        Left = 26
        Top = 369
        Width = 153
        Height = 13
        Caption = 'Informe as Placas para consulta'
      end
      object Label51: TLabel
        Left = 380
        Top = 144
        Width = 42
        Height = 13
        Caption = 'Tipo Veic'
      end
      object BitBtn31: TBitBtn
        Left = 24
        Top = 92
        Width = 112
        Height = 25
        Caption = 'Gerar IdOpera'#231#227'o'
        TabOrder = 0
        OnClick = BitBtn31Click
      end
      object BitBtn27: TBitBtn
        Left = 184
        Top = 238
        Width = 152
        Height = 25
        Caption = 'Consultar Ciot'
        TabOrder = 1
        OnClick = BitBtn27Click
      end
      object BitBtn26: TBitBtn
        Left = 26
        Top = 238
        Width = 152
        Height = 25
        Caption = 'Gerar Ciot'
        TabOrder = 2
        OnClick = BitBtn26Click
      end
      object BitBtn30: TBitBtn
        Left = 26
        Top = 269
        Width = 152
        Height = 25
        Caption = 'Declarar op'
        TabOrder = 3
        OnClick = BitBtn30Click
      end
      object BitBtn29: TBitBtn
        Left = 184
        Top = 269
        Width = 152
        Height = 25
        Caption = 'Encerrar Ciot'
        TabOrder = 4
        OnClick = BitBtn29Click
      end
      object BitBtn28: TBitBtn
        Left = 324
        Top = 238
        Width = 152
        Height = 25
        Caption = 'Cancelar Ciot'
        TabOrder = 5
        OnClick = BitBtn28Click
      end
      object Panel5: TPanel
        Left = 514
        Top = 2
        Width = 408
        Height = 192
        Color = clActiveBorder
        ParentBackground = False
        TabOrder = 6
        object Label62: TLabel
          Left = 15
          Top = 6
          Width = 101
          Height = 13
          Caption = 'CnpjCpf Contratante'
        end
        object Label63: TLabel
          Left = 15
          Top = 88
          Width = 84
          Height = 13
          Caption = 'FormaPagamento'
        end
        object Label64: TLabel
          Left = 181
          Top = 6
          Width = 27
          Height = 13
          Caption = 'Nome'
        end
        object Label66: TLabel
          Left = 14
          Top = 48
          Width = 63
          Height = 13
          Caption = 'CNPJ BANCO'
        end
        object Label67: TLabel
          Left = 210
          Top = 48
          Width = 51
          Height = 13
          Caption = 'Cod Banco'
        end
        object Label68: TLabel
          Left = 287
          Top = 47
          Width = 38
          Height = 13
          Caption = 'Agencia'
        end
        object Label65: TLabel
          Left = 18
          Top = 130
          Width = 80
          Height = 13
          Caption = 'Produto Principal'
        end
        object Label60: TLabel
          Left = 200
          Top = 132
          Width = 91
          Height = 13
          Caption = 'NCM Predominante'
        end
        object Label61: TLabel
          Left = 308
          Top = 130
          Width = 20
          Height = 13
          Caption = 'EAN'
        end
        object edcnpjcontratante: TEdit
          Left = 15
          Top = 25
          Width = 160
          Height = 21
          TabOrder = 0
        end
        object comboformpag: TComboBox
          Left = 15
          Top = 105
          Width = 145
          Height = 21
          ItemIndex = 0
          TabOrder = 1
          Text = 'A VISTA'
          Items.Strings = (
            'A VISTA'
            'A PRAZO')
        end
        object edcontratante: TEdit
          Left = 181
          Top = 25
          Width = 189
          Height = 21
          TabOrder = 2
        end
        object EDTCNPJBANCO: TEdit
          Left = 15
          Top = 64
          Width = 189
          Height = 21
          TabOrder = 3
        end
        object edtcodbanco: TEdit
          Left = 210
          Top = 64
          Width = 71
          Height = 21
          TabOrder = 4
        end
        object edtagencia: TEdit
          Left = 287
          Top = 64
          Width = 100
          Height = 21
          TabOrder = 5
        end
        object Button1: TButton
          Left = 184
          Top = 101
          Width = 75
          Height = 25
          Caption = 'Salvar'
          TabOrder = 6
        end
        object edtproduto: TEdit
          Left = 17
          Top = 149
          Width = 177
          Height = 21
          TabOrder = 7
        end
        object edtncmpred: TEdit
          Left = 202
          Top = 149
          Width = 66
          Height = 21
          TabOrder = 8
          Text = '64041900'
        end
        object edtean: TEdit
          Left = 308
          Top = 149
          Width = 66
          Height = 21
          TabOrder = 9
        end
      end
      object Memo4: TMemo
        Left = 496
        Top = 221
        Width = 426
        Height = 216
        TabOrder = 7
      end
      object Panel1: TPanel
        Left = 24
        Top = 2
        Width = 463
        Height = 65
        Color = clActiveBorder
        ParentBackground = False
        TabOrder = 8
        object Label1: TLabel
          Left = 15
          Top = 6
          Width = 83
          Height = 13
          Caption = 'CnpjCpf Empresa'
        end
        object Label3: TLabel
          Left = 181
          Top = 6
          Width = 27
          Height = 13
          Caption = 'RNTC'
        end
        object edcnpjemp: TEdit
          Left = 15
          Top = 25
          Width = 160
          Height = 21
          TabOrder = 0
        end
        object edrntc: TEdit
          Left = 181
          Top = 25
          Width = 189
          Height = 21
          TabOrder = 1
        end
        object Button2: TButton
          Left = 376
          Top = 21
          Width = 75
          Height = 25
          Caption = 'Salvar'
          TabOrder = 2
          OnClick = Button2Click
        end
      end
      object BitBtn33: TBitBtn
        Left = 26
        Top = 338
        Width = 204
        Height = 25
        Caption = 'Consultar Situa'#231#227'o Transportador'
        TabOrder = 9
        OnClick = BitBtn33Click
      end
      object edtplacas: TEdit
        Left = 26
        Top = 385
        Width = 216
        Height = 21
        TabOrder = 10
        Text = 'XXX0000,AAA0A00,BBB0000'
      end
      object BitBtn34: TBitBtn
        Left = 248
        Top = 383
        Width = 204
        Height = 25
        Caption = 'Consultar Frota'
        TabOrder = 11
        OnClick = BitBtn34Click
      end
      object BitBtn32: TBitBtn
        Left = 26
        Top = 412
        Width = 157
        Height = 25
        Caption = 'Consultar Ciot'
        TabOrder = 12
        OnClick = BitBtn32Click
      end
      object BitBtn43: TBitBtn
        Left = 342
        Top = 412
        Width = 105
        Height = 25
        Caption = 'Salvar Config'
        TabOrder = 13
      end
      object BitBtn35: TBitBtn
        Left = 189
        Top = 412
        Width = 147
        Height = 25
        Caption = 'Consultar Exce'#231#227'o'
        TabOrder = 14
        OnClick = BitBtn35Click
      end
      object edidoperacao: TEdit
        Left = 144
        Top = 94
        Width = 150
        Height = 21
        TabOrder = 15
      end
      object edprotocolo: TEdit
        Left = 24
        Top = 160
        Width = 121
        Height = 21
        TabOrder = 16
      end
      object edcodver: TEdit
        Left = 164
        Top = 160
        Width = 56
        Height = 21
        TabOrder = 17
      end
      object edcodigo: TEdit
        Left = 249
        Top = 160
        Width = 121
        Height = 21
        TabOrder = 18
      end
      object Memo1: TMemo
        Left = 24
        Top = 184
        Width = 449
        Height = 49
        Lines.Strings = (
          'Memo1')
        TabOrder = 19
      end
      object ComboBox1: TComboBox
        Left = 380
        Top = 160
        Width = 128
        Height = 21
        TabOrder = 20
        Text = 'ComboBox1'
        Items.Strings = (
          'trNaoAplicavel'
          'trTruck'
          'trToco'
          'trCavaloMecanico'
          'trVAN'
          'trUtilitario'
          'trOutros')
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Config'
      ImageIndex = 1
      object PageControl2: TPageControl
        Left = 1
        Top = 1
        Width = 318
        Height = 392
        ActivePage = TabSheet4
        TabOrder = 0
        object TabSheet4: TTabSheet
          Caption = 'Configura'#231#245'es'
          ExplicitHeight = 420
          object PageControl4: TPageControl
            Left = 0
            Top = 0
            Width = 310
            Height = 364
            ActivePage = TabSheet5
            Align = alClient
            MultiLine = True
            TabOrder = 0
            ExplicitHeight = 420
            object TabSheet5: TTabSheet
              Caption = 'Certificado'
              ExplicitHeight = 392
              object lSSLLib: TLabel
                Left = 39
                Top = 16
                Width = 30
                Height = 13
                Alignment = taRightJustify
                Caption = 'SSLLib'
                Color = clBtnFace
                ParentColor = False
              end
              object lCryptLib: TLabel
                Left = 29
                Top = 43
                Width = 40
                Height = 13
                Alignment = taRightJustify
                Caption = 'CryptLib'
                Color = clBtnFace
                ParentColor = False
              end
              object lHttpLib: TLabel
                Left = 35
                Top = 70
                Width = 34
                Height = 13
                Alignment = taRightJustify
                Caption = 'HttpLib'
                Color = clBtnFace
                ParentColor = False
              end
              object lXmlSign: TLabel
                Left = 17
                Top = 97
                Width = 52
                Height = 13
                Alignment = taRightJustify
                Caption = 'XMLSignLib'
                Color = clBtnFace
                ParentColor = False
              end
              object Label25: TLabel
                Left = 27
                Top = 124
                Width = 41
                Height = 13
                Alignment = taRightJustify
                Caption = 'SSLType'
                Color = clBtnFace
                ParentColor = False
              end
              object Label5: TLabel
                Left = 27
                Top = 154
                Width = 76
                Height = 13
                Caption = 'UF do Emitente:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object gbCertificado: TGroupBox
                Left = 17
                Top = 182
                Width = 263
                Height = 144
                Caption = 'Certificado'
                TabOrder = 0
                object Label59: TLabel
                  Left = 8
                  Top = 16
                  Width = 41
                  Height = 13
                  Caption = 'Caminho'
                end
                object Label2: TLabel
                  Left = 8
                  Top = 56
                  Width = 30
                  Height = 13
                  Caption = 'Senha'
                end
                object sbtnCaminhoCert: TSpeedButton
                  Left = 235
                  Top = 32
                  Width = 23
                  Height = 24
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    04000000000000010000130B0000130B00001000000000000000000000000000
                    800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
                    333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
                    0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
                    07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
                    07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
                    0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
                    33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
                    B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
                    3BB33773333773333773B333333B3333333B7333333733333337}
                  NumGlyphs = 2
                  OnClick = sbtnCaminhoCertClick
                end
                object Label4: TLabel
                  Left = 8
                  Top = 96
                  Width = 79
                  Height = 13
                  Caption = 'N'#250'mero de S'#233'rie'
                end
                object sbtnNumSerie: TSpeedButton
                  Left = 206
                  Top = 110
                  Width = 23
                  Height = 24
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    04000000000000010000130B0000130B00001000000000000000000000000000
                    800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
                    333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
                    0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
                    07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
                    07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
                    0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
                    33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
                    B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
                    3BB33773333773333773B333333B3333333B7333333733333337}
                  NumGlyphs = 2
                  OnClick = sbtnNumSerieClick
                end
                object edtCaminho: TEdit
                  Left = 8
                  Top = 32
                  Width = 225
                  Height = 21
                  TabOrder = 0
                end
                object edtSenha: TEdit
                  Left = 8
                  Top = 72
                  Width = 249
                  Height = 21
                  PasswordChar = '*'
                  TabOrder = 1
                end
                object edtNumSerie_1: TEdit
                  Left = 8
                  Top = 112
                  Width = 193
                  Height = 21
                  TabOrder = 2
                end
              end
              object cbSSLLib: TComboBox
                Left = 80
                Top = 8
                Width = 160
                Height = 21
                Style = csDropDownList
                TabOrder = 1
              end
              object cbCryptLib: TComboBox
                Left = 80
                Top = 35
                Width = 160
                Height = 21
                Style = csDropDownList
                TabOrder = 2
              end
              object cbHttpLib: TComboBox
                Left = 80
                Top = 62
                Width = 160
                Height = 21
                Style = csDropDownList
                TabOrder = 3
              end
              object cbXmlSignLib: TComboBox
                Left = 80
                Top = 89
                Width = 160
                Height = 21
                Style = csDropDownList
                TabOrder = 4
              end
              object cbSSLTypeCiot: TComboBox
                Left = 80
                Top = 116
                Width = 160
                Height = 21
                Hint = 'Depende de configura'#231#227'o de  SSL.HttpLib'
                Style = csDropDownList
                TabOrder = 5
              end
              object cbUF: TComboBox
                Left = 109
                Top = 143
                Width = 44
                Height = 24
                Style = csDropDownList
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 6
                Items.Strings = (
                  'AC'
                  'AL'
                  'AP'
                  'AM'
                  'BA'
                  'CE'
                  'DF'
                  'ES'
                  'GO'
                  'MA'
                  'MT'
                  'MS'
                  'MG'
                  'PA'
                  'PB'
                  'PR'
                  'PE'
                  'PI'
                  'RJ'
                  'RN'
                  'RS'
                  'RO'
                  'RR'
                  'SC'
                  'SP'
                  'SE'
                  'TO')
              end
            end
            object TabSheet6: TTabSheet
              Caption = 'Situacao'
              ImageIndex = 1
              ExplicitHeight = 392
              object rgNormalHomolog: TRadioGroup
                Left = 3
                Top = 9
                Width = 202
                Height = 52
                Caption = 'Selecione o Ambiente CIOT'
                Columns = 2
                ItemIndex = 0
                Items.Strings = (
                  'Produ'#231#227'o'
                  'Homologa'#231#227'o')
                TabOrder = 0
              end
              object rgNormalContingencia: TRadioGroup
                Left = 3
                Top = 81
                Width = 202
                Height = 52
                Caption = 'Selecione Situa'#231#227'o CIOT'
                Columns = 2
                ItemIndex = 0
                Items.Strings = (
                  'Normal'
                  'Contingencia')
                TabOrder = 1
              end
            end
          end
        end
      end
      object BitBtn1: TBitBtn
        Left = 118
        Top = 395
        Width = 75
        Height = 25
        Caption = 'Salvar'
        TabOrder = 1
        OnClick = BitBtn1Click
      end
    end
  end
  object ACBrCIOT1: TACBrCIOT
    Configuracoes.Geral.SSLLib = libNone
    Configuracoes.Geral.SSLCryptLib = cryNone
    Configuracoes.Geral.SSLHttpLib = httpNone
    Configuracoes.Geral.SSLXmlSignLib = xsNone
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.RetirarAcentos = False
    Configuracoes.Geral.Integradora = ieFrete
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    Left = 512
    Top = 16
  end
  object OpenDialog1: TOpenDialog
    Left = 604
    Top = 16
  end
end

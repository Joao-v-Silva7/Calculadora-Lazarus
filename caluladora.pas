unit caluladora;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, LCLType;

type

  { TFormPrincipal }

  TFormPrincipal = class(TForm)
    btnSoma: TButton;
    btnSubtrair: TButton;
    btnMultiplicar: TButton;
    btnDividir: TButton;
    txtNum1: TEdit;
    txtNum2: TEdit;
    txtResultado: TEdit;
    resultado: TLabel;
    numero1: TLabel;
    numero2: TLabel;
    procedure btnDividirClick(Sender: TObject);
    procedure btnMultiplicarClick(Sender: TObject);
    procedure btnSomaClick(Sender: TObject);
    procedure btnSubtrairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure txtNum1Change(Sender: TObject);
    procedure txtNum2Change(Sender: TObject);
    procedure txtResultadoChange(Sender: TObject);
  private
    function calcularResultado(num1, num2: Double; operacao: String): Double;
    function validarCampos(): Boolean;
    procedure habilitarBotoes(habilitado: Boolean);
  public

  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.lfm}

{ TFormPrincipal }

procedure TFormPrincipal.txtNum2Change(Sender: TObject);
begin

end;

procedure TFormPrincipal.txtResultadoChange(Sender: TObject);
begin

end;

function TFormPrincipal.calcularResultado(num1, num2: Double; operacao: String): Double;
var
  res: Double;
begin
  res := 0;

  if operacao = 'somar' then
  res:= num1 + num2;

  if operacao = 'subtrair' then
  res:= num1 - num2;

  if operacao = 'multiplicar' then
  res:= num1 * num2;

  if operacao = 'dividir' then
  res:= num1 / num2;
  // Result palavra chave pra dizer que essa função vai retornar um resultado, nesse caso vai retornar a variavel de resultado;
  Result := res;
end;

function TFormPrincipal.validarCampos(): Boolean;
begin
  if (txtNum1.Text = '') or (txtNum2.Text = '') then
     Result := False
  else
   try
      StrToFloat(txtNum1.Text);
      StrToFloat(txtNum2.Text);

      Result := True;
   except
      on E: EConvertError do
      begin
         Result := False;
      end;
   end;
end;

procedure TFormPrincipal.habilitarBotoes(habilitado: Boolean);
begin
  btnSoma.Enabled := habilitado;
  btnSubtrair.Enabled := habilitado;
  btnDividir.Enabled := habilitado;
  btnMultiplicar.Enabled := habilitado;
end;

procedure TFormPrincipal.btnSomaClick(Sender: TObject);
begin
  if validarCampos then
     txtResultado.Text:= FloatToStr(calcularResultado(StrToFloat(txtNum1.Text), StrToFloat(txtNum2.Text), 'somar'));
end;

procedure TFormPrincipal.btnMultiplicarClick(Sender: TObject);
begin
  if validarCampos then
     txtResultado.Text:= FloatToStr(calcularResultado(StrToFloat(txtNum1.Text), StrToFloat(txtNum2.Text), 'multiplicar'));
end;

procedure TFormPrincipal.btnDividirClick(Sender: TObject);
begin
 if validarCampos then
    begin
      if txtNum2.Text = '0' then
      Application.MessageBox('Não é possível dividir por zero!', 'Erro', MB_ICONERROR or MB_OK)
      else
      txtResultado.Text:= FloatToStr(calcularResultado(StrToFloat(txtNum1.Text), StrToFloat(txtNum2.Text), 'dividir'));
    end;
end;

procedure TFormPrincipal.btnSubtrairClick(Sender: TObject);
begin
 if validarCampos then
  txtResultado.Text:= FloatToStr(calcularResultado(StrToFloat(txtNum1.Text), StrToFloat(txtNum2.Text), 'subtrair'));
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  BorderIcons:= BorderIcons - [biMaximize];
  BorderStyle := bsSingle;
end;

procedure TFormPrincipal.txtNum1Change(Sender: TObject);
begin
  if validarCampos then
   habilitarBotoes(True)
  else
   habilitarBotoes(False);
end;

end.


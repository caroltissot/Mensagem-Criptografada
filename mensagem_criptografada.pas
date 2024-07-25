program MensagemCriptografada;

uses
  SysUtils;

function CriptoTexto(rotacoes: integer; texto: string): string;
var
  i: integer;
  textoCripto: string;
begin
  textoCripto := '';
  rotacoes := rotacoes mod 26;
  for i := 1 to length(texto) do
  begin
    if (texto[i] >= 'a') and (texto[i] <= 'z') then
      textoCripto := textoCripto + Chr((Ord(texto[i]) - Ord('a') + rotacoes) mod 26 + Ord('a'))
    else if (texto[i] >= 'A') and (texto[i] <= 'Z') then
      textoCripto := textoCripto + Chr((Ord(texto[i]) - Ord('A') + rotacoes) mod 26 + Ord('A'))
    else
      textoCripto := textoCripto + texto[i];
  end;
  CriptoTexto := textoCripto;
end;

var
  rotacoes: integer;
  texto, resultado: string;
begin
  write('Digite o texto a ser criptografado: ');
  readln(texto);
  write('Digite o numero de rotacoes: ');
  readln(rotacoes);
  resultado := CriptoTexto(rotacoes, texto);
  writeln('Texto criptografado: ', resultado);
end.
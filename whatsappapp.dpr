program whatsappapp;

uses
  System.StartUpCopy,
  FMX.Forms,
  unt_app in 'unt_app.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

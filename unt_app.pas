unit unt_app;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Edit,
  FMX.StdCtrls,
  FMX.Controls.Presentation,
  FMX.ScrollBox,
  {$IFDEF ANDROID}
    Androidapi.Jni.GraphicsContentViewText,
    Androidapi.Jni.Net,
    idUri,
    Androidapi.Helpers,
  {$ENDIF ANDROID}
  FMX.Memo;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Edit1: TEdit;
    Memo1: TMemo;
    procedure WhatsAppAPI;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

{ TForm1 }

procedure TForm1.SpeedButton1Click(Sender: TObject);
  begin
    WhatsAppAPI;
  end;

procedure TForm1.WhatsAppAPI;
var Numero, Texto, EndURL: string;
    Intend : JIntent;

  begin

    Numero := Edit1.Text; //<– País+DDD+Número
    Texto := Memo1.Lines.Text;
    EndURL := 'https://api.whatsapp.com/send?phone='+
              Numero+'&text='+Texto+'&source=&data=#23';

    try
      Intend := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_VIEW);
      Intend.setData(TJnet_Uri.JavaClass.parse(StringToJString(TIdURI.URLEncode(EndURL))));
      SharedActivity.startActivity(Intend);
      Intend.setPackage(StringToJString('com.whatsapp.w4b'));
      Except on E: Exception do
      ShowMessage(E.Message);
    end;


  end;

end.

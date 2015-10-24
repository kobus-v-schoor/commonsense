unit MainWindow_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, datModule_u;

type
  TMainWindow = class(TForm)
    btnClose: TBitBtn;
    btnLogout: TButton;
    grpStats: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    lblInfected: TLabel;
    lblHighScore: TLabel;
    Panel1: TPanel;
    imgSpam: TImage;
    Panel2: TPanel;
    Panel3: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnLogoutClick(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
  private
    { Private declarations }
  public
    loggedOut : boolean;
  end;

var
  MainWindow: TMainWindow;

implementation

{$R *.dfm}

uses GameWindow_u;

procedure TMainWindow.FormCreate(Sender: TObject);
begin
  self.loggedOut := false;
  self.Width := Screen.Width;
  self.Height := Screen.Height;
  self.imgSpam.Picture.LoadFromFile('rsc\spam.bmp');
end;

procedure TMainWindow.btnCloseClick(Sender: TObject);
begin
  self.Close;
end;

procedure TMainWindow.btnLogoutClick(Sender: TObject);
begin
  self.loggedOut := true;
  self.Close;
end;

procedure TMainWindow.Panel1Click(Sender: TObject);
var
gw : TGameWindow;
begin
  self.Hide;
  gw := TGameWindow.Create(self);
  gw.ShowModal;
  self.Show;
end;

procedure TMainWindow.FormShow(Sender: TObject);
begin
  self.lblInfected.Caption := datModule.tblUsers['Infections'];
  self.lblHighScore.Caption := datModule.tblUsers['HighScore'];
end;

procedure TMainWindow.Panel2Click(Sender: TObject);
var
tfile : TextFile;
begin
//Save all stats to text file
end;

end.

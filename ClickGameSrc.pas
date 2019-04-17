unit ClickGameSrc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg, Buttons, Menus;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    StartLabel: TLabel;
    Label3: TLabel;
    TimerLabel: TLabel;
    Label2: TLabel;
    ClickLabel: TLabel;
    Timer1: TTimer;
    SpeedBtn1: TSpeedButton;
    Timer2: TTimer;
    OnTopBtn: TSpeedButton;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    About1: TMenuItem;
    About2: TMenuItem;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  TimeInt: integer;
  GameStarted: bool;
  ClickCount: integer;

implementation

uses About;

{$R *.dfm}

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Form1.Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  TimeInt := 60;
  TimerLabel.Caption := IntToStr(TimeInt);
  GameStarted := false;
  Button1.Visible := false;
end;

procedure TForm1.SpeedBtn1Click(Sender: TObject);
begin
  if GameStarted = false then begin
    GameStarted := true;
    Timer1.Enabled := true;
    TimeInt := 60;
    StartLabel.Visible := false;
  end else begin
    Button1.Visible := true;
    ClickCount := ClickCount+1;
    ClickLabel.Caption := IntToStr(ClickCount);
  end;
end;

procedure TForm1.About2Click(Sender: TObject);
begin
  Form2.Visible := true;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  GameStarted := false;
  Timer1.Enabled := false;
  TimeInt := 60;
  ClickCount := 0;
  StartLabel.Caption := 'Click the Pk image to start!';
  StartLabel.Visible := true;
  TimerLabel.Caption := IntToStr(TimeInt);
  ClickLabel.Caption := IntToStr(ClickCount);
  Button1.Visible := false;
  OnTopBtn.Visible := false;
  SpeedBtn1.Enabled := true;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  TimeInt := TimeInt-1;
  if TimeInt = 0 then begin
    Timer1.Enabled := false;
    OnTopBtn.Visible := true;
    SpeedBtn1.Enabled := false;
    GameStarted := false;
    StartLabel.Visible := true;
    StartLabel.Caption := 'Press Reset to play again!';
  end;
  TimerLabel.Caption := IntToStr(TimeInt);
end;

end.

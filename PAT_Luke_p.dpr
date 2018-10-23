program PAT_Luke_p;

uses
  Forms,
  PAT_Luke_u in 'PAT_Luke_u.pas' {frm_MainGame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_MainGame, frm_MainGame);
  Application.Run;
end.

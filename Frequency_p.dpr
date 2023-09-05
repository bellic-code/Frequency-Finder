program Frequency_p;

uses
  Forms,
  Frequency_u in 'Frequency_u.pas' {frmFrequency};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFrequency, frmFrequency);
  Application.Run;
end.

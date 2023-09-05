unit Frequency_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Spin;

type
  TfrmFrequency = class(TForm)
    lstData: TListBox;
    btnAdd: TButton;
    btnDelete: TButton;
    pnlFrequency: TPanel;
    edtStartRange: TEdit;
    edtEndRange: TEdit;
    memResults: TMemo;
    btnScan: TButton;
    lblDataHeader: TLabel;
    lblStartHeader: TLabel;
    lblEndHeader: TLabel;
    lblResultsHeader: TLabel;
    pnlCancel: TPanel;
    lblFrequency: TLabel;
    edtFrequency: TEdit;
    sedValue: TSpinEdit;
    lblInterval: TLabel;
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnScanClick(Sender: TObject);
    procedure pnlCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFrequency: TfrmFrequency;

implementation

{$R *.dfm}

procedure TfrmFrequency.btnAddClick(Sender: TObject);
var
  sInput : String;
begin
sInput := InputBox('Add data', 'Input a number to add to the data set:', '');
lstData.Items.Add(sInput);
end;

procedure TfrmFrequency.btnDeleteClick(Sender: TObject);
begin
lstData.DeleteSelected;
ShowMessage('Entry removed from data set');
end;

procedure TfrmFrequency.btnScanClick(Sender: TObject);
var
  I, iStart, iEnd, iData : Integer;
begin
iStart := StrToInt(edtStartRange.Text);
iEnd := StrToInt(edtEndRange.Text);

for I := 0 to lstData.Items.Count - 1 do
  begin
  iData := StrToInt(lstData.Items[I]);
    if (iData >= iStart) and (iData < iEnd) then
        memResults.Lines.Add(IntToStr(iData))
  end;
edtFrequency.Text := IntToStr(memResults.Lines.Count);
end;

procedure TfrmFrequency.pnlCancelClick(Sender: TObject);
begin
lstData.Items.Clear;
edtStartRange.Clear;
edtEndRange.Clear;
memResults.Clear;

ShowMessage('Application reset to default values');
end;

end.

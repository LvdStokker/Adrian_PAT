unit PAT_Luke_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, StdCtrls, Buttons, jpeg;

type
  Tfrm_MainGame = class(TForm)
    drwgd_Player: TDrawGrid;
    btbtnRestart: TBitBtn;
    drwgd_PC: TDrawGrid;
    lbl_MainGame: TLabel;
    btbtnHelp: TBitBtn;
    pnl_Ships: TPanel;
    imgCarrier: TImage;
    imgBattleShip: TImage;
    imgCruiser: TImage;
    imgSubmarine: TImage;
    imgDestroyer: TImage;
    lblCarrier: TLabel;
    lblBattleship: TLabel;
    lblSubmarine: TLabel;
    lblCruiser: TLabel;
    lblDestroyer: TLabel;
    pnlBattleship: TPanel;
    pnlSubmarine: TPanel;
    pnlCruiser: TPanel;
    pnlDestroyer: TPanel;
    pnlCarrier: TPanel;
    btbtnCancel: TBitBtn;
    procedure drwgd_PlayerSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure btbtnRestartClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure drwgd_PlayerDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Shape1MouseEnter(Sender: TObject);
    procedure imgBattleShipClick(Sender: TObject);
    procedure imgSubmarineClick(Sender: TObject);
    procedure imgCruiserClick(Sender: TObject);
    procedure imgDestroyerClick(Sender: TObject);
    procedure pnlCarrierMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlCarrierMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlBattleshipMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlBattleshipMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlSubmarineMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlSubmarineMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlCruiserMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlCruiserMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlDestroyerMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlDestroyerMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    a2i_PlayerField: array [1 .. 10] of array [1 .. 10] of Integer;
    a2i_PcField: array [1 .. 10] of array [1 .. 10] of Integer;
    i_Rows, i_Columns, iCellsToSelect: Integer;
    a2i_PlayerBoats: array [1 .. 5] of array [1 .. 2] of Integer;
    a2i_PcBoats: array [1 .. 5] of array [1 .. 2] of Integer;
  end;

var
  frm_MainGame: Tfrm_MainGame;

implementation

{$R *.dfm}

// ***************************PLACE CUSTOM PROCEDURES HERE***********************//
// Description: Resets all fields to blank (0)  and initialize the game variables
procedure RestartGame();
var
  iRow, iColumn, iId: Integer;
begin
  with frm_MainGame do
  begin
    //Set selectable cells to 0
    iCellsToSelect := 0;
    //Set grids to disabled
    drwgd_Player.Enabled := false;
    drwgd_PC.Enabled := false;

    //Set all grid values to 0 "Ocean"
    for iRow := 1 to frm_MainGame.i_Rows do // Rows
    begin
      for iColumn := 1 to frm_MainGame.i_Columns do // Column
      begin
        a2i_PlayerField[iRow][iColumn] := 0;
        a2i_PcField[iRow][iColumn] := 0;
      end; // End inner for loop
    end; // End outer for loop

    // Set boat ID's and health
    for iId := 1 to 5 do
    begin
      a2i_PlayerBoats[iId][1] := iId;
      a2i_PcBoats[iId][1] := iId;
      // Set health values
      if iId <= 2 then
      begin
        a2i_PlayerBoats[iId][2] := iId + 1;
        a2i_PcBoats[iId][2] := iId + 1;
      end
      else
      begin
        a2i_PlayerBoats[iId][2] := iId;
        a2i_PcBoats[iId][2] := iId;
      end;
    end;
  end;
end;

// Description: Sets all boat selection "buttons" to an enable value
procedure setBoatButtonsEnabled(bValue: Boolean);
begin
  with frm_MainGame do
  begin
    pnlCarrier.Enabled := bValue;
    pnlCruiser.Enabled := bValue;
    pnlDestroyer.Enabled := bValue;
    pnlSubmarine.Enabled := bValue;
    pnlBattleship.Enabled := bValue;
  end;
end;

// Description:
procedure handleCellSelection(iBoatId: Integer);
var
iNumCells, temp : Integer;
begin
  with frm_MainGame do
  begin
      iNumCells := a2i_PlayerBoats[iBoatId][2];
      drwgd_Player.Enabled := true;
      case iBoatId of
        //Destroyer
        1: temp = 0;
        //Cruiser
        2: temp = 0;
        //Submarine
        3: temp = 0;
        //Battleship
        4: temp = 0;
        //Carrier
        5:
        else temp = 0;
      end;
  end;
end;
// *****************************************************************************

procedure Tfrm_MainGame.btbtnRestartClick(Sender: TObject);
begin
  RestartGame();
end;

procedure Tfrm_MainGame.drwgd_PlayerDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  test: Integer;
begin

end;

procedure Tfrm_MainGame.drwgd_PlayerSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  // Call handle cell select
end;

// Initialise the starting game conditions
procedure Tfrm_MainGame.FormShow(Sender: TObject);
begin
  i_Rows := 10;
  i_Columns := 10;
  RestartGame();
end;

procedure Tfrm_MainGame.imgBattleShipClick(Sender: TObject);
begin
  //Select a boat and get given x possible spots to pick based on health
  //Four piece boat
  iCellsToSelect :=  frm_MainGame.a2i_PlayerBoats[4][2];
  drwgd_Player.Enabled := true;
end;

procedure Tfrm_MainGame.imgSubmarineClick(Sender: TObject);
begin
  //Select a boat and get given x possible spots to pick based on health
  //Three piece boat
  iCellsToSelect :=  frm_MainGame.a2i_PlayerBoats[3][2];
  drwgd_Player.Enabled := true;
end;

procedure Tfrm_MainGame.pnlBattleshipMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 pnlBattleship.Visible := False;
end;

procedure Tfrm_MainGame.pnlBattleshipMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 pnlBattleship.Visible := True;
 iCellsToSelect := frm_mainGame.a2i_PlayerBoats [4][2];
 drwgd_Player.Enabled := true;
end;

procedure Tfrm_MainGame.pnlCarrierMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  //Makes "Button" go down
  pnlCarrier.Visible := false;
end;

procedure Tfrm_MainGame.pnlCarrierMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  var
  boatId : Integer;
begin
  //Select a boat and get given x possible spots to pick based on health
  //Five piece boat
  setBoatButtonsEnabled(false); //ADRIAN - Do for all buttons
  pnlCarrier.Enabled := true;
  btbtnCancel.enabled := true;

  boatId :=  frm_MainGame.a2i_PlayerBoats[5][1];
  //Call a function which handles the selection of cells
  handleCellSelection(boatId);
end;


procedure Tfrm_MainGame.pnlCruiserMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
pnlCruiser.Visible := false;
end;

procedure Tfrm_MainGame.pnlCruiserMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
pnlCruiser.Visible := true;

  iCellsToSelect :=  frm_MainGame.a2i_PlayerBoats[2][2];
  drwgd_Player.Enabled := true;


end;

procedure Tfrm_MainGame.pnlDestroyerMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
pnlDestroyer.Visible := false;
end;

procedure Tfrm_MainGame.pnlDestroyerMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
pnlDestroyer.Visible := true;
  //Select a boat and get given x possible spots to pick based on health
  //Five piece boat
  iCellsToSelect :=  frm_MainGame.a2i_PlayerBoats[1][2];
  drwgd_Player.Enabled := true;

end;

procedure Tfrm_MainGame.pnlSubmarineMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
pnlSubmarine.Visible := false;
end;

procedure Tfrm_MainGame.pnlSubmarineMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
pnlSubmarine.Visible := true;
  //Select a boat and get given x possible spots to pick based on health
  //Five piece boat
  iCellsToSelect :=  frm_MainGame.a2i_PlayerBoats[3][2];
  drwgd_Player.Enabled := true;

end;

procedure Tfrm_MainGame.imgCruiserClick(Sender: TObject);
begin
  //Select a boat and get given x possible spots to pick based on health
  //Three piece boat
  iCellsToSelect :=  frm_MainGame.a2i_PlayerBoats[2][2];
  drwgd_Player.Enabled := true;
end;

procedure Tfrm_MainGame.imgDestroyerClick(Sender: TObject);
begin
  //Select a boat and get given x possible spots to pick based on health
  //Two piece boat
  iCellsToSelect :=  frm_MainGame.a2i_PlayerBoats[1][2];
  drwgd_Player.Enabled := true;
end;

procedure Tfrm_MainGame.Shape1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  //Select a boat and get given x possible spots to pick based on health
  //If boat 2
  iCellsToSelect :=  frm_MainGame.a2i_PlayerBoats[1][2];
  drwgd_Player.Enabled := true;
end;

procedure Tfrm_MainGame.Shape1MouseEnter(Sender: TObject);
begin
   //Select a boat and get given x possible spots to pick based on health
  //If boat 2
  iCellsToSelect :=  frm_MainGame.a2i_PlayerBoats[1][2];
  drwgd_Player.Enabled := true;
end;

procedure Tfrm_MainGame.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  s: string;
  aCanvas: TCanvas;
begin

end;

end.

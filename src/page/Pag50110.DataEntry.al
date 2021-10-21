page 50110 "DataEntry"
{
    Caption = 'Data Entry';
    PageType = StandardDialog;
    layout
    {
        area(content)
        {
            field(TableNo; xgInteger)
            {
                ApplicationArea = All;
                Caption = 'Table No.';
            }
        }
    }
    var
        xgInteger: Integer;

    procedure SetNo(): Integer
    begin
        exit(xgInteger);
    end;
}
page 50111 "KPI Counting Tool"
{

    Caption = 'KPI Counting Tool';
    PageType = Card;
    UsageCategory = Tasks;
    ApplicationArea = all;

    layout
    {

    }
    actions
    {
        area(Creation)
        {
            action(KPITool)
            {
                ApplicationArea = All;
                Image = TestReport;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Caption = 'New query';

                trigger OnAction()
                var
                    pglEntry: Page DataEntry;
                    xlRecRef: RecordRef;
                    xlPageBuilder: FilterPageBuilder;
                    xlTableNo: Integer;
                    ProcessCanceledLbl: Label 'Process canceled';
                begin
                    if pglEntry.RunModal() in [Action::OK, Action::Yes] then begin
                        xlTableNo := pglEntry.SetNo();

                        xlPageBuilder.PageCaption('Quick KPI tool');
                        xlPageBuilder.AddTable('Filter', xlTableNo);
                        if xlPageBuilder.RunModal() then begin
                            xlRecRef.Open(xlTableNo);
                            xlRecRef.SetView(xlPageBuilder.GetView('Filter'));
                        end else begin
                            Error(Format(ProcessCanceledLbl));
                        end;
                        Message(Format(xlRecRef.Count));
                    end;
                end;
            }
        }
    }
}
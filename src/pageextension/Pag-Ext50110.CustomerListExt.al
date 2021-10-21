// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50110 "CustomerListExt" extends "Customer List"
{
    actions
    {
        addlast("&Customer")
        {

            action(KPITool)
            {
                ApplicationArea = All;
                Image = TestReport;

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
pageextension 50182 GenLedEntry extends "General Ledger Entries"
{
    layout
    {
        addbefore(Description)
        {
            field(RecordNumber; Rec.RecordNumber)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}


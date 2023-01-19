pageextension 50168 PnP extends "Purchases & Payables Setup"
{
    layout
    {
        addbefore("Quote Nos.")
        {
            field(Rec; Rec.Rec)
            {
                ApplicationArea = All;
                TableRelation = "No. Series";
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


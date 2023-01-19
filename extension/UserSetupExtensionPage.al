pageextension 50173 UserSetupExtensionPage extends "User Setup"
{
    layout
    {
        addafter("Allow Posting From")
        {
            field("Allow Bill Post"; Rec."Allow Bill Post")
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
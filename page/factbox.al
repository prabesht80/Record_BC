page 50166 factbox
{
    PageType = listpart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Customer;

    layout
    {
        area(content)
        {
            field("No."; Rec."No.")
            {
                ApplicationArea = Basic;
            }
            field(Address; Rec.Address)
            {
                ApplicationArea = Basic;
            }
        }
    }
    var
        "Doc No.": code[10];
        price: Decimal;
        myInt: Integer;
}

page 50169 factbox1
{
    PageType = CardPart;
    SourceTable = "Posted Record Line";

    layout
    {
        area(content)
        {
            field("Item No."; Rec."Item No.")
            {
                ApplicationArea = All;
            }
            field(Description; Rec.Description)
            {
                ApplicationArea = All;
            }
            field("Unit Price"; Rec."Unit Price")
            {
                ApplicationArea = All;
            }
        }
    }

    var
        // RecordCodeunit: codeunit Call;
        myInt: Integer;
        ItemNo: Decimal;

}

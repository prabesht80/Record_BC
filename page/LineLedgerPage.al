page 50157 "Line Ledger"
{
    PageType = list;
    ApplicationArea = All;
    UsageCategory = lists;
    SourceTable = "Line Ledger";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Doc No."; Rec."Doc No.")
                {
                    ApplicationArea = All;
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = All;
                }
                field(User; Rec.User)
                {
                    ApplicationArea = All;
                }
            }
        }
    }


}
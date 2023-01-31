page 50158 "Posted Record Header Page"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Posted Record Header";
    CardPageId = "Posted Record Header Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field(UserId; Rec.UserId)
                {
                    ApplicationArea = All;
                }
                field(User; Rec.User)
                {
                    ApplicationArea = All;
                    DrillDown = true;
                    // DrillDownPageId = 50160;
                    trigger OnDrillDown()
                    var
                        Recline: Record "Posted Record Line";
                    begin
                        Recline.Reset();
                        Recline.SetFilter("Doc No.", '%1', Rec."No.");
                        if Recline.FindFirst() then
                            Page.Run(50160, Recline);
                    end;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = All;
                }
                field("Total Amount After Tax"; Rec."Total Amount After Tax")
                {
                    ApplicationArea = All;
                }
                field(Time; Rec.Time)
                {
                    ApplicationArea = All;
                }
                field(Delete; Rec.Delete)
                {
                    ApplicationArea = All;
                }
                field(AccountNumber; Rec.AccountNumber)
                {
                    ApplicationArea = All;
                }
                field("No. of Ticket Bought"; Rec."No. of Ticket Bought")
                {
                    ApplicationArea = All;
                }
            }
        }

    }

}
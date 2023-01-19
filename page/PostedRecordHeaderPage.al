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
                    DrillDown = true;
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
                    DrillDown = true;

                }

            }

        }

    }
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }

        }
    }


}
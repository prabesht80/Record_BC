page 50153 "Record Header Page"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Record Header";
    CardPageId = "Record Header Card";
    // Editable = false;

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
                field(Person; Rec.Person)
                {
                    ApplicationArea = All;
                }
                field(UserAcc; Rec.UserAcc)
                {
                    ApplicationArea = All;
                }
                field("Vendor Name"; Rec."Vendor Name")
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
                

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(methodOverload)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    codeU: Codeunit Call;
                begin
                    codeU.methodOverloading();
                end;
            }

        }
    }
 
}
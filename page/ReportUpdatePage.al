page 50183 ReportUpdate
{
    PageType = List;
    SourceTable = "Posted Record Header";

    layout
    {
        area(Content)
        {
            group(Bill)
            {
                field(CusNo; CusNo)
                {
                    ApplicationArea = All;
                    TableRelation = "Posted Record Header";
                }
                field(postedBill; PostedBill)
                {
                    ApplicationArea = All;
                    TableRelation = "Posted Record Header";

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

    var
        CusNo: Code[20];
        postedBill: Boolean;
}
page 50167 NewRecordPage
{
    PageType = list;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = NewRecord;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;

                }
                field(postingDate; postingDate)
                {
                    ApplicationArea = All;

                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;

                }
                field(itemNo; itemNo)
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
            action(postingDates)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    posRec: Record "Posted Record Header";
                    posLine: Record "Posted Record Line";
                begin
                    posRec.Reset();
                    posRec.SetRange("No.", Rec."No.");
                    if posRec.FindFirst() then begin
                        postingDate := posRec."Posting Date";
                        posLine.Reset();
                        posLine.SetRange("Doc No.", posRec."No.");
                        posLine.SetRange("Line No.", Rec."Line No.");
                        if posLine.FindFirst() then
                            itemNo := posLine."Item No.";
                    end;
                end;
            }
        }
    }

    var
        myInt: Integer;
        itemNo: code[10];
        postingDate: date;
}
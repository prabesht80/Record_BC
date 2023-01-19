page 50177 RescheduleCard
{
    PageType = Card;
    // ApplicationArea = All;
    // UsageCategory = Administration;
    SourceTable = "Posted Record Header";


    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Record header Primary key';
                }
                field(UpdateDate; UpdateDate)  // global var tala declare garya
                {
                    ApplicationArea = All;
                    ToolTip = 'New Date to Update Posting date';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {

            //reschedule if employee
            action("Reschedule")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    postedHeader: Record "Posted Record Header";

                begin
                    postedHeader.Reset();
                    postedHeader.SetRange("No.", Rec."No.");
                    postedHeader.SetFilter(Person, '%1', postedHeader.Person::Employee);
                    if postedHeader.FindFirst() then begin
                        postedHeader."Posting Date" := UpdateDate;
                        postedHeader.Modify();
                        Message('Rescheduled %1', postedHeader."Posting Date");
                    end
                    else
                        Message('Customer not allowed to reschedule');
                end;
            }
        }
    }

    var
        myInt: Integer;
        UpdateDate: Date;
}
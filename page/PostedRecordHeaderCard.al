page 50162 "Posted Record Header Card"
{
    PageType = Card;
    // ApplicationArea = All;
    // UsageCategory = Lists;
    SourceTable = "Posted Record Header";
    Editable = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
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
                field(UserId; Rec.UserId)
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
            group(Line)
            {
                part(PostedListPart; "Posted Record Line Page")
                {
                    SubPageLink = "Doc No." = field("No.");
                    ApplicationArea = All;
                    UpdatePropagation = Both;
                }
            }

        }
        area(FactBoxes)
        {
            part(factbox; factbox)
            {
                ApplicationArea = All;
                SubPageLink = "No." = field(UserId);
            }
            part(factbox1; factbox1)
            {
                ApplicationArea = All;
                Provider = PostedListPart;
                SubPageLink = "Doc No." = field("Doc No."),
                               "Line No." = field("Line No.");
            }

        }
    }
    actions
    {
        area(Processing)
        {

            action("Bill")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Print;

                trigger OnAction()
                var
                    PostedHeader: Record "Posted Record Header";
                begin
                    PostedHeader.Reset();
                    PostedHeader.setRange("No.", Rec."No.");
                    if PostedHeader.FindFirst() then
                        Report.run(Report::Bill, true, true, PostedHeader);
                end;
            }
            action("cusQuery")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Print;

                trigger OnAction()
                var
                    PostedHeader: Record "Posted Record Header";
                begin
                    // PostedHeader.Reset();
                    // PostedHeader.setRange("No.", Rec."No.");
                    // if PostedHeader.FindFirst() then
                    Report.run(Report::CusReport);
                end;
            }

            action("Billing")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Print;

                trigger OnAction()
                var
                    PostedHeader: Record "Posted Record Header";
                begin
                    PostedHeader.Reset();
                    PostedHeader.setRange("No.", Rec."No.");
                    if PostedHeader.FindFirst() then
                        Report.run(Report::ReportUpdate, true, true, PostedHeader);
                end;
            }

            action("Reschedule")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    // page.Run(page::RescheduleCard);
                    page.run(50177, Rec)
                end;
            }

            //settableview currentrecored bata particular field haru
            action(UserDetail)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    PostedRecordHeader: Record "Posted Record Header";
                    UserDetail: Page UserDetail;

                begin
                    PostedRecordHeader.SETCURRENTKEY("No.");
                    PostedRecordHeader.SETRANGE("No.", Rec."No.");
                    UserDetail.SETTABLEVIEW(PostedRecordHeader);
                    UserDetail.RUN();
                end;
            }

            action(PostToCusLed)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    codeU: Codeunit Call;
                begin
                    codeU.insertIntoLineLedgerEntry(Rec."No.");
                end;
            }

            action(duedate)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    c: date;
                begin
                    c := calcdate('<5M-5D>', Rec."Posting Date");
                    Message('Duedate: %1', c);
                end;
            }
        }
    }
}




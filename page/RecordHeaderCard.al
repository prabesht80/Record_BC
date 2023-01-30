page 50152 "Record Header Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Record Header";
    Caption = 'Record Entry';

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
                field(Person; Rec.Person)
                {
                    ApplicationArea = All;
                }
                field(UserId; Rec.UserId)
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
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        CusRec: Record customer;
                        EmpRec: Record Employee;
                    begin
                        if Rec.Person = Rec.Person::" " then
                            Message('Type Field is Empty')
                        else
                            if Rec.Person = Rec.Person::Customer then begin
                                CusRec.Reset();
                                if page.RunModal(page::"Customer List", CusRec) = Action::LookupOK then
                                    Rec.AccountNumber := CusRec."Our Account No."
                            end
                            else begin
                                EmpRec.Reset();
                                if page.RunModal(page::"Employee List", EmpRec) = Action::LookupOK then
                                    Rec.AccountNumber := EmpRec."Phone No."
                            end;
                    end;
                }

                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    trigger OnAssistEdit()
                    begin
                        Message('hey');
                    end;
                }

            }
            group(Line)
            {
                part(ListPart; "Record Line Page")
                {
                    SubPageLink = "Doc No." = field("No.");
                    ApplicationArea = All;
                    UpdatePropagation = both;
                }
            }
        }


    }

    actions
    {
        area(Processing)
        {
            action(HeaderPost)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                //PromotedIsBig = true;
                Image = Post;

                trigger OnAction()
                var
                    codeU: Codeunit Call;

                begin
                    codeU.insertToPostedHeader(Rec."No.");
                end;
            }
            action(LinePost)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    codeU: Codeunit Call;
                begin
                    codeU.insertRecordLineToPostedRecordLine(rec."No.");
                end;
            }

        }
    }


}
page 50160 "Posted Record Line Page"
{
    PageType = ListPart;
    AutoSplitKey = true;
    SourceTable = "Posted Record Line";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Line No."; Rec."Line No.")
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
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;

                }
                field("Total Price"; Rec."Total Price")
                {
                    ApplicationArea = All;

                }
                field("Amount After Tax"; Rec."Amount After Tax")
                {
                    ApplicationArea = All;

                }
                field(PosDate; Rec.PosDate)
                {
                    ApplicationArea = All;

                }
                // field(ExchangeRate; ExchangeRate)
                // {
                //     ApplicationArea = All;
                //     DecimalPlaces = 0 : 5;

                // }
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

    // trigger OnAfterGetRecord()
    // begin
    //     CurrExcRate.Reset();
    //     CurrExcRate.SetRange("Currency Code", 'NPR');
    //     CurrExcRate.SetRange("Starting Date", Rec.PosDate);
    //     if CurrExcRate.FindFirst() then
    //         ExchangeRate := CurrExcRate."Exchange Rate Amount";
    // end;

    // var

    //     CurrExcRate: Record "Currency Exchange Rate";
    //     ExchangeRate: Decimal;
}
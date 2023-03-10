report 50158 Bill
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'RDLC/Billing.rdl';
    // ProcessingOnly = true;
    // DefaultLayout = Word;
    // WordLayout = 'word/Bill.docx';

    dataset
    {
        dataitem("Posted Record Header"; "Posted Record Header")
        {
            column(No_; "No.")
            {

            }
            column(Posting_Date; "Posting Date")
            {

            }

            column(UserId; UserId)
            {

            }
            column(Vendor_Name; "Vendor Name")
            {

            }


            dataitem("Posted Record Line"; "Posted Record Line")
            {
                DataItemLink = "Doc No." = field("No.");
                column(Item_No_; "Item No.")
                {

                }
                column(Line_No_; "Line No.")
                {

                }
                column(Description; Description)
                {

                }
                column(Quantity; Quantity)
                {

                }
                column(Unit_Price; "Unit Price")
                {

                }
                column(Total_Price; "Total Price") { }
                column(PosDate; PosDate) { }

                column(ExchangeRate; ExchangeRate) { }


                trigger OnAfterGetRecord()
                begin
                    CurrExcRate.Reset();
                    CurrExcRate.SetRange("Currency Code", 'NPR');
                    CurrExcRate.SetRange("Starting Date", "Posted Record Line".PosDate);
                    if CurrExcRate.FindFirst() then
                        ExchangeRate := CurrExcRate."Exchange Rate Amount";
                end;

            }
        }
    }

    var

        CurrExcRate: Record "Currency Exchange Rate";
        ExchangeRate: Decimal;

}
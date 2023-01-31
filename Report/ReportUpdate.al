report 50185 ReportUpdate
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'RDLC/Bill.rdl';
    ProcessingOnly = true;

    dataset
    {
        dataitem(Integer; Integer)
        {
            DataItemTableView = where(Number = const(1));
            trigger OnAfterGetRecord()
            var
                postedBillHdr: Record "Posted Record Header";
                Cus: Record Customer;
            begin
                if postedBill = '' then
                    Error('enter the doc you want to update');
                postedBillHdr.reset();
                postedBillHdr.SetRange("No.", postedBill);
                if postedBillHdr.FindFirst() then begin
                    if CusNo <> '' then begin
                        postedBillHdr.UserId := CusNo;
                        if Cus.get(CusNo) then
                            postedBillHdr."Vendor Name" := Cus.Name;
                    end;
                    postedBillHdr.Modify()
                end;
                Message('done');
            end;
        }

    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Bill)
                {
                    field(CusNo; CusNo)
                    {
                        ApplicationArea = All;
                        TableRelation = Customer;
                    }
                    field(postedBill; postedBill)
                    {
                        ApplicationArea = All;
                        TableRelation = "Posted Record Header";

                    }
                }
            }
        }
    }
    var
        CusNo: Code[20];
        postedBill: code[20];
}
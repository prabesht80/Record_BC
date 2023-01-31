report 50166 CusReport
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'caption Report';
    DefaultLayout = RDLC;
    RDLCLayout = 'RDLC/CusReport.rdl';

    dataset
    {
        dataitem(Integer; Integer)
        {
            DataItemTableView = sorting(Number);
            column(cusNo; cusNo)
            {

            }
            column(Name; Name)
            {

            }
            column(Address; Address)
            {
            }

            trigger OnPreDataItem()
            begin
                SetRange(Number, 1, Top);
                cusQuery.TopNumberOfRows(Top);
                cusQuery.open();
            end;

            trigger OnAfterGetRecord()
            begin
                if cusQuery.Read() then begin
                    cusNo := cusQuery.No_;
                    Name := cusQuery.Name;
                    Address := cusQuery.Address;
                end
                else begin
                    CurrReport.Skip();
                end;
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(Top; Top)
                    {
                        ApplicationArea = All;

                    }
                }
            }
        }


    }
    trigger OnInitReport()
    begin
        Top := 4;
    end;


    var
        cusQuery: Query custQuery;
        Top: Integer;
        cusNo: code[10];
        Name: Text[40];
        Address: Text[50];
        myInt: Integer;
}
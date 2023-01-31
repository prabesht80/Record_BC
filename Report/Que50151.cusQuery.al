query 50151 custQuery
{
    Caption = 'cusQuery';
    QueryType = Normal;
    OrderBy = ascending(No_);
    TopNumberOfRows = 4;

    elements
    {
        dataitem(Customer; Customer)
        {
            column(No_; "No.")
            {

            }
            column(Name; Name)
            {

            }
            column(Address; Address)
            {

            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}

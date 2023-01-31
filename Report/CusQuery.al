query 50169 cusQuery
{
    QueryType = Normal;

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

    var
        myInt: Integer;

    trigger OnBeforeOpen()
    begin

    end;
}
table 50156 "Posted Record Line"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Doc No."; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7; Description; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; Quantity; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Unit Price"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Amount After Tax"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        field(8; "Total Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; PosDate; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Pk; "Doc No.", "Line No.")
        {
            Clustered = true;
        }
    }


}
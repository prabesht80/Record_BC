table 50159 "Line Ledger"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Doc No."; Code[10])
        {
            DataClassification = ToBeClassified;

        }

        field(3; "Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(4; Quantity; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Total Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; Description; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(9; User; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Pk; "Doc No.", "Entry No.")
        {
            Clustered = true;
        }
    }

}
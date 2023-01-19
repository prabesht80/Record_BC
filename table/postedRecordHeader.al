table 50158 "Posted Record Header"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[10])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;

        }
        field(3; UserId; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Vendor Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Total Amount"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Posted Record Line"."Total Price" where("Doc No." = field("No.")));
        }
        field(6; "Total Amount After Tax"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Posted Record Line"."Amount After Tax" where("Doc No." = field("No.")));

        }
        field(7; "Time"; Time)
        {
            Caption = 'Current Time';
            DataClassification = ToBeClassified;
        }
        field(9; Person; Option)
        {
            Caption = 'Type';
            OptionMembers = " ",Customer,Employee;
        }
        field(10; User; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(12; Delete; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(13; AccountNumber; Code[20])
        {
            caption = 'Account Number';
            DataClassification = ToBeClassified;
        }
        field(14; "No. of Ticket Bought"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Posted Record Header" where(Delete = const(false)));
        }

    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }




}
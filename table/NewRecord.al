table 50166 NewRecord
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; code[10])
        {
            DataClassification = ToBeClassified;
        }

        field(3; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}
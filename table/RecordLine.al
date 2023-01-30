table 50151 "Record Line"
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
            TableRelation = Item;
            trigger OnValidate()
            var
                Item: Record Item;
                pcodeunit: Codeunit Call;
            begin
                Item.Reset();
                Item.SetRange("No.", Rec."Item No.");
                if Item.FindFirst() then begin
                    Description := Item.Description;
                    "Unit Price" := Item."Unit Price";
                end;

                pcodeunit.TaxCalculation(rec."Amount After Tax", rec."Total Price");
            end;
        }
        field(7; Description; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; Quantity; Integer)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                codeUnit: Codeunit Call;
            begin
                codeUnit.TotalCalculation(Rec.Quantity, Rec."Unit Price", Rec."Total Price");
                codeUnit.TaxCalculation(rec."Amount After Tax", rec."Total Price");

            end;
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
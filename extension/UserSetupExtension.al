tableextension 50172 UserSetupExtension extends "User Setup"
{
    fields
    {
        field(33; "Allow Bill Post"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}
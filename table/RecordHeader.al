table 50150 "Record Header"
{
    DataClassification = ToBeClassified;
    // TableType = temporary;

    fields
    {
        field(1; "No."; Code[10])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()

            begin
                if "No." <> xRec."No." then begin
                    Pnp.Get();
                    Pnp.TestField(Pnp.Rec);
                    NoseriesMgt.TestManual(Pnp.Rec);
                    Op := '';
                    NoseriesMgt.SetSeries("No.");
                end;

            end;
        }
        field(2; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
            // Editable = false;
        }
        field(9; Person; Option)
        {
            Caption = 'Type';
            OptionMembers = " ",Customer,Employee;
        }
        field(3; UserAcc; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = if (Person = const(Customer)) Customer
            else
            if (Person = const(Employee)) Employee;

            trigger OnValidate()
            var
                Customer: Record Customer;
                Employee: Record Employee;
            begin
                TestField(Person);
                if Person = Person::Customer then begin
                    Customer.Reset();
                    // Customer.SetRange("No.", Customer."No.");
                    if Customer.get(UserAcc) then begin
                        AccountNumber := Customer."Preferred Bank Account Code";
                        "Vendor Name" := customer.Name
                        // "Total Amount" := Customer.Balance;
                    end;
                end
                else
                    if Person = Person::Employee then begin
                        Employee.Reset();
                        // Employee.SetRange("No.", Employee."No.");
                        if Employee.get(UserAcc) then begin
                            AccountNumber := Employee."Bank Account No.";
                            "Vendor Name" := Employee.FullName;

                            // "Total Amount" := Employee.Balance;
                        end;
                    end;
            end;
        }
        field(4; "Vendor Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }

        field(7; "Time"; Time)
        {
            Caption = 'Current Time';
            DataClassification = ToBeClassified;
        }
        field(8; Op; Code[10])
        {
            Caption = 'Current Time';
            DataClassification = ToBeClassified;
        }
        field(10; UserId; Code[20])
        {
            DataClassification = ToBeClassified;
            // trigger OnLookup()
            // begin
            //     Message('you can choose random name');
            // end;
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
        field(14; Name; text[10])
        {
            DataClassification = ToBeClassified;

        }

    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }


    trigger OnInsert()
    var
        pcodeunit: Codeunit Call;
    begin
        if "No." = '' then begin
            Pnp.Get();
            Pnp.TestField(pnp.Rec);
            Clear(NoseriesMgt);
            NoseriesMgt.InitSeries(Pnp.Rec, xRec.Op, Today, "No.", Rec.Op);
        end;

        "Posting Date" := Today;
        "Time" := system.Time;
        "UserId" := 'Open';
    end;

    var
        PnP: Record "Purchases & Payables Setup";
        NoseriesMgt: Codeunit NoSeriesManagement;


}
codeunit 50155 Call
{

    //existing table ma change garda permission necessary
    Permissions = tabledata "Cust. Ledger Entry" = rmi, tabledata "G/L Entry" = rmi;


    trigger OnRun()
    begin

    end;

    procedure methodOverloading()
    var
        posHead: Record "Posted Record Header";
        changed: Code[10];
    begin
        overload1(posHead."Vendor Name", changed);
        Message('%1', changed);
        overload2(posHead."No. of Ticket Bought");
    end;

    local procedure overload1(Name: text[50]; var changed: code[10]): text
    begin
        // Message('Name: %1', Name);
        changed := 'Prabesh';
        exit(changed);
    end;

    local procedure overload2(Ticket: Integer)
    begin
        Message('Ticket : %1', Ticket);
    end;


    //notification on open page
    [EventSubscriber(ObjectType::page, page::"Record Header Card", 'OnOpenPageEvent', '', false, false)]
    procedure checkNotification()
    var
        Notify: Notification;
    begin
        Notify.Message('Fill all the fields');
        Notify.Scope := Notify.Scope::LocalScope;
        Notify.Send();
    end;

    // internal procedure GetLineToFactbox(DocNo: code[10]; ItemNo: Code[10]): Code[10]
    // var
    //     RecordLine: Record "Record Line";
    // begin
    //     RecordLine.Reset();
    //     RecordLine.SetRange("Item No.", ItemNo);
    //     RecordLine.SetRange("Doc No.", DocNo);

    //     if RecordLine.FindLast() then
    //         exit(RecordLine."Item No.");

    // end;

    procedure insertIntoLineLedgerEntry(Id: Code[10])
    var
        CusLed: Record "Cust. Ledger Entry";
        postedRecordHeader: Record "Posted Record Header";
        GLEntry: Record "G/L Entry";
    begin
        if Confirm('Do you want to post to Customer Ledger and General Ledger?', false) then begin
            Message('posting');
            postedRecordHeader.Reset();
            postedRecordHeader.SetRange("No.", Id);
            if postedRecordHeader.Findset() then
                repeat

                    CusLed.init();
                    if CusLed.FindLast() then
                        CusLed."Entry No." += 1
                    else
                        CusLed."Entry No." := 1;
                    CusLed."Document No." := postedRecordHeader."No.";
                    CusLed."Posting Date" := postedRecordHeader."Posting Date";
                    CusLed."Customer No." := postedRecordHeader."Vendor Name";
                    CusLed.Insert();
                    GLEntry.SetRange("Bal. Account No.", CusLed."Bal. Account No.");
                    if GLEntry.FindLast() then
                        GLEntry."Entry No." += 1
                    else
                        GLEntry."Entry No." := 1;
                    GLEntry.RecordNumber := CusLed."Document No.";
                    GLEntry.Insert();
                // Message('Posted to customer ledger');
                until postedRecordHeader.Next() = 0;
            Message('posted');
        end
        else
            Message('Not Posted');
    end;

    //tax calculatioon
    procedure TaxCalculation(var "Amount After Tax": Decimal; Price: Decimal)
    begin
        "Amount After Tax" := (13 / 100) * Price + Price;
    end;

    procedure TotalCalculation(Quantity: Integer; UnitPrice: Decimal; var TotalPrice: Decimal)
    begin
        TotalPrice := Quantity * UnitPrice;
    end;



    //Manually transmitting Record Line to Posted Record Line
    procedure insertRecordLineToPostedRecordLine(Id: Code[10])
    var
        LineLedger: Record "Line Ledger";
        postedRecordHeader: Record "Posted Record Header";
        postedRecordLine: Record "Posted Record Line";
        RecordLine: Record "Record Line";
        RecordHeader: Record "Record Header";
        user: code[20];
    begin
        if not CheckIfUserCanPostBill() then
            Error('Access Denied');
        RecordHeader.Reset();
        RecordHeader.SetRange("No.", Id);
        if RecordHeader.FindFirst() then begin
            RecordLine.Reset();
            RecordLine.SetRange("Doc No.", RecordHeader."No.");
            if RecordLine.FindSet() then
                repeat
                    LineLedger.Init();
                    if LineLedger.FindLast() then
                        LineLedger."Entry No." += 1
                    else
                        LineLedger."Entry No." := 1;
                    LineLedger."Doc No." := RecordLine."Doc No.";
                    LineLedger."Item No." := RecordLine."Item No.";
                    LineLedger.Description := RecordLine.Description;
                    LineLedger.Quantity := RecordLine.Quantity;
                    LineLedger."Total Amount" := RecordLine."Amount After Tax";
                    getUserFromRecHeader(RecordHeader."No.", user); //get the user name from the header
                    LineLedger.User := user;
                    LineLedger.Insert();
                    Message('success');
                until RecordLine.Next() = 0
            else
                Message('sorry');
            postedRecordHeader.DeleteAll();
            Message('inserted to line ledger');
        end;
    end;


    local procedure getUserFromRecHeader("No.": code[20]; var user: code[20])
    var
        RecordHeader: Record "Record Header";
    begin
        RecordHeader.Reset();
        RecordHeader.SetRange("No.", "No.");
        if RecordHeader.FindFirst() then
            user := RecordHeader.UserId;
    end;


    //insert Header to posted header(transferfields)
    procedure inserttoPostedheader(Id: code[10])
    var
        postedRecordHeader: Record "Posted Record Header";
        postedRecordLine: Record "Posted Record Line";
        RecordLine: Record "Record Line";
        RecordHeader: Record "Record Header";

    begin
        // if not CheckIfUserCanPostBill() then
        //     Error('Access Denied');
        if RecordHeader.get(Id) then begin
            postedRecordHeader.Init();
            postedRecordHeader.TransferFields(RecordHeader);
            postedRecordHeader.Insert();
            RecordLine.Reset();
            RecordLine.SetRange("Doc No.", RecordHeader."No.");
            if RecordLine.FindSet() then
                repeat
                    postedRecordLine.Init();
                    postedRecordLine.TransferFields(RecordLine);
                    postedRecordLine.Insert();
                until RecordLine.Next() = 0;
            Message('success')
        end
        else
            Message('sorry');
        RecordLine.DeleteAll();
        RecordHeader.Delete();
    end;

    procedure CheckIfUserCanPostBill(): Boolean
    var
        UserSetup: Record "User setup";
        RecHeader: Record "Record Header";
    begin
        UserSetup.Get(UserId);
        if UserSetup."Allow Bill Post" then
            exit(true)
        else
            exit(false);
    end;

}
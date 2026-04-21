namespace GetUse.Academy.Bookstore.Demo.This;

codeunit 50101 "This-Demo"
{
    trigger OnRun()
    begin
        SetStateVar('Level 1');
        Message('In ursprünglicher CU: %1', GetStateVar());
        CallThisProcedure(this);
        Message('In ursprünglicher CU: %1', GetStateVar());
        BSBThisDemoClient.ThisClientProcedure(this);
        Message('In ursprünglicher CU: %1', GetStateVar());
    end;

    var
        BSBThisDemoClient: Codeunit "This-Demo Client";
        StateVar: Text;

    procedure SetStateVar(StateVar: Text)
    begin
        this.StateVar := StateVar;
    end;

    procedure GetStateVar(): Text
    begin
        exit(StateVar);
    end;

    local procedure CallThisProcedure(ThisDemoCodeunit: Codeunit "This-Demo")
    begin
        Message('In Referenz-CU: %1', ThisDemoCodeunit.GetStateVar());
        ThisDemoCodeunit.SetStateVar('Level 2');
        Message('In Referenz-CU: %1', ThisDemoCodeunit.GetStateVar());
    end;
}
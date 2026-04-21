namespace GetUse.Academy.Bookstore.InterfaceList;
using System.Reflection;

codeunit 50106 "Check Pipeline"
{
    procedure ProcessPipeline(Variant: Variant)
    var
        DataTypeManagement: Codeunit "Data Type Management";
        RecRef: RecordRef;
    begin
        if not DataTypeManagement.GetRecordRef(Variant, RecRef) then
            exit;

        ProcessPipeline(RecRef);
    end;

    procedure ProcessPipeline(RecRef: RecordRef)
    var
        Steps: List of [Interface "Check Step"];
        Step: Interface "Check Step";
        ResultTxt: Text;
        TxtBuilder: TextBuilder;
    begin
        CollectSteps(Steps, RecRef);
        SortSteps(Steps);

        foreach Step in Steps do
            if Step.IsEnabled(RecRef) then begin
                ResultTxt := Step.Execute(RecRef);
                if ResultTxt <> '' then
                    TxtBuilder.AppendLine(ResultTxt);
            end;
        Message(TxtBuilder.ToText());
    end;

    local procedure CollectSteps(Steps: List of [Interface GetUse.Academy.Bookstore.InterfaceList."Check Step"]; RecRef: RecordRef)
    begin
    end;

    local procedure SortSteps(Steps: List of [Interface GetUse.Academy.Bookstore.InterfaceList."Check Step"])
    begin
    end;
}
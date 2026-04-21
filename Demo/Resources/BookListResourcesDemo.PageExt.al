namespace GetUse.Academy.Bookstore.Demo.Resources;
using GetUse.Academy.Bookstore;
using Microsoft.Sales.Document;
using Microsoft.Sales.Customer;

pageextension 50103 "Book List Resources Demo" extends "Book List"
{
    actions
    {
        addlast(Demo)
        {
            action(ListReources)
            {
                Caption = 'List Resources';
                ApplicationArea = All;
                Image = Process;
                ToolTip = 'Executes the List Resources action.';
                trigger OnAction()
                var
                    ResourceList: List of [Text];
                    Txt: Text;
                    TxtBuilder: TextBuilder;
                begin
                    ResourceList := NavApp.ListResources();
                    foreach Txt in ResourceList do
                        TxtBuilder.AppendLine(Txt);
                    Message(TxtBuilder.ToText());
                end;
            }
            action(ReadCSV)
            {
                Caption = 'Read CSV';
                ApplicationArea = All;
                Image = Process;
                ToolTip = 'Executes the Read CSV action.';

                trigger OnAction()
                var
                    ResourceStr: InStream;
                    Txt: Text;
                    TxtBuilder: TextBuilder;
                begin
                    NavApp.GetResource('ProgrammingLanguages.csv', ResourceStr);
                    while not ResourceStr.EOS do begin
                        ResourceStr.ReadText(Txt);
                        TxtBuilder.AppendLine(Txt)
                    end;
                    Message(TxtBuilder.ToText());
                end;
            }
            action(ReadPNG)
            {
                Caption = 'Read PNG';
                ApplicationArea = All;
                Image = Process;
                ToolTip = 'Executes the Read PNG action.';
                trigger OnAction()
                var
                    Customer: Record Customer;
                    ResourceStr: InStream;
                begin
                    NavApp.GetResource('Dynamics_365_Business_Central_logo.png', ResourceStr);

                    Customer.Init();
                    Customer."No." := '';
                    Customer.Insert(true);
                    Customer.Image.ImportStream(ResourceStr, 'Demo Picture');
                    Customer.Modify();
                    Page.Run(Page::"Customer Card", Customer);
                end;
            }
        }
    }
}
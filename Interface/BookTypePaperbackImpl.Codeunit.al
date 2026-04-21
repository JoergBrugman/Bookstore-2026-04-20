namespace GetUse.Academy.Bookstore.Interface;

codeunit 50104 "Book Type Paperback Impl." implements "Book Type Process V2"
{
    procedure StartDeployBook()
    begin
        Message('Print on Demand');
    end;

    procedure StartDeliverBook()
    begin
        Message('Mit DPD Standard versenden');
    end;

    procedure CheckQuality()
    begin
        Message('Taschenbuch Qualität geprüft.');
    end;
}
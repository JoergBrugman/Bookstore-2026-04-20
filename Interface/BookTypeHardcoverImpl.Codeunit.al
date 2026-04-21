namespace GetUse.Academy.Bookstore.Interface;

codeunit 50103 "Book Type Hardcover Impl." implements "Book Type Process"
{
    procedure StartDeployBook()
    begin
        Message('Aus Lager entnommen');
    end;

    procedure StartDeliverBook()
    begin
        Message('Mit UPS PREMIUM versenden');
    end;
}
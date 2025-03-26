program CoinCounter;

uses crt, sysutils;

var
    i, totalCoins: integer;
    pennies, nickels, dimes, quarters, halfDollars, dollars: integer;
    totalAmount: real;
    coinValue: integer;

begin
    clrscr;
    
    { Initialize counters }
    totalCoins := 0;
    pennies := 0;
    nickels := 0;
    dimes := 0;
    quarters := 0;
    halfDollars := 0;
    dollars := 0;
    totalAmount := 0.0;
    
    if ParamCount = 0 then
    begin
        writeln('Usage: coin_counter <list of coin values separated by spaces> (end with 999)');
        halt;
    end;
    
    for i := 1 to ParamCount do
    begin
        coinValue := StrToIntDef(ParamStr(i), -1);
        
        if coinValue = 999 then
            break;
        
        case coinValue of
            1: begin
                pennies := pennies + 1;
                totalAmount := totalAmount + 0.01;
            end;
            5: begin
                nickels := nickels + 1;
                totalAmount := totalAmount + 0.05;
            end;
            10: begin
                dimes := dimes + 1;
                totalAmount := totalAmount + 0.10;
            end;
            25: begin
                quarters := quarters + 1;
                totalAmount := totalAmount + 0.25;
            end;
            50: begin
                halfDollars := halfDollars + 1;
                totalAmount := totalAmount + 0.50;
            end;
            100: begin
                dollars := dollars + 1;
                totalAmount := totalAmount + 1.00;
            end;
            else begin
                writeln('Ignoring invalid coin value: ', coinValue);
            end;
        end;
    end;
    
    totalCoins := pennies + nickels + dimes + quarters + halfDollars + dollars;
    
    { Display results }
    writeln('Total Coins: ', totalCoins);
    writeln('Total Amount: $', totalAmount:0:2);
    writeln('Pennies: ', pennies, ' (', pennies * 1, ' cents)');
    writeln('Nickels: ', nickels, ' (', nickels * 5, ' cents)');
    writeln('Dimes: ', dimes, ' (', dimes * 10, ' cents)');
    writeln('Quarters: ', quarters, ' (', quarters * 25, ' cents)');
    writeln('Half Dollars: ', halfDollars, ' (', halfDollars * 50, ' cents)');
    writeln('Dollars: ', dollars, ' ($', dollars, ')');
    
end.

program Fibonacci;
var
    a : qWord;
    b : qWord;
    c : qWord;
begin
    a := 0;
    WriteLn(a);
    b := 1;
    WriteLn(b);
    while true do
    begin
        c := a + b;
        if c < a then
            begin
                WriteLn('Overflowed!');
                break;
            end;
        WriteLn(c);
        a := b;
        b := c;
    end;
end.

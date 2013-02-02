// 17.08.2012 Fixed tour/round
// 09.01.2013 Done some english phrases, need english help
{$apptype console}
{$o-}
//uses Crt;

var
	name : array[1..25] of string;	
	sum : array[1..25] of longint;
	was : array[1..25] of boolean;
	a, b, n, i, j, min : longint;
	com : string;
	f : text;

procedure dump;
var
	f : text;
	i : longint;
begin
	assign(f, 'database.txt');
	rewrite(f);
	writeln(f, n);
	for i := 1 to n do begin
		writeln(f, sum[i], ' ', name[i]);
	end;
	close(f);
	writeln('done');
end;

procedure load;
var
	f : text;
	i : longint;
begin
	assign(f, 'database.txt');
	reset(f);
	readln(f, n);
	for i := 1 to n do begin
		readln(f, sum[i], name[i]);
	end;
	close(f);                                ;
end;

begin
//	clrscn;
	writeln('Program for intellectual games');
	writeln('Version 1.03');
	writeln('Authors: Pavel Krotkov & Demid Kucherenko'); 
	load;
	dump;
	
	
	while true do begin
		readln(com);
		
		if (com = 'help') then 
		begin
//			writeln('Available commands:');
//			writeln('reset - Обнуляет все данные, восстановить будет нельзя');
//		        writeln('load - Выполняется автоматически. Загружает из файла логов последние результаты.');
//			writeln('table - Выводит на экран текущую таблицу результатов');
//			writeln('result - Записывает результаты в файл result.txt');
//			writeln('tour - Предлагает ввести результаты последнего тура. Прибавляет введеным командам по одному баллу');
//			writeln('round - Тоже, что и tour');
//			writeln('count - Увеличивает количество команд (если хотите добавить команды)'); 
//			writeln('name - Предлагает ввести названия всем командам (n строк)');
//			writeln('exit - Выход');
			writeln('no help :(');
		end;	
	
		if (com = 'reset') then begin
			writeln('Please, write count!');
		        readln(n);
			for i := 1 to n do begin
				sum[i] := 0;
				name[i] := '';
			end;
			dump;
			continue;
		end;
  
        	if (com = 'load') then begin
        		load;
        		dump;
        		continue;
       		end;

		if (com = 'table') then begin
		    for i := 1 to n do
		    	was[i] := false;
		    for i := 1 to n do begin
		    	min := 0;
		    	for j := 1 to n do 
		    		if (not was[j]) and ((min = 0) or (sum[j] > sum[min])) then min := j;
		    	writeln(i, ' ', name[min], ' ', sum[min]);
		    	was[min] := true;
			end;
			dump;
			continue;
		end;
  
		if (com = 'result') then begin
		    assign(f, 'resut.txt');
		    rewrite(f);
		    for i := 1 to n do
		    	was[i] := false;
		    for i := 1 to n do begin
		    	min := 0;
		    	for j := 1 to n do 
		    		if (not was[j]) and ((min = 0) or (sum[j] > sum[min])) then min := j;
		    	writeln(f, i, ' ', name[min], ' ', sum[min]);
		    	was[min] := true;
			end;
			close(f);
			writeln('done');
			continue;
		end;
  
		if ((com = 'tour') or (com = 'round')) then begin
			while (not eoln) do begin
				read(a);
				if (a <= 0) or (a > n) then 
				begin
					writeln('Range check!');
				end else begin
					sum[a] := sum[a] + 1;
				end;
			end;
			readln;
			dump;
			continue;
		end;

		if (com = 'add') then 
		begin
			a := -1;
			b := -1;
			while (a <> 0) and (b <> 0) do
			begin
				read(a);
				if eoln then writeln('baga');
				readln(b);
				sum[a] := sum[a] + b;
			end;
			dump;
			continue;
		end;
  
		if (com = 'count') then begin
			readln(a);
			if (a > n) then
			begin	
				for i := n + 1 to a do
				begin
					sum[i] := 0;
					name[i] := '';
				end;
				n := a;
			end else 
			begin
				writeln('Now you decrease count of teams, we do not recommend to do it');
			end;
			dump;
			continue;
  		end;

		if (com = 'name') then begin
			for i := 1 to n do begin
				readln(name[i]);
  			end;
  			dump;
  			continue;
  		end;

  		if (com = 'exit') then
  			break;

  		writeln('illegal command! please write help or exit');
	end;
end.

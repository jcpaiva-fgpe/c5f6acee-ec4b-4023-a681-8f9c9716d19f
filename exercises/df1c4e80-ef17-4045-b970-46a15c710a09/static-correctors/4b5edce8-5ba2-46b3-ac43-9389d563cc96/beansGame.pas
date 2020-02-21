(**
 * @author Margarida Mamede
 *)


program beansGame;

var
   seq             : array of integer;
   seqLen, elem, i : integer;
   sum, scA, scB   : integer;


function scoreOfAlex( ) : integer;

var
   steps, left, right, i : integer;
   score                 : integer;
   minStep               : boolean;

begin
   steps := seqLen div 2;
   left := 0;
   right := seqLen - 1;
   score := 0;
   minStep := true;

   for i := 1 to steps do
      begin
         (* Alex selection *)
         if seq[left] > seq[right] then
            begin
               score := score + seq[left];
               left := left + 1
            end
         else 
            begin
               score := score + seq[right];
               right := right - 1
            end;

         (* Bela selection *)
         if minStep then
            begin
               if seq[left] < seq[right] then
                  left := left + 1
               else
                  right := right - 1
            end
         else 
            begin
               if seq[left] > seq[right] then
                  left := left + 1
               else
                  right := right - 1
            end;
         minStep := not minStep
      end;

   scoreOfAlex := score
end;


begin
   readln(seqLen);
   setlength(seq, seqLen);

   sum := 0;
   for i := 0 to seqLen - 1 do
      begin
         read(elem);
         seq[i] := elem;
         sum := sum + elem
      end;

   scA := scoreOfAlex();
   scB := sum - scA;

   if scA > scB then
      writeln('Alex ganha com ', scA, ' contra ', scB)
   else if scA < scB then
      writeln('Bela ganha com ', scB, ' contra ', scA)
   else
      writeln('Alex e Bela empatam a ', scA)
end.


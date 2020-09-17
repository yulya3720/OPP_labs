with Text_IO, Ada.Integer_Text_IO;
use Text_IO, Ada.Integer_Text_IO;
package body data is

   --Write number to console
   procedure NumberOut(a: in Integer) is
   begin
     Put(a);
     Put(" ");
   end NumberOut;

   --Write matrix to console
   procedure MatrOut (A: in Matrix) is
   begin
      for i in 1..n loop
         for j in 1..n loop
            Put(A(i)(j));
            Put(" ");
         end loop;
         Put_Line(" ");
      end loop;
   end MatrOut;

   --multiply 2 matrices
   function MultMatr(A, B: in Matrix) return Matrix is
      P: Matrix;
      S: Integer;
   begin
      for k in 1..n loop
         for i in 1..n loop
            s := 0;
            for j in 1..n loop
               S := S + A(k)(j)*B(j)(i);
               P(k)(i) := s;
            end loop;
         end loop;
      end loop;
      return P;
   end MultMatr;

   --multiply vector and matrix
   function VectorMatrMult(A: in Vector; B: in Matrix) return Vector is
      P: Vector;
      s: Integer;
   begin
      for i in 1..n loop
         s := 0;
         for j in 1..n loop
            S := s + A(i)*B(j)(i);
         end loop;
         P(i) := S;
      end loop;
      return P;
   end VectorMatrMult;

   --multiply matrix and integer
   function MatrNumMult(A: in Matrix; k: in Integer) return Matrix is
      P: Matrix;
   begin
      for i in 1..n loop
         for j in 1..n loop
            P(i)(j):=A(i)(j)*k;
         end loop;
      end loop;
      return P;
   end MatrNumMult;

   --Find max element in Matrix
   function MatrMax(A : in Matrix) return Integer is
      CurrentMax : Integer := A(1)(1);
   begin
      for i in 1..n loop
         for j in 1..n loop
            if A(i)(j) > CurrentMax then
                 CurrentMax := A(i)(j);
            end if;
         end loop;
      end loop;
      return CurrentMax;
   end MatrMax;

   --Find min element in Matrix
   function MatrMin(A : in Matrix) return Integer is
      CurrentMin : Integer := A(1)(1);
   begin
      for i in 1..n loop
         for j in 1..n loop
            if A(i)(j) < CurrentMin then
               CurrentMin := A(i)(j);
            end if;
         end loop;
      end loop;
      return CurrentMin;
   end MatrMin;
   
   --add 2 matrices
   function MatrAdd (MA,MB: in Matrix) return Matrix is
       M: Matrix;
   begin
      for i in 1..n loop
         for j in 1..n loop
            M(i)(j):=MA(i)(j)+MB(i)(j);
         end loop;
      end loop;
      return M;
   end MatrAdd;
   
   -- multiply 2 vectors
   function VectMult(A,B: in Vector) return Integer is
      s: Integer := 0;
   begin
      for i in 1..n loop
         s:=s+A(i)*B(i);
      end loop;
      return s;
   end VectMult;

   -- fill matrix with ones
   procedure MatrFilling1(A: out Matrix) is
   begin
      for i in 1..n loop
         for j in 1..n loop
            A(i)(j) := 1;
         end loop;
      end loop;
   end MatrFilling1;

   --Filling vector with ones
   procedure VectorFilling1 (A: out vector) is
   begin
      for i in 1..n loop
         A(i) := 1;
      end loop;
   end VectorFilling1;
   
   function Func1 (B, C: in Vector; MA, ME : in Matrix) return Matrix is
      a: Integer;
      MD: Matrix;
   begin
      a := VectMult(B, C);
      MD := MultMatr(MA, ME);
      MD := MatrNumMult(MD, a);
      return MD;
   end Func1;

   function Func2 (MF, MG, MH, ML: in Matrix) return Integer is
      max: Integer;
      MA: Matrix;
      MB: Matrix;
      MC: Matrix;
   begin
      MA := MultMatr(MH, ML);
      MB := MultMatr(MG, MA);
      MC := MatrAdd(MF, MB);
      max := MatrMax(MC);
      return max;
   end Func2;

   function Func3 (MO, MP, MS : in Matrix) return Integer is
      MA:Matrix;
      min: Integer;
   begin
      MA := MultMatr(MO, MP);
      MA := MatrAdd(MA, MS);
      min := MatrMin(MA);
      return min;
   end Func3;
end data;

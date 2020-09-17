generic
   n: Integer;
package data is

   ---Declaration of private types
   type Vector is private;
   type Matrix is private;

   --Write vector on screen
   procedure NumberOut(A: in Integer);

   --Write matrix on screen
   procedure MatrOut (A: in Matrix);

   --Calculation function 1
   function Func1 (B, C: in Vector; MA, ME : in Matrix) return Matrix;

   --Calculation function 2
   function Func2 (MF, MG, MH, ML: in Matrix) return Integer;

   --Calculation function 3
   function Func3 (MO, MP, MS : in Matrix) return Integer;

   --Filling matrix
   procedure MatrFilling1(A: out Matrix);

   --Filling vector with ones
   procedure VectorFilling1 (A: out vector);

   --Determination private types
   private
   type Vector is array (1..n) of Integer;
   type Matrix is array (1..n) of Vector;

end data;

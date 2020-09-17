----------------------------------------------------------
-- Лабораторна робота з ОПП №1, варіант:
-- F1: MD = (B*C)*(MA*ME)
-- F2: h = MAX(MF+MG*(MH*ML))
-- F3: s = MIN(MO*MP+MS)
-- Виконала: Лихацька Юлія Дмитрівна, ІВ-82
-- 17.09.2020
----------------------------------------------------------


with Data, Text_IO, Ada.Integer_Text_IO, System.Multiprocessors;
use Text_IO, Ada.Integer_Text_IO, System.Multiprocessors;

procedure Main is
   n: Integer := 6 ;
   package data1 is new data (n);
   use data1;

   procedure tasks is
      task T1 is
         pragma Priority(1);
         pragma Storage_Size(100000);
         pragma CPU(1);
      end;
      task body T1 is
         B, C: Vector;
         MA, ME: Matrix;
         f1: Matrix;
      begin
         Put_Line("T1 started");
         VectorFilling1(B);
         VectorFilling1(C);
         MatrFilling1(MA);
         MatrFilling1(ME);
         f1:=Func1(B, C, MA, ME);
         delay(0.5);

         if n < 7 then
            Put_Line("---F1: MD = (B*C)*(MA*ME)---");
            MatrOut(f1);
            New_Line;
         end if;

         Put_Line("T1 finished");
         New_Line;
         New_Line;

      end T1;

      task T2 is
         pragma Priority(3);
         pragma Storage_Size(100000);
         pragma CPU(2);
      end;
      task body T2 is
         MF, MG, MH, ML: Matrix;
         f2: Integer;
      begin
         Put_Line("T2 started");
         MatrFilling1(MF);
         MatrFilling1(MG);
         MatrFilling1(MH);
         MatrFilling1(ML);
         f2:=Func2(MF, MG, MH, ML);
         delay(1.0);

         if n < 7 then
            Put_Line("---F2: h = MAX(MF+MG*(MH*ML))---");
            NumberOut(f2);
            New_Line;
         end if;

         Put_Line("T2 finished");
         New_Line;
         New_Line;

      end T2;

      task T3 is
         pragma Priority(5);
         pragma Storage_Size(100000);
         pragma CPU(2);
      end;
      task body T3 is
         MO, MP, MS : Matrix;
         f3: Integer;
      begin
         Put_Line("T3 started");
         MatrFilling1(MO);
         MatrFilling1(MP);
         MatrFilling1(MS);
         f3:=Func3(MO, MP, MS);
         delay(1.5);

         if n < 7 then
            Put_Line("---F3: s = MIN(MO*MP+MS)---");
            NumberOut(f3);
            New_Line;
         end if;

         Put_Line("T3 finished");
         New_Line;
         New_Line;

      end T3;

   begin
      null;
   end tasks;

begin
   tasks;

end Main;

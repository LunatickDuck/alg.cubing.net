(* ::Package:: *)

(* ::Input:: *)
(*Cube[id_,layers_,name_,version_,notation_]:=("<Notation id=\""<>id<>"\" default=\"true\" layerCount=\""<>layers<>"\">\n    <Name>"<>name<>"</Name>\n    <Description>SiGN, "<>name<>", version "<>version<>"</Description>\n    <Author>Lucas Garron</Author>\n    <Date>2008-08-17</Date>\n    <Statement symbol=\"comment\">\n      <Token symbol=\"commentMultiLineBegin\">/*</Token>\n      <Token symbol=\"commentMultiLineEnd\">*/</Token>\n      <Token symbol=\"commentSingleLineBegin\">//</Token>\n    </Statement>\n    <Statement symbol=\"NOP\">\n      <Token symbol=\"NOP\">_ .</Token>\n    <Statement symbol=\"move\">\n    </Statement>\n"<>notation*)
(*<>"    </Statement>\n    <Statement symbol=\"grouping\">\n      <Token symbol=\"groupingBegin\">(</Token>\n      <Token symbol=\"groupingEnd\">)</Token>\n    </Statement>\n    <Statement syntax=\"suffix\" symbol=\"inversion\">\n      <Token symbol=\"invertor\">&apos; -</Token>\n    </Statement>\n      <Statement syntax=\"precircumfix\" symbol=\"conjugation\">\n      <Token symbol=\"conjugationBegin\">[</Token>\n      <Token symbol=\"conjugationEnd\">]</Token>\n      <Token symbol=\"conjugationDelim\">:</Token>\n    </Statement>\n    <Statement syntax=\"precircumfix\" symbol=\"commutation\">\n      <Token symbol=\"commutationBegin\">[</Token>\n      <Token symbol=\"commutationEnd\">]</Token>\n      <Token symbol=\"commutationDelim\">,</Token>\n    </Statement>\n    <Statement syntax=\"precircumfix\" symbol=\"permutation\">\n      <Token symbol=\"permR\">R</Token>\n      <Token symbol=\"permU\">U</Token>\n      <Token symbol=\"permF\">F</Token>\n      <Token symbol=\"permL\">L</Token>\n      <Token symbol=\"permD\">D</Token>\n      <Token symbol=\"permB\">B</Token>\n      <Token symbol=\"permPlus\">+</Token>\n      <Token symbol=\"permMinus\">-</Token>\n      <Token symbol=\"permPlusPlus\">++</Token>\n      <Token symbol=\"permBegin\">{{{</Token>\n      <Token symbol=\"permEnd\">}}}</Token>\n      <Token symbol=\"permDelim\">,</Token>\n    </Statement>\n    <Statement syntax=\"suffix\" symbol=\"repetition\"/>\n  </Notation>\n"*)
(*)*)


(* ::Input:: *)
(*nots=({*)
(* {"x", "y", "z", "x", "y", "z"},*)
(* {"X", "Y", "Z", "", "", ""},*)
(* {"r", "u", "f", "l", "d", "b"},*)
(* {"R", "U", "F", "L", "D", "B"},*)
(* {"m", "e", "s", "", "", ""},*)
(* {"M", "E", "S", "", "", ""}*)
(*});*)


(* ::Input:: *)
(*(ang[#]=1)&/@{"x","X","y","Y","r","u","f","R","U","F","s","S"};*)
(*(ang[#]=-1)&/@{"z","Z","l","d","b","L","D","B","m","e","M","E"};*)


(* ::Input:: *)
(*ListToString[l_,n_]:=StringDrop[StringJoin[","<>ToString[#]&/@(If[n>0,Reverse[n+1-#],#]&@l)],1]*)


(* ::Input:: *)
(*Non[move_,ln_,layers_,typ_]:=StringJoin@@Table[If[m==1,"      ",""]<>"<Token axis=\""<>nots[[1,n]]<>"\" layerList=\""<>ListToString[layers,Abs[ln]*(1-Quotient[n-1,3])]<>"\" angle=\""<>ToString[Sign[ln]m*(90-180*Quotient[n-1,3])*(Sign[typ]^((3n-n^2)/2))]<>"\">"<>StringReplace[StringReplace[move,#[[1]]->#[[n]]&/@nots],{" "->If[m==2,"2 "," "]}]<>If[m==2,"2",""]<>"</Token>"<>If[m==2,"\n"," "],{n,3*Abs[typ]},{m,2}]*)


(* ::Input:: *)
(*Non[move_,ln_,layers_]:=If[MemberQ[{"m","e","s","M","E","S"},StringTake[move,-1]],Non[move,ln,layers,-1],Non[move,ln,layers,If[MemberQ[{"x","y","z","X","Y","Z"},StringTake[move,-1]],1,2]]]*)


(* ::Input:: *)
(*version="0.3.3";*)
(*"<CubeMarkup version=\"6\">\n  "<>*)
(*Cube["sign2","2","2x2x2",version,StringJoin[Non["x",2,{1,2}],Non["R",2,{1}]  ]]<>*)
(**)
(*Cube["sign3","3","3x3x3",version,StringJoin[*)
(*Non["x",3,{1,2,3}],*)
(*Non["R",3,{1}],*)
(*StringJoin@Table[Non[ToString[n]<>"R",3,{n}],{n,2,3}],*)
(*Non["M",3,{2}],Non["r 2r",3,{1,2}]*)
(*]]<>*)
(**)
(*Cube["sign4","4","4x4x4",version,StringJoin[*)
(*Non["x",4,{1,2,3,4}],*)
(*Non["R",4,{1}],*)
(*StringJoin@Table[Non[ToString[n]<>"R",4,{n}],{n,2,4}],*)
(*StringJoin@Table[Non[ToString[n]<>"r",4,Range[n]],{n,3,3}],*)
(*(Table[Non[ToString[n]<>"-"<>ToString[m]<>"r",4,Range[n,m]],{n,2,2},{m,n+1,3}]//Flatten//StringJoin),*)
(*Non["m 2m",4,{2,3}],Non["r 2r",4,{1,2}]*)
(*]]<>*)
(**)
(*Cube["sign5","5","5x5x5",version,StringJoin[*)
(*Non["x",5,{1,2,3,4,5}],*)
(*Non["R",5,{1}],*)
(*StringJoin@Table[Non[ToString[n]<>"R",5,{n}],{n,2,5}],*)
(*StringJoin@Table[Non[ToString[n]<>"r",5,Range[n]],{n,3,4}],*)
(*(Table[Non[ToString[n]<>"-"<>ToString[m]<>"r",5,Range[n,m]],{n,2,3},{m,n+1,4}]//Flatten//StringJoin),*)
(*Non["m 3m",5,{2,3,4}],Non["M",5,{3}],Non["r 2r",5,{1,2}]*)
(*]]<>*)
(**)
(*Cube["sign6","6","6x6x6",version,StringJoin[*)
(*Non["x",6,{1,2,3,4,5,6}],*)
(*Non["R",6,{1}],*)
(*StringJoin@Table[Non[ToString[n]<>"R",6,{n}],{n,2,6}],*)
(*StringJoin@Table[Non[ToString[n]<>"r",6,Range[n]],{n,3,5}],*)
(*(Table[Non[ToString[n]<>"-"<>ToString[m]<>"r",6,Range[n,m]],{n,2,4},{m,n+1,5}]//Flatten//StringJoin),*)
(*Non["m 4m",6,{2,3,4,5}],Non["2m",6,{3,4}],Non["r 2r",6,{1,2}]*)
(*]]<>*)
(**)
(*Cube["sign7","7","7x7x7",version,StringJoin[*)
(*(Table[Non[ToString[n]<>"-"<>ToString[m]<>"r",7,Range[n,m]],{n,2,5},{m,n+1,6}]//Flatten//StringJoin),*)
(*StringJoin@Table[Non[ToString[n]<>"R",7,{n}],{n,2,6}],*)
(*StringJoin@Table[Non[ToString[n]<>"r",7,Range[n]],{n,3,6}],*)
(*Non["m 5m",7,{2,3,4,5,6}],Non["M",7,{4}],Non["3m",7,{3,4,5}],*)
(*Non["x",7,{1,2,3,4,5,6,7}],*)
(*Non["R",7,{1}],Non["r 2r",7,{1,2}]*)
(*]]<>*)
(**)
(*"</CubeMarkup>";*)


(* ::Input:: *)
(*Export["sign.xml",%,"text"];*)
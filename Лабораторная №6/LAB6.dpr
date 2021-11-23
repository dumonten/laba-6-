program LAB6;

{$APPTYPE CONSOLE}

uses
  SysUtils;
const
  N = 8;
  L = 4*N;
type
  TGraph = array[1..N, 1..N] of integer;
  TArray = array [1..L] of integer;
var
  graph: TGraph;
  i, j, k, theMaxSize, choice, small, global, libNUM:integer;
  maxClique, globalList, smallList, librar: TArray;
const
  G: TGraph = (
(0, 1, 1, 1, 0, 1, 1, 0),
(1, 0, 1, 1, 0, 0, 0, 0),
(1, 1, 0, 1, 1, 1, 1, 1),
(1, 1, 1, 0, 1, 0, 0, 0),
(0, 0, 1, 1, 0, 1, 0, 1),
(1, 0, 1, 0, 1, 0, 1, 1),
(1, 0, 1, 0, 0, 1, 0, 0),
(0, 0, 1, 0, 1, 1, 0, 0));
   {G: TGraph = (
(0, 1, 0, 1, 0, 0, 0, 0, 0, 0),
(1, 0, 0, 1, 1, 0, 0, 0, 0, 0),
(0, 0, 0, 0, 1, 1, 0, 0, 1, 0),
(1, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(0, 1, 1, 0, 0, 1, 1, 0, 0, 0),
(0, 0, 1, 0, 1, 0, 1, 1, 1, 0),
(0, 0, 0, 0, 1, 1, 0, 0, 0, 0),
(0, 0, 0, 0, 0, 1, 0, 0, 0, 0),
(0, 0, 1, 0, 0, 1, 0, 0, 0, 0),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)); }
  {G: TGraph = (
(0, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(1, 0, 1, 1, 1, 1, 1, 1, 1, 1),
(1, 1, 0, 1, 1, 1, 1, 1, 1, 1),
(1, 1, 1, 0, 1, 1, 1, 1, 1, 1),
(1, 1, 1, 1, 0, 1, 1, 1, 1, 1),
(1, 1, 1, 1, 1, 0, 1, 1, 1, 1),
(1, 1, 1, 1, 1, 1, 0, 1, 1, 1),
(1, 1, 1, 1, 1, 1, 1, 0, 1, 1),
(1, 1, 1, 1, 1, 1, 1, 1, 0, 1),
(1, 1, 1, 1, 1, 1, 1, 1, 1, 0));
   {G: TGraph=(
(0, 1, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1),
(1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0),
(1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1),
(0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0),
(1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1),
(0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1),
(0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0),
(1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0),
(1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1),
(0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1),
(1, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 1),
(1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0)); {
    G: TGraph=(
(0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0),
(0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(0, 0, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1),
(0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1),
(0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1),
(0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0),
(0, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0),
(0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0));
////////////////////////////////////////////////////////////////////////////////
{Процедура вывода матрицы смежности: }
procedure OutPut (var graph: TGraph);
var
  i,j: integer;
begin
  for i:=1 to N do
    begin
      for j:=1 to N do
        write (graph[i,j]:3);
        writeln;
    end;
end;
{Функция нахождения размера: }
function FindSize (var mass: TArray):integer;
var
  i: integer;
begin
	i := L;
	while (mass[i]=0) and (i>0) do i := i-1;
	result := i;
end;
{Функция проверки смежности двух вершин: }
function AreAdjacent (var node1, node2: integer):boolean;
begin
	if graph[node1][node2] = 1 then result:=true
	else result:= false;
end;
{Функция проверки смежности данной вершины со всеми вершинами из клики: }
function FormsALargerClique (var clique: TArray; node: integer):boolean;
var
  cliqueSize, count,i: integer;
  adjnct: boolean;
begin
	count := 0;
	cliqueSize:= FindSize (clique);
	for i:= 1 to cliqueSize do
		begin
		 	adjnct:= AreAdjacent (clique[i], node);
			if adjnct = true then count := count + 1;
		end;
	if count = cliqueSize then result := true
	else result := false;
end;
{Функция формирования списка потенциальных вершин: }
function MakePossibleAdd (var clique: TArray):TArray;
var
  possible : TArray;
	isInClique : boolean;
	k,i : integer;
begin
  for i:=1 to L do possible[i]:=0;
	k := 0;
	for i := 1 to N do
		begin
			isInClique := FormsALargerClique (clique, i);
			if isInClique = true then
				begin
					k := k+1;
					possible [k] := i;
				end;
		end;
	result := possible;
end;
{Функция нахождения элемента в массиве: }
function Search (var mass: TArray; key: integer):integer;
var
  i: integer;
begin
  result:= -1;
  for i:=1 to L do
    if mass [i] = key then result:= i;
end;
{Процедура удаления вершины: }
procedure Remove (var mass:TArray; element: integer);
var
	index, massSize, i: integer;
begin
  massSize:= findSize (mass);
	index:= search (mass, element);
	mass[index]:=0;
	for i:= index+1 to massSize do
		begin
      mass[i-1]:= mass[i];
      mass[i]:=0;
		end;
end;
{Процедура Фильтра: }
procedure Filter (var mass1, mass2: TArray);
var
  i,j, size1, size2: integer;
begin
  size1 := FindSize (mass1);
  size2 := FindSize  (mass2);
  for i:=1 to size2 do
    begin
       for j:=1 to size1 do
          begin
             if mass1[j] = mass2[i] then
                begin
                  remove (mass1,mass1[j]);
                  size1 := size1 - 1;
                end;
          end;
    end;
end;
{Процедура дальнейшего продвижения: }
function DeepSearch (var possibleAdd, clique: TArray):TArray;
var
    i, j, k, sizeOfPoss: integer;
    candidates: TArray;
    isInClique, notAllowed: boolean;
begin
  for i:=1 to L do candidates[i] := 0;
	k := 0;
  notAllowed := false;
  sizeOfPoss := FindSize (possibleAdd);
	for i := 1 to sizeOfPoss do
		begin
			isInClique := FormsALargerClique (clique, possibleAdd[i]);
      if (small>0) then
        begin
            for j:=1 to small do
              if possibleAdd[i] = smallList [j] then notAllowed:= true;
        end;
			if (isInClique = true) and (notAllowed = false) then
				begin
					k := k+1;
					candidates[k] := possibleAdd[i];
				end;
		end;
	result := candidates;
end;
{Функция нахождения максимальной клики: }
function FindMaxClique (var graph: TGraph):TArray;
var
  currentNode, sizeOfPossible, cliqueSize, bestSize, nodeToAdd, i, sizeDeep,nodeDeep, k, p: integer;
  clique, bestClique, possibleAdd, deepNodes: TArray;
begin
  {Обнуление входных данных: }
  bestSize := 0; 
  small := 0;
  global := 0;
  for i:=1 to L do
    begin
      clique[i] := 0;
      bestClique[i] := 0;
      possibleAdd[i] := 0;
      deepNodes[i] := 0;
    end;
  {--------------------------}
  for i:=1 to N do
    begin
       currentNode := i;
       writeln;
       writeln ('CURRENT NODE IS ',currentNode);
       cliqueSize := 1;
       clique [cliqueSize] := currentNode;
       possibleAdd := MakePossibleAdd(clique);
       if global>0 then filter (possibleAdd, globalList);
       sizeOfPossible := FindSize (possibleAdd);
       while (sizeOfPossible > 0) do
              begin
                nodeToAdd :=  possibleAdd [1];
                cliqueSize := cliqueSize + 1;
                clique [cliqueSize] := nodeToAdd;
                writeln ('Check in with: ',  nodeToAdd);
                writeln ('Add: ', nodeToAdd);
                if cliqueSize >= bestSize then
                  begin
                    k:=0;
                    bestSize:= cliqueSize;
                    bestClique:= clique;
                    libNUM := FindSize (librar)+2;
                    for p:=libNUM to (bestSize+libNUM) do
                      begin
                        k:= k+1;
                        librar [p]:= bestClique[k];
                      end;
                  end;
                deepNodes := DeepSearch (possibleAdd, clique);
                sizeDeep := FindSize (deepNodes);
                while sizeDeep > 0 do
                  begin
                    nodeDeep :=  deepNodes [random(sizeDeep) + 1];
                    cliqueSize := cliqueSize + 1;
                    clique [cliqueSize] := nodeDeep;
                    writeln ('Add: ', nodeDeep);
                    if cliqueSize >= bestSize then
                      begin
                        k:=0;
                        bestSize:= cliqueSize;
                        bestClique:= clique;
                        libNUM := FindSize (librar)+2;
                        for p:=libNUM to (bestSize+libNUM) do
                          begin
                            k:= k+1;
                            librar [p]:= bestClique[k];
                          end;
                      end;
                    deepNodes := DeepSearch (possibleAdd, clique);
                    sizeDeep := FindSize (deepNodes);
                  end;
                small := small + 1;
                smallList[small] := nodeToAdd;
                Remove (possibleAdd,nodeToAdd);
                sizeOfPossible:= sizeOfPossible - 1;
                for k:=2 to L do clique[k] := 0;
                cliqueSize := 1;
              end;
       global := global + 1;
       globalList [global] := currentNode;
       small := global;
       smallList := globalList;
    end;
  result:= bestClique;
end;

{==============Главная программа==============}
begin
  randomize;
  writeln ('To randomly fill in the adjacency matrix, enter 1. To use an existing matrix, enter 0');
  readln (choice);
  if choice=1 then
    begin
      for i := 1 to N do
        for j:=1 to (N div 2) do
          begin
            graph[i,j] := random (2);
            graph[j,i] := graph[i,j];
          end;
     for i:=1 to N do graph[i,i]:=0;
    end
  else graph := G;
  writeln ('Adjacency matrix:');
  OutPut (graph);
  writeln;
  writeln ('Process...');
  maxClique := FindMaxClique (graph);
  writeln;
  writeln ('The process is over!');
  theMaxSize := FindSize (maxClique);
  writeln;
  if theMaxSize = 0 then writeln ('All nodes of this graph are isolated')
  else
    begin
      write ('The size of a maximum clique is: ');
      write (theMaxSize);
      writeln;
      for i:=1 to theMaxSize do write (maxClique[i]:4);
    end;
  writeln;
  i:=1;
  k:= 1;
  while i<=libNUM do
    begin
      i:=i+1;
      if ((i-k-1)=theMaxSize) then
        begin
          writeln ('Another click of the same size: ');
          for j:= k+1 to (i-1) do write (librar[j]:4);
          writeln;
        end;
      if (librar [i] = 0) then k:=i;
    end;
  readln;
end.

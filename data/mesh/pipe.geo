// Gmsh project created on Mon Aug 28 11:22:32 2017
//+
r = DefineNumber[ 0.8, Name "Parameters/r" ];
//+
R = DefineNumber[ 1, Name "Parameters/R" ];
//+
L = DefineNumber[ 1, Name "Parameters/L" ];
//+
lc = DefineNumber[ 0.2, Name "Parameters/lc" ];
//+
Point(1) = {0, 0, 0, lc};
//+
Point(2) = {r, 0, 0, lc};
//+
Point(3) = {0, r, 0, lc};
//+
Point(4) = {-r, 0, 0, lc};
//+
Point(5) = {0, -r, 0, lc};


//+
Point(6) = {R, 0, 0, lc};
//+
Point(7) = {0, R, 0, lc};
//+
Point(8) = {-R, 0, 0, lc};
//+
Point(9) = {0, -R, 0, lc};

//+
Circle(1) = {2, 1, 3};
//+
Circle(2) = {3, 1, 4};
//+
Circle(3) = {4, 1, 5};
//+
Circle(4) = {5, 1, 2};
//+
Circle(5) = {6, 1, 7};
//+
Circle(6) = {7, 1, 8};
//+
Circle(7) = {8, 1, 9};
//+
Circle(8) = {9, 1, 6};

//+
Line Loop(9) = {1, 2, 3, 4};
//+
Line Loop(10) = {5, 6, 7, 8};
//+
Plane Surface(11) = {9, 10};
//+
Extrude {0, 0, L} {
  Surface{11};
}


Physical Surface("fixedwall", 6) = {53,11};

//+
Physical Surface("innerWall", 3) = {32, 28, 24, 36};

Surface Loop(54) = {11, 24, 28, 32, 36, 53, 40, 44, 48, 52};
//+
Volume(55) = {54};

//+
Line Loop(56) = {13, 14, 15, 16};
//+
Plane Surface(57) = {56};
//+
Plane Surface(58) = {9};
//+
Surface Loop(59) = {58, 32, 36, 24, 28, 57};
//+
Volume(60) = {59};
//+
Physical Surface("inletfluid",4) = {58};
//+
Physical Surface("outletfluid",5) = {57};

//+
Physical Volume("blood",3) = {60};

//+
Physical Volume("vessel",1) = {1};

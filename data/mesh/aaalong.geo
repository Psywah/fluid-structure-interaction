// Gmsh project created on Wed Jun  8 22:54:44 2016
lc0 =1;
lc1 = 3;

width_vessel =	2;
diameter_vessel = 20;
bd_layer =5;
length = 80;

Point(1) = {0,	80, 0,  lc0};
Point(2) = {0,	79, 0,  lc0};
Point(3) = {0, 70, 0, lc0};
Point(4) = {-10, 52, 0, lc0};
Point(5) = {0, 30, 0, lc0};
Point(6) = {0, 10, 0, lc0};
Point(7) = {0, 0, 0, lc0};

Point(8) = {bd_layer,	80, 0,  lc1};
Point(9) = {bd_layer,	79, 0,  lc1};
Point(10) = {bd_layer, 70, 0, lc1};
Point(11) = {bd_layer-10, 52, 0, lc1};
Point(12) = {bd_layer, 30, 0, lc1};
Point(13) = {bd_layer, 10, 0, lc1};
Point(14) = {bd_layer, 0, 0, lc1};




//BSpline(1) = {1, 2, 3, 4, 5, 6, 7};
Spline(1) = {1, 2, 3, 4, 5, 6, 7};
Spline(2) = {8, 9, 10, 11, 12, 13, 14};

Translate {-width_vessel/2, 0, 0} {
  Duplicata { Line{1}; }
}
Translate {-width_vessel, 0, 0} {
  Duplicata { Line{1}; }
}



Point(31) = {diameter_vessel,	80, 0,  lc0};
Point(32) = {diameter_vessel, 79, 0, lc0};
Point(33) = {diameter_vessel, 70, 0, lc0};
Point(34) = {diameter_vessel+10, 48, 0, lc0};
Point(35) = {diameter_vessel, 30, 0, lc0};
Point(36) = {diameter_vessel, 10, 0, lc0};
Point(37) = {diameter_vessel, 0, 0, lc0};

Point(38) = {diameter_vessel-bd_layer,	80, 0,  lc1};
Point(39) = {diameter_vessel-bd_layer, 79, 0, lc1};
Point(40) = {diameter_vessel-bd_layer, 70, 0, lc1};
Point(41) = {diameter_vessel+10-bd_layer, 48, 0, lc1};
Point(42) = {diameter_vessel-bd_layer, 30, 0, lc1};
Point(43) = {diameter_vessel-bd_layer, 10, 0, lc1};
Point(44) = {diameter_vessel-bd_layer, 0, 0, lc1};



Spline(5) = {31,32,33,34,35,36,37};
Spline(6) = {38,39,40,41,42,43,44};

Translate {width_vessel/2, 0, 0} {
  Duplicata { Line{5}; }
}
Translate {width_vessel, 0, 0} {
  Duplicata { Line{5}; }
}







Line(9) = {22, 15};
Line(10) = {15, 1};
Line(11) = {1, 8};
Line(12) = {8, 38};
Line(13) = {38, 31};
Line(14) = {31, 45};
Line(15) = {45, 52};
Line(16) = {28, 21};
Line(17) = {21, 7};
Line(18) = {7, 14};
Line(19) = {14, 44};
Line(20) = {44, 37};
Line(21) = {37, 51};
Line(22) = {51, 58};
Line Loop(23) = {4, 16, -3, -9};
Plane Surface(24) = {23};
Line Loop(25) = {3, 17, -1, -10};
Plane Surface(26) = {25};
Line Loop(27) = {1, 18, -2, -11};
Plane Surface(28) = {27};
Line Loop(29) = {2, 19, -6, -12};
Plane Surface(30) = {29};
Line Loop(31) = {6, 20, -5, -13};
Plane Surface(32) = {31};
Line Loop(33) = {5, 21, -7, -14};
Plane Surface(34) = {33};
Line Loop(35) = {7, 22, -8, -15};
Plane Surface(36) = {35};


Physical Surface("blood", 3) = {28,30,32};
Physical Surface("media", 1) = {26,  34};
Physical Surface("advential", 2) = {24, 36};
Physical Line("gamma_s", 1) = {4, 8};
Physical Line("gamma_m", 2) = {3, 7};
Physical Line("gamma_i", 3) = {1, 5};
Physical Line("gamma_fi", 4) = {11,12,13};
Physical Line("gamma_fo", 5) = {18,19,20};
Physical Line("gamma_0", 6) = {9,10,14,15,16,17,21,22};



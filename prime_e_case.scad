// 


module sq_nut(size) {
	difference(){
		union(){
			//additions
			cube(size=[size,size,2], center=true);
		}

		union(){
			//subtractions
			cylinder(h=2.1, r=1.5, center=true, $fn=50);
		}
	}
}

module 10m_hx_screw() {
	difference(){
		union(){
			//additions
			//thread
			cylinder(h=10, r=1.5, center=true, $fn=50);
			//head
			translate([0,0,-10/2]) cylinder(h=3, r=2.5, center=true, $fn=50);
		}

		union(){
			//subtractions
		}
	}
}

module right_hand_side() {
	sizeX = 15;
	sizeY = 20;	//to change to fit keeb
	sizeZ = 20;	//to change to fit keeb
	difference(){
		union(){
			//additions
			color("Green") cube(size=[sizeX,sizeY,sizeZ], center=true);
		}

		union(){
			//subtractions
			//interlock cut out
			translate([0,-sizeY/2 + 10/2, -sizeZ/2 + 6/2]) cube(size=[sizeX, 10, 6], center=true);
			//space for nut
			translate([0,-sizeY/2 + (10)/2, -sizeZ/2 + 3.5 + 6])
			hull(){
				translate([-sizeX/2 + 4.8, 0, 0]) scale([1,1,1.1]) sq_nut(5.3);
				translate([sizeX/2 , 0, 0]) scale([1,1,1.1]) sq_nut(5.3);
			}

			translate([0,-sizeY/2 + 5, -sizeZ/2 + 3.5]) cylinder(h=10, r=1.8, center=true, $fn=50);
		}
	}
}

module left_hand_side() {
	sizeX = 15;
	sizeY = 20;	//to change to fit keeb
	sizeZ = 20;	//to change to fit keeb
	difference(){
		union(){
			//additions
			color("Blue") cube(size=[sizeX,sizeY,sizeZ], center=true);
		}

		union(){
			//subtractions
			//interlock cut out
			translate([0, sizeZ/2 - 10/2, 5.5]) cube(size=[sizeX, 10, sizeZ], center=true);
			//space for head
			translate([0,sizeY/2 - 5, -sizeZ/2 + 3.3/2]) cylinder(h=3.3, r=2.8, center=true, $fn=50);
			//space for thread
			translate([0,sizeY/2 - 5, -sizeZ/2 + 3]) cylinder(h=10, r=1.8, center=true, $fn=50);
			
		}
	}
}

// sq_nut();
// translate([0,0,0]) 10m_hx_screw();


// translate([0,15,10]) right_hand_side();
translate([0,-15,10])left_hand_side();






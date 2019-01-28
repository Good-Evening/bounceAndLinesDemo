int totalPoints = 25;
Point[] points = new Point[totalPoints];

void setup() {
  size(640, 360);
  for (int i = 0; i < totalPoints; i++) {
    points[i] = new Point(random(width), random(height), 5, i, points);
  }
  noStroke();
  fill(255);
}

void draw() {
  background(0);
  for (Point point : points) {
    point.move();
    point.display();
  }
  for (int i = 0; i < totalPoints; i++) {
    for (int j = i + 1; j < totalPoints; j++) {
      strokeWeight(0.1);
      stroke(255);
      line(points[i].x, points[i].y, points[j].x, points[j].y);
    }
  }
}

class Point {
  float x, y;
  float rad;
  int id;
  Point[] others;
  float xspeed = random (1, 7); // Speed of the shape
  float yspeed = random(1, 7);  // Speed of the shape

  int xdirection = 1;  // Left or Right
  int ydirection = 1;  // Top to Bottom

  Point(float xin, float yin, float din, int idin, Point[] oin) {
    x = xin;
    y = yin;
    rad = din;
    id = idin;
    others = oin;
  }

  void move() {
    x = x + ( xspeed * xdirection );
    y = y + ( yspeed * ydirection );

    if (x > width - rad || x < rad) {
      xdirection *= -1;
    }
    if (y > height - rad || y < rad) {
      ydirection *= -1;
    }
  }

  void display() {
    fill(255, 77, 166);
    ellipse(x, y, rad, rad);
  }
}

//  d.asy :
//
settings.outformat="pdf";
import graph;
size(8cm);
pen p=deepblue+0.4bp;
pen[] circPen={red,deepgreen,blue};
int np=12;
pair[] points;
real r() {return unitrand();}
pair circCenter(pair A,pair B,pair C,real eps=1e-8){
  pair O,P,Q;
  real d;
  P=A-B;
  Q=B-C;
  d=P.x*Q.y-P.y*Q.x;
  assert(abs(d)>eps,"Collinear points");
  O=( (B.y-C.y)*(A.x^2-B.x^2+A.y^2-B.y^2)+(B.y-A.y)*(B.x^2-C.x^2+B.y^2-C.y^2)
      ,
      (C.x-B.x)*(A.x^2-B.x^2+A.y^2-B.y^2)+(A.x-B.x)*(B.x^2-C.x^2+B.y^2-C.y^2)
    )/(2*d);
  return O;
}

srand(123);
for(int i=0; i < np; ++i) points.push((r(),r()));
int[][] trn=triangulate(points);
pair O, t[];
for(int i=0; i < trn.length; ++i) {
  t=points[trn[i]];
  O=circCenter(t[0],t[1],t[2]);
  draw(t[0]--t[1]--t[2]--cycle,p);
  //draw(Circle(O,abs(O-t[0])),circPen[i%circPen.length]+0.5bp+ opacity(0.8));
}
for(int i=0; i < np; ++i) dot(points[i],p+0.6bp,UnFill);
clip(box((0,0),(1,1)));
//
// To get d.pdf, run as:
//
// asy d.asy
//


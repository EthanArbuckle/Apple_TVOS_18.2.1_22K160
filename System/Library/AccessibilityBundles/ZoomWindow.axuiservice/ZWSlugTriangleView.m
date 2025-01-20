@interface ZWSlugTriangleView
- (CAShapeLayer)triangleLayer;
- (CGSize)intrinsicContentSize;
- (ZWSlugTriangleView)initWithTriangle:(unint64_t)a3;
- (unint64_t)triangle;
- (void)layoutSubviews;
- (void)setTriangle:(unint64_t)a3;
- (void)setTriangleLayer:(id)a3;
@end

@implementation ZWSlugTriangleView

- (ZWSlugTriangleView)initWithTriangle:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ZWSlugTriangleView;
  v4 = -[ZWSlugTriangleView initWithFrame:]( &v10,  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  v5 = v4;
  if (v4)
  {
    -[ZWSlugTriangleView setTriangle:](v4, "setTriangle:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](&OBJC_CLASS___CAShapeLayer, "layer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSlugTriangleView layer](v5, "layer"));
    [v7 addSublayer:v6];

    -[ZWSlugTriangleView setTriangleLayer:](v5, "setTriangleLayer:", v6);
    id v8 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    objc_msgSend(v6, "setFillColor:", objc_msgSend(v8, "CGColor"));
  }

  return v5;
}

- (CGSize)intrinsicContentSize
{
  if ((char *)-[ZWSlugTriangleView triangle](self, "triangle") == (char *)&dword_0 + 2)
  {
    double v3 = 7.0;
    double v4 = 15.0;
  }

  else
  {
    unint64_t v5 = -[ZWSlugTriangleView triangle](self, "triangle");
    double v4 = 15.0;
    if (v5) {
      double v3 = 15.0;
    }
    else {
      double v3 = 7.0;
    }
    if (v5) {
      double v4 = 7.0;
    }
  }

  result.height = v3;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___ZWSlugTriangleView;
  -[ZWSlugTriangleView layoutSubviews](&v21, "layoutSubviews");
  -[ZWSlugTriangleView bounds](self, "bounds");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSlugTriangleView triangleLayer](self, "triangleLayer"));
  objc_msgSend(v11, "setBounds:", v4, v6, v8, v10);

  v22.origin.x = v4;
  v22.origin.y = v6;
  v22.size.width = v8;
  v22.size.height = v10;
  double MidX = CGRectGetMidX(v22);
  v23.origin.x = v4;
  v23.origin.y = v6;
  v23.size.width = v8;
  v23.size.height = v10;
  double MidY = CGRectGetMidY(v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSlugTriangleView triangleLayer](self, "triangleLayer"));
  objc_msgSend(v14, "setPosition:", MidX, MidY);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](&OBJC_CLASS___UIBezierPath, "bezierPath"));
  switch(-[ZWSlugTriangleView triangle](self, "triangle"))
  {
    case 0uLL:
      objc_msgSend(v15, "moveToPoint:", 0.0, v10);
      double v16 = v8 * 0.5;
      double v17 = 0.0;
      goto LABEL_6;
    case 1uLL:
      objc_msgSend(v15, "moveToPoint:", 0.0, 0.0);
      objc_msgSend(v15, "addLineToPoint:", v8, v10 * 0.5);
      double v8 = 0.0;
      goto LABEL_7;
    case 2uLL:
      objc_msgSend(v15, "moveToPoint:", 0.0, 0.0);
      objc_msgSend(v15, "addLineToPoint:", v8 * 0.5, v10);
      double v10 = 0.0;
      goto LABEL_7;
    case 3uLL:
      objc_msgSend(v15, "moveToPoint:", v8, 0.0);
      double v17 = v10 * 0.5;
      double v16 = 0.0;
LABEL_6:
      objc_msgSend(v15, "addLineToPoint:", v16, v17);
LABEL_7:
      objc_msgSend(v15, "addLineToPoint:", v8, v10);
      [v15 closePath];
      break;
    default:
      break;
  }

  id v18 = v15;
  id v19 = [v18 CGPath];
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ZWSlugTriangleView triangleLayer](self, "triangleLayer"));
  [v20 setPath:v19];
}

- (CAShapeLayer)triangleLayer
{
  return self->_triangleLayer;
}

- (void)setTriangleLayer:(id)a3
{
}

- (unint64_t)triangle
{
  return self->_triangle;
}

- (void)setTriangle:(unint64_t)a3
{
  self->_triangle = a3;
}

- (void).cxx_destruct
{
}

@end
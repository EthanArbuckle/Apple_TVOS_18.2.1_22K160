@interface _UISecureControlDrawing
- (CGSize)drawingSize;
- (_UISecureControlDrawing)initWithDrawingPlan:(id)a3 cornerStyle:(int64_t)a4 cornerRadius:(double)a5 foregroundColor:(CGColor *)a6 backgroundColor:(CGColor *)a7 imagePlacement:(unint64_t)a8 leftToRight:(BOOL)a9 size:(CGSize)a10;
- (void)dealloc;
- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4;
@end

@implementation _UISecureControlDrawing

- (_UISecureControlDrawing)initWithDrawingPlan:(id)a3 cornerStyle:(int64_t)a4 cornerRadius:(double)a5 foregroundColor:(CGColor *)a6 backgroundColor:(CGColor *)a7 imagePlacement:(unint64_t)a8 leftToRight:(BOOL)a9 size:(CGSize)a10
{
  double height = a10.height;
  double width = a10.width;
  id v20 = a3;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS____UISecureControlDrawing;
  v21 = -[_UISecureControlDrawing init](&v33, "init");
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_drawingPlan, a3);
    v22->_foregroundColor = CGColorRetain(a6);
    double v23 = 0.5;
    double v24 = height * 0.5;
    switch(a4)
    {
      case 0LL:
        uint64_t v25 = kCTUIFontTextStyleShortBody;
        CTFontDescriptorGetTextStyleSize( kCTUIFontTextStyleShortBody,  [v20 contentSizeCategory],  0xFFFFFFFFLL,  0,  &v32);
        CTFontDescriptorGetTextStyleSize(v25, kCTFontContentSizeCategoryM, 0xFFFFFFFFLL, 0LL, &v31);
        [v20 displayScale];
        a5 = round(v26 * (v32 * a5 / v31)) / v26;
        break;
      case 1LL:
        double v23 = 0.25;
        goto LABEL_6;
      case 2LL:
        double v23 = 0.35;
        goto LABEL_6;
      case 3LL:
LABEL_6:
        a5 = v24 * v23;
        break;
      case 4LL:
        a5 = INFINITY;
        break;
      default:
        break;
    }

    v27 = objc_alloc(&OBJC_CLASS___UISPathDrawing);
    v34[0] = fmin(fmax(a5, 0.0), fmin(v24, width * 0.5));
    v34[1] = v34[0];
    v34[2] = v34[0];
    v34[3] = v34[0];
    v28 = -[UISPathDrawing initWithRoundedRectSize:cornerRadii:fillColor:]( v27,  "initWithRoundedRectSize:cornerRadii:fillColor:",  v34,  a7,  width,  height);
    backgroundDrawing = v22->_backgroundDrawing;
    v22->_backgroundDrawing = v28;

    v22->_imagePlacement = a8;
    v22->_leftToRight = a9;
    v22->_size.double width = width;
    v22->_size.double height = height;
  }

  return v22;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____UISecureControlDrawing;
  -[_UISecureControlDrawing dealloc](&v3, "dealloc");
}

- (CGSize)drawingSize
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  CGContextSaveGState(a3);
  -[UISPathDrawing drawInContext:atPoint:](self->_backgroundDrawing, "drawInContext:atPoint:", a3, x, y);
  CGContextRestoreGState(a3);
  -[_UISecureControlDrawingPlan alignmentSize](self->_drawingPlan, "alignmentSize");
  double v9 = v8;
  double v11 = v10;
  -[_UISecureControlDrawingPlan displayScale](self->_drawingPlan, "displayScale");
  double v13 = v12;
  double v14 = v9 * 0.5;
  double v15 = v11 * 0.5;
  id v31 = (id)objc_claimAutoreleasedReturnValue( -[_UISecureControlDrawingPlan glyphDrawingInColor:]( self->_drawingPlan,  "glyphDrawingInColor:",  self->_foregroundColor));
  v16 = (void *)objc_claimAutoreleasedReturnValue( -[_UISecureControlDrawingPlan textDrawingInColor:]( self->_drawingPlan,  "textDrawingInColor:",  self->_foregroundColor));
  if (v31)
  {
    CGContextSaveGState(a3);
    [v31 alignmentRect];
    unint64_t imagePlacement = self->_imagePlacement;
    if ((imagePlacement & 0xA) != 0)
    {
      double v22 = v14 - v19;
      if (self->_leftToRight != (imagePlacement == 8)) {
        double v22 = -v14;
      }
      double v23 = v20 * -0.5;
    }

    else
    {
      double v23 = v15 - v20;
      if (imagePlacement == 1) {
        double v23 = -v15;
      }
      double v22 = v19 * -0.5;
    }

    objc_msgSend( v31,  "drawInContext:atPoint:",  a3,  x + floor(v13 * (v22 + self->_size.width * 0.5 - v17)) / v13,  y + floor(v13 * (v23 + self->_size.height * 0.5 - v18)) / v13);
    CGContextRestoreGState(a3);
  }

  if (v16)
  {
    CGContextSaveGState(a3);
    [v16 alignmentRect];
    unint64_t v28 = self->_imagePlacement;
    if ((v28 & 0xA) != 0)
    {
      double v29 = v14 - v26;
      if (self->_leftToRight == (v28 == 8)) {
        double v29 = -v14;
      }
      double v30 = v27 * -0.5;
    }

    else
    {
      double v30 = v15 - v27;
      if (v28 != 1) {
        double v30 = -v15;
      }
      double v29 = v26 * -0.5;
    }

    objc_msgSend( v16,  "drawInContext:atPoint:",  a3,  x + floor(v13 * (v29 + self->_size.width * 0.5 - v24)) / v13,  y + floor(v13 * (v30 + self->_size.height * 0.5 - v25)) / v13);
    CGContextRestoreGState(a3);
  }
}

- (void).cxx_destruct
{
}

@end
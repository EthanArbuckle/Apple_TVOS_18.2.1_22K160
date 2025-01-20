@interface UIView
- (CGAffineTransform)transformToAbutToEdge:(SEL)a3 ofView:(unint64_t)a4;
- (double)xOriginForCenterOfSuperview;
- (double)yOriginForCenterOfSuperview;
@end

@implementation UIView

- (CGAffineTransform)transformToAbutToEdge:(SEL)a3 ofView:(unint64_t)a4
{
  id v8 = a5;
  __int128 v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v9;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  if (a4 == 8)
  {
    id v22 = v8;
    -[UIView frame](self, "frame");
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", 0LL);
    double v14 = v16;
    [v22 frame];
    double v18 = v17;
    [v22 frame];
    double v15 = v18 + v19;
    goto LABEL_5;
  }

  if (a4 == 2)
  {
    id v22 = v8;
    -[UIView frame](self, "frame");
    double v11 = v10;
    -[UIView frame](self, "frame");
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", 0LL, v11 + v12, 0.0);
    double v14 = v13;
    [v22 frame];
LABEL_5:
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", 0LL, v15, 0.0);
    *(float *)&double v20 = v20 - v14;
    CGAffineTransformMakeTranslation(retstr, roundf(*(float *)&v20), 0.0);
    id v8 = v22;
  }

  return result;
}

- (double)xOriginForCenterOfSuperview
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self, "superview"));
  [v3 bounds];
  double v5 = v4 * 0.5;
  -[UIView bounds](self, "bounds");
  float v7 = v5 - v6 * 0.5;
  double v8 = floorf(v7);

  return v8;
}

- (double)yOriginForCenterOfSuperview
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self, "superview"));
  [v3 bounds];
  double v5 = v4 * 0.5;
  -[UIView bounds](self, "bounds");
  float v7 = v5 - v6 * 0.5;
  double v8 = floorf(v7);

  return v8;
}

@end
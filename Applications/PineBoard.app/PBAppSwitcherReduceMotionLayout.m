@interface PBAppSwitcherReduceMotionLayout
- (PBAppSwitcherReduceMotionLayout)initWithWorkspaceGeometry:(id)a3;
- (double)screenHeight;
- (double)screenWidth;
- (id)_attributesForIndexPath:(id)a3 scrollProgress:(double)a4 swipeOffset:(double)a5 swipeIndex:(int64_t)a6 allowMask:(BOOL)a7;
@end

@implementation PBAppSwitcherReduceMotionLayout

- (PBAppSwitcherReduceMotionLayout)initWithWorkspaceGeometry:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBAppSwitcherReduceMotionLayout;
  v5 = -[PBAppSwitcherFocusLayout initWithWorkspaceGeometry:](&v9, "initWithWorkspaceGeometry:", v4);
  if (v5)
  {
    [v4 bounds];
    v5->_screenWidth = v6;
    [v4 bounds];
    v5->_screenHeight = v7;
  }

  return v5;
}

- (id)_attributesForIndexPath:(id)a3 scrollProgress:(double)a4 swipeOffset:(double)a5 swipeIndex:(int64_t)a6 allowMask:(BOOL)a7
{
  id v11 = a3;
  id v12 = [v11 item];
  id v13 = v12;
  double v14 = (double)(uint64_t)v12;
  double v15 = a4 - (double)(uint64_t)v12;
  double v16 = -a5 / self->_screenHeight;
  if (v16 > 1.0) {
    double v16 = 1.0;
  }
  else {
    uint64_t v17 = -1LL;
  }
  if (a6) {
    uint64_t v17 = (uint64_t)v12 < a6;
  }
  double v18 = -(v15 - fmax(v16, -1.0) * (double)v17);
  if (v18 < -2.0 || v18 < -1.0)
  {
    double v20 = -156.0;
  }

  else
  {
    double v21 = v18 - floor(v18);
    if (v18 >= 0.0)
    {
      if (v18 >= 1.0)
      {
        if (v18 >= 2.0) {
          double v20 = 2596.0;
        }
        else {
          double v20 = v21 * 1298.0 + 1298.0;
        }
      }

      else
      {
        double v20 = v21 * 1298.0 + 0.0;
      }
    }

    else
    {
      double v20 = fmax(v21 + -0.8798151, 0.0) * 1298.0 + -156.0;
    }
  }

  double v22 = v15 * 960.0 + v20;
  if (v12 != (id)a6) {
    a5 = 0.0;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherReduceMotionLayout collectionView](self, "collectionView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 traitCollection]);
  id v25 = [v24 userInterfaceStyle];

  v26 = (void *)objc_claimAutoreleasedReturnValue( +[PBAppSwitcherFocusLayoutAttributes layoutAttributesForCellWithIndexPath:]( &OBJC_CLASS___PBAppSwitcherFocusLayoutAttributes,  "layoutAttributesForCellWithIndexPath:",  v11));
  [v26 setContentOffset:v22];
  [v26 setContentScale:0.75];
  [v26 setSnapshotOffset:a5];
  [v26 setCornerRadius:20.0];
  objc_msgSend( v26,  "setBlurRect:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  [v26 setBlurRadius:0.0];
  [v26 setShadowAlpha:dbl_1002EC450[v25 == (id)2]];
  [v26 setShadowBlurRadius:dbl_1002EC460[v25 == (id)2]];
  [v26 setTextAlpha:1.0];
  [v26 setHeaderHidden:1];
  [v26 setContentHidden:0];
  [v26 setContentAlpha:1.0];
  [v26 setHidden:0];
  [v26 setAlpha:1.0];
  objc_msgSend(v26, "setSize:", 900.0, 900.0);
  objc_msgSend(v26, "setCenter:", v14 * 960.0 + 480.0, self->_screenHeight * 0.5);
  CATransform3DMakeTranslation(&v28, 0.0, 0.0, v14);
  [v26 setTransform3D:&v28];
  [v26 setZIndex:v13];
  return v26;
}

- (double)screenWidth
{
  return self->_screenWidth;
}

- (double)screenHeight
{
  return self->_screenHeight;
}

@end
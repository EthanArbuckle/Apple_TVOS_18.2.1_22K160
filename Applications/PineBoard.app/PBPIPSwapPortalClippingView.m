@interface PBPIPSwapPortalClippingView
- (CATransform3D)sublayerTransform;
- (PBPIPSwapPortalClippingView)initWithFrame:(CGRect)a3 sourceView:(id)a4;
- (PBPIPSwapPortalClippingView)initWithSourceView:(id)a3;
- (UIView)sourceView;
- (_UIPortalView)portalView;
- (void)setSourceView:(id)a3;
- (void)setSublayerTransform:(CATransform3D *)a3;
@end

@implementation PBPIPSwapPortalClippingView

- (PBPIPSwapPortalClippingView)initWithSourceView:(id)a3
{
  id v4 = a3;
  [v4 frame];
  v5 = -[PBPIPSwapPortalClippingView initWithFrame:sourceView:](self, "initWithFrame:sourceView:", v4);

  return v5;
}

- (PBPIPSwapPortalClippingView)initWithFrame:(CGRect)a3 sourceView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PBPIPSwapPortalClippingView;
  v10 = -[PBPIPSwapPortalClippingView initWithFrame:](&v16, "initWithFrame:", x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[PBPIPSwapPortalClippingView setClipsToBounds:](v10, "setClipsToBounds:", 1LL);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPSwapPortalClippingView layer](v11, "layer"));
    [v12 setCornerCurve:kCACornerCurveContinuous];

    v13 = -[_UIPortalView initWithFrame:]( objc_alloc(&OBJC_CLASS____UIPortalView),  "initWithFrame:",  CGPointZero.x,  CGPointZero.y,  width,  height);
    portalView = v11->_portalView;
    v11->_portalView = v13;

    -[PBPIPSwapPortalClippingView addSubview:](v11, "addSubview:", v11->_portalView);
    -[_UIPortalView setSourceView:](v11->_portalView, "setSourceView:", v9);
    -[_UIPortalView setHidesSourceView:](v11->_portalView, "setHidesSourceView:", 1LL);
  }

  return v11;
}

- (UIView)sourceView
{
  return (UIView *)(id)objc_claimAutoreleasedReturnValue(-[_UIPortalView sourceView](self->_portalView, "sourceView"));
}

- (void)setSourceView:(id)a3
{
}

- (CATransform3D)sublayerTransform
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPSwapPortalClippingView layer](self, "layer"));
  v5 = v4;
  if (v4)
  {
    [v4 sublayerTransform];
  }

  else
  {
    *(_OWORD *)&retstr->m41 = 0u;
    *(_OWORD *)&retstr->m43 = 0u;
    *(_OWORD *)&retstr->m31 = 0u;
    *(_OWORD *)&retstr->m33 = 0u;
    *(_OWORD *)&retstr->m21 = 0u;
    *(_OWORD *)&retstr->m23 = 0u;
    *(_OWORD *)&retstr->m11 = 0u;
    *(_OWORD *)&retstr->m13 = 0u;
  }

  return result;
}

- (void)setSublayerTransform:(CATransform3D *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPSwapPortalClippingView layer](self, "layer"));
  __int128 v5 = *(_OWORD *)&a3->m33;
  v9[4] = *(_OWORD *)&a3->m31;
  v9[5] = v5;
  __int128 v6 = *(_OWORD *)&a3->m43;
  v9[6] = *(_OWORD *)&a3->m41;
  v9[7] = v6;
  __int128 v7 = *(_OWORD *)&a3->m13;
  v9[0] = *(_OWORD *)&a3->m11;
  v9[1] = v7;
  __int128 v8 = *(_OWORD *)&a3->m23;
  v9[2] = *(_OWORD *)&a3->m21;
  v9[3] = v8;
  [v4 setSublayerTransform:v9];
}

- (_UIPortalView)portalView
{
  return self->_portalView;
}

- (void).cxx_destruct
{
}

@end
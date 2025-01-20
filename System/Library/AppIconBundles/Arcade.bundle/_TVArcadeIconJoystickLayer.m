@interface _TVArcadeIconJoystickLayer
- (CALayer)knobLayer;
- (CALayer)punchOutLayer;
- (_TVArcadeIconJoystickLayer)init;
- (void)_updateAnchorPoint:(CGPoint)a3 layer:(id)a4;
- (void)_updateArcadeAppImageLayerEffectValues;
- (void)_updateJoystickEffects;
- (void)_updateKnobEffects;
- (void)didChangeValueForKey:(id)a3;
- (void)layoutSublayers;
@end

@implementation _TVArcadeIconJoystickLayer

- (_TVArcadeIconJoystickLayer)init
{
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS____TVArcadeIconJoystickLayer;
  id v2 = -[_TVArcadeIconJoystickLayer init](&v27, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 traitCollection]);

    v5 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v2));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:compatibleWithTraitCollection:",  @"Base",  v6,  v4));
    [v2 setContentsGravity:kCAGravityResizeAspect];
    [v4 displayScale];
    objc_msgSend(v2, "setContentsScale:");
    id v8 = v7;
    objc_msgSend(v2, "setContents:", objc_msgSend(v8, "CGImage"));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:compatibleWithTraitCollection:",  @"PunchOut",  v6,  v4));
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[CALayer layer](&OBJC_CLASS___CALayer, "layer"));
    v11 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v10;

    [*((id *)v2 + 2) setContentsGravity:kCAGravityResizeAspect];
    v12 = (void *)*((void *)v2 + 2);
    [v4 displayScale];
    objc_msgSend(v12, "setContentsScale:");
    v13 = (void *)*((void *)v2 + 2);
    [v4 displayScale];
    objc_msgSend(v13, "setRasterizationScale:");
    v14 = (void *)*((void *)v2 + 2);
    id v15 = v9;
    objc_msgSend(v14, "setContents:", objc_msgSend(v15, "CGImage"));
    [*((id *)v2 + 2) setShouldRasterize:0];
    v16 = (void *)*((void *)v2 + 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterDestOut));
    [v16 setCompositingFilter:v17];

    v18 = (void *)*((void *)v2 + 2);
    [v2 bounds];
    objc_msgSend(v18, "setFrame:");
    [v2 addSublayer:*((void *)v2 + 2)];
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:compatibleWithTraitCollection:",  @"Knob",  v6,  v4));
    uint64_t v20 = objc_claimAutoreleasedReturnValue(+[CALayer layer](&OBJC_CLASS___CALayer, "layer"));
    v21 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v20;

    [*((id *)v2 + 1) setContentsGravity:kCAGravityResizeAspect];
    v22 = (void *)*((void *)v2 + 1);
    [v4 displayScale];
    objc_msgSend(v22, "setContentsScale:");
    v23 = (void *)*((void *)v2 + 1);
    id v24 = v19;
    objc_msgSend(v23, "setContents:", objc_msgSend(v24, "CGImage"));
    [*((id *)v2 + 1) setZPosition:1000.0];
    v25 = (void *)*((void *)v2 + 1);
    [v2 bounds];
    objc_msgSend(v25, "setFrame:");
    [v2 addSublayer:*((void *)v2 + 1)];
  }

  return (_TVArcadeIconJoystickLayer *)v2;
}

- (void)layoutSublayers
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS____TVArcadeIconJoystickLayer;
  -[_TVArcadeIconJoystickLayer layoutSublayers](&v12, "layoutSublayers");
  [self->super._attr.layer bounds];
  double v4 = v3;
  double v6 = v5;
  -[_TVArcadeIconJoystickLayer bounds](self, "bounds");
  if (v4 != v8 || v6 != v7)
  {
    layer = self->super._attr.layer;
    -[_TVArcadeIconJoystickLayer bounds](self, "bounds");
    objc_msgSend(layer, "setFrame:");
    v11 = *(void **)&self->super._attr.refcount;
    -[_TVArcadeIconJoystickLayer bounds](self, "bounds");
    objc_msgSend(v11, "setFrame:");
    -[_TVArcadeIconJoystickLayer _updateAnchorPoint:layer:]( self,  "_updateAnchorPoint:layer:",  self->super._attr.layer,  0.5,  0.575);
  }

- (void)didChangeValueForKey:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____TVArcadeIconJoystickLayer;
  id v4 = a3;
  -[_TVArcadeIconJoystickLayer didChangeValueForKey:](&v6, "didChangeValueForKey:", v4);
  unsigned int v5 = objc_msgSend(v4, "isEqualToString:", UINamedLayerFocusDirectionKey, v6.receiver, v6.super_class);

  if (v5) {
    -[_TVArcadeIconJoystickLayer _updateArcadeAppImageLayerEffectValues](self, "_updateArcadeAppImageLayerEffectValues");
  }
}

- (void)_updateArcadeAppImageLayerEffectValues
{
}

- (void)_updateJoystickEffects
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[_TVArcadeIconJoystickLayer valueForKey:](self, "valueForKey:", UINamedLayerFocusDirectionKey));
  id v4 = v3;
  if (v3)
  {
    [v3 CGPointValue];
    double x = v6;
  }

  else
  {
    double x = CGPointZero.x;
    double y = CGPointZero.y;
  }

  __int128 v18 = *(_OWORD *)&CATransform3DIdentity.m23;
  *(_OWORD *)&a.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
  __int128 v17 = *(_OWORD *)&a.m21;
  *(_OWORD *)&a.m23 = v18;
  *(_OWORD *)&a.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
  __int128 v16 = *(_OWORD *)&a.m31;
  CGFloat m33 = CATransform3DIdentity.m33;
  __int128 v15 = *(_OWORD *)&CATransform3DIdentity.m13;
  *(_OWORD *)&a.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
  __int128 v14 = *(_OWORD *)&a.m11;
  *(_OWORD *)&a.m13 = v15;
  a.CGFloat m33 = m33;
  a.CGFloat m34 = -0.01;
  __int128 v13 = *(_OWORD *)&CATransform3DIdentity.m43;
  *(_OWORD *)&a.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
  __int128 v12 = *(_OWORD *)&a.m41;
  *(_OWORD *)&a.m43 = v13;
  CATransform3DRotate(&v23, &a, y * -15.0 * 0.0174532925, 1.0, 0.0, 0.0);
  __int128 v28 = *(_OWORD *)&v23.m21;
  __int128 v29 = *(_OWORD *)&v23.m23;
  __int128 v30 = *(_OWORD *)&v23.m31;
  CGFloat v31 = v23.m33;
  __int128 v26 = *(_OWORD *)&v23.m11;
  __int128 v27 = *(_OWORD *)&v23.m13;
  CGFloat m34 = v23.m34;
  __int128 v24 = *(_OWORD *)&v23.m41;
  __int128 v25 = *(_OWORD *)&v23.m43;
  __int128 v10 = *(_OWORD *)&CATransform3DIdentity.m33;
  *(_OWORD *)&v23.m31 = v16;
  *(_OWORD *)&v23.CGFloat m33 = v10;
  *(_OWORD *)&v23.m41 = v12;
  *(_OWORD *)&v23.m43 = v13;
  *(_OWORD *)&v23.m11 = v14;
  *(_OWORD *)&v23.m13 = v15;
  *(_OWORD *)&v23.m21 = v17;
  *(_OWORD *)&v23.m23 = v18;
  *(_OWORD *)&a.m31 = v16;
  *(_OWORD *)&a.CGFloat m33 = v10;
  *(_OWORD *)&a.m41 = v12;
  *(_OWORD *)&a.m43 = v13;
  *(_OWORD *)&a.m11 = v14;
  *(_OWORD *)&a.m13 = v15;
  *(_OWORD *)&a.m21 = v17;
  *(_OWORD *)&a.m23 = v18;
  CATransform3DRotate(&v23, &a, x * 5.0 * 0.0174532925, 0.0, 0.0, 1.0);
  *(_OWORD *)&a.m21 = v28;
  *(_OWORD *)&a.m23 = v29;
  *(_OWORD *)&a.m31 = v30;
  a.CGFloat m33 = v31;
  *(_OWORD *)&a.m11 = v26;
  *(_OWORD *)&a.m13 = v27;
  a.CGFloat m34 = m34;
  *(_OWORD *)&a.m41 = v24;
  *(_OWORD *)&a.m43 = v25;
  CATransform3D b = v23;
  CATransform3DConcat(&v21, &a, &b);
  layer = self->super._attr.layer;
  CATransform3D v19 = v21;
  [layer setTransform:&v19];
}

- (void)_updateKnobEffects
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[_TVArcadeIconJoystickLayer valueForKey:](self, "valueForKey:", UINamedLayerFocusDirectionKey));
  id v4 = v3;
  if (v3)
  {
    [v3 CGPointValue];
  }

  else
  {
    double x = CGPointZero.x;
    double y = CGPointZero.y;
  }

  CGFloat v7 = y * 0.06 + 1.0;
  __int128 v8 = *(_OWORD *)&CATransform3DIdentity.m33;
  *(_OWORD *)&v15.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
  *(_OWORD *)&v15.CGFloat m33 = v8;
  __int128 v9 = *(_OWORD *)&CATransform3DIdentity.m43;
  *(_OWORD *)&v15.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
  *(_OWORD *)&v15.m43 = v9;
  __int128 v10 = *(_OWORD *)&CATransform3DIdentity.m13;
  *(_OWORD *)&v15.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
  *(_OWORD *)&v15.m13 = v10;
  __int128 v11 = *(_OWORD *)&CATransform3DIdentity.m23;
  *(_OWORD *)&v15.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
  *(_OWORD *)&v15.m23 = v11;
  *(_OWORD *)&v14.m31 = *(_OWORD *)&v15.m31;
  *(_OWORD *)&v14.CGFloat m33 = v8;
  *(_OWORD *)&v14.m41 = *(_OWORD *)&v15.m41;
  *(_OWORD *)&v14.m43 = v9;
  *(_OWORD *)&v14.m11 = *(_OWORD *)&v15.m11;
  *(_OWORD *)&v14.m13 = v10;
  *(_OWORD *)&v14.m21 = *(_OWORD *)&v15.m21;
  *(_OWORD *)&v14.m23 = v11;
  CATransform3DTranslate(&v15, &v14, x * 6.0, y + y, 0.0);
  CATransform3D v13 = v15;
  CATransform3DScale(&v14, &v13, v7, v7, 1.0);
  CATransform3D v15 = v14;
  CATransform3D v12 = v14;
  [*(id *)&self->super._attr.refcount setTransform:&v12];
}

- (void)_updateAnchorPoint:(CGPoint)a3 layer:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v21 = a4;
  -[_TVArcadeIconJoystickLayer bounds](self, "bounds");
  double v8 = x * v7;
  -[_TVArcadeIconJoystickLayer bounds](self, "bounds");
  double v10 = y * v9;
  -[_TVArcadeIconJoystickLayer bounds](self, "bounds");
  double v12 = v11;
  [v21 anchorPoint];
  double v14 = v12 * v13;
  -[_TVArcadeIconJoystickLayer bounds](self, "bounds");
  double v16 = v15;
  [v21 anchorPoint];
  double v18 = v16 * v17;
  [v21 position];
  objc_msgSend(v21, "setPosition:", v8 + v19 - v14, v10 + v20 - v18);
  objc_msgSend(v21, "setAnchorPoint:", x, y);
}

- (CALayer)knobLayer
{
  return *(CALayer **)&self->super._attr.refcount;
}

- (CALayer)punchOutLayer
{
  return (CALayer *)self->super._attr.layer;
}

- (void).cxx_destruct
{
}

@end
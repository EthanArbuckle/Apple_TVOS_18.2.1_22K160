@interface _TVWatchListIconLogoLayer
- ($1AB5FA073B851C12C2339EC22442E995)_colorValueForColor:(id)a3;
- (CAGradientLayer)gradientLayer;
- (_TVWatchListIconLogoLayer)init;
- (id)_tvAppGradientColorsForEdge:(unint64_t)a3;
- (void)_tvGetColorValuesForEdge:(unint64_t)a3 start:(id *)a4 end:(id *)a5;
- (void)_updateLogoImageLayerEffectValues;
- (void)didChangeValueForKey:(id)a3;
- (void)layoutSublayers;
@end

@implementation _TVWatchListIconLogoLayer

- (_TVWatchListIconLogoLayer)init
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS____TVWatchListIconLogoLayer;
  v2 = -[_TVWatchListIconLogoLayer init](&v24, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 traitCollection]);

    v5 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v2));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:compatibleWithTraitCollection:",  @"LogoMask",  v6,  v4));
    -[_TVWatchListIconLogoLayer setContentsGravity:](v2, "setContentsGravity:", kCAGravityResizeAspect);
    [v4 displayScale];
    -[_TVWatchListIconLogoLayer setContentsScale:](v2, "setContentsScale:");
    id v8 = v7;
    -[_TVWatchListIconLogoLayer setContents:](v2, "setContents:", [v8 CGImage]);
    -[_TVWatchListIconLogoLayer _tvGetColorValuesForEdge:start:end:]( v2,  "_tvGetColorValuesForEdge:start:end:",  0LL,  v23,  v22);
    v9 = objc_alloc(&OBJC_CLASS___UIColor);
    v10 = -[UIColor initWithRed:green:blue:alpha:](v9, "initWithRed:green:blue:alpha:", v23[0], v23[1], v23[2], 1.0);
    v11 = objc_alloc(&OBJC_CLASS___UIColor);
    v12 = -[UIColor initWithRed:green:blue:alpha:](v11, "initWithRed:green:blue:alpha:", v22[0], v22[1], v22[2], 1.0);
    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[CAGradientLayer layer](&OBJC_CLASS___CAGradientLayer, "layer"));
    v14 = *(void **)&v2->super._attr.refcount;
    *(void *)&v2->super._attr.refcount = v13;

    v15 = *(void **)&v2->super._attr.refcount;
    v16 = v10;
    v25[0] = -[UIColor CGColor](v16, "CGColor");
    v17 = v12;
    v25[1] = -[UIColor CGColor](v17, "CGColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 2LL));
    [v15 setColors:v18];

    v19 = *(void **)&v2->super._attr.refcount;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterSourceAtop));
    [v19 setCompositingFilter:v20];

    -[_TVWatchListIconLogoLayer addSublayer:](v2, "addSublayer:", *(void *)&v2->super._attr.refcount);
  }

  return v2;
}

- (void)layoutSublayers
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____TVWatchListIconLogoLayer;
  -[_TVWatchListIconLogoLayer layoutSublayers](&v9, "layoutSublayers");
  -[_TVWatchListIconLogoLayer bounds](self, "bounds");
  double x = v10.origin.x;
  double y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  double MidX = CGRectGetMidX(v10);
  v11.origin.double x = x;
  v11.origin.double y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  CGFloat v8 = CGRectGetMidY(v11) + -5.0;
  objc_msgSend(*(id *)&self->super._attr.refcount, "setBounds:", x, y, 178.0, 90.0);
  objc_msgSend(*(id *)&self->super._attr.refcount, "setPosition:", MidX + 0.0, v8);
}

- (void)didChangeValueForKey:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____TVWatchListIconLogoLayer;
  id v4 = a3;
  -[_TVWatchListIconLogoLayer didChangeValueForKey:](&v6, "didChangeValueForKey:", v4);
  unsigned int v5 = objc_msgSend(v4, "isEqualToString:", UINamedLayerFocusDirectionKey, v6.receiver, v6.super_class);

  if (v5) {
    -[_TVWatchListIconLogoLayer _updateLogoImageLayerEffectValues](self, "_updateLogoImageLayerEffectValues");
  }
}

- (void)_updateLogoImageLayerEffectValues
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_TVWatchListIconLogoLayer valueForKey:](self, "valueForKey:", UINamedLayerFocusDirectionKey));
  id v4 = v3;
  if (v3)
  {
    [v3 CGPointValue];
    double x = v5;
    double y = v7;
  }

  else
  {
    double x = CGPointZero.x;
    double y = CGPointZero.y;
  }

  double v9 = -x;
  if (x >= 0.0) {
    double v9 = x;
  }
  double v10 = -y;
  if (y >= 0.0) {
    double v10 = y;
  }
  double v11 = sqrt(v9 * v9 + v10 * v10);
  if (v11 <= 1.0) {
    double v12 = v11 * 4.0;
  }
  else {
    double v12 = 4.0;
  }
  if (v12 > 1.0) {
    double v12 = 1.0;
  }
  *(float *)&double v12 = v12;
  [*(id *)&self->super._attr.refcount setOpacity:v12];
  -[_TVWatchListIconLogoLayer _tvGetColorValuesForEdge:start:end:]( self,  "_tvGetColorValuesForEdge:start:end:",  0LL,  &v40,  &v37);
  if (x < 0.0 || y < 0.0)
  {
    if (x >= 0.0 || y < 0.0)
    {
      if (y >= 0.0 || x < 0.0) {
        uint64_t v14 = 2LL;
      }
      else {
        uint64_t v14 = 8LL;
      }
      uint64_t v13 = 1LL;
    }

    else
    {
      uint64_t v13 = 4LL;
      uint64_t v14 = 2LL;
    }
  }

  else
  {
    uint64_t v13 = 4LL;
    uint64_t v14 = 8LL;
  }

  -[_TVWatchListIconLogoLayer _tvGetColorValuesForEdge:start:end:]( self,  "_tvGetColorValuesForEdge:start:end:",  v14,  v36,  v34);
  -[_TVWatchListIconLogoLayer _tvGetColorValuesForEdge:start:end:]( self,  "_tvGetColorValuesForEdge:start:end:",  v13,  v35,  v33);
  double v16 = fabs(y);
  double v17 = 1.0;
  if (v16 > 1.0) {
    double v16 = 1.0;
  }
  double v18 = fabs(x);
  if (v18 <= 1.0) {
    double v17 = v18;
  }
  double v19 = sqrt(v17 * v17 + v16 * v16);
  double v20 = v16 / v19;
  if (v16 <= 2.22044605e-16) {
    double v20 = 0.0;
  }
  double v21 = v16 * v20;
  double v22 = v17 / v19;
  if (v17 <= 2.22044605e-16) {
    double v22 = 0.0;
  }
  double v23 = v17 * v22;
  double v24 = v37 + v21 * (v33[0] - v37) + (v34[0] - v37) * v23;
  double v25 = v38 + v21 * (v33[1] - v38) + (v34[1] - v38) * v23;
  double v26 = v39 + v21 * (v33[2] - v39) + (v34[2] - v39) * v23;
  v27 = -[UIColor initWithRed:green:blue:alpha:]( objc_alloc(&OBJC_CLASS___UIColor),  "initWithRed:green:blue:alpha:",  v40 + v21 * (v35[0] - v40) + (v36[0] - v40) * v23,  v41 + v21 * (v35[1] - v41) + (v36[1] - v41) * v23,  v42 + v21 * (v35[2] - v42) + (v36[2] - v42) * v23,  1.0);
  v28 = -[UIColor initWithRed:green:blue:alpha:]( objc_alloc(&OBJC_CLASS___UIColor),  "initWithRed:green:blue:alpha:",  v24,  v25,  v26,  1.0);
  [*(id *)&self->super._attr.refcount setStartPoint:v21 * 0.4 + 0.1 - v21 * 0.4];
  objc_msgSend(*(id *)&self->super._attr.refcount, "setEndPoint:", 0.9, 0.9);
  v29 = *(void **)&self->super._attr.refcount;
  v30 = v27;
  v43[0] = -[UIColor CGColor](v30, "CGColor");
  v31 = v28;
  v43[1] = -[UIColor CGColor](v31, "CGColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v43, 2LL));
  [v29 setColors:v32];
}

- (void)_tvGetColorValuesForEdge:(unint64_t)a3 start:(id *)a4 end:(id *)a5
{
  id v16 = (id)objc_claimAutoreleasedReturnValue(-[_TVWatchListIconLogoLayer _tvAppGradientColorsForEdge:](self, "_tvAppGradientColorsForEdge:", a3));
  CGFloat v8 = (void *)objc_claimAutoreleasedReturnValue([v16 firstObject]);
  -[_TVWatchListIconLogoLayer _colorValueForColor:](self, "_colorValueForColor:", v8);
  a4->var0 = v9;
  a4->var1 = v10;
  a4->var2 = v11;
  double v12 = (void *)objc_claimAutoreleasedReturnValue([v16 lastObject]);
  -[_TVWatchListIconLogoLayer _colorValueForColor:](self, "_colorValueForColor:", v12);
  a5->var0 = v13;
  a5->var1 = v14;
  a5->var2 = v15;
}

- (id)_tvAppGradientColorsForEdge:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.0,  0.658823529,  1.0,  1.0));
      v12[0] = v3;
      id v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.439215686,  1.0,  0.764705882,  1.0));
      v12[1] = v4;
      double v5 = v12;
      break;
    case 2uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.360784314,  0.792156863,  0.996078431,  1.0));
      v11[0] = v3;
      id v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.0117647059,  1.0,  0.756862745,  1.0));
      v11[1] = v4;
      double v5 = v11;
      break;
    case 4uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.0,  0.631372549,  0.956862745,  1.0));
      v10[0] = v3;
      id v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.866666667,  0.756862745,  1.0,  1.0));
      v10[1] = v4;
      double v5 = v10;
      break;
    case 8uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.356862745,  0.992156863,  0.952941176,  1.0));
      v9[0] = v3;
      id v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.82745098,  0.741176471,  0.980392157,  1.0));
      v9[1] = v4;
      double v5 = v9;
      break;
    default:
      v3 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.439215686,  1.0,  0.764705882,  1.0));
      v8[0] = v3;
      id v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.0,  0.658823529,  1.0,  1.0));
      v8[1] = v4;
      double v5 = v8;
      break;
  }

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, 2LL));

  return v6;
}

- ($1AB5FA073B851C12C2339EC22442E995)_colorValueForColor:(id)a3
{
  double v9 = 0.0;
  double v7 = 0.0;
  double v8 = 0.0;
  uint64_t v6 = 0LL;
  [a3 getRed:&v9 green:&v8 blue:&v7 alpha:&v6];
  double v3 = v9;
  double v5 = v7;
  double v4 = v8;
  result.var2 = v5;
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (CAGradientLayer)gradientLayer
{
  return *(CAGradientLayer **)&self->super._attr.refcount;
}

- (void).cxx_destruct
{
}

@end
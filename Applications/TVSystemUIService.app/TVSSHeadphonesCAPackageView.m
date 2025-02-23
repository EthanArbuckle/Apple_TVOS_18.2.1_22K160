@interface TVSSHeadphonesCAPackageView
- (CAPackage)package;
- (NSString)packageName;
- (TVSSHeadphonesCAPackageView)initWithFrame:(CGRect)a3;
- (double)preferredRasterizationScale;
- (double)scale;
- (void)_calculateAndSetRasterizationScaleForLayer:(id)a3;
- (void)_setPackage:(id)a3;
- (void)_updateRasterizationScale;
- (void)colorAllShapeSublayers:(CGColor *)a3 ofLayer:(id)a4 usingFilter:(id)a5;
- (void)layoutSubviews;
- (void)setOverrideColor:(id)a3;
- (void)setPackage:(id)a3;
- (void)setPackageName:(id)a3;
- (void)setPreferredRasterizationScale:(double)a3;
- (void)setScale:(double)a3;
- (void)setStateName:(id)a3;
@end

@implementation TVSSHeadphonesCAPackageView

- (TVSSHeadphonesCAPackageView)initWithFrame:(CGRect)a3
{
  CGRect v11 = a3;
  SEL v9 = a2;
  v10 = 0LL;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSSHeadphonesCAPackageView;
  v7 = -[TVSSHeadphonesCAPackageView initWithFrame:]( &v8,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v10 = (double *)v7;
  objc_storeStrong((id *)&v10, v7);
  if (v7)
  {
    v10[6] = 1.0;
    v3 = objc_alloc_init(&OBJC_CLASS___UIView);
    v4 = (void *)*((void *)v10 + 2);
    *((void *)v10 + 2) = v3;

    [v10 addSubview:*((void *)v10 + 2)];
    [v10 setUserInteractionEnabled:0];
  }

  v6 = v10;
  objc_storeStrong((id *)&v10, 0LL);
  return v6;
}

- (void)layoutSubviews
{
  v19 = self;
  SEL v18 = a2;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TVSSHeadphonesCAPackageView;
  -[TVSSHeadphonesCAPackageView layoutSubviews](&v17, "layoutSubviews");
  packageContentView = v19->_packageContentView;
  id v2 = -[TVSSHeadphonesCAPackageView bounds](v19, "bounds");
  unint64_t v11 = v3.n128_u64[0];
  unint64_t v12 = v4.n128_u64[0];
  unint64_t v13 = v5.n128_u64[0];
  unint64_t v14 = v6.n128_u64[0];
  double Center = UIRectGetCenter(v2, v3, v4, v5, v6);
  double v16 = v7;
  -[UIView setCenter:](packageContentView, "setCenter:", Center, v7);
  SEL v9 = v19->_packageContentView;
  CGAffineTransformMakeScale(&v10, v19->_scale, v19->_scale);
  -[UIView setTransform:](v9, "setTransform:", &v10);
}

- (void)setPackage:(id)a3
{
  __n128 v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v4->_package != location[0])
  {
    objc_storeStrong((id *)&v4->_package, location[0]);
    -[TVSSHeadphonesCAPackageView _setPackage:](v4, "_setPackage:", location[0]);
  }

  objc_storeStrong(location, 0LL);
}

- (void)setPackageName:(id)a3
{
  CGAffineTransform v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v10->_packageName, location[0]);
  __n128 v3 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v10));
  objc_super v8 = -[NSBundle URLForResource:withExtension:](v3, "URLForResource:withExtension:", location[0], @"ca");

  id v7 = 0LL;
  id v5 = 0LL;
  __n128 v4 =  +[CAPackage packageWithContentsOfURL:type:options:error:]( &OBJC_CLASS___CAPackage,  "packageWithContentsOfURL:type:options:error:",  v8,  kCAPackageTypeCAMLBundle,  0LL,  &v5);
  objc_storeStrong(&v7, v5);
  __n128 v6 = v4;
  -[TVSSHeadphonesCAPackageView setPackage:](v10, "setPackage:", v4);
  objc_storeStrong((id *)&v6, 0LL);
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong((id *)&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)setScale:(double)a3
{
  if (self->_scale != a3)
  {
    self->_scale = a3;
    -[TVSSHeadphonesCAPackageView setNeedsLayout](self, "setNeedsLayout");
  }

- (void)setPreferredRasterizationScale:(double)a3
{
  self->_preferredRasterizationScale = a3;
  -[TVSSHeadphonesCAPackageView _updateRasterizationScale](self, "_updateRasterizationScale");
}

- (void)setStateName:(id)a3
{
  __n128 v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = -[CALayer stateWithName:](v6->_packageLayer, "stateWithName:", location[0]);
  LODWORD(v3) = 1.0;
  -[CAStateController setState:ofLayer:transitionSpeed:]( v6->_stateController,  "setState:ofLayer:transitionSpeed:",  v4,  v6->_packageLayer,  v3);
  objc_storeStrong(&v4, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)setOverrideColor:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = v7;
  id v3 = [location[0] CGColor];
  id v5 = -[TVSSHeadphonesCAPackageView layer](v7, "layer");
  -[TVSSHeadphonesCAPackageView colorAllShapeSublayers:ofLayer:usingFilter:]( v4,  "colorAllShapeSublayers:ofLayer:usingFilter:",  v3);

  objc_storeStrong(location, 0LL);
}

- (void)_setPackage:(id)a3
{
  unint64_t v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[CALayer removeFromSuperlayer](v14->_packageLayer, "removeFromSuperlayer");
  id v12 = [location[0] rootLayer];
  objc_msgSend(v12, "setGeometryFlipped:", (unint64_t)objc_msgSend(location[0], "isGeometryFlipped") & 1);
  CGAffineTransform v10 = -[UIView layer](v14->_packageContentView, "layer");
  -[CALayer addSublayer:](v10, "addSublayer:", v12);

  packageContentView = v14->_packageContentView;
  [v12 bounds];
  -[UIView setBounds:](packageContentView, "setBounds:", v3, v4, v5, v6);
  objc_storeStrong((id *)&v14->_packageLayer, v12);
  id v7 = objc_alloc(&OBJC_CLASS___CAStateController);
  objc_super v8 = -[CAStateController initWithLayer:](v7, "initWithLayer:", v12);
  stateController = v14->_stateController;
  v14->_stateController = v8;

  -[TVSSHeadphonesCAPackageView setNeedsLayout](v14, "setNeedsLayout");
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_updateRasterizationScale
{
  double v4 = -[TVSSHeadphonesCAPackageView package](self, "package");
  id v3 = -[CAPackage rootLayer](v4, "rootLayer");
  -[TVSSHeadphonesCAPackageView _calculateAndSetRasterizationScaleForLayer:]( self,  "_calculateAndSetRasterizationScaleForLayer:");
}

- (void)_calculateAndSetRasterizationScaleForLayer:(id)a3
{
  v38 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v36 = -[UIView layer](v38->_packageContentView, "layer");
  id v22 = location[0];
  [location[0] bounds];
  double v31 = v3;
  double v32 = v4;
  double v33 = v5;
  double v34 = v6;
  objc_msgSend(v22, "convertRect:toLayer:", v36, v3, v4, v5, v6);
  v35.origin.x = v7;
  v35.origin.y = v8;
  v35.size.width = v9;
  v35.size.height = v10;
  [location[0] bounds];
  rect.origin.x = v11;
  rect.origin.y = v12;
  rect.size.width = v13;
  rect.size.height = v14;
  if (!CGRectIsEmpty(v35) && !CGRectIsEmpty(rect))
  {
    double v28 = v35.size.width / rect.size.width;
    double v27 = v35.size.height / rect.size.height;
    if (v35.size.width / rect.size.width >= v35.size.height / rect.size.height) {
      double v21 = v28;
    }
    else {
      double v21 = v27;
    }
    double v26 = v21;
    double v29 = v21;
    double v25 = v21 + v38->_preferredRasterizationScale;
    [location[0] setRasterizationScale:v25];
  }

  memset(__b, 0, sizeof(__b));
  id obj = [location[0] sublayers];
  id v20 = [obj countByEnumeratingWithState:__b objects:v39 count:16];
  if (v20)
  {
    uint64_t v16 = *(void *)__b[2];
    uint64_t v17 = 0LL;
    id v18 = v20;
    while (1)
    {
      uint64_t v15 = v17;
      if (*(void *)__b[2] != v16) {
        objc_enumerationMutation(obj);
      }
      uint64_t v24 = *(void *)(__b[1] + 8 * v17);
      -[TVSSHeadphonesCAPackageView _calculateAndSetRasterizationScaleForLayer:]( v38,  "_calculateAndSetRasterizationScaleForLayer:",  v24);
      ++v17;
      if (v15 + 1 >= (unint64_t)v18)
      {
        uint64_t v17 = 0LL;
        id v18 = [obj countByEnumeratingWithState:__b objects:v39 count:16];
        if (!v18) {
          break;
        }
      }
    }
  }

  objc_storeStrong(&v36, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)colorAllShapeSublayers:(CGColor *)a3 ofLayer:(id)a4 usingFilter:(id)a5
{
  id v20 = self;
  SEL v19 = a2;
  id v18 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  id v16 = 0LL;
  objc_storeStrong(&v16, a5);
  memset(__b, 0, sizeof(__b));
  id v12 = [location sublayers];
  id v13 = [v12 countByEnumeratingWithState:__b objects:v21 count:16];
  if (v13)
  {
    uint64_t v8 = *(void *)__b[2];
    uint64_t v9 = 0LL;
    id v10 = v13;
    while (1)
    {
      uint64_t v7 = v9;
      if (*(void *)__b[2] != v8) {
        objc_enumerationMutation(v12);
      }
      id v15 = *(id *)(__b[1] + 8 * v9);
      id v6 = v15;
      uint64_t v5 = objc_opt_class(&OBJC_CLASS___CAShapeLayer);
      if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0) {
        [v15 setFillColor:v18];
      }
      [v15 setCompositingFilter:v16];
      -[TVSSHeadphonesCAPackageView colorAllShapeSublayers:ofLayer:usingFilter:]( v20,  "colorAllShapeSublayers:ofLayer:usingFilter:",  v18,  v15,  v16);
      ++v9;
      if (v7 + 1 >= (unint64_t)v10)
      {
        uint64_t v9 = 0LL;
        id v10 = [v12 countByEnumeratingWithState:__b objects:v21 count:16];
        if (!v10) {
          break;
        }
      }
    }
  }

  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&location, 0LL);
}

- (CAPackage)package
{
  return self->_package;
}

- (NSString)packageName
{
  return self->_packageName;
}

- (double)scale
{
  return self->_scale;
}

- (double)preferredRasterizationScale
{
  return self->_preferredRasterizationScale;
}

- (void).cxx_destruct
{
}

@end
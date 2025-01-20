@interface TVSSHeadphonesSettingRenderer
- (BOOL)displayAsOff;
- (BOOL)isFocusable;
- (BOOL)isFocused;
- (NSString)packageName;
- (TVSSHeadphonesCAPackageView)packageView;
- (id)_resolvedOverrideColor;
- (id)overrideStylingForIdentifier:(id)a3;
- (void)_updatePackageRasterizationScale;
- (void)applyContent:(id)a3 animator:(id)a4;
- (void)configureContentView:(id)a3;
- (void)setDisplayAsOff:(BOOL)a3;
- (void)setIsFocused:(BOOL)a3;
- (void)setPackageName:(id)a3;
- (void)setPackageView:(id)a3;
@end

@implementation TVSSHeadphonesSettingRenderer

- (id)overrideStylingForIdentifier:(id)a3
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  *(_DWORD *)&v16[8] = 0;
  id v14 = location[0];
  id v15 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
  *(void *)v16 = objc_msgSend(v14, "isEqualToString:");

  if ((v16[0] & 1) != 0)
  {
    id v7 = location[0];
    id v13 = -[TVSSHeadphonesSettingRenderer _resolvedOverrideColor](v18, "_resolvedOverrideColor");
    id v12 = +[TVSPViewAttribute tintColor:](&OBJC_CLASS___TVSPViewAttribute, "tintColor:");
    v19[0] = v12;
    id v11 = +[TVSPLayerAttribute compositingFilter:](&OBJC_CLASS___TVSPLayerAttribute, "compositingFilter:", 0LL);
    v19[1] = v11;
    v10 = -[TVSSHeadphonesSettingRenderer packageName](v18, "packageName");
    id v9 = +[TVSPViewAttribute alpha:](&OBJC_CLASS___TVSPViewAttribute, "alpha:", (double)(v10 == 0LL));
    v19[2] = v9;
    v8 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 3LL);
    v3 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v7);
    v4 = *(void **)&v16[4];
    *(void *)&v16[4] = v3;
  }

  id v6 = *(id *)&v16[4];
  objc_storeStrong((id *)&v16[4], 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

- (void)configureContentView:(id)a3
{
  v23 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v21.receiver = v23;
  v21.super_class = (Class)&OBJC_CLASS___TVSSHeadphonesSettingRenderer;
  -[TVSSHeadphonesSettingRenderer configureContentView:](&v21, "configureContentView:", location[0]);
  id v4 = -[TVSSHeadphonesSettingRenderer subviews](v23, "subviews");
  id v20 = [v4 imageView];

  v19 = objc_alloc_init(&OBJC_CLASS___TVSSHeadphonesCAPackageView);
  -[TVSSHeadphonesCAPackageView setTranslatesAutoresizingMaskIntoConstraints:]( v19,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[TVSSHeadphonesCAPackageView setScale:](v19, "setScale:", 2.0);
  [location[0] addSubview:v19];
  v5 = -[NSString stringByAppendingString:](v23->_packageName, "stringByAppendingString:", @"_black");
  -[TVSSHeadphonesCAPackageView setPackageName:](v19, "setPackageName:");

  -[TVSSHeadphonesCAPackageView setStateName:](v19, "setStateName:", @"active");
  id v6 = -[TVSSHeadphonesSettingRenderer _resolvedOverrideColor](v23, "_resolvedOverrideColor");
  -[TVSSHeadphonesCAPackageView setOverrideColor:](v19, "setOverrideColor:");

  id v7 = -[TVSSHeadphonesSettingRenderer packageName](v23, "packageName");
  double v3 = 1.0;
  if (!v7) {
    double v3 = 0.0;
  }
  -[TVSSHeadphonesCAPackageView setAlpha:](v19, "setAlpha:", v3);

  -[TVSSHeadphonesSettingRenderer setPackageView:](v23, "setPackageView:", v19);
  id v17 = -[TVSSHeadphonesCAPackageView centerXAnchor](v19, "centerXAnchor");
  id v16 = [v20 centerXAnchor];
  id v15 = objc_msgSend(v17, "constraintEqualToAnchor:");
  v24[0] = v15;
  id v14 = -[TVSSHeadphonesCAPackageView centerYAnchor](v19, "centerYAnchor");
  id v13 = [v20 centerYAnchor];
  id v12 = objc_msgSend(v14, "constraintEqualToAnchor:");
  v24[1] = v12;
  id v11 = -[TVSSHeadphonesCAPackageView widthAnchor](v19, "widthAnchor");
  id v10 = objc_msgSend(v11, "constraintEqualToConstant:");
  v24[2] = v10;
  id v9 = -[TVSSHeadphonesCAPackageView heightAnchor](v19, "heightAnchor");
  id v8 = [v9 constraintEqualToConstant:64.0];
  v24[3] = v8;
  v18 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 4LL);

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v18);
  objc_storeStrong((id *)&v18, 0LL);
  objc_storeStrong((id *)&v19, 0LL);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)applyContent:(id)a3 animator:(id)a4
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v10 = 0LL;
  objc_storeStrong(&v10, a4);
  v9.receiver = v12;
  v9.super_class = (Class)&OBJC_CLASS___TVSSHeadphonesSettingRenderer;
  -[TVSSHeadphonesSettingRenderer applyContent:animator:](&v9, "applyContent:animator:", location[0], v10);
  id v8 = -[TVSSHeadphonesSettingRenderer packageName](v12, "packageName");
  double v4 = 1.0;
  if (!v8) {
    double v4 = 0.0;
  }
  double v6 = v4;
  id v7 = -[TVSSHeadphonesSettingRenderer packageView](v12, "packageView", a4);
  -[TVSSHeadphonesCAPackageView setAlpha:](v7, "setAlpha:", v6);

  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
}

- (BOOL)isFocusable
{
  id v7 = self;
  SEL v6 = a2;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSSHeadphonesSettingRenderer;
  char v5 = -[TVSSHeadphonesSettingRenderer isFocusable](&v4, "isFocusable");
  LOBYTE(v3) = 0;
  if (v5) {
    unsigned int v3 = -[TVSSHeadphonesSettingRenderer isDisabled](v7, "isDisabled") ^ 1;
  }
  return v3 & 1;
}

- (void)setIsFocused:(BOOL)a3
{
  self->_isFocused = a3;
  -[TVSSHeadphonesSettingRenderer _updatePackageRasterizationScale](self, "_updatePackageRasterizationScale");
}

- (void)setPackageName:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v8->_packageName, location[0]);
  packageView = v8->_packageView;
  id v4 = [location[0] stringByAppendingString:@"_black"];
  -[TVSSHeadphonesCAPackageView setPackageName:](packageView, "setPackageName:");

  -[TVSSHeadphonesCAPackageView setStateName:](v8->_packageView, "setStateName:", @"active");
  char v5 = v8->_packageView;
  id v6 = -[TVSSHeadphonesSettingRenderer _resolvedOverrideColor](v8, "_resolvedOverrideColor");
  -[TVSSHeadphonesCAPackageView setOverrideColor:](v5, "setOverrideColor:");

  objc_storeStrong(location, 0LL);
}

- (void)setDisplayAsOff:(BOOL)a3
{
  if (self->_displayAsOff != a3)
  {
    self->_displayAsOff = a3;
    packageView = self->_packageView;
    id v4 = -[TVSSHeadphonesSettingRenderer _resolvedOverrideColor](self, "_resolvedOverrideColor");
    -[TVSSHeadphonesCAPackageView setOverrideColor:](packageView, "setOverrideColor:");
  }

- (void)_updatePackageRasterizationScale
{
}

- (id)_resolvedOverrideColor
{
  if (!-[TVSSHeadphonesSettingRenderer displayAsOff](self, "displayAsOff")) {
    return +[UIColor systemBlueColor](&OBJC_CLASS___UIColor, "systemBlueColor");
  }
  id v3 = +[UITraitCollection _tvspMainSceneTraits](&OBJC_CLASS___UITraitCollection, "_tvspMainSceneTraits");
  id v4 = [v3 userInterfaceStyle];

  id v5 = -[TVSSHeadphonesSettingRenderer controlState](self, "controlState");
  if (v4 != (id)2 || v5 == (id)8 || v5 == (id)1) {
    return +[TVSPConstants defaultLightModeTextColor](&OBJC_CLASS___TVSPConstants, "defaultLightModeTextColor");
  }
  else {
    return +[TVSPConstants defaultDarkModeTextColor](&OBJC_CLASS___TVSPConstants, "defaultDarkModeTextColor");
  }
}

- (NSString)packageName
{
  return self->_packageName;
}

- (TVSSHeadphonesCAPackageView)packageView
{
  return self->_packageView;
}

- (void)setPackageView:(id)a3
{
}

- (BOOL)isFocused
{
  return self->_isFocused;
}

- (BOOL)displayAsOff
{
  return self->_displayAsOff;
}

- (void).cxx_destruct
{
}

@end
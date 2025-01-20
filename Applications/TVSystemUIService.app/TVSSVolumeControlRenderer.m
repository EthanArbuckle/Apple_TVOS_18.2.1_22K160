@interface TVSSVolumeControlRenderer
- (BOOL)hasHorizontalInteraction;
- (BSUICAPackageView)packageView;
- (id)_stateNameForVolumeLevel:(id)a3;
- (id)overrideStylingForIdentifier:(id)a3;
- (void)applyContent:(id)a3 animator:(id)a4;
- (void)configureContentView:(id)a3;
- (void)contentDidChange;
- (void)setPackageView:(id)a3;
@end

@implementation TVSSVolumeControlRenderer

- (void)contentDidChange
{
  v5 = -[TVSSVolumeControlRenderer packageView](self, "packageView");
  id v4 = -[TVSSVolumeControlRenderer content](self, "content");
  id v3 = [v4 contentPercentage];
  id v2 = -[TVSSVolumeControlRenderer _stateNameForVolumeLevel:](self, "_stateNameForVolumeLevel:");
  -[BSUICAPackageView setState:animated:](v5, "setState:animated:");
}

- (void)configureContentView:(id)a3
{
  v27 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v25.receiver = v27;
  v25.super_class = (Class)&OBJC_CLASS___TVSSVolumeControlRenderer;
  -[TVSSVolumeControlRenderer configureContentView:](&v25, "configureContentView:", location[0]);
  id v15 = -[TVSSVolumeControlRenderer subviews](v27, "subviews");
  id v24 = [v15 imageView];

  BOOL v23 = [location[0] effectiveUserInterfaceLayoutDirection] == (id)1;
  v16 = objc_alloc(&OBJC_CLASS___BSUICAPackageView);
  v17 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v27));
  v22 = -[BSUICAPackageView initWithPackageName:inBundle:](v16, "initWithPackageName:inBundle:", @"Volume");

  -[BSUICAPackageView setTranslatesAutoresizingMaskIntoConstraints:]( v22,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  [location[0] addSubview:v22];
  -[TVSSVolumeControlRenderer setPackageView:](v27, "setPackageView:", v22);
  if (v23)
  {
    CGAffineTransformMakeScale(&v21, -1.0, 1.0);
    memcpy(__dst, &v21, sizeof(__dst));
    -[BSUICAPackageView setTransform:](v22, "setTransform:", __dst);
  }

  unsigned __int8 v3 = +[TVSSConstants isScaledUI](&OBJC_CLASS___TVSSConstants, "isScaledUI");
  double v4 = 76.0;
  if ((v3 & 1) == 0) {
    double v4 = 64.0;
  }
  double v19 = v4;
  id v14 = -[BSUICAPackageView centerXAnchor](v22, "centerXAnchor");
  id v13 = [v24 centerXAnchor];
  id v12 = objc_msgSend(v14, "constraintEqualToAnchor:");
  v28[0] = v12;
  id v11 = -[BSUICAPackageView centerYAnchor](v22, "centerYAnchor");
  id v10 = [v24 centerYAnchor];
  id v9 = objc_msgSend(v11, "constraintEqualToAnchor:");
  v28[1] = v9;
  id v8 = -[BSUICAPackageView widthAnchor](v22, "widthAnchor");
  id v7 = [v8 constraintEqualToConstant:v19];
  v28[2] = v7;
  id v6 = -[BSUICAPackageView heightAnchor](v22, "heightAnchor");
  id v5 = [v6 constraintEqualToConstant:v19];
  v28[3] = v5;
  v18 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v28, 4LL);

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v18);
  objc_storeStrong((id *)&v18, 0LL);
  objc_storeStrong((id *)&v22, 0LL);
  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)overrideStylingForIdentifier:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  *(_DWORD *)&v12[8] = 0;
  id v10 = location[0];
  id v11 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
  *(void *)id v12 = objc_msgSend(v10, "isEqualToString:");

  if ((v12[0] & 1) != 0)
  {
    id v7 = location[0];
    id v9 = +[TVSPViewAttribute alpha:](&OBJC_CLASS___TVSPViewAttribute, "alpha:", 0.0);
    id v14 = v9;
    id v8 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL);
    unsigned __int8 v3 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v7);
    double v4 = *(void **)&v12[4];
    *(void *)&v12[4] = v3;
  }

  id v6 = *(id *)&v12[4];
  objc_storeStrong((id *)&v12[4], 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

- (void)applyContent:(id)a3 animator:(id)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = 0LL;
  objc_storeStrong(&v6, a4);
  v5.receiver = v8;
  v5.super_class = (Class)&OBJC_CLASS___TVSSVolumeControlRenderer;
  -[TVSSVolumeControlRenderer applyContent:animator:](&v5, "applyContent:animator:", location[0], v6);
  -[TVSSVolumeControlRenderer contentDidChange](v8, "contentDidChange");
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)_stateNameForVolumeLevel:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  [location[0] floatValue];
  double v7 = v3;
  id v6 = &stru_1001BDAC8;
  if (v7 > 0.0)
  {
    if (v7 >= 0.35)
    {
      if (v7 >= 0.75) {
        objc_storeStrong(&v6, @"full");
      }
      else {
        objc_storeStrong(&v6, @"half");
      }
    }

    else
    {
      objc_storeStrong(&v6, @"min");
    }
  }

  else
  {
    objc_storeStrong(&v6, @"off");
  }

  id v5 = v6;
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
  return v5;
}

- (BOOL)hasHorizontalInteraction
{
  return 1;
}

- (BSUICAPackageView)packageView
{
  return self->_packageView;
}

- (void)setPackageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface TVSSProfilePanelNoUserRenderer
+ (id)primaryFont;
+ (id)secondaryFont;
- (BOOL)isFocusable;
- (BOOL)wantsFloatingContentView;
- (CGSize)contentSizeForLayoutEnvironment:(id)a3;
- (TVSSProfilePanelNoUserRenderer)initWithIdentifier:(id)a3 content:(id)a4;
- (id)layoutConstraintsWithSubviews:(id)a3 contentView:(id)a4;
- (id)subviewIdentifiersWantingAutolayout;
- (int64_t)focusStyle;
@end

@implementation TVSSProfilePanelNoUserRenderer

+ (id)primaryFont
{
  return +[UIFont _preferredFontForTextStyle:variant:]( &OBJC_CLASS___UIFont,  "_preferredFontForTextStyle:variant:",  UIFontTextStyleCallout,  1280LL,  a2,  a1);
}

+ (id)secondaryFont
{
  return +[UIFont _preferredFontForTextStyle:addingSymbolicTraits:]( &OBJC_CLASS___UIFont,  "_preferredFontForTextStyle:addingSymbolicTraits:",  UIFontTextStyleCaption1,  0x8000LL,  a2,  a1);
}

- (TVSSProfilePanelNoUserRenderer)initWithIdentifier:(id)a3 content:(id)a4
{
  v32 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v30 = 0LL;
  objc_storeStrong(&v30, a4);
  id v6 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
  v29 = +[TVSPStyling stylingWithIdentifier:handler:](&OBJC_CLASS___TVSPStyling, "stylingWithIdentifier:handler:");

  id v28 = -[TVSSProfilePanelNoUserRenderer effectiveUserInterfaceStyle](v32, "effectiveUserInterfaceStyle");
  id v7 = +[TVSPIdentifiers text1ID](&OBJC_CLASS___TVSPIdentifiers, "text1ID");
  v21[1] = _NSConcreteStackBlock;
  int v22 = -1073741824;
  int v23 = 0;
  v24 = sub_100122A04;
  v25 = &unk_1001BA878;
  v26[0] = v32;
  v26[1] = v28;
  v27 = +[TVSPStyling stylingWithIdentifier:handler:](&OBJC_CLASS___TVSPStyling, "stylingWithIdentifier:handler:", v7);

  id v8 = +[TVSPIdentifiers text2ID](&OBJC_CLASS___TVSPIdentifiers, "text2ID");
  v15 = _NSConcreteStackBlock;
  int v16 = -1073741824;
  int v17 = 0;
  v18 = sub_100122B7C;
  v19 = &unk_1001BA878;
  v20[0] = v32;
  v20[1] = v28;
  v21[0] =  +[TVSPStyling stylingWithIdentifier:handler:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:handler:",  v8);

  v9 = v32;
  id v10 = location[0];
  id v11 = v30;
  v33[0] = v29;
  v33[1] = v27;
  v33[2] = v21[0];
  v12 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 3LL);
  v32 = 0LL;
  v14.receiver = v9;
  v14.super_class = (Class)&OBJC_CLASS___TVSSProfilePanelNoUserRenderer;
  v32 = -[TVSSProfilePanelNoUserRenderer initWithIdentifier:format:content:overrideStylings:]( &v14,  "initWithIdentifier:format:content:overrideStylings:",  v10,  0LL,  v11);
  v13 = v32;

  objc_storeStrong(v21, 0LL);
  objc_storeStrong(v20, 0LL);
  objc_storeStrong((id *)&v27, 0LL);
  objc_storeStrong(v26, 0LL);
  objc_storeStrong((id *)&v29, 0LL);
  objc_storeStrong(&v30, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v32, 0LL);
  return v13;
}

- (CGSize)contentSizeForLayoutEnvironment:(id)a3
{
  v32 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  [location[0] layoutFrame];
  sub_10012306C();
  double v29 = v3;
  double v30 = v4;
  id v20 = -[TVSSProfilePanelNoUserRenderer content](v32, "content");
  id v19 = [v20 contentText1];
  NSAttributedStringKey v37 = NSFontAttributeName;
  id v18 = [(id)objc_opt_class(v32) primaryFont];
  id v38 = v18;
  int v17 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37);
  objc_msgSend(v19, "boundingRectWithSize:options:attributes:context:", v29, v30);
  v28.origin.x = v5;
  v28.origin.y = v6;
  v28.size.width = v7;
  v28.size.height = v8;

  id v24 = -[TVSSProfilePanelNoUserRenderer content](v32, "content");
  id v23 = [v24 contentText2];
  NSAttributedStringKey v35 = NSFontAttributeName;
  id v22 = [(id)objc_opt_class(v32) secondaryFont];
  id v36 = v22;
  v21 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL);
  objc_msgSend(v23, "boundingRectWithSize:options:attributes:context:", 3, v29, v30);
  v27.origin.x = v9;
  v27.origin.y = v10;
  v27.size.width = v11;
  v27.size.height = v12;

  id v26 = -[TVSSProfilePanelNoUserRenderer content](v32, "content");
  id v25 = [v26 contentImage];
  [v25 size];
  CGRectGetHeight(v28);
  CGRectGetHeight(v27);

  sub_10012306C();
  double v33 = v13;
  double v34 = v14;
  objc_storeStrong(location, 0LL);
  double v15 = v34;
  double v16 = v33;
  result.height = v15;
  result.width = v16;
  return result;
}

  ;
}

- (id)subviewIdentifiersWantingAutolayout
{
  id v6 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
  v7[0] = v6;
  id v5 = +[TVSPIdentifiers text1ID](&OBJC_CLASS___TVSPIdentifiers, "text1ID");
  v7[1] = v5;
  id v3 = +[TVSPIdentifiers text2ID](&OBJC_CLASS___TVSPIdentifiers, "text2ID");
  v7[2] = v3;
  double v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 3LL);

  return v4;
}

- (id)layoutConstraintsWithSubviews:(id)a3 contentView:(id)a4
{
  v52 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v50 = 0LL;
  objc_storeStrong(&v50, a4);
  id v49 = [location[0] imageView];
  id v48 = [location[0] label1];
  id v47 = [location[0] label2];
  id v9 = -[TVSSProfilePanelNoUserRenderer content](v52, "content");
  id v8 = [v9 contentImage];
  [v8 size];
  double v45 = v4;
  double v46 = v5;

  id v44 = [v49 centerXAnchor];
  id v43 = [v50 centerXAnchor];
  id v42 = objc_msgSend(v44, "constraintEqualToAnchor:");
  v53[0] = v42;
  id v41 = [v49 topAnchor];
  id v40 = [v50 topAnchor];
  id v39 = objc_msgSend(v41, "constraintEqualToAnchor:");
  v53[1] = v39;
  id v38 = [v49 widthAnchor];
  id v37 = [v38 constraintEqualToConstant:v45];
  v53[2] = v37;
  id v36 = [v49 heightAnchor];
  id v35 = [v36 constraintEqualToConstant:v46];
  v53[3] = v35;
  id v34 = [v48 centerXAnchor];
  id v33 = [v50 centerXAnchor];
  id v32 = objc_msgSend(v34, "constraintEqualToAnchor:");
  v53[4] = v32;
  id v31 = [v48 leadingAnchor];
  id v30 = [v50 leadingAnchor];
  id v29 = objc_msgSend(v31, "constraintGreaterThanOrEqualToAnchor:constant:");
  v53[5] = v29;
  id v28 = [v48 trailingAnchor];
  id v27 = [v50 trailingAnchor];
  id v26 = objc_msgSend(v28, "constraintLessThanOrEqualToAnchor:constant:");
  v53[6] = v26;
  id v25 = [v48 topAnchor];
  id v24 = [v49 bottomAnchor];
  id v23 = objc_msgSend(v25, "constraintEqualToAnchor:constant:", 32.0);
  v53[7] = v23;
  id v22 = [v47 centerXAnchor];
  id v21 = [v50 centerXAnchor];
  id v20 = objc_msgSend(v22, "constraintEqualToAnchor:");
  v53[8] = v20;
  id v19 = [v47 leadingAnchor];
  id v18 = [v50 leadingAnchor];
  id v17 = objc_msgSend(v19, "constraintGreaterThanOrEqualToAnchor:constant:", 36.0);
  v53[9] = v17;
  id v16 = [v47 trailingAnchor];
  id v15 = [v50 trailingAnchor];
  id v14 = objc_msgSend(v16, "constraintLessThanOrEqualToAnchor:constant:", -36.0);
  v53[10] = v14;
  id v13 = [v47 topAnchor];
  id v12 = [v48 bottomAnchor];
  id v10 = objc_msgSend(v13, "constraintEqualToAnchor:constant:", 8.0);
  v53[11] = v10;
  CGFloat v11 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v53, 12LL);

  objc_storeStrong(&v47, 0LL);
  objc_storeStrong(&v48, 0LL);
  objc_storeStrong(&v49, 0LL);
  objc_storeStrong(&v50, 0LL);
  objc_storeStrong(location, 0LL);
  return v11;
}

- (int64_t)focusStyle
{
  return 2LL;
}

- (BOOL)isFocusable
{
  return 0;
}

- (BOOL)wantsFloatingContentView
{
  return 0;
}

@end
@interface TVSSInterstitialInfoRenderer
+ (id)titleFont;
- (BOOL)isFocusable;
- (BOOL)wantsFloatingContentView;
- (CGSize)contentSizeForLayoutEnvironment:(id)a3;
- (TVSSInterstitialInfoRenderer)initWithIdentifier:(id)a3 content:(id)a4;
- (TVSSInterstitialInfoRenderer)initWithIdentifier:(id)a3 content:(id)a4 contentInsets:(NSDirectionalEdgeInsets)a5;
- (id)layoutConstraintsWithSubviews:(id)a3 contentView:(id)a4;
- (id)subviewIdentifiersWantingAutolayout;
- (int64_t)focusStyle;
@end

@implementation TVSSInterstitialInfoRenderer

+ (id)titleFont
{
  return +[TVSPConstants fontForTextStyle:](&OBJC_CLASS___TVSPConstants, "fontForTextStyle:", 5LL, a2, a1);
}

- (TVSSInterstitialInfoRenderer)initWithIdentifier:(id)a3 content:(id)a4
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = 0LL;
  objc_storeStrong(&v8, a4);
  v4 = v10;
  v10 = 0LL;
  v10 = -[TVSSInterstitialInfoRenderer initWithIdentifier:content:contentInsets:]( v4,  "initWithIdentifier:content:contentInsets:",  location[0],  v8,  NSDirectionalEdgeInsetsZero.top,  NSDirectionalEdgeInsetsZero.leading,  NSDirectionalEdgeInsetsZero.bottom,  NSDirectionalEdgeInsetsZero.trailing);
  v7 = v10;
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v10, 0LL);
  return v7;
}

- (TVSSInterstitialInfoRenderer)initWithIdentifier:(id)a3 content:(id)a4 contentInsets:(NSDirectionalEdgeInsets)a5
{
  *(CGFloat *)&__int128 v27 = a5.top;
  *((void *)&v27 + 1) = *(void *)&a5.leading;
  *(CGFloat *)&__int128 v28 = a5.bottom;
  *((void *)&v28 + 1) = *(void *)&a5.trailing;
  v26 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v24 = 0LL;
  objc_storeStrong(&v24, a4);
  id v23 = -[TVSSInterstitialInfoRenderer effectiveUserInterfaceStyle](v26, "effectiveUserInterfaceStyle");
  id v9 = +[TVSPIdentifiers text1ID](&OBJC_CLASS___TVSPIdentifiers, "text1ID");
  v16 = _NSConcreteStackBlock;
  int v17 = -1073741824;
  int v18 = 0;
  v19 = sub_1000E582C;
  v20 = &unk_1001BA878;
  v21[0] = v26;
  v21[1] = v23;
  id v22 =  +[TVSPStyling stylingWithIdentifier:handler:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:handler:",  v9,  &v16);

  v10 = v26;
  id v11 = location[0];
  id v12 = v24;
  id v29 = v22;
  v13 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v29, 1LL);
  v26 = 0LL;
  v15.receiver = v10;
  v15.super_class = (Class)&OBJC_CLASS___TVSSInterstitialInfoRenderer;
  v14 = -[TVSSInterstitialInfoRenderer initWithIdentifier:format:content:overrideStylings:]( &v15,  "initWithIdentifier:format:content:overrideStylings:",  v11,  0LL,  v12);
  v26 = v14;
  objc_storeStrong((id *)&v26, v14);

  if (v14)
  {
    p_contentInsets = &v26->_contentInsets;
    *(_OWORD *)&v26->_contentInsets.top = v27;
    *(_OWORD *)&p_contentInsets->bottom = v28;
  }

  v7 = v26;
  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(v21, 0LL);
  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v26, 0LL);
  return v7;
}

- (CGSize)contentSizeForLayoutEnvironment:(id)a3
{
  id v23 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSInterstitialInfoRenderer applyStylings](v23, "applyStylings");
  [location[0] layoutFrame];
  sub_1000E5C40();
  double v20 = v3;
  double v21 = v4;
  id v16 = -[TVSSInterstitialInfoRenderer content](v23, "content");
  id v15 = [v16 contentText1];
  NSAttributedStringKey v26 = NSFontAttributeName;
  id v14 = [(id)objc_opt_class(v23) titleFont];
  id v27 = v14;
  v13 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL);
  objc_msgSend(v15, "boundingRectWithSize:options:attributes:context:", 3, v20, v21);
  rect.origin.x = v5;
  rect.origin.y = v6;
  rect.size.width = v7;
  rect.size.height = v8;

  id v18 = -[TVSSInterstitialInfoRenderer content](v23, "content");
  id v17 = [v18 contentImage];
  [v17 size];
  CGRectGetHeight(rect);

  sub_1000E5C40();
  double v24 = v9;
  double v25 = v10;
  objc_storeStrong(location, 0LL);
  double v11 = v25;
  double v12 = v24;
  result.height = v11;
  result.width = v12;
  return result;
}

  ;
}

- (id)subviewIdentifiersWantingAutolayout
{
  id v5 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
  v6[0] = v5;
  id v3 = +[TVSPIdentifiers text1ID](&OBJC_CLASS___TVSPIdentifiers, "text1ID");
  v6[1] = v3;
  double v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, 2LL);

  return v4;
}

- (id)layoutConstraintsWithSubviews:(id)a3 contentView:(id)a4
{
  v39 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v37 = 0LL;
  objc_storeStrong(&v37, a4);
  id v36 = [location[0] imageView];
  id v35 = [location[0] label1];
  id v9 = -[TVSSInterstitialInfoRenderer content](v39, "content");
  id v8 = [v9 contentImage];
  [v8 size];
  double v33 = v4;
  double v34 = v5;

  id v32 = [v36 centerXAnchor];
  id v31 = [v37 centerXAnchor];
  id v30 = objc_msgSend(v32, "constraintEqualToAnchor:");
  v40[0] = v30;
  id v29 = [v36 topAnchor];
  id v28 = [v37 topAnchor];
  id v27 = objc_msgSend(v29, "constraintEqualToAnchor:constant:", v39->_contentInsets.top + 25.0);
  v40[1] = v27;
  id v26 = [v36 widthAnchor];
  id v25 = [v26 constraintEqualToConstant:v33];
  v40[2] = v25;
  id v24 = [v36 heightAnchor];
  id v23 = [v24 constraintEqualToConstant:v34];
  v40[3] = v23;
  id v22 = [v35 centerXAnchor];
  id v21 = [v37 centerXAnchor];
  id v20 = objc_msgSend(v22, "constraintEqualToAnchor:");
  v40[4] = v20;
  id v19 = [v35 leadingAnchor];
  id v18 = [v37 leadingAnchor];
  id v17 = objc_msgSend(v19, "constraintGreaterThanOrEqualToAnchor:constant:", v39->_contentInsets.leading + 36.0);
  v40[5] = v17;
  id v16 = [v35 trailingAnchor];
  id v15 = [v37 trailingAnchor];
  id v14 = objc_msgSend(v16, "constraintLessThanOrEqualToAnchor:constant:", -(v39->_contentInsets.trailing + 36.0));
  v40[6] = v14;
  id v13 = [v35 topAnchor];
  id v12 = [v36 bottomAnchor];
  id v10 = objc_msgSend(v13, "constraintEqualToAnchor:constant:", 40.0);
  v40[7] = v10;
  double v11 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v40, 8LL);

  objc_storeStrong(&v35, 0LL);
  objc_storeStrong(&v36, 0LL);
  objc_storeStrong(&v37, 0LL);
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
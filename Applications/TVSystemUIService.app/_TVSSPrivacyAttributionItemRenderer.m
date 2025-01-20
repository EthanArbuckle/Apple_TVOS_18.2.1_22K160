@interface _TVSSPrivacyAttributionItemRenderer
+ (id)rendererWithIdentifier:(id)a3 item:(id)a4;
- (BOOL)isSelectable;
- (id)layoutConstraintsWithSubviews:(id)a3 contentView:(id)a4;
- (id)subviewIdentifiersWantingAutolayout;
@end

@implementation _TVSSPrivacyAttributionItemRenderer

+ (id)rendererWithIdentifier:(id)a3 item:(id)a4
{
  id v29 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v27 = 0LL;
  objc_storeStrong(&v27, a4);
  v8 = v29;
  id v6 = location[0];
  id v7 = v27;
  id v26 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
  id v25 =  +[TVSSCriticalInfo _tintColorForKind:]( TVSSCriticalInfo,  "_tintColorForKind:",  [v27 kind]);
  id v24 = +[TVSPViewAttribute tintColor:](&OBJC_CLASS___TVSPViewAttribute, "tintColor:");
  v32[0] = v24;
  id v23 = +[TVSPLayerAttribute compositingFilter:](&OBJC_CLASS___TVSPLayerAttribute, "compositingFilter:", 0LL);
  v32[1] = v23;
  v22 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 2LL);
  v21 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v26);
  v33[0] = v21;
  id v20 = +[TVSPIdentifiers titleID](&OBJC_CLASS___TVSPIdentifiers, "titleID");
  id v19 = +[TVSPConstants fontForTextStyle:](&OBJC_CLASS___TVSPConstants, "fontForTextStyle:");
  id v18 = +[TVSPLabelAttribute font:](&OBJC_CLASS___TVSPLabelAttribute, "font:");
  id v31 = v18;
  v17 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v31);
  v16 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v20);
  v33[1] = v16;
  id v15 = +[TVSPIdentifiers text1ID](&OBJC_CLASS___TVSPIdentifiers, "text1ID");
  id v14 = +[TVSPConstants fontForTextStyle:](&OBJC_CLASS___TVSPConstants, "fontForTextStyle:", 5LL);
  id v13 = +[TVSPLabelAttribute font:](&OBJC_CLASS___TVSPLabelAttribute, "font:");
  id v30 = v13;
  v12 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL);
  v11 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v15);
  v33[2] = v11;
  v9 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 3LL);
  id v10 = objc_msgSend(v8, "rendererWithIdentifier:format:content:overrideStylings:", v6, 18, v7);

  objc_storeStrong(&v27, 0LL);
  objc_storeStrong(location, 0LL);
  return v10;
}

- (BOOL)isSelectable
{
  return 0;
}

- (id)subviewIdentifiersWantingAutolayout
{
  id v6 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
  v7[0] = v6;
  id v5 = +[TVSPIdentifiers titleID](&OBJC_CLASS___TVSPIdentifiers, "titleID");
  v7[1] = v5;
  id v3 = +[TVSPIdentifiers text1ID](&OBJC_CLASS___TVSPIdentifiers, "text1ID");
  v7[2] = v3;
  v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 3LL);

  return v4;
}

- (id)layoutConstraintsWithSubviews:(id)a3 contentView:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v32 = 0LL;
  objc_storeStrong(&v32, a4);
  id v31 = [location[0] imageView];
  id v30 = [location[0] titleLabel];
  id v29 = [location[0] label1];
  id v28 = [v31 leadingAnchor];
  id v27 = [v32 leadingAnchor];
  id v26 = objc_msgSend(v28, "constraintEqualToAnchor:constant:", 21.0);
  v34[0] = v26;
  id v25 = [v31 centerYAnchor];
  id v24 = [v32 centerYAnchor];
  id v23 = objc_msgSend(v25, "constraintEqualToAnchor:");
  v34[1] = v23;
  id v22 = [v31 widthAnchor];
  id v21 = [v22 constraintEqualToConstant:40.0];
  v34[2] = v21;
  id v20 = [v31 heightAnchor];
  id v19 = [v20 constraintEqualToConstant:24.0];
  v34[3] = v19;
  id v18 = [v30 leadingAnchor];
  id v17 = [v31 trailingAnchor];
  id v16 = objc_msgSend(v18, "constraintEqualToAnchor:constant:", 10.0);
  v34[4] = v16;
  id v15 = [v30 centerYAnchor];
  id v14 = [v32 centerYAnchor];
  id v13 = objc_msgSend(v15, "constraintEqualToAnchor:");
  v34[5] = v13;
  id v12 = [v29 trailingAnchor];
  id v11 = [v32 trailingAnchor];
  id v10 = objc_msgSend(v12, "constraintEqualToAnchor:constant:", -18.0);
  v34[6] = v10;
  id v9 = [v29 centerYAnchor];
  id v8 = [v32 centerYAnchor];
  id v6 = objc_msgSend(v9, "constraintEqualToAnchor:");
  v34[7] = v6;
  id v7 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 8LL);

  objc_storeStrong(&v29, 0LL);
  objc_storeStrong(&v30, 0LL);
  objc_storeStrong(&v31, 0LL);
  objc_storeStrong(&v32, 0LL);
  objc_storeStrong(location, 0LL);
  return v7;
}

@end
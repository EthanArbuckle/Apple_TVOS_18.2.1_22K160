@interface _TVSSPrivacyAttributionGroupTitleRenderer
+ (id)rendererWithIdentifier:(id)a3 group:(id)a4;
- (id)layoutConstraintsWithSubviews:(id)a3 contentView:(id)a4;
- (id)subviewIdentifiersWantingAutolayout;
@end

@implementation _TVSSPrivacyAttributionGroupTitleRenderer

+ (id)rendererWithIdentifier:(id)a3 group:(id)a4
{
  id v20 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v18 = 0LL;
  objc_storeStrong(&v18, a4);
  v8 = v20;
  id v6 = location[0];
  id v7 = v18;
  id v17 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
  id v16 = +[TVSPViewAttribute contentMode:](&OBJC_CLASS___TVSPViewAttribute, "contentMode:");
  v23[0] = v16;
  id v15 = +[TVSPLayerAttribute compositingFilter:](&OBJC_CLASS___TVSPLayerAttribute, "compositingFilter:", 0LL);
  v23[1] = v15;
  id v14 =  +[TVSPLayerAttribute minificationFilter:]( &OBJC_CLASS___TVSPLayerAttribute,  "minificationFilter:",  kCAFilterTrilinear);
  v23[2] = v14;
  v13 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23);
  v12 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v17);
  v24 = v12;
  v11 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL);
  uint64_t v21 = TVSPRendererOptionImageWidth;
  v22 = &off_1001C8CD8;
  v9 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL);
  id v10 = objc_msgSend(v8, "rendererWithIdentifier:format:content:overrideStylings:optionsDict:", v6, 3, v7, v11);

  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(location, 0LL);
  return v10;
}

- (id)subviewIdentifiersWantingAutolayout
{
  id v5 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
  v6[0] = v5;
  id v3 = +[TVSPIdentifiers titleID](&OBJC_CLASS___TVSPIdentifiers, "titleID");
  v6[1] = v3;
  v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, 2LL);

  return v4;
}

- (id)layoutConstraintsWithSubviews:(id)a3 contentView:(id)a4
{
  v46 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v44 = 0LL;
  objc_storeStrong(&v44, a4);
  id v43 = [location[0] imageView];
  id v42 = [location[0] titleLabel];
  id v32 = [v42 leadingAnchor];
  id v31 = [v43 trailingAnchor];
  v4 = (NSLayoutConstraint *)objc_msgSend(v32, "constraintEqualToAnchor:constant:", 10.0);
  titleWithImageLeadingConstraint = v46->_titleWithImageLeadingConstraint;
  v46->_titleWithImageLeadingConstraint = v4;

  id v30 = [v42 leadingAnchor];
  id v29 = [v44 leadingAnchor];
  id v6 = (NSLayoutConstraint *)objc_msgSend(v30, "constraintEqualToAnchor:");
  titleWithNoImageLeadingConstraint = v46->_titleWithNoImageLeadingConstraint;
  v46->_titleWithNoImageLeadingConstraint = v6;

  id v28 = -[_TVSSPrivacyAttributionGroupTitleRenderer content](v46, "content");
  id v27 = [v28 contentImage];
  if (v27) {
    v8 = v46->_titleWithImageLeadingConstraint;
  }
  else {
    v8 = v46->_titleWithNoImageLeadingConstraint;
  }
  id v41 = v8;

  objc_initWeak(&from, v46);
  v34 = _NSConcreteStackBlock;
  int v35 = -1073741824;
  int v36 = 0;
  v37 = sub_10010A2A4;
  v38 = &unk_1001BB358;
  objc_copyWeak(&v39, &from);
  -[_TVSSPrivacyAttributionGroupTitleRenderer setUpdateAutoLayoutForContentHandler:]( v46,  "setUpdateAutoLayoutForContentHandler:",  &v34);
  id v26 = [v43 leadingAnchor];
  id v25 = [v44 leadingAnchor];
  id v24 = objc_msgSend(v26, "constraintEqualToAnchor:");
  v47[0] = v24;
  id v23 = [v43 centerYAnchor];
  id v22 = [v44 centerYAnchor];
  id v21 = objc_msgSend(v23, "constraintEqualToAnchor:");
  v47[1] = v21;
  id v20 = [v43 widthAnchor];
  id v19 = [v20 constraintEqualToConstant:40.0];
  v47[2] = v19;
  id v18 = [v43 heightAnchor];
  id v17 = [v18 constraintEqualToConstant:24.0];
  v47[3] = v17;
  v47[4] = v41;
  id v16 = [v42 trailingAnchor];
  id v15 = [v44 trailingAnchor];
  id v14 = objc_msgSend(v16, "constraintEqualToAnchor:");
  v47[5] = v14;
  id v13 = [v42 centerYAnchor];
  id v12 = [v44 centerYAnchor];
  id v11 = objc_msgSend(v13, "constraintEqualToAnchor:");
  v47[6] = v11;
  id v10 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v47, 7LL);

  objc_destroyWeak(&v39);
  objc_destroyWeak(&from);
  objc_storeStrong(&v41, 0LL);
  objc_storeStrong(&v42, 0LL);
  objc_storeStrong(&v43, 0LL);
  objc_storeStrong(&v44, 0LL);
  objc_storeStrong(location, 0LL);
  return v10;
}

- (void).cxx_destruct
{
}

@end
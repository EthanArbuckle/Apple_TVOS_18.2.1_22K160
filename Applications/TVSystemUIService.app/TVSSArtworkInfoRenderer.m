@interface TVSSArtworkInfoRenderer
- (BOOL)hasSquareArtwork;
- (id)_textColorForTitle:(BOOL)a3 interfaceStyle:(int64_t)a4 state:(unint64_t)a5;
- (id)_textCompositingFilterForInterfaceStyle:(int64_t)a3 state:(unint64_t)a4;
- (id)layoutConstraintsWithSubviews:(id)a3 contentView:(id)a4;
- (id)stylingForState:(unint64_t)a3 identifier:(id)a4;
- (id)subviewIdentifiersWantingAutolayout;
- (unint64_t)artworkContentMode;
- (void)setArtworkContentMode:(unint64_t)a3;
@end

@implementation TVSSArtworkInfoRenderer

- (id)subviewIdentifiersWantingAutolayout
{
  v10 = self;
  v9[1] = (id)a2;
  v3 = objc_alloc(&OBJC_CLASS___NSMutableSet);
  v8.receiver = v10;
  v8.super_class = (Class)&OBJC_CLASS___TVSSArtworkInfoRenderer;
  id v4 = -[TVSSArtworkInfoRenderer subviewIdentifiersWantingAutolayout](&v8, "subviewIdentifiersWantingAutolayout");
  v9[0] = -[NSMutableSet initWithArray:](v3, "initWithArray:");

  id v5 = v9[0];
  id v6 = +[TVSPIdentifiers image1ID](&OBJC_CLASS___TVSPIdentifiers, "image1ID");
  objc_msgSend(v5, "addObject:");

  id v7 = [v9[0] allObjects];
  objc_storeStrong(v9, 0LL);
  return v7;
}

- (id)layoutConstraintsWithSubviews:(id)a3 contentView:(id)a4
{
  v94 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v92 = 0LL;
  objc_storeStrong(&v92, a4);
  if (!v94->_verticalTextAlignmentGuide)
  {
    v56 = objc_alloc_init(&OBJC_CLASS___UILayoutGuide);
    verticalTextAlignmentGuide = v94->_verticalTextAlignmentGuide;
    v94->_verticalTextAlignmentGuide = v56;

    [v92 addLayoutGuide:v94->_verticalTextAlignmentGuide];
  }

  id v91 = [location[0] titleLabel];
  id v90 = [location[0] label1];
  id v89 = [location[0] imageView];
  id v88 = [location[0] imageView1];
  double v87 = 16.0;
  double v86 = 12.0;
  double v85 = 24.0;
  char v84 = +[TVSSConstants isScaledUI](&OBJC_CLASS___TVSSConstants, "isScaledUI");
  if (v84)
  {
    *(void *)&__int128 v83 = 0x4052800000000000LL;
    *((void *)&v83 + 1) = 0x4052800000000000LL;
  }

  else
  {
    *(void *)&__int128 v83 = 0x4050000000000000LL;
    *((void *)&v83 + 1) = 0x4050000000000000LL;
  }

  if ((v84 & 1) != 0) {
    *(void *)&__int128 v82 = 0x4060800000000000LL;
  }
  else {
    *(void *)&__int128 v82 = 0x405C800000000000LL;
  }
  *((void *)&v82 + 1) = 0x4050000000000000LL;
  if ((v84 & 1) != 0)
  {
    double v80 = 40.0;
    double v81 = 24.0;
  }

  else
  {
    double v80 = 35.0;
    double v81 = 21.0;
  }

  if ((v84 & 1) != 0)
  {
    double v78 = 5.0;
    double v79 = 6.0;
  }

  else
  {
    double v78 = 4.0;
    double v79 = 5.0;
  }

  id v55 = [v91 bottomAnchor];
  id v54 = [v90 topAnchor];
  id v77 = objc_msgSend(v55, "constraintEqualToAnchor:");

  id v53 = [v91 bottomAnchor];
  v52 = -[UILayoutGuide bottomAnchor](v94->_verticalTextAlignmentGuide, "bottomAnchor");
  id v76 = objc_msgSend(v53, "constraintEqualToAnchor:");

  id v51 = [v89 widthAnchor];
  id v75 = [v51 constraintEqualToConstant:*(double *)&v82];

  id v50 = [v89 heightAnchor];
  id v74 = [v50 constraintEqualToConstant:*((double *)&v82 + 1)];

  v49 = -[UILayoutGuide leadingAnchor](v94->_verticalTextAlignmentGuide, "leadingAnchor");
  id v48 = [v89 trailingAnchor];
  id v73 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v49, "constraintEqualToAnchor:constant:", 12.0);

  objc_initWeak(&from, v94);
  v47 = v94;
  v59 = _NSConcreteStackBlock;
  int v60 = -1073741824;
  int v61 = 0;
  v62 = sub_10004E9E0;
  v63 = &unk_1001B7B78;
  id v64 = v77;
  id v65 = v76;
  objc_copyWeak(&v69, &from);
  id v66 = v75;
  __int128 v70 = v83;
  __int128 v71 = v82;
  id v67 = v74;
  id v68 = v73;
  -[TVSSArtworkInfoRenderer setUpdateAutoLayoutForContentHandler:](v47, "setUpdateAutoLayoutForContentHandler:", &v59);
  id v46 = [v89 leadingAnchor];
  id v45 = [v92 leadingAnchor];
  id v44 = objc_msgSend(v46, "constraintEqualToAnchor:constant:", 16.0);
  v95[0] = v44;
  id v43 = [v89 centerYAnchor];
  id v42 = [v92 centerYAnchor];
  id v41 = objc_msgSend(v43, "constraintEqualToAnchor:");
  v95[1] = v41;
  v95[2] = v75;
  v95[3] = v74;
  id v40 = [v88 bottomAnchor];
  id v39 = [v89 bottomAnchor];
  id v38 = objc_msgSend(v40, "constraintEqualToAnchor:constant:", v79);
  v95[4] = v38;
  id v37 = [v88 trailingAnchor];
  id v36 = [v89 trailingAnchor];
  id v35 = objc_msgSend(v37, "constraintEqualToAnchor:constant:", v78);
  v95[5] = v35;
  id v34 = [v88 widthAnchor];
  id v33 = [v34 constraintEqualToConstant:v80];
  v95[6] = v33;
  id v32 = [v88 heightAnchor];
  id v31 = [v32 constraintEqualToConstant:v81];
  v95[7] = v31;
  v95[8] = v73;
  v30 = -[UILayoutGuide trailingAnchor](v94->_verticalTextAlignmentGuide, "trailingAnchor");
  id v29 = [v92 trailingAnchor];
  id v28 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v30, "constraintEqualToAnchor:constant:", -24.0);
  v95[9] = v28;
  v27 = -[UILayoutGuide centerYAnchor](v94->_verticalTextAlignmentGuide, "centerYAnchor");
  id v26 = [v92 centerYAnchor];
  id v25 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v27, "constraintEqualToAnchor:");
  v95[10] = v25;
  id v24 = [v91 topAnchor];
  v23 = -[UILayoutGuide topAnchor](v94->_verticalTextAlignmentGuide, "topAnchor");
  id v22 = objc_msgSend(v24, "constraintEqualToAnchor:");
  v95[11] = v22;
  id v21 = [v91 leadingAnchor];
  v20 = -[UILayoutGuide leadingAnchor](v94->_verticalTextAlignmentGuide, "leadingAnchor");
  id v19 = objc_msgSend(v21, "constraintEqualToAnchor:");
  v95[12] = v19;
  id v18 = [v91 trailingAnchor];
  v17 = -[UILayoutGuide trailingAnchor](v94->_verticalTextAlignmentGuide, "trailingAnchor");
  id v16 = objc_msgSend(v18, "constraintEqualToAnchor:");
  v95[13] = v16;
  id v15 = [v90 leadingAnchor];
  v14 = -[UILayoutGuide leadingAnchor](v94->_verticalTextAlignmentGuide, "leadingAnchor");
  id v13 = objc_msgSend(v15, "constraintEqualToAnchor:");
  v95[14] = v13;
  id v12 = [v90 trailingAnchor];
  v11 = -[UILayoutGuide trailingAnchor](v94->_verticalTextAlignmentGuide, "trailingAnchor");
  id v10 = objc_msgSend(v12, "constraintEqualToAnchor:");
  v95[15] = v10;
  id v9 = [v90 bottomAnchor];
  objc_super v8 = -[UILayoutGuide bottomAnchor](v94->_verticalTextAlignmentGuide, "bottomAnchor");
  id v7 = objc_msgSend(v9, "constraintEqualToAnchor:");
  v95[16] = v7;
  id v58 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v95, 17LL);

  id v6 = v58;
  objc_storeStrong(&v58, 0LL);
  objc_storeStrong(&v68, 0LL);
  objc_storeStrong(&v67, 0LL);
  objc_storeStrong(&v66, 0LL);
  objc_destroyWeak(&v69);
  objc_storeStrong(&v65, 0LL);
  objc_storeStrong(&v64, 0LL);
  objc_destroyWeak(&from);
  objc_storeStrong(&v73, 0LL);
  objc_storeStrong(&v74, 0LL);
  objc_storeStrong(&v75, 0LL);
  objc_storeStrong(&v76, 0LL);
  objc_storeStrong(&v77, 0LL);
  objc_storeStrong(&v88, 0LL);
  objc_storeStrong(&v89, 0LL);
  objc_storeStrong(&v90, 0LL);
  objc_storeStrong(&v91, 0LL);
  objc_storeStrong(&v92, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

- (id)stylingForState:(unint64_t)a3 identifier:(id)a4
{
  id v31 = self;
  SEL v30 = a2;
  unint64_t v29 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  id v17 = location;
  id v18 = +[TVSPIdentifiers titleID](&OBJC_CLASS___TVSPIdentifiers, "titleID");
  unsigned __int8 v19 = objc_msgSend(v17, "isEqualToString:");

  char v27 = v19 & 1;
  id v20 = location;
  id v21 = +[TVSPIdentifiers text1ID](&OBJC_CLASS___TVSPIdentifiers, "text1ID");
  unsigned __int8 v22 = objc_msgSend(v20, "isEqualToString:");

  char v26 = v22 & 1;
  if ((v19 & 1) != 0 || (v26 & 1) != 0)
  {
    id v25 = -[TVSSArtworkInfoRenderer effectiveUserInterfaceStyle](v31, "effectiveUserInterfaceStyle");
    id v16 = +[TVSPIdentifiers text1ID](&OBJC_CLASS___TVSPIdentifiers, "text1ID");
    id v15 = +[TVSPLabelAttribute numberOfLines:](&OBJC_CLASS___TVSPLabelAttribute, "numberOfLines:", 1LL);
    v33[0] = v15;
    id v14 =  +[TVSPLabelAttribute adjustsFontSizeToFitWidth:]( &OBJC_CLASS___TVSPLabelAttribute,  "adjustsFontSizeToFitWidth:",  0LL);
    v33[1] = v14;
    id v13 =  +[TVSPLabelAttribute adjustsFontForContentSizeCategory:]( &OBJC_CLASS___TVSPLabelAttribute,  "adjustsFontForContentSizeCategory:",  0LL);
    v33[2] = v13;
    if ((v27 & 1) != 0) {
      uint64_t v4 = 5LL;
    }
    else {
      uint64_t v4 = 6LL;
    }
    id v12 = +[TVSPLabelAttribute textStyle:](&OBJC_CLASS___TVSPLabelAttribute, "textStyle:", v4);
    v33[3] = v12;
    id v11 =  +[TVSPLabelAttribute enablesMarqueeWhenAncestorFocused:]( &OBJC_CLASS___TVSPLabelAttribute,  "enablesMarqueeWhenAncestorFocused:",  1LL);
    v33[4] = v11;
    id v10 =  -[TVSSArtworkInfoRenderer _textColorForTitle:interfaceStyle:state:]( v31,  "_textColorForTitle:interfaceStyle:state:",  v27 & 1,  v25,  v29);
    id v9 = +[TVSPLabelAttribute textColor:](&OBJC_CLASS___TVSPLabelAttribute, "textColor:");
    v33[5] = v9;
    id v8 =  -[TVSSArtworkInfoRenderer _textCompositingFilterForInterfaceStyle:state:]( v31,  "_textCompositingFilterForInterfaceStyle:state:",  v25,  v29);
    id v7 = +[TVSPLayerAttribute compositingFilter:](&OBJC_CLASS___TVSPLayerAttribute, "compositingFilter:");
    v33[6] = v7;
    id v6 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 7LL);
    id v32 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v16);

    int v24 = 1;
  }

  else
  {
    v23.receiver = v31;
    v23.super_class = (Class)&OBJC_CLASS___TVSSArtworkInfoRenderer;
    id v32 = (TVSPStyling *) -[TVSSArtworkInfoRenderer stylingForState:identifier:]( &v23,  "stylingForState:identifier:",  v29,  location);
    int v24 = 1;
  }

  objc_storeStrong(&location, 0LL);
  return v32;
}

- (id)_textColorForTitle:(BOOL)a3 interfaceStyle:(int64_t)a4 state:(unint64_t)a5
{
  id v21 = self;
  SEL v20 = a2;
  BOOL v19 = a3;
  int64_t v18 = a4;
  unint64_t v17 = a5;
  char v14 = 0;
  char v12 = 0;
  if (a3)
  {
    id v15 = +[UIColor secondaryLabelColor](&OBJC_CLASS___UIColor, "secondaryLabelColor");
    char v14 = 1;
    id v5 = v15;
  }

  else
  {
    id v13 = +[UIColor tertiaryLabelColor](&OBJC_CLASS___UIColor, "tertiaryLabelColor");
    char v12 = 1;
    id v5 = v13;
  }

  id location = v5;
  if ((v12 & 1) != 0) {

  }
  if ((v14 & 1) != 0) {
  if (v17 == 8 || v17 == 1)
  }
  {
    char v10 = 0;
    char v8 = 0;
    if (v19)
    {
      id v11 = +[TVSPConstants defaultFocusedTextColor](&OBJC_CLASS___TVSPConstants, "defaultFocusedTextColor");
      char v10 = 1;
      id v6 = v11;
    }

    else
    {
      id v9 =  +[TVSPConstants defaultLightModeDetailTextColor]( &OBJC_CLASS___TVSPConstants,  "defaultLightModeDetailTextColor");
      char v8 = 1;
      id v6 = v9;
    }

    id v22 = v6;
    if ((v8 & 1) != 0) {

    }
    if ((v10 & 1) != 0) {
  }
    }

  else
  {
    id v22 = location;
  }

  objc_storeStrong(&location, 0LL);
  return v22;
}

- (id)_textCompositingFilterForInterfaceStyle:(int64_t)a3 state:(unint64_t)a4
{
  if ((a4 & 8) != 0) {
    return 0LL;
  }
  if (a3 == 2) {
    return +[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterPlusL);
  }
  return +[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterPlusD);
}

- (BOOL)hasSquareArtwork
{
  char v8 = self;
  location[1] = (id)a2;
  if (self->_artworkContentMode)
  {
    return v8->_artworkContentMode == 2;
  }

  else
  {
    id v5 = -[TVSSArtworkInfoRenderer content](v8, "content");
    location[0] = [v5 contentImage];

    [location[0] size];
    BOOL v6 = 0;
    if (location[0]) {
      BOOL v6 = v2 <= v3;
    }
    BOOL v9 = v6;
    objc_storeStrong(location, 0LL);
  }

  return v9;
}

- (unint64_t)artworkContentMode
{
  return self->_artworkContentMode;
}

- (void)setArtworkContentMode:(unint64_t)a3
{
  self->_artworkContentMode = a3;
}

- (void).cxx_destruct
{
}

@end
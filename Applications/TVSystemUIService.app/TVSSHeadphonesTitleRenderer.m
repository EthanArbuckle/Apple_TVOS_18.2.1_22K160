@interface TVSSHeadphonesTitleRenderer
+ (id)rendererWithIdentifier:(id)a3 format:(int64_t)a4 content:(id)a5 headphonesController:(id)a6 mediaPlayerView:(id)a7;
- (BOOL)isFocusable;
- (TVSSHeadphonesController)headphonesController;
- (TVSSHeadphonesMediaPlayerView)mediaPlayerView;
- (TVSSHeadphonesTitleRenderer)initWithIdentifier:(id)a3 format:(int64_t)a4 content:(id)a5 headphonesController:(id)a6 mediaPlayerView:(id)a7;
- (id)detailTextColorForInterfaceStyle:(int64_t)a3 state:(unint64_t)a4;
- (id)layoutConstraintsWithSubviews:(id)a3 contentView:(id)a4;
- (id)overrideStylingForIdentifier:(id)a3;
- (id)stylingForState:(unint64_t)a3 identifier:(id)a4;
- (id)subviewIdentifiersWantingAutolayout;
- (int64_t)materialStyle;
- (void)configureContentView:(id)a3;
- (void)setHeadphonesController:(id)a3;
- (void)setMediaPlayerView:(id)a3;
@end

@implementation TVSSHeadphonesTitleRenderer

+ (id)rendererWithIdentifier:(id)a3 format:(int64_t)a4 content:(id)a5 headphonesController:(id)a6 mediaPlayerView:(id)a7
{
  Class v19 = (Class)a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  int64_t v17 = a4;
  id v16 = 0LL;
  objc_storeStrong(&v16, a5);
  id v15 = 0LL;
  objc_storeStrong(&v15, a6);
  id v14 = 0LL;
  objc_storeStrong(&v14, a7);
  id v7 = objc_alloc(v19);
  id v13 = [v7 initWithIdentifier:location[0] format:v17 content:v16 headphonesController:v15 mediaPlayerView:v14];
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(location, 0LL);
  return v13;
}

- (TVSSHeadphonesTitleRenderer)initWithIdentifier:(id)a3 format:(int64_t)a4 content:(id)a5 headphonesController:(id)a6 mediaPlayerView:(id)a7
{
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  int64_t v18 = a4;
  id v17 = 0LL;
  objc_storeStrong(&v17, a5);
  id v16 = 0LL;
  objc_storeStrong(&v16, a6);
  id v15 = 0LL;
  objc_storeStrong(&v15, a7);
  id v7 = v20;
  v20 = 0LL;
  v14.receiver = v7;
  v14.super_class = (Class)&OBJC_CLASS___TVSSHeadphonesTitleRenderer;
  v20 = -[TVSSHeadphonesTitleRenderer initWithIdentifier:format:content:overrideStylings:]( &v14,  "initWithIdentifier:format:content:overrideStylings:",  location[0],  v18,  v17,  &__NSArray0__struct);
  objc_storeStrong((id *)&v20, v20);
  if (v20)
  {
    -[TVSSHeadphonesTitleRenderer setHeadphonesController:](v20, "setHeadphonesController:", v16);
    -[TVSSHeadphonesTitleRenderer setMediaPlayerView:](v20, "setMediaPlayerView:", v15);
  }

  v9 = v20;
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v20, 0LL);
  return v9;
}

- (int64_t)materialStyle
{
  return 0LL;
}

- (id)overrideStylingForIdentifier:(id)a3
{
  v29 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  *(_DWORD *)&v27[8] = 0;
  id v25 = location[0];
  id v26 = +[TVSPIdentifiers titleID](&OBJC_CLASS___TVSPIdentifiers, "titleID");
  *(void *)v27 = objc_msgSend(v25, "isEqualToString:");

  if ((v27[0] & 1) != 0)
  {
    id v20 = location[0];
    id v24 = +[TVSPLabelAttribute marqueeEnabled:](&OBJC_CLASS___TVSPLabelAttribute, "marqueeEnabled:", 1LL);
    v31[0] = v24;
    id v23 = +[TVSPLabelAttribute marqueeRunning:](&OBJC_CLASS___TVSPLabelAttribute, "marqueeRunning:", 1LL);
    v31[1] = v23;
    id v22 = +[TVSPLabelAttribute textStyle:](&OBJC_CLASS___TVSPLabelAttribute, "textStyle:");
    v31[2] = v22;
    v21 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 3LL);
    v3 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v20);
    v4 = *(void **)&v27[4];
    *(void *)&v27[4] = v3;
  }

  id v17 = location[0];
  id v18 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
  unsigned __int8 v19 = objc_msgSend(v17, "isEqualToString:");

  if ((v19 & 1) != 0)
  {
    id v10 = location[0];
    id v16 = -[TVSSHeadphonesTitleRenderer mediaPlayerView](v29, "mediaPlayerView");
    id v15 = +[TVSPViewAttribute alpha:](&OBJC_CLASS___TVSPViewAttribute, "alpha:", (double)(v16 == 0LL));
    v30[0] = v15;
    id v14 = -[TVSSHeadphonesTitleRenderer content](v29, "content");
    id v13 = [v14 contentImage];
    else {
      uint64_t v5 = 1LL;
    }
    id v12 = +[TVSPViewAttribute contentMode:](&OBJC_CLASS___TVSPViewAttribute, "contentMode:", v5);
    v30[1] = v12;
    v11 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 2LL);
    v6 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v10);
    id v7 = *(void **)&v27[4];
    *(void *)&v27[4] = v6;
  }

  id v9 = *(id *)&v27[4];
  objc_storeStrong((id *)&v27[4], 0LL);
  objc_storeStrong(location, 0LL);
  return v9;
}

- (BOOL)isFocusable
{
  return 0;
}

- (id)stylingForState:(unint64_t)a3 identifier:(id)a4
{
  v43 = self;
  SEL v42 = a2;
  unint64_t v41 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  id v25 = location;
  id v26 = +[TVSPIdentifiers image1ID](&OBJC_CLASS___TVSPIdentifiers, "image1ID");
  char v38 = 0;
  char v36 = 0;
  unsigned __int8 v27 = 1;
  if ((objc_msgSend(v25, "isEqualToString:") & 1) == 0)
  {
    id v24 = location;
    id v39 = +[TVSPIdentifiers image2ID](&OBJC_CLASS___TVSPIdentifiers, "image2ID");
    char v38 = 1;
    unsigned __int8 v27 = 1;
    if ((objc_msgSend(v24, "isEqualToString:") & 1) == 0)
    {
      id v23 = location;
      id v37 = +[TVSPIdentifiers image3ID](&OBJC_CLASS___TVSPIdentifiers, "image3ID");
      char v36 = 1;
      unsigned __int8 v27 = objc_msgSend(v23, "isEqualToString:");
    }
  }

  if ((v36 & 1) != 0) {

  }
  if ((v38 & 1) != 0) {
  if ((v27 & 1) != 0)
  }
  {
    id v18 = +[UITraitCollection _tvspMainSceneTraits](&OBJC_CLASS___UITraitCollection, "_tvspMainSceneTraits");
    id v19 = [v18 userInterfaceStyle];

    id v35 = v19;
    BOOL v34 = v19 == (id)2;
    id v33 = +[TVSPConstants fontForTextStyle:](&OBJC_CLASS___TVSPConstants, "fontForTextStyle:", 6LL);
    id v20 = location;
    id v21 =  -[TVSSHeadphonesTitleRenderer detailTextColorForInterfaceStyle:state:]( v43,  "detailTextColorForInterfaceStyle:state:",  v19,  v41);
    id v22 = +[TVSPViewAttribute tintColor:](&OBJC_CLASS___TVSPViewAttribute, "tintColor:");
    v45[0] = v22;
    if (v19 == (id)2) {
      uint64_t v17 = kCAFilterPlusL;
    }
    else {
      uint64_t v17 = kCAFilterPlusD;
    }
    id v16 = +[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", v17);
    id v15 = +[TVSPLayerAttribute compositingFilter:](&OBJC_CLASS___TVSPLayerAttribute, "compositingFilter:");
    v45[1] = v15;
    id v14 =  +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:",  v33,  2LL);
    id v13 = +[TVSPImageAttribute symbolConfiguration:](&OBJC_CLASS___TVSPImageAttribute, "symbolConfiguration:");
    v45[2] = v13;
    id v12 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v45, 3LL);
    v44 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v20);

    int v32 = 1;
    objc_storeStrong(&v33, 0LL);
  }

  else
  {
    id v9 = location;
    id v10 = +[TVSPIdentifiers text2ID](&OBJC_CLASS___TVSPIdentifiers, "text2ID");
    char v30 = 0;
    unsigned __int8 v11 = 1;
    if ((objc_msgSend(v9, "isEqualToString:") & 1) == 0)
    {
      id v8 = location;
      id v31 = +[TVSPIdentifiers text3ID](&OBJC_CLASS___TVSPIdentifiers, "text3ID");
      char v30 = 1;
      unsigned __int8 v11 = objc_msgSend(v8, "isEqualToString:");
    }

    if ((v30 & 1) != 0) {

    }
    if ((v11 & 1) != 0)
    {
      uint64_t v5 = v43;
      unint64_t v6 = v41;
      id v7 = +[TVSPIdentifiers text1ID](&OBJC_CLASS___TVSPIdentifiers, "text1ID");
      v29.receiver = v5;
      v29.super_class = (Class)&OBJC_CLASS___TVSSHeadphonesTitleRenderer;
      v44 = (TVSPStyling *) -[TVSSHeadphonesTitleRenderer stylingForState:identifier:]( &v29,  "stylingForState:identifier:",  v6);
    }

    else
    {
      v28.receiver = v43;
      v28.super_class = (Class)&OBJC_CLASS___TVSSHeadphonesTitleRenderer;
      v44 = (TVSPStyling *) -[TVSSHeadphonesTitleRenderer stylingForState:identifier:]( &v28,  "stylingForState:identifier:",  v41,  location);
    }

    int v32 = 1;
  }

  objc_storeStrong(&location, 0LL);
  return v44;
}

- (void)configureContentView:(id)a3
{
  id v21 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v19.receiver = v21;
  v19.super_class = (Class)&OBJC_CLASS___TVSSHeadphonesTitleRenderer;
  -[TVSSHeadphonesTitleRenderer configureContentView:](&v19, "configureContentView:", location[0]);
  id v18 = -[TVSSHeadphonesTitleRenderer mediaPlayerView](v21, "mediaPlayerView");
  if (v18)
  {
    [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
    [location[0] addSubview:v18];
    id v3 = -[TVSSHeadphonesTitleRenderer subviews](v21, "subviews");
    id v17 = [v3 imageView];

    id v15 = [v18 centerXAnchor];
    id v14 = [v17 centerXAnchor];
    id v13 = objc_msgSend(v15, "constraintEqualToAnchor:");
    v22[0] = v13;
    id v12 = [v18 centerYAnchor];
    id v11 = [v17 centerYAnchor];
    id v10 = objc_msgSend(v12, "constraintEqualToAnchor:");
    v22[1] = v10;
    id v9 = [v18 widthAnchor];
    id v8 = [v17 widthAnchor];
    id v7 = objc_msgSend(v9, "constraintEqualToAnchor:");
    v22[2] = v7;
    id v6 = [v18 heightAnchor];
    id v5 = [v17 heightAnchor];
    id v4 = objc_msgSend(v6, "constraintEqualToAnchor:");
    v22[3] = v4;
    id v16 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 4LL);

    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v16);
    objc_storeStrong((id *)&v16, 0LL);
    objc_storeStrong(&v17, 0LL);
  }

  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)layoutConstraintsWithSubviews:(id)a3 contentView:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v91 = 0LL;
  objc_storeStrong(&v91, a4);
  id v90 = [location[0] titleLabel];
  id v89 = [location[0] label1];
  id v88 = [location[0] imageView];
  id v87 = [location[0] imageView1];
  id v86 = [location[0] label2];
  id v85 = [location[0] imageView2];
  id v84 = [location[0] label3];
  id v83 = [location[0] imageView3];
  id v82 = [location[0] verticalTextAlignmentView];
  objc_msgSend(v88, "setContentCompressionResistancePriority:forAxis:");
  LODWORD(v4) = 1148846080;
  objc_msgSend(v88, "setContentCompressionResistancePriority:forAxis:", v4);
  LODWORD(v5) = 1148846080;
  [v88 setContentHuggingPriority:0 forAxis:v5];
  LODWORD(v6) = 1148846080;
  [v88 setContentHuggingPriority:1 forAxis:v6];
  LODWORD(v7) = 1148846080;
  [v90 setContentCompressionResistancePriority:1 forAxis:v7];
  LODWORD(v8) = 1148846080;
  [v89 setContentCompressionResistancePriority:1 forAxis:v8];
  +[TVSPConstants defaultSpacerWidth](&OBJC_CLASS___TVSPConstants, "defaultSpacerWidth");
  double v81 = v9;
  id v78 = [v88 widthAnchor];
  id v77 = objc_msgSend(v78, "constraintEqualToConstant:");
  v93[0] = v77;
  id v76 = [v88 heightAnchor];
  id v75 = [v76 constraintEqualToConstant:64.0];
  v93[1] = v75;
  id v74 = [v88 leadingAnchor];
  id v73 = [v91 leadingAnchor];
  id v72 = objc_msgSend(v74, "constraintEqualToAnchor:constant:", v81);
  v93[2] = v72;
  id v71 = [v88 centerYAnchor];
  id v70 = [v82 centerYAnchor];
  id v69 = objc_msgSend(v71, "constraintEqualToAnchor:");
  v93[3] = v69;
  id v68 = [v82 centerYAnchor];
  id v67 = [v91 centerYAnchor];
  id v66 = objc_msgSend(v68, "constraintEqualToAnchor:");
  v93[4] = v66;
  id v65 = [v82 leadingAnchor];
  id v64 = [v88 trailingAnchor];
  id v63 = objc_msgSend(v65, "constraintEqualToAnchor:constant:", 12.0);
  v93[5] = v63;
  id v62 = [v82 trailingAnchor];
  id v61 = [v91 trailingAnchor];
  id v60 = objc_msgSend(v62, "constraintEqualToAnchor:constant:", -20.0);
  v93[6] = v60;
  id v59 = [v90 topAnchor];
  id v58 = [v82 topAnchor];
  id v57 = objc_msgSend(v59, "constraintEqualToAnchor:");
  v93[7] = v57;
  id v56 = [v90 leadingAnchor];
  id v55 = [v82 leadingAnchor];
  id v54 = objc_msgSend(v56, "constraintEqualToAnchor:");
  v93[8] = v54;
  id v53 = [v90 trailingAnchor];
  id v52 = [v82 trailingAnchor];
  id v51 = objc_msgSend(v53, "constraintEqualToAnchor:");
  v93[9] = v51;
  id v50 = [v89 topAnchor];
  id v49 = [v90 bottomAnchor];
  id v48 = objc_msgSend(v50, "constraintEqualToAnchor:constant:", 2.0);
  v93[10] = v48;
  id v47 = [v89 leadingAnchor];
  id v46 = [v82 leadingAnchor];
  id v45 = objc_msgSend(v47, "constraintEqualToAnchor:");
  v93[11] = v45;
  id v44 = [v89 bottomAnchor];
  id v43 = [v82 bottomAnchor];
  id v42 = objc_msgSend(v44, "constraintEqualToAnchor:");
  v93[12] = v42;
  id v41 = [v87 leadingAnchor];
  id v40 = [v89 trailingAnchor];
  id v39 = objc_msgSend(v41, "constraintEqualToAnchor:constant:");
  v93[13] = v39;
  id v38 = [v87 centerYAnchor];
  id v37 = [v89 centerYAnchor];
  id v36 = objc_msgSend(v38, "constraintEqualToAnchor:");
  v93[14] = v36;
  id v35 = [v85 leadingAnchor];
  id v34 = [v88 trailingAnchor];
  id v33 = objc_msgSend(v35, "constraintEqualToAnchor:constant:", v81);
  v93[15] = v33;
  id v32 = [v85 firstBaselineAnchor];
  id v31 = [v86 firstBaselineAnchor];
  id v30 = objc_msgSend(v32, "constraintEqualToAnchor:");
  v93[16] = v30;
  id v29 = [v86 leadingAnchor];
  id v28 = [v85 trailingAnchor];
  id v27 = objc_msgSend(v29, "constraintEqualToAnchor:");
  v93[17] = v27;
  id v26 = [v86 centerYAnchor];
  id v25 = [v89 centerYAnchor];
  id v24 = objc_msgSend(v26, "constraintEqualToAnchor:");
  v93[18] = v24;
  id v23 = [v83 leadingAnchor];
  id v22 = [v86 trailingAnchor];
  id v21 = objc_msgSend(v23, "constraintEqualToAnchor:constant:", 5.0);
  v93[19] = v21;
  id v20 = [v83 firstBaselineAnchor];
  id v19 = [v84 firstBaselineAnchor];
  id v18 = objc_msgSend(v20, "constraintEqualToAnchor:");
  v93[20] = v18;
  id v17 = [v84 leadingAnchor];
  id v16 = [v83 trailingAnchor];
  id v15 = objc_msgSend(v17, "constraintEqualToAnchor:");
  v93[21] = v15;
  id v14 = [v84 centerYAnchor];
  id v13 = [v89 centerYAnchor];
  id v12 = objc_msgSend(v14, "constraintEqualToAnchor:");
  v93[22] = v12;
  id v80 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v93, 23LL);

  id v79 = v80;
  objc_storeStrong(&v80, 0LL);
  objc_storeStrong(&v82, 0LL);
  objc_storeStrong(&v83, 0LL);
  objc_storeStrong(&v84, 0LL);
  objc_storeStrong(&v85, 0LL);
  objc_storeStrong(&v86, 0LL);
  objc_storeStrong(&v87, 0LL);
  objc_storeStrong(&v88, 0LL);
  objc_storeStrong(&v89, 0LL);
  objc_storeStrong(&v90, 0LL);
  objc_storeStrong(&v91, 0LL);
  objc_storeStrong(location, 0LL);
  return v79;
}

- (id)subviewIdentifiersWantingAutolayout
{
  id v12 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
  v13[0] = v12;
  id v11 = +[TVSPIdentifiers titleID](&OBJC_CLASS___TVSPIdentifiers, "titleID");
  v13[1] = v11;
  id v10 = +[TVSPIdentifiers text1ID](&OBJC_CLASS___TVSPIdentifiers, "text1ID");
  v13[2] = v10;
  id v9 = +[TVSPIdentifiers image1ID](&OBJC_CLASS___TVSPIdentifiers, "image1ID");
  v13[3] = v9;
  id v8 = +[TVSPIdentifiers text2ID](&OBJC_CLASS___TVSPIdentifiers, "text2ID");
  v13[4] = v8;
  id v7 = +[TVSPIdentifiers image2ID](&OBJC_CLASS___TVSPIdentifiers, "image2ID");
  v13[5] = v7;
  id v6 = +[TVSPIdentifiers text3ID](&OBJC_CLASS___TVSPIdentifiers, "text3ID");
  v13[6] = v6;
  id v5 = +[TVSPIdentifiers image3ID](&OBJC_CLASS___TVSPIdentifiers, "image3ID");
  v13[7] = v5;
  id v3 = +[TVSPSubviews verticalTextAlignmentViewID](&OBJC_CLASS___TVSPSubviews, "verticalTextAlignmentViewID");
  v13[8] = v3;
  double v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 9LL);

  return v4;
}

- (id)detailTextColorForInterfaceStyle:(int64_t)a3 state:(unint64_t)a4
{
  if (a3 != 2 || a4 == 8 || a4 == 1) {
    return   +[TVSPConstants defaultLightModeDetailTextColor]( &OBJC_CLASS___TVSPConstants,  "defaultLightModeDetailTextColor");
  }
  else {
    return   +[TVSPConstants defaultDarkModeDetailTextColor]( &OBJC_CLASS___TVSPConstants,  "defaultDarkModeDetailTextColor");
  }
}

- (TVSSHeadphonesController)headphonesController
{
  return self->_headphonesController;
}

- (void)setHeadphonesController:(id)a3
{
}

- (TVSSHeadphonesMediaPlayerView)mediaPlayerView
{
  return self->_mediaPlayerView;
}

- (void)setMediaPlayerView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
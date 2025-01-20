@interface TVSSAudioRouteRenderer
+ (id)rendererWithAudioRoute:(id)a3;
- (UIActivityIndicatorView)spinnerView;
- (id)detailTextColorForInterfaceStyle:(int64_t)a3 state:(unint64_t)a4;
- (id)detailTextCompositingFilterForInterfaceStyle:(int64_t)a3 state:(unint64_t)a4;
- (id)layoutConstraintsWithSubviews:(id)a3 contentView:(id)a4;
- (id)overrideStylingForIdentifier:(id)a3;
- (id)stylingForState:(unint64_t)a3 identifier:(id)a4;
- (id)subviewIdentifiersWantingAutolayout;
- (int64_t)_effectiveUserInterfaceStyleForStyle:(int64_t)a3 state:(unint64_t)a4;
- (void)applyContent:(id)a3 animator:(id)a4;
- (void)applyStylingsWithAnimator:(id)a3;
- (void)configureContentView:(id)a3;
- (void)setSpinnerView:(id)a3;
@end

@implementation TVSSAudioRouteRenderer

+ (id)rendererWithAudioRoute:(id)a3
{
  Class v9 = (Class)a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = objc_alloc(v9);
  id v6 = [location[0] route];
  id v5 = [v6 routeUID];
  id v7 = objc_msgSend(v4, "initWithIdentifier:format:content:overrideStylings:");

  objc_storeStrong(location, 0LL);
  return v7;
}

- (void)configureContentView:(id)a3
{
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v18.receiver = v20;
  v18.super_class = (Class)&OBJC_CLASS___TVSSAudioRouteRenderer;
  -[TVSSAudioRouteRenderer configureContentView:](&v18, "configureContentView:", location[0]);
  id v17 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:16];
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v3 = +[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor");
  objc_msgSend(v17, "setColor:");

  objc_msgSend(v17, "_setCustomWidth:");
  -[TVSSAudioRouteRenderer setSpinnerView:](v20, "setSpinnerView:", v17);
  [location[0] addSubview:v17];
  id v4 = -[TVSSAudioRouteRenderer subviews](v20, "subviews");
  id v16 = [v4 imageView1];

  id v14 = [v17 centerXAnchor];
  id v13 = [v16 centerXAnchor];
  id v12 = objc_msgSend(v14, "constraintEqualToAnchor:");
  v21[0] = v12;
  id v11 = [v17 centerYAnchor];
  id v10 = [v16 centerYAnchor];
  id v9 = objc_msgSend(v11, "constraintEqualToAnchor:");
  v21[1] = v9;
  id v8 = [v17 widthAnchor];
  id v7 = [v8 constraintEqualToConstant:29.0];
  v21[2] = v7;
  id v6 = [v17 heightAnchor];
  id v5 = [v6 constraintEqualToConstant:29.0];
  v21[3] = v5;
  v15 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 4LL);

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v15);
  objc_storeStrong((id *)&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)applyContent:(id)a3 animator:(id)a4
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v11 = 0LL;
  objc_storeStrong(&v11, a4);
  v10.receiver = v13;
  v10.super_class = (Class)&OBJC_CLASS___TVSSAudioRouteRenderer;
  -[TVSSAudioRouteRenderer applyContent:animator:](&v10, "applyContent:animator:", location[0], v11);
  id v9 = -[TVSSAudioRouteRenderer content](v13, "content");
  id v7 = [v9 route];
  id v8 = [v7 selectionState];

  if (v8 == (id)2)
  {
    id v5 = -[TVSSAudioRouteRenderer spinnerView](v13, "spinnerView");
    -[UIActivityIndicatorView startAnimating](v5, "startAnimating");
  }

  else
  {
    id v4 = -[TVSSAudioRouteRenderer spinnerView](v13, "spinnerView");
    -[UIActivityIndicatorView stopAnimating](v4, "stopAnimating");
  }

  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)overrideStylingForIdentifier:(id)a3
{
  objc_super v18 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v16 = 0LL;
  id v12 = location[0];
  id v13 = +[TVSPIdentifiers image1ID](&OBJC_CLASS___TVSPIdentifiers, "image1ID");
  unsigned __int8 v14 = objc_msgSend(v12, "isEqualToString:");

  if ((v14 & 1) != 0)
  {
    id v15 = -[TVSSAudioRouteRenderer content](v18, "content");
    id v7 = [v15 route];
    id v8 = [v7 selectionState];

    id v9 = location[0];
    id v11 = +[TVSPViewAttribute alpha:](&OBJC_CLASS___TVSPViewAttribute, "alpha:", (double)(v8 != (id)2));
    id v19 = v11;
    objc_super v10 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL);
    id v3 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v9);
    id v4 = v16;
    id v16 = v3;

    objc_storeStrong(&v15, 0LL);
  }

  id v6 = v16;
  objc_storeStrong((id *)&v16, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

- (void)applyStylingsWithAnimator:(id)a3
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v9.receiver = v11;
  v9.super_class = (Class)&OBJC_CLASS___TVSSAudioRouteRenderer;
  -[TVSSAudioRouteRenderer applyStylingsWithAnimator:](&v9, "applyStylingsWithAnimator:", location[0]);
  id v7 = +[UITraitCollection _tvspMainSceneTraits](&OBJC_CLASS___UITraitCollection, "_tvspMainSceneTraits");
  id v8 = [v7 userInterfaceStyle];

  if ((id)-[TVSSAudioRouteRenderer _effectiveUserInterfaceStyleForStyle:state:]( v11,  "_effectiveUserInterfaceStyleForStyle:state:",  v8,  -[TVSSAudioRouteRenderer controlState](v11, "controlState")) == (id)2)
  {
    id v6 = +[TVSPConstants defaultDarkModeTextColor](&OBJC_CLASS___TVSPConstants, "defaultDarkModeTextColor");
    id v5 = -[TVSSAudioRouteRenderer spinnerView](v11, "spinnerView");
    -[UIActivityIndicatorView setColor:](v5, "setColor:", v6);
  }

  else
  {
    id v4 = +[TVSPConstants defaultLightModeTextColor](&OBJC_CLASS___TVSPConstants, "defaultLightModeTextColor");
    id v3 = -[TVSSAudioRouteRenderer spinnerView](v11, "spinnerView");
    -[UIActivityIndicatorView setColor:](v3, "setColor:", v4);
  }

  objc_storeStrong(location, 0LL);
}

- (id)stylingForState:(unint64_t)a3 identifier:(id)a4
{
  v54 = self;
  SEL v53 = a2;
  unint64_t v52 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  id v35 = location;
  id v36 = +[TVSPIdentifiers image2ID](&OBJC_CLASS___TVSPIdentifiers, "image2ID");
  char v49 = 0;
  char v47 = 0;
  unsigned __int8 v37 = 1;
  if ((objc_msgSend(v35, "isEqualToString:") & 1) == 0)
  {
    id v34 = location;
    id v50 = +[TVSPIdentifiers image3ID](&OBJC_CLASS___TVSPIdentifiers, "image3ID");
    char v49 = 1;
    unsigned __int8 v37 = 1;
    if ((objc_msgSend(v34, "isEqualToString:") & 1) == 0)
    {
      id v33 = location;
      id v48 = +[TVSPIdentifiers image4ID](&OBJC_CLASS___TVSPIdentifiers, "image4ID");
      char v47 = 1;
      unsigned __int8 v37 = objc_msgSend(v33, "isEqualToString:");
    }
  }

  if ((v47 & 1) != 0) {

  }
  if ((v49 & 1) != 0) {
  if ((v37 & 1) != 0)
  }
  {
    id v23 = +[UITraitCollection _tvspMainSceneTraits](&OBJC_CLASS___UITraitCollection, "_tvspMainSceneTraits");
    id v24 = [v23 userInterfaceStyle];

    id v46 = v24;
    id v45 = +[TVSPConstants fontForTextStyle:](&OBJC_CLASS___TVSPConstants, "fontForTextStyle:", 6LL);
    id v25 = location;
    id v32 =  -[TVSSAudioRouteRenderer detailTextColorForInterfaceStyle:state:]( v54,  "detailTextColorForInterfaceStyle:state:",  v24,  v52);
    id v31 = +[TVSPViewAttribute tintColor:](&OBJC_CLASS___TVSPViewAttribute, "tintColor:");
    v57[0] = v31;
    id v30 =  -[TVSSAudioRouteRenderer detailTextCompositingFilterForInterfaceStyle:state:]( v54,  "detailTextCompositingFilterForInterfaceStyle:state:",  v46,  v52);
    id v29 = +[TVSPLayerAttribute compositingFilter:](&OBJC_CLASS___TVSPLayerAttribute, "compositingFilter:");
    v57[1] = v29;
    v28 =  +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:",  v45,  2LL);
    id v27 = +[TVSPImageAttribute symbolConfiguration:](&OBJC_CLASS___TVSPImageAttribute, "symbolConfiguration:");
    v57[2] = v27;
    v26 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v57, 3LL);
    v55 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v25);

    int v44 = 1;
    objc_storeStrong(&v45, 0LL);
  }

  else
  {
    id v20 = location;
    id v21 = +[TVSPIdentifiers text1ID](&OBJC_CLASS___TVSPIdentifiers, "text1ID");
    char v42 = 0;
    char v40 = 0;
    unsigned __int8 v22 = 1;
    if ((objc_msgSend(v20, "isEqualToString:") & 1) == 0)
    {
      id v19 = location;
      id v43 = +[TVSPIdentifiers text2ID](&OBJC_CLASS___TVSPIdentifiers, "text2ID");
      char v42 = 1;
      unsigned __int8 v22 = 1;
      if ((objc_msgSend(v19, "isEqualToString:") & 1) == 0)
      {
        id v18 = location;
        id v41 = +[TVSPIdentifiers text3ID](&OBJC_CLASS___TVSPIdentifiers, "text3ID");
        char v40 = 1;
        unsigned __int8 v22 = objc_msgSend(v18, "isEqualToString:");
      }
    }

    if ((v40 & 1) != 0) {

    }
    if ((v42 & 1) != 0) {
    if ((v22 & 1) != 0)
    }
    {
      id v5 = +[UITraitCollection _tvspMainSceneTraits](&OBJC_CLASS___UITraitCollection, "_tvspMainSceneTraits");
      id v6 = [v5 userInterfaceStyle];

      id v39 = v6;
      id v7 = location;
      id v17 = +[TVSPLabelAttribute numberOfLines:](&OBJC_CLASS___TVSPLabelAttribute, "numberOfLines:", 1LL);
      v56[0] = v17;
      id v16 =  +[TVSPLabelAttribute adjustsFontSizeToFitWidth:]( &OBJC_CLASS___TVSPLabelAttribute,  "adjustsFontSizeToFitWidth:",  0LL);
      v56[1] = v16;
      id v15 =  +[TVSPLabelAttribute adjustsFontForContentSizeCategory:]( &OBJC_CLASS___TVSPLabelAttribute,  "adjustsFontForContentSizeCategory:",  0LL);
      v56[2] = v15;
      id v14 = +[TVSPLabelAttribute textStyle:](&OBJC_CLASS___TVSPLabelAttribute, "textStyle:", 6LL);
      v56[3] = v14;
      id v13 =  -[TVSSAudioRouteRenderer detailTextColorForInterfaceStyle:state:]( v54,  "detailTextColorForInterfaceStyle:state:",  v6,  v52);
      id v12 = +[TVSPLabelAttribute textColor:](&OBJC_CLASS___TVSPLabelAttribute, "textColor:");
      v56[4] = v12;
      id v11 =  -[TVSSAudioRouteRenderer detailTextCompositingFilterForInterfaceStyle:state:]( v54,  "detailTextCompositingFilterForInterfaceStyle:state:",  v6,  v52);
      id v10 = +[TVSPLayerAttribute compositingFilter:](&OBJC_CLASS___TVSPLayerAttribute, "compositingFilter:");
      v56[5] = v10;
      id v9 =  +[TVSPLabelAttribute enablesMarqueeWhenAncestorFocused:]( &OBJC_CLASS___TVSPLabelAttribute,  "enablesMarqueeWhenAncestorFocused:",  1LL);
      v56[6] = v9;
      id v8 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v56, 7LL);
      v55 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v7);
    }

    else
    {
      v38.receiver = v54;
      v38.super_class = (Class)&OBJC_CLASS___TVSSAudioRouteRenderer;
      v55 = (TVSPStyling *) -[TVSSAudioRouteRenderer stylingForState:identifier:]( &v38,  "stylingForState:identifier:",  v52,  location);
    }

    int v44 = 1;
  }

  objc_storeStrong(&location, 0LL);
  return v55;
}

- (id)layoutConstraintsWithSubviews:(id)a3 contentView:(id)a4
{
  v128 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v126 = 0LL;
  objc_storeStrong(&v126, a4);
  id v125 = [location[0] imageView];
  id v124 = [location[0] titleLabel];
  id v123 = [location[0] imageView1];
  id v122 = [location[0] label1];
  id v121 = [location[0] imageView2];
  id v120 = [location[0] label2];
  id v119 = [location[0] imageView3];
  id v118 = [location[0] label3];
  id v117 = [location[0] imageView4];
  id v116 = [location[0] verticalTextAlignmentView];
  +[TVSPConstants defaultSpacerHeight](&OBJC_CLASS___TVSPConstants, "defaultSpacerHeight");
  double v115 = v4;
  +[TVSPConstants defaultSpacerWidth](&OBJC_CLASS___TVSPConstants, "defaultSpacerWidth");
  double v114 = v5;
  id v15 = [v124 bottomAnchor];
  id v14 = [v122 topAnchor];
  id v113 = objc_msgSend(v15, "constraintEqualToAnchor:");

  id v17 = [v124 bottomAnchor];
  id v16 = [v120 topAnchor];
  id v112 = objc_msgSend(v17, "constraintEqualToAnchor:");

  id v19 = [v124 bottomAnchor];
  id v18 = [v122 topAnchor];
  id v111 = objc_msgSend(v19, "constraintEqualToAnchor:");

  id v21 = [v124 bottomAnchor];
  id v20 = [v116 bottomAnchor];
  id v110 = objc_msgSend(v21, "constraintEqualToAnchor:");

  id v23 = [v122 trailingAnchor];
  id v22 = [v116 trailingAnchor];
  id v109 = objc_msgSend(v23, "constraintEqualToAnchor:");

  v99[1] = _NSConcreteStackBlock;
  int v100 = -1073741824;
  int v101 = 0;
  v102 = sub_1000B8B08;
  v103 = &unk_1001B9DF8;
  id v104 = v113;
  id v105 = v112;
  id v106 = v111;
  id v107 = v110;
  id v108 = v109;
  -[TVSSAudioRouteRenderer setUpdateAutoLayoutForContentHandler:](v128, "setUpdateAutoLayoutForContentHandler:");
  objc_msgSend(v125, "setContentCompressionResistancePriority:forAxis:");
  LODWORD(v6) = 1148846080;
  objc_msgSend(v125, "setContentCompressionResistancePriority:forAxis:", v6);
  LODWORD(v7) = 1148846080;
  [v125 setContentHuggingPriority:0 forAxis:v7];
  LODWORD(v8) = 1148846080;
  [v125 setContentHuggingPriority:1 forAxis:v8];
  LODWORD(v9) = 1148846080;
  [v123 setContentHuggingPriority:0 forAxis:v9];
  id v97 = [v125 centerXAnchor];
  id v96 = [v126 leadingAnchor];
  +[TVSPConstants defaultLargeSymbolReservedSpace](&OBJC_CLASS___TVSPConstants, "defaultLargeSymbolReservedSpace");
  id v95 = [v97 constraintEqualToAnchor:v96 constant:v10 / 2.0];
  v129[0] = v95;
  id v94 = [v125 centerYAnchor];
  id v93 = [v126 centerYAnchor];
  id v92 = objc_msgSend(v94, "constraintEqualToAnchor:");
  v129[1] = v92;
  id v91 = [v125 topAnchor];
  id v90 = [v126 topAnchor];
  id v89 = objc_msgSend(v91, "constraintGreaterThanOrEqualToAnchor:constant:", v115);
  v129[2] = v89;
  id v88 = [v125 bottomAnchor];
  id v87 = [v126 bottomAnchor];
  id v86 = objc_msgSend(v88, "constraintLessThanOrEqualToAnchor:constant:", -v115);
  v129[3] = v86;
  id v85 = [v116 leadingAnchor];
  id v84 = [v126 leadingAnchor];
  +[TVSPConstants defaultLargeSymbolReservedSpace](&OBJC_CLASS___TVSPConstants, "defaultLargeSymbolReservedSpace");
  id v83 = objc_msgSend(v85, "constraintEqualToAnchor:constant:", v84);
  v129[4] = v83;
  id v82 = [v116 centerYAnchor];
  id v81 = [v126 centerYAnchor];
  id v80 = objc_msgSend(v82, "constraintEqualToAnchor:");
  v129[5] = v80;
  id v79 = [v116 trailingAnchor];
  id v78 = [v123 leadingAnchor];
  +[TVSPConstants trailingAccessorySpacing](&OBJC_CLASS___TVSPConstants, "trailingAccessorySpacing");
  id v77 = [v79 constraintEqualToAnchor:v78 constant:-v11];
  v129[6] = v77;
  id v76 = [v124 topAnchor];
  id v75 = [v116 topAnchor];
  id v74 = objc_msgSend(v76, "constraintEqualToAnchor:");
  v129[7] = v74;
  id v73 = [v124 leadingAnchor];
  id v72 = [v116 leadingAnchor];
  id v71 = objc_msgSend(v73, "constraintEqualToAnchor:");
  v129[8] = v71;
  id v70 = [v124 trailingAnchor];
  id v69 = [v116 trailingAnchor];
  id v68 = objc_msgSend(v70, "constraintEqualToAnchor:");
  v129[9] = v68;
  v129[10] = v113;
  v129[11] = v112;
  v129[12] = v111;
  v129[13] = v110;
  id v67 = [v122 leadingAnchor];
  id v66 = [v116 leadingAnchor];
  id v65 = objc_msgSend(v67, "constraintEqualToAnchor:");
  v129[14] = v65;
  id v64 = [v122 bottomAnchor];
  id v63 = [v116 bottomAnchor];
  id v62 = objc_msgSend(v64, "constraintEqualToAnchor:");
  v129[15] = v62;
  id v61 = [v121 leadingAnchor];
  id v60 = [v122 trailingAnchor];
  id v59 = objc_msgSend(v61, "constraintEqualToAnchor:constant:");
  v129[16] = v59;
  id v58 = [v121 centerYAnchor];
  id v57 = [v122 centerYAnchor];
  id v56 = objc_msgSend(v58, "constraintEqualToAnchor:");
  v129[17] = v56;
  id v55 = [v119 leadingAnchor];
  id v54 = [v125 trailingAnchor];
  id v53 = objc_msgSend(v55, "constraintEqualToAnchor:constant:", v114);
  v129[18] = v53;
  id v52 = [v119 firstBaselineAnchor];
  id v51 = [v120 firstBaselineAnchor];
  id v50 = objc_msgSend(v52, "constraintEqualToAnchor:");
  v129[19] = v50;
  id v49 = [v120 leadingAnchor];
  id v48 = [v119 trailingAnchor];
  id v47 = objc_msgSend(v49, "constraintEqualToAnchor:");
  v129[20] = v47;
  id v46 = [v120 centerYAnchor];
  id v45 = [v122 centerYAnchor];
  id v44 = objc_msgSend(v46, "constraintEqualToAnchor:");
  v129[21] = v44;
  id v43 = [v117 leadingAnchor];
  id v42 = [v120 trailingAnchor];
  id v41 = objc_msgSend(v43, "constraintEqualToAnchor:constant:", 5.0);
  v129[22] = v41;
  id v40 = [v117 firstBaselineAnchor];
  id v39 = [v118 firstBaselineAnchor];
  id v38 = objc_msgSend(v40, "constraintEqualToAnchor:");
  v129[23] = v38;
  id v37 = [v118 leadingAnchor];
  id v36 = [v117 trailingAnchor];
  id v35 = objc_msgSend(v37, "constraintEqualToAnchor:");
  v129[24] = v35;
  id v34 = [v118 centerYAnchor];
  id v33 = [v122 centerYAnchor];
  id v32 = objc_msgSend(v34, "constraintEqualToAnchor:");
  v129[25] = v32;
  id v31 = [v123 widthAnchor];
  id v30 = [v31 constraintEqualToConstant:36.0];
  v129[26] = v30;
  id v29 = [v123 trailingAnchor];
  id v28 = [v126 trailingAnchor];
  id v27 = objc_msgSend(v29, "constraintEqualToAnchor:constant:", -23.0);
  v129[27] = v27;
  id v26 = [v123 centerYAnchor];
  id v25 = [v126 centerYAnchor];
  id v24 = objc_msgSend(v26, "constraintEqualToAnchor:");
  v129[28] = v24;
  v99[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v129, 29LL);

  id v98 = v99[0];
  objc_storeStrong(v99, 0LL);
  objc_storeStrong(&v108, 0LL);
  objc_storeStrong(&v107, 0LL);
  objc_storeStrong(&v106, 0LL);
  objc_storeStrong(&v105, 0LL);
  objc_storeStrong(&v104, 0LL);
  objc_storeStrong(&v109, 0LL);
  objc_storeStrong(&v110, 0LL);
  objc_storeStrong(&v111, 0LL);
  objc_storeStrong(&v112, 0LL);
  objc_storeStrong(&v113, 0LL);
  objc_storeStrong(&v116, 0LL);
  objc_storeStrong(&v117, 0LL);
  objc_storeStrong(&v118, 0LL);
  objc_storeStrong(&v119, 0LL);
  objc_storeStrong(&v120, 0LL);
  objc_storeStrong(&v121, 0LL);
  objc_storeStrong(&v122, 0LL);
  objc_storeStrong(&v123, 0LL);
  objc_storeStrong(&v124, 0LL);
  objc_storeStrong(&v125, 0LL);
  objc_storeStrong(&v126, 0LL);
  objc_storeStrong(location, 0LL);
  return v98;
}

- (id)subviewIdentifiersWantingAutolayout
{
  id v13 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
  v14[0] = v13;
  id v12 = +[TVSPIdentifiers titleID](&OBJC_CLASS___TVSPIdentifiers, "titleID");
  v14[1] = v12;
  id v11 = +[TVSPIdentifiers text1ID](&OBJC_CLASS___TVSPIdentifiers, "text1ID");
  v14[2] = v11;
  id v10 = +[TVSPIdentifiers image1ID](&OBJC_CLASS___TVSPIdentifiers, "image1ID");
  v14[3] = v10;
  id v9 = +[TVSPIdentifiers text2ID](&OBJC_CLASS___TVSPIdentifiers, "text2ID");
  v14[4] = v9;
  id v8 = +[TVSPIdentifiers image2ID](&OBJC_CLASS___TVSPIdentifiers, "image2ID");
  v14[5] = v8;
  id v7 = +[TVSPIdentifiers text3ID](&OBJC_CLASS___TVSPIdentifiers, "text3ID");
  v14[6] = v7;
  id v6 = +[TVSPIdentifiers image3ID](&OBJC_CLASS___TVSPIdentifiers, "image3ID");
  v14[7] = v6;
  id v5 = +[TVSPIdentifiers image4ID](&OBJC_CLASS___TVSPIdentifiers, "image4ID");
  v14[8] = v5;
  id v3 = +[TVSPSubviews verticalTextAlignmentViewID](&OBJC_CLASS___TVSPSubviews, "verticalTextAlignmentViewID");
  v14[9] = v3;
  double v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 10LL);

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

- (id)detailTextCompositingFilterForInterfaceStyle:(int64_t)a3 state:(unint64_t)a4
{
  if ((a4 & 8) != 0 || a3 != 2) {
    return +[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterPlusD);
  }
  else {
    return +[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterPlusL);
  }
}

- (int64_t)_effectiveUserInterfaceStyleForStyle:(int64_t)a3 state:(unint64_t)a4
{
  BOOL v5 = (a4 & 8) != 0;
  if ((+[UITraitCollection _tvspIsDarkMode](&OBJC_CLASS___UITraitCollection, "_tvspIsDarkMode") & 1) != 0
    && v5)
  {
    return 1LL;
  }

  return a3;
}

- (UIActivityIndicatorView)spinnerView
{
  return self->_spinnerView;
}

- (void)setSpinnerView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
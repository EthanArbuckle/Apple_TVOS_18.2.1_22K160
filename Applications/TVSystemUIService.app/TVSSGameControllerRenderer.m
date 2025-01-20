@interface TVSSGameControllerRenderer
+ (id)rendererWithGameController:(id)a3;
- (TVSSGameControllerRenderer)initWithIdentifier:(id)a3 format:(int64_t)a4 content:(id)a5 overrideStylings:(id)a6;
- (id)_detailTextColorForInterfaceStyle:(int64_t)a3 state:(unint64_t)a4;
- (id)_detailTextCompositingFilterForInterfaceStyle:(int64_t)a3 state:(unint64_t)a4;
- (id)_gameController;
- (id)layoutConstraintsWithSubviews:(id)a3 contentView:(id)a4;
- (id)overrideStylingForIdentifier:(id)a3;
- (id)stylingForState:(unint64_t)a3 identifier:(id)a4;
- (id)subviewIdentifiersWantingAutolayout;
- (void)applyContent:(id)a3 animator:(id)a4;
- (void)applyStylingsWithAnimator:(id)a3;
- (void)configureContentView:(id)a3;
@end

@implementation TVSSGameControllerRenderer

+ (id)rendererWithGameController:(id)a3
{
  Class v8 = (Class)a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = objc_alloc(v8);
  id v5 = [location[0] rendererIdentifier];
  id v6 = objc_msgSend(v4, "initWithIdentifier:format:content:overrideStylings:");

  objc_storeStrong(location, 0LL);
  return v6;
}

- (TVSSGameControllerRenderer)initWithIdentifier:(id)a3 format:(int64_t)a4 content:(id)a5 overrideStylings:(id)a6
{
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  int64_t v17 = a4;
  id v16 = 0LL;
  objc_storeStrong(&v16, a5);
  id v15 = 0LL;
  objc_storeStrong(&v15, a6);
  id v6 = v19;
  v19 = 0LL;
  v14.receiver = v6;
  v14.super_class = (Class)&OBJC_CLASS___TVSSGameControllerRenderer;
  v19 = -[TVSSGameControllerRenderer initWithIdentifier:format:content:overrideStylings:]( &v14,  "initWithIdentifier:format:content:overrideStylings:",  location[0],  v17,  v16,  v15);
  objc_storeStrong((id *)&v19, v19);
  if (v19)
  {
    v7 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:16];
    activityIndicatorView = v19->_activityIndicatorView;
    v19->_activityIndicatorView = v7;

    -[UIActivityIndicatorView _setCustomWidth:](v19->_activityIndicatorView, "_setCustomWidth:", 29.0);
    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:]( v19->_activityIndicatorView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  }

  v10 = v19;
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v19, 0LL);
  return v10;
}

- (void)configureContentView:(id)a3
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v16.receiver = v18;
  v16.super_class = (Class)&OBJC_CLASS___TVSSGameControllerRenderer;
  -[TVSSGameControllerRenderer configureContentView:](&v16, "configureContentView:", location[0]);
  [location[0] addSubview:v18->_activityIndicatorView];
  id v3 = -[TVSSGameControllerRenderer subviews](v18, "subviews");
  id v15 = [v3 imageView1];

  id v13 = -[UIActivityIndicatorView centerXAnchor](v18->_activityIndicatorView, "centerXAnchor");
  id v12 = [v15 centerXAnchor];
  id v11 = objc_msgSend(v13, "constraintEqualToAnchor:");
  v19[0] = v11;
  id v10 = -[UIActivityIndicatorView centerYAnchor](v18->_activityIndicatorView, "centerYAnchor");
  id v9 = [v15 centerYAnchor];
  id v8 = objc_msgSend(v10, "constraintEqualToAnchor:");
  v19[1] = v8;
  id v7 = -[UIActivityIndicatorView widthAnchor](v18->_activityIndicatorView, "widthAnchor");
  id v6 = objc_msgSend(v7, "constraintEqualToConstant:");
  v19[2] = v6;
  id v5 = -[UIActivityIndicatorView heightAnchor](v18->_activityIndicatorView, "heightAnchor");
  id v4 = [v5 constraintEqualToConstant:29.0];
  v19[3] = v4;
  objc_super v14 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 4LL);

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v14);
  objc_storeStrong((id *)&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)applyContent:(id)a3 animator:(id)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  v6.receiver = v9;
  v6.super_class = (Class)&OBJC_CLASS___TVSSGameControllerRenderer;
  -[TVSSGameControllerRenderer applyContent:animator:](&v6, "applyContent:animator:", location[0], v7);
  id v5 = -[TVSSGameControllerRenderer _gameController](v9, "_gameController");
  else {
    -[UIActivityIndicatorView stopAnimating](v9->_activityIndicatorView, "stopAnimating");
  }
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)applyStylingsWithAnimator:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v7.receiver = v9;
  v7.super_class = (Class)&OBJC_CLASS___TVSSGameControllerRenderer;
  -[TVSSGameControllerRenderer applyStylingsWithAnimator:](&v7, "applyStylingsWithAnimator:", location[0]);
  if (-[TVSSGameControllerRenderer effectiveUserInterfaceStyle](v9, "effectiveUserInterfaceStyle") == (id)2)
  {
    activityIndicatorView = v9->_activityIndicatorView;
    id v6 = +[TVSPConstants defaultDarkModeTextColor](&OBJC_CLASS___TVSPConstants, "defaultDarkModeTextColor");
    -[UIActivityIndicatorView setColor:](activityIndicatorView, "setColor:");
  }

  else
  {
    id v3 = v9->_activityIndicatorView;
    id v4 = +[TVSPConstants defaultLightModeTextColor](&OBJC_CLASS___TVSPConstants, "defaultLightModeTextColor");
    -[UIActivityIndicatorView setColor:](v3, "setColor:");
  }

  objc_storeStrong(location, 0LL);
}

- (id)stylingForState:(unint64_t)a3 identifier:(id)a4
{
  v28 = self;
  SEL v27 = a2;
  unint64_t v26 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  id v20 = location;
  id v21 = +[TVSPIdentifiers text1ID](&OBJC_CLASS___TVSPIdentifiers, "text1ID");
  unsigned __int8 v22 = objc_msgSend(v20, "isEqualToString:");

  if ((v22 & 1) != 0)
  {
    id v9 = location;
    id v19 = +[TVSPLabelAttribute numberOfLines:](&OBJC_CLASS___TVSPLabelAttribute, "numberOfLines:", 1LL);
    v30[0] = v19;
    id v18 =  +[TVSPLabelAttribute adjustsFontSizeToFitWidth:]( &OBJC_CLASS___TVSPLabelAttribute,  "adjustsFontSizeToFitWidth:",  0LL);
    v30[1] = v18;
    id v17 =  +[TVSPLabelAttribute adjustsFontForContentSizeCategory:]( &OBJC_CLASS___TVSPLabelAttribute,  "adjustsFontForContentSizeCategory:",  0LL);
    v30[2] = v17;
    id v16 = +[TVSPLabelAttribute textStyle:](&OBJC_CLASS___TVSPLabelAttribute, "textStyle:", 6LL);
    v30[3] = v16;
    objc_super v7 = v28;
    id v4 = -[TVSSGameControllerRenderer effectiveUserInterfaceStyle](v28, "effectiveUserInterfaceStyle");
    id v15 =  -[TVSSGameControllerRenderer _detailTextColorForInterfaceStyle:state:]( v7,  "_detailTextColorForInterfaceStyle:state:",  v4,  v26);
    id v14 = +[TVSPLabelAttribute textColor:](&OBJC_CLASS___TVSPLabelAttribute, "textColor:");
    v30[4] = v14;
    id v8 = v28;
    id v5 = -[TVSSGameControllerRenderer effectiveUserInterfaceStyle](v28, "effectiveUserInterfaceStyle");
    id v13 =  -[TVSSGameControllerRenderer _detailTextCompositingFilterForInterfaceStyle:state:]( v8,  "_detailTextCompositingFilterForInterfaceStyle:state:",  v5,  v26);
    id v12 = +[TVSPLayerAttribute compositingFilter:](&OBJC_CLASS___TVSPLayerAttribute, "compositingFilter:");
    v30[5] = v12;
    id v11 =  +[TVSPLabelAttribute enablesMarqueeWhenAncestorFocused:]( &OBJC_CLASS___TVSPLabelAttribute,  "enablesMarqueeWhenAncestorFocused:",  1LL);
    v30[6] = v11;
    id v10 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 7LL);
    v29 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v9);
  }

  else
  {
    v23.receiver = v28;
    v23.super_class = (Class)&OBJC_CLASS___TVSSGameControllerRenderer;
    v29 = (TVSPStyling *) -[TVSSGameControllerRenderer stylingForState:identifier:]( &v23,  "stylingForState:identifier:",  v26,  location);
  }

  int v24 = 1;
  objc_storeStrong(&location, 0LL);
  return v29;
}

- (id)overrideStylingForIdentifier:(id)a3
{
  SEL v27 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v25 = 0LL;
  id v19 = location[0];
  id v20 = +[TVSPIdentifiers image1ID](&OBJC_CLASS___TVSPIdentifiers, "image1ID");
  unsigned __int8 v21 = objc_msgSend(v19, "isEqualToString:");

  if ((v21 & 1) != 0)
  {
    id v14 = -[TVSSGameControllerRenderer _gameController](v27, "_gameController");
    unsigned __int8 v15 = [v14 shouldShowConnectionStateImage];

    char v24 = v15 & 1;
    id v16 = location[0];
    double v3 = 1.0;
    if ((v15 & 1) == 0) {
      double v3 = 0.0;
    }
    id v18 = +[TVSPViewAttribute alpha:](&OBJC_CLASS___TVSPViewAttribute, "alpha:", v3);
    id v28 = v18;
    id v17 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v28, 1LL);
    id v4 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v16);
    id v5 = v25;
    v25 = v4;
  }

  else
  {
    id v11 = location[0];
    id v12 = +[TVSPIdentifiers image2ID](&OBJC_CLASS___TVSPIdentifiers, "image2ID");
    unsigned __int8 v13 = objc_msgSend(v11, "isEqualToString:");

    if ((v13 & 1) != 0)
    {
      id v23 = -[TVSSGameControllerRenderer _gameController](v27, "_gameController");
      [v23 normalizedBatteryLevel];
      id v22 =  +[TVSSBatteryLevelImageConfiguration batteryLevelImageConfigurationForBatteryLevel:userInterfaceStyle:]( &OBJC_CLASS___TVSSBatteryLevelImageConfiguration,  "batteryLevelImageConfigurationForBatteryLevel:userInterfaceStyle:",  -[TVSSGameControllerRenderer effectiveUserInterfaceStyle](v27, "effectiveUserInterfaceStyle"),  v6);
      objc_super v7 = (TVSPStyling *)[v22 stylingWithIdentifier:location[0]];
      id v8 = v25;
      v25 = v7;

      objc_storeStrong(&v22, 0LL);
      objc_storeStrong(&v23, 0LL);
    }
  }

  id v10 = v25;
  objc_storeStrong((id *)&v25, 0LL);
  objc_storeStrong(location, 0LL);
  return v10;
}

- (id)subviewIdentifiersWantingAutolayout
{
  id v9 = +[TVSPIdentifiers imageID](&OBJC_CLASS___TVSPIdentifiers, "imageID");
  v10[0] = v9;
  id v8 = +[TVSPIdentifiers titleID](&OBJC_CLASS___TVSPIdentifiers, "titleID");
  v10[1] = v8;
  id v7 = +[TVSPIdentifiers text1ID](&OBJC_CLASS___TVSPIdentifiers, "text1ID");
  v10[2] = v7;
  id v6 = +[TVSPIdentifiers image1ID](&OBJC_CLASS___TVSPIdentifiers, "image1ID");
  v10[3] = v6;
  id v5 = +[TVSPIdentifiers image2ID](&OBJC_CLASS___TVSPIdentifiers, "image2ID");
  v10[4] = v5;
  id v3 = +[TVSPSubviews verticalTextAlignmentViewID](&OBJC_CLASS___TVSPSubviews, "verticalTextAlignmentViewID");
  v10[5] = v3;
  id v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 6LL);

  return v4;
}

- (id)layoutConstraintsWithSubviews:(id)a3 contentView:(id)a4
{
  v93 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v91 = 0LL;
  objc_storeStrong(&v91, a4);
  id v90 = [location[0] titleLabel];
  id v89 = [location[0] label1];
  id v88 = [location[0] imageView];
  id v87 = [location[0] imageView1];
  id v86 = [location[0] imageView2];
  id v85 = [location[0] verticalTextAlignmentView];
  +[TVSPConstants defaultSpacerHeight](&OBJC_CLASS___TVSPConstants, "defaultSpacerHeight");
  double v84 = v4;
  id v17 = [v90 bottomAnchor];
  id v16 = [v89 topAnchor];
  id v83 = objc_msgSend(v17, "constraintEqualToAnchor:");

  id v19 = [v90 bottomAnchor];
  id v18 = [v85 bottomAnchor];
  id v82 = objc_msgSend(v19, "constraintEqualToAnchor:");

  id v21 = [v89 trailingAnchor];
  id v20 = [v85 trailingAnchor];
  id v81 = objc_msgSend(v21, "constraintEqualToAnchor:");

  v73[1] = _NSConcreteStackBlock;
  int v74 = -1073741824;
  int v75 = 0;
  v76 = sub_10008CA74;
  v77 = &unk_1001B92C0;
  id v78 = v83;
  id v79 = v82;
  id v80 = v81;
  -[TVSSGameControllerRenderer setUpdateAutoLayoutForContentHandler:](v93, "setUpdateAutoLayoutForContentHandler:");
  objc_msgSend(v88, "setContentCompressionResistancePriority:forAxis:");
  LODWORD(v5) = 1148846080;
  objc_msgSend(v88, "setContentCompressionResistancePriority:forAxis:", v5);
  LODWORD(v6) = 1148846080;
  [v88 setContentHuggingPriority:0 forAxis:v6];
  LODWORD(v7) = 1148846080;
  [v88 setContentHuggingPriority:1 forAxis:v7];
  LODWORD(v8) = 1148846080;
  [v87 setContentCompressionResistancePriority:0 forAxis:v8];
  LODWORD(v9) = 1148846080;
  [v87 setContentCompressionResistancePriority:1 forAxis:v9];
  LODWORD(v10) = 1148846080;
  [v87 setContentHuggingPriority:0 forAxis:v10];
  LODWORD(v11) = 1148846080;
  [v87 setContentHuggingPriority:1 forAxis:v11];
  id v71 = [v88 centerXAnchor];
  id v70 = [v91 leadingAnchor];
  +[TVSPConstants defaultLargeSymbolReservedSpace](&OBJC_CLASS___TVSPConstants, "defaultLargeSymbolReservedSpace");
  id v69 = [v71 constraintEqualToAnchor:v70 constant:v12 / 2.0];
  v94[0] = v69;
  id v68 = [v88 centerYAnchor];
  id v67 = [v91 centerYAnchor];
  id v66 = objc_msgSend(v68, "constraintEqualToAnchor:");
  v94[1] = v66;
  id v65 = [v88 topAnchor];
  id v64 = [v91 topAnchor];
  id v63 = objc_msgSend(v65, "constraintGreaterThanOrEqualToAnchor:constant:", v84);
  v94[2] = v63;
  id v62 = [v88 bottomAnchor];
  id v61 = [v91 bottomAnchor];
  id v60 = objc_msgSend(v62, "constraintLessThanOrEqualToAnchor:constant:", -v84);
  v94[3] = v60;
  id v59 = [v85 leadingAnchor];
  id v58 = [v91 leadingAnchor];
  +[TVSPConstants defaultLargeSymbolReservedSpace](&OBJC_CLASS___TVSPConstants, "defaultLargeSymbolReservedSpace");
  id v57 = objc_msgSend(v59, "constraintEqualToAnchor:constant:", v58);
  v94[4] = v57;
  id v56 = [v85 centerYAnchor];
  id v55 = [v91 centerYAnchor];
  id v54 = objc_msgSend(v56, "constraintEqualToAnchor:");
  v94[5] = v54;
  id v53 = [v85 trailingAnchor];
  id v52 = [v87 leadingAnchor];
  +[TVSPConstants trailingAccessorySpacing](&OBJC_CLASS___TVSPConstants, "trailingAccessorySpacing");
  id v51 = [v53 constraintEqualToAnchor:v52 constant:-v13];
  v94[6] = v51;
  id v50 = [v90 topAnchor];
  id v49 = [v85 topAnchor];
  id v48 = objc_msgSend(v50, "constraintEqualToAnchor:");
  v94[7] = v48;
  id v47 = [v90 leadingAnchor];
  id v46 = [v85 leadingAnchor];
  id v45 = objc_msgSend(v47, "constraintEqualToAnchor:");
  v94[8] = v45;
  id v44 = [v90 trailingAnchor];
  id v43 = [v85 trailingAnchor];
  id v42 = objc_msgSend(v44, "constraintEqualToAnchor:");
  v94[9] = v42;
  v94[10] = v83;
  v94[11] = v82;
  v94[12] = v81;
  id v41 = [v89 leadingAnchor];
  id v40 = [v85 leadingAnchor];
  id v39 = objc_msgSend(v41, "constraintEqualToAnchor:");
  v94[13] = v39;
  id v38 = [v89 bottomAnchor];
  id v37 = [v85 bottomAnchor];
  id v36 = objc_msgSend(v38, "constraintEqualToAnchor:");
  v94[14] = v36;
  id v35 = [v86 leadingAnchor];
  id v34 = [v89 trailingAnchor];
  id v33 = objc_msgSend(v35, "constraintEqualToAnchor:constant:", 5.0);
  v94[15] = v33;
  id v32 = [v86 centerYAnchor];
  id v31 = [v89 centerYAnchor];
  id v30 = objc_msgSend(v32, "constraintEqualToAnchor:");
  v94[16] = v30;
  id v29 = [v87 widthAnchor];
  id v28 = [v29 constraintEqualToConstant:36.0];
  v94[17] = v28;
  id v27 = [v87 trailingAnchor];
  id v26 = [v91 trailingAnchor];
  id v25 = objc_msgSend(v27, "constraintEqualToAnchor:constant:", -23.0);
  v94[18] = v25;
  id v24 = [v87 centerYAnchor];
  id v23 = [v91 centerYAnchor];
  id v22 = objc_msgSend(v24, "constraintEqualToAnchor:");
  v94[19] = v22;
  v73[0] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v94, 20LL);

  id v72 = v73[0];
  objc_storeStrong(v73, 0LL);
  objc_storeStrong(&v80, 0LL);
  objc_storeStrong(&v79, 0LL);
  objc_storeStrong(&v78, 0LL);
  objc_storeStrong(&v81, 0LL);
  objc_storeStrong(&v82, 0LL);
  objc_storeStrong(&v83, 0LL);
  objc_storeStrong(&v85, 0LL);
  objc_storeStrong(&v86, 0LL);
  objc_storeStrong(&v87, 0LL);
  objc_storeStrong(&v88, 0LL);
  objc_storeStrong(&v89, 0LL);
  objc_storeStrong(&v90, 0LL);
  objc_storeStrong(&v91, 0LL);
  objc_storeStrong(location, 0LL);
  return v72;
}

- (id)_gameController
{
  id v4 = -[TVSSGameControllerRenderer content](self, "content");
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___TVSSBluetoothDevice);
  id v5 = sub_10008CC18(v4, v2);

  return v5;
}

- (id)_detailTextColorForInterfaceStyle:(int64_t)a3 state:(unint64_t)a4
{
  if (a3 != 2 || a4 == 8 || a4 == 1) {
    return   +[TVSPConstants defaultLightModeDetailTextColor]( &OBJC_CLASS___TVSPConstants,  "defaultLightModeDetailTextColor");
  }
  else {
    return   +[TVSPConstants defaultDarkModeDetailTextColor]( &OBJC_CLASS___TVSPConstants,  "defaultDarkModeDetailTextColor");
  }
}

- (id)_detailTextCompositingFilterForInterfaceStyle:(int64_t)a3 state:(unint64_t)a4
{
  if ((a4 & 8) != 0 || a3 != 2) {
    return +[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterPlusD);
  }
  else {
    return +[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterPlusL);
  }
}

- (void).cxx_destruct
{
}

@end
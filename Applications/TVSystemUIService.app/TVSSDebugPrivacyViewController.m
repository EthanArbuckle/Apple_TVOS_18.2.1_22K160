@interface TVSSDebugPrivacyViewController
- (TVSSPrivacyView)privacyView;
- (void)_handleToggleAxis;
- (void)_handleToggleLocationIndicator;
- (void)_handleToggleRecordingIndicator;
- (void)_toggleBorder;
- (void)_toggleRecordingColor;
- (void)_toggleRecordingShape;
- (void)viewDidLoad;
@end

@implementation TVSSDebugPrivacyViewController

- (void)viewDidLoad
{
  v144 = self;
  SEL v143 = a2;
  v142.receiver = self;
  v142.super_class = (Class)&OBJC_CLASS___TVSSDebugPrivacyViewController;
  -[TVSSDebugPrivacyViewController viewDidLoad](&v142, "viewDidLoad");
  id v141 = objc_alloc_init(&OBJC_CLASS___UIView);
  [v141 setTranslatesAutoresizingMaskIntoConstraints:0];
  v84 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.75, 0.6);
  objc_msgSend(v141, "setBackgroundColor:");

  id v83 = -[TVSSDebugPrivacyViewController view](v144, "view");
  [v83 addSubview:v141];

  id v140 = objc_alloc_init(&OBJC_CLASS___UIView);
  [v140 setTranslatesAutoresizingMaskIntoConstraints:0];
  v82 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.2, 0.6);
  objc_msgSend(v140, "setBackgroundColor:");

  id v81 = -[TVSSDebugPrivacyViewController view](v144, "view");
  [v81 addSubview:v140];

  v80 = objc_alloc_init(&OBJC_CLASS___TVSSPrivacyView);
  privacyView = v144->_privacyView;
  v144->_privacyView = v80;

  -[TVSSPrivacyView setTranslatesAutoresizingMaskIntoConstraints:]( v144->_privacyView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  id v79 = -[TVSSDebugPrivacyViewController view](v144, "view");
  [v79 addSubview:v144->_privacyView];

  id v139 =  +[UIButtonConfiguration plainButtonConfiguration]( &OBJC_CLASS___UIButtonConfiguration,  "plainButtonConfiguration");
  sub_1000AFBD4();
  *(void *)&__int128 v137 = v3;
  *((void *)&v137 + 1) = v4;
  *(void *)&__int128 v138 = v5;
  *((void *)&v138 + 1) = v6;
  __int128 v135 = v137;
  __int128 v136 = v138;
  objc_msgSend(v139, "setContentInsets:", v137, v138);
  [v139 setTitleTextAttributesTransformer:&stru_1001B9D90];
  [v139 setButtonSize:2];
  [v139 setTitle:@"Axis"];
  objc_initWeak(&location, v144);
  id v78 = v139;
  v127 = _NSConcreteStackBlock;
  int v128 = -1073741824;
  int v129 = 0;
  v130 = sub_1000AFCF8;
  v131 = &unk_1001B7578;
  objc_copyWeak(&v132, &location);
  v77 = +[UIAction actionWithHandler:](&OBJC_CLASS___UIAction, "actionWithHandler:", &v127);
  id v133 =  +[UIButton buttonWithConfiguration:primaryAction:]( &OBJC_CLASS___UIButton,  "buttonWithConfiguration:primaryAction:",  v78);

  id v126 = [v139 copy];
  [v126 setTitle:@"Recording"];
  id v76 = v126;
  v119 = _NSConcreteStackBlock;
  int v120 = -1073741824;
  int v121 = 0;
  v122 = sub_1000AFD60;
  v123 = &unk_1001B7578;
  objc_copyWeak(&v124, &location);
  v75 = +[UIAction actionWithHandler:](&OBJC_CLASS___UIAction, "actionWithHandler:", &v119);
  id v125 =  +[UIButton buttonWithConfiguration:primaryAction:]( &OBJC_CLASS___UIButton,  "buttonWithConfiguration:primaryAction:",  v76);

  id v118 = [v139 copy];
  [v118 setTitle:@"Location"];
  id v74 = v118;
  v111 = _NSConcreteStackBlock;
  int v112 = -1073741824;
  int v113 = 0;
  v114 = sub_1000AFDC8;
  v115 = &unk_1001B7578;
  objc_copyWeak(&v116, &location);
  v73 = +[UIAction actionWithHandler:](&OBJC_CLASS___UIAction, "actionWithHandler:", &v111);
  id v117 =  +[UIButton buttonWithConfiguration:primaryAction:]( &OBJC_CLASS___UIButton,  "buttonWithConfiguration:primaryAction:",  v74);

  id v110 = [v139 copy];
  [v110 setTitle:@"Shape"];
  id v72 = v110;
  v103 = _NSConcreteStackBlock;
  int v104 = -1073741824;
  int v105 = 0;
  v106 = sub_1000AFE30;
  v107 = &unk_1001B7578;
  objc_copyWeak(&v108, &location);
  v71 = +[UIAction actionWithHandler:](&OBJC_CLASS___UIAction, "actionWithHandler:", &v103);
  id v109 =  +[UIButton buttonWithConfiguration:primaryAction:]( &OBJC_CLASS___UIButton,  "buttonWithConfiguration:primaryAction:",  v72);

  id v102 = [v139 copy];
  [v102 setTitle:@"Color"];
  id v70 = v102;
  v95 = _NSConcreteStackBlock;
  int v96 = -1073741824;
  int v97 = 0;
  v98 = sub_1000AFE98;
  v99 = &unk_1001B7578;
  objc_copyWeak(&v100, &location);
  v69 = +[UIAction actionWithHandler:](&OBJC_CLASS___UIAction, "actionWithHandler:", &v95);
  id v101 =  +[UIButton buttonWithConfiguration:primaryAction:]( &OBJC_CLASS___UIButton,  "buttonWithConfiguration:primaryAction:",  v70);

  id v94 = [v139 copy];
  [v94 setTitle:@"Border"];
  id v68 = v94;
  v87 = _NSConcreteStackBlock;
  int v88 = -1073741824;
  int v89 = 0;
  v90 = sub_1000AFF00;
  v91 = &unk_1001B7578;
  objc_copyWeak(&v92, &location);
  v67 = +[UIAction actionWithHandler:](&OBJC_CLASS___UIAction, "actionWithHandler:", &v87);
  id v93 =  +[UIButton buttonWithConfiguration:primaryAction:]( &OBJC_CLASS___UIButton,  "buttonWithConfiguration:primaryAction:",  v68);

  v66 = objc_alloc(&OBJC_CLASS___UIStackView);
  v146[0] = v133;
  v146[1] = v125;
  v146[2] = v117;
  v146[3] = v109;
  v146[4] = v101;
  v146[5] = v93;
  v65 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v146, 6LL);
  id v86 = -[UIStackView initWithArrangedSubviews:](v66, "initWithArrangedSubviews:");

  [v86 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v64 = -[TVSSDebugPrivacyViewController view](v144, "view");
  [v64 addSubview:v86];

  id v63 = objc_alloc(&OBJC_CLASS____UIPortalView);
  id v85 = [v63 initWithSourceView:v144->_privacyView];
  [v85 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v62 = -[TVSSDebugPrivacyViewController view](v144, "view");
  [v62 addSubview:v85];

  id v61 = [v86 centerXAnchor];
  id v60 = -[TVSSDebugPrivacyViewController view](v144, "view");
  id v59 = [v60 safeAreaLayoutGuide];
  id v58 = [v59 centerXAnchor];
  id v57 = objc_msgSend(v61, "constraintEqualToAnchor:");
  v145[0] = v57;
  id v56 = [v86 topAnchor];
  id v55 = -[TVSSDebugPrivacyViewController view](v144, "view");
  id v54 = [v55 safeAreaLayoutGuide];
  id v53 = [v54 topAnchor];
  id v52 = objc_msgSend(v56, "constraintEqualToAnchor:");
  v145[1] = v52;
  id v51 = [v86 widthAnchor];
  id v50 = -[TVSSDebugPrivacyViewController view](v144, "view");
  id v49 = [v50 safeAreaLayoutGuide];
  id v48 = [v49 widthAnchor];
  id v47 = objc_msgSend(v51, "constraintLessThanOrEqualToAnchor:");
  v145[2] = v47;
  id v46 = [v141 trailingAnchor];
  id v45 = -[TVSSDebugPrivacyViewController view](v144, "view");
  id v44 = [v45 safeAreaLayoutGuide];
  id v43 = [v44 centerXAnchor];
  id v42 = objc_msgSend(v46, "constraintEqualToAnchor:");
  v145[3] = v42;
  id v41 = [v141 topAnchor];
  id v40 = [v86 bottomAnchor];
  id v39 = objc_msgSend(v41, "constraintEqualToAnchor:constant:", 30.0);
  v145[4] = v39;
  id v38 = [v141 widthAnchor];
  id v37 = [v38 constraintEqualToConstant:100.0];
  v145[5] = v37;
  id v36 = [v141 heightAnchor];
  id v35 = [v36 constraintEqualToConstant:100.0];
  v145[6] = v35;
  id v34 = [v140 leadingAnchor];
  id v33 = -[TVSSDebugPrivacyViewController view](v144, "view");
  id v32 = [v33 safeAreaLayoutGuide];
  id v31 = [v32 centerXAnchor];
  id v30 = objc_msgSend(v34, "constraintEqualToAnchor:");
  v145[7] = v30;
  id v29 = [v140 topAnchor];
  id v28 = [v86 bottomAnchor];
  id v27 = objc_msgSend(v29, "constraintEqualToAnchor:constant:", 30.0);
  v145[8] = v27;
  id v26 = [v140 widthAnchor];
  id v25 = [v26 constraintEqualToConstant:100.0];
  v145[9] = v25;
  id v24 = [v140 heightAnchor];
  id v23 = [v24 constraintEqualToConstant:100.0];
  v145[10] = v23;
  id v22 = -[TVSSPrivacyView centerXAnchor](v144->_privacyView, "centerXAnchor");
  id v21 = [v141 centerXAnchor];
  id v20 = objc_msgSend(v22, "constraintEqualToAnchor:");
  v145[11] = v20;
  id v19 = -[TVSSPrivacyView centerYAnchor](v144->_privacyView, "centerYAnchor");
  id v18 = [v141 centerYAnchor];
  id v17 = objc_msgSend(v19, "constraintEqualToAnchor:");
  v145[12] = v17;
  id v16 = [v85 centerXAnchor];
  id v15 = [v140 centerXAnchor];
  id v14 = objc_msgSend(v16, "constraintEqualToAnchor:");
  v145[13] = v14;
  id v13 = [v85 centerYAnchor];
  id v12 = [v140 centerYAnchor];
  id v11 = objc_msgSend(v13, "constraintEqualToAnchor:");
  v145[14] = v11;
  v10 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v145, 15LL);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

  v9 = -[TVSSPrivacyView recordingIndicatorView](v144->_privacyView, "recordingIndicatorView");
  -[TVSSRecordingIndicatorView setIndicatorShape:](v9, "setIndicatorShape:", 0LL);

  id v8 = +[UIColor systemGreenColor](&OBJC_CLASS___UIColor, "systemGreenColor");
  v7 = -[TVSSPrivacyView recordingIndicatorView](v144->_privacyView, "recordingIndicatorView");
  -[TVSSRecordingIndicatorView setIndicatorColor:](v7, "setIndicatorColor:", v8);

  v144->_isGreen = 1;
  objc_storeStrong(&v85, 0LL);
  objc_storeStrong(&v86, 0LL);
  objc_storeStrong(&v93, 0LL);
  objc_destroyWeak(&v92);
  objc_storeStrong(&v94, 0LL);
  objc_storeStrong(&v101, 0LL);
  objc_destroyWeak(&v100);
  objc_storeStrong(&v102, 0LL);
  objc_storeStrong(&v109, 0LL);
  objc_destroyWeak(&v108);
  objc_storeStrong(&v110, 0LL);
  objc_storeStrong(&v117, 0LL);
  objc_destroyWeak(&v116);
  objc_storeStrong(&v118, 0LL);
  objc_storeStrong(&v125, 0LL);
  objc_destroyWeak(&v124);
  objc_storeStrong(&v126, 0LL);
  objc_storeStrong(&v133, 0LL);
  objc_destroyWeak(&v132);
  objc_destroyWeak(&location);
  objc_storeStrong(&v139, 0LL);
  objc_storeStrong(&v140, 0LL);
  objc_storeStrong(&v141, 0LL);
}

- (void)_handleToggleAxis
{
  uint64_t v4 = -[TVSSDebugPrivacyViewController privacyView](self, "privacyView");
  BOOL v2 = -[TVSSPrivacyView axis](v4, "axis") == 0;
  uint64_t v3 = -[TVSSDebugPrivacyViewController privacyView](self, "privacyView");
  -[TVSSPrivacyView setAxis:](v3, "setAxis:", v2);
}

- (void)_handleToggleRecordingIndicator
{
  uint64_t v6 = -[TVSSDebugPrivacyViewController privacyView](self, "privacyView");
  uint64_t v5 = -[TVSSPrivacyView recordingIndicatorView](v6, "recordingIndicatorView");
  unsigned int v2 = -[TVSSRecordingIndicatorView isHidden](v5, "isHidden") ^ 1;
  uint64_t v4 = -[TVSSDebugPrivacyViewController privacyView](self, "privacyView");
  uint64_t v3 = -[TVSSPrivacyView recordingIndicatorView](v4, "recordingIndicatorView");
  -[TVSSRecordingIndicatorView setHidden:](v3, "setHidden:", v2 & 1);
}

- (void)_handleToggleLocationIndicator
{
  uint64_t v6 = -[TVSSDebugPrivacyViewController privacyView](self, "privacyView");
  uint64_t v5 = -[TVSSPrivacyView locationIndicatorView](v6, "locationIndicatorView");
  unsigned int v2 = -[TVSSLocationIndicatorView isHidden](v5, "isHidden") ^ 1;
  uint64_t v4 = -[TVSSDebugPrivacyViewController privacyView](self, "privacyView");
  uint64_t v3 = -[TVSSPrivacyView locationIndicatorView](v4, "locationIndicatorView");
  -[TVSSLocationIndicatorView setHidden:](v3, "setHidden:", v2 & 1);
}

- (void)_toggleRecordingShape
{
  uint64_t v6 = -[TVSSDebugPrivacyViewController privacyView](self, "privacyView");
  uint64_t v5 = -[TVSSPrivacyView recordingIndicatorView](v6, "recordingIndicatorView");
  BOOL v2 = -[TVSSRecordingIndicatorView indicatorShape](v5, "indicatorShape") == 0;
  uint64_t v4 = -[TVSSDebugPrivacyViewController privacyView](self, "privacyView");
  uint64_t v3 = -[TVSSPrivacyView recordingIndicatorView](v4, "recordingIndicatorView");
  -[TVSSRecordingIndicatorView setIndicatorShape:](v3, "setIndicatorShape:", v2);
}

- (void)_toggleRecordingColor
{
  char v7 = 0;
  char v5 = 0;
  if (self->_isGreen)
  {
    id v8 = +[UIColor systemOrangeColor](&OBJC_CLASS___UIColor, "systemOrangeColor");
    char v7 = 1;
    id v4 = v8;
  }

  else
  {
    id v6 = +[UIColor systemGreenColor](&OBJC_CLASS___UIColor, "systemGreenColor");
    char v5 = 1;
    id v4 = v6;
  }

  uint64_t v3 = -[TVSSDebugPrivacyViewController privacyView](self, "privacyView");
  BOOL v2 = -[TVSSPrivacyView recordingIndicatorView](v3, "recordingIndicatorView");
  -[TVSSRecordingIndicatorView setIndicatorColor:](v2, "setIndicatorColor:", v4);

  if ((v5 & 1) != 0) {
  if ((v7 & 1) != 0)
  }

  self->_isGreen = !self->_isGreen;
}

- (void)_toggleBorder
{
  id v6 = -[TVSSDebugPrivacyViewController privacyView](self, "privacyView");
  char v5 = -[TVSSPrivacyView recordingIndicatorView](v6, "recordingIndicatorView");
  BOOL v2 = -[TVSSRecordingIndicatorView displayLocation](v5, "displayLocation") == 0;
  id v4 = -[TVSSDebugPrivacyViewController privacyView](self, "privacyView");
  uint64_t v3 = -[TVSSPrivacyView recordingIndicatorView](v4, "recordingIndicatorView");
  -[TVSSRecordingIndicatorView setDisplayLocation:](v3, "setDisplayLocation:", v2);
}

- (TVSSPrivacyView)privacyView
{
  return self->_privacyView;
}

- (void).cxx_destruct
{
}

@end
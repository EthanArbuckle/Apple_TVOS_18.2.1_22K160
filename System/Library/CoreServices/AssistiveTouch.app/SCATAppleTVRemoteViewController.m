@interface SCATAppleTVRemoteViewController
- (SCATAppleTVRemoteButtonView)downArrowButton;
- (SCATAppleTVRemoteButtonView)homeButton;
- (SCATAppleTVRemoteButtonView)leftArrowButton;
- (SCATAppleTVRemoteButtonView)menuButton;
- (SCATAppleTVRemoteButtonView)playPauseButton;
- (SCATAppleTVRemoteButtonView)rightArrowButton;
- (SCATAppleTVRemoteButtonView)selectButton;
- (SCATAppleTVRemoteButtonView)upArrowButton;
- (SCATAppleTVRemoteViewController)initWithElementManager:(id)a3;
- (SCATAppleTVRemoteVolumeRockerView)volumeButton;
- (id)viewsRequiringStateUpdate;
- (void)didAddSubviewToDisplayContext:(id)a3;
- (void)loadView;
- (void)setDownArrowButton:(id)a3;
- (void)setHomeButton:(id)a3;
- (void)setLeftArrowButton:(id)a3;
- (void)setMenuButton:(id)a3;
- (void)setPlayPauseButton:(id)a3;
- (void)setRightArrowButton:(id)a3;
- (void)setSelectButton:(id)a3;
- (void)setUpArrowButton:(id)a3;
- (void)setVolumeButton:(id)a3;
@end

@implementation SCATAppleTVRemoteViewController

- (SCATAppleTVRemoteViewController)initWithElementManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SCATAppleTVRemoteViewController;
  return -[SCATElementManagerViewController initWithElementManager:](&v4, "initWithElementManager:", a3);
}

- (void)loadView
{
  double v4 = v3;
  v5 = objc_alloc(&OBJC_CLASS___SCATAppleTVRemoteExitingView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v109 = -[SCATAppleTVRemoteExitingView initWithFrame:](v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[SCATAppleTVRemoteExitingView setTranslatesAutoresizingMaskIntoConstraints:]( v109,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[SCATAppleTVRemoteViewController setView:](self, "setView:", v109);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteExitingView layer](v109, "layer"));
  [v9 setCornerRadius:v4];

  v106 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 4007LL));
  v10 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", v106);
  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:]( v10,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView layer](v10, "layer"));
  [v11 setCornerRadius:v4];

  -[UIVisualEffectView setClipsToBounds:](v10, "setClipsToBounds:", 1LL);
  -[SCATAppleTVRemoteExitingView addSubview:](v109, "addSubview:", v10);
  v12 = -[SCATAppleTVRemoteButtonView initWithGlyphName:shape:]( objc_alloc(&OBJC_CLASS___SCATAppleTVRemoteButtonView),  "initWithGlyphName:shape:",  @"select",  0LL);
  -[SCATAppleTVRemoteButtonView setActivateActionHandler:](v12, "setActivateActionHandler:", &stru_100122890);
  id v13 = sub_10002B014(@"Remote-Select");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  -[SCATAppleTVRemoteButtonView setAccessibilityLabel:](v12, "setAccessibilityLabel:", v14);

  -[SCATAppleTVRemoteViewController setSelectButton:](self, "setSelectButton:", v12);
  -[SCATAppleTVRemoteExitingView addSubview:](v109, "addSubview:", v12);
  v107 = -[SCATAppleTVRemoteButtonView initWithGlyphName:shape:]( objc_alloc(&OBJC_CLASS___SCATAppleTVRemoteButtonView),  "initWithGlyphName:shape:",  0LL,  1LL);
  -[SCATAppleTVRemoteButtonView setActivateActionHandler:](v107, "setActivateActionHandler:", &stru_1001228B0);
  id v15 = sub_10002B014(@"Remote-Up");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  -[SCATAppleTVRemoteButtonView setAccessibilityLabel:](v107, "setAccessibilityLabel:", v16);

  -[SCATAppleTVRemoteViewController setUpArrowButton:](self, "setUpArrowButton:", v107);
  -[SCATAppleTVRemoteExitingView addSubview:](v109, "addSubview:", v107);
  v17 = -[SCATAppleTVRemoteButtonView initWithGlyphName:shape:]( objc_alloc(&OBJC_CLASS___SCATAppleTVRemoteButtonView),  "initWithGlyphName:shape:",  0LL,  2LL);
  -[SCATAppleTVRemoteButtonView setActivateActionHandler:](v17, "setActivateActionHandler:", &stru_1001228D0);
  id v18 = sub_10002B014(@"Remote-Down");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  -[SCATAppleTVRemoteButtonView setAccessibilityLabel:](v17, "setAccessibilityLabel:", v19);

  -[SCATAppleTVRemoteViewController setDownArrowButton:](self, "setDownArrowButton:", v17);
  -[SCATAppleTVRemoteExitingView addSubview:](v109, "addSubview:", v17);
  v108 = -[SCATAppleTVRemoteButtonView initWithGlyphName:shape:]( objc_alloc(&OBJC_CLASS___SCATAppleTVRemoteButtonView),  "initWithGlyphName:shape:",  0LL,  3LL);
  -[SCATAppleTVRemoteButtonView setActivateActionHandler:](v108, "setActivateActionHandler:", &stru_1001228F0);
  id v20 = sub_10002B014(@"Remote-Left");
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  -[SCATAppleTVRemoteButtonView setAccessibilityLabel:](v108, "setAccessibilityLabel:", v21);

  -[SCATAppleTVRemoteViewController setLeftArrowButton:](self, "setLeftArrowButton:", v108);
  -[SCATAppleTVRemoteExitingView addSubview:](v109, "addSubview:", v108);
  v22 = -[SCATAppleTVRemoteButtonView initWithGlyphName:shape:]( objc_alloc(&OBJC_CLASS___SCATAppleTVRemoteButtonView),  "initWithGlyphName:shape:",  0LL,  4LL);
  -[SCATAppleTVRemoteButtonView setActivateActionHandler:](v22, "setActivateActionHandler:", &stru_100122910);
  id v23 = sub_10002B014(@"Remote-Right");
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  -[SCATAppleTVRemoteButtonView setAccessibilityLabel:](v22, "setAccessibilityLabel:", v24);

  -[SCATAppleTVRemoteViewController setRightArrowButton:](self, "setRightArrowButton:", v22);
  v25 = v22;
  -[SCATAppleTVRemoteExitingView addSubview:](v109, "addSubview:", v22);
  v26 = -[SCATAppleTVRemoteButtonView initWithGlyphName:shape:]( objc_alloc(&OBJC_CLASS___SCATAppleTVRemoteButtonView),  "initWithGlyphName:shape:",  @"menu",  0LL);
  -[SCATAppleTVRemoteButtonView setActivateActionHandler:](v26, "setActivateActionHandler:", &stru_100122930);
  id v27 = sub_10002B014(@"Remote-Menu");
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  -[SCATAppleTVRemoteButtonView setAccessibilityLabel:](v26, "setAccessibilityLabel:", v28);

  -[SCATAppleTVRemoteViewController setMenuButton:](self, "setMenuButton:", v26);
  -[SCATAppleTVRemoteExitingView addSubview:](v109, "addSubview:", v26);
  v29 = -[SCATAppleTVRemoteButtonView initWithGlyphName:shape:]( objc_alloc(&OBJC_CLASS___SCATAppleTVRemoteButtonView),  "initWithGlyphName:shape:",  @"home",  0LL);
  -[SCATAppleTVRemoteButtonView setActivateActionHandler:](v29, "setActivateActionHandler:", &stru_100122950);
  id v30 = sub_10002B014(@"Remote-Home");
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  -[SCATAppleTVRemoteButtonView setAccessibilityLabel:](v29, "setAccessibilityLabel:", v31);

  -[SCATAppleTVRemoteViewController setHomeButton:](self, "setHomeButton:", v29);
  -[SCATAppleTVRemoteExitingView addSubview:](v109, "addSubview:", v29);
  v32 = -[SCATAppleTVRemoteButtonView initWithGlyphName:shape:]( objc_alloc(&OBJC_CLASS___SCATAppleTVRemoteButtonView),  "initWithGlyphName:shape:",  @"play-pause",  0LL);
  -[SCATAppleTVRemoteViewController setPlayPauseButton:](self, "setPlayPauseButton:", v32);
  -[SCATAppleTVRemoteButtonView setActivateActionHandler:](v32, "setActivateActionHandler:", &stru_100122970);
  id v33 = sub_10002B014(@"Remote-Play");
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  -[SCATAppleTVRemoteButtonView setAccessibilityLabel:](v32, "setAccessibilityLabel:", v34);

  -[SCATAppleTVRemoteExitingView addSubview:](v109, "addSubview:", v32);
  v105 = -[SCATAppleTVRemoteVolumeRockerView initWithFrame:]( objc_alloc(&OBJC_CLASS___SCATAppleTVRemoteVolumeRockerView),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
  -[SCATAppleTVRemoteViewController setVolumeButton:](self, "setVolumeButton:", v105);
  -[SCATAppleTVRemoteExitingView addSubview:](v109, "addSubview:", v105);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteExitingView widthAnchor](v109, "widthAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue([v35 constraintEqualToConstant:200.0]);
  [v36 setActive:1];

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteExitingView heightAnchor](v109, "heightAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue([v37 constraintEqualToConstant:520.0]);
  [v38 setActive:1];

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView topAnchor](v10, "topAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteExitingView topAnchor](v109, "topAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue([v39 constraintEqualToAnchor:v40]);
  [v41 setActive:1];

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView rightAnchor](v10, "rightAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteExitingView rightAnchor](v109, "rightAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue([v42 constraintEqualToAnchor:v43]);
  [v44 setActive:1];

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView bottomAnchor](v10, "bottomAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteExitingView bottomAnchor](v109, "bottomAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue([v45 constraintEqualToAnchor:v46]);
  [v47 setActive:1];

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView leftAnchor](v10, "leftAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteExitingView leftAnchor](v109, "leftAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue([v48 constraintEqualToAnchor:v49]);
  [v50 setActive:1];

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView topAnchor](v107, "topAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteExitingView topAnchor](v109, "topAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue([v51 constraintEqualToAnchor:v52 constant:18.0]);
  [v53 setActive:1];

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView centerXAnchor](v107, "centerXAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteExitingView centerXAnchor](v109, "centerXAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue([v54 constraintEqualToAnchor:v55]);
  [v56 setActive:1];

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView topAnchor](v12, "topAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView bottomAnchor](v107, "bottomAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue([v57 constraintEqualToAnchor:v58 constant:15.0]);
  [v59 setActive:1];

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView centerXAnchor](v12, "centerXAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteExitingView centerXAnchor](v109, "centerXAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue([v60 constraintEqualToAnchor:v61]);
  [v62 setActive:1];

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView topAnchor](v17, "topAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView bottomAnchor](v12, "bottomAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue([v63 constraintEqualToAnchor:v64 constant:15.0]);
  [v65 setActive:1];

  v66 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView centerXAnchor](v17, "centerXAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteExitingView centerXAnchor](v109, "centerXAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue([v66 constraintEqualToAnchor:v67]);
  [v68 setActive:1];

  v69 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView leftAnchor](v108, "leftAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteExitingView leftAnchor](v109, "leftAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue([v69 constraintEqualToAnchor:v70 constant:18.0]);
  [v71 setActive:1];

  v72 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView centerYAnchor](v108, "centerYAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView centerYAnchor](v12, "centerYAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue([v72 constraintEqualToAnchor:v73]);
  [v74 setActive:1];

  v75 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView rightAnchor](v25, "rightAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteExitingView rightAnchor](v109, "rightAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue([v75 constraintEqualToAnchor:v76 constant:-18.0]);
  [v77 setActive:1];

  v78 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView centerYAnchor](v25, "centerYAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView centerYAnchor](v12, "centerYAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue([v78 constraintEqualToAnchor:v79]);
  [v80 setActive:1];

  v81 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView leftAnchor](v26, "leftAnchor"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteExitingView leftAnchor](v109, "leftAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue([v81 constraintEqualToAnchor:v82 constant:10.0]);
  [v83 setActive:1];

  v84 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView topAnchor](v26, "topAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView bottomAnchor](v17, "bottomAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue([v84 constraintEqualToAnchor:v85 constant:28.0]);
  [v86 setActive:1];

  v87 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView rightAnchor](v29, "rightAnchor"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteExitingView rightAnchor](v109, "rightAnchor"));
  v89 = (void *)objc_claimAutoreleasedReturnValue([v87 constraintEqualToAnchor:v88 constant:-10.0]);
  [v89 setActive:1];

  v90 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView topAnchor](v29, "topAnchor"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView bottomAnchor](v17, "bottomAnchor"));
  v92 = (void *)objc_claimAutoreleasedReturnValue([v90 constraintEqualToAnchor:v91 constant:28.0]);
  [v92 setActive:1];

  v93 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView leftAnchor](v32, "leftAnchor"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteExitingView leftAnchor](v109, "leftAnchor"));
  v95 = (void *)objc_claimAutoreleasedReturnValue([v93 constraintEqualToAnchor:v94 constant:10.0]);
  [v95 setActive:1];

  v96 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteButtonView bottomAnchor](v32, "bottomAnchor"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteExitingView bottomAnchor](v109, "bottomAnchor"));
  v98 = (void *)objc_claimAutoreleasedReturnValue([v96 constraintEqualToAnchor:v97 constant:-30.0]);
  [v98 setActive:1];

  v99 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeRockerView rightAnchor](v105, "rightAnchor"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteExitingView rightAnchor](v109, "rightAnchor"));
  v101 = (void *)objc_claimAutoreleasedReturnValue([v99 constraintEqualToAnchor:v100 constant:-10.0]);
  [v101 setActive:1];

  v102 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteVolumeRockerView bottomAnchor](v105, "bottomAnchor"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteExitingView bottomAnchor](v109, "bottomAnchor"));
  v104 = (void *)objc_claimAutoreleasedReturnValue([v102 constraintEqualToAnchor:v103 constant:-30.0]);
  [v104 setActive:1];
}

- (void)didAddSubviewToDisplayContext:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SCATAppleTVRemoteViewController;
  id v4 = a3;
  -[SCATElementManagerViewController didAddSubviewToDisplayContext:](&v13, "didAddSubviewToDisplayContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "centerYAnchor", v13.receiver, v13.super_class));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 centerYAnchor]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 constraintEqualToAnchor:v7]);
  [v8 setActive:1];

  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 leftAnchor]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 leftAnchor]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 constraintEqualToAnchor:v11 constant:-50.0]);
  [v12 setActive:1];
}

- (id)viewsRequiringStateUpdate
{
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteViewController selectButton](self, "selectButton"));
  v18[0] = v17;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteViewController upArrowButton](self, "upArrowButton"));
  v18[1] = v16;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteViewController downArrowButton](self, "downArrowButton"));
  v18[2] = v15;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteViewController leftArrowButton](self, "leftArrowButton"));
  v18[3] = v14;
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteViewController rightArrowButton](self, "rightArrowButton"));
  v18[4] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteViewController menuButton](self, "menuButton"));
  v18[5] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteViewController homeButton](self, "homeButton"));
  v18[6] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteViewController playPauseButton](self, "playPauseButton"));
  v18[7] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteViewController volumeButton](self, "volumeButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 decreaseVolumeView]);
  v18[8] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteViewController volumeButton](self, "volumeButton"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 increaseVolumeView]);
  v18[9] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAppleTVRemoteViewController exitingView](self, "exitingView"));
  v18[10] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 11LL));

  return v12;
}

- (SCATAppleTVRemoteButtonView)selectButton
{
  return self->_selectButton;
}

- (void)setSelectButton:(id)a3
{
}

- (SCATAppleTVRemoteButtonView)upArrowButton
{
  return self->_upArrowButton;
}

- (void)setUpArrowButton:(id)a3
{
}

- (SCATAppleTVRemoteButtonView)downArrowButton
{
  return self->_downArrowButton;
}

- (void)setDownArrowButton:(id)a3
{
}

- (SCATAppleTVRemoteButtonView)leftArrowButton
{
  return self->_leftArrowButton;
}

- (void)setLeftArrowButton:(id)a3
{
}

- (SCATAppleTVRemoteButtonView)rightArrowButton
{
  return self->_rightArrowButton;
}

- (void)setRightArrowButton:(id)a3
{
}

- (SCATAppleTVRemoteButtonView)menuButton
{
  return self->_menuButton;
}

- (void)setMenuButton:(id)a3
{
}

- (SCATAppleTVRemoteButtonView)homeButton
{
  return self->_homeButton;
}

- (void)setHomeButton:(id)a3
{
}

- (SCATAppleTVRemoteVolumeRockerView)volumeButton
{
  return self->_volumeButton;
}

- (void)setVolumeButton:(id)a3
{
}

- (SCATAppleTVRemoteButtonView)playPauseButton
{
  return self->_playPauseButton;
}

- (void)setPlayPauseButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
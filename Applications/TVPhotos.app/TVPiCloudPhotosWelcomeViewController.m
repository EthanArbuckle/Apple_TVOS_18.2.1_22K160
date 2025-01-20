@interface TVPiCloudPhotosWelcomeViewController
- (TVPVibrantLabel)descriptionLabel;
- (TVPVibrantLabel)titleLabel;
- (TVPiCloudPhotosWelcomeViewControllerDelegate)delegate;
- (UIButton)sharedAlbumsButton;
- (UIButton)turnOnButton;
- (UIImageView)accessoryImageView;
- (UIView)accessoryView;
- (UIView)dialogueView;
- (void)_setupAccessoryView;
- (void)_setupDialogueView;
- (void)_setupViews;
- (void)_turnOnSharedAlbumsSelected:(id)a3;
- (void)_turnOniCloudSelected:(id)a3;
- (void)setAccessoryImageView:(id)a3;
- (void)setAccessoryView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setDialogueView:(id)a3;
- (void)setSharedAlbumsButton:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTurnOnButton:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVPiCloudPhotosWelcomeViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVPiCloudPhotosWelcomeViewController;
  -[TVPiCloudPhotosWelcomeViewController viewDidLoad](&v3, "viewDidLoad");
  -[TVPiCloudPhotosWelcomeViewController _setupViews](self, "_setupViews");
}

- (void)_setupViews
{
}

- (void)_setupDialogueView
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___UIView);
  -[TVPiCloudPhotosWelcomeViewController setDialogueView:](self, "setDialogueView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController dialogueView](self, "dialogueView"));
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController dialogueView](self, "dialogueView"));
  [v5 addSubview:v6];

  v143 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController dialogueView](self, "dialogueView"));
  v139 = (void *)objc_claimAutoreleasedReturnValue([v143 leadingAnchor]);
  v141 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController view](self, "view"));
  v137 = (void *)objc_claimAutoreleasedReturnValue([v141 leadingAnchor]);
  v135 = (void *)objc_claimAutoreleasedReturnValue([v139 constraintEqualToAnchor:v137 constant:150.0]);
  v146[0] = v135;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController dialogueView](self, "dialogueView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 centerYAnchor]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 centerYAnchor]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 constraintEqualToAnchor:v10]);
  v146[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController dialogueView](self, "dialogueView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 widthAnchor]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 constraintEqualToConstant:835.0]);
  v146[2] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v146, 3LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v15);

  v16 = objc_alloc_init(&OBJC_CLASS___TVPVibrantLabel);
  -[TVPiCloudPhotosWelcomeViewController setTitleLabel:](self, "setTitleLabel:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController titleLabel](self, "titleLabel"));
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](&OBJC_CLASS___UIColor, "secondaryLabelColor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController titleLabel](self, "titleLabel"));
  [v19 setTextColor:v18];

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController titleLabel](self, "titleLabel"));
  [v20 setTextAlignment:1];

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager title1FontEmphasized](&OBJC_CLASS___TVPThemeManager, "title1FontEmphasized"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController titleLabel](self, "titleLabel"));
  [v22 setFont:v21];

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController titleLabel](self, "titleLabel"));
  [v23 setNumberOfLines:2];

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController titleLabel](self, "titleLabel"));
  [v24 setAdjustsFontSizeToFitWidth:1];

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v26 = (void *)objc_claimAutoreleasedReturnValue( [v25 localizedStringForKey:@"TVPiCloudWelcomeTitle" value:&stru_1000CC6C8 table:0]);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController titleLabel](self, "titleLabel"));
  [v27 setText:v26];

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController dialogueView](self, "dialogueView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController titleLabel](self, "titleLabel"));
  [v28 addSubview:v29];

  v30 = objc_alloc_init(&OBJC_CLASS___TVPVibrantLabel);
  -[TVPiCloudPhotosWelcomeViewController setDescriptionLabel:](self, "setDescriptionLabel:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController descriptionLabel](self, "descriptionLabel"));
  [v31 setTranslatesAutoresizingMaskIntoConstraints:0];

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](&OBJC_CLASS___UIColor, "tertiaryLabelColor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController descriptionLabel](self, "descriptionLabel"));
  [v33 setTextColor:v32];

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController descriptionLabel](self, "descriptionLabel"));
  [v34 setTextAlignment:1];

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager headlineFont](&OBJC_CLASS___TVPThemeManager, "headlineFont"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController descriptionLabel](self, "descriptionLabel"));
  [v36 setFont:v35];

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController descriptionLabel](self, "descriptionLabel"));
  [v37 setNumberOfLines:0];

  uint64_t v39 = PXLocalizedSharedLibraryString(@"PXSharedLibrary_tvOS_CloudWelcomeDescription", v38);
  v144 = (void *)objc_claimAutoreleasedReturnValue(v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController descriptionLabel](self, "descriptionLabel"));
  [v40 setText:v144];

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController dialogueView](self, "dialogueView"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController descriptionLabel](self, "descriptionLabel"));
  [v41 addSubview:v42];

  v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](&OBJC_CLASS___UIButton, "buttonWithType:", 6LL));
  -[TVPiCloudPhotosWelcomeViewController setTurnOnButton:](self, "setTurnOnButton:", v43);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController turnOnButton](self, "turnOnButton"));
  [v44 setTranslatesAutoresizingMaskIntoConstraints:0];

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController turnOnButton](self, "turnOnButton"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v47 = (void *)objc_claimAutoreleasedReturnValue( [v46 localizedStringForKey:@"TVPiCloudWelcomeTurnOniCloudPhotos" value:&stru_1000CC6C8 table:0]);
  [v45 setTitle:v47 forState:0];

  v48 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager headlineFont](&OBJC_CLASS___TVPThemeManager, "headlineFont"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController turnOnButton](self, "turnOnButton"));
  v50 = (void *)objc_claimAutoreleasedReturnValue([v49 titleLabel]);
  [v50 setFont:v48];

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController turnOnButton](self, "turnOnButton"));
  [v51 addTarget:self action:"_turnOniCloudSelected:" forControlEvents:0x2000];

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController dialogueView](self, "dialogueView"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController turnOnButton](self, "turnOnButton"));
  [v52 addSubview:v53];

  v54 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](&OBJC_CLASS___UIButton, "buttonWithType:", 6LL));
  -[TVPiCloudPhotosWelcomeViewController setSharedAlbumsButton:](self, "setSharedAlbumsButton:", v54);

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController sharedAlbumsButton](self, "sharedAlbumsButton"));
  [v55 setTranslatesAutoresizingMaskIntoConstraints:0];

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController sharedAlbumsButton](self, "sharedAlbumsButton"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v58 = (void *)objc_claimAutoreleasedReturnValue( [v57 localizedStringForKey:@"TVPiCloudWelcomeTurnOnSharedAlbums" value:&stru_1000CC6C8 table:0]);
  [v56 setTitle:v58 forState:0];

  v59 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager headlineFont](&OBJC_CLASS___TVPThemeManager, "headlineFont"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController sharedAlbumsButton](self, "sharedAlbumsButton"));
  v61 = (void *)objc_claimAutoreleasedReturnValue([v60 titleLabel]);
  [v61 setFont:v59];

  v62 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController sharedAlbumsButton](self, "sharedAlbumsButton"));
  [v62 addTarget:self action:"_turnOnSharedAlbumsSelected:" forControlEvents:0x2000];

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController dialogueView](self, "dialogueView"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController sharedAlbumsButton](self, "sharedAlbumsButton"));
  [v63 addSubview:v64];

  v142 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController titleLabel](self, "titleLabel"));
  v138 = (void *)objc_claimAutoreleasedReturnValue([v142 topAnchor]);
  v140 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController dialogueView](self, "dialogueView"));
  v136 = (void *)objc_claimAutoreleasedReturnValue([v140 topAnchor]);
  v134 = (void *)objc_claimAutoreleasedReturnValue([v138 constraintEqualToAnchor:v136]);
  v145[0] = v134;
  v133 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController titleLabel](self, "titleLabel"));
  v131 = (void *)objc_claimAutoreleasedReturnValue([v133 leadingAnchor]);
  v132 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController dialogueView](self, "dialogueView"));
  v130 = (void *)objc_claimAutoreleasedReturnValue([v132 leadingAnchor]);
  v129 = (void *)objc_claimAutoreleasedReturnValue([v131 constraintEqualToAnchor:v130]);
  v145[1] = v129;
  v128 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController titleLabel](self, "titleLabel"));
  v126 = (void *)objc_claimAutoreleasedReturnValue([v128 trailingAnchor]);
  v127 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController dialogueView](self, "dialogueView"));
  v125 = (void *)objc_claimAutoreleasedReturnValue([v127 trailingAnchor]);
  v124 = (void *)objc_claimAutoreleasedReturnValue([v126 constraintEqualToAnchor:v125]);
  v145[2] = v124;
  v123 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController descriptionLabel](self, "descriptionLabel"));
  v121 = (void *)objc_claimAutoreleasedReturnValue([v123 topAnchor]);
  v122 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController titleLabel](self, "titleLabel"));
  v120 = (void *)objc_claimAutoreleasedReturnValue([v122 bottomAnchor]);
  v119 = (void *)objc_claimAutoreleasedReturnValue([v121 constraintEqualToAnchor:v120 constant:20.0]);
  v145[3] = v119;
  v118 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController descriptionLabel](self, "descriptionLabel"));
  v116 = (void *)objc_claimAutoreleasedReturnValue([v118 leadingAnchor]);
  v117 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController dialogueView](self, "dialogueView"));
  v115 = (void *)objc_claimAutoreleasedReturnValue([v117 leadingAnchor]);
  v114 = (void *)objc_claimAutoreleasedReturnValue([v116 constraintEqualToAnchor:v115]);
  v145[4] = v114;
  v113 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController descriptionLabel](self, "descriptionLabel"));
  v111 = (void *)objc_claimAutoreleasedReturnValue([v113 trailingAnchor]);
  v112 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController dialogueView](self, "dialogueView"));
  v110 = (void *)objc_claimAutoreleasedReturnValue([v112 trailingAnchor]);
  v109 = (void *)objc_claimAutoreleasedReturnValue([v111 constraintEqualToAnchor:v110]);
  v145[5] = v109;
  v108 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController turnOnButton](self, "turnOnButton"));
  v106 = (void *)objc_claimAutoreleasedReturnValue([v108 topAnchor]);
  v107 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController descriptionLabel](self, "descriptionLabel"));
  v105 = (void *)objc_claimAutoreleasedReturnValue([v107 bottomAnchor]);
  v104 = (void *)objc_claimAutoreleasedReturnValue([v106 constraintEqualToAnchor:v105 constant:60.0]);
  v145[6] = v104;
  v103 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController turnOnButton](self, "turnOnButton"));
  v102 = (void *)objc_claimAutoreleasedReturnValue([v103 widthAnchor]);
  v101 = (void *)objc_claimAutoreleasedReturnValue([v102 constraintGreaterThanOrEqualToConstant:500.0]);
  v145[7] = v101;
  v100 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController turnOnButton](self, "turnOnButton"));
  v99 = (void *)objc_claimAutoreleasedReturnValue([v100 widthAnchor]);
  v98 = (void *)objc_claimAutoreleasedReturnValue([v99 constraintLessThanOrEqualToConstant:960.0]);
  v145[8] = v98;
  v97 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController turnOnButton](self, "turnOnButton"));
  v96 = (void *)objc_claimAutoreleasedReturnValue([v97 heightAnchor]);
  v95 = (void *)objc_claimAutoreleasedReturnValue([v96 constraintEqualToConstant:66.0]);
  v145[9] = v95;
  v94 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController turnOnButton](self, "turnOnButton"));
  v92 = (void *)objc_claimAutoreleasedReturnValue([v94 centerXAnchor]);
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController dialogueView](self, "dialogueView"));
  v91 = (void *)objc_claimAutoreleasedReturnValue([v93 centerXAnchor]);
  v90 = (void *)objc_claimAutoreleasedReturnValue([v92 constraintEqualToAnchor:v91]);
  v145[10] = v90;
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController sharedAlbumsButton](self, "sharedAlbumsButton"));
  v87 = (void *)objc_claimAutoreleasedReturnValue([v89 topAnchor]);
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController turnOnButton](self, "turnOnButton"));
  v86 = (void *)objc_claimAutoreleasedReturnValue([v88 bottomAnchor]);
  v85 = (void *)objc_claimAutoreleasedReturnValue([v87 constraintEqualToAnchor:v86 constant:14.0]);
  v145[11] = v85;
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController sharedAlbumsButton](self, "sharedAlbumsButton"));
  v83 = (void *)objc_claimAutoreleasedReturnValue([v84 widthAnchor]);
  v82 = (void *)objc_claimAutoreleasedReturnValue([v83 constraintGreaterThanOrEqualToConstant:500.0]);
  v145[12] = v82;
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController sharedAlbumsButton](self, "sharedAlbumsButton"));
  v80 = (void *)objc_claimAutoreleasedReturnValue([v81 widthAnchor]);
  v79 = (void *)objc_claimAutoreleasedReturnValue([v80 constraintLessThanOrEqualToConstant:960.0]);
  v145[13] = v79;
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController sharedAlbumsButton](self, "sharedAlbumsButton"));
  v77 = (void *)objc_claimAutoreleasedReturnValue([v78 heightAnchor]);
  v76 = (void *)objc_claimAutoreleasedReturnValue([v77 constraintEqualToConstant:66.0]);
  v145[14] = v76;
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController sharedAlbumsButton](self, "sharedAlbumsButton"));
  v65 = (void *)objc_claimAutoreleasedReturnValue([v75 centerXAnchor]);
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController dialogueView](self, "dialogueView"));
  v67 = (void *)objc_claimAutoreleasedReturnValue([v66 centerXAnchor]);
  v68 = (void *)objc_claimAutoreleasedReturnValue([v65 constraintEqualToAnchor:v67]);
  v145[15] = v68;
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController sharedAlbumsButton](self, "sharedAlbumsButton"));
  v70 = (void *)objc_claimAutoreleasedReturnValue([v69 bottomAnchor]);
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController dialogueView](self, "dialogueView"));
  v72 = (void *)objc_claimAutoreleasedReturnValue([v71 bottomAnchor]);
  v73 = (void *)objc_claimAutoreleasedReturnValue([v70 constraintEqualToAnchor:v72 constant:-14.0]);
  v145[16] = v73;
  v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v145, 17LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v74);
}

- (void)_setupAccessoryView
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___UIImageView);
  -[TVPiCloudPhotosWelcomeViewController setAccessoryImageView:](self, "setAccessoryImageView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController accessoryImageView](self, "accessoryImageView"));
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"Welcome-Photos-Icon"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController accessoryImageView](self, "accessoryImageView"));
  [v6 setImage:v5];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController accessoryImageView](self, "accessoryImageView"));
  [v7 setContentMode:1];

  v8 = objc_alloc_init(&OBJC_CLASS___UIView);
  -[TVPiCloudPhotosWelcomeViewController setAccessoryView:](self, "setAccessoryView:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController accessoryView](self, "accessoryView"));
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController accessoryView](self, "accessoryView"));
  [v10 addSubview:v11];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController dialogueView](self, "dialogueView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController accessoryImageView](self, "accessoryImageView"));
  [v12 addSubview:v13];

  v69 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController accessoryView](self, "accessoryView"));
  v67 = (void *)objc_claimAutoreleasedReturnValue([v69 leadingAnchor]);
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController dialogueView](self, "dialogueView"));
  v66 = (void *)objc_claimAutoreleasedReturnValue([v68 trailingAnchor]);
  v65 = (void *)objc_claimAutoreleasedReturnValue([v67 constraintEqualToAnchor:v66 constant:110.0]);
  v70[0] = v65;
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController accessoryView](self, "accessoryView"));
  v62 = (void *)objc_claimAutoreleasedReturnValue([v64 trailingAnchor]);
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController view](self, "view"));
  v61 = (void *)objc_claimAutoreleasedReturnValue([v63 trailingAnchor]);
  v60 = (void *)objc_claimAutoreleasedReturnValue([v62 constraintEqualToAnchor:v61 constant:-125.0]);
  v70[1] = v60;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController accessoryView](self, "accessoryView"));
  v57 = (void *)objc_claimAutoreleasedReturnValue([v59 topAnchor]);
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController view](self, "view"));
  v56 = (void *)objc_claimAutoreleasedReturnValue([v58 topAnchor]);
  v55 = (void *)objc_claimAutoreleasedReturnValue([v57 constraintEqualToAnchor:v56]);
  v70[2] = v55;
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController accessoryView](self, "accessoryView"));
  v52 = (void *)objc_claimAutoreleasedReturnValue([v54 bottomAnchor]);
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController view](self, "view"));
  v51 = (void *)objc_claimAutoreleasedReturnValue([v53 bottomAnchor]);
  v50 = (void *)objc_claimAutoreleasedReturnValue([v52 constraintEqualToAnchor:v51]);
  v70[3] = v50;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController accessoryView](self, "accessoryView"));
  v48 = (void *)objc_claimAutoreleasedReturnValue([v49 widthAnchor]);
  v47 = (void *)objc_claimAutoreleasedReturnValue([v48 constraintEqualToConstant:700.0]);
  v70[4] = v47;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController accessoryImageView](self, "accessoryImageView"));
  v44 = (void *)objc_claimAutoreleasedReturnValue([v46 trailingAnchor]);
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController accessoryView](self, "accessoryView"));
  v43 = (void *)objc_claimAutoreleasedReturnValue([v45 trailingAnchor]);
  v42 = (void *)objc_claimAutoreleasedReturnValue([v44 constraintEqualToAnchor:v43 constant:-100.0]);
  v70[5] = v42;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController accessoryImageView](self, "accessoryImageView"));
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v41 leadingAnchor]);
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController accessoryView](self, "accessoryView"));
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v40 leadingAnchor]);
  v37 = (void *)objc_claimAutoreleasedReturnValue([v39 constraintEqualToAnchor:v38 constant:100.0]);
  v70[6] = v37;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController accessoryImageView](self, "accessoryImageView"));
  v32 = (void *)objc_claimAutoreleasedReturnValue([v36 heightAnchor]);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController accessoryImageView](self, "accessoryImageView"));
  v31 = (void *)objc_claimAutoreleasedReturnValue([v35 widthAnchor]);
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController accessoryImageView](self, "accessoryImageView"));
  v33 = (void *)objc_claimAutoreleasedReturnValue([v34 image]);
  [v33 size];
  double v15 = v14;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController accessoryImageView](self, "accessoryImageView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue([v30 image]);
  [v29 size];
  v28 = (void *)objc_claimAutoreleasedReturnValue([v32 constraintEqualToAnchor:v31 multiplier:v15 / v16]);
  v70[7] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController accessoryImageView](self, "accessoryImageView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v27 centerYAnchor]);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController accessoryView](self, "accessoryView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 centerYAnchor]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v17 constraintEqualToAnchor:v19]);
  v70[8] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController accessoryImageView](self, "accessoryImageView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 centerXAnchor]);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController accessoryView](self, "accessoryView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 centerXAnchor]);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v22 constraintEqualToAnchor:v24]);
  v70[9] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v70, 10LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v26);
}

- (void)_turnOniCloudSelected:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController delegate](self, "delegate", a3));
  [v4 turnOnWelcomeSectionType:0];

  uint64_t v10 = CPAnalyticsPayloadClassNameKey;
  v6 = (objc_class *)objc_opt_class(self, v5);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v11 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
  +[CPAnalytics sendEvent:withPayload:]( &OBJC_CLASS___CPAnalytics,  "sendEvent:withPayload:",  @"com.apple.photos.CPAnalytics.tvWelcomeiCloudSelected",  v9);
}

- (void)_turnOnSharedAlbumsSelected:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPiCloudPhotosWelcomeViewController delegate](self, "delegate", a3));
  [v4 turnOnWelcomeSectionType:1];

  uint64_t v10 = CPAnalyticsPayloadClassNameKey;
  v6 = (objc_class *)objc_opt_class(self, v5);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v11 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
  +[CPAnalytics sendEvent:withPayload:]( &OBJC_CLASS___CPAnalytics,  "sendEvent:withPayload:",  @"com.apple.photos.CPAnalytics.tvWelcomeSharedLibrarySelected",  v9);
}

- (TVPiCloudPhotosWelcomeViewControllerDelegate)delegate
{
  return (TVPiCloudPhotosWelcomeViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (UIView)dialogueView
{
  return self->_dialogueView;
}

- (void)setDialogueView:(id)a3
{
}

- (TVPVibrantLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (TVPVibrantLabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (UIButton)turnOnButton
{
  return self->_turnOnButton;
}

- (void)setTurnOnButton:(id)a3
{
}

- (UIButton)sharedAlbumsButton
{
  return self->_sharedAlbumsButton;
}

- (void)setSharedAlbumsButton:(id)a3
{
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (void)setAccessoryView:(id)a3
{
}

- (UIImageView)accessoryImageView
{
  return self->_accessoryImageView;
}

- (void)setAccessoryImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
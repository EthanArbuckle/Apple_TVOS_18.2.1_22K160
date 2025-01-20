@interface TVPPhotoLibraryOptInOfferViewController
- (UIButton)optInButton;
- (UILabel)footerLabel;
- (id)_descriptionColor;
- (id)_footerColor;
- (id)_titleColor;
- (id)optInBlock;
- (id)optOutBlock;
- (void)_optIn:(id)a3;
- (void)_optOut:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setFooterLabel:(id)a3;
- (void)setOptInBlock:(id)a3;
- (void)setOptInButton:(id)a3;
- (void)setOptOutBlock:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVPPhotoLibraryOptInOfferViewController

- (void)viewDidLoad
{
  v123.receiver = self;
  v123.super_class = (Class)&OBJC_CLASS___TVPPhotoLibraryOptInOfferViewController;
  -[TVPPhotoLibraryOptInOfferViewController viewDidLoad](&v123, "viewDidLoad");
  v3 = objc_alloc_init(&OBJC_CLASS___UILabel);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager title1Font](&OBJC_CLASS___TVPThemeManager, "title1Font"));
  -[UILabel setFont:](v3, "setFont:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOptInOfferViewController _titleColor](self, "_titleColor"));
  -[UILabel setTextColor:](v3, "setTextColor:", v5);

  -[UILabel setTextAlignment:](v3, "setTextAlignment:", 1LL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedStringForKey:@"iCPLOptInTitle" value:&stru_1000CC6C8 table:0]);
  -[UILabel setText:](v3, "setText:", v7);

  -[UILabel setNumberOfLines:](v3, "setNumberOfLines:", 2LL);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOptInOfferViewController view](self, "view"));
  [v8 addSubview:v3];

  v9 = objc_alloc_init(&OBJC_CLASS___UILabel);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager headlineFont](&OBJC_CLASS___TVPThemeManager, "headlineFont"));
  -[UILabel setFont:](v9, "setFont:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOptInOfferViewController _descriptionColor](self, "_descriptionColor"));
  -[UILabel setTextColor:](v9, "setTextColor:", v11);

  -[UILabel setTextAlignment:](v9, "setTextAlignment:", 1LL);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue( [v12 localizedStringForKey:@"iCPLOptInDescription" value:&stru_1000CC6C8 table:0]);
  -[UILabel setText:](v9, "setText:", v13);

  -[UILabel setNumberOfLines:](v9, "setNumberOfLines:", 0LL);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOptInOfferViewController view](self, "view"));
  [v14 addSubview:v9];

  v15 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](&OBJC_CLASS___UIButton, "buttonWithType:", 1LL));
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  -[UIButton addTarget:action:forControlEvents:](v15, "addTarget:action:forControlEvents:", self, "_optIn:", 0x2000LL);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 localizedStringForKey:@"iCPLOptInOK" value:&stru_1000CC6C8 table:0]);
  -[UIButton setTitle:forState:](v15, "setTitle:forState:", v17, 0LL);

  -[UIButton _setBlurEnabled:](v15, "_setBlurEnabled:", 0LL);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOptInOfferViewController view](self, "view"));
  [v18 addSubview:v15];

  optInButton = self->_optInButton;
  self->_optInButton = v15;
  v20 = v15;

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](&OBJC_CLASS___UIButton, "buttonWithType:", 1LL));
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v21 addTarget:self action:"_optOut:" forControlEvents:0x2000];
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v23 = (void *)objc_claimAutoreleasedReturnValue( [v22 localizedStringForKey:@"iCPLOptInCancel" value:&stru_1000CC6C8 table:0]);
  [v21 setTitle:v23 forState:0];

  [v21 _setBlurEnabled:0];
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOptInOfferViewController view](self, "view"));
  [v24 addSubview:v21];

  v25 = objc_alloc(&OBJC_CLASS___UIImageView);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"Photos-Icon"));
  v122 = -[UIImageView initWithImage:](v25, "initWithImage:", v26);

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v122,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOptInOfferViewController view](self, "view"));
  [v27 addSubview:v122];

  v28 = objc_alloc_init(&OBJC_CLASS___UILabel);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager caption2Font](&OBJC_CLASS___TVPThemeManager, "caption2Font"));
  -[UILabel setFont:](v28, "setFont:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOptInOfferViewController _footerColor](self, "_footerColor"));
  -[UILabel setTextColor:](v28, "setTextColor:", v30);

  -[UILabel setTextAlignment:](v28, "setTextAlignment:", 1LL);
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v32 = (void *)objc_claimAutoreleasedReturnValue( [v31 localizedStringForKey:@"iCPLOptInWarning" value:&stru_1000CC6C8 table:0]);
  -[UILabel setText:](v28, "setText:", v32);

  -[UILabel setNumberOfLines:](v28, "setNumberOfLines:", 0LL);
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOptInOfferViewController view](self, "view"));
  [v33 addSubview:v28];

  footerLabel = self->_footerLabel;
  self->_footerLabel = v28;
  v121 = v28;

  v35 = objc_alloc_init(&OBJC_CLASS___UILayoutGuide);
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOptInOfferViewController view](self, "view"));
  [v36 addLayoutGuide:v35];

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v35, "topAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOptInOfferViewController view](self, "view"));
  v39 = (void *)objc_claimAutoreleasedReturnValue([v38 topAnchor]);
  v40 = (void *)objc_claimAutoreleasedReturnValue([v37 constraintEqualToAnchor:v39 constant:265.0]);
  [v40 setActive:1];

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide rightAnchor](v35, "rightAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOptInOfferViewController view](self, "view"));
  v43 = (void *)objc_claimAutoreleasedReturnValue([v42 rightAnchor]);
  v44 = (void *)objc_claimAutoreleasedReturnValue([v41 constraintEqualToAnchor:v43 constant:-230.0]);
  [v44 setActive:1];

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v35, "bottomAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOptInOfferViewController view](self, "view"));
  v47 = (void *)objc_claimAutoreleasedReturnValue([v46 bottomAnchor]);
  v48 = (void *)objc_claimAutoreleasedReturnValue([v45 constraintEqualToAnchor:v47 constant:-265.0]);
  [v48 setActive:1];

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leftAnchor](v35, "leftAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOptInOfferViewController view](self, "view"));
  v51 = (void *)objc_claimAutoreleasedReturnValue([v50 leftAnchor]);
  v52 = (void *)objc_claimAutoreleasedReturnValue([v49 constraintEqualToAnchor:v51 constant:230.0]);
  [v52 setActive:1];

  v53 = objc_alloc_init(&OBJC_CLASS___UILayoutGuide);
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOptInOfferViewController view](self, "view"));
  [v54 addLayoutGuide:v53];

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v53, "topAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v35, "topAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue([v55 constraintEqualToAnchor:v56]);
  [v57 setActive:1];

  v58 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leftAnchor](v53, "leftAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leftAnchor](v35, "leftAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue([v58 constraintEqualToAnchor:v59]);
  [v60 setActive:1];

  v61 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide widthAnchor](v53, "widthAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue([v61 constraintEqualToConstant:820.0]);
  [v62 setActive:1];

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v3, "topAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v53, "topAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue([v63 constraintEqualToAnchor:v64]);
  [v65 setActive:1];

  v66 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel rightAnchor](v3, "rightAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide rightAnchor](v53, "rightAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue([v66 constraintEqualToAnchor:v67]);
  [v68 setActive:1];

  v69 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leftAnchor](v3, "leftAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leftAnchor](v53, "leftAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue([v69 constraintEqualToAnchor:v70]);
  [v71 setActive:1];

  v72 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v9, "topAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](v3, "lastBaselineAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue([v72 constraintEqualToAnchor:v73 constant:50.0]);
  [v74 setActive:1];

  v75 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel rightAnchor](v9, "rightAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide rightAnchor](v53, "rightAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue([v75 constraintEqualToAnchor:v76]);
  [v77 setActive:1];

  v78 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leftAnchor](v9, "leftAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leftAnchor](v53, "leftAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue([v78 constraintEqualToAnchor:v79]);
  [v80 setActive:1];

  v81 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](v20, "topAnchor"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](v9, "lastBaselineAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue([v81 constraintEqualToAnchor:v82 constant:60.0]);
  [v83 setActive:1];

  v84 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerXAnchor](v20, "centerXAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v53, "centerXAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue([v84 constraintEqualToAnchor:v85]);
  [v86 setActive:1];

  v87 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](v20, "widthAnchor"));
  v88 = (void *)objc_claimAutoreleasedReturnValue([v87 constraintGreaterThanOrEqualToConstant:520.0]);
  [v88 setActive:1];

  v89 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](v20, "widthAnchor"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide widthAnchor](v53, "widthAnchor"));
  v91 = (void *)objc_claimAutoreleasedReturnValue([v89 constraintLessThanOrEqualToAnchor:v90]);
  [v91 setActive:1];

  v92 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](v20, "heightAnchor"));
  v93 = (void *)objc_claimAutoreleasedReturnValue([v92 constraintEqualToConstant:70.0]);
  [v93 setActive:1];

  v94 = (void *)objc_claimAutoreleasedReturnValue([v21 topAnchor]);
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](v20, "bottomAnchor"));
  v96 = (void *)objc_claimAutoreleasedReturnValue([v94 constraintEqualToAnchor:v95 constant:14.0]);
  [v96 setActive:1];

  v97 = (void *)objc_claimAutoreleasedReturnValue([v21 centerXAnchor]);
  v98 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v53, "centerXAnchor"));
  v99 = (void *)objc_claimAutoreleasedReturnValue([v97 constraintEqualToAnchor:v98]);
  [v99 setActive:1];

  v100 = (void *)objc_claimAutoreleasedReturnValue([v21 widthAnchor]);
  v101 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](v20, "widthAnchor"));

  v102 = (void *)objc_claimAutoreleasedReturnValue([v100 constraintEqualToAnchor:v101]);
  [v102 setActive:1];

  v103 = (void *)objc_claimAutoreleasedReturnValue([v21 heightAnchor]);
  v104 = (void *)objc_claimAutoreleasedReturnValue([v103 constraintEqualToConstant:70.0]);
  [v104 setActive:1];

  v105 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](v122, "topAnchor"));
  v106 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v35, "topAnchor"));
  v107 = (void *)objc_claimAutoreleasedReturnValue([v105 constraintEqualToAnchor:v106]);
  [v107 setActive:1];

  v108 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leftAnchor](v122, "leftAnchor"));
  v109 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide rightAnchor](v53, "rightAnchor"));
  v110 = (void *)objc_claimAutoreleasedReturnValue([v108 constraintEqualToAnchor:v109 constant:90.0]);
  [v110 setActive:1];

  v111 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel rightAnchor](v121, "rightAnchor"));
  v112 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide rightAnchor](v35, "rightAnchor"));
  v113 = (void *)objc_claimAutoreleasedReturnValue([v111 constraintEqualToAnchor:v112]);
  [v113 setActive:1];

  v114 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](v121, "lastBaselineAnchor"));
  v115 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOptInOfferViewController view](self, "view"));
  v116 = (void *)objc_claimAutoreleasedReturnValue([v115 bottomAnchor]);
  v117 = (void *)objc_claimAutoreleasedReturnValue([v114 constraintEqualToAnchor:v116 constant:-60.0]);
  [v117 setActive:1];

  v118 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leftAnchor](v121, "leftAnchor"));
  v119 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leftAnchor](v35, "leftAnchor"));
  v120 = (void *)objc_claimAutoreleasedReturnValue([v118 constraintEqualToAnchor:v119]);
  [v120 setActive:1];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a4;
  v7 = (UIButton *)objc_claimAutoreleasedReturnValue([a3 nextFocusedView]);
  LOBYTE(a3) = v7 != self->_optInButton;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100062E30;
  v8[3] = &unk_1000CA4D0;
  v8[4] = self;
  char v9 = (char)a3;
  [v6 addCoordinatedAnimations:v8 completion:0];
}

- (id)_titleColor
{
  return +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.8);
}

- (id)_descriptionColor
{
  return +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.45);
}

- (id)_footerColor
{
  return +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.6);
}

- (void)_optIn:(id)a3
{
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOptInOfferViewController optInBlock](self, "optInBlock", a3));
  v3[2]();
}

- (void)_optOut:(id)a3
{
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOptInOfferViewController optOutBlock](self, "optOutBlock", a3));
  v3[2]();
}

- (id)optInBlock
{
  return self->_optInBlock;
}

- (void)setOptInBlock:(id)a3
{
}

- (id)optOutBlock
{
  return self->_optOutBlock;
}

- (void)setOptOutBlock:(id)a3
{
}

- (UIButton)optInButton
{
  return self->_optInButton;
}

- (void)setOptInButton:(id)a3
{
}

- (UILabel)footerLabel
{
  return self->_footerLabel;
}

- (void)setFooterLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
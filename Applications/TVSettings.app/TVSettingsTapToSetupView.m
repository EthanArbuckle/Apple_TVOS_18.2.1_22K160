@interface TVSettingsTapToSetupView
- (NSArray)constraints;
- (NSString)footer;
- (NSString)instructions;
- (NSString)title;
- (TVSettingsTapToSetupView)initWithFrame:(CGRect)a3;
- (UIActivityIndicatorView)spinnerView;
- (UIImageView)imageView;
- (UILabel)bodyLabel;
- (UILabel)footerLabel;
- (UILabel)spinnerStatusLabel;
- (UILabel)titleLabel;
- (UIView)contentAreaView;
- (void)_setActivityIndicatorIsInProgress:(BOOL)a3;
- (void)_updateCompositingEffects;
- (void)setFooter:(id)a3;
- (void)setInstructions:(id)a3;
- (void)setTitle:(id)a3;
- (void)startAnimatingSpinner;
- (void)startAnimatingSpinnerWithStatus:(id)a3;
- (void)stopAnimatingSpinner;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TVSettingsTapToSetupView

- (TVSettingsTapToSetupView)initWithFrame:(CGRect)a3
{
  v160.receiver = self;
  v160.super_class = (Class)&OBJC_CLASS___TVSettingsTapToSetupView;
  v3 = -[TVSettingsTapToSetupView initWithFrame:]( &v160,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___UIView);
    contentAreaView = v3->_contentAreaView;
    v3->_contentAreaView = v4;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( v3->_contentAreaView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[TVSettingsTapToSetupView addSubview:](v3, "addSubview:", v3->_contentAreaView);
    v6 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v6;

    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 0LL);
    v8 = v3->_titleLabel;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont _preferredFontForTextStyle:variant:]( &OBJC_CLASS___UIFont,  "_preferredFontForTextStyle:variant:"));
    -[UILabel setFont:](v8, "setFont:", v9);

    v10 = v3->_titleLabel;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](&OBJC_CLASS___UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v10, "setTextColor:", v11);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v3->_titleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIView addSubview:](v3->_contentAreaView, "addSubview:", v3->_titleLabel);
    v12 = objc_alloc_init(&OBJC_CLASS___UILabel);
    bodyLabel = v3->_bodyLabel;
    v3->_bodyLabel = v12;

    -[UILabel setNumberOfLines:](v3->_bodyLabel, "setNumberOfLines:", 0LL);
    v14 = v3->_bodyLabel;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline));
    -[UILabel setFont:](v14, "setFont:", v15);

    v16 = v3->_bodyLabel;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](&OBJC_CLASS___UIColor, "tertiaryLabelColor"));
    -[UILabel setTextColor:](v16, "setTextColor:", v17);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v3->_bodyLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIView addSubview:](v3->_contentAreaView, "addSubview:", v3->_bodyLabel);
    v18 = objc_alloc_init(&OBJC_CLASS___UILabel);
    footerLabel = v3->_footerLabel;
    v3->_footerLabel = v18;

    v20 = v3->_footerLabel;
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption2));
    -[UILabel setFont:](v20, "setFont:", v21);

    -[UILabel setNumberOfLines:](v3->_footerLabel, "setNumberOfLines:", 0LL);
    -[UILabel setTextAlignment:](v3->_footerLabel, "setTextAlignment:", 1LL);
    v22 = v3->_footerLabel;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](&OBJC_CLASS___UIColor, "tertiaryLabelColor"));
    -[UILabel setTextColor:](v22, "setTextColor:", v23);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v3->_footerLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UILabel setAlpha:](v3->_footerLabel, "setAlpha:", 0.0);
    -[UIView addSubview:](v3->_contentAreaView, "addSubview:", v3->_footerLabel);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 1000LL));
    uint64_t v25 = objc_claimAutoreleasedReturnValue(+[UIVibrancyEffect effectForBlurEffect:](&OBJC_CLASS___UIVibrancyEffect, "effectForBlurEffect:", v24));

    v158 = (void *)v25;
    v26 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", v25);
    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:]( v26,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIView addSubview:](v3->_contentAreaView, "addSubview:", v26);
    v27 = objc_alloc_init(&OBJC_CLASS___UILabel);
    spinnerStatusLabel = v3->_spinnerStatusLabel;
    v3->_spinnerStatusLabel = v27;

    -[UILabel setNumberOfLines:](v3->_spinnerStatusLabel, "setNumberOfLines:", 0LL);
    v29 = v3->_spinnerStatusLabel;
    v30 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont _preferredFontForTextStyle:variant:]( &OBJC_CLASS___UIFont,  "_preferredFontForTextStyle:variant:",  UIFontTextStyleTitle1,  1024LL));
    -[UILabel setFont:](v29, "setFont:", v30);

    v31 = v3->_spinnerStatusLabel;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](&OBJC_CLASS___UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v31, "setTextColor:", v32);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v3->_spinnerStatusLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIView addSubview:](v3->_contentAreaView, "addSubview:", v3->_spinnerStatusLabel);
    v33 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]( objc_alloc(&OBJC_CLASS___UIActivityIndicatorView),  "initWithActivityIndicatorStyle:",  101LL);
    spinnerView = v3->_spinnerView;
    v3->_spinnerView = v33;

    v35 = v3->_spinnerView;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](&OBJC_CLASS___UIColor, "secondaryLabelColor"));
    -[UIActivityIndicatorView setTintColor:](v35, "setTintColor:", v36);

    -[UIActivityIndicatorView setHidesWhenStopped:](v3->_spinnerView, "setHidesWhenStopped:", 1LL);
    v159 = v26;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v26, "contentView"));
    [v37 addSubview:v3->_spinnerView];

    v38 = objc_alloc(&OBJC_CLASS___UIImageView);
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"oob_atv_iphone"));
    v40 = -[UIImageView initWithImage:](v38, "initWithImage:", v39);
    imageView = v3->_imageView;
    v3->_imageView = v40;

    if (MGGetProductType() == 3865897231LL)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"oob_atv2_iphone-J255"));
      -[UIImageView setImage:](v3->_imageView, "setImage:", v42);
    }

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v3->_imageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    LODWORD(v43) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:]( v3->_imageView,  "setContentCompressionResistancePriority:forAxis:",  0LL,  v43);
    LODWORD(v44) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:]( v3->_imageView,  "setContentCompressionResistancePriority:forAxis:",  1LL,  v44);
    -[TVSettingsTapToSetupView addSubview:](v3, "addSubview:", v3->_imageView);
    v45 = objc_alloc_init(&OBJC_CLASS___UILayoutGuide);
    -[TVSettingsTapToSetupView addLayoutGuide:](v3, "addLayoutGuide:");
    v46 = objc_alloc_init(&OBJC_CLASS___UILayoutGuide);
    -[TVSettingsTapToSetupView addLayoutGuide:](v3, "addLayoutGuide:", v46);
    v157 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v3->_contentAreaView, "centerYAnchor"));
    v156 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsTapToSetupView centerYAnchor](v3, "centerYAnchor"));
    v155 = (void *)objc_claimAutoreleasedReturnValue([v157 constraintEqualToAnchor:v156]);
    v161[0] = v155;
    v154 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v3->_contentAreaView, "leadingAnchor"));
    v153 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsTapToSetupView leadingAnchor](v3, "leadingAnchor"));
    v152 = (void *)objc_claimAutoreleasedReturnValue([v154 constraintEqualToAnchor:v153 constant:150.0]);
    v161[1] = v152;
    v151 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v3->_contentAreaView, "trailingAnchor"));
    v150 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v46, "leadingAnchor"));
    v149 = (void *)objc_claimAutoreleasedReturnValue([v151 constraintEqualToAnchor:v150 constant:-110.0]);
    v161[2] = v149;
    v148 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v3->_contentAreaView, "topAnchor"));
    v147 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsTapToSetupView topAnchor](v3, "topAnchor"));
    v146 = (void *)objc_claimAutoreleasedReturnValue([v148 constraintEqualToAnchor:v147]);
    v161[3] = v146;
    v145 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v3->_contentAreaView, "bottomAnchor"));
    v144 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsTapToSetupView bottomAnchor](v3, "bottomAnchor"));
    v143 = (void *)objc_claimAutoreleasedReturnValue([v145 constraintEqualToAnchor:v144]);
    v161[4] = v143;
    v142 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide widthAnchor](v45, "widthAnchor"));
    v141 = (void *)objc_claimAutoreleasedReturnValue([v142 constraintEqualToConstant:835.0]);
    v161[5] = v141;
    v139 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v45, "centerXAnchor"));
    v138 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v3->_contentAreaView, "centerXAnchor"));
    v137 = (void *)objc_claimAutoreleasedReturnValue([v139 constraintEqualToAnchor:v138]);
    v161[6] = v137;
    v136 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](v45, "centerYAnchor"));
    v135 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v3->_contentAreaView, "centerYAnchor"));
    v134 = (void *)objc_claimAutoreleasedReturnValue([v136 constraintEqualToAnchor:v135]);
    v161[7] = v134;
    v133 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v45, "topAnchor"));
    v132 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v3->_titleLabel, "topAnchor"));
    v131 = (void *)objc_claimAutoreleasedReturnValue([v133 constraintEqualToAnchor:v132]);
    v161[8] = v131;
    v130 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v45, "bottomAnchor"));
    v129 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v3->_bodyLabel, "bottomAnchor"));
    v127 = (void *)objc_claimAutoreleasedReturnValue([v130 constraintEqualToAnchor:v129]);
    v161[9] = v127;
    v126 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](v3->_titleLabel, "centerXAnchor"));
    v140 = v45;
    v125 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v45, "centerXAnchor"));
    v124 = (void *)objc_claimAutoreleasedReturnValue([v126 constraintLessThanOrEqualToAnchor:v125]);
    v161[10] = v124;
    v123 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](v3->_titleLabel, "widthAnchor"));
    v122 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v3->_contentAreaView, "widthAnchor"));
    v121 = (void *)objc_claimAutoreleasedReturnValue([v123 constraintLessThanOrEqualToAnchor:v122]);
    v161[11] = v121;
    v120 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](v3->_bodyLabel, "centerXAnchor"));
    v119 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v45, "centerXAnchor"));
    v118 = (void *)objc_claimAutoreleasedReturnValue([v120 constraintLessThanOrEqualToAnchor:v119]);
    v161[12] = v118;
    v117 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](v3->_bodyLabel, "widthAnchor"));
    v116 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v3->_contentAreaView, "widthAnchor"));
    v115 = (void *)objc_claimAutoreleasedReturnValue([v117 constraintLessThanOrEqualToAnchor:v116]);
    v161[13] = v115;
    v113 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v3->_bodyLabel, "firstBaselineAnchor"));
    v112 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](v3->_titleLabel, "lastBaselineAnchor"));
    v111 = (void *)objc_claimAutoreleasedReturnValue([v113 constraintEqualToAnchor:v112 constant:80.0]);
    v161[14] = v111;
    v110 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v3->_footerLabel, "leadingAnchor"));
    v109 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsTapToSetupView leadingAnchor](v3, "leadingAnchor"));
    v108 = (void *)objc_claimAutoreleasedReturnValue([v110 constraintEqualToAnchor:v109 constant:125.0]);
    v161[15] = v108;
    v107 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](v3->_footerLabel, "widthAnchor"));
    v106 = (void *)objc_claimAutoreleasedReturnValue([v107 constraintLessThanOrEqualToConstant:1000.0]);
    v161[16] = v106;
    v105 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v3->_footerLabel, "bottomAnchor"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsTapToSetupView bottomAnchor](v3, "bottomAnchor"));
    v103 = (void *)objc_claimAutoreleasedReturnValue([v105 constraintEqualToAnchor:v104 constant:-96.0]);
    v161[17] = v103;
    v102 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](v46, "centerYAnchor"));
    v101 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v3->_contentAreaView, "centerYAnchor"));
    v100 = (void *)objc_claimAutoreleasedReturnValue([v102 constraintEqualToAnchor:v101]);
    v161[18] = v100;
    v99 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide widthAnchor](v46, "widthAnchor"));
    v98 = (void *)objc_claimAutoreleasedReturnValue([v99 constraintEqualToConstant:700.0]);
    v161[19] = v98;
    v97 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](v46, "heightAnchor"));
    v96 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide widthAnchor](v46, "widthAnchor"));
    v95 = (void *)objc_claimAutoreleasedReturnValue([v97 constraintEqualToAnchor:v96]);
    v161[20] = v95;
    v114 = v46;
    v94 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v46, "trailingAnchor"));
    v93 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsTapToSetupView trailingAnchor](v3, "trailingAnchor"));
    v92 = (void *)objc_claimAutoreleasedReturnValue([v94 constraintEqualToAnchor:v93 constant:-125.0]);
    v161[21] = v92;
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](v3->_imageView, "centerXAnchor"));
    v90 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v46, "centerXAnchor"));
    v89 = (void *)objc_claimAutoreleasedReturnValue([v91 constraintEqualToAnchor:v90]);
    v161[22] = v89;
    v88 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v3->_imageView, "centerYAnchor"));
    v87 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](v46, "centerYAnchor"));
    v86 = (void *)objc_claimAutoreleasedReturnValue([v88 constraintEqualToAnchor:v87]);
    v161[23] = v86;
    v85 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v3->_imageView, "widthAnchor"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide widthAnchor](v46, "widthAnchor"));
    v83 = (void *)objc_claimAutoreleasedReturnValue([v85 constraintLessThanOrEqualToAnchor:v84]);
    v161[24] = v83;
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v3->_imageView, "heightAnchor"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](v46, "heightAnchor"));
    v80 = (void *)objc_claimAutoreleasedReturnValue([v82 constraintLessThanOrEqualToAnchor:v81]);
    v161[25] = v80;
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](v3->_spinnerStatusLabel, "centerXAnchor"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](v3->_titleLabel, "centerXAnchor"));
    v77 = (void *)objc_claimAutoreleasedReturnValue([v79 constraintEqualToAnchor:v78]);
    v161[26] = v77;
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](v3->_spinnerStatusLabel, "centerYAnchor"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](v3->_titleLabel, "centerYAnchor"));
    v74 = (void *)objc_claimAutoreleasedReturnValue([v76 constraintEqualToAnchor:v75]);
    v161[27] = v74;
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](v3->_spinnerStatusLabel, "widthAnchor"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v3->_contentAreaView, "widthAnchor"));
    v71 = (void *)objc_claimAutoreleasedReturnValue([v73 constraintLessThanOrEqualToAnchor:v72]);
    v161[28] = v71;
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView centerXAnchor](v26, "centerXAnchor"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](v3->_spinnerStatusLabel, "centerXAnchor"));
    v68 = (void *)objc_claimAutoreleasedReturnValue([v70 constraintEqualToAnchor:v69]);
    v161[29] = v68;
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView topAnchor](v26, "topAnchor"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](v3->_spinnerStatusLabel, "lastBaselineAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue([v67 constraintEqualToAnchor:v66 constant:44.0]);
    v161[30] = v65;
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView topAnchor](v3->_spinnerView, "topAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v26, "contentView"));
    v62 = (void *)objc_claimAutoreleasedReturnValue([v64 topAnchor]);
    v61 = (void *)objc_claimAutoreleasedReturnValue([v63 constraintEqualToAnchor:v62]);
    v161[31] = v61;
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView bottomAnchor](v3->_spinnerView, "bottomAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v26, "contentView"));
    v58 = (void *)objc_claimAutoreleasedReturnValue([v60 bottomAnchor]);
    v47 = (void *)objc_claimAutoreleasedReturnValue([v59 constraintEqualToAnchor:v58]);
    v161[32] = v47;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView leadingAnchor](v3->_spinnerView, "leadingAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v26, "contentView"));
    v50 = (void *)objc_claimAutoreleasedReturnValue([v49 leadingAnchor]);
    v51 = (void *)objc_claimAutoreleasedReturnValue([v48 constraintEqualToAnchor:v50]);
    v161[33] = v51;
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView trailingAnchor](v3->_spinnerView, "trailingAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v26, "contentView"));
    v54 = (void *)objc_claimAutoreleasedReturnValue([v53 trailingAnchor]);
    v55 = (void *)objc_claimAutoreleasedReturnValue([v52 constraintEqualToAnchor:v54]);
    v161[34] = v55;
    v128 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v161, 35LL));

    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v128);
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsTapToSetupView layer](v3, "layer"));
    [v56 setAllowsGroupBlending:0];

    -[TVSettingsTapToSetupView _updateCompositingEffects](v3, "_updateCompositingEffects");
  }

  return v3;
}

- (void)setTitle:(id)a3
{
  id v5 = a3;
  if (([v5 isEqualToString:self->_title] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_title, a3);
    -[UILabel setText:](self->_titleLabel, "setText:", v5);
  }
}

- (void)setInstructions:(id)a3
{
  id v6 = a3;
  if (([v6 isEqualToString:self->_instructions] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_instructions, a3);
    v7 = -[NSMutableAttributedString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableAttributedString),  "initWithString:",  v6);
    id v8 = -[NSMutableAttributedString length](v7, "length");
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableParagraphStyle);
    -[NSMutableParagraphStyle setMinimumLineHeight:](v9, "setMinimumLineHeight:", 74.0);
    v10 = -[NSTextTab initWithTextAlignment:location:options:]( objc_alloc(&OBJC_CLASS___NSTextTab),  "initWithTextAlignment:location:options:",  0LL,  &__NSDictionary0__struct,  40.0);
    v31 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v31, 1LL));
    -[NSMutableParagraphStyle setTabStops:](v9, "setTabStops:", v11);

    -[NSMutableParagraphStyle setFirstLineHeadIndent:](v9, "setFirstLineHeadIndent:", 0.0);
    -[NSMutableParagraphStyle setHeadIndent:](v9, "setHeadIndent:", 40.0);
    id v12 = -[NSMutableParagraphStyle copy](v9, "copy");
    -[NSMutableAttributedString addAttribute:value:range:]( v7,  "addAttribute:value:range:",  NSParagraphStyleAttributeName,  v12,  0LL,  v8);

    v13 = -[NSRegularExpression initWithPattern:options:error:]( objc_alloc(&OBJC_CLASS___NSRegularExpression),  "initWithPattern:options:error:",  @"(.+)\t",  0LL,  0LL);
    if (!v13)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"expression != nil"));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000F84B0(a2, (uint64_t)self, (uint64_t)v23);
      }
      _bs_set_crash_log_message([v23 UTF8String]);
      __break(0);
      JUMPOUT(0x10005C260LL);
    }

    uint64_t v25 = self;
    v24 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSRegularExpression matchesInString:options:range:]( v13,  "matchesInString:options:range:",  v6,  0LL,  0LL,  v8));
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v27;
      do
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](&OBJC_CLASS___UIColor, "secondaryLabelColor"));
          id v21 = [v19 range];
          -[NSMutableAttributedString addAttribute:value:range:]( v7,  "addAttribute:value:range:",  NSForegroundColorAttributeName,  v20,  v21,  v22);
        }

        id v16 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }

      while (v16);
    }

    -[UILabel setAttributedText:](v25->_bodyLabel, "setAttributedText:", v7);
  }
}

- (void)setFooter:(id)a3
{
  id v5 = a3;
  if (([v5 isEqualToString:self->_footer] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_footer, a3);
    id v6 = self->_footerLabel;
    -[UILabel setText:](v6, "setText:", v5);
    -[UILabel alpha](v6, "alpha");
    double v8 = v7;
    if ([v5 length])
    {
      if (-[UIActivityIndicatorView isAnimating](self->_spinnerView, "isAnimating")) {
        double v9 = 0.0;
      }
      else {
        double v9 = 1.0;
      }
    }

    else
    {
      double v9 = 0.0;
    }

    id v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472LL;
    v14 = sub_10005C3C4;
    id v15 = &unk_10018EE18;
    id v16 = v6;
    double v17 = v9;
    v10 = v6;
    v11 = objc_retainBlock(&v12);
    if (BSFloatIsZero(v8) && BSFloatIsOne(v9)) {
      +[UIView animateWithDuration:animations:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:",  v11,  0.3,  v12,  v13,  v14,  v15,  v16,  *(void *)&v17);
    }
    else {
      ((void (*)(void ***))v11[2])(v11);
    }
  }
}

- (void)startAnimatingSpinner
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsTapToSetupView title](self, "title"));
  -[TVSettingsTapToSetupView startAnimatingSpinnerWithStatus:](self, "startAnimatingSpinnerWithStatus:", v3);
}

- (void)startAnimatingSpinnerWithStatus:(id)a3
{
}

- (void)stopAnimatingSpinner
{
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsTapToSetupView;
  -[TVSettingsTapToSetupView traitCollectionDidChange:](&v4, "traitCollectionDidChange:", a3);
  -[TVSettingsTapToSetupView _updateCompositingEffects](self, "_updateCompositingEffects");
}

- (void)_updateCompositingEffects
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsTapToSetupView traitCollection](self, "traitCollection"));
  id v4 = [v3 userInterfaceStyle];

  id v5 = &kCAFilterPlusD;
  if (v4 == (id)2) {
    id v5 = &kCAFilterPlusL;
  }
  id v12 = (id)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", *v5));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel layer](self->_titleLabel, "layer"));
  [v6 setCompositingFilter:v12];

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel layer](self->_bodyLabel, "layer"));
  [v7 setCompositingFilter:v12];

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel layer](self->_spinnerStatusLabel, "layer"));
  [v8 setCompositingFilter:v12];

  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView layer](self->_spinnerView, "layer"));
  [v9 setCompositingFilter:v12];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel layer](self->_footerLabel, "layer"));
  [v10 setCompositingFilter:v12];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_imageView, "layer"));
  [v11 setCompositingFilter:v12];
}

- (void)_setActivityIndicatorIsInProgress:(BOOL)a3
{
  BOOL v3 = a3;
  -[UILabel setHidden:](self->_titleLabel, "setHidden:");
  -[UILabel setHidden:](self->_bodyLabel, "setHidden:", v3);
  -[UILabel setHidden:](self->_spinnerStatusLabel, "setHidden:", v3 ^ 1);
  if (v3)
  {
    -[UILabel setAlpha:](self->_footerLabel, "setAlpha:", 0.0);
    -[UIActivityIndicatorView startAnimating](self->_spinnerView, "startAnimating");
  }

  else
  {
    NSUInteger v5 = -[NSString length](self->_footer, "length");
    double v6 = 1.0;
    if (!v5) {
      double v6 = 0.0;
    }
    -[UILabel setAlpha:](self->_footerLabel, "setAlpha:", v6);
    -[UIActivityIndicatorView stopAnimating](self->_spinnerView, "stopAnimating");
  }

- (NSString)title
{
  return self->_title;
}

- (NSString)instructions
{
  return self->_instructions;
}

- (NSString)footer
{
  return self->_footer;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (UILabel)footerLabel
{
  return self->_footerLabel;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UIActivityIndicatorView)spinnerView
{
  return self->_spinnerView;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (UIView)contentAreaView
{
  return self->_contentAreaView;
}

- (UILabel)spinnerStatusLabel
{
  return self->_spinnerStatusLabel;
}

- (void).cxx_destruct
{
}

@end
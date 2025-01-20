@interface SCATMenuItemCell
+ (CGSize)cellSizeForTitle:(id)a3;
+ (CGSize)maxCellSize;
+ (id)measuringCell;
+ (id)titleToSizeCache;
- (BOOL)_useHighVisibilityImage;
- (BOOL)allowsDwellScanningToAbortAfterTimeout;
- (BOOL)isFlashing;
- (BOOL)scatIndicatesOwnFocus;
- (BOOL)scatPerformAction:(int)a3;
- (BOOL)scatShouldActivateDirectly;
- (BOOL)scatSupportsAction:(int)a3;
- (BOOL)shouldIncludeTextLabels;
- (BOOL)shouldSuppressAudioOutput;
- (BOOL)shouldUseActivityIndicator;
- (NSLayoutConstraint)titleHiddenConstraint;
- (SCATMenuItemCell)initWithFrame:(CGRect)a3;
- (SCATMenuLabel)titleLabel;
- (SCATModernMenuItem)menuItem;
- (UIActivityIndicatorView)activityIndicatorView;
- (UIImage)defaultBackgroundImage;
- (UIImage)dimmedBackgroundImage;
- (UIImage)dimmedBorderImage;
- (UIImage)dimmedIconImage;
- (UIImage)highVisBackgroundAndIconImage;
- (UIImage)iconImage;
- (UIImage)pressedBackgroundImage;
- (UIImageView)backgroundBorderImageView;
- (UIImageView)iconImageView;
- (UIImageView)pressedBackgroundBorderImageView;
- (UIVisualEffect)iconEffect;
- (UIVisualEffectView)borderContainerView;
- (UIVisualEffectView)iconContainerView;
- (double)iconImageAngle;
- (id)accessibilityLabel;
- (id)description;
- (id)scatSpeakableDescription;
- (void)_setBorderDimmed:(BOOL)a3 focused:(BOOL)a4 hidden:(BOOL)a5;
- (void)_setIconDimmed:(BOOL)a3 asDimAsBorder:(BOOL)a4 focused:(BOOL)a5;
- (void)_setupConstraints;
- (void)didUpdateScatMenuItemStyle;
- (void)flash;
- (void)prepareForReuse;
- (void)resetCell;
- (void)setActivityIndicatorView:(id)a3;
- (void)setBackgroundBorderImageView:(id)a3;
- (void)setBorderContainerView:(id)a3;
- (void)setDefaultBackgroundImage:(id)a3;
- (void)setDimmedBackgroundImage:(id)a3;
- (void)setDimmedBorderImage:(id)a3;
- (void)setDimmedIconImage:(id)a3;
- (void)setHighVisBackgroundAndIconImage:(id)a3;
- (void)setIconContainerView:(id)a3;
- (void)setIconEffect:(id)a3;
- (void)setIconImage:(id)a3;
- (void)setIconImageAngle:(double)a3;
- (void)setIconImageView:(id)a3;
- (void)setIsFlashing:(BOOL)a3;
- (void)setMenuItem:(id)a3;
- (void)setPressedBackgroundBorderImageView:(id)a3;
- (void)setPressedBackgroundImage:(id)a3;
- (void)setShouldIncludeTextLabels:(BOOL)a3;
- (void)setShouldSuppressAudioOutput:(BOOL)a3;
- (void)setShouldUseActivityIndicator:(BOOL)a3;
- (void)setTitleLabel:(id)a3;
- (void)update;
@end

@implementation SCATMenuItemCell

+ (id)titleToSizeCache
{
  if (qword_100157728 != -1) {
    dispatch_once(&qword_100157728, &stru_100124508);
  }
  v2 = (void *)qword_100157720;
  if (!qword_100157720)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v4 = (void *)qword_100157720;
    qword_100157720 = (uint64_t)v3;

    v2 = (void *)qword_100157720;
  }

  return v2;
}

+ (id)measuringCell
{
  if (qword_100157738 != -1) {
    dispatch_once(&qword_100157738, &stru_100124568);
  }
  return (id)qword_100157730;
}

+ (CGSize)maxCellSize
{
  *(void *)&double v2 = objc_opt_class(a1, a2).n128_u64[0];
  objc_msgSend(v3, "cellSizeForTitle:", @"a\nb", v2);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (CGSize)cellSizeForTitle:(id)a3
{
  double v4 = &stru_100127100;
  if (a3) {
    double v4 = (__CFString *)a3;
  }
  double v5 = v4;
  *(void *)&double v7 = objc_opt_class(a1, v6).n128_u64[0];
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "titleToSizeCache", v7));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v5]);
  if (!v11)
  {
    *(void *)&double v12 = objc_opt_class(a1, v10).n128_u64[0];
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "measuringCell", v12));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 titleLabel]);
    [v15 setAdjustsFontSizeToFitWidth:0];

    v16 = (void *)objc_claimAutoreleasedReturnValue([v14 titleLabel]);
    [v16 setText:v5];

    objc_msgSend( v14,  "systemLayoutSizeFittingSize:",  UILayoutFittingCompressedSize.width,  UILayoutFittingCompressedSize.height);
    v25[0] = v17;
    v25[1] = v18;
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v25,  "{CGSize=dd}"));
    [v9 setObject:v11 forKeyedSubscript:v5];
  }

  [v11 CGSizeValue];
  double v20 = v19;
  double v22 = v21;

  double v23 = v20;
  double v24 = v22;
  result.height = v24;
  result.width = v23;
  return result;
}

- (SCATMenuItemCell)initWithFrame:(CGRect)a3
{
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___SCATMenuItemCell;
  id v3 = -[SCATMenuItemCell initWithFrame:]( &v31,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    double v4 = -[UIVisualEffectView initWithEffect:]( objc_alloc(&OBJC_CLASS___UIVisualEffectView),  "initWithEffect:",  v3->_iconEffect);
    iconContainerView = v3->_iconContainerView;
    v3->_iconContainerView = v4;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:]( v3->_iconContainerView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell contentView](v3, "contentView"));
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconContainerView](v3, "iconContainerView"));
    [v6 addSubview:v7];

    id v8 = objc_alloc_init(&OBJC_CLASS___SCATMenuLabel);
    -[SCATMenuLabel setTranslatesAutoresizingMaskIntoConstraints:]( v8,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[SCATMenuItemCell setTitleLabel:](v3, "setTitleLabel:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell titleLabel](v3, "titleLabel"));
    [v10 setTextColor:v9];

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconContainerView](v3, "iconContainerView"));
    double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 contentView]);
    [v12 addSubview:v8];

    id v13 = objc_alloc(&OBJC_CLASS___UIVisualEffectView);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconEffect](v3, "iconEffect"));
    v15 = -[UIVisualEffectView initWithEffect:](v13, "initWithEffect:", v14);
    borderContainerView = v3->_borderContainerView;
    v3->_borderContainerView = v15;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:]( v3->_borderContainerView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    uint64_t v17 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v17,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[SCATMenuItemCell setBackgroundBorderImageView:](v3, "setBackgroundBorderImageView:", v17);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell contentView](v3, "contentView"));
    [v18 addSubview:v3->_borderContainerView];

    double v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v3->_borderContainerView, "contentView"));
    double v20 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell backgroundBorderImageView](v3, "backgroundBorderImageView"));
    [v19 addSubview:v20];

    double v21 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    -[UIImageView setContentMode:](v21, "setContentMode:", 1LL);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v21,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIImageView setAlpha:](v21, "setAlpha:", 0.0);
    -[SCATMenuItemCell setPressedBackgroundBorderImageView:](v3, "setPressedBackgroundBorderImageView:", v21);
    double v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v3->_borderContainerView, "contentView"));
    double v23 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell pressedBackgroundBorderImageView](v3, "pressedBackgroundBorderImageView"));
    [v22 addSubview:v23];

    double v24 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    -[UIImageView setContentMode:](v24, "setContentMode:", 1LL);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v24,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[SCATMenuItemCell setIconImageView:](v3, "setIconImageView:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconContainerView](v3, "iconContainerView"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 contentView]);
    [v26 addSubview:v24];

    v27 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]( objc_alloc(&OBJC_CLASS___UIActivityIndicatorView),  "initWithActivityIndicatorStyle:",  100LL);
    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:]( v27,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIActivityIndicatorView setHidden:](v27, "setHidden:", 1LL);
    -[SCATMenuItemCell setActivityIndicatorView:](v3, "setActivityIndicatorView:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconContainerView](v3, "iconContainerView"));
    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 contentView]);
    [v29 addSubview:v27];

    -[SCATMenuItemCell _setupConstraints](v3, "_setupConstraints");
    -[SCATMenuItemCell didUpdateScatMenuItemStyle](v3, "didUpdateScatMenuItemStyle");
  }

  return v3;
}

- (void)_setupConstraints
{
  double v4 = v3;
  double v6 = v5;
  v149 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell contentView](self, "contentView"));
  v147 = (void *)objc_claimAutoreleasedReturnValue([v149 leadingAnchor]);
  v148 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconContainerView](self, "iconContainerView"));
  v146 = (void *)objc_claimAutoreleasedReturnValue([v148 leadingAnchor]);
  v145 = (void *)objc_claimAutoreleasedReturnValue([v147 constraintEqualToAnchor:v146]);
  v150[0] = v145;
  v144 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell contentView](self, "contentView"));
  v142 = (void *)objc_claimAutoreleasedReturnValue([v144 trailingAnchor]);
  v143 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconContainerView](self, "iconContainerView"));
  v141 = (void *)objc_claimAutoreleasedReturnValue([v143 trailingAnchor]);
  v140 = (void *)objc_claimAutoreleasedReturnValue([v142 constraintEqualToAnchor:v141]);
  v150[1] = v140;
  v139 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell contentView](self, "contentView"));
  v137 = (void *)objc_claimAutoreleasedReturnValue([v139 topAnchor]);
  v138 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconContainerView](self, "iconContainerView"));
  v136 = (void *)objc_claimAutoreleasedReturnValue([v138 topAnchor]);
  v135 = (void *)objc_claimAutoreleasedReturnValue([v137 constraintEqualToAnchor:v136]);
  v150[2] = v135;
  v134 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell contentView](self, "contentView"));
  v132 = (void *)objc_claimAutoreleasedReturnValue([v134 bottomAnchor]);
  v133 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconContainerView](self, "iconContainerView"));
  v131 = (void *)objc_claimAutoreleasedReturnValue([v133 bottomAnchor]);
  v130 = (void *)objc_claimAutoreleasedReturnValue([v132 constraintEqualToAnchor:v131]);
  v150[3] = v130;
  v129 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell borderContainerView](self, "borderContainerView"));
  v127 = (void *)objc_claimAutoreleasedReturnValue([v129 centerXAnchor]);
  v128 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconContainerView](self, "iconContainerView"));
  v126 = (void *)objc_claimAutoreleasedReturnValue([v128 centerXAnchor]);
  v125 = (void *)objc_claimAutoreleasedReturnValue([v127 constraintEqualToAnchor:v126]);
  v150[4] = v125;
  v124 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell borderContainerView](self, "borderContainerView"));
  v122 = (void *)objc_claimAutoreleasedReturnValue([v124 topAnchor]);
  v123 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconContainerView](self, "iconContainerView"));
  v121 = (void *)objc_claimAutoreleasedReturnValue([v123 topAnchor]);
  v120 = (void *)objc_claimAutoreleasedReturnValue([v122 constraintEqualToAnchor:v121]);
  v150[5] = v120;
  v119 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell borderContainerView](self, "borderContainerView"));
  v117 = (void *)objc_claimAutoreleasedReturnValue([v119 bottomAnchor]);
  v118 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconContainerView](self, "iconContainerView"));
  v116 = (void *)objc_claimAutoreleasedReturnValue([v118 bottomAnchor]);
  v115 = (void *)objc_claimAutoreleasedReturnValue([v117 constraintEqualToAnchor:v116]);
  v150[6] = v115;
  v114 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell backgroundBorderImageView](self, "backgroundBorderImageView"));
  v113 = (void *)objc_claimAutoreleasedReturnValue([v114 heightAnchor]);
  v112 = (void *)objc_claimAutoreleasedReturnValue([v113 constraintEqualToConstant:v6]);
  v150[7] = v112;
  v111 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell backgroundBorderImageView](self, "backgroundBorderImageView"));
  v110 = (void *)objc_claimAutoreleasedReturnValue([v111 widthAnchor]);
  v109 = (void *)objc_claimAutoreleasedReturnValue([v110 constraintEqualToConstant:v4]);
  v150[8] = v109;
  v108 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell backgroundBorderImageView](self, "backgroundBorderImageView"));
  v106 = (void *)objc_claimAutoreleasedReturnValue([v108 topAnchor]);
  v107 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell borderContainerView](self, "borderContainerView"));
  v105 = (void *)objc_claimAutoreleasedReturnValue([v107 contentView]);
  v104 = (void *)objc_claimAutoreleasedReturnValue([v105 topAnchor]);
  v103 = (void *)objc_claimAutoreleasedReturnValue([v106 constraintEqualToAnchor:v104]);
  v150[9] = v103;
  v102 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell pressedBackgroundBorderImageView](self, "pressedBackgroundBorderImageView"));
  v100 = (void *)objc_claimAutoreleasedReturnValue([v102 centerXAnchor]);
  v101 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell backgroundBorderImageView](self, "backgroundBorderImageView"));
  v99 = (void *)objc_claimAutoreleasedReturnValue([v101 centerXAnchor]);
  v98 = (void *)objc_claimAutoreleasedReturnValue([v100 constraintEqualToAnchor:v99]);
  v150[10] = v98;
  v97 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell pressedBackgroundBorderImageView](self, "pressedBackgroundBorderImageView"));
  v95 = (void *)objc_claimAutoreleasedReturnValue([v97 centerYAnchor]);
  v96 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell backgroundBorderImageView](self, "backgroundBorderImageView"));
  v94 = (void *)objc_claimAutoreleasedReturnValue([v96 centerYAnchor]);
  v93 = (void *)objc_claimAutoreleasedReturnValue([v95 constraintEqualToAnchor:v94]);
  v150[11] = v93;
  v92 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell pressedBackgroundBorderImageView](self, "pressedBackgroundBorderImageView"));
  v90 = (void *)objc_claimAutoreleasedReturnValue([v92 heightAnchor]);
  v91 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell backgroundBorderImageView](self, "backgroundBorderImageView"));
  v89 = (void *)objc_claimAutoreleasedReturnValue([v91 heightAnchor]);
  v88 = (void *)objc_claimAutoreleasedReturnValue([v90 constraintEqualToAnchor:v89]);
  v150[12] = v88;
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell pressedBackgroundBorderImageView](self, "pressedBackgroundBorderImageView"));
  v85 = (void *)objc_claimAutoreleasedReturnValue([v87 widthAnchor]);
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell backgroundBorderImageView](self, "backgroundBorderImageView"));
  v84 = (void *)objc_claimAutoreleasedReturnValue([v86 widthAnchor]);
  v83 = (void *)objc_claimAutoreleasedReturnValue([v85 constraintEqualToAnchor:v84]);
  v150[13] = v83;
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell backgroundBorderImageView](self, "backgroundBorderImageView"));
  v80 = (void *)objc_claimAutoreleasedReturnValue([v82 trailingAnchor]);
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell borderContainerView](self, "borderContainerView"));
  v79 = (void *)objc_claimAutoreleasedReturnValue([v81 contentView]);
  v78 = (void *)objc_claimAutoreleasedReturnValue([v79 trailingAnchor]);
  v77 = (void *)objc_claimAutoreleasedReturnValue([v80 constraintEqualToAnchor:v78]);
  v150[14] = v77;
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell backgroundBorderImageView](self, "backgroundBorderImageView"));
  v74 = (void *)objc_claimAutoreleasedReturnValue([v76 leadingAnchor]);
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell borderContainerView](self, "borderContainerView"));
  v73 = (void *)objc_claimAutoreleasedReturnValue([v75 contentView]);
  v72 = (void *)objc_claimAutoreleasedReturnValue([v73 leadingAnchor]);
  v71 = (void *)objc_claimAutoreleasedReturnValue([v74 constraintEqualToAnchor:v72]);
  v150[15] = v71;
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconImageView](self, "iconImageView"));
  v69 = (void *)objc_claimAutoreleasedReturnValue([v70 heightAnchor]);
  v68 = (void *)objc_claimAutoreleasedReturnValue([v69 constraintEqualToConstant:v6]);
  v150[16] = v68;
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconImageView](self, "iconImageView"));
  v66 = (void *)objc_claimAutoreleasedReturnValue([v67 widthAnchor]);
  v65 = (void *)objc_claimAutoreleasedReturnValue([v66 constraintEqualToConstant:v4]);
  v150[17] = v65;
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconImageView](self, "iconImageView"));
  v61 = (void *)objc_claimAutoreleasedReturnValue([v64 leadingAnchor]);
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconContainerView](self, "iconContainerView"));
  v62 = (void *)objc_claimAutoreleasedReturnValue([v63 contentView]);
  v60 = (void *)objc_claimAutoreleasedReturnValue([v62 leadingAnchor]);
  v59 = (void *)objc_claimAutoreleasedReturnValue([v61 constraintEqualToAnchor:v60 constant:15.0]);
  v150[18] = v59;
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconImageView](self, "iconImageView"));
  v56 = (void *)objc_claimAutoreleasedReturnValue([v58 topAnchor]);
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconContainerView](self, "iconContainerView"));
  v55 = (void *)objc_claimAutoreleasedReturnValue([v57 contentView]);
  v54 = (void *)objc_claimAutoreleasedReturnValue([v55 topAnchor]);
  v53 = (void *)objc_claimAutoreleasedReturnValue([v56 constraintEqualToAnchor:v54]);
  v150[19] = v53;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconImageView](self, "iconImageView"));
  v49 = (void *)objc_claimAutoreleasedReturnValue([v52 trailingAnchor]);
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconContainerView](self, "iconContainerView"));
  v50 = (void *)objc_claimAutoreleasedReturnValue([v51 contentView]);
  v48 = (void *)objc_claimAutoreleasedReturnValue([v50 trailingAnchor]);
  v47 = (void *)objc_claimAutoreleasedReturnValue([v49 constraintEqualToAnchor:v48 constant:-15.0]);
  v150[20] = v47;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell titleLabel](self, "titleLabel"));
  v44 = (void *)objc_claimAutoreleasedReturnValue([v46 firstBaselineAnchor]);
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconImageView](self, "iconImageView"));
  v43 = (void *)objc_claimAutoreleasedReturnValue([v45 bottomAnchor]);
  v42 = (void *)objc_claimAutoreleasedReturnValue([v44 constraintEqualToSystemSpacingBelowAnchor:v43 multiplier:1.0]);
  v150[21] = v42;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell titleLabel](self, "titleLabel"));
  v39 = (void *)objc_claimAutoreleasedReturnValue([v41 trailingAnchor]);
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconContainerView](self, "iconContainerView"));
  v38 = (void *)objc_claimAutoreleasedReturnValue([v40 contentView]);
  v37 = (void *)objc_claimAutoreleasedReturnValue([v38 trailingAnchor]);
  v36 = (void *)objc_claimAutoreleasedReturnValue([v39 constraintLessThanOrEqualToAnchor:v37]);
  v150[22] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell titleLabel](self, "titleLabel"));
  v33 = (void *)objc_claimAutoreleasedReturnValue([v35 leadingAnchor]);
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconContainerView](self, "iconContainerView"));
  v32 = (void *)objc_claimAutoreleasedReturnValue([v34 contentView]);
  objc_super v31 = (void *)objc_claimAutoreleasedReturnValue([v32 leadingAnchor]);
  v30 = (void *)objc_claimAutoreleasedReturnValue([v33 constraintGreaterThanOrEqualToAnchor:v31]);
  v150[23] = v30;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell titleLabel](self, "titleLabel"));
  v27 = (void *)objc_claimAutoreleasedReturnValue([v29 centerXAnchor]);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconContainerView](self, "iconContainerView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue([v28 contentView]);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v26 centerXAnchor]);
  double v24 = (void *)objc_claimAutoreleasedReturnValue([v27 constraintEqualToAnchor:v25]);
  v150[24] = v24;
  double v23 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell titleLabel](self, "titleLabel"));
  double v21 = (void *)objc_claimAutoreleasedReturnValue([v23 bottomAnchor]);
  double v22 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconContainerView](self, "iconContainerView"));
  double v20 = (void *)objc_claimAutoreleasedReturnValue([v22 contentView]);
  double v19 = (void *)objc_claimAutoreleasedReturnValue([v20 bottomAnchor]);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v21 constraintEqualToAnchor:v19]);
  v150[25] = v18;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell activityIndicatorView](self, "activityIndicatorView"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v17 centerXAnchor]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconContainerView](self, "iconContainerView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 centerXAnchor]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 constraintEqualToAnchor:v9]);
  v150[26] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell activityIndicatorView](self, "activityIndicatorView"));
  double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 centerYAnchor]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconContainerView](self, "iconContainerView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 centerYAnchor]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v12 constraintEqualToAnchor:v14]);
  v150[27] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v150, 28LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v16);
}

- (id)description
{
  double v4 = NSStringFromClass(v3);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell menuItem](self, "menuItem"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
  -[SCATMenuItemCell frame](self, "frame");
  id v8 = NSStringFromCGRect(v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@<%p>. title:%@. frame:%@",  v5,  self,  v7,  v9));

  return v10;
}

- (void)setIconImage:(id)a3
{
  id v8 = (UIImage *)a3;
  if (self->_iconImage != v8)
  {
    objc_storeStrong((id *)&self->_iconImage, a3);
    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider"));
    double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 menuKnockoutColor]);
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIImage imageWithTintColor:renderingMode:](v8, "imageWithTintColor:renderingMode:", v6, 1LL));
    -[SCATMenuItemCell setDimmedIconImage:](self, "setDimmedIconImage:", v7);

    -[SCATMenuItemCell setHighVisBackgroundAndIconImage:](self, "setHighVisBackgroundAndIconImage:", 0LL);
    -[SCATMenuItemCell didUpdateScatMenuItemStyle](self, "didUpdateScatMenuItemStyle");
  }
}

- (void)setShouldUseActivityIndicator:(BOOL)a3
{
  if (self->_shouldUseActivityIndicator != a3)
  {
    BOOL v3 = a3;
    self->_shouldUseActivityIndicator = a3;
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell activityIndicatorView](self, "activityIndicatorView"));
    double v6 = v5;
    if (v3)
    {
      [v5 startAnimating];

      double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell activityIndicatorView](self, "activityIndicatorView"));
      id v8 = v7;
      uint64_t v9 = 0LL;
    }

    else
    {
      [v5 stopAnimating];

      double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell activityIndicatorView](self, "activityIndicatorView"));
      id v8 = v7;
      uint64_t v9 = 1LL;
    }

    [v7 setHidden:v9];

    -[SCATMenuItemCell didUpdateScatMenuItemStyle](self, "didUpdateScatMenuItemStyle");
  }

- (void)setIconImageAngle:(double)a3
{
  if (self->_iconImageAngle != a3)
  {
    self->_iconImageAngle = a3;
    CGAffineTransformMakeRotation(&v7, a3);
    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconImageView](self, "iconImageView"));
    CGAffineTransform v6 = v7;
    [v4 setTransform:&v6];

    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell highVisBackgroundAndIconImage](self, "highVisBackgroundAndIconImage"));
    if (v5)
    {
      -[SCATMenuItemCell setHighVisBackgroundAndIconImage:](self, "setHighVisBackgroundAndIconImage:", 0LL);
      -[SCATMenuItemCell didUpdateScatMenuItemStyle](self, "didUpdateScatMenuItemStyle");
    }
  }

- (void)setPressedBackgroundImage:(id)a3
{
  CGAffineTransform v6 = (UIImage *)a3;
  if (self->_pressedBackgroundImage != v6)
  {
    objc_storeStrong((id *)&self->_pressedBackgroundImage, a3);
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell pressedBackgroundBorderImageView](self, "pressedBackgroundBorderImageView"));
    [v5 setImage:v6];
  }
}

- (void)setShouldIncludeTextLabels:(BOOL)a3
{
  self->_shouldIncludeTextLabels = a3;
  BOOL v3 = !a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell titleHiddenConstraint](self, "titleHiddenConstraint"));
  [v4 setActive:v3];
}

- (NSLayoutConstraint)titleHiddenConstraint
{
  titleHiddenConstraint = self->_titleHiddenConstraint;
  if (!titleHiddenConstraint)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell titleLabel](self, "titleLabel"));
    double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 heightAnchor]);
    CGAffineTransform v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v5 constraintEqualToConstant:0.0]);
    CGAffineTransform v7 = self->_titleHiddenConstraint;
    self->_titleHiddenConstraint = v6;

    titleHiddenConstraint = self->_titleHiddenConstraint;
  }

  return titleHiddenConstraint;
}

- (BOOL)_useHighVisibilityImage
{
  return 1;
}

- (void)_setBorderDimmed:(BOOL)a3 focused:(BOOL)a4 hidden:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  if (-[SCATMenuItemCell _useHighVisibilityImage](self, "_useHighVisibilityImage") && v6)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell highVisBackgroundAndIconImage](self, "highVisBackgroundAndIconImage"));

    if (!v9)
    {
      +[SCATModernMenuItem imageSize](&OBJC_CLASS___SCATModernMenuItem, "imageSize");
      double v11 = v10;
      double v13 = v12;
      double y = CGRectZero.origin.y;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
      [v15 scale];
      CGFloat v17 = v16;
      v51.width = v11;
      v51.height = v13;
      UIGraphicsBeginImageContextWithOptions(v51, 0, v17);

      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithRoundedRect:cornerRadius:",  CGRectZero.origin.x,  y,  v11,  v13,  27.5));
      double v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
      [v19 set];

      [v18 fill];
      CurrentContext = UIGraphicsGetCurrentContext();
      CGContextTranslateCTM(CurrentContext, v11 * 0.5, v13 * 0.5);
      double v21 = UIGraphicsGetCurrentContext();
      -[SCATMenuItemCell iconImageAngle](self, "iconImageAngle");
      CGContextRotateCTM(v21, v22);
      double v23 = UIGraphicsGetCurrentContext();
      CGContextTranslateCTM(v23, -(v11 * 0.5), -(v13 * 0.5));
      double v24 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconImage](self, "iconImage"));
      objc_msgSend(v24, "drawInRect:blendMode:alpha:", 23, 0.0, 0.0, v11, v13, 1.0);

      ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
      v26 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
      -[SCATMenuItemCell setHighVisBackgroundAndIconImage:](self, "setHighVisBackgroundAndIconImage:", v26);

      UIGraphicsEndImageContext();
    }

    uint64_t v27 = objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell highVisBackgroundAndIconImage](self, "highVisBackgroundAndIconImage"));
    goto LABEL_6;
  }

  if (!v7)
  {
    if (v5)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell backgroundBorderImageView](self, "backgroundBorderImageView"));
      id v50 = v30;
      double v31 = 0.0;
      goto LABEL_7;
    }

    uint64_t v27 = objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell defaultBackgroundImage](self, "defaultBackgroundImage"));
LABEL_6:
    v28 = (void *)v27;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell backgroundBorderImageView](self, "backgroundBorderImageView"));
    [v29 setImage:v28];

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell backgroundBorderImageView](self, "backgroundBorderImageView"));
    id v50 = v30;
    double v31 = 1.0;
LABEL_7:
    [v30 setAlpha:v31];
    goto LABEL_12;
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell dimmedBorderImage](self, "dimmedBorderImage"));

  if (!v32)
  {
    +[SCATModernMenuItem imageSize](&OBJC_CLASS___SCATModernMenuItem, "imageSize");
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    CGFloat v37 = CGRectZero.origin.y;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v38 scale];
    CGFloat v40 = v39;
    v52.width = v34;
    v52.height = v36;
    UIGraphicsBeginImageContextWithOptions(v52, 0, v40);

    v53.origin.x = CGRectZero.origin.x;
    v53.origin.double y = v37;
    v53.size.width = v34;
    v53.size.height = v36;
    CGRect v54 = CGRectInset(v53, 2.0, 2.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithRoundedRect:cornerRadius:",  v54.origin.x,  v54.origin.y,  v54.size.width,  v54.size.height,  27.5));
    [v41 setLineWidth:4.0];
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    [v42 set];

    [v41 stroke];
    v43 = UIGraphicsGetImageFromCurrentImageContext();
    v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
    -[SCATMenuItemCell setDimmedBorderImage:](self, "setDimmedBorderImage:", v44);

    UIGraphicsEndImageContext();
  }

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell dimmedBorderImage](self, "dimmedBorderImage"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell backgroundBorderImageView](self, "backgroundBorderImageView"));
  [v46 setImage:v45];

  id v50 = (id)objc_claimAutoreleasedReturnValue(+[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider"));
  [v50 menuKnockoutBorderOpacity];
  double v48 = v47;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell backgroundBorderImageView](self, "backgroundBorderImageView"));
  [v49 setAlpha:v48];

LABEL_12:
}

- (void)_setIconDimmed:(BOOL)a3 asDimAsBorder:(BOOL)a4 focused:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  if (-[SCATMenuItemCell _useHighVisibilityImage](self, "_useHighVisibilityImage") && v5)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconImageView](self, "iconImageView"));
    id v22 = v9;
LABEL_5:
    [v9 setHidden:1];
LABEL_6:
    double v11 = v22;
LABEL_7:

    return;
  }

  unsigned int v10 = -[SCATMenuItemCell shouldUseActivityIndicator](self, "shouldUseActivityIndicator");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconImageView](self, "iconImageView"));
  id v22 = v9;
  if (v10) {
    goto LABEL_5;
  }
  [v9 setHidden:0];

  if (!v7)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconImage](self, "iconImage"));
    double v19 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconImageView](self, "iconImageView"));
    [v19 setImage:v18];

    double v20 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconImageView](self, "iconImageView"));
    [v20 _setDrawsAsBackdropOverlayWithBlendMode:0];

    id v22 = (id)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconImageView](self, "iconImageView"));
    [v22 setAlpha:1.0];
    goto LABEL_6;
  }

  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell dimmedIconImage](self, "dimmedIconImage"));
  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconImageView](self, "iconImageView"));
  [v13 setImage:v12];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconImageView](self, "iconImageView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v14, "_setDrawsAsBackdropOverlayWithBlendMode:", objc_msgSend(v15, "menuKnockoutBorderOverlayBlendMode"));

  if (v6)
  {
    id v22 = (id)objc_claimAutoreleasedReturnValue(+[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider"));
    [v22 menuKnockoutBorderOpacity];
    double v17 = v16;
  }

  else
  {
    double v17 = 1.0;
  }

  double v21 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconImageView](self, "iconImageView"));
  [v21 setAlpha:v17];

  double v11 = v22;
  if (v6) {
    goto LABEL_7;
  }
}

- (void)didUpdateScatMenuItemStyle
{
  id v3 = -[SCATMenuItemCell scatMenuItemStyle](self, "scatMenuItemStyle");
  switch((unint64_t)v3)
  {
    case 0uLL:
      id v4 = self;
      uint64_t v5 = 1LL;
      uint64_t v6 = 0LL;
      goto LABEL_8;
    case 1uLL:
      BOOL v7 = self;
      uint64_t v8 = 1LL;
      uint64_t v9 = 0LL;
      goto LABEL_6;
    case 2uLL:
      -[SCATMenuItemCell _setBorderDimmed:focused:hidden:](self, "_setBorderDimmed:focused:hidden:", 0LL, 1LL, 0LL);
      unsigned int v10 = self;
      uint64_t v11 = 0LL;
      uint64_t v12 = 0LL;
      uint64_t v13 = 1LL;
      goto LABEL_10;
    case 3uLL:
      BOOL v7 = self;
      uint64_t v8 = 0LL;
      uint64_t v9 = 1LL;
LABEL_6:
      -[SCATMenuItemCell _setBorderDimmed:focused:hidden:](v7, "_setBorderDimmed:focused:hidden:", v8, 0LL, v9);
      unsigned int v10 = self;
      uint64_t v11 = 1LL;
      uint64_t v12 = 1LL;
      goto LABEL_9;
    case 4uLL:
      id v4 = self;
      uint64_t v5 = 0LL;
      uint64_t v6 = 1LL;
LABEL_8:
      -[SCATMenuItemCell _setBorderDimmed:focused:hidden:](v4, "_setBorderDimmed:focused:hidden:", v5, 0LL, v6);
      unsigned int v10 = self;
      uint64_t v11 = 0LL;
      uint64_t v12 = 0LL;
LABEL_9:
      uint64_t v13 = 0LL;
LABEL_10:
      -[SCATMenuItemCell _setIconDimmed:asDimAsBorder:focused:]( v10,  "_setIconDimmed:asDimAsBorder:focused:",  v11,  v12,  v13);
      break;
    default:
      break;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell titleLabel](self, "titleLabel"));
  [v14 setScatMenuItemStyle:v3];

  id v15 = (id)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell titleLabel](self, "titleLabel"));
  [v15 didUpdateScatMenuItemStyle];
}

- (void)prepareForReuse
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell iconImageView](self, "iconImageView"));
  [v3 setImage:0];

  -[SCATMenuItemCell setDefaultBackgroundImage:](self, "setDefaultBackgroundImage:", 0LL);
  -[SCATMenuItemCell setPressedBackgroundImage:](self, "setPressedBackgroundImage:", 0LL);
  -[SCATMenuItemCell setDimmedBackgroundImage:](self, "setDimmedBackgroundImage:", 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell backgroundBorderImageView](self, "backgroundBorderImageView"));
  [v4 setImage:0];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell pressedBackgroundBorderImageView](self, "pressedBackgroundBorderImageView"));
  [v5 setImage:0];

  -[SCATMenuItemCell setMenuItem:](self, "setMenuItem:", 0LL);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell titleLabel](self, "titleLabel"));
  [v6 setAdjustsFontSizeToFitWidth:0];

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell titleLabel](self, "titleLabel"));
  [v7 setAdjustsFontSizeToFitWidth:1];

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SCATMenuItemCell;
  -[SCATMenuItemCell prepareForReuse](&v8, "prepareForReuse");
}

- (BOOL)scatSupportsAction:(int)a3
{
  return a3 == 2010;
}

- (BOOL)scatPerformAction:(int)a3
{
  if (a3 != 2010) {
    return 0;
  }
  id v3 = self;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell menuItem](self, "menuItem"));
  LOBYTE(v3) = [v4 handleActivateWithElement:v3];

  return (char)v3;
}

- (BOOL)scatShouldActivateDirectly
{
  return 1;
}

- (BOOL)scatIndicatesOwnFocus
{
  return 1;
}

- (id)scatSpeakableDescription
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell menuItem](self, "menuItem"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accessibilityLabel]);

  return v3;
}

- (BOOL)shouldSuppressAudioOutput
{
  return self->_shouldSuppressAudioOutput;
}

- (id)accessibilityLabel
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell menuItem](self, "menuItem"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accessibilityLabel]);

  return v3;
}

- (BOOL)allowsDwellScanningToAbortAfterTimeout
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell menuItem](self, "menuItem"));
  unsigned __int8 v3 = [v2 allowsDwellScanningToAbortAfterTimeout];

  return v3;
}

- (void)resetCell
{
}

- (void)update
{
  if (!-[SCATMenuItemCell isFlashing](self, "isFlashing"))
  {
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell menuItem](self, "menuItem"));
    -[SCATMenuItemCell setShouldUseActivityIndicator:]( self,  "setShouldUseActivityIndicator:",  [v3 shouldUseActivityIndicator]);

    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell menuItem](self, "menuItem"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 resolvedImage]);
    -[SCATMenuItemCell setIconImage:](self, "setIconImage:", v5);

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell titleLabel](self, "titleLabel"));
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell menuItem](self, "menuItem"));
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v7 title]);
    [v6 setText:v8];

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell menuItem](self, "menuItem"));
    -[SCATMenuItemCell setScatMenuItemStyle:](self, "setScatMenuItemStyle:", [v9 style]);

    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATMenuItemCell menuItem](self, "menuItem"));
    [v10 iconImageAngle];
    -[SCATMenuItemCell setIconImageAngle:](self, "setIconImageAngle:");

    -[SCATMenuItemCell setNeedsDisplay](self, "setNeedsDisplay");
  }

- (void)flash
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100085A34;
  v5[3] = &unk_100121EE8;
  objc_copyWeak(&v6, &location);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100085AC0;
  v3[3] = &unk_1001245B0;
  objc_copyWeak(&v4, &location);
  +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v5,  v3,  0.1);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (BOOL)shouldUseActivityIndicator
{
  return self->_shouldUseActivityIndicator;
}

- (void)setShouldSuppressAudioOutput:(BOOL)a3
{
  self->_shouldSuppressAudioOutput = a3;
}

- (SCATModernMenuItem)menuItem
{
  return (SCATModernMenuItem *)objc_loadWeakRetained((id *)&self->_menuItem);
}

- (void)setMenuItem:(id)a3
{
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (double)iconImageAngle
{
  return self->_iconImageAngle;
}

- (UIImageView)pressedBackgroundBorderImageView
{
  return self->_pressedBackgroundBorderImageView;
}

- (void)setPressedBackgroundBorderImageView:(id)a3
{
}

- (UIImage)defaultBackgroundImage
{
  return self->_defaultBackgroundImage;
}

- (void)setDefaultBackgroundImage:(id)a3
{
}

- (UIImage)pressedBackgroundImage
{
  return self->_pressedBackgroundImage;
}

- (UIImage)dimmedBackgroundImage
{
  return self->_dimmedBackgroundImage;
}

- (void)setDimmedBackgroundImage:(id)a3
{
}

- (SCATMenuLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (BOOL)shouldIncludeTextLabels
{
  return self->_shouldIncludeTextLabels;
}

- (UIImageView)backgroundBorderImageView
{
  return self->_backgroundBorderImageView;
}

- (void)setBackgroundBorderImageView:(id)a3
{
}

- (UIVisualEffectView)borderContainerView
{
  return self->_borderContainerView;
}

- (void)setBorderContainerView:(id)a3
{
}

- (UIImage)dimmedIconImage
{
  return self->_dimmedIconImage;
}

- (void)setDimmedIconImage:(id)a3
{
}

- (UIImage)highVisBackgroundAndIconImage
{
  return self->_highVisBackgroundAndIconImage;
}

- (void)setHighVisBackgroundAndIconImage:(id)a3
{
}

- (UIImage)dimmedBorderImage
{
  return self->_dimmedBorderImage;
}

- (void)setDimmedBorderImage:(id)a3
{
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
}

- (UIVisualEffect)iconEffect
{
  return self->_iconEffect;
}

- (void)setIconEffect:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
}

- (UIVisualEffectView)iconContainerView
{
  return self->_iconContainerView;
}

- (void)setIconContainerView:(id)a3
{
}

- (BOOL)isFlashing
{
  return self->_isFlashing;
}

- (void)setIsFlashing:(BOOL)a3
{
  self->_isFlashing = a3;
}

- (void).cxx_destruct
{
}

@end
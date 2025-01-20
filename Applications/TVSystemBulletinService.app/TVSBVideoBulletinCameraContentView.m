@interface TVSBVideoBulletinCameraContentView
- (BOOL)_shouldDisplayAccessModeErrorContent;
- (BOOL)_shouldDisplayErrorContent;
- (BOOL)isDoorbell;
- (BOOL)isFullScreen;
- (HMCameraProfile)cameraProfile;
- (HMCameraStreamControl)streamControl;
- (HMCameraStreamPreferences)streamPreferences;
- (HMCameraUserSettings)userSettings;
- (HMCameraView)cameraView;
- (NSError)cachedStreamError;
- (NSLayoutConstraint)cameraViewHeightConstraint;
- (NSLayoutConstraint)cameraViewWidthConstraint;
- (NSLayoutConstraint)liveBadgeBottomConstraint;
- (NSLayoutConstraint)liveBadgeHeightConstraint;
- (NSLayoutConstraint)liveBadgeTrailingConstraint;
- (NSString)title;
- (TVSBVideoBulletinBadgeView)liveBadgeView;
- (TVSBVideoBulletinCameraContentView)initWithFrame:(CGRect)a3;
- (UIActivityIndicatorView)activityIndicator;
- (UIImage)faceImage;
- (UIImage)placeholderSnapshot;
- (UIImageView)faceImageView;
- (UIImageView)gradientImageView;
- (UIImageView)placeholderSnapshotView;
- (UIImageView)symbolImageView;
- (UILabel)descriptionLabel;
- (UILabel)titleLabel;
- (UIVisualEffectView)effectView;
- (double)aspectRatio;
- (void)_updateAudioStream:(BOOL)a3;
- (void)_updateCameraNameLabels;
- (void)_updateCameraViewConstraints;
- (void)_updateContentViews;
- (void)_updateEffect;
- (void)cameraStreamControl:(id)a3 didStopStreamWithError:(id)a4;
- (void)cameraStreamControlDidStartStream:(id)a3;
- (void)cameraUserSettingsDidUpdate:(id)a3;
- (void)setActivityIndicator:(id)a3;
- (void)setAspectRatio:(double)a3;
- (void)setCachedStreamError:(id)a3;
- (void)setCameraProfile:(id)a3;
- (void)setCameraView:(id)a3;
- (void)setCameraViewHeightConstraint:(id)a3;
- (void)setCameraViewWidthConstraint:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setDoorbell:(BOOL)a3;
- (void)setEffectView:(id)a3;
- (void)setFaceImage:(id)a3;
- (void)setFaceImageView:(id)a3;
- (void)setFullScreen:(BOOL)a3;
- (void)setGradientImageView:(id)a3;
- (void)setLiveBadgeBottomConstraint:(id)a3;
- (void)setLiveBadgeHeightConstraint:(id)a3;
- (void)setLiveBadgeTrailingConstraint:(id)a3;
- (void)setLiveBadgeView:(id)a3;
- (void)setLiveBadgeViewHidden:(BOOL)a3;
- (void)setPlaceholderSnapshot:(id)a3;
- (void)setPlaceholderSnapshotView:(id)a3;
- (void)setStreamControl:(id)a3;
- (void)setStreamPreferences:(id)a3;
- (void)setSymbolImageView:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUserSettings:(id)a3;
- (void)startStreamIfNecessary;
- (void)stopStream;
@end

@implementation TVSBVideoBulletinCameraContentView

- (TVSBVideoBulletinCameraContentView)initWithFrame:(CGRect)a3
{
  CGRect v205 = a3;
  SEL v203 = a2;
  v204 = 0LL;
  v202.receiver = self;
  v202.super_class = (Class)&OBJC_CLASS___TVSBVideoBulletinCameraContentView;
  v204 = -[TVSBVideoBulletinCameraContentView initWithFrame:]( &v202,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  objc_storeStrong((id *)&v204, v204);
  if (v204)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___UIVisualEffectView);
    effectView = v204->_effectView;
    v204->_effectView = v3;

    -[UIVisualEffectView _setGroupName:](v204->_effectView, "_setGroupName:", @"TVSBVisualEffectGroupName");
    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:]( v204->_effectView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[TVSBVideoBulletinCameraContentView addSubview:](v204, "addSubview:", v204->_effectView);
    v5 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]( objc_alloc(&OBJC_CLASS___UIActivityIndicatorView),  "initWithActivityIndicatorStyle:",  101LL);
    activityIndicator = v204->_activityIndicator;
    v204->_activityIndicator = v5;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:]( v204->_activityIndicator,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIActivityIndicatorView startAnimating](v204->_activityIndicator, "startAnimating");
    v36 = -[UIVisualEffectView contentView](v204->_effectView, "contentView");
    -[UIView addSubview:](v36, "addSubview:", v204->_activityIndicator);

    v7 = objc_alloc_init(&OBJC_CLASS___HMCameraView);
    cameraView = v204->_cameraView;
    v204->_cameraView = v7;

    -[HMCameraView setTranslatesAutoresizingMaskIntoConstraints:]( v204->_cameraView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[HMCameraView setAlpha:](v204->_cameraView, "setAlpha:");
    -[TVSBVideoBulletinCameraContentView addSubview:](v204, "addSubview:", v204->_cameraView);
    v9 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    gradientImageView = v204->_gradientImageView;
    v204->_gradientImageView = v9;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v204->_gradientImageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v37 = v204->_gradientImageView;
    v38 = +[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"SmallGradient");
    -[UIImageView setImage:](v37, "setImage:");

    -[UIImageView setAlpha:](v204->_gradientImageView, "setAlpha:", 0.0);
    -[TVSBVideoBulletinCameraContentView addSubview:](v204, "addSubview:", v204->_gradientImageView);
    v11 = -[TVSBVideoBulletinBadgeView initWithMaterialBackground:]( objc_alloc(&OBJC_CLASS___TVSBVideoBulletinBadgeView),  "initWithMaterialBackground:",  0LL);
    liveBadgeView = v204->_liveBadgeView;
    v204->_liveBadgeView = v11;

    -[TVSBVideoBulletinBadgeView setTranslatesAutoresizingMaskIntoConstraints:]( v204->_liveBadgeView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[TVSBVideoBulletinBadgeView setAlpha:](v204->_liveBadgeView, "setAlpha:", 0.0);
    v39 = v204->_liveBadgeView;
    v41 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
    v40 =  -[NSBundle localizedStringForKey:value:table:]( v41,  "localizedStringForKey:value:table:",  @"VideoBulletinLiveTitle",  &stru_10002D998);
    -[TVSBVideoBulletinBadgeView setBadgeText:](v39, "setBadgeText:");

    -[TVSBVideoBulletinBadgeView setClipsToBounds:](v204->_liveBadgeView, "setClipsToBounds:", 1LL);
    v42 = v204->_liveBadgeView;
    v43 =  +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.976470588,  0.560784314,  0.117647059);
    -[TVSBVideoBulletinBadgeView setBackgroundColor:](v42, "setBackgroundColor:");

    -[TVSBVideoBulletinCameraContentView addSubview:](v204, "addSubview:", v204->_liveBadgeView);
    v13 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    placeholderSnapshotView = v204->_placeholderSnapshotView;
    v204->_placeholderSnapshotView = v13;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v204->_placeholderSnapshotView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIImageView setAlpha:](v204->_placeholderSnapshotView, "setAlpha:", 0.0);
    -[TVSBVideoBulletinCameraContentView addSubview:](v204, "addSubview:", v204->_placeholderSnapshotView);
    v15 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    symbolImageView = v204->_symbolImageView;
    v204->_symbolImageView = v15;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v204->_symbolImageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v44 = v204->_symbolImageView;
    id v46 =  +[UIFont _preferredFontForTextStyle:variant:]( &OBJC_CLASS___UIFont,  "_preferredFontForTextStyle:variant:",  UIFontTextStyleTitle1);
    v45 =  +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:");
    -[UIImageView setPreferredSymbolConfiguration:](v44, "setPreferredSymbolConfiguration:");

    -[UIImageView setAlpha:](v204->_symbolImageView, "setAlpha:", 0.0);
    -[TVSBVideoBulletinCameraContentView addSubview:](v204, "addSubview:", v204->_symbolImageView);
    v17 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    faceImageView = v204->_faceImageView;
    v204->_faceImageView = v17;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v204->_faceImageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIImageView setContentMode:](v204->_faceImageView, "setContentMode:", 2LL);
    -[UIImageView setClipsToBounds:](v204->_faceImageView, "setClipsToBounds:", 1LL);
    -[UIImageView _setCornerRadius:](v204->_faceImageView, "_setCornerRadius:", 45.0);
    -[UIImageView setAlpha:](v204->_faceImageView, "setAlpha:", 0.0);
    -[TVSBVideoBulletinCameraContentView addSubview:](v204, "addSubview:", v204->_faceImageView);
    v19 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v204->_titleLabel;
    v204->_titleLabel = v19;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v204->_titleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v47 = v204->_titleLabel;
    id v48 =  +[UIFont _preferredFontForTextStyle:variant:]( &OBJC_CLASS___UIFont,  "_preferredFontForTextStyle:variant:",  UIFontTextStyleTitle3,  1024LL);
    -[UILabel setFont:](v47, "setFont:");

    v49 = v204->_titleLabel;
    v50 = +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
    -[UILabel setTextColor:](v49, "setTextColor:");

    -[UILabel setNumberOfLines:](v204->_titleLabel, "setNumberOfLines:");
    -[UILabel setAlpha:](v204->_titleLabel, "setAlpha:", 0.0);
    -[TVSBVideoBulletinCameraContentView addSubview:](v204, "addSubview:", v204->_titleLabel);
    v21 = objc_alloc_init(&OBJC_CLASS___UILabel);
    descriptionLabel = v204->_descriptionLabel;
    v204->_descriptionLabel = v21;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v204->_descriptionLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v51 = v204->_descriptionLabel;
    v52 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleBody);
    -[UILabel setFont:](v51, "setFont:");

    v53 = v204->_descriptionLabel;
    v54 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.5);
    -[UILabel setTextColor:](v53, "setTextColor:");

    -[UILabel setNumberOfLines:](v204->_descriptionLabel, "setNumberOfLines:", 1LL);
    -[UILabel setAlpha:](v204->_descriptionLabel, "setAlpha:", 0.0);
    -[TVSBVideoBulletinCameraContentView addSubview:](v204, "addSubview:", v204->_descriptionLabel);
    id v56 = -[HMCameraView widthAnchor](v204->_cameraView, "widthAnchor");
    id v55 = -[TVSBVideoBulletinCameraContentView widthAnchor](v204, "widthAnchor");
    v23 = (NSLayoutConstraint *)objc_msgSend(v56, "constraintEqualToAnchor:");
    cameraViewWidthConstraint = v204->_cameraViewWidthConstraint;
    v204->_cameraViewWidthConstraint = v23;

    id v58 = -[HMCameraView heightAnchor](v204->_cameraView, "heightAnchor");
    id v57 = -[TVSBVideoBulletinCameraContentView heightAnchor](v204, "heightAnchor");
    v25 = (NSLayoutConstraint *)objc_msgSend(v58, "constraintEqualToAnchor:");
    cameraViewHeightConstraint = v204->_cameraViewHeightConstraint;
    v204->_cameraViewHeightConstraint = v25;

    id v59 = -[TVSBVideoBulletinBadgeView heightAnchor](v204->_liveBadgeView, "heightAnchor");
    v27 = (NSLayoutConstraint *)[v59 constraintEqualToConstant:30.0];
    liveBadgeHeightConstraint = v204->_liveBadgeHeightConstraint;
    v204->_liveBadgeHeightConstraint = v27;

    id v61 = -[TVSBVideoBulletinBadgeView bottomAnchor](v204->_liveBadgeView, "bottomAnchor");
    id v60 = -[TVSBVideoBulletinCameraContentView bottomAnchor](v204, "bottomAnchor");
    v29 = (NSLayoutConstraint *)objc_msgSend(v61, "constraintEqualToAnchor:constant:");
    liveBadgeBottomConstraint = v204->_liveBadgeBottomConstraint;
    v204->_liveBadgeBottomConstraint = v29;

    id v63 = -[TVSBVideoBulletinBadgeView trailingAnchor](v204->_liveBadgeView, "trailingAnchor");
    id v62 = -[TVSBVideoBulletinCameraContentView trailingAnchor](v204, "trailingAnchor");
    v31 = (NSLayoutConstraint *)objc_msgSend(v63, "constraintEqualToAnchor:constant:", -16.0);
    liveBadgeTrailingConstraint = v204->_liveBadgeTrailingConstraint;
    v204->_liveBadgeTrailingConstraint = v31;

    v201 = objc_alloc_init(&OBJC_CLASS___UILayoutGuide);
    -[TVSBVideoBulletinCameraContentView addLayoutGuide:](v204, "addLayoutGuide:", v201);
    v200 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v64 = v200;
    v67 = -[UILayoutGuide topAnchor](v201, "topAnchor");
    id v66 = -[UILabel topAnchor](v204->_titleLabel, "topAnchor");
    id v65 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v67, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v64, "addObject:");

    v68 = v200;
    v71 = -[UILayoutGuide bottomAnchor](v201, "bottomAnchor");
    id v70 = -[UILabel bottomAnchor](v204->_descriptionLabel, "bottomAnchor");
    id v69 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v71, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v68, "addObject:");

    v72 = v200;
    id v75 = -[HMCameraView centerXAnchor](v204->_cameraView, "centerXAnchor");
    id v74 = -[TVSBVideoBulletinCameraContentView centerXAnchor](v204, "centerXAnchor");
    id v73 = objc_msgSend(v75, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v72, "addObject:");

    v76 = v200;
    id v79 = -[HMCameraView centerYAnchor](v204->_cameraView, "centerYAnchor");
    id v78 = -[TVSBVideoBulletinCameraContentView centerYAnchor](v204, "centerYAnchor");
    id v77 = objc_msgSend(v79, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v76, "addObject:");

    -[NSMutableArray addObject:](v200, "addObject:", v204->_cameraViewWidthConstraint);
    -[NSMutableArray addObject:](v200, "addObject:", v204->_cameraViewHeightConstraint);
    v80 = v200;
    id v83 = -[UIImageView leadingAnchor](v204->_faceImageView, "leadingAnchor");
    id v82 = -[TVSBVideoBulletinCameraContentView leadingAnchor](v204, "leadingAnchor");
    id v81 = objc_msgSend(v83, "constraintEqualToAnchor:constant:", 80.0);
    -[NSMutableArray addObject:](v80, "addObject:");

    v84 = v200;
    id v87 = -[UIImageView centerYAnchor](v204->_faceImageView, "centerYAnchor");
    v86 = -[UILayoutGuide centerYAnchor](v201, "centerYAnchor");
    id v85 = objc_msgSend(v87, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v84, "addObject:");

    v88 = v200;
    id v90 = -[UIImageView widthAnchor](v204->_faceImageView, "widthAnchor");
    id v89 = objc_msgSend(v90, "constraintEqualToConstant:");
    -[NSMutableArray addObject:](v88, "addObject:");

    v91 = v200;
    id v93 = -[UIImageView heightAnchor](v204->_faceImageView, "heightAnchor");
    id v92 = [v93 constraintEqualToConstant:90.0];
    -[NSMutableArray addObject:](v91, "addObject:");

    v94 = v200;
    id v97 = -[UIImageView centerYAnchor](v204->_symbolImageView, "centerYAnchor");
    id v96 = -[UIImageView centerYAnchor](v204->_faceImageView, "centerYAnchor");
    id v95 = objc_msgSend(v97, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v94, "addObject:");

    v98 = v200;
    id v101 = -[UILabel leadingAnchor](v204->_titleLabel, "leadingAnchor");
    id v100 = -[UIImageView centerXAnchor](v204->_symbolImageView, "centerXAnchor");
    id v99 = objc_msgSend(v101, "constraintEqualToAnchor:constant:", 75.0);
    -[NSMutableArray addObject:](v98, "addObject:");

    v102 = v200;
    id v105 = -[UILabel leadingAnchor](v204->_titleLabel, "leadingAnchor");
    id v104 = -[UIImageView trailingAnchor](v204->_faceImageView, "trailingAnchor");
    id v103 = objc_msgSend(v105, "constraintEqualToAnchor:constant:", 20.0);
    -[NSMutableArray addObject:](v102, "addObject:");

    v106 = v200;
    id v109 = -[UILabel leadingAnchor](v204->_titleLabel, "leadingAnchor");
    id v108 = -[UILabel leadingAnchor](v204->_descriptionLabel, "leadingAnchor");
    id v107 = objc_msgSend(v109, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v106, "addObject:");

    v110 = v200;
    id v113 = -[UILabel firstBaselineAnchor](v204->_descriptionLabel, "firstBaselineAnchor");
    id v112 = -[TVSBVideoBulletinCameraContentView bottomAnchor](v204, "bottomAnchor");
    id v111 = objc_msgSend(v113, "constraintEqualToAnchor:constant:", -68.0);
    -[NSMutableArray addObject:](v110, "addObject:");

    v114 = v200;
    id v117 = -[UILabel firstBaselineAnchor](v204->_descriptionLabel, "firstBaselineAnchor");
    id v116 = -[UILabel firstBaselineAnchor](v204->_titleLabel, "firstBaselineAnchor");
    id v115 = objc_msgSend(v117, "constraintEqualToAnchor:constant:", 40.0);
    -[NSMutableArray addObject:](v114, "addObject:");

    v118 = v200;
    v122 = -[TVSBVideoBulletinCameraContentView effectView](v204, "effectView");
    id v121 = -[UIVisualEffectView centerXAnchor](v122, "centerXAnchor");
    id v120 = -[TVSBVideoBulletinCameraContentView centerXAnchor](v204, "centerXAnchor");
    id v119 = objc_msgSend(v121, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v118, "addObject:");

    v123 = v200;
    v127 = -[TVSBVideoBulletinCameraContentView effectView](v204, "effectView");
    id v126 = -[UIVisualEffectView centerYAnchor](v127, "centerYAnchor");
    id v125 = -[TVSBVideoBulletinCameraContentView centerYAnchor](v204, "centerYAnchor");
    id v124 = objc_msgSend(v126, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v123, "addObject:");

    v128 = v200;
    v132 = -[TVSBVideoBulletinCameraContentView effectView](v204, "effectView");
    id v131 = -[UIVisualEffectView widthAnchor](v132, "widthAnchor");
    id v130 = -[TVSBVideoBulletinCameraContentView widthAnchor](v204, "widthAnchor");
    id v129 = objc_msgSend(v131, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v128, "addObject:");

    v133 = v200;
    v137 = -[TVSBVideoBulletinCameraContentView effectView](v204, "effectView");
    id v136 = -[UIVisualEffectView heightAnchor](v137, "heightAnchor");
    id v135 = -[TVSBVideoBulletinCameraContentView heightAnchor](v204, "heightAnchor");
    id v134 = objc_msgSend(v136, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v133, "addObject:");

    v138 = v200;
    id v141 = -[UIActivityIndicatorView widthAnchor](v204->_activityIndicator, "widthAnchor");
    id v140 = -[UIVisualEffectView widthAnchor](v204->_effectView, "widthAnchor");
    id v139 = objc_msgSend(v141, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v138, "addObject:");

    v142 = v200;
    id v145 = -[UIActivityIndicatorView heightAnchor](v204->_activityIndicator, "heightAnchor");
    id v144 = -[UIVisualEffectView heightAnchor](v204->_effectView, "heightAnchor");
    id v143 = objc_msgSend(v145, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v142, "addObject:");

    v146 = v200;
    id v149 = -[UIActivityIndicatorView centerXAnchor](v204->_activityIndicator, "centerXAnchor");
    id v148 = -[UIVisualEffectView centerXAnchor](v204->_effectView, "centerXAnchor");
    id v147 = objc_msgSend(v149, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v146, "addObject:");

    v150 = v200;
    id v153 = -[UIActivityIndicatorView centerYAnchor](v204->_activityIndicator, "centerYAnchor");
    id v152 = -[UIVisualEffectView centerYAnchor](v204->_effectView, "centerYAnchor");
    id v151 = objc_msgSend(v153, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v150, "addObject:");

    v154 = v200;
    v158 = -[TVSBVideoBulletinCameraContentView gradientImageView](v204, "gradientImageView");
    id v157 = -[UIImageView centerXAnchor](v158, "centerXAnchor");
    id v156 = -[TVSBVideoBulletinCameraContentView centerXAnchor](v204, "centerXAnchor");
    id v155 = objc_msgSend(v157, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v154, "addObject:");

    v159 = v200;
    v163 = -[TVSBVideoBulletinCameraContentView gradientImageView](v204, "gradientImageView");
    id v162 = -[UIImageView centerYAnchor](v163, "centerYAnchor");
    id v161 = -[TVSBVideoBulletinCameraContentView centerYAnchor](v204, "centerYAnchor");
    id v160 = objc_msgSend(v162, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v159, "addObject:");

    v164 = v200;
    v168 = -[TVSBVideoBulletinCameraContentView gradientImageView](v204, "gradientImageView");
    id v167 = -[UIImageView widthAnchor](v168, "widthAnchor");
    id v166 = -[TVSBVideoBulletinCameraContentView widthAnchor](v204, "widthAnchor");
    id v165 = objc_msgSend(v167, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v164, "addObject:");

    v169 = v200;
    v173 = -[TVSBVideoBulletinCameraContentView gradientImageView](v204, "gradientImageView");
    id v172 = -[UIImageView heightAnchor](v173, "heightAnchor");
    id v171 = -[TVSBVideoBulletinCameraContentView heightAnchor](v204, "heightAnchor");
    id v170 = objc_msgSend(v172, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v169, "addObject:");

    v174 = v200;
    v179 = -[TVSBVideoBulletinCameraContentView placeholderSnapshotView](v204, "placeholderSnapshotView");
    id v178 = -[UIImageView centerXAnchor](v179, "centerXAnchor");
    v177 = -[TVSBVideoBulletinCameraContentView cameraView](v204, "cameraView");
    id v176 = -[HMCameraView centerXAnchor](v177, "centerXAnchor");
    id v175 = objc_msgSend(v178, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v174, "addObject:");

    v180 = v200;
    v185 = -[TVSBVideoBulletinCameraContentView placeholderSnapshotView](v204, "placeholderSnapshotView");
    id v184 = -[UIImageView centerYAnchor](v185, "centerYAnchor");
    v183 = -[TVSBVideoBulletinCameraContentView cameraView](v204, "cameraView");
    id v182 = -[HMCameraView centerYAnchor](v183, "centerYAnchor");
    id v181 = objc_msgSend(v184, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v180, "addObject:");

    v186 = v200;
    v191 = -[TVSBVideoBulletinCameraContentView placeholderSnapshotView](v204, "placeholderSnapshotView");
    id v190 = -[UIImageView widthAnchor](v191, "widthAnchor");
    v189 = -[TVSBVideoBulletinCameraContentView cameraView](v204, "cameraView");
    id v188 = -[HMCameraView widthAnchor](v189, "widthAnchor");
    id v187 = objc_msgSend(v190, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v186, "addObject:");

    v192 = v200;
    v197 = -[TVSBVideoBulletinCameraContentView placeholderSnapshotView](v204, "placeholderSnapshotView");
    id v196 = -[UIImageView heightAnchor](v197, "heightAnchor");
    v195 = -[TVSBVideoBulletinCameraContentView cameraView](v204, "cameraView");
    id v194 = -[HMCameraView heightAnchor](v195, "heightAnchor");
    id v193 = objc_msgSend(v196, "constraintEqualToAnchor:");
    -[NSMutableArray addObject:](v192, "addObject:");

    -[NSMutableArray addObject:](v200, "addObject:", v204->_liveBadgeBottomConstraint);
    -[NSMutableArray addObject:](v200, "addObject:", v204->_liveBadgeHeightConstraint);
    -[NSMutableArray addObject:](v200, "addObject:", v204->_liveBadgeTrailingConstraint);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v200);
    -[TVSBVideoBulletinCameraContentView _updateEffect](v204, "_updateEffect");
    v198 = v204;
    uint64_t v206 = objc_opt_class(&OBJC_CLASS___UITraitUserInterfaceStyle);
    v199 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v206, 1LL);
    id v33 =  -[TVSBVideoBulletinCameraContentView registerForTraitChanges:withAction:]( v198,  "registerForTraitChanges:withAction:");

    objc_storeStrong((id *)&v200, 0LL);
    objc_storeStrong((id *)&v201, 0LL);
  }

  v35 = v204;
  objc_storeStrong((id *)&v204, 0LL);
  return v35;
}

- (void)setCameraProfile:(id)a3
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v15->_cameraProfile != location[0])
  {
    objc_storeStrong((id *)&v15->_cameraProfile, location[0]);
    v3 = -[TVSBVideoBulletinCameraContentView userSettings](v15, "userSettings");
    -[HMCameraUserSettings setDelegate:](v3, "setDelegate:");

    v4 = -[TVSBVideoBulletinCameraContentView streamControl](v15, "streamControl");
    -[HMCameraStreamControl setDelegate:](v4, "setDelegate:", 0LL);

    v5 = -[TVSBVideoBulletinCameraContentView streamControl](v15, "streamControl");
    -[HMCameraStreamControl stopStream](v5, "stopStream");

    v6 = v15;
    id v7 = [location[0] streamControl];
    -[TVSBVideoBulletinCameraContentView setStreamControl:](v6, "setStreamControl:");

    -[TVSBVideoBulletinCameraContentView _updateCameraViewConstraints](v15, "_updateCameraViewConstraints");
    v8 = -[TVSBVideoBulletinCameraContentView streamControl](v15, "streamControl");
    -[HMCameraStreamControl setDelegate:](v8, "setDelegate:", v15);

    -[TVSBVideoBulletinCameraContentView setCachedStreamError:](v15, "setCachedStreamError:", 0LL);
    v9 = v15;
    id v10 = [location[0] userSettings];
    -[TVSBVideoBulletinCameraContentView setUserSettings:](v9, "setUserSettings:");

    v11 = -[TVSBVideoBulletinCameraContentView userSettings](v15, "userSettings");
    -[HMCameraUserSettings setDelegate:](v11, "setDelegate:", v15);

    v13 = -[TVSBVideoBulletinCameraContentView streamControl](v15, "streamControl");
    v12 = -[TVSBVideoBulletinCameraContentView streamPreferences](v15, "streamPreferences");
    -[HMCameraStreamControl startStreamWithPreferences:](v13, "startStreamWithPreferences:");

    -[TVSBVideoBulletinCameraContentView _updateContentViews](v15, "_updateContentViews");
    -[TVSBVideoBulletinCameraContentView _updateCameraNameLabels](v15, "_updateCameraNameLabels");
  }

  objc_storeStrong(location, 0LL);
}

- (void)setPlaceholderSnapshot:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v7->_placeholderSnapshot, location[0]);
  if (location[0])
  {
    v3 = -[TVSBVideoBulletinCameraContentView activityIndicator](v7, "activityIndicator");
    -[UIActivityIndicatorView stopAnimating](v3, "stopAnimating");

    v4 = -[TVSBVideoBulletinCameraContentView placeholderSnapshotView](v7, "placeholderSnapshotView");
    -[UIImageView setAlpha:](v4, "setAlpha:", 1.0);

    v5 = -[TVSBVideoBulletinCameraContentView placeholderSnapshotView](v7, "placeholderSnapshotView");
    -[UIImageView setImage:](v5, "setImage:", location[0]);
  }

  objc_storeStrong(location, 0LL);
}

- (void)setFaceImage:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v9->_faceImage, location[0]);
  if (location[0])
  {
    id v7 = -[TVSBVideoBulletinCameraContentView faceImageView](v9, "faceImageView");
    -[UIImageView setImage:](v7, "setImage:", location[0]);

    if (-[TVSBVideoBulletinCameraContentView isFullScreen](v9, "isFullScreen"))
    {
      v5 = -[TVSBVideoBulletinCameraContentView symbolImageView](v9, "symbolImageView");
      -[UIImageView setAlpha:](v5, "setAlpha:", 0.0);

      v6 = -[TVSBVideoBulletinCameraContentView faceImageView](v9, "faceImageView");
      -[UIImageView setAlpha:](v6, "setAlpha:", 1.0);
    }
  }

  else if (-[TVSBVideoBulletinCameraContentView isFullScreen](v9, "isFullScreen"))
  {
    v3 = -[TVSBVideoBulletinCameraContentView symbolImageView](v9, "symbolImageView");
    -[UIImageView setAlpha:](v3, "setAlpha:", 1.0);

    v4 = -[TVSBVideoBulletinCameraContentView faceImageView](v9, "faceImageView");
    -[UIImageView setAlpha:](v4, "setAlpha:", 0.0);
  }

  objc_storeStrong(location, 0LL);
}

- (void)setTitle:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (!-[NSString isEqualToString:](v5->_title, "isEqualToString:", location[0]))
  {
    objc_storeStrong((id *)&v5->_title, location[0]);
    v3 = -[TVSBVideoBulletinCameraContentView titleLabel](v5, "titleLabel");
    -[UILabel setText:](v3, "setText:", location[0]);
  }

  objc_storeStrong(location, 0LL);
}

- (void)setFullScreen:(BOOL)a3
{
  v40 = self;
  SEL v39 = a2;
  BOOL v38 = a3;
  self->_fullScreen = a3;
  objc_initWeak(&location, v40);
  LODWORD(v3) = 0.25;
  LODWORD(v4) = 0;
  LODWORD(v5) = 0.75;
  LODWORD(v6) = 1.0;
  id v36 =  +[CAMediaTimingFunction functionWithControlPoints::::]( &OBJC_CLASS___CAMediaTimingFunction,  "functionWithControlPoints::::",  v3,  v4,  v5,  v6);
  id v35 = -[UICubicTimingParameters initWithCustomCurve:]( objc_alloc(&OBJC_CLASS___UICubicTimingParameters),  "initWithCustomCurve:",  v36);
  id v34 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v35,  0.18);
  id v7 = -[TVSBVideoBulletinCameraContentView faceImage](v40, "faceImage");
  BOOL v13 = v7 != 0LL;

  BOOL v33 = v13;
  id v14 = v34;
  v25 = _NSConcreteStackBlock;
  int v26 = -1073741824;
  int v27 = 0;
  v28 = sub_10001175C;
  v29 = &unk_10002CB78;
  objc_copyWeak(&v30, &location);
  BOOL v31 = v38;
  BOOL v32 = v33;
  [v14 addAnimations:&v25 delayFactor:0.15];
  LODWORD(v8) = 0;
  LODWORD(v9) = 0;
  LODWORD(v10) = 1045220557;
  LODWORD(v11) = 1.0;
  id v24 =  +[CAMediaTimingFunction functionWithControlPoints::::]( &OBJC_CLASS___CAMediaTimingFunction,  "functionWithControlPoints::::",  v9,  v8,  v10,  v11);
  id v23 = -[UICubicTimingParameters initWithCustomCurve:]( objc_alloc(&OBJC_CLASS___UICubicTimingParameters),  "initWithCustomCurve:",  v24);
  id v22 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v23,  0.25);
  id v12 = v22;
  v15 = _NSConcreteStackBlock;
  int v16 = -1073741824;
  int v17 = 0;
  v18 = sub_100011958;
  v19 = &unk_10002CBA0;
  objc_copyWeak(&v20, &location);
  BOOL v21 = v38;
  [v12 addAnimations:&v15];
  [v34 startAnimation];
  [v22 startAnimation];
  -[TVSBVideoBulletinCameraContentView _updateCameraViewConstraints](v40, "_updateCameraViewConstraints");
  -[TVSBVideoBulletinCameraContentView _updateAudioStream:](v40, "_updateAudioStream:", v38);
  objc_destroyWeak(&v20);
  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(&v23, 0LL);
  objc_storeStrong(&v24, 0LL);
  objc_destroyWeak(&v30);
  objc_storeStrong(&v34, 0LL);
  objc_storeStrong(&v35, 0LL);
  objc_storeStrong(&v36, 0LL);
  objc_destroyWeak(&location);
}

- (void)setLiveBadgeViewHidden:(BOOL)a3
{
}

- (void)startStreamIfNecessary
{
  double v3 = -[TVSBVideoBulletinCameraContentView streamControl](self, "streamControl");
  char v5 = 0;
  BOOL v4 = 0;
  if ((id)-[HMCameraStreamControl streamState](v3, "streamState") != (id)1)
  {
    double v6 = -[TVSBVideoBulletinCameraContentView streamControl](self, "streamControl");
    char v5 = 1;
    BOOL v4 = (id)-[HMCameraStreamControl streamState](v6, "streamState") != (id)2;
  }

  if ((v5 & 1) != 0) {

  }
  if (v4)
  {
    -[TVSBVideoBulletinCameraContentView setCachedStreamError:](self, "setCachedStreamError:", 0LL);
    v2 = -[TVSBVideoBulletinCameraContentView streamControl](self, "streamControl");
    -[HMCameraStreamControl startStream](v2, "startStream");
  }

- (void)stopStream
{
  v2 = -[TVSBVideoBulletinCameraContentView streamControl](self, "streamControl");
  -[HMCameraStreamControl stopStream](v2, "stopStream");
}

- (void)cameraStreamControlDidStartStream:(id)a3
{
  v40 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v38 = [location[0] cameraStream];
  -[TVSBVideoBulletinCameraContentView setCachedStreamError:](v40, "setCachedStreamError:", 0LL);
  BOOL v4 = -[TVSBVideoBulletinCameraContentView cameraView](v40, "cameraView");
  -[HMCameraView setCameraSource:](v4, "setCameraSource:", v38);

  -[TVSBVideoBulletinCameraContentView _updateAudioStream:]( v40,  "_updateAudioStream:",  -[TVSBVideoBulletinCameraContentView isFullScreen](v40, "isFullScreen"));
  BOOL v31 = _NSConcreteStackBlock;
  int v32 = -1073741824;
  int v33 = 0;
  id v34 = sub_100011FF4;
  id v35 = &unk_10002CA68;
  id v36 = v40;
  id v37 = objc_retainBlock(&v31);
  double v3 = -[TVSBVideoBulletinCameraContentView placeholderSnapshot](v40, "placeholderSnapshot");
  BOOL v5 = v3 == 0LL;

  BOOL v30 = v5;
  if (v5)
  {
    id v24 = _NSConcreteStackBlock;
    int v25 = -1073741824;
    int v26 = 0;
    int v27 = sub_1000120AC;
    v28 = &unk_10002CBC8;
    id v29 = v37;
    v18 = _NSConcreteStackBlock;
    int v19 = -1073741824;
    int v20 = 0;
    BOOL v21 = sub_1000120E0;
    id v22 = &unk_10002CBF0;
    id v23 = v40;
    +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  &v24,  &v18,  0.2);
    objc_storeStrong((id *)&v23, 0LL);
    objc_storeStrong(&v29, 0LL);
  }

  else
  {
    (*((void (**)(void))v37 + 2))();
    id v12 = _NSConcreteStackBlock;
    int v13 = -1073741824;
    int v14 = 0;
    v15 = sub_10001217C;
    int v16 = &unk_10002CA68;
    int v17 = v40;
    double v6 = _NSConcreteStackBlock;
    int v7 = -1073741824;
    int v8 = 0;
    double v9 = sub_1000121CC;
    double v10 = &unk_10002CBF0;
    double v11 = v40;
    +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  &v12,  &v6,  0.2);
    objc_storeStrong((id *)&v11, 0LL);
    objc_storeStrong((id *)&v17, 0LL);
  }

  objc_storeStrong(&v37, 0LL);
  objc_storeStrong((id *)&v36, 0LL);
  objc_storeStrong(&v38, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)cameraStreamControl:(id)a3 didStopStreamWithError:(id)a4
{
  id v23 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v21 = 0LL;
  objc_storeStrong(&v21, a4);
  if (v21)
  {
    id v20 = sub_10001E6C8();
    char v19 = 16;
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v20;
      os_log_type_t type = v19;
      int v13 = -[TVSBVideoBulletinCameraContentView cameraProfile](v23, "cameraProfile");
      id v12 = -[HMCameraProfile accessory](v13, "accessory");
      id v11 = [v12 name];
      id v18 = v11;
      sub_100012504((uint64_t)v25, (uint64_t)v18, (uint64_t)v21);
      _os_log_error_impl((void *)&_mh_execute_header, log, type, "%@ did stop stream with error %@", v25, 0x16u);

      objc_storeStrong(&v18, 0LL);
    }

    objc_storeStrong(&v20, 0LL);
    -[TVSBVideoBulletinCameraContentView setCachedStreamError:](v23, "setCachedStreamError:", v21);
    -[TVSBVideoBulletinCameraContentView _updateContentViews](v23, "_updateContentViews");
    -[TVSBVideoBulletinCameraContentView _updateCameraNameLabels](v23, "_updateCameraNameLabels");
  }

  else
  {
    id v17 = sub_10001E6C8();
    char v16 = 1;
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_INFO))
    {
      BOOL v4 = (os_log_s *)v17;
      os_log_type_t v5 = v16;
      int v8 = -[TVSBVideoBulletinCameraContentView cameraProfile](v23, "cameraProfile");
      id v7 = -[HMCameraProfile accessory](v8, "accessory");
      id v6 = [v7 name];
      id v15 = v6;
      sub_10000BF34((uint64_t)v24, (uint64_t)v15);
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "%@ successfully stopped stream", v24, 0xCu);

      objc_storeStrong(&v15, 0LL);
    }

    objc_storeStrong(&v17, 0LL);
  }

  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)cameraUserSettingsDidUpdate:(id)a3
{
  BOOL v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSBVideoBulletinCameraContentView _updateCameraNameLabels](v4, "_updateCameraNameLabels");
  objc_storeStrong(location, 0LL);
}

- (void)_updateCameraNameLabels
{
  id v36 = self;
  v35[1] = (id)a2;
  BOOL v31 = -[TVSBVideoBulletinCameraContentView cameraProfile](self, "cameraProfile");
  v35[0] = -[HMCameraProfile accessory](v31, "accessory");

  id v34 = 0LL;
  if (-[TVSBVideoBulletinCameraContentView _shouldDisplayAccessModeErrorContent]( v36,  "_shouldDisplayAccessModeErrorContent"))
  {
    id v29 = -[TVSBVideoBulletinCameraContentView userSettings](v36, "userSettings");
    char v32 = 0;
    unsigned __int8 v30 = 1;
    if (-[HMCameraUserSettings currentAccessMode](v29, "currentAccessMode"))
    {
      int v33 = -[TVSBVideoBulletinCameraContentView userSettings](v36, "userSettings");
      char v32 = 1;
      unsigned __int8 v30 = -[HMCameraUserSettings isCameraManuallyDisabled](v33, "isCameraManuallyDisabled");
    }

    if ((v32 & 1) != 0) {

    }
    if ((v30 & 1) != 0)
    {
      v28 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
      v2 =  -[NSBundle localizedStringForKey:value:table:]( v28,  "localizedStringForKey:value:table:",  @"VideoBulletinCameraOffTitle",  &stru_10002D998,  0LL);
      double v3 = v34;
      id v34 = v2;
    }

    else
    {
      int v27 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
      BOOL v4 =  -[NSBundle localizedStringForKey:value:table:]( v27,  "localizedStringForKey:value:table:",  @"VideoBulletinCameraDetectActivityTitle",  &stru_10002D998,  0LL);
      os_log_type_t v5 = v34;
      id v34 = v4;
    }
  }

  else if (-[TVSBVideoBulletinCameraContentView _shouldDisplayErrorContent](v36, "_shouldDisplayErrorContent"))
  {
    int v25 = -[TVSBVideoBulletinCameraContentView cachedStreamError](v36, "cachedStreamError");
    BOOL v26 = (id)-[NSError code](v25, "code") != (id)14;

    if (v26)
    {
      id v23 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
      int v8 =  -[NSBundle localizedStringForKey:value:table:]( v23,  "localizedStringForKey:value:table:",  @"VideoBulletinCameraNotReachableTitle",  &stru_10002D998,  0LL);
      double v9 = v34;
      id v34 = v8;
    }

    else
    {
      id v24 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
      id v6 =  -[NSBundle localizedStringForKey:value:table:]( v24,  "localizedStringForKey:value:table:",  @"VideoBulletinCameraBusyTitle",  &stru_10002D998,  0LL);
      id v7 = v34;
      id v34 = v6;
    }
  }

  else if (-[TVSBVideoBulletinCameraContentView isDoorbell](v36, "isDoorbell"))
  {
    double v10 = (NSString *)[v35[0] name];
    id v11 = v34;
    id v34 = v10;
  }

  else
  {
    id v21 = -[TVSBVideoBulletinCameraContentView userSettings](v36, "userSettings");
    BOOL v22 = -[HMCameraUserSettings currentAccessMode](v21, "currentAccessMode") != (id)1;

    if (v22)
    {
      char v19 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
      int v14 =  -[NSBundle localizedStringForKey:value:table:]( v19,  "localizedStringForKey:value:table:",  @"VideoBulletinCameraStreamingRecordingTitle",  &stru_10002D998,  0LL);
      id v15 = v34;
      id v34 = v14;
    }

    else
    {
      id v20 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
      id v12 =  -[NSBundle localizedStringForKey:value:table:]( v20,  "localizedStringForKey:value:table:",  @"VideoBulletinCameraStreamingTitle",  &stru_10002D998,  0LL);
      int v13 = v34;
      id v34 = v12;
    }
  }

  id v17 = -[TVSBVideoBulletinCameraContentView titleLabel](v36, "titleLabel");
  char v16 = -[TVSBVideoBulletinCameraContentView title](v36, "title");
  -[UILabel setText:](v17, "setText:");

  id v18 = -[TVSBVideoBulletinCameraContentView descriptionLabel](v36, "descriptionLabel");
  -[UILabel setText:](v18, "setText:", v34);

  objc_storeStrong((id *)&v34, 0LL);
  objc_storeStrong(v35, 0LL);
}

- (void)_updateContentViews
{
  BOOL v26 = self;
  SEL v25 = a2;
  int v8 = -[TVSBVideoBulletinCameraContentView streamControl](self, "streamControl");
  BOOL v9 = (id)-[HMCameraStreamControl streamState](v8, "streamState") == (id)2;

  BOOL v24 = v9;
  unsigned __int8 v10 = 1;
  if (!-[TVSBVideoBulletinCameraContentView _shouldDisplayAccessModeErrorContent]( v26,  "_shouldDisplayAccessModeErrorContent")) {
    unsigned __int8 v10 = -[TVSBVideoBulletinCameraContentView _shouldDisplayErrorContent](v26, "_shouldDisplayErrorContent");
  }
  char v23 = v10 & 1;
  char v7 = 0;
  if (v24) {
    char v7 = v23 ^ 1;
  }
  char v22 = v7 & 1;
  char v19 = 0;
  BOOL v6 = 0;
  if (!v24)
  {
    id v20 = -[TVSBVideoBulletinCameraContentView placeholderSnapshot](v26, "placeholderSnapshot");
    char v19 = 1;
    BOOL v6 = v20 != 0LL;
  }

  if ((v19 & 1) != 0) {

  }
  char v21 = v6;
  BOOL v4 = -[TVSBVideoBulletinCameraContentView effectView](v26, "effectView");
  char v5 = 1;
  if (!v24) {
    char v5 = v21;
  }
  -[UIVisualEffectView setHidden:](v4, "setHidden:", v5 & 1);

  if (v24 || (v23 & 1) != 0)
  {
    v2 = -[TVSBVideoBulletinCameraContentView activityIndicator](v26, "activityIndicator");
    -[UIActivityIndicatorView stopAnimating](v2, "stopAnimating");
  }

  else
  {
    double v3 = -[TVSBVideoBulletinCameraContentView activityIndicator](v26, "activityIndicator");
    -[UIActivityIndicatorView startAnimating](v3, "startAnimating");
  }

  id v11 = _NSConcreteStackBlock;
  int v12 = -1073741824;
  int v13 = 0;
  int v14 = sub_100012D58;
  id v15 = &unk_10002CC18;
  char v16 = v26;
  char v17 = v22 & 1;
  char v18 = v21 & 1;
  +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", &v11, 0.2);
  objc_storeStrong((id *)&v16, 0LL);
}

- (BOOL)_shouldDisplayAccessModeErrorContent
{
  BOOL v4 = -[TVSBVideoBulletinCameraContentView cameraProfile](self, "cameraProfile");
  char v10 = 0;
  char v8 = 0;
  char v6 = 0;
  unsigned __int8 v5 = 0;
  if (v4)
  {
    id v11 = -[TVSBVideoBulletinCameraContentView userSettings](self, "userSettings");
    char v10 = 1;
    unsigned __int8 v3 = 1;
    if (-[HMCameraUserSettings currentAccessMode](v11, "currentAccessMode"))
    {
      BOOL v9 = -[TVSBVideoBulletinCameraContentView userSettings](self, "userSettings");
      char v8 = 1;
      unsigned __int8 v3 = 1;
      if (-[HMCameraUserSettings currentAccessMode](v9, "currentAccessMode") != (id)3)
      {
        char v7 = -[TVSBVideoBulletinCameraContentView userSettings](self, "userSettings");
        char v6 = 1;
        unsigned __int8 v3 = -[HMCameraUserSettings isCameraManuallyDisabled](v7, "isCameraManuallyDisabled");
      }
    }

    unsigned __int8 v5 = v3;
  }

  if ((v6 & 1) != 0) {

  }
  if ((v8 & 1) != 0) {
  if ((v10 & 1) != 0)
  }

  return v5 & 1;
}

- (BOOL)_shouldDisplayErrorContent
{
  BOOL v9 = self;
  location[1] = (id)a2;
  location[0] = -[TVSBVideoBulletinCameraContentView cameraProfile](self, "cameraProfile");
  id v6 = [location[0] accessory];
  unsigned __int8 v7 = [v6 isReachableForSnapshottingAndStreaming];

  if ((v7 & 1) != 0)
  {
    unsigned __int8 v5 = -[TVSBVideoBulletinCameraContentView cachedStreamError](v9, "cachedStreamError");

    BOOL v10 = v5
       && (unsigned __int8 v3 = -[TVSBVideoBulletinCameraContentView cachedStreamError](v9, "cachedStreamError"),
           BOOL v4 = (id)-[NSError code](v3, "code") == (id)23,
           v3,
           !v4)
       || (objc_msgSend(location[0], "hf_thermalShutdownModeActive") & 1) != 0;
  }

  else
  {
    BOOL v10 = 1;
  }

  objc_storeStrong(location, 0LL);
  return v10;
}

- (void)_updateAudioStream:(BOOL)a3
{
  id v15 = self;
  SEL v14 = a2;
  BOOL v13 = a3;
  uint64_t v3 = 2LL;
  if (!a3) {
    uint64_t v3 = 1LL;
  }
  uint64_t v12 = v3;
  unsigned __int8 v5 = -[TVSBVideoBulletinCameraContentView streamControl](v15, "streamControl");
  BOOL v4 = -[HMCameraStreamControl cameraStream](v5, "cameraStream");
  id v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  BOOL v9 = sub_100013304;
  BOOL v10 = &unk_10002CC38;
  uint64_t v11 = v12;
  -[HMCameraStream updateAudioStreamSetting:completionHandler:]( v4,  "updateAudioStreamSetting:completionHandler:",  v12,  &v6);
}

- (void)_updateCameraViewConstraints
{
  v51 = -[TVSBVideoBulletinCameraContentView cameraViewWidthConstraint](self, "cameraViewWidthConstraint");
  v55[0] = v51;
  v50 = -[TVSBVideoBulletinCameraContentView cameraViewHeightConstraint](self, "cameraViewHeightConstraint");
  v55[1] = v50;
  v49 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v55, 2LL);
  +[NSLayoutConstraint deactivateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "deactivateConstraints:");

  -[TVSBVideoBulletinCameraContentView aspectRatio](self, "aspectRatio");
  double v52 = v2;
  if (vabdd_f64(v2, 0.0) < 0.00000011920929)
  {
    v47 = -[TVSBVideoBulletinCameraContentView cameraProfile](self, "cameraProfile");
    id v46 = -[HMCameraProfile snapshotControl](v47, "snapshotControl");
    id v48 = -[HMCameraSnapshotControl mostRecentSnapshot](v46, "mostRecentSnapshot");

    if (v48)
    {
      v45 = -[TVSBVideoBulletinCameraContentView cameraProfile](self, "cameraProfile");
      v44 = -[HMCameraProfile snapshotControl](v45, "snapshotControl");
      v43 = -[HMCameraSnapshotControl mostRecentSnapshot](v44, "mostRecentSnapshot");
      -[HMCameraSnapshot aspectRatio](v43, "aspectRatio");
      double v52 = v3;
    }

    else
    {
      v41 = -[TVSBVideoBulletinCameraContentView streamControl](self, "streamControl");
      v42 = -[HMCameraStreamControl cameraStream](v41, "cameraStream");

      if (v42)
      {
        v40 = -[TVSBVideoBulletinCameraContentView streamControl](self, "streamControl");
        SEL v39 = -[HMCameraStreamControl cameraStream](v40, "cameraStream");
        -[HMCameraStream aspectRatio](v39, "aspectRatio");
        double v52 = v4;
      }
    }
  }

  if (vabdd_f64(v52, 0.0) >= 0.00000011920929)
  {
    double v9 = v52;
    if (v52 <= 1.0 && -[TVSBVideoBulletinCameraContentView isFullScreen](self, "isFullScreen", v52))
    {
      char v23 = -[TVSBVideoBulletinCameraContentView cameraView](self, "cameraView");
      id v22 = -[HMCameraView widthAnchor](v23, "widthAnchor");
      id v21 = -[TVSBVideoBulletinCameraContentView heightAnchor](self, "heightAnchor");
      SEL v14 = (NSLayoutConstraint *)objc_msgSend(v22, "constraintEqualToAnchor:multiplier:", v52);
      cameraViewWidthConstraint = self->_cameraViewWidthConstraint;
      self->_cameraViewWidthConstraint = v14;

      BOOL v26 = -[TVSBVideoBulletinCameraContentView cameraView](self, "cameraView");
      id v25 = -[HMCameraView heightAnchor](v26, "heightAnchor");
      id v24 = -[TVSBVideoBulletinCameraContentView heightAnchor](self, "heightAnchor");
      char v16 = (NSLayoutConstraint *)objc_msgSend(v25, "constraintEqualToAnchor:");
      cameraViewHeightConstraint = self->_cameraViewHeightConstraint;
      self->_cameraViewHeightConstraint = v16;
    }

    else
    {
      id v29 = -[TVSBVideoBulletinCameraContentView cameraView](self, "cameraView", v9);
      id v28 = -[HMCameraView widthAnchor](v29, "widthAnchor");
      id v27 = -[TVSBVideoBulletinCameraContentView widthAnchor](self, "widthAnchor");
      BOOL v10 = (NSLayoutConstraint *)objc_msgSend(v28, "constraintEqualToAnchor:");
      uint64_t v11 = self->_cameraViewWidthConstraint;
      self->_cameraViewWidthConstraint = v10;

      char v32 = -[TVSBVideoBulletinCameraContentView cameraView](self, "cameraView");
      id v31 = -[HMCameraView heightAnchor](v32, "heightAnchor");
      id v30 = -[TVSBVideoBulletinCameraContentView widthAnchor](self, "widthAnchor");
      uint64_t v12 = (NSLayoutConstraint *)objc_msgSend(v31, "constraintEqualToAnchor:multiplier:", 1.0 / v52);
      BOOL v13 = self->_cameraViewHeightConstraint;
      self->_cameraViewHeightConstraint = v12;
    }
  }

  else
  {
    id v35 = -[TVSBVideoBulletinCameraContentView cameraView](self, "cameraView");
    id v34 = -[HMCameraView widthAnchor](v35, "widthAnchor");
    id v33 = -[TVSBVideoBulletinCameraContentView widthAnchor](self, "widthAnchor");
    unsigned __int8 v5 = (NSLayoutConstraint *)objc_msgSend(v34, "constraintEqualToAnchor:");
    id v6 = self->_cameraViewWidthConstraint;
    self->_cameraViewWidthConstraint = v5;

    id v38 = -[TVSBVideoBulletinCameraContentView cameraView](self, "cameraView");
    id v37 = -[HMCameraView heightAnchor](v38, "heightAnchor");
    id v36 = -[TVSBVideoBulletinCameraContentView heightAnchor](self, "heightAnchor");
    int v7 = (NSLayoutConstraint *)objc_msgSend(v37, "constraintEqualToAnchor:");
    int v8 = self->_cameraViewHeightConstraint;
    self->_cameraViewHeightConstraint = v7;
  }

  id v20 = -[TVSBVideoBulletinCameraContentView cameraViewWidthConstraint](self, "cameraViewWidthConstraint");
  v54[0] = v20;
  char v19 = -[TVSBVideoBulletinCameraContentView cameraViewHeightConstraint](self, "cameraViewHeightConstraint");
  v54[1] = v19;
  char v18 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v54, 2LL);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");
}

- (void)_updateEffect
{
  double v9 = self;
  SEL v8 = a2;
  id v3 = -[TVSBVideoBulletinCameraContentView traitCollection](self, "traitCollection");
  BOOL v4 = [v3 userInterfaceStyle] == (id)2;

  BOOL v7 = v4;
  if (v4) {
    uint64_t v2 = 4008LL;
  }
  else {
    uint64_t v2 = 4006LL;
  }
  id v6 = +[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", v2);
  unsigned __int8 v5 = -[TVSBVideoBulletinCameraContentView effectView](v9, "effectView");
  -[UIVisualEffectView setEffect:](v5, "setEffect:", v6);

  objc_storeStrong((id *)&v6, 0LL);
}

- (HMCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (HMCameraStreamPreferences)streamPreferences
{
  return self->_streamPreferences;
}

- (void)setStreamPreferences:(id)a3
{
}

- (UIImage)placeholderSnapshot
{
  return self->_placeholderSnapshot;
}

- (UIImage)faceImage
{
  return self->_faceImage;
}

- (NSString)title
{
  return self->_title;
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (void)setAspectRatio:(double)a3
{
  self->_aspectRatio = a3;
}

- (BOOL)isDoorbell
{
  return self->_doorbell;
}

- (void)setDoorbell:(BOOL)a3
{
  self->_doorbell = a3;
}

- (BOOL)isFullScreen
{
  return self->_fullScreen;
}

- (HMCameraUserSettings)userSettings
{
  return self->_userSettings;
}

- (void)setUserSettings:(id)a3
{
}

- (HMCameraStreamControl)streamControl
{
  return self->_streamControl;
}

- (void)setStreamControl:(id)a3
{
}

- (NSError)cachedStreamError
{
  return self->_cachedStreamError;
}

- (void)setCachedStreamError:(id)a3
{
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (HMCameraView)cameraView
{
  return self->_cameraView;
}

- (void)setCameraView:(id)a3
{
}

- (UIImageView)placeholderSnapshotView
{
  return self->_placeholderSnapshotView;
}

- (void)setPlaceholderSnapshotView:(id)a3
{
}

- (UIImageView)gradientImageView
{
  return self->_gradientImageView;
}

- (void)setGradientImageView:(id)a3
{
}

- (TVSBVideoBulletinBadgeView)liveBadgeView
{
  return self->_liveBadgeView;
}

- (void)setLiveBadgeView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (UIImageView)symbolImageView
{
  return self->_symbolImageView;
}

- (void)setSymbolImageView:(id)a3
{
}

- (UIImageView)faceImageView
{
  return self->_faceImageView;
}

- (void)setFaceImageView:(id)a3
{
}

- (NSLayoutConstraint)cameraViewWidthConstraint
{
  return self->_cameraViewWidthConstraint;
}

- (void)setCameraViewWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)cameraViewHeightConstraint
{
  return self->_cameraViewHeightConstraint;
}

- (void)setCameraViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)liveBadgeHeightConstraint
{
  return self->_liveBadgeHeightConstraint;
}

- (void)setLiveBadgeHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)liveBadgeBottomConstraint
{
  return self->_liveBadgeBottomConstraint;
}

- (void)setLiveBadgeBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)liveBadgeTrailingConstraint
{
  return self->_liveBadgeTrailingConstraint;
}

- (void)setLiveBadgeTrailingConstraint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
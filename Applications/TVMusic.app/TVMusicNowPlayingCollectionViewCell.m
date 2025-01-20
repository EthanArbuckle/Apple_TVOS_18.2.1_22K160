@interface TVMusicNowPlayingCollectionViewCell
+ (id)_textShadowColor;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)effectOverrides;
- (BOOL)_showsTextFocusStyle;
- (BOOL)canBecomeFocused;
- (BOOL)hideArtwork;
- (BOOL)isDisabled;
- (BOOL)showAttribution;
- (BOOL)showPlaceholder;
- (BOOL)showsFocusEffects;
- (BOOL)showsMetadata;
- (MPArtworkCatalog)artworkCatalog;
- (MPCPlayerResponseParticipant)participant;
- (NSLayoutConstraint)bottomAccessoryCenterXConstraint;
- (NSLayoutConstraint)footerViewTopConstraint;
- (NSLayoutConstraint)headerFirstBaselineConstraint;
- (NSString)artistName;
- (NSString)detailDescription;
- (NSString)songTitle;
- (TVMNowPlayingMotionView)motionView;
- (TVMusicBarsView)bottomAccessoryView;
- (TVMusicNowPlayingCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIImage)placeholderImage;
- (UILabel)explicitIndicatorLabel;
- (UIView)attributionView;
- (UIView)footerView;
- (UIView)overlayView;
- (UIView)videoView;
- (UIViewPropertyAnimator)artistLabelAnimator;
- (_TtC7TVMusic29SharePlayAttributionViewModel)attributionViewModel;
- (_UIStackedImageContainerView)imageView;
- (id)_addSubheadLabelWithFont:(id)a3;
- (int64_t)placeholderType;
- (unint64_t)musicBarStyle;
- (void)_applyShadowStyleToLabel:(id)a3;
- (void)_installMotionEffects;
- (void)_reduceTransparencyStatusDidChange;
- (void)_uninstallMotionEffects;
- (void)_updateAttributionLayout;
- (void)_updateInterfaceForTraitCollection:(id)a3;
- (void)_updateLabelPositionWithAnimationCoordinator:(id)a3;
- (void)_updateStackFocusAnimated:(BOOL)a3 withFocusAnimationCoordinator:(id)a4;
- (void)_updateStackPressedAnimated:(BOOL)a3 withFocusAnimationCoordinator:(id)a4;
- (void)_updateSubtitleLabel;
- (void)_updateSubtitleLabelWithAnimationCoordinator:(id)a3;
- (void)_updateTitleLabel;
- (void)didMoveToWindow;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setArtistLabelAnimator:(id)a3;
- (void)setArtistName:(id)a3;
- (void)setArtworkCatalog:(id)a3;
- (void)setAttributionView:(id)a3;
- (void)setAttributionViewModel:(id)a3;
- (void)setBottomAccessoryCenterXConstraint:(id)a3;
- (void)setBottomAccessoryView:(id)a3;
- (void)setDetailDescription:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setEffectOverrides:(id *)a3;
- (void)setFooterView:(id)a3;
- (void)setFooterViewTopConstraint:(id)a3;
- (void)setHeaderFirstBaselineConstraint:(id)a3;
- (void)setHideArtwork:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImageView:(id)a3;
- (void)setMotionView:(id)a3;
- (void)setMusicBarStyle:(unint64_t)a3;
- (void)setOverlayView:(id)a3;
- (void)setParticipant:(id)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setPlaceholderType:(int64_t)a3;
- (void)setShowAttribution:(BOOL)a3;
- (void)setShowAttribution:(BOOL)a3 animated:(BOOL)a4;
- (void)setShowPlaceholder:(BOOL)a3;
- (void)setShowsMetadata:(BOOL)a3;
- (void)setSongTitle:(id)a3;
- (void)setVideoView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updatePlaceholderImage;
@end

@implementation TVMusicNowPlayingCollectionViewCell

+ (id)_textShadowColor
{
  if (qword_1002BE990 != -1) {
    dispatch_once(&qword_1002BE990, &stru_10026BAE8);
  }
  return (id)qword_1002BE988;
}

- (TVMusicNowPlayingCollectionViewCell)initWithFrame:(CGRect)a3
{
  v140.receiver = self;
  v140.super_class = (Class)&OBJC_CLASS___TVMusicNowPlayingCollectionViewCell;
  v3 = -[TVMusicNowPlayingCollectionViewCell initWithFrame:]( &v140,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[TVMusicNowPlayingCollectionViewCell setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v3->_showPlaceholder = 1;
    id v5 = sub_100030470(5LL, 2uLL);
    uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
    placeholderImage = v3->_placeholderImage;
    v3->_placeholderImage = (UIImage *)v6;

    v8 = objc_alloc(&OBJC_CLASS____UIStackedImageContainerView);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingCollectionViewCell contentView](v3, "contentView"));
    [v9 bounds];
    v10 = -[_UIStackedImageContainerView initWithFrame:](v8, "initWithFrame:");
    imageView = v3->_imageView;
    v3->_imageView = v10;

    -[_UIStackedImageContainerView setAutoresizingMask:](v3->_imageView, "setAutoresizingMask:", 18LL);
    -[_UIStackedImageContainerView setContentMode:](v3->_imageView, "setContentMode:", 2LL);
    -[_UIStackedImageContainerView setInstallsMotionEffectsWhenFocused:]( v3->_imageView,  "setInstallsMotionEffectsWhenFocused:",  0LL);
    -[_UIStackedImageContainerView setStackImage:](v3->_imageView, "setStackImage:", v3->_placeholderImage);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[_UIStackedImageContainerView config](v3->_imageView, "config"));
    [v12 setCornerRadius:12.0];

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingCollectionViewCell contentView](v3, "contentView"));
    [v13 addSubview:v3->_imageView];

    v14 = objc_alloc_init(&OBJC_CLASS___UIView);
    footerView = v3->_footerView;
    v3->_footerView = v14;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( v3->_footerView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingCollectionViewCell contentView](v3, "contentView"));
    [v16 addSubview:v3->_footerView];

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v3->_footerView, "topAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[_UIStackedImageContainerView bottomAnchor](v3->_imageView, "bottomAnchor"));
    uint64_t v19 = objc_claimAutoreleasedReturnValue([v17 constraintEqualToAnchor:v18]);
    footerViewTopConstraint = v3->_footerViewTopConstraint;
    v3->_footerViewTopConstraint = (NSLayoutConstraint *)v19;

    v145[0] = v3->_footerViewTopConstraint;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v3->_footerView, "centerXAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingCollectionViewCell contentView](v3, "contentView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 centerXAnchor]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v21 constraintEqualToAnchor:v23]);
    v145[1] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v3->_footerView, "widthAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingCollectionViewCell contentView](v3, "contentView"));
    v27 = (void *)objc_claimAutoreleasedReturnValue([v26 widthAnchor]);
    v28 = (void *)objc_claimAutoreleasedReturnValue([v25 constraintLessThanOrEqualToAnchor:v27]);
    v145[2] = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v145, 3LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue( +[UIFontDescriptor preferredFontDescriptorWithTextStyle:]( &OBJC_CLASS___UIFontDescriptor,  "preferredFontDescriptorWithTextStyle:",  UIFontTextStyleBody));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v30 fontDescriptorWithSymbolicTraits:2]);

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](&OBJC_CLASS___UIFont, "fontWithDescriptor:size:", v31, 0.0));
    uint64_t v33 = objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingCollectionViewCell _addSubheadLabelWithFont:](v3, "_addSubheadLabelWithFont:", v32));
    songTitleLabel = v3->_songTitleLabel;
    v3->_songTitleLabel = (UILabel *)v33;

    LODWORD(v35) = 1132003328;
    -[UILabel setContentCompressionResistancePriority:forAxis:]( v3->_songTitleLabel,  "setContentCompressionResistancePriority:forAxis:",  0LL,  v35);
    v36 = objc_alloc_init(&OBJC_CLASS___UILabel);
    explicitIndicatorLabel = v3->_explicitIndicatorLabel;
    v3->_explicitIndicatorLabel = v36;

    v38 = v3->_explicitIndicatorLabel;
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](v3->_songTitleLabel, "font"));
    -[UILabel setFont:](v38, "setFont:", v39);

    -[UILabel setHidden:](v3->_explicitIndicatorLabel, "setHidden:", 1LL);
    -[TVMusicNowPlayingCollectionViewCell _applyShadowStyleToLabel:]( v3,  "_applyShadowStyleToLabel:",  v3->_explicitIndicatorLabel);
    v40 = objc_alloc(&OBJC_CLASS___UIStackView);
    v144[0] = v3->_songTitleLabel;
    v144[1] = v3->_explicitIndicatorLabel;
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v144, 2LL));
    v42 = -[UIStackView initWithArrangedSubviews:](v40, "initWithArrangedSubviews:", v41);
    headerStackView = v3->_headerStackView;
    v3->_headerStackView = v42;

    LODWORD(v44) = 1132003328;
    -[UIStackView setContentCompressionResistancePriority:forAxis:]( v3->_headerStackView,  "setContentCompressionResistancePriority:forAxis:",  0LL,  v44);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:]( v3->_headerStackView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIStackView setAxis:](v3->_headerStackView, "setAxis:", 0LL);
    -[UIStackView setAlignment:](v3->_headerStackView, "setAlignment:", 0LL);
    -[UIStackView setDistribution:](v3->_headerStackView, "setDistribution:", 3LL);
    -[UIView addSubview:](v3->_footerView, "addSubview:", v3->_headerStackView);
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView firstBaselineAnchor](v3->_headerStackView, "firstBaselineAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v3->_footerView, "topAnchor"));
    uint64_t v47 = objc_claimAutoreleasedReturnValue([v45 constraintEqualToAnchor:v46 constant:44.0]);
    headerFirstBaselineConstraint = v3->_headerFirstBaselineConstraint;
    v3->_headerFirstBaselineConstraint = (NSLayoutConstraint *)v47;

    v49 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleBody));
    uint64_t v50 = objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingCollectionViewCell _addSubheadLabelWithFont:](v3, "_addSubheadLabelWithFont:", v49));
    artistNameLabel = v3->_artistNameLabel;
    v3->_artistNameLabel = (UILabel *)v50;

    -[UIView addSubview:](v3->_footerView, "addSubview:", v3->_artistNameLabel);
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](v3->_artistNameLabel, "font"));
    uint64_t v53 = objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingCollectionViewCell _addSubheadLabelWithFont:](v3, "_addSubheadLabelWithFont:", v52));
    detailDescriptionLabel = v3->_detailDescriptionLabel;
    v3->_detailDescriptionLabel = (UILabel *)v53;

    -[UILabel setHidden:](v3->_detailDescriptionLabel, "setHidden:", 1LL);
    v55 = v3->_detailDescriptionLabel;
    id v57 = objc_msgSend((id)objc_opt_class(v3, v56), "_textShadowColor");
    v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
    -[UILabel setShadowColor:](v55, "setShadowColor:", v58);

    -[UIView addSubview:](v3->_footerView, "addSubview:", v3->_detailDescriptionLabel);
    v59 = objc_alloc_init(&OBJC_CLASS___UIView);
    bottomAccessoryContainerView = v3->_bottomAccessoryContainerView;
    v3->_bottomAccessoryContainerView = v59;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( v3->_bottomAccessoryContainerView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIView addSubview:](v3->_footerView, "addSubview:", v3->_bottomAccessoryContainerView);
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v3->_bottomAccessoryContainerView, "centerXAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingCollectionViewCell contentView](v3, "contentView"));
    v63 = (void *)objc_claimAutoreleasedReturnValue([v62 centerXAnchor]);
    uint64_t v64 = objc_claimAutoreleasedReturnValue([v61 constraintEqualToAnchor:v63]);
    bottomAccessoryCenterXConstraint = v3->_bottomAccessoryCenterXConstraint;
    v3->_bottomAccessoryCenterXConstraint = (NSLayoutConstraint *)v64;

    v66 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leftAnchor](v3->_headerStackView, "leftAnchor"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[UIView rightAnchor](v3->_bottomAccessoryContainerView, "rightAnchor"));
    v68 = (void *)objc_claimAutoreleasedReturnValue([v66 constraintEqualToAnchor:v67 constant:8.0]);

    LODWORD(v69) = 1132068864;
    [v68 setPriority:v69];
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v3->_bottomAccessoryContainerView, "bottomAnchor"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView firstBaselineAnchor](v3->_headerStackView, "firstBaselineAnchor"));
    v72 = (void *)objc_claimAutoreleasedReturnValue([v70 constraintEqualToAnchor:v71]);
    v143[0] = v72;
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leftAnchor](v3->_bottomAccessoryContainerView, "leftAnchor"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leftAnchor](v3->_footerView, "leftAnchor"));
    v75 = (void *)objc_claimAutoreleasedReturnValue([v73 constraintGreaterThanOrEqualToAnchor:v74]);
    v143[1] = v75;
    v143[2] = v68;
    v138 = v68;
    v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v143, 3LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v76);

    v77 = (void *)objc_claimAutoreleasedReturnValue(-[_UIStackedImageContainerView config](v3->_imageView, "config"));
    [v77 setScaleSizeIncrease:36.0];

    v78 = (void *)objc_claimAutoreleasedReturnValue(-[_UIStackedImageContainerView config](v3->_imageView, "config"));
    [v78 setContinuousCornerRadiusEnabled:1.0];

    v79 = objc_alloc_init(&OBJC_CLASS___UIView);
    overlayView = v3->_overlayView;
    v3->_overlayView = v79;

    v81 = (void *)objc_claimAutoreleasedReturnValue( -[_UIStackedImageContainerView tvm_layeredImageContainerLayer]( v3->_imageView,  "tvm_layeredImageContainerLayer"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v3->_overlayView, "layer"));
    [v81 _setOverlayLayer:v82];

    if (_os_feature_enabled_impl("TVMusic", "Motion_In_Now_Playing"))
    {
      v83 = objc_alloc(&OBJC_CLASS___TVMNowPlayingMotionView);
      -[UIView bounds](v3->_overlayView, "bounds");
      v84 = -[TVMNowPlayingMotionView initWithFrame:](v83, "initWithFrame:");
      motionView = v3->_motionView;
      v3->_motionView = v84;

      -[TVMNowPlayingMotionView setAutoresizingMask:](v3->_motionView, "setAutoresizingMask:", 18LL);
      -[UIView addSubview:](v3->_overlayView, "addSubview:", v3->_motionView);
    }

    v86 = objc_alloc(&OBJC_CLASS___UIView);
    -[UIView bounds](v3->_overlayView, "bounds");
    v87 = -[UIView initWithFrame:](v86, "initWithFrame:");
    videoContainerView = v3->_videoContainerView;
    v3->_videoContainerView = v87;

    -[UIView setAutoresizingMask:](v3->_videoContainerView, "setAutoresizingMask:", 18LL);
    -[UIView setAlpha:](v3->_videoContainerView, "setAlpha:", 0.0);
    v89 = v3->_videoContainerView;
    v90 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    -[UIView setBackgroundColor:](v89, "setBackgroundColor:", v90);

    -[UIView addSubview:](v3->_overlayView, "addSubview:", v3->_videoContainerView);
    v3->_showAttribution = 0;
    v91 = objc_alloc_init(&OBJC_CLASS____TtC7TVMusic29SharePlayAttributionViewModel);
    attributionViewModel = v3->_attributionViewModel;
    v3->_attributionViewModel = v91;

    uint64_t v93 = objc_claimAutoreleasedReturnValue(-[SharePlayAttributionViewModel makeView](v3->_attributionViewModel, "makeView"));
    attributionView = v3->_attributionView;
    v3->_attributionView = (UIView *)v93;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( v3->_attributionView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIView setAlpha:](v3->_attributionView, "setAlpha:", 0.0);
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingCollectionViewCell contentView](v3, "contentView"));
    [v95 addSubview:v3->_attributionView];

    v96 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v3->_attributionView, "centerXAnchor"));
    v97 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingCollectionViewCell contentView](v3, "contentView"));
    v98 = (void *)objc_claimAutoreleasedReturnValue([v97 centerXAnchor]);
    v99 = (void *)objc_claimAutoreleasedReturnValue([v96 constraintEqualToAnchor:v98]);
    v142[0] = v99;
    v100 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v3->_attributionView, "bottomAnchor"));
    v101 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingCollectionViewCell contentView](v3, "contentView"));
    v102 = (void *)objc_claimAutoreleasedReturnValue([v101 topAnchor]);
    v103 = (void *)objc_claimAutoreleasedReturnValue([v100 constraintEqualToAnchor:v102]);
    v142[1] = v103;
    v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v142, 2LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v104);

    v135 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v3->_artistNameLabel, "firstBaselineAnchor"));
    v133 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v3->_bottomAccessoryContainerView, "bottomAnchor"));
    v132 = (void *)objc_claimAutoreleasedReturnValue([v135 constraintGreaterThanOrEqualToAnchor:v133 constant:38.0]);
    v141[0] = v132;
    v131 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v3->_detailDescriptionLabel, "firstBaselineAnchor"));
    v134 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v3->_bottomAccessoryContainerView, "bottomAnchor"));
    v130 = (void *)objc_claimAutoreleasedReturnValue([v131 constraintGreaterThanOrEqualToAnchor:v134 constant:38.0]);
    v141[1] = v130;
    v129 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v3->_artistNameLabel, "firstBaselineAnchor"));
    v128 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView lastBaselineAnchor](v3->_headerStackView, "lastBaselineAnchor"));
    v127 = (void *)objc_claimAutoreleasedReturnValue([v129 constraintGreaterThanOrEqualToAnchor:v128 constant:38.0]);
    v141[2] = v127;
    v126 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v3->_detailDescriptionLabel, "firstBaselineAnchor"));
    v125 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView lastBaselineAnchor](v3->_headerStackView, "lastBaselineAnchor"));
    v124 = (void *)objc_claimAutoreleasedReturnValue([v126 constraintGreaterThanOrEqualToAnchor:v125 constant:38.0]);
    v141[3] = v124;
    v141[4] = v3->_headerFirstBaselineConstraint;
    v136 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerXAnchor](v3->_headerStackView, "centerXAnchor"));
    v123 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v3->_footerView, "centerXAnchor"));
    v122 = (void *)objc_claimAutoreleasedReturnValue([v136 constraintEqualToAnchor:v123]);
    v141[5] = v122;
    v139 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView widthAnchor](v3->_headerStackView, "widthAnchor"));
    v121 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v3->_footerView, "widthAnchor"));
    v120 = (void *)objc_claimAutoreleasedReturnValue([v139 constraintLessThanOrEqualToAnchor:v121]);
    v141[6] = v120;
    v119 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](v3->_artistNameLabel, "centerXAnchor"));
    v118 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v3->_footerView, "centerXAnchor"));
    v117 = (void *)objc_claimAutoreleasedReturnValue([v119 constraintEqualToAnchor:v118]);
    v141[7] = v117;
    v137 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](v3->_artistNameLabel, "widthAnchor"));
    v105 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v3->_footerView, "widthAnchor"));
    v106 = (void *)objc_claimAutoreleasedReturnValue([v137 constraintLessThanOrEqualToAnchor:v105]);
    v141[8] = v106;
    v107 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](v3->_detailDescriptionLabel, "centerXAnchor"));
    v108 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v3->_footerView, "centerXAnchor"));
    v109 = (void *)objc_claimAutoreleasedReturnValue([v107 constraintEqualToAnchor:v108]);
    v141[9] = v109;
    v110 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](v3->_detailDescriptionLabel, "widthAnchor"));
    v111 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v3->_footerView, "widthAnchor"));
    v112 = (void *)objc_claimAutoreleasedReturnValue([v110 constraintLessThanOrEqualToAnchor:v111]);
    v141[10] = v112;
    v113 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v141, 11LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v113);

    v114 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingCollectionViewCell traitCollection](v3, "traitCollection"));
    -[TVMusicNowPlayingCollectionViewCell _updateInterfaceForTraitCollection:]( v3,  "_updateInterfaceForTraitCollection:",  v114);

    v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v115 addObserver:v3 selector:"_reduceTransparencyStatusDidChange" name:UIAccessibilityReduceTransparencyStatusDidChangeNotification object:0];
  }

  return v3;
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVMusicNowPlayingCollectionViewCell;
  -[TVMusicNowPlayingCollectionViewCell prepareForReuse](&v6, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingCollectionViewCell contentView](self, "contentView"));
  [v3 setAlpha:1.0];

  self->_effectOverrides.textFocus = 0LL;
  self->_effectOverrides.highlight = 0LL;
  self->_effectOverrides.focus = 0LL;
  -[TVMusicNowPlayingCollectionViewCell setShowAttribution:](self, "setShowAttribution:", 0LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingCollectionViewCell attributionViewModel](self, "attributionViewModel"));
  [v4 setParticipant:0];

  -[TVMusicNowPlayingCollectionViewCell _updateLabelPositionWithAnimationCoordinator:]( self,  "_updateLabelPositionWithAnimationCoordinator:",  0LL);
  -[TVMusicNowPlayingCollectionViewCell _updateStackFocusAnimated:withFocusAnimationCoordinator:]( self,  "_updateStackFocusAnimated:withFocusAnimationCoordinator:",  0LL,  0LL);
  -[TVMusicNowPlayingCollectionViewCell _updateStackPressedAnimated:withFocusAnimationCoordinator:]( self,  "_updateStackPressedAnimated:withFocusAnimationCoordinator:",  0LL,  0LL);
  -[TVMusicNowPlayingCollectionViewCell _updateTitleLabel](self, "_updateTitleLabel");
  -[TVMusicNowPlayingCollectionViewCell _updateSubtitleLabel](self, "_updateSubtitleLabel");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingCollectionViewCell traitCollection](self, "traitCollection"));
  -[TVMusicNowPlayingCollectionViewCell _updateInterfaceForTraitCollection:]( self,  "_updateInterfaceForTraitCollection:",  v5);
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVMusicNowPlayingCollectionViewCell;
  -[TVMusicNowPlayingCollectionViewCell layoutSubviews](&v8, "layoutSubviews");
  BOOL v3 = -[TVMusicNowPlayingCollectionViewCell _showsTextFocusStyle](self, "_showsTextFocusStyle");
  if (!v3) {
    -[UILabel setLineBreakMode:](self->_songTitleLabel, "setLineBreakMode:", 4LL);
  }
  -[UILabel intrinsicContentSize](self->_songTitleLabel, "intrinsicContentSize");
  double v5 = v4;
  -[UILabel bounds](self->_songTitleLabel, "bounds");
  CGFloat Width = CGRectGetWidth(v9);
  detailDescriptionLabel = self->_detailDescriptionLabel;
  if (v5 <= Width)
  {
    -[UILabel setEnablesMarqueeWhenAncestorFocused:]( detailDescriptionLabel,  "setEnablesMarqueeWhenAncestorFocused:",  1LL);
  }

  else
  {
    -[UILabel setEnablesMarqueeWhenAncestorFocused:]( detailDescriptionLabel,  "setEnablesMarqueeWhenAncestorFocused:",  0LL);
    -[UILabel setLineBreakMode:](self->_detailDescriptionLabel, "setLineBreakMode:", 4LL);
  }

- (BOOL)showsMetadata
{
  return !-[UIView isHidden](self->_footerView, "isHidden");
}

- (void)setShowsMetadata:(BOOL)a3
{
}

- (void)setVideoView:(id)a3
{
  double v5 = (UIView *)a3;
  videoView = self->_videoView;
  v13 = v5;
  if (videoView != v5)
  {
    if (videoView)
    {
      v7 = (UIView *)objc_claimAutoreleasedReturnValue(-[UIView superview](videoView, "superview"));
      videoContainerView = self->_videoContainerView;

      if (v7 == videoContainerView) {
        -[UIView removeFromSuperview](self->_videoView, "removeFromSuperview");
      }
    }

    objc_storeStrong((id *)&self->_videoView, a3);
    CGRect v9 = self->_videoContainerView;
    if (v13)
    {
      -[UIView bounds](v9, "bounds");
      -[UIView setFrame:](v13, "setFrame:");
      -[UIView setAutoresizingMask:](v13, "setAutoresizingMask:", 18LL);
      -[UIView setAlpha:](self->_videoContainerView, "setAlpha:", 1.0);
      v10 = self->_videoContainerView;
LABEL_10:
      -[UIView addSubview:](v10, "addSubview:", v13);
      goto LABEL_13;
    }

- (void)setShowAttribution:(BOOL)a3
{
  if (self->_showAttribution != a3)
  {
    self->_showAttribution = a3;
    if (a3) {
      double v3 = 1.0;
    }
    else {
      double v3 = 0.0;
    }
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingCollectionViewCell attributionView](self, "attributionView"));
    [v4 setAlpha:v3];
  }

- (void)setShowAttribution:(BOOL)a3 animated:(BOOL)a4
{
  if (a4)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_100070634;
    v4[3] = &unk_100268F28;
    v4[4] = self;
    BOOL v5 = a3;
    +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v4, 0.14);
  }

  else
  {
    -[TVMusicNowPlayingCollectionViewCell setShowAttribution:](self, "setShowAttribution:", a3);
  }

- (void)_updateAttributionLayout
{
  unsigned int v3 = -[TVMusicNowPlayingCollectionViewCell showsFocusEffects](self, "showsFocusEffects");
  double v4 = -30.0;
  if (v3) {
    double v4 = -(36.0 * 0.5 + 20.0);
  }
  CGAffineTransformMakeTranslation(&v7, 0.0, v4);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingCollectionViewCell attributionView](self, "attributionView"));
  CGAffineTransform v6 = v7;
  [v5 setTransform:&v6];
}

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingCollectionViewCell traitCollection](self, "traitCollection"));
    -[TVMusicNowPlayingCollectionViewCell _updateInterfaceForTraitCollection:]( self,  "_updateInterfaceForTraitCollection:",  v4);
  }

- (void)setEffectOverrides:(id *)a3
{
  int64_t focus = self->_effectOverrides.focus;
  int64_t textFocus = self->_effectOverrides.textFocus;
  int64_t highlight = self->_effectOverrides.highlight;
  int64_t var2 = a3->var2;
  *(_OWORD *)&self->_effectOverrides.int64_t focus = *(_OWORD *)&a3->var0;
  self->_effectOverrides.int64_t highlight = var2;
  int64_t var0 = a3->var0;
  if (focus != a3->var0)
  {
    -[TVMusicNowPlayingCollectionViewCell _updateLabelPositionWithAnimationCoordinator:]( self,  "_updateLabelPositionWithAnimationCoordinator:",  0LL);
    -[TVMusicNowPlayingCollectionViewCell _updateStackFocusAnimated:withFocusAnimationCoordinator:]( self,  "_updateStackFocusAnimated:withFocusAnimationCoordinator:",  1LL,  0LL);
  }

  int64_t v10 = a3->var2;
  BOOL v12 = focus != var0 || textFocus != a3->var1;
  if (highlight != v10) {
    -[TVMusicNowPlayingCollectionViewCell _updateStackPressedAnimated:withFocusAnimationCoordinator:]( self,  "_updateStackPressedAnimated:withFocusAnimationCoordinator:",  1LL,  0LL);
  }
  if (v12)
  {
    -[TVMusicNowPlayingCollectionViewCell _updateTitleLabel](self, "_updateTitleLabel");
    -[TVMusicNowPlayingCollectionViewCell _updateSubtitleLabel](self, "_updateSubtitleLabel");
    -[TVMusicNowPlayingCollectionViewCell _updateAttributionLayout](self, "_updateAttributionLayout");
    id v13 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingCollectionViewCell traitCollection](self, "traitCollection"));
    -[TVMusicNowPlayingCollectionViewCell _updateInterfaceForTraitCollection:]( self,  "_updateInterfaceForTraitCollection:",  v13);
  }

- (void)_updateStackFocusAnimated:(BOOL)a3 withFocusAnimationCoordinator:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  CGAffineTransform v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingCollectionViewCell imageView](self, "imageView"));
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tvm_layeredImageContainerLayer"));

  unint64_t v9 = (unint64_t)[v8 controlState];
  unsigned int v10 = -[TVMusicNowPlayingCollectionViewCell showsFocusEffects](self, "showsFocusEffects");
  uint64_t v11 = 8LL;
  if (!v10) {
    uint64_t v11 = 0LL;
  }
  unint64_t v12 = v11 | v9 & 0xFFFFFFFFFFFFFFF7LL;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100070918;
  v13[3] = &unk_100268CF0;
  v13[4] = self;
  [v6 addCoordinatedAnimations:v13 completion:0];
  [v8 setControlState:v12 animated:v4 focusAnimationCoordinator:v6];
}

- (void)_updateStackPressedAnimated:(BOOL)a3 withFocusAnimationCoordinator:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  CGAffineTransform v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingCollectionViewCell imageView](self, "imageView"));
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tvm_layeredImageContainerLayer"));

  unint64_t v9 = (unint64_t)[v8 controlState];
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVMusicNowPlayingCollectionViewCell;
  unsigned int v10 = -[TVMusicNowPlayingCollectionViewCell isHighlighted](&v14, "isHighlighted");
  -[TVMusicNowPlayingCollectionViewCell effectOverrides](self, "effectOverrides");
  if (v13 == 2) {
    goto LABEL_7;
  }
  if (v13 != 1)
  {
    if (v13)
    {
      if (v10) {
        goto LABEL_5;
      }
    }

    else
    {
      v12.receiver = self;
      v12.super_class = (Class)&OBJC_CLASS___TVMusicNowPlayingCollectionViewCell;
    }

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVMusicNowPlayingCollectionViewCell;
  -[TVMusicNowPlayingCollectionViewCell didMoveToWindow](&v3, "didMoveToWindow");
  -[UILabel tvm_resetLayerTimingsIfNeeded](self->_songTitleLabel, "tvm_resetLayerTimingsIfNeeded");
  -[UILabel tvm_resetLayerTimingsIfNeeded](self->_artistNameLabel, "tvm_resetLayerTimingsIfNeeded");
  -[UILabel tvm_resetLayerTimingsIfNeeded](self->_detailDescriptionLabel, "tvm_resetLayerTimingsIfNeeded");
}

- (BOOL)showsFocusEffects
{
  if (v4 == 2) {
    return 0;
  }
  if (v4) {
    return 1;
  }
  return -[TVMusicNowPlayingCollectionViewCell tvm_isDescendentFocused]( self,  "tvm_isDescendentFocused");
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVMusicNowPlayingCollectionViewCell;
  id v7 = a3;
  -[TVMusicNowPlayingCollectionViewCell didUpdateFocusInContext:withAnimationCoordinator:]( &v11,  "didUpdateFocusInContext:withAnimationCoordinator:",  v7,  v6);
  -[TVMusicNowPlayingCollectionViewCell _updateTitleLabel](self, "_updateTitleLabel");
  -[TVMusicNowPlayingCollectionViewCell _updateSubtitleLabelWithAnimationCoordinator:]( self,  "_updateSubtitleLabelWithAnimationCoordinator:",  v6);
  -[TVMusicNowPlayingCollectionViewCell _updateLabelPositionWithAnimationCoordinator:]( self,  "_updateLabelPositionWithAnimationCoordinator:",  v6);
  -[TVMusicNowPlayingCollectionViewCell _updateStackFocusAnimated:withFocusAnimationCoordinator:]( self,  "_updateStackFocusAnimated:withFocusAnimationCoordinator:",  1LL,  v6);
  objc_super v8 = (TVMusicNowPlayingCollectionViewCell *)objc_claimAutoreleasedReturnValue([v7 nextFocusedView]);

  if (v8 == self)
  {
    -[TVMusicNowPlayingCollectionViewCell _installMotionEffects](self, "_installMotionEffects");
  }

  else
  {
    -[TVMusicNowPlayingCollectionViewCell _uninstallMotionEffects](self, "_uninstallMotionEffects");
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100070C48;
    v10[3] = &unk_100268CF0;
    v10[4] = self;
    [v6 addCoordinatedAnimations:v10 completion:0];
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100070C84;
  v9[3] = &unk_100268CF0;
  v9[4] = self;
  [v6 addCoordinatedAnimations:v9 completion:0];
}

- (void)_installMotionEffects
{
  if (!self->_stackMotionEffects)
  {
    objc_super v3 = -[UIInterpolatingMotionEffect initWithKeyPath:type:]( objc_alloc(&OBJC_CLASS___UIInterpolatingMotionEffect),  "initWithKeyPath:type:",  @"focusDirectionX",  0LL);
    -[UIInterpolatingMotionEffect setMinimumRelativeValue:](v3, "setMinimumRelativeValue:", &off_1002824B0);
    -[UIInterpolatingMotionEffect setMaximumRelativeValue:](v3, "setMaximumRelativeValue:", &off_1002824C0);
    uint64_t v4 = -[UIInterpolatingMotionEffect initWithKeyPath:type:]( objc_alloc(&OBJC_CLASS___UIInterpolatingMotionEffect),  "initWithKeyPath:type:",  @"focusDirectionY",  1LL);
    -[UIInterpolatingMotionEffect setMinimumRelativeValue:](v4, "setMinimumRelativeValue:", &off_1002824B0);
    -[UIInterpolatingMotionEffect setMaximumRelativeValue:](v4, "setMaximumRelativeValue:", &off_1002824C0);
    BOOL v5 = objc_alloc_init(&OBJC_CLASS___UIMotionEffectGroup);
    stackMotionEffects = self->_stackMotionEffects;
    self->_stackMotionEffects = v5;

    id v7 = self->_stackMotionEffects;
    v10[0] = v3;
    v10[1] = v4;
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));
    -[UIMotionEffectGroup setMotionEffects:](v7, "setMotionEffects:", v8);

    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingCollectionViewCell imageView](self, "imageView"));
    [v9 addMotionEffect:self->_stackMotionEffects];
  }

- (void)_uninstallMotionEffects
{
  if (self->_stackMotionEffects)
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingCollectionViewCell imageView](self, "imageView"));
    [v3 removeMotionEffect:self->_stackMotionEffects];

    stackMotionEffects = self->_stackMotionEffects;
    self->_stackMotionEffects = 0LL;
  }

- (void)_updateLabelPositionWithAnimationCoordinator:(id)a3
{
  id v4 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  void v10[2] = sub_100070F88;
  v10[3] = &unk_100268CF0;
  v10[4] = self;
  BOOL v5 = objc_retainBlock(v10);
  if (v4
    && (id v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication")),
        id v7 = [v6 applicationState],
        v6,
        !v7))
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100071118;
    v8[3] = &unk_100268D60;
    unint64_t v9 = v5;
    [v4 addCoordinatedAnimations:v8 completion:0];
  }

  else
  {
    ((void (*)(void *))v5[2])(v5);
  }
}

- (void)_reduceTransparencyStatusDidChange
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingCollectionViewCell traitCollection](self, "traitCollection"));
  -[TVMusicNowPlayingCollectionViewCell _updateInterfaceForTraitCollection:]( self,  "_updateInterfaceForTraitCollection:",  v3);
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVMusicNowPlayingCollectionViewCell;
  id v4 = a3;
  -[TVMusicNowPlayingCollectionViewCell traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v4);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicNowPlayingCollectionViewCell traitCollection]( self,  "traitCollection",  v9.receiver,  v9.super_class));
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingCollectionViewCell traitCollection](self, "traitCollection"));
    -[TVMusicNowPlayingCollectionViewCell _updateInterfaceForTraitCollection:]( self,  "_updateInterfaceForTraitCollection:",  v8);
  }

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVMusicNowPlayingCollectionViewCell;
  -[TVMusicNowPlayingCollectionViewCell setHighlighted:](&v10, "setHighlighted:");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingCollectionViewCell imageView](self, "imageView"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 config]);

  if (v3) {
    [v6 pressedDuration];
  }
  else {
    [v6 unpressedDuration];
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100071300;
  v9[3] = &unk_100268CF0;
  v9[4] = self;
  objc_super v8 = -[UIViewPropertyAnimator initWithDuration:curve:animations:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:curve:animations:",  2LL,  v9,  v7);
  -[UIViewPropertyAnimator startAnimation](v8, "startAnimation");
}

- (void)setArtworkCatalog:(id)a3
{
  BOOL v5 = (MPArtworkCatalog *)a3;
  if (self->_artworkCatalog != v5)
  {
    objc_storeStrong((id *)&self->_artworkCatalog, a3);
    -[TVMusicNowPlayingCollectionViewCell setShowPlaceholder:](self, "setShowPlaceholder:", 1LL);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingCollectionViewCell placeholderImage](self, "placeholderImage"));
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingCollectionViewCell imageView](self, "imageView"));
    [v7 setStackImage:v6];

    objc_initWeak(&location, self);
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingCollectionViewCell imageView](self, "imageView"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100071470;
    v9[3] = &unk_10026BB10;
    objc_copyWeak(&v10, &location);
    -[MPArtworkCatalog setDestination:configurationBlock:](v5, "setDestination:configurationBlock:", v8, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (MPCPlayerResponseParticipant)participant
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingCollectionViewCell attributionViewModel](self, "attributionViewModel"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 participant]);

  return (MPCPlayerResponseParticipant *)v3;
}

- (void)setParticipant:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingCollectionViewCell attributionViewModel](self, "attributionViewModel"));
  [v5 setParticipant:v4];
}

- (void)setSongTitle:(id)a3
{
  id v6 = a3;
  -[UILabel setText:](self->_songTitleLabel, "setText:", v6);
  if (v6) {
    BOOL v4 = [v6 length] == 0;
  }
  else {
    BOOL v4 = 1LL;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicNowPlayingCollectionViewCell bottomAccessoryCenterXConstraint]( self,  "bottomAccessoryCenterXConstraint"));
  [v5 setActive:v4];
}

- (NSString)songTitle
{
  return -[UILabel text](self->_songTitleLabel, "text");
}

- (void)setArtistName:(id)a3
{
}

- (NSString)artistName
{
  return -[UILabel text](self->_artistNameLabel, "text");
}

- (void)setDetailDescription:(id)a3
{
}

- (NSString)detailDescription
{
  return -[UILabel text](self->_detailDescriptionLabel, "text");
}

- (BOOL)_showsTextFocusStyle
{
  if (v4 == 2) {
    return 0;
  }
  if (v4) {
    return 1;
  }
  return -[TVMusicNowPlayingCollectionViewCell showsFocusEffects](self, "showsFocusEffects");
}

- (void)_updateTitleLabel
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000717A0;
  v2[3] = &unk_100268CF0;
  v2[4] = self;
  +[UIView performWithoutAnimation:](&OBJC_CLASS___UIView, "performWithoutAnimation:", v2);
}

- (void)_updateSubtitleLabel
{
}

- (void)_updateSubtitleLabelWithAnimationCoordinator:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingCollectionViewCell artistLabelAnimator](self, "artistLabelAnimator"));
  unsigned int v6 = [v5 isRunning];

  if (v6)
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingCollectionViewCell artistLabelAnimator](self, "artistLabelAnimator"));
    [v7 stopAnimation:1];

    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingCollectionViewCell artistLabelAnimator](self, "artistLabelAnimator"));
    [v8 finishAnimationAtPosition:2];

    -[TVMusicNowPlayingCollectionViewCell setArtistLabelAnimator:](self, "setArtistLabelAnimator:", 0LL);
  }

  if (v4)
  {
    __int128 v17 = *(_OWORD *)&CGAffineTransformIdentity.c;
    __int128 v29 = *(_OWORD *)&CGAffineTransformIdentity.a;
    __int128 v30 = v17;
    __int128 v31 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    __int128 v26 = v29;
    __int128 v27 = v17;
    __int128 v28 = v31;
    unsigned int v9 = -[TVMusicNowPlayingCollectionViewCell _showsTextFocusStyle](self, "_showsTextFocusStyle");
    -[UILabel setHidden:](self->_artistNameLabel, "setHidden:", 0LL);
    -[UILabel setAlpha:](self->_artistNameLabel, "setAlpha:", 1.0);
    artistNameLabel = self->_artistNameLabel;
    v25[0] = v29;
    v25[1] = v17;
    v25[2] = v31;
    -[UILabel setTransform:](artistNameLabel, "setTransform:", v25);
    -[UILabel setHidden:](self->_detailDescriptionLabel, "setHidden:", 1LL);
    -[UILabel frame](self->_detailDescriptionLabel, "frame");
    double MinX = CGRectGetMinX(v33);
    -[UILabel frame](self->_artistNameLabel, "frame");
    CGFloat v12 = CGRectGetMinX(v34);
    CGAffineTransformMakeTranslation(&v24, MinX - v12, 0.0);
    uint64_t v13 = &v29;
    if (v9) {
      uint64_t v13 = &v26;
    }
    __int128 v14 = *(_OWORD *)&v24.c;
    __int128 *v13 = *(_OWORD *)&v24.a;
    v13[1] = v14;
    v13[2] = *(_OWORD *)&v24.tx;
    v23[0] = v29;
    v23[1] = v30;
    v23[2] = v31;
    -[UILabel setTransform:](self->_artistNameLabel, "setTransform:", v23);
    v15 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
    [v4 _activeAnimationDuration];
    v19[0] = _NSConcreteStackBlock;
    __int128 v20 = v26;
    __int128 v21 = v27;
    v19[1] = 3221225472LL;
    v19[2] = sub_100071B8C;
    v19[3] = &unk_10026BB38;
    v19[4] = self;
    __int128 v22 = v28;
    v16 = -[UIViewPropertyAnimator initWithDuration:curve:animations:]( v15,  "initWithDuration:curve:animations:",  5LL,  v19);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100071BD4;
    v18[3] = &unk_10026BB60;
    v18[4] = self;
    -[UIViewPropertyAnimator addCompletion:](v16, "addCompletion:", v18);
    -[TVMusicNowPlayingCollectionViewCell setArtistLabelAnimator:](self, "setArtistLabelAnimator:", v16);
    -[UIViewPropertyAnimator startAnimation](v16, "startAnimation");
  }

  else
  {
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_100071ADC;
    v32[3] = &unk_100268CF0;
    v32[4] = self;
    +[UIView performWithoutAnimation:](&OBJC_CLASS___UIView, "performWithoutAnimation:", v32);
  }
}

- (void)setBottomAccessoryView:(id)a3
{
  id v5 = (TVMusicBarsView *)a3;
  bottomAccessoryView = self->_bottomAccessoryView;
  if (bottomAccessoryView != v5)
  {
    if (bottomAccessoryView)
    {
      double v7 = (UIView *)objc_claimAutoreleasedReturnValue(-[TVMusicBarsView superview](bottomAccessoryView, "superview"));
      bottomAccessoryContainerView = self->_bottomAccessoryContainerView;

      if (v7 == bottomAccessoryContainerView) {
        -[TVMusicBarsView removeFromSuperview](self->_bottomAccessoryView, "removeFromSuperview");
      }
    }

    objc_storeStrong((id *)&self->_bottomAccessoryView, a3);
  }

  if (v5)
  {
    unsigned int v9 = (UIView *)objc_claimAutoreleasedReturnValue(-[TVMusicBarsView superview](v5, "superview"));
    id v10 = self->_bottomAccessoryContainerView;

    if (v9 != v10)
    {
      -[TVMusicBarsView setTranslatesAutoresizingMaskIntoConstraints:]( v5,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
      -[TVMusicBarsView setMusicBarsStyle:]( v5,  "setMusicBarsStyle:",  -[TVMusicNowPlayingCollectionViewCell musicBarStyle](self, "musicBarStyle"));
      -[UIView addSubview:](self->_bottomAccessoryContainerView, "addSubview:", v5);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicBarsView bottomAnchor](v5, "bottomAnchor"));
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_bottomAccessoryContainerView, "bottomAnchor"));
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v23 constraintEqualToAnchor:v22]);
      v25[0] = v21;
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicBarsView leftAnchor](v5, "leftAnchor"));
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leftAnchor](self->_bottomAccessoryContainerView, "leftAnchor"));
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v20 constraintGreaterThanOrEqualToAnchor:v19]);
      v25[1] = v11;
      CGFloat v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicBarsView rightAnchor](v5, "rightAnchor"));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView rightAnchor](self->_bottomAccessoryContainerView, "rightAnchor"));
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v12 constraintEqualToAnchor:v13]);
      v25[2] = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicBarsView topAnchor](v5, "topAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_bottomAccessoryContainerView, "topAnchor"));
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v15 constraintGreaterThanOrEqualToAnchor:v16]);
      _OWORD v25[3] = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 4LL));
      +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v18);

      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_100072060;
      v24[3] = &unk_100268CF0;
      v24[4] = self;
      +[UIView performWithoutAnimation:](&OBJC_CLASS___UIView, "performWithoutAnimation:", v24);
    }
  }
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)setPlaceholderType:(int64_t)a3
{
  self->_placeholderType = a3;
  -[TVMusicNowPlayingCollectionViewCell updatePlaceholderImage](self, "updatePlaceholderImage");
}

- (void)updatePlaceholderImage
{
  id v3 = sub_100030470(-[TVMusicNowPlayingCollectionViewCell placeholderType](self, "placeholderType"), 2uLL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[TVMusicNowPlayingCollectionViewCell setPlaceholderImage:](self, "setPlaceholderImage:", v4);

  if (-[TVMusicNowPlayingCollectionViewCell showPlaceholder](self, "showPlaceholder"))
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingCollectionViewCell placeholderImage](self, "placeholderImage"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicNowPlayingCollectionViewCell imageView](self, "imageView"));
    [v5 setStackImage:v6];
  }

- (void)setHideArtwork:(BOOL)a3
{
}

- (BOOL)hideArtwork
{
  return -[_UIStackedImageContainerView isHidden](self->_imageView, "isHidden");
}

- (void)_updateInterfaceForTraitCollection:(id)a3
{
  if ([a3 userInterfaceStyle] == (id)2 || UIAccessibilityDarkerSystemColorsEnabled())
  {
    id v4 = 0LL;
    int v5 = 1;
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", kCAFilterPlusD));
    int v5 = 0;
  }

  if (!UIAccessibilityIsReduceTransparencyEnabled())
  {
    BOOL v6 = UIAccessibilityDarkerSystemColorsEnabled();
    if (!-[TVMusicNowPlayingCollectionViewCell isDisabled](self, "isDisabled")) {
      goto LABEL_11;
    }
    if (!v6)
    {
      double v7 = 0.2;
      double v8 = 0.2;
      goto LABEL_27;
    }

- (id)_addSubheadLabelWithFont:(id)a3
{
  id v4 = a3;
  int v5 = objc_opt_new(&OBJC_CLASS___UILabel);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  -[UILabel setFont:](v5, "setFont:", v4);

  -[UILabel setLineBreakMode:](v5, "setLineBreakMode:", 4LL);
  -[TVMusicNowPlayingCollectionViewCell _applyShadowStyleToLabel:](self, "_applyShadowStyleToLabel:", v5);
  return v5;
}

- (void)_applyShadowStyleToLabel:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "setShadowOffset:", 0.0, 4.0);
  [v3 setShadowBlur:4.0];
}

- (int64_t)placeholderType
{
  return self->_placeholderType;
}

- (MPArtworkCatalog)artworkCatalog
{
  return self->_artworkCatalog;
}

- (TVMNowPlayingMotionView)motionView
{
  return self->_motionView;
}

- (void)setMotionView:(id)a3
{
}

- (BOOL)showAttribution
{
  return self->_showAttribution;
}

- (UILabel)explicitIndicatorLabel
{
  return self->_explicitIndicatorLabel;
}

- (TVMusicBarsView)bottomAccessoryView
{
  return self->_bottomAccessoryView;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)effectOverrides
{
  *($D81D7FE547575CFAE634FB63009C8BA0 *)retstr = *($D81D7FE547575CFAE634FB63009C8BA0 *)((char *)self + 208);
  return self;
}

- (UIView)videoView
{
  return self->_videoView;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (unint64_t)musicBarStyle
{
  return self->_musicBarStyle;
}

- (void)setMusicBarStyle:(unint64_t)a3
{
  self->_musicBarStyle = a3;
}

- (_UIStackedImageContainerView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (void)setPlaceholderImage:(id)a3
{
}

- (BOOL)showPlaceholder
{
  return self->_showPlaceholder;
}

- (void)setShowPlaceholder:(BOOL)a3
{
  self->_showPlaceholder = a3;
}

- (UIView)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
}

- (NSLayoutConstraint)bottomAccessoryCenterXConstraint
{
  return self->_bottomAccessoryCenterXConstraint;
}

- (void)setBottomAccessoryCenterXConstraint:(id)a3
{
}

- (NSLayoutConstraint)footerViewTopConstraint
{
  return self->_footerViewTopConstraint;
}

- (void)setFooterViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)headerFirstBaselineConstraint
{
  return self->_headerFirstBaselineConstraint;
}

- (void)setHeaderFirstBaselineConstraint:(id)a3
{
}

- (UIViewPropertyAnimator)artistLabelAnimator
{
  return self->_artistLabelAnimator;
}

- (void)setArtistLabelAnimator:(id)a3
{
}

- (_TtC7TVMusic29SharePlayAttributionViewModel)attributionViewModel
{
  return self->_attributionViewModel;
}

- (void)setAttributionViewModel:(id)a3
{
}

- (UIView)attributionView
{
  return self->_attributionView;
}

- (void)setAttributionView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
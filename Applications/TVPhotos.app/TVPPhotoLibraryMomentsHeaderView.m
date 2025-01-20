@interface TVPPhotoLibraryMomentsHeaderView
- (BOOL)_hasSubtitle;
- (BOOL)_isLabel:(id)a3 aboveFocusedRect:(CGRect)a4;
- (BOOL)canBecomeFocused;
- (CGRect)_effectiveFocusedRect;
- (CGRect)focusedRect;
- (NSLayoutConstraint)dateBottomConstraint;
- (NSLayoutConstraint)subtitleBottomConstraint;
- (NSLayoutConstraint)titleBottomConstraint;
- (NSString)momentDate;
- (NSString)momentSubtitle;
- (NSString)momentTitle;
- (TVPPhotoLibraryMomentsHeaderView)initWithFrame:(CGRect)a3;
- (UILabel)dateLabel;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (double)focusedMargin;
- (void)applyLayoutAttributes:(id)a3;
- (void)prepareForReuse;
- (void)setDateBottomConstraint:(id)a3;
- (void)setDateLabel:(id)a3;
- (void)setFocusedMargin:(double)a3;
- (void)setFocusedRect:(CGRect)a3;
- (void)setMomentDate:(id)a3;
- (void)setMomentSubtitle:(id)a3;
- (void)setMomentTitle:(id)a3;
- (void)setSubtitleBottomConstraint:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleBottomConstraint:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation TVPPhotoLibraryMomentsHeaderView

- (BOOL)canBecomeFocused
{
  return 0;
}

- (TVPPhotoLibraryMomentsHeaderView)initWithFrame:(CGRect)a3
{
  v110.receiver = self;
  v110.super_class = (Class)&OBJC_CLASS___TVPPhotoLibraryMomentsHeaderView;
  v3 = -[TVPPhotoLibraryMomentsHeaderView initWithFrame:]( &v110,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryMomentsHeaderView layer](v3, "layer"));
    [v5 setZPosition:10000000.0];

    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"InternalFocusHeaders", @"com.apple.TVPhotos", 0LL);
    v109 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 4LL));
    v108 = (void *)objc_claimAutoreleasedReturnValue(+[UIVibrancyEffect effectForBlurEffect:](&OBJC_CLASS___UIVibrancyEffect, "effectForBlurEffect:"));
    v7 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", v108);
    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:]( v7,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    if (AppBooleanValue)
    {
      id v8 = objc_alloc_init(&OBJC_CLASS___PXUIFloatingContentView);
      [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 layer]);
      [v9 setMasksToBounds:0];

      [v8 setClipsToBounds:0];
      [v8 setClipsContentToBounds:0];
      objc_msgSend(v8, "setContentMotionRotation:translation:", 0.0, 0.03, 0.0, 10.0);
      -[TVPPhotoLibraryMomentsHeaderView addSubview:](v4, "addSubview:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue([v8 leadingAnchor]);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryMomentsHeaderView leadingAnchor](v4, "leadingAnchor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v10 constraintEqualToAnchor:v11 constant:-10.0]);
      [v12 setActive:1];

      v13 = (void *)objc_claimAutoreleasedReturnValue([v8 trailingAnchor]);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryMomentsHeaderView trailingAnchor](v4, "trailingAnchor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue([v13 constraintEqualToAnchor:v14 constant:10.0]);
      [v15 setActive:1];

      v16 = (void *)objc_claimAutoreleasedReturnValue([v8 topAnchor]);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryMomentsHeaderView topAnchor](v4, "topAnchor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue([v16 constraintEqualToAnchor:v17 constant:20.0]);
      [v18 setActive:1];

      v19 = (void *)objc_claimAutoreleasedReturnValue([v8 bottomAnchor]);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryMomentsHeaderView bottomAnchor](v4, "bottomAnchor"));
      v21 = (void *)objc_claimAutoreleasedReturnValue([v19 constraintEqualToAnchor:v20 constant:-10.0]);
      [v21 setActive:1];

      v22 = (void *)objc_claimAutoreleasedReturnValue([v8 contentView]);
      [v22 addSubview:v7];

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView leadingAnchor](v7, "leadingAnchor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue([v8 contentView]);
      v25 = (void *)objc_claimAutoreleasedReturnValue([v24 leadingAnchor]);
      v26 = (void *)objc_claimAutoreleasedReturnValue([v23 constraintEqualToAnchor:v25 constant:10.0]);
      [v26 setActive:1];

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView trailingAnchor](v7, "trailingAnchor"));
      v28 = (void *)objc_claimAutoreleasedReturnValue([v8 contentView]);
      v29 = (void *)objc_claimAutoreleasedReturnValue([v28 trailingAnchor]);
      v30 = (void *)objc_claimAutoreleasedReturnValue([v27 constraintEqualToAnchor:v29 constant:-10.0]);
      [v30 setActive:1];

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView topAnchor](v7, "topAnchor"));
      v32 = (void *)objc_claimAutoreleasedReturnValue([v8 contentView]);
      v33 = (void *)objc_claimAutoreleasedReturnValue([v32 topAnchor]);
      v34 = (void *)objc_claimAutoreleasedReturnValue([v31 constraintEqualToAnchor:v33 constant:-20.0]);
      [v34 setActive:1];

      v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView bottomAnchor](v7, "bottomAnchor"));
      v36 = (void *)objc_claimAutoreleasedReturnValue([v8 contentView]);
      v37 = (void *)objc_claimAutoreleasedReturnValue([v36 bottomAnchor]);
      v38 = (void *)objc_claimAutoreleasedReturnValue([v35 constraintEqualToAnchor:v37 constant:10.0]);
      [v38 setActive:1];
    }

    else
    {
      -[TVPPhotoLibraryMomentsHeaderView addSubview:](v4, "addSubview:", v7);
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView leadingAnchor](v7, "leadingAnchor"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryMomentsHeaderView leadingAnchor](v4, "leadingAnchor"));
      v41 = (void *)objc_claimAutoreleasedReturnValue([v39 constraintEqualToAnchor:v40]);
      [v41 setActive:1];

      v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView trailingAnchor](v7, "trailingAnchor"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryMomentsHeaderView trailingAnchor](v4, "trailingAnchor"));
      v44 = (void *)objc_claimAutoreleasedReturnValue([v42 constraintEqualToAnchor:v43]);
      [v44 setActive:1];

      v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView topAnchor](v7, "topAnchor"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryMomentsHeaderView topAnchor](v4, "topAnchor"));
      v47 = (void *)objc_claimAutoreleasedReturnValue([v45 constraintEqualToAnchor:v46]);
      [v47 setActive:1];

      id v8 = (id)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView bottomAnchor](v7, "bottomAnchor"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryMomentsHeaderView bottomAnchor](v4, "bottomAnchor"));
      v36 = (void *)objc_claimAutoreleasedReturnValue([v8 constraintEqualToAnchor:v35]);
      [v36 setActive:1];
    }

    v48 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v48;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v4->_titleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v50 = v4->_titleLabel;
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager headlineFont](&OBJC_CLASS___TVPThemeManager, "headlineFont"));
    -[UILabel setFont:](v50, "setFont:", v51);

    -[UILabel setLineBreakMode:](v4->_titleLabel, "setLineBreakMode:", 4LL);
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v7, "contentView"));
    [v52 addSubview:v4->_titleLabel];

    v53 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v4->_titleLabel, "firstBaselineAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v7, "contentView"));
    v55 = (void *)objc_claimAutoreleasedReturnValue([v54 topAnchor]);
    v56 = (void *)objc_claimAutoreleasedReturnValue([v53 constraintEqualToAnchor:v55 constant:64.0]);

    LODWORD(v57) = 1132068864;
    [v56 setPriority:v57];
    [v56 setActive:1];
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_titleLabel, "leadingAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v7, "contentView"));
    v60 = (void *)objc_claimAutoreleasedReturnValue([v59 leadingAnchor]);
    v61 = (void *)objc_claimAutoreleasedReturnValue([v58 constraintEqualToAnchor:v60]);

    [v61 setActive:1];
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v4->_titleLabel, "firstBaselineAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v7, "contentView"));
    v64 = (void *)objc_claimAutoreleasedReturnValue([v63 bottomAnchor]);
    v65 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v62 constraintEqualToAnchor:v64 constant:-22.0]);

    titleBottomConstraint = v4->_titleBottomConstraint;
    v4->_titleBottomConstraint = v65;
    v67 = v65;

    v68 = objc_alloc_init(&OBJC_CLASS___UILabel);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v68;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v4->_subtitleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v70 = v4->_subtitleLabel;
    v71 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager calloutFont](&OBJC_CLASS___TVPThemeManager, "calloutFont"));
    -[UILabel setFont:](v70, "setFont:", v71);

    -[UILabel setLineBreakMode:](v4->_subtitleLabel, "setLineBreakMode:", 4LL);
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v7, "contentView"));
    [v72 addSubview:v4->_subtitleLabel];

    v73 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_subtitleLabel, "leadingAnchor"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v7, "contentView"));
    v75 = (void *)objc_claimAutoreleasedReturnValue([v74 leadingAnchor]);
    v76 = (void *)objc_claimAutoreleasedReturnValue([v73 constraintEqualToAnchor:v75]);

    [v76 setActive:1];
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v4->_subtitleLabel, "topAnchor"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v4->_titleLabel, "firstBaselineAnchor"));
    v79 = (void *)objc_claimAutoreleasedReturnValue([v77 constraintEqualToAnchor:v78 constant:6.0]);

    [v79 setActive:1];
    v80 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v4->_subtitleLabel, "firstBaselineAnchor"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v7, "contentView"));
    v82 = (void *)objc_claimAutoreleasedReturnValue([v81 bottomAnchor]);
    v83 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v80 constraintEqualToAnchor:v82 constant:-22.0]);

    -[NSLayoutConstraint setActive:](v83, "setActive:", 1LL);
    subtitleBottomConstraint = v4->_subtitleBottomConstraint;
    v4->_subtitleBottomConstraint = v83;
    v85 = v83;

    v86 = objc_alloc_init(&OBJC_CLASS___UILabel);
    dateLabel = v4->_dateLabel;
    v4->_dateLabel = v86;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v4->_dateLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v88 = v4->_dateLabel;
    v89 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager calloutFont](&OBJC_CLASS___TVPThemeManager, "calloutFont"));
    -[UILabel setFont:](v88, "setFont:", v89);

    -[UILabel setLineBreakMode:](v4->_dateLabel, "setLineBreakMode:", 4LL);
    LODWORD(v90) = 1144766464;
    -[UILabel setContentCompressionResistancePriority:forAxis:]( v4->_dateLabel,  "setContentCompressionResistancePriority:forAxis:",  0LL,  v90);
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v7, "contentView"));
    [v91 addSubview:v4->_dateLabel];

    v92 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_dateLabel, "leadingAnchor"));
    v93 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_titleLabel, "trailingAnchor"));

    v94 = (void *)objc_claimAutoreleasedReturnValue([v92 constraintGreaterThanOrEqualToAnchor:v93 constant:80.0]);
    [v94 setActive:1];
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_dateLabel, "leadingAnchor"));
    v96 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_subtitleLabel, "trailingAnchor"));
    v97 = (void *)objc_claimAutoreleasedReturnValue([v95 constraintGreaterThanOrEqualToAnchor:v96 constant:80.0]);

    [v97 setActive:1];
    v98 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_dateLabel, "trailingAnchor"));
    v99 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v7, "contentView"));
    v100 = (void *)objc_claimAutoreleasedReturnValue([v99 trailingAnchor]);
    v101 = (void *)objc_claimAutoreleasedReturnValue([v98 constraintEqualToAnchor:v100]);

    [v101 setActive:1];
    v102 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v4->_dateLabel, "firstBaselineAnchor"));
    v103 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](v7, "contentView"));
    v104 = (void *)objc_claimAutoreleasedReturnValue([v103 bottomAnchor]);
    v105 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v102 constraintEqualToAnchor:v104 constant:-22.0]);

    -[NSLayoutConstraint setActive:](v105, "setActive:", 1LL);
    dateBottomConstraint = v4->_dateBottomConstraint;
    v4->_dateBottomConstraint = v105;
  }

  return v4;
}

- (CGRect)_effectiveFocusedRect
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryMomentsHeaderView superview](self, "superview"));
  -[TVPPhotoLibraryMomentsHeaderView focusedRect](self, "focusedRect");
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  if (v3)
  {
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___UICollectionView, v4);
    if ((objc_opt_isKindOfClass(v3, v13) & 1) != 0
      && [v3 effectiveUserInterfaceLayoutDirection] == (id)1)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v3 collectionViewLayout]);
      unsigned int v15 = [v14 _wantsRightToLeftHorizontalMirroringIfNeeded];

      if (v15)
      {
        [v3 contentSize];
        double v6 = v16 - v6 - v10;
      }
    }
  }

  double v17 = v6;
  double v18 = v8;
  double v19 = v10;
  double v20 = v12;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (NSString)momentTitle
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setMomentTitle:(id)a3
{
  if (!-[TVPPhotoLibraryMomentsHeaderView _hasSubtitle](self, "_hasSubtitle"))
  {
    titleLabel = self->_titleLabel;
    -[TVPPhotoLibraryMomentsHeaderView _effectiveFocusedRect](self, "_effectiveFocusedRect");
    unsigned int v5 = -[TVPPhotoLibraryMomentsHeaderView _isLabel:aboveFocusedRect:](self, "_isLabel:aboveFocusedRect:", titleLabel);
    titleBottomConstraint = self->_titleBottomConstraint;
    if (v5)
    {
      -[TVPPhotoLibraryMomentsHeaderView focusedMargin](self, "focusedMargin");
      -[NSLayoutConstraint setConstant:](titleBottomConstraint, "setConstant:", -v7);
      subtitleBottomConstraint = self->_subtitleBottomConstraint;
      -[TVPPhotoLibraryMomentsHeaderView focusedMargin](self, "focusedMargin");
      double v10 = -v9;
      double v11 = subtitleBottomConstraint;
    }

    else
    {
      -[NSLayoutConstraint setConstant:](self->_titleBottomConstraint, "setConstant:", -22.0);
      double v11 = self->_subtitleBottomConstraint;
      double v10 = -22.0;
    }

    -[NSLayoutConstraint setConstant:](v11, "setConstant:", v10);
  }

- (NSString)momentSubtitle
{
  return -[UILabel text](self->_subtitleLabel, "text");
}

- (void)setMomentSubtitle:(id)a3
{
  p_subtitleLabel = &self->_subtitleLabel;
  -[UILabel setText:](self->_subtitleLabel, "setText:", a3);
  if (-[TVPPhotoLibraryMomentsHeaderView _hasSubtitle](self, "_hasSubtitle"))
  {
    -[NSLayoutConstraint setActive:](self->_titleBottomConstraint, "setActive:", 0LL);
    int v5 = 5;
  }

  else
  {
    -[NSLayoutConstraint setActive:](self->_subtitleBottomConstraint, "setActive:", 0LL);
    int v5 = 4;
  }

  -[objc_class setActive:]((&self->super.super.super.super.isa)[v5], "setActive:", 1LL);
  if (!-[TVPPhotoLibraryMomentsHeaderView _hasSubtitle](self, "_hasSubtitle")) {
    p_subtitleLabel = &self->_titleLabel;
  }
  uint64_t v13 = *p_subtitleLabel;
  -[TVPPhotoLibraryMomentsHeaderView _effectiveFocusedRect](self, "_effectiveFocusedRect");
  unsigned int v6 = -[TVPPhotoLibraryMomentsHeaderView _isLabel:aboveFocusedRect:](self, "_isLabel:aboveFocusedRect:", v13);
  titleBottomConstraint = self->_titleBottomConstraint;
  if (v6)
  {
    -[TVPPhotoLibraryMomentsHeaderView focusedMargin](self, "focusedMargin");
    -[NSLayoutConstraint setConstant:](titleBottomConstraint, "setConstant:", -v8);
    subtitleBottomConstraint = self->_subtitleBottomConstraint;
    -[TVPPhotoLibraryMomentsHeaderView focusedMargin](self, "focusedMargin");
    double v11 = -v10;
    double v12 = subtitleBottomConstraint;
  }

  else
  {
    -[NSLayoutConstraint setConstant:](self->_titleBottomConstraint, "setConstant:", -22.0);
    double v12 = self->_subtitleBottomConstraint;
    double v11 = -22.0;
  }

  -[NSLayoutConstraint setConstant:](v12, "setConstant:", v11);
}

- (NSString)momentDate
{
  return -[UILabel text](self->_dateLabel, "text");
}

- (void)setMomentDate:(id)a3
{
  dateLabel = self->_dateLabel;
  -[TVPPhotoLibraryMomentsHeaderView _effectiveFocusedRect](self, "_effectiveFocusedRect");
  unsigned int v5 = -[TVPPhotoLibraryMomentsHeaderView _isLabel:aboveFocusedRect:](self, "_isLabel:aboveFocusedRect:", dateLabel);
  dateBottomConstraint = self->_dateBottomConstraint;
  double v7 = -22.0;
  if (v5)
  {
    -[TVPPhotoLibraryMomentsHeaderView focusedMargin](self, "focusedMargin", -22.0);
    double v7 = -v8;
  }

  -[NSLayoutConstraint setConstant:](dateBottomConstraint, "setConstant:", v7);
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVPPhotoLibraryMomentsHeaderView;
  -[TVPPhotoLibraryMomentsHeaderView prepareForReuse](&v3, "prepareForReuse");
  -[UILabel setText:](self->_titleLabel, "setText:", 0LL);
  -[UILabel setText:](self->_subtitleLabel, "setText:", 0LL);
  -[UILabel setText:](self->_dateLabel, "setText:", 0LL);
  -[NSLayoutConstraint setConstant:](self->_titleBottomConstraint, "setConstant:", -22.0);
  -[NSLayoutConstraint setConstant:](self->_subtitleBottomConstraint, "setConstant:", -22.0);
  -[NSLayoutConstraint setConstant:](self->_dateBottomConstraint, "setConstant:", -22.0);
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___TVPPhotoLibraryMomentsHeaderView;
  -[TVPPhotoLibraryMomentsHeaderView applyLayoutAttributes:](&v35, "applyLayoutAttributes:", v4);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___TVPCollectionViewLayoutAttributes, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = v4;
    id v8 = [v7 focusAnimationOptions];
    [v7 focusingAnimationDuration];
    double v10 = v9;
    [v7 unfocusingAnimationDuration];
    double v12 = v11;
    [v7 focusedItemFrame];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    [v7 focusedEdgeInsets];
    self->_focusedRect.origin.x = v14 + v21;
    self->_focusedRect.origin.y = v16 + v22;
    self->_focusedRect.size.width = v18 - (v21 + v23);
    self->_focusedRect.size.height = v20 - (v22 + v24);
    self->_focusedMargin = 16.0 - v22;
    -[TVPPhotoLibraryMomentsHeaderView layoutIfNeeded](self, "layoutIfNeeded");
    unsigned int v25 = -[TVPPhotoLibraryMomentsHeaderView _hasSubtitle](self, "_hasSubtitle");
    v26 = &OBJC_IVAR___TVPPhotoLibraryMomentsHeaderView__titleLabel;
    if (v25) {
      v26 = &OBJC_IVAR___TVPPhotoLibraryMomentsHeaderView__subtitleLabel;
    }
    id v27 = *(id *)((char *)&self->super.super.super.super.isa + *v26);
    -[TVPPhotoLibraryMomentsHeaderView _effectiveFocusedRect](self, "_effectiveFocusedRect");
    if (-[TVPPhotoLibraryMomentsHeaderView _isLabel:aboveFocusedRect:](self, "_isLabel:aboveFocusedRect:", v27))
    {
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = sub_1000210D4;
      v34[3] = &unk_1000C9528;
      v34[4] = self;
      +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  v8,  v34,  0LL,  v10,  0.0);
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_100021134;
      v33[3] = &unk_1000C9528;
      v33[4] = self;
      v28 = v33;
    }

    else
    {
      dateLabel = self->_dateLabel;
      -[TVPPhotoLibraryMomentsHeaderView _effectiveFocusedRect](self, "_effectiveFocusedRect");
      if (-[TVPPhotoLibraryMomentsHeaderView _isLabel:aboveFocusedRect:](self, "_isLabel:aboveFocusedRect:", dateLabel))
      {
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472LL;
        v32[2] = sub_10002116C;
        v32[3] = &unk_1000C9528;
        v32[4] = self;
        +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  v8,  v32,  0LL,  v10,  0.0);
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472LL;
        v31[2] = sub_1000211AC;
        v31[3] = &unk_1000C9528;
        v31[4] = self;
        v28 = v31;
      }

      else
      {
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472LL;
        v30[2] = sub_1000211FC;
        v30[3] = &unk_1000C9528;
        v30[4] = self;
        v28 = v30;
      }
    }

    +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  v8,  v28,  0LL,  v12,  0.0);
  }
}

- (BOOL)_hasSubtitle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_subtitleLabel, "text"));
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (BOOL)_isLabel:(id)a3 aboveFocusedRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v9 = a3;
  -[TVPPhotoLibraryMomentsHeaderView layoutIfNeeded](self, "layoutIfNeeded");
  [v9 bounds];
  -[TVPPhotoLibraryMomentsHeaderView convertRect:fromView:](self, "convertRect:fromView:", v9);
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  if (CGRectIsEmpty(v24)) {
    return 0;
  }
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  CGFloat rect = height;
  v25.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v25);
  v26.origin.CGFloat x = v11;
  v26.origin.CGFloat y = v13;
  v26.size.CGFloat width = v15;
  v26.size.CGFloat height = v17;
  if (MinX >= CGRectGetMaxX(v26)) {
    return 0;
  }
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = rect;
  double MaxX = CGRectGetMaxX(v27);
  v28.origin.CGFloat x = v11;
  v28.origin.CGFloat y = v13;
  v28.size.CGFloat width = v15;
  v28.size.CGFloat height = v17;
  if (MaxX <= CGRectGetMinX(v28)) {
    return 0;
  }
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = rect;
  double MinY = CGRectGetMinY(v29);
  -[TVPPhotoLibraryMomentsHeaderView frame](self, "frame");
  if (MinY > CGRectGetMaxY(v30)) {
    return 0;
  }
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = rect;
  double MaxY = CGRectGetMaxY(v31);
  -[TVPPhotoLibraryMomentsHeaderView frame](self, "frame");
  return MaxY > CGRectGetMaxY(v32);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UILabel)dateLabel
{
  return self->_dateLabel;
}

- (void)setDateLabel:(id)a3
{
}

- (NSLayoutConstraint)titleBottomConstraint
{
  return self->_titleBottomConstraint;
}

- (void)setTitleBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)subtitleBottomConstraint
{
  return self->_subtitleBottomConstraint;
}

- (void)setSubtitleBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)dateBottomConstraint
{
  return self->_dateBottomConstraint;
}

- (void)setDateBottomConstraint:(id)a3
{
}

- (CGRect)focusedRect
{
  double x = self->_focusedRect.origin.x;
  double y = self->_focusedRect.origin.y;
  double width = self->_focusedRect.size.width;
  double height = self->_focusedRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFocusedRect:(CGRect)a3
{
  self->_focusedRect = a3;
}

- (double)focusedMargin
{
  return self->_focusedMargin;
}

- (void)setFocusedMargin:(double)a3
{
  self->_focusedMargin = a3;
}

- (void).cxx_destruct
{
}

@end
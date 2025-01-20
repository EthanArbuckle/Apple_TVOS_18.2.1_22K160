@interface SRDisambiguationCell
+ (double)defaultHeight;
+ (double)defaultHeightWithHeading;
+ (double)defaultHeightWithImageView;
+ (double)defaultHeightWithSubtitle;
- (BOOL)constraintsCreated;
- (BOOL)hasStarColumn;
- (BOOL)isLastRow;
- (NSLayoutConstraint)extraTitleBaselineConstraint;
- (NSLayoutConstraint)imageLeadingOffsetConstraint;
- (NSLayoutConstraint)secondaryTitleBaselineConstraint;
- (NSLayoutConstraint)titleBaselineConstraint;
- (NSLayoutConstraint)titleLeadingOffsetConstraint;
- (SRDisambiguationCell)initWithFrame:(CGRect)a3;
- (SiriSharedUIContentLabel)extraDisambiguationLabel;
- (SiriSharedUIContentLabel)extraDisambiguationSubTextLabel;
- (SiriSharedUIContentLabel)secondaryTitleLabel;
- (SiriSharedUIContentLabel)titleLabel;
- (SiriUIDisambiguationItem)item;
- (UIImageView)imageView;
- (UIImageView)starView;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setConstraintsCreated:(BOOL)a3;
- (void)setExtraDisambiguationLabel:(id)a3;
- (void)setExtraDisambiguationSubTextLabel:(id)a3;
- (void)setExtraTitleBaselineConstraint:(id)a3;
- (void)setHasStarColumn:(BOOL)a3;
- (void)setImageLeadingOffsetConstraint:(id)a3;
- (void)setImageView:(id)a3;
- (void)setItem:(id)a3;
- (void)setLastRow:(BOOL)a3;
- (void)setSecondaryTitleBaselineConstraint:(id)a3;
- (void)setSecondaryTitleLabel:(id)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setStarView:(id)a3;
- (void)setTitleBaselineConstraint:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleLeadingOffsetConstraint:(id)a3;
- (void)updateConstraintConstants;
- (void)updateConstraints;
@end

@implementation SRDisambiguationCell

- (SRDisambiguationCell)initWithFrame:(CGRect)a3
{
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___SRDisambiguationCell;
  v3 = -[SRDisambiguationCell initWithFrame:]( &v36,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[SiriSharedUIContentLabel label](&OBJC_CLASS___SiriSharedUIContentLabel, "label"));
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (SiriSharedUIContentLabel *)v4;

    v6 = v3->_titleLabel;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont siriui_lightWeightFontWithSize:]( &OBJC_CLASS___UIFont,  "siriui_lightWeightFontWithSize:",  18.0));
    -[SiriSharedUIContentLabel setFont:](v6, "setFont:", v7);

    LODWORD(v8) = 1132068864;
    -[SiriSharedUIContentLabel setContentCompressionResistancePriority:forAxis:]( v3->_titleLabel,  "setContentCompressionResistancePriority:forAxis:",  0LL,  v8);
    -[SiriSharedUIContentLabel setTranslatesAutoresizingMaskIntoConstraints:]( v3->_titleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell contentView](v3, "contentView"));
    [v9 addSubview:v3->_titleLabel];

    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[SiriSharedUIContentLabel labelWithMediumWeightSubtextFont]( &OBJC_CLASS___SiriSharedUIContentLabel,  "labelWithMediumWeightSubtextFont"));
    secondaryTitleLabel = v3->_secondaryTitleLabel;
    v3->_secondaryTitleLabel = (SiriSharedUIContentLabel *)v10;

    -[SiriSharedUIContentLabel setTranslatesAutoresizingMaskIntoConstraints:]( v3->_secondaryTitleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    LODWORD(v12) = 1132068864;
    -[SiriSharedUIContentLabel setContentCompressionResistancePriority:forAxis:]( v3->_secondaryTitleLabel,  "setContentCompressionResistancePriority:forAxis:",  0LL,  v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell contentView](v3, "contentView"));
    [v13 addSubview:v3->_secondaryTitleLabel];

    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[SiriSharedUIContentLabel labelWithLightWeightRegularFont]( &OBJC_CLASS___SiriSharedUIContentLabel,  "labelWithLightWeightRegularFont"));
    extraDisambiguationLabel = v3->_extraDisambiguationLabel;
    v3->_extraDisambiguationLabel = (SiriSharedUIContentLabel *)v14;

    -[SiriSharedUIContentLabel setTextAlignment:](v3->_extraDisambiguationLabel, "setTextAlignment:", 2LL);
    -[SiriSharedUIContentLabel setTranslatesAutoresizingMaskIntoConstraints:]( v3->_extraDisambiguationLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    LODWORD(v16) = 1144766464;
    -[SiriSharedUIContentLabel setContentCompressionResistancePriority:forAxis:]( v3->_extraDisambiguationLabel,  "setContentCompressionResistancePriority:forAxis:",  0LL,  v16);
    LODWORD(v17) = 1144750080;
    -[SiriSharedUIContentLabel setContentHuggingPriority:forAxis:]( v3->_extraDisambiguationLabel,  "setContentHuggingPriority:forAxis:",  0LL,  v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell contentView](v3, "contentView"));
    [v18 addSubview:v3->_extraDisambiguationLabel];

    uint64_t v19 = objc_claimAutoreleasedReturnValue( +[SiriSharedUIContentLabel labelWithMediumWeightSubtextFont]( &OBJC_CLASS___SiriSharedUIContentLabel,  "labelWithMediumWeightSubtextFont"));
    extraDisambiguationSubTextLabel = v3->_extraDisambiguationSubTextLabel;
    v3->_extraDisambiguationSubTextLabel = (SiriSharedUIContentLabel *)v19;

    -[SiriSharedUIContentLabel setTextAlignment:](v3->_extraDisambiguationSubTextLabel, "setTextAlignment:", 2LL);
    -[SiriSharedUIContentLabel setTranslatesAutoresizingMaskIntoConstraints:]( v3->_extraDisambiguationSubTextLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    LODWORD(v21) = 1144766464;
    -[SiriSharedUIContentLabel setContentCompressionResistancePriority:forAxis:]( v3->_extraDisambiguationSubTextLabel,  "setContentCompressionResistancePriority:forAxis:",  0LL,  v21);
    LODWORD(v22) = 1144750080;
    -[SiriSharedUIContentLabel setContentHuggingPriority:forAxis:]( v3->_extraDisambiguationSubTextLabel,  "setContentHuggingPriority:forAxis:",  0LL,  v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell contentView](v3, "contentView"));
    [v23 addSubview:v3->_extraDisambiguationSubTextLabel];

    v24 = objc_alloc(&OBJC_CLASS___UIImageView);
    *(void *)&double v26 = objc_opt_class(v3, v25).n128_u64[0];
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", v27, v26));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](&OBJC_CLASS___UIImage, "imageNamed:inBundle:", @"VIP", v28));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor siriui_maskingColor](&OBJC_CLASS___UIColor, "siriui_maskingColor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v29 _flatImageWithColor:v30]);
    v32 = -[UIImageView initWithImage:](v24, "initWithImage:", v31);
    starView = v3->_starView;
    v3->_starView = v32;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v3->_starView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell contentView](v3, "contentView"));
    [v34 addSubview:v3->_starView];
  }

  return v3;
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SRDisambiguationCell;
  -[SRDisambiguationCell layoutSubviews](&v10, "layoutSubviews");
  -[UIImageView setHidden:]( self->_starView,  "setHidden:",  -[SiriUIDisambiguationItem showsFavoriteStar](self->_item, "showsFavoriteStar") ^ 1);
  if (-[SRDisambiguationCell isLastRow](self, "isLastRow"))
  {
    v3 = self;
    uint64_t v4 = 0LL;
LABEL_7:
    -[SRDisambiguationCell setKeylineType:](v3, "setKeylineType:", v4);
    return;
  }

  if (!-[SRDisambiguationCell hasStarColumn](self, "hasStarColumn"))
  {
    v3 = self;
    uint64_t v4 = 1LL;
    goto LABEL_7;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell keyline](self, "keyline"));
  [v5 setKeylineType:4];

  id v6 = -[SRDisambiguationCell semanticContentAttribute](self, "semanticContentAttribute");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell keyline](self, "keyline"));
  double v8 = v7;
  if (v6 == (id)4)
  {
    [v7 setCustomRightPadding:35.0];

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell keyline](self, "keyline"));
    [v9 setCustomLeftPadding:0.0];
  }

  else
  {
    [v7 setCustomLeftPadding:35.0];

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell keyline](self, "keyline"));
    [v9 setCustomRightPadding:0.0];
  }
}

- (void)updateConstraints
{
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___SRDisambiguationCell;
  -[SRDisambiguationCell updateConstraints](&v31, "updateConstraints");
  if (!self->_constraintsCreated)
  {
    v3 = _NSDictionaryOfVariableBindings( @"_titleLabel, _secondaryTitleLabel, _extraDisambiguationLabel, _extraDisambiguationSubTextLabel, _starView",  self->_titleLabel,  self->_secondaryTitleLabel,  self->_extraDisambiguationLabel,  self->_extraDisambiguationSubTextLabel,  self->_starView,  0LL);
    uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell contentView](self, "contentView"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintsWithVisualFormat:options:metrics:views:",  @"V:|-starTop-[_starView(==starHeight)]-(>=0)-|",  0LL,  &off_1000BEE30,  v4));
    [v5 addConstraints:v6];

    v7 = (void *)v4;
    double v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintsWithVisualFormat:options:metrics:views:",  @"H:|-starLeft-[_starView(==starWidth)]-(>=0)-|",  0LL,  &off_1000BEE30,  v4));
    [v5 addConstraints:v8];

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell keyline](self, "keyline"));
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v9,  4LL,  0LL,  v5,  4LL,  1.0,  0.0));
    [v5 addConstraint:v10];

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell keyline](self, "keyline"));
    double v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v11,  5LL,  0LL,  v5,  5LL,  1.0,  0.0));
    [v5 addConstraint:v12];

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell keyline](self, "keyline"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v13,  6LL,  0LL,  v5,  6LL,  1.0,  0.0));
    [v5 addConstraint:v14];

    v15 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  self->_titleLabel,  11LL,  0LL,  v5,  3LL,  1.0,  28.5));
    titleBaselineConstraint = self->_titleBaselineConstraint;
    self->_titleBaselineConstraint = v15;

    [v5 addConstraint:self->_titleBaselineConstraint];
    double v17 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  self->_secondaryTitleLabel,  11LL,  0LL,  v5,  3LL,  1.0,  41.0));
    secondaryTitleBaselineConstraint = self->_secondaryTitleBaselineConstraint;
    self->_secondaryTitleBaselineConstraint = v17;

    [v5 addConstraint:self->_secondaryTitleBaselineConstraint];
    uint64_t v19 = v7;
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintsWithVisualFormat:options:metrics:views:",  @"H:[_titleLabel]-[_extraDisambiguationLabel]-edgePadding-|",  0LL,  &off_1000BEE30,  v7));
    [v5 addConstraints:v20];

    double v21 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  self->_titleLabel,  5LL,  0LL,  v5,  5LL,  1.0,  35.0));
    titleLeadingOffsetConstraint = self->_titleLeadingOffsetConstraint;
    self->_titleLeadingOffsetConstraint = v21;

    LODWORD(v23) = 1144750080;
    -[NSLayoutConstraint setPriority:](self->_titleLeadingOffsetConstraint, "setPriority:", v23);
    [v5 addConstraint:self->_titleLeadingOffsetConstraint];
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  self->_titleLabel,  5LL,  0LL,  self->_secondaryTitleLabel,  5LL,  1.0,  0.0));
    [v5 addConstraint:v24];

    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  self->_extraDisambiguationLabel,  5LL,  0LL,  self->_extraDisambiguationSubTextLabel,  5LL,  1.0,  0.0));
    [v5 addConstraint:v25];

    double v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  self->_titleLabel,  6LL,  0LL,  self->_secondaryTitleLabel,  6LL,  1.0,  0.0));
    [v5 addConstraint:v26];

    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  self->_extraDisambiguationLabel,  6LL,  0LL,  self->_extraDisambiguationSubTextLabel,  6LL,  1.0,  0.0));
    [v5 addConstraint:v27];

    v28 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  self->_extraDisambiguationLabel,  11LL,  0LL,  v5,  3LL,  1.0,  28.5));
    extraTitleBaselineConstraint = self->_extraTitleBaselineConstraint;
    self->_extraTitleBaselineConstraint = v28;

    [v5 addConstraint:self->_extraTitleBaselineConstraint];
    v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  self->_extraDisambiguationSubTextLabel,  11LL,  0LL,  v5,  3LL,  1.0,  41.0));
    [v5 addConstraint:v30];

    self->_constraintsCreated = 1;
  }

  -[SRDisambiguationCell updateConstraintConstants](self, "updateConstraintConstants");
}

- (void)updateConstraintConstants
{
  titleLeadingOffsetConstraint = self->_titleLeadingOffsetConstraint;
  if (self->_hasStarColumn) {
    double v4 = 35.0;
  }
  else {
    double v4 = 15.0;
  }
  -[NSLayoutConstraint setConstant:](titleLeadingOffsetConstraint, "setConstant:", v4);
  if (self->_hasStarColumn) {
    double v5 = 35.0;
  }
  else {
    double v5 = 15.0;
  }
  -[NSLayoutConstraint setConstant:](self->_imageLeadingOffsetConstraint, "setConstant:", v5);
  imageView = self->_imageView;
  if (imageView) {
    double v7 = 46.0;
  }
  else {
    double v7 = 28.5;
  }
  if (imageView) {
    double v8 = 56.0;
  }
  else {
    double v8 = 41.0;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell item](self, "item"));
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v9 subtitle]);
  id v11 = [v10 length];

  if (v11)
  {
    if (imageView) {
      double v12 = 34.0;
    }
    else {
      double v12 = 21.0;
    }
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell item](self, "item"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 headingText]);
    id v15 = [v14 length];

    if (v15) {
      double v12 = 40.5;
    }
    else {
      double v12 = v7;
    }
    if (v15) {
      double v8 = 19.0;
    }
  }

  double v16 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell item](self, "item"));
  double v17 = (void *)objc_claimAutoreleasedReturnValue([v16 extraDisambiguationSubText]);
  id v18 = [v17 length];

  if (v18) {
    double v7 = 21.0;
  }
  -[NSLayoutConstraint setConstant:](self->_titleBaselineConstraint, "setConstant:", v12);
  -[NSLayoutConstraint setConstant:](self->_secondaryTitleBaselineConstraint, "setConstant:", v8);
  -[NSLayoutConstraint setConstant:](self->_extraTitleBaselineConstraint, "setConstant:", v7);
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SRDisambiguationCell;
  -[SRDisambiguationCell prepareForReuse](&v3, "prepareForReuse");
  -[SRDisambiguationCell setItem:](self, "setItem:", 0LL);
}

- (void)setItem:(id)a3
{
  id v21 = a3;
  objc_storeStrong((id *)&self->_item, a3);
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v21 title]);
  id v6 = [v21 titleBoldedRange];
  if (v7)
  {
    id v8 = v6;
    uint64_t v9 = v7;
    objc_super v10 = -[NSMutableAttributedString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableAttributedString),  "initWithString:",  v5);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont siriui_mediumWeightFontWithSize:]( &OBJC_CLASS___UIFont,  "siriui_mediumWeightFontWithSize:",  18.0));
    -[NSMutableAttributedString addAttribute:value:range:]( v10,  "addAttribute:value:range:",  NSFontAttributeName,  v11,  v8,  v9);
    -[SiriSharedUIContentLabel setAttributedText:](self->_titleLabel, "setAttributedText:", v10);
  }

  else
  {
    -[SiriSharedUIContentLabel setText:](self->_titleLabel, "setText:", v5);
  }

  double v12 = (void *)objc_claimAutoreleasedReturnValue([v21 subtitle]);

  secondaryTitleLabel = self->_secondaryTitleLabel;
  if (v12) {
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v21 subtitle]);
  }
  else {
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v21 headingText]);
  }
  id v15 = (void *)v14;
  -[SiriSharedUIContentLabel setText:](secondaryTitleLabel, "setText:", v14);

  extraDisambiguationLabel = self->_extraDisambiguationLabel;
  double v17 = (void *)objc_claimAutoreleasedReturnValue([v21 extraDisambiguationText]);
  -[SiriSharedUIContentLabel setText:](extraDisambiguationLabel, "setText:", v17);

  extraDisambiguationSubTextLabel = self->_extraDisambiguationSubTextLabel;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v21 extraDisambiguationSubText]);
  -[SiriSharedUIContentLabel setText:](extraDisambiguationSubTextLabel, "setText:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue([v21 imageView]);
  -[SRDisambiguationCell setImageView:](self, "setImageView:", v20);

  -[SRDisambiguationCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  -[SRDisambiguationCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setImageView:(id)a3
{
  id v20 = a3;
  p_imageView = &self->_imageView;
  -[UIImageView removeFromSuperview](self->_imageView, "removeFromSuperview");
  imageLeadingOffsetConstraint = self->_imageLeadingOffsetConstraint;
  self->_imageLeadingOffsetConstraint = 0LL;

  objc_storeStrong((id *)&self->_imageView, a3);
  if (self->_imageView)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell contentView](self, "contentView"));
    [v7 addSubview:*p_imageView];

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( *p_imageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell contentView](self, "contentView"));
    uint64_t v9 = _NSDictionaryOfVariableBindings(@"_imageView", *p_imageView, 0LL);
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintsWithVisualFormat:options:metrics:views:",  @"H:[_imageView(==imageWidth)]",  0LL,  &off_1000BEE58,  v10));
    [v8 addConstraints:v11];

    double v12 = _NSDictionaryOfVariableBindings(@"_imageView, _titleLabel", *p_imageView, self->_titleLabel, 0LL);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintsWithVisualFormat:options:metrics:views:",  @"V:|-imageTop-[_imageView(==imageHeight)]",  0LL,  &off_1000BEE58,  v13));
    [v8 addConstraints:v14];

    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  self->_titleLabel,  5LL,  0LL,  *p_imageView,  6LL,  1.0,  15.0));
    LODWORD(v16) = 1144766464;
    [v15 setPriority:v16];
    [v8 addConstraint:v15];
    if (self->_hasStarColumn) {
      double v17 = 35.0;
    }
    else {
      double v17 = 15.0;
    }
    id v18 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  *p_imageView,  5LL,  0LL,  v8,  5LL,  1.0,  v17));
    uint64_t v19 = self->_imageLeadingOffsetConstraint;
    self->_imageLeadingOffsetConstraint = v18;

    [v8 addConstraint:self->_imageLeadingOffsetConstraint];
  }
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell contentView](self, "contentView"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 constraints]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell contentView](self, "contentView"));
  [v7 removeConstraints:v6];

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SRDisambiguationCell;
  -[SRDisambiguationCell setSemanticContentAttribute:](&v9, "setSemanticContentAttribute:", a3);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationCell contentView](self, "contentView"));
  [v8 addConstraints:v6];
}

+ (double)defaultHeight
{
  return 44.0;
}

+ (double)defaultHeightWithHeading
{
  return 50.0;
}

+ (double)defaultHeightWithSubtitle
{
  return 55.0;
}

+ (double)defaultHeightWithImageView
{
  return 76.0;
}

- (SiriUIDisambiguationItem)item
{
  return self->_item;
}

- (BOOL)hasStarColumn
{
  return self->_hasStarColumn;
}

- (void)setHasStarColumn:(BOOL)a3
{
  self->_hasStarColumn = a3;
}

- (BOOL)isLastRow
{
  return self->_lastRow;
}

- (void)setLastRow:(BOOL)a3
{
  self->_lastRow = a3;
}

- (SiriSharedUIContentLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (SiriSharedUIContentLabel)secondaryTitleLabel
{
  return self->_secondaryTitleLabel;
}

- (void)setSecondaryTitleLabel:(id)a3
{
}

- (SiriSharedUIContentLabel)extraDisambiguationLabel
{
  return self->_extraDisambiguationLabel;
}

- (void)setExtraDisambiguationLabel:(id)a3
{
}

- (SiriSharedUIContentLabel)extraDisambiguationSubTextLabel
{
  return self->_extraDisambiguationSubTextLabel;
}

- (void)setExtraDisambiguationSubTextLabel:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UIImageView)starView
{
  return self->_starView;
}

- (void)setStarView:(id)a3
{
}

- (NSLayoutConstraint)titleLeadingOffsetConstraint
{
  return self->_titleLeadingOffsetConstraint;
}

- (void)setTitleLeadingOffsetConstraint:(id)a3
{
}

- (NSLayoutConstraint)imageLeadingOffsetConstraint
{
  return self->_imageLeadingOffsetConstraint;
}

- (void)setImageLeadingOffsetConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleBaselineConstraint
{
  return self->_titleBaselineConstraint;
}

- (void)setTitleBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)secondaryTitleBaselineConstraint
{
  return self->_secondaryTitleBaselineConstraint;
}

- (void)setSecondaryTitleBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)extraTitleBaselineConstraint
{
  return self->_extraTitleBaselineConstraint;
}

- (void)setExtraTitleBaselineConstraint:(id)a3
{
}

- (BOOL)constraintsCreated
{
  return self->_constraintsCreated;
}

- (void)setConstraintsCreated:(BOOL)a3
{
  self->_constraintsCreated = a3;
}

- (void).cxx_destruct
{
}

@end
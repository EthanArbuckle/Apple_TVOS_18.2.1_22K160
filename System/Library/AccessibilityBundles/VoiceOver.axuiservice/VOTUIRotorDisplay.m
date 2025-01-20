@interface VOTUIRotorDisplay
- (VOTUIRotorDisplay)initWithFrame:(CGRect)a3;
- (void)hide;
- (void)resetRotorPosition;
- (void)setRotorItemCount:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)show;
- (void)updateRotorPosition:(BOOL)a3;
@end

@implementation VOTUIRotorDisplay

- (VOTUIRotorDisplay)initWithFrame:(CGRect)a3
{
  double width = a3.size.width;
  v50.receiver = self;
  v50.super_class = (Class)&OBJC_CLASS___VOTUIRotorDisplay;
  v4 = -[VOTUIRotorDisplay initWithFrame:]( &v50,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUIRotorDisplay layer](v4, "layer"));
  [v5 setCornerRadius:10.0];

  v6 = -[_UIBackdropView initWithPrivateStyle:]( objc_alloc(&OBJC_CLASS____UIBackdropView),  "initWithPrivateStyle:",  2030LL);
  backdropView = v4->_backdropView;
  v4->_backdropView = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_UIBackdropView layer](v4->_backdropView, "layer"));
  [v8 setCornerRadius:10.0];

  -[VOTUIRotorDisplay addSubview:](v4, "addSubview:", v4->_backdropView);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[VOTUIRotorDisplay setBackgroundColor:](v4, "setBackgroundColor:", v9);

  -[VOTUIRotorDisplay setAlpha:](v4, "setAlpha:", 0.0);
  v4->_title1Active = 1;
  id v10 = objc_allocWithZone(&OBJC_CLASS___UILabel);
  double y = CGRectZero.origin.y;
  double v12 = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v14 = (UILabel *)objc_msgSend(v10, "initWithFrame:", CGRectZero.origin.x, y, v12, height);
  title1Label = v4->_title1Label;
  v4->_title1Label = v14;

  -[UILabel setNumberOfLines:](v4->_title1Label, "setNumberOfLines:", 0LL);
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline));
  -[UILabel setFont:](v4->_title1Label, "setFont:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](v4->_title1Label, "setBackgroundColor:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  -[UILabel setTextColor:](v4->_title1Label, "setTextColor:", v18);

  -[UILabel setTextAlignment:](v4->_title1Label, "setTextAlignment:", 1LL);
  -[UILabel setLineBreakMode:](v4->_title1Label, "setLineBreakMode:", 0LL);
  -[UILabel setAdjustsFontForContentSizeCategory:](v4->_title1Label, "setAdjustsFontForContentSizeCategory:", 1LL);
  -[VOTUIRotorDisplay addSubview:](v4, "addSubview:", v4->_title1Label);
  v19 = (UILabel *)objc_msgSend( objc_allocWithZone(UILabel),  "initWithFrame:",  CGRectZero.origin.x,  y,  v12,  height);
  title2Label = v4->_title2Label;
  v4->_title2Label = v19;

  v21 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline));
  -[UILabel setFont:](v4->_title2Label, "setFont:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](v4->_title2Label, "setBackgroundColor:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  -[UILabel setTextColor:](v4->_title2Label, "setTextColor:", v23);

  -[UILabel setTextAlignment:](v4->_title2Label, "setTextAlignment:", 1LL);
  -[UILabel setLineBreakMode:](v4->_title2Label, "setLineBreakMode:", 0LL);
  -[UILabel setAdjustsFontForContentSizeCategory:](v4->_title2Label, "setAdjustsFontForContentSizeCategory:", 1LL);
  -[UILabel setNumberOfLines:](v4->_title2Label, "setNumberOfLines:", 0LL);
  -[VOTUIRotorDisplay addSubview:](v4, "addSubview:", v4->_title2Label);
  v24 = (VOTUIRotorKnob *)objc_msgSend( objc_allocWithZone((Class)VOTUIRotorKnob),  "initWithFrame:",  CGRectZero.origin.x,  y,  v12,  height);
  rotorKnob = v4->_rotorKnob;
  v4->_rotorKnob = v24;

  -[VOTUIRotorDisplay addSubview:](v4, "addSubview:", v4->_rotorKnob);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v4->_title1Label,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[VOTUIRotorKnob setTranslatesAutoresizingMaskIntoConstraints:]( v4->_rotorKnob,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v4->_title2Label,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[_UIBackdropView setTranslatesAutoresizingMaskIntoConstraints:]( v4->_backdropView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  uint64_t v26 = objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v4->_title1Label,  9LL,  0LL,  v4,  9LL,  1.0,  0.0));
  title1LabelCenterConstraint = v4->_title1LabelCenterConstraint;
  v4->_title1LabelCenterConstraint = (NSLayoutConstraint *)v26;

  uint64_t v28 = objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v4->_title2Label,  9LL,  0LL,  v4,  9LL,  1.0,  width * -1.5));
  title2LabelCenterConstraint = v4->_title2LabelCenterConstraint;
  v4->_title2LabelCenterConstraint = (NSLayoutConstraint *)v28;

  uint64_t v30 = objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v4->_rotorKnob,  3LL,  0LL,  v4->_title1Label,  11LL,  1.0,  -5.0));
  rotorKnobPinnedToTitle1Label = v4->_rotorKnobPinnedToTitle1Label;
  v4->_rotorKnobPinnedToTitle1Label = (NSLayoutConstraint *)v30;

  uint64_t v32 = objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v4->_rotorKnob,  3LL,  0LL,  v4->_title2Label,  11LL,  1.0,  -5.0));
  rotorKnobPinnedToTitle2Label = v4->_rotorKnobPinnedToTitle2Label;
  v4->_rotorKnobPinnedToTitle2Label = (NSLayoutConstraint *)v32;

  v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v4,  7LL,  1LL,  0LL,  0LL,  1.0,  160.0));
  v51[0] = v49;
  v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v4,  7LL,  -1LL,  0LL,  0LL,  1.0,  400.0));
  v51[1] = v48;
  v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v4,  4LL,  0LL,  v4->_rotorKnob,  4LL,  1.0,  5.0));
  v51[2] = v47;
  v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v4->_backdropView,  7LL,  0LL,  v4,  7LL,  1.0,  0.0));
  v51[3] = v46;
  v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v4->_backdropView,  8LL,  0LL,  v4,  8LL,  1.0,  0.0));
  v51[4] = v45;
  v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v4->_backdropView,  9LL,  0LL,  v4,  9LL,  1.0,  0.0));
  v51[5] = v44;
  v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v4->_backdropView,  10LL,  0LL,  v4,  10LL,  1.0,  0.0));
  v51[6] = v43;
  v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v4->_title1Label,  7LL,  0LL,  v4,  7LL,  0.9,  0.0));
  v51[7] = v34;
  v51[8] = v4->_title1LabelCenterConstraint;
  v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v4->_title1Label,  3LL,  0LL,  v4,  3LL,  1.0,  5.0));
  v51[9] = v35;
  v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v4->_title2Label,  7LL,  0LL,  v4,  7LL,  0.9,  0.0));
  v51[10] = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v4->_title2Label,  3LL,  0LL,  v4,  3LL,  1.0,  5.0));
  v51[11] = v37;
  v51[12] = v4->_title2LabelCenterConstraint;
  v51[13] = v4->_rotorKnobPinnedToTitle1Label;
  v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v4->_rotorKnob,  7LL,  0LL,  v4,  7LL,  0.95,  0.0));
  v51[14] = v38;
  v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v4->_rotorKnob,  8LL,  0LL,  0LL,  0LL,  1.0,  140.0));
  v51[15] = v39;
  v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v4->_rotorKnob,  9LL,  0LL,  v4,  9LL,  1.0,  0.0));
  v51[16] = v40;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v51, 17LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v41);

  -[VOTUIRotorDisplay setClipsToBounds:](v4, "setClipsToBounds:", 1LL);
  return v4;
}

- (void)resetRotorPosition
{
}

- (void)setRotorItemCount:(int64_t)a3
{
}

- (void)updateRotorPosition:(BOOL)a3
{
  self->_wasRotorMovementClockwise = a3;
  -[VOTUIRotorKnob updatePosition:](self->_rotorKnob, "updatePosition:");
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_title1Label, "text"));
  if ([v4 isEqualToString:v5] && self->_title1Active)
  {
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_title2Label, "text"));
    if ([v4 isEqualToString:v6])
    {
      BOOL title1Active = self->_title1Active;

      if (!title1Active) {
        goto LABEL_22;
      }
    }

    else
    {
    }

    uint64_t v8 = VOTLogCommon();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      BOOL v10 = self->_title1Active;
      *(_DWORD *)buf = 67109120;
      BOOL v27 = v10;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Title 1 active: %d", buf, 8u);
    }

    BOOL v11 = self->_title1Active;
    BOOL wasRotorMovementClockwise = self->_wasRotorMovementClockwise;
    -[VOTUIRotorDisplay frame](self, "frame");
    double v14 = -v13;
    if (!wasRotorMovementClockwise) {
      double v14 = v13;
    }
    v15 = &OBJC_IVAR___VOTUIRotorDisplay__title2LabelCenterConstraint;
    double v16 = v14 * 1.5;
    if (!v11) {
      v15 = &OBJC_IVAR___VOTUIRotorDisplay__title1LabelCenterConstraint;
    }
    [*(id *)((char *)&self->super.super.super.isa + *v15) setConstant:v16];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_FAB0;
    v25[3] = &unk_247D0;
    v25[4] = self;
    +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v25, 0.0);
    -[NSLayoutConstraint setActive:](self->_rotorKnobPinnedToTitle1Label, "setActive:", !self->_title1Active);
    -[NSLayoutConstraint setActive:](self->_rotorKnobPinnedToTitle2Label, "setActive:", self->_title1Active);
    if (self->_title1Active)
    {
      -[NSLayoutConstraint setConstant:](self->_title2LabelCenterConstraint, "setConstant:", 0.0);
      BOOL v17 = self->_wasRotorMovementClockwise;
      -[VOTUIRotorDisplay frame](self, "frame");
      double v19 = -v18;
      if (v17) {
        double v19 = v18;
      }
      v20 = &OBJC_IVAR___VOTUIRotorDisplay__title1LabelCenterConstraint;
    }

    else
    {
      -[NSLayoutConstraint setConstant:](self->_title1LabelCenterConstraint, "setConstant:", 0.0);
      BOOL v21 = self->_wasRotorMovementClockwise;
      -[VOTUIRotorDisplay frame](self, "frame");
      double v19 = -v22;
      if (v21) {
        double v19 = v22;
      }
      v20 = &OBJC_IVAR___VOTUIRotorDisplay__title2LabelCenterConstraint;
    }

    [*(id *)((char *)&self->super.super.super.isa + *v20) setConstant:v19 * 1.5];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_FAB8;
    v23[3] = &unk_24900;
    v23[4] = self;
    id v24 = v4;
    +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v23, 0.400000006);
  }

- (void)show
{
  if (v3 == 0.0) {
    -[VOTUIRotorDisplay setAlpha:](self, "setAlpha:", 1.0);
  }
}

- (void)hide
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_FBFC;
  v2[3] = &unk_247D0;
  v2[4] = self;
  +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v2, 0.5);
}

- (void).cxx_destruct
{
}

@end
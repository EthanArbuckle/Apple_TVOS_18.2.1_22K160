@interface TVSettingsOverscanView
- (NSString)actionSafeText;
- (NSString)fullscreenText;
- (NSString)instructionText;
- (NSString)titleText;
- (TVSettingsOverscanView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setActionSafeText:(id)a3;
- (void)setFullscreenText:(id)a3;
- (void)setInstructionText:(id)a3;
- (void)setTitleText:(id)a3;
@end

@implementation TVSettingsOverscanView

- (TVSettingsOverscanView)initWithFrame:(CGRect)a3
{
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___TVSettingsOverscanView;
  v3 = -[TVSettingsOverscanView initWithFrame:]( &v29,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 1LL);
    v6 = v3->_titleLabel;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[UILabel setTextColor:](v6, "setTextColor:", v7);

    v8 = v3->_titleLabel;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleTitle2));
    -[UILabel setFont:](v8, "setFont:", v9);

    -[TVSettingsOverscanView addSubview:](v3, "addSubview:", v3->_titleLabel);
    v10 = objc_alloc_init(&OBJC_CLASS___UILabel);
    textLabel = v3->_textLabel;
    v3->_textLabel = v10;

    -[UILabel setNumberOfLines:](v3->_textLabel, "setNumberOfLines:", 0LL);
    -[UILabel setTextAlignment:](v3->_textLabel, "setTextAlignment:", 1LL);
    v12 = v3->_textLabel;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.5));
    -[UILabel setTextColor:](v12, "setTextColor:", v13);

    v14 = v3->_textLabel;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleBody));
    -[UILabel setFont:](v14, "setFont:", v15);

    -[TVSettingsOverscanView addSubview:](v3, "addSubview:", v3->_textLabel);
    v16 = objc_alloc_init(&OBJC_CLASS___UILabel);
    actionSafeLabel = v3->_actionSafeLabel;
    v3->_actionSafeLabel = v16;

    -[UILabel setTextAlignment:](v3->_actionSafeLabel, "setTextAlignment:", 1LL);
    v18 = v3->_actionSafeLabel;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[UILabel setTextColor:](v18, "setTextColor:", v19);

    v20 = v3->_actionSafeLabel;
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleBody));
    -[UILabel setFont:](v20, "setFont:", v21);

    -[TVSettingsOverscanView addSubview:](v3, "addSubview:", v3->_actionSafeLabel);
    v22 = objc_alloc_init(&OBJC_CLASS___UILabel);
    fullscreenLabel = v3->_fullscreenLabel;
    v3->_fullscreenLabel = v22;

    -[UILabel setTextAlignment:](v3->_fullscreenLabel, "setTextAlignment:", 1LL);
    v24 = v3->_fullscreenLabel;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[UILabel setTextColor:](v24, "setTextColor:", v25);

    v26 = v3->_fullscreenLabel;
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleBody));
    -[UILabel setFont:](v26, "setFont:", v27);

    -[TVSettingsOverscanView addSubview:](v3, "addSubview:", v3->_fullscreenLabel);
  }

  return v3;
}

- (void)setTitleText:(id)a3
{
}

- (NSString)titleText
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setInstructionText:(id)a3
{
}

- (NSString)instructionText
{
  return -[UILabel text](self->_textLabel, "text");
}

- (void)setActionSafeText:(id)a3
{
  actionSafeLabel = self->_actionSafeLabel;
  id v5 = a3;
  -[UILabel setText:](actionSafeLabel, "setText:", v5);
  -[UILabel sizeToFit](self->_actionSafeLabel, "sizeToFit");
  v6 = (NSString *)[v5 copy];

  actionSafeText = self->_actionSafeText;
  self->_actionSafeText = v6;

  -[TVSettingsOverscanView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setFullscreenText:(id)a3
{
  fullscreenLabel = self->_fullscreenLabel;
  id v5 = a3;
  -[UILabel setText:](fullscreenLabel, "setText:", v5);
  -[UILabel sizeToFit](self->_fullscreenLabel, "sizeToFit");
  v6 = (NSString *)[v5 copy];

  fullscreenText = self->_fullscreenText;
  self->_fullscreenText = v6;

  -[TVSettingsOverscanView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat rect_8 = v7;
  CGFloat rect_16 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[UILabel frame](self->_titleLabel, "frame");
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  v64.origin.x = v4;
  v64.origin.y = v6;
  v64.size.width = v8;
  v64.size.height = v10;
  double Width = CGRectGetWidth(v64);
  v65.origin.x = v12;
  v65.origin.y = v14;
  v65.size.width = v16;
  CGFloat v60 = v18;
  v65.size.height = v18;
  CGFloat v59 = floor((Width - CGRectGetWidth(v65)) * 0.5);
  -[UILabel setFrame:](self->_titleLabel, "setFrame:");
  -[UILabel frame](self->_textLabel, "frame");
  CGFloat v57 = v21;
  CGFloat v58 = v20;
  CGFloat v22 = v4;
  CGFloat rect = v4;
  v66.origin.x = v4;
  v66.origin.y = rect_16;
  v66.size.width = rect_8;
  CGFloat v23 = v10;
  v66.size.height = v10;
  -[UILabel sizeThatFits:](self->_textLabel, "sizeThatFits:", 640.0, CGRectGetHeight(v66));
  double v25 = v24;
  double v27 = v26;
  v67.origin.x = v22;
  v67.origin.y = rect_16;
  v67.size.width = rect_8;
  CGFloat v56 = v23;
  v67.size.height = v23;
  double v28 = CGRectGetWidth(v67);
  v68.origin.y = v57;
  v68.origin.x = v58;
  v68.size.width = v25;
  v68.size.height = v27;
  double v29 = floor((v28 - CGRectGetWidth(v68)) * 0.5);
  v69.origin.x = v59;
  v69.size.height = v60;
  v69.origin.y = 348.0;
  v69.size.width = v16;
  -[UILabel setFrame:](self->_textLabel, "setFrame:", v29, CGRectGetMaxY(v69) + 40.0, v25, v27);
  -[UILabel frame](self->_actionSafeLabel, "frame");
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  double v35 = v34;
  double v37 = v36;
  v70.origin.x = rect;
  v70.origin.y = rect_16;
  v70.size.width = rect_8;
  v70.size.height = v23;
  CGFloat v38 = CGRectGetMaxX(v70) + -90.0 + -14.0;
  v71.origin.x = v31;
  v71.origin.y = v33;
  v71.size.width = v35;
  v71.size.height = v37;
  CGFloat v39 = v38 - CGRectGetWidth(v71);
  v72.origin.x = rect;
  v72.origin.y = rect_16;
  v72.size.width = rect_8;
  v72.size.height = v56;
  CGFloat v40 = CGRectGetMaxY(v72) + -60.0 + -14.0;
  v73.origin.x = v39;
  v73.origin.y = v33;
  v73.size.width = v35;
  v73.size.height = v37;
  CGFloat v41 = v40 - CGRectGetHeight(v73);
  -[UILabel _baselineOffsetFromBottom](self->_actionSafeLabel, "_baselineOffsetFromBottom");
  -[UILabel setFrame:](self->_actionSafeLabel, "setFrame:", v39, v41 + v42, v35, v37);
  -[UILabel frame](self->_fullscreenLabel, "frame");
  CGFloat v44 = v43;
  CGFloat v46 = v45;
  double v48 = v47;
  double v50 = v49;
  v74.origin.x = rect;
  v74.origin.y = rect_16;
  v74.size.width = rect_8;
  v74.size.height = v56;
  CGFloat v51 = CGRectGetMaxX(v74) + -14.0;
  v75.origin.x = v44;
  v75.origin.y = v46;
  v75.size.width = v48;
  v75.size.height = v50;
  CGFloat v52 = v51 - CGRectGetWidth(v75);
  v76.origin.x = rect;
  v76.origin.y = rect_16;
  v76.size.width = rect_8;
  v76.size.height = v56;
  CGFloat v53 = CGRectGetMaxY(v76) + -14.0;
  v77.origin.x = v52;
  v77.origin.y = v46;
  v77.size.width = v48;
  v77.size.height = v50;
  CGFloat v54 = v53 - CGRectGetHeight(v77);
  -[UILabel _baselineOffsetFromBottom](self->_fullscreenLabel, "_baselineOffsetFromBottom");
  -[UILabel setFrame:](self->_fullscreenLabel, "setFrame:", v52, v54 + v55, v48, v50);
}

- (void)drawRect:(CGRect)a3
{
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  id v12 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  double v13 = (CGColor *)[v12 CGColor];

  CGContextSetFillColorWithColor(CurrentContext, v13);
  v31.origin.CGFloat x = v4;
  v31.origin.CGFloat y = v6;
  v31.size.CGFloat width = v8;
  v31.size.CGFloat height = v10;
  CGContextFillRect(CurrentContext, v31);
  id v14 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithWhite:alpha:]( &OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.4));
  double v15 = (CGColor *)[v14 CGColor];

  CGContextSetFillColorWithColor(CurrentContext, v15);
  v32.origin.CGFloat x = v4;
  v32.origin.CGFloat y = v6;
  v32.size.CGFloat width = v8;
  v32.size.CGFloat height = v10;
  CGContextFillRect(CurrentContext, v32);
  id v16 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  double v17 = (CGColor *)[v16 CGColor];

  CGContextSetStrokeColorWithColor(CurrentContext, v17);
  CGContextSetLineWidth(CurrentContext, 2.0);
  v33.origin.CGFloat x = v4;
  v33.origin.CGFloat y = v6;
  v33.size.CGFloat width = v8;
  v33.size.CGFloat height = v10;
  CGRect v34 = CGRectInset(v33, 1.0, 1.0);
  CGContextStrokeRect(CurrentContext, v34);
  v35.origin.CGFloat x = v4;
  v35.origin.CGFloat y = v6;
  v35.size.CGFloat width = v8;
  v35.size.CGFloat height = v10;
  CGRect v36 = CGRectInset(v35, 90.0, 60.0);
  CGFloat x = v36.origin.x;
  CGFloat y = v36.origin.y;
  CGFloat width = v36.size.width;
  CGFloat height = v36.size.height;
  CGContextSetFillColorWithColor(CurrentContext, v13);
  v37.origin.CGFloat x = x;
  v37.origin.CGFloat y = y;
  v37.size.CGFloat width = width;
  v37.size.CGFloat height = height;
  CGContextFillRect(CurrentContext, v37);
  CGContextSetStrokeColorWithColor(CurrentContext, v17);
  CGContextSetLineWidth(CurrentContext, 2.0);
  v38.origin.CGFloat x = x;
  v38.origin.CGFloat y = y;
  v38.size.CGFloat width = width;
  v38.size.CGFloat height = height;
  CGRect v39 = CGRectInset(v38, 1.0, 1.0);
  CGContextStrokeRect(CurrentContext, v39);
  v40.origin.CGFloat x = x;
  v40.origin.CGFloat y = y;
  v40.size.CGFloat width = width;
  v40.size.CGFloat height = height;
  double v22 = CGRectGetHeight(v40);
  v41.origin.CGFloat x = x;
  v41.origin.CGFloat y = y;
  v41.size.CGFloat width = width;
  v41.size.CGFloat height = height;
  CGFloat v23 = (CGRectGetWidth(v41) - v22) * 0.5;
  v42.origin.CGFloat x = x;
  v42.origin.CGFloat y = y;
  v42.size.CGFloat width = width;
  v42.size.CGFloat height = height;
  CGFloat v24 = CGRectGetMinX(v42) + v23;
  v43.origin.CGFloat x = x;
  v43.origin.CGFloat y = y;
  v43.size.CGFloat width = width;
  v43.size.CGFloat height = height;
  v44.origin.CGFloat y = CGRectGetMinY(v43);
  v44.origin.CGFloat x = v24;
  v44.size.CGFloat width = v22;
  v44.size.CGFloat height = v22;
  CGRect v45 = CGRectInset(v44, 1.0, 1.0);
  CGFloat v25 = v45.origin.x;
  CGFloat v26 = v45.origin.y;
  CGFloat v27 = v45.size.width;
  CGFloat v28 = v45.size.height;
  id v29 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithWhite:alpha:]( &OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.4));
  double v30 = (CGColor *)[v29 CGColor];

  CGContextSetFillColorWithColor(CurrentContext, v30);
  v46.origin.CGFloat x = v25;
  v46.origin.CGFloat y = v26;
  v46.size.CGFloat width = v27;
  v46.size.CGFloat height = v28;
  CGContextFillEllipseInRect(CurrentContext, v46);
  v47.origin.CGFloat x = v25;
  v47.origin.CGFloat y = v26;
  v47.size.CGFloat width = v27;
  v47.size.CGFloat height = v28;
  CGContextStrokeEllipseInRect(CurrentContext, v47);
  CGContextRestoreGState(CurrentContext);
}

- (NSString)actionSafeText
{
  return self->_actionSafeText;
}

- (NSString)fullscreenText
{
  return self->_fullscreenText;
}

- (void).cxx_destruct
{
}

@end
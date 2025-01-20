@interface PBThermalWarningView
- (PBThermalWarningView)initWithFrame:(CGRect)a3;
- (UILabel)subtext;
- (UILabel)text;
- (void)layoutSubviews;
@end

@implementation PBThermalWarningView

- (PBThermalWarningView)initWithFrame:(CGRect)a3
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___PBThermalWarningView;
  v3 = -[PBThermalWarningView initWithFrame:]( &v23,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PBThermalWarningView setOpaque:](v3, "setOpaque:", 1LL);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    -[PBThermalWarningView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[PBThermalWarningView setContentMode:](v4, "setContentMode:", 3LL);
    v6 = objc_alloc_init(&OBJC_CLASS___UILabel);
    text = v4->_text;
    v4->_text = v6;

    -[UILabel setOpaque:](v4->_text, "setOpaque:", 0LL);
    -[UILabel setBackgroundColor:](v4->_text, "setBackgroundColor:", 0LL);
    v8 = v4->_text;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleTitle2));
    -[UILabel setFont:](v8, "setFont:", v9);

    v10 = v4->_text;
    if (qword_10046FFB8 != -1) {
      dispatch_once(&qword_10046FFB8, &stru_1003D0F58);
    }
    -[UILabel setTextColor:](v10, "setTextColor:", qword_10046FFB0);
    v11 = v4->_text;
    id v12 = sub_1001C307C(@"ThermalNoticeText", 0LL);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[UILabel setText:](v11, "setText:", v13);

    -[UILabel sizeToFit](v4->_text, "sizeToFit");
    -[PBThermalWarningView addSubview:](v4, "addSubview:", v4->_text);
    v14 = objc_alloc_init(&OBJC_CLASS___UILabel);
    subtext = v4->_subtext;
    v4->_subtext = v14;

    -[UILabel setOpaque:](v4->_subtext, "setOpaque:", 0LL);
    -[UILabel setBackgroundColor:](v4->_subtext, "setBackgroundColor:", 0LL);
    v16 = v4->_subtext;
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline));
    -[UILabel setFont:](v16, "setFont:", v17);

    v18 = v4->_subtext;
    if (qword_10046FFB8 != -1) {
      dispatch_once(&qword_10046FFB8, &stru_1003D0F58);
    }
    -[UILabel setTextColor:](v18, "setTextColor:", qword_10046FFB0);
    v19 = v4->_subtext;
    id v20 = sub_1001C307C(@"ThermalNoticeSubtext", 0LL);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    -[UILabel setText:](v19, "setText:", v21);

    -[UILabel setLineBreakMode:](v4->_subtext, "setLineBreakMode:", 0LL);
    -[UILabel setNumberOfLines:](v4->_subtext, "setNumberOfLines:", 0LL);
    -[UILabel setTextAlignment:](v4->_subtext, "setTextAlignment:", 1LL);
    -[UILabel sizeToFit](v4->_subtext, "sizeToFit");
    -[PBThermalWarningView addSubview:](v4, "addSubview:", v4->_subtext);
    -[PBThermalWarningView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 1LL);
  }

  return v4;
}

- (void)layoutSubviews
{
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___PBThermalWarningView;
  -[PBThermalWarningView layoutSubviews](&v41, "layoutSubviews");
  -[PBThermalWarningView bounds](self, "bounds");
  CGFloat v4 = v3;
  CGFloat v30 = v5;
  CGFloat v31 = v3;
  CGFloat v6 = v5;
  CGFloat rect = v7;
  CGFloat v9 = v8;
  CGFloat v32 = v8;
  -[UILabel frame](self->_text, "frame");
  double v33 = v11;
  CGFloat v34 = v10;
  CGFloat v13 = v12;
  double v40 = v14;
  -[UILabel frame](self->_subtext, "frame");
  CGFloat v16 = v15;
  CGFloat v37 = v17;
  CGFloat v38 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  double v35 = v21;
  double v36 = v19;
  CGFloat v22 = v21;
  v42.origin.x = v4;
  v42.origin.y = v6;
  v42.size.width = rect;
  v42.size.height = v9;
  double Height = CGRectGetHeight(v42);
  v43.origin.x = v16;
  v43.origin.y = v18;
  v43.size.width = v20;
  v43.size.height = v22;
  double v24 = round((Height - CGRectGetHeight(v43)) * 0.5);
  v44.origin.x = v34;
  v44.origin.y = v13;
  v44.size.width = v40;
  v44.size.height = v33;
  CGFloat v29 = v24 - CGRectGetHeight(v44) + -38.0;
  v45.origin.x = v31;
  v45.origin.y = v30;
  v45.size.width = rect;
  v45.size.height = v32;
  double Width = CGRectGetWidth(v45);
  v46.origin.x = v34;
  v46.origin.y = v13;
  v46.size.width = v40;
  v46.size.height = v33;
  CGFloat v26 = round((Width - CGRectGetWidth(v46)) * 0.5);
  -[UILabel setFrame:](self->_text, "setFrame:", v26, v29, v40, v33);
  v47.origin.x = v31;
  v47.origin.y = v30;
  v47.size.width = rect;
  v47.size.height = v32;
  double v27 = CGRectGetWidth(v47);
  v48.origin.y = v37;
  v48.origin.x = v38;
  v48.size.width = v36;
  v48.size.height = v35;
  double v28 = (v27 - CGRectGetWidth(v48)) * 0.5;
  v49.origin.x = v26;
  v49.origin.y = v29;
  v49.size.width = v40;
  v49.size.height = v33;
  -[UILabel setFrame:](self->_subtext, "setFrame:", v28, CGRectGetMaxY(v49) + 38.0, v36, v35);
}

- (UILabel)text
{
  return self->_text;
}

- (UILabel)subtext
{
  return self->_subtext;
}

- (void).cxx_destruct
{
}

@end
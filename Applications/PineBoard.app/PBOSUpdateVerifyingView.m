@interface PBOSUpdateVerifyingView
- (PBOSUpdateVerifyingView)initWithFrame:(CGRect)a3;
- (UILabel)subtext;
- (UILabel)text;
- (void)layoutSubviews;
@end

@implementation PBOSUpdateVerifyingView

- (PBOSUpdateVerifyingView)initWithFrame:(CGRect)a3
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___PBOSUpdateVerifyingView;
  v3 = -[PBOSUpdateVerifyingView initWithFrame:]( &v23,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PBOSUpdateVerifyingView setOpaque:](v3, "setOpaque:", 1LL);
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.0627,  0.0627,  0.0627,  1.0));
    -[PBOSUpdateVerifyingView setBackgroundColor:](v4, "setBackgroundColor:", v5);
    -[PBOSUpdateVerifyingView setContentMode:](v4, "setContentMode:", 3LL);
    v6 = objc_alloc_init(&OBJC_CLASS___UILabel);
    text = v4->_text;
    v4->_text = v6;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v4->_text,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UILabel setOpaque:](v4->_text, "setOpaque:", 0LL);
    -[UILabel setBackgroundColor:](v4->_text, "setBackgroundColor:", 0LL);
    v8 = v4->_text;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleTitle2));
    -[UILabel setFont:](v8, "setFont:", v9);

    v10 = v4->_text;
    if (qword_100471138 != -1) {
      dispatch_once(&qword_100471138, &stru_1003D9CA8);
    }
    -[UILabel setTextColor:](v10, "setTextColor:", qword_100471130);
    v11 = v4->_text;
    id v12 = sub_1001C307C(@"OSUpdateVerifyingTest", 0LL);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[UILabel setText:](v11, "setText:", v13);

    -[UILabel setPreferredMaxLayoutWidth:](v4->_text, "setPreferredMaxLayoutWidth:", 1267.0);
    -[UILabel sizeToFit](v4->_text, "sizeToFit");
    -[PBOSUpdateVerifyingView addSubview:](v4, "addSubview:", v4->_text);
    v14 = objc_alloc_init(&OBJC_CLASS___UILabel);
    subtext = v4->_subtext;
    v4->_subtext = v14;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v4->_subtext,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UILabel setOpaque:](v4->_subtext, "setOpaque:", 0LL);
    -[UILabel setBackgroundColor:](v4->_subtext, "setBackgroundColor:", 0LL);
    v16 = v4->_subtext;
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline));
    -[UILabel setFont:](v16, "setFont:", v17);

    v18 = v4->_subtext;
    if (qword_100471138 != -1) {
      dispatch_once(&qword_100471138, &stru_1003D9CA8);
    }
    -[UILabel setTextColor:](v18, "setTextColor:", qword_100471130);
    v19 = v4->_subtext;
    id v20 = sub_1001C307C(@"OSUpdateVerifyingSubtext", 0LL);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    -[UILabel setText:](v19, "setText:", v21);

    -[UILabel setLineBreakMode:](v4->_subtext, "setLineBreakMode:", 0LL);
    -[UILabel setNumberOfLines:](v4->_subtext, "setNumberOfLines:", 4LL);
    -[UILabel setTextAlignment:](v4->_subtext, "setTextAlignment:", 1LL);
    -[UILabel setPreferredMaxLayoutWidth:](v4->_subtext, "setPreferredMaxLayoutWidth:", 1267.0);
    -[UILabel sizeToFit](v4->_subtext, "sizeToFit");
    -[PBOSUpdateVerifyingView addSubview:](v4, "addSubview:", v4->_subtext);
    -[PBOSUpdateVerifyingView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 1LL);
  }

  return v4;
}

- (void)layoutSubviews
{
  *(void *)&rect.origin.y = self;
  *(void *)&rect.size.width = &OBJC_CLASS___PBOSUpdateVerifyingView;
  -[CGFloat layoutSubviews]((objc_super *)&rect.origin.y, "layoutSubviews");
  -[PBOSUpdateVerifyingView bounds](self, "bounds");
  CGFloat v4 = v3;
  rect.origin.x = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[UILabel frame](self->_text, "frame");
  CGFloat v35 = v12;
  CGFloat v36 = v11;
  double v37 = v13;
  double v34 = v14;
  -[UILabel frame](self->_subtext, "frame");
  CGFloat v16 = v15;
  CGFloat v42 = v17;
  CGFloat v43 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v40 = v21;
  CGFloat v41 = v19;
  CGFloat v22 = v21;
  v45.origin.x = v4;
  v45.origin.y = v6;
  CGFloat v23 = v6;
  CGFloat v38 = v6;
  CGFloat v39 = v8;
  CGFloat v24 = v8;
  v45.size.width = v8;
  v45.size.height = v10;
  double Height = CGRectGetHeight(v45);
  v46.origin.x = v16;
  v46.origin.y = v18;
  v46.size.width = v20;
  v46.size.height = v22;
  double v26 = round((Height - CGRectGetHeight(v46)) * 0.5);
  v47.origin.x = v36;
  v47.origin.y = v35;
  v47.size.width = v37;
  v47.size.height = v34;
  double v27 = v26 - CGRectGetHeight(v47) + -38.0;
  v48.origin.x = rect.origin.x;
  v48.origin.y = v23;
  v48.size.width = v24;
  v48.size.height = v10;
  double Width = CGRectGetWidth(v48);
  v49.origin.x = v36;
  v49.origin.y = v35;
  v49.size.width = v37;
  v49.size.height = v34;
  double v29 = round((Width - CGRectGetWidth(v49)) * 0.5);
  -[UILabel setFrame:](self->_text, "setFrame:", v29, v27, v37, v34);
  -[UILabel preferredMaxLayoutWidth](self->_subtext, "preferredMaxLayoutWidth");
  double v31 = v30;
  v50.origin.y = v42;
  v50.origin.x = v43;
  v50.size.height = v40;
  v50.size.width = v41;
  double v32 = CGRectGetWidth(v50);
  if (v31 >= v32) {
    double v31 = v32;
  }
  v51.origin.x = rect.origin.x;
  v51.origin.y = v38;
  v51.size.width = v39;
  v51.size.height = v10;
  CGFloat v33 = (CGRectGetWidth(v51) - v31) * 0.5;
  v52.origin.x = v29;
  v52.origin.y = v27;
  v52.size.width = v37;
  v52.size.height = v34;
  -[UILabel setFrame:](self->_subtext, "setFrame:", v33, CGRectGetMaxY(v52) + 38.0, v31, v27 + -38.0);
  -[UILabel sizeToFit](self->_subtext, "sizeToFit");
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
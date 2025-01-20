@interface SRSpeechAlternativeTapToEditCellView
- (CGSize)sizeThatFits:(CGSize)result;
- (SRSpeechAlternativeTapToEditCellView)init;
- (void)layoutSubviews;
- (void)setTextHidden:(BOOL)a3;
@end

@implementation SRSpeechAlternativeTapToEditCellView

- (SRSpeechAlternativeTapToEditCellView)init
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___SRSpeechAlternativeTapToEditCellView;
  v2 = -[SRSpeechAlternativeTapToEditCellView init](&v22, "init");
  v4 = v2;
  if (v2)
  {
    *(void *)&double v5 = objc_opt_class(v2, v3).n128_u64[0];
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", v6, v5));
    v8 = -[UILabel initWithFrame:]( objc_alloc(&OBJC_CLASS___UILabel),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    tapToEditLabel = v4->_tapToEditLabel;
    v4->_tapToEditLabel = v8;

    v10 = v4->_tapToEditLabel;
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption2));
    -[UILabel setFont:](v10, "setFont:", v11);

    v12 = v4->_tapToEditLabel;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.6));
    -[UILabel setTextColor:](v12, "setTextColor:", v13);

    v14 = v4->_tapToEditLabel;
    v15 = (void *)objc_claimAutoreleasedReturnValue([v7 siriUILocalizedStringForKey:@"TAP_TO_EDIT" table:0]);
    v16 = objc_alloc(&OBJC_CLASS___NSLocale);
    uint64_t v17 = AFUIGetLanguageCode();
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = -[NSLocale initWithLocaleIdentifier:](v16, "initWithLocaleIdentifier:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v15 uppercaseStringWithLocale:v19]);
    -[UILabel setText:](v14, "setText:", v20);

    -[UILabel setHidden:](v4->_tapToEditLabel, "setHidden:", 0LL);
    -[UILabel sizeToFit](v4->_tapToEditLabel, "sizeToFit");
    -[SRSpeechAlternativeTapToEditCellView addSubview:](v4, "addSubview:", v4->_tapToEditLabel);
  }

  return v4;
}

- (void)setTextHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[UILabel isHidden](self->_tapToEditLabel, "isHidden") != a3)
  {
    if (v3)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_10003B1B4;
      v7[3] = &unk_1000BA078;
      v7[4] = self;
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472LL;
      v6[2] = sub_10003B1CC;
      v6[3] = &unk_1000BAD80;
      v6[4] = self;
      +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v7,  v6,  0.5);
    }

    else
    {
      -[UILabel setHidden:](self->_tapToEditLabel, "setHidden:", 0LL);
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472LL;
      v5[2] = sub_10003B1E4;
      v5[3] = &unk_1000BA078;
      v5[4] = self;
      +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v5, 0.5);
    }
  }

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = SiriUIPlatterStyle[26];
  result.height = v3;
  return result;
}

- (void)layoutSubviews
{
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  id v11 = -[UILabel frame](self->_tapToEditLabel, "frame");
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  double v17 = v16;
  double v19 = v18;
  if (SiriLanguageIsRTL(v11, v20))
  {
    v23.origin.x = v4;
    v23.origin.y = v6;
    v23.size.width = v8;
    v23.size.height = v10;
    CGFloat v21 = CGRectGetWidth(v23) - SiriUIPlatterStyle[34];
    v24.origin.x = v13;
    v24.origin.y = v15;
    v24.size.width = v17;
    v24.size.height = v19;
    double v22 = v21 - CGRectGetWidth(v24);
  }

  else
  {
    double v22 = SiriUIPlatterStyle[32];
  }

  -[UILabel bounds](self->_tapToEditLabel, "bounds");
  -[UILabel setFrame:](self->_tapToEditLabel, "setFrame:", v22, SiriUIPlatterStyle[21] - CGRectGetHeight(v25), v17, v19);
}

- (void).cxx_destruct
{
}

@end
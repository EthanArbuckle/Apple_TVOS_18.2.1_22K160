@interface TVMusicAudioQualityViewController
+ (id)alertControllerWithMusicAudio:(id)a3 type:(int64_t)a4;
- (CGSize)preferredContentSize;
- (MPCPlayerResponseItemMusicAudio)musicAudio;
- (TVMusicAudioQualityViewController)initWithMusicAudio:(id)a3 type:(int64_t)a4;
- (UIImageView)badgeImageView;
- (UILabel)inputDetailsLabel;
- (UILabel)titleLabel;
- (UIView)bottomView;
- (id)_codecNameForFormatID:(unsigned int)a3;
- (id)_qualityNameForTier:(int64_t)a3;
- (int64_t)dialogType;
- (void)_showLosslessInfo;
- (void)_showTitleLabelWithText:(id)a3;
- (void)setBadgeImageView:(id)a3;
- (void)setBottomView:(id)a3;
- (void)setDialogType:(int64_t)a3;
- (void)setInputDetailsLabel:(id)a3;
- (void)setMusicAudio:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVMusicAudioQualityViewController

- (TVMusicAudioQualityViewController)initWithMusicAudio:(id)a3 type:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVMusicAudioQualityViewController;
  v8 = -[TVMusicAudioQualityViewController initWithNibName:bundle:](&v11, "initWithNibName:bundle:", 0LL, 0LL);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_musicAudio, a3);
    v9->_dialogType = a4;
  }

  return v9;
}

- (void)viewDidLoad
{
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___TVMusicAudioQualityViewController;
  -[TVMusicAudioQualityViewController viewDidLoad](&v35, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAudioQualityViewController view](self, "view"));
  [v3 setBackgroundColor:0];

  if (-[TVMusicAudioQualityViewController dialogType](self, "dialogType")) {
    v4 = @"DolbyLogo";
  }
  else {
    v4 = @"lossless";
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", v4));
  v6 = objc_alloc(&OBJC_CLASS___UIImageView);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 imageWithRenderingMode:2]);
  v8 = -[UIImageView initWithImage:](v6, "initWithImage:", v7);

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  -[UIImageView setContentMode:](v8, "setContentMode:", 1LL);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.65));
  -[UIImageView setTintColor:](v8, "setTintColor:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAudioQualityViewController view](self, "view"));
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 layer]);
  [v11 setAllowsGroupOpacity:0];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAudioQualityViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 layer]);
  [v13 setAllowsGroupBlending:0];

  uint64_t v14 = kCAFilterPlusL;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v8, "layer"));
  [v15 setCompositingFilter:v14];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAudioQualityViewController view](self, "view"));
  [v16 addSubview:v8];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v8, "heightAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 constraintEqualToConstant:128.0]);
  [v18 setActive:1];

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v8, "widthAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAudioQualityViewController view](self, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 layoutMarginsGuide]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 widthAnchor]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v19 constraintEqualToAnchor:v22]);
  [v23 setActive:1];

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](v8, "topAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAudioQualityViewController view](self, "view"));
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 topAnchor]);
  v27 = (void *)objc_claimAutoreleasedReturnValue([v24 constraintEqualToAnchor:v26 constant:46.0]);
  [v27 setActive:1];

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](v8, "centerXAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAudioQualityViewController view](self, "view"));
  v30 = (void *)objc_claimAutoreleasedReturnValue([v29 centerXAnchor]);
  v31 = (void *)objc_claimAutoreleasedReturnValue([v28 constraintEqualToAnchor:v30]);
  [v31 setActive:1];

  -[TVMusicAudioQualityViewController setBadgeImageView:](self, "setBadgeImageView:", v8);
  if (!-[TVMusicAudioQualityViewController dialogType](self, "dialogType"))
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAudioQualityViewController musicAudio](self, "musicAudio"));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v32 activeFormat]);
    v34 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicAudioQualityViewController _qualityNameForTier:]( self,  "_qualityNameForTier:",  [v33 tier]));
    -[TVMusicAudioQualityViewController _showTitleLabelWithText:](self, "_showTitleLabelWithText:", v34);

    -[TVMusicAudioQualityViewController _showLosslessInfo](self, "_showLosslessInfo");
  }
}

- (CGSize)preferredContentSize
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAudioQualityViewController view](self, "view"));
  [v3 setNeedsLayout];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAudioQualityViewController view](self, "view"));
  [v4 layoutIfNeeded];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAudioQualityViewController view](self, "view"));
  [v5 frame];
  double v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAudioQualityViewController bottomView](self, "bottomView"));
  [v8 frame];
  CGFloat v9 = CGRectGetMaxY(v13) + 36.0;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)_showTitleLabelWithText:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAudioQualityViewController titleLabel](self, "titleLabel"));

  if (!v5)
  {
    double v6 = objc_alloc_init(&OBJC_CLASS___UILabel);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAudioQualityViewController view](self, "view"));
    [v7 addSubview:v6];

    v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont _preferredFontForTextStyle:variant:]( &OBJC_CLASS___UIFont,  "_preferredFontForTextStyle:variant:",  UIFontTextStyleTitle2,  1024LL));
    -[UILabel setFont:](v6, "setFont:", v8);

    CGFloat v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[UILabel setTextColor:](v6, "setTextColor:", v9);

    -[UILabel setTextAlignment:](v6, "setTextAlignment:", 1LL);
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v6, "topAnchor"));
    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAudioQualityViewController badgeImageView](self, "badgeImageView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 bottomAnchor]);
    CGRect v13 = (void *)objc_claimAutoreleasedReturnValue([v10 constraintEqualToAnchor:v12 constant:46.0]);
    [v13 setActive:1];

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](v6, "centerXAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAudioQualityViewController view](self, "view"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 centerXAnchor]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v14 constraintEqualToAnchor:v16]);
    [v17 setActive:1];

    -[TVMusicAudioQualityViewController setTitleLabel:](self, "setTitleLabel:", v6);
  }

  id v18 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicAudioQualityViewController titleLabel](self, "titleLabel"));
  [v18 setText:v4];
}

- (void)_showLosslessInfo
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAudioQualityViewController musicAudio](self, "musicAudio"));
  id v30 = (id)objc_claimAutoreleasedReturnValue([v3 activeFormat]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v30 bitDepth]));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumberFormatter localizedStringFromNumber:numberStyle:]( &OBJC_CLASS___NSNumberFormatter,  "localizedStringFromNumber:numberStyle:",  v4,  0LL));

  double v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( NSNumber,  "numberWithDouble:",  (double)(uint64_t)[v30 sampleRate] / 1000.0));
  double v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumberFormatter localizedStringFromNumber:numberStyle:]( &OBJC_CLASS___NSNumberFormatter,  "localizedStringFromNumber:numberStyle:",  v6,  1LL));

  uint64_t v8 = objc_claimAutoreleasedReturnValue( -[TVMusicAudioQualityViewController _codecNameForFormatID:]( self,  "_codecNameForFormatID:",  [v30 codec]));
  CGFloat v9 = (void *)v8;
  if (v8) {
    double v10 = (__CFString *)v8;
  }
  else {
    double v10 = &stru_100279068;
  }
  double v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  CGRect v13 = (void *)objc_claimAutoreleasedReturnValue( [v12 localizedStringForKey:@"AudioQualityInformation" value:&stru_100279068 table:0]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v13, v5, v7, v11));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAudioQualityViewController inputDetailsLabel](self, "inputDetailsLabel"));
  if (!v15)
  {
    v16 = objc_alloc_init(&OBJC_CLASS___UILabel);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAudioQualityViewController view](self, "view"));
    [v17 addSubview:v16];

    -[UILabel setTextAlignment:](v16, "setTextAlignment:", 1LL);
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleBody));
    -[UILabel setFont:](v16, "setFont:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[UILabel setTextColor:](v16, "setTextColor:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v16, "topAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAudioQualityViewController titleLabel](self, "titleLabel"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 bottomAnchor]);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v20 constraintEqualToAnchor:v22 constant:15.0]);
    [v23 setActive:1];

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](v16, "centerXAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAudioQualityViewController view](self, "view"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 centerXAnchor]);
    v27 = (void *)objc_claimAutoreleasedReturnValue([v24 constraintEqualToAnchor:v26]);
    [v27 setActive:1];

    -[TVMusicAudioQualityViewController setInputDetailsLabel:](self, "setInputDetailsLabel:", v16);
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAudioQualityViewController inputDetailsLabel](self, "inputDetailsLabel"));
  [v28 setText:v14];

  [v30 tier];
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAudioQualityViewController inputDetailsLabel](self, "inputDetailsLabel"));
  -[TVMusicAudioQualityViewController setBottomView:](self, "setBottomView:", v29);
}

- (id)_codecNameForFormatID:(unsigned int)a3
{
  if (a3 == 1634492771)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v4 = (id)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:@"AudioLosslessCodec" value:&stru_100279068 table:0]);
  }

  else
  {
    uint64_t v11 = 0LL;
    memset(inSpecifier, 0, sizeof(inSpecifier));
    DWORD2(inSpecifier[0]) = a3;
    id outPropertyData = 0LL;
    UInt32 ioPropertyDataSize = 8;
    AudioFormatGetProperty(0x666E616Du, 0x28u, inSpecifier, &ioPropertyDataSize, &outPropertyData);
    id v4 = outPropertyData;
    if (!v4)
    {
      if (qword_1002BEBA0 != -1) {
        dispatch_once(&qword_1002BEBA0, &stru_10026DB18);
      }
      double v6 = (os_log_s *)qword_1002BEBA8;
      if (os_log_type_enabled((os_log_t)qword_1002BEBA8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v13 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Can't get codec name for codec ID 0x%lx",  buf,  0xCu);
      }
    }
  }

  return v4;
}

- (id)_qualityNameForTier:(int64_t)a3
{
  if (a3 == 3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v4 = v3;
    v5 = @"AudioQualityHiResLossless";
  }

  else
  {
    if (a3 != 2)
    {
      double v6 = 0LL;
      return v6;
    }

    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v4 = v3;
    v5 = @"AudioQualityLossless";
  }

  double v6 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:v5 value:&stru_100279068 table:0]);

  return v6;
}

+ (id)alertControllerWithMusicAudio:(id)a3 type:(int64_t)a4
{
  id v5 = a3;
  double v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  0LL,  0LL,  1LL));
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 localizedStringForKey:@"AudioQualityCancel" value:&stru_100279068 table:0]);
  CGFloat v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v8,  0LL,  &stru_10026DAB8));
  [v6 addAction:v9];

  double v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  0LL,  1LL,  &stru_10026DAD8));
  [v6 addAction:v10];

  if (!a4)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue( [v11 localizedStringForKey:@"AudioQualitySettings" value:&stru_100279068 table:0]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v12,  0LL,  &stru_10026DAF8));
    [v6 addAction:v13];
  }

  uint64_t v14 = -[TVMusicAudioQualityViewController initWithMusicAudio:type:]( objc_alloc(&OBJC_CLASS___TVMusicAudioQualityViewController),  "initWithMusicAudio:type:",  v5,  a4);

  [v6 _setHeaderContentViewController:v14];
  return v6;
}

- (MPCPlayerResponseItemMusicAudio)musicAudio
{
  return self->_musicAudio;
}

- (void)setMusicAudio:(id)a3
{
}

- (UIView)bottomView
{
  return self->_bottomView;
}

- (void)setBottomView:(id)a3
{
}

- (int64_t)dialogType
{
  return self->_dialogType;
}

- (void)setDialogType:(int64_t)a3
{
  self->_dialogType = a3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)inputDetailsLabel
{
  return self->_inputDetailsLabel;
}

- (void)setInputDetailsLabel:(id)a3
{
}

- (UIImageView)badgeImageView
{
  return self->_badgeImageView;
}

- (void)setBadgeImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
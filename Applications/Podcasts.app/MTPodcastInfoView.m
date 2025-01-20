@interface MTPodcastInfoView
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (IMExpandingLabel)descriptionView;
- (MTPodcastInfoView)initWithPodcastUuid:(id)a3;
- (MTPodcastInfoViewDelegate)delegate;
- (NSString)podcastUuid;
- (UIButton)settingsButton;
- (UIButton)shareButton;
- (UIImageView)imageView;
- (UILabel)authorLabel;
- (UILabel)titleLabel;
- (UIView)bottomSeparator;
- (UIView)separatorBelowAuthor;
- (id)metricsContentIdentifier;
- (id)metricsName;
- (void)_updateFonts;
- (void)addSubviews;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)dealloc;
- (void)descriptionViewTapped:(id)a3;
- (void)layoutSubviews;
- (void)setAuthorLabel:(id)a3;
- (void)setBottomSeparator:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDescriptionView:(id)a3;
- (void)setImageView:(id)a3;
- (void)setPodcastUuid:(id)a3;
- (void)setSeparatorBelowAuthor:(id)a3;
- (void)setSettingsButton:(id)a3;
- (void)setShareButton:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)update;
@end

@implementation MTPodcastInfoView

- (MTPodcastInfoView)initWithPodcastUuid:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MTPodcastInfoView;
  v6 = -[MTPodcastInfoView init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_podcastUuid, a3);
    -[MTPodcastInfoView addSubviews](v7, "addSubviews");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v8 addObserver:v7 selector:"contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[MTPodcastInfoView setBackgroundColor:](v7, "setBackgroundColor:", v9);

    -[MTPodcastInfoView setLayoutMarginsFollowReadableWidth:](v7, "setLayoutMarginsFollowReadableWidth:", 1LL);
  }

  return v7;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTPodcastInfoView;
  -[MTPodcastInfoView dealloc](&v4, "dealloc");
}

- (void)addSubviews
{
  v3 = objc_alloc_init(&OBJC_CLASS___UIImageView);
  imageView = self->_imageView;
  self->_imageView = v3;

  id v5 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  id v6 = [v5 CGColor];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_imageView, "layer"));
  [v7 setShadowColor:v6];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_imageView, "layer"));
  [v8 setShadowRadius:23.0];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_imageView, "layer"));
  objc_msgSend(v9, "setShadowOffset:", 0.0, 5.0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_imageView, "layer"));
  LODWORD(v11) = 1045220557;
  [v10 setShadowOpacity:v11];

  v12 = objc_alloc_init(&OBJC_CLASS___UILabel);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v12;

  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1LL);
  v14 = self->_titleLabel;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  -[UILabel setTextColor:](v14, "setTextColor:", v15);

  v16 = self->_titleLabel;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](v16, "setBackgroundColor:", v17);

  -[UILabel setLineBreakMode:](self->_titleLabel, "setLineBreakMode:", 0LL);
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0LL);
  v18 = objc_alloc_init(&OBJC_CLASS___UILabel);
  authorLabel = self->_authorLabel;
  self->_authorLabel = v18;

  -[UILabel setTextAlignment:](self->_authorLabel, "setTextAlignment:", 1LL);
  v20 = self->_authorLabel;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  -[UILabel setTextColor:](v20, "setTextColor:", v21);

  v22 = self->_authorLabel;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](v22, "setBackgroundColor:", v23);

  -[UILabel setLineBreakMode:](self->_authorLabel, "setLineBreakMode:", 0LL);
  -[UILabel setNumberOfLines:](self->_authorLabel, "setNumberOfLines:", 0LL);
  v24 = objc_alloc_init(&OBJC_CLASS___UIView);
  separatorBelowAuthor = self->_separatorBelowAuthor;
  self->_separatorBelowAuthor = v24;

  v26 = self->_separatorBelowAuthor;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor cellSeparatorColor](&OBJC_CLASS___UIColor, "cellSeparatorColor"));
  -[UIView setBackgroundColor:](v26, "setBackgroundColor:", v27);

  v28 = objc_alloc_init(&OBJC_CLASS___IMExpandingLabel);
  descriptionView = self->_descriptionView;
  self->_descriptionView = v28;

  -[IMExpandingLabel setScrollEnabled:](self->_descriptionView, "setScrollEnabled:", 0LL);
  -[IMExpandingLabel setNumberOfLines:](self->_descriptionView, "setNumberOfLines:", 4LL);
  -[IMExpandingLabel setExpanded:](self->_descriptionView, "setExpanded:", 0LL);
  v33 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "descriptionViewTapped:");
  -[UITapGestureRecognizer setDelegate:](v33, "setDelegate:", self);
  -[IMExpandingLabel addGestureRecognizer:](self->_descriptionView, "addGestureRecognizer:", v33);
  v30 = objc_alloc_init(&OBJC_CLASS___UIView);
  bottomSeparator = self->_bottomSeparator;
  self->_bottomSeparator = v30;

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor cellSeparatorColor](&OBJC_CLASS___UIColor, "cellSeparatorColor"));
  -[UIView setBackgroundColor:](self->_bottomSeparator, "setBackgroundColor:", v32);

  -[MTPodcastInfoView _updateFonts](self, "_updateFonts");
  -[MTPodcastInfoView addSubview:](self, "addSubview:", self->_imageView);
  -[MTPodcastInfoView addSubview:](self, "addSubview:", self->_titleLabel);
  -[MTPodcastInfoView addSubview:](self, "addSubview:", self->_authorLabel);
  -[MTPodcastInfoView addSubview:](self, "addSubview:", self->_separatorBelowAuthor);
  -[MTPodcastInfoView addSubview:](self, "addSubview:", self->_descriptionView);
  -[MTPodcastInfoView addSubview:](self, "addSubview:", self->_bottomSeparator);
  -[MTPodcastInfoView update](self, "update");
}

- (void)layoutSubviews
{
  v46.receiver = self;
  v46.super_class = (Class)&OBJC_CLASS___MTPodcastInfoView;
  -[MTPodcastInfoView layoutSubviews](&v46, "layoutSubviews");
  -[MTPodcastInfoView bounds](self, "bounds");
  double Width = CGRectGetWidth(v47);
  double v4 = Width + -30.0;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", Width + -30.0, 3.40282347e38);
  double v6 = v5;
  double v8 = v7;
  double v9 = IMRoundToPixel(fmax((Width - v5) * 0.5, 15.0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_titleLabel, "font"));
  objc_msgSend(v10, "mt_offsetFromCapHeightToAscent");
  double v12 = IMRoundToPixel(10.0 - v11);

  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v9, v12, v6, v8);
  -[UILabel sizeThatFits:](self->_authorLabel, "sizeThatFits:", Width + -30.0, 3.40282347e38);
  double v14 = v13;
  double v16 = v15;
  double v17 = IMRoundToPixel(fmax((Width - v13) * 0.5, 15.0));
  -[UILabel frame](self->_titleLabel, "frame");
  double MaxY = CGRectGetMaxY(v48);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v19 scale];
  double v21 = v20;

  -[UILabel setFrame:](self->_authorLabel, "setFrame:", v17, MaxY + 1.0 / v21, v14, v16);
  -[UILabel frame](self->_authorLabel, "frame");
  double v22 = CGRectGetMaxY(v49);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_authorLabel, "font"));
  objc_msgSend(v23, "mt_offsetFromCapHeightToAscent");
  double v25 = IMRoundToPixel(v22 - v24 + 14.0);

  CGFloat v26 = Width + -15.0 + -15.0;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v27 scale];
  double v29 = v28;

  CGFloat v30 = 1.0 / v29;
  -[UIView setFrame:](self->_separatorBelowAuthor, "setFrame:", 15.0, v25, v26, v30);
  -[MTPodcastInfoView layoutMargins](self, "layoutMargins");
  double v32 = v31;
  -[MTPodcastInfoView layoutMargins](self, "layoutMargins");
  double v34 = v4 - (v32 + v33);
  -[IMExpandingLabel heightForWidth:](self->_descriptionView, "heightForWidth:", v34);
  double v36 = v35;
  -[MTPodcastInfoView layoutMargins](self, "layoutMargins");
  v50.origin.x = 15.0;
  double v38 = v37 + 15.0;
  v50.origin.y = v25;
  v50.size.width = v26;
  v50.size.height = v30;
  -[IMExpandingLabel setFrame:](self->_descriptionView, "setFrame:", v38, CGRectGetMaxY(v50) + 14.0, v34, v36);
  -[IMExpandingLabel frame](self->_descriptionView, "frame");
  CGFloat v39 = CGRectGetMaxY(v51) + 14.0;
  -[MTPodcastInfoView frame](self, "frame");
  double v41 = v40;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v42 scale];
  double v44 = v43;

  -[UIView setFrame:](self->_bottomSeparator, "setFrame:", 0.0, v39, v41, 1.0 / v44);
  -[MTPodcastInfoView frame](self, "frame");
  -[MTPodcastInfoView setFrame:](self, "setFrame:", 0.0, 0.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastInfoView delegate](self, "delegate"));
  [v45 podcastInfoViewDidExpand:self];
}

- (void)contentSizeCategoryDidChange:(id)a3
{
}

- (void)_updateFonts
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont mt_preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "mt_preferredFontForTextStyle:",  UIFontTextStyleBody));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v3);

  double v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont mt_preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "mt_preferredFontForTextStyle:",  UIFontTextStyleCaption1));
  -[UILabel setFont:](self->_authorLabel, "setFont:", v4);

  double v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont mt_preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "mt_preferredFontForTextStyle:",  UIFontTextStyleSubheadline));
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_settingsButton, "titleLabel"));
  [v6 setFont:v5];

  double v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont mt_preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "mt_preferredFontForTextStyle:",  UIFontTextStyleSubheadline));
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_shareButton, "titleLabel"));
  [v8 setFont:v7];

  id v9 = (id)objc_claimAutoreleasedReturnValue( +[UIFont mt_preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "mt_preferredFontForTextStyle:",  UIFontTextStyleSubheadline));
  -[IMExpandingLabel setFont:](self->_descriptionView, "setFont:", v9);
}

- (void)update
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mainQueueContext]);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastInfoView podcastUuid](self, "podcastUuid"));
  id v10 = (id)objc_claimAutoreleasedReturnValue([v4 podcastForUuid:v5]);

  double v6 = (void *)objc_claimAutoreleasedReturnValue([v10 title]);
  -[UILabel setText:](self->_titleLabel, "setText:", v6);

  double v7 = (void *)objc_claimAutoreleasedReturnValue([v10 author]);
  -[UILabel setText:](self->_authorLabel, "setText:", v7);

  double v8 = (void *)objc_claimAutoreleasedReturnValue([v10 itemDescription]);
  -[IMExpandingLabel setText:](self->_descriptionView, "setText:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "artworkWithSize:", 240.0, 240.0));
  -[UIImageView setImage:](self->_imageView, "setImage:", v9);

  -[MTPodcastInfoView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)descriptionViewTapped:(id)a3
{
  if ((-[IMExpandingLabel isExpanded](self->_descriptionView, "isExpanded", a3) & 1) == 0)
  {
    -[IMExpandingLabel setExpanded:](self->_descriptionView, "setExpanded:", 1LL);
    -[MTPodcastInfoView setNeedsLayout](self, "setNeedsLayout");
    -[MTPodcastInfoView layoutIfNeeded](self, "layoutIfNeeded");
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTPodcastInfoView delegate](self, "delegate"));
    [v4 podcastInfoViewWasTapped:self];
  }

- (id)metricsName
{
  return @"PodcastDetails";
}

- (id)metricsContentIdentifier
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mainQueueContext]);

  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastInfoView podcastUuid](self, "podcastUuid"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v4 podcastForUuid:v5]);

  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 metricsContentIdentifier]);
  return v7;
}

- (MTPodcastInfoViewDelegate)delegate
{
  return (MTPodcastInfoViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSString)podcastUuid
{
  return self->_podcastUuid;
}

- (void)setPodcastUuid:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)authorLabel
{
  return self->_authorLabel;
}

- (void)setAuthorLabel:(id)a3
{
}

- (UIView)separatorBelowAuthor
{
  return self->_separatorBelowAuthor;
}

- (void)setSeparatorBelowAuthor:(id)a3
{
}

- (UIButton)settingsButton
{
  return self->_settingsButton;
}

- (void)setSettingsButton:(id)a3
{
}

- (UIButton)shareButton
{
  return self->_shareButton;
}

- (void)setShareButton:(id)a3
{
}

- (IMExpandingLabel)descriptionView
{
  return self->_descriptionView;
}

- (void)setDescriptionView:(id)a3
{
}

- (UIView)bottomSeparator
{
  return self->_bottomSeparator;
}

- (void)setBottomSeparator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
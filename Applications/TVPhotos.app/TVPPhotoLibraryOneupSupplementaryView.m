@interface TVPPhotoLibraryOneupSupplementaryView
- (NSDate)creationDate;
- (NSString)sharedLibraryStatus;
- (TVPPhotoLibraryOneupSupplementaryView)init;
- (UILabel)viewSubtitle;
- (UILabel)viewTitle;
- (id)_formattedDateAndTimestampFromDate:(id)a3 mode:(int64_t)a4;
- (void)_configureSupplementaryViewControls;
- (void)layoutSubviews;
- (void)setCreationDate:(id)a3;
- (void)setSharedLibraryStatus:(id)a3;
- (void)setViewSubtitle:(id)a3;
- (void)setViewTitle:(id)a3;
@end

@implementation TVPPhotoLibraryOneupSupplementaryView

- (TVPPhotoLibraryOneupSupplementaryView)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVPPhotoLibraryOneupSupplementaryView;
  v2 = -[TVPPhotoLibraryOneupSupplementaryView init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[TVPPhotoLibraryOneupSupplementaryView _configureSupplementaryViewControls]( v2,  "_configureSupplementaryViewControls");
  }
  return v3;
}

- (void)setCreationDate:(id)a3
{
  v8 = (NSDate *)a3;
  objc_super v5 = self->_creationDate;
  if (v5 == v8)
  {
  }

  else
  {
    v6 = v5;
    unsigned __int8 v7 = -[NSDate isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_creationDate, a3);
      -[TVPPhotoLibraryOneupSupplementaryView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)setSharedLibraryStatus:(id)a3
{
  v8 = (NSString *)a3;
  objc_super v5 = self->_sharedLibraryStatus;
  if (v5 == v8)
  {
  }

  else
  {
    v6 = v5;
    unsigned __int8 v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_sharedLibraryStatus, a3);
      -[TVPPhotoLibraryOneupSupplementaryView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)layoutSubviews
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___TVPPhotoLibraryOneupSupplementaryView;
  -[TVPPhotoLibraryOneupSupplementaryView layoutSubviews](&v25, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v3 bounds];
  double v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoLibraryOneupSupplementaryView sharedLibraryStatus](self, "sharedLibraryStatus"));
  id v7 = [v6 length];
  creationDate = self->_creationDate;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVPPhotoLibraryOneupSupplementaryView _formattedDateAndTimestampFromDate:mode:]( self,  "_formattedDateAndTimestampFromDate:mode:",  creationDate,  2LL));
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVPPhotoLibraryOneupSupplementaryView _formattedDateAndTimestampFromDate:mode:]( self,  "_formattedDateAndTimestampFromDate:mode:",  creationDate,  0LL));
    uint64_t v10 = objc_claimAutoreleasedReturnValue( -[TVPPhotoLibraryOneupSupplementaryView _formattedDateAndTimestampFromDate:mode:]( self,  "_formattedDateAndTimestampFromDate:mode:",  self->_creationDate,  1LL));

    v6 = (void *)v10;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager bodyFont](&OBJC_CLASS___TVPThemeManager, "bodyFont"));
  +[TVPPhotoUtilities getAttributedTextSize:font:maxWidth:]( &OBJC_CLASS___TVPPhotoUtilities,  "getAttributedTextSize:font:maxWidth:",  v9,  v11,  v5);
  double v13 = v12;
  double v15 = v14;

  -[UILabel setText:](self->_viewTitle, "setText:", v9);
  float v16 = (v5 - v13) * 0.5;
  -[UILabel setFrame:](self->_viewTitle, "setFrame:", floorf(v16), 0.0, v13, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager caption1Font](&OBJC_CLASS___TVPThemeManager, "caption1Font"));
  +[TVPPhotoUtilities getAttributedTextSize:font:maxWidth:]( &OBJC_CLASS___TVPPhotoUtilities,  "getAttributedTextSize:font:maxWidth:",  v6,  v17,  v5);
  double v19 = v18;
  double v21 = v20;

  -[UILabel setText:](self->_viewSubtitle, "setText:", v6);
  viewSubtitle = self->_viewSubtitle;
  float v23 = (v5 - v19) * 0.5;
  double v24 = floorf(v23);
  -[UILabel frame](self->_viewTitle, "frame");
  -[UILabel setFrame:](viewSubtitle, "setFrame:", v24, CGRectGetMaxY(v26) + 5.0, v19, v21);
}

- (void)_configureSupplementaryViewControls
{
  v3 = objc_alloc_init(&OBJC_CLASS___UILabel);
  viewTitle = self->_viewTitle;
  self->_viewTitle = v3;

  double v5 = self->_viewTitle;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  -[UILabel setTextColor:](v5, "setTextColor:", v6);

  id v7 = self->_viewTitle;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](v7, "setBackgroundColor:", v8);

  -[UILabel setTextAlignment:](self->_viewTitle, "setTextAlignment:", 1LL);
  v9 = self->_viewTitle;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager bodyFont](&OBJC_CLASS___TVPThemeManager, "bodyFont"));
  -[UILabel setFont:](v9, "setFont:", v10);

  -[TVPPhotoLibraryOneupSupplementaryView addSubview:](self, "addSubview:", self->_viewTitle);
  v11 = objc_alloc_init(&OBJC_CLASS___UILabel);
  viewSubtitle = self->_viewSubtitle;
  self->_viewSubtitle = v11;

  double v13 = self->_viewSubtitle;
  double v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  -[UILabel setTextColor:](v13, "setTextColor:", v14);

  double v15 = self->_viewSubtitle;
  float v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](v15, "setBackgroundColor:", v16);

  -[UILabel setTextAlignment:](self->_viewSubtitle, "setTextAlignment:", 1LL);
  v17 = self->_viewSubtitle;
  double v18 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager caption1Font](&OBJC_CLASS___TVPThemeManager, "caption1Font"));
  -[UILabel setFont:](v17, "setFont:", v18);

  -[TVPPhotoLibraryOneupSupplementaryView addSubview:](self, "addSubview:", self->_viewSubtitle);
}

- (id)_formattedDateAndTimestampFromDate:(id)a3 mode:(int64_t)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  id v7 = v6;
  if (a4 == 1) {
    uint64_t v8 = 0LL;
  }
  else {
    uint64_t v8 = 3LL;
  }
  if (a4 != 1) {
    a4 = a4 != 0;
  }
  -[NSDateFormatter setDateStyle:](v6, "setDateStyle:", v8);
  -[NSDateFormatter setTimeStyle:](v7, "setTimeStyle:", a4);
  if (v5) {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v7, "stringFromDate:", v5));
  }
  else {
    v9 = 0LL;
  }

  return v9;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSString)sharedLibraryStatus
{
  return self->_sharedLibraryStatus;
}

- (UILabel)viewTitle
{
  return self->_viewTitle;
}

- (void)setViewTitle:(id)a3
{
}

- (UILabel)viewSubtitle
{
  return self->_viewSubtitle;
}

- (void)setViewSubtitle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
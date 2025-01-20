@interface MTSwitchCell
+ (id)titleFont;
- (BOOL)_loadArtworkFromMemoryCache;
- (BOOL)_showsArtwork;
- (BOOL)customiseLabelAndSeparatorInsets;
- (BOOL)isPlaceholder;
- (NSString)artworkKey;
- (UISwitch)toggle;
- (id)imageProvider;
- (id)toggleChanged;
- (unint64_t)maximumNumberOfTextLines;
- (void)_asyncFetchArtworkDidLoadImage:(id)a3 forArtworkKey:(id)a4;
- (void)_clearAndHideArtworkView;
- (void)_fetchArtwork;
- (void)_fetchArtworkInBackground;
- (void)_layoutContentViewSubviews;
- (void)_updateSeparatorInsets;
- (void)layoutSubviews;
- (void)setArtworkKey:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setMaximumNumberOfTextLines:(unint64_t)a3;
- (void)setToggle:(id)a3;
- (void)setToggleChanged:(id)a3;
- (void)setupCell;
- (void)toggleChanged:(id)a3;
- (void)toggleOn:(BOOL)a3;
- (void)toggleOn:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation MTSwitchCell

- (void)toggleOn:(BOOL)a3
{
}

- (void)toggleOn:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTSwitchCell toggle](self, "toggle"));
  [v6 setOn:v5 animated:v4];
}

- (void)setArtworkKey:(id)a3
{
  p_artworkKey = &self->_artworkKey;
  id v6 = a3;
  if ((-[NSString isEqual:](*p_artworkKey, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_artworkKey, a3);
    if (-[NSString length](*p_artworkKey, "length")) {
      -[MTSwitchCell _fetchArtwork](self, "_fetchArtwork");
    }
    else {
      -[MTSwitchCell _clearAndHideArtworkView](self, "_clearAndHideArtworkView");
    }
  }
}

- (void)setMaximumNumberOfTextLines:(unint64_t)a3
{
  if (a3 <= 1) {
    unint64_t v3 = 1LL;
  }
  else {
    unint64_t v3 = a3;
  }
  if (self->_maximumNumberOfTextLines != v3)
  {
    self->_maximumNumberOfTextLines = v3;
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTSwitchCell textLabel](self, "textLabel"));
    [v5 setNumberOfLines:self->_maximumNumberOfTextLines];

    -[MTSwitchCell setNeedsLayout](self, "setNeedsLayout");
  }

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTSwitchCell;
  -[MTTableViewCell layoutSubviews](&v3, "layoutSubviews");
  -[MTSwitchCell _layoutContentViewSubviews](self, "_layoutContentViewSubviews");
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTSwitchCell;
  -[MTTableViewCell setEnabled:](&v6, "setEnabled:");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTSwitchCell toggle](self, "toggle"));
  [v5 setEnabled:v3];
}

- (void)setupCell
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MTSwitchCell;
  -[MTTableViewCell setupCell](&v9, "setupCell");
  BOOL v3 = objc_opt_new(&OBJC_CLASS___UISwitch);
  -[MTSwitchCell setToggle:](self, "setToggle:", v3);
  -[UISwitch addTarget:action:forControlEvents:]( v3,  "addTarget:action:forControlEvents:",  self,  "toggleChanged:",  4096LL);
  -[MTSwitchCell setAccessoryView:](self, "setAccessoryView:", v3);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTSwitchCell textLabel](self, "textLabel"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor cellTextColor](&OBJC_CLASS___UIColor, "cellTextColor"));
  [v4 setTextColor:v5];

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSwitchCell textLabel](self, "textLabel"));
  id v7 = [(id)objc_opt_class(self) titleFont];
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  [v6 setFont:v8];
}

- (BOOL)customiseLabelAndSeparatorInsets
{
  return 1;
}

- (void)_updateSeparatorInsets
{
  if (-[MTSwitchCell customiseLabelAndSeparatorInsets](self, "customiseLabelAndSeparatorInsets"))
  {
    unsigned int v3 = -[MTSwitchCell mt_isRTL](self, "mt_isRTL");
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTSwitchCell contentView](self, "contentView"));
    [v4 layoutMargins];
    double v6 = v5;
    double v8 = v7;

    if (v3) {
      double v6 = v8;
    }
    unsigned int v9 = -[MTSwitchCell _showsArtwork](self, "_showsArtwork");
    double v10 = 64.0;
    if (!v9) {
      double v10 = 0.0;
    }
    -[MTSwitchCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v6 + v10, 0.0, 0.0);
  }

- (void)_layoutContentViewSubviews
{
  id v3 = -[MTSwitchCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  id v52 = (id)objc_claimAutoreleasedReturnValue(-[MTSwitchCell contentView](self, "contentView"));
  [v52 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v52 layoutMargins];
  double v13 = v12;
  id v14 = [v52 layoutMargins];
  uint64_t v16 = ((uint64_t (*)(id, double, double, double, double, double, double, double, double))UIRectInset)( v14,  v5,  v7,  v9,  v11,  0.0,  v13,  0.0,  v15);
  if (v3 == (id)1)
  {
    double v21 = 0.0;
    double v22 = 10.0;
  }

  else
  {
    double v21 = 10.0;
    double v22 = 0.0;
  }

  double v23 = UIRectInset(v16, v17, v18, v19, v20, 0.0, v21, 0.0, v22);
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTSwitchCell artworkKey](self, "artworkKey"));
  id v31 = [v30 length];

  if (v31)
  {
    v53.origin.x = v23;
    v53.origin.y = v25;
    v53.size.width = v27;
    v53.size.height = v29;
    CGFloat Height = CGRectGetHeight(v53);
    double v33 = sub_1000418B0(v3 == (id)1, 1LL, 1LL, 0.0, (Height + -48.0) * 0.5, 48.0, 48.0, v23, v25, v27, v29);
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[MTSwitchCell imageView](self, "imageView"));
    objc_msgSend(v40, "setFrame:", v33, v35, v37, v39);

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[MTSwitchCell imageView](self, "imageView"));
    v42 = (void *)objc_claimAutoreleasedReturnValue([v41 superview]);

    if (!v42)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[MTSwitchCell imageView](self, "imageView"));
      [v52 addSubview:v44];

      v45 = (void *)objc_claimAutoreleasedReturnValue(-[MTSwitchCell imageView](self, "imageView"));
      [v45 setClipsToBounds:1];
    }

    if (v3 == (id)1)
    {
      double v46 = 64.0;
      double v47 = 0.0;
    }

    else
    {
      double v47 = 64.0;
      double v46 = 0.0;
    }

    double v23 = UIRectInset(v43, v23, v25, v27, v29, 0.0, v46, 0.0, v47);
    CGFloat v25 = v48;
    CGFloat v27 = v49;
    CGFloat v29 = v50;
  }

  if (-[MTSwitchCell customiseLabelAndSeparatorInsets](self, "customiseLabelAndSeparatorInsets"))
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[MTSwitchCell textLabel](self, "textLabel"));
    objc_msgSend(v51, "setFrame:", v23, v25, v27, v29);
  }
}

- (BOOL)_showsArtwork
{
  return -[NSString length](self->_artworkKey, "length") != 0;
}

- (void)_clearAndHideArtworkView
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[MTSwitchCell _artworkView](self, "_artworkView"));
  [v2 setImage:0];
  [v2 setHidden:1];
}

- (void)_fetchArtwork
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTSwitchCell artworkKey](self, "artworkKey"));
  id v4 = [v3 length];

  if (v4)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTSwitchCell _artworkView](self, "_artworkView"));
    objc_msgSend(v5, "mt_configureForDisplayingArtworkWithRadius:", 3.0);
    [v5 setHidden:0];
    if (!-[MTSwitchCell _loadArtworkFromMemoryCache](self, "_loadArtworkFromMemoryCache"))
    {
      [v5 setImage:0];
      -[MTSwitchCell _fetchArtworkInBackground](self, "_fetchArtworkInBackground");
    }
  }

- (void)_fetchArtworkInBackground
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTSwitchCell artworkKey](self, "artworkKey"));
  objc_initWeak(&location, self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage defaultPodcastArtwork](&OBJC_CLASS___UIImage, "defaultPodcastArtwork"));
  -[MTSwitchCell _asyncFetchArtworkDidLoadImage:forArtworkKey:]( self,  "_asyncFetchArtworkDidLoadImage:forArtworkKey:",  v4,  v3);

  if (-[MTSwitchCell isPlaceholder](self, "isPlaceholder"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTSwitchCell imageProvider](self, "imageProvider"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10001F984;
    v8[3] = &unk_100240958;
    double v6 = v8;
    double v7 = &v9;
    objc_copyWeak(&v9, &location);
    v8[4] = v3;
    objc_msgSend(v5, "placeholderWithSize:completionHandler:", v8, 48.0, 48.0);
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTSwitchCell imageProvider](self, "imageProvider"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10001F8F4;
    v10[3] = &unk_100240958;
    double v6 = v10;
    double v7 = &v12;
    objc_copyWeak(&v12, &location);
    id v11 = v3;
    objc_msgSend(v5, "artworkForShow:size:completionHandler:", v11, v10, 48.0, 48.0);
  }

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (void)_asyncFetchArtworkDidLoadImage:(id)a3 forArtworkKey:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10001FAC4;
  v9[3] = &unk_100240980;
  v9[4] = self;
  id v10 = a4;
  id v11 = v6;
  id v7 = v6;
  id v8 = v10;
  +[NSThread mainThread:](&OBJC_CLASS___NSThread, "mainThread:", v9);
}

- (BOOL)_loadArtworkFromMemoryCache
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTSwitchCell artworkKey](self, "artworkKey"));
  if (v3
    && !-[MTSwitchCell isPlaceholder](self, "isPlaceholder")
    && (id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTSwitchCell imageProvider](self, "imageProvider")),
        id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "legacyUICachedArtworkForPodcastUuid:withSize:", v3, 48.0, 48.0)),
        v4,
        v5))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSwitchCell imageView](self, "imageView"));
    [v6 setImage:v5];

    -[MTSwitchCell setNeedsLayout](self, "setNeedsLayout");
    BOOL v7 = 1;
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isPlaceholder
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTSwitchCell artworkKey](self, "artworkKey"));
  unsigned __int8 v3 = [v2 isEqualToString:kMTLibraryDefaultImageKey];

  return v3;
}

+ (id)titleFont
{
  return +[UIFont mt_preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "mt_preferredFontForTextStyle:",  UIFontTextStyleBody);
}

- (void)toggleChanged:(id)a3
{
  toggleChanged = (void (**)(id, id))self->_toggleChanged;
  if (toggleChanged) {
    toggleChanged[2](toggleChanged, [a3 isOn]);
  }
}

- (id)imageProvider
{
  imageProvider = self->_imageProvider;
  if (!imageProvider)
  {
    id v4 = (PUIObjCArtworkProvider *)objc_claimAutoreleasedReturnValue( +[PUIObjCArtworkProvider uiShared]( &OBJC_CLASS___PUIObjCArtworkProvider,  "uiShared"));
    id v5 = self->_imageProvider;
    self->_imageProvider = v4;

    imageProvider = self->_imageProvider;
  }

  return imageProvider;
}

- (id)toggleChanged
{
  return self->_toggleChanged;
}

- (void)setToggleChanged:(id)a3
{
}

- (NSString)artworkKey
{
  return self->_artworkKey;
}

- (unint64_t)maximumNumberOfTextLines
{
  return self->_maximumNumberOfTextLines;
}

- (UISwitch)toggle
{
  return self->_toggle;
}

- (void)setToggle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
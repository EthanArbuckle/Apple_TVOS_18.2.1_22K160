@interface MTTVPodcastInfoViewController
- (MTPodcast)podcast;
- (MTTVPodcastInfoViewController)initWithPodcast:(id)a3;
- (TVMTExpandingTextView)descriptionView;
- (UIImageView)artworkView;
- (id)_fetchArtwork;
- (id)_fetchDescription;
- (void)_update;
- (void)_updateColors;
- (void)loadView;
- (void)setArtworkView:(id)a3;
- (void)setDescriptionView:(id)a3;
- (void)setPodcast:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateDescriptionTextColor;
- (void)viewDidLayoutSubviews;
@end

@implementation MTTVPodcastInfoViewController

- (MTTVPodcastInfoViewController)initWithPodcast:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MTTVPodcastInfoViewController;
  v6 = -[MTTVPodcastInfoViewController init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_podcast, a3);
  }

  return v7;
}

- (void)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTTVPodcastInfoViewController;
  -[MTTVPodcastInfoViewController loadView](&v7, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastInfoViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastInfoViewController artworkView](self, "artworkView"));
  [v3 addSubview:v4];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastInfoViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastInfoViewController descriptionView](self, "descriptionView"));
  [v5 addSubview:v6];

  -[MTTVPodcastInfoViewController _update](self, "_update");
}

- (void)viewDidLayoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___MTTVPodcastInfoViewController;
  -[MTTVPodcastInfoViewController viewDidLayoutSubviews](&v24, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastInfoViewController view](self, "view"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = CGRectCenterRectInRect(CGRectZero.origin.x, CGRectZero.origin.y, 640.0, 640.0, v5, v7, v9, v11);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastInfoViewController artworkView](self, "artworkView"));
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

  v25.origin.x = v5;
  v25.origin.y = v7;
  v25.size.width = v9;
  v25.size.height = v11;
  double Height = CGRectGetHeight(v25);
  v26.origin.x = v12;
  v26.origin.y = v14;
  v26.size.width = v16;
  v26.size.height = v18;
  double v21 = Height - CGRectGetMaxY(v26) + -100.0;
  v27.origin.x = v12;
  v27.origin.y = v14;
  v27.size.width = v16;
  v27.size.height = v18;
  CGFloat v22 = CGRectGetMaxY(v27) + 50.0;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastInfoViewController descriptionView](self, "descriptionView"));
  objc_msgSend(v23, "setFrame:", v12, v22, v16, v21);
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTVPodcastInfoViewController;
  id v4 = a3;
  -[MTTVPodcastInfoViewController traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastInfoViewController traitCollection](self, "traitCollection", v8.receiver, v8.super_class));
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    -[MTTVPodcastInfoViewController _updateColors](self, "_updateColors");
  }
}

- (void)setPodcast:(id)a3
{
}

- (void)_update
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastInfoViewController _fetchArtwork](self, "_fetchArtwork"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastInfoViewController artworkView](self, "artworkView"));
  [v4 setImage:v3];

  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastInfoViewController _fetchDescription](self, "_fetchDescription"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastInfoViewController descriptionView](self, "descriptionView"));
  [v6 setDescriptionText:v5];

  -[MTTVPodcastInfoViewController updateDescriptionTextColor](self, "updateDescriptionTextColor");
}

- (id)_fetchArtwork
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastInfoViewController podcast](self, "podcast"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "artworkWithSize:", 640.0, 640.0));

  return v3;
}

- (id)_fetchDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastInfoViewController podcast](self, "podcast"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bestDescription]);

  if ([v3 length])
  {
    NSAttributedStringKey v8 = NSFontAttributeName;
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleBody));
    double v9 = v4;
    double v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));

    id v6 = -[NSAttributedString initWithString:attributes:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:attributes:",  v3,  v5);
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (void)_updateColors
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastInfoViewController traitCollection](self, "traitCollection"));
  BOOL v4 = [v3 userInterfaceStyle] == (id)2;

  id v5 = objc_claimAutoreleasedReturnValue( +[UIColor artworkBorderColorForDarkBackground:]( &OBJC_CLASS___UIColor, "artworkBorderColorForDarkBackground:", v4));
  id v6 = [v5 CGColor];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastInfoViewController artworkView](self, "artworkView"));
  NSAttributedStringKey v8 = (void *)objc_claimAutoreleasedReturnValue([v7 layer]);
  [v8 setBorderColor:v6];

  -[MTTVPodcastInfoViewController updateDescriptionTextColor](self, "updateDescriptionTextColor");
}

- (void)updateDescriptionTextColor
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastInfoViewController traitCollection](self, "traitCollection"));
  BOOL v4 = [v3 userInterfaceStyle] == (id)2;

  id v13 = (id)objc_claimAutoreleasedReturnValue( +[UIColor primaryTextColorForDarkBackground:]( &OBJC_CLASS___UIColor,  "primaryTextColorForDarkBackground:",  v4));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastInfoViewController descriptionView](self, "descriptionView"));
  [v5 setDescriptionTextColor:v13];

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor primaryTextColorForDarkBackground:]( &OBJC_CLASS___UIColor,  "primaryTextColorForDarkBackground:",  0LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastInfoViewController descriptionView](self, "descriptionView"));
  [v7 setDescriptionTextHighlightColor:v6];

  NSAttributedStringKey v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastInfoViewController descriptionView](self, "descriptionView"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 descriptionText]);
  id v10 = [v9 mutableCopy];

  objc_msgSend(v10, "addAttribute:value:range:", NSForegroundColorAttributeName, v13, 0, objc_msgSend(v10, "length"));
  id v11 = [v10 copy];
  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastInfoViewController descriptionView](self, "descriptionView"));
  [v12 setDescriptionText:v11];
}

- (UIImageView)artworkView
{
  artworkView = self->_artworkView;
  if (!artworkView)
  {
    BOOL v4 = objc_opt_new(&OBJC_CLASS___UIImageView);
    id v5 = self->_artworkView;
    self->_artworkView = v4;

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v6 scale];
    double v8 = v7;

    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_artworkView, "layer"));
    [v9 setBorderWidth:1.0 / v8];

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_artworkView, "layer"));
    [v10 setMasksToBounds:1];

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_artworkView, "layer"));
    [v11 setCornerRadius:14.0];

    artworkView = self->_artworkView;
  }

  return artworkView;
}

- (TVMTExpandingTextView)descriptionView
{
  descriptionView = self->_descriptionView;
  if (!descriptionView)
  {
    BOOL v4 = objc_opt_new(&OBJC_CLASS___TVMTExpandingTextView);
    id v5 = self->_descriptionView;
    self->_descriptionView = v4;

    id v6 = self->_descriptionView;
    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[TVMTExpandingTextView setHighlightBackgroundColor:](v6, "setHighlightBackgroundColor:", v7);

    -[TVMTExpandingTextView setMaximumNumberOfLines:](self->_descriptionView, "setMaximumNumberOfLines:", 4LL);
    objc_initWeak(&location, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000C7774;
    v9[3] = &unk_1002423A0;
    objc_copyWeak(&v10, &location);
    -[TVMTExpandingTextView setSelectionHandler:](self->_descriptionView, "setSelectionHandler:", v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    descriptionView = self->_descriptionView;
  }

  return descriptionView;
}

- (MTPodcast)podcast
{
  return self->_podcast;
}

- (void)setArtworkView:(id)a3
{
}

- (void)setDescriptionView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
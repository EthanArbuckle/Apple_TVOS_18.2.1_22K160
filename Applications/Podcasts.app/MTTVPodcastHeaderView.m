@interface MTTVPodcastHeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTTVPodcastHeaderView)init;
- (MTTVPodcastHeaderView)initWithPodcast:(id)a3 delegate:(id)a4;
- (MTTVPodcastHeaderViewDelegate)delegate;
- (NSString)uuid;
- (void)configureSubviews;
- (void)dealloc;
- (void)followButtonPressed:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setObserver;
- (void)setPodcast:(id)a3;
- (void)setPropertiesFromPodcast:(id)a3;
- (void)setUuid:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateFollowButton;
- (void)updateTextColors;
@end

@implementation MTTVPodcastHeaderView

- (MTTVPodcastHeaderView)init
{
  return -[MTTVPodcastHeaderView initWithPodcast:delegate:](self, "initWithPodcast:delegate:", 0LL, 0LL);
}

- (MTTVPodcastHeaderView)initWithPodcast:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MTTVPodcastHeaderView;
  v8 = -[MTTVPodcastHeaderView init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[MTTVPodcastHeaderView setPropertiesFromPodcast:](v8, "setPropertiesFromPodcast:", v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
    -[MTTVPodcastHeaderView configureSubviews](v9, "configureSubviews");
  }

  return v9;
}

- (void)configureSubviews
{
  v3 = objc_opt_new(&OBJC_CLASS___UILabel);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont mt_preferredFontForTextStyle:addingSymbolicTraits:]( &OBJC_CLASS___UIFont,  "mt_preferredFontForTextStyle:addingSymbolicTraits:",  UIFontTextStyleTitle2,  2LL));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v5);

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 2LL);
  -[UILabel setLineBreakMode:](self->_titleLabel, "setLineBreakMode:", 4LL);
  -[UILabel setText:](self->_titleLabel, "setText:", self->_title);
  -[MTTVPodcastHeaderView addSubview:](self, "addSubview:", self->_titleLabel);
  id v6 = objc_opt_new(&OBJC_CLASS___UILabel);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont mt_preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "mt_preferredFontForTextStyle:",  UIFontTextStyleTitle3));
  -[UILabel setFont:](self->_subtitleLabel, "setFont:", v8);

  -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 2LL);
  -[UILabel setLineBreakMode:](self->_subtitleLabel, "setLineBreakMode:", 4LL);
  -[UILabel setText:](self->_subtitleLabel, "setText:", self->_author);
  -[MTTVPodcastHeaderView addSubview:](self, "addSubview:", self->_subtitleLabel);
  v9 = objc_opt_new(&OBJC_CLASS___UILabel);
  genreLabel = self->_genreLabel;
  self->_genreLabel = v9;

  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont mt_preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "mt_preferredFontForTextStyle:",  UIFontTextStyleTitle3));
  -[UILabel setFont:](self->_genreLabel, "setFont:", v11);

  -[UILabel setNumberOfLines:](self->_genreLabel, "setNumberOfLines:", 2LL);
  -[UILabel setLineBreakMode:](self->_genreLabel, "setLineBreakMode:", 4LL);
  -[UILabel setText:](self->_genreLabel, "setText:", self->_category);
  -[MTTVPodcastHeaderView addSubview:](self, "addSubview:", self->_genreLabel);
  v12 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](&OBJC_CLASS___UIButton, "buttonWithType:", 1LL));
  followButton = self->_followButton;
  self->_followButton = v12;

  -[UIButton addTarget:action:forControlEvents:]( self->_followButton,  "addTarget:action:forControlEvents:",  self,  "followButtonPressed:",  0x2000LL);
  -[MTTVPodcastHeaderView updateFollowButton](self, "updateFollowButton");
  -[MTTVPodcastHeaderView addSubview:](self, "addSubview:", self->_followButton);
  -[MTTVPodcastHeaderView updateTextColors](self, "updateTextColors");
}

- (void)setPodcast:(id)a3
{
  id v4 = a3;
  -[MTTVPodcastHeaderView setPropertiesFromPodcast:](self, "setPropertiesFromPodcast:", v4);
  -[MTTVPodcastHeaderView setObserver](self, "setObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);
  -[UILabel setText:](self->_titleLabel, "setText:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 author]);
  -[UILabel setText:](self->_subtitleLabel, "setText:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 category]);
  -[UILabel setText:](self->_genreLabel, "setText:", v7);

  -[MTTVPodcastHeaderView updateFollowButton](self, "updateFollowButton");
  -[MTTVPodcastHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setPropertiesFromPodcast:(id)a3
{
  id v4 = a3;
  v5 = (NSString *)objc_claimAutoreleasedReturnValue([v4 uuid]);
  uuid = self->_uuid;
  self->_uuid = v5;

  id v7 = (NSString *)objc_claimAutoreleasedReturnValue([v4 title]);
  title = self->_title;
  self->_title = v7;

  v9 = (NSString *)objc_claimAutoreleasedReturnValue([v4 author]);
  author = self->_author;
  self->_author = v9;

  objc_super v11 = (NSString *)objc_claimAutoreleasedReturnValue([v4 category]);
  category = self->_category;
  self->_category = v11;

  unsigned __int8 v13 = [v4 subscribed];
  self->_isFollowed = v13;
}

- (void)setObserver
{
  v3 = objc_alloc(&OBJC_CLASS___MTPropertyChangeQueryObserver);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForPodcastUUID:](&OBJC_CLASS___MTPodcast, "predicateForPodcastUUID:", self->_uuid));
  v5 = -[MTPropertyChangeQueryObserver initWithEntityName:predicate:]( v3,  "initWithEntityName:predicate:",  kMTPodcastEntityName,  v4);
  observer = self->_observer;
  self->_observer = v5;

  uint64_t v16 = kPodcastSubscribed;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  -[MTPropertyChangeQueryObserver setPropertyKeys:](self->_observer, "setPropertyKeys:", v7);

  objc_initWeak(&location, self);
  v8 = self->_observer;
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  v12 = sub_1000BC50C;
  unsigned __int8 v13 = &unk_100240440;
  objc_copyWeak(&v14, &location);
  id v9 = -[MTPropertyChangeQueryObserver addResultsChangedHandler:](v8, "addResultsChangedHandler:", &v10);
  -[MTPropertyChangeQueryObserver startObserving](self->_observer, "startObserving", v10, v11, v12, v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)updateFollowButton
{
  BOOL isFollowed = self->_isFollowed;
  followButton = self->_followButton;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v6 = v5;
  if (isFollowed) {
    id v7 = @"Unfollow";
  }
  else {
    id v7 = @"Follow";
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:v7 value:&stru_100248948 table:0]);
  -[UIButton setTitle:forState:](followButton, "setTitle:forState:", v8, 0LL);

  -[MTTVPodcastHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)followButtonPressed:(id)a3
{
  BOOL isFollowed = self->_isFollowed;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[PodcastsStateCoordinator shared](&OBJC_CLASS____TtC8Podcasts24PodcastsStateCoordinator, "shared", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastHeaderView uuid](self, "uuid"));
  if (isFollowed) {
    [v6 disableSubscriptionOnPodcastUUID:v5 from:3];
  }
  else {
    [v6 enableSubscriptionOnPodcastUUID:v5 from:3];
  }
}

- (void)updateTextColors
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastHeaderView traitCollection](self, "traitCollection"));
  BOOL v4 = [v3 userInterfaceStyle] == (id)2;

  id v5 = (id)objc_claimAutoreleasedReturnValue( +[UIColor primaryTextColorForDarkBackground:]( &OBJC_CLASS___UIColor,  "primaryTextColorForDarkBackground:",  v4));
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v5);
  -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:", v5);
  -[UILabel setTextColor:](self->_genreLabel, "setTextColor:", v5);
}

- (void)layoutSubviews
{
  v55.receiver = self;
  v55.super_class = (Class)&OBJC_CLASS___MTTVPodcastHeaderView;
  -[MTTVPodcastHeaderView layoutSubviews](&v55, "layoutSubviews");
  -[MTTVPodcastHeaderView bounds](self, "bounds");
  CGFloat v47 = v4;
  CGFloat v48 = v3;
  double v6 = v5;
  CGFloat v8 = v7;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v5, 1.79769313e308);
  CGFloat v10 = v9;
  -[MTTVPodcastHeaderView safeAreaInsets](self, "safeAreaInsets");
  double v12 = v11;
  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_titleLabel, "font"));
  [v13 lineHeight];
  CGFloat v15 = v12 - v14;

  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v6, 1.79769313e308);
  CGFloat v17 = v16;
  v56.origin.x = 0.0;
  double v49 = 0.0;
  double v53 = v15;
  double v54 = v10;
  v56.origin.y = v15;
  v56.size.width = v6;
  v56.size.height = v10;
  double MaxY = CGRectGetMaxY(v56);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_subtitleLabel, "font"));
  objc_msgSend(v19, "mt_offsetFromLastBaselineToBottom");
  double v21 = MaxY - v20;

  -[UILabel sizeThatFits:](self->_genreLabel, "sizeThatFits:", v6, 1.79769313e308);
  double v23 = v22;
  v57.origin.x = 0.0;
  v57.origin.y = v21;
  v57.size.width = v6;
  double v52 = v17;
  v57.size.height = v17;
  double v24 = CGRectGetMaxY(v57);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_genreLabel, "font"));
  objc_msgSend(v25, "mt_offsetFromLastBaselineToBottom");
  double v27 = v24 - v26;

  -[UIButton sizeThatFits:](self->_followButton, "sizeThatFits:", v6, 1.79769313e308);
  double v50 = v29;
  double v51 = v28;
  v58.origin.x = 0.0;
  v58.origin.y = v27;
  v58.size.width = v6;
  v58.size.height = v23;
  double v30 = CGRectGetMaxY(v58);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_genreLabel, "font"));
  objc_msgSend(v31, "mt_offsetFromLastBaselineToBottom");
  double v33 = v30 - v32 + 50.0;

  id v34 = -[MTTVPodcastHeaderView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  double v35 = 0.0;
  double v36 = 0.0;
  double v37 = 0.0;
  if (v34 == (id)1)
  {
    v59.origin.x = v48;
    v59.origin.y = v47;
    v59.size.width = v6;
    v59.size.height = v8;
    double MaxX = CGRectGetMaxX(v59);
    v60.origin.x = 0.0;
    v60.origin.y = v53;
    v60.size.width = v6;
    v60.size.height = v54;
    double v39 = MaxX - CGRectGetWidth(v60);
    v61.origin.x = 0.0;
    v61.origin.y = v53;
    v61.size.width = v6;
    v61.size.height = v54;
    double v46 = v39 - CGRectGetMinX(v61);
    v62.origin.x = v48;
    v62.origin.y = v47;
    v62.size.width = v6;
    v62.size.height = v8;
    double v40 = CGRectGetMaxX(v62);
    v63.origin.x = 0.0;
    v63.origin.y = v21;
    v63.size.width = v6;
    v63.size.height = v52;
    double v41 = v40 - CGRectGetWidth(v63);
    v64.origin.x = 0.0;
    v64.origin.y = v21;
    v64.size.width = v6;
    v64.size.height = v52;
    double v35 = v41 - CGRectGetMinX(v64);
    v65.origin.x = v48;
    v65.origin.y = v47;
    v65.size.width = v6;
    v65.size.height = v8;
    double v42 = CGRectGetMaxX(v65);
    v66.origin.x = 0.0;
    v66.origin.y = v27;
    v66.size.width = v6;
    v66.size.height = v23;
    double v43 = v42 - CGRectGetWidth(v66);
    v67.origin.x = 0.0;
    v67.origin.y = v27;
    v67.size.width = v6;
    v67.size.height = v23;
    double v49 = v43 - CGRectGetMinX(v67);
    v68.origin.x = v48;
    v68.origin.y = v47;
    v68.size.width = v6;
    v68.size.height = v8;
    double v44 = CGRectGetMaxX(v68);
    v69.origin.x = 0.0;
    v69.origin.y = v33;
    v69.size.width = v51;
    v69.size.height = v50;
    double v45 = v44 - CGRectGetWidth(v69);
    v70.origin.x = 0.0;
    v70.origin.y = v33;
    v70.size.width = v51;
    v70.size.height = v50;
    double v36 = v45 - CGRectGetMinX(v70);
    double v37 = v46;
  }

  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v37, v53, v6, v54, *(void *)&v46);
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", v35, v21, v6, v52);
  -[UILabel setFrame:](self->_genreLabel, "setFrame:", v49, v27, v6, v23);
  -[UIButton setFrame:](self->_followButton, "setFrame:", v36, v33, v51, v50);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  -[MTTVPodcastHeaderView safeAreaInsets](self, "safeAreaInsets", a3.width, a3.height);
  double v6 = v5;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_titleLabel, "font"));
  objc_msgSend(v7, "mt_offsetFromCapHeightToAscent");
  double v9 = v6 - v8;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width, 1.79769313e308);
  double v11 = v9 + v10;
  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_titleLabel, "font"));
  objc_msgSend(v12, "mt_offsetFromLastBaselineToBottom");
  double v14 = v11 - v13;
  CGFloat v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_subtitleLabel, "font"));
  objc_msgSend(v15, "mt_offsetFromCapHeightToAscent");
  double v17 = v14 - v16;
  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", width, 1.79769313e308);
  double v19 = v17 + v18;
  double v20 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_subtitleLabel, "font"));
  objc_msgSend(v20, "mt_offsetFromLastBaselineToBottom");
  double v22 = v19 - v21;
  double v23 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_genreLabel, "font"));
  objc_msgSend(v23, "mt_offsetFromCapHeightToAscent");
  double v25 = v22 - v24;
  -[UILabel sizeThatFits:](self->_genreLabel, "sizeThatFits:", width, 1.79769313e308);
  double v27 = v25 + v26;
  double v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_genreLabel, "font"));
  objc_msgSend(v28, "mt_offsetFromLastBaselineToBottom");
  double v30 = v27 - v29 + 50.0;
  -[UIButton sizeThatFits:](self->_followButton, "sizeThatFits:", width, 1.79769313e308);
  double v32 = v30 + v31;

  if (qword_1002B6AE8 != -1) {
    dispatch_once(&qword_1002B6AE8, &stru_100243C28);
  }
  double v33 = ceil(v32 * *(double *)&qword_1002B3EC0) / *(double *)&qword_1002B3EC0;
  double v34 = ceil(v32);
  double v35 = width;
  result.height = v34;
  result.double width = v35;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTVPodcastHeaderView;
  id v4 = a3;
  -[MTTVPodcastHeaderView traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  id v5 = objc_msgSend(v4, "userInterfaceStyle", v8.receiver, v8.super_class);

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastHeaderView traitCollection](self, "traitCollection"));
  id v7 = [v6 userInterfaceStyle];

  if (v5 != v7) {
    -[MTTVPodcastHeaderView updateTextColors](self, "updateTextColors");
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTTVPodcastHeaderView;
  -[MTTVPodcastHeaderView dealloc](&v3, "dealloc");
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (MTTVPodcastHeaderViewDelegate)delegate
{
  return (MTTVPodcastHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
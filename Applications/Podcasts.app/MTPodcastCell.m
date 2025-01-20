@interface MTPodcastCell
+ (BOOL)showsArtwork;
- (MTCountChevronView)countView;
- (MTPodcastCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)_subtitleForPodcast:(id)a3;
- (void)configureSubviews;
- (void)setCountView:(id)a3;
- (void)updateColors;
- (void)updateFonts;
- (void)updateWithObject:(id)a3;
@end

@implementation MTPodcastCell

+ (BOOL)showsArtwork
{
  return 1;
}

- (MTPodcastCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTPodcastCell;
  v4 = -[MTGenericCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4) {
    -[MTPodcastCell configureSubviews](v4, "configureSubviews");
  }
  return v5;
}

- (void)updateWithObject:(id)a3
{
  id v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v11 title]);
  -[MTGenericCell setTitle:](self, "setTitle:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastCell _subtitleForPodcast:](self, "_subtitleForPodcast:", v11));
  -[MTGenericCell setSubtitle:](self, "setSubtitle:", v5);

  unsigned __int8 v6 = [v11 isDark];
  if ((v6 & 1) != 0) {
    objc_super v7 = &off_100254BC0;
  }
  else {
    objc_super v7 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v11 countOfUnplayedEpisodes]);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastCell countView](self, "countView"));
  [v8 setCount:v7];

  if ((v6 & 1) == 0) {
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastCell countView](self, "countView"));
  }
  [v9 sizeToFit];

  v10 = (void *)objc_claimAutoreleasedReturnValue([v11 uuid]);
  -[MTGenericCell setArtworkKey:](self, "setArtworkKey:", v10);

  -[MTPodcastCell setNeedsLayout](self, "setNeedsLayout");
}

- (id)_subtitleForPodcast:(id)a3
{
  uint64_t v3 = kPodcastFeedChangedDate;
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForKey:v3]);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 friendlyDisplayString]);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v4 countOfNewEpisodes]);

  id v8 = [v7 unsignedIntegerValue];
  if (v8) {
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[MTCountUtil stringForNewEpisodeCount:titleCase:]( &OBJC_CLASS___MTCountUtil,  "stringForNewEpisodeCount:titleCase:",  v8,  0LL));
  }
  if ([v5 isToday] && objc_msgSend(v8, "isNotEmpty"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 localizedStringForKey:@"UPDATED_DATE_AT_TIME_AND_NEW_EPISODE_COUNT_FORMAT" value:&stru_100248948 table:0]);

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 timeString]);
    v12 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v10,  @"%@ %@ %@",  0LL,  v6,  v11,  v8);
LABEL_8:
    v14 = (void *)objc_claimAutoreleasedReturnValue(v12);

LABEL_9:
    goto LABEL_19;
  }

  if ([v5 isToday])
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedStringForKey:@"DATE_AT_TIME" value:&stru_100248948 table:0]);

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 timeString]);
    v12 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v10,  @"%@ %@",  0LL,  v6,  v11,  v18);
    goto LABEL_8;
  }

  if ([v6 isNotEmpty] && objc_msgSend(v8, "isNotEmpty"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue( [v15 localizedStringForKey:@"UPDATED_DATE_AND_NEW_EPISODE_COUNT_FORMAT" value:&stru_100248948 table:0]);

    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v10,  @"%@ %@",  0LL,  v6,  v8));
    goto LABEL_9;
  }

  if ([v6 isNotEmpty])
  {
    id v16 = v6;
  }

  else
  {
    if (![v8 isNotEmpty])
    {
      v14 = 0LL;
      goto LABEL_19;
    }

    id v16 = v8;
  }

  v14 = v16;
LABEL_19:

  return v14;
}

- (void)configureSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTPodcastCell;
  -[MTGenericCell configureSubviews](&v4, "configureSubviews");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastCell countView](self, "countView"));
  -[MTGenericCell setSideView:](self, "setSideView:", v3);
}

- (void)updateFonts
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTPodcastCell;
  -[MTGenericCell updateFonts](&v8, "updateFonts");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericCell textStackView](self, "textStackView"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 titleTextStyle]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](&OBJC_CLASS___UIFont, "mt_preferredFontForTextStyle:", v4));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastCell countView](self, "countView"));
  [v6 setFont:v5];

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastCell countView](self, "countView"));
  [v7 sizeToFit];

  -[MTPodcastCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateColors
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTPodcastCell;
  -[MTGenericCell updateColors](&v6, "updateColors");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericCell textStackView](self, "textStackView"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 subtitleTextColor]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastCell countView](self, "countView"));
  [v5 setTextColor:v4];
}

- (MTCountChevronView)countView
{
  countView = self->_countView;
  if (!countView)
  {
    objc_super v4 = objc_opt_new(&OBJC_CLASS___MTCountChevronView);
    v5 = self->_countView;
    self->_countView = v4;

    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor orangeColor](&OBJC_CLASS___UIColor, "orangeColor"));
    -[MTCountChevronView setTintColor:](self->_countView, "setTintColor:", v6);

    countView = self->_countView;
  }

  return countView;
}

- (void)setCountView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface MTTVEpisodeCell
+ (double)capHeightToTop;
+ (double)height;
+ (id)imageForTreatment:(unint64_t)a3;
+ (id)metadataFont;
+ (id)titleFont;
- (BOOL)showsArtwork;
- (BOOL)showsPlayState;
- (MTEpisodeArtworkView)artworkView;
- (MTNowPlayingIndicatorView)barsView;
- (MTTVEpisodeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)durationLabel;
- (UILabel)metadataLabel;
- (UILabel)titleLabel;
- (id)_fetchDurationText;
- (id)_fetchMetadataText;
- (id)_fetchPubDateText;
- (void)addImageAttachment:(id)a3 onString:(id)a4;
- (void)artworkDidChange:(id)a3;
- (void)configureSubviews;
- (void)dealloc;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)setArtworkView:(id)a3;
- (void)setBarsView:(id)a3;
- (void)setCurrentPlayerItem:(BOOL)a3;
- (void)setDurationLabel:(id)a3;
- (void)setEpisode:(id)a3;
- (void)setExplicitTreatment:(unint64_t)a3;
- (void)setMetadataLabel:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setShowsArtwork:(BOOL)a3;
- (void)setShowsPlayState:(BOOL)a3;
- (void)setTitleLabel:(id)a3;
- (void)startObservingPlaybackState;
- (void)stopObservingPlaybackState;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateArtworkAsync;
- (void)updateArtworkNowPlayingIndicator;
- (void)updateColors;
- (void)updatePlayStatusForCurrentPlayerItemDidChange;
- (void)updatePlayStatusViewImage;
- (void)updatePlaybackState;
@end

@implementation MTTVEpisodeCell

+ (double)height
{
  return 114.0;
}

+ (id)titleFont
{
  return +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleSubtitle1);
}

+ (id)metadataFont
{
  return +[UIFont preferredFontForTextStyle:](&OBJC_CLASS___UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody);
}

+ (double)capHeightToTop
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a1 titleFont]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([a1 metadataFont]);
  [v4 _scaledValueForValue:40.0];
  double v6 = v5;
  [v3 capHeight];
  double v8 = v6 + v7;
  [a1 height];
  double v10 = IMRoundToPixel((v9 - v8) * 0.5);

  return v10;
}

- (MTTVEpisodeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTTVEpisodeCell;
  v4 = -[MTTVEpisodeGenericCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  double v5 = v4;
  if (v4) {
    -[MTTVEpisodeCell setShowsPlayState:](v4, "setShowsPlayState:", 0LL);
  }
  return v5;
}

- (void)setEpisode:(id)a3
{
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___MTTVEpisodeCell;
  id v4 = a3;
  -[MTTVEpisodeGenericCell setEpisode:](&v31, "setEpisode:", v4);
  -[MTTVEpisodeCell updatePlayStatusViewImage](self, "updatePlayStatusViewImage", v31.receiver, v31.super_class);
  -[MTTVEpisodeCell updateArtworkAsync](self, "updateArtworkAsync");
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bestTitle]);

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell titleLabel](self, "titleLabel"));
  [v6 setText:v5];

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell titleLabel](self, "titleLabel"));
  [v7 sizeToFit];

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell _fetchPubDateText](self, "_fetchPubDateText"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](&OBJC_CLASS___UIFont, "systemFontOfSize:", 24.0));
  double v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithFont:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:",  v9));

  if (v8)
  {
    v11 = -[NSMutableAttributedString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableAttributedString),  "initWithString:",  v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeGenericCell episode](self, "episode"));
    unsigned int v13 = [v12 isExplicit];

    if (v13)
    {
      id v14 = objc_msgSend( (id)objc_opt_class(self),  "imageForTreatment:",  -[MTTVEpisodeGenericCell explicitTreatment](self, "explicitTreatment"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      -[MTTVEpisodeCell addImageAttachment:onString:](self, "addImageAttachment:onString:", v15, v11);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeGenericCell episode](self, "episode"));
    unsigned int v17 = [v16 isVideo];

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"tv",  v10));
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 imageWithRenderingMode:2]);

      -[MTTVEpisodeCell addImageAttachment:onString:](self, "addImageAttachment:onString:", v19, v11);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeGenericCell episode](self, "episode"));
    unsigned int v21 = [v20 isBookmarked];

    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"bookmark.fill",  v10));
      v23 = (void *)objc_claimAutoreleasedReturnValue([v22 imageWithRenderingMode:2]);

      -[MTTVEpisodeCell addImageAttachment:onString:](self, "addImageAttachment:onString:", v23, v11);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell metadataLabel](self, "metadataLabel"));
    [v24 setAttributedText:v11];

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell metadataLabel](self, "metadataLabel"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell mt_secondaryTextColor](self, "mt_secondaryTextColor"));
    [v25 setTintColor:v26];

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell barsView](self, "barsView"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell mt_secondaryTextColor](self, "mt_secondaryTextColor"));
    [v27 setTintColor:v28];
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell _fetchDurationText](self, "_fetchDurationText"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell durationLabel](self, "durationLabel"));
  [v30 setText:v29];

  -[MTTVEpisodeCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)addImageAttachment:(id)a3 onString:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  double v9 = objc_alloc_init(&OBJC_CLASS___NSTextAttachment);
  -[NSTextAttachment setImage:](v9, "setImage:", v6);

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSAttributedString attributedStringWithAttachment:]( &OBJC_CLASS___NSAttributedString,  "attributedStringWithAttachment:",  v9));
  double v8 = -[NSMutableAttributedString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableAttributedString),  "initWithString:",  @" · ");
  [v5 appendAttributedString:v8];
  [v5 appendAttributedString:v7];
}

- (void)setShowsPlayState:(BOOL)a3
{
  if (self->_showsPlayState != a3)
  {
    BOOL v3 = a3;
    self->_showsPlayState = a3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeGenericCell playStatusView](self, "playStatusView"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 superview]);
    objc_super v7 = v6;
    if (v3)
    {
      double v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell contentView](self, "contentView"));

      if (v7 != v8)
      {
        double v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell contentView](self, "contentView"));
        double v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeGenericCell playStatusView](self, "playStatusView"));
        [v9 addSubview:v10];

LABEL_7:
      }
    }

    else
    {

      if (v7)
      {
        double v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeGenericCell playStatusView](self, "playStatusView"));
        [v9 removeFromSuperview];
        goto LABEL_7;
      }
    }

    -[MTTVEpisodeCell setNeedsLayout](self, "setNeedsLayout");
  }

- (void)setShowsArtwork:(BOOL)a3
{
  if (self->_showsArtwork != a3)
  {
    BOOL v3 = a3;
    self->_showsArtwork = a3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell artworkView](self, "artworkView"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 superview]);
    objc_super v7 = v6;
    if (v3)
    {
      double v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell contentView](self, "contentView"));

      if (v7 != v8)
      {
        double v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell contentView](self, "contentView"));
        double v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell artworkView](self, "artworkView"));
        [v9 addSubview:v10];

        -[MTTVEpisodeCell updateArtworkAsync](self, "updateArtworkAsync");
      }
    }

    else
    {

      if (v7)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell artworkView](self, "artworkView"));
        [v11 removeFromSuperview];
      }
    }

    -[MTTVEpisodeCell setNeedsLayout](self, "setNeedsLayout");
  }

- (void)setExplicitTreatment:(unint64_t)a3
{
  if (-[MTTVEpisodeGenericCell explicitTreatment](self, "explicitTreatment") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___MTTVEpisodeCell;
    -[MTTVEpisodeGenericCell setExplicitTreatment:](&v5, "setExplicitTreatment:", a3);
    -[MTTVEpisodeCell setNeedsLayout](self, "setNeedsLayout");
  }

- (void)artworkDidChange:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeGenericCell episode](self, "episode"));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v5 podcastUuid]);

  uint64_t CacheKeys = MTImageDownloaderArtworkDidLoadCacheKeys(v4, v6);
  double v8 = (void *)objc_claimAutoreleasedReturnValue(CacheKeys);
}

- (void)updateArtworkAsync
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeGenericCell episode](self, "episode"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 podcastUuid]);

  if ([v4 length] && -[MTTVEpisodeCell showsArtwork](self, "showsArtwork"))
  {
    objc_initWeak(&location, self);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100034068;
    v6[3] = &unk_100241300;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    +[MTPodcast fetchArtworkForPodcastUuid:size:completion:]( &OBJC_CLASS___MTPodcast,  "fetchArtworkForPodcastUuid:size:completion:",  v7,  v6,  100.0,  100.0);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

  else
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell artworkView](self, "artworkView"));
    [v5 setArtwork:0];
  }
}

- (void)updateArtworkNowPlayingIndicator
{
  if (-[MTTVEpisodeGenericCell isCurrentPlayerItem](self, "isCurrentPlayerItem")) {
    -[MTTVEpisodeCell startObservingPlaybackState](self, "startObservingPlaybackState");
  }
  else {
    -[MTTVEpisodeCell stopObservingPlaybackState](self, "stopObservingPlaybackState");
  }
  -[MTTVEpisodeCell updatePlaybackState](self, "updatePlaybackState");
}

- (id)_fetchPubDateText
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeGenericCell episode](self, "episode"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode friendlyPubDateStringForEpisode:abbreviated:]( &OBJC_CLASS___MTEpisode,  "friendlyPubDateStringForEpisode:abbreviated:",  v2,  1LL));

  return v3;
}

- (id)_fetchDurationText
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeGenericCell episode](self, "episode"));
  if ([v3 isPartiallyPlayed])
  {

LABEL_4:
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeGenericCell episode](self, "episode"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode timeRemainingStringForEpisode:abbreviated:]( &OBJC_CLASS___MTEpisode,  "timeRemainingStringForEpisode:abbreviated:",  v6,  0LL));

    goto LABEL_6;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeGenericCell episode](self, "episode"));
  unsigned int v5 = [v4 isPartiallyPlayedBackCatalogItem];

  if (v5) {
    goto LABEL_4;
  }
  id v7 = 0LL;
LABEL_6:
  if (![v7 length])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeGenericCell episode](self, "episode"));
    [v8 duration];
    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSString prettyShortStringWithDuration:abbreviated:]( &OBJC_CLASS___NSString,  "prettyShortStringWithDuration:abbreviated:",  0LL));

    id v7 = (void *)v9;
  }

  return v7;
}

- (id)_fetchMetadataText
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeGenericCell episode](self, "episode"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode friendlyPubDateStringForEpisode:abbreviated:]( &OBJC_CLASS___MTEpisode,  "friendlyPubDateStringForEpisode:abbreviated:",  v4,  1LL));

  if ([v5 length]) {
    [v3 addObject:v5];
  }
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeGenericCell episode](self, "episode"));
  unsigned int v7 = [v6 isExternalType];

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 localizedStringForKey:@"ATV_EXTERNAL_MEDIA_UNSUPPORTED_MEDIA_TYPE" value:&stru_100248948 table:0]);

    double v10 = v9;
  }

  else
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell _fetchDurationText](self, "_fetchDurationText"));
    uint64_t v9 = v10;
  }

  if ([v10 length]) {
    [v3 addObject:v9];
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v3 componentsJoinedByString:@"   "]);
  return v11;
}

+ (id)imageForTreatment:(unint64_t)a3
{
  BOOL v3 = @"e.square.fill";
  if (a3) {
    BOOL v3 = 0LL;
  }
  if (a3 == 1) {
    id v4 = @"19.circle.fill";
  }
  else {
    id v4 = v3;
  }
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](&OBJC_CLASS___UIFont, "systemFontOfSize:", 24.0));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithFont:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:",  v5));

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  v4,  v6));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 imageWithRenderingMode:2]);

  return v8;
}

- (void)configureSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MTTVEpisodeCell;
  -[MTTVEpisodeGenericCell configureSubviews](&v13, "configureSubviews");
  if (-[MTTVEpisodeCell showsArtwork](self, "showsArtwork"))
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell contentView](self, "contentView"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell artworkView](self, "artworkView"));
    [v3 addSubview:v4];
  }

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell contentView](self, "contentView"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell titleLabel](self, "titleLabel"));
  [v5 addSubview:v6];

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell contentView](self, "contentView"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell metadataLabel](self, "metadataLabel"));
  [v7 addSubview:v8];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell contentView](self, "contentView"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell durationLabel](self, "durationLabel"));
  [v9 addSubview:v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell contentView](self, "contentView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell barsView](self, "barsView"));
  [v11 addSubview:v12];

  -[MTTVEpisodeCell updateColors](self, "updateColors");
}

- (void)setCurrentPlayerItem:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTTVEpisodeCell;
  -[MTTVEpisodeGenericCell setCurrentPlayerItem:](&v4, "setCurrentPlayerItem:", a3);
  -[MTTVEpisodeCell updateArtworkNowPlayingIndicator](self, "updateArtworkNowPlayingIndicator");
}

- (void)updatePlayStatusForCurrentPlayerItemDidChange
{
  BOOL v3 = -[MTTVEpisodeCell showsPlayState](self, "showsPlayState")
    && !-[MTTVEpisodeCell showsArtwork](self, "showsArtwork")
    && -[MTTVEpisodeGenericCell isCurrentPlayerItem](self, "isCurrentPlayerItem");
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeGenericCell playStatusView](self, "playStatusView"));
  [v4 setCurrentPlayerItem:v3];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = -[MTTVEpisodeCell isSelected](self, "isSelected");
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTTVEpisodeCell;
  -[MTTVEpisodeCell setSelected:](&v6, "setSelected:", v3);
  if (v5 != v3) {
    -[MTTVEpisodeCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  v128.receiver = self;
  v128.super_class = (Class)&OBJC_CLASS___MTTVEpisodeCell;
  -[MTTVEpisodeCell layoutSubviews](&v128, "layoutSubviews");
  id v3 = -[MTTVEpisodeCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell contentView](self, "contentView"));
  [v4 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = 0.0;
  if (-[MTTVEpisodeCell showsArtwork](self, "showsArtwork"))
  {
    double v13 = v12;
    if ((-[MTTVEpisodeCell isFocused](self, "isFocused") & 1) == 0)
    {
      else {
        double v13 = v12 + -7.0 + -7.0;
      }
    }
  }

  if ((-[MTTVEpisodeCell isFocused](self, "isFocused") & 1) != 0
    || (double v14 = 7.0, -[MTTVEpisodeCell isSelected](self, "isSelected")))
  {
    double v14 = 0.0;
  }

  if (-[MTTVEpisodeCell showsPlayState](self, "showsPlayState")) {
    double v15 = 68.0;
  }
  else {
    double v15 = 0.0;
  }
  if (v3 == (id)1)
  {
    v129.origin.CGFloat x = v6;
    v129.origin.CGFloat y = v8;
    v129.size.CGFloat width = v10;
    v129.size.double height = v12;
    double v15 = CGRectGetMaxX(v129) - v13 - v15;
  }

  CGFloat v117 = v8;
  CGFloat v119 = v6;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell artworkView](self, "artworkView"));
  CGFloat v126 = v14;
  objc_msgSend(v16, "setFrame:", v15, v14, v13, v13);

  CGFloat y = CGRectZero.origin.y;
  if (-[MTTVEpisodeCell showsPlayState](self, "showsPlayState"))
  {
    CGFloat rect = v10;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeGenericCell playStatusView](self, "playStatusView"));
    [v18 frame];
    double v20 = v19;
    double height = v21;

    double v23 = IMRoundToPixel((v12 - height) * 0.5);
    double v24 = 20.0;
    if (v3 == (id)1)
    {
      v130.origin.CGFloat y = v8;
      v130.origin.CGFloat x = v119;
      v130.size.CGFloat width = rect;
      v130.size.double height = v12;
      double MaxX = CGRectGetMaxX(v130);
      v131.origin.CGFloat x = 20.0;
      v131.origin.CGFloat y = v23;
      v131.size.CGFloat width = v20;
      v131.size.double height = height;
      double v26 = MaxX - CGRectGetWidth(v131);
      v132.origin.CGFloat x = 20.0;
      v132.origin.CGFloat y = v23;
      v132.size.CGFloat width = v20;
      v132.size.double height = height;
      double v24 = v26 - CGRectGetMinX(v132);
    }

    CGFloat v27 = v15;
    double v28 = v24;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeGenericCell playStatusView](self, "playStatusView"));
    CGFloat x = v28;
    CGFloat width = v20;
    objc_msgSend(v29, "setFrame:", v28, v23, v20, height);

    CGFloat v30 = v23;
    double v10 = rect;
  }

  else
  {
    CGFloat v27 = v15;
    CGFloat x = CGRectZero.origin.x;
    CGFloat v30 = y;
    double height = CGRectZero.size.height;
    CGFloat width = CGRectZero.size.width;
  }

  double recta = v12;
  objc_super v31 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell durationLabel](self, "durationLabel"));
  v32 = (void *)objc_claimAutoreleasedReturnValue([v31 text]);
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](&OBJC_CLASS___UIFont, "systemFontOfSize:", 30.0));
  [v32 sizeWithFont:v33];
  double v35 = v34;

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell durationLabel](self, "durationLabel"));
  v37 = (void *)objc_claimAutoreleasedReturnValue([v36 font]);
  [v37 lineHeight];
  double v39 = v38;

  double v121 = v35;
  CGFloat v122 = y;
  double v120 = v39;
  CGFloat v109 = v13;
  double v113 = v10 - v35 + -20.0;
  CGFloat v41 = y;
  if (v3 == (id)1)
  {
    double v48 = 20.0;
    double v49 = 20.0;
    double v50 = v35;
    double v51 = v39;
    double v44 = CGRectGetMaxX(*(CGRect *)(&v41 - 1));
    v134.origin.CGFloat y = v117;
    v134.origin.CGFloat x = v119;
    v134.size.CGFloat width = v10;
    v134.size.double height = recta;
    double v52 = CGRectGetMaxX(v134);
    if (-[MTTVEpisodeCell showsArtwork](self, "showsArtwork"))
    {
      CGFloat v45 = v27;
      v135.origin.CGFloat x = v27;
      CGFloat v46 = v126;
      v135.origin.CGFloat y = v126;
      v135.size.CGFloat width = v13;
      v135.size.double height = v13;
      double v47 = CGRectGetMinX(v135) + -30.0;
      goto LABEL_31;
    }

    CGFloat v45 = v27;
    if (!-[MTTVEpisodeCell showsPlayState](self, "showsPlayState"))
    {
      double v47 = v52 + -20.0;
      goto LABEL_30;
    }

    v137.origin.CGFloat x = x;
    v137.origin.CGFloat y = v30;
    v137.size.CGFloat width = width;
    v137.size.double height = height;
    double MinX = CGRectGetMinX(v137);
    double v54 = -20.0;
  }

  else
  {
    double v42 = v35;
    double v43 = v39;
    double v40 = v10 - v35 + -20.0;
    double v44 = CGRectGetMinX(*(CGRect *)(&v41 - 1));
    if (-[MTTVEpisodeCell showsArtwork](self, "showsArtwork"))
    {
      CGFloat v45 = v27;
      v133.origin.CGFloat x = v27;
      CGFloat v46 = v126;
      v133.origin.CGFloat y = v126;
      v133.size.CGFloat width = v13;
      v133.size.double height = v13;
      double v47 = CGRectGetMaxX(v133) + 30.0;
      double v48 = -20.0;
      goto LABEL_31;
    }

    double v47 = 20.0;
    double v48 = -20.0;
    CGFloat v45 = v27;
    if (!-[MTTVEpisodeCell showsPlayState](self, "showsPlayState")) {
      goto LABEL_30;
    }
    v136.origin.CGFloat x = x;
    v136.origin.CGFloat y = v30;
    v136.size.CGFloat width = width;
    v136.size.double height = height;
    double MinX = CGRectGetMaxX(v136);
    double v54 = 20.0;
  }

  double v47 = MinX + v54;
LABEL_30:
  CGFloat v46 = v126;
LABEL_31:
  double v55 = vabdd_f64(v48 + v44, v47);
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell titleLabel](self, "titleLabel"));
  v57 = (void *)objc_claimAutoreleasedReturnValue([v56 font]);
  [v57 lineHeight];
  double v59 = v58;

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell barsView](self, "barsView"));
  [v60 frame];
  double v62 = v61;
  double v64 = v63;

  double v65 = v47;
  if (v3 == (id)1) {
    double v66 = v55;
  }
  else {
    double v66 = 0.0;
  }
  if (v3 == (id)1)
  {
    v138.origin.CGFloat x = v45;
    v138.origin.CGFloat y = v46;
    v138.size.CGFloat width = v109;
    v138.size.double height = v109;
    double v65 = CGRectGetMinX(v138) + -30.0 - v62;
  }

  double v118 = v65;
  double v67 = v47 - v66;
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell metadataLabel](self, "metadataLabel"));
  v69 = (void *)objc_claimAutoreleasedReturnValue([v68 font]);
  [v69 lineHeight];
  double v71 = v70;

  double v127 = v71;
  double v116 = v62;
  double v112 = v59;
  if (!-[MTTVEpisodeGenericCell isCurrentPlayerItem](self, "isCurrentPlayerItem") || v3 == (id)1)
  {
    double v72 = v55;
    if (-[MTTVEpisodeGenericCell isCurrentPlayerItem](self, "isCurrentPlayerItem")) {
      double v73 = v67 - v62 + -15.0;
    }
    else {
      double v73 = v67;
    }
  }

  else
  {
    double v72 = v55;
    double v73 = v67 + v62 + 15.0;
  }

  double v74 = 20.0;
  if (v3 != (id)1) {
    double v74 = v113;
  }
  double v114 = v74;
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell titleLabel](self, "titleLabel"));
  v76 = (void *)objc_claimAutoreleasedReturnValue([v75 font]);
  objc_msgSend(v76, "mt_offsetFromCapHeightToAscent");
  double v78 = v77;

  v79 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell titleLabel](self, "titleLabel"));
  v80 = (void *)objc_claimAutoreleasedReturnValue([v79 font]);
  objc_msgSend(v80, "mt_offsetFromLastBaselineToBottom");
  double v82 = v81;

  v83 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell metadataLabel](self, "metadataLabel"));
  v84 = (void *)objc_claimAutoreleasedReturnValue([v83 font]);
  objc_msgSend(v84, "mt_offsetFromFirstBaselineToTop");
  double v86 = v85;

  v87 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell metadataLabel](self, "metadataLabel"));
  v88 = (void *)objc_claimAutoreleasedReturnValue([v87 font]);
  objc_msgSend(v88, "mt_offsetFromLastBaselineToBottom");
  double v108 = v89;

  v90 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell metadataLabel](self, "metadataLabel"));
  v91 = (void *)objc_claimAutoreleasedReturnValue([v90 font]);
  [v91 _scaledValueForValue:40.0];
  double v93 = v92;

  double v94 = v93 - v82 - v86;
  v139.origin.CGFloat x = v67;
  v139.origin.CGFloat y = v122;
  v139.size.CGFloat width = v72;
  v139.size.double height = v112;
  double v95 = v94 + CGRectGetHeight(v139) - v78;
  v140.origin.CGFloat x = v73;
  double v110 = v73;
  v140.origin.CGFloat y = v122;
  v140.size.CGFloat width = v72;
  v140.size.double height = v127;
  CGFloat v96 = CGRectGetHeight(v140);
  double v97 = IMRoundToPixel((recta - (v96 + v95 - v108)) * 0.5);
  CGFloat v98 = v97 - v78;
  v99 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell durationLabel](self, "durationLabel"));
  v100 = (void *)objc_claimAutoreleasedReturnValue([v99 font]);
  objc_msgSend(v100, "mt_offsetFromCapHeightToAscent");
  double rectb = v97 - v101;

  v141.origin.CGFloat x = v67;
  v141.origin.CGFloat y = v97 - v78;
  v141.size.CGFloat width = v72;
  v141.size.double height = v112;
  double v102 = v94 + CGRectGetMaxY(v141);
  v142.origin.CGFloat x = v67;
  v142.origin.CGFloat y = v98;
  v142.size.CGFloat width = v72;
  v142.size.double height = v112;
  double v103 = v127 + v94 + CGRectGetMaxY(v142) - v64 - v108;
  v104 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell titleLabel](self, "titleLabel"));
  objc_msgSend(v104, "setFrame:", v67, v98, v72, v112);

  v105 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell metadataLabel](self, "metadataLabel"));
  objc_msgSend(v105, "setFrame:", v110, v102, v72, v127);

  v106 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell barsView](self, "barsView"));
  objc_msgSend(v106, "setFrame:", v118, v103, v116, v64);

  v107 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell durationLabel](self, "durationLabel"));
  objc_msgSend(v107, "setFrame:", v114, rectb, v121, v120);
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTVEpisodeCell;
  id v4 = a3;
  -[MTTVEpisodeCell traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell traitCollection](self, "traitCollection", v8.receiver, v8.super_class));
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    -[MTTVEpisodeCell updateColors](self, "updateColors");
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MTTVEpisodeCell;
  id v6 = a4;
  -[MTTVEpisodeCell didUpdateFocusInContext:withAnimationCoordinator:]( &v11,  "didUpdateFocusInContext:withAnimationCoordinator:",  a3,  v6);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100035040;
  v10[3] = &unk_10023FF98;
  v10[4] = self;
  [v6 addCoordinatedAnimations:v10 completion:0];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell artworkView](self, "artworkView"));
  unsigned int v8 = -[MTTVEpisodeCell isFocused](self, "isFocused");
  double v9 = 6.0;
  if (v8) {
    double v9 = 0.0;
  }
  [v7 _setContinuousCornerRadius:v9];
}

- (MTEpisodeArtworkView)artworkView
{
  artworkView = self->_artworkView;
  if (!artworkView)
  {
    id v4 = objc_opt_new(&OBJC_CLASS___MTEpisodeArtworkView);
    double v5 = self->_artworkView;
    self->_artworkView = v4;

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeArtworkView layer](self->_artworkView, "layer"));
    [v6 setMasksToBounds:1];

    -[MTEpisodeArtworkView _setContinuousCornerRadius:](self->_artworkView, "_setContinuousCornerRadius:", 6.0);
    -[MTTVEpisodeCell updateArtworkNowPlayingIndicator](self, "updateArtworkNowPlayingIndicator");
    artworkView = self->_artworkView;
  }

  return artworkView;
}

- (UILabel)titleLabel
{
  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    id v4 = (UILabel *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell textLabel](self, "textLabel"));
    double v5 = self->_titleLabel;
    self->_titleLabel = v4;

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](self->_titleLabel, "setBackgroundColor:", v6);

    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleSubtitle1));
    -[UILabel setFont:](self->_titleLabel, "setFont:", v7);

    titleLabel = self->_titleLabel;
  }

  return titleLabel;
}

- (UILabel)metadataLabel
{
  metadataLabel = self->_metadataLabel;
  if (!metadataLabel)
  {
    id v4 = objc_opt_new(&OBJC_CLASS___UILabel);
    double v5 = self->_metadataLabel;
    self->_metadataLabel = v4;

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](self->_metadataLabel, "setBackgroundColor:", v6);

    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleBody));
    -[UILabel setFont:](self->_metadataLabel, "setFont:", v7);

    metadataLabel = self->_metadataLabel;
  }

  return metadataLabel;
}

- (UILabel)durationLabel
{
  durationLabel = self->_durationLabel;
  if (!durationLabel)
  {
    id v4 = objc_opt_new(&OBJC_CLASS___UILabel);
    double v5 = self->_durationLabel;
    self->_durationLabel = v4;

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](self->_durationLabel, "setBackgroundColor:", v6);

    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleBody));
    -[UILabel setFont:](self->_durationLabel, "setFont:", v7);

    durationLabel = self->_durationLabel;
  }

  return durationLabel;
}

- (MTNowPlayingIndicatorView)barsView
{
  barsView = self->_barsView;
  if (!barsView)
  {
    id v4 = objc_opt_new(&OBJC_CLASS___MTNowPlayingIndicatorView);
    double v5 = self->_barsView;
    self->_barsView = v4;

    -[MTNowPlayingIndicatorView setNumberOfLevels:](self->_barsView, "setNumberOfLevels:", 3LL);
    -[MTNowPlayingIndicatorView setBounceStyle:](self->_barsView, "setBounceStyle:", 1LL);
    -[MTNowPlayingIndicatorView setLevelWidth:](self->_barsView, "setLevelWidth:", 5.0);
    -[MTNowPlayingIndicatorView setMaximumLevelHeight:](self->_barsView, "setMaximumLevelHeight:", 16.0);
    -[MTNowPlayingIndicatorView setInterLevelSpacing:](self->_barsView, "setInterLevelSpacing:", 3.0);
    -[MTNowPlayingIndicatorView setLevelCornerRadius:](self->_barsView, "setLevelCornerRadius:", 1.0);
    -[MTNowPlayingIndicatorView sizeToFit](self->_barsView, "sizeToFit");
    barsView = self->_barsView;
  }

  return barsView;
}

- (void)updateColors
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell mt_primaryTextColor](self, "mt_primaryTextColor"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeCell mt_secondaryTextColor](self, "mt_secondaryTextColor"));
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v6);
  -[UILabel setTextColor:](self->_metadataLabel, "setTextColor:", v3);
  -[MTNowPlayingIndicatorView setTintColor:](self->_barsView, "setTintColor:", v3);
  -[UILabel setTextColor:](self->_durationLabel, "setTextColor:", v3);
  if (-[MTTVEpisodeCell showsArtwork](self, "showsArtwork")
    || -[MTTVEpisodeCell mt_isDarkBackground](self, "mt_isDarkBackground"))
  {
    uint64_t v4 = 1LL;
  }

  else
  {
    uint64_t v4 = 2LL;
  }

  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeGenericCell playStatusView](self, "playStatusView"));
  [v5 setBarsStyle:v4];

  -[MTTVEpisodeCell updatePlayStatusViewImage](self, "updatePlayStatusViewImage");
}

- (void)updatePlayStatusViewImage
{
  id v3 = -[MTTVEpisodeCell mt_isDarkBackground](self, "mt_isDarkBackground");
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeGenericCell episode](self, "episode"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v6 playStatusImageForDarkBackground:v3]);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeGenericCell playStatusView](self, "playStatusView"));
  [v5 setImage:v4];
}

- (void)startObservingPlaybackState
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"updatePlaybackState" name:@"TVMusicPlayerStateDidChangeNotification" object:0];
}

- (void)stopObservingPlaybackState
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:@"TVMusicPlayerStateDidChangeNotification" object:0];
}

- (void)updatePlaybackState
{
  if (-[MTTVEpisodeGenericCell isCurrentPlayerItem](self, "isCurrentPlayerItem"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance"));
    unsigned int v4 = [v3 isTargetPlaying];

    if (v4) {
      uint64_t v5 = 1LL;
    }
    else {
      uint64_t v5 = 2LL;
    }
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  -[MTNowPlayingIndicatorView setPlaybackState:](self->_barsView, "setPlaybackState:", v5);
}

- (void)dealloc
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTTVEpisodeCell;
  -[MTTVEpisodeGenericCell dealloc](&v4, "dealloc");
}

- (BOOL)showsPlayState
{
  return self->_showsPlayState;
}

- (BOOL)showsArtwork
{
  return self->_showsArtwork;
}

- (void)setArtworkView:(id)a3
{
}

- (void)setTitleLabel:(id)a3
{
}

- (void)setMetadataLabel:(id)a3
{
}

- (void)setDurationLabel:(id)a3
{
}

- (void)setBarsView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
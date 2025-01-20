@interface MTPodcastGroupCell
+ (BOOL)showsArtwork;
- (BOOL)isCurrentEpisodeDownloaded;
- (BOOL)networkIsReachable;
- (MTCountInfoButton)countInfoButton;
- (MTPodcastGroupCellDelegate)delegate;
- (NSArray)episodeUUIDs;
- (id)_currentEpisodeForPodcastGroup:(id)a3;
- (id)_subtitleForPodcastGroup:(id)a3 currentEpisode:(id)a4;
- (id)_titleForPodcastGroup:(id)a3 currentEpisode:(id)a4;
- (unint64_t)_indexOfEpisodeUUID:(id)a3;
- (void)configureSubviews;
- (void)infoButtonTapped:(id)a3;
- (void)setCountInfoButton:(id)a3;
- (void)setCurrentEpisodeDownloaded:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEpisodeUUIDs:(id)a3;
- (void)setNetworkIsReachable:(BOOL)a3;
- (void)updateColors;
- (void)updateEnabled;
- (void)updateFonts;
- (void)updateWithObject:(id)a3;
@end

@implementation MTPodcastGroupCell

+ (BOOL)showsArtwork
{
  return 1;
}

- (void)updateWithObject:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 episodes]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:kEpisodeUuid]);
  -[MTPodcastGroupCell setEpisodeUUIDs:](self, "setEpisodeUUIDs:", v6);

  id v17 = (id)objc_claimAutoreleasedReturnValue(-[MTPodcastGroupCell _currentEpisodeForPodcastGroup:](self, "_currentEpisodeForPodcastGroup:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 podcast]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
  -[MTGenericCell setArtworkKey:](self, "setArtworkKey:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue( -[MTPodcastGroupCell _titleForPodcastGroup:currentEpisode:]( self,  "_titleForPodcastGroup:currentEpisode:",  v4,  v17));
  -[MTGenericCell setTitle:](self, "setTitle:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue( -[MTPodcastGroupCell _subtitleForPodcastGroup:currentEpisode:]( self,  "_subtitleForPodcastGroup:currentEpisode:",  v4,  v17));
  -[MTGenericCell setSubtitle:](self, "setSubtitle:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue([v17 uuid]);
  unint64_t v12 = -[MTPodcastGroupCell _indexOfEpisodeUUID:](self, "_indexOfEpisodeUUID:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastGroupCell episodeUUIDs](self, "episodeUUIDs"));
  id v14 = [v13 count];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastGroupCell countInfoButton](self, "countInfoButton"));
  [v15 setIndex:v12 forCount:v14];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastGroupCell countInfoButton](self, "countInfoButton"));
  [v16 sizeToFit];

  -[MTPodcastGroupCell setCurrentEpisodeDownloaded:]( self,  "setCurrentEpisodeDownloaded:",  [v17 isDownloaded]);
  -[MTPodcastGroupCell updateEnabled](self, "updateEnabled");
  -[MTPodcastGroupCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateEnabled
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastGroupCell episodeUUIDs](self, "episodeUUIDs"));
  id v4 = [v3 count];

  if (v4) {
    BOOL v5 = -[MTPodcastGroupCell networkIsReachable](self, "networkIsReachable")
  }
      || -[MTPodcastGroupCell isCurrentEpisodeDownloaded](self, "isCurrentEpisodeDownloaded");
  else {
    BOOL v5 = 0LL;
  }
  -[MTGenericCell setEnabled:](self, "setEnabled:", v5);
}

- (void)configureSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTPodcastGroupCell;
  -[MTGenericCell configureSubviews](&v4, "configureSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastGroupCell countInfoButton](self, "countInfoButton"));
  -[MTGenericCell setSideView:](self, "setSideView:", v3);

  -[MTTableViewCell setShowsSeparator:](self, "setShowsSeparator:", 0LL);
}

- (void)updateFonts
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTPodcastGroupCell;
  -[MTGenericCell updateFonts](&v8, "updateFonts");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericCell textStackView](self, "textStackView"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 subtitleTextStyle]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](&OBJC_CLASS___UIFont, "mt_preferredFontForTextStyle:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastGroupCell countInfoButton](self, "countInfoButton"));
  [v6 setFont:v5];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastGroupCell countInfoButton](self, "countInfoButton"));
  [v7 sizeToFit];

  -[MTPodcastGroupCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateColors
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTPodcastGroupCell;
  -[MTGenericCell updateColors](&v5, "updateColors");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor appTintColor](&OBJC_CLASS___UIColor, "appTintColor"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastGroupCell countInfoButton](self, "countInfoButton"));
  [v4 setTextColor:v3];
}

- (id)_titleForPodcastGroup:(id)a3 currentEpisode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[MTPodcastGroupCell isEditing](self, "isEditing"))
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v6 podcast]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 title]);
  }

  else if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 bestTitle]);
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

- (id)_subtitleForPodcastGroup:(id)a3 currentEpisode:(id)a4
{
  id v5 = a4;
  if (-[MTPodcastGroupCell isEditing](self, "isEditing"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastGroupCell episodeUUIDs](self, "episodeUUIDs"));
    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[MTCountUtil stringForUnplayedEpisodeCount:]( MTCountUtil,  "stringForUnplayedEpisodeCount:",  [v6 count]));
LABEL_10:
    v13 = (void *)v7;
    goto LABEL_11;
  }

  if (!v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 localizedStringForKey:@"No New Episodes" value:&stru_100248948 table:0]);
    goto LABEL_10;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:kEpisodePubDate]);
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 friendlyDisplayString]);
    [v6 addObject:v10];
  }

  [v5 duration];
  if (v11 > 0.0)
  {
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString prettyStringWithDuration:](&OBJC_CLASS___NSString, "prettyStringWithDuration:"));
    [v6 addObject:v12];
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v6 componentsJoinedByString:@" • "]);

LABEL_11:
  return v13;
}

- (unint64_t)_indexOfEpisodeUUID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastGroupCell episodeUUIDs](self, "episodeUUIDs"));
  id v6 = [v5 indexOfObject:v4];

  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL) {
    return 0LL;
  }
  else {
    return (unint64_t)v6;
  }
}

- (id)_currentEpisodeForPodcastGroup:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentItem]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 episodeUuid]);

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastGroupCell episodeUUIDs](self, "episodeUUIDs"));
  LODWORD(v5) = [v8 containsObject:v7];

  if ((_DWORD)v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 mainQueueContext]);

    uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 episodeForUuid:v7]);
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 episodes]);
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 firstObject]);
  }

  unint64_t v12 = (void *)v11;

  return v12;
}

- (MTCountInfoButton)countInfoButton
{
  countInfoButton = self->_countInfoButton;
  if (!countInfoButton)
  {
    id v4 = objc_opt_new(&OBJC_CLASS___MTCountInfoButton);
    id v5 = self->_countInfoButton;
    self->_countInfoButton = v4;

    -[MTCountInfoButton addTarget:action:forControlEvents:]( self->_countInfoButton,  "addTarget:action:forControlEvents:",  self,  "infoButtonTapped:",  64LL);
    countInfoButton = self->_countInfoButton;
  }

  return countInfoButton;
}

- (void)infoButtonTapped:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTPodcastGroupCell delegate](self, "delegate", a3));
  [v4 podcastGroupCellDidTapInfoButton:self];
}

- (MTPodcastGroupCellDelegate)delegate
{
  return (MTPodcastGroupCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)networkIsReachable
{
  return self->_networkIsReachable;
}

- (void)setNetworkIsReachable:(BOOL)a3
{
  self->_networkIsReachable = a3;
}

- (NSArray)episodeUUIDs
{
  return self->_episodeUUIDs;
}

- (void)setEpisodeUUIDs:(id)a3
{
}

- (BOOL)isCurrentEpisodeDownloaded
{
  return self->_currentEpisodeDownloaded;
}

- (void)setCurrentEpisodeDownloaded:(BOOL)a3
{
  self->_currentEpisodeDownloaded = a3;
}

- (void)setCountInfoButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
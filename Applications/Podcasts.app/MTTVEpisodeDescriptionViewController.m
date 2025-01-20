@interface MTTVEpisodeDescriptionViewController
- (MTEpisode)episode;
- (MTTVEpisodeDescriptionViewController)initWithEpisode:(id)a3;
- (MTTVEpisodeDescriptionViewController)initWithModelObject:(id)a3;
- (MTTVEpisodeDescriptionViewController)initWithPlayerItem:(id)a3;
- (MTTVEpisodeDescriptionViewControllerDelegate)delegate;
- (UITapGestureRecognizer)playButtonRecognizer;
- (id)_fetchDescription;
- (id)_fetchMetadata;
- (id)_fetchMetadataForModelObject:(id)a3;
- (id)_fetchMetadataForPlayerItem:(id)a3;
- (id)_fetchTitle;
- (void)playPauseButtonAction:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEpisode:(id)a3;
- (void)setPlayButtonRecognizer:(id)a3;
- (void)updateWithModelObject:(id)a3;
- (void)updateWithPlayerItem:(id)a3;
- (void)viewDidLoad;
@end

@implementation MTTVEpisodeDescriptionViewController

- (MTTVEpisodeDescriptionViewController)initWithEpisode:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTVEpisodeDescriptionViewController;
  v5 = -[IMTVScrollingTextViewController init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[MTTVEpisodeDescriptionViewController setEpisode:](v5, "setEpisode:", v4);
  }

  return v6;
}

- (MTTVEpisodeDescriptionViewController)initWithPlayerItem:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTVEpisodeDescriptionViewController;
  v5 = -[IMTVScrollingTextViewController init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[MTTVEpisodeDescriptionViewController updateWithPlayerItem:](v5, "updateWithPlayerItem:", v4);
  }

  return v6;
}

- (MTTVEpisodeDescriptionViewController)initWithModelObject:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTVEpisodeDescriptionViewController;
  v5 = -[IMTVScrollingTextViewController init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[MTTVEpisodeDescriptionViewController updateWithModelObject:](v5, "updateWithModelObject:", v4);
  }

  return v6;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTTVEpisodeDescriptionViewController;
  -[IMTVScrollingTextViewController viewDidLoad](&v7, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[UITapGestureRecognizer recognizerWithTarget:action:pressType:]( &OBJC_CLASS___UITapGestureRecognizer,  "recognizerWithTarget:action:pressType:",  self,  "playPauseButtonAction:",  6LL));
  -[MTTVEpisodeDescriptionViewController setPlayButtonRecognizer:](self, "setPlayButtonRecognizer:", v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDescriptionViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDescriptionViewController playButtonRecognizer](self, "playButtonRecognizer"));
  [v4 addGestureRecognizer:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor secondaryTextColorForDarkBackground:]( &OBJC_CLASS___UIColor,  "secondaryTextColorForDarkBackground:",  1LL));
  -[IMTVScrollingTextViewController setSubtitleTextColor:](self, "setSubtitleTextColor:", v6);
}

- (void)playPauseButtonAction:(id)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance", a3));
  if ([v6 isTargetPlaying])
  {
    [v6 pausePlayerTarget];
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDescriptionViewController delegate](self, "delegate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDescriptionViewController episode](self, "episode"));
    [v4 episodeDescriptionViewController:self playEpisode:v5];
  }
}

- (void)setEpisode:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDescriptionViewController _fetchTitle](self, "_fetchTitle"));
  -[IMTVScrollingTextViewController setTitleText:](self, "setTitleText:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDescriptionViewController _fetchMetadata](self, "_fetchMetadata"));
  -[IMTVScrollingTextViewController setSubtitleText:](self, "setSubtitleText:", v5);

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDescriptionViewController _fetchDescription](self, "_fetchDescription"));
  -[IMTVScrollingTextViewController setDescriptionText:](self, "setDescriptionText:", v6);
}

- (void)updateWithModelObject:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 title]);
  -[IMTVScrollingTextViewController setTitleText:](self, "setTitleText:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVEpisodeDescriptionViewController _fetchMetadataForModelObject:]( self,  "_fetchMetadataForModelObject:",  v4));
  -[IMTVScrollingTextViewController setSubtitleText:](self, "setSubtitleText:", v6);

  id v7 = (id)objc_claimAutoreleasedReturnValue([v4 descriptionText]);
  -[IMTVScrollingTextViewController setDescriptionText:](self, "setDescriptionText:", v7);
}

- (void)updateWithPlayerItem:(id)a3
{
  id v10 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v10 episode]);
  if (v4)
  {
    -[MTTVEpisodeDescriptionViewController setEpisode:](self, "setEpisode:", v4);
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDescriptionViewController episode](self, "episode"));

    if (v5)
    {
      episode = self->_episode;
      self->_episode = 0LL;
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v10 title]);
    -[IMTVScrollingTextViewController setTitleText:](self, "setTitleText:", v7);

    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVEpisodeDescriptionViewController _fetchMetadataForPlayerItem:]( self,  "_fetchMetadataForPlayerItem:",  v10));
    -[IMTVScrollingTextViewController setSubtitleText:](self, "setSubtitleText:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue([v10 itemDescription]);
    -[IMTVScrollingTextViewController setDescriptionText:](self, "setDescriptionText:", v9);
  }
}

- (id)_fetchTitle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDescriptionViewController episode](self, "episode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bestTitle]);

  return v3;
}

- (id)_fetchMetadata
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDescriptionViewController episode](self, "episode"));

  if (!v3) {
    return 0LL;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDescriptionViewController episode](self, "episode"));
  unsigned int v5 = [v4 isVideo];

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v7 = v6;
    objc_super v8 = @"Video";
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDescriptionViewController episode](self, "episode"));
    unsigned int v11 = [v10 isAudio];

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v7 = v6;
    if (v11) {
      objc_super v8 = @"Audio";
    }
    else {
      objc_super v8 = @"ATV_EXTERNAL_MEDIA_UNSUPPORTED_MEDIA_TYPE";
    }
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedStringForKey:v8 value:&stru_100248948 table:0]);

  v13 = 0LL;
  if (![0 length])
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDescriptionViewController episode](self, "episode"));
    [v14 duration];
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString prettyShortStringWithDuration:abbreviated:]( &OBJC_CLASS___NSString,  "prettyShortStringWithDuration:abbreviated:",  0LL));
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDescriptionViewController episode](self, "episode"));
  [v15 pubDate];
  if (v16 <= 0.0)
  {
    v18 = 0LL;
  }

  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDescriptionViewController episode](self, "episode"));
    [v17 pubDate];
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 verboseDisplayString]);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if ([v19 length]) {
    [v20 addObject:v19];
  }
  if ([v13 length]) {
    [v20 addObject:v13];
  }
  if ([v12 length]) {
    [v20 addObject:v12];
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 componentsJoinedByString:@"    "]);

  return v21;
}

- (id)_fetchMetadataForPlayerItem:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    unsigned int v5 = [v3 isVideo];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v7 = v6;
    if (v5) {
      objc_super v8 = @"Video";
    }
    else {
      objc_super v8 = @"Audio";
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedStringForKey:v8 value:&stru_100248948 table:0]);

    id v10 = 0LL;
    if (![0 length])
    {
      [v4 duration];
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString prettyShortStringWithDuration:abbreviated:]( &OBJC_CLASS___NSString,  "prettyShortStringWithDuration:abbreviated:",  0LL));
    }

    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v4 pubDate]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 verboseDisplayString]);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    if ([v12 length]) {
      [v13 addObject:v12];
    }
    if ([v10 length]) {
      [v13 addObject:v10];
    }
    if ([v9 length]) {
      [v13 addObject:v9];
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 componentsJoinedByString:@"    "]);
  }

  else
  {
    v14 = 0LL;
  }

  return v14;
}

- (id)_fetchMetadataForModelObject:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    unsigned int v5 = [v3 hasVideo];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v7 = v6;
    if (v5) {
      objc_super v8 = @"Video";
    }
    else {
      objc_super v8 = @"Audio";
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedStringForKey:v8 value:&stru_100248948 table:0]);

    id v10 = 0LL;
    if (![0 length])
    {
      [v4 duration];
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString prettyShortStringWithDuration:abbreviated:]( &OBJC_CLASS___NSString,  "prettyShortStringWithDuration:abbreviated:",  0LL));
    }

    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v4 podcast]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 author]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 name]);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    if ([v13 length]) {
      [v14 addObject:v13];
    }
    if ([v10 length]) {
      [v14 addObject:v10];
    }
    if ([v9 length]) {
      [v14 addObject:v9];
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 componentsJoinedByString:@"    "]);
  }

  else
  {
    v15 = 0LL;
  }

  return v15;
}

- (id)_fetchDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDescriptionViewController episode](self, "episode"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bestSummary]);

  return v3;
}

- (MTEpisode)episode
{
  return self->_episode;
}

- (MTTVEpisodeDescriptionViewControllerDelegate)delegate
{
  return (MTTVEpisodeDescriptionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (UITapGestureRecognizer)playButtonRecognizer
{
  return self->_playButtonRecognizer;
}

- (void)setPlayButtonRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
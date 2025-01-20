@interface TVHSeasonEpisodesViewController
+ (id)new;
- (TVHKMediaLibrary)mediaLibrary;
- (TVHMediaEntitiesDataSource)dataSource;
- (TVHMediaEntitiesShelfViewController)episodesShelfViewController;
- (TVHSeasonEpisodesView)episodesView;
- (TVHSeasonEpisodesViewController)init;
- (TVHSeasonEpisodesViewController)initWithCoder:(id)a3;
- (TVHSeasonEpisodesViewController)initWithMediaLibrary:(id)a3 dataSource:(id)a4;
- (TVHSeasonEpisodesViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVHSeasonEpisodesViewControllerDelegate)delegate;
- (UIView)scalableHeaderView;
- (id)titleForMediaEntitiesShelfViewController:(id)a3;
- (unint64_t)speedBumpEdges;
- (void)loadView;
- (void)mediaEntitiesShelfViewController:(id)a3 configureLockup:(id)a4 forMediaEntity:(id)a5;
- (void)mediaEntitiesShelfViewController:(id)a3 didFocusMediaEntity:(id)a4;
- (void)mediaEntitiesShelfViewController:(id)a3 didLongPressMediaEntity:(id)a4;
- (void)mediaEntitiesShelfViewController:(id)a3 didPlayMediaEntity:(id)a4;
- (void)mediaEntitiesShelfViewController:(id)a3 didSelectMediaEntity:(id)a4;
- (void)seasonEpisodeInfoViewDidSelectEpisodeDescription:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEpisodesShelfViewController:(id)a3;
- (void)setEpisodesView:(id)a3;
- (void)setSpeedBumpEdges:(unint64_t)a3;
@end

@implementation TVHSeasonEpisodesViewController

+ (id)new
{
  return 0LL;
}

- (TVHSeasonEpisodesViewController)init
{
  return 0LL;
}

- (TVHSeasonEpisodesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0LL;
}

- (TVHSeasonEpisodesViewController)initWithCoder:(id)a3
{
  return 0LL;
}

- (TVHSeasonEpisodesViewController)initWithMediaLibrary:(id)a3 dataSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TVHSeasonEpisodesViewController;
  v9 = -[TVHSeasonEpisodesViewController initWithNibName:bundle:](&v16, "initWithNibName:bundle:", 0LL, 0LL);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaLibrary, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[TVHSimpleLockupShelfViewLayout shelfViewLayoutWithContentViewSize:footerLayoutType:]( &OBJC_CLASS___TVHMediaEntitiesShelfViewLayout,  "shelfViewLayoutWithContentViewSize:footerLayoutType:",  0LL,  308.0,  175.0));
    objc_msgSend(v11, "setHeaderViewMargin:", 0.0, 90.0, 12.0, 0.0);
    v12 = -[TVHMediaEntitiesShelfViewController initWithDataSource:layout:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesShelfViewController),  "initWithDataSource:layout:",  v8,  v11);
    episodesShelfViewController = v10->_episodesShelfViewController;
    v10->_episodesShelfViewController = v12;

    -[TVHMediaEntitiesShelfViewController setShowsVibrantHeaderTitle:]( v10->_episodesShelfViewController,  "setShowsVibrantHeaderTitle:",  1LL);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShelfViewController collectionView](v10->_episodesShelfViewController, "collectionView"));
    objc_msgSend(v14, "setContentInset:", 0.0, 90.0, 0.0, 90.0);

    -[TVHMediaEntitiesShelfViewController setDelegate:](v10->_episodesShelfViewController, "setDelegate:", v10);
  }

  return v10;
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector( v5,  "seasonEpisodesViewController:didSelectEpisode:") & 1;
  if ((objc_opt_respondsToSelector(v5, "seasonEpisodesViewController:didLongPressEpisode:") & 1) != 0) {
    char v6 = 2;
  }
  else {
    char v6 = 0;
  }
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFD | v6;
  char v7 = objc_opt_respondsToSelector(v5, "seasonEpisodesViewController:didPlayEpisode:");

  if ((v7 & 1) != 0) {
    char v8 = 4;
  }
  else {
    char v8 = 0;
  }
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFB | v8;
}

- (TVHMediaEntitiesDataSource)dataSource
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodesViewController episodesShelfViewController](self, "episodesShelfViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dataSource]);

  return (TVHMediaEntitiesDataSource *)v3;
}

- (UIView)scalableHeaderView
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodesViewController episodesShelfViewController](self, "episodesShelfViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 scalableHeaderView]);

  return (UIView *)v3;
}

- (void)setSpeedBumpEdges:(unint64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodesViewController episodesShelfViewController](self, "episodesShelfViewController"));
  [v4 setSpeedBumpEdges:a3];
}

- (unint64_t)speedBumpEdges
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodesViewController episodesShelfViewController](self, "episodesShelfViewController"));
  id v3 = [v2 speedBumpEdges];

  return (unint64_t)v3;
}

- (void)loadView
{
  char v6 = objc_alloc_init(&OBJC_CLASS___TVHSeasonEpisodesView);
  -[TVHSeasonEpisodesViewController setEpisodesView:](self, "setEpisodesView:", v6);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodesView episodeInfoView](v6, "episodeInfoView"));
  [v3 setDelegate:self];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodesViewController episodesShelfViewController](self, "episodesShelfViewController"));
  -[TVHSeasonEpisodesViewController addChildViewController:](self, "addChildViewController:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 view]);
  -[TVHSeasonEpisodesView setEpisodesShelfView:](v6, "setEpisodesShelfView:", v5);
  [v4 didMoveToParentViewController:self];
  -[TVHSeasonEpisodesViewController setView:](self, "setView:", v6);
}

- (id)titleForMediaEntitiesShelfViewController:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 dataSource]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:@"SD_EPISODES_COUNT_FORMAT" value:0 table:0]);

  char v6 = (void *)objc_claimAutoreleasedReturnValue([v3 mediaEntities]);
  char v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( NSString,  "localizedStringWithFormat:",  v5,  [v6 count]));

  return v7;
}

- (void)mediaEntitiesShelfViewController:(id)a3 configureLockup:(id)a4 forMediaEntity:(id)a5
{
  id v28 = a4;
  id v7 = a5;
  char v8 = (void *)objc_claimAutoreleasedReturnValue([v28 layout]);
  [v8 contentViewSize];
  double v10 = v9;
  double v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodesViewController mediaLibrary](self, "mediaLibrary"));
  [v28 cornerRadius];
  double v15 = v14;
  [v28 focusedSizeIncrease];
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[TVImageProxy tvh_imageProxyWithMediaEntity:mediaLibrary:scaleToSize:scaleMode:cornerRadius:focusedSizeIncrease:]( &OBJC_CLASS___TVImageProxy,  "tvh_imageProxyWithMediaEntity:mediaLibrary:scaleToSize:scaleMode:cornerRadius:focusedSizeIncrease:",  v7,  v13,  2LL,  v10,  v12,  v15,  v16));

  [v28 setImageProxy:v17];
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[TVHPlaceholder placeholderForMediaEntity:containerSize:]( &OBJC_CLASS___TVHPlaceholder,  "placeholderForMediaEntity:containerSize:",  v7,  v10,  v12));
  [v28 setPlaceholder:v18];
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tvh_displayTitle"));
  [v28 setTitle:v19];

  [v28 setOverlayType:2];
  id v20 = [v7 playedState];
  double v21 = 0.0;
  if (v20 != (id)1)
  {
    if (v20 == (id)3)
    {
      double v21 = 1.0;
    }

    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue([v7 duration]);
      [v22 doubleValue];
      double v24 = v23;

      if (v24 > 0.0)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue([v7 bookmark]);
        [v25 doubleValue];
        double v27 = v26;

        double v21 = v27 / v24;
      }
    }
  }

  [v28 setPlaybackProgress:v21];
}

- (void)mediaEntitiesShelfViewController:(id)a3 didFocusMediaEntity:(id)a4
{
  id v5 = a4;
  id v17 = (id)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodesViewController episodesView](self, "episodesView"));
  char v6 = (void *)objc_claimAutoreleasedReturnValue([v17 episodeInfoView]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tvh_displayTitle"));
  [v6 setTitle:v7];

  char v8 = (void *)objc_claimAutoreleasedReturnValue([v5 episodeNumber]);
  [v6 setEpisodeNumber:v8];

  double v9 = (void *)objc_claimAutoreleasedReturnValue([v5 duration]);
  [v6 setDuration:v9];

  objc_msgSend(v6, "setHighDefinition:", objc_msgSend(v5, "tvh_isHighDefinition"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v5 releaseDate]);
  [v6 setReleaseDate:v10];

  double v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tvh_displayGenreTitle"));
  [v6 setGenreTitle:v11];

  double v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tvh_contentDescriptionAttributedString"));
  [v6 setEpisodeDescription:v12];

  v13 = (void *)objc_claimAutoreleasedReturnValue([v5 contentRating]);
  double v14 = (void *)objc_claimAutoreleasedReturnValue( +[VUIContentRatingBadgeManager sharedInstance]( &OBJC_CLASS___VUIContentRatingBadgeManager,  "sharedInstance"));
  double v15 = (void *)objc_claimAutoreleasedReturnValue([v14 badgeForContentRating:v13 drawUnknownRatingBadge:0]);

  double v16 = (void *)objc_claimAutoreleasedReturnValue([v13 ratingLabel]);
  [v6 setContentRatingBadgeImage:v15 badgeText:v16];
}

- (void)mediaEntitiesShelfViewController:(id)a3 didSelectMediaEntity:(id)a4
{
  if ((*(_BYTE *)&self->_delegateFlags & 1) != 0)
  {
    id v5 = a4;
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodesViewController delegate](self, "delegate"));
    [v6 seasonEpisodesViewController:self didSelectEpisode:v5];
  }

- (void)mediaEntitiesShelfViewController:(id)a3 didLongPressMediaEntity:(id)a4
{
  if ((*(_BYTE *)&self->_delegateFlags & 2) != 0)
  {
    id v5 = a4;
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodesViewController delegate](self, "delegate"));
    [v6 seasonEpisodesViewController:self didLongPressEpisode:v5];
  }

- (void)mediaEntitiesShelfViewController:(id)a3 didPlayMediaEntity:(id)a4
{
  if ((*(_BYTE *)&self->_delegateFlags & 4) != 0)
  {
    id v5 = a4;
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodesViewController delegate](self, "delegate"));
    [v6 seasonEpisodesViewController:self didPlayEpisode:v5];
  }

- (void)seasonEpisodeInfoViewDidSelectEpisodeDescription:(id)a3
{
  id v4 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue([v4 title]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 episodeDescription]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 string]);
  id v7 = [[TVSUITextAlertController alloc] initWithTitle:v8 text:v6];
  -[TVHSeasonEpisodesViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v7,  1LL,  0LL);
}

- (TVHSeasonEpisodesViewControllerDelegate)delegate
{
  return (TVHSeasonEpisodesViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (TVHKMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (TVHMediaEntitiesShelfViewController)episodesShelfViewController
{
  return self->_episodesShelfViewController;
}

- (void)setEpisodesShelfViewController:(id)a3
{
}

- (TVHSeasonEpisodesView)episodesView
{
  return self->_episodesView;
}

- (void)setEpisodesView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
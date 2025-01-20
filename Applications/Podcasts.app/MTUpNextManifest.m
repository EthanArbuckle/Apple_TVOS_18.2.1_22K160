@interface MTUpNextManifest
- (BOOL)defaultToInitialIndexZero;
- (MTPlayerController)playerController;
- (MTUpNextManifest)initWithPlayerController:(id)a3;
- (void)_mediaItemDidChange:(id)a3;
- (void)_upNextItemsDidChange;
- (void)_updateUpNext;
- (void)dealloc;
- (void)setCurrentIndex:(unint64_t)a3;
- (void)setPlayerController:(id)a3;
@end

@implementation MTUpNextManifest

- (MTUpNextManifest)initWithPlayerController:(id)a3
{
  id v4 = a3;
  -[MTUpNextManifest setPlayerController:](self, "setPlayerController:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 upNextController]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 items]);

  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MTUpNextManifest;
  v7 = -[MTItemListManifest initWithItems:](&v14, "initWithItems:", v6);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v9 = IMAVPlayerNotification_MediaItemDidChange;
    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 player]);
    [v8 addObserver:v7 selector:"_mediaItemDidChange:" name:v9 object:v10];

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 upNextController]);
    [v11 addObserver:v7 selector:"_upNextItemsDidChange" name:@"MTUpNextControllerItemsDidChange" object:v12];
  }

  return v7;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTUpNextManifest;
  -[MTUpNextManifest dealloc](&v4, "dealloc");
}

- (void)setCurrentIndex:(unint64_t)a3
{
  unint64_t v3 = a3;
  if (a3 && a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextManifest playerController](self, "playerController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 upNextController]);
    [v6 beginUpdates];

    do
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextManifest playerController](self, "playerController"));
      v8 = (void *)objc_claimAutoreleasedReturnValue([v7 upNextController]);
      [v8 removeEpisodeAtIndex:0];

      --v3;
    }

    while (v3);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextManifest playerController](self, "playerController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 upNextController]);
    [v10 endUpdates];

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextManifest playerController](self, "playerController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 upNextController]);
    if ([v12 count]) {
      uint64_t v13 = 0LL;
    }
    else {
      uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    }

    -[MTUpNextManifest setCurrentIndex:]( &v15,  "setCurrentIndex:",  v13,  v14.receiver,  v14.super_class,  self,  &OBJC_CLASS___MTUpNextManifest);
  }

  else
  {
    -[MTUpNextManifest setCurrentIndex:]( &v14,  "setCurrentIndex:",  a3,  self,  &OBJC_CLASS___MTUpNextManifest,  v15.receiver,  v15.super_class);
  }

- (BOOL)defaultToInitialIndexZero
{
  return 0;
}

- (void)_upNextItemsDidChange
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000C6CDC;
  v2[3] = &unk_10023FF98;
  v2[4] = self;
  +[IMAVPlayer performOnMainQueue:](&OBJC_CLASS___IMAVPlayer, "performOnMainQueue:", v2);
}

- (void)_mediaItemDidChange:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v11 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:IMAVPlayerNotificationKey_OldMediaItem]);

  v5 = v11;
  if (v11)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTUpNextManifest currentItem](self, "currentItem"));
    if (v11 != v6)
    {
LABEL_5:

      v5 = v11;
      goto LABEL_6;
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextManifest playerController](self, "playerController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 upNextController]);
    id v9 = [v8 count];

    v5 = v11;
    if (v9)
    {
      id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTUpNextManifest playerController](self, "playerController"));
      v10 = (void *)objc_claimAutoreleasedReturnValue([v6 upNextController]);
      [v10 removeEpisodeAtIndex:0];

      goto LABEL_5;
    }
  }

- (void)_updateUpNext
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTUpNextManifest playerController](self, "playerController"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 upNextController]);
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 items]);

  -[MTItemListManifest setItems:](self, "setItems:", v5);
}

- (MTPlayerController)playerController
{
  return (MTPlayerController *)objc_loadWeakRetained((id *)&self->_playerController);
}

- (void)setPlayerController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
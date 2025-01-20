@interface MTManifestResultsController
- (MTManifestResultsController)initWithPlayerController:(id)a3;
- (MTPlayerManifest)manifest;
- (unint64_t)startingIndexForDisplay;
- (void)_manifestDidChange;
- (void)dealloc;
- (void)reloadData;
- (void)setManifest:(id)a3;
@end

@implementation MTManifestResultsController

- (MTManifestResultsController)initWithPlayerController:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MTManifestResultsController;
  v5 = -[MTListResultsController init](&v10, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v7 = IMAVPlayerNotification_MediaItemDidChange;
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 player]);
    [v6 addObserver:v5 selector:"_manifestDidChange" name:v7 object:v8];
  }

  return v5;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTManifestResultsController;
  -[MTManifestResultsController dealloc](&v4, "dealloc");
}

- (void)setManifest:(id)a3
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 addObserver:self selector:"_manifestDidChange" name:IMPlayerManifestDidChange object:v5];

  -[MTManifestResultsController reloadData](self, "reloadData");
}

- (unint64_t)startingIndexForDisplay
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTManifestResultsController manifest](self, "manifest"));
  id v3 = [v2 currentIndex];

  if (v3 == (id)0x7FFFFFFFFFFFFFFFLL) {
    return 0LL;
  }
  else {
    return (unint64_t)v3;
  }
}

- (void)reloadData
{
  id v3 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTManifestResultsController manifest](self, "manifest"));
  objc_super v10 = -[NSMutableArray initWithCapacity:](v3, "initWithCapacity:", [v4 count]);

  for (unint64_t i = -[MTManifestResultsController startingIndexForDisplay](self, "startingIndexForDisplay"); ; ++i)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTManifestResultsController manifest](self, "manifest"));
    id v7 = [v6 count];

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTManifestResultsController manifest](self, "manifest"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:i]);

    if (v9) {
      -[NSMutableArray addObject:](v10, "addObject:", v9);
    }
  }

  -[MTListResultsController setObjects:](self, "setObjects:", v10);
}

- (void)_manifestDidChange
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011E2A4;
  block[3] = &unk_10023FF98;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (MTPlayerManifest)manifest
{
  return self->_manifest;
}

- (void).cxx_destruct
{
}

@end
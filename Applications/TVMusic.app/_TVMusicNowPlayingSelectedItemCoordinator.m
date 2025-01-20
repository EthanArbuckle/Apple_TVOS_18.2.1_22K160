@interface _TVMusicNowPlayingSelectedItemCoordinator
- (_TVMusicNowPlayingSelectedItemCoordinator)init;
- (id)completionHandler;
- (void)_finishIfPossible;
- (void)beginObservingVideoPlayerViewController:(id)a3;
- (void)invalidate;
- (void)notifyEventTrackChanged;
- (void)setCompletionHandler:(id)a3;
@end

@implementation _TVMusicNowPlayingSelectedItemCoordinator

- (_TVMusicNowPlayingSelectedItemCoordinator)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____TVMusicNowPlayingSelectedItemCoordinator;
  result = -[_TVMusicNowPlayingSelectedItemCoordinator init](&v3, "init");
  if (result) {
    result->_readyForDisplay = 1;
  }
  return result;
}

- (void)beginObservingVideoPlayerViewController:(id)a3
{
  id v4 = a3;
  self->_readyForDisplay = 0;
  objc_initWeak(&location, self);
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  v14 = sub_1000D87D8;
  v15 = sub_1000D87E8;
  id v16 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000D87F0;
  v9[3] = &unk_10026E1E0;
  objc_copyWeak(&v10, &location);
  v9[4] = &v11;
  uint64_t v7 = objc_claimAutoreleasedReturnValue( [v5 addObserverForName:@"TVMusicVideoPlayerViewControllerReadyForDisplayNotification" object:v4 queue:v6 usingBlock:v9]);
  v8 = (void *)v12[5];
  v12[5] = v7;

  _Block_object_dispose(&v11, 8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)notifyEventTrackChanged
{
  if (!self->_trackChanged)
  {
    self->_trackChanged = 1;
    -[_TVMusicNowPlayingSelectedItemCoordinator _finishIfPossible](self, "_finishIfPossible");
  }

- (void)_finishIfPossible
{
  if (self->_trackChanged && self->_readyForDisplay && !self->_finished)
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[_TVMusicNowPlayingSelectedItemCoordinator completionHandler](self, "completionHandler"));

    if (v3)
    {
      id v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[_TVMusicNowPlayingSelectedItemCoordinator completionHandler](self, "completionHandler"));
      v4[2]();

      -[_TVMusicNowPlayingSelectedItemCoordinator setCompletionHandler:](self, "setCompletionHandler:", 0LL);
    }

    self->_finished = 1;
  }

- (void)invalidate
{
  self->_finished = 1;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
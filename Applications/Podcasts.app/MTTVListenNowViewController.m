@interface MTTVListenNowViewController
- (MTTVListenNowViewController)init;
- (MTUuidQueryObserver)podcastsObserver;
- (id)emptyContentViewControllerForCurrentPodcastState;
- (unint64_t)podcastState;
- (void)setPodcastState:(unint64_t)a3;
- (void)setPodcastsObserver:(id)a3;
- (void)startObserveringPodcasts;
- (void)viewDidLoad;
@end

@implementation MTTVListenNowViewController

- (MTTVListenNowViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTVListenNowViewController;
  v2 = -[MTTVEpisodeSplitViewController init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (objc_class *)objc_opt_class(v2);
    v5 = NSStringFromClass(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[MTTVListenNowViewController setRestorationIdentifier:](v3, "setRestorationIdentifier:", v6);

    v3->_podcastState = 0LL;
  }

  return v3;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTTVListenNowViewController;
  -[MTTVEpisodeSplitViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = objc_opt_new(&OBJC_CLASS___MTTVListenNowEpisodeListViewController);
  -[MTTVEpisodeSplitViewController setEpisodeList:](self, "setEpisodeList:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVListenNowViewController emptyContentViewControllerForCurrentPodcastState]( self,  "emptyContentViewControllerForCurrentPodcastState"));
  -[MTTVEpisodeSplitViewController setEmptyContentViewController:](self, "setEmptyContentViewController:", v4);

  -[MTTVListenNowViewController startObserveringPodcasts](self, "startObserveringPodcasts");
}

- (void)startObserveringPodcasts
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[MTPodcast predicateForNotHiddenNotImplicitlyFollowedPodcasts]( &OBJC_CLASS___MTPodcast,  "predicateForNotHiddenNotImplicitlyFollowedPodcasts"));
  objc_initWeak(&location, self);
  v4 = objc_alloc(&OBJC_CLASS___MTUuidQueryObserver);
  objc_super v5 = -[MTUuidQueryObserver initWithEntityName:predicate:]( v4,  "initWithEntityName:predicate:",  kMTPodcastEntityName,  v3);
  -[MTTVListenNowViewController setPodcastsObserver:](self, "setPodcastsObserver:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVListenNowViewController podcastsObserver](self, "podcastsObserver"));
  v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  v11 = sub_100033620;
  v12 = &unk_1002412D8;
  objc_copyWeak(&v13, &location);
  id v7 = [v6 addResultsChangedHandler:&v9];

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVListenNowViewController podcastsObserver](self, "podcastsObserver", v9, v10, v11, v12));
  [v8 startObserving];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)setPodcastState:(unint64_t)a3
{
  if (self->_podcastState != a3)
  {
    self->_podcastState = a3;
    id v4 = (id)objc_claimAutoreleasedReturnValue( -[MTTVListenNowViewController emptyContentViewControllerForCurrentPodcastState]( self,  "emptyContentViewControllerForCurrentPodcastState"));
    -[MTTVEpisodeSplitViewController setEmptyContentViewController:](self, "setEmptyContentViewController:", v4);
  }

- (id)emptyContentViewControllerForCurrentPodcastState
{
  unint64_t v2 = -[MTTVListenNowViewController podcastState](self, "podcastState");
  v3 = off_10023E380;
  if (v2) {
    v3 = off_10023E388;
  }
  return (id)objc_opt_new(*v3);
}

- (MTUuidQueryObserver)podcastsObserver
{
  return self->_podcastsObserver;
}

- (void)setPodcastsObserver:(id)a3
{
}

- (unint64_t)podcastState
{
  return self->_podcastState;
}

- (void).cxx_destruct
{
}

@end
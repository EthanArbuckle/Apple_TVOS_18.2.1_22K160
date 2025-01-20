@interface MTTVStationDetailViewController
- (MTPlaylist)playlist;
- (MTTVStationDetailViewController)initWithPlaylist:(id)a3;
- (id)placeholderDetailViewController;
- (void)_masterListFocusDidChange;
- (void)viewDidLoad;
@end

@implementation MTTVStationDetailViewController

- (MTTVStationDetailViewController)initWithPlaylist:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MTTVStationDetailViewController;
  v6 = -[MTTVEpisodeSplitViewController init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_playlist, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTVStationDetailViewController;
  -[MTTVEpisodeSplitViewController viewDidLoad](&v8, "viewDidLoad");
  v3 = objc_alloc(&OBJC_CLASS___MTTVStationEpisodeListViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationDetailViewController playlist](self, "playlist"));
  id v5 = -[MTTVStationEpisodeListViewController initWithPlaylist:](v3, "initWithPlaylist:", v4);
  -[MTTVEpisodeSplitViewController setEpisodeList:](self, "setEpisodeList:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationDetailViewController playlist](self, "playlist"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
  -[MTTVStationDetailViewController setTitle:](self, "setTitle:", v7);
}

- (id)placeholderDetailViewController
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MTTVStationDetailViewController;
  v3 = -[MTTVEpisodeSplitViewController placeholderDetailViewController](&v9, "placeholderDetailViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  if (!v4)
  {
    id v5 = objc_opt_new(&OBJC_CLASS___MTTVStationPlaceholderViewController);
    -[MTTVEpisodeSplitViewController setPlaceholderDetailViewController:]( self,  "setPlaceholderDetailViewController:",  v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTVStationDetailViewController;
  v6 = -[MTTVEpisodeSplitViewController placeholderDetailViewController](&v8, "placeholderDetailViewController");
  return (id)objc_claimAutoreleasedReturnValue(v6);
}

- (void)_masterListFocusDidChange
{
  if (-[MTTVEpisodeSplitViewController _isShowingDetailViewController](self, "_isShowingDetailViewController")) {
    -[MTTVEpisodeSplitViewController _showDetailViewController:animated:]( self,  "_showDetailViewController:animated:",  0LL,  1LL);
  }
}

- (MTPlaylist)playlist
{
  return self->_playlist;
}

- (void).cxx_destruct
{
}

@end
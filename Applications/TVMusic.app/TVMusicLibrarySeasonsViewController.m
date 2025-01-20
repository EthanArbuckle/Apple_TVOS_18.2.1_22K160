@interface TVMusicLibrarySeasonsViewController
- (TVMusicLibraryHeaderView)titleHeaderView;
- (TVMusicLibrarySeasonsViewController)initWithTitle:(id)a3 libraryRequest:(id)a4;
- (id)additionalHeaderControls;
- (id)cellForItemAtIndexPath:(id)a3;
- (id)genericObjectForItemAtIndexPath:(id)a3;
- (void)_selectedAllSeasons;
- (void)collectionView:(id)a3 didReceiveLongPressForItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)setTitleHeaderView:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVMusicLibrarySeasonsViewController

- (TVMusicLibrarySeasonsViewController)initWithTitle:(id)a3 libraryRequest:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TVMusicLibrarySeasonsViewController;
  v4 = -[TVMusicMPRequestViewController initWithTitle:libraryRequest:pageType:]( &v16,  "initWithTitle:libraryRequest:pageType:",  a3,  a4,  0LL);
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___TVMusicLibraryHeaderView);
    titleHeaderView = v4->_titleHeaderView;
    v4->_titleHeaderView = v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[TVMusicLibraryButtonFactory allSeasonsButton]( &OBJC_CLASS___TVMusicLibraryButtonFactory,  "allSeasonsButton"));
    allSeasonsButton = v4->_allSeasonsButton;
    v4->_allSeasonsButton = (UIControl *)v7;

    -[UIControl addTarget:action:forControlEvents:]( v4->_allSeasonsButton,  "addTarget:action:forControlEvents:",  v4,  "_selectedAllSeasons",  0x2000LL);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager title2Font](&OBJC_CLASS___TVThemeManager, "title2Font"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySeasonsViewController titleHeaderView](v4, "titleHeaderView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 titleLabel]);
    [v11 setFont:v9];

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySeasonsViewController title](v4, "title"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySeasonsViewController titleHeaderView](v4, "titleHeaderView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 titleLabel]);
    [v14 setText:v12];
  }

  return v4;
}

- (void)viewDidLoad
{
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___TVMusicLibrarySeasonsViewController;
  -[TVMusicMPRequestViewController viewDidLoad](&v30, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySeasonsViewController titleHeaderView](self, "titleHeaderView"));
  [v3 addSubview:v4];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySeasonsViewController titleHeaderView](self, "titleHeaderView"));
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySeasonsViewController titleHeaderView](self, "titleHeaderView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue([v29 leadingAnchor]);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue([v28 leadingAnchor]);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v27 constraintEqualToAnchor:v26]);
  v31[0] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySeasonsViewController titleHeaderView](self, "titleHeaderView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v24 trailingAnchor]);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySeasonsViewController view](self, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v23 trailingAnchor]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v22 constraintEqualToAnchor:v21]);
  v31[1] = v20;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySeasonsViewController titleHeaderView](self, "titleHeaderView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v19 topAnchor]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 overlayLayoutView]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 topAnchor]);
  -[TVMusicMPRequestViewController headerVerticalOffset](self, "headerVerticalOffset");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:constant:", v9));
  v31[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySeasonsViewController titleHeaderView](self, "titleHeaderView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 heightAnchor]);
  -[TVMusicMPRequestViewController cellsTopMargin](self, "cellsTopMargin");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToConstant:"));
  v31[3] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 4LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySeasonsViewController titleHeaderView](self, "titleHeaderView"));
  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue([v15 titleLabel]);
  [v16 setMarqueeEnabled:1];

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySeasonsViewController titleHeaderView](self, "titleHeaderView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 titleLabel]);
  [v18 setMarqueeRunning:1];
}

- (id)additionalHeaderControls
{
  allSeasonsButton = self->_allSeasonsButton;
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &allSeasonsButton,  1LL));
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
  id v10 = (id)objc_claimAutoreleasedReturnValue([v6 itemAtIndexPath:v5]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory TVEpisodesLibraryRequestForShow:season:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "TVEpisodesLibraryRequestForShow:season:",  0LL,  v10));
  v8 = -[TVMusicLibraryEpisodesViewController initWithSeason:libraryRequest:]( objc_alloc(&OBJC_CLASS___TVMusicLibraryEpisodesViewController),  "initWithSeason:libraryRequest:",  v10,  v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicLibrarySeasonsViewController navigationController](self, "navigationController"));
  [v9 pushViewController:v8 animated:1];
}

- (id)cellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController collectionView](self, "collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 dequeueReusableCellWithReuseIdentifier:@"TVMusicCollectionViewCellIdentifier" forIndexPath:v4]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 itemAtIndexPath:v4]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 artworkCatalog]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:@"MusicLibrarySeasonTitle" value:&stru_100279068 table:0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( NSString,  "localizedStringWithFormat:",  v11,  [v8 number]));

  [v6 setTitle:v12];
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory TVEpisodesLibraryRequestForShow:season:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "TVEpisodesLibraryRequestForShow:season:",  0LL,  v8));
  objc_initWeak(&location, v6);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10008212C;
  v19[3] = &unk_10026BE28;
  objc_copyWeak(&v22, &location);
  id v14 = v6;
  id v20 = v14;
  id v15 = v12;
  id v21 = v15;
  [v13 performWithResponseHandler:v19];
  -[TVMusicMPRequestViewController artworkSize](self, "artworkSize");
  objc_msgSend(v14, "setArtworkCatalog:withFittingSize:", v9);
  objc_super v16 = v21;
  id v17 = v14;

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return v17;
}

- (void)collectionView:(id)a3 didReceiveLongPressForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
  id v7 = (id)objc_claimAutoreleasedReturnValue([v6 itemAtIndexPath:v5]);

  +[TVMusicLibraryUtilities showContextMenuForLibraryObject:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "showContextMenuForLibraryObject:",  v7);
}

- (id)genericObjectForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 itemAtIndexPath:v4]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelGenericObject genericObjectWithModelObject:]( &OBJC_CLASS___MPModelGenericObject,  "genericObjectWithModelObject:",  v6));
  return v7;
}

- (void)_selectedAllSeasons
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
  uint64_t v4 = (uint64_t)[v3 totalItemCount];

  if (v4 >= 1)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPRequestViewController mpResults](self, "mpResults"));
    id v14 = (id)objc_claimAutoreleasedReturnValue([v5 firstItem]);

    v6 = (void *)objc_claimAutoreleasedReturnValue([v14 representativeEpisode]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifiers]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 universalStore]);
    id v9 = [v8 subscriptionAdamID];

    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v9));
      id v11 = sub_100093080(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicAppDelegate theApp](&OBJC_CLASS___TVMusicAppDelegate, "theApp"));
        [v13 openJavascriptAppWithURL:v12];
      }
    }
  }

- (TVMusicLibraryHeaderView)titleHeaderView
{
  return self->_titleHeaderView;
}

- (void)setTitleHeaderView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
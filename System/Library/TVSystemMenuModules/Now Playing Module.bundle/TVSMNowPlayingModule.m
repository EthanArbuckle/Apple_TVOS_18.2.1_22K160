@interface TVSMNowPlayingModule
+ (id)availableStyles;
- (BOOL)_routeConnectionHasTitleInformation;
- (BOOL)dismissAfterAction;
- (BOOL)isPlaying;
- (NSCopying)metadataObserverToken;
- (TVNPEndpointRouteConnection)routeConnection;
- (TVSMButtonViewController)buttonViewController;
- (TVSMNowPlayingModule)init;
- (id)analyticsActionType;
- (id)analyticsElementInfo;
- (id)contentViewController;
- (void)_handleMediaRemoteNowPlayingPlayerResponse:(id)a3;
- (void)_updateButtonViewController;
- (void)_updateMediaTypeGlyphWithMediaRemoteContentItem:(id)a3;
- (void)_updateNowPlayingTitleWithMediaRemoteQueue:(id)a3;
- (void)dealloc;
- (void)handleAction;
@end

@implementation TVSMNowPlayingModule

+ (id)availableStyles
{
  return &off_C998;
}

- (TVSMNowPlayingModule)init
{
  SEL v21 = a2;
  v22 = 0LL;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___TVSMNowPlayingModule;
  v11 = -[TVSMNowPlayingModule init](&v20, "init");
  v22 = v11;
  objc_storeStrong((id *)&v22, v11);
  if (v11)
  {
    v2 = objc_alloc_init(&OBJC_CLASS___TVSMButtonViewController);
    buttonViewController = v22->_buttonViewController;
    v22->_buttonViewController = v2;

    -[TVSMButtonViewController setStyle:]( v22->_buttonViewController,  "setStyle:",  -[TVSMNowPlayingModule style](v22, "style"));
    -[TVSMButtonViewController setImageSymbolName:]( v22->_buttonViewController,  "setImageSymbolName:",  @"tv.inset.filled");
    -[TVSMButtonViewController setDelegate:](v22->_buttonViewController, "setDelegate:", v22);
    id v19 = +[MPAVRoutingController systemRoute](&OBJC_CLASS___MPAVRoutingController, "systemRoute");
    v4 = -[TVNPEndpointRouteConnection initWithRoute:]( objc_alloc(&OBJC_CLASS___TVNPEndpointRouteConnection),  "initWithRoute:",  v19);
    routeConnection = v22->_routeConnection;
    v22->_routeConnection = v4;

    -[TVNPEndpointRouteConnection connectAndPair](v22->_routeConnection, "connectAndPair");
    objc_initWeak(&v18, v22);
    v10 = v22->_routeConnection;
    v12 = _NSConcreteStackBlock;
    int v13 = -1073741824;
    int v14 = 0;
    v15 = sub_7984;
    v16 = &unk_C450;
    objc_copyWeak(&v17, &v18);
    v6 = (NSCopying *) -[TVNPEndpointRouteConnection registerMetadataUpdateHandler:]( v10,  "registerMetadataUpdateHandler:",  &v12);
    metadataObserverToken = v22->_metadataObserverToken;
    v22->_metadataObserverToken = v6;

    -[TVSMNowPlayingModule _updateButtonViewController](v22, "_updateButtonViewController");
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v18);
    objc_storeStrong(&v19, 0LL);
  }

  v9 = v22;
  objc_storeStrong((id *)&v22, 0LL);
  return v9;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[TVNPEndpointRouteConnection deregisterMetadataUpdateHandler:]( self->_routeConnection,  "deregisterMetadataUpdateHandler:",  self->_metadataObserverToken);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSMNowPlayingModule;
  -[TVSMNowPlayingModule dealloc](&v2, "dealloc");
}

- (id)contentViewController
{
  return self->_buttonViewController;
}

- (BOOL)dismissAfterAction
{
  return 1;
}

- (void)handleAction
{
  if ((char *)-[TVNPEndpointRouteConnection playbackState](self->_routeConnection, "playbackState") == (char *)&dword_0 + 1)
  {
    v6 = +[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication");
    v5 = +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"com.apple.TVMusic://");
    -[UIApplication openURL:options:completionHandler:](v6, "openURL:options:completionHandler:");
  }

  else
  {
    id v4 = +[PBSSystemServiceConnection sharedConnection](&OBJC_CLASS___PBSSystemServiceConnection, "sharedConnection");
    id v3 = [v4 systemServiceProxy];
    objc_super v2 = +[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary");
    objc_msgSend(v3, "presentNowPlayingWithOptions:completion:");
  }

- (id)analyticsActionType
{
  return TVSMClickAnalyticsActionTypeNavigate;
}

- (id)analyticsElementInfo
{
  uint64_t v4 = TVSMAnalyticsElementTypeControl;
  id v5 = -[TVSMNowPlayingModule style](self, "style");
  if (-[TVSMNowPlayingModule isPlaying](self, "isPlaying")) {
    uint64_t v3 = TVSMAnalyticsElementStateActive;
  }
  else {
    uint64_t v3 = TVSMAnalyticsElementStateInactive;
  }
  return +[TVSMAnalyticsElementInfo infoWithIdentifier:targetType:displayStyle:elementState:]( &OBJC_CLASS___TVSMAnalyticsElementInfo,  "infoWithIdentifier:targetType:displayStyle:elementState:",  @"music",  v4,  v5,  v3);
}

- (void)_updateButtonViewController
{
  SEL v21 = self;
  location[1] = (id)a2;
  if ((char *)-[TVNPEndpointRouteConnection playbackState](self->_routeConnection, "playbackState") == (char *)&dword_0 + 1)
  {
    v21->_playing = 0;
    buttonViewController = v21->_buttonViewController;
    v9 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v21));
    v8 =  -[NSBundle localizedStringForKey:value:table:]( v9,  "localizedStringForKey:value:table:",  @"ChooseMusicTitle",  &stru_C8C0,  @"Localizable");
    -[TVSMButtonViewController setTitleText:](buttonViewController, "setTitleText:");

    -[TVSMButtonViewController setSecondaryText:](v21->_buttonViewController, "setSecondaryText:", 0LL);
  }

  else
  {
    v21->_playing = 1;
    if (-[TVSMNowPlayingModule _routeConnectionHasTitleInformation](v21, "_routeConnectionHasTitleInformation"))
    {
      id v5 = v21->_buttonViewController;
      v6 = -[TVNPEndpointRouteConnection title](v21->_routeConnection, "title");
      -[TVSMButtonViewController setTitleText:](v5, "setTitleText:");
    }

    location[0] = 0LL;
    id v19 = -[TVNPEndpointRouteConnection artist](v21->_routeConnection, "artist");
    id v18 = -[TVNPEndpointRouteConnection album](v21->_routeConnection, "album");
    if ([v19 length] && objc_msgSend(v18, "length"))
    {
      objc_super v2 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ — %@", v19, v18);
      id v3 = location[0];
      location[0] = v2;
    }

    else if ([v19 length])
    {
      objc_storeStrong(location, v19);
    }

    else if ([v18 length])
    {
      objc_storeStrong(location, v18);
    }

    -[TVSMButtonViewController setSecondaryText:](v21->_buttonViewController, "setSecondaryText:", location[0]);
    objc_storeStrong(&v18, 0LL);
    objc_storeStrong(&v19, 0LL);
    objc_storeStrong(location, 0LL);
  }

  id v17 = +[MRNowPlayingController localRouteController](&OBJC_CLASS___MRNowPlayingController, "localRouteController");
  objc_initWeak(&v16, v21);
  id v4 = v17;
  v10 = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  int v13 = sub_819C;
  int v14 = &unk_C4E0;
  objc_copyWeak(&v15, &v16);
  [v4 performRequestWithCompletion:&v10];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v16);
  objc_storeStrong(&v17, 0LL);
}

- (void)_handleMediaRemoteNowPlayingPlayerResponse:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = [location[0] playbackQueue];
  id v4 = [v5 contentItems];
  id v3 = [v4 firstObject];
  -[TVSMNowPlayingModule _updateMediaTypeGlyphWithMediaRemoteContentItem:]( v7,  "_updateMediaTypeGlyphWithMediaRemoteContentItem:",  v3);
  if (v3 && !-[TVSMNowPlayingModule _routeConnectionHasTitleInformation](v7, "_routeConnectionHasTitleInformation")) {
    -[TVSMNowPlayingModule _updateNowPlayingTitleWithMediaRemoteQueue:]( v7,  "_updateNowPlayingTitleWithMediaRemoteQueue:",  v5);
  }
  objc_storeStrong(&v3, 0LL);
  objc_storeStrong(&v4, 0LL);
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_updateNowPlayingTitleWithMediaRemoteQueue:(id)a3
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v10 = [location[0] resolvedPlayerPath];
  id v9 = [v10 client];
  id v13 = [v9 bundleIdentifier];

  char v12 = [v13 containsString:@"TVAirPlay"] & 1;
  int v11 = 0LL;
  if (v12)
  {
    v8 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v15));
    id v3 =  -[NSBundle localizedStringForKey:value:table:]( v8,  "localizedStringForKey:value:table:",  @"GenericNowPlayingTitle",  &stru_C8C0,  @"Localizable");
    id v4 = v11;
    int v11 = v3;
  }

  else
  {
    v7 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v15));
    id v5 =  -[NSBundle localizedStringForKey:value:table:]( v7,  "localizedStringForKey:value:table:",  @"GenericNowPlayingTitle",  &stru_C8C0,  @"Localizable");
    v6 = v11;
    int v11 = v5;
  }

  -[TVSMButtonViewController setTitleText:](v15->_buttonViewController, "setTitleText:", v11);
  objc_storeStrong((id *)&v11, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_updateMediaTypeGlyphWithMediaRemoteContentItem:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = 0LL;
  id v6 = [location[0] metadata];
  if ([v6 hasMediaSubType])
  {
    id v5 = [v6 mediaSubType];
    if ((unint64_t)v5 <= 7) {
      __asm { BR              X8 }
    }
  }

  if ([v6 hasMediaType])
  {
    id v4 = (char *)[v6 mediaType];
    if (v4)
    {
      if (v4 == (_BYTE *)&dword_0 + 1)
      {
        objc_storeStrong(&v7, @"music");
      }

      else if (v4 == (_BYTE *)&dword_0 + 2)
      {
        objc_storeStrong(&v7, @"play.tv.fill");
      }
    }
  }

  if (!v7) {
    objc_storeStrong(&v7, @"tv.inset.filled");
  }
  -[TVSMButtonViewController setImageSymbolName:](v9->_buttonViewController, "setImageSymbolName:", v7, &v7);
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(v3, 0LL);
  objc_storeStrong(location, 0LL);
}

- (BOOL)_routeConnectionHasTitleInformation
{
  id v5 = -[TVNPEndpointRouteConnection title](self->_routeConnection, "title");
  id v4 = +[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet");
  id v3 = -[NSString stringByTrimmingCharactersInSet:](v5, "stringByTrimmingCharactersInSet:");
  BOOL v6 = -[NSString length](v3, "length") != 0;

  return v6;
}

- (TVSMButtonViewController)buttonViewController
{
  return self->_buttonViewController;
}

- (TVNPEndpointRouteConnection)routeConnection
{
  return self->_routeConnection;
}

- (NSCopying)metadataObserverToken
{
  return self->_metadataObserverToken;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (void).cxx_destruct
{
}

@end
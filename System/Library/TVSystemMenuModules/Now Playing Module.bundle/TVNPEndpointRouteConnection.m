@interface TVNPEndpointRouteConnection
+ (id)keyPathsForValuesAffectingPaired;
- (BOOL)_automaticResponseLoading;
- (BOOL)_wantsPlaybackMetadata;
- (BOOL)isAttemptingConnection;
- (BOOL)isPaired;
- (BOOL)isVideo;
- (CGSize)artworkSize;
- (MPAVEndpointRoute)route;
- (MPArtworkCatalog)artworkCatalog;
- (MPRequestResponseController)requestController;
- (NSMutableDictionary)observerTokensToHandlers;
- (NSNumber)totalNumberOfTracks;
- (NSNumber)trackNumber;
- (NSString)album;
- (NSString)artist;
- (NSString)bundleID;
- (NSString)contentItemIdentifier;
- (NSString)description;
- (NSString)title;
- (TVNPEndpointRouteConnection)initWithRoute:(id)a3;
- (UIImage)artworkImage;
- (double)duration;
- (double)elapsedTime;
- (double)lastUpdate;
- (float)defaultPlaybackRate;
- (float)rate;
- (id)_placeholderArtwork;
- (id)_preloadArtwork;
- (id)playerPath;
- (id)registerMetadataUpdateHandler:(id)a3;
- (id)response;
- (int64_t)playbackState;
- (unint64_t)connectionState;
- (void)_connectPairingIfNeeded:(BOOL)a3;
- (void)_connectionDidInvalidate:(id)a3;
- (void)_createRequestController;
- (void)_reloadPlayerPathWithRoute:(id)a3;
- (void)_setAutomaticResponseLoading:(BOOL)a3;
- (void)_setWantsPlaybackMetadata:(BOOL)a3;
- (void)_updateAutomaticResponseLoading;
- (void)_updateMetadata;
- (void)_updateState;
- (void)connectAndPair;
- (void)controller:(id)a3 defersResponseReplacement:(id)a4;
- (void)deregisterMetadataUpdateHandler:(id)a3;
- (void)playPause;
- (void)sendCommand:(unsigned int)a3 options:(id)a4;
- (void)setArtworkSize:(CGSize)a3;
- (void)setAttemptingConnection:(BOOL)a3;
- (void)setRoute:(id)a3;
@end

@implementation TVNPEndpointRouteConnection

- (TVNPEndpointRouteConnection)initWithRoute:(id)a3
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v15;
  v15 = 0LL;
  v13.receiver = v3;
  v13.super_class = (Class)&OBJC_CLASS___TVNPEndpointRouteConnection;
  v11 = -[TVNPEndpointRouteConnection init](&v13, "init");
  v15 = v11;
  objc_storeStrong((id *)&v15, v11);
  if (v11)
  {
    v17 = (dispatch_once_t *)&unk_11108;
    id v16 = 0LL;
    objc_storeStrong(&v16, &stru_C2C8);
    if (*v17 != -1) {
      dispatch_once(v17, v16);
    }
    objc_storeStrong(&v16, 0LL);
    v15->_connectionState = 0LL;
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    observerTokensToHandlers = v15->_observerTokensToHandlers;
    v15->_observerTokensToHandlers = v4;

    v10 = v15;
    sub_31A4();
    v12.width = v6;
    v12.height = v7;
    v10->_artworkSize = v12;
    -[TVNPEndpointRouteConnection _createRequestController](v15, "_createRequestController");
    -[TVNPEndpointRouteConnection _reloadPlayerPathWithRoute:](v15, "_reloadPlayerPathWithRoute:", location[0]);
  }

  v9 = v15;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v15, 0LL);
  return v9;
}

- (NSString)description
{
  v9 = self;
  SEL v8 = a2;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVNPEndpointRouteConnection;
  v5 = -[TVNPEndpointRouteConnection description](&v7, "description");
  v4 = -[TVNPEndpointRouteConnection route](v9, "route");
  id v3 = -[MPAVEndpointRoute routeName](v4, "routeName");
  CGFloat v6 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ (%@)", v5, v3);

  return v6;
}

- (void)connectAndPair
{
}

- (BOOL)isPaired
{
  BOOL v3 = 1;
  return v3;
}

- (NSString)bundleID
{
  id v4 = -[TVNPEndpointRouteConnection playerPath](self, "playerPath");
  id v5 = [v4 bundleID];
  char v10 = 0;
  char v8 = 0;
  char v6 = 0;
  if (v5)
  {
    id v2 = v5;
  }

  else
  {
    id v11 = -[TVNPEndpointRouteConnection response](self, "response");
    char v10 = 1;
    id v9 = [v11 playerPath];
    char v8 = 1;
    id v7 = [v9 bundleID];
    char v6 = 1;
    id v2 = v7;
  }

  objc_super v13 = v2;
  if ((v6 & 1) != 0) {

  }
  if ((v8 & 1) != 0) {
  if ((v10 & 1) != 0)
  }

  return (NSString *)v13;
}

- (id)playerPath
{
  id v3 = -[MPRequestResponseController request](self->_requestController, "request");
  id v4 = [v3 playerPath];

  return v4;
}

- (MPAVEndpointRoute)route
{
  id v3 = -[TVNPEndpointRouteConnection playerPath](self, "playerPath");
  id v4 = [v3 route];

  return (MPAVEndpointRoute *)v4;
}

- (id)response
{
  char v4 = 0;
  if ((char *)-[TVNPEndpointRouteConnection connectionState](self, "connectionState") == (char *)&dword_0 + 2)
  {
    id v5 = -[MPRequestResponseController response](self->_requestController, "response");
    char v4 = 1;
    id v2 = v5;
  }

  else
  {
    id v2 = 0LL;
  }

  id v7 = v2;
  if ((v4 & 1) != 0) {

  }
  return v7;
}

+ (id)keyPathsForValuesAffectingPaired
{
  return +[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"connectionState", a2, a1);
}

- (void)setRoute:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  char v4 = (MPAVEndpointRoute *)location[0];
  id v3 = -[TVNPEndpointRouteConnection route](v7, "route");
  BOOL v5 = v4 == v3;

  if (!v5) {
    -[TVNPEndpointRouteConnection _reloadPlayerPathWithRoute:](v7, "_reloadPlayerPathWithRoute:", location[0]);
  }
  objc_storeStrong(location, 0LL);
}

- (id)registerMetadataUpdateHandler:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = objc_alloc_init(&OBJC_CLASS___NSUUID);
  if (location[0])
  {
    observerTokensToHandlers = v9->_observerTokensToHandlers;
    id v6 = objc_retainBlock(location[0]);
    -[NSMutableDictionary setObject:forKey:](observerTokensToHandlers, "setObject:forKey:");

    -[TVNPEndpointRouteConnection _setWantsPlaybackMetadata:](v9, "_setWantsPlaybackMetadata:", 1LL);
  }

  char v4 = v7;
  objc_storeStrong((id *)&v7, 0LL);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (void)deregisterMetadataUpdateHandler:(id)a3
{
  char v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[NSMutableDictionary removeObjectForKey:](v4->_observerTokensToHandlers, "removeObjectForKey:", location[0]);
  if (!-[NSMutableDictionary count](v4->_observerTokensToHandlers, "count")) {
    -[TVNPEndpointRouteConnection _setWantsPlaybackMetadata:](v4, "_setWantsPlaybackMetadata:", 0LL);
  }
  objc_storeStrong(location, 0LL);
}

- (void)playPause
{
}

- (void)sendCommand:(unsigned int)a3 options:(id)a4
{
  v30 = self;
  SEL v29 = a2;
  unsigned int v28 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  if (location) {
    id v4 = location;
  }
  else {
    id v4 = &__NSDictionary0__struct;
  }
  id v26 = v4;
  char v10 = -[TVNPEndpointRouteConnection route](v30, "route");
  id v31 = 0LL;
  objc_storeStrong(&v31, v10);
  unsigned __int8 v11 = 1;
  if (v31) {
    unsigned __int8 v11 = [v31 isDeviceRoute];
  }
  objc_storeStrong(&v31, 0LL);

  char v25 = v11 & 1;
  char v22 = 0;
  char v20 = 0;
  if ((v11 & 1) != 0)
  {
    uint64_t LocalOrigin = MRMediaRemoteGetLocalOrigin();
  }

  else
  {
    v23 = -[TVNPEndpointRouteConnection route](v30, "route");
    char v22 = 1;
    id v21 = -[MPAVEndpointRoute connection](v23, "connection");
    char v20 = 1;
    uint64_t LocalOrigin = MRExternalDeviceCopyCustomOrigin([v21 externalDevice]);
  }

  if ((v20 & 1) != 0) {

  }
  if ((v22 & 1) != 0) {
  v24 = (void *)LocalOrigin;
  }
  if (LocalOrigin)
  {
    id v7 = v24;
    unsigned int v5 = v28;
    id v6 = v26;
    char v8 = &_dispatch_main_q;
    CGSize v12 = _NSConcreteStackBlock;
    int v13 = -1073741824;
    int v14 = 0;
    v15 = sub_3B88;
    id v16 = &unk_C2F0;
    v17[0] = v30;
    unsigned int v18 = v28;
    char v19 = v25 & 1;
    v17[1] = v24;
    MRMediaRemoteSendCommandForOriginWithReply(v7, v5, v6, v8, &v12);

    objc_storeStrong(v17, 0LL);
  }

  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(&location, 0LL);
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v13 = 0LL;
  objc_storeStrong(&v13, a4);
  queue = &_dispatch_main_q;
  id v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = sub_3E88;
  char v10 = &unk_C318;
  id v12 = v13;
  unsigned __int8 v11 = v15;
  dispatch_async(queue, &v6);

  objc_storeStrong((id *)&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_setWantsPlaybackMetadata:(BOOL)a3
{
  if (a3 != self->_wantsPlaybackMetadata)
  {
    self->_wantsPlaybackMetadata = a3;
    -[TVNPEndpointRouteConnection _updateAutomaticResponseLoading](self, "_updateAutomaticResponseLoading");
  }

- (void)_setAutomaticResponseLoading:(BOOL)a3
{
  if (self->_automaticResponseLoading != a3)
  {
    self->_automaticResponseLoading = a3;
    if (a3) {
      -[MPRequestResponseController beginAutomaticResponseLoading]( self->_requestController,  "beginAutomaticResponseLoading");
    }
    else {
      -[MPRequestResponseController endAutomaticResponseLoading]( self->_requestController,  "endAutomaticResponseLoading");
    }
  }

- (void)_reloadPlayerPathWithRoute:(id)a3
{
  char v19 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v15 = -[TVNPEndpointRouteConnection playerPath](v19, "playerPath");
  id v3 = [v15 route];
  BOOL v16 = v3 == location[0];

  if (!v16)
  {
    id v12 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    id v9 = v19;
    uint64_t v10 = _MPAVRouteConnectionDidInvalidateNotification;
    id v11 = [location[0] connection];
    -[NSNotificationCenter removeObserver:name:object:](v12, "removeObserver:name:object:", v9, v10);

    id v17 =  +[MPCPlayerPath pathWithRoute:bundleID:playerID:]( &OBJC_CLASS___MPCPlayerPath,  "pathWithRoute:bundleID:playerID:",  location[0],  0LL);
    id v13 = -[MPRequestResponseController request](v19->_requestController, "request");
    [v13 setPlayerPath:v17];

    -[MPRequestResponseController setNeedsReload](v19->_requestController, "setNeedsReload");
    id v4 = [location[0] connection];
    BOOL v14 = v4 == 0LL;

    if (!v14)
    {
      int v8 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
      unsigned int v5 = v19;
      uint64_t v6 = _MPAVRouteConnectionDidInvalidateNotification;
      id v7 = [location[0] connection];
      -[NSNotificationCenter addObserver:selector:name:object:]( v8,  "addObserver:selector:name:object:",  v5,  "_connectionDidInvalidate:",  v6);
    }

    -[TVNPEndpointRouteConnection _connectPairingIfNeeded:](v19, "_connectPairingIfNeeded:", 0LL);
    -[TVNPEndpointRouteConnection _updateState](v19, "_updateState");
    -[TVNPEndpointRouteConnection _updateMetadata](v19, "_updateMetadata");
    objc_storeStrong(&v17, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (void)_createRequestController
{
  char v22 = self;
  v21[1] = (id)a2;
  id v2 = objc_alloc_init(&OBJC_CLASS___MPRequestResponseController);
  requestController = v22->_requestController;
  v22->_requestController = v2;

  -[MPRequestResponseController setDelegate:](v22->_requestController, "setDelegate:", v22);
  id v6 = objc_alloc(&OBJC_CLASS___MPPropertySet);
  uint64_t v36 = MPModelRelationshipGenericSong;
  id v5 = objc_alloc(&OBJC_CLASS___MPPropertySet);
  v35[0] = MPModelPropertySongTitle;
  v35[1] = MPModelPropertySongExplicit;
  v35[2] = MPModelPropertySongArtwork;
  v35[3] = MPModelPropertySongDuration;
  v35[4] = MPModelPropertySongShouldShowComposer;
  v35[5] = MPModelPropertySongTrackNumber;
  v35[6] = MPModelPropertySongHasVideo;
  char v19 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v35, 7LL);
  v33[0] = MPModelRelationshipSongComposer;
  uint64_t v32 = MPModelPropertyComposerName;
  unsigned int v18 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v32);
  id v17 = +[MPPropertySet propertySetWithProperties:](&OBJC_CLASS___MPPropertySet, "propertySetWithProperties:");
  v34[0] = v17;
  v33[1] = MPModelRelationshipSongAlbum;
  id v4 = objc_alloc(&OBJC_CLASS___MPPropertySet);
  v31[0] = MPModelPropertyAlbumTitle;
  v31[1] = MPModelPropertyAlbumTrackCount;
  BOOL v16 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 2LL);
  uint64_t v29 = MPModelRelationshipAlbumArtist;
  uint64_t v28 = MPModelPropertyArtistName;
  id v15 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v28, 1LL);
  BOOL v14 = +[MPPropertySet propertySetWithProperties:](&OBJC_CLASS___MPPropertySet, "propertySetWithProperties:");
  v30 = v14;
  id v13 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL);
  id v12 = objc_msgSend(v4, "initWithProperties:relationships:", v16);
  v34[1] = v12;
  v33[2] = MPModelRelationshipSongArtist;
  uint64_t v27 = MPModelPropertyArtistName;
  id v11 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 1LL);
  uint64_t v10 = +[MPPropertySet propertySetWithProperties:](&OBJC_CLASS___MPPropertySet, "propertySetWithProperties:");
  v34[2] = v10;
  id v9 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v34,  v33,  3LL);
  id v8 = objc_msgSend(v5, "initWithProperties:relationships:", v19);
  id v37 = v8;
  id v7 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL);
  v21[0] = objc_msgSend(v6, "initWithProperties:relationships:");

  id v20 = objc_alloc_init(&OBJC_CLASS___MPCPlayerRequest);
  uint64_t v24 = 0LL;
  uint64_t v23 = 1LL;
  uint64_t v25 = 0LL;
  uint64_t v26 = 1LL;
  objc_msgSend(v20, "setTracklistRange:", 0, 1);
  [v20 setPlayingItemProperties:v21[0]];
  -[MPRequestResponseController setRequest:](v22->_requestController, "setRequest:", v20);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(v21, 0LL);
}

- (void)_updateMetadata
{
  id val = self;
  v105[1] = (id)a2;
  v105[0] = -[MPRequestResponseController response](self->_requestController, "response");
  id v104 = [v105[0] state];
  double v103 = 0.0;
  double v102 = 0.0;
  float v101 = 0.0;
  float v100 = 1.0;
  double v99 = *((double *)val + 14);
  id v98 = 0LL;
  id v97 = 0LL;
  id v96 = 0LL;
  id v95 = *((id *)val + 6);
  id v94 = 0LL;
  id location = 0LL;
  id v92 = 0LL;
  char v91 = 0;
  id v51 = [v105[0] tracklist];
  id v50 = [v51 playingItemIndexPath];
  BOOL v49 = [v50 length] != 0;

  BOOL v90 = v49;
  if (v49)
  {
    id v48 = [v105[0] tracklist];
    id v47 = [v48 items];
    id v46 = [v105[0] tracklist];
    id v45 = [v46 playingItemIndexPath];
    id v89 = objc_msgSend(v47, "itemAtIndexPath:");

    id v44 = [v89 metadataObject];
    id v88 = [v44 song];

    os_log_t oslog = (os_log_t)(id)qword_11110;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_5F78((uint64_t)v122, (uint64_t)val, (uint64_t)v88);
      _os_log_impl(&dword_0, oslog, type, "METADATA: (%{public}@) update with song: %{public}@", v122, 0x16u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    if (v89) {
      [v89 duration];
    }
    else {
      memset(__b, 0, sizeof(__b));
    }
    double v103 = *(double *)&__b[3];
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    double v43 = v2;
    memcpy(__dst, __b, sizeof(__dst));
    v114 = __dst;
    double v113 = v43;
    int v112 = 0;
    double v110 = __dst[4] + (v43 - __dst[0]) * *(float *)&__dst[5];
    double v109 = __dst[3];
    if (v110 >= __dst[3]) {
      double v42 = v109;
    }
    else {
      double v42 = v110;
    }
    double v108 = v42;
    double v111 = v42;
    else {
      double v41 = v111;
    }
    double v107 = v41;
    double v102 = v41;
    float v100 = *((float *)&__b[5] + 1);
    float v101 = *(float *)&__b[5];
    double v99 = *(double *)__b;
    id v3 = [v88 title];
    id v4 = v98;
    id v98 = v3;

    id v40 = [v88 artist];
    id v5 = [v40 name];
    id v6 = v97;
    id v97 = v5;

    id v39 = [v88 album];
    id v7 = [v39 title];
    id v8 = v96;
    id v96 = v7;

    char v82 = 0;
    if ((uint64_t)[v88 trackNumber] <= 0)
    {
      objc_storeStrong(&location, 0LL);
    }

    else
    {
      id v83 =  +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v88 trackNumber]);
      char v82 = 1;
      objc_storeStrong(&location, v83);
    }

    if ((v82 & 1) != 0) {

    }
    id v38 = [v88 album];
    char v80 = 0;
    char v78 = 0;
    if ((uint64_t)[v38 trackCount] <= 0)
    {
      objc_storeStrong(&v92, 0LL);
    }

    else
    {
      id v81 = [v88 album];
      char v80 = 1;
      id v79 =  +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v81 trackCount]);
      char v78 = 1;
      objc_storeStrong(&v92, v79);
    }

    if ((v78 & 1) != 0) {

    }
    if ((v80 & 1) != 0) {
    id v9 = [v89 contentItemIdentifier];
    }
    id v10 = v94;
    id v94 = v9;

    char v91 = [v88 hasVideo] & 1;
    id v77 = [v88 artworkCatalog];
    objc_msgSend(v77, "setFittingSize:", *((double *)val + 18), *((double *)val + 19));
    id v37 = +[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen");
    -[UIScreen scale](v37, "scale");
    [v77 setDestinationScale:v11];

    if (([v77 isArtworkVisuallyIdenticalToCatalog:*((void *)val + 7)] & 1) == 0)
    {
      if (v77)
      {
        [v77 setCacheIdentifier:off_11040 forCacheReference:0];
        objc_initWeak(&from, val);
        id v36 = v77;
        v68 = _NSConcreteStackBlock;
        int v69 = -1073741824;
        int v70 = 0;
        v71 = sub_5FC8;
        v72 = &unk_C368;
        objc_copyWeak(&v75, &from);
        id v73 = val;
        id v74 = v77;
        [v36 requestImageWithCompletion:&v68];
        objc_storeStrong(&v74, 0LL);
        objc_storeStrong(&v73, 0LL);
        objc_destroyWeak(&v75);
        objc_destroyWeak(&from);
      }

      if (!v77)
      {
        [val willChangeValueForKey:@"artworkCatalog"];
        objc_storeStrong((id *)val + 7, v77);
        [val didChangeValueForKey:@"artworkCatalog"];
        os_log_t v67 = (os_log_t)(id)qword_11110;
        os_log_type_t v66 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
        {
          sub_64B8((uint64_t)v121, (uint64_t)val);
          _os_log_debug_impl(&dword_0, v67, v66, "METADATA: (%{public}@) artwork catalog changed to nil", v121, 0xCu);
        }

        objc_storeStrong((id *)&v67, 0LL);
      }

      if (!v77 || !v95)
      {
        id v65 = [val bundleID];
        os_log_t v64 = (os_log_t)(id)qword_11110;
        os_log_type_t v63 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
        {
          sub_5F78((uint64_t)v120, (uint64_t)val, (uint64_t)v65);
          _os_log_debug_impl( &dword_0,  v64,  v63,  "METADATA: (%{public}@) using placeholder image for app: %{public}@",  v120,  0x16u);
        }

        objc_storeStrong((id *)&v64, 0LL);
        id v12 = [val _preloadArtwork];
        id v13 = v95;
        id v95 = v12;

        objc_storeStrong(&v65, 0LL);
      }
    }

    objc_storeStrong(&v77, 0LL);
    objc_storeStrong(&v88, 0LL);
    objc_storeStrong(&v89, 0LL);
  }

  else
  {
    id v14 = [val _placeholderArtwork];
    id v15 = v95;
    id v95 = v14;

    id v104 = &dword_0 + 1;
    os_log_t v62 = (os_log_t)(id)qword_11110;
    os_log_type_t v61 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      sub_64B8((uint64_t)v119, (uint64_t)val);
      _os_log_impl(&dword_0, v62, v61, "METADATA: (%{public}@) no song, clearing out data", v119, 0xCu);
    }

    objc_storeStrong((id *)&v62, 0LL);
  }

  id v60 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  if (v95 != *((id *)val + 6)) {
    [v60 addObject:@"artworkImage"];
  }
  if (v104 != *((id *)val + 11)) {
    [v60 addObject:@"playbackState"];
  }
  *(float *)&double v16 = v101;
  *(float *)&double v16 = v100;
  double v17 = v99;
  if (location != *((id *)val + 8)
    && (objc_msgSend(location, "isEqual:", *((void *)val + 8), v17) & 1) == 0)
  {
    [v60 addObject:@"trackNumber"];
  }

  if ((v91 & 1) != (*((_BYTE *)val + 10) & 1)) {
    objc_msgSend(v60, "addObject:", @"isVideo", v17);
  }
  if (objc_msgSend(v60, "count", v17))
  {
    os_log_t v59 = (os_log_t)(id)qword_11110;
    os_log_type_t v58 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      sub_5F78((uint64_t)v118, (uint64_t)val, (uint64_t)v60);
      _os_log_impl( &dword_0,  v59,  v58,  "METADATA: (%{public}@) apply updates with changed keys: %{public}@",  v118,  0x16u);
    }

    objc_storeStrong((id *)&v59, 0LL);
    memset(v56, 0, sizeof(v56));
    id v34 = v60;
    id v35 = [v34 countByEnumeratingWithState:v56 objects:v117 count:16];
    if (v35)
    {
      uint64_t v31 = *(void *)v56[2];
      uint64_t v32 = 0LL;
      id v33 = v35;
      while (1)
      {
        uint64_t v30 = v32;
        if (*(void *)v56[2] != v31) {
          objc_enumerationMutation(v34);
        }
        uint64_t v57 = *(void *)(v56[1] + 8 * v32);
        [val willChangeValueForKey:v57];
        ++v32;
        if (v30 + 1 >= (unint64_t)v33)
        {
          uint64_t v32 = 0LL;
          id v33 = [v34 countByEnumeratingWithState:v56 objects:v117 count:16];
          if (!v33) {
            break;
          }
        }
      }
    }

    objc_storeStrong((id *)val + 3, v98);
    objc_storeStrong((id *)val + 4, v97);
    objc_storeStrong((id *)val + 5, v96);
    objc_storeStrong((id *)val + 6, v95);
    *((void *)val + 11) = v104;
    *((float *)val + 3) = v101;
    *((float *)val + 4) = v100;
    *((double *)val + 12) = v103;
    *((double *)val + 13) = v102;
    *((double *)val + 14) = v99;
    objc_storeStrong((id *)val + 8, location);
    objc_storeStrong((id *)val + 9, v92);
    objc_storeStrong((id *)val + 10, v94);
    *((_BYTE *)val + 10) = v91 & 1;
    memset(v54, 0, sizeof(v54));
    id v28 = v60;
    id v29 = [v28 countByEnumeratingWithState:v54 objects:v116 count:16];
    if (v29)
    {
      uint64_t v25 = *(void *)v54[2];
      uint64_t v26 = 0LL;
      id v27 = v29;
      while (1)
      {
        uint64_t v24 = v26;
        if (*(void *)v54[2] != v25) {
          objc_enumerationMutation(v28);
        }
        uint64_t v55 = *(void *)(v54[1] + 8 * v26);
        [val didChangeValueForKey:v55];
        ++v26;
        if (v24 + 1 >= (unint64_t)v27)
        {
          uint64_t v26 = 0LL;
          id v27 = [v28 countByEnumeratingWithState:v54 objects:v116 count:16];
          if (!v27) {
            break;
          }
        }
      }
    }

    memset(v52, 0, sizeof(v52));
    id v22 = [*((id *)val + 17) allValues];
    id v23 = [v22 countByEnumeratingWithState:v52 objects:v115 count:16];
    if (v23)
    {
      uint64_t v19 = *(void *)v52[2];
      uint64_t v20 = 0LL;
      id v21 = v23;
      while (1)
      {
        uint64_t v18 = v20;
        if (*(void *)v52[2] != v19) {
          objc_enumerationMutation(v22);
        }
        uint64_t v53 = *(void *)(v52[1] + 8 * v20);
        (*(void (**)(void))(v53 + 16))();
        ++v20;
        if (v18 + 1 >= (unint64_t)v21)
        {
          uint64_t v20 = 0LL;
          id v21 = [v22 countByEnumeratingWithState:v52 objects:v115 count:16];
          if (!v21) {
            break;
          }
        }
      }
    }
  }

  objc_storeStrong(&v60, 0LL);
  objc_storeStrong(&v92, 0LL);
  objc_storeStrong(&location, 0LL);
  objc_storeStrong(&v94, 0LL);
  objc_storeStrong(&v95, 0LL);
  objc_storeStrong(&v96, 0LL);
  objc_storeStrong(&v97, 0LL);
  objc_storeStrong(&v98, 0LL);
  objc_storeStrong(v105, 0LL);
}

- (void)_connectionDidInvalidate:(id)a3
{
  double v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  queue = &_dispatch_main_q;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_65D0;
  id v8 = &unk_C390;
  id v9 = v11;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v9, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_connectPairingIfNeeded:(BOOL)a3
{
  id v23 = self;
  SEL v22 = a2;
  BOOL v21 = a3;
  int v6 = -[TVNPEndpointRouteConnection route](self, "route");
  id v20 = -[MPAVEndpointRoute connection](v6, "connection");

  if (v20)
  {
    char v19 = [v20 isConnected] & 1;
    char v18 = [v20 isInvalidated] & 1;
    if ((v19 & 1) == 0 && !v23->_attemptingConnection)
    {
      -[TVNPEndpointRouteConnection setAttemptingConnection:](v23, "setAttemptingConnection:", 1LL);
      uint64_t v17 = 0LL;
      if (v21)
      {
        if ((v18 & 1) != 0) {
          [v20 reset];
        }
        uint64_t v17 = 1LL;
      }

      id v16 = (id)qword_11110;
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = -[TVNPEndpointRouteConnection route](v23, "route");
        id location = v5;
        sub_6A74((uint64_t)v24, (uint64_t)v23, (uint64_t)location, v21);
        _os_log_impl(&dword_0, (os_log_t)v16, v15, "(%{public}@) Connect to %{public}@ and Pair: %d", v24, 0x1Cu);

        objc_storeStrong(&location, 0LL);
      }

      objc_storeStrong(&v16, 0LL);
      objc_initWeak(&from, v23);
      id v3 = v20;
      uint64_t v4 = v17;
      id v7 = _NSConcreteStackBlock;
      int v8 = -1073741824;
      int v9 = 0;
      id v10 = sub_6AE0;
      double v11 = &unk_C3E0;
      objc_copyWeak(&v12, &from);
      [v3 connectWithOptions:v4 completion:&v7];
      objc_destroyWeak(&v12);
      objc_destroyWeak(&from);
    }

    -[TVNPEndpointRouteConnection _updateState](v23, "_updateState");
    -[TVNPEndpointRouteConnection _updateAutomaticResponseLoading](v23, "_updateAutomaticResponseLoading");
  }

  else
  {
    -[TVNPEndpointRouteConnection _updateState](v23, "_updateState");
    -[TVNPEndpointRouteConnection _updateAutomaticResponseLoading](v23, "_updateAutomaticResponseLoading");
  }

  objc_storeStrong(&v20, 0LL);
}

- (void)_updateAutomaticResponseLoading
{
  id v7 = self;
  SEL v6 = a2;
  BOOL v5 = 0;
  if ((char *)-[TVNPEndpointRouteConnection connectionState](self, "connectionState") == (char *)&dword_0 + 2)
  {
    double v2 = -[TVNPEndpointRouteConnection route](v7, "route");
    id location = -[MPAVEndpointRoute connection](v2, "connection");

    char v3 = [location isInvalidated] & 1;
    if (v7->_wantsPlaybackMetadata && (v3 & 1) == 0) {
      BOOL v5 = !v7->_attemptingConnection;
    }
    objc_storeStrong(&location, 0LL);
  }

  -[TVNPEndpointRouteConnection _setAutomaticResponseLoading:](v7, "_setAutomaticResponseLoading:", v5);
}

- (void)_updateState
{
  SEL v6 = -[TVNPEndpointRouteConnection route](self, "route");
  id v5 = -[MPAVEndpointRoute connection](v6, "connection");
  unsigned __int8 v7 = [v5 isInvalidated];

  if ((v7 & 1) != 0)
  {
    unint64_t v12 = 3LL;
  }

  else
  {
    char v3 = -[TVNPEndpointRouteConnection route](self, "route");
    id location = 0LL;
    objc_storeStrong(&location, v3);
    unsigned __int8 v4 = 1;
    if (location) {
      unsigned __int8 v4 = [location isDeviceRoute];
    }
    objc_storeStrong(&location, 0LL);
    char v10 = 0;
    char v8 = 0;
    unsigned __int8 v2 = 1;
    if ((v4 & 1) == 0)
    {
      double v11 = -[TVNPEndpointRouteConnection route](self, "route");
      char v10 = 1;
      id v9 = -[MPAVEndpointRoute connection](v11, "connection");
      char v8 = 1;
      unsigned __int8 v2 = [v9 isConnected];
    }

    if ((v8 & 1) != 0) {

    }
    if ((v10 & 1) != 0) {
    if ((v2 & 1) != 0)
    }
    {
      unint64_t v12 = 2LL;
    }

    else if (-[TVNPEndpointRouteConnection isAttemptingConnection](self, "isAttemptingConnection"))
    {
      unint64_t v12 = 1LL;
    }

    else
    {
      unint64_t v12 = 3LL;
    }
  }

  if (v12 != self->_connectionState)
  {
    -[TVNPEndpointRouteConnection willChangeValueForKey:](self, "willChangeValueForKey:");
    self->_connectionState = v12;
    -[TVNPEndpointRouteConnection didChangeValueForKey:](self, "didChangeValueForKey:", @"connectionState");
  }

- (id)_placeholderArtwork
{
  id v5 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self));
  unsigned __int8 v4 = +[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen");
  id v3 = -[UIScreen traitCollection](v4, "traitCollection");
  SEL v6 =  +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:compatibleWithTraitCollection:",  @"Placeholder-Album",  v5);

  return v6;
}

- (id)_preloadArtwork
{
  double v11 = self;
  v10[1] = (id)a2;
  v10[0] = -[TVNPEndpointRouteConnection bundleID](self, "bundleID");
  else {
    unsigned __int8 v2 = @"PreloadAsset-Music";
  }
  id v9 = v2;
  unsigned __int8 v4 = v9;
  unsigned __int8 v7 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v11));
  SEL v6 = +[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen");
  id v5 = -[UIScreen traitCollection](v6, "traitCollection");
  char v8 =  +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:compatibleWithTraitCollection:",  v4,  v7);

  objc_storeStrong((id *)&v9, 0LL);
  objc_storeStrong(v10, 0LL);
  return v8;
}

- (BOOL)_automaticResponseLoading
{
  return self->_automaticResponseLoading;
}

- (BOOL)_wantsPlaybackMetadata
{
  return self->_wantsPlaybackMetadata;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)artist
{
  return self->_artist;
}

- (NSString)album
{
  return self->_album;
}

- (UIImage)artworkImage
{
  return self->_artworkImage;
}

- (MPArtworkCatalog)artworkCatalog
{
  return self->_artworkCatalog;
}

- (CGSize)artworkSize
{
  double height = self->_artworkSize.height;
  double width = self->_artworkSize.width;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setArtworkSize:(CGSize)a3
{
  self->_artworkSize = a3;
}

- (NSNumber)trackNumber
{
  return self->_trackNumber;
}

- (NSNumber)totalNumberOfTracks
{
  return self->_totalNumberOfTracks;
}

- (NSString)contentItemIdentifier
{
  return self->_contentItemIdentifier;
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (int64_t)playbackState
{
  return self->_playbackState;
}

- (double)duration
{
  return self->_duration;
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (float)rate
{
  return self->_rate;
}

- (float)defaultPlaybackRate
{
  return self->_defaultPlaybackRate;
}

- (double)lastUpdate
{
  return self->_lastUpdate;
}

- (unint64_t)connectionState
{
  return self->_connectionState;
}

- (BOOL)isAttemptingConnection
{
  return self->_attemptingConnection;
}

- (void)setAttemptingConnection:(BOOL)a3
{
  self->_attemptingConnection = a3;
}

- (MPRequestResponseController)requestController
{
  return self->_requestController;
}

- (NSMutableDictionary)observerTokensToHandlers
{
  return self->_observerTokensToHandlers;
}

- (void).cxx_destruct
{
}

@end
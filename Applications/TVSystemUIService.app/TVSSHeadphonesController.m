@interface TVSSHeadphonesController
- (BOOL)allowHeadphoneMoviesToPlay;
- (NSMutableDictionary)cachedMediaPlayerViews;
- (TVSSHeadphonesController)init;
- (id)_avPlayerForRouteUID:(id)a3;
- (id)_bluetoothDeviceForRouteUID:(id)a3;
- (id)imageForRouteUID:(id)a3;
- (id)mediaPlayerViewForRouteUID:(id)a3;
- (void)_createMediaPlayerViewForRouteUIDIfNecessary:(id)a3;
- (void)clearMediaPlayerViewCache;
- (void)createMediaPlayerViewForRouteUIDIfNecessary:(id)a3;
- (void)pauseHeadphoneMovies;
- (void)playHeadphoneMovies;
- (void)resetHeadphoneMovies;
- (void)setCachedMediaPlayerViews:(id)a3;
@end

@implementation TVSSHeadphonesController

- (TVSSHeadphonesController)init
{
  SEL v7 = a2;
  v8 = 0LL;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSSHeadphonesController;
  v8 = -[TVSSHeadphonesController init](&v6, "init");
  objc_storeStrong((id *)&v8, v8);
  if (v8)
  {
    v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    cachedMediaPlayerViews = v8->_cachedMediaPlayerViews;
    v8->_cachedMediaPlayerViews = v2;

    v8->_allowHeadphoneMoviesToPlay = 1;
  }

  v5 = v8;
  objc_storeStrong((id *)&v8, 0LL);
  return v5;
}

- (void)createMediaPlayerViewForRouteUIDIfNecessary:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSHeadphonesController _createMediaPlayerViewForRouteUIDIfNecessary:]( v4,  "_createMediaPlayerViewForRouteUIDIfNecessary:",  location[0]);
  objc_storeStrong(location, 0LL);
}

- (id)mediaPlayerViewForRouteUID:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (MGGetProductType(v3, v4) == 1110205732)
  {
    id v10 = 0LL;
    int v7 = 1;
  }

  else
  {
    -[TVSSHeadphonesController _createMediaPlayerViewForRouteUIDIfNecessary:]( v9,  "_createMediaPlayerViewForRouteUIDIfNecessary:",  location[0]);
    id v6 =  -[NSMutableDictionary objectForKeyedSubscript:]( v9->_cachedMediaPlayerViews,  "objectForKeyedSubscript:",  location[0]);
    if (!v6) {
      v9->_allowHeadphoneMoviesToPlay = 0;
    }
    id v10 = v6;
    int v7 = 1;
    objc_storeStrong(&v6, 0LL);
  }

  objc_storeStrong(location, 0LL);
  return v10;
}

- (id)imageForRouteUID:(id)a3
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (MGGetProductType(v3, v4) == 1110205732)
  {
    v15 = 0LL;
    int v12 = 1;
  }

  else
  {
    id v11 = -[TVSSHeadphonesController _bluetoothDeviceForRouteUID:](v14, "_bluetoothDeviceForRouteUID:", location[0]);
    if (!v11) {
      goto LABEL_8;
    }
    [v11 vendorIdentifierAndProductIdentifier:&v10];
    unsigned int v6 = v10;
    id v7 = [v11 deviceColor];
    id v8 =  +[TVPSDeviceAssetHelper smartRoutingAssetPathForPID:colorCode:outIsVideo:]( TVPSDeviceAssetHelper,  "smartRoutingAssetPathForPID:colorCode:outIsVideo:",  v6,  [v7 intValue],  &v9);

    if ((v9 & 1) != 0)
    {
      int v12 = 0;
    }

    else
    {
      v15 = +[UIImage imageWithContentsOfFile:](&OBJC_CLASS___UIImage, "imageWithContentsOfFile:", v8);
      int v12 = 1;
    }

    objc_storeStrong(&v8, 0LL);
    if (!v12)
    {
LABEL_8:
      v15 = 0LL;
      int v12 = 1;
    }

    objc_storeStrong(&v11, 0LL);
  }

  objc_storeStrong(location, 0LL);
  return v15;
}

- (void)clearMediaPlayerViewCache
{
  self->_allowHeadphoneMoviesToPlay = 1;
}

- (void)playHeadphoneMovies
{
  int v12 = self;
  SEL v11 = a2;
  memset(__b, 0, sizeof(__b));
  unsigned int v6 = -[TVSSHeadphonesController cachedMediaPlayerViews](v12, "cachedMediaPlayerViews");
  id obj = -[NSMutableDictionary allValues](v6, "allValues");

  id v8 = [obj countByEnumeratingWithState:__b objects:v13 count:16];
  if (v8)
  {
    uint64_t v3 = *(void *)__b[2];
    uint64_t v4 = 0LL;
    id v5 = v8;
    while (1)
    {
      uint64_t v2 = v4;
      if (*(void *)__b[2] != v3) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(id *)(__b[1] + 8 * v4);
      [v10 startMovie];
      ++v4;
      if (v2 + 1 >= (unint64_t)v5)
      {
        uint64_t v4 = 0LL;
        id v5 = [obj countByEnumeratingWithState:__b objects:v13 count:16];
        if (!v5) {
          break;
        }
      }
    }
  }
}

- (void)pauseHeadphoneMovies
{
  v14 = self;
  SEL v13 = a2;
  char v9 = -[TVSSHeadphonesController cachedMediaPlayerViews](self, "cachedMediaPlayerViews");
  BOOL v10 = -[NSMutableDictionary count](v9, "count") == 0LL;

  if (!v10) {
    v14->_allowHeadphoneMoviesToPlay = 0;
  }
  memset(__b, 0, sizeof(__b));
  unsigned int v6 = -[TVSSHeadphonesController cachedMediaPlayerViews](v14, "cachedMediaPlayerViews");
  id obj = -[NSMutableDictionary allValues](v6, "allValues");

  id v8 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
  if (v8)
  {
    uint64_t v3 = *(void *)__b[2];
    uint64_t v4 = 0LL;
    id v5 = v8;
    while (1)
    {
      uint64_t v2 = v4;
      if (*(void *)__b[2] != v3) {
        objc_enumerationMutation(obj);
      }
      id v12 = *(id *)(__b[1] + 8 * v4);
      [v12 pauseMovie];
      ++v4;
      if (v2 + 1 >= (unint64_t)v5)
      {
        uint64_t v4 = 0LL;
        id v5 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
        if (!v5) {
          break;
        }
      }
    }
  }
}

- (void)resetHeadphoneMovies
{
  id v12 = self;
  SEL v11 = a2;
  memset(__b, 0, sizeof(__b));
  unsigned int v6 = -[TVSSHeadphonesController cachedMediaPlayerViews](v12, "cachedMediaPlayerViews");
  id obj = -[NSMutableDictionary allValues](v6, "allValues");

  id v8 = [obj countByEnumeratingWithState:__b objects:v13 count:16];
  if (v8)
  {
    uint64_t v3 = *(void *)__b[2];
    uint64_t v4 = 0LL;
    id v5 = v8;
    while (1)
    {
      uint64_t v2 = v4;
      if (*(void *)__b[2] != v3) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(id *)(__b[1] + 8 * v4);
      [v10 resetMovie];
      ++v4;
      if (v2 + 1 >= (unint64_t)v5)
      {
        uint64_t v4 = 0LL;
        id v5 = [obj countByEnumeratingWithState:__b objects:v13 count:16];
        if (!v5) {
          break;
        }
      }
    }
  }
}

- (id)_avPlayerForRouteUID:(id)a3
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v13 = -[TVSSHeadphonesController _bluetoothDeviceForRouteUID:](v15, "_bluetoothDeviceForRouteUID:", location[0]);
  if (!v13) {
    goto LABEL_7;
  }
  [v13 vendorIdentifierAndProductIdentifier:&v12];
  unsigned int v4 = v12;
  id v5 = [v13 deviceColor];
  id v10 =  +[TVPSDeviceAssetHelper smartRoutingAssetPathForPID:colorCode:outIsVideo:]( TVPSDeviceAssetHelper,  "smartRoutingAssetPathForPID:colorCode:outIsVideo:",  v4,  [v5 intValue],  &v11);

  if (v10 && (v11 & 1) != 0)
  {
    char v9 = +[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v10, 0LL);
    id v8 = +[AVPlayerItem playerItemWithURL:](&OBJC_CLASS___AVPlayerItem, "playerItemWithURL:", v9);
    id v7 = objc_alloc_init(&OBJC_CLASS___AVPlayer);
    [v7 _setParticipatesInAudioSession:0];
    [v7 replaceCurrentItemWithPlayerItem:v8];
    [v7 setAudiovisualBackgroundPlaybackPolicy:3];
    [v7 setActionAtItemEnd:1];
    [v7 setAutomaticallyWaitsToMinimizeStalling:0];
    id v16 = v7;
    int v6 = 1;
    objc_storeStrong(&v7, 0LL);
    objc_storeStrong((id *)&v8, 0LL);
    objc_storeStrong((id *)&v9, 0LL);
  }

  else
  {
    int v6 = 0;
  }

  objc_storeStrong(&v10, 0LL);
  if (!v6) {
LABEL_7:
  }
    id v16 = 0LL;
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
  return v16;
}

- (id)_bluetoothDeviceForRouteUID:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = [location[0] componentsSeparatedByString:@"-"];
  id v15 = [v4 firstObject];

  int v6 = +[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance");
  id v5 = -[TVSBluetoothManager connectedDevices](v6, "connectedDevices");
  id v8 = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  char v11 = sub_100086810;
  uint64_t v12 = &unk_1001B90E0;
  id v13 = v15;
  id v14 = objc_msgSend(v5, "bs_firstObjectPassingTest:");

  id v7 = v14;
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
  return v7;
}

- (void)_createMediaPlayerViewForRouteUIDIfNecessary:(id)a3
{
  int v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 =  -[NSMutableDictionary objectForKeyedSubscript:]( v9->_cachedMediaPlayerViews,  "objectForKeyedSubscript:",  location[0]);
  BOOL v5 = v3 != 0LL;

  if (!v5)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___TVSSHeadphonesMediaPlayerView);
    id v6 = -[TVSSHeadphonesController _avPlayerForRouteUID:](v9, "_avPlayerForRouteUID:", location[0]);
    if (v6)
    {
      v9->_allowHeadphoneMoviesToPlay = 1;
      id v4 = -[TVSSHeadphonesController _avPlayerForRouteUID:](v9, "_avPlayerForRouteUID:", location[0]);
      objc_msgSend(v7, "setAvPlayer:");

      -[NSMutableDictionary setObject:forKeyedSubscript:]( v9->_cachedMediaPlayerViews,  "setObject:forKeyedSubscript:",  v7,  location[0]);
    }

    objc_storeStrong(&v6, 0LL);
    objc_storeStrong(&v7, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (BOOL)allowHeadphoneMoviesToPlay
{
  return self->_allowHeadphoneMoviesToPlay;
}

- (NSMutableDictionary)cachedMediaPlayerViews
{
  return self->_cachedMediaPlayerViews;
}

- (void)setCachedMediaPlayerViews:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
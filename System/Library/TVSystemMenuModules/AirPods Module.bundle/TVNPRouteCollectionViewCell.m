@interface TVNPRouteCollectionViewCell
- (BOOL)_shouldShowSeparateBatteryPercentagesForBatteryLevel:(id)a3;
- (BOOL)canBecomeFocused;
- (BOOL)disableFocus;
- (NSString)batteryLevelText;
- (NSString)nowPlayingInfoText;
- (TVNPRoute)route;
- (TVNPRouteCollectionViewCellDelegate)delegate;
- (id)_batteryTextForBatteryLevel:(id)a3;
- (void)_resolveSubtitleText;
- (void)_updateMultiSelectionState;
- (void)_updateMusicBarState;
- (void)_updateVolumeState;
- (void)accessoryViewSelected;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prepareForReuse;
- (void)routeViewSelected;
- (void)setBatteryLevelText:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableFocus:(BOOL)a3;
- (void)setNowPlayingInfoText:(id)a3;
- (void)setRoute:(id)a3;
- (void)volumeSliderValueChanged:(id)a3;
@end

@implementation TVNPRouteCollectionViewCell

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[TVNPRouteCollectionViewCell setRoute:](self, "setRoute:", 0LL);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVNPRouteCollectionViewCell;
  -[TVNPRouteCollectionViewCell dealloc](&v2, "dealloc");
}

- (void)prepareForReuse
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___TVNPRouteCollectionViewCell;
  -[TVNPBaseRouteCollectionViewCell prepareForReuse](&v2, "prepareForReuse");
  -[TVNPRouteCollectionViewCell setRoute:](v4, "setRoute:");
  -[TVNPBaseRouteCollectionViewCell setVolumeLevel:](v4, "setVolumeLevel:", 0LL);
}

- (void)setRoute:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v8->_route != location[0])
  {
    -[TVNPRoute removeObserver:forKeyPath:context:]( v8->_route,  "removeObserver:forKeyPath:context:",  v8,  @"title",  off_5F818);
    -[TVNPRoute removeObserver:forKeyPath:context:]( v8->_route,  "removeObserver:forKeyPath:context:",  v8,  @"deviceImage",  off_5F820);
    -[TVNPRoute removeObserver:forKeyPath:context:]( v8->_route,  "removeObserver:forKeyPath:context:",  v8,  @"deviceType",  off_5F828);
    -[TVNPRoute removeObserver:forKeyPath:context:]( v8->_route,  "removeObserver:forKeyPath:context:",  v8,  @"selectionState",  off_5F830);
    -[TVNPRoute removeObserver:forKeyPath:context:]( v8->_route,  "removeObserver:forKeyPath:context:",  v8,  @"volumeLevel",  off_5F838);
    -[TVNPRoute removeObserver:forKeyPath:context:]( v8->_route,  "removeObserver:forKeyPath:context:",  v8,  @"canBeGrouped",  off_5F840);
    -[TVNPRoute removeObserver:forKeyPath:context:]( v8->_route,  "removeObserver:forKeyPath:context:",  v8,  @"destination.isCurrentDestination",  off_5F848);
    -[TVNPRoute removeObserver:forKeyPath:context:]( v8->_route,  "removeObserver:forKeyPath:context:",  v8,  @"destination.playbackState",  off_5F850);
    -[TVNPRoute removeObserver:forKeyPath:context:]( v8->_route,  "removeObserver:forKeyPath:context:",  v8,  @"destination.singleLineTitle",  off_5F858);
    route = v8->_route;
    uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVNPOutputDeviceRoute);
    if ((objc_opt_isKindOfClass(route, v3) & 1) != 0) {
      -[TVNPRoute removeObserver:forKeyPath:context:]( v8->_route,  "removeObserver:forKeyPath:context:",  v8,  @"batteryLevel",  off_5F860);
    }
    objc_storeStrong((id *)&v8->_route, location[0]);
    objc_msgSend(location[0], "addObserver:forKeyPath:options:context:", v8, @"title");
    [location[0] addObserver:v8 forKeyPath:@"deviceImage" options:4 context:off_5F820];
    [location[0] addObserver:v8 forKeyPath:@"deviceType" options:4 context:off_5F828];
    [location[0] addObserver:v8 forKeyPath:@"selectionState" options:4 context:off_5F830];
    [location[0] addObserver:v8 forKeyPath:@"volumeLevel" options:4 context:off_5F838];
    [location[0] addObserver:v8 forKeyPath:@"canBeGrouped" options:4 context:off_5F840];
    [location[0] addObserver:v8 forKeyPath:@"destination.isCurrentDestination" options:4 context:off_5F848];
    [location[0] addObserver:v8 forKeyPath:@"destination.playbackState" options:4 context:off_5F850];
    [location[0] addObserver:v8 forKeyPath:@"destination.singleLineTitle" options:4 context:off_5F858];
    id v5 = location[0];
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___TVNPOutputDeviceRoute);
    if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0) {
      [location[0] addObserver:v8 forKeyPath:@"batteryLevel" options:4 context:off_5F860];
    }
  }

  objc_storeStrong(location, 0LL);
}

- (BOOL)canBecomeFocused
{
  return !-[TVNPRouteCollectionViewCell disableFocus](self, "disableFocus", a2, self);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  v24 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v22 = 0LL;
  objc_storeStrong(&v22, a4);
  id v21 = 0LL;
  objc_storeStrong(&v21, a5);
  v20 = a6;
  if (a6 == off_5F818)
  {
    v11 = v24;
    v12 = -[TVNPRoute title](v24->_route, "title");
    -[TVNPBaseRouteCollectionViewCell setTitleText:](v11, "setTitleText:");
  }

  else if (v20 == off_5F820)
  {
    v9 = v24;
    v10 = -[TVNPRoute deviceImage](v24->_route, "deviceImage");
    -[TVNPBaseRouteCollectionViewCell setDeviceImage:](v9, "setDeviceImage:");
  }

  else if (v20 == off_5F828)
  {
    -[TVNPBaseRouteCollectionViewCell setDeviceType:]( v24,  "setDeviceType:",  -[TVNPRoute deviceType](v24->_route, "deviceType"));
  }

  else if (v20 == off_5F830)
  {
    BOOL v19 = (char *)-[TVNPRoute selectionState](v24->_route, "selectionState") == (char *)&dword_0 + 2;
    BOOL v18 = (char *)-[TVNPRoute selectionState](v24->_route, "selectionState") == (char *)&dword_0 + 1;
    -[TVNPBaseRouteCollectionViewCell setDisplayAsSelected:](v24, "setDisplayAsSelected:", v19);
    -[TVNPBaseRouteCollectionViewCell setPendingSelection:](v24, "setPendingSelection:", v18);
    -[TVNPRouteCollectionViewCell _updateMusicBarState](v24, "_updateMusicBarState");
  }

  else if (v20 == off_5F848)
  {
    -[TVNPRouteCollectionViewCell _updateVolumeState](v24, "_updateVolumeState");
    -[TVNPRouteCollectionViewCell _updateMusicBarState](v24, "_updateMusicBarState");
  }

  else if (v20 == off_5F838)
  {
    -[TVNPRouteCollectionViewCell _updateVolumeState](v24, "_updateVolumeState");
  }

  else if (v20 == off_5F840)
  {
    -[TVNPRouteCollectionViewCell _updateMultiSelectionState](v24, "_updateMultiSelectionState");
  }

  else if (v20 == off_5F850 || v20 == off_5F858)
  {
    -[TVNPRouteCollectionViewCell _updateMusicBarState](v24, "_updateMusicBarState");
  }

  else if (v20 == off_5F860)
  {
    v8 = -[TVNPRouteCollectionViewCell route](v24, "route");
    id v17 = -[TVNPRoute batteryLevel](v8, "batteryLevel");

    if (v17 && (objc_msgSend(v17, "tvnp_hasAnyPercentages") & 1) != 0)
    {
      v6 = v24;
      id v7 = -[TVNPRouteCollectionViewCell _batteryTextForBatteryLevel:](v24, "_batteryTextForBatteryLevel:", v17);
      -[TVNPRouteCollectionViewCell setBatteryLevelText:](v6, "setBatteryLevelText:");
    }

    else
    {
      -[TVNPRouteCollectionViewCell setBatteryLevelText:](v24, "setBatteryLevelText:", 0LL);
    }

    -[TVNPRouteCollectionViewCell _resolveSubtitleText](v24, "_resolveSubtitleText");
    objc_storeStrong(&v17, 0LL);
  }

  else
  {
    v16.receiver = v24;
    v16.super_class = (Class)&OBJC_CLASS___TVNPRouteCollectionViewCell;
    -[TVNPRouteCollectionViewCell observeValueForKeyPath:ofObject:change:context:]( &v16,  "observeValueForKeyPath:ofObject:change:context:",  location[0],  v22,  v21,  v20);
  }

  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)volumeSliderValueChanged:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  route = v6->_route;
  [location[0] value];
  uint64_t v4 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:");
  -[TVNPRoute setVolumeLevel:](route, "setVolumeLevel:");

  objc_storeStrong(location, 0LL);
}

- (void)routeViewSelected
{
  objc_super v2 = -[TVNPRouteCollectionViewCell delegate](self, "delegate");
  -[TVNPRouteCollectionViewCellDelegate routeCellDidSelectRouteView:](v2, "routeCellDidSelectRouteView:", self);
}

- (void)accessoryViewSelected
{
  objc_super v2 = -[TVNPRouteCollectionViewCell delegate](self, "delegate");
  -[TVNPRouteCollectionViewCellDelegate routeCellDidSelectAccessoryView:](v2, "routeCellDidSelectAccessoryView:", self);
}

- (void)_updateMusicBarState
{
  BOOL v18 = self;
  SEL v17 = a2;
  uint64_t v16 = 0LL;
  v9 = -[TVNPRoute destination](v18->_route, "destination");
  v10 = -[TVNPRoutingDestination playbackState](v9, "playbackState");

  v15[1] = v10;
  if (!v10) {
    goto LABEL_8;
  }
  if (v10 == (_BYTE *)&dword_0 + 1)
  {
    uint64_t v16 = 1LL;
  }

  else
  {
    if (v10 != (_BYTE *)&dword_0 + 2)
    {
LABEL_8:
      uint64_t v16 = 0LL;
      goto LABEL_9;
    }

    uint64_t v16 = 2LL;
  }

- (void)_updateVolumeState
{
  uint64_t v7 = self;
  SEL v6 = a2;
  id v2 = -[TVNPRoute destination](self->_route, "destination");
  unsigned __int8 v3 = -[TVNPRoutingDestination isCurrentDestination](v2, "isCurrentDestination");

  char v5 = v3 & 1;
  id location = -[TVNPRoute volumeLevel](v7->_route, "volumeLevel");
  if ((v3 & 1) != 0 && location) {
    -[TVNPBaseRouteCollectionViewCell setVolumeLevel:](v7, "setVolumeLevel:", location);
  }
  else {
    -[TVNPBaseRouteCollectionViewCell setVolumeLevel:](v7, "setVolumeLevel:", 0LL);
  }
  objc_storeStrong(&location, 0LL);
}

- (void)_updateMultiSelectionState
{
}

- (void)_resolveSubtitleText
{
  uint64_t v4 = -[TVNPRouteCollectionViewCell batteryLevelText](self, "batteryLevelText");

  if (v4)
  {
    unsigned __int8 v3 = -[TVNPRouteCollectionViewCell batteryLevelText](self, "batteryLevelText");
    -[TVNPBaseRouteCollectionViewCell setSubtitleText:](self, "setSubtitleText:");
  }

  else
  {
    id v2 = -[TVNPRouteCollectionViewCell nowPlayingInfoText](self, "nowPlayingInfoText");
    -[TVNPBaseRouteCollectionViewCell setSubtitleText:](self, "setSubtitleText:");
  }

- (id)_batteryTextForBatteryLevel:(id)a3
{
  v68 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v66 = &_os_log_default;
  os_log_type_t v65 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v66, OS_LOG_TYPE_DEFAULT))
  {
    sub_126C0((uint64_t)v70, (uint64_t)location[0]);
    _os_log_impl(&dword_0, (os_log_t)v66, v65, "[TVNPRouteCollectionViewCell Module] Battery level: %@", v70, 0xCu);
  }

  objc_storeStrong(&v66, 0LL);
  id v64 = 0LL;
  id v63 = 0LL;
  id v62 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
  [v62 setNumberStyle:3];
  [v62 setUsesSignificantDigits:0];
  [v62 setUsesGroupingSeparator:0];
  id v53 = [location[0] leftPercentage];
  char v60 = 0;
  BOOL v54 = 0;
  if (v53)
  {
    id v61 = [location[0] rightPercentage];
    char v60 = 1;
    BOOL v54 = v61 != 0LL;
  }

  if ((v60 & 1) != 0) {

  }
  if (v54)
  {
    if (-[TVNPRouteCollectionViewCell _shouldShowSeparateBatteryPercentagesForBatteryLevel:]( v68,  "_shouldShowSeparateBatteryPercentagesForBatteryLevel:",  location[0]))
    {
      v52 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v68));
      v51 =  -[NSBundle localizedStringForKey:value:table:]( v52,  "localizedStringForKey:value:table:",  @"AirPodsBatteryLevelCombinedFormat",  &stru_51218,  0LL);
      id v50 = [location[0] leftPercentage];
      id v49 = objc_msgSend(v62, "stringFromNumber:");
      id v48 = [location[0] rightPercentage];
      id v47 = objc_msgSend(v62, "stringFromNumber:");
      unsigned __int8 v3 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v51, v49, v47);
      id v4 = v64;
      id v64 = v3;
    }

    else
    {
      id v44 = [location[0] leftPercentage];
      [v44 floatValue];
      float v46 = v5;
      id v45 = [location[0] rightPercentage];
      [v45 floatValue];
      float v6 = *(float *)&v7;
      *(float *)&double v7 = v46;
      char v57 = 0;
      char v55 = 0;
      if (v46 >= v6)
      {
        id v56 = objc_msgSend(location[0], "rightPercentage", v7);
        char v55 = 1;
        id v8 = v56;
      }

      else
      {
        id v58 = objc_msgSend(location[0], "leftPercentage", v7);
        char v57 = 1;
        id v8 = v58;
      }

      id v59 = v8;
      if ((v55 & 1) != 0) {

      }
      if ((v57 & 1) != 0) {
      v43 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v68));
      }
      v42 =  -[NSBundle localizedStringForKey:value:table:]( v43,  "localizedStringForKey:value:table:",  @"AirPodsBatteryLevelSingleFormat",  &stru_51218);
      id v41 = [v62 stringFromNumber:v59];
      v9 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v42, v41);
      id v10 = v64;
      id v64 = v9;

      objc_storeStrong(&v59, 0LL);
    }
  }

  else
  {
    id v40 = [location[0] leftPercentage];

    if (v40)
    {
      v39 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v68));
      v38 =  -[NSBundle localizedStringForKey:value:table:]( v39,  "localizedStringForKey:value:table:",  @"AirPodsBatteryLevelLeftFormat",  &stru_51218,  0LL);
      id v37 = [location[0] leftPercentage];
      id v36 = objc_msgSend(v62, "stringFromNumber:");
      id v11 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v38, v36);
      id v12 = v64;
      id v64 = v11;
    }

    else
    {
      id v35 = [location[0] rightPercentage];

      if (v35)
      {
        v34 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v68));
        v33 =  -[NSBundle localizedStringForKey:value:table:]( v34,  "localizedStringForKey:value:table:",  @"AirPodsBatteryLevelRightFormat",  &stru_51218,  0LL);
        id v32 = [location[0] rightPercentage];
        id v31 = objc_msgSend(v62, "stringFromNumber:");
        char v13 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v33, v31);
        id v14 = v64;
        id v64 = v13;
      }

      else
      {
        id v30 = [location[0] singlePercentage];

        if (v30)
        {
          v29 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v68));
          v28 =  -[NSBundle localizedStringForKey:value:table:]( v29,  "localizedStringForKey:value:table:",  @"AirPodsBatteryLevelSingleFormat",  &stru_51218,  0LL);
          id v27 = [location[0] singlePercentage];
          id v26 = objc_msgSend(v62, "stringFromNumber:");
          v15 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v28, v26);
          id v16 = v64;
          id v64 = v15;
        }
      }
    }
  }

  id v25 = [location[0] casePercentage];

  if (v25)
  {
    v24 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(v68));
    v23 =  -[NSBundle localizedStringForKey:value:table:]( v24,  "localizedStringForKey:value:table:",  @"AirPodsBatteryLevelCaseFormat",  &stru_51218,  0LL);
    id v20 = v62;
    id v22 = [location[0] casePercentage];
    id v21 = objc_msgSend(v20, "stringFromNumber:");
    SEL v17 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v23, v21);
    id v18 = v63;
    id v63 = v17;
  }

  if (v64 && v63) {
    v69 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@  %@", v64, v63);
  }
  else {
    v69 = (NSString *)v64;
  }
  objc_storeStrong(&v62, 0LL);
  objc_storeStrong(&v63, 0LL);
  objc_storeStrong(&v64, 0LL);
  objc_storeStrong(location, 0LL);
  return v69;
}

- (BOOL)_shouldShowSeparateBatteryPercentagesForBatteryLevel:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = [location[0] leftPercentage];
  char v13 = 0;
  char v11 = 0;
  char v9 = 0;
  BOOL v8 = 0;
  if (v7)
  {
    id v14 = [location[0] rightPercentage];
    char v13 = 1;
    BOOL v8 = 0;
    if (v14)
    {
      id v12 = [location[0] leftPercentage];
      char v11 = 1;
      [v12 floatValue];
      float v6 = v3;
      id v10 = [location[0] rightPercentage];
      char v9 = 1;
      [v10 floatValue];
      BOOL v8 = vabds_f32(v6, v4) >= 0.1;
    }
  }

  BOOL v16 = v8;
  if ((v9 & 1) != 0) {

  }
  if ((v11 & 1) != 0) {
  if ((v13 & 1) != 0)
  }

  objc_storeStrong(location, 0LL);
  return v16;
}

- (TVNPRoute)route
{
  return self->_route;
}

- (BOOL)disableFocus
{
  return self->_disableFocus;
}

- (void)setDisableFocus:(BOOL)a3
{
  self->_disableFocus = a3;
}

- (TVNPRouteCollectionViewCellDelegate)delegate
{
  return (TVNPRouteCollectionViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSString)batteryLevelText
{
  return self->_batteryLevelText;
}

- (void)setBatteryLevelText:(id)a3
{
}

- (NSString)nowPlayingInfoText
{
  return self->_nowPlayingInfoText;
}

- (void)setNowPlayingInfoText:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
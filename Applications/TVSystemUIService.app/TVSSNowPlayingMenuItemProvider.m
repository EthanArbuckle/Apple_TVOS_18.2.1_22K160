@interface TVSSNowPlayingMenuItemProvider
- (BOOL)shouldShowMenuItem;
- (BOOL)updateVisualContentForMenuItem:(id)a3;
- (TVSSAudioNowPlayingController)audioNowPlayingController;
- (TVSSNowPlayingLingeringController)lingeringController;
- (TVSSNowPlayingMenuItemProvider)initWithAudioNowPlayingController:(id)a3 outputDeviceRouteController:(id)a4 initialMode:(unint64_t)a5;
- (TVSSSystemOutputDeviceRouteController)outputDeviceRouteController;
- (TVSSWaveformVisualContent)waveformVisualContent;
- (id)_currentVisualContent;
- (id)log;
- (id)newMenuItem;
- (unint64_t)mode;
- (void)_updateLingeringControllerActiveState;
- (void)dealloc;
- (void)nowPlayingState:(id)a3 playbackStateDidChange:(int64_t)a4;
- (void)setAudioNowPlayingController:(id)a3;
- (void)setLingeringController:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setOutputDeviceRouteController:(id)a3;
- (void)setWaveformVisualContent:(id)a3;
- (void)systemOutputDeviceRouteControllerDidChangeOutputDevices:(id)a3;
- (void)systemOutputDeviceRouteControllerDidUpdate:(id)a3;
@end

@implementation TVSSNowPlayingMenuItemProvider

- (TVSSNowPlayingMenuItemProvider)initWithAudioNowPlayingController:(id)a3 outputDeviceRouteController:(id)a4 initialMode:(unint64_t)a5
{
  id v46 = self;
  SEL v45 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  id v43 = 0LL;
  objc_storeStrong(&v43, a4);
  unint64_t v42 = a5;
  id v41 = location;
  id v40 = 0LL;
  Class v39 = NSClassFromString(@"TVSSAudioNowPlayingController");
  if (!v41)
  {
    id v38 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil");
    id v37 = &_os_log_default;
    os_log_type_t v36 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_ERROR))
    {
      v17 = NSStringFromSelector(v45);
      id v35 = v17;
      aClass = (objc_class *)objc_opt_class(v46);
      v16 = NSStringFromClass(aClass);
      id v34 = v16;
      sub_10000583C( (uint64_t)v48,  (uint64_t)v35,  (uint64_t)v34,  (uint64_t)v46,  (uint64_t)@"TVSSNowPlayingMenuItemProvider.m",  52,  (uint64_t)v38);
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v37,  v36,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v48,  0x3Au);

      objc_storeStrong(&v34, 0LL);
      objc_storeStrong(&v35, 0LL);
    }

    objc_storeStrong(&v37, 0LL);
    _bs_set_crash_log_message([v38 UTF8String]);
    __break(0);
    JUMPOUT(0x100031F90LL);
  }

  if (((objc_opt_isKindOfClass(v41, v39) ^ 1) & 1) != 0)
  {
    id v33 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:TVSSAudioNowPlayingControllerClass]");
    os_log_t oslog = &_os_log_default;
    os_log_type_t v31 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v14 = NSStringFromSelector(v45);
      id v30 = v14;
      v15 = (objc_class *)objc_opt_class(v46);
      v13 = NSStringFromClass(v15);
      id v29 = v13;
      sub_10000583C( (uint64_t)v47,  (uint64_t)v30,  (uint64_t)v29,  (uint64_t)v46,  (uint64_t)@"TVSSNowPlayingMenuItemProvider.m",  52,  (uint64_t)v33);
      _os_log_error_impl( (void *)&_mh_execute_header,  oslog,  v31,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v47,  0x3Au);

      objc_storeStrong(&v29, 0LL);
      objc_storeStrong(&v30, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    _bs_set_crash_log_message([v33 UTF8String]);
    __break(0);
    JUMPOUT(0x1000321A4LL);
  }

  objc_storeStrong(&v40, 0LL);
  objc_storeStrong(&v41, 0LL);
  id v5 = v46;
  id v46 = 0LL;
  v28.receiver = v5;
  v28.super_class = (Class)&OBJC_CLASS___TVSSNowPlayingMenuItemProvider;
  id v46 = -[TVSSMenuItemProvider initWithIdentifier:]( &v28,  "initWithIdentifier:",  @"com.apple.TVSystemUIService.nowPlaying.provider");
  objc_storeStrong(&v46, v46);
  if (v46)
  {
    *((void *)v46 + 4) = v42;
    objc_storeStrong((id *)v46 + 6, location);
    id v12 = [*((id *)v46 + 6) nowPlayingState];
    [v12 addObserver:v46];

    objc_storeStrong((id *)v46 + 7, v43);
    [*((id *)v46 + 7) addObserver:v46];
    objc_initWeak(&from, v46);
    id v10 = [*((id *)v46 + 6) nowPlayingState];
    id v11 = [v10 playbackState];

    v26[3] = v11;
    v9 = -[TVSSNowPlayingLingeringController initWithInitialPlaybackState:lingeringDuration:]( objc_alloc(&OBJC_CLASS___TVSSNowPlayingLingeringController),  "initWithInitialPlaybackState:lingeringDuration:",  v11,  TVSSLingeringDuration());
    v6 = (void *)*((void *)v46 + 5);
    *((void *)v46 + 5) = v9;

    v21 = _NSConcreteStackBlock;
    int v22 = -1073741824;
    int v23 = 0;
    v24 = sub_100032584;
    v25 = &unk_1001B6CA0;
    objc_copyWeak(v26, &from);
    [*((id *)v46 + 5) setVisibilityDidChangeHandler:&v21];
    [v46 _updateLingeringControllerActiveState];
    [v46 updateMenuItemWithReason:@"Initial update"];
    objc_destroyWeak(v26);
    objc_destroyWeak(&from);
  }

  v8 = (TVSSNowPlayingMenuItemProvider *)v46;
  objc_storeStrong(&v43, 0LL);
  objc_storeStrong(&location, 0LL);
  objc_storeStrong(&v46, 0LL);
  return v8;
}

- (void)dealloc
{
  id v5 = self;
  SEL v4 = a2;
  v2 = -[TVSSAudioNowPlayingController nowPlayingState](self->_audioNowPlayingController, "nowPlayingState");
  -[TVSSNowPlayingState removeObserver:](v2, "removeObserver:", v5);

  -[TVSSSystemOutputDeviceRouteController removeObserver:](v5->_outputDeviceRouteController, "removeObserver:", v5);
  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS___TVSSNowPlayingMenuItemProvider;
  -[TVSSNowPlayingMenuItemProvider dealloc](&v3, "dealloc");
}

- (void)setMode:(unint64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    -[TVSSNowPlayingMenuItemProvider _updateLingeringControllerActiveState]( self,  "_updateLingeringControllerActiveState");
    objc_super v3 = -[TVSSSimpleMenuItemProvider menuItem](self, "menuItem");
    -[TVSSNowPlayingMenuItemProvider updateVisualContentForMenuItem:](self, "updateVisualContentForMenuItem:");
  }

- (BOOL)shouldShowMenuItem
{
  objc_super v3 = -[TVSSNowPlayingMenuItemProvider lingeringController](self, "lingeringController");
  unsigned __int8 v4 = -[TVSSNowPlayingLingeringController isVisible](v3, "isVisible");

  return v4 & 1;
}

- (id)newMenuItem
{
  v14 = self;
  v13[1] = (id)a2;
  v13[0] = -[TVSSNowPlayingMenuItemProvider audioNowPlayingController](self, "audioNowPlayingController");
  objc_super v3 = objc_alloc(&OBJC_CLASS___TVSSMenuItem);
  v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  v9 = sub_1000328C4;
  id v10 = &unk_1001B6CC8;
  id v11 = v13[0];
  id v12 = -[TVSSMenuItem initWithIdentifier:hasFocusableContent:platterViewControllerClassProvider:]( v3,  "initWithIdentifier:hasFocusableContent:platterViewControllerClassProvider:",  @"com.apple.TVSystemUIService.nowPlaying.menuitem",  1LL);
  id v4 = -[TVSSNowPlayingMenuItemProvider _currentVisualContent](v14, "_currentVisualContent");
  -[TVSSMenuItem setVisualContent:](v12, "setVisualContent:");

  id v5 = v12;
  objc_storeStrong((id *)&v12, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(v13, 0LL);
  return v5;
}

- (id)log
{
  return NowPlayingProviderLog();
}

- (BOOL)updateVisualContentForMenuItem:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = -[TVSSNowPlayingMenuItemProvider _currentVisualContent](v6, "_currentVisualContent");
  objc_msgSend(location[0], "setVisualContent:");

  objc_storeStrong(location, 0LL);
  return 1;
}

- (void)nowPlayingState:(id)a3 playbackStateDidChange:(int64_t)a4
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = -[TVSSNowPlayingMenuItemProvider lingeringController](v9, "lingeringController");
  -[TVSSNowPlayingLingeringController handlePlaybackStateChange:](v5, "handlePlaybackStateChange:", a4);

  v6 = v9;
  int v7 = -[TVSSSimpleMenuItemProvider menuItem](v9, "menuItem");
  -[TVSSNowPlayingMenuItemProvider updateVisualContentForMenuItem:](v6, "updateVisualContentForMenuItem:");

  objc_storeStrong(location, 0LL);
}

- (void)systemOutputDeviceRouteControllerDidUpdate:(id)a3
{
  int v7 = self;
  SEL v6 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  objc_super v3 = v7;
  id v4 = NSStringFromSelector(v6);
  -[TVSSSimpleMenuItemProvider updateCurrentMenuItemVisualContentWithReason:]( v3,  "updateCurrentMenuItemVisualContentWithReason:");

  objc_storeStrong(&location, 0LL);
}

- (void)systemOutputDeviceRouteControllerDidChangeOutputDevices:(id)a3
{
  int v7 = self;
  SEL v6 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  objc_super v3 = v7;
  id v4 = NSStringFromSelector(v6);
  -[TVSSSimpleMenuItemProvider updateCurrentMenuItemVisualContentWithReason:]( v3,  "updateCurrentMenuItemVisualContentWithReason:");

  objc_storeStrong(&location, 0LL);
}

- (id)_currentVisualContent
{
  unint64_t v42 = self;
  SEL v41 = a2;
  BOOL v40 = 0;
  v17 =  -[TVSSSystemOutputDeviceRouteController systemEndpointRoute]( self->_outputDeviceRouteController,  "systemEndpointRoute");
  id v16 = -[MPAVEndpointRoute endpointObject](v17, "endpointObject");
  id v39 = [v16 outputDevices];

  id v2 = objc_msgSend(v39, "msv_firstWhere:", &stru_1001B6D08);
  BOOL v15 = v2 != 0LL;

  BOOL v38 = v15;
  uint64_t v33 = 0LL;
  id v34 = &v33;
  int v35 = 0x20000000;
  int v36 = 32;
  char v37 = 0;
  v26 = _NSConcreteStackBlock;
  int v27 = -1073741824;
  int v28 = 0;
  id v29 = sub_100033430;
  id v30 = &unk_1001B6D30;
  os_log_type_t v31 = &v33;
  id v32 = objc_msgSend(v39, "msv_map:", &v26);
  char v24 = 0;
  BOOL v14 = 0;
  if (v38)
  {
    id v25 =  +[MPAVRoutingController _symbolNameForRoutes:]( &OBJC_CLASS___MPAVRoutingController,  "_symbolNameForRoutes:",  v32);
    char v24 = 1;
    BOOL v14 = v25 != 0LL;
  }

  BOOL v40 = v14;
  if ((v24 & 1) != 0) {

  }
  BOOL v13 = 0;
  if ((v34[3] & 1) == 0) {
    BOOL v13 = !v40;
  }
  BOOL v23 = v13;
  char v21 = 0;
  if ((id)-[TVSSNowPlayingMenuItemProvider mode](v42, "mode") == (id)2
    || (BOOL v12 = 0, (id)-[TVSSNowPlayingMenuItemProvider mode](v42, "mode") == (id)3))
  {
    int v22 = -[TVSSAudioNowPlayingController nowPlayingState](v42->_audioNowPlayingController, "nowPlayingState");
    char v21 = 1;
    BOOL v12 = (id)-[TVSSNowPlayingState playbackState](v22, "playbackState") == (id)2;
  }

  if ((v21 & 1) != 0) {

  }
  if (v12)
  {
    if (v23)
    {
      if (!v42->_waveformVisualContent)
      {
        id location = -[TVSSWaveformController initWithNowPlayingController:]( objc_alloc(&OBJC_CLASS___TVSSWaveformController),  "initWithNowPlayingController:",  v42->_audioNowPlayingController);
        id v11 = -[TVSSWaveformVisualContent initWithWaveformController:]( objc_alloc(&OBJC_CLASS___TVSSWaveformVisualContent),  "initWithWaveformController:",  location);
        waveformVisualContent = v42->_waveformVisualContent;
        v42->_waveformVisualContent = v11;

        objc_storeStrong(&location, 0LL);
      }

      id v43 = v42->_waveformVisualContent;
      int v19 = 1;
    }

    else
    {
      id v43 = (TVSSWaveformVisualContent *) +[TVSSFakeWaveformContent fakeWaveform]( &OBJC_CLASS___TVSSFakeWaveformContent,  "fakeWaveform");
      int v19 = 1;
    }
  }

  else
  {
    os_log_t oslog = (os_log_t)-[TVSSNowPlayingMenuItemProvider log](v42, "log");
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v42;
      v9 = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v42->_mode);
      int v8 = -[TVSSAudioNowPlayingController nowPlayingState](v42->_audioNowPlayingController, "nowPlayingState");
      int v7 =  +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[TVSSNowPlayingState playbackState](v8, "playbackState"));
      SEL v6 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v34[3] & 1);
      id v5 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v40);
      sub_100033558((uint64_t)v44, (uint64_t)v10, (uint64_t)v9, (uint64_t)v7, (uint64_t)v6, (uint64_t)v5);
      _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "%@ Falling back to static waveform. mode: %@; playbackState: %@; isOdeonRote: %@; isRemoteRoute: %@",
        v44,
        0x34u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    objc_storeStrong((id *)&v42->_waveformVisualContent, 0LL);
    id v43 = (TVSSWaveformVisualContent *) +[TVSSWaveformVisualContent staticWaveform]( &OBJC_CLASS___TVSSWaveformVisualContent,  "staticWaveform");
    int v19 = 1;
  }

  objc_storeStrong(&v32, 0LL);
  _Block_object_dispose(&v33, 8);
  objc_storeStrong(&v39, 0LL);
  return v43;
}

- (void)_updateLingeringControllerActiveState
{
  BOOL v2 = (id)-[TVSSNowPlayingMenuItemProvider mode](self, "mode") == (id)3;
  objc_super v3 = -[TVSSNowPlayingMenuItemProvider lingeringController](self, "lingeringController");
  -[TVSSNowPlayingLingeringController setActive:](v3, "setActive:", v2);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (TVSSNowPlayingLingeringController)lingeringController
{
  return self->_lingeringController;
}

- (void)setLingeringController:(id)a3
{
}

- (TVSSAudioNowPlayingController)audioNowPlayingController
{
  return self->_audioNowPlayingController;
}

- (void)setAudioNowPlayingController:(id)a3
{
}

- (TVSSSystemOutputDeviceRouteController)outputDeviceRouteController
{
  return self->_outputDeviceRouteController;
}

- (void)setOutputDeviceRouteController:(id)a3
{
}

- (TVSSWaveformVisualContent)waveformVisualContent
{
  return self->_waveformVisualContent;
}

- (void)setWaveformVisualContent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
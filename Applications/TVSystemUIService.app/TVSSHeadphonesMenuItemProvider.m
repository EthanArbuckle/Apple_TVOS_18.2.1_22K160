@interface TVSSHeadphonesMenuItemProvider
- (BOOL)shouldShowMenuItem;
- (BOOL)updateVisualContentForMenuItem:(id)a3;
- (TVSSHeadphonesMenuItemProvider)initWithSystemOutputDeviceRouteController:(id)a3 audioNowPlayingController:(id)a4 menuModeController:(id)a5;
- (id)_imageContentWithOutputDeviceAsset:(id)a3;
- (id)_primaryOutputDeviceRouteAsset;
- (id)_primaryOutputImageContent;
- (id)log;
- (id)newMenuItem;
- (unint64_t)mode;
- (void)_prewarmAVPlayers;
- (void)dealloc;
- (void)setMode:(unint64_t)a3;
- (void)systemOutputDeviceRouteControllerDidChangeOutputDevices:(id)a3;
- (void)systemOutputDeviceRouteControllerDidUpdate:(id)a3;
@end

@implementation TVSSHeadphonesMenuItemProvider

- (TVSSHeadphonesMenuItemProvider)initWithSystemOutputDeviceRouteController:(id)a3 audioNowPlayingController:(id)a4 menuModeController:(id)a5
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v14 = 0LL;
  objc_storeStrong(&v14, a4);
  id v13 = 0LL;
  objc_storeStrong(&v13, a5);
  v5 = v16;
  v16 = 0LL;
  v12.receiver = v5;
  v12.super_class = (Class)&OBJC_CLASS___TVSSHeadphonesMenuItemProvider;
  v16 = -[TVSSMenuItemProvider initWithIdentifier:]( &v12,  "initWithIdentifier:",  @"com.apple.TVSystemUIService.headphones.provider");
  objc_storeStrong((id *)&v16, v16);
  if (v16)
  {
    objc_storeStrong((id *)&v16->_systemOutputDeviceRouteController, location[0]);
    -[TVSSSystemOutputDeviceRouteController addObserver:](v16->_systemOutputDeviceRouteController, "addObserver:", v16);
    objc_storeStrong((id *)&v16->_audioNowPlayingController, v14);
    objc_storeStrong((id *)&v16->_menuModeController, v13);
    v6 = objc_alloc_init(&OBJC_CLASS___TVSSHeadphonesController);
    headphonesController = v16->_headphonesController;
    v16->_headphonesController = v6;

    v16->_presentedPlatter = 0;
    -[TVSSSimpleMenuItemProvider updateMenuItemWithReason:](v16, "updateMenuItemWithReason:", @"Initial update");
  }

  v9 = v16;
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v16, 0LL);
  return v9;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[TVSSSystemOutputDeviceRouteController removeObserver:]( self->_systemOutputDeviceRouteController,  "removeObserver:",  self);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSHeadphonesMenuItemProvider;
  -[TVSSHeadphonesMenuItemProvider dealloc](&v2, "dealloc");
}

- (void)setMode:(unint64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    if (a3 == 3) {
      -[TVSSHeadphonesMenuItemProvider _prewarmAVPlayers](self, "_prewarmAVPlayers");
    }
    else {
      -[TVSSHeadphonesController clearMediaPlayerViewCache](self->_headphonesController, "clearMediaPlayerViewCache");
    }
  }

- (void)systemOutputDeviceRouteControllerDidUpdate:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSSimpleMenuItemProvider updateCurrentMenuItemVisualContentWithReason:]( v4,  "updateCurrentMenuItemVisualContentWithReason:",  @"System output device controller did update");
  objc_storeStrong(location, 0LL);
}

- (void)systemOutputDeviceRouteControllerDidChangeOutputDevices:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSSimpleMenuItemProvider updateMenuItemWithReason:]( v4,  "updateMenuItemWithReason:",  @"System route output devices did change");
  if ((id)-[TVSSHeadphonesMenuItemProvider mode](v4, "mode") == (id)3) {
    -[TVSSHeadphonesMenuItemProvider _prewarmAVPlayers](v4, "_prewarmAVPlayers");
  }
  objc_storeStrong(location, 0LL);
}

- (BOOL)shouldShowMenuItem
{
  v6 = self;
  v5[1] = (id)a2;
  v5[0] =  -[TVSSSystemOutputDeviceRouteController primaryOutputDeviceRoute]( self->_systemOutputDeviceRouteController,  "primaryOutputDeviceRoute");
  id location =  -[TVSSSystemOutputDeviceRouteController secondaryOutputDeviceRoute]( v6->_systemOutputDeviceRouteController,  "secondaryOutputDeviceRoute");
  unsigned __int8 v3 = 1;
  objc_storeStrong(&location, 0LL);
  objc_storeStrong(v5, 0LL);
  return v3 & 1;
}

- (id)newMenuItem
{
  objc_super v12 = self;
  v11[1] = (id)a2;
  unsigned __int8 v3 = objc_alloc(&OBJC_CLASS___TVSSMenuItem);
  v5[1] = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  v8 = sub_10012CA88;
  v9 = &unk_1001B6CC8;
  v10 = v12;
  v11[0] = -[TVSSMenuItem initWithIdentifier:hasFocusableContent:platterViewControllerClassProvider:]( v3,  "initWithIdentifier:hasFocusableContent:platterViewControllerClassProvider:",  @"com.apple.TVSystemUIService.headphones.item",  1LL);
  v5[0] = -[TVSSHeadphonesMenuItemProvider _primaryOutputImageContent](v12, "_primaryOutputImageContent");
  [v11[0] setVisualContent:v5[0]];
  id v4 = v11[0];
  objc_storeStrong(v5, 0LL);
  objc_storeStrong(v11, 0LL);
  objc_storeStrong((id *)&v10, 0LL);
  return v4;
}

- (id)log
{
  id v4 = (dispatch_once_t *)&unk_100221E30;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001BBBE8);
  if (*v4 != -1) {
    dispatch_once(v4, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221E28;
}

- (BOOL)updateVisualContentForMenuItem:(id)a3
{
  v48 = self;
  SEL v47 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  char v45 = 0;
  id v44 = -[TVSSHeadphonesMenuItemProvider _primaryOutputDeviceRouteAsset](v48, "_primaryOutputDeviceRouteAsset");
  id v43 = [v44 symbolName];
  id v42 = v43;
  id v41 = 0LL;
  Class v40 = NSClassFromString(@"NSString");
  if (!v42)
  {
    id v39 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil");
    os_log_t oslog = &_os_log_default;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v20 = type;
      v22 = NSStringFromSelector(v47);
      v18 = v22;
      v36 = v18;
      unsigned __int8 v3 = (objc_class *)objc_opt_class(v48);
      v21 = NSStringFromClass(v3);
      v35 = v21;
      sub_10000583C( (uint64_t)v52,  (uint64_t)v18,  (uint64_t)v35,  (uint64_t)v48,  (uint64_t)@"TVSSHeadphonesMenuItemProvider.m",  146,  (uint64_t)v39);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  v20,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v52,  0x3Au);

      objc_storeStrong((id *)&v35, 0LL);
      objc_storeStrong((id *)&v36, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    _bs_set_crash_log_message([v39 UTF8String]);
    __break(0);
    JUMPOUT(0x10012CE7CLL);
  }

  if (((objc_opt_isKindOfClass(v42, v40) ^ 1) & 1) != 0)
  {
    id v34 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSStringClass]");
    os_log_t v33 = &_os_log_default;
    os_log_type_t v32 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      id v14 = v33;
      os_log_type_t v15 = v32;
      v17 = NSStringFromSelector(v47);
      id v13 = v17;
      v31 = v13;
      id v4 = (objc_class *)objc_opt_class(v48);
      v16 = NSStringFromClass(v4);
      v30 = v16;
      sub_10000583C( (uint64_t)v51,  (uint64_t)v13,  (uint64_t)v30,  (uint64_t)v48,  (uint64_t)@"TVSSHeadphonesMenuItemProvider.m",  146,  (uint64_t)v34);
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  v15,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v51,  0x3Au);

      objc_storeStrong((id *)&v30, 0LL);
      objc_storeStrong((id *)&v31, 0LL);
    }

    objc_storeStrong((id *)&v33, 0LL);
    _bs_set_crash_log_message([v34 UTF8String]);
    __break(0);
    JUMPOUT(0x10012D034LL);
  }

  objc_storeStrong(&v41, 0LL);
  objc_storeStrong(&v42, 0LL);
  id v9 = [location visualContent];
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVSSImageContent);
  id v10 = sub_10012D328(v9, v5);

  v28[1] = v10;
  id v29 = v10;
  id v11 = [v10 userInfo];
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
  objc_super v12 = (os_log_s *)sub_10012D328(v11, v6);

  v27[1] = v12;
  v28[0] = v12;
  if ([v43 isEqualToString:v12])
  {
    v27[0] = (os_log_t)-[TVSSHeadphonesMenuItemProvider log](v48, "log");
    os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v27[0], OS_LOG_TYPE_DEFAULT))
    {
      sub_100016200( (uint64_t)v50,  (uint64_t)"-[TVSSHeadphonesMenuItemProvider updateVisualContentForMenuItem:]",  (uint64_t)v28[0]);
      _os_log_impl( (void *)&_mh_execute_header,  v27[0],  v26,  "%s: The menu item already has the correct visual content. (currentImageSymbolName=%{public}@)",  v50,  0x16u);
    }

    objc_storeStrong((id *)v27, 0LL);
  }

  else
  {
    os_log_t v25 = (os_log_t)-[TVSSHeadphonesMenuItemProvider log](v48, "log");
    os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      sub_100016194( (uint64_t)v49,  (uint64_t)"-[TVSSHeadphonesMenuItemProvider updateVisualContentForMenuItem:]",  (uint64_t)v28[0],  (uint64_t)v43);
      _os_log_impl( (void *)&_mh_execute_header,  v25,  v24,  "%s: Updating visual content of menu item. (currentImageSymbolName=%{public}@, newImageSymbolName=%{public}@)",  v49,  0x20u);
    }

    objc_storeStrong((id *)&v25, 0LL);
    id v23 =  -[TVSSHeadphonesMenuItemProvider _imageContentWithOutputDeviceAsset:]( v48,  "_imageContentWithOutputDeviceAsset:",  v44);
    [location setVisualContent:v23];
    char v45 = 1;
    objc_storeStrong(&v23, 0LL);
  }

  char v8 = v45;
  objc_storeStrong(v28, 0LL);
  objc_storeStrong(&v29, 0LL);
  objc_storeStrong(&v43, 0LL);
  objc_storeStrong(&v44, 0LL);
  objc_storeStrong(&location, 0LL);
  return v8 & 1;
}

- (id)_primaryOutputDeviceRouteAsset
{
  id v5[2] = self;
  v5[1] = (id)a2;
  v5[0] =  -[TVSSSystemOutputDeviceRouteController primaryOutputDeviceRoute]( self->_systemOutputDeviceRouteController,  "primaryOutputDeviceRoute");
  id v4 = objc_msgSend(v5[0], "tvss_asset");
  id v3 = v4;
  objc_storeStrong(&v4, 0LL);
  objc_storeStrong(v5, 0LL);
  return v3;
}

- (id)_primaryOutputImageContent
{
  uint64_t v5 = self;
  v4[1] = (id)a2;
  v4[0] = -[TVSSHeadphonesMenuItemProvider _primaryOutputDeviceRouteAsset](self, "_primaryOutputDeviceRouteAsset");
  id v3 =  -[TVSSHeadphonesMenuItemProvider _imageContentWithOutputDeviceAsset:]( v5,  "_imageContentWithOutputDeviceAsset:",  v4[0]);
  objc_storeStrong(v4, 0LL);
  return v3;
}

- (id)_imageContentWithOutputDeviceAsset:(id)a3
{
  v35 = self;
  SEL v34 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  id v32 = [location symbolName];
  id v31 = v32;
  id v30 = 0LL;
  Class v29 = NSClassFromString(@"NSString");
  if (!v31)
  {
    v28 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil");
    id v27 = &_os_log_default;
    char v26 = 16;
    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v27;
      os_log_type_t type = v26;
      v18 = NSStringFromSelector(v34);
      id v14 = v18;
      os_log_t v25 = v14;
      id v3 = (objc_class *)objc_opt_class(v35);
      v17 = NSStringFromClass(v3);
      os_log_type_t v24 = v17;
      sub_10000583C( (uint64_t)v37,  (uint64_t)v14,  (uint64_t)v24,  (uint64_t)v35,  (uint64_t)@"TVSSHeadphonesMenuItemProvider.m",  185,  (uint64_t)v28);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v37,  0x3Au);

      objc_storeStrong((id *)&v24, 0LL);
      objc_storeStrong((id *)&v25, 0LL);
    }

    objc_storeStrong(&v27, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v28, "UTF8String"));
    __break(0);
    JUMPOUT(0x10012D710LL);
  }

  if (((objc_opt_isKindOfClass(v31, v29) ^ 1) & 1) != 0)
  {
    id v23 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSStringClass]");
    os_log_t oslog = &_os_log_default;
    os_log_type_t v21 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      id v10 = oslog;
      os_log_type_t v11 = v21;
      id v13 = NSStringFromSelector(v34);
      id v9 = v13;
      os_log_type_t v20 = v9;
      id v4 = (objc_class *)objc_opt_class(v35);
      objc_super v12 = NSStringFromClass(v4);
      v19 = v12;
      sub_10000583C( (uint64_t)v36,  (uint64_t)v9,  (uint64_t)v19,  (uint64_t)v35,  (uint64_t)@"TVSSHeadphonesMenuItemProvider.m",  185,  (uint64_t)v23);
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  v11,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v36,  0x3Au);

      objc_storeStrong((id *)&v19, 0LL);
      objc_storeStrong((id *)&v20, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    _bs_set_crash_log_message([v23 UTF8String]);
    __break(0);
    JUMPOUT(0x10012D8C8LL);
  }

  objc_storeStrong(&v30, 0LL);
  objc_storeStrong(&v31, 0LL);
  uint64_t v6 = objc_alloc(&OBJC_CLASS___TVSSImageContent);
  id v7 = [location image];
  char v8 = -[TVSSImageContent initWithImage:userInfo:](v6, "initWithImage:userInfo:");

  objc_storeStrong(&v32, 0LL);
  objc_storeStrong(&location, 0LL);
  return v8;
}

- (void)_prewarmAVPlayers
{
  char v8 = self;
  v7[1] = (id)a2;
  v7[0] =  -[TVSSSystemOutputDeviceRouteController primaryOutputDeviceRoute]( self->_systemOutputDeviceRouteController,  "primaryOutputDeviceRoute");
  if (v7[0])
  {
    headphonesController = v8->_headphonesController;
    id v5 = [v7[0] routeUID];
    -[TVSSHeadphonesController createMediaPlayerViewForRouteUIDIfNecessary:]( headphonesController,  "createMediaPlayerViewForRouteUIDIfNecessary:");
  }

  id location =  -[TVSSSystemOutputDeviceRouteController secondaryOutputDeviceRoute]( v8->_systemOutputDeviceRouteController,  "secondaryOutputDeviceRoute");
  if (location)
  {
    objc_super v2 = v8->_headphonesController;
    id v3 = [location routeUID];
    -[TVSSHeadphonesController createMediaPlayerViewForRouteUIDIfNecessary:]( v2,  "createMediaPlayerViewForRouteUIDIfNecessary:");
  }

  objc_storeStrong(&location, 0LL);
  objc_storeStrong(v7, 0LL);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void).cxx_destruct
{
}

@end
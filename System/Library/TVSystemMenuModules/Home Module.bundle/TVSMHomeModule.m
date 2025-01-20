@interface TVSMHomeModule
+ (id)availableStyles;
- (BOOL)dismissAfterAction;
- (TVSMHomeModule)init;
- (TVSMHomeModuleExpandedViewController)prewarmedViewController;
- (id)analyticsActionType;
- (id)analyticsElementInfo;
- (id)expandedContentViewController;
- (void)prewarmViewController;
- (void)setPrewarmedViewController:(id)a3;
@end

@implementation TVSMHomeModule

+ (id)availableStyles
{
  return &off_198D0;
}

- (TVSMHomeModule)init
{
  SEL v16 = a2;
  v17 = 0LL;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVSMHomeModule;
  v7 = -[TVSMHomeModule init](&v15, "init");
  v17 = v7;
  objc_storeStrong((id *)&v17, v7);
  if (v7)
  {
    objc_initWeak(&from, v17);
    v5 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    uint64_t v6 = TVHMPIPControllerPictureInPictureDidEndNotification;
    v8 = _NSConcreteStackBlock;
    int v9 = -1073741824;
    int v10 = 0;
    v11 = sub_D404;
    v12 = &unk_18D10;
    objc_copyWeak(&v13, &from);
    id v2 =  -[NSNotificationCenter addObserverForName:object:queue:usingBlock:]( v5,  "addObserverForName:object:queue:usingBlock:",  v6,  0LL,  0LL,  &v8);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&from);
  }

  v4 = v17;
  objc_storeStrong((id *)&v17, 0LL);
  return v4;
}

- (BOOL)dismissAfterAction
{
  return 1;
}

- (id)expandedContentViewController
{
  v5 = self;
  v4[1] = (id)a2;
  if (self->_prewarmedViewController)
  {
    v4[0] = v5->_prewarmedViewController;
    objc_storeStrong((id *)&v5->_prewarmedViewController, 0LL);
    id v6 = v4[0];
    objc_storeStrong(v4, 0LL);
  }

  else
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___TVSMHomeModuleExpandedViewController);
    [v3 setDelegate:v5];
    id v6 = v3;
    objc_storeStrong(&v3, 0LL);
  }

  return v6;
}

- (void)prewarmViewController
{
  v22 = self;
  location[1] = (id)a2;
  location[0] = (id)home_module_log(self);
  char v20 = 1;
  v12 = (os_log_s *)(id)home_module_log(location[0]);
  os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, v22);

  os_signpost_id_t v19 = v13;
  if (v13 && v19 != -1LL && os_signpost_enabled((os_log_t)location[0]))
  {
    log = (os_log_s *)location[0];
    os_signpost_type_t type = v20;
    os_signpost_id_t spid = v19;
    sub_7F70(v18);
    _os_signpost_emit_with_name_impl(&dword_0, log, type, spid, "PrewarmHomeVC", "", v18, 2u);
  }

  objc_storeStrong(location, 0LL);
  id v2 = objc_alloc_init(&OBJC_CLASS___TVSMHomeModuleExpandedViewController);
  prewarmedViewController = v22->_prewarmedViewController;
  v22->_prewarmedViewController = v2;

  id v17 = (id)home_module_log( -[TVSMHomeModuleExpandedViewController setDelegate:]( v22->_prewarmedViewController,  "setDelegate:",  v22));
  char v16 = 2;
  v7 = (os_log_s *)(id)home_module_log(v17);
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, v22);

  os_signpost_id_t v15 = v8;
  if (v8 && v15 != -1LL && os_signpost_enabled((os_log_t)v17))
  {
    v4 = (os_log_s *)v17;
    os_signpost_type_t v5 = v16;
    os_signpost_id_t v6 = v15;
    sub_7F70(v14);
    _os_signpost_emit_with_name_impl(&dword_0, v4, v5, v6, "PrewarmHomeVC", "", v14, 2u);
  }

  objc_storeStrong(&v17, 0LL);
}

- (id)analyticsActionType
{
  return TVSMClickAnalyticsActionTypeNavigate;
}

- (id)analyticsElementInfo
{
  return +[TVSMAnalyticsElementInfo infoWithIdentifier:targetType:displayStyle:elementState:]( &OBJC_CLASS___TVSMAnalyticsElementInfo,  "infoWithIdentifier:targetType:displayStyle:elementState:",  @"home",  TVSMAnalyticsElementTypeControl,  -[TVSMHomeModule style](self, "style"),  0LL);
}

- (TVSMHomeModuleExpandedViewController)prewarmedViewController
{
  return self->_prewarmedViewController;
}

- (void)setPrewarmedViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface TVSSAttentionAwarenessMenuModeStateContributor
- (AWAttentionAwarenessClient)attentionAwarenessClient;
- (TVSSAttentionAwarenessMenuModeStateContributor)init;
- (TVSSMenuModeStateContributingDelegate)contributorDelegate;
- (void)_notifyStateContributorHasUpdate;
- (void)dealloc;
- (void)setAttentionAwarenessClient:(id)a3;
- (void)setContributorDelegate:(id)a3;
- (void)updateMenuModeState:(id)a3;
@end

@implementation TVSSAttentionAwarenessMenuModeStateContributor

- (TVSSAttentionAwarenessMenuModeStateContributor)init
{
  SEL v31 = a2;
  id location = 0LL;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___TVSSAttentionAwarenessMenuModeStateContributor;
  id location = -[TVSSAttentionAwarenessMenuModeStateContributor init](&v30, "init");
  objc_storeStrong(&location, location);
  if (location)
  {
    objc_initWeak(&from, location);
    v10 = objc_alloc_init(&OBJC_CLASS___AWAttentionAwarenessClient);
    v2 = (void *)*((void *)location + 2);
    *((void *)location + 2) = v10;

    id v28 = objc_alloc_init(&OBJC_CLASS___AWAttentionAwarenessConfiguration);
    [v28 setIdentifier:@"com.apple.TVSystemUIService.MenuModeStateContributor"];
    [v28 setEventMask:3967];
    [v28 setAttentionLostTimeout:0.0];
    [*((id *)location + 2) setConfiguration:v28];
    queue = &_dispatch_main_q;
    v21 = _NSConcreteStackBlock;
    int v22 = -1073741824;
    int v23 = 0;
    v24 = sub_1000E8458;
    v25 = &unk_1001B61C0;
    id v26 = v28;
    id v27 = location;
    dispatch_async(queue, &v21);

    v8 = (void *)*((void *)location + 2);
    v7 = &_dispatch_main_q;
    v15 = _NSConcreteStackBlock;
    int v16 = -1073741824;
    int v17 = 0;
    v18 = sub_1000E84B4;
    v19 = &unk_1001BA030;
    objc_copyWeak(&v20, &from);
    [v8 setEventHandlerWithQueue:v7 block:&v15];

    id v14 = 0LL;
    v3 = (void *)*((void *)location + 2);
    id v12 = 0LL;
    unsigned __int8 v6 = [v3 resumeWithError:&v12];
    objc_storeStrong(&v14, v12);
    char v13 = v6 & 1;
    if ((v6 & 1) == 0)
    {
      os_log_t oslog = (os_log_t)MenuModeContributorLog();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        sub_10001AEB8((uint64_t)v33, (uint64_t)v14);
        _os_log_error_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_ERROR,  "Failed to start AttentionAwarenessClient %{public}@",  v33,  0xCu);
      }

      objc_storeStrong((id *)&oslog, 0LL);
    }

    objc_storeStrong(&v14, 0LL);
    objc_destroyWeak(&v20);
    objc_storeStrong(&v27, 0LL);
    objc_storeStrong(&v26, 0LL);
    objc_storeStrong(&v28, 0LL);
    objc_destroyWeak(&from);
  }

  v5 = (TVSSAttentionAwarenessMenuModeStateContributor *)location;
  objc_storeStrong(&location, 0LL);
  return v5;
}

- (void)dealloc
{
  v10 = self;
  v9[1] = (id)a2;
  v9[0] = 0LL;
  attentionAwarenessClient = self->_attentionAwarenessClient;
  id obj = 0LL;
  unsigned __int8 v3 = -[AWAttentionAwarenessClient invalidateWithError:]( attentionAwarenessClient,  "invalidateWithError:",  &obj);
  objc_storeStrong(v9, obj);
  char v8 = v3 & 1;
  if ((v3 & 1) == 0)
  {
    os_log_t oslog = (os_log_t)MenuModeContributorLog();
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_10001AEB8((uint64_t)v11, (uint64_t)v9[0]);
      _os_log_error_impl( (void *)&_mh_execute_header,  oslog,  type,  "Failed to invalidate AttentionAwarenessClient %{public}@",  v11,  0xCu);
    }

    objc_storeStrong((id *)&oslog, 0LL);
  }

  objc_storeStrong(v9, 0LL);
  v4.receiver = v10;
  v4.super_class = (Class)&OBJC_CLASS___TVSSAttentionAwarenessMenuModeStateContributor;
  -[TVSSAttentionAwarenessMenuModeStateContributor dealloc](&v4, "dealloc");
}

- (void)updateMenuModeState:(id)a3
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v5 = -[TVSSAttentionAwarenessMenuModeStateContributor attentionAwarenessClient](v14, "attentionAwarenessClient");
  id v12 = -[AWAttentionAwarenessClient lastEvent](v5, "lastEvent");

  if (v12)
  {
    BOOL v11 = [v12 eventMask] != (id)1;
    id v10 = MenuModeContributorLog();
    os_log_type_t v9 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_INFO))
    {
      sub_10003EC58((uint64_t)v15, v11);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v10, v9, "Determined hasUserAttention: %{BOOL}d", v15, 8u);
    }

    objc_storeStrong(&v10, 0LL);
    [location[0] setHasUserAttention:v11];
  }

  else
  {
    id v8 = MenuModeContributorLog();
    char v7 = 1;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_INFO))
    {
      unsigned __int8 v3 = (os_log_s *)v8;
      os_log_type_t v4 = v7;
      sub_100010524(v6);
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "No event, assuming no attention", v6, 2u);
    }

    objc_storeStrong(&v8, 0LL);
    [location[0] setHasUserAttention:0];
  }

  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_notifyStateContributorHasUpdate
{
  v2 = -[TVSSAttentionAwarenessMenuModeStateContributor contributorDelegate](self, "contributorDelegate");
  -[TVSSMenuModeStateContributingDelegate stateContributorHasUpdate:](v2, "stateContributorHasUpdate:", self);
}

- (TVSSMenuModeStateContributingDelegate)contributorDelegate
{
  return (TVSSMenuModeStateContributingDelegate *)objc_loadWeakRetained((id *)&self->contributorDelegate);
}

- (void)setContributorDelegate:(id)a3
{
}

- (AWAttentionAwarenessClient)attentionAwarenessClient
{
  return self->_attentionAwarenessClient;
}

- (void)setAttentionAwarenessClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
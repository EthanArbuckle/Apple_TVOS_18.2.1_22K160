@interface AKGlobalConfigService
+ (id)sharedInstance;
- (AKGlobalConfigService)init;
- (id)_configURLRequestWithContext:(id)a3;
- (id)_unsafe_updateCacheWithData:(id)a3;
- (void)_getConfigsFromCache:(BOOL)a3 context:(id)a4 completion:(id)a5;
- (void)checkForLocaleChange;
- (void)fetchGlobalConfigUsingCachePolicy:(unint64_t)a3 context:(id)a4 completion:(id)a5;
@end

@implementation AKGlobalConfigService

+ (id)sharedInstance
{
  if (qword_10020F618 != -1) {
    dispatch_once(&qword_10020F618, &stru_1001CA818);
  }
  return (id)qword_10020F620;
}

- (AKGlobalConfigService)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___AKGlobalConfigService;
  v2 = -[AKGlobalConfigService init](&v10, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("AKGlobalConfigServiceQueue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSDictionary);
    cachedConfig = v2->_cachedConfig;
    v2->_cachedConfig = v7;
  }

  return v2;
}

- (void)checkForLocaleChange
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 locale]);
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localeIdentifier]);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AKConfiguration sharedConfiguration](&OBJC_CLASS___AKConfiguration, "sharedConfiguration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 lastKnownLocale]);

  id v8 = [v5 isEqualToString:v7];
  if ((v8 & 1) == 0)
  {
    uint64_t v9 = _AKLogSystem(v8);
    objc_super v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Locale change notification. Fetching global configs.",  buf,  2u);
    }

    uint64_t v11 = AKRequestContextLocaleChange;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000A7920;
    v12[3] = &unk_1001C9180;
    id v13 = v5;
    -[AKGlobalConfigService fetchGlobalConfigUsingCachePolicy:context:completion:]( self,  "fetchGlobalConfigUsingCachePolicy:context:completion:",  1LL,  v11,  v12);
  }
}

- (void)fetchGlobalConfigUsingCachePolicy:(unint64_t)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = _AKLogSystem(v9);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134217984;
    unint64_t v14 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Fetching global config with cache policy %lu",  (uint8_t *)&v13,  0xCu);
  }

  if (!a3)
  {
    uint64_t v12 = 1LL;
    goto LABEL_7;
  }

  if (a3 == 1)
  {
    uint64_t v12 = 0LL;
LABEL_7:
    -[AKGlobalConfigService _getConfigsFromCache:context:completion:]( self,  "_getConfigsFromCache:context:completion:",  v12,  v8,  v9);
  }
}

- (void)_getConfigsFromCache:(BOOL)a3 context:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = _AKSignpostLogSystem(v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  os_signpost_id_t v12 = _AKSignpostCreate();
  uint64_t v14 = v13;

  uint64_t v16 = _AKSignpostLogSystem(v15);
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  v18 = v17;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v18,  OS_SIGNPOST_INTERVAL_BEGIN,  v12,  "FetchGlobalConfig",  " enableTelemetry=YES ",  buf,  2u);
  }

  uint64_t v20 = _AKSignpostLogSystem(v19);
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    os_signpost_id_t v51 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: FetchGlobalConfig  enableTelemetry=YES ",  buf,  0xCu);
  }

  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_1000A7E24;
  v46[3] = &unk_1001C8A18;
  os_signpost_id_t v48 = v12;
  uint64_t v49 = v14;
  id v22 = v8;
  id v47 = v22;
  v23 = objc_retainBlock(v46);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[AKGlobalConfigService _configURLRequestWithContext:](self, "_configURLRequestWithContext:", v9));

  uint64_t v26 = _AKLogSystem(v25);
  v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v28)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Fetching global config from cache...",  buf,  2u);
    }

    uint64_t v29 = objc_claimAutoreleasedReturnValue( +[AKURLSession sharedCacheReliantAnisetteFreeSession]( &OBJC_CLASS___AKURLSession,  "sharedCacheReliantAnisetteFreeSession"));
  }

  else
  {
    if (v28)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Fetching global config from source...",  buf,  2u);
    }

    uint64_t v29 = objc_claimAutoreleasedReturnValue( +[AKURLSession sharedCacheEnabledAnisetteFreeSession]( &OBJC_CLASS___AKURLSession,  "sharedCacheEnabledAnisetteFreeSession"));
  }

  v30 = (void *)v29;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_1000A7F98;
  v41[3] = &unk_1001CA840;
  dispatch_source_t v42 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, &_dispatch_main_q);
  id v31 = v30;
  v44 = self;
  id v45 = v23;
  id v43 = v31;
  v32 = v23;
  v33 = v42;
  v34 = (void *)objc_claimAutoreleasedReturnValue([v31 beginDataTaskWithRequest:v24 completionHandler:v41]);
  dispatch_time_t v35 = dispatch_time(0LL, 60000000000LL);
  dispatch_source_set_timer(v33, v35, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000A8138;
  handler[3] = &unk_1001C6538;
  id v39 = v34;
  id v40 = v31;
  id v36 = v31;
  id v37 = v34;
  dispatch_source_set_event_handler(v33, handler);
  dispatch_resume(v33);
}

- (id)_configURLRequestWithContext:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag sharedBag](&OBJC_CLASS___AKURLBag, "sharedBag"));
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 fetchGlobalConfigURL]);

  if (!v5) {
    dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  @"https://gsas.apple.com/grandslam/GsService2/fetchGlobalConfigs"));
  }
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 locale]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localeIdentifier]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:]( &OBJC_CLASS___NSURLComponents,  "componentsWithURL:resolvingAgainstBaseURL:",  v5,  0LL));
  uint64_t v10 = -[NSURLQueryItem initWithName:value:]( objc_alloc(&OBJC_CLASS___NSURLQueryItem),  "initWithName:value:",  @"locale",  v8);
  uint64_t v16 = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  [v9 setQueryItems:v11];

  os_signpost_id_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 URL]);
  uint64_t v13 = -[NSMutableURLRequest initWithURL:](objc_alloc(&OBJC_CLASS___NSMutableURLRequest), "initWithURL:", v12);
  -[NSMutableURLRequest ak_addClientInfoHeader](v13, "ak_addClientInfoHeader");
  -[NSMutableURLRequest ak_addCountryHeader](v13, "ak_addCountryHeader");
  -[NSMutableURLRequest ak_addDeviceUDIDHeader](v13, "ak_addDeviceUDIDHeader");
  -[NSMutableURLRequest ak_addInternalBuildHeader](v13, "ak_addInternalBuildHeader");
  -[NSMutableURLRequest ak_addSeedBuildHeader](v13, "ak_addSeedBuildHeader");
  -[NSMutableURLRequest ak_addFeatureMaskHeader](v13, "ak_addFeatureMaskHeader");
  -[NSMutableURLRequest ak_addLocaleHeader](v13, "ak_addLocaleHeader");
  -[NSMutableURLRequest ak_addTimeZoneHeaders](v13, "ak_addTimeZoneHeaders");
  -[NSMutableURLRequest ak_addSKUCountryHeader](v13, "ak_addSKUCountryHeader");
  -[NSMutableURLRequest ak_addRequestContextHeader:](v13, "ak_addRequestContextHeader:", v3);

  -[NSMutableURLRequest ak_addExperimentModeHeader](v13, "ak_addExperimentModeHeader");
  id v14 = -[NSMutableURLRequest copy](v13, "copy");

  return v14;
}

- (id)_unsafe_updateCacheWithData:(id)a3
{
  id v29 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  a3,  0LL,  &v29));
  id v4 = v29;
  BOOL v6 = v4;
  if (v4)
  {
    uint64_t v7 = _AKLogSystem(v4);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100140358((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);
    }
LABEL_10:

    id v20 = 0LL;
    goto LABEL_11;
  }

  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary, v5);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v3, v15);
  char v17 = isKindOfClass;
  uint64_t v18 = _AKLogSystem(isKindOfClass);
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  id v8 = v19;
  if ((v17 & 1) == 0)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100140324(v8, v21, v22, v23, v24, v25, v26, v27);
    }
    goto LABEL_10;
  }

  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Config fetched! %@", buf, 0xCu);
  }

  id v20 = v3;
LABEL_11:

  return v20;
}

- (void).cxx_destruct
{
}

@end
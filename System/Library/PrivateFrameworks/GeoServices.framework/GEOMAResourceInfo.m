@interface GEOMAResourceInfo
+ (id)baseURLForType:(unint64_t)a3;
+ (id)maResourcesFolder;
- (BOOL)isExpired;
- (GEOMAResourceInfo)initWithType:(unint64_t)a3 overrides:(id)a4;
- (double)lastAccessedTime;
- (id)_backgroundDownloadOptions;
- (id)baseURL;
- (id)description;
- (id)installedResources;
- (id)query;
- (void)_listResources:(BOOL)a3 queue:(id)a4 results:(id)a5;
- (void)listResources:(BOOL)a3 queue:(id)a4 results:(id)a5;
- (void)updateLastAccessedTime;
@end

@implementation GEOMAResourceInfo

- (GEOMAResourceInfo)initWithType:(unint64_t)a3 overrides:(id)a4
{
  id v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___GEOMAResourceInfo;
  v7 = -[GEOMAResourceInfo init](&v20, "init");
  v9 = v7;
  if (v7)
  {
    v7->_type = a3;
    id v10 = objc_msgSend((id)objc_opt_class(v7, v8), "_defaultQueryParameters");
    v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue(v10);
    v12 = v11;
    if (v6)
    {
      id v13 = -[NSDictionary mutableCopy](v11, "mutableCopy");

      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_100023E0C;
      v18[3] = &unk_100059FF8;
      id v19 = v13;
      v14 = (NSDictionary *)v13;
      [v6 enumerateKeysAndObjectsUsingBlock:v18];
      v15 = (NSDictionary *)-[NSDictionary copy](v14, "copy");
      queryParameters = v9->_queryParameters;
      v9->_queryParameters = v15;
    }

    else
    {
      v14 = v9->_queryParameters;
      v9->_queryParameters = v11;
    }
  }

  return v9;
}

+ (id)maResourcesFolder
{
  if (qword_10006B038 != -1) {
    dispatch_once(&qword_10006B038, &stru_10005A018);
  }
  return (id)qword_10006B030;
}

+ (id)baseURLForType:(unint64_t)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a1 maResourcesFolder]);
  v5 = v4;
  id v6 = @"territories";
  if (a3 != 1) {
    id v6 = 0LL;
  }
  if (a3) {
    v7 = v6;
  }
  else {
    v7 = @"metroRegions";
  }
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 URLByAppendingPathComponent:v7 isDirectory:1]);

  return v8;
}

- (id)baseURL
{
  return objc_msgSend((id)objc_opt_class(self, a2), "baseURLForType:", self->_type);
}

- (double)lastAccessedTime
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMAResourceInfo baseURL](self, "baseURL"));
  id v14 = 0LL;
  id v13 = 0LL;
  unsigned __int8 v3 = [v2 getResourceValue:&v14 forKey:NSURLContentModificationDateKey error:&v13];
  id v4 = v14;
  id v5 = v13;
  if ((v3 & 1) != 0)
  {
    [v4 timeIntervalSinceReferenceDate];
    double v7 = v6;
  }

  else
  {
    id v8 = sub_100018084();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138478083;
      v16 = v2;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Unable to read modification time for resource %{private}@: %@",  buf,  0x16u);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
    [v10 timeIntervalSinceReferenceDate];
    double v7 = v11;
  }

  return v7;
}

- (void)updateLastAccessedTime
{
  id v2 = objc_claimAutoreleasedReturnValue(-[GEOMAResourceInfo baseURL](self, "baseURL"));
  utimes((const char *)[v2 fileSystemRepresentation], 0);
}

- (BOOL)isExpired
{
  if ((-[GEOMAResourceInfo conformsToProtocol:]( self,  "conformsToProtocol:",  &OBJC_PROTOCOL___GEOMAResourceInfo) & 1) != 0)
  {
    unsigned __int8 v3 = self;
    -[GEOMAResourceInfo lastAccessedTime](v3, "lastAccessedTime");
    double v5 = v4;
    -[GEOMAResourceInfo timeToLive](v3, "timeToLive");
    double v7 = v6;

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v8 timeIntervalSinceReferenceDate];
    BOOL v10 = v9 > v5 + v7;
  }

  else
  {
    BOOL v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if (v12) {
      sub_10003AE08(v12, v13, v14, v15, v16, v17, v18, v19);
    }
    return 1;
  }

  return v10;
}

- (id)_backgroundDownloadOptions
{
  id v2 = objc_alloc_init((Class)sub_10001A604());
  [v2 setAllowsCellularAccess:0];
  [v2 setAllowsExpensiveAccess:0];
  [v2 setDiscretionary:1];
  return v2;
}

- (id)query
{
  id v3 = objc_alloc((Class)sub_10001A4FC());
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "_defaultQueryType");
  double v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v3 initWithType:v6];

  queryParameters = self->_queryParameters;
  if (queryParameters)
  {
    BOOL v10 = queryParameters;
  }

  else
  {
    id v11 = objc_msgSend((id)objc_opt_class(self, v8), "_defaultQueryParameters");
    BOOL v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue(v11);
  }

  BOOL v12 = v10;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000242E4;
  v17[3] = &unk_100059FF8;
  id v13 = v7;
  id v18 = v13;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v12, "enumerateKeysAndObjectsUsingBlock:", v17);
  [v13 returnTypes:2];
  [v13 setDoNotBlockBeforeFirstUnlock:1];
  uint64_t v14 = v18;
  id v15 = v13;

  return v15;
}

- (id)installedResources
{
  if ((-[GEOMAResourceInfo conformsToProtocol:]( self,  "conformsToProtocol:",  &OBJC_PROTOCOL___GEOMAResourceInfo) & 1) != 0)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000244AC;
    v16[3] = &unk_100059048;
    uint64_t v17 = self;
    id v18 = v17;
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v19 = v3;
    uint64_t v4 = v17;
    +[GEOMAResource onFileAccessQueueSync:](&OBJC_CLASS___GEOMAResource, "onFileAccessQueueSync:", v16);
    id v5 = v19;
    id v6 = v3;

    return v6;
  }

  else
  {
    BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if (v8) {
      sub_10003AE08(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    return 0LL;
  }

- (void)listResources:(BOOL)a3 queue:(id)a4 results:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ((-[GEOMAResourceInfo conformsToProtocol:]( self,  "conformsToProtocol:",  &OBJC_PROTOCOL___GEOMAResourceInfo) & 1) != 0)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100024818;
    v18[3] = &unk_10005A040;
    void v18[4] = self;
    BOOL v21 = a3;
    dispatch_queue_t v19 = (dispatch_queue_t)v8;
    id v20 = v9;
    dispatch_async(v19, v18);
  }

  else
  {
    BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if (v10) {
      sub_10003AE08(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

- (void)_listResources:(BOOL)a3 queue:(id)a4 results:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = self;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMAResourceInfo installedResources](v10, "installedResources"));
  uint64_t v12 = v11;
  if (a3 || ![v11 count])
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100024A04;
    v16[3] = &unk_10005A0B8;
    void v16[4] = v10;
    id v17 = (id)objc_claimAutoreleasedReturnValue(-[GEOMAResourceInfo query](v10, "query"));
    id v18 = v8;
    id v19 = v12;
    id v21 = v9;
    id v20 = v10;
    id v15 = v17;
    [v15 queryMetaDataWithError:v16];
  }

  else
  {
    id v13 = sub_100018084();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138478083;
      v23 = v10;
      __int16 v24 = 2113;
      v25 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "MA query found installed resources and checkForUpdates = NO; %{private}@ resources: %{private}@",
        buf,
        0x16u);
    }

    id v15 = (id)objc_claimAutoreleasedReturnValue([v12 sortedArrayUsingSelector:"compare:"]);
    (*((void (**)(id, void, id, void))v9 + 2))(v9, 0LL, v15, 0LL);
  }
}

- (id)description
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  [v3 appendString:@"<"];
  id v5 = (objc_class *)objc_opt_class(self, v4);
  id v6 = NSStringFromClass(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v3 appendString:v7];

  objc_msgSend(v3, "appendFormat:", @" %p -", self);
  queryParameters = self->_queryParameters;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100024E6C;
  v11[3] = &unk_100059FF8;
  id v9 = v3;
  id v12 = v9;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](queryParameters, "enumerateKeysAndObjectsUsingBlock:", v11);
  [v9 appendString:@">"];

  return v9;
}

- (void).cxx_destruct
{
}

@end
@interface MAAsset
- (NSString)assetState;
- (id)compatibilityVersion;
- (id)configurationBundleURLsForType:(id)a3;
- (id)contentVersion;
- (int64_t)db_compareCompatibilityVersionTo:(id)a3;
- (int64_t)db_compareContentRevisionTo:(id)a3;
- (int64_t)db_compareContentVersionTo:(id)a3;
- (int64_t)db_compareIgnoringContentRevisionTo:(id)a3;
- (int64_t)db_comparePlatformScoreTo:(id)a3;
- (int64_t)db_compareTo:(id)a3;
- (void)contentRevision;
@end

@implementation MAAsset

- (int64_t)db_compareIgnoringContentRevisionTo:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[MAAsset db_compareContentVersionTo:](self, "db_compareContentVersionTo:", v4);
  if (!v5)
  {
    -[MAAsset db_compareCompatibilityVersionTo:](self, "db_compareCompatibilityVersionTo:", v4);
    int64_t v5 = -[MAAsset db_comparePlatformScoreTo:](self, "db_comparePlatformScoreTo:", v4);
  }

  return v5;
}

- (int64_t)db_compareTo:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[MAAsset db_compareIgnoringContentRevisionTo:](self, "db_compareIgnoringContentRevisionTo:", v4);
  if (!v5) {
    int64_t v5 = -[MAAsset db_compareContentRevisionTo:](self, "db_compareContentRevisionTo:", v4);
  }

  return v5;
}

- (NSString)assetState
{
  v2 = (char *)-[MAAsset state](self, "state");
  else {
    return (NSString *)*(&off_100010980 + (void)(v2 - 1));
  }
}

- (id)compatibilityVersion
{
  if (!a1) {
    return 0LL;
  }
  id v6 = 0LL;
  v1 = sub_100008F54(a1, &v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  id v3 = v6;
  if (!v2 && v3)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSException gc_exceptionWithName:error:]( &OBJC_CLASS___NSException,  "gc_exceptionWithName:error:",  NSInvalidArgumentException,  v3));
    objc_exception_throw(v5);
    return 0LL;
  }

  return v2;
}

- (int64_t)db_compareCompatibilityVersionTo:(id)a3
{
  id v4 = a3;
  id v5 = -[MAAsset compatibilityVersion]_0(self);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = -[MAAsset compatibilityVersion]_0(v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  id v9 = [v6 compare:v8];
  return (int64_t)v9;
}

- (id)contentVersion
{
  if (!a1) {
    return 0LL;
  }
  id v6 = 0LL;
  v1 = sub_1000091F0(a1, (GCVersion *)&v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  id v3 = v6;
  if (!v2 && v3)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSException gc_exceptionWithName:error:]( &OBJC_CLASS___NSException,  "gc_exceptionWithName:error:",  NSInvalidArgumentException,  v3));
    objc_exception_throw(v5);
    return 0LL;
  }

  return v2;
}

- (int64_t)db_compareContentVersionTo:(id)a3
{
  id v4 = a3;
  id v5 = -[MAAsset contentVersion]_0(self);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = -[MAAsset contentVersion]_0(v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  id v9 = [v6 compare:v8];
  return (int64_t)v9;
}

- (void)contentRevision
{
  if (!a1) {
    return 0LL;
  }
  id v5 = 0LL;
  v1 = sub_1000094E8(a1, &v5);
  id v2 = v5;
  if (!v1 && v2)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSException gc_exceptionWithName:error:]( &OBJC_CLASS___NSException,  "gc_exceptionWithName:error:",  NSInvalidArgumentException,  v2));
    objc_exception_throw(v4);
    return 0LL;
  }

  return v1;
}

- (int64_t)db_compareContentRevisionTo:(id)a3
{
  id v4 = a3;
  id v5 = -[MAAsset contentRevision]_0(self);
  id v6 = -[MAAsset contentRevision]_0(v4);

  else {
    return (uint64_t)v5 > (uint64_t)v6;
  }
}

- (int64_t)db_comparePlatformScoreTo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_10000A63C(self);
  uint64_t v6 = sub_10000A63C(v4);

  if (v5 < v6) {
    return -1LL;
  }
  else {
    return v5 > v6;
  }
}

- (id)configurationBundleURLsForType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MAAsset assetType](self, "assetType"));
  unsigned __int8 v6 = [v5 isEqual:@"com.apple.MobileAsset.GameController.DB1"];

  if ((v6 & 1) != 0)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10000ADE4;
    v14[3] = &unk_100010960;
    v14[4] = self;
    id v15 = v4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[GCFuture futureWithLabel:onQueue:block:]( &OBJC_CLASS___GCFuture,  "futureWithLabel:onQueue:block:",  @"Find configuration bundles in asset",  0LL,  v14));
  }

  else
  {
    v16[0] = NSLocalizedDescriptionKey;
    v16[1] = NSLocalizedFailureReasonErrorKey;
    v17[0] = @"Invalid asset.";
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MAAsset assetType](self, "assetType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Asset has incorrect type '%@'.",  v9));
    v17[1] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  2LL));
    id v12 = sub_10000B890((uint64_t)&OBJC_CLASS___NSError, 2LL, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[GCFuture futureWithError:](&OBJC_CLASS___GCFuture, "futureWithError:", v13));
  }

  return v7;
}

@end
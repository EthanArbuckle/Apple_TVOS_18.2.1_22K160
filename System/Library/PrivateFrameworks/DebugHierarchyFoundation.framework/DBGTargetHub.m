@interface DBGTargetHub
+ (id)sharedHub;
+ (unint64_t)hubVersion;
- (DBGTargetHub)init;
- (id)performRequest:(id)a3;
- (id)performRequestWithRequestInBase64:(id)a3;
- (void)clearAllRequestsAndData;
@end

@implementation DBGTargetHub

+ (unint64_t)hubVersion
{
  return (unint64_t)v2;
}

+ (id)sharedHub
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __25__DBGTargetHub_sharedHub__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedHub_onceToken != -1) {
    dispatch_once(&sharedHub_onceToken, block);
  }
  return (id)sharedHub_sharedHub;
}

void __25__DBGTargetHub_sharedHub__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  float v2 = (void *)sharedHub_sharedHub;
  sharedHub_sharedHub = (uint64_t)v1;
}

- (DBGTargetHub)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DBGTargetHub;
  return -[DBGTargetHub init](&v3, "init");
}

- (id)performRequest:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DebugHierarchyTargetHub sharedHub](&OBJC_CLASS___DebugHierarchyTargetHub, "sharedHub"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 performRequest:v3]);

  return v5;
}

- (id)performRequestWithRequestInBase64:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DebugHierarchyTargetHub sharedHub](&OBJC_CLASS___DebugHierarchyTargetHub, "sharedHub"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 performRequestWithRequestInBase64:v3]);

  return v5;
}

- (void)clearAllRequestsAndData
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[DebugHierarchyTargetHub sharedHub](&OBJC_CLASS___DebugHierarchyTargetHub, "sharedHub"));
  [v2 clearAllRequestsAndData];
}

@end
@interface SKBaseManager
+ (id)defaultVisibleRoles;
+ (id)sharedManager;
- (BOOL)supportsCocoa;
- (SKBaseManager)init;
- (id)allDisks;
- (id)formatableFileSystems;
- (id)knownDiskForDictionary:(id)a3;
- (id)wholeDiskForDisk:(id)a3;
- (void)logEvent:(id)a3 eventPayloadBuilder:(id)a4;
@end

@implementation SKBaseManager

+ (id)sharedManager
{
  Class v2 = NSClassFromString(@"SKDaemonManager");
  if (!v2) {
    Class v2 = (Class)&OBJC_CLASS___SKManager;
  }
  -[objc_class sharedManager](v2, "sharedManager");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (SKBaseManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SKBaseManager;
  Class v2 = -[SKBaseManager init](&v5, sel_init);
  v3 = (void *)objc_opt_new();
  +[SKAnalyticsHub addSink:](&OBJC_CLASS____TtC10StorageKit14SKAnalyticsHub, "addSink:", v3);

  return v2;
}

- (id)allDisks
{
  Class v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 raise];

  return 0LL;
}

+ (id)defaultVisibleRoles
{
  Class v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 raise];

  return 0LL;
}

- (id)knownDiskForDictionary:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 raise];

  return 0LL;
}

- (id)wholeDiskForDisk:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 raise];

  return 0LL;
}

- (id)formatableFileSystems
{
  Class v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 raise];

  return 0LL;
}

- (void)logEvent:(id)a3 eventPayloadBuilder:(id)a4
{
}

- (BOOL)supportsCocoa
{
  return self->_supportsCocoa;
}

@end
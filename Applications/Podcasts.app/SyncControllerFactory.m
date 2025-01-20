@interface SyncControllerFactory
+ (Class)resolvedSyncClass;
+ (MTSyncControllerProtocol)resolvedSyncController;
- (_TtC8Podcasts21SyncControllerFactory)init;
@end

@implementation SyncControllerFactory

+ (MTSyncControllerProtocol)resolvedSyncController
{
  return (MTSyncControllerProtocol *)  [(id)objc_opt_self(MTSyncController) sharedInstance];
}

+ (Class)resolvedSyncClass
{
  unint64_t v2 = sub_100152530();
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (_TtC8Podcasts21SyncControllerFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SyncControllerFactory();
  return -[SyncControllerFactory init](&v3, "init");
}

@end
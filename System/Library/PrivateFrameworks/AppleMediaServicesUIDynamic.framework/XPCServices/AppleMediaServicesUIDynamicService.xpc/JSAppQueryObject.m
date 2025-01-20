@interface JSAppQueryObject
- (_TtC34AppleMediaServicesUIDynamicService16JSAppQueryObject)init;
- (id)queryAlmondApps;
- (id)queryBundleIds:(id)a3;
- (id)queryStoreIds:(id)a3;
@end

@implementation JSAppQueryObject

- (id)queryAlmondApps
{
  v2 = self;
  v3 = (void *)sub_100011C70((uint64_t)v2);

  return v3;
}

- (id)queryBundleIds:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_100011E00((uint64_t)v4);

  return v6;
}

- (id)queryStoreIds:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_1000126B8((uint64_t)v4);

  return v6;
}

- (_TtC34AppleMediaServicesUIDynamicService16JSAppQueryObject)init
{
  return (_TtC34AppleMediaServicesUIDynamicService16JSAppQueryObject *)sub_100013890();
}

@end
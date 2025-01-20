@interface JSEngagementObject
- (_TtC34AppleMediaServicesUIDynamicService18JSEngagementObject)init;
- (id)enqueueEvent:(id)a3;
- (id)fetchMessages:(id)a3;
@end

@implementation JSEngagementObject

- (id)enqueueEvent:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_100016CCC((uint64_t)v4);

  return v6;
}

- (id)fetchMessages:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_1000173BC((uint64_t)v4);

  return v6;
}

- (_TtC34AppleMediaServicesUIDynamicService18JSEngagementObject)init
{
  return (_TtC34AppleMediaServicesUIDynamicService18JSEngagementObject *)sub_1000182EC();
}

@end
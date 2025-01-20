@interface JSEngagementObject
- (_TtC16UtilityExtension18JSEngagementObject)init;
- (id)enqueueEvent:(id)a3;
- (id)fetchMessages:(id)a3;
@end

@implementation JSEngagementObject

- (id)enqueueEvent:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_10001788C((uint64_t)v4);

  return v6;
}

- (id)fetchMessages:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_100017F7C((uint64_t)v4);

  return v6;
}

- (_TtC16UtilityExtension18JSEngagementObject)init
{
  return (_TtC16UtilityExtension18JSEngagementObject *)sub_100018EAC();
}

@end
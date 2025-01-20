@interface TVSSTips
+ (_TtC17TVSystemUIService14TVSSTipManager)userProfileTipManager;
+ (void)configureTipsCenter;
+ (void)setUserProfileTipManager:(id)a3;
- (_TtC17TVSystemUIService8TVSSTips)init;
@end

@implementation TVSSTips

+ (void)configureTipsCenter
{
}

+ (_TtC17TVSystemUIService14TVSSTipManager)userProfileTipManager
{
  return (_TtC17TVSystemUIService14TVSSTipManager *)sub_100145010();
}

+ (void)setUserProfileTipManager:(id)a3
{
  id v3 = a3;
  swift_getObjCClassMetadata(a1);
  sub_1001450A4(a3);
}

- (_TtC17TVSystemUIService8TVSSTips)init
{
  return (_TtC17TVSystemUIService8TVSSTips *)sub_100145190();
}

@end
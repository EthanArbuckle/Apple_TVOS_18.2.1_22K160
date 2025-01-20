@interface PBTVUserManagerService
- (BOOL)shouldClientStorePreferencesForSelectedUser;
- (_TtC9PineBoard22PBTVUserManagerService)init;
@end

@implementation PBTVUserManagerService

- (_TtC9PineBoard22PBTVUserManagerService)init
{
  v3 = (void *)objc_opt_self(&OBJC_CLASS___PBUserProfileManager, a2);
  v4 = self;
  v5 = (objc_class *)[v3 sharedInstance];
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC9PineBoard22PBTVUserManagerService_userProfileManager) = v5;

  v9.receiver = v4;
  v9.super_class = (Class)type metadata accessor for PBTVUserManagerService(v6, v7);
  return -[PBTVUserManagerService init](&v9, "init");
}

- (void).cxx_destruct
{
}

- (BOOL)shouldClientStorePreferencesForSelectedUser
{
  v2 = self;
  if ((sub_1002277A0((uint64_t)v2, v3) & 1) != 0) {
    unsigned __int8 v4 = [*(id *)((char *)&v2->super.isa + OBJC_IVAR____TtC9PineBoard22PBTVUserManagerService_userProfileManager) _hasMultipleUsers];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

@end
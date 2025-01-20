@interface DashboardLaunchManager
+ (id)viewControllerWithRequest:(id)a3 game:(id)a4 dismissHandler:(id)a5;
- (_TtC28GameCenterDashboardExtension22DashboardLaunchManager)init;
- (void)donePressed:(id)a3;
@end

@implementation DashboardLaunchManager

- (void)donePressed:(id)a3
{
  if (a3)
  {
    v5 = self;
    uint64_t v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v8, v6);
    swift_unknownObjectRelease(a3);
  }

  else
  {
    memset(v8, 0, sizeof(v8));
    v7 = self;
  }

  sub_1000057E4();

  sub_100005D1C((uint64_t)v8, &qword_100012550);
}

+ (id)viewControllerWithRequest:(id)a3 game:(id)a4 dismissHandler:(id)a5
{
  v8 = _Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject(&unk_10000C6E8, 24LL, 7LL);
    *(void *)(v9 + 16) = v8;
    v8 = sub_100005D7C;
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  swift_getObjCClassMetadata(a1);
  id v10 = a3;
  id v11 = a4;
  id v13 = sub_1000058A4(a3, v12, (uint64_t)v8, v9);
  sub_100005D0C((uint64_t)v8, v9);

  return v13;
}

- (_TtC28GameCenterDashboardExtension22DashboardLaunchManager)init
{
  return (_TtC28GameCenterDashboardExtension22DashboardLaunchManager *)sub_100005B84();
}

- (void).cxx_destruct
{
}

@end
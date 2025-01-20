@interface APSProcessModeUserTracker
- (APSProcessModeUserTracker)init;
- (APSProcessModeUserTracker)initWithMultiUserMode:(id)a3;
- (APSUser)defaultUser;
- (APSUserTrackerResponder)responder;
- (BOOL)usersAreCurrentlyLoading;
- (NSArray)sortedLoggedInUsers;
- (id)dependenciesForUser:(id)a3;
- (id)userForConnection:(id)a3;
- (void)setResponder:(id)a3;
- (void)startup;
@end

@implementation APSProcessModeUserTracker

- (APSUserTrackerResponder)responder
{
  v2 = (char *)self + OBJC_IVAR___APSProcessModeUserTracker_responder;
  swift_beginAccess((char *)self + OBJC_IVAR___APSProcessModeUserTracker_responder, v4, 0LL, 0LL);
  return (APSUserTrackerResponder *)(id)swift_unknownObjectWeakLoadStrong(v2);
}

- (void)setResponder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR___APSProcessModeUserTracker_responder;
  swift_beginAccess((char *)self + OBJC_IVAR___APSProcessModeUserTracker_responder, v5, 1LL, 0LL);
  swift_unknownObjectWeakAssign(v4, a3);
}

- (APSProcessModeUserTracker)initWithMultiUserMode:(id)a3
{
  id v3 = a3;
  v4 = (APSProcessModeUserTracker *)sub_1000B0DC8(v3);

  return v4;
}

- (APSProcessModeUserTracker)init
{
  result = (APSProcessModeUserTracker *)_swift_stdlib_reportUnimplementedInitializer( "apsd.ProcessModeUserTracker",  27LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (NSArray)sortedLoggedInUsers
{
  v2 = self;
  uint64_t v3 = sub_1000B0930();

  sub_1000AE8FC(&qword_10014E568);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (BOOL)usersAreCurrentlyLoading
{
  return 0;
}

- (void)startup
{
  v2 = self;
  sub_1000B0A2C();
}

- (id)userForConnection:(id)a3
{
  v5 = self;
  v6 = (void *)sub_1000B0EE0((uint64_t)a3);
  swift_unknownObjectRetain(v6);
  swift_unknownObjectRelease(a3, v7);

  return v6;
}

- (APSUser)defaultUser
{
  return (APSUser *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR___APSProcessModeUserTracker_systemModeUser));
}

- (id)dependenciesForUser:(id)a3
{
  v5 = self;
  id v6 = sub_1000B0FA0(a3);
  swift_unknownObjectRelease(a3, v7);

  return v6;
}

@end
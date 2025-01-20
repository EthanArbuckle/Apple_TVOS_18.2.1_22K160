@interface RCSServiceReachabilityDelegate
- (BOOL)networkDataAvailable;
- (_TtC3RCS30RCSServiceReachabilityDelegate)init;
- (_TtC3RCS30RCSServiceReachabilityDelegate)initWithServiceSession:(id)a3;
- (int64_t)maxChatParticipantsForContext:(id)a3;
@end

@implementation RCSServiceReachabilityDelegate

- (int64_t)maxChatParticipantsForContext:(id)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)networkDataAvailable
{
  v2 = self;
  id v3 = -[RCSServiceReachabilityDelegate serviceSession](v2, "serviceSession");
  v4 = v3;
  if (!v3) {
    goto LABEL_4;
  }
  v5 = (_TtC3RCS30RCSServiceReachabilityDelegate *)[v3 networkMonitor];

  if (v5)
  {
    LOBYTE(v4) = -[RCSServiceReachabilityDelegate immediatelyReachable](v5, "immediatelyReachable");

    v2 = v5;
LABEL_4:

    return (char)v4;
  }

  __break(1u);
  return result;
}

- (_TtC3RCS30RCSServiceReachabilityDelegate)init
{
  BOOL result = (_TtC3RCS30RCSServiceReachabilityDelegate *)_swift_stdlib_reportUnimplementedInitializer( "RCS.RCSServiceReachabilityDelegate",  34LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (_TtC3RCS30RCSServiceReachabilityDelegate)initWithServiceSession:(id)a3
{
  id v3 = a3;
  BOOL result = (_TtC3RCS30RCSServiceReachabilityDelegate *)_swift_stdlib_reportUnimplementedInitializer( "RCS.RCSServiceReachabilityDelegate",  34LL,  "init(serviceSession:)",  21LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
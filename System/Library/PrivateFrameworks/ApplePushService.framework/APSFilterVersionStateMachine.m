@interface APSFilterVersionStateMachine
- (APSFilterVersionStateMachine)init;
- (APSFilterVersionStateMachine)initWithInitialVersion:(unint64_t)a3;
- (BOOL)everHadAckOn:(id)a3;
- (BOOL)everSentFilterOn:(id)a3;
- (BOOL)hasStaleStateOn:(id)a3 comparedTo:(id)a4;
- (BOOL)hasUnAckedVersionOn:(id)a3;
- (BOOL)isOutOfDateOn:(id)a3;
- (id)aps_prettyDescription;
- (id)noteInvalidWithVersion:(unint64_t)a3;
- (unint64_t)versionToSendFor:(id)a3 error:(id *)a4;
- (void)clearInfoFor:(id)a3;
- (void)noteAckedWithVersion:(unint64_t)a3 on:(id)a4;
- (void)noteSentWithVersion:(unint64_t)a3 on:(id)a4;
@end

@implementation APSFilterVersionStateMachine

- (APSFilterVersionStateMachine)initWithInitialVersion:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APSFilterVersionStateMachine__highestSentVersion) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APSFilterVersionStateMachine__highestAckedVersion) = (Class)a3;
  v3 = self;
  *(Class *)((char *)&v3->super.isa + OBJC_IVAR___APSFilterVersionStateMachine__stateByInterface) = (Class)sub_1000B1B64((uint64_t)&_swiftEmptyArrayStorage);

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for FilterVersionStateMachine();
  return -[APSFilterVersionStateMachine init](&v5, "init");
}

- (APSFilterVersionStateMachine)init
{
  return -[APSFilterVersionStateMachine initWithInitialVersion:](self, "initWithInitialVersion:", 0LL);
}

- (id)aps_prettyDescription
{
  v2 = self;
  sub_1000B1D4C();
  uint64_t v4 = v3;

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return v5;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___APSFilterVersionStateMachine__stateByInterface));
}

- (unint64_t)versionToSendFor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = self;
  unint64_t v8 = sub_1000B2010(v6, a4);

  return v8;
}

- (void)noteSentWithVersion:(unint64_t)a3 on:(id)a4
{
  id v6 = a4;
  v7 = self;
  sub_1000B22F8(a3, v6);
}

- (void)noteAckedWithVersion:(unint64_t)a3 on:(id)a4
{
  id v6 = a4;
  v7 = self;
  sub_1000B2494(a3, v6);
}

- (id)noteInvalidWithVersion:(unint64_t)a3
{
  uint64_t v4 = self;
  id v5 = sub_1000B261C(a3);

  return v5;
}

- (BOOL)isOutOfDateOn:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = sub_1000B274C(v4);

  return self & 1;
}

- (BOOL)everHadAckOn:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = sub_1000B2854(v4);

  return self & 1;
}

- (BOOL)everSentFilterOn:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = sub_1000B2944(v4);

  return self & 1;
}

- (BOOL)hasUnAckedVersionOn:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = sub_1000B2A34(v4);

  return self & 1;
}

- (BOOL)hasStaleStateOn:(id)a3 comparedTo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = self;
  BOOL v9 = sub_1000B2B2C(v6, v7);

  return v9;
}

- (void)clearInfoFor:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_1000B2F14((uint64_t)v5);
  swift_endAccess(v7);
}

@end
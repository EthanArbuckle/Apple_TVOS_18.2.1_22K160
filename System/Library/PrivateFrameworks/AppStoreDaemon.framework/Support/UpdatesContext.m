@interface UpdatesContext
- (BOOL)includeMetrics;
- (BOOL)isBackgroundRequest;
- (BOOL)isVPPLookup;
- (BOOL)shouldPerformUpdates;
- (BOOL)userInitiated;
- (NSNumber)bridgedTargetedItemID;
- (NSString)humanReadableReason;
- (XPCRequestToken)requestToken;
- (_TtC9appstored14UpdatesContext)init;
- (_TtC9appstored14UpdatesContext)initWithReason:(int64_t)a3;
- (_TtC9appstored14UpdatesContext)initWithReason:(int64_t)a3 requestToken:(id)a4 logKey:(id)a5 callbackHandler:(id)a6 includeMetrics:(BOOL)a7 isVPPLookup:(BOOL)a8 userInitiated:(BOOL)a9 targetedItemID:(id)a10;
- (_TtC9appstored6LogKey)logKey;
- (id)callbackHandler;
- (int64_t)reason;
@end

@implementation UpdatesContext

- (BOOL)includeMetrics
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC9appstored14UpdatesContext_includeMetrics);
}

- (BOOL)isVPPLookup
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC9appstored14UpdatesContext_isVPPLookup);
}

- (_TtC9appstored6LogKey)logKey
{
  return (_TtC9appstored6LogKey *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                          + OBJC_IVAR____TtC9appstored14UpdatesContext_logKey));
}

- (int64_t)reason
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored14UpdatesContext_reason);
}

- (XPCRequestToken)requestToken
{
  return (XPCRequestToken *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                    + OBJC_IVAR____TtC9appstored14UpdatesContext_requestToken));
}

- (BOOL)userInitiated
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC9appstored14UpdatesContext_userInitiated);
}

- (BOOL)isBackgroundRequest
{
  unint64_t v2 = *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored14UpdatesContext_reason);
  if (v2 >= 9)
  {
    uint64_t v5 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored14UpdatesContext_reason);
    type metadata accessor for LoadSoftwareUpdatesReason(0LL);
    uint64_t v7 = v6;
    uint64_t v10 = v5;
    v8 = self;
    LOBYTE(v3) = _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)(v7, &v10, v7, &type metadata for Int);
    __break(1u);
  }

  else
  {
    return (0xD6u >> v2) & 1;
  }

  return v3;
}

- (BOOL)shouldPerformUpdates
{
  unint64_t v2 = *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored14UpdatesContext_reason);
  if (v2 >= 9)
  {
    uint64_t v5 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored14UpdatesContext_reason);
    type metadata accessor for LoadSoftwareUpdatesReason(0LL);
    uint64_t v7 = v6;
    uint64_t v10 = v5;
    v8 = self;
    LOBYTE(v3) = _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)(v7, &v10, v7, &type metadata for Int);
    __break(1u);
  }

  else
  {
    return (0x46u >> v2) & 1;
  }

  return v3;
}

- (NSNumber)bridgedTargetedItemID
{
  if ((self->callbackHandler[OBJC_IVAR____TtC9appstored14UpdatesContext_targetedItemID] & 1) != 0) {
    id v2 = 0LL;
  }
  else {
    id v2 = [objc_allocWithZone(NSNumber) initWithLongLong:*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored14UpdatesContext_targetedItemID)];
  }
  return (NSNumber *)v2;
}

- (_TtC9appstored14UpdatesContext)init
{
  id v3 = objc_allocWithZone((Class)swift_getObjectType(self, a2));
  v4 = (_TtC9appstored14UpdatesContext *)sub_10006D4CC(0LL, 0LL, 0LL, 0LL, 0LL, 0, 0, 0, 0LL, 1);
  uint64_t ObjectType = swift_getObjectType(self, v5);
  swift_deallocPartialClassInstance(self, ObjectType, 73LL, 7LL);
  return v4;
}

- (_TtC9appstored14UpdatesContext)initWithReason:(int64_t)a3
{
  id v5 = objc_allocWithZone((Class)swift_getObjectType(self, a2));
  uint64_t v6 = (_TtC9appstored14UpdatesContext *)sub_10006D4CC(a3, 0LL, 0LL, 0LL, 0LL, 0, 0, 0, 0LL, 1);
  uint64_t ObjectType = swift_getObjectType(self, v7);
  swift_deallocPartialClassInstance(self, ObjectType, 73LL, 7LL);
  return v6;
}

- (_TtC9appstored14UpdatesContext)initWithReason:(int64_t)a3 requestToken:(id)a4 logKey:(id)a5 callbackHandler:(id)a6 includeMetrics:(BOOL)a7 isVPPLookup:(BOOL)a8 userInitiated:(BOOL)a9 targetedItemID:(id)a10
{
  v13 = _Block_copy(a6);
  if (v13)
  {
    uint64_t v14 = swift_allocObject(&unk_1003DF9D8, 24LL, 7LL);
    *(void *)(v14 + 16) = v13;
    v13 = sub_10006D84C;
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  id v15 = a4;
  id v16 = a5;
  id v17 = a10;
  v18 = (_TtC9appstored14UpdatesContext *)sub_10006D648(a3, a4, a5, (uint64_t)v13, v14, a7, a8, a9, a10);

  sub_10001527C((uint64_t)v13, v14);
  return v18;
}

- (id)callbackHandler
{
  id v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored14UpdatesContext_callbackHandler);
  if (v2)
  {
    uint64_t v3 = *(void *)&self->callbackHandler[OBJC_IVAR____TtC9appstored14UpdatesContext_callbackHandler];
    uint64_t v4 = swift_allocObject(&unk_1003DF988, 32LL, 7LL);
    *(void *)(v4 + 16) = v2;
    *(void *)(v4 + 24) = v3;
    v7[4] = sub_10006D110;
    uint64_t v8 = v4;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 1107296256LL;
    v7[2] = sub_10006CEEC;
    v7[3] = &unk_1003DF9A0;
    id v2 = _Block_copy(v7);
    uint64_t v5 = v8;
    swift_retain(v3);
    swift_release(v5);
  }

  return v2;
}

- (NSString)humanReadableReason
{
  id v2 = self;
  sub_10006C838();
  uint64_t v4 = v3;

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (void).cxx_destruct
{
}

@end
@interface FARateLimiter
- (BOOL)isAllowedWithClientName:(id)a3;
- (FARateLimiter)init;
- (FARateLimiter)initWithIdentifier:(id)a3;
- (FARateLimiter)initWithPersistence:(id)a3 identifier:(id)a4 getDate:(id)a5;
- (void)recordCallWithClientName:(id)a3;
@end

@implementation FARateLimiter

- (FARateLimiter)initWithPersistence:(id)a3 identifier:(id)a4 getDate:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v10 = v9;
  uint64_t v11 = swift_allocObject(&unk_100042868, 24LL, 7LL);
  *(void *)(v11 + 16) = v7;
  uint64_t v12 = swift_unknownObjectRetain(a3);
  v13 = (FARateLimiter *)sub_10002228C(v12, v8, v10, (uint64_t)sub_100022A60, v11);
  swift_unknownObjectRelease(a3);
  swift_release(v11);
  return v13;
}

- (FARateLimiter)initWithIdentifier:(id)a3
{
  uint64_t v5 = v4;
  id v6 = [(id)objc_opt_self(NSUserDefaults) standardUserDefaults];
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  v11[4] = &j___s10Foundation4DateV3nowACvgZ;
  v11[5] = 0LL;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256LL;
  v11[2] = sub_10001FA88;
  v11[3] = &unk_100042830;
  uint64_t v8 = _Block_copy(v11);
  uint64_t v9 = -[FARateLimiter initWithPersistence:identifier:getDate:]( self,  "initWithPersistence:identifier:getDate:",  v6,  v7,  v8);
  _Block_release(v8);

  return v9;
}

- (BOOL)isAllowedWithClientName:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  v9[2] = self;
  v9[3] = v4;
  v9[4] = v5;
  NSString v7 = self;
  OS_dispatch_queue.sync<A>(execute:)(&v10, sub_10002252C, v9, &type metadata for Bool);

  swift_bridgeObjectRelease(v6);
  return v10;
}

- (void)recordCallWithClientName:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  NSString v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  RateLimiter.recordCall(clientName:)(v8);

  swift_bridgeObjectRelease(v6);
}

- (FARateLimiter)init
{
  result = (FARateLimiter *)_swift_stdlib_reportUnimplementedInitializer( "familycircled.RateLimiter",  25LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(void *)&self->persistence[OBJC_IVAR___FARateLimiter_getDate]);
  swift_bridgeObjectRelease(*(void *)&self->persistence[OBJC_IVAR___FARateLimiter_identifier]);
}

@end
@interface JSAppDistributionObject
- (BOOL)isAppDistributionEligibleForCurrentDevice:(id)a3;
- (JSValue)distributorPriorityList;
- (_TtC19appstorecomponentsd23JSAppDistributionObject)init;
- (id)appAvailabilityWithDistributorToAppIds:(id)a3;
@end

@implementation JSAppDistributionObject

- (BOOL)isAppDistributionEligibleForCurrentDevice:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  Swift::Int v9 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10011F740, v8);
  if (!v9)
  {
    uint64_t v10 = 3LL;
    goto LABEL_5;
  }

  if (v9 == 1)
  {
    uint64_t v10 = 2LL;
LABEL_5:
    uint64_t v12 = 0LL;
    os_eligibility_get_domain_answer(v10, &v12, 0LL, 0LL, 0LL);

    swift_bridgeObjectRelease(v6);
    return v12 == 4;
  }

  swift_bridgeObjectRelease(v6);
  return 0;
}

- (JSValue)distributorPriorityList
{
  v3 = self;
  uint64_t v4 = (void *)static JSContext.requiredCurrent.getter();
  v7[2] = v3;
  v5 = (void *)JSContext.propagateErrorsToExceptions(_:)(sub_10009C148, v7);

  return (JSValue *)v5;
}

- (id)appAvailabilityWithDistributorToAppIds:(id)a3
{
  uint64_t v5 = sub_100029E18((uint64_t *)&unk_10013EF60);
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  v5,  &protocol witness table for String);
  sub_10009BB78();
  v7 = self;
  Swift::String v8 = (void *)static JSContext.requiredCurrent.getter();
  v11[2] = v7;
  v11[3] = v6;
  Swift::Int v9 = (void *)JSContext.propagateErrorsToExceptions(_:)(sub_10009BBB4, v11);

  swift_bridgeObjectRelease(v6);
  return v9;
}

- (_TtC19appstorecomponentsd23JSAppDistributionObject)init
{
  result = (_TtC19appstorecomponentsd23JSAppDistributionObject *)_swift_stdlib_reportUnimplementedInitializer( "appstorecomponentsd.JSAppDistributionObject",  43LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100029F4C((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC19appstorecomponentsd23JSAppDistributionObject_appDistribution));
}

@end
@interface String:
- (uint64_t)DMFPolicy;
- (uint64_t)NSNumber;
- (unint64_t)String;
- (void)Data;
@end

@implementation String:

- (uint64_t)DMFPolicy
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

- (uint64_t)NSNumber
{
  uint64_t v4 = a2;
  v6 = *(void (**)(uint64_t, void *))(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  if (a2)
  {
    uint64_t v7 = type metadata accessor for NSError( 0LL,  (unint64_t *)&lazy cache variable for type metadata for NSNumber,  &OBJC_CLASS___NSNumber_ptr);
    uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v4,  &type metadata for String,  v7,  &protocol witness table for String);
  }

  swift_retain(v5);
  id v8 = a3;
  v6(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease(v4);
}

- (unint64_t)String
{
  unint64_t result = OUTLINED_FUNCTION_156_1(a1);
  if (!result)
  {
    uint64_t v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : String]);
    unint64_t result = OUTLINED_FUNCTION_215_0(v3, v3);
    atomic_store(result, v1);
  }

  return result;
}

- (void)Data
{
  if (!OUTLINED_FUNCTION_156_1(a1))
  {
    OUTLINED_FUNCTION_159_0();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : Data]);
    v2();
    atomic_store(OUTLINED_FUNCTION_216_1(), v1);
  }

  OUTLINED_FUNCTION_5_30();
}

@end
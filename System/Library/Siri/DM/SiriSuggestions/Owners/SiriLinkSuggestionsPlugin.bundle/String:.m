@interface String:
- (uint64_t)ActionParameter;
- (uint64_t)NSNumber;
- (uint64_t)String;
@end

@implementation String:

- (uint64_t)String
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

- (uint64_t)NSNumber
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3) {
    return specialized _resumeUnsafeThrowingContinuationWithError<A>(_:_:)(v3, (uint64_t)a3);
  }
  uint64_t v6 = type metadata accessor for LNActionParameterMetadata( 0LL,  &lazy cache variable for type metadata for NSNumber,  &OBJC_CLASS___NSNumber_ptr);
  uint64_t v7 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a2,  &type metadata for String,  v6,  &protocol witness table for String);
  return specialized _resumeUnsafeThrowingContinuation<A>(_:_:)(v3, v7);
}

- (uint64_t)ActionParameter
{
  if ((a3 & 1) != 0) {
    return swift_bridgeObjectRelease(result);
  }
  return result;
}

@end
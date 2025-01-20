@interface IDSURI:
- (uint64_t)IDSOffGridDeliveryQueryResult;
- (uint64_t)NSNumber;
@end

@implementation IDSURI:

- (uint64_t)NSNumber
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

- (uint64_t)IDSOffGridDeliveryQueryResult
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    uint64_t v6 = swift_allocError(v5, &protocol self-conformance witness table for Error, 0LL, 0LL);
    void *v7 = a3;
    id v8 = a3;
    return swift_continuation_throwingResumeWithError(v3, v6);
  }

  else
  {
    uint64_t v11 = type metadata accessor for IMDHandle( 0LL,  &lazy cache variable for type metadata for IDSURI,  &OBJC_CLASS___IDSURI_ptr);
    uint64_t v12 = type metadata accessor for IMDHandle( 0LL,  &lazy cache variable for type metadata for IDSOffGridDeliveryQueryResult,  &OBJC_CLASS___IDSOffGridDeliveryQueryResult_ptr);
    unint64_t v13 = lazy protocol witness table accessor for type IDSURI and conformance NSObject();
    **(void **)(*(void *)(v3 + 64) + 40LL) = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a2,  v11,  v12,  v13);
    return swift_continuation_throwingResume(v3);
  }

@end
@interface WFContentItemListThumbnailOption:
- (uint64_t)Any;
@end

@implementation WFContentItemListThumbnailOption:

- (uint64_t)Any
{
  uint64_t v3 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (a3)
  {
    type metadata accessor for WFContentItemListThumbnailOption(0LL);
    uint64_t v7 = v6;
    uint64_t v8 = lazy protocol witness table accessor for type WFChooseFromListFlow and conformance WFChooseFromListFlow( &lazy protocol witness table cache variable for type WFContentItemListThumbnailOption and conformance WFContentItemListThumbnailOption,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for WFContentItemListThumbnailOption,  (uint64_t)&protocol conformance descriptor for WFContentItemListThumbnailOption);
    uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v3, v7, (char *)&type metadata for Any + 8, v8);
  }

  id v9 = a2;
  return specialized _resumeUnsafeContinuation<A>(_:_:)(v5, (uint64_t)a2, v3);
}

@end
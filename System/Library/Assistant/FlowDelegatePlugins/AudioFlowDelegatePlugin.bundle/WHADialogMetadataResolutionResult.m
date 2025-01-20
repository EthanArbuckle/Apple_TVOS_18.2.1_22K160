@interface WHADialogMetadataResolutionResult
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)confirmationRequiredWithWHADialogMetadataToConfirm:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)disambiguationWithWHADialogMetadatasToDisambiguate:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
+ (id)successWithResolvedWHADialogMetadata:(id)a3;
- (WHADialogMetadataResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation WHADialogMetadataResolutionResult

+ (id)successWithResolvedWHADialogMetadata:(id)a3
{
  id v4 = a3;
  id v5 = static WHADialogMetadataResolutionResult.success(with:)((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithWHADialogMetadatasToDisambiguate:(id)a3
{
  uint64_t v5 = type metadata accessor for WHADialogMetadata();
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  swift_getObjCClassMetadata(a1);
  id v7 = static WHADialogMetadataResolutionResult.disambiguation(with:)(v6);
  swift_bridgeObjectRelease(v6);
  return v7;
}

+ (id)confirmationRequiredWithWHADialogMetadataToConfirm:(id)a3
{
  id v4 = a3;
  id v5 = static WHADialogMetadataResolutionResult.confirmationRequired(with:)((uint64_t)a3);

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  id result = (id)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0LL,  0xE000000000000000LL,  "AudioFlowDelegatePlugin/WHADialogMetadata.swift",  47LL,  2LL,  98LL,  0);
  __break(1u);
  return result;
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  id result = (id)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0LL,  0xE000000000000000LL,  "AudioFlowDelegatePlugin/WHADialogMetadata.swift",  47LL,  2LL,  103LL,  0);
  __break(1u);
  return result;
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  id result = (id)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0LL,  0xE000000000000000LL,  "AudioFlowDelegatePlugin/WHADialogMetadata.swift",  47LL,  2LL,  108LL,  0);
  __break(1u);
  return result;
}

- (WHADialogMetadataResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  id v7 = a4;
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for WHADialogMetadataResolutionResult();
  v9 = -[WHADialogMetadataResolutionResult initWithJSONDictionary:forIntent:]( &v12,  "initWithJSONDictionary:forIntent:",  isa,  v7);

  v10 = v9;
  if (v10) {

  }
  return v10;
}

@end
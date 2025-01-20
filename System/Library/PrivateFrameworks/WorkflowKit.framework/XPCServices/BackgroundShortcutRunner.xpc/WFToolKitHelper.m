@interface WFToolKitHelper
+ (id)createActionFromEncodedToolInvocation:(id)a3 error:(id *)a4;
+ (id)decodeContentPropertyPossibleValuesDefinition:(id)a3 error:(id *)a4;
+ (id)decodeDynamicEnumerationDefinition:(id)a3 error:(id *)a4;
+ (id)decodeSearchStringInEncodedQuery:(id)a3 error:(id *)a4;
+ (id)produceVariableFromEncodedReference:(id)a3 error:(id *)a4;
+ (int64_t)valueSetTypeForDefinition:(id)a3;
+ (void)fetchToolInvocationSummaryForInvocation:(NSData *)a3 variableSource:(WFVariableDataSource *)a4 completionBlock:(id)a5;
+ (void)produceEncodedTypedPossibleValuesForContentProperty:(WFContentProperty *)a3 completionBlock:(id)a4;
+ (void)produceEncodedTypedValueFromCollection:(WFContentCollection *)a3 forEncodedExpectedType:(NSData *)a4 completionBlock:(id)a5;
+ (void)produceEncodedTypedValuesFromPossibleStates:(NSArray *)a3 ofParameter:(WFParameter *)a4 inAction:(WFAction *)a5 completionBlock:(id)a6;
+ (void)resolveDeferredValueForEncodedStorage:(NSData *)a3 encodedExpectedType:(NSData *)a4 completionBlock:(id)a5;
+ (void)runLinkQuery:(NSData *)a3 valueSet:(NSData *)a4 completionBlock:(id)a5;
- (WFToolKitHelper)init;
@end

@implementation WFToolKitHelper

+ (id)createActionFromEncodedToolInvocation:(id)a3 error:(id *)a4
{
  return sub_100049240( (uint64_t)a1,  (uint64_t)a2,  a3,  (uint64_t)a4,  (uint64_t (*)(uint64_t, uint64_t))static ToolKitHelper.createAction(encodedToolInvocation:));
}

+ (id)produceVariableFromEncodedReference:(id)a3 error:(id *)a4
{
  return sub_100049240( (uint64_t)a1,  (uint64_t)a2,  a3,  (uint64_t)a4,  (uint64_t (*)(uint64_t, uint64_t))static ToolKitHelper.produceVariable(encodedReference:));
}

+ (int64_t)valueSetTypeForDefinition:(id)a3
{
  id v4 = a3;
  uint64_t v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v7 = v6;

  int64_t v8 = static ToolKitHelper.decodeValueSetType(encodedDefinition:)(v5, v7);
  sub_10003FCFC(v5, v7);
  return v8;
}

+ (id)decodeDynamicEnumerationDefinition:(id)a3 error:(id *)a4
{
  return sub_100049240( (uint64_t)a1,  (uint64_t)a2,  a3,  (uint64_t)a4,  (uint64_t (*)(uint64_t, uint64_t))static ToolKitHelper.decodeDynamicEnumerationDefinition(encodedDefinition:));
}

+ (id)decodeContentPropertyPossibleValuesDefinition:(id)a3 error:(id *)a4
{
  return sub_100049240( (uint64_t)a1,  (uint64_t)a2,  a3,  (uint64_t)a4,  (uint64_t (*)(uint64_t, uint64_t))static ToolKitHelper.decodeContentPropertyPossibleValuesDefinition(encodedDefinition:));
}

+ (void)runLinkQuery:(NSData *)a3 valueSet:(NSData *)a4 completionBlock:(id)a5
{
  int64_t v8 = _Block_copy(a5);
  v9 = (void *)swift_allocObject(&unk_100066E38, 48LL, 7LL);
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = a1;
  v10 = a3;
  v11 = a4;
  sub_100047AE8();
}

+ (id)decodeSearchStringInEncodedQuery:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v8 = v7;

  static ToolKitHelper.decodeSearchString(in:)(v6, v8);
  uint64_t v10 = v9;
  sub_10003FCFC(v6, v8);
  NSString v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v10);
  return v11;
}

+ (void)produceEncodedTypedValueFromCollection:(WFContentCollection *)a3 forEncodedExpectedType:(NSData *)a4 completionBlock:(id)a5
{
}

+ (void)produceEncodedTypedPossibleValuesForContentProperty:(WFContentProperty *)a3 completionBlock:(id)a4
{
}

+ (void)produceEncodedTypedValuesFromPossibleStates:(NSArray *)a3 ofParameter:(WFParameter *)a4 inAction:(WFAction *)a5 completionBlock:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  NSString v11 = (void *)swift_allocObject(&unk_100066DC0, 56LL, 7LL);
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = a1;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  sub_100047AE8();
}

+ (void)resolveDeferredValueForEncodedStorage:(NSData *)a3 encodedExpectedType:(NSData *)a4 completionBlock:(id)a5
{
}

+ (void)fetchToolInvocationSummaryForInvocation:(NSData *)a3 variableSource:(WFVariableDataSource *)a4 completionBlock:(id)a5
{
  unint64_t v8 = _Block_copy(a5);
  uint64_t v9 = (void *)swift_allocObject(&unk_100066CD0, 48LL, 7LL);
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = a1;
  uint64_t v10 = a3;
  swift_unknownObjectRetain(a4);
  sub_100047AE8();
}

- (WFToolKitHelper)init
{
  return (WFToolKitHelper *)ToolKitHelper.init()();
}

@end
@interface LACEvaluationRequestProcessorFactory
+ (id)makeProcessorWithSubprocessors:(id)a3;
@end

@implementation LACEvaluationRequestProcessorFactory

+ (id)makeProcessorWithSubprocessors:(id)a3
{
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = (objc_class *)type metadata accessor for LACEvaluationRequestCompoundProcessor();
  v5 = (char *)objc_allocWithZone(v4);
  *(void *)&v5[OBJC_IVAR____TtC23LocalAuthenticationCore37LACEvaluationRequestCompoundProcessor_nextProcessor] = 0LL;
  v6 = &v5[OBJC_IVAR____TtC23LocalAuthenticationCore37LACEvaluationRequestCompoundProcessor_currentProcessorIndex];
  *(void *)v6 = 0LL;
  v6[8] = 1;
  *(void *)&v5[OBJC_IVAR____TtC23LocalAuthenticationCore37LACEvaluationRequestCompoundProcessor_involvedProcessorIndices] = MEMORY[0x18961AFE8];
  *(void *)&v5[OBJC_IVAR____TtC23LocalAuthenticationCore37LACEvaluationRequestCompoundProcessor_processors] = v3;
  v9.receiver = v5;
  v9.super_class = v4;
  swift_bridgeObjectRetain();
  id v7 = objc_msgSendSuper2(&v9, sel_init);
  swift_bridgeObjectRelease();
  return v7;
}

@end
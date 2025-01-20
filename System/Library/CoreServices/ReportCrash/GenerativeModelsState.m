@interface GenerativeModelsState
+ (id)getGMAvailability;
- (_TtC11ReportCrash21GenerativeModelsState)init;
@end

@implementation GenerativeModelsState

- (_TtC11ReportCrash21GenerativeModelsState)init
{
  return (_TtC11ReportCrash21GenerativeModelsState *)GenerativeModelsState.init()();
}

+ (id)getGMAvailability
{
  unint64_t v2 = _s11ReportCrash21GenerativeModelsStateC17getGMAvailabilitySDySSypGyFZ_0();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return isa;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC11ReportCrash21GenerativeModelsState_reasons));
}

@end
@interface MRIRRouteRecommendationContext
+ (id)fromObject:(id)a3;
- (MRIRRouteRecommendationContext)init;
- (MRIRRouteRecommendationContext)initWithCandidateResults:(id)a3 contextIdentifier:(id)a4;
- (NSSet)candidateResults;
- (NSString)contextIdentifier;
- (NSString)description;
- (void)setCandidateResults:(id)a3;
- (void)setContextIdentifier:(id)a3;
@end

@implementation MRIRRouteRecommendationContext

- (NSSet)candidateResults
{
  return (NSSet *)sub_1002A5D5C( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR___MRIRRouteRecommendationContext_candidateResults,  (void (*)(__n128))type metadata accessor for RouteRecommendationCandidateResult,  &qword_1003FD840);
}

- (void)setCandidateResults:(id)a3
{
}

- (NSString)contextIdentifier
{
  return (NSString *)sub_10021FBE0( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR___MRIRRouteRecommendationContext_contextIdentifier);
}

- (void)setContextIdentifier:(id)a3
{
}

+ (id)fromObject:(id)a3
{
  id v3 = a3;
  v4 = (void *)sub_1002A737C(v3);

  return v4;
}

- (MRIRRouteRecommendationContext)initWithCandidateResults:(id)a3 contextIdentifier:(id)a4
{
  uint64_t v7 = type metadata accessor for RouteRecommendationCandidateResult();
  uint64_t v8 = sub_1002A869C( &qword_1003FD840,  type metadata accessor for RouteRecommendationCandidateResult,  (uint64_t)&protocol conformance descriptor for NSObject);
  v9 = (objc_class *)static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRIRRouteRecommendationContext_candidateResults) = v9;
  v11 = (uint64_t *)((char *)self + OBJC_IVAR___MRIRRouteRecommendationContext_contextIdentifier);
  uint64_t *v11 = v10;
  v11[1] = v12;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for RouteRecommendationContext();
  return -[MRIRRouteRecommendationContext init](&v14, "init");
}

- (NSString)description
{
  return (NSString *)sub_1002A551C( self,  (uint64_t)a2,  type metadata accessor for RouteRecommendationContext,  &qword_1003FD630,  (uint64_t)&unk_100351440);
}

- (MRIRRouteRecommendationContext)init
{
  result = (MRIRRouteRecommendationContext *)_swift_stdlib_reportUnimplementedInitializer( "mediaremoted.RouteRecommendationContext",  39LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___MRIRRouteRecommendationContext_candidateResults));
  swift_bridgeObjectRelease(*(void *)&self->candidateResults[OBJC_IVAR___MRIRRouteRecommendationContext_contextIdentifier]);
}

@end
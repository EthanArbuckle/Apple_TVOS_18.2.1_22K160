@interface MRIRRouteRecommendationCandidate
- (MRIRRouteRecommendationCandidate)init;
- (NSSet)nodes;
- (NSString)candidateIdentifier;
- (void)setCandidateIdentifier:(id)a3;
- (void)setNodes:(id)a3;
@end

@implementation MRIRRouteRecommendationCandidate

- (NSString)candidateIdentifier
{
  return (NSString *)sub_10021FBE0( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR___MRIRRouteRecommendationCandidate_candidateIdentifier);
}

- (void)setCandidateIdentifier:(id)a3
{
}

- (NSSet)nodes
{
  return (NSSet *)sub_1002A5D5C( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR___MRIRRouteRecommendationCandidate_nodes,  (void (*)(__n128))type metadata accessor for RouteRecommendationNode,  &qword_1003FD838);
}

- (void)setNodes:(id)a3
{
}

- (MRIRRouteRecommendationCandidate)init
{
  result = (MRIRRouteRecommendationCandidate *)_swift_stdlib_reportUnimplementedInitializer( "mediaremoted.RouteRecommendationCandidate",  41LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
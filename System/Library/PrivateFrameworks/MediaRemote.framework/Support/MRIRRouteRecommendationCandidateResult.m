@interface MRIRRouteRecommendationCandidateResult
- (BOOL)isCallToAction;
- (BOOL)isConservativeFiltered;
- (BOOL)isLockScreenControl;
- (MRIRRouteRecommendationCandidate)candidate;
- (MRIRRouteRecommendationCandidateResult)init;
- (MRIRRouteRecommendationCandidateResult)initWithClassification:(int64_t)a3 classificationDescription:(id)a4 candidate:(id)a5 sortingHint:(id)a6 isCallToAction:(BOOL)a7 isLockScreenControl:(BOOL)a8 isConservativeFiltered:(BOOL)a9;
- (NSNumber)sortingHint;
- (NSString)classificationDescription;
- (NSString)description;
- (int64_t)classification;
- (void)setCandidate:(id)a3;
- (void)setClassification:(int64_t)a3;
- (void)setClassificationDescription:(id)a3;
- (void)setIsCallToAction:(BOOL)a3;
- (void)setIsConservativeFiltered:(BOOL)a3;
- (void)setIsLockScreenControl:(BOOL)a3;
- (void)setSortingHint:(id)a3;
@end

@implementation MRIRRouteRecommendationCandidateResult

- (int64_t)classification
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___MRIRRouteRecommendationCandidateResult_classification);
  swift_beginAccess((char *)self + OBJC_IVAR___MRIRRouteRecommendationCandidateResult_classification, v4, 0LL, 0LL);
  return *v2;
}

- (void)setClassification:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___MRIRRouteRecommendationCandidateResult_classification);
  swift_beginAccess((char *)self + OBJC_IVAR___MRIRRouteRecommendationCandidateResult_classification, v5, 1LL, 0LL);
  int64_t *v4 = a3;
}

- (NSString)classificationDescription
{
  return (NSString *)sub_1002A6664( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR___MRIRRouteRecommendationCandidateResult_classificationDescription);
}

- (void)setClassificationDescription:(id)a3
{
}

- (MRIRRouteRecommendationCandidate)candidate
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___MRIRRouteRecommendationCandidateResult_candidate);
  swift_beginAccess((char *)self + OBJC_IVAR___MRIRRouteRecommendationCandidateResult_candidate, v4, 0LL, 0LL);
  return (MRIRRouteRecommendationCandidate *)*v2;
}

- (void)setCandidate:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___MRIRRouteRecommendationCandidateResult_candidate);
  swift_beginAccess((char *)self + OBJC_IVAR___MRIRRouteRecommendationCandidateResult_candidate, v7, 1LL, 0LL);
  v5 = *v4;
  int64_t *v4 = a3;
  id v6 = a3;
}

- (NSNumber)sortingHint
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___MRIRRouteRecommendationCandidateResult_sortingHint);
  swift_beginAccess((char *)self + OBJC_IVAR___MRIRRouteRecommendationCandidateResult_sortingHint, v4, 0LL, 0LL);
  return (NSNumber *)*v2;
}

- (void)setSortingHint:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___MRIRRouteRecommendationCandidateResult_sortingHint);
  swift_beginAccess((char *)self + OBJC_IVAR___MRIRRouteRecommendationCandidateResult_sortingHint, v7, 1LL, 0LL);
  v5 = *v4;
  int64_t *v4 = a3;
  id v6 = a3;
}

- (BOOL)isCallToAction
{
  v2 = (BOOL *)self + OBJC_IVAR___MRIRRouteRecommendationCandidateResult_isCallToAction;
  swift_beginAccess((char *)self + OBJC_IVAR___MRIRRouteRecommendationCandidateResult_isCallToAction, v4, 0LL, 0LL);
  return *v2;
}

- (void)setIsCallToAction:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___MRIRRouteRecommendationCandidateResult_isCallToAction;
  swift_beginAccess((char *)self + OBJC_IVAR___MRIRRouteRecommendationCandidateResult_isCallToAction, v5, 1LL, 0LL);
  BOOL *v4 = a3;
}

- (BOOL)isLockScreenControl
{
  v2 = (BOOL *)self + OBJC_IVAR___MRIRRouteRecommendationCandidateResult_isLockScreenControl;
  swift_beginAccess((char *)self + OBJC_IVAR___MRIRRouteRecommendationCandidateResult_isLockScreenControl, v4, 0LL, 0LL);
  return *v2;
}

- (void)setIsLockScreenControl:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___MRIRRouteRecommendationCandidateResult_isLockScreenControl;
  swift_beginAccess((char *)self + OBJC_IVAR___MRIRRouteRecommendationCandidateResult_isLockScreenControl, v5, 1LL, 0LL);
  BOOL *v4 = a3;
}

- (BOOL)isConservativeFiltered
{
  v2 = (BOOL *)self + OBJC_IVAR___MRIRRouteRecommendationCandidateResult_isConservativeFiltered;
  swift_beginAccess( (char *)self + OBJC_IVAR___MRIRRouteRecommendationCandidateResult_isConservativeFiltered,  v4,  0LL,  0LL);
  return *v2;
}

- (void)setIsConservativeFiltered:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___MRIRRouteRecommendationCandidateResult_isConservativeFiltered;
  swift_beginAccess( (char *)self + OBJC_IVAR___MRIRRouteRecommendationCandidateResult_isConservativeFiltered,  v5,  1LL,  0LL);
  BOOL *v4 = a3;
}

- (MRIRRouteRecommendationCandidateResult)initWithClassification:(int64_t)a3 classificationDescription:(id)a4 candidate:(id)a5 sortingHint:(id)a6 isCallToAction:(BOOL)a7 isLockScreenControl:(BOOL)a8 isConservativeFiltered:(BOOL)a9
{
  if (a4)
  {
    uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    uint64_t v16 = v15;
  }

  else
  {
    uint64_t v14 = 0LL;
    uint64_t v16 = 0LL;
  }

  id v17 = a5;
  id v18 = a6;
  v19 = (MRIRRouteRecommendationCandidateResult *)sub_1002A7A5C(a3, v14, v16, v17, a6, a7, a8, a9);

  return v19;
}

- (NSString)description
{
  return (NSString *)sub_1002A551C( self,  (uint64_t)a2,  type metadata accessor for RouteRecommendationCandidateResult,  &qword_1003FD648,  (uint64_t)&unk_100351598);
}

- (MRIRRouteRecommendationCandidateResult)init
{
  result = (MRIRRouteRecommendationCandidateResult *)_swift_stdlib_reportUnimplementedInitializer( "mediaremoted.RouteRecommendationCandidateResult",  47LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
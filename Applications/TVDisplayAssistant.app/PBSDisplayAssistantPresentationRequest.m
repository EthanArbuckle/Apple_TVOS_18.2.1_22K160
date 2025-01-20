@interface PBSDisplayAssistantPresentationRequest
- (int64_t)tvda_aggregatorKind;
@end

@implementation PBSDisplayAssistantPresentationRequest

- (int64_t)tvda_aggregatorKind
{
  BOOL v5 = 1;
  if (-[PBSDisplayAssistantPresentationRequest kind](self, "kind") != (id)2) {
    BOOL v5 = -[PBSDisplayAssistantPresentationRequest kind](self, "kind") == (id)1;
  }
  int64_t v6 = 0LL;
  if (!-[PBSDisplayAssistantPresentationRequest source](self, "source") && v5) {
    return 1LL;
  }
  if (-[PBSDisplayAssistantPresentationRequest source](self, "source") == (id)1 && v5) {
    return 2LL;
  }
  id v3 = -[PBSDisplayAssistantPresentationRequest destinationDisplayMode](self, "destinationDisplayMode");
  unsigned __int8 v4 = [v3 isAboveBandwidthThreshold];

  if ((v4 & 1) != 0) {
    return 3LL;
  }
  return v6;
}

@end
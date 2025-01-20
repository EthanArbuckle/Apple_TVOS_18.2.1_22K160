@interface MRIRRouteRecommendationNode
- (BOOL)isLocal;
- (MRIRRouteRecommendationNode)init;
- (NSString)avOutpuDeviceIdentifier;
- (NSString)avOutputDeviceIdentifier;
- (NSString)idsIdentifier;
- (NSString)rapportIdentifier;
- (void)setAvOutpuDeviceIdentifier:(id)a3;
- (void)setAvOutputDeviceIdentifier:(id)a3;
- (void)setIdsIdentifier:(id)a3;
- (void)setIsLocal:(BOOL)a3;
- (void)setRapportIdentifier:(id)a3;
@end

@implementation MRIRRouteRecommendationNode

- (NSString)avOutputDeviceIdentifier
{
  return (NSString *)sub_1002A6664( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR___MRIRRouteRecommendationNode_avOutputDeviceIdentifier);
}

- (void)setAvOutputDeviceIdentifier:(id)a3
{
}

- (NSString)rapportIdentifier
{
  return (NSString *)sub_1002A6664( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR___MRIRRouteRecommendationNode_rapportIdentifier);
}

- (void)setRapportIdentifier:(id)a3
{
}

- (NSString)idsIdentifier
{
  return (NSString *)sub_1002A6664((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___MRIRRouteRecommendationNode_idsIdentifier);
}

- (void)setIdsIdentifier:(id)a3
{
}

- (BOOL)isLocal
{
  v2 = (BOOL *)self + OBJC_IVAR___MRIRRouteRecommendationNode_isLocal;
  swift_beginAccess((char *)self + OBJC_IVAR___MRIRRouteRecommendationNode_isLocal, v4, 0LL, 0LL);
  return *v2;
}

- (void)setIsLocal:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___MRIRRouteRecommendationNode_isLocal;
  swift_beginAccess((char *)self + OBJC_IVAR___MRIRRouteRecommendationNode_isLocal, v5, 1LL, 0LL);
  BOOL *v4 = a3;
}

- (NSString)avOutpuDeviceIdentifier
{
  v2 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x70);
  v3 = self;
  v2();
  uint64_t v5 = v4;

  if (v5)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }

  else
  {
    NSString v6 = 0LL;
  }

  return (NSString *)v6;
}

- (void)setAvOutpuDeviceIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v6 = v5;
  }

  else
  {
    uint64_t v4 = 0LL;
    uint64_t v6 = 0LL;
  }

  v7 = *(void (**)(uint64_t, uint64_t))((swift_isaMask & (uint64_t)self->super.isa) + 0x78);
  v8 = self;
  v7(v4, v6);
}

- (MRIRRouteRecommendationNode)init
{
  result = (MRIRRouteRecommendationNode *)_swift_stdlib_reportUnimplementedInitializer( "mediaremoted.RouteRecommendationNode",  36LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
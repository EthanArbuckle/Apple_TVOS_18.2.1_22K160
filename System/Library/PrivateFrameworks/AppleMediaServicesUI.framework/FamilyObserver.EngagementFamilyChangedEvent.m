@interface FamilyObserver.EngagementFamilyChangedEvent
- (NSDictionary)engagementData;
- (_TtCC14amsengagementd14FamilyObserverP33_5AC962C082A44D0E9D412F22116DFDED28EngagementFamilyChangedEvent)init;
@end

@implementation FamilyObserver.EngagementFamilyChangedEvent

- (NSDictionary)engagementData
{
  v2 = self;
  uint64_t v3 = sub_100070488();

  if (v3)
  {
    v4.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }

  else
  {
    v4.super.isa = 0LL;
  }

  return (NSDictionary *)v4.super.isa;
}

- (_TtCC14amsengagementd14FamilyObserverP33_5AC962C082A44D0E9D412F22116DFDED28EngagementFamilyChangedEvent)init
{
  return (_TtCC14amsengagementd14FamilyObserverP33_5AC962C082A44D0E9D412F22116DFDED28EngagementFamilyChangedEvent *)sub_100070554();
}

@end
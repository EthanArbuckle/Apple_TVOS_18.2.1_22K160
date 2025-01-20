@interface AUAClockSelectorControl
- (BOOL)changeValues:(const unsigned int *)a3 withCount:(int64_t)a4;
- (_TtC9AUASDCore23AUAClockSelectorControl)initWithIsSettable:(BOOL)a3 forElement:(unsigned int)a4 inScope:(unsigned int)a5 withPlugin:(id)a6 andObjectClassID:(unsigned int)a7;
- (void)selectionDidChange:(id)a3;
@end

@implementation AUAClockSelectorControl

- (BOOL)changeValues:(const unsigned int *)a3 withCount:(int64_t)a4
{
  return -[AUAClockSelectorControl setSelectedValues:withCount:]( self,  "setSelectedValues:withCount:",  a3,  a4);
}

- (void)selectionDidChange:(id)a3
{
  if (a3)
  {
    unint64_t v5 = sub_100028AD0();
    v6 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  }

  else
  {
    v6 = 0LL;
  }

  v7 = self;
  v8.value._rawValue = v6;
  AUAClockSelectorControl.selectionDidChange(_:)(v8);

  swift_bridgeObjectRelease(v6);
}

- (_TtC9AUASDCore23AUAClockSelectorControl)initWithIsSettable:(BOOL)a3 forElement:(unsigned int)a4 inScope:(unsigned int)a5 withPlugin:(id)a6 andObjectClassID:(unsigned int)a7
{
  id v7 = a6;
  result = (_TtC9AUASDCore23AUAClockSelectorControl *)_swift_stdlib_reportUnimplementedInitializer( "AUASDCore.AUAClockSelectorControl",  33LL,  "init(isSettable:forElement:inScope:with:andObjectClassID:)",  58LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
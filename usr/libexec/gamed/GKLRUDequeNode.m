@interface GKLRUDequeNode
- (NSObject)key;
- (_TtC14GameDaemonCoreP33_99CD75528634227EFA44F2FA82BB26BA14GKLRUDequeNode)initWithKey:(id)a3 value:(id)a4;
- (id)value;
- (void)setValue:(id)a3;
@end

@implementation GKLRUDequeNode

- (NSObject)key
{
  return AnyHashable._bridgeToObjectiveC()().isa;
}

- (id)value
{
  value = self->value;
  swift_beginAccess(self->value, v7, 0LL, 0LL);
  sub_100129604((uint64_t)value, (uint64_t)v8);
  uint64_t v3 = v9;
  v4 = sub_10012A960(v8, v9);
  v5 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v4, v3);
  sub_100129678(v8);
  return v5;
}

- (void)setValue:(id)a3
{
}

- (_TtC14GameDaemonCoreP33_99CD75528634227EFA44F2FA82BB26BA14GKLRUDequeNode)initWithKey:(id)a3 value:(id)a4
{
  uint64_t v5 = swift_unknownObjectRetain(a4);
  _bridgeAnyObjectToAny(_:)(v7, v5);
  swift_unknownObjectRelease(a4);
  return (_TtC14GameDaemonCoreP33_99CD75528634227EFA44F2FA82BB26BA14GKLRUDequeNode *)sub_1001297EC((uint64_t)v8, v7);
}

@end
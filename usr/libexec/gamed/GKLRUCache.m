@interface GKLRUCache
- (_TtC14GameDaemonCore10GKLRUCache)init;
- (_TtC14GameDaemonCore10GKLRUCache)initWithCapacity:(int64_t)a3;
- (id)getValueForKey:(id)a3;
- (void)clear;
- (void)insertValue:(id)a3 forKey:(id)a4;
@end

@implementation GKLRUCache

- (_TtC14GameDaemonCore10GKLRUCache)initWithCapacity:(int64_t)a3
{
  return (_TtC14GameDaemonCore10GKLRUCache *)GKLRUCache.init(capacity:)(a3);
}

- (void)clear
{
  v2 = self;
  GKLRUCache.clear()();
}

- (void)insertValue:(id)a3 forKey:(id)a4
{
  id v7 = a4;
  v8 = self;
  _bridgeAnyObjectToAny(_:)(v11, a3);
  swift_unknownObjectRelease(a3);
  static AnyHashable._unconditionallyBridgeFromObjectiveC(_:)(v10, v7, v9);

  GKLRUCache.insertValue(_:forKey:)((uint64_t)v11, (uint64_t)v10);
  sub_10012A92C((uint64_t)v10);
  sub_100129678(v11);
}

- (id)getValueForKey:(id)a3
{
  v4 = self;
  GKLRUCache.getValue(forKey:)((uint64_t)v13);

  sub_10012A92C((uint64_t)v13);
  uint64_t v5 = v15;
  if (!v15) {
    return 0LL;
  }
  v6 = sub_10012A960(v14, v15);
  uint64_t v7 = *(void *)(v5 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v13[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *))(v7 + 16))(v9);
  v10 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v9, v5);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
  sub_100129678(v14);
  return v10;
}

- (_TtC14GameDaemonCore10GKLRUCache)init
{
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14GameDaemonCore10GKLRUCache_mostRecentNode));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14GameDaemonCore10GKLRUCache_leastRecentNode));
  swift_bridgeObjectRelease( *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14GameDaemonCore10GKLRUCache_cache),  v3);
}

@end
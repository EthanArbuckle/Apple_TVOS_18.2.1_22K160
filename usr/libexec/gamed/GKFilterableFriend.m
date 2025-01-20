@interface GKFilterableFriend
- (BOOL)friendBiDirectional;
- (BOOL)friendPlayedWith;
- (NSString)playerID;
- (_TtC14GameDaemonCore18GKFilterableFriend)init;
- (_TtC14GameDaemonCore18GKFilterableFriend)initWithCacheObject:(id)a3;
- (_TtC14GameDaemonCore18GKFilterableFriend)initWithPlayerID:(id)a3 friendBiDirectional:(BOOL)a4 friendPlayedWith:(BOOL)a5;
@end

@implementation GKFilterableFriend

- (NSString)playerID
{
  uint64_t v3 = v2;
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3, v5);
  return (NSString *)v4;
}

- (BOOL)friendBiDirectional
{
  return sub_100128744() & 1;
}

- (BOOL)friendPlayedWith
{
  return sub_100128778() & 1;
}

- (_TtC14GameDaemonCore18GKFilterableFriend)initWithPlayerID:(id)a3 friendBiDirectional:(BOOL)a4 friendPlayedWith:(BOOL)a5
{
  return (_TtC14GameDaemonCore18GKFilterableFriend *)sub_1001287D0();
}

- (_TtC14GameDaemonCore18GKFilterableFriend)initWithCacheObject:(id)a3
{
  return (_TtC14GameDaemonCore18GKFilterableFriend *)sub_100128888(a3);
}

- (_TtC14GameDaemonCore18GKFilterableFriend)init
{
}

- (void).cxx_destruct
{
}

@end
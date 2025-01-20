@interface NowPlayingIntentInfo
+ (BOOL)supportsSecureCoding;
- (NowPlayingIntentInfo)initWithCoder:(id)a3;
- (NowPlayingIntentInfo)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
@end

@implementation NowPlayingIntentInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NowPlayingIntentInfo)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3)
  {
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v9 = v8;
  }

  else
  {
    uint64_t v7 = 0LL;
    uint64_t v9 = 0LL;
  }

  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v12 = v11;
  if (a5)
  {
    uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    uint64_t v15 = v14;
  }

  else
  {
    uint64_t v13 = 0LL;
    uint64_t v15 = 0LL;
  }

  return (NowPlayingIntentInfo *)NowPlayingIntentInfo.init(identifier:display:pronunciationHint:)( v7,  v9,  v10,  v12,  v13,  v15);
}

- (NowPlayingIntentInfo)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NowPlayingIntentInfo();
  return -[NowPlayingIntentInfo initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
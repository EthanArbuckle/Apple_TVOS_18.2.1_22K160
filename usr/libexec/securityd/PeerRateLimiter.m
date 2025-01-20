@interface PeerRateLimiter
- (NSMutableDictionary)accessGroupRateLimitState;
- (NSMutableDictionary)accessGroupToNextMessageToSend;
- (NSMutableDictionary)accessGroupToTimer;
- (NSString)peerID;
- (PeerRateLimiter)initWithPeer:(__OpaqueSOSPeer *)a3;
- (id)setUpConfigForPeer;
- (int)stateForAccessGroup:(id)a3;
- (void)setAccessGroupRateLimitState:(id)a3;
- (void)setAccessGroupToNextMessageToSend:(id)a3;
- (void)setAccessGroupToTimer:(id)a3;
- (void)setPeerID:(id)a3;
@end

@implementation PeerRateLimiter

- (id)setUpConfigForPeer
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( [@"<?xml version=1.0 encoding=UTF-8?>                          <!DOCTYPE plist PUBLIC -//Apple//DTD PLIST 1.0//EN http://www.apple.com/DTDs/PropertyList-1.0.dtd>                          <plist version=1.0>                          <dict>                          <key>general</key>                          <dict>                          <key>maxStateSize</key>                          <integer>250</integer>                          <key>maxItemAge</key>                          <integer>3600</integer>                          <key>overloadDuration</key>                          <integer>1800</integer>                          <key>name</key>                          <string>SOS</string>                          <key>MAType</key>                          <string></string>                          </dict>                          <key>groups</key>                          <array>                                <dict>                                    <key>property</key>                                    <string>global</string>                                    <key>capacity</key>                                    <integer>1000</integer>                                    <key>rate</key>                                    <integer>10</integer>                                    <key>badness</key>                                    <integer>1</integer>                                </dict>                                <dict>                                    <key>property</key>                                    <string>accessGroup</string>                                    <key>capacity</key>                                    <integer>50</integer>                                    <key>rate</key>                                    <integer>900</integer>                                    <key>badness</key>                                    <integer>3</integer>                                </dict>                          </array>                          </dict>                          </plist>                          " dataUsingEncoding:4]);
  uint64_t v5 = 0LL;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v2,  0LL,  0LL,  &v5));

  return v3;
}

- (PeerRateLimiter)initWithPeer:(__OpaqueSOSPeer *)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PeerRateLimiter setUpConfigForPeer](self, "setUpConfigForPeer"));
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PeerRateLimiter;
  v6 = -[RateLimiter initWithConfig:](&v11, "initWithConfig:", v5);

  if (v6)
  {
    -[PeerRateLimiter setPeerID:](v6, "setPeerID:", *((void *)a3 + 2));
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[PeerRateLimiter setAccessGroupRateLimitState:](v6, "setAccessGroupRateLimitState:", v7);

    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[PeerRateLimiter setAccessGroupToTimer:](v6, "setAccessGroupToTimer:", v8);

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[PeerRateLimiter setAccessGroupToNextMessageToSend:](v6, "setAccessGroupToNextMessageToSend:", v9);
  }

  return v6;
}

- (int)stateForAccessGroup:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PeerRateLimiter accessGroupRateLimitState](self, "accessGroupRateLimitState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

  if (v6)
  {
    int v7 = [v6 intValue];
  }

  else
  {
    int v7 = 1;
    v8 = -[NSNumber initWithLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLong:", 1LL);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PeerRateLimiter accessGroupRateLimitState](self, "accessGroupRateLimitState"));
    [v9 setObject:v8 forKey:v4];
  }

  return v7;
}

- (NSString)peerID
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setPeerID:(id)a3
{
}

- (NSMutableDictionary)accessGroupRateLimitState
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setAccessGroupRateLimitState:(id)a3
{
}

- (NSMutableDictionary)accessGroupToTimer
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setAccessGroupToTimer:(id)a3
{
}

- (NSMutableDictionary)accessGroupToNextMessageToSend
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setAccessGroupToNextMessageToSend:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
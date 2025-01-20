@interface MPCPlayerPath
- (BOOL)isAirplayReceiver;
- (BOOL)isSystemPodcastsPath;
@end

@implementation MPCPlayerPath

- (BOOL)isSystemPodcastsPath
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPCPlayerPath bundleID](self, "bundleID"));
  if (-[MPCPlayerPath mediaRemotePlayerPath](self, "mediaRemotePlayerPath"))
  {
    uint64_t Client = MRNowPlayingPlayerPathGetClient(-[MPCPlayerPath mediaRemotePlayerPath](self, "mediaRemotePlayerPath"));
    v5 = (void *)MRNowPlayingClientCopyBundleIdentifierHierarchy(Client);
    if ([v5 count])
    {
      uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 lastObject]);

      v3 = (void *)v6;
    }
  }

  unsigned __int8 v7 = [v3 isEqualToString:@"com.apple.podcasts"];

  return v7;
}

- (BOOL)isAirplayReceiver
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MPCPlayerPath bundleID](self, "bundleID"));
  unsigned __int8 v3 = [v2 isEqualToString:@"airtunesd"];

  return v3;
}

@end
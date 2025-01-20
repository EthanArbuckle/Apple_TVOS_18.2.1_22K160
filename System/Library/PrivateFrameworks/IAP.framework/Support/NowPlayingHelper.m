@interface NowPlayingHelper
+ (BOOL)_loggingEnabled;
+ (void)validateNowPlayingInfo:(id)a3;
+ (void)validateNowPlayingInfo:(id)a3 property:(id)a4 class:(Class)a5;
@end

@implementation NowPlayingHelper

+ (BOOL)_loggingEnabled
{
  if (qword_10011BC68 != -1) {
    dispatch_once(&qword_10011BC68, &stru_1001039E8);
  }
  return byte_10011BC60 & 1;
}

+ (void)validateNowPlayingInfo:(id)a3 property:(id)a4 class:(Class)a5
{
  if ([a3 objectForKey:a4]
    && (objc_opt_isKindOfClass([a3 objectForKey:a4], a5) & 1) == 0)
  {
    if (+[NowPlayingHelper _loggingEnabled](&OBJC_CLASS___NowPlayingHelper, "_loggingEnabled"))
    {
      v8 = (objc_class *)objc_opt_class([a3 objectForKey:a4]);
      v9 = NSStringFromClass(v8);
      NSLog( @"WARNING: found invalid now playing dictionary item for property: %@, should be of class %@, not %@",  a4,  a5,  v9);
    }

    [a3 removeObjectForKey:a4];
  }

+ (void)validateNowPlayingInfo:(id)a3
{
  uint64_t v5 = kMRMediaRemoteNowPlayingInfoUniqueIdentifier;
  [a1 validateNowPlayingInfo:a3 property:kMRMediaRemoteNowPlayingInfoUniqueIdentifier class:objc_opt_class(NSNumber)];
  [a1 validateNowPlayingInfo:a3 property:kMRMediaRemoteNowPlayingInfoQueueIndex class:objc_opt_class(NSNumber)];
  [a1 validateNowPlayingInfo:a3 property:kMRMediaRemoteNowPlayingInfoTotalQueueCount class:objc_opt_class(NSNumber)];
  [a1 validateNowPlayingInfo:a3 property:kMRMediaRemoteNowPlayingInfoPlaybackRate class:objc_opt_class(NSNumber)];
  [a1 validateNowPlayingInfo:a3 property:kMRMediaRemoteNowPlayingInfoRepeatMode class:objc_opt_class(NSNumber)];
  [a1 validateNowPlayingInfo:a3 property:kMRMediaRemoteNowPlayingInfoShuffleMode class:objc_opt_class(NSNumber)];
  [a1 validateNowPlayingInfo:a3 property:kMRMediaRemoteNowPlayingInfoChapterNumber class:objc_opt_class(NSNumber)];
  [a1 validateNowPlayingInfo:a3 property:kMRMediaRemoteNowPlayingInfoDiscNumber class:objc_opt_class(NSNumber)];
  [a1 validateNowPlayingInfo:a3 property:kMRMediaRemoteNowPlayingInfoDuration class:objc_opt_class(NSNumber)];
  [a1 validateNowPlayingInfo:a3 property:kMRMediaRemoteNowPlayingInfoElapsedTime class:objc_opt_class(NSNumber)];
  [a1 validateNowPlayingInfo:a3 property:kMRMediaRemoteNowPlayingInfoTotalChapterCount class:objc_opt_class(NSNumber)];
  [a1 validateNowPlayingInfo:a3 property:kMRMediaRemoteNowPlayingInfoTotalDiscCount class:objc_opt_class(NSNumber)];
  [a1 validateNowPlayingInfo:a3 property:kMRMediaRemoteNowPlayingInfoTotalTrackCount class:objc_opt_class(NSNumber)];
  [a1 validateNowPlayingInfo:a3 property:kMRMediaRemoteNowPlayingInfoTrackNumber class:objc_opt_class(NSNumber)];
  [a1 validateNowPlayingInfo:a3 property:v5 class:objc_opt_class(NSNumber)];
  [a1 validateNowPlayingInfo:a3 property:kMRMediaRemoteNowPlayingInfoIsExplicitTrack class:objc_opt_class(NSNumber)];
}

@end
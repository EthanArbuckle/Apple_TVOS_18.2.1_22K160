@interface MRPlaybackQueueRequest
- (MRDPlaybackQueueArtworkCacheSize)artworkCacheSize;
@end

@implementation MRPlaybackQueueRequest

- (MRDPlaybackQueueArtworkCacheSize)artworkCacheSize
{
  v3 = objc_alloc(&OBJC_CLASS___MRDPlaybackQueueArtworkCacheSize);
  -[MRPlaybackQueueRequest artworkWidth](self, "artworkWidth");
  double v5 = v4;
  -[MRPlaybackQueueRequest artworkHeight](self, "artworkHeight");
  return -[MRDPlaybackQueueArtworkCacheSize initWithW:h:](v3, "initWithW:h:", v5, v6);
}

@end
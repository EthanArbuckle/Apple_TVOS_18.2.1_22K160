@interface SAVCSPlayContent
- (id)_sr_playerForHighResolutionPlayback:(BOOL)a3;
@end

@implementation SAVCSPlayContent

- (id)_sr_playerForHighResolutionPlayback:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[SAVCSPlayContent playTrailer](self, "playTrailer"))
  {
    if (v3) {
      uint64_t v5 = objc_claimAutoreleasedReturnValue(-[SAVCSPlayContent hiresTrailerUri](self, "hiresTrailerUri"));
    }
    else {
      uint64_t v5 = objc_claimAutoreleasedReturnValue(-[SAVCSPlayContent lowresTrailerUri](self, "lowresTrailerUri"));
    }
    v7 = (void *)v5;
    if (v5) {
      v6 = -[AVPlayer initWithURL:](objc_alloc(&OBJC_CLASS___AVPlayer), "initWithURL:", v5);
    }
    else {
      v6 = 0LL;
    }
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

@end
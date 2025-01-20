@interface PBMutableSystemUIServiceSystemState
- (void)setUIPlaybackControlsState:(int64_t)a3;
@end

@implementation PBMutableSystemUIServiceSystemState

- (void)setUIPlaybackControlsState:(int64_t)a3
{
  if (a3 == 1) {
    uint64_t v3 = 1LL;
  }
  else {
    uint64_t v3 = 2LL * (a3 == 2);
  }
  -[PBMutableSystemUIServiceSystemState setPlaybackControlsState:](self, "setPlaybackControlsState:", v3);
}

@end
@interface HHDIntercomAppFactory
- (id)createLocalPlaybackSessionWithEndpoint:(id)a3;
@end

@implementation HHDIntercomAppFactory

- (id)createLocalPlaybackSessionWithEndpoint:(id)a3
{
  id v3 = a3;
  v4 = -[HHDIntercomLocalPlaybackSession initWithHHEndpoint:]( objc_alloc(&OBJC_CLASS___HHDIntercomLocalPlaybackSession),  "initWithHHEndpoint:",  v3);

  return v4;
}

@end
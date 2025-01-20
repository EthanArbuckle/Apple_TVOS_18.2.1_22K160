@interface TVSSNowPlayingControlForward30Button
- (TVSSNowPlayingControlForward30Button)initWithFrame:(CGRect)a3;
- (id)accessibilityIdentifier;
@end

@implementation TVSSNowPlayingControlForward30Button

- (TVSSNowPlayingControlForward30Button)initWithFrame:(CGRect)a3
{
  CGRect v6 = a3;
  v5 = 0LL;
  v5 = -[TVSSNowPlayingControlButton initWithSymbolImageName:frame:]( self,  "initWithSymbolImageName:frame:",  @"goforward.30",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v5;
  objc_storeStrong((id *)&v5, 0LL);
  return v4;
}

- (id)accessibilityIdentifier
{
  return @"com.apple.TVSystemUIService.nowPlaying.forwardButton";
}

@end
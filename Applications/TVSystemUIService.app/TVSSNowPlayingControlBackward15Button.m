@interface TVSSNowPlayingControlBackward15Button
- (TVSSNowPlayingControlBackward15Button)initWithFrame:(CGRect)a3;
- (id)accessibilityIdentifier;
@end

@implementation TVSSNowPlayingControlBackward15Button

- (TVSSNowPlayingControlBackward15Button)initWithFrame:(CGRect)a3
{
  CGRect v6 = a3;
  v5 = 0LL;
  v5 = -[TVSSNowPlayingControlButton initWithSymbolImageName:frame:]( self,  "initWithSymbolImageName:frame:",  @"gobackward.15",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v5;
  objc_storeStrong((id *)&v5, 0LL);
  return v4;
}

- (id)accessibilityIdentifier
{
  return @"com.apple.TVSystemUIService.nowPlaying.backwardButton";
}

@end
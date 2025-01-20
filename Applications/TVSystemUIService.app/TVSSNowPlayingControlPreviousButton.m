@interface TVSSNowPlayingControlPreviousButton
- (TVSSNowPlayingControlPreviousButton)initWithCAPackageView:(id)a3 frame:(CGRect)a4;
- (id)accessibilityIdentifier;
@end

@implementation TVSSNowPlayingControlPreviousButton

- (TVSSNowPlayingControlPreviousButton)initWithCAPackageView:(id)a3 frame:(CGRect)a4
{
  CGRect v13 = a4;
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v4 = v12;
  v12 = 0LL;
  v10.receiver = v4;
  v10.super_class = (Class)&OBJC_CLASS___TVSSNowPlayingControlPreviousButton;
  v8 = -[TVSSNowPlayingControlButton initWithCAPackageView:frame:]( &v10,  "initWithCAPackageView:frame:",  location[0],  v13.origin.x,  v13.origin.y,  v13.size.width,  v13.size.height);
  v12 = v8;
  objc_storeStrong((id *)&v12, v8);
  if (v8)
  {
    v7 = -[TVSSNowPlayingControlButton caPackageView](v12, "caPackageView");
    CGAffineTransformMakeScale(&v9, -1.0, 1.0);
    -[BSUICAPackageView setTransform:](v7, "setTransform:", &v9);
  }

  v6 = v12;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v12, 0LL);
  return v6;
}

- (id)accessibilityIdentifier
{
  return @"com.apple.TVSystemUIService.nowPlaying.previousButton";
}

@end
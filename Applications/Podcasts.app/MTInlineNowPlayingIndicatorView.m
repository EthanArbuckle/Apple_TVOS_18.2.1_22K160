@interface MTInlineNowPlayingIndicatorView
+ (double)maximumLevelHeightDefault;
+ (double)maximumLevelHeightMax;
+ (double)maximumLevelHeightMin;
- (BOOL)playing;
- (CGSize)sizeThatFitsBarHeight:(double)a3;
- (MTInlineNowPlayingIndicatorView)initWithFrame:(CGRect)a3;
- (void)adjustBarHeightToSize;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation MTInlineNowPlayingIndicatorView

+ (double)maximumLevelHeightDefault
{
  return 13.0;
}

+ (double)maximumLevelHeightMin
{
  return 7.0;
}

+ (double)maximumLevelHeightMax
{
  return 26.0;
}

- (MTInlineNowPlayingIndicatorView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MTInlineNowPlayingIndicatorView;
  v3 = -[MTInlineNowPlayingIndicatorView initWithFrame:]( &v9,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MTInlineNowPlayingIndicatorView setBounceStyle:](v3, "setBounceStyle:", 1LL);
    -[MTInlineNowPlayingIndicatorView setNumberOfLevels:](v4, "setNumberOfLevels:", 4LL);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v5 scale];
    double v7 = v6;

    -[MTInlineNowPlayingIndicatorView setLevelCornerRadius:](v4, "setLevelCornerRadius:", 1.0 / v7);
    [(id)objc_opt_class(v4) maximumLevelHeightDefault];
    -[MTInlineNowPlayingIndicatorView setMaximumLevelHeight:](v4, "setMaximumLevelHeight:");
  }

  return v4;
}

- (BOOL)playing
{
  return -[MTInlineNowPlayingIndicatorView playbackState](self, "playbackState") == (id)1;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[MTInlineNowPlayingIndicatorView frame](self, "frame");
  v14.origin.double x = v8;
  v14.origin.double y = v9;
  v14.size.double width = v10;
  v14.size.double height = v11;
  v13.origin.double x = x;
  v13.origin.double y = y;
  v13.size.double width = width;
  v13.size.double height = height;
  if (!CGRectEqualToRect(v13, v14))
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___MTInlineNowPlayingIndicatorView;
    -[MTInlineNowPlayingIndicatorView setFrame:](&v12, "setFrame:", x, y, width, height);
    -[MTInlineNowPlayingIndicatorView adjustBarHeightToSize](self, "adjustBarHeightToSize");
  }

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[MTInlineNowPlayingIndicatorView bounds](self, "bounds");
  v14.origin.double x = v8;
  v14.origin.double y = v9;
  v14.size.double width = v10;
  v14.size.double height = v11;
  v13.origin.double x = x;
  v13.origin.double y = y;
  v13.size.double width = width;
  v13.size.double height = height;
  if (!CGRectEqualToRect(v13, v14))
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___MTInlineNowPlayingIndicatorView;
    -[MTInlineNowPlayingIndicatorView setBounds:](&v12, "setBounds:", x, y, width, height);
    -[MTInlineNowPlayingIndicatorView adjustBarHeightToSize](self, "adjustBarHeightToSize");
  }

- (CGSize)sizeThatFitsBarHeight:(double)a3
{
  if (v5 <= a3) {
    a3 = v5;
  }
  [(id)objc_opt_class(self) maximumLevelHeightMin];
  if (a3 < v6) {
    a3 = v6;
  }
  -[MTInlineNowPlayingIndicatorView frame](self, "frame");
  -[MTInlineNowPlayingIndicatorView sizeThatFits:](self, "sizeThatFits:", v7, a3);
  double v9 = a3;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (void)adjustBarHeightToSize
{
}

@end
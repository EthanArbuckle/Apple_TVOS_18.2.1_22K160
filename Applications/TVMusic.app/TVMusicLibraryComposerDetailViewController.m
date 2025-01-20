@interface TVMusicLibraryComposerDetailViewController
- (BOOL)showGradientMask;
- (CGSize)artworkSize;
- (CGSize)cellSize;
- (double)cellsTopMargin;
- (double)headerVerticalOffset;
@end

@implementation TVMusicLibraryComposerDetailViewController

- (double)headerVerticalOffset
{
  return 28.0;
}

- (CGSize)cellSize
{
  double v2 = 320.0;
  double v3 = 408.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)artworkSize
{
  double v2 = 380.0;
  double v3 = 380.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)cellsTopMargin
{
  return 140.0;
}

- (BOOL)showGradientMask
{
  return 0;
}

@end
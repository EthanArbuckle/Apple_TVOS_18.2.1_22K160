@interface UIViewController
- (BOOL)shouldAnimatePreviewView;
- (BOOL)shouldHideBackdropView;
- (id)backdropViewHideStateNeedsUpdatingBlock;
@end

@implementation UIViewController

- (BOOL)shouldAnimatePreviewView
{
  return 1;
}

- (BOOL)shouldHideBackdropView
{
  return 1;
}

- (id)backdropViewHideStateNeedsUpdatingBlock
{
  return 0LL;
}

@end
@interface PBOSUpdateVerifyingViewController
- (void)loadView;
@end

@implementation PBOSUpdateVerifyingViewController

- (void)loadView
{
  v3 = -[PBOSUpdateVerifyingView initWithFrame:]( objc_alloc(&OBJC_CLASS___PBOSUpdateVerifyingView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  -[PBOSUpdateVerifyingViewController setView:](self, "setView:", v3);
}

@end
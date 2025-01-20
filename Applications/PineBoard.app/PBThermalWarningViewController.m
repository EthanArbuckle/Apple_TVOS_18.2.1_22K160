@interface PBThermalWarningViewController
- (void)loadView;
@end

@implementation PBThermalWarningViewController

- (void)loadView
{
  v3 = -[PBThermalWarningView initWithFrame:]( objc_alloc(&OBJC_CLASS___PBThermalWarningView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  -[PBThermalWarningViewController setView:](self, "setView:", v3);
}

@end
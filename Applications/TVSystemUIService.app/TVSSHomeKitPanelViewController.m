@interface TVSSHomeKitPanelViewController
- (TVSSHomeKitPanelViewController)init;
- (double)desiredWidth;
@end

@implementation TVSSHomeKitPanelViewController

- (TVSSHomeKitPanelViewController)init
{
  v6 = self;
  v5[1] = (id)a2;
  v5[0] = -[TVSSHomeKitPanelPlatterController initWithIdentifier:]( objc_alloc(&OBJC_CLASS___TVSSHomeKitPanelPlatterController),  "initWithIdentifier:",  @"com.apple.TVSystemUIService.homekit.item");
  v2 = v6;
  v6 = 0LL;
  v6 = -[TVSSHomeKitPanelViewController initWithPlatterController:](v2, "initWithPlatterController:", v5[0]);
  v4 = v6;
  objc_storeStrong(v5, 0LL);
  objc_storeStrong((id *)&v6, 0LL);
  return v4;
}

- (double)desiredWidth
{
  unsigned __int8 v2 = +[TVSSConstants isScaledUI](&OBJC_CLASS___TVSSConstants, "isScaledUI", a2, self);
  double result = 528.0;
  if ((v2 & 1) == 0) {
    return 492.0;
  }
  return result;
}

@end
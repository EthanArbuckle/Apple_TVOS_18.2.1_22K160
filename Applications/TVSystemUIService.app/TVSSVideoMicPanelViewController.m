@interface TVSSVideoMicPanelViewController
- (TVSSVideoMicPanelViewController)init;
@end

@implementation TVSSVideoMicPanelViewController

- (TVSSVideoMicPanelViewController)init
{
  v6 = self;
  v5[1] = (id)a2;
  v5[0] = -[TVSSVideoMicPlatterController initWithIdentifier:]( objc_alloc(&OBJC_CLASS___TVSSVideoMicPlatterController),  "initWithIdentifier:",  @"com.apple.VideoMicPanel");
  v2 = v6;
  v6 = 0LL;
  v6 = -[TVSSVideoMicPanelViewController initWithPlatterController:](v2, "initWithPlatterController:", v5[0]);
  v4 = v6;
  objc_storeStrong(v5, 0LL);
  objc_storeStrong((id *)&v6, 0LL);
  return v4;
}

@end
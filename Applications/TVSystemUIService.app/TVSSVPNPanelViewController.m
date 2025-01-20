@interface TVSSVPNPanelViewController
- (TVSSVPNPanelPlatterController)platterController;
- (TVSSVPNPanelViewController)init;
@end

@implementation TVSSVPNPanelViewController

- (TVSSVPNPanelViewController)init
{
  v6 = self;
  v5[1] = (id)a2;
  v5[0] = -[TVSSVPNPanelPlatterController initWithIdentifier:]( objc_alloc(&OBJC_CLASS___TVSSVPNPanelPlatterController),  "initWithIdentifier:",  @"com.apple.TVSystemUIService.vpn.item");
  v2 = v6;
  v6 = 0LL;
  v6 = -[TVSSVPNPanelViewController initWithPlatterController:](v2, "initWithPlatterController:", v5[0]);
  v4 = v6;
  objc_storeStrong(v5, 0LL);
  objc_storeStrong((id *)&v6, 0LL);
  return v4;
}

- (TVSSVPNPanelPlatterController)platterController
{
  return self->_platterController;
}

- (void).cxx_destruct
{
}

@end
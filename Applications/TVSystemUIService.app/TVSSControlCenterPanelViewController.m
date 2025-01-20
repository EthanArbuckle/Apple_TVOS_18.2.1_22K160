@interface TVSSControlCenterPanelViewController
- (TVSSControlCenterPanelPlatterController)platterController;
- (TVSSControlCenterPanelViewController)initWithPresentationContext:(id)a3 sleepTimerController:(id)a4 criticalInfoController:(id)a5 systemOutputDeviceRouteController:(id)a6;
- (TVSSSleepTimerController)sleepTimerController;
- (void)setSleepTimerController:(id)a3;
@end

@implementation TVSSControlCenterPanelViewController

- (TVSSControlCenterPanelViewController)initWithPresentationContext:(id)a3 sleepTimerController:(id)a4 criticalInfoController:(id)a5 systemOutputDeviceRouteController:(id)a6
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v16 = 0LL;
  objc_storeStrong(&v16, a4);
  id v15 = 0LL;
  objc_storeStrong(&v15, a5);
  id v14 = 0LL;
  objc_storeStrong(&v14, a6);
  v6 = objc_alloc(&OBJC_CLASS___TVSSControlCenterPanelPlatterController);
  v13 = -[TVSSControlCenterPanelPlatterController initWithIdentifier:presentationContext:sleepTimerController:criticalInfoController:systemOutputDeviceRouteController:]( v6,  "initWithIdentifier:presentationContext:sleepTimerController:criticalInfoController:systemOutputDeviceRouteController:",  @"com.apple.status.controlCenterItem",  location[0],  v16,  v15,  v14);
  v7 = v18;
  v18 = 0LL;
  v18 = -[TVSSControlCenterPanelViewController initWithPlatterController:](v7, "initWithPlatterController:", v13);
  v12 = v18;
  objc_storeStrong((id *)&v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v18, 0LL);
  return v12;
}

- (TVSSSleepTimerController)sleepTimerController
{
  return self->_sleepTimerController;
}

- (void)setSleepTimerController:(id)a3
{
}

- (TVSSControlCenterPanelPlatterController)platterController
{
  return self->_platterController;
}

- (void).cxx_destruct
{
}

@end
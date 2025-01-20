@interface TVSSControlCenterMenuItemProvider
- (TVSSControlCenterMenuItemProvider)initWithSleepTimerController:(id)a3 criticalInfoController:(id)a4 systemOutputDeviceRouteController:(id)a5;
@end

@implementation TVSSControlCenterMenuItemProvider

- (TVSSControlCenterMenuItemProvider)initWithSleepTimerController:(id)a3 criticalInfoController:(id)a4 systemOutputDeviceRouteController:(id)a5
{
  v29 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v27 = 0LL;
  objc_storeStrong(&v27, a4);
  id v26 = 0LL;
  objc_storeStrong(&v26, a5);
  v5 = v29;
  v29 = 0LL;
  v25.receiver = v5;
  v25.super_class = (Class)&OBJC_CLASS___TVSSControlCenterMenuItemProvider;
  v29 = -[TVSSMenuItemProvider initWithIdentifier:]( &v25,  "initWithIdentifier:",  @"com.apple.status.controlCenterProvider");
  objc_storeStrong((id *)&v29, v29);
  if (v29)
  {
    v8 = objc_alloc(&OBJC_CLASS___TVSSImageContent);
    id v9 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"switch.2");
    v24 = -[TVSSImageContent initWithImage:](v8, "initWithImage:");

    v10 = objc_alloc(&OBJC_CLASS___TVSSMenuItem);
    v15 = _NSConcreteStackBlock;
    int v16 = -1073741824;
    int v17 = 0;
    v18 = sub_1000EEF80;
    v19 = &unk_1001BA998;
    id v20 = location[0];
    id v21 = v27;
    id v22 = v26;
    v23 = -[TVSSMenuItem initWithIdentifier:hasFocusableContent:platterViewControllerClassProvider:]( v10,  "initWithIdentifier:hasFocusableContent:platterViewControllerClassProvider:",  @"com.apple.status.controlCenterItem",  1LL,  &v15);
    -[TVSSMenuItem setVisualContent:](v23, "setVisualContent:", v24);
    v11 = v29;
    v12 = +[NSOrderedSet orderedSetWithObject:](&OBJC_CLASS___NSOrderedSet, "orderedSetWithObject:", v23);
    -[TVSSMenuItemProvider setItems:](v11, "setItems:");

    objc_storeStrong((id *)&v23, 0LL);
    objc_storeStrong(&v22, 0LL);
    objc_storeStrong(&v21, 0LL);
    objc_storeStrong(&v20, 0LL);
    objc_storeStrong((id *)&v24, 0LL);
  }

  v7 = v29;
  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(&v27, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v29, 0LL);
  return v7;
}

@end
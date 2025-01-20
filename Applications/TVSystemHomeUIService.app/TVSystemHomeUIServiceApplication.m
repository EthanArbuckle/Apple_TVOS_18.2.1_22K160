@interface TVSystemHomeUIServiceApplication
+ (id)sharedApplication;
- (HFItemManager)cameraItemManager;
- (TVSystemHomeUIServiceApplication)init;
- (void)_fetchInitialCameraItemsWithHome:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)refreshItemManager;
@end

@implementation TVSystemHomeUIServiceApplication

+ (id)sharedApplication
{
  id v5 = a1;
  SEL v4 = a2;
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___TVSystemHomeUIServiceApplication;
  return objc_msgSendSuper2(&v3, "sharedApplication");
}

- (TVSystemHomeUIServiceApplication)init
{
  SEL v6 = a2;
  v7 = 0LL;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSystemHomeUIServiceApplication;
  v7 = -[TVSystemHomeUIServiceApplication init](&v5, "init");
  objc_storeStrong((id *)&v7, v7);
  if (v7)
  {
    SEL v4 = +[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance");
    -[TVCSHomeManager addObserver:forKeyPath:options:context:]( v4,  "addObserver:forKeyPath:options:context:",  v7,  @"localAccessory",  4LL,  &off_1000147B8);
    -[TVCSHomeManager reloadHomeConfiguration](v4, "reloadHomeConfiguration");
    objc_storeStrong((id *)&v4, 0LL);
  }

  objc_super v3 = v7;
  objc_storeStrong((id *)&v7, 0LL);
  return v3;
}

- (void)dealloc
{
  SEL v4 = self;
  v3[1] = (id)a2;
  v3[0] = +[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance");
  [v3[0] removeObserver:v4 forKeyPath:@"localAccessory"];
  objc_storeStrong(v3, 0LL);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSystemHomeUIServiceApplication;
  -[TVSystemHomeUIServiceApplication dealloc](&v2, "dealloc");
}

- (void)refreshItemManager
{
  SEL v6 = self;
  v5[1] = (id)a2;
  objc_storeStrong((id *)&self->_cameraItemManager, 0LL);
  v5[0] = +[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance");
  id v3 = [v5[0] localAccessory];
  id v2 = [v3 home];
  id location = [v2 hmHome];

  if (location) {
    -[TVSystemHomeUIServiceApplication _fetchInitialCameraItemsWithHome:]( v6,  "_fetchInitialCameraItemsWithHome:",  location);
  }
  objc_storeStrong(&location, 0LL);
  objc_storeStrong(v5, 0LL);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  id v11 = 0LL;
  objc_storeStrong(&v11, a5);
  v10 = a6;
  if (a6 == &off_1000147B8)
  {
    if (!v14->_cameraItemManager) {
      -[TVSystemHomeUIServiceApplication refreshItemManager](v14, "refreshItemManager");
    }
  }

  else
  {
    v9.receiver = v14;
    v9.super_class = (Class)&OBJC_CLASS___TVSystemHomeUIServiceApplication;
    -[TVSystemHomeUIServiceApplication observeValueForKeyPath:ofObject:change:context:]( &v9,  "observeValueForKeyPath:ofObject:change:context:",  location[0],  v12,  v11,  v10);
  }

  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_fetchInitialCameraItemsWithHome:(id)a3
{
  v13 = self;
  SEL v12 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  if (!v13->_cameraItemManager)
  {
    id v3 = objc_alloc(&OBJC_CLASS___HFHomeItem);
    id v10 = [v3 initWithHome:location];
    -[TVSystemHomeUIServiceApplication willChangeValueForKey:](v13, "willChangeValueForKey:");
    SEL v4 = -[TVSHUICameraItemManager initWithDelegate:sourceItem:]( objc_alloc(&OBJC_CLASS___TVSHUICameraItemManager),  "initWithDelegate:sourceItem:");
    cameraItemManager = v13->_cameraItemManager;
    v13->_cameraItemManager = (HFItemManager *)v4;

    -[TVSystemHomeUIServiceApplication didChangeValueForKey:](v13, "didChangeValueForKey:", @"cameraItemManager");
    v8 = v13->_cameraItemManager;
    SEL v6 = (objc_class *)objc_opt_class(v13);
    objc_super v9 = NSStringFromClass(v6);
    -[HFItemManager setIdentifier:](v8, "setIdentifier:");

    id v7 =  -[HFItemManager reloadAndUpdateAllItemsFromSenderSelector:]( v13->_cameraItemManager,  "reloadAndUpdateAllItemsFromSenderSelector:",  v12);
    objc_storeStrong(&v10, 0LL);
  }

  objc_storeStrong(&location, 0LL);
}

- (HFItemManager)cameraItemManager
{
  return self->_cameraItemManager;
}

- (void).cxx_destruct
{
}

@end
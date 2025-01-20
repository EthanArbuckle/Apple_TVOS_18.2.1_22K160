@interface TVSBMultiCamBulletinViewController
- (id)bulletinViewForBulletin:(id)a3;
- (void)_configureView:(id)a3 forBulletin:(id)a4;
- (void)bulletinServiceEndUserInteractionWithCompletion:(id)a3;
- (void)didBeginAnimatingInBulletinView:(id)a3;
- (void)handleMenuButtonWithCompletion:(id)a3;
- (void)updateBulletinView:(id)a3 forBulletin:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willEnterPIP:(id)a3;
@end

@implementation TVSBMultiCamBulletinViewController

- (void)bulletinServiceEndUserInteractionWithCompletion:(id)a3
{
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v6 = -[TVSBBulletinViewController bulletinView](v21, "bulletinView");
  id v5 = -[UIView viewController](v6, "viewController");
  id v19 = [v5 presentedViewController];

  if ((objc_opt_respondsToSelector(v19, "systemMenuDidRequestDismissalAnimated:withCompletion:") & 1) != 0)
  {
    id v4 = v19;
    v13 = _NSConcreteStackBlock;
    int v14 = -1073741824;
    int v15 = 0;
    v16 = sub_10001BE40;
    v17 = &unk_10002CBC8;
    id v18 = location[0];
    [v4 systemMenuDidRequestDismissalAnimated:1 withCompletion:&v13];
    objc_storeStrong(&v18, 0LL);
  }

  else if (v19)
  {
    id v3 = v19;
    v7 = _NSConcreteStackBlock;
    int v8 = -1073741824;
    int v9 = 0;
    v10 = sub_10001BE7C;
    v11 = &unk_10002CBC8;
    id v12 = location[0];
    [v3 dismissViewControllerAnimated:1 completion:&v7];
    objc_storeStrong(&v12, 0LL);
  }

  else
  {
    (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1LL);
  }

  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)handleMenuButtonWithCompletion:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = -[TVSBBulletinViewController bulletinView](v6, "bulletinView");
  unsigned __int8 v3 = -[UIView handleMenuButton](v4, "handleMenuButton");
  (*((void (**)(id, void))location[0] + 2))(location[0], v3 & 1);
  objc_storeStrong((id *)&v4, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)viewDidAppear:(BOOL)a3
{
  v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSBMultiCamBulletinViewController;
  -[TVSBMultiCamBulletinViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  unsigned __int8 v3 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter addObserver:selector:name:object:]( v3,  "addObserver:selector:name:object:",  v7,  "willEnterPIP:",  TVHMWillEnterPictureInPictureNotification,  0LL);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  unsigned __int8 v3 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:]( v3,  "removeObserver:name:object:",  v7,  TVHMWillEnterPictureInPictureNotification,  0LL);

  v4.receiver = v7;
  v4.super_class = (Class)&OBJC_CLASS___TVSBMultiCamBulletinViewController;
  -[TVSBMultiCamBulletinViewController viewWillDisappear:](&v4, "viewWillDisappear:", v5);
}

- (void)willEnterPIP:(id)a3
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = objc_alloc(&OBJC_CLASS___PBSVideoBulletinResponse);
  SEL v6 = -[TVSBBulletinViewController bulletin](v10, "bulletin");
  uint64_t v3 = PBSSystemBulletinCameraActionStartPiP;
  id v5 = [location[0] object];
  id v8 = objc_msgSend(v4, "initWithBulletin:actionIdentifier:accessoryIdentifier:", v6, v3);

  v7 = -[TVSBBulletinViewController hostService](v10, "hostService");
  -[PBSBulletinPresenterHost didReceiveBulletinResponse:](v7, "didReceiveBulletinResponse:", v8);

  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)bulletinViewForBulletin:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = objc_alloc_init(&OBJC_CLASS___TVSBMultiCamBulletinView);
  -[TVSBMultiCamBulletinViewController _configureView:forBulletin:](v7, "_configureView:forBulletin:", v5, location[0]);
  id v4 = v5;
  objc_storeStrong((id *)&v5, 0LL);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (void)updateBulletinView:(id)a3 forBulletin:(id)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = 0LL;
  objc_storeStrong(&v6, a4);
  id v5 = location[0];
  -[TVSBMultiCamBulletinViewController _configureView:forBulletin:](v8, "_configureView:forBulletin:", v5, v6);
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_configureView:(id)a3 forBulletin:(id)a4
{
  v44 = self;
  SEL v43 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  id v41 = 0LL;
  objc_storeStrong(&v41, a4);
  id v40 = [v41 message];
  id v39 = objc_msgSend(v40, "bs_safeStringForKey:", PBSSystemBulletinHomeNameKey);
  id v38 = objc_msgSend(v40, "bs_safeArrayForKey:", PBSSystemBulletinMultiCameraCamerasKey);
  id v37 = 0LL;
  memset(__b, 0, sizeof(__b));
  v20 = -[TVSBHomeKitBulletinViewController homeManager](v44, "homeManager");
  id v21 = -[TVCSHomeManager allOwnedHomes](v20, "allOwnedHomes");

  id v22 = [v21 countByEnumeratingWithState:__b objects:v45 count:16];
  if (v22)
  {
    uint64_t v16 = *(void *)__b[2];
    uint64_t v17 = 0LL;
    id v18 = v22;
    while (1)
    {
      uint64_t v15 = v17;
      if (*(void *)__b[2] != v16) {
        objc_enumerationMutation(v21);
      }
      id v36 = *(id *)(__b[1] + 8 * v17);
      id v13 = [v36 name];
      unsigned __int8 v14 = [v13 isEqualToString:v39];

      if ((v14 & 1) != 0) {
        break;
      }
      ++v17;
      if (v15 + 1 >= (unint64_t)v18)
      {
        uint64_t v17 = 0LL;
        id v18 = [v21 countByEnumeratingWithState:__b objects:v45 count:16];
        if (!v18) {
          goto LABEL_9;
        }
      }
    }

    id v4 = [v36 hmHome];
    id v5 = v37;
    id v37 = v4;

    int v34 = 2;
  }

  else
  {
LABEL_9:
    int v34 = 0;
  }

  if (!v37)
  {
    id v12 = -[TVSBHomeKitBulletinViewController homeManager](v44, "homeManager");
    id v11 = -[TVCSHomeManager localAccessory](v12, "localAccessory");
    id v10 = [v11 home];
    id v6 = [v10 hmHome];
    id v7 = v37;
    id v37 = v6;
  }

  id v33 = objc_msgSend([TVHMMultiCamBulletinItemManager alloc], "initWithDelegate:");
  id v32 = [v33 reloadAndUpdateAllItemsFromSenderSelector:v43];
  id v9 = v32;
  v23 = _NSConcreteStackBlock;
  int v24 = -1073741824;
  int v25 = 0;
  v26 = sub_10001C7E4;
  v27 = &unk_10002D248;
  id v28 = v33;
  id v29 = v38;
  id v30 = v37;
  id v31 = location;
  id v8 = [v9 addCompletionBlock:&v23];
  objc_storeStrong(&v31, 0LL);
  objc_storeStrong(&v30, 0LL);
  objc_storeStrong(&v29, 0LL);
  objc_storeStrong(&v28, 0LL);
  objc_storeStrong(&v32, 0LL);
  objc_storeStrong(&v33, 0LL);
  objc_storeStrong(&v37, 0LL);
  objc_storeStrong(&v38, 0LL);
  objc_storeStrong(&v39, 0LL);
  objc_storeStrong(&v40, 0LL);
  objc_storeStrong(&v41, 0LL);
  objc_storeStrong(&location, 0LL);
}

- (void)didBeginAnimatingInBulletinView:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0LL);
}

@end
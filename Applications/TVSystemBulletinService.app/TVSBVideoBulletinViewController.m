@interface TVSBVideoBulletinViewController
- (BOOL)shouldShowAccessoryControlsButton;
- (BOOL)shouldShowAllCamerasButton;
- (BOOL)shouldShowPIPButton;
- (BOOL)shouldShowSnoozeButton;
- (BOOL)snoozeIsActive;
- (HFCameraItem)cameraItem;
- (HMCameraProfile)cameraProfile;
- (NSArray)allCameraItems;
- (NSArray)cameraViewControlProviders;
- (NSDictionary)messageDictionary;
- (TVHMCameraContentView)cameraContentView;
- (TVHMCameraContentView)contentView;
- (TVSBVideoBulletinAnimationContext)animationContext;
- (UIAlertController)snoozeAlert;
- (UIWindow)window;
- (id)_pressTVForFullScreenAttributedString;
- (id)_videoBulletinView;
- (id)bulletinViewForBulletin:(id)a3;
- (id)preferredFocusEnvironments;
- (void)_configureVideoBulletinView:(id)a3 forBulletin:(id)a4 forUpdate:(BOOL)a5;
- (void)accessoryControlsButtonWasClicked;
- (void)allCamerasButtonWasClicked;
- (void)bulletinServiceBeginUserInteraction;
- (void)bulletinServiceEndPresentationWithReason:(unint64_t)a3 completion:(id)a4;
- (void)bulletinServiceEndUserInteractionWithCompletion:(id)a3;
- (void)configureCameraViewForBulletinView:(id)a3;
- (void)dismissPictureInPictureViewControllerFromFullScreen:(id)a3;
- (void)handleMenuButtonWithCompletion:(id)a3;
- (void)hideBulletinViewAnimated:(BOOL)a3 completion:(id)a4;
- (void)pipButtonWasClicked;
- (void)prepareForPictureInPictureStopOrSwapAnimation;
- (void)reloadControlProviders:(BOOL)a3;
- (void)restorePictureInPictureViewControllerToFullScreen:(id)a3;
- (void)setAllCameraItems:(id)a3;
- (void)setAnimationContext:(id)a3;
- (void)setCameraItem:(id)a3;
- (void)setCameraProfile:(id)a3;
- (void)setCameraViewControlProviders:(id)a3;
- (void)setContentView:(id)a3;
- (void)setMessageDictionary:(id)a3;
- (void)setSnoozeAlert:(id)a3;
- (void)setWindow:(id)a3;
- (void)snoozeButtonWasClicked;
- (void)snoozeCameraUntil:(id)a3;
- (void)updateBulletinView:(id)a3 forBulletin:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willEnterPIP:(id)a3;
@end

@implementation TVSBVideoBulletinViewController

- (void)viewDidAppear:(BOOL)a3
{
  v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSBVideoBulletinViewController;
  -[TVSBVideoBulletinViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  v3 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter addObserver:selector:name:object:]( v3,  "addObserver:selector:name:object:",  v7,  "willEnterPIP:",  TVHMWillEnterPictureInPictureNotification,  0LL);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  v3 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:name:object:]( v3,  "removeObserver:name:object:",  v7,  TVHMWillEnterPictureInPictureNotification,  0LL);

  v4.receiver = v7;
  v4.super_class = (Class)&OBJC_CLASS___TVSBVideoBulletinViewController;
  -[TVSBVideoBulletinViewController viewWillDisappear:](&v4, "viewWillDisappear:", v5);
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

- (void)bulletinServiceBeginUserInteraction
{
  v39 = self;
  SEL v38 = a2;
  v11 = -[TVSBVideoBulletinViewController contentView](self, "contentView");
  v10 = -[TVSBVideoBulletinViewController contentView](v39, "contentView");
  -[TVHMCameraContentView frame](v10, "frame");
  v35[1] = v2;
  v35[2] = v3;
  v35[3] = v4;
  v35[4] = v5;
  -[TVHMCameraContentView convertRect:toView:]( v11,  "convertRect:toView:",  *(double *)&v2,  *(double *)&v3,  *(double *)&v4,  *(double *)&v5);
  *(void *)&__int128 v36 = v6;
  *((void *)&v36 + 1) = v7;
  *(void *)&__int128 v37 = v8;
  *((void *)&v37 + 1) = v9;

  *((double *)&v37 + 1) = *((double *)&v37 + 1) + 80.0;
  v35[0] = objc_alloc_init(&OBJC_CLASS___TVSBVideoBulletinAnimationContext);
  __int128 v33 = v36;
  __int128 v34 = v37;
  __int128 v31 = v36;
  __int128 v32 = v37;
  objc_msgSend(v35[0], "setBulletinFrame:", v36, v37);
  id v12 = -[TVSBVideoBulletinViewController _videoBulletinView](v39, "_videoBulletinView");
  id v30 = [v12 chinView];

  id v13 = [v30 title];
  objc_msgSend(v35[0], "setChinTitle:");

  id v14 = [v30 subtitle];
  objc_msgSend(v35[0], "setChinSubtitle:");

  id v15 = [v30 image];
  objc_msgSend(v35[0], "setChinImage:");

  -[TVSBVideoBulletinViewController setAnimationContext:](v39, "setAnimationContext:", v35[0]);
  id v16 = objc_alloc(&OBJC_CLASS___TVHMFullScreenCameraViewController);
  v20 = -[TVSBVideoBulletinViewController allCameraItems](v39, "allCameraItems");
  v19 = -[TVSBVideoBulletinViewController cameraItem](v39, "cameraItem");
  id v18 = -[HFCameraItem homeKitObject](v19, "homeKitObject");
  id v17 = [v18 uniqueIdentifier];
  id v29 = objc_msgSend(v16, "initWithCameraItems:focusedIdentifier:cameraViewController:", v20);

  [v29 setModalPresentationStyle:4];
  [v29 setTransitioningDelegate:v39];
  v22 = v39;
  id v21 = v29;
  v23 = _NSConcreteStackBlock;
  int v24 = -1073741824;
  int v25 = 0;
  v26 = sub_1000091FC;
  v27 = &unk_10002CA68;
  v28 = v39;
  -[TVSBVideoBulletinViewController presentViewController:animated:completion:]( v22,  "presentViewController:animated:completion:",  v21,  1LL);
  objc_storeStrong((id *)&v28, 0LL);
  objc_storeStrong(&v29, 0LL);
  objc_storeStrong(&v30, 0LL);
  objc_storeStrong(v35, 0LL);
}

- (void)bulletinServiceEndUserInteractionWithCompletion:(id)a3
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  uint64_t v8 = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  v11 = sub_1000094DC;
  id v12 = &unk_10002CA90;
  id v13 = v17;
  id v14 = location[0];
  id v15 = objc_retainBlock(&v8);
  id v6 = -[TVSBVideoBulletinViewController presentedViewController](v17, "presentedViewController");
  id v7 = [v6 presentedViewController];

  if ((objc_opt_respondsToSelector(v7, "systemMenuDidRequestDismissalAnimated:withCompletion:") & 1) != 0)
  {
    [v7 systemMenuDidRequestDismissalAnimated:1 withCompletion:v15];
  }

  else
  {
    id v4 = -[TVSBVideoBulletinViewController contentView](v17, "contentView");
    unsigned __int8 v5 = -[TVHMCameraContentView nearbyAccessoryControlsVisible](v4, "nearbyAccessoryControlsVisible");

    if ((v5 & 1) != 0)
    {
      uint64_t v3 = -[TVSBVideoBulletinViewController contentView](v17, "contentView");
      -[TVHMCameraContentView removeNearbyAccessoryControlsFromParentViewControllerAnimated:]( v3,  "removeNearbyAccessoryControlsFromParentViewControllerAnimated:",  0LL);

      (*((void (**)(void))v15 + 2))();
    }

    else if (v7)
    {
      [v7 dismissViewControllerAnimated:1 completion:v15];
    }

    else
    {
      (*((void (**)(void))v15 + 2))();
    }
  }

  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong((id *)&v13, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)handleMenuButtonWithCompletion:(id)a3
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = -[TVSBVideoBulletinViewController presentedViewController](v14, "presentedViewController");
  while (1)
  {
    id v11 = [v12 presentedViewController];

    if (!v11) {
      break;
    }
    id v3 = [v12 presentedViewController];
    id v4 = v12;
    id v12 = v3;
  }

  if (*(NSArray **)((char *)&v14->_cameraViewControlProviders + 1))
  {
    objc_msgSend( *(id *)((char *)&v14->_cameraViewControlProviders + 1),  "dismissViewControllerAnimated:completion:",  1);
    objc_storeStrong((id *)((char *)&v14->_cameraViewControlProviders + 1), 0LL);
    (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1LL);
  }

  else
  {
    int v9 = -[TVSBVideoBulletinViewController contentView](v14, "contentView");
    unsigned __int8 v10 = -[TVHMCameraContentView secureAccessoryConfirmationAlertVisible]( v9,  "secureAccessoryConfirmationAlertVisible");

    if ((v10 & 1) != 0)
    {
      uint64_t v8 = -[TVSBVideoBulletinViewController contentView](v14, "contentView");
      -[TVHMCameraContentView dismissSecureAccessoryConfirmationAlert](v8, "dismissSecureAccessoryConfirmationAlert");

      (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1LL);
    }

    else
    {
      id v6 = -[TVSBVideoBulletinViewController contentView](v14, "contentView");
      unsigned __int8 v7 = -[TVHMCameraContentView nearbyAccessoryControlsVisible]( v6,  "nearbyAccessoryControlsVisible");

      if ((v7 & 1) != 0)
      {
        unsigned __int8 v5 = -[TVSBVideoBulletinViewController contentView](v14, "contentView");
        -[TVHMCameraContentView removeNearbyAccessoryControlsFromParentViewControllerAnimated:]( v5,  "removeNearbyAccessoryControlsFromParentViewControllerAnimated:",  1LL);

        (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1LL);
      }

      else if ((objc_opt_respondsToSelector(v12, "handleMenuButton") & 1) != 0 {
             && ([v12 handleMenuButton] & 1) != 0)
      }
      {
        (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1LL);
      }

      else
      {
        (*((void (**)(id, void))location[0] + 2))(location[0], 0LL);
      }
    }
  }

  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)bulletinServiceEndPresentationWithReason:(unint64_t)a3 completion:(id)a4
{
  id v18 = self;
  SEL v17 = a2;
  unint64_t v16 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  objc_initWeak(&v14, v18);
  id v4 = v18;
  unint64_t v5 = v16;
  unsigned __int8 v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  unsigned __int8 v10 = sub_100009AFC;
  id v11 = &unk_10002CAB8;
  objc_copyWeak(&v13, &v14);
  id v12 = location;
  v6.receiver = v4;
  v6.super_class = (Class)&OBJC_CLASS___TVSBVideoBulletinViewController;
  -[TVSBBulletinViewController bulletinServiceEndPresentationWithReason:completion:]( &v6,  "bulletinServiceEndPresentationWithReason:completion:",  v5,  &v7);
  objc_storeStrong(&v12, 0LL);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v14);
  objc_storeStrong(&location, 0LL);
}

- (void)hideBulletinViewAnimated:(BOOL)a3 completion:(id)a4
{
  SEL v17 = self;
  SEL v16 = a2;
  BOOL v15 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  id v4 = v17;
  BOOL v5 = v15;
  unsigned __int8 v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  unsigned __int8 v10 = sub_100009C90;
  id v11 = &unk_10002CA90;
  id v12 = v17;
  id v13 = location;
  v6.receiver = v4;
  v6.super_class = (Class)&OBJC_CLASS___TVSBVideoBulletinViewController;
  -[TVSBBulletinViewController hideBulletinViewAnimated:completion:](&v6, "hideBulletinViewAnimated:completion:", v5);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong((id *)&v12, 0LL);
  objc_storeStrong(&location, 0LL);
}

- (id)bulletinViewForBulletin:(id)a3
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  int v8 = objc_alloc(&OBJC_CLASS___TVSBVideoBulletinView);
  id v9 = -[TVSBVideoBulletinViewController view](v13, "view");
  [v9 bounds];
  id v11 = -[TVSBVideoBulletinView initWithFrame:](v8, "initWithFrame:", v3, v4, v5, v6);

  -[TVSBVideoBulletinViewController _configureVideoBulletinView:forBulletin:forUpdate:]( v13,  "_configureVideoBulletinView:forBulletin:forUpdate:",  v11,  location[0],  0LL);
  unsigned __int8 v10 = v11;
  objc_storeStrong((id *)&v11, 0LL);
  objc_storeStrong(location, 0LL);
  return v10;
}

- (void)updateBulletinView:(id)a3 forBulletin:(id)a4
{
  int v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = 0LL;
  objc_storeStrong(&v6, a4);
  id v5 = location[0];
  -[TVSBVideoBulletinViewController _configureVideoBulletinView:forBulletin:forUpdate:]( v8,  "_configureVideoBulletinView:forBulletin:forUpdate:",  v5,  v6,  1LL);
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_configureVideoBulletinView:(id)a3 forBulletin:(id)a4 forUpdate:(BOOL)a5
{
  v106 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v104 = 0LL;
  objc_storeStrong(&v104, a4);
  BOOL v103 = a5;
  id v102 = [[TVHMMultiCamBulletinItemManager alloc] initWithDelegate:0];
  id v51 = v102;
  v52 = -[TVSBVideoBulletinViewController cameraProfile](v106, "cameraProfile");
  v96 = _NSConcreteStackBlock;
  int v97 = -1073741824;
  int v98 = 0;
  v99 = sub_10000AF50;
  v100 = &unk_10002CAE0;
  v101 = v106;
  [v51 fetchAllCamerasSelectingCameraWithCameraProfile:v52 completionHandler:&v96];

  id v95 = [v104 message];
  objc_storeStrong((id *)(&v106->super._homeFetched + 1), v95);
  id v94 = objc_msgSend(v95, "bs_safeNumberForKey:", PBSSystemBulletinSnapshotAspectRatioKey);
  if (!v94)
  {
    id v94 = objc_msgSend(v95, "bs_safeNumberForKey:", PBSSystemBulletinImageAspectRatioKey);
  }

  id v48 = location[0];
  [v94 doubleValue];
  objc_msgSend(v48, "setAspectRatio:");
  id v93 = objc_msgSend(v95, "bs_safeArrayForKey:", PBSSystemBulletinFamiliarFacesKey);
  id v92 = [v93 count];
  id v91 = 0LL;
  id v90 = objc_msgSend(v95, "bs_safeStringForKey:", PBSSystemBulletinCameraNameKey);
  id v89 = objc_msgSend(v95, "bs_safeStringForKey:", PBSSystemBulletinRoomNameKey);
  id v88 = objc_msgSend(v95, "bs_safeStringForKey:", PBSSystemBulletinHomeNameKey);
  id v87 = objc_msgSend(v95, "bs_safeStringForKey:", PBSSystemBulletinImageIDKey);
  id v86 = objc_msgSend(v95, "bs_safeStringForKey:", PBSSystemBulletinTitleKey);
  char v85 = 0;
  char v84 = 1;
  char v83 = 0;
  id v82 = objc_msgSend(v95, "bs_safeStringForKey:", HMBulletinReasonKey);
  if (v82) {
    char v84 = [v82 isEqualToString:HMBulletinReasonDoorbellPressed] & 1;
  }
  if (v86)
  {
    char v83 = 1;
    char v79 = 0;
    char v77 = 0;
    if ([v87 isEqualToString:PBSSystemBulletinImageIDVideoCamera])
    {
      id v80 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"video.fill");
      char v79 = 1;
      id v5 = v80;
    }

    else
    {
      id v78 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"bell.fill");
      char v77 = 1;
      id v5 = v78;
    }

    id v81 = v5;
    if ((v77 & 1) != 0) {

    }
    if ((v79 & 1) != 0) {
    id v76 =  objc_msgSend( v95,  "bs_safeObjectForKey:ofType:",  PBSSystemBulletinImageDataKey,  objc_opt_class(NSData));
    }
    id v6 = +[UIImage imageWithData:](&OBJC_CLASS___UIImage, "imageWithData:", v76);
    id v7 = v91;
    id v91 = v6;

    if (v91) {
      id v8 = v91;
    }
    else {
      id v8 = v81;
    }
    id v75 = v8;
    [location[0] setTitle:v86];
    [location[0] setImage:v75];
    objc_storeStrong(&v75, 0LL);
    objc_storeStrong(&v76, 0LL);
    objc_storeStrong(&v81, 0LL);
  }

  else if (v92)
  {
    id v74 = 0LL;
    id v73 = 0LL;
    memset(__b, 0, sizeof(__b));
    id v46 = v93;
    id v47 = [v46 countByEnumeratingWithState:__b objects:v107 count:16];
    if (v47)
    {
      uint64_t v43 = *(void *)__b[2];
      uint64_t v44 = 0LL;
      id v45 = v47;
      while (1)
      {
        uint64_t v42 = v44;
        if (*(void *)__b[2] != v43) {
          objc_enumerationMutation(v46);
        }
        id v72 = *(id *)(__b[1] + 8 * v44);
        id v70 = [v72 objectForKey:PBSSystemBulletinFamiliarFaceNameKey];
        id v69 = [v72 objectForKey:PBSSystemBulletinFamiliarFaceImageDataKey];
        if (v70 && v69)
        {
          objc_storeStrong(&v74, v70);
          objc_storeStrong(&v73, v69);
          int v68 = 2;
        }

        else
        {
          if (v70 && !v74) {
            objc_storeStrong(&v74, v70);
          }
          int v68 = 0;
        }

        objc_storeStrong(&v69, 0LL);
        objc_storeStrong(&v70, 0LL);
        if (v68) {
          break;
        }
        ++v44;
        if (v42 + 1 >= (unint64_t)v45)
        {
          uint64_t v44 = 0LL;
          id v45 = [v46 countByEnumeratingWithState:__b objects:v107 count:16];
          if (!v45) {
            goto LABEL_32;
          }
        }
      }
    }

    else
    {
LABEL_32:
      int v68 = 0;
    }

    if (v74)
    {
      if (v92 == (id)1) {
        id v9 = @"VideoBulletinFamiliarFaceTitleOneFace";
      }
      else {
        id v9 = @"VideoBulletinFamiliarFaceTitleMoreFaces";
      }
      v67 = v9;
      v41 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
      v40 =  -[NSBundle localizedStringForKey:value:table:]( v41,  "localizedStringForKey:value:table:",  v67,  &stru_10002D998);
      unsigned __int8 v10 = +[NSString localizedStringWithFormat:](&OBJC_CLASS___NSString, "localizedStringWithFormat:", v74);
      id v11 = v86;
      id v86 = v10;

      objc_storeStrong((id *)&v67, 0LL);
    }

    else if ((unint64_t)v92 <= 1)
    {
      SEL v38 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
      id v14 =  -[NSBundle localizedStringForKey:value:table:]( v38,  "localizedStringForKey:value:table:",  @"VideoBulletinTitle",  &stru_10002D998,  0LL);
      id v15 = v86;
      id v86 = v14;
    }

    else
    {
      v39 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
      id v12 =  -[NSBundle localizedStringForKey:value:table:]( v39,  "localizedStringForKey:value:table:",  @"VideoBulletinMultipleTitle",  &stru_10002D998,  0LL);
      id v13 = v86;
      id v86 = v12;
    }

    [location[0] setTitle:v86];
    if (v73)
    {
      SEL v16 = objc_alloc(&OBJC_CLASS___UIImage);
      SEL v17 = -[UIImage initWithData:](v16, "initWithData:", v73);
      id v18 = v91;
      id v91 = v17;

      [location[0] setImage:v91];
    }

    else
    {
      id v36 = location[0];
      id v37 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"bell.fill");
      objc_msgSend(v36, "setImage:");
    }

    objc_storeStrong(&v73, 0LL);
    objc_storeStrong(&v74, 0LL);
  }

  else if (v90 || v89 || v88)
  {
    char v84 = 0;
    if (v90)
    {
      objc_storeStrong(&v86, v90);
    }

    else
    {
      if (v89) {
        id v35 = v89;
      }
      else {
        id v35 = v88;
      }
      objc_storeStrong(&v86, v35);
    }

    [location[0] setTitle:v86];
    id v33 = location[0];
    id v34 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"video.fill");
    objc_msgSend(v33, "setImage:");
  }

  else
  {
    id v30 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
    v19 =  -[NSBundle localizedStringForKey:value:table:]( v30,  "localizedStringForKey:value:table:",  @"VideoBulletinTitle",  &stru_10002D998,  0LL);
    id v20 = v86;
    id v86 = v19;

    [location[0] setTitle:v86];
    id v31 = location[0];
    id v32 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"bell.fill");
    objc_msgSend(v31, "setImage:");
  }

  unsigned __int8 v66 = objc_msgSend(v95, "bs_BOOLForKey:", PBSSystemBulletinIncreaseSizeOnActivationKey) & 1;
  [location[0] setIncreasesSizeOnUserInteraction:v66];
  id v27 = location[0];
  id v28 =  -[TVSBVideoBulletinViewController _pressTVForFullScreenAttributedString]( v106,  "_pressTVForFullScreenAttributedString");
  objc_msgSend(v27, "setSubtitle:");

  id v21 = -[TVSBVideoBulletinViewController contentView](v106, "contentView");
  BOOL v29 = v21 != 0LL;

  if (v29)
  {
    int v25 = -[TVSBVideoBulletinViewController contentView](v106, "contentView");
    -[TVHMCameraContentView setDoorbell:](v25, "setDoorbell:", v84 & 1);

    v26 = -[TVSBVideoBulletinViewController contentView](v106, "contentView");
    [v94 doubleValue];
    -[TVHMCameraContentView setOverrideAspectRatio:](v26, "setOverrideAspectRatio:");
  }

  else
  {
    v65 = objc_alloc_init(&OBJC_CLASS___TVHMCameraContentView);
    -[TVHMCameraContentView setDoorbell:](v65, "setDoorbell:", v84 & 1);
    [v94 doubleValue];
    -[TVHMCameraContentView setOverrideAspectRatio:](v65, "setOverrideAspectRatio:");
    id v64 =  objc_msgSend( v95,  "bs_safeObjectForKey:ofType:",  PBSSystemBulletinSnapshotImageDataKey,  objc_opt_class(NSData));
    if (!v64 && (v83 & 1) == 0)
    {
      id v22 =  objc_msgSend( v95,  "bs_safeObjectForKey:ofType:",  PBSSystemBulletinImageDataKey,  objc_opt_class(NSData));
      id v23 = v64;
      id v64 = v22;
    }

    if (v64)
    {
      char v85 = 1;
      v63 = +[UIImage imageWithData:](&OBJC_CLASS___UIImage, "imageWithData:", v64);
      -[TVHMCameraContentView setPlaceholderSnapshot:](v65, "setPlaceholderSnapshot:", v63);
      objc_storeStrong((id *)&v63, 0LL);
    }

    [location[0] setVideoView:v65];
    -[TVSBVideoBulletinViewController setContentView:](v106, "setContentView:", v65);
    objc_storeStrong(&v64, 0LL);
    objc_storeStrong((id *)&v65, 0LL);
  }

  if (-[TVSBHomeKitBulletinViewController homeFetched](v106, "homeFetched")) {
    -[TVSBVideoBulletinViewController configureCameraViewForBulletinView:]( v106,  "configureCameraViewForBulletinView:",  location[0]);
  }
  if ((v84 & 1) != 0)
  {
    id v24 = sub_100008BC8(@"doorbell");
    v53 = _NSConcreteStackBlock;
    int v54 = -1073741824;
    int v55 = 0;
    v56 = sub_10000B014;
    v57 = &unk_10002CB08;
    char v60 = v85 & 1;
    char v61 = v66 & 1;
    id v58 = v93;
    BOOL v62 = v103;
    id v59 = v104;
    AnalyticsSendEventLazy(v24, &v53);

    objc_storeStrong(&v59, 0LL);
    objc_storeStrong(&v58, 0LL);
  }

  objc_storeStrong(&v82, 0LL);
  objc_storeStrong(&v86, 0LL);
  objc_storeStrong(&v87, 0LL);
  objc_storeStrong(&v88, 0LL);
  objc_storeStrong(&v89, 0LL);
  objc_storeStrong(&v90, 0LL);
  objc_storeStrong(&v91, 0LL);
  objc_storeStrong(&v93, 0LL);
  objc_storeStrong(&v94, 0LL);
  objc_storeStrong(&v95, 0LL);
  objc_storeStrong((id *)&v101, 0LL);
  objc_storeStrong(&v102, 0LL);
  objc_storeStrong(&v104, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)configureCameraViewForBulletinView:(id)a3
{
  id v48 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (-[TVSBHomeKitBulletinViewController homeFetched](v48, "homeFetched"))
  {
    id v46 = objc_msgSend(*(id *)(&v48->super._homeFetched + 1), "bs_safeStringForKey:", PBSSystemBulletinCameraNameKey);
    id v45 = objc_msgSend(*(id *)(&v48->super._homeFetched + 1), "bs_safeStringForKey:", PBSSystemBulletinRoomNameKey);
    id v44 = objc_msgSend(*(id *)(&v48->super._homeFetched + 1), "bs_safeStringForKey:", PBSSystemBulletinHomeNameKey);
    id v43 = objc_alloc_init(&OBJC_CLASS___HMCameraStreamPreferences);
    if (!v46 && !v45 && !v44) {
      [v43 setMinimumRequiredAvailableOrInUseStreams:2];
    }
    v42[0] = -[TVSBHomeKitBulletinViewController homeManager](v48, "homeManager");
    v42[1] = v44;
    v42[2] = v45;
    v42[3] = v46;
    v42[4] = objc_msgSend(*(id *)(&v48->super._homeFetched + 1), "bs_safeStringForKey:", HMBulletinCameraProfileIDKey);
    sub_10000BEA4(v40, v42);
    id v41 = (id)TVHMFindCameraProfile(v40);
    -[TVSBVideoBulletinViewController setCameraProfile:](v48, "setCameraProfile:", v41);
    id v39 = sub_10001E6C8();
    os_log_type_t v38 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_DEFAULT))
    {
      sub_10000BF34((uint64_t)v50, (uint64_t)v41);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v39, v38, "Showing bulletin for camera profile %@", v50, 0xCu);
    }

    objc_storeStrong(&v39, 0LL);
    id v30 = v41;
    BOOL v29 = -[TVSBVideoBulletinViewController contentView](v48, "contentView");
    id v27 = -[TVHMCameraContentView cameraProfile](v29, "cameraProfile");
    unsigned __int8 v28 = objc_msgSend(v30, "isEqual:");

    if ((v28 & 1) == 0)
    {
      id v37 =  objc_msgSend( *(id *)(&v48->super._homeFetched + 1),  "bs_safeObjectForKey:ofType:",  PBSSystemBulletinSnapshotImageDataKey,  objc_opt_class(NSData));
      char v35 = 0;
      BOOL v26 = 0;
      if (!v37)
      {
        id v36 = objc_msgSend(*(id *)(&v48->super._homeFetched + 1), "bs_safeStringForKey:", PBSSystemBulletinTitleKey);
        char v35 = 1;
        BOOL v26 = v36 == 0LL;
      }

      if ((v35 & 1) != 0) {

      }
      if (v26)
      {
        id v3 =  objc_msgSend( *(id *)(&v48->super._homeFetched + 1),  "bs_safeObjectForKey:ofType:",  PBSSystemBulletinImageDataKey,  objc_opt_class(NSData));
        id v4 = v37;
        id v37 = v3;
      }

      id v34 = +[UIImage imageWithData:](&OBJC_CLASS___UIImage, "imageWithData:", v37);
      int v25 = -[TVSBVideoBulletinViewController contentView](v48, "contentView");
      -[TVHMCameraContentView setPlaceholderSnapshot:](v25, "setPlaceholderSnapshot:", v34);

      objc_storeStrong(&v34, 0LL);
      objc_storeStrong(&v37, 0LL);
    }

    id v24 = -[TVSBVideoBulletinViewController presentedViewController](v48, "presentedViewController");

    if (v24)
    {
      id v23 = -[TVSBVideoBulletinViewController contentView](v48, "contentView");
      -[TVHMCameraContentView removeNearbyAccessoryControlsFromParentViewControllerAnimated:]( v23,  "removeNearbyAccessoryControlsFromParentViewControllerAnimated:",  1LL);

      id v22 = -[TVSBVideoBulletinViewController contentView](v48, "contentView");
      -[TVHMCameraContentView setCameraContentMode:](v22, "setCameraContentMode:", 0LL);
    }

    else
    {
      id v21 = -[TVSBVideoBulletinViewController contentView](v48, "contentView");
      id v20 = +[TVHMCameraContentViewStyle bulletinStyle](&OBJC_CLASS___TVHMCameraContentViewStyle, "bulletinStyle");
      -[TVHMCameraContentView applyStyle:](v21, "applyStyle:");

      v19 = -[TVSBVideoBulletinViewController contentView](v48, "contentView");
      -[TVHMCameraContentView setCameraContentMode:](v19, "setCameraContentMode:", 1LL);
    }

    id v18 = -[TVSBVideoBulletinViewController contentView](v48, "contentView");
    -[TVHMCameraContentView setStreamPreferences:](v18, "setStreamPreferences:", v43);

    SEL v17 = -[TVSBVideoBulletinViewController contentView](v48, "contentView");
    -[TVHMCameraContentView setCameraProfile:](v17, "setCameraProfile:", v41);

    SEL v16 = -[TVSBVideoBulletinViewController contentView](v48, "contentView");
    -[TVHMCameraContentView enableExternalUpdatesForVisibleReason](v16, "enableExternalUpdatesForVisibleReason");

    id v15 = -[TVSBVideoBulletinViewController contentView](v48, "contentView");
    -[TVHMCameraContentView setCentered:](v15, "setCentered:", 1LL);

    id v14 = objc_alloc_init(&OBJC_CLASS___TVHMCameraViewSnoozeButtonProvider);
    v49[0] = v14;
    id v13 = objc_alloc_init(&OBJC_CLASS___TVHMCameraViewAccessoryControlsButtonProvider);
    v49[1] = v13;
    id v12 = objc_alloc_init(&OBJC_CLASS___TVHMCameraViewAllCamerasButtonProvider);
    v49[2] = v12;
    id v11 = objc_alloc_init(&OBJC_CLASS___TVHMCameraViewPIPButtonProvider);
    v49[3] = v11;
    id v33 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v49, 4LL);

    -[TVSBVideoBulletinViewController setCameraViewControlProviders:](v48, "setCameraViewControlProviders:", v33);
    -[TVSBVideoBulletinViewController reloadControlProviders:](v48, "reloadControlProviders:", 0LL);
    char v31 = 0;
    id v9 =  objc_msgSend( *(id *)(&v48->super._homeFetched + 1),  "bs_safeNumberForKey:",  PBSSystemBulletinSnapshotAspectRatioKey);
    BOOL v10 = 0;
    if (!v9)
    {
      id v32 =  objc_msgSend( *(id *)(&v48->super._homeFetched + 1),  "bs_safeNumberForKey:",  PBSSystemBulletinImageAspectRatioKey);
      char v31 = 1;
      BOOL v10 = v32 == 0LL;
    }

    if ((v31 & 1) != 0) {

    }
    if (v10)
    {
      id v8 = location[0];
      id v7 = [v41 snapshotControl];
      id v6 = [v7 mostRecentSnapshot];
      [v6 aspectRatio];
      [v8 setAspectRatio:v5];
    }

    objc_storeStrong(&v33, 0LL);
    objc_storeStrong(&v41, 0LL);
    sub_10000BF74(v42);
    objc_storeStrong(&v43, 0LL);
    objc_storeStrong(&v44, 0LL);
    objc_storeStrong(&v45, 0LL);
    objc_storeStrong(&v46, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (id)preferredFocusEnvironments
{
  char v4 = 0;
  if (*(NSDictionary **)((char *)&self->_messageDictionary + 1))
  {
    uint64_t v7 = *(uint64_t *)((char *)&self->_messageDictionary + 1);
    double v5 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL);
    char v4 = 1;
    v2 = v5;
  }

  else
  {
    v2 = (NSArray *)0LL;
  }

  id v6 = v2;
  if ((v4 & 1) != 0) {

  }
  return v6;
}

- (id)_videoBulletinView
{
  return -[TVSBBulletinViewController bulletinView](self, "bulletinView", a2, self);
}

- (id)_pressTVForFullScreenAttributedString
{
  BOOL v26 = self;
  SEL v25 = a2;
  id v7 = -[TVSBVideoBulletinViewController traitCollection](self, "traitCollection");
  BOOL v8 = [v7 userInterfaceStyle] == (id)2;

  BOOL v24 = v8;
  double v2 = 0.48627451;
  if (!v8) {
    double v2 = 0.529411765;
  }
  id v23 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", v2, 1.0);
  id v9 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v22 =  -[NSBundle localizedStringForKey:value:table:]( v9,  "localizedStringForKey:value:table:",  @"VideoBulletinTVSubtitle",  &stru_10002D998);

  id v3 = objc_alloc(&OBJC_CLASS___NSMutableAttributedString);
  id v21 = -[NSMutableAttributedString initWithString:](v3, "initWithString:", v22);
  id v20 = objc_alloc_init(&OBJC_CLASS___NSTextAttachment);
  v19 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption2);
  id v12 =  +[UIImageSymbolConfiguration configurationWithFont:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:",  v19);
  id v11 =  +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"tv.circle");
  id v10 = [v11 imageWithRenderingMode:2];
  -[NSTextAttachment setImage:](v20, "setImage:");

  id v17 = -[NSString rangeOfString:](v22, "rangeOfString:", @"@@TV@@");
  uint64_t v18 = v4;
  SEL v16 =  +[NSAttributedString attributedStringWithAttachment:]( &OBJC_CLASS___NSAttributedString,  "attributedStringWithAttachment:",  v20);
  -[NSMutableAttributedString replaceCharactersInRange:withAttributedString:]( v21,  "replaceCharactersInRange:withAttributedString:",  v17,  v18,  v16);
  id v13 = v21;
  v31[0] = NSFontAttributeName;
  v32[0] = v19;
  v31[1] = NSForegroundColorAttributeName;
  v32[1] = v23;
  id v14 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  2LL);
  id v5 = -[NSMutableAttributedString length](v21, "length");
  uint64_t v28 = 0LL;
  id v27 = v5;
  uint64_t v29 = 0LL;
  id v30 = v5;
  -[NSMutableAttributedString addAttributes:range:](v13, "addAttributes:range:", v14, 0LL, v5);

  id v15 = v21;
  objc_storeStrong((id *)&v16, 0LL);
  objc_storeStrong((id *)&v19, 0LL);
  objc_storeStrong((id *)&v20, 0LL);
  objc_storeStrong((id *)&v21, 0LL);
  objc_storeStrong((id *)&v22, 0LL);
  objc_storeStrong((id *)&v23, 0LL);
  return v15;
}

- (void)snoozeCameraUntil:(id)a3
{
  BOOL v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = +[NSUserDefaults pineBoardServicesUserDefaults](&OBJC_CLASS___NSUserDefaults, "pineBoardServicesUserDefaults");
  id v5 = -[TVSBVideoBulletinViewController cameraProfile](v8, "cameraProfile");
  id v4 = -[HMCameraProfile uniqueIdentifier](v5, "uniqueIdentifier");
  id v3 = [v4 UUIDString];
  objc_msgSend(v6, "pbs_snoozeCamera:untilDate:");

  -[TVSBVideoBulletinViewController reloadControlProviders:](v8, "reloadControlProviders:", 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)snoozeButtonWasClicked
{
  id v48 = self;
  location[1] = (id)a2;
  objc_initWeak(location, self);
  id v22 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v21 =  -[NSBundle localizedStringForKey:value:table:]( v22,  "localizedStringForKey:value:table:",  @"VideoBulletinSnoozeAlertTitle",  &stru_10002D998,  0LL);
  double v2 =  +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:");
  id v3 = *(NSArray **)((char *)&v48->_cameraViewControlProviders + 1);
  *(NSArray **)((char *)&v48->_cameraViewControlProviders + 1) = (NSArray *)v2;

  if (-[TVSBVideoBulletinViewController snoozeIsActive](v48, "snoozeIsActive"))
  {
    id v20 = *(NSArray **)((char *)&v48->_cameraViewControlProviders + 1);
    v19 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
    uint64_t v18 =  -[NSBundle localizedStringForKey:value:table:]( v19,  "localizedStringForKey:value:table:",  @"VideoBulletinSnoozeOffTitle",  &stru_10002D998,  0LL);
    id v41 = _NSConcreteStackBlock;
    int v42 = -1073741824;
    int v43 = 0;
    id v44 = sub_10000CCE4;
    id v45 = &unk_10002CB30;
    objc_copyWeak(&v46, location);
    id v17 =  +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v18,  0LL,  &v41);
    objc_msgSend(v20, "addAction:");

    objc_destroyWeak(&v46);
  }

  SEL v16 = *(NSArray **)((char *)&v48->_cameraViewControlProviders + 1);
  id v15 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v14 =  -[NSBundle localizedStringForKey:value:table:]( v15,  "localizedStringForKey:value:table:",  @"VideoBulletinSnoozeFifteenMinutesTitle",  &stru_10002D998,  0LL);
  char v35 = _NSConcreteStackBlock;
  int v36 = -1073741824;
  int v37 = 0;
  os_log_type_t v38 = sub_10000CDAC;
  id v39 = &unk_10002CB30;
  objc_copyWeak(&v40, location);
  id v13 =  +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v14,  0LL,  &v35);
  objc_msgSend(v16, "addAction:");

  id v12 = *(NSArray **)((char *)&v48->_cameraViewControlProviders + 1);
  id v11 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v10 =  -[NSBundle localizedStringForKey:value:table:]( v11,  "localizedStringForKey:value:table:",  @"VideoBulletinSnoozeHourTitle",  &stru_10002D998,  0LL);
  uint64_t v29 = _NSConcreteStackBlock;
  int v30 = -1073741824;
  int v31 = 0;
  id v32 = sub_10000CEAC;
  id v33 = &unk_10002CB30;
  objc_copyWeak(&v34, location);
  id v9 =  +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v10,  0LL,  &v29);
  objc_msgSend(v12, "addAction:");

  BOOL v8 = *(NSArray **)((char *)&v48->_cameraViewControlProviders + 1);
  id v7 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v6 =  -[NSBundle localizedStringForKey:value:table:]( v7,  "localizedStringForKey:value:table:",  @"VideoBulletinSnoozeTomorrowTitle",  &stru_10002D998,  0LL);
  id v23 = _NSConcreteStackBlock;
  int v24 = -1073741824;
  int v25 = 0;
  BOOL v26 = sub_10000CFAC;
  id v27 = &unk_10002CB30;
  objc_copyWeak(&v28, location);
  id v5 =  +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v6,  0LL,  &v23);
  objc_msgSend(v8, "addAction:");

  id v4 = -[TVSBVideoBulletinViewController presentedViewController](v48, "presentedViewController");
  [v4 presentViewController:*(NSArray **)((char *)&v48->_cameraViewControlProviders + 1) animated:1 completion:0];

  objc_destroyWeak(&v28);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&v40);
  objc_destroyWeak(location);
}

- (BOOL)shouldShowSnoozeButton
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = objc_msgSend(*(id *)(&self->super._homeFetched + 1), "bs_safeStringForKey:", HMBulletinReasonKey);
  unsigned __int8 v4 = 1;
  unsigned __int8 v3 = 1;
  if ((v4 & 1) == 0) {
    unsigned __int8 v3 = -[TVSBVideoBulletinViewController snoozeIsActive](v6, "snoozeIsActive");
  }
  objc_storeStrong(location, 0LL);
  return v3 & 1;
}

- (BOOL)snoozeIsActive
{
  id v6 = +[NSUserDefaults pineBoardServicesUserDefaults](&OBJC_CLASS___NSUserDefaults, "pineBoardServicesUserDefaults");
  id v5 = -[TVSBVideoBulletinViewController cameraProfile](self, "cameraProfile");
  id v4 = -[HMCameraProfile uniqueIdentifier](v5, "uniqueIdentifier");
  id v3 = [v4 UUIDString];
  unsigned __int8 v7 = objc_msgSend(v6, "pbs_isCameraSnoozed:");

  return v7 & 1;
}

- (void)allCamerasButtonWasClicked
{
  BOOL v8 = self;
  v7[1] = (id)a2;
  id v5 = -[TVSBVideoBulletinViewController presentedViewController](self, "presentedViewController");
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___TVHMFullScreenCameraViewController);
  char isKindOfClass = objc_opt_isKindOfClass(v5, v2);

  if ((isKindOfClass & 1) != 0)
  {
    v7[0] = -[TVSBVideoBulletinViewController presentedViewController](v8, "presentedViewController");
    id v3 = v7[0];
    id v4 = -[TVSBVideoBulletinViewController cameraItem](v8, "cameraItem");
    objc_msgSend(v3, "allCamerasButtonWasClickedForCameraItem:");

    objc_storeStrong(v7, 0LL);
  }

- (BOOL)shouldShowAllCamerasButton
{
  return (unint64_t)objc_msgSend(*(id *)((char *)&self->_cameraProfile + 1), "count", a2, self) > 1;
}

- (void)pipButtonWasClicked
{
  BOOL v8 = self;
  v7[1] = (id)a2;
  id v2 = [*(id *)((char *)&self->_allCameraItems + 1) homeKitObject];
  v7[0] = [v2 uniqueIdentifier];

  id v3 = objc_alloc(&OBJC_CLASS___PBSVideoBulletinResponse);
  id v4 = -[TVSBBulletinViewController bulletin](v8, "bulletin");
  id v6 = objc_msgSend(v3, "initWithBulletin:actionIdentifier:accessoryIdentifier:");

  id v5 = -[TVSBBulletinViewController hostService](v8, "hostService");
  -[PBSBulletinPresenterHost didReceiveBulletinResponse:](v5, "didReceiveBulletinResponse:", v6);

  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(v7, 0LL);
}

- (BOOL)shouldShowPIPButton
{
  return 1;
}

- (void)accessoryControlsButtonWasClicked
{
  id v3 = -[TVSBVideoBulletinViewController contentView](self, "contentView");
  id v2 = -[TVSBVideoBulletinViewController presentedViewController](self, "presentedViewController");
  -[TVHMCameraContentView addNearbyAccessoryControlsToParent:animated:]( v3,  "addNearbyAccessoryControlsToParent:animated:");
}

- (BOOL)shouldShowAccessoryControlsButton
{
  id v4 = -[TVSBVideoBulletinViewController contentView](self, "contentView");
  id v3 = -[TVHMCameraContentView nearbyAccessoriesViewController](v4, "nearbyAccessoriesViewController");
  unsigned __int8 v5 = [v3 accessoryHasNearbyAccessories];

  return v5 & 1;
}

- (void)prepareForPictureInPictureStopOrSwapAnimation
{
}

- (void)restorePictureInPictureViewControllerToFullScreen:(id)a3
{
  SEL v16 = self;
  location[1]  = (id)a2;
  location[0]  = 0LL;
  objc_storeStrong(location, a3);
  [*(id *)((char *)&v16->_snoozeAlert + 1) bounds];
  double v11 = v3;
  double v12 = v4;
  double v13 = v5;
  double v14 = v6;
  id v7 = [location[0] view];
  objc_msgSend(v7, "setFrame:", v11, v12, v13, v14);

  BOOL v8 = *(UIAlertController **)((char *)&v16->_snoozeAlert + 1);
  id v9 = [location[0] view];
  objc_msgSend(v8, "addSubview:");

  id v10 = [*(id *)((char *)&v16->_snoozeAlert + 1) rootViewController];
  [v10 presentViewController:location[0] animated:0 completion:0];

  objc_storeStrong(location, 0LL);
}

- (void)dismissPictureInPictureViewControllerFromFullScreen:(id)a3
{
  id location[2] = self;
  location[1]  = (id)a2;
  location[0]  = 0LL;
  objc_storeStrong(location, a3);
  [location[0] dismissViewControllerAnimated:1 completion:0];
  objc_storeStrong(location, 0LL);
}

- (void)reloadControlProviders:(BOOL)a3
{
  uint64_t v18 = self;
  SEL v17 = a2;
  BOOL v16 = a3;
  id v15 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  memset(__b, 0, sizeof(__b));
  obj  = *(id *)((char *)&v18->_cameraItem + 1);
  id v12 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
  if (v12)
  {
    uint64_t v8 = *(void *)__b[2];
    uint64_t v9 = 0LL;
    id v10 = v12;
    while (1)
    {
      uint64_t v7 = v9;
      if (*(void *)__b[2] != v8) {
        objc_enumerationMutation(obj);
      }
      id v14 = *(id *)(__b[1] + 8 * v9);
      id v5 = v15;
      id v6 = [v14 controlViewsForCameraViewControlResponder:v18];
      objc_msgSend(v5, "addObjectsFromArray:");

      ++v9;
      if (v7 + 1 >= (unint64_t)v10)
      {
        uint64_t v9 = 0LL;
        id v10 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
        if (!v10) {
          break;
        }
      }
    }
  }

  double v4 = -[TVSBVideoBulletinViewController contentView](v18, "contentView");
  id v3 = [v15 copy];
  -[TVHMCameraContentView setCameraControlViews:animated:](v4, "setCameraControlViews:animated:");

  objc_storeStrong(&v15, 0LL);
}

- (TVHMCameraContentView)cameraContentView
{
  return (TVHMCameraContentView *)*(id *)((char *)&self->_messageDictionary + 1);
}

- (NSDictionary)messageDictionary
{
  return *(NSDictionary **)(&self->super._homeFetched + 1);
}

- (void)setMessageDictionary:(id)a3
{
}

- (TVHMCameraContentView)contentView
{
  return *(TVHMCameraContentView **)((char *)&self->_messageDictionary + 1);
}

- (void)setContentView:(id)a3
{
}

- (TVSBVideoBulletinAnimationContext)animationContext
{
  return *(TVSBVideoBulletinAnimationContext **)((char *)&self->_contentView + 1);
}

- (void)setAnimationContext:(id)a3
{
}

- (HMCameraProfile)cameraProfile
{
  return *(HMCameraProfile **)((char *)&self->_animationContext + 1);
}

- (void)setCameraProfile:(id)a3
{
}

- (NSArray)allCameraItems
{
  return *(NSArray **)((char *)&self->_cameraProfile + 1);
}

- (void)setAllCameraItems:(id)a3
{
}

- (HFCameraItem)cameraItem
{
  return *(HFCameraItem **)((char *)&self->_allCameraItems + 1);
}

- (void)setCameraItem:(id)a3
{
}

- (NSArray)cameraViewControlProviders
{
  return *(NSArray **)((char *)&self->_cameraItem + 1);
}

- (void)setCameraViewControlProviders:(id)a3
{
}

- (UIAlertController)snoozeAlert
{
  return *(UIAlertController **)((char *)&self->_cameraViewControlProviders + 1);
}

- (void)setSnoozeAlert:(id)a3
{
}

- (UIWindow)window
{
  return *(UIWindow **)((char *)&self->_snoozeAlert + 1);
}

- (void)setWindow:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
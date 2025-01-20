@interface TVSBMultiCamBulletinView
- (BOOL)handleMenuButton;
- (NSArray)allCameraItems;
- (NSArray)cameraItems;
- (TVSBMultiCamBulletinView)initWithFrame:(CGRect)a3;
- (UIView)contentView;
- (UIViewController)viewController;
- (void)setAllCameraItems:(id)a3;
- (void)setCameraItems:(id)a3;
@end

@implementation TVSBMultiCamBulletinView

- (TVSBMultiCamBulletinView)initWithFrame:(CGRect)a3
{
  CGRect v27 = a3;
  SEL v25 = a2;
  v26 = 0LL;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___TVSBMultiCamBulletinView;
  v18 = -[TVSBMultiCamBulletinView initWithFrame:]( &v24,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v26 = v18;
  objc_storeStrong((id *)&v26, v18);
  if (v18)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___UIView);
    contentView = v26->_contentView;
    v26->_contentView = v3;

    -[TVSBMultiCamBulletinView bounds](v26, "bounds");
    *(double *)&__int128 v22 = v5;
    *((double *)&v22 + 1) = v6;
    *(double *)&__int128 v23 = v7;
    *((double *)&v23 + 1) = v8;
    v9 = v26->_contentView;
    __int128 v20 = v22;
    __int128 v21 = v23;
    -[UIView setFrame:](v9, "setFrame:", v5, v6, v7, v8);
    -[UIView setAutoresizingMask:](v26->_contentView, "setAutoresizingMask:");
    -[TVSBMultiCamBulletinView addSubview:](v26, "addSubview:", v26->_contentView);
    v10 = -[TVHMAllCamerasFullScreenViewController initWithDismissalDelegate:]( objc_alloc(&OBJC_CLASS___TVHMAllCamerasFullScreenViewController),  "initWithDismissalDelegate:");
    viewController = v26->_viewController;
    v26->_viewController = v10;

    id v19 = -[TVHMAllCamerasFullScreenViewController view](v26->_viewController, "view");
    -[UIView bounds](v26->_contentView, "bounds");
    objc_msgSend(v19, "setFrame:", v12, v13, v14, v15);
    [v19 setAutoresizingMask:18];
    -[UIView addSubview:](v26->_contentView, "addSubview:", v19);
    objc_storeStrong(&v19, 0LL);
  }

  v17 = v26;
  objc_storeStrong((id *)&v26, 0LL);
  return v17;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setCameraItems:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVHMAllCamerasFullScreenViewController setCameraItems:](v4->_viewController, "setCameraItems:", location[0]);
  objc_storeStrong(location, 0LL);
}

- (NSArray)cameraItems
{
  return (NSArray *)-[TVHMAllCamerasFullScreenViewController cameraItems]( self->_viewController,  "cameraItems",  a2,  self);
}

- (void)setAllCameraItems:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVHMAllCamerasFullScreenViewController setAllCameraItems:](v4->_viewController, "setAllCameraItems:", location[0]);
  objc_storeStrong(location, 0LL);
}

- (NSArray)allCameraItems
{
  return (NSArray *)-[TVHMAllCamerasFullScreenViewController allCameraItems]( self->_viewController,  "allCameraItems",  a2,  self);
}

- (BOOL)handleMenuButton
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] =  -[TVHMAllCamerasFullScreenViewController presentedViewController]( self->_viewController,  "presentedViewController");
  while (1)
  {
    id v5 = [location[0] presentedViewController];

    if (!v5) {
      break;
    }
    id v2 = [location[0] presentedViewController];
    id v3 = location[0];
    location[0] = v2;
  }

  if (location[0])
  {
    if ((objc_opt_respondsToSelector(location[0], "handleMenuButton") & 1) != 0
      && ([location[0] handleMenuButton] & 1) != 0)
    {
      char v7 = 1;
    }

    else
    {
      if ((objc_opt_respondsToSelector(location[0], "systemMenuDidRequestDismissalAnimated:withCompletion:") & 1) != 0) {
        [location[0] systemMenuDidRequestDismissalAnimated:1 withCompletion:&stru_10002D2F8];
      }
      else {
        [location[0] dismissViewControllerAnimated:1 completion:0];
      }
      char v7 = 1;
    }
  }

  else
  {
    char v7 = 0;
  }

  objc_storeStrong(location, 0LL);
  return v7 & 1;
}

  ;
}

- (UIViewController)viewController
{
  return (UIViewController *)self->_viewController;
}

- (void).cxx_destruct
{
}

@end
@interface TVSBBulletinViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
+ (id)_transitionContextForPresenting:(BOOL)a3 animated:(BOOL)a4;
+ (id)convertTextToAttributedStringIfNeeded:(id)a3 imagePointSize:(double)a4;
- (BOOL)isOffsetEnabled;
- (CGAffineTransform)_offsetTransform;
- (CGAffineTransform)adjustedTransformForContentView:(SEL)a3;
- (CGVector)offset;
- (PBSBulletin)bulletin;
- (PBSBulletinPresenterHost)hostService;
- (PBSOverlayLayoutElementHandle)layoutElementHandle;
- (TVSBBulletinViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIView)bulletinContentView;
- (UIView)bulletinView;
- (id)bulletinViewForBulletin:(id)a3;
- (void)_activateOffsetTransform;
- (void)_deactivateOffsetTransform;
- (void)_showBulletinView:(BOOL)a3;
- (void)_willAppearInRemoteViewController:(id)a3;
- (void)bulletinServiceBeginPresentationWithBulletin:(id)a3;
- (void)bulletinServiceEndPresentationWithReason:(unint64_t)a3 completion:(id)a4;
- (void)bulletinServiceUpdateWithBulletin:(id)a3;
- (void)dealloc;
- (void)didBeginAnimatingInBulletinView:(id)a3;
- (void)didBeginAnimatingOutBulletinView:(id)a3;
- (void)didEndAnimatingInBulletinView:(id)a3;
- (void)didEndAnimatingOutBulletinView:(id)a3;
- (void)handleMenuButtonWithCompletion:(id)a3;
- (void)hideBulletinViewAnimated:(BOOL)a3 completion:(id)a4;
- (void)prepareWithBulletin:(id)a3 completion:(id)a4;
- (void)setBulletin:(id)a3;
- (void)setBulletinView:(id)a3;
- (void)setHostService:(id)a3;
- (void)setOffset:(CGVector)a3;
- (void)setOffsetEnabled:(BOOL)a3;
- (void)updateBulletinView:(id)a3 forBulletin:(id)a4;
@end

@implementation TVSBBulletinViewController

- (TVSBBulletinViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v19 = 0LL;
  objc_storeStrong(&v19, a4);
  v4 = v21;
  v21 = 0LL;
  v18.receiver = v4;
  v18.super_class = (Class)&OBJC_CLASS___TVSBBulletinViewController;
  v21 = -[TVSBBulletinViewController initWithNibName:bundle:](&v18, "initWithNibName:bundle:", location[0], v19);
  objc_storeStrong((id *)&v21, v21);
  if (v21)
  {
    v21->_offsetEnabled = 1;
    v5 = (PBSOverlayLayoutElementHandle *)+[PBSOverlayLayoutElementHandle newBulletinElementHandle]( &OBJC_CLASS___PBSOverlayLayoutElementHandle,  "newBulletinElementHandle");
    layoutElementHandle = v21->_layoutElementHandle;
    v21->_layoutElementHandle = v5;

    objc_initWeak(&v17, v21);
    v9 = v21->_layoutElementHandle;
    v11 = _NSConcreteStackBlock;
    int v12 = -1073741824;
    int v13 = 0;
    v14 = sub_100019158;
    v15 = &unk_10002CF28;
    objc_copyWeak(&v16, &v17);
    -[PBSOverlayLayoutElementHandle setHintHandler:](v9, "setHintHandler:", &v11);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v17);
  }

  v8 = v21;
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v21, 0LL);
  return v8;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[PBSOverlayLayoutElementHandle invalidate](self->_layoutElementHandle, "invalidate");
  objc_storeStrong((id *)&v4->_layoutElementHandle, 0LL);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSBBulletinViewController;
  -[TVSBBulletinViewController dealloc](&v2, "dealloc");
}

- (UIView)bulletinContentView
{
  v8 = self;
  v7[1] = (id)a2;
  v7[0] = 0LL;
  if ((-[UIView conformsToProtocol:]( self->_bulletinView,  "conformsToProtocol:",  &OBJC_PROTOCOL___TVSBBulletinView) & 1) != 0)
  {
    v6 = v8->_bulletinView;
    id v2 = -[UIView contentView](v6, "contentView");
    id v3 = v7[0];
    v7[0] = v2;

    objc_storeStrong((id *)&v6, 0LL);
  }

  id v5 = v7[0];
  objc_storeStrong(v7, 0LL);
  return (UIView *)v5;
}

- (void)setOffset:(CGVector)a3
{
  if (-[TVSBBulletinViewController isOffsetEnabled](self, "isOffsetEnabled")) {
    -[TVSBBulletinViewController _deactivateOffsetTransform](self, "_deactivateOffsetTransform");
  }
  self->_offset = a3;
  if (-[TVSBBulletinViewController isOffsetEnabled](self, "isOffsetEnabled")) {
    -[TVSBBulletinViewController _activateOffsetTransform](self, "_activateOffsetTransform");
  }
}

- (void)setOffsetEnabled:(BOOL)a3
{
  if (self->_offsetEnabled != a3)
  {
    self->_offsetEnabled = a3;
    if (a3) {
      -[TVSBBulletinViewController _activateOffsetTransform](self, "_activateOffsetTransform");
    }
    else {
      -[TVSBBulletinViewController _deactivateOffsetTransform](self, "_deactivateOffsetTransform");
    }
  }

+ (id)convertTextToAttributedStringIfNeeded:(id)a3 imagePointSize:(double)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  double v27 = a4;
  v31 = (dispatch_once_t *)&unk_100036860;
  id v30 = 0LL;
  objc_storeStrong(&v30, &stru_10002CF48);
  if (*v31 != -1) {
    dispatch_once(v31, v30);
  }
  objc_storeStrong(&v30, 0LL);
  id v26 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v7 = location[0];
  id v4 = [location[0] length];
  uint64_t v33 = 0LL;
  id v32 = v4;
  uint64_t v34 = 0LL;
  id v35 = v4;
  uint64_t v24 = 0LL;
  id v25 = v4;
  objc_super v18 = _NSConcreteStackBlock;
  int v19 = -1073741824;
  int v20 = 0;
  v21 = sub_10001999C;
  v22 = &unk_10002CF98;
  id v23 = v26;
  objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", v24, v25, 2, &v18);
  if ([v26 count])
  {
    id v17 = -[NSMutableAttributedString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableAttributedString),  "initWithString:",  location[0]);
    id v16 =  +[UIImageSymbolConfiguration configurationWithPointSize:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithPointSize:",  v27);
    id v6 = v26;
    v9 = _NSConcreteStackBlock;
    int v10 = -1073741824;
    int v11 = 0;
    int v12 = sub_100019B98;
    int v13 = &unk_10002CFC0;
    id v14 = v16;
    id v15 = v17;
    [v6 enumerateKeysAndObjectsUsingBlock:&v9];
    id v29 = [v17 copy];
    objc_storeStrong(&v15, 0LL);
    objc_storeStrong(&v14, 0LL);
    objc_storeStrong(&v16, 0LL);
    objc_storeStrong(&v17, 0LL);
  }

  else
  {
    id v29 = 0LL;
  }

  objc_storeStrong(&v23, 0LL);
  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(location, 0LL);
  return v29;
}

- (CGAffineTransform)_offsetTransform
{
  return CGAffineTransformMakeTranslation(retstr, self->_offset.dx, self->_offset.dy);
}

- (void)_activateOffsetTransform
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = -[TVSBBulletinViewController bulletinContentView](self, "bulletinContentView");
  if (location[0])
  {
    [location[0] transform];
    id v2 = location[0];
    -[TVSBBulletinViewController _offsetTransform](v8, "_offsetTransform");
    memcpy(&__dst, __b, sizeof(__dst));
    CGAffineTransformConcat(&v5, &__dst, &v4);
    [v2 setTransform:&v5];
  }

  objc_storeStrong(location, 0LL);
}

- (void)_deactivateOffsetTransform
{
  int v11 = self;
  location[1] = (id)a2;
  location[0] = -[TVSBBulletinViewController bulletinContentView](self, "bulletinContentView");
  if (location[0])
  {
    [location[0] transform];
    -[TVSBBulletinViewController _offsetTransform](v11, "_offsetTransform", v7);
    CGAffineTransformInvert(&v8, v2);
    id v3 = location[0];
    memcpy(&__dst, __b, sizeof(__dst));
    memcpy(&v4, &v8, sizeof(v4));
    CGAffineTransformConcat(&v6, &__dst, &v4);
    [v3 setTransform:&v6];
  }

  objc_storeStrong(location, 0LL);
}

- (CGAffineTransform)adjustedTransformForContentView:(SEL)a3
{
  int v11 = self;
  SEL v10 = a3;
  v9 = a4;
  -[TVSBBulletinViewController _offsetTransform](self, "_offsetTransform");
  memcpy(&__dst, a4, sizeof(__dst));
  return CGAffineTransformConcat(retstr, &v8, &__dst);
}

+ (id)_exportedInterface
{
  return (id)PBSBulletinPresenterXPCInterface(a1, a2);
}

+ (id)_remoteViewControllerInterface
{
  return (id)PBSBulletinPresenterHostXPCInterface(a1, a2);
}

- (void)bulletinServiceBeginPresentationWithBulletin:(id)a3
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = +[TVHMPIPController defaultPIPController](&OBJC_CLASS___TVHMPIPController, "defaultPIPController");
  unsigned __int8 v6 = [v5 isRestoringUserInterfaceFromPIP];

  if ((v6 & 1) != 0)
  {
    -[TVSBBulletinViewController hideBulletinViewAnimated:completion:]( v17,  "hideBulletinViewAnimated:completion:",  0LL,  &stru_10002CFE0);
    int v15 = 1;
  }

  else
  {
    id v14 = location[0];
    -[TVSBBulletinViewController setBulletin:](v17, "setBulletin:", v14);
    CGAffineTransform v4 = v17;
    id v3 = v14;
    id v7 = _NSConcreteStackBlock;
    int v8 = -1073741824;
    int v9 = 0;
    SEL v10 = sub_10001A1DC;
    int v11 = &unk_10002D008;
    int v12 = v17;
    id v13 = v14;
    -[TVSBBulletinViewController prepareWithBulletin:completion:](v4, "prepareWithBulletin:completion:", v3, &v7);
    objc_storeStrong(&v13, 0LL);
    objc_storeStrong((id *)&v12, 0LL);
    objc_storeStrong(&v14, 0LL);
    int v15 = 0;
  }

  objc_storeStrong(location, 0LL);
}

  ;
}

- (void)bulletinServiceUpdateWithBulletin:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = -[TVSBBulletinViewController bulletinView](v5, "bulletinView");
  if (v3)
  {
    -[TVSBBulletinViewController setBulletin:](v5, "setBulletin:", location[0]);
    -[TVSBBulletinViewController updateBulletinView:forBulletin:]( v5,  "updateBulletinView:forBulletin:",  v3,  location[0]);
  }

  objc_storeStrong(&v3, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)bulletinServiceEndPresentationWithReason:(unint64_t)a3 completion:(id)a4
{
  id v5 = self;
  id location[2] = (id)a2;
  location[1] = (id)a3;
  location[0] = 0LL;
  objc_storeStrong(location, a4);
  -[TVSBBulletinViewController hideBulletinViewAnimated:completion:]( v5,  "hideBulletinViewAnimated:completion:",  1LL,  location[0]);
  objc_storeStrong(location, 0LL);
}

- (void)handleMenuButtonWithCompletion:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  (*((void (**)(id, void))location[0] + 2))(location[0], 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)prepareWithBulletin:(id)a3 completion:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  if (v5) {
    (*((void (**)(void))v5 + 2))();
  }
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)bulletinViewForBulletin:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  CGAffineTransform v4 = objc_alloc_init(&OBJC_CLASS___UIView);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (void)updateBulletinView:(id)a3 forBulletin:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)didBeginAnimatingInBulletinView:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0LL);
}

- (void)didEndAnimatingInBulletinView:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0LL);
}

- (void)didBeginAnimatingOutBulletinView:(id)a3
{
  unsigned __int8 v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = [(id)objc_opt_class(v6) _transitionContextForPresenting:0 animated:1];
  id v3 =  -[PBSOverlayLayoutElementHandle updateElement:withTransitionContext:]( v6->_layoutElementHandle,  "updateElement:withTransitionContext:",  &stru_10002D048,  v4);
  objc_storeStrong(&v4, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)didEndAnimatingOutBulletinView:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0LL);
}

- (void)_willAppearInRemoteViewController:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSBBulletinViewController setHostService:](v4, "setHostService:", location[0]);
  objc_storeStrong(location, 0LL);
}

- (void)_showBulletinView:(BOOL)a3
{
  v98 = self;
  SEL v97 = a2;
  BOOL v96 = a3;
  v95 = -[TVSBBulletinViewController bulletinView](self, "bulletinView");
  v94 = -[TVSBBulletinViewController bulletinContentView](v98, "bulletinContentView");
  id v23 = -[TVSBBulletinViewController bulletinView](v98, "bulletinView");
  -[UIView layoutIfNeeded](v23, "layoutIfNeeded");

  -[TVSBBulletinViewController didBeginAnimatingInBulletinView:](v98, "didBeginAnimatingInBulletinView:", v95);
  id v3 = (void *)objc_opt_class(v98);
  id v93 = [v3 _transitionContextForPresenting:1 animated:v96];
  id v26 = +[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen");
  id v25 = -[UIScreen coordinateSpace](v26, "coordinateSpace");
  -[UIView extent](v94, "extent");
  double v87 = v4;
  double v88 = v5;
  double v89 = v6;
  double v90 = v7;
  uint64_t v24 = -[UIView superview](v94, "superview");
  objc_msgSend(v25, "convertRect:fromCoordinateSpace:", v87, v88, v89, v90);
  *(void *)&__int128 v91 = v8;
  *((void *)&v91 + 1) = v9;
  *(void *)&__int128 v92 = v10;
  *((void *)&v92 + 1) = v11;

  layoutElementHandle = v98->_layoutElementHandle;
  v79 = _NSConcreteStackBlock;
  int v80 = -1073741824;
  int v81 = 0;
  v82 = sub_10001AF70;
  v83 = &unk_10002D068;
  __int128 v84 = v91;
  __int128 v85 = v92;
  id v86 =  -[PBSOverlayLayoutElementHandle updateElement:withTransitionContext:]( layoutElementHandle,  "updateElement:withTransitionContext:",  &v79,  v93);
  double v27 = v98;
  [v86 offset];
  double v77 = v13;
  double v78 = v14;
  -[TVSBBulletinViewController setOffset:](v27, "setOffset:", v13, v14);
  -[UIView setAlpha:](v95, "setAlpha:");
  id v29 = v94;
  v28 = v98;
  CGAffineTransformMakeScale(&v75, 0.75, 0.75);
  -[TVSBBulletinViewController adjustedTransformForContentView:](v28, "adjustedTransformForContentView:", &v75);
  -[UIView setTransform:](v29, "setTransform:", v76);
  id v74 = dispatch_group_create();
  id v30 = objc_alloc(&OBJC_CLASS___UISpringTimingParameters);
  sub_10001AFF0();
  v72[1] = v15;
  v72[2] = v16;
  v73 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]( v30,  "initWithMass:stiffness:damping:initialVelocity:");
  id v17 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  v72[0] = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( v17,  "initWithDuration:timingParameters:",  v73,  0.8);
  id v31 = v72[0];
  v65[1] = _NSConcreteStackBlock;
  int v66 = -1073741824;
  int v67 = 0;
  v68 = sub_10001B01C;
  v69 = &unk_10002D008;
  v70 = v94;
  v71 = v98;
  objc_msgSend(v31, "addAnimations:");
  id v32 = v72[0];
  v60[1] = _NSConcreteStackBlock;
  int v61 = -1073741824;
  int v62 = 0;
  v63 = sub_10001B0B8;
  v64 = &unk_10002D090;
  v65[0] = v74;
  objc_msgSend(v32, "addCompletion:");
  uint64_t v33 = objc_alloc(&OBJC_CLASS___UICubicTimingParameters);
  sub_10001B0EC();
  double v58 = v18;
  double v59 = v19;
  sub_10001B0EC();
  v57[1] = v20;
  v57[2] = v21;
  v60[0] = -[UICubicTimingParameters initWithControlPoint1:controlPoint2:]( v33,  "initWithControlPoint1:controlPoint2:",  v58,  v59,  *(double *)&v20,  *(double *)&v21);
  v22 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  v57[0] = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( v22,  "initWithDuration:timingParameters:",  v60[0],  0.15);
  id v34 = v57[0];
  v51[1] = _NSConcreteStackBlock;
  int v52 = -1073741824;
  int v53 = 0;
  v54 = sub_10001B118;
  v55 = &unk_10002CA68;
  v56 = v95;
  objc_msgSend(v34, "addAnimations:");
  id v35 = v57[0];
  v44[1] = _NSConcreteStackBlock;
  int v45 = -1073741824;
  int v46 = 0;
  v47 = sub_10001B14C;
  v48 = &unk_10002D0B8;
  id v49 = v74;
  v50 = v98;
  v51[0] = v95;
  objc_msgSend(v35, "addCompletion:");
  dispatch_group_enter((dispatch_group_t)v74);
  [v57[0] startAnimation];
  dispatch_group_enter((dispatch_group_t)v74);
  [v72[0] startAnimation];
  group = (dispatch_group_s *)v74;
  queue = &_dispatch_main_q;
  v38 = _NSConcreteStackBlock;
  int v39 = -1073741824;
  int v40 = 0;
  v41 = sub_10001B198;
  v42 = &unk_10002D008;
  v43 = v98;
  v44[0] = v95;
  dispatch_group_notify(group, queue, &v38);

  objc_storeStrong(v44, 0LL);
  objc_storeStrong((id *)&v43, 0LL);
  objc_storeStrong(v51, 0LL);
  objc_storeStrong((id *)&v50, 0LL);
  objc_storeStrong(&v49, 0LL);
  objc_storeStrong((id *)&v56, 0LL);
  objc_storeStrong(v57, 0LL);
  objc_storeStrong(v60, 0LL);
  objc_storeStrong(v65, 0LL);
  objc_storeStrong((id *)&v71, 0LL);
  objc_storeStrong((id *)&v70, 0LL);
  objc_storeStrong(v72, 0LL);
  objc_storeStrong((id *)&v73, 0LL);
  objc_storeStrong(&v74, 0LL);
  objc_storeStrong(&v86, 0LL);
  objc_storeStrong(&v93, 0LL);
  objc_storeStrong((id *)&v94, 0LL);
  objc_storeStrong((id *)&v95, 0LL);
}

- (void)hideBulletinViewAnimated:(BOOL)a3 completion:(id)a4
{
  int v66 = self;
  SEL v65 = a2;
  BOOL v64 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  int v62 = -[TVSBBulletinViewController bulletinView](v66, "bulletinView");
  int v61 = -[TVSBBulletinViewController bulletinContentView](v66, "bulletinContentView");
  -[TVSBBulletinViewController didBeginAnimatingOutBulletinView:](v66, "didBeginAnimatingOutBulletinView:", v62);
  dispatch_group_t v60 = dispatch_group_create();
  double v4 = 0.15;
  if (!v64) {
    double v4 = 0.0;
  }
  double v59 = v4;
  int v15 = objc_alloc(&OBJC_CLASS___UICubicTimingParameters);
  sub_10001B0EC();
  double v56 = v5;
  double v57 = v6;
  sub_10001B0EC();
  v55[1] = v7;
  v55[2] = v8;
  double v58 = -[UICubicTimingParameters initWithControlPoint1:controlPoint2:]( v15,  "initWithControlPoint1:controlPoint2:",  v56,  v57,  *(double *)&v7,  *(double *)&v8);
  uint64_t v9 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  v55[0] = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( v9,  "initWithDuration:timingParameters:",  v58,  v59);
  id v16 = v55[0];
  v49[1] = _NSConcreteStackBlock;
  int v50 = -1073741824;
  int v51 = 0;
  int v52 = sub_10001B70C;
  int v53 = &unk_10002CA68;
  v54 = v61;
  objc_msgSend(v16, "addAnimations:");
  id v17 = v55[0];
  v44[1] = _NSConcreteStackBlock;
  int v45 = -1073741824;
  int v46 = 0;
  v47 = sub_10001B7D8;
  v48 = &unk_10002D090;
  v49[0] = v60;
  objc_msgSend(v17, "addCompletion:");
  double v18 = objc_alloc(&OBJC_CLASS___UICubicTimingParameters);
  sub_10001B0EC();
  double v42 = v10;
  double v43 = v11;
  sub_10001B0EC();
  v41[1] = v12;
  v41[2] = v13;
  v44[0] = -[UICubicTimingParameters initWithControlPoint1:controlPoint2:]( v18,  "initWithControlPoint1:controlPoint2:",  v42,  v43,  *(double *)&v12,  *(double *)&v13);
  double v14 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  v41[0] = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( v14,  "initWithDuration:timingParameters:",  v44[0],  v59);
  id v19 = v41[0];
  v35[1] = _NSConcreteStackBlock;
  int v36 = -1073741824;
  int v37 = 0;
  v38 = sub_10001B80C;
  int v39 = &unk_10002CA68;
  int v40 = v62;
  objc_msgSend(v19, "addAnimations:");
  id v20 = v41[0];
  v30[1] = _NSConcreteStackBlock;
  int v31 = -1073741824;
  int v32 = 0;
  uint64_t v33 = sub_10001B840;
  id v34 = &unk_10002D090;
  v35[0] = v60;
  objc_msgSend(v20, "addCompletion:");
  dispatch_group_enter(v60);
  [v41[0] startAnimation];
  dispatch_group_enter(v60);
  [v55[0] startAnimation];
  group = v60;
  queue = &_dispatch_main_q;
  id v23 = _NSConcreteStackBlock;
  int v24 = -1073741824;
  int v25 = 0;
  id v26 = sub_10001B874;
  double v27 = &unk_10002D0E0;
  v28 = v66;
  id v29 = v62;
  v30[0] = location;
  dispatch_group_notify(group, queue, &v23);

  objc_storeStrong(v30, 0LL);
  objc_storeStrong((id *)&v29, 0LL);
  objc_storeStrong((id *)&v28, 0LL);
  objc_storeStrong(v35, 0LL);
  objc_storeStrong((id *)&v40, 0LL);
  objc_storeStrong(v41, 0LL);
  objc_storeStrong(v44, 0LL);
  objc_storeStrong(v49, 0LL);
  objc_storeStrong((id *)&v54, 0LL);
  objc_storeStrong(v55, 0LL);
  objc_storeStrong((id *)&v58, 0LL);
  objc_storeStrong((id *)&v60, 0LL);
  objc_storeStrong((id *)&v61, 0LL);
  objc_storeStrong((id *)&v62, 0LL);
  objc_storeStrong(&location, 0LL);
}

+ (id)_transitionContextForPresenting:(BOOL)a3 animated:(BOOL)a4
{
  id v15 = a1;
  SEL v14 = a2;
  BOOL v13 = a3;
  BOOL v12 = a4;
  double v11 = 0LL;
  if (a4)
  {
    id v10 = +[UIScene _synchronizedDrawingFence](&OBJC_CLASS___UIScene, "_synchronizedDrawingFence");
    v9[1] = (id)0x3FD3333333333333LL;
    v9[0] =  +[CAMediaTimingFunction functionWithName:]( &OBJC_CLASS___CAMediaTimingFunction,  "functionWithName:",  kCAMediaTimingFunctionDefault);
    uint64_t v8 =  +[BSAnimationSettings settingsWithDuration:timingFunction:]( &OBJC_CLASS___BSAnimationSettings,  "settingsWithDuration:timingFunction:",  v9[0],  0.3);
    double v4 =  +[PBSOverlayLayoutTransitionContext transitionContextWithAnimationSettings:animationFence:]( &OBJC_CLASS___PBSOverlayLayoutTransitionContext,  "transitionContextWithAnimationSettings:animationFence:",  v8,  v10);
    double v5 = v11;
    double v11 = v4;

    objc_storeStrong((id *)&v8, 0LL);
    objc_storeStrong(v9, 0LL);
    objc_storeStrong(&v10, 0LL);
  }

  double v7 = v11;
  objc_storeStrong((id *)&v11, 0LL);
  return v7;
}

- (PBSBulletinPresenterHost)hostService
{
  return self->_hostService;
}

- (void)setHostService:(id)a3
{
}

- (PBSBulletin)bulletin
{
  return self->_bulletin;
}

- (void)setBulletin:(id)a3
{
}

- (UIView)bulletinView
{
  return self->_bulletinView;
}

- (void)setBulletinView:(id)a3
{
}

- (CGVector)offset
{
  double dy = self->_offset.dy;
  double dx = self->_offset.dx;
  result.double dy = dy;
  result.double dx = dx;
  return result;
}

- (BOOL)isOffsetEnabled
{
  return self->_offsetEnabled;
}

- (PBSOverlayLayoutElementHandle)layoutElementHandle
{
  return self->_layoutElementHandle;
}

- (void).cxx_destruct
{
}

@end
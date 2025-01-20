@interface TVCRDServiceLoadingViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (void)_menuPressed:(id)a3;
- (void)viewDidLoad;
- (void)viewServiceBeginPresentationWithOptions:(id)a3;
- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4;
@end

@implementation TVCRDServiceLoadingViewController

- (void)viewDidLoad
{
  v74 = self;
  SEL v73 = a2;
  v72.receiver = self;
  v72.super_class = (Class)&OBJC_CLASS___TVCRDServiceLoadingViewController;
  -[TVCRDServiceLoadingViewController viewDidLoad](&v72, "viewDidLoad");
  id v71 = -[TVCRDServiceLoadingViewController view](v74, "view");
  v2 = objc_alloc(&OBJC_CLASS___UITapGestureRecognizer);
  v70 = -[UITapGestureRecognizer initWithTarget:action:](v2, "initWithTarget:action:", v74, "_menuPressed:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v70, "setAllowedPressTypes:", &off_100008D58);
  [v71 addGestureRecognizer:v70];
  id v69 = +[TVSUIWallpaper wallpaperViewForVariant:](&OBJC_CLASS___TVSUIWallpaper, "wallpaperViewForVariant:");
  [v71 addSubview:v69];
  v68 = +[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 4LL);
  v67 = +[UIVibrancyEffect effectForBlurEffect:](&OBJC_CLASS___UIVibrancyEffect, "effectForBlurEffect:", v68);
  v3 = objc_alloc(&OBJC_CLASS___UIVisualEffectView);
  v66 = -[UIVisualEffectView initWithEffect:](v3, "initWithEffect:", v67);
  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:]( v66,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  [v71 addSubview:v66];
  id v6 = -[UIVisualEffectView leftAnchor](v66, "leftAnchor");
  id v5 = [v71 leftAnchor];
  id v4 = objc_msgSend(v6, "constraintEqualToAnchor:");
  [v4 setActive:1];

  id v9 = -[UIVisualEffectView rightAnchor](v66, "rightAnchor");
  id v8 = [v71 rightAnchor];
  id v7 = objc_msgSend(v9, "constraintEqualToAnchor:");
  [v7 setActive:1];

  id v12 = -[UIVisualEffectView topAnchor](v66, "topAnchor");
  id v11 = [v71 topAnchor];
  id v10 = objc_msgSend(v12, "constraintEqualToAnchor:");
  [v10 setActive:1];

  id v15 = -[UIVisualEffectView bottomAnchor](v66, "bottomAnchor");
  id v14 = [v71 bottomAnchor];
  id v13 = objc_msgSend(v15, "constraintEqualToAnchor:");
  [v13 setActive:1];

  v65 = objc_alloc_init(&OBJC_CLASS___UIView);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v65, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  v16 = -[UIVisualEffectView contentView](v66, "contentView");
  -[UIView addSubview:](v16, "addSubview:", v65);

  v20 = -[UIView centerXAnchor](v65, "centerXAnchor");
  v19 = -[UIVisualEffectView contentView](v66, "contentView");
  v18 = -[UIView centerXAnchor](v19, "centerXAnchor");
  id v17 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v20, "constraintEqualToAnchor:");
  [v17 setActive:1];

  v24 = -[UIView centerYAnchor](v65, "centerYAnchor");
  v23 = -[UIVisualEffectView contentView](v66, "contentView");
  v22 = -[UIView centerYAnchor](v23, "centerYAnchor");
  id v21 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v24, "constraintEqualToAnchor:");
  [v21 setActive:1];

  v64 = objc_alloc_init(&OBJC_CLASS___UILabel);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v64, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  -[UILabel setTextAlignment:](v64, "setTextAlignment:", 1LL);
  v25 = v64;
  v26 = sub_100004330();
  -[UILabel setFont:](v25, "setFont:");

  v27 = v64;
  v29 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  v28 =  -[NSBundle localizedStringForKey:value:table:]( v29,  "localizedStringForKey:value:table:",  @"crdLoadingTitle");
  -[UILabel setText:](v27, "setText:");

  -[UIView addSubview:](v65, "addSubview:", v64);
  id v32 = -[UILabel leftAnchor](v64, "leftAnchor");
  v31 = -[UIView leftAnchor](v65, "leftAnchor");
  id v30 = objc_msgSend(v32, "constraintEqualToAnchor:");
  [v30 setActive:1];

  id v35 = -[UILabel rightAnchor](v64, "rightAnchor");
  v34 = -[UIView rightAnchor](v65, "rightAnchor");
  id v33 = objc_msgSend(v35, "constraintEqualToAnchor:");
  [v33 setActive:1];

  id v38 = -[UILabel topAnchor](v64, "topAnchor");
  v37 = -[UIView topAnchor](v65, "topAnchor");
  id v36 = objc_msgSend(v38, "constraintEqualToAnchor:");
  [v36 setActive:1];

  v63 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]( objc_alloc(&OBJC_CLASS___UIActivityIndicatorView),  "initWithActivityIndicatorStyle:",  101LL);
  -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:]( v63,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[UIActivityIndicatorView startAnimating](v63, "startAnimating");
  -[UIView addSubview:](v65, "addSubview:", v63);
  id v41 = -[UIActivityIndicatorView centerXAnchor](v63, "centerXAnchor");
  v40 = -[UIView centerXAnchor](v65, "centerXAnchor");
  id v39 = objc_msgSend(v41, "constraintEqualToAnchor:");
  [v39 setActive:1];

  id v44 = -[UIActivityIndicatorView topAnchor](v63, "topAnchor");
  id v43 = -[UILabel lastBaselineAnchor](v64, "lastBaselineAnchor");
  id v42 = objc_msgSend(v44, "constraintEqualToAnchor:constant:", 20.0);
  [v42 setActive:1];

  id v47 = -[UIActivityIndicatorView bottomAnchor](v63, "bottomAnchor");
  v46 = -[UIView bottomAnchor](v65, "bottomAnchor");
  id v45 = objc_msgSend(v47, "constraintEqualToAnchor:");
  [v45 setActive:1];

  v62 = objc_alloc_init(&OBJC_CLASS___UILabel);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v62, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  -[UILabel setNumberOfLines:](v62, "setNumberOfLines:", 0LL);
  -[UILabel setTextAlignment:](v62, "setTextAlignment:", 1LL);
  v48 = v62;
  v49 = sub_100004358();
  -[UILabel setFont:](v48, "setFont:");

  v50 = v62;
  v52 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  v51 =  -[NSBundle localizedStringForKey:value:table:]( v52,  "localizedStringForKey:value:table:",  @"crdLoadingDescription",  &stru_100008C90,  0LL);
  -[UILabel setText:](v50, "setText:");

  v53 = -[UIVisualEffectView contentView](v66, "contentView");
  -[UIView addSubview:](v53, "addSubview:", v62);

  id v57 = -[UILabel centerXAnchor](v62, "centerXAnchor");
  v56 = -[UIVisualEffectView contentView](v66, "contentView");
  v55 = -[UIView centerXAnchor](v56, "centerXAnchor");
  id v54 = objc_msgSend(v57, "constraintEqualToAnchor:");
  [v54 setActive:1];

  id v61 = -[UILabel lastBaselineAnchor](v62, "lastBaselineAnchor");
  v60 = -[UIVisualEffectView contentView](v66, "contentView");
  v59 = -[UIView bottomAnchor](v60, "bottomAnchor");
  id v58 = objc_msgSend(v61, "constraintEqualToAnchor:constant:", -70.0);
  [v58 setActive:1];

  objc_storeStrong((id *)&v62, 0LL);
  objc_storeStrong((id *)&v63, 0LL);
  objc_storeStrong((id *)&v64, 0LL);
  objc_storeStrong((id *)&v65, 0LL);
  objc_storeStrong((id *)&v66, 0LL);
  objc_storeStrong((id *)&v67, 0LL);
  objc_storeStrong((id *)&v68, 0LL);
  objc_storeStrong(&v69, 0LL);
  objc_storeStrong((id *)&v70, 0LL);
  objc_storeStrong(&v71, 0LL);
}

- (void)viewServiceBeginPresentationWithOptions:(id)a3
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = -[TVCRDServiceLoadingViewController view](v13, "view");
  id v3 = [v4 window];
  [v3 makeKeyWindow];

  id v11 = -[TVCRDServiceLoadingViewController view](v13, "view");
  [v11 setAlpha:0.0];
  id v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = sub_1000044D4;
  id v9 = &unk_100008348;
  id v10 = v11;
  +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  0.1);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)viewServiceEndPresentationWithOptions:(id)a3 completion:(id)a4
{
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v17 = 0LL;
  objc_storeStrong(&v17, a4);
  id v11 = _NSConcreteStackBlock;
  int v12 = -1073741824;
  int v13 = 0;
  id v14 = sub_100004664;
  id v15 = &unk_100008348;
  v16 = v19;
  id v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = sub_1000046B4;
  id v9 = &unk_100008398;
  id v10 = v17;
  +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  &v11,  0.1);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong((id *)&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(location, 0LL);
}

+ (id)_exportedInterface
{
  v16[2] = a1;
  v16[1] = (id)a2;
  id v10 = v16;
  v16[0] =  +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServicePresenter);
  int v6 = &OBJC_CLASS___NSSet;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  id v11 = 0LL;
  v2 =  +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v5,  v4,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
  location = (id *)&v15;
  id v15 = v2;
  id v14 = "viewServiceBeginPresentationWithOptions:";
  uint64_t v7 = 0LL;
  int v8 = 0;
  objc_msgSend(v16[0], "setClasses:forSelector:argumentIndex:ofReply:", v2, "viewServiceBeginPresentationWithOptions:");
  int v13 = "viewServiceEndPresentationWithOptions:completion:";
  [v16[0] setClasses:v15 forSelector:"viewServiceEndPresentationWithOptions:completion:" argumentIndex:v7 ofReply:v8 & 1];
  id v12 = v16[0];
  objc_storeStrong(location, v11);
  objc_storeStrong(v10, v11);
  return v12;
}

+ (id)_remoteViewControllerInterface
{
  v11[2] = a1;
  v11[1] = (id)a2;
  int v6 = v11;
  v11[0] =  +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PBSViewServiceInterface);
  uint64_t v4 = &OBJC_CLASS___NSSet;
  id obj = 0LL;
  v2 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSNumber), 0LL);
  location = (id *)&v10;
  id v10 = v2;
  id v9 = "dismissWithResult:";
  [v11[0] setClasses:v2 forSelector:"dismissWithResult:" argumentIndex:0 ofReply:0];
  id v8 = v11[0];
  objc_storeStrong(location, obj);
  objc_storeStrong(v6, obj);
  return v8;
}

- (void)_menuPressed:(id)a3
{
  uint64_t v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = -[TVCRDServiceLoadingViewController _remoteViewControllerProxy](v5, "_remoteViewControllerProxy");
  [v3 dismissWithResult:&__kCFBooleanTrue];
  objc_storeStrong(&v3, 0LL);
  objc_storeStrong(location, 0LL);
}

@end
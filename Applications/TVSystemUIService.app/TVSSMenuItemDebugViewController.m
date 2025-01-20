@interface TVSSMenuItemDebugViewController
- (id)_debugContents;
- (id)_debugHostViews;
- (void)viewDidLoad;
@end

@implementation TVSSMenuItemDebugViewController

- (void)viewDidLoad
{
  v20 = self;
  SEL v19 = a2;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TVSSMenuItemDebugViewController;
  -[TVSSMenuItemDebugViewController viewDidLoad](&v18, "viewDidLoad");
  id v17 = -[TVSSMenuItemDebugViewController view](v20, "view");
  id v5 = v17;
  v6 = +[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor");
  objc_msgSend(v5, "setBackgroundColor:");

  id v16 = -[TVSSMenuItemDebugViewController _debugHostViews](v20, "_debugHostViews");
  v2 = objc_alloc(&OBJC_CLASS___UIStackView);
  v3 = -[UIStackView initWithArrangedSubviews:](v2, "initWithArrangedSubviews:", v16);
  menuItemStackView = v20->_menuItemStackView;
  v20->_menuItemStackView = v3;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:]( v20->_menuItemStackView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[UIStackView setDistribution:](v20->_menuItemStackView, "setDistribution:");
  -[UIStackView setAlignment:](v20->_menuItemStackView, "setAlignment:", 3LL);
  -[UIStackView setSpacing:](v20->_menuItemStackView, "setSpacing:", 10.0);
  -[UIStackView setAlignment:](v20->_menuItemStackView, "setAlignment:", 3LL);
  [v17 addSubview:v20->_menuItemStackView];
  id v7 = -[TVSSMenuItemDebugViewController view](v20, "view");
  id v15 = [v7 safeAreaLayoutGuide];

  id v14 = -[UIStackView leadingAnchor](v20->_menuItemStackView, "leadingAnchor");
  id v13 = [v15 leadingAnchor];
  id v12 = objc_msgSend(v14, "constraintEqualToAnchor:");
  v21[0] = v12;
  id v11 = -[UIStackView topAnchor](v20->_menuItemStackView, "topAnchor");
  id v10 = [v15 topAnchor];
  id v9 = objc_msgSend(v11, "constraintEqualToAnchor:");
  v21[1] = v9;
  v8 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 2LL);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
}

- (id)_debugHostViews
{
  v22 = self;
  v21[1] = (id)a2;
  v21[0] = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  memset(__b, 0, sizeof(__b));
  id obj = -[TVSSMenuItemDebugViewController _debugContents](v22, "_debugContents");
  id v16 = [obj countByEnumeratingWithState:__b objects:v23 count:16];
  if (v16)
  {
    uint64_t v12 = *(void *)__b[2];
    uint64_t v13 = 0LL;
    id v14 = v16;
    while (1)
    {
      uint64_t v11 = v13;
      if (*(void *)__b[2] != v12) {
        objc_enumerationMutation(obj);
      }
      uint64_t v20 = *(void *)(__b[1] + 8 * v13);
      id v5 = objc_alloc(&OBJC_CLASS___TVSSMenuItem);
      id v7 = +[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID");
      v6 = -[NSUUID UUIDString](v7, "UUIDString");
      objc_super v18 = -[TVSSMenuItem initWithIdentifier:](v5, "initWithIdentifier:");

      -[TVSSMenuItem setVisualContent:](v18, "setVisualContent:", v20);
      v2 = objc_alloc(&OBJC_CLASS___TVSSMenuItemHostView);
      id v17 = -[TVSSMenuItemHostView initWithItem:](v2, "initWithItem:", v18);
      id v9 = -[TVSSMenuItemHostView layer](v17, "layer");
      v8 = +[UIColor cyanColor](&OBJC_CLASS___UIColor, "cyanColor");
      objc_msgSend(v9, "setBorderColor:", -[UIColor CGColor](v8, "CGColor"));

      id v10 = -[TVSSMenuItemHostView layer](v17, "layer");
      [v10 setBorderWidth:2.0];

      [v21[0] addObject:v17];
      objc_storeStrong((id *)&v17, 0LL);
      objc_storeStrong((id *)&v18, 0LL);
      ++v13;
      if (v11 + 1 >= (unint64_t)v14)
      {
        uint64_t v13 = 0LL;
        id v14 = [obj countByEnumeratingWithState:__b objects:v23 count:16];
        if (!v14) {
          break;
        }
      }
    }
  }

  id v4 = [v21[0] copy];
  objc_storeStrong(v21, 0LL);
  return v4;
}

- (id)_debugContents
{
  v47[2] = self;
  v47[1] = (id)a2;
  v47[0] = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v13 = objc_alloc(&OBJC_CLASS___UIGraphicsImageRenderer);
  sub_1000A4CB4();
  v45[1] = v2;
  v45[2] = v3;
  v46 = -[UIGraphicsImageRenderer initWithSize:](v13, "initWithSize:", *(double *)&v2, *(double *)&v3);
  id v14 = v46;
  v39[1] = _NSConcreteStackBlock;
  int v40 = -1073741824;
  int v41 = 0;
  v42 = sub_1000A4CE0;
  v43 = &unk_1001B9920;
  v44 = v46;
  v45[0] = -[UIGraphicsImageRenderer imageWithActions:](v14, "imageWithActions:");
  id v15 = v47[0];
  id v4 = objc_alloc(&OBJC_CLASS___TVSSImageContent);
  id v16 = -[TVSSImageContent initWithImage:](v4, "initWithImage:", v45[0]);
  objc_msgSend(v15, "addObject:");

  objc_storeStrong(v45, 0LL);
  objc_storeStrong((id *)&v44, 0LL);
  objc_storeStrong((id *)&v46, 0LL);
  v39[0] = objc_alloc_init(&OBJC_CLASS___TVSSExampleContent);
  [v39[0] setName:@"DBG"];
  [v39[0] setCounter:42];
  [v47[0] addObject:v39[0]];
  objc_storeStrong(v39, 0LL);
  v38 = objc_alloc_init(&OBJC_CLASS___TVSSClockContent);
  [v47[0] addObject:v38];
  objc_storeStrong((id *)&v38, 0LL);
  v37 = objc_alloc_init(&OBJC_CLASS___NSPersonNameComponents);
  -[NSPersonNameComponents setGivenName:](v37, "setGivenName:", @"Bobby");
  -[NSPersonNameComponents setFamilyName:](v37, "setFamilyName:", @"Charlton");
  +[TVSSUserImageContent defaultUserImageDiameter](&OBJC_CLASS___TVSSUserImageContent, "defaultUserImageDiameter");
  +[TVSSUserImageContent defaultUserImageDiameter](&OBJC_CLASS___TVSSUserImageContent, "defaultUserImageDiameter");
  sub_1000A4EB0();
  *(void *)&__int128 v35 = v5;
  *((void *)&v35 + 1) = v6;
  *(void *)&__int128 v36 = v7;
  *((void *)&v36 + 1) = v8;
  SEL v19 = objc_alloc(&OBJC_CLASS___UIColor);
  double v17 = (double)(arc4random() % 0x100) / 256.0;
  double v18 = (double)(arc4random() % 0x100) / 256.0;
  v34 = -[UIColor initWithRed:green:blue:alpha:]( v19,  "initWithRed:green:blue:alpha:",  v17,  v18,  (double)(arc4random() % 0x100) / 256.0,  1.0);
  id v33 =  +[UIGraphicsImageRendererFormat preferredFormat]( &OBJC_CLASS___UIGraphicsImageRendererFormat,  "preferredFormat");
  [v33 setOpaque:1];
  id v9 = objc_alloc(&OBJC_CLASS___UIGraphicsImageRenderer);
  v32 = -[UIGraphicsImageRenderer initWithSize:format:](v9, "initWithSize:format:", v33, v36);
  uint64_t v20 = v32;
  v23[1] = _NSConcreteStackBlock;
  int v24 = -1073741824;
  int v25 = 0;
  v26 = sub_1000A4EFC;
  v27 = &unk_1001B64F8;
  v28 = v34;
  __int128 v29 = v35;
  __int128 v30 = v36;
  v31 = -[UIGraphicsImageRenderer imageWithActions:](v20, "imageWithActions:");
  id v10 = objc_alloc(&OBJC_CLASS___TVSSUserImageContent);
  v23[0] = -[TVSSUserImageContent initWithUserImage:personNameComponents:]( v10,  "initWithUserImage:personNameComponents:",  v31,  v37);
  [v47[0] addObject:v23[0]];
  uint64_t v11 = objc_alloc(&OBJC_CLASS___TVSSUserImageContent);
  v22 = -[TVSSUserImageContent initWithUserImage:personNameComponents:]( v11,  "initWithUserImage:personNameComponents:",  0LL,  v37);
  [v47[0] addObject:v22];
  objc_storeStrong((id *)&v22, 0LL);
  objc_storeStrong(v23, 0LL);
  objc_storeStrong((id *)&v31, 0LL);
  objc_storeStrong((id *)&v28, 0LL);
  objc_storeStrong((id *)&v32, 0LL);
  objc_storeStrong(&v33, 0LL);
  objc_storeStrong((id *)&v34, 0LL);
  objc_storeStrong((id *)&v37, 0LL);
  id v21 = [v47[0] copy];
  objc_storeStrong(v47, 0LL);
  return v21;
}

  ;
}

- (void).cxx_destruct
{
}

@end
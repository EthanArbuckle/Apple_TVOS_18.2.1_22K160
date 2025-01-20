@interface TVSSProfilePictureRenderer
+ (id)monogramViewConfigurationForDiameter:(double)a3;
+ (id)rendererWithIdentifier:(id)a3 sugestedUser:(id)a4;
+ (id)rendererWithIdentifier:(id)a3 user:(id)a4;
- (BOOL)wantsFloatingContentView;
- (TVSSProfilePictureRenderer)initWithIdentifier:(id)a3 format:(int64_t)a4 content:(id)a5 overrideStylings:(id)a6;
- (TVSSUser)user;
- (TVSUIProfilePictureMonogramView)profilePictureView;
- (void)applyContent:(id)a3 animator:(id)a4;
- (void)configureContentView:(id)a3;
@end

@implementation TVSSProfilePictureRenderer

+ (id)rendererWithIdentifier:(id)a3 user:(id)a4
{
  Class v10 = (Class)a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = 0LL;
  objc_storeStrong(&v8, a4);
  id v4 = objc_alloc(v10);
  id v7 = [v4 initWithIdentifier:location[0] format:0 content:v8 overrideStylings:&__NSArray0__struct];
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
  return v7;
}

+ (id)rendererWithIdentifier:(id)a3 sugestedUser:(id)a4
{
  Class v10 = (Class)a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = 0LL;
  objc_storeStrong(&v8, a4);
  id v4 = objc_alloc(v10);
  id v7 = [v4 initWithIdentifier:location[0] format:0 content:v8 overrideStylings:&__NSArray0__struct];
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
  return v7;
}

- (TVSSProfilePictureRenderer)initWithIdentifier:(id)a3 format:(int64_t)a4 content:(id)a5 overrideStylings:(id)a6
{
  v24 = self;
  SEL v23 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  v21[1] = (id)a4;
  v21[0] = 0LL;
  objc_storeStrong(v21, a5);
  id v20 = 0LL;
  objc_storeStrong(&v20, a6);
  v6 = v24;
  v24 = 0LL;
  v19.receiver = v6;
  v19.super_class = (Class)&OBJC_CLASS___TVSSProfilePictureRenderer;
  v18 = -[TVSSProfilePictureRenderer initWithIdentifier:format:content:overrideStylings:]( &v19,  "initWithIdentifier:format:content:overrideStylings:",  location,  0LL,  v21[0],  v20);
  v24 = v18;
  objc_storeStrong((id *)&v24, v18);
  if (v18)
  {
    id v13 = v21[0];
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___TVSSUser);
    char isKindOfClass = 1;
    if ((objc_opt_isKindOfClass(v13, v7) & 1) == 0)
    {
      id v12 = v21[0];
      uint64_t v8 = objc_opt_class(&OBJC_CLASS___TVSSSuggestedUser);
      char isKindOfClass = objc_opt_isKindOfClass(v12, v8);
    }

    if (((isKindOfClass ^ 1) & 1) != 0)
    {
      v11 = +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler");
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( v11,  "handleFailureInMethod:object:file:lineNumber:description:",  v23,  v24,  @"TVSSProfilePictureRenderer.m",  37LL,  @"Expecting a TVSSUser");
    }

    objc_storeStrong((id *)&v24->_user, v21[0]);
  }

  Class v10 = v24;
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(v21, 0LL);
  objc_storeStrong(&location, 0LL);
  objc_storeStrong((id *)&v24, 0LL);
  return v10;
}

- (void)configureContentView:(id)a3
{
  v28 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v26.receiver = v28;
  v26.super_class = (Class)&OBJC_CLASS___TVSSProfilePictureRenderer;
  -[TVSSProfilePictureRenderer configureContentView:](&v26, "configureContentView:", location[0]);
  [location[0] setClipsToBounds:0];
  v18 = objc_alloc(&OBJC_CLASS___TVSUIProfilePictureMonogramView);
  id v19 = [(id)objc_opt_class(v28) monogramViewConfigurationForDiameter:133.0];
  v3 = -[TVSUIProfilePictureMonogramView initWithConfiguration:](v18, "initWithConfiguration:");
  profilePictureView = v28->_profilePictureView;
  v28->_profilePictureView = v3;

  -[TVSUIProfilePictureMonogramView setTranslatesAutoresizingMaskIntoConstraints:]( v28->_profilePictureView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  id v20 = v28->_profilePictureView;
  v21 = -[TVSSUser personNameComponents](v28->_user, "personNameComponents");
  -[TVSUIProfilePictureMonogramView setPersonNameComponents:](v20, "setPersonNameComponents:");

  v22 = v28->_profilePictureView;
  SEL v23 = -[TVSSUser image](v28->_user, "image");
  -[TVSUIProfilePictureMonogramView setImage:](v22, "setImage:");

  v24 = v28->_profilePictureView;
  v25 = -[TVSSUser formattedShortName](v28->_user, "formattedShortName");
  -[TVSUIProfilePictureMonogramView setDisplayName:](v24, "setDisplayName:");

  if (-[TVSSUser isCurrentUser](v28->_user, "isCurrentUser"))
  {
    -[TVSUIProfilePictureMonogramView setBadgeStyle:](v28->_profilePictureView, "setBadgeStyle:", 1LL);
  }

  else if (-[TVSSUser isSuggestedUser](v28->_user, "isSuggestedUser"))
  {
    -[TVSUIProfilePictureMonogramView setBadgeStyle:](v28->_profilePictureView, "setBadgeStyle:", 2LL);
  }

  else
  {
    -[TVSUIProfilePictureMonogramView setBadgeStyle:](v28->_profilePictureView, "setBadgeStyle:", 0LL);
  }

  [location[0] addSubview:v28->_profilePictureView];
  id v17 = -[TVSUIProfilePictureMonogramView topAnchor](v28->_profilePictureView, "topAnchor");
  id v16 = [location[0] topAnchor];
  id v15 = objc_msgSend(v17, "constraintEqualToAnchor:");
  v29[0] = v15;
  id v14 = -[TVSUIProfilePictureMonogramView leadingAnchor](v28->_profilePictureView, "leadingAnchor");
  id v13 = [location[0] leadingAnchor];
  id v12 = objc_msgSend(v14, "constraintEqualToAnchor:");
  v29[1] = v12;
  id v11 = -[TVSUIProfilePictureMonogramView trailingAnchor](v28->_profilePictureView, "trailingAnchor");
  id v10 = [location[0] trailingAnchor];
  id v9 = objc_msgSend(v11, "constraintEqualToAnchor:");
  v29[2] = v9;
  id v8 = -[TVSUIProfilePictureMonogramView bottomAnchor](v28->_profilePictureView, "bottomAnchor");
  id v7 = [location[0] bottomAnchor];
  id v6 = objc_msgSend(v8, "constraintEqualToAnchor:");
  v29[3] = v6;
  v5 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 4LL);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

  objc_storeStrong(location, 0LL);
}

- (void)applyContent:(id)a3 animator:(id)a4
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  v11.receiver = v14;
  v11.super_class = (Class)&OBJC_CLASS___TVSSProfilePictureRenderer;
  -[TVSSProfilePictureRenderer applyContent:animator:](&v11, "applyContent:animator:", location[0], v12);
  profilePictureView = v14->_profilePictureView;
  id v6 = -[TVSSUser personNameComponents](v14->_user, "personNameComponents");
  -[TVSUIProfilePictureMonogramView setPersonNameComponents:](profilePictureView, "setPersonNameComponents:");

  id v7 = v14->_profilePictureView;
  id v8 = -[TVSSUser image](v14->_user, "image");
  -[TVSUIProfilePictureMonogramView setImage:](v7, "setImage:");

  id v9 = v14->_profilePictureView;
  id v10 = -[TVSSUser formattedShortName](v14->_user, "formattedShortName");
  -[TVSUIProfilePictureMonogramView setDisplayName:](v9, "setDisplayName:");

  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
}

+ (id)monogramViewConfigurationForDiameter:(double)a3
{
  id v15 = a1;
  SEL v14 = a2;
  double v13 = a3;
  id v12 = objc_alloc_init(&OBJC_CLASS___TVSUIProfilePictureMonogramViewConfiguration);
  [v12 setMonogramDiameter:v13];
  [v12 setFocusSizeIncrease:20.0];
  [v12 setBadgeSize:34.0];
  id v6 = v12;
  sub_10000EF40();
  objc_msgSend(v6, "setBadgeOffset:", v3, v4);
  id v7 = v12;
  id v8 = +[TVSPConstants fontForTextStyle:](&OBJC_CLASS___TVSPConstants, "fontForTextStyle:", 6LL);
  objc_msgSend(v7, "setDisplayNameFont:");

  id v9 = v12;
  id v10 = +[UIColor colorWithDynamicProvider:](&OBJC_CLASS___UIColor, "colorWithDynamicProvider:", &stru_1001B6200);
  objc_msgSend(v9, "setDisplayNameTextColor:");

  [v12 setDisplayNameOffset:37.0];
  id v11 = v12;
  objc_storeStrong(&v12, 0LL);
  return v11;
}

  ;
}

- (BOOL)wantsFloatingContentView
{
  return 0;
}

- (TVSSUser)user
{
  return self->_user;
}

- (TVSUIProfilePictureMonogramView)profilePictureView
{
  return self->_profilePictureView;
}

- (void).cxx_destruct
{
}

@end
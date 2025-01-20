@interface TVSSProfilePanelNoUserPlatterController
+ (id)layoutForNoUser;
+ (id)rendererForIdentifier:(id)a3;
- (TVSSProfilePanelNoUserPlatterController)initWithIdentifier:(id)a3;
- (void)rendererWasSelected:(id)a3 context:(id)a4;
@end

@implementation TVSSProfilePanelNoUserPlatterController

- (TVSSProfilePanelNoUserPlatterController)initWithIdentifier:(id)a3
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = [(id)objc_opt_class(v10) layoutForNoUser];
  id v7 = &__NSArray0__struct;
  v3 = v10;
  v10 = 0LL;
  v6.receiver = v3;
  v6.super_class = (Class)&OBJC_CLASS___TVSSProfilePanelNoUserPlatterController;
  v10 = -[TVSSProfilePanelNoUserPlatterController initWithIdentifier:layout:renderers:rendererProvider:]( &v6,  "initWithIdentifier:layout:renderers:rendererProvider:",  location[0],  v8,  v7,  &stru_1001BAC48);
  objc_storeStrong((id *)&v10, v10);
  v5 = v10;
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v10, 0LL);
  return v5;
}

+ (id)layoutForNoUser
{
  id v15 = a1;
  v14[1] = (id)a2;
  v14[0] = +[TVSPRow rowWithIdentifier:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:");
  id v13 = +[TVSPRow spacerWithHeight:](&OBJC_CLASS___TVSPRow, "spacerWithHeight:");
  +[TVSPConstants shortRowHeight](&OBJC_CLASS___TVSPConstants, "shortRowHeight");
  v12 = +[TVSPRow rowWithIdentifier:height:](&OBJC_CLASS___TVSPRow, "rowWithIdentifier:height:");
  id v11 = [v15 rendererForIdentifier:@"NO_USER"];
  id v10 = [v15 rendererForIdentifier:@"SIGN_IN"];
  v17[0] = v14[0];
  v17[1] = v13;
  v17[2] = v12;
  id v7 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 3LL);
  v16[0] = v11;
  v16[1] = v10;
  objc_super v6 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 2LL);
  v9 = +[TVSPLayout layoutWithRows:sizeProviders:](&OBJC_CLASS___TVSPLayout, "layoutWithRows:sizeProviders:", v7);

  -[TVSPLayout contentInsets](v9, "contentInsets");
  -[TVSPLayout setContentInsets:](v9, "setContentInsets:", 32.0, v2, v3, v4);
  id v8 = v9;
  objc_storeStrong((id *)&v9, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong((id *)&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(v14, 0LL);
  return v8;
}

+ (id)rendererForIdentifier:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v17 = 0LL;
  if ([location[0] isEqualToString:@"NO_USER"])
  {
    v14 = +[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"NoUserAvatarCloud");
    id v13 = TVSSLocString(@"TVSSProfileNoUserTitle");
    v16 = +[TVSPContent contentWithTitle:image:text1:](&OBJC_CLASS___TVSPContent, "contentWithTitle:image:text1:");

    id v15 = TVSSLocString(@"TVSSProfileNoUserInfo");
    -[TVSPContent setContentText2:](v16, "setContentText2:");

    double v3 = objc_alloc(&OBJC_CLASS___TVSSProfilePanelNoUserRenderer);
    double v4 = -[TVSSProfilePanelNoUserRenderer initWithIdentifier:content:]( v3,  "initWithIdentifier:content:",  @"NO_USER",  v16);
    v5 = v17;
    v17 = (TVSPRenderer *)v4;

    objc_storeStrong((id *)&v16, 0LL);
  }

  else if ([location[0] isEqualToString:@"SIGN_IN"])
  {
    id v10 = location[0];
    id v12 = TVSSLocString(@"TVSSProfileSignInTitle");
    id v11 = +[TVSPContent contentWithTitle:](&OBJC_CLASS___TVSPContent, "contentWithTitle:");
    objc_super v6 =  +[TVSPRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSPRenderer,  "rendererWithIdentifier:format:content:",  v10,  15LL);
    id v7 = v17;
    v17 = v6;
  }

  v9 = v17;
  objc_storeStrong((id *)&v17, 0LL);
  objc_storeStrong(location, 0LL);
  return v9;
}

- (void)rendererWasSelected:(id)a3 context:(id)a4
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v9 = 0LL;
  objc_storeStrong(&v9, a4);
  v8.receiver = v11;
  v8.super_class = (Class)&OBJC_CLASS___TVSSProfilePanelNoUserPlatterController;
  -[TVSSProfilePanelNoUserPlatterController rendererWasSelected:context:]( &v8,  "rendererWasSelected:context:",  location[0],  v9);
  id v7 = [location[0] identifier];
  if ([v7 isEqualToString:@"SIGN_IN"])
  {
    objc_super v6 = +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"prefs:root=NEW_USER");
    id v4 = +[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace");
    objc_msgSend(v4, "openSensitiveURL:withOptions:", v6);

    [v9 dismissSystemMenuWithSourceIdentifier:v7];
    objc_storeStrong((id *)&v6, 0LL);
  }

  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(location, 0LL);
}

@end
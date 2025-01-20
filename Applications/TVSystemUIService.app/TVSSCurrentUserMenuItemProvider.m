@interface TVSSCurrentUserMenuItemProvider
- (BOOL)shouldShowMenuItem;
- (BOOL)updateVisualContentForMenuItem:(id)a3;
- (TVSSCurrentUserMenuItemProvider)init;
- (TVSSCurrentUserMenuItemProvider)initWithCurrentUserController:(id)a3;
- (id)_userImageContent;
- (id)log;
- (id)newMenuItem;
- (void)currentUserControllerDidUpdate:(id)a3;
- (void)dealloc;
- (void)updateMenuItemWithReason:(id)a3;
- (void)user:(id)a3 didChangeImage:(id)a4;
- (void)user:(id)a3 didChangePersonNameComponents:(id)a4;
@end

@implementation TVSSCurrentUserMenuItemProvider

- (TVSSCurrentUserMenuItemProvider)init
{
  v7 = self;
  v6[1] = (id)a2;
  v4 = objc_alloc(&OBJC_CLASS___TVSSCurrentUserController);
  +[TVSSUserImageContent defaultUserImageDiameter](&OBJC_CLASS___TVSSUserImageContent, "defaultUserImageDiameter");
  v6[0] = -[TVSSCurrentUserController initWithUserImageDiameter:](v4, "initWithUserImageDiameter:");
  v2 = v7;
  v7 = 0LL;
  v7 = -[TVSSCurrentUserMenuItemProvider initWithCurrentUserController:](v2, "initWithCurrentUserController:", v6[0]);
  v5 = v7;
  objc_storeStrong(v6, 0LL);
  objc_storeStrong((id *)&v7, 0LL);
  return v5;
}

- (TVSSCurrentUserMenuItemProvider)initWithCurrentUserController:(id)a3
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v10;
  v10 = 0LL;
  v8.receiver = v3;
  v8.super_class = (Class)&OBJC_CLASS___TVSSCurrentUserMenuItemProvider;
  v10 = -[TVSSMenuItemProvider initWithIdentifier:]( &v8,  "initWithIdentifier:",  @"com.apple.TVSystemUIService.currentUser.provider");
  objc_storeStrong((id *)&v10, v10);
  if (v10)
  {
    objc_storeStrong((id *)&v10->_currentUserController, location[0]);
    -[TVSSCurrentUserController addObserver:](v10->_currentUserController, "addObserver:", v10);
    v4 = -[TVSSCurrentUserController currentUser](v10->_currentUserController, "currentUser");
    currentUser = v10->_currentUser;
    v10->_currentUser = v4;

    -[TVSSUser addObserver:](v10->_currentUser, "addObserver:", v10);
    -[TVSSCurrentUserMenuItemProvider updateMenuItemWithReason:]( v10,  "updateMenuItemWithReason:",  @"Initial update");
  }

  v7 = v10;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v10, 0LL);
  return v7;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[TVSSCurrentUserController removeObserver:](self->_currentUserController, "removeObserver:", self);
  -[TVSSUser removeObserver:](v4->_currentUser, "removeObserver:", v4);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSCurrentUserMenuItemProvider;
  -[TVSSCurrentUserMenuItemProvider dealloc](&v2, "dealloc");
}

- (void)currentUserControllerDidUpdate:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSCurrentUserMenuItemProvider updateMenuItemWithReason:]( v4,  "updateMenuItemWithReason:",  @"Current user has changed");
  objc_storeStrong(location, 0LL);
}

- (void)user:(id)a3 didChangePersonNameComponents:(id)a4
{
  objc_super v8 = (uint64_t *)self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = 0LL;
  objc_storeStrong(&v6, a4);
  if ((id)v8[5] == location[0])
  {
    [v8 updateCurrentMenuItemVisualContentWithReason:@"Current user name components have changed"];
  }

  else
  {
    os_log_t oslog = (os_log_t)[v8 log];
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_100047398( (uint64_t)v9,  (uint64_t)"-[TVSSCurrentUserMenuItemProvider user:didChangePersonNameComponents:]",  (uint64_t)location[0],  v8[5]);
      _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "%s: A users name components have changed but the user is no longer the selected user. Will ignore. user=%@, currentUser=%@",  v9,  0x20u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
  }

  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)user:(id)a3 didChangeImage:(id)a4
{
  objc_super v8 = (uint64_t *)self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = 0LL;
  objc_storeStrong(&v6, a4);
  if ((id)v8[5] == location[0])
  {
    [v8 updateCurrentMenuItemVisualContentWithReason:@"Current user image have changed"];
  }

  else
  {
    os_log_t oslog = (os_log_t)[v8 log];
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_100047398( (uint64_t)v9,  (uint64_t)"-[TVSSCurrentUserMenuItemProvider user:didChangeImage:]",  (uint64_t)location[0],  v8[5]);
      _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "%s: A users image has changed but the user is no longer the selected user. Will ignore. user=%@, currentUser=%@",  v9,  0x20u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
  }

  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
}

- (BOOL)shouldShowMenuItem
{
  return 1;
}

- (id)newMenuItem
{
  id v6 = self;
  v5[1] = (id)a2;
  v5[0] = -[TVSSMenuItem initWithIdentifier:hasFocusableContent:platterViewControllerClass:]( objc_alloc(&OBJC_CLASS___TVSSMenuItem),  "initWithIdentifier:hasFocusableContent:platterViewControllerClass:",  @"com.apple.TVSystemUIService.currentUser.item",  1LL,  objc_opt_class(&OBJC_CLASS___TVSSProfilePanelViewController));
  id v4 = -[TVSSCurrentUserMenuItemProvider _userImageContent](v6, "_userImageContent");
  [v5[0] setVisualContent:v4];
  id v3 = v5[0];
  objc_storeStrong(&v4, 0LL);
  objc_storeStrong(v5, 0LL);
  return v3;
}

- (id)log
{
  id v4 = (dispatch_once_t *)&unk_100221E10;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001BB520);
  if (*v4 != -1) {
    dispatch_once(v4, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221E08;
}

- (BOOL)updateVisualContentForMenuItem:(id)a3
{
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  char v18 = 0;
  id v6 = [location[0] visualContent];
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVSSUserImageContent);
  id v7 = sub_100115070(v6, v3);

  id v16 = v7;
  id v17 = v7;
  objc_super v8 = -[TVSSUser image](v20->_currentUser, "image");
  v9 = (UIImage *)[v7 userImage];
  char v14 = 0;
  char v12 = 0;
  LOBYTE(v10) = 1;
  if (v8 == v9)
  {
    v15 = -[TVSSUser personNameComponents](v20->_currentUser, "personNameComponents");
    char v14 = 1;
    id v13 = [v17 personNameComponents];
    char v12 = 1;
    unsigned int v10 = -[NSPersonNameComponents isEqual:](v15, "isEqual:") ^ 1;
  }

  if ((v12 & 1) != 0) {

  }
  if ((v14 & 1) != 0) {
  if ((v10 & 1) != 0)
  }
  {
    id v11 = -[TVSSCurrentUserMenuItemProvider _userImageContent](v20, "_userImageContent");
    [location[0] setVisualContent:v11];
    char v18 = 1;
    objc_storeStrong(&v11, 0LL);
  }

  char v5 = v18;
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(location, 0LL);
  return v5 & 1;
}

- (void)updateMenuItemWithReason:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSUser removeObserver:](v7->_currentUser, "removeObserver:", v7);
  uint64_t v3 = -[TVSSCurrentUserController currentUser](v7->_currentUserController, "currentUser");
  currentUser = v7->_currentUser;
  v7->_currentUser = v3;

  -[TVSSUser addObserver:](v7->_currentUser, "addObserver:", v7);
  v5.receiver = v7;
  v5.super_class = (Class)&OBJC_CLASS___TVSSCurrentUserMenuItemProvider;
  -[TVSSSimpleMenuItemProvider updateMenuItemWithReason:](&v5, "updateMenuItemWithReason:", location[0]);
  objc_storeStrong(location, 0LL);
}

- (id)_userImageContent
{
  v21 = self;
  v20[1] = (id)a2;
  char v18 = 0;
  char v16 = 0;
  char v14 = 0;
  char v12 = 0;
  char v10 = 0;
  char v8 = 0;
  if (self->_currentUser)
  {
    v19 = -[TVSSUser image](v21->_currentUser, "image");
    char v18 = 1;
    objc_super v2 = v19;
  }

  else
  {
    id v17 = +[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor");
    char v16 = 1;
    v22[0] = v17;
    v15 = +[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor");
    char v14 = 1;
    v22[1] = v15;
    id v13 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL);
    char v12 = 1;
    id v11 =  +[UIImageSymbolConfiguration configurationWithPaletteColors:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithPaletteColors:");
    char v10 = 1;
    id v9 =  +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"person.crop.circle.fill");
    char v8 = 1;
    objc_super v2 = (UIImage *)v9;
  }

  v20[0] = v2;
  if ((v8 & 1) != 0) {

  }
  if ((v10 & 1) != 0) {
  if ((v12 & 1) != 0)
  }

  if ((v14 & 1) != 0) {
  if ((v16 & 1) != 0)
  }

  if ((v18 & 1) != 0) {
  objc_super v5 = objc_alloc(&OBJC_CLASS___TVSSUserImageContent);
  }
  id v4 = v20[0];
  id v6 = -[TVSSUser personNameComponents](v21->_currentUser, "personNameComponents");
  id v7 = -[TVSSUserImageContent initWithUserImage:personNameComponents:]( v5,  "initWithUserImage:personNameComponents:",  v4);

  objc_storeStrong(v20, 0LL);
  return v7;
}

- (void).cxx_destruct
{
}

@end
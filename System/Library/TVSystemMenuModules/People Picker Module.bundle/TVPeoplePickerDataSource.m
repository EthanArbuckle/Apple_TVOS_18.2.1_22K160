@interface TVPeoplePickerDataSource
- (BOOL)canShowAddNewUserOption;
- (NSArray)profilePictureObservers;
- (NSArray)suggestedProfilePictureObservers;
- (NSArray)suggestedUsers;
- (NSArray)users;
- (PBSSuggestedUserProfileManager)suggestedUserProfileManager;
- (TVPeoplePickerDataSource)init;
- (TVPeoplePickerUser)currentUser;
- (TVSUIUserProfilePictureService)profilePictureService;
- (int64_t)currentUserIndex;
- (void)_fetchProfilePhotosForSingedInUsers;
- (void)_fetchProfilePhotosForSuggestedUsers;
- (void)_fetchUsersWaitUntilDone:(BOOL)a3;
- (void)_updateSuggestedUsersWaitUntilDone:(BOOL)a3;
- (void)dealloc;
- (void)setCurrentUser:(id)a3;
- (void)setCurrentUserIndex:(int64_t)a3;
- (void)setProfilePictureObservers:(id)a3;
- (void)setProfilePictureService:(id)a3;
- (void)setSuggestedProfilePictureObservers:(id)a3;
- (void)setSuggestedUserProfileManager:(id)a3;
- (void)suggestedUserProfileManagerDidUpdate:(id)a3;
- (void)userProfileManagerDidUpdate:(id)a3;
@end

@implementation TVPeoplePickerDataSource

- (TVPeoplePickerDataSource)init
{
  SEL v13 = a2;
  v14 = 0LL;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVPeoplePickerDataSource;
  v11 = -[TVPeoplePickerDataSource init](&v12, "init");
  v14 = v11;
  objc_storeStrong((id *)&v14, v11);
  if (v11)
  {
    v9 = objc_alloc(&OBJC_CLASS___TVSUIUserProfilePictureService);
    sub_6374();
    v3 = -[TVSUIUserProfilePictureService initWithProfilePictureDiameter:](v9, "initWithProfilePictureDiameter:", v2);
    profilePictureService = v14->_profilePictureService;
    v14->_profilePictureService = v3;

    -[TVPeoplePickerDataSource _fetchUsersWaitUntilDone:](v14, "_fetchUsersWaitUntilDone:", 1LL);
    v10 = +[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance");
    -[PBSUserProfileManager addObserver:](v10, "addObserver:", v14);

    v5 = objc_alloc_init(&OBJC_CLASS___PBSSuggestedUserProfileManager);
    suggestedUserProfileManager = v14->_suggestedUserProfileManager;
    v14->_suggestedUserProfileManager = v5;

    -[TVPeoplePickerDataSource _updateSuggestedUsersWaitUntilDone:](v14, "_updateSuggestedUsersWaitUntilDone:", 1LL);
    -[PBSSuggestedUserProfileManager addObserver:](v14->_suggestedUserProfileManager, "addObserver:", v14);
  }

  v8 = v14;
  objc_storeStrong((id *)&v14, 0LL);
  return v8;
}

  ;
}

- (void)dealloc
{
  v5 = self;
  SEL v4 = a2;
  double v2 = +[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance");
  -[PBSUserProfileManager removeObserver:](v2, "removeObserver:", v5);

  -[PBSSuggestedUserProfileManager removeObserver:](v5->_suggestedUserProfileManager, "removeObserver:", v5);
  -[PBSSuggestedUserProfileManager invalidate](v5->_suggestedUserProfileManager, "invalidate");
  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS___TVPeoplePickerDataSource;
  -[TVPeoplePickerDataSource dealloc](&v3, "dealloc");
}

- (void)setCurrentUser:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v6->_currentUser, location[0]);
  SEL v4 = +[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance");
  id v3 = [location[0] identifier];
  -[PBSUserProfileManager selectUserProfileWithIdentifier:completionHandler:]( v4,  "selectUserProfileWithIdentifier:completionHandler:");

  objc_storeStrong(location, 0LL);
}

- (void)userProfileManagerDidUpdate:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)(id)people_picker_log();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    sub_67D4((uint64_t)v6, (uint64_t)location[0]);
    _os_log_impl( &dword_0,  oslog,  OS_LOG_TYPE_INFO,  "UserProfileManager did update. {userProfileManager_ptr=%p}",  v6,  0xCu);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  -[TVPeoplePickerDataSource _fetchUsersWaitUntilDone:](v5, "_fetchUsersWaitUntilDone:", 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)suggestedUserProfileManagerDidUpdate:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = (id)people_picker_log();
  char v6 = 1;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_INFO))
  {
    log = (os_log_s *)v7;
    os_log_type_t type = v6;
    sub_68E0(v5);
    _os_log_impl(&dword_0, log, type, "SuggestedUserProfileManager did update", v5, 2u);
  }

  objc_storeStrong(&v7, 0LL);
  -[TVPeoplePickerDataSource _updateSuggestedUsersWaitUntilDone:](v9, "_updateSuggestedUsersWaitUntilDone:", 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_fetchUsersWaitUntilDone:(BOOL)a3
{
  v34 = self;
  SEL v33 = a2;
  BOOL v32 = a3;
  id location = (id)people_picker_log();
  os_log_type_t v30 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_INFO))
  {
    sub_6D64((uint64_t)v36, v32);
    _os_log_impl(&dword_0, (os_log_t)location, v30, "Fetching all users. {waitUntilDone=%{BOOL}d}", v36, 8u);
  }

  objc_storeStrong(&location, 0LL);
  id v29 = +[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance");
  id v28 = [v29 userProfilesSnapshot];
  id v27 = [v28 sortedUserProfileIdentifiers];
  id v26 = 0LL;
  id v25 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  memset(__b, 0, sizeof(__b));
  id obj = v27;
  id v10 = [obj countByEnumeratingWithState:__b objects:v35 count:16];
  if (v10)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0LL;
    id v8 = v10;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(obj);
      }
      uint64_t v24 = *(void *)(__b[1] + 8 * v7);
      id v22 = [v28 userProfileWithIdentifier:v24];
      id v3 = objc_alloc(&OBJC_CLASS___TVPeoplePickerUser);
      id v21 = -[TVPeoplePickerUser initWithUserProfile:](v3, "initWithUserProfile:", v22);
      [v25 addObject:v21];
      objc_storeStrong(&v21, 0LL);
      objc_storeStrong(&v22, 0LL);
      ++v7;
      if (v5 + 1 >= (unint64_t)v8)
      {
        uint64_t v7 = 0LL;
        id v8 = [obj countByEnumeratingWithState:__b objects:v35 count:16];
        if (!v8) {
          break;
        }
      }
    }
  }

  v11 = _NSConcreteStackBlock;
  int v12 = -1073741824;
  int v13 = 0;
  v14 = sub_6D9C;
  v15 = &unk_C668;
  v16 = v34;
  id v17 = v26;
  id v18 = v25;
  id v19 = v29;
  dispatch_block_t block = objc_retainBlock(&v11);
  if (v32)
  {
    (*((void (**)(void))block + 2))();
  }

  else
  {
    SEL v4 = &_dispatch_main_q;
    dispatch_async(v4, block);
  }

  objc_storeStrong(&block, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong((id *)&v16, 0LL);
  objc_storeStrong(&v25, 0LL);
  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(&v27, 0LL);
  objc_storeStrong(&v28, 0LL);
  objc_storeStrong(&v29, 0LL);
}

- (void)_updateSuggestedUsersWaitUntilDone:(BOOL)a3
{
  id v22 = self;
  SEL v21 = a2;
  BOOL v20 = a3;
  id location = (id)people_picker_log();
  char v18 = 1;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_INFO))
  {
    log = (os_log_s *)location;
    os_log_type_t type = v18;
    sub_68E0(v17);
    _os_log_impl(&dword_0, log, type, "Updating Suggested Users", v17, 2u);
  }

  objc_storeStrong(&location, 0LL);
  id v4 =  -[PBSSuggestedUserProfileManager suggestedUserProfileSnapshot]( v22->_suggestedUserProfileManager,  "suggestedUserProfileSnapshot");
  id v16 = [v4 activeSuggestedUserProfiles];

  id v15 = objc_msgSend(v16, "bs_map:", &stru_C6A8);
  uint64_t v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  id v10 = sub_7244;
  v11 = &unk_C6D0;
  int v12 = v22;
  id v13 = v15;
  id v14 = objc_retainBlock(&v7);
  if (v20)
  {
    (*((void (**)(void))v14 + 2))();
  }

  else
  {
    id v3 = &_dispatch_main_q;
    dispatch_async(v3, v14);
  }

  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong((id *)&v12, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
}

- (void)_fetchProfilePhotosForSingedInUsers
{
  uint64_t v24 = self;
  v23[1] = (id)a2;
  v23[0] = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  memset(__b, 0, sizeof(__b));
  id obj = v24->_users;
  id v12 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v25,  16LL);
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
      id v22 = *(id *)(__b[1] + 8 * v9);
      id v20 = [v22 identifier];
      id v19 =  -[TVSUIUserProfilePictureService profilePictureForUserWithIdentifier:]( v24->_profilePictureService,  "profilePictureForUserWithIdentifier:",  v20);
      id v4 = v22;
      id v5 = [v19 profileImage];
      objc_msgSend(v4, "setProfilePhoto:");

      id v6 = v19;
      id v13 = _NSConcreteStackBlock;
      int v14 = -1073741824;
      int v15 = 0;
      id v16 = sub_75F4;
      id v17 = &unk_C240;
      id v18 = v22;
      [v6 setImageUpdatedHandler:&v13];
      [v23[0] addObject:v19];
      objc_storeStrong(&v18, 0LL);
      objc_storeStrong(&v19, 0LL);
      objc_storeStrong(&v20, 0LL);
      ++v9;
      if (v7 + 1 >= (unint64_t)v10)
      {
        uint64_t v9 = 0LL;
        id v10 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v25,  16LL);
        if (!v10) {
          break;
        }
      }
    }
  }

  double v2 = (NSArray *)[v23[0] copy];
  profilePictureObservers = v24->_profilePictureObservers;
  v24->_profilePictureObservers = v2;

  objc_storeStrong(v23, 0LL);
}

- (void)_fetchProfilePhotosForSuggestedUsers
{
  uint64_t v24 = self;
  v23[1] = (id)a2;
  v23[0] = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  memset(__b, 0, sizeof(__b));
  id obj = v24->_suggestedUsers;
  id v12 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v25,  16LL);
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
      id v22 = *(id *)(__b[1] + 8 * v9);
      id v20 = [v22 altDSID];
      id v19 =  -[TVSUIUserProfilePictureService profilePictureForAccountWithAltDSID:]( v24->_profilePictureService,  "profilePictureForAccountWithAltDSID:",  v20);
      id v4 = v22;
      id v5 = [v19 profileImage];
      objc_msgSend(v4, "setProfileImage:");

      id v6 = v19;
      id v13 = _NSConcreteStackBlock;
      int v14 = -1073741824;
      int v15 = 0;
      id v16 = sub_793C;
      id v17 = &unk_C240;
      id v18 = v22;
      [v6 setImageUpdatedHandler:&v13];
      [v23[0] addObject:v19];
      objc_storeStrong(&v18, 0LL);
      objc_storeStrong(&v19, 0LL);
      objc_storeStrong(&v20, 0LL);
      ++v9;
      if (v7 + 1 >= (unint64_t)v10)
      {
        uint64_t v9 = 0LL;
        id v10 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v25,  16LL);
        if (!v10) {
          break;
        }
      }
    }
  }

  double v2 = (NSArray *)[v23[0] copy];
  suggestedProfilePictureObservers = v24->_suggestedProfilePictureObservers;
  v24->_suggestedProfilePictureObservers = v2;

  objc_storeStrong(v23, 0LL);
}

- (NSArray)users
{
  return self->_users;
}

- (NSArray)suggestedUsers
{
  return self->_suggestedUsers;
}

- (TVPeoplePickerUser)currentUser
{
  return self->_currentUser;
}

- (BOOL)canShowAddNewUserOption
{
  return self->_canShowAddNewUserOption;
}

- (int64_t)currentUserIndex
{
  return self->_currentUserIndex;
}

- (void)setCurrentUserIndex:(int64_t)a3
{
  self->_currentUserIndex = a3;
}

- (TVSUIUserProfilePictureService)profilePictureService
{
  return self->_profilePictureService;
}

- (void)setProfilePictureService:(id)a3
{
}

- (PBSSuggestedUserProfileManager)suggestedUserProfileManager
{
  return self->_suggestedUserProfileManager;
}

- (void)setSuggestedUserProfileManager:(id)a3
{
}

- (NSArray)profilePictureObservers
{
  return self->_profilePictureObservers;
}

- (void)setProfilePictureObservers:(id)a3
{
}

- (NSArray)suggestedProfilePictureObservers
{
  return self->_suggestedProfilePictureObservers;
}

- (void)setSuggestedProfilePictureObservers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface RPAppleTVDeviceInfoManager
- (BOOL)supportsFindMyRemote;
- (NSString)activeUserAltDSID;
- (OS_dispatch_queue)dispatchQueue;
- (PBSUserProfile)selectedUserProfile;
- (PBSUserProfileManager)userProfileManager;
- (RPAppleTVDeviceInfoManager)init;
- (RPAppleTVDeviceInfoManager)initWithQueue:(id)a3;
- (TVSBluetoothManager)tvsBluetoothManager;
- (id)deviceInfoChangedHandler;
- (id)pairedRemote;
- (void)invalidate;
- (void)setDeviceInfoChangedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setTvsBluetoothManager:(id)a3;
- (void)setUserProfileManager:(id)a3;
- (void)tvsBluetoothManagerDidUpdate:(id)a3;
- (void)userProfileManagerDidUpdate:(id)a3;
@end

@implementation RPAppleTVDeviceInfoManager

- (RPAppleTVDeviceInfoManager)init
{
  return -[RPAppleTVDeviceInfoManager initWithQueue:](self, "initWithQueue:", &_dispatch_main_q);
}

- (RPAppleTVDeviceInfoManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___RPAppleTVDeviceInfoManager;
  v6 = -[RPAppleTVDeviceInfoManager init](&v20, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dispatchQueue, a3);
    v8 = -[objc_class sharedInstance](off_100131180(), "sharedInstance");
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    userProfileManager = v7->_userProfileManager;
    v7->_userProfileManager = (PBSUserProfileManager *)v9;

    -[PBSUserProfileManager addObserver:](v7->_userProfileManager, "addObserver:", v7);
    v11 = -[objc_class sharedInstance](off_100131188(), "sharedInstance");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    tvsBluetoothManager = v7->_tvsBluetoothManager;
    v7->_tvsBluetoothManager = (TVSBluetoothManager *)v12;

    id v14 = off_100131190();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (dword_100131110 <= 30
      && (dword_100131110 != -1 || _LogCategory_Initialize(&dword_100131110, 30LL)))
    {
      LogPrintF(&dword_100131110, "-[RPAppleTVDeviceInfoManager initWithQueue:]", 30LL, "%@", v15);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    id v17 = off_100131190();
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    [v16 addObserver:v7 selector:"tvsBluetoothManagerDidUpdate:" name:v18 object:0];
  }

  return v7;
}

- (void)invalidate
{
  userProfileManager = self->_userProfileManager;
  self->_userProfileManager = 0LL;

  id deviceInfoChangedHandler = self->_deviceInfoChangedHandler;
  self->_id deviceInfoChangedHandler = 0LL;
}

- (NSString)activeUserAltDSID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RPAppleTVDeviceInfoManager selectedUserProfile](self, "selectedUserProfile"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 iCloudAltDSID]);

  return (NSString *)v3;
}

- (PBSUserProfile)selectedUserProfile
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RPAppleTVDeviceInfoManager userProfileManager](self, "userProfileManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 userProfilesSnapshot]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 selectedUserProfile]);

  return (PBSUserProfile *)v4;
}

- (void)userProfileManagerDidUpdate:(id)a3
{
  id v4 = a3;
  if (dword_100131110 <= 30 && (dword_100131110 != -1 || _LogCategory_Initialize(&dword_100131110, 30LL))) {
    LogPrintF( &dword_100131110,  "-[RPAppleTVDeviceInfoManager userProfileManagerDidUpdate:]",  30LL,  "PBSUserProfileManager updated");
  }
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000393C;
  block[3] = &unk_1001110A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (BOOL)supportsFindMyRemote
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RPAppleTVDeviceInfoManager pairedRemote](self, "pairedRemote"));
  if ((objc_opt_respondsToSelector(v2, "supportsFindMy") & 1) != 0) {
    unsigned int v3 = [v2 supportsFindMy];
  }
  else {
    unsigned int v3 = 0;
  }
  if (dword_100131110 <= 30 && (dword_100131110 != -1 || _LogCategory_Initialize(&dword_100131110, 30LL)))
  {
    id v4 = "no";
    if (v3) {
      id v4 = "yes";
    }
    LogPrintF( &dword_100131110,  "-[RPAppleTVDeviceInfoManager supportsFindMyRemote]",  30LL,  "Supports Find My Remote: %s",  v4);
  }

  return v3;
}

- (void)tvsBluetoothManagerDidUpdate:(id)a3
{
  id v4 = a3;
  if (dword_100131110 <= 30 && (dword_100131110 != -1 || _LogCategory_Initialize(&dword_100131110, 30LL))) {
    LogPrintF( &dword_100131110,  "-[RPAppleTVDeviceInfoManager tvsBluetoothManagerDidUpdate:]",  30LL,  "TVSBluetoothManager updated");
  }
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100003B84;
  block[3] = &unk_1001110A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (id)pairedRemote
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSBluetoothManager pairedDevices](self->_tvsBluetoothManager, "pairedDevices", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
        if ([v7 type] == (id)1)
        {
          id v8 = v7;

          return v8;
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  return 0LL;
}

- (id)deviceInfoChangedHandler
{
  return self->_deviceInfoChangedHandler;
}

- (void)setDeviceInfoChangedHandler:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (PBSUserProfileManager)userProfileManager
{
  return self->_userProfileManager;
}

- (void)setUserProfileManager:(id)a3
{
}

- (TVSBluetoothManager)tvsBluetoothManager
{
  return self->_tvsBluetoothManager;
}

- (void)setTvsBluetoothManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
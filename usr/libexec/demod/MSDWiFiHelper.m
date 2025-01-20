@interface MSDWiFiHelper
+ (id)sharedInstance;
- (BOOL)configureWiFi:(id)a3 password:(id)a4;
- (BOOL)connectTo:(id)a3 password:(id)a4;
- (BOOL)enableWiFi:(BOOL)a3;
- (BOOL)isValidWiFiSettings:(id)a3;
- (BOOL)saveWiFiSettingsToPreferences:(id)a3;
- (CWFInterface)wifiInterface;
- (MSDTargetDevice)device;
- (MSDWiFiHelper)init;
- (id)getCurrentWiFiSettings:(BOOL)a3;
- (id)getCurrentWiFiSsid;
- (id)getPersistentWiFiSsid;
- (id)lastJoinedWiFiNetworksProfile;
- (id)loadWiFiSettingsFromPreferences;
- (int64_t)getCurrentWiFiSignalStrength;
- (void)configureWiFiWithPersistentSettings;
- (void)disassociateAndForgetWiFi;
- (void)forgetAllKnownWiFiNetworksExcept:(id)a3;
- (void)saveCurrentWiFiSettings;
- (void)setDevice:(id)a3;
- (void)setWifiInterface:(id)a3;
- (void)waitForWiFiInterface;
@end

@implementation MSDWiFiHelper

+ (id)sharedInstance
{
  if (qword_100125520 != -1) {
    dispatch_once(&qword_100125520, &stru_1000FA710);
  }
  return (id)qword_100125518;
}

- (MSDWiFiHelper)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MSDWiFiHelper;
  v2 = -[MSDWiFiHelper init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___CWFInterface);
    -[MSDWiFiHelper setWifiInterface:](v2, "setWifiInterface:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper wifiInterface](v2, "wifiInterface"));
    [v4 activate];

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
    -[MSDWiFiHelper setDevice:](v2, "setDevice:", v5);

    v6 = v2;
  }

  return v2;
}

- (BOOL)enableWiFi:(BOOL)a3
{
  BOOL v3 = a3;
  -[MSDWiFiHelper waitForWiFiInterface](self, "waitForWiFiInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper wifiInterface](self, "wifiInterface"));
  id v15 = 0LL;
  unsigned int v6 = [v5 setPower:v3 error:&v15];
  id v7 = v15;

  if ((v6 & 1) == 0)
  {
    id v13 = sub_10003A95C();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10009C840();
    }
  }

  id v8 = sub_10003A95C();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = "Failed";
    if (v6) {
      v10 = "Succeeded";
    }
    v11 = "Enable";
    if (!v3) {
      v11 = "Disable";
    }
    *(_DWORD *)buf = 136446466;
    v17 = v10;
    __int16 v18 = 2082;
    v19 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "enableWiFi - Operation %{public}s: %{public}s",  buf,  0x16u);
  }

  return v6;
}

- (BOOL)configureWiFi:(id)a3 password:(id)a4
{
  id v6 = a3;
  id v7 = (__CFString *)a4;
  if (!-[MSDWiFiHelper enableWiFi:](self, "enableWiFi:", 1LL))
  {
    id v18 = sub_10003A95C();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10009C8F8();
    }
    goto LABEL_21;
  }

  if (!-[MSDWiFiHelper connectTo:password:](self, "connectTo:password:", v6, v7))
  {
    id v19 = sub_10003A95C();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10009C8CC();
    }
    goto LABEL_21;
  }

  -[MSDWiFiHelper forgetAllKnownWiFiNetworksExcept:](self, "forgetAllKnownWiFiNetworksExcept:", v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper device](self, "device"));
  unsigned int v9 = [v8 isContentFrozen];

  if (!v9)
  {
    BOOL v16 = 1;
    goto LABEL_13;
  }

  id v10 = sub_10003A95C();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Saving wifi ssid and password to demo volume.",  buf,  2u);
  }

  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  v6,  @"SSID",  0LL));
  if (!v7 || (id v13 = -[__CFString length](v7, "length"), v14 = v7, !v13)) {
    v14 = &stru_1000FB848;
  }
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString dataUsingEncoding:](v14, "dataUsingEncoding:", 4LL));
  -[os_log_s setObject:forKey:](v12, "setObject:forKey:", v15, @"Password");

  if (!-[MSDWiFiHelper saveWiFiSettingsToPreferences:](self, "saveWiFiSettingsToPreferences:", v12))
  {
    id v20 = sub_10003A95C();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10009C8A0();
    }

LABEL_21:
    BOOL v16 = 0;
    goto LABEL_11;
  }

  BOOL v16 = 1;
LABEL_11:

LABEL_13:
  return v16;
}

- (void)configureWiFiWithPersistentSettings
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper loadWiFiSettingsFromPreferences](self, "loadWiFiSettingsFromPreferences"));
  v4 = v3;
  if (!v3)
  {
    id v15 = sub_10003A95C();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10009C924();
    }
    v5 = 0LL;
    unsigned int v9 = 0LL;
    id v8 = 0LL;
    goto LABEL_23;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"SSID"]);
  id v6 = sub_10003A95C();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138543362;
    id v20 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Enforcing WiFi settings to AP with SSID - %{public}@",  (uint8_t *)&v19,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"Password"]);
  if ([v8 length])
  {
    unsigned int v9 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v8, 4LL);
    if (!v9)
    {
      id v10 = sub_10003A95C();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10009C9A8();
      }
      unsigned int v9 = 0LL;
LABEL_23:

      id v18 = sub_10003A95C();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "WiFi settings not enforced.",  (uint8_t *)&v19,  2u);
      }

      goto LABEL_14;
    }
  }

  else
  {
    unsigned int v9 = 0LL;
  }

  if (!-[MSDWiFiHelper enableWiFi:](self, "enableWiFi:", 1LL))
  {
    id v16 = sub_10003A95C();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10009C97C();
    }
    goto LABEL_23;
  }

  if (!-[MSDWiFiHelper connectTo:password:](self, "connectTo:password:", v5, v9))
  {
    id v17 = sub_10003A95C();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10009C950();
    }
    goto LABEL_23;
  }

  -[MSDWiFiHelper forgetAllKnownWiFiNetworksExcept:](self, "forgetAllKnownWiFiNetworksExcept:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper device](self, "device"));
  unsigned __int8 v13 = [v12 isContentFrozen];

  if ((v13 & 1) == 0)
  {
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper device](self, "device"));
    -[os_log_s setWifiSettings:](v14, "setWifiSettings:", 0LL);
LABEL_14:
  }
}

- (id)getCurrentWiFiSettings:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper wifiInterface](self, "wifiInterface"));
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 currentKnownNetworkProfile]);

  if (!v6)
  {
    id v7 = sub_10003A95C();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Failed to get current known network profile, fetching last joined wifi network...",  buf,  2u);
    }

    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper lastJoinedWiFiNetworksProfile](self, "lastJoinedWiFiNetworksProfile"));
    if (!v6)
    {
      id v28 = sub_10003A95C();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10009C9D4();
      }
      goto LABEL_18;
    }
  }

  uint64_t v9 = objc_claimAutoreleasedReturnValue(-[os_log_s networkName](v6, "networkName"));
  if (!v9)
  {
    id v29 = sub_10003A95C();
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_10009CA00();
    }

    goto LABEL_18;
  }

  id v10 = (void *)v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  v9,  @"SSID",  0LL));
  if (v3)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s SSID](v6, "SSID"));
    id v31 = 0LL;
    uint64_t v13 = CWFSecItemQueryPassword(v12, &v31);
    v14 = (__CFString *)v31;

    if ((_DWORD)v13 == -25300 || !(_DWORD)v13)
    {
      if (!v14 || (id v15 = -[__CFString length](v14, "length"), v16 = v14, !v15)) {
        id v16 = &stru_1000FB848;
      }
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString dataUsingEncoding:](v16, "dataUsingEncoding:", 4LL));
      [v11 setObject:v17 forKey:@"Password"];

      goto LABEL_13;
    }

    id v20 = sub_10003A95C();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10009CA2C(v13, v21, v22, v23, v24, v25, v26, v27);
    }

LABEL_18:
    id v18 = 0LL;
    goto LABEL_14;
  }

- (void)saveCurrentWiFiSettings
{
  id v3 = sub_10003A95C();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Saving current wifi settings.", v8, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper getCurrentWiFiSettings:](self, "getCurrentWiFiSettings:", 1LL));
  if (v5 && !-[MSDWiFiHelper saveWiFiSettingsToPreferences:](self, "saveWiFiSettingsToPreferences:", v5))
  {
    id v6 = sub_10003A95C();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10009CA90();
    }
  }
}

- (id)getPersistentWiFiSsid
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper loadWiFiSettingsFromPreferences](self, "loadWiFiSettingsFromPreferences"));
  id v3 = v2;
  if (!v2)
  {
    id v6 = sub_10003A95C();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10009CABC(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    goto LABEL_8;
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"SSID"]);
  if (!v4)
  {
    id v15 = sub_10003A95C();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10009CB2C(v7, v16, v17, v18, v19, v20, v21, v22);
    }
LABEL_8:

    v4 = 0LL;
  }

  return v4;
}

- (id)getCurrentWiFiSsid
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper getCurrentWiFiSettings:](self, "getCurrentWiFiSettings:", 0LL));
  id v3 = v2;
  if (v2) {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"SSID"]);
  }
  else {
    v4 = 0LL;
  }

  return v4;
}

- (int64_t)getCurrentWiFiSignalStrength
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper wifiInterface](self, "wifiInterface"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentKnownNetworkProfile]);

  if (!v4) {
    return -100LL;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper wifiInterface](self, "wifiInterface"));
  id v6 = [v5 RSSI];

  return (int64_t)v6;
}

- (void)disassociateAndForgetWiFi
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper wifiInterface](self, "wifiInterface"));
  [v3 disassociateWithReason:0];

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper device](self, "device"));
  [v4 setWifiSettings:0];
}

- (BOOL)connectTo:(id)a3 password:(id)a4
{
  id v5 = a3;
  id v50 = a4;
  id v6 = objc_alloc_init(&OBJC_CLASS___CWFScanParameters);
  [v6 setIncludeHiddenNetworks:1];
  id v62 = v5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v62, 1LL));
  [v6 setSSIDList:v7];

  [v6 setMinimumRSSI:-80];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &off_1001061C8));
  v51 = v6;
  [v6 setIncludeProperties:v8];

  id v9 = 0LL;
  uint64_t v10 = 3LL;
  while (1)
  {
    uint64_t v11 = v9;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper wifiInterface](self, "wifiInterface"));
    id v58 = v9;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 performScanWithParameters:v51 error:&v58]);
    id v9 = v58;

    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    id v14 = v13;
    id v15 = [v14 countByEnumeratingWithState:&v54 objects:v61 count:16];
    if (v15) {
      break;
    }
LABEL_11:

LABEL_15:
    sleep(3u);

    if (!--v10)
    {
      id v27 = sub_10003A95C();
      uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_10009CB9C(v26, v28, v29, v30, v31, v32, v33, v34);
      }
      BOOL v35 = 0;
      v36 = v50;
      goto LABEL_29;
    }
  }

  id v16 = v15;
  id v17 = 0LL;
  uint64_t v18 = *(void *)v55;
LABEL_4:
  uint64_t v19 = 0LL;
  uint64_t v20 = v17;
  while (1)
  {
    if (*(void *)v55 != v18) {
      objc_enumerationMutation(v14);
    }
    id v17 = *(id *)(*((void *)&v54 + 1) + 8LL * (void)v19);

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v17 networkName]);
    unsigned int v22 = [v21 isEqualToString:v5];

    if (v22) {
      break;
    }
    uint64_t v19 = (char *)v19 + 1;
    uint64_t v20 = v17;
    if (v16 == v19)
    {
      id v16 = [v14 countByEnumeratingWithState:&v54 objects:v61 count:16];
      if (v16) {
        goto LABEL_4;
      }

      goto LABEL_11;
    }
  }

  id v23 = sub_10003A95C();
  uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v17 networkName]);
    *(_DWORD *)buf = 138543362;
    v60 = v25;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Found the wifi with ssid '%{public}@'",  buf,  0xCu);
  }

  uint64_t v26 = (os_log_s *)v17;
  if (!v26) {
    goto LABEL_15;
  }

  id v37 = objc_alloc_init(&OBJC_CLASS___CWFAssocParameters);
  [v37 setScanResult:v26];
  [v37 setRememberUponSuccessfulAssociation:1];
  v36 = v50;
  [v37 setPassword:v50];
  id v38 = objc_alloc_init(&OBJC_CLASS___CWFNetworkProfile);
  [v37 setKnownNetworkProfile:v38];

  v39 = (void *)objc_claimAutoreleasedReturnValue([v37 knownNetworkProfile]);
  [v39 setHiddenState:1];

  uint64_t v40 = -3LL;
  while (1)
  {
    v41 = v9;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper wifiInterface](self, "wifiInterface"));
    id v53 = v9;
    unsigned __int8 v43 = [v42 associateWithParameters:v37 error:&v53];
    id v9 = v53;

    if ((v43 & 1) != 0) {
      break;
    }
    sleep(3u);
    if (__CFADD__(v40++, 1LL))
    {
      id v45 = sub_10003A95C();
      v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        sub_10009CC08();
      }

      BOOL v35 = 0;
      goto LABEL_29;
    }
  }

  id v47 = sub_10003A95C();
  v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Connected to wifi.", buf, 2u);
  }

  BOOL v35 = 1;
LABEL_29:

  return v35;
}

- (void)waitForWiFiInterface
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSCondition);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 5.0));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper wifiInterface](self, "wifiInterface"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10006FD08;
  v20[3] = &unk_1000FA738;
  id v6 = v3;
  uint64_t v21 = v6;
  [v5 setEventHandler:v20];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper wifiInterface](self, "wifiInterface"));
  id v19 = 0LL;
  unsigned __int8 v8 = [v7 startMonitoringEventType:10 error:&v19];
  id v9 = v19;

  if ((v8 & 1) != 0)
  {
    -[NSCondition lock](v6, "lock");
    while (1)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper wifiInterface](self, "wifiInterface"));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 interfaceName]);

      if (v11) {
        break;
      }
      id v12 = sub_10003A95C();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Wifi interface is not intialized, waiting for  CWFEventTypeInterfaceAdded event.",  v18,  2u);
      }

      if (!-[NSCondition waitUntilDate:](v6, "waitUntilDate:", v4))
      {
        id v14 = sub_10003A95C();
        id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v18 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Wait for wifi interface initialization timed out after 5 seconds",  v18,  2u);
        }

        break;
      }
    }

    -[NSCondition unlock](v6, "unlock");
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper wifiInterface](self, "wifiInterface"));
    [v16 stopMonitoringEventType:10];
  }

  else
  {
    id v17 = sub_10003A95C();
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR)) {
      sub_10009CC68();
    }
  }
}

- (void)forgetAllKnownWiFiNetworksExcept:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003A95C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v31 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Forgetting all known WiFi networks except: '%{public}@'...",  buf,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper wifiInterface](self, "wifiInterface"));
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 knownNetworkProfilesWithProperties:0]);

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v26;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        if (v4
          && (id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v25 + 1)
                                                                                 + 8LL * (void)i), "networkName")),
              unsigned int v16 = [v15 isEqualToString:v4],
              v15,
              v16))
        {
          id v17 = sub_10003A95C();
          uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Found known WiFi network with matching ssid!",  buf,  2u);
          }
        }

        else
        {
          id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper wifiInterface](self, "wifiInterface"));
          id v24 = 0LL;
          unsigned __int8 v20 = [v19 removeKnownNetworkProfile:v14 reason:0 error:&v24];
          uint64_t v18 = (os_log_s *)v24;

          if ((v20 & 1) == 0)
          {
            id v22 = sub_10003A95C();
            id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
              sub_10009CCC8(v18, v23);
            }

            goto LABEL_20;
          }

          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v14 SSID]);
          CWFSecItemSetPassword(v21, 0LL);
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

- (id)lastJoinedWiFiNetworksProfile
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper wifiInterface](self, "wifiInterface"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 knownNetworkProfilesWithProperties:0]);

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v5)
  {
    id v6 = v5;
    id v7 = 0LL;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        if (v7
          || (id v15 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v20 + 1) + 8 * (void)i),  "lastJoinedAt",  (void)v20)),  v15,  !v15))
        {
          id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastJoinedAt", (void)v20));
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 lastJoinedAt]);
          id v13 = [v11 compare:v12];

          if (v13 == (id)1)
          {
            id v14 = v10;

            id v7 = v14;
          }
        }

        else
        {
          id v7 = v10;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }

    while (v6);
  }

  else
  {
    id v7 = 0LL;
  }

  id v16 = sub_10003A95C();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v7 networkName]);
    *(_DWORD *)buf = 138543362;
    __int128 v25 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Last joined WiFi network SSID: %{public}@",  buf,  0xCu);
  }

  return v7;
}

- (BOOL)isValidWiFiSettings:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    id v9 = sub_10003A95C();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No WiFi settings found.", v13, 2u);
    }

    id v6 = 0LL;
    goto LABEL_9;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"SSID"]);
  id v6 = v5;
  if (!v5
    || ![v5 length]
    || (id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"Password"])) == 0)
  {
    id v12 = sub_10003A95C();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10009CD58();
    }
LABEL_9:

    id v7 = 0LL;
    BOOL v8 = 0;
    goto LABEL_10;
  }

  BOOL v8 = 1;
LABEL_10:

  return v8;
}

- (id)loadWiFiSettingsFromPreferences
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper device](self, "device"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 wifiSettings]);
  id v5 = [v4 mutableCopy];

  if (!v5)
  {
    id v12 = sub_10003A95C();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Persistent WiFi settings does not exist",  buf,  2u);
    }

    goto LABEL_8;
  }

  if (-[MSDWiFiHelper isValidWiFiSettings:](self, "isValidWiFiSettings:", v5))
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"Password"]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDCryptoHandler sharedInstance](&OBJC_CLASS___MSDCryptoHandler, "sharedInstance"));
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 performCryptoWithSecretKeyOnData:v6 isDecipher:1]);

    if (v8)
    {
      [v5 setObject:v8 forKey:@"Password"];
      id v9 = sub_10003A95C();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "WiFi settings successfully loaded.",  v14,  2u);
      }
    }

    else
    {
      id v13 = sub_10003A95C();
      BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10009CD84();
      }
    }

LABEL_8:
  }

  return v5;
}

- (BOOL)saveWiFiSettingsToPreferences:(id)a3
{
  id v4 = a3;
  if (-[MSDWiFiHelper isValidWiFiSettings:](self, "isValidWiFiSettings:", v4))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDCryptoHandler sharedInstance](&OBJC_CLASS___MSDCryptoHandler, "sharedInstance"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"Password"]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 performCryptoWithSecretKeyOnData:v6 isDecipher:0]);

    BOOL v8 = v7 != 0LL;
    if (v7)
    {
      id v9 = [v4 mutableCopy];
      [v9 setObject:v7 forKey:@"Password"];
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper device](self, "device"));
      [v10 setWifiSettings:v9];

      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper device](self, "device"));
      unsigned int v12 = [v11 isContentFrozen];

      if (v12)
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDWiFiHelper device](self, "device"));
        [v13 setShouldForgetKnownNetworkUponUnlock:0];
      }

      id v14 = sub_10003A95C();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "WiFi settings successfully saved.",  v18,  2u);
      }
    }

    else
    {
      id v17 = sub_10003A95C();
      id v9 = (id)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
        sub_10009CDB0();
      }
    }
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (CWFInterface)wifiInterface
{
  return self->_wifiInterface;
}

- (void)setWifiInterface:(id)a3
{
}

- (MSDTargetDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
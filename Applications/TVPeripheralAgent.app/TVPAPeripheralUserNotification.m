@interface TVPAPeripheralUserNotification
+ (id)_bulletinImageTypeWithRemote:(id)a3;
+ (id)_bulletinLowBatteryCriticalImageTypWithRemote:(id)a3;
+ (id)_productAssetPathForDevice:(id)a3 outIsVideoAsset:(BOOL *)a4;
+ (id)_remoteImageIDForType:(int64_t)a3 defaultImageID:(id)a4;
+ (id)_symbolImageNameForDevice:(id)a3;
+ (id)audioDeviceConnectedPeripheralUserNotificationWithDevice:(id)a3;
+ (id)audioDeviceDisconnectedPeripheralUserNotificationWithDevice:(id)a3;
+ (id)gameControllerConnectedPeripheralUserNotificationWithName:(id)a3 homeButtonImageID:(id)a4 mostRecentlyPlayedGame:(id)a5;
+ (id)gameControllerDisconnectedPeripheralUserNotificationWithName:(id)a3;
+ (id)peripheralUserNotificationWithHUDType:(int64_t)a3;
+ (id)remoteConnectionPeripheralUserNotificationWithRemote:(id)a3;
+ (id)remoteDisconnectionPeripheralUserNotificationWithRemote:(id)a3;
+ (int64_t)_resolvedRemoteType:(int64_t)a3;
- (BOOL)assetIsMovie;
- (BOOL)isHighPriority;
- (NSString)assetPath;
- (NSString)bulletinImageType;
- (NSString)bundleIdentifier;
- (NSString)footer;
- (NSString)subtitle;
- (NSString)symbolConfiguration;
- (NSString)symbolImageName;
- (NSString)title;
- (id)_initWithHUDType:(int64_t)a3;
- (int64_t)timeout;
- (int64_t)type;
- (unint64_t)activationAction;
- (void)setActivationAction:(unint64_t)a3;
- (void)setAssetIsMovie:(BOOL)a3;
- (void)setAssetPath:(id)a3;
- (void)setBulletinImageType:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setFooter:(id)a3;
- (void)setIsHighPriority:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setSymbolConfiguration:(id)a3;
- (void)setSymbolImageName:(id)a3;
- (void)setTimeout:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation TVPAPeripheralUserNotification

+ (id)remoteConnectionPeripheralUserNotificationWithRemote:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v13 = -[TVPAPeripheralUserNotification _initWithHUDType:]( objc_alloc(&OBJC_CLASS___TVPAPeripheralUserNotification),  "_initWithHUDType:",  1LL);
  id v4 = v13;
  id v5 =  +[TVPAPeripheralUserNotification _bulletinImageTypeWithRemote:]( &OBJC_CLASS___TVPAPeripheralUserNotification,  "_bulletinImageTypeWithRemote:",  location[0]);
  objc_msgSend(v4, "setBulletinImageType:");

  id v6 = v13;
  v8 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  v7 =  -[NSBundle localizedStringForKey:value:table:]( v8,  "localizedStringForKey:value:table:",  @"AccessoryHUDTitleRemote");
  objc_msgSend(v6, "setTitle:");

  id v9 = v13;
  v11 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  v10 =  -[NSBundle localizedStringForKey:value:table:]( v11,  "localizedStringForKey:value:table:",  @"AccessoryHUDSubtitleRemoteConnected",  &stru_100039440,  0LL);
  objc_msgSend(v9, "setSubtitle:");

  id v12 = v13;
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
  return v12;
}

+ (id)remoteDisconnectionPeripheralUserNotificationWithRemote:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v13 = -[TVPAPeripheralUserNotification _initWithHUDType:]( objc_alloc(&OBJC_CLASS___TVPAPeripheralUserNotification),  "_initWithHUDType:",  2LL);
  id v4 = v13;
  id v5 =  +[TVPAPeripheralUserNotification _bulletinImageTypeWithRemote:]( &OBJC_CLASS___TVPAPeripheralUserNotification,  "_bulletinImageTypeWithRemote:",  location[0]);
  objc_msgSend(v4, "setBulletinImageType:");

  id v6 = v13;
  v8 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  v7 =  -[NSBundle localizedStringForKey:value:table:]( v8,  "localizedStringForKey:value:table:",  @"AccessoryHUDTitleRemote");
  objc_msgSend(v6, "setTitle:");

  id v9 = v13;
  v11 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  v10 =  -[NSBundle localizedStringForKey:value:table:]( v11,  "localizedStringForKey:value:table:",  @"AccessoryHUDSubtitleRemoteDisconnected",  &stru_100039440,  0LL);
  objc_msgSend(v9, "setSubtitle:");

  id v12 = v13;
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
  return v12;
}

+ (id)gameControllerConnectedPeripheralUserNotificationWithName:(id)a3 homeButtonImageID:(id)a4 mostRecentlyPlayedGame:(id)a5
{
  id v26 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v24 = 0LL;
  objc_storeStrong(&v24, a4);
  id v23 = 0LL;
  objc_storeStrong(&v23, a5);
  id v22 = -[TVPAPeripheralUserNotification _initWithHUDType:]( objc_alloc(&OBJC_CLASS___TVPAPeripheralUserNotification),  "_initWithHUDType:",  8LL);
  char v19 = 0;
  char v17 = 0;
  if (location[0])
  {
    id v5 = (NSString *)location[0];
  }

  else
  {
    v20 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
    char v19 = 1;
    v18 =  -[NSBundle localizedStringForKey:value:table:]( v20,  "localizedStringForKey:value:table:",  @"AccessoryHUDTitleGameController",  &stru_100039440,  0LL);
    char v17 = 1;
    id v5 = v18;
  }

  id v21 = v5;
  if ((v17 & 1) != 0) {

  }
  if ((v19 & 1) != 0) {
  [v22 setTitle:v21];
  }
  v10 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v9 =  -[NSBundle localizedStringForKey:value:table:]( v10,  "localizedStringForKey:value:table:",  @"AccessoryHUDSubtitleGameControllerConnected",  &stru_100039440,  0LL);
  objc_msgSend(v22, "setSubtitle:");

  [v22 setBulletinImageType:PBSSystemBulletinImageIDController];
  if (v23)
  {
    id v16 = [v23 localizedName];
    id v15 = [v23 bundleIdentifier];
    if (v16 && v15)
    {
      v8 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", v26);
      v14 =  -[NSBundle localizedStringForKey:value:table:]( v8,  "localizedStringForKey:value:table:",  @"AccessoryHUDFooterGameControllerConnectedFormat",  &stru_100039440,  @"GamingIntent");

      id v13 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v14, v24, v16);
      [v22 setFooter:v13];
      [v22 setActivationAction:4];
      [v22 setBundleIdentifier:v15];
      objc_storeStrong((id *)&v13, 0LL);
      objc_storeStrong((id *)&v14, 0LL);
    }

    objc_storeStrong(&v15, 0LL);
    objc_storeStrong(&v16, 0LL);
  }

  id v7 = v22;
  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(&v23, 0LL);
  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(location, 0LL);
  return v7;
}

+ (id)gameControllerDisconnectedPeripheralUserNotificationWithName:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v14 = -[TVPAPeripheralUserNotification _initWithHUDType:]( objc_alloc(&OBJC_CLASS___TVPAPeripheralUserNotification),  "_initWithHUDType:",  9LL);
  char v11 = 0;
  char v9 = 0;
  if (location[0])
  {
    v3 = (NSString *)location[0];
  }

  else
  {
    id v12 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
    char v11 = 1;
    v10 =  -[NSBundle localizedStringForKey:value:table:]( v12,  "localizedStringForKey:value:table:",  @"AccessoryHUDTitleGameController",  &stru_100039440,  0LL);
    char v9 = 1;
    v3 = v10;
  }

  id v13 = v3;
  if ((v9 & 1) != 0) {

  }
  if ((v11 & 1) != 0) {
  [v14 setTitle:v13];
  }
  id v5 = v14;
  id v7 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  id v6 =  -[NSBundle localizedStringForKey:value:table:]( v7,  "localizedStringForKey:value:table:",  @"AccessoryHUDSubtitleGameControllerDisconnected",  &stru_100039440);
  objc_msgSend(v5, "setSubtitle:");

  [v14 setBulletinImageType:PBSSystemBulletinImageIDController];
  id v8 = v14;
  objc_storeStrong((id *)&v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
  return v8;
}

+ (id)peripheralUserNotificationWithHUDType:(int64_t)a3
{
  id v70 = a1;
  SEL v69 = a2;
  int64_t v68 = a3;
  id v67 = -[TVPAPeripheralUserNotification _initWithHUDType:]( objc_alloc(&OBJC_CLASS___TVPAPeripheralUserNotification),  "_initWithHUDType:",  a3);
  switch(v68)
  {
    case 3LL:
      id v60 =  +[TVPAPeripheralUserNotification _bulletinImageTypeWithRemote:]( &OBJC_CLASS___TVPAPeripheralUserNotification,  "_bulletinImageTypeWithRemote:");
      objc_msgSend(v67, "setBulletinImageType:");

      v62 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
      v61 =  -[NSBundle localizedStringForKey:value:table:]( v62,  "localizedStringForKey:value:table:",  @"AccessoryHUDTitleBatteryLow");
      objc_msgSend(v67, "setTitle:");

      v64 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
      v63 =  -[NSBundle localizedStringForKey:value:table:]( v64,  "localizedStringForKey:value:table:",  @"AccessoryHUDSubtitleBatteryLow20",  &stru_100039440,  0LL);
      objc_msgSend(v67, "setSubtitle:");

      break;
    case 4LL:
      id v55 =  +[TVPAPeripheralUserNotification _bulletinImageTypeWithRemote:]( &OBJC_CLASS___TVPAPeripheralUserNotification,  "_bulletinImageTypeWithRemote:");
      objc_msgSend(v67, "setBulletinImageType:");

      v57 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
      v56 =  -[NSBundle localizedStringForKey:value:table:]( v57,  "localizedStringForKey:value:table:",  @"AccessoryHUDTitleBatteryLow");
      objc_msgSend(v67, "setTitle:");

      v59 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
      v58 =  -[NSBundle localizedStringForKey:value:table:]( v59,  "localizedStringForKey:value:table:",  @"AccessoryHUDSubtitleBatteryLow10",  &stru_100039440,  0LL);
      objc_msgSend(v67, "setSubtitle:");

      break;
    case 5LL:
      id v50 =  +[TVPAPeripheralUserNotification _bulletinLowBatteryCriticalImageTypWithRemote:]( &OBJC_CLASS___TVPAPeripheralUserNotification,  "_bulletinLowBatteryCriticalImageTypWithRemote:");
      objc_msgSend(v67, "setBulletinImageType:");

      v52 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
      v51 =  -[NSBundle localizedStringForKey:value:table:]( v52,  "localizedStringForKey:value:table:",  @"AccessoryHUDTitleBatteryLow");
      objc_msgSend(v67, "setTitle:");

      v54 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
      v53 =  -[NSBundle localizedStringForKey:value:table:]( v54,  "localizedStringForKey:value:table:",  @"AccessoryHUDSubtitleBatteryLowCritical",  &stru_100039440,  0LL);
      objc_msgSend(v67, "setSubtitle:");

      [v67 setTimeout:900];
      break;
    case 6LL:
      id v45 =  +[TVPAPeripheralUserNotification _bulletinLowBatteryCriticalImageTypWithRemote:]( &OBJC_CLASS___TVPAPeripheralUserNotification,  "_bulletinLowBatteryCriticalImageTypWithRemote:");
      objc_msgSend(v67, "setBulletinImageType:");

      v47 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
      v46 =  -[NSBundle localizedStringForKey:value:table:]( v47,  "localizedStringForKey:value:table:",  @"AccessoryHUDTitleRemote");
      objc_msgSend(v67, "setTitle:");

      v49 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
      v48 =  -[NSBundle localizedStringForKey:value:table:]( v49,  "localizedStringForKey:value:table:",  @"AccessoryHUDSubtitleBatteryCharging",  &stru_100039440,  0LL);
      objc_msgSend(v67, "setSubtitle:");

      break;
    case 7LL:
      v66 = 0LL;
      v65 = 0LL;
      if ((_os_feature_enabled_impl("PineBoard", "Newport") & 1) != 0)
      {
        v43 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
        v3 =  -[NSBundle localizedStringForKey:value:table:]( v43,  "localizedStringForKey:value:table:",  @"AccessoryHUDTitlePairRemote");
        id v4 = v66;
        v66 = v3;

        v44 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
        id v5 =  -[NSBundle localizedStringForKey:value:table:]( v44,  "localizedStringForKey:value:table:",  @"AccessoryHUDSubtitlePairRemote",  &stru_100039440,  0LL);
        id v6 = v65;
        v65 = v5;
      }

      else
      {
        v41 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
        id v7 =  -[NSBundle localizedStringForKey:value:table:]( v41,  "localizedStringForKey:value:table:",  @"AccessoryHUDTitleRemotePairingInstructions");
        id v8 = v66;
        v66 = v7;

        v42 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
        char v9 =  -[NSBundle localizedStringForKey:value:table:]( v42,  "localizedStringForKey:value:table:",  @"AccessoryHUDSubtitleRemotePairingInstructions",  &stru_100039440,  0LL);
        v10 = v65;
        v65 = v9;
      }

      [v67 setBulletinImageType:PBSSystemBulletinImageIDRemote];
      [v67 setTitle:v66];
      [v67 setSubtitle:v65];
      [v67 setTimeout:30];
      objc_storeStrong((id *)&v65, 0LL);
      objc_storeStrong((id *)&v66, 0LL);
      break;
    case 10LL:
      [v67 setBulletinImageType:PBSSystemBulletinImageIDController];
      v38 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
      v37 =  -[NSBundle localizedStringForKey:value:table:]( v38,  "localizedStringForKey:value:table:",  @"AccessoryHUDTitleGameController");
      objc_msgSend(v67, "setTitle:");

      v40 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
      v39 =  -[NSBundle localizedStringForKey:value:table:]( v40,  "localizedStringForKey:value:table:",  @"AccessoryHUDSubtitleBatteryLow20",  &stru_100039440,  0LL);
      objc_msgSend(v67, "setSubtitle:");

      break;
    case 11LL:
      [v67 setBulletinImageType:PBSSystemBulletinImageIDController];
      v34 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
      v33 =  -[NSBundle localizedStringForKey:value:table:]( v34,  "localizedStringForKey:value:table:",  @"AccessoryHUDTitleGameController");
      objc_msgSend(v67, "setTitle:");

      v36 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
      v35 =  -[NSBundle localizedStringForKey:value:table:]( v36,  "localizedStringForKey:value:table:",  @"AccessoryHUDSubtitleBatteryLow10",  &stru_100039440,  0LL);
      objc_msgSend(v67, "setSubtitle:");

      break;
    case 12LL:
      [v67 setBulletinImageType:PBSSystemBulletinImageIDController];
      v30 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
      v29 =  -[NSBundle localizedStringForKey:value:table:]( v30,  "localizedStringForKey:value:table:",  @"AccessoryHUDTitleGameController");
      objc_msgSend(v67, "setTitle:");

      v32 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
      v31 =  -[NSBundle localizedStringForKey:value:table:]( v32,  "localizedStringForKey:value:table:",  @"AccessoryHUDSubtitleGameControllerLowBatteryCritical",  &stru_100039440,  0LL);
      objc_msgSend(v67, "setSubtitle:");

      break;
    case 13LL:
      [v67 setBulletinImageType:PBSSystemBulletinImageIDKeyboard];
      id v26 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
      v25 =  -[NSBundle localizedStringForKey:value:table:]( v26,  "localizedStringForKey:value:table:",  @"AccessoryHUDTitleKeyboard");
      objc_msgSend(v67, "setTitle:");

      v28 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
      v27 =  -[NSBundle localizedStringForKey:value:table:]( v28,  "localizedStringForKey:value:table:",  @"AccessoryHUDSubtitleKeyboardConnected",  &stru_100039440,  0LL);
      objc_msgSend(v67, "setSubtitle:");

      break;
    case 14LL:
      [v67 setBulletinImageType:PBSSystemBulletinImageIDKeyboard];
      id v22 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
      id v21 =  -[NSBundle localizedStringForKey:value:table:]( v22,  "localizedStringForKey:value:table:",  @"AccessoryHUDTitleKeyboard");
      objc_msgSend(v67, "setTitle:");

      id v24 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
      id v23 =  -[NSBundle localizedStringForKey:value:table:]( v24,  "localizedStringForKey:value:table:",  @"AccessoryHUDSubtitleKeyboardDisconnected",  &stru_100039440,  0LL);
      objc_msgSend(v67, "setSubtitle:");

      break;
    case 15LL:
      [v67 setBulletinImageType:PBSSystemBulletinImageIDAudio];
      v18 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
      char v17 =  -[NSBundle localizedStringForKey:value:table:]( v18,  "localizedStringForKey:value:table:",  @"AccessoryHUDTitleAudio");
      objc_msgSend(v67, "setTitle:");

      v20 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
      char v19 =  -[NSBundle localizedStringForKey:value:table:]( v20,  "localizedStringForKey:value:table:",  @"AccessoryHUDSubtitleAudioConnected",  &stru_100039440,  0LL);
      objc_msgSend(v67, "setSubtitle:");

      break;
    case 16LL:
      [v67 setBulletinImageType:PBSSystemBulletinImageIDAudio];
      id v14 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
      id v13 =  -[NSBundle localizedStringForKey:value:table:]( v14,  "localizedStringForKey:value:table:",  @"AccessoryHUDTitleAudio");
      objc_msgSend(v67, "setTitle:");

      id v16 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
      id v15 =  -[NSBundle localizedStringForKey:value:table:]( v16,  "localizedStringForKey:value:table:",  @"AccessoryHUDSubtitleAudioDisconnected",  &stru_100039440,  0LL);
      objc_msgSend(v67, "setSubtitle:");

      break;
  }

  id v12 = v67;
  objc_storeStrong(&v67, 0LL);
  return v12;
}

+ (id)audioDeviceConnectedPeripheralUserNotificationWithDevice:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  char v9 =  +[TVPAPeripheralUserNotification peripheralUserNotificationWithHUDType:]( &OBJC_CLASS___TVPAPeripheralUserNotification,  "peripheralUserNotificationWithHUDType:",  15LL);
  id v8 = [location[0] name];
  if (v8 || ([0 isEqualToString:&stru_100039440] & 1) == 0)
  {
    -[TVPAPeripheralUserNotification setTitle:](v9, "setTitle:", v8);
    id v5 =  +[TVPAPeripheralUserNotification _symbolImageNameForDevice:]( &OBJC_CLASS___TVPAPeripheralUserNotification,  "_symbolImageNameForDevice:",  location[0]);
    -[TVPAPeripheralUserNotification setSymbolImageName:](v9, "setSymbolImageName:");

    -[TVPAPeripheralUserNotification setSymbolConfiguration:]( v9,  "setSymbolConfiguration:",  PBSSystemBulletinSymbolConfigurationHeadphones);
    id v6 =  +[TVPAPeripheralUserNotification _productAssetPathForDevice:outIsVideoAsset:]( &OBJC_CLASS___TVPAPeripheralUserNotification,  "_productAssetPathForDevice:outIsVideoAsset:",  location[0],  &v7);
    -[TVPAPeripheralUserNotification setAssetPath:](v9, "setAssetPath:", v6);
    -[TVPAPeripheralUserNotification setAssetIsMovie:](v9, "setAssetIsMovie:", v7 & 1);
    objc_storeStrong(&v6, 0LL);
  }

  id v4 = v9;
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong((id *)&v9, 0LL);
  objc_storeStrong(location, 0LL);
  return v4;
}

+ (id)audioDeviceDisconnectedPeripheralUserNotificationWithDevice:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  char v9 =  +[TVPAPeripheralUserNotification peripheralUserNotificationWithHUDType:]( &OBJC_CLASS___TVPAPeripheralUserNotification,  "peripheralUserNotificationWithHUDType:",  16LL);
  id v8 = [location[0] name];
  if (v8 || ([0 isEqualToString:&stru_100039440] & 1) == 0)
  {
    -[TVPAPeripheralUserNotification setTitle:](v9, "setTitle:", v8);
    id v5 =  +[TVPAPeripheralUserNotification _symbolImageNameForDevice:]( &OBJC_CLASS___TVPAPeripheralUserNotification,  "_symbolImageNameForDevice:",  location[0]);
    -[TVPAPeripheralUserNotification setSymbolImageName:](v9, "setSymbolImageName:");

    -[TVPAPeripheralUserNotification setSymbolConfiguration:]( v9,  "setSymbolConfiguration:",  PBSSystemBulletinSymbolConfigurationHeadphones);
    id v6 =  +[TVPAPeripheralUserNotification _productAssetPathForDevice:outIsVideoAsset:]( &OBJC_CLASS___TVPAPeripheralUserNotification,  "_productAssetPathForDevice:outIsVideoAsset:",  location[0],  &v7);
    -[TVPAPeripheralUserNotification setAssetPath:](v9, "setAssetPath:", v6);
    -[TVPAPeripheralUserNotification setAssetIsMovie:](v9, "setAssetIsMovie:", v7 & 1);
    objc_storeStrong(&v6, 0LL);
  }

  id v4 = v9;
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong((id *)&v9, 0LL);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (id)_initWithHUDType:(int64_t)a3
{
  char v7 = 0LL;
  id v5 = -[TVPAPeripheralUserNotification init](self, "init");
  char v7 = v5;
  objc_storeStrong((id *)&v7, v5);
  if (v5)
  {
    v7->_type = a3;
    v7->_activationAction = 1LL;
    v7->_isHighPriority = (unint64_t)(a3 - 1) <= 1
                       || a3 == 5
                       || (unint64_t)(a3 - 8) <= 1
                       || (unint64_t)(a3 - 12) <= 4;
  }

  id v4 = v7;
  objc_storeStrong((id *)&v7, 0LL);
  return v4;
}

+ (int64_t)_resolvedRemoteType:(int64_t)a3
{
  id v5 = (id)a3;
  if (!a3)
  {
    id v4 =  +[TVSBluetoothRemoteUtilities connectedBluetoothRemote]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "connectedBluetoothRemote");
    id v5 = [v4 remoteType];
  }

  return (int64_t)v5;
}

+ (id)_bulletinImageTypeWithRemote:(id)a3
{
  id v7 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = objc_msgSend(v7, "_resolvedRemoteType:", objc_msgSend(location[0], "remoteType"));
  id v5 = [v7 _remoteImageIDForType:v3 defaultImageID:PBSSystemBulletinImageIDRemote];
  objc_storeStrong(location, 0LL);
  return v5;
}

+ (id)_bulletinLowBatteryCriticalImageTypWithRemote:(id)a3
{
  id v7 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = objc_msgSend(v7, "_resolvedRemoteType:", objc_msgSend(location[0], "remoteType"));
  id v5 = [v7 _remoteImageIDForType:v3 defaultImageID:PBSSystemBulletinImageIDRemoteBatteryWarning];
  objc_storeStrong(location, 0LL);
  return v5;
}

+ (id)_remoteImageIDForType:(int64_t)a3 defaultImageID:(id)a4
{
  id v8 = a1;
  SEL v7 = a2;
  int64_t v6 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  if ((unint64_t)(v6 - 1) <= 1)
  {
    id v9 = PBSSystemBulletinImageIDRemoteGen3;
  }

  else if (v6 == 3)
  {
    id v9 = PBSSystemBulletinImageIDRemoteExt1;
  }

  else if ((unint64_t)(v6 - 4) <= 1)
  {
    id v9 = PBSSystemBulletinImageIDRemoteGen4;
  }

  else
  {
    id v9 = location;
  }

  objc_storeStrong(&location, 0LL);
  return v9;
}

+ (id)_symbolImageNameForDevice:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = [location[0] vendorIdentifierAndProductIdentifier:&v9];
  id v7 =  +[UTType _typeWithBluetoothProductID:vendorID:]( &OBJC_CLASS___UTType,  "_typeWithBluetoothProductID:vendorID:",  v9,  (unsigned __int16)v8);
  id v4 = [v7 identifier];
  id v6 =  +[ISSymbol symbolForTypeIdentifier:withResolutionStrategy:variantOptions:error:]( &OBJC_CLASS___ISSymbol,  "symbolForTypeIdentifier:withResolutionStrategy:variantOptions:error:");

  id v5 = [v6 name];
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
  return v5;
}

+ (id)_productAssetPathForDevice:(id)a3 outIsVideoAsset:(BOOL *)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  char v11 = a4;
  [location[0] vendorIdentifierAndProductIdentifier:&v10];
  unsigned int v7 = v10;
  id v8 = [location[0] deviceColor];
  unsigned __int8 v4 = [v8 unsignedIntValue];
  id v9 =  +[TVPSDeviceAssetHelper smartRoutingAssetPathForPID:colorCode:outIsVideo:]( &OBJC_CLASS___TVPSDeviceAssetHelper,  "smartRoutingAssetPathForPID:colorCode:outIsVideo:",  v7,  v4,  v11);

  objc_storeStrong(location, 0LL);
  return v9;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)bulletinImageType
{
  return self->_bulletinImageType;
}

- (void)setBulletinImageType:(id)a3
{
}

- (NSString)symbolImageName
{
  return self->_symbolImageName;
}

- (void)setSymbolImageName:(id)a3
{
}

- (NSString)symbolConfiguration
{
  return self->_symbolConfiguration;
}

- (void)setSymbolConfiguration:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (int64_t)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(int64_t)a3
{
  self->_timeout = a3;
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
}

- (unint64_t)activationAction
{
  return self->_activationAction;
}

- (void)setActivationAction:(unint64_t)a3
{
  self->_activationAction = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (BOOL)isHighPriority
{
  return self->_isHighPriority;
}

- (void)setIsHighPriority:(BOOL)a3
{
  self->_isHighPriority = a3;
}

- (NSString)assetPath
{
  return self->_assetPath;
}

- (void)setAssetPath:(id)a3
{
}

- (BOOL)assetIsMovie
{
  return self->_assetIsMovie;
}

- (void)setAssetIsMovie:(BOOL)a3
{
  self->_assetIsMovie = a3;
}

- (void).cxx_destruct
{
}

@end
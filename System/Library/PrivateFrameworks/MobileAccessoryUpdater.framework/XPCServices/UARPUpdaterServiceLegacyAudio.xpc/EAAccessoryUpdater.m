@interface EAAccessoryUpdater
- (BOOL)accessoryVersionFromString:(id)a3 accyVersion:(id *)a4;
- (BOOL)consentRequired;
- (BOOL)isMultiAssetSession;
- (BOOL)isRoamingEnabled;
- (BOOL)prepareFirmwareBundlesFromDropbox:(id)a3 error:(id *)a4;
- (BOOL)setSeedParticipationStatusAndContinue;
- (BOOL)shouldUpdateBeSilent:(id)a3;
- (EAAccessoryUpdater)initWithCoder:(id)a3;
- (EAAccessoryUpdater)initWithDeviceClass:(id)a3 delegate:(id)a4 info:(id *)a5 options:(id)a6;
- (NSDictionary)initOptions;
- (NSMutableSet)seedLocations;
- (NSString)accessoryFusingType;
- (NSString)deviceClass;
- (NSString)localFilePath;
- (NSString)mobileAssetType;
- (NSURL)dropboxPath;
- (id)assetLocationForCustomBasejumperTrain:(id)a3 build:(id)a4;
- (id)assetLocationForType:(unint64_t)a3 withTrain:(id)a4;
- (id)getAssetLocation:(id)a3;
- (id)trainName;
- (int64_t)compareLongVersionString:(id *)a3 withFirmwareVersion:(id *)a4;
- (void)allowConditionalDownloadOnCellular;
- (void)applyFirmwareWithOptions:(id)a3;
- (void)bootstrapWithOptions:(id)a3;
- (void)dealloc;
- (void)downloadFirmwareWithOptions:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)findFirmwareWithOptions:(id)a3 remote:(BOOL)a4;
- (void)finishWithOptions:(id)a3;
- (void)overrideUpdaterOptions;
- (void)personalizationResponse:(id)a3 response:(id)a4 status:(id)a5;
- (void)prepareFirmwareWithOptions:(id)a3;
- (void)setAccessoryFusingType:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceClass:(id)a3;
- (void)setDropboxPath:(id)a3;
- (void)setInitOptions:(id)a3;
- (void)setLocalFilePath:(id)a3;
- (void)setMobileAssetType:(id)a3;
- (void)setSeedLocations:(id)a3;
- (void)updateAccessoryInfoInDatabaseIfNeeded:(id)a3;
@end

@implementation EAAccessoryUpdater

- (EAAccessoryUpdater)initWithDeviceClass:(id)a3 delegate:(id)a4 info:(id *)a5 options:(id)a6
{
  v50.receiver = self;
  v50.super_class = (Class)&OBJC_CLASS___EAAccessoryUpdater;
  v11 = -[EAAccessoryUpdater init](&v50, "init");
  v12 = v11;
  if (!v11)
  {
    [MEMORY[8] log:7 format:@"Failed to init super"];
    return v12;
  }

  v11->delegate = (FudPluginDelegate *)a4;
  v11->initOptions = (NSDictionary *)a6;
  v12->deviceClass = (NSString *)a3;
  v12->localFilePath = 0LL;
  v12->seedLocations = 0LL;
  v13 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v12->seedLocations = v13;
  -[NSMutableSet addObject:](v13, "addObject:", @"https://mesu.apple.com/assets/AirPods2020AppleSeed/");
  -[NSMutableSet addObject:]( v12->seedLocations,  "addObject:",  @"https://basejumper.apple.com/AirPodsDeveloperSeed/");
  v14 = -[NSString componentsSeparatedByString:](v12->deviceClass, "componentsSeparatedByString:", @".");
  if (!v14)
  {
    delegate = v12->delegate;
    v41 = @"Failed to get components from device class";
    goto LABEL_27;
  }

  v15 = v14;
  if (-[NSArray count](v14, "count") <= 1)
  {
    delegate = v12->delegate;
    v41 = @"Invalid device class name for EA plugin type";
    goto LABEL_27;
  }

  v49 = a5;
  id v48 = -[NSArray objectAtIndex:](v15, "objectAtIndex:", (char *)-[NSArray count](v15, "count") - 2);
  mobileAssetType = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@.%@.EA",  @"com.apple.MobileAsset.MobileAccessoryUpdate",  v48);
  v17 = (NSDictionary *)copyPlistDeviceEntryFromDeviceClass(a3);
  v12->deviceOptions = v17;
  v18 = -[NSDictionary objectForKey:](v17, "objectForKey:", @"AlternateAssetTypes");
  v19 = v18;
  if (v18)
  {
    if ((unint64_t)-[NSMutableArray count](v18, "count") >= 2)
    {
      v59 = +[NSSortDescriptor sortDescriptorWithKey:ascending:selector:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:selector:",  0LL,  0LL,  "compare:");
      v19 = (NSMutableArray *)-[NSMutableArray sortedArrayUsingDescriptors:]( v19,  "sortedArrayUsingDescriptors:",  +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v59,  1LL));
    }

    v19 = +[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v19);
    -[NSMutableArray addObject:](v19, "addObject:", mobileAssetType);
    -[FudPluginDelegate log:format:](v12->delegate, "log:format:", 7LL, @"assetTypes = %@", v19);
  }

  deviceOptions = v12->deviceOptions;
  if (!deviceOptions)
  {
    delegate = v12->delegate;
    v41 = @"Failed to get plist entry for device class";
    goto LABEL_27;
  }

  unsigned int v21 = objc_msgSend( -[NSDictionary objectForKey:](deviceOptions, "objectForKey:", @"NeedsDeviceIdleCheck"),  "BOOLValue");
  unsigned __int8 v22 = objc_msgSend(objc_msgSend(a6, "objectForKey:", @"DeviceIdleLaunch"), "BOOLValue");
  if (v21 && (v22 & 1) == 0)
  {
    delegate = v12->delegate;
    v41 = @"Update requires Device Idle, bailing";
    uint64_t v42 = 7LL;
    goto LABEL_28;
  }

  v12->silentUpdateNoUI = objc_msgSend( -[NSDictionary objectForKey:]( v12->deviceOptions,  "objectForKey:",  @"SilentUpdateNoUI"),  "BOOLValue");
  v23 = v12->deviceOptions;
  if (v23)
  {
    id v24 = objc_msgSend(-[NSDictionary objectForKey:](v23, "objectForKey:", @"skipDFUMode"), "BOOLValue");
    v25 = v12->deviceOptions;
    if (v25)
    {
      unsigned int v26 = objc_msgSend( -[NSDictionary objectForKey:](v25, "objectForKey:", @"disableByteEscaping"),  "BOOLValue");
      v27 = v12->deviceOptions;
      if (v27)
      {
        id v28 = objc_msgSend(-[NSDictionary objectForKey:](v27, "objectForKey:", @"skipReconnect"), "BOOLValue");
        goto LABEL_15;
      }
    }

    else
    {
      unsigned int v26 = 0;
    }
  }

  else
  {
    unsigned int v26 = 0;
    id v24 = 0LL;
  }

  id v28 = 0LL;
LABEL_15:
  initOptions = v12->initOptions;
  if (initOptions) {
    id v30 = objc_msgSend( -[NSDictionary objectForKey:](initOptions, "objectForKey:", @"skipMinimumFirmwareVersionCheck"),  "BOOLValue");
  }
  else {
    id v30 = 0LL;
  }
  v12->restartOnlyUI = objc_msgSend( -[NSDictionary objectForKey:]( v12->deviceOptions,  "objectForKey:",  @"RestartRequiresUIOnly"),  "BOOLValue");
  if (v19)
  {
    v31 = (NSString *)-[NSMutableArray firstObject](v19, "firstObject");
    v12->mobileAssetType = v31;
    -[NSMutableArray removeObject:](v19, "removeObject:", v31);
    mobileAssetType = v12->mobileAssetType;
  }

  else
  {
    v12->mobileAssetType = mobileAssetType;
  }

  -[FudPluginDelegate log:format:]( v12->delegate,  "log:format:",  5LL,  @"Initializing EA Updater plugin for deviceClass:%@ asset-name:%@ skipDFU:%d skipByteEscape:%d skipVersionCheck:%d",  a3,  mobileAssetType,  v24,  v26,  v30);
  v32 = -[EAFirmwareUpdater initWithDeviceClass:assetType:skipDFU:byteEscape:skipReconnect:skipVersionCheck:options:serialNum:]( objc_alloc(&OBJC_CLASS___EAFirmwareUpdater),  "initWithDeviceClass:assetType:skipDFU:byteEscape:skipReconnect:skipVersionCheck:options:serialNum:",  a3,  v12->mobileAssetType,  v24,  v26 ^ 1,  v28,  v30,  v12->deviceOptions,  -[NSDictionary objectForKeyedSubscript:](v12->initOptions, "objectForKeyedSubscript:", @"SerialNumber"));
  v12->firmwareUpdater = v32;
  if (!v32)
  {
    delegate = v12->delegate;
    deviceClass = v12->deviceClass;
    v47 = v12->mobileAssetType;
    v41 = @"Failed to create EAFirmwareUpdater for deviceClass:%@ assetType:%@";
LABEL_27:
    uint64_t v42 = 3LL;
LABEL_28:
    -[FudPluginDelegate log:format:](delegate, "log:format:", v42, v41, deviceClass, v47);
    return 0LL;
  }

  v33 = v32;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v34 = v12->deviceOptions;
    v35 = -[EAFirmwareUpdater accessory](v33, "accessory");
    *(_DWORD *)buf = 136315650;
    v54 = "-[EAAccessoryUpdater initWithDeviceClass:delegate:info:options:]";
    __int16 v55 = 2112;
    v56 = v34;
    __int16 v57 = 2112;
    v58 = v35;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s: deviceOptions: %@, firmwareUpdater accessory: %@",  buf,  0x20u);
  }

  id v36 = -[NSDictionary objectForKeyedSubscript:](v12->initOptions, "objectForKeyedSubscript:", @"DeviceClass");
  id v37 = -[NSDictionary objectForKey:](v12->deviceOptions, "objectForKey:", @"NeedsAUDeveloperSettings");
  if (v36)
  {
    id v38 = copyPlistDeviceEntryFromDeviceClass(v36);
    id v39 = [v38 objectForKey:@"NeedsAUDeveloperSettings"];

    if (!v39) {
      goto LABEL_32;
    }
    goto LABEL_30;
  }

  if (v37)
  {
LABEL_30:
    if (!-[EAFirmwareUpdater accessory](v12->firmwareUpdater, "accessory")
      || -[EAAccessoryUpdater setSeedParticipationStatusAndContinue](v12, "setSeedParticipationStatusAndContinue"))
    {
      goto LABEL_32;
    }

    return 0LL;
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___EAAccessoryUpdater;
  -[EAAccessoryUpdater dealloc](&v3, "dealloc");
}

- (void)setDelegate:(id)a3
{
  self->delegate = (FudPluginDelegate *)a3;
}

- (BOOL)isMultiAssetSession
{
  return -[EAFirmwareUpdater isMultiAssetSession](self->firmwareUpdater, "isMultiAssetSession");
}

- (void)bootstrapWithOptions:(id)a3
{
}

- (BOOL)setSeedParticipationStatusAndContinue
{
  objc_super v3 = -[EAAccessory protocolStrings]( -[EAFirmwareUpdater accessory](self->firmwareUpdater, "accessory"),  "protocolStrings");
  v4 = -[EAAccessory name](-[EAFirmwareUpdater accessory](self->firmwareUpdater, "accessory"), "name");
  v5 = -[EAAccessory serialNumber](-[EAFirmwareUpdater accessory](self->firmwareUpdater, "accessory"), "serialNumber");
  if (v4) {
    BOOL v6 = v5 == 0LL;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    return 1;
  }
  v7 = v5;
  v32 = v4;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v33,  v37,  16LL);
  if (!v8)
  {
    unsigned int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    unint64_t v11 = 1LL;
    goto LABEL_19;
  }

  id v9 = v8;
  uint64_t v10 = *(void *)v34;
  unint64_t v11 = 1LL;
  v31 = v7;
  while (2)
  {
    for (i = 0LL; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v34 != v10) {
        objc_enumerationMutation(v3);
      }
      v13 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
      unsigned int v14 = [v13 containsString:@"dev"];
      if ((v14 & 1) != 0)
      {
        unint64_t v11 = 0LL;
LABEL_18:
        int v15 = v14 ^ 1;
        int v16 = 1;
        v7 = v31;
        goto LABEL_19;
      }

      if ([v13 containsString:@"insec"])
      {
        unint64_t v11 = 2LL;
        goto LABEL_18;
      }
    }

    id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v33,  v37,  16LL);
    unsigned int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    v7 = v31;
    if (v9) {
      continue;
    }
    break;
  }

- (id)getAssetLocation:(id)a3
{
  uint64_t v5 = AUDeveloperSettingsURLStringToType([a3 objectForKeyedSubscript:@"assetLocation"]);
  if (v5 == 5) {
    return -[EAAccessoryUpdater assetLocationForCustomBasejumperTrain:build:]( self,  "assetLocationForCustomBasejumperTrain:build:",  [a3 objectForKeyedSubscript:@"basejumperTrain"],  objc_msgSend(a3, "objectForKeyedSubscript:", @"basejumperBuild"));
  }
  uint64_t v6 = v5;
  if ([a3 objectForKeyedSubscript:@"basejumperBuild"]) {
    id v7 = 0LL;
  }
  else {
    id v7 = [a3 objectForKeyedSubscript:@"basejumperTrain"];
  }
  return -[EAAccessoryUpdater assetLocationForType:withTrain:](self, "assetLocationForType:withTrain:", v6, v7);
}

- (void)updateAccessoryInfoInDatabaseIfNeeded:(id)a3
{
  uint64_t v5 = -[EAAccessory name](-[EAFirmwareUpdater accessory](self->firmwareUpdater, "accessory"), "name");
  uint64_t v6 = -[EAAccessory firmwareRevision]( -[EAFirmwareUpdater accessory](self->firmwareUpdater, "accessory"),  "firmwareRevision");
  id v7 = -[EAAccessory modelNumber](-[EAFirmwareUpdater accessory](self->firmwareUpdater, "accessory"), "modelNumber");
  id v8 = [a3 mutableCopy];
  if ((objc_msgSend( objc_msgSend(a3, "objectForKeyedSubscript:", @"activeVersion"),  "isEqualToString:",  v6) & 1) == 0) {
    [v8 setObject:v6 forKeyedSubscript:@"activeVersion"];
  }
  if ((objc_msgSend( objc_msgSend(a3, "objectForKeyedSubscript:", @"modelNumber"),  "isEqualToString:",  v7) & 1) == 0) {
    [v8 setObject:v7 forKeyedSubscript:@"modelNumber"];
  }
  if ((objc_msgSend( objc_msgSend(a3, "objectForKeyedSubscript:", @"fusing"),  "isEqualToString:",  self->_accessoryFusingType) & 1) == 0) {
    [v8 setObject:self->_accessoryFusingType forKeyedSubscript:@"fusing"];
  }
  objc_msgSend( +[AUDeveloperSettingsDatabase sharedDatabase](AUDeveloperSettingsDatabase, "sharedDatabase"),  "addAccessoryWithSerialNumber:info:",  -[EAAccessory serialNumber](-[EAFirmwareUpdater accessory](self->firmwareUpdater, "accessory"), "serialNumber"),  +[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v8));
}

- (id)assetLocationForCustomBasejumperTrain:(id)a3 build:(id)a4
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@/%@%@",  getURLForAssetURLType(4uLL),  a3,  a3,  a4);
}

- (id)assetLocationForType:(unint64_t)a3 withTrain:(id)a4
{
  uint64_t v5 = 0LL;
  switch(a3)
  {
    case 0uLL:
      id v6 = a4;
      if (![a4 length]) {
        id v6 = -[EAAccessoryUpdater trainName](self, "trainName");
      }
      URLForAssetURLType = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  getURLForAssetURLType(0LL),  v6);
      goto LABEL_12;
    case 1uLL:
      URLForAssetURLType = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/MarimbaSeed",  getURLForAssetURLType(0LL),  v10);
      goto LABEL_12;
    case 2uLL:
      unint64_t v8 = 2LL;
      goto LABEL_11;
    case 3uLL:
      URLForAssetURLType = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/AirPods2022Seed",  getURLForAssetURLType(2uLL),  v10);
      goto LABEL_12;
    case 4uLL:
      unint64_t v8 = 4LL;
      goto LABEL_11;
    case 6uLL:
      unint64_t v8 = 6LL;
LABEL_11:
      URLForAssetURLType = getURLForAssetURLType(v8);
LABEL_12:
      uint64_t v5 = URLForAssetURLType;
      break;
    default:
      break;
  }

  -[FudPluginDelegate log:format:](self->delegate, "log:format:", 7LL, @"Selected location: %@", v5);
  return v5;
}

- (id)trainName
{
  if (qword_10003DEE0 != -1) {
    dispatch_once(&qword_10003DEE0, &stru_10002DA78);
  }
  if (qword_10003DEE8) {
    return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s", qword_10003DEE8);
  }
  else {
    return 0LL;
  }
}

- (BOOL)accessoryVersionFromString:(id)a3 accyVersion:(id *)a4
{
  if (!a4) {
    return 0;
  }
  id v5 = [a3 componentsSeparatedByString:@"."];
  else {
    unint64_t v6 = objc_msgSend(objc_msgSend(v5, "objectAtIndex:", 3), "intValue");
  }
  a4->var3 = v6;
  else {
    unint64_t v7 = objc_msgSend(objc_msgSend(v5, "objectAtIndex:", 2), "intValue");
  }
  a4->var2 = v7;
  else {
    unint64_t v8 = objc_msgSend(objc_msgSend(v5, "objectAtIndex:", 1), "intValue");
  }
  a4->var1 = v8;
  id v9 = [v5 count];
  BOOL v10 = v9 != 0LL;
  if (v9) {
    unint64_t v11 = objc_msgSend(objc_msgSend(v5, "objectAtIndex:", 0), "intValue");
  }
  else {
    unint64_t v11 = 0LL;
  }
  a4->var0 = v11;
  return v10;
}

- (int64_t)compareLongVersionString:(id *)a3 withFirmwareVersion:(id *)a4
{
  if (a4->var0 > a3->var0) {
    goto LABEL_6;
  }
  if (a4->var0 < a3->var0) {
    goto LABEL_8;
  }
  unint64_t var1 = a4->var1;
  unint64_t v8 = a3->var1;
  if (var1 > v8)
  {
LABEL_6:
    int64_t v11 = -1LL;
    goto LABEL_9;
  }

  if (var1 < v8) {
    goto LABEL_8;
  }
  unint64_t var2 = a4->var2;
  unint64_t v10 = a3->var2;
  if (var2 > v10) {
    goto LABEL_6;
  }
  if (var2 < v10)
  {
LABEL_8:
    int64_t v11 = 1LL;
    goto LABEL_9;
  }

  unint64_t var3 = a4->var3;
  unint64_t v14 = a3->var3;
  BOOL v15 = var3 > v14;
  BOOL v16 = var3 < v14;
  if (v15) {
    int64_t v11 = -1LL;
  }
  else {
    int64_t v11 = v16;
  }
LABEL_9:
  -[FudPluginDelegate log:format:]( self->delegate,  "log:format:",  6LL,  @"Comparing Result: %ld, AccessoryVersion: %lld.%lld.%lld.%lld FirmwareVersion: %lld.%lld.%lld.%lld",  v11,  a3->var0,  a3->var1,  a3->var2,  a3->var3,  a4->var0,  a4->var1,  a4->var2,  a4->var3);
  return v11;
}

- (BOOL)prepareFirmwareBundlesFromDropbox:(id)a3 error:(id *)a4
{
  unint64_t v6 = +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  NSURLIsDirectoryKey,  NSURLLocalizedNameKey,  0LL);
  if (!MGGetBoolAnswer(@"InternalBuild", v7))
  {
    BOOL v15 = @"Not Applicable.";
    goto LABEL_15;
  }

  -[FudPluginDelegate log:format:]( self->delegate,  "log:format:",  5LL,  @"%s: attempting to use files from dropbox: %@",  "-[EAAccessoryUpdater prepareFirmwareBundlesFromDropbox:error:]",  self->dropboxPath);
  unint64_t v8 = -[EAFirmwareUpdater currentFirmwareVersionOnAcc](self->firmwareUpdater, "currentFirmwareVersionOnAcc");
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  if (!-[EAAccessoryUpdater accessoryVersionFromString:accyVersion:]( self,  "accessoryVersionFromString:accyVersion:",  v8,  &v31))
  {
    BOOL v15 = @"Accessory Firmware Version Reading Error";
    goto LABEL_15;
  }

  [a3 setObject:v8 forKey:@"existingFWVersionOnAccessory"];
  id v9 = -[NSArray mutableCopy]( -[NSFileManager contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:",  self->dropboxPath,  v6,  4LL,  0LL),  "mutableCopy");
  [v9 sortUsingComparator:&stru_10002DAB8];
  if (![v9 count])
  {
    BOOL v15 = @"No Firmware Bundle Is Available";
LABEL_15:
    if (!a4) {
      return 0;
    }
    NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
    __int128 v34 = v15;
    BOOL v16 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.EAAccessoryUpdater",  -1LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
    BOOL result = 0;
    *a4 = v16;
    return result;
  }

  -[FudPluginDelegate log:format:]( self->delegate,  "log:format:",  5LL,  @"Firmware Bundles (In Descending Oder):%@",  v9);
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (!v10)
  {
LABEL_13:
    -[FudPluginDelegate log:format:]( self->delegate,  "log:format:",  5LL,  @"Using firmware bundle in dropbox: %@",  0LL);
LABEL_14:
    BOOL v15 = @"No Firmware Bundle Is Available, either the folder name is incorrect or no firmware bundle has higher firmware version.";
    goto LABEL_15;
  }

  id v11 = v10;
  uint64_t v12 = *(void *)v28;
LABEL_6:
  uint64_t v13 = 0LL;
  while (1)
  {
    if (*(void *)v28 != v12) {
      objc_enumerationMutation(v9);
    }
    unint64_t v14 = *(void **)(*((void *)&v27 + 1) + 8 * v13);
    uint64_t v26 = 0LL;
    [v14 getResourceValue:&v26 forKey:NSURLLocalizedNameKey error:0];
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    if (-[EAAccessoryUpdater accessoryVersionFromString:accyVersion:]( self,  "accessoryVersionFromString:accyVersion:",  v26,  &v24))
    {
      -[FudPluginDelegate log:format:](self->delegate, "log:format:", 6LL, @"Checking firmware bundle: %@", v14);
      v23[0] = v31;
      v23[1] = v32;
      v22[0] = v24;
      v22[1] = v25;
      if (-[EAAccessoryUpdater compareLongVersionString:withFirmwareVersion:]( self,  "compareLongVersionString:withFirmwareVersion:",  v23,  v22) == -1) {
        break;
      }
    }

    if (v11 == (id)++v13)
    {
      id v11 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v11) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }

  [a3 setObject:v26 forKey:@"newFWVersion"];
  -[FudPluginDelegate log:format:]( self->delegate,  "log:format:",  5LL,  @"Using firmware bundle in dropbox: %@",  v14);
  if (!v14) {
    goto LABEL_14;
  }
  id v18 = -[NSFileManager contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:",  +[NSURL URLWithString:relativeToURL:]( &OBJC_CLASS___NSURL,  "URLWithString:relativeToURL:",  @"FirmwareImage",  v14),  v6,  4LL,  0LL);
  if (!-[NSArray count](v18, "count"))
  {
    BOOL v15 = @"Cannot locate available firmware files";
    goto LABEL_15;
  }

  id v19 = -[NSFileManager contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:",  +[NSURL URLWithString:relativeToURL:]( &OBJC_CLASS___NSURL,  "URLWithString:relativeToURL:",  @"BuildManifest",  v14),  v6,  4LL,  0LL);
  if (-[NSArray count](v19, "count"))
  {
    -[FudPluginDelegate log:format:]( self->delegate,  "log:format:",  5LL,  @"Using BuildManifest: %@",  -[NSArray objectAtIndex:](v19, "objectAtIndex:", 0LL));
    v20 = +[NSDictionary dictionaryWithContentsOfURL:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:",  -[NSArray objectAtIndex:](v19, "objectAtIndex:", 0LL));
    if (!v20)
    {
      BOOL v15 = @"Failed to Read from Build Manifest";
      goto LABEL_15;
    }
  }

  else
  {
    v20 = 0LL;
  }

  -[EAFirmwareUpdater setFirmwareURL:withManifest:signature:certificate:hash:]( self->firmwareUpdater,  "setFirmwareURL:withManifest:signature:certificate:hash:",  -[NSArray objectAtIndex:](v18, "objectAtIndex:", 0LL),  v20,  0LL,  0LL,  0LL);
  return 1;
}

- (void)findFirmwareWithOptions:(id)a3 remote:(BOOL)a4
{
  BOOL v4 = a4;
  -[FudPluginDelegate log:format:]( self->delegate,  "log:format:",  5LL,  @"Entering: %s:%d",  "-[EAAccessoryUpdater findFirmwareWithOptions:remote:]",  839LL);
  id v7 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  unsigned int v8 = -[EAAccessoryUpdater consentRequired](self, "consentRequired");
  deviceClass = -[EAFirmwareUpdater name](self->firmwareUpdater, "name");
  if (self->restartOnlyUI) {
    objc_msgSend( v7,  "setObject:forKey:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1),  @"SilentUpdateNoUI");
  }
  if (!-[EAFirmwareUpdater accessory](self->firmwareUpdater, "accessory"))
  {
    -[FudPluginDelegate log:format:]( self->delegate,  "log:format:",  3LL,  @"%s: No EA Accessory info for %@",  "-[EAAccessoryUpdater findFirmwareWithOptions:remote:]",  self->deviceClass);
    goto LABEL_7;
  }

  if (-[EAFirmwareUpdater isMultiAssetSession](self->firmwareUpdater, "isMultiAssetSession"))
  {
    -[FudPluginDelegate log:format:]( self->delegate,  "log:format:",  3LL,  @"%s: multi asset session - find NOP %@",  "-[EAAccessoryUpdater findFirmwareWithOptions:remote:]",  self->deviceClass);
LABEL_11:
    delegate = self->delegate;
    uint64_t v14 = 1LL;
    id v15 = v7;
LABEL_12:
    uint64_t v16 = 1LL;
LABEL_13:
    uint64_t v12 = 0LL;
    goto LABEL_14;
  }

  if (a3)
  {
    if ([a3 objectForKeyedSubscript:@"FirmwareBundle"])
    {
      -[EAFirmwareUpdater setFirmwareBundle:]( self->firmwareUpdater,  "setFirmwareBundle:",  [a3 objectForKeyedSubscript:@"FirmwareBundle"]);
      goto LABEL_11;
    }

    if ([a3 objectForKey:@"LocalFWImage"])
    {
      id v17 = [a3 objectForKey:@"LocalFWImage"];
      id v18 = [a3 objectForKey:@"LocalBuildManifest"];
      id v19 = [a3 objectForKey:@"LocalSignature"];
      id v20 = [a3 objectForKey:@"LocalCertificate"];
      id v32 = [a3 objectForKey:@"LocalHash"];
      -[FudPluginDelegate log:format:]( self->delegate,  "log:format:",  6LL,  @"%s: local files fw=%@ manifest=%@ signature=%@ certificate=%@",  "-[EAAccessoryUpdater findFirmwareWithOptions:remote:]",  v17,  v18,  v19,  v20);
      if (!-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  v17)
        || v18
        && !-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  v18))
      {
        goto LABEL_7;
      }

      __int128 v31 = +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v18);
      unsigned int v21 = +[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v19);
      id v22 = +[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v20);
      uint64_t v23 = v22;
      if (!v19 || v21)
      {
        if (!v20 || v22)
        {
          if (v32)
          {
            __int128 v30 = +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v32,  1LL,  0LL);
            if (!v30)
            {
              -[FudPluginDelegate log:format:]( self->delegate,  "log:format:",  3LL,  @"%s: Can not open hash file (%@)",  "-[EAAccessoryUpdater findFirmwareWithOptions:remote:]",  v32);
              goto LABEL_7;
            }
          }

          else
          {
            __int128 v30 = 0LL;
          }

          if (v17 && (!v18 || v31))
          {
            -[EAFirmwareUpdater setFirmwareURL:withManifest:signature:certificate:hash:]( self->firmwareUpdater,  "setFirmwareURL:withManifest:signature:certificate:hash:",  +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v17),  v31,  v21,  v23,  v30);
            goto LABEL_11;
          }
        }

        else
        {
          -[FudPluginDelegate log:format:]( self->delegate,  "log:format:",  3LL,  @"%s: Can not open certificate file (%@)",  "-[EAAccessoryUpdater findFirmwareWithOptions:remote:]",  v20);
        }
      }

      else
      {
        -[FudPluginDelegate log:format:]( self->delegate,  "log:format:",  3LL,  @"%s: Can not open signature file (%@)",  "-[EAAccessoryUpdater findFirmwareWithOptions:remote:]",  v19);
      }

- (void)downloadFirmwareWithOptions:(id)a3
{
  v8[0] = 0LL;
  v8[1] = v8;
  v8[2] = 0x3052000000LL;
  v8[3] = sub_100016A1C;
  v8[4] = sub_100016A2C;
  v8[5] = 0LL;
  unsigned __int8 v4 = -[EAAccessoryUpdater consentRequired](self, "consentRequired");
  if (-[EAFirmwareUpdater isMultiAssetSession](self->firmwareUpdater, "isMultiAssetSession"))
  {
    -[FudPluginDelegate log:format:]( self->delegate,  "log:format:",  3LL,  @"%s: multi asset session - download NOP %@",  "-[EAAccessoryUpdater downloadFirmwareWithOptions:]",  self->deviceClass);
    -[FudPluginDelegate didDownload:info:error:](self->delegate, "didDownload:info:error:", 1LL, 0LL, 0LL);
  }

  else
  {
    firmwareUpdater = self->firmwareUpdater;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100016A38;
    v6[3] = &unk_10002DB08;
    unsigned __int8 v7 = v4;
    v6[4] = self;
    v6[5] = v8;
    -[EAFirmwareUpdater downloadAsset:](firmwareUpdater, "downloadAsset:", v6);
  }

  _Block_object_dispose(v8, 8);
}

- (void)personalizationResponse:(id)a3 response:(id)a4 status:(id)a5
{
}

- (void)prepareFirmwareWithOptions:(id)a3
{
}

- (void)applyFirmwareWithOptions:(id)a3
{
  firmwareUpdater = self->firmwareUpdater;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100016D28;
  v8[3] = &unk_10002DB30;
  v8[4] = self;
  v6[4] = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100016D84;
  v7[3] = &unk_10002DB58;
  v7[4] = self;
  v5[4] = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100016E00;
  v6[3] = &unk_10002DB80;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100016EB0;
  v5[3] = &unk_10002DBA8;
  -[EAFirmwareUpdater applyFirmware:progress:update:personalization:]( firmwareUpdater,  "applyFirmware:progress:update:personalization:",  v8,  v7,  v6,  v5);
}

- (void)finishWithOptions:(id)a3
{
  if (-[EAAccessoryUpdater consentRequired](self, "consentRequired")) {
    -[EAFirmwareUpdater purgeAsset](self->firmwareUpdater, "purgeAsset");
  }
  if (self->restartOnlyUI) {
    unsigned __int8 v4 = &__NSDictionary0__struct;
  }
  else {
    unsigned __int8 v4 = 0LL;
  }
  -[FudPluginDelegate didFinish:info:error:](self->delegate, "didFinish:info:error:", 1LL, v4, 0LL);
}

- (BOOL)shouldUpdateBeSilent:(id)a3
{
  return -[EAFirmwareUpdater forceSilentUpdate](self->firmwareUpdater, "forceSilentUpdate");
}

- (BOOL)consentRequired
{
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  id v3 = -[EAFirmwareUpdater assetLocation](self->firmwareUpdater, "assetLocation");
  -[FudPluginDelegate log:format:]( self->delegate,  "log:format:",  7LL,  @"%s: asset Location %@",  "-[EAAccessoryUpdater consentRequired]",  v3);
  if (v3 && -[NSMutableSet count](self->seedLocations, "count"))
  {
    seedLocations = self->seedLocations;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10001710C;
    v7[3] = &unk_10002DBD0;
    v7[4] = v3;
    void v7[5] = self;
    v7[6] = &v8;
    -[NSMutableSet enumerateObjectsUsingBlock:](seedLocations, "enumerateObjectsUsingBlock:", v7);
    BOOL v5 = *((_BYTE *)v9 + 24) != 0;
  }

  else
  {
    BOOL v5 = 0;
    *((_BYTE *)v9 + 24) = 0;
  }

  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)overrideUpdaterOptions
{
  id v3 = copyPlistDeviceEntryFromDeviceClass(self->deviceClass);
  if (v3)
  {
    if ([v3 objectForKey:@"closeEASession"]) {
      -[EAFirmwareUpdater setCloseEASession:]( self->firmwareUpdater,  "setCloseEASession:",  objc_msgSend(objc_msgSend(v3, "objectForKey:", @"closeEASession"), "BOOLValue"));
    }
    if ([v3 objectForKey:@"dropboxPath"]) {
      self->localFilePath = (NSString *)[v3 objectForKey:@"dropboxPath"];
    }
  }
}

- (void)allowConditionalDownloadOnCellular
{
  deviceOptions = self->deviceOptions;
  if (deviceOptions
    && objc_msgSend( -[NSDictionary objectForKey:](deviceOptions, "objectForKey:", @"NeedsMADownloadOnCellular"),  "BOOLValue")
    && ((MGGetBoolAnswer(@"InternalBuild", v4) & 1) != 0
     || !-[EAAccessoryUpdater isRoamingEnabled](self, "isRoamingEnabled")))
  {
    -[FudPluginDelegate log:format:]( self->delegate,  "log:format:",  7LL,  @"%s: MA Download On cellular allowed for %@",  "-[EAAccessoryUpdater allowConditionalDownloadOnCellular]",  self->deviceClass);
    -[EAFirmwareUpdater setDownloadOnCellularAllowed:](self->firmwareUpdater, "setDownloadOnCellularAllowed:", 1LL);
  }

- (BOOL)isRoamingEnabled
{
  -[FudPluginDelegate log:format:](self->delegate, "log:format:", 7LL, @"isRoamingEnabled = %d", 1LL);
  return 1;
}

- (EAAccessoryUpdater)initWithCoder:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___EAAccessoryUpdater;
  BOOL v5 = -[EAAccessoryUpdater init](&v14, "init");
  v5->delegate = 0LL;
  v5->deviceClass = (NSString *)[a3 decodeObjectForKey:@"DeviceClass"];
  v5->mobileAssetType = (NSString *)[a3 decodeObjectForKey:@"MobileAssetType"];
  v5->initOptions = (NSDictionary *)[a3 decodeObjectForKey:@"InitOptions"];
  unint64_t v6 = (NSDictionary *)copyPlistDeviceEntryFromDeviceClass(v5->deviceClass);
  v5->deviceOptions = v6;
  if (!v6)
  {
    -[FudPluginDelegate log:format:]( v5->delegate,  "log:format:",  3LL,  @"Failed to get plist entry for device class");
    return 0LL;
  }

  id v7 = objc_msgSend(-[NSDictionary objectForKey:](v6, "objectForKey:", @"skipDFUMode"), "BOOLValue");
  deviceOptions = v5->deviceOptions;
  if (deviceOptions)
  {
    unsigned int v9 = objc_msgSend( -[NSDictionary objectForKey:](deviceOptions, "objectForKey:", @"disableByteEscaping"),  "BOOLValue");
    uint64_t v10 = v5->deviceOptions;
    if (v10)
    {
      id v11 = objc_msgSend(-[NSDictionary objectForKey:](v10, "objectForKey:", @"skipReconnect"), "BOOLValue");
      goto LABEL_5;
    }
  }

  else
  {
    unsigned int v9 = 0;
  }

  id v11 = 0LL;
LABEL_5:
  uint64_t v12 = -[EAFirmwareUpdater initWithDeviceClass:assetType:skipDFU:byteEscape:skipReconnect:skipVersionCheck:options:serialNum:]( objc_alloc(&OBJC_CLASS___EAFirmwareUpdater),  "initWithDeviceClass:assetType:skipDFU:byteEscape:skipReconnect:skipVersionCheck:options:serialNum:",  v5->deviceClass,  v5->mobileAssetType,  v7,  v9 ^ 1,  v11,  0LL,  v5->deviceOptions,  -[NSDictionary objectForKey:](v5->initOptions, "objectForKey:", @"SerialNumber"));
  v5->firmwareUpdater = v12;
  if (!v12) {
    return 0LL;
  }
  if (-[EAFirmwareUpdater overrideProtocol](v12, "overrideProtocol")) {
    -[EAAccessoryUpdater overrideUpdaterOptions](v5, "overrideUpdaterOptions");
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  initOptions = self->initOptions;
  if (initOptions) {
    [a3 encodeObject:initOptions forKey:@"InitOptions"];
  }
}

- (NSString)deviceClass
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setDeviceClass:(id)a3
{
}

- (NSString)mobileAssetType
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setMobileAssetType:(id)a3
{
}

- (NSDictionary)initOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setInitOptions:(id)a3
{
}

- (NSString)localFilePath
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setLocalFilePath:(id)a3
{
}

- (NSMutableSet)seedLocations
{
  return (NSMutableSet *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setSeedLocations:(id)a3
{
}

- (NSURL)dropboxPath
{
  return (NSURL *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setDropboxPath:(id)a3
{
}

- (NSString)accessoryFusingType
{
  return (NSString *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setAccessoryFusingType:(id)a3
{
}

@end
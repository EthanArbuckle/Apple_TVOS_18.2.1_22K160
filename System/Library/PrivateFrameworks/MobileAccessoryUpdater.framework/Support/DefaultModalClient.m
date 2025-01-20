@interface DefaultModalClient
- (BOOL)areAllUpdatesRequired;
- (DefaultModalClient)initWithGroup:(id)a3;
- (NSString)modalDeviceClass;
- (id)copyNotificationOptions;
- (void)dealloc;
- (void)deviceClassAttached:(id)a3;
- (void)deviceClassDetached:(id)a3 error:(id)a4;
- (void)setInstallerUpdateActive:(BOOL)a3;
- (void)setModalDeviceClass:(id)a3;
- (void)shouldInstallUpdateForAccessory:(id)a3 deviceClass:(id)a4 nextStep:(id)a5 withOptions:(id)a6 handler:(id)a7;
- (void)stepComplete:(id)a3 deviceClass:(id)a4 successful:(BOOL)a5 info:(id)a6 error:(id)a7;
- (void)stepRunning:(id)a3 deviceClass:(id)a4 progress:(double)a5 overallProgress:(double)a6 info:(id)a7;
- (void)storeDeclinedAccessoryatURL:(id)a3 serialNumber:(id)a4;
@end

@implementation DefaultModalClient

- (DefaultModalClient)initWithGroup:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___DefaultModalClient;
  uint64_t v15 = 0LL;
  v4 = -[DefaultModalClient init](&v14, "init");
  v4->modalDeviceClass = 0LL;
  v4->ignorePromptResponse = 0;
  v4->lastUpdateTime = 0LL;
  v4->updateInProgress = 0;
  v4->updater = 0LL;
  v4->notification = 0LL;
  v4->useProgressBar = 0;
  v5 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 3LL);
  v4->queuedAccessories = v5;
  v4->installerUpdateActive = 0;
  if (!v5)
  {
    v11 = @"Failed to allocate queued array for MAU init";
LABEL_12:
    FudLog(3LL, v11);
    v12 = v4;
    return 0LL;
  }

  v6 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_BACKGROUND, 0);
  v4->attr = (OS_dispatch_queue_attr *)v6;
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.MobileAccessoryUpdater.defaultmodalclient", v6);
  v4->processingQueue = (OS_dispatch_queue *)v7;
  if (!v7)
  {
    v11 = @"Failed to allocate processing queue";
    goto LABEL_12;
  }

  v8 = +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  @"com.apple.fud.defaultmodalclient",  @"ClientRegistrationName");
  if (!v8)
  {
    v11 = @"Failed to allocate options for MAU init";
    goto LABEL_12;
  }

  v9 = -[MobileAccessoryUpdater initWithPluginIdentifier:isGroupIdentifier:delegate:isInternalClient:options:error:]( objc_alloc(&OBJC_CLASS___MobileAccessoryUpdater),  "initWithPluginIdentifier:isGroupIdentifier:delegate:isInternalClient:options:error:",  a3,  1LL,  v4,  1LL,  v8,  &v15);
  v4->updater = v9;
  if (!v9)
  {
    v11 = @"Failed to create MAU updater for DMC: %@";
    goto LABEL_12;
  }

  v10 =  +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___MobileAccessoryUpdater));
  v4->frameworkBundle = v10;
  if (v10)
  {
    if (!-[NSBundle isLoaded](v10, "isLoaded")) {
      -[NSBundle load](v4->frameworkBundle, "load");
    }
  }

  else
  {
    FudLog(3LL, @"Failed to get NSBundle to MAU framework for localized strings, continuing…");
  }

  return v4;
}

- (void)setInstallerUpdateActive:(BOOL)a3
{
  self->installerUpdateActive = a3;
}

- (void)deviceClassAttached:(id)a3
{
  processingQueue = (dispatch_queue_s *)self->processingQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100023BA8;
  v4[3] = &unk_1000754A8;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(processingQueue, v4);
}

- (void)deviceClassDetached:(id)a3 error:(id)a4
{
  processingQueue = (dispatch_queue_s *)self->processingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100023D0C;
  block[3] = &unk_1000754F8;
  block[4] = a3;
  block[5] = a4;
  block[6] = self;
  dispatch_async(processingQueue, block);
}

- (void)stepRunning:(id)a3 deviceClass:(id)a4 progress:(double)a5 overallProgress:(double)a6 info:(id)a7
{
  FudLog(5LL, @"Modal Default Client - step:%@  device:%@ progress:%f overall-progress:%f stepInfo=%@");
  if ((objc_msgSend( objc_msgSend( a7,  "objectForKey:",  @"SilentUpdateNoUI",  a3,  a4,  *(void *)&a5,  *(void *)&a6,  a7),  "BOOLValue") & 1) == 0)
  {
    processingQueue = (dispatch_queue_s *)self->processingQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100023EA0;
    block[3] = &unk_1000758D0;
    block[4] = a3;
    block[5] = self;
    *(double *)&block[8] = a6;
    block[6] = a4;
    void block[7] = a7;
    dispatch_async(processingQueue, block);
  }

- (void)shouldInstallUpdateForAccessory:(id)a3 deviceClass:(id)a4 nextStep:(id)a5 withOptions:(id)a6 handler:(id)a7
{
  uint64_t v42 = 0LL;
  v43 = &v42;
  uint64_t v44 = 0x2020000000LL;
  char v45 = 1;
  SInt32 error = 0;
  id v11 = objc_msgSend(a6, "objectForKey:", @"UpdateRequired", a4, a5);
  id v12 = [a6 objectForKey:@"OptionsDict"];
  id v13 = [a6 objectForKey:@"SeedConsentRequired"];
  BOOL v37 = v13 != 0LL;
  id v14 = [a6 objectForKey:@"AccessoryName"];
  id v15 = [a6 objectForKey:@"SeedUpdateDeclinedPath"];
  if (v15) {
    v36 = +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v15);
  }
  else {
    v36 = 0LL;
  }
  id v16 = [a6 objectForKey:@"SerialNumber"];
  if (v14) {
    id v17 = v14;
  }
  else {
    id v17 = a3;
  }
  if (v12)
  {
    id v12 = [v12 objectForKey:@"CurrentFirmwareVersionOnAccessory"];
    BOOL v18 = v12 != 0LL;
    if (!v11) {
      goto LABEL_12;
    }
  }

  else
  {
    BOOL v18 = 0;
    if (!v11) {
      goto LABEL_12;
    }
  }

  if ([v11 BOOLValue])
  {
LABEL_13:
    v19 = @"This update is required, skipping UI.";
    uint64_t v20 = 5LL;
LABEL_14:
    FudLog(v20, v19);
    goto LABEL_16;
  }

- (void)storeDeclinedAccessoryatURL:(id)a3 serialNumber:(id)a4
{
  v6 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  if (a3 && a4)
  {
    dispatch_queue_t v7 = v6;
    if (([a3 checkResourceIsReachableAndReturnError:0] & 1) == 0) {
      -[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:]( v7,  "createDirectoryAtURL:withIntermediateDirectories:attributes:error:",  a3,  1LL,  0LL,  0LL);
    }
    id v8 = [a3 URLByAppendingPathComponent:a4];
    FudLog(7LL, @"Saving declined accessory at url %@");
    if (!-[NSFileManager createFileAtPath:contents:attributes:]( v7,  "createFileAtPath:contents:attributes:",  objc_msgSend(v8, "path", v8),  objc_msgSend(a4, "dataUsingEncoding:", 4),  0)) {
      FudLog(3LL, @"Failed to save declined accessory at url %@");
    }
  }

- (void)stepComplete:(id)a3 deviceClass:(id)a4 successful:(BOOL)a5 info:(id)a6 error:(id)a7
{
  processingQueue = (dispatch_queue_s *)self->processingQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000249F0;
  v8[3] = &unk_100075970;
  v8[4] = self;
  v8[5] = a4;
  v8[6] = a6;
  v8[7] = a3;
  BOOL v9 = a5;
  v8[8] = a7;
  dispatch_async(processingQueue, v8);
}

- (BOOL)areAllUpdatesRequired
{
  v2 = -[NSUserDefaults persistentDomainForName:]( +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"),  "persistentDomainForName:",  @"com.apple.MobileAccessoryUpdater");
  if (v2
    && (id v3 = -[NSDictionary objectForKey:](v2, "objectForKey:", @"AllUpdatesRequired")) != 0LL
    && (v4 = v3, uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v4, v5) & 1) != 0))
  {
    return [v4 BOOLValue];
  }

  else
  {
    return 0;
  }

- (id)copyNotificationOptions
{
  v2 = -[NSMutableDictionary initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableDictionary), "initWithCapacity:", 4LL);
  -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", kCFBooleanFalse, @"DismissOnLock");
  -[NSMutableDictionary setObject:forKey:]( v2,  "setObject:forKey:",  kCFBooleanTrue,  @"SBUserNotificationDontDismissOnUnlock");
  return v2;
}

- (void)dealloc
{
  notification = self->notification;
  if (notification) {
    CFRelease(notification);
  }
  updater = self->updater;
  if (updater) {

  }
  frameworkBundle = self->frameworkBundle;
  if (frameworkBundle) {

  }
  queuedAccessories = self->queuedAccessories;
  if (queuedAccessories) {

  }
  modalDeviceClass = self->modalDeviceClass;
  if (modalDeviceClass) {

  }
  processingQueue = (dispatch_object_s *)self->processingQueue;
  if (processingQueue) {
    dispatch_release(processingQueue);
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DefaultModalClient;
  -[DefaultModalClient dealloc](&v9, "dealloc");
}

- (NSString)modalDeviceClass
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setModalDeviceClass:(id)a3
{
}

@end
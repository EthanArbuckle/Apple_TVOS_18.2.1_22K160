@interface FudEarlyBoot
- (FudEarlyBoot)init;
- (int)doFUDEarlyBoot:(id)a3;
- (void)calculateTimeTakenForEarlyBootEntries;
- (void)dealloc;
- (void)earlyBootAccessoryAttached:(id)a3;
- (void)updateFWForDeviceClass:(id)a3 dict:(id)a4;
@end

@implementation FudEarlyBoot

- (FudEarlyBoot)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___FudEarlyBoot;
  return -[FudEarlyBoot init](&v3, "init");
}

- (int)doFUDEarlyBoot:(id)a3
{
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (!v5)
  {
    FudLog(3LL, @"%s(): array creation failed");
    int v20 = 1;
    goto LABEL_19;
  }

  v6 = v5;
  v7 = -[AppleFirmwareUpdateController initWithRegistryEntryID:fwAssetDirectory:]( objc_alloc(&OBJC_CLASS___AppleFirmwareUpdateController),  "initWithRegistryEntryID:fwAssetDirectory:",  0LL,  0LL);
  self->_afuController = v7;
  if (!v7)
  {
    v18 = @"Failed to create AppleFirmwareUpdateController";
LABEL_22:
    uint64_t v19 = 5LL;
    goto LABEL_16;
  }

  -[AppleFirmwareUpdateController getEarlyBootList:](v7, "getEarlyBootList:", v6);
  if (!-[NSMutableArray count](v6, "count"))
  {
    v18 = @"No Early Boot Accessories";
    goto LABEL_22;
  }

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        v12 = self;
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v6);
        }
        v13 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        id v14 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
        id v15 = [v13 objectForKeyedSubscript:@"DeviceClassName"];
        objc_msgSend( v14,  "addEntriesFromDictionary:",  objc_msgSend(v13, "objectForKeyedSubscript:", @"OptionsDict"));
        if (a3) {
          [v14 addEntriesFromDictionary:a3];
        }
        id v22 = v14;
        FudLog(7LL, @"%s(): sending the following dict %@");
        self = v12;
        -[FudEarlyBoot updateFWForDeviceClass:dict:](v12, "updateFWForDeviceClass:dict:", v15, v14);
      }

      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
    }

    while (v9);
  }

  if (!objc_msgSend( -[AppleFirmwareUpdateController getPendingEarlyBootAccessories]( self->_afuController,  "getPendingEarlyBootAccessories"),  "count")) {
    goto LABEL_17;
  }
  self->_startWaitingForCriticalEarlyBootEntries = +[NSDate date](&OBJC_CLASS___NSDate, "date");
  self->_semaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0LL);
  -[AppleFirmwareUpdateController setDelegate:](self->_afuController, "setDelegate:", self);
  -[AppleFirmwareUpdateController registerForPendingEarlyBootAccessories]( self->_afuController,  "registerForPendingEarlyBootAccessories");
  semaphore = self->_semaphore;
  dispatch_time_t v17 = dispatch_time(0LL, 5000000000LL);
  if (!dispatch_semaphore_wait((dispatch_semaphore_t)semaphore, v17)) {
    goto LABEL_17;
  }
  id v22 = -[AppleFirmwareUpdateController getPendingEarlyBootAccessories]( self->_afuController,  "getPendingEarlyBootAccessories");
  v18 = @"%s: Timed out waiting for pending critical earlyBoot entries %@";
  uint64_t v19 = 3LL;
LABEL_16:
  FudLog(v19, v18);
LABEL_17:
  -[NSMutableArray removeAllObjects](v6, "removeAllObjects", "-[FudEarlyBoot doFUDEarlyBoot:]", v22);

  int v20 = 0;
LABEL_19:
  -[FudEarlyBoot calculateTimeTakenForEarlyBootEntries](self, "calculateTimeTakenForEarlyBootEntries");
  FudLog(5LL, @"%s(): End Early Boot");

  return v20;
}

- (void)calculateTimeTakenForEarlyBootEntries
{
  if (self->_startWaitingForCriticalEarlyBootEntries) {
    -[NSDate timeIntervalSinceDate:]( +[NSDate date](&OBJC_CLASS___NSDate, "date"),  "timeIntervalSinceDate:",  self->_startWaitingForCriticalEarlyBootEntries);
  }
  FudLog(5LL, @"%s Time Taken to wait for critical earlyBoot entries: %f sec");
}

- (void)earlyBootAccessoryAttached:(id)a3
{
  id v5 = [a3 objectForKeyedSubscript:@"DeviceClassName"];
  id v6 = [a3 objectForKeyedSubscript:@"OptionsDict"];
  FudLog(7LL, @"%s(): sending the following dict %@");
  -[FudEarlyBoot updateFWForDeviceClass:dict:]( self,  "updateFWForDeviceClass:dict:",  v5,  objc_msgSend( a3,  "objectForKeyedSubscript:",  @"OptionsDict",  "-[FudEarlyBoot earlyBootAccessoryAttached:]",  v6));
  if (!objc_msgSend( -[AppleFirmwareUpdateController getPendingEarlyBootAccessories]( self->_afuController,  "getPendingEarlyBootAccessories"),  "count"))
  {
    FudLog(5LL, @"%s(): pending critical entries complete");
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
  }

- (void)dealloc
{
  semaphore = self->_semaphore;
  if (semaphore)
  {
    dispatch_release((dispatch_object_t)semaphore);
    self->_semaphore = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___FudEarlyBoot;
  -[FudEarlyBoot dealloc](&v4, "dealloc");
}

- (void)updateFWForDeviceClass:(id)a3 dict:(id)a4
{
  FudLog(5LL, @"%s(): \ndeviceClass=%@ \ndict=%@");
  v7 = -[AppleFirmwareUpdateController initWithRegistryEntryID:fwAssetDirectory:]( [AppleFirmwareUpdateController alloc],  "initWithRegistryEntryID:fwAssetDirectory:",  objc_msgSend( a4,  "objectForKeyedSubscript:",  @"IOMatchLaunchServiceID",  "-[FudEarlyBoot updateFWForDeviceClass:dict:]",  a3,  a4),  objc_msgSend(a4, "objectForKeyedSubscript:", @"FWDirectory"));
  -[AppleFirmwareUpdateController enableEarlyBootLoggingMode](v7, "enableEarlyBootLoggingMode");
}

@end
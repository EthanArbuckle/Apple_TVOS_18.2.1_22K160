@interface CLPersistenceStore
- (BOOL)loadWithCoordinator:(id)a3;
- (CLPersistenceStore)initWithURL:(id)a3 useCloudKit:(BOOL)a4;
- (NSDictionary)options;
- (NSString)storeType;
- (NSURL)url;
- (id)persistentStoreDescription;
- (void)dealloc;
- (void)setUpCloudKit;
- (void)setUpCloudKitForProd;
- (void)setUpCloudKitForTest;
@end

@implementation CLPersistenceStore

- (CLPersistenceStore)initWithURL:(id)a3 useCloudKit:(BOOL)a4
{
  BOOL v4 = a4;
  if (!a3) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"CLPersistenceStore.m",  36LL,  @"Invalid parameter not satisfying: %@",  @"URL");
  }
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CLPersistenceStore;
  v7 = -[CLPersistenceStore init](&v10, "init");
  if (v7)
  {
    v8 = objc_opt_new(&OBJC_CLASS___NSPersistentStoreDescription);
    v7->_storeDescription = v8;
    -[NSPersistentStoreDescription setShouldAddStoreAsynchronously:](v8, "setShouldAddStoreAsynchronously:", 0LL);
    -[NSPersistentStoreDescription setShouldMigrateStoreAutomatically:]( v7->_storeDescription,  "setShouldMigrateStoreAutomatically:",  1LL);
    -[NSPersistentStoreDescription setShouldInferMappingModelAutomatically:]( v7->_storeDescription,  "setShouldInferMappingModelAutomatically:",  1LL);
    -[NSPersistentStoreDescription setURL:](v7->_storeDescription, "setURL:", a3);
    -[NSPersistentStoreDescription setType:](v7->_storeDescription, "setType:", NSSQLiteStoreType);
    -[NSPersistentStoreDescription setOption:forKey:]( v7->_storeDescription,  "setOption:forKey:",  NSFileProtectionCompleteUnlessOpen,  NSPersistentStoreFileProtectionKey);
    -[NSPersistentStoreDescription setValue:forPragmaNamed:]( v7->_storeDescription,  "setValue:forPragmaNamed:",  @"WAL",  @"journal_mode");
    if (v4) {
      -[CLPersistenceStore setUpCloudKit](v7, "setUpCloudKit");
    }
  }

  return v7;
}

- (void)setUpCloudKit
{
  if ([@"com.apple.locationd.clx" isEqualToString:@"com.apple.locationd.clx"])
  {
    -[CLPersistenceStore setUpCloudKitForProd](self, "setUpCloudKitForProd");
  }

  else if ([@"com.apple.locationd.clx" isEqualToString:@"com.apple.locationd.clx.test"])
  {
    -[CLPersistenceStore setUpCloudKitForTest](self, "setUpCloudKitForTest");
  }

  else
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"CLPersistenceStore.m",  74LL,  @"CoreData+CloudKit, Please implement setUpCloudKit for this new container %@",  @"com.apple.locationd.clx");
  }

- (void)setUpCloudKitForProd
{
  id v3 = objc_alloc_init(&OBJC_CLASS___CKContainerOptions);
  [v3 setUseZoneWidePCS:1];
  id v4 = [[NSCloudKitMirroringDelegateOptions alloc] initWithContainerIdentifier:@"com.apple.locationd.clx"];
  [v4 setContainerOptions:v3];
  [v4 setUseDeviceToDeviceEncryption:1];
  [v4 setOperationMemoryThresholdBytes:&off_1018D4568];
  id v5 = [[NSCloudKitMirroringDelegate alloc] initWithOptions:v4];
  -[NSPersistentStoreDescription setMirroringDelegate:](self->_storeDescription, "setMirroringDelegate:", v5);
  v6 = -[NSPersistentCloudKitContainerOptions initWithContainerIdentifier:]( objc_alloc(&OBJC_CLASS___NSPersistentCloudKitContainerOptions),  "initWithContainerIdentifier:",  @"com.apple.locationd.clx");
  -[NSPersistentCloudKitContainerOptions setApsConnectionMachServiceName:]( v6,  "setApsConnectionMachServiceName:",  @"com.apple.aps.locationd");
  -[NSPersistentCloudKitContainerOptions setUseDeviceToDeviceEncryption:](v6, "setUseDeviceToDeviceEncryption:", 1LL);
  -[NSPersistentStoreDescription setCloudKitContainerOptions:]( self->_storeDescription,  "setCloudKitContainerOptions:",  v6);
  -[NSPersistentStoreDescription setOption:forKey:]( self->_storeDescription,  "setOption:forKey:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 2LL),  NSPersistentStoreConnectionPoolMaxSizeKey);
}

- (void)setUpCloudKitForTest
{
  id v3 = [[NSCloudKitMirroringDelegateOptions alloc] initWithContainerIdentifier:@"com.apple.locationd.clx"];
  id v4 = [[NSCloudKitMirroringDelegate alloc] initWithOptions:v3];
  -[NSPersistentStoreDescription setMirroringDelegate:](self->_storeDescription, "setMirroringDelegate:", v4);
  id v5 = -[NSPersistentCloudKitContainerOptions initWithContainerIdentifier:]( objc_alloc(&OBJC_CLASS___NSPersistentCloudKitContainerOptions),  "initWithContainerIdentifier:",  @"com.apple.locationd.clx");
  -[NSPersistentCloudKitContainerOptions setApsConnectionMachServiceName:]( v5,  "setApsConnectionMachServiceName:",  @"com.apple.aps.locationd");
  -[NSPersistentStoreDescription setCloudKitContainerOptions:]( self->_storeDescription,  "setCloudKitContainerOptions:",  v5);
}

- (BOOL)loadWithCoordinator:(id)a3
{
  uint64_t v8 = 0LL;
  v9 = &v8;
  uint64_t v10 = 0x3052000000LL;
  v11 = sub_100D4C094;
  v12 = sub_100D4C0A4;
  uint64_t v13 = 0LL;
  storeDescription = self->_storeDescription;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100D4C0B0;
  v7[3] = &unk_10187B448;
  v7[4] = &v8;
  [a3 addPersistentStoreWithDescription:storeDescription completionHandler:v7];
  uint64_t v5 = v9[5];
  if (v5) {
    NSLog(@"CoreData, Could not add store with error = %@", v9[5]);
  }
  else {
    NSLog(@"CoreData, Successfully loaded store into NSPersistentStoreCoordinator!");
  }
  _Block_object_dispose(&v8, 8);
  return v5 == 0;
}

- (NSURL)url
{
  return -[NSPersistentStoreDescription URL](self->_storeDescription, "URL");
}

- (NSString)storeType
{
  return -[NSPersistentStoreDescription type](self->_storeDescription, "type");
}

- (NSDictionary)options
{
  return -[NSPersistentStoreDescription options](self->_storeDescription, "options");
}

- (id)persistentStoreDescription
{
  return self->_storeDescription;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLPersistenceStore;
  -[CLPersistenceStore dealloc](&v3, "dealloc");
}

@end
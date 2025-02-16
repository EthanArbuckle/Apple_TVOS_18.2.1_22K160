@interface NSPersistentStoreCoordinatorMigrationContext
- (BOOL)forceMigration;
- (NSDictionary)metadata;
- (NSDictionary)options;
- (NSPersistentStore)migratedStore;
- (NSPersistentStoreCoordinatorMigrationContext)initWithStoreURL:(id)a3 type:(id)a4 options:(id)a5;
- (NSStagedMigrationManager)stagedMigrationManager;
- (NSString)configurationName;
- (NSString)destinationConfigurationForCloudKitValidation;
- (NSString)storeType;
- (NSURL)storeURL;
- (void)dealloc;
- (void)setConfigurationName:(id)a3;
- (void)setDestinationConfigurationForCloudKitValidation:(id)a3;
- (void)setForceMigration:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setMigratedStore:(id)a3;
- (void)setStagedMigrationManager:(id)a3;
@end

@implementation NSPersistentStoreCoordinatorMigrationContext

- (NSPersistentStoreCoordinatorMigrationContext)initWithStoreURL:(id)a3 type:(id)a4 options:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSPersistentStoreCoordinatorMigrationContext;
  v8 = -[NSPersistentStoreCoordinatorMigrationContext init](&v10, sel_init);
  if (v8)
  {
    v8->_storeURL = (NSURL *)a3;
    v8->_storeType = (NSString *)a4;
    v8->_options = (NSDictionary *)a5;
  }

  return v8;
}

- (void)dealloc
{
  self->_configurationName = 0LL;
  self->_destinationConfigurationForCloudKitValidation = 0LL;

  self->_metadata = 0LL;
  self->_migratedStore = 0LL;

  self->_stagedMigrationManager = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSPersistentStoreCoordinatorMigrationContext;
  -[NSPersistentStoreCoordinatorMigrationContext dealloc](&v3, sel_dealloc);
}

- (NSURL)storeURL
{
  return self->_storeURL;
}

- (NSString)storeType
{
  return self->_storeType;
}

- (NSString)configurationName
{
  return self->_configurationName;
}

- (void)setConfigurationName:(id)a3
{
}

- (NSString)destinationConfigurationForCloudKitValidation
{
  return self->_destinationConfigurationForCloudKitValidation;
}

- (void)setDestinationConfigurationForCloudKitValidation:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (BOOL)forceMigration
{
  return self->_forceMigration;
}

- (void)setForceMigration:(BOOL)a3
{
  self->_forceMigration = a3;
}

- (NSPersistentStore)migratedStore
{
  return self->_migratedStore;
}

- (void)setMigratedStore:(id)a3
{
}

- (NSStagedMigrationManager)stagedMigrationManager
{
  return self->_stagedMigrationManager;
}

- (void)setStagedMigrationManager:(id)a3
{
}

@end
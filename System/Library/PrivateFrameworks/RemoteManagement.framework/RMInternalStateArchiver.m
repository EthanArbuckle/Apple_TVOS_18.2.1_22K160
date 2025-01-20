@interface RMInternalStateArchiver
+ (RMInternalStateArchiver)sharedArchiver;
- (NSDictionary)deviceStatusByKeyPath;
- (NSDictionary)pushTokenByEnvironmentName;
- (NSPersistentContainer)persistentContainer;
- (NSPersistentHistoryToken)commandAndDeclarationStatusPersistentHistoryToken;
- (RMInternalStateArchiver)initWithPersistentContainer:(id)a3;
- (RMPersistentActiveIdentifiers)persistentActiveIdentifiers;
- (id)_unarchiveObjectOfClass:(Class)a3 forKey:(id)a4;
- (id)_unarchiveObjectOfClasses:(id)a3 forKey:(id)a4;
- (void)_archiveObject:(id)a3 forKey:(id)a4;
- (void)configurationPublisher:(id)a3 didChangePersistentActiveIdentifiers:(id)a4;
- (void)internalStatusPublisher:(id)a3 didChangeCommandAndDeclarationsPersistentHistoryToken:(id)a4;
- (void)internalStatusPublisher:(id)a3 didChangeDeviceStatusByKeyPath:(id)a4;
- (void)pushController:(id)a3 didChangePushTokenByEnvironmentName:(id)a4;
- (void)setCommandAndDeclarationStatusPersistentHistoryToken:(id)a3;
- (void)setDeviceStatusByKeyPath:(id)a3;
- (void)setPersistentActiveIdentifiers:(id)a3;
- (void)setPushTokenByEnvironmentName:(id)a3;
@end

@implementation RMInternalStateArchiver

+ (RMInternalStateArchiver)sharedArchiver
{
  if (qword_1000CF148 != -1) {
    dispatch_once(&qword_1000CF148, &stru_1000B9FE0);
  }
  return (RMInternalStateArchiver *)(id)qword_1000CF140;
}

- (void)setCommandAndDeclarationStatusPersistentHistoryToken:(id)a3
{
}

- (NSPersistentHistoryToken)commandAndDeclarationStatusPersistentHistoryToken
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSPersistentHistoryToken, a2);
  return (NSPersistentHistoryToken *)-[RMInternalStateArchiver _unarchiveObjectOfClass:forKey:]( self,  "_unarchiveObjectOfClass:forKey:",  v3,  @"InternalStateArchiver.CommandAndDeclarationsPersistentHistoryToken");
}

- (void)setDeviceStatusByKeyPath:(id)a3
{
}

- (NSDictionary)deviceStatusByKeyPath
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSArray);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNull);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDate);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSUUID);
  v10 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v3,  v4,  v5,  v6,  v7,  v8,  v9,  objc_opt_class(&OBJC_CLASS___NSURL),  0LL);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue( -[RMInternalStateArchiver _unarchiveObjectOfClasses:forKey:]( self,  "_unarchiveObjectOfClasses:forKey:",  v11,  @"InternalStateArchiver.DeviceStatusByKeyPath"));

  return (NSDictionary *)v12;
}

- (void)setPersistentActiveIdentifiers:(id)a3
{
}

- (RMPersistentActiveIdentifiers)persistentActiveIdentifiers
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___RMPersistentActiveIdentifiers, a2);
  return (RMPersistentActiveIdentifiers *)-[RMInternalStateArchiver _unarchiveObjectOfClass:forKey:]( self,  "_unarchiveObjectOfClass:forKey:",  v3,  @"InternalStateArchiver.PersistentActiveIdentifiers");
}

- (void)setPushTokenByEnvironmentName:(id)a3
{
}

- (NSDictionary)pushTokenByEnvironmentName
{
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v5 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v3,  v4,  objc_opt_class(&OBJC_CLASS___NSData),  0LL);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[RMInternalStateArchiver _unarchiveObjectOfClasses:forKey:]( self,  "_unarchiveObjectOfClasses:forKey:",  v6,  @"InternalStateArchiver.PushTokenByEnvironmentName"));

  return (NSDictionary *)v7;
}

- (RMInternalStateArchiver)initWithPersistentContainer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RMInternalStateArchiver;
  uint64_t v6 = -[RMInternalStateArchiver init](&v9, "init");
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_persistentContainer, a3);
  }

  return v7;
}

- (void)configurationPublisher:(id)a3 didChangePersistentActiveIdentifiers:(id)a4
{
}

- (void)internalStatusPublisher:(id)a3 didChangeDeviceStatusByKeyPath:(id)a4
{
}

- (void)internalStatusPublisher:(id)a3 didChangeCommandAndDeclarationsPersistentHistoryToken:(id)a4
{
}

- (void)pushController:(id)a3 didChangePushTokenByEnvironmentName:(id)a4
{
}

- (void)_archiveObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[RMInternalStateArchiver persistentContainer](self, "persistentContainer"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v11 persistentStoreCoordinator]);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 persistentStores]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
  +[RMPersistentController archiveObject:forKey:intoMetadataForPersistentStore:]( &OBJC_CLASS___RMPersistentController,  "archiveObject:forKey:intoMetadataForPersistentStore:",  v7,  v6,  v10);
}

- (id)_unarchiveObjectOfClass:(Class)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMInternalStateArchiver persistentContainer](self, "persistentContainer"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 persistentStoreCoordinator]);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 persistentStores]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[RMPersistentController unarchiveObjectOfClass:forKey:fromMetadataForPersistentStore:]( &OBJC_CLASS___RMPersistentController,  "unarchiveObjectOfClass:forKey:fromMetadataForPersistentStore:",  a3,  v6,  v10));

  return v11;
}

- (id)_unarchiveObjectOfClasses:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMInternalStateArchiver persistentContainer](self, "persistentContainer"));
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 persistentStoreCoordinator]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 persistentStores]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[RMPersistentController unarchiveObjectOfClasses:forKey:fromMetadataForPersistentStore:]( &OBJC_CLASS___RMPersistentController,  "unarchiveObjectOfClasses:forKey:fromMetadataForPersistentStore:",  v7,  v6,  v11));

  return v12;
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (void).cxx_destruct
{
}

@end
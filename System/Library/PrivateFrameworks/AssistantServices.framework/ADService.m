@interface ADService
- (ADServiceDelegate)delegate;
- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4;
- (BOOL)isSystemService;
- (BOOL)requiresBootMaintenance;
- (BOOL)usesManagedStorageForDomain:(id)a3;
- (NSArray)controlCenterLockRestrictedCommands;
- (NSArray)firstUnlockRestrictedCommands;
- (NSSet)managedStorageDomains;
- (NSString)description;
- (NSString)identifier;
- (id)commandsForDomain:(id)a3;
- (id)customVocabSyncInfo;
- (id)domains;
- (id)handle;
- (id)lockRestrictedCommands;
- (id)syncKeys;
- (void)beginSyncForInfo:(id)a3 chunkHandler:(id)a4;
- (void)fetchSyncSnapshotForInfo:(id)a3 handler:(id)a4;
- (void)getInfoWithCompletion:(id)a3;
- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6;
- (void)handleResponse:(id)a3 toCommand:(id)a4 completion:(id)a5;
- (void)runMaintenanceWorkWithCompletion:(id)a3;
- (void)setControlCenterLockRestrictedCommands:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFirstUnlockRestrictedCommands:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setManagedStorageDomains:(id)a3;
- (void)setRequiresBootMaintenance:(BOOL)a3;
@end

@implementation ADService

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ADService;
  v3 = -[ADService description](&v7, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingFormat:@" %@", self->_identifier]);

  return (NSString *)v5;
}

- (id)handle
{
  return 0LL;
}

- (id)domains
{
  return 0LL;
}

- (id)commandsForDomain:(id)a3
{
  return 0LL;
}

- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4
{
  return 0;
}

- (BOOL)usesManagedStorageForDomain:(id)a3
{
  return -[NSSet containsObject:](self->_managedStorageDomains, "containsObject:", a3);
}

- (id)syncKeys
{
  return 0LL;
}

- (id)customVocabSyncInfo
{
  return 0LL;
}

- (id)lockRestrictedCommands
{
  return 0LL;
}

- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6
{
  if (a6)
  {
    id v7 = a6;
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"ADServiceError",  -1LL,  0LL));
    (*((void (**)(id, void, id))a6 + 2))(v7, 0LL, v8);
  }

- (void)handleResponse:(id)a3 toCommand:(id)a4 completion:(id)a5
{
  if (a5) {
    (*((void (**)(id))a5 + 2))(a5);
  }
}

- (void)beginSyncForInfo:(id)a3 chunkHandler:(id)a4
{
  if (a4) {
    (*((void (**)(id, void, void, void))a4 + 2))(a4, 0LL, 0LL, 0LL);
  }
}

- (void)fetchSyncSnapshotForInfo:(id)a3 handler:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0LL);
  }
}

- (void)runMaintenanceWorkWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)getInfoWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    v12 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADService domains](self, "domains"));
    if (v6) {
      [v5 setObject:v6 forKey:@"Domains"];
    }
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADService firstUnlockRestrictedCommands](self, "firstUnlockRestrictedCommands"));

    if (v7) {
      [v5 setObject:v7 forKey:@"First Unlock Restricted Commands"];
    }
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADService controlCenterLockRestrictedCommands](self, "controlCenterLockRestrictedCommands"));

    if (v8) {
      [v5 setObject:v8 forKey:@"Control Center Lock Restricted Commands"];
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet allObjects](self->_managedStorageDomains, "allObjects"));

    if (v9) {
      [v5 setObject:v9 forKey:@"Managed Storage Domains"];
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADService syncKeys](self, "syncKeys"));

    if (v10) {
      [v5 setObject:v10 forKey:@"Sync Keys"];
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ADService lockRestrictedCommands](self, "lockRestrictedCommands"));

    if (v11) {
      [v5 setObject:v11 forKey:@"Lock Restricted Commands"];
    }
    v12[2](v12, v5);

    v4 = v12;
  }
}

- (BOOL)isSystemService
{
  return 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSSet)managedStorageDomains
{
  return self->_managedStorageDomains;
}

- (void)setManagedStorageDomains:(id)a3
{
}

- (NSArray)firstUnlockRestrictedCommands
{
  return self->_firstUnlockRestrictedCommands;
}

- (void)setFirstUnlockRestrictedCommands:(id)a3
{
}

- (NSArray)controlCenterLockRestrictedCommands
{
  return self->_controlCenterLockRestrictedCommands;
}

- (void)setControlCenterLockRestrictedCommands:(id)a3
{
}

- (BOOL)requiresBootMaintenance
{
  return self->_requiresBootMaintenance;
}

- (void)setRequiresBootMaintenance:(BOOL)a3
{
  self->_requiresBootMaintenance = a3;
}

- (ADServiceDelegate)delegate
{
  return (ADServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
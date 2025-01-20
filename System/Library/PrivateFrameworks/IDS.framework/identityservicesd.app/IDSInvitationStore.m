@interface IDSInvitationStore
- (BOOL)isEmpty;
- (IDSInvitationStore)init;
- (IDSPersistentMap)persistentMap;
- (id)persistedPendingInvitationsForService:(id)a3;
- (id)persistedReceivedInvitationsForService:(id)a3;
- (void)persistPendingInvitation:(id)a3 forService:(id)a4 withUniqueID:(id)a5;
- (void)persistReceivedInvitation:(id)a3 forService:(id)a4 withUniqueID:(id)a5;
- (void)removePendingInvitation:(id)a3 forService:(id)a4;
- (void)removeReceivedInvitation:(id)a3 forService:(id)a4;
- (void)setPersistentMap:(id)a3;
@end

@implementation IDSInvitationStore

- (IDSInvitationStore)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___IDSInvitationStore;
  v3 = -[IDSInvitationStore init](&v13, "init");
  if (v3)
  {
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary, v2);
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSData, v5);
    v8 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v4,  v6,  objc_opt_class(&OBJC_CLASS___NSString, v7),  0LL);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = -[IDSPersistentMap initWithIdentifier:versionNumber:decodableClasses:migrationBlock:]( objc_alloc(&OBJC_CLASS___IDSPersistentMap),  "initWithIdentifier:versionNumber:decodableClasses:migrationBlock:",  @"com.apple.identityservicesd.invitation.store",  1LL,  v9,  0LL);
    persistentMap = v3->_persistentMap;
    v3->_persistentMap = v10;
  }

  return v3;
}

- (BOOL)isEmpty
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSInvitationStore persistentMap](self, "persistentMap"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allKeys]);
  BOOL v4 = [v3 count] == 0;

  return v4;
}

- (id)persistedPendingInvitationsForService:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-sentInvitations",  a3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPersistentMap objectForKey:](self->_persistentMap, "objectForKey:", v4));

  return v5;
}

- (void)persistPendingInvitation:(id)a3 forService:(id)a4 withUniqueID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue( -[IDSInvitationStore persistedPendingInvitationsForService:]( self,  "persistedPendingInvitationsForService:",  v9));
  id v17 = v11;
  if (v11) {
    v12 = (NSMutableDictionary *)[v11 mutableCopy];
  }
  else {
    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  objc_super v13 = v12;
  -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v10, v8);

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-sentInvitations",  v9));
  persistentMap = self->_persistentMap;
  id v16 = -[NSMutableDictionary copy](v13, "copy");
  -[IDSPersistentMap setObject:forKey:](persistentMap, "setObject:forKey:", v16, v14);
}

- (void)removePendingInvitation:(id)a3 forService:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[IDSInvitationStore persistedPendingInvitationsForService:]( self,  "persistedPendingInvitationsForService:",  v6));
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 mutableCopy];
    [v9 removeObjectsForKeys:v13];
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-sentInvitations",  v6));
    persistentMap = self->_persistentMap;
    id v12 = [v9 copy];
    -[IDSPersistentMap setObject:forKey:](persistentMap, "setObject:forKey:", v12, v10);
  }
}

- (id)persistedReceivedInvitationsForService:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-receivedInvitation",  a3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSPersistentMap objectForKey:](self->_persistentMap, "objectForKey:", v4));

  return v5;
}

- (void)persistReceivedInvitation:(id)a3 forService:(id)a4 withUniqueID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue( -[IDSInvitationStore persistedReceivedInvitationsForService:]( self,  "persistedReceivedInvitationsForService:",  v9));
  id v17 = v11;
  if (v11) {
    id v12 = (NSMutableDictionary *)[v11 mutableCopy];
  }
  else {
    id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  id v13 = v12;
  -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v10, v8);

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-receivedInvitation",  v9));
  persistentMap = self->_persistentMap;
  id v16 = -[NSMutableDictionary copy](v13, "copy");
  -[IDSPersistentMap setObject:forKey:](persistentMap, "setObject:forKey:", v16, v14);
}

- (void)removeReceivedInvitation:(id)a3 forService:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[IDSInvitationStore persistedReceivedInvitationsForService:]( self,  "persistedReceivedInvitationsForService:",  v6));
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 mutableCopy];
    [v9 removeObjectsForKeys:v13];
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-receivedInvitation",  v6));
    persistentMap = self->_persistentMap;
    id v12 = [v9 copy];
    -[IDSPersistentMap setObject:forKey:](persistentMap, "setObject:forKey:", v12, v10);
  }
}

- (IDSPersistentMap)persistentMap
{
  return self->_persistentMap;
}

- (void)setPersistentMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
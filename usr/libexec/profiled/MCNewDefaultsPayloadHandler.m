@interface MCNewDefaultsPayloadHandler
- (BOOL)_install;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (MCNewDefaultsPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4;
- (NSMutableSet)changedDomains;
- (void)_remove;
- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4;
- (void)didRemoveOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4;
- (void)remove;
- (void)setChangedDomains:(id)a3;
@end

@implementation MCNewDefaultsPayloadHandler

- (MCNewDefaultsPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MCNewDefaultsPayloadHandler;
  v4 = -[MCNewPayloadHandler initWithPayload:profileHandler:](&v8, "initWithPayload:profileHandler:", a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    changedDomains = v4->_changedDomains;
    v4->_changedDomains = v5;
  }

  return v4;
}

- (BOOL)_install
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domains]);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v4 count]));

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domains", 0));
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
        -[NSMutableSet addObject:](self->_changedDomains, "addObject:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v3 defaultsForDomain:v11]);
        if (!+[MCManagedPreferencesManager addManagedPreferences:toDomain:]( &OBJC_CLASS___MCManagedPreferencesManager,  "addManagedPreferences:toDomain:",  v12,  v11))
        {

          BOOL v15 = 0;
          goto LABEL_14;
        }

        v13 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v11]);
        if (v13)
        {
          id v14 = v13;
          [v13 addEntriesFromDictionary:v12];
        }

        else
        {
          id v14 = [v12 mutableCopy];
        }

        [v5 setObject:v14 forKey:v11];
      }

      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  BOOL v15 = 1;
LABEL_14:

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCHacks sharedHacks](&OBJC_CLASS___MCHacks, "sharedHacks"));
  [v16 _sendChangeNotificationsBasedOnDefaultsAdditionByDomain:v5];

  return v15;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  if (-[MCNewDefaultsPayloadHandler _install](self, "_install", a3, a4, a5))
  {
    id v7 = 0LL;
    BOOL v8 = 1;
  }

  else
  {
    uint64_t v9 = MCDefaultsErrorDomain;
    uint64_t v10 = MCErrorArray(@"DEFAULTS_COULD_NOT_INSTALL");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v9,  10000LL,  v11,  MCErrorTypeFatal,  0LL));

    BOOL v8 = v7 == 0LL;
    if (a6 && v7)
    {
      id v7 = v7;
      BOOL v8 = 0;
      *a6 = v7;
    }
  }

  return v8;
}

- (void)_remove
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domains]);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v4 count]));

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v3 domains]);
  id v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)i);
        -[NSMutableSet addObject:](self->_changedDomains, "addObject:", v10);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v3 defaultsForDomain:v10]);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 allKeys]);
        +[MCManagedPreferencesManager removeManagedPreferences:fromDomain:]( &OBJC_CLASS___MCManagedPreferencesManager,  "removeManagedPreferences:fromDomain:",  v12,  v10);
        [v5 setObject:v12 forKey:v10];
      }

      id v7 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v7);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCHacks sharedHacks](&OBJC_CLASS___MCHacks, "sharedHacks"));
  [v13 _sendChangeNotificationsBasedOnDefaultsRemovalByDomain:v5];
}

- (void)remove
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  unsigned __int8 v4 = [v3 isSetAside];

  if ((v4 & 1) == 0) {
    -[MCNewDefaultsPayloadHandler _remove](self, "_remove");
  }
}

- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_changedDomains, "allObjects", a3, a4));
  +[MCManagedPreferencesManager sendManagedPreferencesChangedNotificationForDomains:]( &OBJC_CLASS___MCManagedPreferencesManager,  "sendManagedPreferencesChangedNotificationForDomains:",  v4);
}

- (void)didRemoveOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_changedDomains, "allObjects", a3, a4));
  +[MCManagedPreferencesManager sendManagedPreferencesChangedNotificationForDomains:]( &OBJC_CLASS___MCManagedPreferencesManager,  "sendManagedPreferencesChangedNotificationForDomains:",  v4);
}

- (NSMutableSet)changedDomains
{
  return self->_changedDomains;
}

- (void)setChangedDomains:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
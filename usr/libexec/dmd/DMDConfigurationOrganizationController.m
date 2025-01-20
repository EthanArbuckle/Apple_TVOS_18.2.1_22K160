@interface DMDConfigurationOrganizationController
- (DMDConfigurationOrganizationController)initWithOrganization:(id)a3 delegate:(id)a4;
- (DMDConfigurationOrganizationControllerDelegate)delegate;
- (DMFConfigurationOrganization)organization;
- (NSArray)configurationSourceControllers;
- (NSArray)ephemeralConfigurationSources;
- (NSArray)persistentConfigurationSources;
- (NSMutableDictionary)ephemeralConfigurationSourceControllersByIdentifier;
- (NSMutableDictionary)persistentConfigurationSourceControllersByIdentifier;
- (NSString)description;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)type;
- (id)configurationSourceWithIdentifier:(id)a3;
- (id)registerConfigurationSource:(id)a3;
- (void)configurationSourceController:(id)a3 fetchEventsWithCompletionHandler:(id)a4;
- (void)configurationSourceController:(id)a3 fetchStatusUpdatesWithCompletionHandler:(id)a4;
- (void)resolveAssetWithContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setEphemeralConfigurationSourceControllersByIdentifier:(id)a3;
- (void)setPersistentConfigurationSourceControllersByIdentifier:(id)a3;
- (void)setType:(id)a3;
- (void)unregisterConfigurationSource:(id)a3;
- (void)updateWithOrganization:(id)a3;
@end

@implementation DMDConfigurationOrganizationController

- (DMDConfigurationOrganizationController)initWithOrganization:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___DMDConfigurationOrganizationController;
  v8 = -[DMDConfigurationOrganizationController init](&v16, "init");
  if (v8)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v6 identifier]);
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    objc_storeWeak((id *)&v8->_delegate, v7);
    v11 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    persistentConfigurationSourceControllersByIdentifier = v8->_persistentConfigurationSourceControllersByIdentifier;
    v8->_persistentConfigurationSourceControllersByIdentifier = v11;

    v13 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    ephemeralConfigurationSourceControllersByIdentifier = v8->_ephemeralConfigurationSourceControllersByIdentifier;
    v8->_ephemeralConfigurationSourceControllersByIdentifier = v13;

    -[DMDConfigurationOrganizationController updateWithOrganization:](v8, "updateWithOrganization:", v6);
  }

  return v8;
}

- (void)updateWithOrganization:(id)a3
{
  id v5 = a3;
  if (!+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v33 = NSStringFromSelector(a2);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    [v32 handleFailureInMethod:a2, self, @"DMDConfigurationOrganizationController.m", 44, @"%@ must be called from the main thread", v34 object file lineNumber description];
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController identifier](self, "identifier"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  unsigned __int8 v8 = [v6 isEqualToString:v7];

  if ((v8 & 1) == 0)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v35 handleFailureInMethod:a2, self, @"DMDConfigurationOrganizationController.m", 45, @"Invalid parameter not satisfying: %@", @"[self.identifier isEqualToString:organization.identifier]" object file lineNumber description];
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 displayName]);
  -[DMDConfigurationOrganizationController setDisplayName:](self, "setDisplayName:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue([v5 type]);
  -[DMDConfigurationOrganizationController setType:](self, "setType:", v10);

  v36 = v5;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v5 persistentConfigurationSources]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 valueForKey:@"identifier"]);
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue( -[DMDConfigurationOrganizationController persistentConfigurationSourceControllersByIdentifier]( self,  "persistentConfigurationSourceControllersByIdentifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 allKeys]);

  id v15 = [v14 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v42;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v42 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v41 + 1) + 8LL * (void)i);
        if (([v12 containsObject:v19] & 1) == 0)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue( -[DMDConfigurationOrganizationController persistentConfigurationSourceControllersByIdentifier]( self,  "persistentConfigurationSourceControllersByIdentifier"));
          [v20 removeObjectForKey:v19];
        }
      }

      id v16 = [v14 countByEnumeratingWithState:&v41 objects:v46 count:16];
    }

    while (v16);
  }

  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v21 = v11;
  id v22 = [v21 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v38;
    do
    {
      for (j = 0LL; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v38 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)j);
        v27 = (void *)objc_claimAutoreleasedReturnValue( -[DMDConfigurationOrganizationController persistentConfigurationSourceControllersByIdentifier]( self,  "persistentConfigurationSourceControllersByIdentifier"));
        v28 = (void *)objc_claimAutoreleasedReturnValue([v26 identifier]);
        v29 = (DMDConfigurationSourceController *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v28]);

        if (v29) {
          -[DMDConfigurationSourceController updateWithConfigurationSource:](v29, "updateWithConfigurationSource:", v26);
        }
        else {
          v29 = -[DMDConfigurationSourceController initWithConfigurationSource:delegate:]( objc_alloc(&OBJC_CLASS___DMDConfigurationSourceController),  "initWithConfigurationSource:delegate:",  v26,  self);
        }
        v30 = (void *)objc_claimAutoreleasedReturnValue( -[DMDConfigurationOrganizationController persistentConfigurationSourceControllersByIdentifier]( self,  "persistentConfigurationSourceControllersByIdentifier"));
        v31 = (void *)objc_claimAutoreleasedReturnValue([v26 identifier]);
        [v30 setObject:v29 forKeyedSubscript:v31];
      }

      id v23 = [v21 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }

    while (v23);
  }
}

- (NSString)description
{
  id v7 = @"organization";
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
  uint64_t v4 = DMFObjectDescriptionWithProperties(self, v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return (NSString *)v5;
}

- (DMFConfigurationOrganization)organization
{
  v3 = objc_opt_new(&OBJC_CLASS___DMFConfigurationOrganization);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController identifier](self, "identifier"));
  -[DMFConfigurationOrganization setIdentifier:](v3, "setIdentifier:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController displayName](self, "displayName"));
  -[DMFConfigurationOrganization setDisplayName:](v3, "setDisplayName:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController type](self, "type"));
  -[DMFConfigurationOrganization setType:](v3, "setType:", v6);

  id v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( -[DMDConfigurationOrganizationController configurationSourceControllers]( self,  "configurationSourceControllers",  0LL));
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v15 + 1) + 8 * (void)v12) configurationSource]);
        -[NSMutableArray addObject:](v7, "addObject:", v13);

        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v10);
  }

  -[DMFConfigurationOrganization setRegisteredConfigurationSources:](v3, "setRegisteredConfigurationSources:", v7);
  return v3;
}

- (NSArray)configurationSourceControllers
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[DMDConfigurationOrganizationController persistentConfigurationSources]( self,  "persistentConfigurationSources"));
  -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[DMDConfigurationOrganizationController ephemeralConfigurationSources]( self,  "ephemeralConfigurationSources"));
  -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v5);

  id v6 = -[NSMutableArray copy](v3, "copy");
  return (NSArray *)v6;
}

- (NSArray)persistentConfigurationSources
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[DMDConfigurationOrganizationController persistentConfigurationSourceControllersByIdentifier]( self,  "persistentConfigurationSourceControllersByIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allValues]);

  return (NSArray *)v3;
}

- (NSArray)ephemeralConfigurationSources
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[DMDConfigurationOrganizationController ephemeralConfigurationSourceControllersByIdentifier]( self,  "ephemeralConfigurationSourceControllersByIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allValues]);

  return (NSArray *)v3;
}

- (id)configurationSourceWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[DMDConfigurationOrganizationController persistentConfigurationSourceControllersByIdentifier]( self,  "persistentConfigurationSourceControllersByIdentifier"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[DMDConfigurationOrganizationController ephemeralConfigurationSourceControllersByIdentifier]( self,  "ephemeralConfigurationSourceControllersByIdentifier"));
    id v8 = (id)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v4]);
  }

  return v8;
}

- (id)registerConfigurationSource:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[DMDConfigurationOrganizationController persistentConfigurationSourceControllersByIdentifier]( self,  "persistentConfigurationSourceControllersByIdentifier"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  id v7 = (DMDConfigurationSourceController *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);

  if (v7)
  {
    -[DMDConfigurationSourceController updateWithConfigurationSource:](v7, "updateWithConfigurationSource:", v4);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[DMDConfigurationOrganizationController ephemeralConfigurationSourceControllersByIdentifier]( self,  "ephemeralConfigurationSourceControllersByIdentifier"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    id v7 = (DMDConfigurationSourceController *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);

    if (v7) {
      -[DMDConfigurationSourceController updateWithConfigurationSource:](v7, "updateWithConfigurationSource:", v4);
    }
    else {
      id v7 = -[DMDConfigurationSourceController initWithConfigurationSource:delegate:]( objc_alloc(&OBJC_CLASS___DMDConfigurationSourceController),  "initWithConfigurationSource:delegate:",  v4,  self);
    }
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[DMDConfigurationOrganizationController ephemeralConfigurationSourceControllersByIdentifier]( self,  "ephemeralConfigurationSourceControllersByIdentifier"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    [v10 setObject:v7 forKeyedSubscript:v11];
  }

  v12 = v7;

  return v12;
}

- (void)unregisterConfigurationSource:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue( -[DMDConfigurationOrganizationController ephemeralConfigurationSourceControllersByIdentifier]( self,  "ephemeralConfigurationSourceControllersByIdentifier"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 organizationIdentifier]);

  [v6 removeObjectForKey:v5];
}

- (void)configurationSourceController:(id)a3 fetchStatusUpdatesWithCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController delegate](self, "delegate"));
  char v9 = objc_opt_respondsToSelector(v8, "configurationSourceController:fetchStatusUpdatesWithCompletionHandler:");

  if ((v9 & 1) != 0)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController delegate](self, "delegate"));
    [v11 configurationSourceController:v6 fetchStatusUpdatesWithCompletionHandler:v7];
  }

  else
  {
    uint64_t v12 = DMFConfigurationEngineLog(v10);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100062B94(self, "configurationSourceController:fetchStatusUpdatesWithCompletionHandler:");
    }

    (*((void (**)(id, void, void, void))v7 + 2))(v7, 0LL, 0LL, 0LL);
  }
}

- (void)configurationSourceController:(id)a3 fetchEventsWithCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController delegate](self, "delegate"));
  char v9 = objc_opt_respondsToSelector(v8, "configurationSourceController:fetchEventsWithCompletionHandler:");

  if ((v9 & 1) != 0)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController delegate](self, "delegate"));
    [v11 configurationSourceController:v6 fetchEventsWithCompletionHandler:v7];
  }

  else
  {
    uint64_t v12 = DMFConfigurationEngineLog(v10);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100062B94(self, "configurationSourceController:fetchEventsWithCompletionHandler:");
    }

    (*((void (**)(id, void, void, void))v7 + 2))(v7, 0LL, 0LL, 0LL);
  }
}

- (void)resolveAssetWithContext:(id)a3
{
  id v9 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[DMDConfigurationOrganizationController persistentConfigurationSources]( self,  "persistentConfigurationSources"));
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 firstObject]);
  if (v5)
  {
    id v6 = (void *)v5;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[DMDConfigurationOrganizationController ephemeralConfigurationSources]( self,  "ephemeralConfigurationSources"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);

    if (!v6)
    {
      uint64_t v8 = DMFErrorWithCodeAndUserInfo(4003LL, 0LL);
      id v6 = (void *)objc_claimAutoreleasedReturnValue(v8);
      [v9 assetResolutionFailedWithError:v6];
      goto LABEL_5;
    }
  }

  [v6 resolveAssetWithContext:v9];
LABEL_5:
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (DMDConfigurationOrganizationControllerDelegate)delegate
{
  return (DMDConfigurationOrganizationControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)persistentConfigurationSourceControllersByIdentifier
{
  return self->_persistentConfigurationSourceControllersByIdentifier;
}

- (void)setPersistentConfigurationSourceControllersByIdentifier:(id)a3
{
}

- (NSMutableDictionary)ephemeralConfigurationSourceControllersByIdentifier
{
  return self->_ephemeralConfigurationSourceControllersByIdentifier;
}

- (void)setEphemeralConfigurationSourceControllersByIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface DMDEngineRefreshStatusOperation
- (NSString)organizationIdentifier;
- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3;
- (void)setOrganizationIdentifier:(id)a3;
@end

@implementation DMDEngineRefreshStatusOperation

- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineRefreshStatusOperation organizationIdentifier](self, "organizationIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[DMDPayloadMetadata fetchRequestForPayloadMetadatasFromOrganizationWithIdentifier:matchingPredicate:]( &OBJC_CLASS___DMDPayloadMetadata,  "fetchRequestForPayloadMetadatasFromOrganizationWithIdentifier:matchingPredicate:",  v5,  0LL));

  id v30 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 execute:&v30]);
  id v8 = v30;
  v9 = v8;
  if (v7)
  {
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v10 = v7;
    id v11 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v27;
      do
      {
        v14 = 0LL;
        do
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v26 + 1) + 8 * (void)v14) setNeedsRefreshStatus];
          v14 = (char *)v14 + 1;
        }

        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }

      while (v12);
    }

    id v25 = v9;
    unsigned __int8 v15 = [v4 save:&v25];
    id v16 = v25;

    if ((v15 & 1) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineRefreshStatusOperation organizationIdentifier](self, "organizationIdentifier"));
      [v17 postNotificationName:@"DMDConfigurationSourceStatusDidChange" object:v18];

      uint64_t v20 = DMFConfigurationEngineLog(v19);
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        sub_1000646A0(v10, self, v21);
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v10 count]));
      -[DMDEngineRefreshStatusOperation setResultObject:](self, "setResultObject:", v22);
    }

    else
    {
      -[DMDEngineRefreshStatusOperation setError:](self, "setError:", v16);
    }

    v9 = v16;
  }

  else
  {
    uint64_t v23 = DMFConfigurationEngineLog(v8);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10006460C(self, v24);
    }

    -[DMDEngineRefreshStatusOperation setError:](self, "setError:", v9);
  }
}

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (void)setOrganizationIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
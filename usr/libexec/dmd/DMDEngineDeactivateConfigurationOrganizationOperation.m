@interface DMDEngineDeactivateConfigurationOrganizationOperation
- (DMFDeactivateConfigurationOrganizationRequest)request;
- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation DMDEngineDeactivateConfigurationOrganizationOperation

- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDeactivateConfigurationOrganizationOperation request](self, "request"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 organizationIdentifier]);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[DMDConfigurationOrganization fetchRequestMatchingConfigurationOrganizationWithIdentifier:]( &OBJC_CLASS___DMDConfigurationOrganization,  "fetchRequestMatchingConfigurationOrganizationWithIdentifier:",  v6));

  id v29 = 0LL;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 execute:&v29]);
  id v9 = v29;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);
    v11 = v10;
    if (v10)
    {
      v23 = v4;
      [v10 setActive:0];
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 payloadMetadatas]);
      id v13 = [v12 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v26;
        do
        {
          for (i = 0LL; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v26 != v15) {
              objc_enumerationMutation(v12);
            }
            [*(id *)(*((void *)&v25 + 1) + 8 * (void)i) setAvailable:0];
          }

          id v14 = [v12 countByEnumeratingWithState:&v25 objects:v30 count:16];
        }

        while (v14);
      }

      id v24 = v9;
      id v4 = v23;
      unsigned __int8 v17 = [v23 save:&v24];
      id v18 = v24;

      if ((v17 & 1) != 0) {
        -[DMDEngineDeactivateConfigurationOrganizationOperation setResultObject:](self, "setResultObject:", 0LL);
      }
      else {
        -[DMDEngineDeactivateConfigurationOrganizationOperation setError:](self, "setError:", v18);
      }
      id v9 = v18;
    }

    else
    {
      uint64_t v31 = DMFConfigurationOrganizationIdentifierErrorKey;
      v19 = (void *)objc_claimAutoreleasedReturnValue([v5 organizationIdentifier]);
      v32 = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
      uint64_t v21 = DMFErrorWithCodeAndUserInfo(4002LL, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      -[DMDEngineDeactivateConfigurationOrganizationOperation setError:](self, "setError:", v22);
    }
  }

  else
  {
    -[DMDEngineDeactivateConfigurationOrganizationOperation setError:](self, "setError:", v9);
  }
}

- (DMFDeactivateConfigurationOrganizationRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
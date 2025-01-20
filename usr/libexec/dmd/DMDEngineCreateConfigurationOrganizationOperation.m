@interface DMDEngineCreateConfigurationOrganizationOperation
- (DMFCreateConfigurationOrganizationRequest)request;
- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation DMDEngineCreateConfigurationOrganizationOperation

- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineCreateConfigurationOrganizationOperation request](self, "request"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 organizationType]);
  uint64_t v7 = DMFAllConfigurationOrganizationTypes();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  unsigned __int8 v9 = [v8 containsObject:v6];

  if ((v9 & 1) != 0)
  {
    if ([v6 isEqualToString:DMFConfigurationOrganizationTypeInternal])
    {
      v10 = 0LL;
      BOOL v11 = 1;
      goto LABEL_7;
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue( +[DMDConfigurationOrganization fetchRequestMatchingConfigurationOrganizationsOfType:]( &OBJC_CLASS___DMDConfigurationOrganization,  "fetchRequestMatchingConfigurationOrganizationsOfType:",  v6));
    id v36 = 0LL;
    v15 = (void *)objc_claimAutoreleasedReturnValue([v12 execute:&v36]);
    id v16 = v36;
    v10 = v16;
    if (v15)
    {
      BOOL v11 = [v15 count] == 0;

LABEL_7:
      v17 = (void *)objc_claimAutoreleasedReturnValue([v5 organizationIdentifier]);
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[DMDConfigurationOrganization fetchRequestMatchingConfigurationOrganizationWithIdentifier:]( &OBJC_CLASS___DMDConfigurationOrganization,  "fetchRequestMatchingConfigurationOrganizationWithIdentifier:",  v17));

      id v35 = v10;
      v18 = (void *)objc_claimAutoreleasedReturnValue([v12 execute:&v35]);
      id v19 = v35;

      if (!v18)
      {
        uint64_t v27 = DMFConfigurationEngineLog(v20);
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          sub_100063958(v5, v19);
        }

        -[DMDEngineCreateConfigurationOrganizationOperation setError:](self, "setError:", v19);
        goto LABEL_19;
      }

      v21 = (DMDConfigurationOrganization *)objc_claimAutoreleasedReturnValue([v18 firstObject]);
      if (!v21)
      {
        if (!v11)
        {
          uint64_t v31 = DMFConfigurationEngineLog(0LL);
          v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            sub_1000639FC((uint64_t)v6, v32);
          }

          uint64_t v33 = DMFErrorWithCodeAndUserInfo(4006LL, 0LL);
          v21 = (DMDConfigurationOrganization *)objc_claimAutoreleasedReturnValue(v33);
          -[DMDEngineCreateConfigurationOrganizationOperation setError:](self, "setError:", v21);
          goto LABEL_18;
        }

        v21 = -[DMDConfigurationOrganization initWithContext:]( objc_alloc(&OBJC_CLASS___DMDConfigurationOrganization),  "initWithContext:",  v4);
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue([v5 organizationDisplayName]);
      -[DMDConfigurationOrganization setDisplayName:](v21, "setDisplayName:", v22);

      v23 = (void *)objc_claimAutoreleasedReturnValue([v5 organizationIdentifier]);
      -[DMDConfigurationOrganization setIdentifier:](v21, "setIdentifier:", v23);

      v24 = (void *)objc_claimAutoreleasedReturnValue([v5 organizationType]);
      -[DMDConfigurationOrganization setType:](v21, "setType:", v24);

      -[DMDConfigurationOrganization setActive:](v21, "setActive:", 1LL);
      id v34 = v19;
      unsigned __int8 v25 = [v4 save:&v34];
      id v26 = v34;

      if ((v25 & 1) != 0) {
        -[DMDEngineCreateConfigurationOrganizationOperation setResultObject:](self, "setResultObject:", 0LL);
      }
      else {
        -[DMDEngineCreateConfigurationOrganizationOperation setError:](self, "setError:", v26);
      }
      id v19 = v26;
LABEL_18:

LABEL_19:
      v10 = v19;
      goto LABEL_20;
    }

    uint64_t v29 = DMFConfigurationEngineLog(v16);
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_100063A70((uint64_t)v6, v10);
    }

    -[DMDEngineCreateConfigurationOrganizationOperation setError:](self, "setError:", v10);
  }

  else
  {
    uint64_t v37 = DMFInvalidParameterErrorKey;
    v38 = @"request.organizationType";
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37,  1LL));
    uint64_t v13 = DMFErrorWithCodeAndUserInfo(1LL, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[DMDEngineCreateConfigurationOrganizationOperation setError:](self, "setError:", v14);

    v10 = 0LL;
  }

- (DMFCreateConfigurationOrganizationRequest)request
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
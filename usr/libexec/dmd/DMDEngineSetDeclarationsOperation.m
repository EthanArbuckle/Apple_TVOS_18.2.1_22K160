@interface DMDEngineSetDeclarationsOperation
- (DMFSetDeclarationsRequest)request;
- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation DMDEngineSetDeclarationsOperation

- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineSetDeclarationsOperation request](self, "request"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 organizationIdentifier]);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[DMDDeclarationPayloadMetadata fetchRequestForFailedDeclarationsFromOrganizationWithIdentifier:]( &OBJC_CLASS___DMDDeclarationPayloadMetadata,  "fetchRequestForFailedDeclarationsFromOrganizationWithIdentifier:",  v6));

  id v72 = 0LL;
  v60 = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 executeFetchRequest:v7 error:&v72]);
  id v9 = v72;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v68 objects:v76 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v69;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v69 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v68 + 1) + 8 * (void)i) setFailed:0];
      }

      id v12 = [v10 countByEnumeratingWithState:&v68 objects:v76 count:16];
    }

    while (v12);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineSetDeclarationsOperation request](self, "request"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 organizationIdentifier]);
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[DMDDeclarationPayloadMetadata fetchRequestForActiveDeclarationsFromOrganizationWithIdentifier:]( &OBJC_CLASS___DMDDeclarationPayloadMetadata,  "fetchRequestForActiveDeclarationsFromOrganizationWithIdentifier:",  v16));

  id v67 = v9;
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 execute:&v67]);
  id v19 = v67;

  if (v18)
  {
    v59 = v18;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineSetDeclarationsOperation request](self, "request"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 declarations]);
    v58 = self;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineSetDeclarationsOperation request](self, "request"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 organizationIdentifier]);
    id v66 = v19;
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[DMDDeclarationPayloadMetadata declarationsWithDictionaries:organizationIdentifier:context:error:]( &OBJC_CLASS___DMDDeclarationPayloadMetadata,  "declarationsWithDictionaries:organizationIdentifier:context:error:",  v22,  v24,  v60,  &v66));
    id v57 = v66;

    id v26 = [v25 mutableCopy];
    uint64_t v28 = DMFConfigurationEngineLog(v27);
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    v30 = v29;
    if (v26)
    {
      v54 = v17;
      id v55 = v10;
      v56 = v7;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineSetDeclarationsOperation request](v58, "request"));
        v32 = (void *)objc_claimAutoreleasedReturnValue([v31 organizationIdentifier]);
        *(_DWORD *)buf = 138543362;
        v75 = v32;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "Start set declarations for %{public}@",  buf,  0xCu);
      }

      __int128 v64 = 0u;
      __int128 v65 = 0u;
      __int128 v62 = 0u;
      __int128 v63 = 0u;
      id v33 = v59;
      id v34 = [v33 countByEnumeratingWithState:&v62 objects:v73 count:16];
      if (v34)
      {
        id v35 = v34;
        uint64_t v36 = *(void *)v63;
        do
        {
          for (j = 0LL; j != v35; j = (char *)j + 1)
          {
            if (*(void *)v63 != v36) {
              objc_enumerationMutation(v33);
            }
            v38 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)j);
            objc_msgSend(v38, "setAvailable:", 0, v54);
            v39 = (void *)objc_claimAutoreleasedReturnValue([v38 identifier]);
            v40 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v39]);

            v41 = (void *)objc_claimAutoreleasedReturnValue([v40 serverHash]);
            v42 = (void *)objc_claimAutoreleasedReturnValue([v38 serverHash]);
            unsigned int v43 = [v41 isEqualToString:v42];

            if (v43)
            {
              uint64_t v45 = DMFConfigurationEngineLog(v44);
              v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
              if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543362;
                v75 = v40;
                _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_INFO,  "Declaration already present, skipping: %{public}@",  buf,  0xCu);
              }

              [v60 deleteObject:v40];
              v47 = (void *)objc_claimAutoreleasedReturnValue([v40 identifier]);
              [v26 removeObjectForKey:v47];

              [v38 setAvailable:1];
            }
          }

          id v35 = [v33 countByEnumeratingWithState:&v62 objects:v73 count:16];
        }

        while (v35);
      }

      id v61 = v57;
      unsigned __int8 v48 = [v60 save:&v61];
      id v19 = v61;

      if ((v48 & 1) != 0)
      {
        -[DMDEngineSetDeclarationsOperation setResultObject:](v58, "setResultObject:", 0LL);
        id v10 = v55;
        v7 = v56;
      }

      else
      {
        uint64_t v52 = DMFConfigurationEngineLog(v49);
        v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
        id v10 = v55;
        v7 = v56;
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
          sub_100064850(v19);
        }

        -[DMDEngineSetDeclarationsOperation setError:](v58, "setError:", v19);
      }

      v17 = v54;
    }

    else
    {
      id v19 = v57;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_1000647D4(v57);
      }

      -[DMDEngineSetDeclarationsOperation setError:](v58, "setError:", v57);
    }

    v18 = v59;
  }

  else
  {
    uint64_t v50 = DMFConfigurationEngineLog(v20);
    v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      sub_100064758(v19);
    }

    -[DMDEngineSetDeclarationsOperation setError:](self, "setError:", v19);
  }
}

- (DMFSetDeclarationsRequest)request
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
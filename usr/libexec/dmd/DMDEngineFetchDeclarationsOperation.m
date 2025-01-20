@interface DMDEngineFetchDeclarationsOperation
- (DMFFetchDeclarationsRequest)request;
- (id)completionHandler;
- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation DMDEngineFetchDeclarationsOperation

- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineFetchDeclarationsOperation request](self, "request", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 payloadIdentifiers]);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 payloadIdentifiers]);
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"identifier IN %@",  v6));
  }

  else
  {
    v7 = 0LL;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 organizationIdentifier]);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[DMDPayloadMetadata fetchRequestForPayloadMetadatasFromOrganizationWithIdentifier:matchingPredicate:]( &OBJC_CLASS___DMDPayloadMetadata,  "fetchRequestForPayloadMetadatasFromOrganizationWithIdentifier:matchingPredicate:",  v8,  v7));

  id v64 = 0LL;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 execute:&v64]);
  id v11 = v64;
  v12 = v11;
  if (v10)
  {
    id v41 = v11;
    v42 = v9;
    v43 = v7;
    v44 = self;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v10 count]));
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    v40 = v10;
    id obj = v10;
    id v14 = [obj countByEnumeratingWithState:&v60 objects:v66 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v61;
      uint64_t v17 = DMFDeclarationPayloadIdentifierKey;
      uint64_t v18 = DMFDeclarationPayloadTypeKey;
      uint64_t v53 = DMFDeclarationStatusMessageStateKey;
      uint64_t v45 = DMFDeclarationPayloadDataKey;
      uint64_t v46 = DMFDeclarationPayloadTypeKey;
      v49 = v13;
      v50 = v4;
      uint64_t v47 = DMFDeclarationPayloadIdentifierKey;
      uint64_t v48 = *(void *)v61;
      do
      {
        uint64_t v19 = 0LL;
        id v51 = v15;
        do
        {
          if (*(void *)v61 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v54 = v19;
          v20 = *(void **)(*((void *)&v60 + 1) + 8 * v19);
          v21 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
          v22 = (void *)objc_claimAutoreleasedReturnValue([v20 identifier]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v22, v17);

          v23 = (void *)objc_claimAutoreleasedReturnValue([v20 type]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v23, v18);

          v24 = (void *)objc_claimAutoreleasedReturnValue([v20 stateDictionary]);
          v55 = v21;
          -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v24, v53);

          if ([v4 includePayloadContents])
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue([v20 payload]);
            v26 = (void *)objc_claimAutoreleasedReturnValue([v25 payloadDictionary]);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v55, "setObject:forKeyedSubscript:", v26, v45);
          }

          if ([v4 includeInternalState])
          {
            v27 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
            __int128 v56 = 0u;
            __int128 v57 = 0u;
            __int128 v58 = 0u;
            __int128 v59 = 0u;
            v28 = (void *)objc_claimAutoreleasedReturnValue([v20 descriptiveProperties]);
            id v29 = [v28 countByEnumeratingWithState:&v56 objects:v65 count:16];
            if (v29)
            {
              id v30 = v29;
              uint64_t v31 = *(void *)v57;
              do
              {
                for (i = 0LL; i != v30; i = (char *)i + 1)
                {
                  if (*(void *)v57 != v31) {
                    objc_enumerationMutation(v28);
                  }
                  uint64_t v33 = *(void *)(*((void *)&v56 + 1) + 8LL * (void)i);
                  v34 = (void *)objc_claimAutoreleasedReturnValue([v20 valueForKeyPath:v33]);
                  if (v34)
                  {
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v27, "setObject:forKeyedSubscript:", v34, v33);
                  }

                  else
                  {
                    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v27, "setObject:forKeyedSubscript:", v35, v33);
                  }
                }

                id v30 = [v28 countByEnumeratingWithState:&v56 objects:v65 count:16];
              }

              while (v30);
            }

            -[NSMutableDictionary setObject:forKeyedSubscript:]( v55,  "setObject:forKeyedSubscript:",  v27,  @"Debug");
            v13 = v49;
            v4 = v50;
            uint64_t v17 = v47;
            uint64_t v16 = v48;
            id v15 = v51;
            uint64_t v18 = v46;
          }

          [v13 addObject:v55];

          uint64_t v19 = v54 + 1;
        }

        while ((id)(v54 + 1) != v15);
        id v15 = [obj countByEnumeratingWithState:&v60 objects:v66 count:16];
      }

      while (v15);
    }

    [v13 sortUsingComparator:&stru_10009E930];
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineFetchDeclarationsOperation completionHandler](v44, "completionHandler"));

    if (v36)
    {
      v37 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[DMDEngineFetchDeclarationsOperation completionHandler]( v44,  "completionHandler"));
      ((void (**)(void, void *, void))v37)[2](v37, v13, 0LL);
    }

    -[DMDEngineFetchDeclarationsOperation setResultObject:](v44, "setResultObject:", 0LL);

    v9 = v42;
    v7 = v43;
    v10 = v40;
    v12 = v41;
  }

  else
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineFetchDeclarationsOperation completionHandler](self, "completionHandler"));

    if (v38)
    {
      v39 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[DMDEngineFetchDeclarationsOperation completionHandler]( self,  "completionHandler"));
      ((void (**)(void, void, void *))v39)[2](v39, 0LL, v12);
    }

    -[DMDEngineFetchDeclarationsOperation setError:](self, "setError:", v12);
  }
}

- (DMFFetchDeclarationsRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
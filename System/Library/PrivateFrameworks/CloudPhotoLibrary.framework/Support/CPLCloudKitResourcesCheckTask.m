@interface CPLCloudKitResourcesCheckTask
- (BOOL)_checkResource:(id)a3 record:(id)a4 error:(id *)a5;
- (CPLCloudKitResourcesCheckTask)initWithController:(id)a3 resources:(id)a4 targetMapping:(id)a5 transportScopeMapping:(id)a6 completionHandler:(id)a7;
- (void)runOperations;
@end

@implementation CPLCloudKitResourcesCheckTask

- (CPLCloudKitResourcesCheckTask)initWithController:(id)a3 resources:(id)a4 targetMapping:(id)a5 transportScopeMapping:(id)a6 completionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___CPLCloudKitResourcesCheckTask;
  v16 = -[CPLCloudKitTransportTask initWithController:](&v22, "initWithController:", a3);
  if (v16)
  {
    id v17 = [v15 copy];
    id completionHandler = v16->_completionHandler;
    v16->_id completionHandler = v17;

    v19 = (NSArray *)[v12 copy];
    resources = v16->_resources;
    v16->_resources = v19;

    objc_storeStrong((id *)&v16->_targetMapping, a5);
    -[CPLCloudKitTransportTask setTransportScopeMapping:](v16, "setTransportScopeMapping:", v14);
    -[CPLCloudKitTransportTask setForeground:](v16, "setForeground:", 1LL);
  }

  return v16;
}

- (void)runOperations
{
  id v31 = 0LL;
  unsigned __int8 v3 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v31);
  id v4 = v31;
  v5 = v4;
  if ((v3 & 1) != 0)
  {
    id v24 = v4;
    if (!_CPLSilentLogging)
    {
      id v6 = sub_1000B8008();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        resources = self->_resources;
        *(_DWORD *)buf = 138412290;
        v34 = resources;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Checking resources %@", buf, 0xCu);
      }
    }

    v9 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  -[NSArray count](self->_resources, "count"));
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    v23 = self;
    v10 = self->_resources;
    id v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v27,  v32,  16LL);
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v28;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(NSArray **)(*((void *)&v27 + 1) + 8LL * (void)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray itemScopedIdentifier](v15, "itemScopedIdentifier", v23));
          if (v16)
          {
            id v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v16));
            v18 = (NSMutableArray *)[v17 mutableCopy];

            if (!v18)
            {
              v18 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
              -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v18, v16);
            }

            -[NSMutableArray addObject:](v18, "addObject:", v15);
          }

          else
          {
            if (_CPLSilentLogging) {
              goto LABEL_19;
            }
            id v19 = sub_1000B8008();
            v18 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v34 = v15;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v18,  OS_LOG_TYPE_ERROR,  "Missing identifier to check for resource %@",  buf,  0xCu);
            }
          }

LABEL_19:
        }

        id v12 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v27,  v32,  16LL);
      }

      while (v12);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v9, "allKeys"));
    targetMapping = v23->_targetMapping;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_1000B8048;
    v25[3] = &unk_100240BE8;
    v25[4] = v23;
    v26 = v9;
    objc_super v22 = v9;
    -[CPLCloudKitTransportTask fetchFullRecordsForScopedIdentifiers:targetMapping:completionHandler:]( v23,  "fetchFullRecordsForScopedIdentifiers:targetMapping:completionHandler:",  v20,  targetMapping,  v25);

    v5 = v24;
  }

  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (BOOL)_checkResource:(id)a3 record:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 resourceType];
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 resourceForType:v9]);

  if (!v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[CPLResource shortDescriptionForResourceType:]( &OBJC_CLASS___CPLResource,  "shortDescriptionForResourceType:",  v9));
    id v25 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  26LL,  @"Unable to find resource %@ on cloud record",  v11));
    goto LABEL_18;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 identity]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 identity]);
  [v11 imageDimensions];
  double v14 = v13;
  double v16 = v15;
  [v12 imageDimensions];
  if (v14 == v18 && v16 == v17)
  {
    id v20 = [v11 fileSize];
    if (v20 == [v12 fileSize])
    {
      uint64_t v21 = objc_claimAutoreleasedReturnValue([v11 fileUTI]);
      objc_super v22 = (void *)objc_claimAutoreleasedReturnValue([v12 fileUTI]);
      unint64_t v23 = (unint64_t)v22;
      if (v21 && v22)
      {
        unsigned __int8 v24 = [(id)v21 isEqual:v22];

        if ((v24 & 1) == 0) {
          goto LABEL_17;
        }
LABEL_14:
        uint64_t v26 = objc_claimAutoreleasedReturnValue([v11 fingerPrint]);
        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v12 fingerPrint]);
        unint64_t v28 = (unint64_t)v27;
        if (v26 && v27)
        {
          unsigned __int8 v29 = [(id)v26 isEqual:v27];

          if ((v29 & 1) == 0) {
            goto LABEL_17;
          }
        }

        else
        {

          if (v26 | v28) {
            goto LABEL_17;
          }
        }

        id v25 = 0LL;
        BOOL v31 = 1;
        goto LABEL_21;
      }

      if (!(v21 | v23)) {
        goto LABEL_14;
      }
    }
  }

- (void).cxx_destruct
{
}

@end
@interface CPLCloudKitFetchSharedScopeTask
- (CPLCloudKitFetchSharedScopeTask)initWithController:(id)a3 shareURL:(id)a4 completionHandler:(id)a5;
- (id)_scopeChangeFromShareMetadata:(id)a3 currentUserID:(id)a4 error:(id *)a5;
- (void)_fetchSharedScopeWithCurrentUserID:(id)a3;
- (void)runOperations;
@end

@implementation CPLCloudKitFetchSharedScopeTask

- (CPLCloudKitFetchSharedScopeTask)initWithController:(id)a3 shareURL:(id)a4 completionHandler:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___CPLCloudKitFetchSharedScopeTask;
  v11 = -[CPLCloudKitTransportTask initWithController:](&v16, "initWithController:", a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_shareURL, a4);
    id v13 = [v10 copy];
    id completionHandler = v12->_completionHandler;
    v12->_id completionHandler = v13;
  }

  return v12;
}

- (void)runOperations
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10007961C;
  v2[3] = &unk_10023FB58;
  v2[4] = self;
  -[CPLCloudKitTransportTask getUserRecordIDFetchIfNecessaryWithCompletionHandler:]( self,  "getUserRecordIDFetchIfNecessaryWithCompletionHandler:",  v2);
}

- (void)_fetchSharedScopeWithCurrentUserID:(id)a3
{
  id v4 = a3;
  id v21 = 0LL;
  unsigned __int8 v5 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v21);
  id v6 = v21;
  if ((v5 & 1) != 0)
  {
    if (self->_shareURL)
    {
      v7 = objc_alloc(&OBJC_CLASS___CKFetchShareMetadataOperation);
      shareURL = self->_shareURL;
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &shareURL,  1LL));
      id v9 = -[CKFetchShareMetadataOperation initWithShareURLs:](v7, "initWithShareURLs:", v8);

      -[CKFetchShareMetadataOperation setShouldFetchRootRecord:](v9, "setShouldFetchRootRecord:", 1LL);
      v19[0] = 0LL;
      v19[1] = v19;
      v19[2] = 0x3032000000LL;
      v19[3] = sub_1000798DC;
      v19[4] = sub_1000798EC;
      id v20 = 0LL;
      v17[0] = 0LL;
      v17[1] = v17;
      v17[2] = 0x3032000000LL;
      v17[3] = sub_1000798DC;
      v17[4] = sub_1000798EC;
      id v18 = 0LL;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_1000798F4;
      v13[3] = &unk_100241510;
      v15 = v17;
      objc_super v16 = v19;
      v13[4] = self;
      id v14 = v4;
      -[CKFetchShareMetadataOperation setPerShareMetadataBlock:](v9, "setPerShareMetadataBlock:", v13);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_100079B18;
      v12[3] = &unk_100241560;
      v12[4] = self;
      v12[5] = v17;
      v12[6] = v19;
      -[CKFetchShareMetadataOperation setFetchShareMetadataCompletionBlock:]( v9,  "setFetchShareMetadataCompletionBlock:",  v12);
      -[CPLCloudKitTransportTask launchOperation:type:withContext:]( self,  "launchOperation:type:withContext:",  v9,  0LL,  0LL);

      _Block_object_dispose(v17, 8);
      _Block_object_dispose(v19, 8);
    }

    else
    {
      id completionHandler = (void (**)(id, void, void *))self->_completionHandler;
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors incorrectParametersErrorForParameter:]( &OBJC_CLASS___CPLErrors,  "incorrectParametersErrorForParameter:",  @"shareURL"));
      completionHandler[2](completionHandler, 0LL, v11);
    }
  }

  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (id)_scopeChangeFromShareMetadata:(id)a3 currentUserID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 share]);
  if (!v10)
  {
    id v16 = 0LL;
    if (a5) {
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    }
    goto LABEL_33;
  }

  v44 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 rootRecord]);
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 recordID]);
  id v13 = (void *)v12;
  if (v11)
  {
    v50[0] = v12;
    v51[0] = v10;
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 recordID]);
    v50[1] = v14;
    v51[1] = v11;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v51,  v50,  2LL));
  }

  else
  {
    uint64_t v48 = v12;
    v49 = v10;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v49,  &v48,  1LL));
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask controller](self, "controller"));
  id v20 = (CPLCloudKitScope *)objc_claimAutoreleasedReturnValue([v10 recordID]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitScope zoneID](v20, "zoneID"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask controller](self, "controller"));
  LODWORD(v20) = [v19 shouldIgnoreZoneWithZoneID:v18];

  v45 = v17;
  if ((_DWORD)v20)
  {
    id v21 = v9;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "cpl_zoneName"));
    v23 = (CKRecordZone *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  38LL,  @"Zone %@ is not supported by this engine",  v22));

    if (v44)
    {
      v23 = v23;
      id v16 = 0LL;
      id *v44 = v23;
    }

    else
    {
      id v16 = 0LL;
    }

    id v9 = v21;
  }

  else
  {
    v23 = -[CKRecordZone initWithZoneID:](objc_alloc(&OBJC_CLASS___CKRecordZone), "initWithZoneID:", v18);
    id v20 = -[CPLCloudKitScope initWithZone:](objc_alloc(&OBJC_CLASS___CPLCloudKitScope), "initWithZone:", v23);
    id v24 = [v17 scopeTypeForCloudKitScope:v20 proposedScopeType:0 fetchedRecords:v15 currentUserID:v9];
    if (v24)
    {
      id v25 = v24;
      v42 = (void *)objc_claimAutoreleasedReturnValue([v17 scopeIdentifierFromZoneID:v18]);
      v26 = -[CPLEngineScope initWithScopeIdentifier:scopeType:]( objc_alloc(&OBJC_CLASS___CPLEngineScope),  "initWithScopeIdentifier:scopeType:",  v42,  v25);
      v40 = v20;
      v27 = v20;
      v28 = v26;
      v39 = (void *)objc_claimAutoreleasedReturnValue([v17 zoneIdentificationForCloudKitScope:v27 engineScope:v26]);
      id v41 = v9;
      id v16 = (id)objc_claimAutoreleasedReturnValue([v39 scopeChangeFromCKRecords:v15 currentUserID:v9 previousScopeChange:0]);
      v29 = (void *)objc_claimAutoreleasedReturnValue([v16 share]);

      if (v29)
      {
        id v9 = v41;
      }

      else
      {
        id v9 = v41;
        if (!_CPLSilentLogging)
        {
          id v32 = sub_100079AD8();
          v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v47 = v16;
            _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "Scope %@ has no share after identification - ignoring",  buf,  0xCu);
          }
        }

        if (v44)
        {
          uint64_t v34 = objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:CKShareTypeKey]);
          v35 = (void *)v34;
          v36 = "with";
          if (!v11) {
            v36 = "without";
          }
          id *v44 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  38LL,  @"Share of type %@ (%s root record) is malformed or not supported in this universe",  v34,  v36));

          id v9 = v41;
        }

        id v16 = 0LL;
      }

      id v20 = v40;
    }

    else if (v44)
    {
      uint64_t v30 = objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:CKShareTypeKey]);
      v31 = "with";
      if (!v11) {
        v31 = "without";
      }
      v43 = (void *)v30;
      id v16 = 0LL;
      id *v44 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  38LL,  @"Share of type %@ (%s root record) is malformed or not supported",  v30,  v31));
    }

    else
    {
      id v16 = 0LL;
    }

    LOBYTE(v20) = 0;
  }

  if ((v20 & 1) == 0)
  {
LABEL_33:
    id v16 = v16;
    v37 = v16;
    goto LABEL_34;
  }

  v37 = 0LL;
LABEL_34:

  return v37;
}

- (void).cxx_destruct
{
}

@end
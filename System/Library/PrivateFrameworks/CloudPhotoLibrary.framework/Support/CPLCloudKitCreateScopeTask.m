@interface CPLCloudKitCreateScopeTask
- (CPLCloudKitCreateScopeTask)initWithController:(id)a3 scope:(id)a4 completionHandler:(id)a5;
- (NSURL)tempCKAssetURL;
- (id)scope;
- (void)_clearPartiallyCreatedZoneIfNecessary;
- (void)_createCKShare:(id)a3 andRootRecord:(id)a4 currentUserID:(id)a5 withCompletionHandler:(id)a6;
- (void)_createCKShareWithCompletionHandler:(id)a3;
- (void)_createLibraryShareWithScopeChange:(id)a3 completionHandler:(id)a4;
- (void)_createLibraryWithScopeChange:(id)a3 completionHandler:(id)a4;
- (void)_createMomentShareWithScopeChange:(id)a3 completionHandler:(id)a4;
- (void)_createZoneWithCompletionHandler:(id)a3;
- (void)_runOperations;
- (void)runOperations;
- (void)setTempCKAssetURL:(id)a3;
@end

@implementation CPLCloudKitCreateScopeTask

- (CPLCloudKitCreateScopeTask)initWithController:(id)a3 scope:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CPLCloudKitCreateScopeTask;
  v9 = -[CPLCloudKitManageScopeTask initWithController:scope:](&v13, "initWithController:scope:", a3, a4);
  if (v9)
  {
    id v10 = [v8 copy];
    id completionHandler = v9->_completionHandler;
    v9->_id completionHandler = v10;
  }

  return v9;
}

- (id)scope
{
  updatedScope = self->_updatedScope;
  if (updatedScope) {
    return updatedScope;
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CPLCloudKitCreateScopeTask;
  v4 = -[CPLCloudKitManageScopeTask scope](&v5, "scope");
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (void)_clearPartiallyCreatedZoneIfNecessary
{
  identificationToCleanIfNecessary = self->_identificationToCleanIfNecessary;
  if (identificationToCleanIfNecessary
    && -[CPLCloudKitZoneIdentification supportsZoneDelete](identificationToCleanIfNecessary, "supportsZoneDelete"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification zoneID](self->_identificationToCleanIfNecessary, "zoneID"));
    if (!_CPLSilentLogging)
    {
      id v5 = sub_10004BC14();
      v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Will try to delete partially created zone %{public}@",  (uint8_t *)&buf,  0xCu);
      }
    }

    v7 = objc_alloc(&OBJC_CLASS___CPLCloudKitDeleteTransportScopeTask);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask controller](self, "controller"));
    v9 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitZoneIdentification cloudKitScope]( self->_identificationToCleanIfNecessary,  "cloudKitScope"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification engineScope](self->_identificationToCleanIfNecessary, "engineScope"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10004CCD8;
    v21[3] = &unk_10023E430;
    id v22 = v4;
    id v11 = v4;
    v12 = -[CPLCloudKitDeleteTransportScopeTask initWithController:cloudKitScope:scope:completionHandler:]( v7,  "initWithController:cloudKitScope:scope:completionHandler:",  v8,  v9,  v10,  v21);

    objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask transportGroup](self, "transportGroup"));
    -[CPLCloudKitTransportTask setTransportGroup:](v12, "setTransportGroup:", v13);

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10004CE04;
    v19[3] = &unk_10023DC70;
    v20 = v12;
    v16 = v19;
    *(void *)&__int128 buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472LL;
    v24 = sub_1000505E8;
    v25 = &unk_10023DBC8;
    id v26 = v16;
    v17 = v12;
    dispatch_block_t v18 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &buf);
    dispatch_async(v15, v18);
  }

- (void)runOperations
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10004CE5C;
  v2[3] = &unk_10023FF48;
  v2[4] = self;
  -[CPLCloudKitTransportTask getTemporaryFolderWithCompletionHandler:]( self,  "getTemporaryFolderWithCompletionHandler:",  v2);
}

- (void)_runOperations
{
  id v18 = 0LL;
  unsigned __int8 v3 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v18);
  id v4 = v18;
  id v5 = v4;
  if ((v3 & 1) != 0)
  {
    id v17 = v4;
    unsigned __int8 v6 = -[CPLCloudKitManageScopeTask checkScopeIsValidWithError:](self, "checkScopeIsValidWithError:", &v17);
    id v7 = v17;

    if ((v6 & 1) != 0)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitManageScopeTask identification](self, "identification"));
      if ([v8 supportsZoneCreation])
      {
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472LL;
        v16[2] = sub_10004D13C;
        v16[3] = &unk_10023E430;
        v16[4] = self;
        [v8 validateCreateScopeTask:self completionHandler:v16];
      }

      else
      {
        if (!_CPLSilentLogging)
        {
          id v9 = sub_10004BC14();
          id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitManageScopeTask engineScope](self, "engineScope"));
            *(_DWORD *)__int128 buf = 138412290;
            v20 = v11;
            _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Creating a zone for %@ is not supported",  buf,  0xCu);
          }
        }

        id completionHandler = self->_completionHandler;
        objc_super v13 = (void *)objc_claimAutoreleasedReturnValue( +[CPLScopeChange descriptionForScopeType:]( &OBJC_CLASS___CPLScopeChange,  "descriptionForScopeType:",  -[CPLCloudKitManageScopeTask scopeType](self, "scopeType")));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitManageScopeTask scopeIdentifier](self, "scopeIdentifier"));
        v15 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  38LL,  @"%@ %@ is an unsupported scope to create",  v13,  v14));
        (*((void (**)(id, void, void, void *))completionHandler + 2))(completionHandler, 0LL, 0LL, v15);
      }
    }

    else
    {
      (*((void (**)(void))self->_completionHandler + 2))();
    }
  }

  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
    id v7 = v5;
  }
}

- (void)_createCKShare:(id)a3 andRootRecord:(id)a4 currentUserID:(id)a5 withCompletionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v28 = 0LL;
  unsigned __int8 v14 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v28);
  id v15 = v28;
  if ((v14 & 1) != 0)
  {
    if (v11)
    {
      v30[0] = v10;
      v30[1] = v11;
      v16 = (id *)v30;
      uint64_t v17 = 2LL;
    }

    else
    {
      id v29 = v10;
      v16 = &v29;
      uint64_t v17 = 1LL;
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, v17));
    v19 = -[CKModifyRecordsOperation initWithRecordsToSave:recordIDsToDelete:]( objc_alloc(&OBJC_CLASS___CKModifyRecordsOperation),  "initWithRecordsToSave:recordIDsToDelete:",  v18,  0LL);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10004D784;
    v22[3] = &unk_10023FFC0;
    v22[4] = self;
    id v23 = v18;
    id v27 = v13;
    id v24 = v10;
    id v25 = v12;
    id v26 = v11;
    id v20 = v18;
    -[CKModifyRecordsOperation setModifyRecordsCompletionBlock:](v19, "setModifyRecordsCompletionBlock:", v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitManageScopeTask cloudKitScope](self, "cloudKitScope"));
    -[CPLCloudKitTransportTask launchOperation:type:withContext:]( self,  "launchOperation:type:withContext:",  v19,  CPLCloudKitOperationTypeForScope(v21),  0LL);
  }

  else
  {
    (*((void (**)(id, void, id))v13 + 2))(v13, 0LL, v15);
  }
}

- (void)_createCKShareWithCompletionHandler:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10004DC44;
  v5[3] = &unk_100240010;
  unsigned __int8 v6 = self;
  id v7 = a3;
  SEL v8 = a2;
  id v4 = v7;
  -[CPLCloudKitTransportTask getUserRecordIDFetchIfNecessaryWithCompletionHandler:]( v6,  "getUserRecordIDFetchIfNecessaryWithCompletionHandler:",  v5);
}

- (void)_createZoneWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v23 = 0LL;
  unsigned __int8 v5 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v23);
  id v6 = v23;
  if ((v5 & 1) != 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitManageScopeTask cloudKitScope](self, "cloudKitScope"));
    id v8 = [v7 databaseScope];
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask controller](self, "controller"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneID]);
    unsigned int v11 = [v9 shouldIgnoreZoneWithZoneID:v10];

    if (v11)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneID]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "cpl_zoneName"));
      unsigned __int8 v14 = (CKModifyRecordZonesOperation *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  38LL,  @"Zone %@ is not supported by this engine",  v13));

      v4[2](v4, v14);
    }

    else
    {
      id v15 = objc_alloc(&OBJC_CLASS___CKModifyRecordZonesOperation);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v7 zone]);
      id v24 = v16;
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
      unsigned __int8 v14 = -[CKModifyRecordZonesOperation initWithRecordZonesToSave:recordZoneIDsToDelete:]( v15,  "initWithRecordZonesToSave:recordZoneIDsToDelete:",  v17,  0LL);

      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_10004E33C;
      v19[3] = &unk_100240060;
      void v19[4] = self;
      v21 = v4;
      id v22 = v8;
      id v18 = v7;
      id v20 = v18;
      -[CKModifyRecordZonesOperation setModifyRecordZonesCompletionBlock:]( v14,  "setModifyRecordZonesCompletionBlock:",  v19);
      -[CPLCloudKitTransportTask launchOperation:type:withContext:]( self,  "launchOperation:type:withContext:",  v14,  CPLCloudKitOperationTypeForScope(v18),  0LL);
    }
  }

  else
  {
    v4[2](v4, v6);
  }
}

- (void)_createMomentShareWithScopeChange:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  if (!_CPLSilentLogging)
  {
    id v7 = sub_10004BC14();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unsigned int v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Moment shares are not supported on this platform",  v11,  2u);
    }
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 scopeIdentifier]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopeIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopeIdentifier:",  v9));
  v6[2](v6, 0LL, v10);
}

- (void)_createLibraryWithScopeChange:(id)a3 completionHandler:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10004EB00;
  v8[3] = &unk_10023E118;
  id v9 = a3;
  id v10 = a4;
  id v6 = v9;
  id v7 = v10;
  -[CPLCloudKitCreateScopeTask _createZoneWithCompletionHandler:](self, "_createZoneWithCompletionHandler:", v8);
}

- (void)_createLibraryShareWithScopeChange:(id)a3 completionHandler:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10004EBE8;
  v5[3] = &unk_10023E118;
  id v6 = self;
  id v7 = a4;
  id v4 = v7;
  -[CPLCloudKitCreateScopeTask _createZoneWithCompletionHandler:](v6, "_createZoneWithCompletionHandler:", v5);
}

- (NSURL)tempCKAssetURL
{
  return self->_tempCKAssetURL;
}

- (void)setTempCKAssetURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface CPLCloudKitDeleteTransportScopeTask
- (BOOL)forced;
- (CPLCloudKitDeleteTransportScopeTask)initWithController:(id)a3 cloudKitScope:(id)a4 scope:(id)a5 completionHandler:(id)a6;
- (CPLCloudKitScope)cloudKitScope;
- (CPLEngineScope)scope;
- (id)_errorForDeleteError:(id)a3;
- (void)_didFinishDeleteWithError:(id)a3;
- (void)runOperations;
- (void)setForced:(BOOL)a3;
@end

@implementation CPLCloudKitDeleteTransportScopeTask

- (CPLCloudKitDeleteTransportScopeTask)initWithController:(id)a3 cloudKitScope:(id)a4 scope:(id)a5 completionHandler:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CPLCloudKitDeleteTransportScopeTask;
  v14 = -[CPLCloudKitTransportTask initWithController:](&v18, "initWithController:", a3);
  if (v14)
  {
    id v15 = [v13 copy];
    id completionHandler = v14->_completionHandler;
    v14->_id completionHandler = v15;

    objc_storeStrong((id *)&v14->_cloudKitScope, a4);
    objc_storeStrong((id *)&v14->_scope, a5);
  }

  return v14;
}

- (id)_errorForDeleteError:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_9;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CPLCloudKitErrors realErrorForError:](&OBJC_CLASS___CPLCloudKitErrors, "realErrorForError:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
  unsigned int v7 = [v6 isEqualToString:CKErrorDomain];

  if (!v7 || [v5 code] != (id)26 && objc_msgSend(v5, "code") != (id)28)
  {
    if (v5)
    {
      uint64_t v9 = objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask lastOperationRequestUUIDs](self, "lastOperationRequestUUIDs"));
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[CPLCloudKitErrors CPLErrorForCloudKitError:withRequestUUIDs:description:]( &OBJC_CLASS___CPLCloudKitErrors,  "CPLErrorForCloudKitError:withRequestUUIDs:description:",  v5,  v9,  @"Failed to delete zone"));

      v5 = (void *)v9;
      goto LABEL_8;
    }

- (void)_didFinishDeleteWithError:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_forced && ([v4 isCPLOperationCancelledError] & 1) == 0)
  {
    cloudKitScope = self->_cloudKitScope;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10004AD98;
    v7[3] = &unk_10023FE38;
    id v8 = v5;
    uint64_t v9 = self;
    -[CPLCloudKitTransportTask fetchZoneForScope:completionHandler:]( self,  "fetchZoneForScope:completionHandler:",  cloudKitScope,  v7);
  }

  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (void)runOperations
{
  id v45 = 0LL;
  unsigned __int8 v3 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v45);
  id v4 = v45;
  if ((v3 & 1) != 0)
  {
    if (-[CPLEngineScope scopeType](self->_scope, "scopeType"))
    {
      cloudKitScope = self->_cloudKitScope;
      if (!cloudKitScope)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask controller](self, "controller"));
        unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineScope scopeIdentifier](self->_scope, "scopeIdentifier"));
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneIDFromScopeIdentifier:v7]);

        uint64_t v9 = -[CPLCloudKitScope initWithZoneID:options:]( objc_alloc(&OBJC_CLASS___CPLCloudKitScope),  "initWithZoneID:options:",  v8,  0LL);
        v10 = self->_cloudKitScope;
        self->_cloudKitScope = v9;

        cloudKitScope = self->_cloudKitScope;
      }

      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitScope zoneID](cloudKitScope, "zoneID"));
      if (!v11)
      {
        id completionHandler = (void (**)(id, void *))self->_completionHandler;
        v23 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  80LL,  @"Missing required zone"));
        completionHandler[2](completionHandler, v23);
LABEL_44:

LABEL_45:
        goto LABEL_46;
      }

      if (!self->_forced
        && +[CPLCloudKitZoneIdentification shouldProtectZoneIDFromDeletion:]( &OBJC_CLASS___CPLCloudKitZoneIdentification,  "shouldProtectZoneIDFromDeletion:",  v11))
      {
        if (!_CPLSilentLogging)
        {
          id v12 = sub_10004AF90();
          id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            v14 = (CPLEngineScope *)objc_claimAutoreleasedReturnValue(-[CPLEngineScope scopeIdentifier](self->_scope, "scopeIdentifier"));
            id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cpl_zoneName"));
            *(_DWORD *)buf = 138543618;
            v49 = v14;
            __int16 v50 = 2114;
            v51 = v15;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Asked to delete %{public}@ (zone %{public}@) - protecting against that",  buf,  0x16u);
          }
        }

        (*((void (**)(id, void))self->_completionHandler + 2))(self->_completionHandler, 0LL);
        goto LABEL_45;
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask controller](self, "controller"));
      v23 = (void *)objc_claimAutoreleasedReturnValue( [v22 zoneIdentificationForCloudKitScope:self->_cloudKitScope engineScope:self->_scope]);

      if ([v23 supportsZoneDelete])
      {
        v24 = objc_alloc(&OBJC_CLASS___CKModifyRecordZonesOperation);
        v47 = v11;
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v47, 1LL));
        v26 = -[CKModifyRecordZonesOperation initWithRecordZonesToSave:recordZoneIDsToDelete:]( v24,  "initWithRecordZonesToSave:recordZoneIDsToDelete:",  0LL,  v25);

        if (!_CPLSilentLogging)
        {
          id v27 = sub_10004AF90();
          v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v49 = (CPLEngineScope *)v11;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Deleting zone %@", buf, 0xCu);
          }
        }

        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472LL;
        v44[2] = sub_10004B66C;
        v44[3] = &unk_10023FE60;
        v44[4] = self;
        -[CKModifyRecordZonesOperation setModifyRecordZonesCompletionBlock:]( v26,  "setModifyRecordZonesCompletionBlock:",  v44);
        v29 = (CKModifyRecordsOperation *)objc_claimAutoreleasedReturnValue([v23 cloudKitScope]);
        -[CPLCloudKitTransportTask launchOperation:type:withContext:]( self,  "launchOperation:type:withContext:",  v26,  CPLCloudKitOperationTypeForScope(v29),  0LL);
      }

      else
      {
        v26 = (CKModifyRecordZonesOperation *)objc_claimAutoreleasedReturnValue([v23 shareRecordIDToDelete]);
        if (v26)
        {
          if (!_CPLSilentLogging)
          {
            id v31 = sub_10004AF90();
            v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v49 = (CPLEngineScope *)v26;
              _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Deleting share record %{public}@",  buf,  0xCu);
            }
          }

          v33 = objc_alloc(&OBJC_CLASS___CKModifyRecordsOperation);
          v46 = v26;
          v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v46,  1LL));
          v29 = -[CKModifyRecordsOperation initWithRecordsToSave:recordIDsToDelete:]( v33,  "initWithRecordsToSave:recordIDsToDelete:",  0LL,  v34);

          v43[0] = _NSConcreteStackBlock;
          v43[1] = 3221225472LL;
          v43[2] = sub_10004B798;
          v43[3] = &unk_10023FE60;
          v43[4] = self;
          -[CKModifyRecordsOperation setModifyRecordsCompletionBlock:](v29, "setModifyRecordsCompletionBlock:", v43);
          v35 = (void *)objc_claimAutoreleasedReturnValue([v23 cloudKitScope]);
          -[CPLCloudKitTransportTask launchOperation:type:withContext:]( self,  "launchOperation:type:withContext:",  v29,  CPLCloudKitOperationTypeForScope(v35),  0LL);
        }

        else
        {
          if (!_CPLSilentLogging)
          {
            id v36 = sub_10004AF90();
            v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              v42 = (void *)objc_claimAutoreleasedReturnValue([v23 cloudKitScope]);
              v41 = (void *)objc_claimAutoreleasedReturnValue([v42 zoneID]);
              v38 = (CPLEngineScope *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "cpl_zoneName"));
              v39 = (void *)objc_claimAutoreleasedReturnValue( +[CPLScopeChange descriptionForScopeType:]( &OBJC_CLASS___CPLScopeChange,  "descriptionForScopeType:",  -[CPLEngineScope scopeType](self->_scope, "scopeType")));
              *(_DWORD *)buf = 138543618;
              v49 = v38;
              __int16 v50 = 2112;
              v51 = v39;
              _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "Trying to delete %{public}@ that does not provide ways to do so (scope type: %@)",  buf,  0x16u);
            }
          }

          if (!self->_forced)
          {
            -[CPLCloudKitDeleteTransportScopeTask _didFinishDeleteWithError:](self, "_didFinishDeleteWithError:", 0LL);
            goto LABEL_43;
          }

          v40 = (void (**)(id, id))self->_completionHandler;
          v29 = (CKModifyRecordsOperation *)objc_claimAutoreleasedReturnValue( +[CPLErrors notImplementedError]( &OBJC_CLASS___CPLErrors,  "notImplementedError"));
          v40[2](v40, v29);
        }
      }

LABEL_43:
      goto LABEL_44;
    }

    if (!_CPLSilentLogging)
    {
      id v17 = sub_10004AF90();
      objc_super v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        scope = self->_scope;
        *(_DWORD *)buf = 138412290;
        v49 = scope;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Trying to delete a zone with an unknown type: %@",  buf,  0xCu);
      }
    }

    BOOL forced = self->_forced;
    id v21 = self->_completionHandler;
    if (forced)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors notImplementedError](&OBJC_CLASS___CPLErrors, "notImplementedError"));
      (*((void (**)(id, void *))v21 + 2))(v21, v11);
      goto LABEL_45;
    }

    v16 = (void (*)(void))*((void *)v21 + 2);
  }

  else
  {
    v16 = (void (*)(void))*((void *)self->_completionHandler + 2);
  }

  v16();
LABEL_46:
}

- (BOOL)forced
{
  return self->_forced;
}

- (void)setForced:(BOOL)a3
{
  self->_BOOL forced = a3;
}

- (CPLCloudKitScope)cloudKitScope
{
  return self->_cloudKitScope;
}

- (CPLEngineScope)scope
{
  return self->_scope;
}

- (void).cxx_destruct
{
}

@end
@interface CPLCloudKitQueryTask
- (CPLCKQueryCursor)cursor;
- (CPLCloudKitQueryTask)initWithController:(id)a3 cursor:(id)a4 class:(Class)a5 scope:(id)a6 transportScopeMapping:(id)a7 progressHandler:(id)a8 completionHandler:(id)a9;
- (CPLEngineScope)scope;
- (Class)queriedClass;
- (void)_runOperationsWithCurrentUserID:(id)a3;
- (void)_runQueryWithCurrentUserID:(id)a3 cursor:(id)a4 additionalInfo:(id)a5 completionHandler:(id)a6;
- (void)runOperations;
- (void)runWithinSyncSession:(id)a3;
- (void)sendProgressBatch:(id)a3 updatedCursor:(id)a4;
@end

@implementation CPLCloudKitQueryTask

- (CPLCloudKitQueryTask)initWithController:(id)a3 cursor:(id)a4 class:(Class)a5 scope:(id)a6 transportScopeMapping:(id)a7 progressHandler:(id)a8 completionHandler:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___CPLCloudKitQueryTask;
  v21 = -[CPLCloudKitTransportTask initWithController:](&v33, "initWithController:", v15);
  if (v21)
  {
    objc_initWeak(&location, v21);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_100044CB4;
    v29[3] = &unk_10023FBA0;
    objc_copyWeak(&v31, &location);
    id v30 = v20;
    id v22 = [v29 copy];
    id completionHandler = v21->_completionHandler;
    v21->_id completionHandler = v22;

    id v24 = [v19 copy];
    id progressHandler = v21->_progressHandler;
    v21->_id progressHandler = v24;

    if (v16)
    {
      v26 = -[CPLCKQueryCursor initWithCursorData:]( objc_alloc(&OBJC_CLASS___CPLCKQueryCursor),  "initWithCursorData:",  v16);
      cursor = v21->_cursor;
      v21->_cursor = v26;
    }

    objc_storeStrong((id *)&v21->_queriedClass, a5);
    -[CPLCloudKitTransportTask setTransportScopeMapping:](v21, "setTransportScopeMapping:", v18);
    objc_storeStrong((id *)&v21->_scope, a6);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }

  return v21;
}

- (void)runWithinSyncSession:(id)a3
{
  id v4 = a3;
  kdebug_trace(721946576LL, -[CPLCloudKitQueryTask hash](self, "hash"), 0LL, 0LL, 0LL);
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CPLCloudKitQueryTask;
  -[CPLCloudKitTransportTask runWithinSyncSession:](&v5, "runWithinSyncSession:", v4);
}

- (void)sendProgressBatch:(id)a3 updatedCursor:(id)a4
{
  id progressHandler = (void (**)(id, id, id))self->_progressHandler;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue([a4 cursorData]);
  progressHandler[2](progressHandler, v6, v7);
}

- (void)runOperations
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100044E58;
  v2[3] = &unk_10023FB58;
  v2[4] = self;
  -[CPLCloudKitTransportTask getUserRecordIDFetchIfNecessaryWithCompletionHandler:]( self,  "getUserRecordIDFetchIfNecessaryWithCompletionHandler:",  v2);
}

- (void)_runOperationsWithCurrentUserID:(id)a3
{
  id v4 = a3;
  cursor = self->_cursor;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCKQueryCursor additionalInfo](cursor, "additionalInfo"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100044F30;
  v8[3] = &unk_10023DEF8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  -[CPLCloudKitQueryTask _runQueryWithCurrentUserID:cursor:additionalInfo:completionHandler:]( self,  "_runQueryWithCurrentUserID:cursor:additionalInfo:completionHandler:",  v7,  cursor,  v6,  v8);
}

- (void)_runQueryWithCurrentUserID:(id)a3 cursor:(id)a4 additionalInfo:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v69 = 0LL;
  unsigned __int8 v15 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v69);
  id v16 = v69;
  if ((v15 & 1) != 0)
  {
    scope = self->_scope;
    if (scope)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineScope scopeIdentifier](scope, "scopeIdentifier"));
      v44 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTransportTask cloudKitScopeForScopeIdentifier:]( self,  "cloudKitScopeForScopeIdentifier:",  v18));

      if (v44)
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineScope scopeIdentifier](self->_scope, "scopeIdentifier"));
        id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask controller](self, "controller"));
        v42 = (void *)objc_claimAutoreleasedReturnValue([v19 zoneIdentificationForCloudKitScope:v44 engineScope:self->_scope]);

        p_queriedClass = &self->_queriedClass;
        if ([v42 supportsDownloadOfRecordClass:self->_queriedClass])
        {
          if (qword_100296090 != -1) {
            dispatch_once(&qword_100296090, &stru_10023FBC0);
          }
          v21 = (void *)qword_100296088;
          id v22 = sub_100045CE4(*p_queriedClass, v13);
          v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
          v41 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v23]);

          if (!v41) {
            sub_1001914AC(&self->_queriedClass, (uint64_t)a2, (uint64_t)self);
          }
          BOOL v24 = self->_cursor == 0LL;
          v25 = objc_alloc(&OBJC_CLASS___CKQueryOperation);
          if (v24)
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue([v41 query]);
            v27 = -[CKQueryOperation initWithQuery:](v25, "initWithQuery:", v26);
          }

          else
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCKQueryCursor queryCursor](self->_cursor, "queryCursor"));
            v27 = -[CKQueryOperation initWithCursor:](v25, "initWithCursor:", v26);
          }

          objc_super v33 = v27;

          v34 = (void *)objc_claimAutoreleasedReturnValue([v44 zoneID]);
          -[CKQueryOperation setZoneID:](v33, "setZoneID:", v34);

          -[CKQueryOperation setDesiredKeys:](v33, "setDesiredKeys:", 0LL);
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class ckAssetProperties](*p_queriedClass, "ckAssetProperties"));
          -[CKQueryOperation setShouldFetchAssetContent:]( v33,  "setShouldFetchAssetContent:",  [v40 count] != 0);
          uint64_t v35 = (uint64_t)[v41 resultsLimit];
          if (v35 >= 1) {
            -[CKQueryOperation setResultsLimit:](v33, "setResultsLimit:", v35);
          }
          if (v35) {
            uint64_t v36 = v35;
          }
          else {
            uint64_t v36 = 2000LL;
          }
          -[CKQueryOperation setFetchAllResults:](v33, "setFetchAllResults:", 1LL);
          *(void *)buf = 0LL;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000LL;
          v71 = sub_100045D74;
          v72 = sub_100045D84;
          v73 = objc_alloc_init(&OBJC_CLASS___CPLChangeBatch);
          v68[0] = 0LL;
          v68[1] = v68;
          v68[2] = 0x2020000000LL;
          v68[3] = 0LL;
          v66[0] = 0LL;
          v66[1] = v66;
          v66[2] = 0x2020000000LL;
          char v67 = 0;
          v58[0] = _NSConcreteStackBlock;
          v58[1] = 3221225472LL;
          v58[2] = sub_100045D8C;
          v58[3] = &unk_10023FC10;
          v62 = v66;
          v63 = v68;
          v58[4] = self;
          uint64_t v65 = v36;
          id v59 = v43;
          id v60 = v11;
          id v61 = v42;
          v64 = buf;
          -[CKQueryOperation setRecordMatchedBlock:](v33, "setRecordMatchedBlock:", v58);
          v54[0] = _NSConcreteStackBlock;
          v54[1] = 3221225472LL;
          v54[2] = sub_1000461BC;
          v54[3] = &unk_10023FC38;
          v54[4] = self;
          v56 = buf;
          id v37 = v13;
          id v55 = v37;
          v57 = v68;
          v51[0] = _NSConcreteStackBlock;
          v51[1] = 3221225472LL;
          v51[2] = sub_1000462F4;
          v51[3] = &unk_10023FC60;
          v53 = v66;
          v51[4] = self;
          v38 = objc_retainBlock(v54);
          id v52 = v38;
          -[CKQueryOperation setQueryCursorFetchedBlock:](v33, "setQueryCursorFetchedBlock:", v51);
          v45[0] = _NSConcreteStackBlock;
          v45[1] = 3221225472LL;
          v45[2] = sub_100046430;
          v45[3] = &unk_10023FCB0;
          v45[4] = self;
          v49 = v66;
          v50 = buf;
          v39 = v38;
          id v47 = v39;
          id v46 = v37;
          id v48 = v14;
          -[CKQueryOperation setQueryCompletionBlock:](v33, "setQueryCompletionBlock:", v45);
          -[CPLCloudKitTransportTask launchOperation:type:withContext:]( self,  "launchOperation:type:withContext:",  v33,  CPLCloudKitOperationTypeForScope(v44),  0LL);

          _Block_object_dispose(v66, 8);
          _Block_object_dispose(v68, 8);
          _Block_object_dispose(buf, 8);
        }

        else
        {
          if (!_CPLSilentLogging)
          {
            id v29 = sub_100045100();
            id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              id v31 = *p_queriedClass;
              v32 = (void *)objc_claimAutoreleasedReturnValue([v42 scopeIdentifier]);
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = v31;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v32;
              _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Ignoring unsupported %@ for %@",  buf,  0x16u);
            }
          }

          (*((void (**)(id, void))v14 + 2))(v14, 0LL);
        }
      }

      else
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  80LL,  @"Missing required zone"));
        (*((void (**)(id, void *))v14 + 2))(v14, v43);
      }
    }

    else
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  80LL,  @"Missing required scope"));
      (*((void (**)(id, void *))v14 + 2))(v14, v28);
    }
  }

  else
  {
    (*((void (**)(id, id))v14 + 2))(v14, v16);
  }
}

- (CPLCKQueryCursor)cursor
{
  return self->_cursor;
}

- (Class)queriedClass
{
  return self->_queriedClass;
}

- (CPLEngineScope)scope
{
  return self->_scope;
}

- (void).cxx_destruct
{
}

@end
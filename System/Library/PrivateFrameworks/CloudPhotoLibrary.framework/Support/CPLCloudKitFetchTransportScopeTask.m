@interface CPLCloudKitFetchTransportScopeTask
- (BOOL)shouldCreateScopeIfNecessary;
- (CPLCloudKitFetchTransportScopeTask)initWithController:(id)a3 scope:(id)a4 cloudKitScope:(id)a5 completionHandler:(id)a6;
- (CPLCloudKitScope)cloudKitScope;
- (CPLEngineScope)scope;
- (void)_callCompletionWithZone:(id)a3;
- (void)_updateCloudKitScopeWithZone:(id)a3;
- (void)createRecordZoneWithID:(id)a3;
- (void)runOperations;
- (void)setShouldCreateScopeIfNecessary:(BOOL)a3;
@end

@implementation CPLCloudKitFetchTransportScopeTask

- (CPLCloudKitFetchTransportScopeTask)initWithController:(id)a3 scope:(id)a4 cloudKitScope:(id)a5 completionHandler:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___CPLCloudKitFetchTransportScopeTask;
  v14 = -[CPLCloudKitTransportTask initWithController:](&v21, "initWithController:", a3);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_scope, a4);
    objc_storeStrong((id *)&v15->_cloudKitScope, a5);
    v16 = objc_alloc_init(&OBJC_CLASS___CPLEngineScopeFlagsUpdate);
    fetchedFlags = v15->_fetchedFlags;
    v15->_fetchedFlags = v16;

    id v18 = objc_retainBlock(v13);
    id completionHandler = v15->_completionHandler;
    v15->_id completionHandler = v18;

    v15->_options = 0LL;
  }

  return v15;
}

- (void)_updateCloudKitScopeWithZone:(id)a3
{
  cloudKitScope = self->_cloudKitScope;
  id v5 = a3;
  v6 = objc_alloc(&OBJC_CLASS___CPLCloudKitScope);
  if (cloudKitScope) {
    unint64_t options = self->_options | -[CPLCloudKitScope options](self->_cloudKitScope, "options");
  }
  else {
    unint64_t options = self->_options;
  }
  id v12 = -[CPLCloudKitScope initWithZone:options:](v6, "initWithZone:options:", v5, options);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask controller](self, "controller"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneIdentificationForCloudKitScope:v12 engineScope:self->_scope]);

  v10 = (CPLCloudKitScope *)objc_claimAutoreleasedReturnValue([v9 cloudKitScope]);
  id v11 = self->_cloudKitScope;
  self->_cloudKitScope = v10;
}

- (void)_callCompletionWithZone:(id)a3
{
  if (!_CPLSilentLogging)
  {
    id v4 = sub_100030230();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitScope zoneID](self->_cloudKitScope, "zoneID"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cpl_zoneName"));
      int64_t v8 = -[CPLCloudKitScope options](self->_cloudKitScope, "options");
      int v11 = 138543618;
      id v12 = v7;
      __int16 v13 = 2048;
      int64_t v14 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Fetched zone %{public}@ with options 0x%lx",  (uint8_t *)&v11,  0x16u);
    }
  }

  id completionHandler = (void (**)(id, void *, CPLEngineScopeFlagsUpdate *, void))self->_completionHandler;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitScope transportScope](self->_cloudKitScope, "transportScope"));
  completionHandler[2](completionHandler, v10, self->_fetchedFlags, 0LL);
}

- (void)createRecordZoneWithID:(id)a3
{
  id v5 = a3;
  id v18 = 0LL;
  unsigned __int8 v6 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v18);
  id v7 = v18;
  if ((v6 & 1) != 0)
  {
    if (!_CPLSilentLogging)
    {
      id v8 = sub_100030230();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cpl_zoneName"));
        *(_DWORD *)buf = 138543362;
        objc_super v21 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Creating primary zone with zoneID %{public}@",  buf,  0xCu);
      }
    }

    int v11 = -[CKRecordZone initWithZoneID:](objc_alloc(&OBJC_CLASS___CKRecordZone), "initWithZoneID:", v5);
    -[CPLCloudKitFetchTransportScopeTask _updateCloudKitScopeWithZone:](self, "_updateCloudKitScopeWithZone:", v11);
    id v12 = objc_alloc(&OBJC_CLASS___CKModifyRecordZonesOperation);
    v19 = v11;
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
    int64_t v14 = -[CKModifyRecordZonesOperation initWithRecordZonesToSave:recordZoneIDsToDelete:]( v12,  "initWithRecordZonesToSave:recordZoneIDsToDelete:",  v13,  0LL);

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10003048C;
    v15[3] = &unk_10023F360;
    v15[4] = self;
    id v16 = v5;
    SEL v17 = a2;
    -[CKModifyRecordZonesOperation setModifyRecordZonesCompletionBlock:]( v14,  "setModifyRecordZonesCompletionBlock:",  v15);
    -[CPLCloudKitTransportTask launchOperation:type:withContext:]( self,  "launchOperation:type:withContext:",  v14,  CPLCloudKitOperationTypeForScope(self->_cloudKitScope),  0LL);
  }

  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (void)runOperations
{
  id v82 = 0LL;
  unsigned __int8 v3 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v82);
  id v4 = v82;
  if ((v3 & 1) != 0)
  {
    uint64_t v76 = 0LL;
    v77 = &v76;
    uint64_t v78 = 0x3032000000LL;
    v79 = sub_100030FB8;
    v80 = sub_100030FC8;
    id v81 = (id)objc_claimAutoreleasedReturnValue(-[CPLCloudKitScope zone](self->_cloudKitScope, "zone"));
    uint64_t v70 = 0LL;
    v71 = &v70;
    uint64_t v72 = 0x3032000000LL;
    v73 = sub_100030FB8;
    v74 = sub_100030FC8;
    id v75 = (id)objc_claimAutoreleasedReturnValue([(id)v77[5] zoneID]);
    if (v71[5])
    {
      id v5 = objc_alloc(&OBJC_CLASS___CKRecordZoneID);
      unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([(id)v71[5] zoneName]);
      id v7 = (void *)objc_claimAutoreleasedReturnValue([(id)v71[5] ownerName]);
      id v8 = -[CKRecordZoneID initWithZoneName:ownerName:](v5, "initWithZoneName:ownerName:", v6, v7);
      v9 = (void *)v71[5];
      v71[5] = (uint64_t)v8;

      v10 = 0LL;
    }

    else
    {
      id v11 = -[CPLEngineScope scopeType](self->_scope, "scopeType");
      scope = self->_scope;
      if (v11 == (id)1)
      {
        __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineScope scopeIdentifier](scope, "scopeIdentifier"));
        unsigned int v14 = [v13 isEqualToString:CPLPrimaryScopeIdentifier];

        v15 = objc_alloc(&OBJC_CLASS___CKRecordZoneID);
        if (v14)
        {
          id v16 = (CKRecordZoneID *)objc_claimAutoreleasedReturnValue(-[CPLEngineScope scopeIdentifier](self->_scope, "scopeIdentifier"));
          SEL v17 = -[CKRecordZoneID initWithCPLScopeIdentifier:](v15, "initWithCPLScopeIdentifier:", v16);
          v10 = 0LL;
          id v18 = &stru_10023F3A0;
          v19 = &stru_10023F3E0;
        }

        else
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineScope scopeIdentifier](self->_scope, "scopeIdentifier"));
          v30 = -[CKRecordZoneID initWithCPLScopeIdentifier:](v15, "initWithCPLScopeIdentifier:", v29);

          v68[0] = _NSConcreteStackBlock;
          v68[1] = 3221225472LL;
          v68[2] = sub_100031024;
          v68[3] = &unk_10023F408;
          v31 = v30;
          v69 = v31;
          id v18 = objc_retainBlock(v68);
          v10 = v31;
          id v16 = v69;
          v19 = &stru_10023F428;
          SEL v17 = v10;
        }

        if (v18) {
          goto LABEL_25;
        }
        goto LABEL_23;
      }

      unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineScope scopeIdentifier](scope, "scopeIdentifier"));
      if (!_CPLSilentLogging)
      {
        id v20 = sub_100030230();
        objc_super v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = self->_scope;
          *(_DWORD *)buf = 138412290;
          v84 = v22;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Transport scope needs to be inferred for %@ - doing it naively for now",  buf,  0xCu);
        }
      }

      uint64_t v23 = objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask zoneIDFromScopeIdentifier:](self, "zoneIDFromScopeIdentifier:", v6));
      v24 = (void *)v71[5];
      v71[5] = v23;

      v25 = v71;
      v10 = (CKRecordZoneID *)(id)v71[5];
      v26 = (void *)objc_claimAutoreleasedReturnValue([(id)v25[5] ownerName]);
      unsigned __int8 v27 = [v26 isEqualToString:CKCurrentUserDefaultName];

      if ((v27 & 1) != 0)
      {
        uint64_t v28 = 0LL;
      }

      else
      {
        -[CPLEngineScopeFlagsUpdate setValue:forFlag:](self->_fetchedFlags, "setValue:forFlag:", 1LL, 1LL);
        uint64_t v28 = 2LL;
      }

      unsigned int v32 = +[CPLCloudKitZoneIdentification isSupportedZoneID:]( &OBJC_CLASS___CPLCloudKitLibraryShareZoneIdentification,  "isSupportedZoneID:",  v71[5]);
      v33 = objc_alloc(&OBJC_CLASS___CPLCloudKitScope);
      if (v32) {
        uint64_t v34 = v28 | 4;
      }
      else {
        uint64_t v34 = v28;
      }
      v35 = -[CPLCloudKitScope initWithZoneID:options:](v33, "initWithZoneID:options:", v71[5], v34);
      cloudKitScope = self->_cloudKitScope;
      self->_cloudKitScope = v35;

      uint64_t v37 = objc_claimAutoreleasedReturnValue(-[CPLCloudKitScope zone](self->_cloudKitScope, "zone"));
      id v7 = (void *)v77[5];
      v77[5] = v37;
    }

    SEL v17 = 0LL;
LABEL_23:
    if (!v71[5])
    {
      if (!_CPLSilentLogging)
      {
        id v54 = sub_100030230();
        v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "No zoneID to validate against", buf, 2u);
        }
      }

      v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/CloudK it/CPLCloudKitFetchTransportScopeTask.m"));
      [v56 handleFailureInMethod:a2 object:self file:v57 lineNumber:162 description:@"No zoneID to validate against"];

      abort();
    }

    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472LL;
    v67[2] = sub_100031038;
    v67[3] = &unk_10023F450;
    v67[4] = &v70;
    id v18 = objc_retainBlock(v67);
    v38 = (CKRecordZoneID *)(id)v71[5];

    v19 = &stru_10023F470;
    SEL v17 = v38;
LABEL_25:
    v39 = self->_cloudKitScope;
    if (v39) {
      uint64_t v40 = CPLCloudKitOperationTypeForScope(v39);
    }
    else {
      uint64_t v40 = 1LL;
    }
    if (v10)
    {
      v41 = objc_alloc(&OBJC_CLASS___CKFetchRecordZonesOperation);
      v87 = v10;
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v87, 1LL));
      v43 = -[CKFetchRecordZonesOperation initWithRecordZoneIDs:](v41, "initWithRecordZoneIDs:", v42);

      if (!_CPLSilentLogging)
      {
        id v44 = sub_100030230();
        v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          v46 = (CPLEngineScope *)objc_claimAutoreleasedReturnValue(-[CKRecordZoneID cpl_zoneName](v10, "cpl_zoneName"));
          v47 = self->_scope;
          *(_DWORD *)buf = 138543618;
          v84 = v46;
          __int16 v85 = 2112;
          v86 = v47;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Fetching %{public}@ for %@", buf, 0x16u);
        }

- (BOOL)shouldCreateScopeIfNecessary
{
  return self->_shouldCreateScopeIfNecessary;
}

- (void)setShouldCreateScopeIfNecessary:(BOOL)a3
{
  self->_shouldCreateScopeIfNecessary = a3;
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
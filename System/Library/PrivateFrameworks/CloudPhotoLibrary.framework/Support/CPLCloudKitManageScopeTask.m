@interface CPLCloudKitManageScopeTask
- (BOOL)checkScopeIsValidWithError:(id *)a3;
- (CPLCloudKitManageScopeTask)initWithController:(id)a3 scope:(id)a4;
- (CPLCloudKitScope)cloudKitScope;
- (CPLCloudKitZoneIdentification)identification;
- (CPLEngineScope)engineScope;
- (CPLScopeChange)scope;
- (NSString)scopeIdentifier;
- (int64_t)scopeType;
- (void)fetchShareParticipantsForParticipants:(id)a3 completionBlock:(id)a4;
- (void)resetCloudKitScope:(id)a3;
@end

@implementation CPLCloudKitManageScopeTask

- (CPLCloudKitManageScopeTask)initWithController:(id)a3 scope:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CPLCloudKitManageScopeTask;
  v8 = -[CPLCloudKitTransportTask initWithController:](&v11, "initWithController:", a3);
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_scope, a4);
  }

  return v9;
}

- (BOOL)checkScopeIsValidWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask controller](self, "controller"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitManageScopeTask cloudKitScope](self, "cloudKitScope"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitManageScopeTask engineScope](self, "engineScope"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneIdentificationForCloudKitScope:v6 engineScope:v7]);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask mainScopeIdentifier](self, "mainScopeIdentifier"));
  v10 = (CPLScopeChange *)[v8 newScopeIdentifierRelativeToMainScopeIdentifier:v9];

  if (v10)
  {
    if (!_CPLSilentLogging)
    {
      id v11 = sub_10004BC14();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        scope = self->_scope;
        int v18 = 138543618;
        v19 = v10;
        __int16 v20 = 2112;
        v21 = scope;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Picked %{public}@ for %@",  (uint8_t *)&v18,  0x16u);
      }
    }

    -[CPLScopeChange updateScopeIdentifier:](self->_scope, "updateScopeIdentifier:", v10);
    if (!_CPLSilentLogging)
    {
      id v14 = sub_10004BC14();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = self->_scope;
        int v18 = 138412290;
        v19 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "New scope is %@", (uint8_t *)&v18, 0xCu);
      }
    }

    return 1;
  }

  if (a3) {
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors incorrectParametersErrorForParameter:]( &OBJC_CLASS___CPLErrors,  "incorrectParametersErrorForParameter:",  @"scopeIdentifier"));
  }

  return 0;
}

- (int64_t)scopeType
{
  return (int64_t)-[CPLScopeChange scopeType](self->_scope, "scopeType");
}

- (NSString)scopeIdentifier
{
  return (NSString *)-[CPLScopeChange scopeIdentifier](self->_scope, "scopeIdentifier");
}

- (CPLEngineScope)engineScope
{
  if (self->_identification)
  {
    v2 = (CPLEngineScope *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification engineScope](self->_identification, "engineScope"));
  }

  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitManageScopeTask scope](self, "scope"));
    v4 = objc_alloc(&OBJC_CLASS___CPLEngineScope);
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 scopeIdentifier]);
    v2 = -[CPLEngineScope initWithScopeIdentifier:scopeType:]( v4,  "initWithScopeIdentifier:scopeType:",  v5,  [v3 scopeType]);
  }

  return v2;
}

- (CPLCloudKitScope)cloudKitScope
{
  identification = self->_identification;
  if (identification)
  {
    v4 = (CPLCloudKitScope *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitZoneIdentification cloudKitScope](identification, "cloudKitScope"));
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLScopeChange scopeIdentifier](self->_scope, "scopeIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask zoneIDFromScopeIdentifier:](self, "zoneIDFromScopeIdentifier:", v5));

    v4 = -[CPLCloudKitScope initWithZoneID:options:]( objc_alloc(&OBJC_CLASS___CPLCloudKitScope),  "initWithZoneID:options:",  v6,  0LL);
  }

  return v4;
}

- (CPLCloudKitZoneIdentification)identification
{
  identification = self->_identification;
  if (!identification)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask controller](self, "controller"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitManageScopeTask cloudKitScope](self, "cloudKitScope"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitManageScopeTask engineScope](self, "engineScope"));
    id v7 = (CPLCloudKitZoneIdentification *)objc_claimAutoreleasedReturnValue([v4 zoneIdentificationForCloudKitScope:v5 engineScope:v6]);
    v8 = self->_identification;
    self->_identification = v7;

    identification = self->_identification;
  }

  return identification;
}

- (void)resetCloudKitScope:(id)a3
{
  id v4 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask controller](self, "controller"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitManageScopeTask engineScope](self, "engineScope"));
  v6 = (CPLCloudKitZoneIdentification *)objc_claimAutoreleasedReturnValue([v8 zoneIdentificationForCloudKitScope:v4 engineScope:v5]);

  identification = self->_identification;
  self->_identification = v6;
}

- (void)fetchShareParticipantsForParticipants:(id)a3 completionBlock:(id)a4
{
  id v37 = a3;
  id v36 = a4;
  id v54 = 0LL;
  v34 = self;
  LOBYTE(a4) = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v54);
  id v6 = v54;
  v35 = v6;
  if ((a4 & 1) == 0)
  {
    (*((void (**)(id, void, void, id))v36 + 2))(v36, 0LL, 0LL, v6);
    goto LABEL_27;
  }

  id v7 = [v37 count];
  v39 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v8 = -[NSMutableDictionary initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableDictionary), "initWithCapacity:", v7);
  v9 = -[NSMutableDictionary initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableDictionary), "initWithCapacity:", v7);
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  id obj = v37;
  id v10 = [obj countByEnumeratingWithState:&v50 objects:v60 count:16];
  if (!v10) {
    goto LABEL_25;
  }
  uint64_t v11 = *(void *)v51;
  do
  {
    for (i = 0LL; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v51 != v11) {
        objc_enumerationMutation(obj);
      }
      v13 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)i);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 email]);

      if (!v14
        || (v15 = objc_alloc(&OBJC_CLASS___CKUserIdentityLookupInfo),
            v16 = (void *)objc_claimAutoreleasedReturnValue([v13 email]),
            v17 = -[CKUserIdentityLookupInfo initWithEmailAddress:](v15, "initWithEmailAddress:", v16),
            v16,
            !v17))
      {
        int v18 = (void *)objc_claimAutoreleasedReturnValue([v13 phoneNumber]);
        BOOL v19 = v18 == 0LL;

        if (v19)
        {
          v17 = 0LL;
        }

        else
        {
          __int16 v20 = objc_alloc(&OBJC_CLASS___CKUserIdentityLookupInfo);
          v21 = (void *)objc_claimAutoreleasedReturnValue([v13 phoneNumber]);
          v17 = -[CKUserIdentityLookupInfo initWithPhoneNumber:](v20, "initWithPhoneNumber:", v21);
        }
      }

      uint64_t v22 = objc_claimAutoreleasedReturnValue([v13 userIdentifier]);
      v23 = (void *)v22;
      if (v17 || !v22)
      {
        if (!v22) {
          goto LABEL_17;
        }
      }

      else
      {
        v24 = objc_alloc(&OBJC_CLASS___CKRecordID);
        v25 = (void *)objc_claimAutoreleasedReturnValue([v13 userIdentifier]);
        v26 = -[CKRecordID initWithRecordName:](v24, "initWithRecordName:", v25);

        v17 = -[CKUserIdentityLookupInfo initWithUserRecordID:]( objc_alloc(&OBJC_CLASS___CKUserIdentityLookupInfo),  "initWithUserRecordID:",  v26);
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v13, v23);
LABEL_17:
      if (v17)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v13, v17);
        -[NSMutableArray addObject:](v39, "addObject:", v17);
      }

      else if (!_CPLSilentLogging)
      {
        id v27 = sub_10004BC14();
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "%@ has no identifiable property",  (uint8_t *)&buf,  0xCu);
        }
      }
    }

    id v10 = [obj countByEnumeratingWithState:&v50 objects:v60 count:16];
  }

  while (v10);
LABEL_25:

  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_10004C404;
  v47[3] = &unk_10023FEA8;
  v29 = v8;
  v48 = v29;
  v30 = v9;
  v49 = v30;
  v31 = objc_retainBlock(v47);
  v32 = -[CKFetchShareParticipantsOperation initWithUserIdentityLookupInfos:]( objc_alloc(&OBJC_CLASS___CKFetchShareParticipantsOperation),  "initWithUserIdentityLookupInfos:",  v39);
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v56 = 0x3032000000LL;
  v57 = sub_10004C54C;
  v58 = sub_10004C55C;
  v59 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [obj count]);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_10004C564;
  v44[3] = &unk_10023FED0;
  v33 = v31;
  id v45 = v33;
  p___int128 buf = &buf;
  -[CKFetchShareParticipantsOperation setPerShareParticipantCompletionBlock:]( v32,  "setPerShareParticipantCompletionBlock:",  v44);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_10004C704;
  v40[3] = &unk_10023FF20;
  v40[4] = v34;
  id v41 = obj;
  id v42 = v36;
  v43 = &buf;
  -[CKFetchShareParticipantsOperation setFetchShareParticipantsCompletionBlock:]( v32,  "setFetchShareParticipantsCompletionBlock:",  v40);
  -[CPLCloudKitTransportTask launchOperation:type:withContext:](v34, "launchOperation:type:withContext:", v32, 0LL, 0LL);

  _Block_object_dispose(&buf, 8);
LABEL_27:
}

- (CPLScopeChange)scope
{
  return self->_scope;
}

- (void).cxx_destruct
{
}

@end
@interface CPLCloudKitExitSharedLibraryTask
+ (NSDictionary)exitStageMapping;
- (CPLCloudKitExitSharedLibraryTask)initWithController:(id)a3 cloudKitScope:(id)a4 scope:(id)a5 share:(id)a6 retentionPolicy:(int64_t)a7 exitType:(int64_t)a8 exitSource:(int64_t)a9 userIdentifiersToRemove:(id)a10 participantIDsToRemove:(id)a11 completionHandler:(id)a12;
- (CPLCloudKitScope)cloudKitScope;
- (CPLEngineScope)scope;
- (CPLShare)share;
- (NSArray)participantIDsToRemove;
- (NSArray)userIdentifiersToRemove;
- (id)_exitErrorFromError:(id)a3;
- (id)initRemoveParticipantsWithController:(id)a3 cloudKitScope:(id)a4 scope:(id)a5 share:(id)a6 userIdentifiersToRemove:(id)a7 participantIDsToRemove:(id)a8 retentionPolicy:(int64_t)a9 exitSource:(int64_t)a10 completionHandler:(id)a11;
- (id)initSelfExitWithController:(id)a3 cloudKitScope:(id)a4 scope:(id)a5 share:(id)a6 retentionPolicy:(int64_t)a7 exitSource:(int64_t)a8 completionHandler:(id)a9;
- (int64_t)exitSource;
- (int64_t)exitType;
- (int64_t)retentionPolicy;
- (void)_reallyExit;
- (void)runOperations;
@end

@implementation CPLCloudKitExitSharedLibraryTask

+ (NSDictionary)exitStageMapping
{
  if (qword_100296618 != -1) {
    dispatch_once(&qword_100296618, &stru_1002427F0);
  }
  return (NSDictionary *)(id)qword_100296610;
}

- (CPLCloudKitExitSharedLibraryTask)initWithController:(id)a3 cloudKitScope:(id)a4 scope:(id)a5 share:(id)a6 retentionPolicy:(int64_t)a7 exitType:(int64_t)a8 exitSource:(int64_t)a9 userIdentifiersToRemove:(id)a10 participantIDsToRemove:(id)a11 completionHandler:(id)a12
{
  id v33 = a4;
  id v32 = a5;
  id v31 = a6;
  id v19 = a10;
  id v20 = a11;
  id v21 = a12;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___CPLCloudKitExitSharedLibraryTask;
  v22 = -[CPLCloudKitTransportTask initWithController:](&v34, "initWithController:", a3);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_cloudKitScope, a4);
    objc_storeStrong((id *)&v23->_scope, a5);
    objc_storeStrong((id *)&v23->_share, a6);
    v23->_retentionPolicy = a7;
    v23->_exitType = a8;
    v23->_exitSource = a9;
    v24 = (NSArray *)[v19 copy];
    userIdentifiersToRemove = v23->_userIdentifiersToRemove;
    v23->_userIdentifiersToRemove = v24;

    v26 = (NSArray *)[v20 copy];
    participantIDsToRemove = v23->_participantIDsToRemove;
    v23->_participantIDsToRemove = v26;

    id v28 = [v21 copy];
    id completionHandler = v23->_completionHandler;
    v23->_id completionHandler = v28;
  }

  return v23;
}

- (id)initSelfExitWithController:(id)a3 cloudKitScope:(id)a4 scope:(id)a5 share:(id)a6 retentionPolicy:(int64_t)a7 exitSource:(int64_t)a8 completionHandler:(id)a9
{
  id v14 = a5;
  id v15 = a9;
  id v16 = a6;
  id v17 = a4;
  id v18 = a3;
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v16 currentUserParticipant]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v16 owner]);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1000B1B10;
  v27[3] = &unk_100242818;
  id v30 = v15;
  SEL v31 = a2;
  uint64_t v32 = 2LL * (v19 == v20);
  id v28 = self;
  id v29 = v14;
  id v21 = v14;
  id v22 = v15;
  v23 = -[CPLCloudKitExitSharedLibraryTask initWithController:cloudKitScope:scope:share:retentionPolicy:exitType:exitSource:userIdentifiersToRemove:participantIDsToRemove:completionHandler:]( v28,  "initWithController:cloudKitScope:scope:share:retentionPolicy:exitType:exitSource:userIdentifiersToRemove:parti cipantIDsToRemove:completionHandler:",  v18,  v17,  v21,  v16,  a7,  v32,  a8,  &__NSArray0__struct,  &__NSArray0__struct,  v27);

  return v23;
}

- (id)initRemoveParticipantsWithController:(id)a3 cloudKitScope:(id)a4 scope:(id)a5 share:(id)a6 userIdentifiersToRemove:(id)a7 participantIDsToRemove:(id)a8 retentionPolicy:(int64_t)a9 exitSource:(int64_t)a10 completionHandler:(id)a11
{
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000B21F0;
  v21[3] = &unk_10023ECA0;
  id v22 = a11;
  id v18 = v22;
  id v19 = -[CPLCloudKitExitSharedLibraryTask initWithController:cloudKitScope:scope:share:retentionPolicy:exitType:exitSource:userIdentifiersToRemove:participantIDsToRemove:completionHandler:]( self,  "initWithController:cloudKitScope:scope:share:retentionPolicy:exitType:exitSource:userIdentifiersToRemove:parti cipantIDsToRemove:completionHandler:",  a3,  a4,  a5,  a6,  a9,  1LL,  a10,  a7,  a8,  v21);

  return v19;
}

- (id)_exitErrorFromError:(id)a3
{
  return a3;
}

- (void)_reallyExit
{
  id v73 = 0LL;
  unsigned __int8 v3 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v73);
  id v4 = v73;
  if ((v3 & 1) == 0)
  {
    id v14 = (void (*)(void))*((void *)self->_completionHandler + 2);
LABEL_15:
    v14();
    goto LABEL_77;
  }

  int64_t exitSource = self->_exitSource;
  if (exitSource == 2) {
    uint64_t v6 = 1LL;
  }
  else {
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (exitSource == 1) {
    uint64_t v7 = 0LL;
  }
  else {
    uint64_t v7 = v6;
  }
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id completionHandler = (void (**)(id, void, void *))self->_completionHandler;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CPLLibraryManager mappingExitSources](&OBJC_CLASS___CPLLibraryManager, "mappingExitSources"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_exitSource));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v10]);
    v12 = v11;
    if (!v11) {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_exitSource));
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  50LL,  @"%@ is not a valid exit source to request",  v12));
    completionHandler[2](completionHandler, 0LL, v13);

    if (!v11) {
    goto LABEL_77;
    }
  }

  if (self->_cloudKitScope
    || (id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineScope scopeIdentifier](self->_scope, "scopeIdentifier")),
        id v16 = (CPLCloudKitScope *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTransportTask cloudKitScopeForScopeIdentifier:]( self,  "cloudKitScopeForScopeIdentifier:",  v15)),  cloudKitScope = self->_cloudKitScope,  self->_cloudKitScope = v16,  cloudKitScope,  v15,  self->_cloudKitScope))
  {

    int64_t exitType = self->_exitType;
    if (exitType == 2)
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CPLShare currentUserParticipant](self->_share, "currentUserParticipant"));
      uint64_t v24 = objc_claimAutoreleasedReturnValue(-[CPLShare owner](self->_share, "owner"));
      id v21 = (void *)v24;
      if (v19)
      {
        if (v19 == (void *)v24)
        {
          id v22 = (void *)objc_claimAutoreleasedReturnValue([v19 userIdentifier]);
          v88 = v22;
          v23 = &v88;
          goto LABEL_51;
        }

        if (_CPLSilentLogging) {
          goto LABEL_57;
        }
        id v25 = sub_1000B20D0();
        v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          goto LABEL_56;
        }
        scope = self->_scope;
        *(_DWORD *)buf = 138412290;
        v75 = scope;
        id v28 = "Trying to dismantle %@ but current user is not the owner of the shared library";
      }

      else
      {
        if (_CPLSilentLogging) {
          goto LABEL_57;
        }
        id v38 = sub_1000B20D0();
        v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          goto LABEL_56;
        }
        v39 = self->_scope;
        *(_DWORD *)buf = 138412290;
        v75 = v39;
        id v28 = "Trying to remove current user from %@ but current user is not a participant";
      }
    }

    else
    {
      if (exitType == 1)
      {
        id v29 = self->_userIdentifiersToRemove;
        id v4 = 0LL;
        if (v29)
        {
LABEL_59:
          v70 = v29;
          uint64_t v30 = v7;
          v71 = v29;
LABEL_60:
          v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
          id v46 = [v45 integerForKey:@"CPLSharedLibraryExitStopAtStage"];

          v47 = (void *)objc_claimAutoreleasedReturnValue( +[CPLCloudKitExitSharedLibraryTask exitStageMapping]( &OBJC_CLASS___CPLCloudKitExitSharedLibraryTask,  "exitStageMapping"));
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v46));
          v49 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:v48]);

          if (v49)
          {
            if (v46)
            {
              uint64_t v50 = v30;
              if (_CPLSilentLogging) {
                goto LABEL_71;
              }
              id v51 = sub_1000B20D0();
              v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
              if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
              {
                v53 = (CPLEngineScope *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitScope zoneID](self->_cloudKitScope, "zoneID"));
                int64_t retentionPolicy = self->_retentionPolicy;
                int64_t v55 = self->_exitType;
                participantIDsToRemove = self->_participantIDsToRemove;
                *(_DWORD *)buf = 138413826;
                v75 = v53;
                __int16 v76 = 2048;
                int64_t v77 = retentionPolicy;
                __int16 v78 = 2048;
                int64_t v79 = v55;
                __int16 v80 = 2048;
                uint64_t v81 = v30;
                __int16 v82 = 2112;
                v83 = v71;
                __int16 v84 = 2112;
                v85 = participantIDsToRemove;
                __int16 v86 = 2112;
                v87 = v49;
                _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "Exit shared library with zoneID %@ retention policy %ld exitType %ld exitSource %ld userIDs %@ partici pantIDs %@ [stop at %@]",  buf,  0x48u);
              }

              goto LABEL_70;
            }
          }

          else
          {
            v57 = (void *)objc_claimAutoreleasedReturnValue( +[CPLCloudKitExitSharedLibraryTask exitStageMapping]( &OBJC_CLASS___CPLCloudKitExitSharedLibraryTask,  "exitStageMapping"));
            v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL));
            v49 = (void *)objc_claimAutoreleasedReturnValue([v57 objectForKeyedSubscript:v58]);
          }

          uint64_t v50 = v30;
          if (_CPLSilentLogging)
          {
            id v46 = 0LL;
            goto LABEL_71;
          }

          id v59 = sub_1000B20D0();
          v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            v60 = (CPLEngineScope *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitScope zoneID](self->_cloudKitScope, "zoneID"));
            int64_t v61 = self->_retentionPolicy;
            int64_t v62 = self->_exitType;
            v63 = self->_participantIDsToRemove;
            *(_DWORD *)buf = 138413570;
            v75 = v60;
            __int16 v76 = 2048;
            int64_t v77 = v61;
            __int16 v78 = 2048;
            int64_t v79 = v62;
            __int16 v80 = 2048;
            uint64_t v81 = v30;
            __int16 v82 = 2112;
            v83 = v71;
            __int16 v84 = 2112;
            v85 = v63;
            _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "Exit shared library with zoneID %@ retention policy %ld exitType %ld exitSource %ld userIDs %@ participantIDs %@",  buf,  0x3Eu);
          }

          id v46 = 0LL;
LABEL_70:

LABEL_71:
          v64 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitScope zoneID](self->_cloudKitScope, "zoneID"));
          int64_t v65 = self->_retentionPolicy;
          if (v65 == 1) {
            uint64_t v66 = 1LL;
          }
          else {
            uint64_t v66 = 2LL * (v65 == 2);
          }
          int64_t v67 = self->_exitType;
          v68 = self->_participantIDsToRemove;
          if (!v68) {
            v68 = (NSArray *)&__NSArray0__struct;
          }
          v72[0] = _NSConcreteStackBlock;
          v72[1] = 3221225472LL;
          v72[2] = sub_1000B2E04;
          v72[3] = &unk_100242840;
          v72[4] = self;
          v69 = (void *)objc_claimAutoreleasedReturnValue( +[CPLCKPhotosSharedLibraryOperation exitSharedLibraryOperationWithZoneID:retentionPolicy:exitType:exitSource:stopAt:participantUserIDsToRemove:participantIDsToRemove:completionHandler:]( &OBJC_CLASS___CPLCKPhotosSharedLibraryOperation,  "exitSharedLibraryOperationWithZoneID:retentionPolicy:exitType:exitSource:stopAt:participantU serIDsToRemove:participantIDsToRemove:completionHandler:",  v64,  v66,  v67,  v50,  v46,  v70,  v68,  v72));

          -[CPLCloudKitTransportTask launchOperation:type:withContext:]( self,  "launchOperation:type:withContext:",  v69,  CPLCloudKitOperationTypeForScope(self->_cloudKitScope),  0LL);
          goto LABEL_77;
        }

- (void)runOperations
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000B323C;
  v2[3] = &unk_10023FB58;
  v2[4] = self;
  -[CPLCloudKitTransportTask getUserRecordIDFetchIfNecessaryWithCompletionHandler:]( self,  "getUserRecordIDFetchIfNecessaryWithCompletionHandler:",  v2);
}

- (CPLCloudKitScope)cloudKitScope
{
  return self->_cloudKitScope;
}

- (CPLEngineScope)scope
{
  return self->_scope;
}

- (CPLShare)share
{
  return self->_share;
}

- (int64_t)retentionPolicy
{
  return self->_retentionPolicy;
}

- (int64_t)exitType
{
  return self->_exitType;
}

- (int64_t)exitSource
{
  return self->_exitSource;
}

- (NSArray)userIdentifiersToRemove
{
  return self->_userIdentifiersToRemove;
}

- (NSArray)participantIDsToRemove
{
  return self->_participantIDsToRemove;
}

- (void).cxx_destruct
{
}

@end
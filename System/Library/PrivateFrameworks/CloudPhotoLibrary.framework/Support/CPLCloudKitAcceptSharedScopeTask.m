@interface CPLCloudKitAcceptSharedScopeTask
- (CPLCloudKitAcceptSharedScopeTask)initWithController:(id)a3 scope:(id)a4 completionHandler:(id)a5;
- (void)_acceptShareWithMetadata:(id)a3 currentUserID:(id)a4 completionHandler:(id)a5;
- (void)_acceptShareWithURL:(id)a3 currentUserID:(id)a4 completionHandler:(id)a5;
- (void)_fetchMetadataForShareURL:(id)a3 currentUserID:(id)a4 completion:(id)a5;
- (void)_updateScopeAndFlagsWithCKRecord:(id)a3 currentUserID:(id)a4;
- (void)_updateScopeParticipantsWithCKShare:(id)a3 currentUserID:(id)a4;
- (void)runOperations;
@end

@implementation CPLCloudKitAcceptSharedScopeTask

- (CPLCloudKitAcceptSharedScopeTask)initWithController:(id)a3 scope:(id)a4 completionHandler:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___CPLCloudKitAcceptSharedScopeTask;
  v11 = -[CPLCloudKitTransportTask initWithController:](&v16, "initWithController:", a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_scope, a4);
    id v13 = [v10 copy];
    id completionHandler = v12->_completionHandler;
    v12->_id completionHandler = v13;
  }

  return v12;
}

- (void)runOperations
{
  id v15 = 0LL;
  unsigned __int8 v3 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v15);
  id v4 = v15;
  if ((v3 & 1) == 0)
  {
    (*((void (**)(void))self->_completionHandler + 2))();
    goto LABEL_12;
  }

  if (!-[CPLScopeChange scopeType](self->_scope, "scopeType"))
  {
    id completionHandler = self->_completionHandler;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLScopeChange scopeIdentifier](self->_scope, "scopeIdentifier"));
    id v10 = +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  38LL,  @"Scope %@ is unknown",  v9);
LABEL_9:
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    (*((void (**)(id, void, void, void, void *))completionHandler + 2))( completionHandler,  0LL,  0LL,  0LL,  v11);

    goto LABEL_12;
  }

  if (!-[CPLScopeChange canAcceptShareWithCloudKit](self->_scope, "canAcceptShareWithCloudKit"))
  {
    id completionHandler = self->_completionHandler;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLScopeChange scopeIdentifier](self->_scope, "scopeIdentifier"));
    id v10 = +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  38LL,  @"Scope %@ can't be accepted by this user",  v9);
    goto LABEL_9;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLScopeChange share](self->_scope, "share"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 URL]);
  v7 = v6;
  if (v6)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000508EC;
    v13[3] = &unk_10023F750;
    v13[4] = self;
    id v14 = v6;
    -[CPLCloudKitTransportTask getUserRecordIDFetchIfNecessaryWithCompletionHandler:]( self,  "getUserRecordIDFetchIfNecessaryWithCompletionHandler:",  v13);
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  50LL,  @"Missing share URL in %@",  self->_scope));
    (*((void (**)(void))self->_completionHandler + 2))();
  }

LABEL_12:
}

- (void)_updateScopeAndFlagsWithCKRecord:(id)a3 currentUserID:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  if (v11)
  {
    identification = self->_identification;
    if (!identification) {
      sub_1001919C8((uint64_t)self, (uint64_t)a2);
    }
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitZoneIdentification updatedScopeChangeFromScopeChange:currentUserID:withCKRecord:]( identification,  "updatedScopeChangeFromScopeChange:currentUserID:withCKRecord:",  self->_scope,  v7,  v11));
    if (v9) {
      objc_storeStrong((id *)&self->_scope, v9);
    }
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitZoneIdentification updatedFlagsFromCKRecord:]( self->_identification,  "updatedFlagsFromCKRecord:",  v11));
    if (v10) {
      objc_storeStrong((id *)&self->_flags, v10);
    }
  }
}

- (void)_updateScopeParticipantsWithCKShare:(id)a3 currentUserID:(id)a4
{
  if (a3)
  {
    scope = self->_scope;
    id v7 = a4;
    id v8 = a3;
    id v9 = -[CPLScopeChange copy](scope, "copy");
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 participants]);

    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[CPLShareParticipant shareParticipantsFromCKShareParticipants:currentUserID:]( &OBJC_CLASS___CPLShareParticipant,  "shareParticipantsFromCKShareParticipants:currentUserID:",  v10,  v7));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v9 share]);
    [v12 setParticipants:v11];

    id v13 = self->_scope;
    self->_scope = (CPLScopeChange *)v9;
  }

- (void)_acceptShareWithURL:(id)a3 currentUserID:(id)a4 completionHandler:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100050FF4;
  v10[3] = &unk_100240170;
  id v11 = a4;
  id v12 = a5;
  v10[4] = self;
  id v8 = v11;
  id v9 = v12;
  -[CPLCloudKitAcceptSharedScopeTask _fetchMetadataForShareURL:currentUserID:completion:]( self,  "_fetchMetadataForShareURL:currentUserID:completion:",  a3,  v8,  v10);
}

- (void)_fetchMetadataForShareURL:(id)a3 currentUserID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v31 = 0LL;
  unsigned __int8 v11 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v31);
  id v12 = v31;
  if ((v11 & 1) != 0)
  {
    id v13 = objc_alloc(&OBJC_CLASS___CKFetchShareMetadataOperation);
    id v32 = v8;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v32, 1LL));
    id v15 = -[CKFetchShareMetadataOperation initWithShareURLs:](v13, "initWithShareURLs:", v14);

    v29[0] = 0LL;
    v29[1] = v29;
    v29[2] = 0x3032000000LL;
    v29[3] = sub_100051304;
    v29[4] = sub_100051314;
    id v30 = 0LL;
    v27[0] = 0LL;
    v27[1] = v27;
    v27[2] = 0x3032000000LL;
    v27[3] = sub_100051304;
    v27[4] = sub_100051314;
    id v28 = 0LL;
    -[CKFetchShareMetadataOperation setShouldFetchRootRecord:](v15, "setShouldFetchRootRecord:", 1LL);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_10005131C;
    v26[3] = &unk_100240198;
    v26[4] = self;
    v26[5] = v27;
    v26[6] = v29;
    -[CKFetchShareMetadataOperation setPerShareMetadataBlock:](v15, "setPerShareMetadataBlock:", v26);
    objc_super v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472LL;
    v18 = sub_100051468;
    v19 = &unk_1002401E8;
    v20 = self;
    v24 = v27;
    v25 = v29;
    id v23 = v10;
    id v21 = v8;
    id v22 = v9;
    -[CKFetchShareMetadataOperation setFetchShareMetadataCompletionBlock:]( v15,  "setFetchShareMetadataCompletionBlock:",  &v16);
    -[CPLCloudKitTransportTask launchOperation:type:withContext:]( self,  "launchOperation:type:withContext:",  v15,  0LL,  0LL,  v16,  v17,  v18,  v19,  v20);

    _Block_object_dispose(v27, 8);
    _Block_object_dispose(v29, 8);
  }

  else
  {
    (*((void (**)(id, void, id))v10 + 2))(v10, 0LL, v12);
  }
}

- (void)_acceptShareWithMetadata:(id)a3 currentUserID:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v19 = 0LL;
  unsigned __int8 v12 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v19);
  id v13 = v19;
  if ((v12 & 1) != 0)
  {
    identification = self->_identification;
    if (!identification) {
      sub_100191AB4((uint64_t)self, (uint64_t)a2);
    }
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100051F20;
    v15[3] = &unk_100240288;
    id v18 = v11;
    v15[4] = self;
    id v16 = v9;
    id v17 = v10;
    -[CPLCloudKitZoneIdentification validateAcceptSharedScopeTask:completionHandler:]( identification,  "validateAcceptSharedScopeTask:completionHandler:",  self,  v15);
  }

  else
  {
    (*((void (**)(id, id))v11 + 2))(v11, v13);
  }
}

- (void).cxx_destruct
{
}

@end
@interface CPLCloudKitQueryUserDetailsTask
- (CPLCloudKitQueryUserDetailsTask)initWithController:(id)a3 participants:(id)a4 completionHandler:(id)a5;
- (void)queryUserDetailsWithCurrentUserID:(id)a3;
- (void)runOperations;
@end

@implementation CPLCloudKitQueryUserDetailsTask

- (CPLCloudKitQueryUserDetailsTask)initWithController:(id)a3 participants:(id)a4 completionHandler:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___CPLCloudKitQueryUserDetailsTask;
  v11 = -[CPLCloudKitTransportTask initWithController:](&v16, "initWithController:", a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_participants, a4);
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
  v2[2] = sub_1000ABB90;
  v2[3] = &unk_10023FB58;
  v2[4] = self;
  -[CPLCloudKitTransportTask getUserRecordIDFetchIfNecessaryWithCompletionHandler:]( self,  "getUserRecordIDFetchIfNecessaryWithCompletionHandler:",  v2);
}

- (void)queryUserDetailsWithCurrentUserID:(id)a3
{
  id v27 = a3;
  v28 = self;
  id v37 = 0LL;
  LOBYTE(self) = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v37);
  id v26 = v37;
  if ((self & 1) == 0)
  {
    (*((void (**)(void))v28->_completionHandler + 2))();
    goto LABEL_26;
  }

  uint64_t v25 = 34LL;
  if (!v28->_participants)
  {
    id completionHandler = (void (**)(id, void, void *))v28->_completionHandler;
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors incorrectParametersErrorForParameter:]( &OBJC_CLASS___CPLErrors,  "incorrectParametersErrorForParameter:",  @"participants"));
    completionHandler[2](completionHandler, 0LL, v24);

    goto LABEL_26;
  }

  v4 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSArray count](v28->_participants, "count"));
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  v5 = v28->_participants;
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v33,  v43,  16LL);
  if (!v6) {
    goto LABEL_23;
  }
  uint64_t v7 = *(void *)v34;
  do
  {
    v8 = 0LL;
    do
    {
      if (*(void *)v34 != v7) {
        objc_enumerationMutation(v5);
      }
      id v9 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)v8);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "email", v25 * 8, v26));

      if (v10)
      {
        v11 = objc_alloc(&OBJC_CLASS___CKUserIdentityLookupInfo);
        v12 = (CKRecordID *)objc_claimAutoreleasedReturnValue([v9 email]);
        id v13 = -[CKUserIdentityLookupInfo initWithEmailAddress:](v11, "initWithEmailAddress:", v12);
LABEL_14:
        v19 = (os_log_s *)v13;

        if (!v19) {
          goto LABEL_17;
        }
        -[NSMutableArray addObject:](v4, "addObject:", v19);
        goto LABEL_16;
      }

      v14 = (void *)objc_claimAutoreleasedReturnValue([v9 phoneNumber]);

      if (v14)
      {
        v15 = objc_alloc(&OBJC_CLASS___CKUserIdentityLookupInfo);
        v12 = (CKRecordID *)objc_claimAutoreleasedReturnValue([v9 phoneNumber]);
        id v13 = -[CKUserIdentityLookupInfo initWithPhoneNumber:](v15, "initWithPhoneNumber:", v12);
        goto LABEL_14;
      }

      objc_super v16 = (void *)objc_claimAutoreleasedReturnValue([v9 userIdentifier]);

      if (v16)
      {
        v17 = objc_alloc(&OBJC_CLASS___CKRecordID);
        v18 = (void *)objc_claimAutoreleasedReturnValue([v9 userIdentifier]);
        v12 = -[CKRecordID initWithRecordName:](v17, "initWithRecordName:", v18);

        id v13 = -[CKUserIdentityLookupInfo initWithUserRecordID:]( objc_alloc(&OBJC_CLASS___CKUserIdentityLookupInfo),  "initWithUserRecordID:",  v12);
        goto LABEL_14;
      }

      if (!_CPLSilentLogging)
      {
        id v20 = sub_1000AC060();
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Missing information to query for user identity for %@",  (uint8_t *)&buf,  0xCu);
        }

- (void).cxx_destruct
{
}

@end
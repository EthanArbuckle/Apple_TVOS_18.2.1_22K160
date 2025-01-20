@interface CPLCloudKitUpdateShareTask
- (BOOL)_checkNonNilUserIdentifierEquality:(id)a3 withUserIdentifier:(id)a4;
- (BOOL)_checkParticipant:(id)a3 inEmails:(id)a4 phoneNumbers:(id)a5 userRecordIDs:(id)a6 participantIDs:(id)a7;
- (BOOL)_isCurrentUserOwnerOrAdminOfShare:(id)a3;
- (BOOL)_isValidListOfShareParticipants:(id)a3;
- (CPLCloudKitUpdateShareTask)initWithController:(id)a3 scope:(id)a4 transportScope:(id)a5 completionHandler:(id)a6;
- (id)cloudKitScope;
- (void)_addParticipant:(id)a3 toEmails:(id)a4 phoneNumbers:(id)a5 userRecordIDs:(id)a6 participantIDs:(id)a7;
- (void)_fetchCKShareWithCompletionHandler:(id)a3;
- (void)_modifyParticipantsOfCKShare:(id)a3 newParticipants:(id)a4;
- (void)_updateCKShare:(id)a3 completionHandler:(id)a4;
- (void)_uploadCKShare:(id)a3 completionHandler:(id)a4;
- (void)runOperations;
@end

@implementation CPLCloudKitUpdateShareTask

- (CPLCloudKitUpdateShareTask)initWithController:(id)a3 scope:(id)a4 transportScope:(id)a5 completionHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CPLCloudKitUpdateShareTask;
  v12 = -[CPLCloudKitManageScopeTask initWithController:scope:](&v18, "initWithController:scope:", a3, a4);
  if (v12)
  {
    if (v10)
    {
      uint64_t v13 = objc_claimAutoreleasedReturnValue( +[CPLCloudKitScope scopeFromTransportScope:]( &OBJC_CLASS___CPLCloudKitScope,  "scopeFromTransportScope:",  v10));
      cloudKitScope = v12->_cloudKitScope;
      v12->_cloudKitScope = (CPLCloudKitScope *)v13;
    }

    id v15 = [v11 copy];
    id completionHandler = v12->_completionHandler;
    v12->_id completionHandler = v15;
  }

  return v12;
}

- (id)cloudKitScope
{
  cloudKitScope = self->_cloudKitScope;
  if (cloudKitScope) {
    return cloudKitScope;
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CPLCloudKitUpdateShareTask;
  v4 = -[CPLCloudKitManageScopeTask cloudKitScope](&v5, "cloudKitScope");
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (void)_fetchCKShareWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v18 = 0LL;
  unsigned __int8 v5 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v18);
  id v6 = v18;
  if ((v5 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitManageScopeTask identification](self, "identification"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 shareRecordName]);
    v9 = (void *)v8;
    if (v8)
    {
      uint64_t v19 = v8;
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitUpdateShareTask cloudKitScope](self, "cloudKitScope"));
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_10004EF8C;
      v14[3] = &unk_100240088;
      id v15 = v9;
      v16 = self;
      id v17 = v4;
      -[CPLCloudKitTransportTask fetchRecordWithNames:inScope:completionHandler:]( self,  "fetchRecordWithNames:inScope:completionHandler:",  v10,  v11,  v14);

      v12 = v15;
    }

    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[CPLScopeChange descriptionForScopeType:]( &OBJC_CLASS___CPLScopeChange,  "descriptionForScopeType:",  -[CPLCloudKitManageScopeTask scopeType](self, "scopeType")));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  38LL,  @"%@ is an unsupported scope type for a share",  v12));
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0LL, v13);
    }
  }

  else
  {
    (*((void (**)(id, void, id))v4 + 2))(v4, 0LL, v6);
  }
}

- (void)_uploadCKShare:(id)a3 completionHandler:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10004F1BC;
  v8[3] = &unk_1002400D8;
  id v9 = a3;
  id v10 = a4;
  v8[4] = self;
  id v6 = v9;
  id v7 = v10;
  -[CPLCloudKitTransportTask getUserRecordIDFetchIfNecessaryWithCompletionHandler:]( self,  "getUserRecordIDFetchIfNecessaryWithCompletionHandler:",  v8);
}

- (BOOL)_checkNonNilUserIdentifierEquality:(id)a3 withUserIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  BOOL v8 = v5 && v6 && ([v5 isEqualToString:v6] & 1) != 0;

  return v8;
}

- (void)_addParticipant:(id)a3 toEmails:(id)a4 phoneNumbers:(id)a5 userRecordIDs:(id)a6 participantIDs:(id)a7
{
  id v25 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v25 userIdentity]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 lookupInfo]);

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 emailAddress]);
  if (v17)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 emailAddress]);
    [v11 addObject:v18];
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v16 phoneNumber]);

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue([v16 phoneNumber]);
    [v12 addObject:v20];
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue([v16 userRecordID]);

  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue([v16 userRecordID]);
    [v13 addObject:v22];
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue([v25 participantID]);

  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue([v25 participantID]);
    [v14 addObject:v24];
  }
}

- (BOOL)_checkParticipant:(id)a3 inEmails:(id)a4 phoneNumbers:(id)a5 userRecordIDs:(id)a6 participantIDs:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = (void *)objc_claimAutoreleasedReturnValue([v11 userIdentity]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 lookupInfo]);

  uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 emailAddress]);
  if (v18)
  {
    uint64_t v19 = (void *)v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue([v17 emailAddress]);
    unsigned __int8 v21 = [v12 containsObject:v20];

    if ((v21 & 1) != 0) {
      goto LABEL_7;
    }
  }

  uint64_t v22 = objc_claimAutoreleasedReturnValue([v17 phoneNumber]);
  if (v22)
  {
    v23 = (void *)v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue([v17 phoneNumber]);
    unsigned __int8 v25 = [v13 containsObject:v24];

    if ((v25 & 1) != 0) {
      goto LABEL_7;
    }
  }

  uint64_t v26 = objc_claimAutoreleasedReturnValue([v17 userRecordID]);
  if (v26
    && (v27 = (void *)v26,
        v28 = (void *)objc_claimAutoreleasedReturnValue([v17 userRecordID]),
        unsigned __int8 v29 = [v14 containsObject:v28],
        v28,
        v27,
        (v29 & 1) != 0))
  {
LABEL_7:
    unsigned __int8 v30 = 1;
  }

  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue([v11 participantID]);
    if (v31)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue([v11 participantID]);
      unsigned __int8 v30 = [v15 containsObject:v32];
    }

    else
    {
      unsigned __int8 v30 = 0;
    }
  }

  return v30;
}

- (void)_modifyParticipantsOfCKShare:(id)a3 newParticipants:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    v36 = v6;
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v6 participants]);
    if (!_CPLSilentLogging)
    {
      id v9 = sub_10004BC14();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v59 = v7;
        __int16 v60 = 2112;
        v61 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Comparing new participants %@ with existing participants %@",  buf,  0x16u);
      }
    }

    v42 = -[NSMutableSet initWithCapacity:]( [NSMutableSet alloc],  "initWithCapacity:",  [v8 count]);
    v41 = -[NSMutableSet initWithCapacity:]( [NSMutableSet alloc],  "initWithCapacity:",  [v8 count]);
    v40 = -[NSMutableSet initWithCapacity:]( [NSMutableSet alloc],  "initWithCapacity:",  [v8 count]);
    v39 = -[NSMutableSet initWithCapacity:]( [NSMutableSet alloc],  "initWithCapacity:",  [v8 count]);
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    id v11 = v8;
    id v12 = [v11 countByEnumeratingWithState:&v51 objects:v57 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v52;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v52 != v14) {
            objc_enumerationMutation(v11);
          }
          -[CPLCloudKitUpdateShareTask _addParticipant:toEmails:phoneNumbers:userRecordIDs:participantIDs:]( self,  "_addParticipant:toEmails:phoneNumbers:userRecordIDs:participantIDs:",  *(void *)(*((void *)&v51 + 1) + 8LL * (void)i),  v41,  v42,  v40,  v39);
        }

        id v13 = [v11 countByEnumeratingWithState:&v51 objects:v57 count:16];
      }

      while (v13);
    }

    v34 = v11;

    v16 = -[NSMutableSet initWithCapacity:]( [NSMutableSet alloc],  "initWithCapacity:",  [v7 count]);
    id v17 = -[NSMutableSet initWithCapacity:]( [NSMutableSet alloc],  "initWithCapacity:",  [v7 count]);
    uint64_t v18 = -[NSMutableSet initWithCapacity:]( [NSMutableSet alloc],  "initWithCapacity:",  [v7 count]);
    uint64_t v19 = -[NSMutableSet initWithCapacity:]( [NSMutableSet alloc],  "initWithCapacity:",  [v7 count]);
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    id v35 = v7;
    id obj = v7;
    id v20 = [obj countByEnumeratingWithState:&v47 objects:v56 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v48;
      do
      {
        for (j = 0LL; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v48 != v22) {
            objc_enumerationMutation(obj);
          }
          v24 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)j);
          -[CPLCloudKitUpdateShareTask _addParticipant:toEmails:phoneNumbers:userRecordIDs:participantIDs:]( self,  "_addParticipant:toEmails:phoneNumbers:userRecordIDs:participantIDs:",  v24,  v17,  v16,  v18,  v19,  v34);
          if (!-[CPLCloudKitUpdateShareTask _checkParticipant:inEmails:phoneNumbers:userRecordIDs:participantIDs:]( self,  "_checkParticipant:inEmails:phoneNumbers:userRecordIDs:participantIDs:",  v24,  v41,  v42,  v40,  v39))
          {
            if (!_CPLSilentLogging)
            {
              id v25 = sub_10004BC14();
              uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v59 = v24;
                _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Adding new participant %@",  buf,  0xCu);
              }
            }

            [v36 addParticipant:v24];
          }
        }

        id v21 = [obj countByEnumeratingWithState:&v47 objects:v56 count:16];
      }

      while (v21);
    }

    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    id obja = v34;
    id v27 = [obja countByEnumeratingWithState:&v43 objects:v55 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v44;
      do
      {
        for (k = 0LL; k != v28; k = (char *)k + 1)
        {
          if (*(void *)v44 != v29) {
            objc_enumerationMutation(obja);
          }
          v31 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)k);
          if (!-[CPLCloudKitUpdateShareTask _checkParticipant:inEmails:phoneNumbers:userRecordIDs:participantIDs:]( self,  "_checkParticipant:inEmails:phoneNumbers:userRecordIDs:participantIDs:",  v31,  v17,  v16,  v18,  v19,  v34)
            && !_CPLSilentLogging)
          {
            id v32 = sub_10004BC14();
            v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v59 = v31;
              _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "Trying to remove participant %@ directly is unsupported",  buf,  0xCu);
            }
          }
        }

        id v28 = [obja countByEnumeratingWithState:&v43 objects:v55 count:16];
      }

      while (v28);
    }

    id v6 = v36;
    id v7 = v35;
  }
}

- (BOOL)_isValidListOfShareParticipants:(id)a3
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * (void)i), "role", (void)v8) == (id)1)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

- (BOOL)_isCurrentUserOwnerOrAdminOfShare:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 currentUserParticipant]);
  id v4 = v3;
  if (v3) {
    BOOL v5 = [v3 role] == (id)1 || objc_msgSend(v4, "role") == (id)2;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_updateCKShare:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v21 = 0LL;
  unsigned __int8 v8 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v21);
  id v9 = v21;
  if ((v8 & 1) != 0)
  {
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitManageScopeTask scope](self, "scope"));
    if (-[CPLCloudKitUpdateShareTask _isCurrentUserOwnerOrAdminOfShare:]( self,  "_isCurrentUserOwnerOrAdminOfShare:",  v6))
    {
      [v10 updateCKShare:v6];
      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 share]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 participants]);

      if ([v6 publicPermission] != (id)1 || !objc_msgSend(v12, "count"))
      {
        -[CPLCloudKitUpdateShareTask _uploadCKShare:completionHandler:]( self,  "_uploadCKShare:completionHandler:",  v6,  v7);
        goto LABEL_11;
      }

      if (-[CPLCloudKitUpdateShareTask _isValidListOfShareParticipants:](self, "_isValidListOfShareParticipants:", v12))
      {
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472LL;
        v18[2] = sub_100050420;
        v18[3] = &unk_100240100;
        id v20 = v7;
        v18[4] = self;
        id v19 = v6;
        -[CPLCloudKitManageScopeTask fetchShareParticipantsForParticipants:completionBlock:]( self,  "fetchShareParticipantsForParticipants:completionBlock:",  v12,  v18);

LABEL_11:
        goto LABEL_12;
      }

      id completionHandler = (void (**)(id, void, void *))self->_completionHandler;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitManageScopeTask scope](self, "scope"));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v14 scopeIdentifier]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors invalidScopeErrorWithScopeIdentifier:]( &OBJC_CLASS___CPLErrors,  "invalidScopeErrorWithScopeIdentifier:",  v16));
      completionHandler[2](completionHandler, 0LL, v17);
    }

    else
    {
      uint64_t v13 = objc_opt_class(v10);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 scopeIdentifier]);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  52LL,  @"User is not owner or admin of <%@ %@>",  v13,  v12));
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v14);
    }

    goto LABEL_11;
  }

  (*((void (**)(id, void, id))v7 + 2))(v7, 0LL, v9);
LABEL_12:
}

- (void)runOperations
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000504C0;
  v2[3] = &unk_100240128;
  v2[4] = self;
  -[CPLCloudKitUpdateShareTask _fetchCKShareWithCompletionHandler:](self, "_fetchCKShareWithCompletionHandler:", v2);
}

- (void).cxx_destruct
{
}

@end
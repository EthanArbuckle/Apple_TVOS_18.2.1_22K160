@interface FTPersistentDataSource
- (BOOL)addConversationLinkDescriptors:(id)a3 error:(id *)a4;
- (BOOL)addConversationLinkDescriptors:(id)a3 managedObjectContext:(id)a4 error:(id *)a5;
- (BOOL)addOrUpdateConversationLinkDescriptors:(id)a3 error:(id *)a4;
- (BOOL)addOrUpdateConversationLinkDescriptors:(id)a3 managedObjectContext:(id)a4 error:(id *)a5;
- (BOOL)addOrUpdateKey:(id)a3 forIntegerValue:(int64_t)a4 stringValue:(id)a5 managedObjectContext:(id)a6 error:(id *)a7;
- (BOOL)setInteger:(int64_t)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)setString:(id)a3 forKey:(id)a4 error:(id *)a5;
- (FTPersistentContainer)persistentContainer;
- (FTPersistentDataSource)init;
- (FTPersistentDataSource)initWithStoreType:(int64_t)a3;
- (TUDelegateController)delegateController;
- (id)conversationLinkDescriptorsWithPredicate:(id)a3 limit:(unint64_t)a4 offset:(unint64_t)a5 error:(id *)a6;
- (id)conversationLinkDescriptorsWithPredicate:(id)a3 managedObjectContext:(id)a4 limit:(unint64_t)a5 offset:(unint64_t)a6 error:(id *)a7;
- (id)keyValueForKey:(id)a3 managedObjectContext:(id)a4 error:(id *)a5;
- (id)stringForKey:(id)a3 error:(id *)a4;
- (int64_t)integerForKey:(id)a3 error:(id *)a4;
- (unint64_t)conversationLinkDescriptorCountWithPredicate:(id)a3 error:(id *)a4;
- (unint64_t)conversationLinkDescriptorCountWithPredicate:(id)a3 managedObjectContext:(id)a4 error:(id *)a5;
- (unint64_t)removeConversationLinkDescriptorsWithPredicate:(id)a3 deleteReason:(int64_t)a4 error:(id *)a5;
- (unint64_t)removeConversationLinkDescriptorsWithPredicate:(id)a3 deleteReason:(int64_t)a4 managedObjectContext:(id)a5 error:(id *)a6;
- (unint64_t)removeLinkDescriptorsFromDataSourceWithPredicate:(id)a3 error:(id *)a4;
- (unint64_t)removeLinkDescriptorsFromDataSourceWithPredicate:(id)a3 managedObjectContext:(id)a4 error:(id *)a5;
- (unint64_t)setActivated:(BOOL)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 error:(id *)a6;
- (unint64_t)setActivated:(BOOL)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 managedObjectContext:(id)a6 error:(id *)a7;
- (unint64_t)setExpirationDate:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 error:(id *)a6;
- (unint64_t)setExpirationDate:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 managedObjectContext:(id)a6 error:(id *)a7;
- (unint64_t)setInvitedHandles:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 error:(id *)a6;
- (unint64_t)setInvitedHandles:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 managedObjectContext:(id)a6 error:(id *)a7;
- (unint64_t)setName:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 error:(id *)a6;
- (unint64_t)setName:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 managedObjectContext:(id)a6 error:(id *)a7;
- (void)addConversationLinkDescriptors:(id)a3 completion:(id)a4;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)addOrUpdateConversationLinkDescriptors:(id)a3 completion:(id)a4;
- (void)conversationLinkDescriptorCountWithPredicate:(id)a3 completion:(id)a4;
- (void)conversationLinkDescriptorsWithPredicate:(id)a3 limit:(unint64_t)a4 offset:(unint64_t)a5 completion:(id)a6;
- (void)deleteConversationLink:(id)a3 deleteReason:(int64_t)a4 inContext:(id)a5;
- (void)integerForKey:(id)a3 completion:(id)a4;
- (void)notifyDelegatesConversationLinkDescriptorsDidChange;
- (void)removeConversationLinkDescriptorsWithPredicate:(id)a3 deleteReason:(int64_t)a4 completion:(id)a5;
- (void)removeDelegate:(id)a3;
- (void)removeLinkDescriptorsFromDataSourceWithPredicate:(id)a3 completion:(id)a4;
- (void)removeLinkFromDatabase:(id)a3 inContext:(id)a4;
- (void)setActivated:(BOOL)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 completion:(id)a6;
- (void)setExpirationDate:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 completion:(id)a6;
- (void)setInteger:(int64_t)a3 forKey:(id)a4 completion:(id)a5;
- (void)setInvitedHandles:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 completion:(id)a6;
- (void)setName:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 completion:(id)a6;
- (void)setString:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)stringForKey:(id)a3 completion:(id)a4;
@end

@implementation FTPersistentDataSource

- (BOOL)addConversationLinkDescriptors:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  char v28 = 0;
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  v22 = sub_1000041BC;
  v23 = sub_1000041CC;
  id v24 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FTPersistentDataSource persistentContainer](self, "persistentContainer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 managedObjectContext]);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000041D4;
  v14[3] = &unk_100014440;
  v17 = &v25;
  v14[4] = self;
  id v9 = v6;
  id v15 = v9;
  id v10 = v8;
  id v16 = v10;
  v18 = &v19;
  [v10 performBlockAndWait:v14];
  if (a4)
  {
    v11 = (void *)v20[5];
    if (v11) {
      *a4 = v11;
    }
  }

  char v12 = *((_BYTE *)v26 + 24);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

- (void)addConversationLinkDescriptors:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FTPersistentDataSource persistentContainer](self, "persistentContainer"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 managedObjectContext]);

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100004340;
    v11[3] = &unk_100014468;
    v11[4] = self;
    id v12 = v6;
    id v13 = v9;
    id v14 = v7;
    id v10 = v9;
    [v10 performBlock:v11];
  }

  else if (v7)
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }
}

- (BOOL)addOrUpdateConversationLinkDescriptors:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = 0LL;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  char v29 = 0;
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  v23 = sub_1000041BC;
  id v24 = sub_1000041CC;
  id v25 = 0LL;
  uint64_t v7 = FTCServiceLog();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "addOrUpdateConversationLinkDescriptors: %@",  buf,  0xCu);
  }

  if ([v6 count])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[FTPersistentDataSource persistentContainer](self, "persistentContainer"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 managedObjectContext]);

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000045CC;
    v15[3] = &unk_100014440;
    v18 = &v26;
    v15[4] = self;
    id v16 = v6;
    id v11 = v10;
    id v17 = v11;
    uint64_t v19 = &v20;
    [v11 performBlockAndWait:v15];
    if (a4)
    {
      id v12 = (void *)v21[5];
      if (v12) {
        *a4 = v12;
      }
    }
  }

  BOOL v13 = *((_BYTE *)v27 + 24) != 0;
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v13;
}

- (void)addOrUpdateConversationLinkDescriptors:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FTPersistentDataSource persistentContainer](self, "persistentContainer"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 managedObjectContext]);

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100004738;
    v11[3] = &unk_100014468;
    v11[4] = self;
    id v12 = v6;
    id v13 = v9;
    id v14 = v7;
    id v10 = v9;
    [v10 performBlock:v11];
  }

  else if (v7)
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }
}

- (unint64_t)conversationLinkDescriptorCountWithPredicate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  uint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = sub_1000041BC;
  v23 = sub_1000041CC;
  id v24 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[FTPersistentDataSource persistentContainer](self, "persistentContainer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 managedObjectContext]);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10000492C;
  v14[3] = &unk_100014440;
  id v17 = &v25;
  v14[4] = self;
  id v9 = v6;
  id v15 = v9;
  id v10 = v8;
  id v16 = v10;
  v18 = &v19;
  [v10 performBlockAndWait:v14];
  if (a4)
  {
    id v11 = (void *)v20[5];
    if (v11) {
      *a4 = v11;
    }
  }

  unint64_t v12 = v26[3];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

- (void)conversationLinkDescriptorCountWithPredicate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FTPersistentDataSource persistentContainer](self, "persistentContainer"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 managedObjectContext]);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100004A78;
  v13[3] = &unk_100014468;
  v13[4] = self;
  id v14 = v6;
  id v15 = v9;
  id v16 = v7;
  id v10 = v7;
  id v11 = v9;
  id v12 = v6;
  [v11 performBlock:v13];
}

- (id)conversationLinkDescriptorsWithPredicate:(id)a3 limit:(unint64_t)a4 offset:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v33 = 0LL;
  v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  v36 = sub_1000041BC;
  v37 = sub_1000041CC;
  id v38 = 0LL;
  uint64_t v27 = 0LL;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  v30 = sub_1000041BC;
  id v31 = sub_1000041CC;
  id v32 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[FTPersistentDataSource persistentContainer](self, "persistentContainer"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 managedObjectContext]);

  uint64_t v13 = FTCServiceLog();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v40 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "conversationLinkDescriptorsWithPredicate: %@",  buf,  0xCu);
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100004D10;
  v20[3] = &unk_100014490;
  v23 = &v33;
  v20[4] = self;
  id v15 = v10;
  id v21 = v15;
  id v16 = v12;
  unint64_t v25 = a4;
  unint64_t v26 = a5;
  id v22 = v16;
  id v24 = &v27;
  [v16 performBlockAndWait:v20];
  if (a6)
  {
    id v17 = (void *)v28[5];
    if (v17) {
      *a6 = v17;
    }
  }

  id v18 = (id)v34[5];

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v18;
}

- (void)conversationLinkDescriptorsWithPredicate:(id)a3 limit:(unint64_t)a4 offset:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[FTPersistentDataSource persistentContainer](self, "persistentContainer"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 managedObjectContext]);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100004E80;
  v17[3] = &unk_1000144B8;
  v17[4] = self;
  id v18 = v10;
  unint64_t v21 = a4;
  unint64_t v22 = a5;
  id v19 = v13;
  id v20 = v11;
  id v14 = v11;
  id v15 = v13;
  id v16 = v10;
  [v15 performBlock:v17];
}

- (unint64_t)removeConversationLinkDescriptorsWithPredicate:(id)a3 deleteReason:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v28 = 0LL;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000LL;
  uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  unint64_t v25 = sub_1000041BC;
  unint64_t v26 = sub_1000041CC;
  id v27 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[FTPersistentDataSource persistentContainer](self, "persistentContainer"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 managedObjectContext]);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100005088;
  v16[3] = &unk_1000144E0;
  id v19 = &v28;
  v16[4] = self;
  id v11 = v8;
  id v17 = v11;
  int64_t v21 = a4;
  id v12 = v10;
  id v18 = v12;
  id v20 = &v22;
  [v12 performBlockAndWait:v16];
  if (a5)
  {
    uint64_t v13 = (void *)v23[5];
    if (v13) {
      *a5 = v13;
    }
  }

  unint64_t v14 = v29[3];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v14;
}

- (void)removeConversationLinkDescriptorsWithPredicate:(id)a3 deleteReason:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[FTPersistentDataSource persistentContainer](self, "persistentContainer"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 managedObjectContext]);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000051DC;
  v15[3] = &unk_100014508;
  v15[4] = self;
  id v16 = v8;
  id v18 = v9;
  int64_t v19 = a4;
  id v17 = v11;
  id v12 = v9;
  id v13 = v11;
  id v14 = v8;
  [v13 performBlock:v15];
}

- (unint64_t)removeLinkDescriptorsFromDataSourceWithPredicate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v25 = 0LL;
  unint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  uint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = sub_1000041BC;
  v23 = sub_1000041CC;
  id v24 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[FTPersistentDataSource persistentContainer](self, "persistentContainer"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 managedObjectContext]);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000053D4;
  v14[3] = &unk_100014440;
  id v17 = &v25;
  v14[4] = self;
  id v9 = v6;
  id v15 = v9;
  id v10 = v8;
  id v16 = v10;
  id v18 = &v19;
  [v10 performBlockAndWait:v14];
  if (a4)
  {
    id v11 = (void *)v20[5];
    if (v11) {
      *a4 = v11;
    }
  }

  unint64_t v12 = v26[3];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

- (void)removeLinkDescriptorsFromDataSourceWithPredicate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[FTPersistentDataSource persistentContainer](self, "persistentContainer"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 managedObjectContext]);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100005520;
  v13[3] = &unk_100014468;
  v13[4] = self;
  id v14 = v6;
  id v15 = v9;
  id v16 = v7;
  id v10 = v7;
  id v11 = v9;
  id v12 = v6;
  [v11 performBlock:v13];
}

- (unint64_t)setActivated:(BOOL)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 error:(id *)a6
{
  id v10 = a5;
  uint64_t v31 = 0LL;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000LL;
  uint64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v25 = 0LL;
  unint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  uint64_t v28 = sub_1000041BC;
  uint64_t v29 = sub_1000041CC;
  id v30 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[FTPersistentDataSource persistentContainer](self, "persistentContainer"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 managedObjectContext]);

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10000572C;
  v18[3] = &unk_100014530;
  uint64_t v21 = &v31;
  v18[4] = self;
  BOOL v24 = a3;
  int64_t v23 = a4;
  id v13 = v10;
  id v19 = v13;
  id v14 = v12;
  id v20 = v14;
  uint64_t v22 = &v25;
  [v14 performBlockAndWait:v18];
  if (a6)
  {
    id v15 = (void *)v26[5];
    if (v15) {
      *a6 = v15;
    }
  }

  unint64_t v16 = v32[3];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v16;
}

- (void)setActivated:(BOOL)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[FTPersistentDataSource persistentContainer](self, "persistentContainer"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 managedObjectContext]);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100005894;
  v17[3] = &unk_100014558;
  BOOL v22 = a3;
  id v20 = v11;
  int64_t v21 = a4;
  v17[4] = self;
  id v18 = v10;
  id v19 = v13;
  id v14 = v11;
  id v15 = v13;
  id v16 = v10;
  [v15 performBlock:v17];
}

- (unint64_t)setExpirationDate:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v33 = 0LL;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000LL;
  uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v27 = 0LL;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  id v30 = sub_1000041BC;
  uint64_t v31 = sub_1000041CC;
  id v32 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[FTPersistentDataSource persistentContainer](self, "persistentContainer"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 managedObjectContext]);

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100005AC4;
  v20[3] = &unk_100014580;
  BOOL v24 = &v33;
  v20[4] = self;
  id v14 = v10;
  id v21 = v14;
  int64_t v26 = a4;
  id v15 = v11;
  id v22 = v15;
  id v16 = v13;
  id v23 = v16;
  uint64_t v25 = &v27;
  [v16 performBlockAndWait:v20];
  if (a6)
  {
    id v17 = (void *)v28[5];
    if (v17) {
      *a6 = v17;
    }
  }

  unint64_t v18 = v34[3];

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v18;
}

- (void)setExpirationDate:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[FTPersistentDataSource persistentContainer](self, "persistentContainer"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 managedObjectContext]);

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100005C44;
  v19[3] = &unk_1000145A8;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v14;
  id v23 = v12;
  int64_t v24 = a4;
  id v15 = v12;
  id v16 = v14;
  id v17 = v11;
  id v18 = v10;
  [v16 performBlock:v19];
}

- (unint64_t)setInvitedHandles:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v33 = 0LL;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000LL;
  uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v27 = 0LL;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  id v30 = sub_1000041BC;
  uint64_t v31 = sub_1000041CC;
  id v32 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[FTPersistentDataSource persistentContainer](self, "persistentContainer"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 managedObjectContext]);

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100005E74;
  v20[3] = &unk_100014580;
  int64_t v24 = &v33;
  v20[4] = self;
  id v14 = v10;
  id v21 = v14;
  int64_t v26 = a4;
  id v15 = v11;
  id v22 = v15;
  id v16 = v13;
  id v23 = v16;
  uint64_t v25 = &v27;
  [v16 performBlockAndWait:v20];
  if (a6)
  {
    id v17 = (void *)v28[5];
    if (v17) {
      *a6 = v17;
    }
  }

  unint64_t v18 = v34[3];

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v18;
}

- (void)setInvitedHandles:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[FTPersistentDataSource persistentContainer](self, "persistentContainer"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 managedObjectContext]);

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100005FF4;
  v19[3] = &unk_1000145A8;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v14;
  id v23 = v12;
  int64_t v24 = a4;
  id v15 = v12;
  id v16 = v14;
  id v17 = v11;
  id v18 = v10;
  [v16 performBlock:v19];
}

- (unint64_t)setName:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v33 = 0LL;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000LL;
  uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v27 = 0LL;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  id v30 = sub_1000041BC;
  uint64_t v31 = sub_1000041CC;
  id v32 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[FTPersistentDataSource persistentContainer](self, "persistentContainer"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 managedObjectContext]);

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100006224;
  v20[3] = &unk_100014580;
  int64_t v24 = &v33;
  v20[4] = self;
  id v14 = v10;
  id v21 = v14;
  int64_t v26 = a4;
  id v15 = v11;
  id v22 = v15;
  id v16 = v13;
  id v23 = v16;
  uint64_t v25 = &v27;
  [v16 performBlockAndWait:v20];
  if (a6)
  {
    id v17 = (void *)v28[5];
    if (v17) {
      *a6 = v17;
    }
  }

  unint64_t v18 = v34[3];

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v18;
}

- (void)setName:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[FTPersistentDataSource persistentContainer](self, "persistentContainer"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 managedObjectContext]);

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000063A4;
  v19[3] = &unk_1000145A8;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v14;
  id v23 = v12;
  int64_t v24 = a4;
  id v15 = v12;
  id v16 = v14;
  id v17 = v11;
  id v18 = v10;
  [v16 performBlock:v19];
}

- (BOOL)addConversationLinkDescriptors:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (![v8 count]) {
    goto LABEL_15;
  }
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = (void *)objc_claimAutoreleasedReturnValue( +[FTManagedConversationLink managedConversationLinkForTUConversationLinkDescriptor:inManagedObjectContext:]( &OBJC_CLASS___FTManagedConversationLink,  "managedConversationLinkForTUConversationLinkDescriptor:inManagedObjectContext:",  *(void *)(*((void *)&v18 + 1) + 8LL * (void)i),  v9,  (void)v18));
        if (v15) {
          [v9 insertObject:v15];
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v12);
  }

  if (![v9 save:a5])
  {
    [v9 rollback];
LABEL_15:
    BOOL v16 = 0;
    goto LABEL_16;
  }

  -[FTPersistentDataSource notifyDelegatesConversationLinkDescriptorsDidChange]( self,  "notifyDelegatesConversationLinkDescriptorsDidChange");
  BOOL v16 = 1;
LABEL_16:

  return v16;
}

- (BOOL)addOrUpdateConversationLinkDescriptors:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (![v8 count])
  {
LABEL_31:
    BOOL v29 = 0;
    goto LABEL_32;
  }

  uint64_t v33 = self;
  id v34 = v8;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id obj = v8;
  id v37 = [obj countByEnumeratingWithState:&v42 objects:v51 count:16];
  if (v37)
  {
    uint64_t v10 = *(void *)v43;
    id v11 = &FTConversationService__prots;
    id v35 = v9;
    do
    {
      for (i = 0LL; i != v37; i = (char *)i + 1)
      {
        if (*(void *)v43 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([&v11[502] fetchRequest]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 pseudonym]);
        BOOL v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate tu_predicateForConversationLinkDescriptorsWithPseudonym:]( &OBJC_CLASS___NSPredicate,  "tu_predicateForConversationLinkDescriptorsWithPseudonym:",  v15));
        [v14 setPredicate:v16];

        id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 executeFetchRequest:v14 error:a5]);
        if ([v17 count])
        {
          uint64_t v18 = FTCServiceLog();
          __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v48 = v17;
            __int16 v49 = 2112;
            id v50 = v13;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "update managedObjects: %@ with link: %@",  buf,  0x16u);
          }

          __int128 v40 = 0u;
          __int128 v41 = 0u;
          __int128 v38 = 0u;
          __int128 v39 = 0u;
          id v20 = v17;
          id v21 = [v20 countByEnumeratingWithState:&v38 objects:v46 count:16];
          if (v21)
          {
            id v22 = v21;
            uint64_t v23 = v10;
            int64_t v24 = a5;
            uint64_t v25 = *(void *)v39;
            do
            {
              for (j = 0LL; j != v22; j = (char *)j + 1)
              {
                if (*(void *)v39 != v25) {
                  objc_enumerationMutation(v20);
                }
                [*(id *)(*((void *)&v38 + 1) + 8 * (void)j) updateWithDescriptor:v13];
              }

              id v22 = [v20 countByEnumeratingWithState:&v38 objects:v46 count:16];
            }

            while (v22);
            a5 = v24;
            uint64_t v10 = v23;
            id v9 = v35;
            id v11 = &FTConversationService__prots;
          }
        }

        else
        {
          id v20 = (id)objc_claimAutoreleasedReturnValue( [&v11[502] managedConversationLinkForTUConversationLinkDescriptor:v13 inManagedObjectContext:v9]);
          uint64_t v27 = FTCServiceLog();
          uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v48 = v20;
            __int16 v49 = 2112;
            id v50 = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "add managedConversationLink: %@ to managedObjectContext: %@",  buf,  0x16u);
          }

          if (v20) {
            [v9 insertObject:v20];
          }
        }
      }

      id v37 = [obj countByEnumeratingWithState:&v42 objects:v51 count:16];
    }

    while (v37);
  }

  if (![v9 hasChanges])
  {
    BOOL v29 = 0;
    id v8 = v34;
    goto LABEL_32;
  }

  id v8 = v34;
  if (![v9 save:a5])
  {
    [v9 rollback];
    uint64_t v30 = FTCServiceLog();
    uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_10000CEB0((uint64_t)obj, v31);
    }

    goto LABEL_31;
  }

  -[FTPersistentDataSource notifyDelegatesConversationLinkDescriptorsDidChange]( v33,  "notifyDelegatesConversationLinkDescriptorsDidChange");
  BOOL v29 = 1;
LABEL_32:

  return v29;
}

- (unint64_t)conversationLinkDescriptorCountWithPredicate:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[FTManagedConversationLink fetchRequest](&OBJC_CLASS___FTManagedConversationLink, "fetchRequest"));
  [v9 setPredicate:v8];

  id v10 = [v7 countForFetchRequest:v9 error:a5];
  return (unint64_t)v10;
}

- (id)conversationLinkDescriptorsWithPredicate:(id)a3 managedObjectContext:(id)a4 limit:(unint64_t)a5 offset:(unint64_t)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[FTManagedConversationLink fetchRequest](&OBJC_CLASS___FTManagedConversationLink, "fetchRequest"));
  [v13 setFetchLimit:a5];
  [v13 setFetchOffset:a6];
  [v13 setPredicate:v11];
  [v13 setRelationshipKeyPathsForPrefetching:&off_100014DF0];
  [v13 setRelationshipKeyPathsForPrefetching:&off_100014E08];
  [v13 setReturnsObjectsAsFaults:0];
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 executeFetchRequest:v13 error:a7]);
  id v15 = v14;
  if (v14)
  {
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v14 count]));
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id v17 = v15;
    id v18 = [v17 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v28;
      do
      {
        for (i = 0LL; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v27 + 1) + 8 * (void)i),  "tuConversationLinkDescriptor",  (void)v27));
          [v16 addObject:v22];
        }

        id v19 = [v17 countByEnumeratingWithState:&v27 objects:v33 count:16];
      }

      while (v19);
    }

    id v23 = [v16 copy];
    uint64_t v24 = FTCServiceLog();
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "get conversationLinkDescriptors: %@",  buf,  0xCu);
    }
  }

  else
  {
    id v23 = 0LL;
  }

  return v23;
}

- (unint64_t)removeConversationLinkDescriptorsWithPredicate:(id)a3 deleteReason:(int64_t)a4 managedObjectContext:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[FTManagedConversationLink fetchRequest](&OBJC_CLASS___FTManagedConversationLink, "fetchRequest"));
  [v12 setPredicate:v10];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 executeFetchRequest:v12 error:a6]);
  id v14 = v13;
  if (!v13) {
    goto LABEL_15;
  }
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v15 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v35;
    do
    {
      id v18 = 0LL;
      do
      {
        if (*(void *)v35 != v17) {
          objc_enumerationMutation(v14);
        }
        -[FTPersistentDataSource deleteConversationLink:deleteReason:inContext:]( self,  "deleteConversationLink:deleteReason:inContext:",  *(void *)(*((void *)&v34 + 1) + 8LL * (void)v18),  a4,  v11);
        id v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }

    while (v16);
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v11 updatedObjects]);
  id v20 = [v19 count];
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v11 deletedObjects]);
  id v22 = [v21 count];

  if (![v11 save:a6])
  {
    [v11 rollback];
    uint64_t v24 = FTCServiceLog();
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_10000CF24(v25, v26, v27, v28, v29, v30, v31, v32);
    }

LABEL_15:
    unint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_16;
  }

  unint64_t v23 = (unint64_t)v20 + (void)v22;
  -[FTPersistentDataSource notifyDelegatesConversationLinkDescriptorsDidChange]( self,  "notifyDelegatesConversationLinkDescriptorsDidChange");
LABEL_16:

  return v23;
}

- (unint64_t)removeLinkDescriptorsFromDataSourceWithPredicate:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[FTManagedConversationLink fetchRequest](&OBJC_CLASS___FTManagedConversationLink, "fetchRequest"));
  [v10 setPredicate:v8];
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 executeFetchRequest:v10 error:a5]);
  id v12 = v11;
  if (!v11) {
    goto LABEL_15;
  }
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v13 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v33;
    do
    {
      id v16 = 0LL;
      do
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(v12);
        }
        -[FTPersistentDataSource removeLinkFromDatabase:inContext:]( self,  "removeLinkFromDatabase:inContext:",  *(void *)(*((void *)&v32 + 1) + 8LL * (void)v16),  v9);
        id v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }

    while (v14);
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v9 updatedObjects]);
  id v18 = [v17 count];
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v9 deletedObjects]);
  id v20 = [v19 count];

  if (![v9 save:a5])
  {
    [v9 rollback];
    uint64_t v22 = FTCServiceLog();
    unint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_10000CF58(v23, v24, v25, v26, v27, v28, v29, v30);
    }

LABEL_15:
    unint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_16;
  }

  unint64_t v21 = (unint64_t)v18 + (void)v20;
  -[FTPersistentDataSource notifyDelegatesConversationLinkDescriptorsDidChange]( self,  "notifyDelegatesConversationLinkDescriptorsDidChange");
LABEL_16:

  return v21;
}

- (void)deleteConversationLink:(id)a3 deleteReason:(int64_t)a4 inContext:(id)a5
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 deletionDate]);

  if (v7)
  {
    uint64_t v8 = FTCServiceLog();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = (void *)(int)[v6 deleteReason];
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 deletionDate]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 pseudonym]);
      int v18 = 134218754;
      int64_t v19 = a4;
      __int16 v20 = 2048;
      unint64_t v21 = v10;
      __int16 v22 = 2112;
      unint64_t v23 = v11;
      __int16 v24 = 2112;
      uint64_t v25 = v12;
      id v13 = "deleteConversationLink: current reason: %ld, link is already deleted with reason: %ld, deletionDate: %@ for %@";
      id v14 = v9;
      uint32_t v15 = 42;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v18, v15);
    }
  }

  else
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v6 setDeletionDate:v16];

    [v6 setDeleteReason:(__int16)a4];
    uint64_t v17 = FTCServiceLog();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 deletionDate]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 pseudonym]);
      int v18 = 134218498;
      int64_t v19 = a4;
      __int16 v20 = 2112;
      unint64_t v21 = v11;
      __int16 v22 = 2112;
      unint64_t v23 = v12;
      id v13 = "deleteConversationLink: reason: %ld, deletionDate: %@ for %@";
      id v14 = v9;
      uint32_t v15 = 32;
      goto LABEL_6;
    }
  }
}

- (void)removeLinkFromDatabase:(id)a3 inContext:(id)a4
{
  id v5 = a3;
  [a4 deleteObject:v5];
  uint64_t v6 = FTCServiceLog();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "removeLinkFromDatabase: remove link: %@",  (uint8_t *)&v8,  0xCu);
  }
}

- (unint64_t)setActivated:(BOOL)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 managedObjectContext:(id)a6 error:(id *)a7
{
  BOOL v10 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[FTManagedConversationLink fetchRequest](&OBJC_CLASS___FTManagedConversationLink, "fetchRequest"));
  [v14 setPredicate:v12];
  uint32_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 executeFetchRequest:v14 error:a7]);
  id v16 = v15;
  if (!v15) {
    goto LABEL_15;
  }
  uint64_t v25 = self;
  uint64_t v26 = a7;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v17 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v28;
    do
    {
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v16);
        }
        unint64_t v21 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
        [v21 setActivated:v10];
        if (a4 >= 1) {
          [v21 setOriginatorRevision:a4];
        }
      }

      id v18 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }

    while (v18);
  }

  __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v13 updatedObjects]);
  unint64_t v23 = (unint64_t)[v22 count];

  if (![v13 save:v26])
  {
    [v13 rollback];
LABEL_15:
    unint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_16;
  }

  -[FTPersistentDataSource notifyDelegatesConversationLinkDescriptorsDidChange]( v25,  "notifyDelegatesConversationLinkDescriptorsDidChange");
LABEL_16:

  return v23;
}

- (unint64_t)setExpirationDate:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 managedObjectContext:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  uint32_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[FTManagedConversationLink fetchRequest](&OBJC_CLASS___FTManagedConversationLink, "fetchRequest"));
  [v15 setPredicate:v13];
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 executeFetchRequest:v15 error:a7]);
  id v17 = v16;
  if (!v16) {
    goto LABEL_15;
  }
  uint64_t v26 = self;
  __int128 v27 = a7;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v18 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v17);
        }
        __int16 v22 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        [v22 setExpirationDate:v12];
        if (a4 >= 1) {
          [v22 setOriginatorRevision:a4];
        }
      }

      id v19 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }

    while (v19);
  }

  unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v14 updatedObjects]);
  unint64_t v24 = (unint64_t)[v23 count];

  if (![v14 save:v27])
  {
    [v14 rollback];
LABEL_15:
    unint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_16;
  }

  -[FTPersistentDataSource notifyDelegatesConversationLinkDescriptorsDidChange]( v26,  "notifyDelegatesConversationLinkDescriptorsDidChange");
LABEL_16:

  return v24;
}

- (unint64_t)setInvitedHandles:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 managedObjectContext:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  uint32_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[FTManagedConversationLink fetchRequest](&OBJC_CLASS___FTManagedConversationLink, "fetchRequest"));
  [v15 setPredicate:v13];
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 executeFetchRequest:v15 error:a7]);
  if (v16)
  {
    __int128 v27 = self;
    __int128 v28 = a7;
    id v29 = v13;
    id v30 = v12;
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[FTManagedHandle managedHandlesForTUHandles:inManagedObjectContext:]( &OBJC_CLASS___FTManagedHandle,  "managedHandlesForTUHandles:inManagedObjectContext:",  v12,  v14));
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v18 = v16;
    id v19 = [v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v32;
      do
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v32 != v21) {
            objc_enumerationMutation(v18);
          }
          unint64_t v23 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
          [v23 setInvitedHandles:v17];
          if (a4 >= 1) {
            [v23 setOriginatorRevision:a4];
          }
        }

        id v20 = [v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }

      while (v20);
    }

    if ([v14 hasChanges])
    {
      unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v14 updatedObjects]);
      unint64_t v25 = (unint64_t)[v24 count];

      id v12 = v30;
      if ([v14 save:v28])
      {
        -[FTPersistentDataSource notifyDelegatesConversationLinkDescriptorsDidChange]( v27,  "notifyDelegatesConversationLinkDescriptorsDidChange");
      }

      else
      {
        [v14 rollback];
        unint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }

    else
    {
      unint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
      id v12 = v30;
    }

    id v13 = v29;
  }

  else
  {
    unint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v25;
}

- (unint64_t)setName:(id)a3 withRevision:(int64_t)a4 forConversationLinkDescriptorsWithPredicate:(id)a5 managedObjectContext:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  uint32_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[FTManagedConversationLink fetchRequest](&OBJC_CLASS___FTManagedConversationLink, "fetchRequest"));
  [v15 setPredicate:v13];
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 executeFetchRequest:v15 error:a7]);
  id v17 = v16;
  if (!v16) {
    goto LABEL_15;
  }
  uint64_t v26 = self;
  __int128 v27 = a7;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v18 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v17);
        }
        __int16 v22 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        [v22 setName:v12];
        if (a4 >= 1) {
          [v22 setOriginatorRevision:a4];
        }
      }

      id v19 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }

    while (v19);
  }

  unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v14 updatedObjects]);
  unint64_t v24 = (unint64_t)[v23 count];

  if (![v14 save:v27])
  {
    [v14 rollback];
LABEL_15:
    unint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_16;
  }

  -[FTPersistentDataSource notifyDelegatesConversationLinkDescriptorsDidChange]( v26,  "notifyDelegatesConversationLinkDescriptorsDidChange");
LABEL_16:

  return v24;
}

- (void)notifyDelegatesConversationLinkDescriptorsDidChange
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FTPersistentDataSource delegateController](self, "delegateController"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100007AA0;
  v4[3] = &unk_1000145F8;
  v4[4] = self;
  [v3 enumerateDelegatesUsingBlock:v4];
}

- (FTPersistentDataSource)init
{
  return -[FTPersistentDataSource initWithStoreType:](self, "initWithStoreType:", 0LL);
}

- (FTPersistentDataSource)initWithStoreType:(int64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___FTPersistentDataSource;
  v4 = -[FTPersistentDataSource init](&v12, "init");
  if (v4)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___TUDelegateController);
    delegateController = v4->_delegateController;
    v4->_delegateController = v5;

    id v7 = -[FTPersistentContainer initWithStoreType:]( objc_alloc(&OBJC_CLASS___FTPersistentContainer),  "initWithStoreType:",  a3);
    persistentContainer = v4->_persistentContainer;
    v4->_persistentContainer = v7;

    uint64_t v9 = FTCServiceLog();
    BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_10000CF8C(v10);
    }

    -[FTPersistentContainer loadPersistentStoresWithCompletionHandler:]( v4->_persistentContainer,  "loadPersistentStoresWithCompletionHandler:",  &stru_100014650);
  }

  return v4;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[FTPersistentDataSource delegateController](self, "delegateController"));
  [v8 addDelegate:v7 queue:v6];
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[FTPersistentDataSource delegateController](self, "delegateController"));
  [v5 removeDelegate:v4];
}

- (FTPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (TUDelegateController)delegateController
{
  return self->_delegateController;
}

- (void).cxx_destruct
{
}

- (BOOL)setInteger:(int64_t)a3 forKey:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v27 = 0LL;
  __int128 v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  char v30 = 0;
  uint64_t v21 = 0LL;
  __int16 v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  unint64_t v24 = sub_10000841C;
  unint64_t v25 = sub_10000842C;
  id v26 = 0LL;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[FTPersistentDataSource persistentContainer](self, "persistentContainer"));
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v9 managedObjectContext]);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100008434;
  v15[3] = &unk_1000144E0;
  id v18 = &v27;
  v15[4] = self;
  id v11 = v8;
  id v16 = v11;
  int64_t v20 = a3;
  id v12 = v10;
  id v17 = v12;
  id v19 = &v21;
  [v12 performBlockAndWait:v15];
  if (a5) {
    *a5 = (id) v22[5];
  }
  char v13 = *((_BYTE *)v28 + 24);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[FTPersistentDataSource persistentContainer](self, "persistentContainer"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 managedObjectContext]);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000858C;
  v15[3] = &unk_100014508;
  v15[4] = self;
  id v16 = v8;
  id v18 = v9;
  int64_t v19 = a3;
  id v17 = v11;
  id v12 = v9;
  id v13 = v11;
  id v14 = v8;
  [v13 performBlock:v15];
}

- (void)integerForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[FTPersistentDataSource persistentContainer](self, "persistentContainer"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 managedObjectContext]);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000086E4;
  v13[3] = &unk_100014468;
  v13[4] = self;
  id v14 = v6;
  id v15 = v9;
  id v16 = v7;
  id v10 = v7;
  id v11 = v9;
  id v12 = v6;
  [v11 performBlock:v13];
}

- (int64_t)integerForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0LL;
  unint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  uint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v18 = 0LL;
  int64_t v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  uint64_t v21 = sub_10000841C;
  __int16 v22 = sub_10000842C;
  id v23 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[FTPersistentDataSource persistentContainer](self, "persistentContainer"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 managedObjectContext]);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000088F0;
  v13[3] = &unk_1000146A0;
  v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  id v10 = v8;
  id v15 = v10;
  id v16 = &v18;
  id v17 = &v24;
  [v10 performBlockAndWait:v13];
  if (a4) {
    *a4 = (id) v19[5];
  }
  int64_t v11 = v25[3];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

- (BOOL)setString:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v29 = 0LL;
  char v30 = &v29;
  uint64_t v31 = 0x2020000000LL;
  char v32 = 0;
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  uint64_t v26 = sub_10000841C;
  uint64_t v27 = sub_10000842C;
  id v28 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[FTPersistentDataSource persistentContainer](self, "persistentContainer"));
  int64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 managedObjectContext]);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100008B10;
  v17[3] = &unk_1000146C8;
  uint64_t v21 = &v29;
  v17[4] = self;
  id v12 = v9;
  id v18 = v12;
  id v13 = v8;
  id v19 = v13;
  id v14 = v11;
  id v20 = v14;
  __int16 v22 = &v23;
  [v14 performBlockAndWait:v17];
  if (a5) {
    *a5 = (id) v24[5];
  }
  char v15 = *((_BYTE *)v30 + 24);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v15;
}

- (void)setString:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[FTPersistentDataSource persistentContainer](self, "persistentContainer"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 managedObjectContext]);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100008C88;
  v17[3] = &unk_1000146F0;
  v17[4] = self;
  id v18 = v9;
  id v19 = v8;
  id v20 = v12;
  id v21 = v10;
  id v13 = v10;
  id v14 = v12;
  id v15 = v8;
  id v16 = v9;
  [v14 performBlock:v17];
}

- (void)stringForKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[FTPersistentDataSource persistentContainer](self, "persistentContainer"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 managedObjectContext]);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100008DE0;
  v13[3] = &unk_100014468;
  v13[4] = self;
  id v14 = v6;
  id v15 = v9;
  id v16 = v7;
  id v10 = v7;
  id v11 = v9;
  id v12 = v6;
  [v11 performBlock:v13];
}

- (id)stringForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0LL;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  uint64_t v27 = sub_10000841C;
  id v28 = sub_10000842C;
  id v29 = 0LL;
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  id v21 = sub_10000841C;
  __int16 v22 = sub_10000842C;
  id v23 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[FTPersistentDataSource persistentContainer](self, "persistentContainer"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 managedObjectContext]);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100009010;
  v13[3] = &unk_1000146A0;
  v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  id v10 = v8;
  id v15 = v10;
  id v16 = &v18;
  id v17 = &v24;
  [v10 performBlockAndWait:v13];
  if (a4) {
    *a4 = (id) v19[5];
  }
  id v11 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

- (id)keyValueForKey:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[FTManagedKeyValue fetchRequest](&OBJC_CLASS___FTManagedKeyValue, "fetchRequest"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"key == %@",  v8));

  [v9 setPredicate:v10];
  [v9 setReturnsObjectsAsFaults:0];
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 executeFetchRequest:v9 error:a5]);

  if (v11) {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);
  }
  else {
    id v12 = 0LL;
  }

  return v12;
}

- (BOOL)addOrUpdateKey:(id)a3 forIntegerValue:(int64_t)a4 stringValue:(id)a5 managedObjectContext:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[FTManagedKeyValue fetchRequest](&OBJC_CLASS___FTManagedKeyValue, "fetchRequest"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"key == %@",  v11));
  [v14 setPredicate:v15];

  [v14 setReturnsObjectsAsFaults:0];
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 executeFetchRequest:v14 error:a7]);
  if ([v16 count])
  {
    id v17 = (FTManagedKeyValue *)objc_claimAutoreleasedReturnValue([v16 firstObject]);
    if (!v17) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v13 persistentStoreCoordinator]);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 managedObjectModel]);

  if (v20)
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 entitiesByName]);
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"KeyValue"]);

    if (v22)
    {
      id v23 = -[FTManagedKeyValue initWithEntity:insertIntoManagedObjectContext:]( objc_alloc(&OBJC_CLASS___FTManagedKeyValue),  "initWithEntity:insertIntoManagedObjectContext:",  v22,  v13);
    }

    else
    {
      uint64_t v25 = FTCServiceLog();
      uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v28 = @"KeyValue";
        __int16 v29 = 2112;
        id v30 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Could not find entity description with name %@ in managed object context %@. Falling back to convenience initializer.",  buf,  0x16u);
      }

      id v23 = -[FTManagedKeyValue initWithContext:](objc_alloc(&OBJC_CLASS___FTManagedKeyValue), "initWithContext:", v13);
    }

    id v17 = v23;
    if (v23) {
      [v13 insertObject:v23];
    }
  }

  else
  {
    id v17 = 0LL;
  }

  if (v17)
  {
LABEL_3:
    -[FTManagedKeyValue setKey:](v17, "setKey:", v11);
    -[FTManagedKeyValue setStringValue:](v17, "setStringValue:", v12);
    -[FTManagedKeyValue setIntegerValue:](v17, "setIntegerValue:", a4);
  }

@end
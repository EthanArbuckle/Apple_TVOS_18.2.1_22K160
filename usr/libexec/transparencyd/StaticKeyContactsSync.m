@interface StaticKeyContactsSync
- (BOOL)started;
- (KTSignalTermHandler)sigTerm;
- (OS_dispatch_queue)queue;
- (OS_os_transaction)transaction;
- (StaticKeyContactsStorage)storage;
- (StaticKeyContactsSync)initWithStorage:(id)a3;
- (StaticKeyContactsSyncDelegate)delegate;
- (void)consumeContactsChangeHistory;
- (void)contactStoreDidChange:(id)a3;
- (void)dealloc;
- (void)drainContactsSyncing;
- (void)invalidateContactsSyncing;
- (void)onQueueMergeChangesFromContacts;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSigTerm:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)setStorage:(id)a3;
- (void)setTransaction:(id)a3;
- (void)startContactsSyncing;
@end

@implementation StaticKeyContactsSync

- (StaticKeyContactsSync)initWithStorage:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___StaticKeyContactsSync;
  v5 = -[StaticKeyContactsSync init](&v18, "init");
  v6 = v5;
  if (v5)
  {
    -[StaticKeyContactsSync setStorage:](v5, "setStorage:", v4);
    -[StaticKeyContactsSync setStarted:](v6, "setStarted:", 0LL);
    -[StaticKeyContactsSync setTransaction:](v6, "setTransaction:", 0LL);
    dispatch_queue_t v7 = dispatch_queue_create("StaticKeyContactsSync", 0LL);
    -[StaticKeyContactsSync setQueue:](v6, "setQueue:", v7);

    id location = 0LL;
    objc_initWeak(&location, v6);
    v8 = objc_alloc(&OBJC_CLASS___KTSignalTermHandler);
    v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472LL;
    v14 = sub_10019C754;
    v15 = &unk_100276D20;
    objc_copyWeak(&v16, &location);
    v9 = -[KTSignalTermHandler initWithSIGTERMNotification:](v8, "initWithSIGTERMNotification:", &v12);
    -[StaticKeyContactsSync setSigTerm:](v6, "setSigTerm:", v9, v12, v13, v14, v15);

    v10 = v6;
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyContactsSync sigTerm](self, "sigTerm"));
  [v3 unregister];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___StaticKeyContactsSync;
  -[StaticKeyContactsSync dealloc](&v4, "dealloc");
}

- (void)startContactsSyncing
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[StaticKeyContactsSync queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10019C96C;
  block[3] = &unk_100276740;
  block[4] = self;
  dispatch_sync(v3, block);

  if (qword_1002EED00 != -1) {
    dispatch_once(&qword_1002EED00, &stru_1002879F0);
  }
  objc_super v4 = (os_log_s *)qword_1002EED08;
  if (os_log_type_enabled((os_log_t)qword_1002EED08, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "StaticKeyContactsSync started", v5, 2u);
  }

  -[StaticKeyContactsSync consumeContactsChangeHistory](self, "consumeContactsChangeHistory");
}

- (void)contactStoreDidChange:(id)a3
{
  id v4 = a3;
  if (qword_1002EED00 != -1) {
    dispatch_once(&qword_1002EED00, &stru_100287A10);
  }
  v5 = (os_log_s *)qword_1002EED08;
  if (os_log_type_enabled((os_log_t)qword_1002EED08, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "contactStoreDidChange: %@", (uint8_t *)&v6, 0xCu);
  }

  -[StaticKeyContactsSync consumeContactsChangeHistory](self, "consumeContactsChangeHistory");
}

- (void)consumeContactsChangeHistory
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyContactsSync delegate](self, "delegate"));
  id v10 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 listStaticKey:&v10]);
  id v5 = v10;

  if (v5)
  {
    if (qword_1002EED00 != -1) {
      dispatch_once(&qword_1002EED00, &stru_100287A30);
    }
    int v6 = (os_log_s *)qword_1002EED08;
    if (os_log_type_enabled((os_log_t)qword_1002EED08, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Error fetching static key results %@",  buf,  0xCu);
    }
  }

  if ([v4 count])
  {
    if (!+[KTSignalTermHandler terminated](&OBJC_CLASS___KTSignalTermHandler, "terminated"))
    {
      id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[StaticKeyContactsSync queue](self, "queue"));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_10019CE04;
      v9[3] = &unk_100276740;
      v9[4] = self;
      dispatch_async(v7, v9);
    }
  }

  else
  {
    if (qword_1002EED00 != -1) {
      dispatch_once(&qword_1002EED00, &stru_100287A50);
    }
    v8 = (os_log_s *)qword_1002EED08;
    if (os_log_type_enabled((os_log_t)qword_1002EED08, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "consumeContactsChangeHistory ignoring contacts change because we have no KT entries",  buf,  2u);
    }
  }
}

- (void)invalidateContactsSyncing
{
  if (qword_1002EED00 != -1) {
    dispatch_once(&qword_1002EED00, &stru_100287A70);
  }
  v3 = (os_log_s *)qword_1002EED08;
  if (os_log_type_enabled((os_log_t)qword_1002EED08, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "StaticKeyContactsSync invalidate", v5, 2u);
  }

  -[StaticKeyContactsSync setStorage:](self, "setStorage:", 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v4 removeObserver:self name:CNContactStoreDidChangeNotification object:0];
}

- (void)drainContactsSyncing
{
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[StaticKeyContactsSync queue](self, "queue"));
  dispatch_sync(v2, &stru_100287A90);
}

- (void)onQueueMergeChangesFromContacts
{
  if (qword_1002EED00 != -1) {
    dispatch_once(&qword_1002EED00, &stru_100287AB0);
  }
  v3 = (os_log_s *)qword_1002EED08;
  if (os_log_type_enabled((os_log_t)qword_1002EED08, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "mergeChangesFromContacts started", buf, 2u);
  }

  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[StaticKeyContactsSync queue](self, "queue"));
  dispatch_assert_queue_V2(v4);

  id v5 = objc_alloc_init(&OBJC_CLASS___CNChangeHistoryFetchRequest);
  int v6 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyContactsSync storage](self, "storage"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 fetchContactsSyncToken]);
  -[CNChangeHistoryFetchRequest setStartingToken:](v5, "setStartingToken:", v7);

  -[CNChangeHistoryFetchRequest setExcludedTransactionAuthors:](v5, "setExcludedTransactionAuthors:", &off_10029A328);
  v66[0] = CNContactEmailAddressesKey;
  v66[1] = CNContactPhoneNumbersKey;
  v66[2] = CNContactExternalIdentifierKey;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v66, 3LL));
  -[CNChangeHistoryFetchRequest setAdditionalContactKeyDescriptors:](v5, "setAdditionalContactKeyDescriptors:", v8);

  v9 = objc_alloc_init(&OBJC_CLASS___CNContactStore);
  id v61 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[CNContactStore enumeratorForChangeHistoryFetchRequest:error:]( v9,  "enumeratorForChangeHistoryFetchRequest:error:",  v5,  &v61));
  id v11 = v61;
  id v12 = v11;
  if (!v10)
  {
    if (qword_1002EED00 != -1) {
      dispatch_once(&qword_1002EED00, &stru_100287AD0);
    }
    v47 = (os_log_s *)qword_1002EED08;
    if (os_log_type_enabled((os_log_t)qword_1002EED08, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v63 = v12;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "CNFetchResult failed: %@", buf, 0xCu);
    }

    goto LABEL_57;
  }

  id v59 = v11;
  v60 = v10;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 value]);
  v14 = 0LL;
  *(void *)&__int128 v15 = 138412546LL;
  __int128 v57 = v15;
  while (1)
  {
    id v16 = v14;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "nextObject", v57));

    if (!v14) {
      break;
    }
    if (qword_1002EED00 != -1) {
      dispatch_once(&qword_1002EED00, &stru_100287AF0);
    }
    v17 = (os_log_s *)qword_1002EED08;
    if (os_log_type_enabled((os_log_t)qword_1002EED08, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v63 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "mergeChangesFromContacts: change history enumerator object = %@",  buf,  0xCu);
    }

    uint64_t v19 = objc_opt_class(&OBJC_CLASS___CNChangeHistoryDropEverythingEvent, v18);
    if ((objc_opt_isKindOfClass(v14, v19) & 1) != 0)
    {
      if (qword_1002EED00 != -1) {
        dispatch_once(&qword_1002EED00, &stru_100287B10);
      }
      v21 = (os_log_s *)qword_1002EED08;
      if (os_log_type_enabled((os_log_t)qword_1002EED08, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "mergeChangesFromContacts: change history - drop everything",  buf,  2u);
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyContactsSync delegate](self, "delegate"));
      [v22 resetContactsStorage];
    }

    else
    {
      uint64_t v23 = objc_opt_class(&OBJC_CLASS___CNChangeHistoryAddContactEvent, v20);
      if ((objc_opt_isKindOfClass(v14, v23) & 1) != 0)
      {
        id v25 = v14;
        if (qword_1002EED00 != -1) {
          dispatch_once(&qword_1002EED00, &stru_100287B30);
        }
        v26 = (void *)qword_1002EED08;
        if (os_log_type_enabled((os_log_t)qword_1002EED08, OS_LOG_TYPE_DEFAULT))
        {
          v27 = v26;
          v28 = (void *)objc_claimAutoreleasedReturnValue([v25 contact]);
          *(_DWORD *)buf = 138412290;
          v63 = v28;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "mergeChangesFromContacts: change history - AddContact event - %@",  buf,  0xCu);
        }
      }

      else
      {
        uint64_t v29 = objc_opt_class(&OBJC_CLASS___CNChangeHistoryUpdateContactEvent, v24);
        if ((objc_opt_isKindOfClass(v14, v29) & 1) == 0)
        {
          uint64_t v36 = objc_opt_class(&OBJC_CLASS___CNChangeHistoryDeleteContactEvent, v30);
          if ((objc_opt_isKindOfClass(v14, v36) & 1) != 0)
          {
            id v37 = v14;
            v58 = v9;
            if (qword_1002EED00 != -1) {
              dispatch_once(&qword_1002EED00, &stru_100287B70);
            }
            v38 = v5;
            v39 = (void *)qword_1002EED08;
            if (os_log_type_enabled((os_log_t)qword_1002EED08, OS_LOG_TYPE_DEFAULT))
            {
              v40 = v39;
              v41 = (void *)objc_claimAutoreleasedReturnValue([v37 contactIdentifier]);
              v42 = (void *)objc_claimAutoreleasedReturnValue([v37 externalURI]);
              *(_DWORD *)buf = v57;
              v63 = v41;
              __int16 v64 = 2112;
              v65 = v42;
              _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "mergeChangesFromContacts: change history - DeleteContact event - %@[%@]",  buf,  0x16u);
            }

            v43 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyContactsSync delegate](self, "delegate"));
            v44 = (void *)objc_claimAutoreleasedReturnValue([v37 contactIdentifier]);
            v45 = (void *)objc_claimAutoreleasedReturnValue([v37 externalURI]);
            [v43 deleteContact:v44 contactExternalURI:v45];

            id v5 = v38;
            v9 = v58;
          }

          else
          {
            if (qword_1002EED00 != -1) {
              dispatch_once(&qword_1002EED00, &stru_100287B90);
            }
            v46 = (os_log_s *)qword_1002EED08;
            if (os_log_type_enabled((os_log_t)qword_1002EED08, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v63 = v14;
              _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "mergeChangesFromContacts: change history - ignoring event - %@",  buf,  0xCu);
            }
          }

          goto LABEL_29;
        }

        id v25 = v14;
        if (qword_1002EED00 != -1) {
          dispatch_once(&qword_1002EED00, &stru_100287B50);
        }
        v31 = (void *)qword_1002EED08;
        if (os_log_type_enabled((os_log_t)qword_1002EED08, OS_LOG_TYPE_DEFAULT))
        {
          v32 = v31;
          v33 = (void *)objc_claimAutoreleasedReturnValue([v25 contact]);
          *(_DWORD *)buf = 138412290;
          v63 = v33;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "mergeChangesFromContacts: change history - UpdateContact event - %@",  buf,  0xCu);
        }
      }

      v34 = (void *)objc_claimAutoreleasedReturnValue(-[StaticKeyContactsSync delegate](self, "delegate"));
      v35 = (void *)objc_claimAutoreleasedReturnValue([v25 contact]);
      [v34 updateContact:v35];
    }

- (StaticKeyContactsSyncDelegate)delegate
{
  return (StaticKeyContactsSyncDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (StaticKeyContactsStorage)storage
{
  return (StaticKeyContactsStorage *)objc_loadWeakRetained((id *)&self->_storage);
}

- (void)setStorage:(id)a3
{
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setTransaction:(id)a3
{
}

- (KTSignalTermHandler)sigTerm
{
  return (KTSignalTermHandler *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setSigTerm:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
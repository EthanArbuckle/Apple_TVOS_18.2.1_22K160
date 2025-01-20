@interface PDApplicationMessageSink
- (BOOL)hasMessageWithIdentifier:(id)a3;
- (BOOL)registerMessageForIdentifier:(id)a3 withRequest:(id)a4;
- (BOOL)registerOrUpdateMessageForIdentifier:(id)a3 withRequest:(id)a4;
- (BOOL)updateMessageForIdentifier:(id)a3 withRequest:(id)a4;
- (NSArray)registrations;
- (PDApplicationMessageSink)init;
- (int64_t)source;
- (void)didUpdateMessageContentForIdentifier:(id)a3;
- (void)unregisterMessageForIdentifier:(id)a3;
@end

@implementation PDApplicationMessageSink

- (PDApplicationMessageSink)init
{
  return 0LL;
}

- (BOOL)registerMessageForIdentifier:(id)a3 withRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"PDApplicationMessageSink (%ld): cannot insert a message with a nil identifier.",  self->_source);
  }
  id v8 = +[PKApplicationMessageKey createWithSource:identifier:]( &OBJC_CLASS___PKApplicationMessageKey,  "createWithSource:identifier:",  self->_source,  v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v10 = +[PKApplicationMessageRegistration createWithKey:createdDate:priority:badge:]( PKApplicationMessageRegistration,  "createWithKey:createdDate:priority:badge:",  v8,  v9,  [v7 priority],  objc_msgSend(v7, "badge"));

  BOOL v11 = sub_1003AF59C((uint64_t)self->_databaseManager, v10);
  uint64_t Object = PKLogFacilityTypeGetObject(0LL);
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v14)
    {
      int64_t source = self->_source;
      *(_DWORD *)buf = 134218242;
      int64_t v19 = source;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "PDApplicationMessageSink (%ld): inserted message %@.",  buf,  0x16u);
    }

    sub_10030B954((uint64_t)self->_manager);
  }

  else
  {
    if (v14)
    {
      int64_t v16 = self->_source;
      *(_DWORD *)buf = 134218242;
      int64_t v19 = v16;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "PDApplicationMessageSink (%ld): failed to insert message %@ - already exists.",  buf,  0x16u);
    }
  }

  return v11;
}

- (BOOL)updateMessageForIdentifier:(id)a3 withRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"PDApplicationMessageSink (%ld): cannot update a message with a nil identifier.",  self->_source);
  }
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  char v26 = 0;
  databaseManager = self->_databaseManager;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10030B248;
  v19[3] = &unk_1006445C0;
  v19[4] = self;
  id v9 = v6;
  id v20 = v9;
  id v10 = v7;
  id v21 = v10;
  v22 = &v23;
  -[PDDatabaseManager performTransactionWithBlock:](databaseManager, "performTransactionWithBlock:", v19);
  int v11 = *((unsigned __int8 *)v24 + 24);
  uint64_t Object = PKLogFacilityTypeGetObject(0LL);
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v14)
    {
      int64_t source = self->_source;
      *(_DWORD *)buf = 134218242;
      int64_t v28 = source;
      __int16 v29 = 2112;
      id v30 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "PDApplicationMessageSink (%ld): updated message %@.",  buf,  0x16u);
    }

    sub_10030B954((uint64_t)self->_manager);
  }

  else
  {
    if (v14)
    {
      int64_t v16 = self->_source;
      *(_DWORD *)buf = 134218242;
      int64_t v28 = v16;
      __int16 v29 = 2112;
      id v30 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "PDApplicationMessageSink (%ld): failed to update message %@.",  buf,  0x16u);
    }
  }

  BOOL v17 = *((_BYTE *)v24 + 24) != 0;

  _Block_object_dispose(&v23, 8);
  return v17;
}

- (BOOL)registerOrUpdateMessageForIdentifier:(id)a3 withRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"PDApplicationMessageSink (%ld): cannot update a message with a nil identifier.",  self->_source);
  }
  id v8 = +[PKApplicationMessageKey createWithSource:identifier:]( &OBJC_CLASS___PKApplicationMessageKey,  "createWithSource:identifier:",  self->_source,  v6);
  id v9 = sub_1003AF674((void **)&self->_databaseManager->super.isa, v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (v10) {
    unsigned __int8 v11 = -[PDApplicationMessageSink updateMessageForIdentifier:withRequest:]( self,  "updateMessageForIdentifier:withRequest:",  v6,  v7);
  }
  else {
    unsigned __int8 v11 = -[PDApplicationMessageSink registerMessageForIdentifier:withRequest:]( self,  "registerMessageForIdentifier:withRequest:",  v6,  v7);
  }
  BOOL v12 = v11;

  return v12;
}

- (void)unregisterMessageForIdentifier:(id)a3
{
}

- (BOOL)hasMessageWithIdentifier:(id)a3
{
  v3 = self;
  id v4 = +[PKApplicationMessageKey createWithSource:identifier:]( &OBJC_CLASS___PKApplicationMessageKey,  "createWithSource:identifier:",  self->_source,  a3);
  v5 = sub_1003AF674((void **)&v3->_databaseManager->super.isa, v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  LOBYTE(v3) = v6 != 0LL;

  return (char)v3;
}

- (void)didUpdateMessageContentForIdentifier:(id)a3
{
  if (self) {
    sub_10030B954((uint64_t)self->_manager);
  }
}

- (int64_t)source
{
  return self->_source;
}

- (NSArray)registrations
{
  return (NSArray *)(id)sub_10030B930((uint64_t)self);
}

@end
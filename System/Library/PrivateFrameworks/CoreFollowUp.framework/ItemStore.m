@interface ItemStore
+ (id)sharedInstance;
- (BOOL)_unsafe_deleteActionWithID:(int64_t)a3;
- (BOOL)deleteFollowUpItem:(id)a3;
- (BOOL)deleteNotificationForFollowUpItem:(id)a3;
- (BOOL)insertFollowUpItem:(id)a3;
- (BOOL)updateNotificationForFollowUpItem:(id)a3;
- (FLSQLiteExecutor)queryExecutor;
- (double)intervalFromColumn:(int64_t)a3 inStatement:(sqlite3_stmt *)a4;
- (id)_unsafeSelectNotificationForFollowUpItem:(id)a3;
- (id)allFollowUpItems;
- (id)dataFromColumn:(int64_t)a3 inStatement:(sqlite3_stmt *)a4;
- (id)dateFromColumn:(int64_t)a3 inStatement:(sqlite3_stmt *)a4;
- (id)safeSelectFollowUpActions;
- (id)safeSelectFollowUpItemsWithUniqueIdentifiers:(id)a3;
- (id)safeSelectFollowUpNotifications;
- (id)stringFromColumn:(int64_t)a3 inStatement:(sqlite3_stmt *)a4;
- (id)urlFromColumn:(int64_t)a3 inStatement:(sqlite3_stmt *)a4;
- (int64_t)_unsafe_insertAction:(id)a3 item:(id)a4;
- (int64_t)_unsafe_insertFollowUpItem:(id)a3;
- (int64_t)_unsafe_insertNotificationForItem:(id)a3;
- (void)_closeDatabase;
- (void)_openDatabase;
- (void)_unsafeSelectFollowUpActionsForItem:(id)a3 orActionID:(int64_t)a4 rowHandler:(id)a5;
- (void)_unsafeSelectFollowUpItemsWithUniqueIdentifiers:(id)a3 rowHandler:(id)a4;
- (void)_unsafeSelectFollowUpNotificationsWithRowHandler:(id)a3;
- (void)_wipeDatabase;
- (void)setQueryExecutor:(id)a3;
@end

@implementation ItemStore

+ (id)sharedInstance
{
  if (qword_10001E398 != -1) {
    dispatch_once(&qword_10001E398, &stru_1000187A0);
  }
  return (id)qword_10001E390;
}

- (id)allFollowUpItems
{
  return -[ItemStore safeSelectFollowUpItemsWithUniqueIdentifiers:]( self,  "safeSelectFollowUpItemsWithUniqueIdentifiers:",  0LL);
}

- (BOOL)insertFollowUpItem:(id)a3
{
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000071CC;
  v6[3] = &unk_1000187C8;
  id v4 = a3;
  id v7 = v4;
  v8 = self;
  v9 = &v10;
  +[FLSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___FLSQLiteExecutor, "performBlockAndWait:", v6);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (int64_t)_unsafe_insertFollowUpItem:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[FLSQLiteQuery queryWithString:]( &OBJC_CLASS___FLSQLiteQuery,  "queryWithString:",  @"INSERT OR REPLACE INTO items (uuid, title, body, show_in_settings, style, persist_when_activated, persist_when_dismissed, user_info, client_identifier, extension_identifier, group_identifier, target_bundle_identifier, representing_bundle_path, bundle_icon_name, informative_footer_text, category_identifier, expiration_date, account_id, type_id, collection_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100007500;
  v16[3] = &unk_1000187F0;
  id v6 = v4;
  id v17 = v6;
  [v5 setBindHandler:v16];
  queryExecutor = self->_queryExecutor;
  id v15 = 0LL;
  id v8 = -[FLSQLiteExecutor performInsertQuery:error:](queryExecutor, "performInsertQuery:error:", v5, &v15);
  id v9 = v15;
  v11 = v9;
  if (v8 == (id)-1LL)
  {
    uint64_t v12 = _FLLogSystem(v9, v10);
    char v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10000E788();
    }
  }

  return (int64_t)v8;
}

- (int64_t)_unsafe_insertAction:(id)a3 item:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[FLSQLiteQuery queryWithString:]( &OBJC_CLASS___FLSQLiteQuery,  "queryWithString:",  @"INSERT INTO actions (label, url, launch_url, launch_arguments, item_id, action_identifier) VALUES (?, ?, ?, ?, ?, ?)"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100007C44;
  v20[3] = &unk_100018818;
  id v9 = v6;
  id v21 = v9;
  id v10 = v7;
  id v22 = v10;
  [v8 setBindHandler:v20];
  queryExecutor = self->_queryExecutor;
  id v19 = 0LL;
  id v12 = -[FLSQLiteExecutor performInsertQuery:error:](queryExecutor, "performInsertQuery:error:", v8, &v19);
  id v13 = v19;
  id v15 = v13;
  if (v12 == (id)-1LL)
  {
    uint64_t v16 = _FLLogSystem(v13, v14);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10000E7E8();
    }
  }

  return (int64_t)v12;
}

- (int64_t)_unsafe_insertNotificationForItem:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 notification]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 activateAction]);

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 activateAction]);
    int64_t v8 = -[ItemStore _unsafe_insertAction:item:](self, "_unsafe_insertAction:item:", v7, 0LL);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 activateAction]);
    [v9 setSqlID:v8];
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 notification]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 clearAction]);

  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 clearAction]);
    int64_t v13 = -[ItemStore _unsafe_insertAction:item:](self, "_unsafe_insertAction:item:", v12, 0LL);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v5 clearAction]);
    [v14 setSqlID:v13];
  }

  if ([v5 sqlID])
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue( -[ItemStore _unsafeSelectNotificationForFollowUpItem:]( self,  "_unsafeSelectNotificationForFollowUpItem:",  v4));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 activateAction]);

    if (v16)
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 activateAction]);
      -[ItemStore _unsafe_deleteActionWithID:](self, "_unsafe_deleteActionWithID:", [v17 sqlID]);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue([v15 clearAction]);

    if (v18)
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v15 clearAction]);
      -[ItemStore _unsafe_deleteActionWithID:](self, "_unsafe_deleteActionWithID:", [v21 sqlID]);
    }

    uint64_t v22 = _FLLogSystem(v19, v20);
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v15;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Using creation date from %@", buf, 0xCu);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue([v15 creationDate]);
    [v5 setCreationDate:v24];

    v25 = @"INSERT OR REPLACE INTO notifications (item_id, title, body, unlock_label, relevance_date, activate_action_id, dismiss_action_id, clear_action_id, frequency, creationDate, options, subtitle_text, id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
  }

  else
  {
    v25 = @"INSERT INTO notifications (item_id, title, body, unlock_label, relevance_date, activate_action_id, dismiss_action_id, clear_action_id, frequency, creationDate, options, subtitle_text) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[FLSQLiteQuery queryWithString:](&OBJC_CLASS___FLSQLiteQuery, "queryWithString:", v25));
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_10000811C;
  v38[3] = &unk_100018818;
  id v27 = v4;
  id v39 = v27;
  id v28 = v5;
  id v40 = v28;
  [v26 setBindHandler:v38];
  queryExecutor = self->_queryExecutor;
  id v37 = 0LL;
  id v30 = -[FLSQLiteExecutor performInsertQuery:error:](queryExecutor, "performInsertQuery:error:", v26, &v37);
  id v31 = v37;
  v33 = v31;
  if (v30 == (id)-1LL)
  {
    uint64_t v34 = _FLLogSystem(v31, v32);
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_10000E848();
    }
  }

  return (int64_t)v30;
}

- (BOOL)deleteFollowUpItem:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _FLLogSystem(v4, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Deleting item: %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v16 = 0x2020000000LL;
  char v17 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100008644;
  v11[3] = &unk_100018840;
  id v8 = v4;
  int64_t v13 = self;
  p___int128 buf = &buf;
  id v12 = v8;
  +[FLSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___FLSQLiteExecutor, "performBlockAndWait:", v11);
  -[ItemStore deleteNotificationForFollowUpItem:](self, "deleteNotificationForFollowUpItem:", v8);
  BOOL v9 = *(_BYTE *)(*((void *)&buf + 1) + 24LL) != 0;

  _Block_object_dispose(&buf, 8);
  return v9;
}

- (BOOL)updateNotificationForFollowUpItem:(id)a3
{
  uint64_t v9 = 0LL;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  char v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100008850;
  v6[3] = &unk_100018868;
  id v8 = &v9;
  void v6[4] = self;
  id v3 = a3;
  id v7 = v3;
  +[FLSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___FLSQLiteExecutor, "performBlockAndWait:", v6);
  char v4 = *((_BYTE *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (BOOL)deleteNotificationForFollowUpItem:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _FLLogSystem(v4, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Deleting notifications for item %@",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v16 = 0x2020000000LL;
  char v17 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000089F0;
  v11[3] = &unk_100018840;
  id v8 = v4;
  int64_t v13 = self;
  p___int128 buf = &buf;
  id v12 = v8;
  +[FLSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___FLSQLiteExecutor, "performBlockAndWait:", v11);
  BOOL v9 = *(_BYTE *)(*((void *)&buf + 1) + 24LL) != 0;

  _Block_object_dispose(&buf, 8);
  return v9;
}

- (BOOL)_unsafe_deleteActionWithID:(int64_t)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[FLSQLiteQuery queryWithString:]( &OBJC_CLASS___FLSQLiteQuery,  "queryWithString:",  @"DELETE FROM actions WHERE id=?"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100008C10;
  v15[3] = &unk_100018888;
  v15[4] = a3;
  [v5 setBindHandler:v15];
  queryExecutor = self->_queryExecutor;
  id v14 = 0LL;
  unsigned __int8 v7 = -[FLSQLiteExecutor performQuery:error:](queryExecutor, "performQuery:error:", v5, &v14);
  id v8 = v14;
  id v10 = v8;
  if ((v7 & 1) == 0)
  {
    uint64_t v11 = _FLLogSystem(v8, v9);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10000E908();
    }
  }

  return v7;
}

- (id)safeSelectFollowUpActions
{
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  id v14 = sub_100008D94;
  id v15 = sub_100008DA4;
  id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100008DAC;
  v10[3] = &unk_1000188D8;
  v10[4] = self;
  v10[5] = &v11;
  id v3 = +[FLSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___FLSQLiteExecutor, "performBlockAndWait:", v10);
  uint64_t v5 = _FLLogSystem(v3, v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v12[5];
    *(_DWORD *)__int128 buf = 138412290;
    uint64_t v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Actions Fetched: %@", buf, 0xCu);
  }

  id v8 = [(id)v12[5] copy];
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (id)safeSelectFollowUpNotifications
{
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  id v14 = sub_100008D94;
  id v15 = sub_100008DA4;
  id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100008F94;
  v10[3] = &unk_1000188D8;
  v10[4] = self;
  v10[5] = &v11;
  id v3 = +[FLSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___FLSQLiteExecutor, "performBlockAndWait:", v10);
  uint64_t v5 = _FLLogSystem(v3, v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v12[5];
    *(_DWORD *)__int128 buf = 138412290;
    uint64_t v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Notifications Fetched: %@", buf, 0xCu);
  }

  id v8 = [(id)v12[5] copy];
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (id)safeSelectFollowUpItemsWithUniqueIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _FLSignpostCreate();
  uint64_t v7 = v6;
  uint64_t v8 = _FLSignpostLogSystem();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10000EA50();
  }

  uint64_t v29 = 0LL;
  v30[0] = &v29;
  v30[1] = 0x3032000000LL;
  v30[2] = sub_100008D94;
  v30[3] = sub_100008DA4;
  id v31 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000091D0;
  v26[3] = &unk_1000187C8;
  v26[4] = self;
  id v10 = v4;
  id v27 = v10;
  id v28 = &v29;
  +[FLSQLiteExecutor performBlockAndWait:](&OBJC_CLASS___FLSQLiteExecutor, "performBlockAndWait:", v26);
  unint64_t Nanoseconds = _FLSignpostGetNanoseconds(v5, v7);
  uint64_t v12 = _FLSignpostLogSystem();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_10000E9D4(v5, v13, (double)Nanoseconds / 1000000000.0);
  }

  uint64_t v16 = _FLLogSystem(v14, v15);
  char v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_10000E968((uint64_t)v30, v17, v18, v19, v20, v21, v22, v23);
  }

  id v24 = [*(id *)(v30[0] + 40) copy];
  _Block_object_dispose(&v29, 8);

  return v24;
}

- (void)_unsafeSelectFollowUpItemsWithUniqueIdentifiers:(id)a3 rowHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithString:]( &OBJC_CLASS___NSMutableString,  "stringWithString:",  @"SELECT id, uuid, title, body, show_in_settings, style, persist_when_activated, persist_when_dismissed, user_info, client_identifier, extension_identifier, group_identifier, target_bundle_identifier, representing_bundle_path, bundle_icon_name, informative_footer_text, category_identifier, expiration_date, account_id, type_id, collection_id FROM items"));
  if ([v6 count])
  {
    [v8 appendString:@" WHERE"];
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id v9 = v6;
    id v10 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v30;
      do
      {
        uint64_t v13 = 0LL;
        do
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v9);
          }
          if ([v9 indexOfObject:*(void *)(*((void *)&v29 + 1) + 8 * (void)v13)]) {
            [v8 appendFormat:@" OR"];
          }
          [v8 appendFormat:@" uuid = ?"];
          uint64_t v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }

      while (v11);
    }
  }

  [v8 appendFormat:@" ORDER BY id"];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[FLSQLiteQuery queryWithString:](&OBJC_CLASS___FLSQLiteQuery, "queryWithString:", v8));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1000094D8;
  v27[3] = &unk_1000187F0;
  id v15 = v6;
  id v28 = v15;
  [v14 setBindHandler:v27];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100009608;
  v25[3] = &unk_100018978;
  v25[4] = self;
  id v16 = v7;
  id v26 = v16;
  [v14 setRowHandler:v25];
  queryExecutor = self->_queryExecutor;
  id v24 = 0LL;
  unsigned __int8 v18 = -[FLSQLiteExecutor performQuery:error:](queryExecutor, "performQuery:error:", v14, &v24);
  id v19 = v24;
  uint64_t v21 = v19;
  if ((v18 & 1) == 0)
  {
    uint64_t v22 = _FLLogSystem(v19, v20);
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_10000EAB0();
    }
  }
}

- (void)_unsafeSelectFollowUpNotificationsWithRowHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[FLSQLiteQuery queryWithString:]( &OBJC_CLASS___FLSQLiteQuery,  "queryWithString:",  @"SELECT id, title, body, unlock_label, relevance_date, activate_action_id, dismiss_action_id, clear_action_id, frequency, creationDate, options, subtitle_text FROM notifications"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100009B34;
  v15[3] = &unk_100018978;
  v15[4] = self;
  id v6 = v4;
  id v16 = v6;
  [v5 setRowHandler:v15];
  queryExecutor = self->_queryExecutor;
  id v14 = 0LL;
  unsigned __int8 v8 = -[FLSQLiteExecutor performQuery:error:](queryExecutor, "performQuery:error:", v5, &v14);
  id v9 = v14;
  id v11 = v9;
  if ((v8 & 1) == 0)
  {
    uint64_t v12 = _FLLogSystem(v9, v10);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10000EB10();
    }
  }
}

- (id)_unsafeSelectNotificationForFollowUpItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[FLSQLiteQuery queryWithString:]( &OBJC_CLASS___FLSQLiteQuery,  "queryWithString:",  @"SELECT id, title, body, unlock_label, relevance_date, activate_action_id, dismiss_action_id, clear_action_id, frequency, creationDate, options, subtitle_text FROM notifications WHERE item_id = ? LIMIT 1"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_10000A098;
  v28[3] = &unk_1000187F0;
  id v6 = v4;
  id v29 = v6;
  [v5 setBindHandler:v28];
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = sub_100008D94;
  id v26 = sub_100008DA4;
  id v27 = 0LL;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10000A0C8;
  v21[3] = &unk_1000189A0;
  v21[4] = self;
  v21[5] = &v22;
  [v5 setRowHandler:v21];
  queryExecutor = self->_queryExecutor;
  id v20 = 0LL;
  unsigned __int8 v8 = -[FLSQLiteExecutor performQuery:error:](queryExecutor, "performQuery:error:", v5, &v20);
  id v9 = v20;
  id v11 = v9;
  if ((v8 & 1) == 0)
  {
    uint64_t v12 = _FLLogSystem(v9, v10);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10000EB10();
    }
  }

  id v14 = (void *)v23[5];
  if (v14)
  {
    uint64_t v15 = _FLLogSystem(v9, v10);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = v23[5];
      *(_DWORD *)__int128 buf = 138412290;
      uint64_t v31 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Found notification: %@", buf, 0xCu);
    }

    id v14 = (void *)v23[5];
  }

  id v18 = v14;

  _Block_object_dispose(&v22, 8);
  return v18;
}

- (void)_unsafeSelectFollowUpActionsForItem:(id)a3 orActionID:(int64_t)a4 rowHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithString:]( &OBJC_CLASS___NSMutableString,  "stringWithString:",  @"SELECT id, label, url, launch_url, launch_arguments, action_identifier FROM actions"));
  id v11 = v10;
  if (v8)
  {
    uint64_t v12 = @" WHERE item_id = ?";
  }

  else
  {
    if (a4 < 1) {
      goto LABEL_6;
    }
    uint64_t v12 = @" WHERE id = ?";
  }

  [v10 appendString:v12];
LABEL_6:
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[FLSQLiteQuery queryWithString:](&OBJC_CLASS___FLSQLiteQuery, "queryWithString:", v11));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10000A51C;
  v26[3] = &unk_1000189C8;
  id v14 = v8;
  id v27 = v14;
  int64_t v28 = a4;
  [v13 setBindHandler:v26];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10000A55C;
  v24[3] = &unk_100018978;
  v24[4] = self;
  id v15 = v9;
  id v25 = v15;
  [v13 setRowHandler:v24];
  queryExecutor = self->_queryExecutor;
  id v23 = 0LL;
  unsigned __int8 v17 = -[FLSQLiteExecutor performQuery:error:](queryExecutor, "performQuery:error:", v13, &v23);
  id v18 = v23;
  id v20 = v18;
  if ((v17 & 1) == 0)
  {
    uint64_t v21 = _FLLogSystem(v18, v19);
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10000EB70();
    }
  }
}

- (id)stringFromColumn:(int64_t)a3 inStatement:(sqlite3_stmt *)a4
{
  id v4 = (unsigned __int8 *)sqlite3_column_text(a4, a3);
  if (v4) {
    id v4 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v4));
  }
  return v4;
}

- (id)urlFromColumn:(int64_t)a3 inStatement:(sqlite3_stmt *)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ItemStore stringFromColumn:inStatement:](self, "stringFromColumn:inStatement:", a3, a4));
  if (v4) {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v4));
  }
  else {
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (id)dataFromColumn:(int64_t)a3 inStatement:(sqlite3_stmt *)a4
{
  int v5 = a3;
  int v6 = sqlite3_column_bytes(a4, a3);
  id v7 = sqlite3_column_blob(a4, v5);
  id v8 = 0LL;
  if (v7 && v6) {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:"));
  }
  return v8;
}

- (id)dateFromColumn:(int64_t)a3 inStatement:(sqlite3_stmt *)a4
{
  if (v4 == 0.0) {
    return 0LL;
  }
  else {
    return (id)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:"));
  }
}

- (double)intervalFromColumn:(int64_t)a3 inStatement:(sqlite3_stmt *)a4
{
  return sqlite3_column_double(a4, a3);
}

- (void)_openDatabase
{
}

- (void)_closeDatabase
{
}

- (void)_wipeDatabase
{
}

- (FLSQLiteExecutor)queryExecutor
{
  return self->_queryExecutor;
}

- (void)setQueryExecutor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
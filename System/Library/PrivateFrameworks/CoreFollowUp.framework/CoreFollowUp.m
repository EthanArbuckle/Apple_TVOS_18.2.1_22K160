uint64_t sub_100003860(uint64_t a1)
{
  uint64_t result;
  result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100003934(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100003988(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.followup.itemstorequeue", v4);
  v3 = (void *)qword_10001E368;
  qword_10001E368 = (uint64_t)v2;
}

uint64_t sub_100003CD8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}
}

void sub_100004548( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_10000456C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000457C(uint64_t a1)
{
}

void sub_100004584(void *a1)
{
  dispatch_queue_t v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8LL);
  id obj = *(id *)(v3 + 40);
  unsigned __int8 v4 = objc_msgSend(v2, "_unsafe_openDatabase:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = v4;
}

id sub_100004A98(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unsafe_wipeDatabase");
}

id sub_100004C10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unsafe_closeDatabase");
}

id sub_100005048(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned __int8 v4 = v3;
  if (!*(void *)(*(void *)(a1 + 32) + 8LL))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[FLApprovedItemsFilter sharedFilter](&OBJC_CLASS___FLApprovedItemsFilter, "sharedFilter"));
    id v8 = [v7 approvalStatusForItem:v4];

    if (v8 != (id)1)
    {
      if (v8 == (id)2) {
        goto LABEL_6;
      }
      +[FLApprovedItemsDecorator decorateUnknownItem:]( &OBJC_CLASS___FLApprovedItemsDecorator,  "decorateUnknownItem:",  v4);
    }

LABEL_8:
    id v9 = v4;
    goto LABEL_9;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 clientIdentifier]);
  unsigned int v6 = [v5 isEqualToString:*(void *)(*(void *)(a1 + 32) + 8)];

  if (v6) {
    goto LABEL_8;
  }
LABEL_6:
  id v9 = 0LL;
LABEL_9:

  return v9;
}

LABEL_7:
  if (!v6) {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"<pid:%d>", v3));
  }
  return v6;
}

uint64_t sub_100005638()
{
  uint64_t v0 = _FLLogSystem();
  dispatch_queue_attr_t v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "Notified of language change. Will exit when all clear.",  v3,  2u);
  }

  return xpc_transaction_exit_clean();
}

void sub_100005800(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  unsigned __int8 v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.followup.badges", v4);
  id v3 = (void *)qword_10001E380;
  qword_10001E380 = (uint64_t)v2;
}

LABEL_4:
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[FLEnvironment currentEnvironment](&OBJC_CLASS___FLEnvironment, "currentEnvironment"));
  v11 = [v10 stressMode];

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[ItemStore sharedInstance](&OBJC_CLASS___ItemStore, "sharedInstance"));
    v13 = [v12 insertFollowUpItem:v6];

    if (!v7) {
      goto LABEL_23;
    }
    goto LABEL_20;
  }

  v14 = objc_alloc(&OBJC_CLASS___FLItemStoreDecorator);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v6 clientIdentifier]);
  v16 = -[FLItemStoreDecorator initWithClientIdentifier:](v14, "initWithClientIdentifier:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueIdentifier]);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FLItemStoreDecorator itemsMatchingIdentifier:](v16, "itemsMatchingIdentifier:", v17));

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_100005BC4;
  v36[3] = &unk_1000186C8;
  v19 = v6;
  v37 = v19;
  [v18 enumerateObjectsUsingBlock:v36];
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 notification]);
  [v20 recalculateActionDateToAccountForDelay];

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[ItemStore sharedInstance](&OBJC_CLASS___ItemStore, "sharedInstance"));
  v13 = [v21 insertFollowUpItem:v19];

  if ((_DWORD)v13)
  {
    if (![v18 count])
    {
      v25 = _FLLogSystem(0LL, v24);
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v35 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Inserting a new follow up",  (uint8_t *)&v35,  2u);
      }

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[ClientInterface _telemetryProcessor](self, "_telemetryProcessor"));
      [v27 processItemAddition:v19];
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[FLApprovedItemsFilter sharedFilter](&OBJC_CLASS___FLApprovedItemsFilter, "sharedFilter"));
    v29 = [v28 approvalStatusForItem:v19];

    if (!v29) {
      +[FLApprovedItemsDecorator decorateUnknownItem:]( &OBJC_CLASS___FLApprovedItemsDecorator,  "decorateUnknownItem:",  v19);
    }
    -[ClientInterface _didChangeFollowUpItems](self, "_didChangeFollowUpItems");
  }

  else
  {
    v31 = _FLLogSystem(v22, v23);
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_10000E618((uint64_t)self, v32);
    }
  }

  if (v7) {
LABEL_20:
  }
    ((void (**)(id, id, void *))v7)[2](v7, v13, 0LL);
LABEL_23:
}

void sub_100005BC4(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 notification]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 previousNotificationActionDate]);
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) notification]);
  [v6 setPreviousNotificationActionDate:v5];

  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 notification]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 creationDate]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) notification]);
  [v9 setCreationDate:v8];

  uint64_t v12 = _FLLogSystem(v10, v11);
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Replacing existing item %@ with matching identifier",  (uint8_t *)&v14,  0xCu);
  }
}

uint64_t sub_10000649C(uint64_t a1, void *a2)
{
  if (!*(void *)(a1 + 32)) {
    return 1LL;
  }
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 clientIdentifier]);
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return (uint64_t)v4;
}

void sub_100006818(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  os_transaction_needs_more_time(*(void *)(a1 + 32));
  [*(id *)(a1 + 40) removeObject:v7];
  if (!*(_BYTE *)(a1 + 64) || [*(id *)(a1 + 48) containsObject:v7])
  {
    unsigned int v6 = *(void **)(a1 + 56);
    if (v6) {
      [v6 processCurrentItems:v5];
    }
    +[ClientInterface refreshBadgesWithItems:forBundleIdentifier:]( &OBJC_CLASS___ClientInterface,  "refreshBadgesWithItems:forBundleIdentifier:",  v5,  v7);
  }
}

id sub_100006904(id a1, FLFollowUpItem *a2)
{
  dispatch_queue_t v2 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[FLApprovedItemsFilter sharedFilter](&OBJC_CLASS___FLApprovedItemsFilter, "sharedFilter"));
  id v4 = [v3 approvalStatusForItem:v2];

  if (v4 == (id)1) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[FLFollowUpItem targetBundleIdentifier](v2, "targetBundleIdentifier"));
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

void sub_100006C78(void *a1)
{
  id v2 = [[UISApplicationState alloc] initWithBundleIdentifier:a1[4]];
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a1[6]));
  [v2 setBadgeValue:v3];

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 badgeValue]);
  uint64_t v6 = _FLLogSystem(v4, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)objc_opt_class(a1[7]);
    uint64_t v9 = a1[4];
    int v11 = 138412802;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    int v14 = v4;
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    id v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: Badged (%@, %@)", (uint8_t *)&v11, 0x20u);
  }
}

void sub_100007058(id a1)
{
  dispatch_queue_attr_t v1 = objc_alloc_init(&OBJC_CLASS___ItemStore);
  id v2 = (void *)qword_10001E390;
  qword_10001E390 = (uint64_t)v1;

  id v3 = objc_alloc(&OBJC_CLASS___FLSQLiteExecutor);
  id v4 = NSHomeDirectory();
  id v8 = (id)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingString:@"/Library/CoreFollowUp/items.db"]);
  uint64_t v6 = -[FLSQLiteExecutor initWithDatabasePath:](v3, "initWithDatabasePath:", v5);
  id v7 = *(void **)(qword_10001E390 + 8);
  *(void *)(qword_10001E390 + _Block_object_dispose((const void *)(v9 - 48), 8) = v6;
}

void sub_1000071B4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_1000071CC(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uniqueIdentifier]);

  if (v2)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[ItemStore sharedInstance](&OBJC_CLASS___ItemStore, "sharedInstance"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 queryExecutor]);

    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_10000728C;
    v5[3] = &unk_1000187C8;
    id v6 = *(id *)(a1 + 32);
    __int128 v7 = *(_OWORD *)(a1 + 40);
    [v4 performTransactionBlockAndWait:v5];
  }

id sub_10000728C(uint64_t a1)
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "actions", 0));
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend( *(id *)(a1 + 40),  "_unsafe_insertAction:item:",  *(void *)(*((void *)&v11 + 1) + 8 * (void)v6),  *(void *)(a1 + 32));
        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v4);
  }

  __int128 v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) notification]);
  if (v7)
  {
    id v8 = objc_msgSend(*(id *)(a1 + 40), "_unsafe_insertNotificationForItem:", *(void *)(a1 + 32));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) notification]);
    [v9 setSqlID:v8];
  }

  id result = [*(id *)(a1 + 32) sqlID];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = result != (id)-1LL;
  return result;
}

void sub_100007500(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uniqueIdentifier]);
  sqlite3_bind_text(a2, 1, (const char *)[v4 UTF8String], -1, 0);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) title]);
  if (v5)
  {
    id v6 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) title]);
    sqlite3_bind_text(a2, 2, (const char *)[v6 UTF8String], -1, 0);
  }

  else
  {
    sqlite3_bind_null(a2, 2);
  }

  __int128 v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) informativeText]);

  if (v7)
  {
    id v8 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) informativeText]);
    sqlite3_bind_text(a2, 3, (const char *)[v8 UTF8String], -1, 0);
  }

  else
  {
    sqlite3_bind_null(a2, 3);
  }

  sqlite3_bind_int(a2, 4, (int)[*(id *)(a1 + 32) showInSettings]);
  sqlite3_bind_int(a2, 5, (int)[*(id *)(a1 + 32) displayStyle]);
  sqlite3_bind_int(a2, 6, (int)[*(id *)(a1 + 32) shouldPersistWhenActivated]);
  sqlite3_bind_int(a2, 7, (int)[*(id *)(a1 + 32) shouldPersistWhenDismissed]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _userInfoData]);
  id v36 = v9;
  if (v9)
  {
    id v10 = v9;
    sqlite3_bind_blob(a2, 8, [v10 bytes], (int)objc_msgSend(v10, "length"), 0);
  }

  else
  {
    sqlite3_bind_null(a2, 8);
  }

  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientIdentifier]);

  if (v11)
  {
    id v12 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientIdentifier]);
    sqlite3_bind_text(a2, 9, (const char *)[v12 UTF8String], -1, 0);
  }

  else
  {
    sqlite3_bind_null(a2, 9);
  }

  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) extensionIdentifier]);

  if (v13)
  {
    id v14 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) extensionIdentifier]);
    sqlite3_bind_text(a2, 10, (const char *)[v14 UTF8String], -1, 0);
  }

  else
  {
    sqlite3_bind_null(a2, 10);
  }

  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) groupIdentifier]);

  if (v15)
  {
    id v16 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) groupIdentifier]);
    sqlite3_bind_text(a2, 11, (const char *)[v16 UTF8String], -1, 0);
  }

  else
  {
    sqlite3_bind_null(a2, 11);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) targetBundleIdentifier]);

  if (v17)
  {
    id v18 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) targetBundleIdentifier]);
    sqlite3_bind_text(a2, 12, (const char *)[v18 UTF8String], -1, 0);
  }

  else
  {
    sqlite3_bind_null(a2, 12);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) representingBundlePath]);

  if (v19)
  {
    id v20 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) representingBundlePath]);
    sqlite3_bind_text(a2, 13, (const char *)[v20 UTF8String], -1, 0);
  }

  else
  {
    sqlite3_bind_null(a2, 13);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIconName]);

  if (v21)
  {
    id v22 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) bundleIconName]);
    sqlite3_bind_text(a2, 14, (const char *)[v22 UTF8String], -1, 0);
  }

  else
  {
    sqlite3_bind_null(a2, 14);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) informativeFooterText]);

  if (v23)
  {
    id v24 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) informativeFooterText]);
    sqlite3_bind_text(a2, 15, (const char *)[v24 UTF8String], -1, 0);
  }

  else
  {
    sqlite3_bind_null(a2, 15);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) categoryIdentifier]);

  if (v25)
  {
    id v26 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) categoryIdentifier]);
    sqlite3_bind_text(a2, 16, (const char *)[v26 UTF8String], -1, 0);
  }

  else
  {
    sqlite3_bind_null(a2, 16);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) expirationDate]);

  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) expirationDate]);
    [v28 timeIntervalSince1970];
    sqlite3_bind_double(a2, 17, v29);
  }

  else
  {
    sqlite3_bind_null(a2, 17);
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) accountIdentifier]);

  if (v30)
  {
    id v31 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) accountIdentifier]);
    sqlite3_bind_text(a2, 18, (const char *)[v31 UTF8String], -1, 0);
  }

  else
  {
    sqlite3_bind_null(a2, 18);
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) typeIdentifier]);

  if (v32)
  {
    id v33 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) typeIdentifier]);
    sqlite3_bind_text(a2, 19, (const char *)[v33 UTF8String], -1, 0);
  }

  else
  {
    sqlite3_bind_null(a2, 19);
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) collectionIdentifier]);

  if (v34)
  {
    id v35 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) collectionIdentifier]);
    sqlite3_bind_text(a2, 20, (const char *)[v35 UTF8String], -1, 0);
  }

  else
  {
    sqlite3_bind_null(a2, 20);
  }
}

void sub_100007C44(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) label]);
  sqlite3_bind_text(a2, 1, (const char *)[v4 UTF8String], -1, 0);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) url]);
  id v6 = objc_claimAutoreleasedReturnValue([v5 absoluteString]);
  sqlite3_bind_text(a2, 2, (const char *)[v6 UTF8String], -1, 0);

  __int128 v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) launchActionURL]);
  id v8 = objc_claimAutoreleasedReturnValue([v7 absoluteString]);
  sqlite3_bind_text(a2, 3, (const char *)[v8 UTF8String], -1, 0);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _userInfoData]);
  id v13 = v9;
  if (v9)
  {
    id v10 = v9;
    sqlite3_bind_blob(a2, 4, [v10 bytes], (int)objc_msgSend(v10, "length"), 0);
  }

  else
  {
    sqlite3_bind_null(a2, 4);
  }

  __int128 v11 = *(void **)(a1 + 40);
  if (v11) {
    sqlite3_bind_int64(a2, 5, (sqlite3_int64)[v11 sqlID]);
  }
  else {
    sqlite3_bind_null(a2, 5);
  }
  id v12 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
  sqlite3_bind_text(a2, 6, (const char *)[v12 UTF8String], -1, 0);
}

void sub_10000811C(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) title]);

  if (v4)
  {
    id v5 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) title]);
    sqlite3_bind_text(a2, 2, (const char *)[v5 UTF8String], -1, 0);
  }

  else
  {
    sqlite3_bind_null(a2, 2);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) informativeText]);

  if (v6)
  {
    id v7 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) informativeText]);
    sqlite3_bind_text(a2, 3, (const char *)[v7 UTF8String], -1, 0);
  }

  else
  {
    sqlite3_bind_null(a2, 3);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) unlockActionLabel]);

  if (v8)
  {
    id v9 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) unlockActionLabel]);
    sqlite3_bind_text(a2, 4, (const char *)[v9 UTF8String], -1, 0);
  }

  else
  {
    sqlite3_bind_null(a2, 4);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) previousNotificationActionDate]);
  [v10 timeIntervalSince1970];
  sqlite3_bind_double(a2, 5, v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) activateAction]);
  id v13 = [v12 sqlID];

  if (v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) activateAction]);
    sqlite3_bind_int64(a2, 6, (sqlite3_int64)[v14 sqlID]);
  }

  else
  {
    sqlite3_bind_null(a2, 6);
  }

  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) dismissAction]);
  id v16 = [v15 sqlID];

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) dismissAction]);
    sqlite3_bind_int64(a2, 7, (sqlite3_int64)[v17 sqlID]);
  }

  else
  {
    sqlite3_bind_null(a2, 7);
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) clearAction]);
  id v19 = [v18 sqlID];

  if (v19)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) clearAction]);
    sqlite3_bind_int64(a2, 8, (sqlite3_int64)[v20 sqlID]);
  }

  else
  {
    sqlite3_bind_null(a2, 8);
  }

  [*(id *)(a1 + 40) frequency];
  if (v21 <= 0.0)
  {
    sqlite3_bind_null(a2, 9);
  }

  else
  {
    [*(id *)(a1 + 40) frequency];
    sqlite3_bind_double(a2, 9, v22);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) creationDate]);
  [v23 timeIntervalSince1970];
  sqlite3_bind_double(a2, 10, v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _optionsData]);
  id v29 = v25;
  if (v25)
  {
    id v26 = v25;
    sqlite3_bind_blob(a2, 11, [v26 bytes], (int)objc_msgSend(v26, "length"), 0);
  }

  else
  {
    sqlite3_bind_null(a2, 11);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) subtitleText]);

  if (v27)
  {
    id v28 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) subtitleText]);
    sqlite3_bind_text(a2, 12, (const char *)[v28 UTF8String], -1, 0);
  }

  else
  {
    sqlite3_bind_null(a2, 12);
  }

  if ([*(id *)(a1 + 40) sqlID]) {
    sqlite3_bind_int64(a2, 13, (sqlite3_int64)[*(id *)(a1 + 40) sqlID]);
  }
}

void sub_100008624( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100008644(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[FLSQLiteQuery queryWithString:]( &OBJC_CLASS___FLSQLiteQuery,  "queryWithString:",  @"DELETE FROM items WHERE id=?"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100008750;
  v11[3] = &unk_1000187F0;
  id v12 = *(id *)(a1 + 32);
  [v2 setBindHandler:v11];
  id v3 = *(void **)(*(void *)(a1 + 40) + 8LL);
  id v10 = 0LL;
  unsigned __int8 v4 = [v3 performQuery:v2 error:&v10];
  id v5 = v10;
  id v7 = v5;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v4;
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    uint64_t v8 = _FLLogSystem(v5, v6);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10000E8A8();
    }
  }
}

uint64_t sub_100008750(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, (sqlite3_int64)[*(id *)(a1 + 32) sqlID]);
}

void sub_100008838(_Unwind_Exception *a1)
{
}

id sub_100008850(uint64_t a1)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "_unsafe_insertNotificationForItem:", *(void *)(a1 + 40));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = result != 0LL;
  return result;
}

void sub_1000089D0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_1000089F0(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[FLSQLiteQuery queryWithString:]( &OBJC_CLASS___FLSQLiteQuery,  "queryWithString:",  @"DELETE FROM notifications WHERE item_id=?"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100008AFC;
  v11[3] = &unk_1000187F0;
  id v12 = *(id *)(a1 + 32);
  [v2 setBindHandler:v11];
  id v3 = *(void **)(*(void *)(a1 + 40) + 8LL);
  id v10 = 0LL;
  unsigned __int8 v4 = [v3 performQuery:v2 error:&v10];
  id v5 = v10;
  id v7 = v5;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v4;
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    uint64_t v8 = _FLLogSystem(v5, v6);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10000E8A8();
    }
  }
}

uint64_t sub_100008AFC(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, (sqlite3_int64)[*(id *)(a1 + 32) sqlID]);
}

uint64_t sub_100008C10(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

void sub_100008D70( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100008D94(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100008DA4(uint64_t a1)
{
}

id sub_100008DAC(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100008E0C;
  v3[3] = &unk_1000188B0;
  uint64_t v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 _unsafeSelectFollowUpActionsForItem:0 orActionID:0 rowHandler:v3];
}

id sub_100008E0C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:a2];
}

void sub_100008F70( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_100008F94(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100008FEC;
  v3[3] = &unk_100018900;
  uint64_t v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 _unsafeSelectFollowUpNotificationsWithRowHandler:v3];
}

id sub_100008FEC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:a2];
}

void sub_1000091AC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

id sub_1000091D0(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000922C;
  v4[3] = &unk_100018928;
  v4[4] = a1[6];
  return [v2 _unsafeSelectFollowUpItemsWithUniqueIdentifiers:v1 rowHandler:v4];
}

id sub_10000922C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:a2];
}

void sub_1000094D8(uint64_t a1, sqlite3_stmt *a2)
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        sqlite3_bind_text( a2,  objc_msgSend( *(id *)(a1 + 32),  "indexOfObject:",  *(void *)(*((void *)&v9 + 1) + 8 * (void)v8),  (void)v9)
        + 1,
          (const char *)[*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) UTF8String], -1, 0);
        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }
}

void sub_100009608(uint64_t a1, sqlite3_stmt *a2, _BYTE *a3)
{
  id v6 = -[FLFollowUpItem initWithoutDefaults](objc_alloc(&OBJC_CLASS___FLFollowUpItem), "initWithoutDefaults");
  -[FLFollowUpItem setSqlID:](v6, "setSqlID:", sqlite3_column_int64(a2, 0));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringFromColumn:1 inStatement:a2]);
  -[FLFollowUpItem setUniqueIdentifier:](v6, "setUniqueIdentifier:", v7);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringFromColumn:2 inStatement:a2]);
  -[FLFollowUpItem setTitle:](v6, "setTitle:", v8);

  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringFromColumn:3 inStatement:a2]);
  -[FLFollowUpItem setInformativeText:](v6, "setInformativeText:", v9);

  -[FLFollowUpItem setShowInSettings:](v6, "setShowInSettings:", sqlite3_column_int(a2, 4) != 0);
  -[FLFollowUpItem setDisplayStyle:](v6, "setDisplayStyle:", sqlite3_column_int(a2, 5));
  -[FLFollowUpItem setShouldPersistWhenActivated:](v6, "setShouldPersistWhenActivated:", sqlite3_column_int(a2, 6) != 0);
  -[FLFollowUpItem setShouldPersistWhenDismissed:](v6, "setShouldPersistWhenDismissed:", sqlite3_column_int(a2, 7) != 0);
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dataFromColumn:8 inStatement:a2]);
  -[FLFollowUpItem set_userInfoData:](v6, "set_userInfoData:", v10);

  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringFromColumn:9 inStatement:a2]);
  -[FLFollowUpItem setClientIdentifier:](v6, "setClientIdentifier:", v11);

  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringFromColumn:10 inStatement:a2]);
  -[FLFollowUpItem setExtensionIdentifier:](v6, "setExtensionIdentifier:", v12);

  id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringFromColumn:11 inStatement:a2]);
  -[FLFollowUpItem setGroupIdentifier:](v6, "setGroupIdentifier:", v13);

  id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringFromColumn:12 inStatement:a2]);
  -[FLFollowUpItem setTargetBundleIdentifier:](v6, "setTargetBundleIdentifier:", v14);

  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringFromColumn:13 inStatement:a2]);
  -[FLFollowUpItem setRepresentingBundlePath:](v6, "setRepresentingBundlePath:", v15);

  id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringFromColumn:14 inStatement:a2]);
  -[FLFollowUpItem setBundleIconName:](v6, "setBundleIconName:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringFromColumn:15 inStatement:a2]);
  -[FLFollowUpItem setInformativeFooterText:](v6, "setInformativeFooterText:", v17);

  id v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringFromColumn:16 inStatement:a2]);
  -[FLFollowUpItem setCategoryIdentifier:](v6, "setCategoryIdentifier:", v18);

  id v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dateFromColumn:17 inStatement:a2]);
  -[FLFollowUpItem setExpirationDate:](v6, "setExpirationDate:", v19);

  id v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringFromColumn:18 inStatement:a2]);
  -[FLFollowUpItem setAccountIdentifier:](v6, "setAccountIdentifier:", v20);

  double v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringFromColumn:19 inStatement:a2]);
  -[FLFollowUpItem setTypeIdentifier:](v6, "setTypeIdentifier:", v21);

  double v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringFromColumn:20 inStatement:a2]);
  -[FLFollowUpItem setCollectionIdentifier:](v6, "setCollectionIdentifier:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  double v24 = *(void **)(a1 + 32);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100009A28;
  v30[3] = &unk_100018950;
  id v25 = v23;
  id v31 = v25;
  [v24 _unsafeSelectFollowUpActionsForItem:v6 orActionID:0 rowHandler:v30];
  -[FLFollowUpItem setActions:](v6, "setActions:", v25);
  id v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _unsafeSelectNotificationForFollowUpItem:v6]);
  -[FLFollowUpItem setNotification:](v6, "setNotification:", v26);

  char v29 = 0;
  uint64_t v27 = *(void *)(a1 + 40);
  if (v27)
  {
    (*(void (**)(uint64_t, FLFollowUpItem *, char *))(v27 + 16))(v27, v6, &v29);
    char v28 = v29;
  }

  else
  {
    char v28 = 0;
  }

  *a3 = v28;
}

id sub_100009A28(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void sub_100009B34(uint64_t a1, sqlite3_stmt *a2, uint8_t *a3)
{
  id v6 = objc_alloc_init(&OBJC_CLASS___FLFollowUpNotification);
  objc_msgSend(v6, "setSqlID:", sqlite3_column_int64(a2, 0));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringFromColumn:1 inStatement:a2]);
  [v6 setTitle:v7];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringFromColumn:2 inStatement:a2]);
  [v6 setInformativeText:v8];

  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringFromColumn:3 inStatement:a2]);
  [v6 setUnlockActionLabel:v9];

  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dateFromColumn:4 inStatement:a2]);
  [v6 setPreviousNotificationActionDate:v10];

  sqlite3_int64 v11 = sqlite3_column_int64(a2, 5);
  if (v11 >= 1)
  {
    sqlite3_int64 v12 = v11;
    id v13 = *(void **)(a1 + 32);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_100009E44;
    v31[3] = &unk_100018950;
    id v32 = v6;
    [v13 _unsafeSelectFollowUpActionsForItem:0 orActionID:v12 rowHandler:v31];
  }

  sqlite3_int64 v14 = sqlite3_column_int64(a2, 7);
  if (v14)
  {
    sqlite3_int64 v15 = v14;
    id v16 = *(void **)(a1 + 32);
    id v26 = _NSConcreteStackBlock;
    uint64_t v27 = 3221225472LL;
    char v28 = sub_100009E50;
    char v29 = &unk_100018950;
    id v30 = v6;
    [v16 _unsafeSelectFollowUpActionsForItem:0 orActionID:v15 rowHandler:&v26];
  }

  objc_msgSend(*(id *)(a1 + 32), "intervalFromColumn:inStatement:", 8, a2, v26, v27, v28, v29);
  objc_msgSend(v6, "setFrequency:");
  v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dateFromColumn:9 inStatement:a2]);
  [v6 setCreationDate:v17];

  id v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dataFromColumn:10 inStatement:a2]);
  objc_msgSend(v6, "set_optionsData:", v18);

  id v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringFromColumn:11 inStatement:a2]);
  [v6 setSubtitleText:v19];

  uint64_t v22 = _FLLogSystem(v20, v21);
  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v34 = v6;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Found notification: %@", buf, 0xCu);
  }

  buf[0] = 0;
  uint64_t v24 = *(void *)(a1 + 40);
  if (v24)
  {
    (*(void (**)(uint64_t, id, uint8_t *))(v24 + 16))(v24, v6, buf);
    uint8_t v25 = buf[0];
  }

  else
  {
    uint8_t v25 = 0;
  }

  *a3 = v25;
}

id sub_100009E44(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setActivateAction:a2];
}

id sub_100009E50(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setClearAction:a2];
}

void sub_10000A06C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

uint64_t sub_10000A098(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, (sqlite3_int64)[*(id *)(a1 + 32) sqlID]);
}

void sub_10000A0C8(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = objc_alloc_init(&OBJC_CLASS___FLFollowUpNotification);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setSqlID:", sqlite3_column_int64(a2, 0));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringFromColumn:1 inStatement:a2]);
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setTitle:v7];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringFromColumn:2 inStatement:a2]);
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setInformativeText:v8];

  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringFromColumn:3 inStatement:a2]);
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setUnlockActionLabel:v9];

  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dateFromColumn:4 inStatement:a2]);
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setPreviousNotificationActionDate:v10];

  sqlite3_int64 v11 = sqlite3_column_int64(a2, 5);
  if (v11 >= 1)
  {
    sqlite3_int64 v12 = v11;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10000A348;
    v21[3] = &unk_1000188B0;
    id v13 = *(void **)(a1 + 32);
    v21[4] = *(void *)(a1 + 40);
    [v13 _unsafeSelectFollowUpActionsForItem:0 orActionID:v12 rowHandler:v21];
  }

  sqlite3_int64 v14 = sqlite3_column_int64(a2, 7);
  if (v14)
  {
    sqlite3_int64 v15 = v14;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10000A35C;
    v20[3] = &unk_1000188B0;
    id v16 = *(void **)(a1 + 32);
    v20[4] = *(void *)(a1 + 40);
    [v16 _unsafeSelectFollowUpActionsForItem:0 orActionID:v15 rowHandler:v20];
  }

  [*(id *)(a1 + 32) intervalFromColumn:8 inStatement:a2];
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setFrequency:");
  v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dateFromColumn:9 inStatement:a2]);
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setCreationDate:v17];

  id v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dataFromColumn:10 inStatement:a2]);
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "set_optionsData:", v18);

  id v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringFromColumn:11 inStatement:a2]);
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setSubtitleText:v19];
}

id sub_10000A348(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setActivateAction:a2];
}

id sub_10000A35C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setClearAction:a2];
}

uint64_t sub_10000A51C(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = *(void **)(a1 + 32);
  if (v4) {
    id v5 = [v4 sqlID];
  }
  else {
    id v5 = *(id *)(a1 + 40);
  }
  return sqlite3_bind_int64(a2, 1, (sqlite3_int64)v5);
}

void sub_10000A55C(uint64_t a1, sqlite3_stmt *a2, _BYTE *a3)
{
  id v6 = objc_alloc_init(&OBJC_CLASS___FLFollowUpAction);
  objc_msgSend(v6, "setSqlID:", sqlite3_column_int64(a2, 0));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringFromColumn:1 inStatement:a2]);
  [v6 setLabel:v7];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) urlFromColumn:2 inStatement:a2]);
  [v6 setUrl:v8];

  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) urlFromColumn:3 inStatement:a2]);
  [v6 setLaunchActionURL:v9];

  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dataFromColumn:4 inStatement:a2]);
  objc_msgSend(v6, "set_userInfoData:", v10);

  sqlite3_int64 v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringFromColumn:5 inStatement:a2]);
  [v6 setIdentifier:v11];

  char v14 = 0;
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12)
  {
    (*(void (**)(uint64_t, id, char *))(v12 + 16))(v12, v6, &v14);
    char v13 = v14;
  }

  else
  {
    char v13 = 0;
  }

  *a3 = v13;
}

void sub_10000A820( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10000A83C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10000A88C(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___NotificationController);
  id v2 = (void *)qword_10001E3A0;
  qword_10001E3A0 = (uint64_t)v1;

  id v3 = objc_alloc_init(&OBJC_CLASS___FLItemStoreDecorator);
  id v4 = *(void **)(qword_10001E3A0 + 8);
  *(void *)(qword_10001E3A0 + _Block_object_dispose(va, 8) = v3;
}

id sub_10000A9C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = _FLLogSystem(a1, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Processing updating activities", v6, 2u);
  }

  return [*(id *)(a1 + 32) updateRepeatingActivityState];
}

void sub_10000AA98(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v3, _xpc_event_key_name));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v7 = _FLLogSystem(v5, v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    id v20 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "XPC event (%@) handler called.",  (uint8_t *)&v19,  0xCu);
  }

  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "com.apple.springboard.lockstate"));
  unsigned int v10 = [v5 isEqual:v9];

  if (v10)
  {
    goto LABEL_8;
  }

  sqlite3_int64 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "com.apple.mobile.keybagd.lock_status"));
  unsigned int v12 = [v5 isEqual:v11];

  if (v12)
  {
    sqlite3_int64 v15 = (void *)objc_claimAutoreleasedReturnValue(+[FLEnvironment currentEnvironment](&OBJC_CLASS___FLEnvironment, "currentEnvironment"));
    unsigned __int8 v16 = [v15 isUnlocked];

    if ((v16 & 1) == 0) {
LABEL_8:
    }
      [*(id *)(a1 + 32) _processPendingNotifications:0];
  }

  else
  {
    uint64_t v17 = _FLLogSystem(v13, v14);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "No special handling for XPC event: %@",  (uint8_t *)&v19,  0xCu);
    }
  }

LABEL_12:
}

BOOL sub_10000AD84(id a1, FLFollowUpItem *a2, NSDictionary *a3)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[FLFollowUpItem notification](v3, "notification"));
  [v4 frequency];
  if (v5 > 0.0)
  {
    LOBYTE(v7) = 1;
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[FLFollowUpItem notification](v3, "notification"));
    if ([v6 shouldDeliverNotification])
    {
      LOBYTE(v7) = 1;
    }

    else
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[FLFollowUpItem notification](v3, "notification"));
      if (v8)
      {
        __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(-[FLFollowUpItem expirationDate](v3, "expirationDate"));
        if (v9) {
          unsigned int v7 = -[FLFollowUpItem isExpired](v3, "isExpired") ^ 1;
        }
        else {
          LOBYTE(v7) = 0;
        }
      }

      else
      {
        LOBYTE(v7) = 0;
      }
    }
  }

  return v7;
}

LABEL_6:
  __int128 v9 = v5[3];
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[FLEnvironment currentEnvironment](&OBJC_CLASS___FLEnvironment, "currentEnvironment"));
  [v10 oneDayTimeInterval];
  if (v9 <= v11)
  {
LABEL_9:

    goto LABEL_10;
  }

  unsigned int v12 = *((unsigned __int8 *)v18 + 24);

  if (v12)
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[FLEnvironment currentEnvironment](&OBJC_CLASS___FLEnvironment, "currentEnvironment"));
    [v10 oneDayTimeInterval];
    *((void *)v22 + 3) = v13;
    goto LABEL_9;
  }

LABEL_10:
  uint64_t v14 = v22[3];
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v14;
}

void sub_10000AFEC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000B01C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000B02C(uint64_t a1)
{
}

void sub_10000B034(void *a1, void *a2)
{
  id v33 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v33 notification]);
  [v3 frequency];
  if (v4 > 0.0)
  {
    double v5 = *(double *)(*(void *)(a1[4] + 8LL) + 24LL);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v33 notification]);
    [v6 frequency];
    if (v5 <= v7)
    {
      double v9 = *(double *)(*(void *)(a1[4] + 8LL) + 24LL);

      uint64_t v8 = v33;
      if (v9 != 0.0) {
        goto LABEL_7;
      }
    }

    else
    {

      uint64_t v8 = v33;
    }

    id v3 = (void *)objc_claimAutoreleasedReturnValue([v8 notification]);
    [v3 frequency];
    *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = v10;
  }

  uint64_t v8 = v33;
LABEL_7:
  uint64_t v11 = *(void *)(a1[5] + 8LL);
  if (*(_BYTE *)(v11 + 24))
  {
    *(_BYTE *)(v11 + 24) = 1;
  }

  else
  {
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v33 expirationDate]);
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = v12 != 0LL;

    uint64_t v8 = v33;
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 expirationDate]);
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void **)(*(void *)(a1[6] + 8LL) + 40LL);
    if (v15)
    {
      unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v33 _midnightAdjustedDate]);
      id v17 = [v15 compare:v16];

      if (v17 != (id)1) {
        goto LABEL_16;
      }
    }

    else
    {
    }

    uint64_t v18 = objc_claimAutoreleasedReturnValue([v33 _midnightAdjustedDate]);
    uint64_t v19 = *(void *)(a1[6] + 8LL);
    id v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }

LABEL_16:
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v33 notification]);
  [v21 frequency];
  if (v22 <= 0.0) {
    goto LABEL_25;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue([v33 notification]);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 previousNotificationActionDate]);

  if (v24)
  {
    uint8_t v25 = (void *)objc_claimAutoreleasedReturnValue([v33 notification]);
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 previousNotificationActionDate]);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v33 notification]);
    [v27 frequency];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "dateByAddingTimeInterval:"));

    char v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    if ([v21 compare:v28] == (id)1)
    {
      char v29 = *(void **)(*(void *)(a1[6] + 8LL) + 40LL);
      if (v29)
      {
        id v30 = [v29 compare:v21];

        if (v30 != (id)1) {
          goto LABEL_25;
        }
      }

      else
      {
      }

      uint64_t v31 = *(void *)(a1[6] + 8LL);
      id v32 = v21;
      char v28 = *(void **)(v31 + 40);
      *(void *)(v31 + 40) = v32;
    }

LABEL_25:
  }
}

void sub_10000B48C(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  uint64_t v6 = _FLLogSystem(state, v5);
  double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (state == 2)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "XPC activity says that it's time post notifications!",  buf,  2u);
    }

    BOOL v9 = xpc_activity_set_state(v3, 4LL);
    if (!v9)
    {
      uint64_t v11 = _FLLogSystem(v9, v10);
      unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10000EBD0(v12, v13, v14, v15, v16, v17, v18, v19);
      }
    }

    id v20 = *(void **)(a1 + 32);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10000B620;
    v22[3] = &unk_100018AC8;
    v23 = v3;
    [v20 _processPendingNotifications:v22];
    double v7 = v23;
  }

  else if (v8)
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", state));
    *(_DWORD *)buf = 138412290;
    uint8_t v25 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "XPC activity registration complete. State: %@.",  buf,  0xCu);
  }
}

void sub_10000B620(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _FLLogSystem(a1, a2);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a2));
    int v18 = 138412290;
    uint64_t v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Posted %@ notifications", (uint8_t *)&v18, 0xCu);
  }

  BOOL v7 = xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5LL);
  if (!v7)
  {
    uint64_t v9 = _FLLogSystem(v7, v8);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10000EC00(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }

id sub_10000B9E4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _deliverNotificationsForItem:a2 forceDelivery:0];
}

id sub_10000BB8C(uint64_t a1, char a2)
{
  id result = [*(id *)(a1 + 32) shouldDeliverNotification];
  return result;
}

void sub_10000BD90(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 notification]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 activateAction]);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  LODWORD(v4) = [v4 isEqualToString:v7];

  if ((_DWORD)v4)
  {
    [*(id *)(a1 + 40) _handleActivateActionFromSource:*(void *)(a1 + 48) item:v3];
    goto LABEL_10;
  }

  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 notification]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 clearAction]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
  if ([v8 isEqualToString:v11])
  {

LABEL_6:
    uint64_t v15 = *(void **)(a1 + 40);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v3 notification]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 clearAction]);
    [v15 _handleExtensionAction:v17 forItem:v3];

    goto LABEL_10;
  }

  unsigned __int8 v12 = [*(id *)(a1 + 32) isEqualToString:@"com.apple.followup.clearActionIdentifier"];

  if ((v12 & 1) != 0) {
    goto LABEL_6;
  }
  uint64_t v18 = _FLLogSystem(v13, v14);
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v20 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Activated notification, but it did not match identifier... bummer",  v20,  2u);
  }

LABEL_10:
}

void sub_10000C044(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isHSA2LoginItem] & 1) == 0
    && ([v3 isHSA2PasswordResetItem] & 1) == 0)
  {
    [*(id *)(a1 + 32) _handleActivateActionFromSource:*(void *)(a1 + 40) item:v3];
  }
}

void sub_10000C288(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[FLTelemetryFactory sharedTelemetryController]( &OBJC_CLASS___FLTelemetryFactory,  "sharedTelemetryController"));
  [v4 captureActionForItem:v3 withEvent:1 source:*(void *)(a1 + 40)];

  uint64_t v5 = *(void **)(a1 + 32);
  id v7 = (id)objc_claimAutoreleasedReturnValue([v3 notification]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v7 clearAction]);
  [v5 _handleExtensionAction:v6 forItem:v3];
}

void sub_10000C42C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[FLTelemetryFactory sharedTelemetryController]( &OBJC_CLASS___FLTelemetryFactory,  "sharedTelemetryController"));
  [v4 captureActionForItem:v3 withEvent:1 source:*(void *)(a1 + 40)];

  uint64_t v5 = *(void **)(a1 + 32);
  id v7 = (id)objc_claimAutoreleasedReturnValue([v3 notification]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v7 clearAction]);
  [v5 _handleExtensionAction:v6 forItem:v3];
}

void sub_10000C6BC(uint64_t a1)
{
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  id v26 = sub_10000B01C;
  uint64_t v27 = sub_10000B02C;
  id v2 = objc_alloc(&OBJC_CLASS___FLHeadlessExtensionLoader);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) extensionIdentifier]);
  id v28 = [v2 initWithIdentifier:v3];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([(id)v24[5] remoteInterface]);
  if (v5)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10000C850;
    v17[3] = &unk_100018B68;
    uint64_t v22 = *(void *)(a1 + 64);
    int8x16_t v16 = *(int8x16_t *)(a1 + 32);
    id v6 = (id)v16.i64[0];
    int8x16_t v18 = vextq_s8(v16, v16, 8uLL);
    id v19 = *(id *)(a1 + 48);
    uint64_t v21 = &v23;
    id v20 = *(id *)(a1 + 56);
    [v5 followUpPerformUpdateWithCompletionHandler:v17];
  }

  else
  {
    uint64_t v7 = _FLLogSystem(0LL, v4);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10000EC94(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }

  _Block_object_dispose(&v23, 8);
}

void sub_10000C834(_Unwind_Exception *a1)
{
}

void sub_10000C850(uint64_t a1, uint64_t a2)
{
  if (a2 != 1 && *(void *)(a1 + 72) == 5LL) {
    [*(id *)(a1 + 32) _processFollowUpItemNotificationWithExtension:*(void *)(a1 + 40) activatedAction:*(void *)(a1 + 48)];
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0LL;
}

void sub_10000CAD0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10000CAF0(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v7 = v5;
  if ((a2 & 1) == 0)
  {
    uint64_t v8 = _FLLogSystem(v5, v6);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10000ECC4((uint64_t)v7, v9, v10, v11, v12, v13, v14, v15);
    }
  }

  uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = 0LL;
}

void sub_10000CDA0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = _FLLogSystem(v3, v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_10000ED28(a1, (uint64_t)v3, v6);
  }
}

void sub_10000CEC0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10000D0B0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10000D0C8(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = sqlite3_column_text(a2, 0);
  if (v3)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v3));
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v4 integerValue];
  }

void sub_10000D298( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

id sub_10000D2B8(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  uint64_t v1 = *(void **)(a1 + 32);
  else {
    return [v1 _createCleanCurrentDatabase];
  }
}

void sub_10000E064(sqlite3_context *a1, uint64_t a2, sqlite3_value **a3)
{
  int v4 = a2;
  uint64_t v6 = _FLLogSystem(a1, a2);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Starting launch arguments conversion", buf, 2u);
  }

  if (v4 == 1)
  {
    if (sqlite3_value_type(*a3) == 5)
    {
      sqlite3_result_null(a1);
    }

    else
    {
      uint64_t v8 = sqlite3_value_blob(*a3);
      uint64_t v9 = +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v8, sqlite3_value_bytes(*a3));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      uint64_t v20 = FLFollowUpActionLaunchArgumentsKey;
      uint64_t v21 = v10;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
      uint64_t v18 = 0LL;
      uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v11,  200LL,  0LL,  &v18));
      uint64_t v14 = (void *)v12;
      if (v18)
      {
        sqlite3_result_error(a1, "Bad data.", 1);
      }

      else
      {
        uint64_t v15 = _FLLogSystem(v12, v13);
        uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Row migration completed", buf, 2u);
        }

        id v17 = v14;
        sqlite3_result_blob64(a1, [v17 bytes], (sqlite3_uint64)objc_msgSend(v17, "length"), 0);
      }
    }
  }

  else
  {
    sqlite3_result_error(a1, "Improper number of arguments.", 1);
  }

void sub_10000E47C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

uint64_t start()
{
  uint64_t v0 = objc_autoreleasePoolPush();
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___FollowUpServer);
  -[FollowUpServer start](v1, "start");
  objc_autoreleasePoolPop(v0);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  [v2 run];

  return 1LL;
}

void sub_10000E4EC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Creating path for database...", v1, 2u);
}

void sub_10000E52C(uint64_t *a1, os_log_s *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Database %@ wiped...", (uint8_t *)&v3, 0xCu);
}

void sub_10000E5A4(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "%@", (uint8_t *)&v2, 0xCu);
}

void sub_10000E618(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%@: Failed to insert follow up item into database",  (uint8_t *)&v2,  0xCu);
  sub_100007010();
}

void sub_10000E688(unint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 134218240;
  uint64_t v4 = a2;
  __int16 v5 = 2048;
  double v6 = (double)a1 / 1000000000.0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "END [%llu] %fs: FetchDecoratedItems",  (uint8_t *)&v3,  0x16u);
  sub_100007010();
}

void sub_10000E718(uint64_t a1, os_log_s *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "BEGIN [%llu]: FetchDecoratedItems",  (uint8_t *)&v2,  0xCu);
  sub_100007010();
}

void sub_10000E788()
{
}

void sub_10000E7E8()
{
}

void sub_10000E848()
{
}

void sub_10000E8A8()
{
}

void sub_10000E908()
{
}

void sub_10000E968( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000E9D4(uint64_t a1, os_log_s *a2, double a3)
{
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "END [%llu] %fs: SelectItemsByIdentifier",  (uint8_t *)&v3,  0x16u);
  sub_100007010();
}

void sub_10000EA50()
{
}

void sub_10000EAB0()
{
}

void sub_10000EB10()
{
}

void sub_10000EB70()
{
}

void sub_10000EBD0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000EC00( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000EC30( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000EC94( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000ECC4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000ED28(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%@: XPC Error from client delegate while trying to send an HSA2 login activation callback - %@",  (uint8_t *)&v4,  0x16u);
  sub_100007010();
}

void sub_10000EDAC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to create migrator function", v1, 2u);
  sub_10000CED0();
}

void sub_10000EDE8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000EE18( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

id objc_msgSend_xpcConnectionForClientWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnectionForClientWithMachServiceName:");
}
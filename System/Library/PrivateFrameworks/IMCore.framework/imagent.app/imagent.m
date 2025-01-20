void sub_1000058A4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMDReplayController sharedInstance](&OBJC_CLASS___IMDReplayController, "sharedInstance"));
  [v2 restoreDefaultStoreControllerInstance];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringByAppendingString:@"-wal"]);
  [v3 removeItemAtPath:v4 error:0];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringByAppendingString:@"-shm"]);
  [v5 removeItemAtPath:v6 error:0];

  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  [v7 removeItemAtPath:*(void *)(a1 + 32) error:0];
}

void sub_100006E70()
{
  if (qword_100071030 != -1) {
    dispatch_once(&qword_100071030, &stru_100065340);
  }
}

void sub_100006E98(id a1)
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  for (uint64_t i = 0LL; i != 7; ++i)
  {
    int v3 = dword_10004A168[i];
    qword_100071038 = (uint64_t)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_signal,  v3,  0LL,  global_queue);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100006F88;
    handler[3] = &unk_100065360;
    int v6 = v3;
    dispatch_source_set_event_handler((dispatch_source_t)qword_100071038, handler);
    v4 = (dispatch_object_s *)qword_100071038;
    qword_100070F50[i] = qword_100071038;
    dispatch_resume(v4);
    signal(v3, (void (__cdecl *)(int))1);
  }
}

void sub_100006F88(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000703C;
  block[3] = &unk_100065360;
  int v3 = v1;
  dispatch_async(&_dispatch_main_q, block);
}

void sub_100006FE4(int a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000703C;
  block[3] = &unk_100065360;
  int v2 = a1;
  dispatch_async(&_dispatch_main_q, block);
}

void sub_10000703C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 32);
  if (v1 <= 14)
  {
    if (v1 == 13)
    {
      signal(2, (void (__cdecl *)(int))sub_100006FE4);
      return;
    }

    if (v1 != 1 && v1 != 3) {
      return;
    }
LABEL_15:
    _IMLog(@"Quit - notifying about shutdown");
    -[NSNotificationCenter __mainThreadPostNotificationName:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "__mainThreadPostNotificationName:object:",  @"IMDaemonShutdownNotification",  0LL);
    _IMLog(@"Quit - shutting down daemon");
    exit(0);
  }

  switch(v1)
  {
    case 30:
      id v5 = objc_msgSend( objc_alloc((Class)IMWeakLinkClass(@"CSSearchableIndex", @"CoreSpotlight")),  "initWithName:",  @"com.apple.MobileSMS");
      -[IMDSpotlightIndexDelegate searchableIndex:reindexAllSearchableItemsWithAcknowledgementHandler:]( +[IMDSpotlightIndexDelegate sharedInstance](&OBJC_CLASS___IMDSpotlightIndexDelegate, "sharedInstance"),  "searchableIndex:reindexAllSearchableItemsWithAcknowledgementHandler:",  v5,  &stru_100065380);

      return;
    case 31:
      uint64_t v2 = _IMLog(@"Reloading Logging Settings");
      uint64_t v3 = _IMSyncLoggingSettings(v2);
      MarcoSyncLoggingsPreferences(v3);
      return;
    case 15:
      goto LABEL_15;
  }

LABEL_27:
}

void sub_100007EC4(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x100007E88LL);
  }

  _Unwind_Resume(a1);
}

void sub_100009C64(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsIndex:", objc_msgSend(v3, "messagePartIndex")))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 messagePartBody]);

    if (v4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMDDatabase database](&OBJC_CLASS___IMDDatabase, "database"));
      v8 = (void *)objc_claimAutoreleasedReturnValue([v3 messagePartBody]);
      v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) guid]);
      [v7 storeRecoverableMessagePartWithBody:v8 forMessageWithGUID:v9 deleteDate:*(void *)(a1 + 48)];
    }

    else if (IMOSLoggingEnabled(v5, v6))
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory("Warning");
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Recently Deleted | Mardid: deleting message part: found no message-part body-text to store for recovery",  v12,  2u);
      }
    }
  }
}

id sub_10000AC00(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) loadedChats:a2 queryID:*(void *)(a1 + 40)];
}

id sub_10000AE34(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) loadedChats:a2 queryID:*(void *)(a1 + 40)];
}

void sub_10000B00C(uint64_t a1, uint64_t a2)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _chatDictionariesWithLastMessageRecordDateFromDictionaries:a2]);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_10000B28C(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 firstObject]);
  if (v3)
  {
    id v5 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 date]);
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:@"lastMessageRecordDateForQuery"];

    id v3 = v5;
  }
}

id sub_10000B3EC(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) loadedChats:a2 queryID:*(void *)(a1 + 40)];
}

id sub_10000B608(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) loadedChats:a2 queryID:*(void *)(a1 + 40)];
}

id sub_10000B824(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) loadedChats:a2 queryID:*(void *)(a1 + 40)];
}

id sub_10000BAD4(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) loadedChats:a2 queryID:*(void *)(a1 + 40)];
}

void sub_10000BFDC(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue([a2 ID]);
  [v2 addObject:v3];
}

BOOL sub_10000C618(id a1, id a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___IMAssociatedMessageItem);
  char isKindOfClass = objc_opt_isKindOfClass(v2, v3);

  return (isKindOfClass & 1) == 0;
}

uint64_t sub_10000DEF4(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, 1LL, a2);
  }
  return result;
}

LABEL_13:
    }
  }

  else if (IMOSLoggingEnabled(v8, v9))
  {
    v21 = OSLogHandleForIMFoundationCategory("UnreadMessageCount");
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      LOWORD(v22) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "Not adding unread message count or last failed message date to setup info due to missing capability.",  (uint8_t *)&v22,  2u);
    }

    goto LABEL_13;
  }
}
}
}

    uint64_t result = sub_10002F34C(a5, a6);
    *a1 = v13;
    return result;
  }

  if ((a6 & 0x1000000000000000LL) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000LL) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }

  v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StringTesting.swift",  25LL,  2,  151LL,  0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawPointer.initializeMemory overlapping range",  58LL,  2LL,  "Swift/UnsafeRawPointer.swift",  28LL,  v14,  1173LL,  0);
    __break(1u);
    return result;
  }

void sub_100010448(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x10001040CLL);
  }

  _Unwind_Resume(a1);
}

LABEL_7:
}

void sub_100010CE0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100010CF8(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:IMClientSetupContextNumberOfChatsToLoad]);
  uint64_t v7 = (uint64_t)[v6 integerValue];

  if (v7 >= 1)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v7;
    *a4 = 1;
  }

void sub_100010E04(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:IMClientSetupContextPinnedChatIdentifiers]);
  if (v4)
  {
    id v5 = v4;
    [*(id *)(a1 + 32) addObjectsFromArray:v4];
    v4 = v5;
  }
}

void sub_100011A04(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 32))
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v5 replyProxy]);
    [v4 markedAsReadForMessageGUID:*(void *)(a1 + 40) success:a2 queryID:*(void *)(a1 + 32)];
  }

void sub_1000133C8(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x10001332CLL);
  }

  _Unwind_Resume(a1);
}

void sub_100013808(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (IMOSLoggingEnabled(v3, v4))
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Finished downloading attachment batch.", buf, 2u);
    }
  }

  id v7 = [*(id *)(a1 + 32) _broadcastedUncachedAttachmentCountForChatWithGUID:*(void *)(a1 + 40) chatIdentifiers:*(void *)(a1 + 48) services:*(void *)(a1 + 56) broadcaster:*(void *)(a1 + 64)];
  v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 8) objectForKey:*(void *)(a1 + 72)]);
  signed int v9 = [v8 intValue];

  uint64_t v12 = v9;
  uint64_t v13 = *(void *)(a1 + 80);
  if (v7 == (id)v9)
  {
    ++v13;
    uint64_t v14 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v7));
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 80)));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v13));
      uint64_t v19 = *(void *)(a1 + 72);
      *(_DWORD *)buf = 138413058;
      v63 = v16;
      __int16 v64 = 2112;
      v65 = v17;
      __int16 v66 = 2112;
      v67 = v18;
      __int16 v68 = 2112;
      uint64_t v69 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Purged count did not change and is still %@, changing retry count from %@ to %@ for key %@",  buf,  0x2Au);
    }
  }

  else
  {
    v20 = *(void **)(*(void *)(a1 + 32) + 8LL);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v7));
    [v20 setObject:v21 forKey:*(void *)(a1 + 72)];

    uint64_t v24 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v12));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v7));
      v27 = *(void **)(a1 + 72);
      *(_DWORD *)buf = 138412802;
      v63 = v25;
      __int16 v64 = 2112;
      v65 = v26;
      __int16 v66 = 2112;
      v67 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Purged count changed from %@ to %@ for key %@",  buf,  0x20u);
    }
  }

LABEL_14:
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[IMDBroadcastController sharedProvider](&OBJC_CLASS___IMDBroadcastController, "sharedProvider"));
  v29 = (void *)objc_claimAutoreleasedReturnValue([v28 broadcasterForChatListeners]);
  [v29 downloadedPurgedAssetBatchForChatIDs:*(void *)(a1 + 48) completedTransferGUIDs:v3];

  id v30 = [*(id *)(a1 + 32) _shouldContinueDownloadingPurgedAttachments:v13];
  if (v7) {
    int v32 = (int)v30;
  }
  else {
    int v32 = 0;
  }
  if (v32 == 1)
  {
    if (IMOSLoggingEnabled(v30, v31))
    {
      uint64_t v33 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v35 = *(void **)(a1 + 48);
        v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  *(unsigned __int8 *)(a1 + 88)));
        v37 = *(void **)(a1 + 56);
        uint64_t v38 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138413058;
        v63 = v35;
        __int16 v64 = 2112;
        v65 = v36;
        __int16 v66 = 2112;
        v67 = v37;
        __int16 v68 = 2112;
        uint64_t v69 = v38;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_INFO,  "Detected more purged attachments, downloading next batch for chatIdentifiers %@ style %@ services %@ chat guid %@.",  buf,  0x2Au);
      }
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100013EA8;
    block[3] = &unk_100065550;
    void block[4] = *(void *)(a1 + 32);
    id v56 = *(id *)(a1 + 48);
    char v61 = *(_BYTE *)(a1 + 88);
    id v57 = *(id *)(a1 + 56);
    id v58 = *(id *)(a1 + 40);
    uint64_t v60 = v13;
    id v59 = *(id *)(a1 + 64);
    dispatch_async(&_dispatch_main_q, block);
  }

  else
  {
    if (v7)
    {
      id v30 = (id)IMOSLoggingEnabled(v30, v31);
      if ((_DWORD)v30)
      {
        uint64_t v39 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
        v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v13));
          v42 = *(void **)(a1 + 48);
          v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  *(unsigned __int8 *)(a1 + 88)));
          uint64_t v44 = *(void *)(a1 + 56);
          uint64_t v45 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138413314;
          v63 = v41;
          __int16 v64 = 2112;
          v65 = v42;
          __int16 v66 = 2112;
          v67 = v43;
          __int16 v68 = 2112;
          uint64_t v69 = v44;
          __int16 v70 = 2112;
          uint64_t v71 = v45;
          _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_INFO,  "Detected more purged attachments but not downloading next batch becaused reached max retry count %@ for chat Identifiers %@ style %@ services %@ chat guid %@.",  buf,  0x34u);
        }
      }
    }

    if (IMOSLoggingEnabled(v30, v31))
    {
      uint64_t v46 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
      v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        v48 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        v63 = v48;
        _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_INFO,  "No more attachments to download, downloading completed for chatIDs: %@",  buf,  0xCu);
      }
    }

    v49 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatUtilities sharedUtilities](&OBJC_CLASS___IMDChatUtilities, "sharedUtilities"));
    v50 = (void *)objc_claimAutoreleasedReturnValue([v49 currentlyDownloadingSet]);
    v51 = (void *)(a1 + 48);
    v52 = (void *)objc_claimAutoreleasedReturnValue( +[IMDChatUtilities _stringForChatIDs:onServices:]( &OBJC_CLASS___IMDChatUtilities,  "_stringForChatIDs:onServices:",  *(void *)(a1 + 48),  *(void *)(a1 + 56)));
    [v50 removeObject:v52];

    [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 72)];
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[IMDBroadcastController sharedProvider](&OBJC_CLASS___IMDBroadcastController, "sharedProvider"));
    v54 = (void *)objc_claimAutoreleasedReturnValue([v53 broadcasterForChatListeners]);
    [v54 finishedDownloadingPurgedAssetsForChatIDs:*v51];
  }
}

void sub_100013E2C(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x100013B84LL);
  }

  _Unwind_Resume(a1);
}

id sub_100013EA8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _downloadPurgedAttachmentsForIDs:*(void *)(a1 + 40) style:*(unsigned __int8 *)(a1 + 80) onServices:*(void *)(a1 + 48) chatID:*(void *)(a1 + 56) retryCount:*(void *)(a1 + 72) broadcaster:*(void *)(a1 + 64)];
}

void sub_100014224(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (IMOSLoggingEnabled(v3, v4))
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory("Daemon");
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Replying with groupIDsToGroupPhotos dictionary: %@",  (uint8_t *)&v8,  0xCu);
    }
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

void sub_100016298(id a1)
{
  off_100071048 = (_UNKNOWN *)IMWeakLinkSymbol("RFBStartAppleIDScreenSharingConnection", @"ScreenSharing");
}

void sub_1000168F4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_1000195BC(id a1)
{
  int v1 = objc_alloc_init(&OBJC_CLASS___IMDChatUtilities);
  id v2 = (void *)qword_100071060;
  qword_100071060 = (uint64_t)v1;
}

void sub_100019808(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v50 = a3;
  v51 = v5;
  v52 = v6;
  if (![v5 count])
  {
    uint64_t v45 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "No items to store, ignoring", buf, 2u);
    }

LABEL_41:
    goto LABEL_51;
  }

  if (![v6 length])
  {
    uint64_t v47 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "No chat GUID to store in, ignoring", buf, 2u);
    }

    goto LABEL_41;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  v53 = (void *)objc_claimAutoreleasedReturnValue([v9 existingChatWithGUID:v6]);

  int v12 = IMOSLoggingEnabled(v10, v11);
  if (v53)
  {
    if (v12)
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory("History");
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v60 = v5;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "= Starting to store items: %@", buf, 0xCu);
      }
    }

    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    id v15 = v5;
    v16 = 0LL;
    id v17 = [v15 countByEnumeratingWithState:&v54 objects:v58 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v55;
      do
      {
        for (uint64_t i = 0LL; i != v17; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v55 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)i);
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v20 guid]);
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v21 itemWithGUID:v22]);

          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
          v25 = (void *)objc_claimAutoreleasedReturnValue([v24 storeItem:v20 forceReplace:0]);

          if (!v25)
          {
            uint64_t v35 = OSLogHandleForIMFoundationCategory("History");
            v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v60 = 0LL;
              _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_INFO,  " Skipped item, didn't store: %@",  buf,  0xCu);
            }

            goto LABEL_30;
          }

          if (v16 || (v28 = objc_alloc_init(&OBJC_CLASS___NSMutableArray), (v16 = v28) != 0LL)) {
            CFArrayAppendValue(v16, v25);
          }
          if (!v23)
          {
            if (IMOSLoggingEnabled(v28, v29))
            {
              uint64_t v30 = OSLogHandleForIMFoundationCategory("History");
              uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
              if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                id v60 = v25;
                __int16 v61 = 2112;
                id v62 = v53;
                _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_INFO,  "  Assocating item: %@ to chat: %@",  buf,  0x16u);
              }
            }

            int v32 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
            [v32 addItem:v25 toChat:v53];
          }

          if (IMOSLoggingEnabled(v28, v29))
          {
            uint64_t v33 = OSLogHandleForIMFoundationCategory("History");
            v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              id v60 = v25;
              __int16 v61 = 2112;
              id v62 = v53;
              _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_INFO,  " Stored item: %@   in chat: %@",  buf,  0x16u);
            }

  __break(1u);
  return result;
}

  uint64_t result = swift_release(v8);
  *id v3 = v10;
  return result;
}

LABEL_30:
          }
      }

      v16 = [v15 countByEnumeratingWithState:&v53 objects:v62 count:16];
    }

    while (v16);
  }

  if (IMOSLoggingEnabled(v37, v38))
  {
    uint64_t v39 = OSLogHandleForIMFoundationCategory("History");
    v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v59 = v14;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "Parent GUID set %@", buf, 0xCu);
    }
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  id v50 = 0u;
  v41 = v14;
  v42 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v41,  "countByEnumeratingWithState:objects:count:",  &v49,  v57,  16LL);
  if (v42)
  {
    v43 = *(void *)v50;
    do
    {
      for (j = 0LL; j != v42; j = (char *)j + 1)
      {
        if (*(void *)v50 != v43) {
          objc_enumerationMutation(v41);
        }
        uint64_t v45 = *(void *)(*((void *)&v49 + 1) + 8LL * (void)j);
        uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
        uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v46 messageWithGUID:v45]);

        if (v47) {
          [v3 insertObject:v47 atIndex:0];
        }
      }

      v42 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v41,  "countByEnumeratingWithState:objects:count:",  &v49,  v57,  16LL);
    }

    while (v42);
  }
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

LABEL_31:
        }

        id v17 = [v15 countByEnumeratingWithState:&v54 objects:v58 count:16];
      }

      while (v17);
    }

    if (IMOSLoggingEnabled(v36, v37))
    {
      uint64_t v38 = OSLogHandleForIMFoundationCategory("History");
      uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "= Done storing items", buf, 2u);
      }
    }

    v40 = (void *)objc_claimAutoreleasedReturnValue(+[IMDBroadcastController sharedProvider](&OBJC_CLASS___IMDBroadcastController, "sharedProvider"));
    v41 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v40,  "broadcasterForChatListenersUsingBlackholeRegistry:",  objc_msgSend(v53, "isBlackholed")));

    v42 = (void *)IMCreateSerializedItemsFromArray(v16);
    v43 = (void *)objc_claimAutoreleasedReturnValue([v53 accountID]);
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v53 chatIdentifier]);
    objc_msgSend( v41,  "account:chat:style:chatProperties:messagesUpdated:",  v43,  v44,  objc_msgSend(v53, "style"),  0,  v42);
  }

  else if (v12)
  {
    uint64_t v48 = OSLogHandleForIMFoundationCategory("Warning");
    v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v60 = v5;
      __int16 v61 = 2112;
      id v62 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_INFO,  "Asked to store chat items: %@   in guid: %@, however chat doesn't exist",  buf,  0x16u);
    }
  }

LABEL_51:
}

void _sSo26IMDaemonChatRequestHandlerC7imagentE23markChatsAsReadFiltered5usingySo11NSPredicateC_tF_0( void *a1)
{
  id v60 = a1;
  if (IMOSLoggingEnabled(v60, v1))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("MarkAllAsRead");
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v60;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Marking all as read with chat predicate %@",  (uint8_t *)&buf,  0xCu);
    }
  }

  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  do
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v77 = 0x3032000000LL;
    v78 = sub_10001A750;
    v79 = sub_10001A760;
    id v80 = 0LL;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMDDatabase synchronousDatabase](&OBJC_CLASS___IMDDatabase, "synchronousDatabase"));
    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472LL;
    v71[2] = sub_10001A768;
    v71[3] = &unk_100065620;
    v71[4] = &buf;
    [v5 fetchUnreadMessageRecordsForChatsFilteredUsingPredicate:v60 limit:50 completionHandler:v71];

    if ([*(id *)(*((void *)&buf + 1) + 40) count])
    {
      uint64_t v7 = objc_alloc(&OBJC_CLASS___NSMutableArray);
      uint64_t v8 = -[NSMutableArray initWithCapacity:]( v7,  "initWithCapacity:",  [*(id *)(*((void *)&buf + 1) + 40) count]);
      __int128 v69 = 0u;
      __int128 v70 = 0u;
      __int128 v67 = 0u;
      __int128 v68 = 0u;
      id v9 = *(id *)(*((void *)&buf + 1) + 40LL);
      id v10 = [v9 countByEnumeratingWithState:&v67 objects:v75 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v68;
        do
        {
          for (uint64_t i = 0LL; i != v10; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v68 != v11) {
              objc_enumerationMutation(v9);
            }
            uint64_t v13 = *(void **)(*((void *)&v67 + 1) + 8LL * (void)i);
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 guid]);
            -[NSMutableArray addObject:](v8, "addObject:", v14);

            id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 chatRecord]);
            v16 = (void *)objc_claimAutoreleasedReturnValue([v15 guid]);
            -[NSMutableSet addObject:](v4, "addObject:", v16);
          }

          id v10 = [v9 countByEnumeratingWithState:&v67 objects:v75 count:16];
        }

        while (v10);
      }

      uint64_t v19 = IMOSLoggingEnabled(v17, v18);
      if ((_DWORD)v19)
      {
        uint64_t v21 = OSLogHandleForIMFoundationCategory("MarkAllAsRead");
        uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v73 = 138412290;
          v74 = v4;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Marking chats as read %@", v73, 0xCu);
        }
      }

      if (IMOSLoggingEnabled(v19, v20))
      {
        uint64_t v23 = OSLogHandleForIMFoundationCategory("MarkAllAsRead");
        uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v73 = 138412290;
          v74 = (NSMutableSet *)v8;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "   with messages: %@", v73, 0xCu);
        }
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[IMDDatabase synchronousDatabase](&OBJC_CLASS___IMDDatabase, "synchronousDatabase"));
      [v25 markMessageRecordsAsReadWithGUIDs:v8];

      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
      [v26 retractPostedNotificationsForMessageGUIDs:v8];
    }

    else if (IMOSLoggingEnabled(0LL, v6))
    {
      uint64_t v27 = OSLogHandleForIMFoundationCategory("MarkAllAsRead");
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v73 = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "No messages to mark as read", v73, 2u);
      }
    }

    BOOL v29 = (unint64_t)[*(id *)(*((void *)&buf + 1) + 40) count] > 0x31;
    _Block_object_dispose(&buf, 8);
  }

  while (v29);
  if (IMOSLoggingEnabled(v30, v31))
  {
    uint64_t v32 = OSLogHandleForIMFoundationCategory("MarkAllAsRead");
    uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_INFO,  "Deleting orphaned messages",  (uint8_t *)&buf,  2u);
    }
  }

  IMDMessageRecordDeleteOrphanedMessages();
  if (-[NSMutableSet count](v4, "count"))
  {
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    obj = v4;
    id v34 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v63,  v72,  16LL);
    id v36 = v34;
    if (v34)
    {
      uint64_t v62 = *(void *)v64;
      do
      {
        uint64_t v37 = 0LL;
        do
        {
          if (*(void *)v64 != v62) {
            objc_enumerationMutation(obj);
          }
          uint64_t v38 = *(void *)(*((void *)&v63 + 1) + 8LL * (void)v37);
          if (IMOSLoggingEnabled(v34, v35))
          {
            uint64_t v39 = OSLogHandleForIMFoundationCategory("MarkAllAsRead");
            v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v38;
              _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_INFO,  "Recalculating unread count for chat %@",  (uint8_t *)&buf,  0xCu);
            }
          }

          v41 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
          v42 = (void *)objc_claimAutoreleasedReturnValue([v41 existingChatWithGUID:v38]);

          v43 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
          [v43 updateStateForChat:v42 forcePost:1 shouldRebuildFailedMessageDate:1 shouldCalculateUnreadCount:1];

          uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v42 lastMessage]);
          id v45 = [v44 isFromMe];
          if ((v45 & 1) != 0)
          {
            if (IMOSLoggingEnabled(v45, v46))
            {
              uint64_t v47 = OSLogHandleForIMFoundationCategory("MarkAllAsRead");
              uint64_t v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
              if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
              {
                LODWORD(buf) = 138412290;
                *(void *)((char *)&buf + 4) = v44;
                _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_INFO,  "Last message for chat was from me, not sending read receipt %@",  (uint8_t *)&buf,  0xCu);
              }
            }
          }

          else
          {
            v49 = (void *)objc_claimAutoreleasedReturnValue([v42 accountID]);
            id v50 = (void *)objc_claimAutoreleasedReturnValue(+[IMDAccountController sharedInstance](&OBJC_CLASS___IMDAccountController, "sharedInstance"));
            v51 = (void *)objc_claimAutoreleasedReturnValue([v50 sessionForAccount:v49]);

            if (IMOSLoggingEnabled(v52, v53))
            {
              uint64_t v54 = OSLogHandleForIMFoundationCategory("MarkAllAsRead");
              __int128 v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
              if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
              {
                __int128 v56 = (void *)objc_claimAutoreleasedReturnValue([v42 lastMessage]);
                LODWORD(buf) = 138412290;
                *(void *)((char *)&buf + 4) = v56;
                _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_INFO,  "Sending receipt for last message: %@",  (uint8_t *)&buf,  0xCu);
              }
            }

            __int128 v57 = (void *)objc_claimAutoreleasedReturnValue([v42 guid]);
            id v58 = (void *)objc_claimAutoreleasedReturnValue([v42 chatIdentifier]);
            objc_msgSend( v51,  "sendReadReceiptForMessage:toChatID:identifier:style:",  v44,  v57,  v58,  objc_msgSend(v42, "style"));
          }

          uint64_t v37 = (char *)v37 + 1;
        }

        while (v36 != v37);
        id v34 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v63,  v72,  16LL);
        id v36 = v34;
      }

      while (v34);
    }
  }

  else
  {
    id v59 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
    [v59 rebuildUnreadMessageCount];

    obj = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
    -[NSMutableSet rebuildLastFailedMessageDate](obj, "rebuildLastFailedMessageDate");
  }
}

uint64_t sub_10001A750(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10001A760(uint64_t a1)
{
}

void sub_10001A768(uint64_t a1, void *a2)
{
}

void sub_10001A778(void *a1, uint64_t a2, void *a3, void *a4, id a5, uint64_t a6, uint64_t a7)
{
  id v12 = a1;
  id v135 = a3;
  id v13 = a4;
  v137 = v12;
  if ([v12 count] && objc_msgSend(v135, "count"))
  {
    id v14 = [v12 count];
    id v15 = [v135 count];
    if (v14 == v15)
    {
      v131 = v13;
      __int128 v158 = 0u;
      __int128 v159 = 0u;
      __int128 v156 = 0u;
      __int128 v157 = 0u;
      uint64_t v17 = (NSMutableSet *)v135;
      id v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v156,  v170,  16LL);
      if (v18)
      {
        uint64_t v19 = *(void *)v157;
LABEL_6:
        uint64_t v20 = 0LL;
        while (1)
        {
          if (*(void *)v157 != v19) {
            objc_enumerationMutation(v17);
          }
          uint64_t v21 = *(void *)(*((void *)&v156 + 1) + 8 * v20);
          uint64_t v22 = objc_claimAutoreleasedReturnValue(+[IMDServiceController sharedController](&OBJC_CLASS___IMDServiceController, "sharedController"));
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([(id)v22 serviceWithName:v21]);

          LOBYTE(v22) = [v23 supportsDatabase];
          if ((v22 & 1) != 0) {
            break;
          }
          if (v18 == (id)++v20)
          {
            id v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v156,  v170,  16LL);
            if (v18) {
              goto LABEL_6;
            }
            goto LABEL_12;
          }
        }

        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v131 lastObject]);
        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate __im_dateWithCurrentServerTime](&OBJC_CLASS___NSDate, "__im_dateWithCurrentServerTime"));
        v133 = (void *)objc_claimAutoreleasedReturnValue( [v30 markMessagesAsReadWithIdentifiers:v137 onServices:v17 chatStyle:a2 upToGUID:v31 readDate:v32 fromMe:0]);

        if (IMOSLoggingEnabled(v33, v34))
        {
          uint64_t v35 = OSLogHandleForIMFoundationCategory("History");
          id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)__int128 buf = 138412802;
            uint64_t v165 = (uint64_t)v133;
            __int16 v166 = 2112;
            id v167 = v137;
            __int16 v168 = 2112;
            v169 = v17;
            _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_INFO,  "Found message guids to mark as read: %@ for IDs %@ services %@",  buf,  0x20u);
          }
        }

        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
        [v37 retractPostedNotificationsForMessageGUIDs:v133];

        if ([v133 count])
        {
          uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
          v130 = (void *)objc_claimAutoreleasedReturnValue([v38 messagesWithGUIDs:v133]);

          v132 = (void *)objc_claimAutoreleasedReturnValue([v130 lastObject]);
          v129 = (void *)objc_claimAutoreleasedReturnValue([v132 service]);
          if (IMOSLoggingEnabled(v129, v39))
          {
            uint64_t v40 = OSLogHandleForIMFoundationCategory("History");
            v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
            if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)__int128 buf = 138412290;
              uint64_t v165 = (uint64_t)v129;
              _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_INFO,  "Looking for chat that matches last message service %@",  buf,  0xCu);
            }
          }
        }

        else
        {
          v129 = 0LL;
          v130 = 0LL;
          v132 = 0LL;
        }

        v42 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
        v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "chatForMessageIdentifier:", objc_msgSend(v132, "messageID")));

        v134 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
        id v43 = [v137 count];
        if (v43)
        {
          for (unint64_t i = 0LL; i < (unint64_t)v43; ++i)
          {
            uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet objectAtIndex:](v17, "objectAtIndex:", i));
            uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v137 objectAtIndex:i]);
            uint64_t v48 = (void *)IMCopyGUIDForChat(v47, v46, a2);

            -[NSMutableSet addObject:](v134, "addObject:", v48);
            id v43 = [v137 count];
          }
        }

        if (!v136)
        {
          __int128 v154 = 0u;
          __int128 v155 = 0u;
          __int128 v152 = 0u;
          __int128 v153 = 0u;
          v49 = v134;
          id v50 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v49,  "countByEnumeratingWithState:objects:count:",  &v152,  v163,  16LL);
          if (v50)
          {
            uint64_t v51 = *(void *)v153;
LABEL_36:
            uint64_t v52 = 0LL;
            while (1)
            {
              if (*(void *)v153 != v51) {
                objc_enumerationMutation(v49);
              }
              uint64_t v53 = *(void *)(*((void *)&v152 + 1) + 8 * v52);
              uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
              uint64_t v55 = objc_claimAutoreleasedReturnValue([v54 existingChatWithGUID:v53]);

              if (v55) {
                break;
              }
              if (v50 == (id)++v52)
              {
                id v50 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v49,  "countByEnumeratingWithState:objects:count:",  &v152,  v163,  16LL);
                if (v50) {
                  goto LABEL_36;
                }
                goto LABEL_42;
              }
            }
          }

          else
          {
LABEL_42:
            uint64_t v55 = 0LL;
          }

          v136 = (void *)v55;

          id v43 = (id)IMOSLoggingEnabled(v56, v57);
          if ((_DWORD)v43)
          {
            uint64_t v58 = OSLogHandleForIMFoundationCategory("History");
            id v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
            if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)__int128 buf = 138412290;
              uint64_t v165 = v55;
              _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_INFO,  "Could not find chat from last message so defaulted to %@",  buf,  0xCu);
            }
          }
        }

        if (IMOSLoggingEnabled(v43, v44))
        {
          uint64_t v60 = OSLogHandleForIMFoundationCategory("History");
          __int16 v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
          if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
          {
            id v62 = [v133 count];
            *(_DWORD *)__int128 buf = 134218498;
            uint64_t v165 = (uint64_t)v62;
            __int16 v166 = 2048;
            id v167 = a5;
            __int16 v168 = 2112;
            v169 = v134;
            _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_INFO,  "daemon unread count : %lu, client unread count :%lu chatGuids %@",  buf,  0x20u);
          }
        }

        if ([v133 count] && v136)
        {
          obja = (NSMutableSet *)objc_claimAutoreleasedReturnValue([v132 timeRead]);
          id v63 = -[NSMutableSet __im_nanosecondTimeInterval](obja, "__im_nanosecondTimeInterval");
          if (IMOSLoggingEnabled(v63, v64))
          {
            uint64_t v65 = OSLogHandleForIMFoundationCategory("History");
            __int128 v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
            if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
            {
              __int128 v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v63));
              *(_DWORD *)__int128 buf = 138412290;
              uint64_t v165 = (uint64_t)v67;
              _os_log_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_INFO,  "Updating last read message time stamp with last read date: %@",  buf,  0xCu);
            }
          }

          [v136 updateLastReadMessageTimeStampIfNeeded:v63];
          uint64_t v127 = objc_claimAutoreleasedReturnValue([v132 guid]);
          if (IMOSLoggingEnabled(v127, v68))
          {
            uint64_t v69 = OSLogHandleForIMFoundationCategory("History");
            __int128 v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
            if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)__int128 buf = 138412290;
              uint64_t v165 = v127;
              _os_log_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_INFO,  "Calling update last seen message guid: %@",  buf,  0xCu);
            }
          }

          objc_msgSend(v136, "updateLastSeenMessageGuidIfNeeded:", v127, v127, v129);
          uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue([v136 lastMessage]);
          v72 = (void *)objc_claimAutoreleasedReturnValue([v71 guid]);
          v73 = (void *)objc_claimAutoreleasedReturnValue([v132 guid]);
          unsigned int v74 = [v72 isEqualToString:v73];

          if ([v130 count])
          {
            __int128 v150 = 0u;
            __int128 v151 = 0u;
            __int128 v148 = 0u;
            __int128 v149 = 0u;
            v75 = v134;
            id v76 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v75,  "countByEnumeratingWithState:objects:count:",  &v148,  v162,  16LL);
            if (v76)
            {
              uint64_t v77 = *(void *)v149;
              do
              {
                for (j = 0LL; j != v76; j = (char *)j + 1)
                {
                  if (*(void *)v149 != v77) {
                    objc_enumerationMutation(v75);
                  }
                  uint64_t v79 = *(void *)(*((void *)&v148 + 1) + 8LL * (void)j);
                  id v80 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
                  v81 = (void *)objc_claimAutoreleasedReturnValue([v80 existingChatWithGUID:v79]);

                  int v84 = IMOSLoggingEnabled(v82, v83);
                  if (v74)
                  {
                    if (v84)
                    {
                      uint64_t v85 = OSLogHandleForIMFoundationCategory("History");
                      v86 = (os_log_s *)objc_claimAutoreleasedReturnValue(v85);
                      if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)__int128 buf = 138412290;
                        uint64_t v165 = (uint64_t)v136;
                        _os_log_impl( (void *)&_mh_execute_header,  v86,  OS_LOG_TYPE_INFO,  "Last messages match. Setting unread count to zero for chat %@",  buf,  0xCu);
                      }
                    }

                    v87 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
                    [v87 updateStateForChat:v81 forcePost:1 shouldRebuildFailedMessageDate:0 setUnreadCountToZero:1];
                  }

                  else
                  {
                    if (v84)
                    {
                      uint64_t v88 = OSLogHandleForIMFoundationCategory("History");
                      v89 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);
                      if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)__int128 buf = 138412290;
                        uint64_t v165 = (uint64_t)v136;
                        _os_log_impl( (void *)&_mh_execute_header,  v89,  OS_LOG_TYPE_INFO,  "Last messages do not match. Recalculating unread count for chat %@",  buf,  0xCu);
                      }
                    }

                    v87 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
                    [v87 updateStateForChat:v81 forcePost:1 shouldRebuildFailedMessageDate:0 shouldCalculateUnreadCount:1];
                  }
                }

                id v76 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v75,  "countByEnumeratingWithState:objects:count:",  &v148,  v162,  16LL);
              }

              while (v76);
            }

            v90 = (void *)objc_claimAutoreleasedReturnValue([v132 accountID]);
            v91 = (void *)objc_claimAutoreleasedReturnValue(+[IMDAccountController sharedInstance](&OBJC_CLASS___IMDAccountController, "sharedInstance"));
            v92 = (void *)objc_claimAutoreleasedReturnValue([v91 sessionForAccount:v90]);

            if (IMOSLoggingEnabled(v93, v94))
            {
              uint64_t v95 = OSLogHandleForIMFoundationCategory("History");
              v96 = (os_log_s *)objc_claimAutoreleasedReturnValue(v95);
              if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)__int128 buf = 138412290;
                uint64_t v165 = (uint64_t)v132;
                _os_log_impl( (void *)&_mh_execute_header,  v96,  OS_LOG_TYPE_INFO,  "Sending receipt for last message: %@",  buf,  0xCu);
              }
            }

            v97 = (void *)objc_claimAutoreleasedReturnValue([v136 guid]);
            v98 = (void *)objc_claimAutoreleasedReturnValue([v136 chatIdentifier]);
            objc_msgSend( v92,  "sendReadReceiptForMessage:toChatID:identifier:style:",  v132,  v97,  v98,  objc_msgSend(v136, "style"));

            v99 = (void *)objc_claimAutoreleasedReturnValue( +[IMDBroadcastController sharedProvider]( &OBJC_CLASS___IMDBroadcastController,  "sharedProvider"));
            v100 = (void *)objc_claimAutoreleasedReturnValue([v99 broadcasterForChatListeners]);

            if (IMOSLoggingEnabled(v101, v102))
            {
              uint64_t v103 = OSLogHandleForIMFoundationCategory("History");
              v104 = (os_log_s *)objc_claimAutoreleasedReturnValue(v103);
              if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)__int128 buf = 138412290;
                uint64_t v165 = (uint64_t)v130;
                _os_log_impl( (void *)&_mh_execute_header,  v104,  OS_LOG_TYPE_INFO,  "Notifying about messages: %@",  buf,  0xCu);
              }
            }

            v105 = (void *)IMCreateSerializedItemsFromArray(v130);
            [v100 account:v90 chat:0 style:0 chatProperties:0 messagesUpdated:v105];
          }
        }

        else
        {
          if ([v133 count] == a5)
          {
LABEL_103:
            __int128 v142 = 0u;
            __int128 v143 = 0u;
            __int128 v140 = 0u;
            __int128 v141 = 0u;
            v117 = v134;
            id v118 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v117,  "countByEnumeratingWithState:objects:count:",  &v140,  v160,  16LL);
            if (v118)
            {
              uint64_t v119 = *(void *)v141;
              do
              {
                for (k = 0LL; k != v118; k = (char *)k + 1)
                {
                  if (*(void *)v141 != v119) {
                    objc_enumerationMutation(v117);
                  }
                  uint64_t v121 = *(void *)(*((void *)&v140 + 1) + 8LL * (void)k);
                  v122 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
                  v123 = (void *)objc_claimAutoreleasedReturnValue([v122 existingChatWithGUID:v121]);

                  if (a6 != 1) {
                    [v123 tearDownToneNotificationSessionIfNeeded];
                  }
                }

                id v118 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v117,  "countByEnumeratingWithState:objects:count:",  &v140,  v160,  16LL);
              }

              while (v118);
            }

            v124 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
            unsigned int v125 = [v124 isInternalInstall];

            if (v125)
            {
              v126 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
              IMSetDomainValueForKey(IMCloudKitDefinesDomain, IMCloudKitLastDeviceActivityDate, v126);
            }

            goto LABEL_115;
          }

          __int128 v146 = 0u;
          __int128 v147 = 0u;
          __int128 v144 = 0u;
          __int128 v145 = 0u;
          obja = v134;
          id v106 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obja,  "countByEnumeratingWithState:objects:count:",  &v144,  v161,  16LL);
          id v108 = v106;
          if (v106)
          {
            uint64_t v109 = *(void *)v145;
            do
            {
              v110 = 0LL;
              do
              {
                if (*(void *)v145 != v109) {
                  objc_enumerationMutation(obja);
                }
                v111 = *(void **)(*((void *)&v144 + 1) + 8LL * (void)v110);
                if (IMOSLoggingEnabled(v106, v107))
                {
                  uint64_t v112 = OSLogHandleForIMFoundationCategory("History");
                  v113 = (os_log_s *)objc_claimAutoreleasedReturnValue(v112);
                  if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)__int128 buf = 138412290;
                    uint64_t v165 = (uint64_t)v111;
                    _os_log_impl( (void *)&_mh_execute_header,  v113,  OS_LOG_TYPE_INFO,  "Syncing client back into state for chat with guid %@",  buf,  0xCu);
                  }
                }

                v114 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
                v115 = (void *)objc_claimAutoreleasedReturnValue([v114 existingChatWithGUID:v111]);

                v116 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
                [v116 updateStateForChat:v115 forcePost:1 shouldRebuildFailedMessageDate:0 setUnreadCountToZero:a7];

                v110 = (char *)v110 + 1;
              }

              while (v108 != v110);
              id v106 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obja,  "countByEnumeratingWithState:objects:count:",  &v144,  v161,  16LL);
              id v108 = v106;
            }

            while (v106);
          }
        }

        goto LABEL_103;
      }

LABEL_12:
      id v13 = v131;
      if (IMOSLoggingEnabled(v24, v25))
      {
        uint64_t v26 = OSLogHandleForIMFoundationCategory("History");
        uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int128 buf = 138412290;
          uint64_t v165 = (uint64_t)v17;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "Read receipts are not supported for services: %@",  buf,  0xCu);
        }

LABEL_115:
        id v13 = v131;
      }
    }

    else if (IMOSLoggingEnabled(v15, v16))
    {
      uint64_t v28 = OSLogHandleForIMFoundationCategory("Warning");
      BOOL v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 138412546;
        uint64_t v165 = (uint64_t)v12;
        __int16 v166 = 2112;
        id v167 = v135;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "Mismatched IDs and serviceNames array to mark as read (IDs: %@   Service names: %@)",  buf,  0x16u);
      }
    }
  }
}

void sub_10001B744(void *a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  id v15 = a1;
  id v11 = a3;
  id v12 = a4;
  if ([v15 count] && objc_msgSend(v11, "count"))
  {
    id v13 = (void *)IMCreateItemsFromSerializedArray(v12);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 arrayByApplyingSelector:"guid"]);
    sub_10001A778(v15, a2, v11, v14, a5, 0LL, a6);
  }
}

LABEL_21:
}

    uint64_t v24 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v25 = *v24;
    uint64_t v26 = (-1LL << v3) - 1;
  }

  else
  {
    uint64_t v24 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v26 = *v24;
    uint64_t v25 = (-1LL << result) - 1;
  }

  *uint64_t v24 = v26 & v25;
  uint64_t v27 = *(void *)(a2 + 16);
  uint64_t v28 = __OFSUB__(v27, 1LL);
  BOOL v29 = v27 - 1;
  if (v28)
  {
    __break(1u);
  }

  else
  {
    *(void *)(a2 + 16) = v29;
    ++*(_DWORD *)(a2 + 36);
  }

  return result;
}

id sub_10001D39C(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) isDownloadingQuery:*(void *)(a1 + 40) chatID:*(void *)(a1 + 48) services:*(void *)(a1 + 56) finishedWithResult:a2];
}

void sub_10001D4C8(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  uint64_t v4 = a3;
  if (IMOSLoggingEnabled(v4, v5))
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = @"NO";
      if (v3) {
        uint64_t v8 = @"YES";
      }
      int v9 = 138412546;
      id v10 = v8;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Chat zone created %@ error %@",  (uint8_t *)&v9,  0x16u);
    }
  }
}

void sub_10001D89C(id a1, IMDChat *a2, BOOL *a3)
{
  BOOL v3 = a2;
  if (IMOSLoggingEnabled(v3, v4))
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMDChat guid](v3, "guid"));
      int v8 = 138412546;
      int v9 = v7;
      __int16 v10 = 1024;
      unsigned int v11 = -[IMDChat cloudKitSyncState](v3, "cloudKitSyncState");
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Marking existing chat %@ as needing sync from state %d",  (uint8_t *)&v8,  0x12u);
    }
  }

  -[IMDChat resetCKSyncState](v3, "resetCKSyncState");
}

void sub_10001DB00(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  uint64_t v4 = a3;
  if (IMOSLoggingEnabled(v4, v5))
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = @"NO";
      if (v3) {
        int v8 = @"YES";
      }
      int v9 = 138412546;
      __int16 v10 = v8;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Attachment zone created %@ error %@",  (uint8_t *)&v9,  0x16u);
    }
  }
}

void sub_10001E1B4(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  uint64_t v4 = a3;
  if (IMOSLoggingEnabled(v4, v5))
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = @"NO";
      if (v3) {
        int v8 = @"YES";
      }
      int v10 = 138412546;
      __int16 v11 = v8;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Write Exit Record with success:%@, error:%@",  (uint8_t *)&v10,  0x16u);
    }
  }

  if (v3)
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKUtilities sharedInstance](&OBJC_CLASS___IMDCKUtilities, "sharedInstance"));
    [v9 evalToggleiCloudSettingsSwitch];
  }
}

void sub_10001E388(id a1, NSDate *a2, NSError *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = a3;
  if (IMOSLoggingEnabled(v5, v6))
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412546;
      int v10 = v4;
      __int16 v11 = 2112;
      __int16 v12 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Fetched Exit record date:%@, error:%@",  (uint8_t *)&v9,  0x16u);
    }
  }
}

void sub_10001E52C(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  uint64_t v4 = a3;
  if (IMOSLoggingEnabled(v4, v5))
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = @"NO";
      if (v3) {
        int v8 = @"YES";
      }
      int v10 = 138412546;
      __int16 v11 = v8;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Deleted exit record with success:%@, error:%@",  (uint8_t *)&v10,  0x16u);
    }
  }

  if (v3)
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKUtilities sharedInstance](&OBJC_CLASS___IMDCKUtilities, "sharedInstance"));
    [v9 evalToggleiCloudSettingsSwitch];
  }
}

void sub_10001E6D0(id a1, BOOL a2)
{
  BOOL v2 = a2;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[IMDBroadcastController sharedProvider](&OBJC_CLASS___IMDBroadcastController, "sharedProvider"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v4 broadcasterForAccountListeners]);
  [v3 didAttemptToDisableAllDevicesResult:v2];
}

uint64_t sub_10001EEF8(uint64_t a1)
{
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKUtilities sharedInstance](&OBJC_CLASS___IMDCKUtilities, "sharedInstance"));
  id v3 = [v2 currentStorageOnDevice];

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, id))(result + 16))(result, v3);
  }
  return result;
}

void sub_10001EF98(id a1, unint64_t a2, NSString *a3, NSError *a4)
{
  uint64_t v6 = a4;
  uint64_t v7 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[IMDBroadcastController sharedProvider](&OBJC_CLASS___IMDBroadcastController, "sharedProvider"));
  int v8 = (void *)objc_claimAutoreleasedReturnValue([v9 broadcasterForAccountListeners]);
  [v8 didPerformAdditionalStorageRequiredCheckWithSuccess:v6 == 0 additionalStorageRequired:a2 forAccountId:v7 error:v6];
}

void sub_10001F45C(id a1, BOOL a2, BOOL a3)
{
  BOOL v3 = a3;
  BOOL v4 = a2;
  if (IMOSLoggingEnabled(a1, a2))
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = @"NO";
      if (v4) {
        int v8 = @"YES";
      }
      else {
        int v8 = @"NO";
      }
      if (v3) {
        uint64_t v7 = @"YES";
      }
      int v9 = 138412546;
      int v10 = v8;
      __int16 v11 = 2112;
      __int16 v12 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "current cloudkit ramp state featurePromoted(%@) fetchHadServerError(%@)",  (uint8_t *)&v9,  0x16u);
    }
  }

void sub_10001F904(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x10001F894LL);
  }

  _Unwind_Resume(a1);
}

void sub_1000203DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (IMOSLoggingEnabled(a1, a2))
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory("IMDaemon_CloudKit");
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = @"NO";
      if ((_DWORD)a2) {
        int v9 = @"YES";
      }
      else {
        int v9 = @"NO";
      }
      if ((_DWORD)a3) {
        int v8 = @"YES";
      }
      int v13 = 138412546;
      id v14 = v9;
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Fetched cloudkit ramp state featurePromoted(%@) fetchHadServerError(%@)",  (uint8_t *)&v13,  0x16u);
    }
  }

  int v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) rampStateDictionaryFromPromoted:a2 featureHadServerError:a3]);
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(+[IMDBroadcastController sharedProvider](&OBJC_CLASS___IMDBroadcastController, "sharedProvider"));
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 broadcasterForAllListeners]);
  [v12 didFetchRampState:v10];
}

void sub_100020688( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100023964(id a1)
{
  qword_100071070 = objc_alloc_init(&OBJC_CLASS___IMDaemonMIGInterface);
}

uint64_t sub_100023B74(uint64_t result, uint64_t a2)
{
  if (!*(_BYTE *)(*(void *)(result + 32) + 40LL))
  {
    uint64_t v2 = result;
    if (IMOSLoggingEnabled(result, a2))
    {
      BOOL v3 = (os_log_s *)OSLogHandleForIMFoundationCategory("Warning");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        uint64_t v4 = *(void *)(v2 + 32);
        int v5 = 138412290;
        uint64_t v6 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "IMDaemonMIGInterface auth port died: %@",  (uint8_t *)&v5,  0xCu);
      }
    }

    exit(-1);
  }

  return result;
}

void sub_100023C50(id a1, OS_xpc_object *a2, OS_xpc_object *a3)
{
  xpc_type_t type = xpc_get_type(a3);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (a3 != (OS_xpc_object *)&_xpc_error_connection_invalid)
    {
      if (a3 == (OS_xpc_object *)&_xpc_error_connection_interrupted)
      {
        int v10 = (os_log_s *)OSLogHandleForIMFoundationCategory("IMDaemonMIGInterface");
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
          return;
        }
        LODWORD(v16) = 67109120;
        HIDWORD(v16) = xpc_connection_get_pid(a2);
        __int16 v11 = "peer(%d) received XPC_ERROR_CONNECTION_INTERRUPTED";
      }

      else
      {
        if (a3 != (OS_xpc_object *)&_xpc_error_termination_imminent) {
          return;
        }
        int v10 = (os_log_s *)OSLogHandleForIMFoundationCategory("IMDaemonMIGInterface");
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
          return;
        }
        LODWORD(v16) = 67109120;
        HIDWORD(v16) = xpc_connection_get_pid(a2);
        __int16 v11 = "peer(%d) received XPC_ERROR_TERMINATION_IMMINENT";
      }

      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v16, 8u);
      return;
    }

    if (IMOSLoggingEnabled(type, v6))
    {
      int v13 = (os_log_s *)OSLogHandleForIMFoundationCategory("IMDaemonMIGInterface");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LODWORD(v16) = 67109120;
        HIDWORD(v16) = xpc_connection_get_pid(a2);
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "peer(%d) received XPC_ERROR_CONNECTION_INVALID",  (uint8_t *)&v16,  8u);
      }
    }

    id v14 = (void *)im_local_object_from_connection(a2);
    __int16 v15 = v14;
    if (v14) {
      [v14 _portDidBecomeInvalid];
    }

    xpc_connection_cancel(a2);
  }

  else if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t v16 = _NSConcreteStackBlock;
    *(void *)&__int128 v17 = 3221225472LL;
    if (xpc_dictionary_get_BOOL(a3, "setup-request"))
    {
      *((void *)&v17 + 1) = sub_1000240C8;
      id v18 = &unk_100065950;
      uint64_t v19 = a3;
      uint64_t v20 = a2;
    }

    else
    {
      *((void *)&v17 + 1) = sub_100024610;
      id v18 = &unk_100065978;
      uint64_t v19 = a2;
      uint64_t v20 = a3;
      uint64_t v21 = a3;
    }

    dispatch_block_t v12 = dispatch_block_create((dispatch_block_flags_t)0LL, &v16);
    sub_100024588((uint64_t)v12);
  }

  else
  {
    uint64_t v7 = xpc_copy_description(a3);
    if (IMOSLoggingEnabled(v7, v8))
    {
      int v9 = (os_log_s *)OSLogHandleForIMFoundationCategory("IMDaemonMIGInterface");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LODWORD(v16) = 67109378;
        HIDWORD(v16) = xpc_connection_get_pid(a2);
        LOWORD(v17) = 2080;
        *(void *)((char *)&v17 + 2) = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "received unknown from peer(%d): %s",  (uint8_t *)&v16,  0x12u);
      }
    }

    free(v7);
  }

id sub_10002404C(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "__setupServer");
}

void sub_1000240C8(uint64_t a1, uint64_t a2)
{
  if (IMOSLoggingEnabled(a1, a2))
  {
    BOOL v3 = (os_log_s *)OSLogHandleForIMFoundationCategory("IMDaemon");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Incoming peer auth grant request", buf, 2u);
    }
  }

  if (_IMWillLog(@"IMDaemonMIGInterface"))
  {
    uint64_t v4 = xpc_copy_description(*(xpc_object_t *)(a1 + 32));
    if (IMOSLoggingEnabled(v4, v5))
    {
      uint64_t v6 = (os_log_s *)OSLogHandleForIMFoundationCategory("IMDaemonMIGInterface");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 40));
        *(_DWORD *)__int128 buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = pid;
        LOWORD(v30) = 2080;
        *(void *)((char *)&v30 + 2) = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "received message from peer(%d): %s",  buf,  0x12u);
      }
    }

    free(v4);
  }

  uint64_t v8 = -[IMDaemonMIGInterface delegate]( +[IMDaemonMIGInterface sharedInstance](&OBJC_CLASS___IMDaemonMIGInterface, "sharedInstance"),  "delegate");
  uint64_t v9 = IMGetXPCStringFromDictionary(*(void *)(a1 + 32), "portName");
  uint64_t v10 = IMGetXPCDictionaryFromDictionary(*(void *)(a1 + 32), "setupInfo");
  BOOL v11 = xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 32), "plugin-request");
  *(void *)__int128 buf = 0LL;
  *(void *)&__int128 v30 = buf;
  *((void *)&v30 + 1) = 0x3052000000LL;
  uint64_t v31 = sub_100024554;
  uint64_t v32 = sub_100024564;
  uint64_t v33 = 0LL;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  xpc_connection_get_audit_token(*(void *)(a1 + 40), &v26);
  uint64_t v12 = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 40));
  if (v8 && *(void *)(a1 + 40))
  {
    int v13 = +[IMDaemonMIGInterface sharedInstance](&OBJC_CLASS___IMDaemonMIGInterface, "sharedInstance");
    uint64_t v14 = *(void *)(a1 + 40);
    *(_OWORD *)uint64_t v28 = v26;
    *(_OWORD *)&v28[16] = v27;
    if (v11) {
      unsigned int v15 = -[IMDaemonMIGInterfaceDelegate daemonInterface:shouldGrantPlugInAccessForPID:auditToken:portName:listenerConnection:setupInfo:setupResponse:]( v8,  "daemonInterface:shouldGrantPlugInAccessForPID:auditToken:portName:listenerConnection:setupIn fo:setupResponse:",  v13,  v12,  v28,  v9,  v14,  v10,  (void)v30 + 40LL);
    }
    else {
      unsigned int v15 = -[IMDaemonMIGInterfaceDelegate daemonInterface:shouldGrantAccessForPID:auditToken:portName:listenerConnection:setupInfo:setupResponse:]( v8,  "daemonInterface:shouldGrantAccessForPID:auditToken:portName:listenerConnection:setupInfo:setupResponse:",  v13,  v12,  v28,  v9,  v14,  v10,  (void)v30 + 40LL);
    }
    int v16 = v15;
  }

  else
  {
    int v16 = 1;
  }

  __int128 v17 = (os_log_s *)+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration");
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v18)
  {
    uint64_t v20 = @"NO";
    *(_DWORD *)uint64_t v28 = 138412802;
    *(void *)&v28[4] = v9;
    if (v16) {
      uint64_t v20 = @"YES";
    }
    *(_WORD *)&v28[12] = 1024;
    *(_DWORD *)&v28[14] = v12;
    *(_WORD *)&v28[18] = 2112;
    *(void *)&v28[20] = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Port name request for: %@ from pid: %d granted: %@",  v28,  0x1Cu);
  }

  if (IMOSLoggingEnabled(v18, v19))
  {
    uint64_t v21 = (os_log_s *)OSLogHandleForIMFoundationCategory("IMDaemon");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = @"NO";
      *(_DWORD *)uint64_t v28 = 138412802;
      *(void *)&v28[4] = v9;
      if (v16) {
        uint64_t v22 = @"YES";
      }
      *(_WORD *)&v28[12] = 1024;
      *(_DWORD *)&v28[14] = v12;
      *(_WORD *)&v28[18] = 2112;
      *(void *)&v28[20] = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "Port name request for: %@ from pid: %d granted: %@",  v28,  0x1Cu);
    }
  }

  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  uint64_t v24 = reply;
  if (reply)
  {
    xpc_dictionary_set_value(reply, "response", *(xpc_object_t *)(v30 + 40));
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), v24);
    xpc_release(v24);
  }

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100024570;
  v25[3] = &unk_100065928;
  v25[4] = buf;
  im_dispatch_after(v25, 5.0);
  _Block_object_dispose(buf, 8);
}

void sub_1000244D0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    objc_end_catch();
    JUMPOUT(0x1000241CCLL);
  }

  _Unwind_Resume(exception_object);
}

void sub_100024554(uint64_t a1, uint64_t a2)
{
}

void sub_100024564(uint64_t a1)
{
}

void sub_100024570(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  if (v1) {
    xpc_release(v1);
  }
}

uint64_t sub_100024588(uint64_t a1)
{
  v5[0] = 0LL;
  v5[1] = 0LL;
  uint64_t v2 = pthread_main_thread_np();
  pthread_dependency_init_np(v5, v2, 0LL);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000247A8;
  v4[3] = &unk_1000659A0;
  v4[4] = a1;
  v4[5] = v5;
  dispatch_async(&_dispatch_main_q, v4);
  return pthread_dependency_wait_np(v5);
}

void sub_100024610(uint64_t a1)
{
  uint64_t v2 = (void *)im_local_object_from_connection(*(void *)(a1 + 32));
  uint64_t v3 = IMCreateInvocationFromXPCObjectWithProtocol( *(void *)(a1 + 40),  v2,  objc_msgSend(objc_msgSend(v2, "protocolChecker"), "protocol"),  objc_msgSend(v2, "allowlistedClasses"));
  if (v3)
  {
    uint64_t v4 = (NSString *)v3;
    [v2 _enqueueInvocationWithSync:v3 xpcMessage:*(void *)(a1 + 48)];
  }

  else
  {
    if (xpc_dictionary_get_dictionary(*(xpc_object_t *)(a1 + 40), "invocation"))
    {
      uint64_t v5 = (void *)_CFXPCCreateCFObjectFromXPCMessage();
      uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSArray);
      if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0
        && ((unint64_t)[v5 count] < 2
          ? (id v7 = 0LL)
          : (id v7 = [v5 objectAtIndexedSubscript:1]),
            uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSData),
            (objc_opt_isKindOfClass(v7, v8) & 1) != 0))
      {
        uint64_t v4 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v7, 4LL);
      }

      else
      {
        uint64_t v4 = 0LL;
      }
    }

    else
    {
      uint64_t v4 = 0LL;
    }

    uint64_t v9 = (os_log_s *)IMLogHandleForCategory("IMDaemonMIGInterface");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_1000425F8((uint64_t)v4, v9);
    }
    IMLogSimulateCrashForException( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSGenericException,  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Could not create NSInvocation matching XPC request object. Selector %@ not found in XPC interface.",  v4),  0LL));
  }
}

uint64_t sub_1000247A8(uint64_t a1)
{
  return pthread_dependency_fulfill_np(*(void *)(a1 + 40), 0LL);
}

void sub_100024AC0(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___IMDaemonCloudKitManager);
  uint64_t v2 = (void *)qword_100071088;
  qword_100071088 = (uint64_t)v1;
}

void sub_100024E28(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    if (IMOSLoggingEnabled(2LL, v5))
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory("IMDaemonCloudKitManager");
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        unsigned int v15 = @"YES";
        if (!v3) {
          unsigned int v15 = @"NO";
        }
        int v28 = 138412290;
        BOOL v29 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Got called to sync chats in check in run state with non null activity %@",  (uint8_t *)&v28,  0xCu);
      }
    }

    int v16 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKUtilities sharedInstance](&OBJC_CLASS___IMDCKUtilities, "sharedInstance"));
    unsigned __int8 v17 = [v16 cloudKitSyncingEnabled];

    if ((v17 & 1) != 0)
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogDump sharedInstance](&OBJC_CLASS___IMLogDump, "sharedInstance"));
      [v20 dumpMOCLoggingMetaData];

      BOOL v21 = xpc_activity_set_state(v3, 4LL);
      if (!v21 && IMOSLoggingEnabled(v21, v22))
      {
        uint64_t v23 = OSLogHandleForIMFoundationCategory("Warning");
        uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          LOWORD(v2_Block_object_dispose(va, 8) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "We did not set the state of xpc_activity from core duet to continue successfully for chat sync",  (uint8_t *)&v28,  2u);
        }
      }

      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKSyncController sharedInstance](&OBJC_CLASS___IMDCKSyncController, "sharedInstance"));
      [v25 beginChatSyncPeriodic:1 activity:v3];
    }

    else if (IMOSLoggingEnabled(v18, v19))
    {
      uint64_t v26 = OSLogHandleForIMFoundationCategory("IMDaemonCloudKitManager");
      __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        LOWORD(v2_Block_object_dispose(va, 8) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "Ignoring activity request to sync chats, as syncing is disabled",  (uint8_t *)&v28,  2u);
      }
    }
  }

  else if (!state)
  {
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_string(v6, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
    xpc_dictionary_set_int64(v6, XPC_ACTIVITY_INTERVAL, *(void *)(a1 + 32));
    xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_ALLOW_BATTERY, 1);
    xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
    xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REPEATING, 1);
    xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
    xpc_object_t v7 = xpc_activity_copy_criteria(v3);
    uint64_t v8 = v7;
    if (!v7 || !(BOOL v9 = xpc_equal(v7, v6))) {
      xpc_activity_set_criteria(v3, v6);
    }
    if (IMOSLoggingEnabled(v9, v10))
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory("IMDaemonCloudKitManager");
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v2_Block_object_dispose(va, 8) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Got called to sync chats in check in state",  (uint8_t *)&v28,  2u);
      }
    }
  }
}

LABEL_14:
    return;
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance"));
  if ([v11 isInternalInstall] && IMIsRunningInAutomation())
  {
    uint64_t v12 = ((uint64_t (*)(void, const __CFString *))IMGetDomainBoolForKey)( IMCloudKitDefinesDomain,  @"disableCoreDuetSync");

    if (v12)
    {
      unsigned int v15 = OSLogHandleForIMFoundationCategory("IMDaemonCloudKitManager");
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v21) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_INFO,  "**** Not doing Core Duet for message syncing",  (uint8_t *)&v21,  2u);
      }

      goto LABEL_14;
    }
  }

  else
  {
  }

  int v16 = -[IMDaemonCloudKitManager _messageSyncingIntervalBagValue](self, "_messageSyncingIntervalBagValue");
  if (IMOSLoggingEnabled(v16, v17))
  {
    uint64_t v18 = OSLogHandleForIMFoundationCategory("IMDaemonCloudKitManager");
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      BOOL v21 = 136315394;
      uint64_t v22 = "com.apple.messages.messageSyncing";
      uint64_t v23 = 2048;
      uint64_t v24 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "Registering for message syncing using identifier %s interval %lld",  (uint8_t *)&v21,  0x16u);
    }
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000254BC;
  v20[3] = &unk_100065A08;
  v20[4] = self;
  v20[5] = v16;
  IMRegisterSADAwareXPCActivity("com.apple.messages.messageSyncing", XPC_ACTIVITY_CHECK_IN, v20);
}

void sub_1000254BC(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    if (IMOSLoggingEnabled(2LL, v5))
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory("IMDaemonCloudKitManager");
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        unsigned int v15 = @"YES";
        if (!v3) {
          unsigned int v15 = @"NO";
        }
        int v30 = 138412290;
        uint64_t v31 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Got called to sync message in run state with non null activity %@",  (uint8_t *)&v30,  0xCu);
      }
    }

    int v16 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKUtilities sharedInstance](&OBJC_CLASS___IMDCKUtilities, "sharedInstance"));
    unsigned __int8 v17 = [v16 cloudKitSyncingEnabled];

    if ((v17 & 1) != 0)
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      IMSetDomainValueForKey(IMCloudKitDefinesDomain, IMCloudKitCoreduetLastFullSyncAttemptDate, v20);

      BOOL v21 = (void *)objc_claimAutoreleasedReturnValue(+[IMMetricsCollector sharedInstance](&OBJC_CLASS___IMMetricsCollector, "sharedInstance"));
      [v21 trackEvent:IMMetricsCollectorEventCKCalledByCoreduetForPeriodicSync];

      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogDump sharedInstance](&OBJC_CLASS___IMLogDump, "sharedInstance"));
      [v22 dumpMOCLoggingMetaData];

      BOOL v23 = xpc_activity_set_state(v3, 4LL);
      if (!v23 && IMOSLoggingEnabled(v23, v24))
      {
        uint64_t v25 = OSLogHandleForIMFoundationCategory("Warning");
        uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          LOWORD(v30) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "We did not set the state of xpc_activity from core duet to continue successfully for message syncing",  (uint8_t *)&v30,  2u);
        }
      }

      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKSyncController sharedInstance](&OBJC_CLASS___IMDCKSyncController, "sharedInstance"));
      [v27 beginPeriodicSyncWithActivity:v3];
    }

    else if (IMOSLoggingEnabled(v18, v19))
    {
      uint64_t v28 = OSLogHandleForIMFoundationCategory("IMDaemonCloudKitManager");
      BOOL v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        LOWORD(v30) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "Ignoring activity request to sync messages, as syncing is disabled",  (uint8_t *)&v30,  2u);
      }
    }
  }

  else if (!state)
  {
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_string(v6, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
    xpc_dictionary_set_int64(v6, XPC_ACTIVITY_INTERVAL, *(void *)(a1 + 40));
    xpc_dictionary_set_int64( v6,  XPC_ACTIVITY_DELAY,  (int64_t)[*(id *)(a1 + 32) _messageSyncingDelayBagValue]);
    xpc_dictionary_set_int64(v6, XPC_ACTIVITY_GRACE_PERIOD, 43200LL);
    xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REPEATING, 1);
    xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 1);
    xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP, 1);
    xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_ALLOW_BATTERY, 0);
    xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REQUIRE_SIGNIFICANT_USER_INACTIVITY, 0);
    xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
    xpc_object_t v7 = xpc_activity_copy_criteria(v3);
    uint64_t v8 = v7;
    if (!v7 || !(BOOL v9 = xpc_equal(v7, v6))) {
      xpc_activity_set_criteria(v3, v6);
    }
    if (IMOSLoggingEnabled(v9, v10))
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory("IMDaemonCloudKitManager");
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v30) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Got called to sync message in check in state",  (uint8_t *)&v30,  2u);
      }
    }
  }
}

void sub_100025B78(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    if (IMOSLoggingEnabled(2LL, v5))
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory("IMDaemonCloudKitManager");
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        unsigned int v15 = @"YES";
        if (!v3) {
          unsigned int v15 = @"NO";
        }
        int v20 = 138412290;
        BOOL v21 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Got called to update attachment file sizes with non null activity %@",  (uint8_t *)&v20,  0xCu);
      }
    }

    BOOL v16 = xpc_activity_set_state(v3, 4LL);
    if (!v16 && IMOSLoggingEnabled(v16, v17))
    {
      uint64_t v18 = OSLogHandleForIMFoundationCategory("Warning");
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "We did not set the state of xpc_activity from core duet to continue successfully for attachment file size updating",  (uint8_t *)&v20,  2u);
      }
    }

    xpc_object_t v6 = (xpc_object_t)objc_claimAutoreleasedReturnValue( +[IMDCKCacheDeleteManager sharedInstance]( &OBJC_CLASS___IMDCKCacheDeleteManager,  "sharedInstance"));
    [v6 updateAttachmentFileSizesWithActivity:v3];
    goto LABEL_23;
  }

  if (!state)
  {
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_string(v6, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
    xpc_dictionary_set_int64(v6, XPC_ACTIVITY_INTERVAL, *(void *)(a1 + 32));
    xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_ALLOW_BATTERY, 0);
    xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 0);
    xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REPEATING, 1);
    xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REQUIRE_SIGNIFICANT_USER_INACTIVITY, 0);
    xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
    xpc_object_t v7 = xpc_activity_copy_criteria(v3);
    uint64_t v8 = v7;
    if (!v7 || !(BOOL v9 = xpc_equal(v7, v6))) {
      xpc_activity_set_criteria(v3, v6);
    }
    if (IMOSLoggingEnabled(v9, v10))
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory("IMDaemonCloudKitManager");
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Got called to update attachment file sizes in check in state",  (uint8_t *)&v20,  2u);
      }
    }

LABEL_23:
  }
}

void sub_100025F90(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    if (IMOSLoggingEnabled(2LL, v5))
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory("IMDaemonCloudKitManager");
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        unsigned int v15 = @"YES";
        if (!v3) {
          unsigned int v15 = @"NO";
        }
        int v21 = 138412290;
        uint64_t v22 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Got called to log CK metrics in run state with non null activity %@",  (uint8_t *)&v21,  0xCu);
      }
    }

    [*(id *)(a1 + 32) uploadDailyAnalyticstoCloudKit];
    BOOL v16 = xpc_activity_set_state(v3, 5LL);
    if (IMOSLoggingEnabled(v16, v17))
    {
      uint64_t v18 = OSLogHandleForIMFoundationCategory("IMDaemonCloudKitManager");
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        int v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v16));
        int v21 = 138412290;
        uint64_t v22 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "Set log CK metrics activity %@",  (uint8_t *)&v21,  0xCu);
      }
    }
  }

  else if (!state)
  {
    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_string(v6, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
    xpc_dictionary_set_int64(v6, XPC_ACTIVITY_INTERVAL, *(void *)(a1 + 40));
    xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
    xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_ALLOW_BATTERY, 1);
    xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REPEATING, 1);
    xpc_object_t v7 = xpc_activity_copy_criteria(v3);
    uint64_t v8 = v7;
    if (!v7 || !(BOOL v9 = xpc_equal(v7, v6))) {
      xpc_activity_set_criteria(v3, v6);
    }
    if (IMOSLoggingEnabled(v9, v10))
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory("IMDaemonCloudKitManager");
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v21) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Got called to log CK metrics in state",  (uint8_t *)&v21,  2u);
      }
    }
  }
}

void sub_10002637C(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v2);
  if (state == 2)
  {
    if (IMOSLoggingEnabled(2LL, v4))
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory("IMDaemonCloudKitManager");
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = @"YES";
        if (!v2) {
          uint64_t v14 = @"NO";
        }
        int v22 = 138412290;
        BOOL v23 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Got called to do log dump in run state with non null activity %@",  (uint8_t *)&v22,  0xCu);
      }
    }

    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKSyncController sharedInstance](&OBJC_CLASS___IMDCKSyncController, "sharedInstance"));
    [v15 collectLogsIfNeeded];

    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKSyncController sharedInstance](&OBJC_CLASS___IMDCKSyncController, "sharedInstance"));
    [v16 sendRestoreFailuresLogDumpsIfNeeded];

    BOOL v17 = xpc_activity_set_state(v2, 5LL);
    if (IMOSLoggingEnabled(v17, v18))
    {
      uint64_t v19 = OSLogHandleForIMFoundationCategory("IMDaemonCloudKitManager");
      int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        int v21 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v17));
        int v22 = 138412290;
        BOOL v23 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "Set log dump activity %@",  (uint8_t *)&v22,  0xCu);
      }
    }
  }

  else if (!state)
  {
    xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_string(v5, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
    xpc_dictionary_set_int64(v5, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_HOUR);
    xpc_dictionary_set_BOOL(v5, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 0);
    xpc_dictionary_set_BOOL(v5, XPC_ACTIVITY_ALLOW_BATTERY, 1);
    xpc_dictionary_set_BOOL(v5, XPC_ACTIVITY_REPEATING, 1);
    xpc_object_t v6 = xpc_activity_copy_criteria(v2);
    xpc_object_t v7 = v6;
    if (!v6 || !(BOOL v8 = xpc_equal(v6, v5))) {
      xpc_activity_set_criteria(v2, v5);
    }
    if (IMOSLoggingEnabled(v8, v9))
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory("IMDaemonCloudKitManager");
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LOWORD(v22) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Got called to do log dump check in state",  (uint8_t *)&v22,  2u);
      }
    }
  }
}

void sub_1000276A4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) historyQuery:*(void *)(a1 + 40) chatID:*(void *)(a1 + 48) services:*(void *)(a1 + 56) finishedWithResult:v5 limit:*(void *)(a1 + 72)];
  if (IMOSLoggingEnabled(v7, v8))
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory("History");
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 64);
      int v13 = 138412546;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      uint64_t v16 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "   Results of query %@ broadcast to %@",  (uint8_t *)&v13,  0x16u);
    }
  }
}

void sub_100027CE0(uint64_t a1, void *a2, void *a3, char a4, char a5)
{
  id v9 = a2;
  id v10 = a3;
  if (IMOSLoggingEnabled(v10, v11))
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory("History");
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 134217984;
      id v16 = [v9 count];
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Paged history serializedMessages count: %lu",  buf,  0xCu);
    }
  }

  BYTE1(v14) = a5;
  LOBYTE(v14) = a4;
  objc_msgSend( *(id *)(a1 + 32),  "pagedHistoryQuery:chatID:services:numberOfMessagesBefore:numberOfMessagesAfter:finishedWithResult:hasMessagesBefore: hasMessagesAfter:",  *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(void *)(a1 + 56),  *(void *)(a1 + 64),  *(void *)(a1 + 72),  v9,  v14);
}

id sub_10002856C(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) attachmentQuery:*(void *)(a1 + 40) chatID:*(void *)(a1 + 48) services:*(void *)(a1 + 56) finishedWithResult:a2];
}

void sub_100029484(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) length])
  {
    if (!*(_BYTE *)(a1 + 64))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v4 = *(void **)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v6 = *(void *)(a1 + 56);
      id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a2));
      [v4 markAsSpamQuery:v5 chatID:v7 services:v6 finishedWithResult:v8];
    }
  }

id sub_1000299E8(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) frequentRepliesQuery:*(void *)(a1 + 40) chatID:*(void *)(a1 + 48) services:*(void *)(a1 + 56) finishedWithResult:a2 limit:*(void *)(a1 + 64)];
}

void sub_100029D30(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x100029C9CLL);
  }

  _Unwind_Resume(a1);
}

id sub_100029EE0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) historyQuery:*(void *)(a1 + 40) chatID:*(void *)(a1 + 48) services:*(void *)(a1 + 56) finishedWithResult:a2 limit:*(void *)(a1 + 64)];
}

LABEL_20:
        }

  swift_bridgeObjectRelease(a1, v3);
  return 0LL;
}

id sub_10002A484(id a1, IMItem *a2)
{
  return -[IMItem guid](a2, "guid");
}

BOOL sub_10002A48C(id a1, IMItem *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___IMItem);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
  {
    else {
      unsigned __int8 v4 = -[IMItem isMessageAcknowledgment](v2, "isMessageAcknowledgment");
    }
  }

  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

LABEL_18:
    v13[2](v13, 0LL);
    goto LABEL_19;
  }

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[IMDCKAttachmentSyncController sharedInstance]( &OBJC_CLASS___IMDCKAttachmentSyncController,  "sharedInstance"));
  ((void (**)(id, id))v13)[2]( v13,  [v25 purgedAttachmentsCountForChatsWithChatIdentifiers:v11 services:v12]);

LABEL_19:
}

    swift_bridgeObjectRelease(v18, v19);
    [*(id *)(a1 + 16) postAliveNotification];
    return;
  }

void sub_10002A908(void *a1, uint64_t a2)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a2));
  [v2 uncachedAttachmentCountQuery:v3 chatID:v4 services:v5 finishedWithResult:v6];
}

void sub_10002B34C(uint64_t a1, void *a2)
{
  id v37 = a2;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v2 existingChatWithGUID:v37]);

  if (v38)
  {
    if (+[IMGenerativeModelsAvailabilityProvider messageSummarizationEnabled]( &OBJC_CLASS___IMGenerativeModelsAvailabilityProvider,  "messageSummarizationEnabled"))
    {
      uint64_t v50 = IMChatPropertyChatSummaryDictionary;
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      uint64_t v51 = v5;
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v51,  &v50,  1LL));
      [v38 updateProperties:v6];
    }

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[IMDChatVocabularyUpdater sharedInstance]( &OBJC_CLASS___IMDChatVocabularyUpdater,  "sharedInstance",  a1));
    [v7 updateVocabularyForDeletedChat:v38 completionHandler:0];

    [*(id *)(v36 + 32) _updateLastMessageTimeStampForChat:v38];
    else {
      BOOL v8 = 1;
    }
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v38 participants]);
    id v13 = [v12 countByEnumeratingWithState:&v40 objects:v49 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v41;
      do
      {
        __int16 v15 = 0LL;
        do
        {
          if (*(void *)v41 != v14) {
            objc_enumerationMutation(v12);
          }
          id v16 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)v15);
          if (v8)
          {
            [v39 addObject:v17];
          }

          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
          unsigned int v19 = [v18 removeIMDHandleFromRegistry:v16];

          if (v19)
          {
            int v20 = (void *)objc_claimAutoreleasedReturnValue([v16 ID]);
            -[NSMutableArray addObject:](v11, "addObject:", v20);
          }

          __int16 v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = [v12 countByEnumeratingWithState:&v40 objects:v49 count:16];
      }

      while (v13);
    }

    int v21 = (void *)objc_claimAutoreleasedReturnValue(+[IMDNicknameController sharedInstance](&OBJC_CLASS___IMDNicknameController, "sharedInstance"));
    [v21 cleanUpNicknameForIDs:v11];

    if ([v39 count])
    {
      int v22 = (void *)objc_claimAutoreleasedReturnValue( +[IMSafetyMonitorCoordinator sharedCoordinator]( &OBJC_CLASS___IMSafetyMonitorCoordinator,  "sharedCoordinator"));
      BOOL v23 = (void *)objc_claimAutoreleasedReturnValue([v39 allObjects]);
      [v22 informOfDeletedConversationWithReceiverHandles:v23];
    }

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v38 serviceName]);
    unsigned int v25 = [v24 isEqualToString:IMServiceNameSMS];
    uint64_t v26 = 48LL;
    if (v25) {
      uint64_t v26 = 40LL;
    }
    id v27 = *(id *)(v36 + v26);

    v48[0] = v37;
    v47[0] = IMDCommandChatGUIDKey;
    v47[1] = IMDCommandChatGroupIDKey;
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v38 groupID]);
    v48[1] = v28;
    v47[2] = IMDCommandChatParticipantsKey;
    BOOL v29 = (void *)objc_claimAutoreleasedReturnValue([v38 participantHandles]);
    v48[2] = v29;
    v47[3] = IMDChatWasReportedAsJunkKey;
    int v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v38 wasReportedAsJunk]));
    v48[3] = v30;
    v47[4] = IMDDeleteCommandDeleteIncomingMessagesKey;
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v38 isDeletingIncomingMessages]));
    v48[4] = v31;
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v48,  v47,  5LL));

    uint64_t v44 = v32;
    v45[0] = IMDRecoverableDeleteCommandChatMetadataArrayKey;
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v44, 1LL));
    v46[0] = v33;
    v46[1] = &__kCFBooleanFalse;
    v45[1] = IMDDeleteCommandIsPermanentDeleteKey;
    v45[2] = IMDDeleteCommandRecoverableDeleteDateKey;
    v46[2] = *(void *)(v36 + 56);
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v46,  v45,  3LL));

    [v27 sendDeleteCommand:v34 forChatGUID:v37];
    [v27 willMoveChatToRecentlyDeleted:v38];
  }

  else if (IMOSLoggingEnabled(v3, v4))
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory("Warning");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v53 = v37;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Recently Deleted | IMDaemon_Chat skipping: chat not found for guid: %@",  buf,  0xCu);
    }
  }
}

void sub_10002BB6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 existingChatWithGUID:v3]);

  id v6 = [*(id *)(a1 + 32) _updateLastMessageTimeStampForChat:v5];
  if (v5)
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceName]);
    unsigned int v9 = [v8 isEqualToString:IMServiceNameSMS];

    if (v9) {
      uint64_t v10 = IMGreenTeaMessageDeleteLog();
    }
    if (IMOSLoggingEnabled(v10, v11))
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory("Chat");
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v31 = v5;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Removing chat from registry: %@", buf, 0xCu);
      }
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceName]);
    unsigned int v15 = [v14 isEqualToString:IMServiceNameSMS];
    uint64_t v16 = 48LL;
    if (v15) {
      uint64_t v16 = 40LL;
    }
    id v17 = *(id *)(a1 + v16);

    v29[0] = v3;
    v28[0] = IMDCommandChatGUIDKey;
    v28[1] = IMDCommandChatGroupIDKey;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v5 groupID]);
    v29[1] = v18;
    v28[2] = IMDCommandChatParticipantsKey;
    unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v5 participantHandles]);
    v29[2] = v19;
    int v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v29,  v28,  3LL));

    unsigned int v25 = v20;
    uint64_t v26 = IMDRecoverCommandChatMetadataArrayKey;
    int v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
    id v27 = v21;
    int v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
    [v17 sendRecoverCommand:v22 forChatGUID:v3];
  }

  else if (IMOSLoggingEnabled(v6, v7))
  {
    uint64_t v23 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v31 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "Recently Deleted | IMDaemon_Chat skipping: chat not found for guid: %@",  buf,  0xCu);
    }
  }
}

void sub_10002C13C(id a1, NSString *a2, unint64_t a3, BOOL *a4)
{
  uint64_t v4 = a2;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 existingChatWithGUID:v4]);

  if (v6)
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceName]);
    unsigned int v10 = [v9 isEqualToString:IMServiceNameSMS];

    if (v10) {
      uint64_t v11 = IMGreenTeaMessageDeleteLog();
    }
    if (IMOSLoggingEnabled(v11, v12))
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory("Chat");
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 138412290;
        uint64_t v35 = (NSString *)v6;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Sending live sync delete command for chat: %@",  buf,  0xCu);
      }
    }

    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceName]);
    unsigned int v16 = [v15 isEqualToString:IMServiceNameSMS];
    id v17 = (id *)&IMServiceNameiMessage;
    if (v16) {
      id v17 = (id *)&IMServiceNameSMS;
    }
    id v18 = *v17;

    unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(+[IMDAccountController sharedInstance](&OBJC_CLASS___IMDAccountController, "sharedInstance"));
    int v20 = (void *)objc_claimAutoreleasedReturnValue([v19 anySessionForServiceName:v18]);

    v33[0] = v4;
    v32[0] = IMDCommandChatGUIDKey;
    v32[1] = IMDCommandChatGroupIDKey;
    int v21 = (void *)objc_claimAutoreleasedReturnValue([v6 groupID]);
    v33[1] = v21;
    v32[2] = IMDCommandChatParticipantsKey;
    int v22 = (void *)objc_claimAutoreleasedReturnValue([v6 participantHandles]);
    v33[2] = v22;
    v32[3] = IMDChatWasReportedAsJunkKey;
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v6 wasReportedAsJunk]));
    v33[3] = v23;
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  4LL));

    BOOL v29 = v24;
    v30[0] = IMDPermanentDeleteCommandChatMetadataArrayKey;
    unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v29, 1LL));
    v30[1] = IMDDeleteCommandIsPermanentDeleteKey;
    v31[0] = v25;
    v31[1] = &__kCFBooleanTrue;
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  2LL));

    [v20 sendDeleteCommand:v26 forChatGUID:v4];
  }

  else if (IMOSLoggingEnabled(v7, v8))
  {
    uint64_t v27 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 138412290;
      uint64_t v35 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "Recently Deleted | IMDaemon_Chat skipping: chat not found for guid: %@",  buf,  0xCu);
    }
  }
}

void sub_10002C4B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 replyProxy]);

  [v5 permanentlyDeletedMessagesInChatsWithDeletedChatGUIDs:v3 queryID:*(void *)(a1 + 32)];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMDBroadcastController sharedProvider](&OBJC_CLASS___IMDBroadcastController, "sharedProvider"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 broadcasterForChatListeners]);

  id v8 = [v7 permanentlyDeletedMessagesInChatsWithDeletedChatGUIDs:v3];
  if (IMOSLoggingEnabled(v8, v9))
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory("IMDaemon");
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Recently Deleted | Finished permanently deleting messages in recently deleted for the given chats.",  v12,  2u);
    }
  }
}

uint64_t sub_10002C910()
{
  uint64_t v1 = type metadata accessor for Logger(0LL);
  v0[2] = v1;
  uint64_t v2 = *(void *)(v1 - 8);
  v0[3] = v2;
  v0[4] = swift_task_alloc((*(void *)(v2 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  v0[5] = type metadata accessor for DaemonWorkActor(0LL);
  v0[6] = static DaemonWorkActor.shared.getter();
  uint64_t v3 = type metadata accessor for MainActor(0LL);
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  v0[7] = v4;
  v0[8] = v5;
  return swift_task_switch(sub_10002C9A4, v4, v5);
}

id sub_10002C9A4()
{
  uint64_t v2 = v0[3];
  uint64_t v1 = v0[4];
  uint64_t v3 = v0[2];
  uint64_t v4 = sub_10002D2A8();
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  id v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    id v8 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Loading accounts", v8, 2u);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  uint64_t v10 = v0[3];
  uint64_t v9 = v0[4];
  uint64_t v11 = v0[2];

  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  id result = [(id)objc_opt_self(IMDAccountController) sharedInstance];
  if (result)
  {
    uint64_t v13 = result;
    [result load];

    id result = [(id)objc_opt_self(ParentalControls) standardControls];
    if (result)
    {
      uint64_t v14 = result;
      [result updateAccountActivation];

      v0[9] = static DaemonWorkActor.shared.getter();
      unsigned int v15 = (void *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
      v0[10] = v15;
      void *v15 = v0;
      v15[1] = sub_10002CB64;
      return (id)withCheckedContinuation<A>(isolation:function:_:)();
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t sub_10002CB64()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 72);
  swift_task_dealloc(*(void *)(*v0 + 80));
  swift_release(v2);
  return swift_task_switch(sub_10002CBB8, *(void *)(v1 + 56), *(void *)(v1 + 64));
}

uint64_t sub_10002CBB8()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_release(*(void *)(v0 + 48));
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_10002CBF4(uint64_t a1)
{
  uint64_t v2 = sub_10002D164(&qword_10006FF20);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2);
  id v5 = [(id)objc_opt_self(IMDChatRegistry) sharedInstance];
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))( (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL),  a1,  v2);
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 16) & ~v6;
  uint64_t v8 = swift_allocObject(&unk_100065DA8, v7 + v4, v6 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))( v8 + v7,  (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v2);
  aBlock[4] = sub_10002D208;
  uint64_t v11 = v8;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_10002D044;
  aBlock[3] = &unk_100065DC0;
  uint64_t v9 = _Block_copy(aBlock);
  swift_release(v11);
  [v5 loadChatsWithCompletionBlock:v9];
  _Block_release(v9);
}

void sub_10002CD48()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v4 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v31 - v5;
  uint64_t v7 = sub_10002D2A8();
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v1 + 16);
  uint64_t v9 = v8(v6, v7, v0);
  uint64_t v10 = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Loading transfers", v12, 2u);
    swift_slowDealloc(v12, -1LL, -1LL);
  }

  uint64_t v13 = *(void (**)(char *, uint64_t))(v1 + 8);
  v13(v6, v0);

  uint64_t v14 = v8(v4, v7, v0);
  unsigned int v15 = (os_log_s *)Logger.logObject.getter(v14);
  os_log_type_t v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    id v17 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)id v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Kicking off auto reconnect", v17, 2u);
    swift_slowDealloc(v17, -1LL, -1LL);
  }

  v13(v4, v0);
  id v18 = [(id)objc_opt_self(IMDAccountController) sharedInstance];
  if (!v18)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }

  unsigned int v19 = v18;
  id v20 = [v18 activeSessions];

  if (v20)
  {
    unint64_t v21 = sub_10002D250();
    uint64_t v22 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v20, v21);

    if ((unint64_t)v22 >> 62)
    {
      if (v22 < 0) {
        uint64_t v28 = v22;
      }
      else {
        uint64_t v28 = v22 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v22);
      uint64_t v24 = _CocoaArrayWrapper.endIndex.getter(v28);
      swift_bridgeObjectRelease(v22, v29);
      if (v24) {
        goto LABEL_9;
      }
    }

    else
    {
      uint64_t v24 = *(void *)((v22 & 0xFFFFFFFFFFFFF8LL) + 0x10);
      if (v24)
      {
LABEL_9:
        if (v24 >= 1)
        {
          for (uint64_t i = 0LL; i != v24; ++i)
          {
            if ((v22 & 0xC000000000000001LL) != 0) {
              id v26 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v22);
            }
            else {
              id v26 = *(id *)(v22 + 8 * i + 32);
            }
            uint64_t v27 = v26;
            [v26 autoReconnect];
          }

          goto LABEL_19;
        }

        __break(1u);
        goto LABEL_21;
      }
    }

LABEL_19:
    swift_bridgeObjectRelease(v22, v23);
    uint64_t v30 = sub_10002D164(&qword_10006FF20);
    CheckedContinuation.resume(returning:)(v30, v30);
    return;
  }

LABEL_22:
  __break(1u);
}

  __break(1u);
}

  uint64_t v69 = *(void *)(v0 + 232);
  __int128 v70 = *(void *)(v0 + 224);
  v72 = *(void *)(v0 + 192);
  uint64_t v71 = *(void *)(v0 + 200);
  unsigned int v74 = *(void *)(v0 + 176);
  v73 = *(void *)(v0 + 184);
  v75 = *(void *)(v0 + 168);
  id v76 = *(void *)(v0 + 144);
  swift_task_dealloc(*(void *)(v0 + 240));
  swift_task_dealloc(v69);
  swift_task_dealloc(v70);
  swift_task_dealloc(v71);
  swift_task_dealloc(v72);
  swift_task_dealloc(v73);
  swift_task_dealloc(v74);
  swift_task_dealloc(v75);
  swift_task_dealloc(v76);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10002D044(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  v4(a2);
  return swift_release(v3);
}

uint64_t sub_10002D080()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t sub_10002D090()
{
  return swift_allocObject(v0, 16LL, 7LL);
}

uint64_t sub_10002D0A0()
{
  uint64_t v2 = *(int **)(**(void **)v0 + 80LL);
  uint64_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  uint64_t v3 = (void *)swift_task_alloc(v2[1]);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_10002D0FC;
  return v5();
}

uint64_t sub_10002D0FC()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t type metadata accessor for AccountLoader()
{
  return objc_opt_self(&OBJC_CLASS____TtC7imagent13AccountLoader);
}

uint64_t sub_10002D164(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_10002D1A4()
{
  uint64_t v1 = sub_10002D164(&qword_10006FF20);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

void sub_10002D208()
{
}

uint64_t sub_10002D238(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10002D248(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

unint64_t sub_10002D250()
{
  unint64_t result = qword_10006FF28;
  if (!qword_10006FF28)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___IMDServiceSession);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10006FF28);
  }

  return result;
}

uint64_t sub_10002D28C(uint64_t a1)
{
  return sub_10002D440(a1, qword_100070F88);
}

uint64_t sub_10002D2A8()
{
  return sub_10002D31C(&qword_100071090, (uint64_t)qword_100070F88);
}

uint64_t sub_10002D2C4(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_10002D2DC(uint64_t a1)
{
  return sub_10002D440(a1, qword_100070FA0);
}

uint64_t sub_10002D300()
{
  return sub_10002D31C(&qword_100071098, (uint64_t)qword_100070FA0);
}

uint64_t sub_10002D31C(void *a1, uint64_t a2)
{
  if (*a1 != -1LL) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger(0LL);
  return sub_10002D2C4(v3, a2);
}

uint64_t sub_10002D35C(uint64_t a1)
{
  return sub_10002D440(a1, qword_100070FB8);
}

uint64_t sub_10002D380()
{
  return sub_10002D31C(&qword_1000710A0, (uint64_t)qword_100070FB8);
}

uint64_t sub_10002D39C(uint64_t a1)
{
  return sub_10002D440(a1, qword_100070FD0);
}

uint64_t sub_10002D3C0()
{
  return sub_10002D31C(&qword_1000710A8, (uint64_t)qword_100070FD0);
}

uint64_t sub_10002D3DC(uint64_t a1)
{
  return sub_10002D440(a1, qword_100070FE8);
}

uint64_t sub_10002D400()
{
  return sub_10002D31C(&qword_1000710B0, (uint64_t)qword_100070FE8);
}

uint64_t sub_10002D41C(uint64_t a1)
{
  return sub_10002D440(a1, qword_100071000);
}

uint64_t sub_10002D440(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = type metadata accessor for Logger(0LL);
  sub_10002D4C0(v3, a2);
  sub_10002D2C4(v3, (uint64_t)a2);
  uint64_t v4 = static Logger.messagesSubsystem.getter();
  return Logger.init(subsystem:category:)(v4);
}

uint64_t sub_10002D4A4()
{
  return sub_10002D31C(qword_1000710B8, (uint64_t)qword_100071000);
}

uint64_t *sub_10002D4C0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *(void *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    uint64_t v4 = swift_slowAlloc(*(void *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }

  return a2;
}

uint64_t sub_10002D540()
{
  return swift_unknownObjectRetain(*(void *)(v0 + 16));
}

uint64_t sub_10002D5D0(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  *(void *)(v1 + 16) = a1;
  return swift_unknownObjectRelease(v3);
}

void *sub_10002D614(uint64_t a1)
{
  return &j_j__swift_endAccess;
}

uint64_t sub_10002D68C()
{
  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t sub_10002D6FC(char a1)
{
  uint64_t result = swift_beginAccess(v1 + 24, v4, 1LL, 0LL);
  *(_BYTE *)(v1 + 24) = a1;
  return result;
}

void *sub_10002D738(uint64_t a1)
{
  return &j_j__swift_endAccess;
}

void *sub_10002D7B4()
{
  uint64_t v1 = *(void **)(v0 + 32);
  id v2 = v1;
  return v1;
}

void sub_10002D848(uint64_t a1)
{
  uint64_t v3 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = a1;
}

void *sub_10002D88C(uint64_t a1)
{
  return &j_j__swift_endAccess;
}

uint64_t sub_10002D8C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10002D90C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + 240;
  swift_beginAccess(v3, v5, 0LL, 0LL);
  return sub_10002D954(v3, a1);
}

uint64_t sub_10002D954(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10002D164(&qword_10006FF30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002D99C(uint64_t a1)
{
  uint64_t v3 = v1 + 240;
  swift_beginAccess(v3, v5, 33LL, 0LL);
  sub_10002D9EC(a1, v3);
  return swift_endAccess(v5);
}

uint64_t sub_10002D9EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10002D164(&qword_10006FF30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

void *sub_10002DA34(uint64_t a1)
{
  return &j_j__swift_endAccess;
}

id sub_10002DA70()
{
  return *(id *)(v0 + 280);
}

void sub_10002DAA0(uint64_t a1)
{
  uint64_t v3 = *(void **)(v1 + 280);
  *(void *)(v1 + 280) = a1;
}

void *sub_10002DAE4(uint64_t a1)
{
  return &j__swift_endAccess;
}

uint64_t sub_10002DB24(void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  uint64_t v13 = swift_allocObject(v6, 288LL, 7LL);
  sub_10002DBA0(a1, a2, a3, a4, a5, a6);
  return v13;
}

id sub_10002DBA0(void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v35 = a6;
  uint64_t v36 = a5;
  id v37 = a4;
  uint64_t v38 = a3;
  uint64_t v39 = a2;
  uint64_t v9 = type metadata accessor for Logger(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v11);
  unsigned int v15 = (char *)&v34 - v14;
  *(_BYTE *)(v7 + 24) = 0;
  *(void *)(v7 + 32) = 0LL;
  *(_OWORD *)(v7 + 240) = 0u;
  *(_OWORD *)(v7 + 256) = 0u;
  *(void *)(v7 + 272) = 0LL;
  *(void *)(v7 + 280) =  [(id)objc_opt_self(IMDBackgroundMessagingAPIListener) sharedListener];
  uint64_t v16 = sub_10002D2A8();
  uint64_t v34 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v17 = v34(v15, v16, v9);
  id v18 = (os_log_s *)Logger.logObject.getter(v17);
  os_log_type_t v19 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v18, v19))
  {
    id v20 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)id v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "imagent launching", v20, 2u);
    swift_slowDealloc(v20, -1LL, -1LL);
  }

  unint64_t v21 = *(void (**)(char *, uint64_t))(v10 + 8);
  v21(v15, v9);
  sub_10002D8C8((uint64_t)a1, v7 + 40);
  sub_10002D8C8((uint64_t)v39, v7 + 80);
  sub_10002D8C8((uint64_t)v38, v7 + 120);
  sub_10002D8C8((uint64_t)v37, v7 + 160);
  sub_10002D8C8((uint64_t)v36, v7 + 200);
  id result = [(id)objc_opt_self(ParentalControls) standardControls];
  if (result)
  {
    *(void *)(v7 + 16) = result;
    [(id)objc_opt_self(IMDLocalDaemon) setSharedDaemon:v7];
    uint64_t v23 = a1[3];
    uint64_t v24 = a1[4];
    sub_10002DED4(a1, v23);
    unsigned int v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 32);
    uint64_t v26 = swift_retain(v7);
    v25(v26, v23, v24);
    swift_release(v7);
    uint64_t v27 = a1[3];
    uint64_t v28 = a1[4];
    sub_10002DED4(a1, v27);
    (*(void (**)(uint64_t, uint64_t))(v28 + 24))(v27, v28);
    uint64_t v29 = v34(v13, v16, v9);
    uint64_t v30 = (os_log_s *)Logger.logObject.getter(v29);
    os_log_type_t v31 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "imagent daemon init complete", v32, 2u);
      swift_slowDealloc(v32, -1LL, -1LL);
    }

    uint64_t v33 = ((uint64_t (*)(char *, uint64_t))v21)(v13, v9);
    (*(void (**)(uint64_t))(*(void *)v7 + 296LL))(v33);
    sub_10002EBC8(v35, &qword_10006FF30);
    sub_10002DEF8(v36);
    sub_10002DEF8(v37);
    sub_10002DEF8(v38);
    sub_10002DEF8(v39);
    sub_10002DEF8(a1);
    return (id)v7;
  }

  else
  {
    __break(1u);
  }

  return result;
}

void *sub_10002DED4(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_10002DEF8(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

id sub_10002DF18()
{
  id result = [(id)objc_opt_self(IMSystemMonitor) sharedInstance];
  if (result)
  {
    id v2 = result;
    [result removeListener:v0];

    swift_unknownObjectRelease(*(void *)(v0 + 16));
    sub_10002DEF8((void *)(v0 + 40));
    sub_10002DEF8((void *)(v0 + 80));
    sub_10002DEF8((void *)(v0 + 120));
    sub_10002DEF8((void *)(v0 + 160));
    sub_10002DEF8((void *)(v0 + 200));
    sub_10002EBC8(v0 + 240, &qword_10006FF30);

    return (id)v0;
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_10002DFC4()
{
  return swift_deallocClassInstance(v0, 288LL, 7LL);
}

uint64_t sub_10002DFE4()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)aBlock - v8;
  if (((*(uint64_t (**)(uint64_t))(*v0 + 184LL))(v7) & 1) != 0)
  {
    uint64_t v10 = sub_10002D2A8();
    uint64_t v11 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v10, v2);
    uint64_t v12 = (os_log_s *)Logger.logObject.getter(v11);
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Attempting to load daemon after setup is complete", v14, 2u);
      swift_slowDealloc(v14, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }

  else
  {
    uint64_t v15 = v0[8];
    uint64_t v16 = v0[9];
    sub_10002DED4(v0 + 5, v15);
    uint64_t v18 = sub_10002D2A8();
    uint64_t v19 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v9, v18, v2);
    id v20 = (os_log_s *)Logger.logObject.getter(v19);
    os_log_type_t v21 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  v21,  "Device is not yet ready, reattempting load in 15 seconds",  v22,  2u);
      swift_slowDealloc(v22, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v9, v2);
    aBlock[4] = sub_10002EB0C;
    uint64_t v26 = v1;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_10002E258;
    aBlock[3] = &unk_100065DF0;
    uint64_t v23 = _Block_copy(aBlock);
    uint64_t v24 = v26;
    swift_retain(v1);
    swift_release(v24);
    im_dispatch_after(v23, 15.0);
    _Block_release(v23);
  }

  return 0LL;
}

uint64_t sub_10002E258(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

uint64_t sub_10002E284()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10002D164(&qword_100070780);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for Logger(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v0 + 288LL))(v7);
  if ((result & 1) != 0)
  {
    uint64_t v11 = sub_10002D2A8();
    uint64_t v12 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v11, v5);
    os_log_type_t v13 = (os_log_s *)Logger.logObject.getter(v12);
    os_log_type_t v14 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Load conditions met, bringing up services", v15, 2u);
      swift_slowDealloc(v15, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    uint64_t v16 = type metadata accessor for TaskPriority(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56LL))(v4, 1LL, 1LL, v16);
    type metadata accessor for DaemonWorkActor(0LL);
    uint64_t v17 = swift_retain(v1);
    uint64_t v18 = static DaemonWorkActor.shared.getter(v17);
    uint64_t v19 = (void *)swift_allocObject(&unk_100065E28, 40LL, 7LL);
    v19[2] = v18;
    v19[3] = &protocol witness table for MainActor;
    v19[4] = v1;
    uint64_t v20 = sub_10002E744((uint64_t)v4, (uint64_t)&unk_10006FF40, (uint64_t)v19);
    return swift_release(v20);
  }

  return result;
}

uint64_t sub_10002E450(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  uint64_t v5 = type metadata accessor for DaemonWorkActor(0LL);
  v4[3] = static DaemonWorkActor.shared.getter(v5);
  uint64_t v6 = type metadata accessor for MainActor(0LL);
  uint64_t v7 = dispatch thunk of Actor.unownedExecutor.getter(v6, &protocol witness table for MainActor);
  v4[4] = v7;
  v4[5] = v8;
  return swift_task_switch(sub_10002E4BC, v7, v8);
}

uint64_t sub_10002E4BC()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = v1[13];
  uint64_t v3 = v1[14];
  sub_10002DED4(v1 + 10, v2);
  uint64_t v4 = *(int **)(v3 + 8);
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)v4 + *v4);
  uint64_t v5 = (void *)swift_task_alloc(v4[1]);
  *(void *)(v0 + 4_Block_object_dispose(va, 8) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_10002E538;
  return v7(v2, v3);
}

uint64_t sub_10002E538()
{
  uint64_t v1 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 48));
  return swift_task_switch(sub_10002E584, *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_10002E584()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = v1[18];
  uint64_t v3 = v1[19];
  sub_10002DED4(v1 + 15, v2);
  uint64_t v4 = *(int **)(v3 + 8);
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)v4 + *v4);
  uint64_t v5 = (void *)swift_task_alloc(v4[1]);
  *(void *)(v0 + 56) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_10002E600;
  return v7(v2, v3);
}

uint64_t sub_10002E600()
{
  uint64_t v1 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 56));
  return swift_task_switch(sub_10002E64C, *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_10002E64C()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = v1[28];
  uint64_t v3 = v1[29];
  sub_10002DED4(v1 + 25, v2);
  uint64_t v4 = (void *)swift_task_alloc(async function pointer to dispatch thunk of ClientConnectionManaging.startAcceptingIncomingConnections()[1]);
  *(void *)(v0 + 64) = v4;
  void *v4 = v0;
  v4[1] = sub_10002E6BC;
  return dispatch thunk of ClientConnectionManaging.startAcceptingIncomingConnections()(v2, v3);
}

uint64_t sub_10002E6BC()
{
  uint64_t v1 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 64));
  return swift_task_switch(sub_10002E708, *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_10002E708()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = swift_release(*(void *)(v0 + 24));
  (*(void (**)(uint64_t))(*(void *)v1 + 304LL))(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10002E744(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_10002EBC8(a1, &qword_100070780);
    uint64_t v8 = 7168LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      uint64_t v10 = *(void *)(a3 + 24);
      uint64_t ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9);
      uint64_t v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      uint64_t v14 = v13;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }

  else
  {
    unsigned __int8 v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    uint64_t v8 = v15 | 0x1C00LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9) {
      goto LABEL_3;
    }
  }

  uint64_t v12 = 0LL;
  uint64_t v14 = 0LL;
LABEL_6:
  uint64_t v16 = swift_allocObject(&unk_100065E50, 32LL, 7LL);
  *(void *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0LL;
    v19[1] = 0LL;
    uint64_t v17 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_100070180, v16);
}

uint64_t sub_10002E890()
{
  uint64_t v1 = type metadata accessor for Logger(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(uint64_t))(*v0 + 192LL))(1LL);
  uint64_t v5 = v0[8];
  uint64_t v6 = v0[9];
  sub_10002DED4(v0 + 5, v5);
  (*(void (**)(uint64_t, uint64_t))(v6 + 40))(v5, v6);
  uint64_t v7 = v0[8];
  uint64_t v8 = v0[9];
  sub_10002DED4(v0 + 5, v7);
  (*(void (**)(uint64_t, uint64_t))(v8 + 48))(v7, v8);
  uint64_t v10 = v0[8];
  uint64_t v9 = v0[9];
  sub_10002DED4(v0 + 5, v10);
  (*(void (**)(uint64_t, uint64_t))(v9 + 56))(v10, v9);
  uint64_t v11 = sub_10002D2A8();
  uint64_t v12 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v11, v1);
  uint64_t v13 = (os_log_s *)Logger.logObject.getter(v12);
  os_log_type_t v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    unsigned __int8 v15 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)unsigned __int8 v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Setup complete", v15, 2u);
    swift_slowDealloc(v15, -1LL, -1LL);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_10002EB0C()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296LL))();
}

uint64_t sub_10002EB18(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10002EB28(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_10002EB30()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_10002EB5C()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc(dword_10006FF3C);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_10002D0FC;
  return sub_10002E450((uint64_t)v3, v4, v5, v2);
}

uint64_t type metadata accessor for MessagesDaemon()
{
  return objc_opt_self(&OBJC_CLASS____TtC7imagent14MessagesDaemon);
}

uint64_t sub_10002EBC8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10002D164(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_10002EC04(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_10002EC68;
  return v6(a1);
}

uint64_t sub_10002EC68()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10002ECB4()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10002ECD8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_1000708A4);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10002D0FC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1000708A0 + dword_1000708A0))(a1, v4);
}

id sub_10002EE5C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ChatInsertMessageRequestHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t IMDaemonAutomationRequestHandler.requiredCapabilities.getter()
{
  return 0LL;
}

uint64_t sub_10002EEA4()
{
  return swift_bridgeObjectRetain(*(void *)(v0
                                            + OBJC_IVAR____TtC7imagent31ChatInsertMessageRequestHandler_requiredEntitlements));
}

void sub_10002EEC0(void *a1@<X8>)
{
  *a1 = 0LL;
}

void *sub_10002EEC8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_10002EEDC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_10002EEF0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_10002EF04(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_10002EF34@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(_BYTE *)(a2 + _Block_object_dispose(va, 8) = v3 == 0;
  return result;
}

uint64_t *sub_10002EF60@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(_BYTE *)(a2 + _Block_object_dispose(va, 8) = v5 == 0;
  return result;
}

void *sub_10002EF84(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_10002EF98(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_10002EFAC(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_10002EFC0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_10002EFD4(void *a1)
{
  return (*v1 & ~*a1) == 0LL;
}

BOOL sub_10002EFE8(void *a1)
{
  return (*v1 & *a1) == 0LL;
}

BOOL sub_10002EFFC(void *a1)
{
  return (*a1 & ~*v1) == 0LL;
}

BOOL sub_10002F010()
{
  return *v0 == 0LL;
}

uint64_t sub_10002F020(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

void *sub_10002F038(void *result)
{
  *v1 &= ~*result;
  return result;
}

BOOL sub_10002F04C(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_10002F060@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_10002FD9C(a1);
  uint64_t result = swift_bridgeObjectRelease(a1, v5);
  *a2 = v4;
  return result;
}

void *sub_10002F09C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void *sub_10002F0A8@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(_BYTE *)(a2 + _Block_object_dispose(va, 8) = 0;
  return result;
}

void sub_10002F0B8(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_10002F0C4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10002F194(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10002FDD4((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }

  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10002FDD4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_10002DEF8(v12);
  return v7;
}

uint64_t sub_10002F194(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0LL, HIBYTE(a6) & 0xF, __dst, a3);
            uint64_t result = 0LL;
            *a1 = (uint64_t)__dst;
            return result;
          }

          goto LABEL_17;
        }
      }
    }

LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
  }
}

uint64_t sub_10002F34C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10002F3E0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10002F5B8(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10002F5B8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10002F3E0(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000LL) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000LL) != 0) {
    uint64_t v4 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v4 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v4)
  {
    while (1)
    {
      uint64_t v5 = sub_10002F554(v4, 0LL);
      if (v4 < 0) {
        break;
      }
      uint64_t v6 = v5;
      uint64_t v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0) {
        goto LABEL_14;
      }
      if (v7 == v4) {
        return v6;
      }
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "invalid Collection: less than 'count' elements in collection",  60LL,  2LL,  "Swift/ContiguousArrayBuffer.swift",  33LL,  v10,  1122LL,  0);
      __break(1u);
LABEL_10:
      uint64_t v4 = String.UTF8View._foreignCount()();
      if (!v4) {
        return &_swiftEmptyArrayStorage;
      }
    }

    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableBufferPointer with negative count",  46LL,  2LL,  "Swift/UnsafeBufferPointer.swift",  31LL,  v10,  71LL,  0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Insufficient space allocated to copy string contents",  52LL,  2LL,  "Swift/StringUTF8View.swift",  26LL,  v10,  430LL,  0);
    __break(1u);
  }

  else
  {
    return &_swiftEmptyArrayStorage;
  }

  return result;
}

void *sub_10002F554(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v4 = sub_10002D164(&qword_1000708D0);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  void v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10002F5B8(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_30;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_10002D164(&qword_1000708D0);
    uint64_t v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  int v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8]) {
      memmove(v13, v14, v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_28;
  }

  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4, v14);
    return (uint64_t)v11;
  }

void sub_10002F704(void *a1, uint64_t a2, unint64_t a3, int a4, uint64_t a5, unint64_t a6)
{
  LODWORD(v63) = a4;
  uint64_t v11 = type metadata accessor for Logger(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  unsigned __int8 v15 = (char *)&v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = (char *)&v60 - v17;
  uint64_t v19 = __chkstk_darwin(v16);
  uint64_t v21 = (char *)&v60 - v20;
  __chkstk_darwin(v19);
  if (a1)
  {
    uint64_t v23 = HIBYTE(a6) & 0xF;
    if ((a6 & 0x2000000000000000LL) == 0) {
      uint64_t v23 = a5 & 0xFFFFFFFFFFFFLL;
    }
    if (v23)
    {
      if (!a3) {
        goto LABEL_15;
      }
      uint64_t v24 = HIBYTE(a3) & 0xF;
      if ((a3 & 0x2000000000000000LL) == 0) {
        uint64_t v24 = a2 & 0xFFFFFFFFFFFFLL;
      }
      if (v24)
      {
        unsigned int v25 = (char *)&v60 - v22;
        uint64_t v26 = (void *)objc_opt_self(&OBJC_CLASS___IMDAccountController);
        id v62 = a1;
        id v27 = [v26 sharedInstance];
        if (!v27)
        {
          __break(1u);
          return;
        }

        uint64_t v28 = v27;
        NSString v29 = String._bridgeToObjectiveC()();
        id v30 = [v28 anySessionForServiceName:v29];

        if (v30)
        {
          NSString v31 = String._bridgeToObjectiveC()();
          id v61 = String._bridgeToObjectiveC()();
          id v32 = v62;
          [v30 didReceiveMessage:v62 forChat:v31 style:v63 fromIDSID:v61];

          return;
        }

        uint64_t v63 = a5;
        uint64_t v54 = sub_10002D3C0();
        (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v25, v54, v11);
        uint64_t v55 = swift_bridgeObjectRetain_n(a6, 2LL);
        uint64_t v56 = (os_log_s *)Logger.logObject.getter(v55);
        os_log_type_t v57 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v56, v57))
        {
          uint64_t v58 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          uint64_t v59 = swift_slowAlloc(32LL, -1LL);
          uint64_t v65 = v59;
          *(_DWORD *)uint64_t v58 = 136315138;
          swift_bridgeObjectRetain(a6);
          uint64_t v64 = sub_10002F0C4(v63, a6, &v65);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, &v65, v58 + 4, v58 + 12);
          swift_bridgeObjectRelease_n(a6, 3LL);
          _os_log_impl( (void *)&_mh_execute_header,  v56,  v57,  "No session for serviceName: %s -- can't insert a received message.",  v58,  0xCu);
          swift_arrayDestroy(v59, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v59, -1LL, -1LL);
          swift_slowDealloc(v58, -1LL, -1LL);

          (*(void (**)(char *, uint64_t))(v12 + 8))(v25, v11);
          return;
        }

        swift_bridgeObjectRelease_n(a6, 2LL);
        uint64_t v38 = *(void (**)(char *, uint64_t))(v12 + 8);
        uint64_t v39 = v25;
      }

      else
      {
LABEL_15:
        id v40 = a1;
        uint64_t v41 = sub_10002D3C0();
        uint64_t v42 = v12;
        uint64_t v43 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 16))(v21, v41, v11);
        uint64_t v44 = (os_log_s *)Logger.logObject.getter(v43);
        os_log_type_t v45 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v44, v45))
        {
          uint64_t v46 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
          *(_WORD *)uint64_t v46 = 0;
          _os_log_impl((void *)&_mh_execute_header, v44, v45, "No chatIdentifier to receive a message to.", v46, 2u);
          swift_slowDealloc(v46, -1LL, -1LL);
        }

        uint64_t v38 = *(void (**)(char *, uint64_t))(v42 + 8);
        uint64_t v39 = v21;
      }
    }

    else
    {
      id v47 = a1;
      uint64_t v48 = sub_10002D3C0();
      uint64_t v49 = v12;
      uint64_t v50 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 16))(v18, v48, v11);
      uint64_t v51 = (os_log_s *)Logger.logObject.getter(v50);
      os_log_type_t v52 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v51, v52))
      {
        id v53 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)id v53 = 0;
        _os_log_impl((void *)&_mh_execute_header, v51, v52, "No serviceName to receive a message from.", v53, 2u);
        swift_slowDealloc(v53, -1LL, -1LL);
      }

      uint64_t v38 = *(void (**)(char *, uint64_t))(v49 + 8);
      uint64_t v39 = v18;
    }
  }

  else
  {
    uint64_t v33 = sub_10002D3C0();
    uint64_t v34 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v33, v11);
    uint64_t v35 = (os_log_s *)Logger.logObject.getter(v34);
    os_log_type_t v36 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v35, v36))
    {
      id v37 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)id v37 = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "No messageItem to receive.", v37, 2u);
      swift_slowDealloc(v37, -1LL, -1LL);
    }

    uint64_t v38 = *(void (**)(char *, uint64_t))(v12 + 8);
    uint64_t v39 = v15;
  }

  v38(v39, v11);
}

uint64_t type metadata accessor for ChatInsertMessageRequestHandler()
{
  return objc_opt_self(&OBJC_CLASS____TtC7imagent31ChatInsertMessageRequestHandler);
}

void type metadata accessor for MessagesClientCapabilities()
{
  if (!qword_100070220)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, &unk_100065EA8);
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100070220);
    }
  }

uint64_t sub_10002FCCC()
{
  return sub_10002FD5C(&qword_100070228, (uint64_t)&unk_10004A3C8);
}

uint64_t sub_10002FCF0()
{
  return sub_10002FD5C(&qword_100070230, (uint64_t)&unk_10004A394);
}

uint64_t sub_10002FD14()
{
  return sub_10002FD5C(&qword_100070238, (uint64_t)&unk_10004A3F4);
}

uint64_t sub_10002FD38()
{
  return sub_10002FD5C(&qword_100070240, (uint64_t)&unk_10004A430);
}

uint64_t sub_10002FD5C(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for MessagesClientCapabilities();
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_10002FD9C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0LL;
  }
  uint64_t result = 0LL;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0LL;
    }
    result |= v5;
    --v1;
  }

  while (v1);
  return result;
}

uint64_t sub_10002FDD4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t IMDaemonFileTransferRequestHandler.requiredCapabilities.getter()
{
  return 256LL;
}

Swift::Void __swiftcall IMDaemonFileTransferRequestHandler.failTransferPreviewGeneration(_:)(Swift::String a1)
{
}

Swift::Void __swiftcall IMDaemonFileTransferRequestHandler.successfullyGeneratedPreview(forTransfer:withPreviewSize:)( Swift::String forTransfer, CGSize withPreviewSize)
{
  double height = withPreviewSize.height;
  double width = withPreviewSize.width;
  id v4 = [(id)objc_opt_self(IMDFileTransferCenter) sharedInstance];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = String._bridgeToObjectiveC()();
    objc_msgSend(v5, "successfullyGeneratedPreviewForTransfer:withPreviewSize:", v6, width, height);
  }

  else
  {
    __break(1u);
  }

Swift::Void __swiftcall IMDaemonFileTransferRequestHandler.successfullyGeneratedPreview(forTransfer:)( Swift::String forTransfer)
{
}

void sub_10002FFAC(uint64_t a1, uint64_t a2, SEL *a3)
{
  id v4 = [(id)objc_opt_self(IMDFileTransferCenter) sharedInstance];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = String._bridgeToObjectiveC()();
    objc_msgSend(v5, *a3, v6);
  }

  else
  {
    __break(1u);
  }

void sub_100030040(void *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  uint64_t v7 = v6;
  int64_t v8 = (void *)objc_opt_self(&OBJC_CLASS___IMDFileTransferCenter);
  id v9 = a1;
  id v10 = [v8 sharedInstance];
  if (v10)
  {
    uint64_t v11 = v10;
    id v13 = String._bridgeToObjectiveC()();
    objc_msgSend(v11, *a4, v13);

    swift_bridgeObjectRelease(v7, v12);
  }

  else
  {
    __break(1u);
  }

uint64_t IMDaemonVCRequestHandler.requiredCapabilities.getter()
{
  return 8LL;
}

uint64_t sub_100030108(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_10002D2A8();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  uint64_t v9 = swift_bridgeObjectRetain(a1);
  id v10 = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v11 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)uint64_t v12 = 134217984;
    uint64_t v17 = *(void *)(a1 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v17, &v18, v12 + 4, v12 + 12);
    swift_bridgeObjectRelease(a1, v13);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Fetched %ld contacts from IMDP", v12, 0xCu);
    swift_slowDealloc(v12, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease(a1, v14);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return a2(a1);
}

uint64_t sub_100030278(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  unint64_t v5 = sub_1000306BC();
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a2,  &type metadata for String,  v5,  &protocol witness table for String);
  swift_retain(v3);
  v4(v6);
  swift_release(v3);
  return swift_bridgeObjectRelease(v6, v7);
}

void sub_100030374(uint64_t a1, uint64_t a2)
{
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, Class))(a2 + 16))(a2, isa);
}

id sub_100030434()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentClientRequestHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100030474()
{
  return swift_bridgeObjectRetain(*(void *)(v0
                                            + OBJC_IVAR____TtC7imagent26IntentClientRequestHandler_requiredEntitlements));
}

void sub_100030484(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for Logger(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_10002D2A8();
  uint64_t v10 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  os_log_type_t v11 = (os_log_s *)Logger.logObject.getter(v10);
  os_log_type_t v12 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Requesting contacts for handles", v13, 2u);
    swift_slowDealloc(v13, -1LL, -1LL);
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  id v14 = [(id)objc_opt_self(IMDDatabase) synchronousDatabase];
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  uint64_t v16 = swift_allocObject(&unk_1000660D0, 32LL, 7LL);
  *(void *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = a3;
  aBlock[4] = sub_10003071C;
  uint64_t v20 = v16;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_100030278;
  aBlock[3] = &unk_1000660E8;
  uint64_t v17 = _Block_copy(aBlock);
  uint64_t v18 = v20;
  swift_retain(a3);
  swift_release(v18);
  [v14 fetchContactsForIdentifiers:isa completionHandler:v17];
  _Block_release(v17);
  swift_unknownObjectRelease(v14);
}

uint64_t type metadata accessor for IntentClientRequestHandler()
{
  return objc_opt_self(&OBJC_CLASS____TtC7imagent26IntentClientRequestHandler);
}

uint64_t sub_100030690()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_1000306B4(uint64_t a1)
{
}

unint64_t sub_1000306BC()
{
  unint64_t result = qword_1000703A0;
  if (!qword_1000703A0)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___CNContact);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000703A0);
  }

  return result;
}

uint64_t sub_1000306F8()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10003071C(uint64_t a1)
{
  return sub_100030108(a1, *(uint64_t (**)(uint64_t))(v1 + 16));
}

uint64_t sub_100030724(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100030734(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t ClientRequestHandling<>.client.getter()
{
  id v1 = objc_getAssociatedObject(v0, &unk_1000703A8);
  uint64_t result = swift_endAccess(v6);
  if (v1)
  {
    _bridgeAnyObjectToAny(_:)(v5, v1);
    swift_unknownObjectRelease(v1);
    sub_1000307EC(v5, v6);
    uint64_t v3 = type metadata accessor for ClientConnection(0LL);
    swift_dynamicCast(&v4, v6, (char *)&type metadata for Any + 8, v3, 7LL);
    return v4;
  }

  else
  {
    __break(1u);
  }

  return result;
}

_OWORD *sub_1000307EC(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000307FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ClientRequestHandling<>.client.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100030824(void *a1)
{
  uint64_t v1 = *a1;
  __int128 v2 = (void *)swift_retain(*a1);
  sub_1000308D8(v2);
  return swift_release(v1);
}

id ClientRequestHandling<>.init(client:)(void *a1)
{
  id v3 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v1)) init];
  sub_1000308D8(a1);

  swift_release(a1);
  return v3;
}

uint64_t sub_1000308D8(void *a1)
{
  return swift_endAccess(v4);
}

uint64_t sub_10003093C()
{
  return 16LL;
}

__n128 sub_100030948(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t IMDaemonChatFileTransferRequestHandler.requiredCapabilities.getter()
{
  return 260LL;
}

id sub_10003095C()
{
  v8[4] = sub_100031218;
  uint64_t v9 = v0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256LL;
  v8[2] = sub_10002E258;
  v8[3] = &unk_100066190;
  uint64_t v1 = _Block_copy(v8);
  uint64_t v2 = v9;
  swift_retain(v0);
  swift_release(v2);
  IMDSetInconsistencyHandler(v1);
  _Block_release(v1);
  IMRegisterForKeychainNotifications();
  sub_10003173C();
  id v3 = (void *)objc_opt_self(&OBJC_CLASS___IMDaemonCoreSpotlightManager);
  id v4 = [v3 sharedManager];
  [v4 registerForCoreSpotlightMigration];

  id v5 = [v3 sharedManager];
  [v5 registerForCoreSpotlightIndexing];

  id result = [(id)objc_opt_self(IMDReplayController) sharedInstance];
  if (result)
  {
    uint64_t v7 = result;
    [result deleteReplayDBIfNotUnderFirstUnlock];

    return (id)sub_100031C70();
  }

  else
  {
    __break(1u);
  }

  return result;
}

void sub_100030AA8()
{
  uint64_t v1 = type metadata accessor for URL(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  id v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for Logger(0LL);
  uint64_t v34 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);

  uint64_t v8 = (void *)objc_opt_self(&OBJC_CLASS___IMCommSafetySettingsManager);
  [*(id *)(v0 + 16) prewarmHSAAuthenticationServer];

  uint64_t v9 = (void *)objc_opt_self(&OBJC_CLASS___IMFeatureFlags);
  id v10 = [v9 sharedFeatureFlags];
  unsigned __int8 v11 = [v10 isAttachmentsPurgeabilityMonitoringEnabled];

  if ((v11 & 1) != 0
    || (id v12 = [(id)objc_opt_self(IMLockdownManager) sharedInstance]) != 0
    && (uint64_t v13 = v12, v14 = [v12 isInternalInstall], v13, v14))
  {
    uint64_t v15 = sub_10002D2A8();
    uint64_t v16 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v34 + 16))(v7, v15, v5);
    uint64_t v17 = (os_log_s *)Logger.logObject.getter(v16);
    os_log_type_t v18 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = v1;
      uint64_t v20 = v2;
      uint64_t v21 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Attachments purgeability monitoring enabled", v21, 2u);
      uint64_t v22 = v21;
      uint64_t v2 = v20;
      uint64_t v1 = v19;
      swift_slowDealloc(v22, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v34 + 8))(v7, v5);
    uint64_t v23 = (void *)objc_opt_self(&OBJC_CLASS___IMDFileEventBroadcaster);
    id v24 = [v23 sharedInstance];
    [v24 stopObserving];

    id v25 = (id)IMSMSDirectoryURL();
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    object = URL.path(percentEncoded:)(1)._object;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    id v27 = [v23 sharedInstance];
    NSString v28 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(object, v29);
    [v27 observeChangesInPath:v28];
  }

  id v30 = [(id)objc_opt_self(IMCTRCSUtilitiesManager) sharedManager];
  [v30 registerServiceCapabilityNotifications];

  id v31 = [v9 sharedFeatureFlags];
  unsigned int v32 = [v31 isMessagesAppDeletionEnabled];

  if (v32) {
    sub_100034C20();
  }
}

void sub_100030FB4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_10002D2A8();
  uint64_t v7 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v8 = (os_log_s *)Logger.logObject.getter(v7);
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    id v10 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)id v10 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  v9,  "Told that our state is inconsistent; reloading accounts and forcing clients to reconnect",
      v10,
      2u);
    swift_slowDealloc(v10, -1LL, -1LL);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  unsigned __int8 v11 = (void *)objc_opt_self(&OBJC_CLASS___IMDAccountController);
  id v12 = [v11 sharedInstance];
  if (!v12)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }

  uint64_t v13 = v12;
  [v12 load];

  id v14 = [v11 sharedInstance];
  if (!v14)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }

  uint64_t v15 = v14;
  id v16 = [v14 activeSessions];

  if (v16)
  {
    uint64_t v17 = sub_100032148(0LL, (unint64_t *)&qword_10006FF28, &OBJC_CLASS___IMDServiceSession_ptr);
    uint64_t v18 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v16, v17);

    if ((unint64_t)v18 >> 62)
    {
      if (v18 < 0) {
        uint64_t v24 = v18;
      }
      else {
        uint64_t v24 = v18 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v18);
      uint64_t v20 = _CocoaArrayWrapper.endIndex.getter(v24);
      swift_bridgeObjectRelease(v18, v25);
      if (v20) {
        goto LABEL_8;
      }
    }

    else
    {
      uint64_t v20 = *(void *)((v18 & 0xFFFFFFFFFFFFF8LL) + 0x10);
      if (v20)
      {
LABEL_8:
        if (v20 >= 1)
        {
          for (uint64_t i = 0LL; i != v20; ++i)
          {
            if ((v18 & 0xC000000000000001LL) != 0) {
              id v22 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v18);
            }
            else {
              id v22 = *(id *)(v18 + 8 * i + 32);
            }
            uint64_t v23 = v22;
            [v22 autoReconnect];
          }

          goto LABEL_18;
        }

        __break(1u);
        goto LABEL_20;
      }
    }

void sub_100031218()
{
}

uint64_t sub_100031220(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100031230(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

void sub_100031238()
{
  id v0 = [(id)objc_opt_self(IMDCKSyncController) sharedInstance];
  if (v0)
  {
    id v1 = v0;
    [v0 resumeSyncOnLaunchIfNeeded];
  }

  else
  {
    __break(1u);
  }

uint64_t sub_100031290()
{
  return swift_deallocClassInstance(v0, 24LL, 7LL);
}

uint64_t sub_1000312B4()
{
  uint64_t v1 = swift_allocObject(v0, 24LL, 7LL);
  *(void *)(v1 + 16) = [objc_allocWithZone((Class)IMDLegacyLaunchAssistant) init];
  return v1;
}

id sub_100031300()
{
  id result = [(id)objc_opt_self(IMSystemMonitor) sharedInstance];
  if (result)
  {
    uint64_t v1 = result;
    id v2 = [result systemIsShuttingDown];

    return v2;
  }

  else
  {
    __break(1u);
  }

  return result;
}

id sub_10003135C()
{
  return [*(id *)(*(void *)v0 + 16) hasDeviceName];
}

id sub_100031380()
{
  return sub_10003095C();
}

void sub_1000313A0(uint64_t a1)
{
  id v2 = [(id)objc_opt_self(IMSystemMonitor) sharedInstance];
  if (v2)
  {
    id v3 = v2;
    [v2 setActive:1];
    [v3 setReceivesMemoryWarnings:1];
    [v3 setUsesPowerNotifications:1];
    [v3 setWatchesDataProtectionLockState:1];
    [v3 addListener:a1];
  }

void sub_100031464()
{
  id v0 = [(id)objc_opt_self(IMDCKUtilities) sharedInstance];
  [v0 broadcastCloudKitStateAfterFetchingAccountStatus];
}

id sub_1000314B0()
{
  return [*(id *)(*(void *)v0 + 16) postAliveNotification];
}

void sub_1000314C4()
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  id v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v23 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for DispatchTime(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  unsigned __int8 v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v22 - v12;
  id v14 = [(id)objc_opt_self(IMUnlockMonitor) sharedInstance];
  unsigned __int8 v15 = [v14 isUnderFirstDataProtectionLock];

  if ((v15 & 1) == 0)
  {
    sub_100032148(0LL, &qword_1000704B0, &OBJC_CLASS___OS_dispatch_queue_ptr);
    id v16 = (void *)static OS_dispatch_queue.main.getter();
    static DispatchTime.now()();
    + infix(_:_:)(v11, 10.0);
    uint64_t v22 = v1;
    uint64_t v17 = *(void (**)(char *, uint64_t))(v8 + 8);
    v17(v11, v7);
    aBlock[4] = sub_100031238;
    void aBlock[5] = 0LL;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_10003128C;
    aBlock[3] = &unk_1000661F8;
    uint64_t v18 = _Block_copy(aBlock);
    static DispatchQoS.unspecified.getter();
    uint64_t v25 = &_swiftEmptyArrayStorage;
    unint64_t v19 = sub_100032070();
    uint64_t v20 = sub_10002D164(&qword_1000704B8);
    unint64_t v21 = sub_1000320B8();
    dispatch thunk of SetAlgebra.init<A>(_:)(&v25, v20, v21, v0, v19);
    OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v13, v6, v3, v18);
    _Block_release(v18);

    (*(void (**)(char *, uint64_t))(v22 + 8))(v3, v0);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v6, v24);
    v17(v13, v7);
  }

void sub_10003173C()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v36 - v5;
  NSString v7 = String._bridgeToObjectiveC()();
  NSString v8 = String._bridgeToObjectiveC()();
  int v9 = IMGetDomainBoolForKey(v7, v8);

  if (!v9) {
    goto LABEL_9;
  }
  NSString v10 = String._bridgeToObjectiveC()();
  NSString v11 = String._bridgeToObjectiveC()();
  unint64_t v12 = IMGetCachedDomainIntForKeyWithDefaultValue(v10, v11, 30LL);

  if ((v12 & 0x8000000000000000LL) == 0)
  {
    if (HIDWORD(v12))
    {
      _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Not enough bits to represent the passed value",  45LL,  2LL,  "Swift/Integers.swift",  20LL,  2,  3455LL,  0);
      goto LABEL_18;
    }

    uint64_t v13 = sub_10002D2A8();
    uint64_t v39 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v1 + 16);
    uint64_t v14 = v39(v6, v13, v0);
    unsigned __int8 v15 = (os_log_s *)Logger.logObject.getter(v14);
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc(18LL, -1LL);
      uint64_t v37 = v13;
      uint64_t v18 = v17;
      uint64_t v19 = swift_slowAlloc(32LL, -1LL);
      uint64_t v38 = v4;
      uint64_t v20 = v19;
      uint64_t v41 = v19;
      *(_DWORD *)uint64_t v18 = 136315394;
      uint64_t v40 = sub_10002F0C4(0xD000000000000010LL, 0x800000010004FEA0LL, &v41);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v40, &v41, v18 + 4, v18 + 12);
      *(_WORD *)(v18 + 12) = 1024;
      LODWORD(v40) = v12;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v40, (char *)&v40 + 4, v18 + 14, v18 + 18);
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Simulating a %s hang of %u seconds", (uint8_t *)v18, 0x12u);
      swift_arrayDestroy(v20, 1LL, (char *)&type metadata for Any + 8);
      uint64_t v21 = v20;
      uint64_t v4 = v38;
      swift_slowDealloc(v21, -1LL, -1LL);
      uint64_t v22 = v18;
      uint64_t v13 = v37;
      swift_slowDealloc(v22, -1LL, -1LL);
    }

    uint64_t v23 = *(void (**)(char *, uint64_t))(v1 + 8);
    v23(v6, v0);
    sleep(v12);
    uint64_t v24 = v39(v4, v13, v0);
    uint64_t v25 = (os_log_s *)Logger.logObject.getter(v24);
    os_log_type_t v26 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v25, v26))
    {
      id v27 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v28 = swift_slowAlloc(32LL, -1LL);
      uint64_t v41 = v28;
      *(_DWORD *)id v27 = 136315138;
      uint64_t v40 = sub_10002F0C4(0xD000000000000010LL, 0x800000010004FEA0LL, &v41);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v40, &v41, v27 + 4, v27 + 12);
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "Finished simulating a %s hang", v27, 0xCu);
      swift_arrayDestroy(v28, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v28, -1LL, -1LL);
      swift_slowDealloc(v27, -1LL, -1LL);
    }

    v23(v4, v0);
LABEL_9:
    id v29 = [(id)objc_opt_self(IMDCKSyncController) sharedInstance];
    if (v29)
    {
      id v30 = v29;
      [v29 recordMetricIsCloudKitEnabled];

      id v31 = [(id)objc_opt_self(IMDaemonCloudKitManager) sharedManager];
      if (v31)
      {
        unsigned int v32 = v31;
        [v31 registerForCloudKitSyncing];

        id v33 = [(id)objc_opt_self(IMDCKCacheDeleteManager) sharedInstance];
        if (v33)
        {
          uint64_t v34 = v33;
          [v33 registerWithCacheDelete];

          id v35 = [(id)objc_opt_self(IMDCKUtilities) sharedInstance];
          [v35 fetchAccountStatusAndUpdateMiCSwitchEligibilityIfNeededOnImagentLaunch];

          sub_1000314C4();
          return;
        }

        goto LABEL_15;
      }
    }

    else
    {
      __break(1u);
    }

    __break(1u);
LABEL_15:
    __break(1u);
  }

  _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Negative value is not representable",  35LL,  2LL,  "Swift/Integers.swift",  20LL,  2,  3451LL,  0);
LABEL_18:
  __break(1u);
}

uint64_t sub_100031C70()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v23 - v5;
  uint64_t v7 = type metadata accessor for TranscodingSettingsProvider(0LL);
  swift_allocObject(v7, *(unsigned int *)(v7 + 48), *(unsigned __int16 *)(v7 + 52));
  uint64_t v8 = TranscodingSettingsProvider.init()();
  uint64_t v9 = TranscodingSettingsProvider.transcodePreviewsInitialized.getter();
  if ((v9 & 1) == 0)
  {
    id v10 = [(id)objc_opt_self(IMCTSMSUtilities) IMReadEnablePreviewTranscodingQualityCarrierValueForPhoneNumber:0 simID:0];
    uint64_t v11 = sub_10002D2A8();
    uint64_t v12 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v1 + 16))(v6, v11, v0);
    uint64_t v13 = (os_log_s *)Logger.logObject.getter(v12);
    os_log_type_t v14 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v13, v14))
    {
      unsigned __int8 v15 = (uint8_t *)swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)unsigned __int8 v15 = 67109120;
      int v24 = (int)v10;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v15 + 4, v15 + 8);
      _os_log_impl( (void *)&_mh_execute_header,  v13,  v14,  "Setting preview transcoding to %{BOOL}d based on carrier preferences",  v15,  8u);
      swift_slowDealloc(v15, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
    TranscodingSettingsProvider.transcodePreviews.setter(v10);
    uint64_t v9 = TranscodingSettingsProvider.transcodePreviewsInitialized.setter(1LL);
  }

  if ((TranscodingSettingsProvider.disableLowQualityModeOnWiFiInitialized.getter(v9) & 1) == 0)
  {
    id v16 = [(id)objc_opt_self(IMCTSMSUtilities) IMReadDisablePreviewTranscodingQualityOnWiFiCarrierValueForPhoneNumber:0 simID:0];
    uint64_t v17 = sub_10002D2A8();
    uint64_t v18 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v17, v0);
    uint64_t v19 = (os_log_s *)Logger.logObject.getter(v18);
    os_log_type_t v20 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)uint64_t v21 = 67109120;
      int v25 = (int)v16;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, &v26, v21 + 4, v21 + 8);
      _os_log_impl( (void *)&_mh_execute_header,  v19,  v20,  "Setting disable low quality transcode on WiFi to %{BOOL}d based on carrier preferences",  v21,  8u);
      swift_slowDealloc(v21, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
    TranscodingSettingsProvider.disableLowQualityModeOnWiFi.setter(v16);
    TranscodingSettingsProvider.disableLowQualityModeOnWiFiInitialized.setter(1LL);
  }

  return swift_release(v8);
}

void sub_100031F34()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_10002D2A8();
  uint64_t v5 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Setting up location sharing monitoring", v8, 2u);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t type metadata accessor for DaemonLaunchAssistant()
{
  return objc_opt_self(&OBJC_CLASS____TtC7imagent21DaemonLaunchAssistant);
}

unint64_t sub_100032070()
{
  unint64_t result = qword_1000708F0;
  if (!qword_1000708F0)
  {
    uint64_t v1 = type metadata accessor for DispatchWorkItemFlags(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_1000708F0);
  }

  return result;
}

unint64_t sub_1000320B8()
{
  unint64_t result = qword_100070900;
  if (!qword_100070900)
  {
    uint64_t v1 = sub_100032104(&qword_1000704B8);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100070900);
  }

  return result;
}

uint64_t sub_100032104(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100032148(uint64_t a1, unint64_t *a2, void *a3)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t v5 = objc_opt_self(*a3);
    uint64_t result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }

  return result;
}

void _sSo26IMDaemonChatRequestHandlerC7imagentE37recoverChatsFromJunkContainingMessage8withGUIDySS_tF_0( uint64_t a1, unint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v54 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = __chkstk_darwin(v6);
  id v10 = (char *)&v52 - v9;
  uint64_t v11 = __chkstk_darwin(v8);
  os_log_type_t v57 = (char *)&v52 - v12;
  __chkstk_darwin(v11);
  os_log_type_t v14 = (char *)&v52 - v13;
  uint64_t v15 = sub_10002D2A8();
  id v16 = *(void (**)(char *))(v5 + 16);
  uint64_t v56 = v15;
  v16(v14);
  uint64_t v17 = swift_bridgeObjectRetain_n(a2, 2LL);
  uint64_t v18 = (os_log_s *)Logger.logObject.getter(v17);
  os_log_type_t v19 = static os_log_type_t.default.getter();
  BOOL v20 = os_log_type_enabled(v18, v19);
  id v53 = v10;
  if (v20)
  {
    uint64_t v55 = v16;
    uint64_t v21 = swift_slowAlloc(12LL, -1LL);
    uint64_t v52 = v4;
    uint64_t v22 = (uint8_t *)v21;
    uint64_t v23 = swift_slowAlloc(32LL, -1LL);
    uint64_t v59 = v23;
    *(_DWORD *)uint64_t v22 = 136315138;
    swift_bridgeObjectRetain(a2);
    uint64_t v58 = sub_10002F0C4(a1, a2, &v59);
    id v16 = v55;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, &v59, v22 + 4, v22 + 12);
    swift_bridgeObjectRelease_n(a2, 3LL);
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Request to recover chat with messageGUID: %s", v22, 0xCu);
    swift_arrayDestroy(v23, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v23, -1LL, -1LL);
    int v24 = v22;
    uint64_t v4 = v52;
    swift_slowDealloc(v24, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(a2, 2LL);
  }

  int v25 = *(void (**)(char *, uint64_t))(v5 + 8);
  v25(v14, v4);
  uint64_t v26 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000LL) == 0) {
    uint64_t v26 = a1 & 0xFFFFFFFFFFFFLL;
  }
  id v27 = v57;
  if (v26)
  {
    ((void (*)(char *, uint64_t, uint64_t))v16)(v57, v56, v4);
    uint64_t v28 = swift_bridgeObjectRetain_n(a2, 2LL);
    id v29 = (os_log_s *)Logger.logObject.getter(v28);
    os_log_type_t v30 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = swift_slowAlloc(12LL, -1LL);
      uint64_t v55 = v16;
      unsigned int v32 = (uint8_t *)v31;
      uint64_t v33 = swift_slowAlloc(32LL, -1LL);
      uint64_t v59 = v33;
      *(_DWORD *)unsigned int v32 = 136315138;
      swift_bridgeObjectRetain(a2);
      uint64_t v58 = sub_10002F0C4(a1, a2, &v59);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, &v59, v32 + 4, v32 + 12);
      swift_bridgeObjectRelease_n(a2, 3LL);
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "Recovering junk chat on peer devices with %s", v32, 0xCu);
      swift_arrayDestroy(v33, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v33, -1LL, -1LL);
      uint64_t v34 = v32;
      id v16 = v55;
      swift_slowDealloc(v34, -1LL, -1LL);

      id v35 = v57;
    }

    else
    {

      swift_bridgeObjectRelease_n(a2, 2LL);
      id v35 = v27;
    }

    v25(v35, v4);
    id v42 = [(id)objc_opt_self(IMDAccountController) sharedAccountController];
    if (!v42)
    {
      __break(1u);
      return;
    }

    uint64_t v43 = v42;
    NSString v44 = String._bridgeToObjectiveC()();
    id v45 = [v43 anySessionForServiceName:v44];

    if (v45)
    {
      NSString v46 = String._bridgeToObjectiveC()();
      [v45 reflectRecoverChatToPeerDevicesForMessageGUID:v46];

      return;
    }

    id v47 = v53;
    uint64_t v48 = ((uint64_t (*)(char *, uint64_t, uint64_t))v16)(v53, v56, v4);
    uint64_t v49 = (os_log_s *)Logger.logObject.getter(v48);
    uint64_t v50 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v49, (os_log_type_t)v50))
    {
      uint64_t v51 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v51 = 0;
      _os_log_impl((void *)&_mh_execute_header, v49, (os_log_type_t)v50, "Could not find session", v51, 2u);
      swift_slowDealloc(v51, -1LL, -1LL);
    }

    uint64_t v41 = v47;
  }

  else
  {
    uint64_t v36 = v54;
    uint64_t v37 = ((uint64_t (*)(char *, uint64_t, uint64_t))v16)(v54, v56, v4);
    uint64_t v38 = (os_log_s *)Logger.logObject.getter(v37);
    os_log_type_t v39 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v40 = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, v39, "No message guid provided", v40, 2u);
      swift_slowDealloc(v40, -1LL, -1LL);
    }

    uint64_t v41 = v36;
  }

  v25(v41, v4);
}

uint64_t sub_10003273C(uint64_t a1, void (*a2)(_OWORD *))
{
  return sub_100032974((uint64_t)v3);
}

id sub_10003293C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SyncedSettingsRequestHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10003296C()
{
  return 0x20000000LL;
}

uint64_t sub_100032974(uint64_t a1)
{
  uint64_t v2 = sub_10002D164(&qword_1000704C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for SyncedSettingsRequestHandler()
{
  return objc_opt_self(&OBJC_CLASS____TtC7imagent28SyncedSettingsRequestHandler);
}

uint64_t sub_1000329D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10002D164(&qword_1000704C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

void sub_100032A1C()
{
  qword_100071020 = (uint64_t)&off_100066258;
}

uint64_t sub_100032A30()
{
  uint64_t v0 = sub_10002D164(&qword_100070780);
  __chkstk_darwin(v0);
  uint64_t v2 = &v28[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v3 = type metadata accessor for Logger(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = &v28[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v5);
  uint64_t v9 = &v28[-v8];
  uint64_t v10 = sub_10002D2A8();
  uint64_t v11 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v4 + 16);
  uint64_t v12 = v11(v9, v10, v3);
  uint64_t v13 = (os_log_s *)Logger.logObject.getter(v12);
  os_log_type_t v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Initializing daemon", v15, 2u);
    swift_slowDealloc(v15, -1LL, -1LL);
  }

  id v16 = *(void (**)(_BYTE *, uint64_t))(v4 + 8);
  v16(v9, v3);
  uint64_t v17 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56LL))(v2, 1LL, 1LL, v17);
  type metadata accessor for MainActor(0LL);
  uint64_t v18 = static MainActor.shared.getter();
  uint64_t v19 = swift_allocObject(&unk_1000662D8, 32LL, 7LL);
  *(void *)(v19 + 16) = v18;
  *(void *)(v19 + 24) = &protocol witness table for MainActor;
  uint64_t v20 = sub_10002E744((uint64_t)v2, (uint64_t)&unk_100070560, v19);
  swift_release(v20);
  uint64_t v21 = objc_autoreleasePoolPush();
  id v22 = [(id)objc_opt_self(NSRunLoop) currentRunLoop];
  [v22 run];

  objc_autoreleasePoolPop(v21);
  uint64_t v23 = v11(v7, v10, v3);
  int v24 = (os_log_s *)Logger.logObject.getter(v23);
  os_log_type_t v25 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = (uint8_t *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v26 = 67109120;
    swift_beginAccess(&qword_100071018, v30, 0LL, 0LL);
    BOOL v29 = qword_100071018 != 0;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, v30, v26 + 4, v26 + 8);
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "Runloop completed with daemon setup %{BOOL}d", v26, 8u);
    swift_slowDealloc(v26, -1LL, -1LL);
  }

  return ((uint64_t (*)(_BYTE *, uint64_t))v16)(v7, v3);
}

void sub_100032D2C()
{
  id v0 = [(id)objc_opt_self(IMSystemMonitor) sharedInstance];
  if (!v0)
  {
    __break(1u);
LABEL_6:
    exit(0);
  }

  uint64_t v1 = v0;
  unsigned __int8 v2 = [v0 systemIsShuttingDown];

  if ((v2 & 1) != 0) {
    goto LABEL_6;
  }
  sub_100006E70();
  IMSetEmbeddedTempDirectory();
  id v3 = [(id)objc_opt_self(IMMetricsCollector) sharedInstance];
  if (v3)
  {
    id v4 = v3;
    [v3 trackEvent:IMMetricsCollectorEventImagentLaunch];
  }

  else
  {
    __break(1u);
  }

uint64_t sub_100032E04(uint64_t *a1)
{
  uint64_t v2 = sub_10002D164(&qword_100070568);
  uint64_t v3 = swift_allocObject(v2, 352LL, 7LL);
  *(_OWORD *)(v3 + 16) = xmmword_10004A800;
  uint64_t v4 = sub_100032148(0LL, &qword_100070570, off_100064A48);
  uint64_t v5 = sub_100033794( (unint64_t *)&qword_100070578,  &qword_100070570,  off_100064A48,  (uint64_t)&protocol conformance descriptor for IMDaemonAccountsRequestHandler);
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;
  uint64_t v6 = sub_100032148(0LL, (unint64_t *)&qword_100070580, off_100064A50);
  uint64_t v7 = sub_100033794( (unint64_t *)&qword_100070588,  (unint64_t *)&qword_100070580,  off_100064A50,  (uint64_t)&protocol conformance descriptor for IMDaemonAnyRequestHandler);
  *(void *)(v3 + 4_Block_object_dispose(va, 8) = v6;
  *(void *)(v3 + 56) = v7;
  uint64_t v8 = sub_100032148(0LL, &qword_100070590, off_100064A58);
  uint64_t v9 = sub_100033794( &qword_100070598,  &qword_100070590,  off_100064A58,  (uint64_t)&protocol conformance descriptor for IMDaemonAutomationRequestHandler);
  *(void *)(v3 + 64) = v8;
  *(void *)(v3 + 72) = v9;
  uint64_t v10 = sub_100032148(0LL, &qword_1000705A0, off_100064A60);
  uint64_t v11 = sub_100033794( &qword_1000705A8,  &qword_1000705A0,  off_100064A60,  (uint64_t)&protocol conformance descriptor for IMDaemonBuddyListRequestHandler);
  *(void *)(v3 + 80) = v10;
  *(void *)(v3 + 8_Block_object_dispose(va, 8) = v11;
  uint64_t v12 = sub_100032148(0LL, &qword_1000705B0, off_100064A68);
  uint64_t v13 = sub_100033794( &qword_1000705B8,  &qword_1000705B0,  off_100064A68,  (uint64_t)&protocol conformance descriptor for IMDaemonChatFileTransferRequestHandler);
  *(void *)(v3 + 96) = v12;
  *(void *)(v3 + 104) = v13;
  uint64_t inserted = type metadata accessor for ChatInsertMessageRequestHandler();
  uint64_t v15 = sub_1000337D4( &qword_1000705C0,  (uint64_t (*)(uint64_t))type metadata accessor for ChatInsertMessageRequestHandler,  (uint64_t)&unk_10004A2C0);
  *(void *)(v3 + 112) = inserted;
  *(void *)(v3 + 120) = v15;
  uint64_t v16 = sub_100032148(0LL, &qword_1000705C8, off_100064A70);
  uint64_t v17 = sub_100033794( &qword_1000705D0,  &qword_1000705C8,  off_100064A70,  (uint64_t)&protocol conformance descriptor for IMDaemonChatMessageHistoryRequestHandler);
  *(void *)(v3 + 12_Block_object_dispose(va, 8) = v16;
  *(void *)(v3 + 136) = v17;
  uint64_t v18 = sub_100032148(0LL, &qword_1000705D8, off_100064A78);
  uint64_t v19 = sub_100033794( &qword_1000705E0,  &qword_1000705D8,  off_100064A78,  (uint64_t)&protocol conformance descriptor for IMDaemonChatModifyReadStateRequestHandler);
  *(void *)(v3 + 144) = v18;
  *(void *)(v3 + 152) = v19;
  uint64_t v20 = sub_100032148(0LL, &qword_1000705E8, off_100064A80);
  uint64_t v21 = sub_100033794( &qword_1000705F0,  &qword_1000705E8,  off_100064A80,  (uint64_t)&protocol conformance descriptor for IMDaemonChatRequestHandler);
  *(void *)(v3 + 160) = v20;
  *(void *)(v3 + 16_Block_object_dispose(va, 8) = v21;
  uint64_t v22 = sub_100032148(0LL, &qword_1000705F8, off_100064A88);
  uint64_t v23 = sub_100033794( &qword_100070600,  &qword_1000705F8,  off_100064A88,  (uint64_t)&protocol conformance descriptor for IMDaemonChatSendMessageRequestHandler);
  *(void *)(v3 + 176) = v22;
  *(void *)(v3 + 184) = v23;
  uint64_t v24 = sub_100032148(0LL, &qword_100070608, &off_100064A90);
  uint64_t v25 = sub_100033794( &qword_100070610,  &qword_100070608,  &off_100064A90,  (uint64_t)&protocol conformance descriptor for IMDaemonCloudSyncRequestHandler);
  *(void *)(v3 + 192) = v24;
  *(void *)(v3 + 200) = v25;
  uint64_t v26 = sub_100032148(0LL, &qword_100070618, off_100064AA0);
  uint64_t v27 = sub_100033794( &qword_100070620,  &qword_100070618,  off_100064AA0,  (uint64_t)&protocol conformance descriptor for IMDaemonFileProviderRequestHandler);
  *(void *)(v3 + 20_Block_object_dispose(va, 8) = v26;
  *(void *)(v3 + 216) = v27;
  uint64_t v28 = sub_100032148(0LL, &qword_100070628, off_100064AA8);
  uint64_t v29 = sub_100033794( &qword_100070630,  &qword_100070628,  off_100064AA8,  (uint64_t)&protocol conformance descriptor for IMDaemonFileTransferRequestHandler);
  *(void *)(v3 + 224) = v28;
  *(void *)(v3 + 232) = v29;
  uint64_t v30 = sub_100032148(0LL, &qword_100070638, off_100064AB0);
  uint64_t v31 = sub_100033794( &qword_100070640,  &qword_100070638,  off_100064AB0,  (uint64_t)&protocol conformance descriptor for IMDaemonManageStatusRequestHandler);
  *(void *)(v3 + 240) = v30;
  *(void *)(v3 + 24_Block_object_dispose(va, 8) = v31;
  uint64_t v32 = sub_100032148(0LL, &qword_100070648, off_100064AB8);
  uint64_t v33 = sub_100033794( &qword_100070650,  &qword_100070648,  off_100064AB8,  (uint64_t)&protocol conformance descriptor for IMDaemonModifyReadStateRequestHandler);
  *(void *)(v3 + 256) = v32;
  *(void *)(v3 + 264) = v33;
  uint64_t v34 = sub_100032148(0LL, &qword_100070658, off_100064AC0);
  uint64_t v35 = sub_100033794( &qword_100070660,  &qword_100070658,  off_100064AC0,  (uint64_t)&protocol conformance descriptor for IMDaemonVCACRequestHandler);
  *(void *)(v3 + 272) = v34;
  *(void *)(v3 + 280) = v35;
  uint64_t v36 = sub_100032148(0LL, &qword_100070668, off_100064AC8);
  uint64_t v37 = sub_100033794( &qword_100070670,  &qword_100070668,  off_100064AC8,  (uint64_t)&protocol conformance descriptor for IMDaemonVCInvitationsAVObserverRequestHandler);
  *(void *)(v3 + 28_Block_object_dispose(va, 8) = v36;
  *(void *)(v3 + 296) = v37;
  uint64_t v38 = sub_100032148(0LL, &qword_100070678, &off_100064AD0);
  uint64_t v39 = sub_100033794( &qword_100070680,  &qword_100070678,  &off_100064AD0,  (uint64_t)&protocol conformance descriptor for IMDaemonVCRequestHandler);
  *(void *)(v3 + 304) = v38;
  *(void *)(v3 + 312) = v39;
  uint64_t v40 = type metadata accessor for SyncedSettingsRequestHandler();
  uint64_t v41 = sub_1000337D4( &qword_100070688,  (uint64_t (*)(uint64_t))type metadata accessor for SyncedSettingsRequestHandler,  (uint64_t)&unk_10004A780);
  *(void *)(v3 + 320) = v40;
  *(void *)(v3 + 32_Block_object_dispose(va, 8) = v41;
  uint64_t v42 = type metadata accessor for IntentClientRequestHandler();
  uint64_t v43 = sub_1000337D4( &qword_100070690,  (uint64_t (*)(uint64_t))type metadata accessor for IntentClientRequestHandler,  (uint64_t)&unk_10004A640);
  *(void *)(v3 + 336) = v42;
  *(void *)(v3 + 344) = v43;
  uint64_t v44 = type metadata accessor for IncomingClientConnectionListener(0LL);
  uint64_t v46 = static String._unconditionallyBridgeFromObjectiveC(_:)(kFZDaemonAuthGrantPortName, v45);
  uint64_t v48 = v47;
  if (qword_100071640 != -1) {
    swift_once(&qword_100071640, sub_100032A1C);
  }
  uint64_t v49 = qword_100071020;
  swift_bridgeObjectRetain(qword_100071020);
  uint64_t v50 = IncomingClientConnectionListener.__allocating_init(machServiceName:allowedEntitlements:requestHandlers:)( v46,  v48,  v49,  v3);
  uint64_t v51 = sub_10002D164(&qword_100070698);
  uint64_t v52 = swift_allocObject(v51, 72LL, 7LL);
  *(_OWORD *)(v52 + 16) = xmmword_10004A810;
  *(void *)(v52 + 56) = v44;
  *(void *)(v52 + 64) = &protocol witness table for IncomingClientConnectionListener;
  *(void *)(v52 + 32) = v50;
  id v53 = (objc_class *)type metadata accessor for ClientConnectionManager(0LL);
  memset(v65, 0, sizeof(v65));
  uint64_t v66 = 0LL;
  id v54 = objc_allocWithZone(v53);
  swift_retain(v50);
  uint64_t v55 = ClientConnectionManager.init(connectionListeners:)(v52);
  type metadata accessor for MessagesDaemon();
  v64[3] = type metadata accessor for DaemonLaunchAssistant();
  v64[4] = &off_1000661B8;
  v64[0] = sub_1000312B4();
  v63[3] = type metadata accessor for ServiceLoader();
  v63[4] = &off_100066948;
  v63[0] = sub_10002D090();
  v62[3] = type metadata accessor for AccountLoader();
  v62[4] = &off_100065D88;
  v62[0] = sub_10002D090();
  v61[3] = type metadata accessor for PipelineLoader();
  v61[4] = &off_100066938;
  v61[0] = sub_10002D090();
  v60[3] = v53;
  v60[4] = &protocol witness table for ClientConnectionManager;
  v60[0] = v55;
  sub_10002D954((uint64_t)v65, (uint64_t)v59);
  uint64_t v56 = sub_10002DB24(v64, v63, v62, v61, v60, (uint64_t)v59);
  swift_release(v50);
  sub_10002EBC8((uint64_t)v65, &qword_10006FF30);
  uint64_t v57 = *a1;
  *a1 = v56;
  return swift_release(v57);
}

uint64_t sub_100033548()
{
  uint64_t v1 = type metadata accessor for MainActor(0LL);
  v0[5] = v1;
  v0[6] = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  v0[7] = v2;
  v0[8] = v3;
  return swift_task_switch(sub_1000335B4, v2, v3);
}

uint64_t sub_1000335B4()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = type metadata accessor for DaemonWorkActor(0LL);
  *(void *)(v0 + 72) = static DaemonWorkActor.shared.getter(v2);
  uint64_t v3 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_10003361C, v3, v4);
}

void sub_10003361C()
{
  uint64_t v3 = 0LL;
  uint64_t v1 = objc_autoreleasePoolPush();
  sub_100032E04(&v3);
  objc_autoreleasePoolPop(v1);
  uint64_t v2 = v3;
  v0[10] = v3;
  if (v2) {
    swift_task_switch(sub_100033680, v0[7], v0[8]);
  }
  else {
    __break(1u);
  }
}

uint64_t sub_100033680()
{
  uint64_t v1 = *(void *)(v0 + 80);
  swift_release(*(void *)(v0 + 48));
  swift_beginAccess(&qword_100071018, v0 + 16, 1LL, 0LL);
  uint64_t v2 = qword_100071018;
  qword_100071018 = v1;
  swift_release(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000336E8()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10003370C()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_10007055C);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_10002D0FC;
  return sub_100033548();
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = objc_autoreleasePoolPush();
  sub_100032D2C();
  objc_autoreleasePoolPop(v3);
  sub_100032A30();
  return 0;
}

ValueMetadata *type metadata accessor for DaemonApplication()
{
  return &type metadata for DaemonApplication;
}

uint64_t sub_100033794(unint64_t *a1, unint64_t *a2, void *a3, uint64_t a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v7 = sub_100032148(255LL, a2, a3);
    uint64_t result = swift_getWitnessTable(a4, v7);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_1000337D4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = a2(255LL);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_100033814(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_100033850
                                                                     + 4 * a6[a1]))( 0xD000000000000012LL,  0x8000000100050010LL);
}

uint64_t sub_100033850()
{
  return v0 - 13;
}

uint64_t sub_10003392C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2 = *a2;
  uint64_t v3 = sub_100033814(*a1);
  uint64_t v5 = v4;
  uint64_t v6 = sub_100033814(v2);
  if (v3 == v6 && v5 == v7)
  {
    char v10 = 1;
    uint64_t v9 = v5;
  }

  else
  {
    uint64_t v9 = v7;
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0LL);
  }

  swift_bridgeObjectRelease(v5, v7);
  swift_bridgeObjectRelease(v9, v11);
  return v10 & 1;
}

Swift::Int sub_1000339B4()
{
  unsigned __int8 v1 = *v0;
  Hasher.init(_seed:)(v7, 0LL);
  uint64_t v2 = sub_100033814(v1);
  uint64_t v4 = v3;
  String.hash(into:)(v7, v2, v3);
  swift_bridgeObjectRelease(v4, v5);
  return Hasher._finalize()();
}

uint64_t sub_100033A14(uint64_t a1)
{
  uint64_t v3 = sub_100033814(*v1);
  uint64_t v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5, v6);
}

Swift::Int sub_100033A54(uint64_t a1)
{
  unsigned __int8 v2 = *v1;
  Hasher.init(_seed:)(v8, a1);
  uint64_t v3 = sub_100033814(v2);
  uint64_t v5 = v4;
  String.hash(into:)(v8, v3, v4);
  swift_bridgeObjectRelease(v5, v6);
  return Hasher._finalize()();
}

unint64_t sub_100033AB0@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_1000341B4(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_100033ADC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100033814(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_100033B04(void *a1@<X8>)
{
  *a1 = &off_100066468;
}

void sub_100033B14()
{
  id v0 = [(id)objc_opt_self(NSUserDefaults) standardUserDefaults];
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 persistentDomainForName:v1];

  if (!v2
    || (uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v2,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String),  v2,  !v3))
  {
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    goto LABEL_11;
  }

  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(IMCloudKitDefinesDidUpgradeOrRestoreFromBackup, v4);
  uint64_t v7 = v6;
  if (!*(void *)(v3 + 16) || (unint64_t v8 = sub_100034070(v5, v6), (v6 & 1) == 0))
  {
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    swift_bridgeObjectRelease(v3, v6);
    swift_bridgeObjectRelease(v7, v12);
    goto LABEL_11;
  }

  sub_10002FDD4(*(void *)(v3 + 56) + 32 * v8, (uint64_t)&v20);
  swift_bridgeObjectRelease(v3, v9);
  swift_bridgeObjectRelease(v7, v10);
  if (!*((void *)&v21 + 1))
  {
LABEL_11:
    sub_100032974((uint64_t)&v20);
    int v11 = 2;
    goto LABEL_12;
  }

  else {
    int v11 = 2;
  }
LABEL_12:
  id v13 = objc_allocWithZone(&OBJC_CLASS___NSUserDefaults);
  NSString v14 = String._bridgeToObjectiveC()();
  id v15 = [v13 initWithSuiteName:v14];

  if (v15)
  {
    if (v11 == 2) {
      Class isa = 0LL;
    }
    else {
      Class isa = Bool._bridgeToObjectiveC()().super.super.isa;
    }
    [v15 setObject:isa forKey:IMCloudKitDefinesDidUpgradeOrRestoreFromBackup];
    swift_unknownObjectRelease(isa);
  }

  for (uint64_t i = 0LL; i != 13; ++i)
  {
    char v18 = *((_BYTE *)&off_100066468 + i + 32);
    LOBYTE(v20) = v18;
    sub_100033D54((unsigned __int8 *)&v20);
  }

void sub_100033D54(unsigned __int8 *a1)
{
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  LODWORD(v6) = *a1;
  uint64_t v7 = sub_10002D4A4();
  uint64_t v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v7, v2);
  uint64_t v9 = (os_log_s *)Logger.logObject.getter(v8);
  os_log_type_t v10 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v9, v10))
  {
    int v11 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v12 = swift_slowAlloc(32LL, -1LL);
    uint64_t v25 = v12;
    *(_DWORD *)int v11 = 136315138;
    uint64_t v13 = sub_100033814(v6);
    int v23 = v6;
    unint64_t v6 = v14;
    uint64_t v24 = sub_10002F0C4(v13, v14, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v11 + 4, v11 + 12);
    unint64_t v15 = v6;
    LOBYTE(v6) = v23;
    swift_bridgeObjectRelease(v15, v16);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Deleting %s user defaults domain.", v11, 0xCu);
    swift_arrayDestroy(v12, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v12, -1LL, -1LL);
    swift_slowDealloc(v11, -1LL, -1LL);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id v17 = [(id)objc_opt_self(NSUserDefaults) standardUserDefaults];
  sub_100033814(v6);
  uint64_t v19 = v18;
  NSString v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v19, v21);
  [v17 removePersistentDomainForName:v20];
}

void sub_100033F58(char a1)
{
}

void sub_100033F78(char a1)
{
}

void sub_100033F9C(char a1)
{
  id v2 = objc_allocWithZone(&OBJC_CLASS___NSUserDefaults);
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [v2 initWithSuiteName:v3];

  if (v4)
  {
    id v5 = String._bridgeToObjectiveC()();
    [v4 setBool:a1 & 1 forKey:v5];
  }

unint64_t sub_100034070(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_1000340D4(a1, a2, v5);
}

unint64_t sub_1000340D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    os_log_type_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }

      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }

  return v6;
}

unint64_t sub_1000341B4(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100066310, v2);
  swift_bridgeObjectRelease(object, v4);
  if (v3 >= 0xD) {
    return 13LL;
  }
  else {
    return v3;
  }
}

uint64_t sub_1000341FC()
{
  id v0 = objc_allocWithZone(&OBJC_CLASS___NSUserDefaults);
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 initWithSuiteName:v1];

  if (!v2)
  {
    __int128 v7 = 0u;
    __int128 v8 = 0u;
LABEL_9:
    sub_100032974((uint64_t)&v7);
    return 1LL;
  }

  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [v2 objectForKey:v3];

  if (v4)
  {
    _bridgeAnyObjectToAny(_:)(v6, v4);
    swift_unknownObjectRelease(v4);
  }

  else
  {
    memset(v6, 0, sizeof(v6));
  }

  sub_10003469C((uint64_t)v6, (uint64_t)&v7);
  if (!*((void *)&v8 + 1)) {
    goto LABEL_9;
  }
  return 1LL;
}

uint64_t sub_100034340()
{
  id v0 = objc_allocWithZone(&OBJC_CLASS___NSUserDefaults);
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 initWithSuiteName:v1];

  if (!v2)
  {
    __int128 v7 = 0u;
    __int128 v8 = 0u;
LABEL_9:
    sub_100032974((uint64_t)&v7);
    return 0LL;
  }

  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [v2 objectForKey:v3];

  if (v4)
  {
    _bridgeAnyObjectToAny(_:)(v6, v4);
    swift_unknownObjectRelease(v4);
  }

  else
  {
    memset(v6, 0, sizeof(v6));
  }

  sub_10003469C((uint64_t)v6, (uint64_t)&v7);
  if (!*((void *)&v8 + 1)) {
    goto LABEL_9;
  }
  uint64_t result = swift_dynamicCast(v6, &v7, (char *)&type metadata for Any + 8, &type metadata for Bool, 6LL);
  if ((_DWORD)result) {
    return LOBYTE(v6[0]);
  }
  return result;
}

unint64_t sub_10003448C()
{
  unint64_t result = qword_1000706A0;
  if (!qword_1000706A0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10004A858, &_s17UserDefaultDomainON);
    atomic_store(result, (unint64_t *)&qword_1000706A0);
  }

  return result;
}

unint64_t sub_1000344D4()
{
  unint64_t result = qword_1000706A8;
  if (!qword_1000706A8)
  {
    uint64_t v1 = sub_100032104(&qword_1000706B0);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000706A8);
  }

  return result;
}

_BYTE *_s17UserDefaultDomainOwCP(_BYTE *result, _BYTE *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t _s17UserDefaultDomainOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xF4) {
    goto LABEL_17;
  }
  if (a2 + 12 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 12) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 12;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 12;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 12;
    }
  }

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xD;
  int v8 = v6 - 13;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t _s17UserDefaultDomainOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 12 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 12) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xF4) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF3) {
    return ((uint64_t (*)(void))((char *)&loc_10003460C + 4 * byte_10004A852[v4]))();
  }
  *a1 = a2 + 12;
  return ((uint64_t (*)(void))((char *)sub_100034640 + 4 * byte_10004A84D[v4]))();
}

uint64_t sub_100034640(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100034648(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100034650LL);
  }
  return result;
}

uint64_t sub_10003465C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100034664LL);
  }
  *(_BYTE *)unint64_t result = a2 + 12;
  return result;
}

uint64_t sub_100034668(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100034670(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10003467C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100034684(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *_s17UserDefaultDomainOMa()
{
  return &_s17UserDefaultDomainON;
}

uint64_t sub_10003469C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10002D164(&qword_1000704C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t IMDaemonChatModifyReadStateRequestHandler.requiredCapabilities.getter()
{
  return 262148LL;
}

uint64_t IMDaemonVCACRequestHandler.requiredCapabilities.getter()
{
  return 524296LL;
}

uint64_t sub_100034740( int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  return swift_bridgeObjectRelease(v16, v17);
}

uint64_t IMDaemonChatRequestHandler.dismiss(_:)(void *a1)
{
  return sub_100034A2C(a1, "Handling CollaborationNotice dismiss request for notice: %@");
}

uint64_t IMDaemonChatRequestHandler.update(_:)(void *a1)
{
  return sub_100034A2C(a1, "Updating CollaborationNotice: %@");
}

void _sSo26IMDaemonChatRequestHandlerC7imagentE25fetchCollaborationNotices03forB4GUID5replyySS_ySaySo21IMCollaborationNoticeCGctF_0( uint64_t a1, unint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  BOOL v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_10002D300();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  uint64_t v9 = swift_bridgeObjectRetain_n(a2, 2LL);
  os_log_type_t v10 = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc(12LL, -1LL);
    uint64_t v16 = a1;
    uint64_t v13 = (uint8_t *)v12;
    uint64_t v14 = swift_slowAlloc(32LL, -1LL);
    uint64_t v18 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    swift_bridgeObjectRetain(a2);
    uint64_t v17 = sub_10002F0C4(v16, a2, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v17, &v18, v13 + 4, v13 + 12);
    swift_bridgeObjectRelease_n(a2, 3LL);
    _os_log_impl( (void *)&_mh_execute_header,  v10,  v11,  "Handling CollaborationNotices fetch request for chatGUID: %s",  v13,  0xCu);
    swift_arrayDestroy(v14, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v14, -1LL, -1LL);
    swift_slowDealloc(v13, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(a2, 2LL);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000038LL,  0x8000000100050270LL,  "imagent/ChatRequestHandler+CollaborationNotices.swift",  53LL,  2LL,  24LL,  0);
  __break(1u);
}

uint64_t sub_100034A2C(void *a1, const char *a2)
{
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  BOOL v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_10002D300();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a1;
  os_log_type_t v10 = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v20 = v4;
    uint64_t v12 = swift_slowAlloc(12LL, -1LL);
    uint64_t v19 = a2;
    uint64_t v13 = (uint8_t *)v12;
    uint64_t v18 = (void *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v13 = 138412290;
    id v21 = v9;
    id v14 = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22, v13 + 4, v13 + 12);
    uint64_t v15 = v18;
    void *v18 = v9;

    uint64_t v4 = v20;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, v19, v13, 0xCu);
    uint64_t v16 = sub_10002D164(&qword_100070778);
    swift_arrayDestroy(v15, 1LL, v16);
    swift_slowDealloc(v15, -1LL, -1LL);
    swift_slowDealloc(v13, -1LL, -1LL);
  }

  else
  {

    os_log_type_t v10 = (os_log_s *)v9;
  }

  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

id sub_100034BF4()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for ApplicationWorkspaceObserver()) init];
  qword_100071028 = (uint64_t)result;
  return result;
}

uint64_t *sub_100034C20()
{
  if (qword_100071950 != -1) {
    swift_once(&qword_100071950, sub_100034BF4);
  }
  return &qword_100071028;
}

void sub_100034CC0(char a1)
{
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v75 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = __chkstk_darwin(v4);
  id v9 = (char *)&v75 - v8;
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v75 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v15 = (char *)&v75 - v14;
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = (char *)&v75 - v17;
  uint64_t v19 = __chkstk_darwin(v16);
  id v21 = (char *)&v75 - v20;
  __chkstk_darwin(v19);
  int v23 = (char *)&v75 - v22;
  if ((a1 & 1) != 0)
  {
    id v24 = [(id)objc_opt_self(IMUnlockMonitor) sharedInstance];
    unsigned __int8 v25 = [v24 isUnderFirstDataProtectionLock];

    uint64_t v26 = sub_10002D4A4();
    uint64_t v27 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16);
    if ((v25 & 1) != 0)
    {
      uint64_t v28 = v27(v9, v26, v2);
      uint64_t v29 = (os_log_s *)Logger.logObject.getter(v28);
      os_log_type_t v30 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v29, v30))
      {
        uint64_t v31 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)uint64_t v31 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  v30,  "Skipping launch tasks - still not past first unlock",  v31,  2u);
        swift_slowDealloc(v31, -1LL, -1LL);
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v9, v2);
    }

    else
    {
      uint64_t v76 = v26;
      uint64_t v77 = v27;
      uint64_t v37 = ((uint64_t (*)(char *))v27)(v23);
      uint64_t v38 = (os_log_s *)Logger.logObject.getter(v37);
      os_log_type_t v39 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v38, v39))
      {
        uint64_t v40 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)uint64_t v40 = 0;
        _os_log_impl((void *)&_mh_execute_header, v38, v39, "Performing launch tasks", v40, 2u);
        swift_slowDealloc(v40, -1LL, -1LL);
      }

      uint64_t v41 = *(void (**)(char *, uint64_t))(v3 + 8);
      uint64_t v42 = v23;
      uint64_t v43 = v2;
      v41(v42, v2);
      uint64_t v44 = v78;
      *((_BYTE *)v78 + OBJC_IVAR____TtC7imagent28ApplicationWorkspaceObserver_didPerformStartupTasks) = 1;
      id v45 = [(id)objc_opt_self(LSApplicationWorkspace) defaultWorkspace];
      if (v45)
      {
        uint64_t v46 = v45;
        [v45 addObserver:v44];

        char v47 = (*(uint64_t (**)(void))((swift_isaMask & *v44) + 0xB8LL))();
        char v48 = sub_100033F54();
        if ((v47 & 1) != 0)
        {
          if ((v48 & 1) != 0)
          {
            uint64_t v49 = v77(v12, v76, v43);
            uint64_t v50 = (os_log_s *)Logger.logObject.getter(v49);
            os_log_type_t v51 = static os_log_type_t.info.getter();
            if (os_log_type_enabled(v50, v51))
            {
              uint64_t v52 = v41;
              id v53 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
              *(_WORD *)id v53 = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v50,  v51,  "We don't need to perform any installation tasks",  v53,  2u);
              id v54 = v53;
              uint64_t v41 = v52;
              swift_slowDealloc(v54, -1LL, -1LL);
            }

            v41(v12, v43);
          }

          else
          {
            uint64_t v62 = v77(v21, v76, v43);
            uint64_t v63 = (os_log_s *)Logger.logObject.getter(v62);
            os_log_type_t v64 = static os_log_type_t.info.getter();
            if (os_log_type_enabled(v63, v64))
            {
              uint64_t v65 = v41;
              uint64_t v66 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
              *(_WORD *)uint64_t v66 = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v63,  v64,  "We missed the install notification - installing now",  v66,  2u);
              __int128 v67 = v66;
              uint64_t v41 = v65;
              swift_slowDealloc(v67, -1LL, -1LL);
            }

            uint64_t v68 = ((uint64_t (*)(char *, uint64_t))v41)(v21, v43);
            (*(void (**)(uint64_t))((swift_isaMask & *v44) + 0xC8LL))(v68);
          }
        }

        else if ((v48 & 1) != 0)
        {
          uint64_t v55 = v77(v18, v76, v43);
          uint64_t v56 = (os_log_s *)Logger.logObject.getter(v55);
          os_log_type_t v57 = static os_log_type_t.info.getter();
          if (os_log_type_enabled(v56, v57))
          {
            uint64_t v58 = v41;
            uint64_t v59 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
            *(_WORD *)uint64_t v59 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v56,  v57,  "We missed the uninstall notification - uninstalling now",  v59,  2u);
            uint64_t v60 = v59;
            uint64_t v41 = v58;
            swift_slowDealloc(v60, -1LL, -1LL);
          }

          uint64_t v61 = ((uint64_t (*)(char *, uint64_t))v41)(v18, v43);
          (*(void (**)(uint64_t))((swift_isaMask & *v44) + 0xD0LL))(v61);
        }

        else
        {
          uint64_t v69 = v77(v15, v76, v43);
          __int128 v70 = (os_log_s *)Logger.logObject.getter(v69);
          os_log_type_t v71 = static os_log_type_t.info.getter();
          if (os_log_type_enabled(v70, v71))
          {
            v72 = v41;
            v73 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
            *(_WORD *)v73 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v70,  v71,  "We are uninstalled, so we actually need to relaunch so imagent doesn't load the services",  v73,  2u);
            unsigned int v74 = v73;
            uint64_t v41 = v72;
            swift_slowDealloc(v74, -1LL, -1LL);
          }

          v41(v15, v43);
          sub_100036B24();
        }

        sub_100033F58(v47 & 1);
      }

      else
      {
        __break(1u);
      }
    }
  }

  else
  {
    uint64_t v32 = sub_10002D4A4();
    uint64_t v33 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v32, v2);
    uint64_t v34 = (os_log_s *)Logger.logObject.getter(v33);
    os_log_type_t v35 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v36 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  v35,  "Skipping launch tasks - system app migrator hasn't ran yet",  v36,  2u);
      swift_slowDealloc(v36, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }

id sub_100035304()
{
  id result = [(id)objc_opt_self(LSApplicationWorkspace) defaultWorkspace];
  if (result)
  {
    uint64_t v2 = result;
    [result removeObserver:v0];

    v3.receiver = v0;
    v3.super_class = (Class)type metadata accessor for ApplicationWorkspaceObserver();
    return objc_msgSendSuper2(&v3, "dealloc");
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t type metadata accessor for ApplicationWorkspaceObserver()
{
  return objc_opt_self(&OBJC_CLASS____TtC7imagent28ApplicationWorkspaceObserver);
}

uint64_t IMDaemonManageStatusRequestHandler.requiredCapabilities.getter()
{
  return 1LL;
}

void sub_100035434()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  objc_super v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_10002D4A4();
  uint64_t v5 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "imagent exiting gracefully soon.", v8, 2u);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  exit(0);
}

id sub_10003551C()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = __chkstk_darwin(v2);
  os_log_type_t v7 = (char *)&v29 - v6;
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v29 - v8;
  uint64_t v10 = sub_10002D4A4();
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v1 + 16);
  uint64_t v12 = v11(v9, v10, v0);
  uint64_t v13 = (os_log_s *)Logger.logObject.getter(v12);
  os_log_type_t v14 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    uint64_t v30 = v10;
    uint64_t v16 = v15;
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Messages finished installing.", v15, 2u);
    uint64_t v10 = v30;
    swift_slowDealloc(v16, -1LL, -1LL);
  }

  uint64_t v17 = *(void (**)(char *, uint64_t))(v1 + 8);
  v17(v9, v0);
  id result = [(id)objc_opt_self(IMMetricsCollector) sharedInstance];
  if (result)
  {
    uint64_t v19 = result;
    [result trackEvent:IMMetricsCollectorEventMessagesInstall];

    if ((sub_100033F74() & 1) != 0)
    {
      uint64_t v20 = v11(v7, v10, v0);
      id v21 = (os_log_s *)Logger.logObject.getter(v20);
      os_log_type_t v22 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v21, v22))
      {
        int v23 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)int v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "MiC was enabled prior to deletion, re-enable it.", v23, 2u);
        swift_slowDealloc(v23, -1LL, -1LL);
      }

      v17(v7, v0);
      id v24 = [(id)objc_opt_self(IMDCKUtilities) sharedInstance];
      [v24 setCloudKitEnabled:1];
    }

    else
    {
      uint64_t v25 = v11(v4, v10, v0);
      uint64_t v26 = (os_log_s *)Logger.logObject.getter(v25);
      os_log_type_t v27 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)uint64_t v28 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  v27,  "MiC was disabled prior to deletion, we are not enabling it.",  v28,  2u);
        swift_slowDealloc(v28, -1LL, -1LL);
      }

      v17(v4, v0);
    }

    sub_100033F58(1);
    IMClearDidPerformInitialChatVocabularyUpdate();
    return (id)sub_100036B24();
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_100035850()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10002D164(&qword_100070780);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for Logger(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_10002D4A4();
  uint64_t v10 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  uint64_t v11 = (os_log_s *)Logger.logObject.getter(v10);
  os_log_type_t v12 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Messages starting uninstalling", v13, 2u);
    swift_slowDealloc(v13, -1LL, -1LL);
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v14 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))(v4, 1LL, 1LL, v14);
  uint64_t v15 = (void *)swift_allocObject(&unk_100066618, 40LL, 7LL);
  v15[2] = 0LL;
  v15[3] = 0LL;
  v15[4] = v1;
  id v16 = v1;
  uint64_t v17 = sub_10002E744((uint64_t)v4, (uint64_t)&unk_100070790, (uint64_t)v15);
  return swift_release(v17);
}

uint64_t sub_1000359EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[16] = a4;
  uint64_t v5 = type metadata accessor for Logger(0LL);
  v4[17] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v4[18] = v6;
  unint64_t v7 = (*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v4[19] = swift_task_alloc(v7);
  v4[20] = swift_task_alloc(v7);
  return swift_task_switch(sub_100035A5C, 0LL, 0LL);
}

id sub_100035A5C()
{
  id result = [(id)objc_opt_self(IMMetricsCollector) sharedInstance];
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = v0 + 2;
    [result trackEvent:IMMetricsCollectorEventMessagesUninstall];

    uint64_t v4 = (void *)objc_opt_self(&OBJC_CLASS___IMDCKUtilities);
    id v5 = [v4 sharedInstance];
    char v6 = [v5 cloudKitSyncingEnabled];

    sub_100033F78(v6);
    id v7 = [v4 sharedInstance];
    [v7 setCloudKitEnabled:0];

    id v8 = [(id)objc_opt_self(IMDDatabase) synchronousDatabase];
    v0[21] = v8;
    v0[2] = v0;
    v0[3] = sub_100035BD4;
    uint64_t v9 = swift_continuation_init(v0 + 2, 1LL);
    v0[10] = _NSConcreteStackBlock;
    uint64_t v10 = v0 + 10;
    v10[1] = 0x40000000LL;
    v10[2] = sub_100035FCC;
    v10[3] = &unk_100066630;
    v10[4] = v9;
    [v8 deleteAllDonationsForAppDeletionWithCompletion:v10];
    return (id)swift_continuation_await(v3);
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_100035BD4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48LL);
  *(void *)(*(void *)v0 + 176LL) = v1;
  if (v1) {
    uint64_t v2 = sub_100035DDC;
  }
  else {
    uint64_t v2 = sub_100035C34;
  }
  return swift_task_switch(v2, 0LL, 0LL);
}

uint64_t sub_100035C34()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_1000708B4);
  *(void *)(v0 + 184) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100035C88;
  return sub_100036DD8();
}

uint64_t sub_100035C88()
{
  return swift_task_switch(sub_100035CDC, 0LL, 0LL);
}

uint64_t sub_100035CDC()
{
  uint64_t v1 = *(void *)(v0 + 160);
  uint64_t v2 = *(void *)(v0 + 136);
  uint64_t v3 = *(void *)(v0 + 144);
  sub_100033F58(0);
  uint64_t v4 = sub_10002D4A4();
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  char v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    id v8 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)id v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  v7,  "Messages finished uninstalling, imagent exiting gracefully soon.",  v8,  2u);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  uint64_t v10 = *(void *)(v0 + 152);
  uint64_t v9 = *(void *)(v0 + 160);
  uint64_t v11 = *(void *)(v0 + 136);
  uint64_t v12 = *(void *)(v0 + 144);

  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v9, v11);
  sub_100036B24();
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100035DDC(uint64_t a1)
{
  uint64_t v2 = v1[21];
  uint64_t v3 = v1[22];
  uint64_t v5 = v1[18];
  uint64_t v4 = v1[19];
  uint64_t v6 = v1[17];
  swift_willThrow(a1);
  swift_unknownObjectRelease(v2);
  uint64_t v7 = sub_10002D4A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v7, v6);
  swift_errorRetain(v3);
  uint64_t v8 = swift_errorRetain(v3);
  uint64_t v9 = (os_log_s *)Logger.logObject.getter(v8);
  os_log_type_t v10 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = v1[22];
    uint64_t v12 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v13 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v12 = 138412290;
    swift_errorRetain(v11);
    uint64_t v14 = _swift_stdlib_bridgeErrorToNSError(v11);
    v1[15] = v14;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 15, v1 + 16, v12 + 4, v12 + 12);
    *uint64_t v13 = v14;
    swift_errorRelease(v11);
    swift_errorRelease(v11);
    _os_log_impl( (void *)&_mh_execute_header,  v9,  v10,  "Failed to delete donations upon app deletion with error: %@",  v12,  0xCu);
    uint64_t v15 = sub_10002D164(&qword_100070778);
    swift_arrayDestroy(v13, 1LL, v15);
    swift_slowDealloc(v13, -1LL, -1LL);
    swift_slowDealloc(v12, -1LL, -1LL);

    swift_errorRelease(v11);
  }

  else
  {
    uint64_t v16 = v1[22];
    swift_errorRelease(v16);
    swift_errorRelease(v16);
    swift_errorRelease(v16);
  }

  (*(void (**)(void, void))(v1[18] + 8LL))(v1[19], v1[17]);
  sub_100033B14();
  uint64_t v17 = (void *)swift_task_alloc(dword_1000708B4);
  v1[23] = v17;
  void *v17 = v1;
  v17[1] = sub_100035C88;
  return sub_100036DD8();
}

uint64_t sub_100035FCC(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!a2) {
    return swift_continuation_throwingResume(*(void *)(a1 + 32));
  }
  uint64_t v4 = sub_10002D164(&qword_1000708D8);
  uint64_t v5 = swift_allocError(v4, &protocol self-conformance witness table for Error, 0LL, 0LL);
  *uint64_t v6 = a2;
  id v7 = a2;
  return swift_continuation_throwingResumeWithError(v2, v5);
}

id sub_100036040()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v40 - v7;
  URL._bridgeToObjectiveC()(&v40);
  os_log_type_t v10 = v9;
  id v42 = 0LL;
  LODWORD(v1) = [v1 removeItemAtURL:v9 error:&v42];

  id v11 = v42;
  if ((_DWORD)v1) {
    return v42;
  }
  id v13 = v42;
  uint64_t v14 = (void *)_convertNSErrorToError(_:)(v11);

  ((void (*)(void))swift_willThrow)();
  id v42 = v14;
  swift_errorRetain(v14);
  uint64_t v15 = sub_10002D164(&qword_1000708D8);
  uint64_t v16 = sub_100032148(0LL, (unint64_t *)&unk_1000708E0, &OBJC_CLASS___NSError_ptr);
  swift_errorRelease(v14);
  id v17 = v41;
  id v18 = [v41 code];
  uint64_t v19 = sub_10002D4A4();
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  if (v18 != (id)4)
  {
    v20(v8, v19, v2);
    uint64_t v30 = (objc_class *)v17;
    uint64_t v31 = (os_log_s *)Logger.logObject.getter(v30);
    os_log_type_t v32 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (_DWORD *)swift_slowAlloc(12LL, -1LL);
      v40._baseURL = (NSURL *)swift_slowAlloc(8LL, -1LL);
      v40._clients = v33;
      v40._reserved = v30;
      *uint64_t v33 = 138412290;
      v40._urlString = (NSString *)(v33 + 1);
      uint64_t v34 = v30;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v40._reserved, &v41, v40._urlString, v33 + 3);
      baseURL = v40._baseURL;
      v40._baseURL->super.Class isa = v30;

      os_log_type_t v36 = v32;
      clients = v40._clients;
      _os_log_impl((void *)&_mh_execute_header, v31, v36, "Error removing file: %@", (uint8_t *)v40._clients, 0xCu);
      uint64_t v38 = sub_10002D164(&qword_100070778);
      swift_arrayDestroy(baseURL, 1LL, v38);
      swift_slowDealloc(baseURL, -1LL, -1LL);
      swift_slowDealloc(clients, -1LL, -1LL);
    }

    else
    {

      uint64_t v31 = (os_log_s *)v30;
    }

    uint64_t v39 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    swift_willThrow(v39);
    return (id)swift_errorRelease(v42);
  }

  v20(v6, v19, v2);
  id v21 = (objc_class *)v17;
  os_log_type_t v22 = (os_log_s *)Logger.logObject.getter(v21);
  os_log_type_t v23 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v22, v23))
  {
    id v24 = (_DWORD *)swift_slowAlloc(12LL, -1LL);
    v40._baseURL = (NSURL *)swift_slowAlloc(8LL, -1LL);
    v40._clients = v24;
    v40._reserved = v21;
    *id v24 = 138412290;
    v40._urlString = (NSString *)(v24 + 1);
    uint64_t v25 = v21;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v40._reserved, &v41, v40._urlString, v24 + 3);
    uint64_t v26 = v40._baseURL;
    v40._baseURL->super.Class isa = v21;

    os_log_type_t v27 = v23;
    uint64_t v28 = v40._clients;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  v27,  "File not found, ignoring error: %@",  (uint8_t *)v40._clients,  0xCu);
    uint64_t v29 = sub_10002D164(&qword_100070778);
    swift_arrayDestroy(v26, 1LL, v29);
    swift_slowDealloc(v26, -1LL, -1LL);
    swift_slowDealloc(v28, -1LL, -1LL);
  }

  else
  {

    os_log_type_t v22 = (os_log_s *)v21;
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  return (id)swift_errorRelease(v42);
}

uint64_t sub_10003648C(uint64_t a1)
{
  return swift_continuation_resume(*(void *)(a1 + 32));
}

void sub_100036494(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for Logger(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a1)
  {
    uint64_t v7 = sub_100036608(a1);
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = sub_100036720((uint64_t)v7);
      swift_bridgeObjectRelease(v8, v10);

      if (v9)
      {
        if (*((_BYTE *)v1 + OBJC_IVAR____TtC7imagent28ApplicationWorkspaceObserver_didReceiveInstallSignal) == 1)
        {
          *((_BYTE *)v1 + OBJC_IVAR____TtC7imagent28ApplicationWorkspaceObserver_didReceiveInstallSignal) = 1;
          (*(void (**)(void))((swift_isaMask & *v1) + 0xC8LL))();
        }

        else
        {
          uint64_t v11 = sub_10002D4A4();
          uint64_t v12 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v11, v3);
          id v13 = (os_log_s *)Logger.logObject.getter(v12);
          os_log_type_t v14 = static os_log_type_t.info.getter();
          if (os_log_type_enabled(v13, v14))
          {
            uint64_t v15 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
            *(_WORD *)uint64_t v15 = 0;
            swift_slowDealloc(v15, -1LL, -1LL);
          }

          (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
        }
      }
    }
  }

void *sub_100036608(uint64_t a1)
{
  uint64_t v11 = &_swiftEmptyArrayStorage;
  uint64_t v2 = *(void *)(a1 + 16);
  specialized ContiguousArray.reserveCapacity(_:)(v2);
  if (!v2) {
    return v11;
  }
  for (uint64_t i = a1 + 32; ; i += 32LL)
  {
    sub_10002FDD4(i, (uint64_t)v10);
    uint64_t v4 = sub_100032148(0LL, &qword_100070898, &OBJC_CLASS___LSApplicationProxy_ptr);
    id v5 = v9;
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
    uint64_t v6 = v11[2];
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v6);
    uint64_t v7 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v6, v5);
    specialized ContiguousArray._endMutation()(v7);
    if (!--v2) {
      return v11;
    }
  }

  id v9 = 0LL;
  swift_release(v11);

  return 0LL;
}

void *sub_100036720(uint64_t a1)
{
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  swift_bridgeObjectRetain(a1);
  for (; v2; uint64_t v2 = _CocoaArrayWrapper.endIndex.getter(v19))
  {
    uint64_t v4 = 4LL;
    while (1)
    {
      id v8 = (a1 & 0xC000000000000001LL) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v4 - 4, a1)
         : *(id *)(a1 + 8 * v4);
      id v9 = v8;
      uint64_t v10 = v4 - 3;
      if (__OFADD__(v4 - 4, 1LL)) {
        break;
      }
      id v11 = [v8 bundleIdentifier];
      if (v11)
      {
        id v13 = v11;
        uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11, v12);
        uint64_t v16 = v15;

        if (v14 == 0xD000000000000013LL && v16 == 0x8000000100050070LL)
        {
          swift_bridgeObjectRelease(a1, v17);
          swift_bridgeObjectRelease(0x8000000100050070LL, v18);
          return v9;
        }

        char v5 = _stringCompareWithSmolCheck(_:_:expecting:)(v14, v16, 0xD000000000000013LL, 0x8000000100050070LL, 0LL);
        swift_bridgeObjectRelease(v16, v6);
        if ((v5 & 1) != 0)
        {
          swift_bridgeObjectRelease(a1, v7);
          return v9;
        }
      }

      ++v4;
      if (v10 == v2) {
        goto LABEL_20;
      }
    }

    __break(1u);
LABEL_16:
    if (a1 < 0) {
      uint64_t v19 = a1;
    }
    else {
      uint64_t v19 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
  }

void sub_1000368B8(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for Logger(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a1)
  {
    uint64_t v7 = sub_100036608(a1);
    if (v7)
    {
      id v8 = v7;
      id v9 = sub_100036720((uint64_t)v7);
      swift_bridgeObjectRelease(v8, v10);

      if (v9)
      {
        if ((*((_BYTE *)v1 + OBJC_IVAR____TtC7imagent28ApplicationWorkspaceObserver_didReceiveUninstallSignal) & 1) != 0)
        {
          uint64_t v11 = sub_10002D4A4();
          uint64_t v12 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v11, v3);
          id v13 = (os_log_s *)Logger.logObject.getter(v12);
          os_log_type_t v14 = static os_log_type_t.info.getter();
          if (os_log_type_enabled(v13, v14))
          {
            uint64_t v15 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
            *(_WORD *)uint64_t v15 = 0;
            swift_slowDealloc(v15, -1LL, -1LL);
          }

          (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
        }

        else
        {
          *((_BYTE *)v1 + OBJC_IVAR____TtC7imagent28ApplicationWorkspaceObserver_didReceiveUninstallSignal) = 1;
          (*(void (**)(void))((swift_isaMask & *v1) + 0xD0LL))();
        }
      }
    }
  }

uint64_t sub_100036A38(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  if (a3) {
    uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, (char *)&type metadata for Any + 8);
  }
  else {
    uint64_t v6 = 0LL;
  }
  id v7 = a1;
  a4(v6);

  return swift_bridgeObjectRelease(v6, v8);
}

uint64_t sub_100036B24()
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v23 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v21 = *(void *)(v3 - 8);
  uint64_t v22 = v3;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for DispatchTime(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v20 - v11;
  sub_100032148(0LL, &qword_1000704B0, &OBJC_CLASS___OS_dispatch_queue_ptr);
  id v13 = (void *)static OS_dispatch_queue.main.getter();
  static DispatchTime.now()();
  + infix(_:_:)(v10, 5.0);
  os_log_type_t v14 = *(void (**)(char *, uint64_t))(v7 + 8);
  v14(v10, v6);
  aBlock[4] = sub_100035434;
  void aBlock[5] = 0LL;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_10002E258;
  aBlock[3] = &unk_100066660;
  uint64_t v15 = _Block_copy(aBlock);
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  unint64_t v16 = sub_100032070();
  uint64_t v17 = sub_10002D164(&qword_1000704B8);
  unint64_t v18 = sub_1000320B8();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v17, v18, v0, v16);
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v12, v5, v2, v15);
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v23 + 8))(v2, v0);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v5, v22);
  return ((uint64_t (*)(char *, uint64_t))v14)(v12, v6);
}

uint64_t sub_100036D60()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_100036D8C()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc(dword_10007078C);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_10002D0FC;
  return sub_1000359EC((uint64_t)v3, v4, v5, v2);
}

uint64_t sub_100036DD8()
{
  uint64_t v1 = sub_10002D164((uint64_t *)&unk_1000708C0);
  v0[18] = swift_task_alloc((*(void *)(*(void *)(v1 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v2 = type metadata accessor for Logger(0LL);
  v0[19] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v0[20] = v3;
  unint64_t v4 = (*(void *)(v3 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v0[21] = swift_task_alloc(v4);
  v0[22] = swift_task_alloc(v4);
  v0[23] = swift_task_alloc(v4);
  v0[24] = swift_task_alloc(v4);
  v0[25] = swift_task_alloc(v4);
  uint64_t v5 = type metadata accessor for URL(0LL);
  v0[26] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v0[27] = v6;
  unint64_t v7 = (*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v0[28] = swift_task_alloc(v7);
  v0[29] = swift_task_alloc(v7);
  v0[30] = swift_task_alloc(v7);
  return swift_task_switch(sub_100036EFC, 0LL, 0LL);
}

uint64_t sub_100036EFC()
{
  v0[31] = [(id)objc_opt_self(NSFileManager) defaultManager];
  id v1 = (id)IMCachesDirectoryURL();
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  sub_100036040();
  uint64_t v2 = *(void (**)(void, void))(v0[27] + 8LL);
  v2(v0[30], v0[26]);
  v0[32] = 0LL;
  v0[33] = v2;
  v0[34] = objc_opt_self(&OBJC_CLASS___IMDServiceSession);
  uint64_t v3 = type metadata accessor for MainActor(0LL);
  v0[35] = static MainActor.shared.getter();
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  return swift_task_switch(sub_1000371A8, v4, v5);
}

uint64_t sub_1000371A8()
{
  id v1 = (void *)v0[34];
  swift_release(v0[35]);
  v0[36] = [v1 allServiceSessions];
  return swift_task_switch(sub_10003722C, 0LL, 0LL);
}

uint64_t sub_10003722C()
{
  id v1 = (void *)v0[36];
  uint64_t v2 = sub_100032148(0LL, (unint64_t *)&qword_10006FF28, &OBJC_CLASS___IMDServiceSession_ptr);
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v1, v2);
  v0[37] = v3;

  if ((unint64_t)v3 >> 62)
  {
    if (v3 < 0) {
      uint64_t v26 = v3;
    }
    else {
      uint64_t v26 = v3 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v3);
    uint64_t v5 = _CocoaArrayWrapper.endIndex.getter(v26);
    swift_bridgeObjectRelease(v3, v27);
    v0[38] = v5;
    if (v5) {
      goto LABEL_3;
    }
LABEL_15:
    swift_bridgeObjectRelease(v0[37], v4);
    type metadata accessor for SyncCoordinator(0LL);
    uint64_t v28 = (void *)swift_task_alloc(async function pointer to static SyncCoordinator.clearSyncStoreWhenSafe()[1]);
    v0[41] = v28;
    void *v28 = v0;
    v28[1] = sub_100037824;
    return static SyncCoordinator.clearSyncStoreWhenSafe()();
  }

  uint64_t v5 = *(void *)((v3 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  v0[38] = v5;
  if (!v5) {
    goto LABEL_15;
  }
LABEL_3:
  if (v5 < 1) {
    __break(1u);
  }
  v0[39] = 0LL;
  uint64_t v6 = v0[37];
  if ((v6 & 0xC000000000000001LL) != 0) {
    id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v6);
  }
  else {
    id v7 = *(id *)(v6 + 32);
  }
  uint64_t v8 = v7;
  v0[40] = v7;
  uint64_t v9 = v0[25];
  uint64_t v10 = v0[19];
  uint64_t v11 = v0[20];
  uint64_t v12 = sub_10002D4A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v9, v12, v10);
  id v13 = v8;
  os_log_type_t v14 = (os_log_s *)Logger.logObject.getter(v13);
  os_log_type_t v15 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc(12LL, -1LL);
    uint64_t v17 = (os_log_s **)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v16 = 138412290;
    *(void *)(v16 + 4) = v13;
    void *v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Requesting %@ to delete data", (uint8_t *)v16, 0xCu);
    uint64_t v18 = sub_10002D164(&qword_100070778);
    swift_arrayDestroy(v17, 1LL, v18);
    swift_slowDealloc(v17, -1LL, -1LL);
    swift_slowDealloc(v16, -1LL, -1LL);
  }

  else
  {

    os_log_type_t v14 = v13;
  }

  uint64_t v19 = v0 + 2;
  uint64_t v20 = v0[25];
  uint64_t v21 = v0[19];
  uint64_t v22 = v0[20];

  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v20, v21);
  v0[2] = v0;
  v0[3] = sub_100037520;
  uint64_t v23 = swift_continuation_init(v0 + 2, 0LL);
  v0[10] = _NSConcreteStackBlock;
  id v24 = v0 + 10;
  v24[1] = 0x40000000LL;
  v24[2] = sub_10003648C;
  v24[3] = &unk_100066648;
  v24[4] = v23;
  -[os_log_s deleteAllDataWithCompletionHandler:](v13, "deleteAllDataWithCompletionHandler:", v24);
  return swift_continuation_await(v19);
}

uint64_t sub_100037520()
{
  return swift_task_switch(sub_100037598, 0LL, 0LL);
}

uint64_t sub_100037598()
{
  uint64_t v1 = *(void *)(v0 + 312);
  uint64_t v2 = *(void *)(v0 + 304);

  if (v1 + 1 == v2)
  {
    swift_bridgeObjectRelease(*(void *)(v0 + 296), v3);
    type metadata accessor for SyncCoordinator(0LL);
    *(void *)(v0 + 32_Block_object_dispose(va, 8) = v4;
    void *v4 = v0;
    v4[1] = sub_100037824;
    return static SyncCoordinator.clearSyncStoreWhenSafe()();
  }

  else
  {
    uint64_t v6 = *(void *)(v0 + 312) + 1LL;
    *(void *)(v0 + 312) = v6;
    uint64_t v7 = *(void *)(v0 + 296);
    if ((v7 & 0xC000000000000001LL) != 0) {
      id v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v6, v7);
    }
    else {
      id v8 = *(id *)(v7 + 8 * v6 + 32);
    }
    uint64_t v9 = v8;
    *(void *)(v0 + 320) = v8;
    uint64_t v10 = *(void *)(v0 + 200);
    uint64_t v11 = *(void *)(v0 + 152);
    uint64_t v12 = *(void *)(v0 + 160);
    uint64_t v13 = sub_10002D4A4();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v10, v13, v11);
    os_log_type_t v14 = v9;
    os_log_type_t v15 = (os_log_s *)Logger.logObject.getter(v14);
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc(12LL, -1LL);
      uint64_t v18 = (os_log_s **)swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)uint64_t v17 = 138412290;
      *(void *)(v17 + 4) = v14;
      char *v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Requesting %@ to delete data", (uint8_t *)v17, 0xCu);
      uint64_t v19 = sub_10002D164(&qword_100070778);
      swift_arrayDestroy(v18, 1LL, v19);
      swift_slowDealloc(v18, -1LL, -1LL);
      swift_slowDealloc(v17, -1LL, -1LL);
    }

    else
    {

      os_log_type_t v15 = v14;
    }

    uint64_t v20 = v0 + 16;
    uint64_t v21 = *(void *)(v0 + 200);
    uint64_t v22 = *(void *)(v0 + 152);
    uint64_t v23 = *(void *)(v0 + 160);

    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v21, v22);
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 24) = sub_100037520;
    uint64_t v24 = swift_continuation_init(v0 + 16, 0LL);
    *(void *)(v0 + 80) = _NSConcreteStackBlock;
    uint64_t v25 = (void *)(v0 + 80);
    v25[1] = 0x40000000LL;
    v25[2] = sub_10003648C;
    v25[3] = &unk_100066648;
    v25[4] = v24;
    -[os_log_s deleteAllDataWithCompletionHandler:](v14, "deleteAllDataWithCompletionHandler:", v25);
    return swift_continuation_await(v20);
  }

uint64_t sub_100037824()
{
  return swift_task_switch(sub_1000378A4, 0LL, 0LL);
}

uint64_t sub_1000378A4()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 264);
  uint64_t v2 = *(void **)(v0 + 248);
  uint64_t v3 = *(void *)(v0 + 232);
  uint64_t v4 = *(void *)(v0 + 208);
  id v5 = [(id)objc_opt_self(IMDDatabase) synchronousDatabase];
  [v5 deleteDatabase];
  uint64_t v6 = swift_unknownObjectRelease(v5);
  id v7 = (id)IMSMSDirectoryURL(v6);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  URL._bridgeToObjectiveC()(v8);
  uint64_t v10 = v9;
  v1(v3, v4);
  *(void *)(v0 + 120) = 0LL;
  id v11 =  [v2 contentsOfDirectoryAtURL:v10 includingPropertiesForKeys:0 options:0 error:v0 + 120];

  id v12 = *(id *)(v0 + 120);
  if (v11)
  {
    uint64_t v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v11, *(void *)(v0 + 208));

    uint64_t v14 = *(void *)(v13 + 16);
    uint64_t v15 = *(void *)(v0 + 216);
    if (v14)
    {
      uint64_t v16 = *(void *)(v0 + 160);
      uint64_t v78 = v13;
      unint64_t v17 = v13 + ((*(unsigned __int8 *)(v15 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
      uint64_t v83 = *(void *)(v15 + 72);
      int v84 = *(void (**)(uint64_t, unint64_t, uint64_t))(v15 + 16);
      uint64_t v18 = *(void *)(v0 + 256);
      uint64_t v81 = *(void *)(v0 + 216);
      uint64_t v79 = v16;
      do
      {
        uint64_t v19 = *(void *)(v0 + 208);
        uint64_t v20 = *(void *)(v0 + 144);
        v84(v20, v17, v19);
        uint64_t v82 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56);
        v82(v20, 0LL, 1LL, v19);
        int v21 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v20, 1LL, v19);
        uint64_t v23 = *(void **)(v0 + 248);
        if (v21 == 1)
        {
          swift_bridgeObjectRelease(v78, v22);

          goto LABEL_22;
        }

        uint64_t v24 = (*(uint64_t (**)(void, void, void))(v15 + 32))( *(void *)(v0 + 224),  *(void *)(v0 + 144),  *(void *)(v0 + 208));
        uint64_t v93 = URL.path.getter(v24);
        unint64_t v26 = v25;
        sub_100036040();
        uint64_t v27 = *(void *)(v0 + 152);
        if (v18)
        {
          uint64_t v28 = *(void *)(v0 + 168);
          uint64_t v29 = sub_10002D4A4();
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v28, v29, v27);
          swift_errorRetain(v18);
          swift_bridgeObjectRetain(v26);
          uint64_t v30 = swift_errorRetain(v18);
          uint64_t v31 = (os_log_s *)Logger.logObject.getter(v30);
          os_log_type_t v32 = static os_log_type_t.error.getter();
          BOOL v33 = os_log_type_enabled(v31, v32);
          uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v0 + 264);
          uint64_t v91 = *(void *)(v0 + 224);
          uint64_t v87 = *(void *)(v0 + 168);
          uint64_t v89 = *(void *)(v0 + 208);
          uint64_t v85 = *(void *)(v0 + 152);
          if (v33)
          {
            id v80 = *(void (**)(uint64_t, uint64_t))(v0 + 264);
            uint64_t v35 = swift_slowAlloc(22LL, -1LL);
            os_log_type_t v36 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
            uint64_t v37 = swift_slowAlloc(32LL, -1LL);
            v95[0] = v37;
            *(_DWORD *)uint64_t v35 = 136315394;
            swift_bridgeObjectRetain(v26);
            *(void *)(v35 + 4) = sub_10002F0C4(v93, v26, v95);
            swift_bridgeObjectRelease_n(v26, 3LL);
            *(_WORD *)(v35 + 12) = 2112;
            swift_errorRetain(v18);
            uint64_t v38 = _swift_stdlib_bridgeErrorToNSError(v18);
            *(void *)(v35 + 14) = v38;
            uint64_t *v36 = v38;
            swift_errorRelease(v18);
            swift_errorRelease(v18);
            _os_log_impl((void *)&_mh_execute_header, v31, v32, "Error deleting file at %s: %@", (uint8_t *)v35, 0x16u);
            uint64_t v39 = sub_10002D164(&qword_100070778);
            swift_arrayDestroy(v36, 1LL, v39);
            swift_slowDealloc(v36, -1LL, -1LL);
            swift_arrayDestroy(v37, 1LL, (char *)&type metadata for Any + 8);
            uint64_t v40 = v37;
            uint64_t v15 = v81;
            swift_slowDealloc(v40, -1LL, -1LL);
            swift_slowDealloc(v35, -1LL, -1LL);

            swift_errorRelease(v18);
            uint64_t v16 = v79;
            (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v87, v85);
            v80(v91, v89);
          }

          else
          {

            swift_errorRelease(v18);
            swift_errorRelease(v18);
            swift_bridgeObjectRelease_n(v26, 2LL);
            swift_errorRelease(v18);
            (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v87, v85);
            v34(v91, v89);
          }
        }

        else
        {
          uint64_t v41 = *(void *)(v0 + 192);
          uint64_t v42 = sub_10002D4A4();
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v41, v42, v27);
          uint64_t v43 = swift_bridgeObjectRetain(v26);
          uint64_t v44 = (os_log_s *)Logger.logObject.getter(v43);
          os_log_type_t v45 = static os_log_type_t.info.getter();
          BOOL v46 = os_log_type_enabled(v44, v45);
          char v47 = *(void (**)(uint64_t, uint64_t))(v0 + 264);
          uint64_t v48 = *(void *)(v0 + 224);
          uint64_t v92 = *(void *)(v0 + 208);
          uint64_t v49 = *(void *)(v0 + 192);
          uint64_t v90 = *(void *)(v0 + 152);
          if (v46)
          {
            uint64_t v88 = *(void (**)(uint64_t, uint64_t))(v0 + 264);
            uint64_t v50 = swift_slowAlloc(12LL, -1LL);
            uint64_t v86 = v48;
            uint64_t v51 = swift_slowAlloc(32LL, -1LL);
            v95[0] = v51;
            *(_DWORD *)uint64_t v50 = 136315138;
            swift_bridgeObjectRetain(v26);
            *(void *)(v50 + 4) = sub_10002F0C4(v93, v26, v95);
            swift_bridgeObjectRelease_n(v26, 3LL);
            _os_log_impl((void *)&_mh_execute_header, v44, v45, "Deleted file: %s", (uint8_t *)v50, 0xCu);
            swift_arrayDestroy(v51, 1LL, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v51, -1LL, -1LL);
            swift_slowDealloc(v50, -1LL, -1LL);

            (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v49, v90);
            v88(v86, v92);
          }

          else
          {

            swift_bridgeObjectRelease_n(v26, 2LL);
            (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v49, v90);
            v47(v48, v92);
          }

          uint64_t v15 = v81;
        }

        uint64_t v18 = 0LL;
        v17 += v83;
        --v14;
      }

      while (v14);
      uint64_t v13 = v78;
      uint64_t v66 = v82;
    }

    else
    {
      uint64_t v66 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56);
    }

    __int128 v67 = *(void **)(v0 + 248);
    v66(*(void *)(v0 + 144), 1LL, 1LL, *(void *)(v0 + 208));
    swift_bridgeObjectRelease(v13, v68);
  }

  else
  {
    uint64_t v52 = v12;
    uint64_t v53 = *(void *)(v0 + 176);
    uint64_t v54 = *(void *)(v0 + 152);
    uint64_t v55 = *(void *)(v0 + 160);
    uint64_t v56 = _convertNSErrorToError(_:)(v12);

    swift_willThrow(v57);
    uint64_t v58 = sub_10002D4A4();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v55 + 16))(v53, v58, v54);
    swift_errorRetain(v56);
    uint64_t v59 = swift_errorRetain(v56);
    uint64_t v60 = (os_log_s *)Logger.logObject.getter(v59);
    os_log_type_t v61 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v60, v61))
    {
      uint64_t v94 = *(void **)(v0 + 248);
      uint64_t v62 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v63 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)uint64_t v62 = 138412290;
      swift_errorRetain(v56);
      uint64_t v64 = _swift_stdlib_bridgeErrorToNSError(v56);
      *(void *)(v0 + 12_Block_object_dispose(va, 8) = v64;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 128, v0 + 136, v62 + 4, v62 + 12);
      uint64_t *v63 = v64;
      swift_errorRelease(v56);
      swift_errorRelease(v56);
      _os_log_impl( (void *)&_mh_execute_header,  v60,  v61,  "Failed to fetch contents of directory with error: %@",  v62,  0xCu);
      uint64_t v65 = sub_10002D164(&qword_100070778);
      swift_arrayDestroy(v63, 1LL, v65);
      swift_slowDealloc(v63, -1LL, -1LL);
      swift_slowDealloc(v62, -1LL, -1LL);

      swift_errorRelease(v56);
    }

    else
    {

      swift_errorRelease(v56);
      swift_errorRelease(v56);
      swift_errorRelease(v56);
    }

    (*(void (**)(void, void))(*(void *)(v0 + 160) + 8LL))(*(void *)(v0 + 176), *(void *)(v0 + 152));
  }

uint64_t sub_1000380A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000380B4(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t IMDaemonBuddyListRequestHandler.requiredCapabilities.getter()
{
  return 1024LL;
}

uint64_t sub_1000380C4()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_10002D4C0(v0, qword_1000719E8);
  sub_10002D2C4(v0, (uint64_t)qword_1000719E8);
  uint64_t v1 = static Logger.messagesSubsystem.getter();
  return Logger.init(subsystem:category:)(v1);
}

void IMDaemonAutomationRequestHandler.simulateMessages(_:completion:)( uint64_t a1, void (*a2)(uint64_t))
{
  id v4 = [(id)objc_opt_self(IMLockdownManager) sharedInstance];
  if (v4 && (v5 = v4, unsigned int v6 = [v4 isInternalInstall], v5, v6))
  {
    id v7 = objc_allocWithZone(&OBJC_CLASS___IMDBatchMessageSimulator);
    sub_100038B98();
    swift_bridgeObjectRetain(a1);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a1, v9);
    id v10 = [v7 initWithMessages:isa];

    id v22 = 0LL;
    unsigned int v11 = [v10 runWithError:&v22];
    id v12 = v22;
    if (v11)
    {
      id v13 = v22;
      a2(0LL);
    }

    else
    {
      id v18 = v22;
      uint64_t v19 = _convertNSErrorToError(_:)(v12);

      swift_willThrow(v20);
      swift_errorRetain(v19);
      a2(v19);

      swift_errorRelease(v19);
      swift_errorRelease(v19);
    }
  }

  else
  {
    if (qword_1000719E0 != -1) {
      swift_once(&qword_1000719E0, sub_1000380C4);
    }
    uint64_t v14 = type metadata accessor for Logger(0LL);
    uint64_t v15 = sub_10002D2C4(v14, (uint64_t)qword_1000719E8);
    oslog = (os_log_s *)Logger.logObject.getter(v15);
    os_log_type_t v16 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(oslog, v16))
    {
      unint64_t v17 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)unint64_t v17 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  oslog,  v16,  "Rejecting request to simulate messages as this is not an internal install",  v17,  2u);
      swift_slowDealloc(v17, -1LL, -1LL);
    }
  }

void IMDaemonAutomationRequestHandler.relayMessageGUID(_:completion:)( uint64_t a1, uint64_t a2, void (*a3)(void))
{
  id v4 = [(id)objc_opt_self(IMLockdownManager) sharedInstance];
  if (v4)
  {
    id v5 = v4;
    unsigned int v6 = [v4 isInternalInstall];

    if (!v6
      || (id v7 = (void *)objc_opt_self(&OBJC_CLASS___IMDMessageStore),
          id v8 = [v7 sharedInstance],
          NSString v9 = String._bridgeToObjectiveC()(),
          id v18 = [v8 messageWithGUID:v9],
          v8,
          v9,
          !v18))
    {
      a3();
      return;
    }

    id v10 = [v7 sharedInstance];
    NSString v11 = String._bridgeToObjectiveC()();
    id v12 = [v10 existingChatForMessageGUID:v11];

    if (!v12)
    {
      ((void (*)(void))a3)(0LL);
      goto LABEL_9;
    }

    id v13 = [(id)objc_opt_self(IMDRelayServiceController) sharedInstance];
    if (v13)
    {
      uint64_t v14 = v13;
      id v15 = v18;
      id v18 = v12;
      id v16 = [v15 service];
      id v17 = [v14 relayMessageToPeers:v15 forChat:v18 serviceName:v16 reflectOnly:1 requiredCapabilities:0];

      ((void (*)(id))a3)(v17);
LABEL_9:

      return;
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
}

Swift::Void __swiftcall IMDaemonAutomationRequestHandler.relayMessageGUIDSent(_:onService:interworked:)( Swift::String _, Swift::String onService, Swift::Bool interworked)
{
  id v4 = [(id)objc_opt_self(IMDRelayServiceController) sharedInstance];
  if (v4)
  {
    id v5 = v4;
    NSString v6 = String._bridgeToObjectiveC()();
    id v7 = String._bridgeToObjectiveC()();
    [v5 messageSent:v6 onService:v7 compatibilityService:0 wasInterworked:interworked];
  }

  else
  {
    __break(1u);
  }

Swift::Void __swiftcall IMDaemonAutomationRequestHandler.simulateAppDeletion()()
{
  uint64_t v0 = (id *)sub_100034C20();
  uint64_t v1 = *(void (**)(void))((swift_isaMask & *(void *)*v0) + 0xD0LL);
  id v2 = *v0;
  v1();
}

Swift::Void __swiftcall IMDaemonAutomationRequestHandler.simulateAppInstallation()()
{
  uint64_t v0 = (id *)sub_100034C20();
  uint64_t v1 = *(void (**)(void))((swift_isaMask & *(void *)*v0) + 0xC8LL);
  id v2 = *v0;
  v1();
}

unint64_t sub_100038B98()
{
  unint64_t result = qword_1000709D0;
  if (!qword_1000709D0)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___IMSimulatedMessage);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000709D0);
  }

  return result;
}

void sub_100038BD4(uint64_t a1, uint64_t a2)
{
  id v4 = [(id)objc_opt_self(IMLockdownManager) sharedInstance];
  if (v4 && (v5 = v4, unsigned int v6 = [v4 isInternalInstall], v5, v6))
  {
    id v7 = objc_allocWithZone(&OBJC_CLASS___IMDBatchMessageSimulator);
    sub_100038B98();
    swift_bridgeObjectRetain(a1);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a1, v9);
    id v10 = [v7 initWithMessages:isa];

    id v24 = 0LL;
    unsigned int v11 = [v10 runWithError:&v24];
    id v12 = v24;
    if (v11)
    {
      id v13 = *(void (**)(uint64_t, void))(a2 + 16);
      id v14 = v24;
      v13(a2, 0LL);
    }

    else
    {
      id v19 = v24;
      uint64_t v20 = _convertNSErrorToError(_:)(v12);

      swift_willThrow(v21);
      swift_errorRetain(v20);
      id v22 = (void *)_convertErrorToNSError(_:)(v20);
      (*(void (**)(uint64_t, void *))(a2 + 16))(a2, v22);

      swift_errorRelease(v20);
      swift_errorRelease(v20);
    }
  }

  else
  {
    if (qword_1000719E0 != -1) {
      swift_once(&qword_1000719E0, sub_1000380C4);
    }
    uint64_t v15 = type metadata accessor for Logger(0LL);
    uint64_t v16 = sub_10002D2C4(v15, (uint64_t)qword_1000719E8);
    oslog = (os_log_s *)Logger.logObject.getter(v16);
    os_log_type_t v17 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(oslog, v17))
    {
      id v18 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)id v18 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  oslog,  v17,  "Rejecting request to simulate messages as this is not an internal install",  v18,  2u);
      swift_slowDealloc(v18, -1LL, -1LL);
    }
  }

void _sSo32IMDaemonAutomationRequestHandlerC7imagentE26updateOffGridSummaryOnChat8withGUID19pendingMessageCountySS_SitF_0( uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = [(id)objc_opt_self(IMLockdownManager) sharedInstance];
  if (v4)
  {
    id v5 = v4;
    unsigned int v6 = [v4 isInternalInstall];

    if (v6)
    {
      id v7 = [(id)objc_opt_self(IMFeatureFlags) sharedFeatureFlags];
      unsigned int v8 = [v7 isCarrierPigeonEnabled];

      if (v8)
      {
        id v9 = [(id)objc_opt_self(IMDChatRegistry) sharedInstance];
        NSString v10 = String._bridgeToObjectiveC()();
        id v11 = [v9 existingChatWithGUID:v10];

        if (v11)
        {
          [v11 updatePendingIncomingSatelliteMessageCount:a3];
        }
      }
    }
  }

  else
  {
    __break(1u);
  }

void _sSo32IMDaemonAutomationRequestHandlerC7imagentE46simulateReceivedPendingSatelliteMessageForChat8withGUIDySS_tF_0()
{
  id v0 = [(id)objc_opt_self(IMLockdownManager) sharedInstance];
  if (!v0)
  {
LABEL_9:
    __break(1u);
    return;
  }

  uint64_t v1 = v0;
  unsigned int v2 = [v0 isInternalInstall];

  if (v2)
  {
    id v3 = [(id)objc_opt_self(IMFeatureFlags) sharedFeatureFlags];
    unsigned int v4 = [v3 isCarrierPigeonEnabled];

    if (v4)
    {
      id v5 = [(id)objc_opt_self(IMDChatRegistry) sharedInstance];
      NSString v6 = String._bridgeToObjectiveC()();
      id v10 = [v5 existingChatWithGUID:v6];

      if (v10)
      {
        id v7 = [v10 pendingIncomingSatelliteMessageCount];
        uint64_t v8 = (uint64_t)v7 - 1;
        if (!__OFSUB__(v7, 1LL))
        {
          uint64_t v9 = v8 & ~(v8 >> 63);
          [v10 updateIsDownloadingPendingSatelliteMessages:v8 > 0];
          [v10 updatePendingIncomingSatelliteMessageCount:v9];

          return;
        }

        __break(1u);
        goto LABEL_9;
      }
    }
  }

void _sSo32IMDaemonAutomationRequestHandlerC7imagentE017simulateDowngradeC06fromID0H7Service02toJ014expirationDateySS_S2S10Foundation0M0VtF_0()
{
  id v0 = [(id)objc_opt_self(IMLockdownManager) sharedInstance];
  if (!v0)
  {
    __break(1u);
    goto LABEL_12;
  }

  uint64_t v1 = v0;
  unsigned int v2 = [v0 isInternalInstall];

  if (!v2) {
    return;
  }
  id v3 = [(id)objc_opt_self(IMFeatureFlags) sharedFeatureFlags];
  unsigned int v4 = [v3 isCarrierPigeonEnabled];

  if (!v4) {
    return;
  }
  id v5 = [(id)objc_opt_self(IMDAccountController) sharedInstance];
  if (!v5)
  {
LABEL_12:
    __break(1u);
    return;
  }

  NSString v6 = v5;
  NSString v7 = String._bridgeToObjectiveC()();
  id v16 = [v6 anySessionForServiceName:v7];

  if (v16)
  {
    id v8 = v16;
    NSString v9 = String._bridgeToObjectiveC()();
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    NSString v11 = String._bridgeToObjectiveC()();
    [v8 downgradeRequestedForHandleID:v9 expirationDate:isa preferredService:v11];
  }

  id v12 = [(id)objc_opt_self(IMDBroadcastController) sharedProvider];
  if (v12)
  {
    id v13 = v12;
    id v14 = [v12 broadcasterForChatListeners];
    swift_unknownObjectRelease(v13);
    NSString v15 = String._bridgeToObjectiveC()();
    [v14 serviceSwitchRequestReceivedForChatWithIdentifier:v15];

    swift_unknownObjectRelease(v14);
  }
}

void sub_10003934C(uint64_t a1, uint64_t a2, void (**a3)(void, void))
{
  id v4 = [(id)objc_opt_self(IMLockdownManager) sharedInstance];
  if (v4)
  {
    id v5 = v4;
    unsigned __int8 v6 = [v4 isInternalInstall];

    if ((v6 & 1) == 0
      || (NSString v7 = (void *)objc_opt_self(&OBJC_CLASS___IMDMessageStore),
          id v8 = [v7 sharedInstance],
          NSString v9 = String._bridgeToObjectiveC()(),
          id v18 = [v8 messageWithGUID:v9],
          v8,
          v9,
          !v18))
    {
      a3[2](a3, 0LL);
      return;
    }

    id v10 = [v7 sharedInstance];
    NSString v11 = String._bridgeToObjectiveC()();
    id v12 = [v10 existingChatForMessageGUID:v11];

    if (!v12)
    {
      a3[2](a3, 0LL);
      goto LABEL_9;
    }

    id v13 = [(id)objc_opt_self(IMDRelayServiceController) sharedInstance];
    if (v13)
    {
      id v14 = v13;
      id v15 = v18;
      id v18 = v12;
      id v16 = [v15 service];
      id v17 = [v14 relayMessageToPeers:v15 forChat:v18 serviceName:v16 reflectOnly:1 requiredCapabilities:0];

      ((void (**)(void, id))a3)[2](a3, v17);
LABEL_9:

      return;
    }
  }

  else
  {
    _Block_release(a3);
    __break(1u);
  }

  _Block_release(a3);
  __break(1u);
}

uint64_t IMDaemonModifyReadStateRequestHandler.requiredCapabilities.getter()
{
  return 0x40000LL;
}

uint64_t IMDaemonChatRequestHandler.loadChats(withPinningIdentifier:reply:)( uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  id v4 = (void *)objc_opt_self(&OBJC_CLASS___IMDChatRegistry);
  id v5 = [v4 sharedInstance];
  NSString v6 = String._bridgeToObjectiveC()();
  Class isa = (Class)[v5 existingChatsWithPinningIdentifier:v6];

  if (!isa)
  {
    uint64_t v8 = sub_100032148(0LL, &qword_100070A98, &OBJC_CLASS___IMDChat_ptr);
    uint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(0LL, v8);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v9, v10);
  }

  id v11 = [v4 sharedInstance];
  id v12 = [v11 _chatInfoForChats:isa];

  uint64_t v13 = sub_10002D164(&qword_100070AA0);
  uint64_t v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v12, v13);

  a3(v14);
  return swift_bridgeObjectRelease(v14, v15);
}

uint64_t IMDaemonChatRequestHandler.loadAnyChatsContainingHandleIDs(in:reply:)( void *a1, void (*a2)(uint64_t))
{
  unint64_t isUniquelyReferenced_nonNull_native = sub_100039C10((uint64_t)&_swiftEmptyArrayStorage, (uint64_t)a2);
  id v4 = [(id)objc_opt_self(IMDAccountController) sharedAccountController];
  if (!v4)
  {
LABEL_44:
    __break(1u);
LABEL_45:
    __break(1u);
LABEL_46:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
    __break(1u);
    return result;
  }

  id v5 = v4;
  id v6 = [v4 accounts];

  if (!v6) {
    goto LABEL_45;
  }
  uint64_t v7 = sub_100032148(0LL, &qword_100070AA8, &OBJC_CLASS___IMDAccount_ptr);
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v6, v7);

  uint64_t v10 = (void *)a1[2];
  if (v10)
  {
    uint64_t v63 = *(void *)((v8 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    swift_bridgeObjectRetain(a1);
LABEL_6:
    id v12 = 0LL;
    uint64_t v57 = a1;
    uint64_t v58 = a1 + 4;
    uint64_t v60 = v8;
    unint64_t v61 = v8 & 0xC000000000000001LL;
    uint64_t v56 = v10;
    do
    {
      if (v12 == v10)
      {
LABEL_38:
        __break(1u);
LABEL_39:
        if (v8 < 0) {
          uint64_t v53 = v8;
        }
        else {
          uint64_t v53 = v8 & 0xFFFFFFFFFFFFFF8LL;
        }
        swift_bridgeObjectRetain(a1);
        swift_bridgeObjectRetain(v8);
        uint64_t v63 = _CocoaArrayWrapper.endIndex.getter(v53);
        swift_bridgeObjectRelease(v8, v54);
        goto LABEL_6;
      }

      if (v63)
      {
        uint64_t v59 = v12;
        uint64_t v14 = v58[2 * (void)v12 + 1];
        id v62 = (id)objc_opt_self(&OBJC_CLASS___IMDChatRegistry);
        swift_bridgeObjectRetain(v8);
        uint64_t v64 = v14;
        swift_bridgeObjectRetain(v14);
        uint64_t v15 = 4LL;
        while (1)
        {
          uint64_t v10 = (void *)(v15 - 4);
          if (v61) {
            id v17 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v15 - 4, v8);
          }
          else {
            id v17 = *(id *)(v8 + 8 * v15);
          }
          id v18 = v17;
          uint64_t v19 = v15 - 3;
          if (__OFADD__(v10, 1LL))
          {
            __break(1u);
LABEL_36:
            __break(1u);
LABEL_37:
            __break(1u);
            goto LABEL_38;
          }

          a1 = [v62 sharedInstance];
          NSString v20 = String._bridgeToObjectiveC()();
          id v21 = [a1 existingChatForID:v20 account:v18];

          if (v21) {
            break;
          }

LABEL_13:
          ++v15;
          if (v19 == v63)
          {
            swift_bridgeObjectRelease(v64, v16);
            swift_bridgeObjectRelease(v8, v13);
            uint64_t v10 = v56;
            a1 = v57;
            id v12 = v59;
            goto LABEL_8;
          }
        }

        id v22 = [v21 guid];
        if (!v22)
        {
          __break(1u);
          goto LABEL_44;
        }

        id v24 = v22;
        uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v22, v23);
        a1 = v25;

        id v26 = v21;
        uint64_t v10 = (void *)isUniquelyReferenced_nonNull_native;
        unint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(isUniquelyReferenced_nonNull_native);
        uint64_t v65 = v10;
        unint64_t v28 = sub_100034070(v8, (uint64_t)a1);
        uint64_t v29 = v10[2];
        BOOL v30 = (v27 & 1) == 0;
        uint64_t v31 = v29 + v30;
        if (__OFADD__(v29, v30)) {
          goto LABEL_36;
        }
        char v32 = v27;
        if (v10[3] >= v31)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) != 0)
          {
            unint64_t isUniquelyReferenced_nonNull_native = (unint64_t)v65;
            if ((v27 & 1) == 0) {
              goto LABEL_29;
            }
          }

          else
          {
            uint64_t v10 = &v65;
            sub_10003A0B0();
            unint64_t isUniquelyReferenced_nonNull_native = (unint64_t)v65;
            if ((v32 & 1) == 0) {
              goto LABEL_29;
            }
          }
        }

        else
        {
          sub_100039DA4(v31, isUniquelyReferenced_nonNull_native);
          uint64_t v10 = v65;
          unint64_t v33 = sub_100034070(v8, (uint64_t)a1);
          if ((v32 & 1) != (v34 & 1)) {
            goto LABEL_46;
          }
          unint64_t v28 = v33;
          unint64_t isUniquelyReferenced_nonNull_native = (unint64_t)v65;
          if ((v32 & 1) == 0)
          {
LABEL_29:
            *(void *)(isUniquelyReferenced_nonNull_native + 8 * (v28 >> 6) + 64) |= 1LL << v28;
            os_log_type_t v36 = (uint64_t *)(*(void *)(isUniquelyReferenced_nonNull_native + 48) + 16 * v28);
            uint64_t *v36 = v8;
            v36[1] = (uint64_t)a1;
            *(void *)(*(void *)(isUniquelyReferenced_nonNull_native + 56) + 8 * v2_Block_object_dispose(va, 8) = v26;
            uint64_t v37 = *(void *)(isUniquelyReferenced_nonNull_native + 16);
            BOOL v38 = __OFADD__(v37, 1LL);
            uint64_t v39 = v37 + 1;
            if (v38) {
              goto LABEL_37;
            }
            *(void *)(isUniquelyReferenced_nonNull_native + 16) = v39;
            swift_bridgeObjectRetain(a1);
            goto LABEL_31;
          }
        }

        uint64_t v35 = *(void *)(isUniquelyReferenced_nonNull_native + 56);

        *(void *)(v35 + 8 * v2_Block_object_dispose(va, 8) = v26;
LABEL_31:

        swift_bridgeObjectRelease(a1, v40);
        swift_bridgeObjectRelease(0x8000000000000000LL, v41);
        uint64_t v8 = v60;
        goto LABEL_13;
      }

LABEL_8:
      id v12 = (void *)((char *)v12 + 1);
    }

    while (v12 != v10);
    swift_bridgeObjectRelease(v8, v11);
  }

  else
  {
    a1 = (void *)v8;
  }

  swift_bridgeObjectRelease(a1, v9);
  id v42 = [(id)objc_opt_self(IMDChatRegistry) sharedInstance];
  uint64_t v43 = swift_bridgeObjectRetain(isUniquelyReferenced_nonNull_native);
  uint64_t v44 = sub_10003A458(v43);
  swift_bridgeObjectRelease(isUniquelyReferenced_nonNull_native, v45);
  sub_100032148(0LL, &qword_100070A98, &OBJC_CLASS___IMDChat_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_release(v44);
  id v47 = [v42 _chatInfoForChats:isa];

  uint64_t v48 = sub_10002D164(&qword_100070AA0);
  uint64_t v49 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v47, v48);

  a2(v49);
  swift_bridgeObjectRelease(isUniquelyReferenced_nonNull_native, v50);
  return swift_bridgeObjectRelease(v49, v51);
}

      ++v12;
    }

    while (v12 != v10);
    swift_bridgeObjectRelease(v8, v11);
  }

  else
  {
    a1 = v8;
  }

  swift_bridgeObjectRelease(a1, v9);
  uint64_t v40 = [(id)objc_opt_self(IMDChatRegistry) sharedInstance];
  uint64_t v41 = swift_bridgeObjectRetain(v3);
  id v42 = sub_10003A458(v41);
  swift_bridgeObjectRelease(v3, v43);
  sub_100032148(0LL, &qword_100070A98, &OBJC_CLASS___IMDChat_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_release(v42);
  uint64_t v45 = [v40 _chatInfoForChats:isa];

  BOOL v46 = sub_10002D164(&qword_100070AA0);
  id v47 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v45, v46);

  id v62 = Array._bridgeToObjectiveC()().super.isa;
  ((void (**)(void, Class))a2)[2](a2, v62);
  swift_bridgeObjectRelease(v3, v48);
  swift_bridgeObjectRelease(v47, v49);
}

unint64_t sub_100039C10(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
    id v5 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_10002D164(&qword_100070AB0);
  uint64_t v4 = static _DictionaryStorage.allocate(capacity:)(v3);
  id v5 = (void *)v4;
  uint64_t v6 = *(void *)(a1 + 16);
  if (!v6)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1, a2);
    return (unint64_t)v5;
  }

  swift_retain(v4);
  uint64_t v7 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v8 = (uint64_t)*(v7 - 2);
    uint64_t v9 = (uint64_t)*(v7 - 1);
    uint64_t v10 = *v7;
    swift_bridgeObjectRetain(v9);
    id v11 = v10;
    unint64_t result = sub_100034070(v8, v9);
    if ((v13 & 1) != 0) {
      break;
    }
    *(void *)((char *)v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v14 = (uint64_t *)(v5[6] + 16 * result);
    *uint64_t v14 = v8;
    v14[1] = v9;
    *(void *)(v5[7] + 8 * result) = v11;
    uint64_t v15 = v5[2];
    BOOL v16 = __OFADD__(v15, 1LL);
    uint64_t v17 = v15 + 1;
    if (v16) {
      goto LABEL_11;
    }
    _OWORD v5[2] = v17;
    v7 += 3;
    if (!--v6)
    {
      swift_release(v5);
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

Swift::Int sub_100039DA4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_10002D164(&qword_100070AB0);
  char v39 = a2;
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v8 = v7;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_43;
  }
  uint64_t v9 = 1LL << *(_BYTE *)(v5 + 32);
  uint64_t v38 = v5 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1LL << v9);
  }
  else {
    uint64_t v10 = -1LL;
  }
  unint64_t v11 = v10 & *(void *)(v5 + 64);
  os_log_type_t v36 = v3;
  int64_t v37 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  Swift::Int result = swift_retain(v5);
  int64_t v14 = 0LL;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_34;
    }

    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1LL))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }

    if (v22 >= v37) {
      break;
    }
    uint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v37) {
        goto LABEL_36;
      }
      unint64_t v24 = *(void *)(v38 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_36:
          swift_release(v5);
          uint64_t v3 = v36;
          if ((v39 & 1) == 0) {
            goto LABEL_43;
          }
          goto LABEL_39;
        }

        unint64_t v24 = *(void *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1LL)) {
              goto LABEL_45;
            }
            if (v14 >= v37) {
              goto LABEL_36;
            }
            unint64_t v24 = *(void *)(v38 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_33;
            }
          }
        }

        int64_t v14 = v25;
      }
    }

LABEL_33:
    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_34:
    BOOL v30 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    unint64_t v33 = *(void **)(*(void *)(v5 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain(v30[1]);
      id v34 = v33;
    }

    Hasher.init(_seed:)(v40, *(void *)(v8 + 40));
    String.hash(into:)(v40, v32, v31);
    Swift::Int result = Hasher._finalize()();
    uint64_t v15 = -1LL << *(_BYTE *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1LL << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1LL << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }

        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0LL;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }

      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }

    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v18;
    uint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    *uint64_t v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v1_Block_object_dispose(va, 8) = v33;
    ++*(void *)(v8 + 16);
  }

  swift_release(v5);
  uint64_t v3 = v36;
  uint64_t v23 = (void *)(v5 + 64);
  if ((v39 & 1) == 0) {
    goto LABEL_43;
  }
LABEL_39:
  uint64_t v35 = 1LL << *(_BYTE *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    *uint64_t v23 = -1LL << v35;
  }
  *(void *)(v5 + 16) = 0LL;
LABEL_43:
  Swift::Int result = swift_release(v5);
  *uint64_t v3 = v8;
  return result;
}

    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_34:
    BOOL v30 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    unint64_t v33 = *(void **)(*(void *)(v5 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain(v30[1]);
      id v34 = v33;
    }

    Hasher.init(_seed:)(v40, *(void *)(v8 + 40));
    String.hash(into:)(v40, v32, v31);
    Swift::Int result = Hasher._finalize()();
    uint64_t v15 = -1LL << *(_BYTE *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1LL << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1LL << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }

        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0LL;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }

      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }

    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v18;
    uint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    *uint64_t v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v1_Block_object_dispose(va, 8) = v33;
    ++*(void *)(v8 + 16);
  }

  swift_release(v5);
  uint64_t v3 = v36;
  uint64_t v23 = (void *)(v5 + 64);
  if ((v39 & 1) == 0) {
    goto LABEL_43;
  }
LABEL_39:
  uint64_t v35 = 1LL << *(_BYTE *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    *uint64_t v23 = -1LL << v35;
  }
  *(void *)(v5 + 16) = 0LL;
LABEL_43:
  Swift::Int result = swift_release(v5);
  *uint64_t v3 = v8;
  return result;
}

id sub_10003A0B0()
{
  uint64_t v1 = v0;
  sub_10002D164(&qword_100070AB0);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release(v2);
    *uint64_t v1 = v4;
    return result;
  }

  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }

    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }

LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain(v18);
    id result = v20;
  }

  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }

  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }

    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain(v18);
    id result = v20;
  }

  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }

  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }

    unint64_t v14 = (v26 - 1) & v26;
    unint64_t v17 = __clz(__rbit64(v26)) + (v11 << 6);
LABEL_12:
    uint64_t v18 = 16 * v17;
    uint64_t v19 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v17);
    unint64_t v21 = *v19;
    unint64_t v20 = v19[1];
    int64_t v22 = *(void *)(v1 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(void *)(v4 + 56) + v22, v15);
    unint64_t v23 = v35;
    int64_t v24 = (void *)(*(void *)(v35 + 48) + v18);
    *int64_t v24 = v21;
    v24[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(void *)(v23 + 56) + v22, v3, v15);
    id result = (void *)swift_bridgeObjectRetain(v20);
  }

  unint64_t v27 = v25 + 2;
  if (v27 >= v33)
  {
LABEL_26:
    id result = (void *)swift_release(v4);
    BOOL v28 = v31;
    uint64_t v29 = v35;
    goto LABEL_28;
  }

  char v26 = *(void *)(v32 + 8 * v27);
  if (v26)
  {
    uint64_t v11 = v27;
    goto LABEL_25;
  }

  while (1)
  {
    uint64_t v11 = v27 + 1;
    if (__OFADD__(v27, 1LL)) {
      break;
    }
    if (v11 >= v33) {
      goto LABEL_26;
    }
    char v26 = *(void *)(v32 + 8 * v11);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }

LABEL_28:
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

void *sub_10003A260(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1LL << *(_BYTE *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1LL << -(char)v7);
  }
  else {
    uint64_t v8 = -1LL;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0LL;
    uint64_t v10 = 0LL;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    _OWORD v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return (void *)v10;
  }

  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0LL;
    goto LABEL_38;
  }

  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }

  uint64_t v11 = a2;
  int64_t v12 = 0LL;
  uint64_t v13 = 0LL;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    unint64_t v20 = *(void **)(*(void *)(a4 + 56) + 8 * v16);
    void *v11 = v20;
    if (v13 == v10)
    {
      id v21 = v20;
      goto LABEL_38;
    }

    ++v11;
    id result = v20;
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1LL))
    {
      __break(1u);
      goto LABEL_40;
    }

    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }

  v12 += 2LL;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0LL;
    int64_t v12 = v17;
    goto LABEL_37;
  }

  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0LL;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }

  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }

  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0LL;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }

  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }

  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1LL)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0LL;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }

    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }

void *sub_10003A458(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v3 = sub_10002D164(&qword_100070AB8);
  uint64_t v4 = (void *)swift_allocObject(v3, 8 * v1 + 32, 7LL);
  int64_t v5 = j__malloc_size(v4);
  uint64_t v6 = v5 - 32;
  if (v5 < 32) {
    uint64_t v6 = v5 - 25;
  }
  v4[2] = v1;
  v4[3] = (2 * (v6 >> 3)) | 1;
  uint64_t v7 = sub_10003A260(&v10, v4 + 4, v1, a1);
  uint64_t v8 = v10;
  swift_bridgeObjectRetain(a1);
  sub_10003ABA4(v8);
  if (v7 != (void *)v1)
  {
    __break(1u);
    return &_swiftEmptyArrayStorage;
  }

  return v4;
}

void sub_10003A540(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void *)objc_opt_self(&OBJC_CLASS___IMDChatRegistry);
  id v5 = [v4 sharedInstance];
  NSString v6 = String._bridgeToObjectiveC()();
  Class isa = (Class)[v5 existingChatsWithPinningIdentifier:v6];

  if (!isa)
  {
    uint64_t v8 = sub_100032148(0LL, &qword_100070A98, &OBJC_CLASS___IMDChat_ptr);
    uint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(0LL, v8);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v9, v10);
  }

  id v11 = [v4 sharedInstance];
  id v12 = [v11 _chatInfoForChats:isa];

  uint64_t v13 = sub_10002D164(&qword_100070AA0);
  uint64_t v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v12, v13);

  Class v16 = Array._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, Class))(a3 + 16))(a3, v16);
  swift_bridgeObjectRelease(v14, v15);
}

void sub_10003A6AC(unint64_t a1, void (**a2)(void, void))
{
  uint64_t v3 = (void *)sub_100039C10((uint64_t)&_swiftEmptyArrayStorage, (uint64_t)a2);
  id v4 = [(id)objc_opt_self(IMDAccountController) sharedAccountController];
  if (!v4)
  {
LABEL_44:
    _Block_release(a2);
    __break(1u);
LABEL_45:
    _Block_release(a2);
    __break(1u);
LABEL_46:
    _Block_release(a2);
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
    __break(1u);
    return;
  }

  id v5 = v4;
  id v6 = [v4 accounts];

  if (!v6) {
    goto LABEL_45;
  }
  uint64_t v7 = sub_100032148(0LL, &qword_100070AA8, &OBJC_CLASS___IMDAccount_ptr);
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v6, v7);

  uint64_t v10 = *(char **)(a1 + 16);
  if (v10)
  {
    uint64_t v60 = *(void *)((v8 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    swift_bridgeObjectRetain(a1);
LABEL_6:
    id v12 = 0LL;
    unint64_t v54 = a1;
    unint64_t v55 = a1 + 32;
    uint64_t v57 = v8;
    unint64_t v58 = v8 & 0xC000000000000001LL;
    uint64_t v53 = v10;
    do
    {
      if (v12 == v10)
      {
LABEL_38:
        __break(1u);
LABEL_39:
        if (v8 < 0) {
          uint64_t v50 = v8;
        }
        else {
          uint64_t v50 = v8 & 0xFFFFFFFFFFFFFF8LL;
        }
        swift_bridgeObjectRetain(a1);
        swift_bridgeObjectRetain(v8);
        uint64_t v60 = _CocoaArrayWrapper.endIndex.getter(v50);
        swift_bridgeObjectRelease(v8, v51);
        goto LABEL_6;
      }

      if (v60)
      {
        uint64_t v56 = v12;
        uint64_t v14 = *(void **)(v55 + 16LL * (void)v12 + 8);
        id v59 = (id)objc_opt_self(&OBJC_CLASS___IMDChatRegistry);
        swift_bridgeObjectRetain(v8);
        id v61 = v14;
        swift_bridgeObjectRetain(v14);
        uint64_t v15 = 4LL;
        while (1)
        {
          if (v58) {
            id v17 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v15 - 4, v8);
          }
          else {
            id v17 = *(id *)(v8 + 8 * v15);
          }
          unint64_t v18 = v17;
          uint64_t v19 = v15 - 3;
          if (__OFADD__(v15 - 4, 1LL))
          {
            __break(1u);
LABEL_36:
            __break(1u);
LABEL_37:
            __break(1u);
            goto LABEL_38;
          }

          uint64_t v10 = (char *)[v59 sharedInstance];
          a1 = (unint64_t)String._bridgeToObjectiveC()();
          id v20 = [v10 existingChatForID:a1 account:v18];

          if (v20) {
            break;
          }

LABEL_13:
          ++v15;
          if (v19 == v60)
          {
            swift_bridgeObjectRelease(v61, v16);
            swift_bridgeObjectRelease(v8, v13);
            uint64_t v10 = v53;
            a1 = v54;
            id v12 = v56;
            goto LABEL_8;
          }
        }

        id v21 = [v20 guid];
        if (!v21)
        {
          _Block_release(a2);
          __break(1u);
          goto LABEL_44;
        }

        unint64_t v23 = v21;
        uint64_t v10 = (char *)static String._unconditionallyBridgeFromObjectiveC(_:)(v21, v22);
        uint64_t v25 = v24;

        id v26 = v20;
        uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v3);
        a1 = sub_100034070((uint64_t)v10, v25);
        uint64_t v29 = v3[2];
        BOOL v30 = (v28 & 1) == 0;
        uint64_t v31 = v29 + v30;
        if (__OFADD__(v29, v30)) {
          goto LABEL_36;
        }
        uint64_t v8 = v28;
        if (v3[3] >= v31)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) != 0)
          {
            if ((v28 & 1) == 0) {
              goto LABEL_29;
            }
          }

          else
          {
            sub_10003A0B0();
            if ((v8 & 1) == 0) {
              goto LABEL_29;
            }
          }
        }

        else
        {
          sub_100039DA4(v31, isUniquelyReferenced_nonNull_native);
          unint64_t v32 = sub_100034070((uint64_t)v10, v25);
          if ((v8 & 1) != (v33 & 1)) {
            goto LABEL_46;
          }
          a1 = v32;
          if ((v8 & 1) == 0)
          {
LABEL_29:
            v3[(a1 >> 6) + 8] |= 1LL << a1;
            id v34 = (void *)(v3[6] + 16 * a1);
            void *v34 = v10;
            v34[1] = v25;
            *(void *)(v3[7] + 8 * a1) = v26;
            uint64_t v35 = v3[2];
            BOOL v36 = __OFADD__(v35, 1LL);
            uint64_t v37 = v35 + 1;
            if (v36) {
              goto LABEL_37;
            }
            _OWORD v3[2] = v37;
            swift_bridgeObjectRetain(v25);
            goto LABEL_31;
          }
        }

        uint64_t v10 = (char *)v3[7];
        a1 *= 8LL;

        *(void *)&v10[a1] = v26;
LABEL_31:

        swift_bridgeObjectRelease(v25, v38);
        swift_bridgeObjectRelease(0x8000000000000000LL, v39);
        uint64_t v8 = v57;
        goto LABEL_13;
      }

uint64_t sub_10003ABA4(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t IMDaemonAccountsRequestHandler.requiredCapabilities.getter()
{
  return 512LL;
}

unint64_t sub_10003ABB4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
    id v5 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_10002D164(&qword_100070B28);
  uint64_t v4 = static _DictionaryStorage.allocate(capacity:)(v3);
  id v5 = (void *)v4;
  uint64_t v6 = *(void *)(a1 + 16);
  if (!v6)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1, a2);
    return (unint64_t)v5;
  }

  swift_retain(v4);
  uint64_t v7 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v8 = (uint64_t)*(v7 - 2);
    uint64_t v9 = (uint64_t)*(v7 - 1);
    uint64_t v10 = *v7;
    swift_bridgeObjectRetain(v9);
    id v11 = v10;
    unint64_t result = sub_100034070(v8, v9);
    if ((v13 & 1) != 0) {
      break;
    }
    *(void *)((char *)v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v14 = (uint64_t *)(v5[6] + 16 * result);
    *uint64_t v14 = v8;
    v14[1] = v9;
    *(void *)(v5[7] + 8 * result) = v11;
    uint64_t v15 = v5[2];
    BOOL v16 = __OFADD__(v15, 1LL);
    uint64_t v17 = v15 + 1;
    if (v16) {
      goto LABEL_11;
    }
    _OWORD v5[2] = v17;
    v7 += 3;
    if (!--v6)
    {
      swift_release(v5);
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

void IMDaemonAccountsRequestHandler.calculateReachability(with:responseHandler:)(void *a1, void *a2)
{
  uint64_t v5 = type metadata accessor for Logger(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v91 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v9 = [(id)objc_opt_self(IMDAccountController) sharedAccountController];
  if (!v9) {
    goto LABEL_29;
  }
  uint64_t v10 = v9;
  NSString v12 = [a1 accountID];
  if (!v12)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0LL, v11);
    uint64_t v14 = v13;
    NSString v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v14, v15);
  }

  id v16 = [v10 accountForAccountID:v12];

  if (v16)
  {
    id v17 = [v16 session];

    if (v17)
    {
      uint64_t v18 = sub_10002D2A8();
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v18, v5);
      id v19 = a1;
      id v20 = v2;
      id v21 = v19;
      id v22 = v20;
      unint64_t v23 = (os_log_s *)Logger.logObject.getter(v22);
      os_log_type_t v24 = static os_log_type_t.info.getter();
      int v25 = v24;
      if (os_log_type_enabled(v23, v24))
      {
        uint64_t v26 = swift_slowAlloc(32LL, -1LL);
        id v93 = v22;
        uint64_t v27 = v26;
        uint64_t v96 = swift_slowAlloc(96LL, -1LL);
        v100 = (void *)v96;
        *(_DWORD *)uint64_t v27 = 136315650;
        LODWORD(v95) = v25;
        id v28 = [v21 requestID];
        os_log_t v94 = v23;
        id v29 = v28;
        uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28, v30);
        v97 = a2;
        unint64_t v33 = v32;

        uint64_t v99 = sub_10002F0C4(v31, v33, (uint64_t *)&v100);
        uint64_t v92 = (uint64_t *)&v100;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v99, &v100, v27 + 4, v27 + 12);

        swift_bridgeObjectRelease(v33, v34);
        *(_WORD *)(v27 + 12) = 2080;
        id v35 = [v21 serviceName];
        uint64_t v37 = static String._unconditionallyBridgeFromObjectiveC(_:)(v35, v36);
        id v98 = v17;
        unint64_t v39 = v38;

        uint64_t v99 = sub_10002F0C4(v37, v39, (uint64_t *)&v100);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v99, &v100, v27 + 14, v27 + 22);

        swift_bridgeObjectRelease(v39, v40);
        *(_WORD *)(v27 + 22) = 2080;
        sub_100032148(0LL, &qword_100070570, off_100064A48);
        sub_10003B94C();
        uint64_t v41 = v93;
        uint64_t v42 = ClientRequestHandling<>.client.getter();
        uint64_t v43 = ClientConnection.id.getter();
        unint64_t v45 = v44;
        swift_release(v42);
        uint64_t v46 = v43;
        a2 = v97;
        uint64_t v99 = sub_10002F0C4(v46, v45, (uint64_t *)&v100);
        id v17 = v98;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v99, v92, v27 + 24, v27 + 32);

        swift_bridgeObjectRelease(v45, v47);
        os_log_t v48 = v94;
        _os_log_impl( (void *)&_mh_execute_header,  v94,  (os_log_type_t)v95,  "Initiating reachability query for %s on service %s for %s",  (uint8_t *)v27,  0x20u);
        uint64_t v49 = v96;
        swift_arrayDestroy(v96, 3LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v49, -1LL, -1LL);
        swift_slowDealloc(v27, -1LL, -1LL);
      }

      else
      {
      }

      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      [v17 calculateReachabilityWithRequest:v21 responseHandler:a2];

      return;
    }
  }

  id v50 = [a1 handleIDs];
  uint64_t v51 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v50, &type metadata for String);

  id v52 = [a1 serviceName];
  id v98 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(v52, v53);
  uint64_t v55 = v54;

  uint64_t v57 = (void *)sub_10003ABB4((uint64_t)&_swiftEmptyArrayStorage, v56);
  uint64_t v58 = *(void *)(v51 + 16);
  if (!v58)
  {
LABEL_24:
    id v84 = objc_allocWithZone(&OBJC_CLASS___IMServiceReachabilityResult);
    swift_bridgeObjectRetain(v55);
    NSString v85 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v55, v86);
    sub_100032148(0LL, &qword_100070AC0, &OBJC_CLASS___IMServiceReachabilityHandleResult_ptr);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v57, v88);
    id v98 = [v84 initWithService:v85 error:2 handleResults:isa isFinal:0 allAreReachable:0 didCheckServer:0];
    swift_bridgeObjectRelease(v51, v89);
    swift_bridgeObjectRelease(v55, v90);

    [a2 reachabilityRequest:a1 updatedWithResult:v98];
    return;
  }

  uint64_t v96 = (uint64_t)a1;
  v97 = a2;
  swift_bridgeObjectRetain(v51);
  uint64_t v95 = v51;
  id v59 = (uint64_t *)(v51 + 40);
  while (1)
  {
    uint64_t v64 = *(v59 - 1);
    uint64_t v63 = *v59;
    id v65 = objc_allocWithZone(&OBJC_CLASS___IMServiceReachabilityHandleResult);
    swift_bridgeObjectRetain(v55);
    swift_bridgeObjectRetain(v63);
    NSString v66 = String._bridgeToObjectiveC()();
    NSString v67 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v55, v68);
    id v69 = [v65 initWithHandleID:v66 service:v67 isReachable:0];

    swift_bridgeObjectRetain(v63);
    id v70 = v69;
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v57);
    v100 = v57;
    unint64_t v73 = sub_100034070(v64, v63);
    uint64_t v74 = v57[2];
    BOOL v75 = (v72 & 1) == 0;
    uint64_t v76 = v74 + v75;
    if (__OFADD__(v74, v75)) {
      break;
    }
    char v77 = v72;
    if (v57[3] >= v76)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        uint64_t v57 = v100;
        if ((v72 & 1) != 0) {
          goto LABEL_10;
        }
      }

      else
      {
        sub_10003B79C();
        uint64_t v57 = v100;
        if ((v77 & 1) != 0) {
          goto LABEL_10;
        }
      }
    }

    else
    {
      sub_10003B490(v76, isUniquelyReferenced_nonNull_native);
      unint64_t v78 = sub_100034070(v64, v63);
      if ((v77 & 1) != (v79 & 1)) {
        goto LABEL_30;
      }
      unint64_t v73 = v78;
      uint64_t v57 = v100;
      if ((v77 & 1) != 0)
      {
LABEL_10:
        uint64_t v60 = v57[7];

        *(void *)(v60 + 8 * v73) = v70;
        goto LABEL_11;
      }
    }

    v57[(v73 >> 6) + 8] |= 1LL << v73;
    id v80 = (uint64_t *)(v57[6] + 16 * v73);
    *id v80 = v64;
    v80[1] = v63;
    *(void *)(v57[7] + 8 * v73) = v70;
    uint64_t v81 = v57[2];
    BOOL v82 = __OFADD__(v81, 1LL);
    uint64_t v83 = v81 + 1;
    if (v82) {
      goto LABEL_28;
    }
    v57[2] = v83;
    swift_bridgeObjectRetain(v63);
LABEL_11:
    v59 += 2;

    swift_bridgeObjectRelease_n(v63, 2LL);
    swift_bridgeObjectRelease(0x8000000000000000LL, v61);
    if (!--v58)
    {
      uint64_t v51 = v95;
      swift_bridgeObjectRelease(v95, v62);
      a1 = (void *)v96;
      a2 = v97;
      goto LABEL_24;
    }
  }

  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
}

Swift::Int sub_10003B490(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_10002D164(&qword_100070B28);
  char v39 = a2;
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v8 = v7;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_43;
  }
  uint64_t v9 = 1LL << *(_BYTE *)(v5 + 32);
  uint64_t v38 = v5 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1LL << v9);
  }
  else {
    uint64_t v10 = -1LL;
  }
  unint64_t v11 = v10 & *(void *)(v5 + 64);
  uint64_t v36 = v3;
  int64_t v37 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  Swift::Int result = swift_retain(v5);
  int64_t v14 = 0LL;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_34;
    }

    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1LL))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }

    if (v22 >= v37) {
      break;
    }
    unint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v37) {
        goto LABEL_36;
      }
      unint64_t v24 = *(void *)(v38 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_36:
          swift_release(v5);
          uint64_t v3 = v36;
          if ((v39 & 1) == 0) {
            goto LABEL_43;
          }
          goto LABEL_39;
        }

        unint64_t v24 = *(void *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1LL)) {
              goto LABEL_45;
            }
            if (v14 >= v37) {
              goto LABEL_36;
            }
            unint64_t v24 = *(void *)(v38 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_33;
            }
          }
        }

        int64_t v14 = v25;
      }
    }

id sub_10003B79C()
{
  uint64_t v1 = v0;
  sub_10002D164(&qword_100070B28);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release(v2);
    *uint64_t v1 = v4;
    return result;
  }

  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }

    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }

unint64_t sub_10003B94C()
{
  unint64_t result = qword_100070578;
  if (!qword_100070578)
  {
    uint64_t v1 = sub_100032148(255LL, &qword_100070570, off_100064A48);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for IMDaemonAccountsRequestHandler, v1);
    atomic_store(result, (unint64_t *)&qword_100070578);
  }

  return result;
}

uint64_t IMDaemonChatRequestHandler.requiredCapabilities.getter()
{
  return 4LL;
}

void _sSo26IMDaemonChatRequestHandlerC7imagentE012closeSessionB2ID_10identifier21didDeleteConversation5style7accountySS_SSSbSo11IMChatStyleVSStF_0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, unint64_t a8)
{
  int v29 = a5;
  LODWORD(v30) = a6;
  uint64_t v10 = (void *)type metadata accessor for Logger(0LL);
  uint64_t v27 = *(v10 - 1);
  id v28 = v10;
  __chkstk_darwin(v10);
  unint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v13 = [(id)objc_opt_self(IMDAccountController) sharedInstance];
  if (v13)
  {
    unint64_t v14 = v13;
    NSString v15 = String._bridgeToObjectiveC()();
    id v16 = [v14 sessionForAccount:v15];

    if (v16)
    {
      NSString v17 = String._bridgeToObjectiveC()();
      id v28 = String._bridgeToObjectiveC()();
      [v16 closeSessionChatID:v17 identifier:v28 didDeleteConversation:v29 & 1 style:v30];
    }

    else
    {
      uint64_t v30 = a7;
      uint64_t v18 = sub_10002D380();
      uint64_t v20 = v27;
      id v19 = v28;
      unint64_t v21 = v12;
      (*(void (**)(char *, uint64_t, id))(v27 + 16))(v12, v18, v28);
      uint64_t v22 = swift_bridgeObjectRetain_n(a8, 2LL);
      unint64_t v23 = (os_log_s *)Logger.logObject.getter(v22);
      os_log_type_t v24 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v23, v24))
      {
        int64_t v25 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v26 = swift_slowAlloc(32LL, -1LL);
        uint64_t v32 = v26;
        *(_DWORD *)int64_t v25 = 136315138;
        swift_bridgeObjectRetain(a8);
        uint64_t v31 = sub_10002F0C4(v30, a8, &v32);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, &v32, v25 + 4, v25 + 12);
        swift_bridgeObjectRelease_n(a8, 3LL);
        _os_log_impl( (void *)&_mh_execute_header,  v23,  v24,  "No session for account: %s -- can't close session.",  v25,  0xCu);
        swift_arrayDestroy(v26, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v26, -1LL, -1LL);
        swift_slowDealloc(v25, -1LL, -1LL);
      }

      else
      {

        swift_bridgeObjectRelease_n(a8, 2LL);
      }

      (*(void (**)(char *, id))(v20 + 8))(v21, v19);
    }
  }

  else
  {
    __break(1u);
  }

uint64_t IMDaemonChatSendMessageRequestHandler.requiredCapabilities.getter()
{
  return 4100LL;
}

uint64_t IMDaemonVCInvitationsAVObserverRequestHandler.requiredCapabilities.getter()
{
  return 1048640LL;
}

void IMDaemonAnyRequestHandler.requestSetup(withClientID:capabilities:context:reply:)( uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t), uint64_t a6)
{
  unint64_t v7 = v6;
  uint64_t v58 = a5;
  uint64_t v13 = type metadata accessor for Logger(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  id v16 = (char *)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = sub_10002D2A8();
  uint64_t v57 = v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v17, v13);
  swift_bridgeObjectRetain_n(a2, 2LL);
  uint64_t v18 = swift_bridgeObjectRetain_n(a4, 2LL);
  id v19 = (os_log_s *)Logger.logObject.getter(v18);
  os_log_type_t v20 = static os_log_type_t.info.getter();
  int v56 = v20;
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = swift_slowAlloc(32LL, -1LL);
    uint64_t v51 = v13;
    uint64_t v22 = v21;
    uint64_t v50 = swift_slowAlloc(96LL, -1LL);
    uint64_t v60 = v50;
    *(_DWORD *)uint64_t v22 = 136315650;
    uint64_t v54 = v7;
    swift_bridgeObjectRetain(a2);
    uint64_t v59 = sub_10002F0C4(a1, a2, &v60);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &v60, v22 + 4, v22 + 12);
    swift_bridgeObjectRelease_n(a2, 3LL);
    *(_WORD *)(v22 + 12) = 2080;
    id v23 = (id)IMStringFromClientCapabilities(a3);
    uint64_t v55 = a6;
    id v24 = v23;
    uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23, v25);
    uint64_t v52 = a3;
    uint64_t v53 = a1;
    uint64_t v27 = v26;
    unint64_t v29 = v28;

    uint64_t v59 = sub_10002F0C4(v27, v29, &v60);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &v60, v22 + 14, v22 + 22);
    swift_bridgeObjectRelease(v29, v30);
    *(_WORD *)(v22 + 22) = 2080;
    uint64_t v31 = swift_bridgeObjectRetain(a4);
    uint64_t v32 = Dictionary.description.getter( v31,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
    unint64_t v34 = v33;
    swift_bridgeObjectRelease(a4, v33);
    uint64_t v35 = v32;
    unint64_t v7 = v54;
    uint64_t v59 = sub_10002F0C4(v35, v34, &v60);
    a1 = v53;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &v60, v22 + 24, v22 + 32);
    swift_bridgeObjectRelease_n(a4, 2LL);
    unint64_t v36 = v34;
    a3 = v52;
    swift_bridgeObjectRelease(v36, v37);
    _os_log_impl( (void *)&_mh_execute_header,  v19,  (os_log_type_t)v56,  "Preparing setup info for %s with %s and context %s",  (uint8_t *)v22,  0x20u);
    uint64_t v38 = v50;
    swift_arrayDestroy(v50, 3LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v38, -1LL, -1LL);
    swift_slowDealloc(v22, -1LL, -1LL);

    (*(void (**)(char *, uint64_t))(v57 + 8))(v16, v51);
  }

  else
  {

    swift_bridgeObjectRelease_n(a4, 2LL);
    swift_bridgeObjectRelease_n(a2, 2LL);
    (*(void (**)(char *, uint64_t))(v57 + 8))(v16, v13);
  }

  char v39 = (id *)sub_100034C20();
  uint64_t v40 = *(uint64_t (**)(void))((swift_isaMask & *(void *)*v39) + 0xB8LL);
  id v41 = *v39;
  LOBYTE(v40) = v40();

  else {
    uint64_t v42 = a3 & 0x1842F8;
  }
  sub_10003C654();
  sub_10003C690();
  uint64_t v43 = ClientRequestHandling<>.client.getter();
  ClientConnection.set(id:capabilities:)(a1, a2, v42);
  swift_release(v43);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  id v45 = [v7 _setupInfoForCapabilities:v42 context:isa];

  uint64_t v46 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v45,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  v58(1LL, v46);
  swift_bridgeObjectRelease(v46, v47);
  id v48 = [(id)objc_opt_self(IMDCKUtilities) sharedInstance];
  [v48 broadcastCloudKitStateAfterFetchingAccountStatus];
}

void IMDaemonAnyRequestHandler.requestSetupXPCObject(withClientID:capabilities:context:reply:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  NSString v10 = String._bridgeToObjectiveC()();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  uint64_t v12 = swift_allocObject(&unk_100066850, 32LL, 7LL);
  *(void *)(v12 + 16) = a5;
  *(void *)(v12 + 24) = a6;
  v15[4] = sub_10003C6FC;
  uint64_t v16 = v12;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 1107296256LL;
  v15[2] = sub_10003C430;
  v15[3] = &unk_100066868;
  uint64_t v13 = _Block_copy(v15);
  uint64_t v14 = v16;
  swift_retain(a6);
  swift_release(v14);
  [v6 requestSetupWithClientID:v10 capabilities:a3 context:isa reply:v13];
  _Block_release(v13);
}

void sub_10003C378(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, id))
{
  id v6 = objc_allocWithZone(&OBJC_CLASS___IMXPCDictionary);
  swift_bridgeObjectRetain(a2);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a2, v8);
  id v9 = [v6 initWithDictionary:isa key:"setupInfo"];

  a3(a1, v9);
}

uint64_t sub_10003C430(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  swift_retain(v4);
  v5(a2, v6);
  swift_release(v4);
  return swift_bridgeObjectRelease(v6, v7);
}

unint64_t sub_10003C654()
{
  unint64_t result = qword_100070580;
  if (!qword_100070580)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___IMDaemonAnyRequestHandler);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100070580);
  }

  return result;
}

unint64_t sub_10003C690()
{
  unint64_t result = qword_100070588;
  if (!qword_100070588)
  {
    unint64_t v1 = sub_10003C654();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for IMDaemonAnyRequestHandler, v1);
    atomic_store(result, (unint64_t *)&qword_100070588);
  }

  return result;
}

uint64_t sub_10003C6D8()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

void sub_10003C6FC(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_10003C704(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10003C714(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_10003C71C()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_10003C740(char a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(v2 + 16) + 16LL))( *(void *)(v2 + 16),  a1 & 1,  a2);
}

void sub_10003C758(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v12 = type metadata accessor for Logger(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = sub_10002D2A8();
  uint64_t v55 = v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v16, v12);
  swift_bridgeObjectRetain_n(a2, 2LL);
  uint64_t v17 = swift_bridgeObjectRetain_n(a4, 2LL);
  uint64_t v18 = (os_log_s *)Logger.logObject.getter(v17);
  os_log_type_t v19 = static os_log_type_t.info.getter();
  int v54 = v19;
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc(32LL, -1LL);
    uint64_t v49 = swift_slowAlloc(96LL, -1LL);
    uint64_t v57 = v49;
    *(_DWORD *)uint64_t v20 = 136315650;
    uint64_t v52 = a5;
    swift_bridgeObjectRetain(a2);
    uint64_t v56 = sub_10002F0C4(a1, a2, &v57);
    uint64_t v51 = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v56, &v57, v20 + 4, v20 + 12);
    swift_bridgeObjectRelease_n(a2, 3LL);
    *(_WORD *)(v20 + 12) = 2080;
    id v21 = (id)IMStringFromClientCapabilities(a3);
    uint64_t v53 = a6;
    id v22 = v21;
    uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21, v23);
    uint64_t v48 = v12;
    uint64_t v25 = v24;
    uint64_t v50 = a3;
    unint64_t v27 = v26;

    uint64_t v56 = sub_10002F0C4(v25, v27, &v57);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v56, &v57, v20 + 14, v20 + 22);
    swift_bridgeObjectRelease(v27, v28);
    *(_WORD *)(v20 + 22) = 2080;
    uint64_t v29 = swift_bridgeObjectRetain(a4);
    uint64_t v30 = Dictionary.description.getter( v29,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
    unint64_t v32 = v31;
    swift_bridgeObjectRelease(a4, v31);
    uint64_t v33 = v30;
    a5 = v52;
    uint64_t v56 = sub_10002F0C4(v33, v32, &v57);
    a1 = v51;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v56, &v57, v20 + 24, v20 + 32);
    swift_bridgeObjectRelease_n(a4, 2LL);
    unint64_t v34 = v32;
    a3 = v50;
    swift_bridgeObjectRelease(v34, v35);
    _os_log_impl( (void *)&_mh_execute_header,  v18,  (os_log_type_t)v54,  "Preparing setup info for %s with %s and context %s",  (uint8_t *)v20,  0x20u);
    uint64_t v36 = v49;
    a6 = v53;
    swift_arrayDestroy(v49, 3LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v36, -1LL, -1LL);
    swift_slowDealloc(v20, -1LL, -1LL);

    (*(void (**)(char *, uint64_t))(v55 + 8))(v15, v48);
  }

  else
  {

    swift_bridgeObjectRelease_n(a4, 2LL);
    swift_bridgeObjectRelease_n(a2, 2LL);
    (*(void (**)(char *, uint64_t))(v55 + 8))(v15, v12);
  }

  uint64_t v37 = (id *)sub_100034C20();
  uint64_t v38 = *(uint64_t (**)(void))((swift_isaMask & *(void *)*v37) + 0xB8LL);
  id v39 = *v37;
  LOBYTE(v3_Block_object_dispose(va, 8) = v38();

  else {
    uint64_t v40 = a3 & 0x1842F8;
  }
  sub_10003C654();
  sub_10003C690();
  uint64_t v41 = ClientRequestHandling<>.client.getter();
  ClientConnection.set(id:capabilities:)(a1, a2, v40);
  swift_release(v41);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  id v43 = [a5 _setupInfoForCapabilities:v40 context:isa];

  uint64_t v44 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v43,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  Class v45 = Dictionary._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, uint64_t, Class))(a6 + 16))(a6, 1LL, v45);
  swift_bridgeObjectRelease(v44, v46);

  id v47 = [(id)objc_opt_self(IMDCKUtilities) sharedInstance];
  [v47 broadcastCloudKitStateAfterFetchingAccountStatus];
}

uint64_t type metadata accessor for PipelineLoader()
{
  return objc_opt_self(&OBJC_CLASS____TtC7imagent14PipelineLoader);
}

uint64_t sub_10003CC04()
{
  uint64_t v1 = type metadata accessor for Logger(0LL);
  v0[2] = v1;
  uint64_t v2 = *(void *)(v1 - 8);
  v0[3] = v2;
  v0[4] = swift_task_alloc((*(void *)(v2 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for DaemonWorkActor(0LL);
  v0[5] = static DaemonWorkActor.shared.getter(v3);
  uint64_t v4 = type metadata accessor for MainActor(0LL);
  uint64_t v5 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  return swift_task_switch(sub_10003CC94, v5, v6);
}

uint64_t sub_10003CC94()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  swift_release(*(void *)(v0 + 40));
  uint64_t v4 = sub_10002D2A8();
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Loading services", v8, 2u);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  uint64_t v10 = *(void *)(v0 + 24);
  uint64_t v9 = *(void *)(v0 + 32);
  uint64_t v11 = *(void *)(v0 + 16);

  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  NSString v12 = String._bridgeToObjectiveC()();
  id v13 = (id)IMPathsForPlugInsWithExtension();

  if (v13)
  {
    uint64_t v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v13, (char *)&type metadata for Any + 8);

    uint64_t v15 = sub_10003CEB8(v14);
    swift_bridgeObjectRelease(v14, v16);
    if (v15)
    {
      uint64_t v18 = v15[2];
      if (v18)
      {
        os_log_type_t v19 = v15 + 5;
        do
        {
          uint64_t v20 = *v19;
          id v21 = objc_allocWithZone(&OBJC_CLASS___NSBundle);
          swift_bridgeObjectRetain(v20);
          NSString v22 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(v20, v23);
          id v24 = [v21 initWithPath:v22];

          if (v24)
          {
            id v25 = [(id)objc_opt_self(IMDServiceController) sharedController];
            [v25 registerSessionClassWithBundle:v24];
          }

          v19 += 2;
          --v18;
        }

        while (v18);
      }

      swift_bridgeObjectRelease(v15, v17);
    }
  }

  swift_task_dealloc(*(void *)(v0 + 32));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void *sub_10003CEB8(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v15 = &_swiftEmptyArrayStorage;
  sub_10003D01C(0, v2, 0);
  uint64_t v3 = &_swiftEmptyArrayStorage;
  if (v2)
  {
    for (uint64_t i = a1 + 32; ; i += 32LL)
    {
      sub_10002FDD4(i, (uint64_t)v14);
      if (!swift_dynamicCast( &v12,  v14,  (char *)&type metadata for Any + 8,  &type metadata for String,  6LL)) {
        break;
      }
      uint64_t v5 = v12;
      uint64_t v6 = v13;
      if ((swift_isUniquelyReferenced_nonNull_native(v3) & 1) == 0)
      {
        sub_10003D01C(0, v3[2] + 1LL, 1);
        uint64_t v3 = v15;
      }

      unint64_t v8 = v3[2];
      unint64_t v7 = v3[3];
      if (v8 >= v7 >> 1)
      {
        sub_10003D01C(v7 > 1, v8 + 1, 1);
        uint64_t v3 = v15;
      }

      _OWORD v3[2] = v8 + 1;
      uint64_t v9 = (char *)&v3[2 * v8];
      *((void *)v9 + 4) = v5;
      *((void *)v9 + 5) = v6;
      if (!--v2) {
        return v3;
      }
    }

    uint64_t v12 = 0LL;
    uint64_t v13 = 0LL;
    swift_release(v3);
    swift_bridgeObjectRelease(v13, v10);
    return 0LL;
  }

  return v3;
}

uint64_t type metadata accessor for ServiceLoader()
{
  return objc_opt_self(&OBJC_CLASS____TtC7imagent13ServiceLoader);
}

uint64_t sub_10003D01C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10003D038(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10003D038(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_32;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_10002D164(&qword_100070E58);
    uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 4);
  }

  else
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v14 = v11 + 32;
  uint64_t v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8]) {
      memmove(v14, v15, 16 * v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v15 >= &v14[16 * v8] || v14 >= &v15[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t IMDaemonFileProviderRequestHandler.requiredCapabilities.getter()
{
  return 0x10000000LL;
}

uint64_t IMDaemonChatRequestHandler.unreadCount(completion:)(uint64_t (*a1)(id))
{
  id v2 = [(id)objc_opt_self(IMDMessageStore) sharedInstance];
  id v3 = [v2 unreadMessagesCount];

  return a1(v3);
}

uint64_t sub_10003D2B8()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_10002D4C0(v0, qword_100071F08);
  sub_10002D2C4(v0, (uint64_t)qword_100071F08);
  uint64_t v1 = static Logger.messagesSubsystem.getter();
  return Logger.init(subsystem:category:)(v1);
}

uint64_t IMDaemonChatMessageHistoryRequestHandler.requiredCapabilities.getter()
{
  return 8196LL;
}

uint64_t IMDaemonChatMessageHistoryRequestHandler.fetchEarliestMessageDateForChats(withGUIDs:completion:)( uint64_t a1, void (*a2)(void))
{
  uint64_t v4 = swift_allocObject(&unk_1000669A0, 24LL, 7LL);
  *(void *)(v4 + 16) = &_swiftEmptyDictionarySingleton;
  uint64_t v5 = v4 + 16;
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6)
  {
    uint64_t v32 = v4 + 16;
    unint64_t v34 = a2;
    id v37 = (id)objc_opt_self(&OBJC_CLASS___IMDDatabase);
    uint64_t v36 = IMMessagePropertyDate;
    swift_bridgeObjectRetain(a1);
    uint64_t v33 = a1;
    uint64_t v8 = (uint64_t *)(a1 + 40);
    uint64_t v35 = v4;
    do
    {
      uint64_t v9 = *(v8 - 1);
      uint64_t v10 = *v8;
      static String._unconditionallyBridgeFromObjectiveC(_:)(v36, v7);
      uint64_t v12 = v11;
      id v13 = objc_allocWithZone(&OBJC_CLASS___NSSortDescriptor);
      swift_bridgeObjectRetain(v10);
      NSString v14 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v12, v15);
      id v16 = [v13 initWithKey:v14 ascending:1];

      id v17 = [v37 synchronousDatabase];
      NSString v18 = String._bridgeToObjectiveC()();
      uint64_t v19 = sub_10002D164(&qword_100070AB8);
      uint64_t v20 = swift_allocObject(v19, 40LL, 7LL);
      *(_OWORD *)(v20 + 16) = xmmword_10004B090;
      *(void *)(v20 + 32) = v16;
      aBlock[0] = v20;
      specialized Array._endMutation()();
      uint64_t v21 = aBlock[0];
      uint64_t v4 = v35;
      sub_100032148(0LL, &qword_100070EC0, &OBJC_CLASS___NSSortDescriptor_ptr);
      id v22 = v16;
      Class isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v21, v24);
      id v25 = (void *)swift_allocObject(&unk_1000669C8, 40LL, 7LL);
      v25[2] = v35;
      v25[3] = v9;
      v25[4] = v10;
      aBlock[4] = sub_100040754;
      id v39 = v25;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256LL;
      aBlock[2] = sub_10003D94C;
      aBlock[3] = &unk_1000669E0;
      unint64_t v26 = _Block_copy(aBlock);
      unint64_t v27 = v39;
      swift_retain(v35);
      swift_release(v27);
      [v17 fetchMessageRecordsForChatRecordWithGUID:v18 filteredUsingPredicate:0 sortedUsingDescriptors:isa limit:1 completionHandler:v26];
      _Block_release(v26);

      swift_unknownObjectRelease(v17);
      v8 += 2;
      --v6;
    }

    while (v6);
    swift_bridgeObjectRelease(v33, v7);
    a2 = v34;
    uint64_t v5 = v32;
  }

  swift_beginAccess(v5, aBlock, 0LL, 0LL);
  uint64_t v28 = *(void *)(v4 + 16);
  uint64_t v29 = swift_bridgeObjectRetain(v28);
  a2(v29);
  swift_release(v4);
  return swift_bridgeObjectRelease(v28, v30);
}

uint64_t sub_10003D604(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_10002D164(&qword_100070F38);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v11 = &v25[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  __chkstk_darwin(v9);
  id v13 = &v25[-v12 - 8];
  if (!((unint64_t)a1 >> 62))
  {
    uint64_t v14 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    uint64_t result = swift_bridgeObjectRetain(a1);
    if (v14) {
      goto LABEL_3;
    }
LABEL_11:
    swift_bridgeObjectRelease(a1, v16);
    uint64_t v23 = type metadata accessor for Date(0LL);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56LL))(v13, 1LL, 1LL, v23);
    goto LABEL_12;
  }

  if (a1 < 0) {
    uint64_t v22 = a1;
  }
  else {
    uint64_t v22 = a1 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(a1);
  uint64_t result = _CocoaArrayWrapper.endIndex.getter(v22);
  if (!result) {
    goto LABEL_11;
  }
LABEL_3:
  if ((a1 & 0xC000000000000001LL) != 0)
  {
    id v17 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, a1);
    goto LABEL_6;
  }

  if (*(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10))
  {
    id v17 = *(id *)(a1 + 32);
LABEL_6:
    uint64_t v19 = v17;
    swift_bridgeObjectRelease(a1, v18);
    id v20 = [v19 date];

    static Date._unconditionallyBridgeFromObjectiveC(_:)(v20);
    uint64_t v21 = type metadata accessor for Date(0LL);
    (*(void (**)(_BYTE *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56LL))(v13, 0LL, 1LL, v21);
LABEL_12:
    sub_100042380((uint64_t)v13, (uint64_t)v11);
    swift_beginAccess(a2 + 16, v25, 33LL, 0LL);
    swift_bridgeObjectRetain(a4);
    sub_10003D7E8((uint64_t)v11, a3, a4);
    swift_endAccess(v25);
    return sub_1000423C8((uint64_t)v13);
  }

  __break(1u);
  return result;
}

uint64_t sub_10003D7E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_10002D164(&qword_100070F38);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for Date(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(a1, 1LL, v11) == 1)
  {
    sub_1000423C8(a1);
    sub_10003F134(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease(a3, v15);
    return sub_1000423C8((uint64_t)v10);
  }

  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v14, a1, v11);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v4);
    uint64_t v22 = *v4;
    void *v4 = 0x8000000000000000LL;
    sub_10003F7C8((uint64_t)v14, a2, a3, isUniquelyReferenced_nonNull_native);
    uint64_t v18 = *v4;
    void *v4 = v22;
    swift_bridgeObjectRelease(a3, v19);
    return swift_bridgeObjectRelease(v18, v20);
  }

uint64_t sub_10003D94C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v5 = sub_100032148(0LL, &qword_100070F30, &OBJC_CLASS___IMDMessageRecord_ptr);
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a2, v5);
  swift_retain(v3);
  v4(v6);
  swift_release(v3);
  return swift_bridgeObjectRelease(v6, v7);
}

uint64_t sub_10003DA44( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  uint64_t v10 = v9;
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4, v9);
  uint64_t v13 = v12;
  id v14 = a1;
  a5(v8, v10, v11, v13);

  swift_bridgeObjectRelease(v10, v15);
  return swift_bridgeObjectRelease(v13, v16);
}

void IMDaemonChatMessageHistoryRequestHandler.updatePluginMessage(withGUID:newPayloadData:completion:)( uint64_t a1, char *a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t), uint64_t a6)
{
  uint64_t v154 = a3;
  uint64_t v155 = a4;
  v164 = a2;
  uint64_t v9 = type metadata accessor for Logger(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  v160 = (void (*)(uint64_t, uint64_t))((char *)&v148 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v157 = (uint64_t)&v148 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  __int128 v152 = (char *)&v148 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v148 - v18;
  uint64_t v20 = __chkstk_darwin(v17);
  __int128 v153 = (char *)&v148 - v21;
  uint64_t v22 = __chkstk_darwin(v20);
  __int128 v159 = (char *)&v148 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  __int128 v158 = (char **)((char *)&v148 - v25);
  uint64_t v26 = __chkstk_darwin(v24);
  v161 = (char *)&v148 - v27;
  __chkstk_darwin(v26);
  uint64_t v29 = (char *)&v148 - v28;
  uint64_t v30 = sub_10002D400();
  unint64_t v31 = *(uint64_t (**)(void))(v10 + 16);
  uint64_t v165 = (void *)v30;
  __int16 v166 = (void (*)(uint64_t, void *, uint64_t))v31;
  uint64_t v32 = v31(v29);
  uint64_t v33 = (os_log_s *)Logger.logObject.getter(v32);
  os_log_type_t v34 = static os_log_type_t.info.getter();
  BOOL v35 = os_log_type_enabled(v33, v34);
  uint64_t v162 = a6;
  v163 = a5;
  __int128 v156 = v19;
  if (v35)
  {
    uint64_t v36 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v37 = a1;
    uint64_t v38 = swift_slowAlloc(32LL, -1LL);
    v168[0] = v38;
    *(_DWORD *)uint64_t v36 = 136315138;
    id v167 = (char *)sub_10002F0C4(0xD000000000000038LL, 0x80000001000504C0LL, v168);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v167, v168, v36 + 4, v36 + 12);
    _os_log_impl((void *)&_mh_execute_header, v33, v34, "%s called", v36, 0xCu);
    swift_arrayDestroy(v38, 1LL, (char *)&type metadata for Any + 8);
    uint64_t v39 = v38;
    a1 = v37;
    swift_slowDealloc(v39, -1LL, -1LL);
    swift_slowDealloc(v36, -1LL, -1LL);
  }

  uint64_t v40 = *(void (**)(char *, uint64_t))(v10 + 8);
  v40(v29, v9);
  uint64_t v41 = (void *)objc_opt_self(&OBJC_CLASS___IMDMessageStore);
  uint64_t v42 = (char *)[v41 sharedInstance];
  unint64_t v43 = (unint64_t)v164;
  NSString v44 = String._bridgeToObjectiveC()();
  id v45 = [v42 messageWithGUID:v44];

  if (v45)
  {
    id v46 = [v45 balloonBundleID];
    if (!v46)
    {
      __break(1u);
LABEL_43:
      __break(1u);
      goto LABEL_44;
    }

    uint64_t v48 = v46;
    uint64_t v49 = static String._unconditionallyBridgeFromObjectiveC(_:)(v46, v47);
    unint64_t v51 = v50;

    swift_bridgeObjectRelease(v51, v52);
    uint64_t v53 = HIBYTE(v51) & 0xF;
    if ((v51 & 0x2000000000000000LL) == 0) {
      uint64_t v53 = v49 & 0xFFFFFFFFFFFFLL;
    }
    if (!v53)
    {
      uint64_t v72 = v157;
      v166(v157, v165, v9);
      swift_bridgeObjectRetain_n(v43, 2LL);
      uint64_t v42 = (char *)v45;
      unint64_t v73 = (os_log_s *)Logger.logObject.getter(v42);
      os_log_type_t v74 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v73, v74))
      {
        uint64_t v75 = swift_slowAlloc(32LL, -1LL);
        uint64_t v165 = (void *)swift_slowAlloc(8LL, -1LL);
        __int16 v166 = (void (*)(uint64_t, void *, uint64_t))swift_slowAlloc(64LL, -1LL);
        v168[0] = (uint64_t)v166;
        *(_DWORD *)uint64_t v75 = 136315650;
        id v167 = (char *)sub_10002F0C4(0xD000000000000038LL, 0x80000001000504C0LL, v168);
        v160 = (void (*)(uint64_t, uint64_t))v40;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v167, v168, v75 + 4, v75 + 12);
        *(_WORD *)(v75 + 12) = 2080;
        swift_bridgeObjectRetain(v43);
        id v167 = (char *)sub_10002F0C4(a1, v43, v168);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v167, v168, v75 + 14, v75 + 22);
        swift_bridgeObjectRelease_n(v43, 3LL);
        *(_WORD *)(v75 + 22) = 2112;
        id v167 = v42;
        uint64_t v76 = v9;
        char v77 = v42;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v167, v168, v75 + 24, v75 + 32);
        unint64_t v78 = v165;
        *uint64_t v165 = v45;

        _os_log_impl( (void *)&_mh_execute_header,  v73,  v74,  "%s Message item for GUID %s is not a plugin message. Bailing. %@",  (uint8_t *)v75,  0x20u);
        uint64_t v79 = sub_10002D164(&qword_100070778);
        swift_arrayDestroy(v78, 1LL, v79);
        swift_slowDealloc(v78, -1LL, -1LL);
        id v80 = (void (*)(void, void, void))v166;
        swift_arrayDestroy(v166, 2LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v80, -1LL, -1LL);
        swift_slowDealloc(v75, -1LL, -1LL);

        v160(v157, v76);
      }

      else
      {

        swift_bridgeObjectRelease_n(v43, 2LL);
        v40((char *)v72, v9);
      }

      v163(0LL);
      goto LABEL_41;
    }

    uint64_t v157 = a1;
    int v54 = v161;
    v166((uint64_t)v161, v165, v9);
    uint64_t v55 = swift_bridgeObjectRetain_n(v43, 2LL);
    uint64_t v56 = (os_log_s *)Logger.logObject.getter(v55);
    os_log_type_t v57 = static os_log_type_t.info.getter();
    BOOL v58 = os_log_type_enabled(v56, v57);
    uint64_t v151 = v9;
    if (v58)
    {
      uint64_t v59 = swift_slowAlloc(22LL, -1LL);
      uint64_t v60 = swift_slowAlloc(64LL, -1LL);
      v160 = (void (*)(uint64_t, uint64_t))v40;
      uint64_t v61 = v60;
      v168[0] = v60;
      *(_DWORD *)uint64_t v59 = 136315394;
      id v167 = (char *)sub_10002F0C4(0xD000000000000038LL, 0x80000001000504C0LL, v168);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v167, v168, v59 + 4, v59 + 12);
      *(_WORD *)(v59 + 12) = 2080;
      swift_bridgeObjectRetain(v43);
      id v167 = (char *)sub_10002F0C4(v157, v43, v168);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v167, v168, v59 + 14, v59 + 22);
      swift_bridgeObjectRelease_n(v43, 3LL);
      _os_log_impl((void *)&_mh_execute_header, v56, v57, "%s Got message item with GUID %s", (uint8_t *)v59, 0x16u);
      swift_arrayDestroy(v61, 2LL, (char *)&type metadata for Any + 8);
      uint64_t v62 = v61;
      uint64_t v9 = v151;
      uint64_t v40 = (void (*)(char *, uint64_t))v160;
      swift_slowDealloc(v62, -1LL, -1LL);
      swift_slowDealloc(v59, -1LL, -1LL);

      uint64_t v63 = v161;
    }

    else
    {

      swift_bridgeObjectRelease_n(v43, 2LL);
      uint64_t v63 = v54;
    }

    v40(v63, v9);
    id v81 = [v41 sharedInstance];
    BOOL v82 = (char *)[v81 chatForMessage:v45];

    if (v82)
    {
      __int128 v152 = v82;
      uint64_t v83 = v158;
      v166((uint64_t)v158, v165, v9);
      id v84 = (char *)v45;
      NSString v85 = (os_log_s *)Logger.logObject.getter(v84);
      os_log_type_t v86 = static os_log_type_t.info.getter();
      BOOL v87 = os_log_type_enabled(v85, v86);
      v161 = v84;
      if (v87)
      {
        uint64_t v88 = swift_slowAlloc(22LL, -1LL);
        __int128 v150 = (void *)swift_slowAlloc(8LL, -1LL);
        v160 = (void (*)(uint64_t, uint64_t))swift_slowAlloc(32LL, -1LL);
        v168[0] = (uint64_t)v160;
        *(_DWORD *)uint64_t v88 = 136315394;
        id v167 = (char *)sub_10002F0C4(0xD000000000000038LL, 0x80000001000504C0LL, v168);
        os_log_t v149 = v85;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v167, v168, v88 + 4, v88 + 12);
        *(_WORD *)(v88 + 12) = 2112;
        uint64_t v89 = v40;
        id v167 = v161;
        uint64_t v90 = v161;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v167, v168, v88 + 14, v88 + 22);
        uint64_t v91 = v150;
        *__int128 v150 = v45;

        uint64_t v40 = v89;
        os_log_t v92 = v149;
        _os_log_impl((void *)&_mh_execute_header, v149, v86, "%s Got chat for message item %@", (uint8_t *)v88, 0x16u);
        uint64_t v93 = sub_10002D164(&qword_100070778);
        swift_arrayDestroy(v91, 1LL, v93);
        uint64_t v9 = v151;
        swift_slowDealloc(v91, -1LL, -1LL);
        os_log_t v94 = v160;
        swift_arrayDestroy(v160, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v94, -1LL, -1LL);
        uint64_t v95 = v88;
        id v84 = v161;
        swift_slowDealloc(v95, -1LL, -1LL);

        uint64_t v96 = v158;
      }

      else
      {

        uint64_t v96 = v83;
      }

      v40((char *)v96, v9);
      Class isa = Data._bridgeToObjectiveC()().super.isa;
      [v84 setPayloadData:isa];

      id v106 = [v41 sharedInstance];
      id v107 =  objc_msgSend( v106,  "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:",  v84,  1,  0,  0,  objc_msgSend(v84, "flags"));

      id v108 = v159;
      v166((uint64_t)v159, v165, v9);
      uint64_t v109 = (char *)v107;
      v110 = (os_log_s *)Logger.logObject.getter(v109);
      os_log_type_t v111 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v110, v111))
      {
        uint64_t v112 = swift_slowAlloc(22LL, -1LL);
        __int128 v158 = (char **)swift_slowAlloc(8LL, -1LL);
        v160 = (void (*)(uint64_t, uint64_t))swift_slowAlloc(32LL, -1LL);
        v168[0] = (uint64_t)v160;
        *(_DWORD *)uint64_t v112 = 136315394;
        id v167 = (char *)sub_10002F0C4(0xD000000000000038LL, 0x80000001000504C0LL, v168);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v167, v168, v112 + 4, v112 + 12);
        *(_WORD *)(v112 + 12) = 2112;
        id v167 = v109;
        v113 = v109;
        v114 = v109;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v167, v168, v112 + 14, v112 + 22);
        v115 = v158;
        *__int128 v158 = v113;

        uint64_t v109 = v113;
        _os_log_impl( (void *)&_mh_execute_header,  v110,  v111,  "%s Updated store with new message item %@",  (uint8_t *)v112,  0x16u);
        uint64_t v116 = sub_10002D164(&qword_100070778);
        swift_arrayDestroy(v115, 1LL, v116);
        swift_slowDealloc(v115, -1LL, -1LL);
        v117 = v160;
        swift_arrayDestroy(v160, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v117, -1LL, -1LL);
        swift_slowDealloc(v112, -1LL, -1LL);

        id v118 = v159;
      }

      else
      {

        id v118 = v108;
      }

      v40(v118, v9);
      uint64_t v42 = v164;
      uint64_t v119 = v156;
      v120 = v152;
      id v121 = [(id)objc_opt_self(IMDBroadcastController) sharedProvider];
      if (v121)
      {
        id v122 = v121;
        v123 = v40;
        id v124 = [v121 broadcasterForChatListeners];
        swift_unknownObjectRelease(v122);
        id v125 = [v120 style];
        id v126 = [v109 accountID];
        if (v126)
        {
          uint64_t v127 = v126;
          id v128 = [v120 chatIdentifier];
          [v124 account:v127 chat:v128 style:v125 chatProperties:0 messageUpdated:v109];

          v129 = v153;
          v166((uint64_t)v153, v165, v9);
          uint64_t v130 = swift_bridgeObjectRetain_n(v42, 2LL);
          v131 = (os_log_s *)Logger.logObject.getter(v130);
          os_log_type_t v132 = static os_log_type_t.info.getter();
          if (os_log_type_enabled(v131, v132))
          {
            uint64_t v133 = swift_slowAlloc(22LL, -1LL);
            uint64_t v134 = swift_slowAlloc(64LL, -1LL);
            __int16 v166 = (void (*)(uint64_t, void *, uint64_t))v124;
            uint64_t v135 = v134;
            v168[0] = v134;
            *(_DWORD *)uint64_t v133 = 136315394;
            id v167 = (char *)sub_10002F0C4(0xD000000000000038LL, 0x80000001000504C0LL, v168);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v167, v168, v133 + 4, v133 + 12);
            *(_WORD *)(v133 + 12) = 2080;
            swift_bridgeObjectRetain(v42);
            id v167 = (char *)sub_10002F0C4(v157, (unint64_t)v42, v168);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v167, v168, v133 + 14, v133 + 22);
            id v124 = v166;
            swift_bridgeObjectRelease_n(v42, 3LL);
            _os_log_impl( (void *)&_mh_execute_header,  v131,  v132,  "%s Broadcasted messageUpdated for GUID %s",  (uint8_t *)v133,  0x16u);
            swift_arrayDestroy(v135, 2LL, (char *)&type metadata for Any + 8);
            uint64_t v136 = v135;
            v120 = v152;
            swift_slowDealloc(v136, -1LL, -1LL);
            swift_slowDealloc(v133, -1LL, -1LL);

            v123(v153, v9);
          }

          else
          {

            swift_bridgeObjectRelease_n(v42, 2LL);
            v123(v129, v9);
          }

          v163(1LL);

          swift_unknownObjectRelease(v124);
          return;
        }

        goto LABEL_43;
      }

      v160 = (void (*)(uint64_t, uint64_t))v40;
      v166((uint64_t)v119, v165, v9);
      uint64_t v42 = v109;
      v137 = (os_log_s *)Logger.logObject.getter(v42);
      os_log_type_t v138 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v137, v138))
      {
        uint64_t v139 = swift_slowAlloc(22LL, -1LL);
        uint64_t v140 = swift_slowAlloc(64LL, -1LL);
        v168[0] = v140;
        *(_DWORD *)uint64_t v139 = 136315394;
        id v167 = (char *)sub_10002F0C4(0xD000000000000038LL, 0x80000001000504C0LL, v168);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v167, v168, v139 + 4, v139 + 12);
        *(_WORD *)(v139 + 12) = 2080;
        id v141 = [v42 guid];
        if (!v141)
        {
LABEL_44:

          __break(1u);
          return;
        }

        __int128 v143 = v141;
        uint64_t v144 = static String._unconditionallyBridgeFromObjectiveC(_:)(v141, v142);
        unint64_t v146 = v145;

        id v167 = (char *)sub_10002F0C4(v144, v146, v168);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v167, v168, v139 + 14, v139 + 22);

        swift_bridgeObjectRelease(v146, v147);
        _os_log_impl( (void *)&_mh_execute_header,  v137,  v138,  "%s No broadcaster for message with GUID %s",  (uint8_t *)v139,  0x16u);
        swift_arrayDestroy(v140, 2LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v140, -1LL, -1LL);
        swift_slowDealloc(v139, -1LL, -1LL);

        v160((uint64_t)v156, v151);
        v120 = v152;
      }

      else
      {

        v160((uint64_t)v119, v9);
      }

      v163(0LL);

LABEL_41:
      return;
    }

    v97 = v152;
    v166((uint64_t)v152, v165, v9);
    unint64_t v98 = (unint64_t)v164;
    uint64_t v99 = swift_bridgeObjectRetain_n(v164, 2LL);
    v100 = (os_log_s *)Logger.logObject.getter(v99);
    os_log_type_t v101 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v100, v101))
    {
      uint64_t v102 = swift_slowAlloc(22LL, -1LL);
      uint64_t v103 = v40;
      uint64_t v104 = swift_slowAlloc(64LL, -1LL);
      v168[0] = v104;
      *(_DWORD *)uint64_t v102 = 136315394;
      id v167 = (char *)sub_10002F0C4(0xD000000000000038LL, 0x80000001000504C0LL, v168);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v167, v168, v102 + 4, v102 + 12);
      *(_WORD *)(v102 + 12) = 2080;
      swift_bridgeObjectRetain(v98);
      id v167 = (char *)sub_10002F0C4(v157, v98, v168);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v167, v168, v102 + 14, v102 + 22);
      swift_bridgeObjectRelease_n(v98, 3LL);
      _os_log_impl((void *)&_mh_execute_header, v100, v101, "%s No message item for GUID %s", (uint8_t *)v102, 0x16u);
      swift_arrayDestroy(v104, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v104, -1LL, -1LL);
      swift_slowDealloc(v102, -1LL, -1LL);

      v103(v152, v9);
    }

    else
    {

      swift_bridgeObjectRelease_n(v98, 2LL);
      v40(v97, v9);
    }

    v163(0LL);
  }

  else
  {
    uint64_t v64 = v40;
    id v65 = (char *)v160;
    v166((uint64_t)v160, v165, v9);
    uint64_t v66 = swift_bridgeObjectRetain_n(v43, 2LL);
    NSString v67 = (os_log_s *)Logger.logObject.getter(v66);
    os_log_type_t v68 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v67, v68))
    {
      uint64_t v69 = swift_slowAlloc(22LL, -1LL);
      uint64_t v70 = swift_slowAlloc(64LL, -1LL);
      v168[0] = v70;
      *(_DWORD *)uint64_t v69 = 136315394;
      id v167 = (char *)sub_10002F0C4(0xD000000000000038LL, 0x80000001000504C0LL, v168);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v167, v168, v69 + 4, v69 + 12);
      *(_WORD *)(v69 + 12) = 2080;
      swift_bridgeObjectRetain(v43);
      id v167 = (char *)sub_10002F0C4(a1, v43, v168);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v167, v168, v69 + 14, v69 + 22);
      swift_bridgeObjectRelease_n(v43, 3LL);
      _os_log_impl((void *)&_mh_execute_header, v67, v68, "%s No message item for GUID %s", (uint8_t *)v69, 0x16u);
      swift_arrayDestroy(v70, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v70, -1LL, -1LL);
      swift_slowDealloc(v69, -1LL, -1LL);

      uint64_t v71 = (char *)v160;
    }

    else
    {

      swift_bridgeObjectRelease_n(v43, 2LL);
      uint64_t v71 = v65;
    }

    v64(v71, v9);
    v163(0LL);
  }

Swift::Void __swiftcall IMDaemonChatMessageHistoryRequestHandler.updateChats(usingMessageGUIDsAndSummaries:)( Swift::OpaquePointer usingMessageGUIDsAndSummaries)
{
  id v1 = [(id)objc_opt_self(IMDChatRegistry) sharedInstance];
  sub_100032148(0LL, &qword_100070EC8, &OBJC_CLASS___NSAttributedString_ptr);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  [v1 updateChatsUsingMessageGUIDsAndSummaries:isa];
}

uint64_t sub_10003F134@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v4;
  swift_bridgeObjectRetain(*v4);
  unint64_t v9 = sub_100034070(a1, a2);
  LOBYTE(a2) = v10;
  swift_bridgeObjectRelease(v8, v10);
  if ((a2 & 1) != 0)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v4);
    uint64_t v13 = *v4;
    uint64_t v21 = *v4;
    uint64_t *v4 = 0x8000000000000000LL;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_10003F994();
      uint64_t v13 = v21;
    }

    swift_bridgeObjectRelease(*(void *)(*(void *)(v13 + 48) + 16 * v9 + 8), v12);
    uint64_t v14 = *(void *)(v13 + 56);
    uint64_t v15 = type metadata accessor for Date(0LL);
    uint64_t v16 = *(void *)(v15 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v16 + 32))(a3, v14 + *(void *)(v16 + 72) * v9, v15);
    sub_10003F5CC(v9, v13);
    uint64_t v17 = *v4;
    uint64_t *v4 = v13;
    swift_bridgeObjectRelease(v17, v18);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v16 + 56))(a3, 0LL, 1LL, v15);
  }

  else
  {
    uint64_t v20 = type metadata accessor for Date(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56LL))( a3,  1LL,  1LL,  v20);
  }

Swift::Int sub_10003F264(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v46 = type metadata accessor for Date(0LL);
  uint64_t v6 = *(void *)(v46 - 8);
  __chkstk_darwin(v46);
  id v45 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = *v3;
  if (*(void *)(*v3 + 24) > a1) {
    a1 = *(void *)(*v3 + 24);
  }
  sub_10002D164(&qword_100070F40);
  int v44 = a2;
  uint64_t v9 = static _DictionaryStorage.resize(original:capacity:move:)(v8, a1, a2);
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_41;
  }
  uint64_t v41 = v3;
  uint64_t v11 = 1LL << *(_BYTE *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 64);
  unint64_t v43 = (void *)(v8 + 64);
  if (v11 < 64) {
    uint64_t v13 = ~(-1LL << v11);
  }
  else {
    uint64_t v13 = -1LL;
  }
  unint64_t v14 = v13 & v12;
  int64_t v42 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v15 = v9 + 64;
  Swift::Int result = swift_retain(v8);
  int64_t v17 = 0LL;
  while (1)
  {
    if (v14)
    {
      unint64_t v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_24;
    }

    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1LL))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }

    if (v22 >= v42) {
      goto LABEL_36;
    }
    unint64_t v23 = v43[v22];
    ++v17;
    if (!v23)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v42) {
        goto LABEL_36;
      }
      unint64_t v23 = v43[v17];
      if (!v23) {
        break;
      }
    }

LABEL_23:
    unint64_t v14 = (v23 - 1) & v23;
    unint64_t v21 = __clz(__rbit64(v23)) + (v17 << 6);
LABEL_24:
    uint64_t v25 = *(void *)(v8 + 56);
    uint64_t v26 = v8;
    uint64_t v27 = (uint64_t *)(*(void *)(v8 + 48) + 16 * v21);
    uint64_t v29 = *v27;
    uint64_t v28 = v27[1];
    uint64_t v30 = *(void *)(v6 + 72);
    uint64_t v31 = v25 + v30 * v21;
    if ((v44 & 1) != 0)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 32))(v45, v31, v46);
    }

    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v45, v31, v46);
      swift_bridgeObjectRetain(v28);
    }

    Hasher.init(_seed:)(v47, *(void *)(v10 + 40));
    String.hash(into:)(v47, v29, v28);
    Swift::Int result = Hasher._finalize()();
    uint64_t v32 = -1LL << *(_BYTE *)(v10 + 32);
    unint64_t v33 = result & ~v32;
    unint64_t v34 = v33 >> 6;
    if (((-1LL << v33) & ~*(void *)(v15 + 8 * (v33 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1LL << v33) & ~*(void *)(v15 + 8 * (v33 >> 6)))) | v33 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v35 = 0;
      unint64_t v36 = (unint64_t)(63 - v32) >> 6;
      do
      {
        if (++v34 == v36 && (v35 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }

        BOOL v37 = v34 == v36;
        if (v34 == v36) {
          unint64_t v34 = 0LL;
        }
        v35 |= v37;
        uint64_t v38 = *(void *)(v15 + 8 * v34);
      }

      while (v38 == -1);
      unint64_t v18 = __clz(__rbit64(~v38)) + (v34 << 6);
    }

    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v18;
    uint64_t v19 = (void *)(*(void *)(v10 + 48) + 16 * v18);
    *uint64_t v19 = v29;
    v19[1] = v28;
    Swift::Int result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))( *(void *)(v10 + 56) + v30 * v18,  v45,  v46);
    ++*(void *)(v10 + 16);
    uint64_t v8 = v26;
  }

  int64_t v24 = v22 + 2;
  if (v24 < v42)
  {
    unint64_t v23 = v43[v24];
    if (!v23)
    {
      while (1)
      {
        int64_t v17 = v24 + 1;
        if (__OFADD__(v24, 1LL)) {
          goto LABEL_43;
        }
        if (v17 >= v42) {
          goto LABEL_36;
        }
        unint64_t v23 = v43[v17];
        ++v24;
        if (v23) {
          goto LABEL_23;
        }
      }
    }

    int64_t v17 = v24;
    goto LABEL_23;
  }

LABEL_36:
  swift_release(v8);
  uint64_t v3 = v41;
  if ((v44 & 1) != 0)
  {
    uint64_t v39 = 1LL << *(_BYTE *)(v8 + 32);
    if (v39 >= 64) {
      bzero(v43, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
    }
    else {
      void *v43 = -1LL << v39;
    }
    *(void *)(v8 + 16) = 0LL;
  }

unint64_t sub_10003F5CC(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1LL << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    Swift::Int result = _HashTable.previousHole(before:)(result, a2 + 64, ~v5);
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1LL << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        uint64_t v9 = (uint64_t *)(*(void *)(a2 + 48) + 16 * v6);
        uint64_t v10 = *v9;
        uint64_t v11 = v9[1];
        Hasher.init(_seed:)(v30, *(void *)(a2 + 40));
        swift_bridgeObjectRetain(v11);
        String.hash(into:)(v30, v10, v11);
        Swift::Int v12 = Hasher._finalize()();
        Swift::Int result = swift_bridgeObjectRelease(v11, v13);
        unint64_t v14 = v12 & v7;
        if (v14 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v15 = *(void *)(a2 + 48);
        uint64_t v16 = (_OWORD *)(v15 + 16 * v3);
        int64_t v17 = (_OWORD *)(v15 + 16 * v6);
        if (v3 != v6 || v16 >= v17 + 1) {
          _OWORD *v16 = *v17;
        }
        uint64_t v18 = *(void *)(a2 + 56);
        uint64_t v19 = *(void *)(*(void *)(type metadata accessor for Date(0LL) - 8) + 72LL);
        int64_t v20 = v19 * v3;
        Swift::Int result = v18 + v19 * v3;
        int64_t v21 = v19 * v6;
        unint64_t v22 = v18 + v19 * v6 + v19;
        if (v20 < v21 || result >= v22)
        {
          Swift::Int result = swift_arrayInitWithTakeFrontToBack();
        }

        else
        {
          int64_t v3 = v6;
          if (v20 == v21) {
            goto LABEL_6;
          }
          Swift::Int result = swift_arrayInitWithTakeBackToFront();
        }

        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          goto LABEL_21;
        }
      }

      if (v14 < v8) {
        goto LABEL_6;
      }
LABEL_11:
      goto LABEL_12;
    }

uint64_t sub_10003F7C8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_100034070(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }

  else
  {
    char v16 = v11;
    uint64_t v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      uint64_t v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        uint64_t v19 = v18[7];
        uint64_t v20 = type metadata accessor for Date(0LL);
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 40LL))( v19 + *(void *)(*(void *)(v20 - 8) + 72LL) * v12,  a1,  v20);
      }

      goto LABEL_11;
    }

    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_10003F994();
      goto LABEL_7;
    }

    sub_10003F264(v15, a4 & 1);
    unint64_t v22 = sub_100034070(a2, a3);
    if ((v16 & 1) == (v23 & 1))
    {
      unint64_t v12 = v22;
      uint64_t v18 = *v5;
      if ((v16 & 1) != 0) {
        goto LABEL_8;
      }
LABEL_11:
      sub_10003F904(v12, a2, a3, a1, v18);
      return swift_bridgeObjectRetain(a3);
    }
  }

  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

uint64_t sub_10003F904(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1LL << a1;
  unint64_t v8 = (void *)(a5[6] + 16 * a1);
  void *v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = type metadata accessor for Date(0LL);
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32LL))( v9 + *(void *)(*(void *)(v10 - 8) + 72LL) * a1,  a4,  v10);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1LL);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

void *sub_10003F994()
{
  uint64_t v34 = type metadata accessor for Date(0LL);
  uint64_t v1 = *(void *)(v34 - 8);
  __chkstk_darwin(v34);
  int64_t v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_10002D164(&qword_100070F40);
  uint64_t v31 = v0;
  uint64_t v4 = *v0;
  uint64_t v5 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v6 = *(void *)(v4 + 16);
  uint64_t v35 = v5;
  if (!v6)
  {
    uint64_t result = (void *)swift_release(v4);
    uint64_t v29 = v35;
    BOOL v28 = v31;
LABEL_28:
    uint64_t *v28 = v29;
    return result;
  }

  uint64_t v7 = v5;
  uint64_t result = (void *)(v5 + 64);
  unint64_t v9 = (unint64_t)((1LL << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    uint64_t result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    uint64_t v7 = v35;
  }

  uint64_t v32 = v4 + 64;
  int64_t v11 = 0LL;
  *(void *)(v7 + 16) = *(void *)(v4 + 16);
  uint64_t v12 = 1LL << *(_BYTE *)(v4 + 32);
  uint64_t v13 = -1LL;
  if (v12 < 64) {
    uint64_t v13 = ~(-1LL << v12);
  }
  unint64_t v14 = v13 & *(void *)(v4 + 64);
  int64_t v33 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v15 = v34;
  while (1)
  {
    if (v14)
    {
      unint64_t v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }

    int64_t v25 = v11 + 1;
    if (__OFADD__(v11, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v25 >= v33) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v32 + 8 * v25);
    ++v11;
    if (!v26)
    {
      int64_t v11 = v25 + 1;
      if (v25 + 1 >= v33) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v32 + 8 * v11);
      if (!v26) {
        break;
      }
    }

void _sSo40IMDaemonChatMessageHistoryRequestHandlerC7imagentE8loadItem8withGUID7queryIDySS_SStF_0( uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  v95[1] = a3;
  uint64_t v95[2] = a4;
  uint64_t v6 = type metadata accessor for Logger(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v96 = (char *)v95 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)v95 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  v100 = (char *)v95 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v103 = (char *)v95 - v16;
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)v95 - v17;
  uint64_t v19 = sub_10002D400();
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  uint64_t v104 = v19;
  v105 = v20;
  ((void (*)(char *))v20)(v18);
  uint64_t v21 = swift_bridgeObjectRetain_n(a2, 2LL);
  unint64_t v22 = (os_log_s *)Logger.logObject.getter(v21);
  os_log_type_t v23 = static os_log_type_t.info.getter();
  BOOL v24 = os_log_type_enabled(v22, v23);
  uint64_t v98 = a1;
  uint64_t v99 = v6;
  unint64_t v101 = a2;
  v97 = v12;
  if (v24)
  {
    uint64_t v25 = swift_slowAlloc(22LL, -1LL);
    uint64_t v26 = swift_slowAlloc(64LL, -1LL);
    uint64_t v107 = v26;
    *(_DWORD *)uint64_t v25 = 136315394;
    id v27 = [(id)objc_opt_self(IMDClientRequestContext) currentContext];
    if (!v27)
    {
      swift_bridgeObjectRelease(v101, v28);
      __break(1u);
      goto LABEL_33;
    }

    uint64_t v29 = v27;
    id v30 = [v27 listenerID];

    uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)(v30, v31);
    unint64_t v34 = v33;

    uint64_t v106 = sub_10002F0C4(v32, v34, &v107);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v106, &v107, v25 + 4, v25 + 12);
    swift_bridgeObjectRelease(v34, v35);
    *(_WORD *)(v25 + 12) = 2080;
    unint64_t v36 = v101;
    swift_bridgeObjectRetain(v101);
    uint64_t v106 = sub_10002F0C4(v98, v36, &v107);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v106, &v107, v25 + 14, v25 + 22);
    swift_bridgeObjectRelease_n(v36, 3LL);
    _os_log_impl( (void *)&_mh_execute_header,  v22,  v23,  "Request from %s to load item with guid: %s",  (uint8_t *)v25,  0x16u);
    swift_arrayDestroy(v26, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v26, -1LL, -1LL);
    swift_slowDealloc(v25, -1LL, -1LL);

    BOOL v37 = *(void (**)(char *, uint64_t))(v7 + 8);
    uint64_t v6 = v99;
    v37(v18, v99);
  }

  else
  {

    swift_bridgeObjectRelease_n(a2, 2LL);
    BOOL v37 = *(void (**)(char *, uint64_t))(v7 + 8);
    v37(v18, v6);
  }

  uint64_t v38 = (void *)objc_opt_self(&OBJC_CLASS___IMDMessageStore);
  id v39 = [v38 sharedInstance];
  NSString v40 = String._bridgeToObjectiveC()();
  id v41 = [v39 itemWithGUID:v40];

  id v42 = [v38 sharedInstance];
  NSString v43 = String._bridgeToObjectiveC()();
  id v44 = [v42 chatForMessageGUID:v43];

  v105(v103, v104, v6);
  id v45 = v41;
  uint64_t v46 = (os_log_s *)Logger.logObject.getter(v45);
  os_log_type_t v47 = static os_log_type_t.info.getter();
  BOOL v48 = os_log_type_enabled(v46, v47);
  uint64_t v102 = v37;
  if (v48)
  {
    v95[0] = v44;
    uint64_t v49 = v6;
    unint64_t v50 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    unint64_t v51 = (void *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)unint64_t v50 = 138412290;
    if (v45)
    {
      uint64_t v107 = (uint64_t)v45;
      id v52 = v45;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v107, &v108, v50 + 4, v50 + 12);
    }

    else
    {
      uint64_t v107 = 0LL;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v107, &v108, v50 + 4, v50 + 12);
      id v41 = 0LL;
    }

    uint64_t v53 = v100;
    void *v51 = v41;

    _os_log_impl((void *)&_mh_execute_header, v46, v47, "Resulting item: %@", v50, 0xCu);
    uint64_t v54 = sub_10002D164(&qword_100070778);
    swift_arrayDestroy(v51, 1LL, v54);
    swift_slowDealloc(v51, -1LL, -1LL);
    swift_slowDealloc(v50, -1LL, -1LL);
    uint64_t v6 = v49;
    BOOL v37 = v102;
    id v44 = (id)v95[0];
  }

  else
  {

    uint64_t v46 = (os_log_s *)v45;
    uint64_t v53 = v100;
  }

  v37(v103, v6);
  v105(v53, v104, v6);
  id v55 = v44;
  uint64_t v56 = (os_log_s *)Logger.logObject.getter(v55);
  os_log_type_t v57 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v56, v57))
  {
    BOOL v58 = v55;
    id v59 = v44;
    uint64_t v60 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v61 = (void *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v60 = 138412290;
    if (v58)
    {
      uint64_t v107 = (uint64_t)v58;
      id v62 = v58;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v107, &v108, v60 + 4, v60 + 12);
    }

    else
    {
      uint64_t v107 = 0LL;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v107, &v108, v60 + 4, v60 + 12);
      id v59 = 0LL;
    }

    *uint64_t v61 = v59;

    _os_log_impl((void *)&_mh_execute_header, v56, v57, "Resulting chat: %@", v60, 0xCu);
    uint64_t v63 = sub_10002D164(&qword_100070778);
    swift_arrayDestroy(v61, 1LL, v63);
    swift_slowDealloc(v61, -1LL, -1LL);
    swift_slowDealloc(v60, -1LL, -1LL);
    BOOL v37 = v102;
    id v55 = v58;
    uint64_t v6 = v99;
    uint64_t v53 = v100;
  }

  else
  {

    uint64_t v56 = (os_log_s *)v55;
  }

  v37(v53, v6);
  unint64_t v64 = v101;
  if (!v45)
  {
    uint64_t v89 = v96;
    v105(v96, v104, v6);
    uint64_t v90 = swift_bridgeObjectRetain_n(v64, 2LL);
    uint64_t v91 = (void *)Logger.logObject.getter(v90);
    os_log_type_t v92 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled((os_log_t)v91, v92))
    {

      swift_bridgeObjectRelease_n(v64, 2LL);
      v37(v89, v6);
      return;
    }

    uint64_t v93 = swift_slowAlloc(22LL, -1LL);
    uint64_t v94 = swift_slowAlloc(64LL, -1LL);
    uint64_t v107 = v94;
    *(_DWORD *)uint64_t v93 = 136315394;
    uint64_t v106 = sub_10002F0C4(0xD00000000000001BLL, 0x8000000100050540LL, &v107);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v106, &v107, v93 + 4, v93 + 12);
    *(_WORD *)(v93 + 12) = 2080;
    swift_bridgeObjectRetain(v64);
    uint64_t v106 = sub_10002F0C4(v98, v64, &v107);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v106, &v107, v93 + 14, v93 + 22);
    swift_bridgeObjectRelease_n(v64, 3LL);
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v91,  v92,  "%s Failed to find item with GUID %s",  (uint8_t *)v93,  0x16u);
    swift_arrayDestroy(v94, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v94, -1LL, -1LL);
    swift_slowDealloc(v93, -1LL, -1LL);

    uint64_t v88 = v89;
LABEL_28:
    v102(v88, v6);
    return;
  }

  id v65 = v45;
  if (!v55 || (id v66 = [v55 guid]) == 0)
  {
    BOOL v82 = v97;
    v105(v97, v104, v6);
    uint64_t v83 = swift_bridgeObjectRetain_n(v64, 2LL);
    id v84 = (os_log_s *)Logger.logObject.getter(v83);
    os_log_type_t v85 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v84, v85))
    {
      uint64_t v86 = swift_slowAlloc(22LL, -1LL);
      uint64_t v87 = swift_slowAlloc(64LL, -1LL);
      uint64_t v107 = v87;
      *(_DWORD *)uint64_t v86 = 136315394;
      uint64_t v106 = sub_10002F0C4(0xD00000000000001BLL, 0x8000000100050540LL, &v107);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v106, &v107, v86 + 4, v86 + 12);
      *(_WORD *)(v86 + 12) = 2080;
      swift_bridgeObjectRetain(v64);
      uint64_t v106 = sub_10002F0C4(v98, v64, &v107);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v106, &v107, v86 + 14, v86 + 22);
      swift_bridgeObjectRelease_n(v64, 3LL);
      _os_log_impl((void *)&_mh_execute_header, v84, v85, "%s Failed to find chat for GUID %s", (uint8_t *)v86, 0x16u);
      swift_arrayDestroy(v87, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v87, -1LL, -1LL);
      swift_slowDealloc(v86, -1LL, -1LL);

      uint64_t v88 = v97;
    }

    else
    {

      swift_bridgeObjectRelease_n(v64, 2LL);
      uint64_t v88 = v82;
    }

    goto LABEL_28;
  }

  os_log_type_t v68 = v66;
  uint64_t v69 = static String._unconditionallyBridgeFromObjectiveC(_:)(v66, v67);
  uint64_t v71 = v70;

  id v72 = [(id)objc_opt_self(IMDClientRequestContext) currentContext];
  if (!v72)
  {
LABEL_33:
    __break(1u);
    return;
  }

  unint64_t v73 = v72;
  id v74 = [v72 replyProxy];

  if (v74)
  {
    NSString v76 = String._bridgeToObjectiveC()();
    uint64_t v77 = sub_10002D164(&qword_100070F48);
    uint64_t v78 = swift_allocObject(v77, 64LL, 7LL);
    *(_OWORD *)(v78 + 16) = xmmword_10004A810;
    *(void *)(v78 + 56) = &type metadata for String;
    *(void *)(v78 + 32) = v69;
    *(void *)(v78 + 40) = v71;
    id v79 = v65;
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v78, v81);
    [v74 itemQuery:v76 finishedWithResult:v79 chatGUIDs:isa];

    swift_unknownObjectRelease(v74);
  }

  else
  {
    swift_bridgeObjectRelease(v71, v75);
  }

uint64_t sub_10004072C(uint64_t a1, uint64_t a2)
{
  return swift_deallocObject(v2, 24LL, 7LL);
}

uint64_t sub_100040754(uint64_t a1)
{
  return sub_10003D604(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_100040760(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100040770(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

void sub_100040778(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject(&unk_1000669A0, 24LL, 7LL);
  *(void *)(v4 + 16) = &_swiftEmptyDictionarySingleton;
  uint64_t v5 = v4 + 16;
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6)
  {
    uint64_t v31 = v4 + 16;
    uint64_t v33 = a2;
    id v36 = (id)objc_opt_self(&OBJC_CLASS___IMDDatabase);
    uint64_t v35 = IMMessagePropertyDate;
    swift_bridgeObjectRetain(a1);
    uint64_t v32 = a1;
    uint64_t v8 = (uint64_t *)(a1 + 40);
    uint64_t v34 = v4;
    do
    {
      uint64_t v9 = *(v8 - 1);
      uint64_t v10 = *v8;
      static String._unconditionallyBridgeFromObjectiveC(_:)(v35, v7);
      uint64_t v12 = v11;
      id v13 = objc_allocWithZone(&OBJC_CLASS___NSSortDescriptor);
      swift_bridgeObjectRetain(v10);
      NSString v14 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v12, v15);
      id v16 = [v13 initWithKey:v14 ascending:1];

      id v17 = [v36 synchronousDatabase];
      NSString v18 = String._bridgeToObjectiveC()();
      uint64_t v19 = sub_10002D164(&qword_100070AB8);
      uint64_t v20 = swift_allocObject(v19, 40LL, 7LL);
      *(_OWORD *)(v20 + 16) = xmmword_10004B090;
      *(void *)(v20 + 32) = v16;
      aBlock[0] = v20;
      specialized Array._endMutation()();
      uint64_t v21 = aBlock[0];
      uint64_t v4 = v34;
      sub_100032148(0LL, &qword_100070EC0, &OBJC_CLASS___NSSortDescriptor_ptr);
      id v22 = v16;
      Class isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v21, v24);
      uint64_t v25 = (void *)swift_allocObject(&unk_100066A18, 40LL, 7LL);
      v25[2] = v34;
      v25[3] = v9;
      v25[4] = v10;
      aBlock[4] = sub_100042408;
      uint64_t v38 = v25;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256LL;
      aBlock[2] = sub_10003D94C;
      aBlock[3] = &unk_100066A30;
      uint64_t v26 = _Block_copy(aBlock);
      id v27 = v38;
      swift_retain(v34);
      swift_release(v27);
      [v17 fetchMessageRecordsForChatRecordWithGUID:v18 filteredUsingPredicate:0 sortedUsingDescriptors:isa limit:1 completionHandler:v26];
      _Block_release(v26);

      swift_unknownObjectRelease(v17);
      v8 += 2;
      --v6;
    }

    while (v6);
    swift_bridgeObjectRelease(v32, v7);
    a2 = v33;
    uint64_t v5 = v31;
  }

  swift_beginAccess(v5, aBlock, 0LL, 0LL);
  uint64_t v28 = *(void *)(v4 + 16);
  type metadata accessor for Date(0LL);
  swift_bridgeObjectRetain(v28);
  Class v29 = Dictionary._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, Class))(a2 + 16))(a2, v29);
  swift_release(v4);
  swift_bridgeObjectRelease(v28, v30);
}

void _sSo40IMDaemonChatMessageHistoryRequestHandlerC7imagentE34upgradeCompleteMyMomentLinkToStack04withC4GUID04chatP0ySS_SStF_0( uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  id v8 = [(id)objc_opt_self(IMDChatRegistry) sharedInstance];
  NSString v9 = String._bridgeToObjectiveC()();
  id v10 = [v8 existingChatWithGUID:v9];

  if (v10)
  {
    id v11 = [(id)objc_opt_self(IMDMessageStore) sharedInstance];
    NSString v12 = String._bridgeToObjectiveC()();
    id v13 = [v11 messageWithGUID:v12];

    if (v13)
    {
      id v20 = [(id)objc_opt_self(IMDMomentShareManager) sharedInstance];
      [v20 registerAndAcceptMomentShareForMessage:v13 inChat:v10 resetAssetTransfers:1];

      return;
    }
  }

  if (qword_100071F00 != -1) {
    swift_once(&qword_100071F00, sub_10003D2B8);
  }
  uint64_t v14 = type metadata accessor for Logger(0LL);
  sub_10002D2C4(v14, (uint64_t)qword_100071F08);
  swift_bridgeObjectRetain_n(a4, 2LL);
  uint64_t v15 = swift_bridgeObjectRetain_n(a2, 2LL);
  id v16 = (os_log_s *)Logger.logObject.getter(v15);
  os_log_type_t v17 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc(22LL, -1LL);
    uint64_t v19 = swift_slowAlloc(64LL, -1LL);
    uint64_t v22 = v19;
    *(_DWORD *)uint64_t v18 = 136315394;
    swift_bridgeObjectRetain(a4);
    uint64_t v21 = sub_10002F0C4(a3, a4, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22, v18 + 4, v18 + 12);
    swift_bridgeObjectRelease_n(a4, 3LL);
    *(_WORD *)(v18 + 12) = 2080;
    swift_bridgeObjectRetain(a2);
    uint64_t v21 = sub_10002F0C4(a1, a2, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22, v18 + 14, v18 + 22);
    swift_bridgeObjectRelease_n(a2, 3LL);
    _os_log_impl( (void *)&_mh_execute_header,  v16,  v17,  "Failed to find chat for chat GUID (%s) or message for message GUID (%s)",  (uint8_t *)v18,  0x16u);
    swift_arrayDestroy(v19, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v19, -1LL, -1LL);
    swift_slowDealloc(v18, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(a2, 2LL);
    swift_bridgeObjectRelease_n(a4, 2LL);
  }

void sub_100040DA4(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, char *a5)
{
  uint64_t v157 = a3;
  uint64_t v158 = a4;
  uint64_t v167 = a1;
  uint64_t v7 = type metadata accessor for Logger(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  id v11 = (char *)&v150 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v154 = (char *)&v150 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  v161 = (char *)&v150 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v155 = (char *)&v150 - v17;
  uint64_t v18 = __chkstk_darwin(v16);
  v160 = (char *)&v150 - v19;
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v162 = (char *)&v150 - v21;
  uint64_t v22 = __chkstk_darwin(v20);
  __int128 v159 = (char *)&v150 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  v164 = (char *)&v150 - v25;
  __chkstk_darwin(v24);
  id v27 = (char *)&v150 - v26;
  uint64_t v28 = (char *)sub_10002D400();
  Class v29 = *(void (**)(void))(v8 + 16);
  uint64_t v30 = ((uint64_t (*)(char *, char *, uint64_t))v29)(v27, v28, v7);
  uint64_t v31 = (os_log_s *)Logger.logObject.getter(v30);
  os_log_type_t v32 = static os_log_type_t.info.getter();
  BOOL v33 = os_log_type_enabled(v31, v32);
  __int16 v168 = a5;
  uint64_t v166 = v7;
  __int128 v156 = v11;
  if (v33)
  {
    unint64_t v163 = a2;
    uint64_t v34 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v35 = swift_slowAlloc(32LL, -1LL);
    v170[0] = v35;
    *(_DWORD *)uint64_t v34 = 136315138;
    uint64_t v169 = sub_10002F0C4(0xD000000000000038LL, 0x80000001000504C0LL, v170);
    a2 = v163;
    uint64_t v7 = v166;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v169, v170, v34 + 4, v34 + 12);
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "%s called", v34, 0xCu);
    swift_arrayDestroy(v35, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v35, -1LL, -1LL);
    swift_slowDealloc(v34, -1LL, -1LL);
  }

  id v36 = *(void (**)(char *, uint64_t))(v8 + 8);
  v36(v27, v7);
  BOOL v37 = (char *)objc_opt_self(&OBJC_CLASS___IMDMessageStore);
  id v38 = [v37 sharedInstance];
  uint64_t v39 = v167;
  NSString v40 = String._bridgeToObjectiveC()();
  id v41 = (char *)[v38 messageWithGUID:v40];

  if (v41)
  {
    id v42 = v41;
    NSString v43 = (char *)v39;
    v164 = v42;
    uint64_t v165 = v36;
    unint64_t v44 = a2;
    id v45 = [v42 balloonBundleID];
    if (!v45)
    {
      _Block_release(v168);
      __break(1u);
LABEL_43:
      _Block_release(v28);
      __break(1u);
      goto LABEL_44;
    }

    os_log_type_t v47 = v45;
    uint64_t v48 = static String._unconditionallyBridgeFromObjectiveC(_:)(v45, v46);
    unint64_t v50 = v49;

    swift_bridgeObjectRelease(v50, v51);
    uint64_t v52 = HIBYTE(v50) & 0xF;
    if ((v50 & 0x2000000000000000LL) == 0) {
      uint64_t v52 = v48 & 0xFFFFFFFFFFFFLL;
    }
    if (v52)
    {
      __int128 v159 = v37;
      uint64_t v53 = v162;
      ((void (*)(char *, char *, uint64_t))v29)(v162, v28, v7);
      uint64_t v54 = swift_bridgeObjectRetain_n(a2, 2LL);
      id v55 = (os_log_s *)Logger.logObject.getter(v54);
      os_log_type_t v56 = static os_log_type_t.info.getter();
      BOOL v57 = os_log_type_enabled(v55, v56);
      __int128 v153 = v29;
      if (v57)
      {
        uint64_t v58 = swift_slowAlloc(22LL, -1LL);
        uint64_t v59 = swift_slowAlloc(64LL, -1LL);
        v170[0] = v59;
        *(_DWORD *)uint64_t v58 = 136315394;
        uint64_t v169 = sub_10002F0C4(0xD000000000000038LL, 0x80000001000504C0LL, v170);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v169, v170, v58 + 4, v58 + 12);
        *(_WORD *)(v58 + 12) = 2080;
        swift_bridgeObjectRetain(a2);
        Class v29 = v153;
        uint64_t v169 = sub_10002F0C4((uint64_t)v43, a2, v170);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v169, v170, v58 + 14, v58 + 22);
        swift_bridgeObjectRelease_n(a2, 3LL);
        _os_log_impl((void *)&_mh_execute_header, v55, v56, "%s Got message item with GUID %s", (uint8_t *)v58, 0x16u);
        swift_arrayDestroy(v59, 2LL, (char *)&type metadata for Any + 8);
        uint64_t v60 = v59;
        unint64_t v44 = a2;
        swift_slowDealloc(v60, -1LL, -1LL);
        uint64_t v61 = v58;
        uint64_t v7 = v166;
        swift_slowDealloc(v61, -1LL, -1LL);
      }

      else
      {

        swift_bridgeObjectRelease_n(a2, 2LL);
      }

      v165(v53, v7);
      uint64_t v81 = v168;
      id v82 = [v159 sharedInstance];
      NSString v43 = v164;
      uint64_t v83 = (char *)[v82 chatForMessage:v164];

      uint64_t v162 = v83;
      if (v83)
      {
        id v84 = v160;
        uint64_t v155 = v28;
        ((void (*)(char *, char *, uint64_t))v29)(v160, v28, v7);
        os_log_type_t v85 = v43;
        uint64_t v86 = (os_log_s *)Logger.logObject.getter(v85);
        os_log_type_t v87 = static os_log_type_t.info.getter();
        BOOL v88 = os_log_type_enabled(v86, v87);
        __int128 v152 = v85;
        unint64_t v163 = v44;
        if (v88)
        {
          uint64_t v89 = swift_slowAlloc(22LL, -1LL);
          uint64_t v90 = (char **)swift_slowAlloc(8LL, -1LL);
          uint64_t v151 = swift_slowAlloc(32LL, -1LL);
          v170[0] = v151;
          *(_DWORD *)uint64_t v89 = 136315394;
          uint64_t v169 = sub_10002F0C4(0xD000000000000038LL, 0x80000001000504C0LL, v170);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v169, v170, v89 + 4, v89 + 12);
          *(_WORD *)(v89 + 12) = 2112;
          uint64_t v169 = (uint64_t)v85;
          uint64_t v91 = v85;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v169, v170, v89 + 14, v89 + 22);
          char *v90 = v43;

          os_log_type_t v85 = v152;
          _os_log_impl((void *)&_mh_execute_header, v86, v87, "%s Got chat for message item %@", (uint8_t *)v89, 0x16u);
          uint64_t v92 = sub_10002D164(&qword_100070778);
          swift_arrayDestroy(v90, 1LL, v92);
          uint64_t v93 = v90;
          uint64_t v94 = v165;
          swift_slowDealloc(v93, -1LL, -1LL);
          uint64_t v95 = v151;
          swift_arrayDestroy(v151, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v95, -1LL, -1LL);
          swift_slowDealloc(v89, -1LL, -1LL);

          uint64_t v96 = v166;
          v94(v160, v166);
        }

        else
        {

          uint64_t v94 = v165;
          v165(v84, v7);
          uint64_t v96 = v7;
        }

        Class isa = Data._bridgeToObjectiveC()().super.isa;
        [v85 setPayloadData:isa];

        id v107 = [v159 sharedInstance];
        id v108 =  objc_msgSend( v107,  "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:",  v85,  1,  0,  0,  objc_msgSend(v85, "flags"));

        uint64_t v109 = v161;
        ((void (*)(char *, char *, uint64_t))v29)(v161, v155, v96);
        v110 = (char *)v108;
        os_log_type_t v111 = (os_log_s *)Logger.logObject.getter(v110);
        os_log_type_t v112 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v111, v112))
        {
          uint64_t v113 = swift_slowAlloc(22LL, -1LL);
          v114 = (void *)swift_slowAlloc(8LL, -1LL);
          v164 = (char *)swift_slowAlloc(32LL, -1LL);
          v170[0] = (uint64_t)v164;
          *(_DWORD *)uint64_t v113 = 136315394;
          uint64_t v169 = sub_10002F0C4(0xD000000000000038LL, 0x80000001000504C0LL, v170);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v169, v170, v113 + 4, v113 + 12);
          *(_WORD *)(v113 + 12) = 2112;
          uint64_t v169 = (uint64_t)v110;
          v115 = v110;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v169, v170, v113 + 14, v113 + 22);
          void *v114 = v110;

          _os_log_impl( (void *)&_mh_execute_header,  v111,  v112,  "%s Updated store with new message item %@",  (uint8_t *)v113,  0x16u);
          uint64_t v116 = sub_10002D164(&qword_100070778);
          swift_arrayDestroy(v114, 1LL, v116);
          v117 = v114;
          uint64_t v94 = v165;
          swift_slowDealloc(v117, -1LL, -1LL);
          id v118 = v164;
          swift_arrayDestroy(v164, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v118, -1LL, -1LL);
          swift_slowDealloc(v113, -1LL, -1LL);

          uint64_t v119 = v161;
        }

        else
        {

          uint64_t v119 = v109;
        }

        uint64_t v120 = v96;
        v94(v119, v96);
        uint64_t v28 = v168;
        id v121 = v162;
        id v122 = v110;
        id v123 = [(id)objc_opt_self(IMDBroadcastController) sharedProvider];
        NSString v43 = (char *)v153;
        if (v123)
        {
          id v124 = v123;
          id v125 = [v123 broadcasterForChatListeners];
          swift_unknownObjectRelease(v124);
          id v126 = [v121 style];
          id v127 = [v110 accountID];
          if (v127)
          {
            id v128 = v127;
            id v129 = [v121 chatIdentifier];
            v164 = v122;
            [v125 account:v128 chat:v129 style:v126 chatProperties:0 messageUpdated:v122];

            uint64_t v130 = v156;
            ((void (*)(char *, char *, uint64_t))v43)(v156, v155, v120);
            unint64_t v131 = v163;
            uint64_t v132 = swift_bridgeObjectRetain_n(v163, 2LL);
            uint64_t v133 = (os_log_s *)Logger.logObject.getter(v132);
            os_log_type_t v134 = static os_log_type_t.info.getter();
            if (os_log_type_enabled(v133, v134))
            {
              uint64_t v135 = swift_slowAlloc(22LL, -1LL);
              uint64_t v136 = swift_slowAlloc(64LL, -1LL);
              v170[0] = v136;
              *(_DWORD *)uint64_t v135 = 136315394;
              uint64_t v169 = sub_10002F0C4(0xD000000000000038LL, 0x80000001000504C0LL, v170);
              UnsafeMutableRawBufferPointer.copyMemory(from:)(&v169, v170, v135 + 4, v135 + 12);
              *(_WORD *)(v135 + 12) = 2080;
              swift_bridgeObjectRetain(v131);
              uint64_t v169 = sub_10002F0C4(v167, v131, v170);
              id v121 = v162;
              UnsafeMutableRawBufferPointer.copyMemory(from:)(&v169, v170, v135 + 14, v135 + 22);
              swift_bridgeObjectRelease_n(v131, 3LL);
              _os_log_impl( (void *)&_mh_execute_header,  v133,  v134,  "%s Broadcasted messageUpdated for GUID %s",  (uint8_t *)v135,  0x16u);
              swift_arrayDestroy(v136, 2LL, (char *)&type metadata for Any + 8);
              swift_slowDealloc(v136, -1LL, -1LL);
              swift_slowDealloc(v135, -1LL, -1LL);

              v165(v156, v120);
            }

            else
            {

              swift_bridgeObjectRelease_n(v131, 2LL);
              v94(v130, v120);
            }

            os_log_t v149 = v152;
            (*((void (**)(char *, uint64_t))v28 + 2))(v28, 1LL);

            swift_unknownObjectRelease(v125);
            return;
          }

          goto LABEL_43;
        }

        v137 = v154;
        v153();
        NSString v43 = v110;
        os_log_type_t v138 = (os_log_s *)Logger.logObject.getter(v43);
        os_log_type_t v139 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v138, v139))
        {
          uint64_t v140 = swift_slowAlloc(22LL, -1LL);
          uint64_t v141 = swift_slowAlloc(64LL, -1LL);
          v170[0] = v141;
          *(_DWORD *)uint64_t v140 = 136315394;
          uint64_t v169 = sub_10002F0C4(0xD000000000000038LL, 0x80000001000504C0LL, v170);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v169, v170, v140 + 4, v140 + 12);
          *(_WORD *)(v140 + 12) = 2080;
          id v142 = [v43 guid];
          if (!v142)
          {
LABEL_44:
            _Block_release(v168);

            __break(1u);
            return;
          }

          uint64_t v144 = v142;
          uint64_t v145 = static String._unconditionallyBridgeFromObjectiveC(_:)(v142, v143);
          unint64_t v147 = v146;

          uint64_t v169 = sub_10002F0C4(v145, v147, v170);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v169, v170, v140 + 14, v140 + 22);

          swift_bridgeObjectRelease(v147, v148);
          _os_log_impl( (void *)&_mh_execute_header,  v138,  v139,  "%s No broadcaster for message with GUID %s",  (uint8_t *)v140,  0x16u);
          swift_arrayDestroy(v141, 2LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v141, -1LL, -1LL);
          swift_slowDealloc(v140, -1LL, -1LL);

          v165(v154, v166);
          uint64_t v28 = v168;
          id v121 = v162;
        }

        else
        {

          v94(v137, v120);
        }

        (*((void (**)(char *, void))v28 + 2))(v28, 0LL);
      }

      else
      {
        v97 = v155;
        ((void (*)(char *, char *, uint64_t))v29)(v155, v28, v7);
        uint64_t v98 = swift_bridgeObjectRetain_n(v44, 2LL);
        uint64_t v99 = (os_log_s *)Logger.logObject.getter(v98);
        os_log_type_t v100 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v99, v100))
        {
          uint64_t v101 = v7;
          uint64_t v102 = swift_slowAlloc(22LL, -1LL);
          uint64_t v103 = swift_slowAlloc(64LL, -1LL);
          v170[0] = v103;
          *(_DWORD *)uint64_t v102 = 136315394;
          uint64_t v169 = sub_10002F0C4(0xD000000000000038LL, 0x80000001000504C0LL, v170);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v169, v170, v102 + 4, v102 + 12);
          *(_WORD *)(v102 + 12) = 2080;
          swift_bridgeObjectRetain(v44);
          uint64_t v169 = sub_10002F0C4(v167, v44, v170);
          uint64_t v81 = v168;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v169, v170, v102 + 14, v102 + 22);
          swift_bridgeObjectRelease_n(v44, 3LL);
          _os_log_impl((void *)&_mh_execute_header, v99, v100, "%s No message item for GUID %s", (uint8_t *)v102, 0x16u);
          swift_arrayDestroy(v103, 2LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v103, -1LL, -1LL);
          swift_slowDealloc(v102, -1LL, -1LL);

          uint64_t v104 = v97;
          uint64_t v105 = v101;
        }

        else
        {

          swift_bridgeObjectRelease_n(v44, 2LL);
          uint64_t v104 = v97;
          uint64_t v105 = v7;
        }

        v165(v104, v105);
        (*((void (**)(char *, void))v81 + 2))(v81, 0LL);
      }

      return;
    }

    uint64_t v69 = v159;
    ((void (*)(char *, char *, uint64_t))v29)(v159, v28, v7);
    swift_bridgeObjectRetain_n(a2, 2LL);
    uint64_t v70 = v164;
    uint64_t v71 = v7;
    id v72 = v164;
    unint64_t v73 = (os_log_s *)Logger.logObject.getter(v72);
    os_log_type_t v74 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v73, v74))
    {
      uint64_t v75 = swift_slowAlloc(32LL, -1LL);
      NSString v76 = (char **)swift_slowAlloc(8LL, -1LL);
      uint64_t v162 = (char *)swift_slowAlloc(64LL, -1LL);
      v170[0] = (uint64_t)v162;
      *(_DWORD *)uint64_t v75 = 136315650;
      uint64_t v169 = sub_10002F0C4(0xD000000000000038LL, 0x80000001000504C0LL, v170);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v169, v170, v75 + 4, v75 + 12);
      *(_WORD *)(v75 + 12) = 2080;
      swift_bridgeObjectRetain(a2);
      uint64_t v169 = sub_10002F0C4(v167, a2, v170);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v169, v170, v75 + 14, v75 + 22);
      swift_bridgeObjectRelease_n(a2, 3LL);
      *(_WORD *)(v75 + 22) = 2112;
      uint64_t v169 = (uint64_t)v72;
      uint64_t v77 = v72;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v169, v170, v75 + 24, v75 + 32);
      *NSString v76 = v70;

      uint64_t v78 = v168;
      _os_log_impl( (void *)&_mh_execute_header,  v73,  v74,  "%s Message item for GUID %s is not a plugin message. Bailing. %@",  (uint8_t *)v75,  0x20u);
      uint64_t v79 = sub_10002D164(&qword_100070778);
      swift_arrayDestroy(v76, 1LL, v79);
      swift_slowDealloc(v76, -1LL, -1LL);
      id v80 = v162;
      swift_arrayDestroy(v162, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v80, -1LL, -1LL);
      swift_slowDealloc(v75, -1LL, -1LL);

      v165(v159, v166);
    }

    else
    {

      swift_bridgeObjectRelease_n(a2, 2LL);
      v165(v69, v71);
      uint64_t v78 = v168;
    }

    (*((void (**)(char *, void))v78 + 2))(v78, 0LL);
  }

  else
  {
    id v62 = v164;
    ((void (*)(char *, char *, uint64_t))v29)(v164, v28, v7);
    uint64_t v63 = swift_bridgeObjectRetain_n(a2, 2LL);
    unint64_t v64 = (os_log_s *)Logger.logObject.getter(v63);
    os_log_type_t v65 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v64, v65))
    {
      uint64_t v66 = swift_slowAlloc(22LL, -1LL);
      uint64_t v67 = swift_slowAlloc(64LL, -1LL);
      v170[0] = v67;
      *(_DWORD *)uint64_t v66 = 136315394;
      uint64_t v169 = sub_10002F0C4(0xD000000000000038LL, 0x80000001000504C0LL, v170);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v169, v170, v66 + 4, v66 + 12);
      *(_WORD *)(v66 + 12) = 2080;
      swift_bridgeObjectRetain(a2);
      uint64_t v169 = sub_10002F0C4(v39, a2, v170);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v169, v170, v66 + 14, v66 + 22);
      swift_bridgeObjectRelease_n(a2, 3LL);
      _os_log_impl((void *)&_mh_execute_header, v64, v65, "%s No message item for GUID %s", (uint8_t *)v66, 0x16u);
      swift_arrayDestroy(v67, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v67, -1LL, -1LL);
      swift_slowDealloc(v66, -1LL, -1LL);

      os_log_type_t v68 = v164;
    }

    else
    {

      swift_bridgeObjectRelease_n(a2, 2LL);
      os_log_type_t v68 = v62;
    }

    v36(v68, v7);
    (*((void (**)(char *, void))v168 + 2))(v168, 0LL);
  }

id _sSo40IMDaemonChatMessageHistoryRequestHandlerC7imagentE49fetchIncomingPendingMessagesOverSatelliteForChats7withIDs8servicesySaySSG_AGtF_0( id result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (v2)
  {
    uint64_t v4 = (void *)objc_opt_self(&OBJC_CLASS___IMDAccountController);
    swift_bridgeObjectRetain(a2);
    uint64_t v15 = a2;
    for (uint64_t i = (void *)(a2 + 40); ; i += 2)
    {
      uint64_t v7 = *i;
      swift_bridgeObjectRetain(*i);
      uint64_t result = [v4 sharedAccountController];
      if (!result) {
        break;
      }
      uint64_t v8 = result;
      NSString v9 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v7, v10);
      Class v11 = (Class)[v8 anySessionForServiceName:v9];

      if (v11)
      {
        id v12 = -[objc_class service](v11, "service", v15);
        unsigned int v13 = [v12 supportsCapability:IMServiceCapabilityPendingIncomingMessageFetchOverSatellite];

        if (v13)
        {
          Class isa = Array._bridgeToObjectiveC()().super.isa;
          -[objc_class fetchIncomingPendingMessagesFromHandlesIDs:]( v11,  "fetchIncomingPendingMessagesFromHandlesIDs:",  isa);

          Class v11 = isa;
        }
      }

      if (!--v2) {
        return (id)swift_bridgeObjectRelease(v15, v6);
      }
    }

    __break(1u);
  }

  return result;
}

uint64_t sub_10004230C(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release(result);
  }

  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100042354()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_100042380(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10002D164(&qword_100070F38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000423C8(uint64_t a1)
{
  uint64_t v2 = sub_10002D164(&qword_100070F38);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

void sub_100042414(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "No message guid found for message: %@",  (uint8_t *)&v2,  0xCu);
}

void sub_100042488()
{
}

void sub_10004250C()
{
}

void sub_100042590( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000425C4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000425F8(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "Could not create NSInvocation matching XPC request object. Selector %@ not found in XPC interface.",  (uint8_t *)&v2,  0xCu);
}

void sub_10004266C(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Latest item time is nil, can't update chat's lastTUConversationCreatedDate! item: %@",  (uint8_t *)&v2,  0xCu);
}

id objc_msgSend_ID(void *a1, const char *a2, ...)
{
  return _[a1 ID];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend__URIsFromIDs(void *a1, const char *a2, ...)
{
  return _[a1 _URIsFromIDs];
}

id objc_msgSend___imArrayByApplyingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__imArrayByApplyingBlock:");
}

id objc_msgSend___imArrayByFilteringWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__imArrayByFilteringWithBlock:");
}

id objc_msgSend___im_attributedStringByAssigningMessagePartNumbers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__im_attributedStringByAssigningMessagePartNumbers");
}

id objc_msgSend___im_attributedStringWithFileTransfers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__im_attributedStringWithFileTransfers:");
}

id objc_msgSend___im_canonicalIDSIDsFromAddresses(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__im_canonicalIDSIDsFromAddresses");
}

id objc_msgSend___im_dateWithCurrentServerTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__im_dateWithCurrentServerTime");
}

id objc_msgSend___im_nanosecondTimeInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__im_nanosecondTimeInterval");
}

id objc_msgSend___im_visitMessageParts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__im_visitMessageParts:");
}

id objc_msgSend___mainThreadPostNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__mainThreadPostNotificationName:object:");
}

id objc_msgSend__addAccountsToSetupInfo_capabilities_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addAccountsToSetupInfo:capabilities:context:");
}

id objc_msgSend__addApprovedCapabilitiesToSetupInfo_capabilities_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addApprovedCapabilitiesToSetupInfo:capabilities:context:");
}

id objc_msgSend__addChatCountsToSetupInfo_capabilities_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addChatCountsToSetupInfo:capabilities:context:");
}

id objc_msgSend__addChatsToSetupInfo_capabilities_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addChatsToSetupInfo:capabilities:context:");
}

id objc_msgSend__addGroupPhotoTransfersToSetupInfo_capabilities_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addGroupPhotoTransfersToSetupInfo:capabilities:context:");
}

id objc_msgSend__addKeyTransparencyToSetupInfo_capabilities_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addKeyTransparencyToSetupInfo:capabilities:context:");
}

id objc_msgSend__addTransfer_forGUID_shouldNotify_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addTransfer:forGUID:shouldNotify:");
}

id objc_msgSend__addTransfersToSetupInfo_capabilities_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addTransfersToSetupInfo:capabilities:context:");
}

id objc_msgSend__allChatInfo(void *a1, const char *a2, ...)
{
  return _[a1 _allChatInfo];
}

id objc_msgSend__allFileTransfers(void *a1, const char *a2, ...)
{
  return _[a1 _allFileTransfers];
}

id objc_msgSend__attachmentFileSizeUpdateIntervalBagValue(void *a1, const char *a2, ...)
{
  return _[a1 _attachmentFileSizeUpdateIntervalBagValue];
}

id objc_msgSend__automation_markAsReadQuery_finishedWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_automation_markAsReadQuery:finishedWithResult:");
}

id objc_msgSend__automation_sendDictionary_options_toHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_automation_sendDictionary:options:toHandles:");
}

id objc_msgSend__blackholedChatInfoForNumberOfChats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_blackholedChatInfoForNumberOfChats:");
}

id objc_msgSend__broadcastedUncachedAttachmentCountForChatWithGUID_chatIdentifiers_services_broadcaster_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_broadcastedUncachedAttachmentCountForChatWithGUID:chatIdentifiers:services:broadcaster:");
}

id objc_msgSend__cacheChatsWithPinningIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cacheChatsWithPinningIdentifiers:");
}

id objc_msgSend__chatDictionariesWithLastMessageRecordDateFromDictionaries_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_chatDictionariesWithLastMessageRecordDateFromDictionaries:");
}

id objc_msgSend__chatInfoForChats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_chatInfoForChats:");
}

id objc_msgSend__chatInfoForNumberOfChats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_chatInfoForNumberOfChats:");
}

id objc_msgSend__chatSyncingIntervalBagValue(void *a1, const char *a2, ...)
{
  return _[a1 _chatSyncingIntervalBagValue];
}

id objc_msgSend__chatsWithIsBlackholed_inChats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_chatsWithIsBlackholed:inChats:");
}

id objc_msgSend__clientCapabilitiesSupportAccounts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientCapabilitiesSupportAccounts:");
}

id objc_msgSend__downloadPurgedAttachmentsForIDs_style_onServices_chatID_retryCount_broadcaster_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_downloadPurgedAttachmentsForIDs:style:onServices:chatID:retryCount:broadcaster:");
}

id objc_msgSend__enqueueInvocationWithSync_xpcMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enqueueInvocationWithSync:xpcMessage:");
}

id objc_msgSend__forceReloadChats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_forceReloadChats:");
}

id objc_msgSend__forwardMappingPacket_toID_account_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_forwardMappingPacket:toID:account:");
}

id objc_msgSend__handleFileTransfer_acceptedWithPath_autoRename_overwrite_options_postNotification_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleFileTransfer:acceptedWithPath:autoRename:overwrite:options:postNotification:");
}

id objc_msgSend__handleFileTransfer_createdWithProperties_withAuditToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleFileTransfer:createdWithProperties:withAuditToken:");
}

id objc_msgSend__handleFileTransfer_updatedWithProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleFileTransfer:updatedWithProperties:");
}

id objc_msgSend__handleFileTransferRemoved_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleFileTransferRemoved:");
}

id objc_msgSend__handleFileTransferStopped_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleFileTransferStopped:");
}

id objc_msgSend__handleFileTransfers_autoRename_overwrite_options_postNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleFileTransfers:autoRename:overwrite:options:postNotification:");
}

id objc_msgSend__hasFinishedTelemetrySync(void *a1, const char *a2, ...)
{
  return _[a1 _hasFinishedTelemetrySync];
}

id objc_msgSend__loadChat_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadChat:completionHandler:");
}

id objc_msgSend__loadChats_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadChats:completionHandler:");
}

id objc_msgSend__makeDeletePartsDictFor_withIndexes_withIndexToRangeMap_deleteDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_makeDeletePartsDictFor:withIndexes:withIndexToRangeMap:deleteDate:");
}

id objc_msgSend__messageSyncingDelayBagValue(void *a1, const char *a2, ...)
{
  return _[a1 _messageSyncingDelayBagValue];
}

id objc_msgSend__messageSyncingIntervalBagValue(void *a1, const char *a2, ...)
{
  return _[a1 _messageSyncingIntervalBagValue];
}

id objc_msgSend__metricsLoggingUpdateIntervalBagValue(void *a1, const char *a2, ...)
{
  return _[a1 _metricsLoggingUpdateIntervalBagValue];
}

id objc_msgSend__numberOfChatsToLoadDuringInitialSetupFromContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_numberOfChatsToLoadDuringInitialSetupFromContext:");
}

id objc_msgSend__pinnedChatIdentifiersFromContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pinnedChatIdentifiersFromContext:");
}

id objc_msgSend__populateParentMessagesIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_populateParentMessagesIfNeeded:");
}

id objc_msgSend__portDidBecomeInvalid(void *a1, const char *a2, ...)
{
  return _[a1 _portDidBecomeInvalid];
}

id objc_msgSend__precacheChatCountWithCapabilities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_precacheChatCountWithCapabilities:");
}

id objc_msgSend__registerForAttachmentFileSizeUpdate(void *a1, const char *a2, ...)
{
  return _[a1 _registerForAttachmentFileSizeUpdate];
}

id objc_msgSend__registerForAutoLogDump(void *a1, const char *a2, ...)
{
  return _[a1 _registerForAutoLogDump];
}

id objc_msgSend__registerForBackupSyncing(void *a1, const char *a2, ...)
{
  return _[a1 _registerForBackupSyncing];
}

id objc_msgSend__registerForChatSyncing(void *a1, const char *a2, ...)
{
  return _[a1 _registerForChatSyncing];
}

id objc_msgSend__registerForInternalCoreTelephonyNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _registerForInternalCoreTelephonyNotifications];
}

id objc_msgSend__registerForMessageSyncing(void *a1, const char *a2, ...)
{
  return _[a1 _registerForMessageSyncing];
}

id objc_msgSend__registerForMetricsLogging(void *a1, const char *a2, ...)
{
  return _[a1 _registerForMetricsLogging];
}

id objc_msgSend__registerForTelemetrySyncing(void *a1, const char *a2, ...)
{
  return _[a1 _registerForTelemetrySyncing];
}

id objc_msgSend__requestGroupPhotoResendForChatGUID_fromIdentifier_toIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_requestGroupPhotoResendForChatGUID:fromIdentifier:toIdentifier:");
}

id objc_msgSend__retrieveLocalFileURLForFileTransferWithGUID_options_outTransfer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_retrieveLocalFileURLForFileTransferWithGUID:options:outTransfer:");
}

id objc_msgSend__retrieveLocalFileURLForFileTransferWithGUID_options_outTransfer_outError_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_retrieveLocalFileURLForFileTransferWithGUID:options:outTransfer:outError:");
}

id objc_msgSend__serializedFileTransfersForItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serializedFileTransfersForItems:");
}

id objc_msgSend__serviceWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serviceWithName:");
}

id objc_msgSend__setupFileTransferExplicitDownloadNotificationListenersIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _setupFileTransferExplicitDownloadNotificationListenersIfNecessary];
}

id objc_msgSend__shouldContinueDownloadingPurgedAttachments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldContinueDownloadingPurgedAttachments:");
}

id objc_msgSend__stringForChatIDs_onServices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stringForChatIDs:onServices:");
}

id objc_msgSend__updateLastMessageTimeStampForChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLastMessageTimeStampForChat:");
}

id objc_msgSend__updateMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateMessage:");
}

id objc_msgSend__updateParentalSettings(void *a1, const char *a2, ...)
{
  return _[a1 _updateParentalSettings];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_acceptPendingNicknameForHandleID_updateType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptPendingNicknameForHandleID:updateType:");
}

id objc_msgSend_acceptSubscriptionRequest_from_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptSubscriptionRequest:from:");
}

id objc_msgSend_account_avAction_withArguments_toAVChat_isVideo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "account:avAction:withArguments:toAVChat:isVideo:");
}

id objc_msgSend_account_buddyProperties_buddyPictures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "account:buddyProperties:buddyPictures:");
}

id objc_msgSend_account_chat_style_chatProperties_messageUpdated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "account:chat:style:chatProperties:messageUpdated:");
}

id objc_msgSend_account_chat_style_chatProperties_messagesUpdated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "account:chat:style:chatProperties:messagesUpdated:");
}

id objc_msgSend_accountForAccountID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountForAccountID:");
}

id objc_msgSend_accountID(void *a1, const char *a2, ...)
{
  return _[a1 accountID];
}

id objc_msgSend_accountInfoToPost(void *a1, const char *a2, ...)
{
  return _[a1 accountInfoToPost];
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return _[a1 accounts];
}

id objc_msgSend_accountsForService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountsForService:");
}

id objc_msgSend_activateAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateAccount:");
}

id objc_msgSend_activateAccounts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateAccounts:");
}

id objc_msgSend_active(void *a1, const char *a2, ...)
{
  return _[a1 active];
}

id objc_msgSend_activeAccountsForService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeAccountsForService:");
}

id objc_msgSend_activeRecords(void *a1, const char *a2, ...)
{
  return _[a1 activeRecords];
}

id objc_msgSend_activeSessions(void *a1, const char *a2, ...)
{
  return _[a1 activeSessions];
}

id objc_msgSend_addAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAccount:");
}

id objc_msgSend_addAliases_account_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAliases:account:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addHubbleRequestedTransfer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addHubbleRequestedTransfer:");
}

id objc_msgSend_addItem_toChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addItem:toChat:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_aliasToCNIDMap(void *a1, const char *a2, ...)
{
  return _[a1 aliasToCNIDMap];
}

id objc_msgSend_allExistingChatsWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allExistingChatsWithIdentifier:");
}

id objc_msgSend_allExistingChatsWithIdentifier_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allExistingChatsWithIdentifier:style:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allServices(void *a1, const char *a2, ...)
{
  return _[a1 allServices];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_allowHandlesForSharing_onChatGUIDs_fromHandle_forceSend_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowHandlesForSharing:onChatGUIDs:fromHandle:forceSend:");
}

id objc_msgSend_allowListedHandlesForSharing(void *a1, const char *a2, ...)
{
  return _[a1 allowListedHandlesForSharing];
}

id objc_msgSend_allowlist(void *a1, const char *a2, ...)
{
  return _[a1 allowlist];
}

id objc_msgSend_allowlistedClasses(void *a1, const char *a2, ...)
{
  return _[a1 allowlistedClasses];
}

id objc_msgSend_anySessionForServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "anySessionForServiceName:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_archivedNicknames(void *a1, const char *a2, ...)
{
  return _[a1 archivedNicknames];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayByApplyingSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByApplyingSelector:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_associatedMessageGUID(void *a1, const char *a2, ...)
{
  return _[a1 associatedMessageGUID];
}

id objc_msgSend_attachmentsFilteredUsingPredicate_limit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attachmentsFilteredUsingPredicate:limit:");
}

id objc_msgSend_attachmentsWithHandles_onServices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attachmentsWithHandles:onServices:");
}

id objc_msgSend_attachmentsWithRoomNames_onServices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attachmentsWithRoomNames:onServices:");
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return _[a1 auditToken];
}

id objc_msgSend_authenticateAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authenticateAccount:");
}

id objc_msgSend_autoDeletionPreference(void *a1, const char *a2, ...)
{
  return _[a1 autoDeletionPreference];
}

id objc_msgSend_autoLogin(void *a1, const char *a2, ...)
{
  return _[a1 autoLogin];
}

id objc_msgSend_autoReconnect(void *a1, const char *a2, ...)
{
  return _[a1 autoReconnect];
}

id objc_msgSend_beginChatSyncPeriodic_activity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginChatSyncPeriodic:activity:");
}

id objc_msgSend_beginInitialSyncWithActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginInitialSyncWithActivity:");
}

id objc_msgSend_beginPeriodicSyncWithActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginPeriodicSyncWithActivity:");
}

id objc_msgSend_beginPeriodicSyncWithChecks_priority_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginPeriodicSyncWithChecks:priority:reason:");
}

id objc_msgSend_beginUserInitiatedSync(void *a1, const char *a2, ...)
{
  return _[a1 beginUserInitiatedSync];
}

id objc_msgSend_blackholedChats(void *a1, const char *a2, ...)
{
  return _[a1 blackholedChats];
}

id objc_msgSend_blackholedChatsExist(void *a1, const char *a2, ...)
{
  return _[a1 blackholedChatsExist];
}

id objc_msgSend_body(void *a1, const char *a2, ...)
{
  return _[a1 body];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_broadcastCloudKitState(void *a1, const char *a2, ...)
{
  return _[a1 broadcastCloudKitState];
}

id objc_msgSend_broadcastCloudKitStateAfterClearingErrors(void *a1, const char *a2, ...)
{
  return _[a1 broadcastCloudKitStateAfterClearingErrors];
}

id objc_msgSend_broadcastCloudKitStateAfterFetchingAccountStatus(void *a1, const char *a2, ...)
{
  return _[a1 broadcastCloudKitStateAfterFetchingAccountStatus];
}

id objc_msgSend_broadcastCodeStatusToClients(void *a1, const char *a2, ...)
{
  return _[a1 broadcastCodeStatusToClients];
}

id objc_msgSend_broadcasterForACConferenceListeners(void *a1, const char *a2, ...)
{
  return _[a1 broadcasterForACConferenceListeners];
}

id objc_msgSend_broadcasterForAVConferenceListeners(void *a1, const char *a2, ...)
{
  return _[a1 broadcasterForAVConferenceListeners];
}

id objc_msgSend_broadcasterForAccountListeners(void *a1, const char *a2, ...)
{
  return _[a1 broadcasterForAccountListeners];
}

id objc_msgSend_broadcasterForAllListeners(void *a1, const char *a2, ...)
{
  return _[a1 broadcasterForAllListeners];
}

id objc_msgSend_broadcasterForChatListeners(void *a1, const char *a2, ...)
{
  return _[a1 broadcasterForChatListeners];
}

id objc_msgSend_broadcasterForChatListenersUsingBlackholeRegistry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "broadcasterForChatListenersUsingBlackholeRegistry:");
}

id objc_msgSend_broadcasterForCloudSyncListeners(void *a1, const char *a2, ...)
{
  return _[a1 broadcasterForCloudSyncListeners];
}

id objc_msgSend_broadcasterForFileProviderListeners(void *a1, const char *a2, ...)
{
  return _[a1 broadcasterForFileProviderListeners];
}

id objc_msgSend_broadcasterForListenersSupportingService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "broadcasterForListenersSupportingService:");
}

id objc_msgSend_buddyPictures(void *a1, const char *a2, ...)
{
  return _[a1 buddyPictures];
}

id objc_msgSend_buddyProperties(void *a1, const char *a2, ...)
{
  return _[a1 buddyProperties];
}

id objc_msgSend_cacheDeleteEnabled(void *a1, const char *a2, ...)
{
  return _[a1 cacheDeleteEnabled];
}

id objc_msgSend_cachedRampState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachedRampState:");
}

id objc_msgSend_cachedSalt(void *a1, const char *a2, ...)
{
  return _[a1 cachedSalt];
}

id objc_msgSend_cancelScheduledMessageWithGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelScheduledMessageWithGUID:");
}

id objc_msgSend_cancelScheduledMessageWithGUID_destinations_cancelType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelScheduledMessageWithGUID:destinations:cancelType:");
}

id objc_msgSend_cancelVCRequestWithPerson_properties_conference_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelVCRequestWithPerson:properties:conference:reason:");
}

id objc_msgSend_capabilities(void *a1, const char *a2, ...)
{
  return _[a1 capabilities];
}

id objc_msgSend_changeGroup_changes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeGroup:changes:");
}

id objc_msgSend_changeGroups_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeGroups:");
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterSetWithCharactersInString:");
}

id objc_msgSend_chat_lastAddressedHandleUpdated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chat:lastAddressedHandleUpdated:");
}

id objc_msgSend_chat_lastAddressedSIMIDUpdated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chat:lastAddressedSIMIDUpdated:");
}

id objc_msgSend_chat_lastMessageTimeStampOnLoadUpdated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chat:lastMessageTimeStampOnLoadUpdated:");
}

id objc_msgSend_chat_propertiesUpdated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chat:propertiesUpdated:");
}

id objc_msgSend_chat_uncachedAttachmentCountUpdated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chat:uncachedAttachmentCountUpdated:");
}

id objc_msgSend_chatForMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chatForMessage:");
}

id objc_msgSend_chatForMessageGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chatForMessageGUID:");
}

id objc_msgSend_chatForMessageIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chatForMessageIdentifier:");
}

id objc_msgSend_chatIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 chatIdentifier];
}

id objc_msgSend_chatLoadedWithChatIdentifier_chats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chatLoadedWithChatIdentifier:chats:");
}

id objc_msgSend_chatRecord(void *a1, const char *a2, ...)
{
  return _[a1 chatRecord];
}

id objc_msgSend_chatWithGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chatWithGUID:");
}

id objc_msgSend_chats(void *a1, const char *a2, ...)
{
  return _[a1 chats];
}

id objc_msgSend_chatsForMessageGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chatsForMessageGUID:");
}

id objc_msgSend_chatsWithHandle_onService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chatsWithHandle:onService:");
}

id objc_msgSend_chatsWithRoomname_onService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chatsWithRoomname:onService:");
}

id objc_msgSend_cleanUpNicknameForIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanUpNicknameForIDs:");
}

id objc_msgSend_cleanseAttachments(void *a1, const char *a2, ...)
{
  return _[a1 cleanseAttachments];
}

id objc_msgSend_clearAnalyticDefaultsAndLocalSyncState(void *a1, const char *a2, ...)
{
  return _[a1 clearAnalyticDefaultsAndLocalSyncState];
}

id objc_msgSend_clearCKRelatedDefaults(void *a1, const char *a2, ...)
{
  return _[a1 clearCKRelatedDefaults];
}

id objc_msgSend_clearLocalCloudKitSyncState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearLocalCloudKitSyncState:");
}

id objc_msgSend_clearPendingNicknameForHandleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearPendingNicknameForHandleID:");
}

id objc_msgSend_clearPendingNicknamePhotoForHandleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearPendingNicknamePhotoForHandleID:");
}

id objc_msgSend_cloudKitSyncState(void *a1, const char *a2, ...)
{
  return _[a1 cloudKitSyncState];
}

id objc_msgSend_cloudKitSyncingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 cloudKitSyncingEnabled];
}

id objc_msgSend_collectLogsIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 collectLogsIfNeeded];
}

id objc_msgSend_consumeCodeWithGuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "consumeCodeWithGuid:");
}

id objc_msgSend_containsIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsIndex:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contextStamp(void *a1, const char *a2, ...)
{
  return _[a1 contextStamp];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyAsReplied(void *a1, const char *a2, ...)
{
  return _[a1 copyAsReplied];
}

id objc_msgSend_copyFileTransferDictionaryRepresentationsFromCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyFileTransferDictionaryRepresentationsFromCenter:");
}

id objc_msgSend_copyItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyItemAtPath:toPath:error:");
}

id objc_msgSend_copyMessagesThatNeedToBeDeletedInCloudKitWithLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyMessagesThatNeedToBeDeletedInCloudKitWithLimit:");
}

id objc_msgSend_coreSpotlightDeleteAttachmentGUIDs_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coreSpotlightDeleteAttachmentGUIDs:reason:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createAndPersistLivePhotoBundleIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 createAndPersistLivePhotoBundleIfNecessary];
}

id objc_msgSend_createAttachmentZoneIfNeededWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createAttachmentZoneIfNeededWithCompletionBlock:");
}

id objc_msgSend_createChatZoneIfNeededWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createChatZoneIfNeededWithCompletionBlock:");
}

id objc_msgSend_createNewOutgoingTransferWithLocalFileURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createNewOutgoingTransferWithLocalFileURL:");
}

id objc_msgSend_currentContext(void *a1, const char *a2, ...)
{
  return _[a1 currentContext];
}

id objc_msgSend_currentStorageOnDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentStorageOnDevice];
}

id objc_msgSend_currentTelemetryVersion(void *a1, const char *a2, ...)
{
  return _[a1 currentTelemetryVersion];
}

id objc_msgSend_currentlyDownloadingSet(void *a1, const char *a2, ...)
{
  return _[a1 currentlyDownloadingSet];
}

id objc_msgSend_daemonInterface_shouldGrantAccessForPID_auditToken_portName_listenerConnection_setupInfo_setupResponse_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "daemonInterface:shouldGrantAccessForPID:auditToken:portName:listenerConnection:setupInfo:setupResponse:");
}

id objc_msgSend_daemonInterface_shouldGrantPlugInAccessForPID_auditToken_portName_listenerConnection_setupInfo_setupResponse_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "daemonInterface:shouldGrantPlugInAccessForPID:auditToken:portName:listenerConnection:setupInfo:setupResponse:");
}

id objc_msgSend_database(void *a1, const char *a2, ...)
{
  return _[a1 database];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_deactivateAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deactivateAccount:");
}

id objc_msgSend_deactivateAccounts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deactivateAccounts:");
}

id objc_msgSend_declineInvitationToChatID_identifier_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "declineInvitationToChatID:identifier:style:");
}

id objc_msgSend_defaultAccountSettings(void *a1, const char *a2, ...)
{
  return _[a1 defaultAccountSettings];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_deleteAllZones(void *a1, const char *a2, ...)
{
  return _[a1 deleteAllZones];
}

id objc_msgSend_deleteAttachmentZone(void *a1, const char *a2, ...)
{
  return _[a1 deleteAttachmentZone];
}

id objc_msgSend_deleteAttachmentsWithGUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteAttachmentsWithGUIDs:");
}

id objc_msgSend_deleteChatSyncToken(void *a1, const char *a2, ...)
{
  return _[a1 deleteChatSyncToken];
}

id objc_msgSend_deleteChatZone(void *a1, const char *a2, ...)
{
  return _[a1 deleteChatZone];
}

id objc_msgSend_deleteDeDupeRecordZone(void *a1, const char *a2, ...)
{
  return _[a1 deleteDeDupeRecordZone];
}

id objc_msgSend_deleteExitRecordWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteExitRecordWithCompletion:");
}

id objc_msgSend_deleteInteractionsWithChatGUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteInteractionsWithChatGUIDs:");
}

id objc_msgSend_deleteInteractionsWithMessageGUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteInteractionsWithMessageGUIDs:");
}

id objc_msgSend_deleteMessageGUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteMessageGUIDs:");
}

id objc_msgSend_deleteMessagesWithChatIdentifiers_style_onServices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteMessagesWithChatIdentifiers:style:onServices:");
}

id objc_msgSend_deleteMessagesZone(void *a1, const char *a2, ...)
{
  return _[a1 deleteMessagesZone];
}

id objc_msgSend_deleteRecoverableMessageZone(void *a1, const char *a2, ...)
{
  return _[a1 deleteRecoverableMessageZone];
}

id objc_msgSend_deleteUpdateZone(void *a1, const char *a2, ...)
{
  return _[a1 deleteUpdateZone];
}

id objc_msgSend_denyHandlesForSharing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "denyHandlesForSharing:");
}

id objc_msgSend_denyListedHandlesForSharing(void *a1, const char *a2, ...)
{
  return _[a1 denyListedHandlesForSharing];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_deviceInformationString(void *a1, const char *a2, ...)
{
  return _[a1 deviceInformationString];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryRepresentationIncludingLastMessage(void *a1, const char *a2, ...)
{
  return _[a1 dictionaryRepresentationIncludingLastMessage];
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_didAttemptToDisableAllDevicesResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didAttemptToDisableAllDevicesResult:");
}

id objc_msgSend_didFetchCloudKitSyncDebuggingInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFetchCloudKitSyncDebuggingInfo:");
}

id objc_msgSend_didFetchRampState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFetchRampState:");
}

id objc_msgSend_didFetchSyncStateStats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFetchSyncStateStats:");
}

id objc_msgSend_didPerformAdditionalStorageRequiredCheckWithSuccess_additionalStorageRequired_forAccountId_error_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "didPerformAdditionalStorageRequiredCheckWithSuccess:additionalStorageRequired:forAccountId:error:");
}

id objc_msgSend_disableAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disableAccount:");
}

id objc_msgSend_disableAllDevicesWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disableAllDevicesWithCompletion:");
}

id objc_msgSend_disableService(void *a1, const char *a2, ...)
{
  return _[a1 disableService];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return _[a1 displayName];
}

id objc_msgSend_downloadAttachmentAssetsForChatIDs_services_style_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadAttachmentAssetsForChatIDs:services:style:completion:");
}

id objc_msgSend_downloadAttachmentAssetsWithActivity_restoringAttachments_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadAttachmentAssetsWithActivity:restoringAttachments:completion:");
}

id objc_msgSend_downloadedPurgedAssetBatchForChatIDs_completedTransferGUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadedPurgedAssetBatchForChatIDs:completedTransferGUIDs:");
}

id objc_msgSend_dummyMethod(void *a1, const char *a2, ...)
{
  return _[a1 dummyMethod];
}

id objc_msgSend_dumpMOCLoggingMetaData(void *a1, const char *a2, ...)
{
  return _[a1 dumpMOCLoggingMetaData];
}

id objc_msgSend_eagerUploadCancel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eagerUploadCancel:");
}

id objc_msgSend_eagerUploadTransfer_recipients_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eagerUploadTransfer:recipients:");
}

id objc_msgSend_endRecordingReplayDatabase(void *a1, const char *a2, ...)
{
  return _[a1 endRecordingReplayDatabase];
}

id objc_msgSend_enrollDeviceInSMSRelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enrollDeviceInSMSRelay:");
}

id objc_msgSend_enrollSelfDeviceInSMSRelay(void *a1, const char *a2, ...)
{
  return _[a1 enrollSelfDeviceInSMSRelay];
}

id objc_msgSend_enumerateBatchedChatsFilteredUsingPredicate_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateBatchedChatsFilteredUsingPredicate:block:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_estimateQuotaAvailability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "estimateQuotaAvailability:");
}

id objc_msgSend_evalToggleiCloudSettingsSwitch(void *a1, const char *a2, ...)
{
  return _[a1 evalToggleiCloudSettingsSwitch];
}

id objc_msgSend_evaluateAccountStateForFeatureEligibility(void *a1, const char *a2, ...)
{
  return _[a1 evaluateAccountStateForFeatureEligibility];
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_existingChatWithGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "existingChatWithGUID:");
}

id objc_msgSend_existingChatsFilteredUsingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "existingChatsFilteredUsingPredicate:");
}

id objc_msgSend_existingChatsFilteredUsingPredicate_sortedUsingLastMessageDateAscending_olderThan_limit_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "existingChatsFilteredUsingPredicate:sortedUsingLastMessageDateAscending:olderThan:limit:");
}

id objc_msgSend_existingChatsForIDs_displayName_groupID_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "existingChatsForIDs:displayName:groupID:style:");
}

id objc_msgSend_existingChatsWithGroupID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "existingChatsWithGroupID:");
}

id objc_msgSend_existingChatsWithPinningIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "existingChatsWithPinningIdentifier:");
}

id objc_msgSend_existsAtLocalPath(void *a1, const char *a2, ...)
{
  return _[a1 existsAtLocalPath];
}

id objc_msgSend_exitRecordDateWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exitRecordDateWithCompletion:");
}

id objc_msgSend_fetchAccountStatusAndUpdateMiCSwitchEligibility(void *a1, const char *a2, ...)
{
  return _[a1 fetchAccountStatusAndUpdateMiCSwitchEligibility];
}

id objc_msgSend_fetchGroupPhotoPathsForChatsWithGroupIDs_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchGroupPhotoPathsForChatsWithGroupIDs:completionHandler:");
}

id objc_msgSend_fetchLatestRampStateFromCK_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchLatestRampStateFromCK:");
}

id objc_msgSend_fetchLatestRecordKeyFromCKAndCreateIfKeyDoesNotExistWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchLatestRecordKeyFromCKAndCreateIfKeyDoesNotExistWithCompletion:");
}

id objc_msgSend_fetchLatestSaltWithMessageContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchLatestSaltWithMessageContext:");
}

id objc_msgSend_fetchMessageRecordsForChatRecordWithGUID_filteredUsingPredicate_sortedUsingDescriptors_limit_completionHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "fetchMessageRecordsForChatRecordWithGUID:filteredUsingPredicate:sortedUsingDescriptors:limit:completionHandler:");
}

id objc_msgSend_fetchUnreadMessageRecordsForChatsFilteredUsingPredicate_limit_completionHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchUnreadMessageRecordsForChatsFilteredUsingPredicate:limit:completionHandler:");
}

id objc_msgSend_fileTransfer_explicitDownloadSucceededWithPath_livePhotoBundlePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileTransfer:explicitDownloadSucceededWithPath:livePhotoBundlePath:");
}

id objc_msgSend_fileTransferDownloadedSucceededWithLocalURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileTransferDownloadedSucceededWithLocalURL:");
}

id objc_msgSend_fileTransferExplicitDownloadFailed_suggestedRetryGUID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileTransferExplicitDownloadFailed:suggestedRetryGUID:error:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_filterediMessageChatsExist(void *a1, const char *a2, ...)
{
  return _[a1 filterediMessageChatsExist];
}

id objc_msgSend_findCommonCapabilitiesAcrossRecipients_serviceName_capsToCheck_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findCommonCapabilitiesAcrossRecipients:serviceName:capsToCheck:completion:");
}

id objc_msgSend_finishedDownloadingPurgedAssetsForChatIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishedDownloadingPurgedAssetsForChatIDs:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return _[a1 flags];
}

id objc_msgSend_forceAllowlist(void *a1, const char *a2, ...)
{
  return _[a1 forceAllowlist];
}

id objc_msgSend_forcedReloadingChatRegistryWithQueryID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "forcedReloadingChatRegistryWithQueryID:");
}

id objc_msgSend_frequentRepliesForForChatIdentifiers_onServices_limit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "frequentRepliesForForChatIdentifiers:onServices:limit:");
}

id objc_msgSend_groupID(void *a1, const char *a2, ...)
{
  return _[a1 groupID];
}

id objc_msgSend_guid(void *a1, const char *a2, ...)
{
  return _[a1 guid];
}

id objc_msgSend_handledNicknames(void *a1, const char *a2, ...)
{
  return _[a1 handledNicknames];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_historicalMessageGUIDsDeleted_chatGUIDs_queryID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "historicalMessageGUIDsDeleted:chatGUIDs:queryID:");
}

id objc_msgSend_historyQuery_chatID_services_finishedWithResult_limit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "historyQuery:chatID:services:finishedWithResult:limit:");
}

id objc_msgSend_holdBuddyUpdates(void *a1, const char *a2, ...)
{
  return _[a1 holdBuddyUpdates];
}

id objc_msgSend_ignorePendingNicknameForHandleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ignorePendingNicknameForHandleID:");
}

id objc_msgSend_ignoredRecords(void *a1, const char *a2, ...)
{
  return _[a1 ignoredRecords];
}

id objc_msgSend_informOfCancelledScheduledMessageSendWithMessageGUID_sentSuccessfully_error_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "informOfCancelledScheduledMessageSendWithMessageGUID:sentSuccessfully:error:");
}

id objc_msgSend_informOfDeletedConversationWithReceiverHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "informOfDeletedConversationWithReceiverHandles:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:");
}

id objc_msgSend_initWithSender_time_body_attributes_fileTransferGUIDs_flags_error_guid_associatedMessageGUID_associatedMessageType_associatedMessageRange_messageSummaryInfo_threadIdentifier_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:associatedMessageGUID:associatedMessag eType:associatedMessageRange:messageSummaryInfo:threadIdentifier:");
}

id objc_msgSend_initWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUnsignedInteger:");
}

id objc_msgSend_initiateSync_forceRunNow_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initiateSync:forceRunNow:reply:");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_internalName(void *a1, const char *a2, ...)
{
  return _[a1 internalName];
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return _[a1 invertedSet];
}

id objc_msgSend_invitePersonInfo_withMessage_toChatID_identifier_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invitePersonInfo:withMessage:toChatID:identifier:style:");
}

id objc_msgSend_isAVLessSharePlayEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isAVLessSharePlayEnabled];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return _[a1 isActive];
}

id objc_msgSend_isAssociatedMessageItem(void *a1, const char *a2, ...)
{
  return _[a1 isAssociatedMessageItem];
}

id objc_msgSend_isBlackholed(void *a1, const char *a2, ...)
{
  return _[a1 isBlackholed];
}

id objc_msgSend_isBusinessChat(void *a1, const char *a2, ...)
{
  return _[a1 isBusinessChat];
}

id objc_msgSend_isCorrupt(void *a1, const char *a2, ...)
{
  return _[a1 isCorrupt];
}

id objc_msgSend_isDeletingIncomingMessages(void *a1, const char *a2, ...)
{
  return _[a1 isDeletingIncomingMessages];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToIgnoringCase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToIgnoringCase:");
}

id objc_msgSend_isEqualToSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToSet:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFromMe(void *a1, const char *a2, ...)
{
  return _[a1 isFromMe];
}

id objc_msgSend_isInternalInstall(void *a1, const char *a2, ...)
{
  return _[a1 isInternalInstall];
}

id objc_msgSend_isLoading(void *a1, const char *a2, ...)
{
  return _[a1 isLoading];
}

id objc_msgSend_isMessageAcknowledgment(void *a1, const char *a2, ...)
{
  return _[a1 isMessageAcknowledgment];
}

id objc_msgSend_isMessagesIniCloudVersion2(void *a1, const char *a2, ...)
{
  return _[a1 isMessagesIniCloudVersion2];
}

id objc_msgSend_isMessagesInstalled(void *a1, const char *a2, ...)
{
  return _[a1 isMessagesInstalled];
}

id objc_msgSend_isOlderThanItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isOlderThanItem:");
}

id objc_msgSend_isSticker(void *a1, const char *a2, ...)
{
  return _[a1 isSticker];
}

id objc_msgSend_itemWithGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemWithGUID:");
}

id objc_msgSend_itemsWithHandles_onServices_messageGUID_limit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemsWithHandles:onServices:messageGUID:limit:");
}

id objc_msgSend_itemsWithHandles_onServices_messageGUID_numberOfMessagesBefore_numberOfMessagesAfter_threadIdentifier_hasMessagesBefore_hasMessagesAfter_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "itemsWithHandles:onServices:messageGUID:numberOfMessagesBefore:numberOfMessagesAfter:threadIdentifier:hasMess agesBefore:hasMessagesAfter:");
}

id objc_msgSend_itemsWithHandles_onServices_messageGUID_threadIdentifier_limit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemsWithHandles:onServices:messageGUID:threadIdentifier:limit:");
}

id objc_msgSend_itemsWithRoomNames_onServices_messageGUID_threadIdentifier_limit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemsWithRoomNames:onServices:messageGUID:threadIdentifier:limit:");
}

id objc_msgSend_joinChatID_handleInfo_identifier_style_groupID_lastAddressedHandle_lastAddressedSIMID_joinProperties_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "joinChatID:handleInfo:identifier:style:groupID:lastAddressedHandle:lastAddressedSIMID:joinProperties:");
}

id objc_msgSend_lastAddressedLocalHandle(void *a1, const char *a2, ...)
{
  return _[a1 lastAddressedLocalHandle];
}

id objc_msgSend_lastFailedMessageDate(void *a1, const char *a2, ...)
{
  return _[a1 lastFailedMessageDate];
}

id objc_msgSend_lastMessage(void *a1, const char *a2, ...)
{
  return _[a1 lastMessage];
}

id objc_msgSend_lastMessageForChatWithRowID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastMessageForChatWithRowID:");
}

id objc_msgSend_lastMessageTimeStampOnLoad(void *a1, const char *a2, ...)
{
  return _[a1 lastMessageTimeStampOnLoad];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_lastScheduledMessageCreatedDate(void *a1, const char *a2, ...)
{
  return _[a1 lastScheduledMessageCreatedDate];
}

id objc_msgSend_lastTUConversationCreatedDate(void *a1, const char *a2, ...)
{
  return _[a1 lastTUConversationCreatedDate];
}

id objc_msgSend_lastTUConversationItemForChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastTUConversationItemForChat:");
}

id objc_msgSend_leaveChat_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leaveChat:style:");
}

id objc_msgSend_leftChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leftChat:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_listenerID(void *a1, const char *a2, ...)
{
  return _[a1 listenerID];
}

id objc_msgSend_loadAttachmentsForChatWithGUID_chatIdentifiers_style_services_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadAttachmentsForChatWithGUID:chatIdentifiers:style:services:reply:");
}

id objc_msgSend_loadChatWithGUID_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadChatWithGUID:reply:");
}

id objc_msgSend_loadChatsFilteredUsingPredicate_lastMessageOlderThan_limit_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadChatsFilteredUsingPredicate:lastMessageOlderThan:limit:reply:");
}

id objc_msgSend_loadChatsFilteredUsingPredicate_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadChatsFilteredUsingPredicate:reply:");
}

id objc_msgSend_loadChatsWithGroupID_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadChatsWithGroupID:reply:");
}

id objc_msgSend_loadChatsWithHandleIDs_groupID_displayName_style_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadChatsWithHandleIDs:groupID:displayName:style:reply:");
}

id objc_msgSend_loadChatsWithIdentifier_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadChatsWithIdentifier:reply:");
}

id objc_msgSend_loadConsumedSessionPayloadsForItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadConsumedSessionPayloadsForItems:");
}

id objc_msgSend_loadFrequentRepliesForChatWithGUID_chatIdentifiers_style_services_limit_reply_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadFrequentRepliesForChatWithGUID:chatIdentifiers:style:services:limit:reply:");
}

id objc_msgSend_loadHistoryForChatWithGUID_chatIdentifiers_style_services_limit_beforeGUID_afterGUID_threadIdentifier_reply_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "loadHistoryForChatWithGUID:chatIdentifiers:style:services:limit:beforeGUID:afterGUID:threadIdentifier:reply:");
}

id objc_msgSend_loadIsDownloadingPurgedAttachmentsForChatWithGUID_chatIdentifiers_style_services_reply_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadIsDownloadingPurgedAttachmentsForChatWithGUID:chatIdentifiers:style:services:reply:");
}

id objc_msgSend_loadPagedHistoryAroundMessageWithGUID_chatGUID_chatIdentifiers_style_services_numberOfMessagesBefore_numberOfMessagesAfter_threadIdentifier_reply_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "loadPagedHistoryAroundMessageWithGUID:chatGUID:chatIdentifiers:style:services:numberOfMessagesBefore:numberOf MessagesAfter:threadIdentifier:reply:");
}

id objc_msgSend_loadUncachedAttachmentCountForChatWithGUID_chatIdentifiers_style_services_reply_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadUncachedAttachmentCountForChatWithGUID:chatIdentifiers:style:services:reply:");
}

id objc_msgSend_loadUnreadHistoryForChatWithGUID_chatIdentifiers_style_services_limit_fallbackMessageGUID_reply_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "loadUnreadHistoryForChatWithGUID:chatIdentifiers:style:services:limit:fallbackMessageGUID:reply:");
}

id objc_msgSend_loadedChats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadedChats:");
}

id objc_msgSend_loadedRecoverableMessagesMetadata_queryID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadedRecoverableMessagesMetadata:queryID:");
}

id objc_msgSend_localPath(void *a1, const char *a2, ...)
{
  return _[a1 localPath];
}

id objc_msgSend_logCloudKitAnalytics(void *a1, const char *a2, ...)
{
  return _[a1 logCloudKitAnalytics];
}

id objc_msgSend_logDumpAndSendMessageTo_forHours_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logDumpAndSendMessageTo:forHours:reason:");
}

id objc_msgSend_login(void *a1, const char *a2, ...)
{
  return _[a1 login];
}

id objc_msgSend_logout(void *a1, const char *a2, ...)
{
  return _[a1 logout];
}

id objc_msgSend_makeObjectsPerformSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeObjectsPerformSelector:");
}

id objc_msgSend_markAllNicknamesAsPending(void *a1, const char *a2, ...)
{
  return _[a1 markAllNicknamesAsPending];
}

id objc_msgSend_markAsSpamForIDs_style_onServices_chatID_queryID_autoReport_isJunkReportedToCarrier_reportReason_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "markAsSpamForIDs:style:onServices:chatID:queryID:autoReport:isJunkReportedToCarrier:reportReason:");
}

id objc_msgSend_markAsSpamQuery_chatID_services_finishedWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markAsSpamQuery:chatID:services:finishedWithResult:");
}

id objc_msgSend_markAttachment_sender_recipients_isIncoming_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markAttachment:sender:recipients:isIncoming:");
}

id objc_msgSend_markChatAsSpamWithGUID_chatIdentifiers_style_services_isAutoReport_isJunkReportedToCarrier_reportReason_reply_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "markChatAsSpamWithGUID:chatIdentifiers:style:services:isAutoReport:isJunkReportedToCarrier:reportReason:reply:");
}

id objc_msgSend_markMessageAsReadWithGUID_callerOrigin_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markMessageAsReadWithGUID:callerOrigin:reply:");
}

id objc_msgSend_markMessageGUIDUnread_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markMessageGUIDUnread:");
}

id objc_msgSend_markMessageRecordsAsReadWithGUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markMessageRecordsAsReadWithGUIDs:");
}

id objc_msgSend_markMessagesAsReadWithChatGUIDs_upToGUID_readDate_fromMe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markMessagesAsReadWithChatGUIDs:upToGUID:readDate:fromMe:");
}

id objc_msgSend_markMessagesAsReadWithIdentifiers_onServices_chatStyle_upToGUID_readDate_fromMe_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markMessagesAsReadWithIdentifiers:onServices:chatStyle:upToGUID:readDate:fromMe:");
}

id objc_msgSend_markNicknamesAsTransitionedForHandleIDs_isAutoUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markNicknamesAsTransitionedForHandleIDs:isAutoUpdate:");
}

id objc_msgSend_markPlayedForIDs_style_onServices_message_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markPlayedForIDs:style:onServices:message:");
}

id objc_msgSend_markProfileRecords_asActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markProfileRecords:asActive:");
}

id objc_msgSend_markProfileRecordsAsIgnored_broadcastUpdates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markProfileRecordsAsIgnored:broadcastUpdates:");
}

id objc_msgSend_markReadForMessageGUID_callerOrigin_queryID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markReadForMessageGUID:callerOrigin:queryID:");
}

id objc_msgSend_markSavedForIDs_style_onServices_message_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markSavedForIDs:style:onServices:message:");
}

id objc_msgSend_markedAsReadForMessageGUID_success_queryID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markedAsReadForMessageGUID:success:queryID:");
}

id objc_msgSend_messageHistorySummaryForDateInterval_chatIdentifiers_chatStyle_services_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageHistorySummaryForDateInterval:chatIdentifiers:chatStyle:services:");
}

id objc_msgSend_messageID(void *a1, const char *a2, ...)
{
  return _[a1 messageID];
}

id objc_msgSend_messageItemQuery_finishedWithResult_chatGUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageItemQuery:finishedWithResult:chatGUIDs:");
}

id objc_msgSend_messagePartBody(void *a1, const char *a2, ...)
{
  return _[a1 messagePartBody];
}

id objc_msgSend_messagePartIndex(void *a1, const char *a2, ...)
{
  return _[a1 messagePartIndex];
}

id objc_msgSend_messageQuery_finishedWithResult_chatGUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageQuery:finishedWithResult:chatGUIDs:");
}

id objc_msgSend_messageSummarizationEnabled(void *a1, const char *a2, ...)
{
  return _[a1 messageSummarizationEnabled];
}

id objc_msgSend_messageWithGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageWithGUID:");
}

id objc_msgSend_messageWithGUID_registerAttachments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageWithGUID:registerAttachments:");
}

id objc_msgSend_messagesThatNeedSyncWithCloudKitWithFilter_limit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messagesThatNeedSyncWithCloudKitWithFilter:limit:");
}

id objc_msgSend_messagesWithGUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messagesWithGUIDs:");
}

id objc_msgSend_metricAttachmentsToPurge_withActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricAttachmentsToPurge:withActivity:");
}

id objc_msgSend_modificationStamp(void *a1, const char *a2, ...)
{
  return _[a1 modificationStamp];
}

id objc_msgSend_moveMessagesInChatsWithGUIDsToRecentlyDeleted_deleteDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveMessagesInChatsWithGUIDsToRecentlyDeleted:deleteDate:");
}

id objc_msgSend_moveMessagesWithGUIDsToRecentlyDeleted_deleteDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveMessagesWithGUIDsToRecentlyDeleted:deleteDate:");
}

id objc_msgSend_movedMessagesToRecentlyDeletedForChatsWithGUIDs_queryID_deletionDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "movedMessagesToRecentlyDeletedForChatsWithGUIDs:queryID:deletionDate:");
}

id objc_msgSend_movedMessagesToRecentlyDeletedWithQueryID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "movedMessagesToRecentlyDeletedWithQueryID:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_networkDataAvailabilityChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "networkDataAvailabilityChanged:");
}

id objc_msgSend_networkDataAvailable(void *a1, const char *a2, ...)
{
  return _[a1 networkDataAvailable];
}

id objc_msgSend_newAccountWithAccountDefaults_accountID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newAccountWithAccountDefaults:accountID:");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedChar:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_oldestMessageDateForChatIdentifiers_chatStyle_services_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "oldestMessageDateForChatIdentifiers:chatStyle:services:");
}

id objc_msgSend_onboardDeleteVerificationCodesIfNeededWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onboardDeleteVerificationCodesIfNeededWithCompletionHandler:");
}

id objc_msgSend_onboardDeleteVerificationCodesIfNeededWithMessage_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onboardDeleteVerificationCodesIfNeededWithMessage:completionHandler:");
}

id objc_msgSend_overrideStorageControllerWithDatabaseFromPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "overrideStorageControllerWithDatabaseFromPath:");
}

id objc_msgSend_pagedHistoryQuery_chatID_services_numberOfMessagesBefore_numberOfMessagesAfter_finishedWithResult_hasMessagesBefore_hasMessagesAfter_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "pagedHistoryQuery:chatID:services:numberOfMessagesBefore:numberOfMessagesAfter:finishedWithResult:hasMessages Before:hasMessagesAfter:");
}

id objc_msgSend_participantHandles(void *a1, const char *a2, ...)
{
  return _[a1 participantHandles];
}

id objc_msgSend_participants(void *a1, const char *a2, ...)
{
  return _[a1 participants];
}

id objc_msgSend_passwordUpdatedWithAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "passwordUpdatedWithAccount:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pendingNicknameUpdates(void *a1, const char *a2, ...)
{
  return _[a1 pendingNicknameUpdates];
}

id objc_msgSend_performInitialSyncOnFirstConnectionOfImagentIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 performInitialSyncOnFirstConnectionOfImagentIfNeeded];
}

id objc_msgSend_permanentlyDeleteRecoverableMessagesInChatsWithGUIDs_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "permanentlyDeleteRecoverableMessagesInChatsWithGUIDs:completionHandler:");
}

id objc_msgSend_permanentlyDeletedMessagesInChatsWithDeletedChatGUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "permanentlyDeletedMessagesInChatsWithDeletedChatGUIDs:");
}

id objc_msgSend_permanentlyDeletedMessagesInChatsWithDeletedChatGUIDs_queryID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "permanentlyDeletedMessagesInChatsWithDeletedChatGUIDs:queryID:");
}

id objc_msgSend_persistentProperties(void *a1, const char *a2, ...)
{
  return _[a1 persistentProperties];
}

id objc_msgSend_personCentricGroupedChatsArrayWithMaximumNumberOfChats_skipsLastMessageLoading_usingChats_useCachedChatGroups_includingPinnedChatIdentifiers_repairInconsistentMergedChats_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "personCentricGroupedChatsArrayWithMaximumNumberOfChats:skipsLastMessageLoading:usingChats:useCachedChatGroups :includingPinnedChatIdentifiers:repairInconsistentMergedChats:");
}

id objc_msgSend_personalNickname(void *a1, const char *a2, ...)
{
  return _[a1 personalNickname];
}

id objc_msgSend_playMessageSentSoundIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playMessageSentSoundIfNeeded:");
}

id objc_msgSend_postCoreAutomationNotificationFinishedPurgingAttachments_withErrorString_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postCoreAutomationNotificationFinishedPurgingAttachments:withErrorString:");
}

id objc_msgSend_postCoreAutomationNotificationWithAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postCoreAutomationNotificationWithAction:");
}

id objc_msgSend_preWarm(void *a1, const char *a2, ...)
{
  return _[a1 preWarm];
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_previouslyBlackholedChatLoadedWithHandleIDs_chat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "previouslyBlackholedChatLoadedWithHandleIDs:chat:");
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return _[a1 properties];
}

id objc_msgSend_protocol(void *a1, const char *a2, ...)
{
  return _[a1 protocol];
}

id objc_msgSend_protocolChecker(void *a1, const char *a2, ...)
{
  return _[a1 protocolChecker];
}

id objc_msgSend_purgeAttachments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purgeAttachments:");
}

id objc_msgSend_purgedAttachmentsCountForChatsWithChatIdentifiers_services_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purgedAttachmentsCountForChatsWithChatIdentifiers:services:");
}

id objc_msgSend_qosClassWhileServicingRequestsResponse_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "qosClassWhileServicingRequestsResponse:identifier:");
}

id objc_msgSend_rampStateDictionaryFromPromoted_featureHadServerError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rampStateDictionaryFromPromoted:featureHadServerError:");
}

id objc_msgSend_readServerCountsFromDefaults(void *a1, const char *a2, ...)
{
  return _[a1 readServerCountsFromDefaults];
}

id objc_msgSend_rebuildLastFailedMessageDate(void *a1, const char *a2, ...)
{
  return _[a1 rebuildLastFailedMessageDate];
}

id objc_msgSend_rebuildUnreadMessageCount(void *a1, const char *a2, ...)
{
  return _[a1 rebuildUnreadMessageCount];
}

id objc_msgSend_recordMetricIsCloudKitEnabled(void *a1, const char *a2, ...)
{
  return _[a1 recordMetricIsCloudKitEnabled];
}

id objc_msgSend_recoverMessagesWithChatGUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recoverMessagesWithChatGUIDs:");
}

id objc_msgSend_recoverableMessagesMetadata(void *a1, const char *a2, ...)
{
  return _[a1 recoverableMessagesMetadata];
}

id objc_msgSend_recoveredMessagesWithChatGUIDs_queryID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recoveredMessagesWithChatGUIDs:queryID:");
}

id objc_msgSend_reflectMarkUnreadToPeerDevicesForMessageGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reflectMarkUnreadToPeerDevicesForMessageGUID:");
}

id objc_msgSend_regenerateTransfersForMessage_inChat_addingAssetWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "regenerateTransfersForMessage:inChat:addingAssetWithUUID:");
}

id objc_msgSend_registerAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerAccount:");
}

id objc_msgSend_registerCloudSyncDependencies(void *a1, const char *a2, ...)
{
  return _[a1 registerCloudSyncDependencies];
}

id objc_msgSend_registration(void *a1, const char *a2, ...)
{
  return _[a1 registration];
}

id objc_msgSend_relay_sendCancel_toPerson_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relay:sendCancel:toPerson:");
}

id objc_msgSend_relay_sendInitateRequest_toPerson_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relay:sendInitateRequest:toPerson:");
}

id objc_msgSend_relay_sendUpdate_toPerson_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relay:sendUpdate:toPerson:");
}

id objc_msgSend_removeAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAccount:");
}

id objc_msgSend_removeAliases_account_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAliases:account:");
}

id objc_msgSend_removeChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeChat:");
}

id objc_msgSend_removeChatID_identifier_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeChatID:identifier:style:");
}

id objc_msgSend_removeIMDHandleFromRegistry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeIMDHandleFromRegistry:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removePersonInfo_chatID_identifier_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePersonInfo:chatID:identifier:style:");
}

id objc_msgSend_renameGroup_to_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renameGroup:to:");
}

id objc_msgSend_replayMessagesWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replayMessagesWithCompletion:");
}

id objc_msgSend_replyProxy(void *a1, const char *a2, ...)
{
  return _[a1 replyProxy];
}

id objc_msgSend_reportMOCDebuggingErrorWithString_internalOnly_initialSync_sendToHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportMOCDebuggingErrorWithString:internalOnly:initialSync:sendToHandle:");
}

id objc_msgSend_requestGroups(void *a1, const char *a2, ...)
{
  return _[a1 requestGroups];
}

id objc_msgSend_requestProperty_ofPerson_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestProperty:ofPerson:");
}

id objc_msgSend_requestSubscriptionTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestSubscriptionTo:");
}

id objc_msgSend_requestVCWithPerson_properties_conference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestVCWithPerson:properties:conference:");
}

id objc_msgSend_resetCKSyncState(void *a1, const char *a2, ...)
{
  return _[a1 resetCKSyncState];
}

id objc_msgSend_respondToVCInvitationWithPerson_properties_conference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "respondToVCInvitationWithPerson:properties:conference:");
}

id objc_msgSend_restoreDefaultStoreControllerInstance(void *a1, const char *a2, ...)
{
  return _[a1 restoreDefaultStoreControllerInstance];
}

id objc_msgSend_resumeBuddyUpdates(void *a1, const char *a2, ...)
{
  return _[a1 resumeBuddyUpdates];
}

id objc_msgSend_retractPostedNotificationsForMessageGUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retractPostedNotificationsForMessageGUIDs:");
}

id objc_msgSend_retractPostedNotificationsForMessagesMatchingChatGUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retractPostedNotificationsForMessagesMatchingChatGUIDs:");
}

id objc_msgSend_retryGroupPhotoUpload_toChatID_identifier_style_account_isPhotoRefresh_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retryGroupPhotoUpload:toChatID:identifier:style:account:isPhotoRefresh:");
}

id objc_msgSend_rowID(void *a1, const char *a2, ...)
{
  return _[a1 rowID];
}

id objc_msgSend_schedulePeriodicSyncWithDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "schedulePeriodicSyncWithDelegate:");
}

id objc_msgSend_scheduleTelemetrySyncWithDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleTelemetrySyncWithDelegate:");
}

id objc_msgSend_scheduleType(void *a1, const char *a2, ...)
{
  return _[a1 scheduleType];
}

id objc_msgSend_searchableIndex_reindexAllSearchableItemsWithAcknowledgementHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "searchableIndex:reindexAllSearchableItemsWithAcknowledgementHandler:");
}

id objc_msgSend_sendAVMessageToPerson_sessionID_type_userInfo_conference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendAVMessageToPerson:sessionID:type:userInfo:conference:");
}

id objc_msgSend_sendBalloonPayload_attachments_withMessageGUID_bundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendBalloonPayload:attachments:withMessageGUID:bundleID:");
}

id objc_msgSend_sendCommand_withProperties_toPerson_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendCommand:withProperties:toPerson:");
}

id objc_msgSend_sendCommand_withProperties_toPerson_toChatID_identifier_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendCommand:withProperties:toPerson:toChatID:identifier:style:");
}

id objc_msgSend_sendCounterProposalToPerson_properties_conference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendCounterProposalToPerson:properties:conference:");
}

id objc_msgSend_sendDeleteCommand_forChatGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendDeleteCommand:forChatGUID:");
}

id objc_msgSend_sendEditedMessage_previousMessage_partIndex_editType_toChatIdentifier_style_account_backwardCompatabilityText_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "sendEditedMessage:previousMessage:partIndex:editType:toChatIdentifier:style:account:backwardCompatabilityText:");
}

id objc_msgSend_sendEditedScheduledMessage_previousMessage_partIndex_editType_toChatIdentifier_style_account_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "sendEditedScheduledMessage:previousMessage:partIndex:editType:toChatIdentifier:style:account:");
}

id objc_msgSend_sendEditedScheduledMessage_previousMessage_retractingPartIndexes_toChatIdentifier_style_account_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "sendEditedScheduledMessage:previousMessage:retractingPartIndexes:toChatIdentifier:style:account:");
}

id objc_msgSend_sendGroupPhotoUpdate_toChatID_identifier_style_account_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendGroupPhotoUpdate:toChatID:identifier:style:account:");
}

id objc_msgSend_sendJunkReportMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendJunkReportMessage:");
}

id objc_msgSend_sendLazuliSpamReport_isBot_spamType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendLazuliSpamReport:isBot:spamType:");
}

id objc_msgSend_sendMessage_toChatID_identifier_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMessage:toChatID:identifier:style:");
}

id objc_msgSend_sendNameOnlyToHandleIDs_fromHandleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendNameOnlyToHandleIDs:fromHandleID:");
}

id objc_msgSend_sendNicknamePreferencesDidChange(void *a1, const char *a2, ...)
{
  return _[a1 sendNicknamePreferencesDidChange];
}

id objc_msgSend_sendNotificationMessageToUniqueID_withCommmand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendNotificationMessageToUniqueID:withCommmand:");
}

id objc_msgSend_sendNotifyRecipientCommandForMessage_toChatGuid_identifier_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendNotifyRecipientCommandForMessage:toChatGuid:identifier:style:");
}

id objc_msgSend_sendPlayedReceiptForMessage_toChatID_identifier_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendPlayedReceiptForMessage:toChatID:identifier:style:");
}

id objc_msgSend_sendReadReceiptForMessage_toChatID_identifier_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendReadReceiptForMessage:toChatID:identifier:style:");
}

id objc_msgSend_sendRecoverCommand_forChatGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendRecoverCommand:forChatGUID:");
}

id objc_msgSend_sendRepositionStickerMessage_chatIdentifier_accountID_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendRepositionStickerMessage:chatIdentifier:accountID:style:");
}

id objc_msgSend_sendRestoreFailuresLogDumps(void *a1, const char *a2, ...)
{
  return _[a1 sendRestoreFailuresLogDumps];
}

id objc_msgSend_sendRestoreFailuresLogDumpsIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 sendRestoreFailuresLogDumpsIfNeeded];
}

id objc_msgSend_sendSavedReceiptForMessage_toChatID_identifier_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendSavedReceiptForMessage:toChatID:identifier:style:");
}

id objc_msgSend_sendSyndicationAction_toChatsWithIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendSyndicationAction:toChatsWithIdentifiers:");
}

id objc_msgSend_sendVCUpdate_toPerson_conference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendVCUpdate:toPerson:conference:");
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return _[a1 service];
}

id objc_msgSend_serviceDefaultsForSetup(void *a1, const char *a2, ...)
{
  return _[a1 serviceDefaultsForSetup];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return _[a1 serviceName];
}

id objc_msgSend_serviceProperties(void *a1, const char *a2, ...)
{
  return _[a1 serviceProperties];
}

id objc_msgSend_serviceSession(void *a1, const char *a2, ...)
{
  return _[a1 serviceSession];
}

id objc_msgSend_serviceWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceWithName:");
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return _[a1 session];
}

id objc_msgSend_sessionForAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionForAccount:");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAllowList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowList:");
}

id objc_msgSend_setAllowlist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowlist:");
}

id objc_msgSend_setAutoDeletionPreference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoDeletionPreference:");
}

id objc_msgSend_setBlockIdleStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBlockIdleStatus:");
}

id objc_msgSend_setBlockList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBlockList:");
}

id objc_msgSend_setBlockingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBlockingMode:");
}

id objc_msgSend_setCloudKitEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCloudKitEnabled:");
}

id objc_msgSend_setExpireState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpireState:");
}

id objc_msgSend_setFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFlags:");
}

id objc_msgSend_setIsSticker_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsSticker:");
}

id objc_msgSend_setLastMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastMessage:");
}

id objc_msgSend_setLastMessageTimeStampOnLoad_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastMessageTimeStampOnLoad:");
}

id objc_msgSend_setLastTUConversationCreatedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastTUConversationCreatedDate:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPersonalNickname_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersonalNickname:completionBlock:");
}

id objc_msgSend_setProperties_ofParticipant_inChatID_identifier_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperties:ofParticipant:inChatID:identifier:style:");
}

id objc_msgSend_setShouldPostNotifications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldPostNotifications:");
}

id objc_msgSend_setStickerUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStickerUserInfo:");
}

id objc_msgSend_setSyncCancelled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSyncCancelled:");
}

id objc_msgSend_setTimeExpressiveSendPlayed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeExpressiveSendPlayed:");
}

id objc_msgSend_setTimePlayed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimePlayed:");
}

id objc_msgSend_setValue_forDomain_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forDomain:forKey:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setValue_ofPersistentProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:ofPersistentProperty:");
}

id objc_msgSend_setValue_ofProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:ofProperty:");
}

id objc_msgSend_setValue_ofProperty_ofPerson_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:ofProperty:ofPerson:");
}

id objc_msgSend_setWasDisabledAutomatically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWasDisabledAutomatically:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setupInfo(void *a1, const char *a2, ...)
{
  return _[a1 setupInfo];
}

id objc_msgSend_sharedAccountController(void *a1, const char *a2, ...)
{
  return _[a1 sharedAccountController];
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return _[a1 sharedController];
}

id objc_msgSend_sharedCoordinator(void *a1, const char *a2, ...)
{
  return _[a1 sharedCoordinator];
}

id objc_msgSend_sharedFeatureFlags(void *a1, const char *a2, ...)
{
  return _[a1 sharedFeatureFlags];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedInstanceForBagType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstanceForBagType:");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_sharedProvider(void *a1, const char *a2, ...)
{
  return _[a1 sharedProvider];
}

id objc_msgSend_sharedUtilities(void *a1, const char *a2, ...)
{
  return _[a1 sharedUtilities];
}

id objc_msgSend_simulateMessageReceive_serviceName_groupID_handles_sender_date_associatedMessageType_associatedMessageGuid_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "simulateMessageReceive:serviceName:groupID:handles:sender:date:associatedMessageType:associatedMessageGuid:");
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorWithKey:ascending:");
}

id objc_msgSend_startRecordingReplayDatabase(void *a1, const char *a2, ...)
{
  return _[a1 startRecordingReplayDatabase];
}

id objc_msgSend_startTimingForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startTimingForKey:");
}

id objc_msgSend_startTrackingCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startTrackingCode:");
}

id objc_msgSend_startWatchingBuddy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startWatchingBuddy:");
}

id objc_msgSend_stopTimingForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopTimingForKey:");
}

id objc_msgSend_stopWatchingBuddy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopWatchingBuddy:");
}

id objc_msgSend_storeItem_forceReplace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeItem:forceReplace:");
}

id objc_msgSend_storeMessage_forceReplace_modifyError_modifyFlags_flagMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:");
}

id objc_msgSend_storeMessage_forceReplace_modifyError_modifyFlags_flagMask_updateMessageCache_calculateUnreadCount_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:");
}

id objc_msgSend_storeRecoverableMessagePartWithBody_forMessageWithGUID_deleteDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeRecoverableMessagePartWithBody:forMessageWithGUID:deleteDate:");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringGUID(void *a1, const char *a2, ...)
{
  return _[a1 stringGUID];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return _[a1 style];
}

id objc_msgSend_submitCloudKitAnalyticWithOperationGroupName_analyticDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitCloudKitAnalyticWithOperationGroupName:analyticDictionary:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_supportsDatabase(void *a1, const char *a2, ...)
{
  return _[a1 supportsDatabase];
}

id objc_msgSend_syncAttachmentsWithSyncType_deviceConditionsToCheck_activity_completionBlock_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncAttachmentsWithSyncType:deviceConditionsToCheck:activity:completionBlock:");
}

id objc_msgSend_syncDeletesToCloudKitWithActivity_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncDeletesToCloudKitWithActivity:completion:");
}

id objc_msgSend_syncMessagesWithSyncType_deviceConditionsToCheck_activity_completionBlock_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncMessagesWithSyncType:deviceConditionsToCheck:activity:completionBlock:");
}

id objc_msgSend_syncState(void *a1, const char *a2, ...)
{
  return _[a1 syncState];
}

id objc_msgSend_syncStateDebuggingInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncStateDebuggingInfo:");
}

id objc_msgSend_syncType(void *a1, const char *a2, ...)
{
  return _[a1 syncType];
}

id objc_msgSend_synchronousDatabase(void *a1, const char *a2, ...)
{
  return _[a1 synchronousDatabase];
}

id objc_msgSend_systemDidLeaveFirstDataProtectionLock(void *a1, const char *a2, ...)
{
  return _[a1 systemDidLeaveFirstDataProtectionLock];
}

id objc_msgSend_tearDownToneNotificationSessionIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 tearDownToneNotificationSessionIfNeeded];
}

id objc_msgSend_threadIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 threadIdentifier];
}

id objc_msgSend_time(void *a1, const char *a2, ...)
{
  return _[a1 time];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeRead(void *a1, const char *a2, ...)
{
  return _[a1 timeRead];
}

id objc_msgSend_trackEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackEvent:");
}

id objc_msgSend_trackSpamEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackSpamEvent:");
}

id objc_msgSend_transferForGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transferForGUID:");
}

id objc_msgSend_transitionedHandles(void *a1, const char *a2, ...)
{
  return _[a1 transitionedHandles];
}

id objc_msgSend_unEnrollDeviceInSMSRelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unEnrollDeviceInSMSRelay:");
}

id objc_msgSend_uncachedAttachmentCountQuery_chatID_services_finishedWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uncachedAttachmentCountQuery:chatID:services:finishedWithResult:");
}

id objc_msgSend_unknownSenderRecordInfo(void *a1, const char *a2, ...)
{
  return _[a1 unknownSenderRecordInfo];
}

id objc_msgSend_unreadCount(void *a1, const char *a2, ...)
{
  return _[a1 unreadCount];
}

id objc_msgSend_unreadMessagesCount(void *a1, const char *a2, ...)
{
  return _[a1 unreadMessagesCount];
}

id objc_msgSend_unreadMessagesWithHandles_onServices_limit_fallbackGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unreadMessagesWithHandles:onServices:limit:fallbackGUID:");
}

id objc_msgSend_unreadMessagesWithRoomNames_onServices_limit_fallbackGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unreadMessagesWithRoomNames:onServices:limit:fallbackGUID:");
}

id objc_msgSend_unregisterAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterAccount:");
}

id objc_msgSend_unvalidateAliases_account_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unvalidateAliases:account:");
}

id objc_msgSend_updateAccountActivation(void *a1, const char *a2, ...)
{
  return _[a1 updateAccountActivation];
}

id objc_msgSend_updateAttachmentFileSizesWithActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAttachmentFileSizesWithActivity:");
}

id objc_msgSend_updateAuthorizationCredentials_token_account_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAuthorizationCredentials:token:account:");
}

id objc_msgSend_updateBalloonPayload_attachments_forMessageGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateBalloonPayload:attachments:forMessageGUID:");
}

id objc_msgSend_updateCloudKitStateWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCloudKitStateWithDictionary:");
}

id objc_msgSend_updateDisplayName_fromDisplayName_fromID_forChatID_identifier_style_messageID_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateDisplayName:fromDisplayName:fromID:forChatID:identifier:style:messageID:");
}

id objc_msgSend_updateHasHadSuccessfulQuery_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateHasHadSuccessfulQuery:");
}

id objc_msgSend_updateIsBlackholed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateIsBlackholed:");
}

id objc_msgSend_updateIsDeletingIncomingMessages_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateIsDeletingIncomingMessages:");
}

id objc_msgSend_updateIsFiltered_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateIsFiltered:");
}

id objc_msgSend_updateIsRecovered_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateIsRecovered:");
}

id objc_msgSend_updateLastAddressedHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLastAddressedHandle:");
}

id objc_msgSend_updateLastAddressedSIMID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLastAddressedSIMID:");
}

id objc_msgSend_updateLastKnownHybridStateAndRemergeIfAppropriate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLastKnownHybridStateAndRemergeIfAppropriate:");
}

id objc_msgSend_updateLastReadMessageTimeStampIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLastReadMessageTimeStampIfNeeded:");
}

id objc_msgSend_updateLastSeenMessageGuidIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLastSeenMessageGuidIfNeeded:");
}

id objc_msgSend_updateMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateMessage:");
}

id objc_msgSend_updateProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateProperties:");
}

id objc_msgSend_updateStamp(void *a1, const char *a2, ...)
{
  return _[a1 updateStamp];
}

id objc_msgSend_updateStateForChat_forcePost_shouldRebuildFailedMessageDate_setUnreadCountToZero_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateStateForChat:forcePost:shouldRebuildFailedMessageDate:setUnreadCountToZero:");
}

id objc_msgSend_updateStateForChat_forcePost_shouldRebuildFailedMessageDate_shouldCalculateUnreadCount_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateStateForChat:forcePost:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:");
}

id objc_msgSend_updateStateForChat_hintMessage_shouldRebuildFailedMessageDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateStateForChat:hintMessage:shouldRebuildFailedMessageDate:");
}

id objc_msgSend_updateStateForChat_hintMessage_shouldRebuildFailedMessageDate_shouldCalculateUnreadCount_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateStateForChat:hintMessage:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:");
}

id objc_msgSend_updateUnformattedID_forBuddyID_onService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateUnformattedID:forBuddyID:onService:");
}

id objc_msgSend_updateVocabularyForDeletedChat_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateVocabularyForDeletedChat:completionHandler:");
}

id objc_msgSend_uploadDailyAnalyticstoCloudKit(void *a1, const char *a2, ...)
{
  return _[a1 uploadDailyAnalyticstoCloudKit];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_validateAliases_account_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateAliases:account:");
}

id objc_msgSend_validateProfileWithAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateProfileWithAccount:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueOfPersistentProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueOfPersistentProperty:");
}

id objc_msgSend_valueOfProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueOfProperty:");
}

id objc_msgSend_wasDisabledAutomatically(void *a1, const char *a2, ...)
{
  return _[a1 wasDisabledAutomatically];
}

id objc_msgSend_wasReportedAsJunk(void *a1, const char *a2, ...)
{
  return _[a1 wasReportedAsJunk];
}

id objc_msgSend_willMoveChatToRecentlyDeleted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willMoveChatToRecentlyDeleted:");
}

id objc_msgSend_willRemoveChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willRemoveChat:");
}

id objc_msgSend_writeAccountDefaults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeAccountDefaults:");
}

id objc_msgSend_writeExitRecordWithDate_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeExitRecordWithDate:completion:");
}
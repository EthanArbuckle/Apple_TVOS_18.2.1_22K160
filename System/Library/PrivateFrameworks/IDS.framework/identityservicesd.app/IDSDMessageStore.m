@interface IDSDMessageStore
+ (BOOL)databaseSizeBiggerThanThreshold:(int64_t)a3;
+ (id)allExpiredOutgoingMessages:(int64_t)a3;
+ (id)allOutgoingMessagesByGUID:(id)a3;
+ (id)allOutgoingMessagesOnAccountGUID:(id)a3 localDestinationDeviceID:(id)a4;
+ (id)allOutgoingMessagesPendingDeleteWithLimit:(int64_t)a3;
+ (id)allUnsentOutgoingMessagesForAccounts:(id)a3 localDestinationDeviceID:(id)a4 hardLimit:(int64_t)a5;
+ (id)allUnsentOutgoingMessagesForAccounts:(id)a3 localDestinationDeviceID:(id)a4 priority:(int64_t)a5 hardLimit:(int64_t)a6;
+ (id)allUnsentOutgoingMessagesForAccounts:(id)a3 localDestinationDeviceID:(id)a4 priority:(int64_t)a5 hardLimit:(int64_t)a6 wantsPayload:(BOOL)a7 messageType:(int64_t)a8 success:(BOOL *)a9;
+ (id)deleteExpiredIncomingRestrictedMessagesOlderThan:(double)a3;
+ (id)incomingExpiredRestrictedMessages:(double)a3 success:(BOOL *)a4;
+ (id)incomingMessagesUpToLimit:(unint64_t)a3 controlCategory:(unsigned int)a4 messageTransportType:(unsigned __int8)a5 success:(BOOL *)a6;
+ (id)incomingMessagesUpToLimit:(unint64_t)a3 messageTransportType:(unsigned __int8)a4 success:(BOOL *)a5;
+ (id)largestEnquedMessagesAccountUUIDOverThreshold:(int64_t)a3;
+ (id)largestPayloadSizeAccountUUID;
+ (id)outgoingMessagesWithEnqueueDateOlderThan:(int64_t)a3 notToDestinationDeviceID:(id)a4 andLimit:(int64_t)a5;
+ (id)sharedInstance;
+ (id)sharedInstanceForDataProtectionClass:(unsigned int)a3;
+ (id)uniqueAccountGUIDsForUnsentOutgoingMessages:(int64_t)a3;
+ (id)unsentNonUrgentAccountUUIDsRequiringDuetOverrides:(BOOL)a3 priority:(int64_t)a4 dataProtectionClass:(unsigned int)a5;
+ (id)unsentNonUrgentAccountUUIDsRequiringDuetOverrides:(BOOL)a3 priority:(int64_t)a4 dataProtectionClass:(unsigned int)a5 withMessageTypes:(id)a6;
+ (id)unsentOutgoingMessagesUpToLimit:(unint64_t)a3 priority:(int64_t)a4 localDestinationDeviceID:(id)a5;
+ (id)unsentOutgoingMessagesUpToLimit:(unint64_t)a3 priority:(int64_t)a4 wantsPayload:(BOOL)a5 localDestinationDeviceID:(id)a6;
+ (id)unsentUrgentAccountUUIDsWithDataProtectionClass:(unsigned int)a3 withMessageTypes:(id)a4;
+ (void)checkpointAndVacuumDBWithDataProtectionClass:(unsigned int)a3;
+ (void)clearStatementCache;
+ (void)deleteAllMessagesWithAccountGUID:(id)a3;
+ (void)deleteExpiredIncomingMessagesOlderThan:(double)a3 withLimit:(int64_t)a4;
+ (void)deleteIncomingMessageWithGUID:(id)a3;
+ (void)deleteOutgoingMessageWithGUID:(id)a3 alternateGUID:(id)a4;
+ (void)deleteOutgoingMessageWithGUID:(id)a3 alternateGUID:(id)a4 dataProtectionClass:(unsigned int)a5;
+ (void)deletePostponedMessages;
+ (void)markAllMessageAsPendingDeleteForAccounts:(id)a3 withDestinationDevice:(id)a4;
+ (void)markLocalDestinationDeviceUUIDForAccounts:(id)a3 deviceUUID:(id)a4;
+ (void)markOutgoingMessagesAsUnsentForDestination:(id)a3;
+ (void)markOutgoingMessagesAsUnsentIncludingClassD:(BOOL)a3;
+ (void)updateExpirationForIncomingMessageWithGUID:(id)a3 expirationDate:(int64_t)a4;
- (IDSDMessageStore)init;
- (IDSDMessageStore)initWithDataProtectionClass:(unsigned int)a3;
- (IDSDMessageStore)initWithDatabase:(id)a3;
- (IDSDatabase)database;
- (id)_createOutgoingMessageRecordsFromSQLRecords:(__CFArray *)a3 includeMessagePayloads:(BOOL)a4;
- (id)_incomingMessageIdentifierForMessageUUID:(id)a3 messagePayload:(id)a4;
- (id)_unsentOutgoingMessagesUpToLimit:(unint64_t)a3 byteLimit:(unint64_t)a4 priority:(int64_t)a5 accountUUID:(id)a6 wantsPayload:(BOOL)a7 requireDuet:(BOOL)a8 localDestinationDeviceID:(id)a9;
- (id)_unsentOutgoingMessagesUpToLimit:(unint64_t)a3 byteLimit:(unint64_t)a4 priority:(int64_t)a5 accountUUID:(id)a6 wantsPayload:(BOOL)a7 requireDuet:(BOOL)a8 localDestinationDeviceID:(id)a9 messageTypes:(id)a10;
- (id)allExpiredOutgoingMessages:(int64_t)a3;
- (id)allOutgoingMessagesByGUID:(id)a3;
- (id)allOutgoingMessagesOnAccountGUID:(id)a3 localDestinationDeviceID:(id)a4;
- (id)allOutgoingMessagesPendingDeleteWithLimit:(int64_t)a3;
- (id)allUnsentOutgoingMessagesForAccounts:(id)a3 localDestinationDeviceID:(id)a4 hardLimit:(int64_t)a5;
- (id)allUnsentOutgoingMessagesForAccounts:(id)a3 localDestinationDeviceID:(id)a4 priority:(int64_t)a5 hardLimit:(int64_t)a6 wantsPayload:(BOOL)a7 messageType:(int64_t)a8 success:(BOOL *)a9;
- (id)allUnsentOutgoingMessagesForAccounts:(id)a3 priority:(int64_t)a4 localDestinationDeviceID:(id)a5 hardLimit:(int64_t)a6;
- (id)deleteExpiredIncomingRestrictedMessagesOlderThan:(double)a3;
- (id)duetIdentifiersOverrideForAccountWithGUID:(id)a3 priority:(int64_t)a4;
- (id)incomingExpiredRestrictedMessages:(double)a3 success:(BOOL *)a4;
- (id)incomingMessagesUpToLimit:(unint64_t)a3 controlCategory:(unsigned int)a4 messageTransportType:(unsigned __int8)a5 success:(BOOL *)a6;
- (id)incomingMessagesUpToLimit:(unint64_t)a3 messageTransportType:(unsigned __int8)a4 success:(BOOL *)a5;
- (id)largestEnquedMessagesAmountAccountUUID;
- (id)largestPayloadSizeAccountUUID;
- (id)outgoingMessagesWithEnqueueDateOlderThan:(int64_t)a3 notToDestinationDeviceID:(id)a4 andLimit:(int64_t)a5;
- (id)uniqueAccountGUIDsForUnsentOutgoingMessages:(int64_t)a3;
- (id)unsentNonUrgentAccountUUIDsRequiringDuetOverrides:(BOOL)a3 priority:(int64_t)a4;
- (id)unsentNonUrgentAccountUUIDsRequiringDuetOverrides:(BOOL)a3 priority:(int64_t)a4 messageTypes:(id)a5;
- (id)unsentNonUrgentMessagesForAccountUUID:(id)a3 priority:(int64_t)a4 byteLimit:(unint64_t)a5 upToLimit:(unint64_t)a6 localDestinationDeviceID:(id)a7;
- (id)unsentNonUrgentMessagesForAccountUUID:(id)a3 priority:(int64_t)a4 byteLimit:(unint64_t)a5 upToLimit:(unint64_t)a6 localDestinationDeviceID:(id)a7 messageTypes:(id)a8;
- (id)unsentOutgoingMessagesUpToLimit:(unint64_t)a3 priority:(int64_t)a4 localDestinationDeviceID:(id)a5;
- (id)unsentOutgoingMessagesUpToLimit:(unint64_t)a3 priority:(int64_t)a4 wantsPayload:(BOOL)a5 localDestinationDeviceID:(id)a6;
- (id)unsentUrgentAccountUUIDsForMessageTypes:(id)a3;
- (int)internalMigrationVersionOnDatabase;
- (int64_t)databaseSizeInMB;
- (unsigned)dataProtectionClass;
- (void)__closeDatabase;
- (void)_clearDatabaseCloseTimer;
- (void)_performInitialHousekeeping;
- (void)_setDatabaseCloseTimer;
- (void)checkpointAndVacuumDB;
- (void)clearStatementCache;
- (void)closeDatabase;
- (void)deleteAllMessagesWithAccountGUID:(id)a3;
- (void)deleteDatabase;
- (void)deleteExpiredIncomingMessagesOlderThan:(double)a3 withLimit:(int64_t)a4;
- (void)deleteIncomingMessageWithGUID:(id)a3;
- (void)deleteOutgoingMessageWithGUID:(id)a3 alternateGUID:(id)a4 classDDatabase:(id)a5;
- (void)deletePostponedMessages:(id)a3 classDDatabase:(id)a4;
- (void)markAllMessageAsPendingDeleteForAccounts:(id)a3 withDestinationDevice:(id)a4;
- (void)markAllOutgoingMessagesAsUnsent;
- (void)markAllOutgoingMessagesAsUnsentForLocalDestination:(id)a3;
- (void)markLocalDestinationDeviceUUIDForAccounts:(id)a3 deviceUUID:(id)a4;
- (void)markOutgoingMessageWithGUID:(id)a3 asSent:(BOOL)a4;
- (void)performBlock:(id)a3;
- (void)performBlock:(id)a3 afterDelay:(double)a4;
- (void)performBlock:(id)a3 waitUntilDone:(BOOL)a4;
- (void)storeIncomingMessage:(id)a3 forTopic:(id)a4 fromID:(id)a5 messageUUID:(id)a6 messagePayload:(id)a7 dedupBehavior:(unsigned __int8)a8 completionBlock:(id)a9;
- (void)storeIncomingMessage:(id)a3 forTopic:(id)a4 fromID:(id)a5 messageUUID:(id)a6 messagePayload:(id)a7 isLocal:(BOOL)a8 controlCategory:(unsigned int)a9 dedupBehavior:(unsigned __int8)a10 completionBlock:(id)a11;
- (void)storeIncomingMessage:(id)a3 forTopic:(id)a4 fromID:(id)a5 messageUUID:(id)a6 messagePayload:(id)a7 isLocal:(BOOL)a8 dedupBehavior:(unsigned __int8)a9 completionBlock:(id)a10;
- (void)storeOutgoingMessageWithSendParameters:(id)a3 guid:(id)a4 canSend:(BOOL)a5 canBypassSimilarMessages:(BOOL)a6 fromQueue:(id)a7 completionBlock:(id)a8;
- (void)updateExpirationForIncomingMessageWithGUID:(id)a3 expirationDate:(int64_t)a4;
- (void)updateInternalMigrationVersionOnDatabaseWithValue:(int)a3;
@end

@implementation IDSDMessageStore

+ (id)sharedInstance
{
  if (qword_1009C0A90 != -1) {
    dispatch_once(&qword_1009C0A90, &stru_100900438);
  }
  return (id)qword_1009C0A98;
}

+ (id)sharedInstanceForDataProtectionClass:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDMessageStoreMap sharedInstance](&OBJC_CLASS___IDSDMessageStoreMap, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 getOrCreateMessageStoreForDataProtectionClass:v3]);

  return v5;
}

+ (id)unsentNonUrgentAccountUUIDsRequiringDuetOverrides:(BOOL)a3 priority:(int64_t)a4 dataProtectionClass:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDMessageStoreMap sharedInstance](&OBJC_CLASS___IDSDMessageStoreMap, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 getOrCreateMessageStoreForDataProtectionClass:v5]);

  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 unsentNonUrgentAccountUUIDsRequiringDuetOverrides:v7 priority:a4]);
  return v10;
}

+ (id)unsentNonUrgentAccountUUIDsRequiringDuetOverrides:(BOOL)a3 priority:(int64_t)a4 dataProtectionClass:(unsigned int)a5 withMessageTypes:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  BOOL v8 = a3;
  id v9 = a6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDMessageStoreMap sharedInstance](&OBJC_CLASS___IDSDMessageStoreMap, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 getOrCreateMessageStoreForDataProtectionClass:v6]);

  v12 = (void *)objc_claimAutoreleasedReturnValue( [v11 unsentNonUrgentAccountUUIDsRequiringDuetOverrides:v8 priority:a4 messageTypes:v9]);
  return v12;
}

+ (id)unsentUrgentAccountUUIDsWithDataProtectionClass:(unsigned int)a3 withMessageTypes:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDMessageStoreMap sharedInstance](&OBJC_CLASS___IDSDMessageStoreMap, "sharedInstance"));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 getOrCreateMessageStoreForDataProtectionClass:v4]);

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 unsentUrgentAccountUUIDsForMessageTypes:v5]);
  return v8;
}

+ (void)markLocalDestinationDeviceUUIDForAccounts:(id)a3 deviceUUID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDMessageStoreMap sharedInstance](&OBJC_CLASS___IDSDMessageStoreMap, "sharedInstance", 0LL));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 messageStores]);

  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) markLocalDestinationDeviceUUIDForAccounts:v5 deviceUUID:v6];
        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v10);
  }
}

+ (void)markAllMessageAsPendingDeleteForAccounts:(id)a3 withDestinationDevice:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDMessageStoreMap sharedInstance](&OBJC_CLASS___IDSDMessageStoreMap, "sharedInstance", 0LL));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 messageStores]);

  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) markAllMessageAsPendingDeleteForAccounts:v5 withDestinationDevice:v6];
        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v10);
  }
}

+ (id)allOutgoingMessagesPendingDeleteWithLimit:(int64_t)a3
{
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDMessageStoreMap sharedInstance](&OBJC_CLASS___IDSDMessageStoreMap, "sharedInstance", 0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 messageStores]);

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
LABEL_3:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allOutgoingMessagesPendingDeleteWithLimit:"));
      -[NSMutableArray addObjectsFromArray:](v4, "addObjectsFromArray:", v12);

      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v4;
}

+ (id)outgoingMessagesWithEnqueueDateOlderThan:(int64_t)a3 notToDestinationDeviceID:(id)a4 andLimit:(int64_t)a5
{
  id v7 = a4;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDMessageStoreMap sharedInstance](&OBJC_CLASS___IDSDMessageStoreMap, "sharedInstance", 0LL));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 messageStores]);

  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
LABEL_3:
    uint64_t v14 = 0LL;
    while (1)
    {
      if (*(void *)v19 != v13) {
        objc_enumerationMutation(v10);
      }
      __int128 v15 = *(void **)(*((void *)&v18 + 1) + 8 * v14);
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v15,  "outgoingMessagesWithEnqueueDateOlderThan:notToDestinationDeviceID:andLimit:",  a3,  v7));
      -[NSMutableArray addObjectsFromArray:](v8, "addObjectsFromArray:", v16);

      if (v12 == (id)++v14)
      {
        id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v12) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v8;
}

+ (void)deletePostponedMessages
{
  uint64_t v49 = 0LL;
  v50 = &v49;
  uint64_t v51 = 0x2020000000LL;
  uint64_t v52 = 0LL;
  uint64_t v43 = 0LL;
  v44 = &v43;
  uint64_t v45 = 0x3032000000LL;
  v46 = sub_1002F0AB8;
  v47 = sub_1002F0AC8;
  v48 = (NSMutableDictionary *)0xAAAAAAAAAAAAAAAALL;
  v48 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v42[0] = 0LL;
  v42[1] = v42;
  v42[2] = 0x2020000000LL;
  v42[3] = -1LL;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDMessageStoreMap sharedInstance](&OBJC_CLASS___IDSDMessageStoreMap, "sharedInstance"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 getOrCreateMessageStoreForDataProtectionClass:2]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 database]);

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_1002F0AD0;
  v36[3] = &unk_1009005A0;
  v38 = &v49;
  v39 = v42;
  v40 = &v43;
  v41 = @"SELECT ROWID, data_protection_class, guid, alternate_guid FROM outgoing_messages_to_delete;";
  id v5 = v4;
  id v37 = v5;
  sub_1003AFB28(v36, 1LL, v5);
  if (v50[3])
  {
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDMessageStoreMap sharedInstance](&OBJC_CLASS___IDSDMessageStoreMap, "sharedInstance"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 messageStores]);

    int v8 = 0;
    int v9 = 0;
    id v10 = [v7 countByEnumeratingWithState:&v32 objects:v53 count:16];
    if (v10)
    {
      int v27 = 0;
      uint64_t v11 = *(void *)v33;
      while (1)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v33 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
          id v14 = [v13 dataProtectionClass];
          if ((_DWORD)v14 == 1)
          {
            __int128 v15 = (void *)v44[5];
            uint64_t v16 = IDSDataProtectionClassStringFromDataProtectionClass(v14);
            __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
            __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:v17]);
            [v13 deletePostponedMessages:v18 classDDatabase:v5];
            int v8 = 1;
          }

          else
          {
            id v19 = [v13 dataProtectionClass];
            if ((_DWORD)v19)
            {
              id v20 = [v13 dataProtectionClass];
              if ((_DWORD)v20 != 2) {
                continue;
              }
              __int128 v21 = (void *)v44[5];
              uint64_t v22 = IDSDataProtectionClassStringFromDataProtectionClass(v20);
              __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(v22);
              __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:v17]);
              [v13 deletePostponedMessages:v18 classDDatabase:v5];
              int v27 = 1;
            }

            else
            {
              v23 = (void *)v44[5];
              uint64_t v24 = IDSDataProtectionClassStringFromDataProtectionClass(v19);
              __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(v24);
              __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKey:v17]);
              [v13 deletePostponedMessages:v18 classDDatabase:v5];
              int v9 = 1;
            }
          }
        }

        id v10 = [v7 countByEnumeratingWithState:&v32 objects:v53 count:16];
        if (!v10) {
          goto LABEL_18;
        }
      }
    }

    int v27 = 0;
LABEL_18:

    v25 = (void *)v44[5];
    v44[5] = 0LL;

    if ((v8 & v9 & v27 & 1) != 0)
    {
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSMessageStore](&OBJC_CLASS___IDSFoundationLog, "IDSMessageStore"));
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Clearing postponed messages", buf, 2u);
      }

      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_1002F0D64;
      v28[3] = &unk_1008F7E80;
      v30 = v42;
      id v29 = v5;
      sub_1003AFB28(v28, 1LL, v29);
    }
  }

  _Block_object_dispose(v42, 8);
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(&v49, 8);
}

+ (void)deleteIncomingMessageWithGUID:(id)a3
{
  id v3 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDMessageStoreMap sharedInstance](&OBJC_CLASS___IDSDMessageStoreMap, "sharedInstance", 0LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 messageStores]);

  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      int v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) deleteIncomingMessageWithGUID:v3];
        int v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }
}

+ (void)clearStatementCache
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDMessageStoreMap sharedInstance](&OBJC_CLASS___IDSDMessageStoreMap, "sharedInstance", 0LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 messageStores]);

  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) clearStatementCache];
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }
}

- (void)clearStatementCache
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1002F105C;
  v2[3] = &unk_1008F6010;
  v2[4] = self;
  -[IDSDMessageStore performBlock:](self, "performBlock:", v2);
}

+ (void)deleteExpiredIncomingMessagesOlderThan:(double)a3 withLimit:(int64_t)a4
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDMessageStoreMap sharedInstance](&OBJC_CLASS___IDSDMessageStoreMap, "sharedInstance", 0LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 messageStores]);

  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      __int128 v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) deleteExpiredIncomingMessagesOlderThan:a4 withLimit:a3];
        __int128 v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v9);
  }
}

+ (id)deleteExpiredIncomingRestrictedMessagesOlderThan:(double)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDMessageStoreMap sharedInstance](&OBJC_CLASS___IDSDMessageStoreMap, "sharedInstance", 0LL));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 messageStores]);

  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) deleteExpiredIncomingRestrictedMessagesOlderThan:a3]);
        -[NSMutableArray addObjectsFromArray:](v4, "addObjectsFromArray:", v11);

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v8);
  }

  return v4;
}

+ (void)deleteOutgoingMessageWithGUID:(id)a3 alternateGUID:(id)a4 dataProtectionClass:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDMessageStoreMap sharedInstance](&OBJC_CLASS___IDSDMessageStoreMap, "sharedInstance"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 getOrCreateMessageStoreForDataProtectionClass:2]);
  id v13 = (id)objc_claimAutoreleasedReturnValue([v10 database]);

  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDMessageStoreMap sharedInstance](&OBJC_CLASS___IDSDMessageStoreMap, "sharedInstance"));
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 getOrCreateMessageStoreForDataProtectionClass:v5]);

  [v12 deleteOutgoingMessageWithGUID:v8 alternateGUID:v7 classDDatabase:v13];
}

+ (void)deleteOutgoingMessageWithGUID:(id)a3 alternateGUID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDMessageStoreMap sharedInstance](&OBJC_CLASS___IDSDMessageStoreMap, "sharedInstance"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 getOrCreateMessageStoreForDataProtectionClass:2]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 database]);

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDMessageStoreMap sharedInstance](&OBJC_CLASS___IDSDMessageStoreMap, "sharedInstance", 0LL));
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 messageStores]);

  id v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      __int128 v15 = 0LL;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * (void)v15) deleteOutgoingMessageWithGUID:v5 alternateGUID:v6 classDDatabase:v9];
        __int128 v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v13);
  }
}

+ (id)incomingMessagesUpToLimit:(unint64_t)a3 controlCategory:(unsigned int)a4 messageTransportType:(unsigned __int8)a5 success:(BOOL *)a6
{
  __int128 v18 = a6;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDMessageStoreMap sharedInstance](&OBJC_CLASS___IDSDMessageStoreMap, "sharedInstance"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 messageStores]);

  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v20;
    char v13 = 1;
LABEL_3:
    uint64_t v14 = 0LL;
    while (1)
    {
      if (*(void *)v20 != v12) {
        objc_enumerationMutation(v9);
      }
      __int128 v15 = *(void **)(*((void *)&v19 + 1) + 8 * v14);
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "incomingMessagesUpToLimit:controlCategory:messageTransportType:success:"));
      -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:", v16);

      char v13 = 0;
      if (v11 == (id)++v14)
      {
        id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  else
  {
    char v13 = 1;
  }

  if (v18) {
    *__int128 v18 = v13 & 1;
  }
  return v7;
}

+ (id)incomingMessagesUpToLimit:(unint64_t)a3 messageTransportType:(unsigned __int8)a4 success:(BOOL *)a5
{
  return +[IDSDMessageStore incomingMessagesUpToLimit:controlCategory:messageTransportType:success:]( &OBJC_CLASS___IDSDMessageStore,  "incomingMessagesUpToLimit:controlCategory:messageTransportType:success:",  a3,  0LL,  a4,  a5);
}

+ (id)incomingExpiredRestrictedMessages:(double)a3 success:(BOOL *)a4
{
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDMessageStoreMap sharedInstance](&OBJC_CLASS___IDSDMessageStoreMap, "sharedInstance"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 messageStores]);

  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    char v12 = 1;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        char v17 = 0;
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 incomingExpiredRestrictedMessages:&v17 success:a3]);
        -[NSMutableArray addObjectsFromArray:](v6, "addObjectsFromArray:", v15);

        v12 &= v17 != 0;
      }

      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v10);
  }

  else
  {
    char v12 = 1;
  }

  if (a4) {
    *a4 = v12;
  }
  return v6;
}

+ (id)unsentOutgoingMessagesUpToLimit:(unint64_t)a3 priority:(int64_t)a4 wantsPayload:(BOOL)a5 localDestinationDeviceID:(id)a6
{
  id v7 = a6;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDMessageStoreMap sharedInstance](&OBJC_CLASS___IDSDMessageStoreMap, "sharedInstance", 0LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 messageStores]);

  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
LABEL_3:
    uint64_t v14 = 0LL;
    while (1)
    {
      if (*(void *)v19 != v13) {
        objc_enumerationMutation(v10);
      }
      __int128 v15 = *(void **)(*((void *)&v18 + 1) + 8 * v14);
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v15,  "unsentOutgoingMessagesUpToLimit:priority:wantsPayload:localDestinationDeviceID:"));
      -[NSMutableArray addObjectsFromArray:](v8, "addObjectsFromArray:", v16);

      if (v12 == (id)++v14)
      {
        id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v12) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v8;
}

+ (id)unsentOutgoingMessagesUpToLimit:(unint64_t)a3 priority:(int64_t)a4 localDestinationDeviceID:(id)a5
{
  id v6 = a5;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDMessageStoreMap sharedInstance](&OBJC_CLASS___IDSDMessageStoreMap, "sharedInstance", 0LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 messageStores]);

  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
LABEL_3:
    uint64_t v13 = 0LL;
    while (1)
    {
      if (*(void *)v18 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * v13);
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "unsentOutgoingMessagesUpToLimit:priority:localDestinationDeviceID:"));
      -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:", v15);

      if (v11 == (id)++v13)
      {
        id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v7;
}

+ (void)markOutgoingMessagesAsUnsentIncludingClassD:(BOOL)a3
{
  BOOL v3 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDMessageStoreMap sharedInstance](&OBJC_CLASS___IDSDMessageStoreMap, "sharedInstance", 0LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 messageStores]);

  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
      }

      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }
}

+ (void)markOutgoingMessagesAsUnsentForDestination:(id)a3
{
  id v3 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDMessageStoreMap sharedInstance](&OBJC_CLASS___IDSDMessageStoreMap, "sharedInstance", 0LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 messageStores]);

  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) markAllOutgoingMessagesAsUnsentForLocalDestination:v3];
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }
}

+ (BOOL)databaseSizeBiggerThanThreshold:(int64_t)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDMessageStoreMap sharedInstance](&OBJC_CLASS___IDSDMessageStoreMap, "sharedInstance", 0LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 messageStores]);

  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    int64_t v8 = 0LL;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        v8 += (int64_t)[*(id *)(*((void *)&v12 + 1) + 8 * (void)i) databaseSizeInMB];
      }

      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  else
  {
    int64_t v8 = 0LL;
  }

  return v8 >= a3;
}

+ (id)largestPayloadSizeAccountUUID
{
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDMessageStoreMap sharedInstance](&OBJC_CLASS___IDSDMessageStoreMap, "sharedInstance", 0LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 messageStores]);

  id v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    id v5 = v4;
    signed int v6 = 0;
    id v7 = 0LL;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v3);
        }
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v16 + 1) + 8 * (void)i) largestPayloadSizeAccountUUID]);
        if ([v10 count] == (id)2)
        {
          __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndex:0]);
          __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndex:1]);
          signed int v13 = [v12 intValue];

          if (v6 < v13)
          {
            id v14 = v11;

            signed int v6 = v13;
            id v7 = v14;
          }
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v5);
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

+ (id)largestEnquedMessagesAccountUUIDOverThreshold:(int64_t)a3
{
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDMessageStoreMap sharedInstance](&OBJC_CLASS___IDSDMessageStoreMap, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 messageStores]);

  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v20;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v19 + 1) + 8 * (void)i),  "largestEnquedMessagesAmountAccountUUID",  v17,  v18));
        if ([v9 count] == (id)2)
        {
          __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:0]);
          __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:1]);
          id v12 = [v11 intValue];

          uint64_t v13 = OSLogHandleForIDSCategory("IDSDMessageStore");
          id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v24 = v10;
            __int16 v25 = 1024;
            int v26 = (int)v12;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "RunawayCheck: Account Guid %@ has %d messages",  buf,  0x12u);
          }

          if (os_log_shim_legacy_logging_enabled(v15)
            && _IDSShouldLog(0LL, @"IDSDMessageStore"))
          {
            __int128 v17 = v10;
            id v18 = v12;
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDMessageStore",  @"RunawayCheck: Account Guid %@ has %d messages");
          }

          if ((int)v12 > a3)
          {

            goto LABEL_18;
          }
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  __int128 v10 = 0LL;
LABEL_18:

  return v10;
}

+ (void)deleteAllMessagesWithAccountGUID:(id)a3
{
  id v3 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDMessageStoreMap sharedInstance](&OBJC_CLASS___IDSDMessageStoreMap, "sharedInstance", 0LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 messageStores]);

  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) deleteAllMessagesWithAccountGUID:v3];
        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }
}

+ (id)allOutgoingMessagesByGUID:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDMessageStoreMap sharedInstance](&OBJC_CLASS___IDSDMessageStoreMap, "sharedInstance", 0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 messageStores]);

  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      __int128 v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) allOutgoingMessagesByGUID:v3]);
        -[NSMutableArray addObjectsFromArray:](v4, "addObjectsFromArray:", v11);

        __int128 v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v8);
  }

  return v4;
}

+ (id)allOutgoingMessagesOnAccountGUID:(id)a3 localDestinationDeviceID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDMessageStoreMap sharedInstance](&OBJC_CLASS___IDSDMessageStoreMap, "sharedInstance", 0LL));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 messageStores]);

  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      __int128 v13 = 0LL;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v16 + 1) + 8 * (void)v13) allOutgoingMessagesOnAccountGUID:v5 localDestinationDeviceID:v6]);
        -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:", v14);

        __int128 v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v11);
  }

  return v7;
}

+ (id)allExpiredOutgoingMessages:(int64_t)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDMessageStoreMap sharedInstance](&OBJC_CLASS___IDSDMessageStoreMap, "sharedInstance", 0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 messageStores]);

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
LABEL_3:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allExpiredOutgoingMessages:"));
      -[NSMutableArray addObjectsFromArray:](v4, "addObjectsFromArray:", v12);

      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v4;
}

+ (id)uniqueAccountGUIDsForUnsentOutgoingMessages:(int64_t)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDMessageStoreMap sharedInstance](&OBJC_CLASS___IDSDMessageStoreMap, "sharedInstance", 0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 messageStores]);

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
LABEL_3:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueAccountGUIDsForUnsentOutgoingMessages:"));
      -[NSMutableArray addObjectsFromArray:](v4, "addObjectsFromArray:", v12);

      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v4;
}

+ (id)allUnsentOutgoingMessagesForAccounts:(id)a3 localDestinationDeviceID:(id)a4 hardLimit:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDMessageStoreMap sharedInstance](&OBJC_CLASS___IDSDMessageStoreMap, "sharedInstance", 0LL));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 messageStores]);

  id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v20;
LABEL_3:
    uint64_t v15 = 0LL;
    while (1)
    {
      if (*(void *)v20 != v14) {
        objc_enumerationMutation(v11);
      }
      __int128 v16 = *(void **)(*((void *)&v19 + 1) + 8 * v15);
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v16,  "allUnsentOutgoingMessagesForAccounts:localDestinationDeviceID:hardLimit:",  v7,  v8));
      -[NSMutableArray addObjectsFromArray:](v9, "addObjectsFromArray:", v17);

      if (v13 == (id)++v15)
      {
        id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v13) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v9;
}

+ (id)allUnsentOutgoingMessagesForAccounts:(id)a3 localDestinationDeviceID:(id)a4 priority:(int64_t)a5 hardLimit:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDMessageStoreMap sharedInstance](&OBJC_CLASS___IDSDMessageStoreMap, "sharedInstance", 0LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 messageStores]);

  id v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v22;
LABEL_3:
    uint64_t v17 = 0LL;
    while (1)
    {
      if (*(void *)v22 != v16) {
        objc_enumerationMutation(v13);
      }
      __int128 v18 = *(void **)(*((void *)&v21 + 1) + 8 * v17);
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v18,  "allUnsentOutgoingMessagesForAccounts:priority:localDestinationDeviceID:hardLimit:",  v9,  a5,  v10));
      -[NSMutableArray addObjectsFromArray:](v11, "addObjectsFromArray:", v19);

      if (v15 == (id)++v17)
      {
        id v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v15) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v11;
}

+ (id)allUnsentOutgoingMessagesForAccounts:(id)a3 localDestinationDeviceID:(id)a4 priority:(int64_t)a5 hardLimit:(int64_t)a6 wantsPayload:(BOOL)a7 messageType:(int64_t)a8 success:(BOOL *)a9
{
  id v25 = a3;
  id v12 = a4;
  id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDMessageStoreMap sharedInstance](&OBJC_CLASS___IDSDMessageStoreMap, "sharedInstance"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 messageStores]);

  id obj = v15;
  id v16 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v28;
    char v19 = 1;
LABEL_3:
    uint64_t v20 = 0LL;
    while (1)
    {
      if (*(void *)v28 != v18) {
        objc_enumerationMutation(obj);
      }
      __int128 v21 = *(void **)(*((void *)&v27 + 1) + 8 * v20);
      char v26 = 0;
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v21,  "allUnsentOutgoingMessagesForAccounts:localDestinationDeviceID:priority:hardLimit:wantsPayload:me ssageType:success:",  v25,  v12,  a5,  &v26));
      -[NSMutableArray addObjectsFromArray:](v13, "addObjectsFromArray:", v22);

      v19 &= v26 != 0;
      if (v17 == (id)++v20)
      {
        id v17 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v17) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  else
  {
    char v19 = 1;
  }

  if (a9) {
    *a9 = v19 & 1;
  }

  return v13;
}

+ (void)updateExpirationForIncomingMessageWithGUID:(id)a3 expirationDate:(int64_t)a4
{
  id v5 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDMessageStoreMap sharedInstance](&OBJC_CLASS___IDSDMessageStoreMap, "sharedInstance", 0LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 messageStores]);

  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) updateExpirationForIncomingMessageWithGUID:v5 expirationDate:a4];
        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v9);
  }
}

+ (void)checkpointAndVacuumDBWithDataProtectionClass:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDMessageStoreMap sharedInstance](&OBJC_CLASS___IDSDMessageStoreMap, "sharedInstance"));
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 getOrCreateMessageStoreForDataProtectionClass:v3]);

  [v5 checkpointAndVacuumDB];
}

- (IDSDMessageStore)init
{
  return -[IDSDMessageStore initWithDataProtectionClass:](self, "initWithDataProtectionClass:", 0LL);
}

- (IDSDMessageStore)initWithDataProtectionClass:(unsigned int)a3
{
  id v4 = -[IDSDatabase initWithDataProtectionClass:]( objc_alloc(&OBJC_CLASS___IDSDatabase),  "initWithDataProtectionClass:",  *(void *)&a3);
  id v5 = -[IDSDMessageStore initWithDatabase:](self, "initWithDatabase:", v4);

  return v5;
}

- (IDSDMessageStore)initWithDatabase:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___IDSDMessageStore;
  id v6 = -[IDSDMessageStore init](&v18, "init");
  if (v6)
  {
    v6->_dataProtectionClass = [v5 dataProtectionClass];
    objc_storeStrong((id *)&v6->_database, a3);
    id v7 = objc_alloc_init(&OBJC_CLASS___NSRecursiveLock);
    recursiveLock = v6->_recursiveLock;
    v6->_recursiveLock = v7;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v6);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1002F3130;
    v14[3] = &unk_1009005F0;
    __int128 v15 = v6;
    objc_copyWeak(&v16, &location);
    uint64_t v11 = im_primary_queue(v9, v10);
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    sub_100301AD8(v14, (uint64_t)@"IDS-DB-List", (uint64_t)v12);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)_performInitialHousekeeping
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1002F34D0;
  v2[3] = &unk_1008F6010;
  v2[4] = self;
  -[IDSDMessageStore performBlock:](self, "performBlock:", v2);
}

- (unsigned)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (id)incomingMessagesUpToLimit:(unint64_t)a3 controlCategory:(unsigned int)a4 messageTransportType:(unsigned __int8)a5 success:(BOOL *)a6
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1002F3630;
  v10[3] = &unk_100900618;
  unsigned int v15 = a4;
  uint64_t v11 = self;
  unint64_t v13 = a3;
  __int128 v14 = a6;
  unsigned __int8 v16 = a5;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v12 = v6;
  -[IDSDMessageStore performBlock:waitUntilDone:](v11, "performBlock:waitUntilDone:", v10, 1LL);
  id v7 = v12;
  id v8 = v6;

  return v8;
}

- (id)incomingMessagesUpToLimit:(unint64_t)a3 messageTransportType:(unsigned __int8)a4 success:(BOOL *)a5
{
  return -[IDSDMessageStore incomingMessagesUpToLimit:controlCategory:messageTransportType:success:]( self,  "incomingMessagesUpToLimit:controlCategory:messageTransportType:success:",  a3,  0LL,  a4,  a5);
}

- (id)incomingExpiredRestrictedMessages:(double)a3 success:(BOOL *)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1002F3A9C;
  v8[3] = &unk_1008F6D70;
  uint64_t v9 = self;
  double v11 = a3;
  id v12 = a4;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v10 = v4;
  -[IDSDMessageStore performBlock:waitUntilDone:](v9, "performBlock:waitUntilDone:", v8, 1LL);
  id v5 = v10;
  id v6 = v4;

  return v6;
}

- (id)_incomingMessageIdentifierForMessageUUID:(id)a3 messagePayload:(id)a4
{
  id v5 = a3;
  id v6 = 0LL;
  if (v5 && a4)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([a4 SHA256Data]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "__imHexString"));

    if (v8)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingString:v8]);
    }

    else
    {
      id v6 = 0LL;
    }
  }

  return v6;
}

- (void)storeIncomingMessage:(id)a3 forTopic:(id)a4 fromID:(id)a5 messageUUID:(id)a6 messagePayload:(id)a7 isLocal:(BOOL)a8 controlCategory:(unsigned int)a9 dedupBehavior:(unsigned __int8)a10 completionBlock:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v29 = a5;
  id v19 = a6;
  id v20 = a7;
  id v28 = a11;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v40 = _os_activity_create( (void *)&_mh_execute_header,  "Storing incoming message",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v40, &state);
  if ([v18 length])
  {
    uint64_t v21 = JWEncodeDictionary(v17);
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    if (v22)
    {
      id v23 = v17;
      if (a10)
      {
        id v24 = v19;
        id v25 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDMessageStore _incomingMessageIdentifierForMessageUUID:messagePayload:]( self,  "_incomingMessageIdentifierForMessageUUID:messagePayload:",  v19,  v20,  v28));
        id v26 = v20;
      }

      else
      {
        id v26 = v20;
        id v24 = v19;
        id v25 = 0LL;
      }

      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_1002F41B4;
      v30[3] = &unk_100900668;
      v30[4] = self;
      id v31 = v18;
      id v32 = v29;
      id v33 = v22;
      BOOL v37 = a8;
      id v27 = v25;
      id v34 = v27;
      unsigned int v36 = a9;
      unsigned __int8 v38 = a10;
      id v35 = v28;
      -[IDSDMessageStore performBlock:](self, "performBlock:", v30);
      id v20 = v26;

      id v19 = v24;
      id v17 = v23;
    }

    else
    {
      id v27 = (id)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSMessageStore](&OBJC_CLASS___IDSFoundationLog, "IDSMessageStore", v28));
      if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR)) {
        sub_1006A79DC();
      }
    }
  }

  else
  {
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSMessageStore](&OBJC_CLASS___IDSFoundationLog, "IDSMessageStore", v28));
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v42 = v17;
      __int16 v43 = 2112;
      id v44 = v18;
      __int16 v45 = 2112;
      id v46 = v29;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v22,  OS_LOG_TYPE_ERROR,  "Ignoring storeMessage: %@ forTopic: %@ fromID: %@",  buf,  0x20u);
    }
  }

  os_activity_scope_leave(&state);
  cut_arc_os_release(&v40);
}

- (void)storeIncomingMessage:(id)a3 forTopic:(id)a4 fromID:(id)a5 messageUUID:(id)a6 messagePayload:(id)a7 isLocal:(BOOL)a8 dedupBehavior:(unsigned __int8)a9 completionBlock:(id)a10
{
}

- (void)storeIncomingMessage:(id)a3 forTopic:(id)a4 fromID:(id)a5 messageUUID:(id)a6 messagePayload:(id)a7 dedupBehavior:(unsigned __int8)a8 completionBlock:(id)a9
{
  LOBYTE(v9) = a8;
  -[IDSDMessageStore storeIncomingMessage:forTopic:fromID:messageUUID:messagePayload:isLocal:dedupBehavior:completionBlock:]( self,  "storeIncomingMessage:forTopic:fromID:messageUUID:messagePayload:isLocal:dedupBehavior:completionBlock:",  a3,  a4,  a5,  a6,  a7,  0LL,  v9,  a9);
}

- (id)_createOutgoingMessageRecordsFromSQLRecords:(__CFArray *)a3 includeMessagePayloads:(BOOL)a4
{
  if (a3 && (BOOL v4 = a4, Count = CFArrayGetCount(a3), Count >= 1))
  {
    v72 = 0LL;
    CFIndex idx = 0LL;
    uint64_t v7 = Count;
    id v8 = &v169;
    if (!v4) {
      id v8 = 0LL;
    }
    uint64_t v68 = (uint64_t)v8;
    theArray = a3;
    if (v4) {
      uint64_t v9 = &v168;
    }
    else {
      uint64_t v9 = 0LL;
    }
    id v10 = &v167;
    if (!v4) {
      id v10 = 0LL;
    }
    uint64_t v66 = (uint64_t)v10;
    uint64_t v67 = (uint64_t)v9;
    double v11 = &v165;
    if (!v4) {
      double v11 = 0LL;
    }
    uint64_t v64 = v7;
    uint64_t v65 = (uint64_t)v11;
    do
    {
      context = objc_autoreleasePoolPush();
      ValueAtIndex = CFArrayGetValueAtIndex(theArray, idx);
      uint64_t v172 = 0LL;
      CFTypeRef v173 = 0LL;
      CFTypeRef v171 = 0LL;
      CFTypeRef v170 = 0LL;
      CFTypeRef v169 = 0LL;
      CFTypeRef v168 = 0LL;
      CFTypeRef v167 = 0LL;
      CFTypeRef v166 = 0LL;
      CFTypeRef v165 = 0LL;
      unsigned __int8 v164 = -86;
      unsigned __int8 v163 = -86;
      unsigned __int8 v162 = -86;
      unsigned __int8 v161 = -86;
      memset(v160, 170, 17);
      CFTypeRef v159 = 0LL;
      CFTypeRef v158 = 0LL;
      uint64_t v157 = 0LL;
      CFTypeRef v156 = 0LL;
      CFTypeRef v155 = 0LL;
      CFTypeRef cf = 0LL;
      unsigned __int8 v153 = -86;
      unsigned __int8 v152 = -86;
      unsigned __int8 v151 = -86;
      unsigned __int8 v150 = -86;
      unsigned __int8 v149 = -86;
      unsigned __int8 v148 = -86;
      memset(v147, 170, 17);
      unsigned __int8 v146 = -86;
      CFTypeRef v145 = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
      char v144 = -86;
      memset(v143, 170, sizeof(v143));
      unsigned __int8 v142 = -86;
      memset(v141, 170, 17);
      unsigned __int8 v140 = -86;
      unsigned __int8 v139 = -86;
      unsigned __int8 v138 = -86;
      unsigned __int8 v137 = -86;
      unsigned __int8 v136 = -86;
      unsigned __int8 v135 = -86;
      unsigned __int8 v134 = -86;
      unint64_t v133 = 0xAAAAAAAAAAAAAAAALL;
      uint64_t v132 = 0LL;
      unsigned __int8 v131 = -86;
      memset(v130, 170, sizeof(v130));
      unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDMessageStore database](self, "database"));
      sub_1000373AC( (uint64_t)ValueAtIndex,  0LL,  (uint64_t)&v173,  (uint64_t)&v172,  (uint64_t)&v171,  (uint64_t)&v170,  v68,  v67,  v66,  (uint64_t)&v166,  v65,  (uint64_t)&v164,  (uint64_t)&v163,  (uint64_t)&v162,  (uint64_t)&v161,  (uint64_t)&v160[9],  (uint64_t)&v160[1],  (uint64_t)v160,  (uint64_t)&v159,  (uint64_t)&v158,  (uint64_t)&v157,  (uint64_t)v143,  (uint64_t)&v142,  (uint64_t)&v156,  (uint64_t)&v152,  (uint64_t)&v155,  (uint64_t)&v153,  (uint64_t)&v151,  (uint64_t)&v150,  (uint64_t)&v149,  (uint64_t)&v148,  (uint64_t)&v147[9],  (uint64_t)&v147[1],  (uint64_t)v147,  (uint64_t)&cf,  (uint64_t)&v146,  (uint64_t)&v145,  (uint64_t)&v144,  (uint64_t)&v143[2],  (uint64_t)&v143[1],  (uint64_t)&v141[9],  (uint64_t)v141,  (uint64_t)&v140,  (uint64_t)&v141[1],  (uint64_t)&v139,  (uint64_t)&v138,  (uint64_t)&v137,  (uint64_t)&v136,  (uint64_t)&v135,
        (uint64_t)&v134,
        (uint64_t)&v133,
        (uint64_t)&v132,
        (uint64_t)&v131,
        (uint64_t)&v130[2],
        (uint64_t)&v130[1],
        (uint64_t)v130,
        v13);

      if (v169)
      {
        uint64_t v15 = JWDecodeDictionary(v169);
        v123 = (void *)objc_claimAutoreleasedReturnValue(v15);
      }

      else
      {
        v123 = 0LL;
      }

      if (v167)
      {
        uint64_t v16 = JWDecodeDictionary(v167);
        v124 = (void *)objc_claimAutoreleasedReturnValue(v16);
      }

      else
      {
        v124 = 0LL;
      }

      if (v132)
      {
        id v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        uint64_t v18 = JWDecodeDictionary(v132);
        id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        __int128 v128 = 0u;
        __int128 v129 = 0u;
        __int128 v126 = 0u;
        __int128 v127 = 0u;
        id v20 = v19;
        id v21 = [v20 countByEnumeratingWithState:&v126 objects:v174 count:16];
        if (v21)
        {
          uint64_t v22 = *(void *)v127;
          do
          {
            for (i = 0LL; i != v21; i = (char *)i + 1)
            {
              if (*(void *)v127 != v22) {
                objc_enumerationMutation(v20);
              }
              uint64_t v24 = *(void *)(*((void *)&v126 + 1) + 8LL * (void)i);
              id v25 = objc_alloc(&OBJC_CLASS___NSUUID);
              id v26 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:v24]);
              id v27 = -[NSUUID initWithUUIDString:](v25, "initWithUUIDString:", v26);

              -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v27, v24);
            }

            id v21 = [v20 countByEnumeratingWithState:&v126 objects:v174 count:16];
          }

          while (v21);
        }

        v125 = v17;
      }

      else
      {
        v125 = 0LL;
      }

      if (v166)
      {
        uint64_t v28 = objc_opt_class(&OBJC_CLASS___IDSDestination, v14);
        uint64_t v29 = objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver ids_secureUnarchiveObjectOfClass:withData:]( &OBJC_CLASS___NSKeyedUnarchiver,  "ids_secureUnarchiveObjectOfClass:withData:",  v28,  v166));
      }

      else
      {
        uint64_t v29 = 0LL;
      }

      if (v159)
      {
        uint64_t v30 = JWDecodeDictionary(v159);
        uint64_t v31 = objc_claimAutoreleasedReturnValue(v30);
      }

      else
      {
        uint64_t v31 = 0LL;
      }

      if (*(void *)&v147[1])
      {
        uint64_t v32 = JWDecodeArray();
        v115 = (void *)objc_claimAutoreleasedReturnValue(v32);
      }

      else
      {
        v115 = 0LL;
      }

      v114 = (void *)v31;
      v113 = (void *)v29;
      else {
        v116 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  (double)*(uint64_t *)&v160[9]));
      }
      if (v143[1] < 1LL) {
        v117 = 0LL;
      }
      else {
        v117 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  (double)v143[1]));
      }
      v111 = objc_alloc(&OBJC_CLASS___IDSDOutgoingMessage);
      CFTypeRef v106 = v168;
      CFTypeRef v107 = v170;
      CFTypeRef v108 = v171;
      int v33 = v162;
      CFTypeRef v105 = v165;
      int v34 = v164;
      int v35 = v163;
      int v110 = v161;
      int v109 = v146;
      v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", *(void *)&v160[1]));
      int v104 = v160[0];
      CFTypeRef v95 = v158;
      uint64_t v94 = v157;
      CFTypeRef v93 = v173;
      uint64_t v92 = v172;
      CFTypeRef v91 = v156;
      int v102 = v152;
      CFTypeRef v90 = v155;
      int v100 = v153;
      int v99 = v151;
      int v98 = v148;
      int v97 = v150;
      int v96 = v149;
      v120 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)&v147[9]));
      int v89 = v147[0];
      CFTypeRef v88 = v145;
      uint64_t v87 = v143[2];
      v119 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  *(void *)&v141[9]));
      int v86 = v141[0];
      int v85 = v140;
      uint64_t v79 = *(void *)&v141[1];
      if (*(uint64_t *)&v141[1] < 1)
      {
        v82 = 0LL;
      }

      else
      {
        v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:"));
        v82 = v75;
      }

      CFTypeRef v81 = cf;
      int v84 = v139;
      int v83 = v138;
      int v36 = v137;
      int v37 = v142;
      int v38 = v136;
      int v39 = v135;
      int v40 = v134;
      v118 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v133));
      int v41 = v131;
      uint64_t v77 = v130[2];
      if (v130[2] < 1LL)
      {
        v80 = 0LL;
      }

      else
      {
        v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:"));
        v80 = v74;
      }

      uint64_t v76 = v130[1];
      if (v130[1] < 1LL)
      {
        v78 = 0LL;
      }

      else
      {
        v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:"));
        v78 = v73;
      }

      if (v130[0] <= 0LL)
      {
        LOBYTE(v63) = v41 != 0;
        BYTE6(v62) = v40 != 0;
        BYTE5(v62) = v39 != 0;
        BYTE4(v62) = v38 != 0;
        BYTE3(v62) = v37 != 0;
        BYTE2(v62) = v36 != 0;
        BYTE1(v62) = v83 != 0;
        LOBYTE(v62) = v84 != 0;
        BYTE1(v61) = v85 != 0;
        LOBYTE(v61) = v86 != 0;
        LOBYTE(v60) = v89 != 0;
        BYTE4(v59) = v96 != 0;
        BYTE3(v59) = v97 != 0;
        BYTE2(v59) = v98 != 0;
        BYTE1(v59) = v99 != 0;
        LOBYTE(v59) = v100 != 0;
        LOBYTE(v58) = v102 != 0;
        LOBYTE(v57) = v104 != 0;
        LOBYTE(v56) = v109 != 0;
        BYTE2(v55) = v110 != 0;
        BYTE1(v55) = v35 != 0;
        LOBYTE(v55) = v34 != 0;
        LOBYTE(v54) = v33 != 0;
        v50 = -[IDSDOutgoingMessage initWithMessage:data:protobuf:fromID:toDestinations:accountGUID:useDictAsTopLevel:dataToEncrypt:encryptPayload:compressPayload:wantsResponse:expirationDate:enforceRemoteTimeouts:command:wantsDeliveryStatus:deliveryStatusContext:messageUUID:priority:guid:alternateGUID:identifier:forcedLocal:peerResponseIdentifier:expectsPeerResponse:wantsAppAck:fireAndForget:nonWaking:nonCloudWaking:storedSize:duetIdentifiersOverride:bypassDuet:mainAccountGuid:localDestinationDeviceUUID:enqueuedDate:messageType:alwaysSkipSelf:alwaysIncludeSelf:pushPriority:queueOneIdentifier:liveMessageDelivery:requireBluetooth:requireLocalWiFi:sent:wantsProgress:ignoreMaxRetryCount:wantsCertifiedDelivery:originalTimestamp:ktUriVerificationMap:wantsFirewallDonation:sendMode:deliveryMinimumTimeDelay:deliveryMinimumTime:]( v111,  "initWithMessage:data:protobuf:fromID:toDestinations:accountGUID:useDictAsTopLevel:dataToEncrypt:encryptP ayload:compressPayload:wantsResponse:expirationDate:enforceRemoteTimeouts:command:wantsDeliveryStatus:de liveryStatusContext:messageUUID:priority:guid:alternateGUID:identifier:forcedLocal:peerResponseIdentifie r:expectsPeerResponse:wantsAppAck:fireAndForget:nonWaking:nonCloudWaking:storedSize:duetIdentifiersOverr ide:bypassDuet:mainAccountGuid:localDestinationDeviceUUID:enqueuedDate:messageType:alwaysSkipSelf:always IncludeSelf:pushPriority:queueOneIdentifier:liveMessageDelivery:requireBluetooth:requireLocalWiFi:sent:w antsProgress:ignoreMaxRetryCount:wantsCertifiedDelivery:originalTimestamp:ktUriVerificationMap:wantsFire wallDonation:sendMode:deliveryMinimumTimeDelay:deliveryMinimumTime:",  v123,  v106,  v124,  v107,  v113,  v108,  v54,  v105,  v55,  v116,  v56,  v121,  v57,  v114,  v95,  v94,  v93,  v92,  v91,  v58,  v90,  v59,  v120,  v115,  v60,  v88,  v87,  v117,  v119,  v61,  v82,  v81,  v62,  v118,  v125,  v63,  v80,  v78,  0LL);
      }

      else
      {
        BOOL v71 = v41 != 0;
        BOOL v42 = v39 != 0;
        int v43 = v35;
        BOOL v44 = v38 != 0;
        int v45 = v34;
        BOOL v46 = v37 != 0;
        BOOL v47 = v100 != 0;
        BOOL v48 = v102 != 0;
        BOOL v103 = v43 != 0;
        BOOL v101 = v45 != 0;
        uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:"));
        LOBYTE(v63) = v71;
        BYTE6(v62) = v40 != 0;
        BYTE5(v62) = v42;
        BYTE4(v62) = v44;
        BYTE3(v62) = v46;
        BYTE2(v62) = v36 != 0;
        BYTE1(v62) = v83 != 0;
        LOBYTE(v62) = v84 != 0;
        BYTE1(v61) = v85 != 0;
        LOBYTE(v61) = v86 != 0;
        LOBYTE(v60) = v89 != 0;
        BYTE4(v59) = v96 != 0;
        BYTE3(v59) = v97 != 0;
        BYTE2(v59) = v98 != 0;
        BYTE1(v59) = v99 != 0;
        LOBYTE(v59) = v47;
        LOBYTE(v58) = v48;
        LOBYTE(v57) = v104 != 0;
        LOBYTE(v56) = v109 != 0;
        BYTE2(v55) = v110 != 0;
        BYTE1(v55) = v103;
        LOBYTE(v55) = v101;
        LOBYTE(v54) = v33 != 0;
        v50 = -[IDSDOutgoingMessage initWithMessage:data:protobuf:fromID:toDestinations:accountGUID:useDictAsTopLevel:dataToEncrypt:encryptPayload:compressPayload:wantsResponse:expirationDate:enforceRemoteTimeouts:command:wantsDeliveryStatus:deliveryStatusContext:messageUUID:priority:guid:alternateGUID:identifier:forcedLocal:peerResponseIdentifier:expectsPeerResponse:wantsAppAck:fireAndForget:nonWaking:nonCloudWaking:storedSize:duetIdentifiersOverride:bypassDuet:mainAccountGuid:localDestinationDeviceUUID:enqueuedDate:messageType:alwaysSkipSelf:alwaysIncludeSelf:pushPriority:queueOneIdentifier:liveMessageDelivery:requireBluetooth:requireLocalWiFi:sent:wantsProgress:ignoreMaxRetryCount:wantsCertifiedDelivery:originalTimestamp:ktUriVerificationMap:wantsFirewallDonation:sendMode:deliveryMinimumTimeDelay:deliveryMinimumTime:]( v111,  "initWithMessage:data:protobuf:fromID:toDestinations:accountGUID:useDictAsTopLevel:dataToEncrypt:encryptP ayload:compressPayload:wantsResponse:expirationDate:enforceRemoteTimeouts:command:wantsDeliveryStatus:de liveryStatusContext:messageUUID:priority:guid:alternateGUID:identifier:forcedLocal:peerResponseIdentifie r:expectsPeerResponse:wantsAppAck:fireAndForget:nonWaking:nonCloudWaking:storedSize:duetIdentifiersOverr ide:bypassDuet:mainAccountGuid:localDestinationDeviceUUID:enqueuedDate:messageType:alwaysSkipSelf:always IncludeSelf:pushPriority:queueOneIdentifier:liveMessageDelivery:requireBluetooth:requireLocalWiFi:sent:w antsProgress:ignoreMaxRetryCount:wantsCertifiedDelivery:originalTimestamp:ktUriVerificationMap:wantsFire wallDonation:sendMode:deliveryMinimumTimeDelay:deliveryMinimumTime:",  v123,  v106,  v124,  v107,  v113,  v108,  v54,  v105,  v55,  v116,  v56,  v121,  v57,  v114,  v95,  v94,  v93,  v92,  v91,  v58,  v90,  v59,  v120,  v115,  v60,  v88,  v87,  v117,  v119,  v61,  v82,  v81,  v62,  v118,  v125,  v63,  v80,  v78,  v49);
      }

      if (v76 >= 1) {

      }
      if (v77 >= 1) {
      if (v79 > 0)
      }

      if (v50)
      {
        uint64_t v51 = v72;
        if (!v72) {
          uint64_t v51 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        }
        v72 = v51;
        -[NSMutableArray addObject:](v51, "addObject:", v50);
      }

      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0LL;
      }

      if (v168)
      {
        CFRelease(v168);
        CFTypeRef v168 = 0LL;
      }

      if (v167)
      {
        CFRelease(v167);
        CFTypeRef v167 = 0LL;
      }

      if (v156)
      {
        CFRelease(v156);
        CFTypeRef v156 = 0LL;
      }

      if (v155)
      {
        CFRelease(v155);
        CFTypeRef v155 = 0LL;
      }

      if (v173)
      {
        CFRelease(v173);
        CFTypeRef v173 = 0LL;
      }

      if (v171)
      {
        CFRelease(v171);
        CFTypeRef v171 = 0LL;
      }

      if (v170)
      {
        CFRelease(v170);
        CFTypeRef v170 = 0LL;
      }

      if (v169)
      {
        CFRelease(v169);
        CFTypeRef v169 = 0LL;
      }

      if (v166)
      {
        CFRelease(v166);
        CFTypeRef v166 = 0LL;
      }

      if (v165)
      {
        CFRelease(v165);
        CFTypeRef v165 = 0LL;
      }

      if (v159)
      {
        CFRelease(v159);
        CFTypeRef v159 = 0LL;
      }

      if (v158)
      {
        CFRelease(v158);
        CFTypeRef v158 = 0LL;
      }

      if (*(void *)&v147[1])
      {
        CFRelease(*(CFTypeRef *)&v147[1]);
        *(void *)&v147[1] = 0LL;
      }

      if (v145)
      {
        CFRelease(v145);
        CFTypeRef v145 = 0LL;
      }

      if (v143[2])
      {
        CFRelease((CFTypeRef)v143[2]);
        v143[2] = 0LL;
      }

      objc_autoreleasePoolPop(context);
      ++idx;
    }

    while (idx != v64);
  }

  else
  {
    v72 = 0LL;
  }

  uint64_t v52 = v72;

  return v52;
}

- (int64_t)databaseSizeInMB
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  uint64_t v8 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1002F54EC;
  v4[3] = &unk_1008F7E58;
  v4[4] = self;
  v4[5] = &v5;
  -[IDSDMessageStore performBlock:waitUntilDone:](self, "performBlock:waitUntilDone:", v4, 1LL);
  int64_t v2 = v6[3] / 0x100000;
  v6[3] = v2;
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)largestPayloadSizeAccountUUID
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  uint64_t v8 = sub_1002F0AB8;
  uint64_t v9 = sub_1002F0AC8;
  id v10 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1002F5614;
  v4[3] = &unk_1008F7E58;
  v4[4] = self;
  v4[5] = &v5;
  -[IDSDMessageStore performBlock:waitUntilDone:](self, "performBlock:waitUntilDone:", v4, 1LL);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)allOutgoingMessagesByGUID:(id)a3
{
  uint64_t v10 = 0LL;
  double v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  unint64_t v13 = sub_1002F0AB8;
  uint64_t v14 = sub_1002F0AC8;
  id v15 = 0LL;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1002F5770;
  v6[3] = &unk_1008FF150;
  uint64_t v7 = self;
  id v3 = a3;
  id v8 = v3;
  uint64_t v9 = &v10;
  -[IDSDMessageStore performBlock:waitUntilDone:](v7, "performBlock:waitUntilDone:", v6, 1LL);
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v4;
}

- (id)allOutgoingMessagesOnAccountGUID:(id)a3 localDestinationDeviceID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  id v19 = sub_1002F0AB8;
  id v20 = sub_1002F0AC8;
  id v21 = 0LL;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1002F5938;
  v12[3] = &unk_100900690;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  id v15 = &v16;
  -[IDSDMessageStore performBlock:waitUntilDone:](self, "performBlock:waitUntilDone:", v12, 1LL);
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (id)allExpiredOutgoingMessages:(int64_t)a3
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_1002F0AB8;
  id v10 = sub_1002F0AC8;
  id v11 = 0LL;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1002F5AB0;
  v5[3] = &unk_1008F6DB8;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = self;
  -[IDSDMessageStore performBlock:waitUntilDone:](self, "performBlock:waitUntilDone:", v5, 1LL);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)uniqueAccountGUIDsForUnsentOutgoingMessages:(int64_t)a3
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_1002F0AB8;
  id v10 = sub_1002F0AC8;
  id v11 = 0LL;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1002F5C24;
  v5[3] = &unk_1008F6DB8;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a3;
  -[IDSDMessageStore performBlock:waitUntilDone:](self, "performBlock:waitUntilDone:", v5, 1LL);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)allUnsentOutgoingMessagesForAccounts:(id)a3 localDestinationDeviceID:(id)a4 hardLimit:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    uint64_t v17 = 0LL;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x3032000000LL;
    id v20 = sub_1002F0AB8;
    id v21 = sub_1002F0AC8;
    id v22 = 0LL;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1002F5DE0;
    v12[3] = &unk_1009006B8;
    v12[4] = self;
    id v13 = v8;
    id v15 = &v17;
    int64_t v16 = a5;
    id v14 = v9;
    -[IDSDMessageStore performBlock:waitUntilDone:](self, "performBlock:waitUntilDone:", v12, 1LL);
    id v10 = (id)v18[5];

    _Block_object_dispose(&v17, 8);
  }

  else
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  }

  return v10;
}

- (id)allUnsentOutgoingMessagesForAccounts:(id)a3 priority:(int64_t)a4 localDestinationDeviceID:(id)a5 hardLimit:(int64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v22 = 0LL;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  id v25 = sub_1002F0AB8;
  id v26 = sub_1002F0AC8;
  id v27 = 0LL;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1002F5FDC;
  v16[3] = &unk_1009006E0;
  v16[4] = self;
  id v12 = v10;
  id v17 = v12;
  int64_t v20 = a4;
  id v13 = v11;
  int64_t v21 = a6;
  id v18 = v13;
  uint64_t v19 = &v22;
  -[IDSDMessageStore performBlock:waitUntilDone:](self, "performBlock:waitUntilDone:", v16, 1LL);
  id v14 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v14;
}

- (id)allUnsentOutgoingMessagesForAccounts:(id)a3 localDestinationDeviceID:(id)a4 priority:(int64_t)a5 hardLimit:(int64_t)a6 wantsPayload:(BOOL)a7 messageType:(int64_t)a8 success:(BOOL *)a9
{
  id v15 = a3;
  id v16 = a4;
  uint64_t v30 = 0LL;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  int v33 = sub_1002F0AB8;
  int v34 = sub_1002F0AC8;
  id v35 = 0LL;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1002F61F8;
  v21[3] = &unk_100900708;
  v21[4] = self;
  id v17 = v15;
  id v22 = v17;
  int64_t v25 = a5;
  id v18 = v16;
  BOOL v29 = a7;
  int64_t v26 = a6;
  int64_t v27 = a8;
  uint64_t v28 = a9;
  id v23 = v18;
  uint64_t v24 = &v30;
  -[IDSDMessageStore performBlock:waitUntilDone:](self, "performBlock:waitUntilDone:", v21, 1LL);
  id v19 = (id)v31[5];

  _Block_object_dispose(&v30, 8);
  return v19;
}

- (id)unsentNonUrgentAccountUUIDsRequiringDuetOverrides:(BOOL)a3 priority:(int64_t)a4
{
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  id v11 = sub_1002F0AB8;
  id v12 = sub_1002F0AC8;
  id v13 = 0LL;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1002F6390;
  v6[3] = &unk_100900730;
  void v6[4] = self;
  v6[5] = &v8;
  v6[6] = a4;
  BOOL v7 = a3;
  -[IDSDMessageStore performBlock:waitUntilDone:](self, "performBlock:waitUntilDone:", v6, 1LL);
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

- (id)unsentNonUrgentAccountUUIDsRequiringDuetOverrides:(BOOL)a3 priority:(int64_t)a4 messageTypes:(id)a5
{
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  id v17 = sub_1002F0AB8;
  id v18 = sub_1002F0AC8;
  id v19 = 0LL;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1002F6520;
  v8[3] = &unk_100900758;
  id v9 = self;
  id v11 = &v14;
  int64_t v12 = a4;
  BOOL v13 = a3;
  id v5 = a5;
  id v10 = v5;
  -[IDSDMessageStore performBlock:waitUntilDone:](v9, "performBlock:waitUntilDone:", v8, 1LL);
  id v6 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v6;
}

- (id)unsentUrgentAccountUUIDsForMessageTypes:(id)a3
{
  uint64_t v10 = 0LL;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  BOOL v13 = sub_1002F0AB8;
  uint64_t v14 = sub_1002F0AC8;
  id v15 = 0LL;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1002F669C;
  v6[3] = &unk_100900780;
  BOOL v7 = self;
  id v9 = &v10;
  id v3 = a3;
  id v8 = v3;
  -[IDSDMessageStore performBlock:waitUntilDone:](v7, "performBlock:waitUntilDone:", v6, 1LL);
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v4;
}

- (id)unsentOutgoingMessagesUpToLimit:(unint64_t)a3 priority:(int64_t)a4 localDestinationDeviceID:(id)a5
{
  return -[IDSDMessageStore _unsentOutgoingMessagesUpToLimit:byteLimit:priority:accountUUID:wantsPayload:requireDuet:localDestinationDeviceID:]( self,  "_unsentOutgoingMessagesUpToLimit:byteLimit:priority:accountUUID:wantsPayload:requireDuet:localDestinationDeviceID:",  a3,  0LL,  a4,  0LL,  1LL,  0LL,  a5);
}

- (id)unsentOutgoingMessagesUpToLimit:(unint64_t)a3 priority:(int64_t)a4 wantsPayload:(BOOL)a5 localDestinationDeviceID:(id)a6
{
  return -[IDSDMessageStore _unsentOutgoingMessagesUpToLimit:byteLimit:priority:accountUUID:wantsPayload:requireDuet:localDestinationDeviceID:]( self,  "_unsentOutgoingMessagesUpToLimit:byteLimit:priority:accountUUID:wantsPayload:requireDuet:localDestinationDeviceID:",  a3,  0LL,  a4,  0LL,  a5,  0LL,  a6);
}

- (id)_unsentOutgoingMessagesUpToLimit:(unint64_t)a3 byteLimit:(unint64_t)a4 priority:(int64_t)a5 accountUUID:(id)a6 wantsPayload:(BOOL)a7 requireDuet:(BOOL)a8 localDestinationDeviceID:(id)a9
{
  id v15 = a6;
  id v16 = a9;
  uint64_t v30 = 0LL;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  int v33 = sub_1002F0AB8;
  int v34 = sub_1002F0AC8;
  id v35 = 0LL;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1002F68DC;
  v21[3] = &unk_1009007A8;
  BOOL v28 = a7;
  v21[4] = self;
  unint64_t v25 = a4;
  unint64_t v26 = a3;
  int64_t v27 = a5;
  id v17 = v15;
  id v22 = v17;
  BOOL v29 = a8;
  id v18 = v16;
  id v23 = v18;
  uint64_t v24 = &v30;
  -[IDSDMessageStore performBlock:waitUntilDone:](self, "performBlock:waitUntilDone:", v21, 1LL);
  id v19 = (id)v31[5];

  _Block_object_dispose(&v30, 8);
  return v19;
}

- (id)_unsentOutgoingMessagesUpToLimit:(unint64_t)a3 byteLimit:(unint64_t)a4 priority:(int64_t)a5 accountUUID:(id)a6 wantsPayload:(BOOL)a7 requireDuet:(BOOL)a8 localDestinationDeviceID:(id)a9 messageTypes:(id)a10
{
  id v15 = a6;
  id v16 = a9;
  id v17 = a10;
  uint64_t v32 = 0LL;
  int v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  id v35 = sub_1002F0AB8;
  int v36 = sub_1002F0AC8;
  id v37 = 0LL;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1002F6B78;
  v23[3] = &unk_1009007D0;
  v23[4] = self;
  unint64_t v28 = a4;
  unint64_t v29 = a3;
  int64_t v30 = a5;
  id v18 = v15;
  id v24 = v18;
  BOOL v31 = a8;
  id v19 = v16;
  id v25 = v19;
  id v20 = v17;
  id v26 = v20;
  int64_t v27 = &v32;
  -[IDSDMessageStore performBlock:waitUntilDone:](self, "performBlock:waitUntilDone:", v23, 1LL);
  id v21 = (id)v33[5];

  _Block_object_dispose(&v32, 8);
  return v21;
}

- (id)unsentNonUrgentMessagesForAccountUUID:(id)a3 priority:(int64_t)a4 byteLimit:(unint64_t)a5 upToLimit:(unint64_t)a6 localDestinationDeviceID:(id)a7 messageTypes:(id)a8
{
  return -[IDSDMessageStore _unsentOutgoingMessagesUpToLimit:byteLimit:priority:accountUUID:wantsPayload:requireDuet:localDestinationDeviceID:messageTypes:]( self,  "_unsentOutgoingMessagesUpToLimit:byteLimit:priority:accountUUID:wantsPayload:requireDuet:localDestinationDevi ceID:messageTypes:",  a6,  a5,  a4,  a3,  1LL,  1LL,  a7,  a8);
}

- (id)unsentNonUrgentMessagesForAccountUUID:(id)a3 priority:(int64_t)a4 byteLimit:(unint64_t)a5 upToLimit:(unint64_t)a6 localDestinationDeviceID:(id)a7
{
  return -[IDSDMessageStore _unsentOutgoingMessagesUpToLimit:byteLimit:priority:accountUUID:wantsPayload:requireDuet:localDestinationDeviceID:]( self,  "_unsentOutgoingMessagesUpToLimit:byteLimit:priority:accountUUID:wantsPayload:requireDuet:localDestinationDeviceID:",  a6,  a5,  a4,  a3,  1LL,  0LL,  a7);
}

- (id)duetIdentifiersOverrideForAccountWithGUID:(id)a3 priority:(int64_t)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1002F6DDC;
  v10[3] = &unk_1008FF718;
  id v11 = self;
  id v12 = a3;
  int64_t v14 = a4;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  BOOL v13 = v5;
  id v6 = v12;
  -[IDSDMessageStore performBlock:waitUntilDone:](v11, "performBlock:waitUntilDone:", v10, 1LL);
  BOOL v7 = v13;
  id v8 = v5;

  return v8;
}

- (void)markLocalDestinationDeviceUUIDForAccounts:(id)a3 deviceUUID:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002F70C0;
  v7[3] = &unk_1008F5F58;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  -[IDSDMessageStore performBlock:](v8, "performBlock:", v7);
}

- (void)markAllMessageAsPendingDeleteForAccounts:(id)a3 withDestinationDevice:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002F7264;
  v7[3] = &unk_1008F5F58;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  -[IDSDMessageStore performBlock:](v8, "performBlock:", v7);
}

- (id)allOutgoingMessagesPendingDeleteWithLimit:(int64_t)a3
{
  uint64_t v6 = 0LL;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_1002F0AB8;
  id v10 = sub_1002F0AC8;
  id v11 = 0LL;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1002F7424;
  v5[3] = &unk_1008F6DB8;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = self;
  -[IDSDMessageStore performBlock:waitUntilDone:](self, "performBlock:waitUntilDone:", v5, 1LL);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)outgoingMessagesWithEnqueueDateOlderThan:(int64_t)a3 notToDestinationDeviceID:(id)a4 andLimit:(int64_t)a5
{
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = sub_1002F0AB8;
  id v19 = sub_1002F0AC8;
  id v20 = 0LL;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1002F75D0;
  v9[3] = &unk_1009007F8;
  id v10 = self;
  int64_t v13 = a3;
  id v6 = a4;
  int64_t v14 = a5;
  id v11 = v6;
  id v12 = &v15;
  -[IDSDMessageStore performBlock:waitUntilDone:](v10, "performBlock:waitUntilDone:", v9, 1LL);
  id v7 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v7;
}

- (id)largestEnquedMessagesAmountAccountUUID
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  uint64_t v8 = sub_1002F0AB8;
  id v9 = sub_1002F0AC8;
  id v10 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1002F7754;
  v4[3] = &unk_1008F7E58;
  v4[4] = self;
  v4[5] = &v5;
  -[IDSDMessageStore performBlock:waitUntilDone:](self, "performBlock:waitUntilDone:", v4, 1LL);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)deleteAllMessagesWithAccountGUID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1002F7840;
    v5[3] = &unk_1008F5F80;
    v5[4] = self;
    id v6 = v4;
    -[IDSDMessageStore performBlock:](self, "performBlock:", v5);
  }
}

- (void)updateInternalMigrationVersionOnDatabaseWithValue:(int)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1002F78F0;
  v3[3] = &unk_1008F78D8;
  v3[4] = self;
  int v4 = a3;
  -[IDSDMessageStore performBlock:](self, "performBlock:", v3);
}

- (int)internalMigrationVersionOnDatabase
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  int v8 = -1431655766;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1002F79F8;
  v4[3] = &unk_1008F7E58;
  v4[4] = self;
  v4[5] = &v5;
  -[IDSDMessageStore performBlock:waitUntilDone:](self, "performBlock:waitUntilDone:", v4, 1LL);
  int v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)checkpointAndVacuumDB
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1002F7AAC;
  v2[3] = &unk_1008F6010;
  v2[4] = self;
  -[IDSDMessageStore performBlock:waitUntilDone:](self, "performBlock:waitUntilDone:", v2, 1LL);
}

- (void)storeOutgoingMessageWithSendParameters:(id)a3 guid:(id)a4 canSend:(BOOL)a5 canBypassSimilarMessages:(BOOL)a6 fromQueue:(id)a7 completionBlock:(id)a8
{
  id v11 = a3;
  id v67 = a4;
  uint64_t v65 = (dispatch_queue_s *)a7;
  uint64_t v66 = (void (**)(id, id, uint64_t, uint64_t))a8;
  dispatch_assert_queue_V2(v65);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 destinations]);
  int64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 destinationURIs]);
  if ([v13 count])
  {
    int64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 accountUUID]);
    id v15 = [v14 length];

    if (v15)
    {
      if ([v11 bypassStorage])
      {
        id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSMessageStore](&OBJC_CLASS___IDSFoundationLog, "IDSMessageStore"));
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v89 = v67;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Asked to bypass storage for message with GUID %@",  buf,  0xCu);
        }

        v66[2](v66, v67, 1LL, 1LL);
      }

      else
      {
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v11 message]);
        if (v20)
        {
          id v21 = (void *)objc_claimAutoreleasedReturnValue([v11 message]);
          uint64_t v22 = JWEncodeDictionary(v21);
          uint64_t v23 = objc_claimAutoreleasedReturnValue(v22);

          uint64_t v60 = (void *)v23;
        }

        else
        {
          uint64_t v60 = 0LL;
        }

        uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue([v11 data]);
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v11 protobuf]);
        if (v24)
        {
          id v25 = (void *)objc_claimAutoreleasedReturnValue([v11 protobuf]);
          uint64_t v26 = JWEncodeDictionary(v25);
          uint64_t v27 = objc_claimAutoreleasedReturnValue(v26);

          uint64_t v58 = v27;
        }

        else
        {
          uint64_t v58 = 0LL;
        }

        unint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v11 keyTransparencyURIVerificationMap]);
        if (v28)
        {
          unint64_t v29 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          __int128 v85 = 0u;
          __int128 v86 = 0u;
          __int128 v83 = 0u;
          __int128 v84 = 0u;
          int64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v11 keyTransparencyURIVerificationMap]);
          id v31 = [v30 countByEnumeratingWithState:&v83 objects:v87 count:16];
          if (v31)
          {
            uint64_t v32 = *(void *)v84;
            do
            {
              for (i = 0LL; i != v31; i = (char *)i + 1)
              {
                if (*(void *)v84 != v32) {
                  objc_enumerationMutation(v30);
                }
                uint64_t v34 = *(void *)(*((void *)&v83 + 1) + 8LL * (void)i);
                id v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "keyTransparencyURIVerificationMap", v58));
                int v36 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKey:v34]);
                id v37 = (void *)objc_claimAutoreleasedReturnValue([v36 UUIDString]);
                -[NSMutableDictionary setObject:forKey:](v29, "setObject:forKey:", v37, v34);
              }

              id v31 = [v30 countByEnumeratingWithState:&v83 objects:v87 count:16];
            }

            while (v31);
          }

          uint64_t v38 = JWEncodeDictionary(v29);
          int v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
        }

        else
        {
          int v39 = 0LL;
        }

        int v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "destinations", v58));
        id v82 = 0LL;
        int v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v40,  0LL,  &v82));
        id v42 = v82;

        if (!v41)
        {
          int v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSMessageStore](&OBJC_CLASS___IDSFoundationLog, "IDSMessageStore"));
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            BOOL v44 = (void *)objc_claimAutoreleasedReturnValue([v11 destinations]);
            sub_1006A7A9C(v44, (uint64_t)v42, buf, v43);
          }
        }

        int v45 = (void *)objc_claimAutoreleasedReturnValue([v11 deliveryStatusContext]);
        uint64_t v46 = JWEncodeDictionary(v45);
        BOOL v47 = (void *)objc_claimAutoreleasedReturnValue(v46);

        BOOL v48 = (void *)objc_claimAutoreleasedReturnValue([v11 duetIdentifiersOverride]);
        uint64_t v49 = JWEncodeArray(v48);
        v50 = (void *)objc_claimAutoreleasedReturnValue(v49);

        v68[0] = _NSConcreteStackBlock;
        v68[1] = 3221225472LL;
        v68[2] = sub_1002F8230;
        v68[3] = &unk_100900848;
        v68[4] = self;
        BOOL v80 = a5;
        BOOL v81 = a6;
        id v69 = v11;
        id v70 = v67;
        id v71 = v60;
        id v72 = v61;
        id v73 = v59;
        id v74 = v41;
        id v75 = v47;
        id v76 = v50;
        id v77 = v39;
        uint64_t v79 = v66;
        v78 = v65;
        id v51 = v39;
        id v52 = v50;
        id v53 = v47;
        id v54 = v41;
        id v55 = v59;
        id v56 = v61;
        id v57 = v60;
        -[IDSDMessageStore performBlock:](self, "performBlock:", v68);
      }

      goto LABEL_32;
    }
  }

  else
  {
  }

  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSMessageStore](&OBJC_CLASS___IDSFoundationLog, "IDSMessageStore"));
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v11 destinations]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v11 accountUUID]);
    *(_DWORD *)buf = 138412802;
    id v89 = v11;
    __int16 v90 = 2112;
    CFTypeRef v91 = v18;
    __int16 v92 = 2112;
    CFTypeRef v93 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Ignoring storeOutgoingMessageWithSendParameters: %@ destinations: %@ accountID: %@",  buf,  0x20u);
  }

LABEL_32:
}

- (void)markOutgoingMessageWithGUID:(id)a3 asSent:(BOOL)a4
{
  id v6 = a3;
  if ([v6 length])
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1002F8A8C;
    v7[3] = &unk_1008F7DE0;
    void v7[4] = self;
    id v8 = v6;
    BOOL v9 = a4;
    -[IDSDMessageStore performBlock:](self, "performBlock:", v7);
  }
}

- (void)markAllOutgoingMessagesAsUnsent
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1002F8B48;
  v2[3] = &unk_1008F6010;
  v2[4] = self;
  -[IDSDMessageStore performBlock:](self, "performBlock:", v2);
}

- (void)markAllOutgoingMessagesAsUnsentForLocalDestination:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1002F8C14;
  v4[3] = &unk_1008F5F80;
  uint64_t v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[IDSDMessageStore performBlock:](v5, "performBlock:", v4);
}

- (void)deletePostponedMessages:(id)a3 classDDatabase:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1002F8D10;
  v8[3] = &unk_1008F5F58;
  id v9 = a3;
  id v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  -[IDSDMessageStore performBlock:](self, "performBlock:", v8);
}

- (void)deleteOutgoingMessageWithGUID:(id)a3 alternateGUID:(id)a4 classDDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 length])
  {
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSMessageStore](&OBJC_CLASS___IDSFoundationLog, "IDSMessageStore"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "deleteOutgoingMessageWithGUID:alternateGUID: {guid: %@, alternateGUID: %@}",  buf,  0x16u);
    }

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1002F8EC0;
    v12[3] = &unk_1008F60E8;
    v12[4] = self;
    id v13 = v8;
    id v14 = v9;
    id v15 = v10;
    -[IDSDMessageStore performBlock:](self, "performBlock:", v12);
  }
}

- (void)deleteIncomingMessageWithGUID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1002F9094;
    v5[3] = &unk_1008F5F80;
    v5[4] = self;
    id v6 = v4;
    -[IDSDMessageStore performBlock:](self, "performBlock:", v5);
  }
}

- (void)deleteExpiredIncomingMessagesOlderThan:(double)a3 withLimit:(int64_t)a4
{
  if (a3 != 0.0)
  {
    void v6[7] = v4;
    v6[8] = v5;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1002F9154;
    v6[3] = &unk_100900870;
    void v6[4] = self;
    *(double *)&v6[5] = a3;
    v6[6] = a4;
    -[IDSDMessageStore performBlock:](self, "performBlock:", v6);
  }

- (id)deleteExpiredIncomingRestrictedMessagesOlderThan:(double)a3
{
  if (a3 == 0.0)
  {
    id v3 = &__NSArray0__struct;
  }

  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1002F9288;
    v8[3] = &unk_1008FEDE8;
    id v9 = self;
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v10 = v5;
    double v11 = a3;
    -[IDSDMessageStore performBlock:](v9, "performBlock:", v8);
    id v6 = v10;
    id v3 = v5;
  }

  return v3;
}

- (void)updateExpirationForIncomingMessageWithGUID:(id)a3 expirationDate:(int64_t)a4
{
  id v6 = a3;
  if ([v6 length])
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1002F93AC;
    v7[3] = &unk_1008FEDE8;
    void v7[4] = self;
    id v8 = v6;
    int64_t v9 = a4;
    -[IDSDMessageStore performBlock:](self, "performBlock:", v7);
  }
}

- (void)__closeDatabase
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1002F9494;
  v4[3] = &unk_1008F6010;
  void v4[4] = self;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDMessageStore database](self, "database"));
  sub_1003AFB28(v4, 1LL, v3);
}

- (void)_clearDatabaseCloseTimer
{
  databaseCloseTimer = self->_databaseCloseTimer;
  if (databaseCloseTimer)
  {
    dispatch_source_cancel((dispatch_source_t)databaseCloseTimer);
    uint64_t v4 = self->_databaseCloseTimer;
    self->_databaseCloseTimer = 0LL;
  }

  -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
}

- (void)_setDatabaseCloseTimer
{
  self->_databaseLastUpdateTime = CFAbsoluteTimeGetCurrent();
  if (self->_databaseCloseTimer)
  {
    -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
  }

  else
  {
    id v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  0LL);
    databaseCloseTimer = self->_databaseCloseTimer;
    self->_databaseCloseTimer = v3;

    id v5 = self->_databaseCloseTimer;
    dispatch_time_t v6 = dispatch_time(0LL, 0x8BB2C90000LL);
    dispatch_source_set_timer((dispatch_source_t)v5, v6, 0x7FFFFFFFFFFFFFFFuLL, 0xDF8474CCCuLL);
    id v7 = self->_databaseCloseTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1002F95F4;
    handler[3] = &unk_1008F6010;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v7, handler);
    dispatch_resume((dispatch_object_t)self->_databaseCloseTimer);
    -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
  }

- (void)closeDatabase
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1002F9718;
  v3[3] = &unk_1008F6010;
  v3[4] = self;
  -[IDSDMessageStore performBlock:waitUntilDone:](self, "performBlock:waitUntilDone:", v3, 1LL);
}

- (void)deleteDatabase
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[IDSDMessageStore database](self, "database"));
  [v3 deleteDatabase];
}

- (void)performBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    id v6 = [v4 copy];

    id v10 = v6;
    id v7 = v6;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDMessageStore database]( self,  "database",  _NSConcreteStackBlock,  3221225472LL,  sub_1002F980C,  &unk_1008F6358,  self));
    sub_1003AFB28(&v9, 0LL, v8);
  }

- (void)performBlock:(id)a3 afterDelay:(double)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    id v8 = [v6 copy];

    id v12 = v8;
    id v9 = v8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDMessageStore database]( self,  "database",  _NSConcreteStackBlock,  3221225472LL,  sub_1002F9960,  &unk_1008F6358,  self));
    sub_1003AFB84(&v11, v10, a4);
  }

- (void)performBlock:(id)a3 waitUntilDone:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    id v8 = [v6 copy];

    id v12 = v8;
    id v9 = v8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDMessageStore database]( self,  "database",  _NSConcreteStackBlock,  3221225472LL,  sub_1002F9AC4,  &unk_1008F6358,  self));
    sub_1003AFB28(&v11, v4, v10);
  }

- (IDSDatabase)database
{
  return self->_database;
}

- (void).cxx_destruct
{
}

@end
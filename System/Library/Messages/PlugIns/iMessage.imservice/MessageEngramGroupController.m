@interface MessageEngramGroupController
+ (id)sharedInstance;
- (BOOL)_createGroupForExistingChat:(id)a3;
- (id)IDSServerBagiMessageSharedInstance;
- (id)_URIsForChatParticipants:(id)a3 fromID:(id)a4;
- (id)_URIsFromApplicationData:(id)a3;
- (id)_callerURIForChat:(id)a3;
- (id)_createApplicationDataForDestinations:(id)a3;
- (id)applicationDataDictionary:(id)a3;
- (id)lockDownManager;
- (int64_t)_daysToWaitBeforeCreatingEngroup;
- (void)_addRemoveParticipantsToENGroupForChat:(id)a3 participantsToAdd:(id)a4 participantsToRemove:(id)a5 service:(id)a6 fromID:(id)a7 attemptCount:(unint64_t)a8 completion:(id)a9;
- (void)_checkAndSetUpContext:(id)a3;
- (void)_createEngramGroupForChat:(id)a3 fromID:(id)a4 service:(id)a5 completion:(id)a6;
- (void)_createGroupFromGroupContext:(id)a3 chat:(id)a4 enparticipants:(id)a5 destinations:(id)a6 completion:(id)a7;
- (void)_createParticipantsAndUpdateGroup:(id)a3 addParticipantsURIs:(id)a4 removeParticipantURIs:(id)a5 fromID:(id)a6 service:(id)a7 completion:(id)a8;
- (void)_enparticipantsForDestinations:(id)a3 completion:(id)a4;
- (void)_updateGroupWithParticipants:(id)a3 chat:(id)a4 service:(id)a5 participants:(id)a6 destinations:(id)a7 completion:(id)a8;
- (void)_updateLocalParticipantsFromEngroup:(id)a3 chat:(id)a4 fromID:(id)a5;
- (void)addParticipantsToENGroup:(id)a3 chat:(id)a4 service:(id)a5 fromID:(id)a6 completion:(id)a7;
- (void)convergeOnIncomingGroup:(id)a3 chat:(id)a4 service:(id)a5;
- (void)groupContext:(id)a3 didUpdateGroup:(id)a4 withNewGroup:(id)a5;
- (void)lookUpENGroupForChat:(id)a3 service:(id)a4 completion:(id)a5;
- (void)removeParticipantsFromENGroup:(id)a3 chat:(id)a4 service:(id)a5 fromID:(id)a6 completion:(id)a7;
- (void)sendMessageWithEngram:(id)a3 chat:(id)a4 service:(id)a5 fromID:(id)a6 fromAccount:(id)a7 session:(id)a8 context:(id)a9 groupController:(id)a10 completionBlock:(id)a11;
@end

@implementation MessageEngramGroupController

- (id)IDSServerBagiMessageSharedInstance
{
  return +[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 1LL);
}

- (id)lockDownManager
{
  return +[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance");
}

+ (id)sharedInstance
{
  if (qword_E4518 != -1) {
    dispatch_once(&qword_E4518, &stru_D7128);
  }
  return (id)qword_E4520;
}

- (void)_checkAndSetUpContext:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_62E04;
  v3[3] = &unk_D7150;
  v3[4] = a3;
  v3[5] = self;
  if (qword_E32C0 != -1) {
    dispatch_once(&qword_E32C0, v3);
  }
}

- (void)lookUpENGroupForChat:(id)a3 service:(id)a4 completion:(id)a5
{
  id v9 = objc_msgSend(objc_msgSend(a3, "engramID"), "__im_engramDataRepresentation");
  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_62F7C;
    v12[3] = &unk_D71F0;
    v12[4] = self;
    v12[5] = v9;
    v12[6] = a3;
    v12[7] = a5;
    [a4 performGroupTask:v12];
  }

  else
  {
    if (IMOSLoggingEnabled(0LL, v10))
    {
      v11 = (os_log_s *)OSLogHandleForIMFoundationCategory("Warning");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = [a3 engramID];
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Couldn't create a valid NSData for engramid: %@", buf, 0xCu);
      }
    }

    (*((void (**)(id, void, void, NSError *))a5 + 2))( a5,  0LL,  0LL,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  EngramControllerErrorDomain,  3LL,  0LL));
  }

- (void)addParticipantsToENGroup:(id)a3 chat:(id)a4 service:(id)a5 fromID:(id)a6 completion:(id)a7
{
  if (IMOSLoggingEnabled(self, a2))
  {
    v13 = (os_log_s *)OSLogHandleForIMFoundationCategory("EngramGroup");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = a3;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "We are explicitly adding these participants: %@", buf, 0xCu);
    }
  }

  -[MessageEngramGroupController _addRemoveParticipantsToENGroupForChat:participantsToAdd:participantsToRemove:service:fromID:attemptCount:completion:]( self,  "_addRemoveParticipantsToENGroupForChat:participantsToAdd:participantsToRemove:service:fromID:attemptCount:completion:",  a4,  a3,  0LL,  a5,  a6,  0LL,  a7);
}

- (void)removeParticipantsFromENGroup:(id)a3 chat:(id)a4 service:(id)a5 fromID:(id)a6 completion:(id)a7
{
  if (IMOSLoggingEnabled(self, a2))
  {
    v13 = (os_log_s *)OSLogHandleForIMFoundationCategory("EngramGroup");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = a3;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "We are explicitly removing these participants: %@", buf, 0xCu);
    }
  }

  -[MessageEngramGroupController _addRemoveParticipantsToENGroupForChat:participantsToAdd:participantsToRemove:service:fromID:attemptCount:completion:]( self,  "_addRemoveParticipantsToENGroupForChat:participantsToAdd:participantsToRemove:service:fromID:attemptCount:completion:",  a4,  0LL,  a3,  a5,  a6,  0LL,  a7);
}

- (void)sendMessageWithEngram:(id)a3 chat:(id)a4 service:(id)a5 fromID:(id)a6 fromAccount:(id)a7 session:(id)a8 context:(id)a9 groupController:(id)a10 completionBlock:(id)a11
{
  id v17 = objc_msgSend(objc_msgSend(a4, "engramID"), "length");
  if (v17)
  {
    if (IMOSLoggingEnabled(v17, v18))
    {
      v19 = (os_log_s *)OSLogHandleForIMFoundationCategory("EngramGroup");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = a4;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "Looking up engram group for chat: %@", buf, 0xCu);
      }
    }

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_636DC;
    v26[3] = &unk_D7240;
    v26[11] = a5;
    v26[12] = a11;
    v26[4] = a4;
    v26[5] = a10;
    v26[6] = a3;
    v26[7] = a6;
    v26[8] = a7;
    v26[9] = a9;
    v26[10] = self;
    -[MessageEngramGroupController lookUpENGroupForChat:service:completion:]( self,  "lookUpENGroupForChat:service:completion:",  a4,  a5,  v26);
  }

  else
  {
    id v20 = [a4 createEngramGroupOnMessageSend];
    if ((v20 & 1) != 0
      || (id v20 = objc_msgSend(objc_msgSend(a4, "groupID"), "length")) != 0
      && (id v20 = (id)-[MessageEngramGroupController _createGroupForExistingChat:]( self,  "_createGroupForExistingChat:",  a4),  (_DWORD)v20))
    {
      if (IMOSLoggingEnabled(v20, v21))
      {
        v22 = (os_log_s *)OSLogHandleForIMFoundationCategory("EngramGroup");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v28 = [a4 groupID];
          _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "Going to create engram group for chat: %@", buf, 0xCu);
        }
      }

      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_63AC0;
      v25[3] = &unk_D7218;
      v25[9] = a9;
      v25[10] = a11;
      v25[4] = a10;
      v25[5] = a4;
      v25[6] = a3;
      v25[7] = a6;
      v25[8] = a7;
      -[MessageEngramGroupController _createEngramGroupForChat:fromID:service:completion:]( self,  "_createEngramGroupForChat:fromID:service:completion:",  a4,  a6,  a5,  v25);
    }

    else
    {
      if (IMOSLoggingEnabled(v20, v21))
      {
        v23 = (os_log_s *)OSLogHandleForIMFoundationCategory("EngramGroup");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( &dword_0,  v23,  OS_LOG_TYPE_INFO,  "We didn't create an engram group nor did we look one up so sending with legacy methods",  buf,  2u);
        }
      }

      LOBYTE(v24) = 1;
      (*((void (**)(id, id, id, id, id, id, id, void, void))a11 + 2))( a11,  a10,  a4,  a3,  a6,  a7,  a9,  0LL,  v24);
    }
  }

- (void)convergeOnIncomingGroup:(id)a3 chat:(id)a4 service:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_63C84;
  v5[3] = &unk_D7268;
  v5[4] = a4;
  v5[5] = a3;
  v5[6] = self;
  -[MessageEngramGroupController lookUpENGroupForChat:service:completion:]( self,  "lookUpENGroupForChat:service:completion:",  a4,  a5,  v5);
}

- (int64_t)_daysToWaitBeforeCreatingEngroup
{
  if (objc_msgSend( -[MessageEngramGroupController lockDownManager](self, "lockDownManager"),  "isInternalInstall")
    && (id v3 = (id)IMGetCachedDomainValueForKey(@"com.apple.madrid", @"DaysToWaitForEngroupCreation")) != 0LL
    || (v4 = -[MessageEngramGroupController IDSServerBagiMessageSharedInstance]( self,  "IDSServerBagiMessageSharedInstance"),  (id v3 = [v4 objectForKey:off_E2DC0]) != 0))
  {
    id v3 = [v3 integerValue];
    int64_t v6 = (int64_t)v3;
  }

  else
  {
    int64_t v6 = 7LL;
  }

  if (IMOSLoggingEnabled(v3, v5))
  {
    v7 = (os_log_s *)OSLogHandleForIMFoundationCategory("EngramGroup");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      uint64_t v10 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v6);
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Days to wait before creating engroup: %@", (uint8_t *)&v9, 0xCu);
    }
  }

  return v6;
}

- (BOOL)_createGroupForExistingChat:(id)a3
{
  id v5 = [a3 engroupCreationDate];
  if ((uint64_t)v5 < 1)
  {
    NSComparisonResult v6 = -[MessageEngramGroupController _daysToWaitBeforeCreatingEngroup](self, "_daysToWaitBeforeCreatingEngroup");
    if (v6 == NSOrderedSame) {
      goto LABEL_12;
    }
    uint64_t v10 = -[NSDate dateByAddingTimeInterval:]( +[NSDate date](&OBJC_CLASS___NSDate, "date"),  "dateByAddingTimeInterval:",  (double)(86400 * v6));
    if (IMOSLoggingEnabled(v10, v11))
    {
      v12 = (os_log_s *)OSLogHandleForIMFoundationCategory("EngramGroup");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v17 = 138412290;
        uint64_t v18 = v10;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Date to create engroup: %@", (uint8_t *)&v17, 0xCu);
      }
    }

    -[NSDate timeIntervalSince1970](v10, "timeIntervalSince1970");
    NSComparisonResult v6 = (NSComparisonResult)[a3 updateEngroupCreationDate:(uint64_t)v13];
LABEL_11:
    BOOL v9 = 0;
    goto LABEL_13;
  }

  NSComparisonResult v6 = -[NSDate compare:]( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)(uint64_t)v5),  "compare:",  +[NSDate date](&OBJC_CLASS___NSDate, "date"));
  if (v6 != NSOrderedAscending) {
    goto LABEL_11;
  }
  NSComparisonResult v6 = IMOSLoggingEnabled(-1LL, v7);
  if (!(_DWORD)v6)
  {
LABEL_12:
    BOOL v9 = 1;
    goto LABEL_13;
  }

  v8 = (os_log_s *)OSLogHandleForIMFoundationCategory("EngramGroup");
  BOOL v9 = 1;
  NSComparisonResult v6 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if ((_DWORD)v6)
  {
    LOWORD(v17) = 0;
    _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_INFO,  "Date creation is earlier than today, so we can go ahead and create the group",  (uint8_t *)&v17,  2u);
  }

- (void)_enparticipantsForDestinations:(id)a3 completion:(id)a4
{
  if (IMOSLoggingEnabled(self, a2))
  {
    NSComparisonResult v6 = (os_log_s *)OSLogHandleForIMFoundationCategory("EngramGroup");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = a3;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Going to create enparticipants for destinations: %@", buf, 0xCu);
    }
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_6444C;
  v7[3] = &unk_D7290;
  v7[4] = a4;
  +[IMIDSIDQueryController participantsForDestinations:service:listenerID:queue:completionBlock:]( &OBJC_CLASS___IMIDSIDQueryController,  "participantsForDestinations:service:listenerID:queue:completionBlock:",  a3,  IDSServiceNameiMessage,  @"__kMessageGroupControllerIDSIDQueryControllerListenerID",  &_dispatch_main_q,  v7);
}

- (id)_URIsForChatParticipants:(id)a3 fromID:(id)a4
{
  id v5 = a4;
  return objc_msgSend( URIsFromHandles(objc_msgSend(a3, "participants")),  "arrayByAddingObjectsFromArray:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));
}

- (id)_createApplicationDataForDestinations:(id)a3
{
  if ([a3 count])
  {
    uint64_t v10 = off_E2DB8;
    id v11 = a3;
    id v4 = (void *)JWEncodeDictionary( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
  }

  else
  {
    id v4 = 0LL;
  }

  if (![v4 length])
  {
    if (IMOSLoggingEnabled(0LL, v5))
    {
      NSComparisonResult v6 = (os_log_s *)OSLogHandleForIMFoundationCategory("Warning");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v8 = 138412290;
        id v9 = a3;
        _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_INFO,  "/**----We failed to create the shared application data!! Please file a radar!!! destinations: %@----*/",  (uint8_t *)&v8,  0xCu);
      }
    }

    id v4 = (void *)JWEncodeDictionary(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
  }

  return [v4 _FTCopyGzippedData];
}

- (void)_createEngramGroupForChat:(id)a3 fromID:(id)a4 service:(id)a5 completion:(id)a6
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_6468C;
  v6[3] = &unk_D72E0;
  v6[8] = a6;
  v6[4] = a5;
  v6[5] = self;
  v6[6] = a3;
  -[MessageEngramGroupController _enparticipantsForDestinations:completion:]( self,  "_enparticipantsForDestinations:completion:",  -[MessageEngramGroupController _URIsForChatParticipants:fromID:](self, "_URIsForChatParticipants:fromID:", a3, a4),  v6);
}

- (void)_createGroupFromGroupContext:(id)a3 chat:(id)a4 enparticipants:(id)a5 destinations:(id)a6 completion:(id)a7
{
  id v11 = -[MessageEngramGroupController _createApplicationDataForDestinations:]( self,  "_createApplicationDataForDestinations:",  a6);
  if (IMOSLoggingEnabled(v11, v12))
  {
    double v13 = (os_log_s *)OSLogHandleForIMFoundationCategory("EngramGroup");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = a3;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Creating group with context: %@", buf, 0xCu);
    }
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_64A40;
  v14[3] = &unk_D7330;
  v14[5] = a5;
  v14[6] = a7;
  v14[4] = a4;
  [a3 createGroupWithParticipants:a5 sharedApplicationData:v11 completion:v14];
}

- (void)_addRemoveParticipantsToENGroupForChat:(id)a3 participantsToAdd:(id)a4 participantsToRemove:(id)a5 service:(id)a6 fromID:(id)a7 attemptCount:(unint64_t)a8 completion:(id)a9
{
  if (a8 == 5)
  {
    (*((void (**)(id, void, void, NSError *))a9 + 2))( a9,  0LL,  0LL,  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  EngramControllerErrorDomain,  6LL,  0LL,  a6,  a7));
  }

  else
  {
    [a3 setPendingENGroupParticipantUpdate:1];
    if ([a4 count]) {
      id v15 = [a4 _URIsFromIDs];
    }
    else {
      id v15 = 0LL;
    }
    if ([a5 count]) {
      id v16 = [a5 _URIsFromIDs];
    }
    else {
      id v16 = 0LL;
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_64E4C;
    v17[3] = &unk_D7358;
    v17[5] = a4;
    v17[6] = a9;
    v17[4] = self;
    -[MessageEngramGroupController _createParticipantsAndUpdateGroup:addParticipantsURIs:removeParticipantURIs:fromID:service:completion:]( self,  "_createParticipantsAndUpdateGroup:addParticipantsURIs:removeParticipantURIs:fromID:service:completion:",  a3,  v15,  v16,  a7,  a6,  v17);
  }

- (void)_createParticipantsAndUpdateGroup:(id)a3 addParticipantsURIs:(id)a4 removeParticipantURIs:(id)a5 fromID:(id)a6 service:(id)a7 completion:(id)a8
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_6515C;
  v8[3] = &unk_D73A8;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a6;
  v8[7] = a4;
  v8[9] = a7;
  v8[10] = a8;
  v8[8] = a5;
  -[MessageEngramGroupController lookUpENGroupForChat:service:completion:]( self,  "lookUpENGroupForChat:service:completion:",  a3,  a7,  v8);
}

- (void)_updateGroupWithParticipants:(id)a3 chat:(id)a4 service:(id)a5 participants:(id)a6 destinations:(id)a7 completion:(id)a8
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_65598;
  v8[3] = &unk_D7448;
  v8[4] = self;
  v8[5] = a7;
  v8[6] = a3;
  v8[7] = a6;
  v8[8] = a4;
  v8[9] = a8;
  [a5 performGroupTask:v8];
}

- (id)applicationDataDictionary:(id)a3
{
  return (id)JWDecodeDictionary([a3 _FTOptionallyDecompressData]);
}

- (id)_URIsFromApplicationData:(id)a3
{
  id v3 = -[MessageEngramGroupController applicationDataDictionary:](self, "applicationDataDictionary:", a3);
  id v4 = [v3 objectForKey:off_E2DB8];
  if (![v4 count])
  {
    if (IMOSLoggingEnabled(0LL, v5))
    {
      NSComparisonResult v6 = (os_log_s *)OSLogHandleForIMFoundationCategory("Warning");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v8 = 0;
        _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_INFO,  "/**---Did not retrieve destinations from application data!! Please file a radar!! ---**//",  v8,  2u);
      }
    }

    return +[NSArray array](&OBJC_CLASS___NSArray, "array");
  }

  return v4;
}

- (void)_updateLocalParticipantsFromEngroup:(id)a3 chat:(id)a4 fromID:(id)a5
{
  id v7 = -[MessageEngramGroupController _URIsFromApplicationData:]( self,  "_URIsFromApplicationData:",  [a3 sharedApplicationData]);
  if ([v7 count])
  {
    id v47 = a5;
    id v9 = objc_msgSend( objc_msgSend( v7,  "arrayByExcludingObjectsInArray:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v47, 1)),  "__imSetFromArray");
    id v10 = objc_msgSend(URIsFromHandles(objc_msgSend(a4, "participants")), "__imSetFromArray");
    id v11 = [v9 mutableCopy];
    [v11 minusSet:v10];
    id v12 = objc_msgSend(objc_msgSend(v11, "allObjects"), "_IDsFromURIs");

    id v13 = [v10 mutableCopy];
    [v13 minusSet:v9];
    id v34 = objc_msgSend(objc_msgSend(v13, "allObjects"), "_IDsFromURIs");

    id v14 = [a4 serviceSession];
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    id v15 = [v12 countByEnumeratingWithState:&v39 objects:v46 count:16];
    id v33 = v15;
    if (v15)
    {
      uint64_t v17 = *(void *)v40;
      id v18 = v15;
      do
      {
        v19 = 0LL;
        do
        {
          if (*(void *)v40 != v17) {
            objc_enumerationMutation(v12);
          }
          uint64_t v20 = *(void *)(*((void *)&v39 + 1) + 8LL * (void)v19);
          if (IMOSLoggingEnabled(v15, v16))
          {
            uint64_t v21 = (os_log_s *)OSLogHandleForIMFoundationCategory("EngramGroup");
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              int v44 = 138412290;
              uint64_t v45 = v20;
              _os_log_impl( &dword_0,  v21,  OS_LOG_TYPE_INFO,  "  Adding participant from update: %@",  (uint8_t *)&v44,  0xCu);
            }
          }

          id v22 = [a4 chatIdentifier];
          LOBYTE(v32) = [a4 style];
          id v15 = objc_msgSend( v14,  "didChangeMemberStatus:forHandle:fromHandle:unformattedNumber:countryCode:forChat:style:account:destinationCallerID:",  2,  v20,  0,  0,  0,  v22,  v32,  objc_msgSend(v14, "account"),  a5);
          v19 = (char *)v19 + 1;
        }

        while (v18 != v19);
        id v15 = [v12 countByEnumeratingWithState:&v39 objects:v46 count:16];
        id v18 = v15;
      }

      while (v15);
    }

    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v23 = [v34 countByEnumeratingWithState:&v35 objects:v43 count:16];
    id v25 = v23;
    if (v23)
    {
      uint64_t v26 = *(void *)v36;
      do
      {
        v27 = 0LL;
        do
        {
          if (*(void *)v36 != v26) {
            objc_enumerationMutation(v34);
          }
          uint64_t v28 = *(void *)(*((void *)&v35 + 1) + 8LL * (void)v27);
          if (IMOSLoggingEnabled(v23, v24))
          {
            v29 = (os_log_s *)OSLogHandleForIMFoundationCategory("EngramGroup");
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              int v44 = 138412290;
              uint64_t v45 = v28;
              _os_log_impl( &dword_0,  v29,  OS_LOG_TYPE_INFO,  "  Removing participant from update: %@",  (uint8_t *)&v44,  0xCu);
            }
          }

          id v30 = [a4 chatIdentifier];
          LOBYTE(v32) = [a4 style];
          id v23 = objc_msgSend( v14,  "didChangeMemberStatus:forHandle:fromHandle:unformattedNumber:countryCode:forChat:style:account:destinationCallerID:",  3,  v28,  0,  0,  0,  v30,  v32,  objc_msgSend(v14, "account"),  a5);
          v27 = (char *)v27 + 1;
        }

        while (v25 != v27);
        id v23 = [v34 countByEnumeratingWithState:&v35 objects:v43 count:16];
        id v25 = v23;
      }

      while (v23);
    }

    else if (!v33)
    {
      return;
    }

    -[IMDChatStore storeChat:]( +[IMDChatStore sharedInstance](&OBJC_CLASS___IMDChatStore, "sharedInstance"),  "storeChat:",  a4);
  }

  else if (IMOSLoggingEnabled(0LL, v8))
  {
    v31 = (os_log_s *)OSLogHandleForIMFoundationCategory("Warning");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      LOWORD(v44) = 0;
      _os_log_impl( &dword_0,  v31,  OS_LOG_TYPE_INFO,  "/**---Did not retrieve destinations from application data!! Please file a radar!! ---**//",  (uint8_t *)&v44,  2u);
    }
  }

- (id)_callerURIForChat:(id)a3
{
  id v4 = [a3 serviceSession];
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___IMDAppleServiceSession);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v4, v5);
  if ((isKindOfClass & 1) != 0)
  {
    uint64_t v11 = 0LL;
    return _LastAddressedURIForChatLogMetricIfNeeded(a3, 0, [a3 serviceSession], &v11, 0);
  }

  else
  {
    if (IMOSLoggingEnabled(isKindOfClass, v7))
    {
      id v9 = (os_log_s *)OSLogHandleForIMFoundationCategory("Warning");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_INFO,  "/*****----We passed in a service session that is not an IMDAppleServiceSession subclass ----- PLEASE FILE A RA DAR!! -------*****/",  v10,  2u);
      }
    }

    return 0LL;
  }

- (void)groupContext:(id)a3 didUpdateGroup:(id)a4 withNewGroup:(id)a5
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_66170;
  block[3] = &unk_D7470;
  block[4] = a4;
  block[5] = self;
  block[6] = a5;
  dispatch_async(&_dispatch_main_q, block);
}

@end
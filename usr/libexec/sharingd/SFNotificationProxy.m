@interface SFNotificationProxy
- (OS_dispatch_queue)dispatchQueue;
- (SFNotificationProxy)init;
- (id)dismissedHandler;
- (id)externalID;
- (id)tappedHandler;
- (void)_requestPostOrUpdate:(id)a3 info:(id)a4 mediumVariant:(BOOL)a5 canPost:(BOOL)a6;
- (void)handleNotificationWasDismissed:(id)a3 reason:(int64_t)a4;
- (void)handleNotificationWasTapped:(id)a3;
- (void)requestPostOrUpdate:(id)a3 info:(id)a4 mediumVariant:(BOOL)a5;
- (void)requestRemove:(id)a3 withReason:(int64_t)a4;
- (void)requestRemoveAll;
- (void)requestUpdate:(id)a3 info:(id)a4 mediumVariant:(BOOL)a5 canPostNotification:(BOOL)a6;
- (void)reset;
- (void)setDismissedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setTappedHandler:(id)a3;
@end

@implementation SFNotificationProxy

- (SFNotificationProxy)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SFNotificationProxy;
  v2 = -[SFNotificationProxy init](&v7, "init");
  if (v2)
  {
    uint64_t v3 = CUMainQueue();
    uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;
  }

  return v2;
}

- (void)_requestPostOrUpdate:(id)a3 info:(id)a4 mediumVariant:(BOOL)a5 canPost:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v24 = a3;
  id v11 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  externalID = self->_externalID;
  if (externalID) {
    BOOL v13 = !v7;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    if (dword_100642038 <= 30
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
    {
      LogPrintF( &dword_100642038,  "-[SFNotificationProxy _requestPostOrUpdate:info:mediumVariant:canPost:]",  30LL,  "NotifProxy: Ignoring medium, already posted\n");
    }

    goto LABEL_38;
  }

  if (externalID)
  {
    internalIDs = self->_internalIDs;
    if (!internalIDs)
    {
      v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      v16 = self->_internalIDs;
      self->_internalIDs = v15;

      internalIDs = self->_internalIDs;
    }

    uint64_t v17 = objc_claimAutoreleasedReturnValue(-[SFNotificationProxy externalID](self, "externalID"));
    if (v17)
    {
      v18 = (void *)v17;
      if (dword_100642038 <= 30
        && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
      {
        LogPrintF( &dword_100642038,  "-[SFNotificationProxy _requestPostOrUpdate:info:mediumVariant:canPost:]",  30LL,  "NotifProxy: Updating notification (already posted) %@\n",  v18);
      }

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[SDNotificationManager sharedManager](&OBJC_CLASS___SDNotificationManager, "sharedManager"));
      [v23 homePodHandoffUpdateIfNeeded:v18 info:v11];
LABEL_37:

      self->_showingMedium = v7;
      objc_storeStrong((id *)&self->_triggeredID, a3);
    }
  }

  else if (v6)
  {
    v19 = self->_internalIDs;
    if (!v19)
    {
      v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      v21 = self->_internalIDs;
      self->_internalIDs = v20;

      v19 = self->_internalIDs;
    }

    -[NSMutableArray addObject:](v19, "addObject:", v24);
    uint64_t v22 = objc_claimAutoreleasedReturnValue(-[SFNotificationProxy externalID](self, "externalID"));
    if (v22)
    {
      v18 = (void *)v22;
      if (dword_100642038 <= 30
        && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
      {
        LogPrintF( &dword_100642038,  "-[SFNotificationProxy _requestPostOrUpdate:info:mediumVariant:canPost:]",  30LL,  "NotifProxy: Posting notification %@\n",  v18);
      }

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[SDNotificationManager sharedManager](&OBJC_CLASS___SDNotificationManager, "sharedManager"));
      [v23 homePodHandoffPostIfNeeded:v18 info:v11];
      goto LABEL_37;
    }
  }

  else if (dword_100642038 <= 30 {
         && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
  }
  {
    LogPrintF( &dword_100642038,  "-[SFNotificationProxy _requestPostOrUpdate:info:mediumVariant:canPost:]",  30LL,  "NotifProx: Not handling %@: %@\n",  v24,  v11);
  }

- (void)requestPostOrUpdate:(id)a3 info:(id)a4 mediumVariant:(BOOL)a5
{
}

- (void)requestRemove:(id)a3 withReason:(int64_t)a4
{
  id v24 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ((-[NSMutableArray containsObject:](self->_internalIDs, "containsObject:", v24) & 1) != 0)
  {
    BOOL v6 = self->_externalID;
    if (!v6)
    {
      if (dword_100642038 <= 90
        && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 90LL)))
      {
        LogPrintF( &dword_100642038,  "-[SFNotificationProxy requestRemove:withReason:]",  90LL,  "### NotifProxy: RequestRemove failed, no existing notification\n");
      }

      goto LABEL_44;
    }

    if (self->_showingMedium) {
      goto LABEL_4;
    }
    triggeredID = self->_triggeredID;
    BOOL v13 = (NSString *)v24;
    v14 = triggeredID;
    if (v14 == v13)
    {
    }

    else
    {
      v15 = v14;
      if ((v13 == 0LL) == (v14 != 0LL))
      {

        goto LABEL_33;
      }

      unsigned __int8 v16 = -[NSString isEqual:](v13, "isEqual:", v14);

      if ((v16 & 1) == 0)
      {
LABEL_33:
        if (dword_100642038 <= 30
          && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
        {
          LogPrintF( &dword_100642038,  "-[SFNotificationProxy requestRemove:withReason:]",  30LL,  "NotifProxy: Remove tracking of %@ per request\n",  v13);
        }

        -[NSMutableArray removeObject:](self->_internalIDs, "removeObject:", v13);
        id v23 = objc_retainBlock(self->_dismissedHandler);
        uint64_t v22 = v23;
        if (v23) {
          (*((void (**)(id, NSString *, int64_t))v23 + 2))(v23, v13, a4);
        }
        goto LABEL_43;
      }
    }

    if (self->_showingMedium) {
      goto LABEL_4;
    }
    uint64_t v17 = self->_triggeredID;
    v18 = v13;
    v19 = v17;
    if (v19 == v18)
    {
    }

    else
    {
      v20 = v19;
      if ((v18 == 0LL) == (v19 != 0LL))
      {

        goto LABEL_48;
      }

      unsigned int v21 = -[NSString isEqual:](v18, "isEqual:", v19);

      if (!v21)
      {
LABEL_48:
        if (!self->_showingMedium) {
          goto LABEL_44;
        }
LABEL_4:
        BOOL v7 = self->_triggeredID;
        v8 = (NSString *)v24;
        v9 = v7;
        if (v9 == v8)
        {
        }

        else
        {
          v10 = v9;
          if ((v8 == 0LL) == (v9 != 0LL))
          {

            goto LABEL_44;
          }

          unsigned int v11 = -[NSString isEqual:](v8, "isEqual:", v9);

          if (!v11) {
            goto LABEL_44;
          }
        }

- (void)requestRemoveAll
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDNotificationManager sharedManager](&OBJC_CLASS___SDNotificationManager, "sharedManager"));
  [v3 homePodHandoffRemoveAll];

  -[SFNotificationProxy reset](self, "reset");
}

- (void)requestUpdate:(id)a3 info:(id)a4 mediumVariant:(BOOL)a5 canPostNotification:(BOOL)a6
{
}

- (void)handleNotificationWasTapped:(id)a3
{
  id v4 = a3;
  v5 = v4;
  externalID = self->_externalID;
  id v14 = v4;
  if (externalID)
  {
    BOOL v7 = (NSString *)v4;
    v8 = externalID;
    if (v8 == v7)
    {

      goto LABEL_7;
    }

    v9 = v8;
    if (v7)
    {
      unsigned __int8 v10 = -[NSString isEqual:](v7, "isEqual:", v8);

      v5 = v14;
      if ((v10 & 1) == 0) {
        goto LABEL_11;
      }
LABEL_7:
      if (dword_100642038 <= 30
        && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
      {
        LogPrintF( &dword_100642038,  "-[SFNotificationProxy handleNotificationWasTapped:]",  30LL,  "NotifProxy: Tapped %@\n",  v7);
      }

      v12 = (void (**)(id, id))objc_retainBlock(self->_tappedHandler);
      if (v12)
      {
        id v13 = -[NSMutableArray copy](self->_internalIDs, "copy");
        v12[2](v12, v13);
      }

      -[SFNotificationProxy reset](self, "reset");
      goto LABEL_20;
    }

    v5 = v14;
  }

- (void)handleNotificationWasDismissed:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  if (dword_100642038 <= 30 && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
  {
    else {
      BOOL v7 = *(&off_1005CC9D0 + a4 - 1);
    }
    LogPrintF( &dword_100642038,  "-[SFNotificationProxy handleNotificationWasDismissed:reason:]",  30LL,  "NotifProxy: Did dismiss %@ (%@)",  v6,  v7);
  }

  v8 = (void (**)(id, void, int64_t))objc_retainBlock(self->_dismissedHandler);
  if (v8)
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    v9 = self->_internalIDs;
    id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          v8[2](v8, *(void *)(*((void *)&v14 + 1) + 8LL * (void)i), a4);
        }

        id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      }

      while (v11);
    }
  }

  -[SFNotificationProxy reset](self, "reset");
}

- (id)externalID
{
  externalID = self->_externalID;
  if (!externalID)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
    id v6 = self->_externalID;
    self->_externalID = v5;

    externalID = self->_externalID;
  }

  return externalID;
}

- (void)reset
{
  internalIDs = self->_internalIDs;
  self->_internalIDs = 0LL;

  externalID = self->_externalID;
  self->_externalID = 0LL;

  self->_showingMedium = 0;
  triggeredID = self->_triggeredID;
  self->_triggeredID = 0LL;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)dismissedHandler
{
  return self->_dismissedHandler;
}

- (void)setDismissedHandler:(id)a3
{
}

- (id)tappedHandler
{
  return self->_tappedHandler;
}

- (void)setTappedHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
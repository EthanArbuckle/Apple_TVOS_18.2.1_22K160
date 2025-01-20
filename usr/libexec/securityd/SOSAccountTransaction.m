@interface SOSAccountTransaction
- (BOOL)initialInCircle;
- (BOOL)initialTrusted;
- (BOOL)quiet;
- (NSData)initialKeyParameters;
- (NSMutableSet)peersToRequestSync;
- (NSSet)initialUnsyncedViews;
- (NSSet)initialViews;
- (NSString)description;
- (NSString)initialID;
- (SOSAccount)account;
- (SOSAccountTransaction)initWithAccount:(id)a3 quiet:(BOOL)a4;
- (unint64_t)currentTrustBitmask;
- (unsigned)initialCirclePeerCount;
- (void)finish;
- (void)requestSyncWith:(id)a3;
- (void)requestSyncWithPeers:(id)a3;
- (void)restart;
- (void)setAccount:(id)a3;
- (void)setInitialCirclePeerCount:(unsigned int)a3;
- (void)setInitialID:(id)a3;
- (void)setInitialInCircle:(BOOL)a3;
- (void)setInitialKeyParameters:(id)a3;
- (void)setInitialTrusted:(BOOL)a3;
- (void)setInitialUnsyncedViews:(id)a3;
- (void)setInitialViews:(id)a3;
- (void)setPeersToRequestSync:(id)a3;
- (void)setQuiet:(BOOL)a3;
- (void)start;
- (void)updateSOSCircleCachedStatus;
@end

@implementation SOSAccountTransaction

- (unint64_t)currentTrustBitmask
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SOSAccount queue](self->_account, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](self->_account, "trust"));
  uint64_t v5 = [v4 getCircleStatusOnly:0];

  if (-[SOSAccount accountKeyIsTrusted](self->_account, "accountKeyIsTrusted"))
  {
    v6 = -[SOSAccount accountPrivateKey](self->_account, "accountPrivateKey");
    unint64_t v7 = 0xE000000000000000LL;
    if (!v6) {
      unint64_t v7 = 0xC000000000000000LL;
    }
    unint64_t v8 = v7 | v5;
  }

  else
  {
    unint64_t v8 = v5 | 0x8000000000000000LL;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount trust](self->_account, "trust"));
  unsigned int v10 = [v9 isInCircleOnly:0];

  if (v10) {
    return v8 | 0x1000000000000000LL;
  }
  else {
    return v8;
  }
}

- (void)updateSOSCircleCachedStatus
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SOSAccount queue](self->_account, "queue"));
  dispatch_assert_queue_V2(v3);

  if (qword_1002DED90 != -1) {
    dispatch_once(&qword_1002DED90, &stru_100292060);
  }
  unint64_t v4 = -[SOSAccountTransaction currentTrustBitmask](self, "currentTrustBitmask");
  uint64_t v5 = v4;
  if ((qword_1002DED88 & 0x8000000000000000LL) == 0 || qword_1002DED88 != v4) {
    -[SOSAccount setNotifyCircleChangeOnExit:](self->_account, "setNotifyCircleChangeOnExit:", 1LL);
  }
  if (-[SOSAccount notifyCircleChangeOnExit](self->_account, "notifyCircleChangeOnExit"))
  {
    uint64_t v6 = qword_1002DED88;
    qword_1002DED88 = v5;
    unint64_t v7 = sub_10001267C("sosnotify");
    unint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v11 = qword_1002DED88;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "new last circle status is: %d", buf, 8u);
    }

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10019FAF8;
    v9[3] = &unk_1002920C8;
    v9[4] = self;
    v9[5] = v5;
    SOSCachedNotificationOperation(kSOSCCCircleChangedNotification, v9);
    if ((v6 & 0x8000000000000000LL) == 0) {
      -[SOSAccount setNotifyViewChangeOnExit:](self->_account, "setNotifyViewChangeOnExit:", 1LL);
    }
  }

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction initialViews](self, "initialViews"));
  if (v3)
  {
    unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction initialViews](self, "initialViews"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"<SOSAccountTransaction*@%p %ld>",  self,  [v4 count]));
  }

  else
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<SOSAccountTransaction*@%p %ld>",  self,  0LL));
  }

  return (NSString *)v5;
}

- (SOSAccountTransaction)initWithAccount:(id)a3 quiet:(BOOL)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SOSAccountTransaction;
  unint64_t v7 = -[SOSAccountTransaction init](&v10, "init");
  unint64_t v8 = v7;
  if (v7)
  {
    -[SOSAccountTransaction setAccount:](v7, "setAccount:", v6);
    v8->_quiet = a4;
    -[SOSAccountTransaction start](v8, "start");
  }

  return v8;
}

- (void)start
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
  -[SOSAccountTransaction setInitialInCircle:](self, "setInitialInCircle:", [v3 isInCircle:0]);

  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
  -[SOSAccountTransaction setInitialTrusted:](self, "setInitialTrusted:", [v4 accountKeyIsTrusted]);

  -[SOSAccountTransaction setInitialCirclePeerCount:](self, "setInitialCirclePeerCount:", 0LL);
  if (-[SOSAccountTransaction initialInCircle](self, "initialInCircle"))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 trust]);
    -[SOSAccountTransaction setInitialCirclePeerCount:]( self,  "setInitialCirclePeerCount:",  SOSCircleCountPeers([v6 trustedCircle]));
  }

  if (-[SOSAccountTransaction initialInCircle](self, "initialInCircle"))
  {
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
    sub_1001A249C(v7);
  }

  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
  CFMutableSetRef v9 = sub_1001A1784(v8);
  -[SOSAccountTransaction setInitialUnsyncedViews:](self, "setInitialUnsyncedViews:", v9);

  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
  int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 accountKeyDerivationParameters]);
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 accountKeyDerivationParameters]);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithData:](&OBJC_CLASS___NSData, "dataWithData:", v13));
    -[SOSAccountTransaction setInitialKeyParameters:](self, "setInitialKeyParameters:", v14);
  }

  else
  {
    -[SOSAccountTransaction setInitialKeyParameters:](self, "setInitialKeyParameters:", 0LL);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
  id v16 = [v15 peerInfo];

  if (v16)
  {
    v17 = (void *)SOSPeerInfoCopyEnabledViews(v16);
    -[SOSAccountTransaction setInitialViews:](self, "setInitialViews:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
    [v18 ensureOctagonPeerKeys];
  }

  -[SOSAccountTransaction setPeersToRequestSync:](self, "setPeersToRequestSync:", 0LL);
  sub_1001962F0(self);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
  if (objc_msgSend(v19, "key_interests_need_updating"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
    unsigned __int8 v21 = [v20 consolidateKeyInterest];

    if ((v21 & 1) != 0) {
      goto LABEL_14;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
    sub_1001B50DC(v19);
  }

LABEL_14:
  if (!-[SOSAccountTransaction quiet](self, "quiet"))
  {
    v22 = (const __CFSet *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction initialViews](self, "initialViews"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10019F9D0;
    v23[3] = &unk_1002920F0;
    v23[4] = self;
    sub_1000130AC(v22, (uint64_t)v23);
  }

- (void)restart
{
}

- (void)finish
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
  unsigned int v4 = [v3 notifyCircleChangeOnExit];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
  unsigned int v6 = [v5 SOSMonitorModeSOSIsActive];

  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
  unsigned int v8 = [v7 isInCircle:0];

  if (v8)
  {
    CFMutableSetRef v9 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction peersToRequestSync](self, "peersToRequestSync"));
    if (v9) {
      unsigned int v10 = v6;
    }
    else {
      unsigned int v10 = 0;
    }

    if (v10 == 1)
    {
      int v11 = (const __CFSet *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction peersToRequestSync](self, "peersToRequestSync"));
      -[SOSAccountTransaction setPeersToRequestSync:](self, "setPeersToRequestSync:", 0LL);
      sub_1001C3AE0(v11);
    }

    sub_1001962F0(self);
    if (v6)
    {
      id v12 = (id)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
      sub_1001A249C(v12);
      goto LABEL_20;
    }
  }

  else
  {
    sub_1001962F0(self);
  }

  id v12 = (id)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
  if ([v12 isListeningForSync])
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 trust]);
    id v14 = objc_msgSend(v13, "getDataSourceEngine:", objc_msgSend(v12, "factory"));

    v15 = sub_10001267C("initial-sync");
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v17)
      {
        LOWORD(buf) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Cancelling notifications to monitor in-sync",  (uint8_t *)&buf,  2u);
      }

      sub_1000D294C((uint64_t)v14, 0LL);
      sub_1000D2894((uint64_t)v14, 0LL);
    }

    else
    {
      if (v17)
      {
        LOWORD(buf) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "No engine to cancel notification from.",  (uint8_t *)&buf,  2u);
      }
    }

    [v12 setIsListeningForSync:0];
  }

LABEL_20:
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
  id v19 = [v18 peerInfo];

  if (v6)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction initialID](self, "initialID"));
    unsigned int v21 = [v20 isEqualToString:SOSPeerInfoGetPeerID(v19)];

    if (v21)
    {
      v22 = (void *)SOSViewCopyViewSet(0LL);
      -[SOSAccountTransaction setInitialUnsyncedViews:](self, "setInitialUnsyncedViews:", v22);
    }
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
  CFMutableSetRef v24 = sub_1001A1784(v23);

  if (!v6)
  {
    BOOL v28 = 0;
    goto LABEL_68;
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction initialUnsyncedViews](self, "initialUnsyncedViews"));
  if (!v25)
  {
    if (!v24) {
      goto LABEL_26;
    }
LABEL_29:
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction initialUnsyncedViews](self, "initialUnsyncedViews"));
    id v31 = v29;
    BOOL v28 = sub_1001A1A44(2LL, (BOOL)v30, (BOOL)v24);
    if (v28)
    {
      unsigned int v174 = v4;
      v172 = v24;
      id v32 = v31;
      v33 = sub_10001267C("initial-sync");
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Handling initial sync done.",  (uint8_t *)&buf,  2u);
      }

      v170 = v30;

      id v35 = v32;
      v36 = (void *)SOSViewCopyViewSet(3LL);
      v37 = (const __CFSet *)SOSViewCopyViewSet(1LL);
      v38 = (const __CFSet *)sub_10018DFDC(v35, (uint64_t)@"pendingEnableViews");
      if (!v38 || (v39 = v38, CFTypeID v40 = CFGetTypeID(v38), v40 != CFSetGetTypeID())) {
        v39 = 0LL;
      }
      id v41 = sub_10018DFDC(v35, (uint64_t)@"pendingDisableViews");
      if (!v41 || (id v42 = v41, v43 = CFGetTypeID(v41), v43 != CFSetGetTypeID())) {
        id v42 = 0LL;
      }
      if (v37)
      {
        *(void *)&__int128 buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472LL;
        v178 = sub_1001A1A34;
        v179 = &unk_100293EA8;
        id v180 = v36;
        CFSetApplyFunction(v37, (CFSetApplierFunction)sub_1001A1988, &buf);
      }

      if (v39)
      {
        *(void *)&__int128 buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472LL;
        v178 = sub_1001A1A34;
        v179 = &unk_100293EA8;
        id v180 = v36;
        CFSetApplyFunction(v39, (CFSetApplierFunction)sub_1001A1988, &buf);
      }

      if (v37) {
        CFRelease(v37);
      }
      v44 = (void *)objc_claimAutoreleasedReturnValue([v35 trust]);
      unsigned int v45 = [v44 updateViewSets:v35 enabled:v36 disabled:v42];

      if (v36) {
        CFRelease(v36);
      }
      unsigned int v4 = v174;
      v30 = v170;
      if (v45)
      {
        sub_1001A9290(v35, (uint64_t)@"pendingEnableViews", 0LL);
        sub_1001A9290(v35, (uint64_t)@"pendingDisableViews", 0LL);
        v46 = sub_10001267C("views");
        v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
        CFMutableSetRef v24 = v172;
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "updated view sets!", (uint8_t *)&buf, 2u);
        }

        v48 = (os_log_s *)v35;
      }

      else
      {
        v49 = sub_10001267C("SecError");
        v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
        CFMutableSetRef v24 = v172;
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "Could not update view sets",  (uint8_t *)&buf,  2u);
        }

        v51 = sub_10001267C("initial-sync");
        v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "Account could not add the pending view sets",  (uint8_t *)&buf,  2u);
        }
      }

      id v52 = v35;
      v53 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "waitForInitialSync_blocks"));
      objc_msgSend(v52, "setWaitForInitialSync_blocks:", 0);
      if (v53)
      {
        *(void *)&__int128 buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472LL;
        v178 = sub_1001A1BB0;
        v179 = &unk_100292328;
        id v180 = v52;
        CFDictionaryApplyFunction(v53, (CFDictionaryApplierFunction)sub_1001A1C78, &buf);

        CFRelease(v53);
      }
    }

    if (sub_1001A1A44(5LL, (BOOL)v30, (BOOL)v24))
    {
      v54 = sub_10001267C("initial-sync");
      v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "Handling Required Backup Sync done",  (uint8_t *)&buf,  2u);
      }

      BOOL v28 = 1;
    }

    v56 = sub_10001267C("initial-sync");
    v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction initialUnsyncedViews](self, "initialUnsyncedViews"));
      id v59 = (id)objc_claimAutoreleasedReturnValue([v58 shortDescription]);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v59;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Unsynced was: %@", (uint8_t *)&buf, 0xCu);
    }

    v60 = sub_10001267C("initial-sync");
    v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      id v62 = (id)objc_claimAutoreleasedReturnValue(-[__CFSet shortDescription](v24, "shortDescription"));
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v62;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Unsynced is: %@", (uint8_t *)&buf, 0xCu);
    }

    goto LABEL_66;
  }

  v26 = v25;
  unsigned __int8 v27 = [v25 isEqual:v24];

  if ((v27 & 1) == 0) {
    goto LABEL_29;
  }
LABEL_26:
  BOOL v28 = 0;
LABEL_66:
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
  unsigned int v64 = objc_msgSend(v63, "engine_peer_state_needs_repair");

  if (v64)
  {
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction account](self, "account"));
    sub_100192738(v65);

    BOOL v28 = 1;
  }

- (void)requestSyncWith:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction peersToRequestSync](self, "peersToRequestSync"));

  if (!v5)
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    -[SOSAccountTransaction setPeersToRequestSync:](self, "setPeersToRequestSync:", v6);
  }

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction peersToRequestSync](self, "peersToRequestSync"));
  [v7 addObject:v4];
}

- (void)requestSyncWithPeers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction peersToRequestSync](self, "peersToRequestSync"));

  if (!v5)
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    -[SOSAccountTransaction setPeersToRequestSync:](self, "setPeersToRequestSync:", v6);
  }

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[SOSAccountTransaction peersToRequestSync](self, "peersToRequestSync"));
  [v7 unionSet:v4];
}

- (SOSAccount)account
{
  return (SOSAccount *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setAccount:(id)a3
{
}

- (BOOL)initialInCircle
{
  return self->_initialInCircle;
}

- (void)setInitialInCircle:(BOOL)a3
{
  self->_initialInCircle = a3;
}

- (NSSet)initialViews
{
  return (NSSet *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setInitialViews:(id)a3
{
}

- (NSSet)initialUnsyncedViews
{
  return (NSSet *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setInitialUnsyncedViews:(id)a3
{
}

- (NSString)initialID
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setInitialID:(id)a3
{
}

- (BOOL)initialTrusted
{
  return self->_initialTrusted;
}

- (void)setInitialTrusted:(BOOL)a3
{
  self->_initialTrusted = a3;
}

- (NSData)initialKeyParameters
{
  return (NSData *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setInitialKeyParameters:(id)a3
{
}

- (unsigned)initialCirclePeerCount
{
  return self->_initialCirclePeerCount;
}

- (void)setInitialCirclePeerCount:(unsigned int)a3
{
  self->_initialCirclePeerCount = a3;
}

- (BOOL)quiet
{
  return self->_quiet;
}

- (void)setQuiet:(BOOL)a3
{
  self->_quiet = a3;
}

- (NSMutableSet)peersToRequestSync
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setPeersToRequestSync:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
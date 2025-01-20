@interface RPWiFiP2PTransaction
+ (id)sharedInstance;
- (NSMutableSet)activeClients;
- (void)activateForClient:(id)a3;
- (void)invalidateForClient:(id)a3;
@end

@implementation RPWiFiP2PTransaction

+ (id)sharedInstance
{
  if (qword_100133510 != -1) {
    dispatch_once(&qword_100133510, &stru_1001139B8);
  }
  return (id)qword_100133518;
}

- (void)activateForClient:(id)a3
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100070A30;
  v12[3] = &unk_100111968;
  v12[4] = self;
  id v4 = a3;
  id v13 = v4;
  v5 = objc_retainBlock(v12);
  v6 = self;
  objc_sync_enter(v6);
  id v7 = -[NSMutableSet count](v6->_activeClients, "count");
  objc_sync_exit(v6);

  if (!v7)
  {
    id v8 = -[objc_class shared](off_100132448(), "shared");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100070B1C;
    v10[3] = &unk_1001139E0;
    v10[4] = v6;
    id v11 = v4;
    [v9 beginTransaction:4 completionHandler:v10];
  }

  ((void (*)(void *))v5[2])(v5);
}

- (void)invalidateForClient:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (!-[NSMutableSet count](v4->_activeClients, "count"))
  {
LABEL_20:
    objc_sync_exit(v4);

    goto LABEL_21;
  }

  if ((-[NSMutableSet containsObject:](v4->_activeClients, "containsObject:", v7) & 1) == 0)
  {
    if (dword_1001323D8 <= 10
      && (dword_1001323D8 != -1 || _LogCategory_Initialize(&dword_1001323D8, 10LL)))
    {
      LogPrintF( &dword_1001323D8,  "-[RPWiFiP2PTransaction invalidateForClient:]",  10LL,  "WiFi P2P transaction invalidate failed because client '%@' is not active, current clients %@\n",  v7,  v4->_activeClients);
    }

    goto LABEL_20;
  }

  -[NSMutableSet removeObject:](v4->_activeClients, "removeObject:", v7);
  if (dword_1001323D8 <= 30 && (dword_1001323D8 != -1 || _LogCategory_Initialize(&dword_1001323D8, 30LL))) {
    LogPrintF( &dword_1001323D8,  "-[RPWiFiP2PTransaction invalidateForClient:]",  30LL,  "WiFi P2P transaction invalidate for client '%@'\n",  v7);
  }
  if (-[NSMutableSet count](v4->_activeClients, "count"))
  {
    if (dword_1001323D8 <= 30
      && (dword_1001323D8 != -1 || _LogCategory_Initialize(&dword_1001323D8, 30LL)))
    {
      LogPrintF( &dword_1001323D8,  "-[RPWiFiP2PTransaction invalidateForClient:]",  30LL,  "WiFi P2P transacton remains active, current clients %@\n",  v4->_activeClients);
    }

    goto LABEL_20;
  }

  objc_sync_exit(v4);

  id v5 = -[objc_class shared](off_100132448(), "shared");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v6 endTransaction:4];

LABEL_21:
}

- (NSMutableSet)activeClients
{
  return self->_activeClients;
}

- (void).cxx_destruct
{
}

@end
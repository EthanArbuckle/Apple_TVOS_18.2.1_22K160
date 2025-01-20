@interface IXSRemoteMessageHandler
+ (BOOL)_setHandlerIfNotExistingForIdentifier:(id)a3 messageHandler:(id)a4 withError:(id *)a5;
+ (id)_currentRemoteConnections;
+ (id)_handlerForIdentifier;
+ (id)_handlerForIdentifier:(id)a3 byRemovingEntry:(BOOL)a4;
+ (id)_sharedHandlerAccessQueue;
+ (void)_addToCurrentConnections:(id)a3;
+ (void)_cancelAndRemoveTrackedRemoteConnection:(id)a3;
+ (void)_handleInstallBeginMessage:(id)a3 forRemoteConnection:(id)a4;
+ (void)_handleQueryMessage:(id)a3 forRemoteConnection:(id)a4;
+ (void)_handleRevertStashMessage:(id)a3 forRemoteConnection:(id)a4;
+ (void)_handleUninstallMessage:(id)a3 forRemoteConnection:(id)a4;
+ (void)_removeFromCurrentConnections:(id)a3;
+ (void)_sendInstallError:(id)a3 forRemoteConnection:(id)a4;
+ (void)_sendQueryError:(id)a3 forRemoteConnection:(id)a4;
+ (void)_sendRevertError:(id)a3 forRemoteConnection:(id)a4;
+ (void)_sendUninstallError:(id)a3 forRemoteConnection:(id)a4;
+ (void)handleMessageFromPeer:(id)a3;
- (IXSRemoteConnection)remoteConnection;
- (IXSRemoteInstallAction)remoteInstallAction;
- (id)_initWithConnection:(id)a3 remoteInstallAction:(id)a4;
- (void)remoteInstaller:(id)a3 canceledWithReason:(id)a4;
- (void)remoteInstaller:(id)a3 completedWithInstallResult:(id)a4;
- (void)remoteInstaller:(id)a3 didUpdateProgress:(double)a4 forPhase:(unsigned __int8)a5 overallProgress:(double)a6;
- (void)remoteReverter:(id)a3 canceledWithError:(id)a4;
- (void)remoteReverter:(id)a3 completedWithResult:(id)a4;
- (void)remoteUninstaller:(id)a3 completedWithError:(id)a4;
- (void)setRemoteConnection:(id)a3;
- (void)setRemoteInstallAction:(id)a3;
@end

@implementation IXSRemoteMessageHandler

+ (id)_handlerForIdentifier
{
  if (qword_100026EF0 != -1) {
    dispatch_once(&qword_100026EF0, &stru_1000206E8);
  }
  return (id)qword_100026EE8;
}

+ (id)_currentRemoteConnections
{
  if (qword_100026F00 != -1) {
    dispatch_once(&qword_100026F00, &stru_100020708);
  }
  return (id)qword_100026EF8;
}

+ (void)_addToCurrentConnections:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 _sharedHandlerAccessQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005FE4;
  block[3] = &unk_100020730;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  dispatch_sync(v5, block);
}

+ (void)_removeFromCurrentConnections:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 _sharedHandlerAccessQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000060BC;
  block[3] = &unk_100020730;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  dispatch_sync(v5, block);
}

+ (id)_sharedHandlerAccessQueue
{
  if (qword_100026F10 != -1) {
    dispatch_once(&qword_100026F10, &stru_100020750);
  }
  return (id)qword_100026F08;
}

+ (BOOL)_setHandlerIfNotExistingForIdentifier:(id)a3 messageHandler:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  v23 = sub_1000062D8;
  v24 = sub_1000062E8;
  id v25 = 0LL;
  v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 _sharedHandlerAccessQueue]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000062F0;
  v15[3] = &unk_100020778;
  id v19 = a1;
  id v11 = v8;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  v18 = &v20;
  dispatch_sync(v10, v15);

  if (a5) {
    *a5 = (id) v21[5];
  }
  BOOL v13 = v21[5] == 0;

  _Block_object_dispose(&v20, 8);
  return v13;
}

+ (id)_handlerForIdentifier:(id)a3 byRemovingEntry:(BOOL)a4
{
  id v6 = a3;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  id v19 = sub_1000062D8;
  uint64_t v20 = sub_1000062E8;
  id v21 = 0LL;
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 _sharedHandlerAccessQueue]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000652C;
  v11[3] = &unk_1000207A0;
  BOOL v13 = &v16;
  id v14 = a1;
  id v12 = v6;
  BOOL v15 = a4;
  id v8 = v6;
  dispatch_sync(v7, v11);

  id v9 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v9;
}

+ (void)_cancelAndRemoveTrackedRemoteConnection:(id)a3
{
  id v4 = a3;
  [v4 cancel];
  [a1 _removeFromCurrentConnections:v4];
}

+ (void)_sendInstallError:(id)a3 forRemoteConnection:(id)a4
{
  id v5 = a4;
  id v6 = sub_100008514(a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  [v5 sendMessage:v7];
}

+ (void)_handleInstallBeginMessage:(id)a3 forRemoteConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (sub_100009164(v6) == 1)
  {
    xpc_object_t v8 = sub_100008C1C(v6);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    uint64_t v10 = sub_100008C28(v6);
    id v11 = sub_1000085A8(v6);
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (v13 && v9)
    {
      id v14 = sub_10000F01C((uint64_t)off_100026DA8);
      BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v33 = "+[IXSRemoteMessageHandler _handleInstallBeginMessage:forRemoteConnection:]";
        __int16 v34 = 2112;
        v35 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s: Handling kIXRemoteRequestTypeInstall with options: %@",  buf,  0x16u);
      }

      id v31 = 0LL;
      uint64_t v16 = -[IXSRemoteInstaller initWithRemoteInstallOptions:xpcAssetStream:assetSize:error:]( objc_alloc(&OBJC_CLASS___IXSRemoteInstaller),  "initWithRemoteInstallOptions:xpcAssetStream:assetSize:error:",  v13,  v9,  v10,  &v31);
      id v17 = v31;
      uint64_t v18 = v17;
      if (v16)
      {
        v29 = v9;
        id v19 = -[IXSRemoteMessageHandler _initWithConnection:remoteInstallAction:]( objc_alloc(&OBJC_CLASS___IXSRemoteMessageHandler),  "_initWithConnection:remoteInstallAction:",  v7,  v16);
        -[IXSRemoteInstaller setDelegate:](v16, "setDelegate:", v19);
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[IXSRemoteInstaller bundleID](v16, "bundleID"));
        id v30 = v18;
        unsigned int v21 = [a1 _setHandlerIfNotExistingForIdentifier:v20 messageHandler:v19 withError:&v30];
        id v22 = v30;

        if (v21)
        {
          -[IXSRemoteInstaller beginTransferAndInstall](v16, "beginTransferAndInstall");
          uint64_t v18 = v22;
          id v9 = v29;
LABEL_20:

          goto LABEL_21;
        }

        uint64_t v18 = v22;
        id v9 = v29;
        if (!v22) {
          goto LABEL_20;
        }
      }

      else
      {
        id v19 = 0LL;
        if (!v17) {
          goto LABEL_20;
        }
      }
    }

    else
    {
      id v25 = sub_1000095BC( (uint64_t)"+[IXSRemoteMessageHandler _handleInstallBeginMessage:forRemoteConnection:]",  145LL,  @"IXRemoteErrorDomain",  2LL,  0LL,  0LL,  @"Failed to create configuration required to install from the incoming message",  v12,  v28);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v25);
      id v19 = 0LL;
      uint64_t v16 = 0LL;
      if (!v18) {
        goto LABEL_20;
      }
    }

    v26 = sub_10000F01C((uint64_t)off_100026DA8);
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_100013548(v13);
    }

    [a1 _sendInstallError:v18 forRemoteConnection:v7];
    goto LABEL_20;
  }

  v23 = sub_10000F01C((uint64_t)off_100026DA8);
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    sub_1000135DC();
  }

  [a1 _cancelAndRemoveTrackedRemoteConnection:v7];
LABEL_21:
}

+ (void)_sendUninstallError:(id)a3 forRemoteConnection:(id)a4
{
  id v5 = a4;
  id v6 = sub_100008D4C(a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  [v5 sendMessage:v7];
}

+ (void)_sendQueryError:(id)a3 forRemoteConnection:(id)a4
{
  id v5 = a4;
  id v6 = sub_100008F74(0LL, a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  [v5 sendMessage:v7];
}

+ (void)_handleUninstallMessage:(id)a3 forRemoteConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (sub_100009164(v6) == 1)
  {
    id v27 = 0LL;
    id v28 = 0LL;
    sub_100008C34(v6, &v28, &v27);
    id v8 = v28;
    id v9 = v27;
    id v11 = v9;
    if (v8)
    {
      if (!v9)
      {
        id v22 = sub_10000F01C((uint64_t)off_100026DA8);
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          id v30 = "+[IXSRemoteMessageHandler _handleUninstallMessage:forRemoteConnection:]";
          __int16 v31 = 2112;
          id v32 = v8;
          __int16 v33 = 2112;
          uint64_t v34 = 0LL;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%s: Handling kIXRemoteRequestTypeUninstall for bundleID %@, path: %@",  buf,  0x20u);
        }

        id v19 = -[IXSRemoteUninstaller initWithBundleID:]( objc_alloc(&OBJC_CLASS___IXSRemoteUninstaller),  "initWithBundleID:",  v8);
        id v21 = v8;
        id v20 = -[IXSRemoteMessageHandler _initWithConnection:remoteInstallAction:]( objc_alloc(&OBJC_CLASS___IXSRemoteMessageHandler),  "_initWithConnection:remoteInstallAction:",  v7,  v19);
        id v26 = 0LL;
        unsigned int v24 = [a1 _setHandlerIfNotExistingForIdentifier:v21 messageHandler:v20 withError:&v26];
        id v18 = v26;
        if (v24)
        {
          -[IXSRemoteUninstaller setDelegate:](v19, "setDelegate:", v20);
          -[IXSRemoteUninstaller beginUninstall](v19, "beginUninstall");
LABEL_12:

          goto LABEL_13;
        }

+ (void)_sendRevertError:(id)a3 forRemoteConnection:(id)a4
{
  id v5 = a4;
  id v6 = sub_100009204(0LL, a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  [v5 sendMessage:v7];
}

+ (void)_handleRevertStashMessage:(id)a3 forRemoteConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (sub_100009164(v6) == 1)
  {
    id v8 = sub_100009184(v6);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if (v10)
    {
      id v11 = -[IXSRemoteReverter initWithBundleID:]( objc_alloc(&OBJC_CLASS___IXSRemoteReverter),  "initWithBundleID:",  v10);
      id v12 = -[IXSRemoteMessageHandler _initWithConnection:remoteInstallAction:]( objc_alloc(&OBJC_CLASS___IXSRemoteMessageHandler),  "_initWithConnection:remoteInstallAction:",  v7,  v11);
      -[IXSRemoteReverter setDelegate:](v11, "setDelegate:", v12);
      id v19 = 0LL;
      unsigned int v13 = [a1 _setHandlerIfNotExistingForIdentifier:v10 messageHandler:v12 withError:&v19];
      id v14 = v19;
      if (v13)
      {
        -[IXSRemoteReverter beginRevert](v11, "beginRevert");
        goto LABEL_11;
      }
    }

    else
    {
      id v17 = sub_1000095BC( (uint64_t)"+[IXSRemoteMessageHandler _handleRevertStashMessage:forRemoteConnection:]",  284LL,  @"IXRemoteErrorDomain",  2LL,  0LL,  0LL,  @"bundleID unspecified while requesting to perform revert",  v9,  v18);
      id v14 = (id)objc_claimAutoreleasedReturnValue(v17);
      id v11 = 0LL;
      id v12 = 0LL;
    }

    if (!v14)
    {
LABEL_12:

      goto LABEL_13;
    }

    [a1 _sendRevertError:v14 forRemoteConnection:v7];
LABEL_11:

    goto LABEL_12;
  }

  BOOL v15 = sub_10000F01C((uint64_t)off_100026DA8);
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_1000136B4();
  }

  [a1 _cancelAndRemoveTrackedRemoteConnection:v7];
LABEL_13:
}

+ (void)_handleQueryMessage:(id)a3 forRemoteConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (sub_100009164(v6) == 1)
  {
    id v44 = 0LL;
    id v45 = 0LL;
    id v43 = 0LL;
    sub_100008DE8(v6, &v45, &v44, &v43);
    id v8 = v45;
    unint64_t v9 = (unint64_t)v44;
    unint64_t v10 = (unint64_t)v43;
    id v12 = (void *)v10;
    if (v8)
    {
      if (!(v9 | v10))
      {
        id v41 = (id)v10;
        id v21 = sub_10000F01C((uint64_t)off_100026DA8);
        id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue([0 path]);
          *(_DWORD *)buf = 136315650;
          v47 = "+[IXSRemoteMessageHandler _handleQueryMessage:forRemoteConnection:]";
          __int16 v48 = 2112;
          id v49 = v8;
          __int16 v50 = 2112;
          v51 = v23;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%s: Handling kIXRemoteRequestTypeQuery for bundleID %@, path: %@",  buf,  0x20u);
        }

        id v42 = 0LL;
        id v20 = [[LSApplicationRecord alloc] initWithBundleIdentifier:v8 allowPlaceholder:0 error:&v42];
        id v19 = v42;
        if (v20)
        {
          id v39 = v8;
          unint64_t v40 = v9;
          v38 = objc_alloc(&OBJC_CLASS___IXRemoteInstallResult);
          unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue([v20 databaseUUID]);
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v20 sequenceNumber]));
          id v26 = (void *)objc_claimAutoreleasedReturnValue([v20 URL]);
          id v27 = (void *)objc_claimAutoreleasedReturnValue([v20 persistentIdentifier]);
          id v28 = -[IXRemoteInstallResult initWithDBUUID:dbSequenceNumber:URLOfInstalledApp:persistentIdentifier:]( v38,  "initWithDBUUID:dbSequenceNumber:URLOfInstalledApp:persistentIdentifier:",  v24,  v25,  v26,  v27);

          if (v28)
          {
            id v29 = sub_100008F74(v28, 0LL);
            id v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
            [v7 sendMessage:v30];

            unint64_t v9 = v40;
            id v12 = v41;
            id v8 = v39;
            goto LABEL_11;
          }

          unint64_t v9 = v40;
          id v12 = v41;
          id v8 = v39;
        }

        else
        {
          __int16 v31 = sub_10000F01C((uint64_t)off_100026DA8);
          id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            sub_100013720();
          }

          v37 = (void *)objc_claimAutoreleasedReturnValue([0 path]);
          id v34 = sub_1000095BC( (uint64_t)"+[IXSRemoteMessageHandler _handleQueryMessage:forRemoteConnection:]",  355LL,  @"IXRemoteErrorDomain",  5LL,  v19,  0LL,  @"LaunchServices did not have a record for bundleID %@, path : %@",  v33,  (uint64_t)v8);
          uint64_t v35 = objc_claimAutoreleasedReturnValue(v34);

          id v20 = 0LL;
          id v19 = (id)v35;
          id v12 = v41;
        }

+ (void)handleMessageFromPeer:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, v4);
  [a1 _addToCurrentConnections:v4];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000735C;
  v5[3] = &unk_1000207C8;
  objc_copyWeak(v6, &location);
  v6[1] = a1;
  [v4 setEventHandler:v5];
  [v4 activate];
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

- (id)_initWithConnection:(id)a3 remoteInstallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___IXSRemoteMessageHandler;
  id v8 = -[IXSRemoteMessageHandler init](&v11, "init");
  unint64_t v9 = v8;
  if (v8)
  {
    -[IXSRemoteMessageHandler setRemoteConnection:](v8, "setRemoteConnection:", v6);
    -[IXSRemoteMessageHandler setRemoteInstallAction:](v9, "setRemoteInstallAction:", v7);
  }

  return v9;
}

- (void)remoteInstaller:(id)a3 completedWithInstallResult:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_opt_class(self);
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleID]);

  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 _handlerForIdentifier:v9 byRemovingEntry:1]);
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 remoteConnection]);

  if (v11)
  {
    id v12 = sub_10000831C(v6);
    unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    [v11 sendMessage:v13];
  }

  else
  {
    uint64_t v14 = sub_10000F01C((uint64_t)off_100026DA8);
    unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000139A8(v13, v15, v16, v17, v18, v19, v20, v21);
    }
  }
}

- (void)remoteInstaller:(id)a3 canceledWithReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10000F01C((uint64_t)off_100026DA8);
  unint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleID]);
    int v25 = 136315650;
    id v26 = "-[IXSRemoteMessageHandler remoteInstaller:canceledWithReason:]";
    __int16 v27 = 2112;
    id v28 = v10;
    __int16 v29 = 2112;
    id v30 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to install %@ - getting back to the client : %@",  (uint8_t *)&v25,  0x20u);
  }

  objc_super v11 = (void *)objc_opt_class(self);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleID]);
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v11 _handlerForIdentifier:v12 byRemovingEntry:1]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 remoteConnection]);

  if (v14)
  {
    id v15 = sub_100008514(v7);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    [v14 sendMessage:v16];
  }

  else
  {
    uint64_t v17 = sub_10000F01C((uint64_t)off_100026DA8);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100013A18(v16, v18, v19, v20, v21, v22, v23, v24);
    }
  }
}

- (void)remoteInstaller:(id)a3 didUpdateProgress:(double)a4 forPhase:(unsigned __int8)a5 overallProgress:(double)a6
{
  unsigned int v7 = a5;
  id v10 = a3;
  objc_super v11 = sub_10000F01C((uint64_t)off_100026DA8);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_100013AF8(v10, v12, a6);
  }

  unsigned int v13 = (void *)objc_opt_class(self);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleID]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 _handlerForIdentifier:v14 byRemovingEntry:0]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 remoteConnection]);

  if (v16)
  {
    id v17 = sub_100008470(v7, a4, a6);
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    [v16 sendMessage:v18];
  }

  else
  {
    uint64_t v19 = sub_10000F01C((uint64_t)off_100026DA8);
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100013A88(v18, v20, v21, v22, v23, v24, v25, v26);
    }
  }
}

- (void)remoteUninstaller:(id)a3 completedWithError:(id)a4
{
  id v6 = a4;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([a3 bundleID]);
  id v8 = [(id)objc_opt_class(self) _handlerForIdentifier:v7 byRemovingEntry:1];
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 remoteConnection]);

  if (v10)
  {
    id v11 = sub_100008D4C(v6);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    [v10 sendMessage:v12];
  }

  else
  {
    unsigned int v13 = sub_10000F01C((uint64_t)off_100026DA8);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100013BAC(v12, v14, v15, v16, v17, v18, v19, v20);
    }
  }
}

- (void)remoteReverter:(id)a3 canceledWithError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_opt_class(self);
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleID]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 _handlerForIdentifier:v9 byRemovingEntry:1]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 remoteConnection]);

  if (v11)
  {
    id v12 = sub_100009204(0LL, v6);
    unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    [v11 sendMessage:v13];
  }

  else
  {
    uint64_t v14 = sub_10000F01C((uint64_t)off_100026DA8);
    unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100013C1C(v13, v15, v16, v17, v18, v19, v20, v21);
    }
  }
}

- (void)remoteReverter:(id)a3 completedWithResult:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_opt_class(self);
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleID]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 _handlerForIdentifier:v9 byRemovingEntry:1]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 remoteConnection]);

  if (v11)
  {
    id v12 = sub_100009204(v6, 0LL);
    unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    [v11 sendMessage:v13];
  }

  else
  {
    uint64_t v14 = sub_10000F01C((uint64_t)off_100026DA8);
    unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100013C8C(v13, v15, v16, v17, v18, v19, v20, v21);
    }
  }
}

- (IXSRemoteConnection)remoteConnection
{
  return self->_remoteConnection;
}

- (void)setRemoteConnection:(id)a3
{
}

- (IXSRemoteInstallAction)remoteInstallAction
{
  return self->_remoteInstallAction;
}

- (void)setRemoteInstallAction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface IMDaemonFileProviderRequestHandler
- (BOOL)isListeningForExplicitDownloadFileTransferNotifications;
- (id)_retrieveLocalFileURLForFileTransferWithGUID:(id)a3 options:(int64_t)a4 outTransfer:(id *)a5;
- (void)_handleExplicitDownloadCompletedNotification:(id)a3;
- (void)_setupFileTransferExplicitDownloadNotificationListenersIfNecessary;
- (void)downloadFileTransferWithLocalURL:(id)a3;
- (void)retrieveLocalFileURLForFileTransferWithGUID:(id)a3 options:(int64_t)a4;
- (void)retrieveLocalFileURLForFileTransferWithGUIDs:(id)a3 options:(int64_t)a4;
- (void)setListeningForExplicitDownloadFileTransferNotifications:(BOOL)a3;
@end

@implementation IMDaemonFileProviderRequestHandler

- (void)_setupFileTransferExplicitDownloadNotificationListenersIfNecessary
{
  if (!self->_listeningForExplicitDownloadFileTransferNotifications)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 addObserver:self selector:"_handleExplicitDownloadCompletedNotification:" name:IMDFileTransferExplicitDownloadCompletedNotification object:0];

    self->_listeningForExplicitDownloadFileTransferNotifications = 1;
  }

- (void)retrieveLocalFileURLForFileTransferWithGUID:(id)a3 options:(int64_t)a4
{
  id v6 = a3;
  id v15 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[IMDaemonFileProviderRequestHandler _retrieveLocalFileURLForFileTransferWithGUID:options:outTransfer:]( self,  "_retrieveLocalFileURLForFileTransferWithGUID:options:outTransfer:",  v6,  a4,  &v15));
  id v8 = v15;
  id v9 = [v7 length];
  if (v9 && v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v8 localPath]);
    [v11 _handleFileTransfer:v7 acceptedWithPath:v12 autoRename:1 overwrite:0 options:a4 postNotification:1];
  }

  if (IMOSLoggingEnabled(v9, v10))
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory("IMDaemon_FileTransfers");
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[IMDaemonFileProviderRequestHandler retrieveLocalFileURLForFileTransferWithGUID:options:]";
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s Successfully started explicit download for local file url retrieval of transfer with GUID %@",  buf,  0x16u);
    }
  }
}

- (id)_retrieveLocalFileURLForFileTransferWithGUID:(id)a3 options:(int64_t)a4 outTransfer:(id *)a5
{
  id v8 = a3;
  -[IMDaemonFileProviderRequestHandler _setupFileTransferExplicitDownloadNotificationListenersIfNecessary]( self,  "_setupFileTransferExplicitDownloadNotificationListenersIfNecessary");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
  id v20 = 0LL;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 _retrieveLocalFileURLForFileTransferWithGUID:v8 options:a4 outTransfer:a5 outError:&v20]);
  id v11 = v20;

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[IMDBroadcastController sharedProvider](&OBJC_CLASS___IMDBroadcastController, "sharedProvider"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 broadcasterForFileProviderListeners]);
    [v13 fileTransferExplicitDownloadFailed:v8 suggestedRetryGUID:v10 error:v11];

    id v14 = 0LL;
  }

  else
  {
    if (a5 && [*a5 existsAtLocalPath])
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[IMDBroadcastController sharedProvider](&OBJC_CLASS___IMDBroadcastController, "sharedProvider"));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 broadcasterForFileProviderListeners]);
      v17 = (void *)objc_claimAutoreleasedReturnValue([*a5 localPath]);
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([*a5 createAndPersistLivePhotoBundleIfNecessary]);
      [v16 fileTransfer:v8 explicitDownloadSucceededWithPath:v17 livePhotoBundlePath:v18];
    }

    id v14 = v10;
  }

  return v14;
}

- (void)retrieveLocalFileURLForFileTransferWithGUIDs:(id)a3 options:(int64_t)a4
{
  id v6 = a3;
  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v23;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)v11);
        id v21 = 0LL;
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[IMDaemonFileProviderRequestHandler _retrieveLocalFileURLForFileTransferWithGUID:options:outTransfer:]( self,  "_retrieveLocalFileURLForFileTransferWithGUID:options:outTransfer:",  v12,  a4,  &v21));
        id v14 = v21;
        if ([v13 length]) {
          BOOL v15 = v14 == 0LL;
        }
        else {
          BOOL v15 = 1;
        }
        if (!v15) {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v14, v13);
        }

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }

    while (v9);
  }

  if (-[NSMutableDictionary count](v7, "count"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
    [v16 _handleFileTransfers:v7 autoRename:1 overwrite:0 options:a4 postNotification:1];

    if (IMOSLoggingEnabled(v17, v18))
    {
      uint64_t v19 = OSLogHandleForIMFoundationCategory("IMDaemon_FileTransfers");
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v27 = "-[IMDaemonFileProviderRequestHandler retrieveLocalFileURLForFileTransferWithGUIDs:options:]";
        __int16 v28 = 2112;
        v29 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%s Successfully started explicit download for local file url retrieval of transfer with GUIDs %@",  buf,  0x16u);
      }
    }
  }
}

- (void)_handleExplicitDownloadCompletedNotification:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:IMDFileTransferExplicitDownloadCompletedSuccessKey]);

  if (!v5 && IMOSLoggingEnabled(v6, v7))
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory("Warning");
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v31) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Unable to determine if file transfer explicit download succeeded from notification. Assuming the explicit download failed.",  (uint8_t *)&v31,  2u);
    }
  }

  unsigned int v10 = [v5 BOOLValue];
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 object]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 guid]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  id v14 = v13;
  if (v10)
  {
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:IMDFileTransferExplicitDownloadCompletedFileURLKey]);

    if (!v15 && IMOSLoggingEnabled(v16, v17))
    {
      uint64_t v18 = OSLogHandleForIMFoundationCategory("Warning");
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        LOWORD(v31) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "File transfer URL could not be derived from IMDFileTransferExplicitDownloadCompletedNotification.",  (uint8_t *)&v31,  2u);
      }
    }

    id v20 = (void *)objc_claimAutoreleasedReturnValue([v15 path]);
    if (IMOSLoggingEnabled(v20, v21))
    {
      uint64_t v22 = OSLogHandleForIMFoundationCategory("IMDaemon_FileTransfers");
      __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        int v31 = 138412546;
        v32 = v12;
        __int16 v33 = 2112;
        v34 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "Explicit download succeeded for GUID %@, located at path %@",  (uint8_t *)&v31,  0x16u);
      }
    }

    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(+[IMDBroadcastController sharedProvider](&OBJC_CLASS___IMDBroadcastController, "sharedProvider"));
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 broadcasterForFileProviderListeners]);
    v26 = (void *)objc_claimAutoreleasedReturnValue([v11 createAndPersistLivePhotoBundleIfNecessary]);
    [v25 fileTransfer:v12 explicitDownloadSucceededWithPath:v20 livePhotoBundlePath:v26];
  }

  else
  {
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:IMDFileTransferExplicitDownloadCompletedErrorKey]);

    if (IMOSLoggingEnabled(v27, v28))
    {
      uint64_t v29 = OSLogHandleForIMFoundationCategory("IMDaemon_FileTransfers");
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        int v31 = 138412546;
        v32 = v12;
        __int16 v33 = 2112;
        v34 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "Explicit download failed for transfer with GUID %@. error: %@",  (uint8_t *)&v31,  0x16u);
      }
    }

    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[IMDBroadcastController sharedProvider](&OBJC_CLASS___IMDBroadcastController, "sharedProvider"));
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v20 broadcasterForFileProviderListeners]);
    [v24 fileTransferExplicitDownloadFailed:v12 suggestedRetryGUID:0 error:v15];
  }
}

- (void)downloadFileTransferWithLocalURL:(id)a3
{
  id v30 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v30 absoluteString]);
  int v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"filename",  v4));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMDAttachmentStore sharedInstance](&OBJC_CLASS___IMDAttachmentStore, "sharedInstance"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 attachmentsFilteredUsingPredicate:v31 limit:1]);

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v33;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
        id v12 = [v11 existsAtLocalPath];
        if ((v12 & 1) != 0)
        {
          if (IMOSLoggingEnabled(v12, v13))
          {
            uint64_t v26 = OSLogHandleForIMFoundationCategory("IMDaemon_FileTransfers");
            uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v37 = "-[IMDaemonFileProviderRequestHandler downloadFileTransferWithLocalURL:]";
              __int16 v38 = 2112;
              id v39 = v30;
              _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "%s local file at path %@ already downloaded",  buf,  0x16u);
            }
          }

          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[IMDBroadcastController sharedProvider]( &OBJC_CLASS___IMDBroadcastController,  "sharedProvider"));
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 broadcasterForFileProviderListeners]);
          [v29 fileTransferDownloadedSucceededWithLocalURL:v30];

          goto LABEL_21;
        }

        -[IMDaemonFileProviderRequestHandler _setupFileTransferExplicitDownloadNotificationListenersIfNecessary]( self,  "_setupFileTransferExplicitDownloadNotificationListenersIfNecessary");
        id v14 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
        BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v11 guid]);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 transferForGUID:v15]);
        BOOL v17 = v16 == 0LL;

        if (v17)
        {
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v11 guid]);
          [v14 _addTransfer:v11 forGUID:v18 shouldNotify:0];
        }

        [v14 addHubbleRequestedTransfer:v11];
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v11 guid]);
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v11 localPath]);
        [v14 _handleFileTransfer:v19 acceptedWithPath:v20 autoRename:1 overwrite:0 options:0 postNotification:1];

        if (IMOSLoggingEnabled(v21, v22))
        {
          uint64_t v23 = OSLogHandleForIMFoundationCategory("IMDaemon_FileTransfers");
          __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v11 guid]);
            *(_DWORD *)buf = 136315394;
            v37 = "-[IMDaemonFileProviderRequestHandler downloadFileTransferWithLocalURL:]";
            __int16 v38 = 2112;
            id v39 = v25;
            _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "%s Successfully started explicit download for local file url retrieval of transfer with GUID %@",  buf,  0x16u);
          }
        }
      }

      id v8 = [v7 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

- (BOOL)isListeningForExplicitDownloadFileTransferNotifications
{
  return self->_listeningForExplicitDownloadFileTransferNotifications;
}

- (void)setListeningForExplicitDownloadFileTransferNotifications:(BOOL)a3
{
  self->_listeningForExplicitDownloadFileTransferNotifications = a3;
}

@end
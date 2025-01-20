@interface W5PeerFileTransferListener
- (BOOL)handleClientRequest:(id)a3;
- (Class)requestPayloadClass;
- (NSString)identifier;
- (W5FileTransferManager)transferManager;
- (W5PeerFileTransferListener)initWithTransferManager:(id)a3;
- (id)_listFiles:(id)a3;
- (int64_t)currentVersion;
- (void)setTransferManager:(id)a3;
@end

@implementation W5PeerFileTransferListener

- (W5PeerFileTransferListener)initWithTransferManager:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___W5PeerFileTransferListener;
  v5 = -[W5PeerFileTransferListener init](&v12, "init");
  v6 = v5;
  if (v4 && v5)
  {
    v7 = (W5FileTransferManager *)v4;
    transferManager = (os_log_s *)v6->_transferManager;
    v6->_transferManager = v7;
  }

  else
  {

    uint64_t v10 = sub_10008C90C();
    transferManager = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(transferManager, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315650;
      v14 = "-[W5PeerFileTransferListener initWithTransferManager:]";
      __int16 v15 = 2080;
      v16 = "W5PeerFileTransferListener.m";
      __int16 v17 = 1024;
      int v18 = 37;
      LODWORD(v11) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  transferManager,  0LL,  "[wifivelocity] %s (%s:%u) init error!",  (const char *)&v13,  v11,  LODWORD(v12.receiver));
    }

    v6 = 0LL;
  }

  return v6;
}

- (BOOL)handleClientRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 payload]);
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 version]);
    uint64_t v8 = sub_10008C90C();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = 136316418;
      v39 = "-[W5PeerFileTransferListener handleClientRequest:]";
      __int16 v40 = 2080;
      v41 = "W5PeerFileTransferListener.m";
      __int16 v42 = 1024;
      *(_DWORD *)v43 = 47;
      *(_WORD *)&v43[4] = 2114;
      *(void *)&v43[6] = v4;
      __int16 v44 = 2114;
      v45 = v6;
      __int16 v46 = 2114;
      v47 = v7;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[wifivelocity] %s (%s:%u) incoming request='%{public}@', payload='%{public}@' version='%{public}@'",  &v38,  58);
    }

    uint64_t v10 = objc_alloc_init(&OBJC_CLASS___W5PeerFileTransferResponsePayload);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[W5PeerFileTransferListener currentVersion](self, "currentVersion")));
    -[W5PeerFileTransferResponsePayload setVersion:](v10, "setVersion:", v11);

    id v12 = [v7 integerValue];
    if (v12 == (id)-[W5PeerFileTransferListener currentVersion](self, "currentVersion"))
    {
      id v13 = [v6 type];
      if (v13 == (id)2)
      {
        v14 = (char *)objc_claimAutoreleasedReturnValue([v6 remotePath]);
        uint64_t v27 = sub_10008C90C();
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          int v38 = 138543362;
          v39 = v14;
          LODWORD(v35) = 12;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v28,  0LL,  "[wifivelocity] Request received to list files in directory: %{public}@",  &v38,  v35);
        }

        BOOL v20 = v14 != 0LL;
        if (v14)
        {
          -[W5PeerFileTransferResponsePayload setStatus:](v10, "setStatus:", 1LL);
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferListener _listFiles:](self, "_listFiles:", v14));
          -[W5PeerFileTransferResponsePayload setFiles:](v10, "setFiles:", v29);

          v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 handler]);
          (*((void (**)(os_log_s *, W5PeerFileTransferResponsePayload *, void))v30 + 2))(v30, v10, 0LL);
        }

        else
        {
          uint64_t v33 = sub_10008C90C();
          v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v38) = 0;
            LODWORD(v35) = 2;
            _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v30,  0LL,  "[wifivelocity] nil Directory Path",  &v38,  v35);
          }
        }
      }

      else
      {
        if (v13 != (id)1)
        {
          BOOL v20 = 0;
LABEL_28:

          goto LABEL_29;
        }

        -[W5PeerFileTransferResponsePayload setStatus:](v10, "setStatus:", 1LL);
        v14 = (char *)objc_claimAutoreleasedReturnValue([v6 targetID]);
        __int16 v15 = (char *)objc_claimAutoreleasedReturnValue([v6 remotePath]);
        v16 = (void *)objc_claimAutoreleasedReturnValue([v6 publicKey]);
        uint64_t v17 = sub_10008C90C();
        int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = (char *)objc_claimAutoreleasedReturnValue([v6 publicKey]);
          int v38 = 138543874;
          v39 = v15;
          __int16 v40 = 2114;
          v41 = v19;
          __int16 v42 = 2114;
          *(void *)v43 = v14;
          LODWORD(v35) = 32;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "[wifivelocity] Request received to send file: %{public}@, peer public key: %{public}@, targetID: %{public}@",  &v38,  v35);
        }

        BOOL v20 = v15 != 0LL;
        if (v15)
        {
          -[W5FileTransferManager initializeSenderWithTargetID:peerPublicKey:]( self->_transferManager,  "initializeSenderWithTargetID:peerPublicKey:",  v14,  v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[W5FileTransferManager publicKeySelf](self->_transferManager, "publicKeySelf"));
          -[W5PeerFileTransferResponsePayload setPublicKey:](v10, "setPublicKey:", v21);

          v22 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v4 handler]);
          ((void (**)(void, W5PeerFileTransferResponsePayload *, void))v22)[2](v22, v10, 0LL);

          -[W5FileTransferManager startW5FileSenderForFile:](self->_transferManager, "startW5FileSenderForFile:", v15);
        }

        else
        {
          uint64_t v31 = sub_10008C90C();
          v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v38) = 0;
            LODWORD(v35) = 2;
            _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v32,  0LL,  "[wifivelocity] nil File Path",  &v38,  v35);
          }
        }
      }
    }

    else
    {
      uint64_t v23 = sub_10008C90C();
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        int v38 = 138543362;
        v39 = (const char *)v7;
        LODWORD(v35) = 12;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v24,  0LL,  "[wifivelocity] Request received with invalid version: %{public}@",  &v38,  v35);
      }

      -[W5PeerFileTransferResponsePayload setStatus:](v10, "setStatus:", 2LL);
      NSErrorUserInfoKey v36 = NSLocalizedFailureReasonErrorKey;
      v37 = @"W5PeerFileListenerUnsupportedVersion";
      BOOL v20 = 1;
      v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
      v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  11LL,  v25));
      -[W5PeerFileTransferResponsePayload setError:](v10, "setError:", v26);

      v14 = (char *)objc_claimAutoreleasedReturnValue([v4 handler]);
      (*((void (**)(char *, W5PeerFileTransferResponsePayload *, void))v14 + 2))(v14, v10, 0LL);
    }

    goto LABEL_28;
  }

  BOOL v20 = 0;
LABEL_29:

  return v20;
}

- (Class)requestPayloadClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___W5PeerFileTransferRequestPayload, a2);
}

- (NSString)identifier
{
  return (NSString *)@"com.apple.wifi.peer.fileTransfer";
}

- (int64_t)currentVersion
{
  return 1LL;
}

- (id)_listFiles:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v20 = 0LL;
  v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:&__NSArray0__struct options:4 error:&v20]);
  id v7 = v20;

  if (v7)
  {
    uint64_t v15 = sub_10008C90C();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136315906;
      uint64_t v23 = "-[W5PeerFileTransferListener _listFiles:]";
      __int16 v24 = 2080;
      v25 = "W5PeerFileTransferListener.m";
      __int16 v26 = 1024;
      int v27 = 139;
      __int16 v28 = 2114;
      id v29 = v3;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[wifivelocity] %s (%s:%u) Unable to list contents of: %{public}@",  &v22,  38);
    }
  }

  else
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    uint64_t v8 = v6;
    id v9 = -[os_log_s countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v16,  v21,  16LL);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        }

        id v10 = -[os_log_s countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v16,  v21,  16LL);
      }

      while (v10);
    }
  }

  return v4;
}

- (W5FileTransferManager)transferManager
{
  return self->_transferManager;
}

- (void)setTransferManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface W5FileTransferManager
- (NSData)publicKeySelf;
- (W5FileTransferManager)init;
- (void)_setupWithTargetID:(id)a3;
- (void)_stop;
- (void)initializeReceiverWithTargetID:(id)a3;
- (void)initializeSenderWithTargetID:(id)a3 peerPublicKey:(id)a4;
- (void)startW5FileReceiverWithPeerPublicKey:(id)a3 reply:(id)a4;
- (void)startW5FileSenderForFile:(id)a3;
@end

@implementation W5FileTransferManager

- (W5FileTransferManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___W5FileTransferManager;
  v2 = -[W5FileTransferManager init](&v8, "init");
  uint64_t v3 = objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  @"/var/run/com.apple.wifivelocity",  1LL));
  tempDirPath = v2->_tempDirPath;
  v2->_tempDirPath = (NSURL *)v3;

  dispatch_queue_t v5 = dispatch_queue_create("com.apple.wifivelocity.file-transfer", 0LL);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v5;

  if (!v2->_queue)
  {

    return 0LL;
  }

  return v2;
}

- (void)_setupWithTargetID:(id)a3
{
  id v6 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___RPFileTransferSession);
  session = self->_session;
  self->_session = v4;

  -[RPFileTransferSession setTemporaryDirectoryURL:](self->_session, "setTemporaryDirectoryURL:", self->_tempDirPath);
  -[RPFileTransferSession setDispatchQueue:](self->_session, "setDispatchQueue:", self->_queue);
  -[RPFileTransferSession setTargetID:](self->_session, "setTargetID:", v6);
}

- (void)initializeReceiverWithTargetID:(id)a3
{
  id v4 = a3;
  if (self->_session) {
    -[W5FileTransferManager _stop](self, "_stop");
  }
  -[W5FileTransferManager _setupWithTargetID:](self, "_setupWithTargetID:", v4);
  -[RPFileTransferSession setFlags:](self->_session, "setFlags:", 0LL);
  -[RPFileTransferSession setFlags:]( self->_session,  "setFlags:",  -[RPFileTransferSession flags](self->_session, "flags") | 1);
  -[RPFileTransferSession setFlags:]( self->_session,  "setFlags:",  -[RPFileTransferSession flags](self->_session, "flags") | 0x10);
  -[RPFileTransferSession setFlags:]( self->_session,  "setFlags:",  -[RPFileTransferSession flags](self->_session, "flags") | 0x100);
  session = self->_session;
  id v12 = 0LL;
  -[RPFileTransferSession prepareTemplateAndReturnError:](session, "prepareTemplateAndReturnError:", &v12);
  id v6 = v12;
  uint64_t v7 = sub_10008C90C();
  objc_super v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136316162;
    v14 = "-[W5FileTransferManager initializeReceiverWithTargetID:]";
    __int16 v15 = 2080;
    v16 = "W5FileTransferManager.m";
    __int16 v17 = 1024;
    int v18 = 71;
    __int16 v19 = 2114;
    id v20 = v4;
    __int16 v21 = 2114;
    id v22 = v6;
    int v11 = 48;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[wifivelocity] %s (%s:%u) File Receiver Init, targetID: %{public}@, prepareTemplateAndReturnError, error = %{public}@",  &v13,  v11);
  }

  v9 = (NSData *)objc_claimAutoreleasedReturnValue(-[RPFileTransferSession selfPublicKey](self->_session, "selfPublicKey"));
  publicKeySelf = self->_publicKeySelf;
  self->_publicKeySelf = v9;
}

- (void)initializeSenderWithTargetID:(id)a3 peerPublicKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_session) {
    -[W5FileTransferManager _stop](self, "_stop");
  }
  -[W5FileTransferManager _setupWithTargetID:](self, "_setupWithTargetID:", v6);
  -[RPFileTransferSession setFlags:](self->_session, "setFlags:", 0LL);
  -[RPFileTransferSession setFlags:]( self->_session,  "setFlags:",  -[RPFileTransferSession flags](self->_session, "flags") | 0x10);
  -[RPFileTransferSession setFlags:]( self->_session,  "setFlags:",  -[RPFileTransferSession flags](self->_session, "flags") | 0x100);
  -[RPFileTransferSession setPeerPublicKey:](self->_session, "setPeerPublicKey:", v7);
  session = self->_session;
  id v15 = 0LL;
  -[RPFileTransferSession prepareTemplateAndReturnError:](session, "prepareTemplateAndReturnError:", &v15);
  id v9 = v15;
  uint64_t v10 = sub_10008C90C();
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136316162;
    __int16 v17 = "-[W5FileTransferManager initializeSenderWithTargetID:peerPublicKey:]";
    __int16 v18 = 2080;
    __int16 v19 = "W5FileTransferManager.m";
    __int16 v20 = 1024;
    int v21 = 93;
    __int16 v22 = 2114;
    id v23 = v6;
    __int16 v24 = 2114;
    id v25 = v9;
    int v14 = 48;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "[wifivelocity] %s (%s:%u) File Sender Init, targetID: %{public}@, prepareTemplateAndReturnError, error = %{public}@",  &v16,  v14);
  }

  id v12 = (NSData *)objc_claimAutoreleasedReturnValue(-[RPFileTransferSession selfPublicKey](self->_session, "selfPublicKey"));
  publicKeySelf = self->_publicKeySelf;
  self->_publicKeySelf = v12;
}

- (void)startW5FileSenderForFile:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_10008C90C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (RPFileTransferItem *)objc_claimAutoreleasedReturnValue(-[RPFileTransferSession selfPublicKey](self->_session, "selfPublicKey"));
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPFileTransferSession peerPublicKey](self->_session, "peerPublicKey"));
    int v18 = 136316418;
    __int16 v19 = "-[W5FileTransferManager startW5FileSenderForFile:]";
    __int16 v20 = 2080;
    int v21 = "W5FileTransferManager.m";
    __int16 v22 = 1024;
    int v23 = 101;
    __int16 v24 = 2114;
    id v25 = v7;
    __int16 v26 = 2114;
    v27 = v8;
    __int16 v28 = 2114;
    id v29 = v4;
    int v17 = 58;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "[wifivelocity] %s (%s:%u) Session Keys: self: %{public}@, peer: %{public}@, Filepath: %{public}@",  &v18,  v17);
  }

  -[RPFileTransferSession setCompletionHandler:](self->_session, "setCompletionHandler:", &stru_1000D1478);
  -[RPFileTransferSession setProgressHandler:](self->_session, "setProgressHandler:", &stru_1000D14B8);
  -[RPFileTransferSession setReceivedItemHandler:](self->_session, "setReceivedItemHandler:", &stru_1000D14F8);
  -[RPFileTransferSession activate](self->_session, "activate");
  uint64_t v9 = sub_10008C90C();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315650;
    __int16 v19 = "-[W5FileTransferManager startW5FileSenderForFile:]";
    __int16 v20 = 2080;
    int v21 = "W5FileTransferManager.m";
    __int16 v22 = 1024;
    int v23 = 124;
    LODWORD(v16) = 28;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "[wifivelocity] %s (%s:%u) File Sender: Session Activated",  (const char *)&v18,  v16);
  }

  int v11 = objc_alloc_init(&OBJC_CLASS___RPFileTransferItem);
  -[RPFileTransferItem setItemURL:](v11, "setItemURL:", v4);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
  int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 lastPathComponent]);
  -[RPFileTransferItem setFilename:](v11, "setFilename:", v13);

  -[RPFileTransferItem setCompletionHandler:](v11, "setCompletionHandler:", &stru_1000D1518);
  uint64_t v14 = sub_10008C90C();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315906;
    __int16 v19 = "-[W5FileTransferManager startW5FileSenderForFile:]";
    __int16 v20 = 2080;
    int v21 = "W5FileTransferManager.m";
    __int16 v22 = 1024;
    int v23 = 136;
    __int16 v24 = 2114;
    id v25 = v11;
    LODWORD(v16) = 38;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "[wifivelocity] %s (%s:%u) File Sender, Adding item: %{public}@",  &v18,  v16);
  }

  -[RPFileTransferSession addItem:](self->_session, "addItem:", v11);
  -[RPFileTransferSession finish](self->_session, "finish");
}

- (void)startW5FileReceiverWithPeerPublicKey:(id)a3 reply:(id)a4
{
  id v6 = a4;
  -[RPFileTransferSession setPeerPublicKey:](self->_session, "setPeerPublicKey:", a3);
  uint64_t v7 = sub_10008C90C();
  objc_super v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPFileTransferSession selfPublicKey](self->_session, "selfPublicKey"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[RPFileTransferSession peerPublicKey](self->_session, "peerPublicKey"));
    int v19 = 136316162;
    __int16 v20 = "-[W5FileTransferManager startW5FileReceiverWithPeerPublicKey:reply:]";
    __int16 v21 = 2080;
    __int16 v22 = "W5FileTransferManager.m";
    __int16 v23 = 1024;
    int v24 = 147;
    __int16 v25 = 2114;
    __int16 v26 = v9;
    __int16 v27 = 2114;
    __int16 v28 = v10;
    int v15 = 48;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[wifivelocity] %s (%s:%u) File Receiver, Session Keys: self: %{public}@, peer: %{public}@",  &v19,  v15);
  }

  -[RPFileTransferSession setProgressHandler:](self->_session, "setProgressHandler:", &stru_1000D1538);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100013CBC;
  v17[3] = &unk_1000D1560;
  id v11 = v6;
  id v18 = v11;
  -[RPFileTransferSession setReceivedItemHandler:](self->_session, "setReceivedItemHandler:", v17);
  -[RPFileTransferSession activate](self->_session, "activate");
  uint64_t v12 = sub_10008C90C();
  int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315650;
    __int16 v20 = "-[W5FileTransferManager startW5FileReceiverWithPeerPublicKey:reply:]";
    __int16 v21 = 2080;
    __int16 v22 = "W5FileTransferManager.m";
    __int16 v23 = 1024;
    int v24 = 179;
    LODWORD(v14) = 28;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "[wifivelocity] %s (%s:%u) File Receiver: Session Activated",  (const char *)&v19,  v14,  v16);
  }
}

- (void)_stop
{
  session = self->_session;
  self->_session = 0LL;
}

- (NSData)publicKeySelf
{
  return self->_publicKeySelf;
}

- (void).cxx_destruct
{
}

@end
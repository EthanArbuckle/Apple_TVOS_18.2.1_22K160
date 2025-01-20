@interface W5PeerFileRequest
- (Class)responsePayloadClass;
- (NSString)identifier;
- (NSString)targetID;
- (W5FileTransferManager)transferManager;
- (W5Peer)peer;
- (W5PeerFileRequest)initWithPeer:(id)a3 requestType:(int64_t)a4 remotePath:(id)a5 transferManager:(id)a6 reply:(id)a7;
- (W5PeerFileTransferRequestPayload)requestPayload;
- (id)_currentVersion;
- (id)reply;
- (int64_t)controlFlags;
- (int64_t)discoveryFlags;
- (void)handleResponse:(id)a3;
- (void)setDiscoveryFlags:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setPeer:(id)a3;
- (void)setReply:(id)a3;
- (void)setRequestPayload:(id)a3;
- (void)setTargetID:(id)a3;
- (void)setTransferManager:(id)a3;
@end

@implementation W5PeerFileRequest

- (W5PeerFileRequest)initWithPeer:(id)a3 requestType:(int64_t)a4 remotePath:(id)a5 transferManager:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = NSRandomData(6LL, 0LL);
  id v17 = objc_claimAutoreleasedReturnValue(v16);
  v18 = v13;
  uint64_t v19 = NSPrintF("%.3H", [v17 bytes], objc_msgSend(v17, "length"), objc_msgSend(v17, "length"));
  v20 = (NSString *)objc_claimAutoreleasedReturnValue(v19);
  targetID = self->_targetID;
  self->_targetID = v20;

  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___W5PeerFileRequest;
  v22 = -[W5PeerFileRequest init](&v37, "init");
  v23 = v22;
  if (v12
    && v22
    && (objc_storeStrong((id *)&v22->_peer, a3), v15)
    && (id v24 = objc_retainBlock(v15), reply = v23->_reply, v23->_reply = v24, reply, v13)
    && v14
    && (objc_storeStrong((id *)&v23->_transferManager, a6), v23->_targetID))
  {
    identifier = v23->_identifier;
    v23->_discoveryFlags = 1LL;
    v23->_identifier = (NSString *)@"com.apple.wifi.peer.fileTransfer";

    v27 = objc_alloc_init(&OBJC_CLASS___W5PeerFileTransferRequestPayload);
    requestPayload = v23->_requestPayload;
    v23->_requestPayload = v27;

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileRequest _currentVersion](v23, "_currentVersion"));
    -[W5PeerFileTransferRequestPayload setVersion:](v23->_requestPayload, "setVersion:", v29);

    -[W5PeerFileTransferRequestPayload setRemotePath:](v23->_requestPayload, "setRemotePath:", v13);
    -[W5PeerFileTransferRequestPayload setType:](v23->_requestPayload, "setType:", a4);
    if (a4 == 1)
    {
      -[W5PeerFileTransferRequestPayload setTargetID:](v23->_requestPayload, "setTargetID:", v23->_targetID);
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[W5FileTransferManager publicKeySelf](v23->_transferManager, "publicKeySelf"));
      -[W5PeerFileTransferRequestPayload setPublicKey:](v23->_requestPayload, "setPublicKey:", v30);

      -[W5FileTransferManager initializeReceiverWithTargetID:]( v23->_transferManager,  "initializeReceiverWithTargetID:",  v23->_targetID);
    }
  }

  else
  {

    uint64_t v32 = sub_10008C90C();
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = 136315650;
      v39 = "-[W5PeerFileRequest initWithPeer:requestType:remotePath:transferManager:reply:]";
      __int16 v40 = 2080;
      v41 = "W5PeerFileRequest.m";
      __int16 v42 = 1024;
      int v43 = 69;
      LODWORD(v34) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v33,  0LL,  "[wifivelocity] %s (%s:%u) init error!",  (const char *)&v38,  v34,  v35);
    }

    v23 = 0LL;
  }

  return v23;
}

- (void)handleResponse:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 error]);

  if (v5)
  {
    v6 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[W5PeerFileRequest reply](self, "reply"));
    v7 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v4 error]);
    v6[2](v6, v7, 0LL);
LABEL_12:

    goto LABEL_13;
  }

  v6 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v4 payload]);
  if ([v6 status] != (id)1)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);

    v7 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[W5PeerFileRequest reply](self, "reply"));
    if (!v16)
    {
      NSErrorUserInfoKey v20 = NSLocalizedFailureReasonErrorKey;
      v21 = @"W5PeerFileResponseUndefinedError";
      id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  12LL,  v17));
      ((void (**)(void, void *, void))v7)[2](v7, v18, 0LL);

      goto LABEL_12;
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
    ((void (**)(void, void *, void))v7)[2](v7, v15, 0LL);
    goto LABEL_10;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 publicKey]);

  if (v8)
  {
    transferManager = self->_transferManager;
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 publicKey]);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100014610;
    v19[3] = &unk_1000D1588;
    v19[4] = self;
    -[W5FileTransferManager startW5FileReceiverWithPeerPublicKey:reply:]( transferManager,  "startW5FileReceiverWithPeerPublicKey:reply:",  v10,  v19);

    v11 = -[NSURL initFileURLWithPath:]( objc_alloc(&OBJC_CLASS___NSURL),  "initFileURLWithPath:",  @"/var/run/com.apple.wifivelocity");
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.rpftd",  self->_targetID));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSURL URLByAppendingPathComponent:isDirectory:]( v11,  "URLByAppendingPathComponent:isDirectory:",  v12,  1LL));
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 files]);

  if (v14)
  {
    v7 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[W5PeerFileRequest reply](self, "reply"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 files]);
    ((void (**)(void, void, void *))v7)[2](v7, 0LL, v15);
LABEL_10:

    goto LABEL_12;
  }

- (id)_currentVersion
{
  return &off_1000DEC40;
}

- (int64_t)controlFlags
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileRequest peer](self, "peer"));
  id v3 = [v2 controlFlags];

  return (int64_t)v3;
}

- (Class)responsePayloadClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___W5PeerFileTransferResponsePayload, a2);
}

- (W5Peer)peer
{
  return self->_peer;
}

- (void)setPeer:(id)a3
{
}

- (id)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
}

- (NSString)targetID
{
  return self->_targetID;
}

- (void)setTargetID:(id)a3
{
}

- (int64_t)discoveryFlags
{
  return self->_discoveryFlags;
}

- (void)setDiscoveryFlags:(int64_t)a3
{
  self->_discoveryFlags = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (W5PeerFileTransferRequestPayload)requestPayload
{
  return self->_requestPayload;
}

- (void)setRequestPayload:(id)a3
{
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
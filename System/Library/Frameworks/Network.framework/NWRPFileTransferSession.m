@interface NWRPFileTransferSession
- (BOOL)isTarget;
- (NSData)peerPublicKey;
- (NSData)selfPublicKey;
- (NSString)targetID;
- (NSURL)temporaryDirectoryURL;
- (RPFileTransferSession)session;
- (id)completionHandler;
- (id)initAsTarget:(BOOL)a3;
- (id)receivedFileHandler;
- (void)activate;
- (void)handleProgress:(id)a3;
- (void)handleReceivedItem:(id)a3;
- (void)invalidate;
- (void)prepare;
- (void)setCompletionHandler:(id)a3;
- (void)setPeerPublicKey:(id)a3;
- (void)setReceivedFileHandler:(id)a3;
- (void)setTargetID:(id)a3;
- (void)setTemporaryDirectoryURL:(id)a3;
- (void)transferFileURL:(id)a3 completion:(id)a4;
@end

@implementation NWRPFileTransferSession

- (id)initAsTarget:(BOOL)a3
{
  BOOL v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NWRPFileTransferSession;
  v4 = -[NWRPFileTransferSession init](&v16, sel_init);
  v4->_isTarget = v3;
  objc_initWeak(&location, v4);
  gotLoadHelper_x8__OBJC_CLASS___RPFileTransferSession(v5);
  v7 = (RPFileTransferSession *)objc_alloc_init(*(Class *)(v6 + 3512));
  session = v4->_session;
  v4->_session = v7;

  -[RPFileTransferSession setFlags:](v4->_session, "setFlags:", v3 | 0x50u);
  -[RPFileTransferSession setProgressHandlerTimeInterval:](v4->_session, "setProgressHandlerTimeInterval:", 1.0);
  uint64_t v9 = MEMORY[0x1895F87A8];
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __40__NWRPFileTransferSession_initAsTarget___block_invoke;
  v13[3] = &unk_189BB8BC8;
  objc_copyWeak(&v14, &location);
  -[RPFileTransferSession setReceivedItemHandler:](v4->_session, "setReceivedItemHandler:", v13);
  v11[0] = v9;
  v11[1] = 3221225472LL;
  v11[2] = __40__NWRPFileTransferSession_initAsTarget___block_invoke_2;
  v11[3] = &unk_189BB8BF0;
  objc_copyWeak(&v12, &location);
  -[RPFileTransferSession setProgressHandler:](v4->_session, "setProgressHandler:", v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return v4;
}

- (NSData)peerPublicKey
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 peerPublicKey];
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (void)setPeerPublicKey:(id)a3
{
  id v4 = a3;
  -[NWRPFileTransferSession session](self, "session");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setPeerPublicKey:v4];
}

- (NSData)selfPublicKey
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 selfPublicKey];
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (NSString)targetID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 targetID];
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setTargetID:(id)a3
{
  id v4 = a3;
  -[NWRPFileTransferSession session](self, "session");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setTargetID:v4];
}

- (NSURL)temporaryDirectoryURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 temporaryDirectoryURL];
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (void)setTemporaryDirectoryURL:(id)a3
{
  id v4 = a3;
  -[NWRPFileTransferSession session](self, "session");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setTemporaryDirectoryURL:v4];
}

- (void)activate
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 activate];
}

- (void)invalidate
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 invalidate];
}

- (void)prepare
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 prepareTemplateAndReturnError:0];
}

- (void)transferFileURL:(id)a3 completion:(id)a4
{
  id v6 = a4;
  gotLoadHelper_x8__OBJC_CLASS___RPFileTransferItem(v7);
  uint64_t v9 = *(objc_class **)(v8 + 3504);
  id v10 = a3;
  id v11 = objc_alloc_init(v9);
  [v11 setItemURL:v10];
  [v10 lastPathComponent];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  [v11 setFilename:v12];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __54__NWRPFileTransferSession_transferFileURL_completion___block_invoke;
  v15[3] = &unk_189BB8C18;
  id v16 = v6;
  id v13 = v6;
  [v11 setCompletionHandler:v15];
  -[NWRPFileTransferSession session](self, "session");
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 addItem:v11];
}

- (void)handleReceivedItem:(id)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[NWRPFileTransferSession receivedFileHandler](self, "receivedFileHandler");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[NWRPFileTransferSession receivedFileHandler](self, "receivedFileHandler");
      id v5 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, id))v5)[2](v5, v6);
    }
  }
}

- (void)handleProgress:(id)a3
{
  id v7 = a3;
  -[NWRPFileTransferSession completionHandler](self, "completionHandler");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (-[NWRPFileTransferSession isTarget](self, "isTarget") && [v7 type] == 11
      || [v7 totalFileCount] >= 1
      && (uint64_t v5 = [v7 totalFileCount], v5 == objc_msgSend(v7, "transferredFileCount")))
    {
      -[NWRPFileTransferSession completionHandler](self, "completionHandler");
      id v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v6[2]();
    }
  }
}

- (id)receivedFileHandler
{
  return self->_receivedFileHandler;
}

- (void)setReceivedFileHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (BOOL)isTarget
{
  return self->_isTarget;
}

- (RPFileTransferSession)session
{
  return self->_session;
}

- (void).cxx_destruct
{
}

uint64_t __54__NWRPFileTransferSession_transferFileURL_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __40__NWRPFileTransferSession_initAsTarget___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void))(a3 + 16);
  id v6 = a2;
  v5(a3, 0LL);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleReceivedItem:v6];
}

void __40__NWRPFileTransferSession_initAsTarget___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleProgress:v3];
}

@end
@interface MRDTextEditingService
- (BOOL)handleTextInputMessage:(id)a3 withError:(id *)a4;
- (BOOL)isRunning;
- (MRDTextEditingConnection)activeConnection;
- (MRDTextEditingService)init;
- (MRDTextEditingServiceDelegate)delegate;
- (MRTextEditingSession)currentTextEditingSession;
- (NSXPCListener)xpcListener;
- (RTIInputSystemService)rtiService;
- (void)_textEditingDidEndForConnection:(id)a3;
- (void)dealloc;
- (void)inputSystemService:(id)a3 didCreateInputSession:(id)a4;
- (void)setActiveConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRtiService:(id)a3;
- (void)setXpcListener:(id)a3;
- (void)start;
- (void)stop;
- (void)textEditingConnection:(id)a3 attributesDidChange:(id)a4;
- (void)textEditingConnection:(id)a3 didBeginEditingText:(id)a4 withAttributes:(id)a5;
- (void)textEditingConnection:(id)a3 textDidChange:(id)a4;
- (void)textEditingDidDieForConnection:(id)a3;
- (void)textEditingDidEndForConnection:(id)a3;
@end

@implementation MRDTextEditingService

- (MRDTextEditingService)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MRDTextEditingService;
  v2 = -[MRDTextEditingService init](&v10, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    connections = v2->_connections;
    v2->_connections = v3;

    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.MediaRemote.MRDTelevisionTextEditingSession", v6);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v7;
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRDTextEditingService;
  -[MRDTextEditingService dealloc](&v3, "dealloc");
}

- (BOOL)isRunning
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTextEditingService rtiService](self, "rtiService"));
  unsigned __int8 v3 = [v2 isEnabled];

  return v3;
}

- (void)start
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTextEditingService rtiService](self, "rtiService"));

  if (!v3)
  {
    v4 = objc_alloc(&OBJC_CLASS___MRDRTIInputSystemService);
    dispatch_queue_attr_t v5 = -[MRDRTIInputSystemService initWithMachName:](v4, "initWithMachName:", RTIServiceMediaRemoteName);
    -[MRDTextEditingService setRtiService:](self, "setRtiService:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTextEditingService rtiService](self, "rtiService"));
    [v6 setDelegate:self];
  }

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[MRDTextEditingService rtiService](self, "rtiService"));
  [v7 setEnabled:1];
}

- (void)stop
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[MRDTextEditingService rtiService](self, "rtiService"));
  [v2 setEnabled:0];
}

- (BOOL)handleTextInputMessage:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E8F68;
  block[3] = &unk_100399DF8;
  block[4] = self;
  id v10 = v5;
  v11 = &v12;
  id v7 = v5;
  dispatch_sync(serialQueue, block);
  LOBYTE(serialQueue) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)serialQueue;
}

- (MRTextEditingSession)currentTextEditingSession
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTextEditingService activeConnection](self, "activeConnection"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentSession]);

  return (MRTextEditingSession *)v3;
}

- (void)inputSystemService:(id)a3 didCreateInputSession:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___MRDTextEditingConnection);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    id v7 = v5;
    [v7 setMrDelegate:self];
    uint64_t v9 = _MRLogForCategory(0LL, v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleID]);
      int v12 = 138412290;
      v13 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[TelevisionTextEditing] Accepted new connection from %@",  (uint8_t *)&v12,  0xCu);
    }
  }
}

- (void)textEditingConnection:(id)a3 didBeginEditingText:(id)a4 withAttributes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v12 = _MRLogForCategory(0LL, v11);
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleID]);
    *(_DWORD *)buf = 138412290;
    v24 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[TelevisionTextEditing] Text editing began for connection %@",  buf,  0xCu);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000E9400;
  v19[3] = &unk_100399880;
  v19[4] = self;
  id v20 = v8;
  id v21 = v9;
  id v22 = v10;
  id v16 = v10;
  id v17 = v9;
  id v18 = v8;
  dispatch_sync(serialQueue, v19);
}

- (void)textEditingConnection:(id)a3 textDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E9598;
  block[3] = &unk_100398F40;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(serialQueue, block);
}

- (void)textEditingConnection:(id)a3 attributesDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E9708;
  block[3] = &unk_100398F40;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(serialQueue, block);
}

- (void)textEditingDidEndForConnection:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _MRLogForCategory(0LL, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleID]);
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[TelevisionTextEditing] Text editing ended for connection %@",  buf,  0xCu);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000E98EC;
  v11[3] = &unk_100398E60;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_sync(serialQueue, v11);
}

- (void)_textEditingDidEndForConnection:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MRDTextEditingService activeConnection](self, "activeConnection"));

  if (v5 == v4)
  {
    -[MRDTextEditingService setActiveConnection:](self, "setActiveConnection:", 0LL);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector(WeakRetained, "textEditingServiceTextEditingDidEnd:");

    if ((v7 & 1) != 0)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      [v8 textEditingServiceTextEditingDidEnd:self];
    }
  }

- (void)textEditingDidDieForConnection:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E9A28;
  block[3] = &unk_100398E60;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
}

- (MRDTextEditingServiceDelegate)delegate
{
  return (MRDTextEditingServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (RTIInputSystemService)rtiService
{
  return self->_rtiService;
}

- (void)setRtiService:(id)a3
{
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void)setXpcListener:(id)a3
{
}

- (MRDTextEditingConnection)activeConnection
{
  return self->_activeConnection;
}

- (void)setActiveConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
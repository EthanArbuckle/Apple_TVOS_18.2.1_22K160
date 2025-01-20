@interface TILexiconServer
+ (id)sharedLexiconServer;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (OS_dispatch_queue)dispatchQueue;
- (TILexiconServer)init;
- (void)dealloc;
@end

@implementation TILexiconServer

+ (id)sharedLexiconServer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006008;
  block[3] = &unk_100014728;
  block[4] = a1;
  if (qword_10001E250 != -1) {
    dispatch_once(&qword_10001E250, block);
  }
  return (id)qword_10001E248;
}

- (TILexiconServer)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TILexiconServer;
  v2 = -[TILexiconServer init](&v11, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INTERACTIVE, 0);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.TextInput.lexicon-server", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc(&OBJC_CLASS___NSXPCListener);
    v8 = -[NSXPCListener initWithMachServiceName:](v7, "initWithMachServiceName:", TILexiconServiceName);
    listener = v2->_listener;
    v2->_listener = v8;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener _setQueue:](v2->_listener, "_setQueue:", v2->_dispatchQueue);
    -[NSXPCListener resume](v2->_listener, "resume");
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TILexiconServer;
  -[TILexiconServer dealloc](&v3, "dealloc");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 _xpcConnection]);
  v7 = (void *)xpc_connection_copy_bundle_id();

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7));
    free(v7);
  }

  else
  {
    v8 = 0LL;
  }

  v9 = objc_alloc_init(&OBJC_CLASS___TILexiconDataHandler);
  -[TILexiconDataHandler setBundleID:](v9, "setBundleID:", v8);
  [v5 setExportedObject:v9];
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___TILexiconRequestHandler));
  [v5 setExportedInterface:v10];

  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[TILexiconServer dispatchQueue](self, "dispatchQueue"));
  [v5 _setQueue:v11];

  [v5 resume];
  return 1;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void).cxx_destruct
{
}

@end
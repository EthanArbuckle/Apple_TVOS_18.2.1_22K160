@interface TKSlotClient
+ (BOOL)handleConnection:(id)a3 server:(id)a4;
- (NSString)slotType;
- (TKProtocolSlotClientNotification)notification;
- (void)dealloc;
- (void)reportChangesForSlotType:(id)a3 reply:(id)a4;
@end

@implementation TKSlotClient

+ (BOOL)handleConnection:(id)a3 server:(id)a4
{
  v5 = (TKSlotServer *)a4;
  id v6 = a3;
  v7 = objc_alloc_init(&OBJC_CLASS___TKSlotClient);
  server = v7->_server;
  v7->_server = v5;
  v9 = v5;

  objc_storeWeak((id *)&v7->_connection, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___TKProtocolSlotClient));

  [v6 setExportedInterface:v10];
  [v6 setExportedObject:v7];

  return 1;
}

- (void)reportChangesForSlotType:(id)a3 reply:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___TKProtocolSlotClientNotification));
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  [WeakRetained setRemoteObjectInterface:v9];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000AF10;
  v12[3] = &unk_10001C5E8;
  v12[4] = self;
  id v11 = objc_loadWeakRetained((id *)&self->_connection);
  [v11 setInvalidationHandler:v12];

  -[TKSlotServer addClient:reply:](self->_server, "addClient:reply:", self, v8);
}

- (TKProtocolSlotClientNotification)notification
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained remoteObjectProxy]);

  return (TKProtocolSlotClientNotification *)v3;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  [WeakRetained invalidate];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TKSlotClient;
  -[TKSlotClient dealloc](&v4, "dealloc");
}

- (NSString)slotType
{
  return self->_slotType;
}

- (void).cxx_destruct
{
}

@end
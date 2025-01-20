@interface ClientInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)didRequestReconnect;
- (BOOL)isInternalClient;
- (BOOL)sendMessage:(id)a3;
- (ClientInfo)initWithCoder:(id)a3;
- (ClientInfo)initWithName:(id)a3 connection:(id)a4;
- (ClientInfo)initWithName:(id)a3 connection:(id)a4 isInternalClient:(BOOL)a5;
- (NSString)name;
- (OS_xpc_object)connection;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDidRequestReconnect:(BOOL)a3;
- (void)setIsInternalClient:(BOOL)a3;
@end

@implementation ClientInfo

- (ClientInfo)initWithName:(id)a3 connection:(id)a4
{
  return -[ClientInfo initWithName:connection:isInternalClient:]( self,  "initWithName:connection:isInternalClient:",  a3,  a4,  0LL);
}

- (ClientInfo)initWithName:(id)a3 connection:(id)a4 isInternalClient:(BOOL)a5
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ClientInfo;
  id v8 = -[ClientInfo init](&v12, "init");
  *((void *)v8 + 4) = 0LL;
  *((_WORD *)v8 + 20) = 0;
  *((void *)v8 + 1) = 0LL;
  *((void *)v8 + 2) = 0LL;
  *((_BYTE *)v8 + 42) = a5;
  if (a3)
  {
    *((void *)v8 + 1) = a3;
    v9 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.events", a3);
    *((void *)v8 + 3) = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_BACKGROUND, 0);
    *((void *)v8 + 2) = dispatch_queue_create( -[NSString cStringUsingEncoding:](v9, "cStringUsingEncoding:", 4LL),  *((dispatch_queue_attr_t *)v8 + 3));
    [v8 setConnection:a4];
  }

  else
  {
    FudLog(3LL, @"Can't create client info with nil name");
    id v11 = v8;
    return 0LL;
  }

  return (ClientInfo *)v8;
}

- (void)setConnection:(id)a3
{
  if (-[ClientInfo isInternalClient](self, "isInternalClient")) {
    goto LABEL_15;
  }
  connection = self->connection;
  if (a3)
  {
    if (connection && connection == a3) {
      goto LABEL_15;
    }
    self->connection = (OS_xpc_object *)a3;
    xpc_retain(a3);
    if (!connection) {
      goto LABEL_9;
    }
  }

  else
  {
    self->connection = 0LL;
    if (!connection) {
      goto LABEL_9;
    }
  }

  xpc_release(connection);
LABEL_9:
  p_didSuspendEventQueue = &self->didSuspendEventQueue;
  if (self->connection)
  {
    if (self->didSuspendEventQueue)
    {
      FudLog(7LL, @"Resuming client queue ref:%@");
      dispatch_resume((dispatch_object_t)self->eventQueue);
LABEL_14:
      BOOL *p_didSuspendEventQueue = 0;
    }
  }

  else if (!self->didSuspendEventQueue)
  {
    FudLog(7LL, @"Suspending client queue ref:%@");
    dispatch_suspend((dispatch_object_t)self->eventQueue);
    self->didSuspendEventQueue = 1;
    p_didSuspendEventQueue = &self->didRequestReconnect;
    goto LABEL_14;
  }

- (BOOL)sendMessage:(id)a3
{
  if (!a3)
  {
    id v8 = @"Can't send NULL message back to client";
LABEL_13:
    FudLog(3LL, v8);
    return 0;
  }

  v5 = -[NSString cStringUsingEncoding:](self->name, "cStringUsingEncoding:", 4LL);
  if (!v5)
  {
    id v8 = @"Failed to convert identifer to cstring";
    goto LABEL_13;
  }

  xpc_dictionary_set_string(a3, "ClientIdentifier", v5);
  objc_sync_enter(self);
  if (-[ClientInfo isInternalClient](self, "isInternalClient"))
  {
    sendMessageToInternalClient(a3);
  }

  else
  {
    if (!self->connection && !self->didRequestReconnect)
    {
      FudLog(5LL, @"Notifying client to setup connection to fud");
      -[ClientInfo setConnection:](self, "setConnection:", 0LL);
      +[FudUtilities postNotification:](&OBJC_CLASS___FudUtilities, "postNotification:", self->name);
      -[ClientInfo setDidRequestReconnect:](self, "setDidRequestReconnect:", 1LL);
    }

    eventQueue = (dispatch_queue_s *)self->eventQueue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100021388;
    v9[3] = &unk_1000754A8;
    v9[4] = self;
    v9[5] = a3;
    dispatch_async(eventQueue, v9);
  }

  objc_sync_exit(self);
  return 1;
}

- (void)dealloc
{
  connection = self->connection;
  if (connection) {
    xpc_release(connection);
  }
  eventQueue = (dispatch_object_s *)self->eventQueue;
  if (eventQueue)
  {
    if (self->didSuspendEventQueue)
    {
      dispatch_resume(eventQueue);
      eventQueue = (dispatch_object_s *)self->eventQueue;
    }

    dispatch_release(eventQueue);
  }

  name = self->name;
  if (name) {

  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ClientInfo;
  -[ClientInfo dealloc](&v6, "dealloc");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ClientInfo)initWithCoder:(id)a3
{
  if (!a3)
  {
    v7 = @"Can't deserialize with nil decoder";
LABEL_8:
    FudLog(3LL, v7);
    id v8 = self;
    return 0LL;
  }

  id v5 = [a3 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"Name"];
  if (!v5)
  {
    v7 = @"Can't deserialize without client name";
    goto LABEL_8;
  }

  result = -[ClientInfo initWithName:connection:isInternalClient:]( self,  "initWithName:connection:isInternalClient:",  v5,  0,  [a3 decodeBoolForKey:@"IsInternalClient"]);
  if (!result)
  {
    self = 0LL;
    v7 = @"Failed to initialize client";
    goto LABEL_8;
  }

  return result;
}

- (void)encodeWithCoder:(id)a3
{
  if (a3)
  {
    [a3 encodeObject:self->name forKey:@"Name"];
    [a3 encodeBool:self->isInternalClient forKey:@"IsInternalClient"];
  }

  else
  {
    FudLog(3LL, @"Can't encode with nil encodoer");
  }

- (NSString)name
{
  return self->name;
}

- (OS_xpc_object)connection
{
  return self->connection;
}

- (BOOL)didRequestReconnect
{
  return self->didRequestReconnect;
}

- (void)setDidRequestReconnect:(BOOL)a3
{
  self->didRequestReconnect = a3;
}

- (BOOL)isInternalClient
{
  return self->isInternalClient;
}

- (void)setIsInternalClient:(BOOL)a3
{
  self->isInternalClient = a3;
}

@end
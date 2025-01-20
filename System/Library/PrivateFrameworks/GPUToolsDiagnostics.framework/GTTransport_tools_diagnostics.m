@interface GTTransport_tools_diagnostics
- (BOOL)_activateSource:(id)a3;
- (BOOL)_packMessage:(id)a3 error:(id *)a4;
- (BOOL)connected;
- (BOOL)invalid;
- (BOOL)prioritizeOutgoingMessages;
- (BOOL)relayMessage:(id)a3 error:(id *)a4;
- (BOOL)send:(id)a3 error:(id *)a4;
- (BOOL)send:(id)a3 error:(id *)a4 replyQueue:(id)a5 timeout:(unint64_t)a6 handler:(id)a7;
- (BOOL)send:(id)a3 inReplyTo:(id)a4 error:(id *)a5;
- (BOOL)send:(id)a3 inReplyTo:(id)a4 error:(id *)a5 replyQueue:(id)a6 timeout:(unint64_t)a7 handler:(id)a8;
- (BOOL)sendNewMessage:(int)a3 error:(id *)a4;
- (BOOL)sendNewMessage:(int)a3 error:(id *)a4 replyQueue:(id)a5 timeout:(unint64_t)a6 handler:(id)a7;
- (BOOL)synchronous;
- (GTTransport_tools_diagnostics)init;
- (NSError)error;
- (NSString)identifier;
- (NSURL)url;
- (id)connect;
- (id)debugDescription;
- (id)description;
- (id)newSourceWithQueue:(id)a3;
- (int64_t)_sendMessage:(id)a3 error:(id *)a4;
- (unsigned)_nextMessageSerial;
- (unsigned)interposerVersion;
- (void)_cancelSource:(id)a3;
- (void)_dispatchMessage:(id)a3;
- (void)_handleReplyTimeout:(unsigned int)a3 count:(unsigned int)a4;
- (void)_invalidate;
- (void)_scheduleInvalidation:(id)a3;
- (void)dealloc;
- (void)drainQueue;
- (void)invalidate;
- (void)setIdentifier:(id)a3;
- (void)setInterposerVersion:(unsigned int)a3;
- (void)setPrioritizeOutgoingMessages:(BOOL)a3;
- (void)setSynchronous:(BOOL)a3;
- (void)setTargetQueue:(id)a3;
@end

@implementation GTTransport_tools_diagnostics

- (GTTransport_tools_diagnostics)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___GTTransport_tools_diagnostics;
  id v2 = -[GTTransport_tools_diagnostics init](&v8, "init");
  if (v2)
  {
    *((void *)v2 + 11) = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"<%@ %p>",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  object_getClassName(v2)),  v2);
    v3 = -[NSString UTF8String]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"gputools.%@.%p",  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", object_getClassName(v2)),  v2),  "UTF8String");
    v4 = (dispatch_queue_attr_s *)dispatch_queue_attr_make_with_overcommit(&_dispatch_queue_attr_concurrent, 1LL);
    *((void *)v2 + 2) = dispatch_queue_create(v3, v4);
    v5 = -[NSString UTF8String]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"gputools.%@.%p.%@",  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", object_getClassName(v2)),  v2,  @"default"),  "UTF8String");
    *((void *)v2 + 3) = dispatch_queue_create_with_target_V2(v5, 0LL, *((dispatch_queue_t *)v2 + 2));
    v6 = -[NSString UTF8String]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"gputools.%@.%p.%@",  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", object_getClassName(v2)),  v2,  @"send"),  "UTF8String");
    *((void *)v2 + 4) = dispatch_queue_create_with_target_V2(v6, 0LL, *((dispatch_queue_t *)v2 + 2));
    *((void *)v2 + 8) = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    *((void *)v2 + 9) = objc_opt_new(&OBJC_CLASS___GTIntKeyedDictionary_tools_diagnostics);
    *((void *)v2 + 12) = &_dispatch_async;
    *((_BYTE *)v2 + 52) = 0;
  }

  return (GTTransport_tools_diagnostics *)v2;
}

- (void)dealloc
{
  sendQueue = (dispatch_object_s *)self->_sendQueue;
  if (sendQueue)
  {
    dispatch_release(sendQueue);
    self->_sendQueue = 0LL;
  }

  queue = (dispatch_object_s *)self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0LL;
  }

  rootQueue = (dispatch_object_s *)self->_rootQueue;
  if (rootQueue)
  {
    dispatch_release(rootQueue);
    self->_rootQueue = 0LL;
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GTTransport_tools_diagnostics;
  -[GTTransport_tools_diagnostics dealloc](&v6, "dealloc");
}

- (id)description
{
  return self->_dispatch_send;
}

- (id)debugDescription
{
  id v3 = -[GTTransport_tools_diagnostics description](self, "description");
  v4 = -[GTTransport_tools_diagnostics url](self, "url");
  unsigned int v5 = -[GTTransport_tools_diagnostics connected](self, "connected");
  unsigned int v6 = -[GTTransport_tools_diagnostics invalid](self, "invalid");
  v7 = -[GTTransport_tools_diagnostics error](self, "error");
  uint64_t v8 = atomic_load(&self->_messageCounter.__a_.__a_value);
  uint64_t v9 = atomic_load((unsigned int *)&self->_invalid);
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: url=%@, connected=%d, invalid=%d, error=%@, messageCounter=%u, messageSendQueueDepth=%u, sources=%@",  v3,  v4,  v5,  v6,  v7,  v8,  v9,  self->_replyHandlersMap);
}

- (NSURL)url
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  uint64_t v9 = __Block_byref_object_copy__76;
  v10 = __Block_byref_object_dispose__77;
  uint64_t v11 = 0LL;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = __18__GTTransport_url__block_invoke;
  v5[3] = &unk_20C08;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  id v3 = (NSURL *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setTargetQueue:(id)a3
{
}

- (id)newSourceWithQueue:(id)a3
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000LL;
  v10 = __Block_byref_object_copy__76;
  uint64_t v11 = __Block_byref_object_dispose__77;
  uint64_t v12 = 0LL;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __34__GTTransport_newSourceWithQueue___block_invoke;
  block[3] = &unk_20A00;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)_activateSource:(id)a3
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __31__GTTransport__activateSource___block_invoke;
  block[3] = &unk_20A00;
  block[4] = self;
  block[5] = a3;
  block[6] = &v7;
  dispatch_sync((dispatch_queue_t)queue, block);
  char v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)_cancelSource:(id)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = __29__GTTransport__cancelSource___block_invoke;
  v4[3] = &unk_209B0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync((dispatch_queue_t)queue, v4);
}

- (id)connect
{
  return 0LL;
}

- (BOOL)connected
{
  return 0;
}

- (void)_invalidate
{
  error = self->_error;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = __26__GTTransport__invalidate__block_invoke;
  v4[3] = &unk_208C8;
  v4[4] = self;
  -[NSError enumerateKeysAndObjectsUsingBlock:](error, "enumerateKeysAndObjectsUsingBlock:", v4);
  -[GTIntKeyedDictionary_tools_diagnostics removeAllObjects](self->_replyHandlersMap, "removeAllObjects");
  -[NSError removeAllObjects](self->_error, "removeAllObjects");
}

- (void)_handleReplyTimeout:(unsigned int)a3 count:(unsigned int)a4
{
  uint64_t v6 = a3;
  uint64_t v7 = -[NSError objectForIntKey:](self->_error, "objectForIntKey:", a3);
  if (v7)
  {
    if (v7[10] <= a4)
    {
      id v9 = v7;
      uint64_t v8 = v7;
      -[NSError removeObjectForIntKey:](self->_error, "removeObjectForIntKey:", v6);
      objc_msgSend( v9,  "dispatchError:",  +[GTError_tools_diagnostics errorWithDomain:code:userInfo:]( GTError_tools_diagnostics,  "errorWithDomain:code:userInfo:",  @"DYErrorDomain",  5,  0));
    }
  }

- (void)_dispatchMessage:(id)a3
{
  if (!LOBYTE(self->_interposerVersion))
  {
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    replyHandlersMap = self->_replyHandlersMap;
    id v6 = -[GTIntKeyedDictionary_tools_diagnostics countByEnumeratingWithState:objects:count:]( replyHandlersMap,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(replyHandlersMap);
          }
          [*(id *)(*((void *)&v18 + 1) + 8 * (void)i) _dispatch:a3];
        }

        id v7 = -[GTIntKeyedDictionary_tools_diagnostics countByEnumeratingWithState:objects:count:]( replyHandlersMap,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
      }

      while (v7);
    }

    unsigned int v10 = [a3 replySerial];
    if (v10 != -1)
    {
      unsigned int v11 = v10;
      id v12 = -[NSError objectForIntKey:](self->_error, "objectForIntKey:", v10);
      if (v12)
      {
        int v13 = *((_DWORD *)v12 + 10) + 1;
        *((_DWORD *)v12 + 10) = v13;
        v14 = (dispatch_queue_s *)*((void *)v12 + 1);
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472LL;
        v15[2] = __32__GTTransport__dispatchMessage___block_invoke;
        v15[3] = &unk_20A78;
        v15[4] = v12;
        v15[5] = a3;
        v15[6] = self;
        unsigned int v16 = v11;
        int v17 = v13;
        dispatch_async(v14, v15);
      }
    }
  }

- (unsigned)_nextMessageSerial
{
  p_messageCounter = &self->_messageCounter;
  do
  {
    unsigned int v3 = __ldaxr(&p_messageCounter->__a_.__a_value);
    unsigned int result = v3 + 1;
  }

  while (__stlxr(v3 + 1, &p_messageCounter->__a_.__a_value));
  return result;
}

- (BOOL)_packMessage:(id)a3 error:(id *)a4
{
  return 0;
}

- (int64_t)_sendMessage:(id)a3 error:(id *)a4
{
  return -1LL;
}

- (void)invalidate
{
}

- (void)_scheduleInvalidation:(id)a3
{
  if (!LOBYTE(self->_interposerVersion))
  {
    LOBYTE(self->_interposerVersion) = 1;
    rootQueue = self->_rootQueue;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = __37__GTTransport__scheduleInvalidation___block_invoke;
    v4[3] = &unk_209B0;
    v4[4] = self;
    void v4[5] = a3;
    dispatch_barrier_async((dispatch_queue_t)rootQueue, v4);
  }

- (BOOL)invalid
{
  return self->_interposerVersion;
}

- (BOOL)synchronous
{
  return self[1].super.isa == (Class)&_dispatch_sync;
}

- (void)setSynchronous:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = __30__GTTransport_setSynchronous___block_invoke;
  v4[3] = &unk_20AA0;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async((dispatch_queue_t)queue, v4);
}

- (BOOL)send:(id)a3 inReplyTo:(id)a4 error:(id *)a5 replyQueue:(id)a6 timeout:(unint64_t)a7 handler:(id)a8
{
  if ([a3 hasBeenSent])
  {
    if (!a5) {
      goto LABEL_36;
    }
    uint64_t v31 = 34LL;
LABEL_35:
    id v32 = +[GTError_tools_diagnostics errorWithDomain:code:userInfo:]( &OBJC_CLASS___GTError_tools_diagnostics,  "errorWithDomain:code:userInfo:",  @"DYErrorDomain",  v31,  0LL);
    LOBYTE(v15) = 0;
    *a5 = v32;
    return v15;
  }

  if (a4 && ([a4 hasBeenSent] & 1) == 0)
  {
    if (a5)
    {
      uint64_t v31 = 35LL;
      goto LABEL_35;
    }

    goto LABEL_36;
  }

  if (!-[GTTransport_tools_diagnostics connected](self, "connected"))
  {
    if (!a5) {
      goto LABEL_36;
    }
    uint64_t v31 = 33LL;
    goto LABEL_35;
  }

  if (LOBYTE(self->_interposerVersion))
  {
    if (a5)
    {
      uint64_t v31 = 32LL;
      goto LABEL_35;
    }

- (BOOL)send:(id)a3 inReplyTo:(id)a4 error:(id *)a5
{
  return -[GTTransport_tools_diagnostics send:inReplyTo:error:replyQueue:timeout:handler:]( self,  "send:inReplyTo:error:replyQueue:timeout:handler:",  a3,  a4,  a5,  0LL,  0LL,  0LL);
}

- (BOOL)send:(id)a3 error:(id *)a4 replyQueue:(id)a5 timeout:(unint64_t)a6 handler:(id)a7
{
  return -[GTTransport_tools_diagnostics send:inReplyTo:error:replyQueue:timeout:handler:]( self,  "send:inReplyTo:error:replyQueue:timeout:handler:",  a3,  0LL,  a4,  a5,  a6,  a7);
}

- (BOOL)send:(id)a3 error:(id *)a4
{
  return -[GTTransport_tools_diagnostics send:inReplyTo:error:replyQueue:timeout:handler:]( self,  "send:inReplyTo:error:replyQueue:timeout:handler:",  a3,  0LL,  a4,  0LL,  0LL,  0LL);
}

- (BOOL)sendNewMessage:(int)a3 error:(id *)a4 replyQueue:(id)a5 timeout:(unint64_t)a6 handler:(id)a7
{
  id v12 = -[GTTransportMessage_tools_diagnostics initWithKind:attributes:payload:]( objc_alloc(&OBJC_CLASS___GTTransportMessage_tools_diagnostics),  "initWithKind:attributes:payload:",  *(void *)&a3,  0LL,  0LL);
  LOBYTE(a7) = -[GTTransport_tools_diagnostics send:inReplyTo:error:replyQueue:timeout:handler:]( self,  "send:inReplyTo:error:replyQueue:timeout:handler:",  v12,  0LL,  a4,  a5,  a6,  a7);

  return (char)a7;
}

- (BOOL)sendNewMessage:(int)a3 error:(id *)a4
{
  return -[GTTransport_tools_diagnostics sendNewMessage:error:replyQueue:timeout:handler:]( self,  "sendNewMessage:error:replyQueue:timeout:handler:",  *(void *)&a3,  a4,  0LL,  0LL,  0LL);
}

- (BOOL)relayMessage:(id)a3 error:(id *)a4
{
  if ([a3 transport] == self)
  {
    if (!a4) {
      goto LABEL_16;
    }
    uint64_t v11 = 40LL;
LABEL_15:
    id v12 = +[GTError_tools_diagnostics errorWithDomain:code:userInfo:]( &OBJC_CLASS___GTError_tools_diagnostics,  "errorWithDomain:code:userInfo:",  @"DYErrorDomain",  v11,  0LL);
    LOBYTE(v7) = 0;
    *a4 = v12;
    return v7;
  }

  if (!-[GTTransport_tools_diagnostics connected](self, "connected"))
  {
    if (!a4) {
      goto LABEL_16;
    }
    uint64_t v11 = 33LL;
    goto LABEL_15;
  }

  if (LOBYTE(self->_interposerVersion))
  {
    if (a4)
    {
      uint64_t v11 = 32LL;
      goto LABEL_15;
    }

- (void)drainQueue
{
}

- (NSError)error
{
  return (NSError *)self->_identifier;
}

- (BOOL)prioritizeOutgoingMessages
{
  return BYTE1(self->_interposerVersion);
}

- (void)setPrioritizeOutgoingMessages:(BOOL)a3
{
  BYTE1(self->_interposerVersion) = a3;
}

- (NSString)identifier
{
  return (NSString *)self->_dispatch_send;
}

- (void)setIdentifier:(id)a3
{
}

- (unsigned)interposerVersion
{
  return self->_sources;
}

- (void)setInterposerVersion:(unsigned int)a3
{
  LODWORD(self->_sources) = a3;
}

@end
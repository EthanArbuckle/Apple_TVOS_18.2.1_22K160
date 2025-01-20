@interface DTXChannel
- ($C38797EDD6FB49B683709165A7F1BAB0)_callbackSnapshot;
- (BOOL)isCanceled;
- (BOOL)sendMessageAsync:(id)a3 replyHandler:(id)a4;
- (DTXChannel)initWithConnection:(id)a3 channelIdentifier:(unsigned int)a4 label:(id)a5;
- (DTXConnection)_connection;
- (NSString)description;
- (NSString)label;
- (int)compressionTypeHint;
- (unsigned)channelCode;
- (void)_scheduleBlock:(id)a3;
- (void)_scheduleMessage:(id)a3 tracker:(id)a4 withHandler:(id)a5;
- (void)_setDispatchTarget:(id)a3 queue:(id)a4;
- (void)_setDispatchValidator:(id)a3;
- (void)cancel;
- (void)registerDisconnectHandler:(id)a3;
- (void)resume;
- (void)sendControlAsync:(id)a3 replyHandler:(id)a4;
- (void)sendControlSync:(id)a3 replyHandler:(id)a4;
- (void)sendMessage:(id)a3 replyHandler:(id)a4;
- (void)sendMessageSync:(id)a3 replyHandler:(id)a4;
- (void)setCompressionTypeHint:(int)a3;
- (void)setDispatchTarget:(id)a3;
- (void)setIsCanceled:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setMessageHandler:(id)a3;
- (void)suspend;
@end

@implementation DTXChannel

- (DTXChannel)initWithConnection:(id)a3 channelIdentifier:(unsigned int)a4 label:(id)a5
{
  v10 = (DTXConnection *)a3;
  id v13 = a5;
  if (!v10)
  {
    objc_msgSend_currentHandler(MEMORY[0x1896077D8], v11, v12);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_( v32,  v33,  (uint64_t)a2,  self,  @"DTXConnection.m",  1664,  @"Invalid parameter not satisfying: %@",  @"connection");
  }

  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___DTXChannel;
  v14 = -[DTXChannel init](&v34, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_channelCode = a4;
    objc_storeStrong((id *)&v14->_label, a5);
    if (v15->_channelCode) {
      objc_storeStrong((id *)&v15->_strongConnection, a3);
    }
    v15->_connection = v10;
    v18 = (void *)NSString;
    uint64_t v19 = objc_msgSend_atomicConnectionNumber(v10, v16, v17);
    LODWORD(v21) = v15->_channelCode;
    BOOL v22 = (int)v21 < 0;
    else {
      uint64_t v21 = -(int)v21;
    }
    v23 = "f";
    if (!v22) {
      v23 = "";
    }
    id v24 = objc_msgSend_stringWithFormat_( v18,  v20,  (uint64_t)@"%s [x%d.c%d%s]",  "DTXChannel serializer queue",  v19,  v21,  v23);
    v27 = (const char *)objc_msgSend_UTF8String(v24, v25, v26);
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v28 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v29 = dispatch_queue_create(v27, v28);
    serialQueue = v15->_serialQueue;
    v15->_serialQueue = (OS_dispatch_queue *)v29;

    v15->_handlerGuard._os_unfair_lock_opaque = 0;
    v15->_compressionTypeHint = 1;
  }

  return v15;
}

- (NSString)description
{
  v3 = (void *)NSString;
  v4 = (objc_class *)objc_opt_class();
  Name = class_getName(v4);
  uint64_t v8 = objc_msgSend_atomicConnectionNumber(self->_connection, v6, v7);
  LODWORD(v10) = self->_channelCode;
  BOOL v11 = (int)v10 < 0;
  else {
    uint64_t v10 = -(int)v10;
  }
  uint64_t v12 = "f";
  if (!v11) {
    uint64_t v12 = "";
  }
  return (NSString *)objc_msgSend_stringWithFormat_( v3,  v9,  (uint64_t)@"<%s %p : x%d.c%d%s> \"%@\"",  Name,  self,  v8,  v10,  v12,  self->_label);
}

- (void)_scheduleBlock:(id)a3
{
  if (a3) {
    dispatch_async((dispatch_queue_t)self->_serialQueue, a3);
  }
}

- (void)_scheduleMessage:(id)a3 tracker:(id)a4 withHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v12 = a5;
  if (!v8) {
    id v8 = (id)kDTXInterruptionMessage;
  }
  int v13 = objc_msgSend_errorStatus(v8, v10, v11);
  if (v12 || v13 != 2)
  {
    if (objc_msgSend_isDispatch(v8, v14, v15))
    {
      uint64_t v17 = self->_connection;
      v24[0] = MEMORY[0x1895F87A8];
      v24[1] = 3221225472LL;
      v24[2] = sub_188BCDA0C;
      v24[3] = &unk_18A2EDD00;
      v24[4] = self;
      id v25 = v8;
      uint64_t v26 = v17;
      id v27 = v9;
      v18 = v17;
      uint64_t v19 = (void *)MEMORY[0x1895D398C](v24);

      if (!v19) {
        goto LABEL_11;
      }
    }

    else
    {
      v20[0] = MEMORY[0x1895F87A8];
      v20[1] = 3221225472LL;
      v20[2] = sub_188BCDD40;
      v20[3] = &unk_18A2EDD28;
      v20[4] = self;
      id v23 = v12;
      id v21 = v8;
      id v22 = v9;
      uint64_t v19 = (void *)MEMORY[0x1895D398C](v20);

      if (!v19)
      {
LABEL_11:

        goto LABEL_12;
      }
    }

    dispatch_async((dispatch_queue_t)self->_serialQueue, v19);
    goto LABEL_11;
  }

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_188BCD9D0;
  block[3] = &unk_18A2ED618;
  block[4] = self;
  dispatch_async((dispatch_queue_t)serialQueue, block);
LABEL_12:
}

- ($C38797EDD6FB49B683709165A7F1BAB0)_callbackSnapshot
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x5012000000LL;
  id v9 = sub_188BCDF4C;
  uint64_t v10 = sub_188BCDF80;
  uint64_t v11 = 1024LL;
  memset(v12, 0, sizeof(v12));
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_188BCDFF4;
  v5[3] = &unk_18A2EDD50;
  v5[4] = &v6;
  sub_188BCDF88((os_unfair_lock_s *)self, v5);
  sub_188BCDCB0(retstr, (uint64_t)(v7 + 6));
  _Block_object_dispose(&v6, 8);
  sub_188BCDD08((id *)v12);
  return result;
}

- (void)setMessageHandler:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  int v13 = sub_188BCB034;
  v14 = sub_188BCB05C;
  id v15 = 0LL;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = sub_188BCE148;
  v7[3] = &unk_18A2EDD78;
  id v5 = v4;
  v7[4] = self;
  id v8 = v5;
  id v9 = &v10;
  sub_188BCDF88((os_unfair_lock_s *)self, v7);
  uint64_t v6 = (void *)v11[5];
  v11[5] = 0LL;

  _Block_object_dispose(&v10, 8);
}

- (void)_setDispatchTarget:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = sub_188BC8900;
  uint64_t v19 = sub_188BC8910;
  id v20 = 0LL;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = sub_188BCE340;
  v11[3] = &unk_18A2EDDA0;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  v14 = &v15;
  id v9 = v7;
  id v13 = v9;
  sub_188BCDF88((os_unfair_lock_s *)self, v11);
  uint64_t v10 = (void *)v16[5];
  v16[5] = 0LL;

  _Block_object_dispose(&v15, 8);
}

- (void)setDispatchTarget:(id)a3
{
}

- (void)_setDispatchValidator:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = sub_188BCE444;
  v6[3] = &unk_18A2EDDC8;
  id v7 = v4;
  id v5 = v4;
  sub_188BCDF88((os_unfair_lock_s *)self, v6);
}

- (void)registerDisconnectHandler:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    connection = self->_connection;
    uint64_t v7 = qword_18C4FE7A0;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = sub_188BCE510;
    v9[3] = &unk_18A2EDDF0;
    id v10 = v4;
    objc_msgSend_sendMessage_fromChannel_sendMode_syncWithReply_replyHandler_(connection, v8, v7, self, 2, 0, v9);
  }
}

- (void)cancel
{
}

- (void)suspend
{
}

- (void)resume
{
}

- (void)sendControlAsync:(id)a3 replyHandler:(id)a4
{
}

- (void)sendControlSync:(id)a3 replyHandler:(id)a4
{
  id v9 = a3;
  id v8 = a4;
  if (!v8) {
    sub_188BCE5EC((uint64_t)self, a2);
  }
  objc_msgSend_sendMessage_fromChannel_sendMode_syncWithReply_replyHandler_( self->_connection,  v7,  (uint64_t)v9,  self,  2,  1,  v8);
}

- (BOOL)sendMessageAsync:(id)a3 replyHandler:(id)a4
{
  return objc_msgSend_sendMessage_fromChannel_sendMode_syncWithReply_replyHandler_( self->_connection,  a2,  (uint64_t)a3,  self,  0,  0,  a4);
}

- (void)sendMessage:(id)a3 replyHandler:(id)a4
{
}

- (void)sendMessageSync:(id)a3 replyHandler:(id)a4
{
  id v8 = a3;
  id v7 = a4;
  if (!v7) {
    sub_188BCE5EC((uint64_t)self, a2);
  }
  sub_188BCE700(v8, self->_connection, self, 1LL, v7);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (BOOL)isCanceled
{
  return self->_canceled;
}

- (void)setIsCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (unsigned)channelCode
{
  return self->_channelCode;
}

- (int)compressionTypeHint
{
  return self->_compressionTypeHint;
}

- (void)setCompressionTypeHint:(int)a3
{
  self->_compressionTypeHint = a3;
}

- (DTXConnection)_connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
}

@end
@interface DTXFileDescriptorTransport
- (DTXFileDescriptorTransport)init;
- (DTXFileDescriptorTransport)initWithIncomingFileDescriptor:(int)a3 outgoingFileDescriptor:(int)a4 disconnectBlock:(id)a5;
- (DTXFileDescriptorTransport)initWithIncomingFilePath:(id)a3 outgoingFilePath:(id)a4 error:(id *)a5;
- (DTXFileDescriptorTransport)initWithXPCRepresentation:(id)a3;
- (id)serializedXPCRepresentation;
- (int)_createWriteKQueue:(int)a3;
- (unint64_t)transmit:(const void *)a3 ofLength:(unint64_t)a4;
- (unsigned)supportedDirections;
- (void)_setupReadSource:(int)a3;
- (void)dealloc;
- (void)disconnect;
- (void)setupWithIncomingDescriptor:(int)a3 outgoingDescriptor:(int)a4 disconnectBlock:(id)a5;
@end

@implementation DTXFileDescriptorTransport

- (DTXFileDescriptorTransport)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DTXFileDescriptorTransport;
  v2 = -[DTXTransport init](&v5, sel_init);
  v3 = v2;
  if (v2) {
    sub_188BD91A0(v2);
  }
  return v3;
}

- (DTXFileDescriptorTransport)initWithIncomingFilePath:(id)a3 outgoingFilePath:(id)a4 error:(id *)a5
{
  unint64_t v8 = (unint64_t)a3;
  unint64_t v9 = (unint64_t)a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___DTXFileDescriptorTransport;
  v10 = -[DTXTransport init](&v19, sel_init);
  v11 = v10;
  if (v10)
  {
    sub_188BD91A0(v10);
    if (v8)
    {
      uint64_t v14 = sub_188BD939C((void *)v8, 0x1000000, a5);
      if ((v14 & 0x80000000) == 0)
      {
        uint64_t v15 = v14;
        if (fstat(v14, &v18) || !v18.st_size) {
          objc_msgSend_disconnect(v11, v12, v16);
        }
        if (!v9) {
          goto LABEL_15;
        }
LABEL_11:
LABEL_15:
        objc_msgSend_setupWithIncomingDescriptor_outgoingDescriptor_disconnectBlock_(v11, v12, v15);
        goto LABEL_17;
      }
    }

    else
    {
      if (v9)
      {
        uint64_t v15 = 0xFFFFFFFFLL;
        goto LABEL_11;
      }

      if (v8 | v9)
      {
        uint64_t v15 = 0xFFFFFFFFLL;
        goto LABEL_15;
      }
    }

- (DTXFileDescriptorTransport)initWithIncomingFileDescriptor:(int)a3 outgoingFileDescriptor:(int)a4 disconnectBlock:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___DTXFileDescriptorTransport;
  unint64_t v9 = -[DTXTransport init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    sub_188BD91A0(v9);
    if ((int)(v5 & v6) < 0 != v12)
    {

      v10 = 0LL;
    }

    else
    {
      objc_msgSend_setupWithIncomingDescriptor_outgoingDescriptor_disconnectBlock_(v10, v11, v6, v5, v8);
    }
  }

  return v10;
}

- (void)_setupReadSource:(int)a3
{
  uint64_t v5 = dispatch_source_create(MEMORY[0x1895F8B60], a3, 0LL, (dispatch_queue_t)self->_inputQueue);
  if ((a3 & 0x80000000) == 0)
  {
    int v6 = fcntl(a3, 3);
    if ((v6 & 4) == 0) {
      fcntl(a3, 4, v6 | 4u);
    }
  }

  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = sub_188BD9684;
  v12[3] = &unk_18A2EDEA0;
  int v13 = a3;
  v12[4] = self;
  v7 = (void *)MEMORY[0x1895D398C](v12);
  id v8 = (void *)MEMORY[0x1895D398C]();
  id inputReaderBlock = self->_inputReaderBlock;
  self->_id inputReaderBlock = v8;

  dispatch_source_set_event_handler(v5, self->_inputReaderBlock);
  inputSource = self->_inputSource;
  self->_inputSource = (OS_dispatch_source *)v5;
  v11 = v5;

  dispatch_resume(v11);
}

- (int)_createWriteKQueue:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 < 0 || fcntl(a3, 73, 1LL) == -1)
  {
    int v6 = __error();
    NSLog(@"Unable to disable SIGPIPE for FD %d: %d", v3, *v6);
    return -1;
  }

  else
  {
    int v4 = kqueue();
    int v5 = v4;
    if (v4 < 0)
    {
      uint64_t v9 = *__error();
      NSLog(@"Failed to create output kqueue(): %d", v9);
    }

    else
    {
      changelist.ident = v3;
      *(_DWORD *)&changelist.filter = 2490366;
      memset(&changelist.fflags, 0, 20);
      if (kevent(v4, &changelist, 1, 0LL, 0, 0LL) == -1)
      {
        uint64_t v8 = *__error();
        NSLog(@"Failed to handle kevent(): %d", v8);
      }
    }
  }

  return v5;
}

- (void)setupWithIncomingDescriptor:(int)a3 outgoingDescriptor:(int)a4 disconnectBlock:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  self->_inFD = a3;
  self->_outFD = a4;
  uint64_t v8 = (void *)MEMORY[0x1895D398C](a5, a2);
  id disconnectBlock = self->_disconnectBlock;
  self->_id disconnectBlock = v8;

  if ((v6 & 0x80000000) != 0)
  {
    if ((v5 & 0x80000000) != 0)
    {
LABEL_2:
      objc_msgSend_disconnect(self, v12, v13);
      return;
    }
  }

  else if ((v5 & 0x80000000) != 0)
  {
    goto LABEL_9;
  }

  int v14 = objc_msgSend__createWriteKQueue_(self, v12, v5);
  if (v14 < 0) {
    goto LABEL_2;
  }
  self->_outputWaitKQ = v14;
  if ((v6 & 0x80000000) == 0) {
LABEL_9:
  }
    objc_msgSend__setupReadSource_(self, v12, v6);
  objc_msgSend_setStatus_(self, v12, 1);
}

- (DTXFileDescriptorTransport)initWithXPCRepresentation:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___DTXFileDescriptorTransport;
  uint64_t v5 = -[DTXTransport initWithXPCRepresentation:](&v11, sel_initWithXPCRepresentation_, v4);
  uint64_t v6 = v5;
  if (v5)
  {
    sub_188BD91A0(v5);
    uint64_t v7 = xpc_dictionary_dup_fd(v4, "_inFD");
    int v8 = xpc_dictionary_dup_fd(v4, "_outFD");
    if ((v7 & 0x80000000) != 0 && v8 < 0)
    {

      uint64_t v6 = 0LL;
    }

    else
    {
      objc_msgSend_setupWithIncomingDescriptor_outgoingDescriptor_disconnectBlock_(v6, v9, v7);
    }
  }

  return v6;
}

- (void)dealloc
{
  int outputWaitKQ = self->_outputWaitKQ;
  if ((outputWaitKQ & 0x80000000) == 0)
  {
    close(outputWaitKQ);
    self->_int outputWaitKQ = -1;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DTXFileDescriptorTransport;
  -[DTXTransport dealloc](&v4, sel_dealloc);
}

- (id)serializedXPCRepresentation
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_188BD9BA4;
  v10 = sub_188BD9BB4;
  id v11 = 0LL;
  outputQueue = self->_outputQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_188BD9BBC;
  v5[3] = &unk_18A2ED578;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)outputQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (unint64_t)transmit:(const void *)a3 ofLength:(unint64_t)a4
{
  if (objc_msgSend_status(self, a2, (uint64_t)a3) == 1)
  {
    uint64_t v15 = 0LL;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2020000000LL;
    uint64_t v18 = 0LL;
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = sub_188BD9E38;
    v14[3] = &unk_18A2EE538;
    v14[4] = self;
    v14[5] = &v15;
    v14[6] = a3;
    v14[7] = a4;
    uint64_t v7 = (unsigned int (**)(void))MEMORY[0x1895D398C](v14);
    while (v7[2](v7) && v16[3] < a4)
    {
      uint64_t v10 = kevent(self->_outputWaitKQ, 0LL, 0, &eventlist, 1, 0LL);
      if ((_DWORD)v10 == 1)
      {
      }

      else if (*__error() != 4)
      {
        id v11 = __error();
        NSLog(@"kevent failure: num events was %d (errno: %d)", v10, *v11);
LABEL_10:
        objc_msgSend_disconnect(self, v8, v9);
        break;
      }
    }

    a4 = v16[3];

    _Block_object_dispose(&v15, 8);
  }

  return a4;
}

- (void)disconnect
{
  inputSource = self->_inputSource;
  if (inputSource) {
    dispatch_source_cancel((dispatch_source_t)inputSource);
  }
  inputQueue = self->_inputQueue;
  uint64_t v5 = MEMORY[0x1895F87A8];
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_188BDA074;
  block[3] = &unk_18A2ED618;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)inputQueue, block);
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DTXFileDescriptorTransport;
  -[DTXTransport disconnect](&v8, sel_disconnect);
  outputQueue = self->_outputQueue;
  v7[0] = v5;
  v7[1] = 3221225472LL;
  v7[2] = sub_188BDA0C4;
  v7[3] = &unk_18A2ED618;
  v7[4] = self;
  dispatch_async((dispatch_queue_t)outputQueue, v7);
}

- (unsigned)supportedDirections
{
  int outFD = self->_outFD;
  if (self->_inFD < 0)
  {
    if (outFD < 0)
    {
      v4.receiver = self;
      v4.super_class = (Class)&OBJC_CLASS___DTXFileDescriptorTransport;
      return -[DTXTransport supportedDirections](&v4, sel_supportedDirections);
    }

    else
    {
      return 2;
    }
  }

  else if (outFD < 0)
  {
    return 1;
  }

  else
  {
    return 3;
  }

- (void).cxx_destruct
{
}

@end
@interface GTBaseStreamTransport_replayer
- (BOOL)_packMessage:(id)a3 error:(id *)a4;
- (GTBaseStreamTransport_replayer)init;
- (int64_t)_performRead:(void *)a3 size:(unint64_t)a4;
- (int64_t)_read:(void *)a3 size:(unint64_t)a4;
- (int64_t)_readAndAccumulate;
- (int64_t)_relayBuffer:(const void *)a3 size:(unint64_t)a4;
- (int64_t)_relayBufferInner:(const void *)a3 size:(unint64_t)a4;
- (int64_t)_sendMessage:(id)a3 error:(id *)a4;
- (int64_t)_syncTmuToHeader:(dy_transport_message_unpack_s *)a3 ioBlock:(id)a4;
- (int64_t)_write:(const void *)a3 size:(unint64_t)a4;
- (int64_t)_writeBuffers:(id *)a3;
- (void)_allocateMessageBuffer;
- (void)_clearBuffers;
- (void)_invalidate;
- (void)_scheduleInvalidation:(id)a3;
- (void)_unpackAndDispatchMessage;
- (void)_waitEAGAIN;
- (void)dealloc;
@end

@implementation GTBaseStreamTransport_replayer

- (GTBaseStreamTransport_replayer)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___GTBaseStreamTransport_replayer;
  id v2 = -[GTTransport_replayer init](&v8, "init");
  if (v2)
  {
    vm_address_t v3 = GTCoreAlloc(0x31uLL);
    *((void *)v2 + 13) = v3;
    if (v3)
    {
      *(void *)(v3 + 24) = 0x1000000001LL;
      *(_OWORD *)(v3 + 32) = xmmword_3183C0;
      *(_BYTE *)(v3 + 48) = 0;
      vm_address_t v4 = GTCoreAlloc(0x31uLL);
      *((void *)v2 + 28) = v4;
      if (v4)
      {
        *(void *)(v4 + 24) = 0x100000001LL;
        *(_OWORD *)(v4 + 32) = xmmword_3183C0;
        *(_BYTE *)(v4 + 48) = 0;
        v5 = -[NSString UTF8String]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"gputools.%@.%p.%@",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  object_getClassName(v2)),  v2,  @"relay"),  "UTF8String");
        *((void *)v2 + 27) = dispatch_queue_create_with_target_V2(v5, 0LL, *((dispatch_queue_t *)v2 + 2));
        *((void *)v2 + 26) = dispatch_semaphore_create(1LL);
        return (GTBaseStreamTransport_replayer *)v2;
      }

      v7 = "_relayTmu";
    }

    else
    {
      v7 = "_tmu";
    }

    __assert_rtn("-[GTBaseStreamTransport init]", "", 0, v7);
  }

  return (GTBaseStreamTransport_replayer *)v2;
}

- (void)dealloc
{
  sendSema = (dispatch_object_s *)self->_sendSema;
  if (sendSema)
  {
    dispatch_release(sendSema);
    self->_sendSema = 0LL;
  }

  relayQueue = (dispatch_object_s *)self->_relayQueue;
  if (relayQueue)
  {
    dispatch_release(relayQueue);
    self->_relayQueue = 0LL;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___GTBaseStreamTransport_replayer;
  -[GTTransport_replayer dealloc](&v5, "dealloc");
}

- (void)_invalidate
{
  if (self)
  {
    vm_deallocate(mach_task_self_, (vm_address_t)self->_relayTmu, 0x31uLL);
    self->_relayTmu = 0LL;
    vm_deallocate(mach_task_self_, (vm_address_t)self->_tmu, 0x31uLL);
    self->_tmu = 0LL;
  }

  self->_messageBuffer = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GTBaseStreamTransport_replayer;
  -[GTTransport_replayer _invalidate](&v3, "_invalidate");
}

- (void)_scheduleInvalidation:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___GTBaseStreamTransport_replayer;
  -[GTTransport_replayer _scheduleInvalidation:](&v4, "_scheduleInvalidation:", a3);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_sendSema);
}

- (int64_t)_read:(void *)a3 size:(unint64_t)a4
{
  return 0LL;
}

- (int64_t)_write:(const void *)a3 size:(unint64_t)a4
{
  return 0LL;
}

- (void)_waitEAGAIN
{
}

- (int64_t)_syncTmuToHeader:(dy_transport_message_unpack_s *)a3 ioBlock:(id)a4
{
  int64_t result = (*((uint64_t (**)(id, SEL))a4 + 2))(a4, a2);
  if (result != -1 && !a3->var3)
  {
    a3->var5 = 1;
    __int128 v7 = *(_OWORD *)&a3->var0.var0;
    *(int8x16_t *)&a3->var0.var0 = vrev32q_s8(*(int8x16_t *)&a3->var0.var0);
    unsigned int v8 = bswap32(a3->var0.var4);
    unsigned int v9 = bswap32(a3->var0.var5);
    a3->var0.var4 = v8;
    a3->var0.var5 = v9;
    if ((_DWORD)v7 == 1296389188)
    {
      a3->var3 = (v9 & 0x7FFFFFFF) + (v8 & 0x7FFFFFFF);
      a3->var4 = 0LL;
      if (self->_tmu->var3 + self->_tmu->var1 - 1 + self->_tmu->var2 - 1 < 0xF4240001) {
        return result;
      }
      v10 = objc_autoreleasePoolPush();
      uint64_t v11 = 261LL;
    }

    else
    {
      v10 = objc_autoreleasePoolPush();
      uint64_t v11 = 259LL;
    }

    -[GTBaseStreamTransport_replayer _scheduleInvalidation:]( self,  "_scheduleInvalidation:",  +[GTError_replayer errorWithDomain:code:userInfo:]( &OBJC_CLASS___GTError_replayer,  "errorWithDomain:code:userInfo:",  @"DYErrorDomain",  v11,  0LL));
    objc_autoreleasePoolPop(v10);
    return -1LL;
  }

  return result;
}

- (void)_unpackAndDispatchMessage
{
  objc_super v3 = objc_autoreleasePoolPush();
  uint64_t v4 = self->_tmu->var0.var4 & 0x7FFFFFFF;
  id v5 = -[GTVMBuffer mutableBytes](self->_messageBuffer, "mutableBytes");
  tmu = self->_tmu;
  uint64_t v7 = ((unint64_t)v5 + tmu->var1 - 1) & -(uint64_t)tmu->var1;
  if ((tmu->var0.var4 & 0x80000000) != 0)
  {
    id v10 = +[NSPropertyListSerialization propertyListWithData:options:format:error:]( NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  objc_msgSend( -[GTVMBuffer subdataWithRange:]( self->_messageBuffer,  "subdataWithRange:",  v7 - (void)-[GTVMBuffer mutableBytes](self->_messageBuffer, "mutableBytes"),  v4),  "GTGPUToolsData"),  0,  0,  0);
    if (!v10)
    {
      -[GTBaseStreamTransport_replayer _scheduleInvalidation:]( self,  "_scheduleInvalidation:",  +[GTError_replayer errorWithDomain:code:userInfo:]( &OBJC_CLASS___GTError_replayer,  "errorWithDomain:code:userInfo:",  @"DYErrorDomain",  260LL,  0LL));
      objc_autoreleasePoolPop(v3);
      return;
    }

    id v8 = v10;
    uint64_t v9 = (v4 + 24);
    tmu = self->_tmu;
  }

  else
  {
    id v8 = 0LL;
    uint64_t v9 = 24LL;
  }

  unsigned int var5 = tmu->var0.var5;
  if ((var5 & 0x80000000) != 0)
  {
    int v13 = var5 & 0x7FFFFFFF;
    id v12 = objc_msgSend( -[GTVMBuffer subdataWithRange:]( self->_messageBuffer,  "subdataWithRange:",  ((v7 + v4 + tmu->var2 - 1) & -(uint64_t)tmu->var2)
            - (void)-[GTVMBuffer mutableBytes](self->_messageBuffer, "mutableBytes"),
              var5 & 0x7FFFFFFF),
            "GTGPUToolsData");
    uint64_t v9 = (v13 + v9);
    tmu = self->_tmu;
  }

  else
  {
    id v12 = 0LL;
  }

  v14 = -[GTTransportMessage_replayer initWithKind:attributes:payload:]( objc_alloc(&OBJC_CLASS___GTTransportMessage_replayer),  "initWithKind:attributes:payload:",  tmu->var0.var1,  v8,  v12);
  -[GTTransportMessage_replayer _setSerial:replySerial:transport:]( v14,  "_setSerial:replySerial:transport:",  self->_tmu->var0.var2,  self->_tmu->var0.var3,  self);
  -[GTTransportMessage_replayer _setTransportSize:](v14, "_setTransportSize:", v9);
  objc_autoreleasePoolPop(v3);
  messageBuffer = self->_messageBuffer;
  uint64_t v17 = objc_opt_class(&OBJC_CLASS___GTVMBuffer_replayer, v16);
  if ((objc_opt_isKindOfClass(messageBuffer, v17) & 1) != 0)
  {
    v18 = (vm_address_t *)-[GTVMBuffer vmBuffer](self->_messageBuffer, "vmBuffer");
    vm_protect(mach_task_self_, *v18, v18[2] * v18[1], 0, 1);
  }

  self->_messageBuffer = 0LL;
  -[GTTransport_replayer _dispatchMessage:](self, "_dispatchMessage:", v14);

  v19 = self->_tmu;
  *(_OWORD *)&v19->var3 = xmmword_3183C0;
  v19->unsigned int var5 = 0;
}

- (void)_allocateMessageBuffer
{
  tmu = self->_tmu;
  if (!tmu->var5)
  {
    uint64_t v7 = "_tmu->hasHeader";
    goto LABEL_11;
  }

  vm_size_t v3 = tmu->var3 + tmu->var1 - 1 + tmu->var2 - 1;
  if (v3 >= 0xF4240001)
  {
    uint64_t v7 = "size_aligned <= MAXIMUM_MESSAGE_SIZE";
    goto LABEL_11;
  }

  if (v3 >= 3 * vm_page_size) {
    id v5 = (Class *)&off_3405E0;
  }
  else {
    id v5 = (Class *)&OBJC_CLASS___NSMutableData_ptr;
  }
  v6 = (GTVMBuffer *)[objc_alloc(*v5) initWithLength:v3];
  self->_messageBuffer = v6;
  if (!v6)
  {
    uint64_t v7 = "_messageBuffer != nil";
LABEL_11:
    __assert_rtn("-[GTBaseStreamTransport _allocateMessageBuffer]", "", 0, v7);
  }

- (int64_t)_performRead:(void *)a3 size:(unint64_t)a4
{
  if (!self->_bytesToRead) {
    self->_bytesToRead = a4;
  }
  do
  {
    int64_t result = -[GTBaseStreamTransport_replayer _read:size:](self, "_read:size:", a3, self->_bytesToRead);
    if (result != -1)
    {
      if (result)
      {
        tmu = self->_tmu;
        int64_t v11 = tmu->var4 + result;
        tmu->var3 -= result;
        tmu->var4 = v11;
        self->_bytesToRead = 0LL;
      }

      else
      {
        uint64_t v9 = objc_autoreleasePoolPush();
        -[GTBaseStreamTransport_replayer _scheduleInvalidation:]( self,  "_scheduleInvalidation:",  +[GTError_replayer errorWithDomain:code:userInfo:]( &OBJC_CLASS___GTError_replayer,  "errorWithDomain:code:userInfo:",  @"DYErrorDomain",  31LL,  0LL));
        objc_autoreleasePoolPop(v9);
        return 0LL;
      }

      return result;
    }

    int v7 = *__error();
  }

  while (v7 == 4);
  if (v7 != 35)
  {
    id v8 = objc_autoreleasePoolPush();
    -[GTBaseStreamTransport_replayer _scheduleInvalidation:]( self,  "_scheduleInvalidation:",  +[GTError_replayer errorWithDomain:code:userInfo:]( &OBJC_CLASS___GTError_replayer,  "errorWithDomain:code:userInfo:",  @"DYErrorDomain",  31LL,  0LL));
    objc_autoreleasePoolPop(v8);
  }

  *__error() = v7;
  return -1LL;
}

- (int64_t)_readAndAccumulate
{
  tmu = self->_tmu;
  if (tmu->var5)
  {
    int64_t v4 = 0LL;
  }

  else
  {
    int64_t v4 = -[GTBaseStreamTransport_replayer _syncTmuToHeader:ioBlock:](self, "_syncTmuToHeader:ioBlock:");
    if (v4 == -1) {
      return v4;
    }
    id v8 = self->_tmu;
    if (!v8->var5) {
      return v4;
    }
    if (!v8->var3)
    {
LABEL_16:
      -[GTBaseStreamTransport_replayer _unpackAndDispatchMessage](self, "_unpackAndDispatchMessage");
      return v4;
    }

    -[GTBaseStreamTransport_replayer _allocateMessageBuffer](self, "_allocateMessageBuffer");
    id v9 = -[GTVMBuffer mutableBytes](self->_messageBuffer, "mutableBytes");
    uint64_t var1 = self->_tmu->var1;
    self->_messageBufferWritePtr = (void *)(((unint64_t)v9 + var1 - 1) & -var1);
    tmu = self->_tmu;
    if (!tmu->var5) {
      return v4;
    }
  }

  unint64_t var4 = tmu->var4;
  unint64_t v6 = tmu->var0.var4 & 0x7FFFFFFF;
  unint64_t var3 = v6 - var4;
  if (v6 <= var4)
  {
    if (v6 == var4)
    {
      self->_messageBufferWritePtr = (void *)(((uint64_t)self->_messageBufferWritePtr + tmu->var2 - 1) & -(uint64_t)tmu->var2);
      unint64_t var3 = self->_tmu->var3;
    }

    else
    {
      unint64_t var3 = tmu->var3;
    }
  }

  int64_t v11 = -[GTBaseStreamTransport_replayer _performRead:size:]( self,  "_performRead:size:",  self->_messageBufferWritePtr,  var3);
  if (v11 == -1) {
    return -1LL;
  }
  v4 += v11;
  self->_messageBufferWritePtr = (char *)self->_messageBufferWritePtr + v11;
  if (!self->_tmu->var3) {
    goto LABEL_16;
  }
  return v4;
}

- (void)_clearBuffers
{
  uint64_t v2 = 0LL;
  buffers = self->_buffers;
  do
  {

    buffers[v2++] = 0LL;
  }

  while (v2 != 3);
}

- (int64_t)_writeBuffers:(id *)a3
{
  uint64_t v5 = 0LL;
  int64_t v6 = 0LL;
  int v7 = 0;
  buffers = self->_buffers;
  do
  {
    id v9 = buffers[v5];
    if (v9)
    {
      id v10 = &self->_iov[v7];
      v10->iov_base = (void *)-[NSData bytes](v9, "bytes");
      NSUInteger v11 = -[NSData length](buffers[v5], "length");
      v10->iov_len = v11;
      v6 += v11;
      ++v7;
    }

    ++v5;
  }

  while (v5 != 3);
  if (v6)
  {
    uint64_t v12 = 0LL;
    iov = self->_iov;
    int v14 = v7;
    while (1)
    {
      do
      {
        while (1)
        {
          unint64_t v15 = -[GTBaseStreamTransport_replayer _write:size:](self, "_write:size:", iov->iov_base, iov->iov_len);
          uint64_t v16 = __error();
          if (v15 == -1LL) {
            break;
          }
          v12 += v15;
          if (v12 == v6) {
            goto LABEL_25;
          }
          if (v14 < 1)
          {
            LODWORD(v18) = 0;
          }

          else
          {
            uint64_t v18 = 0LL;
            p_iov_len = &iov->iov_len;
            while (1)
            {
              size_t v20 = *p_iov_len;
              unint64_t v21 = v15 - *p_iov_len;
              if (v15 < *p_iov_len) {
                break;
              }
              ++v18;
              p_iov_len += 2;
              unint64_t v15 = v21;
              if (v14 == v18)
              {
                LODWORD(v18) = v14;
                goto LABEL_20;
              }
            }

            iov[v18].iov_base = (char *)iov[v18].iov_base + v15;
            size_t *p_iov_len = v20 - v15;
          }

- (BOOL)_packMessage:(id)a3 error:(id *)a4
{
  if ([a3 attributes])
  {
    id v14 = 0LL;
    int64_t v6 = objc_autoreleasePoolPush();
    int v7 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  [a3 attributes],  200,  0,  &v14);
    id v8 = v7;
    id v9 = v14;
    objc_autoreleasePoolPop(v6);
    if (!v7)
    {
      if (a4)
      {
        int v13 = +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v14,  NSUnderlyingErrorKey);

        *a4 = +[GTError_replayer errorWithDomain:code:userInfo:]( &OBJC_CLASS___GTError_replayer,  "errorWithDomain:code:userInfo:",  @"DYErrorDomain",  36LL,  v13);
      }

      return 0;
    }

    [a3 setEncodedAttributes:v7];
  }

  else
  {
    int v7 = 0LL;
  }

  unsigned int v10 = -[NSData length](v7, "length");
  if (v10 + objc_msgSend(objc_msgSend(a3, "payload"), "length") + 24 < 0xF4240001uLL)
  {
    objc_msgSend(a3, "_setTransportSize:");
    return 1;
  }

  [a3 setEncodedAttributes:0];
  if (a4)
  {
    id v12 = +[GTError_replayer errorWithDomain:code:userInfo:]( &OBJC_CLASS___GTError_replayer,  "errorWithDomain:code:userInfo:",  @"DYErrorDomain",  261LL,  0LL);
    BOOL result = 0;
    *a4 = v12;
    return result;
  }

  return 0;
}

- (int64_t)_sendMessage:(id)a3 error:(id *)a4
{
  id v7 = [a3 payload];
  id v8 = [a3 encodedAttributes];
  unsigned int v9 = [a3 kind];
  unsigned int v10 = [a3 serial];
  unsigned int v11 = [a3 replySerial];
  if (v8)
  {
    unsigned int v12 = [v8 length] | 0x80000000;
    if (v7)
    {
LABEL_3:
      unsigned int v13 = [v7 length] | 0x80000000;
      goto LABEL_6;
    }
  }

  else
  {
    unsigned int v12 = 0;
    if (v7) {
      goto LABEL_3;
    }
  }

  unsigned int v13 = 0;
LABEL_6:
  v17[0] = 1296389188;
  v17[1] = bswap32(v9);
  v17[2] = bswap32(v10);
  v17[3] = bswap32(v11);
  v17[4] = bswap32(v12);
  v17[5] = bswap32(v13);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_sendSema, 0xFFFFFFFFFFFFFFFFLL);
  if (LOBYTE(self->super._interposerVersion))
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_sendSema);
    [a3 setEncodedAttributes:0];
    return -1LL;
  }

  self->_buffers[0] = -[NSData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytes:length:",  v17,  24LL);
  if (!v8)
  {
    uint64_t v14 = 1LL;
    if (!v7) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  self->_buffers[1] = (NSData *)v8;
  [a3 setEncodedAttributes:0];
  uint64_t v14 = 2LL;
  if (v7) {
LABEL_9:
  }
    self->_buffers[v14] = (NSData *)v7;
LABEL_10:
  int64_t v15 = -[GTBaseStreamTransport_replayer _writeBuffers:](self, "_writeBuffers:", a4);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_sendSema);
  return v15;
}

- (int64_t)_relayBufferInner:(const void *)a3 size:(unint64_t)a4
{
  unint64_t v4 = a4;
  if (self->_relayTmu->var5)
  {
    uint64_t v7 = 0LL;
    if (!a4) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  int64_t v14 = -[GTBaseStreamTransport_replayer _syncTmuToHeader:ioBlock:](self, "_syncTmuToHeader:ioBlock:");
  if (v14 == -1) {
    return -1LL;
  }
  relayTmu = self->_relayTmu;
  if (!relayTmu->var5) {
    return 0LL;
  }
  int64_t v16 = v14;
  *(int8x16_t *)&relayTmu->var0.var0 = vrev32q_s8(*(int8x16_t *)&relayTmu->var0.var0);
  *(int8x8_t *)&relayTmu->var0.unint64_t var4 = vrev32_s8(*(int8x8_t *)&relayTmu->var0.var4);
  p_sendSema = &self->_sendSema;
  int64_t v9 = -1LL;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_sendSema, 0xFFFFFFFFFFFFFFFFLL);
  self->_buffers[0] = -[NSData initWithBytesNoCopy:length:freeWhenDone:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytesNoCopy:length:freeWhenDone:",  self->_relayTmu,  24LL,  0LL);
  int v17 = self->_relayTmu;
  v17->var3 += 24LL;
  if (!v17->var5) {
    return 0LL;
  }
  v4 -= v16;
  a3 = (char *)a3 + v16;
  uint64_t v7 = 1LL;
  if (v4) {
LABEL_4:
  }
    self->_buffers[v7] = -[NSData initWithBytesNoCopy:length:freeWhenDone:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytesNoCopy:length:freeWhenDone:",  a3,  v4,  0LL);
LABEL_5:
  int64_t v8 = -[GTBaseStreamTransport_replayer _writeBuffers:](self, "_writeBuffers:", 0LL);
  int64_t v9 = v8;
  if (v8 == -1)
  {
LABEL_8:
    p_sendSema = &self->_sendSema;
LABEL_9:
    dispatch_semaphore_signal((dispatch_semaphore_t)*p_sendSema);
    return v9;
  }

  unsigned int v10 = self->_relayTmu;
  unint64_t v11 = v10->var3 - v8;
  unint64_t v12 = v10->var4 + v8;
  v10->unint64_t var3 = v11;
  v10->unint64_t var4 = v12;
  if (!v11)
  {
    *(_OWORD *)&v10->unint64_t var3 = xmmword_3183C0;
    v10->unsigned int var5 = 0;
    goto LABEL_8;
  }

  return v9;
}

- (int64_t)_relayBuffer:(const void *)a3 size:(unint64_t)a4
{
  char v7 = BYTE1(self->super._interposerVersion);
  if (v7) {
    dispatch_suspend((dispatch_object_t)self->super._queue);
  }
  uint64_t v13 = 0LL;
  int64_t v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  relayQueue = (dispatch_queue_s *)self->_relayQueue;
  uint64_t v16 = 0LL;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __43__GTBaseStreamTransport__relayBuffer_size___block_invoke;
  block[3] = &unk_58E388;
  block[4] = self;
  block[5] = &v13;
  block[6] = a3;
  block[7] = a4;
  char v12 = v7;
  dispatch_sync(relayQueue, block);
  int64_t v9 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v9;
}

@end
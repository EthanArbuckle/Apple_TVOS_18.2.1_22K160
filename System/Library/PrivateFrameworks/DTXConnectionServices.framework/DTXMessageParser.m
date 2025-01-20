@interface DTXMessageParser
- (DTXMessageParser)initWithMessageHandler:(id)a3 andParseExceptionHandler:(id)a4;
- (id)parsingComplete;
- (void)_messageParsedWithHeader:(DTXMessageHeader *)a3 bytes:(const void *)a4 length:(unint64_t)a5 destructor:(id)a6;
- (void)dealloc;
- (void)parseIncomingBytes:(const char *)a3 length:(unint64_t)a4;
- (void)replaceCompressor:(id)a3;
@end

@implementation DTXMessageParser

- (DTXMessageParser)initWithMessageHandler:(id)a3 andParseExceptionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___DTXMessageParser;
  v8 = -[DTXMessageParser init](&v23, sel_init);
  v11 = v8;
  if (v8)
  {
    if (v6)
    {
      uint64_t BlockCompressor = objc_msgSend_createBlockCompressor(DTXBlockCompressorFactory, v9, v10);
      compressor = v11->_compressor;
      v11->_compressor = (DTXBlockCompressor *)BlockCompressor;

      uint64_t v14 = MEMORY[0x1895D398C](v7);
      id exceptionHandler = v11->_exceptionHandler;
      v11->_id exceptionHandler = (id)v14;

      uint64_t v16 = MEMORY[0x1895D398C](v6);
      id parsedMessageHandler = v11->_parsedMessageHandler;
      v11->_id parsedMessageHandler = (id)v16;

      uint64_t v18 = objc_opt_new();
      fragmentedBuffersByIdentifier = v11->_fragmentedBuffersByIdentifier;
      v11->_fragmentedBuffersByIdentifier = (NSMutableDictionary *)v18;

      dispatch_queue_t v20 = dispatch_queue_create("DTXMessage parsing queue", 0LL);
      parsingQueue = v11->_parsingQueue;
      v11->_parsingQueue = (OS_dispatch_queue *)v20;
    }

    else
    {
      parsingQueue = v8;
      v11 = 0LL;
    }
  }

  return v11;
}

- (void)dealloc
{
  parsingBuffer = (char *)self->_parsingBuffer;
  if (parsingBuffer)
  {
    free(parsingBuffer);
    self->_parsingBuffer = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DTXMessageParser;
  -[DTXMessageParser dealloc](&v4, sel_dealloc);
}

- (void)_messageParsedWithHeader:(DTXMessageHeader *)a3 bytes:(const void *)a4 length:(unint64_t)a5 destructor:(id)a6
{
  id v19 = a6;
  uint64_t v10 = (void *)MEMORY[0x1895D37B8]();
  v11 = objc_alloc(&OBJC_CLASS___DTXMessage);
  v13 = (void *)objc_msgSend_initWithSerializedForm_length_destructor_compressor_( v11,  v12,  (uint64_t)a4,  a5,  v19,  self->_compressor);
  v15 = v13;
  if (v13)
  {
    objc_msgSend_setExpectsReply_(v13, v14, *((_DWORD *)&a3->var5 + 3) & 1);
    objc_msgSend_setIdentifier_(v15, v16, a3->var5.var0);
    objc_msgSend_setChannelCode_(v15, v17, a3->var5.var2);
    objc_msgSend_setConversationIndex_(v15, v18, a3->var5.var1);
    (*((void (**)(void))self->_parsedMessageHandler + 2))();
  }

  objc_autoreleasePoolPop(v10);
}

- (void)parseIncomingBytes:(const char *)a3 length:(unint64_t)a4
{
  if (a3 && a4)
  {
    parsingQueue = self->_parsingQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_188BD17BC;
    block[3] = &unk_18A2ED750;
    block[4] = self;
    block[5] = a4;
    block[6] = a3;
    dispatch_sync((dispatch_queue_t)parsingQueue, block);
  }

  else
  {
    id v5 = (id)objc_msgSend_parsingComplete(self, a2, (uint64_t)a3, a4);
  }

- (id)parsingComplete
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_188BD1E50;
  uint64_t v10 = sub_188BD1E60;
  id v11 = 0LL;
  parsingQueue = self->_parsingQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_188BD1E68;
  v5[3] = &unk_18A2ED578;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)parsingQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)replaceCompressor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
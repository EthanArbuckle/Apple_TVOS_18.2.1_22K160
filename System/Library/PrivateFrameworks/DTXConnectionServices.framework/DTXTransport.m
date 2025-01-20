@interface DTXTransport
+ (BOOL)recognizesURL:(id)a3;
+ (id)schemes;
- (DTXResourceTracker)resourceTracker;
- (DTXTransport)init;
- (DTXTransport)initWithRemoteAddress:(id)a3;
- (DTXTransport)initWithXPCRepresentation:(id)a3;
- (NSArray)localAddresses;
- (id)dataReceivedHandler;
- (id)permittedBlockCompressionTypes;
- (id)serializedXPCRepresentation;
- (unint64_t)transmit:(const void *)a3 ofLength:(unint64_t)a4;
- (unsigned)status;
- (unsigned)supportedDirections;
- (void)dealloc;
- (void)disconnect;
- (void)received:(const char *)a3 ofLength:(unint64_t)a4 destructor:(id)a5;
- (void)serializedDisconnect:(id)a3;
- (void)setDataReceivedHandler:(id)a3;
- (void)setStatus:(unsigned int)a3;
@end

@implementation DTXTransport

+ (id)schemes
{
  return 0LL;
}

+ (BOOL)recognizesURL:(id)a3
{
  id v4 = a3;
  objc_msgSend_schemes(a1, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_scheme(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend_containsObject_(v7, v11, (uint64_t)v10);
  return (char)v4;
}

- (DTXTransport)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DTXTransport;
  v2 = -[DTXTransport init](&v5, sel_init);
  v3 = v2;
  if (v2) {
    sub_188BC50D0(v2);
  }
  return v3;
}

- (DTXTransport)initWithXPCRepresentation:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___DTXTransport;
  objc_super v5 = -[DTXTransport init](&v19, sel_init);
  uint64_t v6 = v5;
  if (v5)
  {
    sub_188BC50D0(v5);
    if (!v4)
    {
      v12 = 0LL;
      goto LABEL_8;
    }

    size_t length = 0LL;
    data = xpc_dictionary_get_data(v4, "__DTXTransport_preflightdata", &length);
    if (data)
    {
      size_t v8 = length;
      if (length)
      {
        uint64_t v9 = data;
        v10 = malloc(length);
        memcpy(v10, v9, v8);
        serializer = (dispatch_queue_s *)v6->_serializer;
        v14[0] = MEMORY[0x1895F87A8];
        v14[1] = 3221225472LL;
        v14[2] = sub_188BC52C4;
        v14[3] = &unk_18A2ED750;
        v15 = v6;
        v16 = v10;
        size_t v17 = length;
        dispatch_async(serializer, v14);
      }
    }
  }

  v12 = v6;
LABEL_8:

  return v12;
}

- (id)serializedXPCRepresentation
{
  return 0LL;
}

- (void)dealloc
{
  if (!self->_resumed) {
    dispatch_resume((dispatch_object_t)self->_serializer);
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DTXTransport;
  -[DTXTransport dealloc](&v3, sel_dealloc);
}

- (DTXTransport)initWithRemoteAddress:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___DTXTransport;
  uint64_t v6 = -[DTXTransport init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    sub_188BC50D0(v6);
    size_t v8 = (void *)objc_opt_class();
    if ((objc_msgSend_recognizesURL_(v8, v9, (uint64_t)v5) & 1) == 0)
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(@"-[%@ %@]: Unrecognized URL: %@", v11, v12, v5);

      v7 = 0LL;
    }
  }

  return v7;
}

- (unint64_t)transmit:(const void *)a3 ofLength:(unint64_t)a4
{
  return 0LL;
}

- (void)received:(const char *)a3 ofLength:(unint64_t)a4 destructor:(id)a5
{
  id v9 = a5;
  if (a4) {
    objc_msgSend_acquireSize_(self->_tracker, v8, a4);
  }
  serializer = self->_serializer;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = sub_188BC54EC;
  v12[3] = &unk_18A2ED778;
  objc_super v14 = a3;
  unint64_t v15 = a4;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  dispatch_async((dispatch_queue_t)serializer, v12);
}

- (void)disconnect
{
  handlerGuard = self->_handlerGuard;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_188BC55F0;
  block[3] = &unk_18A2ED618;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)handlerGuard, block);
  objc_msgSend_received_ofLength_destructor_(self, v4, 0, 0, 0);
  objc_msgSend_setStatus_(self, v5, 3);
}

- (void)serializedDisconnect:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    objc_msgSend_currentHandler(MEMORY[0x1896077D8], v5, v6);
    size_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_( v17,  v18,  (uint64_t)a2,  self,  @"DTXTransport.m",  134,  @"Invalid parameter not satisfying: %@",  @"transportCallback != nil");
  }

  size_t v8 = (void *)MEMORY[0x1895D37B8]();
  objc_msgSend_serializedXPCRepresentation(self, v9, v10);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_disconnect(self, v12, v13);
  serializer = self->_serializer;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_188BC5728;
  block[3] = &unk_18A2ED7A0;
  id v15 = v7;
  id v20 = v11;
  id v21 = v15;
  id v16 = v11;
  dispatch_async((dispatch_queue_t)serializer, block);

  objc_autoreleasePoolPop(v8);
}

- (void)setDataReceivedHandler:(id)a3
{
  id v4 = a3;
  handlerGuard = self->_handlerGuard;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_188BC57B4;
  block[3] = &unk_18A2ED500;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)handlerGuard, block);
}

- (id)dataReceivedHandler
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_188BC5924;
  uint64_t v10 = sub_188BC594C;
  id v11 = 0LL;
  handlerGuard = self->_handlerGuard;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_188BC5954;
  v5[3] = &unk_18A2ED7C8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)handlerGuard, v5);
  objc_super v3 = (void *)MEMORY[0x1895D398C](v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (NSArray)localAddresses
{
  return 0LL;
}

- (id)permittedBlockCompressionTypes
{
  return (id)objc_msgSend_setWithObjects_( MEMORY[0x189604010],  a2,  (uint64_t)&unk_18A2F2E98,  &unk_18A2F2EB0,  &unk_18A2F2EC8,  &unk_18A2F2EE0,  &unk_18A2F2EF8,  &unk_18A2F2F10,  &unk_18A2F2F28,  &unk_18A2F2F40,  0);
}

- (unsigned)supportedDirections
{
  return 3;
}

- (unsigned)status
{
  return self->_status;
}

- (void)setStatus:(unsigned int)a3
{
  self->_status = a3;
}

- (DTXResourceTracker)resourceTracker
{
  return self->_tracker;
}

- (void).cxx_destruct
{
}

@end
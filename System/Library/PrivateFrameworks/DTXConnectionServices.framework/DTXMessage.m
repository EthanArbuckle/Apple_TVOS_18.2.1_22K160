@interface DTXMessage
+ (BOOL)extractSerializedCompressionInfoFromBuffer:(const char *)a3 length:(unint64_t)a4 compressionType:(int *)a5 uncompressedLength:(unint64_t *)a6 compressedDataOffset:(unint64_t *)a7;
+ (NSSet)defaultAllowedSecureCodingClasses;
+ (id)message;
+ (id)messageReferencingBuffer:(const void *)a3 length:(unint64_t)a4 destructor:(id)a5;
+ (id)messageWithBuffer:(const void *)a3 length:(unint64_t)a4;
+ (id)messageWithData:(id)a3;
+ (id)messageWithError:(id)a3;
+ (id)messageWithObject:(id)a3;
+ (id)messageWithPrimitive:(void *)a3;
+ (id)messageWithSelector:(SEL)a3 arguments:(id)a4;
+ (id)messageWithSelector:(SEL)a3 objectArguments:(id)a4;
+ (id)messageWithSelector:(SEL)a3 typesAndArguments:(unsigned int)a4;
+ (void)initialize;
+ (void)setReportCompressionBlock:(id)a3;
- (BOOL)deserialized;
- (BOOL)expectsReply;
- (BOOL)isBarrier;
- (BOOL)isDispatch;
- (BOOL)shouldInvokeWithTarget:(id)a3;
- (DTXMessage)initWithInvocation:(id)a3;
- (DTXMessage)initWithSelector:(SEL)a3 firstArg:(id)a4 remainingObjectArgs:(char *)a5;
- (DTXMessage)initWithSelector:(SEL)a3 objects:(id)a4;
- (DTXMessage)initWithSerializedForm:(const char *)a3 length:(unint64_t)a4 destructor:(id)a5 compressor:(id)a6;
- (DTXMessage)initWithSerializedForm:(id)a3 compressor:(id)a4;
- (NSData)data;
- (NSError)error;
- (NSSecureCoding)object;
- (NSSecureCoding)payloadObject;
- (const)getBufferWithReturnedLength:(unint64_t *)a3;
- (id)_decompressedData:(id)a3 compressor:(id)a4 compressionType:(int)a5;
- (id)_faultAuxiliaryValueOfType:(Class)a3 forKey:(id)a4;
- (id)_initWithReferencedSerializedForm:(id)a3 compressor:(id)a4 payloadSet:(id)a5;
- (id)_mutableAuxiliaryDictionary;
- (id)dataForMessageKey:(id)a3;
- (id)description;
- (id)descriptionWithRoutingInformation:(DTXMessageRoutingInfo)a3;
- (id)newReply;
- (id)newReplyReferencingBuffer:(const void *)a3 length:(unint64_t)a4 destructor:(id)a5;
- (id)newReplyWithError:(id)a3;
- (id)newReplyWithMessage:(id)a3;
- (id)newReplyWithObject:(id)a3;
- (id)objectWithAllowedClasses:(id)a3;
- (id)stringForMessageKey:(id)a3;
- (id)valueForMessageKey:(id)a3;
- (int64_t)integerForMessageKey:(id)a3;
- (unint64_t)cost;
- (unint64_t)serializedLength;
- (unsigned)channelCode;
- (unsigned)conversationIndex;
- (unsigned)errorStatus;
- (unsigned)identifier;
- (unsigned)messageType;
- (void)_appendTypesAndValues:(unsigned int)a3 withKey:(id)a4 list:(char *)a5;
- (void)_makeBarrier;
- (void)_makeImmutable;
- (void)_setPayloadBuffer:(const char *)a3 length:(unint64_t)a4 shouldCopy:(BOOL)a5 destructor:(id)a6;
- (void)_willModifyAuxiliary;
- (void)compressWithCompressor:(id)a3 usingType:(int)a4 forCompatibilityWithVersion:(int64_t)a5;
- (void)dealloc;
- (void)invokeWithTarget:(id)a3 replyChannel:(id)a4 validator:(id)a5;
- (void)serializedFormApply:(id)a3;
- (void)setChannelCode:(unsigned int)a3;
- (void)setConversationIndex:(unsigned int)a3;
- (void)setData:(id)a3 forMessageKey:(id)a4;
- (void)setError:(id)a3;
- (void)setErrorStatus:(unsigned int)a3;
- (void)setExpectsReply:(BOOL)a3;
- (void)setIdentifier:(unsigned int)a3;
- (void)setInteger:(int64_t)a3 forMessageKey:(id)a4;
- (void)setMessageType:(unsigned int)a3;
- (void)setPayloadObject:(id)a3;
- (void)setString:(id)a3 forMessageKey:(id)a4;
@end

@implementation DTXMessage

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = objc_opt_new();
    v3 = (void *)kDTXBarrierMessage;
    kDTXBarrierMessage = v2;

    objc_msgSend_setMessageType_((void *)kDTXBarrierMessage, v4, 5);
    objc_msgSend__makeImmutable((void *)kDTXBarrierMessage, v5, v6);
    uint64_t v7 = objc_opt_new();
    v8 = (void *)kDTXAckBarrierMessage;
    kDTXAckBarrierMessage = v7;

    objc_msgSend_setMessageType_((void *)kDTXAckBarrierMessage, v9, 5);
    objc_msgSend__makeImmutable((void *)kDTXAckBarrierMessage, v10, v11);
    uint64_t v12 = objc_opt_new();
    v13 = (void *)kDTXHeartbeatMessage;
    kDTXHeartbeatMessage = v12;

    objc_msgSend_setMessageType_((void *)kDTXHeartbeatMessage, v14, 5);
    objc_msgSend__makeImmutable((void *)kDTXHeartbeatMessage, v15, v16);
    uint64_t v17 = objc_opt_new();
    v18 = (void *)kDTXInterruptionMessage;
    kDTXInterruptionMessage = v17;

    objc_msgSend_setErrorStatus_((void *)kDTXInterruptionMessage, v19, 2);
    objc_msgSend__makeImmutable((void *)kDTXInterruptionMessage, v20, v21);
    mach_timebase_info((mach_timebase_info_t)&dword_18C4FE7F0);
    v38 = (void *)MEMORY[0x189604010];
    uint64_t v37 = objc_opt_class();
    uint64_t v36 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    uint64_t v27 = objc_opt_class();
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    uint64_t v30 = objc_opt_class();
    uint64_t v31 = objc_opt_class();
    uint64_t v32 = objc_opt_class();
    uint64_t v34 = objc_msgSend_setWithObjects_(v38, v33, v37, v36, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, 0);
    v35 = (void *)qword_18C4FE7E8;
    qword_18C4FE7E8 = v34;
  }

+ (NSSet)defaultAllowedSecureCodingClasses
{
  return (NSSet *)(id)qword_18C4FE7E8;
}

- (NSData)data
{
  if (self->_messageType == 1) {
    return self->_payloadData;
  }
  else {
    return (NSData *)0LL;
  }
}

- (id)description
{
  return sub_188BD2534( self,  self->_identifier | ((unint64_t)self->_conversationIndex << 32),  self->_channelCode | ((unint64_t)self->_expectsReply << 32));
}

- (id)descriptionWithRoutingInformation:(DTXMessageRoutingInfo)a3
{
  return sub_188BD2534(self, *(unint64_t *)&a3.var0, *(uint64_t *)&a3.var2);
}

+ (void)setReportCompressionBlock:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = sub_188BD2AD4;
  v5[3] = &unk_18A2EDA98;
  id v6 = v3;
  id v4 = v3;
  sub_188BD2A54(v5);
}

- (void)compressWithCompressor:(id)a3 usingType:(int)a4 forCompatibilityWithVersion:(int64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v64 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  unsigned int messageType = self->_messageType;
  if (messageType == 1)
  {
    p_payloadData = (void **)&self->_payloadData;
    if (!objc_msgSend_length(self->_payloadData, v8, v9)
      || (unint64_t)objc_msgSend_length(*p_payloadData, v13, v14) >> 32)
    {
      goto LABEL_18;
    }

    if (!v10) {
      sub_188BDA430();
    }
    uint64_t v17 = objc_msgSend_length(*p_payloadData, v15, v16);
    id v18 = objc_alloc(MEMORY[0x189603FB8]);
    uint64_t v22 = (void *)objc_msgSend_initWithLength_(v18, v19, v17 + 4);
    int v61 = 0;
    if (qword_18C740400)
    {
      uint64_t v23 = mach_absolute_time();
      uint64_t v26 = objc_msgSend_bytes(self->_payloadData, v24, v25);
      uint64_t v29 = objc_msgSend_length(self->_payloadData, v27, v28);
      id v30 = v22;
      uint64_t v33 = objc_msgSend_mutableBytes(v30, v31, v32);
      uint64_t v35 = objc_msgSend_compressBuffer_ofLength_toBuffer_ofLength_usingCompressionType_withFinalCompressionType_( v10,  v34,  v26,  v29,  v33 + 4,  v17,  v6,  &v61);
      uint64_t v36 = mach_absolute_time();
      v59[0] = MEMORY[0x1895F87A8];
      v59[1] = 3221225472LL;
      v59[2] = sub_188BD2DD0;
      v59[3] = &unk_18A2EDFF0;
      v59[4] = self;
      v59[5] = v35;
      v59[6] = v36 - v23;
      int v60 = v61;
      sub_188BD2A54(v59);
      if (v35)
      {
LABEL_9:
        int v37 = v61;
        self->_compressionType = v61;
        p_compressionType = &self->_compressionType;
        *(p_compressionType - 1) = 7;
        if (a5 <= 1)
        {
          unsigned int v39 = v37 - 3;
          if (v39 >= 8 || ((0xF3u >> v39) & 1) == 0) {
            sub_188BDA458(p_compressionType, a5);
          }
          int *p_compressionType = dword_188BDC220[v39];
        }

        id v40 = v22;
        v43 = (_DWORD *)objc_msgSend_mutableBytes(v40, v41, v42);
        _DWORD *v43 = objc_msgSend_length(*p_payloadData, v44, v45);
        objc_msgSend_setLength_(v40, v46, v35 + 4);
        objc_storeStrong(p_payloadData, v40);
LABEL_17:

        goto LABEL_18;
      }
    }

    else
    {
      uint64_t v47 = objc_msgSend_bytes(*p_payloadData, v20, v21);
      uint64_t v50 = objc_msgSend_length(*p_payloadData, v48, v49);
      id v51 = v22;
      uint64_t v54 = objc_msgSend_mutableBytes(v51, v52, v53);
      uint64_t v35 = objc_msgSend_compressBuffer_ofLength_toBuffer_ofLength_usingCompressionType_withFinalCompressionType_( v10,  v55,  v47,  v50,  v54 + 4,  v17,  v6,  &v61);
      if (v35) {
        goto LABEL_9;
      }
    }

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      uint64_t v58 = objc_msgSend_length(*p_payloadData, v56, v57);
      *(_DWORD *)buf = 134217984;
      uint64_t v63 = v58;
      _os_log_impl( &dword_188BBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "DTXMessage failed to compress buffer of length %llu",  buf,  0xCu);
    }

    goto LABEL_17;
  }

  if (messageType == 8) {
    objc_msgSend_compressWithCompressor_usingType_forCompatibilityWithVersion_( self->_payloadObject,  v8,  (uint64_t)v10,  v6,  a5);
  }
LABEL_18:
}

+ (id)messageWithObject:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_opt_new();
  objc_msgSend_setPayloadObject_(v4, v5, (uint64_t)v3);

  return v4;
}

+ (id)messageWithError:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_opt_new();
  objc_msgSend_setError_(v4, v5, (uint64_t)v3);

  return v4;
}

+ (id)messageWithPrimitive:(void *)a3
{
  id v4 = (void *)objc_opt_new();
  unsigned int v9 = 0;
  uint64_t Serialized = DTXPrimitiveDictionaryGetSerialized((uint64_t)a3, &v9);
  objc_msgSend__setPayloadBuffer_length_shouldCopy_destructor_(v4, v6, Serialized, v9, 1, 0);
  objc_msgSend_setMessageType_(v4, v7, 6);
  return v4;
}

+ (id)messageWithBuffer:(const void *)a3 length:(unint64_t)a4
{
  uint64_t v6 = (void *)objc_opt_new();
  objc_msgSend__setPayloadBuffer_length_shouldCopy_destructor_(v6, v7, (uint64_t)a3, a4, 1, 0);
  return v6;
}

+ (id)messageReferencingBuffer:(const void *)a3 length:(unint64_t)a4 destructor:(id)a5
{
  uint64_t v7 = (void (**)(void))a5;
  v8 = (void *)objc_opt_new();
  objc_msgSend__setPayloadBuffer_length_shouldCopy_destructor_(v8, v9, (uint64_t)a3, a4, 0, v7);
  if (v7 && !v8[3]) {
    v7[2](v7);
  }

  return v8;
}

+ (id)messageWithData:(id)a3
{
  id v3 = a3;
  uint64_t v6 = objc_opt_new();
  if (v6)
  {
    uint64_t v7 = objc_msgSend_copy(v3, v4, v5);
    v8 = *(void **)(v6 + 24);
    *(void *)(v6 + 24) = v7;

    *(_DWORD *)(v6 + 8) = 1;
    id v9 = (id)v6;
  }

  return (id)v6;
}

+ (id)messageWithSelector:(SEL)a3 typesAndArguments:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (!a3)
  {
    objc_msgSend_currentHandler(MEMORY[0x1896077D8], a2, 0);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_( v16,  v17,  (uint64_t)a2,  a1,  @"DTXMessage.m",  541,  @"Invalid parameter not satisfying: %@",  @"selector");
  }

  uint64_t v7 = (void *)objc_opt_new();
  NSStringFromSelector(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPayloadObject_(v7, v9, (uint64_t)v8);

  objc_msgSend_setMessageType_(v7, v10, 2);
  objc_msgSend__appendTypesAndValues_withKey_list_(v7, v11, v4, 0, &v18);
  objc_msgSend__makeImmutable(v7, v12, v13);
  return v7;
}

+ (id)messageWithSelector:(SEL)a3 objectArguments:(id)a4
{
  id v9 = a4;
  if (!a3)
  {
    objc_msgSend_currentHandler(MEMORY[0x1896077D8], v7, v8);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_( v16,  v17,  (uint64_t)a2,  a1,  @"DTXMessage.m",  554,  @"Invalid parameter not satisfying: %@",  @"selector");
  }

  id v10 = objc_alloc((Class)a1);
  uint64_t v12 = (void *)objc_msgSend_initWithSelector_firstArg_remainingObjectArgs_(v10, v11, (uint64_t)a3, v9, &v18);
  objc_msgSend__makeImmutable(v12, v13, v14);

  return v12;
}

+ (id)messageWithSelector:(SEL)a3 arguments:(id)a4
{
  id v9 = a4;
  if (!a3)
  {
    objc_msgSend_currentHandler(MEMORY[0x1896077D8], v7, v8);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_( v16,  v17,  (uint64_t)a2,  a1,  @"DTXMessage.m",  564,  @"Invalid parameter not satisfying: %@",  @"selector");
  }

  id v10 = objc_alloc((Class)a1);
  uint64_t v12 = (void *)objc_msgSend_initWithSelector_objects_(v10, v11, (uint64_t)a3, v9);
  objc_msgSend__makeImmutable(v12, v13, v14);

  return v12;
}

+ (id)message
{
  return (id)objc_opt_new();
}

- (id)newReply
{
  id v3 = (void *)objc_opt_new();
  uint64_t v6 = objc_msgSend_channelCode(self, v4, v5);
  objc_msgSend_setChannelCode_(v3, v7, v6);
  uint64_t v10 = objc_msgSend_identifier(self, v8, v9);
  objc_msgSend_setIdentifier_(v3, v11, v10);
  int v14 = objc_msgSend_conversationIndex(self, v12, v13);
  objc_msgSend_setConversationIndex_(v3, v15, (v14 + 1));
  return v3;
}

- (id)newReplyWithObject:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend_channelCode(self, v5, v6);
  objc_msgSend_setChannelCode_(v4, v8, v7);
  uint64_t v11 = objc_msgSend_identifier(self, v9, v10);
  objc_msgSend_setIdentifier_(v4, v12, v11);
  int v15 = objc_msgSend_conversationIndex(self, v13, v14);
  objc_msgSend_setConversationIndex_(v4, v16, (v15 + 1));
  return v4;
}

- (id)newReplyWithError:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend_channelCode(self, v5, v6);
  objc_msgSend_setChannelCode_(v4, v8, v7);
  uint64_t v11 = objc_msgSend_identifier(self, v9, v10);
  objc_msgSend_setIdentifier_(v4, v12, v11);
  int v15 = objc_msgSend_conversationIndex(self, v13, v14);
  objc_msgSend_setConversationIndex_(v4, v16, (v15 + 1));
  return v4;
}

- (id)newReplyWithMessage:(id)a3
{
  id v5 = a3;
  int v8 = objc_msgSend_errorStatus(v5, v6, v7);
  if (v8 == 3)
  {
    uint64_t v11 = objc_msgSend_errorStatus(v5, v9, v10);
    uint64_t v18 = @"peer unable to respond";
  }

  else
  {
    if (v8 != 2)
    {
      uint64_t v21 = objc_msgSend_message(DTXMessage, v9, v10);
      objc_storeStrong((id *)(v21 + 48), a3);
      *(void *)(v21 + 32) = objc_msgSend_cost(v5, v24, v25);
      objc_msgSend_setMessageType_((void *)v21, v26, 8);
      uint64_t v29 = objc_msgSend_errorStatus(v5, v27, v28);
      objc_msgSend_setErrorStatus_((void *)v21, v30, v29);
      goto LABEL_7;
    }

    uint64_t v11 = objc_msgSend_errorStatus(v5, v9, v10);
    uint64_t v18 = @"interruption encountered and re-routed";
  }

  sub_188BD3540(v11, v18, v12, v13, v14, v15, v16, v17, v44);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = objc_msgSend_messageWithError_(DTXMessage, v20, (uint64_t)v19);

LABEL_7:
  uint64_t v31 = objc_msgSend_channelCode(self, v22, v23);
  objc_msgSend_setChannelCode_((void *)v21, v32, v31);
  uint64_t v35 = objc_msgSend_identifier(self, v33, v34);
  objc_msgSend_setIdentifier_((void *)v21, v36, v35);
  int v39 = objc_msgSend_conversationIndex(self, v37, v38);
  objc_msgSend_setConversationIndex_((void *)v21, v40, (v39 + 1));
  objc_msgSend__makeImmutable((void *)v21, v41, v42);

  return (id)v21;
}

- (id)newReplyReferencingBuffer:(const void *)a3 length:(unint64_t)a4 destructor:(id)a5
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_msgSend_channelCode(self, v7, v8);
  objc_msgSend_setChannelCode_(v6, v10, v9);
  uint64_t v13 = objc_msgSend_identifier(self, v11, v12);
  objc_msgSend_setIdentifier_(v6, v14, v13);
  int v17 = objc_msgSend_conversationIndex(self, v15, v16);
  objc_msgSend_setConversationIndex_(v6, v18, (v17 + 1));
  return v6;
}

- (DTXMessage)initWithSelector:(SEL)a3 firstArg:(id)a4 remainingObjectArgs:(char *)a5
{
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___DTXMessage;
  uint64_t v21 = a5;
  uint64_t v9 = -[DTXMessage init](&v20, sel_init);
  if (v9)
  {
    NSStringFromSelector(a3);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPayloadObject_(v9, v11, (uint64_t)v10);

    v9->_unsigned int messageType = 2;
    if (v8)
    {
      objc_msgSend__willModifyAuxiliary(v9, v12, v13);
      uint64_t v14 = MEMORY[0x1895F87A8];
      do
      {
        v18[0] = v14;
        v18[1] = 3221225472LL;
        v18[2] = sub_188BD38FC;
        v18[3] = &unk_18A2EE018;
        v19 = v9;
        sub_188BD37D8(v8, v18);
        uint64_t v15 = (id *)v21;
        v21 += 8;
        id v16 = *v15;

        id v8 = v16;
      }

      while (v16);
    }
  }

  return v9;
}

- (DTXMessage)initWithSelector:(SEL)a3 objects:(id)a4
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___DTXMessage;
  uint64_t v7 = -[DTXMessage init](&v30, sel_init);
  if (v7)
  {
    NSStringFromSelector(a3);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPayloadObject_(v7, v9, (uint64_t)v8);

    v7->_unsigned int messageType = 2;
    if (objc_msgSend_count(v6, v10, v11))
    {
      objc_msgSend__willModifyAuxiliary(v7, v12, v13);
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      id v14 = v6;
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v26, v31, 16);
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v27;
        uint64_t v19 = MEMORY[0x1895F87A8];
        do
        {
          uint64_t v20 = 0LL;
          do
          {
            if (*(void *)v27 != v18) {
              objc_enumerationMutation(v14);
            }
            uint64_t v21 = *(void **)(*((void *)&v26 + 1) + 8 * v20);
            v24[0] = v19;
            v24[1] = 3221225472LL;
            v24[2] = sub_188BD3ACC;
            v24[3] = &unk_18A2EE018;
            uint64_t v25 = v7;
            sub_188BD37D8(v21, v24);

            ++v20;
          }

          while (v17 != v20);
          uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v22, (uint64_t)&v26, v31, 16);
        }

        while (v17);
      }
    }
  }

  return v7;
}

- (DTXMessage)initWithInvocation:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)&OBJC_CLASS___DTXMessage;
  uint64_t v7 = -[DTXMessage init](&v42, sel_init);
  if (v7)
  {
    id v8 = (const char *)objc_msgSend_selector(v4, v5, v6);
    NSStringFromSelector(v8);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPayloadObject_(v7, v10, (uint64_t)v9);

    v7->_unsigned int messageType = 2;
    objc_msgSend_methodSignature(v4, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v16 = objc_msgSend_numberOfArguments(v13, v14, v15);
    if (v16 >= 3)
    {
      unint64_t v19 = v16;
      objc_msgSend__willModifyAuxiliary(v7, v17, v18);
      uint64_t v20 = *MEMORY[0x189603A60];
      for (uint64_t i = 2LL; i != v19; ++i)
      {
        id v22 = v13;
        ArgumentTypeAtIndex = (_BYTE *)objc_msgSend_getArgumentTypeAtIndex_(v22, v23, i);
        if (*ArgumentTypeAtIndex == 64)
        {
          v41 = 0LL;
          objc_msgSend_getArgument_atIndex_(v4, v25, (uint64_t)&v41, i);
          if (v41)
          {
            char v28 = objc_msgSend_conformsToProtocol_(v41, v27, (uint64_t)&unk_18C741878);
            __int128 v29 = v41;
            if ((v28 & 1) == 0)
            {
              objc_super v30 = (void *)MEMORY[0x189603F70];
              uint64_t v31 = objc_opt_class();
              objc_msgSend_raise_format_( v30,  v32,  v20,  @"Arguments for proxied messages must conform to NSSecureCoding. %@ does not.",  v31);
              __int128 v29 = v41;
            }
          }

          else
          {
            __int128 v29 = 0LL;
          }

          v39[0] = MEMORY[0x1895F87A8];
          v39[1] = 3221225472LL;
          v39[2] = sub_188BD3CE0;
          v39[3] = &unk_18A2EE018;
          id v40 = v7;
          sub_188BD37D8(v29, v39);
        }

        else
        {
          uint64_t v33 = ArgumentTypeAtIndex;
          uint64_t v34 = (void *)MEMORY[0x189603F70];
          uint64_t v35 = (const char *)objc_msgSend_selector(v4, v25, v26);
          NSStringFromSelector(v35);
          uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_raise_format_( v34,  v37,  v20,  @"Invalid argument type %s at index %lu of selector %@",  v33,  i,  v36);
        }
      }
    }
  }

  return v7;
}

- (void)dealloc
{
  auxiliary = self->_auxiliary;
  if (auxiliary && !self->_deserialized)
  {
    DTXPrimitiveDictionaryDestroy(auxiliary);
    self->_auxiliary = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DTXMessage;
  -[DTXMessage dealloc](&v4, sel_dealloc);
}

- (void)_setPayloadBuffer:(const char *)a3 length:(unint64_t)a4 shouldCopy:(BOOL)a5 destructor:(id)a6
{
  BOOL v6 = a5;
  id v11 = a6;
  if (a3 && a4)
  {
    if (v6)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x189603F48], v10, (uint64_t)a3, a4);
      uint64_t v12 = (NSData *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      if (v11)
      {
        id v13 = objc_alloc(MEMORY[0x189603F48]);
        v18[0] = MEMORY[0x1895F87A8];
        v18[1] = 3221225472LL;
        v18[2] = sub_188BD3E58;
        v18[3] = &unk_18A2EE040;
        unint64_t v19 = (NSData *)v11;
        uint64_t v15 = (NSData *)objc_msgSend_initWithBytesNoCopy_length_deallocator_(v13, v14, (uint64_t)a3, a4, v18);
        payloadData = self->_payloadData;
        self->_payloadData = v15;

        uint64_t v17 = v19;
LABEL_9:

        goto LABEL_10;
      }

      objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x189603F48], v10, (uint64_t)a3, a4, 0);
      uint64_t v12 = (NSData *)objc_claimAutoreleasedReturnValue();
    }

    uint64_t v17 = self->_payloadData;
    self->_payloadData = v12;
    goto LABEL_9;
  }

- (void)setPayloadObject:(id)a3
{
  BOOL v6 = (NSSecureCoding *)a3;
  unsigned __int8 v7 = atomic_load((unsigned __int8 *)&self->_immutable);
  if ((v7 & 1) != 0)
  {
    id v8 = (void *)MEMORY[0x189603F70];
    uint64_t v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    Name = sel_getName(a2);
    objc_msgSend_raise_format_( v8,  v12,  (uint64_t)@"DTXMessageException",  @"-[%@ %s] Unable to modify immutable message: %@",  v10,  Name,  self);
  }

  if (self->_payloadObject != v6)
  {
    objc_storeStrong((id *)&self->_payloadObject, a3);
    payloadObject = self->_payloadObject;
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = sub_188BD3F54;
    v14[3] = &unk_18A2EE018;
    v14[4] = self;
    sub_188BD37D8(payloadObject, v14);
  }
}

- (NSSecureCoding)payloadObject
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_188BD3FD8(self, v4);

  return self->_payloadObject;
}

- (id)objectWithAllowedClasses:(id)a3
{
  id v4 = a3;
  sub_188BD3FD8(self, v4);
  id v5 = self->_payloadObject;
  id v6 = v4;
  for (Class i = object_getClass(v5); ; Class i = class_getSuperclass(v9))
  {
    uint64_t v9 = i;
    if (!i) {
      break;
    }
    if (objc_msgSend_containsObject_(v6, v8, (uint64_t)i))
    {
      uint64_t v9 = v5;
      break;
    }
  }

  return v9;
}

- (NSSecureCoding)object
{
  id v6 = 0LL;
  switch(objc_msgSend_messageType(self, a2, v2))
  {
    case 1u:
    case 3u:
    case 6u:
      objc_msgSend_defaultAllowedSecureCodingClasses(DTXMessage, v4, v5);
      unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectWithAllowedClasses_(self, v8, (uint64_t)v7);
      id v6 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 8u:
      objc_msgSend_object(self->_payloadObject, v4, v5);
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return (NSSecureCoding *)v6;
  }

  return (NSSecureCoding *)v6;
}

- (const)getBufferWithReturnedLength:(unint64_t *)a3
{
  if (self->_messageType != 1) {
    return 0LL;
  }
  if (a3) {
    *a3 = objc_msgSend_length(self->_payloadData, a2, (uint64_t)a3);
  }
  return (const void *)objc_msgSend_bytes(self->_payloadData, a2, (uint64_t)a3);
}

- (void)_makeImmutable
{
  if (qword_18C4FE7F8 != -1) {
    dispatch_once(&qword_18C4FE7F8, &unk_18A2EE060);
  }
  p_immutable = &self->_immutable;
  do
  {
    if (__ldxr((unsigned __int8 *)p_immutable))
    {
      __clrex();
      return;
    }
  }

  while (__stxr(1u, (unsigned __int8 *)p_immutable));
  if (self->_auxiliaryPromoted)
  {
    if (!self->_auxiliary)
    {
      DTXPrimitiveDictionaryCreate();
      self->_auxiliary = v5;
    }

    id v6 = (void *)MEMORY[0x1895D37B8]();
    auxiliaryPromoted = self->_auxiliaryPromoted;
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = sub_188BD45A8;
    v10[3] = &unk_18A2EE148;
    v10[4] = self;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(auxiliaryPromoted, v8, (uint64_t)v10);
    uint64_t v9 = self->_auxiliaryPromoted;
    self->_auxiliaryPromoted = 0LL;

    objc_autoreleasePoolPop(v6);
  }

- (void)_makeBarrier
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_immutable);
  if ((v3 & 1) != 0)
  {
    uint64_t v5 = (void *)MEMORY[0x189603F70];
    id v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue();
    Name = sel_getName(a2);
    objc_msgSend_raise_format_( v5,  v9,  (uint64_t)@"DTXMessageException",  @"-[%@ %s] Unable to modify immutable message: %@",  v7,  Name,  self);
  }

  self->_unsigned int messageType = 5;
}

- (void)setErrorStatus:(unsigned int)a3
{
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_immutable);
  if ((v5 & 1) != 0)
  {
    unsigned __int8 v7 = (void *)MEMORY[0x189603F70];
    id v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    Name = sel_getName(a2);
    objc_msgSend_raise_format_( v7,  v11,  (uint64_t)@"DTXMessageException",  @"-[%@ %s] Unable to modify immutable message: %@",  v9,  Name,  self);
  }

  self->_status = a3;
}

- (void)_willModifyAuxiliary
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_immutable);
  if ((v3 & 1) != 0)
  {
    unsigned __int8 v5 = (void *)MEMORY[0x189603F70];
    id v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue();
    Name = sel_getName(a2);
    objc_msgSend_raise_format_( v5,  v9,  (uint64_t)@"DTXMessageException",  @"-[%@ %s] Unable to modify immutable message: %@",  v7,  Name,  self);
  }

  if (!self->_auxiliary)
  {
    DTXPrimitiveDictionaryCreate();
    self->_auxiliary = v10;
  }

- (void)_appendTypesAndValues:(unsigned int)a3 withKey:(id)a4 list:(char *)a5
{
  uint64_t v6 = *(void *)&a3;
  id v9 = a4;
  uint64_t v33 = a5;
  objc_msgSend__willModifyAuxiliary(self, v10, v11);
  uint64_t v12 = MEMORY[0x1895F87A8];
  while ((int)v6 > 5)
  {
    if ((_DWORD)v6 == 6)
    {
      id v22 = v33;
      v33 += 8;
      uint64_t v23 = *(void *)v22;
      id v24 = v9;
      __int128 v27 = (char *)objc_msgSend_UTF8String(v24, v25, v26);
      DTXPrimitiveDictionaryAddPrimitivePair((unint64_t *)&self->_auxiliary, v27, 6, v23);
LABEL_10:
      if (v9) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }

    if ((_DWORD)v6 != 11) {
      goto LABEL_13;
    }
    id v13 = (void **)v33;
    v33 += 8;
    id v14 = *v13;
    v31[0] = v12;
    v31[1] = 3221225472LL;
    v31[2] = sub_188BD49BC;
    v31[3] = &unk_18A2EE170;
    v31[4] = self;
    id v32 = v9;
    id v15 = v14;
    sub_188BD37D8(v15, v31);

    if (v9) {
      goto LABEL_15;
    }
LABEL_14:
    objc_super v30 = v33;
    v33 += 8;
    uint64_t v6 = *(unsigned int *)v30;
  }

  if ((_DWORD)v6 == 3)
  {
    unint64_t v16 = v33;
    v33 += 8;
    uint64_t v17 = *(unsigned int *)v16;
    id v18 = v9;
    uint64_t v21 = (char *)objc_msgSend_UTF8String(v18, v19, v20);
    DTXPrimitiveDictionaryAddPrimitivePair((unint64_t *)&self->_auxiliary, v21, 3, v17);
    goto LABEL_10;
  }

  if (!(_DWORD)v6) {
    goto LABEL_15;
  }
LABEL_13:
  uint64_t v28 = objc_opt_class();
  NSStringFromSelector(a2);
  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(@"-[%@ %@]: unknown parameter type (%d)", v28, v29, v6);

  if (!v9) {
    goto LABEL_14;
  }
LABEL_15:
}

- (id)_mutableAuxiliaryDictionary
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_immutable);
  if ((v3 & 1) != 0)
  {
    unsigned __int8 v5 = (void *)MEMORY[0x189603F70];
    uint64_t v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue();
    Name = sel_getName(a2);
    objc_msgSend_raise_format_( v5,  v9,  (uint64_t)@"DTXMessageException",  @"-[%@ %s] Unable to modify immutable message: %@",  v7,  Name,  self);
  }

  auxiliaryPromoted = self->_auxiliaryPromoted;
  if (!auxiliaryPromoted)
  {
    uint64_t v11 = (NSDictionary *)objc_opt_new();
    uint64_t v12 = self->_auxiliaryPromoted;
    self->_auxiliaryPromoted = v11;

    auxiliaryPromoted = self->_auxiliaryPromoted;
  }

  return auxiliaryPromoted;
}

- (void)setString:(id)a3 forMessageKey:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v11)
  {
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend__mutableAuxiliaryDictionary(self, v7, v8);
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v9, v10, (uint64_t)v11, v6);
      }
    }
  }
}

- (void)setInteger:(int64_t)a3 forMessageKey:(id)a4
{
  if (a4)
  {
    id v6 = (void *)MEMORY[0x189607968];
    id v7 = a4;
    objc_msgSend_numberWithLongLong_(v6, v8, a3);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend__mutableAuxiliaryDictionary(self, v9, v10);
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v11, v12, (uint64_t)v13, v7);
  }

- (void)setData:(id)a3 forMessageKey:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v11)
  {
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend__mutableAuxiliaryDictionary(self, v7, v8);
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v9, v10, (uint64_t)v11, v6);
      }
    }
  }
}

- (id)_faultAuxiliaryValueOfType:(Class)a3 forKey:(id)a4
{
  id v7 = a4;
  if (v7)
  {
    if (self->_messageType == 8)
    {
      objc_msgSend__faultAuxiliaryValueOfType_forKey_(self->_payloadObject, v6, (uint64_t)a3, v7);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      auxiliaryPromoted = self->_auxiliaryPromoted;
      if (!auxiliaryPromoted)
      {
        uint64_t v10 = (NSDictionary *)CFDictionaryCreateWithDTXPrimitiveDictionary((uint64_t)self->_auxiliary);
        id v11 = self->_auxiliaryPromoted;
        self->_auxiliaryPromoted = v10;

        auxiliaryPromoted = self->_auxiliaryPromoted;
      }

      objc_msgSend_objectForKeyedSubscript_(auxiliaryPromoted, v6, (uint64_t)v7);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (a3 && (objc_opt_isKindOfClass() & 1) == 0) {
        id v13 = 0LL;
      }
      else {
        id v13 = v12;
      }
      id v8 = v13;
    }
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (int64_t)integerForMessageKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  objc_msgSend__faultAuxiliaryValueOfType_forKey_(self, v6, v5, v4);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  int64_t v10 = objc_msgSend_longLongValue(v7, v8, v9);
  return v10;
}

- (id)stringForMessageKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  objc_msgSend__faultAuxiliaryValueOfType_forKey_(self, v6, v5, v4);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)dataForMessageKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  objc_msgSend__faultAuxiliaryValueOfType_forKey_(self, v6, v5, v4);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)valueForMessageKey:(id)a3
{
  return (id)objc_msgSend__faultAuxiliaryValueOfType_forKey_(self, a2, 0, a3);
}

- (NSError)error
{
  v12[1] = *MEMORY[0x1895F89C0];
  unsigned int messageType = self->_messageType;
  if (messageType == 4)
  {
    objc_msgSend_payloadObject(self, a2, v2);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        id v7 = v5;
      }

      else
      {
        id v8 = (void *)MEMORY[0x189607870];
        uint64_t v11 = *MEMORY[0x1896075E0];
        v12[0] = v5;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v6, (uint64_t)v12, &v11, 1);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v8, v10, (uint64_t)@"DTXConnection", 1, v9);
        id v7 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

    else
    {
      id v7 = 0LL;
    }

    return (NSError *)v7;
  }

  else if (messageType == 8)
  {
    objc_msgSend_error(self->_payloadObject, a2, v2);
    return (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    return (NSError *)0LL;
  }

- (void)setError:(id)a3
{
  self->_unsigned int messageType = 4;
  self->_status = 1;
}

- (BOOL)isDispatch
{
  unsigned int messageType = self->_messageType;
  if (messageType == 8) {
    return objc_msgSend_isDispatch(self->_payloadObject, a2, v2);
  }
  else {
    return messageType == 2;
  }
}

- (BOOL)isBarrier
{
  unsigned int messageType = self->_messageType;
  if (messageType == 8) {
    return objc_msgSend_isBarrier(self->_payloadObject, a2, v2);
  }
  else {
    return messageType == 5;
  }
}

- (unsigned)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(unsigned int)a3
{
  self->_unsigned int messageType = a3;
}

- (BOOL)shouldInvokeWithTarget:(id)a3
{
  id v4 = a3;
  int isDispatch = objc_msgSend_isDispatch(self, v5, v6);
  char v10 = 0;
  if (v4 && isDispatch)
  {
    objc_msgSend_payloadObject(self, v8, v9);
    uint64_t v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    SEL v12 = NSSelectorFromString(v11);

    objc_msgSend_methodSignatureForSelector_(v4, v13, (uint64_t)v12);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14) {
      char v10 = sub_188BD5078((uint64_t)v12, v4);
    }
    else {
      char v10 = 0;
    }
  }

  return v10;
}

- (void)invokeWithTarget:(id)a3 replyChannel:(id)a4 validator:(id)a5
{
  uint64_t v83 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  char v10 = (void (**)(id, void *))a5;
  objc_msgSend_payloadObject(self, v13, v14);
  id v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  SEL v16 = NSSelectorFromString(v15);

  objc_msgSend_methodSignatureForSelector_(v8, v17, (uint64_t)v16);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    id v22 = (void *)MEMORY[0x189603F70];
    objc_msgSend_payloadObject(self, v18, v21);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_( v22,  v24,  (uint64_t)@"DTXMessageInvocationException",  @"Unable to invoke -[%@ %@] - the selector is not allowed",  v8,  v23);
  }

  else
  {
    uint64_t v25 = (void *)MEMORY[0x189603F70];
    objc_msgSend_payloadObject(self, v18, v19);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_( v25,  v26,  (uint64_t)@"DTXMessageInvocationException",  @"Unable to invoke -[%@ %@] - it does not respond to the selector",  v8,  v23);
  }

LABEL_8:
  objc_msgSend_invocationWithMethodSignature_(MEMORY[0x189603F88], v18, (uint64_t)v20);
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSelector_(v27, v28, (uint64_t)v16);
  objc_msgSend_setTarget_(v27, v29, (uint64_t)v8);
  objc_msgSend_defaultAllowedSecureCodingClasses(DTXMessage, v30, v31);
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    uint64_t v35 = v10[2](v10, v27);

    uint64_t v34 = (void *)v35;
  }

  uint64_t v79 = 0LL;
  v80 = &v79;
  uint64_t v81 = 0x2020000000LL;
  uint64_t v82 = 0LL;
  uint64_t v75 = 0LL;
  v76 = &v75;
  uint64_t v77 = 0x2020000000LL;
  uint64_t v78 = objc_msgSend_numberOfArguments(v20, v32, v33) - 2;
  uint64_t v36 = (void *)objc_opt_new();
  uint64_t v71 = 0LL;
  v72 = &v71;
  uint64_t v73 = 0x2020000000LL;
  uint64_t v74 = 0LL;
  auxiliary = self->_auxiliary;
  v65[0] = MEMORY[0x1895F87A8];
  v65[1] = 3221225472LL;
  v65[2] = sub_188BD5804;
  v65[3] = &unk_18A2EE198;
  v68 = &v79;
  v69 = &v75;
  v70 = &v71;
  id v38 = v27;
  id v66 = v38;
  id v39 = v36;
  id v67 = v39;
  sub_188BD5764((uint64_t)auxiliary, v34, v65);
  if (v80[3] < (unint64_t)v76[3])
  {
    objc_super v42 = (void *)MEMORY[0x189603F70];
    objc_msgSend_payloadObject(self, v40, v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_( v42,  v44,  (uint64_t)@"DTXMessageInvocationException",  @"Unable to invoke [(%@ *)%lu provided %@]",  v8,  v43,  v80[3],  v76[3]);
  }

  objc_msgSend_invoke(v38, v40, v41);
  uint64_t v47 = (const __CFArray *)v72[3];
  if (v47)
  {
    v84.length = CFArrayGetCount((CFArrayRef)v72[3]);
    v84.location = 0LL;
    CFArrayApplyFunction(v47, v84, (CFArrayApplierFunction)j__free, 0LL);
    CFRelease((CFTypeRef)v72[3]);
  }

  id v64 = 0LL;
  if ((unint64_t)objc_msgSend_methodReturnLength(v20, v45, v46) < 8)
  {
    id v51 = 0LL;
  }

  else
  {
    objc_msgSend_getReturnValue_(v38, v48, (uint64_t)&v64);
    id v50 = v64;
    id v51 = v50;
    if (v50)
    {
      if ((objc_msgSend_conformsToProtocol_(v50, v48, (uint64_t)&unk_18C741878) & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          int v60 = (void *)MEMORY[0x189603F70];
          objc_msgSend_payloadObject(self, v48, v49);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_raise_format_( v60,  v53,  (uint64_t)@"DTXMessageInvocationException",  @"Unable to invoke -[%@ %@] - 'id' return value does not conform to NSSecureCoding",  v8,  v52);
        }
      }
    }
  }

  if (objc_msgSend_expectsReply(self, v48, v49))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v56 = v51;
      v61[0] = MEMORY[0x1895F87A8];
      v61[1] = 3221225472LL;
      v61[2] = sub_188BD59B0;
      v61[3] = &unk_18A2EE1C0;
      id v62 = v9;
      uint64_t v63 = self;
      objc_msgSend_handleCompletion_(v56, v57, (uint64_t)v61);
    }

    else
    {
      if (v51) {
        uint64_t v58 = objc_msgSend_newReplyWithObject_(self, v54, (uint64_t)v51);
      }
      else {
        uint64_t v58 = objc_msgSend_newReply(self, v54, v55);
      }
      id v56 = (id)v58;
      objc_msgSend_sendControlAsync_replyHandler_(v9, v59, v58, 0);
    }
  }

  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(&v79, 8);

LABEL_29:
}

+ (BOOL)extractSerializedCompressionInfoFromBuffer:(const char *)a3 length:(unint64_t)a4 compressionType:(int *)a5 uncompressedLength:(unint64_t *)a6 compressedDataOffset:(unint64_t *)a7
{
  BOOL result = 0;
  if (a3 && a4 >= 0x14 && a5 && a6 && a7)
  {
    if (*(_DWORD *)a3 == 7
      && (unint64_t v8 = *((void *)a3 + 1) - *((unsigned int *)a3 + 1), *a5 = (*(_DWORD *)a3 >> 8) & 0xF, v8 >= 4))
    {
      id v9 = &a3[*((unsigned int *)a3 + 1)];
      *a6 = *((unsigned int *)v9 + 4);
      *a7 = v9 + 16 - a3 + 4;
      return 1;
    }

    else
    {
      return 0;
    }
  }

  return result;
}

- (id)_decompressedData:(id)a3 compressor:(id)a4 compressionType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  v44[1] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (!v8) {
    sub_188BDA4FC();
  }
  uint64_t v11 = v8;
  if ((unint64_t)objc_msgSend_length(v7, v9, v10) <= 3)
  {
    uint64_t v28 = objc_alloc(&OBJC_CLASS___DTXDecompressionException);
    v43 = @"compressionType";
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v29, v5);
    objc_super v30 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v30;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v31, (uint64_t)v44, &v43, 1);
    id v32 = (void *)objc_claimAutoreleasedReturnValue();
    id v34 = (id)objc_msgSend_initWithName_reason_userInfo_( v28,  v33,  (uint64_t)@"DTXDecompressionException",  @"payload too small to contain block compression header",  v32);
    goto LABEL_8;
  }

  id v12 = v7;
  id v15 = (unsigned int *)objc_msgSend_bytes(v12, v13, v14);
  id v16 = objc_alloc(MEMORY[0x189603FB8]);
  id v18 = (void *)objc_msgSend_initWithLength_(v16, v17, *v15);
  uint64_t v21 = objc_msgSend_length(v12, v19, v20) - 4;
  id v22 = v18;
  uint64_t v25 = objc_msgSend_mutableBytes(v22, v23, v24);
  if ((objc_msgSend_uncompressBuffer_ofLength_toBuffer_withKnownUncompressedLength_usingCompressionType_( v11,  v26,  (uint64_t)(v15 + 1),  v21,  v25,  *v15,  v5) & 1) == 0)
  {
    uint64_t v35 = objc_alloc(&OBJC_CLASS___DTXDecompressionException);
    v41[0] = @"compressionType";
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v36, v5);
    objc_super v30 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = @"uncompressedSize";
    v42[0] = v30;
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x189607968], v37, *v15);
    id v32 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v32;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v38, (uint64_t)v42, v41, 2);
    id v39 = (void *)objc_claimAutoreleasedReturnValue();
    id v34 = (id)objc_msgSend_initWithName_reason_userInfo_( v35,  v40,  (uint64_t)@"DTXDecompressionException",  @"block decompressor failed",  v39);

LABEL_8:
    objc_exception_throw(v34);
  }

  return v22;
}

- (id)_initWithReferencedSerializedForm:(id)a3 compressor:(id)a4 payloadSet:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, uint64_t, void))a5;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___DTXMessage;
  uint64_t v11 = -[DTXMessage init](&v28, sel_init);
  if (v11)
  {
    id v12 = v8;
    id v15 = (unsigned __int8 *)objc_msgSend_bytes(v12, v13, v14);
    v11->_deserialized = 1;
    v11->_cost = objc_msgSend_length(v12, v16, v17);
    uint64_t v18 = *((unsigned int *)v15 + 1);
    uint64_t v19 = *((void *)v15 + 1) - v18;
    v10[2](v10, (uint64_t)&v15[v18 + 16], v19);
    v11->_auxiliary = (void *)DTXPrimitiveDictionaryReferencingSerialized(v15 + 16, *((unsigned int *)v15 + 1));
    unsigned int v22 = *v15;
    v11->_unsigned int messageType = v22;
    v11->_status = v22 == 4;
    if (v22 == 7)
    {
      objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_( MEMORY[0x189603F48],  v20,  (uint64_t)&v15[*((unsigned int *)v15 + 1) + 16],  v19,  0);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v25 = objc_msgSend__decompressedData_compressor_compressionType_( v11,  v24,  (uint64_t)v23,  v9,  (*(_DWORD *)v15 >> 12) & 0xF0 | (*(_DWORD *)v15 >> 8) & 0xFu);
      payloadData = v11->_payloadData;
      v11->_payloadData = (NSData *)v25;

      if (!v11->_payloadData)
      {

        uint64_t v11 = 0LL;
        goto LABEL_7;
      }

      v11->_unsigned int messageType = 1;
    }

    objc_msgSend__makeImmutable(v11, v20, v21);
  }

- (DTXMessage)initWithSerializedForm:(id)a3 compressor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  serializedData = self->_serializedData;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = sub_188BD5EE4;
  v13[3] = &unk_18A2EE1E8;
  uint64_t v14 = self;
  uint64_t v11 = (DTXMessage *)objc_msgSend__initWithReferencedSerializedForm_compressor_payloadSet_( v14,  v10,  (uint64_t)serializedData,  v8,  v13);

  return v11;
}

- (DTXMessage)initWithSerializedForm:(const char *)a3 length:(unint64_t)a4 destructor:(id)a5 compressor:(id)a6
{
  id v10 = a5;
  uint64_t v11 = (objc_class *)MEMORY[0x189603F48];
  id v12 = a6;
  id v13 = objc_alloc(v11);
  uint64_t v14 = MEMORY[0x1895F87A8];
  v25[0] = MEMORY[0x1895F87A8];
  v25[1] = 3221225472LL;
  v25[2] = sub_188BD602C;
  v25[3] = &unk_18A2EE040;
  id v26 = v10;
  id v15 = v10;
  uint64_t v17 = (NSData *)objc_msgSend_initWithBytesNoCopy_length_deallocator_(v13, v16, (uint64_t)a3, a4, v25);
  v23[0] = v14;
  v23[1] = 3221225472LL;
  v23[2] = sub_188BD6040;
  v23[3] = &unk_18A2EE1E8;
  uint64_t v24 = self;
  uint64_t v19 = (DTXMessage *)objc_msgSend__initWithReferencedSerializedForm_compressor_payloadSet_( v24,  v18,  (uint64_t)v17,  v12,  v23);

  serializedData = v19->_serializedData;
  v19->_serializedData = v17;
  uint64_t v21 = v17;

  return v19;
}

- (void)serializedFormApply:(id)a3
{
  uint64_t v5 = (void (**)(id, _DWORD *, uint64_t))a3;
  if (v5)
  {
    if (self->_messageType == 8)
    {
      objc_msgSend_serializedFormApply_(self->_payloadObject, v4, (uint64_t)v5);
    }

    else
    {
      unsigned int v21 = 0;
      uint64_t Serialized = DTXPrimitiveDictionaryGetSerialized((uint64_t)self->_auxiliary, &v21);
      uint64_t v7 = v21;
      uint64_t v10 = objc_msgSend_length(self->_payloadData, v8, v9);
      unsigned int messageType = self->_messageType;
      if (messageType == 7) {
        unsigned int messageType = (self->_compressionType << 12) & 0xF0000 | ((self->_compressionType & 0xF) << 8) | 7;
      }
      v19[0] = messageType;
      v19[1] = v21;
      uint64_t v20 = v10 + v7;
      v5[2](v5, v19, 16LL);
      uint64_t v13 = v21;
      if (v21) {
        ((void (*)(void (**)(id, _DWORD *, uint64_t), uint64_t))v5[2])(v5, Serialized);
      }
      payloadData = self->_payloadData;
      if (payloadData)
      {
        uint64_t v15 = objc_msgSend_bytes(payloadData, v12, v13);
        uint64_t v18 = objc_msgSend_length(self->_payloadData, v16, v17);
        ((void (**)(id, uint64_t, uint64_t))v5)[2](v5, v15, v18);
      }
    }
  }
}

- (unint64_t)serializedLength
{
  if (self->_messageType == 8) {
    return objc_msgSend_serializedLength(self->_payloadObject, a2, v2);
  }
  unsigned int v8 = 0;
  DTXPrimitiveDictionaryGetSerialized((uint64_t)self->_auxiliary, &v8);
  uint64_t v5 = v8;
  return v5 + objc_msgSend_length(self->_payloadData, v6, v7) + 16;
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unsigned int)a3
{
  self->_identifier = a3;
}

- (unsigned)channelCode
{
  return self->_channelCode;
}

- (void)setChannelCode:(unsigned int)a3
{
  self->_channelCode = a3;
}

- (BOOL)expectsReply
{
  return self->_expectsReply;
}

- (void)setExpectsReply:(BOOL)a3
{
  self->_expectsReply = a3;
}

- (unsigned)conversationIndex
{
  return self->_conversationIndex;
}

- (void)setConversationIndex:(unsigned int)a3
{
  self->_conversationIndex = a3;
}

- (BOOL)deserialized
{
  return self->_deserialized;
}

- (unsigned)errorStatus
{
  return self->_status;
}

- (unint64_t)cost
{
  return self->_cost;
}

- (void).cxx_destruct
{
}

@end
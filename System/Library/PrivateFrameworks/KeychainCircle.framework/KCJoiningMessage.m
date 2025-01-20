@interface KCJoiningMessage
+ (id)encodeToDERType:(int)a3 data:(id)a4 payload:(id)a5 error:(id *)a6;
+ (id)messageWithDER:(id)a3 error:(id *)a4;
+ (id)messageWithType:(int)a3 data:(id)a4 error:(id *)a5;
+ (id)messageWithType:(int)a3 data:(id)a4 payload:(id)a5 error:(id *)a6;
+ (id)messageWithType:(int)a3 data:(id)a4 secondData:(id)a5 error:(id *)a6;
+ (unint64_t)encodedSizeType:(int)a3 data:(id)a4 payload:(id)a5 error:(id *)a6;
- (BOOL)inflatePartsOfEncoding:(id *)a3;
- (KCJoiningMessage)initWithDER:(id)a3 error:(id *)a4;
- (KCJoiningMessage)initWithType:(int)a3 data:(id)a4 payload:(id)a5 error:(id *)a6;
- (NSData)der;
- (NSData)firstData;
- (NSData)secondData;
- (int)type;
@end

@implementation KCJoiningMessage

- (BOOL)inflatePartsOfEncoding:(id *)a3
{
  id v5 = -[KCJoiningMessage der](self, "der");
  uint64_t v6 = [v5 bytes];
  v7 = -[KCJoiningMessage der](self, "der");
  unint64_t v8 = v6 + [v7 length];

  uint64_t v31 = 0LL;
  if (!ccder_decode_constructed_tl())
  {
    v14 = @"Not sequence";
    goto LABEL_5;
  }

  if (v31 != v8)
  {
    v14 = @"Extra data at end of message";
LABEL_5:
    KCJoiningErrorCreate(1LL, a3, v14, v9, v10, v11, v12, v13, (uint64_t)v29);
    return 0;
  }

  v30[1] = (id)0xAAAAAAAAAAAAAAAALL;
  uint64_t v16 = ccder_decode_uint64();
  self->_type = 255;
  v30[0] = 0LL;
  unint64_t v17 = kcder_decode_data_internal(v30, 0, a3, v16, v8);
  id v18 = v30[0];
  id v19 = v30[0];
  if (v17 == v8)
  {
    v21 = 0LL;
    unint64_t v20 = v8;
  }

  else
  {
    id v29 = 0LL;
    unint64_t v20 = kcder_decode_data_internal(&v29, 0, a3, v17, v8);
    v21 = (NSData *)v29;
  }

  objc_storeStrong((id *)&self->_firstData, v18);
  secondData = self->_secondData;
  self->_secondData = v21;

  BOOL v15 = v20 == v8;
  if (v20 != v8) {
    KCJoiningErrorCreate(1LL, a3, @"Extra in sequence", v23, v24, v25, v26, v27, (uint64_t)v29);
  }

  return v15;
}

- (KCJoiningMessage)initWithDER:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___KCJoiningMessage;
  v7 = -[KCJoiningMessage init](&v13, sel_init);
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x189603F48] dataWithData:v6];
    der = v7->_der;
    v7->_der = (NSData *)v8;
  }

  if (-[KCJoiningMessage inflatePartsOfEncoding:](v7, "inflatePartsOfEncoding:", a4)) {
    uint64_t v10 = v7;
  }
  else {
    uint64_t v10 = 0LL;
  }
  uint64_t v11 = v10;

  return v11;
}

- (KCJoiningMessage)initWithType:(int)a3 data:(id)a4 payload:(id)a5 error:(id *)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___KCJoiningMessage;
  uint64_t v12 = -[KCJoiningMessage init](&v18, sel_init);
  if (v12
    && (+[KCJoiningMessage encodeToDERType:data:payload:error:]( &OBJC_CLASS___KCJoiningMessage,  "encodeToDERType:data:payload:error:",  v8,  v10,  v11,  a6),  uint64_t v13 = objc_claimAutoreleasedReturnValue(),  der = v12->_der,  v12->_der = (NSData *)v13,  der,  !v12->_der))
  {
    uint64_t v16 = 0LL;
  }

  else
  {
    if (-[KCJoiningMessage inflatePartsOfEncoding:](v12, "inflatePartsOfEncoding:", a6)) {
      BOOL v15 = v12;
    }
    else {
      BOOL v15 = 0LL;
    }
    uint64_t v16 = v15;
  }

  return v16;
}

- (int)type
{
  return self->_type;
}

- (NSData)firstData
{
  return (NSData *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSData)secondData
{
  return (NSData *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSData)der
{
  return (NSData *)objc_getProperty(self, a2, 32LL, 1);
}

- (void).cxx_destruct
{
}

+ (id)messageWithDER:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = -[KCJoiningMessage initWithDER:error:](objc_alloc(&OBJC_CLASS___KCJoiningMessage), "initWithDER:error:", v4, 0LL);

  return v5;
}

+ (id)messageWithType:(int)a3 data:(id)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a4;
  uint64_t v8 = -[KCJoiningMessage initWithType:data:payload:error:]( objc_alloc(&OBJC_CLASS___KCJoiningMessage),  "initWithType:data:payload:error:",  v6,  v7,  0LL,  a5);

  return v8;
}

+ (id)messageWithType:(int)a3 data:(id)a4 secondData:(id)a5 error:(id *)a6
{
  uint64_t v8 = *(void *)&a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = -[KCJoiningMessage initWithType:data:payload:error:]( objc_alloc(&OBJC_CLASS___KCJoiningMessage),  "initWithType:data:payload:error:",  v8,  v10,  v9,  a6);

  return v11;
}

+ (id)messageWithType:(int)a3 data:(id)a4 payload:(id)a5 error:(id *)a6
{
  uint64_t v8 = *(void *)&a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = -[KCJoiningMessage initWithType:data:payload:error:]( objc_alloc(&OBJC_CLASS___KCJoiningMessage),  "initWithType:data:payload:error:",  v8,  v10,  v9,  a6);

  return v11;
}

+ (unint64_t)encodedSizeType:(int)a3 data:(id)a4 payload:(id)a5 error:(id *)a6
{
  id v7 = a5;
  ccder_sizeof_uint64();
  [a4 length];
  if (ccder_sizeof_raw_octet_string())
  {
    if (v7)
    {
      [v7 length];
      ccder_sizeof_raw_octet_string();
    }

    unint64_t v8 = ccder_sizeof();
  }

  else
  {
    unint64_t v8 = 0LL;
  }

  return v8;
}

+ (id)encodeToDERType:(int)a3 data:(id)a4 payload:(id)a5 error:(id *)a6
{
  uint64_t v8 = *(void *)&a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = +[KCJoiningMessage encodedSizeType:data:payload:error:]( &OBJC_CLASS___KCJoiningMessage,  "encodedSizeType:data:payload:error:",  v8,  v9,  v10,  a6);
  if (v11)
  {
    id v12 = [MEMORY[0x189603FB8] dataWithLength:v11];
    uint64_t v13 = [v12 mutableBytes];
    [v12 length];
    if (v10) {
      kcder_encode_data(v10);
    }
    kcder_encode_data(v9);
    ccder_encode_uint64();
    uint64_t v14 = ccder_encode_constructed_tl();
    if (v14)
    {
      if (v14 == v13)
      {
        id v20 = v12;
        goto LABEL_10;
      }

      KCJoiningErrorCreate(3LL, a6, @"Size didn't match encoding", v15, v16, v17, v18, v19, v22);
    }

    id v20 = 0LL;
LABEL_10:

    goto LABEL_11;
  }

  id v20 = 0LL;
LABEL_11:

  return v20;
}

@end
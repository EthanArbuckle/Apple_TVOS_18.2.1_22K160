@interface APNSPackEncoder
- (APNSPackEncoder)initWithMaxTableSize:(unint64_t)a3;
- (APNSPackEncoderDelegate)delegate;
- (BOOL)hasError;
- (id)copyMessage;
- (id)errorMessage;
- (id)keyTable;
- (id)metrics;
- (id)valueTable;
- (int)errorCode;
- (unint64_t)maxTableSize;
- (void)addBinaryPropertyListWithAttributeId:(unsigned __int8)a3 data:(id)a4 isIndexable:(BOOL)a5;
- (void)addBooleanWithAttributeId:(unsigned __int8)a3 value:(BOOL)a4;
- (void)addDataWithAttributeId:(unsigned __int8)a3 data:(id)a4 isIndexable:(BOOL)a5;
- (void)addInt16WithAttributeId:(unsigned __int8)a3 number:(unsigned __int16)a4 isIndexable:(BOOL)a5;
- (void)addInt32WithAttributeId:(unsigned __int8)a3 number:(unsigned int)a4 isIndexable:(BOOL)a5;
- (void)addInt64WithAttributeId:(unsigned __int8)a3 number:(unint64_t)a4 isIndexable:(BOOL)a5;
- (void)addInt8WithAttributeId:(unsigned __int8)a3 number:(unsigned __int8)a4 isIndexable:(BOOL)a5;
- (void)addStringWithAttributId:(unsigned __int8)a3 string:(id)a4 isIndexable:(BOOL)a5;
- (void)builder;
- (void)dealloc;
- (void)encoder;
- (void)reset;
- (void)setBuilder:(void *)a3;
- (void)setCommand:(unsigned __int8)a3;
- (void)setDelegate:(id)a3;
- (void)setEncoder:(void *)a3;
- (void)setMaxTableSize:(unint64_t)a3;
@end

@implementation APNSPackEncoder

- (APNSPackEncoder)initWithMaxTableSize:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___APNSPackEncoder;
  v4 = -[APNSPackEncoder init](&v10, "init");
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      v4->_maxTableSize = a3;
      v6 = operator new(0x210uLL);
      sub_10001684C((uint64_t)v6, a3, 0x20000LL, 0xFFFFLL);
    }

    else
    {
      v4->_maxTableSize = 4096LL;
      v6 = operator new(0x210uLL);
      sub_10001684C((uint64_t)v6, 4096LL, 0x20000LL, 0xFFFFLL);
    }

    v5->_encoder = v6;
    sub_100012960(v11, "sT");
    sub_100012960(v12, "tP");
    sub_100012960(v13, "ua");
    sub_100012960(v14, "t");
    sub_100012960(v15, "sP");
    sub_100012960(v16, "E");
    sub_100012960(v17, "H");
    sub_100012960(v18, "cT");
    sub_100012960(v19, "sI");
    sub_1000632A8((uint64_t)v9, (unsigned __int8 *)v11, 9LL);
    sub_100016850((uint64_t)v9);
    sub_100019230((uint64_t)v9);
    for (uint64_t i = 0LL; i != -27; i -= 3LL)
    {
      if (SHIBYTE(v19[i + 2]) < 0) {
        operator delete((void *)v19[i]);
      }
    }
  }

  return v5;
}

- (void)dealloc
{
  encoder = (void **)self->_encoder;
  if (encoder)
  {
    sub_100014390((uint64_t)(encoder + 28));
    v4 = sub_100014390((uint64_t)encoder);
    operator delete(v4);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___APNSPackEncoder;
  -[APNSPackEncoder dealloc](&v5, "dealloc");
}

- (void)setCommand:(unsigned __int8)a3
{
  objc_super v5 = operator new(0x30uLL);
  sub_100018558((uint64_t)v5, (uint64_t)self->_encoder);
  self->_builder = v5;
  sub_100018574((uint64_t)v5, a3);
}

- (void)addDataWithAttributeId:(unsigned __int8)a3 data:(id)a4 isIndexable:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  sub_10001884C( (uint64_t)self->_builder,  a3,  (char *)[v8 bytes],  (unint64_t)objc_msgSend(v8, "length"),  v5);
}

- (void)addStringWithAttributId:(unsigned __int8)a3 string:(id)a4 isIndexable:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  sub_100012960(__p, (char *)[v8 UTF8String]);
  sub_100018910((uint64_t)self->_builder, a3, (uint64_t)__p, v5);
  if (v10 < 0) {
    operator delete(__p[0]);
  }
}

- (void)addInt8WithAttributeId:(unsigned __int8)a3 number:(unsigned __int8)a4 isIndexable:(BOOL)a5
{
}

- (void)addInt16WithAttributeId:(unsigned __int8)a3 number:(unsigned __int16)a4 isIndexable:(BOOL)a5
{
}

- (void)addInt32WithAttributeId:(unsigned __int8)a3 number:(unsigned int)a4 isIndexable:(BOOL)a5
{
}

- (void)addInt64WithAttributeId:(unsigned __int8)a3 number:(unint64_t)a4 isIndexable:(BOOL)a5
{
}

- (void)addBooleanWithAttributeId:(unsigned __int8)a3 value:(BOOL)a4
{
}

- (void)addBinaryPropertyListWithAttributeId:(unsigned __int8)a3 data:(id)a4 isIndexable:(BOOL)a5
{
  id v7 = a4;
  sub_100018D90( (unint64_t *)self->_builder,  a3,  (const UInt8 *)[v7 bytes],  (unint64_t)objc_msgSend(v7, "length"));
}

- (id)copyMessage
{
  __p = 0LL;
  v13 = 0LL;
  uint64_t v14 = 0LL;
  if (sub_100018F34((uint64_t)self->_builder, (uint64_t)&__p))
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
    v4 = (char *)__p;
    if (v13 != __p)
    {
      unint64_t v5 = 0LL;
      do
      {
        -[NSMutableData appendBytes:length:](v3, "appendBytes:length:", &v4[v5++], 1LL);
        v4 = (char *)__p;
      }

      while (v13 - (_BYTE *)__p > v5);
    }

    builder = self->_builder;
    if (builder)
    {
      id v7 = (void *)builder[2];
      if (v7)
      {
        builder[3] = v7;
        operator delete(v7);
      }

      operator delete(builder);
    }

    self->_builder = 0LL;
  }

  else
  {
    id v8 = self->_builder;
    if (v8)
    {
      v9 = (void *)v8[2];
      if (v9)
      {
        v8[3] = v9;
        operator delete(v9);
      }

      operator delete(v8);
    }

    self->_builder = 0LL;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "APNSPackEncoder:receivedError:", self, -[APNSPackEncoder errorCode](self, "errorCode"));

    v3 = 0LL;
  }

  if (__p)
  {
    v13 = __p;
    operator delete(__p);
  }

  return v3;
}

- (BOOL)hasError
{
  return sub_100016A88((uint64_t)self->_encoder);
}

- (int)errorCode
{
  return sub_100016A98((uint64_t)self->_encoder);
}

- (id)errorMessage
{
  uint64_t v2 = sub_100016A54((uint64_t)self->_encoder);
  else {
    uint64_t v3 = *(void *)v2;
  }
  return +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v3);
}

- (id)keyTable
{
  uint64_t v2 = nullsub_2(self->_encoder, a2);
  return sub_100062358(v2);
}

- (id)valueTable
{
  uint64_t v2 = sub_100016AA0((uint64_t)self->_encoder);
  return sub_1000624C4(v2);
}

- (id)metrics
{
  return -[APNSPackMetrics initWithEncoder:](objc_alloc(&OBJC_CLASS___APNSPackMetrics), "initWithEncoder:", self);
}

- (void)reset
{
}

- (void)encoder
{
  return self->_encoder;
}

- (void)setEncoder:(void *)a3
{
  self->_encoder = a3;
}

- (void)builder
{
  return self->_builder;
}

- (void)setBuilder:(void *)a3
{
  self->_builder = a3;
}

- (APNSPackEncoderDelegate)delegate
{
  return (APNSPackEncoderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)maxTableSize
{
  return self->_maxTableSize;
}

- (void)setMaxTableSize:(unint64_t)a3
{
  self->_maxTableSize = a3;
}

- (void).cxx_destruct
{
}

@end
@interface APNSPackDecoder
- (APNSPackDecoder)initWithMaxTableSize:(unint64_t)a3;
- (APNSPackDecoderDelegate)delegate;
- (BOOL)decodeMessage:(id)a3 parser:(id)a4 parameters:(id *)a5 isInvalid:(BOOL *)a6 lengthParsed:(unint64_t *)a7;
- (BOOL)hasError;
- (id)errorMessage;
- (id)keyTable;
- (id)metrics;
- (id)valueTable;
- (int)errorCode;
- (void)dealloc;
- (void)decoder;
- (void)reset;
- (void)setDecoder:(void *)a3;
- (void)setDelegate:(id)a3;
@end

@implementation APNSPackDecoder

- (APNSPackDecoder)initWithMaxTableSize:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___APNSPackDecoder;
  v4 = -[APNSPackDecoder init](&v7, "init");
  if (v4)
  {
    v5 = operator new(0xE0uLL);
    if (a3) {
      sub_10000F800((uint64_t)v5, a3, 0x20000LL, 0xFFFFLL);
    }
    else {
      sub_10000F800((uint64_t)v5, 4096LL, 0x20000LL, 0xFFFFLL);
    }
    v4->_decoder = v5;
  }

  return v4;
}

- (void)dealloc
{
  decoder = (void **)self->_decoder;
  if (decoder)
  {
    sub_10000DEB0((uint64_t)(decoder + 9));
    v4 = sub_10000DEB0((uint64_t)decoder);
    operator delete(v4);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___APNSPackDecoder;
  -[APNSPackDecoder dealloc](&v5, "dealloc");
}

- (BOOL)decodeMessage:(id)a3 parser:(id)a4 parameters:(id *)a5 isInvalid:(BOOL *)a6 lengthParsed:(unint64_t *)a7
{
  id v12 = a3;
  id v13 = a4;
  if (![v12 length]) {
    goto LABEL_13;
  }
  id v14 = v12;
  v15 = (unsigned __int8 *)[v14 bytes];
  v16 = v15 + 1;
  if (!sub_10000F804( (uint64_t)self->_decoder,  (uint64_t)(v15 + 1),  (uint64_t)[v14 length] - 1,  &v27,  &v26))
  {
LABEL_10:
    *a6 = 1;
    if (-[APNSPackDecoder hasError](self, "hasError"))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend( WeakRetained,  "APNSPackDecoder:ReceivedError:",  self,  -[APNSPackDecoder errorCode](self, "errorCode"));
      BOOL v22 = 0;
      goto LABEL_12;
    }

- (BOOL)hasError
{
  return sub_10000F92C((uint64_t)self->_decoder);
}

- (int)errorCode
{
  return sub_100011C74((uint64_t)self->_decoder);
}

- (id)errorMessage
{
  uint64_t v2 = sub_100011C6C((uint64_t)self->_decoder);
  else {
    uint64_t v3 = *(void *)v2;
  }
  return +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v3);
}

- (id)keyTable
{
  uint64_t v2 = nullsub_2(self->_decoder, a2);
  return sub_100062B20(v2);
}

- (id)valueTable
{
  uint64_t v2 = sub_100011D30((uint64_t)self->_decoder);
  return sub_100062C8C(v2);
}

- (id)metrics
{
  return -[APNSPackMetrics initWithDecoder:](objc_alloc(&OBJC_CLASS___APNSPackMetrics), "initWithDecoder:", self);
}

- (void)reset
{
}

- (void)decoder
{
  return self->_decoder;
}

- (void)setDecoder:(void *)a3
{
  self->_decoder = a3;
}

- (APNSPackDecoderDelegate)delegate
{
  return (APNSPackDecoderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface HashDigest
+ (id)_stringRepresentationForDigest:(char *)a3 length:(unsigned int)a4;
- (HashDigest)initWithDigestType:(int64_t)a3;
- (id)finalAndCompute;
- (void)dealloc;
- (void)updateWithBuffer:(const char *)a3 length:(unint64_t)a4;
- (void)updateWithData:(id)a3;
@end

@implementation HashDigest

- (HashDigest)initWithDigestType:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___HashDigest;
  v4 = -[HashDigest init](&v10, "init");
  v5 = v4;
  if (v4)
  {
    v4->_digestType = a3;
    switch(a3)
    {
      case 2LL:
        v7 = (CC_SHA256_CTX *)calloc(1uLL, 0x68uLL);
        v5->_context = v7;
        CC_SHA256_Init(v7);
        break;
      case 1LL:
        v8 = (CC_SHA1_CTX *)calloc(1uLL, 0x60uLL);
        v5->_context = v8;
        CC_SHA1_Init(v8);
        break;
      case 0LL:
        v6 = (CC_MD5_CTX *)calloc(1uLL, 0x5CuLL);
        v5->_context = v6;
        CC_MD5_Init(v6);
        break;
    }
  }

  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___HashDigest;
  -[HashDigest dealloc](&v3, "dealloc");
}

- (id)finalAndCompute
{
  int64_t digestType = self->_digestType;
  switch(digestType)
  {
    case 2LL:
      __int128 v5 = 0u;
      __int128 v6 = 0u;
      CC_SHA256_Final((unsigned __int8 *)&v5, (CC_SHA256_CTX *)self->_context);
      uint64_t v3 = 32LL;
      goto LABEL_7;
    case 1LL:
      __int128 v5 = 0uLL;
      LODWORD(v6) = 0;
      CC_SHA1_Final((unsigned __int8 *)&v5, (CC_SHA1_CTX *)self->_context);
      uint64_t v3 = 20LL;
      goto LABEL_7;
    case 0LL:
      __int128 v5 = 0uLL;
      CC_MD5_Final((unsigned __int8 *)&v5, (CC_MD5_CTX *)self->_context);
      uint64_t v3 = 16LL;
LABEL_7:
      a2 = (SEL)objc_claimAutoreleasedReturnValue( +[HashDigest _stringRepresentationForDigest:length:]( &OBJC_CLASS___HashDigest,  "_stringRepresentationForDigest:length:",  &v5,  v3));
      break;
  }

  return (id)(id)a2;
}

- (void)updateWithBuffer:(const char *)a3 length:(unint64_t)a4
{
  int64_t digestType = self->_digestType;
  switch(digestType)
  {
    case 2LL:
      CC_SHA256_Update((CC_SHA256_CTX *)self->_context, a3, a4);
      break;
    case 1LL:
      CC_SHA1_Update((CC_SHA1_CTX *)self->_context, a3, a4);
      break;
    case 0LL:
      CC_MD5_Update((CC_MD5_CTX *)self->_context, a3, a4);
      break;
  }

- (void)updateWithData:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100077A9C;
  v4[3] = &unk_1002EA048;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  objc_msgSend(v3, "lib_enumerateSubdataWithOffset:length:usingBlock:", 0, 0xFFFFFFFFLL, v4);
}

+ (id)_stringRepresentationForDigest:(char *)a3 length:(unsigned int)a4
{
  __int128 v6 = -[NSMutableString initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableString), "initWithCapacity:", 2 * a4);
  if (a4)
  {
    uint64_t v7 = a4;
    do
    {
      unsigned int v8 = *a3++;
      -[NSMutableString appendFormat:](v6, "appendFormat:", @"%02x", v8);
      --v7;
    }

    while (v7);
  }

  id v9 = -[NSMutableString copy](v6, "copy");

  return v9;
}

@end
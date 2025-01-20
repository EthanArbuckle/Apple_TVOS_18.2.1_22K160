@interface SigX
+ (basic_string<char,)getVersion;
- (BOOL)flowFloatSamples:(const float *)a3 sampleCount:(int)a4 error:(id *)a5;
- (BOOL)flowFloatSamples:(float *)a3 sampleCount:(int)a4 channels:(int)a5 error:(id *)a6;
- (BOOL)flowIntSamples:(const signed __int16 *)a3 sampleCount:(int)a4 error:(id *)a5;
- (BOOL)flowIntSamples:(signed __int16 *)a3 sampleCount:(int)a4 channels:(int)a5 error:(id *)a6;
- (BOOL)getSignature:(void *)a3 error:(id *)a4;
- (BOOL)getSignature:(void *)a3 signatureOptions:(int)a4 error:(id *)a5;
- (BOOL)resetWithError:(id *)a3;
- (SigX)initWithSignatureType:(int)a3 sampleRate:(unsigned int)a4 error:(id *)a5;
- (SigX)initWithSignatureType:(int)a3 sampleRate:(unsigned int)a4 signatureOptions:(int)a5 error:(id *)a6;
- (id)ConvertGenericException:(const exception *)a3;
- (id)ConvertSigException:(const SigException *)a3;
- (id)ConvertSigxException:(const SigxException *)a3;
- (id)FillUnknownError;
- (void)dealloc;
@end

@implementation SigX

- (id)ConvertSigxException:(const SigxException *)a3
{
  v4 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  (*((uint64_t (**)(const SigxException *, SEL))a3->var0 + 2))(a3, a2),  +[NSString defaultCStringEncoding](&OBJC_CLASS___NSString, "defaultCStringEncoding"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t var0 = a3->var2.var0;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v5,  NSLocalizedDescriptionKey));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.shazam.sigx",  var0,  v7));

  return v8;
}

- (id)ConvertSigException:(const SigException *)a3
{
  v4 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  (*((uint64_t (**)(const SigException *, SEL))a3->var0 + 2))(a3, a2),  +[NSString defaultCStringEncoding](&OBJC_CLASS___NSString, "defaultCStringEncoding"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t var0 = a3->var2.var0;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v5,  NSLocalizedDescriptionKey));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.shazam.sigvalidation",  var0,  v7));

  return v8;
}

- (id)ConvertGenericException:(const exception *)a3
{
  v3 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  (*((uint64_t (**)(const exception *, SEL))a3->var0 + 2))(a3, a2),  +[NSString defaultCStringEncoding](&OBJC_CLASS___NSString, "defaultCStringEncoding"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v4,  NSLocalizedDescriptionKey));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.shazam.sigx",  -100LL,  v5));

  return v6;
}

- (id)FillUnknownError
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  @"Something unexpected happened.",  NSLocalizedDescriptionKey));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.shazam.sigx",  -200LL,  v2));

  return v3;
}

- (SigX)initWithSignatureType:(int)a3 sampleRate:(unsigned int)a4 signatureOptions:(int)a5 error:(id *)a6
{
  v46.receiver = self;
  v46.super_class = (Class)&OBJC_CLASS___SigX;
  v9 = -[SigX init](&v46, "init");
  if (!v9) {
    return v9;
  }
  v10 = (char **)operator new(8uLL);
  *v10 = 0LL;
  if ((a3 - 1) >= 3)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "Invalid signature type.");
    goto LABEL_94;
  }

  if (a5 >= 6)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "Invalid sig options.");
    goto LABEL_94;
  }

  if ((int)a4 > 44099)
  {
    if (a4 == 44100) {
      goto LABEL_10;
    }
    int v11 = 48000;
  }

  else
  {
    if (a4 == 16000) {
      goto LABEL_10;
    }
    int v11 = 32000;
  }

  if (a4 != v11)
  {
    fprintf(__stderrp, "Error: unsupported sample rate %d!\n", a4);
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "Invalid input sample rate.");
LABEL_94:
  }

- (SigX)initWithSignatureType:(int)a3 sampleRate:(unsigned int)a4 error:(id *)a5
{
  return -[SigX initWithSignatureType:sampleRate:signatureOptions:error:]( self,  "initWithSignatureType:sampleRate:signatureOptions:error:",  *(void *)&a3,  *(void *)&a4,  0LL,  a5);
}

- (BOOL)flowIntSamples:(const signed __int16 *)a3 sampleCount:(int)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)flowFloatSamples:(const float *)a3 sampleCount:(int)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)flowIntSamples:(signed __int16 *)a3 sampleCount:(int)a4 channels:(int)a5 error:(id *)a6
{
  mySigX = self->mySigX;
  if (a5 >= 2 && a4)
  {
    uint64_t v7 = 0LL;
    float v8 = 1.0 / (float)(unint64_t)a5;
    v9 = a3 + 1;
    do
    {
      int v10 = (int)(float)(v8 * (float)a3[v7 * a5]);
      a3[v7] = v10;
      int v11 = v9;
      uint64_t v12 = a5 - 1LL;
      do
      {
        int v13 = *v11++;
        int v10 = (int)(float)((float)(__int16)v10 + (float)((float)v13 * v8));
        a3[v7] = v10;
        --v12;
      }

      while (v12);
      ++v7;
      v9 += a5;
    }

    while (v7 != a4);
  }

  (*(void (**)(void, signed __int16 *, void))(*(void *)*mySigX + 16LL))(*mySigX, a3, *(void *)&a4);
  return 1;
}

- (BOOL)flowFloatSamples:(float *)a3 sampleCount:(int)a4 channels:(int)a5 error:(id *)a6
{
  mySigX = self->mySigX;
  if (a5 >= 2 && a4)
  {
    uint64_t v7 = 0LL;
    float v8 = 1.0 / (float)(unint64_t)a5;
    v9 = a3 + 1;
    do
    {
      float v10 = v8 * a3[v7 * a5];
      a3[v7] = v10;
      int v11 = v9;
      uint64_t v12 = a5 - 1LL;
      do
      {
        float v13 = *v11++;
        float v10 = v10 + (float)(v13 * v8);
        a3[v7] = v10;
        --v12;
      }

      while (v12);
      ++v7;
      v9 += a5;
    }

    while (v7 != a4);
  }

  (*(void (**)(void, float *, void))(*(void *)*mySigX + 24LL))(*mySigX, a3, *(void *)&a4);
  return 1;
}

- (BOOL)resetWithError:(id *)a3
{
  return 1;
}

- (BOOL)getSignature:(void *)a3 signatureOptions:(int)a4 error:(id *)a5
{
  mySigX = self->mySigX;
  *((void *)a3 + 1) = *(void *)a3;
  (*(void (**)(void, void *, void))(*(void *)*mySigX + 32LL))(*mySigX, a3, *(void *)&a4);
  sub_100008998((uint64_t)&v49, *(int **)a3, *((void *)a3 + 1) - *(void *)a3);
  uint64_t v7 = v53;
  float v8 = v54;
  if (v53 != v54)
  {
    uint64_t v9 = 0LL;
    unint64_t v10 = 0LL;
    int v11 = v53;
    while (1)
    {
      uint64_t v12 = *(unsigned int **)v11;
      uint64_t v13 = *((void *)v11 + 1);
      uint64_t v14 = v13 - *(void *)v11;
      if (v13 != *(void *)v11)
      {
        unint64_t v15 = *(unsigned int *)(v13 - 8);
        if (v10 <= v15) {
          unint64_t v10 = v15;
        }
      }

- (BOOL)getSignature:(void *)a3 error:(id *)a4
{
  return -[SigX getSignature:signatureOptions:error:]( self,  "getSignature:signatureOptions:error:",  a3,  0xFFFFFFFFLL,  a4);
}

- (void)dealloc
{
  mySigX = (uint64_t *)self->mySigX;
  if (mySigX)
  {
    uint64_t v4 = *mySigX;
    uint64_t *mySigX = 0LL;
    if (v4) {
      (*(void (**)(uint64_t, SEL))(*(void *)v4 + 8LL))(v4, a2);
    }
    operator delete(mySigX);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SigX;
  -[SigX dealloc](&v5, "dealloc");
}

+ (basic_string<char,)getVersion
{
  result = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)std::string::append( &v3,  " (compilation mode 'debug', built on 'OS X')");
  retstr->var0.uint64_t var0 = result->var0.var0;
  result->var0.var0.var0.var1.var1 = 0LL;
  *((void *)&result->var0.var0.var0.var1 + 2) = 0LL;
  result->var0.var0.var0.var1.uint64_t var0 = 0LL;
  return result;
}

@end
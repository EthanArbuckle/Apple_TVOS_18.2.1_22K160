@interface TPHashBuilder
+ (id)hashWithAlgo:(int64_t)a3 ofBytes:(const void *)a4 len:(unint64_t)a5;
+ (id)hashWithAlgo:(int64_t)a3 ofData:(id)a4;
+ (id)keyedHashWithAlgo:(int64_t)a3 key:(id)a4 data:(id)a5;
+ (int64_t)algoOfHash:(id)a3;
- ($1DC23E134A5F43A06C89BE309303CDCF)ctxHMAC;
- (BOOL)keyed;
- (CC_SHA256state_st)ctxSHA256;
- (CC_SHA512state_st)ctxSHA512;
- (TPHashBuilder)init;
- (TPHashBuilder)initWithAlgo:(int64_t)a3;
- (TPHashBuilder)initWithKeyedAlgo:(int64_t)a3 key:(id)a4;
- (id)finalHash;
- (id)finalKeyedHash;
- (int64_t)algo;
- (void)resetWithAlgo:(int64_t)a3;
- (void)setAlgo:(int64_t)a3;
- (void)setCtxHMAC:(id *)a3;
- (void)setCtxSHA256:(CC_SHA256state_st *)a3;
- (void)setCtxSHA512:(CC_SHA512state_st *)a3;
- (void)setKeyed:(BOOL)a3;
- (void)throwInvalidAlgo;
- (void)updateWithBytes:(const void *)a3 len:(unint64_t)a4;
- (void)updateWithData:(id)a3;
@end

@implementation TPHashBuilder

- (TPHashBuilder)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TPHashBuilder;
  result = -[TPHashBuilder init](&v3, sel_init);
  if (result)
  {
    result->_algo = -1LL;
    result->_keyed = 0;
  }

  return result;
}

- (TPHashBuilder)initWithAlgo:(int64_t)a3
{
  v4 = -[TPHashBuilder init](self, "init");
  -[TPHashBuilder resetWithAlgo:](v4, "resetWithAlgo:", a3);
  return v4;
}

- (TPHashBuilder)initWithKeyedAlgo:(int64_t)a3 key:(id)a4
{
  id v6 = a4;
  v7 = -[TPHashBuilder init](self, "init");
  v8 = v7;
  v7->_algo = a3;
  if (a3 == 4)
  {
    id v9 = v6;
    CCHmacInit((CCHmacContext *)&v8->_ctxHMAC, 2u, (const void *)[v9 bytes], objc_msgSend(v9, "length"));
    v8->_keyed = 1;
  }

  else
  {
    -[TPHashBuilder throwInvalidAlgo](v7, "throwInvalidAlgo");
  }

  return v8;
}

- (void)resetWithAlgo:(int64_t)a3
{
  self->_algo = a3;
  switch(a3)
  {
    case 0LL:
      CC_SHA224_Init(&self->_ctxSHA256);
      goto LABEL_7;
    case 1LL:
      CC_SHA256_Init(&self->_ctxSHA256);
      goto LABEL_7;
    case 2LL:
      CC_SHA384_Init(&self->_ctxSHA512);
      goto LABEL_7;
    case 3LL:
      CC_SHA512_Init(&self->_ctxSHA512);
LABEL_7:
      self->_keyed = 0;
      break;
    default:
      -[TPHashBuilder throwInvalidAlgo](self, "throwInvalidAlgo");
      break;
  }

- (void)updateWithData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 bytes];
  uint64_t v6 = [v4 length];

  -[TPHashBuilder updateWithBytes:len:](self, "updateWithBytes:len:", v5, v6);
}

- (void)updateWithBytes:(const void *)a3 len:(unint64_t)a4
{
  CC_LONG v4 = a4;
  switch(-[TPHashBuilder algo](self, "algo"))
  {
    case 0LL:
      CC_SHA224_Update(&self->_ctxSHA256, a3, v4);
      break;
    case 1LL:
      CC_SHA256_Update(&self->_ctxSHA256, a3, v4);
      break;
    case 2LL:
      CC_SHA384_Update(&self->_ctxSHA512, a3, v4);
      break;
    case 3LL:
      CC_SHA512_Update(&self->_ctxSHA512, a3, v4);
      break;
    case 4LL:
      CCHmacUpdate((CCHmacContext *)&self->_ctxHMAC, a3, v4);
      break;
    default:
      -[TPHashBuilder throwInvalidAlgo](self, "throwInvalidAlgo");
      break;
  }

- (id)finalHash
{
  id v3 = objc_alloc(MEMORY[0x189603FB8]);
  switch(-[TPHashBuilder algo](self, "algo"))
  {
    case 0LL:
      id v3 = [v3 initWithLength:28];
      CC_SHA224_Final((unsigned __int8 *)[v3 mutableBytes], &self->_ctxSHA256);
      CC_LONG v4 = @"SHA224";
      break;
    case 1LL:
      id v3 = [v3 initWithLength:32];
      CC_SHA256_Final((unsigned __int8 *)[v3 mutableBytes], &self->_ctxSHA256);
      CC_LONG v4 = @"SHA256";
      break;
    case 2LL:
      id v3 = [v3 initWithLength:48];
      CC_SHA384_Final((unsigned __int8 *)[v3 mutableBytes], &self->_ctxSHA512);
      CC_LONG v4 = @"SHA384";
      break;
    case 3LL:
      id v3 = [v3 initWithLength:64];
      CC_SHA512_Final((unsigned __int8 *)[v3 mutableBytes], &self->_ctxSHA512);
      CC_LONG v4 = @"SHA512";
      break;
    default:
      -[TPHashBuilder throwInvalidAlgo](self, "throwInvalidAlgo");
      CC_LONG v4 = 0LL;
      break;
  }

  uint64_t v5 = (void *)NSString;
  [v3 base64EncodedStringWithOptions:0];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 stringWithFormat:@"%@:%@", v4, v6];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[TPHashBuilder setAlgo:](self, "setAlgo:", -1LL);
  return v7;
}

- (id)finalKeyedHash
{
  id v3 = objc_alloc(MEMORY[0x189603FB8]);
  if (-[TPHashBuilder algo](self, "algo") == 4)
  {
    id v3 = [v3 initWithLength:32];
    CCHmacFinal((CCHmacContext *)&self->_ctxHMAC, (void *)[v3 mutableBytes]);
  }

  else
  {
    -[TPHashBuilder throwInvalidAlgo](self, "throwInvalidAlgo");
  }

  -[TPHashBuilder setAlgo:](self, "setAlgo:", -1LL);
  return v3;
}

- (void)throwInvalidAlgo
{
  id v2 = [MEMORY[0x189603F70] exceptionWithName:@"InvalidTPHashAlgo" reason:@"Invalid TPHash algorithm" userInfo:0];
  objc_exception_throw(v2);
  -[TPHashBuilder algo](v3, v4);
}

- (int64_t)algo
{
  return self->_algo;
}

- (void)setAlgo:(int64_t)a3
{
  self->_algo = a3;
}

- (BOOL)keyed
{
  return self->_keyed;
}

- (void)setKeyed:(BOOL)a3
{
  self->_keyed = a3;
}

- (CC_SHA256state_st)ctxSHA256
{
  __int128 v3 = *(_OWORD *)&self->wbuf[8];
  __int128 v4 = *(_OWORD *)self[1].count;
  *(_OWORD *)&retstr->wbuf[6] = *(_OWORD *)&self->wbuf[12];
  *(_OWORD *)&retstr->wbuf[10] = v4;
  *(void *)&retstr->wbuf[14] = *(void *)&self[1].hash[2];
  __int128 v5 = *(_OWORD *)self->wbuf;
  *(_OWORD *)retstr->count = *(_OWORD *)&self->hash[4];
  *(_OWORD *)&retstr->hash[2] = v5;
  *(_OWORD *)&retstr->hash[6] = *(_OWORD *)&self->wbuf[4];
  *(_OWORD *)&retstr->wbuf[2] = v3;
  return self;
}

- (void)setCtxSHA256:(CC_SHA256state_st *)a3
{
  __int128 v3 = *(_OWORD *)a3->count;
  __int128 v4 = *(_OWORD *)&a3->hash[2];
  *(_OWORD *)&self->_ctxSHA256.hash[6] = *(_OWORD *)&a3->hash[6];
  *(_OWORD *)&self->_ctxSHA256.hash[2] = v4;
  *(_OWORD *)self->_ctxSHA256.count = v3;
  __int128 v5 = *(_OWORD *)&a3->wbuf[2];
  __int128 v6 = *(_OWORD *)&a3->wbuf[6];
  __int128 v7 = *(_OWORD *)&a3->wbuf[10];
  *(void *)&self->_ctxSHA256.wbuf[14] = *(void *)&a3->wbuf[14];
  *(_OWORD *)&self->_ctxSHA256.wbuf[10] = v7;
  *(_OWORD *)&self->_ctxSHA256.wbuf[6] = v6;
  *(_OWORD *)&self->_ctxSHA256.wbuf[2] = v5;
}

- (CC_SHA512state_st)ctxSHA512
{
  __int128 v3 = *(_OWORD *)&self[1].wbuf[2];
  *(_OWORD *)&retstr->wbuf[10] = *(_OWORD *)self[1].wbuf;
  *(_OWORD *)&retstr->wbuf[12] = v3;
  *(_OWORD *)&retstr->wbuf[14] = *(_OWORD *)&self[1].wbuf[4];
  __int128 v4 = *(_OWORD *)&self[1].hash[2];
  *(_OWORD *)&retstr->wbuf[2] = *(_OWORD *)self[1].hash;
  *(_OWORD *)&retstr->wbuf[4] = v4;
  __int128 v5 = *(_OWORD *)&self[1].hash[6];
  *(_OWORD *)&retstr->wbuf[6] = *(_OWORD *)&self[1].hash[4];
  *(_OWORD *)&retstr->wbuf[8] = v5;
  __int128 v6 = *(_OWORD *)&self->wbuf[12];
  *(_OWORD *)&retstr->hash[2] = *(_OWORD *)&self->wbuf[10];
  *(_OWORD *)&retstr->hash[4] = v6;
  __int128 v7 = *(_OWORD *)self[1].count;
  *(_OWORD *)&retstr->hash[6] = *(_OWORD *)&self->wbuf[14];
  *(_OWORD *)retstr->wbuf = v7;
  __int128 v8 = *(_OWORD *)&self->wbuf[8];
  *(_OWORD *)retstr->count = *(_OWORD *)&self->wbuf[6];
  *(_OWORD *)retstr->hash = v8;
  return self;
}

- (void)setCtxSHA512:(CC_SHA512state_st *)a3
{
  *(_OWORD *)self->_ctxSHA512.count = *(_OWORD *)a3->count;
  __int128 v3 = *(_OWORD *)a3->hash;
  __int128 v4 = *(_OWORD *)&a3->hash[2];
  __int128 v5 = *(_OWORD *)&a3->hash[6];
  *(_OWORD *)&self->_ctxSHA512.hash[4] = *(_OWORD *)&a3->hash[4];
  *(_OWORD *)&self->_ctxSHA512.hash[6] = v5;
  *(_OWORD *)self->_ctxSHA512.hash = v3;
  *(_OWORD *)&self->_ctxSHA512.hash[2] = v4;
  __int128 v6 = *(_OWORD *)a3->wbuf;
  __int128 v7 = *(_OWORD *)&a3->wbuf[2];
  __int128 v8 = *(_OWORD *)&a3->wbuf[6];
  *(_OWORD *)&self->_ctxSHA512.wbuf[4] = *(_OWORD *)&a3->wbuf[4];
  *(_OWORD *)&self->_ctxSHA512.wbuf[6] = v8;
  *(_OWORD *)self->_ctxSHA512.wbuf = v6;
  *(_OWORD *)&self->_ctxSHA512.wbuf[2] = v7;
  __int128 v9 = *(_OWORD *)&a3->wbuf[8];
  __int128 v10 = *(_OWORD *)&a3->wbuf[10];
  __int128 v11 = *(_OWORD *)&a3->wbuf[14];
  *(_OWORD *)&self->_ctxSHA512.wbuf[12] = *(_OWORD *)&a3->wbuf[12];
  *(_OWORD *)&self->_ctxSHA512.wbuf[14] = v11;
  *(_OWORD *)&self->_ctxSHA512.wbuf[8] = v9;
  *(_OWORD *)&self->_ctxSHA512.wbuf[10] = v10;
}

- ($1DC23E134A5F43A06C89BE309303CDCF)ctxHMAC
{
  return ($1DC23E134A5F43A06C89BE309303CDCF *)memcpy(retstr, &self->_ctxHMAC, sizeof($1DC23E134A5F43A06C89BE309303CDCF));
}

- (void)setCtxHMAC:(id *)a3
{
}

+ (int64_t)algoOfHash:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"SHA224:"])
  {
    int64_t v4 = 0LL;
  }

  else if ([v3 hasPrefix:@"SHA256:"])
  {
    int64_t v4 = 1LL;
  }

  else if ([v3 hasPrefix:@"SHA384:"])
  {
    int64_t v4 = 2LL;
  }

  else if ([v3 hasPrefix:@"SHA512:"])
  {
    int64_t v4 = 3LL;
  }

  else
  {
    int64_t v4 = -1LL;
  }

  return v4;
}

+ (id)hashWithAlgo:(int64_t)a3 ofData:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 bytes];
  uint64_t v7 = [v5 length];

  return +[TPHashBuilder hashWithAlgo:ofBytes:len:]( &OBJC_CLASS___TPHashBuilder,  "hashWithAlgo:ofBytes:len:",  a3,  v6,  v7);
}

+ (id)hashWithAlgo:(int64_t)a3 ofBytes:(const void *)a4 len:(unint64_t)a5
{
  uint64_t v7 = -[TPHashBuilder initWithAlgo:](objc_alloc(&OBJC_CLASS___TPHashBuilder), "initWithAlgo:", a3);
  -[TPHashBuilder updateWithBytes:len:](v7, "updateWithBytes:len:", a4, a5);
  -[TPHashBuilder finalHash](v7, "finalHash");
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)keyedHashWithAlgo:(int64_t)a3 key:(id)a4 data:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  __int128 v9 = -[TPHashBuilder initWithKeyedAlgo:key:]( objc_alloc(&OBJC_CLASS___TPHashBuilder),  "initWithKeyedAlgo:key:",  a3,  v8);

  -[TPHashBuilder updateWithData:](v9, "updateWithData:", v7);
  -[TPHashBuilder finalKeyedHash](v9, "finalKeyedHash");
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
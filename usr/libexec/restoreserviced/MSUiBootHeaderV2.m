@interface MSUiBootHeaderV2
- (BOOL)isValid;
- (BOOL)loadHeaderAtOffset:(unsigned int)a3;
- (BOOL)validHash;
- (BOOL)validHeaderSignature;
- (MSUiBootHeaderV2)initWithIOServiceWriter:(id)a3;
- (char)headerHash;
- (char)headerReserved;
- (id)_hashData:(id)a3 withMethod:(id)a4;
- (id)_hashDataWithNativeHashMethod:(id)a3;
- (id)computeHash;
- (id)description;
- (id)packStructure;
- (unsigned)headerSignature;
- (unsigned)headerVersion;
- (unsigned)length;
- (unsigned)secondaryPayloadOffset;
- (void)dealloc;
- (void)invalidate;
- (void)makeValid;
- (void)setAsFirstGeneration;
- (void)setHeaderHash:(char *)a3;
- (void)setHeaderReserved:(char *)a3;
- (void)setHeaderSignature:(unsigned int)a3;
- (void)setHeaderVersion:(unsigned int)a3;
- (void)setSecondaryPayloadOffset:(unsigned int)a3;
@end

@implementation MSUiBootHeaderV2

- (MSUiBootHeaderV2)initWithIOServiceWriter:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MSUiBootHeaderV2;
  v3 = -[MSUiBootHeader initWithIOServiceWriter:](&v5, "initWithIOServiceWriter:", a3);
  if (v3)
  {
    v3->_headerHash = (char *)calloc(0x20uLL, 1uLL);
    v3->_headerReserved = (char *)calloc(0x10uLL, 1uLL);
    v3->_headerSignature = 1;
  }

  return v3;
}

- (void)setHeaderHash:(char *)a3
{
  headerHash = self->_headerHash;
  __int128 v4 = *((_OWORD *)a3 + 1);
  *(_OWORD *)headerHash = *(_OWORD *)a3;
  *((_OWORD *)headerHash + 1) = v4;
}

- (void)setHeaderReserved:(char *)a3
{
  *(_OWORD *)self->_headerReserved = *(_OWORD *)a3;
}

- (id)packStructure
{
  v6[0] = 1095128392;
  v6[1] = -[MSUiBootHeaderV2 headerVersion](self, "headerVersion");
  v6[2] = -[MSUiBootHeader headerGeneration](self, "headerGeneration");
  v6[3] = -[MSUiBootHeader imageAddress](self, "imageAddress");
  headerHash = self->_headerHash;
  __int128 v4 = *((_OWORD *)headerHash + 1);
  __int128 v8 = *(_OWORD *)headerHash;
  __int128 v9 = v4;
  __int128 v7 = *(_OWORD *)self->_headerReserved;
  return +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v6, 64LL);
}

- (BOOL)loadHeaderAtOffset:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  memset(v10, 0, sizeof(v10));
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  id v5 = -[IOServiceWriter readDataAtOffset:ofLength:]( -[MSUiBootHeader serviceWriter](self, "serviceWriter"),  "readDataAtOffset:ofLength:",  *(void *)&a3,  64LL);
  id v6 = [v5 length];
  if (v6)
  {
    [v5 getBytes:&v8 length:64];
    -[MSUiBootHeaderV2 setHeaderVersion:](self, "setHeaderVersion:", DWORD1(v8));
    -[MSUiBootHeader setHeaderGeneration:](self, "setHeaderGeneration:", DWORD2(v8));
    -[MSUiBootHeader setImageAddress:](self, "setImageAddress:", HIDWORD(v8));
    -[MSUiBootHeaderV2 setHeaderSignature:](self, "setHeaderSignature:", v8);
    -[MSUiBootHeaderV2 setHeaderHash:](self, "setHeaderHash:", v10);
    -[MSUiBootHeaderV2 setHeaderReserved:](self, "setHeaderReserved:", &v9);
    -[MSUiBootHeader setStartLocation:](self, "setStartLocation:", v3);
  }

  return v6 != 0LL;
}

- (unsigned)secondaryPayloadOffset
{
  return *(_DWORD *)self->_headerReserved;
}

- (void)setSecondaryPayloadOffset:(unsigned int)a3
{
  *(_DWORD *)self->_headerReserved = a3;
}

- (void)setAsFirstGeneration
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MSUiBootHeaderV2;
  -[MSUiBootHeaderV1 setAsFirstGeneration](&v3, "setAsFirstGeneration");
  -[MSUiBootHeader setHeaderGeneration:](self, "setHeaderGeneration:", 1LL);
}

- (unsigned)length
{
  return 64;
}

- (void)invalidate
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MSUiBootHeaderV2;
  -[MSUiBootHeaderV1 invalidate](&v3, "invalidate");
}

- (BOOL)isValid
{
  unsigned __int8 v3 = -[MSUiBootHeaderV2 validHeaderSignature](self, "validHeaderSignature");
  return -[MSUiBootHeaderV2 validHash](self, "validHash") & v3;
}

- (BOOL)validHeaderSignature
{
  return -[MSUiBootHeaderV2 headerSignature](self, "headerSignature") == 1095128392;
}

- (void)makeValid
{
}

- (BOOL)validHash
{
  unsigned __int8 v3 = objc_msgSend(-[MSUiBootHeaderV2 computeHash](self, "computeHash"), "bytes");
  return *v3 == *(void *)-[MSUiBootHeaderV2 headerHash](self, "headerHash");
}

- (id)computeHash
{
  return -[MSUiBootHeaderV2 _hashDataWithNativeHashMethod:]( self,  "_hashDataWithNativeHashMethod:",  objc_msgSend(-[MSUiBootHeaderV2 packStructure](self, "packStructure"), "subdataWithRange:", 0, 32));
}

- (id)_hashDataWithNativeHashMethod:(id)a3
{
  uint64_t v5 = MGCopyAnswer(@"Image4CryptoHashMethod", 0LL);
  return -[MSUiBootHeaderV2 _hashData:withMethod:](self, "_hashData:withMethod:", a3, v5);
}

- (id)_hashData:(id)a3 withMethod:(id)a4
{
  CC_LONG v6 = [a3 length];
  if ([a4 isEqualToString:kAMAuthInstallApParameterImg4DigestSHA1])
  {
    uint64_t v7 = 20LL;
    __int128 v8 = (unsigned __int8 *)calloc(0x14uLL, 1uLL);
    CC_SHA1([a3 bytes], v6, v8);
  }

  else if ([a4 isEqualToString:kAMAuthInstallApParameterImg4DigestSHA384])
  {
    uint64_t v7 = 48LL;
    __int128 v8 = (unsigned __int8 *)calloc(0x30uLL, 1uLL);
    CC_SHA384([a3 bytes], v6, v8);
  }

  else
  {
    iBU_LOG_real( (uint64_t)@"Unknown hash digest type: %@",  "-[MSUiBootHeaderV2 _hashData:withMethod:]",  v9,  v10,  v11,  v12,  v13,  v14,  (uint64_t)a4);
    __int128 v8 = 0LL;
    uint64_t v7 = 0LL;
  }

  v15 = +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v8, v7);
  free(v8);
  return v15;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Generation: 0x%08x. Version: 0x%08x. HeaderStart: 0x%08x. PayloadAddress: 0x%08x. SecondaryOffset: 0x%08x",  -[MSUiBootHeader headerGeneration](self, "headerGeneration"),  -[MSUiBootHeaderV2 headerVersion](self, "headerVersion"),  -[MSUiBootHeader startLocation](self, "startLocation"),  -[MSUiBootHeader imageAddress](self, "imageAddress"),  -[MSUiBootHeaderV2 secondaryPayloadOffset](self, "secondaryPayloadOffset"));
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MSUiBootHeaderV2;
  -[MSUiBootHeader dealloc](&v3, "dealloc");
}

- (unsigned)headerSignature
{
  return *(&self->super._valid + 1);
}

- (void)setHeaderSignature:(unsigned int)a3
{
  *(&self->super._valid + 1) = a3;
}

- (char)headerHash
{
  return self->_headerHash;
}

- (unsigned)headerVersion
{
  return self->_headerSignature;
}

- (void)setHeaderVersion:(unsigned int)a3
{
  self->_headerSignature = a3;
}

- (char)headerReserved
{
  return self->_headerReserved;
}

@end
@interface PS190BootNonceHash
- (BOOL)isEmpty;
- (NSData)data;
- (PS190BootNonceHash)initWithHash:(PS190RawBootNonceHash *)a3;
- (id)description;
@end

@implementation PS190BootNonceHash

- (PS190BootNonceHash)initWithHash:(PS190RawBootNonceHash *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PS190BootNonceHash;
  v4 = -[PS190BootNonceHash init](&v12, sel_init);
  if (v4)
  {
    v5 = (NSData *)(id)[MEMORY[0x189603F48] dataWithBytes:a3 length:32];
    data = v4->_data;
    v4->_data = v5;

    BOOL v10 = *(void *)a3->var0 == initWithHash__emptyHash
       && *(void *)&a3->var0[8] == unk_18C760CD0
       && *(void *)&a3->var0[16] == qword_18C760CD8
       && *(void *)&a3->var0[24] == unk_18C760CE0;
    v4->_isEmpty = v10;
  }

  return v4;
}

- (id)description
{
  return -[NSData byteString](self->_data, "byteString");
}

- (BOOL)isEmpty
{
  return self->_isEmpty;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 16LL, 1);
}

- (void).cxx_destruct
{
}

@end
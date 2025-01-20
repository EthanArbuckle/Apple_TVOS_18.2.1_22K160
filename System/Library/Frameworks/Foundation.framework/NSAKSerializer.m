@interface NSAKSerializer
- (id)initForSerializerStream:(id)a3;
- (id)serializerStream;
- (unint64_t)serializeData:(id)a3;
- (unint64_t)serializeList:(id)a3;
- (unint64_t)serializeListItemIn:(id)a3 at:(unint64_t)a4;
- (unint64_t)serializeObject:(id)a3;
- (unint64_t)serializePListKeyIn:(id)a3 key:(id)a4 value:(id)a5;
- (unint64_t)serializePListValueIn:(id)a3 key:(id)a4 value:(id)a5;
- (unint64_t)serializePropertyList:(id)a3;
- (unint64_t)serializeString:(id)a3;
- (void)dealloc;
@end

@implementation NSAKSerializer

- (id)initForSerializerStream:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSAKSerializer;
  v4 = -[NSAKSerializer init](&v6, sel_init);
  v4->ss = a3;
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSAKSerializer;
  -[NSAKSerializer dealloc](&v3, sel_dealloc);
}

- (id)serializerStream
{
  return self->ss;
}

- (unint64_t)serializeObject:(id)a3
{
  if ((_NSIsNSData() & 1) != 0)
  {
    uint64_t v5 = [self->ss writeInt:1];
    unint64_t v6 = -[NSAKSerializer serializeData:](self, "serializeData:", a3);
    return v6 + v5;
  }

  if ((_NSIsNSArray() & 1) != 0)
  {
    uint64_t v5 = [self->ss writeInt:2];
    unint64_t v6 = -[NSAKSerializer serializeList:](self, "serializeList:", a3);
    return v6 + v5;
  }

  if ((_NSIsNSDictionary() & 1) != 0)
  {
    uint64_t v5 = [self->ss writeInt:3];
    unint64_t v6 = -[NSAKSerializer serializePropertyList:](self, "serializePropertyList:", a3);
    return v6 + v5;
  }

  if ((_NSIsNSString() & 1) != 0)
  {
    uint64_t v5 = [self->ss writeInt:4];
    unint64_t v6 = -[NSAKSerializer serializeString:](self, "serializeString:", a3);
    return v6 + v5;
  }

  if (a3)
  {
    uint64_t v8 = objc_opt_class();
    NSLog((NSString *)@"Serializing object of class %@\n", v8);
  }

  return [self->ss writeInt:0];
}

- (unint64_t)serializeData:(id)a3
{
  uint64_t v5 = [a3 length];
  uint64_t v6 = [a3 bytes];
  uint64_t v7 = [self->ss writeAlignedDataSize:v5];
  return [self->ss writeData:v6 length:v5] + v7;
}

- (unint64_t)serializeString:(id)a3
{
  uint64_t v4 = (void *)[a3 dataUsingEncoding:4 allowLossyConversion:1];
  uint64_t v5 = [v4 length];
  uint64_t v6 = [self->ss writeAlignedDataSize:v5];
  return objc_msgSend(self->ss, "writeData:length:", objc_msgSend(v4, "bytes"), v5) + v6;
}

- (unint64_t)serializeList:(id)a3
{
  uint64_t v5 = [a3 count];
  unint64_t v6 = [self->ss writeInt:v5];
  uint64_t v7 = (unsigned int *)malloc(4 * v5);
  if (v7)
  {
    uint64_t v8 = v7;
    if (v5)
    {
      v9 = (char *)v7;
      uint64_t v10 = v5;
      do
      {
        v6 += [self->ss writeRoomForInt:v9];
        v9 += 4;
        --v10;
      }

      while (v10);
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        unint64_t v12 = -[NSAKSerializer serializeListItemIn:at:](self, "serializeListItemIn:at:", a3, i);
        [self->ss writeDelayedInt:v12 for:v8[i]];
        v6 += v12;
      }
    }

    free(v8);
    return v6;
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:@"NSSerializeException" reason:@"unable to allocate memory" userInfo:0]);
    return -[NSAKSerializer serializeListItemIn:at:](v14, v15, v16, v17);
  }

- (unint64_t)serializeListItemIn:(id)a3 at:(unint64_t)a4
{
  return -[NSAKSerializer serializeObject:](self, "serializeObject:", [a3 objectAtIndex:a4]);
}

- (unint64_t)serializePropertyList:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v5 = [a3 count];
  uint64_t v16 = 0LL;
  unint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  uint64_t v19 = [self->ss writeInt:v5];
  unint64_t v6 = (char *)malloc(4 * v5);
  if (!v6)
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:@"NSSerializeException" reason:@"unable to allocate memory" userInfo:0]);
    __break(1u);
  }

  uint64_t v7 = v6;
  uint64_t v8 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __40__NSAKSerializer_serializePropertyList___block_invoke;
  v15[3] = &unk_189CA2988;
  v15[4] = self;
  v15[5] = a3;
  v15[6] = &v16;
  [a3 enumerateKeysAndObjectsUsingBlock:v15];
  bzero(v7, 4 * v5);
  if (v5)
  {
    v9 = v7;
    do
    {
      uint64_t v10 = [self->ss writeRoomForInt:v9];
      v17[3] += v10;
      v9 += 4;
      --v5;
    }

    while (v5);
  }

  v14[0] = 0LL;
  v14[1] = v14;
  v14[2] = 0x2020000000LL;
  v14[3] = 0LL;
  v13[0] = v8;
  v13[1] = 3221225472LL;
  v13[2] = __40__NSAKSerializer_serializePropertyList___block_invoke_2;
  v13[3] = &unk_189CA29B0;
  v13[4] = self;
  v13[5] = a3;
  v13[7] = v14;
  v13[8] = v7;
  v13[6] = &v16;
  [a3 enumerateKeysAndObjectsUsingBlock:v13];
  free(v7);
  unint64_t v11 = v17[3];
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v16, 8);
  return v11;
}

uint64_t __40__NSAKSerializer_serializePropertyList___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = [*(id *)(a1 + 32) serializePListKeyIn:*(void *)(a1 + 40) key:a2 value:a3];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) += result;
  return result;
}

uint64_t __40__NSAKSerializer_serializePropertyList___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = [*(id *)(a1 + 32) serializePListValueIn:*(void *)(a1 + 40) key:a2 value:a3];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) += v4;
  return [*(id *)(*(void *)(a1 + 32) + 8) writeDelayedInt:v4 for:*(unsigned int *)(*(void *)(a1 + 64) + 4 * (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))++)];
}

- (unint64_t)serializePListKeyIn:(id)a3 key:(id)a4 value:(id)a5
{
  return -[NSAKSerializer serializeString:](self, "serializeString:", a4);
}

- (unint64_t)serializePListValueIn:(id)a3 key:(id)a4 value:(id)a5
{
  return -[NSAKSerializer serializeObject:](self, "serializeObject:", a5, a4);
}

@end
@interface NSAKDeserializer
- (id)deserializeData:(id)a3;
- (id)deserializeList:(id)a3;
- (id)deserializeNewData;
- (id)deserializeNewKeyString;
- (id)deserializeNewList;
- (id)deserializeNewObject;
- (id)deserializeNewPList;
- (id)deserializeNewString;
- (id)deserializePList:(id)a3;
- (id)deserializeString:(id)a3;
- (id)deserializerStream;
- (id)initForDeserializerStream:(id)a3;
- (void)dealloc;
@end

@implementation NSAKDeserializer

- (id)initForDeserializerStream:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSAKDeserializer;
  v4 = -[NSAKDeserializer init](&v6, sel_init);
  v4->ds = a3;
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSAKDeserializer;
  -[NSAKDeserializer dealloc](&v3, sel_dealloc);
}

- (id)deserializerStream
{
  return self->ds;
}

- (id)deserializeNewObject
{
  switch([self->ds readInt])
  {
    case 1u:
      id result = -[NSAKDeserializer deserializeNewData](self, "deserializeNewData");
      break;
    case 2u:
      id result = -[NSAKDeserializer deserializeNewList](self, "deserializeNewList");
      break;
    case 3u:
      id result = -[NSAKDeserializer deserializeNewPList](self, "deserializeNewPList");
      break;
    case 4u:
      id result = -[NSAKDeserializer deserializeNewString](self, "deserializeNewString");
      break;
    default:
      id result = 0LL;
      break;
  }

  return result;
}

- (id)deserializeNewData
{
  return -[NSAKDeserializer deserializeData:]( self,  "deserializeData:",  objc_msgSend(MEMORY[0x189603F48], "allocWithZone:", -[NSAKDeserializer zone](self, "zone")));
}

- (id)deserializeData:(id)a3
{
  NSUInteger v5 = [self->ds readAlignedDataSize];
  objc_super v6 = NSAllocateMemoryPages(v5);
  [self->ds readData:v6 length:v5];
  uint64_t v7 = (void *)[a3 initWithBytes:v6 length:v5];
  NSDeallocateMemoryPages(v6, v5);
  return v7;
}

- (id)deserializeNewString
{
  return -[NSAKDeserializer deserializeString:]( self,  "deserializeString:",  +[NSString allocWithZone:](&OBJC_CLASS___NSString, "allocWithZone:", -[NSAKDeserializer zone](self, "zone")));
}

- (id)deserializeNewKeyString
{
  return -[NSAKDeserializer deserializeString:]( self,  "deserializeString:",  +[NSString allocWithZone:](&OBJC_CLASS___NSString, "allocWithZone:", -[NSAKDeserializer zone](self, "zone")));
}

- (id)deserializeString:(id)a3
{
  vm_size_t v5 = [self->ds readAlignedDataSize];
  vm_address_t v6 = allocate(v5);
  [self->ds readData:v6 length:v5];
  uint64_t v7 = (void *)[a3 initWithBytes:v6 length:v5 encoding:4];
  unallocate(v6, v5);
  return v7;
}

- (id)deserializeNewList
{
  return -[NSAKDeserializer deserializeList:]( self,  "deserializeList:",  objc_msgSend(MEMORY[0x189603FA8], "allocWithZone:", -[NSAKDeserializer zone](self, "zone")));
}

- (id)deserializeList:(id)a3
{
  int v5 = [self->ds readInt];
  if (v5 < 0)
  {
    v15 = (void *)MEMORY[0x189603F70];
    v16 = @"count too large";
LABEL_11:
    objc_exception_throw((id)[v15 exceptionWithName:@"NSDeserializeException" reason:v16 userInfo:0]);
    return -[NSAKDeserializer deserializeListItemIn:at:length:](v17, v18, v19, v20, v21);
  }

  uint64_t v6 = v5;
  uint64_t v7 = malloc(8LL * v5);
  if (!v7)
  {
    v15 = (void *)MEMORY[0x189603F70];
    v16 = @"unable to allocate memory";
    goto LABEL_11;
  }

  v8 = v7;
  v9 = (void *)[a3 init];
  if ((_DWORD)v6)
  {
    v10 = v8;
    uint64_t v11 = v6;
    do
    {
      *v10++ = (int)[self->ds readInt];
      --v11;
    }

    while (v11);
    for (uint64_t i = 0LL; i != v6; ++i)
    {
      id v13 = -[NSAKDeserializer deserializeListItemIn:at:length:](self, "deserializeListItemIn:at:length:", v9, i, v8[i]);
      [v9 addObject:v13];
    }
  }

  free(v8);
  return v9;
}

- (id)deserializeNewPList
{
  return -[NSAKDeserializer deserializePList:]( self,  "deserializePList:",  objc_msgSend(MEMORY[0x189603FC8], "allocWithZone:", -[NSAKDeserializer zone](self, "zone")));
}

- (id)deserializePList:(id)a3
{
  uint64_t v4 = (void *)[a3 init];
  int v5 = [self->ds readInt];
  int v6 = v5;
  if (v5 < 0)
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:@"NSDeserializeException" reason:@"count too large" userInfo:0]);
LABEL_21:
    __break(1u);
    return result;
  }

  uint64_t v7 = v5;
  v8 = malloc(8LL * v5);
  v9 = malloc_default_zone();
  v10 = malloc_zone_calloc(v9, 1uLL, 8LL * v6);
  uint64_t v11 = v10;
  if (v8) {
    BOOL v12 = v10 == 0LL;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:@"NSDeserializeException" reason:@"unable to allocate memory" userInfo:0]);
    goto LABEL_21;
  }

  if (v6)
  {
    id v13 = v10;
    uint64_t v14 = v7;
    do
    {
      *v13++ = -[NSAKDeserializer deserializePListKeyIn:](self, "deserializePListKeyIn:", v4);
      --v14;
    }

    while (v14);
    v15 = v8;
    uint64_t v16 = v7;
    do
    {
      *v15++ = (int)[self->ds readInt];
      --v16;
    }

    while (v16);
    v17 = v8;
    SEL v18 = v11;
    do
    {
      uint64_t v19 = *v17++;
      unint64_t v20 = (void *)*v18;
      id v21 = -[NSAKDeserializer deserializePListValueIn:key:length:]( self,  "deserializePListValueIn:key:length:",  v4,  *v18,  v19);
      v22 = v21;
      if (v20) {
        BOOL v23 = v21 == 0LL;
      }
      else {
        BOOL v23 = 1;
      }
      if (!v23) {
        [v4 setObject:v21 forKey:v20];
      }

      ++v18;
      --v7;
    }

    while (v7);
  }

  free(v8);
  free(v11);
  return v4;
}

@end
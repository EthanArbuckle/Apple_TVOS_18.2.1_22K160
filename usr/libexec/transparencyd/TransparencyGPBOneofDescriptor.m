@interface TransparencyGPBOneofDescriptor
- (NSArray)fields;
- (NSString)name;
- (TransparencyGPBOneofDescriptor)initWithName:(const char *)a3 fields:(id)a4;
- (id)fieldWithName:(id)a3;
- (id)fieldWithNumber:(unsigned int)a3;
- (void)dealloc;
@end

@implementation TransparencyGPBOneofDescriptor

- (TransparencyGPBOneofDescriptor)initWithName:(const char *)a3 fields:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TransparencyGPBOneofDescriptor;
  v6 = -[TransparencyGPBOneofDescriptor init](&v17, "init");
  v7 = v6;
  if (v6)
  {
    v6->name_ = a3;
    v6->fields_ = (NSArray *)a4;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v8 = [a4 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(a4);
          }
          *(void *)(*(void *)(*((void *)&v13 + 1) + 8LL * (void)i) + 16LL) = v7;
        }

        id v9 = [a4 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }

      while (v9);
    }

    v7->caseSel_ = sub_1001110C4(0LL, (char *)a3, "OneOfCase", 0);
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TransparencyGPBOneofDescriptor;
  -[TransparencyGPBOneofDescriptor dealloc](&v3, "dealloc");
}

- (NSString)name
{
  return +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", self->name_);
}

- (id)fieldWithNumber:(unsigned int)a3
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  fields = self->fields_;
  id result = -[NSArray countByEnumeratingWithState:objects:count:]( fields,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (result)
  {
    id v6 = result;
    uint64_t v7 = *(void *)v10;
LABEL_3:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v10 != v7) {
        objc_enumerationMutation(fields);
      }
      id result = *(id *)(*((void *)&v9 + 1) + 8 * v8);
      if (*(_DWORD *)(*((void *)result + 1) + 16LL) == a3) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id result = -[NSArray countByEnumeratingWithState:objects:count:]( fields,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
        id v6 = result;
        if (result) {
          goto LABEL_3;
        }
        return result;
      }
    }
  }

  return result;
}

- (id)fieldWithName:(id)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  fields = self->fields_;
  id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( fields,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (!v5) {
    return 0LL;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0LL;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(fields);
    }
    __int128 v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (v6 == (id)++v8)
    {
      id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( fields,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      if (v6) {
        goto LABEL_3;
      }
      return 0LL;
    }
  }

- (NSArray)fields
{
  return self->fields_;
}

@end
@interface TransparencyGPBDescriptor
+ (id)allocDescriptorForClass:(Class)a3 file:(id)a4 fields:(void *)a5 fieldCount:(unsigned int)a6 storageSize:(unsigned int)a7 flags:(unsigned int)a8;
+ (id)allocDescriptorForClass:(Class)a3 messageName:(id)a4 fileDescription:(TransparencyGPBFileDescription *)a5 fields:(void *)a6 fieldCount:(unsigned int)a7 storageSize:(unsigned int)a8 flags:(unsigned int)a9;
+ (id)allocDescriptorForClass:(Class)a3 rootClass:(Class)a4 file:(id)a5 fields:(void *)a6 fieldCount:(unsigned int)a7 storageSize:(unsigned int)a8 flags:(unsigned int)a9;
- (BOOL)isWireFormat;
- (Class)messageClass;
- (NSArray)fields;
- (NSArray)oneofs;
- (NSString)fullName;
- (NSString)name;
- (TransparencyGPBDescriptor)containingType;
- (TransparencyGPBDescriptor)initWithClass:(Class)a3 messageName:(id)a4 fileDescription:(TransparencyGPBFileDescription *)a5 fields:(id)a6 storageSize:(unsigned int)a7 wireFormat:(BOOL)a8;
- (TransparencyGPBFileDescriptor)file;
- (const)extensionRanges;
- (id)fieldWithName:(id)a3;
- (id)fieldWithNumber:(unsigned int)a3;
- (id)oneofWithName:(id)a3;
- (unsigned)extensionRangesCount;
- (void)dealloc;
- (void)setupContainingMessageClass:(Class)a3;
- (void)setupContainingMessageClassName:(const char *)a3;
- (void)setupExtensionRanges:(const TransparencyGPBExtensionRange *)a3 count:(int)a4;
- (void)setupExtraTextInfo:(const char *)a3;
- (void)setupMessageClassNameSuffix:(id)a3;
- (void)setupOneofs:(const char *)a3 count:(unsigned int)a4 firstHasIndex:(int)a5;
@end

@implementation TransparencyGPBDescriptor

+ (id)allocDescriptorForClass:(Class)a3 messageName:(id)a4 fileDescription:(TransparencyGPBFileDescription *)a5 fields:(void *)a6 fieldCount:(unsigned int)a7 storageSize:(unsigned int)a8 flags:(unsigned int)a9
{
  uint64_t v9 = *(void *)&a8;
  if (a9 >= 0x20) {
    sub_100137F68();
  }
  if (a7)
  {
    id v25 = a4;
    unsigned int v26 = v9;
    uint64_t v16 = a7;
    v17 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", a7);
    unsigned int v18 = 0;
    v19 = (unsigned __int16 *)a6;
    do
    {
      v20 = v19 + 18;
      if ((a9 & 1) != 0)
      {
        v21 = v19;
      }

      else
      {
        v20 = (unsigned __int16 *)((char *)a6 + 28);
        v21 = a6;
      }

      v18 |= *v20;
      v22 = -[TransparencyGPBFieldDescriptor initWithFieldDescription:descriptorFlags:]( objc_alloc(&OBJC_CLASS___TransparencyGPBFieldDescriptor),  "initWithFieldDescription:descriptorFlags:",  v21,  a9);
      -[NSMutableArray addObject:](v17, "addObject:", v22);

      v19 += 20;
      a6 = (char *)a6 + 32;
      --v16;
    }

    while (v16);
    a4 = v25;
    if (v18 >= 0x2000) {
      sub_100137F68();
    }
    uint64_t v9 = v26;
  }

  else
  {
    v17 = 0LL;
  }

  id v23 = [objc_alloc((Class)a1) initWithClass:a3 messageName:a4 fileDescription:a5 fields:v17 storageSize:v9 wireFormat:(a9 >> 1) & 1];

  return v23;
}

+ (id)allocDescriptorForClass:(Class)a3 file:(id)a4 fields:(void *)a5 fieldCount:(unsigned int)a6 storageSize:(unsigned int)a7 flags:(unsigned int)a8
{
  uint64_t v9 = *(void *)&a7;
  uint64_t v10 = *(void *)&a6;
  id v12 = a4;
  if ((~a8 & 0x1C) != 0)
  {
    id v25 = a1;
    unsigned int v26 = a3;
    unsigned int v13 = [a4 syntax];
    if ((_DWORD)v10)
    {
      unsigned int v14 = v13;
      BOOL v16 = (a8 & 8) == 0 && v13 == 3;
      uint64_t v17 = v10;
      unsigned int v18 = (char *)a5 + 8;
      v19 = (char *)a5;
      do
      {
        if ((a8 & 1) != 0) {
          v20 = v18;
        }
        else {
          v20 = v19;
        }
        if (v16
          && (*((_WORD *)v20 + 14) & 0xF02) == 0
          && (*((_DWORD *)v20 + 5) & 0x80000000) == 0
          && v20[30] - 17 <= 0xFFFFFFFD)
        {
          *((_WORD *)v20 + 14) |= 0x20u;
        }

        if ((a8 & 0x10) == 0 && v20[30] == 17 && v14 != 3) {
          *((_WORD *)v20 + 14) |= 0x1000u;
        }
        v18 += 40;
        v19 += 32;
        --v17;
      }

      while (v17);
    }

    a8 |= 0x1Cu;
    id v12 = a4;
    uint64_t v9 = a7;
    a1 = v25;
    a3 = v26;
  }

  LODWORD(v24) = a8;
  id v22 = [a1 allocDescriptorForClass:a3 messageName:0 fileDescription:0 fields:a5 fieldCount:v10 storageSize:v9 flags:v24];
  objc_setAssociatedObject(v22, &unk_10024BB3C, v12, (void *)1);
  return v22;
}

+ (id)allocDescriptorForClass:(Class)a3 rootClass:(Class)a4 file:(id)a5 fields:(void *)a6 fieldCount:(unsigned int)a7 storageSize:(unsigned int)a8 flags:(unsigned int)a9
{
  return _[a1 allocDescriptorForClass:a3 file:a5 fields:a6 fieldCount:*(void *)&a7 storageSize:*(void *)&a8 flags:a9];
}

- (TransparencyGPBDescriptor)initWithClass:(Class)a3 messageName:(id)a4 fileDescription:(TransparencyGPBFileDescription *)a5 fields:(id)a6 storageSize:(unsigned int)a7 wireFormat:(BOOL)a8
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TransparencyGPBDescriptor;
  unsigned int v14 = -[TransparencyGPBDescriptor init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    v14->messageClass_ = a3;
    v14->messageName_ = (NSString *)[a4 copy];
    v15->fileDescription_ = a5;
    v15->fields_ = (NSArray *)a6;
    v15->storageSize_ = a7;
    v15->wireFormat_ = a8;
  }

  return v15;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TransparencyGPBDescriptor;
  -[TransparencyGPBDescriptor dealloc](&v3, "dealloc");
}

- (void)setupOneofs:(const char *)a3 count:(unsigned int)a4 firstHasIndex:(int)a5
{
  uint64_t v7 = a4;
  v8 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", a4);
  if (a4)
  {
    uint64_t v9 = 0LL;
    do
    {
      uint64_t v10 = a3[v9];
      fields = self->fields_;
      id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      id v13 = -[NSArray countByEnumeratingWithState:objects:count:]( fields,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v21;
        do
        {
          BOOL v16 = 0LL;
          do
          {
            if (*(void *)v21 != v15) {
              objc_enumerationMutation(fields);
            }
            if (*(_DWORD *)(*(void *)(*(void *)(*((void *)&v20 + 1) + 8LL * (void)v16) + 8LL) + 20LL) == a5) {
              -[NSMutableArray addObject:](v12, "addObject:");
            }
            BOOL v16 = (char *)v16 + 1;
          }

          while (v14 != v16);
          id v14 = -[NSArray countByEnumeratingWithState:objects:count:]( fields,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
        }

        while (v14);
      }

      objc_super v17 = -[TransparencyGPBOneofDescriptor initWithName:fields:]( objc_alloc(&OBJC_CLASS___TransparencyGPBOneofDescriptor),  "initWithName:fields:",  v10,  v12);
      -[NSMutableArray addObject:](v8, "addObject:", v17);

      ++v9;
      --a5;
    }

    while (v9 != v7);
  }

  self->oneofs_ = &v8->super;
}

- (void)setupExtraTextInfo:(const char *)a3
{
  if (a3)
  {
    v4 = +[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:");
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    fields = self->fields_;
    id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( fields,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(fields);
          }
          uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)v9);
          if ((*(_WORD *)(v10[1] + 28LL) & 0x40) != 0) {
            objc_setAssociatedObject(v10, &unk_10024BB3D, v4, (void *)1);
          }
          uint64_t v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( fields,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      }

      while (v7);
    }
  }

- (void)setupExtensionRanges:(const TransparencyGPBExtensionRange *)a3 count:(int)a4
{
  self->extensionRanges_ = a3;
  self->extensionRangesCount_ = a4;
}

- (void)setupContainingMessageClass:(Class)a3
{
}

- (void)setupContainingMessageClassName:(const char *)a3
{
}

- (void)setupMessageClassNameSuffix:(id)a3
{
  if ([a3 length]) {
    objc_setAssociatedObject(self, &unk_10024BB3F, a3, (void *)1);
  }
}

- (NSString)name
{
  return NSStringFromClass(self->messageClass_);
}

- (TransparencyGPBFileDescriptor)file
{
  AssociatedObject = (TransparencyGPBFileDescriptor *)objc_getAssociatedObject(self, &unk_10024BB3C);
  if (!AssociatedObject)
  {
    fileDescription = self->fileDescription_;
    if (fileDescription->var0)
    {
      v5 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:");
      fileDescription = self->fileDescription_;
    }

    else
    {
      v5 = &stru_10028E390;
    }

    if (fileDescription->var1) {
      id v6 = -[TransparencyGPBFileDescriptor initWithPackage:objcPrefix:syntax:]( objc_alloc(&OBJC_CLASS___TransparencyGPBFileDescriptor),  "initWithPackage:objcPrefix:syntax:",  v5,  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  self->fileDescription_->var1),  self->fileDescription_->var2);
    }
    else {
      id v6 = -[TransparencyGPBFileDescriptor initWithPackage:syntax:]( objc_alloc(&OBJC_CLASS___TransparencyGPBFileDescriptor),  "initWithPackage:syntax:",  v5,  self->fileDescription_->var2);
    }
    AssociatedObject = v6;
    objc_setAssociatedObject(v6, &unk_10024BB3C, v6, (void *)1);
  }

  objc_sync_exit(self);
  return AssociatedObject;
}

- (TransparencyGPBDescriptor)containingType
{
  return (TransparencyGPBDescriptor *)objc_msgSend(objc_getAssociatedObject(self, &unk_10024BB3E), "descriptor");
}

- (NSString)fullName
{
  objc_super v3 = -[TransparencyGPBDescriptor containingType](self, "containingType");
  v4 = v3;
  messageName = self->messageName_;
  if (messageName)
  {
    if (v3) {
      return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  -[TransparencyGPBDescriptor fullName](v3, "fullName"),  self->messageName_);
    }
    if (self->fileDescription_->var0) {
      return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s.%@",  self->fileDescription_->var0,  messageName);
    }
    return messageName;
  }

  id v7 = NSStringFromClass(-[TransparencyGPBDescriptor messageClass](self, "messageClass"));
  uint64_t v8 = -[TransparencyGPBDescriptor file](self, "file");
  uint64_t v9 = -[TransparencyGPBFileDescriptor objcPrefix](v8, "objcPrefix");
  if (v9 && !-[NSString hasPrefix:](v7, "hasPrefix:", v9)) {
    return 0LL;
  }
  if (v4)
  {
    uint64_t v10 = NSStringFromClass(-[TransparencyGPBDescriptor messageClass](v4, "messageClass"));
    id AssociatedObject = objc_getAssociatedObject(v4, &unk_10024BB3F);
    if (AssociatedObject)
    {
      __int128 v12 = AssociatedObject;
      if (!-[NSString hasSuffix:](v10, "hasSuffix:", AssociatedObject)) {
        return 0LL;
      }
      uint64_t v10 = -[NSString substringToIndex:]( v10,  "substringToIndex:",  (_BYTE *)-[NSString length](v10, "length") - (_BYTE *)[v12 length]);
    }

    uint64_t v9 = -[NSString stringByAppendingString:](v10, "stringByAppendingString:", @"_");
    if (!-[NSString hasPrefix:](v7, "hasPrefix:", v9)) {
      return 0LL;
    }
  }

  messageName = -[NSString substringFromIndex:](v7, "substringFromIndex:", -[NSString length](v9, "length"));
  id v13 = objc_getAssociatedObject(self, &unk_10024BB3F);
  if (!v13) {
    goto LABEL_14;
  }
  __int128 v14 = v13;
  if (!-[NSString hasSuffix:](messageName, "hasSuffix:", v13)) {
    return 0LL;
  }
  messageName = -[NSString substringToIndex:]( messageName,  "substringToIndex:",  (_BYTE *)-[NSString length](messageName, "length") - (_BYTE *)[v14 length]);
LABEL_14:
  if (v4) {
    uint64_t v15 = -[TransparencyGPBDescriptor fullName](v4, "fullName");
  }
  else {
    uint64_t v15 = -[TransparencyGPBFileDescriptor package](v8, "package");
  }
  BOOL v16 = v15;
  if (-[NSString length](v15, "length")) {
    return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.%@", v16, messageName);
  }
  return messageName;
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

- (id)oneofWithName:(id)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  oneofs = self->oneofs_;
  id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( oneofs,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
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
      objc_enumerationMutation(oneofs);
    }
    __int128 v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (v6 == (id)++v8)
    {
      id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( oneofs,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      if (v6) {
        goto LABEL_3;
      }
      return 0LL;
    }
  }

- (Class)messageClass
{
  return self->messageClass_;
}

- (NSArray)fields
{
  return self->fields_;
}

- (NSArray)oneofs
{
  return self->oneofs_;
}

- (const)extensionRanges
{
  return self->extensionRanges_;
}

- (unsigned)extensionRangesCount
{
  return self->extensionRangesCount_;
}

- (BOOL)isWireFormat
{
  return self->wireFormat_;
}

@end
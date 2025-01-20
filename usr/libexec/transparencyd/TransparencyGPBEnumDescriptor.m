@interface TransparencyGPBEnumDescriptor
+ (id)allocDescriptorForName:(id)a3 valueNames:(const char *)a4 values:(const int *)a5 count:(unsigned int)a6 enumVerifier:(void *)a7;
+ (id)allocDescriptorForName:(id)a3 valueNames:(const char *)a4 values:(const int *)a5 count:(unsigned int)a6 enumVerifier:(void *)a7 extraTextFormatInfo:(const char *)a8;
+ (id)allocDescriptorForName:(id)a3 valueNames:(const char *)a4 values:(const int *)a5 count:(unsigned int)a6 enumVerifier:(void *)a7 flags:(unsigned int)a8;
+ (id)allocDescriptorForName:(id)a3 valueNames:(const char *)a4 values:(const int *)a5 count:(unsigned int)a6 enumVerifier:(void *)a7 flags:(unsigned int)a8 extraTextFormatInfo:(const char *)a9;
- (BOOL)getValue:(int *)a3 forEnumName:(id)a4;
- (BOOL)getValue:(int *)a3 forEnumTextFormatName:(id)a4;
- (BOOL)isClosed;
- (NSString)name;
- (TransparencyGPBEnumDescriptor)initWithName:(id)a3 valueNames:(const char *)a4 values:(const int *)a5 count:(unsigned int)a6 enumVerifier:(void *)a7 flags:(unsigned int)a8;
- (id)enumNameForValue:(int)a3;
- (id)getEnumNameForIndex:(unsigned int)a3;
- (id)getEnumTextFormatNameForIndex:(unsigned int)a3;
- (id)textFormatNameForValue:(int)a3;
- (unsigned)enumNameCount;
- (void)calcValueNameOffsets;
- (void)dealloc;
- (void)enumVerifier;
@end

@implementation TransparencyGPBEnumDescriptor

+ (id)allocDescriptorForName:(id)a3 valueNames:(const char *)a4 values:(const int *)a5 count:(unsigned int)a6 enumVerifier:(void *)a7 flags:(unsigned int)a8
{
  uint64_t v8 = *(void *)&a8;
  uint64_t v10 = *(void *)&a6;
  if ((a8 & 0xFFFFFFFD) != 0) {
    sub_100137F68();
  }
  return _[objc_alloc((Class)a1) initWithName:a3 valueNames:a4 values:a5 count:v10 enumVerifier:a7 flags:v8];
}

+ (id)allocDescriptorForName:(id)a3 valueNames:(const char *)a4 values:(const int *)a5 count:(unsigned int)a6 enumVerifier:(void *)a7 flags:(unsigned int)a8 extraTextFormatInfo:(const char *)a9
{
  id result = [a1 allocDescriptorForName:a3 valueNames:a4 values:a5 count:*(void *)&a6 enumVerifier:a7 flags:*(void *)&a8];
  *((void *)result + 5) = a9;
  return result;
}

+ (id)allocDescriptorForName:(id)a3 valueNames:(const char *)a4 values:(const int *)a5 count:(unsigned int)a6 enumVerifier:(void *)a7
{
  return [a1 allocDescriptorForName:a3 valueNames:a4 values:a5 count:*(void *)&a6 enumVerifier:a7 flags:0];
}

+ (id)allocDescriptorForName:(id)a3 valueNames:(const char *)a4 values:(const int *)a5 count:(unsigned int)a6 enumVerifier:(void *)a7 extraTextFormatInfo:(const char *)a8
{
  return [a1 allocDescriptorForName:a3 valueNames:a4 values:a5 count:*(void *)&a6 enumVerifier:a7 flags:0 extraTextFormatInfo:a8];
}

- (TransparencyGPBEnumDescriptor)initWithName:(id)a3 valueNames:(const char *)a4 values:(const int *)a5 count:(unsigned int)a6 enumVerifier:(void *)a7 flags:(unsigned int)a8
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TransparencyGPBEnumDescriptor;
  v14 = -[TransparencyGPBEnumDescriptor init](&v16, "init");
  if (v14)
  {
    v14->name_ = (NSString *)[a3 copy];
    v14->valueNames_ = a4;
    v14->values_ = a5;
    v14->enumVerifier_ = a7;
    v14->valueCount_ = a6;
    v14->flags_ = a8;
  }

  return v14;
}

- (void)dealloc
{
  nameOffsets = self->nameOffsets_;
  if (nameOffsets) {
    free(nameOffsets);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TransparencyGPBEnumDescriptor;
  -[TransparencyGPBEnumDescriptor dealloc](&v4, "dealloc");
}

- (BOOL)isClosed
{
  return (LOBYTE(self->flags_) >> 1) & 1;
}

- (void)calcValueNameOffsets
{
  if (!self->nameOffsets_)
  {
    uint64_t valueCount = self->valueCount_;
    objc_super v4 = (unsigned int *)malloc(4 * valueCount);
    if (v4)
    {
      if ((_DWORD)valueCount)
      {
        uint64_t v5 = 0LL;
        valueNames = self->valueNames_;
        v7 = valueNames;
        do
        {
          v4[v5] = (_DWORD)v7 - (_DWORD)valueNames;
          ++v5;
        }

        while (v5 != valueCount);
      }

      self->nameOffsets_ = v4;
    }
  }

  objc_sync_exit(self);
}

- (id)enumNameForValue:(int)a3
{
  uint64_t valueCount = self->valueCount_;
  if (!(_DWORD)valueCount) {
    return 0LL;
  }
  uint64_t v4 = 0LL;
  while (self->values_[v4] != a3)
  {
    if (valueCount == ++v4) {
      return 0LL;
    }
  }

  return -[TransparencyGPBEnumDescriptor getEnumNameForIndex:](self, "getEnumNameForIndex:", v4);
}

- (BOOL)getValue:(int *)a3 forEnumName:(id)a4
{
  NSUInteger v7 = -[NSString length](self->name_, "length");
  NSUInteger v8 = v7 + 1;
  unsigned int v9 = [a4 hasPrefix:self->name_];
  if (!v9) {
    return v9;
  }
  if ([a4 characterAtIndex:v7] != 95
    || (uint64_t v10 = (char *)[a4 UTF8String],
        -[TransparencyGPBEnumDescriptor calcValueNameOffsets](self, "calcValueNameOffsets"),
        (nameOffsets = self->nameOffsets_) == 0LL)
    || (uint64_t valueCount = self->valueCount_, !(_DWORD)valueCount))
  {
LABEL_10:
    LOBYTE(v9) = 0;
    return v9;
  }

  unint64_t v13 = 0LL;
  v14 = &v10[v8];
  valueNames = self->valueNames_;
  uint64_t v16 = 4 * valueCount;
  while (strcmp(v14, &valueNames[nameOffsets[v13 / 4]]))
  {
    LOBYTE(v9) = 0;
    v13 += 4LL;
    if (v16 == v13) {
      return v9;
    }
  }

  if (a3) {
    *a3 = self->values_[v13 / 4];
  }
  LOBYTE(v9) = 1;
  return v9;
}

- (BOOL)getValue:(int *)a3 forEnumTextFormatName:(id)a4
{
  if (!self->nameOffsets_ || !self->valueCount_) {
    return 0;
  }
  uint64_t v7 = 0LL;
  while (!objc_msgSend( -[TransparencyGPBEnumDescriptor getEnumTextFormatNameForIndex:]( self,  "getEnumTextFormatNameForIndex:",  v7),  "isEqual:",  a4))
  {
  }

  if (a3) {
    *a3 = self->values_[v7];
  }
  return 1;
}

- (id)textFormatNameForValue:(int)a3
{
  uint64_t valueCount = self->valueCount_;
  if (!(_DWORD)valueCount) {
    return 0LL;
  }
  uint64_t v4 = 0LL;
  while (self->values_[v4] != a3)
  {
    if (valueCount == ++v4) {
      return 0LL;
    }
  }

  return -[TransparencyGPBEnumDescriptor getEnumTextFormatNameForIndex:](self, "getEnumTextFormatNameForIndex:", v4);
}

- (unsigned)enumNameCount
{
  return self->valueCount_;
}

- (id)getEnumNameForIndex:(unsigned int)a3
{
  nameOffsets = self->nameOffsets_;
  if (nameOffsets && self->valueCount_ > a3) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%s",  self->name_,  &self->valueNames_[nameOffsets[a3]]);
  }
  else {
    return 0LL;
  }
}

- (id)getEnumTextFormatNameForIndex:(unsigned int)a3
{
  nameOffsets = self->nameOffsets_;
  if (!nameOffsets || self->valueCount_ <= a3) {
    return 0LL;
  }
  v6 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  &self->valueNames_[nameOffsets[a3]]);
  extraTextFormatInfo = (char *)self->extraTextFormatInfo_;
  if (!extraTextFormatInfo || (NSUInteger v8 = (NSMutableString *)sub_100139F10(extraTextFormatInfo, a3, v6)) == 0LL)
  {
    unsigned int v9 = -[NSString length](v6, "length");
    NSUInteger v8 = +[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", v9);
    if (v9)
    {
      for (i = 0LL; i != v9; ++i)
      {
        unsigned int v11 = -[NSString characterAtIndex:](v6, "characterAtIndex:", i);
        char v12 = v11;
        if (i && v11 >= 0x41 && v11 <= 0x5A) {
          -[NSMutableString appendString:](v8, "appendString:", @"_");
        }
        -[NSMutableString appendFormat:](v8, "appendFormat:", @"%c", __toupper(v12));
      }
    }
  }

  return v8;
}

- (NSString)name
{
  return self->name_;
}

- (void)enumVerifier
{
  return self->enumVerifier_;
}

@end
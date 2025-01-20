@interface TransparencyGPBFieldDescriptor
- ($288B3E7DB5778AFB5AC44FB3F8CA16F3)defaultValue;
- (BOOL)hasDefaultValue;
- (BOOL)isOptional;
- (BOOL)isPackable;
- (BOOL)isRequired;
- (BOOL)isValidEnumValue:(int)a3;
- (Class)msgClass;
- (NSString)name;
- (TransparencyGPBEnumDescriptor)enumDescriptor;
- (TransparencyGPBFieldDescriptor)initWithFieldDescription:(void *)a3 descriptorFlags:(unsigned int)a4;
- (TransparencyGPBOneofDescriptor)containingOneof;
- (id)textFormatName;
- (unsigned)dataType;
- (unsigned)fieldType;
- (unsigned)mapKeyDataType;
- (unsigned)number;
- (void)dealloc;
@end

@implementation TransparencyGPBFieldDescriptor

- (TransparencyGPBFieldDescriptor)initWithFieldDescription:(void *)a3 descriptorFlags:(unsigned int)a4
{
  char v4 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TransparencyGPBFieldDescriptor;
  v6 = -[TransparencyGPBFieldDescriptor init](&v15, "init");
  v7 = v6;
  if (!v6) {
    return v7;
  }
  if ((v4 & 1) != 0) {
    v8 = (TransparencyGPBMessageFieldDescription *)((char *)a3 + 8);
  }
  else {
    v8 = (TransparencyGPBMessageFieldDescription *)a3;
  }
  v6->description_ = v8;
  v6->getSel_ = sel_getUid(*((const char **)a3 + (v4 & 1)));
  v7->setSel_ = sub_1001110C4("set", *((char **)a3 + (v4 & 1)), 0LL, 1);
  int var6 = v8->var6;
  int v10 = v7->description_->var5 & 0xF02;
  if ((v7->description_->var5 & 0xF02) != 0)
  {
    SEL v11 = sub_1001110C4(0LL, *((char **)a3 + (v4 & 1)), "_Count", 0);
    uint64_t v12 = 5LL;
LABEL_7:
    (&v7->super.isa)[v12] = (Class)v11;
    goto LABEL_8;
  }

  if ((v8->var3 & 0x80000000) == 0 && (v8->var5 & 0x20) == 0)
  {
    v7->hasOrCountSel_ = sub_1001110C4("has", *((char **)a3 + (v4 & 1)), 0LL, 0);
    SEL v11 = sub_1001110C4("setHas", *((char **)a3 + (v4 & 1)), 0LL, 1);
    uint64_t v12 = 6LL;
    goto LABEL_7;
  }

- (void)dealloc
{
  description = self->description_;
  if (description->var6 == 13 && (description->var5 & 2) == 0) {

  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TransparencyGPBFieldDescriptor;
  -[TransparencyGPBFieldDescriptor dealloc](&v4, "dealloc");
}

- (unsigned)dataType
{
  return self->description_->var6;
}

- (BOOL)hasDefaultValue
{
  return (self->description_->var5 >> 4) & 1;
}

- (unsigned)number
{
  return self->description_->var2;
}

- (NSString)name
{
  return +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", self->description_->var0);
}

- (BOOL)isRequired
{
  return self->description_->var5 & 1;
}

- (BOOL)isOptional
{
  return (self->description_->var5 >> 3) & 1;
}

- (unsigned)fieldType
{
  unsigned __int16 var5 = self->description_->var5;
  if ((var5 & 2) != 0) {
    return 1;
  }
  else {
    return 2 * ((var5 & 0xF00) != 0);
  }
}

- (unsigned)mapKeyDataType
{
  uint64_t v2 = (((self->description_->var5 & 0xF00u) - 256) >> 8) - 1LL;
  else {
    return byte_10024BB40[v2];
  }
}

- (BOOL)isPackable
{
  return (self->description_->var5 >> 2) & 1;
}

- (BOOL)isValidEnumValue:(int)a3
{
  return ((uint64_t (*)(void))-[TransparencyGPBEnumDescriptor enumVerifier]( self->enumDescriptor_,  "enumVerifier"))(*(void *)&a3);
}

- (TransparencyGPBEnumDescriptor)enumDescriptor
{
  return self->enumDescriptor_;
}

- ($288B3E7DB5778AFB5AC44FB3F8CA16F3)defaultValue
{
  int64_t valueInt64 = self->defaultValue_.valueInt64;
  description = self->description_;
  if ((description->var5 & 2) == 0)
  {
    int var6 = description->var6;
    if (var6 == 13 && valueInt64 == 0)
    {
      return ($288B3E7DB5778AFB5AC44FB3F8CA16F3)sub_100137998();
    }

    else
    {
      if (valueInt64) {
        BOOL v7 = 0;
      }
      else {
        BOOL v7 = var6 == 14;
      }
      if (v7) {
        return ($288B3E7DB5778AFB5AC44FB3F8CA16F3)&stru_10028E390;
      }
    }
  }

  return ($288B3E7DB5778AFB5AC44FB3F8CA16F3)valueInt64;
}

- (id)textFormatName
{
  if ((self->description_->var5 & 0x40) != 0)
  {
    id AssociatedObject = objc_getAssociatedObject(self, &unk_10024BB3D);
    if (AssociatedObject) {
      return sub_100139F10( (char *)[AssociatedObject pointerValue],  self->description_->var2,  -[TransparencyGPBFieldDescriptor name](self, "name"));
    }
    return 0LL;
  }

  else
  {
    v3 = -[TransparencyGPBFieldDescriptor name](self, "name");
    objc_super v4 = -[NSString length](v3, "length");
    if (-[NSString hasSuffix:](v3, "hasSuffix:", @"_p"))
    {
      v3 = -[NSString substringToIndex:](v3, "substringToIndex:", v4 - 2);
      objc_super v4 = -[NSString length](v3, "length");
    }

    if ((self->description_->var5 & 2) != 0 && -[NSString hasSuffix:](v3, "hasSuffix:", @"Array"))
    {
      v3 = -[NSString substringToIndex:](v3, "substringToIndex:", v4 - 5);
      objc_super v4 = -[NSString length](v3, "length");
    }

    if (self->description_->var6 == 16)
    {
      unsigned int v5 = -[NSString characterAtIndex:](v3, "characterAtIndex:", 0LL);
      if (v5 - 97 <= 0x19) {
        return -[NSString stringByReplacingCharactersInRange:withString:]( v3,  "stringByReplacingCharactersInRange:withString:",  0LL,  1LL,  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%C",  (unsigned __int16)(v5 - 32)));
      }
      return v3;
    }

    else
    {
      BOOL v7 = +[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", v4);
      if (v4)
      {
        uint64_t v8 = 0LL;
        unsigned int v9 = 1;
        do
        {
          id v10 = (id)-[NSString characterAtIndex:](v3, "characterAtIndex:", v8);
          else {
            -[NSMutableString appendFormat:](v7, "appendFormat:", @"_%C", ((_DWORD)v10 + 32));
          }
          uint64_t v8 = v9;
        }

        while ((unint64_t)v4 > v9++);
      }
    }
  }

  return v7;
}

- (Class)msgClass
{
  return self->msgClass_;
}

- (TransparencyGPBOneofDescriptor)containingOneof
{
  return self->containingOneof_;
}

@end
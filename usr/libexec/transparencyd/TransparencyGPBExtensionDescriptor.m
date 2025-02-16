@interface TransparencyGPBExtensionDescriptor
- (BOOL)isPackable;
- (BOOL)isRepeated;
- (Class)containingMessageClass;
- (Class)msgClass;
- (NSString)singletonName;
- (TransparencyGPBEnumDescriptor)enumDescriptor;
- (TransparencyGPBExtensionDescriptor)initWithExtensionDescription:(TransparencyGPBExtensionDescription *)a3;
- (TransparencyGPBExtensionDescriptor)initWithExtensionDescription:(TransparencyGPBExtensionDescription *)a3 usesClassRefs:(BOOL)a4;
- (const)singletonNameC;
- (id)defaultValue;
- (int)alternateWireType;
- (int)wireType;
- (int64_t)compareByFieldNumber:(id)a3;
- (unsigned)dataType;
- (unsigned)fieldNumber;
- (void)dealloc;
@end

@implementation TransparencyGPBExtensionDescriptor

- (TransparencyGPBExtensionDescriptor)initWithExtensionDescription:(TransparencyGPBExtensionDescription *)a3 usesClassRefs:(BOOL)a4
{
  if (a3->var7 >= 8u) {
    sub_100137F68();
  }
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TransparencyGPBExtensionDescriptor;
  v6 = -[TransparencyGPBExtensionDescriptor init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    v6->description_ = a3;
    int var6 = a3->var6;
    if (var6 == 13)
    {
      var2 = (unsigned int *)a3->var0.var2;
      if (var2) {
        v6->defaultValue_.valueInt64 = (int64_t)-[NSData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytes:length:",  var2 + 1,  bswap32(*var2));
      }
    }

    else if ((var6 - 15) >= 2)
    {
      v6->defaultValue_.valueInt64 = a3->var0.var2;
    }
  }

  return v7;
}

- (TransparencyGPBExtensionDescriptor)initWithExtensionDescription:(TransparencyGPBExtensionDescription *)a3
{
  var0 = a3->var3.var0;
  if (var0) {
    a3->var3.var0 = (char *)objc_lookUpClass(var0);
  }
  v6 = a3->var2.var0;
  if (v6) {
    a3->var2.var0 = (char *)objc_lookUpClass(v6);
  }
  return -[TransparencyGPBExtensionDescriptor initWithExtensionDescription:usesClassRefs:]( self,  "initWithExtensionDescription:usesClassRefs:",  a3,  1LL);
}

- (void)dealloc
{
  description = self->description_;
  if (description->var6 == 13 && (description->var7 & 1) == 0) {

  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TransparencyGPBExtensionDescriptor;
  -[TransparencyGPBExtensionDescriptor dealloc](&v4, "dealloc");
}

- (NSString)singletonName
{
  return +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", self->description_->var1);
}

- (const)singletonNameC
{
  return self->description_->var1;
}

- (unsigned)fieldNumber
{
  return self->description_->var5;
}

- (unsigned)dataType
{
  return self->description_->var6;
}

- (int)wireType
{
  return sub_10013B0F0(self->description_->var6, (self->description_->var7 & 2) != 0);
}

- (int)alternateWireType
{
  return sub_10013B0F0(self->description_->var6, (self->description_->var7 & 2) == 0);
}

- (BOOL)isRepeated
{
  return self->description_->var7 & 1;
}

- (BOOL)isPackable
{
  return (self->description_->var7 >> 1) & 1;
}

- (Class)msgClass
{
  return self->description_->var3.var1.var1;
}

- (Class)containingMessageClass
{
  return self->description_->var2.var1;
}

- (TransparencyGPBEnumDescriptor)enumDescriptor
{
  description = self->description_;
  if (description->var6 == 17) {
    return (TransparencyGPBEnumDescriptor *)((uint64_t (*)(void))description->var4)();
  }
  else {
    return 0LL;
  }
}

- (id)defaultValue
{
  description = self->description_;
  if ((description->var7 & 1) != 0)
  {
    return 0LL;
  }

  else
  {
    valueData = 0LL;
    switch(description->var6)
    {
      case 0u:
        id result = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->defaultValue_.valueBool);
        break;
      case 1u:
      case 0xBu:
        id result = +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->defaultValue_.valueUInt32);
        break;
      case 2u:
      case 7u:
      case 9u:
      case 0x11u:
        id result = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->defaultValue_.valueUInt32);
        break;
      case 3u:
        LODWORD(v2) = self->defaultValue_.valueInt32;
        id result = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v2);
        break;
      case 4u:
      case 0xCu:
        id result = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->defaultValue_.valueInt64);
        break;
      case 5u:
      case 8u:
      case 0xAu:
        id result = +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  self->defaultValue_.valueInt64);
        break;
      case 6u:
        id result = +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->defaultValue_.valueDouble);
        break;
      case 0xDu:
        valueData = self->defaultValue_.valueData;
        if (valueData) {
          return valueData;
        }
        id result = (id)sub_100137998();
        break;
      case 0xEu:
        valueData = self->defaultValue_.valueData;
        if (!valueData) {
          return &stru_10028E390;
        }
        return valueData;
      default:
        return valueData;
    }
  }

  return result;
}

- (int64_t)compareByFieldNumber:(id)a3
{
  int var5 = self->description_->var5;
  int v4 = *(_DWORD *)(*((void *)a3 + 1) + 40LL);
  BOOL v5 = var5 < v4;
  int64_t v6 = var5 != v4;
  if (v5) {
    return -1LL;
  }
  else {
    return v6;
  }
}

@end
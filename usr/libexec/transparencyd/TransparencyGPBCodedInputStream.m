@interface TransparencyGPBCodedInputStream
+ (id)streamWithData:(id)a3;
- (BOOL)isAtEnd;
- (BOOL)readBool;
- (BOOL)skipField:(int)a3;
- (TransparencyGPBCodedInputStream)initWithData:(id)a3;
- (double)readDouble;
- (float)readFloat;
- (id)readBytes;
- (id)readString;
- (int)readEnum;
- (int)readInt32;
- (int)readSFixed32;
- (int)readSInt32;
- (int)readTag;
- (int64_t)readInt64;
- (int64_t)readSFixed64;
- (int64_t)readSInt64;
- (unint64_t)position;
- (unint64_t)pushLimit:(unint64_t)a3;
- (unint64_t)readFixed64;
- (unint64_t)readUInt64;
- (unsigned)readFixed32;
- (unsigned)readUInt32;
- (void)checkLastTagWas:(int)a3;
- (void)dealloc;
- (void)popLimit:(unint64_t)a3;
- (void)readGroup:(int)a3 message:(id)a4 extensionRegistry:(id)a5;
- (void)readMapEntry:(id)a3 extensionRegistry:(id)a4 field:(id)a5 parentMessage:(id)a6;
- (void)readMessage:(id)a3 extensionRegistry:(id)a4;
- (void)readUnknownGroup:(int)a3 message:(id)a4;
- (void)skipMessage;
@end

@implementation TransparencyGPBCodedInputStream

+ (id)streamWithData:(id)a3
{
  return [objc_alloc((Class)a1) initWithData:a3];
}

- (TransparencyGPBCodedInputStream)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TransparencyGPBCodedInputStream;
  v4 = -[TransparencyGPBCodedInputStream init](&v7, "init");
  if (v4)
  {
    v4->buffer_ = (NSData *)a3;
    v4->state_.bytes = (char *)[a3 bytes];
    id v5 = [a3 length];
    v4->state_.bufferSize = (unint64_t)v5;
    v4->state_.currentLimit = (unint64_t)v5;
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TransparencyGPBCodedInputStream;
  -[TransparencyGPBCodedInputStream dealloc](&v3, "dealloc");
}

- (int)readTag
{
  return sub_10010BD0C((uint64_t)&self->state_);
}

- (void)checkLastTagWas:(int)a3
{
  if (self->state_.lastTag != a3) {
    sub_10010BDC0(-103LL, @"Unexpected tag read");
  }
}

- (BOOL)skipField:(int)a3
{
  int v5 = sub_10013B0D0(a3);
  BOOL result = 0;
  switch(v5)
  {
    case 0:
      sub_10010BBA8((uint64_t *)&self->state_);
      goto LABEL_9;
    case 1:
      sub_10010BF44(&self->state_.bytes, 8LL);
      unint64_t v7 = self->state_.bufferPos + 8;
      goto LABEL_8;
    case 2:
      int v8 = sub_10010BBA8((uint64_t *)&self->state_);
      sub_10010BF44(&self->state_.bytes, v8);
      unint64_t v7 = self->state_.bufferPos + v8;
      goto LABEL_8;
    case 3:
      -[TransparencyGPBCodedInputStream skipMessage](self, "skipMessage");
      int v9 = sub_10013B0D8(a3);
      goto LABEL_9;
    case 5:
      sub_10010BF44(&self->state_.bytes, 4LL);
      unint64_t v7 = self->state_.bufferPos + 4;
LABEL_8:
      self->state_.bufferPos = v7;
LABEL_9:
      BOOL result = 1;
      break;
    default:
      return result;
  }

  return result;
}

- (void)skipMessage
{
  p_state = &self->state_;
  do
    uint64_t v4 = sub_10010BD0C((uint64_t)p_state);
  while ((_DWORD)v4 && -[TransparencyGPBCodedInputStream skipField:](self, "skipField:", v4));
}

- (BOOL)isAtEnd
{
  unint64_t bufferPos = self->state_.bufferPos;
  return bufferPos == self->state_.bufferSize || bufferPos == self->state_.currentLimit;
}

- (unint64_t)position
{
  return self->state_.bufferPos;
}

- (unint64_t)pushLimit:(unint64_t)a3
{
  unint64_t currentLimit = self->state_.currentLimit;
  unint64_t v5 = self->state_.bufferPos + a3;
  if (v5 > currentLimit) {
    sub_10010BDC0(-102LL, 0LL);
  }
  self->state_.unint64_t currentLimit = v5;
  return currentLimit;
}

- (void)popLimit:(unint64_t)a3
{
  self->state_.unint64_t currentLimit = a3;
}

- (double)readDouble
{
  unint64_t bufferPos = self->state_.bufferPos;
  double result = *(double *)&self->state_.bytes[bufferPos];
  self->state_.unint64_t bufferPos = bufferPos + 8;
  return result;
}

- (float)readFloat
{
  unint64_t bufferPos = self->state_.bufferPos;
  float result = *(float *)&self->state_.bytes[bufferPos];
  self->state_.unint64_t bufferPos = bufferPos + 4;
  return result;
}

- (unint64_t)readUInt64
{
  return sub_10010BBA8((uint64_t *)&self->state_);
}

- (int64_t)readInt64
{
  return sub_10010BBA8((uint64_t *)&self->state_);
}

- (int)readInt32
{
  return sub_10010BBA8((uint64_t *)&self->state_);
}

- (unint64_t)readFixed64
{
  unint64_t bufferPos = self->state_.bufferPos;
  unint64_t result = *(void *)&self->state_.bytes[bufferPos];
  self->state_.unint64_t bufferPos = bufferPos + 8;
  return result;
}

- (unsigned)readFixed32
{
  unint64_t bufferPos = self->state_.bufferPos;
  unsigned int result = *(_DWORD *)&self->state_.bytes[bufferPos];
  self->state_.unint64_t bufferPos = bufferPos + 4;
  return result;
}

- (BOOL)readBool
{
  return sub_10010BBA8((uint64_t *)&self->state_) != 0;
}

- (id)readString
{
  return (id)(id)sub_10010BEB4((uint64_t *)&self->state_);
}

- (void)readGroup:(int)a3 message:(id)a4 extensionRegistry:(id)a5
{
  unint64_t recursionDepth = self->state_.recursionDepth;
  if (recursionDepth >= 0x64)
  {
    sub_10010BDC0(-106LL, 0LL);
    unint64_t recursionDepth = self->state_.recursionDepth;
  }

  self->state_.unint64_t recursionDepth = recursionDepth + 1;
  [a4 mergeFromCodedInputStream:self extensionRegistry:a5];
  --self->state_.recursionDepth;
}

- (void)readUnknownGroup:(int)a3 message:(id)a4
{
  unint64_t recursionDepth = self->state_.recursionDepth;
  if (recursionDepth >= 0x64)
  {
    sub_10010BDC0(-106LL, 0LL);
    unint64_t recursionDepth = self->state_.recursionDepth;
  }

  self->state_.unint64_t recursionDepth = recursionDepth + 1;
  [a4 mergeFromCodedInputStream:self];
  --self->state_.recursionDepth;
}

- (void)readMessage:(id)a3 extensionRegistry:(id)a4
{
  p_state = (uint64_t *)&self->state_;
  if (self->state_.recursionDepth >= 0x64) {
    sub_10010BDC0(-106LL, 0LL);
  }
  int v8 = sub_10010BBA8(p_state);
  unint64_t currentLimit = self->state_.currentLimit;
  unint64_t v10 = self->state_.bufferPos + v8;
  if (v10 > currentLimit) {
    sub_10010BDC0(-102LL, 0LL);
  }
  self->state_.unint64_t currentLimit = v10;
  ++self->state_.recursionDepth;
  [a3 mergeFromCodedInputStream:self extensionRegistry:a4];
  if (self->state_.lastTag) {
    sub_10010BDC0(-103LL, @"Unexpected tag read");
  }
  --self->state_.recursionDepth;
  self->state_.unint64_t currentLimit = currentLimit;
}

- (void)readMapEntry:(id)a3 extensionRegistry:(id)a4 field:(id)a5 parentMessage:(id)a6
{
  p_state = (uint64_t *)&self->state_;
  if (self->state_.recursionDepth >= 0x64) {
    sub_10010BDC0(-106LL, 0LL);
  }
  int v12 = sub_10010BBA8(p_state);
  unint64_t currentLimit = self->state_.currentLimit;
  unint64_t v14 = self->state_.bufferPos + v12;
  if (v14 > currentLimit) {
    sub_10010BDC0(-102LL, 0LL);
  }
  self->state_.unint64_t currentLimit = v14;
  ++self->state_.recursionDepth;
  sub_10011267C(a3, (uint64_t *)self, (uint64_t)a4, a5, a6);
  if (self->state_.lastTag) {
    sub_10010BDC0(-103LL, @"Unexpected tag read");
  }
  --self->state_.recursionDepth;
  self->state_.unint64_t currentLimit = currentLimit;
}

- (id)readBytes
{
  return sub_10010BFA0((uint64_t *)&self->state_);
}

- (unsigned)readUInt32
{
  return sub_10010BBA8((uint64_t *)&self->state_);
}

- (int)readEnum
{
  return sub_10010BBA8((uint64_t *)&self->state_);
}

- (int)readSFixed32
{
  unint64_t bufferPos = self->state_.bufferPos;
  int result = *(_DWORD *)&self->state_.bytes[bufferPos];
  self->state_.unint64_t bufferPos = bufferPos + 4;
  return result;
}

- (int64_t)readSFixed64
{
  unint64_t bufferPos = self->state_.bufferPos;
  int64_t result = *(void *)&self->state_.bytes[bufferPos];
  self->state_.unint64_t bufferPos = bufferPos + 8;
  return result;
}

- (int)readSInt32
{
  unsigned int v2 = sub_10010BBA8((uint64_t *)&self->state_);
  return -(v2 & 1) ^ (v2 >> 1);
}

- (int64_t)readSInt64
{
  unint64_t v2 = sub_10010BBA8((uint64_t *)&self->state_);
  return -(uint64_t)(v2 & 1) ^ (v2 >> 1);
}

@end
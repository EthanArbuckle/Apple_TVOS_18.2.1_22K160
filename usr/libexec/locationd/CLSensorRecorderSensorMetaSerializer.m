@interface CLSensorRecorderSensorMetaSerializer
+ (void)deserializeMeta:(id)a3 fromData:(id)a4;
+ (void)serializeMeta:(id)a3 toData:(id)a4;
- (BOOL)readMeta:(id)a3 fromHandle:(id)a4;
- (CLSensorRecorderSensorMetaSerializer)init;
- (void)dealloc;
- (void)writeMeta:(id)a3 toHandle:(id)a4;
@end

@implementation CLSensorRecorderSensorMetaSerializer

- (CLSensorRecorderSensorMetaSerializer)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CLSensorRecorderSensorMetaSerializer;
  v2 = -[CLSensorRecorderSensorMetaSerializer init](&v4, "init");
  if (v2) {
    v2->fBuffer = -[NSMutableData initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithCapacity:", 20LL);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLSensorRecorderSensorMetaSerializer;
  -[CLSensorRecorderSensorMetaSerializer dealloc](&v3, "dealloc");
}

+ (void)serializeMeta:(id)a3 toData:(id)a4
{
  unsigned int v9 = bswap32([a3 dataSize]);
  [a4 appendBytes:&v9 length:4];
  unint64_t v8 = bswap64((unint64_t)[a3 timestamp]);
  [a4 appendBytes:&v8 length:8];
  [a3 startTime];
  uint64_t v7 = v6;
  [a4 appendBytes:&v7 length:8];
}

+ (void)deserializeMeta:(id)a3 fromData:(id)a4
{
}

- (void)writeMeta:(id)a3 toHandle:(id)a4
{
}

- (BOOL)readMeta:(id)a3 fromHandle:(id)a4
{
  NSUInteger v6 = -[NSMutableData length](self->fBuffer, "length");
  if (v6 == 20) {
    +[CLSensorRecorderSensorMetaSerializer deserializeMeta:fromData:]( &OBJC_CLASS___CLSensorRecorderSensorMetaSerializer,  "deserializeMeta:fromData:",  a3,  self->fBuffer);
  }
  return v6 == 20;
}

@end
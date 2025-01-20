@interface TransparencyGPBSourceContext
+ (id)descriptor;
@end

@implementation TransparencyGPBSourceContext

+ (id)descriptor
{
  id result = (id)qword_1002EE728;
  if (!qword_1002EE728)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___TransparencyGPBSourceContext,  @"SourceContext",  off_1002E35E0,  &off_1002E35C0,  1LL,  16LL,  v3);
    qword_1002EE728 = (uint64_t)result;
  }

  return result;
}

@end
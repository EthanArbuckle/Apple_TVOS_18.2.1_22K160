@interface VRFPublicKey
+ (id)descriptor;
- (BOOL)needsRefresh;
- (void)setNeedsRefresh:(BOOL)a3;
@end

@implementation VRFPublicKey

+ (id)descriptor
{
  id v2 = (id)qword_1002EE940;
  if (!qword_1002EE940)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___VRFPublicKey,  @"VRFPublicKey",  &unk_1002E4B60,  &off_1002E4B78,  2LL,  16LL,  v4);
    [v2 setupExtraTextInfo:&unk_10024C408];
    qword_1002EE940 = (uint64_t)v2;
  }

  return v2;
}

- (BOOL)needsRefresh
{
  id AssociatedObject = objc_getAssociatedObject(self, @"needsRefresh");
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setNeedsRefresh:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  objc_setAssociatedObject(self, @"needsRefresh", v4, (void *)1);
}

@end
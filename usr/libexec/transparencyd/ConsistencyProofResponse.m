@interface ConsistencyProofResponse
+ (id)descriptor;
- (NSDictionary)metadata;
- (void)setMetadata:(id)a3;
- (void)setMetadataValue:(id)a3 key:(id)a4;
@end

@implementation ConsistencyProofResponse

+ (id)descriptor
{
  id v2 = (id)qword_1002EE8B0;
  if (!qword_1002EE8B0)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___ConsistencyProofResponse,  @"ConsistencyProofResponse",  &unk_1002E46D0,  &off_1002E4728,  4LL,  24LL,  v4);
    [v2 setupExtraTextInfo:&unk_10024C0A8];
    qword_1002EE8B0 = (uint64_t)v2;
  }

  return v2;
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getAssociatedObject(self, @"metadata");
}

- (void)setMetadata:(id)a3
{
}

- (void)setMetadataValue:(id)a3 key:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConsistencyProofResponse metadata](self, "metadata"));
    v8 = (NSMutableDictionary *)[v7 mutableCopy];

    if (!v8) {
      v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v9, v6);
    -[ConsistencyProofResponse setMetadata:](self, "setMetadata:", v8);
  }
}

@end
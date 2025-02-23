@interface PublicKeysResponse
+ (id)descriptor;
- (NSDictionary)metadata;
- (void)setMetadata:(id)a3;
- (void)setMetadataValue:(id)a3 key:(id)a4;
@end

@implementation PublicKeysResponse

+ (id)descriptor
{
  id v2 = (id)qword_1002EE8D8;
  if (!qword_1002EE8D8)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___PublicKeysResponse,  @"PublicKeysResponse",  &unk_1002E46D0,  &off_1002E4948,  11LL,  88LL,  v4);
    [v2 setupExtraTextInfo:&unk_10024C0CF];
    qword_1002EE8D8 = (uint64_t)v2;
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
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PublicKeysResponse metadata](self, "metadata"));
    v8 = (NSMutableDictionary *)[v7 mutableCopy];

    if (!v8) {
      v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v9, v6);
    -[PublicKeysResponse setMetadata:](self, "setMetadata:", v8);
  }
}

@end
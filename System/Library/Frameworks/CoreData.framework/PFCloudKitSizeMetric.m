@interface PFCloudKitSizeMetric
- (PFCloudKitSizeMetric)initWithContainerIdentifier:(id)a3;
- (id)payload;
- (uint64_t)addByteSize:(uint64_t)result;
- (void)dealloc;
@end

@implementation PFCloudKitSizeMetric

- (PFCloudKitSizeMetric)initWithContainerIdentifier:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PFCloudKitSizeMetric;
  v3 = -[PFCloudKitBaseMetric initWithContainerIdentifier:](&v5, sel_initWithContainerIdentifier_, a3);
  if (v3) {
    v3->_sizeInBytes = (NSNumber *)[objc_alloc(MEMORY[0x189607968]) initWithInt:0];
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PFCloudKitSizeMetric;
  -[PFCloudKitBaseMetric dealloc](&v3, sel_dealloc);
}

- (uint64_t)addByteSize:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = [*(id *)(result + 24) unsignedIntegerValue] + a2;

    result = [objc_alloc(MEMORY[0x189607968]) initWithUnsignedInteger:v3];
    *(void *)(v2 + 24) = result;
  }

  return result;
}

- (id)payload
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PFCloudKitSizeMetric;
  uint64_t v3 = (void *)-[NSDictionary mutableCopy](-[PFCloudKitBaseMetric payload](&v6, sel_payload), "mutableCopy");
  sizeInBytes = self->_sizeInBytes;
  if (!sizeInBytes) {
    sizeInBytes = (NSNumber *)[MEMORY[0x189603FE8] null];
  }
  [v3 setValue:sizeInBytes forKey:@"sizeInBytes"];
  return v3;
}

@end
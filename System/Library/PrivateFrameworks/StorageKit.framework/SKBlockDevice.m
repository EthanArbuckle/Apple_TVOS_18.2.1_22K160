@interface SKBlockDevice
- (id)copyIOMedia;
@end

@implementation SKBlockDevice

- (id)copyIOMedia
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[SKIOObject initWithSKIOObject:](objc_alloc(&OBJC_CLASS___SKIOMedia), "initWithSKIOObject:", v2);

  return v3;
}

@end
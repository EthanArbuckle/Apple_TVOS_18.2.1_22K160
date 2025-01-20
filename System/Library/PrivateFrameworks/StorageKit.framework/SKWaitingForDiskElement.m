@interface SKWaitingForDiskElement
- (NSDictionary)diskDictionary;
- (id)block;
- (void)setBlock:(id)a3;
- (void)setDiskDictionary:(id)a3;
@end

@implementation SKWaitingForDiskElement

- (NSDictionary)diskDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setDiskDictionary:(id)a3
{
}

- (id)block
{
  return objc_getProperty(self, a2, 16LL, 1);
}

- (void)setBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface NRDevice
- (NSString)name;
@end

@implementation NRDevice

- (NSString)name
{
  return (NSString *)-[NRDevice valueForProperty:](self, "valueForProperty:", NRDevicePropertyName);
}

@end
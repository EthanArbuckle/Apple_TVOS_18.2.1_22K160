@interface HIDSession(HIDFramework)
- (BOOL)setProperty:()HIDFramework forKey:;
- (uint64_t)propertyForKey:()HIDFramework;
@end

@implementation HIDSession(HIDFramework)

- (uint64_t)propertyForKey:()HIDFramework
{
  return IOHIDSessionGetProperty();
}

- (BOOL)setProperty:()HIDFramework forKey:
{
  return IOHIDSessionSetProperty() != 0;
}

@end
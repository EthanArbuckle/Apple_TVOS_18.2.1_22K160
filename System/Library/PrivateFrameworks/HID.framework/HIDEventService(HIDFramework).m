@interface HIDEventService(HIDFramework)
- (BOOL)conformsToUsagePage:()HIDFramework usage:;
- (BOOL)setProperty:()HIDFramework forKey:;
- (id)eventMatching:()HIDFramework;
- (id)propertyForKey:()HIDFramework;
- (uint64_t)serviceID;
@end

@implementation HIDEventService(HIDFramework)

- (id)propertyForKey:()HIDFramework
{
  return (id)IOHIDServiceCopyProperty();
}

- (BOOL)setProperty:()HIDFramework forKey:
{
  return IOHIDServiceSetProperty() != 0;
}

- (BOOL)conformsToUsagePage:()HIDFramework usage:
{
  return IOHIDServiceConformsTo() != 0;
}

- (id)eventMatching:()HIDFramework
{
  return (id)IOHIDServiceCopyMatchingEvent();
}

- (uint64_t)serviceID
{
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0) {
    uint64_t v2 = [v0 unsignedLongLongValue];
  }
  else {
    uint64_t v2 = 0LL;
  }

  return v2;
}

@end
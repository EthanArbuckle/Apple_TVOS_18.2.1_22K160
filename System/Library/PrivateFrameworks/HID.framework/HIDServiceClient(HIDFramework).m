@interface HIDServiceClient(HIDFramework)
- (BOOL)conformsToUsagePage:()HIDFramework usage:;
- (BOOL)setProperty:()HIDFramework forKey:;
- (CFTypeRef)propertyForKey:()HIDFramework;
- (id)eventMatching:()HIDFramework;
- (id)propertiesForKeys:()HIDFramework;
- (uint64_t)serviceID;
- (void)setRemovalHandler:()HIDFramework;
@end

@implementation HIDServiceClient(HIDFramework)

- (CFTypeRef)propertyForKey:()HIDFramework
{
  return (id)IOHIDServiceClientCopyProperty(a1, key);
}

- (id)propertiesForKeys:()HIDFramework
{
  return (id)IOHIDServiceClientCopyProperties();
}

- (BOOL)setProperty:()HIDFramework forKey:
{
  return IOHIDServiceClientSetProperty(a1, key, a3) != 0;
}

- (BOOL)conformsToUsagePage:()HIDFramework usage:
{
  return IOHIDServiceClientConformsTo(a1, usagePage, usage) != 0;
}

- (id)eventMatching:()HIDFramework
{
  return (id)IOHIDServiceClientCopyMatchingEvent();
}

- (void)setRemovalHandler:()HIDFramework
{
  id aBlock = a3;
  uint64_t v4 = a1 + (int)*MEMORY[0x1896085D0];
  os_unfair_recursive_lock_lock_with_options();
  if (*(void *)(v4 + 112)) {
    -[HIDServiceClient(HIDFramework) setRemovalHandler:].cold.1();
  }
  *(void *)(v4 + 112) = _Block_copy(aBlock);
  os_unfair_recursive_lock_unlock();
  IOHIDServiceClientRegisterRemovalCallback();
}

- (uint64_t)serviceID
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 unsignedLongLongValue];
  }
  else {
    uint64_t v3 = 0LL;
  }

  return v3;
}

- (void)setRemovalHandler:()HIDFramework .cold.1()
{
}

@end
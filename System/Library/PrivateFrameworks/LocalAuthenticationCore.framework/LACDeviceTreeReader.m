@interface LACDeviceTreeReader
+ (id)getDataFromPath:(const char *)a3 propertyName:(__CFString *)a4;
@end

@implementation LACDeviceTreeReader

+ (id)getDataFromPath:(const char *)a3 propertyName:(__CFString *)a4
{
  io_registry_entry_t v5 = IORegistryEntryFromPath(*MEMORY[0x1896086A8], a3);
  if (!v5) {
    goto LABEL_6;
  }
  io_object_t v6 = v5;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v5, a4, (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
  if (!CFProperty)
  {
LABEL_5:
    IOObjectRelease(v6);
LABEL_6:
    v8 = 0LL;
    return v8;
  }

  v8 = (void *)CFProperty;
  CFTypeID v9 = CFGetTypeID(CFProperty);
  if (v9 != CFDataGetTypeID())
  {
    CFRelease(v8);
    goto LABEL_5;
  }

  return v8;
}

@end
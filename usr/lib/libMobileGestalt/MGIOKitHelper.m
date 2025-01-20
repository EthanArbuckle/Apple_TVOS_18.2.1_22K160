@interface MGIOKitHelper
- (BOOL)createServicesIteratorByNameMatch:(const char *)a3;
- (BOOL)createTreeIterator:(const char *)a3;
- (MGIOKitHelper)init;
- (__CFArray)iteratorCopyBusyServiceNames;
- (__CFBoolean)copyBooleanFromServiceTree:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6;
- (__CFData)copyDataFromDeviceTree:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6;
- (__CFData)copyDataFromServiceTree:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6;
- (__CFDictionary)deviceTreeNodeIsPresent:(__CFString *)a3 withExactName:(BOOL)a4 withNodeClass:(__CFString *)a5;
- (__CFNumber)copyNumberFromData:(__CFData *)a3;
- (__CFNumber)copyNumberFromDeviceTree:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6;
- (__CFString)copyStringFromDeviceTree:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6;
- (__CFString)copyStringFromServiceTree:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6;
- (unsigned)copyDeviceTreeStructureNext:(id)a3 withFirstChar:(char)a4;
- (void)copyDeviceTreeProperty:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6;
- (void)copyPropertyFromServiceTree:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6;
- (void)copyServiceTreeProperty:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6;
- (void)dealloc;
- (void)deleteIterator;
@end

@implementation MGIOKitHelper

- (void)deleteIterator
{
  io_object_t devIterator = self->devIterator;
  if (devIterator)
  {
    IOObjectRelease(devIterator);
    self->io_object_t devIterator = 0;
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MGIOKitHelper;
  -[MGIOKitHelper dealloc](&v3, sel_dealloc);
}

- (MGIOKitHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MGIOKitHelper;
  result = -[MGIOKitHelper init](&v3, sel_init);
  if (result) {
    result->io_object_t devIterator = 0;
  }
  return result;
}

- (BOOL)createTreeIterator:(const char *)a3
{
  return IORegistryCreateIterator(*MEMORY[0x1896086A8], a3, 1u, &self->devIterator) == 0;
}

- (BOOL)createServicesIteratorByNameMatch:(const char *)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  -[MGIOKitHelper deleteIterator](self, "deleteIterator");
  v5 = IOServiceNameMatching(a3);
  if (v5) {
    return IOServiceGetMatchingServices(*MEMORY[0x1896086A8], v5, &self->devIterator) == 0;
  }
  v7 = rindex( "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m",  47);
  if (v7) {
    v13 = v7 + 1;
  }
  else {
    v13 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
  }
  _MGLog((uint64_t)v13, 69LL, (uint64_t)@"Failed to create iterator: %s ", v8, v9, v10, v11, v12, (char)a3);
  BOOL v14 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v14)
  {
    *(_DWORD *)buf = 136315138;
    v16 = a3;
    _os_log_impl( &dword_180741000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Failed to create iterator: %s ",  buf,  0xCu);
    return 0;
  }

  return result;
}

- (unsigned)copyDeviceTreeStructureNext:(id)a3 withFirstChar:(char)a4
{
  int v4 = a4;
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  for (uint64_t i = IOIteratorNext(self->devIterator); (_DWORD)i; uint64_t i = IOIteratorNext(self->devIterator))
  {
    memset(v11, 0, sizeof(v11));
    if (!MEMORY[0x186E02054](i, v11))
    {
      [NSString stringWithUTF8String:v11];
      uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = v8;
      if (v4)
      {
        if (sub_1807438A0(v8, v6, v4)) {
          goto LABEL_10;
        }
      }

      else if (!-[__CFString compare:options:](v8, "compare:options:", v6, 1LL))
      {
LABEL_10:

        break;
      }

      IOObjectRelease(i);
    }
  }

  return i;
}

- (void)copyServiceTreeProperty:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6
{
  int v6 = a6;
  id v9 = a3;
  uint64_t v10 = (__CFString *)a5;
  uint64_t v11 = v10;
  uint64_t v12 = 0LL;
  if (v9 && v10)
  {
    while (1)
    {
      io_object_t v13 = IOIteratorNext(self->devIterator);
      if (!v13) {
        break;
      }
      io_registry_entry_t v14 = v13;
      CFStringRef v15 = IOObjectCopyClass(v13);
      if (v15)
      {
        CFStringRef v16 = v15;
        if (CFEqual(v15, v9)
          && (CFTypeRef v17 = IORegistryEntryCreateCFProperty(v14, @"IORegistryEntryPropertyKeys", 0LL, 0)) != 0LL)
        {
          v18 = v17;
          if (v6) {
            CFTypeRef CFProperty = sub_18074498C(v14, v17, v11, v6);
          }
          else {
            CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v14, v11, 0LL, 0);
          }
          uint64_t v12 = (void *)CFProperty;
          CFRelease(v18);
        }

        else
        {
          uint64_t v12 = 0LL;
        }

        CFRelease(v16);
      }

      else
      {
        uint64_t v12 = 0LL;
      }

      IOObjectRelease(v14);
      if (v12) {
        goto LABEL_17;
      }
    }

    uint64_t v12 = 0LL;
  }

- (__CFDictionary)deviceTreeNodeIsPresent:(__CFString *)a3 withExactName:(BOOL)a4 withNodeClass:(__CFString *)a5
{
  kern_return_t CFProperties;
  mach_error_t v20;
  char *v21;
  const char *v22;
  __CFString *v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  CFTypeRef cf;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  char *v36;
  io_name_t className;
  uint64_t v38;
  BOOL v6 = a4;
  v38 = *MEMORY[0x1895F89C0];
  cf = 0LL;
  uint64_t v8 = a3;
  id v9 = a5;
  uint64_t v10 = IOIteratorNext(self->devIterator);
  if (!(_DWORD)v10)
  {
    io_object_t v13 = 0LL;
    uint64_t v12 = 0LL;
    goto LABEL_14;
  }

  uint64_t v11 = v10;
  uint64_t v12 = 0LL;
  io_object_t v13 = 0LL;
  while (1)
  {
    io_registry_entry_t v14 = v13;
    if (v9)
    {
      IOObjectGetClass(v11, className);
      uint64_t v15 = [NSString stringWithUTF8String:className];

      int v16 = -[__CFString isEqualToString:](v9, "isEqualToString:", v15);
      uint64_t v12 = (void *)v15;
    }

    else
    {
      int v16 = 1;
    }

    MEMORY[0x186E02054](v11, className);
    [NSString stringWithUTF8String:className];
    io_object_t v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16) {
      goto LABEL_11;
    }
    if (!v6) {
      break;
    }
    if ([v13 isEqualToString:v8]) {
      goto LABEL_18;
    }
LABEL_11:
    IOObjectRelease(v11);
    uint64_t v11 = IOIteratorNext(self->devIterator);
    if (!(_DWORD)v11) {
      goto LABEL_14;
    }
  }

- (void)copyDeviceTreeProperty:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6
{
  int v6 = a6;
  uint64_t v7 = a4;
  uint64_t v10 = (__CFString *)a5;
  while (1)
  {
    io_registry_entry_t v11 = -[MGIOKitHelper copyDeviceTreeStructureNext:withFirstChar:]( self,  "copyDeviceTreeStructureNext:withFirstChar:",  a3,  v7);
    if (!v11) {
      break;
    }
    io_registry_entry_t v12 = v11;
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v11, @"IORegistryEntryPropertyKeys", 0LL, 0);
    if (CFProperty)
    {
      io_registry_entry_t v14 = CFProperty;
      if (v6) {
        CFTypeRef v15 = sub_18074498C(v12, CFProperty, v10, v6);
      }
      else {
        CFTypeRef v15 = IORegistryEntryCreateCFProperty(v12, v10, 0LL, 0);
      }
      int v16 = (void *)v15;
      CFRelease(v14);
    }

    else
    {
      int v16 = 0LL;
    }

    IOObjectRelease(v12);
    if (v16) {
      goto LABEL_12;
    }
  }

  int v16 = 0LL;
LABEL_12:

  return v16;
}

- (__CFNumber)copyNumberFromData:(__CFData *)a3
{
  if (!a3) {
    return 0LL;
  }
  CFTypeID v4 = CFGetTypeID(a3);
  if (v4 != CFDataGetTypeID())
  {
    uint64_t v8 = rindex( "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m",  47);
    if (v8) {
      io_registry_entry_t v14 = v8 + 1;
    }
    else {
      io_registry_entry_t v14 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
    }
    _MGLog((uint64_t)v14, 279LL, (uint64_t)@"can't create number", v9, v10, v11, v12, v13, v26);
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
      return 0LL;
    }
    __int16 v26 = 0;
    CFTypeRef v15 = (os_log_s *)MEMORY[0x1895F8DA0];
    int v16 = "can't create number";
    CFTypeRef v17 = (uint8_t *)&v26;
LABEL_18:
    _os_log_impl(&dword_180741000, v15, OS_LOG_TYPE_DEFAULT, v16, v17, 2u);
    return 0LL;
  }

  CFIndex Length = CFDataGetLength(a3);
  if (Length >= 8)
  {
    BytePtr = CFDataGetBytePtr(a3);
    return CFNumberCreate(0LL, kCFNumberSInt64Type, BytePtr);
  }

  if (Length != 4)
  {
    v19 = rindex( "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m",  47);
    if (v19) {
      v25 = v19 + 1;
    }
    else {
      v25 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
    }
    _MGLog((uint64_t)v25, 276LL, (uint64_t)@"can't create number from data", v20, v21, v22, v23, v24, v26);
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
      return 0LL;
    }
    *(_WORD *)buf = 0;
    CFTypeRef v15 = (os_log_s *)MEMORY[0x1895F8DA0];
    int v16 = "can't create number from data";
    CFTypeRef v17 = buf;
    goto LABEL_18;
  }

  v18 = CFDataGetBytePtr(a3);
  return CFNumberCreate(0LL, kCFNumberSInt32Type, v18);
}

- (__CFNumber)copyNumberFromDeviceTree:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6
{
  uint64_t v6 = a6;
  uint64_t v8 = a4;
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = -[MGIOKitHelper copyDeviceTreeProperty:withFirstChar:propertyName:withPropertyFirstChar:]( self,  "copyDeviceTreeProperty:withFirstChar:propertyName:withPropertyFirstChar:",  v10,  v8,  v11,  v6);
  if (v12)
  {
    uint64_t v13 = v12;
    io_registry_entry_t v14 = -[MGIOKitHelper copyNumberFromData:](self, "copyNumberFromData:", v12);
    CFRelease(v13);
  }

  else
  {
    CFTypeRef v15 = rindex( "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m",  47);
    if (v15) {
      uint64_t v21 = v15 + 1;
    }
    else {
      uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
    }
    _MGLog((uint64_t)v21, 301LL, (uint64_t)@"Failed to retrieve data %@:%@", v16, v17, v18, v19, v20, (char)v10);
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v10;
      __int16 v25 = 2112;
      id v26 = v11;
      _os_log_impl( &dword_180741000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Failed to retrieve data %@:%@",  buf,  0x16u);
    }

    io_registry_entry_t v14 = 0LL;
  }

  return v14;
}

- (__CFString)copyStringFromDeviceTree:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6
{
  uint64_t v6 = a6;
  uint64_t v8 = a4;
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = -[MGIOKitHelper copyDeviceTreeProperty:withFirstChar:propertyName:withPropertyFirstChar:]( self,  "copyDeviceTreeProperty:withFirstChar:propertyName:withPropertyFirstChar:",  v10,  v8,  v11,  v6);
  if (v12)
  {
    uint64_t v13 = v12;
    CFTypeID TypeID = CFDataGetTypeID();
    if (TypeID == CFGetTypeID(v13))
    {
      Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
      BytePtr = CFDataGetBytePtr(v13);
      CFIndex Length = CFDataGetLength(v13);
      if (Length >= 1)
      {
        CFIndex v18 = Length;
        do
        {
          unsigned int v19 = *BytePtr++;
          CFStringAppendFormat(Mutable, 0LL, @"%X", v19);
          --v18;
        }

        while (v18);
      }

- (__CFString)copyStringFromServiceTree:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6
{
  uint64_t v6 = a6;
  uint64_t v8 = a4;
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = -[MGIOKitHelper copyServiceTreeProperty:withFirstChar:propertyName:withPropertyFirstChar:]( self,  "copyServiceTreeProperty:withFirstChar:propertyName:withPropertyFirstChar:",  v10,  v8,  v11,  v6);
  if (v12)
  {
    uint64_t v13 = v12;
    CFTypeID TypeID = CFDataGetTypeID();
    if (TypeID == CFGetTypeID(v13))
    {
      Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
      BytePtr = CFDataGetBytePtr(v13);
      CFIndex Length = CFDataGetLength(v13);
      if (Length >= 1)
      {
        CFIndex v18 = Length;
        do
        {
          unsigned int v19 = *BytePtr++;
          CFStringAppendFormat(Mutable, 0LL, @"%X", v19);
          --v18;
        }

        while (v18);
      }

- (void)copyPropertyFromServiceTree:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6
{
  uint64_t v6 = a6;
  uint64_t v8 = a4;
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = -[MGIOKitHelper copyServiceTreeProperty:withFirstChar:propertyName:withPropertyFirstChar:]( self,  "copyServiceTreeProperty:withFirstChar:propertyName:withPropertyFirstChar:",  v10,  v8,  v11,  v6);
  if (!v12)
  {
    uint64_t v13 = rindex( "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m",  47);
    if (v13) {
      unsigned int v19 = v13 + 1;
    }
    else {
      unsigned int v19 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
    }
    _MGLog((uint64_t)v19, 394LL, (uint64_t)@"Failed to retrieve data %@:%@", v14, v15, v16, v17, v18, (char)v10);
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v22 = v10;
      __int16 v23 = 2112;
      id v24 = v11;
      _os_log_impl( &dword_180741000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Failed to retrieve data %@:%@",  buf,  0x16u);
    }
  }

  return v12;
}

- (__CFData)copyDataFromServiceTree:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6
{
  uint64_t v6 = a6;
  uint64_t v8 = a4;
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = -[MGIOKitHelper copyServiceTreeProperty:withFirstChar:propertyName:withPropertyFirstChar:]( self,  "copyServiceTreeProperty:withFirstChar:propertyName:withPropertyFirstChar:",  v10,  v8,  v11,  v6);
  if (!v12)
  {
    id v22 = rindex( "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m",  47);
    if (v22) {
      v28 = v22 + 1;
    }
    else {
      v28 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
    }
    _MGLog((uint64_t)v28, 415LL, (uint64_t)@"Failed to retrieve data %@:%@", v23, v24, v25, v26, v27, (char)v10);
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v31 = v10;
      __int16 v32 = 2112;
      id v33 = v11;
      _os_log_impl( &dword_180741000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Failed to retrieve data %@:%@",  buf,  0x16u);
    }

    goto LABEL_14;
  }

  uint64_t v13 = v12;
  CFTypeID TypeID = CFDataGetTypeID();
  if (TypeID != CFGetTypeID(v13))
  {
    uint64_t v15 = rindex( "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m",  47);
    if (v15) {
      uint64_t v21 = v15 + 1;
    }
    else {
      uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
    }
    _MGLog((uint64_t)v21, 421LL, (uint64_t)@"Unsupported type: %@", v16, v17, v18, v19, v20, (char)v13);
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v13;
      _os_log_impl(&dword_180741000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Unsupported type: %@", buf, 0xCu);
    }

    CFRelease(v13);
LABEL_14:
    uint64_t v13 = 0LL;
  }

  return (__CFData *)v13;
}

- (__CFData)copyDataFromDeviceTree:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6
{
  uint64_t v6 = a6;
  uint64_t v8 = a4;
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = -[MGIOKitHelper copyDeviceTreeProperty:withFirstChar:propertyName:withPropertyFirstChar:]( self,  "copyDeviceTreeProperty:withFirstChar:propertyName:withPropertyFirstChar:",  v10,  v8,  v11,  v6);
  if (!v12)
  {
    id v22 = rindex( "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m",  47);
    if (v22) {
      v28 = v22 + 1;
    }
    else {
      v28 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
    }
    _MGLog((uint64_t)v28, 440LL, (uint64_t)@"Failed to retrieve data %@:%@", v23, v24, v25, v26, v27, (char)v10);
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v31 = v10;
      __int16 v32 = 2112;
      id v33 = v11;
      _os_log_impl( &dword_180741000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Failed to retrieve data %@:%@",  buf,  0x16u);
    }

    goto LABEL_14;
  }

  uint64_t v13 = v12;
  CFTypeID TypeID = CFDataGetTypeID();
  if (TypeID != CFGetTypeID(v13))
  {
    uint64_t v15 = rindex( "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m",  47);
    if (v15) {
      uint64_t v21 = v15 + 1;
    }
    else {
      uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
    }
    _MGLog((uint64_t)v21, 446LL, (uint64_t)@"Unsupported type: %@", v16, v17, v18, v19, v20, (char)v13);
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v13;
      _os_log_impl(&dword_180741000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Unsupported type: %@", buf, 0xCu);
    }

    CFRelease(v13);
LABEL_14:
    uint64_t v13 = 0LL;
  }

  return (__CFData *)v13;
}

- (__CFBoolean)copyBooleanFromServiceTree:(id)a3 withFirstChar:(char)a4 propertyName:(id)a5 withPropertyFirstChar:(char)a6
{
  uint64_t v6 = a6;
  uint64_t v8 = a4;
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = -[MGIOKitHelper copyServiceTreeProperty:withFirstChar:propertyName:withPropertyFirstChar:]( self,  "copyServiceTreeProperty:withFirstChar:propertyName:withPropertyFirstChar:",  v10,  v8,  v11,  v6);
  if (!v12)
  {
    id v22 = rindex( "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m",  47);
    if (v22) {
      v28 = v22 + 1;
    }
    else {
      v28 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
    }
    _MGLog((uint64_t)v28, 467LL, (uint64_t)@"Failed to retrieve data %@:%@", v23, v24, v25, v26, v27, (char)v10);
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v31 = v10;
      __int16 v32 = 2112;
      id v33 = v11;
      _os_log_impl( &dword_180741000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Failed to retrieve data %@:%@",  buf,  0x16u);
    }

    goto LABEL_14;
  }

  uint64_t v13 = v12;
  CFTypeID TypeID = CFBooleanGetTypeID();
  if (TypeID != CFGetTypeID(v13))
  {
    uint64_t v15 = rindex( "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m",  47);
    if (v15) {
      uint64_t v21 = v15 + 1;
    }
    else {
      uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
    }
    _MGLog((uint64_t)v21, 473LL, (uint64_t)@"Unsupported type: %@", v16, v17, v18, v19, v20, (char)v13);
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v13;
      _os_log_impl(&dword_180741000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Unsupported type: %@", buf, 0xCu);
    }

    CFRelease(v13);
LABEL_14:
    uint64_t v13 = 0LL;
  }

  return (__CFBoolean *)v13;
}

- (__CFArray)iteratorCopyBusyServiceNames
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  Mutable = CFArrayCreateMutable(0LL, 0LL, MEMORY[0x189605228]);
  io_object_t v4 = IOIteratorNext(self->devIterator);
  if (v4)
  {
    io_object_t v5 = v4;
    uint64_t v6 = (os_log_s *)MEMORY[0x1895F8DA0];
    do
    {
      CFStringRef v7 = IOObjectCopyClass(v5);
      if (v7)
      {
        CFStringRef v8 = v7;
        uint32_t busyState = -1;
        if (IOServiceGetBusyState(v5, &busyState))
        {
          uint64_t v9 = rindex( "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m",  47);
          if (v9) {
            uint64_t v15 = v9 + 1;
          }
          else {
            uint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
          }
          _MGLog( (uint64_t)v15,  499LL,  (uint64_t)@"Failed to get busy state for service: %@",  v10,  v11,  v12,  v13,  v14,  (char)v8);
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            CFStringRef v27 = v8;
            _os_log_impl( &dword_180741000,  v6,  OS_LOG_TYPE_DEFAULT,  "Failed to get busy state for service: %@",  buf,  0xCu);
          }
        }

        else if (busyState)
        {
          uint64_t v16 = rindex( "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m",  47);
          if (v16) {
            id v22 = v16 + 1;
          }
          else {
            id v22 = "/Library/Caches/com.apple.xbs/Sources/MobileGestalt/libMobileGestalt/IORegistryUtilities/MGIOKitHelper.m";
          }
          _MGLog( (uint64_t)v22,  495LL,  (uint64_t)@"Found busy service: %@: busyState: %d",  v17,  v18,  v19,  v20,  v21,  (char)v8);
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            CFStringRef v27 = v8;
            __int16 v28 = 1024;
            uint32_t v29 = busyState;
            _os_log_impl(&dword_180741000, v6, OS_LOG_TYPE_DEFAULT, "Found busy service: %@: busyState: %d", buf, 0x12u);
          }

          CFArrayAppendValue(Mutable, v8);
        }

        CFRelease(v8);
      }

      IOObjectRelease(v5);
      io_object_t v5 = IOIteratorNext(self->devIterator);
    }

    while (v5);
  }

  Copy = CFArrayCreateCopy(0LL, Mutable);
  CFRelease(Mutable);
  return Copy;
}

@end
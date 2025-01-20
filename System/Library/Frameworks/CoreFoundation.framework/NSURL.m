@interface NSURL
+ (BOOL)supportsSecureCoding;
+ (BOOL)writeBookmarkData:(NSData *)bookmarkData toURL:(NSURL *)bookmarkFileURL options:(NSURLBookmarkFileCreationOptions)options error:(NSError *)error;
+ (NSData)bookmarkDataWithContentsOfURL:(NSURL *)bookmarkFileURL error:(NSError *)error;
+ (NSDictionary)resourceValuesForKeys:(NSArray *)keys fromBookmarkData:(NSData *)bookmarkData;
+ (id)__unurl;
- (BOOL)getResourceValue:(id *)value forKey:(NSURLResourceKey)key error:(NSError *)error;
- (BOOL)isFileReferenceURL;
- (BOOL)setResourceValue:(id)value forKey:(NSURLResourceKey)key error:(NSError *)error;
- (BOOL)setResourceValues:(NSDictionary *)keyedValues error:(NSError *)error;
- (BOOL)startAccessingSecurityScopedResource;
- (NSData)bookmarkDataWithOptions:(NSURLBookmarkCreationOptions)options includingResourceValuesForKeys:(NSArray *)keys relativeToURL:(NSURL *)relativeURL error:(NSError *)error;
- (NSDictionary)resourceValuesForKeys:(NSArray *)keys error:(NSError *)error;
- (NSURL)filePathURL;
- (NSURL)fileReferenceURL;
- (id)_URLByInsertingResolveFlags:(unsigned int)a3;
- (id)_URLByRemovingResolveFlags;
- (uint64_t)filePathURL;
- (uint64_t)fileReferenceURL;
- (uint64_t)isFileReferenceURL;
- (uint64_t)removeAllCachedResourceValues;
- (uint64_t)startAccessingSecurityScopedResource;
- (uint64_t)stopAccessingSecurityScopedResource;
- (unsigned)_resolveFlags;
- (void)removeAllCachedResourceValues;
- (void)removeCachedResourceValueForKey:(NSURLResourceKey)key;
- (void)setTemporaryResourceValue:(id)value forKey:(NSURLResourceKey)key;
- (void)stopAccessingSecurityScopedResource;
@end

@implementation NSURL

+ (id)__unurl
{
  if (__unurl_static_init != -1) {
    dispatch_once(&__unurl_static_init, &__block_literal_global_33);
  }
  return (id)__unurl_immutablePlaceholderNSURL;
}

CFURLRef __16__NSURL___unurl__block_invoke()
{
  CFURLRef result = CFURLCreateWithString(0LL, @"__immutablePlaceholderNSURL", 0LL);
  __unurl_immutablePlaceholderNSURL = (uint64_t)result;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)getResourceValue:(id *)value forKey:(NSURLResourceKey)key error:(NSError *)error
{
  v8 = (__objc2_class **)-[NSURL _cfurl](self, "_cfurl");
  if (v8 == +[NSURL __unurl](&OBJC_CLASS___NSURL, "__unurl"))
  {
    v12 = (NSURL *)-[NSURL getResourceValue:forKey:error:].cold.1();
    return -[NSURL resourceValuesForKeys:error:](v12, v13, v14, v15);
  }

  if (!v8) {
    return 0;
  }
  __CFURLBeginResourcePropertyCacheAccess(v8);
  int v9 = CFURLCopyResourcePropertyForKey((CFURLRef)v8, (CFStringRef)key, value, (CFErrorRef *)error);
  __CFURLEndResourcePropertyCacheAccess(v8);
  if (!v9)
  {
    if (error)
    {
      v11 = *error;
      BOOL result = 0;
      *error = v11;
      return result;
    }

    return 0;
  }

  if (*value) {
    *value = *value;
  }
  return 1;
}

- (NSDictionary)resourceValuesForKeys:(NSArray *)keys error:(NSError *)error
{
  v6 = (__objc2_class **)-[NSURL _cfurl](self, "_cfurl");
  if (v6 == +[NSURL __unurl](&OBJC_CLASS___NSURL, "__unurl"))
  {
    int v9 = (NSURL *)-[NSURL resourceValuesForKeys:error:].cold.1();
    return (NSDictionary *)-[NSURL setResourceValue:forKey:error:](v9, v10, v11, v12, v13);
  }

  else
  {
    if (v6)
    {
      __CFURLBeginResourcePropertyCacheAccess(v6);
      CFDictionaryRef v7 = CFURLCopyResourcePropertiesForKeys((CFURLRef)v6, (CFArrayRef)keys, (CFErrorRef *)error);
      __CFURLEndResourcePropertyCacheAccess(v6);
      if (v7) {
        return (NSDictionary *)v7;
      }
      if (error) {
        *error = *error;
      }
    }

    return 0LL;
  }

- (BOOL)setResourceValue:(id)value forKey:(NSURLResourceKey)key error:(NSError *)error
{
  v8 = (__objc2_class **)-[NSURL _cfurl](self, "_cfurl");
  if (v8 == +[NSURL __unurl](&OBJC_CLASS___NSURL, "__unurl"))
  {
    NSURLResourceKey v12 = (NSURL *)-[NSURL setResourceValue:forKey:error:].cold.1();
    return -[NSURL setResourceValues:error:](v12, v13, v14, v15);
  }

  else
  {
    if (!v8) {
      return 0;
    }
    __CFURLBeginResourcePropertyCacheAccess(v8);
    int v9 = CFURLSetResourcePropertyForKey((CFURLRef)v8, (CFStringRef)key, value, (CFErrorRef *)error);
    BOOL v10 = v9 != 0;
    __CFURLEndResourcePropertyCacheAccess(v8);
    if (error)
    {
      if (!v9)
      {
        BOOL v10 = 0;
        *error = *error;
      }
    }

    return v10;
  }

- (BOOL)setResourceValues:(NSDictionary *)keyedValues error:(NSError *)error
{
  v6 = (__objc2_class **)-[NSURL _cfurl](self, "_cfurl");
  if (v6 == +[NSURL __unurl](&OBJC_CLASS___NSURL, "__unurl"))
  {
    BOOL v10 = (NSURL *)-[NSURL setResourceValues:error:].cold.1();
    -[NSURL removeCachedResourceValueForKey:](v10, v11, v12);
  }

  else
  {
    if (!v6) {
      return 0;
    }
    __CFURLBeginResourcePropertyCacheAccess(v6);
    int v7 = CFURLSetResourcePropertiesForKeys((CFURLRef)v6, (CFDictionaryRef)keyedValues, (CFErrorRef *)error);
    BOOL v8 = v7 != 0;
    __CFURLEndResourcePropertyCacheAccess(v6);
    if (error)
    {
      if (!v7)
      {
        BOOL v8 = 0;
        *error = *error;
      }
    }

    return v8;
  }

  return result;
}

- (void)removeCachedResourceValueForKey:(NSURLResourceKey)key
{
  v4 = (__objc2_class **)-[NSURL _cfurl](self, "_cfurl");
  if (v4 == +[NSURL __unurl](&OBJC_CLASS___NSURL, "__unurl"))
  {
    v5 = (NSURL *)-[NSURL removeCachedResourceValueForKey:].cold.1();
    -[NSURL removeAllCachedResourceValues](v5, v6);
  }

  else if (v4)
  {
    __CFURLBeginResourcePropertyCacheAccess(v4);
    CFURLClearResourcePropertyCacheForKey((CFURLRef)v4, (CFStringRef)key);
    __CFURLEndResourcePropertyCacheAccess(v4);
  }

- (void)removeAllCachedResourceValues
{
  v2 = (__objc2_class **)-[NSURL _cfurl](self, "_cfurl");
  if (v2 == +[NSURL __unurl](&OBJC_CLASS___NSURL, "__unurl"))
  {
    v3 = (NSURL *)-[NSURL removeAllCachedResourceValues].cold.1();
    -[NSURL setTemporaryResourceValue:forKey:](v3, v4, v5, v6);
  }

  else if (v2)
  {
    __CFURLBeginResourcePropertyCacheAccess(v2);
    CFURLClearResourcePropertyCache((CFURLRef)v2);
    __CFURLEndResourcePropertyCacheAccess(v2);
  }

- (void)setTemporaryResourceValue:(id)value forKey:(NSURLResourceKey)key
{
  NSURLResourceKey v6 = (__objc2_class **)-[NSURL _cfurl](self, "_cfurl");
  if (v6 == +[NSURL __unurl](&OBJC_CLASS___NSURL, "__unurl"))
  {
    int v7 = (NSURL *)-[NSURL setTemporaryResourceValue:forKey:].cold.1();
    -[NSURL isFileReferenceURL](v7, v8);
  }

  else if (v6)
  {
    __CFURLBeginResourcePropertyCacheAccess(v6);
    CFURLSetTemporaryResourcePropertyForKey((CFURLRef)v6, (CFStringRef)key, value);
    __CFURLEndResourcePropertyCacheAccess(v6);
  }

- (BOOL)isFileReferenceURL
{
  v2 = (const __CFURL *)-[NSURL _cfurl](self, "_cfurl");
  if (v2 == +[NSURL __unurl](&OBJC_CLASS___NSURL, "__unurl"))
  {
    SEL v4 = (NSURL *)-[NSURL isFileReferenceURL].cold.1();
    return -[NSURL fileReferenceURL](v4, v5);
  }

  else
  {
    return v2 && CFURLIsFileReferenceURL(v2) != 0;
  }

- (NSURL)fileReferenceURL
{
  v3 = (__objc2_class **)-[NSURL _cfurl](self, "_cfurl");
  if (v3 == +[NSURL __unurl](&OBJC_CLASS___NSURL, "__unurl"))
  {
    SEL v8 = (NSURL *)-[NSURL fileReferenceURL].cold.1();
    return -[NSURL filePathURL](v8, v9);
  }

  else
  {
    if (v3)
    {
      __CFURLBeginResourcePropertyCacheAccess(v3);
      SEL v4 = CFGetAllocator(v3);
      CFURLRef v5 = CFURLCreateFileReferenceURL(v4, (CFURLRef)-[NSURL _cfurl](self, "_cfurl"), 0LL);
      __CFURLEndResourcePropertyCacheAccess(v3);
      if (v5)
      {
        v3 = v5;
        uint64_t v6 = -[NSURL _resolveFlags](self, "_resolveFlags");
        if ((_DWORD)v6) {
          return (NSURL *)[v3 _URLByInsertingResolveFlags:v6];
        }
      }

      else
      {
        return 0LL;
      }
    }

    return (NSURL *)v3;
  }

- (NSURL)filePathURL
{
  v3 = (__objc2_class **)-[NSURL _cfurl](self, "_cfurl");
  if (v3 == +[NSURL __unurl](&OBJC_CLASS___NSURL, "__unurl"))
  {
    SEL v8 = (NSURL *)-[NSURL filePathURL].cold.1();
    return (NSURL *)-[NSURL _resolveFlags](v8, v9);
  }

  else
  {
    if (v3)
    {
      __CFURLBeginResourcePropertyCacheAccess(v3);
      SEL v4 = CFGetAllocator(v3);
      CFURLRef v5 = CFURLCreateFilePathURL(v4, (CFURLRef)-[NSURL _cfurl](self, "_cfurl"), 0LL);
      __CFURLEndResourcePropertyCacheAccess(v3);
      if (v5)
      {
        v3 = v5;
        uint64_t v6 = -[NSURL _resolveFlags](self, "_resolveFlags");
        if ((_DWORD)v6) {
          return (NSURL *)[v3 _URLByInsertingResolveFlags:v6];
        }
      }

      else
      {
        return 0LL;
      }
    }

    return (NSURL *)v3;
  }

- (unsigned)_resolveFlags
{
  if (-[NSURL isFileURL](self, "isFileURL"))
  {
    if (-[NSURL isFileReferenceURL](self, "isFileReferenceURL"))
    {
      if (-[NSURL query](self, "query")) {
        return -[NSString _queryResolveFlags](-[NSURL query](self, "query"), "_queryResolveFlags");
      }
    }

    else
    {
      SEL v4 = CFURLCopyAbsoluteURL((CFURLRef)-[NSURL _cfurl](self, "_cfurl"));
      if (v4)
      {
        CFURLRef v5 = v4;
        uint64_t v6 = (id)CFURLCopyPath(v4);
        CFRelease(v5);
        if (v6) {
          return -[__CFString _pathResolveFlags](v6, "_pathResolveFlags");
        }
      }
    }
  }

  return 0;
}

- (id)_URLByInsertingResolveFlags:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v5 = -[NSURL isFileURL](self, "isFileURL");
  if ((_DWORD)v3
    && v5
    && ((BOOL v6 = -[NSURL isFileReferenceURL](self, "isFileReferenceURL"),
         int v7 = -[NSURL absoluteString](self, "absoluteString"),
         !v6)
      ? (SEL v8 = (const __CFString *)-[NSString _urlStringByInsertingPathResolveFlags:]( v7,  "_urlStringByInsertingPathResolveFlags:",  v3))
      : (SEL v8 = (const __CFString *)-[NSString _urlStringByInsertingQueryResolveFlags:]( v7,  "_urlStringByInsertingQueryResolveFlags:",  v3)),  v8))
  {
    SEL v9 = (NSURL *)CFURLCreateWithString(0LL, v8, 0LL);
  }

  else
  {
    SEL v9 = self;
  }

  return v9;
}

- (id)_URLByRemovingResolveFlags
{
  if (-[NSURL isFileURL](self, "isFileURL")
    && (uint64_t v3 = (const __CFString *)-[NSString _urlStringByRemovingResolveFlags]( -[NSURL absoluteString](self, "absoluteString"),  "_urlStringByRemovingResolveFlags")) != 0LL)
  {
    SEL v4 = (NSURL *)CFURLCreateWithString(0LL, v3, 0LL);
  }

  else
  {
    SEL v4 = self;
  }

  return v4;
}

- (NSData)bookmarkDataWithOptions:(NSURLBookmarkCreationOptions)options includingResourceValuesForKeys:(NSArray *)keys relativeToURL:(NSURL *)relativeURL error:(NSError *)error
{
  BOOL v10 = (__objc2_class **)-[NSURL _cfurl](self, "_cfurl");
  if (v10 == +[NSURL __unurl](&OBJC_CLASS___NSURL, "__unurl"))
  {
    v14 = (void *)-[NSURL bookmarkDataWithOptions:includingResourceValuesForKeys:relativeToURL:error:].cold.1();
    return (NSData *)+[NSURL resourceValuesForKeys:fromBookmarkData:](v14, v15, v16, v17);
  }

  else
  {
    if (v10)
    {
      __CFURLBeginResourcePropertyCacheAccess(v10);
      SEL v11 = CFGetAllocator(v10);
      CFDataRef v12 = CFURLCreateBookmarkData( v11,  (CFURLRef)v10,  options,  (CFArrayRef)keys,  (CFURLRef)-[NSURL _cfurl](relativeURL, "_cfurl"),  (CFErrorRef *)error);
      __CFURLEndResourcePropertyCacheAccess(v10);
      if (v12) {
        return (NSData *)v12;
      }
      if (error)
      {
        if (*error) {
          *error = *error;
        }
      }
    }

    return 0LL;
  }

+ (NSDictionary)resourceValuesForKeys:(NSArray *)keys fromBookmarkData:(NSData *)bookmarkData
{
  BOOL result = (NSDictionary *)CFURLCreateResourcePropertiesForKeysFromBookmarkData( 0LL,  (CFArrayRef)keys,  (CFDataRef)bookmarkData);
  if (result) {
    return result;
  }
  return result;
}

+ (BOOL)writeBookmarkData:(NSData *)bookmarkData toURL:(NSURL *)bookmarkFileURL options:(NSURLBookmarkFileCreationOptions)options error:(NSError *)error
{
  int v7 = CFURLWriteBookmarkDataToFile((CFDataRef)bookmarkData, (CFURLRef)bookmarkFileURL, options, (CFErrorRef *)error);
  int v8 = v7;
  if (error && !v7 && *error) {
    *error = *error;
  }
  return v8 != 0;
}

+ (NSData)bookmarkDataWithContentsOfURL:(NSURL *)bookmarkFileURL error:(NSError *)error
{
  CFDataRef v5 = CFURLCreateBookmarkDataFromFile(0LL, (CFURLRef)bookmarkFileURL, (CFErrorRef *)error);
  if (v5) {
    return (NSData *)v5;
  }
  if (error)
  {
    if (*error) {
      *error = *error;
    }
  }

  return 0LL;
}

- (BOOL)startAccessingSecurityScopedResource
{
  v2 = (const __CFURL *)-[NSURL _cfurl](self, "_cfurl");
  if (v2 == +[NSURL __unurl](&OBJC_CLASS___NSURL, "__unurl"))
  {
    SEL v4 = (NSURL *)-[NSURL startAccessingSecurityScopedResource].cold.1();
    -[NSURL stopAccessingSecurityScopedResource](v4, v5);
  }

  else
  {
    return v2 && CFURLStartAccessingSecurityScopedResource(v2) != 0;
  }

  return result;
}

- (void)stopAccessingSecurityScopedResource
{
  v2 = (const __CFURL *)-[NSURL _cfurl](self, "_cfurl");
  if (v2 == +[NSURL __unurl](&OBJC_CLASS___NSURL, "__unurl"))
  {
    uint64_t v3 = (objc_class *)-[NSURL stopAccessingSecurityScopedResource].cold.1();
    OUTLINED_FUNCTION_0_28(v3);
  }

  else if (v2)
  {
    CFURLStopAccessingSecurityScopedResource(v2);
  }

- (uint64_t)getResourceValue:forKey:error:.cold.1()
{
  v0 = __CFLookUpClass("NSURL");
  uint64_t v3 = OUTLINED_FUNCTION_0_28(v0);
  uint64_t v1 = OUTLINED_FUNCTION_1_19(v3, @"%@: object was not initialized");
  return -[NSURL resourceValuesForKeys:error:].cold.1(v1);
}

- (uint64_t)resourceValuesForKeys:error:.cold.1()
{
  v0 = __CFLookUpClass("NSURL");
  uint64_t v3 = OUTLINED_FUNCTION_0_28(v0);
  uint64_t v1 = OUTLINED_FUNCTION_1_19(v3, @"%@: object was not initialized");
  return -[NSURL setResourceValue:forKey:error:].cold.1(v1);
}

- (uint64_t)setResourceValue:forKey:error:.cold.1()
{
  v0 = __CFLookUpClass("NSURL");
  uint64_t v3 = OUTLINED_FUNCTION_0_28(v0);
  uint64_t v1 = OUTLINED_FUNCTION_1_19(v3, @"%@: object was not initialized");
  return -[NSURL setResourceValues:error:].cold.1(v1);
}

- (uint64_t)setResourceValues:error:.cold.1()
{
  v0 = __CFLookUpClass("NSURL");
  uint64_t v3 = OUTLINED_FUNCTION_0_28(v0);
  uint64_t v1 = OUTLINED_FUNCTION_1_19(v3, @"%@: object was not initialized");
  return -[NSURL removeCachedResourceValueForKey:].cold.1(v1);
}

- (uint64_t)removeCachedResourceValueForKey:.cold.1()
{
  v0 = __CFLookUpClass("NSURL");
  uint64_t v3 = OUTLINED_FUNCTION_0_28(v0);
  uint64_t v1 = OUTLINED_FUNCTION_1_19(v3, @"%@: object was not initialized");
  return -[NSURL removeAllCachedResourceValues].cold.1(v1);
}

- (uint64_t)removeAllCachedResourceValues
{
  v0 = __CFLookUpClass("NSURL");
  uint64_t v3 = OUTLINED_FUNCTION_0_28(v0);
  uint64_t v1 = OUTLINED_FUNCTION_1_19(v3, @"%@: object was not initialized");
  return -[NSURL setTemporaryResourceValue:forKey:].cold.1(v1);
}

- (uint64_t)setTemporaryResourceValue:forKey:.cold.1()
{
  v0 = __CFLookUpClass("NSURL");
  uint64_t v3 = OUTLINED_FUNCTION_0_28(v0);
  uint64_t v1 = OUTLINED_FUNCTION_1_19(v3, @"%@: object was not initialized");
  return -[NSURL isFileReferenceURL].cold.1(v1);
}

- (uint64_t)isFileReferenceURL
{
  v0 = __CFLookUpClass("NSURL");
  uint64_t v3 = OUTLINED_FUNCTION_0_28(v0);
  uint64_t v1 = OUTLINED_FUNCTION_1_19(v3, @"%@: object was not initialized");
  return -[NSURL fileReferenceURL].cold.1(v1);
}

- (uint64_t)fileReferenceURL
{
  v0 = __CFLookUpClass("NSURL");
  uint64_t v3 = OUTLINED_FUNCTION_0_28(v0);
  uint64_t v1 = OUTLINED_FUNCTION_1_19(v3, @"%@: object was not initialized");
  return -[NSURL filePathURL].cold.1(v1);
}

- (uint64_t)filePathURL
{
  v0 = __CFLookUpClass("NSURL");
  uint64_t v3 = OUTLINED_FUNCTION_0_28(v0);
  uint64_t v1 = OUTLINED_FUNCTION_1_19(v3, @"%@: object was not initialized");
  return -[NSURL bookmarkDataWithOptions:includingResourceValuesForKeys:relativeToURL:error:].cold.1(v1);
}

- (uint64_t)bookmarkDataWithOptions:includingResourceValuesForKeys:relativeToURL:error:.cold.1()
{
  v0 = __CFLookUpClass("NSURL");
  uint64_t v3 = OUTLINED_FUNCTION_0_28(v0);
  uint64_t v1 = OUTLINED_FUNCTION_1_19(v3, @"%@: object was not initialized");
  return -[NSURL startAccessingSecurityScopedResource].cold.1(v1);
}

- (uint64_t)startAccessingSecurityScopedResource
{
  v0 = __CFLookUpClass("NSURL");
  uint64_t v3 = OUTLINED_FUNCTION_0_28(v0);
  uint64_t v1 = OUTLINED_FUNCTION_1_19(v3, @"%@: object was not initialized");
  return -[NSURL stopAccessingSecurityScopedResource].cold.1(v1);
}

- (uint64_t)stopAccessingSecurityScopedResource
{
  v0 = __CFLookUpClass("NSURL");
  uint64_t v3 = OUTLINED_FUNCTION_0_28(v0);
  uint64_t v1 = (os_log_s *)OUTLINED_FUNCTION_1_19(v3, @"%@: object was not initialized");
  return __NSMoribundCache_invalidAccess_block_invoke_cold_1(v1);
}

@end
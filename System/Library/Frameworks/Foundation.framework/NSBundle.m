@interface NSBundle
+ (NSArray)URLsForResourcesWithExtension:(NSString *)ext subdirectory:(NSString *)subpath inBundleWithURL:(NSURL *)bundleURL;
+ (NSArray)allBundles;
+ (NSArray)allFrameworks;
+ (NSArray)pathsForResourcesOfType:(NSString *)ext inDirectory:(NSString *)bundlePath;
+ (NSArray)preferredLocalizationsFromArray:(NSArray *)localizationsArray;
+ (NSArray)preferredLocalizationsFromArray:(NSArray *)localizationsArray forPreferences:(NSArray *)preferencesArray;
+ (NSBundle)bundleForClass:(Class)aClass;
+ (NSBundle)bundleWithIdentifier:(NSString *)identifier;
+ (NSBundle)bundleWithPath:(NSString *)path;
+ (NSBundle)bundleWithURL:(NSURL *)url;
+ (NSBundle)mainBundle;
+ (NSString)pathForResource:(NSString *)name ofType:(NSString *)ext inDirectory:(NSString *)bundlePath;
+ (NSURL)URLForResource:(NSString *)name withExtension:(NSString *)ext subdirectory:(NSString *)subpath inBundleWithURL:(NSURL *)bundleURL;
+ (id)_bundleWithIdentifier:(id)a3 andLibraryName:(id)a4;
+ (id)_localizedStringsForKeys:(id)a3 forAllLocalizationsOfTable:(id)a4 inBundleWithURL:(id)a5;
+ (id)debugDescription;
+ (id)findBundleResourceURLsCallingMethod:(SEL)a3 baseURL:(id)a4 passingTest:(id)a5;
+ (id)findBundleResources:(id)a3 callingMethod:(SEL)a4 directory:(id)a5 languages:(id)a6 name:(id)a7 types:(id)a8 limit:(unint64_t)a9;
+ (id)loadedBundles;
- (BOOL)_searchForLocalizedString:(id)a3 foundKey:(id *)a4 foundTable:(id *)a5;
- (BOOL)isLoaded;
- (BOOL)load;
- (BOOL)loadAndReturnError:(NSError *)error;
- (BOOL)preflightAndReturnError:(NSError *)error;
- (BOOL)unload;
- (Class)classNamed:(NSString *)className;
- (Class)principalClass;
- (NSArray)URLsForResourcesWithExtension:(NSString *)ext subdirectory:(NSString *)subpath;
- (NSArray)URLsForResourcesWithExtension:(NSString *)ext subdirectory:(NSString *)subpath localization:(NSString *)localizationName;
- (NSArray)executableArchitectures;
- (NSArray)localizations;
- (NSArray)pathsForResourcesOfType:(NSString *)ext inDirectory:(NSString *)subpath;
- (NSArray)pathsForResourcesOfType:(NSString *)ext inDirectory:(NSString *)subpath forLocalization:(NSString *)localizationName;
- (NSArray)preferredLocalizations;
- (NSAttributedString)localizedAttributedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName;
- (NSBundle)initWithPath:(NSString *)path;
- (NSBundle)initWithURL:(NSURL *)url;
- (NSDictionary)infoDictionary;
- (NSDictionary)localizedInfoDictionary;
- (NSString)builtInPlugInsPath;
- (NSString)bundleIdentifier;
- (NSString)bundlePath;
- (NSString)developmentLocalization;
- (NSString)executablePath;
- (NSString)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName;
- (NSString)pathForAuxiliaryExecutable:(NSString *)executableName;
- (NSString)pathForResource:(NSString *)name ofType:(NSString *)ext;
- (NSString)pathForResource:(NSString *)name ofType:(NSString *)ext inDirectory:(NSString *)subpath;
- (NSString)pathForResource:(NSString *)name ofType:(NSString *)ext inDirectory:(NSString *)subpath forLocalization:(NSString *)localizationName;
- (NSString)privateFrameworksPath;
- (NSString)resourcePath;
- (NSString)sharedFrameworksPath;
- (NSString)sharedSupportPath;
- (NSURL)URLForAuxiliaryExecutable:(NSString *)executableName;
- (NSURL)URLForResource:(NSString *)name withExtension:(NSString *)ext;
- (NSURL)URLForResource:(NSString *)name withExtension:(NSString *)ext subdirectory:(NSString *)subpath;
- (NSURL)URLForResource:(NSString *)name withExtension:(NSString *)ext subdirectory:(NSString *)subpath localization:(NSString *)localizationName;
- (NSURL)appStoreReceiptURL;
- (NSURL)builtInPlugInsURL;
- (NSURL)bundleURL;
- (NSURL)executableURL;
- (NSURL)privateFrameworksURL;
- (NSURL)resourceURL;
- (NSURL)sharedFrameworksURL;
- (NSURL)sharedSupportURL;
- (__CFBundle)_cfBundle;
- (__CFBundle)_cfBundleIfPresent;
- (double)preservationPriorityForTag:(NSString *)tag;
- (id)_initUniqueWithPath:(id)a3;
- (id)_initUniqueWithURL:(id)a3;
- (id)_localizedStringNoCacheNoMarkdownParsingForKey:(id)a3 value:(id)a4 table:(id)a5 localizations:(id)a6 actualTableURL:(id *)a7 formatSpecifierConfiguration:(id *)a8;
- (id)_localizedStringsForKeys:(id)a3 forAllLocalizationsOfTable:(id)a4;
- (id)_objectForUnlocalizedInfoDictionaryKey:(id)a3;
- (id)_wrappedBundleURL;
- (id)_wrapperContainerURL;
- (id)bundleLanguages;
- (id)description;
- (id)findBundleResourceURLsCallingMethod:(SEL)a3 passingTest:(id)a4;
- (id)localizedAttributedStringForKey:(id)a3 value:(id)a4 table:(id)a5 localization:(id)a6;
- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5 localization:(id)a6;
- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5 localizations:(id)a6;
- (id)localizedStringsForTable:(id)a3 localization:(id)a4;
- (id)objectForInfoDictionaryKey:(NSString *)key;
- (unint64_t)versionNumber;
- (void)__static;
- (void)dealloc;
- (void)invalidateResourceCache;
- (void)setPreservationPriority:(double)a3 forTag:(id)a4;
- (void)setPreservationPriority:(double)priority forTags:(NSSet *)tags;
@end

@implementation NSBundle

+ (NSBundle)bundleWithIdentifier:(NSString *)identifier
{
  if (!identifier) {
    return 0LL;
  }
  v4 = (__CFBundle *)MEMORY[0x186E1E6AC](identifier);
  if (!v4) {
    return 0LL;
  }
  CFURLRef v5 = CFBundleCopyBundleURL(v4);
  if (!v5) {
    return 0LL;
  }
  CFURLRef v6 = v5;
  uint64_t v7 = -[__CFURL path](v5, "path");
  if (v7) {
    v8 = (NSBundle *)[a1 bundleWithPath:v7];
  }
  else {
    v8 = 0LL;
  }
  CFRelease(v6);
  return v8;
}

+ (NSBundle)bundleWithPath:(NSString *)path
{
  return (NSBundle *)(id)[objc_allocWithZone((Class)a1) initWithPath:path];
}

- (NSBundle)initWithPath:(NSString *)path
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  CFURLRef v5 = (void *)normalizedPath(path);
  p_flags = &self->_flags;
  int v7 = atomic_load(&self->_flags);
  if ((v7 & 0x10000000) == 0)
  {
    v8 = (id *)+[__NSBundleTables bundleTables]();
    v9 = -[__NSBundleTables bundleForPath:](v8, (uint64_t)v5);
    if (v9)
    {
      v28 = v9;

      return (NSBundle *)v28;
    }
  }

  v11 = (void *)[v5 _stringByResolvingSymlinksInPathUsingCache:1];
  if (!v11 || (v12 = v11, [v11 isEqual:&stru_189CA6A28]))
  {
    v13 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v31 = path;
      _os_log_error_impl( &dword_182EB1000,  v13,  OS_LOG_TYPE_ERROR,  "NSBundle %@ initWithPath failed because the resolved path is empty or nil",  buf,  0xCu);
    }

    return 0LL;
  }

  int v14 = atomic_load(p_flags);
  if ((v14 & 0x10000000) == 0)
  {
    v15 = (id *)+[__NSBundleTables bundleTables]();
    v16 = -[__NSBundleTables bundleForPath:](v15, (uint64_t)v12);
    if (v16
      || ![v12 getFileSystemRepresentation:buf maxLength:1024]
      || stat((const char *)buf, &v29))
    {
      goto LABEL_24;
    }

    if (access((const char *)buf, 4))
    {
      getpid();
      sandbox_check();
LABEL_24:

      return (NSBundle *)v16;
    }

    if ((v29.st_mode & 0xF000) != 0x4000) {
      goto LABEL_24;
    }
  }

  int v17 = [v12 hasSuffix:@".framework"];
  uint64_t v18 = 0x20000LL;
  if (v17) {
    uint64_t v18 = 0x40000LL;
  }
  do
    unint64_t v19 = __ldaxr(p_flags);
  while (__stlxr(v19 | v18, p_flags));
  self->_initialPath = (id)[v5 copy];
  self->_resolvedPath = (id)[v12 copy];
  self->_lock._os_unfair_lock_opaque = 0;
  int v20 = atomic_load(&self->_flags);
  if ((v20 & 0x10000000) != 0)
  {
    CFURLRef v27 = CFURLCreateWithFileSystemPath(0LL, (CFStringRef)self->_resolvedPath, kCFURLPOSIXPathStyle, 1u);
    atomic_store(_CFBundleCreateUnique(), (unint64_t *)&self->_cfBundle);
    CFRelease(v27);
    return self;
  }

  v21 = (id *)+[__NSBundleTables bundleTables]();
  unint64_t v22 = atomic_load(&self->_flags);
  v23 = -[__NSBundleTables addBundleIfNeeded:forPath:withType:isImmortal:](v21, self, (uint64_t)v12, v22 & 0xF0000, 1);
  if (!v23)
  {
    do
      unint64_t v26 = __ldaxr(p_flags);
    while (__stlxr(v26 | 8, p_flags));
    return self;
  }

  v24 = v23;

  return (NSBundle *)v24;
}

- (void)dealloc
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  p_flags = &self->_flags;
  int v5 = atomic_load(&self->_flags);
  if ((v5 & 0x4000000) != 0) {
    -[NSBundle unload](self, "unload");
  }
  unint64_t v6 = atomic_load(p_flags);
  if ((v6 & 0xD0000) == 0x10000)
  {
    int v7 = (os_log_s *)_NSOSLog();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (v8)
    {
      *(_DWORD *)buf = 138413058;
      unint64_t v19 = _NSMethodExceptionProem((objc_class *)self, a2);
      __int16 v20 = 2048;
      v21 = self;
      __int16 v22 = 2112;
      v23 = -[NSBundle bundleIdentifier](self, "bundleIdentifier");
      __int16 v24 = 2112;
      v25 = -[NSBundle bundleURL](self, "bundleURL");
      _os_log_error_impl( &dword_182EB1000,  v7,  OS_LOG_TYPE_ERROR,  "%@: attempt to deallocate static bundle - break on _NSBundleDeallocatingStaticBundle to debug. This bundle %p wo uld have been overreleased, but will instead be preserved.\n \tBundle Identifier: %@\n \tBundle URL: %@",  buf,  0x2Au);
    }

    destructiveProjectEnumData for PredicateCodableError(v8, v9);
    if (NSZombieEnabled) {
LABEL_18:
    }
      __break(1u);
  }

  else
  {
    char v10 = atomic_load(&self->_flags);
    if ((v10 & 8) != 0)
    {
      v11 = (os_log_s *)_NSOSLog();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
      if (v12)
      {
        *(_DWORD *)buf = 138413058;
        unint64_t v19 = _NSMethodExceptionProem((objc_class *)self, a2);
        __int16 v20 = 2048;
        v21 = self;
        __int16 v22 = 2112;
        v23 = -[NSBundle bundleIdentifier](self, "bundleIdentifier");
        __int16 v24 = 2112;
        v25 = -[NSBundle bundleURL](self, "bundleURL");
        _os_log_error_impl( &dword_182EB1000,  v11,  OS_LOG_TYPE_ERROR,  "%@: attempting to deallocate an immortal bundle - break on _NSBundleDeallocatingImmortalBundle to debug. This bundle %p has been overreleased.\n \tBundle Identifier: %@\n \tBundle URL: %@",  buf,  0x2Au);
      }

      destructiveProjectEnumData for PredicateCodableError(v12, v13);
      if (NSZombieEnabled) {
        goto LABEL_18;
      }
    }

    if (atomic_load((unint64_t *)&self->_cfBundle))
    {
      v15 = (void *)atomic_load((unint64_t *)&self->_cfBundle);
    }

    attributedStringTable = self->_attributedStringTable;
    if (attributedStringTable) {

    }
    v17.receiver = self;
    v17.super_class = (Class)&OBJC_CLASS___NSBundle;
    -[NSBundle dealloc](&v17, sel_dealloc);
  }

- (NSString)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName
{
  BOOL v8 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v8) {
    BOOL v8 = (__CFBundle *)CFBundleCopyLocalizedString(v8, (CFStringRef)key, (CFStringRef)value, (CFStringRef)tableName);
  }
  return (NSString *)v8;
}

- (__CFBundle)_cfBundle
{
  p_cfBundle = (unint64_t *)&self->_cfBundle;
  if (!atomic_load((unint64_t *)&self->_cfBundle))
  {
    resolvedPath = (const __CFString *)self->_resolvedPath;
    if (resolvedPath)
    {
      int v5 = CFURLCreateWithFileSystemPath(0LL, resolvedPath, kCFURLPOSIXPathStyle, 1u);
      CFBundleRef v6 = CFBundleCreate(0LL, v5);
      if (v6)
      {
        while (!__ldaxr(p_cfBundle))
        {
        }

        __clrex();
        CFRelease(v6);
      }

- (__CFBundle)_cfBundleIfPresent
{
  return (__CFBundle *)atomic_load((unint64_t *)&self->_cfBundle);
}

+ (id)findBundleResources:(id)a3 callingMethod:(SEL)a4 directory:(id)a5 languages:(id)a6 name:(id)a7 types:(id)a8 limit:(unint64_t)a9
{
  if (a3 && (v11 = (__CFBundle *)[a3 _cfBundle]) != 0)
  {
    if (a5) {
      CFURLRef v12 = CFURLCreateWithFileSystemPath(0LL, (CFStringRef)a5, kCFURLPOSIXPathStyle, 1u);
    }
    else {
      CFURLRef v12 = CFBundleCopyBundleURL(v11);
    }
    CFURLRef v13 = v12;
    if (!v12) {
      return v13;
    }
    if ([a8 count]) {
      [a8 objectAtIndex:0];
    }
    LOBYTE(v18) = 0;
  }

  else
  {
    CFURLRef v13 = CFURLCreateWithFileSystemPath(0LL, (CFStringRef)a5, kCFURLPOSIXPathStyle, 1u);
    if (!v13) {
      return v13;
    }
    if ([a8 count]) {
      [a8 objectAtIndex:0];
    }
    LOBYTE(v18) = 0;
  }

  Resources = (void *)_CFBundleCopyFindResources();
  CFRelease(v13);
  if (!Resources) {
    return 0LL;
  }
  uint64_t v15 = objc_msgSend(Resources, "count", v18, 0);
  CFURLRef v13 = (CFURLRef)[MEMORY[0x189603FA8] array];
  if (v15)
  {
    for (CFIndex i = 0LL; i != v15; ++i)
      -[__CFURL addObject:]( v13,  "addObject:",  objc_msgSend( (id)objc_msgSend((id)CFArrayGetValueAtIndex((CFArrayRef)Resources, i), "absoluteURL"),  "absoluteString"));
  }

  CFRelease(Resources);
  return v13;
}

- (id)findBundleResourceURLsCallingMethod:(SEL)a3 passingTest:(id)a4
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  -[NSBundle _cfBundle](self, "_cfBundle", a3);
  id v13 = a4;
  LOBYTE(v12) = 0;
  Resources = (void *)_CFBundleCopyFindResources();
  CFBundleRef v6 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  objc_msgSend(Resources, "count", v12, v13));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v7 = [Resources countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(Resources);
        }
        objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10++), "absoluteURL"));
      }

      while (v8 != v10);
      uint64_t v8 = [Resources countByEnumeratingWithState:&v15 objects:v14 count:16];
    }

    while (v8);
  }

  return v6;
}

+ (id)findBundleResourceURLsCallingMethod:(SEL)a3 baseURL:(id)a4 passingTest:(id)a5
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  LOBYTE(v12) = 0;
  Resources = (void *)_CFBundleCopyFindResources();
  CFBundleRef v6 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  objc_msgSend(Resources, "count", v12, a5));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v7 = [Resources countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(Resources);
        }
        objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10++), "absoluteURL"));
      }

      while (v8 != v10);
      uint64_t v8 = [Resources countByEnumeratingWithState:&v15 objects:v14 count:16];
    }

    while (v8);
  }

  return v6;
}

+ (NSString)pathForResource:(NSString *)name ofType:(NSString *)ext inDirectory:(NSString *)bundlePath
{
  if (name && -[NSString length](name, "length"))
  {
    if (!bundlePath) {
      return 0LL;
    }
  }

  else
  {
    if (!ext) {
      return 0LL;
    }
    NSUInteger v8 = -[NSString length](ext, "length");
    if (!bundlePath || !v8) {
      return 0LL;
    }
  }

  uint64_t v9 = CFURLCreateWithFileSystemPath(0LL, (CFStringRef)bundlePath, kCFURLPOSIXPathStyle, 1u);
  if (v9)
  {
    uint64_t v10 = v9;
    CFURLRef v11 = CFBundleCopyResourceURLInDirectory(v9, (CFStringRef)name, (CFStringRef)ext, 0LL);
    CFRelease(v10);
    if (v11)
    {
      uint64_t v12 = (NSString *)-[__CFURL path](v11, "path");
      CFRelease(v11);
      return v12;
    }
  }

  return 0LL;
}

+ (NSURL)URLForResource:(NSString *)name withExtension:(NSString *)ext subdirectory:(NSString *)subpath inBundleWithURL:(NSURL *)bundleURL
{
  if (name && -[NSString length](name, "length") || ext && -[NSString length](ext, "length")) {
    return (NSURL *) CFBundleCopyResourceURLInDirectory( (CFURLRef)bundleURL,  (CFStringRef)name,  (CFStringRef)ext,  (CFStringRef)subpath);
  }
  else {
    return 0LL;
  }
}

+ (NSArray)pathsForResourcesOfType:(NSString *)ext inDirectory:(NSString *)bundlePath
{
  if (!bundlePath) {
    return 0LL;
  }
  int v5 = CFURLCreateWithFileSystemPath(0LL, (CFStringRef)bundlePath, kCFURLPOSIXPathStyle, 1u);
  CFBundleRef v6 = (NSArray *)v5;
  if (!v5) {
    return v6;
  }
  CFArrayRef v7 = CFBundleCopyResourceURLsOfTypeInDirectory(v5, (CFStringRef)ext, 0LL);
  CFRelease(v6);
  if (!v7) {
    return 0LL;
  }
  uint64_t v8 = -[__CFArray count](v7, "count");
  CFBundleRef v6 = (NSArray *)[MEMORY[0x189603FA8] array];
  if (v8)
  {
    for (CFIndex i = 0LL; i != v8; ++i)
      -[NSArray addObject:](v6, "addObject:", objc_msgSend((id)CFArrayGetValueAtIndex(v7, i), "path"));
  }

  CFRelease(v7);
  return v6;
}

+ (NSArray)URLsForResourcesWithExtension:(NSString *)ext subdirectory:(NSString *)subpath inBundleWithURL:(NSURL *)bundleURL
{
  return (NSArray *) CFBundleCopyResourceURLsOfTypeInDirectory( (CFURLRef)bundleURL,  (CFStringRef)ext,  (CFStringRef)subpath);
}

- (NSString)pathForResource:(NSString *)name ofType:(NSString *)ext inDirectory:(NSString *)subpath forLocalization:(NSString *)localizationName
{
  return (NSString *)-[NSURL path]( -[NSBundle URLForResource:withExtension:subdirectory:localization:]( self,  "URLForResource:withExtension:subdirectory:localization:",  name,  ext,  subpath,  localizationName),  "path");
}

- (NSURL)URLForResource:(NSString *)name withExtension:(NSString *)ext subdirectory:(NSString *)subpath localization:(NSString *)localizationName
{
  if ((!name || !-[NSString length](name, "length")) && (!ext || !-[NSString length](ext, "length"))) {
    return 0LL;
  }
  CFURLRef v11 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v11) {
    CFURLRef v11 = CFBundleCopyResourceURLForLocalization( v11,  (CFStringRef)name,  (CFStringRef)ext,  (CFStringRef)subpath,  (CFStringRef)localizationName);
  }
  return (NSURL *)v11;
}

- (NSString)pathForResource:(NSString *)name ofType:(NSString *)ext inDirectory:(NSString *)subpath
{
  return (NSString *)-[NSURL path]( -[NSBundle URLForResource:withExtension:subdirectory:]( self,  "URLForResource:withExtension:subdirectory:",  name,  ext,  subpath),  "path");
}

- (NSURL)URLForResource:(NSString *)name withExtension:(NSString *)ext subdirectory:(NSString *)subpath
{
  if ((!name || !-[NSString length](name, "length")) && (!ext || !-[NSString length](ext, "length"))) {
    return 0LL;
  }
  uint64_t v9 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v9) {
    uint64_t v9 = CFBundleCopyResourceURL(v9, (CFStringRef)name, (CFStringRef)ext, (CFStringRef)subpath);
  }
  return (NSURL *)v9;
}

- (NSString)pathForResource:(NSString *)name ofType:(NSString *)ext
{
  v4 = -[NSURL path]( -[NSBundle URLForResource:withExtension:](self, "URLForResource:withExtension:", name, ext),  "path");
  if (pathForResource_ofType__onceToken != -1) {
    dispatch_once(&pathForResource_ofType__onceToken, &__block_literal_global_4);
  }
  return v4;
}

- (NSURL)URLForResource:(NSString *)name withExtension:(NSString *)ext
{
  return -[NSBundle URLForResource:withExtension:subdirectory:]( self,  "URLForResource:withExtension:subdirectory:",  name,  ext,  0LL);
}

- (NSArray)pathsForResourcesOfType:(NSString *)ext inDirectory:(NSString *)subpath forLocalization:(NSString *)localizationName
{
  uint64_t v8 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (!v8) {
    return 0LL;
  }
  CFArrayRef v9 = CFBundleCopyResourceURLsOfTypeForLocalization( v8,  (CFStringRef)ext,  (CFStringRef)subpath,  (CFStringRef)localizationName);
  if (!v9) {
    return 0LL;
  }
  uint64_t v10 = v9;
  uint64_t v11 = -[__CFArray count](v9, "count");
  uint64_t v12 = (NSArray *)[MEMORY[0x189603FA8] array];
  if (v11)
  {
    for (CFIndex i = 0LL; i != v11; ++i)
      -[NSArray addObject:](v12, "addObject:", objc_msgSend((id)CFArrayGetValueAtIndex(v10, i), "path"));
  }

  CFRelease(v10);
  return v12;
}

- (NSArray)URLsForResourcesWithExtension:(NSString *)ext subdirectory:(NSString *)subpath localization:(NSString *)localizationName
{
  uint64_t v8 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v8) {
    uint64_t v8 = CFBundleCopyResourceURLsOfTypeForLocalization( v8,  (CFStringRef)ext,  (CFStringRef)subpath,  (CFStringRef)localizationName);
  }
  return (NSArray *)v8;
}

- (NSArray)pathsForResourcesOfType:(NSString *)ext inDirectory:(NSString *)subpath
{
  CFBundleRef v6 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (!v6) {
    return 0LL;
  }
  CFArrayRef v7 = CFBundleCopyResourceURLsOfType(v6, (CFStringRef)ext, (CFStringRef)subpath);
  if (!v7) {
    return 0LL;
  }
  uint64_t v8 = v7;
  uint64_t v9 = -[__CFArray count](v7, "count");
  uint64_t v10 = (NSArray *)[MEMORY[0x189603FA8] array];
  if (v9)
  {
    for (CFIndex i = 0LL; i != v9; ++i)
      -[NSArray addObject:](v10, "addObject:", objc_msgSend((id)CFArrayGetValueAtIndex(v8, i), "path"));
  }

  CFRelease(v8);
  return v10;
}

- (NSArray)URLsForResourcesWithExtension:(NSString *)ext subdirectory:(NSString *)subpath
{
  CFBundleRef v6 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v6) {
    CFBundleRef v6 = CFBundleCopyResourceURLsOfType(v6, (CFStringRef)ext, (CFStringRef)subpath);
  }
  return (NSArray *)v6;
}

- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5 localization:(id)a6
{
  CFBundleRef v6 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v6) {
    CFBundleRef v6 = (__CFBundle *)CFBundleCopyLocalizedStringForLocalization();
  }
  return v6;
}

- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5 localizations:(id)a6
{
  CFBundleRef v6 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v6) {
    CFBundleRef v6 = (__CFBundle *)_CFBundleCopyLocalizedStringForLocalizations();
  }
  return v6;
}

- (id)localizedStringsForTable:(id)a3 localization:(id)a4
{
  v4 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v4) {
    v4 = (__CFBundle *)CFBundleCopyLocalizedStringTableForLocalization();
  }
  return v4;
}

- (id)_localizedStringsForKeys:(id)a3 forAllLocalizationsOfTable:(id)a4
{
  v4 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v4) {
    v4 = (__CFBundle *)_CFBundleCopyFilteredLocalizedStringsForAllLocalizations();
  }
  return v4;
}

+ (id)_localizedStringsForKeys:(id)a3 forAllLocalizationsOfTable:(id)a4 inBundleWithURL:(id)a5
{
  return (id)_CFBundleCopyFilteredLocalizedStringsForAllLocalizationsForURL();
}

- (BOOL)_searchForLocalizedString:(id)a3 foundKey:(id *)a4 foundTable:(id *)a5
{
  if (!-[NSBundle _cfBundle](self, "_cfBundle")) {
    return 0;
  }
  int v7 = _CFBundleSearchForLocalizedString();
  int v8 = v7;
  BOOL v9 = v7 != 0;
  if (a4 && v7) {
    *a4 = 0LL;
  }
  if (a5 && v8) {
    *a5 = 0LL;
  }
  return v9;
}

- (BOOL)load
{
  return -[NSBundle loadAndReturnError:](self, "loadAndReturnError:", 0LL);
}

- (BOOL)loadAndReturnError:(NSError *)error
{
  uint64_t v56 = *MEMORY[0x1895F89C0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  p_flags = &self->_flags;
  int v6 = atomic_load(&self->_flags);
  if ((v6 & 0x4000000) != 0)
  {
    os_unfair_lock_unlock(p_lock);
    return 1;
  }

  int v7 = (void *)[MEMORY[0x189603FA8] array];
  context = (void *)MEMORY[0x186E1FF60]();
  atomic_load(p_flags);
  int v8 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (!v8)
  {
    CFURLRef v27 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v53 = -[NSBundle bundleURL](self, "bundleURL");
      _os_log_error_impl( &dword_182EB1000,  v27,  OS_LOG_TYPE_ERROR,  "NSBundle %@ loading failed because the file does not exist",  buf,  0xCu);
    }

    if (error) {
      *error = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  4LL,  0LL);
    }
    if ((_MergedGlobals_91 & 1) == 0) {
      goto LABEL_63;
    }
    goto LABEL_41;
  }

  if (_MergedGlobals_91 == 1)
  {
LABEL_41:
    v28 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v39 = -[NSBundle bundleURL](self, "bundleURL");
      *(_DWORD *)buf = 138412290;
      v53 = v39;
      _os_log_error_impl( &dword_182EB1000,  v28,  OS_LOG_TYPE_ERROR,  "NSBundle %@ loading failed because bundle loading is disabled",  buf,  0xCu);
    }

    if (error)
    {
      CFGetAllocator(v8);
      *error = (NSError *)_CFBundleCreateError();
    }

    goto LABEL_63;
  }

  if (qword_18C496580 != -1) {
    dispatch_once(&qword_18C496580, &__block_literal_global_208);
  }
  _CFSetTSD();
  v43 = p_lock;
  if (_CFBundleLoadExecutableAndReturnError())
  {
    BOOL v9 = (void *)_CFGetTSD();
    if ((unint64_t)v9 >= 2 && *v9)
    {
      v42 = v8;
      do
      {
        uint64_t v10 = (const char *)dyld_image_path_containing_address();
        uint64_t v11 = (void *)objc_copyClassNamesForImageHeader();
        if (v11)
        {
          uint64_t v12 = (void *)[MEMORY[0x189603FA8] arrayWithCapacity:v46];
          size_t v13 = strlen(v10);
          id v14 = _NSFileSystemRepresentationString((uint64_t)v10, v13);
          __int128 v15 = _NSFrameworkPathFromLibraryPath(v14);
          if (v15 || (__int128 v15 = _NSBundlePathFromExecutablePath(v14)) != 0LL)
          {
            __int128 v16 = -[NSBundle initWithPath:](objc_alloc(&OBJC_CLASS___NSBundle), "initWithPath:", v15);
            __int128 v17 = v16;
            if (v16)
            {
              __int128 v18 = &v16->_flags;
              unint64_t v19 = atomic_load(&v16->_flags);
              if ((v19 & 0xF0000) == 0x40000)
              {
                do
                  unint64_t v20 = __ldaxr(v18);
                while (__stlxr(v20 | 0x4000000, v18));
              }

              if (v16 != self) {
                os_unfair_lock_lock(&v16->_lock);
              }
              if (v46 && *v11 && !v17->_firstClassName) {
                v17->_firstClassName = -[NSString initWithUTF8String:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithUTF8String:",  *v11);
              }
              if (v17 != self) {
                os_unfair_lock_unlock(&v17->_lock);
              }
              if (v46)
              {
                for (unint64_t i = 0LL; i < v46; ++i)
                {
                  uint64_t v22 = v11[i];
                  if (v22)
                  {
                    v23 = -[NSString initWithUTF8String:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithUTF8String:",  v22);
                    if (v23)
                    {
                      [v12 addObject:v23];
                    }
                  }
                }
              }

              p_lock = v43;
              objc_msgSend( v7,  "addObject:",  +[NSNotification notificationWithName:object:userInfo:]( NSNotification,  "notificationWithName:object:userInfo:",  @"NSBundleDidLoadNotification",  v17,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  v12,  @"NSLoadedClasses",  0,  v42)));
            }
          }

          free(v11);
        }

        uint64_t v24 = v9[1];
        ++v9;
      }

      while (v24);
    }

    int v25 = 1;
  }

  else
  {
    if (error)
    {
      *error = 0LL;
      stat v29 = (os_log_s *)_NSOSLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v40 = -[NSBundle bundleURL](self, "bundleURL");
        v41 = *error;
        *(_DWORD *)buf = 138412546;
        v53 = v40;
        __int16 v54 = 2112;
        v55 = v41;
        _os_log_error_impl( &dword_182EB1000,  v29,  OS_LOG_TYPE_ERROR,  "NSBundle %@ loading failed because of an error %@",  buf,  0x16u);
      }
    }

    int v25 = 0;
  }

  v30 = (void *)_CFGetTSD();
  _CFSetTSD();
  if ((unint64_t)v30 >= 2)
  {
    free(v30);
    if ((v25 & 1) == 0)
    {
LABEL_63:
      objc_autoreleasePoolPop(context);
      if (error) {
        v37 = *error;
      }
      Class PrincipalClassFromInfoDict = _NSBundleGetPrincipalClassFromInfoDict((unint64_t *)self);
      os_unfair_lock_unlock(p_lock);
      _NSBundleInitializePrincipalClass((uint64_t)PrincipalClassFromInfoDict);
      return 0;
    }
  }

  else if (!v25)
  {
    goto LABEL_63;
  }

  do
    unint64_t v31 = __ldaxr(p_flags);
  while (__stlxr(v31 | 0x4000000, p_flags));
  objc_autoreleasePoolPop(context);
  Class v32 = _NSBundleGetPrincipalClassFromInfoDict((unint64_t *)self);
  os_unfair_lock_unlock(p_lock);
  _NSBundleInitializePrincipalClass((uint64_t)v32);
  if (![v7 count]) {
    return 1;
  }
  v33 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  uint64_t v34 = [v7 countByEnumeratingWithState:&v48 objects:v47 count:16];
  if (!v34) {
    return 1;
  }
  uint64_t v35 = *(void *)v49;
  do
  {
    for (uint64_t j = 0LL; j != v34; ++j)
    {
      if (*(void *)v49 != v35) {
        objc_enumerationMutation(v7);
      }
      -[NSNotificationCenter postNotification:](v33, "postNotification:", *(void *)(*((void *)&v48 + 1) + 8 * j));
    }

    uint64_t v34 = [v7 countByEnumeratingWithState:&v48 objects:v47 count:16];
    BOOL result = 1;
  }

  while (v34);
  return result;
}

- (BOOL)unload
{
  v3 = -[NSBundle _cfBundleIfPresent](self, "_cfBundleIfPresent");
  if (v3)
  {
    v4 = v3;
    CFBundleUnloadExecutable(v3);
    if (CFBundleIsExecutableLoaded(v4))
    {
      LOBYTE(v3) = 0;
    }

    else
    {
      p_flags = &self->_flags;
      int v6 = atomic_load(&self->_flags);
      if ((v6 & 0x4000000) != 0)
      {
        do
          unint64_t v7 = __ldaxr(p_flags);
        while (__stlxr(v7 & 0xFFFFFFFFF9FFFFFFLL, p_flags));
      }

      LOBYTE(v3) = 1;
    }
  }

  return (char)v3;
}

- (BOOL)isLoaded
{
  int v2 = atomic_load(&self->_flags);
  if ((v2 & 0x4000000) != 0)
  {
    LOBYTE(v3) = 1;
  }

  else
  {
    v3 = -[NSBundle _cfBundleIfPresent](self, "_cfBundleIfPresent");
    if (v3) {
      LOBYTE(v3) = CFBundleIsExecutableLoaded(v3) != 0;
    }
  }

  return (char)v3;
}

- (NSBundle)initWithURL:(NSURL *)url
{
  if (url)
  {
    if (-[NSURL isFileURL](url, "isFileURL")) {
      return -[NSBundle initWithPath:](self, "initWithPath:", -[NSURL path](url, "path"));
    }
    unint64_t v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: non-file URL argument",  _NSMethodExceptionProem((objc_class *)self, a2));
  }

  else
  {
    unint64_t v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: nil URL argument",  _NSMethodExceptionProem((objc_class *)self, a2));
  }

  int v8 = v7;

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v8 userInfo:0]);
  return (NSBundle *)-[NSBundle _initUniqueWithURL:](v9, v10, v11);
}

- (id)_initUniqueWithURL:(id)a3
{
  p_flags = &self->_flags;
  do
    unint64_t v4 = __ldaxr(p_flags);
  while (__stlxr(v4 | 0x10000000, p_flags));
  return -[NSBundle initWithURL:](self, "initWithURL:", a3);
}

+ (NSBundle)bundleWithURL:(NSURL *)url
{
  return (NSBundle *)(id)[objc_allocWithZone((Class)a1) initWithURL:url];
}

+ (id)_bundleWithIdentifier:(id)a3 andLibraryName:(id)a4
{
  if (!a3) {
    return 0LL;
  }
  int v6 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  if (!-[NSString isEqualToString:](-[NSBundle bundleIdentifier](v6, "bundleIdentifier"), "isEqualToString:", a3))
  {
    BundleWithIdentifierAndLibraryName = (__CFBundle *)_CFBundleGetBundleWithIdentifierAndLibraryName();
    if (BundleWithIdentifierAndLibraryName)
    {
      CFURLRef v8 = CFBundleCopyBundleURL(BundleWithIdentifierAndLibraryName);
      if (v8)
      {
        CFURLRef v9 = v8;
        SEL v10 = (void *)[a1 bundleWithURL:v8];
        CFRelease(v9);
        return v10;
      }
    }

    return 0LL;
  }

  return v6;
}

- (id)_initUniqueWithPath:(id)a3
{
  p_flags = &self->_flags;
  do
    unint64_t v4 = __ldaxr(p_flags);
  while (__stlxr(v4 | 0x10000000, p_flags));
  return -[NSBundle initWithPath:](self, "initWithPath:", a3);
}

- (NSString)bundlePath
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (_CFExecutableLinkedOnOrAfter()
    || (CFURLRef v8 = (NSString *)(id)[self->_initialPath copy]) == 0)
  {
    v3 = -[NSBundle _cfBundle](self, "_cfBundle");
    if (v3)
    {
      CFURLRef v4 = CFBundleCopyBundleURL(v3);
      if (v4)
      {
        CFURLRef v5 = v4;
        int v6 = (NSString *)-[__CFURL path](v4, "path");
        CFRelease(v5);
        return v6;
      }
    }

    CFURLRef v8 = (NSString *)(id)[self->_resolvedPath copy];
    CFURLRef v9 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 134218242;
      id v11 = self;
      __int16 v12 = 2112;
      size_t v13 = v8;
      _os_log_error_impl( &dword_182EB1000,  v9,  OS_LOG_TYPE_ERROR,  "This bundle %p does not have a valid path. Using backstop: %@",  (uint8_t *)&v10,  0x16u);
    }
  }

  return v8;
}

- (NSURL)bundleURL
{
  if (_CFExecutableLinkedOnOrAfter()
    || (id v5 = (id)[self->_initialPath copy]) == 0)
  {
    BOOL result = -[NSBundle _cfBundle](self, "_cfBundle");
    if (!result) {
      return result;
    }
    CFURLRef v4 = CFBundleCopyBundleURL((CFBundleRef)result);
  }

  else
  {
    CFURLRef v4 = (CFURLRef)[objc_allocWithZone(MEMORY[0x189604030]) initFileURLWithPath:v5 isDirectory:1];
  }

  return (NSURL *)v4;
}

- (NSString)resourcePath
{
  int v2 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (!v2) {
    return 0LL;
  }
  CFURLRef v3 = CFBundleCopyResourcesDirectoryURL(v2);
  if (!v3) {
    return 0LL;
  }
  CFURLRef v4 = v3;
  id v5 = (NSString *)-[__CFURL path](v3, "path");
  CFRelease(v4);
  return v5;
}

- (NSURL)resourceURL
{
  int v2 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v2) {
    int v2 = CFBundleCopyResourcesDirectoryURL(v2);
  }
  return (NSURL *)v2;
}

- (NSString)executablePath
{
  int v2 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (!v2) {
    return 0LL;
  }
  CFURLRef v3 = CFBundleCopyExecutableURL(v2);
  if (!v3) {
    return 0LL;
  }
  CFURLRef v4 = v3;
  id v5 = (NSString *)-[__CFURL path](v3, "path");
  CFRelease(v4);
  return v5;
}

- (NSURL)executableURL
{
  int v2 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v2) {
    int v2 = CFBundleCopyExecutableURL(v2);
  }
  return (NSURL *)v2;
}

- (NSURL)appStoreReceiptURL
{
  if (_iOSStyleReceipt_onceToken != -1) {
    dispatch_once(&_iOSStyleReceipt_onceToken, &__block_literal_global_220);
  }
  if (-[NSBundle isEqual:]( self,  "isEqual:",  +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"))
    && (Class v3 = objc_lookUpClass("LSBundleProxy")) != 0LL)
  {
    return (NSURL *)objc_msgSend( (id)-[objc_class bundleProxyForCurrentProcess](v3, "bundleProxyForCurrentProcess"),  "appStoreReceiptURL");
  }

  else
  {
    return 0LL;
  }

- (id)_wrappedBundleURL
{
  int v2 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v2) {
    int v2 = (__CFBundle *)_CFBundleCopyWrappedBundleURL();
  }
  return v2;
}

- (id)_wrapperContainerURL
{
  int v2 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v2) {
    int v2 = (__CFBundle *)_CFBundleCopyWrapperContainerURL();
  }
  return v2;
}

- (NSString)pathForAuxiliaryExecutable:(NSString *)executableName
{
  CFURLRef v4 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (!executableName) {
    return 0LL;
  }
  if (!v4) {
    return 0LL;
  }
  CFURLRef v5 = CFBundleCopyAuxiliaryExecutableURL(v4, (CFStringRef)executableName);
  if (!v5) {
    return 0LL;
  }
  CFURLRef v6 = v5;
  unint64_t v7 = (NSString *)-[__CFURL path](v5, "path");
  CFRelease(v6);
  return v7;
}

- (NSURL)URLForAuxiliaryExecutable:(NSString *)executableName
{
  CFURLRef v4 = -[NSBundle _cfBundle](self, "_cfBundle");
  CFURLRef v5 = 0LL;
  if (executableName && v4) {
    CFURLRef v5 = CFBundleCopyAuxiliaryExecutableURL(v4, (CFStringRef)executableName);
  }
  return (NSURL *)v5;
}

- (NSString)privateFrameworksPath
{
  int v2 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (!v2) {
    return 0LL;
  }
  CFURLRef v3 = CFBundleCopyPrivateFrameworksURL(v2);
  if (!v3) {
    return 0LL;
  }
  CFURLRef v4 = v3;
  CFURLRef v5 = (NSString *)-[__CFURL path](v3, "path");
  CFRelease(v4);
  return v5;
}

- (NSURL)privateFrameworksURL
{
  int v2 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v2) {
    int v2 = CFBundleCopyPrivateFrameworksURL(v2);
  }
  return (NSURL *)v2;
}

- (NSString)sharedFrameworksPath
{
  int v2 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (!v2) {
    return 0LL;
  }
  CFURLRef v3 = CFBundleCopySharedFrameworksURL(v2);
  if (!v3) {
    return 0LL;
  }
  CFURLRef v4 = v3;
  CFURLRef v5 = (NSString *)-[__CFURL path](v3, "path");
  CFRelease(v4);
  return v5;
}

- (NSURL)sharedFrameworksURL
{
  int v2 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v2) {
    int v2 = CFBundleCopySharedFrameworksURL(v2);
  }
  return (NSURL *)v2;
}

- (NSString)sharedSupportPath
{
  int v2 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (!v2) {
    return 0LL;
  }
  CFURLRef v3 = CFBundleCopySharedSupportURL(v2);
  if (!v3) {
    return 0LL;
  }
  CFURLRef v4 = v3;
  CFURLRef v5 = (NSString *)-[__CFURL path](v3, "path");
  CFRelease(v4);
  return v5;
}

- (NSURL)sharedSupportURL
{
  int v2 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v2) {
    int v2 = CFBundleCopySharedSupportURL(v2);
  }
  return (NSURL *)v2;
}

- (NSString)builtInPlugInsPath
{
  int v2 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (!v2) {
    return 0LL;
  }
  CFURLRef v3 = CFBundleCopyBuiltInPlugInsURL(v2);
  if (!v3) {
    return 0LL;
  }
  CFURLRef v4 = v3;
  CFURLRef v5 = (NSString *)-[__CFURL path](v3, "path");
  CFRelease(v4);
  return v5;
}

- (NSURL)builtInPlugInsURL
{
  int v2 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v2) {
    int v2 = CFBundleCopyBuiltInPlugInsURL(v2);
  }
  return (NSURL *)v2;
}

- (NSString)bundleIdentifier
{
  int v2 = -[NSBundle infoDictionary](self, "infoDictionary");
  return (NSString *)-[NSDictionary objectForKey:](v2, "objectForKey:", *MEMORY[0x189604E00]);
}

- (unint64_t)versionNumber
{
  unint64_t result = -[NSBundle _cfBundle](self, "_cfBundle");
  if (result) {
    return CFBundleGetVersionNumber((CFBundleRef)result);
  }
  return result;
}

- (id)bundleLanguages
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  int v2 = -[NSBundle localizations](self, "localizations");
  CFURLRef v3 = (void *)[MEMORY[0x189603FA8] array];
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v4 = -[NSArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v10,  v9,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend( v3,  "addObject:",  objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7++), "stringByAppendingString:", @".lproj"));
      }

      while (v5 != v7);
      uint64_t v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v10,  v9,  16LL);
    }

    while (v5);
  }

  return v3;
}

- (void)invalidateResourceCache
{
  if (-[NSBundle _cfBundle](self, "_cfBundle")) {
    _CFBundleFlushBundleCaches();
  }
}

- (Class)classNamed:(NSString *)className
{
  uint64_t v5 = NSClassFromString(className);
  if ((NSBundle *)[(id)objc_opt_class() bundleForClass:v5] == self) {
    return v5;
  }
  else {
    return 0LL;
  }
}

- (Class)principalClass
{
  if (self->_principalClass)
  {
    os_unfair_lock_unlock(&self->_lock);
  }

  else
  {
    self->_principalClass = _NSBundleGetPrincipalClassFromInfoDict((unint64_t *)self);
    os_unfair_lock_unlock(&self->_lock);
    _NSBundleInitializePrincipalClass((uint64_t)self->_principalClass);
  }

  return self->_principalClass;
}

+ (NSBundle)bundleForClass:(Class)aClass
{
  if (aClass)
  {
    Class = object_getClass(aClass);
    if (class_respondsToSelector(Class, sel_bundleForClass))
    {
      uint64_t v5 = (NSBundle *)-[objc_class bundleForClass](aClass, "bundleForClass");
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v5) {
          return v5;
        }
      }
    }

    uint64_t v6 = (id *)+[__NSBundleTables bundleTables]();
    uint64_t v5 = (NSBundle *)-[__NSBundleTables bundleForClass:](v6, (uint64_t)aClass);
    if (v5) {
      return v5;
    }
    ImageName = class_getImageName(aClass);
    if (ImageName)
    {
      uint64_t v9 = (uint64_t)ImageName;
      size_t v10 = strnlen(ImageName, 0x402uLL);
      id v11 = _NSFileSystemRepresentationString(v9, v10);
      __int128 v12 = (void *)normalizedPath(v11);
      if (v12)
      {
        __int128 v13 = v12;
        uint64_t v14 = _NSFrameworkPathFromLibraryPath(v12);
        if (v14 || (uint64_t v14 = _NSBundlePathFromExecutablePath(v13)) != 0LL)
        {
          __int128 v15 = -[NSBundle initWithPath:](objc_alloc(&OBJC_CLASS___NSBundle), "initWithPath:", v14);
          if (v15)
          {
            uint64_t v5 = v15;
            p_flags = &v15->_flags;
            do
              unint64_t v17 = __ldaxr(p_flags);
            while (__stlxr(v17 | 0x4000000, p_flags));
            do
              unint64_t v18 = __ldaxr(p_flags);
            while (__stlxr(v18 | 0x30000, p_flags));
            do
              unint64_t v19 = __ldaxr(p_flags);
            while (__stlxr(v19 | 8, p_flags));
            unint64_t v20 = (id *)+[__NSBundleTables bundleTables]();
            -[__NSBundleTables addBundle:forPath:withType:forClass:isImmortal:]( v20,  v5,  0LL,  196608LL,  (uint64_t)aClass,  1);
            return v5;
          }
        }
      }
    }
  }

  return +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
}

- (NSDictionary)infoDictionary
{
  unint64_t result = -[NSBundle _cfBundle](self, "_cfBundle");
  if (result) {
    return (NSDictionary *)CFBundleGetInfoDictionary((CFBundleRef)result);
  }
  return result;
}

- (NSDictionary)localizedInfoDictionary
{
  unint64_t result = -[NSBundle _cfBundle](self, "_cfBundle");
  if (result) {
    return (NSDictionary *)CFBundleGetLocalInfoDictionary((CFBundleRef)result);
  }
  return result;
}

- (id)objectForInfoDictionaryKey:(NSString *)key
{
  id result = -[NSDictionary objectForKey:]( -[NSBundle localizedInfoDictionary](self, "localizedInfoDictionary"),  "objectForKey:",  key);
  if (!result) {
    return -[NSDictionary objectForKey:](-[NSBundle infoDictionary](self, "infoDictionary"), "objectForKey:", key);
  }
  return result;
}

- (id)_objectForUnlocalizedInfoDictionaryKey:(id)a3
{
  return -[NSDictionary objectForKey:](-[NSBundle infoDictionary](self, "infoDictionary"), "objectForKey:", a3);
}

+ (id)loadedBundles
{
  id v2 = +[__NSBundleTables bundleTables]();
  return (id)-[__NSBundleTables loadedBundles]((uint64_t)v2);
}

+ (NSArray)allBundles
{
  id v2 = +[__NSBundleTables bundleTables]();
  return (NSArray *)-[__NSBundleTables allBundles]((uint64_t)v2);
}

- (void)__static
{
  p_flags = &self->_flags;
  do
    unint64_t v3 = __ldaxr(p_flags);
  while (__stlxr(v3 | 0x30000, p_flags));
}

+ (NSArray)allFrameworks
{
  if (allFrameworks_onceToken != -1) {
    dispatch_once(&allFrameworks_onceToken, &__block_literal_global_40);
  }
  id v2 = +[__NSBundleTables bundleTables]();
  return (NSArray *)-[__NSBundleTables allFrameworks]((uint64_t)v2);
}

uint64_t __25__NSBundle_allFrameworks__block_invoke()
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v0 = objc_alloc_init(MEMORY[0x189603FE0]);
  v1 = (void *)MEMORY[0x186E1FF60]();
  id v2 = objc_alloc_init(MEMORY[0x189603FC8]);
  unint64_t v3 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  uint64_t v4 = objc_copyImageNames(&outCount);
  if (v4)
  {
    uint64_t v5 = v4;
    if (outCount)
    {
      for (unint64_t i = 0LL; i < outCount; ++i)
      {
        uint64_t v7 = v5[i];
        size_t v8 = strnlen(v7, 0x402uLL);
        id v9 = _NSFileSystemRepresentationString((uint64_t)v7, v8);
        uint64_t v10 = normalizedPath(v9);
        if (v10)
        {
          id v11 = (void *)v10;
          if (![v2 objectForKey:v10])
          {
            __int128 v12 = _NSFrameworkPathFromLibraryPath(v11);
            if (v12 || (__int128 v12 = _NSBundlePathFromExecutablePath(v11)) != 0LL)
            {
              __int128 v13 = -[NSBundle initWithPath:](objc_alloc(&OBJC_CLASS___NSBundle), "initWithPath:", v12);
              if (v13)
              {
                uint64_t v14 = v13;
                [v2 setObject:v13 forKey:v11];

                p_flags = &v14->_flags;
                do
                  unint64_t v16 = __ldaxr(p_flags);
                while (__stlxr(v16 | 0x4000000, p_flags));
                if (v3 != v14) {
                  [v0 addObject:v14];
                }
              }
            }
          }
        }
      }
    }

    free(v5);
  }

  objc_autoreleasePoolPop(v1);
  id v17 = v0;
  id v18 = +[__NSBundleTables bundleTables]();
  return -[__NSBundleTables addStaticFrameworkBundles:]((uint64_t)v18, v17);
}

+ (NSBundle)mainBundle
{
  unint64_t v3 = (char *)(id)qword_18C496568;
  if (!v3)
  {
    os_unfair_lock_unlock(&stru_18C496564);
    MainBundle = CFBundleGetMainBundle();
    uint64_t v5 = MainBundle;
    if (MainBundle
      && (uint64_t v6 = CFBundleCopyBundleURL(MainBundle),
          CFStringRef v7 = CFURLCopyFileSystemPath(v6, kCFURLPOSIXPathStyle),
          CFRelease(v6),
          v7))
    {
      unint64_t v3 = (char *)[objc_alloc((Class)a1) initWithPath:v7];
      CFRelease(v7);
    }

    else
    {
      unint64_t v3 = 0LL;
    }

    os_unfair_lock_lock(&stru_18C496564);
    if (qword_18C496568)
    {

      unint64_t v3 = (char *)(id)qword_18C496568;
    }

    else if (v3)
    {
      size_t v8 = v5;
      atomic_store((unint64_t)v5, (unint64_t *)v3 + 2);
      id v9 = (unint64_t *)(v3 + 8);
      do
        unint64_t v10 = __ldaxr(v9);
      while (__stlxr(v10 | 0x10000, v9));
      do
        unint64_t v11 = __ldaxr(v9);
      while (__stlxr(v11 | 0x4000000, v9));
      if (*((void *)v3 + 6))
      {
        id v12 = *((id *)v3 + 5);
        *((void *)v3 + 5) = [*((id *)v3 + 6) copy];
      }

      id v13 = +[__NSBundleTables bundleTables]();
      -[__NSBundleTables removeBundle:forPath:type:]((uint64_t)v13, v3, 0LL, 0x20000LL);
      qword_18C496568 = v3;
    }
  }

  os_unfair_lock_unlock(&stru_18C496564);
  return (NSBundle *)v3;
}

+ (id)debugDescription
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "loadedBundles"), "description");
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = -[NSBundle bundlePath](self, "bundlePath");
  BOOL v5 = -[NSBundle isLoaded](self, "isLoaded");
  uint64_t v6 = @"not yet ";
  if (v5) {
    uint64_t v6 = &stru_189CA6A28;
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ <%@> (%@loaded)",  v3,  v4,  v6);
}

- (NSArray)localizations
{
  id v2 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v2) {
    id v2 = CFBundleCopyBundleLocalizations(v2);
  }
  return (NSArray *)v2;
}

- (NSArray)preferredLocalizations
{
  return +[NSBundle preferredLocalizationsFromArray:]( &OBJC_CLASS___NSBundle,  "preferredLocalizationsFromArray:",  -[NSBundle localizations](self, "localizations"));
}

- (NSString)developmentLocalization
{
  id result = -[NSBundle _cfBundle](self, "_cfBundle");
  if (result) {
    return (NSString *)(id)(id)CFBundleGetDevelopmentRegion((CFBundleRef)result);
  }
  return result;
}

+ (NSArray)preferredLocalizationsFromArray:(NSArray *)localizationsArray
{
  if (localizationsArray) {
    return (NSArray *)CFBundleCopyPreferredLocalizationsFromArray((CFArrayRef)localizationsArray);
  }
  else {
    return (NSArray *)0LL;
  }
}

+ (NSArray)preferredLocalizationsFromArray:(NSArray *)localizationsArray forPreferences:(NSArray *)preferencesArray
{
  if (localizationsArray) {
    return (NSArray *) CFBundleCopyLocalizationsForPreferences( (CFArrayRef)localizationsArray,  (CFArrayRef)preferencesArray);
  }
  else {
    return (NSArray *)0LL;
  }
}

- (BOOL)preflightAndReturnError:(NSError *)error
{
  v13[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = -[NSBundle _cfBundle](self, "_cfBundle");
  v13[0] = 0LL;
  if (!v4)
  {
    if (error)
    {
      BOOL v5 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  4LL,  0LL);
      goto LABEL_7;
    }

    return 0;
  }

  if ((_MergedGlobals_91 & 1) != 0)
  {
    if (error)
    {
      CFGetAllocator(v4);
      BOOL v5 = (NSError *)_CFBundleCreateError();
LABEL_7:
      uint64_t v6 = v5;
      BOOL result = 0;
LABEL_18:
      if (!result)
      {
        id v12 = v6;
        BOOL result = 0;
        *error = v12;
      }

      return result;
    }

    return 0;
  }

  if (error) {
    size_t v8 = (CFErrorRef *)v13;
  }
  else {
    size_t v8 = 0LL;
  }
  int v9 = CFBundlePreflightExecutable(v4, v8);
  BOOL v10 = v9 == 0;
  BOOL result = v9 != 0;
  if (!v10 || error == 0LL) {
    uint64_t v6 = 0LL;
  }
  else {
    uint64_t v6 = (NSError *)v13[0];
  }
  if (error) {
    goto LABEL_18;
  }
  return result;
}

- (NSArray)executableArchitectures
{
  id v2 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v2) {
    id v2 = CFBundleCopyExecutableArchitectures(v2);
  }
  return (NSArray *)v2;
}

- (NSAttributedString)localizedAttributedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName
{
  return (NSAttributedString *)-[NSBundle localizedAttributedStringForKey:value:table:localization:]( self,  "localizedAttributedStringForKey:value:table:localization:",  key,  value,  tableName,  0LL);
}

- (id)localizedAttributedStringForKey:(id)a3 value:(id)a4 table:(id)a5 localization:(id)a6
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    unint64_t v11 = @"Localizable";
    os_unfair_lock_lock(&self->_lock);
    if (!a6)
    {
      attributedStringTable = self->_attributedStringTable;
      if (attributedStringTable)
      {
        uint64_t v21 = (void *)-[NSMutableDictionary objectForKey:](attributedStringTable, "objectForKey:", v11);
        if (v21)
        {
          uint64_t v22 = objc_msgSend((id)objc_msgSend(v21, "objectForKey:", a3), "copy");
          if (v22)
          {
            v23 = (void *)v22;
            os_unfair_lock_unlock(&self->_lock);
            return v23;
          }
        }
      }
    }

    os_unfair_lock_unlock(&self->_lock);
    v33 = 0LL;
    if (-[NSBundle _cfBundle](self, "_cfBundle"))
    {
      id v12 = (void *)_CFBundleCopyLocalizedStringForLocalizationAndTableURL();
      id v13 = (void *)objc_msgSend(v12, "__baseAttributedString");
      if (!v13)
      {
        if (v12)
        {
          uint64_t v14 = -[NSBundle _cfBundle](self, "_cfBundle");
          FormatSpecifierConfiguration = (void *)_CFStringGetFormatSpecifierConfiguration();
          unint64_t v16 =  _NSStringCreateByParsingMarkdownAndOptionallyInflecting( v12,  v14,  0LL,  FormatSpecifierConfiguration,  1);
LABEL_20:
          id v17 = v16;
LABEL_29:

          if (!v17)
          {
            id v27 = a3;
            if (a4)
            {
              if ([a4 length]) {
                id v27 = a4;
              }
              else {
                id v27 = a3;
              }
            }

            id v17 =  -[NSAttributedString initWithString:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:",  v27);
          }

          char v28 = objc_msgSend(a5, "hasSuffix:", @".nocache", v33);
          if (!a6 && (v28 & 1) == 0)
          {
            os_unfair_lock_lock(&self->_lock);
            stat v29 = self->_attributedStringTable;
            if (!v29)
            {
              stat v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
              self->_attributedStringTable = v29;
            }

            v30 = (void *)-[NSMutableDictionary objectForKey:](v29, "objectForKey:", v11);
            unint64_t v31 = (void *)-[NSMutableAttributedString copy](v17, "copy");
            if (v30)
            {
              [v30 setObject:v31 forKey:a3];
            }

            else
            {
              id v32 = objc_alloc_init(MEMORY[0x189603FC8]);
              [v32 setObject:v31 forKey:a3];
              -[NSMutableDictionary setObject:forKey:](self->_attributedStringTable, "setObject:forKey:", v32, v11);
            }

            os_unfair_lock_unlock(&self->_lock);
          }

          return v17;
        }

- (id)_localizedStringNoCacheNoMarkdownParsingForKey:(id)a3 value:(id)a4 table:(id)a5 localizations:(id)a6 actualTableURL:(id *)a7 formatSpecifierConfiguration:(id *)a8
{
  BOOL v10 = -[NSBundle _cfBundle](self, "_cfBundle");
  if (v10)
  {
    unint64_t v11 = (void *)_CFBundleCopyLocalizedStringForLocalizationTableURLAndMarkdownOption();
    BOOL v10 = 0LL;
    if (!a7) {
      goto LABEL_7;
    }
  }

  else
  {
    unint64_t v11 = 0LL;
    if (!a7) {
      goto LABEL_7;
    }
  }

  if (v11) {
    id v12 = v10;
  }
  else {
    id v12 = 0LL;
  }
  *a7 = v12;
LABEL_7:
  id v13 = v10;
  if (a8)
  {
    if (v11) {
      FormatSpecifierConfiguration = (void *)_CFStringGetFormatSpecifierConfiguration();
    }
    else {
      FormatSpecifierConfiguration = 0LL;
    }
    *a8 = FormatSpecifierConfiguration;
  }

  return v11;
}

- (void)setPreservationPriority:(double)priority forTags:(NSSet *)tags
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v6 = +[_NSBundleODRDataForApplications dataForBundle:createIfRequired:]( (uint64_t)&OBJC_CLASS____NSBundleODRDataForApplications,  (uint64_t)self,  1);
  if (v6)
  {
    p_isa = (id *)&v6->super.super.isa;
    initialStateGroup = (dispatch_group_s *)v6->_initialStateGroup;
    dispatch_time_t v9 = dispatch_time(0LL, 3000000000LL);
    if (dispatch_group_wait(initialStateGroup, v9))
    {
      if (qword_18C497F90 != -1) {
        dispatch_once(&qword_18C497F90, &__block_literal_global_300);
      }
      BOOL v10 = (os_log_s *)qword_18C497F88;
      if (os_log_type_enabled((os_log_t)qword_18C497F88, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)__int128 v15 = 0;
        _os_log_debug_impl( &dword_182EB1000,  v10,  OS_LOG_TYPE_DEBUG,  "Unable to connect to daemon to set preservation priority",  v15,  2u);
      }
    }

    else
    {
      [p_isa[2] lock];
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      uint64_t v11 = -[NSSet countByEnumeratingWithState:objects:count:]( tags,  "countByEnumeratingWithState:objects:count:",  &v16,  v15,  16LL);
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v17;
        do
        {
          for (uint64_t i = 0LL; i != v12; ++i)
          {
            if (*(void *)v17 != v13) {
              objc_enumerationMutation(tags);
            }
            objc_msgSend( (id)objc_msgSend(p_isa[5], "objectForKey:", *(void *)(*((void *)&v16 + 1) + 8 * i)),  "setPreservationPriority:",  priority);
          }

          uint64_t v12 = -[NSSet countByEnumeratingWithState:objects:count:]( tags,  "countByEnumeratingWithState:objects:count:",  &v16,  v15,  16LL);
        }

        while (v12);
      }

      [p_isa[2] unlock];
      objc_msgSend( (id)objc_msgSend( +[NSBundleResourceRequest _connection](NSBundleResourceRequest, "_connection"),  "remoteObjectProxy"),  "setPreservationPriority:forTags:inBundle:",  tags,  objc_msgSend(p_isa[3], "bundleURL"),  priority);
    }
  }

- (void)setPreservationPriority:(double)a3 forTag:(id)a4
{
}

- (double)preservationPriorityForTag:(NSString *)tag
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v4 = +[_NSBundleODRDataForApplications dataForBundle:createIfRequired:]( (uint64_t)&OBJC_CLASS____NSBundleODRDataForApplications,  (uint64_t)self,  1);
  if (!v4) {
    return 0.0;
  }
  BOOL v5 = v4;
  initialStateGroup = (dispatch_group_s *)v4->_initialStateGroup;
  dispatch_time_t v7 = dispatch_time(0LL, 3000000000LL);
  if (dispatch_group_wait(initialStateGroup, v7))
  {
    if (qword_18C497F90 != -1) {
      dispatch_once(&qword_18C497F90, &__block_literal_global_300);
    }
    size_t v8 = (os_log_s *)qword_18C497F88;
    double v9 = 1.0;
    if (os_log_type_enabled((os_log_t)qword_18C497F88, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_debug_impl( &dword_182EB1000,  v8,  OS_LOG_TYPE_DEBUG,  "Unable to connect to daemon to get preservation priority",  v12,  2u);
    }
  }

  else
  {
    -[NSLock lock](v5->super._lock, "lock");
    objc_msgSend(-[NSDictionary objectForKey:](v5->_tagToTagState, "objectForKey:", tag), "preservationPriority");
    double v9 = v10;
    -[NSLock unlock](v5->super._lock, "unlock");
  }

  return v9;
}

@end
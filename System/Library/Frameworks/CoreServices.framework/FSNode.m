@interface FSNode
+ (BOOL)canAccessURL:(id)a3 fromSandboxWithAuditToken:(id *)a4 operation:(const char *)a5;
+ (BOOL)canAccessURL:(id)a3 withAuditToken:(id *)a4 operation:(const char *)a5;
+ (BOOL)canReadMetadataOfURL:(id)a3 fromSandboxWithAuditToken:(id *)a4;
+ (BOOL)canReadMetadataOfURL:(id)a3 withAuditToken:(id *)a4;
+ (BOOL)canReadURL:(id)a3 fromSandboxWithAuditToken:(id *)a4;
+ (BOOL)canReadURL:(id)a3 withAuditToken:(id *)a4;
+ (BOOL)canWriteURL:(id)a3 fromSandboxWithAuditToken:(id *)a4;
+ (BOOL)canWriteURL:(id)a3 withAuditToken:(id *)a4;
+ (BOOL)getFileSystemRepresentation:(char)a3[1024] forBookmarkData:(id)a4;
+ (BOOL)getVolumeIdentifier:(unint64_t *)a3 forBookmarkData:(id)a4 error:(id *)a5;
+ (BOOL)isBookmarkDataFull:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)_resolvedNodeFromAliasFile:(id)a3 flags:(unsigned int)a4 error:(id *)a5;
+ (id)_resolvedURLFromAliasFile:(id)a3 flags:(unsigned int)a4 error:(id *)a5;
+ (id)nameForBookmarkData:(id)a3 error:(id *)a4;
+ (id)pathForBookmarkData:(id)a3 error:(id *)a4;
+ (id)prebootVolumeNode;
+ (id)rootVolumeNode;
+ (id)systemDataVolumeNode;
+ (unsigned)compareBookmarkData:(id)a3 toBookmarkData:(id)a4;
- (BOOL)canIssueIO;
- (BOOL)canReadFromSandboxWithAuditToken:(id *)a3;
- (BOOL)canReadMetadataFromSandboxWithAuditToken:(id *)a3;
- (BOOL)canReadMetadataWithAuditToken:(id *)a3;
- (BOOL)canReadWithAuditToken:(id *)a3;
- (BOOL)canWriteFromSandboxWithAuditToken:(id *)a3;
- (BOOL)canWriteWithAuditToken:(id *)a3;
- (BOOL)checkResourceIsReachableAndReturnError:(id *)a3;
- (BOOL)childNodeWithRelativePathExists:(id)a3;
- (BOOL)getCachedResourceValueIfPresent:(id *)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)getContentModificationDate:(double *)a3 error:(id *)a4;
- (BOOL)getCreationDate:(double *)a3 error:(id *)a4;
- (BOOL)getDeviceNumber:(int *)a3 error:(id *)a4;
- (BOOL)getFileIdentifier:(unint64_t *)a3 error:(id *)a4;
- (BOOL)getFileSystemRepresentation:(char)a3[1024] error:(id *)a4;
- (BOOL)getFinderInfo:(id *)a3 error:(id *)a4;
- (BOOL)getHFSType:(unsigned int *)a3 creator:(unsigned int *)a4 error:(id *)a5;
- (BOOL)getInodeNumber:(unint64_t *)a3 error:(id *)a4;
- (BOOL)getIsDirectory_NoIO:(BOOL *)a3;
- (BOOL)getLength:(unint64_t *)a3 error:(id *)a4;
- (BOOL)getOwnerUID:(unsigned int *)a3 error:(id *)a4;
- (BOOL)getResourceValue:(id *)a3 forKey:(id)a4 options:(unsigned __int8)a5 error:(id *)a6;
- (BOOL)getTemporaryResourceValue:(id *)a3 forKey:(id)a4;
- (BOOL)getVolumeIdentifier:(unint64_t *)a3 error:(id *)a4;
- (BOOL)getWriterBundleIdentifier:(id *)a3 error:(id *)a4;
- (BOOL)hasHiddenExtension;
- (BOOL)hasPackageBit;
- (BOOL)isAVCHDCollection;
- (BOOL)isAliasFile;
- (BOOL)isBusyDirectory;
- (BOOL)isDirectory;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExecutable;
- (BOOL)isExecutableModeFile;
- (BOOL)isHidden;
- (BOOL)isMountTrigger;
- (BOOL)isOnDiskImage;
- (BOOL)isOnLocalVolume;
- (BOOL)isRegularFile;
- (BOOL)isResolvable;
- (BOOL)isSecuredSystemContent;
- (BOOL)isSymbolicLink;
- (BOOL)isVolume;
- (BOOL)setExtendedAttribute:(id)a3 name:(id)a4 options:(int)a5 error:(id *)a6;
- (BOOL)setFinderInfo:(id *)a3 error:(id *)a4;
- (BOOL)setResourceValue:(id)a3 forKey:(id)a4 options:(unsigned __int8)a5 error:(id *)a6;
- (FSNode)initWithCoder:(id)a3;
- (FSNode)initWithConfigurationString:(int)a3 flags:(unsigned int)a4 error:(id *)a5;
- (FSNode)initWithDirectory:(unint64_t)a3 inDomain:(unint64_t)a4 lastPathComponent:(id)a5 createIntermediateDirectories:(BOOL)a6 flags:(unsigned int)a7 error:(id *)a8;
- (FSNode)initWithFileSystemRepresentation:(const char *)a3 flags:(unsigned int)a4 error:(id *)a5;
- (FSNode)initWithPath:(id)a3 flags:(unsigned int)a4 error:(id *)a5;
- (FSNode)initWithURL:(id)a3 flags:(unsigned int)a4 error:(id *)a5;
- (NSString)description;
- (__CFBundle)copyCFBundleWithError:(id *)a3;
- (id)URL;
- (id)bookmarkDataRelativeToNode:(id)a3 error:(id *)a4;
- (id)bookmarkDataWithOptions:(unint64_t)a3 relativeToNode:(id)a4 error:(id *)a5;
- (id)bundleIdentifierWithContext:(LSContext *)a3 error:(id *)a4;
- (id)bundleIdentifierWithError:(id *)a3;
- (id)bundleInfoDictionaryWithError:(id *)a3;
- (id)canonical:(BOOL)a3 pathWithError:(id *)a4;
- (id)canonicalPathWithError:(id *)a3;
- (id)childNodeWithRelativePath:(id)a3 flags:(unsigned int)a4 error:(id *)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)diskImageURLWithFlags:(unsigned int)a3 error:(id *)a4;
- (id)extendedAttributeWithName:(id)a3 options:(int)a4 error:(id *)a5;
- (id)extensionWithError:(id *)a3;
- (id)initByResolvingBookmarkData:(id)a3 options:(unint64_t)a4 relativeToNode:(id)a5 bookmarkDataIsStale:(BOOL *)a6 error:(id *)a7;
- (id)initByResolvingBookmarkData:(id)a3 relativeToNode:(id)a4 bookmarkDataIsStale:(BOOL *)a5 error:(id *)a6;
- (id)nameWithError:(id *)a3;
- (id)pathWithError:(id *)a3;
- (id)redactedDescription;
- (id)referringAliasNode;
- (id)resolvedNodeWithFlags:(unsigned int)a3 error:(id *)a4;
- (id)temporaryDirectoryNodeWithFlags:(unsigned int)a3 error:(id *)a4;
- (id)volumeNodeWithFlags:(unsigned int)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)clearURLPropertyCacheIfStale;
- (void)encodeWithCoder:(id)a3;
- (void)prepareForReuse;
- (void)removeCachedResourceValueForKey:(id)a3;
- (void)setReferringAliasNode:(id)a3;
- (void)setTemporaryResourceValue:(id)a3 forKey:(id)a4;
@end

@implementation FSNode

- (id)initByResolvingBookmarkData:(id)a3 relativeToNode:(id)a4 bookmarkDataIsStale:(BOOL *)a5 error:(id *)a6
{
  return -[FSNode initByResolvingBookmarkData:options:relativeToNode:bookmarkDataIsStale:error:]( self,  "initByResolvingBookmarkData:options:relativeToNode:bookmarkDataIsStale:error:",  a3,  17152LL,  a4,  a5,  a6);
}

- (id)initByResolvingBookmarkData:(id)a3 options:(unint64_t)a4 relativeToNode:(id)a5 bookmarkDataIsStale:(BOOL *)a6 error:(id *)a7
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    if (a7)
    {
      uint64_t v14 = *MEMORY[0x189607490];
      v15 = @"bookmark";
      objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1, a6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[FSNode(BookmarkData) initByResolvingBookmarkData:options:relativeToNode:bookmarkDataIsStale:error:]",  3807LL,  v11);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  if (!+[FSNode getFileSystemRepresentation:forBookmarkData:]( &OBJC_CLASS___FSNode,  "getFileSystemRepresentation:forBookmarkData:",  __s,  a3,  a5,  a6))
  {
    if (a7)
    {
      uint64_t v16 = *MEMORY[0x189607490];
      v17 = @"bookmark";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[FSNode(BookmarkData) initByResolvingBookmarkData:options:relativeToNode:bookmarkDataIsStale:error:]",  3801LL,  v12);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  size_t v9 = strlen(__s);
  if (v9) {
    uint64_t v10 = 8 * (__s[v9 - 1] == 47);
  }
  else {
    uint64_t v10 = 0LL;
  }
  return -[FSNode initWithFileSystemRepresentation:flags:error:]( self,  "initWithFileSystemRepresentation:flags:error:",  __s,  v10,  a7);
}

+ (BOOL)getFileSystemRepresentation:(char)a3[1024] forBookmarkData:(id)a4
{
  id v5 = a4;
  v6 = v5;
  BOOL v7 = 0;
  if (a3 && v5)
  {
    bzero(a3, 0x400uLL);
    unint64_t v8 = [v6 length];
    if (v8 > 0x3FF)
    {
      BOOL v7 = 0;
    }

    else
    {
      [v6 getBytes:a3 length:v8];
      BOOL v7 = 1;
    }
  }

  return v7;
}

- (FSNode)initWithFileSystemRepresentation:(const char *)a3 flags:(unsigned int)a4 error:(id *)a5
{
  v13[1] = *MEMORY[0x1895F89C0];
  if (a3)
  {
    uint64_t v7 = *(void *)&a4;
    unint64_t v8 = (void *)[objc_alloc(MEMORY[0x189604030]) initFileURLWithFileSystemRepresentation:a3 isDirectory:(a4 >> 3) & 1 relativeToURL:0];
    size_t v9 = -[FSNode initWithURL:flags:error:](self, "initWithURL:flags:error:", v8, v7, a5);
  }

  else
  {
    if (a5)
    {
      uint64_t v12 = *MEMORY[0x189607490];
      v13[0] = @"path";
      [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[FSNode initWithFileSystemRepresentation:flags:error:]",  538LL,  v10);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  return v9;
}

- (FSNode)initWithURL:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  v30[1] = *MEMORY[0x1895F89C0];
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___FSNode;
  size_t v9 = -[FSNode init](&v28, sel_init);
  uint64_t v10 = v9;
  if (!v9)
  {
    if (a5)
    {
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -10810LL,  (uint64_t)"-[FSNode initWithURL:flags:error:]",  248LL,  0LL);
      v20 = 0LL;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      return v20;
    }

    return 0LL;
  }

  if ((*((_BYTE *)v9 + 24) & 0x10) != 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v26,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  v10,  @"FSUtils.mm",  174,  @"Attempted to initialize FSNode %p that was already initialized",  v10);
  }

  p_url = (void **)&v10->_url;
  url = v10->_url;
  v10->_url = 0LL;

  v10->_cacheExpiration = -1LL;
  *((_BYTE *)v10 + 24) = (a4 >> 3) & 8 | *((_BYTE *)v10 + 24) & 0xE0 | 0x10;
  if (!a3 || ![a3 isFileURL])
  {
    if (a5)
    {
      uint64_t v29 = *MEMORY[0x189607490];
      v30[0] = @"aURL";
      [MEMORY[0x189603F68] dictionaryWithObjects:v30 forKeys:&v29 count:1];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x189607670], -50LL, (uint64_t)"-[FSNode initWithURL:flags:error:]", 243LL, v21);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  v13 = *p_url;
  if (*p_url)
  {
    *p_url = 0LL;
  }

  if ((a4 & 0x20) != 0)
  {
    id v27 = 0LL;
    int v14 = [a3 getResourceValue:&v27 forKey:*MEMORY[0x189603B60] error:0];
    id v15 = v27;
    if (v15) {
      int v16 = v14;
    }
    else {
      int v16 = 0;
    }
    if (v16 == 1)
    {
      v17 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189604030]),  "initFileURLWithPath:isDirectory:",  v15,  objc_msgSend(a3, "hasDirectoryPath"));
      v18 = v17;
      if (v17 && ([v17 isEqual:a3] & 1) == 0) {
        objc_storeStrong((id *)&v10->_url, v18);
      }
    }
  }

  if (!*p_url) {
    objc_storeStrong((id *)&v10->_url, a3);
  }
  LODWORD(v19) = (a4 >> 2) & 0x10 | a4;
  if ((a4 & 8) != 0) {
    *((_BYTE *)v10 + 24) = *((_BYTE *)v10 + 24) & 0xFC | 2;
  }
  if ((a4 & 2) == 0)
  {
    v20 = v10;
    goto LABEL_35;
  }

  uint64_t v19 = v19 | 1;
  -[FSNode resolvedNodeWithFlags:error:](v10, "resolvedNodeWithFlags:error:", v19, a5);
  v22 = (FSNode *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (!v22)
  {

    return 0LL;
  }

  if (v10 == v22)
  {
    v20 = v10;
  }

  else
  {
    v20 = v22;
  }

LABEL_35:
  if ((v19 & 1) != 0
    && !-[FSNode checkResourceIsReachableAndReturnError:](v20, "checkResourceIsReachableAndReturnError:", a5))
  {

    return 0LL;
  }

  if ((v19 & 0x10) == 0)
  {
    uint64_t v24 = mach_absolute_time();
    v20->_cacheExpiration = _FSNodeInfoLifetimeAbsolute(void)::nodeInfoLifetimeAbsolute + v24;
  }

  return v20;
}

- (id)URL
{
  if ((*((_BYTE *)self + 24) & 0x10) == 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v5,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"FSUtils.mm",  484,  @"Attempted to use uninitialized FSNode %p.",  self);
  }

  return self->_url;
}

- (void).cxx_destruct
{
}

- (BOOL)isVolume
{
  BOOL v3 = -[FSNode isDirectory](self, "isDirectory");
  if (v3) {
    LOBYTE(v3) = (_FSNodeGetSimpleBoolValue(self, (NSString *)*MEMORY[0x189603CB8], 8LL, 0LL) & 1) != 0
  }
              || -[FSNode isMountTrigger](self, "isMountTrigger");
  return v3;
}

- (BOOL)isDirectory
{
  if ((*((_BYTE *)self + 24) & 3) != 0) {
    return (*((_BYTE *)self + 24) & 3) == 2;
  }
  else {
    return _FSNodeGetSimpleBoolValue(self, (NSString *)*MEMORY[0x189603C48], 2LL, 0LL);
  }
}

- (BOOL)getResourceValue:(id *)a3 forKey:(id)a4 options:(unsigned __int8)a5 error:(id *)a6
{
  v26[1] = *MEMORY[0x1895F89C0];
  id propertyValueTypeRefPtr = 0LL;
  if (!a4)
  {
    if (a6)
    {
      uint64_t v25 = *MEMORY[0x189607490];
      v26[0] = @"key";
      [MEMORY[0x189603F68] dictionaryWithObjects:v26 forKeys:&v25 count:1];
      int v14 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[FSNode getResourceValue:forKey:options:error:]",  781LL,  v14);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_32;
  }

  if ((*((_BYTE *)self + 24) & 3) != 0 && [a4 isEqual:*MEMORY[0x189603C48]])
  {
    [MEMORY[0x189607968] numberWithBool:(*((_BYTE *)self + 24) & 3) == 2];
    id propertyValueTypeRefPtr = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }

  -[FSNode clearURLPropertyCacheIfStale](self, "clearURLPropertyCacheIfStale");
  if ((a5 & 1) != 0)
  {
    id v23 = 0LL;
    -[FSNode URL](self, "URL");
    id v15 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    int v16 = v15;
    if (a6) {
      v17 = (CFErrorRef *)&v23;
    }
    else {
      v17 = 0LL;
    }
    int v18 = CFURLCopyResourcePropertyForKey(v15, (CFStringRef)a4, &propertyValueTypeRefPtr, v17);

    if (a6 != 0LL && v18 == 0)
    {
      *a6 = v23;

      goto LABEL_32;
    }

    if (!v18)
    {
LABEL_32:
      BOOL v21 = 0;
      goto LABEL_33;
    }
  }

  else
  {
    v11 = -[FSNode URL](self, "URL");
    BOOL v12 = _CFURLCopyResourcePropertyForKeyFromCache() == 0;

    if (v12)
    {
      if (a6)
      {
        _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -10655LL,  (uint64_t)"-[FSNode getResourceValue:forKey:options:error:]",  812LL,  0LL);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:
        BOOL v21 = 0;
        *a6 = v13;
        goto LABEL_33;
      }

      goto LABEL_32;
    }
  }

  id v19 = propertyValueTypeRefPtr;
  if (propertyValueTypeRefPtr
    && (*((_BYTE *)self + 24) & 3) == 0
    && [a4 isEqual:*MEMORY[0x189603C48]])
  {
    else {
      char v20 = 1;
    }
    *((_BYTE *)self + 24) = *((_BYTE *)self + 24) & 0xFC | v20;
  }

- (void)clearURLPropertyCacheIfStale
{
  if (self->_cacheExpiration != -1LL)
  {
    uint64_t v3 = mach_absolute_time();
    if (self->_cacheExpiration < v3)
    {
      uint64_t v4 = v3;
      -[FSNode URL](self, "URL");
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 removeAllCachedResourceValues];

      self->_cacheExpiration = _FSNodeInfoLifetimeAbsolute(void)::nodeInfoLifetimeAbsolute + v4;
    }
  }

- (BOOL)isMountTrigger
{
  return _FSNodeGetSimpleBoolValue(self, (NSString *)*MEMORY[0x189603C68], 0x10000LL, 0LL);
}

- (id)extensionWithError:(id *)a3
{
  BOOL v12 = 0LL;
  if (!self || (*((_BYTE *)self + 24) & 8) == 0)
  {
    uint64_t v5 = 0LL;
LABEL_4:
    int v6 = 0;
    goto LABEL_5;
  }

  uint64_t v8 = __CFURLResourceInfoPtr();
  uint64_t v5 = v8;
  if (!v8) {
    goto LABEL_4;
  }
  MEMORY[0x186E297D4](v8, @"com.apple.LSExtensionKey", &v12);
  size_t v9 = (__CFString *)v12;
  if (v12) {
    return v9;
  }
  int v6 = 1;
LABEL_5:
  -[FSNode nameWithError:](self, "nameWithError:", a3);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    _CFGetPathExtensionRangesFromPathComponent();
    BOOL v12 = &stru_189D7B4C8;
  }

  size_t v9 = (__CFString *)v12;
  if (v12) {
    int v10 = v6;
  }
  else {
    int v10 = 0;
  }
  if (v10 == 1)
  {
    MEMORY[0x186E297E0](v5, @"com.apple.LSExtensionKey");
    size_t v9 = (__CFString *)v12;
  }

  return v9;
}

- (id)nameWithError:(id *)a3
{
  id v12 = 0LL;
  if (!self
    || (*((_BYTE *)self + 24) & 8) == 0
    || !__CFURLResourceInfoPtr()
    || (MEMORY[0x186E297C8](), (id v12 = (id)objc_claimAutoreleasedReturnValue()) == 0LL))
  {
    if (!-[FSNode getResourceValue:forKey:options:error:]( self,  "getResourceValue:forKey:options:error:",  &v12,  *MEMORY[0x189603D00],  1LL,  a3))
    {
      -[FSNode URL](self, "URL");
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      char v6 = [v5 isFileReferenceURL];

      if ((v6 & 1) == 0)
      {
        -[FSNode URL](self, "URL");
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 lastPathComponent];
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        id v9 = v12;
        id v12 = v8;
      }
    }
  }

  id v10 = v12;

  return v10;
}

- (BOOL)getVolumeIdentifier:(unint64_t *)a3 error:(id *)a4
{
  id v8 = 0LL;
  BOOL v5 = -[FSNode getResourceValue:forKey:options:error:]( self,  "getResourceValue:forKey:options:error:",  &v8,  *MEMORY[0x189604D38],  1LL,  a4);
  char v6 = !v5;
  if (!a3) {
    char v6 = 1;
  }
  if ((v6 & 1) == 0) {
    *a3 = [v8 unsignedLongLongValue];
  }

  return v5;
}

- (id)canonicalPathWithError:(id *)a3
{
  return -[FSNode canonical:pathWithError:](self, "canonical:pathWithError:", 1LL, a3);
}

- (id)canonical:(BOOL)a3 pathWithError:(id *)a4
{
  BOOL v5 = a3;
  id v20 = 0LL;
  if (a3
    || !self
    || (*((_BYTE *)self + 24) & 8) == 0
    || (v7 = __CFURLResourceInfoPtr(), id v19 = 0LL, !v7)
    || !MEMORY[0x186E297D4](v7, *MEMORY[0x189605448], &v19)
    || (id v8 = v19, (v20 = v8) == 0LL))
  {
    id v9 = (id *)MEMORY[0x189603B60];
    if (!v5) {
      id v9 = (id *)MEMORY[0x189603D10];
    }
    id v10 = *v9;
    if (!-[FSNode getResourceValue:forKey:options:error:]( self,  "getResourceValue:forKey:options:error:",  &v20,  v10,  1LL,  a4))
    {
      v11 = -[FSNode URL](self, "URL");
      char v12 = [v11 isFileReferenceURL];

      if ((v12 & 1) == 0)
      {
        -[FSNode URL](self, "URL");
        id v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 absoluteURL];
        int v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          [v14 path];
          id v15 = (void *)objc_claimAutoreleasedReturnValue();
          id v16 = v20;
          id v20 = v15;
        }
      }
    }

    id v8 = v20;
  }

  id v17 = v8;

  return v17;
}

+ (id)pathForBookmarkData:(id)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    if (!a4)
    {
LABEL_11:
      char v6 = 0LL;
      return v6;
    }

    uint64_t v10 = *MEMORY[0x189607490];
    v11 = @"bookmark";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"+[FSNode(BookmarkData) pathForBookmarkData:error:]",  3850LL,  v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
    *a4 = v8;

    goto LABEL_11;
  }

  if ([a1 getFileSystemRepresentation:__s forBookmarkData:a3])
  {
    [MEMORY[0x1896078A8] defaultManager];
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 stringWithFileSystemRepresentation:__s length:strlen(__s)];
    char v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a4) {
      return v6;
    }
  }

  else
  {
    char v6 = 0LL;
    if (!a4) {
      return v6;
    }
  }

  if (!v6)
  {
    uint64_t v12 = *MEMORY[0x189607490];
    id v13 = @"invalid input parameters";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"+[FSNode(BookmarkData) pathForBookmarkData:error:]",  3847LL,  v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }

  return v6;
}

- (void)prepareForReuse
{
  if ((*((_BYTE *)self + 24) & 0x10) == 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v5,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"FSUtils.mm",  280,  @"Attempted to prepare FSNode %p for reuse, but it was already prepared.",  self);
  }

  url = self->_url;
  self->_url = 0LL;

  -[FSNode setReferringAliasNode:](self, "setReferringAliasNode:", 0LL);
  *((_BYTE *)self + 24) &= ~0x10u;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  BOOL v5 = self;
  id v6 = a3;
  -[FSNode URL](v5, "URL");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v6 URL];
  id v9 = (void *)v8;
  if (v7 && v8 && ([v7 isEqual:v8] & 1) != 0)
  {
    char v10 = 1;
  }

  else
  {
    id v14 = 0LL;
    uint64_t v11 = *MEMORY[0x189603BE0];
    if (-[FSNode getResourceValue:forKey:options:error:]( v5,  "getResourceValue:forKey:options:error:",  &v14,  *MEMORY[0x189603BE0],  1LL,  0LL))
    {
      id v13 = 0LL;
      else {
        char v10 = 0;
      }
    }

    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  id v4 = 0LL;
  if (-[FSNode getResourceValue:forKey:options:error:]( self,  "getResourceValue:forKey:options:error:",  &v4,  *MEMORY[0x189604C10],  1LL,  0LL))
  {
    unint64_t v2 = [v4 hash];
  }

  else
  {
    unint64_t v2 = 0LL;
  }

  return v2;
}

- (NSString)description
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  char v3 = *((_BYTE *)self + 24);
  bzero(v7, 0x400uLL);
  if (!-[FSNode getFileSystemRepresentation:error:](self, "getFileSystemRepresentation:error:", v7, 0LL)) {
    v7[0] = 63;
  }
  if ((v3 & 3) == 2) {
    unsigned int v4 = 121;
  }
  else {
    unsigned int v4 = 63;
  }
  if ((v3 & 3) == 1) {
    uint64_t v5 = 110LL;
  }
  else {
    uint64_t v5 = v4;
  }
  objc_msgSend(NSString, "stringWithFormat:", @"<FSNode %p> { isDir = %c, path = '%s' }", self, v5, v7);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)redactedDescription
{
  int v2 = *((_BYTE *)self + 24) & 3;
  if (v2 == 2) {
    LODWORD(v3) = 121;
  }
  else {
    LODWORD(v3) = 63;
  }
  if (v2 == 1) {
    uint64_t v3 = 110LL;
  }
  else {
    uint64_t v3 = v3;
  }
  objc_msgSend( NSString,  "stringWithFormat:",  @"<FSNode %p> { isDir = %c, path = <private> }",  self,  v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    -[FSNode URL](self, "URL");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if ([(id)__LSDefaultsGetSharedInstance() hasServer])
      {
        id v6 = v5;
        uint64_t v7 = *(void **)(v4 + 8);
        *(void *)(v4 + 8) = v6;
      }

      else
      {
        id v8 = objc_alloc(MEMORY[0x189604030]);
        [v5 relativeString];
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 baseURL];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v10 = [v8 initWithString:v7 relativeToURL:v9];
        uint64_t v11 = *(void **)(v4 + 8);
        *(void *)(v4 + 8) = v10;
      }
    }

    *(void *)(v4 + 16) = self->_cacheExpiration;
    *(_BYTE *)(v4 + 24) = *(_BYTE *)(v4 + 24) & 0xFC | *((_BYTE *)self + 24) & 3;
    -[FSNode referringAliasNode](self, "referringAliasNode");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12) {
      [(id)v4 setReferringAliasNode:v12];
    }
    *(_BYTE *)(v4 + 24) &= ~8u;
    uint64_t v13 = mach_absolute_time();
    *(void *)(v4 + 16) = _FSNodeInfoLifetimeAbsolute(void)::nodeInfoLifetimeAbsolute + v13;
    *(_BYTE *)(v4 + 24) = *(_BYTE *)(v4 + 24) & 0xEF | *((_BYTE *)self + 24) & 0x10;
  }

  return (id)v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "encodeObject:forKey:");

  [a3 encodeInt64:*((_BYTE *)self + 24) & 3 forKey:@"isDirectory"];
  -[FSNode referringAliasNode](self, "referringAliasNode");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "encodeObject:forKey:");
}

- (FSNode)initWithCoder:(id)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  if (v5 && ([v5 isFileURL] & 1) != 0)
  {
    char v7 = [a3 decodeInt64ForKey:@"isDirectory"];
    objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"referringAliasNode");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = 0LL;
    id v9 = -[FSNode initWithURL:flags:error:](self, "initWithURL:flags:error:", v6, 0LL, &v13);
    id v10 = v13;
    if (v9)
    {
      *((_BYTE *)v9 + 24) = *((_BYTE *)v9 + 24) & 0xFC | v7 & 3;
      if (v8) {
        -[FSNode setReferringAliasNode:](v9, "setReferringAliasNode:", v8);
      }
    }

    else
    {
      [a3 failWithError:v10];
    }
  }

  else
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x189607460], 4864LL, (uint64_t)"-[FSNode initWithCoder:]", 450LL, 0LL);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [a3 failWithError:v11];

    id v9 = 0LL;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)canIssueIO
{
  return 1;
}

- (FSNode)initWithPath:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  v13[1] = *MEMORY[0x1895F89C0];
  if (a3)
  {
    uint64_t v7 = *(void *)&a4;
    id v8 = (void *)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:a3 isDirectory:(a4 >> 3) & 1];
    id v9 = -[FSNode initWithURL:flags:error:](self, "initWithURL:flags:error:", v8, v7, a5);
  }

  else
  {
    if (a5)
    {
      uint64_t v12 = *MEMORY[0x189607490];
      v13[0] = @"path";
      [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[FSNode initWithPath:flags:error:]",  525LL,  v10);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  return v9;
}

- (FSNode)initWithDirectory:(unint64_t)a3 inDomain:(unint64_t)a4 lastPathComponent:(id)a5 createIntermediateDirectories:(BOOL)a6 flags:(unsigned int)a7 error:(id *)a8
{
  uint64_t v9 = *(void *)&a7;
  BOOL v10 = a6;
  [MEMORY[0x1896078A8] defaultManager];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 URLsForDirectory:a3 inDomains:a4];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16
    && [v16 count]
    && (([v16 objectAtIndexedSubscript:0], id v17 = (void *)objc_claimAutoreleasedReturnValue(), !a5)
     || ![a5 length]
      ? (id v18 = v17)
      : ([v17 URLByAppendingPathComponent:a5 isDirectory:(v9 >> 3) & 1],
         id v18 = (id)objc_claimAutoreleasedReturnValue()),
        id v19 = v18,
        v17,
        v19))
  {

    if (self && v10)
    {
      id v20 = v19;
      BOOL v21 = v20;
      v22 = v20;
      if ((v9 & 8) == 0)
      {
        uint64_t v23 = [v20 URLByDeletingLastPathComponent];

        v22 = (void *)v23;
      }

      [MEMORY[0x1896078A8] defaultManager];
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      char v25 = [v24 createDirectoryAtURL:v22 withIntermediateDirectories:1 attributes:0 error:a8];

      if ((v25 & 1) == 0)
      {

        self = 0LL;
      }
    }

    if (self) {
      self = -[FSNode initWithURL:flags:error:](self, "initWithURL:flags:error:", v19, v9, a8);
    }
  }

  else
  {
    if (a8)
    {
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -120LL,  (uint64_t)"-[FSNode initWithDirectory:inDomain:lastPathComponent:createIntermediateDirectories:flags:error:]",  570LL,  0LL);
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }

    id v19 = 0LL;
    self = 0LL;
  }

  return self;
}

- (FSNode)initWithConfigurationString:(int)a3 flags:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (confstr(a3, v10, 0x400uLL)) {
    return -[FSNode initWithFileSystemRepresentation:flags:error:]( self,  "initWithFileSystemRepresentation:flags:error:",  v10,  v6,  a5);
  }
  if (a5)
  {
    uint64_t v9 = __error();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607688],  *v9,  (uint64_t)"-[FSNode initWithConfigurationString:flags:error:]",  607LL,  0LL);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (BOOL)setResourceValue:(id)a3 forKey:(id)a4 options:(unsigned __int8)a5 error:(id *)a6
{
  v19[1] = *MEMORY[0x1895F89C0];
  if (a4 && ((a5 & 2) == 0 ? (v8 = a3 == 0LL) : (v8 = 0), !v8 ? (char v9 = 0) : (char v9 = 1), (a5 & 1) != 0 && (v9 & 1) == 0))
  {
    id v17 = 0LL;
    -[FSNode URL](self, "URL");
    uint64_t v11 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = v11;
    if (a6) {
      id v13 = (CFErrorRef *)&v17;
    }
    else {
      id v13 = 0LL;
    }
    BOOL v14 = CFURLSetResourcePropertyForKey(v11, (CFStringRef)a4, a3, v13) != 0;

    if (a6 != 0LL && !v14) {
      *a6 = v17;
    }
  }

  else
  {
    if (a6)
    {
      uint64_t v18 = *MEMORY[0x189607490];
      v19[0] = @"invalid input parameters";
      [MEMORY[0x189603F68] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[FSNode setResourceValue:forKey:options:error:]",  851LL,  v15);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0;
  }

  return v14;
}

- (void)removeCachedResourceValueForKey:(id)a3
{
  if (a3)
  {
    -[FSNode URL](self, "URL");
    uint64_t v4 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    CFURLClearResourcePropertyCacheForKey(v4, (CFStringRef)a3);
  }

- (BOOL)getTemporaryResourceValue:(id *)a3 forKey:(id)a4
{
  return -[FSNode getResourceValue:forKey:options:error:]( self,  "getResourceValue:forKey:options:error:",  a3,  a4,  0LL,  0LL);
}

- (void)setTemporaryResourceValue:(id)a3 forKey:(id)a4
{
  if (a4)
  {
    -[FSNode URL](self, "URL");
    uint64_t v6 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    CFURLSetTemporaryResourcePropertyForKey(v6, (CFStringRef)a4, a3);
  }

- (BOOL)getCachedResourceValueIfPresent:(id *)a3 forKey:(id)a4 error:(id *)a5
{
  return -[FSNode getResourceValue:forKey:options:error:]( self,  "getResourceValue:forKey:options:error:",  a3,  a4,  0LL,  a5);
}

- (BOOL)checkResourceIsReachableAndReturnError:(id *)a3
{
  uint64_t v4 = 0LL;
  return -[FSNode getFileIdentifier:error:](self, "getFileIdentifier:error:", &v4, a3);
}

- (BOOL)childNodeWithRelativePathExists:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (id)childNodeWithRelativePath:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  v19[1] = *MEMORY[0x1895F89C0];
  if (a3)
  {
    uint64_t v6 = *(void *)&a4;
    if ([a3 length])
    {
      if ((v6 & 8) != 0) {
        uint64_t v9 = 1LL;
      }
      else {
        uint64_t v9 = [a3 hasSuffix:@"/"];
      }
      -[FSNode URL](self, "URL");
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 path];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 stringByAppendingPathComponent:a3];
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        uint64_t v15 = (void *)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:v14 isDirectory:v9];

        if (v15)
        {
          id v16 = -[FSNode initWithURL:flags:error:]( objc_alloc(&OBJC_CLASS___FSNode),  "initWithURL:flags:error:",  v15,  v6,  a5);

          return v16;
        }

        return 0LL;
      }

      if (a5)
      {
        _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -2110LL,  (uint64_t)"-[FSNode childNodeWithRelativePath:flags:error:]",  954LL,  0LL);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
    }

    else if (a5)
    {
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -37LL,  (uint64_t)"-[FSNode childNodeWithRelativePath:flags:error:]",  962LL,  0LL);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:
      *a5 = v11;
      return 0LL;
    }
  }

  else if (a5)
  {
    uint64_t v18 = *MEMORY[0x189607490];
    v19[0] = @"childPath";
    [MEMORY[0x189603F68] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[FSNode childNodeWithRelativePath:flags:error:]",  966LL,  v10);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (id)volumeNodeWithFlags:(unsigned int)a3 error:(id *)a4
{
  id v9 = 0LL;
  if (-[FSNode getResourceValue:forKey:options:error:]( self,  "getResourceValue:forKey:options:error:",  &v9,  *MEMORY[0x189603F00],  1LL,  a4))
  {
    uint64_t v6 = objc_alloc(&OBJC_CLASS___FSNode);
    uint64_t v7 = -[FSNode initWithURL:flags:error:](v6, "initWithURL:flags:error:", v9, a3 | 8, a4);
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  return v7;
}

- (id)diskImageURLWithFlags:(unsigned int)a3 error:(id *)a4
{
  id v6 = 0LL;
  -[FSNode getResourceValue:forKey:options:error:]( self,  "getResourceValue:forKey:options:error:",  &v6,  *MEMORY[0x189604BD8],  1LL,  a4);
  id v4 = v6;

  return v4;
}

- (id)referringAliasNode
{
  if ((*((_BYTE *)self + 24) & 4) == 0) {
    return 0LL;
  }
  objc_getAssociatedObject(self, &_kFSNodeReferringAliasNodeKey);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setReferringAliasNode:(id)a3
{
  if (a3)
  {
    char v4 = 4;
  }

  else
  {
    if ((*((_BYTE *)self + 24) & 4) == 0) {
      return;
    }
    char v4 = 0;
  }

  objc_setAssociatedObject(self, &_kFSNodeReferringAliasNodeKey, a3, (void *)1);
  *((_BYTE *)self + 24) = *((_BYTE *)self + 24) & 0xFB | v4;
}

+ (id)_resolvedURLFromAliasFile:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  id v5 = a5;
  v13[1] = *MEMORY[0x1895F89C0];
  if (a3)
  {
    [a3 URL];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((a4 & 0x80) != 0) {
      uint64_t v8 = ~(a4 << 6) & 0x100;
    }
    else {
      uint64_t v8 = ~(a4 << 6) & 0x100 | 0x200LL;
    }
    [MEMORY[0x189604030] URLByResolvingAliasFileAtURL:v7 options:v8 error:v5];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }

  else
  {
    if (a5)
    {
      uint64_t v12 = *MEMORY[0x189607490];
      v13[0] = @"node";
      [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"+[FSNode _resolvedURLFromAliasFile:flags:error:]",  1040LL,  v11);
      *id v5 = (id)objc_claimAutoreleasedReturnValue();

      id v5 = 0LL;
    }

    return v5;
  }

+ (id)_resolvedNodeFromAliasFile:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  v14[1] = *MEMORY[0x1895F89C0];
  if (a3)
  {
    [a1 _resolvedURLFromAliasFile:a3 flags:*(void *)&a4 error:a5];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v10 = v9;
    if (v9)
    {
      if ([v9 isFileURL])
      {
        id v11 = (_BYTE *)[objc_alloc((Class)a1) initWithURL:v10 flags:a4 & 0xFFFFFFFD error:a5];
        if (v11)
        {
        }
      }

      else
      {
        id v11 = a3;
      }
    }

    else
    {
      id v11 = 0LL;
    }

    goto LABEL_11;
  }

  if (a5)
  {
    uint64_t v13 = *MEMORY[0x189607490];
    v14[0] = @"node";
    [MEMORY[0x189603F68] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"+[FSNode _resolvedNodeFromAliasFile:flags:error:]",  1078LL,  v10);
    id v11 = 0LL;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

    return v11;
  }

  return 0LL;
}

- (id)resolvedNodeWithFlags:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  if (!-[FSNode isDirectory](self, "isDirectory")
    && -[FSNode checkResourceIsReachableAndReturnError:](self, "checkResourceIsReachableAndReturnError:", 0LL)
    && -[FSNode isResolvable](self, "isResolvable"))
  {
    [(id)objc_opt_class() _resolvedNodeFromAliasFile:self flags:v5 error:a4];
    uint64_t v7 = (FSNode *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = v7;
    if (v7) {
      BOOL v9 = v7 == self;
    }
    else {
      BOOL v9 = 1;
    }
    char v10 = v9;
    if ((v5 & 8) != 0 && (v10 & 1) == 0)
    {
      *((_BYTE *)v7 + 24) = *((_BYTE *)v7 + 24) & 0xFC | 2;
LABEL_16:
      -[FSNode setReferringAliasNode:](v7, "setReferringAliasNode:", self);
      return v8;
    }

    if ((v10 & 1) == 0) {
      goto LABEL_16;
    }
  }

  else
  {
    uint64_t v8 = self;
  }

  return v8;
}

- (id)temporaryDirectoryNodeWithFlags:(unsigned int)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 temporaryDirectory];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    uint64_t v8 = -[FSNode initWithURL:flags:error:]( objc_alloc(&OBJC_CLASS___FSNode),  "initWithURL:flags:error:",  v7,  a3 | 8,  a4);
  }

  else if (a4)
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -120LL,  (uint64_t)"-[FSNode temporaryDirectoryNodeWithFlags:error:]",  1154LL,  0LL);
    uint64_t v8 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (BOOL)getIsDirectory_NoIO:(BOOL *)a3
{
  id v7 = 0LL;
  BOOL v4 = -[FSNode getResourceValue:forKey:options:error:]( self,  "getResourceValue:forKey:options:error:",  &v7,  *MEMORY[0x189603C48],  0LL,  0LL);
  char v5 = !v4;
  if (!a3) {
    char v5 = 1;
  }
  if ((v5 & 1) == 0) {
    *a3 = [v7 BOOLValue];
  }

  return v4;
}

- (BOOL)isBusyDirectory
{
  return 0;
}

- (BOOL)isExecutableModeFile
{
  if (!-[FSNode isRegularFile](self, "isRegularFile")) {
    return 0;
  }
  id v5 = 0LL;
  if (-[FSNode getResourceValue:forKey:options:error:]( self,  "getResourceValue:forKey:options:error:",  &v5,  *MEMORY[0x189604D10],  1LL,  0LL))
  {
    BOOL v3 = ([v5 unsignedLongLongValue] & 0x49) != 0;
  }

  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)isExecutable
{
  if (!-[FSNode isRegularFile](self, "isRegularFile")) {
    return 0;
  }
  -[FSNode extensionWithError:](self, "extensionWithError:", 0LL);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v4 = v3;
  if (v3 && [v3 length]
    || !-[FSNode isExecutableModeFile](self, "isExecutableModeFile")
    || (int v8 = 1061109567, !-[FSNode getHFSType:creator:error:](self, "getHFSType:creator:error:", &v8, 0LL, 0LL)))
  {
    BOOL v6 = 0;
  }

  else
  {
    if (v8) {
      BOOL v5 = v8 == 1061109567;
    }
    else {
      BOOL v5 = 1;
    }
    BOOL v6 = v5;
  }

  return v6;
}

- (BOOL)isResolvable
{
  return _FSNodeGetSimpleBoolValue(self, (NSString *)*MEMORY[0x189603C38], 0x8000LL, 0LL);
}

- (BOOL)isSymbolicLink
{
  return _FSNodeGetSimpleBoolValue(self, (NSString *)*MEMORY[0x189603C98], 4LL, 0LL);
}

- (BOOL)isAliasFile
{
  BOOL v3 = -[FSNode isResolvable](self, "isResolvable");
  if (v3) {
    LOBYTE(v3) = !-[FSNode isSymbolicLink](self, "isSymbolicLink");
  }
  return v3;
}

- (BOOL)hasPackageBit
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  BOOL v3 = -[FSNode isDirectory](self, "isDirectory");
  if (v3)
  {
    BOOL v4 = -[FSNode getFinderInfo:error:](self, "getFinderInfo:error:", v6, 0LL);
    return *(_DWORD *)&v4 & ((unsigned __int16)(v7 & 0x2000) >> 13);
  }

  return v3;
}

- (BOOL)isRegularFile
{
  return _FSNodeGetSimpleBoolValue(self, (NSString *)*MEMORY[0x189603C88], 1LL, 0LL);
}

- (BOOL)isHidden
{
  return _FSNodeGetSimpleBoolValue(self, (NSString *)*MEMORY[0x189603C60], 128LL, 0LL);
}

- (BOOL)hasHiddenExtension
{
  return _FSNodeGetSimpleBoolValue(self, (NSString *)*MEMORY[0x189603C30], 256LL, 0LL);
}

- (BOOL)getFileSystemRepresentation:(char)a3[1024] error:(id *)a4
{
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  __int16 v7 = v6;
  if (!v6) {
    goto LABEL_6;
  }
  if (([v6 getFileSystemRepresentation:a3 maxLength:1024] & 1) == 0)
  {
    if (a4)
    {
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -2110LL,  (uint64_t)"-[FSNode getFileSystemRepresentation:error:]",  1374LL,  0LL);
      BOOL v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }

- (id)pathWithError:(id *)a3
{
  return -[FSNode canonical:pathWithError:](self, "canonical:pathWithError:", 0LL, a3);
}

+ (id)rootVolumeNode
{
  if (+[FSNode rootVolumeNode]::once != -1) {
    dispatch_once(&+[FSNode rootVolumeNode]::once, &__block_literal_global_0);
  }
  return (id)+[FSNode rootVolumeNode]::result;
}

void __24__FSNode_rootVolumeNode__block_invoke()
{
  v0 = objc_alloc(&OBJC_CLASS___FSNode);
  id v3 = (id)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:@"/" isDirectory:1];
  uint64_t v1 = -[FSNode initWithURL:flags:error:](v0, "initWithURL:flags:error:");
  int v2 = (void *)+[FSNode rootVolumeNode]::result;
  +[FSNode rootVolumeNode]::result = v1;
}

+ (id)prebootVolumeNode
{
  if (+[FSNode prebootVolumeNode]::onceToken != -1) {
    dispatch_once(&+[FSNode prebootVolumeNode]::onceToken, &__block_literal_global_53);
  }
  return (id)+[FSNode prebootVolumeNode]::result;
}

void __27__FSNode_prebootVolumeNode__block_invoke()
{
  v0 = objc_alloc(&OBJC_CLASS___FSNode);
  id v3 = (id)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:@"/private/preboot" isDirectory:1];
  uint64_t v1 = -[FSNode initWithURL:flags:error:](v0, "initWithURL:flags:error:");
  int v2 = (void *)+[FSNode prebootVolumeNode]::result;
  +[FSNode prebootVolumeNode]::result = v1;
}

+ (id)systemDataVolumeNode
{
  if (+[FSNode systemDataVolumeNode]::once != -1) {
    dispatch_once(&+[FSNode systemDataVolumeNode]::once, &__block_literal_global_56);
  }
  return (id)+[FSNode systemDataVolumeNode]::result;
}

void __30__FSNode_systemDataVolumeNode__block_invoke()
{
  v0 = objc_alloc(&OBJC_CLASS___FSNode);
  id v3 = (id)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:@"/private/var" isDirectory:1];
  uint64_t v1 = -[FSNode initWithURL:flags:error:](v0, "initWithURL:flags:error:");
  int v2 = (void *)+[FSNode systemDataVolumeNode]::result;
  +[FSNode systemDataVolumeNode]::result = v1;
}

- (BOOL)isSecuredSystemContent
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  void v13[2] = __32__FSNode_isSecuredSystemContent__block_invoke;
  v13[3] = &unk_189D72268;
  v13[4] = self;
  v13[5] = a2;
  if (-[FSNode isSecuredSystemContent]::once != -1) {
    dispatch_once(&-[FSNode isSecuredSystemContent]::once, v13);
  }
  uint64_t NonFictionalDeviceNumber = _FSNodeGetNonFictionalDeviceNumber(self);
  uint64_t v4 = NonFictionalDeviceNumber;
  if (NonFictionalDeviceNumber)
  {
    BOOL v5 = -[FSNode isSecuredSystemContent]::securedDeviceNumber;
    do
    {
      uint64_t v7 = *v5++;
      uint64_t v6 = v7;
      BOOL v8 = v7 != 0;
      if (v7) {
        BOOL v9 = NonFictionalDeviceNumber == v6;
      }
      else {
        BOOL v9 = 1;
      }
    }

    while (!v9);
  }

  else
  {
    BOOL v8 = 0;
  }

  _LSDefaultLog();
  char v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = "NO";
    *(_DWORD *)buf = 136315650;
    if (v8) {
      uint64_t v12 = "YES";
    }
    uint64_t v15 = v12;
    __int16 v16 = 2048;
    uint64_t v17 = v4;
    __int16 v18 = 2112;
    id v19 = self;
    _os_log_debug_impl( &dword_183E58000,  v10,  OS_LOG_TYPE_DEBUG,  "FSNode.isSecuredSystemContent=%s: device number %llu for %@",  buf,  0x20u);
  }

  return v8;
}

void __32__FSNode_isSecuredSystemContent__block_invoke(uint64_t a1)
{
  v15[2] = *MEMORY[0x1895F89C0];
  v15[0] = +[FSNode rootVolumeNode](&OBJC_CLASS___FSNode, "rootVolumeNode");
  +[FSNode prebootVolumeNode](&OBJC_CLASS___FSNode, "prebootVolumeNode");
  uint64_t v1 = 0LL;
  v15[1] = unsigned int v2 = 0;
  do
  {
    id v3 = (FSNode *)(id)v15[v1];
    uint64_t NonFictionalDeviceNumber = _FSNodeGetNonFictionalDeviceNumber(v3);
    -[FSNode isSecuredSystemContent]::securedDeviceNumber[v2] = NonFictionalDeviceNumber;
    if (NonFictionalDeviceNumber)
    {
      _LSDefaultLog();
      BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = -[FSNode isSecuredSystemContent]::securedDeviceNumber[v2];
        *(_DWORD *)buf = 134218242;
        uint64_t v12 = v6;
        __int16 v13 = 2112;
        BOOL v14 = v3;
        _os_log_impl(&dword_183E58000, v5, OS_LOG_TYPE_DEFAULT, "Found secured device number %llu for %@", buf, 0x16u);
      }

      ++v2;
    }

    else
    {
      _LSDefaultLog();
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v12 = (uint64_t)v3;
        _os_log_error_impl(&dword_183E58000, v7, OS_LOG_TYPE_ERROR, "Secured device number is zero for %@", buf, 0xCu);
      }
    }

    ++v1;
  }

  while (v1 != 2);
  if (v2 > 2)
  {
    [MEMORY[0x1896077D8] currentHandler];
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"FSUtils.mm" lineNumber:1819 description:@"Too many secure device numbers"];
  }

  for (uint64_t i = 1LL; i != -1; --i)
}

- (BOOL)isOnDiskImage
{
  return _FSNodeGetSimpleBoolValue(self, (NSString *)*MEMORY[0x189604D58], 0LL, 512LL);
}

- (BOOL)isOnLocalVolume
{
  return _FSNodeGetSimpleBoolValue(self, (NSString *)*MEMORY[0x189603DF8], 0LL, 1LL);
}

- (BOOL)isAVCHDCollection
{
  if (-[FSNode isDirectory](self, "isDirectory"))
  {
    -[FSNode nameWithError:](self, "nameWithError:", 0LL);
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = v3;
    if (v3)
    {
      uint64_t v5 = [v3 length];
      if (v5 == 4)
      {
        uint64_t v6 = @"BDMV";
        uint64_t v7 = @"INDEX.BDMV";
        BOOL v8 = @"INDEX.BDM";
        BOOL v9 = @"index.bdmv";
        char v10 = @"index.bdm";
      }

      else
      {
        if (v5 != 5) {
          goto LABEL_9;
        }
        uint64_t v6 = @"AVCHD";
        uint64_t v7 = @"BDMV/INDEX.BDMV";
        BOOL v8 = @"BDMV/INDEX.BDM";
        BOOL v9 = @"BDMV/index.bdmv";
        char v10 = @"BDMV/index.bdm";
      }

      if (![v4 caseInsensitiveCompare:v6])
      {
        BOOL v11 = -[FSNode childNodeWithRelativePathExists:](self, "childNodeWithRelativePathExists:", v10)
           || -[FSNode childNodeWithRelativePathExists:](self, "childNodeWithRelativePathExists:", v8)
           || -[FSNode childNodeWithRelativePathExists:](self, "childNodeWithRelativePathExists:", v9)
           || -[FSNode childNodeWithRelativePathExists:](self, "childNodeWithRelativePathExists:", v7);
        goto LABEL_10;
      }
    }

- (BOOL)getDeviceNumber:(int *)a3 error:(id *)a4
{
  id v8 = 0LL;
  BOOL v5 = -[FSNode getResourceValue:forKey:options:error:]( self,  "getResourceValue:forKey:options:error:",  &v8,  *MEMORY[0x189604D30],  1LL,  a4);
  char v6 = !v5;
  if (!a3) {
    char v6 = 1;
  }
  if ((v6 & 1) == 0) {
    *a3 = [v8 unsignedLongLongValue];
  }

  return v5;
}

- (BOOL)getInodeNumber:(unint64_t *)a3 error:(id *)a4
{
  id v8 = 0LL;
  BOOL v5 = -[FSNode getResourceValue:forKey:options:error:]( self,  "getResourceValue:forKey:options:error:",  &v8,  *MEMORY[0x189604C40],  1LL,  a4);
  char v6 = !v5;
  if (!a3) {
    char v6 = 1;
  }
  if ((v6 & 1) == 0) {
    *a3 = [v8 unsignedLongLongValue];
  }

  return v5;
}

- (BOOL)getFileIdentifier:(unint64_t *)a3 error:(id *)a4
{
  id v8 = 0LL;
  BOOL v5 = -[FSNode getResourceValue:forKey:options:error:]( self,  "getResourceValue:forKey:options:error:",  &v8,  *MEMORY[0x189604C10],  1LL,  a4);
  char v6 = !v5;
  if (!a3) {
    char v6 = 1;
  }
  if ((v6 & 1) == 0) {
    *a3 = [v8 unsignedLongLongValue];
  }

  return v5;
}

- (BOOL)getOwnerUID:(unsigned int *)a3 error:(id *)a4
{
  id v8 = 0LL;
  BOOL v5 = -[FSNode getResourceValue:forKey:options:error:]( self,  "getResourceValue:forKey:options:error:",  &v8,  *MEMORY[0x189604CE8],  1LL,  a4);
  char v6 = !v5;
  if (!a3) {
    char v6 = 1;
  }
  if ((v6 & 1) == 0) {
    *a3 = [v8 unsignedLongLongValue];
  }

  return v5;
}

- (__CFBundle)copyCFBundleWithError:(id *)a3
{
  if (!-[FSNode canReadFromSandboxWithAuditToken:](self, "canReadFromSandboxWithAuditToken:", 0LL))
  {
    if (a3)
    {
      id v8 = (void *)*MEMORY[0x189607670];
      uint64_t v9 = -10659LL;
      uint64_t v10 = 2329LL;
LABEL_10:
      _LSMakeNSErrorImpl(v8, v9, (uint64_t)"-[FSNode copyCFBundleWithError:]", v10, 0LL);
      Unique = 0LL;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      return Unique;
    }

    return 0LL;
  }

  -[FSNode URL](self, "URL");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  Unique = (__CFBundle *)_CFBundleCreateUnique();

  if (!Unique)
  {
    if (a3)
    {
      id v8 = (void *)*MEMORY[0x189607670];
      uint64_t v9 = -10813LL;
      uint64_t v10 = 2326LL;
      goto LABEL_10;
    }

    return 0LL;
  }

  CFBundleGetIdentifier(Unique);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7) {
    -[FSNode setTemporaryResourceValue:forKey:]( self,  "setTemporaryResourceValue:forKey:",  v7,  @"com.apple.LSBundleIdentifierKey");
  }

  return Unique;
}

- (id)bundleInfoDictionaryWithError:(id *)a3
{
  CFDictionaryRef v13 = 0LL;
  if (!-[FSNode getTemporaryResourceValue:forKey:]( self,  "getTemporaryResourceValue:forKey:",  &v13,  @"com.apple.LSBundleInfoDictionaryKey"))
  {
    -[FSNode URL](self, "URL");
    BOOL v5 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    CFDictionaryRef v6 = CFBundleCopyInfoDictionaryForURL(v5);
    CFDictionaryRef v7 = v13;
    CFDictionaryRef v13 = v6;

    if (v13) {
      CFDictionaryRef v8 = v13;
    }
    else {
      CFDictionaryRef v8 = (CFDictionaryRef)MEMORY[0x189604A60];
    }
    -[FSNode setTemporaryResourceValue:forKey:]( self,  "setTemporaryResourceValue:forKey:",  v8,  @"com.apple.LSBundleInfoDictionaryKey");
  }

  if (!v13)
  {
    CFDictionaryRef v10 = 0LL;
    if (!a3) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }

  uint64_t v9 = -[__CFDictionary count](v13, "count");
  CFDictionaryRef v10 = v13;
  if (!v9)
  {
    CFDictionaryRef v13 = 0LL;

    CFDictionaryRef v10 = v13;
  }

  if (a3)
  {
LABEL_12:
    if (!v10)
    {
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -10813LL,  (uint64_t)"-[FSNode bundleInfoDictionaryWithError:]",  2357LL,  0LL);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      CFDictionaryRef v10 = v13;
    }
  }

- (id)bundleIdentifierWithError:(id *)a3
{
  return -[FSNode bundleIdentifierWithContext:error:](self, "bundleIdentifierWithContext:error:", 0LL, a3);
}

- (id)bundleIdentifierWithContext:(LSContext *)a3 error:(id *)a4
{
  v21[3] = *MEMORY[0x1895F89C0];
  id v20 = 0LL;
  BOOL v7 = -[FSNode getTemporaryResourceValue:forKey:]( self,  "getTemporaryResourceValue:forKey:",  &v20,  @"com.apple.LSBundleIdentifierKey");
  if (v20) {
    BOOL v8 = v7;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8)
  {
    if (a3)
    {
      v21[0] = 0LL;
      if (!_LSBundleFindWithNode(a3, self, 0LL, v21) && v21[0])
      {
        uint64_t v9 = (void *)_CSStringCopyCFString();
        id v10 = v20;
        id v20 = v9;
      }
    }

    else
    {
      BOOL v11 = -[FSNode copyCFBundleWithError:](self, "copyCFBundleWithError:", a4);
      uint64_t v12 = v11;
      if (v11)
      {
        CFBundleGetIdentifier(v11);
        CFDictionaryRef v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            id v14 = v13;
            uint64_t v15 = (os_log_s *)v20;
            id v20 = v14;
          }

          else
          {
            _LSDefaultLog();
            uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              -[FSNode URL](self, "URL");
              __int16 v16 = (void *)objc_claimAutoreleasedReturnValue();
              [v16 absoluteString];
              uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[FSNode bundleIdentifierWithContext:error:].cold.1(v17, (uint64_t)v21, v15, v16);
            }
          }
        }

        CFRelease(v12);
      }
    }

    if (v20)
    {
      -[FSNode setTemporaryResourceValue:forKey:]( self,  "setTemporaryResourceValue:forKey:",  v20,  @"com.apple.LSBundleIdentifierKey");
    }

    else if (a4)
    {
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -10813LL,  (uint64_t)"-[FSNode bundleIdentifierWithContext:error:]",  2406LL,  0LL);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  id v18 = v20;

  return v18;
}

- (BOOL)getCreationDate:(double *)a3 error:(id *)a4
{
  return _FSNodeGetTimestampValue(self, *MEMORY[0x189603B88], a3, a4);
}

- (BOOL)getContentModificationDate:(double *)a3 error:(id *)a4
{
  return _FSNodeGetTimestampValue(self, *MEMORY[0x189603B70], a3, a4);
}

- (BOOL)getLength:(unint64_t *)a3 error:(id *)a4
{
  id v8 = 0LL;
  BOOL v5 = -[FSNode getResourceValue:forKey:options:error:]( self,  "getResourceValue:forKey:options:error:",  &v8,  *MEMORY[0x189603C20],  1LL,  a4);
  char v6 = !v5;
  if (!a3) {
    char v6 = 1;
  }
  if ((v6 & 1) == 0) {
    *a3 = [v8 unsignedLongLongValue];
  }

  return v5;
}

- (BOOL)getHFSType:(unsigned int *)a3 creator:(unsigned int *)a4 error:(id *)a5
{
  void v21[4] = *(const __CFNumber **)MEMORY[0x1895F89C0];
  if (-[FSNode isDirectory](self, "isDirectory"))
  {
    if (-[FSNode getHFSType:creator:error:]::once != -1) {
      dispatch_once(&-[FSNode getHFSType:creator:error:]::once, &__block_literal_global_85);
    }
    v21[0] = 0LL;
    if (-[FSNode getTemporaryResourceValue:forKey:]( self,  "getTemporaryResourceValue:forKey:",  v21,  @"com.apple.LSPkgInfoKey"))
    {
LABEL_17:
      if (v21[0] == (const __CFNumber *)-[FSNode getHFSType:creator:error:]::noHFSCodes)
      {
        if (a5)
        {
          _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -10813LL,  (uint64_t)"-[FSNode getHFSType:creator:error:]",  2513LL,  0LL);
          LOBYTE(v18) = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
        }
      }

      else if (v21[0])
      {
        XCFNumberGetHFSTypeAndCreatorCodes(v21[0], (int *)a3, (int *)a4);
        LOBYTE(v18) = 1;
LABEL_23:

        return v18;
      }

      LOBYTE(v18) = 0;
      goto LABEL_23;
    }

    -[FSNode URL](self, "URL");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 URLByAppendingPathComponent:@"Contents/PkgInfo" isDirectory:0];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      [MEMORY[0x189603F48] dataWithContentsOfURL:v10 options:0 maxLength:8 error:0];
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = v11;
      if (v11 && (unint64_t)[v11 length] >= 8)
      {
        id v13 = v12;
        id v14 = (unsigned int *)[v13 bytes];
        unsigned int v16 = *v14;
        unsigned int v15 = v14[1];

        uint64_t v17 = XCFNumberCreateWithHFSTypeAndCreatorCodes(bswap32(v16), bswap32(v15));
LABEL_16:
        id v19 = v21[0];
        v21[0] = v17;

        -[FSNode setTemporaryResourceValue:forKey:]( self,  "setTemporaryResourceValue:forKey:",  v21[0],  @"com.apple.LSPkgInfoKey");
        goto LABEL_17;
      }
    }

    uint64_t v17 = (const __CFNumber *)(id)-[FSNode getHFSType:creator:error:]::noHFSCodes;
    goto LABEL_16;
  }

  BOOL v18 = -[FSNode getFinderInfo:error:](self, "getFinderInfo:error:", v21, a5);
  if (v18)
  {
    if (a3) {
      *a3 = v21[0];
    }
    if (a4) {
      *a4 = HIDWORD(v21[0]);
    }
  }

  return v18;
}

void __35__FSNode_getHFSType_creator_error___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x189616338]);
  uint64_t v1 = (void *)-[FSNode getHFSType:creator:error:]::noHFSCodes;
  -[FSNode getHFSType:creator:error:]::noHFSCodes = (uint64_t)v0;
}

- (BOOL)getWriterBundleIdentifier:(id *)a3 error:(id *)a4
{
  if (a4)
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -4LL,  (uint64_t)"-[FSNode getWriterBundleIdentifier:error:]",  2550LL,  0LL);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (BOOL)getFinderInfo:(id *)a3 error:(id *)a4
{
  if (!self || (*((_BYTE *)self + 24) & 8) == 0 || !__CFURLResourceInfoPtr())
  {
LABEL_9:
    id v13 = 0LL;
    if (!-[FSNode getResourceValue:forKey:options:error:]( self,  "getResourceValue:forKey:options:error:",  &v13,  *MEMORY[0x189604C20],  1LL,  a4)) {
      goto LABEL_17;
    }
    id v10 = (_OWORD *)[v13 bytes];
    if (v10 && (unint64_t)[v13 length] >= 0x20)
    {
      if (a3)
      {
        __int128 v11 = v10[1];
        *(_OWORD *)a3->var0 = *v10;
        *(_OWORD *)a3->var2.var1 = v11;
      }

      BOOL v9 = 1;
      goto LABEL_18;
    }

    if (a4)
    {
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -10817LL,  (uint64_t)"-[FSNode(FinderInfo) getFinderInfo:error:]",  2590LL,  0LL);
      BOOL v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
LABEL_17:
      BOOL v9 = 0;
    }

- (BOOL)setFinderInfo:(id *)a3 error:(id *)a4
{
  v11[1] = *MEMORY[0x1895F89C0];
  if (a3)
  {
    [MEMORY[0x189603F48] dataWithBytesNoCopy:a3 length:32 freeWhenDone:0];
    char v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      BOOL v7 = -[FSNode setResourceValue:forKey:options:error:]( self,  "setResourceValue:forKey:options:error:",  v6,  *MEMORY[0x189604C20],  3LL,  a4);
    }

    else if (a4)
    {
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -41LL,  (uint64_t)"-[FSNode(FinderInfo) setFinderInfo:error:]",  2613LL,  0LL);
      BOOL v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      BOOL v7 = 0;
    }
  }

  else
  {
    if (a4)
    {
      uint64_t v10 = *MEMORY[0x189607490];
      v11[0] = @"finderInfo";
      [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:&v10 count:1];
      __int128 v8 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[FSNode(FinderInfo) setFinderInfo:error:]",  2617LL,  v8);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0;
  }

  return v7;
}

+ (BOOL)canAccessURL:(id)a3 withAuditToken:(id *)a4 operation:(const char *)a5
{
  if (a3 && (a4 || _LSGetAuditTokenForSelf()))
  {
    id v12 = 0LL;
    int v6 = [a3 getResourceValue:&v12 forKey:*MEMORY[0x189603B60] error:0];
    id v7 = v12;
    id v8 = v7;
    if (!v6 || ![v7 length]) {
      goto LABEL_11;
    }
    fileSystemRealPath(v8, 0LL);
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      BOOL v10 = 0;
      id v8 = 0LL;
      goto LABEL_12;
    }

    if (![v9 length])
    {
      BOOL v10 = 0;
      id v8 = v9;
      goto LABEL_12;
    }

    id v8 = v9;
    if ([v8 fileSystemRepresentation]) {
      BOOL v10 = sandbox_check_by_audit_token() == 0;
    }
    else {
LABEL_11:
    }
      BOOL v10 = 0;
LABEL_12:

    return v10;
  }

  return 0;
}

+ (BOOL)canAccessURL:(id)a3 fromSandboxWithAuditToken:(id *)a4 operation:(const char *)a5
{
  else {
    return 0;
  }
}

- (BOOL)canReadWithAuditToken:(id *)a3
{
  BOOL v5 = (void *)objc_opt_class();
  -[FSNode URL](self, "URL");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = [v5 canReadURL:v6 withAuditToken:a3];

  return (char)a3;
}

- (BOOL)canWriteWithAuditToken:(id *)a3
{
  BOOL v5 = (void *)objc_opt_class();
  -[FSNode URL](self, "URL");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = [v5 canWriteURL:v6 withAuditToken:a3];

  return (char)a3;
}

- (BOOL)canReadMetadataWithAuditToken:(id *)a3
{
  BOOL v5 = (void *)objc_opt_class();
  -[FSNode URL](self, "URL");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = [v5 canReadMetadataOfURL:v6 withAuditToken:a3];

  return (char)a3;
}

+ (BOOL)canReadURL:(id)a3 withAuditToken:(id *)a4
{
  return [a1 canAccessURL:a3 withAuditToken:a4 operation:"file-read-data"];
}

+ (BOOL)canWriteURL:(id)a3 withAuditToken:(id *)a4
{
  return [a1 canAccessURL:a3 withAuditToken:a4 operation:"file-write-data"];
}

+ (BOOL)canReadMetadataOfURL:(id)a3 withAuditToken:(id *)a4
{
  if ([a1 canAccessURL:a3 withAuditToken:a4 operation:"file-read-metadata"]) {
    return 1;
  }
  [a3 URLByDeletingLastPathComponent];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8) {
    char v7 = [a1 canReadURL:v8 withAuditToken:a4];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)canReadFromSandboxWithAuditToken:(id *)a3
{
  BOOL v5 = (void *)objc_opt_class();
  -[FSNode URL](self, "URL");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = [v5 canReadURL:v6 fromSandboxWithAuditToken:a3];

  return (char)a3;
}

- (BOOL)canWriteFromSandboxWithAuditToken:(id *)a3
{
  BOOL v5 = (void *)objc_opt_class();
  -[FSNode URL](self, "URL");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = [v5 canWriteURL:v6 fromSandboxWithAuditToken:a3];

  return (char)a3;
}

- (BOOL)canReadMetadataFromSandboxWithAuditToken:(id *)a3
{
  BOOL v5 = (void *)objc_opt_class();
  -[FSNode URL](self, "URL");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = [v5 canReadMetadataOfURL:v6 fromSandboxWithAuditToken:a3];

  return (char)a3;
}

+ (BOOL)canReadURL:(id)a3 fromSandboxWithAuditToken:(id *)a4
{
  return [a1 canAccessURL:a3 fromSandboxWithAuditToken:a4 operation:"file-read-data"];
}

+ (BOOL)canWriteURL:(id)a3 fromSandboxWithAuditToken:(id *)a4
{
  return [a1 canAccessURL:a3 fromSandboxWithAuditToken:a4 operation:"file-write-data"];
}

+ (BOOL)canReadMetadataOfURL:(id)a3 fromSandboxWithAuditToken:(id *)a4
{
  if ([a1 canAccessURL:a3 fromSandboxWithAuditToken:a4 operation:"file-read-metadata"]) {
    return 1;
  }
  [a3 URLByDeletingLastPathComponent];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8) {
    char v7 = [a1 canReadURL:v8 fromSandboxWithAuditToken:a4];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (id)extendedAttributeWithName:(id)a3 options:(int)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  if (a3 && [a3 length])
  {
    if (-[FSNode getFileSystemRepresentation:error:](self, "getFileSystemRepresentation:error:", path, a5))
    {
      if ([a3 getCString:name maxLength:128 encoding:4])
      {
        ssize_t v9 = getxattr(path, name, 0LL, 0LL, 0, a4);
        ssize_t v10 = v9;
        if (v9 >= 1)
        {
          [MEMORY[0x189603FB8] dataWithLength:v9];
          __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
          id v12 = v11;
          if (v11)
          {
            id v13 = v11;
            ssize_t v14 = getxattr(path, name, (void *)[v13 mutableBytes], objc_msgSend(v13, "length"), 0, a4);
            if ((v14 & 0x8000000000000000LL) == 0)
            {
              if (v14 == v10)
              {
                id v15 = v13;
LABEL_30:

                return v15;
              }

              if (a5)
              {
                _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -1304LL,  (uint64_t)"-[FSNode(ExtendedAttributes) extendedAttributeWithName:options:error:]",  3475LL,  0LL);
                id v20 = (id)objc_claimAutoreleasedReturnValue();
                goto LABEL_28;
              }

- (BOOL)setExtendedAttribute:(id)a3 name:(id)a4 options:(int)a5 error:(id *)a6
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if (!a4 || ![a4 length])
  {
    if (a6)
    {
      uint64_t v19 = *MEMORY[0x189607490];
      id v20 = @"name";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      ssize_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[FSNode(ExtendedAttributes) setExtendedAttribute:name:options:error:]",  3537LL,  v14);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_9;
  }

  BOOL v11 = -[FSNode getFileSystemRepresentation:error:](self, "getFileSystemRepresentation:error:", path, a6);
  if (!v11) {
    return v11;
  }
  if (([a4 getCString:name maxLength:128 encoding:4] & 1) == 0)
  {
    if (a6)
    {
      uint64_t v21 = *MEMORY[0x189607490];
      v22 = @"Extended attribute name too long or invalid.";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[FSNode(ExtendedAttributes) setExtendedAttribute:name:options:error:]",  3513LL,  v15);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

- (id)bookmarkDataRelativeToNode:(id)a3 error:(id *)a4
{
  return -[FSNode bookmarkDataWithOptions:relativeToNode:error:]( self,  "bookmarkDataWithOptions:relativeToNode:error:",  0x20000000LL,  a3,  a4);
}

- (id)bookmarkDataWithOptions:(unint64_t)a3 relativeToNode:(id)a4 error:(id *)a5
{
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7) {
    goto LABEL_14;
  }
  id v8 = (void *)MEMORY[0x186E2A59C]();
  if (-[FSNode isDirectory](self, "isDirectory"))
  {
    if (([v7 hasSuffix:@"/"] & 1) == 0)
    {
      uint64_t v9 = [v7 stringByAppendingString:@"/"];

      id v7 = (id)v9;
    }
  }

  else
  {
    while ([v7 hasSuffix:@"/"])
    {
      uint64_t v15 = objc_msgSend( v7,  "stringByReplacingCharactersInRange:withString:",  objc_msgSend(v7, "length") - 1,  1,  &stru_189D7B4C8);

      id v7 = (id)v15;
    }
  }

  objc_autoreleasePoolPop(v8);
  id v7 = v7;
  ssize_t v10 = (const char *)[v7 fileSystemRepresentation];
  if (!v10)
  {
    if (a5)
    {
      uint64_t v13 = 3722LL;
      uint64_t v14 = -2110LL;
      goto LABEL_13;
    }

+ (unsigned)compareBookmarkData:(id)a3 toBookmarkData:(id)a4
{
  return [a3 isEqual:a4] ^ 1;
}

+ (id)nameForBookmarkData:(id)a3 error:(id *)a4
{
  v12[1] = *MEMORY[0x1895F89C0];
  if (a3)
  {
    [a1 pathForBookmarkData:a3 error:a4];
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = v5;
    if (v5)
    {
      uint64_t v7 = [v5 lastPathComponent];
      id v8 = (void *)v7;
      if (a4)
      {
        if (!v7)
        {
          _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -37LL,  (uint64_t)"+[FSNode(BookmarkData) nameForBookmarkData:error:]",  3868LL,  0LL);
          id v8 = 0LL;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
    }

    else
    {
      id v8 = 0LL;
    }

    return v8;
  }

  else
  {
    if (a4)
    {
      uint64_t v11 = *MEMORY[0x189607490];
      v12[0] = @"bookmark";
      [MEMORY[0x189603F68] dictionaryWithObjects:v12 forKeys:&v11 count:1];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"+[FSNode(BookmarkData) nameForBookmarkData:error:]",  3872LL,  v9);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

+ (BOOL)getVolumeIdentifier:(unint64_t *)a3 forBookmarkData:(id)a4 error:(id *)a5
{
  id v7 = -[FSNode initByResolvingBookmarkData:relativeToNode:bookmarkDataIsStale:error:]( objc_alloc(&OBJC_CLASS___FSNode),  "initByResolvingBookmarkData:relativeToNode:bookmarkDataIsStale:error:",  a4,  0LL,  0LL,  a5);
  id v8 = v7;
  if (v7) {
    char v9 = [v7 getVolumeIdentifier:a3 error:a5];
  }
  else {
    char v9 = 0;
  }

  return v9;
}

+ (BOOL)isBookmarkDataFull:(id)a3
{
  uint64_t v4 = [a3 length];
  if (v4) {
    LOBYTE(v4) = *(_BYTE *)[a3 bytes] != 47;
  }
  return v4;
}

- (void)bundleIdentifierWithContext:(os_log_s *)a3 error:(void *)a4 .cold.1(void *a1, uint64_t a2, os_log_s *a3, void *a4)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_5( &dword_183E58000,  a3,  (uint64_t)a3,  "*** Malformed bundle %{public}@; CFBundleIdentifier is not a string ",
    (uint8_t *)a2);
}

@end
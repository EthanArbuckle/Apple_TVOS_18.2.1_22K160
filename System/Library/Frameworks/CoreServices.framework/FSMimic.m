@interface FSMimic
+ (BOOL)supportsSecureCoding;
+ (id)basePropertyClasses;
+ (id)resourceValueClassesWithNull;
+ (void)checkSelectors;
- (BOOL)canIssueIO;
- (BOOL)childNodeWithRelativePathExists:(id)a3;
- (BOOL)getCachedResourceValueIfPresent:(id *)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)getContentModificationDate:(double *)a3 error:(id *)a4;
- (BOOL)getCreationDate:(double *)a3 error:(id *)a4;
- (BOOL)getDeviceNumber:(int *)a3 error:(id *)a4;
- (BOOL)getDeviceRefNum:(unint64_t *)a3 error:(id *)a4;
- (BOOL)getFileIdentifier:(unint64_t *)a3 error:(id *)a4;
- (BOOL)getFileSystemRepresentation:(char)a3[1024] error:(id *)a4;
- (BOOL)getHFSType:(unsigned int *)a3 creator:(unsigned int *)a4 error:(id *)a5;
- (BOOL)getInodeNumber:(unint64_t *)a3 error:(id *)a4;
- (BOOL)getLength:(unint64_t *)a3 error:(id *)a4;
- (BOOL)getOwnerUID:(unsigned int *)a3 error:(id *)a4;
- (BOOL)getResourceValue:(id *)a3 forKey:(id)a4 options:(unsigned __int8)a5 error:(id *)a6;
- (BOOL)getVolumeIdentifier:(unint64_t *)a3 error:(id *)a4;
- (BOOL)hasHiddenExtension;
- (BOOL)hasObjectValueForSelector:(SEL)a3;
- (BOOL)hasPackageBit;
- (BOOL)hasResourceValueForKey:(id)a3;
- (BOOL)isAVCHDCollection;
- (BOOL)isAliasFile;
- (BOOL)isBusyDirectory;
- (BOOL)isDataContainer;
- (BOOL)isDirectory;
- (BOOL)isExecutable;
- (BOOL)isExecutableModeFile;
- (BOOL)isHidden;
- (BOOL)isInTrash;
- (BOOL)isMountTrigger;
- (BOOL)isOnDiskImage;
- (BOOL)isOnLocalVolume;
- (BOOL)isOnTimeMachineVolume;
- (BOOL)isRegularFile;
- (BOOL)isResolvable;
- (BOOL)isSecuredSystemContent;
- (BOOL)isSymbolicLink;
- (BOOL)isTrashFolder;
- (BOOL)isVolume;
- (FSMimic)initWithCoder:(id)a3;
- (FSMimic)initWithURL:(id)a3;
- (id)URL;
- (id)canonicalPathWithError:(id *)a3;
- (id)extensionWithError:(id *)a3;
- (id)nameWithError:(id *)a3;
- (id)pathWithError:(id *)a3;
- (void)askedForMissingResourceKey:(id)a3;
- (void)askedForMissingSelector:(SEL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)noteExtantChildNodeWithRelativePath:(id)a3;
- (void)setHFSType:(unsigned int)a3 creator:(unsigned int)a4;
- (void)setHFSTypesUnavailable;
- (void)setObjectValue:(id)a3 forSelector:(SEL)a4;
- (void)setResourceValue:(id)a3 forKey:(id)a4;
@end

@implementation FSMimic

- (FSMimic)initWithURL:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___FSMimic;
  v6 = -[FSMimic init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    baseProperties = v7->_baseProperties;
    v7->_baseProperties = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    resourceValues = v7->_resourceValues;
    v7->_resourceValues = v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    relativePathsThatExist = v7->_relativePathsThatExist;
    v7->_relativePathsThatExist = v12;

    *(_BYTE *)&v7->_flags &= 0xFCu;
  }

  return v7;
}

+ (id)basePropertyClasses
{
  if (+[FSMimic basePropertyClasses]::onceToken != -1) {
    dispatch_once(&+[FSMimic basePropertyClasses]::onceToken, &__block_literal_global_26);
  }
  return (id)+[FSMimic basePropertyClasses]::result;
}

void __30__FSMimic_basePropertyClasses__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x189603FE0]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_msgSend(v0, "initWithObjects:", v1, objc_opt_class(), 0);
  v3 = (void *)+[FSMimic basePropertyClasses]::result;
  +[FSMimic basePropertyClasses]::result = v2;
}

+ (id)resourceValueClassesWithNull
{
  if (+[FSMimic resourceValueClassesWithNull]::onceToken != -1) {
    dispatch_once(&+[FSMimic resourceValueClassesWithNull]::onceToken, &__block_literal_global_4);
  }
  return (id)+[FSMimic resourceValueClassesWithNull]::result;
}

void __39__FSMimic_resourceValueClassesWithNull__block_invoke()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = (void *)[v0 mutableCopy];

  [v1 addObject:objc_opt_class()];
  uint64_t v2 = (void *)+[FSMimic resourceValueClassesWithNull]::result;
  +[FSMimic resourceValueClassesWithNull]::result = (uint64_t)v1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_url forKey:@"url"];
  [v5 encodeObject:self->_baseProperties forKey:@"baseProperties"];
  _LSEncodeURLPropertyDictionary(self->_resourceValues);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v4 forKey:@"resourceValues"];

  [v5 encodeObject:self->_relativePathsThatExist forKey:@"relativePathsThatExist"];
  [v5 encodeInt32:self->_hfsType forKey:@"hfsType"];
  [v5 encodeInt32:self->_creator forKey:@"creator"];
  [v5 encodeBool:*(_BYTE *)&self->_flags & 1 forKey:@"HFSTypesSet"];
  [v5 encodeBool:(*(_BYTE *)&self->_flags >> 1) & 1 forKey:@"HFSTypesUnavailable"];
}

- (FSMimic)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___FSMimic;
  id v5 = -[FSMimic init](&v24, sel_init);
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"url");
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    uint64_t v8 = objc_opt_class();
    v9 = +[FSMimic resourceValueClassesWithNull](&OBJC_CLASS___FSMimic, "resourceValueClassesWithNull");
    objc_msgSend(v4, "ls_decodeDictionaryWithKeysOfClass:valuesOfClasses:forKey:", v8, v9, @"baseProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 mutableCopy];
    baseProperties = v5->_baseProperties;
    v5->_baseProperties = (NSMutableDictionary *)v11;

    uint64_t v13 = objc_opt_class();
    v14 = +[FSMimic resourceValueClassesWithNull](&OBJC_CLASS___FSMimic, "resourceValueClassesWithNull");
    objc_msgSend(v4, "ls_decodeDictionaryWithKeysOfClass:valuesOfClasses:forKey:", v13, v14, @"resourceValues");
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue();
    _LSDecodeURLPropertyDictionary(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v16 mutableCopy];
    resourceValues = v5->_resourceValues;
    v5->_resourceValues = (NSMutableDictionary *)v17;

    objc_msgSend(v4, "ls_decodeSetWithValuesOfClass:forKey:", objc_opt_class(), @"relativePathsThatExist");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = [v19 mutableCopy];
    relativePathsThatExist = v5->_relativePathsThatExist;
    v5->_relativePathsThatExist = (NSMutableSet *)v20;

    v5->_hfsType = [v4 decodeInt32ForKey:@"hfsType"];
    v5->_creator = [v4 decodeInt32ForKey:@"creator"];
    *(_BYTE *)&v5->_flags = *(_BYTE *)&v5->_flags & 0xFE | [v4 decodeBoolForKey:@"HFSTypesSet"];
    else {
      char v22 = 0;
    }
    *(_BYTE *)&v5->_flags = *(_BYTE *)&v5->_flags & 0xFD | v22;
  }

  return v5;
}

- (BOOL)canIssueIO
{
  return 0;
}

- (id)URL
{
  return self->_url;
}

- (void)askedForMissingSelector:(SEL)a3
{
  v6[3] = *MEMORY[0x1895F89C0];
  _LSDefaultLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    Name = sel_getName(a3);
    -[FSMimic askedForMissingSelector:].cold.1((uint64_t)Name, (uint64_t)v6, v4);
  }
}

- (void)askedForMissingResourceKey:(id)a3
{
  id v3 = a3;
  _LSDefaultLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    -[FSMimic askedForMissingResourceKey:].cold.1((uint64_t)v3, v4, v5);
  }
}

- (void)setObjectValue:(id)a3 forSelector:(SEL)a4
{
  id v8 = a3;
  baseProperties = self->_baseProperties;
  NSStringFromSelector(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](baseProperties, "setObject:forKey:", v8, v7);
}

- (BOOL)hasObjectValueForSelector:(SEL)a3
{
  baseProperties = self->_baseProperties;
  NSStringFromSelector(a3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(baseProperties) = v5 != 0LL;

  return (char)baseProperties;
}

- (void)noteExtantChildNodeWithRelativePath:(id)a3
{
}

- (BOOL)getResourceValue:(id *)a3 forKey:(id)a4 options:(unsigned __int8)a5 error:(id *)a6
{
  id v9 = a4;
  id v16 = 0LL;
  BOOL v10 = -[FSMimic getCachedResourceValueIfPresent:forKey:error:]( self,  "getCachedResourceValueIfPresent:forKey:error:",  a3,  v9,  &v16);
  id v11 = v16;
  v12 = v11;
  if (!v10)
  {
    if (a6) {
      *a6 = v11;
    }
    if ([v12 code] == 5)
    {
      [v12 domain];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      int v14 = [v13 isEqualToString:*MEMORY[0x189607688]];

      if (v14) {
        -[FSMimic askedForMissingResourceKey:](self, "askedForMissingResourceKey:", v9);
      }
    }
  }

  return v10;
}

- (BOOL)getCachedResourceValueIfPresent:(id *)a3 forKey:(id)a4 error:(id *)a5
{
  v14[1] = *MEMORY[0x1895F89C0];
  id v8 = a4;
  -[NSMutableDictionary objectForKey:](self->_resourceValues, "objectForKey:", v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (a3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        BOOL v10 = 0LL;
      }
      else {
        BOOL v10 = v9;
      }
      objc_storeStrong(a3, v10);
    }
  }

  else if (a5)
  {
    uint64_t v13 = *MEMORY[0x189607490];
    v14[0] = v8;
    [MEMORY[0x189603F68] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607688],  5LL,  (uint64_t)"-[FSMimic getCachedResourceValueIfPresent:forKey:error:]",  237LL,  v11);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9 != 0LL;
}

- (void)setResourceValue:(id)a3 forKey:(id)a4
{
}

- (BOOL)hasResourceValueForKey:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (BOOL)isDirectory
{
  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  id v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    id v8 = 0LL;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)isBusyDirectory
{
  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  id v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    id v8 = 0LL;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)isExecutableModeFile
{
  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  id v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    id v8 = 0LL;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)isExecutable
{
  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  id v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    id v8 = 0LL;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)isResolvable
{
  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  id v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    id v8 = 0LL;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)isSymbolicLink
{
  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  id v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    id v8 = 0LL;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)isAliasFile
{
  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  id v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    id v8 = 0LL;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)hasPackageBit
{
  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  id v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    id v8 = 0LL;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)isRegularFile
{
  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  id v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    id v8 = 0LL;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)isHidden
{
  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  id v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    id v8 = 0LL;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)hasHiddenExtension
{
  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  id v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    id v8 = 0LL;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)isDataContainer
{
  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  id v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    id v8 = 0LL;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)getFileSystemRepresentation:(char)a3[1024] error:(id *)a4
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = v6;
  if (!v6) {
    goto LABEL_6;
  }
  if (([v6 getFileSystemRepresentation:a3 maxLength:1024] & 1) == 0)
  {
    if (a4)
    {
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -2110LL,  (uint64_t)"-[FSMimic getFileSystemRepresentation:error:]",  322LL,  0LL);
      BOOL v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }

- (id)pathWithError:(id *)a3
{
  v16[1] = *MEMORY[0x1895F89C0];
  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v7);
  BOOL v10 = (void *)v9;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {

    if (v10) {
      return v10;
    }
  }

  else
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      return v10;
    }
  }

  -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
  if (a3)
  {
    uint64_t v15 = *MEMORY[0x189607490];
    v16[0] = @"path";
    [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x189607688], 5LL, (uint64_t)"-[FSMimic pathWithError:]", 329LL, v13);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  BOOL v10 = 0LL;
  return v10;
}

- (id)canonicalPathWithError:(id *)a3
{
  v16[1] = *MEMORY[0x1895F89C0];
  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v7);
  BOOL v10 = (void *)v9;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {

    if (v10) {
      return v10;
    }
  }

  else
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      return v10;
    }
  }

  -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
  if (a3)
  {
    uint64_t v15 = *MEMORY[0x189607490];
    v16[0] = @"canonicalPath";
    [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x189607688], 5LL, (uint64_t)"-[FSMimic canonicalPathWithError:]", 330LL, v13);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  BOOL v10 = 0LL;
  return v10;
}

- (id)nameWithError:(id *)a3
{
  v16[1] = *MEMORY[0x1895F89C0];
  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v7);
  BOOL v10 = (void *)v9;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {

    if (v10) {
      return v10;
    }
  }

  else
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      return v10;
    }
  }

  -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
  if (a3)
  {
    uint64_t v15 = *MEMORY[0x189607490];
    v16[0] = @"name";
    [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x189607688], 5LL, (uint64_t)"-[FSMimic nameWithError:]", 331LL, v13);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  BOOL v10 = 0LL;
  return v10;
}

- (id)extensionWithError:(id *)a3
{
  v16[1] = *MEMORY[0x1895F89C0];
  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v7);
  BOOL v10 = (void *)v9;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {

    if (v10) {
      return v10;
    }
  }

  else
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      return v10;
    }
  }

  -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
  if (a3)
  {
    uint64_t v15 = *MEMORY[0x189607490];
    v16[0] = @"extension";
    [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x189607688], 5LL, (uint64_t)"-[FSMimic extensionWithError:]", 332LL, v13);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  BOOL v10 = 0LL;
  return v10;
}

- (BOOL)isVolume
{
  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  uint64_t v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    uint64_t v8 = 0LL;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)isMountTrigger
{
  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  uint64_t v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    uint64_t v8 = 0LL;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)getVolumeIdentifier:(unint64_t *)a3 error:(id *)a4
{
  return getFailableNumericFromBaseProperties<unsigned long long>(self, self->_baseProperties, a2, a3, a4);
}

- (BOOL)isSecuredSystemContent
{
  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  uint64_t v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    uint64_t v8 = 0LL;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)isOnDiskImage
{
  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  uint64_t v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    uint64_t v8 = 0LL;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)isOnLocalVolume
{
  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  uint64_t v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    uint64_t v8 = 0LL;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)isOnTimeMachineVolume
{
  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  uint64_t v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    uint64_t v8 = 0LL;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)getCreationDate:(double *)a3 error:(id *)a4
{
  return getFailableNumericFromBaseProperties<double>(self, self->_baseProperties, a2, a3, a4);
}

- (BOOL)getContentModificationDate:(double *)a3 error:(id *)a4
{
  return getFailableNumericFromBaseProperties<double>(self, self->_baseProperties, a2, a3, a4);
}

- (BOOL)getLength:(unint64_t *)a3 error:(id *)a4
{
  return getFailableNumericFromBaseProperties<unsigned long long>(self, self->_baseProperties, a2, a3, a4);
}

- (BOOL)getHFSType:(unsigned int *)a3 creator:(unsigned int *)a4 error:(id *)a5
{
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) != 0)
    {
      if (!a5) {
        return flags & 1;
      }
      uint64_t v7 = (void *)*MEMORY[0x189607670];
      uint64_t v8 = -10813LL;
      uint64_t v9 = 362LL;
    }

    else
    {
      if (!a5) {
        return flags & 1;
      }
      uint64_t v7 = (void *)*MEMORY[0x189607688];
      uint64_t v8 = 5LL;
      uint64_t v9 = 364LL;
    }

    _LSMakeNSErrorImpl(v7, v8, (uint64_t)"-[FSMimic getHFSType:creator:error:]", v9, 0LL);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    return flags & 1;
  }

  if (a3) {
    *a3 = self->_hfsType;
  }
  if (a4) {
    *a4 = self->_creator;
  }
  return flags & 1;
}

- (void)setHFSType:(unsigned int)a3 creator:(unsigned int)a4
{
  *(_BYTE *)&self->_char flags = *(_BYTE *)&self->_flags & 0xFC | 1;
  self->_hfsType = a3;
  self->_creator = a4;
}

- (void)setHFSTypesUnavailable
{
  *(_BYTE *)&self->_char flags = *(_BYTE *)&self->_flags & 0xFC | 2;
}

- (BOOL)getDeviceNumber:(int *)a3 error:(id *)a4
{
  v20[1] = *MEMORY[0x1895F89C0];
  baseProperties = self->_baseProperties;
  uint64_t v8 = self;
  uint64_t v9 = baseProperties;
  NSStringFromSelector(a2);
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = -[NSMutableDictionary objectForKey:](v9, "objectForKey:", v10);
  uint64_t v13 = (void *)v12;
  if (v11) {
    BOOL v14 = v12 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    if (v12)
    {
LABEL_9:
      *a3 = [v13 intValue];
      BOOL v16 = 1;
      goto LABEL_13;
    }
  }

  else
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0) {
      goto LABEL_9;
    }
  }

  -[FSMimic askedForMissingSelector:](v8, "askedForMissingSelector:", a2);
  if (!a4)
  {
    BOOL v16 = 0;
    goto LABEL_14;
  }

  uint64_t v19 = *MEMORY[0x189607490];
  v20[0] = v10;
  [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  _LSMakeNSErrorImpl((void *)*MEMORY[0x189607688], 5LL, (uint64_t)"getFailableNumericFromBaseProperties", 284LL, v17);
  BOOL v16 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = v17;
LABEL_13:

LABEL_14:
  return v16;
}

- (BOOL)getDeviceRefNum:(unint64_t *)a3 error:(id *)a4
{
  return getFailableNumericFromBaseProperties<unsigned long long>(self, self->_baseProperties, a2, a3, a4);
}

- (BOOL)getInodeNumber:(unint64_t *)a3 error:(id *)a4
{
  return getFailableNumericFromBaseProperties<unsigned long long>(self, self->_baseProperties, a2, a3, a4);
}

- (BOOL)getFileIdentifier:(unint64_t *)a3 error:(id *)a4
{
  return getFailableNumericFromBaseProperties<unsigned long long>(self, self->_baseProperties, a2, a3, a4);
}

- (BOOL)getOwnerUID:(unsigned int *)a3 error:(id *)a4
{
  v20[1] = *MEMORY[0x1895F89C0];
  baseProperties = self->_baseProperties;
  uint64_t v8 = self;
  uint64_t v9 = baseProperties;
  NSStringFromSelector(a2);
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = -[NSMutableDictionary objectForKey:](v9, "objectForKey:", v10);
  uint64_t v13 = (void *)v12;
  if (v11) {
    BOOL v14 = v12 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    if (v12)
    {
LABEL_9:
      *a3 = [v13 unsignedIntValue];
      BOOL v16 = 1;
      goto LABEL_13;
    }
  }

  else
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0) {
      goto LABEL_9;
    }
  }

  -[FSMimic askedForMissingSelector:](v8, "askedForMissingSelector:", a2);
  if (!a4)
  {
    BOOL v16 = 0;
    goto LABEL_14;
  }

  uint64_t v19 = *MEMORY[0x189607490];
  v20[0] = v10;
  [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  _LSMakeNSErrorImpl((void *)*MEMORY[0x189607688], 5LL, (uint64_t)"getFailableNumericFromBaseProperties", 284LL, v17);
  BOOL v16 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = v17;
LABEL_13:

LABEL_14:
  return v16;
}

- (BOOL)childNodeWithRelativePathExists:(id)a3
{
  return -[NSMutableSet containsObject:](self->_relativePathsThatExist, "containsObject:", a3);
}

- (BOOL)isInTrash
{
  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  uint64_t v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    uint64_t v8 = 0LL;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)isTrashFolder
{
  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  uint64_t v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    uint64_t v8 = 0LL;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

- (BOOL)isAVCHDCollection
{
  baseProperties = self->_baseProperties;
  NSStringFromSelector(a2);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = -[NSMutableDictionary objectForKey:](baseProperties, "objectForKey:", v5);
  uint64_t v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {

      goto LABEL_12;
    }

LABEL_11:
    uint64_t v8 = 0LL;
    -[FSMimic askedForMissingSelector:](self, "askedForMissingSelector:", a2);
    goto LABEL_12;
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:
  char v11 = [v8 BOOLValue];

  return v11;
}

+ (void)checkSelectors
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  unsigned int outCount = 0;
  uint64_t v2 = protocol_copyMethodDescriptionList((Protocol *)&unk_18C672F60, 1, 1, &outCount);
  id v3 = v2;
  if (outCount)
  {
    unint64_t v4 = 0LL;
    uint64_t v5 = (objc_selector **)v2;
    do
    {
      uint64_t v6 = categorizeSelector(*v5);
      _LSDefaultLog();
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        Name = sel_getName((SEL)*v5);
        *(_DWORD *)buf = 136315394;
        uint64_t v13 = Name;
        __int16 v14 = 1024;
        int v15 = v6;
        _os_log_impl(&dword_183E58000, v7, OS_LOG_TYPE_INFO, "Category for %s is %d", buf, 0x12u);
      }

      if (v6 == 6)
      {
        _LSDefaultLog();
        BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        {
          BOOL v10 = sel_getName((SEL)*v5);
          *(_DWORD *)buf = 136315138;
          uint64_t v13 = v10;
          _os_log_fault_impl(&dword_183E58000, v9, OS_LOG_TYPE_FAULT, "unknown category for %s!", buf, 0xCu);
        }
      }

      ++v4;
      v5 += 2;
    }

    while (v4 < outCount);
  }

  free(v3);
}

- (void).cxx_destruct
{
}

- (void)askedForMissingSelector:(os_log_s *)a3 .cold.1(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_5(&dword_183E58000, a3, (uint64_t)a3, "asked for missing selector %s", (uint8_t *)a2);
}

- (void)askedForMissingResourceKey:(uint64_t)a3 .cold.1(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v3 = 138412290;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_0_5(&dword_183E58000, a2, a3, "asked for missing resource key %@", (uint8_t *)&v3);
}

@end
@interface _LSDisplayNameConstructor
+ (BOOL)showAllExtensions;
+ (NSString)suffixForRemoteXCTests;
+ (id)concatenateBaseName:(id)a3 andExtension:(id)a4;
+ (id)displayNameConstructorWithContext:(LSContext *)a3 bundle:(unsigned int)a4 bundleClass:(const unsigned int *)a5 node:(id)a6 preferredLocalizations:(id)a7 error:(id *)a8;
+ (id)displayNameConstructorWithContext:(LSContext *)a3 node:(id)a4 error:(id *)a5;
+ (id)displayNameConstructorWithContextIfNeeded:(Context *)a3 bundle:(unsigned int)a4 bundleClass:(const unsigned int *)a5 node:(id)a6 preferredLocalizations:(id)a7 error:(id *)a8;
+ (id)displayNameConstructorWithContextIfNeeded:(Context *)a3 node:(id)a4 error:(id *)a5;
+ (id)displayNameConstructorsWithContext:(LSContext *)a3 bundle:(unsigned int)a4 bundleClass:(const unsigned int *)a5 node:(id)a6 error:(id *)a7;
+ (id)displayNameConstructorsWithContext:(LSContext *)a3 node:(id)a4 error:(id *)a5;
+ (id)displayNameConstructorsWithContextIfNeeded:(Context *)a3 bundle:(unsigned int)a4 bundleClass:(const unsigned int *)a5 node:(id)a6 error:(id *)a7;
+ (id)displayNameConstructorsWithContextIfNeeded:(Context *)a3 node:(id)a4 error:(id *)a5;
+ (unsigned)prepareMimicWithPopulator:(id)a3 error:(id *)a4;
+ (void)getExtensionRange:(_NSRange *)a3 secondaryExtensionRange:(_NSRange *)a4 fromFileName:(id)a5 considerConfusables:(BOOL)a6;
+ (void)setSuffixForRemoteXCTests:(id)a3;
- (BOOL)canSetExtensionHiddenWithContext:(LSContext *)a3;
- (BOOL)isStringNaturallyRTL:(id)a3;
- (BOOL)mayHideExtensionWithContextIfNeeded:(Context *)a3;
- (BOOL)showExtensionWithContextIfNeeded:(Context *)a3 asIfShowingAllExtensions:(id)a4;
- (BOOL)wantsHiddenExtension;
- (_LSDisplayNameConstructor)init;
- (_LSDisplayNameConstructor)initWithContextIfNeeded:(Context *)a3 node:(id)a4 isDirectory:(BOOL)a5 bundleClass:(const unsigned int *)a6 desiredDisplayName:(id)a7 treatAsFSName:(BOOL)a8;
- (id)cleanSecondaryExtension:(id)a3;
- (id)combineBaseName:(id)a3 extension:(id)a4;
- (id)insertCompleteNameBiDiControlCharacters:(id)a3;
- (id)insertNameComponentBiDiControlCharacters:(id)a3;
- (id)transformBeforeCombining:(id)a3 needsBiDiControlCharacters:(BOOL *)a4;
- (id)unlocalizedNameWithContext:(LSContext *)a3;
- (id)unlocalizedNameWithContext:(LSContext *)a3 asIfShowingAllExtensions:(id)a4;
- (id)unlocalizedNameWithContextIfNeeded:(Context *)a3;
- (id)unlocalizedNameWithContextIfNeeded:(Context *)a3 asIfShowingAllExtensions:(id)a4;
- (void)getTransformedBaseName:(id *)a3 extension:(id *)a4 needsBiDiControlCharacters:(BOOL)a5[2];
- (void)getUnlocalizedBaseName:(id *)a3 extension:(id *)a4 requiresAdditionalBiDiControlCharacters:(BOOL *)a5;
- (void)initContentBitsWithDisplayName:(id)a3 treatAsFSName:(BOOL)a4;
- (void)initNamePartsWithDisplayName:(id)a3;
- (void)initNodeBitsWithContextIfNeeded:(Context *)a3 node:(id)a4 isDirectory:(BOOL)a5 bundleClass:(const unsigned int *)a6;
@end

@implementation _LSDisplayNameConstructor

- (_LSDisplayNameConstructor)init
{
}

- (id)unlocalizedNameWithContext:(LSContext *)a3
{
  v8 = a3;
  id v9 = 0LL;
  char v10 = 0;
  id v11 = 0LL;
  v3 = -[_LSDisplayNameConstructor unlocalizedNameWithContextIfNeeded:asIfShowingAllExtensions:]( self,  "unlocalizedNameWithContextIfNeeded:asIfShowingAllExtensions:",  &v8,  0LL);
  if (v8) {
    BOOL v4 = v10 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4) {
    _LSContextDestroy((void **)&v8->db);
  }
  id v5 = v9;
  v8 = 0LL;
  id v9 = 0LL;

  char v10 = 0;
  id v6 = v11;
  id v11 = 0LL;

  return v3;
}

- (id)unlocalizedNameWithContext:(LSContext *)a3 asIfShowingAllExtensions:(id)a4
{
  id v6 = a4;
  v12 = a3;
  id v13 = 0LL;
  char v14 = 0;
  id v15 = 0LL;
  v7 = -[_LSDisplayNameConstructor unlocalizedNameWithContextIfNeeded:asIfShowingAllExtensions:]( self,  "unlocalizedNameWithContextIfNeeded:asIfShowingAllExtensions:",  &v12,  v6);
  if (v12) {
    BOOL v8 = v14 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8) {
    _LSContextDestroy((void **)&v12->db);
  }
  id v9 = v13;
  v12 = 0LL;
  id v13 = 0LL;

  char v14 = 0;
  id v10 = v15;
  id v15 = 0LL;

  return v7;
}

- (id)unlocalizedNameWithContextIfNeeded:(Context *)a3
{
  return -[_LSDisplayNameConstructor unlocalizedNameWithContextIfNeeded:asIfShowingAllExtensions:]( self,  "unlocalizedNameWithContextIfNeeded:asIfShowingAllExtensions:",  a3,  0LL);
}

- (id)unlocalizedNameWithContextIfNeeded:(Context *)a3 asIfShowingAllExtensions:(id)a4
{
  id v6 = a4;
  v7 = self->_baseName;
  BOOL v8 = self->_extension;
  if (!v8
    || !-[_LSDisplayNameConstructor showExtensionWithContextIfNeeded:asIfShowingAllExtensions:]( self,  "showExtensionWithContextIfNeeded:asIfShowingAllExtensions:",  a3,  v6)
    || (-[_LSDisplayNameConstructor combineBaseName:extension:](self, "combineBaseName:extension:", v7, v8),
        (id v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0LL))
  {
    -[_LSDisplayNameConstructor combineBaseName:extension:](self, "combineBaseName:extension:", v7, 0LL);
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  id v10 = (__CFString *)[v9 copy];

  if (v10) {
    id v11 = v10;
  }
  else {
    id v11 = @"?";
  }
  v12 = v11;

  return v12;
}

- (void)getUnlocalizedBaseName:(id *)a3 extension:(id *)a4 requiresAdditionalBiDiControlCharacters:(BOOL *)a5
{
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    [MEMORY[0x1896077D8] currentHandler];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 handleFailureInMethod:a2, self, @"LSDisplayNameConstructor.mm", 187, @"Invalid parameter not satisfying: %@", @"outSafeExtension != NULL" object file lineNumber description];

    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    [MEMORY[0x1896077D8] currentHandler];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 handleFailureInMethod:a2, self, @"LSDisplayNameConstructor.mm", 188, @"Invalid parameter not satisfying: %@", @"outRequiresBiDi != NULL" object file lineNumber description];

    goto LABEL_4;
  }

  [MEMORY[0x1896077D8] currentHandler];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 handleFailureInMethod:a2, self, @"LSDisplayNameConstructor.mm", 186, @"Invalid parameter not satisfying: %@", @"outSafeBaseName != NULL" object file lineNumber description];

  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  baseName = self->_baseName;
  id v11 = self->_extension;
  __int16 v23 = 0;
  v21 = v11;
  v22 = baseName;
  v12 = baseName;
  -[_LSDisplayNameConstructor getTransformedBaseName:extension:needsBiDiControlCharacters:]( self,  "getTransformedBaseName:extension:needsBiDiControlCharacters:",  &v22,  &v21,  &v23);
  id v13 = v22;

  char v14 = v21;
  id v15 = v13;
  *a3 = v15;
  v16 = v14;
  *a4 = v16;
  int v17 = v23 | HIBYTE(v23);

  *a5 = v17 != 0;
}

+ (NSString)suffixForRemoteXCTests
{
  if ([(id)__LSDefaultsGetSharedInstance() isInXCTestRigInsecure])
  {
    v2 = getenv("LS_SUFFIX_FOR_REMOTE_XCTESTS");
    if (v2)
    {
      [NSString stringWithUTF8String:v2];
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    v2 = 0LL;
  }

  return (NSString *)v2;
}

+ (void)setSuffixForRemoteXCTests:(id)a3
{
  id v3 = a3;
  if ([(id)__LSDefaultsGetSharedInstance() isInXCTestRigInsecure])
  {
    if (v3) {
      setenv("LS_SUFFIX_FOR_REMOTE_XCTESTS", (const char *)[v3 UTF8String], 1);
    }
    else {
      unsetenv("LS_SUFFIX_FOR_REMOTE_XCTESTS");
    }
  }
}

- (void).cxx_destruct
{
}

+ (id)displayNameConstructorWithContext:(LSContext *)a3 node:(id)a4 error:(id *)a5
{
  id v8 = a4;
  char v14 = a3;
  id v15 = 0LL;
  char v16 = 0;
  id v17 = 0LL;
  [a1 displayNameConstructorWithContextIfNeeded:&v14 bundle:0 bundleClass:0 node:v8 preferredLocalizations:0 error:a5];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14) {
    BOOL v10 = v16 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10) {
    _LSContextDestroy((void **)&v14->db);
  }
  id v11 = v15;
  char v14 = 0LL;
  id v15 = 0LL;

  char v16 = 0;
  id v12 = v17;
  id v17 = 0LL;

  return v9;
}

+ (id)displayNameConstructorWithContext:(LSContext *)a3 bundle:(unsigned int)a4 bundleClass:(const unsigned int *)a5 node:(id)a6 preferredLocalizations:(id)a7 error:(id *)a8
{
  uint64_t v11 = *(void *)&a4;
  id v14 = a6;
  id v15 = a7;
  v21 = a3;
  id v22 = 0LL;
  char v23 = 0;
  id v24 = 0LL;
  [a1 displayNameConstructorWithContextIfNeeded:&v21 bundle:v11 bundleClass:a5 node:v14 preferredLocalizations:v15 error:a8];
  char v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21) {
    BOOL v17 = v23 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (!v17) {
    _LSContextDestroy((void **)&v21->db);
  }
  id v18 = v22;
  v21 = 0LL;
  id v22 = 0LL;

  char v23 = 0;
  id v19 = v24;
  id v24 = 0LL;

  return v16;
}

+ (id)displayNameConstructorsWithContext:(LSContext *)a3 node:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v14 = a3;
  id v15 = 0LL;
  char v16 = 0;
  id v17 = 0LL;
  [a1 displayNameConstructorsWithContextIfNeeded:&v14 bundle:0 bundleClass:0 node:v8 error:a5];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14) {
    BOOL v10 = v16 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10) {
    _LSContextDestroy((void **)&v14->db);
  }
  id v11 = v15;
  id v14 = 0LL;
  id v15 = 0LL;

  char v16 = 0;
  id v12 = v17;
  id v17 = 0LL;

  return v9;
}

+ (id)displayNameConstructorsWithContext:(LSContext *)a3 bundle:(unsigned int)a4 bundleClass:(const unsigned int *)a5 node:(id)a6 error:(id *)a7
{
  uint64_t v9 = *(void *)&a4;
  id v12 = a6;
  id v18 = a3;
  id v19 = 0LL;
  char v20 = 0;
  id v21 = 0LL;
  [a1 displayNameConstructorsWithContextIfNeeded:&v18 bundle:v9 bundleClass:a5 node:v12 error:a7];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18) {
    BOOL v14 = v20 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14) {
    _LSContextDestroy((void **)&v18->db);
  }
  id v15 = v19;
  id v18 = 0LL;
  id v19 = 0LL;

  char v20 = 0;
  id v16 = v21;
  id v21 = 0LL;

  return v13;
}

+ (id)displayNameConstructorWithContextIfNeeded:(Context *)a3 node:(id)a4 error:(id *)a5
{
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (unsigned)prepareMimicWithPopulator:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (_LSPrepareMimicForBundleLookup(v5, (uint64_t)a4))
  {
    id v11 = sel_isBusyDirectory;
    id v12 = sel_hasHiddenExtension;
    id v6 = v5;
    uint64_t v7 = 0LL;
    LOBYTE(v8) = 1;
    do
    {
      while (!(_BYTE)v8)
      {
        if (++v7 == 2)
        {

          goto LABEL_11;
        }

        LOBYTE(v8) = 0;
      }

      int v8 = objc_msgSend(v6, "populateSimpleSelector:error:", (&v11)[v7++], a4, v11, v12);
    }

    while (v7 != 2);

    if (v8)
    {
      unsigned __int8 v9 = [v6 populateValueForKey:*MEMORY[0x189603E38] error:a4];
      goto LABEL_12;
    }
  }

+ (id)displayNameConstructorWithContextIfNeeded:(Context *)a3 bundle:(unsigned int)a4 bundleClass:(const unsigned int *)a5 node:(id)a6 preferredLocalizations:(id)a7 error:(id *)a8
{
  v45[1] = *MEMORY[0x1895F89C0];
  unsigned int v43 = a4;
  id v12 = a6;
  id v13 = a7;
  BOOL v14 = v13 != 0LL;
  if (a4 || ![v12 isVolume])
  {
    char v15 = 0;
    uint64_t v16 = 0LL;
    int v42 = 0;
  }

  else
  {
    int v42 = 0;
    char v15 = 1;
  }

  if ([v12 isBusyDirectory]) {
    goto LABEL_62;
  }
  uint64_t v16 = 1LL;
  if ((v15 & 1) != 0)
  {
    id v17 = 0LL;
    char v18 = 1;
    id v19 = v13;
LABEL_23:
    if (v17) {
      goto LABEL_43;
    }
    +[_LSDServiceDomain defaultServiceDomain]();
    v26 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v38 = (LaunchServices::CanonicalString **)LaunchServices::Database::Context::_get( (LaunchServices::Database::Context *)a3,  v26,  0LL);

    if (v38)
    {
      [v12 extensionWithError:a8];
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      if (v27)
      {
        if (![v27 length])
        {

          id v17 = 0LL;
          v28 = 0LL;
          goto LABEL_42;
        }

        if ((v18 & 1) != 0)
        {
          id v17 = 0LL;
LABEL_42:

LABEL_43:
          char v33 = v18 ^ 1;
          if (v17) {
            char v33 = 1;
          }
          if ((v33 & 1) != 0)
          {
            uint64_t v22 = 0LL;
          }

          else
          {
            id v41 = 0LL;
            uint64_t v22 = [v12 getResourceValue:&v41 forKey:*MEMORY[0x189603E38] options:1 error:0];
            if ((_DWORD)v22) {
              id v17 = v41;
            }
            else {
              id v17 = 0LL;
            }
          }

          if (v17) {
            goto LABEL_54;
          }
LABEL_52:
          [v12 nameWithError:a8];
          id v17 = (id)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            uint64_t v22 = 1LL;
            goto LABEL_54;
          }

+ (id)displayNameConstructorsWithContextIfNeeded:(Context *)a3 node:(id)a4 error:(id *)a5
{
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)displayNameConstructorsWithContextIfNeeded:(Context *)a3 bundle:(unsigned int)a4 bundleClass:(const unsigned int *)a5 node:(id)a6 error:(id *)a7
{
  v62[1] = *MEMORY[0x1895F89C0];
  unsigned int v60 = a4;
  id v11 = a6;
  int v12 = [v11 isVolume];
  if ((v12 & 1) != 0) {
    uint64_t v13 = 1LL;
  }
  else {
    uint64_t v13 = [v11 isDirectory];
  }
  int v59 = 0;
  _LSGetBRDisplayNameForContainerNode();
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v58 = v14;

  if (v14)
  {
    id v15 = v14;
    if ((v12 & 1) != 0)
    {
LABEL_12:
      v48 = (objc_class *)a1;
      [MEMORY[0x189603FC8] dictionary];
      char v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (a5)
      {
        if (!(_DWORD)v13) {
          goto LABEL_49;
        }
      }

      else
      {
        a5 = (const unsigned int *)&v59;
        if (!(_DWORD)v13)
        {
LABEL_49:
          [v20 objectForKeyedSubscript:@"LSDefaultLocalizedValue"];
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v39 = v38 == 0LL;

          if (v58) {
            BOOL v40 = v39;
          }
          else {
            BOOL v40 = 0;
          }
          if (v40)
          {
            id v41 = objc_alloc(v48);
            int v42 = (void *)[v41 initWithContextIfNeeded:a3 node:v11 isDirectory:v13 bundleClass:a5 desiredDisplayName:v58 treatAsFSName:1];
            [v20 setObject:v42 forKeyedSubscript:@"LSDefaultLocalizedValue"];
          }

          uint64_t v16 = (void *)[v20 copy];
          goto LABEL_55;
        }
      }

      if (([v11 isBusyDirectory] & 1) == 0)
      {
        +[_LSDServiceDomain defaultServiceDomain]();
        uint64_t v21 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
        uint64_t v22 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a3, v21, 0LL);

        if (v22)
        {
          [v11 extensionWithError:0];
          id v47 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v23 = v60;
          if (v60
            || (_LSFindOrFindOrRegisterBundleNode(v22, v11, (unsigned int *)a5, 0x2000000u, 0LL, &v60, 0LL),
                (uint64_t v23 = v60) != 0))
          {
            _LSBundleGetLocalizedNameDictionary(v22->db, v23, v11, v15);
            id v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
            {
LABEL_47:
              uint64_t v25 = v47;
              goto LABEL_48;
            }
          }

          else
          {
            id v24 = 0LL;
          }

          uint64_t v25 = v47;
          if (!v47) {
            goto LABEL_48;
          }
          if ([v47 length]) {
            char v26 = v12;
          }
          else {
            char v26 = 1;
          }
          if ((v26 & 1) != 0
            || !_LSBundleNodeHasUnregisteredPersonality((void **)&v22->db, v11, v47, (int *)a5))
          {
LABEL_46:
            id v24 = 0LL;
            goto LABEL_47;
          }

          if ([v11 canIssueIO])
          {
            if (*a5 != 10) {
              goto LABEL_41;
            }
            [v11 nameWithError:0];
            v27 = (_LSDatabase *)objc_claimAutoreleasedReturnValue();
            v28 = v27;
            if (!v27
              || !-[_LSDatabase isEqual:](v27, "isEqual:", @"myDocuments.cannedSearch")
              || (v30 = (LaunchServices::CanonicalString *)LaunchServices::CanonicalString::Find( (LaunchServices::CanonicalString *)v22->db,  v28,  v29)) == 0LL)
            {

              goto LABEL_41;
            }

            uint64_t LocalizedString = (LaunchServices::LocalizedString *)LaunchServices::CanonicalString::getLocalizedString(v30);
            LaunchServices::LocalizedString::getAllUnsafeLocalizations(LocalizedString, v22->db, 0LL, 0LL, 0LL);
            id v24 = (void *)objc_claimAutoreleasedReturnValue();

            uint64_t v25 = v47;
            if (!v24)
            {
LABEL_41:
              if ([v11 canIssueIO])
              {
                [v11 bundleInfoDictionaryWithError:0];
                char v33 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
                if (v33)
                {
                  v34 = (objc_class *)objc_opt_class();
                  uint64_t v35 = *MEMORY[0x189604AA0];
                  XNSDictionaryObjectForKeyOfClass(v33, (objc_object *)*MEMORY[0x189604AA0], v34);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v36)
                  {
                    [v15 stringByDeletingPathExtension];
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v36, "caseInsensitiveCompare:"))
                    {
                      id v24 = 0LL;
                    }

                    else
                    {
                      _LSBundleGetLocalizer(v22->db, 0LL, 0LL, v11);
                      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
                      v45 = v44;
                      if (v44)
                      {
                        [v44 localizedStringDictionaryWithString:v35 defaultValue:0];
                        id v24 = (void *)objc_claimAutoreleasedReturnValue();
                      }

                      else
                      {
                        id v24 = 0LL;
                      }
                    }
                  }

                  else
                  {
                    id v24 = 0LL;
                  }
                }

                else
                {
                  id v24 = 0LL;
                }

                goto LABEL_47;
              }

              goto LABEL_46;
            }

+ (BOOL)showAllExtensions
{
  return 0;
}

- (BOOL)canSetExtensionHiddenWithContext:(LSContext *)a3
{
  if ((*((_BYTE *)self + 32) & 4) != 0) {
    return 0;
  }
  id v5 = self->_extension;
  if (v5)
  {
    BOOL v10 = a3;
    id v11 = 0LL;
    char v12 = 0;
    id v13 = 0LL;
    BOOL v6 = -[_LSDisplayNameConstructor mayHideExtensionWithContextIfNeeded:]( self,  "mayHideExtensionWithContextIfNeeded:",  &v10);
    if (v10 && v12) {
      _LSContextDestroy((void **)&v10->db);
    }
    id v7 = v11;
    BOOL v10 = 0LL;
    id v11 = 0LL;

    char v12 = 0;
    id v8 = v13;
    id v13 = 0LL;
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (_LSDisplayNameConstructor)initWithContextIfNeeded:(Context *)a3 node:(id)a4 isDirectory:(BOOL)a5 bundleClass:(const unsigned int *)a6 desiredDisplayName:(id)a7 treatAsFSName:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v11 = a5;
  id v15 = a4;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS____LSDisplayNameConstructor;
  id v17 = -[_LSDisplayNameConstructor init](&v21, sel_init);
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
LABEL_7:
    [MEMORY[0x1896077D8] currentHandler];
    char v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 handleFailureInMethod:a2, v17, @"LSDisplayNameConstructor.mm", 880, @"Invalid parameter not satisfying: %@", @"displayName != nil" object file lineNumber description];

    if (!v17) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  [MEMORY[0x1896077D8] currentHandler];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 handleFailureInMethod:a2, v17, @"LSDisplayNameConstructor.mm", 879, @"Invalid parameter not satisfying: %@", @"node != NULL" object file lineNumber description];

  if (!v16) {
    goto LABEL_7;
  }
LABEL_3:
  if (v17)
  {
LABEL_4:
    -[_LSDisplayNameConstructor initNodeBitsWithContextIfNeeded:node:isDirectory:bundleClass:]( v17,  "initNodeBitsWithContextIfNeeded:node:isDirectory:bundleClass:",  a3,  v15,  v11,  a6);
    -[_LSDisplayNameConstructor initContentBitsWithDisplayName:treatAsFSName:]( v17,  "initContentBitsWithDisplayName:treatAsFSName:",  v16,  v8);
    -[_LSDisplayNameConstructor initNamePartsWithDisplayName:](v17, "initNamePartsWithDisplayName:", v16);
  }

+ (void)getExtensionRange:(_NSRange *)a3 secondaryExtensionRange:(_NSRange *)a4 fromFileName:(id)a5 considerConfusables:(BOOL)a6
{
  if (a3)
  {
    a3->location = 0x7FFFFFFFFFFFFFFFLL;
    a3->length = 0LL;
  }

  if (a4)
  {
    a4->location = 0x7FFFFFFFFFFFFFFFLL;
    a4->length = 0LL;
  }

- (void)initNodeBitsWithContextIfNeeded:(Context *)a3 node:(id)a4 isDirectory:(BOOL)a5 bundleClass:(const unsigned int *)a6
{
  BOOL v7 = a5;
  id v14 = a4;
  char v10 = *((_BYTE *)self + 32) & 0xFE | [v14 hasHiddenExtension];
  *((_BYTE *)self + 32) = v10;
  if (v7)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    BOOL v11 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    char v12 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a3, v11, 0LL);

    char v10 = *((_BYTE *)self + 32) & 0xFD | (2 * (_LSNodeIsPackage(v12, v14, 0LL) == 0));
    *((_BYTE *)self + 32) = v10;
  }

  if (a6)
  {
    int v13 = *a6;
  }

  else
  {
    int v13 = _LSGetBundleClassForNode(0LL, v14);
    char v10 = *((_BYTE *)self + 32);
  }

  *((_BYTE *)self + 32) = v10 & 0xFB | (4 * (v13 == 2));
}

- (void)initContentBitsWithDisplayName:(id)a3 treatAsFSName:(BOOL)a4
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __83___LSDisplayNameConstructor_Private__initContentBitsWithDisplayName_treatAsFSName___block_invoke;
  v4[3] = &unk_189D75F08;
  BOOL v5 = a4;
  v4[4] = self;
  _LSDNCWithInlineBuffer(a3, v4);
}

- (void)initNamePartsWithDisplayName:(id)a3
{
  id v5 = a3;
  __int128 v17 = xmmword_183FBF300;
  [(id)objc_opt_class() getExtensionRange:&v17 secondaryExtensionRange:0 fromFileName:v5 considerConfusables:0];
  BOOL v6 = (NSString *)[v5 copy];
  originalName = self->_originalName;
  self->_originalName = v6;

  uint64_t v8 = v17;
  if ((void)v17 == 0x7FFFFFFFFFFFFFFFLL || !*((void *)&v17 + 1))
  {
    id v15 = (NSString *)objc_msgSend(v5, "copy", (void)v17);
    baseName = self->_baseName;
    self->_baseName = v15;
  }

  else
  {
    if (!(void)v17)
    {
      [MEMORY[0x1896077D8] currentHandler];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend( v16,  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"LSDisplayNameConstructor.mm",  1039,  @"Path extension allegedly starts at the beginning of the display name, which is invalid.");

      uint64_t v8 = v17;
    }

    objc_msgSend(v5, "substringToIndex:", v8 - 1, (void)v17);
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue();
    char v10 = (NSString *)[v9 copy];
    BOOL v11 = self->_baseName;
    self->_baseName = v10;

    [v5 substringFromIndex:(void)v17];
    baseName = (void *)objc_claimAutoreleasedReturnValue();
    int v13 = (NSString *)[baseName copy];
    extension = self->_extension;
    self->_extension = v13;
  }
}

- (id)cleanSecondaryExtension:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if ([v3 rangeOfCharacterFromSet:-[_LSDisplayNameConstructor(Private) cleanSecondaryExtension:]::nonExtensionCharacters] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = &v7;
    uint64_t v9 = 0x3032000000LL;
    char v10 = __Block_byref_object_copy__16;
    BOOL v11 = __Block_byref_object_dispose__16;
    id v12 = 0LL;
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __62___LSDisplayNameConstructor_Private__cleanSecondaryExtension___block_invoke_2;
    v6[3] = &unk_189D75F50;
    v6[4] = &v7;
    _LSDNCWithInlineBuffer(v3, v6);
    id v4 = (id)v8[5];

    _Block_object_dispose(&v7, 8);
  }

  return v4;
}

+ (id)concatenateBaseName:(id)a3 andExtension:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 handleFailureInMethod:a2, a1, @"LSDisplayNameConstructor.mm", 1203, @"Invalid parameter not satisfying: %@", @"baseName != nil" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }

  [MEMORY[0x1896077D8] currentHandler];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 handleFailureInMethod:a2, a1, @"LSDisplayNameConstructor.mm", 1204, @"Invalid parameter not satisfying: %@", @"extension != nil" object file lineNumber description];

LABEL_3:
  uint64_t v10 = [v9 length];
  if (v10)
  {
    uint64_t v11 = [v7 length];
    id v12 = (id)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:v10 + v11 + 1];
    [v12 appendString:v7];
    [v12 appendString:@"."];
    [v12 appendString:v9];
  }

  else
  {
    id v12 = v7;
  }

  return v12;
}

- (id)combineBaseName:(id)a3 extension:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v19 = 0;
  id v17 = v7;
  id v18 = v6;
  -[_LSDisplayNameConstructor getTransformedBaseName:extension:needsBiDiControlCharacters:]( self,  "getTransformedBaseName:extension:needsBiDiControlCharacters:",  &v18,  &v17,  &v19);
  id v8 = (NSString *)v18;

  uint64_t v9 = (NSString *)v17;
  int v10 = HIBYTE(v19);
  if (v19)
  {
    if ((_BYTE)v19)
    {
      uint64_t v12 = -[_LSDisplayNameConstructor insertNameComponentBiDiControlCharacters:]( self,  "insertNameComponentBiDiControlCharacters:",  v8);

      int v10 = HIBYTE(v19);
      id v8 = (NSString *)v12;
    }

    if (v10)
    {
      uint64_t v13 = -[_LSDisplayNameConstructor insertNameComponentBiDiControlCharacters:]( self,  "insertNameComponentBiDiControlCharacters:",  v9);

      uint64_t v9 = (NSString *)v13;
    }
  }

  else if (v8 == self->_baseName && v9 == self->_extension)
  {
    uint64_t v11 = self->_originalName;
    goto LABEL_14;
  }

  if (v9)
  {
    [(id)objc_opt_class() concatenateBaseName:v8 andExtension:v9];
    id v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v14 = v8;
  }

  uint64_t v11 = v14;
  if (v19 | HIBYTE(v19))
  {
    uint64_t v15 = -[_LSDisplayNameConstructor insertCompleteNameBiDiControlCharacters:]( self,  "insertCompleteNameBiDiControlCharacters:",  v14);

    uint64_t v11 = (NSString *)v15;
  }

- (void)getTransformedBaseName:(id *)a3 extension:(id *)a4 needsBiDiControlCharacters:(BOOL)a5[2]
{
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_11:
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 handleFailureInMethod:a2, self, @"LSDisplayNameConstructor.mm", 1267, @"Invalid parameter not satisfying: %@", @"ioExtension != NULL" object file lineNumber description];

    if (a3) {
      goto LABEL_4;
    }
    goto LABEL_12;
  }

  [MEMORY[0x1896077D8] currentHandler];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 handleFailureInMethod:a2, self, @"LSDisplayNameConstructor.mm", 1266, @"Invalid parameter not satisfying: %@", @"ioBaseName != NULL" object file lineNumber description];

  if (!a4) {
    goto LABEL_11;
  }
LABEL_3:
  if (a3) {
    goto LABEL_4;
  }
LABEL_12:
  [MEMORY[0x1896077D8] currentHandler];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 handleFailureInMethod:a2, self, @"LSDisplayNameConstructor.mm", 1268, @"Invalid parameter not satisfying: %@", @"ioBaseName != NULL" object file lineNumber description];

LABEL_4:
  __int16 v14 = 0;
  if (*a3)
  {
    -[_LSDisplayNameConstructor transformBeforeCombining:needsBiDiControlCharacters:]( self,  "transformBeforeCombining:needsBiDiControlCharacters:",  *a3,  (char *)&v14 + 1);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (*a4)
  {
    -[_LSDisplayNameConstructor transformBeforeCombining:needsBiDiControlCharacters:]( self,  "transformBeforeCombining:needsBiDiControlCharacters:",  *a4,  &v14);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v10 = v14;
  }

  else
  {
    BOOL v10 = 0;
  }

  *a5 = HIBYTE(v14);
  a5[1] = v10;
}

- (id)transformBeforeCombining:(id)a3 needsBiDiControlCharacters:(BOOL *)a4
{
  id v6 = (NSString *)a3;
  id v7 = v6;
  if (v6)
  {
    if ((*((_BYTE *)self + 32) & 8) != 0)
    {
      id v8 = v6;
      if ((*((_BYTE *)self + 32) & 0x20) != 0)
      {
        uint64_t v9 = _LSDNCBalanceBiDiControlCharacters(v6);

        id v8 = (void *)v9;
      }

      LOBYTE(v6) = -[_LSDisplayNameConstructor isStringNaturallyRTL:](self, "isStringNaturallyRTL:", v8);
    }

    else
    {
      LOBYTE(v6) = 0;
      id v8 = v7;
    }
  }

  else
  {
    id v8 = 0LL;
  }

  if (a4) {
    *a4 = (char)v6;
  }
  if (v8)
  {
    char v10 = *((_BYTE *)self + 32);
    if ((v10 & 0x10) != 0)
    {
      uint64_t v11 = [v8 stringByReplacingOccurrencesOfString:@":" withString:@"/"];

      if (!v11)
      {
        id v8 = 0LL;
        goto LABEL_17;
      }

      char v10 = *((_BYTE *)self + 32);
      id v8 = (void *)v11;
    }

    if ((v10 & 0x40) != 0)
    {
      uint64_t v12 = _LSDNCReplaceForbiddenCharacters((NSString *)v8, 0);

      id v8 = (void *)v12;
    }
  }

- (id)insertNameComponentBiDiControlCharacters:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = -[_LSDisplayNameConstructor isStringNaturallyRTL:](self, "isStringNaturallyRTL:", v4);
    id v6 = v4;
    if (v5)
    {
      objc_msgSend(MEMORY[0x189607940], "stringWithCapacity:", objc_msgSend(v4, "length") + 2);
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 appendCharacters:&UNICHAR_FIRST_STRONG_ISOLATE length:1];
      [v6 appendString:v4];
      [v6 appendCharacters:&UNICHAR_POP_DIRECTIONAL_ISOLATE length:1];
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (id)insertCompleteNameBiDiControlCharacters:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x189607940], "stringWithCapacity:", objc_msgSend(v3, "length") + 1);
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 appendCharacters:&UNICHAR_LEFT_TO_RIGHT_MARK length:1];
    [v5 appendString:v4];
  }

  else
  {
    BOOL v5 = 0LL;
  }

  return v5;
}

- (BOOL)wantsHiddenExtension
{
  return *((_BYTE *)self + 32) & 1;
}

- (BOOL)mayHideExtensionWithContextIfNeeded:(Context *)a3
{
  return self->_extension != 0LL;
}

- (BOOL)showExtensionWithContextIfNeeded:(Context *)a3 asIfShowingAllExtensions:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6) {
    char v8 = [v6 BOOLValue];
  }
  else {
    char v8 = [(id)objc_opt_class() showAllExtensions];
  }
  else {
    BOOL v9 = !-[_LSDisplayNameConstructor mayHideExtensionWithContextIfNeeded:]( self,  "mayHideExtensionWithContextIfNeeded:",  a3);
  }

  return v9;
}

- (BOOL)isStringNaturallyRTL:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  uint64_t v8 = 0LL;
  BOOL v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  if (v3)
  {
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __55___LSDisplayNameConstructor_RTL__isStringNaturallyRTL___block_invoke;
    v7[3] = &unk_189D75F78;
    v7[4] = &v8;
    _LSDNCWithCharacters(v3, v7);
    BOOL v5 = *((_BYTE *)v9 + 24) != 0;
  }

  else
  {
    BOOL v5 = 0;
  }

  _Block_object_dispose(&v8, 8);

  return v5;
}

@end
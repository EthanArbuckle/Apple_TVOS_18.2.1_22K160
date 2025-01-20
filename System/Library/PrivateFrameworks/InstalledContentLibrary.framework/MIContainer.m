@interface MIContainer
+ (BOOL)removeContainers:(id)a3 waitForDeletion:(BOOL)a4 error:(id *)a5;
+ (id)_allContainersForIdentifier:(id)a3 persona:(id)a4 options:(unint64_t)a5 error:(id *)a6;
+ (id)_bundleContainerForIdentifier:(id)a3 forPersona:(id)a4 error:(id *)a5;
+ (id)allContainersForAllPersonasForIdentifier:(id)a3 options:(unint64_t)a4 error:(id *)a5;
+ (id)containerWithIdentifier:(id)a3 forPersona:(id)a4 ofContentClass:(unint64_t)a5 createIfNeeded:(BOOL)a6 created:(BOOL *)a7 error:(id *)a8;
+ (id)containersForIdentifier:(id)a3 groupContainerIdentifier:(id)a4 ofContentClass:(unint64_t)a5 forPersona:(id)a6 fetchTransient:(BOOL)a7 createIfNeeded:(BOOL)a8 error:(id *)a9;
+ (id)containersWithClass:(unint64_t)a3 error:(id *)a4;
+ (id)containersWithClass:(unint64_t)a3 personaUniqueString:(id)a4 error:(id *)a5;
+ (id)groupContainerURLsForBundleIdentifier:(id)a3 forPersona:(id)a4 error:(id *)a5;
+ (id)tempContainerWithIdentifier:(id)a3 forPersona:(id)a4 ofContentClass:(unint64_t)a5 error:(id *)a6;
- (BOOL)_deriveContainerStatusWithError:(id *)a3;
- (BOOL)_doInitWithContainer:(id)a3 error:(id *)a4;
- (BOOL)_replaceExistingContainer:(id)a3 replacementReason:(unint64_t)a4 waitForDeletion:(BOOL)a5 error:(id *)a6;
- (BOOL)_setContainer:(id)a3 error:(id *)a4;
- (BOOL)clearStagedUpdateContainerStatusWithError:(id *)a3;
- (BOOL)isNew;
- (BOOL)isStagedUpdateContainer:(BOOL *)a3 withError:(id *)a4;
- (BOOL)isTransient;
- (BOOL)makeContainerLiveReplacingContainer:(id)a3 reason:(unint64_t)a4 waitForDeletion:(BOOL)a5 withError:(id *)a6;
- (BOOL)makeContainerLiveWithError:(id *)a3;
- (BOOL)markContainerAsStagedUpdateContainer:(id *)a3;
- (BOOL)purgeContentWithError:(id *)a3;
- (BOOL)recreateDefaultStructureWithError:(id *)a3;
- (BOOL)regenerateDirectoryUUIDWithError:(id *)a3;
- (BOOL)removeUnderlyingContainerWaitingForDeletion:(BOOL)a3 error:(id *)a4;
- (BOOL)setInfoValue:(id)a3 forKey:(id)a4 error:(id *)a5;
- (MIContainer)initWithContainer:(id)a3 error:(id *)a4;
- (MIContainer)initWithContainerURL:(id)a3;
- (MIContainer)initWithToken:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (MIMCMContainer)rawContainer;
- (NSString)identifier;
- (NSString)personaUniqueString;
- (NSURL)containerURL;
- (id)description;
- (id)infoValueForKey:(id)a3 error:(id *)a4;
- (unint64_t)containerClass;
- (unint64_t)diskUsage;
- (unint64_t)status;
- (void)dealloc;
- (void)setContainerClass:(unint64_t)a3;
- (void)setContainerURL:(id)a3;
- (void)setDiskUsage:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsTransient:(BOOL)a3;
- (void)setStatus:(unint64_t)a3;
@end

@implementation MIContainer

- (MIContainer)initWithContainerURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MIContainer;
  v6 = -[MIContainer init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_containerURL, a3);
  }

  return v7;
}

- (BOOL)_deriveContainerStatusWithError:(id *)a3
{
  if (-[MIContainer isTransient](self, "isTransient"))
  {
    id v5 = 0LL;
    self->_status = 2LL;
LABEL_10:
    BOOL v11 = 1;
    goto LABEL_11;
  }

  id v13 = 0LL;
  v6 = -[MIContainer infoValueForKey:error:]( self,  "infoValueForKey:error:",  @"com.apple.MobileContainerManager.SafeHarborInfo",  &v13);
  id v7 = v13;
  id v5 = v7;
  if (v6)
  {
    unint64_t v8 = 3LL;
LABEL_9:
    self->_status = v8;

    goto LABEL_10;
  }

  if (!v7)
  {
LABEL_8:

    id v5 = 0LL;
    unint64_t v8 = 1LL;
    goto LABEL_9;
  }

  [v7 domain];
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v9 isEqualToString:@"MIContainerManagerErrorDomain"])
  {
    uint64_t v10 = [v5 code];

    if (v10 == 24) {
      goto LABEL_8;
    }
  }

  else
  {
  }

  if (a3)
  {
    id v5 = v5;
    BOOL v11 = 0;
    *a3 = v5;
  }

  else
  {
    BOOL v11 = 0;
  }

- (BOOL)_doInitWithContainer:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v12 = 0LL;
  BOOL v8 = -[MIContainer _deriveContainerStatusWithError:](self, "_deriveContainerStatusWithError:", &v12);
  id v9 = v12;
  uint64_t v10 = v9;
  if (a4 && !v8) {
    *a4 = v9;
  }

  return v8;
}

- (MIContainer)initWithContainer:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MIContainer;
  id v7 = -[MIContainer init](&v15, sel_init);
  BOOL v8 = v7;
  if (!v7)
  {
    id v11 = 0LL;
    goto LABEL_6;
  }

  id v14 = 0LL;
  BOOL v9 = -[MIContainer _doInitWithContainer:error:](v7, "_doInitWithContainer:error:", v6, &v14);
  id v10 = v14;
  id v11 = v10;
  if (v9)
  {
LABEL_6:
    id v12 = v8;
    goto LABEL_7;
  }

  if (a4)
  {
    id v11 = v10;
    id v12 = 0LL;
    *a4 = v11;
  }

  else
  {
    id v12 = 0LL;
  }

- (MIContainer)initWithToken:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  int v6 = a4;
  id v8 = a3;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___MIContainer;
  BOOL v9 = -[MIContainer init](&v28, sel_init);
  if (!v9)
  {
    id v11 = 0LL;
    goto LABEL_6;
  }

  [v8 containerURL];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    id v14 = objc_alloc(&OBJC_CLASS___MIMCMContainer);
    [v8 serializedContainerRepresentation];
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue();
    id v27 = 0LL;
    v16 = -[MIMCMContainer initWithSerializedContainer:matchingWithOptions:error:]( v14,  "initWithSerializedContainer:matchingWithOptions:error:",  v15,  ~(v6 << 16) & 0x30000,  &v27);
    id v17 = v27;

    if (v16)
    {
      v25 = a5;
      v19 = -[MIMCMContainer personaUniqueString](v16, "personaUniqueString");
      [v8 personaUniqueString];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[MIMCMContainer identifier](v16, "identifier");
      [v8 identifier];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (![v22 isEqualToString:v21]
        || v20 && v19 && ([v20 isEqualToString:v19] & 1) == 0)
      {
        _CreateAndLogError( (uint64_t)"-[MIContainer initWithToken:options:error:]",  170LL,  @"MIInstallerErrorDomain",  186LL,  v17,  0LL,  @"Deserialized container object had identity %@/%@ but the token was for %@/%@",  v23,  (uint64_t)v21);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        BOOL v24 = 0;
      }

      else
      {
        id v26 = v17;
        BOOL v24 = -[MIContainer _doInitWithContainer:error:](v9, "_doInitWithContainer:error:", v16, &v26);
        id v11 = v26;
      }

      a5 = v25;
      if (v24) {
        goto LABEL_4;
      }
      if (v25)
      {
LABEL_17:
        id v11 = v11;
        id v12 = 0LL;
        *a5 = v11;
        goto LABEL_7;
      }
    }

    else
    {
      _CreateAndLogError( (uint64_t)"-[MIContainer initWithToken:options:error:]",  160LL,  @"MIInstallerErrorDomain",  186LL,  v17,  0LL,  @"Failed to serialize container data %@",  v18,  (uint64_t)v8);
      id v11 = (id)objc_claimAutoreleasedReturnValue();

      if (a5) {
        goto LABEL_17;
      }
    }

    id v12 = 0LL;
    goto LABEL_7;
  }

  objc_storeStrong((id *)&v9->_containerURL, v10);
  id v11 = 0LL;
LABEL_4:

LABEL_6:
  id v12 = v9;
LABEL_7:

  return v12;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 testFlagsAreSet:64];

  unint64_t v5 = -[MIContainer containerClass](self, "containerClass");
  char v17 = 0;
  id v16 = 0LL;
  BOOL v6 = -[MIContainer isStagedUpdateContainer:withError:](self, "isStagedUpdateContainer:withError:", &v17, &v16);
  id v7 = v16;
  if (!v6)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      id v10 = self;
      id v13 = v7;
      MOLogWrite();
    }

    char v17 = 0;

    id v7 = 0LL;
  }

  if (-[MIContainer isTransient](self, "isTransient", v10, v13) && !v17 && (v5 == 14 || v5 == 1) && (v4 & 1) == 0)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      id v11 = self;
      MOLogWrite();
    }

    id v15 = v7;
    BOOL v9 = -[MIContainer removeUnderlyingContainerWaitingForDeletion:error:]( self,  "removeUnderlyingContainerWaitingForDeletion:error:",  0LL,  &v15,  v11);
    id v8 = v15;

    if (!v9 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      -[MIContainer identifier](self, "identifier");
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
    }
  }

  else
  {
    id v8 = v7;
  }

  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MIContainer;
  -[MIContainer dealloc](&v14, sel_dealloc);
}

- (NSString)identifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 identifier];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)personaUniqueString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 personaUniqueString];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)containerClass
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = [v2 containerClass];

  return v3;
}

- (BOOL)isTransient
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 isTransient];

  return v3;
}

- (BOOL)isNew
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 isNew];

  return v3;
}

- (void)setContainerURL:(id)a3
{
}

- (NSURL)containerURL
{
  containerURL = self->_containerURL;
  if (containerURL)
  {
    char v3 = containerURL;
  }

  else
  {
    -[MIContainer rawContainer](self, "rawContainer");
    char v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 containerURL];
    char v3 = (NSURL *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (BOOL)_setContainer:(id)a3 error:(id *)a4
{
  id v7 = a3;
  -[MIContainer rawContainer](self, "rawContainer");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = [v8 isEqual:v7];

  if ((v9 & 1) == 0)
  {
    if (!v7)
    {
      -[MIContainer setContainerURL:](self, "setContainerURL:", 0LL);
      goto LABEL_8;
    }

    uint64_t v11 = [v7 containerClass];
    if (v11 == -[MIContainer containerClass](self, "containerClass"))
    {
      [v7 identifier];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIContainer identifier](self, "identifier");
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      char v14 = [v12 isEqualToString:v13];

      if ((v14 & 1) != 0)
      {

        objc_storeStrong((id *)&self->_rawContainer, a3);
LABEL_8:
        id v16 = 0LL;
        BOOL v10 = 1;
LABEL_13:

        goto LABEL_14;
      }

      _CreateAndLogError( (uint64_t)"-[MIContainer _setContainer:error:]",  279LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Attempted to set container with mismatched identifier %@ on %@",  v15,  (uint64_t)v12);
      id v16 = (id)objc_claimAutoreleasedReturnValue();

      if (!a4)
      {
LABEL_12:
        BOOL v10 = 0;
        goto LABEL_13;
      }
    }

    else
    {
      -[MIContainer containerClass](self, "containerClass");
      _CreateAndLogError( (uint64_t)"-[MIContainer _setContainer:error:]",  273LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Attempted to set container %@ with content class %llu on %@ which represents a container with class %llu",  v17,  (uint64_t)v7);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      if (!a4) {
        goto LABEL_12;
      }
    }

    id v16 = v16;
    BOOL v10 = 0;
    *a4 = v16;
    goto LABEL_13;
  }

  BOOL v10 = 1;
LABEL_14:

  return v10;
}

- (BOOL)removeUnderlyingContainerWaitingForDeletion:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  v16[1] = *MEMORY[0x1895F89C0];
  -[MIContainer rawContainer](self, "rawContainer");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  [MEMORY[0x189603F18] arrayWithObjects:v16 count:1];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = 0LL;
  BOOL v9 = +[MIMCMContainer deleteContainers:waitForDeletion:error:]( &OBJC_CLASS___MIMCMContainer,  "deleteContainers:waitForDeletion:error:",  v8,  v5,  &v15);
  id v10 = v15;

  if (!v9)
  {
    -[MIContainer rawContainer](self, "rawContainer");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIContainer removeUnderlyingContainerWaitingForDeletion:error:]",  306LL,  @"MIInstallerErrorDomain",  4LL,  v10,  0LL,  @"Failed to delete container_object_t for %@",  v12,  (uint64_t)v11);
    id v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      id v10 = v13;
      *a4 = v10;
    }

    else
    {
      id v10 = v13;
    }
  }

  return v9;
}

- (BOOL)_replaceExistingContainer:(id)a3 replacementReason:(unint64_t)a4 waitForDeletion:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  v28[2] = *MEMORY[0x1895F89C0];
  id v10 = a3;
  -[MIContainer identifier](self, "identifier");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v12 = -[MIContainer containerClass](self, "containerClass");
  -[MIContainer rawContainer](self, "rawContainer");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 rawContainer];
  char v14 = (void *)objc_claimAutoreleasedReturnValue();

  id v26 = 0LL;
  int v15 = [v13 replaceExistingContainer:v14 error:&v26];
  id v16 = v26;

  if (v15)
  {
    if (v7)
    {
      -[MIContainer rawContainer](self, "rawContainer");
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      id v25 = 0LL;
      int v18 = [v17 reclaimDiskSpaceWithError:&v25];
      id v19 = v25;
      uint64_t v20 = v18 ^ 1u;
    }

    else
    {
      uint64_t v20 = 0LL;
    }

    if (a4 == 1 && v12 == 1)
    {
      v27[0] = *MEMORY[0x189604E00];
      v27[1] = @"MobileInstallationDemotionCompleteErrorOccurred";
      v28[0] = v11;
      [MEMORY[0x189607968] numberWithBool:v20];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v28[1] = v21;
      [MEMORY[0x189603F68] dictionaryWithObjects:v28 forKeys:v27 count:2];
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607860] defaultCenter];
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v23 postNotificationName:@"MobileInstallationDemotionCompleteNotification" object:0 userInfo:v22 options:3];
    }
  }

  else if (a6)
  {
    *a6 = v16;
  }

  return v15;
}

+ (id)containersForIdentifier:(id)a3 groupContainerIdentifier:(id)a4 ofContentClass:(unint64_t)a5 forPersona:(id)a6 fetchTransient:(BOOL)a7 createIfNeeded:(BOOL)a8 error:(id *)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  uint64_t v57 = *MEMORY[0x1895F89C0];
  uint64_t v14 = (uint64_t)a3;
  unint64_t v15 = (unint64_t)a4;
  id v16 = a6;
  v47 = (void *)objc_opt_new();
  BOOL v45 = (v14 | v15) != 0;
  if (v14 | v15)
  {
    if (v14)
    {
      uint64_t v54 = 0LL;
      int v18 = (id *)&v54;
      uint64_t v19 = +[MIMCMContainer containersForBundleIdentifier:contentClass:forPersona:create:fetchTransient:error:]( &OBJC_CLASS___MIMCMContainer,  "containersForBundleIdentifier:contentClass:forPersona:create:fetchTransient:error:",  v14,  a5,  v16,  v9,  v10,  &v54);
    }

    else
    {
      if (!v15)
      {
        v22 = 0LL;
        goto LABEL_31;
      }

      uint64_t v53 = 0LL;
      int v18 = (id *)&v53;
      uint64_t v19 = +[MIMCMContainer containersForGroupIdentifier:forPersona:create:fetchTransient:error:]( &OBJC_CLASS___MIMCMContainer,  "containersForGroupIdentifier:forPersona:create:fetchTransient:error:",  v15,  v16,  v9,  v10,  &v53);
    }
  }

  else
  {
    uint64_t v55 = 0LL;
    int v18 = (id *)&v55;
    uint64_t v19 = +[MIMCMContainer containersForContentClass:forPersona:fetchTransient:error:]( &OBJC_CLASS___MIMCMContainer,  "containersForContentClass:forPersona:fetchTransient:error:",  a5,  v16,  v10,  &v55);
  }

  uint64_t v20 = (void *)v19;
  id v21 = *v18;
  v22 = v21;
  if (!v20)
  {
LABEL_31:
    _CreateAndLogError( (uint64_t)"+[MIContainer containersForIdentifier:groupContainerIdentifier:ofContentClass:forPersona:fetchTransient:c reateIfNeeded:error:]",  378LL,  @"MIInstallerErrorDomain",  4LL,  v22,  0LL,  @"Failed to retrieve any containers for identifier: %@ groupIdentifier: %@ container type: %llu persona: %@",  v17,  v14);
    id v25 = (void *)objc_claimAutoreleasedReturnValue();

    id obj = 0LL;
    v35 = 0LL;
    goto LABEL_32;
  }

  id v42 = v16;
  unint64_t v43 = v15;
  uint64_t v44 = v14;

  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id obj = v20;
  uint64_t v23 = [obj countByEnumeratingWithState:&v49 objects:v56 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    id v25 = 0LL;
    uint64_t v26 = 0LL;
    uint64_t v27 = *(void *)v50;
    while (2)
    {
      for (uint64_t i = 0LL; i != v24; ++i)
      {
        if (*(void *)v50 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = *(void *)(*((void *)&v49 + 1) + 8 * i);
        id v30 = objc_alloc((Class)objc_opt_class());
        id v48 = 0LL;
        v31 = (void *)[v30 initWithContainer:v29 error:&v48];
        id v32 = v48;
        v33 = v32;
        if (v31)
        {
          [v47 addObject:v31];
        }

        else
        {
          id v34 = v32;

          if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
          {
            uint64_t v40 = v29;
            id v41 = v34;
            MOLogWrite();
          }

          if (v45)
          {

            v35 = 0LL;
            id v25 = v34;
            goto LABEL_29;
          }

          ++v26;
          id v25 = v34;
        }
      }

      uint64_t v24 = [obj countByEnumeratingWithState:&v49 objects:v56 count:16];
      if (v24) {
        continue;
      }
      break;
    }
  }

  else
  {
    id v25 = 0LL;
    uint64_t v26 = 0LL;
  }

  if ([obj count] || !v25)
  {
    v35 = (void *)objc_msgSend(v47, "copy", v40, v41);
  }

  else
  {
    _CreateAndLogError( (uint64_t)"+[MIContainer containersForIdentifier:groupContainerIdentifier:ofContentClass:forPersona:fetchTransient:c reateIfNeeded:error:]",  400LL,  @"MIInstallerErrorDomain",  4LL,  v25,  0LL,  @"Failed to construct MIContainer object for all %llu containers; last error is underlying error",
      v36,
    uint64_t v37 = v26);

    v35 = 0LL;
    id v25 = (void *)v37;
  }

+ (id)groupContainerURLsForBundleIdentifier:(id)a3 forPersona:(id)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v32 = 0LL;
  +[MIMCMContainer containersForBundleIdentifier:contentClass:forPersona:create:fetchTransient:error:]( &OBJC_CLASS___MIMCMContainer,  "containersForBundleIdentifier:contentClass:forPersona:create:fetchTransient:error:",  v7,  7LL,  a4,  1LL,  0LL,  &v32);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v32;
  uint64_t v11 = v9;
  if (!v8)
  {
    _CreateAndLogError( (uint64_t)"+[MIContainer groupContainerURLsForBundleIdentifier:forPersona:error:]",  423LL,  @"MIInstallerErrorDomain",  4LL,  v9,  0LL,  @"Failed to retrieve any shared data containers for %@",  v10,  (uint64_t)v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    id v21 = 0LL;
    unint64_t v12 = 0LL;
    if (!a5) {
      goto LABEL_19;
    }
    goto LABEL_17;
  }

  id v25 = v9;
  id v27 = v7;
  unint64_t v12 = (void *)objc_opt_new();
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  uint64_t v26 = v8;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v29;
    do
    {
      for (uint64_t i = 0LL; i != v15; ++i)
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v13);
        }
        int v18 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        objc_msgSend(v18, "identifier", v24);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v18 containerURL];
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          [v12 setObject:v20 forKeyedSubscript:v19];
        }

        else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          uint64_t v24 = v19;
          MOLogWrite();
        }
      }

      uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }

    while (v15);
  }

  id v21 = (void *)[v12 copy];
  id v7 = v27;
  v22 = v25;
  id v8 = v26;
  if (a5)
  {
LABEL_17:
    if (!v21) {
      *a5 = v22;
    }
  }

+ (id)tempContainerWithIdentifier:(id)a3 forPersona:(id)a4 ofContentClass:(unint64_t)a5 error:(id *)a6
{
  v29[1] = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  id v28 = 0LL;
  +[MIMCMContainer transientContainerForIdentifier:contentClass:forPersona:create:error:]( &OBJC_CLASS___MIMCMContainer,  "transientContainerForIdentifier:contentClass:forPersona:create:error:",  v9,  a5,  v10,  1LL,  &v28);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = v28;
  if (!v11) {
    goto LABEL_14;
  }
  if ([v11 isNew]) {
    goto LABEL_3;
  }
  uint64_t v24 = a6;
  v29[0] = v11;
  [MEMORY[0x189603F18] arrayWithObjects:v29 count:1];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  id v27 = v12;
  BOOL v17 = +[MIMCMContainer deleteContainers:waitForDeletion:error:]( &OBJC_CLASS___MIMCMContainer,  "deleteContainers:waitForDeletion:error:",  v16,  0LL,  &v27);
  id v14 = v27;

  if (v17)
  {
    id v26 = v14;
    +[MIMCMContainer transientContainerForIdentifier:contentClass:forPersona:create:error:]( &OBJC_CLASS___MIMCMContainer,  "transientContainerForIdentifier:contentClass:forPersona:create:error:",  v9,  a5,  v10,  1LL,  &v26);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = v26;

    a6 = v24;
    if (v19)
    {
      if ([v19 isNew])
      {
        uint64_t v11 = v19;
LABEL_3:
        id v25 = v12;
        id v13 = (void *)[objc_alloc((Class)objc_opt_class()) initWithContainer:v11 error:&v25];
        id v14 = v25;

        if (v13)
        {
          id v12 = v14;
          goto LABEL_17;
        }

        uint64_t v22 = _CreateAndLogError( (uint64_t)"+[MIContainer tempContainerWithIdentifier:forPersona:ofContentClass:error:]",  479LL,  @"MIInstallerErrorDomain",  4LL,  v14,  0LL,  @"Failed to create MIContainer instance for %@",  v15,  (uint64_t)v11);
        goto LABEL_13;
      }

      uint64_t v22 = _CreateAndLogError( (uint64_t)"+[MIContainer tempContainerWithIdentifier:forPersona:ofContentClass:error:]",  472LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Unexpectedly received existing container %@ when request was to create a new container for %@",  v21,  (uint64_t)v19);
      id v14 = v12;
      uint64_t v11 = v19;
    }

    else
    {
      uint64_t v22 = _CreateAndLogError( (uint64_t)"+[MIContainer tempContainerWithIdentifier:forPersona:ofContentClass:error:]",  468LL,  @"MIInstallerErrorDomain",  4LL,  v12,  0LL,  @"Failed to create container for %@",  v20,  (uint64_t)v9);
      uint64_t v11 = 0LL;
      id v14 = v12;
    }
  }

  else
  {
    uint64_t v22 = _CreateAndLogError( (uint64_t)"+[MIContainer tempContainerWithIdentifier:forPersona:ofContentClass:error:]",  462LL,  @"MIInstallerErrorDomain",  4LL,  v14,  0LL,  @"Failed to delete existing transient container for %@",  v18,  (uint64_t)v9);
    a6 = v24;
  }

+ (id)containerWithIdentifier:(id)a3 forPersona:(id)a4 ofContentClass:(unint64_t)a5 createIfNeeded:(BOOL)a6 created:(BOOL *)a7 error:(id *)a8
{
  BOOL v9 = a6;
  v35[1] = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v13 = a4;
  id v34 = 0LL;
  +[MIMCMContainer containerForIdentifier:contentClass:forPersona:create:error:]( &OBJC_CLASS___MIMCMContainer,  "containerForIdentifier:contentClass:forPersona:create:error:",  v12,  a5,  v13,  v9,  &v34);
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = v34;
  id v17 = v15;
  if (!v14)
  {
    if (!v9)
    {
      [v15 domain];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v21 isEqualToString:@"MIContainerManagerErrorDomain"])
      {
        uint64_t v22 = [v17 code];

        if (v22 == 21)
        {
          LOBYTE(v18) = 0;
          uint64_t v19 = 0LL;
          goto LABEL_17;
        }
      }

      else
      {
      }
    }

    uint64_t v25 = _CreateAndLogError( (uint64_t)"+[MIContainer containerWithIdentifier:forPersona:ofContentClass:createIfNeeded:created:error:]",  504LL,  @"MIInstallerErrorDomain",  4LL,  v17,  0LL,  @"Failed to find container of class %llu with identity %@/%@",  v16,  a5);
    goto LABEL_25;
  }

  int v18 = [v14 isNew];
  id v33 = v17;
  uint64_t v19 = (void *)[objc_alloc((Class)objc_opt_class()) initWithContainer:v14 error:&v33];
  id v20 = v33;

  if (v19)
  {
    id v17 = v20;
    goto LABEL_17;
  }

  uint64_t v23 = objc_opt_class();
  uint64_t v25 = _CreateAndLogError( (uint64_t)"+[MIContainer containerWithIdentifier:forPersona:ofContentClass:createIfNeeded:created:error:]",  512LL,  @"MIInstallerErrorDomain",  4LL,  v20,  0LL,  @"Failed to create %@ instance for %@",  v24,  v23);

  if (v18)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      __int128 v30 = v14;
      MOLogWrite();
    }

    v35[0] = v14;
    objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v35, 1, v30, v14);
    id v26 = (void *)objc_claimAutoreleasedReturnValue();
    id v32 = 0LL;
    BOOL v27 = +[MIMCMContainer deleteContainers:waitForDeletion:error:]( &OBJC_CLASS___MIMCMContainer,  "deleteContainers:waitForDeletion:error:",  v26,  0LL,  &v32);
    id v17 = v32;

LABEL_25:
    id v28 = a8;

    uint64_t v19 = 0LL;
    id v17 = (id)v25;
    LOBYTE(v18) = v14 != 0LL;
    if (!a7) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }

  uint64_t v19 = 0LL;
  id v17 = (id)v25;
LABEL_17:
  id v28 = a8;
  if (a7) {
LABEL_18:
  }
    *a7 = v18;
LABEL_19:
  if (v28 && !v19) {
    *id v28 = v17;
  }

  return v19;
}

+ (BOOL)removeContainers:(id)a3 waitForDeletion:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = (void *)objc_opt_new();
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v13), "rawContainer", (void)v18);
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 addObject:v14];

        ++v13;
      }

      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v11);
  }

  id v15 = (void *)[v8 copy];
  BOOL v16 = +[MIMCMContainer deleteContainers:waitForDeletion:error:]( &OBJC_CLASS___MIMCMContainer,  "deleteContainers:waitForDeletion:error:",  v15,  v6,  a5);

  return v16;
}

+ (id)containersWithClass:(unint64_t)a3 error:(id *)a4
{
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)objc_opt_class() containersWithClass:a3 personaUniqueString:v6 error:a4];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)containersWithClass:(unint64_t)a3 personaUniqueString:(id)a4 error:(id *)a5
{
  id v7 = a4;
  [(id)objc_opt_class() containersForIdentifier:0 groupContainerIdentifier:0 ofContentClass:a3 forPersona:v7 fetchTransient:0 createIfNeeded:0 error:a5];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)recreateDefaultStructureWithError:(id *)a3
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = 0LL;
  char v6 = [v5 recreateDefaultStructureWithError:&v12];
  id v7 = v12;

  if ((v6 & 1) == 0)
  {
    -[MIContainer rawContainer](self, "rawContainer");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIContainer recreateDefaultStructureWithError:]",  563LL,  @"MIInstallerErrorDomain",  4LL,  v7,  0LL,  @"Failed to recreate structure for %@",  v9,  (uint64_t)v8);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3)
    {
      id v7 = v10;
      *a3 = v7;
    }

    else
    {
      id v7 = v10;
    }
  }

  return v6;
}

- (BOOL)makeContainerLiveReplacingContainer:(id)a3 reason:(unint64_t)a4 waitForDeletion:(BOOL)a5 withError:(id *)a6
{
  BOOL v7 = a5;
  id v11 = a3;
  if (!v11 && a4 != 3)
  {
    _CreateAndLogError( (uint64_t)"-[MIContainer makeContainerLiveReplacingContainer:reason:waitForDeletion:withError:]",  583LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Existing container was nil but replacement reason was not NewContainer; given %ld",
      v10,
      a4);
LABEL_20:
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    __int128 v18 = 0LL;
    goto LABEL_21;
  }

  unint64_t v12 = -[MIContainer status](self, "status");
  if (v12 == 1)
  {
    -[MIContainer recreateDefaultStructureWithError:](self, "recreateDefaultStructureWithError:", 0LL);
    id v21 = 0LL;
    __int128 v18 = 0LL;
LABEL_48:
    BOOL v29 = 1;
    goto LABEL_49;
  }

  if (v12 != 3)
  {
    if (v12 != 2)
    {
      uint64_t v42 = -[MIContainer status](self, "status");
      _CreateAndLogError( (uint64_t)"-[MIContainer makeContainerLiveReplacingContainer:reason:waitForDeletion:withError:]",  662LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Unknown container status: %lu",  v30,  v42);
      goto LABEL_20;
    }

    -[MIContainer identifier](self, "identifier");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v14 = -[MIContainer containerClass](self, "containerClass");
    id v51 = 0LL;
    BOOL v15 = -[MIContainer _replaceExistingContainer:replacementReason:waitForDeletion:error:]( self,  "_replaceExistingContainer:replacementReason:waitForDeletion:error:",  v11,  a4,  v7,  &v51);
    id v16 = v51;
    id v17 = v16;
    if (v15)
    {
      __int128 v18 = 0LL;
      id v19 = v16;
      goto LABEL_9;
    }

    [v16 domain];
    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v31 isEqualToString:@"MIContainerManagerErrorDomain"])
    {
      uint64_t v32 = [v17 code];

      if (v32 == 27)
      {

        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          id v41 = self;
          MOLogWrite();
        }

        id v50 = 0LL;
        BOOL v34 = -[MIContainer removeUnderlyingContainerWaitingForDeletion:error:]( self,  "removeUnderlyingContainerWaitingForDeletion:error:",  0LL,  &v50,  v41);
        id v35 = v50;
        if (!v34)
        {
          if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
          {
            unint64_t v43 = self;
            id v44 = v35;
            MOLogWrite();
          }

          id v35 = 0LL;
        }

        id v49 = v35;
        +[MIMCMContainer containerForIdentifier:contentClass:forPersona:create:error:]( &OBJC_CLASS___MIMCMContainer,  "containerForIdentifier:contentClass:forPersona:create:error:",  v13,  v14,  0LL,  0LL,  &v49,  v43,  v44);
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
        id v17 = v49;

        if (v18)
        {
          id v48 = v17;
          BOOL v37 = -[MIContainer _setContainer:error:](self, "_setContainer:error:", v18, &v48);
          id v19 = v48;

          if (v37)
          {
LABEL_9:
            id v47 = v19;
            -[MIContainer infoValueForKey:error:]( self,  "infoValueForKey:error:",  @"com.apple.MobileContainerManager.SafeHarborInfo",  &v47);
            __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
            id v21 = v47;

            if (v20)
            {
              if (gLogHandle && *(int *)(gLogHandle + 44) < 5)
              {
                unint64_t v24 = 3LL;
                goto LABEL_47;
              }

              -[MIContainer containerURL](self, "containerURL");
              uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
              [v22 path];
              uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
              MOLogWrite();
              unint64_t v24 = 3LL;
            }

            else
            {
              if (gLogHandle && *(int *)(gLogHandle + 44) < 5)
              {
                unint64_t v24 = 1LL;
                goto LABEL_47;
              }

              -[MIContainer containerURL](self, "containerURL");
              uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
              [v22 path];
              uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
              MOLogWrite();
              unint64_t v24 = 1LL;
            }

LABEL_47:
            self->_status = v24;

            goto LABEL_48;
          }

          _CreateAndLogError( (uint64_t)"-[MIContainer makeContainerLiveReplacingContainer:reason:waitForDeletion:withError:]",  622LL,  @"MIInstallerErrorDomain",  22LL,  v19,  0LL,  @"Failed to set container after fetching existing container found when making container live for %@",  v38,  (uint64_t)v13);
          id v21 = (id)objc_claimAutoreleasedReturnValue();
          id v17 = v19;
        }

        else
        {
          _CreateAndLogError( (uint64_t)"-[MIContainer makeContainerLiveReplacingContainer:reason:waitForDeletion:withError:]",  617LL,  @"MIInstallerErrorDomain",  22LL,  v17,  0LL,  @"Failed to get existing container when replacement found the live container was already present for %@",  v36,  (uint64_t)v13);
          id v21 = (id)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_40;
      }
    }

    else
    {
    }

    _CreateAndLogError( (uint64_t)"-[MIContainer makeContainerLiveReplacingContainer:reason:waitForDeletion:withError:]",  626LL,  @"MIInstallerErrorDomain",  22LL,  v17,  0LL,  @"Failed to make staged container live %@",  v33,  (uint64_t)self);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    __int128 v18 = 0LL;
LABEL_40:

LABEL_21:
    if (a6)
    {
      id v21 = v21;
      BOOL v29 = 0;
      *a6 = v21;
    }

    else
    {
      BOOL v29 = 0;
    }

    goto LABEL_49;
  }

  id v46 = 0LL;
  BOOL v25 = -[MIContainer setInfoValue:forKey:error:]( self,  "setInfoValue:forKey:error:",  0LL,  @"com.apple.MobileContainerManager.SafeHarborInfo",  &v46);
  id v21 = v46;
  if (!v25)
  {
    uint64_t v39 = _CreateAndLogError( (uint64_t)"-[MIContainer makeContainerLiveReplacingContainer:reason:waitForDeletion:withError:]",  644LL,  @"MIInstallerErrorDomain",  22LL,  v21,  0LL,  @"Failed to make safe harbor container live %@",  v26,  (uint64_t)self);

    __int128 v18 = 0LL;
    id v21 = (id)v39;
    goto LABEL_21;
  }

  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    -[MIContainer identifier](self, "identifier");
    BOOL v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIContainer containerURL](self, "containerURL");
    id v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v28 path];
    BOOL v45 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();
  }

  __int128 v18 = 0LL;
  BOOL v29 = 1;
  self->_status = 1LL;
LABEL_49:

  return v29;
}

- (BOOL)makeContainerLiveWithError:(id *)a3
{
  return -[MIContainer makeContainerLiveReplacingContainer:reason:waitForDeletion:withError:]( self,  "makeContainerLiveReplacingContainer:reason:waitForDeletion:withError:",  0LL,  3LL,  0LL,  a3);
}

- (BOOL)setInfoValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  -[MIContainer rawContainer](self, "rawContainer");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v16 = 0LL;
  char v11 = [v10 setInfoValue:v8 forKey:v9 error:&v16];
  id v12 = v16;

  if ((v11 & 1) == 0)
  {
    _CreateAndLogError( (uint64_t)"-[MIContainer setInfoValue:forKey:error:]",  686LL,  @"MIInstallerErrorDomain",  4LL,  v12,  0LL,  @"Failed to set value %@ for key %@ for container %@",  v13,  (uint64_t)v8);
    unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5)
    {
      id v12 = v14;
      *a5 = v12;
    }

    else
    {
      id v12 = v14;
    }
  }

  return v11;
}

- (id)infoValueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[MIContainer rawContainer](self, "rawContainer");
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = 0LL;
  [v7 infoValueForKey:v6 error:&v11];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  id v9 = v11;
  if (a4 && !v8) {
    *a4 = v9;
  }

  return v8;
}

- (BOOL)regenerateDirectoryUUIDWithError:(id *)a3
{
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = 0LL;
  char v5 = [v4 regenerateDirectoryUUIDWithError:&v8];
  id v6 = v8;

  if (a3 && (v5 & 1) == 0) {
    *a3 = v6;
  }

  return v5;
}

- (BOOL)purgeContentWithError:(id *)a3
{
  unint64_t v5 = -[MIContainer containerClass](self, "containerClass");
  if (v5 > 7 || ((1LL << v5) & 0x94) == 0)
  {
    -[MIContainer identifier](self, "identifier");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MIContainer purgeContentWithError:]",  733LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Container for identifier %@ is not a data container; found class %ld.",
      v11,
      (uint64_t)v10);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    char v8 = 0;
    if (!a3) {
      goto LABEL_10;
    }
  }

  else
  {
    -[MIContainer rawContainer](self, "rawContainer");
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = 0LL;
    char v8 = [v7 purgeContentWithError:&v13];
    id v9 = v13;

    if (!a3) {
      goto LABEL_10;
    }
  }

  if ((v8 & 1) == 0) {
    *a3 = v9;
  }
LABEL_10:

  return v8;
}

- (unint64_t)diskUsage
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = [v2 diskUsage];

  return v3;
}

+ (id)_bundleContainerForIdentifier:(id)a3 forPersona:(id)a4 error:(id *)a5
{
  id v10 = 0LL;
  +[MIBundleContainer appBundleContainerWithIdentifier:createIfNeeded:created:error:]( &OBJC_CLASS___MIBundleContainer,  "appBundleContainerWithIdentifier:createIfNeeded:created:error:",  a3,  0LL,  0LL,  &v10);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v10;
  char v8 = v7;
  if (a5 && !v6) {
    *a5 = v7;
  }

  return v6;
}

+ (id)_allContainersForIdentifier:(id)a3 persona:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  char v7 = a5;
  uint64_t v68 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = (void *)objc_opt_new();
  v56 = (void *)objc_opt_new();
  if ((v7 & 0xB) == 0)
  {
    id v19 = v12;
    goto LABEL_69;
  }

  +[MIGlobalConfiguration sharedInstance](&OBJC_CLASS___MIGlobalConfiguration, "sharedInstance");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 primaryPersonaString];
  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v65 = 0LL;
  [a1 _bundleContainerForIdentifier:v10 forPersona:v14 error:&v65];
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
  id v16 = v65;

  if (!v15)
  {
    [v16 domain];
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v20 isEqualToString:@"MIContainerManagerErrorDomain"])
    {
      id v21 = v16;
      uint64_t v22 = [v16 code];

      if (v22 != 21)
      {
        uint64_t v32 = 0LL;
        id v17 = 0LL;
        goto LABEL_65;
      }

      if ((v7 & 4) == 0)
      {

        id v55 = 0LL;
        unint64_t v18 = 0x189D47000uLL;
        goto LABEL_15;
      }

      _CreateAndLogError( (uint64_t)"+[MIContainer _allContainersForIdentifier:persona:options:error:]",  820LL,  @"MIInstallerErrorDomain",  26LL,  0LL,  0LL,  @"No bundle container found for identifier %@",  v23,  (uint64_t)v10);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
    }

    id v17 = 0LL;
    uint64_t v32 = 0LL;
    goto LABEL_65;
  }

  id v55 = v16;
  [v15 bundle];
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 & 1) != 0) {
    [v12 addObject:v15];
  }
  unint64_t v18 = 0x189D47000LL;
  if (v17)
  {
    if ((v7 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_36;
  }

+ (id)allContainersForAllPersonasForIdentifier:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  return (id)[a1 _allContainersForIdentifier:a3 persona:0 options:a4 error:a5];
}

- (BOOL)markContainerAsStagedUpdateContainer:(id *)a3
{
  if (!-[MIContainer isTransient](self, "isTransient"))
  {
    _CreateAndLogError( (uint64_t)"-[MIContainer markContainerAsStagedUpdateContainer:]",  928LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Non transient container can't be marked as a staged container",  v5,  v13);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!a3)
    {
LABEL_7:
      BOOL v8 = 0;
      goto LABEL_8;
    }

- (BOOL)clearStagedUpdateContainerStatusWithError:(id *)a3
{
  if (!-[MIContainer isTransient](self, "isTransient"))
  {
    _CreateAndLogError( (uint64_t)"-[MIContainer clearStagedUpdateContainerStatusWithError:]",  952LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Clearing staged container requested for non transient container",  v5,  v13);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!a3)
    {
LABEL_7:
      BOOL v8 = 0;
      goto LABEL_8;
    }

- (BOOL)isStagedUpdateContainer:(BOOL *)a3 withError:(id *)a4
{
  id v17 = 0LL;
  -[MIContainer infoValueForKey:error:]( self,  "infoValueForKey:error:",  @"com.apple.MobileContainerManager.StagedUpdateContainer",  &v17);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v17;
  id v8 = v7;
  if (v6)
  {
    objc_opt_class();
    id v9 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v10 = v9;
    }
    else {
      id v10 = 0LL;
    }

    if (v10)
    {
      char v13 = [v10 BOOLValue];
      if (!a3)
      {
LABEL_12:
        BOOL v15 = 1;
        goto LABEL_18;
      }

- (id)description
{
  unint64_t v3 = (void *)NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = -[MIContainer status](self, "status");
  -[MIContainer rawContainer](self, "rawContainer");
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@ status:%lu container:%@>", v4, v5, v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MIMCMContainer)rawContainer
{
  return self->_rawContainer;
}

- (void)setContainerClass:(unint64_t)a3
{
  self->_containerClass = a3;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (void)setDiskUsage:(unint64_t)a3
{
  self->_diskUsage = a3;
}

- (void)setIsTransient:(BOOL)a3
{
  self->_isTransient = a3;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
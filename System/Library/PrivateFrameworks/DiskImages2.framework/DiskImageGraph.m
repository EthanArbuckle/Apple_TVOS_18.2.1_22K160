@interface DiskImageGraph
+ (BOOL)copyDictNodesToFolder:(id)a3 dict:(id)a4 error:(id *)a5;
+ (BOOL)createNodesConnectivityWithNodesDict:(id)a3 error:(id *)a4;
+ (BOOL)failWithNoPstackError:(id *)a3;
+ (BOOL)loadPlistDictFromURL:(id)a3 dict:(id *)a4 error:(id *)a5;
+ (BOOL)populateNodesDictsWithArray:(id)a3 pstackURL:(id)a4 nodesDict:(id)a5 isTopLevelPstack:(BOOL)a6 error:(id *)a7;
+ (BOOL)saveToPlistWithDictionary:(id)a3 URL:(id)a4 error:(id *)a5;
+ (BOOL)validateWithDictionary:(id)a3 error:(id *)a4;
+ (id)createPstackDictWithNode:(id)a3;
+ (id)getFirstNonCacheAncestorWithNode:(id)a3 error:(id *)a4;
+ (id)getImageInfoDictWithURL:(id)a3 error:(id *)a4;
+ (id)getImageUUIDStrWithIdentityInfo:(id)a3 stackableUUIDFallback:(BOOL)a4 error:(id *)a5;
+ (id)getImageUUIDWithURL:(id)a3 allowMissingUUID:(BOOL)a4 error:(id *)a5;
+ (id)getRelativeIfContainedWithChildURL:(id)a3 parentURL:(id)a4;
- (BOOL)appendCacheWithURL:(id)a3 tag:(id)a4 error:(id *)a5;
- (BOOL)appendWithURL:(id)a3 isCache:(BOOL)a4 tag:(id)a5 numBlocks:(unint64_t)a6 setNewActive:(BOOL)a7 error:(id *)a8;
- (BOOL)appendWithURL:(id)a3 isCache:(BOOL)a4 tag:(id)a5 numBlocks:(unint64_t)a6 toNode:(id)a7 setNewActive:(BOOL)a8 error:(id *)a9;
- (BOOL)appendWithURL:(id)a3 tag:(id)a4 error:(id *)a5;
- (BOOL)appendWithURL:(id)a3 tag:(id)a4 numBlocks:(unint64_t)a5 error:(id *)a6;
- (BOOL)checkStackValidityWithError:(id *)a3;
- (BOOL)cloneToURL:(id)a3 error:(id *)a4;
- (BOOL)imported;
- (BOOL)loadImportedNodesWithError:(id *)a3;
- (BOOL)removeNodeWithTag:(id)a3 recursive:(BOOL)a4 error:(id *)a5;
- (BOOL)removeNodeWithUUID:(id)a3 recursive:(BOOL)a4 error:(id *)a5;
- (BOOL)removeWithNode:(id)a3 recursive:(BOOL)a4 error:(id *)a5;
- (BOOL)savePstackWithError:(id *)a3;
- (BOOL)setActiveNodeWithTag:(id)a3 error:(id *)a4;
- (BOOL)setActiveNodeWithUUID:(id)a3 error:(id *)a4;
- (BOOL)validateAppendedImageWithURL:(id)a3 parentNode:(id)a4 isCache:(BOOL)a5 error:(id *)a6;
- (DiskImageGraph)initWithBaseImageURL:(id)a3 newPstackURL:(id)a4 tag:(id)a5 error:(id *)a6;
- (DiskImageGraph)initWithData:(id)a3 pstackURL:(id)a4 imported:(BOOL)a5 error:(id *)a6;
- (DiskImageGraph)initWithPluginName:(id)a3 pluginParams:(id)a4 newPstackURL:(id)a5 tag:(id)a6 error:(id *)a7;
- (DiskImageGraph)initWithPstackURL:(id)a3 error:(id *)a4;
- (DiskImageGraph)initWithPstackURL:(id)a3 imported:(BOOL)a4 error:(id *)a5;
- (DiskImageGraphNode)activeNode;
- (NSMutableArray)imagesDictsArray;
- (NSMutableDictionary)nodes;
- (NSMutableDictionary)pstackDB;
- (NSURL)pstackURL;
- (id)activeInfoWithExtra:(BOOL)a3 error:(id *)a4;
- (id)baseNode;
- (id)getImageWithTag:(id)a3 error:(id *)a4;
- (id)getImageWithUUID:(id)a3 error:(id *)a4;
- (id)infoWithExtra:(BOOL)a3 error:(id *)a4;
- (void)setActiveNode:(id)a3;
- (void)setImagesDictsArray:(id)a3;
- (void)setImported:(BOOL)a3;
- (void)setNodes:(id)a3;
- (void)setPstackDB:(id)a3;
- (void)setPstackURL:(id)a3;
@end

@implementation DiskImageGraph

+ (BOOL)loadPlistDictFromURL:(id)a3 dict:(id *)a4 error:(id *)a5
{
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    [v7 readDataUpToLength:0x100000 error:a5];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      [MEMORY[0x1896079E8] propertyListWithData:v9 options:2 format:0 error:a5];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        *a4 = v10;
        BOOL v11 = 1;
      }

      else
      {
        BOOL v11 = +[DiskImageGraph failWithNoPstackError:](&OBJC_CLASS___DiskImageGraph, "failWithNoPstackError:", a5);
      }
    }

    else
    {
      BOOL v11 = 0;
    }
  }

  else
  {
    BOOL v11 = +[DiskImageGraph failWithNoPstackError:](&OBJC_CLASS___DiskImageGraph, "failWithNoPstackError:", a5);
  }

  return v11;
}

+ (BOOL)failWithNoPstackError:(id *)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:@"Not a pstack." forKeyedSubscript:@"DIErrorVerboseInfo"];
  [MEMORY[0x189607870] errorWithDomain:@"com.apple.DiskImages2.ErrorDomain" code:167 userInfo:v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3) {
    *a3 = v5;
  }

  return 0;
}

+ (id)createPstackDictWithNode:(id)a3
{
  id v3 = a3;
  [v3 toDictionary];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)[v4 mutableCopy];
  [v3 setPstackDict:v5];

  v6 = (void *)MEMORY[0x189603FC8];
  [v3 UUID];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 UUIDString];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x189603FA8];
  [v3 pstackDict];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  [v9 arrayWithObject:v10];
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( v6,  "dictionaryWithObjectsAndKeys:",  @"1.0",  @"PstackVersion",  v8,  @"ActiveNode",  v11,  @"Images",  0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (DiskImageGraph)initWithPluginName:(id)a3 pluginParams:(id)a4 newPstackURL:(id)a5 tag:(id)a6 error:(id *)a7
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___DiskImageGraph;
  v15 = -[DiskImageGraph init](&v36, sel_init);
  v16 = v15;
  if (!v15) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v15->_pstackURL, a5);
  uint64_t v17 = [MEMORY[0x189607AB8] UUID];
  if (v17)
  {
    v18 = (void *)v17;
    LOBYTE(v35) = 0;
    v19 = -[PluginDiskImageGraphNode initWithPluginName:pluginParams:tag:UUID:parentNode:metadata:isCache:]( objc_alloc(&OBJC_CLASS___PluginDiskImageGraphNode),  "initWithPluginName:pluginParams:tag:UUID:parentNode:metadata:isCache:",  v11,  v12,  v14,  v17,  0LL,  0LL,  v35);
    activeNode = v16->_activeNode;
    v16->_activeNode = &v19->super;
    v21 = v19;

    uint64_t v22 = +[DiskImageGraph createPstackDictWithNode:](&OBJC_CLASS___DiskImageGraph, "createPstackDictWithNode:", v21);
    pstackDB = v16->_pstackDB;
    v16->_pstackDB = (NSMutableDictionary *)v22;

    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    nodes = v16->_nodes;
    v16->_nodes = v24;
    v26 = -[DiskImageGraph nodes](v16, "nodes");
    v27 = -[DiskImageGraphNode UUID](v21, "UUID");
    [v27 UUIDString];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v26 setObject:v21 forKeyedSubscript:v28];

LABEL_4:
    v29 = v16;
    goto LABEL_12;
  }

  int v30 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    *(_DWORD *)buf = 68157954;
    int v38 = 73;
    __int16 v39 = 2080;
    v40 = "-[DiskImageGraph initWithPluginName:pluginParams:newPstackURL:tag:error:]";
    v32 = (char *)_os_log_send_and_compose_impl();

    if (v32)
    {
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v32);
      free(v32);
    }
  }

  else
  {
    getDIOSLog();
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68157954;
      int v38 = 73;
      __int16 v39 = 2080;
      v40 = "-[DiskImageGraph initWithPluginName:pluginParams:newPstackURL:tag:error:]";
      _os_log_impl( &dword_188046000,  v33,  OS_LOG_TYPE_ERROR,  "%.*s: Failed to get UUID info of provided image.",  buf,  0x12u);
    }
  }

  v29 = 0LL;
  *__error() = v30;
LABEL_12:

  return v29;
}

- (NSMutableArray)imagesDictsArray
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"Images"];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSMutableArray *)v3;
}

+ (BOOL)validateWithDictionary:(id)a3 error:(id *)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = 0;
  if ([v5 validateAndPopObjectForKey:@"PstackVersion" className:objc_opt_class() isOptional:0 error:a4])
  {
    if ([v5 validateAndPopObjectForKey:@"ImportPstack" className:objc_opt_class() isOptional:1 error:a4])
    {
      BOOL v6 = 0;
      if ([v5 validateAndPopObjectForKey:@"ActiveNode" className:objc_opt_class() isOptional:0 error:a4])
      {
        BOOL v6 = 0;
        if ([v5 validateAndPopObjectForKey:@"Images" className:objc_opt_class() isOptional:0 error:a4])
        {
          if ([v5 count])
          {
            objc_msgSend( NSString,  "stringWithFormat:",  @"Validation failed, input contains unexpected data.");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            BOOL v6 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  v7,  a4);
          }

          else
          {
            BOOL v6 = 1;
          }
        }
      }
    }

    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (DiskImageGraph)initWithData:(id)a3 pstackURL:(id)a4 imported:(BOOL)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___DiskImageGraph;
  id v12 = -[DiskImageGraph init](&v26, sel_init);
  if (v12)
  {
    if (!+[DiskImageGraph validateWithDictionary:error:]( &OBJC_CLASS___DiskImageGraph,  "validateWithDictionary:error:",  v10,  a6)) {
      goto LABEL_10;
    }
    v12->_imported = a5;
    objc_storeStrong((id *)&v12->_pstackURL, a4);
    uint64_t v13 = [MEMORY[0x189603FC8] dictionaryWithDictionary:v10];
    pstackDB = v12->_pstackDB;
    v12->_pstackDB = (NSMutableDictionary *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    nodes = v12->_nodes;
    v12->_nodes = v15;

    -[NSMutableDictionary objectForKeyedSubscript:](v12->_pstackDB, "objectForKeyedSubscript:", @"Images");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v18 = +[DiskImageGraph populateNodesDictsWithArray:pstackURL:nodesDict:isTopLevelPstack:error:]( &OBJC_CLASS___DiskImageGraph,  "populateNodesDictsWithArray:pstackURL:nodesDict:isTopLevelPstack:error:",  v17,  v11,  v12->_nodes,  1LL,  a6);

    if (!v18 || !-[DiskImageGraph loadImportedNodesWithError:](v12, "loadImportedNodesWithError:", a6)) {
      goto LABEL_10;
    }
    v19 = -[DiskImageGraph nodes](v12, "nodes");
    v20 = -[NSMutableDictionary objectForKeyedSubscript:](v12->_pstackDB, "objectForKeyedSubscript:", @"ActiveNode");
    uint64_t v21 = [v19 objectForKey:v20];
    activeNode = v12->_activeNode;
    v12->_activeNode = (DiskImageGraphNode *)v21;

    if (!v21)
    {
      +[DIError nilWithPOSIXCode:description:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:description:error:",  22LL,  @"Bad pstack format, node with active UUID not found.",  a6);
      v23 = (DiskImageGraph *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }

    if (!+[DiskImageGraph createNodesConnectivityWithNodesDict:error:]( &OBJC_CLASS___DiskImageGraph,  "createNodesConnectivityWithNodesDict:error:",  v12->_nodes,  a6)
      || !-[DiskImageGraph checkStackValidityWithError:](v12, "checkStackValidityWithError:", a6))
    {
LABEL_10:
      v24 = 0LL;
      goto LABEL_11;
    }
  }

  v23 = v12;
LABEL_9:
  v24 = v23;
LABEL_11:

  return v24;
}

- (BOOL)loadImportedNodesWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKeyedSubscript:@"ImportPstack"];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6) {
    goto LABEL_9;
  }
  if (!-[DiskImageGraph imported](self, "imported"))
  {
    if ((unint64_t)[v6 count] >= 2)
    {
      v7 = @"Multiple imports are not allowed.";
      goto LABEL_6;
    }

    v8 = (void *)MEMORY[0x189604030];
    [v6 firstObject];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiskImageGraph pstackURL](self, "pstackURL");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 URLByDeletingLastPathComponent];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 fileURLWithPath:v9 relativeToURL:v11];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();

    a3 = -[DiskImageGraph initWithPstackURL:imported:error:]( objc_alloc(&OBJC_CLASS___DiskImageGraph),  "initWithPstackURL:imported:error:",  v12,  1LL,  a3);
    if (!a3)
    {

      goto LABEL_10;
    }

    -[DiskImageGraph nodes](self, "nodes");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [a3 nodes];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 addEntriesFromDictionary:v14];

LABEL_9:
    LOBYTE(a3) = 1;
    goto LABEL_10;
  }

  v7 = @"nested imports are not allowed.";
LABEL_6:
  LOBYTE(a3) = +[DIError failWithPOSIXCode:description:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:description:error:",  22LL,  v7,  a3);
LABEL_10:

  return (char)a3;
}

- (DiskImageGraph)initWithPstackURL:(id)a3 error:(id *)a4
{
  return -[DiskImageGraph initWithPstackURL:imported:error:](self, "initWithPstackURL:imported:error:", a3, 0LL, a4);
}

- (DiskImageGraph)initWithPstackURL:(id)a3 imported:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v13 = 0LL;
  BOOL v9 = +[DiskImageGraph loadPlistDictFromURL:dict:error:]( &OBJC_CLASS___DiskImageGraph,  "loadPlistDictFromURL:dict:error:",  v8,  &v13,  a5);
  id v10 = v13;
  if (v9)
  {
    self =  -[DiskImageGraph initWithData:pstackURL:imported:error:]( self,  "initWithData:pstackURL:imported:error:",  v10,  v8,  v6,  a5);
    id v11 = self;
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

+ (BOOL)copyDictNodesToFolder:(id)a3 dict:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v29 = 0LL;
  int v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  id v34 = 0LL;
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  objc_super v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x1896078A8] defaultManager];
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = MEMORY[0x1895F87A8];
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __51__DiskImageGraph_copyDictNodesToFolder_dict_error___block_invoke;
  v18[3] = &unk_18A1CA1F8;
  uint64_t v21 = &v29;
  id v11 = v7;
  id v19 = v11;
  id v12 = v9;
  id v20 = v12;
  uint64_t v22 = &v23;
  [v8 enumerateKeysAndObjectsUsingBlock:v18];
  uint64_t v13 = v30[5];
  if (v13)
  {
    id v14 = (void *)v24[5];
    v16[0] = v10;
    v16[1] = 3221225472LL;
    v16[2] = __51__DiskImageGraph_copyDictNodesToFolder_dict_error___block_invoke_2;
    v16[3] = &unk_18A1CA220;
    id v17 = v12;
    [v14 enumerateObjectsUsingBlock:v16];
    if (a5) {
      *a5 = (id) v30[5];
    }
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v13 == 0;
}

void __51__DiskImageGraph_copyDictNodesToFolder_dict_error___block_invoke( void *a1,  uint64_t a2,  void *a3,  _BYTE *a4)
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v7 = v6;
    id v8 = (void *)a1[4];
    [v7 filePath];
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 lastPathComponent];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 URLByAppendingPathComponent:v10];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();

    id v12 = (void *)a1[5];
    [v7 filePath];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = *(void *)(a1[6] + 8LL);
    id obj = *(id *)(v14 + 40);
    LOBYTE(v12) = [v12 copyItemAtURL:v13 toURL:v11 error:&obj];
    objc_storeStrong((id *)(v14 + 40), obj);

    else {
      *a4 = 1;
    }
  }

  else
  {
    *a4 = 1;
    uint64_t v15 = *(void *)(a1[6] + 8LL);
    id v18 = *(id *)(v15 + 40);
    +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  45LL,  @"Clone of plugin nodes is not supported.",  &v18);
    id v16 = v18;
    id v7 = *(id *)(v15 + 40);
    *(void *)(v15 + 40) = v16;
  }
}

uint64_t __51__DiskImageGraph_copyDictNodesToFolder_dict_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeItemAtURL:a2 error:0];
}

- (BOOL)cloneToURL:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  -[DiskImageGraph pstackURL](self, "pstackURL");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 lastPathComponent];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 URLByAppendingPathComponent:v8];
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v10 = (void *)MEMORY[0x189603FC8];
  -[DiskImageGraph pstackDB](self, "pstackDB");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 dictionaryWithDictionary:v11];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[DiskImageGraph pstackDB](self, "pstackDB");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 objectForKeyedSubscript:@"Images"];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v14, "count"));
  int v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:");
  -[DiskImageGraph pstackDB](self, "pstackDB");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 objectForKeyedSubscript:@"ImportPstack"];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    id v17 = @"Cannot clone a pstack with an import.";
LABEL_16:
    uint64_t v31 = 22LL;
LABEL_17:
    BOOL v30 = +[DIError failWithPOSIXCode:description:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:description:error:",  v31,  v17,  a4);
    goto LABEL_18;
  }

  if (([v6 isFileURL] & 1) == 0)
  {
    id v17 = @"Destination folder URL must be of 'file' scheme.";
    goto LABEL_16;
  }

  if (![v6 hasDirectoryPath]
    || ([v6 checkResourceIsReachableAndReturnError:0] & 1) == 0)
  {
    id v17 = @"Destination folder URL must represent an existing folder.";
    uint64_t v31 = 20LL;
    goto LABEL_17;
  }

  v33 = v14;
  id v34 = v12;
  uint64_t v35 = a4;
  objc_super v36 = v9;
  id v37 = v6;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v18 = v14;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v40;
    do
    {
      for (uint64_t i = 0LL; i != v20; ++i)
      {
        if (*(void *)v40 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        v24 = (void *)[v23 mutableCopy];
        [v23 objectForKeyedSubscript:@"FilePath"];
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
        [v25 componentsSeparatedByString:@"/"];
        objc_super v26 = (void *)objc_claimAutoreleasedReturnValue();
        [v26 lastObject];
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        [v24 setObject:v27 forKeyedSubscript:@"FilePath"];

        [v38 addObject:v24];
      }

      uint64_t v20 = [v18 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }

    while (v20);
  }

  -[DiskImageGraph nodes](self, "nodes");
  id v28 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v37;
  BOOL v29 = +[DiskImageGraph copyDictNodesToFolder:dict:error:]( &OBJC_CLASS___DiskImageGraph,  "copyDictNodesToFolder:dict:error:",  v37,  v28,  v35);

  if (v29)
  {
    id v12 = v34;
    BOOL v9 = v36;
    BOOL v30 = +[DiskImageGraph saveToPlistWithDictionary:URL:error:]( &OBJC_CLASS___DiskImageGraph,  "saveToPlistWithDictionary:URL:error:",  v34,  v36,  v35);
  }

  else
  {
    BOOL v30 = 0;
    BOOL v9 = v36;
    id v12 = v34;
  }

  uint64_t v14 = v33;
LABEL_18:

  return v30;
}

- (void)setActiveNode:(id)a3
{
  id v5 = a3;
  [v5 UUID];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 UUIDString];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_pstackDB,  "setObject:forKeyedSubscript:",  v6,  @"ActiveNode");
}

+ (BOOL)populateNodesDictsWithArray:(id)a3 pstackURL:(id)a4 nodesDict:(id)a5 isTopLevelPstack:(BOOL)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  objc_super v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  id v28 = 0LL;
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __89__DiskImageGraph_populateNodesDictsWithArray_pstackURL_nodesDict_isTopLevelPstack_error___block_invoke;
  v18[3] = &unk_18A1CA248;
  BOOL v22 = a6;
  id v14 = v12;
  id v19 = v14;
  uint64_t v21 = &v23;
  id v15 = v13;
  id v20 = v15;
  [v11 enumerateObjectsUsingBlock:v18];
  id v16 = (void *)v24[5];
  if (a7 && v16) {
    *a7 = v16;
  }

  _Block_object_dispose(&v23, 8);
  return v16 == 0LL;
}

void __89__DiskImageGraph_populateNodesDictsWithArray_pstackURL_nodesDict_isTopLevelPstack_error___block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  uint64_t v6 = *(unsigned __int8 *)(a1 + 56);
  id v7 = *(void **)(a1 + 32);
  id v8 = a2;
  [v7 URLByDeletingLastPathComponent];
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id obj = *(id *)(v10 + 40);
  +[DiskImageGraphNode GraphNodeWithDictionary:updateChangesToDict:workDir:error:]( &OBJC_CLASS___DiskImageGraphNode,  "GraphNodeWithDictionary:updateChangesToDict:workDir:error:",  v8,  v6,  v9,  &obj);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)(v10 + 40), obj);
  if (v11)
  {
    id v12 = *(void **)(a1 + 40);
    [v11 UUID];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 UUIDString];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 setObject:v11 forKey:v14];
  }

  else
  {
    *a4 = 1;
  }
}

+ (BOOL)createNodesConnectivityWithNodesDict:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = 0LL;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __61__DiskImageGraph_createNodesConnectivityWithNodesDict_error___block_invoke;
  v9[3] = &unk_18A1CA270;
  id v6 = v5;
  id v10 = v6;
  id v11 = &v12;
  [v6 enumerateKeysAndObjectsUsingBlock:v9];
  id v7 = (void *)v13[5];
  if (a4 && v7) {
    *a4 = v7;
  }

  _Block_object_dispose(&v12, 8);
  return v7 == 0LL;
}

void __61__DiskImageGraph_createNodesConnectivityWithNodesDict_error___block_invoke( uint64_t a1,  uint64_t a2,  void *a3,  _BYTE *a4)
{
  id v15 = a3;
  [v15 parentUUID];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    id v7 = *(void **)(a1 + 32);
    [v15 parentUUID];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 UUIDString];
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 objectForKey:v9];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      [v15 setParent:v10];
      [v15 parent];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 children];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 addObject:v15];
    }

    else
    {
      *a4 = 1;
      uint64_t v13 = +[DIError errorWithPOSIXCode:verboseInfo:]( &OBJC_CLASS___DIError,  "errorWithPOSIXCode:verboseInfo:",  22LL,  @"Missing parent node in graph.");
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8LL);
      id v11 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
  }
}

- (BOOL)checkStackValidityWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v6 = -1LL;
  while (v5)
  {
    [v5 parent];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[DiskImageGraph nodes](self, "nodes");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v9 = [v8 count];

    ++v6;
    id v5 = v7;
    if (v9 <= v6)
    {
      BOOL v10 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  @"Invalid pstack, Active stack contains a loop.",  a3);

      return v10;
    }
  }

  return 1;
}

- (BOOL)savePstackWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DiskImageGraph pstackURL](self, "pstackURL");
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = +[DiskImageGraph saveToPlistWithDictionary:URL:error:]( &OBJC_CLASS___DiskImageGraph,  "saveToPlistWithDictionary:URL:error:",  v5,  v6,  a3);

  return (char)a3;
}

+ (BOOL)saveToPlistWithDictionary:(id)a3 URL:(id)a4 error:(id *)a5
{
  id v7 = a4;
  [MEMORY[0x1896079E8] dataWithPropertyList:a3 format:100 options:0 error:a5];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v9 = v8;
  if (v8) {
    char v10 = [v8 writeToURL:v7 options:1 error:a5];
  }
  else {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)setActiveNodeWithUUID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[DiskImageGraph nodes](self, "nodes");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 UUIDString];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  [v7 objectForKeyedSubscript:v8];
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[DiskImageGraph setActiveNode:](self, "setActiveNode:", v9);
    BOOL v10 = 1;
  }

  else
  {
    BOOL v10 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  @"Cannot find image with provided UUID.",  a4);
  }

  return v10;
}

- (id)getImageWithTag:(id)a3 error:(id *)a4
{
  v16[0] = 0LL;
  v16[1] = v16;
  v16[2] = 0x3032000000LL;
  v16[3] = __Block_byref_object_copy_;
  void v16[4] = __Block_byref_object_dispose_;
  id v6 = a3;
  id v17 = v6;
  -[DiskImageGraph nodes](self, "nodes");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __40__DiskImageGraph_getImageWithTag_error___block_invoke;
  v15[3] = &unk_18A1CA298;
  v15[4] = v16;
  [v7 keysOfEntriesPassingTest:v15];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (![v8 count])
  {
    uint64_t v12 = @"Cannot find image with provided tag.";
    uint64_t v13 = 2LL;
LABEL_6:
    +[DIError nilWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:verboseInfo:error:",  v13,  v12,  a4);
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }

  if ([v8 count] != 1)
  {
    uint64_t v12 = @"More than one image in the stack has the provided tag, please specify UUID instead.";
    uint64_t v13 = 22LL;
    goto LABEL_6;
  }

  -[DiskImageGraph nodes](self, "nodes");
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 anyObject];
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 objectForKey:v10];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  _Block_object_dispose(v16, 8);

  return v11;
}

uint64_t __40__DiskImageGraph_getImageWithTag_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];

  return v5;
}

- (id)getImageWithUUID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[DiskImageGraph nodes](self, "nodes");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 UUIDString];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  [v7 objectForKeyedSubscript:v8];
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    id v10 = v9;
  }

  else
  {
    +[DIError nilWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:verboseInfo:error:",  2LL,  @"Cannot find image with provided uuid.",  a4);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  id v11 = v10;

  return v11;
}

- (BOOL)setActiveNodeWithTag:(id)a3 error:(id *)a4
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5) {
    -[DiskImageGraph setActiveNode:](self, "setActiveNode:", v5);
  }

  return v5 != 0LL;
}

- (BOOL)removeNodeWithUUID:(id)a3 recursive:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  -[DiskImageGraph nodes](self, "nodes");
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 UUIDString];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  [v9 objectForKeyedSubscript:v10];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11) {
    BOOL v12 = -[DiskImageGraph removeWithNode:recursive:error:](self, "removeWithNode:recursive:error:", v11, v6, a5);
  }
  else {
    BOOL v12 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  @"Cannot find image with provided UUID.",  a5);
  }
  BOOL v13 = v12;

  return v13;
}

- (BOOL)removeNodeWithTag:(id)a3 recursive:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  -[DiskImageGraph getImageWithTag:error:](self, "getImageWithTag:error:", a3, a5);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8) {
    BOOL v9 = -[DiskImageGraph removeWithNode:recursive:error:](self, "removeWithNode:recursive:error:", v8, v6, a5);
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)removeWithNode:(id)a3 recursive:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  [v8 parent];
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    [v8 getDescendants];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (![v10 count] || v6)
    {
      uint64_t v14 = -[DiskImageGraph activeNode](self, "activeNode");
      if ((id)v14 == v8)
      {
      }

      else
      {
        id v15 = (void *)v14;
        -[DiskImageGraph activeNode](self, "activeNode");
        id v16 = (void *)objc_claimAutoreleasedReturnValue();
        int v17 = [v10 containsObject:v16];

        if (!v17)
        {
          __int128 v31 = 0u;
          __int128 v32 = 0u;
          __int128 v29 = 0u;
          __int128 v30 = 0u;
          objc_msgSend(v8, "children", 0);
          id v18 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v30;
            do
            {
              for (uint64_t i = 0LL; i != v20; ++i)
              {
                if (*(void *)v30 != v21) {
                  objc_enumerationMutation(v18);
                }
                -[DiskImageGraph removeWithNode:recursive:error:]( self,  "removeWithNode:recursive:error:",  *(void *)(*((void *)&v29 + 1) + 8 * i),  v6,  0LL);
              }

              uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
            }

            while (v20);
          }

          [v8 deleteImage];
          -[DiskImageGraph imagesDictsArray](self, "imagesDictsArray");
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
          [v8 pstackDict];
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          [v23 removeObject:v24];

          -[DiskImageGraph nodes](self, "nodes");
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
          [v8 UUID];
          objc_super v26 = (void *)objc_claimAutoreleasedReturnValue();
          [v26 UUIDString];
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          [v25 removeObjectForKey:v27];

          BOOL v13 = 1;
          goto LABEL_19;
        }
      }

      id v11 = @"The requested operation will delete the active node, please set another one first.";
      uint64_t v12 = 22LL;
    }

    else
    {
      id v11 = @"The requested operation will delete all children of the provided node. use recursive removal to surpress this error.";
      uint64_t v12 = 1LL;
    }

    BOOL v13 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  v12,  v11,  a5);
LABEL_19:

    goto LABEL_20;
  }

  BOOL v13 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  @"Cannot delete base image node.",  a5);
LABEL_20:

  return v13;
}

+ (id)getRelativeIfContainedWithChildURL:(id)a3 parentURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isFileURL])
  {
    [v5 URLByStandardizingPath];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 path];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();

    [v6 URLByStandardizingPath];
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 path];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();

    if ([v8 hasPrefix:v10])
    {
      id v11 = (void *)MEMORY[0x189604030];
      objc_msgSend(v8, "substringFromIndex:", objc_msgSend(v10, "length") + 1);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 fileURLWithPath:v12 relativeToURL:v6];
      id v13 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      [v5 absoluteURL];
      id v13 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    id v13 = v5;
  }

  return v13;
}

- (id)baseNode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 parent];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    do
    {
      [v2 parent];
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      [v4 parent];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();

      v2 = v4;
    }

    while (v5);
  }

  else
  {
    v4 = v2;
  }

  return v4;
}

- (NSURL)pstackURL
{
  return self->_pstackURL;
}

- (void)setPstackURL:(id)a3
{
}

- (NSMutableDictionary)pstackDB
{
  return self->_pstackDB;
}

- (void)setPstackDB:(id)a3
{
}

- (void)setImagesDictsArray:(id)a3
{
}

- (NSMutableDictionary)nodes
{
  return self->_nodes;
}

- (void)setNodes:(id)a3
{
}

- (DiskImageGraphNode)activeNode
{
  return self->_activeNode;
}

- (BOOL)imported
{
  return self->_imported;
}

- (void)setImported:(BOOL)a3
{
  self->_imported = a3;
}

- (void).cxx_destruct
{
}

- (id)infoWithExtra:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  -[DiskImageGraph baseNode](self, "baseNode");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 recursiveInfoWithExtra:v5 error:a4];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)activeInfoWithExtra:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  id v7 = (void *)objc_opt_new();
  uint64_t v8 = -[DiskImageGraph activeNode](self, "activeNode");
  if (v8)
  {
    BOOL v9 = (void *)v8;
    while (1)
    {
      uint64_t v10 = [v9 infoWithExtra:v5 error:a4];
      if (!v10) {
        break;
      }
      id v11 = (void *)v10;
      [v7 addObject:v10];
      uint64_t v12 = [v9 parent];

      BOOL v9 = (void *)v12;
      if (!v12) {
        goto LABEL_5;
      }
    }

    id v13 = 0LL;
  }

  else
  {
LABEL_5:
    [v7 reverseObjectEnumerator];
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 allObjects];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

+ (id)getImageInfoDictWithURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = -[DIImageInfoParams initWithURL:error:]( objc_alloc(&OBJC_CLASS___DIImageInfoParams),  "initWithURL:error:",  v5,  a4);

  if (v6 && -[DIImageInfoParams retrieveWithError:](v6, "retrieveWithError:", a4))
  {
    -[DIImageInfoParams imageInfo](v6, "imageInfo");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

+ (id)getImageUUIDStrWithIdentityInfo:(id)a3 stackableUUIDFallback:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  [v7 objectForKey:@"Stable UUID"];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (v6 && ([v7 objectForKey:@"UUID"], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v8 = (void *)v9;
      int v10 = *__error();
      if (DIForwardLogs())
      {
        getDIOSLog();
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        *(_DWORD *)buf = 68157954;
        int v16 = 91;
        __int16 v17 = 2080;
        id v18 = "+[DiskImageGraph(InfoPrivate) getImageUUIDStrWithIdentityInfo:stackableUUIDFallback:error:]";
        uint64_t v12 = (char *)_os_log_send_and_compose_impl();

        if (v12)
        {
          fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v12);
          free(v12);
        }
      }

      else
      {
        getDIOSLog();
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68157954;
          int v16 = 91;
          __int16 v17 = 2080;
          id v18 = "+[DiskImageGraph(InfoPrivate) getImageUUIDStrWithIdentityInfo:stackableUUIDFallback:error:]";
          _os_log_impl( &dword_188046000,  v13,  OS_LOG_TYPE_DEFAULT,  "%.*s: Stable UUID not found in provided image, Falling back to using Stackable UUID.",  buf,  0x12u);
        }
      }

      *__error() = v10;
    }

    else
    {
      +[DIError nilWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:verboseInfo:error:",  22LL,  @"Provided image has no UUID info.",  a5);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v8;
}

+ (id)getImageUUIDWithURL:(id)a3 allowMissingUUID:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  uint64_t v8 = (void *)objc_opt_new();
  +[DiskImageGraph getImageInfoDictWithURL:error:]( &OBJC_CLASS___DiskImageGraph,  "getImageInfoDictWithURL:error:",  v7,  a5);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    [v9 objectForKeyedSubscript:@"Image Format"];
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    char v11 = [v10 isEqualToString:@"RAW"];

    if ((v11 & 1) != 0)
    {
      if (v6)
      {
        int v12 = *__error();
        if (DIForwardLogs())
        {
          getDIOSLog();
          id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
          *(_DWORD *)buf = 68157954;
          int v23 = 74;
          __int16 v24 = 2080;
          uint64_t v25 = "+[DiskImageGraph(InfoPrivate) getImageUUIDWithURL:allowMissingUUID:error:]";
          uint64_t v14 = (char *)_os_log_send_and_compose_impl();

          if (v14)
          {
            fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v14);
            free(v14);
          }
        }

        else
        {
          getDIOSLog();
          uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 68157954;
            int v23 = 74;
            __int16 v24 = 2080;
            uint64_t v25 = "+[DiskImageGraph(InfoPrivate) getImageUUIDWithURL:allowMissingUUID:error:]";
            _os_log_impl( &dword_188046000,  v20,  OS_LOG_TYPE_DEFAULT,  "%.*s: Base image is raw format, using nil UUID.",  buf,  0x12u);
          }
        }

        *__error() = v12;
        uint64_t v19 = [objc_alloc(MEMORY[0x189607AB8]) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
      }

      else
      {
        uint64_t v19 = +[DIError nilWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:verboseInfo:error:",  22LL,  @"Provided image has no UUID info.",  a5);
      }

      int v16 = (void *)v19;
      goto LABEL_20;
    }

    uint64_t v17 = [v9 objectForKey:@"Identity Info"];

    if (!v17)
    {
      +[DIError nilWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:verboseInfo:error:",  22LL,  @"Provided image has no identity info.",  a5);
      int v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = 0LL;
LABEL_20:
      id v15 = 0LL;
      goto LABEL_23;
    }

    +[DiskImageGraph getImageUUIDStrWithIdentityInfo:stackableUUIDFallback:error:]( &OBJC_CLASS___DiskImageGraph,  "getImageUUIDStrWithIdentityInfo:stackableUUIDFallback:error:",  v17,  v6,  a5);
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      uint64_t v18 = [objc_alloc(MEMORY[0x189607AB8]) initWithUUIDString:v15];
      if (!v18)
      {
        uint64_t v18 = +[DIError nilWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:verboseInfo:error:",  22LL,  @"Error in new image's UUID.",  a5);
      }

      int v16 = (void *)v18;
    }

    else
    {
      int v16 = 0LL;
    }

    uint64_t v8 = (void *)v17;
  }

  else
  {
    id v15 = 0LL;
    int v16 = 0LL;
  }

- (BOOL)appendWithURL:(id)a3 tag:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  -[DiskImageGraph activeNode](self, "activeNode");
  int v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[DiskImageGraph appendWithURL:isCache:tag:numBlocks:toNode:setNewActive:error:]( self,  "appendWithURL:isCache:tag:numBlocks:toNode:setNewActive:error:",  v9,  0LL,  v8,  0LL,  v10,  0LL,  a5);

  return (char)a5;
}

- (BOOL)appendCacheWithURL:(id)a3 tag:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  -[DiskImageGraph activeNode](self, "activeNode");
  int v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[DiskImageGraph appendWithURL:isCache:tag:numBlocks:toNode:setNewActive:error:]( self,  "appendWithURL:isCache:tag:numBlocks:toNode:setNewActive:error:",  v9,  1LL,  v8,  0LL,  v10,  0LL,  a5);

  return (char)a5;
}

- (BOOL)appendWithURL:(id)a3 tag:(id)a4 numBlocks:(unint64_t)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a3;
  -[DiskImageGraph activeNode](self, "activeNode");
  int v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = -[DiskImageGraph appendWithURL:isCache:tag:numBlocks:toNode:setNewActive:error:]( self,  "appendWithURL:isCache:tag:numBlocks:toNode:setNewActive:error:",  v11,  0LL,  v10,  a5,  v12,  0LL,  a6);

  return (char)a6;
}

+ (id)getFirstNonCacheAncestorWithNode:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([v5 isCache])
  {
    do
    {
      [v5 parent];
      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();

      id v5 = v6;
    }

    while (([v6 isCache] & 1) != 0);
    if (v6) {
      goto LABEL_4;
    }
LABEL_6:
    +[DIError nilWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:verboseInfo:error:",  22LL,  @"Pstack corrupted, found a cache node without a non-cache ancestor.",  a4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }

  BOOL v6 = v5;
  if (!v5) {
    goto LABEL_6;
  }
LABEL_4:
  id v7 = v6;
LABEL_7:
  id v8 = v7;

  return v8;
}

- (BOOL)validateAppendedImageWithURL:(id)a3 parentNode:(id)a4 isCache:(BOOL)a5 error:(id *)a6
{
  int v7 = a5;
  id v10 = a4;
  +[DiskImageGraph getImageInfoDictWithURL:error:]( &OBJC_CLASS___DiskImageGraph,  "getImageInfoDictWithURL:error:",  a3,  a6);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && [v10 validateAppendedImageWithInfo:v11 error:a6])
  {
    [v11 objectForKeyedSubscript:@"Image Format"];
    int v12 = (void *)objc_claimAutoreleasedReturnValue();
    int v13 = [v12 isEqualToString:@"ASIF"];

    if (v13)
    {
      [v11 objectForKeyedSubscript:@"ASIF Info"];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 objectForKeyedSubscript:@"Is Cache"];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      int v16 = [v15 BOOLValue];

      if (v16 == v7)
      {
        -[DiskImageGraph nodes](self, "nodes");
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 objectForKeyedSubscript:@"Identity Info"];
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        [v20 objectForKeyedSubscript:@"Stable UUID"];
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
        [v19 objectForKeyedSubscript:v21];
        BOOL v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
        {
          BOOL v18 = 1;
          goto LABEL_11;
        }

        uint64_t v17 = @"Stack already contains an image with the same stable UUID.";
      }

      else
      {
        uint64_t v17 = @"Image cache flag does not match the requested operation.";
      }
    }

    else
    {
      uint64_t v17 = @"Can only append ASIF formatted images to pstack.";
    }

    BOOL v18 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  v17,  a6);
  }

  else
  {
    BOOL v18 = 0;
  }

- (DiskImageGraph)initWithBaseImageURL:(id)a3 newPstackURL:(id)a4 tag:(id)a5 error:(id *)a6
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___DiskImageGraph;
  int v13 = -[DiskImageGraph init](&v32, sel_init);
  uint64_t v14 = v13;
  if (!v13) {
    goto LABEL_4;
  }
  -[DiskImageGraph setPstackURL:](v13, "setPstackURL:", v11);
  uint64_t v15 = +[DiskImageGraph getImageUUIDWithURL:allowMissingUUID:error:]( &OBJC_CLASS___DiskImageGraph,  "getImageUUIDWithURL:allowMissingUUID:error:",  v10,  1LL,  a6);
  if (v15)
  {
    int v16 = (void *)v15;
    -[DiskImageGraph pstackURL](v14, "pstackURL");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 URLByDeletingLastPathComponent];
    BOOL v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = +[DiskImageGraph getRelativeIfContainedWithChildURL:parentURL:]( &OBJC_CLASS___DiskImageGraph,  "getRelativeIfContainedWithChildURL:parentURL:",  v10,  v18);

    uint64_t v20 = -[DiskImageGraphNodeNative initWithURL:tag:UUID:parentNode:metadata:isCache:]( objc_alloc(&OBJC_CLASS___DiskImageGraphNodeNative),  "initWithURL:tag:UUID:parentNode:metadata:isCache:",  v19,  v12,  v16,  0LL,  0LL,  0LL);
    -[DiskImageGraph setActiveNode:](v14, "setActiveNode:", v20);
    +[DiskImageGraph createPstackDictWithNode:](&OBJC_CLASS___DiskImageGraph, "createPstackDictWithNode:", v20);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiskImageGraph setPstackDB:](v14, "setPstackDB:", v21);

    id v22 = objc_alloc_init(MEMORY[0x189603FC8]);
    -[DiskImageGraph setNodes:](v14, "setNodes:", v22);

    -[DiskImageGraph nodes](v14, "nodes");
    int v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiskImageGraphNode UUID](v20, "UUID");
    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 UUIDString];
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 setObject:v20 forKeyedSubscript:v25];

    id v10 = (id)v19;
LABEL_4:
    uint64_t v26 = v14;
    goto LABEL_12;
  }

  int v27 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    *(_DWORD *)buf = 68157954;
    int v34 = 70;
    __int16 v35 = 2080;
    objc_super v36 = "-[DiskImageGraph(Append) initWithBaseImageURL:newPstackURL:tag:error:]";
    __int128 v29 = (char *)_os_log_send_and_compose_impl();

    if (v29)
    {
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v29);
      free(v29);
    }
  }

  else
  {
    getDIOSLog();
    __int128 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68157954;
      int v34 = 70;
      __int16 v35 = 2080;
      objc_super v36 = "-[DiskImageGraph(Append) initWithBaseImageURL:newPstackURL:tag:error:]";
      _os_log_impl( &dword_188046000,  v30,  OS_LOG_TYPE_ERROR,  "%.*s: Failed to get UUID info of provided image.",  buf,  0x12u);
    }
  }

  uint64_t v26 = 0LL;
  *__error() = v27;
LABEL_12:

  return v26;
}

- (BOOL)appendWithURL:(id)a3 isCache:(BOOL)a4 tag:(id)a5 numBlocks:(unint64_t)a6 setNewActive:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  BOOL v11 = a4;
  id v14 = a5;
  id v15 = a3;
  -[DiskImageGraph activeNode](self, "activeNode");
  int v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a8) = -[DiskImageGraph appendWithURL:isCache:tag:numBlocks:toNode:setNewActive:error:]( self,  "appendWithURL:isCache:tag:numBlocks:toNode:setNewActive:error:",  v15,  v11,  v14,  a6,  v16,  v9,  a8);

  return (char)a8;
}

- (BOOL)appendWithURL:(id)a3 isCache:(BOOL)a4 tag:(id)a5 numBlocks:(unint64_t)a6 toNode:(id)a7 setNewActive:(BOOL)a8 error:(id *)a9
{
  BOOL v9 = a8;
  BOOL v13 = a4;
  uint64_t v59 = *MEMORY[0x1895F89C0];
  id v15 = a3;
  id v16 = a5;
  id v17 = a7;
  char v18 = [v15 checkResourceIsReachableAndReturnError:0];
  uint64_t v19 = +[DiskImageGraph getFirstNonCacheAncestorWithNode:error:]( &OBJC_CLASS___DiskImageGraph,  "getFirstNonCacheAncestorWithNode:error:",  v17,  a9);
  uint64_t v20 = (void *)v19;
  if (!v19)
  {
    BOOL v24 = 0;
    goto LABEL_7;
  }

  char v21 = v18 ^ 1;
  if (!a6) {
    char v21 = 1;
  }
  if ((v21 & 1) != 0)
  {
    BOOL v52 = v9;
    id v53 = v17;
    v54 = (void *)v19;
    if ((v18 & 1) != 0)
    {
      if (!-[DiskImageGraph validateAppendedImageWithURL:parentNode:isCache:error:]( self,  "validateAppendedImageWithURL:parentNode:isCache:error:",  v15,  v19,  v13,  a9)) {
        goto LABEL_21;
      }
LABEL_13:
      id v51 = v16;
      -[DiskImageGraph pstackURL](self, "pstackURL");
      __int128 v29 = (void *)objc_claimAutoreleasedReturnValue();
      [v29 URLByDeletingLastPathComponent];
      __int128 v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[DiskImageGraph getRelativeIfContainedWithChildURL:parentURL:]( &OBJC_CLASS___DiskImageGraph,  "getRelativeIfContainedWithChildURL:parentURL:",  v15,  v30);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();

      +[DiskImageGraph getImageUUIDWithURL:allowMissingUUID:error:]( &OBJC_CLASS___DiskImageGraph,  "getImageUUIDWithURL:allowMissingUUID:error:",  v25,  0LL,  a9);
      __int128 v31 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v24 = v31 != 0LL;
      if (v31)
      {
        objc_super v32 = -[DiskImageGraphNodeNative initWithURL:tag:UUID:parentNode:metadata:isCache:]( objc_alloc(&OBJC_CLASS___DiskImageGraphNodeNative),  "initWithURL:tag:UUID:parentNode:metadata:isCache:",  v25,  v51,  v31,  v53,  0LL,  v13);
        v33 = -[DiskImageGraph nodes](self, "nodes");
        -[DiskImageGraphNode UUID](v32, "UUID");
        int v34 = (void *)objc_claimAutoreleasedReturnValue();
        [v34 UUIDString];
        __int16 v35 = (void *)objc_claimAutoreleasedReturnValue();
        [v33 setObject:v32 forKey:v35];

        -[DiskImageGraph imagesDictsArray](self, "imagesDictsArray");
        objc_super v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[DiskImageGraphNodeNative toDictionary](v32, "toDictionary");
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
        [v36 addObject:v37];

        -[DiskImageGraph nodes](self, "nodes");
        int v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[DiskImageGraphNode parentUUID](v32, "parentUUID");
        __int128 v39 = (void *)objc_claimAutoreleasedReturnValue();
        [v39 UUIDString];
        __int128 v40 = (void *)objc_claimAutoreleasedReturnValue();
        [v38 objectForKey:v40];
        __int128 v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[DiskImageGraphNode setParent:](v32, "setParent:", v41);

        -[DiskImageGraph imagesDictsArray](self, "imagesDictsArray");
        __int128 v42 = (void *)objc_claimAutoreleasedReturnValue();
        [v42 lastObject];
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[DiskImageGraphNode setPstackDict:](v32, "setPstackDict:", v43);

        if (v52) {
          -[DiskImageGraph setActiveNode:](self, "setActiveNode:", v32);
        }

        id v16 = v51;
        id v17 = v53;
      }

      else
      {
        int v44 = *__error();
        if (DIForwardLogs())
        {
          getDIOSLog();
          v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
          *(_DWORD *)buf = 68157954;
          int v56 = 95;
          __int16 v57 = 2080;
          v58 = "-[DiskImageGraph(AppendPrivate) appendWithURL:isCache:tag:numBlocks:toNode:setNewActive:error:]";
          v46 = (char *)_os_log_send_and_compose_impl();

          if (v46)
          {
            fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v46);
            free(v46);
          }
        }

        else
        {
          getDIOSLog();
          v48 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 68157954;
            int v56 = 95;
            __int16 v57 = 2080;
            v58 = "-[DiskImageGraph(AppendPrivate) appendWithURL:isCache:tag:numBlocks:toNode:setNewActive:error:]";
            _os_log_impl( &dword_188046000,  v48,  OS_LOG_TYPE_ERROR,  "%.*s: Failed to get info of newly created shadow/cache, will try to delete if an image was created.",  buf,  0x12u);
          }
        }

        id v17 = v53;
        *__error() = v44;
        id v16 = v51;
        if ((v18 & 1) == 0)
        {
          [MEMORY[0x1896078A8] defaultManager];
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          [v49 removeItemAtURL:v25 error:0];

          id v17 = v53;
        }
      }

      goto LABEL_28;
    }

    uint64_t v26 = objc_alloc(&OBJC_CLASS___DIStackParams);
    uint64_t v27 = [v17 URL];
    id v28 = -[DIStackParams initWithURL:error:](v26, "initWithURL:error:", v27, a9);

    LOBYTE(v27) = -[DIStackParams appendWithURL:isCache:numBlocks:error:]( v28,  "appendWithURL:isCache:numBlocks:error:",  v15,  v13,  a6,  a9);
    if ((v27 & 1) != 0)
    {
      if (-[DiskImageGraph validateAppendedImageWithURL:parentNode:isCache:error:]( self,  "validateAppendedImageWithURL:parentNode:isCache:error:",  v15,  v54,  v13,  a9))
      {
        goto LABEL_13;
      }

      [MEMORY[0x1896078A8] defaultManager];
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      [v47 removeItemAtURL:v15 error:0];
    }

@end
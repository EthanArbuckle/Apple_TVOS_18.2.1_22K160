@interface DiskImageGraph
+ (BOOL)copyDictNodesToFolder:(id)a3 dict:(id)a4 error:(id *)a5;
+ (BOOL)createNodesConnectivityWithNodesDict:(id)a3 error:(id *)a4;
+ (BOOL)failWithNoPstackError:(id *)a3;
+ (BOOL)loadPlistDictFromURL:(id)a3 dict:(id *)a4 error:(id *)a5;
+ (BOOL)populateNodesDictsWithArray:(id)a3 pstackURL:(id)a4 nodesDict:(id)a5 isTopLevelPstack:(BOOL)a6 error:(id *)a7;
+ (BOOL)saveToPlistWithDictionary:(id)a3 URL:(id)a4 error:(id *)a5;
+ (BOOL)validateWithDictionary:(id)a3 error:(id *)a4;
+ (id)createPstackDictWithNode:(id)a3;
+ (id)getRelativeIfContainedWithChildURL:(id)a3 parentURL:(id)a4;
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
- (DiskImageGraph)initWithData:(id)a3 pstackURL:(id)a4 imported:(BOOL)a5 error:(id *)a6;
- (DiskImageGraph)initWithPluginName:(id)a3 pluginParams:(id)a4 newPstackURL:(id)a5 tag:(id)a6 error:(id *)a7;
- (DiskImageGraph)initWithPstackURL:(id)a3 error:(id *)a4;
- (DiskImageGraph)initWithPstackURL:(id)a3 imported:(BOOL)a4 error:(id *)a5;
- (DiskImageGraphNode)activeNode;
- (NSMutableArray)imagesDictsArray;
- (NSMutableDictionary)nodes;
- (NSMutableDictionary)pstackDB;
- (NSURL)pstackURL;
- (id)baseNode;
- (id)getImageWithTag:(id)a3 error:(id *)a4;
- (id)getImageWithUUID:(id)a3 error:(id *)a4;
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
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForReadingFromURL:error:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForReadingFromURL:error:",  a3,  0LL));
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 readDataUpToLength:0x100000 error:a5]);
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v9,  2LL,  0LL,  a5));
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDictionary, v11);
      if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
      {
        *a4 = v10;
        BOOL v13 = 1;
      }

      else
      {
        BOOL v13 = +[DiskImageGraph failWithNoPstackError:](&OBJC_CLASS___DiskImageGraph, "failWithNoPstackError:", a5);
      }
    }

    else
    {
      BOOL v13 = 0;
    }
  }

  else
  {
    BOOL v13 = +[DiskImageGraph failWithNoPstackError:](&OBJC_CLASS___DiskImageGraph, "failWithNoPstackError:", a5);
  }

  return v13;
}

+ (BOOL)failWithNoPstackError:(id *)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v4 setObject:@"Not a pstack." forKeyedSubscript:@"DIErrorVerboseInfo"];
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.DiskImages2.ErrorDomain",  167LL,  v4));
  v6 = v5;
  if (a3) {
    *a3 = v5;
  }

  return 0;
}

+ (id)createPstackDictWithNode:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 toDictionary]);
  id v5 = [v4 mutableCopy];
  [v3 setPstackDict:v5];

  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 UUID]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 pstackDict]);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  @"1.0",  @"PstackVersion",  v7,  @"ActiveNode",  v9,  @"Images",  0LL));

  return v10;
}

- (DiskImageGraph)initWithPluginName:(id)a3 pluginParams:(id)a4 newPstackURL:(id)a5 tag:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___DiskImageGraph;
  v15 = -[DiskImageGraph init](&v41, "init");
  v16 = v15;
  if (!v15) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v15->_pstackURL, a5);
  uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  if (v17)
  {
    v18 = (void *)v17;
    LOBYTE(v38) = 0;
    v19 = -[PluginDiskImageGraphNode initWithPluginName:pluginParams:tag:UUID:parentNode:metadata:isCache:]( objc_alloc(&OBJC_CLASS___PluginDiskImageGraphNode),  "initWithPluginName:pluginParams:tag:UUID:parentNode:metadata:isCache:",  v11,  v12,  v14,  v17,  0LL,  0LL,  v38);
    activeNode = v16->_activeNode;
    v16->_activeNode = &v19->super;
    v21 = v19;

    uint64_t v22 = objc_claimAutoreleasedReturnValue(+[DiskImageGraph createPstackDictWithNode:](&OBJC_CLASS___DiskImageGraph, "createPstackDictWithNode:", v21));
    pstackDB = v16->_pstackDB;
    v16->_pstackDB = (NSMutableDictionary *)v22;

    v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    nodes = v16->_nodes;
    v16->_nodes = v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph nodes](v16, "nodes"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode UUID](v21, "UUID"));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 UUIDString]);
    [v26 setObject:v21 forKeyedSubscript:v28];

LABEL_4:
    v29 = v16;
    goto LABEL_15;
  }

  int v30 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v40 = 0LL;
    uint64_t v31 = sub_1000BE278();
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      uint64_t v33 = 3LL;
    }
    else {
      uint64_t v33 = 2LL;
    }
    *(_DWORD *)buf = 68157954;
    int v43 = 73;
    __int16 v44 = 2080;
    v45 = "-[DiskImageGraph initWithPluginName:pluginParams:newPstackURL:tag:error:]";
    LODWORD(v39) = 18;
    v34 = (char *)_os_log_send_and_compose_impl( v33,  &v40,  0LL,  0LL,  &_mh_execute_header,  v32,  16LL,  "%.*s: Failed to get UUID info of provided image.",  (int)buf,  v39);

    if (v34)
    {
      fprintf(__stderrp, "%s\n", v34);
      free(v34);
    }
  }

  else
  {
    uint64_t v35 = sub_1000BE278();
    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68157954;
      int v43 = 73;
      __int16 v44 = 2080;
      v45 = "-[DiskImageGraph initWithPluginName:pluginParams:newPstackURL:tag:error:]";
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "%.*s: Failed to get UUID info of provided image.",  buf,  0x12u);
    }
  }

  v29 = 0LL;
  *__error() = v30;
LABEL_15:

  return v29;
}

- (NSMutableArray)imagesDictsArray
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph pstackDB](self, "pstackDB"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"Images"]);

  return (NSMutableArray *)v3;
}

+ (BOOL)validateWithDictionary:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  a3));
  BOOL v8 = 0;
  if (objc_msgSend( v5,  "validateAndPopObjectForKey:className:isOptional:error:",  @"PstackVersion",  objc_opt_class(NSString, v6),  0,  a4))
  {
    if (objc_msgSend( v5,  "validateAndPopObjectForKey:className:isOptional:error:",  @"ImportPstack",  objc_opt_class(NSArray, v7),  1,  a4))
    {
      BOOL v8 = 0;
      if (objc_msgSend( v5,  "validateAndPopObjectForKey:className:isOptional:error:",  @"ActiveNode",  objc_opt_class(NSString, v9),  0,  a4))
      {
        BOOL v8 = 0;
        if (objc_msgSend( v5,  "validateAndPopObjectForKey:className:isOptional:error:",  @"Images",  objc_opt_class(NSArray, v10),  0,  a4))
        {
          if ([v5 count])
          {
            id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Validation failed, input contains unexpected data."));
            BOOL v8 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  v11,  a4);
          }

          else
          {
            BOOL v8 = 1;
          }
        }
      }
    }

    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (DiskImageGraph)initWithData:(id)a3 pstackURL:(id)a4 imported:(BOOL)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___DiskImageGraph;
  id v12 = -[DiskImageGraph init](&v26, "init");
  if (v12)
  {
    if (!+[DiskImageGraph validateWithDictionary:error:]( &OBJC_CLASS___DiskImageGraph,  "validateWithDictionary:error:",  v10,  a6)) {
      goto LABEL_10;
    }
    v12->_imported = a5;
    objc_storeStrong((id *)&v12->_pstackURL, a4);
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v10));
    pstackDB = v12->_pstackDB;
    v12->_pstackDB = (NSMutableDictionary *)v13;

    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    nodes = v12->_nodes;
    v12->_nodes = v15;

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v12->_pstackDB,  "objectForKeyedSubscript:",  @"Images"));
    unsigned int v18 = +[DiskImageGraph populateNodesDictsWithArray:pstackURL:nodesDict:isTopLevelPstack:error:]( &OBJC_CLASS___DiskImageGraph,  "populateNodesDictsWithArray:pstackURL:nodesDict:isTopLevelPstack:error:",  v17,  v11,  v12->_nodes,  1LL,  a6);

    if (!v18 || !-[DiskImageGraph loadImportedNodesWithError:](v12, "loadImportedNodesWithError:", a6)) {
      goto LABEL_10;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph nodes](v12, "nodes"));
    v20 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v12->_pstackDB,  "objectForKeyedSubscript:",  @"ActiveNode"));
    uint64_t v21 = objc_claimAutoreleasedReturnValue([v19 objectForKey:v20]);
    activeNode = v12->_activeNode;
    v12->_activeNode = (DiskImageGraphNode *)v21;

    if (!v21)
    {
      v23 = (DiskImageGraph *)objc_claimAutoreleasedReturnValue( +[DIError nilWithPOSIXCode:description:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:description:error:",  22LL,  @"Bad pstack format, node with active UUID not found.",  a6));
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
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph pstackDB](self, "pstackDB"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"ImportPstack"]);

  if (!v6) {
    goto LABEL_9;
  }
  if (!-[DiskImageGraph imported](self, "imported"))
  {
    if ((unint64_t)[v6 count] >= 2)
    {
      uint64_t v7 = @"Multiple imports are not allowed.";
      goto LABEL_6;
    }

    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph pstackURL](self, "pstackURL"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 URLByDeletingLastPathComponent]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:relativeToURL:",  v8,  v10));

    a3 = -[DiskImageGraph initWithPstackURL:imported:error:]( objc_alloc(&OBJC_CLASS___DiskImageGraph),  "initWithPstackURL:imported:error:",  v11,  1LL,  a3);
    if (!a3)
    {

      goto LABEL_10;
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph nodes](self, "nodes"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([a3 nodes]);
    [v12 addEntriesFromDictionary:v13];

LABEL_9:
    LOBYTE(a3) = 1;
    goto LABEL_10;
  }

  uint64_t v7 = @"nested imports are not allowed.";
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
  unsigned int v9 = +[DiskImageGraph loadPlistDictFromURL:dict:error:]( &OBJC_CLASS___DiskImageGraph,  "loadPlistDictFromURL:dict:error:",  v8,  &v13,  a5);
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
  uint64_t v28 = 0LL;
  v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  uint64_t v31 = sub_1001136F0;
  v32 = sub_100113700;
  id v33 = 0LL;
  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = sub_1001136F0;
  objc_super v26 = sub_100113700;
  id v27 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v8 count]));
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100113708;
  v17[3] = &unk_100195458;
  v20 = &v28;
  id v10 = v7;
  id v18 = v10;
  id v11 = v9;
  id v19 = v11;
  uint64_t v21 = &v22;
  [v8 enumerateKeysAndObjectsUsingBlock:v17];
  uint64_t v12 = v29[5];
  if (v12)
  {
    id v13 = (void *)v23[5];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100113870;
    v15[3] = &unk_100195480;
    id v16 = v11;
    [v13 enumerateObjectsUsingBlock:v15];
    if (a5) {
      *a5 = (id) v29[5];
    }
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v12 == 0;
}

- (BOOL)cloneToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph pstackURL](self, "pstackURL"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 lastPathComponent]);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 URLByAppendingPathComponent:v8]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph pstackDB](self, "pstackDB"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v10));

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph pstackDB](self, "pstackDB"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"Images"]);

  v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v13 count]));
  objc_msgSend(v11, "setObject:forKeyedSubscript:");
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph pstackDB](self, "pstackDB"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"ImportPstack"]);

  if (v15)
  {
    id v16 = @"Cannot clone a pstack with an import.";
LABEL_16:
    uint64_t v30 = 22LL;
LABEL_17:
    BOOL v29 = +[DIError failWithPOSIXCode:description:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:description:error:",  v30,  v16,  a4);
    goto LABEL_18;
  }

  if (([v6 isFileURL] & 1) == 0)
  {
    id v16 = @"Destination folder URL must be of 'file' scheme.";
    goto LABEL_16;
  }

  if (![v6 hasDirectoryPath]
    || ([v6 checkResourceIsReachableAndReturnError:0] & 1) == 0)
  {
    id v16 = @"Destination folder URL must represent an existing folder.";
    uint64_t v30 = 20LL;
    goto LABEL_17;
  }

  v32 = v13;
  id v33 = v11;
  v34 = a4;
  uint64_t v35 = v9;
  id v36 = v6;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v17 = v13;
  id v18 = [v17 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v39;
    do
    {
      for (i = 0LL; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v39 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
        id v23 = [v22 mutableCopy];
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"FilePath"]);
        v25 = (void *)objc_claimAutoreleasedReturnValue([v24 componentsSeparatedByString:@"/"]);
        objc_super v26 = (void *)objc_claimAutoreleasedReturnValue([v25 lastObject]);
        [v23 setObject:v26 forKeyedSubscript:@"FilePath"];

        [v37 addObject:v23];
      }

      id v19 = [v17 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }

    while (v19);
  }

  id v27 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph nodes](self, "nodes"));
  id v6 = v36;
  unsigned int v28 = +[DiskImageGraph copyDictNodesToFolder:dict:error:]( &OBJC_CLASS___DiskImageGraph,  "copyDictNodesToFolder:dict:error:",  v36,  v27,  v34);

  if (v28)
  {
    id v11 = v33;
    unsigned int v9 = v35;
    BOOL v29 = +[DiskImageGraph saveToPlistWithDictionary:URL:error:]( &OBJC_CLASS___DiskImageGraph,  "saveToPlistWithDictionary:URL:error:",  v33,  v35,  v34);
  }

  else
  {
    BOOL v29 = 0;
    unsigned int v9 = v35;
    id v11 = v33;
  }

  id v13 = v32;
LABEL_18:

  return v29;
}

- (void)setActiveNode:(id)a3
{
  id v5 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue([v5 UUID]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_pstackDB,  "setObject:forKeyedSubscript:",  v6,  @"ActiveNode");
}

+ (BOOL)populateNodesDictsWithArray:(id)a3 pstackURL:(id)a4 nodesDict:(id)a5 isTopLevelPstack:(BOOL)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  objc_super v26 = sub_1001136F0;
  id v27 = sub_100113700;
  id v28 = 0LL;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100113DCC;
  v18[3] = &unk_1001954A8;
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

+ (BOOL)createNodesConnectivityWithNodesDict:(id)a3 error:(id *)a4
{
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  id v14 = sub_1001136F0;
  id v15 = sub_100113700;
  id v16 = 0LL;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100113FC0;
  v8[3] = &unk_1001954D0;
  id v5 = a3;
  id v9 = v5;
  id v10 = &v11;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (void *)v12[5];
  if (a4 && v6) {
    *a4 = v6;
  }

  _Block_object_dispose(&v11, 8);
  return v6 == 0LL;
}

- (BOOL)checkStackValidityWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph activeNode](self, "activeNode"));
  unint64_t v6 = -1LL;
  while (v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 parent]);

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph nodes](self, "nodes"));
    id v9 = [v8 count];

    ++v6;
    id v5 = v7;
    if ((unint64_t)v9 <= v6)
    {
      BOOL v10 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  @"Invalid pstack, Active stack contains a loop.",  a3);

      return v10;
    }
  }

  return 1;
}

- (BOOL)savePstackWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph pstackDB](self, "pstackDB"));
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph pstackURL](self, "pstackURL"));
  LOBYTE(a3) = +[DiskImageGraph saveToPlistWithDictionary:URL:error:]( &OBJC_CLASS___DiskImageGraph,  "saveToPlistWithDictionary:URL:error:",  v5,  v6,  a3);

  return (char)a3;
}

+ (BOOL)saveToPlistWithDictionary:(id)a3 URL:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  a3,  100LL,  0LL,  a5));
  id v9 = v8;
  if (v8) {
    unsigned __int8 v10 = [v8 writeToURL:v7 options:1 error:a5];
  }
  else {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (BOOL)setActiveNodeWithUUID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph nodes](self, "nodes"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v8]);
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
  v16[3] = sub_1001136F0;
  v16[4] = sub_100113700;
  id v6 = a3;
  id v17 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph nodes](self, "nodes"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001144B8;
  v15[3] = &unk_1001954F8;
  void v15[4] = v16;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 keysOfEntriesPassingTest:v15]);

  if (![v8 count])
  {
    id v12 = @"Cannot find image with provided tag.";
    uint64_t v13 = 2LL;
LABEL_6:
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[DIError nilWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:verboseInfo:error:",  v13,  v12,  a4));
    goto LABEL_7;
  }

  if ([v8 count] != (id)1)
  {
    id v12 = @"More than one image in the stack has the provided tag, please specify UUID instead.";
    uint64_t v13 = 22LL;
    goto LABEL_6;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph nodes](self, "nodes"));
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v8 anyObject]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v10]);

LABEL_7:
  _Block_object_dispose(v16, 8);

  return v11;
}

- (id)getImageWithUUID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph nodes](self, "nodes"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v8]);
  if (v9) {
    id v10 = v9;
  }
  else {
    id v10 = (id)objc_claimAutoreleasedReturnValue( +[DIError nilWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:verboseInfo:error:",  2LL,  @"Cannot find image with provided uuid.",  a4));
  }
  uint64_t v11 = v10;

  return v11;
}

- (BOOL)setActiveNodeWithTag:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph getImageWithTag:error:](self, "getImageWithTag:error:", a3, a4));
  if (v5) {
    -[DiskImageGraph setActiveNode:](self, "setActiveNode:", v5);
  }

  return v5 != 0LL;
}

- (BOOL)removeNodeWithUUID:(id)a3 recursive:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph nodes](self, "nodes"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v10]);
  if (v11) {
    unsigned __int8 v12 = -[DiskImageGraph removeWithNode:recursive:error:](self, "removeWithNode:recursive:error:", v11, v6, a5);
  }
  else {
    unsigned __int8 v12 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  @"Cannot find image with provided UUID.",  a5);
  }
  BOOL v13 = v12;

  return v13;
}

- (BOOL)removeNodeWithTag:(id)a3 recursive:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph getImageWithTag:error:](self, "getImageWithTag:error:", a3, a5));
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
  id v8 = a3;
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 parent]);

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 getDescendants]);
    if (![v10 count] || v6)
    {
      uint64_t v14 = objc_claimAutoreleasedReturnValue(-[DiskImageGraph activeNode](self, "activeNode"));
      if ((id)v14 == v8)
      {
      }

      else
      {
        id v15 = (void *)v14;
        id v16 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph activeNode](self, "activeNode"));
        unsigned int v17 = [v10 containsObject:v16];

        if (!v17)
        {
          __int128 v31 = 0u;
          __int128 v32 = 0u;
          __int128 v29 = 0u;
          __int128 v30 = 0u;
          id v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "children", 0));
          id v19 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
          if (v19)
          {
            id v20 = v19;
            uint64_t v21 = *(void *)v30;
            do
            {
              for (i = 0LL; i != v20; i = (char *)i + 1)
              {
                if (*(void *)v30 != v21) {
                  objc_enumerationMutation(v18);
                }
                -[DiskImageGraph removeWithNode:recursive:error:]( self,  "removeWithNode:recursive:error:",  *(void *)(*((void *)&v29 + 1) + 8LL * (void)i),  v6,  0LL);
              }

              id v20 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
            }

            while (v20);
          }

          [v8 deleteImage];
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph imagesDictsArray](self, "imagesDictsArray"));
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v8 pstackDict]);
          [v23 removeObject:v24];

          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph nodes](self, "nodes"));
          objc_super v26 = (void *)objc_claimAutoreleasedReturnValue([v8 UUID]);
          id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 UUIDString]);
          [v25 removeObjectForKey:v27];

          BOOL v13 = 1;
          goto LABEL_19;
        }
      }

      uint64_t v11 = @"The requested operation will delete the active node, please set another one first.";
      uint64_t v12 = 22LL;
    }

    else
    {
      uint64_t v11 = @"The requested operation will delete all children of the provided node. use recursive removal to surpress this error.";
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
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByStandardizingPath]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);

    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v6 URLByStandardizingPath]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);

    if ([v8 hasPrefix:v10])
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "substringFromIndex:", (char *)objc_msgSend(v10, "length") + 1));
      id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:relativeToURL:",  v11,  v6));
    }

    else
    {
      id v12 = (id)objc_claimAutoreleasedReturnValue([v5 absoluteURL]);
    }
  }

  else
  {
    id v12 = v5;
  }

  return v12;
}

- (id)baseNode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph activeNode](self, "activeNode"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 parent]);

  if (v3)
  {
    do
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue([v2 parent]);

      id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 parent]);
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

@end
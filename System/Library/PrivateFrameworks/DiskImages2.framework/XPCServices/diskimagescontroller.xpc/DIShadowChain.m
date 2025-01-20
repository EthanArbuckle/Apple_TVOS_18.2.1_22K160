@interface DIShadowChain
+ (BOOL)supportsSecureCoding;
- (BOOL)addShadowNodes:(id)a3 error:(id *)a4;
- (BOOL)addShadowURLs:(id)a3 error:(id *)a4;
- (BOOL)hasBaseImageCache;
- (BOOL)isEmpty;
- (BOOL)shouldValidate;
- (BOOL)verifyNodes:(id)a3 error:(id *)a4;
- (DIShadowChain)init;
- (DIShadowChain)initWithCoder:(id)a3;
- (NSArray)mountPoints;
- (NSArray)nonCacheNodes;
- (NSArray)shadowStats;
- (NSMutableArray)nodes;
- (NSURL)activeShadowURL;
- (id)description;
- (id)statWithError:(id *)a3;
- (int64_t)topDiskImageNumBlocks;
- (void)encodeWithCoder:(id)a3;
- (void)openWritable:(BOOL)a3 createNonExisting:(BOOL)a4;
- (void)setShouldValidate:(BOOL)a3;
@end

@implementation DIShadowChain

- (DIShadowChain)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DIShadowChain;
  v2 = -[DIShadowChain init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    nodes = v2->_nodes;
    v2->_nodes = (NSMutableArray *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    shadowStats = v2->_shadowStats;
    v2->_shadowStats = (NSArray *)v5;

    v2->_shouldValidate = 1;
  }

  return v2;
}

- (BOOL)addShadowURLs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v6 count]));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)v11);
        v13 = objc_alloc(&OBJC_CLASS___DIShadowNode);
        v14 = -[DIShadowNode initWithURL:isCache:](v13, "initWithURL:isCache:", v12, 0LL, (void)v17);
        [v7 addObject:v14];

        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v9);
  }

  BOOL v15 = -[DIShadowChain addShadowNodes:error:](self, "addShadowNodes:error:", v7, a4);
  return v15;
}

- (BOOL)verifyNodes:(id)a3 error:(id *)a4
{
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v6 = a3;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v7)
  {
    BOOL v15 = 1;
    goto LABEL_15;
  }

  uint64_t v8 = *(void *)v20;
  while (2)
  {
    for (i = 0LL; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v20 != v8) {
        objc_enumerationMutation(v6);
      }
      uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 URL]);
      unsigned __int8 v12 = [v11 isFileURL];

      if ((v12 & 1) == 0)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Shadow path %@ is not a valid file",  v10));
        unsigned __int8 v17 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  v16,  a4);
LABEL_14:
        BOOL v15 = v17;

        goto LABEL_15;
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[DIShadowChain nodes](self, "nodes"));
      unsigned int v14 = [v13 containsObject:v10];

      if (v14)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Duplicate shadow values for: %@",  v10));
        unsigned __int8 v17 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  v16,  a4);
        goto LABEL_14;
      }
    }

    id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    BOOL v15 = 1;
    if (v7) {
      continue;
    }
    break;
  }

- (BOOL)addShadowNodes:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = -[DIShadowChain verifyNodes:error:](self, "verifyNodes:error:", v6, a4);
  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[DIShadowChain nodes](self, "nodes"));
    [v8 addObjectsFromArray:v6];
  }

  return v7;
}

- (void)openWritable:(BOOL)a3 createNonExisting:(BOOL)a4
{
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIShadowChain nodes](self, "nodes"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000B5270;
  v8[3] = &unk_100189318;
  BOOL v9 = a3;
  BOOL v10 = a4;
  v8[4] = self;
  [v7 enumerateObjectsUsingBlock:v8];
}

- (id)statWithError:(id *)a3
{
  shadowStats = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIShadowChain nodes](self, "nodes"));
  id v6 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v31;
LABEL_3:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v31 != v7) {
        objc_enumerationMutation(v5);
      }
      BOOL v9 = *(void **)(*((void *)&v30 + 1) + 8 * v8);
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v9 fileBackend]);
      BOOL v11 = v10 == 0LL;

      if (v11) {
        break;
      }
      unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v9 fileBackend]);
      v13 = v12;
      if (v12)
      {
        [v12 backend];
      }

      else
      {
        uint64_t v26 = 0LL;
        v27 = 0LL;
      }

      sub_10011EBCC((uint64_t)&v26, &v28);
      uint64_t v14 = sub_100105A68((uint64_t)&v28);
      BOOL v15 = v29;
      if (v29)
      {
        p_shared_owners = (unint64_t *)&v29->__shared_owners_;
        do
          unint64_t v17 = __ldaxr(p_shared_owners);
        while (__stlxr(v17 - 1, p_shared_owners));
        if (!v17)
        {
          ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
          std::__shared_weak_count::__release_weak(v15);
        }
      }

      __int128 v18 = v27;
      if (v27)
      {
        __int128 v19 = (unint64_t *)&v27->__shared_owners_;
        do
          unint64_t v20 = __ldaxr(v19);
        while (__stlxr(v20 - 1, v19));
        if (!v20)
        {
          ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
          std::__shared_weak_count::__release_weak(v18);
        }
      }

      if ((v14 & 0x80000000) != 0)
      {
        +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  150LL,  @"Unexpected backend type for shadow file",  a3);
        goto LABEL_28;
      }

      __int128 v21 = -[DIStatFS initWithFileDescriptor:error:]( objc_alloc(&OBJC_CLASS___DIStatFS),  "initWithFileDescriptor:error:",  v14,  a3);
      __int128 v22 = v21;
      if (!v21)
      {
        +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  150LL,  @"Could not stat shadow file",  a3);
        goto LABEL_28;
      }

      -[DIStatFS logWithHeader:](v21, "logWithHeader:", @"Shadow underlying FS");
      -[NSArray addObject:](shadowStats, "addObject:", v22);

      if ((id)++v8 == v6)
      {
        id v6 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_24;
      }
    }

    +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  150LL,  @"Bakcend not initialized for file",  a3);
LABEL_28:

    v23 = 0LL;
    goto LABEL_29;
  }

- (NSArray)mountPoints
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIShadowChain shadowStats](self, "shadowStats", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v10 + 1) + 8 * (void)v7) mountedOnURL]);
        [v3 addObject:v8];

        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v5);
  }

  return (NSArray *)v3;
}

- (BOOL)isEmpty
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIShadowChain nodes](self, "nodes"));
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (NSURL)activeShadowURL
{
  if (-[DIShadowChain isEmpty](self, "isEmpty")
    || (BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[DIShadowChain nodes](self, "nodes")),
        v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lastObject]),
        unsigned __int8 v5 = [v4 isCache],
        v4,
        v3,
        (v5 & 1) != 0))
  {
    uint64_t v6 = 0LL;
  }

  else
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIShadowChain nodes](self, "nodes"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 lastObject]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v8 URL]);
  }

  return (NSURL *)v6;
}

- (BOOL)hasBaseImageCache
{
  if (-[DIShadowChain isEmpty](self, "isEmpty")) {
    return 0;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIShadowChain nodes](self, "nodes"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
  unsigned __int8 v3 = [v5 isCache];

  return v3;
}

- (NSArray)nonCacheNodes
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", &stru_100189358));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIShadowChain nodes](self, "nodes"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 filteredArrayUsingPredicate:v3]);

  return (NSArray *)v5;
}

- (int64_t)topDiskImageNumBlocks
{
  if (-[DIShadowChain isEmpty](self, "isEmpty"))
  {
    int v3 = *__error();
    if (sub_1000BE2F0())
    {
      *(void *)__int128 v32 = 0LL;
      uint64_t v4 = sub_1000BE278();
      unsigned __int8 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        uint64_t v6 = 3LL;
      }
      else {
        uint64_t v6 = 2LL;
      }
      *(_DWORD *)buf = 68157954;
      *(_DWORD *)&buf[4] = 38;
      *(_WORD *)v36 = 2080;
      *(void *)&v36[2] = "-[DIShadowChain topDiskImageNumBlocks]";
      LODWORD(v30) = 18;
      uint64_t v7 = (char *)_os_log_send_and_compose_impl( v6,  v32,  0LL,  0LL,  &_mh_execute_header,  v5,  16LL,  "%.*s: numBlocks queried for an empty shadowChain.",  (int)buf,  v30);

      if (v7)
      {
        fprintf(__stderrp, "%s\n", v7);
        free(v7);
      }
    }

    else
    {
      uint64_t v14 = sub_1000BE278();
      BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68157954;
        *(_DWORD *)&buf[4] = 38;
        *(_WORD *)v36 = 2080;
        *(void *)&v36[2] = "-[DIShadowChain topDiskImageNumBlocks]";
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%.*s: numBlocks queried for an empty shadowChain.",  buf,  0x12u);
      }
    }

    *__error() = v3;
    return -22LL;
  }

  else
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[DIShadowChain nodes](self, "nodes"));
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 lastObject]);

    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 fileBackend]);
    __int128 v11 = v10;
    if (v10)
    {
      [v10 backend];
      uint64_t v13 = *(void *)buf;
      __int128 v12 = *(std::__shared_weak_count **)v36;
    }

    else
    {
      __int128 v12 = 0LL;
      uint64_t v13 = 0LL;
    }

    v31[1] = v13;
    v31[2] = v12;
    *(void *)buf = 0LL;
    *(void *)v36 = 0LL;

    int v17 = (*(uint64_t (**)(uint64_t))(*(void *)v13 + 176LL))(v13);
    unsigned int v18 = dup(v17);
    diskimage_uio::diskimage_open_params::create(v18, 0, 0, (uint64_t)buf);
    if (v36[8]
      && (v19.n128_f64[0] = diskimage_uio::diskimage_open_params::get_nr_blocks( (diskimage_uio::diskimage_open_params *)buf,  (__n128 *)v32),  BYTE6(v34)))
    {
      int64_t v16 = *(void *)v32;
    }

    else
    {
      int v20 = *__error();
      if (sub_1000BE2F0())
      {
        v31[0] = 0LL;
        uint64_t v21 = sub_1000BE278();
        __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v23 = 3LL;
        }
        else {
          uint64_t v23 = 2LL;
        }
        *(_DWORD *)__int128 v32 = 68157954;
        *(_DWORD *)&v32[4] = 38;
        __int16 v33 = 2080;
        v34 = "-[DIShadowChain topDiskImageNumBlocks]";
        LODWORD(v30) = 18;
        v24 = (char *)_os_log_send_and_compose_impl( v23,  v31,  0LL,  0LL,  &_mh_execute_header,  v22,  0LL,  "%.*s: Failed to open top disk image node.",  (int)v32,  v30);

        if (v24)
        {
          fprintf(__stderrp, "%s\n", v24);
          free(v24);
        }
      }

      else
      {
        uint64_t v25 = sub_1000BE278();
        uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 v32 = 68157954;
          *(_DWORD *)&v32[4] = 38;
          __int16 v33 = 2080;
          v34 = "-[DIShadowChain topDiskImageNumBlocks]";
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%.*s: Failed to open top disk image node.",  v32,  0x12u);
        }
      }

      *__error() = v20;
      int64_t v16 = -22LL;
    }

    if (v36[8]) {
      diskimage_uio::diskimage_open_params::~diskimage_open_params((diskimage_uio::diskimage_open_params *)buf);
    }
    if (v12)
    {
      p_shared_owners = (unint64_t *)&v12->__shared_owners_;
      do
        unint64_t v28 = __ldaxr(p_shared_owners);
      while (__stlxr(v28 - 1, p_shared_owners));
      if (!v28)
      {
        ((void (*)(std::__shared_weak_count *, __n128))v12->__on_zero_shared)(v12, v19);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIShadowChain)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___DIShadowChain;
  uint64_t v6 = -[DIShadowChain init](&v21, "init");
  if (v6)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSMutableArray, v5);
    BOOL v9 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v7,  objc_opt_class(&OBJC_CLASS___DIShadowNode, v8),  0LL);
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v10 forKey:@"nodes"]);
    nodes = v6->_nodes;
    v6->_nodes = (NSMutableArray *)v11;

    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSArray, v13);
    int64_t v16 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v14,  objc_opt_class(&OBJC_CLASS___DIStatFS, v15),  0LL);
    int v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    uint64_t v18 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v17 forKey:@"shadowStats"]);
    shadowStats = v6->_shadowStats;
    v6->_shadowStats = (NSArray *)v18;

    v6->_shouldValidate = [v4 decodeBoolForKey:@"shouldValidate"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIShadowChain nodes](self, "nodes"));
  [v6 encodeObject:v4 forKey:@"nodes"];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIShadowChain shadowStats](self, "shadowStats"));
  [v6 encodeObject:v5 forKey:@"shadowStats"];

  objc_msgSend( v6,  "encodeBool:forKey:",  -[DIShadowChain shouldValidate](self, "shouldValidate"),  @"shouldValidate");
}

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIShadowChain nodes](self, "nodes"));
  int v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ShadowChain: %@",  v2));

  return v3;
}

- (NSMutableArray)nodes
{
  return self->_nodes;
}

- (NSArray)shadowStats
{
  return self->_shadowStats;
}

- (BOOL)shouldValidate
{
  return self->_shouldValidate;
}

- (void)setShouldValidate:(BOOL)a3
{
  self->_shouldValidate = a3;
}

- (void).cxx_destruct
{
}

@end
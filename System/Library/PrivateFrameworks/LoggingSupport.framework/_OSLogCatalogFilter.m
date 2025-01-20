@interface _OSLogCatalogFilter
- (BOOL)containsProcessID:(id)a3;
- (BOOL)containsProcessLookupSubstr:(id)a3;
- (BOOL)containsSenderLookupSubstr:(id)a3;
- (BOOL)containsSubsystemSubstr:(id)a3;
- (BOOL)containsUUID:(id)a3;
- (BOOL)isKeptCatalog:(catalog_s *)a3;
- (_OSLogCatalogFilter)initWithPredicate:(id)a3 collection:(id)a4;
- (void)addProcessID:(id)a3;
- (void)addProcessLookupSubstr:(id)a3;
- (void)addSenderLookupSubstr:(id)a3;
- (void)addSubsystem:(id)a3;
- (void)addUUID:(id)a3;
- (void)dealloc;
- (void)generateUUIDSet;
- (void)handleDSOFile:(_ftsent *)a3;
- (void)processComparisonPredicate:(id)a3;
- (void)processLeftExpression:(id)a3 andRightExpression:(id)a4;
- (void)readDSCUUIDs;
- (void)readDSOUUIDs;
- (void)visitPredicate:(id)a3;
@end

@implementation _OSLogCatalogFilter

- (_OSLogCatalogFilter)initWithPredicate:(id)a3 collection:(id)a4
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  v8 = getenv("LOG_USE_CATALOGFILTER");
  if (v8 && !strcmp(v8, "0")) {
    goto LABEL_10;
  }
  [v7 UUIDTextReference];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  int v10 = [v9 fileDescriptor];

  if (fcntl(v10, 50, __s1, 1024LL) == -1)
  {
    __error();
    _os_assumes_log();
LABEL_10:
    v26 = 0LL;
    goto LABEL_11;
  }

  [MEMORY[0x189604010] setWithArray:&unk_189F1D010];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189604010] setWithArray:&unk_189F1D028];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189604010] setWithArray:&unk_189F1D040];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS____OSLogCatalogFilter;
  v14 = -[_OSLogCatalogFilter init](&v28, sel_init);
  if (v14)
  {
    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    pidAccept = v14->_pidAccept;
    v14->_pidAccept = v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    processLookupSubstr = v14->_processLookupSubstr;
    v14->_processLookupSubstr = v17;

    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    senderLookupSubstr = v14->_senderLookupSubstr;
    v14->_senderLookupSubstr = v19;

    v21 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    subsysSubstrAccept = v14->_subsysSubstrAccept;
    v14->_subsysSubstrAccept = v21;

    v23 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    uuidAccept = v14->_uuidAccept;
    v14->_uuidAccept = v23;

    v14->_uuidtext_path = strdup(__s1);
    _OSLogGetSimplePredicate(v6, v11, v12, v13);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 acceptVisitor:v14 flags:0];
    if (v14->_hasItems) {
      -[_OSLogCatalogFilter generateUUIDSet](v14, "generateUUIDSet");
    }
  }

  self = v14;

  v26 = self;
LABEL_11:

  return v26;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____OSLogCatalogFilter;
  -[_OSLogCatalogFilter dealloc](&v3, sel_dealloc);
}

- (BOOL)isKeptCatalog:(catalog_s *)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (self->_hasItems && !self->_hasSharedCacheItems)
  {
    uint64_t v17 = 0LL;
    v18 = &v17;
    uint64_t v19 = 0x2020000000LL;
    char v20 = 0;
    uint64_t v6 = MEMORY[0x1895F87A8];
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __37___OSLogCatalogFilter_isKeptCatalog___block_invoke;
    v16[3] = &unk_189F0F110;
    v16[4] = self;
    v16[5] = &v17;
    _catalog_for_each_uuid((uint64_t)a3, (uint64_t)v16);
    if (*((_BYTE *)v18 + 24)) {
      goto LABEL_6;
    }
    var2 = a3->var2;
    v15[0] = v6;
    v15[1] = 3221225472LL;
    v15[2] = __37___OSLogCatalogFilter_isKeptCatalog___block_invoke_2;
    v15[3] = &unk_189F0F138;
    v15[4] = self;
    v15[5] = &v17;
    _os_trace_str_map_for_each((uint64_t)var2, (uint64_t)v15);
    if (*((_BYTE *)v18 + 24))
    {
LABEL_6:
      LOBYTE(v4) = 1;
    }

    else
    {
      var4 = a3->var4;
      v10[0] = v6;
      v10[1] = 3221225472LL;
      v11 = __37___OSLogCatalogFilter_isKeptCatalog___block_invoke_3;
      v12 = &unk_189F0F160;
      v13 = self;
      v14 = &v17;
      if (var4)
      {
        v4 = (void *)*((void *)var4 + 2);
        if (v4)
        {
          do
          {
            v11((uint64_t)v10, v4[4]);
            v4 = (void *)*v4;
          }

          while (v4);
          LOBYTE(v4) = *((_BYTE *)v18 + 24) != 0;
        }
      }

      else
      {
        LOBYTE(v4) = 0;
      }
    }

    _Block_object_dispose(&v17, 8);
  }

  else
  {
    LOBYTE(v4) = 1;
  }

  return (char)v4;
}

- (void)addProcessID:(id)a3
{
  self->_hasItems = 1;
  -[NSMutableSet addObject:](self->_pidAccept, "addObject:", a3);
}

- (BOOL)containsProcessID:(id)a3
{
  return -[NSMutableSet containsObject:](self->_pidAccept, "containsObject:", a3);
}

- (void)addSubsystem:(id)a3
{
  self->_hasItems = 1;
  -[NSMutableSet addObject:](self->_subsysSubstrAccept, "addObject:", a3);
}

- (BOOL)containsSubsystemSubstr:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v5 = self->_subsysSubstrAccept;
  uint64_t v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend( v4,  "localizedStandardContainsString:",  *(void *)(*((void *)&v10 + 1) + 8 * i),  (void)v10))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }

      uint64_t v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

- (void)addUUID:(id)a3
{
}

- (BOOL)containsUUID:(id)a3
{
  return -[NSMutableSet containsObject:](self->_uuidAccept, "containsObject:", a3);
}

- (void)addProcessLookupSubstr:(id)a3
{
  self->_hasItems = 1;
  -[NSMutableSet addObject:](self->_processLookupSubstr, "addObject:", a3);
}

- (void)addSenderLookupSubstr:(id)a3
{
  self->_hasItems = 1;
  -[NSMutableSet addObject:](self->_senderLookupSubstr, "addObject:", a3);
}

- (BOOL)containsProcessLookupSubstr:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v5 = self->_processLookupSubstr;
  uint64_t v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend( v4,  "localizedStandardContainsString:",  *(void *)(*((void *)&v10 + 1) + 8 * i),  (void)v10))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }

      uint64_t v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

- (BOOL)containsSenderLookupSubstr:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v5 = self->_senderLookupSubstr;
  uint64_t v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend( v4,  "localizedStandardContainsString:",  *(void *)(*((void *)&v10 + 1) + 8 * i),  (void)v10))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }

      uint64_t v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

- (void)generateUUIDSet
{
  if (-[NSMutableSet count](self->_processLookupSubstr, "count")
    || -[NSMutableSet count](self->_senderLookupSubstr, "count"))
  {
    -[_OSLogCatalogFilter readDSOUUIDs](self, "readDSOUUIDs");
  }

  if (-[NSMutableSet count](self->_senderLookupSubstr, "count")) {
    -[_OSLogCatalogFilter readDSCUUIDs](self, "readDSCUUIDs");
  }
}

- (void)readDSOUUIDs
{
  v13[2] = *(char **)MEMORY[0x1895F89C0];
  v13[0] = self->_uuidtext_path;
  v13[1] = 0LL;
  objc_super v3 = fts_open(v13, 2, 0LL);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = MEMORY[0x1895F8770];
LABEL_3:
    while (1)
    {
      uint64_t v6 = fts_read(v4);
      if (!v6) {
        break;
      }
      uint64_t v7 = v6;
      int fts_level = (unsigned __int16)v6->fts_level;
      if (fts_level == 2)
      {
        if (v6->fts_info == 8
          && strlen(v6->fts_name) == 30
          && (v7->fts_name[0] & 0x80000000) == 0
          && (*(_DWORD *)(v5 + 4LL * v7->fts_name[0] + 60) & 0x10000) != 0)
        {
          unint64_t v9 = 0LL;
          while (v9 != 29)
          {
            unint64_t v10 = v9;
            int v11 = v7->fts_name[v9 + 1];
            if ((v11 & 0x80000000) == 0)
            {
              int v12 = *(_DWORD *)(v5 + 4LL * v11 + 60);
              unint64_t v9 = v10 + 1;
              if ((v12 & 0x10000) != 0) {
                continue;
              }
            }

            if (v10 < 0x1D) {
              goto LABEL_3;
            }
            break;
          }

          -[_OSLogCatalogFilter handleDSOFile:](self, "handleDSOFile:", v7);
        }
      }

      else if (fts_level == 1 {
             && (v6->fts_info != 1
      }
              || strlen(v6->fts_name) != 2
              || v7->fts_name[0] < 0
              || (*(_DWORD *)(v5 + 4LL * v7->fts_name[0] + 60) & 0x10000) == 0
              || v7->fts_name[1] < 0
              || (*(_DWORD *)(v5 + 4LL * v7->fts_name[1] + 60) & 0x10000) == 0))
      {
        fts_set(v4, v7, 4);
      }
    }

    fts_close(v4);
  }

  else
  {
    _os_assumes_log();
  }

- (void)handleDSOFile:(_ftsent *)a3
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  int v5 = openat(-2, a3->fts_path, 0);
  if (v5 == -1)
  {
    __error();
LABEL_40:
    _os_assumes_log();
    return;
  }

  int v6 = v5;
  uint64_t v7 = (int *)_os_trace_mmap();
  v8 = v7;
  if (v7) {
    BOOL v9 = v30 >= 0x10;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9 && *v7 == 1719109785 && v7[1] == 2)
  {
    unint64_t v10 = v7[3];
    uint64_t v11 = 16LL;
    if (v30 - 16 >= 8 && (_DWORD)v10)
    {
      LODWORD(v12) = 0;
      unint64_t v13 = (v30 - 16) >> 3;
      if (v13 >= v10) {
        unint64_t v13 = v7[3];
      }
      if (v13 <= 1) {
        unint64_t v13 = 1LL;
      }
      v14 = v7 + 5;
      do
      {
        int v15 = *v14;
        v14 += 2;
        uint64_t v12 = (v15 + v12);
        --v13;
      }

      while (v13);
      uint64_t v11 = v12 + 16;
    }

    size_t v16 = v11 + 8 * v10;
    if (v16 >= v30)
    {
      _os_assumes_log();
      goto LABEL_37;
    }

    if ((uint64_t)v16 < (uint64_t)v30)
    {
      uint64_t v17 = (char *)v7 + v16;
      if (*((_BYTE *)v7 + v16))
      {
        uint64_t v18 = ~v11 + v30 - 8 * v10;
        uint64_t v19 = (char *)v7 + v16;
        while (v18)
        {
          int v20 = *++v19;
          --v18;
          if (!v20)
          {
            goto LABEL_25;
          }
        }

        goto LABEL_33;
      }

- (void)readDSCUUIDs
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  snprintf(__str, 0x400uLL, "%s/dsc", self->_uuidtext_path);
  objc_super v3 = opendir(__str);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = MEMORY[0x1895F87A8];
    while (1)
    {
      int v6 = readdir(v4);
      if (!v6) {
        break;
      }
      if (v6->d_type == 8)
      {
        if (_convertUUIDStringToUUID(v6->d_name, (unsigned __int8 *)&v9))
        {
          uuidtext_path = self->_uuidtext_path;
          v8[0] = v5;
          v8[1] = 3221225472LL;
          v8[2] = __35___OSLogCatalogFilter_readDSCUUIDs__block_invoke;
          v8[3] = &unk_189F0F1B0;
          v8[4] = self;
          _os_trace_uuiddb_dsc_run_block_on_map(uuidtext_path, &v9, (uint64_t)v8);
        }
      }
    }

    closedir(v4);
  }

  else
  {
    _os_assumes_log();
  }

- (void)processLeftExpression:(id)a3 andRightExpression:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([v9 expressionType] == 3)
  {
    [v9 keyPath];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (([v7 isEqualToString:@"processID"] & 1) != 0
      || [v7 isEqualToString:@"processIdentifier"])
    {
      [v6 constantValue];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_OSLogCatalogFilter addProcessID:](self, "addProcessID:", v8);
    }

    else if (([v7 isEqualToString:@"process"] & 1) != 0 {
           || [v7 isEqualToString:@"processImagePath"])
    }
    {
      [v6 constantValue];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_OSLogCatalogFilter addProcessLookupSubstr:](self, "addProcessLookupSubstr:", v8);
    }

    else if (([v7 isEqualToString:@"sender"] & 1) != 0 {
           || [v7 isEqualToString:@"senderImagePath"])
    }
    {
      [v6 constantValue];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_OSLogCatalogFilter addSenderLookupSubstr:](self, "addSenderLookupSubstr:", v8);
    }

    else
    {
      [v6 constantValue];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_OSLogCatalogFilter addSubsystem:](self, "addSubsystem:", v8);
    }

LABEL_12:
  }
}

- (void)processComparisonPredicate:(id)a3
{
  id v4 = a3;
  [v4 leftExpression];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 rightExpression];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_OSLogCatalogFilter processLeftExpression:andRightExpression:]( self,  "processLeftExpression:andRightExpression:",  v6,  v5);
  -[_OSLogCatalogFilter processLeftExpression:andRightExpression:]( self,  "processLeftExpression:andRightExpression:",  v5,  v6);
}

- (void)visitPredicate:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    -[_OSLogCatalogFilter processComparisonPredicate:](self, "processComparisonPredicate:", v4);
  }
}

- (void).cxx_destruct
{
}

@end
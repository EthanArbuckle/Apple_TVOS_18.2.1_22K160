@interface _OSLogIndex
- (BOOL)_addFileToIndex:(const char *)a3 error:(id *)a4;
- (BOOL)_buildFileIndex;
- (BOOL)_buildSingleFileIndex:(id *)a3;
- (BOOL)_openTimesyncDatabase;
- (BOOL)_readArchiveMetadata:(id *)a3;
- (BOOL)addReferenceToIndex:(id)a3 error:(id *)a4;
- (_OSLogIndex)init;
- (_OSLogIndex)initWithCollection:(id)a3 buildLocalIndex:(BOOL)a4;
- (_OSLogIndex)initWithCollection:(id)a3 timesync:(_os_timesync_db_s *)a4 metadata:(id)a5;
- (_os_timesync_db_s)timesync;
- (unint64_t)endWalltime;
- (unint64_t)persistStartWalltime;
- (unint64_t)specialStartWalltime;
- (void)_enumerateEntriesInRange:(os_timesync_range_s *)a3 options:(unsigned int)a4 usingBlock:(id)a5;
- (void)_foreachIndexFile:(id)a3;
- (void)dealloc;
- (void)enumerateEntriesFrom:(unint64_t)a3 to:(unint64_t)a4 options:(unsigned int)a5 usingBlock:(id)a6;
- (void)enumerateEntriesFromLastBootWithOptions:(unsigned int)a3 usingBlock:(id)a4;
- (void)enumerateEntriesInRange:(os_timesync_range_s *)a3 options:(unsigned int)a4 usingCatalogFilter:(id)a5 usingBlock:(id)a6;
- (void)enumerateEntriesUsingBlock:(id)a3;
- (void)enumerateFilesUsingBlock:(id)a3;
- (void)insertChunkStore:(id)a3;
- (void)insertIndexFile:(id)a3;
@end

@implementation _OSLogIndex

- (_OSLogIndex)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____OSLogIndex;
  v2 = -[_OSLogIndex init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    fileq = v2->_fileq;
    v2->_fileq = v3;
  }

  return v2;
}

- (_OSLogIndex)initWithCollection:(id)a3 buildLocalIndex:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v8 = -[_OSLogIndex init](self, "init");
  v9 = v8;
  if (v8
    && ((objc_storeStrong((id *)&v8->_lcr, a3), !-[_OSLogIndex _openTimesyncDatabase](v9, "_openTimesyncDatabase"))
     || (-[_OSLogIndex _readArchiveMetadata:](v9, "_readArchiveMetadata:", 0LL), v4)
     && !-[_OSLogIndex _buildFileIndex](v9, "_buildFileIndex")))
  {
    v10 = 0LL;
  }

  else
  {
    v10 = v9;
  }

  return v10;
}

- (_OSLogIndex)initWithCollection:(id)a3 timesync:(_os_timesync_db_s *)a4 metadata:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v11 = -[_OSLogIndex init](self, "init");
  v12 = v11;
  if (!v11)
  {
LABEL_33:
    v18 = v12;
    goto LABEL_34;
  }

  objc_storeStrong((id *)&v11->_lcr, a3);
  uint64_t v13 = _timesync_db_openat(*(_DWORD *)a4, ".");
  v12->_tsdb = (_os_timesync_db_s *)v13;
  if (v13)
  {
    objc_storeStrong((id *)&v12->_metadata2, a5);
    if (v10)
    {
      id v14 = v10;
      [v14 oldestLive];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        *(_OWORD *)v12->_metadata.olim_oldestlive.uuid = *(_OWORD *)[v15 UUID];
        uint64_t v17 = [v16 continuousTime];
      }

      else
      {
        uuid_clear(v12->_metadata.olim_oldestlive.uuid);
        uint64_t v17 = 0LL;
      }

      v12->_metadata.olim_oldestlive.continuous = v17;

      [v14 oldestPersist];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        *(_OWORD *)v12->_metadata.olim_oldestpersist.uuid = *(_OWORD *)[v19 UUID];
        uint64_t v21 = [v20 continuousTime];
      }

      else
      {
        uuid_clear(v12->_metadata.olim_oldestpersist.uuid);
        uint64_t v21 = 0LL;
      }

      v12->_metadata.olim_oldestpersist.continuous = v21;

      [v14 oldestSpecial];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22)
      {
        *(_OWORD *)v12->_metadata.olim_oldestspecial.uuid = *(_OWORD *)[v22 UUID];
        uint64_t v24 = [v23 continuousTime];
      }

      else
      {
        uuid_clear(v12->_metadata.olim_oldestspecial.uuid);
        uint64_t v24 = 0LL;
      }

      v12->_metadata.olim_oldestspecial.continuous = v24;

      [v14 oldestSignpost];
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v25)
      {
        *(_OWORD *)v12->_metadata.olim_oldestsignpost.uuid = *(_OWORD *)[v25 UUID];
        uint64_t v27 = [v26 continuousTime];
      }

      else
      {
        uuid_clear(v12->_metadata.olim_oldestsignpost.uuid);
        uint64_t v27 = 0LL;
      }

      v12->_metadata.olim_oldestsignpost.continuous = v27;

      [v14 oldestHighVolume];
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v28)
      {
        *(_OWORD *)v12->_metadata.olim_oldesthighvol.uuid = *(_OWORD *)[v28 UUID];
        uint64_t v30 = [v29 continuousTime];
      }

      else
      {
        uuid_clear(v12->_metadata.olim_oldesthighvol.uuid);
        uint64_t v30 = 0LL;
      }

      v12->_metadata.olim_oldesthighvol.continuous = v30;

      [v14 end];
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v31)
      {
        *(_OWORD *)v12->_metadata.olim_end.uuid = *(_OWORD *)[v31 UUID];
        uint64_t v33 = [v32 continuousTime];
      }

      else
      {
        uuid_clear(v12->_metadata.olim_end.uuid);
        uint64_t v33 = 0LL;
      }

      v12->_metadata.olim_end.continuous = v33;

      uint64_t v34 = 0LL;
      olim_ttl = v12->_metadata.olim_ttl;
      while (2)
      {
        [v14 timeRefForTTLClass:v34];
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v36;
        if (v36)
        {
          *(_OWORD *)olim_ttl->timeref.uuid = *(_OWORD *)[v36 UUID];
          uint64_t v38 = [v37 continuousTime];
        }

        else
        {
          uuid_clear(olim_ttl->timeref.uuid);
          uint64_t v38 = 0LL;
        }

        olim_ttl->timeref.continuous = v38;

        char v39 = 1;
        switch(v34)
        {
          case 0LL:
            goto LABEL_31;
          case 1LL:
            char v39 = 3;
            goto LABEL_31;
          case 2LL:
            char v39 = 7;
            goto LABEL_31;
          case 3LL:
            char v39 = 14;
LABEL_31:
            olim_ttl->ttl = v39;
            ++olim_ttl;
            ++v34;
            continue;
          case 4LL:
            v12->_metadata.olim_ttl[4].ttl = 30;

            _os_log_index_metadata_determine_oldest((uint64_t)&v12->_metadata, (uint64_t)a4);
            v12->_metadataValid = 1;
            goto LABEL_33;
          default:
            qword_18C695DA0 = (uint64_t)"BUG IN LIBTRACE: _tp_class_ttl_to called with invalid tp";
            __break(1u);
            JUMPOUT(0x18699C128LL);
        }
      }
    }

    goto LABEL_33;
  }

  v18 = 0LL;
LABEL_34:

  return v18;
}

- (void)dealloc
{
  tsdb = (int *)self->_tsdb;
  if (tsdb) {
    _timesync_db_close(tsdb);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____OSLogIndex;
  -[_OSLogIndex dealloc](&v4, sel_dealloc);
}

- (BOOL)_readArchiveMetadata:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 fileDescriptor];
  uint64_t v6 = _os_trace_mmap_at();

  if (v6)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytesNoCopy:v6 length:v59 deallocator:&__block_literal_global_596];
    [MEMORY[0x1896079E8] propertyListWithData:v7 options:0 format:0 error:a3];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = v8;
    if (v8)
    {
      [v8 objectForKeyedSubscript:@"PersistMetadata"];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 objectForKeyedSubscript:@"OldestTimeRef"];
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        id v12 = v11;
        [v12 objectForKeyedSubscript:@"UUID"];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            uuid_parse( (const char *)[v13 UTF8String], self->_metadata.olim_oldestpersist.uuid);
            [v12 objectForKeyedSubscript:@"ContinuousTime"];
            id v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0) {
                self->_metadata.olim_oldestpersist.continuous = [v14 unsignedLongLongValue];
              }
            }
          }
        }

        [v9 objectForKeyedSubscript:@"EndTimeRef"];
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          id v17 = v15;
          [v17 objectForKeyedSubscript:@"UUID"];
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              uuid_parse( (const char *)[v18 UTF8String], self->_metadata.olim_end.uuid);
              [v17 objectForKeyedSubscript:@"ContinuousTime"];
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (v19)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0) {
                  self->_metadata.olim_end.continuous = [v19 unsignedLongLongValue];
                }
              }
            }
          }

          [v9 objectForKeyedSubscript:@"LiveMetadata"];
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          [v20 objectForKeyedSubscript:@"OldestTimeRef"];
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            v57 = v21;
            id v22 = v21;
            [v22 objectForKeyedSubscript:@"UUID"];
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                uuid_parse( (const char *)[v23 UTF8String], self->_metadata.olim_oldestlive.uuid);
                [v22 objectForKeyedSubscript:@"ContinuousTime"];
                uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
                if (v24)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0) {
                    self->_metadata.olim_oldestlive.continuous = [v24 unsignedLongLongValue];
                  }
                }
              }
            }

            [v9 objectForKeyedSubscript:@"SpecialMetadata"];
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (v25)
            {
              v56 = v25;
              [v25 objectForKeyedSubscript:@"OldestTimeRef"];
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              BOOL v27 = v26 != 0LL;
              if (v26)
              {
                uu = &self->_metadata.olim_oldestspecial;
                id v51 = v26;
                id v28 = v26;
                [v28 objectForKeyedSubscript:@"UUID"];
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                if (v29)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    uuid_parse((const char *)[v29 UTF8String], uu->uuid);
                    [v28 objectForKeyedSubscript:@"ContinuousTime"];
                    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v30)
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0) {
                        self->_metadata.olim_oldestspecial.continuous = [v30 unsignedLongLongValue];
                      }
                    }
                  }
                }

                [v9 objectForKeyedSubscript:@"SignpostMetadata"];
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                if (v55)
                {
                  [v55 objectForKeyedSubscript:@"OldestTimeRef"];
                  id v31 = (id)objc_claimAutoreleasedReturnValue();
                  [v31 objectForKeyedSubscript:@"UUID"];
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v32)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      uuid_parse( (const char *)[v32 UTF8String], self->_metadata.olim_oldestsignpost.uuid);
                      [v31 objectForKeyedSubscript:@"ContinuousTime"];
                      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v33)
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0) {
                          self->_metadata.olim_oldestsignpost.continuous = [v33 unsignedLongLongValue];
                        }
                      }
                    }
                  }
                }

                v53 = v11;
                v54 = v7;
                [v9 objectForKeyedSubscript:@"HighVolumeMetadata"];
                uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = v34;
                if (v34)
                {
                  [v34 objectForKeyedSubscript:@"OldestTimeRef"];
                  id v36 = (id)objc_claimAutoreleasedReturnValue();
                  [v36 objectForKeyedSubscript:@"UUID"];
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v37)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      uuid_parse( (const char *)[v37 UTF8String], self->_metadata.olim_oldesthighvol.uuid);
                      [v36 objectForKeyedSubscript:@"ContinuousTime"];
                      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v38)
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0) {
                          self->_metadata.olim_oldesthighvol.continuous = [v38 unsignedLongLongValue];
                        }
                      }
                    }
                  }
                }

                v50 = v35;
                v52 = v16;
                [v56 objectForKeyedSubscript:@"TTL"];
                char v39 = (void *)objc_claimAutoreleasedReturnValue();
                if (v39)
                {
                  uint64_t v40 = 0LL;
                  v41 = &_OSLogTTLTable;
                  while (1)
                  {
                    [NSString stringWithUTF8String:*((void *)v41 + 1)];
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    [v39 objectForKeyedSubscript:v42];
                    v43 = (void *)objc_claimAutoreleasedReturnValue();

                    v44 = (char *)self + v40 * 32;
                    id v45 = v43;
                    [v45 objectForKeyedSubscript:@"UUID"];
                    id v46 = (id)objc_claimAutoreleasedReturnValue();
                    if (!v46) {
                      goto LABEL_56;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0) {
                      goto LABEL_56;
                    }
                    id v46 = v46;
                    uuid_parse( (const char *)[v46 UTF8String],  self->_metadata.olim_ttl[v40].timeref.uuid);
                    [v45 objectForKeyedSubscript:@"ContinuousTime"];
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v47) {
                      break;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0) {
                      break;
                    }
                    *((void *)v44 + 25) = [v47 unsignedLongLongValue];

                    self->_metadata.olim_ttl[v40].ttl = *v41;
LABEL_57:

                    ++v40;
                    v41 += 16;
                    if (v40 == 5) {
                      goto LABEL_58;
                    }
                  }

LABEL_56:
                  v44[208] = *v41;
                  *(_OWORD *)self->_metadata.olim_ttl[v40].timeref.uuid = *(_OWORD *)uu->uuid;
                  *((void *)v44 + 25) = self->_metadata.olim_oldestspecial.continuous;
                  goto LABEL_57;
                }

- (BOOL)_openTimesyncDatabase
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = [v3 fileDescriptor];

  v5 = (_os_timesync_db_s *)_timesync_db_openat(v4, ".");
  if (v5) {
    self->_tsdb = v5;
  }
  return v5 != 0LL;
}

- (BOOL)addReferenceToIndex:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = -[_OSLogIndexFile initWithTraceFile:error:]( objc_alloc(&OBJC_CLASS____OSLogIndexFile),  "initWithTraceFile:error:",  v6,  a4);

  if (v7) {
    -[NSMutableArray addObject:](self->_fileq, "addObject:", v7);
  }

  return v7 != 0LL;
}

- (BOOL)_addFileToIndex:(const char *)a3 error:(id *)a4
{
  id v6 = -[_OSLogChunkFileReference initWithCollection:subpath:]( objc_alloc(&OBJC_CLASS____OSLogChunkFileReference),  "initWithCollection:subpath:",  self->_lcr,  a3);
  LOBYTE(a4) = -[_OSLogIndex addReferenceToIndex:error:](self, "addReferenceToIndex:error:", v6, a4);

  return (char)a4;
}

- (void)_foreachIndexFile:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  int v4 = (void (**)(id, void))a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v5 = self->_fileq;
  uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
      }

      while (v7 != v9);
      uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }
}

- (void)insertChunkStore:(id)a3
{
  id v4 = a3;
  v5 = -[_OSLogIndexFile initWithChunkStore:error:]( objc_alloc(&OBJC_CLASS____OSLogIndexFile),  "initWithChunkStore:error:",  v4,  0LL);

  -[NSMutableArray addObject:](self->_fileq, "addObject:", v5);
}

- (void)insertIndexFile:(id)a3
{
}

- (BOOL)_buildFileIndex
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  v3 = -[_OSLogCollectionReference diagnosticsDirectoryReference](self->_lcr, "diagnosticsDirectoryReference");
  int v4 = [v3 fileDescriptor];

  if (fcntl(v4, 50, __s, 1025LL) < 0)
  {
    LOBYTE(v5) = 0;
  }

  else
  {
    v16[0] = __s;
    v16[1] = 0LL;
    v5 = fts_open(v16, 2132, 0LL);
    if (v5)
    {
      uint64_t v6 = v5;
      size_t v7 = strlen(__s);
      *(_WORD *)&__s[v7] = 47;
      uint64_t v8 = fts_read(v6);
      if (v8)
      {
        uint64_t v9 = v8;
        size_t v10 = v7 + 1;
        do
        {
          if (v9->fts_level)
          {
            int fts_info = v9->fts_info;
            if (fts_info == 1)
            {
              if (v9->fts_level != 1
                || strcmp(v9->fts_name, "Persist")
                && strcmp(v9->fts_name, "Special")
                && strcmp(v9->fts_name, "Signpost")
                && strcmp(v9->fts_name, "HighVolume"))
              {
                fts_set(v6, v9, 4);
              }
            }

            else if (fts_info == 8)
            {
              __int128 v12 = strrchr(v9->fts_name, 46);
              if (v12)
              {
                if (!strcmp(v12, ".tracev3"))
                {
                  fts_path = v9->fts_path;
                  if (!strncmp(fts_path, __s, v10)) {
                    size_t v14 = v10;
                  }
                  else {
                    size_t v14 = 0LL;
                  }
                  -[_OSLogIndex _addFileToIndex:error:](self, "_addFileToIndex:error:", &fts_path[v14], 0LL);
                }
              }
            }
          }

          uint64_t v9 = fts_read(v6);
        }

        while (v9);
      }

      fts_close(v6);
      LOBYTE(v5) = 1;
    }
  }

  return (char)v5;
}

- (BOOL)_buildSingleFileIndex:(id *)a3
{
  v5 = -[_OSLogChunkFileReference initWithCollection:subpath:]( objc_alloc(&OBJC_CLASS____OSLogChunkFileReference),  "initWithCollection:subpath:",  self->_lcr,  -[NSString fileSystemRepresentation](self->_file, "fileSystemRepresentation"));
  uint64_t v6 = -[_OSLogIndexFile initWithTraceFile:error:]( objc_alloc(&OBJC_CLASS____OSLogIndexFile),  "initWithTraceFile:error:",  v5,  a3);
  if (v6) {
    -[NSMutableArray addObject:](self->_fileq, "addObject:", v6);
  }

  return v6 != 0LL;
}

- (unint64_t)persistStartWalltime
{
  if (self->_metadataValid) {
    return _timesync_continuous_to_wall_time( (uint64_t)self->_tsdb,  self->_metadata.olim_oldestpersist.uuid,  self->_metadata.olim_oldestpersist.continuous,  0LL);
  }
  else {
    return 0LL;
  }
}

- (unint64_t)specialStartWalltime
{
  if (self->_metadataValid) {
    return _timesync_continuous_to_wall_time( (uint64_t)self->_tsdb,  self->_metadata.olim_oldestspecial.uuid,  self->_metadata.olim_oldestspecial.continuous,  0LL);
  }
  else {
    return 0LL;
  }
}

- (unint64_t)endWalltime
{
  if (self->_metadataValid) {
    return _timesync_continuous_to_wall_time( (uint64_t)self->_tsdb,  self->_metadata.olim_end.uuid,  self->_metadata.olim_end.continuous,  0LL);
  }
  else {
    return -1LL;
  }
}

- (void)enumerateEntriesFrom:(unint64_t)a3 to:(unint64_t)a4 options:(unsigned int)a5 usingBlock:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  tsdb = self->_tsdb;
  id v11 = a6;
  impl = (void ***)_timesync_range_create_impl((uint64_t)tsdb, a3, a4, 0);
  -[_OSLogIndex _enumerateEntriesInRange:options:usingBlock:]( self,  "_enumerateEntriesInRange:options:usingBlock:",  impl,  v6,  v11);

  _os_trace_uuid_map_destroy(*impl);
  free(impl);
}

- (void)enumerateEntriesFromLastBootWithOptions:(unsigned int)a3 usingBlock:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  tsdb = self->_tsdb;
  id v7 = a4;
  since_last_boot = (void ***)_timesync_range_create_since_last_boot((uint64_t)tsdb, 0LL);
  -[_OSLogIndex _enumerateEntriesInRange:options:usingBlock:]( self,  "_enumerateEntriesInRange:options:usingBlock:",  since_last_boot,  v4,  v7);

  _os_trace_uuid_map_destroy(*since_last_boot);
  free(since_last_boot);
}

- (void)_enumerateEntriesInRange:(os_timesync_range_s *)a3 options:(unsigned int)a4 usingBlock:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  uint64_t v9 = MEMORY[0x1895F87A8];
  fileq = self->_fileq;
  v36[0] = MEMORY[0x1895F87A8];
  v36[1] = 3221225472LL;
  v36[2] = ___OSLogIndexSortedByBoot_block_invoke;
  v36[3] = &__block_descriptor_40_e32_B32__0___OSLogIndexFile_8Q16_B24l;
  v36[4] = a3;
  id v11 = fileq;
  -[NSMutableArray indexesOfObjectsPassingTest:](v11, "indexesOfObjectsPassingTest:", v36);
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray objectsAtIndexes:](v11, "objectsAtIndexes:", v12);
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v30 = v9;
  uint64_t v31 = 3221225472LL;
  uint64_t v32 = (uint64_t)___OSLogIndexSortedByBoot_block_invoke_2;
  uint64_t v33 = (const char *)&__block_descriptor_44_e11_q24__0_8_16l;
  uint64_t v34 = a3;
  int v35 = v5;
  [v13 sortedArrayUsingComparator:&v30];
  size_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_metadataValid
    && ((olim_oldest = self->_metadata.olim_oldest) == 0LL
     || (_timesync_range_intersect( (char *)a3,  olim_oldest,  (float *)olim_oldest->continuous,  self->_metadata.olim_end.uuid,  (float *)self->_metadata.olim_end.continuous),  self->_metadataValid)))
  {
    p_metadata = &self->_metadata;
  }

  else
  {
    p_metadata = 0LL;
  }

  id v17 = -[_OSLogIndexEnumerator initWithIndex:metadata:fileBootList:catalogFilter:]( objc_alloc(&OBJC_CLASS____OSLogIndexEnumerator),  "initWithIndex:metadata:fileBootList:catalogFilter:",  self,  p_metadata,  v14,  0LL);
  uint64_t v30 = 0LL;
  uint64_t v31 = (uint64_t)&v30;
  uint64_t v32 = 0x9010000000LL;
  uint64_t v33 = "+a";
  _chunk_support_context_init((uint64_t)&v34);
  -[_OSLogCollectionReference UUIDTextReference](self->_lcr, "UUIDTextReference");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  int v19 = [v18 fileDescriptor];
  *(_DWORD *)(v31 + 36) = v19;

  uint64_t v20 = v31;
  *(void *)(v31 + 120) = self->_tsdb;
  if ((v5 & 1) != 0) {
    *(_DWORD *)(v20 + 32) |= 0x80u;
  }
  tsdb = self->_tsdb;
  v26[0] = v9;
  v26[1] = 3221225472LL;
  v26[2] = __59___OSLogIndex__enumerateEntriesInRange_options_usingBlock___block_invoke;
  v26[3] = &unk_189F0E8C0;
  id v22 = v8;
  id v28 = v22;
  v29 = &v30;
  v23 = v17;
  BOOL v27 = v23;
  -[_OSLogIndexEnumerator enumerateTracepointsInRange:timesync:options:usingBlock:]( v23,  "enumerateTracepointsInRange:timesync:options:usingBlock:",  a3,  tsdb,  v5,  v26);
  uint64_t v24 = v31;
  uint64_t v25 = v31 + 32;
  *(void *)(v31 + 72) = 0LL;
  *(_DWORD *)(v24 + 36) = -1;
  _chunk_support_context_clear(v25);

  _Block_object_dispose(&v30, 8);
}

- (void)enumerateEntriesInRange:(os_timesync_range_s *)a3 options:(unsigned int)a4 usingCatalogFilter:(id)a5 usingBlock:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a6;
  uint64_t v11 = MEMORY[0x1895F87A8];
  fileq = self->_fileq;
  v32[0] = MEMORY[0x1895F87A8];
  v32[1] = 3221225472LL;
  v32[2] = ___OSLogIndexSortedByBoot_block_invoke;
  v32[3] = &__block_descriptor_40_e32_B32__0___OSLogIndexFile_8Q16_B24l;
  v32[4] = a3;
  __int128 v13 = fileq;
  id v14 = a5;
  -[NSMutableArray indexesOfObjectsPassingTest:](v13, "indexesOfObjectsPassingTest:", v32);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[NSMutableArray objectsAtIndexes:](v13, "objectsAtIndexes:", v15);
  v30[0] = v11;
  v30[1] = 3221225472LL;
  v30[2] = ___OSLogIndexSortedByBoot_block_invoke_2;
  v30[3] = &__block_descriptor_44_e11_q24__0_8_16l;
  v30[4] = a3;
  int v31 = v7;
  [v16 sortedArrayUsingComparator:v30];
  id v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_metadataValid
    && ((olim_oldest = self->_metadata.olim_oldest) == 0LL
     || (_timesync_range_intersect( (char *)a3,  olim_oldest,  (float *)olim_oldest->continuous,  self->_metadata.olim_end.uuid,  (float *)self->_metadata.olim_end.continuous),  self->_metadataValid)))
  {
    p_metadata = &self->_metadata;
  }

  else
  {
    p_metadata = 0LL;
  }

  uint64_t v20 = -[_OSLogIndexEnumerator initWithIndex:metadata:fileBootList:catalogFilter:]( objc_alloc(&OBJC_CLASS____OSLogIndexEnumerator),  "initWithIndex:metadata:fileBootList:catalogFilter:",  self,  p_metadata,  v17,  v14);

  id v21 = +[OSLogEventProxy _make](&OBJC_CLASS___OSLogEventProxy, "_make");
  [v21 _setTimesyncDatabase:self->_tsdb];
  [v21 _setIncludeSensitive:(v7 & 1) == 0];
  -[_OSLogCollectionReference UUIDTextReference](self->_lcr, "UUIDTextReference");
  id v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_setUUIDDBFileDescriptor:", objc_msgSend(v22, "fileDescriptor"));

  [v21 _setDoNotTrackActivites:(v7 >> 4) & 1];
  tsdb = self->_tsdb;
  v26[0] = v11;
  v26[1] = 3221225472LL;
  v26[2] = __77___OSLogIndex_enumerateEntriesInRange_options_usingCatalogFilter_usingBlock___block_invoke;
  v26[3] = &unk_189F0E8E8;
  id v28 = v10;
  id v29 = v21;
  BOOL v27 = v20;
  id v24 = v10;
  uint64_t v25 = v20;
  -[_OSLogIndexEnumerator enumerateTracepointsInRange:timesync:options:usingBlock:]( v25,  "enumerateTracepointsInRange:timesync:options:usingBlock:",  a3,  tsdb,  v7,  v26);
  [v21 _unmake];
}

- (void)enumerateEntriesUsingBlock:(id)a3
{
}

- (void)enumerateFilesUsingBlock:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[_OSLogCollectionReference UUIDTextReference](self->_lcr, "UUIDTextReference");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 fileDescriptor];

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v7 = self->_fileq;
  uint64_t v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
LABEL_3:
    uint64_t v11 = 0LL;
    while (1)
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(v7);
      }
      __int128 v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
      __int128 v13 = (void *)MEMORY[0x186E40118](v8);
      id v14 = (void *)objc_msgSend(v12, "copyMappedChunkStore:", 0, (void)v16);
      int v15 = (*((uint64_t (**)(id, uint64_t, void, void))v4 + 2))(v4, v6, v14[1], v14[2]);

      objc_autoreleasePoolPop(v13);
      if (!v15) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
        uint64_t v9 = v8;
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (_os_timesync_db_s)timesync
{
  return self->_tsdb;
}

- (void).cxx_destruct
{
}

@end
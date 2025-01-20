@interface _OSLogIndexEnumerator
- (NSMutableArray)oversizeChunks;
- (_OSLogIndexEnumerator)initWithIndex:(id)a3 metadata:(id *)a4 fileBootList:(id)a5 catalogFilter:(id)a6;
- (_OSLogTracepointBuffer)tracepoints;
- (void)_initTimesyncBounds:(id *)a3;
- (void)dealloc;
- (void)enumerateTracepointsInRange:(os_timesync_range_s *)a3 timesync:(_os_timesync_db_s *)a4 options:(unsigned int)a5 usingBlock:(id)a6;
@end

@implementation _OSLogIndexEnumerator

- (_OSLogIndexEnumerator)initWithIndex:(id)a3 metadata:(id *)a4 fileBootList:(id)a5 catalogFilter:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS____OSLogIndexEnumerator;
  v14 = -[_OSLogIndexEnumerator init](&v33, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_index, a3);
    v16 = objc_alloc_init(&OBJC_CLASS____OSLogTracepointBuffer);
    tracepoints = v15->_tracepoints;
    v15->_tracepoints = v16;

    uint64_t v18 = [v12 mutableCopy];
    fileBootQ = v15->_fileBootQ;
    v15->_fileBootQ = (NSMutableArray *)v18;

    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    fileStartQ = v15->_fileStartQ;
    v15->_fileStartQ = v20;

    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    fileEndQ = v15->_fileEndQ;
    v15->_fileEndQ = v22;

    v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    catalogStartQ = v15->_catalogStartQ;
    v15->_catalogStartQ = v24;

    v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    subchunkStartQ = v15->_subchunkStartQ;
    v15->_subchunkStartQ = v26;

    v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    subchunkEndQ = v15->_subchunkEndQ;
    v15->_subchunkEndQ = v28;

    v30 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    oversizeChunks = v15->_oversizeChunks;
    v15->_oversizeChunks = v30;

    objc_storeStrong((id *)&v15->_catalogFilter, a6);
    if (a4) {
      -[_OSLogIndexEnumerator _initTimesyncBounds:](v15, "_initTimesyncBounds:", a4);
    }
  }

  return v15;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  for (uint64_t i = 8LL; i != 14; ++i)
  {
    Class v4 = (&self->super.isa)[i];
    if (v4)
    {
      _os_trace_uuid_map_destroy((void **)&v4->isa->isa);
      free(v4);
    }
  }

  live_bound = (void ***)self->_live_bound;
  if (live_bound)
  {
    _os_trace_uuid_map_destroy(*live_bound);
    free(live_bound);
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____OSLogIndexEnumerator;
  -[_OSLogIndexEnumerator dealloc](&v6, sel_dealloc);
}

- (void)_initTimesyncBounds:(id *)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  impl = (char *)_timesync_range_create_impl( (uint64_t)-[_OSLogIndex timesync](self->_index, "timesync"),  0LL,  0xFFFFFFFFFFFFFFFFLL,  0);
  unint64_t v6 = _timesync_continuous_to_wall_time( (uint64_t)-[_OSLogIndex timesync](self->_index, "timesync"),  a3->var5.uuid,  a3->var5.continuous,  0LL);
  for (uint64_t i = 0LL; i != 5; ++i)
  {
    uint64_t var1 = a3->var7[i].var1;
    v9 = (char *)_timesync_range_copy(impl);
    _timesync_range_intersect(v9, a3->var7[i].var0.uuid, (float *)a3->var7[i].var0.continuous, 0LL, 0LL);
    if (v6 >= 86400000000000LL * var1)
    {
      v10 = -[_OSLogIndex timesync](self->_index, "timesync");
      v14 = 0LL;
      __int128 v15 = *(_OWORD *)_timesync_range_find_startboot( (uint64_t)v10,  v6 - 86400000000000LL * var1,  v6,  (unint64_t *)&v14);
      _timesync_range_intersect(v9, &v15, v14, 0LL, 0LL);
    }

    uint64_t v11 = 5LL;
    if ((_DWORD)var1 != 30) {
      uint64_t v11 = 0LL;
    }
    if ((_DWORD)var1 == 14) {
      uint64_t v11 = 4LL;
    }
    if ((_DWORD)var1 == 7) {
      uint64_t v11 = 3LL;
    }
    if ((_DWORD)var1 == 3) {
      uint64_t v12 = 2LL;
    }
    else {
      uint64_t v12 = 0LL;
    }
    if ((_DWORD)var1 == 1) {
      uint64_t v12 = 1LL;
    }
    self->_bounds[v11] = (os_timesync_range_s *)v9;
  }

  id v13 = (os_timesync_range_s *)_timesync_range_copy(impl);
  self->_live_bound = v13;
  _timesync_range_intersect((char *)v13, a3->var4.uuid, (float *)a3->var4.continuous, 0LL, 0LL);
  _timesync_range_intersect(impl, a3, (float *)a3->var0.continuous, 0LL, 0LL);
  self->_bounds[0] = (os_timesync_range_s *)impl;
}

- (void)enumerateTracepointsInRange:(os_timesync_range_s *)a3 timesync:(_os_timesync_db_s *)a4 options:(unsigned int)a5 usingBlock:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v151 = *MEMORY[0x1895F89C0];
  id v114 = a6;
  v120 = a3;
  if (a3->var0) {
    uint64_t v9 = *((void *)a3->var0 + 3);
  }
  else {
    uint64_t v9 = 0LL;
  }
  v135[0] = 0LL;
  v135[1] = v135;
  v135[2] = 0x2020000000LL;
  char v136 = 0;
  v137[1] = *((void *)a4 + 10);
  if (!v9) {
    goto LABEL_185;
  }
  if ((v6 & 8) != 0) {
    uint64_t v10 = v9 - 1;
  }
  else {
    uint64_t v10 = 0LL;
  }
  uint64_t v116 = 0LL;
  if ((v6 & 8) != 0) {
    uint64_t v11 = -1LL;
  }
  else {
    uint64_t v11 = 0LL;
  }
  p_uint64_t var1 = &a3->var1;
  v109 = &a3->var1;
  p_var2 = &a3->var2;
  if ((v6 & 8) != 0) {
    p_uint64_t var1 = &a3->var2;
  }
  v108 = p_var1;
  uint64_t v13 = 1LL;
  if ((v6 & 8) != 0) {
    uint64_t v13 = -1LL;
  }
  uint64_t v111 = v13;
  uint64_t v112 = v11;
  do
  {
    v14 = (char *)v120 + 16 * v10;
    __int128 v150 = *(_OWORD *)(v14 + 24);
    uint64_t v115 = v10;
    v137[0] = v10;
    __int128 v15 = self;
    unint64_t v16 = _os_trace_uuid_map_lookup(v120->var0, &v150);
    v17 = -[NSMutableArray firstObject](self->_fileBootQ, "firstObject");
    uint64_t v119 = v9;
    if (v17)
    {
      do
      {
        unint64_t v18 = _os_trace_uuid_map_lookup(v120->var0, (void *)[v17 bootUUID]);
        if (v18 == v16) {
          break;
        }
        if ((v6 & 8) != 0)
        {
          if (v18 <= v16) {
            break;
          }
        }

        else if (v18 >= v16)
        {
          break;
        }

        -[NSMutableArray removeObjectAtIndex:](self->_fileBootQ, "removeObjectAtIndex:", 0LL);
        uint64_t v19 = -[NSMutableArray firstObject](self->_fileBootQ, "firstObject");

        v17 = (void *)v19;
      }

      while (v19);
    }

    v118 = v15;
    v20 = -[NSMutableArray firstObject](self->_fileBootQ, "firstObject");
    if (v20)
    {
      do
      {
        v21 = (_OWORD *)[v20 bootUUID];
        if (*v21 != v150) {
          break;
        }
        -[NSMutableArray removeObjectAtIndex:](self->_fileBootQ, "removeObjectAtIndex:", 0LL);
        if ([v20 _determineTimespan])
        {
          -[NSMutableArray addObject:](self->_fileStartQ, "addObject:", v20);
          -[NSMutableArray addObject:](self->_fileEndQ, "addObject:", v20);
        }

        uint64_t v22 = -[NSMutableArray firstObject](self->_fileBootQ, "firstObject");

        v20 = (void *)v22;
      }

      while (v22);
    }

    -[NSMutableArray sortUsingFunction:context:]( self->_fileStartQ,  "sortUsingFunction:context:",  _OSLogIndexOrderForOpening,  v6);
    -[NSMutableArray sortUsingFunction:context:]( self->_fileEndQ,  "sortUsingFunction:context:",  _OSLogIndexOrderForClosing,  v6);

    uint64_t v131 = 0LL;
    v132 = &v131;
    unint64_t v23 = v112;
    uint64_t v133 = 0x2020000000LL;
    if (!v116) {
      unint64_t v23 = *v108;
    }
    unint64_t v134 = v23;
    v24 = -[NSMutableArray firstObject](self->_fileStartQ, "firstObject");
    v25 = v24;
    if (!v24 || (v26 = (void *)[v24 bootUUID], *v26 != *((void *)v14 + 3)))
    {

      uint64_t v28 = v119;
      goto LABEL_177;
    }

    BOOL v27 = v26[1] == *((void *)v14 + 4);

    uint64_t v28 = v119;
    if (!v27) {
      goto LABEL_177;
    }
    -[_OSLogTracepointBuffer beginInsertingTracepointsClippingFromTime:]( self->_tracepoints,  "beginInsertingTracepointsClippingFromTime:",  0LL);
    for (uint64_t i = 0LL; i != 6; ++i)
    {
      v30 = self->_bounds[i];
      if (v30 && *(_OWORD *)&v30->var3[0][0] == v150) {
        -[_OSLogTracepointBuffer insertNonsparsePoint:uuid:ttl:inMemory:]( self->_tracepoints,  "insertNonsparsePoint:uuid:ttl:inMemory:",  v30->var1,  v30->var3,  (0x1E0E07030100uLL >> (8 * i)) & 0x1F,  0LL);
      }
    }

    live_bound = self->_live_bound;
    if (live_bound && *(_OWORD *)&live_bound->var3[0][0] == v150) {
      -[_OSLogTracepointBuffer insertNonsparsePoint:uuid:ttl:inMemory:]( self->_tracepoints,  "insertNonsparsePoint:uuid:ttl:inMemory:",  live_bound->var1,  live_bound->var3,  0LL,  1LL);
    }
    -[_OSLogTracepointBuffer insertTimesyncPoints:forBoot:oldestContinuousTime:]( self->_tracepoints,  "insertTimesyncPoints:forBoot:oldestContinuousTime:",  a4,  &v150,  v132[3]);
    uint64_t v32 = -[_OSLogTracepointBuffer finishedInsertingTracepointsWithNextMajorTime:options:]( self->_tracepoints,  "finishedInsertingTracepointsWithNextMajorTime:options:",  0LL,  v6);
    uint64_t v127 = 0LL;
    v128 = &v127;
    uint64_t v129 = 0x2020000000LL;
    char v130 = 1;
    while (2)
    {
      context = (void *)MEMORY[0x186E40118](v32);
      unint64_t v33 = v132[3];
      v34 = v118;
      -[_OSLogTracepointBuffer beginInsertingTracepointsClippingFromTime:]( self->_tracepoints,  "beginInsertingTracepointsClippingFromTime:",  v33);
      v35 = -[NSMutableArray firstObject](self->_fileStartQ, "firstObject");
      if (!v35) {
        goto LABEL_68;
      }
      v36 = -[NSMutableArray firstObject](self->_fileStartQ, "firstObject");
      v37 = v36;
      BOOL v38 = (v6 & 8) != 0 ? [v36 endTime] < v33 : objc_msgSend(v36, "oldestTime") > v33;

      if (v38) {
        goto LABEL_68;
      }
      v113 = v34;
      v39 = -[NSMutableArray firstObject](self->_fileStartQ, "firstObject");
      if (!v39) {
        goto LABEL_67;
      }
      while (1)
      {
        v40 = (_OWORD *)[v39 bootUUID];
        if (*v40 == v150) {
          break;
        }
        -[NSMutableArray removeObjectAtIndex:](self->_fileStartQ, "removeObjectAtIndex:", 0LL);
        uint64_t v41 = -[NSMutableArray firstObject](self->_fileStartQ, "firstObject");

        v39 = (void *)v41;
        if (!v41) {
          goto LABEL_67;
        }
      }

      while (1)
      {
        v42 = (_OWORD *)[v39 bootUUID];
        if (*v42 != v150)
        {
          v44 = v39;
          goto LABEL_66;
        }

        id v43 = v39;
        v44 = v43;
        if ((v6 & 8) != 0) {
          break;
        }
        if ([v43 oldestTime] > v33) {
          goto LABEL_65;
        }

        if ([v44 endTime] >= v33)
        {
LABEL_59:
          uint64_t v138 = 0LL;
          v45 = v113;
          id v46 = v44;
          v47 = (void *)[v46 copyMappedChunkStore:&v138];
          if (v47)
          {
            v48 = v45;
            id v49 = v47;
            v149[0] = 0LL;
            v149[1] = v149;
            v149[2] = 0x2020000000LL;
            v149[3] = 0LL;
            v147[0] = 0LL;
            v147[1] = v147;
            v147[2] = 0x3032000000LL;
            v147[3] = __Block_byref_object_copy_;
            v147[4] = __Block_byref_object_dispose_;
            id v148 = 0LL;
            uint64_t v139 = MEMORY[0x1895F87A8];
            uint64_t v140 = 3221225472LL;
            v141 = ___oie_advance_cursor_open_store_block_invoke;
            v142 = &unk_189F0E9B8;
            v145 = v149;
            v146 = v147;
            v50 = (_OSLogIndexEnumerator *)v49;
            v143 = v50;
            v51 = v48;
            v144 = v51;
            -[_OSLogIndexEnumerator enumerateChunksUsingBlock:](v50, "enumerateChunksUsingBlock:", &v139);
            -[NSMutableArray sortUsingFunction:context:]( self->_catalogStartQ,  "sortUsingFunction:context:",  _OSLogIndexOrderForOpening,  v6);

            _Block_object_dispose(v147, 8);
            _Block_object_dispose(v149, 8);
          }
        }

- (NSMutableArray)oversizeChunks
{
  return self->_oversizeChunks;
}

- (_OSLogTracepointBuffer)tracepoints
{
  return self->_tracepoints;
}

- (void).cxx_destruct
{
}

@end
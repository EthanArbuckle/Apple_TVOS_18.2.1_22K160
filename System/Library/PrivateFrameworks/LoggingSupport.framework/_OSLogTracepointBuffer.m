@interface _OSLogTracepointBuffer
- (BOOL)_isEmpty;
- (NSMutableOrderedSet)fileNames;
- (_OSLogTracepointBuffer)init;
- (void)beginInsertingTracepointsClippingFromTime:(unint64_t)a3;
- (void)dealloc;
- (void)enumerateEventsFromTime:(unint64_t)a3 to:(unint64_t)a4 options:(unsigned int)a5 usingBlock:(id)a6;
- (void)finishedInsertingTracepointsWithNextMajorTime:(unint64_t)a3 options:(unsigned int)a4;
- (void)insertChunk:(tracev3_chunk_s *)a3 chunkOffset:(int64_t)a4 chunkSetStartAddr:(void *)a5 timestamp:(unint64_t)a6 subchunk:(id)a7;
- (void)insertNonsparsePoint:(unint64_t)a3 uuid:(unsigned __int8)a4[16] ttl:(unsigned __int8)a5 inMemory:(BOOL)a6;
- (void)insertSimpleChunk:(tracev3_chunk_s *)a3 chunkOffset:(int64_t)a4 chunkSetStartAddr:(void *)a5 subchunk:(id)a6 options:(unsigned int)a7;
- (void)insertStatedumpChunk:(tracev3_chunk_s *)a3 chunkOffset:(int64_t)a4 chunkSetStartAddr:(void *)a5 subchunk:(id)a6;
- (void)insertTimesyncPoints:(_os_timesync_db_s *)a3 forBoot:(unsigned __int8)a4[16] oldestContinuousTime:(unint64_t)a5;
- (void)insertTracepoints:(tracev3_chunk_s *)a3 chunkOffset:(int64_t)a4 chunkSetStartAddr:(void *)a5 subchunk:(id)a6 options:(unsigned int)a7;
@end

@implementation _OSLogTracepointBuffer

- (_OSLogTracepointBuffer)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS____OSLogTracepointBuffer;
  v2 = -[_OSLogTracepointBuffer init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_events = 0LL;
    v4 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x189603FD0]);
    fileNames = v3->_fileNames;
    v3->_fileNames = v4;

    v3->_cursor = 0LL;
    v3->_count = 0LL;
    v3->_mutable = 0;
    v3->_size = 0LL;
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____OSLogTracepointBuffer;
  -[_OSLogTracepointBuffer dealloc](&v3, sel_dealloc);
}

- (BOOL)_isEmpty
{
  return !self->_size || self->_cursor == self->_count;
}

- (void)beginInsertingTracepointsClippingFromTime:(unint64_t)a3
{
  self->_mutable = 1;
  v5 = self;
  unint64_t cursor = v5->_cursor;
  objc_super v7 = v5;
  if (self->_mutable)
  {
    v12 = v7;

    unint64_t count = v12->_count;
    if (cursor < count)
    {
      p_var1 = &v12->_events[cursor].var1;
      unint64_t v10 = cursor;
      while (1)
      {
        unint64_t v11 = *p_var1;
        p_var1 += 13;
        if (v11 >= a3) {
          break;
        }
        if (count == ++v10) {
          goto LABEL_8;
        }
      }

      unint64_t cursor = v10;
    }

- (void)insertTimesyncPoints:(_os_timesync_db_s *)a3 forBoot:(unsigned __int8)a4[16] oldestContinuousTime:(unint64_t)a5
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v8 = __76___OSLogTracepointBuffer_insertTimesyncPoints_forBoot_oldestContinuousTime___block_invoke;
  v9 = &unk_189F0E830;
  unint64_t v10 = self;
  unint64_t v11 = a5;
  v12 = a3;
  unsigned __int8 *__attribute__((__org_arrdim(0,16))) v13 = a4;
  _timesync_reset((uint64_t)a3);
  while (*(void *)a4 != *((void *)a3 + 8) || *((void *)a4 + 1) != *((void *)a3 + 9))
  {
  }

  if (__76___OSLogTracepointBuffer_insertTimesyncPoints_forBoot_oldestContinuousTime___block_invoke( (uint64_t)v7,  (__int128 *)((char *)a3 + 104)))
  {
    do
    {
      if (!*((void *)a3 + 6)) {
        break;
      }
      _timesync_advance((uint64_t)a3);
      if (*(void *)a4 != *((void *)a3 + 8)) {
        break;
      }
    }

    while (*((void *)a4 + 1) == *((void *)a3 + 9) && (v8((uint64_t)v7, (__int128 *)((char *)a3 + 104)) & 1) != 0);
  }

- (void)insertNonsparsePoint:(unint64_t)a3 uuid:(unsigned __int8)a4[16] ttl:(unsigned __int8)a5 inMemory:(BOOL)a6
{
  uint64_t v12 = v11;
  -[NSMutableOrderedSet addObject:](self->_fileNames, "addObject:", @"nonsparse");
  unsigned __int16 v13 = -[NSMutableOrderedSet indexOfObject:](self->_fileNames, "indexOfObject:", @"nonsparse");
  uint64_t v14 = &self->_events[v12];
  v14->var0 = 2;
  v14->var1 = a3;
  v14->var2 = v13;
  *(int64x2_t *)&v14->var3 = vdupq_n_s64(0xDEADBEEFuLL);
  v14->var5.var0.var0 = 0LL;
  v14->var5.var0.var1 = 0LL;
  v14->var5.var2.var1 = a5;
  v14->var5.var2.var2 = a6;
  *(_OWORD *)(&v14->var5.var2 + 1) = 0u;
  *(_OWORD *)((char *)&v14->var5.var2 + 34) = 0u;
  *((_OWORD *)&v14->var5.var2 + 3) = 0u;
  *(_OWORD *)&self->_events[v12].var5.var0.var0 = *(_OWORD *)a4;
}

- (void)insertChunk:(tracev3_chunk_s *)a3 chunkOffset:(int64_t)a4 chunkSetStartAddr:(void *)a5 timestamp:(unint64_t)a6 subchunk:(id)a7
{
  id v36 = a7;
  unint64_t v12 = [v36 oldestTime];
  unint64_t v13 = [v36 endTime];
  id v14 = [v36 catalog];
  if (_OSLogEventUnpackChunk((int *)a3, [v14 catalog], (uint64_t)v37))
  {
    if (v12 <= a6) {
      unint64_t v15 = a6;
    }
    else {
      unint64_t v15 = v12;
    }
    if (v15 >= v13) {
      unint64_t v16 = v13;
    }
    else {
      unint64_t v16 = v15;
    }
    [v36 catalog];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 store];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 fileName];
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    fileNames = self->_fileNames;
    if (v19)
    {
      [v36 catalog];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 store];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v22 fileName];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableOrderedSet addObject:](fileNames, "addObject:", v23);

      v24 = self->_fileNames;
      [v36 catalog];
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 store];
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v26 fileName];
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      unsigned __int16 v28 = -[NSMutableOrderedSet indexOfObject:](v24, "indexOfObject:", v27);
    }

    else
    {
      -[NSMutableOrderedSet addObject:](self->_fileNames, "addObject:", @"(null)");
      unsigned __int16 v28 = -[NSMutableOrderedSet indexOfObject:](self->_fileNames, "indexOfObject:", @"(null)");
    }

    _oltb_allocate_row(self);
    v30 = &self->_events[v29];
    int64_t v31 = (char *)a3 - (_BYTE *)a5;
    id v32 = v14;
    uint64_t v33 = [v32 fileHeader];
    uint64_t v34 = [v32 catalog];
    __int128 v35 = v37[1];
    *(_OWORD *)&v30->var5.var2.var1 = v37[0];
    v30->var0 = 3;
    v30->var1 = v16;
    v30->var2 = v28;
    v30->var3 = a4;
    v30->var4 = v31;
    v30->var5.var0.var0 = (tracev3_chunk_s *)v33;
    v30->var5.var0.var1 = (catalog_s *)v34;
    *((_OWORD *)&v30->var5.var2 + 2) = v35;
    v30->var5.var0.var2.var3 = v38;
    v30->var5.var0.var3 = 0LL;
  }
}

- (void)insertSimpleChunk:(tracev3_chunk_s *)a3 chunkOffset:(int64_t)a4 chunkSetStartAddr:(void *)a5 subchunk:(id)a6 options:(unsigned int)a7
{
  __int16 v7 = a7;
  id v12 = a6;
  if ((v7 & 0x200) == 0)
  {
    int v13 = a3->var1.var3.var3[0];
    if (v13 == 2)
    {
      if ((v7 & 2) == 0) {
        goto LABEL_8;
      }
    }

    else if (v13 == 1 && (v7 & 4) == 0)
    {
      goto LABEL_8;
    }

    id v14 = v12;
    -[_OSLogTracepointBuffer insertChunk:chunkOffset:chunkSetStartAddr:timestamp:subchunk:]( self,  "insertChunk:chunkOffset:chunkSetStartAddr:timestamp:subchunk:",  a3,  a4,  a5,  a3->var1.var0.var2,  v12);
    id v12 = v14;
  }

- (void)insertStatedumpChunk:(tracev3_chunk_s *)a3 chunkOffset:(int64_t)a4 chunkSetStartAddr:(void *)a5 subchunk:(id)a6
{
}

- (void)insertTracepoints:(tracev3_chunk_s *)a3 chunkOffset:(int64_t)a4 chunkSetStartAddr:(void *)a5 subchunk:(id)a6 options:(unsigned int)a7
{
  __int16 v46 = a7;
  id v47 = a6;
  [v47 catalog];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v42 = [v47 oldestTime];
  unint64_t v41 = [v47 endTime];
  id v45 = v9;
  if (_OSLogEventUnpackChunk((int *)a3, [v45 catalog], (uint64_t)v48))
  {
    uint64_t v11 = *((void *)&v48[0] + 1) + 16LL;
    uint64_t v10 = (unsigned __int16)**((_WORD **)&v48[0] + 1);
    uint64_t v40 = *((void *)&v48[0] + 1);
    else {
      unint64_t v12 = *((void *)&v48[0] + 1) + v10;
    }
    while (v11 + 24 < v12)
    {
      int v13 = (char *)v11;
      unint64_t v14 = *(void *)(v11 + 16);
      uint64_t v15 = HIWORD(v14);
      uint64_t v17 = v15 + 24;
      uint64_t v18 = (HIWORD(v14) & 0xFFF8) + 32LL;
      if ((v14 & 0x7000000000000LL) == 0) {
        uint64_t v18 = v17;
      }
      v11 += v18;
      if (*(void *)v13)
      {
        switch(*(void *)v13)
        {
          case 2u:
            if ((v46 & 0x80) == 0) {
              goto LABEL_27;
            }
            break;
          case 3u:
            if ((v46 & 0x100) == 0) {
              goto LABEL_27;
            }
            break;
          case 4u:
            if ((v46 & 0x200) == 0)
            {
              int v19 = BYTE1(*(void *)v13);
              if (v19 == 2)
              {
                if ((v46 & 2) != 0) {
                  goto LABEL_27;
                }
              }

              else if (v19 != 1 || (v46 & 4) != 0)
              {
                goto LABEL_27;
              }
            }

            break;
          case 6u:
            if ((v46 & 0x20) != 0) {
              goto LABEL_27;
            }
            break;
          case 7u:
            if ((v46 & 0x40) != 0) {
              goto LABEL_27;
            }
            break;
          default:
LABEL_27:
            unint64_t v20 = (v14 & 0xFFFFFFFFFFFFLL) + *(void *)(v40 + 8);
            if (v20 <= v42) {
              unint64_t v20 = v42;
            }
            if (v20 >= v41) {
              unint64_t v21 = v41;
            }
            else {
              unint64_t v21 = v20;
            }
            [v47 catalog];
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            [v22 store];
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            [v23 fileName];
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            fileNames = self->_fileNames;
            if (v24)
            {
              [v47 catalog];
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              [v26 store];
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              [v27 fileName];
              unsigned __int16 v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableOrderedSet addObject:](fileNames, "addObject:", v28);

              uint64_t v29 = self->_fileNames;
              [v47 catalog];
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              [v30 store];
              int64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
              [v31 fileName];
              id v32 = (void *)objc_claimAutoreleasedReturnValue();
              unsigned __int16 v33 = -[NSMutableOrderedSet indexOfObject:](v29, "indexOfObject:", v32);
            }

            else
            {
              -[NSMutableOrderedSet addObject:](self->_fileNames, "addObject:", @"(null)");
              unsigned __int16 v33 = -[NSMutableOrderedSet indexOfObject:](self->_fileNames, "indexOfObject:", @"(null)");
            }

            _oltb_allocate_row(self);
            __int128 v35 = &self->_events[v34];
            id v36 = v45;
            uint64_t v37 = [v36 fileHeader];
            uint64_t v38 = [v36 catalog];
            __int128 v39 = v48[1];
            *(_OWORD *)&v35->var5.var2.var1 = v48[0];
            v35->var0 = 3;
            v35->var1 = v21;
            v35->var2 = v33;
            v35->var3 = a4;
            v35->var4 = v13 - (_BYTE *)a5;
            v35->var5.var0.var0 = (tracev3_chunk_s *)v37;
            v35->var5.var0.var1 = (catalog_s *)v38;
            *((_OWORD *)&v35->var5.var2 + 2) = v39;
            v35->var5.var0.var2.var3 = v49;
            v35->var5.var0.var3 = (_firehose_unaligned_tracepoint_s *)v13;
            break;
        }
      }
    }
  }
}

- (void)finishedInsertingTracepointsWithNextMajorTime:(unint64_t)a3 options:(unsigned int)a4
{
  char v4 = a4;
  _oltb_consolidate(self);
  unint64_t cursor = self->_cursor;
  unint64_t count = self->_count;
  if ((v4 & 8) != 0)
  {
    unint64_t v9 = 0xFFFFFFFF00000001LL;
    while (1)
    {
      if (cursor < count)
      {
        p_var1 = &self->_events[cursor].var1;
        while (1)
        {
          unint64_t v32 = *p_var1;
          p_var1 += 13;
          if (v32 < a3) {
            break;
          }
          if (count == ++cursor)
          {
            unint64_t cursor = count;
            break;
          }
        }
      }

      unint64_t v33 = cursor >= count ? count : cursor;
      uint64_t v34 = 104 * count - 96;
      while (count > cursor)
      {
        --count;
        unint64_t v35 = *(void *)((char *)&self->_events->var0 + v34);
        v34 -= 104LL;
        if (v35 >= a3)
        {
          unint64_t v33 = count + 1;
          break;
        }
      }

      if (cursor == v33) {
        break;
      }
      events = self->_events;
      uint64_t v37 = &events[cursor];
      __int128 v38 = *(_OWORD *)((char *)&v37->var5.var2 + 40);
      __int128 v59 = *(_OWORD *)((char *)&v37->var5.var2 + 24);
      __int128 v60 = v38;
      var3 = v37->var5.var0.var3;
      __int128 v39 = *(_OWORD *)&v37->var2;
      __int128 v55 = *(_OWORD *)&v37->var0;
      __int128 v56 = v39;
      __int128 v40 = *(_OWORD *)&v37->var5.var2.var0[8];
      __int128 v57 = *(_OWORD *)&v37->var4;
      __int128 v58 = v40;
      unint64_t count = v33 - 1;
      unint64_t v41 = v33 - 1;
      unint64_t v42 = &events[v41];
      __int128 v44 = *(_OWORD *)&v42->var2;
      __int128 v43 = *(_OWORD *)&v42->var4;
      *(_OWORD *)&v37->var0 = *(_OWORD *)&v42->var0;
      *(_OWORD *)&v37->var2 = v44;
      *(_OWORD *)&v37->var4 = v43;
      __int128 v46 = *(_OWORD *)((char *)&v42->var5.var2 + 24);
      __int128 v45 = *(_OWORD *)((char *)&v42->var5.var2 + 40);
      __int128 v47 = *(_OWORD *)&v42->var5.var2.var0[8];
      v37->var5.var0.var3 = v42->var5.var0.var3;
      *(_OWORD *)((char *)&v37->var5.var2 + 24) = v46;
      *(_OWORD *)((char *)&v37->var5.var2 + 40) = v45;
      *(_OWORD *)&v37->var5.var2.var0[8] = v47;
      v48 = &self->_events[v41];
      __int128 v49 = v56;
      *(_OWORD *)&v48->var0 = v55;
      *(_OWORD *)&v48->var2 = v49;
      v48->var5.var0.var3 = var3;
      __int128 v50 = v60;
      *(_OWORD *)((char *)&v48->var5.var2 + 24) = v59;
      *(_OWORD *)((char *)&v48->var5.var2 + 40) = v50;
      __int128 v51 = v58;
      *(_OWORD *)&v48->var4 = v57;
      *(_OWORD *)&v48->var5.var2.var0[8] = v51;
      ++cursor;
    }
  }

  else
  {
    unint64_t v9 = 0x1FFFFFFFFLL;
    while (1)
    {
      if (cursor < count)
      {
        uint64_t v10 = &self->_events[cursor].var1;
        while (1)
        {
          unint64_t v11 = *v10;
          v10 += 13;
          if (v11 > a3) {
            break;
          }
          if (count == ++cursor)
          {
            unint64_t cursor = count;
            break;
          }
        }
      }

      unint64_t v12 = cursor >= count ? count : cursor;
      uint64_t v13 = 104 * count - 96;
      while (count > cursor)
      {
        --count;
        unint64_t v14 = *(void *)((char *)&self->_events->var0 + v13);
        v13 -= 104LL;
        if (v14 <= a3)
        {
          unint64_t v12 = count + 1;
          break;
        }
      }

      if (cursor == v12) {
        break;
      }
      uint64_t v15 = self->_events;
      unint64_t v16 = &v15[cursor];
      __int128 v17 = *(_OWORD *)((char *)&v16->var5.var2 + 40);
      __int128 v59 = *(_OWORD *)((char *)&v16->var5.var2 + 24);
      __int128 v60 = v17;
      var3 = v16->var5.var0.var3;
      __int128 v18 = *(_OWORD *)&v16->var2;
      __int128 v55 = *(_OWORD *)&v16->var0;
      __int128 v56 = v18;
      __int128 v19 = *(_OWORD *)&v16->var5.var2.var0[8];
      __int128 v57 = *(_OWORD *)&v16->var4;
      __int128 v58 = v19;
      unint64_t count = v12 - 1;
      unint64_t v20 = v12 - 1;
      unint64_t v21 = &v15[v20];
      __int128 v23 = *(_OWORD *)&v21->var2;
      __int128 v22 = *(_OWORD *)&v21->var4;
      *(_OWORD *)&v16->var0 = *(_OWORD *)&v21->var0;
      *(_OWORD *)&v16->var2 = v23;
      *(_OWORD *)&v16->var4 = v22;
      __int128 v25 = *(_OWORD *)((char *)&v21->var5.var2 + 24);
      __int128 v24 = *(_OWORD *)((char *)&v21->var5.var2 + 40);
      __int128 v26 = *(_OWORD *)&v21->var5.var2.var0[8];
      v16->var5.var0.var3 = v21->var5.var0.var3;
      *(_OWORD *)((char *)&v16->var5.var2 + 24) = v25;
      *(_OWORD *)((char *)&v16->var5.var2 + 40) = v24;
      *(_OWORD *)&v16->var5.var2.var0[8] = v26;
      v27 = &self->_events[v20];
      __int128 v28 = v56;
      *(_OWORD *)&v27->var0 = v55;
      *(_OWORD *)&v27->var2 = v28;
      v27->var5.var0.var3 = var3;
      __int128 v29 = v60;
      *(_OWORD *)((char *)&v27->var5.var2 + 24) = v59;
      *(_OWORD *)((char *)&v27->var5.var2 + 40) = v29;
      __int128 v30 = v58;
      *(_OWORD *)&v27->var4 = v57;
      *(_OWORD *)&v27->var5.var2.var0[8] = v30;
      ++cursor;
    }
  }

  unint64_t v52 = self->_cursor;
  v53 = &self->_events[v52];
  __compar[0] = MEMORY[0x1895F87A8];
  __compar[1] = 3221225472LL;
  __compar[2] = __80___OSLogTracepointBuffer_finishedInsertingTracepointsWithNextMajorTime_options___block_invoke;
  __compar[3] = &__block_descriptor_40_e15_i24__0r_v8r_v16l;
  __compar[4] = v9;
  mergesort_b(v53, cursor - v52, 0x68uLL, __compar);
  self->_mutable = 0;
}

- (void)enumerateEventsFromTime:(unint64_t)a3 to:(unint64_t)a4 options:(unsigned int)a5 usingBlock:(id)a6
{
  char v6 = a5;
  __int128 v17 = (unsigned int (**)(id, void))a6;
  uint64_t v10 = self;
  if (v10->_mutable)
  {
    qword_18C695DA0 = (uint64_t)"BUG IN LIBTRACE: oltb iteration while mutable";
    __break(1u);
  }

  else
  {
    unint64_t v11 = v10;

    unint64_t cursor = v11->_cursor;
    unint64_t count = v11->_count;
    if (cursor < count)
    {
      uint64_t v14 = cursor;
      do
      {
        events = v11->_events;
        unint64_t var1 = events[v14].var1;
        if (var1 == a4) {
          break;
        }
        if ((v6 & 8) != 0)
        {
          if (var1 <= a4) {
            break;
          }
          ++v11->_cursor;
          if (var1 <= a3)
          {
LABEL_11:
            unint64_t count = v11->_count;
          }
        }

        else
        {
          if (var1 >= a4) {
            break;
          }
          ++v11->_cursor;
          if (var1 >= a3) {
            goto LABEL_11;
          }
        }

        ++cursor;
        ++v14;
      }

      while (cursor < count);
    }
  }

- (NSMutableOrderedSet)fileNames
{
  return self->_fileNames;
}

- (void).cxx_destruct
{
}

@end
}

LABEL_15:
  return v8;
}

  v9 = 0;
LABEL_16:

  return v9;
}
}

  v13 = location;
  v14 = length;
  result.length = v14;
  result.location = v13;
  return result;
}

  if (!CSIsNull())
  {
    SymbolWithName = CSSymbolOwnerGetSymbolWithName();
    v8 = v17;
    v17[4] = SymbolWithName;
    v8[5] = v9;
  }

  if (CSIsNull())
  {
    CSSymbolicatorForeachSymbolOwnerAtTime();
    if (CSIsNull())
    {
      SymbolWithNameAtTime = CSSymbolicatorGetSymbolWithNameAtTime();
      v11 = v17;
      v17[4] = SymbolWithNameAtTime;
      v11[5] = v12;
      if ((CSIsNull() & 1) == 0)
      {
        CSSymbolGetSymbolOwner();
        Name = (const char *)CSSymbolOwnerGetName();
        if (((CSIsNull() | !v4) & 1) == 0) {
          fprintf( (FILE *)*MEMORY[0x1895F89D0],  "Symbolication.framework _get_symbol_owner found requested symbol %s in unexpected non-Swift library %s\n",  a2,  Name);
        }
      }
    }
  }

  if ((CSIsNull() & 1) != 0)
  {
    if (v4) {
      fprintf( (FILE *)*MEMORY[0x1895F89D0],  "Symbolication.framework _get_symbol_owner did not find requested symbol %s\n",  a2);
    }
    Range = 0LL;
  }

  else
  {
    Range = CSSymbolGetRange();
  }

  _Block_object_dispose(&v16, 8);
  return Range;
}

    v31 = v5;
    goto LABEL_16;
  }

  v15 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
  if (v15) {
    -[VMUBacktrace initWithCoder:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
  }
LABEL_9:
  v31 = 0LL;
LABEL_16:

  return v31;
}

  return v23;
}

  pthread_rwlock_unlock(v8);
  return v9;
}

uint64_t _determine_pthread_offsets(uint64_t (*a1)())
{
  id v2 = objc_alloc_init(MEMORY[0x189603FC8]);
  v3 = (void *)gPthreadOffsets;
  gPthreadOffsets = (uint64_t)v2;

  pthread_t v4 = pthread_self();
  uint64_t v5 = 0LL;
  while (1)
  {
    v6 = *(uint64_t (**)())((char *)&v4->__sig + v5);
    if (v6 == _determine_pthread_offsets)
    {
      [MEMORY[0x189607968] numberWithLong:v5];
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      [(id)gPthreadOffsets setObject:v7 forKeyedSubscript:@"StartRoutineOffsetKey"];

      v6 = *(uint64_t (**)())((char *)&v4->__sig + v5);
    }

    if (v6 == a1) {
      break;
    }
    if (++v5 == 8184) {
      goto LABEL_8;
    }
  }

  [MEMORY[0x189607968] numberWithLong:v5];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)gPthreadOffsets setObject:v8 forKeyedSubscript:@"StartRoutineArgumentOffsetKey"];

LABEL_8:
  mach_msg_type_number_t thread_info_outCnt = 6;
  thread_inspect_t v9 = MEMORY[0x186E32954]();
  thread_info(v9, 4u, &thread_info_out, &thread_info_outCnt);
  uint64_t v10 = v18;
  uint64_t v11 = v18 - (void)v4 + 4088;
  [MEMORY[0x189607968] numberWithUnsignedLongLong:];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)gPthreadOffsets setObject:v12 forKeyedSubscript:@"FirstTLSslotKey"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:v11];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)gPthreadOffsets setObject:v13 forKeyedSubscript:@"LastTLSslotKey"];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:((v10 + *MEMORY[0x1895FD590] + 4087) & -*MEMORY[0x1895FD590]) - (void)v4];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)gPthreadOffsets setObject:v14 forKeyedSubscript:@"RegionEndOffsetKey"];

  return 0LL;
}

void sub_1860C7CAC(_Unwind_Exception *a1)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

LABEL_12:
  if ((*((_BYTE *)*v14 + 132) & 1) != 0)
  {
    v16 = v14 + 8;
    v17 = *(unsigned int *)(v4 + 40) - (((uint64_t)v14 - *(void *)(v4 + 32) + 64) >> 6);
    if (v17)
    {
      while (1)
      {
        uint64_t v18 = v17 >> 1;
        v19 = &v16[8 * (v17 >> 1)];
        if (*((void *)*v19 + 1) <= a2)
        {
          if (*((void *)*v19 + 2) + *((void *)*v19 + 1) > a2)
          {
            else {
              v17 = (unint64_t)v19;
            }
            break;
          }

          v16 = v19 + 8;
          uint64_t v18 = --v17 >> 1;
        }

        v15 = v17 > 1;
        v17 = v18;
        if (!v15)
        {
          v17 = 0LL;
          break;
        }
      }
    }

    if (v17) {
      v14 = (id *)v17;
    }
  }

  void *v7 = (((unint64_t)v14 - v9) >> 6) + 1;
  uint64_t v10 = *v14;
LABEL_25:
  v20 = [v10 descriptionWithOptions:513 maximumLength:0];
  v21 = *(void *)(*(void *)(a1 + 32) + 8LL);
  v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v20;

  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) UTF8String];
}

  if ((*((_BYTE *)*v14 + 132) & 1) != 0)
  {
    v16 = v14 + 8;
    v17 = *(unsigned int *)(v4 + 40) - (((uint64_t)v14 - *(void *)(v4 + 32) + 64) >> 6);
    if (v17)
    {
      while (1)
      {
        uint64_t v18 = v17 >> 1;
        v19 = &v16[8 * (v17 >> 1)];
        if (*((void *)*v19 + 1) <= a2)
        {
          if (*((void *)*v19 + 2) + *((void *)*v19 + 1) > a2)
          {
            else {
              v17 = (unint64_t)v19;
            }
            break;
          }

          v16 = v19 + 8;
          uint64_t v18 = --v17 >> 1;
        }

        v15 = v17 > 1;
        v17 = v18;
        if (!v15)
        {
          v17 = 0LL;
          break;
        }
      }
    }

    if (v17) {
      v14 = (id *)v17;
    }
  }

  void *v7 = (((unint64_t)v14 - v9) >> 6) + 1;
  uint64_t v10 = *v14;
LABEL_25:
  v20 = [v10 descriptionWithOptions:513 maximumLength:0];
  v21 = *(void *)(*(void *)(a1 + 32) + 8LL);
  v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v20;

  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) UTF8String];
}

      free(v6);
    }

    else
    {
      pthread_t v4 = (void *)objc_opt_new();
    }
  }

  return v4;
}

  v14 = 1LL;
LABEL_18:
  objc_autoreleasePoolPop(v8);

  return v14;
}

      free(v18);
      topLevel = (unsigned int *)self->_topLevel;
      if (*topLevel > a3) {
        *((_BYTE *)topLevel + (a3 >> 3) + 4) |= 1 << (a3 & 7);
      }
      v7 = v45;
      v30 = self->_deliveredReachable;
      v31 = *v30;
      if (*v30 >= *v15) {
        v31 = *v15;
      }
      v32 = (v31 + 7);
      if (v32 >= 8)
      {
        v33 = (char *)(v15 + 1);
        v34 = v30 + 1;
        v35 = v32 >> 3;
        do
        {
          v36 = *v33++;
          *v34++ |= v36;
          --v35;
        }

        while (v35);
      }

      v46[0] = v22;
      v46[1] = 3221225472LL;
      v47 = __60__VMUFlattenGraphEnumerator_enumerateEdgesOfNode_withBlock___block_invoke_2;
      v48 = &unk_189DFE3D8;
      v50 = a3;
      v49 = v45;
      v37 = v46;
      v38 = *v15;
      if (*v15)
      {
        v39 = 0;
        v40 = 1;
        do
        {
          v41 = (char *)v15 + (v39 >> 3);
          v42 = v41[4];
          v43 = v40;
          if (v41[4])
          {
            do
            {
              if ((v42 & 1) != 0) {
                v47((uint64_t)v37, v43 - 1);
              }
              if (v42 < 2) {
                break;
              }
              v42 >>= 1;
            }

            while (v43++ < v38);
          }

          v39 += 8;
          v40 += 8;
        }

        while (v39 < v38);
      }

      free(v15);
      self->_iteratingTopLevel = 0;

      _Block_object_dispose(&v57, 8);
    }
  }
}
  }

  return v10;
}

    uint64_t v5 = 0LL;
    location = -1LL;
    goto LABEL_13;
  }

  if (!(_DWORD)count) {
    goto LABEL_12;
  }
  uint64_t v5 = 0LL;
  p_length = &self->_ranges->length;
  location = -1LL;
  do
  {
    v7 = *(p_length - 1);
    if (v7 < location) {
      location = *(p_length - 1);
    }
    if (*p_length + v7 > v5) {
      uint64_t v5 = *p_length + v7;
    }
    p_length += 2;
    --count;
  }

  while (count);
LABEL_13:
  v8 = v5 - location;
  result.length = v8;
  result.location = location;
  return result;
}
}

  v15 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  *a2 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x189604DB0], buffer, 0x8000100u);
  result = CFStringCreateWithCString(v15, v10, 0x8000100u);
  *a4 = result;
  return result;
}

LABEL_2:
  LOBYTE(v3) = 1;
  return v3;
}

BOOL task_exists(void *a1)
{
  id v1 = a1;
  if ([v1 isCore])
  {
    BOOL v2 = 1LL;
  }

  else
  {
    mach_msg_type_number_t task_info_outCnt = 10;
    BOOL v2 = [v1 taskPort]
      && [v1 taskPort] != -1
      && task_info([v1 taskPort], 0x12u, task_info_out, &task_info_outCnt) == 0;
  }

  return v2;
}

uint64_t _task_peek_transformer_function(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (!a3)
  {
    uint64_t v5 = 0LL;
    uint64_t v6 = 0LL;
    if (!a4) {
      return v6;
    }
    goto LABEL_6;
  }

  uint64_t v5 = (*(uint64_t (**)(void))(s_peekBlock + 16))();
  if (v5) {
    uint64_t v6 = 0LL;
  }
  else {
    uint64_t v6 = 5LL;
  }
  if (a4) {
LABEL_6:
  }
    *a4 = v5;
  return v6;
}

void _withPeekTransformerFunctionForMemoryReader(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (_withPeekTransformerFunctionForMemoryReader_s_onceToken != -1) {
    dispatch_once(&_withPeekTransformerFunctionForMemoryReader_s_onceToken, &__block_literal_global_66);
  }
  uint64_t v5 = (dispatch_queue_s *)_withPeekTransformerFunctionForMemoryReader_s_peekingTransformerGuard;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = ___withPeekTransformerFunctionForMemoryReader_block_invoke_2;
  block[3] = &unk_189DFCEA8;
  id v9 = v3;
  id v10 = v4;
  id v6 = v4;
  id v7 = v3;
  dispatch_sync(v5, block);
}

void ___withPeekTransformerFunctionForMemoryReader_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("task peeking transformer guard queue", 0LL);
  id v1 = (void *)_withPeekTransformerFunctionForMemoryReader_s_peekingTransformerGuard;
  _withPeekTransformerFunctionForMemoryReader_s_peekingTransformerGuard = (uint64_t)v0;
}

void ___withPeekTransformerFunctionForMemoryReader_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x186E33044](*(void *)(a1 + 32));
  id v3 = (void *)s_peekBlock;
  s_peekBlock = v2;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  id v4 = (void *)s_peekBlock;
  s_peekBlock = 0LL;
}

void sub_1860C92FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t failingPeekFunction()
{
  return 5LL;
}

uint64_t _pointerRecorderBlockContextAdapter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a2 + 16))(a2, a3, a4, a5);
}

LABEL_41:
      NSLog( @"Out of memory: failed to expand %s from %u to %u entries",  "_blocks",  blocksSize,  self->_blocksSize);
      abort();
    }
  }

    v41 = 1LL;
    goto LABEL_43;
  }

  v41 = 2LL;
LABEL_43:

  return v41;
}

LABEL_6:
}
}

  if (v7)
  {
    if ([*(id *)(a1 + 32) usesLiteMode])
    {
      v12 = v7;
      if ([v12 hasPrefix:@"MallocStackLoggingLiteZone"])
      {
        v13 = [v12 hasPrefix:@"MallocStackLoggingLiteZone_Wrapper"];

        if ((v13 & 1) == 0) {
          goto LABEL_10;
        }
      }

      else
      {
      }

    LOBYTE(v9) = 0;
    goto LABEL_7;
  }

  v8 = (uint64_t *)v7();
  if (!v8) {
    goto LABEL_6;
  }
  id v9 = *v8;
LABEL_7:

  return v9 & 1;
}

LABEL_121:
    p_var0 = 0LL;
    goto LABEL_122;
  }

LABEL_113:
  v75 = (char *)v67 + 4 * (v72 & 0x7FFFF);
  v78 = *((_DWORD *)v75 + 16);
  v77 = v75 + 64;
  v76 = v78;
  v79 = v67->var4;
  if (v78)
  {
    p_var0 = &v79[(unint64_t)(v76 - 1)].var0;
    if (mallocZonesBufferAddress - *((void *)*p_var0 + 1) < *((void *)*p_var0 + 2)) {
      goto LABEL_122;
    }
  }

  v80 = v67->var5;
  if (!(_DWORD)v80) {
    goto LABEL_121;
  }
  v81 = v67->var4;
  while (2)
  {
    v82 = v80 >> 1;
    v83 = &v81[v80 >> 1].var0;
    if (*((void *)*v83 + 1) > mallocZonesBufferAddress)
    {
LABEL_120:
      v38 = v80 >= 2;
      v80 = v82;
      if (!v38) {
        goto LABEL_121;
      }
      continue;
    }

    break;
  }

  if (*((void *)*v83 + 2) + *((void *)*v83 + 1) <= mallocZonesBufferAddress)
  {
    v81 = (_VMURegionNode *)(v83 + 8);
    v82 = --v80 >> 1;
    goto LABEL_120;
  }

  v142 = [*v83 isSpecialPhysFootprintRegion];
  p_var0 = 0LL;
  if (v142) {
    v143 = 0LL;
  }
  else {
    v143 = v83;
  }
  if ((v142 & 1) != 0) {
    goto LABEL_122;
  }
  if ((*((_BYTE *)*v143 + 132) & 1) == 0) {
    goto LABEL_213;
  }
  v144 = v143 + 8;
  v145 = v67->var5 - (((char *)(v143 + 8) - (char *)v67->var4) >> 6);
  if (!v145) {
    goto LABEL_210;
  }
  while (2)
  {
    v146 = v145 >> 1;
    v147 = &v144[8 * (v145 >> 1)];
    if (*((void *)*v147 + 1) > mallocZonesBufferAddress)
    {
LABEL_205:
      v64 = v145 > 1;
      v145 = v146;
      if (!v64)
      {
        v145 = 0LL;
        goto LABEL_210;
      }

      continue;
    }

    break;
  }

  if (*((void *)*v147 + 2) + *((void *)*v147 + 1) <= mallocZonesBufferAddress)
  {
    v144 = v147 + 8;
    v146 = --v145 >> 1;
    goto LABEL_205;
  }

  else {
    v145 = (unint64_t)v147;
  }
LABEL_210:
  if (v145) {
    v83 = (id *)v145;
  }
  else {
    v83 = v143;
  }
LABEL_213:
  *v77 = ((unint64_t)((char *)v83 - (char *)v79) >> 6) + 1;
  p_var0 = v83;
LABEL_122:
  zonesCount = self->_zonesCount;
  p_var0[3] = (id)[*p_var0 address];
  p_var0[4] = (id)([*p_var0 address] + 8 * zonesCount);
LABEL_123:
  if (!self->_zonesCount) {
    goto LABEL_176;
  }
  v85 = 1LL;
  v86 = 8LL;
  do
  {
    v87 = [*(id *)((char *)&self->_zones->var0 + v86) hasPrefix:@"MallocHelperZone_0x"];
    v88 = v87;
    v89 = self->_zonesCount;
    if (v85 >= v89) {
      v90 = 1;
    }
    else {
      v90 = v87;
    }
    ++v85;
    v86 += 24LL;
  }

  while ((v90 & 1) == 0);
  if (!(_DWORD)v89) {
    goto LABEL_176;
  }
  v91 = 0LL;
  while (2)
  {
    v92 = (void *)v171[5];
    [MEMORY[0x189607968] numberWithUnsignedInt:v91];
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v92) = [v92 containsObject:v93];

    v94 = 0LL;
    v95 = self->_regionMap;
    v96 = v95->var6;
    v97 = v95->var7;
    v38 = v97 >= v96;
    v98 = v97 - v96;
    if (!v38) {
      goto LABEL_149;
    }
    var0 = self->_zones[v91].var0;
    if (var0 - v96 >= v98) {
      goto LABEL_149;
    }
    v100 = var0 >> *MEMORY[0x1895FD580];
    if (v100)
    {
      v101 = (unsigned int *)v95->var3;
      v102 = var0 >> *MEMORY[0x1895FD580];
      while (*v101 > (v102 & 0x3FFFFFF)
           && ((*((unsigned __int8 *)v101 + ((v102 & 0x3FFFFFF) >> 3) + 4) >> (v102 & 7)) & 1) != 0)
      {
        v102 >>= 26;
        if (!v102) {
          goto LABEL_140;
        }
      }

LABEL_148:
      v94 = 0LL;
      goto LABEL_149;
    }

LABEL_140:
    v103 = (char *)v95 + 4 * (v100 & 0x7FFFF);
    v106 = *((_DWORD *)v103 + 16);
    v105 = v103 + 64;
    v104 = v106;
    v107 = v95->var4;
    if (v106)
    {
      v94 = &v107[(unint64_t)(v104 - 1)].var0;
      if (var0 - *((void *)*v94 + 1) < *((void *)*v94 + 2)) {
        goto LABEL_149;
      }
    }

    v108 = v95->var5;
    if (!(_DWORD)v108) {
      goto LABEL_148;
    }
    v109 = v95->var4;
    while (2)
    {
      v110 = v108 >> 1;
      v111 = &v109[v108 >> 1].var0;
      if (*((void *)*v111 + 1) > var0)
      {
LABEL_147:
        v38 = v108 >= 2;
        v108 = v110;
        if (!v38) {
          goto LABEL_148;
        }
        continue;
      }

      break;
    }

    if (*((void *)*v111 + 2) + *((void *)*v111 + 1) <= var0)
    {
      v109 = (_VMURegionNode *)(v111 + 8);
      v110 = --v108 >> 1;
      goto LABEL_147;
    }

    v119 = [*v111 isSpecialPhysFootprintRegion];
    v94 = 0LL;
    if (v119) {
      v120 = 0LL;
    }
    else {
      v120 = v111;
    }
    if ((v119 & 1) != 0) {
      goto LABEL_149;
    }
    if ((*((_BYTE *)*v120 + 132) & 1) == 0) {
      goto LABEL_175;
    }
    v121 = v120;
    v122 = v120 + 8;
    v123 = v95->var5 - (((char *)(v120 + 8) - (char *)v95->var4) >> 6);
    if (!v123) {
      goto LABEL_172;
    }
    while (2)
    {
      v124 = v123 >> 1;
      v125 = &v122[8 * (v123 >> 1)];
      if (*((void *)*v125 + 1) > var0)
      {
LABEL_167:
        v64 = v123 > 1;
        v123 = v124;
        if (!v64)
        {
          v123 = 0LL;
          goto LABEL_172;
        }

        continue;
      }

      break;
    }

    if (*((void *)*v125 + 2) + *((void *)*v125 + 1) <= var0)
    {
      v122 = v125 + 8;
      v124 = --v123 >> 1;
      goto LABEL_167;
    }

    else {
      v123 = (unint64_t)v125;
    }
LABEL_172:
    if (v123) {
      v111 = (id *)v123;
    }
    else {
      v111 = v121;
    }
LABEL_175:
    *v105 = ((unint64_t)((char *)v111 - (char *)v107) >> 6) + 1;
    v94 = v111;
LABEL_149:
    if ([*v94 protection])
    {
      zones = self->_zones;
      v113 = (void *)zones[v91].var0;
      v114 = ((unint64_t)v113 + *MEMORY[0x1895FD590] + 199) & -*MEMORY[0x1895FD590];
      v94[3] = v113;
      v94[4] = (id)v114;
      if (v88)
      {
        if ([zones[v91].var1 hasPrefix:@"DefaultMallocZone_0x"])
        {
          v115 = v94[8];
          if (*((void *)*v94 + 2) + *((void *)*v94 + 1) == v115[1]
            && [v115 protection] == 3)
          {
            [v94[8] type];
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            v117 = [v116 isEqualToString:@"MALLOC metadata"];

            if (v117)
            {
              v118 = (id *)((char *)v94[8] + 8);
              v94[11] = *v118;
              v94[12] = (char *)*v118 + (void)v118[1];
            }
          }
        }
      }
    }

  if (v12) {
    free(v12);
  }
  if ((CSIsNull() & 1) == 0) {
    CSRelease();
  }
}

LABEL_156:
    break;
  }

LABEL_176:
  if (!s_enumeratorDebugging)
  {
    v126 = self->_regionsCount;
    goto LABEL_178;
  }

  fwrite("Region state after claims:\n", 0x1BuLL, 1uLL, (FILE *)*MEMORY[0x1895F89D0]);
  if (self->_regionsCount)
  {
    v148 = 0LL;
    v149 = 0LL;
    do
    {
      v165 = (FILE *)*MEMORY[0x1895F89D0];
      v163 = [self->_regions[v148].var0 address];
      v150 = self->_regions[v148].var0;
      v151 = v150[2];
      v161 = v150[1];
      v152 = *((unsigned int *)v150 + 6);
      v162 = vm_prot_strings[v152];
      v153 = VMUExclaveOrDarwinRegionTypeDescriptionForTagShareProtAndPager( *((unsigned __int8 *)v150 + 232),  *((unsigned __int8 *)v150 + 104),  *((unsigned __int8 *)v150 + 50),  v152,  *((unsigned __int8 *)v150 + 49));
      v154 = (const char *)[v153 UTF8String];
      v155 = &self->_regions[v148];
      v156 = *((void *)v155->var0 + 2) >> *MEMORY[0x1895FD580];
      if (v156 == 1) {
        v157 = "page";
      }
      else {
        v157 = "pages";
      }
      v158 = "";
      if (v155->var4 == v155->var5) {
        v159 = "";
      }
      else {
        v159 = " [root]";
      }
      v160 = *((_DWORD *)v155->var0 + 37);
      if (v160 < self->_zonesCount) {
        v158 = (const char *)[self->_zones[v160].var1 UTF8String];
      }
      fprintf( v165,  "region: [%#llx-%#llx] %s %s (%llu %s)%s  %s\n",  v163,  v151 + v161,  v162,  v154,  v156,  v157,  v159,  v158);

      ++v149;
      v126 = self->_regionsCount;
      ++v148;
    }

    while (v149 < v126);
LABEL_178:
    if (v126)
    {
      for (i = 0LL; i < v126; ++i)
      {
        v128 = self->_regions;
        if (v128[i].var4 < v128[i].var5)
        {
          blocksCount = self->_blocksCount;
          blocksSize = self->_blocksSize;
          if (blocksSize <= blocksCount)
          {
            else {
              v131 = 2 * blocksSize;
            }
            do
            {
              v132 = v131;
              v131 *= 2;
            }

            while (v132 < blocksCount);
            self->_blocksSize = v132;
            v133 = (_VMUBlockNode *)realloc(self->_blocks, 16LL * v132);
            self->_blocks = v133;
            if (!v133)
            {
              NSLog( @"Out of memory: failed to expand %s from %u to %u entries",  "_blocks",  blocksSize,  self->_blocksSize);
              abort();
            }

            v128 = self->_regions;
          }

          v134 = v128[i].var0;
          else {
            v135 = 5LL;
          }
          v136 = &self->_blocks[self->_blocksCount];
          v137 = &self->_regions[i];
          v138 = v137->var4;
          v139 = v135 & 0xFFFFFFE00000001FLL | (32LL * (LODWORD(v137->var5) - v138)) | (i << 41);
          v136->var0 = v138;
          *((void *)v136 + 1) = v139;
          ++self->_blocksCount;

          v126 = self->_regionsCount;
        }
      }
    }
  }

  v26 = v167;
  if (-[VMUTaskMemoryScanner objectContentLevel](self, "objectContentLevel") == 2)
  {
    v140 = -[VMUTaskMemoryScanner _readonlyRegionRanges](self, "_readonlyRegionRanges");
    -[VMUObjectIdentifier setReadonlyRegionRanges:](self->_objectIdentifier, "setReadonlyRegionRanges:", v140);
  }

LABEL_195:
  _Block_object_dispose(&v170, 8);
  return v26;
}

void sub_1860CB0A8(_Unwind_Exception *a1)
{
}

LABEL_36:
                            v47 = v40 + 4 * (v44 & 0x7FFFF);
                            v50 = *(_DWORD *)(v47 + 64);
                            v49 = (_DWORD *)(v47 + 64);
                            v48 = v50;
                            if (v50)
                            {
                              v30 = *(void *)(v40 + 32) + ((unint64_t)(v48 - 1) << 6);
                              if (v11 - *(void *)(*(void *)v30 + 8LL) < *(void *)(*(void *)v30 + 16LL)) {
                                continue;
                              }
                            }

                            break;
                          }

                          v51 = *(unsigned int *)(v40 + 40);
                          if (!(_DWORD)v51) {
                            goto LABEL_81;
                          }
                          v52 = *(void *)(v40 + 32);
                          while (1)
                          {
                            v53 = v51 >> 1;
                            v30 = v52 + (v51 >> 1 << 6);
                            if (*(void *)(*(void *)v30 + 8LL) <= v11)
                            {
                              if (*(void *)(*(void *)v30 + 16LL) + *(void *)(*(void *)v30 + 8LL) > v11)
                              {
                                v87 = *(void *)(v40 + 32);
                                v54 = [*(id *)v30 isSpecialPhysFootprintRegion];
                                v55 = v87;
                                if (v54) {
                                  v56 = 0LL;
                                }
                                else {
                                  v56 = v30;
                                }
                                if ((v54 & 1) != 0) {
                                  goto LABEL_81;
                                }
                                if ((*(_BYTE *)(*(void *)v56 + 132LL) & 1) == 0) {
                                  goto LABEL_62;
                                }
                                v57 = (id *)(v56 + 64);
                                v58 = *(unsigned int *)(v40 + 40) - ((uint64_t)(v56 + 64 - *(void *)(v40 + 32)) >> 6);
                                if (!v58) {
                                  goto LABEL_59;
                                }
                                while (2)
                                {
                                  v59 = v58 >> 1;
                                  v60 = &v57[8 * (v58 >> 1)];
                                  if (*((void *)*v60 + 1) > v11)
                                  {
LABEL_54:
                                    v61 = v58 > 1;
                                    v58 = v59;
                                    if (!v61)
                                    {
                                      v58 = 0LL;
                                      goto LABEL_59;
                                    }

                                    continue;
                                  }

                                  break;
                                }

                                if (*((void *)*v60 + 2) + *((void *)*v60 + 1) <= v11)
                                {
                                  v57 = v60 + 8;
                                  v59 = --v58 >> 1;
                                  goto LABEL_54;
                                }

                                v62 = v56;
                                v63 = [*v60 isSpecialPhysFootprintRegion];
                                v56 = v62;
                                v55 = v87;
                                if (v63) {
                                  v58 = 0LL;
                                }
                                else {
                                  v58 = (unint64_t)v60;
                                }
LABEL_59:
                                if (v58) {
                                  v30 = v58;
                                }
                                else {
                                  v30 = v56;
                                }
LABEL_62:
                                *v49 = ((v30 - v55) >> 6) + 1;
                                goto LABEL_22;
                              }

                              v52 = v30 + 64;
                              v53 = --v51 >> 1;
                            }

                            v20 = v51 >= 2;
                            v51 = v53;
                            if (!v20) {
                              goto LABEL_81;
                            }
                          }
                        }

                        v75 = v78 + 8;
                        v77 = --v76 >> 1;
                      }

                      v61 = v76 > 1;
                      v76 = v77;
                      if (!v61)
                      {
                        v76 = 0LL;
                        goto LABEL_93;
                      }
                    }
                  }

                  break;
                }

                v71 = v30 + 64;
                v72 = --v70 >> 1;
              }

              v20 = v70 >= 2;
              v70 = v72;
            }

            while (v20);
          }
        }
      }

LABEL_81:
      ++v7;
    }

    while (v7 != v93);
  }

LABEL_40:
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
      {
        v48 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 208) + 24 * a2 + 8) UTF8String];
        v49 = VMUMallocRangeTypeString(1);
        v50 = *v16;
        v51 = *(void *)(a4 + 16 * v14 + 8);
        *(_DWORD *)buf = 136315906;
        v73 = v48;
        v74 = 2080;
        v75 = v49;
        v76 = 2048;
        v77 = v50;
        v78 = 2048;
        v79 = v51;
        _os_log_error_impl( &dword_1860C5000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "error: zone enumerator for %s reported '%s' %#llx (%llu bytes), in non-existent region, ignoring block.",  buf,  0x2Au);
      }

      goto LABEL_42;
    }

  -[VMUProcessDescription cleansePathsIncludingBinaryImageList:](v2, "cleansePathsIncludingBinaryImageList:", 1LL);
  -[VMUProcessDescription clearCrashReporterInfo](v2, "clearCrashReporterInfo");
  return v2->_sortedBinaryImages;
}

  ++*(void *)(a1 + 24);
  return v13;
}

  ++*(void *)(a1 + 24);
  return v14;
}

LABEL_18:
    v25 = v15 + 4 * (v22 & 0x7FFFF);
    v28 = *(_DWORD *)(v25 + 64);
    v27 = (_DWORD *)(v25 + 64);
    v26 = v28;
    v29 = *(void *)(v15 + 32);
    if (v28)
    {
      v30 = (id *)(v29 + ((unint64_t)(v26 - 1) << 6));
      if (v21 - *((void *)*v30 + 1) < *((void *)*v30 + 2)) {
        goto LABEL_20;
      }
    }

    v43 = *(unsigned int *)(v15 + 40);
    if (!(_DWORD)v43) {
      goto LABEL_40;
    }
    v44 = *(id **)(v15 + 32);
    while (1)
    {
      v45 = v43 >> 1;
      v30 = &v44[8 * (v43 >> 1)];
      if (*((void *)*v30 + 1) <= v21) {
        break;
      }
LABEL_34:
      v19 = v43 >= 2;
      v43 = v45;
      if (!v19) {
        goto LABEL_40;
      }
    }

    if (*((void *)*v30 + 2) + *((void *)*v30 + 1) <= v21)
    {
      v44 = v30 + 8;
      v45 = --v43 >> 1;
      goto LABEL_34;
    }

    v46 = [*v30 isSpecialPhysFootprintRegion];
    if (v46) {
      v47 = 0LL;
    }
    else {
      v47 = v30;
    }
    if ((v46 & 1) != 0) {
      goto LABEL_40;
    }
    if ((*((_BYTE *)*v47 + 132) & 1) == 0) {
      goto LABEL_57;
    }
    v52 = v47 + 8;
    v53 = *(unsigned int *)(v15 + 40) - (((uint64_t)v47 - *(void *)(v15 + 32) + 64) >> 6);
    if (!v53) {
      goto LABEL_54;
    }
    while (2)
    {
      v54 = v53 >> 1;
      v55 = &v52[8 * (v53 >> 1)];
      if (*((void *)*v55 + 1) > v21)
      {
LABEL_49:
        v56 = v53 > 1;
        v53 = v54;
        if (!v56)
        {
          v53 = 0LL;
          goto LABEL_54;
        }

        continue;
      }

      break;
    }

    if (*((void *)*v55 + 2) + *((void *)*v55 + 1) <= v21)
    {
      v52 = v55 + 8;
      v54 = --v53 >> 1;
      goto LABEL_49;
    }

    v57 = v47;
    v58 = [*v55 isSpecialPhysFootprintRegion];
    v47 = v57;
    if (v58) {
      v53 = 0LL;
    }
    else {
      v53 = (unint64_t)v55;
    }
LABEL_54:
    if (v53) {
      v47 = (id *)v53;
    }
    v30 = v47;
LABEL_57:
    *v27 = (((unint64_t)v47 - v29) >> 6) + 1;
LABEL_20:
    if (*((_DWORD *)*v30 + 37) != (_DWORD)a2)
    {
      if (s_enumeratorDebugging)
      {
        v70 = (FILE *)*MEMORY[0x1895F89D0];
        v68 = (const char *)objc_msgSend( objc_retainAutorelease(*(id *)(*(void *)(*(void *)(a1 + 32) + 208)
                                                           + 24LL * a2
                                                           + 8)),
                              "UTF8String");
        v59 = VMUMallocRangeTypeString(1);
        v60 = *v16;
        v61 = *(void *)(a4 + 16 * v14 + 8);
        v63 = *((void *)*v30 + 1);
        v62 = *((void *)*v30 + 2);
        v64 = *((_DWORD *)*v30 + 37);
        v65 = *(void *)(a1 + 32);
        v66 = "<unclaimed>";
        if (v64 < *(_DWORD *)(v65 + 216))
        {
          v67 = v59;
          v66 = (const char *)[*(id *)(*(void *)(v65 + 208) + 24 * v64 + 8) UTF8String];
          v59 = v67;
        }

        fprintf( v70,  "warning: zone enumerator for %s reported '%s' %#llx (%llu bytes) in region: [%#llx-%#llx] %s\n",  v68,  v59,  v60,  v61,  v63,  v62 + v63,  v66);
      }

      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
      {
        v69 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 208) + 24 * a2 + 8) UTF8String];
        v31 = VMUMallocRangeTypeString(1);
        v32 = *v16;
        v33 = *(void *)(a4 + 16 * v14 + 8);
        v34 = *v30;
        v35 = (uint64_t *)((char *)*v30 + 8);
        v36 = *v35;
        v37 = v35[1];
        v38 = v34[37];
        v39 = *(void *)(a1 + 32);
        v40 = "<unclaimed>";
        if (v38 < *(_DWORD *)(v39 + 216)) {
          v40 = (const char *)[*(id *)(*(void *)(v39 + 208) + 24 * v38 + 8) UTF8String];
        }
        *(_DWORD *)buf = 136316674;
        v73 = v69;
        v74 = 2080;
        v75 = v31;
        v76 = 2048;
        v77 = v32;
        v78 = 2048;
        v79 = v33;
        v80 = 2048;
        v81 = v36;
        v82 = 2048;
        v83 = v37 + v36;
        v84 = 2080;
        v85 = v40;
        _os_log_impl( &dword_1860C5000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "warning: zone enumerator for %s reported '%s' %#llx (%llu bytes) in region: [%#llx-%#llx] %s",  buf,  0x48u);
      }
    }

    v42 = *(void *)(a4 + 16 * v14 + 8);
    if (v42 >= 0xFFFFFFFFFLL) {
      v42 = 0xFFFFFFFFFLL;
    }
    *v41 = *v16;
    v41[1] = (a2 << 41) | (32 * v42) | 9;
    ++*(_DWORD *)(*(void *)(a1 + 32) + 88LL);
LABEL_42:
    ++v14;
  }

  while (v14 != a5);
}

  [v3 appendString:@"  DIRTY"];
  if ((a1 & 0x10) == 0)
  {
LABEL_6:
    if ((a1 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }

  objc_autoreleasePoolPop(v2);
}

          ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
          goto LABEL_19;
        }

        NSLog(&CFSTR("SYMBOLICATION_DEBUG_SWIFT_REMOTE_MIRROR: libswiftCore is in App bundle. Its corresponding remote mirror m"
                     "ay not be in the trust cache. Skipping.").isa);
      }
    }

      uint64_t v11 = 0LL;
      goto LABEL_21;
    }

    goto LABEL_11;
  }

  CSSymbolicatorGetSymbolOwnerWithNameAtTime();
  v23 = a6;
  [v9 processDescription];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [v12 valueForEnvVar:@"DYLD_IMAGE_SUFFIX"];
  v14 = (const char *)[v13 UTF8String];

  if (v14)
  {
    snprintf(__str, 0x7FuLL, "libsystem_malloc%s.dylib", v14);
    CSSymbolicatorGetSymbolOwnerWithNameAtTime();
  }

  a6 = v23;
  if (!CSIsNull())
  {
LABEL_11:
    CSSymbolOwnerGetSymbolWithMangledName();
    Range = CSSymbolGetRange();
    CSSymbolOwnerGetSymbolWithMangledName();
    v16 = CSSymbolGetRange();
    *(void *)__str = 0LL;
    [v9 memoryCache];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v17 peekAtAddress:v16 size:4 returnsBuf:__str];

    if (!(_DWORD)v18)
    {
      v19 = **(_DWORD **)__str;
      *a5 = **(_DWORD **)__str;
      if (!v19)
      {
        uint64_t v11 = 1LL;
        goto LABEL_21;
      }

      v24 = 0LL;
      [v9 memoryCache];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = [v20 peekAtAddress:Range size:8 returnsBuf:&v24];

      uint64_t v11 = (_DWORD)v21 == 0;
      if (!(_DWORD)v21)
      {
        *a4 = *v24;
        goto LABEL_21;
      }

      [MEMORY[0x189NSStringormat:@"error %d reading zones_address at %qx" v21, Range];
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      if (!a6) {
        goto LABEL_21;
      }
      goto LABEL_13;
    }

    [MEMORY[0x189NSStringormat:@"error %d reading num_zones at %qx" v18, v16];
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = 0LL;
    if (a6)
    {
LABEL_13:
      *a6 = v10;
      goto LABEL_21;
    }

    goto LABEL_21;
  }

  if (!v23) {
    goto LABEL_18;
  }
  uint64_t v11 = 0LL;
  *v23 = @"couldn't find libsystem_malloc dylib in target task";
LABEL_21:

  return v11;
}

      ++v5;
      if (!--v8) {
        return nextNodeName;
      }
    }

    *((_BYTE *)v16 + v17) = v18 | v19;
LABEL_17:
    --self->_nodeCount;
    -[VMUDirectedGraph _internalAddEdgeFromNode:toNode:withName:]( (void **)&self->super.isa,  nextNodeName,  *v5,  0xFFFFFFFE);
    goto LABEL_18;
  }

  return nextNodeName;
}

LABEL_72:
}

void sub_1860CE5E4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t _debugSwiftAsyncPrintfIsEnabled()
{
  return _debugSwiftAsyncPrintfIsEnabled_enabled;
}

const char *___debugSwiftAsyncPrintfIsEnabled_block_invoke()
{
  result = getenv("SYMBOLICATION_DEBUG_SWIFT_ASYNC");
  if (result)
  {
    uint64_t v1 = result;
    result = (const char *)strcmp(result, "YES");
  }

  return result;
}

uint64_t _debugSwiftAsyncPrintf(int a1, char *a2, ...)
{
  if (a1)
  {
    int v3 = a1;
    id v4 = (FILE **)MEMORY[0x1895F89D0];
    do
    {
      fwrite("  ", 2uLL, 1uLL, *v4);
      --v3;
    }

    while (v3);
  }

  return vfprintf((FILE *)*MEMORY[0x1895F89D0], a2, va);
}

LABEL_31:
  v29 = 0LL;
  return v29;
}

    LOBYTE(a_Block_object_dispose(va, 8) = 0;
    goto LABEL_32;
  }

  if (a8)
  {
    v24 = @"Nothing to symbolicate. All addresses in the memgraph are already symbolicated.";
    if (os_variant_has_internal_content())
    {
      @"Nothing to symbolicate. All addresses in the memgraph are already symbolicated.\n\nIf after processing this memgraph with other cli tools you still see non-symbolicated addresses for some binary images, please file a Radar to 'Symbolication | Xcode' and attach the memgraph and the non-symbolicated output of interest."
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    v25 = (void *)MEMORY[0x189607870];
    v51 = *MEMORY[0x1896075E0];
    v52[0] = v24;
    [MEMORY[0x189603F68] dictionaryWithObjects:v52 forKeys:&v51 count:1];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 errorWithDomain:@"Memgraph Resymbolication Error" code:0 userInfo:v26];
    *a8 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_31;
  }

  if (a4 && v20) {
    *a4 = v20;
  }

  return v20 == 0LL;
}

LABEL_50:
  }

void sub_1860D0B58( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

LABEL_116:
                  v76 = v82;
                  if (v77 > v73) {
                    goto LABEL_192;
                  }
                  goto LABEL_88;
                }

                v124 = v127 + 8;
                v126 = --v125 >> 1;
              }

              v145 = v125 > 1;
              v125 = v126;
              if (!v145)
              {
                v125 = 0LL;
                goto LABEL_176;
              }
            }
          }

          v119 = v102 + 64;
          v120 = --v118 >> 1;
        }

        v146 = v118 >= 2;
        v118 = v120;
        if (!v146) {
          goto LABEL_116;
        }
      }
    }

LABEL_13:
    if (a7 && *(_BYTE *)(a1 + 360))
    {
      v20 = (((_DWORD)a3 + 7) & 0xFFFFFFF8) - a3;
      v21 = (v20 + 8);
      if (v21 > a5) {
        goto LABEL_193;
      }
      v227 = a2 + a3;
      while (1)
      {
        v22 = v20;
        v20 = v21;
        [a7 getLeafFieldAtOffset:v22 leafOffset:&v231];
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v231 + 8;
        v25 = *(void *)(v227 + v22);
        v26 = *(void *)(a1 + 8);
        v221 = *(void *)(*(void *)(a1 + 80) + 16LL * a4);
        v225 = [v23 scanType];
        v27 = *(uint64_t **)(a1 + 112);
        if (v27[6] > v25) {
          goto LABEL_19;
        }
        v28 = -[VMUTask ptrauthStripDataPointer:](v26, v25);
        v29 = v27[6];
        v30 = v27[7];
        v146 = v30 >= v29;
        v31 = v30 - v29;
        if (!v146) {
          goto LABEL_19;
        }
        v32 = v28;
        if (v28 - v29 >= v31) {
          goto LABEL_19;
        }
        v33 = v28 >> *MEMORY[0x1895FD580];
        if (v33)
        {
          v34 = (unsigned int *)v27[3];
          v35 = v28 >> *MEMORY[0x1895FD580];
          do
          {
            if (*v34 <= (v35 & 0x3FFFFFF)
              || ((*((unsigned __int8 *)v34 + ((v35 & 0x3FFFFFF) >> 3) + 4) >> (v35 & 7)) & 1) == 0)
            {
              goto LABEL_19;
            }

            v35 >>= 26;
          }

          while (v35);
        }

        v36 = (uint64_t)v27 + 4 * (v33 & 0x7FFFF);
        v39 = *(_DWORD *)(v36 + 64);
        v38 = (_DWORD *)(v36 + 64);
        v37 = v39;
        if (v39)
        {
          v40 = v27[4] + ((unint64_t)(v37 - 1) << 6);
          if (v28 - *(void *)(*(void *)v40 + 8LL) < *(void *)(*(void *)v40 + 16LL)) {
            goto LABEL_31;
          }
        }

        v56 = *((unsigned int *)v27 + 10);
        if (!(_DWORD)v56) {
          goto LABEL_19;
        }
        v57 = v27[4];
        while (1)
        {
          v58 = v56 >> 1;
          v40 = v57 + (v56 >> 1 << 6);
          if (*(void *)(*(void *)v40 + 8LL) <= v28) {
            break;
          }
LABEL_54:
          v146 = v56 >= 2;
          v56 = v58;
          if (!v146) {
            goto LABEL_19;
          }
        }

        if (*(void *)(*(void *)v40 + 16LL) + *(void *)(*(void *)v40 + 8LL) <= v28) {
          break;
        }
        v219 = v27[4];
        v59 = [*(id *)v40 isSpecialPhysFootprintRegion];
        v60 = v219;
        if (v59) {
          v61 = 0LL;
        }
        else {
          v61 = v40;
        }
        if ((v59 & 1) != 0) {
          goto LABEL_19;
        }
        if ((*(_BYTE *)(*(void *)v61 + 132LL) & 1) == 0) {
          goto LABEL_82;
        }
        v62 = (id *)(v61 + 64);
        v63 = *((unsigned int *)v27 + 10) - ((uint64_t)(v61 + 64 - v27[4]) >> 6);
        if (!v63) {
          goto LABEL_79;
        }
        while (2)
        {
          v64 = v63 >> 1;
          v65 = &v62[8 * (v63 >> 1)];
          if (*((void *)*v65 + 1) > v32)
          {
LABEL_65:
            v145 = v63 > 1;
            v63 = v64;
            if (!v145)
            {
              v63 = 0LL;
              goto LABEL_79;
            }

            continue;
          }

          break;
        }

        if (*((void *)*v65 + 2) + *((void *)*v65 + 1) <= v32)
        {
          v62 = v65 + 8;
          v64 = --v63 >> 1;
          goto LABEL_65;
        }

        v212 = v61;
        v70 = [*v65 isSpecialPhysFootprintRegion];
        v61 = v212;
        v60 = v219;
        if (v70) {
          v63 = 0LL;
        }
        else {
          v63 = (unint64_t)v65;
        }
LABEL_79:
        if (v63) {
          v61 = v63;
        }
        v40 = v61;
LABEL_82:
        *v38 = ((v61 - v60) >> 6) + 1;
LABEL_31:
        v41 = *(_DWORD *)(v40 + 20);
        if (v41)
        {
          v42 = *(void *)(v40 + 8);
          v43 = *v27;
          v44 = *(unsigned int *)(v40 + 16);
          v45 = (unint64_t *)(*v27 + 16 * v44);
          if (v42)
          {
            if (*v45 > v32) {
              goto LABEL_19;
            }
            v46 = (void *)(v43 + 16LL * (v41 + v44 - 1));
            if (((v46[1] >> 5) & 0xFFFFFFFFFuLL) + *v46 <= v32) {
              goto LABEL_19;
            }
            v47 = (unsigned int *)(v42 + 4 * ((v32 - (*v45 & -*MEMORY[0x1895FD590])) >> *MEMORY[0x1895FD580]));
            v48 = *v47;
            v49 = (unint64_t *)(v43 + 16 * v48);
            if (*v49 > v32) {
              goto LABEL_19;
            }
            v50 = v47[1];
            if (v50 < *((_DWORD *)v27 + 2))
            {
              v51 = (unint64_t *)(v43 + 16 * v50);
              v52 = *v51;
              if (*v51 <= v32)
              {
LABEL_67:
                v66 = v51[1];
                if ((v66 & 7) - 2 < 3) {
                  goto LABEL_19;
                }
                v67 = ((unint64_t)v51 - v43) >> 4;
                v68 = v27[2];
                if (v32 - v52 >= v68)
                {
                  if (((v66 >> 5) & 0xFFFFFFFFFLL) - (v32 - v52) > v68 || (_DWORD)v67 == -1) {
                    goto LABEL_19;
                  }
                }

                else if ((_DWORD)v67 == -1)
                {
                  goto LABEL_19;
                }

                (*(void (**)(uint64_t, void, uint64_t, void))(a9 + 16))( a9,  a4,  a3 + v22 + v221,  v225);
                goto LABEL_19;
              }
            }

            v53 = v50 - v48;
            if (v53)
            {
              do
              {
                v54 = v53 >> 1;
                v51 = &v49[2 * v54];
                v52 = *v51;
                if (*v51 <= v32)
                {
                  if (((v49[2 * v54 + 1] >> 5) & 0xFFFFFFFFFLL) + v52 > v32) {
                    goto LABEL_67;
                  }
                  v49 = v51 + 2;
                  LODWORD(v54) = --v53 >> 1;
                }

                v146 = v53 >= 2;
                v53 = v54;
              }

              while (v146);
            }
          }

          else
          {
            do
            {
              v55 = v41 >> 1;
              v51 = &v45[2 * v55];
              v52 = *v51;
              if (*v51 <= v32)
              {
                if (((v45[2 * v55 + 1] >> 5) & 0xFFFFFFFFFLL) + v52 > v32) {
                  goto LABEL_67;
                }
                v45 = v51 + 2;
                LODWORD(v55) = --v41 >> 1;
              }

              v146 = v41 >= 2;
              v41 = v55;
            }

            while (v146);
          }
        }
}

  uint64_t v13 = 0LL;
LABEL_61:

  return v13;
}

  free(v12);
}

  [(id)objc_opt_class() nodeWithName:v10 address:a4 count:0 numBytes:0];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMUCallTreeNode addChild:](self, "addChild:", v14);
LABEL_17:

  return v14;
}

        v21 = -[VMUProcessDescription initWithTask:getBinariesList:]( objc_alloc(&OBJC_CLASS___VMUProcessDescription),  "initWithTask:getBinariesList:",  v13->_task,  1LL);
        processDescription = v13->_processDescription;
        v13->_processDescription = v21;

        v23 = v13->_processDescription;
        if (v23 && !-[VMUProcessDescription pid](v23, "pid"))
        {
          v24 = v13->_processDescription;
          v13->_processDescription = 0LL;
        }

        goto LABEL_16;
      }
    }

    else if ((a7 & 0x20) != 0)
    {
      goto LABEL_6;
    }

    if (v11)
    {
      v16 = [v11 copy];
      processName = v13->_processName;
      v13->_processName = (NSString *)v16;
    }

    else
    {
      processName = -[VMUProcInfo userAppName](v15, "userAppName");
      [processName lastPathComponent];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = [v18 copy];
      v20 = v13->_processName;
      v13->_processName = (NSString *)v19;
    }

    if ((a7 & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_13;
  }

  return v11;
}
}
    }

    while ((_DWORD)v6);
  }
}

    uint64_t v11 = v9;
    [*(id *)(a1 + 40) member:v7];
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      [*(id *)(a1 + 40) addObject:v7];
      v16 = v7;
    }

    setTypeAndPath(*(void **)(a1 + 48), *(void **)(a1 + 56), Range, v5, v16, v11, 1, 1LL);

    goto LABEL_16;
  }

  uint64_t v13 = v5;
LABEL_14:
  uint64_t v14 = v13;

  return v14;
}

LABEL_19:
        v21 = (v20 + 8);
        if (v21 > a5)
        {
LABEL_193:

          return;
        }
      }

      v57 = v40 + 64;
      v58 = --v56 >> 1;
      goto LABEL_54;
    }

    if ((*(_BYTE *)(a1 + 376) & 2) == 0) {
      goto LABEL_193;
    }
    v71 = (unint64_t *)(a2 + a3);
    if (a6) {
      v72 = *(void **)(*(void *)(a1 + 256) + 8LL * a6);
    }
    else {
      v72 = 0LL;
    }
    v226 = v72;
    if ((*(_DWORD *)(*(void *)(a1 + 80) + 16LL * a4 + 8) & 7u) - 2 < 3
      || (v133 = *(_DWORD *)(a1 + 356)) != 0 && v133 == a4)
    {
      v134 = 0LL;
      v135 = 1;
    }

    else
    {
      v230 = 0;
      v134 = -[VMUTaskMemoryScanner getCachedScanInfoForClassWithIsa:classInfo:returnedShouldApplySwiftPointerMaskingToIsa:]( a1,  a6,  v226,  &v230);
      v135 = v230 != 0;
    }

    v208 = v135;
    v136 = (unint64_t)v71 + a5 - 8;
    if (*(_DWORD *)(a1 + 300))
    {
      v224 = *(void *)([*(id *)(a1 + 64) autoreleasePoolPageLayout] + 16);
      v217 = *(unsigned int *)([*(id *)(a1 + 64) autoreleasePoolPageLayout] + 8);
    }

    else
    {
      v224 = 0LL;
      v217 = 0LL;
    }

    v209 = v18;
    v137 = 0;
    v229 = a8;
    v214 = a2;
    v210 = (uint64_t)v71 + a5 - 8;
LABEL_196:
    v138 = (char *)v71 - a2;
    v139 = (char *)v71 + *(void *)(*(void *)(a1 + 80) + 16LL * a4) - a2;
    v140 = *v71;
    if (!*v71)
    {
      if (*(_DWORD *)(a1 + 300)) {
        v146 = (unint64_t)v138 >= v217;
      }
      else {
        v146 = 0;
      }
      if (v146) {
        (*(void (**)(uint64_t, void, char *, uint64_t))(a9 + 16))(a9, a4, v139, 1LL);
      }
      goto LABEL_245;
    }

    if (v218)
    {
      v141 = v208;
      if (v134) {
        v142 = v208;
      }
      else {
        v142 = 1;
      }
      if ((v142 & 1) == 0)
      {
        do
        {
          v143 = *(_DWORD *)(v134 + 4LL * v137);
          v144 = *(void *)&v143 & 0xFFFFFFLL;
          ++v137;
          v145 = (v143 & 0xFFFFFF) != 0xFFFFFF && (unint64_t)v138 > v144;
        }

        while (v145);
        --v137;
        if ((_DWORD)v144 == 0xFFFFFF)
        {
          v134 = 0LL;
          v141 = 0;
        }

        else
        {
          v141 = v138 == (char *)v144 && v143 < 0;
        }
      }

      if (v226
        && v138 == (char *)8
        && [v226 infoType] == 8
        && [v226 usesSwiftRefcounting])
      {
        v148 = v215;
        v149 = v148;
        if (v215
          && (v150 = [v148 refcountIsSideTableMarkerMask] & v140,
              v150 == [v149 refcountIsSideTableMarkerValue]))
        {
          v151 = [v149 sideTablePointerMask] & v140;
          v152 = v151 >> [v149 sideTablePointerRightShift];
          v140 = v152 << [v149 sideTablePointerLeftShift];
        }

        else
        {
          v140 = 0LL;
        }

        a2 = v214;
      }

      else
      {
        if (v141) {
          v140 &= 0xFFFFFFFFFFFFF8uLL;
        }
        a2 = v214;
      }
    }

    v153 = 1LL;
    if (v224 && (unint64_t)v138 >= v217)
    {
      v154 = v140 & v224;
      if (v140 == (v140 & v224))
      {
        v153 = 2LL;
      }

      else
      {
        if ([*(id *)(a1 + 64) countFromPointerInAutoreleasePool:v140] + 1 >= 2)
        {
          [MEMORY[0x189607968] numberWithUnsignedInt:];
          v155 = (void *)objc_claimAutoreleasedReturnValue();
          v156 = *(void **)(a1 + 520);
          [MEMORY[0x189607968] numberWithUnsignedLongLong:v139];
          v157 = (void *)objc_claimAutoreleasedReturnValue();
          [v156 setObject:v155 forKeyedSubscript:v157];
        }

        v153 = 2LL;
        v140 = v154;
      }

      a2 = v214;
    }

    v158 = *(NSMapTable **)(a1 + 320);
    if (v158 && (v209 || (*(void *)(*(void *)(a1 + 80) + 16LL * a4 + 8) & 7LL) == 2))
    {
      v159 = NSMapGet(v158, v139);
      if (v159) {
        v140 = (unint64_t)v159;
      }
    }

    v160 = *(uint64_t **)(a1 + 112);
    if (v160[6] > v140) {
      goto LABEL_244;
    }
    v161 = -[VMUTask ptrauthStripDataPointer:](*(void *)(a1 + 8), v140);
    v162 = v160[6];
    v163 = v160[7];
    v146 = v163 >= v162;
    v164 = v163 - v162;
    if (!v146) {
      goto LABEL_244;
    }
    v165 = v161;
    if (v161 - v162 >= v164) {
      goto LABEL_244;
    }
    v166 = v161 >> *MEMORY[0x1895FD580];
    if (v166)
    {
      v167 = (unsigned int *)v160[3];
      v168 = v161 >> *MEMORY[0x1895FD580];
      do
      {
        if (*v167 <= (v168 & 0x3FFFFFF)
          || ((*((unsigned __int8 *)v167 + ((v168 & 0x3FFFFFF) >> 3) + 4) >> (v168 & 7)) & 1) == 0)
        {
          goto LABEL_244;
        }

        v168 >>= 26;
      }

      while (v168);
    }

    v169 = (uint64_t)v160 + 4 * (v166 & 0x7FFFF);
    v172 = *(_DWORD *)(v169 + 64);
    v171 = (_DWORD *)(v169 + 64);
    v170 = v172;
    if (v172)
    {
      v173 = v160[4] + ((unint64_t)(v170 - 1) << 6);
      if (v161 - *(void *)(*(void *)v173 + 8LL) < *(void *)(*(void *)v173 + 16LL)) {
        goto LABEL_257;
      }
    }

    v188 = *((unsigned int *)v160 + 10);
    if (!(_DWORD)v188)
    {
LABEL_283:
      a2 = v214;
      goto LABEL_244;
    }

    v189 = v160[4];
    while (1)
    {
      v190 = v188 >> 1;
      v173 = v189 + (v188 >> 1 << 6);
      if (*(void *)(*(void *)v173 + 8LL) <= v161)
      {
        if (*(void *)(*(void *)v173 + 16LL) + *(void *)(*(void *)v173 + 8LL) > v161)
        {
          v206 = v160[4];
          v207 = v171;
          v191 = [*(id *)v173 isSpecialPhysFootprintRegion];
          if (v191) {
            v192 = 0LL;
          }
          else {
            v192 = v173;
          }
          if ((v191 & 1) != 0) {
            goto LABEL_283;
          }
          v195 = v206;
          v194 = v207;
          if ((*(_BYTE *)(*(void *)v192 + 132LL) & 1) == 0) {
            goto LABEL_312;
          }
          v196 = (id *)(v192 + 64);
          v197 = *((unsigned int *)v160 + 10) - ((uint64_t)(v192 + 64 - v160[4]) >> 6);
          if (!v197) {
            goto LABEL_309;
          }
          while (2)
          {
            v198 = v197 >> 1;
            v199 = &v196[8 * (v197 >> 1)];
            if (*((void *)*v199 + 1) > v165)
            {
LABEL_295:
              v145 = v197 > 1;
              v197 = v198;
              if (!v145)
              {
                v197 = 0LL;
                goto LABEL_309;
              }

              continue;
            }

            break;
          }

          if (*((void *)*v199 + 2) + *((void *)*v199 + 1) <= v165)
          {
            v196 = v199 + 8;
            v198 = --v197 >> 1;
            goto LABEL_295;
          }

          v205 = v192;
          v204 = [*v199 isSpecialPhysFootprintRegion];
          v192 = v205;
          v195 = v206;
          v194 = v207;
          if (v204) {
            v197 = 0LL;
          }
          else {
            v197 = (unint64_t)v199;
          }
LABEL_309:
          if (v197) {
            v192 = v197;
          }
          v173 = v192;
LABEL_312:
          *v194 = ((v192 - v195) >> 6) + 1;
LABEL_257:
          v174 = *(_DWORD *)(v173 + 20);
          if (!v174) {
            goto LABEL_283;
          }
          v175 = *(void *)(v173 + 8);
          v176 = *v160;
          v177 = *(unsigned int *)(v173 + 16);
          v178 = (unint64_t *)(*v160 + 16 * v177);
          if (v175)
          {
            a2 = v214;
            if (*v178 > v165) {
              goto LABEL_244;
            }
            v179 = (void *)(v176 + 16LL * (v174 + v177 - 1));
            if (((v179[1] >> 5) & 0xFFFFFFFFFuLL) + *v179 <= v165) {
              goto LABEL_244;
            }
            v180 = (unsigned int *)(v175 + 4 * ((v165 - (*v178 & -*MEMORY[0x1895FD590])) >> *MEMORY[0x1895FD580]));
            v181 = *v180;
            v182 = (unint64_t *)(v176 + 16 * v181);
            if (*v182 > v165) {
              goto LABEL_244;
            }
            v183 = v180[1];
            if (v183 < *((_DWORD *)v160 + 2))
            {
              v184 = (unint64_t *)(v176 + 16 * v183);
              v185 = *v184;
              if (*v184 <= v165)
              {
LABEL_297:
                v200 = v184[1];
                if ((v200 & 7) - 2 < 3) {
                  goto LABEL_244;
                }
                v201 = ((unint64_t)v184 - v176) >> 4;
                v202 = v160[2];
                if (v165 - v185 >= v202)
                {
                  if (((v200 >> 5) & 0xFFFFFFFFFLL) - (v165 - v185) > v202 || (_DWORD)v201 == -1) {
                    goto LABEL_244;
                  }
                }

                else if ((_DWORD)v201 == -1)
                {
                  goto LABEL_244;
                }

                (*(void (**)(uint64_t, void, char *, uint64_t))(a9 + 16))(a9, a4, v139, v153);
                goto LABEL_244;
              }
            }

            v186 = v183 - v181;
            if (v186)
            {
              do
              {
                v187 = v186 >> 1;
                v184 = &v182[2 * v187];
                v185 = *v184;
                if (*v184 <= v165)
                {
                  if (((v182[2 * v187 + 1] >> 5) & 0xFFFFFFFFFLL) + v185 > v165) {
                    goto LABEL_297;
                  }
                  v182 = v184 + 2;
                  LODWORD(v187) = --v186 >> 1;
                }

                v146 = v186 >= 2;
                v186 = v187;
              }

              while (v146);
            }
          }

          else
          {
            a2 = v214;
            do
            {
              v193 = v174 >> 1;
              v184 = &v178[2 * v193];
              v185 = *v184;
              if (*v184 <= v165)
              {
                if (((v178[2 * v193 + 1] >> 5) & 0xFFFFFFFFFLL) + v185 > v165) {
                  goto LABEL_297;
                }
                v178 = v184 + 2;
                LODWORD(v193) = --v174 >> 1;
              }

              v146 = v174 >= 2;
              v174 = v193;
            }

            while (v146);
          }

    v28 = 0LL;
    goto LABEL_20;
  }

  if ([v19 scanType] == 3)
  {
    v26 = a8;
    v23 = v17;
    v27 = MEMORY[0x1895F87A8];
    v48[0] = MEMORY[0x1895F87A8];
    v48[1] = 3221225472LL;
    v48[2] = ___recursivelyCreateSwiftVariant_block_invoke_2;
    v48[3] = &unk_189DFE288;
    v52 = v21;
    v49 = v19;
    v53 = a7;
    v50 = v20;
    v51 = v26;
    v45[0] = v27;
    v45[1] = 3221225472LL;
    v45[2] = ___recursivelyCreateSwiftVariant_block_invoke_3;
    v45[3] = &unk_189DFE2B0;
    v46 = v49;
    v47 = v16;
    ___recursivelyCreateSwiftVariant_block_invoke((uint64_t)v47, (uint64_t)v48, v45);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    if ([v19 kind] == 6)
    {
      v29 = a8;
      v23 = v17;
      v25 = _recursivelyCreateSwiftEnumPayloadVariant(v15, v16, v17, v18, v19, v20, a7, v29, v18);
      goto LABEL_8;
    }

    [v19 subFieldArray];
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = [v30 count];

    if (!v31)
    {
      v23 = v17;
      goto LABEL_19;
    }

    v32 = [v19 offset];
    [v19 subFieldArray];
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)[v33 count];

    if (v28)
    {
      v34 = a8;
      v23 = v17;
      v28 = 0LL;
      v35 = 0LL;
      v36 = (v32 + a7);
      do
      {
        [v19 subFieldArray:v43];
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        [v37 objectAtIndexedSubscript:v35];
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        _recursivelyCreateSwiftVariant(v44, v16, v23, v43, v38, v20, v36, v34);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (v39)
        {
          if (!v28) {
            v28 = (void *)[v19 mutableCopy];
          }
          [v28 replaceFieldRecursively:v38 atOffset:[v38 offset] withField:v39];
        }

        ++v35;
        [v19 subFieldArray];
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = [v40 count];
      }

      while (v35 < v41);
    }

    else
    {
      v23 = v17;
    }
  }

  [v3 appendString:@"  PAGED_OUT"];
  if ((a1 & 0x20) == 0)
  {
LABEL_7:
    if ((a1 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
}
  }

      if (v21)
      {
        v25 = 0;
        v26 = &OBJC_IVAR___VMUCallTreeRoot__addressToSymbolNameMap;
      }

      else
      {
        v25 = (v11->_options & 0x20) == 0;
        v26 = &OBJC_IVAR___VMUCallTreeRoot__addressToSymbolNameMap;
        if ((v11->_options & 0x20) == 0) {
          v26 = &OBJC_IVAR___VMUCallTreeRoot__addressToLeafSymbolNameMap;
        }
      }

      v27 = (NSMapTable *)*(id *)((char *)&v11->super.super.isa + *v26);
      NSMapGet(v27, key);
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v28)
      {
        if (!key)
        {
          v28 = @"0x0";
          if (!v25) {
            goto LABEL_38;
          }
          goto LABEL_31;
        }

        v29 = -[VMUCallTreeRoot descriptionStringForAddress:atTime:leafFrame:startOfRecursion:]( v11,  "descriptionStringForAddress:atTime:leafFrame:startOfRecursion:");
        if (v29) {
          v28 = (__CFString *)v29;
        }
        else {
          v28 = @"IGNORE THIS FRAME";
        }
        NSMapInsert(v27, key, v28);
      }

      if (v28 == @"IGNORE THIS FRAME")
      {
        v28 = @"IGNORE THIS FRAME";
LABEL_40:

        goto LABEL_41;
      }

      if (!v25) {
        goto LABEL_38;
      }
LABEL_31:
      if ((-[__CFString hasPrefix:](v28, "hasPrefix:", kVMUUnknownSymbolName[0]) & 1) == 0)
      {
        v30 = [(id)v13 findOrAddChildWithName:v28 address:0 nodeSearchType:1 isLeafNode:1];

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!*(void *)(v30 + 24)) {
            [v30 parseNameIntoSymbol:0 library:0 loadAddress:0 offset:0 address:0 suffix:0];
          }
          [(id)v30 addAddress:key];
        }

        goto LABEL_39;
      }

      uint64_t v14 = v31;
    }
  }

            return;
          }
        }

        else
        {
          v31 = 0LL;
          v32 = 0LL;
          v33 = 0LL;
        }

        uint64_t v14 = 0LL;
        v29 = 0uLL;
        v30 = 0LL;
        goto LABEL_19;
      }
    }
  }

LABEL_244:
          v136 = v210;
LABEL_245:
          v71 = (unint64_t *)((char *)v71 + v229);
          if ((unint64_t)v71 > v136)
          {
LABEL_192:

            goto LABEL_193;
          }

          goto LABEL_196;
        }

        v189 = v173 + 64;
        v190 = --v188 >> 1;
      }

      v146 = v188 >= 2;
      v188 = v190;
      if (!v146) {
        goto LABEL_283;
      }
    }
  }

void sub_1860D1F98( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Block_object_dispose((const void *)(v11 - 48), 8);
  _Unwind_Resume(a1);
}

LABEL_65:
        v101 = *(void *)(a1[4] + 96);
        v61 = *(void *)(*(void *)(v101 + (v85 << 6)) + 8LL);
LABEL_87:
        v115 = *(void *)(a1[8] + 8);
        v116 = *(void *)(v101 + ((unint64_t)*(unsigned int *)(v115 + 24) << 6) + 48);
        if (v116)
        {
          (*(void (**)(uint64_t, unint64_t))(a4 + 16))( a4,  v116 + *v91 - *(void *)(*(void *)(a1[9] + 8) + 24LL));
          v115 = *(void *)(a1[8] + 8);
        }

        *(_DWORD *)(v115 + 24) = v125;
        *(void *)(*(void *)(a1[9] + 8) + 24LL) = v61;
        return;
      }

      v61 = *(void *)(*(void *)(a1[9] + 8) + 24LL);
      v62 = *(void **)(v15 + 56);
      v63 = *(_DWORD *)(v15 + 104);
      v64 = *(unsigned int *)(*(void *)(a1[8] + 8) + 24LL);
      v65 = *(id *)(v15 + 8);
      v66 = v62;
      v125 = v64;
      v67 = v16 + (v64 << 6);
      v68 = v65;
      v70 = *(void *)(v67 + 48);
      v69 = (void *)(v67 + 48);
      if (!v70)
      {
        v71 = v66;
        v72 = [*v18 isSpecialPhysFootprintRegion];
        v66 = v71;
        if ((v72 & 1) == 0)
        {
          v73 = [v71 mapAddress:*((void *)*v18 + 1) size:*((void *)*v18 + 2) returnedAddress:&v139 returnedSize:v147];
          if (v73)
          {
            v66 = v71;
            if ((*((_DWORD *)*v18 + 13) & 3u) - 1 < 2) {
              goto LABEL_86;
            }
            v74 = v73;
            v75 = task_exists(v68);
            v66 = v71;
            if ((_DWORD)v125 == v63 - 1 || !v75) {
              goto LABEL_86;
            }
            v133 = (FILE *)*MEMORY[0x1895F89D0];
            v130 = [*v18 address];
            v76 = *((unsigned int *)*v18 + 6);
            v128 = vm_prot_strings[v76];
            v77 = *((void *)*v18 + 2) + *((void *)*v18 + 1);
            v78 = VMUExclaveOrDarwinRegionTypeDescriptionForTagShareProtAndPager( *((unsigned __int8 *)*v18 + 232),  *((unsigned __int8 *)*v18 + 104),  *((unsigned __int8 *)*v18 + 50),  v76,  *((unsigned __int8 *)*v18 + 49));
            v79 = (const char *)[v78 UTF8String];
            v80 = *((void *)*v18 + 2) >> *MEMORY[0x1895FD580];
            if (v80 == 1) {
              v81 = "page";
            }
            else {
              v81 = "pages";
            }
            if (*(void *)(v16 + (v125 << 6) + 24) == *(void *)(v16 + (v125 << 6) + 32)) {
              v82 = "";
            }
            else {
              v82 = " [root]";
            }
            fprintf( v133,  "Failed to map remote region: [%#llx-%#llx] %s %s (%llu %s)%s (error: %d)\n",  v130,  v77,  v128,  v79,  v80,  v81,  v82,  v74);
          }

          else
          {
            v113 = v147[0];
            *v69 = v139;
            v114 = v16 + (v125 << 6);
            *(void *)(v114 + 40) = v113;
            *(void *)(v114 + 56) = v18;
          }

          v66 = v71;
        }
      }

      if (!HIDWORD(v48))
      {
        v57 = 8LL;
        v58 = &stru_189E010C8;
        goto LABEL_71;
      }

      v56 = 8LL;
      v57 = 8LL;
      v58 = &stru_189E010C8;
      if ((v48 & 7) == 0) {
        goto LABEL_70;
      }
LABEL_71:
      [v83 appendFormat:@" %.*s:%@ ", v54 - v52, v52, v58];
      v51 = v54 + 2;
      if (v84 == 94)
      {
        if (*v51 == 123)
        {
          v59 = strchr(v54 + 2, 125);
          if (!v59)
          {

            goto LABEL_112;
          }

          v51 = v59 + 1;
        }

        else
        {
          v51 = v54 + 3;
        }
      }

      v48 += v57;

      v50 = *v51;
    }

    switch(v55)
    {
      case 'c':
        goto LABEL_56;
      case 'd':
      case 'l':
      case 'q':
        goto LABEL_65;
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'r':
        goto LABEL_70;
      case 'f':
      case 'i':
        goto LABEL_51;
      case 's':
        goto LABEL_69;
      default:
        if (v55 == 83)
        {
LABEL_69:
          v56 = 2LL;
        }

        else if (v55 == 94)
        {
          goto LABEL_65;
        }

        break;
    }

    goto LABEL_70;
  }

  if (a2 == 83)
  {
    v64 = (void *)NSString;
    v65 = **(unsigned __int16 **)(a1 + 48);
LABEL_88:
    [v64 stringWithFormat:@"%u", v65, v80, v81, v82];
    v37 = LABEL_93:;
    goto LABEL_94;
  }

  if (a2 != 94) {
    goto LABEL_35;
  }
  v32 = **(void **)(a1 + 48);
  if (!v32)
  {
LABEL_31:
    v38 = *(void *)(*(void *)(a1 + 40) + 8LL);
    v39 = *(void **)(v38 + 40);
    *(void *)(v38 + 40) = @"0x0";
LABEL_95:

    goto LABEL_96;
  }

  [*(id *)(a1 + 32) objectIdentifier];
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v33 symbolForAddress:v32];

  if ((CSIsNull() & 1) == 0)
  {
    v34 = [MEMORY[0x189NSStringormat:@"%p %s" v32, CSSymbolGetName()];
    v35 = *(void *)(*(void *)(a1 + 40) + 8LL);
    v36 = *(void **)(v35 + 40);
    *(void *)(v35 + 40) = v34;

    CSSymbolGetSymbolOwner();
    if ((CSIsNull() & 1) == 0)
    {
      v37 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) stringByAppendingFormat:@" (in %s)"];
LABEL_94:
      v67 = *(void *)(*(void *)(a1 + 40) + 8LL);
      v39 = *(void **)(v67 + 40);
      *(void *)(v67 + 40) = v37;
      goto LABEL_95;
    }
  }

LABEL_86:
      v101 = *(void *)(a1[4] + 96);
      v91 = v135;
      goto LABEL_87;
    }
  }

  else if (VMUGraphNodeType_IsVMRegion(v13))
  {
    *(_DWORD *)(*(void *)(a1[8] + 8) + 24LL) = *v11 >> 41;
    v43 = objc_retain(*(id *)(*(void *)(a1[4] + 96)
                            + ((unint64_t)*(unsigned int *)(*(void *)(a1[8] + 8) + 24LL) << 6)));
    if (-[VMUTaskMemoryScanner _shouldScanVMregion:]( a1[4],  *(void *)(a1[4] + 96)
                       + ((unint64_t)*(unsigned int *)(*(void *)(a1[8] + 8) + 24LL) << 6)))
    {
      v137 = v8;
      *(void *)(*(void *)(a1[9] + 8) + 24) = [v43 address];
      v44 = *(void *)(*(void *)(a1[9] + 8) + 24LL);
      *(void *)(*(void *)(a1[7] + 8) + 24) = [v43 length] + v44;
      v45 = a1[4];
      v46 = *(void *)(v45 + 96);
      v47 = *(unsigned int *)(*(void *)(a1[8] + 8) + 24LL);
      v48 = v46 + (v47 << 6);
      v49 = *(void **)(v45 + 56);
      v50 = *(_DWORD *)(v45 + 104);
      v132 = *(id *)(v45 + 8);
      v51 = v49;
      if (!*(void *)(v48 + 48) && ([*(id *)v48 isSpecialPhysFootprintRegion] & 1) == 0)
      {
        v52 = [v51 mapAddress:*(void *)(*(void *)v48 + 8) size:*(void *)(*(void *)v48 + 16) returnedAddress:&v139 returnedSize:v147];
        if (v52)
        {
          if ((*(_DWORD *)(*(void *)v48 + 52LL) & 3u) - 1 >= 2)
          {
            v53 = v52;
            v54 = task_exists(v132);
            if ((_DWORD)v47 != v50 - 1 && v54)
            {
              v129 = (FILE *)*MEMORY[0x1895F89D0];
              v127 = [*(id *)v48 address];
              v55 = *(unsigned int *)(*(void *)v48 + 24LL);
              v124 = vm_prot_strings[v55];
              v122 = *(void *)(*(void *)v48 + 16LL) + *(void *)(*(void *)v48 + 8LL);
              v56 = VMUExclaveOrDarwinRegionTypeDescriptionForTagShareProtAndPager( *(unsigned __int8 *)(*(void *)v48 + 232LL),  *(unsigned __int8 *)(*(void *)v48 + 104LL),  *(unsigned __int8 *)(*(void *)v48 + 50LL),  v55,  *(unsigned __int8 *)(*(void *)v48 + 49LL));
              v57 = (const char *)[v56 UTF8String];
              v58 = *(void *)(*(void *)v48 + 16LL) >> *MEMORY[0x1895FD580];
              if (v58 == 1) {
                v59 = "page";
              }
              else {
                v59 = "pages";
              }
              if (*(void *)(v46 + (v47 << 6) + 24) == *(void *)(v46 + (v47 << 6) + 32)) {
                v60 = "";
              }
              else {
                v60 = " [root]";
              }
              fprintf( v129,  "Failed to map remote region: [%#llx-%#llx] %s %s (%llu %s)%s (error: %d)\n",  v127,  v122,  v124,  v57,  v58,  v59,  v60,  v53);
            }
          }
        }

        else
        {
          v110 = v147[0];
          *(void *)(v48 + 4_Block_object_dispose(va, 8) = v139;
          v111 = v46 + (v47 << 6);
          *(void *)(v111 + 40) = v110;
          *(void *)(v111 + 56) = v48;
        }
      }

      v112 = *(void *)(*(void *)(a1[4] + 96)
      if (v112)
      {
        (*(void (**)(uint64_t, unint64_t))(a4 + 16))( a4,  v112 + *v137 - *(void *)(*(void *)(a1[9] + 8) + 24LL));
        if (!a3) {
          *(_DWORD *)(*(void *)(a1[6] + 8) + 24LL) = *(_DWORD *)(*(void *)(a1[8] + 8) + 24LL);
        }
      }
    }
  }

LABEL_137:
        v122 = *(unsigned int *)(a1 + 48);
        v161[0] = MEMORY[0x1895F87A8];
        v161[1] = 3221225472LL;
        v161[2] = __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_3;
        v161[3] = &unk_189DFD430;
        v123 = *(void **)(a1 + 40);
        v161[4] = *(void *)(a1 + 32);
        v163 = v5;
        v162 = v123;
        (*(void (**)(uint64_t, unint64_t, uint64_t, void *))(a2 + 16))(a2, v5, v122, v161);
        v54 = v162;
        goto LABEL_138;
      }

      if (VMUGraphNodeType_IsVMRegion(v6 & 7)) {
        break;
      }
      if (v8 == 3)
      {
        v55 = *(void *)(a1 + 32);
        v56 = *(void **)(a1 + 40);
        v57 = *(void *)(*(void *)(v55 + 80) + 16 * v5);
        v135[0] = MEMORY[0x1895F87A8];
        v135[1] = 3221225472LL;
        v135[2] = __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_10;
        v135[3] = &unk_189DFD4A8;
        v135[4] = v55;
        v58 = v56;
        v138 = v5;
        v136 = v58;
        v137 = v57;
        v59 = (void (**)(void, void, void))MEMORY[0x186E33044](v135);
        if ([*(id *)(*(void *)(a1 + 32) + 8) isCore])
        {
          kcd_addr_begin[0] = 0LL;
          [*(id *)(*(void *)(a1 + 32) + 8) memoryCache];
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = -[VMUTaskMemoryCache getCoreFileUdataPointersIntoBuffer:count:]((uint64_t)v60, 0LL, kcd_addr_begin);

          if (!v61 && kcd_addr_begin[0])
          {
            if (kcd_addr_begin[0] >> 61)
            {
              NSLog(@"Failed to get udata pointers for core file.");
            }

            else
            {
              v124 = malloc(8 * kcd_addr_begin[0]);
              if (v124)
              {
                v125 = v124;
                [*(id *)(*(void *)(a1 + 32) + 8) memoryCache];
                v126 = (void *)objc_claimAutoreleasedReturnValue();
                v127 = -[VMUTaskMemoryCache getCoreFileUdataPointersIntoBuffer:count:]( (uint64_t)v126,  (uint64_t)v125,  kcd_addr_begin);

                if (!v127) {
                  ((void (**)(void, void *, mach_vm_address_t))v59)[2](v59, v125, kcd_addr_begin[0]);
                }
                free(v125);
              }
            }
          }

LABEL_145:
          v54 = v136;
          goto LABEL_138;
        }

        kcd_addr_begin[0] = 0LL;
        kcd_size = 0LL;
        if (!task_map_corpse_info_64( *MEMORY[0x1895FBBE0],  [*(id *)(*(void *)(a1 + 32) + 8) taskPort],  kcd_addr_begin,  &kcd_size))
        {
          v114 = kcd_addr_begin[0];
          v115 = kcd_size;
          v116 = kcd_size + kcd_addr_begin[0];
          v117 = kcd_addr_begin[0] + 16;
          if (v114 + 16 <= kcd_size + v114
            && v117 + *(unsigned int *)(kcd_addr_begin[0] + 4) <= v116
            && *(_DWORD *)kcd_addr_begin[0] == -559025833)
          {
            do
            {
              v118 = v117 + *(unsigned int *)(v114 + 4);
              if (v118 > v116) {
                break;
              }
              v119 = *(_DWORD *)v114;
              if (*(_DWORD *)v114 == -242132755) {
                break;
              }
              if ((v119 == 17 || (v119 & 0xFFFFFFF0) == 0x20) && HIDWORD(*(void *)(v114 + 8)) == 2076LL)
              {
                v59[2](v59, v114 + 16, *(void *)(v114 + 8));
                v118 = v117 + *(unsigned int *)(v114 + 4);
              }

              v117 = v118 + 16;
              v114 = v118;
            }

            while (v118 + 16 <= v116);
            v114 = kcd_addr_begin[0];
            v115 = kcd_size;
          }

          mach_vm_deallocate(*MEMORY[0x1895FBBE0], v114, v115);
          goto LABEL_145;
        }

        [*(id *)(a1 + 32) pid];
        v65 = proc_list_uptrs();
        if (v65 < 1) {
          goto LABEL_145;
        }
        v66 = v65;
        v133 = v59;
        v67 = malloc((8 * v65));
        [*(id *)(a1 + 32) pid];
        proc_list_uptrs();
        v68 = v67;
        v69 = 0LL;
        v134 = v67;
LABEL_56:
        v70 = *(uint64_t **)(*(void *)(a1 + 32) + 112LL);
        v71 = v70[6];
        v72 = v70[7];
        v35 = v72 >= v71;
        v73 = v72 - v71;
        if (!v35) {
          goto LABEL_106;
        }
        v74 = v68[v69];
        if (v74 - v71 >= v73) {
          goto LABEL_106;
        }
        v75 = v74 >> *MEMORY[0x1895FD580];
        if (v75)
        {
          v76 = (unsigned int *)v70[3];
          v77 = v74 >> *MEMORY[0x1895FD580];
          do
          {
            if (*v76 <= (v77 & 0x3FFFFFF)
              || ((*((unsigned __int8 *)v76 + ((v77 & 0x3FFFFFF) >> 3) + 4) >> (v77 & 7)) & 1) == 0)
            {
              goto LABEL_106;
            }

            v77 >>= 26;
          }

          while (v77);
        }

        v78 = (uint64_t)v70 + 4 * (v75 & 0x7FFFF);
        v81 = *(_DWORD *)(v78 + 64);
        v80 = (_DWORD *)(v78 + 64);
        v79 = v81;
        v82 = v70[4];
        if (v81)
        {
          v83 = v82 + ((unint64_t)(v79 - 1) << 6);
          if (v74 - *(void *)(*(void *)v83 + 8LL) < *(void *)(*(void *)v83 + 16LL)) {
            goto LABEL_66;
          }
        }

        v99 = *((unsigned int *)v70 + 10);
        if (!(_DWORD)v99) {
          goto LABEL_106;
        }
        v100 = v70[4];
        while (1)
        {
          v101 = v99 >> 1;
          v83 = v100 + (v99 >> 1 << 6);
          if (*(void *)(*(void *)v83 + 8LL) <= v74)
          {
            if (*(void *)(*(void *)v83 + 16LL) + *(void *)(*(void *)v83 + 8LL) > v74)
            {
              v102 = [*(id *)v83 isSpecialPhysFootprintRegion];
              v68 = v134;
              if (v102) {
                v103 = 0LL;
              }
              else {
                v103 = v83;
              }
              if ((v102 & 1) != 0) {
                goto LABEL_106;
              }
              if ((*(_BYTE *)(*(void *)v103 + 132LL) & 1) == 0) {
                goto LABEL_120;
              }
              v104 = (id *)(v103 + 64);
              v105 = *((unsigned int *)v70 + 10) - ((uint64_t)(v103 + 64 - v70[4]) >> 6);
              if (!v105) {
                goto LABEL_117;
              }
              while (2)
              {
                v106 = v105 >> 1;
                v107 = &v104[8 * (v105 >> 1)];
                if (*((void *)*v107 + 1) > v74)
                {
LABEL_100:
                  v108 = v105 > 1;
                  v105 = v106;
                  if (!v108)
                  {
                    v105 = 0LL;
                    goto LABEL_117;
                  }

                  continue;
                }

                break;
              }

              if (*((void *)*v107 + 2) + *((void *)*v107 + 1) <= v74)
              {
                v104 = v107 + 8;
                v106 = --v105 >> 1;
                goto LABEL_100;
              }

              v132 = v103;
              v113 = [*v107 isSpecialPhysFootprintRegion];
              v103 = v132;
              v68 = v134;
              if (v113) {
                v105 = 0LL;
              }
              else {
                v105 = (unint64_t)v107;
              }
LABEL_117:
              if (v105) {
                v103 = v105;
              }
              v83 = v103;
LABEL_120:
              *v80 = ((v103 - v82) >> 6) + 1;
LABEL_66:
              v84 = *(_DWORD *)(v83 + 20);
              if (v84)
              {
                v85 = *(void *)(v83 + 8);
                v86 = *v70;
                v87 = *(unsigned int *)(v83 + 16);
                v88 = (unint64_t *)(*v70 + 16 * v87);
                if (v85)
                {
                  if (*v88 > v74) {
                    goto LABEL_106;
                  }
                  v89 = (void *)(v86 + 16LL * (v84 + v87 - 1));
                  if (((v89[1] >> 5) & 0xFFFFFFFFFuLL) + *v89 <= v74) {
                    goto LABEL_106;
                  }
                  v90 = (unsigned int *)(v85 + 4 * ((v74 - (*v88 & -*MEMORY[0x1895FD590])) >> *MEMORY[0x1895FD580]));
                  v91 = *v90;
                  v92 = (unint64_t *)(v86 + 16 * v91);
                  if (*v92 > v74) {
                    goto LABEL_106;
                  }
                  v93 = v90[1];
                  if (v93 < *((_DWORD *)v70 + 2))
                  {
                    v94 = (unint64_t *)(v86 + 16 * v93);
                    v95 = *v94;
                    if (*v94 <= v74)
                    {
LABEL_102:
                      v109 = v94[1];
                      if ((v109 & 7) - 2 < 3) {
                        goto LABEL_106;
                      }
                      v110 = ((unint64_t)v94 - v86) >> 4;
                      v111 = v70[2];
                      if (v74 - v95 >= v111)
                      {
                        if (((v109 >> 5) & 0xFFFFFFFFFLL) - (v74 - v95) > v111 || (_DWORD)v110 == -1) {
                          goto LABEL_106;
                        }
                      }

                      else if ((_DWORD)v110 == -1)
                      {
                        goto LABEL_106;
                      }

                      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
                      v68 = v134;
                      goto LABEL_106;
                    }
                  }

                  v96 = v93 - v91;
                  if (v96)
                  {
                    do
                    {
                      v97 = v96 >> 1;
                      v94 = &v92[2 * v97];
                      v95 = *v94;
                      if (*v94 <= v74)
                      {
                        if (((v92[2 * v97 + 1] >> 5) & 0xFFFFFFFFFLL) + v95 > v74) {
                          goto LABEL_102;
                        }
                        v92 = v94 + 2;
                        LODWORD(v97) = --v96 >> 1;
                      }

                      v35 = v96 >= 2;
                      v96 = v97;
                    }

                    while (v35);
                  }
                }

                else
                {
                  do
                  {
                    v98 = v84 >> 1;
                    v94 = &v88[2 * v98];
                    v95 = *v94;
                    if (*v94 <= v74)
                    {
                      if (((v88[2 * v98 + 1] >> 5) & 0xFFFFFFFFFLL) + v95 > v74) {
                        goto LABEL_102;
                      }
                      v88 = v94 + 2;
                      LODWORD(v9_Block_object_dispose(va, 8) = --v84 >> 1;
                    }

                    v35 = v84 >= 2;
                    v84 = v98;
                  }

                  while (v35);
                }
              }

LABEL_106:
              if (++v69 == v66)
              {
                free(v68);
                v59 = v133;
                goto LABEL_145;
              }

              goto LABEL_56;
            }

            v100 = v83 + 64;
            v101 = --v99 >> 1;
          }

          v35 = v99 >= 2;
          v99 = v101;
          if (!v35) {
            goto LABEL_106;
          }
        }
      }

      if (v8 == 4)
      {
        v52 = *(unsigned int *)(a1 + 48);
        v139[0] = MEMORY[0x1895F87A8];
        v139[1] = 3221225472LL;
        v139[2] = __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_9;
        v139[3] = &unk_189DFD430;
        v53 = *(void **)(a1 + 40);
        v139[4] = *(void *)(a1 + 32);
        v141 = v5;
        v140 = v53;
        (*(void (**)(uint64_t, unint64_t, uint64_t, void *))(a2 + 16))(a2, v5, v52, v139);
        v54 = v140;
LABEL_138:
      }

LABEL_139:
      ++v5;
      uint64_t v2 = *(void *)(a1 + 32);
    }

    v24 = *(void *)(a1 + 32);
    v25 = (mach_vm_address_t *)(*(void *)(v24 + 80) + 16 * v5);
    v26 = *v25;
    v29 = v25[1];
    v27 = v25 + 1;
    v28 = v29;
    kcd_addr_begin[0] = 0LL;
    kcd_addr_begin[1] = (mach_vm_address_t)kcd_addr_begin;
    kcd_addr_begin[2] = 0x2020000000LL;
    kcd_addr_begin[3] = v26;
    kcd_size = 0LL;
    p_kcd_size = &kcd_size;
    v158 = 0x2020000000LL;
    v159 = (*v27 >> 5) & 0xFFFFFFFFFLL;
    if (v159 < 8)
    {
LABEL_37:
      _Block_object_dispose(&kcd_size, 8);
      _Block_object_dispose(kcd_addr_begin, 8);
      goto LABEL_139;
    }

    v30 = ((v28 >> 5) & 0xFFFFFFFFFLL) + v26;
    v31 = *(id *)(*(void *)(v24 + 96) + ((*v27 >> 35) & 0x1FFFFFC0LL));
    v32 = (void *)MEMORY[0x186E33044](*(void *)(a1 + 40));
    v33 = *(void *)(a1 + 32);
    v34 = *(void *)(v33 + 528);
    v35 = v26 > v34 || v34 >= v30;
    if (!v35)
    {
      v36 = *(unsigned int *)(a1 + 48);
      v37 = MEMORY[0x1895F87A8];
      v152[0] = MEMORY[0x1895F87A8];
      v152[1] = 3221225472LL;
      v152[2] = __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_6;
      v152[3] = &unk_189DFD458;
      v152[4] = v33;
      v154 = v26;
      v155 = v5;
      v153 = *(id *)(a1 + 40);
      (*(void (**)(uint64_t, unint64_t, uint64_t, void *))(a2 + 16))(a2, v5, v36, v152);
      v150[0] = v37;
      v150[1] = 3221225472LL;
      v150[2] = __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_7;
      v150[3] = &unk_189DFD3C0;
      v38 = *(void **)(a1 + 40);
      v150[4] = *(void *)(a1 + 32);
      v151 = v38;
      v39 = MEMORY[0x186E33044](v150);

      v32 = (void *)v39;
    }

    v40 = [v31 isFoundation];
    v41 = *(void *)(a1 + 32);
    if (v40)
    {
      v42 = v5 + 1;
      if (v5 + 1 < *(unsigned int *)(v41 + 88))
      {
        v43 = *(void *)(v41 + 80);
        if (*(void *)(v43 + 16 * v42) == v30)
        {
          v44 = *(void *)(v43 + 16 * v42 + 8);
          v45 = MEMORY[0x1895F87A8];
          if (p_kcd_size[3] != ((v44 >> 5) & 0xFFFFFFFFFLL))
          {
LABEL_36:
            v49 = *(unsigned int *)(a1 + 48);
            v142[0] = v45;
            v142[1] = 3221225472LL;
            v142[2] = __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_8;
            v142[3] = &unk_189DFD480;
            v147 = v26;
            v148 = v30;
            v142[4] = v41;
            v145 = &kcd_size;
            v146 = kcd_addr_begin;
            v149 = v5;
            v50 = v32;
            v144 = v50;
            v51 = v31;
            v143 = v51;
            (*(void (**)(uint64_t, unint64_t, uint64_t, void *))(a2 + 16))(a2, v5, v49, v142);

            goto LABEL_37;
          }

          IsVMRegion = VMUGraphNodeType_IsVMRegion(v44 & 7);
          v41 = *(void *)(a1 + 32);
          if (IsVMRegion)
          {
            v47 = objc_retain(*(id *)(*(void *)(v41 + 96)
                                    + ((*(void *)(*(void *)(v41 + 80) + 16 * v42 + 8) >> 35) & 0x1FFFFFC0LL)));
            v48 = v47;

            v41 = *(void *)(a1 + 32);
          }
        }
      }
    }

    v45 = MEMORY[0x1895F87A8];
    goto LABEL_36;
  }

void sub_1860D3A88(_Unwind_Exception *a1)
{
}

LABEL_47:
    if (*(_DWORD *)(v6 + 56) != -1) {
      return (*(uint64_t (**)(void))(*(void *)(v6 + 40) + 16LL))();
    }
  }

  return result;
}

LABEL_53:
    ++v6;
  }

  while (v6 != a3);
  return result;
}

    ++v6;
  }

  while (v6 != a3);
  return result;
}

          objc_sync_exit(v47);
        }

        -[VMUProcessDescription cleansePathsIncludingBinaryImageList:]( v7,  "cleansePathsIncludingBinaryImageList:",  0LL,  v45,  v46);
        CSSymbolicatorGetAOutSymbolOwner();
        if ((CSIsNull() & 1) != 0)
        {
          if (!-[VMUTaskMemoryCache isExclave]((BOOL)v50))
          {
            v55 = 0LL;
            v56 = 0LL;
            v54 = 9999;
            v52 = 0u;
            v53 = 0u;
            *(_OWORD *)location = 0u;
            if (![(id)*p_memoryCache machVMRegionRecurseSubmapShortInfo64onAddress:&v56 size:&v55 nestingDepth:&v54 info:location]) {
              v7->_executableLoadAddress = v56;
            }
          }
        }

        else
        {
          v7->_executableLoadAddress = CSSymbolOwnerGetBaseAddress();
        }

      goto LABEL_12;
    }

    uint64_t v13 = 0LL;
  }

LABEL_43:
      uint64_t v18 = v17;
      goto LABEL_46;
    }

    if ((_DWORD)v18 == 1) {
      goto LABEL_43;
    }
    v20 = (16LL * (v18 - 1)) | 8;
    v27 = v18 - 1;
    v21 = v18 - 1;
    while (1)
    {
      if (!VMUGraphNodeType_IsVMRegion(*(_DWORD *)((_BYTE *)&self->_blocks->var0 + v20) & 7))
      {
        a3[v32] = v18;
        uint64_t v18 = v17;
        ++v32;
        goto LABEL_45;
      }

      v22 = (id *)objc_retain(*(id *)((char *)&self->_regions->var0
                                    + ((*(unint64_t *)((char *)&self->_blocks->var0 + v20) >> 35) & 0x1FFFFFC0)));
      if (([v22 isSubmap] & 1) == 0) {
        break;
      }
LABEL_39:

      v20 -= 16LL;
      if (!--v21)
      {
        uint64_t v18 = v17;
LABEL_45:
        v8 = v29;
        uint64_t v10 = v28;
        goto LABEL_46;
      }
    }

    v23 = *((_DWORD *)v19 + 26);
    if (*((_DWORD *)v22 + 26) != v23) {
      goto LABEL_33;
    }
    v23 = *((_DWORD *)v22 + 26);
    if ((char *)v22[1] + (void)v22[2] != v19[1] && ([v19 isJavascriptJitExecutableAllocator] & 1) == 0)
    {
      v23 = *((_DWORD *)v19 + 26);
LABEL_33:
      if (v23
        || *((_DWORD *)v22 + 26)
        || (char *)v22[1] + (void)v22[2] != v19[1]
        || ![v19[4] isEqualToString:VMUmappedFileLabel[0]]
        || ![v22[4] isEqualToString:@"__LINKEDIT"]
        || ![v19[5] isEqualToString:v22[5]])
      {
        goto LABEL_39;
      }

      if ((_DWORD)v17 == v27) {
        v25 = v26;
      }
      else {
        v25 = v21;
      }
      v8 = v29;
      (*((void (**)(id, uint64_t, unint64_t, uint64_t, uint64_t, unint64_t))v29 + 2))( v29,  v25,  self->_blocks[v25].var0,  1LL,  v18,  self->_blocks[v18].var0);
      v26 = v25;
LABEL_56:
      uint64_t v10 = v28;
      goto LABEL_57;
    }

    if ((_DWORD)v17 == v27) {
      v24 = v26;
    }
    else {
      v24 = v21;
    }
    v8 = v29;
    (*((void (**)(id, uint64_t, unint64_t, uint64_t, uint64_t, unint64_t))v29 + 2))( v29,  v24,  self->_blocks[v24].var0,  1LL,  v18,  self->_blocks[v18].var0);
    v26 = v24;
    if (!v32)
    {
      v32 = 0;
      goto LABEL_56;
    }

    uint64_t v10 = v28;
LABEL_57:

LABEL_46:
    uint64_t v17 = v18;
LABEL_47:
    ++v16;
  }

  while (v16 != v5);
LABEL_5:

  return v32;
}

  objc_autoreleasePoolPop(context);
}

          v8 = 0LL;
        }
      }
    }

    else if (v6 > 1414022208)
    {
      switch(v6)
      {
        case 1414022209:
          if (-[VMUObjectIdentifier _isValidInstanceLength:expectedLength:]( self,  "_isValidInstanceLength:expectedLength:",  a4,  64LL))
          {
            id v9 = @"pthread_attr_t";
            goto LABEL_42;
          }

          goto LABEL_43;
        case 1414025796:
          if (-[VMUObjectIdentifier _isValidInstanceLength:expectedLength:]( self,  "_isValidInstanceLength:expectedLength:",  a4,  8LL))
          {
            id v9 = @"pthread_t";
            goto LABEL_42;
          }

          goto LABEL_43;
        case 1870030194:
          if (-[VMUObjectIdentifier _isValidInstanceLength:expectedLength:]( self,  "_isValidInstanceLength:expectedLength:",  a4,  40LL))
          {
            id v9 = @"pthread_override_s";
            goto LABEL_42;
          }

          goto LABEL_43;
      }
    }

    else
    {
      switch(v6)
      {
        case 1330529093:
          if (-[VMUObjectIdentifier _isValidInstanceLength:expectedLength:]( self,  "_isValidInstanceLength:expectedLength:",  a4,  16LL))
          {
            id v9 = @"pthread_once_t";
            goto LABEL_42;
          }

          goto LABEL_43;
        case 1381452865:
          if (-[VMUObjectIdentifier _isValidInstanceLength:expectedLength:]( self,  "_isValidInstanceLength:expectedLength:",  a4,  24LL))
          {
            id v9 = @"pthread_rwlockattr_t";
            goto LABEL_42;
          }

          goto LABEL_43;
        case 1381452875:
          if (-[VMUObjectIdentifier _isValidInstanceLength:expectedLength:]( self,  "_isValidInstanceLength:expectedLength:",  a4,  200LL))
          {
            id v9 = @"pthread_rwlock_t";
LABEL_42:
            v8 = -[VMUObjectIdentifier _classInfoWithPthreadType:](self, "_classInfoWithPthreadType:", v9);
            return v8;
          }

          goto LABEL_43;
      }
    }
  }

  return v8;
}

    objc_autoreleasePoolPop(context);
    v8 = v34;
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  return (id)v13;
}

void sub_1860D59A4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
}

LABEL_46:
              if (*(void *)(*(void *)(*(void *)(a1 + 104) + 8LL) + 40LL))
              {
                *(_DWORD *)(*(void *)(*(void *)(a1 + 112) + 8LL) + 24LL) = 0;
                [*(id *)(a1 + 56) threadDescriptionStringForBacktrace:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) returnedAddress:0];
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                [ *(id *)(*(void *)(a1 + 32) + 496) setThreadName:v44 forRange: *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 32),  *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)];
                [*(id *)(*(void *)(a1 + 32) + 496) setThreadName:v44 forRange:v33];
                if (v33 || !*(_BYTE *)(*(void *)(*(void *)(a1 + 120) + 8LL) + 24LL))
                {
                  v45 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 40LL)
                      + *(void *)(*(void *)(*(void *)(a1 + 96) + 8LL) + 32LL);
                  [(id)gPthreadOffsets objectForKeyedSubscript:@"RegionEndOffsetKey"];
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  v47 = [v46 unsignedLongLongValue];

                  [ *(id *)(*(void *)(a1 + 32) + 496) setRegionSymbolName:@"<PTHREAD_T>" forRange:v45 - v47, v47];
                }
              }

              else
              {
                if ([*(id *)(*(void *)(a1 + 32) + 8) isCore])
                {
                  v48 = &stru_189E010C8;
                }

                else
                {
                  [*(id *)(a1 + 56) threadDescriptionStringForBacktrace:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) returnedAddress:0];
                  v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
                }
                v49 = -[__CFString stringByAppendingString:]( v48,  "stringByAppendingString:",  @"  no associated pthread");
                [ *(id *)(*(void *)(a1 + 32) + 496) setThreadName:v49 forRange: *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 32),  *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)];
                [*(id *)(*(void *)(a1 + 32) + 496) setThreadName:v49 forRange:v33];
              }
            }
          }

          v50 = *(void **)(*(void *)(*(void *)(a1 + 104) + 8LL) + 40LL);
          if (!v50) {
            goto LABEL_32;
          }
          v51 = [v50 backtraceLength];
          if (*(_DWORD *)(*(void *)(*(void *)(a1 + 112) + 8LL) + 24LL) >= v51) {
            goto LABEL_32;
          }
          v52 = v51;
          while (1)
          {
            v53 = *(void *)([*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) stackFramePointers]
                            + 8LL * *(unsigned int *)(*(void *)(*(void *)(a1 + 112) + 8LL) + 24LL));
            v54 = [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) backtrace];
            v55 = *(void *)(*(void *)(a1 + 112) + 8LL);
            v56 = *(unsigned int *)(v55 + 24);
            if (v53 > a3) {
              break;
            }
            *(_DWORD *)(v55 + 24) = v56 + 1;
            if (*(_DWORD *)(*(void *)(*(void *)(a1 + 112) + 8LL) + 24LL) >= v52) {
              goto LABEL_32;
            }
          }

          v57 = *(void *)(v54 + 8 * v56);
          v58 = *(void *)(*(void *)(a1 + 88) + 8LL);
          *(void *)(v58 + 32) = a3;
          *(void *)(v58 + 40) = v53 - a3;
          CSSymbolicatorGetSymbolWithAddressAtTime();
          CSSymbolGetSymbolOwner();
          Name = CSSymbolOwnerGetName();
          else {
            [MEMORY[0x189NSStringormat:@"%s (in %s)", CSSymbolGetName(), Name];
          }
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v27) {
            goto LABEL_32;
          }
          v31 = *(void **)(*(void *)(a1 + 32) + 496LL);
          v32 = *(void *)(a1 + 88);
          goto LABEL_31;
        }

        CSIsNull();
LABEL_17:
        if (a3 - *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 32LL) >= *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL)
                                                                                           + 40LL))
        {
          CSSymbolicatorGetSectionWithAddressAtTime();
          v19 = CSRegionGetName();
          if (v19)
          {
            v20 = (const char *)v19;
            [NSString stringWithUTF8String:v19];
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            Range = CSRegionGetRange();
            v23 = *(void *)(*(void *)(a1 + 64) + 8LL);
            *(void *)(v23 + 32) = Range;
            *(void *)(v23 + 40) = v24;
            [ *(id *)(*(void *)(a1 + 32) + 496)  setBinarySectionName:v21 forRange: *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 32)  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
            v25 = !strncmp(v20, "__DATA __objc_", 0xEuLL)
               || !strncmp(v20, "__AUTH __objc_", 0xEuLL)
               || !strncmp(v20, "__DATA_DIRTY __objc_", 0x14uLL)
               || !strncmp(v20, "__DATA_CONST __objc_", 0x14uLL)
               || !strncmp(v20, "__AUTH_CONST __objc_", 0x14uLL)
               || strncmp(v20, "__OBJC ", 7uLL) == 0;
            *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = v25;
          }
        }

        if (*(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL)) {
          goto LABEL_32;
        }
        if (a3 - *(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 32LL) < *(void *)(*(void *)(*(void *)(a1 + 80) + 8LL)
                                                                                          + 40LL))
          goto LABEL_32;
        [*(id *)(a1 + 40) addAddress:a3 origin:2];
        CSSymbolicatorGetSymbolWithAddressAtTime();
        v26 = CSSymbolGetName();
        if (!v26) {
          goto LABEL_32;
        }
        [NSString stringWithUTF8String:v26];
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = CSSymbolGetRange();
        v29 = *(void *)(*(void *)(a1 + 80) + 8LL);
        *(void *)(v29 + 32) = v28;
        *(void *)(v29 + 40) = v30;
        v31 = *(void **)(*(void *)(a1 + 32) + 496LL);
        v32 = *(void *)(a1 + 80);
LABEL_31:
        [v31 setRegionSymbolName:v27 forRange:*(void *)(*(void *)(v32 + 8) + 32), *(void *)(*(void *)(v32 + 8) + 40)];

LABEL_32:
        objc_autoreleasePoolPop(v12);
      }
    }
  }

        v19 = v18;
        goto LABEL_47;
      }
    }

    else if (v22)
    {
      if (v22 == 21) {
        goto LABEL_23;
      }
    }

    else if (v20[50] == 5)
    {
      goto LABEL_23;
    }

    if ((_DWORD)v19 == 1) {
      goto LABEL_46;
    }
    v23 = (16LL * (v19 - 1)) | 8;
    v32 = v19 - 1;
    v24 = v19 - 1;
    while (1)
    {
      if (!VMUGraphNodeType_IsVMRegion(*(_DWORD *)((_BYTE *)&self->_blocks->var0 + v23) & 7))
      {
        a3[v35] = v19;
        v19 = v18;
        ++v35;
        goto LABEL_51;
      }

      v25 = (id *)objc_retain(*(id *)((char *)&self->_regions->var0
                                    + ((*(unint64_t *)((char *)&self->_blocks->var0 + v23) >> 35) & 0x1FFFFFC0)));
      if (([v25 isSubmap] & 1) == 0) {
        break;
      }
LABEL_43:

      v23 -= 16LL;
      if (!--v24)
      {
        v19 = v18;
LABEL_51:
        v8 = v34;
        uint64_t v10 = v33;
        goto LABEL_47;
      }
    }

    v26 = *((_DWORD *)v25 + 26);
    v27 = *((_DWORD *)v21 + 26);
    if (v26 != v27
      || *((unsigned __int8 *)v25 + 49) != v21[49]
      || (v26 != 64 ? (v28 = (char *)v25[1] + (void)v25[2] == (char *)*((void *)v21 + 1)) : (v28 = 1), !v28))
    {
      if (!(v27 | v26)
        && (char *)v25[1] + (void)v25[2] == (char *)*((void *)v21 + 1)
        && [*((id *)v21 + 4) isEqualToString:VMUmappedFileLabel[0]]
        && [v25[4] isEqualToString:@"__LINKEDIT"]
        && [*((id *)v21 + 5) isEqualToString:v25[5]])
      {
        if ((_DWORD)v18 == v32) {
          v30 = v31;
        }
        else {
          v30 = v24;
        }
        v8 = v34;
        ((void (*)(void (**)(void), uint64_t, unint64_t, uint64_t, uint64_t, unint64_t))v34[2])( v34,  v30,  self->_blocks[v30].var0,  1LL,  v19,  self->_blocks[v19].var0);
        v31 = v30;
        goto LABEL_63;
      }

      goto LABEL_43;
    }

    if ((_DWORD)v18 == v32) {
      v29 = v31;
    }
    else {
      v29 = v24;
    }
    v8 = v34;
    ((void (*)(void (**)(void), uint64_t, unint64_t, uint64_t, uint64_t, unint64_t))v34[2])( v34,  v29,  self->_blocks[v29].var0,  1LL,  v19,  self->_blocks[v19].var0);
    v31 = v29;
    if (v35)
    {
    }

    else
    {
      v35 = 0;
    }

              if (*(void *)(*(void *)(*(void *)(a1 + 104) + 8LL) + 40LL))
              {
                *(_DWORD *)(*(void *)(*(void *)(a1 + 112) + 8LL) + 24LL) = 0;
                [*(id *)(a1 + 56) threadDescriptionStringForBacktrace:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) returnedAddress:0];
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                [ *(id *)(*(void *)(a1 + 32) + 496) setThreadName:v44 forRange: *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 32),  *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)];
                [*(id *)(*(void *)(a1 + 32) + 496) setThreadName:v44 forRange:v33];
              }

              else
              {
                if ([*(id *)(*(void *)(a1 + 32) + 8) isCore])
                {
                  v45 = &stru_189E010C8;
                }

                else
                {
                  [*(id *)(a1 + 56) threadDescriptionStringForBacktrace:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) returnedAddress:0];
                  v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
                }
                v46 = -[__CFString stringByAppendingString:]( v45,  "stringByAppendingString:",  @"  no associated pthread");
                [ *(id *)(*(void *)(a1 + 32) + 496) setThreadName:v46 forRange: *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 32)  *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)];
                [*(id *)(*(void *)(a1 + 32) + 496) setThreadName:v46 forRange:v33];
              }
            }
          }

          v47 = *(void **)(*(void *)(*(void *)(a1 + 104) + 8LL) + 40LL);
          if (!v47) {
            goto LABEL_32;
          }
          v48 = [v47 backtraceLength];
          if (*(_DWORD *)(*(void *)(*(void *)(a1 + 112) + 8LL) + 24LL) >= v48) {
            goto LABEL_32;
          }
          v49 = v48;
          while (1)
          {
            v50 = *(void *)([*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) stackFramePointers]
                            + 8LL * *(unsigned int *)(*(void *)(*(void *)(a1 + 112) + 8LL) + 24LL));
            v51 = [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) backtrace];
            v52 = *(void *)(*(void *)(a1 + 112) + 8LL);
            v53 = *(unsigned int *)(v52 + 24);
            if (v50 > a3) {
              break;
            }
            *(_DWORD *)(v52 + 24) = v53 + 1;
            if (*(_DWORD *)(*(void *)(*(void *)(a1 + 112) + 8LL) + 24LL) >= v49) {
              goto LABEL_32;
            }
          }

          v54 = *(void *)(v51 + 8 * v53);
          v55 = *(void *)(*(void *)(a1 + 88) + 8LL);
          *(void *)(v55 + 32) = a3;
          *(void *)(v55 + 40) = v50 - a3;
          CSSymbolicatorGetSymbolWithAddressAtTime();
          CSSymbolGetSymbolOwner();
          Name = CSSymbolOwnerGetName();
          else {
            [MEMORY[0x189NSStringormat:@"%s (in %s)", CSSymbolGetName(), Name];
          }
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v27) {
            goto LABEL_32;
          }
          v31 = *(void **)(*(void *)(a1 + 32) + 496LL);
          v32 = *(void *)(a1 + 88);
          goto LABEL_31;
        }

        CSIsNull();
LABEL_17:
        if (a3 - *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 32LL) >= *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL)
                                                                                           + 40LL))
        {
          CSSymbolicatorGetSectionWithAddressAtTime();
          v19 = CSRegionGetName();
          if (v19)
          {
            v20 = (const char *)v19;
            [NSString stringWithUTF8String:v19];
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            Range = CSRegionGetRange();
            v23 = *(void *)(*(void *)(a1 + 64) + 8LL);
            *(void *)(v23 + 32) = Range;
            *(void *)(v23 + 40) = v24;
            [ *(id *)(*(void *)(a1 + 32) + 496) setBinarySectionName:v21 forRange: *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 32) *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
            v25 = !strncmp(v20, "__DATA __objc_", 0xEuLL)
               || !strncmp(v20, "__AUTH __objc_", 0xEuLL)
               || !strncmp(v20, "__DATA_DIRTY __objc_", 0x14uLL)
               || !strncmp(v20, "__DATA_CONST __objc_", 0x14uLL)
               || !strncmp(v20, "__AUTH_CONST __objc_", 0x14uLL)
               || strncmp(v20, "__OBJC ", 7uLL) == 0;
            *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = v25;
          }
        }

        if (*(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL)) {
          goto LABEL_32;
        }
        if (a3 - *(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 32LL) < *(void *)(*(void *)(*(void *)(a1 + 80) + 8LL)
                                                                                          + 40LL))
          goto LABEL_32;
        [*(id *)(a1 + 40) addAddress:a3 origin:2];
        CSSymbolicatorGetSymbolWithAddressAtTime();
        v26 = CSSymbolGetName();
        if (!v26) {
          goto LABEL_32;
        }
        [NSString stringWithUTF8String:v26];
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = CSSymbolGetRange();
        v29 = *(void *)(*(void *)(a1 + 80) + 8LL);
        *(void *)(v29 + 32) = v28;
        *(void *)(v29 + 40) = v30;
        v31 = *(void **)(*(void *)(a1 + 32) + 496LL);
        v32 = *(void *)(a1 + 80);
LABEL_31:
        [v31 setRegionSymbolName:v27 forRange:*(void *)(*(void *)(v32 + 8) + 32) * (void) * (void *)(v32 + 8) + 40];

LABEL_32:
        objc_autoreleasePoolPop(v12);
      }
    }
  }

    __s1 = (char *)CSSymbolOwnerGetPath();
    if (!CSSymbolOwnerGetName())
    {
      ((void (**)(void, const __CFString *))v104)[2]( v104,  @"couldn't get framework name associated with the malloc zone");
      v58 = 0;
      goto LABEL_108;
    }

    CSSymbolicatorGetFlagsForNListOnlyData();
    CSSymbolicatorCreateWithTaskFlagsAndNotification();
    CSSymbolicatorGetSymbolOwnerWithNameAtTime();
    if ((CSIsNull() & 1) == 0)
    {
      if (logZoneIntrospectionLookup == 1)
      {
        v59 = [v43 UTF8String];
        Path = CSSymbolOwnerGetPath();
        NSLog( @"zone %s - using analysis tool's' %s to look for zone introspect struct for target process's %s\n",  v59,  Path,  __s1);
      }

    v29 = v23;
    v32 = v24;
    v31 = v22;
    if (feof(v19)) {
      goto LABEL_90;
    }
  }

  v22 = v31;
  v24 = v32;
  v23 = v29;
LABEL_90:
  uint64_t v10 = v64;
  a5 = v66;
  if (!v30 || (v65 & 1) != 0)
  {
    a6 = v63;
    v21 = (VMUCallTreeRoot *)p_isa;
    if ((v65 & 1) != 0) {
      goto LABEL_104;
    }
    goto LABEL_20;
  }

  [p_isa allBacktracesHaveBeenAdded];
  v25 = v69;
  if (v68) {
    *v68 = v69;
  }
  if (v66) {
    *v66 = v77;
  }
  v27 = v72;
  if (v63)
  {
    v56 = v76;
    *v63 = v56;
    objc_storeStrong(p_isa + 18, v56);
  }

  v26 = p_isa;
LABEL_27:
  uint64_t v12 = v26;

  uint64_t v15 = v12;
LABEL_28:

LABEL_29:
  return v15;
}

LABEL_17:
    id v4 = 0LL;
    return v4;
  }

    id v4 = 0LL;
    return v4;
  }

  [v3 appendString:@"  REF"];
  if ((a1 & 8) == 0)
  {
LABEL_5:
    if ((a1 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }

    v62 = (void *)*((void *)v14 + 49);
    *((void *)v14 + 49) = v56;

    uint64_t v12 = v147;
    goto LABEL_18;
  }

    goto LABEL_18;
  }

  NSLog(@"*** task_malloc_get_all_zones: can't get target task symbolicator\n");
  uint64_t v11 = 0LL;
  uint64_t v12 = 0LL;
LABEL_18:

  v21 = CSIsNull();
  if (v12 && (v21 & 1) == 0 && v11)
  {
    v22 = 0LL;
    v23 = 0x189607000uLL;
    v94 = v5;
    v98 = v12;
    while (1)
    {
      v24 = (void *)MEMORY[0x186E32E40]();
      v25 = v12[v22];
      [v5 memoryCache];
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = [v26 peekAtAddress:v25 size:200 returnsBuf:&v106];

      if (!(_DWORD)v27) {
        break;
      }
      NSLog(@"*** Symbolication:  Can't read zone 0x%qx (error %d)\n", v25, v27);
LABEL_133:
      objc_autoreleasePoolPop(v24);
      if (++v22 >= v11) {
        goto LABEL_140;
      }
    }

    v28 = v106;
    v29 = v5;
    v30 = v29;
    if (*(void *)(v28 + 72)
      && ([v29 memoryCache],
          v31 = (void *)objc_claimAutoreleasedReturnValue(),
          v32 = [v31 peekStringAtAddress:*(void *)(v28 + 72)],
          v31,
          v32))
    {
      [*(id *)(v23 + 2600) stringWithFormat:@"%s_0x%qx", v32, v25];
    }

    else
    {
      [*(id *)(v23 + 2600) stringWithFormat:@"unnamed_zone_0x%qx" v25, v89];
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue();

    [*(id *)(v23 + 2600) stringWithFormat:@"preparing to enumerate %@\n", v33];
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    VMUSetCrashReporterInfo(v105);
    v34 = v106;
    v35 = v30;
    v36 = v33;
    v124 = 0LL;
    v125 = &v124;
    v126 = 0x2020000000LL;
    v127 = 0LL;
    v120 = 0LL;
    v121 = &v120;
    v122 = 0x2020000000LL;
    v123 = 0;
    v101 = v24;
    if (remoteZoneIntrospection_onceToken != -1) {
      dispatch_once(&remoteZoneIntrospection_onceToken, &__block_literal_global_17);
    }
    v37 = MEMORY[0x1895F87A8];
    v117[0] = (id)MEMORY[0x1895F87A8];
    v117[1] = (id)3221225472LL;
    v117[2] = __remoteZoneIntrospection_block_invoke_2;
    v117[3] = &unk_189DFFD38;
    v38 = v35;
    v118 = v38;
    v39 = v36;
    v119 = v39;
    v40 = (void *)MEMORY[0x186E33044](v117);
    v115[0] = v37;
    v115[1] = 3221225472LL;
    v115[2] = __remoteZoneIntrospection_block_invoke_3;
    v115[3] = &unk_189DFFD60;
    v41 = v40;
    v116 = v41;
    v42 = (void *)MEMORY[0x186E33044](v115);
    v113[0] = v37;
    v113[1] = 3221225472LL;
    v113[2] = __remoteZoneIntrospection_block_invoke_4;
    v113[3] = &unk_189DFFD60;
    v100 = v41;
    v114 = v100;
    v103 = (uint64_t (**)(void))MEMORY[0x186E33044](v113);
    v108[0] = v37;
    v108[1] = 3221225472LL;
    v108[2] = __remoteZoneIntrospection_block_invoke_5;
    v108[3] = &unk_189DFFD88;
    v102 = v42;
    v110 = v102;
    v43 = v39;
    v109 = v43;
    v111 = &v120;
    v112 = &v124;
    v104 = (void (**)(void, void))MEMORY[0x186E33044](v108);
    if ([v38 isExclave])
    {
      if (remoteZoneIntrospection_exclaveIntrospectionDetailsToken != -1) {
        dispatch_once(&remoteZoneIntrospection_exclaveIntrospectionDetailsToken, &__block_literal_global_57);
      }
      v44 = v105;
      v45 = &remoteZoneIntrospection_exclaveIntrospectionDetails;
      if ((remoteZoneIntrospection_getExclaveIntrospectionSucceeded & 1) == 0)
      {
        ((void (**)(void, const __CFString *))v104)[2]( v104,  @"Failed to find xzm zone introspection structure");
        v46 = 0LL;
        v44 = v105;
LABEL_128:

        _Block_object_dispose(&v120, 8);
        _Block_object_dispose(&v124, 8);

        v87 = v44;
        if (v46)
        {
          VMUSetCrashReporterInfo(v87);
          v108[0] = 0LL;
          LODWORD(v117[0]) = 0;
          malloc_get_all_zones();
          v88 = v97[2](v97, v25, v46, v43);
          if ((_DWORD)v88) {
            NSLog(@"*** Symbolication:  Can't read pointers from zone %@ (error %d)\n", v43, v88);
          }
          VMUClearCrashReporterInfo();
          unregister_new_local_zones();
        }

        uint64_t v11 = v107;
        uint64_t v12 = v98;
        v23 = 0x189607000LL;
        v24 = v101;
        goto LABEL_133;
      }

  uint64_t v10 = 1LL;
LABEL_18:

  return v10;
}

          v22 = [MEMORY[0x1896NSStringrmat:@"No object labels had %lu duplicates."];

          v23 = objc_alloc(&OBJC_CLASS___VMUAnalyzerSummaryField);
          v24 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:]( v23,  "initWithKey:numericalValue:objectValue:fieldType:",  kVMUAnalysisWarningKey[0],  0LL,  v22,  0LL);
          uint64_t v11 = (void *)v22;
          goto LABEL_18;
        }

        uint64_t v16 = v11;
        v29 = 0;
LABEL_14:
        uint64_t v17 = self->super._graph;
        -[VMUProcessObjectGraph symbolStore](v17, "symbolStore");
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = [v18 symbolicator];
        v21 = v20;
        v30[0] = MEMORY[0x1895F87A8];
        v30[1] = 3221225472LL;
        v30[2] = __47__VMUDuplicatesAnalyzer_fullAnalysisWithBlock___block_invoke_2;
        v30[3] = &unk_189E00B18;
        v31 = v4;
        LOBYTE(v17) = -[VMUDuplicatesAnalyzer findStringDupsInGraph:symbolicator:stackLogReader:fieldBlock:]( self,  "findStringDupsInGraph:symbolicator:stackLogReader:fieldBlock:",  v17,  v19,  v21,  v15,  v30);

        uint64_t v11 = v16;
        if ((v17 & 1) != 0)
        {
          if ((v29 & 1) != 0) {
            goto LABEL_21;
          }
          goto LABEL_20;
        }

        goto LABEL_17;
      }

      uint64_t v16 = v11;
    }

    else
    {
      uint64_t v16 = v11;
      uint64_t v15 = 0LL;
    }

    v29 = 1;
    goto LABEL_14;
  }

  uint64_t v5 = objc_alloc(&OBJC_CLASS___VMUAnalyzerSummaryField);
  id v6 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:]( v5,  "initWithKey:numericalValue:objectValue:fieldType:",  kVMUAnalysisErrorKey[0],  0LL,  @"The memory graph file does not contain any labels for allocations.",  0LL);
  v4[2](v4, v6);
LABEL_22:
}

LABEL_8:
  uint64_t v14 = (char *)regionMap + 4 * (v11 & 0x7FFFF);
  uint64_t v17 = *((_DWORD *)v14 + 16);
  uint64_t v16 = v14 + 64;
  uint64_t v15 = v17;
  var4 = regionMap->var4;
  if (v17)
  {
    p_var0 = &var4[(unint64_t)(v15 - 1)].var0;
    if (a3 - *((void *)*p_var0 + 1) < *((void *)*p_var0 + 2)) {
      goto LABEL_10;
    }
  }

  var5 = regionMap->var5;
  if (!(_DWORD)var5) {
    goto LABEL_17;
  }
  v21 = regionMap->var4;
  while (1)
  {
    v22 = var5 >> 1;
    p_var0 = &v21[var5 >> 1].var0;
    if (*((void *)*p_var0 + 1) <= a3) {
      break;
    }
LABEL_16:
    v23 = var5 >= 2;
    var5 = v22;
    if (!v23) {
      goto LABEL_17;
    }
  }

  if (*((void *)*p_var0 + 2) + *((void *)*p_var0 + 1) <= a3)
  {
    v21 = (_VMURegionNode *)(p_var0 + 8);
    v22 = --var5 >> 1;
    goto LABEL_16;
  }

  v25 = [*p_var0 isSpecialPhysFootprintRegion];
  id v4 = 0LL;
  if (v25) {
    v26 = 0LL;
  }
  else {
    v26 = p_var0;
  }
  if ((v25 & 1) != 0) {
    return v4;
  }
  if ((*((_BYTE *)*v26 + 132) & 1) == 0) {
    goto LABEL_36;
  }
  v27 = v26 + 8;
  v28 = regionMap->var5 - (((char *)(v26 + 8) - (char *)regionMap->var4) >> 6);
  if (!v28) {
    goto LABEL_33;
  }
  while (2)
  {
    v29 = v28 >> 1;
    v30 = &v27[8 * (v28 >> 1)];
    if (*((void *)*v30 + 1) > a3)
    {
LABEL_28:
      v31 = v28 > 1;
      v28 = v29;
      if (!v31)
      {
        v28 = 0LL;
        goto LABEL_33;
      }

      continue;
    }

    break;
  }

  if (*((void *)*v30 + 2) + *((void *)*v30 + 1) <= a3)
  {
    v27 = v30 + 8;
    v29 = --v28 >> 1;
    goto LABEL_28;
  }

  else {
    v28 = (unint64_t)v30;
  }
LABEL_33:
  if (v28) {
    v26 = (id *)v28;
  }
  p_var0 = v26;
LABEL_36:
  *uint64_t v16 = ((unint64_t)((char *)v26 - (char *)var4) >> 6) + 1;
LABEL_10:
  id v4 = *p_var0;
  return v4;
}

  uint64_t v14 = (char *)regionMap + 4 * (v11 & 0x7FFFF);
  uint64_t v17 = *((_DWORD *)v14 + 16);
  uint64_t v16 = v14 + 64;
  uint64_t v15 = v17;
  var4 = regionMap->var4;
  if (v17)
  {
    p_var0 = &var4[(unint64_t)(v15 - 1)].var0;
    if (a3 - *((void *)*p_var0 + 1) < *((void *)*p_var0 + 2)) {
      goto LABEL_10;
    }
  }

  var5 = regionMap->var5;
  if (!(_DWORD)var5) {
    goto LABEL_17;
  }
  v21 = regionMap->var4;
  while (1)
  {
    v22 = var5 >> 1;
    p_var0 = &v21[var5 >> 1].var0;
    if (*((void *)*p_var0 + 1) <= a3) {
      break;
    }
LABEL_16:
    v23 = var5 >= 2;
    var5 = v22;
    if (!v23) {
      goto LABEL_17;
    }
  }

  if (*((void *)*p_var0 + 2) + *((void *)*p_var0 + 1) <= a3)
  {
    v21 = (_VMURegionNode *)(p_var0 + 8);
    v22 = --var5 >> 1;
    goto LABEL_16;
  }

  v25 = [*p_var0 isSpecialPhysFootprintRegion];
  id v4 = 0LL;
  if (v25) {
    v26 = 0LL;
  }
  else {
    v26 = p_var0;
  }
  if ((v25 & 1) != 0) {
    return v4;
  }
  if ((*((_BYTE *)*v26 + 132) & 1) == 0) {
    goto LABEL_36;
  }
  v27 = v26 + 8;
  v28 = regionMap->var5 - (((char *)(v26 + 8) - (char *)regionMap->var4) >> 6);
  if (!v28) {
    goto LABEL_33;
  }
  while (2)
  {
    v29 = v28 >> 1;
    v30 = &v27[8 * (v28 >> 1)];
    if (*((void *)*v30 + 1) > a3)
    {
LABEL_28:
      v31 = v28 > 1;
      v28 = v29;
      if (!v31)
      {
        v28 = 0LL;
        goto LABEL_33;
      }

      continue;
    }

    break;
  }

  if (*((void *)*v30 + 2) + *((void *)*v30 + 1) <= a3)
  {
    v27 = v30 + 8;
    v29 = --v28 >> 1;
    goto LABEL_28;
  }

  else {
    v28 = (unint64_t)v30;
  }
LABEL_33:
  if (v28) {
    v26 = (id *)v28;
  }
  p_var0 = v26;
LABEL_36:
  *uint64_t v16 = ((unint64_t)((char *)v26 - (char *)var4) >> 6) + 1;
LABEL_10:
  id v4 = *p_var0;
  return v4;
}

  _Block_object_dispose(&v17, 8);
}

    -[VMUCallTreeNode pseudoNodeTopOfStackChild](self, "pseudoNodeTopOfStackChild");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMUCallTreeNode sortedChildrenWithPseudoNode:withCompare:]( self,  "sortedChildrenWithPseudoNode:withCompare:",  v7,  sel_compare_);
    id v4 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }

  if (numChildren)
  {
    id v6 = 0LL;
    goto LABEL_8;
  }

  [MEMORY[0x189603F18] array];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

  uint64_t v17 = 0LL;
LABEL_30:

  return v17;
}

      id v4 = @"unknown";
      goto LABEL_11;
    }

    id v4 = @"I386 Simple";
  }

  return v7;
}

  return self;
}

LABEL_4:
  id v6 = v5->var0;
LABEL_5:
  id v7 = *((_DWORD *)v6 + 37);
  if (self->_zonesCount <= v7) {
    goto LABEL_43;
  }
  v8 = (void *)[self->_zones[v7].var1 copy];
  return v8;
}

  id v6 = v5->var0;
LABEL_5:
  id v7 = *((_DWORD *)v6 + 37);
  if (self->_zonesCount <= v7) {
    goto LABEL_43;
  }
  v8 = (void *)[self->_zones[v7].var1 copy];
  return v8;
}

  if (v10)
  {
    uint64_t v13 = [v12 isEqualToString:v10];
    uint64_t v14 = v12;

    if ((v13 & 1) != 0) {
      goto LABEL_12;
    }
    if (v9) {
      goto LABEL_7;
    }
LABEL_10:
    [(id)objc_opt_class() nodeWithName:self->_name address:self->_address count:self->_count numBytes:self->_numBytes];
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }

  uint64_t v14 = 0LL;
LABEL_12:
  uint64_t v16 = -[VMUCallTreeNode numChildren](self, "numChildren");
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = 0LL;
    do
    {
      v19 = -[VMUCallTreeNode childAtIndex:](self, "childAtIndex:", v18);
      v20 = (id)[v19 chargeLibrariesInSet:v8 toCaller:v9 parentLibrary:v14];

      uint64_t v18 = (v18 + 1);
    }

    while (v17 != (_DWORD)v18);
  }

  objc_autoreleasePoolPop(v11);
  return v9;
}
}

  uint64_t v10 = 0LL;
LABEL_34:

  return v10;
}

LABEL_34:
    id v4 = 0LL;
    return v4;
  }

  do
  {
    v36 = v21 >> 1;
    v31 = &v25[v36].var0;
    v32 = *v31;
    if (*v31 <= a3)
    {
      if (((*((void *)&v25[v36] + 1) >> 5) & 0xFFFFFFFFFLL) + v32 > a3) {
        goto LABEL_47;
      }
      v25 = (_VMUBlockNode *)(v31 + 2);
      LODWORD(v36) = --v21 >> 1;
    }

    id v4 = 0LL;
    v35 = v21 >= 2;
    v21 = v36;
  }

  while (v35);
  return v4;
}

    id v4 = 0LL;
    return v4;
  }

  do
  {
    v36 = v21 >> 1;
    v31 = &v25[v36].var0;
    v32 = *v31;
    if (*v31 <= a3)
    {
      if (((*((void *)&v25[v36] + 1) >> 5) & 0xFFFFFFFFFLL) + v32 > a3) {
        goto LABEL_47;
      }
      v25 = (_VMUBlockNode *)(v31 + 2);
      LODWORD(v36) = --v21 >> 1;
    }

    id v4 = 0LL;
    v35 = v21 >= 2;
    v21 = v36;
  }

  while (v35);
  return v4;
}

  if (return_address) {
    v23 = v11;
  }
  else {
    v23 = 0;
  }
  if (v23 != 1)
  {
    if (v11)
    {
      v28 = "";
      if (v21) {
        v28 = v21;
      }
      v29 = 3LL;
      if (self->_objectContentLevel != 3) {
        v29 = 0LL;
      }
      v30 = [MEMORY[0x189NSStringormat:@"[%.*f seconds] %s" v29, *(void *)&v12, v28];
    }

    else
    {
      if (!v21)
      {
        uint64_t v5 = 0LL;
        if (!v20) {
          return v5;
        }
        goto LABEL_43;
      }

      v30 = [NSString stringWithUTF8String:v21];
    }

    uint64_t v5 = (void *)v30;
    if (!v20) {
      return v5;
    }
    goto LABEL_43;
  }
  v24 = -[VMUObjectIdentifier symbolForRemoteAddress:](self, "symbolForRemoteAddress:", return_address - 1);
  v25 = "";
  if (v21) {
    v25 = v21;
  }
  v26 = 3LL;
  if (self->_objectContentLevel != 3) {
    v26 = 0LL;
  }
  [NSString stringWithFormat:@"[%.*f seconds] %s  Created at: %@", v26, *(void *)&v12, v25, v24];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20) {
LABEL_43:
  }
    free(v21);
  return v5;
}

LABEL_9:
  uint64_t v18 = (char *)regionMap + 4 * (v15 & 0x7FFFF);
  v21 = *((_DWORD *)v18 + 16);
  v20 = v18 + 64;
  v19 = v21;
  var4 = regionMap->var4;
  if (v21)
  {
    v23 = &var4[(unint64_t)(v19 - 1)];
    if (a3.location - *((void *)v23->var0 + 1) < *((void *)v23->var0 + 2)) {
      goto LABEL_11;
    }
  }

  var5 = regionMap->var5;
  if (!(_DWORD)var5) {
    return 0LL;
  }
  v27 = regionMap->var4;
  while (1)
  {
    v28 = var5 >> 1;
    v23 = &v27[var5 >> 1];
    if (*((void *)v23->var0 + 1) <= a3.location) {
      break;
    }
LABEL_20:
    v8 = var5 >= 2;
    var5 = v28;
    if (!v8) {
      return 0LL;
    }
  }

  if (*((void *)v23->var0 + 2) + *((void *)v23->var0 + 1) <= a3.location)
  {
    v27 = v23 + 1;
    v28 = --var5 >> 1;
    goto LABEL_20;
  }

  v29 = [v23->var0 isSpecialPhysFootprintRegion];
  id v4 = 0LL;
  if (v29) {
    v30 = 0LL;
  }
  else {
    v30 = (unint64_t)v23;
  }
  if ((v29 & 1) != 0) {
    return v4;
  }
  uint64_t v14 = (_DWORD *)MEMORY[0x1895FD580];
  if ((*(_BYTE *)(*(void *)v30 + 132LL) & 1) == 0) {
    goto LABEL_66;
  }
  v31 = (id *)(v30 + 64);
  v32 = regionMap->var5 - ((uint64_t)(v30 + 64 - (unint64_t)regionMap->var4) >> 6);
  if (!v32) {
    goto LABEL_63;
  }
  while (2)
  {
    v33 = v32 >> 1;
    v34 = &v31[8 * (v32 >> 1)];
    if (*((void *)*v34 + 1) > location)
    {
LABEL_34:
      v35 = v32 > 1;
      v32 = v33;
      if (!v35)
      {
        v32 = 0LL;
        goto LABEL_62;
      }

      continue;
    }

    break;
  }

  if (*((void *)*v34 + 2) + *((void *)*v34 + 1) <= location)
  {
    v31 = v34 + 8;
    v33 = --v32 >> 1;
    goto LABEL_34;
  }

  v53 = v30;
  v54 = [*v34 isSpecialPhysFootprintRegion];
  v30 = v53;
  if (v54) {
    v32 = 0LL;
  }
  else {
    v32 = (unint64_t)v34;
  }
LABEL_62:
  uint64_t v14 = (_DWORD *)MEMORY[0x1895FD580];
LABEL_63:
  if (v32) {
    v30 = v32;
  }
  v23 = (_VMURegionNode *)v30;
LABEL_66:
  *v20 = ((v30 - (unint64_t)var4) >> 6) + 1;
LABEL_11:
  v24 = v23->var0;
  v25 = v24;
  if ((*((_BYTE *)v24 + 132) & 2) != 0)
  {
    else {
      id v4 = v23;
    }
    goto LABEL_71;
  }

  if (v11 && ([*((id *)v24 + 4) isEqualToString:VMUunusedSharedLibTextLabel[0]] & 1) != 0)
  {
LABEL_14:
    id v4 = v23;
    goto LABEL_71;
  }

  if (!self->_initializedRegionMallocBlockCounts)
  {
    else {
      id v4 = 0LL;
    }
    goto LABEL_71;
  }

  if (!v25[17]) {
    goto LABEL_70;
  }
  v36 = v23->var3;
  if (!v36) {
    goto LABEL_70;
  }
  v37 = self->_regionMap;
  var1 = v23->var1;
  var0 = v37->var0;
  var2 = v23->var2;
  v41 = &v37->var0[var2];
  if (var1)
  {
    v42 = v41->var0;
    if (v42 <= location)
    {
      v43 = &var0[v36 - 1 + var2];
      if (((*((void *)v43 + 1) >> 5) & 0xFFFFFFFFFLL) + v43->var0 > location)
      {
        v44 = v14;
        id v4 = 0LL;
        v45 = &var1[(location - (v42 & -*MEMORY[0x1895FD590])) >> *v44];
        v46 = *v45;
        p_var0 = &var0[v46].var0;
        if (*p_var0 > location) {
          goto LABEL_71;
        }
        v48 = v45[1];
        if (v48 < v37->var1 && (v49 = &var0[v48].var0, *v49 <= location))
        {
LABEL_67:
          v55 = (char *)v49 - (char *)var0;
          if (self->_blocksCount > (v55 >> 4)
            && (!length
             || ((*(void *)((char *)self->_blocks + (v55 & 0xFFFFFFFF0LL) + 8) >> 5) & 0xFFFFFFFFFLL)
              + *(unint64_t *)((char *)&self->_blocks->var0 + (v55 & 0xFFFFFFFF0LL)) >= location + length))
          {
            goto LABEL_14;
          }
        }

        else
        {
          v50 = v48 - v46;
          if ((_DWORD)v48 != (_DWORD)v46)
          {
            do
            {
              v51 = v50 >> 1;
              v49 = &p_var0[2 * v51];
              if (*v49 <= location)
              {
                if (((p_var0[2 * v51 + 1] >> 5) & 0xFFFFFFFFFLL) + *v49 > location) {
                  goto LABEL_67;
                }
                p_var0 = v49 + 2;
                LODWORD(v51) = --v50 >> 1;
              }

              id v4 = 0LL;
              v8 = v50 >= 2;
              v50 = v51;
            }

            while (v8);
            goto LABEL_71;
          }
        }
      }
    }

  uint64_t v12 = 1LL;
LABEL_13:

  return v12;
}

  uint64_t v18 = 0LL;
LABEL_32:

  return v18;
}

LABEL_70:
    id v4 = 0LL;
    goto LABEL_71;
  }

  do
  {
    v52 = v36 >> 1;
    v49 = &v41[v52].var0;
    if (*v49 <= location)
    {
      if (((*((void *)&v41[v52] + 1) >> 5) & 0xFFFFFFFFFLL) + *v49 > location) {
        goto LABEL_67;
      }
      v41 = (_VMUBlockNode *)(v49 + 2);
      LODWORD(v52) = --v36 >> 1;
    }

    id v4 = 0LL;
    v8 = v36 >= 2;
    v36 = v52;
  }

  while (v8);
LABEL_71:

  return v4;
}

      ++v7;
    }

    while (v7 != v8);
  }

          v85 = v84;
          descriptionOfValueAtAddressWithTypeEncoding(v48, &v85, *(unsigned int *)(a1 + 64), *(void *)(a1 + 32));
          v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v57 = v56;
          goto LABEL_71;
        }

        if (v55 != 76 && v55 != 81) {
          goto LABEL_70;
        }
      }

void sub_1860D7E88( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

LABEL_39:
    LODWORD(self) = -1;
    return self;
  }

  do
  {
    v34 = v19 >> 1;
    v30 = &v23[v34].var0;
    if (*v30 <= a3)
    {
      if (((*((void *)&v23[v34] + 1) >> 5) & 0xFFFFFFFFFLL) + *v30 > a3) {
        return (unint64_t)((char *)v30 - (char *)var0) >> 4;
      }
      v23 = (_VMUBlockNode *)(v30 + 2);
      LODWORD(v34) = --v19 >> 1;
    }

    LODWORD(self) = -1;
    v33 = v19 >= 2;
    v19 = v34;
  }

  while (v33);
  return self;
}

    LODWORD(self) = -1;
    return self;
  }

  do
  {
    v36 = v21 >> 1;
    v31 = &v25[v36].var0;
    v32 = *v31;
    if (*v31 <= a3)
    {
      if (((*((void *)&v25[v36] + 1) >> 5) & 0xFFFFFFFFFLL) + v32 > a3) {
        goto LABEL_48;
      }
      v25 = (_VMUBlockNode *)(v31 + 2);
      LODWORD(v36) = --v21 >> 1;
    }

    LODWORD(self) = -1;
    v35 = v21 >= 2;
    v21 = v36;
  }

  while (v35);
  return self;
}

    LODWORD(self) = -1;
    return self;
  }

  do
  {
    v34 = v19 >> 1;
    v30 = &v23[v34].var0;
    if (*v30 <= a3)
    {
      if (((*((void *)&v23[v34] + 1) >> 5) & 0xFFFFFFFFFLL) + *v30 > a3) {
        return (unint64_t)((char *)v30 - (char *)var0) >> 4;
      }
      v23 = (_VMUBlockNode *)(v30 + 2);
      LODWORD(v34) = --v19 >> 1;
    }

    LODWORD(self) = -1;
    v33 = v19 >= 2;
    v19 = v34;
  }

  while (v33);
  return self;
}

    LODWORD(self) = -1;
    return self;
  }

  do
  {
    v36 = v21 >> 1;
    v31 = &v25[v36].var0;
    v32 = *v31;
    if (*v31 <= a3)
    {
      if (((*((void *)&v25[v36] + 1) >> 5) & 0xFFFFFFFFFLL) + v32 > a3) {
        goto LABEL_48;
      }
      v25 = (_VMUBlockNode *)(v31 + 2);
      LODWORD(v36) = --v21 >> 1;
    }

    LODWORD(self) = -1;
    v35 = v21 >= 2;
    v21 = v36;
  }

  while (v35);
  return self;
}

  ++*(void *)(a1 + 24);
  return i;
}

  ++*(void *)(a1 + 24);
  return i;
}
}

  ++*(void *)(a1 + 24);
  return v12;
}

  ++*(void *)(a1 + 24);
  return i;
}

  ++*(void *)(a1 + 24);
  return v10;
}

  ++*(void *)(a1 + 24);
  return v10;
}

  ++*(void *)(a1 + 24);
  return v10;
}

  ++*(void *)(a1 + 24);
  return v12;
}

  ++*(void *)(a1 + 24);
  return v12;
}

uint64_t ___unmapRegion_block_invoke(uint64_t a1)
{
  unint64_t v12 = 0LL;
  unint64_t v13 = 0LL;
  uint64_t result = [*(id *)(a1 + 32) unmapAddress:*(void *)(**(void **)(a1 + 48) + 8) size:*(void *)(*(void *)(a1 + 48) + 40) returnedAddress:&v13 returnedSize:&v12];
  if ((_DWORD)result)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t result = fprintf( (FILE *)*MEMORY[0x1895F89D0],  "Failed to deallocate mapped region %#llx-%#llx[%llu] with local addresses %p-%p[%llu]\n",  *(void *)(*(void *)v3 + 8LL),  *(void *)(*(void *)v3 + 16LL) + *(void *)(*(void *)v3 + 8LL),  *(void *)(*(void *)v3 + 16LL),  *(const void **)(v3 + 48),  (const void *)(*(void *)(v3 + 48) + *(void *)(v3 + 40)),  *(void *)(v3 + 40));
LABEL_3:
    id v4 = *(void **)(a1 + 48);
    v4[5] = 0LL;
    v4[6] = 0LL;
    v4[7] = 0LL;
    return result;
  }

  if (!v13) {
    goto LABEL_3;
  }
  uint64_t result = [*(id *)(a1 + 40) flushRemoteMirrorMemoryCacheEntryForAddress:*(void *)(**(void **)(a1 + 48) + 8)];
  uint64_t v5 = *(void **)(a1 + 48);
  for (unint64_t i = *(void *)(a1 + 56); (unint64_t)v5 > i; v5 -= 8)
  {
    if (v13 >= *(void *)(*v5 + 8LL)) {
      break;
    }
  }

  unint64_t v7 = v12;
  if (v12)
  {
    do
    {
      v5[5] = 0LL;
      v5[6] = 0LL;
      v5[7] = 0LL;
      uint64_t v8 = *v5;
      v5 += 8;
      unint64_t v9 = *(void *)(v8 + 16);
      BOOL v10 = v7 >= v9;
      v7 -= v9;
      BOOL v11 = v7 != 0 && v10;
      if (!v10) {
        unint64_t v7 = 0LL;
      }
    }

    while (v11);
  }

  return result;
}

void sub_1860D9C6C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37)
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

uint64_t _pointerRecorderBlockContextAdapter_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a2 + 16))(a2, a3, a4, a5);
}

LABEL_87:
      v31 = (v31 + 1);
    }

    while (v31 < self->_threadsCount);
  }

  if (s_enumeratorDebugging_0)
  {
    fwrite("Region state after claims:\n", 0x1BuLL, 1uLL, (FILE *)*MEMORY[0x1895F89D0]);
    if (!self->_regionsCount) {
      goto LABEL_120;
    }
    v87 = 0LL;
    v88 = 0LL;
    do
    {
      v105 = (FILE *)*MEMORY[0x1895F89D0];
      v103 = [self->_regions[v87].var0 address];
      v89 = self->_regions[v87].var0;
      v90 = *((unsigned int *)v89 + 6);
      v91 = v89[2];
      v100 = v89[1];
      v101 = vm_prot_strings_0[v90];
      v92 = VMURegionTypeDescriptionForTagShareProtAndPager( *((unsigned __int8 *)v89 + 104),  *((unsigned __int8 *)v89 + 50),  v90,  *((unsigned __int8 *)v89 + 49));
      v93 = (const char *)[v92 UTF8String];
      v94 = &self->_regions[v87];
      v95 = *((void *)v94->var0 + 2) >> *MEMORY[0x1895FD580];
      if (v95 == 1) {
        v96 = "page";
      }
      else {
        v96 = "pages";
      }
      v97 = "";
      if (v94->var4 == v94->var5) {
        v98 = "";
      }
      else {
        v98 = " [root]";
      }
      v99 = *((_DWORD *)v94->var0 + 37);
      if (v99 < self->_zonesCount) {
        v97 = (const char *)[self->_zones[v99].var1 UTF8String];
      }
      fprintf(v105, "region: [%#llx-%#llx] %s %s (%llu %s)%s  %s\n", v103, v91 + v100, v101, v93, v95, v96, v98, v97);

      ++v88;
      v71 = self->_regionsCount;
      ++v87;
    }

    while (v88 < v71);
  }

  else
  {
    v71 = self->_regionsCount;
  }

  if (v71)
  {
    for (k = 0LL; k < v71; ++k)
    {
      v73 = self->_regions;
      if (v73[k].var4 != v73[k].var5)
      {
        blocksCount = self->_blocksCount;
        blocksSize = self->_blocksSize;
        if (blocksSize <= blocksCount)
        {
          else {
            v76 = 2 * blocksSize;
          }
          do
          {
            v77 = v76;
            v76 *= 2;
          }

          while (v77 < blocksCount);
          self->_blocksSize = v77;
          v78 = (_VMUBlockNode *)realloc(self->_blocks, 16LL * v77);
          self->_blocks = v78;
          if (!v78)
          {
            NSLog( @"Out of memory: failed to expand %s from %u to %u entries",  "_blocks",  blocksSize,  self->_blocksSize);
            abort();
          }

          v73 = self->_regions;
        }

        v79 = v73[k].var0;
        else {
          v80 = 5LL;
        }
        v81 = &self->_blocks[self->_blocksCount];
        v82 = &self->_regions[k];
        v83 = v82->var4;
        v84 = v80 & 0xFFFFFFE00000001FLL | (32LL * (LODWORD(v82->var5) - v83)) | (k << 41);
        v81->var0 = v83;
        *((void *)v81 + 1) = v84;
        ++self->_blocksCount;

        v71 = self->_regionsCount;
      }
    }
  }

LABEL_120:
  if (-[VMUKernelCoreMemoryScanner objectContentLevel](self, "objectContentLevel") == 2)
  {
    v85 = -[VMUKernelCoreMemoryScanner _readonlyRegionRanges](self, "_readonlyRegionRanges");
    -[VMUObjectIdentifier setReadonlyRegionRanges:](self->_objectIdentifier, "setReadonlyRegionRanges:", v85);
  }

  return 1;
}

LABEL_26:
                              v40 = v33 + 4 * (v37 & 0x7FFFF);
                              v43 = *(_DWORD *)(v40 + 64);
                              v42 = (_DWORD *)(v40 + 64);
                              v41 = v43;
                              if (v43)
                              {
                                v27 = *(void *)(v33 + 32) + ((unint64_t)(v41 - 1) << 6);
                                if (v18 - *(void *)(*(void *)v27 + 8LL) < *(void *)(*(void *)v27 + 16LL)) {
                                  continue;
                                }
                              }

                              break;
                            }

                            v44 = *(unsigned int *)(v33 + 40);
                            if (!(_DWORD)v44) {
                              goto LABEL_70;
                            }
                            v45 = *(void *)(v33 + 32);
                            while (1)
                            {
                              v46 = v44 >> 1;
                              v27 = v45 + (v44 >> 1 << 6);
                              if (*(void *)(*(void *)v27 + 8LL) <= v18)
                              {
                                if (*(void *)(*(void *)v27 + 16LL) + *(void *)(*(void *)v27 + 8LL) > v18)
                                {
                                  v80 = *(void *)(v33 + 32);
                                  v47 = [*(id *)v27 isSpecialPhysFootprintRegion];
                                  v48 = v80;
                                  BOOL v10 = (_BYTE *)&unk_18C68A000;
                                  unint64_t v9 = (_DWORD *)MEMORY[0x1895FD580];
                                  id v6 = a1;
                                  a2 = v84;
                                  a3 = v85;
                                  if (v47) {
                                    v49 = 0LL;
                                  }
                                  else {
                                    v49 = v27;
                                  }
                                  if ((v47 & 1) != 0) {
                                    goto LABEL_70;
                                  }
                                  if ((*(_BYTE *)(*(void *)v49 + 132LL) & 1) == 0) {
                                    goto LABEL_52;
                                  }
                                  v50 = (id *)(v49 + 64);
                                  v51 = *(unsigned int *)(v33 + 40) - ((uint64_t)(v49 + 64 - *(void *)(v33 + 32)) >> 6);
                                  if (!v51) {
                                    goto LABEL_49;
                                  }
                                  while (2)
                                  {
                                    v52 = v51 >> 1;
                                    v53 = &v50[8 * (v51 >> 1)];
                                    if (*((void *)*v53 + 1) > v18)
                                    {
LABEL_44:
                                      v54 = v51 > 1;
                                      v51 = v52;
                                      if (!v54)
                                      {
                                        v51 = 0LL;
                                        goto LABEL_49;
                                      }

                                      continue;
                                    }

                                    break;
                                  }

                                  if (*((void *)*v53 + 2) + *((void *)*v53 + 1) <= v18)
                                  {
                                    v50 = v53 + 8;
                                    v52 = --v51 >> 1;
                                    goto LABEL_44;
                                  }

                                  v55 = v49;
                                  v56 = [*v53 isSpecialPhysFootprintRegion:v85 zone_index:&OBJC_IVAR___VMUVMRegion_zone_index mallocTypeFlag:&OBJC_IVAR___VMUVMRegion_mallocTypeFlag];
                                  v49 = v55;
                                  v48 = v80;
                                  BOOL v10 = (_BYTE *)&unk_18C68A000;
                                  unint64_t v9 = (_DWORD *)MEMORY[0x1895FD580];
                                  id v6 = a1;
                                  a2 = v84;
                                  a3 = v85;
                                  if (v56) {
                                    v51 = 0LL;
                                  }
                                  else {
                                    v51 = (unint64_t)v53;
                                  }
LABEL_49:
                                  if (v51) {
                                    v27 = v51;
                                  }
                                  else {
                                    v27 = v49;
                                  }
LABEL_52:
                                  *v42 = ((v27 - v48) >> 6) + 1;
                                  goto LABEL_15;
                                }

                                v45 = v27 + 64;
                                v46 = --v44 >> 1;
                              }

                              uint64_t v16 = v44 >= 2;
                              v44 = v46;
                              if (!v16) {
                                goto LABEL_70;
                              }
                            }
                          }

                          v68 = v71 + 8;
                          v70 = --v69 >> 1;
                        }

                        v54 = v69 > 1;
                        v69 = v70;
                        if (!v54)
                        {
                          v69 = 0LL;
                          goto LABEL_82;
                        }
                      }
                    }

                    break;
                  }

                  v64 = v27 + 64;
                  v65 = --v63 >> 1;
                }

                uint64_t v16 = v63 >= 2;
                v63 = v65;
              }

              while (v16);
            }
          }
        }
      }

  objc_autoreleasePoolPop(v8);
}

  CFDictionarySetValue( *(CFMutableDictionaryRef *)(a1 + 80),  v10,  (const void *)(0x8E38E38E38E38E39LL * ((uint64_t)(v5 - v12) >> 5)));
  return v5;
}

      [v13 removeAllObjects];
    }

      [NSString stringWithFormat:@"VM: %@", v10];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_27:
      return v17;
    }

    if (v21 >> 60 == 3) {
      return @"Kernel";
    }
    if (v21 >> 60 == 4)
    {
      uint64_t v14 = (void *)NSString;
      uint64_t v15 = -[VMUProcessObjectGraph threadNameForAddress:](self, "threadNameForAddress:", v20);
      unint64_t v7 = (void *)v15;
      uint64_t v16 = &stru_189E010C8;
      if (v15) {
        uint64_t v16 = (const __CFString *)v15;
      }
      [v14 stringWithFormat:@"Thread %llu  %@", v20, v16];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }

    return 0LL;
  }

  if (v22)
  {
    if (BYTE1(self->_regionSymbolNameRanges)) {
      [v22 className];
    }
    else {
      [v22 displayName];
    }
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [MEMORY[0x189NSStringormat:@"malloc<%llu>" v21 & 0xFFFFFFFFFFFFFFFLL];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

      v12 += v14;
      if (v12) {
        goto LABEL_27;
      }
LABEL_28:
      for (unint64_t i = 0LL; ; ++i)
      {
        if (!v11[i]) {
          goto LABEL_124;
        }
        if (v11[i] == 61) {
          break;
        }
        if (&v11[i] >= a1)
        {
          if (*a1 && v11[i]) {
            goto LABEL_51;
          }
LABEL_124:
          v32 = (void (*)(void))v35[2];
          goto LABEL_127;
        }
      }

      if (!*a1) {
        goto LABEL_124;
      }
LABEL_51:
      if (a2)
      {
        v23 = "struct";
        if (v6 == 40) {
          v23 = "union";
        }
        if (*v11 == 63) {
          [v5 appendFormat:@"<unnamed %s>" v23, v33, v34];
        }
        else {
          [v5 appendFormat:@"%s %.*s", v23, i, v11];
        }
      }

      if (*(_BYTE *)(result + 48)) {
        unint64_t v7 = 0;
      }
      else {
        unint64_t v7 = 4 * a3;
      }
    }

LABEL_73:
}

void sub_1860DE580(_Unwind_Exception *a1)
{
}

LABEL_91:
        if (v30 > v19)
        {

          goto LABEL_186;
        }
      }

      v36 &= ~1uLL;
      if ((*(void *)(v229 + v30) & 1LL) != 0) {
        v32 = 2LL;
      }
      else {
        v32 = 3LL;
      }
LABEL_32:
      v43 = v231;
      goto LABEL_37;
    }

    if (a7 && *(_BYTE *)(a1 + 364))
    {
      v91 = (((_DWORD)a3 + 7) & 0xFFFFFFF8) - a3;
      v92 = (v91 + 8);
      if (v92 > a5) {
        goto LABEL_186;
      }
      v232 = a2 + a3;
      while (1)
      {
        v93 = v91;
        v91 = v92;
        [a7 getLeafFieldAtOffset:v93 leafOffset:v240];
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = LODWORD(v240[0]) + 8;
        v96 = *(void *)(v232 + v93);
        v97 = *(void *)(a1 + 8);
        v226 = *(void *)(*(void *)(a1 + 96) + 16LL * a4);
        v227 = [v94 scanType];
        if (!v96) {
          goto LABEL_162;
        }
        v98 = *(uint64_t **)(a1 + 128);
        v99 = -[VMUTask ptrauthStripDataPointer:](v97, v96);
        v100 = v98[6];
        v101 = v98[7];
        v49 = v101 >= v100;
        v102 = v101 - v100;
        if (!v49) {
          goto LABEL_162;
        }
        v103 = v99;
        if (v99 - v100 >= v102) {
          goto LABEL_162;
        }
        v104 = v99 >> *MEMORY[0x1895FD580];
        if (v104)
        {
          v105 = (unsigned int *)v98[3];
          v106 = v99 >> *MEMORY[0x1895FD580];
          do
          {
            if (*v105 <= (v106 & 0x3FFFFFF)
              || ((*((unsigned __int8 *)v105 + ((v106 & 0x3FFFFFF) >> 3) + 4) >> (v106 & 7)) & 1) == 0)
            {
              goto LABEL_162;
            }

            v106 >>= 26;
          }

          while (v106);
        }

        v107 = (uint64_t)v98 + 4 * (v104 & 0x7FFFF);
        v110 = *(_DWORD *)(v107 + 64);
        v109 = (_DWORD *)(v107 + 64);
        v108 = v110;
        if (v110)
        {
          v111 = v98[4] + ((unint64_t)(v108 - 1) << 6);
          if (v99 - *(void *)(*(void *)v111 + 8LL) < *(void *)(*(void *)v111 + 16LL)) {
            goto LABEL_122;
          }
        }

        v127 = *((unsigned int *)v98 + 10);
        if (!(_DWORD)v127) {
          goto LABEL_162;
        }
        v128 = v98[4];
        while (1)
        {
          v129 = v127 >> 1;
          v111 = v128 + (v127 >> 1 << 6);
          if (*(void *)(*(void *)v111 + 8LL) <= v99) {
            break;
          }
LABEL_145:
          v49 = v127 >= 2;
          v127 = v129;
          if (!v49) {
            goto LABEL_162;
          }
        }

        if (*(void *)(*(void *)v111 + 16LL) + *(void *)(*(void *)v111 + 8LL) <= v99) {
          break;
        }
        v222 = v98[4];
        v130 = [*(id *)v111 isSpecialPhysFootprintRegion];
        v131 = v222;
        if (v130) {
          v132 = 0LL;
        }
        else {
          v132 = v111;
        }
        if ((v130 & 1) != 0) {
          goto LABEL_162;
        }
        if ((*(_BYTE *)(*(void *)v132 + 132LL) & 1) == 0) {
          goto LABEL_176;
        }
        v133 = (id *)(v132 + 64);
        v134 = *((unsigned int *)v98 + 10) - ((uint64_t)(v132 + 64 - v98[4]) >> 6);
        if (!v134) {
          goto LABEL_173;
        }
        while (2)
        {
          v135 = v134 >> 1;
          v136 = &v133[8 * (v134 >> 1)];
          if (*((void *)*v136 + 1) > v103)
          {
LABEL_156:
            v85 = v134 > 1;
            v134 = v135;
            if (!v85)
            {
              v134 = 0LL;
              goto LABEL_173;
            }

            continue;
          }

          break;
        }

        if (*((void *)*v136 + 2) + *((void *)*v136 + 1) <= v103)
        {
          v133 = v136 + 8;
          v135 = --v134 >> 1;
          goto LABEL_156;
        }

        v219 = v132;
        v141 = [*v136 isSpecialPhysFootprintRegion];
        v132 = v219;
        v131 = v222;
        if (v141) {
          v134 = 0LL;
        }
        else {
          v134 = (unint64_t)v136;
        }
LABEL_173:
        if (v134) {
          v132 = v134;
        }
        v111 = v132;
LABEL_176:
        *v109 = ((v132 - v131) >> 6) + 1;
LABEL_122:
        v112 = *(_DWORD *)(v111 + 20);
        if (v112)
        {
          v113 = *(void *)(v111 + 8);
          v114 = *v98;
          v115 = *(unsigned int *)(v111 + 16);
          v116 = (unint64_t *)(*v98 + 16 * v115);
          if (v113)
          {
            if (*v116 > v103) {
              goto LABEL_162;
            }
            v117 = (void *)(v114 + 16LL * (v112 + v115 - 1));
            if (((v117[1] >> 5) & 0xFFFFFFFFFuLL) + *v117 <= v103) {
              goto LABEL_162;
            }
            v118 = (unsigned int *)(v113 + 4 * ((v103 - (*v116 & -*MEMORY[0x1895FD590])) >> *MEMORY[0x1895FD580]));
            v119 = *v118;
            v120 = (unint64_t *)(v114 + 16 * v119);
            if (*v120 > v103) {
              goto LABEL_162;
            }
            v121 = v118[1];
            if (v121 < *((_DWORD *)v98 + 2))
            {
              v122 = (unint64_t *)(v114 + 16 * v121);
              v123 = *v122;
              if (*v122 <= v103)
              {
LABEL_158:
                v137 = v122[1];
                if ((v137 & 7) - 2 < 3) {
                  goto LABEL_162;
                }
                v138 = ((unint64_t)v122 - v114) >> 4;
                v139 = v98[2];
                if (v103 - v123 >= v139)
                {
                  if (((v137 >> 5) & 0xFFFFFFFFFLL) - (v103 - v123) > v139 || (_DWORD)v138 == -1) {
                    goto LABEL_162;
                  }
                }

                else if ((_DWORD)v138 == -1)
                {
                  goto LABEL_162;
                }

                (*(void (**)(uint64_t, void, uint64_t, void))(a9 + 16))( a9,  a4,  a3 + v93 + v226,  v227);
                goto LABEL_162;
              }
            }

            v124 = v121 - v119;
            if (v124)
            {
              do
              {
                v125 = v124 >> 1;
                v122 = &v120[2 * v125];
                v123 = *v122;
                if (*v122 <= v103)
                {
                  if (((v120[2 * v125 + 1] >> 5) & 0xFFFFFFFFFLL) + v123 > v103) {
                    goto LABEL_158;
                  }
                  v120 = v122 + 2;
                  LODWORD(v125) = --v124 >> 1;
                }

                v49 = v124 >= 2;
                v124 = v125;
              }

              while (v49);
            }
          }

          else
          {
            do
            {
              v126 = v112 >> 1;
              v122 = &v116[2 * v126];
              v123 = *v122;
              if (*v122 <= v103)
              {
                if (((v116[2 * v126 + 1] >> 5) & 0xFFFFFFFFFLL) + v123 > v103) {
                  goto LABEL_158;
                }
                v116 = v122 + 2;
                LODWORD(v126) = --v112 >> 1;
              }

              v49 = v112 >= 2;
              v112 = v126;
            }

            while (v49);
          }
        }

LABEL_162:
        v92 = (v91 + 8);
        if (v92 > a5)
        {
LABEL_186:

          return;
        }
      }

      v128 = v111 + 64;
      v129 = --v127 >> 1;
      goto LABEL_145;
    }

    if ((*(_BYTE *)(a1 + 376) & 2) == 0) {
      goto LABEL_186;
    }
    v142 = (uint64_t *)(a2 + a3);
    if ((_DWORD)v11) {
      v143 = *(void **)(*(void *)(a1 + 272) + 8LL * v11);
    }
    else {
      v143 = 0LL;
    }
    v144 = a2 + a3 + a5 - 8;
    v145 = v143;
    if (*(_DWORD *)(a1 + 316)) {
      v146 = *(void *)([*(id *)(a1 + 80) autoreleasePoolPageLayout] + 16);
    }
    else {
      v146 = 0LL;
    }
    v230 = a8;
    v223 = a2;
LABEL_189:
    v147 = (unint64_t)v142 - a2;
    v148 = (char *)v142 + *(void *)(*(void *)(a1 + 96) + 16LL * a4) - a2;
    v149 = *v142;
    v233 = v148;
    if (!*v142)
    {
      if (!*(_DWORD *)(a1 + 316)
        || v147 < *(unsigned int *)([*(id *)(a1 + 80) autoreleasePoolPageLayout] + 8))
      {
        goto LABEL_274;
      }

      v155 = *(void (**)(void))(a9 + 16);
      goto LABEL_201;
    }

    if ((_DWORD)v18)
    {
      if (v145
        && v147 == 8
        && [v145 infoType] == 8
        && [v145 usesSwiftRefcounting])
      {
        v150 = v228;
        v151 = v150;
        if (v228
          && (v152 = [v150 refcountIsSideTableMarkerMask] & v149,
              v152 == [v151 refcountIsSideTableMarkerValue]))
        {
          v153 = [v151 sideTablePointerMask] & v149;
          v154 = v153 >> [v151 sideTablePointerRightShift];
          v149 = v154 << [v151 sideTablePointerLeftShift];
        }

        else
        {
          v149 = 0LL;
        }

        v148 = v233;
        if (!v146) {
          goto LABEL_209;
        }
        goto LABEL_205;
      }

      if ((*(_DWORD *)(*(void *)(a1 + 96) + 16LL * a4 + 8) & 7u) - 2 < 3) {
        v149 &= 0xFFFFFFFFFFFFF8uLL;
      }
    }

    if (!v146) {
      goto LABEL_209;
    }
LABEL_205:
    if (([*(id *)(a1 + 80) isTaggedPointer:v149] & 1) == 0)
    {
      v156 = v144;
      v157 = v145;
      v158 = v18;
      v159 = v149 & v146;
      if (v149 != (v149 & v146))
      {
        v160 = [*(id *)(a1 + 80) countFromPointerInAutoreleasePool:v149];
        [MEMORY[0x189607968] numberWithUnsignedInt:(v160 + 1)];
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        v162 = *(void **)(a1 + 520);
        [MEMORY[0x189607968] numberWithUnsignedLongLong:v233];
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        [v162 setObject:v161 forKeyedSubscript:v163];

        v148 = v233;
        v149 = v159;
      }

      uint64_t v18 = v158;
      v145 = v157;
      v144 = v156;
      a2 = v223;
    }

LABEL_209:
    v164 = *(NSMapTable **)(a1 + 328);
    if (v164)
    {
      if ((*(void *)(*(void *)(a1 + 96) + 16LL * a4 + 8) & 7LL) == 2)
      {
        v165 = NSMapGet(v164, v148);
        if (v165) {
          v149 = (uint64_t)v165;
        }
      }
    }

    if ([*(id *)(a1 + 536) containsLocation:v148]) {
      goto LABEL_274;
    }
    if (!v149) {
      goto LABEL_274;
    }
    v166 = *(uint64_t **)(a1 + 128);
    v167 = -[VMUTask ptrauthStripDataPointer:](*(void *)(a1 + 8), v149);
    v168 = v166[6];
    v169 = v166[7];
    v49 = v169 >= v168;
    v170 = v169 - v168;
    if (!v49) {
      goto LABEL_274;
    }
    v171 = v167;
    if (v167 - v168 >= v170) {
      goto LABEL_274;
    }
    v172 = v167 >> *MEMORY[0x1895FD580];
    if (v172)
    {
      v173 = (unsigned int *)v166[3];
      v174 = v167 >> *MEMORY[0x1895FD580];
      do
      {
        if (*v173 <= (v174 & 0x3FFFFFF)
          || ((*((unsigned __int8 *)v173 + ((v174 & 0x3FFFFFF) >> 3) + 4) >> (v174 & 7)) & 1) == 0)
        {
          goto LABEL_274;
        }

        v174 >>= 26;
      }

      while (v174);
    }

    v175 = (uint64_t)v166 + 4 * (v172 & 0x7FFFF);
    v178 = *(_DWORD *)(v175 + 64);
    v177 = (_DWORD *)(v175 + 64);
    v176 = v178;
    if (v178)
    {
      v179 = v166[4] + ((unint64_t)(v176 - 1) << 6);
      if (v167 - *(void *)(*(void *)v179 + 8LL) < *(void *)(*(void *)v179 + 16LL)) {
        goto LABEL_225;
      }
    }

    v195 = *((unsigned int *)v166 + 10);
    if (!(_DWORD)v195) {
      goto LABEL_274;
    }
    v196 = v166[4];
    while (1)
    {
      v197 = v195 >> 1;
      v179 = v196 + (v195 >> 1 << 6);
      if (*(void *)(*(void *)v179 + 8LL) <= v167)
      {
        if (*(void *)(*(void *)v179 + 16LL) + *(void *)(*(void *)v179 + 8LL) > v167)
        {
          v217 = v166[4];
          v220 = v177;
          v198 = [*(id *)v179 isSpecialPhysFootprintRegion];
          v200 = v217;
          v199 = v220;
          if (v198) {
            v201 = 0LL;
          }
          else {
            v201 = v179;
          }
          if ((v198 & 1) != 0) {
            goto LABEL_274;
          }
          if ((*(_BYTE *)(*(void *)v201 + 132LL) & 1) == 0) {
            goto LABEL_283;
          }
          v202 = (id *)(v201 + 64);
          v203 = *((unsigned int *)v166 + 10) - ((uint64_t)(v201 + 64 - v166[4]) >> 6);
          if (!v203) {
            goto LABEL_280;
          }
          v215 = v18;
          while (1)
          {
            v204 = v203 >> 1;
            v205 = &v202[8 * (v203 >> 1)];
            if (*((void *)*v205 + 1) <= v171)
            {
              if (*((void *)*v205 + 2) + *((void *)*v205 + 1) > v171)
              {
                v210 = v201;
                v211 = [*v205 isSpecialPhysFootprintRegion];
                v201 = v210;
                v200 = v217;
                v199 = v220;
                if (v211) {
                  v203 = 0LL;
                }
                else {
                  v203 = (unint64_t)v205;
                }
LABEL_279:
                uint64_t v18 = v215;
LABEL_280:
                if (v203) {
                  v201 = v203;
                }
                v179 = v201;
LABEL_283:
                *v199 = ((v201 - v200) >> 6) + 1;
LABEL_225:
                v180 = *(_DWORD *)(v179 + 20);
                if (v180)
                {
                  v181 = *(void *)(v179 + 8);
                  v182 = *v166;
                  v183 = *(unsigned int *)(v179 + 16);
                  v184 = (unint64_t *)(*v166 + 16 * v183);
                  if (v181)
                  {
                    if (*v184 > v171) {
                      goto LABEL_274;
                    }
                    v185 = (void *)(v182 + 16LL * (v180 + v183 - 1));
                    if (((v185[1] >> 5) & 0xFFFFFFFFFuLL) + *v185 <= v171) {
                      goto LABEL_274;
                    }
                    v186 = (unsigned int *)(v181 + 4
                                                 * ((v171 - (*v184 & -*MEMORY[0x1895FD590])) >> *MEMORY[0x1895FD580]));
                    v187 = *v186;
                    v188 = (unint64_t *)(v182 + 16 * v187);
                    if (*v188 > v171) {
                      goto LABEL_274;
                    }
                    v189 = v186[1];
                    if (v189 >= *((_DWORD *)v166 + 2)
                      || (v190 = (unint64_t *)(v182 + 16 * v189), v191 = *v190, *v190 > v171))
                    {
                      v192 = v189 - v187;
                      if (v192)
                      {
                        do
                        {
                          v193 = v192 >> 1;
                          v190 = &v188[2 * v193];
                          v191 = *v190;
                          if (*v190 <= v171)
                          {
                            if (((v188[2 * v193 + 1] >> 5) & 0xFFFFFFFFFLL) + v191 > v171) {
                              goto LABEL_265;
                            }
                            v188 = v190 + 2;
                            LODWORD(v193) = --v192 >> 1;
                          }

                          v49 = v192 >= 2;
                          v192 = v193;
                        }

                        while (v49);
                      }

                      goto LABEL_274;
                    }

LABEL_265:
                    v206 = v190[1];
                    if ((v206 & 7) - 2 < 3) {
                      goto LABEL_274;
                    }
                    v207 = ((unint64_t)v190 - v182) >> 4;
                    v208 = v166[2];
                    if (v171 - v191 >= v208)
                    {
                      if (((v206 >> 5) & 0xFFFFFFFFFLL) - (v171 - v191) > v208 || (_DWORD)v207 == -1) {
                        goto LABEL_274;
                      }
                    }

                    else if ((_DWORD)v207 == -1)
                    {
                      goto LABEL_274;
                    }

                    v155 = *(void (**)(void))(a9 + 16);
LABEL_201:
                    v155();
                    goto LABEL_274;
                  }

                  do
                  {
                    v194 = v180 >> 1;
                    v190 = &v184[2 * v194];
                    v191 = *v190;
                    if (*v190 <= v171)
                    {
                      if (((v184[2 * v194 + 1] >> 5) & 0xFFFFFFFFFLL) + v191 > v171) {
                        goto LABEL_265;
                      }
                      v184 = v190 + 2;
                      LODWORD(v194) = --v180 >> 1;
                    }

                    v49 = v180 >= 2;
                    v180 = v194;
                  }

                  while (v49);
                }

    if (v272 <= v169 - (unint64_t)v168)
    {
      v176 = 0;
      if (v170 <= 1) {
        v177 = 1LL;
      }
      else {
        v177 = v170;
      }
      v178 = v251;
      do
      {
        if ((v176 & 1) != 0)
        {
          v179 = [objb objectAtIndex:++v160];

          v162 = (char *)v179;
        }

        v180 = *((void *)v162 + 1);
        else {
          v181 = (unint64_t)v168;
        }
        v168 += v272;
        else {
          v182 = (unint64_t)v168;
        }
        v183 = *v178;
        if ((*v178 & 0x18) == 0
          || ![*((id *)v162 + 4) hasPrefix:VMUunusedSharedLibLabelPrefix])
        {
          v176 = 0;
          goto LABEL_302;
        }

        v263 = (id)VMUunusedButDirtySharedLibDataPath;
        v184 = (void *)*((void *)v162 + 5);
        if (v184)
        {
          if (([v184 hasPrefix:VMUunusedSharedLibPathPrefix] & 1) == 0
            && ([*((id *)v162 + 5) hasPrefix:VMUunusedButDirtyPrefix] & 1) == 0)
          {
            v185 = [v241 objectForKeyedSubscript:*((void *)v162 + 5)];

            v263 = (id)v185;
            if (!v185)
            {
              [(id)VMUunusedButDirtyPrefix stringByAppendingString:*((void *)v162 + 5)];
              v263 = (id)objc_claimAutoreleasedReturnValue();
              [v241 setObject:v263 forKeyedSubscript:*((void *)v162 + 5)];
            }
          }
        }

        v186 = *((void *)v162 + 1);
        if ((v181 & v254) == 0 && v181 > v186)
        {
          v191 = [v162 breakAtLength:v181 - v186];
          v190 = (char *)v191;
          if (!v191) {
            goto LABEL_300;
          }
          *(_BYTE *)(v191 + 132) |= 8u;
          objc_storeStrong((id *)(v191 + 40), v263);
          [objb insertObject:v190 atIndex:++v160];
          v190 = v190;

          v176 = 0;
          ++v268;
          v162 = v190;
        }

        else if ((v182 & v254) != 0 || v182 >= *((void *)v162 + 2) + v186)
        {
          v162[132] |= 8u;
          v189 = v263;
          v176 = 0;
          v190 = (char *)*((void *)v162 + 5);
          *((void *)v162 + 5) = v189;
        }

        else
        {
          v192 = [v162 breakAtLength:v182 - v186];
          v190 = (char *)v192;
          if (!v192)
          {
LABEL_300:
            v176 = 0;
            goto LABEL_301;
          }

          v162[132] |= 8u;
          objc_storeStrong((id *)v162 + 5, v263);
          [objb insertObject:v190 atIndex:v160 + 1];
          ++v268;
          v176 = 1;
        }

LABEL_274:
                v142 = (uint64_t *)((char *)v142 + v230);
                if ((unint64_t)v142 > v144)
                {
LABEL_185:

                  goto LABEL_186;
                }

                goto LABEL_189;
              }

              v202 = v205 + 8;
              v204 = --v203 >> 1;
            }

            v85 = v203 > 1;
            v203 = v204;
            if (!v85)
            {
              v203 = 0LL;
              goto LABEL_279;
            }
          }
        }

        v196 = v179 + 64;
        v197 = --v195 >> 1;
      }

      v49 = v195 >= 2;
      v195 = v197;
      if (!v49) {
        goto LABEL_274;
      }
    }
  }

void sub_1860E0B70( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, char a30)
{
}

void sub_1860E0D4C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Block_object_dispose((const void *)(v11 - 48), 8);
  _Unwind_Resume(a1);
}

LABEL_102:
    return;
  }

  for (;
        *(void *)(*(void *)(a1[7] + 8LL) + 24LL) <= v12;
        *(void *)(*(void *)(a1[7] + 8LL) + 24LL) = *(void *)(*(void *)(*(void *)(a1[4] + 112LL)
                                                                             + ((unint64_t)*(unsigned int *)(*(void *)(a1[8] + 8LL) + 24LL) << 6))
                                                                 + 16LL)
                                                     + *(void *)(*(void *)(a1[9] + 8LL) + 24LL))
  {
    *(void *)(*(void *)(a1[9] + 8LL) + 24LL) = *(void *)(*(void *)(*(void *)(a1[4] + 112LL)
  }

  uint64_t v14 = a1[4];
  uint64_t v15 = *(void *)(v14 + 112);
  uint64_t v16 = *(unsigned int *)(*(void *)(a1[8] + 8LL) + 24LL);
  uint64_t v17 = (id *)(v15 + (v16 << 6));
  if ((*((_DWORD *)*v17 + 13) & 3) != 2)
  {
    uint64_t v18 = *(void *)(a1[7] + 8LL);
    v20 = *(void *)(v18 + 24);
    v19 = (void *)(v18 + 24);
    if (v20 >= v9 + v12)
    {
      v131 = *(FILE **)(*(void *)(a1[9] + 8LL) + 24LL);
      v58 = *(void **)(v14 + 72);
      v59 = *(_DWORD *)(v14 + 120);
      v60 = *(id *)(v14 + 8);
      v61 = v58;
      v62 = v16;
      v63 = v61;
      v126 = v62;
      v64 = v15 + (v62 << 6);
      v66 = *(void *)(v64 + 48);
      v65 = (void *)(v64 + 48);
      if (!v66)
      {
        v127 = v60;
        v67 = *v17;
        if ((*((_BYTE *)*v17 + 132) & 2) == 0)
        {
          [v61 taskIsTranslated];
          v67 = *v17;
        }

        v68 = [v63 mapAddress:v67[1] size:v67[2] returnedAddress:&v134 returnedSize:v141];
        if (v68)
        {
          if ((*((_DWORD *)*v17 + 13) & 3u) - 1 >= 2)
          {
            v69 = v68;
            v70 = task_exists(v127);
            if ((_DWORD)v126 != v59 - 1 && v70)
            {
              v124 = (FILE *)*MEMORY[0x1895F89D0];
              v120 = [*v17 address];
              v71 = *((unsigned int *)*v17 + 6);
              v72 = vm_prot_strings_0[v71];
              v73 = *((void *)*v17 + 2) + *((void *)*v17 + 1);
              v74 = VMURegionTypeDescriptionForTagShareProtAndPager( *((unsigned __int8 *)*v17 + 104),  *((unsigned __int8 *)*v17 + 50),  v71,  *((unsigned __int8 *)*v17 + 49));
              v75 = (const char *)[v74 UTF8String];
              v76 = *((void *)*v17 + 2) >> *MEMORY[0x1895FD580];
              if (v76 == 1) {
                v77 = "page";
              }
              else {
                v77 = "pages";
              }
              if (*(void *)(v15 + (v126 << 6) + 24) == *(void *)(v15 + (v126 << 6) + 32)) {
                v78 = "";
              }
              else {
                v78 = " [root]";
              }
              fprintf( v124,  "Failed to map remote region: [%#llx-%#llx] %s %s (%llu %s)%s (error: %d)\n",  v120,  v73,  v72,  v75,  v76,  v77,  v78,  v69);
            }
          }
        }

        else
        {
          v105 = v141[0];
          *v65 = v134;
          v106 = v15 + (v126 << 6);
          *(void *)(v106 + 40) = v105;
          *(void *)(v106 + 56) = v17;
        }

        v60 = v127;
      }

      v95 = *(void *)(a1[4] + 112LL);
      v86 = v126;
      v96 = v131;
      goto LABEL_93;
    }

    v21 = v16 + 1;
    do
    {
      v22 = v21;
      v23 = (void *)(*(void *)(*(void *)(a1[4] + 112LL) + ((unint64_t)v21 << 6)) + 8LL);
      *v19 = v23[1] + *v23;
      ++v21;
      v24 = *(void *)(a1[7] + 8LL);
      v25 = *(void *)(v24 + 24);
      v19 = (void *)(v24 + 24);
    }

    while (v25 < v9 + v12);
    v26 = *(unsigned int *)(*(void *)(a1[8] + 8LL) + 24LL);
    v27 = v21 - v26;
    v28 = a1[4];
    v122 = v26;
    v114 = *(void *)(v28 + 112);
    v29 = (uint64_t *)(v114 + (v26 << 6));
    uint64_t v30 = *(void **)(v28 + 72);
    if (a3 == 1) {
      v31 = (void *)a1[5];
    }
    else {
      v31 = 0LL;
    }
    v81 = v22;
    v121 = *(id *)(v28 + 8);
    v128 = v30;
    v132 = v31;
    v118 = v27;
    if (v27)
    {
      v82 = 0LL;
      v83 = v21 - v122;
      v84 = v29;
      do
      {
        v85 = *v84;
        v84 += 8;
        v82 += *(void *)(v85 + 16);
        --v83;
      }

      while (v83);
    }

    else
    {
      v82 = 0LL;
    }

    v86 = v21 - 1;
    v141[0] = 0LL;
    v133 = 0LL;
    v87 = (void *)[v128 findMappedAddress:*(void *)(*v29 + 8) size:v82];
    if (v87)
    {
      v88 = v87[1];
      v89 = *(void *)(*v29 + 8) - *v87;
      v141[0] = v87[2] + v89;
      v133 = (uint64_t *)(v88 - v89);
    }

    else
    {
      v113 = v81;
      if (v118)
      {
        v97 = v21 - v122;
        v98 = v29;
        v116 = v29;
        do
        {
          v99 = v128;
          v100 = v132;
          if (v98[6])
          {
            if (v98 == (uint64_t *)v98[7])
            {
              v134 = MEMORY[0x1895F87A8];
              v135 = 3221225472LL;
              v136 = ___unmapRegion_block_invoke_0;
              v137 = &unk_189DFD7B8;
              v138 = v99;
              v139 = v98;
              v140 = v29;
              v101 = (void (**)(void))MEMORY[0x186E33044](&v134);
              v102 = v101;
              if (v132) {
                dispatch_async(v100, v101);
              }
              else {
                v101[2](v101);
              }

              v29 = v116;
            }

            else
            {
              v98[5] = 0LL;
              v98[6] = 0LL;
              v98[7] = 0LL;
            }
          }

          v98 += 8;
          --v97;
        }

        while (v97);
      }

      v86 = v21 - 1;
      v81 = v113;
      if ([v128 mapAddress:*(void *)(*v29 + 8) size:v82 returnedAddress:v141 returnedSize:&v133])
      {
        if (task_exists(v121)) {
          fprintf( (FILE *)*MEMORY[0x1895F89D0],  "Failed to map remote region at [%#llx-%#llx]\n",  *(void *)(*v29 + 8),  *(void *)(*v29 + 8) + v82);
        }
        goto LABEL_74;
      }
    }

    if (v118)
    {
      v90 = v133;
      v91 = (uint64_t *)v141[0];
      v92 = (uint64_t **)(v114 + (v122 << 6) + 56);
      v93 = v21 - v122;
      do
      {
        *(v92 - 1) = v91;
        *v92 = v29;
        *(v92 - 2) = v90;
        v94 = (uint64_t)(*(v92 - 7) + 1);
        v91 = (uint64_t *)((char *)v91 + (*(v92 - 7))[2]);
        v141[0] = v91;
        v90 = (uint64_t *)((char *)v90 - *(void *)(v94 + 8));
        v133 = v90;
        v92 += 8;
        --v93;
      }

      while (v93);
    }

LABEL_74:
    v95 = *(void *)(a1[4] + 112LL);
    v96 = *(FILE **)(*(void *)(v95 + (v81 << 6)) + 8LL);
LABEL_93:
    v107 = *(void *)(a1[8] + 8LL);
    v108 = *(void *)(v95 + ((unint64_t)*(unsigned int *)(v107 + 24) << 6) + 48);
    if (v108)
    {
      (*(void (**)(uint64_t, unint64_t))(a4 + 16))( a4,  v108 + v12 - *(void *)(*(void *)(a1[9] + 8LL) + 24LL));
      v107 = *(void *)(a1[8] + 8LL);
    }

    *(_DWORD *)(v107 + 24) = v86;
    *(void *)(*(void *)(a1[9] + 8LL) + 24LL) = v96;
  }

          uint64_t v14 = v44;
          goto LABEL_32;
        }

        v55 = (int *)(*((uint64_t (**)(id, unint64_t, uint64_t))a6 + 2))(a6, a3 + 16, 4LL);
        if (v55) {
          v56 = *v55;
        }
        else {
          v56 = 0;
        }
        v57 = (unsigned int *)(*((uint64_t (**)(id, unint64_t, uint64_t))a6 + 2))(a6, a3 + 20, 4LL);
        if (v57)
        {
          v58 = *v57;
        }

        else
        {
          v58 = 0LL;
        }

        v59 = v44->_remotePointerSize;
        v60 = 2 * v59;
        v61 = 2 * v59 + 8;
        v62 = v56 & 0xF0000000;
        if ((v56 & 0xF0000000) == 0)
        {
          uint64_t v14 = -[VMUClassInfo _copyWithInstanceSize:superclassOffset:asVariant:mutable:]( v44,  "_copyWithInstanceSize:superclassOffset:asVariant:mutable:",  v58,  (v60 + 8),  1LL,  0LL);

          goto LABEL_32;
        }

        if (v62 != 0x10000000)
        {
          v71 = v58 | v56 & 0xF2000000;
          [a5 _cachedVariantForGenericInfo:v44 variantKey:v71];
          uint64_t v14 = (VMUClassInfo *)objc_claimAutoreleasedReturnValue();

          if (!v14)
          {
            if ((v56 & 0x2000000) != 0) {
              v61 = (v61 + 2 * v44->_remotePointerSize);
            }
            v72 = (v62 - 0x20000000) >> 28;
            if (v72 == 1)
            {
              v74 = 1;
              v73 = 256;
            }

            else if (v72 == 2)
            {
              v73 = 1;
              v74 = 1;
            }

            else
            {
              v74 = 0;
              v73 = 32;
            }

            v89 = -[VMUClassInfo _copyWithInstanceSize:superclassOffset:asVariant:mutable:]( v44,  "_copyWithInstanceSize:superclassOffset:asVariant:mutable:",  v58,  v61,  1LL,  0LL);
            uint64_t v14 = v89;
            if (v74)
            {
              -[VMUClassInfo _applyExtendedLayout:withSize:](v89, "_applyExtendedLayout:withSize:", v73, v58);
            }

            else
            {
              v90 = calloc(1uLL, 2uLL);
              *v90 = v73;
              -[VMUClassInfo _applyExtendedLayout:withSize:](v14, "_applyExtendedLayout:withSize:", v90, v58);
              free(v90);
            }

            [a5 _registerVariant:v14 forGenericInfo:v44 variantKey:v71];
          }

          goto LABEL_32;
        }

        v63 = v61 + (v60 & (v56 << 6 >> 31));
        v64 = a6;
        v65 = v64;
        v66 = (uint64_t (*)(id, unint64_t, uint64_t))*((void *)a6 + 2);
        if (v59 == 8)
        {
          v67 = (unint64_t *)v66(v64, v63 + a3, 8LL);
          if (v67)
          {
            v68 = *v67;
            goto LABEL_78;
          }
        }

        else
        {
          v78 = (unsigned int *)v66(v64, v63 + a3, 4LL);
          if (v78)
          {
            v68 = *v78;
            goto LABEL_78;
          }
        }

        v68 = 0LL;
LABEL_78:

        uint64_t v14 = -[VMUClassInfo _copyWithInstanceSize:superclassOffset:asVariant:mutable:]( v44,  "_copyWithInstanceSize:superclassOffset:asVariant:mutable:",  v58,  (v44->_remotePointerSize + v63),  1LL,  0LL);
        if (v68 > 0xFFF)
        {
          v79 = (void *)copy_remote_layout_at(v68, v65);
          -[VMUClassInfo _applyExtendedLayout:withSize:](v14, "_applyExtendedLayout:withSize:", v79, v58);
          if (v79) {
            free(v79);
          }
        }

        else
        {
          -[VMUClassInfo _applyExtendedLayout:withSize:](v14, "_applyExtendedLayout:withSize:", v68, v58);
        }

        goto LABEL_32;
      }
    }
  }

  uint64_t v14 = self;
  return v14;
}

LABEL_103:
            uint64_t v13 = v102;
            goto LABEL_7;
          }

          kcd_addr_begin[0] = 0LL;
          kcd_size[0] = 0LL;
          if (!task_map_corpse_info_64( *MEMORY[0x1895FBBE0],  [*(id *)(*(void *)(a1 + 32) + 8) taskPort],  kcd_addr_begin,  kcd_size))
          {
            v86 = v32;
            v87 = kcd_addr_begin[0];
            v88 = kcd_size[0];
            v89 = kcd_size[0] + kcd_addr_begin[0];
            v90 = kcd_addr_begin[0] + 16;
            if (v87 + 16 <= kcd_size[0] + v87
              && v90 + *(unsigned int *)(kcd_addr_begin[0] + 4) <= v89
              && *(_DWORD *)kcd_addr_begin[0] == -559025833)
            {
              do
              {
                v91 = v90 + *(unsigned int *)(v87 + 4);
                if (v91 > v89) {
                  break;
                }
                v92 = *(_DWORD *)v87;
                if (*(_DWORD *)v87 == -242132755) {
                  break;
                }
                if ((v92 == 17 || (v92 & 0xFFFFFFF0) == 0x20) && HIDWORD(*(void *)(v87 + 8)) == 2076LL)
                {
                  v86[2](v86, v87 + 16, *(void *)(v87 + 8));
                  v91 = v90 + *(unsigned int *)(v87 + 4);
                }

                v90 = v91 + 16;
                v87 = v91;
              }

              while (v91 + 16 <= v89);
              v87 = kcd_addr_begin[0];
              v88 = kcd_size[0];
            }

            mach_vm_deallocate(*MEMORY[0x1895FBBE0], v87, v88);
            v32 = v86;
LABEL_102:
            unint64_t v7 = &unk_189DFD430;
            goto LABEL_103;
          }

          [*(id *)(a1 + 32) pid];
          v35 = proc_list_uptrs();
          if (v35 < 1) {
            goto LABEL_102;
          }
          v36 = v35;
          v99 = v32;
          v37 = malloc((8 * v35));
          [*(id *)(a1 + 32) pid];
          proc_list_uptrs();
          v38 = v37;
          v39 = 0LL;
          v40 = (_DWORD *)MEMORY[0x1895FD580];
          v100 = v37;
LABEL_25:
          v41 = *(uint64_t **)(*(void *)(a1 + 32) + 128LL);
          v42 = v41[6];
          v43 = v41[7];
          v44 = v43 >= v42;
          v45 = v43 - v42;
          if (!v44) {
            goto LABEL_75;
          }
          v46 = v38[v39];
          if (v46 - v42 >= v45) {
            goto LABEL_75;
          }
          v47 = v46 >> *v40;
          if (v47)
          {
            v48 = (unsigned int *)v41[3];
            v49 = v46 >> *v40;
            do
            {
              if (*v48 <= (v49 & 0x3FFFFFF)
                || ((*((unsigned __int8 *)v48 + ((v49 & 0x3FFFFFF) >> 3) + 4) >> (v49 & 7)) & 1) == 0)
              {
                goto LABEL_75;
              }

              v49 >>= 26;
            }

            while (v49);
          }

          v50 = (uint64_t)v41 + 4 * (v47 & 0x7FFFF);
          v53 = *(_DWORD *)(v50 + 64);
          v52 = (_DWORD *)(v50 + 64);
          v51 = v53;
          v54 = v41[4];
          if (v53)
          {
            v55 = v54 + ((unint64_t)(v51 - 1) << 6);
            if (v46 - *(void *)(*(void *)v55 + 8LL) < *(void *)(*(void *)v55 + 16LL)) {
              goto LABEL_35;
            }
          }

          v71 = *((unsigned int *)v41 + 10);
          if (!(_DWORD)v71) {
            goto LABEL_75;
          }
          v72 = v41[4];
          while (1)
          {
            v73 = v71 >> 1;
            v55 = v72 + (v71 >> 1 << 6);
            if (*(void *)(*(void *)v55 + 8LL) <= v46)
            {
              if (*(void *)(*(void *)v55 + 16LL) + *(void *)(*(void *)v55 + 8LL) > v46)
              {
                v74 = [*(id *)v55 isSpecialPhysFootprintRegion];
                v38 = v100;
                v40 = (_DWORD *)MEMORY[0x1895FD580];
                if (v74) {
                  v75 = 0LL;
                }
                else {
                  v75 = v55;
                }
                if ((v74 & 1) != 0) {
                  goto LABEL_75;
                }
                if ((*(_BYTE *)(*(void *)v75 + 132LL) & 1) == 0) {
                  goto LABEL_89;
                }
                v76 = (id *)(v75 + 64);
                v77 = *((unsigned int *)v41 + 10) - ((uint64_t)(v75 + 64 - v41[4]) >> 6);
                if (!v77) {
                  goto LABEL_86;
                }
                while (2)
                {
                  v78 = v77 >> 1;
                  v79 = &v76[8 * (v77 >> 1)];
                  if (*((void *)*v79 + 1) > v46)
                  {
LABEL_69:
                    v80 = v77 > 1;
                    v77 = v78;
                    if (!v80)
                    {
                      v77 = 0LL;
                      goto LABEL_86;
                    }

                    continue;
                  }

                  break;
                }

                if (*((void *)*v79 + 2) + *((void *)*v79 + 1) <= v46)
                {
                  v76 = v79 + 8;
                  v78 = --v77 >> 1;
                  goto LABEL_69;
                }

                v98 = v75;
                v85 = [*v79 isSpecialPhysFootprintRegion];
                v75 = v98;
                v38 = v100;
                v40 = (_DWORD *)MEMORY[0x1895FD580];
                if (v85) {
                  v77 = 0LL;
                }
                else {
                  v77 = (unint64_t)v79;
                }
LABEL_86:
                if (v77) {
                  v75 = v77;
                }
                v55 = v75;
LABEL_89:
                *v52 = ((v75 - v54) >> 6) + 1;
LABEL_35:
                v56 = *(_DWORD *)(v55 + 20);
                if (v56)
                {
                  v57 = *(void *)(v55 + 8);
                  v58 = *v41;
                  v59 = *(unsigned int *)(v55 + 16);
                  v60 = (unint64_t *)(*v41 + 16 * v59);
                  if (v57)
                  {
                    if (*v60 > v46) {
                      goto LABEL_75;
                    }
                    v61 = (void *)(v58 + 16LL * (v56 + v59 - 1));
                    if (((v61[1] >> 5) & 0xFFFFFFFFFuLL) + *v61 <= v46) {
                      goto LABEL_75;
                    }
                    v62 = (unsigned int *)(v57 + 4 * ((v46 - (*v60 & -*MEMORY[0x1895FD590])) >> *v40));
                    v63 = *v62;
                    v64 = (unint64_t *)(v58 + 16 * v63);
                    if (*v64 > v46) {
                      goto LABEL_75;
                    }
                    v65 = v62[1];
                    if (v65 < *((_DWORD *)v41 + 2))
                    {
                      v66 = (unint64_t *)(v58 + 16 * v65);
                      v67 = *v66;
                      if (*v66 <= v46)
                      {
LABEL_71:
                        v81 = v66[1];
                        if ((v81 & 7) - 2 < 3) {
                          goto LABEL_75;
                        }
                        v82 = ((unint64_t)v66 - v58) >> 4;
                        v83 = v41[2];
                        if (v46 - v67 >= v83)
                        {
                          if (((v81 >> 5) & 0xFFFFFFFFFLL) - (v46 - v67) > v83 || (_DWORD)v82 == -1) {
                            goto LABEL_75;
                          }
                        }

                        else if ((_DWORD)v82 == -1)
                        {
                          goto LABEL_75;
                        }

                        (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
                        v38 = v100;
                        v40 = (_DWORD *)MEMORY[0x1895FD580];
                        goto LABEL_75;
                      }
                    }

                    v68 = v65 - v63;
                    if (v68)
                    {
                      do
                      {
                        v69 = v68 >> 1;
                        v66 = &v64[2 * v69];
                        v67 = *v66;
                        if (*v66 <= v46)
                        {
                          if (((v64[2 * v69 + 1] >> 5) & 0xFFFFFFFFFLL) + v67 > v46) {
                            goto LABEL_71;
                          }
                          v64 = v66 + 2;
                          LODWORD(v69) = --v68 >> 1;
                        }

                        v44 = v68 >= 2;
                        v68 = v69;
                      }

                      while (v44);
                    }
                  }

                  else
                  {
                    do
                    {
                      v70 = v56 >> 1;
                      v66 = &v60[2 * v70];
                      v67 = *v66;
                      if (*v66 <= v46)
                      {
                        if (((v60[2 * v70 + 1] >> 5) & 0xFFFFFFFFFLL) + v67 > v46) {
                          goto LABEL_71;
                        }
                        v60 = v66 + 2;
                        LODWORD(v70) = --v56 >> 1;
                      }

                      v44 = v56 >= 2;
                      v56 = v70;
                    }

                    while (v44);
                  }
                }

LABEL_75:
                if (++v39 == v36)
                {
                  free(v38);
                  id v6 = MEMORY[0x1895F87A8];
                  v32 = v99;
                  goto LABEL_102;
                }

                goto LABEL_25;
              }

              v72 = v55 + 64;
              v73 = --v71 >> 1;
            }

            v44 = v71 >= 2;
            v71 = v73;
            if (!v44) {
              goto LABEL_75;
            }
          }
        }

        if (v10 != 4) {
          goto LABEL_15;
        }
        v26 = *(unsigned int *)(a1 + 48);
        v105[0] = v6;
        v105[1] = 3221225472LL;
        v105[2] = __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_7;
        v105[3] = v7;
        v27 = *(void **)(a1 + 40);
        v105[4] = *(void *)(a1 + 32);
        v107 = v5;
        v106 = v27;
        (*(void (**)(uint64_t, unint64_t, uint64_t, void *))(a2 + 16))(a2, v5, v26, v105);
        uint64_t v13 = v106;
      }

  v27 = 1;
LABEL_76:

  return v27;
}

LABEL_7:
LABEL_15:
      ++v5;
      uint64_t v2 = *(void *)(a1 + 32);
    }

    while (v5 < *(unsigned int *)(v2 + 104));
  }

  uint64_t v14 = 0LL;
LABEL_9:

  return v14;
}

  unint64_t v12 = 0LL;
LABEL_16:

  return v12;
}

  uint64_t v14 = 0LL;
LABEL_9:

  return v14;
}

  return v3;
}

    unint64_t v12 = 0LL;
    goto LABEL_8;
  }

  unint64_t v9 = _classDataRWV1ofClass(v7, v8, a4);
  if (!v9) {
    goto LABEL_7;
  }
  BOOL v10 = (uint64_t *)(v9 + 24);
LABEL_6:
  unint64_t v12 = *v10;
LABEL_8:

  return v12;
}

    unint64_t v12 = 0LL;
    goto LABEL_8;
  }

  unint64_t v9 = _classDataRWV1ofClass(v7, v8, a4);
  if (!v9) {
    goto LABEL_7;
  }
  BOOL v10 = (uint64_t *)(v9 + 16);
LABEL_6:
  unint64_t v12 = *v10;
LABEL_8:

  return v12;
}

void sub_1860E2520(_Unwind_Exception *a1)
{
}

LABEL_63:
    BOOL v10 = v33;
LABEL_47:

    uint64_t v18 = v19;
LABEL_48:
    ++v16;
  }

  while (v16 != v17);
LABEL_5:

  return v35;
}

  return v13;
}

void sub_1860E3FD4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
}

void sub_1860E5E28( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t ___unmapRegion_block_invoke_0(uint64_t a1)
{
  unint64_t v12 = 0LL;
  unint64_t v13 = 0LL;
  uint64_t result = [*(id *)(a1 + 32) unmapAddress:*(void *)(**(void **)(a1 + 40) + 8) size:*(void *)(*(void *)(a1 + 40) + 40) returnedAddress:&v13 returnedSize:&v12];
  if ((_DWORD)result)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t result = fprintf( (FILE *)*MEMORY[0x1895F89D0],  "Failed to deallocate mapped region %#llx-%#llx[%llu] with local addresses %p-%p[%llu]\n",  *(void *)(*(void *)v3 + 8LL),  *(void *)(*(void *)v3 + 16LL) + *(void *)(*(void *)v3 + 8LL),  *(void *)(*(void *)v3 + 16LL),  *(const void **)(v3 + 48),  (const void *)(*(void *)(v3 + 48) + *(void *)(v3 + 40)),  *(void *)(v3 + 40));
LABEL_3:
    id v4 = *(void **)(a1 + 40);
    v4[5] = 0LL;
    v4[6] = 0LL;
    v4[7] = 0LL;
    return result;
  }

  if (!v13) {
    goto LABEL_3;
  }
  uint64_t v5 = *(void **)(a1 + 40);
  for (unint64_t i = *(void *)(a1 + 48); (unint64_t)v5 > i; v5 -= 8)
  {
    if (v13 >= *(void *)(*v5 + 8LL)) {
      break;
    }
  }

  unint64_t v7 = v12;
  if (v12)
  {
    do
    {
      v5[5] = 0LL;
      v5[6] = 0LL;
      v5[7] = 0LL;
      uint64_t v8 = *v5;
      v5 += 8;
      unint64_t v9 = *(void *)(v8 + 16);
      BOOL v10 = v7 >= v9;
      v7 -= v9;
      BOOL v11 = v7 != 0 && v10;
      if (!v10) {
        unint64_t v7 = 0LL;
      }
    }

    while (v11);
  }

  return result;
}

char *___shouldScanVMregion_block_invoke()
{
  uint64_t result = getenv("SCAN_VM_REGIONS_WITH_UNKNOWN_PATHS");
  _shouldScanVMregion_scanVMRegionWithUnknownPathsEnvVar = (uint64_t)result;
  return result;
}

unint64_t VMUUnionRange(unint64_t result, uint64_t a2, unint64_t a3)
{
  if (result >= a3) {
    return a3;
  }
  return result;
}

unint64_t VMUIntersectionRange(unint64_t result, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a3 > result || result >= a3 + a4)
  {
    if (a3 < result + a2) {
      unint64_t v4 = a3;
    }
    else {
      unint64_t v4 = 0LL;
    }
    if (result <= a3) {
      return v4;
    }
    else {
      return 0LL;
    }
  }

  return result;
}

BOOL VMURangeContainsRange(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  return a3 >= a1 && a3 + a4 <= a1 + a2;
}

BOOL VMURangeIntersectsRange(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a1 >= a3) {
    return a3 + a4 > a1;
  }
  else {
    return a1 + a2 > a3;
  }
}

BOOL VMURangeIntersectsOrAbutsRange(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a1 >= a3) {
    return a3 + a4 >= a1;
  }
  else {
    return a1 + a2 >= a3;
  }
}

uint64_t VMURangeDescription(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x189NSStringormat:@"%#llx-%#llx[%llu]" a1, a1 + a2, a2];
}

void sub_1860E6D14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1860E6D7C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  BOOL v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)&OBJC_CLASS___VMUSymbolStore;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_1860E6ECC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1860E7124(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1860E7224( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_1860E72E4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *_uuidStringForOwner@<X0>(_CSTypeRef a1@<0:X0, 8:X1>, void *a2@<X8>)
{
  v6[5] = *MEMORY[0x1895F89C0];
  uint64_t CFUUIDBytes = CSSymbolOwnerGetCFUUIDBytes();
  return std::string::basic_string[abi:ne180100]<0>(a2, v4);
}

void sub_1860E74B8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, char a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, void *__p, uint64_t a29)
{
  uint64_t v30 = v29;

  _Block_object_dispose(&a22, 8);
  if (__p)
  {
    a29 = (uint64_t)__p;
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__1(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0LL;
  a1[3].n128_u64[1] = 0LL;
  a1[4].n128_u64[0] = 0LL;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0LL;
  a2[3].n128_u64[1] = 0LL;
  a2[4].n128_u64[0] = 0LL;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }

void sub_1860E771C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  uint64_t v6 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)va);
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)va1);
  _Unwind_Resume(a1);
}

uint64_t _sparsifySymbolOwner(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __p = 0LL;
  v25 = 0LL;
  v26 = 0LL;
  uint64_t v3 = *(void **)(a3 + 16);
  if (v3)
  {
    do
    {
      uint64_t SymbolWithAddress = CSSymbolOwnerGetSymbolWithAddress();
      uint64_t v6 = v5;
      if ((CSIsNull() & 1) == 0)
      {
        unint64_t v7 = v25;
        if (v25 >= v26)
        {
          uint64_t v9 = (char *)__p;
          uint64_t v10 = (v25 - (_BYTE *)__p) >> 4;
          unint64_t v11 = v10 + 1;
          uint64_t v12 = v26 - (_BYTE *)__p;
          if ((v26 - (_BYTE *)__p) >> 3 > v11) {
            unint64_t v11 = v12 >> 3;
          }
          else {
            unint64_t v13 = v11;
          }
          if (v13)
          {
            uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_CSTypeRef>>((uint64_t)&v26, v13);
            uint64_t v9 = (char *)__p;
            unint64_t v7 = v25;
          }

          else
          {
            uint64_t v14 = 0LL;
          }

          uint64_t v15 = (uint64_t *)&v14[16 * v10];
          *uint64_t v15 = SymbolWithAddress;
          v15[1] = v6;
          uint64_t v16 = v15;
          if (v7 != v9)
          {
            do
            {
              *((_OWORD *)v16 - 1) = *((_OWORD *)v7 - 1);
              v16 -= 2;
              v7 -= 16;
            }

            while (v7 != v9);
            uint64_t v9 = (char *)__p;
          }

          uint64_t v8 = (char *)(v15 + 2);
          __p = v16;
          v25 = (char *)(v15 + 2);
          v26 = &v14[16 * v13];
          if (v9) {
            operator delete(v9);
          }
        }

        else
        {
          *(void *)v25 = SymbolWithAddress;
          *((void *)v7 + 1) = v6;
          uint64_t v8 = v7 + 16;
        }

        v25 = v8;
      }

      uint64_t v3 = (void *)*v3;
    }

    while (v3);
    uint64_t v17 = __p;
    uint64_t v18 = (uint64_t)v25;
  }

  else
  {
    uint64_t v18 = 0LL;
    uint64_t v17 = 0LL;
  }

  v22 = 0LL;
  uint64_t v23 = 0LL;
  v21 = 0LL;
  std::vector<_CSTypeRef>::__init_with_size[abi:ne180100]<_CSTypeRef*,_CSTypeRef*>( &v21,  v17,  v18,  (v18 - (uint64_t)v17) >> 4);
  uint64_t SparseDataWithBlock = CSSymbolOwnerCreateSparseDataWithBlock();
  if (v21)
  {
    v22 = v21;
    operator delete(v21);
  }

  if (__p)
  {
    v25 = (char *)__p;
    operator delete(__p);
  }

  return SparseDataWithBlock;
}

void sub_1860E7948( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, void *a16, uint64_t a17)
{
  if (__p) {
    operator delete(__p);
  }
  if (a16) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

void sub_1860E7A5C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1860E7B9C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v4 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)va);
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)va1);
  _Unwind_Resume(a1);
}

LABEL_33:
  return (char)a8;
}

    if (!a5 && !v16)
    {
      if (!-[VMUObjectIdentifier hasSwiftContent](self, "hasSwiftContent")) {
        goto LABEL_59;
      }
      if (!-[VMUObjectIdentifier hasSwiftReflection](self, "hasSwiftReflection"))
      {
        uint64_t v16 = -[VMUClassInfo initSwiftClassWithName:classInfoType:size:]( objc_alloc(&OBJC_CLASS___VMUClassInfo),  "initSwiftClassWithName:classInfoType:size:",  0LL,  64LL,  a4);
        goto LABEL_58;
      }

      uint64_t v30 = objc_loadWeakRetained((id *)&self->_scanner);
      v31 = [v30 validateAddressRangeForSwiftRemoteMirror:v15 allowUnusedSplitLibs:8];

      if (!v31)
      {
LABEL_59:
        NSHashInsert(self->_nonObjectIsaHash, v15);
LABEL_60:
        uint64_t v16 = 0LL;
LABEL_61:
        self->_lastCPlusPlusIsa = (unint64_t)v15;
        objc_storeStrong((id *)&self->_lastCPlusPlusClassInfo, v16);
        if (!v16) {
          goto LABEL_11;
        }
        goto LABEL_17;
      }

      v51 = 0LL;
      v32 = -[VMUTask memoryCache](self->_task, "memoryCache");
      [v32 readPointerAt:v15 value:&v51];

      uint64_t v16 = 0LL;
      if (v51 == 1024)
      {
        self->_swiftMirrorReaderContext.needToValidateAddressRange = 1;
        vmu_swift_reflection_infoForInstance((uint64_t)self->_swiftMirror->var0, a6, (uint64_t)&v49);
        if ((_DWORD)v49 == 18)
        {
          if (_classInfoForMemory_length_atOffset_remoteAddress__onceToken != -1) {
            dispatch_once(&_classInfoForMemory_length_atOffset_remoteAddress__onceToken, &__block_literal_global_14);
          }
          v33 = objc_loadWeakRetained((id *)&self->_scanner);
          [v33 memoryCache];
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          HaveGenericCaptures = closureContextMayHaveGenericCaptures((uint64_t)v15, v34);

          if ((HaveGenericCaptures & 1) != 0
            || (v36 = objc_alloc(&OBJC_CLASS___VMUMutableClassInfo),
                realizedIsaToClassInfo = self->_realizedIsaToClassInfo,
                swiftMirror = self->_swiftMirror,
                v47 = v49,
                v48 = v50,
                (v39 = -[VMUClassInfo initWithClosureContext:typeInfo:infoMap:swiftFieldMetadataContext:]( v36,  "initWithClosureContext:typeInfo:infoMap:swiftFieldMetadataContext:",  a6,  &v47,  realizedIsaToClassInfo,  swiftMirror)) == 0))
          {
            uint64_t v16 = (VMUClassInfo *)(id)_classInfoForMemory_length_atOffset_remoteAddress__closureContextWithUnknownLayoutClassInfo;
          }

          else
          {
            uint64_t v16 = (VMUClassInfo *)v39;
            v40 = objc_loadWeakRetained((id *)&self->_scanner);
            [v40 applyTypeOverlayToMutableInfo:v16];
          }

          -[VMUClassInfoMap addClassInfo:forAddress:]( self->_realizedIsaToClassInfo,  "addClassInfo:forAddress:",  v16,  v15);
        }

        else
        {
          uint64_t v16 = 0LL;
        }

        self->_swiftMirrorReaderContext.needToValidateAddressRange = 0;
      }

      VMUClearCrashReporterInfo();
    }

void sub_1860E810C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20, void *a21)
{
  _Unwind_Resume(a1);
}

void sub_1860E8300( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_1860E8418( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_1860E8580( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
}

void __copy_helper_block_ea8_40c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE( uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (std::string *)(a1 + 40);
  if (*(char *)(a2 + 63) < 0)
  {
    std::string::__init_copy_ctor_external(v2, *(const std::string::value_type **)(a2 + 40), *(void *)(a2 + 48));
  }

  else
  {
    __int128 v3 = *(_OWORD *)(a2 + 40);
    v2->__r_.__value_.__l.__cap_ = *(void *)(a2 + 56);
    *(_OWORD *)&v2->__r_.__value_.__l.__data_ = v3;
  }

void __destroy_helper_block_ea8_40c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE( uint64_t a1)
{
}

LABEL_23:
    v22 = 0;
    goto LABEL_24;
  }

  v24 = -[NSMutableDictionary count](self->_resymbolicationUUIDs, "count");
  uint64_t v5 = 0LL;
  if (a4 && !v24)
  {
    [NSString stringWithFormat:@"Nothing to symbolicate. This dSYM does not contain symbols for '%@' binary. For more information, please compare the UUIDs.", v47[5]];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_variant_has_internal_content())
    {
      v26 = [v25 stringByAppendingFormat:@"\n\nIf after processing this memgraph with other cli tools and verifying the UUIDs you still see non-symbolicated addresses for '%@', please file a Radar to 'Symbolication | Xcode' and attach the memgraph, the dSYM and the non-symbolicated output of interest.", v47[5]];

      uint64_t v5 = (void *)v26;
    }

    else
    {
      uint64_t v5 = v25;
    }

    v27 = (void *)MEMORY[0x189607870];
    v52 = *MEMORY[0x1896075E0];
    v53 = v5;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v27 errorWithDomain:@"Memgraph Resymbolication Error" code:0 userInfo:v28];
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  v22 = -[NSMutableDictionary count](self->_resymbolicationUUIDs, "count") != 0;
LABEL_24:

  _Block_object_dispose(&v46, 8);
  return v22;
}

  v33 = ((uint64_t (*)(void *, uint64_t, uint64_t))v19[2])(v19, v28 + 16, 8LL);
  if (!v33 || (*(_BYTE *)(v33 + 4) & 1) == 0)
  {
    v34 = (uint64_t (*)(void *, uint64_t, uint64_t))v19[2];
    if (a1 == 8)
    {
      v35 = (void *)v34(v19, v28, 8LL);
      if (v35 && *v35)
      {
        v36 = (uint64_t *)((uint64_t (*)(void *, uint64_t, uint64_t))v19[2])(v19, *v35 + 8LL, 8LL);
        if (v36)
        {
          v37 = *v36;
LABEL_36:
          if (v37)
          {
            v42 = v15;
            v43 = [v42 refcountIsSideTableMarkerMask] & v37;
            if (v43 == [v42 refcountIsSideTableMarkerValue])
            {
              v44 = [v42 sideTablePointerMask] & v37;
              v45 = v44 >> [v42 sideTablePointerRightShift];
              v46 = v45 << [v42 sideTablePointerLeftShift];
            }

            else
            {
              v46 = 0LL;
            }

            if (v46 != v28) {
              goto LABEL_42;
            }
          }

          goto LABEL_41;
        }

        goto LABEL_35;
      }
    }

    else
    {
      v38 = (unsigned int *)v34(v19, v28, 4LL);
      if (v38)
      {
        v39 = *v38;
        if ((_DWORD)v39)
        {
          v40 = (unsigned int *)((uint64_t (*)(void *, uint64_t, uint64_t))v19[2])(v19, v39 + a1, 4LL);
          if (v40)
          {
            v37 = *v40;
            goto LABEL_36;
          }

  return v5;
}

  [v3 appendString:@"  CS_VALIDATED"];
  if ((a1 & 0x200) == 0)
  {
LABEL_11:
    if ((a1 & 0x400) == 0) {
      goto LABEL_12;
    }
LABEL_25:
    [v3 appendString:@"  CS_NX"];
    if ((a1 & 0x800) == 0) {
      return v3;
    }
    goto LABEL_13;
  }

  if (v2) {
    objc_storeStrong((id *)v10 + 4, v2);
  }

  uint64_t v1 = v10;
LABEL_26:
}

  return 0;
}

  if (a5 > 1 && a6) {
    v36 = 8;
  }
  else {
    v36 = 6;
  }
  if ((a3 & 0x200) != 0) {
    v37 = 0LL;
  }
  else {
    v37 = v36;
  }
  v38 = objc_alloc_init(MEMORY[0x189607940]);
  v39 = v38;
  if ((a3 & 0x200) != 0) {
    [v38 appendString:@"V="];
  }
  [v39 appendFormat:@"%*s", v37, pageCountString(self->range.length, a5, a6)];
  if ((a3 & 4) != 0)
  {
    if ((a3 & 0x200) != 0) {
      v43 = @" R=";
    }
    else {
      v43 = @" ";
    }
    [v39 appendString:v43];
    [v39 appendFormat:@"%*s", v37, pageCountString(self->resident_size, a5, a6)];
    if ((a3 & 8) == 0)
    {
LABEL_33:
      if ((a3 & 0x800) == 0) {
        goto LABEL_38;
      }
      goto LABEL_34;
    }
  }

  else if ((a3 & 8) == 0)
  {
    goto LABEL_33;
  }

  if ((a3 & 0x200) != 0) {
    v44 = @" D=";
  }
  else {
    v44 = @" ";
  }
  [v39 appendString:v44];
  [v39 appendFormat:@"%*s", v37, pageCountString(self->dirty_size, a5, a6)];
  if ((a3 & 0x800) != 0)
  {
LABEL_34:
    if ((a3 & 0x200) != 0) {
      v40 = @" S=";
    }
    else {
      v40 = @" ";
    }
    [v39 appendString:v40];
    [v39 appendFormat:@"%*s", v37, pageCountString(self->swapped_out_size, a5, a6)];
  }

void sub_1860E8B80( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, char a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, id a46)
{
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__32(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__33(uint64_t a1)
{
}

void sub_1860E8D50( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
}

void sub_1860E8E60( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_1860E8FE4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8LL) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000LL;
    *a1 = v6;
  }

  else
  {
    *((_BYTE *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }

  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_189DFC0A8, MEMORY[0x1896141F8]);
}

void sub_1860E91BC(_Unwind_Exception *a1)
{
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  __n128 result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x189614778] + 16LL);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x189614700], MEMORY[0x189614270]);
}

BOOL ___ZL20_sparsifySymbolOwner10_CSTypeRefNSt3__113unordered_setIyNS0_4hashIyEENS0_8equal_toIyEENS0_9allocatorIyEEEE_block_invoke( uint64_t a1, unint64_t a2, _OWORD *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  unint64_t v4 = (*(void *)(a1 + 40) - v3) >> 4;
  if (v4 > a2) {
    *a3 = *(_OWORD *)(v3 + 16 * a2);
  }
  return v4 <= a2;
}

void *__copy_helper_block_ea8_32c52_ZTSNSt3__16vectorI10_CSTypeRefNS_9allocatorIS1_EEEE( uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 32) = 0LL;
  *(void *)(a1 + 40) = 0LL;
  uint64_t v2 = (void *)(a1 + 32);
  v2[2] = 0LL;
  return std::vector<_CSTypeRef>::__init_with_size[abi:ne180100]<_CSTypeRef*,_CSTypeRef*>( v2,  *(const void **)(a2 + 32),  *(void *)(a2 + 40),  (uint64_t)(*(void *)(a2 + 40) - *(void *)(a2 + 32)) >> 4);
}

void __destroy_helper_block_ea8_32c52_ZTSNSt3__16vectorI10_CSTypeRefNS_9allocatorIS1_EEEE(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    *(void *)(a1 + 40) = v2;
    operator delete(v2);
  }

void *std::vector<_CSTypeRef>::__init_with_size[abi:ne180100]<_CSTypeRef*,_CSTypeRef*>( void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    __n128 result = std::vector<_CSTypeRef>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }

  return result;
}

void sub_1860E92D4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + _Block_object_dispose(va, 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

char *std::vector<_CSTypeRef>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::vector<_CSTypeRef>::__throw_length_error[abi:ne180100]();
  }
  __n128 result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_CSTypeRef>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void std::vector<_CSTypeRef>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<_CSTypeRef>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

void *std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long &>( uint64_t a1, unint64_t *a2, void *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
    }

    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }

    uint64_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      for (unint64_t i = *v9; i; unint64_t i = (void *)*i)
      {
        unint64_t v11 = i[1];
        if (v11 == v6)
        {
          if (i[2] == v6) {
            return i;
          }
        }

        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }

          else
          {
            v11 &= v7 - 1;
          }

          if (v11 != v3) {
            break;
          }
        }
      }
    }
  }

  unint64_t i = operator new(0x18uLL);
  *unint64_t i = 0LL;
  i[1] = v6;
  i[2] = *a3;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1LL;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( a1,  v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }

    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }

  uint64_t v18 = *(void *)a1;
  v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    *unint64_t i = *v19;
LABEL_38:
    void *v19 = i;
    goto LABEL_39;
  }

  *unint64_t i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*i)
  {
    unint64_t v20 = *(void *)(*i + 8LL);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }

    else
    {
      v20 &= v7 - 1;
    }

    v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }

void sub_1860E957C(_Unwind_Exception *a1)
{
}

void std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2LL;
  }

  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }

  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }

    else
    {
      uint64_t v7 = 1LL << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }

    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4) {
LABEL_16:
    }
      std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__do_rehash<true>( a1,  prime);
  }

void std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__do_rehash<true>( uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0LL;
    *(void *)(a1 + _Block_object_dispose(va, 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0LL;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }

      else
      {
        v8 &= a2 - 1;
      }

      *(void *)(*(void *)a1 + 8 * v_Block_object_dispose(va, 8) = a1 + 16;
      unint64_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }

          else
          {
            v12 &= a2 - 1;
          }

          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }

            void *v7 = *v11;
            *unint64_t v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            unint64_t v11 = v7;
          }

          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          unint64_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }

        while (v11);
      }
    }
  }

  else
  {
    uint64_t v10 = *(void **)a1;
    *(void *)a1 = 0LL;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + _Block_object_dispose(va, 8) = 0LL;
  }

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>( uint64_t a1, unsigned __int8 *a2, uint64_t a3, __int128 **a4)
{
  unint64_t v8 = (void *)(a1 + 24);
  unint64_t v9 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    unint64_t v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v4 = v9;
      if (v9 >= v11) {
        unint64_t v4 = v9 % v11;
      }
    }

    else
    {
      unint64_t v4 = (v11 - 1) & v9;
    }

    BOOL v14 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      for (unint64_t i = *v14; i; unint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v16 = *((void *)i + 1);
        if (v16 == v10)
        {
          if ((std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2) & 1) != 0) {
            return i;
          }
        }

        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11) {
              v16 %= v11;
            }
          }

          else
          {
            v16 &= v11 - 1;
          }

          if (v16 != v4) {
            break;
          }
        }
      }
    }
  }

  size_t v17 = (char *)operator new(0x50uLL);
  v29[0] = v17;
  v29[1] = a1 + 16;
  *(void *)size_t v17 = 0LL;
  *((void *)v17 + 1) = v10;
  uint64_t v18 = *a4;
  __int128 v19 = **a4;
  *((void *)v17 + 4) = *((void *)*a4 + 2);
  *((_OWORD *)v17 + 1) = v19;
  *((void *)v18 + 1) = 0LL;
  *((void *)v18 + 2) = 0LL;
  *(void *)uint64_t v18 = 0LL;
  *(_OWORD *)(v17 + 40) = 0u;
  *(_OWORD *)(v17 + 56) = 0u;
  *((_DWORD *)v17 + 1_Block_object_dispose(va, 8) = 1065353216;
  char v30 = 1;
  float v20 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v21 = *(float *)(a1 + 32);
  if (!v11 || (float)(v21 * (float)v11) < v20)
  {
    BOOL v22 = 1LL;
    if (v11 >= 3) {
      BOOL v22 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v23 = v22 | (2 * v11);
    unint64_t v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24) {
      size_t v25 = v24;
    }
    else {
      size_t v25 = v23;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( a1,  v25);
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11) {
        unint64_t v4 = v10 % v11;
      }
      else {
        unint64_t v4 = v10;
      }
    }

    else
    {
      unint64_t v4 = (v11 - 1) & v10;
    }
  }

  v26 = *(void **)(*(void *)a1 + 8 * v4);
  if (v26)
  {
    *(void *)v29[0] = *v26;
    void *v26 = v29[0];
  }

  else
  {
    *(void *)v29[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v29[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v29[0])
    {
      unint64_t v27 = *(void *)(*(void *)v29[0] + 8LL);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v27 >= v11) {
          v27 %= v11;
        }
      }

      else
      {
        v27 &= v11 - 1;
      }

      *(void *)(*(void *)a1 + 8 * v27) = v29[0];
    }
  }

  unint64_t i = (unsigned __int8 *)v29[0];
  v29[0] = 0LL;
  ++*v8;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,void *>>>>::reset[abi:ne180100]( (uint64_t)v29,  0LL);
  return i;
}

void sub_1860E9A5C(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

unint64_t std::__string_hash<char>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v3 = *(unsigned __int8 *)(a2 + 23);
  }

  else
  {
    a2 = *(void *)a2;
    unint64_t v3 = v2;
  }

  return std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v5, (uint64_t *)a2, v3);
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]( uint64_t a1, uint64_t *a2, unint64_t a3)
{
  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      uint64_t v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      uint64_t v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      uint64_t v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      uint64_t v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      uint64_t v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      uint64_t v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      uint64_t v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      unint64_t v11 = v7 + v9;
      unint64_t v12 = 0x9DDFEA08EB382D69LL
          * (v6 ^ ((0x9DDFEA08EB382D69LL * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69LL * (v6 ^ (v4 + a3))));
      unint64_t v13 = 0x9DDFEA08EB382D69LL * (v12 ^ (v12 >> 47));
      unint64_t v14 = v8 + a3 + v7 + v4;
      uint64_t v15 = v14 + v5;
      unint64_t v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297LL * (v12 ^ (v12 >> 47)), 21);
      uint64_t v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v18 = v17 + v6 + v9;
      uint64_t v19 = __ROR8__(v18, 44);
      uint64_t v20 = v18 + v10;
      uint64_t v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      uint64_t v23 = *a2;
      BOOL v22 = a2 + 4;
      unint64_t v24 = v23 - 0x4B6D499041670D8DLL * v5;
      uint64_t v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0LL);
      do
      {
        uint64_t v26 = *(v22 - 3);
        uint64_t v27 = v24 + v15 + v11 + v26;
        uint64_t v28 = v22[2];
        uint64_t v29 = v22[3];
        uint64_t v30 = v22[1];
        unint64_t v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        uint64_t v31 = v13 + v20;
        uint64_t v32 = *(v22 - 2);
        uint64_t v33 = *(v22 - 1);
        uint64_t v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        uint64_t v35 = v34 + v20 + v33;
        uint64_t v36 = v34 + v26 + v32;
        uint64_t v15 = v36 + v33;
        uint64_t v37 = __ROR8__(v36, 44) + v34;
        unint64_t v38 = (0xB492B66FBE98F273LL * __ROR8__(v27, 37)) ^ v21;
        unint64_t v24 = 0xB492B66FBE98F273LL * __ROR8__(v31, 33);
        unint64_t v16 = v37 + __ROR8__(v35 + v38, 21);
        unint64_t v39 = v24 + v21 + *v22;
        uint64_t v20 = v39 + v30 + v28 + v29;
        uint64_t v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        unint64_t v13 = v38;
        v25 += 64LL;
      }

      while (v25);
      unint64_t v40 = v24
          - 0x622015F714C7D297LL
          * ((0x9DDFEA08EB382D69LL
            * (v21 ^ ((0x9DDFEA08EB382D69LL * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69LL * (v21 ^ ((0x9DDFEA08EB382D69LL * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v21 ^ v16)))) >> 47));
      unint64_t v41 = 0x9DDFEA08EB382D69LL
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297LL
                  * ((0x9DDFEA08EB382D69LL
                    * (v20 ^ ((0x9DDFEA08EB382D69LL * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69LL * (v20 ^ ((0x9DDFEA08EB382D69LL * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69LL
           * ((0x9DDFEA08EB382D69LL * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69LL * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }

    else
    {
      return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](a2, a3);
    }
  }

  else if (a3 > 0x10)
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](a2, a3);
  }

  else
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](a2, a3);
  }

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100]( _DWORD *a1, unint64_t a2)
{
  if (a2 < 9)
  {
    if (a2 < 4)
    {
      unint64_t result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        unint64_t v8 = (0xC949D7C7509E6557LL * (a2 + 4LL * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }

    else
    {
      uint64_t v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v7 = 0x9DDFEA08EB382D69LL * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69LL
           * ((0x9DDFEA08EB382D69LL * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69LL * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }

  else
  {
    uint64_t v3 = *(void *)((char *)a1 + a2 - 8);
    uint64_t v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69LL
          * ((0x9DDFEA08EB382D69LL
            * (v4 ^ ((0x9DDFEA08EB382D69LL * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v4 ^ *(void *)a1)))) ^ ((0x9DDFEA08EB382D69LL * (v4 ^ ((0x9DDFEA08EB382D69LL * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v4 ^ *(void *)a1)))) >> 47))) ^ v3;
  }

  return result;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100]( void *a1, uint64_t a2)
{
  uint64_t v2 = a1[1];
  unint64_t v3 = 0xB492B66FBE98F273LL * *a1;
  uint64_t v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  unint64_t v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557LL, 20) - 0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8);
  unint64_t v6 = 0x9DDFEA08EB382D69LL * (v5 ^ (v4 - 0x3C5A37A36834CED9LL * *(void *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69LL
       * ((0x9DDFEA08EB382D69LL * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69LL * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100]( void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)((char *)a1 + a2 - 16);
  uint64_t v3 = *a1 - 0x3C5A37A36834CED9LL * (v2 + a2);
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = __ROR8__(v3 + v4, 52);
  uint64_t v7 = v3 + a1[1];
  uint64_t v8 = __ROR8__(v7, 7);
  uint64_t v9 = v7 + v5;
  uint64_t v10 = *(void *)((char *)a1 + a2 - 32) + v5;
  uint64_t v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9LL * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  uint64_t v12 = *(void *)((char *)a1 + a2 - 24) + v10 + v2;
  unint64_t v13 = 0xC3A5C85C97CB3127LL * (v12 + *(void *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1LL
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(void *)((char *)a1 + a2 - 24) + v10, 7)
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9LL * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9LL * (v13 ^ (v13 >> 47))) >> 47));
}

uint64_t std::equal_to<std::string>::operator()[abi:ne180100]( uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = a2[23];
  if ((v4 & 0x80u) == 0LL) {
    uint64_t v5 = a2[23];
  }
  else {
    uint64_t v5 = *((void *)a2 + 1);
  }
  uint64_t v6 = a3[23];
  int v7 = (char)v6;
  if ((v6 & 0x80u) != 0LL) {
    uint64_t v6 = *((void *)a3 + 1);
  }
  if (v5 != v6) {
    return 0LL;
  }
  if (v7 < 0) {
    uint64_t v3 = *(unsigned __int8 **)a3;
  }
  if ((v4 & 0x80) != 0) {
    return memcmp(*(const void **)a2, v3, *((void *)a2 + 1)) == 0;
  }
  if (!a2[23]) {
    return 1LL;
  }
  uint64_t v8 = v4 - 1;
  do
  {
    int v10 = *a2++;
    int v9 = v10;
    int v12 = *v3++;
    int v11 = v12;
    BOOL v14 = v8-- != 0;
    uint64_t result = v9 == v11;
  }

  while (v9 == v11 && v14);
  return result;
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,void *>>>>::reset[abi:ne180100]( uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::unordered_set<unsigned long long>>,0>((uint64_t)v2 + 16);
    }
    operator delete(v2);
  }

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::unordered_set<unsigned long long>>,0>( uint64_t a1)
{
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::find<std::string>( void *a1, unsigned __int8 *a2)
{
  unint64_t v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), (uint64_t)a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0LL;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }

  else
  {
    unint64_t v9 = (*(void *)&v5 - 1LL) & v4;
  }

  int v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10) {
    return 0LL;
  }
  int v11 = *v10;
  if (*v10)
  {
    uint64_t v12 = (uint64_t)(a1 + 4);
    do
    {
      unint64_t v13 = *((void *)v11 + 1);
      if (v13 == v6)
      {
        if ((std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, a2) & 1) != 0) {
          return v11;
        }
      }

      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(void *)&v5) {
            v13 %= *(void *)&v5;
          }
        }

        else
        {
          v13 &= *(void *)&v5 - 1LL;
        }

        if (v13 != v9) {
          return 0LL;
        }
      }

      int v11 = *(unsigned __int8 **)v11;
    }

    while (v11);
  }

  return v11;
}

{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 **v10;
  unsigned __int8 *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), (uint64_t)a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0LL;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }

  else
  {
    unint64_t v9 = (*(void *)&v5 - 1LL) & v4;
  }

  int v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10) {
    return 0LL;
  }
  int v11 = *v10;
  if (*v10)
  {
    uint64_t v12 = (uint64_t)(a1 + 4);
    do
    {
      unint64_t v13 = *((void *)v11 + 1);
      if (v6 == v13)
      {
        if ((std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, a2) & 1) != 0) {
          return v11;
        }
      }

      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(void *)&v5) {
            v13 %= *(void *)&v5;
          }
        }

        else
        {
          v13 &= *(void *)&v5 - 1LL;
        }

        if (v13 != v9) {
          return 0LL;
        }
      }

      int v11 = *(unsigned __int8 **)v11;
    }

    while (v11);
  }

  return v11;
}

uint64_t std::unordered_set<unsigned long long>::unordered_set(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( a1,  *(void *)(a2 + 8));
  for (unint64_t i = *(void **)(a2 + 16); i; unint64_t i = (void *)*i)
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>( a1,  i + 2,  i + 2);
  return a1;
}

void sub_1860EA19C(_Unwind_Exception *a1)
{
}

void *std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>( uint64_t a1, unint64_t *a2, void *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
    }

    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }

    unint64_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      for (unint64_t i = *v9; i; unint64_t i = (void *)*i)
      {
        unint64_t v11 = i[1];
        if (v11 == v6)
        {
          if (i[2] == v6) {
            return i;
          }
        }

        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }

          else
          {
            v11 &= v7 - 1;
          }

          if (v11 != v3) {
            break;
          }
        }
      }
    }
  }

  unint64_t i = operator new(0x18uLL);
  *unint64_t i = 0LL;
  i[1] = v6;
  i[2] = *a3;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1LL;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( a1,  v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }

    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }

  uint64_t v18 = *(void *)a1;
  uint64_t v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    *unint64_t i = *v19;
LABEL_38:
    void *v19 = i;
    goto LABEL_39;
  }

  *unint64_t i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*i)
  {
    unint64_t v20 = *(void *)(*i + 8LL);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }

    else
    {
      v20 &= v7 - 1;
    }

    uint64_t v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }

void sub_1860EA3B8(_Unwind_Exception *a1)
{
}

uint64_t std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table( uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      unint64_t v3 = (void *)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }

    while (v3);
  }

  unint64_t v4 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>( uint64_t a1, unsigned __int8 *a2, uint64_t a3, __int128 **a4)
{
  uint8x8_t v8 = (void *)(a1 + 24);
  unint64_t v9 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    unint64_t v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v4 = v9;
      if (v9 >= v11) {
        unint64_t v4 = v9 % v11;
      }
    }

    else
    {
      unint64_t v4 = (v11 - 1) & v9;
    }

    BOOL v14 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      for (unint64_t i = *v14; i; unint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v16 = *((void *)i + 1);
        if (v16 == v10)
        {
          if ((std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2) & 1) != 0) {
            return i;
          }
        }

        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11) {
              v16 %= v11;
            }
          }

          else
          {
            v16 &= v11 - 1;
          }

          if (v16 != v4) {
            break;
          }
        }
      }
    }
  }

  std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>( a1,  v10,  a4,  (uint64_t)v26);
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v18 = *(float *)(a1 + 32);
  if (!v11 || (float)(v18 * (float)v11) < v17)
  {
    BOOL v19 = 1LL;
    if (v11 >= 3) {
      BOOL v19 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v11);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( a1,  v22);
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11) {
        unint64_t v4 = v10 % v11;
      }
      else {
        unint64_t v4 = v10;
      }
    }

    else
    {
      unint64_t v4 = (v11 - 1) & v10;
    }
  }

  uint64_t v23 = *(void **)(*(void *)a1 + 8 * v4);
  if (v23)
  {
    *(void *)v26[0] = *v23;
    *uint64_t v23 = v26[0];
  }

  else
  {
    *(void *)v26[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v26[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v26[0])
    {
      unint64_t v24 = *(void *)(*(void *)v26[0] + 8LL);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v24 >= v11) {
          v24 %= v11;
        }
      }

      else
      {
        v24 &= v11 - 1;
      }

      *(void *)(*(void *)a1 + 8 * v24) = v26[0];
    }
  }

  unint64_t i = (unsigned __int8 *)v26[0];
  v26[0] = 0LL;
  ++*v8;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,void *>>>>::reset[abi:ne180100]( (uint64_t)v26,  0LL);
  return i;
}

void sub_1860EA794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

double std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>@<D0>( uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  uint8x8_t v8 = (char *)operator new(0x50uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + _Block_object_dispose(va, 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  *(void *)uint8x8_t v8 = 0LL;
  *((void *)v8 + 1) = a2;
  unint64_t v9 = (std::string *)(v8 + 16);
  unint64_t v10 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)v10, *((void *)v10 + 1));
  }

  else
  {
    __int128 v11 = *v10;
    *((void *)v8 + 4) = *((void *)v10 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v11;
  }

  double result = 0.0;
  *(_OWORD *)(v8 + 56) = 0u;
  *(_OWORD *)(v8 + 40) = 0u;
  *((_DWORD *)v8 + 1_Block_object_dispose(va, 8) = 1065353216;
  *(_BYTE *)(a4 + 16) = 1;
  return result;
}

void sub_1860EA840(_Unwind_Exception *a1)
{
}

void std::string::__init_copy_ctor_external( std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  int8x8_t v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8LL) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    uint8x8_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__l.__cap_ = v7 | 0x8000000000000000LL;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    int8x8_t v5 = v8;
  }

  else
  {
    this->__r_.__value_.__s.__size_ = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::~__hash_table( uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<unsigned long long>>>>::__deallocate_node( uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      unint64_t v3 = (void *)*v2;
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::unordered_set<unsigned long long>>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      uint64_t v2 = v3;
    }

    while (v3);
  }

id VMUVMLedgerNameForTag(unint64_t a1)
{
  if (a1 > 5) {
    id v1 = [objc_alloc(MEMORY[0x189607ANSString:@"VM ledger tag %llu" a1];
  }
  else {
    id v1 = gVMLedgerNames[a1];
  }
  return v1;
}

id VMUGatherOwnedVmObjects(void *a1)
{
  id v1 = a1;
  size_t v32 = 0LL;
  [v1 memoryCache];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = -[VMUTaskMemoryCache getOwnedVMObjectsIntoBuffer:byteCount:]((uint64_t)v2, 0LL, &v32);

  unint64_t v4 = 0LL;
  if (!v3)
  {
    size_t v5 = v32;
    if (v32)
    {
      std::string::size_type v6 = 0LL;
      do
      {
        v5 += 896LL;
        std::string::size_type v6 = (unint64_t *)realloc(v6, v5);
        size_t v31 = v5;
        [v1 memoryCache];
        std::string::size_type v7 = (void *)objc_claimAutoreleasedReturnValue();
        int v8 = -[VMUTaskMemoryCache getOwnedVMObjectsIntoBuffer:byteCount:]((uint64_t)v7, v6, &v31);

        if (v8)
        {
          unint64_t v4 = 0LL;
          goto LABEL_12;
        }
      }

      while (v5 == v31);
      unint64_t v4 = (void *)objc_opt_new();
      if (v31)
      {
        if (v31 > 7)
        {
          if (v31 - 8 >= 56 * *v6)
          {
            if (*v6)
            {
              unint64_t v26 = 0LL;
              uint64_t v27 = (uint64_t *)(v6 + 1);
              do
              {
                uint64_t v28 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v27 length:56];
                uint64_t v29 = *v27;
                v27 += 7;
                [MEMORY[0x189607968] numberWithUnsignedLongLong:v29];
                uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
                [v4 setObject:v28 forKeyedSubscript:v30];

                ++v26;
              }

              while (v26 < *v6);
            }
          }

          else
          {
            BOOL v18 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
            if (v18) {
              VMUGatherOwnedVmObjects_cold_2(v18, v19, v20, v21, v22, v23, v24, v25);
            }
          }
        }

        else
        {
          BOOL v9 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
          if (v9) {
            VMUGatherOwnedVmObjects_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
          }
        }
      }

uint64_t VMUFootprintForVmObject(uint64_t result, void *a2, void *a3)
{
  unsigned int v3 = *(unsigned __int8 *)(result + 48);
  if ((v3 & 1) != 0)
  {
    uint64_t v6 = 0LL;
    *a2 = 0LL;
  }

  else
  {
    int v4 = (v3 >> 4) & 3;
    if (v4 == 3 || v4 == 0)
    {
      *a2 = *(void *)(result + 16) - *(void *)(result + 32);
      uint64_t v6 = *(void *)(result + 40);
    }

    else
    {
      uint64_t v6 = 0LL;
      *a2 = *(void *)(result + 24);
    }
  }

  *a3 = v6;
  return result;
}

void OUTLINED_FUNCTION_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

LABEL_11:
  return v5;
}

  if ((a3 & 0x10) != 0)
  {
    uint64_t v20 = objc_alloc_init(&OBJC_CLASS___VMUVMRegionRangeInfo);

    -[VMUVMRegionRangeInfo setAddress:](v20, "setAddress:", a4);
    -[VMUVMRegionRangeInfo setSize:](v20, "setSize:", v7);
    -[VMUVMRegionRangeInfo setStackIdentifier:](v20, "setStackIdentifier:", a6);
    -[VMUVMRegionRangeInfo setUserTag:](v20, "setUserTag:", HIBYTE(a3));
    -[NSMutableArray insertObject:atIndex:](self->_regionInfoArray, "insertObject:atIndex:", v20, v11);
    v12 += v7;
    uint64_t v14 = v20;
  }

  return v12;
}

    uint64_t v24 = @"No-Change";
    goto LABEL_14;
  }

  if ([v21 kind] == 6)
  {
    _recursivelyDetermineSwiftEnumPayloadVariantHash(v17, v18, v19, v20, v21, v22, a7, a8, a9, a10);
  }

  else
  {
    [v21 subFieldArray];
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v26 = [v25 count];

    if (v26)
    {
      uint64_t v37 = v22;
      uint64_t v27 = v20;
      uint64_t v28 = v19;
      uint64_t v29 = v17;
      uint64_t v30 = [v21 offset];
      unint64_t v38 = 0u;
      unint64_t v39 = 0u;
      unint64_t v40 = 0u;
      unint64_t v41 = 0u;
      [v21 subFieldArray];
      obj = (id)objc_claimAutoreleasedReturnValue();
      size_t v31 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v31)
      {
        size_t v32 = v31;
        uint64_t v33 = (v30 + a7);
        uint64_t v34 = *(void *)v39;
        do
        {
          for (unint64_t i = 0LL; i != v32; ++i)
          {
            if (*(void *)v39 != v34) {
              objc_enumerationMutation(obj);
            }
            _recursivelyDetermineComplexSwiftVariantHash( v29,  v18,  v28,  v27,  *(void *)(*((void *)&v38 + 1) + 8 * i),  v37,  v33,  a8,  a9,  a10 + 1);
          }

          size_t v32 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
        }

        while (v32);
      }

      float v17 = v29;
      uint64_t v19 = v28;
      uint64_t v20 = v27;
      uint64_t v22 = v37;
    }
  }

    uint64_t v12 = -1LL;
    goto LABEL_13;
  }

          uint64_t v23 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,RangeAndString *,BOOL (*&)(RangeAndString const&,RangeAndString const&)>( (__int128 *)a1,  (unint64_t)a2,  (uint64_t (**)(char *, __int128 *))a3);
          if ((v24 & 1) == 0) {
            goto LABEL_14;
          }
          uint64_t v25 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>( a1,  v23,  a3);
          uint64_t v11 = (__int128 *)(v23 + 24);
          if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>( v23 + 24,  (uint64_t)a2,  a3))
          {
            uint64_t v12 = v13 + 1;
            if (v25) {
              continue;
            }
LABEL_14:
            std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*,false>( a1,  v23,  a3,  -v13,  a5 & 1);
            uint64_t v11 = (__int128 *)(v23 + 24);
LABEL_16:
            a5 = 0;
            a4 = -v13;
            goto LABEL_2;
          }

          a4 = -v13;
          a2 = (__int128 *)v23;
          if (v25) {
            return;
          }
          goto LABEL_1;
        }

        if (v11 != a2) {
          std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*,RangeAndString*>( (__n128 *)v11,  (__n128 *)a2,  (__n128 *)a2,  (unsigned int (**)(uint64_t, __int8 *))a3,  a6);
        }
        return;
    }
  }

  if (self->_dyldPlatformIsValid)
  {
    double result = 0;
    *a3 = self->_dyldPlatform;
    return result;
  }

  return 5;
}

      uint64_t v13 = _classDataRWAddressofClass(v7, (uint64_t)v8, a4);
      goto LABEL_12;
    }

  return a1;
}

  [NSString stringWithFormat:@"VMUBacktrace (Flavor: %@ Time: %llu Process: %d Thread: %X  Dispatch queue serial num: %lld)\n", v4, self->_timestamp, self->_callstack.context.pid, self->_callstack.context.thread, self->_callstack.context.dispatch_queue_serial_num];
  size_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  descriptionForCallstackFrames((uint64_t)&self->_callstack, @"Frames");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 stringByAppendingString:v6];
  std::string::size_type v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_asyncCallstack.length)
  {
    descriptionForCallstackFrames((uint64_t)&self->_asyncCallstack, @"Async Frames");
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v9 = [v7 stringByAppendingString:v8];

    std::string::size_type v7 = (void *)v9;
  }

  return v7;
}

LABEL_27:
          _removeStdArgumentsFromCPlusPlusSymbolName(v17);
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();

          _printCPlusPlusNameSimplification(v15, v28);
          uint64_t v11 = v37;
          -[__CFString stringByAppendingFormat:](v37, "stringByAppendingFormat:", @" in %@", v28);
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
          std::string::size_type v7 = v38;
          int v4 = v39;
          size_t v31 = v40;
          uint64_t v30 = v41;
          goto LABEL_35;
        }

        if (!-[VMUStackLogReaderBase shouldIgnoreSymbolWithName:binaryPath:]( self,  "shouldIgnoreSymbolWithName:binaryPath:",  v17,  v18)) {
          goto LABEL_26;
        }
      }

      uint64_t v16 = v24;
      if (!--v9)
      {
LABEL_26:
        if (!v17) {
          goto LABEL_30;
        }
        goto LABEL_27;
      }
    }
  }

  uint64_t v15 = 0LL;
  BOOL v18 = 0LL;
  size_t v31 = 0LL;
  uint64_t v30 = 0LL;
  v42 = 0LL;
LABEL_31:
  [v18 lastPathComponent];
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    [@"non-object from " stringByAppendingString:v35];
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v29 = 0LL;
  }

  uint64_t v28 = 0LL;
LABEL_35:

  objc_autoreleasePoolPop(v7);
  if (v4) {
    *int v4 = v18;
  }
  uint64_t v36 = v29;

  return v36;
}
}

    BOOL v18 = [v13 count];
    v11->_ivarCount = v18;
    if (v18)
    {
      v11->_localIvarList = (id *)calloc(v18 + 1, 8uLL);
      if (v11->_ivarCount)
      {
        uint64_t v19 = 0LL;
        do
        {
          uint64_t v20 = [v13 objectAtIndexedSubscript:v19];
          localIvarList = v11->_localIvarList;
          uint64_t v22 = localIvarList[v19];
          localIvarList[v19] = (id)v20;

          ++v19;
        }

        while (v19 < v11->_ivarCount);
      }
    }

    if (debugSwiftSubfieldIsEnabled::dispatchToken != -1) {
      dispatch_once(&debugSwiftSubfieldIsEnabled::dispatchToken, &__block_literal_global_25);
    }
    if (debugSwiftSubfieldIsEnabled::isEnabled) {
      _debugSwiftAsyncPrintf(0, "\n");
    }
  }

  return v11;
}

    if (_logSwiftUnknownFieldsIsEnabled(void)::isEnabled)
    {
      uint64_t v28 = (FILE *)*MEMORY[0x1895F89D0];
      if (a5)
      {
        float v17 = vmu_swift_reflection_interop_copyDemangledNameForTypeRef(*a1, a5, v11);
        uint64_t v29 = (const char *)[v17 UTF8String];
      }

      else
      {
        uint64_t v29 = "?";
      }

      fprintf( v28, "Found SWIFT_UNKNOWN field %s (type %s) in class %s\n", a2, v29, (const char *)[v19 UTF8String]);
      if (a5) {
    }
      }

    goto LABEL_22;
  }

  if (a2) {
    uint64_t v20 = a2;
  }
  else {
    uint64_t v20 = "";
  }
  v68 = v20;
  v67 = a3;
  [v18 swiftFieldWithName:offset:kind:typeref:];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    if (debugSwiftSubfieldIsEnabled::dispatchToken != -1) {
      dispatch_once(&debugSwiftSubfieldIsEnabled::dispatchToken, &__block_literal_global_25);
    }
    if (debugSwiftSubfieldIsEnabled::isEnabled) {
      _debugSwiftAsyncPrintf(a10, "Found cached field %s\n", v68);
    }
    uint64_t v22 = v21;
    goto LABEL_12;
  }

  uint64_t v25 = 0;
  LODWORD(v26) = 2;
  uint64_t v27 = 2LL;
  switch((int)a4)
  {
    case 13:
      break;
    case 14:
      uint64_t v25 = 0;
      LODWORD(v26) = 3;
      break;
    case 15:
      uint64_t v25 = 0;
      LODWORD(v26) = 4;
      break;
    case 16:
      uint64_t v25 = 0;
      LODWORD(v26) = 1;
      break;
    default:
      if ((_DWORD)a4 == 1)
      {
        uint64_t v25 = 0;
        uint64_t v30 = a1[2];
        if (a5 != v30 || v30 == 0) {
          unint64_t v26 = 1LL;
        }
        else {
          unint64_t v26 = 2LL;
        }
        uint64_t v27 = v26;
      }

      else
      {
        LODWORD(v26) = 0;
        uint64_t v27 = 0LL;
        uint64_t v25 = 1;
      }

      break;
  }

  v65 = v26;
  if (_createFieldInfoFromChild(libSwiftRemoteMirrorWrapper *,char const*,unsigned int,swift_layout_kind,swift_typeref_interop,VMUClassInfoMap *,unsigned int,NSString *,BOOL *,unsigned int)::dispatchEnumConfigOnceToken != -1) {
    dispatch_once( &_createFieldInfoFromChild(libSwiftRemoteMirrorWrapper *,char const*,unsigned int,swift_layout_kind,swift_typeref_interop,VMUClassInfoMap *,unsigned int,NSString *,BOOL *,unsigned int)::dispatchEnumConfigOnceToken,  &__block_literal_global_440);
  }
  vmu_swift_reflection_infoForTypeRef(*a1, a5, v11);
  size_t v32 = &unk_18C68A000;
  if (_debugRemoteMirrorOutputForSwiftSubfieldIsEnabled(void)::isEnabled)
  {
    uint64_t v33 = nameOfSwiftLayoutKind(v72);
    _debugSwiftAsyncPrintf( a10,  "infoForTypeRef() gave { .Kind = %s, .Size = %u, .Alignment = %u, .Stride = %u, .NumFields = %u}\n",  v33,  v73,  v74,  v75,  v76);
  }

  if (v72)
  {
    if (!v73 || !v75)
    {
      if (_debugRemoteMirrorOutputForSwiftSubfieldIsEnabled(void)::dispatchToken != -1) {
        dispatch_once( &_debugRemoteMirrorOutputForSwiftSubfieldIsEnabled(void)::dispatchToken,  &__block_literal_global_412);
      }
      uint64_t v22 = 0LL;
      goto LABEL_12;
    }

    uint64_t v34 = 0x189607000uLL;
    if (!v25)
    {
      uint64_t v36 = 0LL;
LABEL_67:
      [*(id *)(v34 + 2600) stringWithUTF8String:v68];
      unint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v5_Block_object_dispose(va, 8) = v75;
      if ((_DWORD)v27 == 6) {
        unint64_t v41 = -[VMUFieldInfo initSwiftEnumPayloadFieldWithName:type:kind:scan:offset:size:stride:possibleEnumSubFieldArray:swiftTyperef:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initSwiftEnumPayloadFieldWithName:type:kind:scan:offset:size:stride:possibleEnumSubFieldArray:swiftTyperef:",  v40,  &stru_189E010C8,  6LL,  v65,  v67,  v73,  v58,  v36,  &v77);
      }
      else {
        unint64_t v41 = -[VMUFieldInfo initWithName:type:kind:scan:offset:size:stride:subFieldArray:swiftTyperef:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initWithName:type:kind:scan:offset:size:stride:subFieldArray:swiftTyperef:",  v40,  &stru_189E010C8,  v27,  v65,  v67,  v73,  v58,  v36,  &v77);
      }
      v42 = v41;
      [v18 memoizeSwiftField:v41 withName:v68 offset:v67 kind:a4 typeref:v77];
      uint64_t v22 = v42;

LABEL_71:
      goto LABEL_12;
    }

    uint64_t v35 = objc_opt_new();
    uint64_t v36 = (void *)v35;
    v60 = 0;
    uint64_t v37 = 0;
    uint64_t v27 = 0LL;
    v64 = 0;
    v65 = 1;
    unint64_t v38 = 4LL;
    unint64_t v39 = a4;
    switch((int)a4)
    {
      case 3:
        goto LABEL_85;
      case 4:
      case 10:
      case 11:
        goto LABEL_77;
      case 5:
        goto LABEL_67;
      case 6:
        uint64_t v37 = 0;
        v60 = _createFieldInfoFromChild(libSwiftRemoteMirrorWrapper *,char const*,unsigned int,swift_layout_kind,swift_typeref_interop,VMUClassInfoMap *,unsigned int,NSString *,BOOL *,unsigned int)::preciselyScanSinglePayloadEnums;
        v64 = _createFieldInfoFromChild(libSwiftRemoteMirrorWrapper *,char const*,unsigned int,swift_layout_kind,swift_typeref_interop,VMUClassInfoMap *,unsigned int,NSString *,BOOL *,unsigned int)::preciselyScanSinglePayloadEnums != 0;
        else {
          unint64_t v39 = 0LL;
        }
        goto LABEL_85;
      case 7:
        v43 = _createFieldInfoFromChild(libSwiftRemoteMirrorWrapper *,char const*,unsigned int,swift_layout_kind,swift_typeref_interop,VMUClassInfoMap *,unsigned int,NSString *,BOOL *,unsigned int)::preciselyScanMultiPayloadEnums;
        v64 = _createFieldInfoFromChild(libSwiftRemoteMirrorWrapper *,char const*,unsigned int,swift_layout_kind,swift_typeref_interop,VMUClassInfoMap *,unsigned int,NSString *,BOOL *,unsigned int)::preciselyScanMultiPayloadEnums != 0;
        else {
          unint64_t v38 = 0LL;
        }
        v60 = 1;
        goto LABEL_80;
      case 9:
        uint64_t v27 = 7LL;
        v65 = 1;
        goto LABEL_67;
      default:
        unint64_t v38 = 0LL;
        v60 = 1;
LABEL_77:
        if ((_DWORD)a4 == 5) {
          goto LABEL_82;
        }
        if ((_DWORD)a4 == 7)
        {
          v64 = 0;
          v43 = _createFieldInfoFromChild(libSwiftRemoteMirrorWrapper *,char const*,unsigned int,swift_layout_kind,swift_typeref_interop,VMUClassInfoMap *,unsigned int,NSString *,BOOL *,unsigned int)::preciselyScanMultiPayloadEnums;
LABEL_80:
          if (!v43)
          {
LABEL_82:
            v65 = v60;
            uint64_t v27 = v38;
            goto LABEL_67;
          }

          uint64_t v37 = 1;
        }

        else
        {
          uint64_t v37 = 0;
          v64 = 0;
        }

        unint64_t v39 = v38;
LABEL_85:
        else {
          v44 = v37;
        }
        v63 = v44;
        if (!v76)
        {
          v65 = v60;
          uint64_t v27 = v39;
          goto LABEL_67;
        }

        v59 = v39;
        v45 = 0LL;
        v46 = "subfield";
        v66 = a10 + 1;
        v47 = v63;
        if (v64) {
          v46 = "possible enum payload";
        }
        v61 = v46;
        v62 = (void *)v35;
        break;
    }

    while (1)
    {
      v48 = (void *)MEMORY[0x186E32E40]();
      vmu_swift_reflection_childOfTypeRef(*a1, v77, v78, v45, (uint64_t)&v70);
      if (v32[255] != -1LL) {
        dispatch_once( &_debugRemoteMirrorOutputForSwiftSubfieldIsEnabled(void)::dispatchToken,  &__block_literal_global_412);
      }
      if (_debugRemoteMirrorOutputForSwiftSubfieldIsEnabled(void)::isEnabled)
      {
        v69[0] = v70;
        v69[1] = v71;
        _debugSwiftSubfieldDumpSwiftChildInfo(v66, "childOfTypeRef()", (uint64_t)v69, *a1);
      }

      if ((void)v71) {
        v49 = 0;
      }
      else {
        v49 = v47;
      }
      if (v49 == 1)
      {
        if (v64) {
          goto LABEL_107;
        }
        v50 = 0LL;
      }

      else
      {
        HIDWORD(v5_Block_object_dispose(va, 8) = HIDWORD(a9);
        v51 = _createFieldInfoFromChild(a1, v70, DWORD2(v70), HIDWORD(v70));
        v50 = (id)v51;
        if (*a9)
        {
          v52 = 0;
          goto LABEL_118;
        }

        v53 = !v64;
        if (v51) {
          v53 = 1;
        }
        if ((v53 & 1) == 0) {
LABEL_107:
        }
          v50 = (id)swiftEnumDummyNoPayloadSubField;
      }

      if (debugSwiftSubfieldIsEnabled::dispatchToken != -1) {
        dispatch_once(&debugSwiftSubfieldIsEnabled::dispatchToken, &__block_literal_global_25);
      }
      if (debugSwiftSubfieldIsEnabled::isEnabled)
      {
        if (v50)
        {
          v54 = objc_msgSend( NSString,  "stringWithFormat:",  @"  scanType %s",  VMUScanTypeScanDescription(objc_msgSend(v50, "scanType")));
          v55 = (const char *)[v54 UTF8String];

          v56 = "";
        }

        else
        {
          v55 = "";
          v56 = "NO-FIELD  ";
        }

        v57 = nameOfSwiftLayoutKind(a4);
        _debugSwiftAsyncPrintf( v66,  "%s%s %s %u of %u  %s%s, of field %s  size %u stride %u\n",  v56,  v57,  v61,  v45,  v76,  (const char *)v70,  v55,  v68,  v73,  v75);
        v47 = v63;
      }

      if (v50) {
        [v62 addObject:v50];
      }
      v52 = 1;
LABEL_118:

      objc_autoreleasePoolPop(v48);
      size_t v32 = (void *)&unk_18C68A000;
      if ((v52 & 1) == 0)
      {
        uint64_t v22 = 0LL;
        uint64_t v36 = v62;
        goto LABEL_71;
      }

      v45 = (v45 + 1);
      if (v45 >= v76)
      {
        uint64_t v27 = v59;
        v65 = v60;
        uint64_t v36 = v62;
        uint64_t v34 = 0x189607000LL;
        goto LABEL_67;
      }
    }
  }

  uint64_t v22 = 0LL;
  *a9 = 1;
LABEL_12:

LABEL_23:
  return v22;
}

    _Block_object_dispose(&v24, 8);
  }
}

id _removeReturnValueFromCPlusPlusSymbolName(void *a1)
{
  id v1 = a1;
  if ([v1 containsString:@"::"])
  {
    [v1 stringByReplacingOccurrencesOfString:@"__1::" withString:&stru_189E010C8];
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (([v2 hasPrefix:@"invocation function "] & 1) != 0
      || ([v2 hasPrefix:@"operator "] & 1) != 0
      || (unint64_t v3 = _lengthOfSubclauseInCPlusPlusSymbolName(v2, 0LL, 0, 1)) == 0)
    {
      id v1 = v2;
    }

    else
    {
      [v2 substringFromIndex:v3];
      id v1 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  id v4 = v1;

  return v4;
}

id _removeStdArgumentsFromCPlusPlusSymbolName(void *a1)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  if ([v1 containsString:@"std::"])
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    uint64_t v2 = [&unk_189E1D030 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v15;
      do
      {
        for (uint64_t i = 0LL; i != v3; ++i)
        {
          if (*(void *)v15 != v4) {
            objc_enumerationMutation(&unk_189E1D030);
          }
          uint64_t v6 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v7 = [v1 rangeOfString:v6];
          if (v7 != 0x7FFFFFFFFFFFFFFFLL)
          {
            for (unint64_t j = v7; j != 0x7FFFFFFFFFFFFFFFLL; unint64_t j = [v1 rangeOfString:v6])
            {
              unint64_t v9 = _lengthOfSubclauseInCPlusPlusSymbolName(v1, j, 1, 0);
              if (v9)
              {
                [v1 substringWithRange:j, v9];
                uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v11 = [v1 stringByReplacingOccurrencesOfString:v10 withString:&stru_189E010C8];

                id v1 = (id)v11;
              }
            }
          }
        }

        uint64_t v3 = [&unk_189E1D030 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v3);
    }
  }

  id v12 = v1;

  return v12;
}

void _printCPlusPlusNameSimplification(void *a1, void *a2)
{
  id v5 = a1;
  id v3 = a2;
  if (_printCPlusPlusNameSimplification_printCPlusPlusNameSimplification == 1
    && ([v5 isEqualToString:v3] & 1) == 0)
  {
    uint64_t v4 = (FILE **)MEMORY[0x1895F89D0];
    fprintf( (FILE *)*MEMORY[0x1895F89D0], "ORIGINAL: %s\n", (const char *)[v5 UTF8String]);
    fprintf(*v4, " SIMPLER: %s\n", (const char *)[v3 UTF8String]);
    fputc(10, *v4);
  }
}

LABEL_14:
      [*(id *)(a1 + 40) objectForKeyedSubscript:v7];
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (![v15 unsignedIntValue])
      {
        [@"non-object in zone " stringByAppendingString:v7];
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[VMUClassInfo classInfoWithClassName:binaryPath:type:]( &OBJC_CLASS___VMUClassInfo,  "classInfoWithClassName:binaryPath:type:",  v16,  @"<unknown>",  0LL);
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v17 setIsDerivedFromStackBacktrace:1];
        BOOL v18 = [*(id *)(a1 + 48) indexForClassInfo:v17];
        [MEMORY[0x189607968] numberWithUnsignedInt:v18];
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
        [*(id *)(a1 + 40) setObject:v19 forKeyedSubscript:v7];
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();

      goto LABEL_17;
    }

      ++v9;
    }

    while (v6 != v9);
    uint64_t v21 = [&unk_189E1D0F0 countByEnumeratingWithState:&v25 objects:v29 count:16];
    uint64_t v6 = v21;
  }

  while (v21);
LABEL_26:

  return v7 & 1;
}

  ++result[3];
  return result;
}

LABEL_10:
    if (![*(id *)(a1 + 32) usesCoreFile]
      || [*(id *)(a1 + 32) stackIDForNode:a2] != -1)
    {
      goto LABEL_12;
    }

    goto LABEL_14;
  }
  }

  uint64_t v19 = v5;
LABEL_15:

  return v19;
}

    __int128 v15 = 0LL;
    goto LABEL_11;
  }

  uint64_t v13 = VMUGetClassNameFromClassDataExtRW(v7, v9, a3, v12);
LABEL_9:
  __int128 v15 = (void *)v13;
LABEL_11:

  return v15;
}

    uint64_t v11 = 0LL;
    goto LABEL_13;
  }

  unint64_t v9 = _classDataRWV1ofClass(v7, v8, a4);
  if (!v9) {
    goto LABEL_10;
  }
  if ((*(_WORD *)(v9 + 2) & 0xC008) == 0) {
    goto LABEL_11;
  }
  uint64_t v10 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v7, *(void *)(v9 + 8));
  uint64_t v11 = v10;
  if ((v10 & 1) != 0)
  {
    id v12 = (uint64_t *)(*((uint64_t (**)(id, unint64_t, uint64_t))v8 + 2))( v8,  v10 & 0xFFFFFFFFFFFFFFFELL,  48LL);
    if (v12)
    {
      uint64_t v13 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v7, *v12);
LABEL_12:
      uint64_t v11 = v13;
      goto LABEL_13;
    }

    goto LABEL_10;
  }

  uint64_t v10 = (unsigned __int8 *)v1;
  if (v1[36])
  {
    uint64_t v4 = (void *)MEMORY[0x186E32E40]();
    VMUidentifyRegionTypeFromUserTag(v10[232], *((_DWORD *)v10 + 26), v10[50], *((_DWORD *)v10 + 6));
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ([v10 isUntaggedRegion])
    {
      [v10 setAsMallocRegion];
      id v5 = (__CFString *)(id)VMUmallocOtherRegionLabel;

      uint64_t v2 = v5;
    }

    uint64_t v6 = v10;
    if (!*((_DWORD *)v10 + 6) || v10[50] == 3) {
      goto LABEL_22;
    }
    if (*((_DWORD *)v10 + 36) != 4 && !v10[232] && *((_DWORD *)v10 + 26) == 1)
    {
      if (-[__CFString isEqualToString:](v2, "isEqualToString:", @"MALLOC metadata"))
      {

        uint64_t v2 = @"MALLOC";
      }

      uint64_t v6 = v10;
    }

    if (*((void *)v6 + 17)) {
      goto LABEL_22;
    }
    uint64_t v7 = *((_DWORD *)v6 + 36);
    if (v7 == 4)
    {
      int v8 = @"metadata";
    }

    else
    {
      if ((v7 & 2) == 0)
      {
LABEL_22:
        objc_autoreleasePoolPop(v4);
        goto LABEL_23;
      }

      int v8 = @"(empty)";
    }

    if ((-[__CFString hasSuffix:](v2, "hasSuffix:", v8) & 1) == 0)
    {
      unint64_t v9 = [NSString stringWithFormat:@"%@ %@", v2, v8];

      uint64_t v2 = (__CFString *)v9;
    }

    goto LABEL_22;
  }

      ++v6;
      ++v5;
    }

    while (v6 < self->wired_info_count);
  }

  if ((CSIsNull() & 1) == 0) {
    CSRelease();
  }

  return v23;
}

    CSSymbolicatorGetSymbolOwner();
LABEL_13:

    goto LABEL_14;
  }

  if (!strncmp(a2, "_swift_concurrency", 0x12uLL))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained vmuTask];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }

id VMUSimplifyCPlusPlusSymbolName(void *a1)
{
  id v1 = a1;
  _removeReturnValueFromCPlusPlusSymbolName(v1);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  _removeStdArgumentsFromCPlusPlusSymbolName(v2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  _printCPlusPlusNameSimplification(v1, v3);
  return v3;
}

unint64_t _lengthOfSubclauseInCPlusPlusSymbolName(void *a1, unint64_t a2, int a3, char a4)
{
  id v7 = a1;
  if ([v7 length] <= a2)
  {
LABEL_19:
    unint64_t v15 = 0LL;
    goto LABEL_20;
  }

  unint64_t v8 = 0LL;
  int v9 = 0;
  int v10 = a3 ^ 1;
  unint64_t v11 = a2;
  while (1)
  {
    int v12 = [v7 characterAtIndex:v11];
    if (v9) {
      int v13 = 0;
    }
    else {
      int v13 = v10;
    }
    if (v13 == 1 && v12 == 32)
    {
      int v9 = 0;
      unint64_t v8 = v11 + 1;
      goto LABEL_16;
    }

    if (!v9 && v12 == 40) {
      goto LABEL_17;
    }
    if (v12 != 62)
    {
      if (v12 == 60)
      {
        unint64_t v14 = v8;
        if (v8) {
          goto LABEL_28;
        }
        ++v9;
      }

      goto LABEL_16;
    }

    if (!--v9) {
      break;
    }
LABEL_16:
    if (++v11 >= [v7 length]) {
      goto LABEL_17;
    }
  }

  unint64_t v14 = v11 + 1;
  if (v14 < [v7 length] && objc_msgSend(v7, "characterAtIndex:", v14) == 32)
  {
    ++v14;
LABEL_28:
    unint64_t v15 = v14 - a2;
    goto LABEL_20;
  }

  if ((a4 & 1) == 0) {
    goto LABEL_28;
  }
LABEL_17:
  if (!v8) {
    goto LABEL_19;
  }
  unint64_t v15 = v8 - a2;
LABEL_20:

  return v15;
}

char *___printCPlusPlusNameSimplification_block_invoke()
{
  double result = getenv("DT_PRINT_NAME_SIMPLIFICATION");
  if (result)
  {
  }

  return result;
}

void sub_1860EECB0(_Unwind_Exception *a1)
{
}

void sub_1860EF09C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_1860F0488( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
}

uint64_t _parseAllocationSizeBound(const char **__endptr)
{
  char v2 = 10;
  uint64_t result = strtoll(*__endptr, (char **)__endptr, 10);
  int v4 = **__endptr & 0xDF;
  if (v4 != 75)
  {
    if (v4 != 77) {
      return result;
    }
    char v2 = 20;
  }

  result <<= v2;
  ++*__endptr;
  return result;
}

id VMUSanitizePath(void *a1)
{
  return a1;
}

void sub_1860F22C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1860F2460( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_1860F251C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1860F277C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, void *__p, uint64_t a26)
{
  _Block_object_dispose(&a19, 8);
  if (__p)
  {
    a26 = (uint64_t)__p;
    operator delete(__p);
  }

  _Block_object_dispose((const void *)(v28 - 136), 8);
  uint64_t v30 = *(void **)(v28 - 88);
  if (v30)
  {
    *(void *)(v28 - 80) = v30;
    operator delete(v30);
  }

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__3(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0LL;
  a1[3].n128_u64[1] = 0LL;
  a1[4].n128_u64[0] = 0LL;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0LL;
  a2[3].n128_u64[1] = 0LL;
  a2[4].n128_u64[0] = 0LL;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
  char v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }

__n128 __Block_byref_object_copy__11(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0LL;
  a1[3].n128_u64[1] = 0LL;
  a1[4].n128_u64[0] = 0LL;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0LL;
  a2[3].n128_u64[1] = 0LL;
  a2[4].n128_u64[0] = 0LL;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
  char v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }

void sub_1860F2DC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1860F2EC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_60:
        id v7 = v7;
        int v13 = v7;
        goto LABEL_61;
      }
    }

    else
    {
      if (!-[VMUTaskMemoryCache taskPort](memoryCache, "taskPort")) {
        goto LABEL_11;
      }
      int v12 = pid_for_task([(id)*p_memoryCache taskPort], &v7->_pid);
      if (!v12) {
        goto LABEL_11;
      }
      [(id)*p_memoryCache taskPort];
      mach_error_string(v12);
      CFLog();
    }
  }

    *MEMORY[0x1895FC2A0] = 0;
    -[NSMutableDictionary removeAllObjects](v53->_optionBlockByString, "removeAllObjects");
    free(v25);

    objc_autoreleasePoolPop(context);
    if (v43) {
      v49 = v43;
    }
    else {
      v49 = v21;
    }
    unint64_t v40 = v49;
  }

  else
  {
    objc_autoreleasePoolPop(v6);
    unint64_t v40 = 0LL;
  }

  return v40;
}

void sub_1860F3578( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id obj, uint64_t a14, uint64_t a15, void *a16, id location, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1860F3730( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
}

void sub_1860F3798( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

LABEL_20:
  if (self->_processNameNeedsCorrection || !-[NSString length](self->_processName, "length"))
  {
    -[VMUProcInfo name](v12, "name");
    unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_storeStrong((id *)&self->_processName, v15);
      self->_processNameNeedsCorrection = 0;
    }
  }

  return v28;
}

  return v10;
}

  [v3 appendString:@"  COPIED"];
  if ((a1 & 0x40) == 0)
  {
LABEL_8:
    if ((a1 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }

    uint64_t v19 = objc_alloc_init(MEMORY[0x189603FC8]);
    [*(id *)(a1 + 32) nodeDescription:a2];
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 setObject:v29 forKeyedSubscript:@"description"];

    goto LABEL_21;
  }

  if (a5 != 1) {
    goto LABEL_20;
  }
  *(void *)&v56 = a4;
  *(void *)&v57 = 1LL;
  BOOL v18 = objc_alloc_init(MEMORY[0x189603FC8]);
  uint64_t v19 = v18;
  if (v15)
  {
    [v15 className];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 setObject:v20 forKeyedSubscript:@"className"];

    [v15 binaryName];
    uint64_t v21 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = @"binary";
    goto LABEL_18;
  }

  [v18 setObject:@"non-object" forKeyedSubscript:@"className"];
  if (!v19) {
    goto LABEL_20;
  }
LABEL_21:
  v48 = v16;
  if (a8 != -1)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:a8];
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 setObject:v30 forKeyedSubscript:@"stackid"];
  }

  uint64_t v31 = 0LL;
  size_t v32 = stat_keys;
  do
  {
    if (*(void *)((char *)&v56 + v31))
    {
      [MEMORY[0x189607968] numberWithUnsignedLongLong:];
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 setObject:v33 forKeyedSubscript:*v32];
    }

    v31 += 8LL;
    v32 += 2;
  }

  while (v31 != 32);
  v47 = v19;
  v49 = v15;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obunint64_t j = v17;
  uint64_t v34 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v52;
    do
    {
      for (uint64_t i = 0LL; i != v35; ++i)
      {
        if (*(void *)v52 != v36) {
          objc_enumerationMutation(obj);
        }
        unint64_t v38 = 0LL;
        unint64_t v39 = 0LL;
        unint64_t v40 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        unint64_t v41 = off_189E00300;
        do
        {
          v42 = v39;
          [v40 objectForKeyedSubscript:*v41, v47, v48];
          unint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();

          if (v39) {
            *(void *)((char *)&v56 + v38) += [v39 unsignedLongLongValue];
          }
          v41 += 2;
          v38 += 8LL;
        }

        while (v38 != 32);
      }

      uint64_t v35 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
    }

    while (v35);
  }

  v43 = 0LL;
  v44 = off_189E00300;
  do
  {
    if (*(void *)((char *)&v56 + v43))
    {
      [MEMORY[0x189607968] numberWithUnsignedLongLong:];
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      [v47 setObject:v45 forKeyedSubscript:*v44];
    }

    v43 += 8LL;
    v44 += 2;
  }

  while (v43 != 32);
  [v47 setObject:obj forKeyedSubscript:@"children"];

  return v47;
}

LABEL_25:
}

            if (a2 == ++v11)
            {
              unint64_t v11 = a2;
              goto LABEL_33;
            }
          }
        }

        unint64_t v11 = 1LL;
LABEL_28:
        int v13 = v11 - 1;
        if (v11 == 1) {
          unint64_t v14 = v10;
        }
        else {
          unint64_t v14 = 1;
        }
        if ((v14 & 1) != 0)
        {
          if (v6)
          {
LABEL_33:
            if (a2 > 0x100 || v11 < v5)
            {
              unint64_t v15 = 0;
              __int128 v16 = 0;
              else {
                id v5 = 0LL;
              }
            }

            else
            {
              unint64_t v15 = 0;
              __int128 v16 = 1;
            }
          }

          else
          {
            if (a2 <= 0x100 && v13 >= v5) {
              BOOL v18 = v10;
            }
            else {
              BOOL v18 = 1;
            }
            if (v10) {
              uint64_t v19 = v11;
            }
            else {
              uint64_t v19 = 0LL;
            }
            uint64_t v20 = v18 == 1;
            if (v18 == 1) {
              uint64_t v21 = v10;
            }
            else {
              uint64_t v21 = 0;
            }
            uint64_t v22 = !v20;
            if (!v20) {
              uint64_t v19 = v5;
            }
            uint64_t v23 = v13 == v5;
            if (v13 == v5) {
              unint64_t v15 = 1;
            }
            else {
              unint64_t v15 = v21;
            }
            if (v23) {
              __int128 v16 = 1;
            }
            else {
              __int128 v16 = v22;
            }
            if (!v23) {
              id v5 = v19;
            }
          }
        }

        else
        {
LABEL_69:
          unint64_t v15 = 0;
          __int128 v16 = 0;
          id v5 = 0LL;
        }

        if (a2 < 0x11 || v5 >= 4)
        {
          a1 = 0LL;
          if ((v15 | v16) == 1 && v5)
          {
            if (v16) {
              ++v4;
            }
            a1 = (unsigned __int8 *)[objc_alloc(NSString) initWithBytesNoCopy:v4 length:v5 encoding:4 freeWhenDone:0];
            if (a3)
            {
              if (v16) {
                uint64_t v26 = 2;
              }
              else {
                uint64_t v26 = 1;
              }
              *a3 = v26;
            }
          }
        }

        else
        {
          a1 = 0LL;
        }
      }
    }
  }

  return a1;
}

  if (a4) {
LABEL_26:
  }
    *a4 = v16;
LABEL_27:

  return v19;
}

      if (++v16 == v5) {
        goto LABEL_28;
      }
    }

    [v8 peekAtAddress:v40[24] + 48 size:16 * *((unsigned int *)v39 + 1) returnsBuf:&v38];
    uint64_t v26 = v39;
    if (*((_DWORD *)v39 + 1))
    {
      uint64_t v27 = 0LL;
      uint64_t v28 = 0LL;
      do
      {
        if (*(void *)(v38 + v27))
        {
          uint64_t v29 = btref_decode_unslide(v8, *(_DWORD *)(v38 + v27 + 12) & 0xFFFFFFC0, v43, v41, v15);
          if ((_DWORD)v29)
          {
            vmu_enter_stack_in_backtrace_uniquing_table( (uint64_t)self->_backtraceUniquingTable,  (uint64_t)&v37,  (uint64_t)v43,  v29,  v30);
            uint64_t v31 = objc_loadWeakRetained((id *)&self->_graph);
            size_t v32 = [v31 nodeForAddress:~*(void *)(v38 + v27)];

            if (v32 != -1)
            {
              self->_nodeToStackIndexTable[v32] = v37;
              uint64_t v36 = 1;
            }
          }

          uint64_t v26 = v39;
        }

        ++v28;
        v27 += 16LL;
      }

      while (v28 < *((unsigned int *)v26 + 1));
    }

    goto LABEL_24;
  }

  uint64_t v36 = 0;
LABEL_28:

  return v36 & 1;
}

void sub_1860F3A04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_64:
                  ;
                }
              }

              for (; v44 < (int)v29; v44 += v53)
              {
                if (*v40)
                {
                  v47 = (void *)[objc_alloc(MEMORY[0x1896NSStringes:v40 length:strnlen(v40, (int)v29 - v44) encoding:4];
                  v48 = [v47 rangeOfString:@"="];
                  if ([v47 length]) {
                    v49 = v48 == 0x7FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    v49 = 1;
                  }
                  if (!v49)
                  {
                    [v47 substringToIndex:v48];
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    [v47 substringFromIndex:v48 + 1];
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_environment,  "setObject:forKeyedSubscript:",  v51,  v50);
                  }

                  v52 = [v47 length];

                  v53 = v52 + 1;
                  v40 += v52 + 1;
                }

                else
                {
                  ++v40;
                  v53 = 1;
                }
              }

              break;
            }
          }
        }
      }
    }
  }

void sub_1860F42B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void small_objc_portable_task_crash_info_t::~small_objc_portable_task_crash_info_t(id *this)
{
}

void sub_1860F46B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1860F4ADC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1860F4BF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1860F4D18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1860F4DE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1860F5354( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

uint64_t _compareBinaryImageDicts(objc_object *a1, objc_object *a2, void *a3)
{
  int v4 = a2;
  -[objc_object objectForKey:](a1, "objectForKey:", @"StartAddress");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v6 = [v5 unsignedLongLongValue];

  -[objc_object objectForKey:](v4, "objectForKey:", @"StartAddress");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v8 = [v7 unsignedLongLongValue];

  uint64_t v9 = 1LL;
  if (v6 <= v8) {
    uint64_t v9 = -1LL;
  }
  if (v6 == v8) {
    uint64_t v10 = 0LL;
  }
  else {
    uint64_t v10 = v9;
  }

  return v10;
}

void sub_1860F54BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1860F55C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1860F580C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1860F5DF4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, void *a21)
{
  _Unwind_Resume(a1);
}

LABEL_30:
    uint64_t v37 = 0LL;
    goto LABEL_31;
  }

  unint64_t v6 = [MEMORY[0x189603F18] arrayWithObject:v5];

  size_t v32 = (void *)v6;
LABEL_6:
  id v7 = objc_alloc_init(&OBJC_CLASS___VMURangeArray);
  uint64_t v37 = objc_alloc_init(&OBJC_CLASS___VMURangeArray);
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obunint64_t j = v33;
  unint64_t v8 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v43;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v43 != v9) {
          objc_enumerationMutation(obj);
        }
        unint64_t v11 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        [v11 objectForKey:@"StartAddress"];
        int v12 = (void *)objc_claimAutoreleasedReturnValue();
        int v13 = v12;
        if (v12)
        {
          unint64_t v14 = [v12 unsignedLongLongValue];
          [v11 objectForKey:@"Size"];
          unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
          __int128 v16 = [v15 unsignedLongLongValue];

          -[VMURangeArray addRange:](v7, "addRange:", v14, v16);
        }
      }

      unint64_t v8 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
    }

    while (v8);
  }

  unint64_t v40 = 0u;
  unint64_t v41 = 0u;
  unint64_t v38 = 0u;
  unint64_t v39 = 0u;
  obja = v32;
  __int128 v17 = [obja countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v17)
  {
    BOOL v18 = *(void *)v39;
    do
    {
      uint64_t v19 = 0LL;
      uint64_t v34 = v17;
      do
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(obja);
        }
        uint64_t v20 = *(void **)(*((void *)&v38 + 1) + 8 * v19);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          uint64_t v21 = v20;
          uint64_t v22 = (uint64_t *)[v21 backtrace];
          uint64_t v23 = [v21 backtraceLength];
          uint64_t v24 = v18;
          if (v23)
          {
            uint64_t v25 = v23;
            do
            {
              uint64_t v26 = *v22++;
              uint64_t v27 = -[VMURangeArray indexForLocation:](v7, "indexForLocation:", v26);
              if (v27 != 0x7FFFFFFFFFFFFFFFLL)
              {
                uint64_t v28 = -[VMURangeArray rangeAtIndex:](v7, "rangeAtIndex:", v27);
                uint64_t v30 = v29;
                -[VMURangeArray removeRangeAtIndex:](v7, "removeRangeAtIndex:", v27);
                -[VMURangeArray addRange:](v37, "addRange:", v28, v30);
              }

              --v25;
            }

            while (v25);
          }

          BOOL v18 = v24;
          __int128 v17 = v34;
        }

        ++v19;
      }

      while (v19 != v17);
      __int128 v17 = [obja countByEnumeratingWithState:&v38 objects:v46 count:16];
    }

    while (v17);
  }

  id v5 = obja;
LABEL_31:

  return v37;
}

    v4 += 288LL;
    if (v4 >= *((void *)a1 + 6) + 288LL * a1[14]) {
      return 0LL;
    }
  }

  sizeofcmds = v5->sizeofcmds;
  unint64_t v8 = (void (*)(void, const mach_header_64 *, void))*((void *)a1 + 2);
  if (v8) {
    v8(*(void *)a1, v5, v41[0]);
  }
  id v5 = (const mach_header_64 *)(*((uint64_t (**)(void, unint64_t, uint64_t, void *))a1 + 3))( *(void *)a1,  a2,  sizeofcmds,  v41);
  if (!v5) {
    goto LABEL_29;
  }
  uint64_t v9 = v5;
  uint64_t v10 = getsegmentdata(v5, "__TEXT", &size);
  unint64_t v11 = (void (*)(void, const mach_header_64 *, void))*((void *)a1 + 2);
  if (v11) {
    v11(*(void *)a1, v9, v41[0]);
  }
  if (!v10) {
    goto LABEL_30;
  }
  id v5 = (const mach_header_64 *)(*((uint64_t (**)(void, unint64_t, unint64_t, void *))a1 + 3))( *(void *)a1,  a2,  v10 - (uint8_t *)v9 + size,  v41);
  if (!v5) {
    goto LABEL_29;
  }
  int v12 = v5;
  int v13 = getsectiondata(v5, "__TEXT", "__swift3_fieldmd", v39);
  unint64_t v14 = &v13[v39[0]];
  if (!v13) {
    unint64_t v14 = 0LL;
  }
  unint64_t v38 = (unint64_t)v14;
  unint64_t v15 = getsectiondata(v12, "__TEXT", "__swift3_assocty", v39);
  __int128 v16 = &v15[v39[0]];
  if (!v15) {
    __int128 v16 = 0LL;
  }
  uint64_t v37 = (unint64_t)v16;
  __int128 v17 = getsectiondata(v12, "__TEXT", "__swift3_builtin", v39);
  BOOL v18 = &v17[v39[0]];
  if (!v17) {
    BOOL v18 = 0LL;
  }
  uint64_t v36 = (unint64_t)v18;
  uint64_t v19 = getsectiondata(v12, "__TEXT", "__swift3_capture", v39);
  uint64_t v20 = &v19[v39[0]];
  if (!v19) {
    uint64_t v20 = 0LL;
  }
  uint64_t v35 = (unint64_t)v20;
  uint64_t v21 = getsectiondata(v12, "__TEXT", "__swift3_typeref", v39);
  uint64_t v22 = &v21[v39[0]];
  if (!v21) {
    uint64_t v22 = 0LL;
  }
  uint64_t v34 = (unint64_t)v22;
  uint64_t v23 = getsectiondata(v12, "__TEXT", "__swift3_reflstr", v39);
  if (!v23)
  {
    uint64_t v24 = 0LL;
    if (v21 || v19 || v17 || v15 || v13) {
      goto LABEL_25;
    }
    uint64_t v30 = (void (*)(uint64_t, const mach_header_64 *, uint64_t))*((void *)a1 + 2);
    if (v30)
    {
      uint64_t v31 = *(void *)a1;
      size_t v32 = v41[0];
      unint64_t v6 = v12;
      goto LABEL_34;
    }

    goto LABEL_30;
  }

  uint64_t v24 = (unint64_t)&v23[v39[0]];
LABEL_25:
  uint64_t v25 = *(void (**)(uint64_t, unint64_t *))(v4 + 64);
  uint64_t v26 = *(void *)v4;
  v39[0] = (unint64_t)v13;
  v39[1] = v38;
  v39[2] = (unint64_t)v15;
  v39[3] = v37;
  v39[4] = (unint64_t)v17;
  v39[5] = v36;
  v39[6] = (unint64_t)v19;
  v39[7] = v35;
  v39[8] = (unint64_t)v21;
  v39[9] = v34;
  v39[10] = (unint64_t)v23;
  v39[11] = v24;
  v39[12] = (unint64_t)v12;
  v39[13] = a2;
  v25(v26, v39);
  uint64_t v27 = getsegmentdata(v12, "__DATA", v39);
  uint64_t v28 = malloc(0x18uLL);
  *uint64_t v28 = *((void *)a1 + 9);
  v28[1] = a2;
  v28[2] = &v27[a2 - (void)v12 + v39[0]];
  *((void *)a1 + 9) = v28;
  if (*((void *)a1 + 2))
  {
    uint64_t v29 = malloc(0x18uLL);
    void *v29 = *((void *)a1 + 8);
    v29[1] = v12;
    void v29[2] = v41[0];
    *((void *)a1 + _Block_object_dispose((const void *)(v26 - 120), 8) = v29;
  }

  return 1LL;
}

            unint64_t v15 = v28;
LABEL_31:
            uint64_t v19 = v27;
            a4 = v26;
            a3 = v43;
            continue;
          }
        }

        else
        {
          uint64_t v21 = v30;
        }

        uint64_t v20 = v29;
        goto LABEL_30;
      }
    }

    __int128 v17 = [v15 countByEnumeratingWithState:&v44 objects:v52 count:16];
  }

  while (v17);
LABEL_37:

  unint64_t v14 = v40;
  adjustOwnedMemoryRegionFootprint(v40, v42);
  if (v14[23] + v14[22])
  {
    uint64_t v37 = 0LL;
  }

  else
  {
    --*v39;
    unint64_t v14 = v40;
    uint64_t v37 = v14;
  }

  id v7 = v41;
LABEL_41:

  return v37;
}
}

  uint64_t v25 = v10[1] + a3;
  *uint64_t v10 = v14 + a4;
  v10[1] = v25;
  uint64_t v26 = v12[1] + a3;
  *v12 += a4;
  v12[1] = v26;

  objc_autoreleasePoolPop(v8);
}

      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
    }

    while (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) < *(_DWORD *)(a1 + 64));
  }

  if ([*(id *)(*(void *)(a1 + 32) + 8) separateByZone]
    && *((_DWORD *)v3 + 37) < *(_DWORD *)(a1 + 68))
  {
    [*(id *)(*(void *)(a1 + 32) + 32) objectAtIndexedSubscript:];
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 incrementVirtualSize:v3[2]];
  }
}

void sub_1860F6214( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1860F6340(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1860F63C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1860F64F4(_Unwind_Exception *a1)
{
  int v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1860F65B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1860F66A8(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1860F6A54( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, void *a21, uint64_t a22, uint64_t a23, void *a24, uint64_t a25, void *a26, int a27, uint64_t a28, void *a29)
{
  if (v32) {

  }
  if (v34)
  {
  }

  if (v30) {
  if (a23)
  }

  if (a25) {
  if (a27)
  }

  if (a28) {
  _Unwind_Resume(a1);
  }
}

void sub_1860F6B80()
{
}

void sub_1860F6C88(_Unwind_Exception *a1)
{
  id v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1860F6F20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1860F6FD4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)&OBJC_CLASS___VMUProcessDescription;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<_CSBinaryRelocationInformation>>( uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667LL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(40 * a2);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<_CSBinaryImageInformation>>( uint64_t a1, unint64_t a2)
{
  if (a2 >> 58) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(a2 << 6);
}

id VMUOptionParserError( int a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v17[1] = *MEMORY[0x1895F89C0];
  id v10 = a2;
  if (v10)
  {
    uint64_t v11 = [objc_alloc(NSString) initWithFormat:v10 arguments:&a9];
    int v12 = (void *)v11;
    if (v11)
    {
      uint64_t v16 = *MEMORY[0x1896075E0];
      v17[0] = v11;
      [MEMORY[0x189603F68] dictionaryWithObjects:v17 forKeys:&v16 count:1];
      int v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      int v13 = 0LL;
    }
  }

  else
  {
    int v13 = 0LL;
    int v12 = 0LL;
  }

  [MEMORY[0x189607870] errorWithDomain:@"VMUOptionParserDomain" code:a1 userInfo:v13];
  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void _arrayFreeValue(int a1, void *a2)
{
  if (a2) {
    free(a2);
  }
}

LABEL_42:
  objc_autoreleasePoolPop(context);
}

    unint64_t v41 = 0LL;
    goto LABEL_43;
  }

        if ((char)v6 > 92)
        {
          switch(v6)
          {
            case ']':
              goto LABEL_71;
            case '^':
              ++v7;
              goto LABEL_71;
            case 'b':
              if (!a2) {
                goto LABEL_71;
              }
              uint64_t v21 = v5;
              uint64_t v22 = @"bitfield:";
              break;
            case 'c':
              if (!a2) {
                goto LABEL_71;
              }
              uint64_t v21 = v5;
              uint64_t v22 = @"char";
              break;
            case 'd':
              if (!a2) {
                goto LABEL_71;
              }
              uint64_t v21 = v5;
              uint64_t v22 = @"double";
              break;
            case 'f':
              if (!a2) {
                goto LABEL_71;
              }
              uint64_t v21 = v5;
              uint64_t v22 = @"float";
              break;
            case 'i':
              if (!a2) {
                goto LABEL_71;
              }
              uint64_t v21 = v5;
              uint64_t v22 = @"int32_t";
              break;
            case 'l':
              if (!a2) {
                goto LABEL_71;
              }
              uint64_t v21 = v5;
              uint64_t v22 = @"long";
              break;
            case 'q':
              if (!a2) {
                goto LABEL_71;
              }
              uint64_t v21 = v5;
              uint64_t v22 = @"int64_t";
              break;
            case 'r':
              if (!a2) {
                goto LABEL_71;
              }
              uint64_t v21 = v5;
              uint64_t v22 = @"const ";
              break;
            case 's':
              if (!a2) {
                goto LABEL_71;
              }
              uint64_t v21 = v5;
              uint64_t v22 = @"short";
              break;
            case 'v':
              if (!a2) {
                goto LABEL_71;
              }
              uint64_t v21 = v5;
              uint64_t v22 = @"void";
              break;
            default:
              goto LABEL_105;
          }
        }

        else if ((char)v6 <= 57)
        {
          switch(v6)
          {
            case '#':
              if (!a2) {
                goto LABEL_71;
              }
              uint64_t v21 = v5;
              uint64_t v22 = @"Class";
              break;
            case '%':
              if (!a2) {
                goto LABEL_71;
              }
              uint64_t v21 = v5;
              uint64_t v22 = @"atomic ";
              break;
            case '*':
              if (!a2) {
                goto LABEL_71;
              }
              uint64_t v21 = v5;
              uint64_t v22 = @"char*";
              break;
            default:
LABEL_105:
              if (a2) {
                [v5 appendFormat:@"%c", (char)v6];
              }
              goto LABEL_71;
          }
        }

        else
        {
          switch(v6)
          {
            case '?':
              if (!a2) {
                goto LABEL_71;
              }
              uint64_t v21 = v5;
              uint64_t v22 = @"?";
              break;
            case '@':
              if (!a2) {
                goto LABEL_71;
              }
              uint64_t v21 = v5;
              uint64_t v22 = @"id";
              break;
            case 'A':
              if (!a2) {
                goto LABEL_71;
              }
              uint64_t v21 = v5;
              uint64_t v22 = @"_Atomic ";
              break;
            case 'B':
              if (!a2) {
                goto LABEL_71;
              }
              uint64_t v21 = v5;
              uint64_t v22 = @"BOOL";
              break;
            case 'C':
              if (!a2) {
                goto LABEL_71;
              }
              uint64_t v21 = v5;
              uint64_t v22 = @"unsigned char";
              break;
            case 'D':
            case 'E':
            case 'F':
            case 'G':
            case 'H':
            case 'J':
            case 'K':
            case 'M':
            case 'N':
            case 'O':
            case 'P':
            case 'R':
              goto LABEL_105;
            case 'I':
              if (!a2) {
                goto LABEL_71;
              }
              uint64_t v21 = v5;
              uint64_t v22 = @"uint32_t";
              break;
            case 'L':
              if (!a2) {
                goto LABEL_71;
              }
              uint64_t v21 = v5;
              uint64_t v22 = @"ulong";
              break;
            case 'Q':
              if (!a2) {
                goto LABEL_71;
              }
              uint64_t v21 = v5;
              uint64_t v22 = @"uint64_t";
              break;
            case 'S':
              if (!a2) {
                goto LABEL_71;
              }
              uint64_t v21 = v5;
              uint64_t v22 = @"ushort";
              break;
            default:
              if (v6 != 58) {
                goto LABEL_105;
              }
              if (!a2) {
                goto LABEL_71;
              }
              uint64_t v21 = v5;
              uint64_t v22 = @"SEL";
              break;
          }
        }

        [v21 appendString:v22];
        goto LABEL_71;
      }

      uint64_t v11 = a1 + 1;
      int v12 = 1;
      ++a1;
      while (1)
      {
        int v13 = *a1;
        unint64_t v14 = 1;
        if (v13 > 0x7A) {
          break;
        }
        if (v13 == 40) {
          goto LABEL_26;
        }
        if (v13 == 41) {
          goto LABEL_25;
        }
        if (!*a1) {
          goto LABEL_28;
        }
LABEL_27:
        ++a1;
      }

      if (v13 != 123)
      {
        if (v13 != 125) {
          goto LABEL_27;
        }
LABEL_25:
        unint64_t v14 = -1;
      }

void VMUOptionParserRegisterFlag(void *a1, uint64_t a2, int a3, uint64_t a4, void *a5)
{
  id v9 = a1;
  id v10 = a5;
  if (!v10) {
    goto LABEL_16;
  }
  if (a2)
  {
    [NSString stringWithUTF8String:a2];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3) {
      goto LABEL_4;
    }
LABEL_7:
    int v12 = 0LL;
    if (a4) {
      goto LABEL_5;
    }
LABEL_8:
    int v13 = 0LL;
    goto LABEL_9;
  }

  uint64_t v11 = 0LL;
  if (!a3) {
    goto LABEL_7;
  }
LABEL_4:
  [MEMORY[0x189NSStringormat:@"%c" a3];
  int v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a4) {
    goto LABEL_8;
  }
LABEL_5:
  [NSString stringWithUTF8String:a4];
  int v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __VMUOptionParserRegisterFlag_block_invoke;
  v14[3] = &unk_189DFDCC0;
  id v15 = v10;
  [v9 registerOptionWithLongName:v11 shortName:v12 argumentKind:0 argumentName:0 optionDescription:v13 handler:v14];
  if (a4) {

  }
  if (a3) {
  if (a2)
  }

LABEL_16:
}

uint64_t __VMUOptionParserRegisterFlag_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void VMUOptionParserRegisterFlagInternal(void *a1, uint64_t a2, int a3, uint64_t a4, void *a5)
{
  id v9 = a1;
  id v10 = a5;
  if (!v10) {
    goto LABEL_16;
  }
  if (a2)
  {
    [NSString stringWithUTF8String:a2];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3) {
      goto LABEL_4;
    }
LABEL_7:
    int v12 = 0LL;
    if (a4) {
      goto LABEL_5;
    }
LABEL_8:
    int v13 = 0LL;
    goto LABEL_9;
  }

  uint64_t v11 = 0LL;
  if (!a3) {
    goto LABEL_7;
  }
LABEL_4:
  [MEMORY[0x189NSStringormat:@"%c" a3];
  int v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a4) {
    goto LABEL_8;
  }
LABEL_5:
  [NSString stringWithUTF8String:a4];
  int v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __VMUOptionParserRegisterFlagInternal_block_invoke;
  v14[3] = &unk_189DFDCC0;
  id v15 = v10;
  [v9 registerOptionWithLongName:v11 shortName:v12 argumentKind:0 argumentName:0 optionDescription:v13 flags:1 handler:v14];
  if (a4) {

  }
  if (a3) {
  if (a2)
  }

LABEL_16:
}

uint64_t __VMUOptionParserRegisterFlagInternal_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void VMUSetCrashReporterInfo(void *a1)
{
  id v2 = a1;
  if (v2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&crashreporterInfoLock);
    objc_storeStrong((id *)&gVMUCrashLogMessage, a1);
    qword_18C4A17C0 = [(id)gVMUCrashLogMessage UTF8String];
    os_unfair_lock_unlock((os_unfair_lock_t)&crashreporterInfoLock);
  }

  else
  {
    VMUClearCrashReporterInfo();
  }
}

void VMUClearCrashReporterInfo()
{
  if (gVMUCrashLogMessage)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&crashreporterInfoLock);
    qword_18C4A17C0 = 0LL;
    dispatch_queue_t v0 = (void *)gVMUCrashLogMessage;
    gVMUCrashLogMessage = 0LL;

    os_unfair_lock_unlock((os_unfair_lock_t)&crashreporterInfoLock);
  }

void *vmu_swift_reflection_createReflectionContext( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v12 = calloc(0x58uLL, 1uLL);
  void *v12 = a1;
  v12[1] = a2;
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = a5;
  v12[5] = a6;
  v12[10] = CFDictionaryCreateMutable(0LL, 0LL, 0LL, 0LL);
  return v12;
}

uint64_t vmu_swift_reflection_interop_addLibrary(void *a1, void *a2)
{
  int v4 = (char *)realloc((void *)a1[6], 288LL * *((int *)a1 + 14) + 288);
  a1[6] = v4;
  if (!a2) {
    return 0LL;
  }
  id v5 = v4;
  int v6 = *((_DWORD *)a1 + 14);
  id v7 = &v4[288 * v6];
  *((void *)v7 + 1) = dlsym(a2, "swift_reflection_classIsSwiftMask");
  uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_getSupportedMetadataVersion");
  *((void *)v7 + 2) = result;
  if (!result) {
    return result;
  }
  id v9 = dlsym(a2, "swift_reflection_addImage");
  BOOL v10 = v9 == 0LL;
  uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_createReflectionContext");
  uint64_t v11 = &v5[288 * v6];
  if (v9)
  {
    *((void *)v11 + 3) = result;
    if (!result) {
      return result;
    }
    uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_addReflectionInfo");
    *(void *)&v5[288 * v6 + 56] = result;
    if (!result) {
      return result;
    }
    uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_addImage");
    *(void *)&v5[288 * v6 + 72] = result;
    if (!result) {
      return result;
    }
    uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_ownsObject");
    *(void *)&v5[288 * v6 + 96] = result;
    if (!result) {
      return result;
    }
    uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_ownsAddress");
    *(void *)&v5[288 * v6 + 104] = result;
    if (!result) {
      return result;
    }
    uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_metadataForObject");
    *(void *)&v5[288 * v6 + 112] = result;
    if (!result) {
      return result;
    }
    *(void *)&v5[288 * v6 + 32] = dlsym(a2, "swift_reflection_createReflectionContextWithDataLayout");
  }

  else
  {
    *((void *)v11 + 5) = result;
    if (!result) {
      return result;
    }
    uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_addReflectionInfo");
    *(void *)&v5[288 * v6 + 64] = result;
    if (!result) {
      return result;
    }
  }

  uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_destroyReflectionContext");
  *(void *)&v5[288 * v6 + 48] = result;
  if (result)
  {
    uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_readIsaMask");
    *(void *)&v5[288 * v6 + 80] = result;
    if (result)
    {
      uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_typeRefForMetadata");
      *(void *)&v5[288 * v6 + 88] = result;
      if (result)
      {
        uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_typeRefForInstance");
        *(void *)&v5[288 * v6 + 120] = result;
        if (result)
        {
          uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_typeRefForMangledTypeName");
          *(void *)&v5[288 * v6 + 128] = result;
          if (result)
          {
            int v12 = &v5[288 * v6];
            *((void *)v12 + 17) = dlsym(a2, "swift_reflection_copyDemangledNameForTypeRef");
            uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_infoForTypeRef");
            *((void *)v12 + 20) = result;
            if (result)
            {
              uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_childOfTypeRef");
              *(void *)&v5[288 * v6 + 168] = result;
              if (result)
              {
                uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_infoForMetadata");
                *(void *)&v5[288 * v6 + 176] = result;
                if (result)
                {
                  uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_childOfMetadata");
                  *(void *)&v5[288 * v6 + 184] = result;
                  if (result)
                  {
                    uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_infoForInstance");
                    *(void *)&v5[288 * v6 + 192] = result;
                    if (result)
                    {
                      uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_childOfInstance");
                      *(void *)&v5[288 * v6 + 200] = result;
                      if (result)
                      {
                        uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_genericArgumentCountOfTypeRef");
                        *(void *)&v5[288 * v6 + 208] = result;
                        if (result)
                        {
                          uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_genericArgumentOfTypeRef");
                          *(void *)&v5[288 * v6 + 216] = result;
                          if (result)
                          {
                            uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_projectExistential");
                            *(void *)&v5[288 * v6 + 224] = result;
                            if (result)
                            {
                              int v13 = &v5[288 * v6];
                              *((void *)v13 + 29) = dlsym(a2, "swift_reflection_projectEnumValue");
                              *((void *)v13 + 1_Block_object_dispose((const void *)(v26 - 120), 8) = dlsym(a2, "swift_reflection_asyncTaskSlabPointer");
                              *((void *)v13 + 19) = dlsym(a2, "swift_reflection_asyncTaskSlabAllocations");
                              uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_dumpTypeRef");
                              *((void *)v13 + 30) = result;
                              if (result)
                              {
                                uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_dumpInfoForTypeRef");
                                *(void *)&v5[288 * v6 + 248] = result;
                                if (result)
                                {
                                  uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_dumpInfoForInstance");
                                  *(void *)&v5[288 * v6 + 264] = result;
                                  if (result)
                                  {
                                    uint64_t result = (uint64_t)dlsym(a2, "swift_reflection_dumpInfoForMetadata");
                                    *(void *)&v5[288 * v6 + 256] = result;
                                    if (result)
                                    {
                                      *(_DWORD *)&v5[288 * v6 + 280] = v10;
                                      int v14 = *((_DWORD *)a1 + 14);
                                      *((_DWORD *)a1 + 14) = v14 + 1;
                                      uint64_t v15 = a1[6];
                                      uint64_t v16 = v15 + 288LL * v14;
                                      if (*(_DWORD *)(v16 + 280))
                                      {
                                        uint64_t v17 = (*(uint64_t (**)(void *, uint64_t (*)(), uint64_t (*)(), uint64_t (*)(void *, uint64_t, void *, size_t), uint64_t (*)(uint64_t), uint64_t (*)(uint64_t)))(v15 + 288LL * v14 + 40))( a1,  swift_reflection_interop_getSizeAdapter,  swift_reflection_interop_getSizeAdapter,  swift_reflection_interop_readBytesAdapter,  swift_reflection_interop_GetStringLengthAdapter,  swift_reflection_interop_GetSymbolAddressAdapter);
                                      }

                                      else
                                      {
                                        BOOL v18 = *(uint64_t (**)(void, void, void, void, void, void))(v15 + 288LL * v14 + 32);
                                        if (v18)
                                        {
                                          uint64_t v17 = v18(*a1, a1[1], a1[2], a1[3], a1[4], a1[5]);
                                        }

                                        else
                                        {
                                          if (!((unsigned int (*)(void, void, void, unsigned __int8 *))a1[1])( *a1,  0LL,  0LL,  &v19)) {
                                            abort();
                                          }
                                          uint64_t v17 = (*(uint64_t (**)(void, void, void, void, void, void))(v15 + 288LL * v14 + 24))( *a1,  v19,  a1[2],  a1[3],  a1[4],  a1[5]);
                                        }
                                      }

                                      *(void *)uint64_t v16 = v17;
                                      return 1LL;
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return result;
}

void vmu_swift_reflection_destroyReflectionContext(int *a1)
{
  id v2 = (void *)*((void *)a1 + 6);
  if (a1[14] >= 1)
  {
    do
    {
      ((void (*)(void))v2[6])(*v2);
      v2 += 36;
    }

    while ((unint64_t)v2 < *((void *)a1 + 6) + 288LL * a1[14]);
    id v2 = (void *)*((void *)a1 + 6);
  }

  free(v2);
  id v3 = (void *)*((void *)a1 + 9);
  if (v3)
  {
    do
    {
      int v4 = (void *)*v3;
      free(v3);
      id v3 = v4;
    }

    while (v4);
  }

  id v5 = (void *)*((void *)a1 + 8);
  if (v5)
  {
    do
    {
      (*((void (**)(void, void, void))a1 + 2))(*(void *)a1, v5[1], v5[2]);
      int v6 = (void *)*v5;
      free(v5);
      id v5 = v6;
    }

    while (v6);
  }

  CFRelease(*((CFTypeRef *)a1 + 10));
  free(a1);
}

uint64_t vmu_swift_reflection_addImage(int *a1, unint64_t a2)
{
  if (a1[14] < 1) {
    return 0LL;
  }
  unint64_t v4 = *((void *)a1 + 6);
  while (1)
  {
    if (!*(_DWORD *)(v4 + 280))
    {
      LODWORD(v5) = (*(uint64_t (**)(void, unint64_t))(v4 + 72))(*(void *)v4, a2);
LABEL_29:
      if ((_DWORD)v5) {
        return 1LL;
      }
      goto LABEL_30;
    }

    id v5 = (const mach_header_64 *)(*((uint64_t (**)(void, unint64_t, uint64_t, void *))a1 + 3))( *(void *)a1,  a2,  32LL,  v41);
    if (!v5) {
      goto LABEL_29;
    }
    int v6 = v5;
    if (v5->magic >> 1 == 2138504551) {
      break;
    }
    uint64_t v30 = (void (*)(uint64_t, const mach_header_64 *, uint64_t))*((void *)a1 + 2);
    if (v30)
    {
      uint64_t v31 = *(void *)a1;
      uint64_t v32 = v41[0];
LABEL_34:
      v30(v31, v6, v32);
    }

uint64_t vmu_swift_reflection_interop_typeRefForMetadata(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = *(void *)(a1 + 48) + 288LL * a3;
  return (*(uint64_t (**)(void))(v3 + 88))(*(void *)v3);
}

uint64_t vmu_swift_reflection_interop_metadataForObject(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a1 + 56);
  if (v2 >= 1)
  {
    unint64_t v5 = *(void *)(a1 + 48);
    unint64_t v6 = v5;
    do
    {
      if (!*(_DWORD *)(v6 + 280))
      {
        uint64_t result = (*(uint64_t (**)(void, uint64_t))(v6 + 112))(*(void *)v6, a2);
        if (result) {
          return result;
        }
        unint64_t v5 = *(void *)(a1 + 48);
        int v2 = *(_DWORD *)(a1 + 56);
      }

      v6 += 288LL;
    }

    while (v6 < v5 + 288LL * v2);
  }

  return 0LL;
}

char *vmu_swift_reflection_interop_copyDemangledNameForTypeRef(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = *(void *)(a1 + 48);
  unint64_t v4 = *(uint64_t (**)(void))(v3 + 288LL * a3 + 136);
  if (v4)
  {
    unint64_t v5 = (char *)v4(*(void *)(v3 + 288LL * a3));
    if (v5) {
      unint64_t v5 = (char *)[objc_alloc(NSString) initWithBytesNoCopy:v5 length:strlen(v5) encoding:4 freeWhenDone:1];
    }
  }

  else
  {
    unint64_t v5 = 0LL;
  }

  return v5;
}

uint64_t vmu_swift_reflection_infoForTypeRef(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = *(void *)(a1 + 48) + 288LL * a3;
  return (*(uint64_t (**)(void))(v3 + 160))(*(void *)v3);
}

double vmu_swift_reflection_childOfTypeRef@<D0>( uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v7 = *(void *)(a1 + 48) + 288LL * a3;
  (*(void (**)(uint64_t *__return_ptr, void, uint64_t, uint64_t))(v7 + 168))(&v9, *(void *)v7, a2, a4);
  *(void *)a5 = v9;
  double result = v10;
  *(double *)(a5 + _Block_object_dispose((const void *)(v26 - 120), 8) = v10;
  *(void *)(a5 + 16) = v11;
  *(_DWORD *)(a5 + 24) = a3;
  return result;
}

const void *vmu_swift_reflection_interop_lookupMetadata(uint64_t a1, const void *a2)
{
  int v2 = a2;
  if (CFDictionaryGetValueIfPresent(*(CFDictionaryRef *)(a1 + 80), a2, (const void **)&value))
  {
    if (*(void *)(a1 + 48) + 288LL * (void)value) {
      return v2;
    }
    return 0LL;
  }

  int v4 = *(_DWORD *)(a1 + 56);
  if (v4 < 1) {
    return 0LL;
  }
  unint64_t v5 = *(void *)(a1 + 48);
  unint64_t v6 = v5;
  while (!*(_DWORD *)(v6 + 280))
  {
    int v8 = (*(uint64_t (**)(void, const void *))(v6 + 104))(*(void *)v6, v2);
    unint64_t v5 = *(void *)(a1 + 48);
    if (v8) {
      goto LABEL_16;
    }
    int v4 = *(_DWORD *)(a1 + 56);
LABEL_14:
    v6 += 288LL;
    if (v6 >= v5 + 288LL * v4) {
      return 0LL;
    }
  }

  uint64_t v7 = *(void **)(a1 + 72);
  if (!v7) {
    goto LABEL_14;
  }
  while (v7[1] > (unint64_t)v2 || v7[2] <= (unint64_t)v2)
  {
    uint64_t v7 = (void *)*v7;
    if (!v7) {
      goto LABEL_14;
    }
  }

LABEL_16:
  CFDictionarySetValue( *(CFMutableDictionaryRef *)(a1 + 80),  v2,  (const void *)(0x8E38E38E38E38E39LL * ((uint64_t)(v6 - v5) >> 5)));
  if (!v6) {
    return 0LL;
  }
  return v2;
}

    uint64_t v20 = malloc(0x10uLL);
    *(_DWORD *)uint64_t v20 = a2;
    v20[1] = uniquing_table_index;
    NSMapInsert(*(NSMapTable **)(a1 + 48), *a3, v20);
LABEL_17:
    *a5 = *(_DWORD *)(a1 + 60) <= a2;
  }

    -[VMUCallTreeNode nameWithStringsForSymbol:library:loadAddress:offset:address:suffix:]( self,  "nameWithStringsForSymbol:library:loadAddress:offset:address:suffix:",  v26,  v25,  0LL,  v9,  v10,  v24);
    uint64_t v20 = (NSString *)objc_claimAutoreleasedReturnValue();
    combinedName = self->_combinedName;
    self->_combinedName = v20;

    unint64_t v6 = v27;
    int v4 = v28;
  }

  uint64_t v22 = self->super._name;
  objc_storeStrong((id *)&self->super._name, self->_combinedName);
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___VMUCallTreeLeafNode;
  -[VMUCallTreeNode getBrowserName:](&v31, sel_getBrowserName_, v4);
  name = self->super._name;
  self->super._name = v22;

  objc_autoreleasePoolPop(v6);
}

  if (*((_DWORD *)a1 + 6) == *((_DWORD *)v6 + 6)
    && *((_DWORD *)a1 + 7) == *((_DWORD *)v6 + 7)
    && *((void *)a1 + 4) == *((void *)v6 + 4))
  {
    return *((_DWORD *)a1 + 10) == *((_DWORD *)v6 + 10);
  }

  return 0LL;
}

uint64_t vmu_swift_reflection_infoForMetadata(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = *(void *)(a1 + 48) + 288LL * a3;
  return (*(uint64_t (**)(void))(v3 + 176))(*(void *)v3);
}

double vmu_swift_reflection_childOfMetadata@<D0>( uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v7 = *(void *)(a1 + 48) + 288LL * a3;
  (*(void (**)(uint64_t *__return_ptr, void, uint64_t, uint64_t))(v7 + 184))(&v9, *(void *)v7, a2, a4);
  *(void *)a5 = v9;
  double result = v10;
  *(double *)(a5 + _Block_object_dispose((const void *)(v26 - 120), 8) = v10;
  *(void *)(a5 + 16) = v11;
  *(_DWORD *)(a5 + 24) = a3;
  return result;
}

void *vmu_swift_reflection_infoForInstance@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = 0LL;
  *(void *)(a3 + _Block_object_dispose((const void *)(v26 - 120), 8) = 0LL;
  *(_DWORD *)(a3 + 16) = 0;
  double result = (void *)swift_reflection_interop_libraryForObject(a1, a2);
  if (result)
  {
    double result = ((void *(*)(__int128 *__return_ptr, void, uint64_t))result[24])(&v6, *result, a2);
    *(_OWORD *)a3 = v6;
    *(_DWORD *)(a3 + 16) = v7;
  }

  else
  {
    *(_DWORD *)a3 = 0;
  }

  return result;
}

void *vmu_swift_reflection_childOfInstance@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  double result = (void *)swift_reflection_interop_libraryForObject(a1, a2);
  if (result)
  {
    uint64_t v9 = result;
    double result = ((void *(*)(uint64_t *__return_ptr, void, uint64_t, uint64_t))result[25])( &v11,  *result,  a2,  a3);
    *(void *)a4 = v11;
    int v10 = v13;
    *(_DWORD *)(a4 + _Block_object_dispose((const void *)(v26 - 120), 8) = v12;
    *(void *)(a4 + 16) = v14;
    *(_DWORD *)(a4 + 24) = 954437177 * (((unint64_t)v9 - *(void *)(a1 + 48)) >> 5);
  }

  else
  {
    int v10 = 0;
  }

  *(_DWORD *)(a4 + 12) = v10;
  return result;
}

uint64_t vmu_swift_reflection_interop_setClassIsSwiftMask(uint64_t result, uint64_t a2)
{
  int v2 = *(_DWORD *)(result + 56);
  if (v2 >= 1)
  {
    unint64_t v3 = *(void *)(result + 48);
    unint64_t v4 = v3 + 288LL * v2;
    do
    {
      unint64_t v5 = *(void **)(v3 + 8);
      if (v5) {
        *unint64_t v5 = a2;
      }
      v3 += 288LL;
    }

    while (v3 < v4);
  }

  return result;
}

BOOL vmu_swift_reflection_projectEnumValue(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  uint64_t v5 = *(void *)(a1 + 48);
  __int128 v6 = *(unsigned int (**)(void, uint64_t, uint64_t, uint64_t))(v5 + 288LL * a4 + 232);
  return v6 && v6(*(void *)(v5 + 288LL * a4), a2, a3, a5) != 0;
}

const char *vmu_swift_reflection_asyncTaskSlabPointer(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 56);
  if (v1 < 1) {
    return "Failed to find Remote Mirror function asyncTaskSlabPointer";
  }
  int v2 = *(void **)(a1 + 48);
  unint64_t v3 = &v2[36 * v1];
  double result = "Failed to find Remote Mirror function asyncTaskSlabPointer";
  while (1)
  {
    uint64_t v5 = (uint64_t (*)(void))v2[18];
    if (v5) {
      break;
    }
    v2 += 36;
    if (v2 >= v3) {
      return result;
    }
  }

  return (const char *)v5(*v2);
}

uint64_t vmu_reflection_interop_asyncTaskSlabAllocations@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  int v2 = *(_DWORD *)(result + 56);
  if (v2 < 1)
  {
LABEL_5:
    a2[2] = 0LL;
    a2[3] = 0LL;
    *a2 = "Failed to find Remote Mirror function asyncTaskSlabAllocations";
    a2[1] = 0LL;
  }

  else
  {
    unint64_t v3 = *(void **)(result + 48);
    unint64_t v4 = &v3[36 * v2];
    while (1)
    {
      uint64_t v5 = (uint64_t (*)(void))v3[19];
      if (v5) {
        return v5(*v3);
      }
      v3 += 36;
      if (v3 >= v4) {
        goto LABEL_5;
      }
    }
  }

  return result;
}

uint64_t vmu_swift_reflection_interop_ownsObject(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 56);
  if (v1 < 1) {
    return 0LL;
  }
  int v2 = *(void **)(a1 + 48);
  unint64_t v3 = &v2[36 * v1];
  while (1)
  {
    unint64_t v4 = (uint64_t (*)(void))v2[12];
    if (v4) {
      break;
    }
    v2 += 36;
    if (v2 >= v3) {
      return 0LL;
    }
  }

  return v4(*v2);
}

uint64_t vmu_swift_reflection_interop_typeRefForMangledTypeName(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = *(void *)(a1 + 48);
  unint64_t v7 = v6;
  while (1)
  {
    uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t))(v7 + 128))(*(void *)v7, a2, a3);
    if (result) {
      break;
    }
    v7 += 288LL;
    v6 += 288LL;
  }

  return result;
}

uint64_t swift_reflection_interop_getSizeAdapter()
{
  return 8LL;
}

uint64_t swift_reflection_interop_readBytesAdapter(void *a1, uint64_t a2, void *a3, size_t a4)
{
  uint64_t result = ((uint64_t (*)(void, uint64_t, size_t, uint64_t *))a1[3])(*a1, a2, a4, &v10);
  if (result)
  {
    uint64_t v8 = result;
    memcpy(a3, (const void *)result, a4);
    uint64_t v9 = (void (*)(void, uint64_t, uint64_t))a1[2];
    if (v9) {
      v9(*a1, v8, v10);
    }
    return 1LL;
  }

  return result;
}

uint64_t swift_reflection_interop_GetStringLengthAdapter(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))(*(void *)a1);
}

uint64_t swift_reflection_interop_GetSymbolAddressAdapter(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 40))(*(void *)a1);
}

uint64_t swift_reflection_interop_libraryForObject(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a1 + 56);
  if (v2 < 1) {
    return 0LL;
  }
  unint64_t v5 = *(void *)(a1 + 48);
  unint64_t v6 = v5;
  while (*(_DWORD *)(v6 + 280))
  {
LABEL_6:
    v6 += 288LL;
    unint64_t v8 = v5 + 288LL * v2;
    if (v6 >= v8)
    {
      if (v2 >= 1)
      {
        while (!*(_DWORD *)(v5 + 280))
        {
          v5 += 288LL;
          if (v5 >= v8) {
            return 0LL;
          }
        }

        return v5;
      }

      return 0LL;
    }
  }

  unint64_t v7 = (const void *)(*(uint64_t (**)(void, uint64_t))(v6 + 112))(*(void *)v6, a2);
  if (!v7)
  {
    unint64_t v5 = *(void *)(a1 + 48);
    int v2 = *(_DWORD *)(a1 + 56);
    goto LABEL_6;
  }

  uint64_t v10 = v7;
  int v11 = *(_DWORD *)(a1 + 56);
  if (v11 < 1) {
    return 0LL;
  }
  unint64_t v12 = *(void *)(a1 + 48);
  unint64_t v5 = v12;
  while (2)
  {
    if (!*(_DWORD *)(v5 + 280))
    {
      int v14 = (*(uint64_t (**)(void, const void *))(v5 + 104))(*(void *)v5, v10);
      unint64_t v12 = *(void *)(a1 + 48);
      if (v14) {
        goto LABEL_26;
      }
      int v11 = *(_DWORD *)(a1 + 56);
      goto LABEL_24;
    }

    int v13 = *(void **)(a1 + 72);
    if (!v13)
    {
LABEL_24:
      v5 += 288LL;
      if (v5 >= v12 + 288LL * v11) {
        return 0LL;
      }
      continue;
    }

    break;
  }

  while (v13[1] > (unint64_t)v10 || v13[2] <= (unint64_t)v10)
  {
    int v13 = (void *)*v13;
    if (!v13) {
      goto LABEL_24;
    }
  }

void sub_1860F9C68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1860F9E34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1860FA134(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1860FA22C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1860FA2F4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

void sub_1860FA370(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1860FA740( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1860FA960(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,unsigned int &,unsigned int &>( uint64_t a1, unsigned int *a2, _DWORD *a3, int *a4)
{
  unint64_t v8 = *a2;
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v9 <= v8) {
        unint64_t v4 = v8 % v9;
      }
    }

    else
    {
      unint64_t v4 = ((_DWORD)v9 - 1) & v8;
    }

    int v11 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v11)
    {
      unint64_t v12 = *v11;
      if (*v11)
      {
        do
        {
          unint64_t v13 = v12[1];
          if (v13 == v8)
          {
            if (*((_DWORD *)v12 + 4) == (_DWORD)v8) {
              return v12;
            }
          }

          else
          {
            if (v10.u32[0] > 1uLL)
            {
              if (v13 >= v9) {
                v13 %= v9;
              }
            }

            else
            {
              v13 &= v9 - 1;
            }

            if (v13 != v4) {
              break;
            }
          }

          unint64_t v12 = (void *)*v12;
        }

        while (v12);
      }
    }
  }

  unint64_t v12 = operator new(0x18uLL);
  void *v12 = 0LL;
  v12[1] = v8;
  int v14 = *a4;
  *((_DWORD *)v12 + 4) = *a3;
  *((_DWORD *)v12 + 5) = v14;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v16 = *(float *)(a1 + 32);
  if (!v9 || (float)(v16 * (float)v9) < v15)
  {
    BOOL v17 = 1LL;
    if (v9 >= 3) {
      BOOL v17 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v9);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( a1,  v20);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v9 <= v8) {
        unint64_t v4 = v8 % v9;
      }
      else {
        unint64_t v4 = v8;
      }
    }

    else
    {
      unint64_t v4 = ((_DWORD)v9 - 1) & v8;
    }
  }

  uint64_t v21 = *(void *)a1;
  uint64_t v22 = *(void **)(*(void *)a1 + 8 * v4);
  if (v22)
  {
    void *v12 = *v22;
LABEL_38:
    void *v22 = v12;
    goto LABEL_39;
  }

  void *v12 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v12;
  *(void *)(v21 + 8 * v4) = a1 + 16;
  if (*v12)
  {
    unint64_t v23 = *(void *)(*v12 + 8LL);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v23 >= v9) {
        v23 %= v9;
      }
    }

    else
    {
      v23 &= v9 - 1;
    }

    uint64_t v22 = (void *)(*(void *)a1 + 8 * v23);
    goto LABEL_38;
  }

void sub_1860FAC08(_Unwind_Exception *a1)
{
}

void *std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::__emplace_unique_key_args<NSString * {__strong},NSString * {__strong}&,unsigned int &>( uint64_t a1, id *a2, id *a3, _DWORD *a4)
{
  unint64_t v9 = [*a2 hash];
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    unint64_t v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v4 = v9;
      if (v9 >= v11) {
        unint64_t v4 = v9 % v11;
      }
    }

    else
    {
      unint64_t v4 = (v11 - 1) & v9;
    }

    int v14 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      for (uint64_t i = *v14; i; uint64_t i = *(void **)i)
      {
        unint64_t v16 = *((void *)i + 1);
        if (v16 == v10)
        {
        }

        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11) {
              v16 %= v11;
            }
          }

          else
          {
            v16 &= v11 - 1;
          }

          if (v16 != v4) {
            break;
          }
        }
      }
    }
  }

  BOOL v17 = (void *)(a1 + 16);
  uint64_t i = operator new(0x20uLL);
  *(void *)uint64_t i = 0LL;
  *((void *)i + 1) = v10;
  *((void *)i + 2) = *a3;
  *((_DWORD *)i + 6) = *a4;
  float v18 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v19 = *(float *)(a1 + 32);
  if (!v11 || (float)(v19 * (float)v11) < v18)
  {
    BOOL v20 = 1LL;
    if (v11 >= 3) {
      BOOL v20 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v21 = v20 | (2 * v11);
    unint64_t v22 = vcvtps_u32_f32(v18 / v19);
    if (v21 <= v22) {
      size_t v23 = v22;
    }
    else {
      size_t v23 = v21;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( a1,  v23);
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11) {
        unint64_t v4 = v10 % v11;
      }
      else {
        unint64_t v4 = v10;
      }
    }

    else
    {
      unint64_t v4 = (v11 - 1) & v10;
    }
  }

  uint64_t v24 = *(void *)a1;
  uint64_t v25 = *(void **)(*(void *)a1 + 8 * v4);
  if (v25)
  {
    *(void *)uint64_t i = *v25;
LABEL_38:
    void *v25 = i;
    goto LABEL_39;
  }

  *(void *)uint64_t i = *v17;
  *BOOL v17 = i;
  *(void *)(v24 + 8 * v4) = v17;
  if (*(void *)i)
  {
    unint64_t v26 = *(void *)(*(void *)i + 8LL);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v26 >= v11) {
        v26 %= v11;
      }
    }

    else
    {
      v26 &= v11 - 1;
    }

    uint64_t v25 = (void *)(*(void *)a1 + 8 * v26);
    goto LABEL_38;
  }

void sub_1860FAE7C(_Unwind_Exception *a1)
{
}

uint64_t NSStringEqualsFunctor::operator()(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (v4 == v5) {
    uint64_t v6 = 1LL;
  }
  else {
    uint64_t v6 = [v4 isEqualToString:v5];
  }

  return v6;
}

void sub_1860FAEF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<NSString * {__strong},unsigned int>,void *>>>::operator()[abi:ne180100]( uint64_t a1, id *a2)
{
  if (*(_BYTE *)(a1 + 8))
  {
  }

  else if (!a2)
  {
    return;
  }

  operator delete(a2);
}

uint64_t **std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::find<NSString * {__strong}>( void *a1, id *a2)
{
  unint64_t v4 = [*a2 hash];
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0LL;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }

  else
  {
    unint64_t v9 = (*(void *)&v5 - 1LL) & v4;
  }

  unint64_t v10 = *(uint64_t ****)(*a1 + 8 * v9);
  if (!v10) {
    return 0LL;
  }
  unint64_t v11 = *v10;
  if (*v10)
  {
    uint64_t v12 = (uint64_t)(a1 + 4);
    do
    {
      unint64_t v13 = (unint64_t)v11[1];
      if (v13 == v6)
      {
        if ((NSStringEqualsFunctor::operator()(v12, v11[2], *a2) & 1) != 0) {
          return v11;
        }
      }

      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(void *)&v5) {
            v13 %= *(void *)&v5;
          }
        }

        else
        {
          v13 &= *(void *)&v5 - 1LL;
        }

        if (v13 != v9) {
          return 0LL;
        }
      }

      unint64_t v11 = (uint64_t **)*v11;
    }

    while (v11);
  }

  return v11;
}

uint64_t *std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::find<unsigned int>( void *a1, unsigned int *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0LL;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (*(void *)&v2 <= v3) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }

  else
  {
    unint64_t v5 = (v2.i32[0] - 1) & v3;
  }

  unint64_t v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6) {
    return 0LL;
  }
  for (uint64_t result = *v6; result; uint64_t result = (uint64_t *)*result)
  {
    unint64_t v8 = result[1];
    if (v8 == v3)
    {
      if (*((_DWORD *)result + 4) == (_DWORD)v3) {
        return result;
      }
    }

    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(void *)&v2) {
          v8 %= *(void *)&v2;
        }
      }

      else
      {
        v8 &= *(void *)&v2 - 1LL;
      }

      if (v8 != v5) {
        return 0LL;
      }
    }
  }

  return result;
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_189DFC0B0, MEMORY[0x189614200]);
}

void sub_1860FB140(_Unwind_Exception *a1)
{
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x189614780] + 16LL);
  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::~__hash_table( uint64_t a1)
{
  int8x8_t v2 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::__deallocate_node( uint64_t a1, id *a2)
{
  if (a2)
  {
    int8x8_t v2 = a2;
    do
    {
      unint64_t v3 = (id *)*v2;

      operator delete(v2);
      int8x8_t v2 = v3;
    }

    while (v3);
  }

LABEL_61:
                [v3 mutateTypeFieldsWithBlock:v57];
                goto LABEL_42;
              }
            }

            v143 = 0LL;
            v144 = (uint64_t)&v143;
            v145 = 0x2020000000LL;
            LOBYTE(v146) = 0;
            v131[0] = MEMORY[0x1895F87A8];
            v131[1] = 3221225472LL;
            v131[2] = __34__VMUScanOverlay_initWithScanner___block_invoke_21;
            v131[3] = &unk_189DFDFA8;
            v132 = v3;
            v133 = &v143;
            [v132 mutateTypeFieldsWithBlock:v131];

LABEL_80:
            _Block_object_dispose(&v143, 8);
            goto LABEL_42;
          }
        }

        v143 = 0LL;
        v144 = (uint64_t)&v143;
        v145 = 0x2020000000LL;
        LOBYTE(v146) = 0;
        v134[0] = MEMORY[0x1895F87A8];
        v134[1] = 3221225472LL;
        v134[2] = __34__VMUScanOverlay_initWithScanner___block_invoke_20;
        v134[3] = &unk_189DFDFA8;
        v135 = v3;
        v136 = &v143;
        [v135 mutateTypeFieldsWithBlock:v134];

        goto LABEL_80;
      }
    }

    v143 = 0LL;
    v144 = (uint64_t)&v143;
    v145 = 0x2020000000LL;
    LOBYTE(v146) = 0;
    v137[0] = MEMORY[0x1895F87A8];
    v137[1] = 3221225472LL;
    v137[2] = __34__VMUScanOverlay_initWithScanner___block_invoke_19;
    v137[3] = &unk_189DFDFA8;
    v138 = v3;
    v139 = &v143;
    [v138 mutateTypeFieldsWithBlock:v137];

    goto LABEL_80;
  }

LABEL_29:
}

          if (![(id)a1 _remoteAddressIsOKtoRead:a4])
          {
            size_t v23 = 0LL;
            unint64_t v13 = 0LL;
LABEL_60:
            unint64_t v11 = 0LL;
            goto LABEL_61;
          }

          stringFromBytes(a2, a3, (int *)&v37);
          unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            unint64_t v22 = [(id)a1 uniquifyStringLabel:v21 stringType:v37 printDetail:1];
          }

          else
          {
            if (![(id)a1 isTaggedPointer:a2])
            {
              unint64_t v13 = 0LL;
              goto LABEL_59;
            }

            unint64_t v22 = [(id)a1 labelForTaggedPointer:a2];
          }

          unint64_t v13 = (void *)v22;
LABEL_59:

          size_t v23 = 0LL;
          goto LABEL_60;
        }

        [v16 className];
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v25 = [v20 isEqualToString:v24];

        if (!v25)
        {
          unint64_t v13 = 0LL;
          int v14 = v36;
          goto LABEL_55;
        }
      }

      if (!v16)
      {
        size_t v23 = 0LL;
        unint64_t v13 = 0LL;
        int v14 = v36;
        goto LABEL_61;
      }

      int v14 = v36;
LABEL_38:
      if ([v16 isCoreMediaFigObject])
      {
        unint64_t v26 = [(id)a1 labelForCoreMediaFigObject:a2 length:a3 remoteAddress:a4];
LABEL_42:
        unint64_t v13 = (void *)v26;
        size_t v23 = 0LL;
LABEL_61:

        goto LABEL_62;
      }

      if (*(_BYTE *)(a1 + 68))
      {
        unint64_t v26 = [*(id *)(a1 + 456) labelForDriverKitMemory:a2 length:a3 remoteAddress:a4 class:v16];
        goto LABEL_42;
      }

      uint64_t v27 = [v16 remoteIsa];
      uint64_t v28 = -[VMUObjectIdentifier objectLabelHandlerForRemoteIsa:]((void *)a1, v27);
      uint64_t v29 = (void *)v28;
      if (v28)
      {
        uint64_t v30 = *(void *)(v28 + 16);
        if (v30)
        {
          if (v27 == v30 && (!*(_BYTE *)(a1 + 288) || *(void *)a2 == v27))
          {
            unint64_t v35 = 0LL;
          }

          else
          {
            if (labelForMemory_length_remoteAddress_classInfo_usingHandlerBlock__onceToken != -1) {
              dispatch_once( &labelForMemory_length_remoteAddress_classInfo_usingHandlerBlock__onceToken,  &__block_literal_global_317);
            }
            uint64_t v31 = (unsigned __int8 *)((uint64_t (*)(void, size_t))labelForMemory_length_remoteAddress_classInfo_usingHandlerBlock__located_class_createInstance)( v29[2],  a3 - [v16 instanceSize]);
            if (!v31) {
              goto LABEL_53;
            }
            unint64_t v35 = v31;
            if (malloc_size(v31) < a3) {
              goto LABEL_53;
            }
            uint64_t v33 = a2 + 8;
            a2 = v35;
            memcpy(v35 + 8, v33, a3 - 8);
          }
        }

        else
        {
          unint64_t v35 = 0LL;
        }

        unint64_t v34 = v29;
        size_t v23 = v34;
        if (v12) {
          v12[2](v12, v34, a2, a3, a4);
        }
        else {
          [a1 v34[3]:a2:a3:a4];
        }
        unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v35) {
          free(v35);
        }

        goto LABEL_61;
      }

      free(v144);
      [v16 objectForKeyedSubscript:@"regionDataExtra"];
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = +[VMUDirectedGraph _copyUnarchived:length:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_copyUnarchived:length:options:",  v73,  0LL,  v150);

      v52 = v145;
      if (v74)
      {
        if (*v40)
        {
          v75 = 0LL;
          v76 = v74;
          do
          {
            [v68 objectAtIndexedSubscript:v75];
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            [v77 setVMRegionDataExtra:v76];

            ++v75;
            v76 += 16;
          }

          while (v75 < *v40);
        }

        free(v74);
      }

      [v16 objectForKeyedSubscript:@"exclaveFlagData"];
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = +[VMUDirectedGraph _copyUnarchived:length:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_copyUnarchived:length:options:",  v78,  0LL,  v150);

      if (v79)
      {
        if (*v40)
        {
          v80 = 0LL;
          v81 = v79;
          do
          {
            [v68 objectAtIndexedSubscript:v80];
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            [v82 setVMRegionExclaveFlagsData:v81];

            ++v80;
            v81 += 4;
          }

          while (v80 < *v40);
        }

        free(v79);
      }

      objc_storeStrong((id *)v14 + 28, v68);
      v83 = [v14 nodeNamespaceSize];
      v84 = calloc(1uLL, ((v83 + 7) >> 3) + 4);
      *v84 = v83;
      if (v14[380] && !v14[381])
      {
        v89 = ownedPhysFootprintAdjustmentForMemgraph(v68, (_DWORD *)v14 + 58, *((void *)v14 + 57), *((void *)v14 + 58));
        v14[381] = 1;
        if (v89)
        {
          v90 = (void *)v89;
          v155[0] = MEMORY[0x1895F87A8];
          v155[1] = 3221225472LL;
          v155[2] = __73__VMUProcessObjectGraph_initWithArchived_version_options_diskLogs_error___block_invoke;
          v155[3] = &unk_189DFF990;
          v91 = v14;
          v156 = v91;
          v92 = v90;
          v157 = v92;
          v158 = v84;
          [v91 reverseEnumerateNodesWithBlock:v155];
          [v91 removeMarkedNodes:v84];
          v146 = v92;
          [v68 removeObject:v92];
        }

        else
        {
          v146 = 0LL;
        }

        v86 = v143;
      }

      else
      {
        v85 = [v14 nodeNamespaceSize] - 1;
        [v14 nodeDetails:v85];
        v86 = v143;
        if (VMUGraphNodeType_IsVMRegion(v154 >> 60))
        {
          [v14 vmuVMRegionForNode:v85];
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v87)
          {
            [v14 removeMarkedNodes:v84];
          }
        }

        v146 = 0LL;
      }

      free(v84);
    }

    else
    {
      v68 = 0LL;
      v146 = 0LL;
      *unint64_t v40 = 0;
    }

    [v16 objectForKey:@"autoreleasePoolOffsets"];
    v93 = (void *)objc_claimAutoreleasedReturnValue();

    if (v93)
    {
      [v16 objectForKeyedSubscript:@"autoreleasePoolOffsets"];
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = [v94 copy];
      v96 = (void *)*((void *)v14 + 41);
      *((void *)v14 + 41) = v95;
    }

    else
    {
      v161[0] = @"parentPageOffset";
      v97 = (void *)MEMORY[0x189607968];
      else {
        v98 = 24LL;
      }
      [v97 numberWithUnsignedInt:v98];
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v162[0] = v94;
      v161[1] = @"firstEntryOffset";
      v99 = (void *)MEMORY[0x189607968];
      else {
        v100 = 40LL;
      }
      [v99 numberWithUnsignedInt:v100];
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v162[1] = v96;
      v161[2] = @"childPageOffset";
      v101 = (void *)MEMORY[0x189607968];
      else {
        v102 = 28LL;
      }
      [v101 numberWithUnsignedInt:v102];
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v162[2] = v103;
      v104 = [MEMORY[0x189603F68] dictionaryWithObjects:v162 forKeys:v161 count:3];
      v105 = (void *)*((void *)v14 + 41);
      *((void *)v14 + 41) = v104;
    }

    [v16 objectForKeyedSubscript:@"threadNameRanges"];
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = +[VMUDirectedGraph _unarchivedObject:ofClass:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_unarchivedObject:ofClass:options:",  v106,  objc_opt_class(),  v150);
    v108 = (void *)*((void *)v14 + 36);
    *((void *)v14 + 36) = v107;

    if (kVMUPrintArchivingTiming) {
      fprintf( (FILE *)*MEMORY[0x1895F89D0],  "[Thread Name Ranges] Count: %u  Uniqued string count: %u\n\n",  [*((id *)v14 + 36) count],  [*((id *)v14 + 36) uniquedStringCount]);
    }
    [v16 objectForKeyedSubscript:@"binarySectionNameRanges"];
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = +[VMUDirectedGraph _unarchivedObject:ofClass:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_unarchivedObject:ofClass:options:",  v109,  objc_opt_class(),  v150);
    v111 = (void *)*((void *)v14 + 37);
    *((void *)v14 + 37) = v110;

    if (kVMUPrintArchivingTiming) {
      fprintf((FILE *)*MEMORY[0x1895F89D0], "[Binary Section Name Ranges] Count: %u  Uniqued string count: %u\n\n", [*((id *)v14 + 37) count], [*((id *)v14 + 37) uniquedStringCount]);
    }
    [v16 objectForKeyedSubscript:@"regionSymbolNameRanges"];
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = +[VMUDirectedGraph _unarchivedObject:ofClass:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_unarchivedObject:ofClass:options:",  v112,  objc_opt_class(),  v150);
    v114 = (void *)*((void *)v14 + 38);
    *((void *)v14 + 3_Block_object_dispose((const void *)(v26 - 120), 8) = v113;

    if (kVMUPrintArchivingTiming) {
      fprintf( (FILE *)*MEMORY[0x1895F89D0],  "[Region Symbol Name Ranges] Count: %u  Uniqued string count: %u\n\n",  [*((id *)v14 + 38) count],  [*((id *)v14 + 38) uniquedStringCount]);
    }
    [v16 objectForKeyedSubscript:@"nodeLabels"];
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = +[VMUDirectedGraph _unarchivedObject:ofClass:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_unarchivedObject:ofClass:options:",  v115,  objc_opt_class(),  v150);
    v117 = (void *)*((void *)v14 + 53);
    *((void *)v14 + 53) = v116;

    v118 = (void *)*((void *)v14 + 53);
    if (v118)
    {
      if (kVMUPrintArchivingTiming) {
        fprintf( (FILE *)*MEMORY[0x1895F89D0],  "[Node Labels] Count: %u  Uniqued string count: %u\n\n",  [v118 count],  objc_msgSend(*((id *)v14 + 53), "uniquedStringCount"));
      }
    }

    else if (kVMUPrintArchivingTiming)
    {
      fwrite("[Node Labels] NO NODE LABELS\n\n", 0x1EuLL, 1uLL, (FILE *)*MEMORY[0x1895F89D0]);
    }

    [v16 objectForKeyedSubscript:@"userMarked"];
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    *((void *)v14 + 42) = +[VMUDirectedGraph _copyUnarchived:length:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_copyUnarchived:length:options:",  v119,  0LL,  v150);

    [v16 objectForKeyedSubscript:@"symbolStore"];
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = +[VMUDirectedGraph _unarchivedObject:ofClass:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_unarchivedObject:ofClass:options:",  v120,  objc_opt_class(),  v150);
    v122 = (void *)*((void *)v14 + 52);
    *((void *)v14 + 52) = v121;

    [*((id *)v14 + 52) setGraph:v14];
    [v16 objectForKeyedSubscript:@"stackLogReader"];
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = +[VMUDirectedGraph _unarchivedObject:ofClass:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_unarchivedObject:ofClass:options:",  v123,  objc_opt_class(),  v150);
    v125 = (void *)*((void *)v14 + 43);
    *((void *)v14 + 43) = v124;

    v126 = (void *)*((void *)v14 + 43);
    if (v126)
    {
      [v126 setGraph:v14];
      [*((id *)v14 + 43) setDiskLogs:v149];
      [v14 indexedClassInfos];
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = [v127 hasClassInfosDerivedFromStackBacktraces];

      if ((v128 & 1) == 0)
      {
        v129 = (void *)*((void *)v14 + 43);
        [v14 indexedClassInfos];
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        v152[0] = MEMORY[0x1895F87A8];
        v152[1] = 3221225472LL;
        v152[2] = __73__VMUProcessObjectGraph_initWithArchived_version_options_diskLogs_error___block_invoke_2;
        v152[3] = &unk_189DFD328;
        v131 = v14;
        v153 = v131;
        [v129 identifyNonObjectsUsingStackBacktraces:v131 classInfoMap:v130 classInfoSetterBlock:v152];

        [v131 indexedClassInfos];
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        v151.receiver = v131;
        v151.super_class = (Class)&OBJC_CLASS___VMUProcessObjectGraph;
        -[VMUObjectGraph setIndexedClassInfos:](&v151, sel_setIndexedClassInfos_, v132);
      }
    }

    [v16 objectForKeyedSubscript:@"backtraces"];
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v134 = (void *)MEMORY[0x189604010];
    v135 = objc_opt_class();
    [v134 setWithObjects:v135, objc_opt_class(), 0];
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = +[VMUDirectedGraph _unarchivedObject:ofClasses:options:]( &OBJC_CLASS___VMUDirectedGraph,  "_unarchivedObject:ofClasses:options:",  v133,  v136,  v150);
    v138 = (void *)*((void *)v14 + 51);
    *((void *)v14 + 51) = v137;

    [v16 objectForKeyedSubscript:@"idleExitStatus"];
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)v14 + 94) = [v139 unsignedIntValue];

    v140 = [v16 objectForKeyedSubscript:@"ledger"];
    v141 = (void *)*((void *)v14 + 56);
    *((void *)v14 + 56) = v140;

    unint64_t v13 = v149;
LABEL_91:
    v88 = v14;
    goto LABEL_92;
  }

  v53 = -[VMUSimpleDeserializer initWithData:](objc_alloc(&OBJC_CLASS___VMUSimpleDeserializer), "initWithData:", v52);
  v54 = -[VMUSimpleDeserializer deserialize32WithError:](v53, "deserialize32WithError:", v15);
  if (!*v15)
  {
    v55 = v54;
    v147 = v12;
    v56 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:v55];
    if (v55)
    {
      while (1)
      {
        v57 = -[VMUSimpleDeserializer deserialize64WithError:](v53, "deserialize64WithError:", v15);
        if (*v15) {
          break;
        }
        v58 = v57;
        v59 = -[VMUSimpleDeserializer deserialize32WithError:](v53, "deserialize32WithError:", v15);
        if (*v15) {
          break;
        }
        [MEMORY[0x189607968] numberWithUnsignedInt:v59];
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        [MEMORY[0x189607968] numberWithUnsignedLongLong:v58];
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        [v56 setObject:v60 forKeyedSubscript:v61];

        if (!--v55) {
          goto LABEL_17;
        }
      }

      uint64_t v12 = v147;
      goto LABEL_54;
    }

  objc_autoreleasePoolPop(v9);
  return v16;
}

void sub_1860FCC2C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37)
{
}

uint64_t _isSwiftRootClass(void *a1)
{
  id v1 = a1;
  [v1 superclassInfo];
  int8x8_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    uint64_t v3 = 0LL;
  }

  else
  {
    [v1 className];
    uint8x8_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v3 = [v4 containsString:@"Swift"];
  }

  return v3;
}

void _variantForCFBasicHash(void *a1)
{
  v18[1] = *MEMORY[0x1895F89C0];
  id v1 = a1;
  [v1 firstFieldWithName:@"_callbacks"];
  int8x8_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (v2) {
    [v2 setScanType:0];
  }
  [v1 firstFieldWithName:@"_bits"];
  uint8x8_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    [v1 firstFieldWithName:@"_keys"];
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v6 = v5;
    if (v5)
    {
      [v5 ivarName];
      uint8x8_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      _destinationLayoutStorageVariant(v1, 48LL, v7, 2LL, @"Key");
      unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

      v18[0] = v8;
      [MEMORY[0x189603F18] arrayWithObjects:v18 count:1];
      unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v1 replaceField:v6 withFields:v9];

      [v6 ivarName];
      unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      _destinationLayoutStorageVariant(v1, 48LL, v10, 4LL, @"Key");
      unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

      [v1 addVariant:v11 forField:v8 withEvaluator:&__block_literal_global_459];
    }

    [v1 firstFieldWithName:@"_values"];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v13 = v12;
    if (v12)
    {
      [v12 ivarName];
      int v14 = (void *)objc_claimAutoreleasedReturnValue();
      _destinationLayoutStorageVariant(v1, 40LL, v14, 2LL, @"Value");
      float v15 = (void *)objc_claimAutoreleasedReturnValue();

      BOOL v17 = v15;
      [MEMORY[0x189603F18] arrayWithObjects:&v17 count:1];
      unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v1 replaceField:v13 withFields:v16];
    }
  }
}

VMUMutableFieldInfo *_destinationLayoutStorageVariant(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v9 = a5;
  id v10 = a3;
  id v11 = a1;
  [v11 displayName];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)a4 == 4) {
    unint64_t v13 = "Weak ";
  }
  else {
    unint64_t v13 = "";
  }
  uint64_t v14 = [v9 length];
  float v15 = " ";
  if (!v14) {
    float v15 = "";
  }
  [v12 stringByAppendingFormat:@" (%s%@%sStorage)", v13, v9, v15];
  unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

  [v11 binaryPath];
  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[VMUClassInfo classInfoWithClassName:binaryPath:type:]( &OBJC_CLASS___VMUMutableClassInfo,  "classInfoWithClassName:binaryPath:type:",  v16,  v17,  16LL);
  float v18 = (void *)objc_claimAutoreleasedReturnValue();

  [v18 setDefaultScanType:a4];
  float v19 = objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo);
  uint64_t v20 = [v11 pointerSize];

  unint64_t v21 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( v19,  "initWithName:type:scan:offset:size:",  v10,  @"^@",  2LL,  a2,  v20);
  -[VMUFieldInfo setDestinationLayout:](v21, "setDestinationLayout:", v18);

  return v21;
}

void _variantForNSSlice(void *a1, void *a2, void *a3)
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (+[VMUScanOverlay foundationHasNSSliceMemoryOptimization]( &OBJC_CLASS___VMUScanOverlay,  "foundationHasNSSliceMemoryOptimization"))
  {
    id v8 = v5;
    id v9 = v6;
    id v10 = v7;
    [v8 firstFieldWithName:v9];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 stringByAppendingString:@".items"];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      uint64_t v13 = [v11 offset];
      _destinationLayoutStorageVariant(v8, v13, v12, 2LL, v10);
      unint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
      id v42 = v5;
      id v38 = v7;
      uint64_t v14 = objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo);
      [v9 stringByAppendingString:@".acquisitionProps"];
      id v40 = v6;
      float v15 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v16 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( v14,  "initWithName:type:scan:offset:size:",  v15,  @"^{NSSliceExternalAcquisitionProperties}",  1LL,  (v13 + 8),  8LL);

      BOOL v17 = objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo);
      [v9 stringByAppendingString:@".personalityProps"];
      float v18 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v37 = v12;
      float v19 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( v17,  "initWithName:type:scan:offset:size:",  v18,  @"^{NSSliceExternalPersonalityProperties}",  1LL,  (v13 + 16),  8LL);

      uint64_t v20 = objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo);
      [v9 stringByAppendingString:@".internalProps"];
      unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v22 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( v20,  "initWithName:type:scan:offset:size:",  v21,  @"^{NSSliceInternalProperties}",  1LL,  (v13 + 24),  8LL);

      v50 = v35;
      v51 = v16;
      v52 = v19;
      v53 = v22;
      [MEMORY[0x189603F18] arrayWithObjects:&v50 count:4];
      size_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 replaceField:v11 withFields:v23];

      _destinationLayoutStorageVariant(v8, v13, v37, 4LL, v10);
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v44 = MEMORY[0x1895F87A8];
      uint64_t v45 = 3221225472LL;
      v46 = ___variantForNSSlice_Version2_block_invoke;
      v47 = &__block_descriptor_36_e45_B32__0Q8__VMUTaskMemoryScanner_16____v__QQ_24l;
      int v48 = v13;
      [v8 addVariant:v24 forField:v35 withEvaluator:&v44];

      id v5 = v42;
      id v6 = v40;

      uint64_t v12 = v37;
      id v7 = v38;
    }
  }

  else
  {
    id v8 = v5;
    id v9 = v6;
    id v25 = v7;
    [v8 firstFieldWithName:v9];
    unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 stringByAppendingString:@".items"];
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      int v28 = [v8 pointerSize];
      id v39 = v7;
      uint64_t v29 = [v26 offset];
      _destinationLayoutStorageVariant(v8, v29, v27, 2LL, v25);
      unint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
      id v41 = v6;
      uint64_t v30 = objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo);
      [v9 stringByAppendingString:@".fields"];
      id v43 = v5;
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v32 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( v30,  "initWithName:type:scan:offset:size:",  v31,  @"{NSSliceFields}",  0,  [v26 offset] + v28,  objc_msgSend(v26, "size") - v28);

      _destinationLayoutStorageVariant(v8, v29, v27, 4LL, v25);
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v36;
      v51 = v32;
      [MEMORY[0x189603F18] arrayWithObjects:&v50 count:2];
      unint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 replaceField:v26 withFields:v34];

      uint64_t v44 = MEMORY[0x1895F87A8];
      uint64_t v45 = 3221225472LL;
      v46 = ___variantForNSSlice_Version1_block_invoke;
      v47 = &__block_descriptor_40_e45_B32__0Q8__VMUTaskMemoryScanner_16____v__QQ_24l;
      int v48 = v29;
      id v7 = v39;
      int v49 = v28;
      [v8 addVariant:v33 forField:v36 withEvaluator:&v44];

      id v5 = v43;
      id v6 = v41;
    }
  }
}

void ___variantForSwiftClass_block_invoke(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint8x8_t v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = [WeakRetained pointerSize];

  if ([v3 offset] == (_DWORD)v6)
  {
    id v7 = objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo);
    id v8 = objc_loadWeakRetained((id *)(a1 + 40));
    id v9 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( v7,  "initWithName:type:scan:offset:size:",  @"_refcounts",  @"^v",  5,  v6,  [v8 pointerSize]);

    [*(id *)(a1 + 32) sideTableLayoutWithScannableOwnerPointer];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMUFieldInfo setDestinationLayout:](v9, "setDestinationLayout:", v10);

    id v11 = objc_loadWeakRetained(v4);
    v13[0] = v9;
    [MEMORY[0x189603F18] arrayWithObjects:v13 count:1];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 replaceField:v3 withFields:v12];
  }
}

void ___variantForSwiftClass_block_invoke_2(void **a1, void *a2, int a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 offset] + a3;
  if ([v5 scanType] == 4)
  {
    _createSwiftWeakExactVariant(v5, a1[4], 1LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    _createSwiftWeakExactVariant(v5, a1[4], 2LL);
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    v44[0] = MEMORY[0x1895F87A8];
    v44[1] = 3221225472LL;
    v44[2] = ___variantForSwiftClass_block_invoke_3;
    v44[3] = &unk_189DFE1C0;
    objc_copyWeak(&v48, a1 + 6);
    id v45 = a1[4];
    id v46 = a1[5];
    objc_copyWeak(&v49, a1 + 7);
    id v9 = v5;
    id v47 = v9;
    int v50 = a3;
    [WeakRetained addVariantRecursively:v7 forField:v9 atOffset:v6 withEvaluator:v44];

    id v10 = objc_loadWeakRetained(a1 + 6);
    v37[0] = MEMORY[0x1895F87A8];
    v37[1] = 3221225472LL;
    v37[2] = ___variantForSwiftClass_block_invoke_4;
    v37[3] = &unk_189DFE1C0;
    objc_copyWeak(&v41, a1 + 6);
    id v38 = a1[4];
    id v39 = a1[5];
    objc_copyWeak(&v42, a1 + 7);
    id v40 = v9;
    int v43 = a3;
    [v10 addVariantRecursively:v17 forField:v40 atOffset:v6 withEvaluator:v37];

    objc_destroyWeak(&v42);
    objc_destroyWeak(&v41);

    objc_destroyWeak(&v49);
    objc_destroyWeak(&v48);
  }

  else if ([v5 scanType] == 3)
  {
    _createSwiftExactUnownedVariant(v5, a1[4]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = a1 + 6;
    id v13 = objc_loadWeakRetained(a1 + 6);
    v33[0] = MEMORY[0x1895F87A8];
    v33[1] = 3221225472LL;
    v33[2] = ___variantForSwiftClass_block_invoke_5;
    v33[3] = &unk_189DFE1E8;
    objc_copyWeak(&v35, v12);
    id v34 = v5;
    int v36 = a3;
    [v13 addVariantRecursively:v11 forField:v34 atOffset:v6 withEvaluator:v33];

    objc_destroyWeak(&v35);
  }

  else if ([v5 kind] == 6)
  {
    id v14 = objc_loadWeakRetained(a1 + 6);
    uint64_t v15 = MEMORY[0x1895F87A8];
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    v25[2] = ___variantForSwiftClass_block_invoke_6;
    v25[3] = &unk_189DFE210;
    objc_copyWeak(&v29, a1 + 6);
    id v26 = a1[4];
    id v27 = a1[5];
    objc_copyWeak(&v30, a1 + 7);
    id v16 = v5;
    id v28 = v16;
    int v31 = a3;
    int v32 = v6;
    v18[0] = v15;
    v18[1] = 3221225472LL;
    void v18[2] = ___variantForSwiftClass_block_invoke_7;
    v18[3] = &unk_189DFE238;
    objc_copyWeak(&v22, a1 + 6);
    id v19 = a1[4];
    id v20 = a1[5];
    objc_copyWeak(&v23, a1 + 7);
    id v21 = v16;
    int v24 = a3;
    [v14 addComplexAction:v25 withEvaluator:v18];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v22);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v29);
  }
}

void sub_1860FEAD0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
}

id _createSwiftWeakExactVariant(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = (void *)[a1 mutableCopy];
  id v7 = v6;
  if (a3 == 2)
  {
    [v6 setScanType:5];
    uint64_t v8 = [v5 sideTableLayoutWithUnscannableOwnerPointer];
    goto LABEL_5;
  }

  if (a3 == 1)
  {
    [v6 setScanType:5];
    uint64_t v8 = [v5 sideTableLayoutWithScannableOwnerPointer];
LABEL_5:
    id v9 = (void *)v8;
    [v7 setDestinationLayout:v8];
  }

  return v7;
}

BOOL ___variantForSwiftClass_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = (id *)(a1 + 56);
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained(v6);
  unsigned int v9 = [WeakRetained pointerSize];
  id v10 = *(void **)(a1 + 32);
  id v11 = *(void **)(a1 + 40);
  id v12 = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v13 = _determineSwiftWeakExactVariant(v9, v10, v11, v12, *(void **)(a1 + 48), v7, *(_DWORD *)(a1 + 72), a2);

  return v13 == 1;
}

uint64_t _determineSwiftWeakExactVariant( unsigned int a1, void *a2, void *a3, void *a4, void *a5, void *a6, unsigned int a7, uint64_t a8)
{
  id v15 = a2;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = (uint64_t (*)(void *, uint64_t, uint64_t))v19[2];
  if (a1 == 8)
  {
    id v21 = (uint64_t *)v20(v19, a8, 8LL);
    if (v21)
    {
      uint64_t v22 = *v21;
      goto LABEL_11;
    }
  }

  else
  {
    id v23 = (unsigned int *)v20(v19, a8, 4LL);
    if (v23)
    {
      uint64_t v22 = *v23;
      goto LABEL_11;
    }
  }

  uint64_t v22 = 0LL;
LABEL_11:
  [v17 classInfoForMemory:v22 length:a1 remoteAddress:a8];
  int v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24) {
    goto LABEL_42;
  }
LABEL_12:
  uint64_t v25 = a8 + a7 + [v18 offset];
  id v26 = (uint64_t (*)(void *, uint64_t, uint64_t))v19[2];
  if (a1 == 8)
  {
    id v27 = (uint64_t *)v26(v19, v25, 8LL);
    if (!v27) {
      goto LABEL_42;
    }
    uint64_t v28 = *v27;
    if (!*v27) {
      goto LABEL_42;
    }
  }

  else
  {
    id v29 = (_DWORD *)v26(v19, v25, 4LL);
    if (!v29) {
      goto LABEL_42;
    }
    uint64_t v28 = *v29;
    if (!*v29) {
      goto LABEL_42;
    }
  }

  [v17 vmuTask];
  id v30 = (void *)objc_claimAutoreleasedReturnValue();
  char v31 = [v30 isExclaveCore];

  if ((v31 & 1) == 0)
  {
    uint64_t v32 = [v15 nativeWeakReferenceMarkerMask] & v28;
    if (v32 == [v15 nativeWeakReferenceMarkerValue])
    {
      v28 &= [v15 nativeWeakReferencePointerMask];
      goto LABEL_23;
    }

LABEL_35:
          uint64_t v37 = 0LL;
          goto LABEL_36;
        }
      }
    }

  [v12 objectForKeyedSubscript:v8];
  id v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v29)
  {
    id v30 = (void *)[objc_alloc(NSString) initWithString:v8];
    if (v5)
    {
      if (v9)
      {
        uint64_t v33 = [objc_alloc(NSString) initWithFormat:@"%@:  %@", @"constant", v8, v36];
      }

      else
      {
        char v31 = [v8 length];
        uint64_t v32 = objc_alloc(NSString);
        if (v13) {
          uint64_t v33 = [v32 initWithFormat:@"length: %lu  %@:  %@", v31, v13, v8];
        }
        else {
          uint64_t v33 = [v32 initWithFormat:@"length: %lu  %@", v31, v8, v36];
        }
      }
    }

    else
    {
      uint64_t v33 = [objc_alloc(NSString) initWithFormat:@"%@", v8, v35, v36];
    }

    id v29 = (void *)v33;
    [v12 setObject:v33 forKeyedSubscript:v30];
  }

  return v29;
}

      unint64_t v45 = *(void *)(*(void *)(a1 + 40) + 8LL);
      uint64_t v39 = *(void **)(v45 + 40);
      *(void *)(v45 + 40) = 0LL;
      goto LABEL_95;
    }

    [*(id *)(a1 + 32) objectIdentifier];
    id v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString classInfoForMemory:length:](v40, "classInfoForMemory:length:", *(void *)(a1 + 48), 1024LL);
    uint64_t v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v42 = -[__CFString className](v41, "className");
LABEL_33:
    uint64_t v43 = *(void *)(*(void *)(a1 + 40) + 8LL);
    unint64_t v44 = *(void **)(v43 + 40);
    *(void *)(v43 + 40) = v42;

    goto LABEL_96;
  }

  if (a2 > 98)
  {
    switch(a2)
    {
      case 'c':
        [MEMORY[0x1896NSStringrmat:@"%d %c", **(char **)(a1 + 48), **(char **)(a1 + 48), v81, v82];
        goto LABEL_93;
      case 'd':
        v60 = (void *)NSString;
        v61 = **(double **)(a1 + 48);
        goto LABEL_79;
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'r':
        goto LABEL_35;
      case 'f':
        v60 = (void *)NSString;
        v61 = **(float **)(a1 + 48);
LABEL_79:
        [v60 stringWithFormat:@"%g" v61, v80, v81, v82];
        goto LABEL_93;
      case 'i':
        v62 = (void *)NSString;
        v63 = **(unsigned int **)(a1 + 48);
        goto LABEL_84;
      case 'l':
        [MEMORY[0x189NSStringormat:@"%ld" **(void **)(a1 + 48), v80, v81, v82];
        goto LABEL_93;
      case 'q':
        [MEMORY[0x189NSStringormat:@"%lld" **(void **)(a1 + 48), v80, v81, v82];
        goto LABEL_93;
      case 's':
        v62 = (void *)NSString;
        v63 = **(__int16 **)(a1 + 48);
LABEL_84:
        [v62 stringWithFormat:@"%d" v63, v80, v81, v82];
        goto LABEL_93;
      default:
        if (a2 != 123) {
          goto LABEL_35;
        }
        unint64_t v46 = *(const char **)(a1 + 56);
        if (!strncmp(v46, "{CGRect=", 8uLL))
        {
          [MEMORY[0x1896NSStringrmat:@"x:%g y:%g w:%g h:%g" , **(void **)(a1 + 48), *(void *)(*(void *)(a1 + 48) + 8), *(void *)(*(void *)(a1 + 48) + 16), *(void *)(*(void *)(a1 + 48) + 24)];
          goto LABEL_93;
        }

        id v47 = strncmp(v46, "{_NSRange=", 0xAuLL);
        id v48 = *(void *)(a1 + 48);
        if (!v47)
        {
          if (*(void *)v48 == 0x7FFFFFFFFFFFFFFFLL)
          {
            id v40 = @"NSNotFound";
          }

          else
          {
            [MEMORY[0x189NSStringormat:@"%lu" *(void *)v48];
            id v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }

          if (*(void *)(v48 + 8) == 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v41 = @"NSNotFound";
          }

          else
          {
            [MEMORY[0x189NSStringormat:@"%lu", *(void *)(v48 + 8)];
            uint64_t v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }

          id v42 = [NSString stringWithFormat:@"{ location:%@  length:%@ }", v40, v41];
          goto LABEL_33;
        }

        v83 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithString:@"{"];
        id v49 = strchr(*(const char **)(a1 + 56), 61);
        if (!v49) {
          goto LABEL_112;
        }
        v51 = v49 + 1;
        int v50 = v49[1];
        break;
    }

    while (1)
    {
      if (v50 != 34) {
        goto LABEL_109;
      }
      v52 = v51 + 1;
      v53 = strchr(v52, 34);
      if (!v53 || (uint64_t v54 = v53, v55 = v53[1], !memchr("LiIcCqQsSfdB@*?#:^", v55, 0x13uLL)))
      {
        int v50 = *(unsigned __int8 *)v52;
LABEL_109:
        if (v50 == 125)
        {
          [v83 appendString:@"}"];
          v75 = *(void *)(*(void *)(a1 + 40) + 8LL);
          v76 = v83;
          v77 = *(void **)(v75 + 40);
          *(void *)(v75 + 40) = v76;
        }

        else
        {
LABEL_112:
          v78 = *(const char **)(a1 + 56);
          if (strncmp(v78, "{RefCounts<swift::", 0x12uLL)) {
            printf("    FAILED STRUCTURE TYPE ENCODING: %s\n", v78);
          }
          v79 = *(void *)(*(void *)(a1 + 40) + 8LL);
          v77 = *(void **)(v79 + 40);
          *(void *)(v79 + 40) = 0LL;
        }

        goto LABEL_96;
      }

      v56 = 0LL;
      v84 = v55;
      if (v55 > 82) {
        break;
      }
      if (v55 <= 65)
      {
        if (v55 > 57)
        {
          if (v55 != 58 && v55 != 64) {
            goto LABEL_70;
          }
        }

        else if (v55 != 35 && v55 != 42)
        {
          goto LABEL_70;
        }
      }

      else
      {
        if (v55 <= 75)
        {
          if ((v55 - 66) < 2)
          {
LABEL_56:
            v56 = 1LL;
          }

          else if (v55 == 73)
          {
LABEL_51:
            v56 = 4LL;
          }

    *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = v7;
    return result;
  }

  switch(a2)
  {
    case '^':
    case 'l':
      goto LABEL_22;
    case '_':
    case 'a':
    case 'e':
    case 'g':
    case 'h':
    case 'j':
    case 'k':
    case 'm':
    case 'n':
    case 'o':
    case 'p':
    case 'r':
      return result;
    case 'b':
    case 'd':
    case 'f':
    case 's':
      goto LABEL_35;
    case 'c':
      if (*(_BYTE *)(result + 48)) {
        uint64_t v8 = -8;
      }
      else {
        uint64_t v8 = -4;
      }
      id v7 = v8 & a3;
      goto LABEL_35;
    case 'i':
      goto LABEL_26;
    case 'q':
      goto LABEL_32;
    default:
      if (a2 == 81)
      {
LABEL_32:
        if (*(_BYTE *)(result + 48)) {
          id v7 = 8 * a3;
        }
        else {
          id v7 = 0;
        }
        goto LABEL_35;
      }

      if (a2 == 83) {
        goto LABEL_35;
      }
      break;
  }

  return result;
}

  v57 = v17;

  v58 = 0LL;
  if (a4)
  {
    id v17 = v9;
    if (v9) {
LABEL_37:
    }
      *a4 = v17;
  }

  *id v11 = v37;
  return result;
}

BOOL ___variantForSwiftClass_block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = (id *)(a1 + 56);
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained(v6);
  unsigned int v9 = [WeakRetained pointerSize];
  id v10 = *(void **)(a1 + 32);
  id v11 = *(void **)(a1 + 40);
  id v12 = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v13 = _determineSwiftWeakExactVariant(v9, v10, v11, v12, *(void **)(a1 + 48), v7, *(_DWORD *)(a1 + 72), a2);

  return v13 == 2;
}

id _createSwiftExactUnownedVariant(void *a1, void *a2)
{
  id v3 = a2;
  uint8x8_t v4 = (void *)[a1 mutableCopy];
  [v3 unownedExtraDataLayout];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  [v4 setDestinationLayout:v5];
  return v4;
}

uint64_t ___variantForSwiftClass_block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained(v5);
  uint64_t shouldApplySwiftExactUnownedVariant = _shouldApplySwiftExactUnownedVariant( [WeakRetained pointerSize],  *(void **)(a1 + 32),  v6);

  return shouldApplySwiftExactUnownedVariant;
}

uint64_t _shouldApplySwiftExactUnownedVariant(int a1, void *a2, void *a3)
{
  id v5 = a3;
  [a2 offset];
  id v6 = v5;
  id v7 = (uint64_t (*)(void))v6[2];
  if (a1 != 8)
  {
    id v10 = (_DWORD *)v7();
    if (v10)
    {
      LODWORD(v9) = *v10;
      goto LABEL_7;
    }

void ___variantForSwiftClass_block_invoke_6(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v13 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = *(void **)(a1 + 40);
  id v11 = objc_loadWeakRetained((id *)(a1 + 64));
  _recursivelyCreateSwiftEnumPayloadVariant( WeakRetained,  v9,  v10,  v11,  *(void **)(a1 + 48),  v7,  *(_DWORD *)(a1 + 72),  a3);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12) {
    [v13 replaceFieldRecursively:*(void *)(a1 + 48) atOffset:*(unsigned int *)(a1 + 76) withField:v12];
  }
}

id _recursivelyCreateSwiftEnumPayloadVariant( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, unsigned int a7, uint64_t a8)
{
  id v15 = a1;
  id v16 = a2;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  unsigned int active = _determineActiveSwiftEnumPayloadCaseIndex(v18, v19, a7, a8);
  if ((active & 0x80000000) != 0)
  {
    uint64_t v28 = 0LL;
  }

  else
  {
    unsigned int v22 = active;
    uint64_t v33 = v15;
    [v19 possibleEnumPayloadFieldArray];
    id v23 = (void *)objc_claimAutoreleasedReturnValue();
    int v24 = [v23 count];

    if ((int)v22 >= v24)
    {
      uint64_t v28 = 0LL;
    }

    else
    {
      [v19 possibleEnumPayloadFieldArray];
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 objectAtIndexedSubscript:v22];
      id v26 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t v27 = swiftEnumDummyNoPayloadSubField;
      uint64_t v28 = (void *)[v19 mutableCopy];
      [v28 setScanType:0];
      if (v26 != (void *)v27)
      {
        uint64_t v29 = _recursivelyCreateSwiftVariant(v33, v16, v17, v18, v26, v20, [v19 offset] + a7, a8);
        id v30 = (void *)v29;
        if (v29) {
          char v31 = (void *)v29;
        }
        else {
          char v31 = v26;
        }
        [v28 addSubField:v31];
      }
    }

    id v15 = v33;
  }

  return v28;
}

uint64_t ___variantForSwiftClass_block_invoke_7(uint64_t a1, const void *a2, void *a3, uint64_t *a4)
{
  id v7 = a3;
  uint64_t v14 = [@"seed" hash];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = *(void **)(a1 + 40);
  id v11 = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v12 = _recursivelyDetermineSwiftEnumPayloadVariantHash( WeakRetained,  v9,  v10,  v11,  *(void **)(a1 + 48),  v7,  *(_DWORD *)(a1 + 72),  a2,  &v14,  0);

  *a4 = v14;
  return v12;
}

uint64_t _recursivelyDetermineSwiftEnumPayloadVariantHash( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, unsigned int a7, const void *a8, void *a9, int a10)
{
  id v17 = a1;
  id v49 = a2;
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v48 = a8;
  unsigned int active = _determineActiveSwiftEnumPayloadCaseIndex(v19, v20, a7, (uint64_t)a8);
  if ((active & 0x80000000) != 0
    || (unsigned int v23 = active,
        [v20 possibleEnumPayloadFieldArray],
        int v24 = (void *)objc_claimAutoreleasedReturnValue(),
        int v25 = [v24 count],
        v24,
        (int)v23 >= v25))
  {
    if (debugSwiftSubfieldIsEnabled())
    {
      id v30 = [v20 ivarName];
      id v47 = (const char *)[v30 UTF8String];
      uint64_t v31 = *(void *)[v19 swiftMirror];
      uint64_t v32 = (uint64_t *)[v20 swiftTyperef];
      id v33 = vmu_swift_reflection_interop_copyDemangledNameForTypeRef(v31, *v32, v32[1]);
      id v34 = (const char *)[v33 UTF8String];
      id v35 = [v17 className];
      _debugSwiftAsyncPrintf( a10,  "Failed to project enum case for field %s (type %s), of object at %p of class %s. Falling back to conservative scanning.\n",  v47,  v34,  v48,  (const char *)[v35 UTF8String]);

      if (!a10) {
        fputc(10, (FILE *)*MEMORY[0x1895F89D0]);
      }
    }

    VMUClassInfoComplexVariantEvaluatorCombineHashes(a9, [@"No-Change" hash]);
    uint64_t v36 = 0LL;
  }

  else
  {
    [v20 possibleEnumPayloadFieldArray];
    id v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v26 objectAtIndexedSubscript:v23];
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v28 = swiftEnumDummyNoPayloadSubField;
    int IsEnabled = debugSwiftSubfieldIsEnabled();
    if (v27 == (void *)v28)
    {
      if (IsEnabled)
      {
        id v37 = [v20 ivarName];
        id v38 = (const char *)[v37 UTF8String];
        id v39 = [v17 className];
        _debugSwiftAsyncPrintf( a10,  "Detected no-payload of field %s, of object at %p of class %s. Treating as a non-payload case and not scanning the subfield.\n",  v38,  a8,  (const char *)[v39 UTF8String]);

        if (!a10) {
          fputc(10, (FILE *)*MEMORY[0x1895F89D0]);
        }
      }

      VMUClassInfoComplexVariantEvaluatorCombineHashes(a9, [@"Payload-Empty" hash]);
    }

    else
    {
      if (IsEnabled)
      {
        id v46 = [v27 ivarName];
        unint64_t v45 = (const char *)[v46 UTF8String];
        unint64_t v44 = VMUScanTypeScanDescription([v27 scanType]);
        id v43 = [v20 ivarName];
        id v42 = (const char *)[v43 UTF8String];
        id v41 = [v17 className];
        _debugSwiftAsyncPrintf( a10,  "enum payload  %s  scanType %s (may be changed), of field %s, of object at %p of class %s  size %u stride %u\n",  v45,  v44,  v42,  a8,  (const char *)[v41 UTF8String],  [v27 size],  [v27 stride]);

        if (!a10) {
          fputc(10, (FILE *)*MEMORY[0x1895F89D0]);
        }
      }

      VMUClassInfoComplexVariantEvaluatorCombineHashes(a9, [@"Payload-" hash] + v23);
      _recursivelyDetermineComplexSwiftVariantHash( v17,  v49,  v18,  v19,  v27,  v21,  [v20 offset] + a7,  (uint64_t)a8,  a9,  a10 + 1);
    }

    uint64_t v36 = 1LL;
  }

  return v36;
}

uint64_t _determineActiveSwiftEnumPayloadCaseIndex(void *a1, void *a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5 = a4 + a3;
  id v6 = a2;
  id v7 = a1;
  uint64_t v8 = v5 + [v6 offset];
  uint64_t v9 = (uint64_t *)[v6 swiftTyperef];

  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  uint64_t v12 = (uint64_t *)[v7 swiftMirror];

  uint64_t v13 = *v12;
  unsigned int v15 = 0x80000000;
  else {
    return 0x80000000LL;
  }
}

id _recursivelyCreateSwiftVariant( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
  id v15 = a1;
  id v16 = a2;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  unint64_t v44 = v15;
  unsigned int v21 = [v15 pointerSize];
  id v43 = v18;
  if ([v19 scanType] == 4)
  {
    uint64_t v22 = a8;
    unsigned int v23 = v17;
    uint64_t v24 = _determineSwiftWeakExactVariant(v21, v16, v17, v18, v19, v20, a7, v22);
    if (v24)
    {
      uint64_t v25 = _createSwiftWeakExactVariant(v19, v16, v24);
LABEL_8:
      uint64_t v28 = (void *)v25;
      goto LABEL_20;
    }

id ___recursivelyCreateSwiftVariant_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint8x8_t v4 = a3;
  if ((*(unsigned int (**)(uint64_t))(a2 + 16))(a2))
  {
    v4[2](v4);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return v5;
}

uint64_t ___recursivelyCreateSwiftVariant_block_invoke_2(uint64_t a1)
{
  return _shouldApplySwiftExactUnownedVariant(*(_DWORD *)(a1 + 56), *(void **)(a1 + 32), *(void **)(a1 + 40));
}

id ___recursivelyCreateSwiftVariant_block_invoke_3(uint64_t a1)
{
  return _createSwiftExactUnownedVariant(*(void **)(a1 + 32), *(void **)(a1 + 40));
}

void _recursivelyDetermineComplexSwiftVariantHash( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8, void *a9, int a10)
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v17 = a1;
  id v18 = a2;
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a6;
  if ([v21 scanType] == 4)
  {
    uint64_t v23 = _determineSwiftWeakExactVariant([v17 pointerSize], v18, v19, v20, v21, v22, a7, a8);
    if (v23 == 2)
    {
      uint64_t v24 = @"Weak-With-Unscannable-Owner-Pointer-Applied";
      goto LABEL_14;
    }

    if (v23 == 1)
    {
      uint64_t v24 = @"Weak-With-Scannable-Owner-Pointer-Applied";
      goto LABEL_14;
    }

    if (v23) {
      goto LABEL_15;
    }
    goto LABEL_11;
  }

  if ([v21 scanType] == 3)
  {
    if (_shouldApplySwiftExactUnownedVariant([v17 pointerSize], v21, v22))
    {
      uint64_t v24 = @"Unowned-Applied";
LABEL_14:
      VMUClassInfoComplexVariantEvaluatorCombineHashes(a9, -[__CFString hash](v24, "hash"));
      goto LABEL_15;
    }

uint64_t ___variantForCFBasicHash_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a4 + 16))(a4, a2, 48LL);
  if (result) {
    return (*(void *)(result + 24) & 0x3FF003FF000000LL | *(void *)(result + 32) & 0x3FF003FF0LL) == 0;
  }
  return result;
}

void sub_1861007A0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_1861008DC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_18610149C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

LABEL_21:
  uint64_t v12 = 0LL;
LABEL_24:

  return v12;
}

  [v3 appendString:@"  SPECULATIVE"];
  if ((a1 & 0x80) == 0)
  {
LABEL_9:
    if ((a1 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }

      ++v6;
    }

    while (v6 != v18);
  }

uint64_t zoneEnumeratorBlockAdapter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a2 + 16))(a2, a3, a4, a5);
}

void sub_18610202C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t VMUTaskIsSelf()
{
  IsSelf_portOfCachedResult = (task_name_t *)VMUTaskIsSelf_portOfCachedResult();
  if (*IsSelf_portOfCachedResult == v1)
  {
    IsSelf_cachedResult = (unsigned __int8 *)VMUTaskIsSelf_cachedResult();
  }

  else
  {
    task_name_t *IsSelf_portOfCachedResult = v1;
    mach_task_is_self(v1);
    IsSelf_cachedResult = (unsigned __int8 *)VMUTaskIsSelf_cachedResult();
    unsigned __int8 *IsSelf_cachedResult = v3;
  }

  return *IsSelf_cachedResult;
}

BOOL memoryExists(vm_map_read_t target_task, mach_vm_address_t a2, mach_vm_size_t a3)
{
  if (!a3) {
    return 0LL;
  }
  mach_vm_size_t v3 = a3;
  do
  {
    natural_t nesting_depth = 0;
    mach_vm_address_t address = a2;
    mach_msg_type_number_t infoCnt = 12;
    while (1)
    {
      if (mach_vm_region_recurse(target_task, &address, &size, &nesting_depth, info, &infoCnt)
        || !info[0]
        || address > a2)
      {
        return 0LL;
      }

      if (!info[8]) {
        break;
      }
      ++nesting_depth;
      mach_vm_address_t address = a2;
    }

    if (size + address <= a2) {
      return 0LL;
    }
    mach_vm_size_t v6 = size + address - a2;
    BOOL v7 = v3 > v6;
    v3 -= v6;
    BOOL result = !v7;
  }

  while (v7);
  return result;
}

uint64_t task_start_peeking()
{
  return mapped_memory_suspend_target();
}

uint64_t task_stop_peeking()
{
  uint64_t result = task_lookup_mapped_memory_cache();
  if (result)
  {
    uint64_t v1 = mapped_memory_resume_target();
    task_release_mapped_memory_cache();
    return v1;
  }

  return result;
}

uint64_t task_peek_natural_size( vm_map_read_t a1, mach_vm_address_t a2, mach_vm_size_t a3, mach_vm_address_t *a4)
{
  return task_peek_to_end_of_region(a1, a2, a3, a4, 0LL);
}

uint64_t task_peek(vm_map_read_t a1, mach_vm_address_t a2, mach_vm_size_t a3, mach_vm_address_t *a4)
{
  return task_peek_to_end_of_region(a1, a2, a3, a4, 0LL);
}

uint64_t task_peek_to_end_of_region( vm_map_read_t a1, mach_vm_address_t a2, mach_vm_size_t a3, mach_vm_address_t *a4, void *a5)
{
  *a4 = 0LL;
  if (a3)
  {
    if (*MEMORY[0x1895FD590] > a2) {
      return 1LL;
    }
    IsSelf_portOfCachedResult = (vm_map_read_t *)VMUTaskIsSelf_portOfCachedResult();
    if (*IsSelf_portOfCachedResult == a1)
    {
      if (*(_BYTE *)VMUTaskIsSelf_cachedResult())
      {
LABEL_5:
        if (HIDWORD(a2) && memoryExists(a1, a2, a3))
        {
          uint64_t result = 0LL;
          *a4 = a2;
          return result;
        }

        return 1LL;
      }
    }

    else
    {
      vm_map_read_t *IsSelf_portOfCachedResult = a1;
      mach_task_is_self(a1);
      IsSelf_cachedResult = (_BYTE *)VMUTaskIsSelf_cachedResult();
      _BYTE *IsSelf_cachedResult = v13;
      if (v13) {
        goto LABEL_5;
      }
    }

    uint64_t v14 = (const char *)task_lookup_mapped_memory_cache();
    if (!v14)
    {
      NSLog(@"*** Error: calling task_peek() before task_start_peeking()\n");
      return 0xFFFFFFFFLL;
    }

    node = (uint64_t *)find_node(v14, (tree *)a2);
    if (!node)
    {
      node = (uint64_t *)map_new_node();
      if (!node) {
        return 0LL;
      }
    }

    uint64_t v16 = *node;
    *a4 = node[2] + a2 - *node;
    if (a5)
    {
      uint64_t result = 0LL;
      *a5 = v16 - a2 + node[1];
      return result;
    }
  }

  return 0LL;
}

uint64_t *task_try_peek(uint64_t a1, tree *a2, void *a3)
{
  uint64_t v5 = (const char *)task_lookup_mapped_memory_cache();
  if (v5)
  {
    uint64_t result = (uint64_t *)find_node(v5, a2);
    if (result || (uint64_t result = (uint64_t *)map_new_node()) != 0LL)
    {
      uint64_t v7 = result[1];
      uint64_t v8 = *result;
      *a3 = (char *)a2 + result[2] - *result;
      return (uint64_t *)(v8 - (void)a2 + v7);
    }
  }

  else
  {
    NSLog(@"*** Error: calling task_try_peek() before task_start_peeking()\n");
    return 0LL;
  }

  return result;
}

uint64_t task_read_ptr_at(vm_map_read_t a1, mach_vm_address_t a2, void *a3)
{
  mach_vm_size_t v6 = 0LL;
  uint64_t result = task_peek_to_end_of_region(a1, a2, 8uLL, (mach_vm_address_t *)&v6, 0LL);
  uint64_t v5 = 0LL;
  if (!(_DWORD)result && v6) {
    uint64_t v5 = *v6;
  }
  *a3 = v5;
  return result;
}

uint64_t task_read_unsigned_at(vm_map_read_t a1, mach_vm_address_t a2, _DWORD *a3)
{
  mach_vm_size_t v6 = 0LL;
  uint64_t result = task_peek_to_end_of_region(a1, a2, 4uLL, (mach_vm_address_t *)&v6, 0LL);
  int v5 = 0;
  if (!(_DWORD)result && v6) {
    int v5 = *v6;
  }
  *a3 = v5;
  return result;
}

mach_vm_address_t task_peek_string(task_name_t a1, mach_vm_address_t a2)
{
  IsSelf_portOfCachedResult = (task_name_t *)VMUTaskIsSelf_portOfCachedResult();
  if (*IsSelf_portOfCachedResult == a1)
  {
    if (*(_BYTE *)VMUTaskIsSelf_cachedResult()) {
      return a2;
    }
  }

  else
  {
    task_name_t *IsSelf_portOfCachedResult = a1;
    mach_task_is_self(a1);
    IsSelf_cachedResult = (_BYTE *)VMUTaskIsSelf_cachedResult();
    _BYTE *IsSelf_cachedResult = v7;
    if (v7) {
      return a2;
    }
  }

  unint64_t v19 = 1LL;
  int v8 = task_peek_to_end_of_region(a1, a2, 1uLL, &v18, &v19);
  mach_vm_address_t result = 0LL;
  if (!v8)
  {
    mach_vm_address_t v9 = v18;
    if (v18)
    {
      unint64_t v10 = 0LL;
      uint64_t v11 = MEMORY[0x1895F8770];
      uint64_t v12 = (void *)MEMORY[0x1895FD590];
      while (1)
      {
        while (v10 >= v19)
        {
          mach_vm_size_t v15 = *v12 + v19;
          unint64_t v19 = v15;
          if (v15 <= 0x19000)
          {
            int v16 = task_peek_to_end_of_region(a1, a2, v15, &v18, &v19);
            mach_vm_address_t v9 = v18;
            if (!v16 && v18 != 0) {
              continue;
            }
          }

          return 0LL;
        }

        unsigned int v13 = *(char *)(v9 + v10);
        if (!*(_BYTE *)(v9 + v10)) {
          return v9;
        }
        if ((v13 & 0x80000000) != 0)
        {
        }

        else if ((*(_DWORD *)(v11 + 4LL * v13 + 60) & 0x40000) != 0)
        {
          goto LABEL_21;
        }

        BOOL v14 = v13 > 0xD || ((1 << v13) & 0x2600) == 0;
LABEL_21:
        ++v10;
      }
    }
  }

  return result;
}

BOOL objectIsDeallocatingOrDeallocated(BOOL result)
{
  if (result) {
    return (*(_BYTE *)(result + 10) & 0xE0) != 0;
  }
  return result;
}

BOOL stringHasInlineContents(BOOL result)
{
  if (result)
  {
    char v1 = atomic_load((unint64_t *)(result + 8));
    return (v1 & 0x60) == 0LL;
  }

  return result;
}

__CFString *stringFromMappedNSCFString( void *a1, uint64_t a2, unint64_t a3, uint64_t a4, void *a5, int *a6)
{
  id v11 = a1;
  uint64_t v56 = a2;
  id v12 = a5;
  if (a6) {
    *a6 = 0;
  }
  if (!a2 || a3 - 1 < 0xF) {
    goto LABEL_5;
  }
  char v15 = atomic_load((unint64_t *)(a2 + 8));
  unsigned int v16 = atomic_load((unint64_t *)(a2 + 8));
  char v17 = atomic_load((unint64_t *)(a2 + 8));
  uint64_t v18 = v56;
  if (v56)
  {
    char v19 = atomic_load((unint64_t *)(v56 + 8));
    BOOL v20 = (v19 & 0x60) == 0LL;
    uint64_t v18 = v56;
  }

  else
  {
    BOOL v20 = 0;
  }

  char v21 = v15 | ((v17 & 4) == 0LL);
  unint64_t v22 = atomic_load((unint64_t *)(v18 + 8));
  if (!v20 && !(v15 & 1 | ((v17 & 4) == 0LL)))
  {
    unsigned int v13 = 0LL;
    v55 = 0LL;
    goto LABEL_6;
  }

  unint64_t v23 = 32LL;
  if (v20) {
    unint64_t v23 = 24LL;
  }
  if (v23 > a3) {
    goto LABEL_5;
  }
  unint64_t v53 = v22;
  char v54 = v15;
  unint64_t Length2 = _CFStringGetLength2();
  if (Length2 > 0x3B9ACA00) {
    goto LABEL_5;
  }
  int v25 = (v16 >> 4) & 1;
  if (!Length2)
  {
    if (a6)
    {
      int v32 = (v54 & 1) != 0 ? 11 : 3;
      *a6 = v32;
      if (v25) {
        *a6 = v32 | 0x10;
      }
    }

    unsigned int v13 = &stru_189E010C8;
    goto LABEL_6;
  }

  v55 = 0LL;
  unint64_t v52 = Length2;
  if (v20)
  {
    if (!remoteAddressIsOKtoRead(a4, v12)) {
      goto LABEL_5;
    }
    int64_t v26 = v52;
    if (a3)
    {
      unint64_t v27 = (v52 << v25) + 16;
      if (v27 > a3)
      {
        [v11 memoryCache];
        id v28 = (void *)objc_claimAutoreleasedReturnValue();
        int v29 = [v28 peekAtAddress:a4 size:v27 returnsBuf:&v56];

        unsigned int v13 = 0LL;
        if (v29) {
          goto LABEL_6;
        }
        int64_t v26 = v52;
        if (!v56) {
          goto LABEL_6;
        }
      }
    }

    uint64_t v30 = 8LL;
    if ((v21 & 1) == 0) {
      uint64_t v30 = 0LL;
    }
    uint64_t v31 = (_WORD *)(v56 + v30 + 16);
    v55 = v31;
  }

  else
  {
    if (v25 && (v17 & 4) != 0) {
      goto LABEL_5;
    }
    uint64_t v33 = *(void *)(v56 + 16);
    if (!remoteAddressIsOKtoRead(v33, v12)) {
      goto LABEL_5;
    }
    if (v25) {
      uint64_t v34 = 2 * v52;
    }
    else {
      uint64_t v34 = v52 + ((unint64_t)(v17 & 4) >> 2);
    }
    [v11 memoryCache];
    unint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
    int v36 = [v35 peekAtAddress:v33 size:v34 returnsBuf:&v55];

    unsigned int v13 = 0LL;
    if (v36) {
      goto LABEL_6;
    }
    uint64_t v31 = v55;
    int64_t v26 = v52;
    if (!v55) {
      goto LABEL_6;
    }
  }

  if (v25)
  {
    char v45 = v54;
    if (!*v31) {
      goto LABEL_5;
    }
    uint64_t v46 = 1LL;
    do
    {
      uint64_t v47 = v46;
      if (v26 == v46) {
        break;
      }
      ++v46;
    }

    while (v31[v47]);
    if (v47 < v26) {
      goto LABEL_5;
    }
    int64_t v48 = v26;
    id v49 = objc_alloc(NSString);
    unsigned int v13 = (__CFString *)[v49 initWithCharactersNoCopy:v55 length:v48 freeWhenDone:0];
LABEL_69:
    if (a6 && v13)
    {
      if (v20) {
        int v50 = 3;
      }
      else {
        int v50 = 35;
      }
      if (!HIDWORD(v53)) {
        v50 |= 0x40u;
      }
      if ((v45 & 1) != 0) {
        v50 |= 8u;
      }
      *a6 = v50;
      if (v25) {
        *a6 = v50 | 0x10;
      }
    }

    goto LABEL_6;
  }

  if ((v17 & 4) != 0)
  {
    uint64_t v31 = (_WORD *)((char *)v31 + 1);
    v55 = v31;
  }

  uint64_t v37 = 0LL;
  uint64_t v38 = MEMORY[0x1895F8770];
  char v51 = 1;
  while (1)
  {
    unsigned int v39 = *((unsigned __int8 *)v31 + v37);
    uint64_t v40 = *((unsigned __int8 *)v31 + v37);
    if ((*(_DWORD *)(v38 + 4 * v40 + 60) & 0x40000) == 0) {
      goto LABEL_50;
    }
LABEL_60:
    if (v26 == ++v37) {
      goto LABEL_61;
    }
  }

  int v41 = __maskrune(*((unsigned __int8 *)v31 + v37), 0x40000uLL);
  int64_t v26 = v52;
  if (v41) {
    goto LABEL_60;
  }
LABEL_50:
  BOOL v42 = v39 > 0xD || ((1 << v39) & 0x2600) == 0;
  if (v42 && v39 - 169 >= 2) {
    char v51 = 0;
  }
LABEL_61:
  if ((v51 & 1) != 0)
  {
    int64_t v43 = v26;
    id v44 = objc_alloc(NSString);
    unsigned int v13 = (__CFString *)[v44 initWithBytes:v55 length:v43 encoding:4];
    char v45 = v54;
    int v25 = 0;
    goto LABEL_69;
  }

LABEL_5:
  unsigned int v13 = 0LL;
LABEL_6:

  return v13;
}

  mach_vm_size_t v6 = 0LL;
LABEL_18:

  return v6;
}

  id v12 = -1LL;
LABEL_6:

  return v12;
}

BOOL remoteAddressIsOKtoRead(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint8x8_t v4 = v3;
  BOOL v5 = !v3 || [v3 containsLocation:a1];

  return v5;
}

unsigned __int8 *stringFromBytes(unsigned __int8 *a1, unint64_t a2, int *a3)
{
  if (a1)
  {
    uint8x8_t v4 = a1;
    a1 = 0LL;
    if (a2)
    {
      unint64_t v5 = *v4;
      unsigned int v6 = (char)v5;
      if ((_BYTE)v5)
      {
        uint64_t v8 = MEMORY[0x1895F8770];
        else {
          int v9 = *(_DWORD *)(MEMORY[0x1895F8770] + 4LL * (char)v5 + 60) & 0x40000;
        }
        int v10 = 1;
        if (a2 >= 2)
        {
          unint64_t v11 = 1LL;
          while (1)
          {
            unsigned int v6 = (char)v4[v11];
            if (!v4[v11]) {
              goto LABEL_28;
            }
            if ((v6 & 0x80000000) != 0)
            {
            }

            else if ((*(_DWORD *)(v8 + 4LL * v6 + 60) & 0x40000) != 0)
            {
              goto LABEL_25;
            }

            BOOL v12 = v6 > 0xD || ((1 << v6) & 0x2600) == 0;
            if (v12 && v6 - 169 >= 2)
            {
              if (v11 == 1) {
                char v24 = v10;
              }
              else {
                char v24 = 1;
              }
              if ((v24 & 1) != 0) {
                goto LABEL_33;
              }
              goto LABEL_69;
            }

id shortenString(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    int8x8_t v2 = v1;
    if (shortenString_onceToken != -1) {
      dispatch_once(&shortenString_onceToken, &__block_literal_global_6);
    }
    if ([v2 containsString:@"binary plist:  {"])
    {
      id v3 = v2;
      if (!flattenPlistString_newlineCharacterSet)
      {
        uint64_t v4 = [MEMORY[0x189607810] newlineCharacterSet];
        unint64_t v5 = (void *)flattenPlistString_newlineCharacterSet;
        flattenPlistString_newlineCharacterSet = v4;

        [MEMORY[0x189607810] whitespaceAndNewlineCharacterSet];
        unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v7 = [v6 invertedSet];
        uint64_t v8 = (void *)flattenPlistString_nonwhitespaceCharacterSet;
        flattenPlistString_nonwhitespaceCharacterSet = v7;
      }

      unint64_t v9 = [v3 length];
      unint64_t v10 = [v3 rangeOfCharacterFromSet:flattenPlistString_newlineCharacterSet options:0 range:0];
      unint64_t v11 = 96LL;
      if (v9 < 0x60) {
        unint64_t v11 = v9;
      }
      if (v10 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t v12 = v10, v10 > v11))
      {
        int v15 = v3;
      }

      else
      {
        do
        {
          uint64_t v13 = [v3 rangeOfCharacterFromSet:flattenPlistString_nonwhitespaceCharacterSet options:0 range:v12 v9 - v12];
          unint64_t v14 = v13 - v12;
          [v3 stringByReplacingCharactersInRange:v12, v13 - v12, @" "];
          int v15 = (void *)objc_claimAutoreleasedReturnValue();

          unint64_t v9 = v9 - v14 + 1;
          uint64_t v16 = [v15 rangeOfString:@" =  " options:0 range:v12 v9 - v12];
          if (v16 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v18 = objc_msgSend( v15,  "rangeOfCharacterFromSet:options:range:",  flattenPlistString_nonwhitespaceCharacterSet,  0,  v16 + v17,  v9 - (v16 + v17))
                - (v16
                 + v17
                 - 1);
            if (v18)
            {
              uint64_t v19 = [v15 stringByReplacingCharactersInRange:withString:];

              int v15 = (void *)v19;
            }

            v9 -= v18;
          }

          unint64_t v20 = [v15 rangeOfCharacterFromSet:flattenPlistString_newlineCharacterSet options:0 range:v12 v9 - v12];
          unint64_t v12 = v20;
          if (v9 >= 0x60) {
            unint64_t v21 = 96LL;
          }
          else {
            unint64_t v21 = v9;
          }
          BOOL v22 = v20 == 0x7FFFFFFFFFFFFFFFLL || v20 > v21;
          id v3 = v15;
        }

        while (!v22);
      }
    }

    else
    {
      unint64_t v23 = [v2 length];
      if (v23 >= 0x60) {
        uint64_t v24 = 96LL;
      }
      else {
        uint64_t v24 = v23;
      }
      [v2 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n" options:0 range:v24];
      int v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if ((unint64_t)[v15 length] >= 0x61)
    {
      id v25 = [v15 substringToIndex:96];
      if ([v25 UTF8String])
      {
        if (!v25) {
          return v15;
        }
        goto LABEL_36;
      }

      [v15 substringToIndex:95];
      int v26 = (void *)objc_claimAutoreleasedReturnValue();

      id v27 = v26;
      if (![v27 UTF8String])
      {
        uint64_t v30 = @"<<couldn't convert to UTF8>>";
        id v25 = v15;
LABEL_42:

        int v15 = (void *)v30;
        return v15;
      }

      id v25 = v27;
      if (v27)
      {
LABEL_36:
        uint64_t v28 = [v25 length];
        if (v28 == [v15 length] - 2 && (objc_msgSend(v15, "hasSuffix:", @"\n") & 1) != 0) {
          int v29 = @"";
        }
        else {
          int v29 = @"...";
        }
        [v25 stringByAppendingString:v29];
        uint64_t v30 = (const __CFString *)objc_claimAutoreleasedReturnValue();
        id v27 = v15;
        goto LABEL_42;
      }
    }
  }

  else
  {
    int v15 = 0LL;
  }

  return v15;
}

void __shortenString_block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607810] newlineCharacterSet];
  id v1 = (void *)shortenString_newlineCharacterSet;
  shortenString_newlineCharacterSet = v0;

  [MEMORY[0x189607810] whitespaceAndNewlineCharacterSet];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v4 invertedSet];
  id v3 = (void *)shortenString_nonwhitespaceCharacterSet;
  shortenString_nonwhitespaceCharacterSet = v2;
}

__CFString *stringFromMappedNSCFData( void *a1, unint64_t *a2, uint64_t a3, void *a4, int a5, int a6, void *a7)
{
  uint64_t v82 = *MEMORY[0x1895F89C0];
  id v13 = a1;
  id v14 = a4;
  id v15 = a7;
  if (stringFromMappedNSCFData_onceToken != -1) {
    dispatch_once(&stringFromMappedNSCFData_onceToken, &__block_literal_global_22);
  }
  CFIndex Length = CFDataGetLength((CFDataRef)a2);
  if (!Length)
  {
    unint64_t v20 = @"content length 0";
    goto LABEL_118;
  }

  uint64_t v17 = Length;
  v78 = v13;
  BytePtr = (const char *)CFDataGetBytePtr((CFDataRef)a2);
  if (a6)
  {
    char v19 = atomic_load(a2 + 1);
    if ((v19 & 4) == 0) {
      goto LABEL_77;
    }
  }

  else if (!a5)
  {
    goto LABEL_77;
  }

  if (!remoteAddressIsOKtoRead(a3, v14))
  {
    BOOL v22 = 0LL;
    unint64_t v20 = 0LL;
    id v13 = v78;
    goto LABEL_117;
  }

  if (BytePtr - (const char *)a2 < (unint64_t)stringFromMappedNSCFData_cfDataSize)
  {
    id v77 = v15;
    id v21 = v14;
    v80 = BytePtr;
    [MEMORY[0x189NSStringormat:@"inline content length %ld" v17];
    BOOL v22 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v23 = "inline ";
    goto LABEL_12;
  }

LABEL_77:
  [v15 vmuVMRegionForAddress:BytePtr];
  id v44 = (void *)objc_claimAutoreleasedReturnValue();
  char v45 = v44;
  if (!v44) {
    goto LABEL_79;
  }
  uint64_t v46 = [v44 range];
  [v45 type];
  int64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
  char v49 = [v48 hasPrefix:@"MALLOC_"];

  if ((v49 & 1) == 0)
  {
    [v45 descriptionWithOptions:VMUGetFlagsForAllVMRegionStatistics() | 0x201 maximumLength:0];
    int v50 = (void *)objc_claimAutoreleasedReturnValue();
    [v45 type];
    char v51 = (void *)objc_claimAutoreleasedReturnValue();
    int v52 = [v51 hasPrefix:@"__"];

    if (v52 && (CSSymbolicatorGetSymbolWithAddressAtTime(), (uint64_t Name = CSSymbolGetName()) != 0))
    {
      uint64_t v54 = Name;
      uint64_t Range = CSSymbolGetRange();
      if ((const char *)Range == BytePtr) {
        [NSString stringWithFormat:@"content length %ld  %s in VM:  %@", v17, v54, v50, v70];
      }
      else {
        [NSString stringWithFormat:@"content length %ld  %s + %llu in VM:  %@", v17, v54, &BytePtr[-Range], v50];
      }
    }

    else if ((const char *)[v45 range] == BytePtr && (objc_msgSend(v45, "range"), v17 == v56))
    {
      [NSString stringWithFormat:@"content length %ld entire VM:  %@", v17, v50, v69, v70];
    }

    else
    {
      [NSString stringWithFormat:@"content length %ld at offset %llu in VM:  %@", v17, &BytePtr[-[v45 range]], v50, v70];
    }

    unint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v13 = v78;

    goto LABEL_81;
  }

  if (!remoteAddressIsOKtoRead(a3, v14))
  {
LABEL_79:
    unint64_t v20 = 0LL;
LABEL_80:
    id v13 = v78;
LABEL_81:

    BOOL v22 = 0LL;
    goto LABEL_117;
  }

  task_peek_if_pages_exist(v78, (uint64_t)BytePtr, v17, &v80);
  if (!v80)
  {
    [MEMORY[0x1896NSStringrmat:@"content length %ld -- failed to read data from %#llx" v17,  BytePtr];
    unint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_80;
  }

  id v77 = v15;
  id v21 = v14;
  [MEMORY[0x189NSStringormat:@"content length %ld at %#llx" v17, BytePtr];
  BOOL v22 = (void *)objc_claimAutoreleasedReturnValue();

  unint64_t v23 = "";
  BytePtr = v80;
LABEL_12:
  if (!strncmp(BytePtr, "bplist0", 7uLL))
  {
    [MEMORY[0x189603F48] dataWithBytesNoCopy:BytePtr length:v17 freeWhenDone:0];
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x1896079E8] propertyListWithData:v57 options:0 format:0 error:0];
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v59 = [v58 description];
    if (v59)
    {
      v60 = (void *)v59;
      [NSString stringWithFormat:@"%sbinary plist:  %@", v23, v59];
      unint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_98:
      id v14 = v21;
      id v15 = v77;
      id v13 = v78;
      goto LABEL_117;
    }
  }

  if (v17 == 1) {
    size_t v24 = 5LL;
  }
  else {
    size_t v24 = 3 * v17 + 1;
  }
  id v25 = (char *)malloc(v24);
  if (!v25)
  {
    unint64_t v20 = 0LL;
    goto LABEL_98;
  }

  v71 = v25;
  v72 = v22;
  int v26 = &v25[v24];
  id v14 = v21;
  v74 = &v25[v24];
  if (v17 < 1)
  {
    uint64_t v28 = 0LL;
    uint64_t v31 = v25;
    id v15 = v77;
    goto LABEL_100;
  }

  uint64_t v27 = 0LL;
  uint64_t v28 = 0LL;
  uint64_t v29 = v17 - 2;
  unint64_t v73 = (unint64_t)(v26 - 2);
  uint64_t v30 = MEMORY[0x1895F8770];
  char v76 = 1;
  uint64_t v31 = v25;
  v75 = v21;
  do
  {
    uint64_t v32 = 0LL;
    while (1)
    {
      uint64_t v33 = v80[v27 + v32];
      if (v80[v27 + v32] < 0) {
        break;
      }
      if ((*(_DWORD *)(v30 + 4 * v33 + 60) & 0x40000) == 0) {
        goto LABEL_24;
      }
LABEL_30:
      ++v32;
      uint64_t v35 = v27 + v32;
      if (v27 + v32 >= v17)
      {
        if (v32 > 3)
        {
          BOOL v36 = 0;
LABEL_33:
          id v15 = v77;
          uint64_t v37 = 0LL;
          id v14 = v75;
          if (v27 >= 1 && !v36)
          {
            BOOL v36 = 0;
            uint64_t v37 = 0LL;
            v31 -= v35 - v27 == v80[v27 - 1];
          }

          goto LABEL_66;
        }

        goto LABEL_38;
      }
    }

LABEL_24:
    BOOL v34 = v33 > 0xD || ((1 << v33) & 0x2600) == 0;
    if (v32 > 3)
    {
      uint64_t v35 = v27 + v32;
      BOOL v36 = v80[v27 + v32] == 0;
      goto LABEL_33;
    }

      if (++*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) >= *(_DWORD *)(a1 + 64)) {
        goto LABEL_27;
      }
    }

    unint64_t v9 = (unint64_t)key[1];
    unint64_t v11 = *(void *)(a1 + 56);
LABEL_16:
    id v14 = malloc(0x18uLL);
    const char *v14 = -1LL;
    v14[1] = v9 & 0xFFFFFFFFFFFFFFFLL;
    *((_DWORD *)v14 + 4) = *(_DWORD *)(*(void *)(v11 + 8) + 24LL);
    if ([*(id *)(*(void *)(a1 + 32) + 16) inspectingLiveProcess]
      && [*(id *)(*(void *)(a1 + 32) + 16) usesLiteMode])
    {
      if (!v6)
      {
        free(v14);
        goto LABEL_24;
      }

      [*(id *)(*(void *)(a1 + 32) + 16) liteMSLPayloadforMallocAddress:key[0] size:(unint64_t)key[1] & 0xFFFFFFFFFFFFFFFLL];
      uniquing_table_index = msl_payload_get_uniquing_table_index();
    }

    else
    {
      if (![*(id *)(*(void *)(a1 + 32) + 16) usesCoreFile])
      {
LABEL_23:
        NSMapInsert(*(NSMapTable **)(a1 + 40), key[0], v14);
        goto LABEL_24;
      }

      uniquing_table_index = [*(id *)(*(void *)(a1 + 32) + 16) stackIDForNode:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
    }

    const char *v14 = uniquing_table_index;
    goto LABEL_23;
  }

  return (VMUTask *)v10;
}

  [v3 appendString:@"  CS_TAINTED"];
  if ((a1 & 0x400) != 0) {
    goto LABEL_25;
  }
LABEL_12:
  if ((a1 & 0x800) != 0) {
LABEL_13:
  }
    [v3 appendString:@"  REUSABLE"];
  return v3;
}

        unint64_t v5 = v34;
        a4 = v35;
      }
  }

  CSSymbolicatorGetSymbolWithAddressAtTime();
  id v25 = CSSymbolGetName();
  if (v25
    && ([NSString stringWithUTF8String:v25],
        (int v26 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL)
    || (stackLogReader = self->_stackLogReader) != 0LL
    && (-[VMUStackLogReader functionNameForPCaddress:](stackLogReader, "functionNameForPCaddress:", a3),
        (int v26 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
    VMUSimplifyCPlusPlusSymbolName(v26);
    uint64_t v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

    options = self->_options;
    if ((options & 0x20) != 0 || (options & 0x40) != 0 && isSystemPath(v44))
    {
      char v49 = 0LL;
      uint64_t v30 = 0LL;
      uint64_t Range = 0LL;
      uint64_t v46 = 1;
      goto LABEL_48;
    }

    uint64_t Range = (id)CSSymbolGetRange();
    if (!Range) {
      uint64_t Range = (id)-[VMUStackLogReader functionRangeContainingPCaddress:]( self->_stackLogReader,  "functionRangeContainingPCaddress:",  a3);
    }
    uint64_t v33 = 0LL;
    if (v45)
    {
      uint64_t v30 = @"0";
      uint64_t v46 = 1;
      goto LABEL_46;
    }

    uint64_t v32 = @"%qu";
    goto LABEL_44;
  }

  uint64_t v28 = kVMUUnknownSymbolName[0];
  uint64_t Range = (id)CSSymbolOwnerGetBaseAddress();
  if (!Range && v50) {
    uint64_t Range = v50[1];
  }
  if (Range)
  {
    uint64_t v32 = @"0x%qx";
    uint64_t v33 = [MEMORY[0x189NSStringormat:@"0x%qx" Range];
LABEL_44:
    [MEMORY[0x189NSStringormat:v32, a3 - (void)Range];
    uint64_t v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v46 = 0;
    goto LABEL_45;
  }

  uint64_t v46 = 0;
  uint64_t v30 = 0LL;
  uint64_t v33 = 0LL;
LABEL_45:
  uint64_t Range = (id)a3;
LABEL_46:
  char v49 = (void *)v33;
  if (Range)
  {
    [MEMORY[0x189NSStringormat:@"0x%qx", Range];
    uint64_t Range = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_38:
    uint64_t v35 = v27;
    if (v27 >= v29)
    {
LABEL_52:
      if (v35 - v27 > 7)
      {
        BOOL v36 = 0;
        uint64_t v37 = 1LL;
        id v14 = v75;
        goto LABEL_65;
      }

  ((void (**)(void, const char *, void *))v27)[2](v27, "      ", v22);
LABEL_40:
  uint64_t v31 = v28;

  return v31;
}

      uint64_t v30 = [(id)v13 findOrAddChildWithName:v28 address:key nodeSearchType:1 isLeafNode:0];

LABEL_39:
      *(_DWORD *)(v30 + 40) += v36;
      *(void *)(v30 + 32) += v35;
      id v13 = v30;
      goto LABEL_40;
    }

  int v41 = &stru_189E010C8;
  if ((a3 & 0x10) != 0)
  {
    if (self->purgeable == 3)
    {
      if (-[NSString length](self->path, "length")) {
        uint64_t v42 = (a3 & 0x80000) == 0;
      }
      else {
        uint64_t v42 = 0;
      }
      if (v42) {
        int v41 = @"        ";
      }
      else {
        int v41 = &stru_189E010C8;
      }
    }

    else
    {
      char v45 = objc_alloc(NSString);
      purgeable = self->purgeable;
      else {
        uint64_t v47 = dword_18616BE80[purgeable];
      }
      int v41 = (__CFString *)[v45 initWithFormat:@" PURGE=%c" v47];
    }
  }

  int64_t v48 = (__CFString *)self->type;
  if (!v48) {
    int64_t v48 = &stru_189E010C8;
  }
  char v49 = v48;
  if ((unint64_t)-[__CFString length](v49, "length") >= 0x19)
  {
    int v50 = -[__CFString substringToIndex:](v49, "substringToIndex:", 24LL);

    char v49 = (__CFString *)v50;
  }

  if ((a3 & 0x2000) == 0)
  {
    if ((a3 & 0x200) == 0)
    {
      char v51 = maxVMAddressWidth_addressWidth;
      if (!maxVMAddressWidth_addressWidth)
      {
        int v52 = flsll(0xFC0000000LL);
        unint64_t v53 = v52 + 3;
        if (v52 < -3) {
          unint64_t v53 = v52 + 6;
        }
        char v51 = (v53 >> 2);
        maxVMAddressWidth_addressWidth = v53 >> 2;
      }

      if (-[VMUVMRegion isOwnedUnmappedMemory](self, "isOwnedUnmappedMemory"))
      {
        uint64_t v54 = (void *)NSString;
        v55 = "unmapped";
      }

      else
      {
        if (!-[VMUVMRegion isKernelPageTableMemory](self, "isKernelPageTableMemory"))
        {
          location = self->range.location;
          if (location < 0xFC0000001LL)
          {
            v60 = 24LL;
          }

          else
          {
            char v76 = flsll(location);
            id v77 = v76 + 3;
            if (v76 < -3) {
              id v77 = v76 + 6;
            }
            v78 = (v77 >> 2);
            v60 = (v51 - v78 + 24);
            location = self->range.location;
            char v51 = v78;
          }

          [MEMORY[0x189NSStringormat:@"%*llx", v51, location];
          v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
          [MEMORY[0x1896NSStringrmat:@"%-*llx" v51, self->range.length + self->range.location];
          uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_103;
        }

        uint64_t v54 = (void *)NSString;
        v55 = "kernel";
      }

      [v54 stringWithFormat:@"%*s", v51, v55];
      v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189NSStringormat:@"%-*s", v51, v55];
      uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = 24LL;
LABEL_103:
      v79 = (void *)NSString;
      v80 = -[__CFString UTF8String](v49, "UTF8String");
      v81 = self->share_mode - 1;
      if (v81 > 6) {
        uint64_t v82 = "   ";
      }
      else {
        uint64_t v82 = off_189E00290[(char)v81];
      }
      [v79 stringWithFormat:@"%-*s %@-%@ [%@] %s/%s SM=%s%@  %@", v60, v80, v58, v59, v39, off_189E00250[self->prot & 7], off_189E00250[self->maxProt & 7], v82, v41, v14];
      goto LABEL_107;
    }

    if (-[VMUVMRegion isOwnedUnmappedMemory](self, "isOwnedUnmappedMemory"))
    {
      v58 = @"unmapped";
    }

    else
    {
      if (!-[VMUVMRegion isKernelPageTableMemory](self, "isKernelPageTableMemory"))
      {
        [MEMORY[0x189NSStringormat:@"%#llx" self->range.location];
        v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
        [MEMORY[0x1896NSStringrmat:@"%#llx" , self->range.length + self->range.location];
        uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_100;
      }

      v58 = @"kernel";
    }

    uint64_t v59 = v58;
LABEL_100:
    [NSString stringWithFormat:@"%s %@-%@ [%@] %s/%s %@", -[__CFString UTF8String](v49, "UTF8String"), v58, v59, v39, off_189E00250[self->prot & 7], off_189E00250[self->maxProt & 7], v14, v84, v85, v86];
LABEL_107:
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_108;
  }

  if (-[__CFString isEqualToString:](v49, "isEqualToString:", @"__DATA"))
  {
    uint64_t v56 = -[__CFString lastPathComponent](v14, "lastPathComponent");

    id v14 = (__CFString *)v56;
  }

  v57 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ %@", v49, v14];
LABEL_108:

  objc_autoreleasePoolPop(v11);
  return v57;
}

  return v58;
}

LABEL_57:
      id v14 = v75;
      if ((v76 & 1) == 0)
      {
        id v15 = v77;
        goto LABEL_61;
      }

      id v15 = v77;
      if ((unint64_t)v31 < v73)
      {
        *(_WORD *)uint64_t v31 = 30768;
        v31 += 2;
LABEL_61:
        if ((unint64_t)v31 < v73)
        {
          char v76 = 0;
          int v41 = v80;
          *uint64_t v31 = stringFromMappedNSCFData_hex[(unint64_t)v80[v27] >> 4];
          v31[1] = stringFromMappedNSCFData_hex[v41[v27] & 0xF];
          goto LABEL_75;
        }
      }

    objc_autoreleasePoolPop(v2);
  }

  else
  {
    unint64_t v5 = 0LL;
  }

  return v5;
}

        ++v25;
        if (!--v26)
        {
          nodeAdjIndex = self->_nodeAdjIndex;
          id v21 = self->_indexedNodeSpace;
          uint64_t v18 = v51;
          break;
        }
      }
    }

    if (v18 < v21)
    {
      uint64_t v47 = self->_edges;
      int64_t v48 = (int)v18 + 1 >= v21;
      char v49 = &self->_indexedEdges;
      if (!v48) {
        char v49 = &nodeAdjIndex[(v18 + 1)];
      }
      if (v47)
      {
        int v50 = nodeAdjIndex[v18];
        if (*v49 != v50 && v47[v50].var0 == -3 && (_DWORD)v18 != v47[v50].var2) {
          continue;
        }
      }
    }

    id v13 = (_DWORD *)v52[2](v52, v18, v53[v18]);
    v53[v18] = (char)v13;
  }

  while (v16 != v17);
  free(v12);
}

LABEL_104:
      free(v71);
      unint64_t v20 = 0LL;
      id v13 = v78;
      BOOL v22 = v72;
      goto LABEL_117;
    }

    uint64_t v38 = 0LL;
    while (2)
    {
      if (!v80[v27 + v38])
      {
        uint64_t v39 = v80[v27 + 1 + v38];
        if (v80[v27 + 1 + v38] < 0)
        {
          if (!__maskrune(v80[v27 + 1 + v38], 0x40000uLL))
          {
LABEL_45:
            BOOL v40 = v39 > 0xD || ((1 << v39) & 0x2600) == 0;
          }
        }

        else if ((*(_DWORD *)(v30 + 4 * v39 + 60) & 0x40000) == 0)
        {
          goto LABEL_45;
        }

        v38 += 2LL;
        uint64_t v35 = v27 + v38;
        if (v27 + v38 >= v29) {
          goto LABEL_52;
        }
        continue;
      }

      break;
    }

    if (v38 <= 7) {
      goto LABEL_57;
    }
    uint64_t v35 = v27 + v38;
    id v14 = v75;
    if (v80[v27 + v38]) {
      BOOL v36 = 0;
    }
    else {
      BOOL v36 = v80[v27 + 1 + v38] == 0;
    }
    uint64_t v37 = 1LL;
LABEL_65:
    id v15 = v77;
LABEL_66:
    if (v31 >= &v74[v27 - v35 - 4]) {
      goto LABEL_104;
    }
    *(_WORD *)uint64_t v31 = 8736;
    v31 += 2;
    if (v27 >= v35)
    {
      uint64_t v42 = v27;
    }

    else
    {
      do
      {
        uint64_t v42 = v27 + v37 + 1;
        *v31++ = v80[v37 + v27];
        ++v28;
        uint64_t v27 = v42;
      }

      while (v42 < v35);
    }

    *(_WORD *)uint64_t v31 = 8226;
    if (v36) {
      uint64_t v43 = v37;
    }
    else {
      uint64_t v43 = -1LL;
    }
    uint64_t v27 = v43 + v42;
    char v76 = 1;
LABEL_75:
    v31 += 2;
    ++v27;
  }

  while (v27 < v17);
LABEL_100:
  if (v31 >= v74) {
    goto LABEL_104;
  }
  *uint64_t v31 = 0;
  if (v17 >= 128 && (double)v28 * 100.0 / (double)v17 <= 25.0)
  {
    id v62 = v15;
    id v63 = v14;
    CC_SHA256_Init(&c);
    uint64_t v64 = 0LL;
    uint64_t v65 = 0x100000LL;
    BOOL v22 = v72;
    do
    {
      if (v17 - v64 < v65) {
        uint64_t v65 = v17 - v64;
      }
      CC_SHA256_Update(&c, &v80[v64], v65);
      v64 += v65;
    }

    while (v64 < v17);
    CC_SHA256_Final(md, &c);
    id v66 = objc_alloc_init(MEMORY[0x189607940]);
    uint64_t v67 = 0LL;
    id v13 = v78;
    do
      [v66 appendFormat:@"%02x", md[v67++]];
    while (v67 != 16);
    [NSString stringWithFormat:@"%@: %.128s...   SHA256: %@", v72, v71, v66];
    unint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

    id v14 = v63;
    id v15 = v62;
    v61 = v71;
  }

  else
  {
    v61 = v71;
    BOOL v22 = v72;
    [NSString stringWithFormat:@"%@: %s", v72, v71];
    unint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v13 = v78;
  }

  free(v61);
LABEL_117:

LABEL_118:
  return v20;
}

void __stringFromMappedNSCFData_block_invoke()
{
  UInt8 bytes = 97;
  CFDataRef v0 = CFDataCreate(0LL, &bytes, 1LL);
  stringFromMappedNSCFData_cfDataSize = malloc_size(v0);
  CFRelease(v0);
}

void task_peek_if_pages_exist(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a1;
  *a4 = 0LL;
  uint64_t v8 = *MEMORY[0x1895FD560];
  if (*MEMORY[0x1895FD560] >= *MEMORY[0x1895FD578]) {
    uint64_t v8 = *MEMORY[0x1895FD578];
  }
  uint64_t v9 = a2 & ~v8;
  unint64_t v10 = ((a3 + a2 + v8) & ~v8) - v9;
  unint64_t v11 = *MEMORY[0x1895FD568];
  if (*MEMORY[0x1895FD568] >= *MEMORY[0x1895FD590]) {
    unint64_t v11 = *MEMORY[0x1895FD590];
  }
  unint64_t v18 = v10 / v11;
  unint64_t v12 = malloc(4 * (v10 / v11));
  [v7 memoryCache];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  int v14 = [v13 machVMPageRangeQueryWithAddress:v9 size:v10 dispositions:v12 dispositionsCount:&v18];

  if (!v14)
  {
    if (!v18)
    {
LABEL_12:
      [v7 memoryCache];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 peekAtAddress:a2 size:a3 returnsBuf:a4];

      goto LABEL_13;
    }

    if ((*v12 & 0x91) != 0)
    {
      unint64_t v15 = 0LL;
      while (v18 - 1 != v15)
      {
        int v16 = *(_DWORD *)&v12[4 * v15++ + 4];
        if ((v16 & 0x91) == 0)
        {
          if (v15 < v18) {
            goto LABEL_13;
          }
          goto LABEL_12;
        }
      }

      goto LABEL_12;
    }
  }

uint64_t checkStringIsValidHexAddress(void *a1)
{
  id v1 = a1;
  [v1 substringFromIndex:2];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 uppercaseString];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189607810] characterSetWithCharactersInString:@"0123456789ABCDEF"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 invertedSet];
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = [v3 rangeOfCharacterFromSet:v5];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v7 = 1LL;
  }
  else {
LABEL_6:
  }
    uint64_t v7 = 0LL;

  return v7;
}

void invertRecursiveWithNewInvertedRoot(void *a1, void *a2, void *a3)
{
  id v23 = a1;
  id v5 = a2;
  id v6 = a3;
  [v6 addObject:v23];
  int v7 = [v23 numChildren];
  if (v7)
  {
    int v8 = v7;
    uint64_t v9 = [v23 pseudoNodeTopOfStackChild];
    uint64_t v10 = v9;
    if (v9) {
      invertRecursiveWithNewInvertedRoot(v9, v5, v6);
    }
    uint64_t v11 = 0LL;
    do
    {
      [v23 childAtIndex:v11];
      unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      invertRecursiveWithNewInvertedRoot(v12, v5, v6);

      uint64_t v11 = (v11 + 1);
    }

    while (v8 != (_DWORD)v11);
  }

  else
  {
    id v13 = v5;
    id v14 = v6;
    uint64_t v15 = [v14 lastObject];
    BOOL v22 = (void *)v15;
    if (v15
      && (int v16 = *(_DWORD *)(v15 + 40),
          uint64_t v17 = *(void *)(v15 + 32),
          *((_DWORD *)v13 + 10) += v16,
          *((void *)v13 + 4) += v17,
          (uint64_t v18 = objc_msgSend(v14, "count", v15)) != 0))
    {
      uint64_t v19 = v18 - 1;
      do
      {
        [v14 objectAtIndex:v19];
        unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        [v20 name];
        id v21 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v10 = [v13 findOrAddChildWithName:v21 address:[v20 address] nodeSearchType:1 isLeafNode:0];

        *(_DWORD *)(v10 + 40) += v16;
        *(void *)(v10 + 32) += v17;

        --v19;
        id v13 = (id)v10;
      }

      while (v19 != -1);
    }

    else
    {
      uint64_t v10 = (uint64_t)v13;
    }
  }

  [v6 removeLastObject];
}

BOOL isSystemPath(const char *a1)
{
  if (!a1) {
    return 1LL;
  }
  if (!strncmp(a1, "/System/", 8uLL)) {
    return 1LL;
  }
  return strncmp(a1, "/usr/", 5uLL) == 0;
}

uint64_t __printTotalNumberInStack_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = [*(id *)(a1 + 32) countForObject:v5];
  unint64_t v8 = [*(id *)(a1 + 32) countForObject:v6];
  if (v7 <= v8)
  {
    if (v7 >= v8) {
      uint64_t v9 = [v5 compare:v6];
    }
    else {
      uint64_t v9 = 1LL;
    }
  }

  else
  {
    uint64_t v9 = -1LL;
  }

  return v9;
}

uint64_t __printCollapsedTops_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = NSMapGet(*(NSMapTable **)(a1 + 32), v5);
  unint64_t v8 = NSMapGet(*(NSMapTable **)(a1 + 32), v6);
  if (*v7 <= *v8)
  {
    if (*v7 >= *v8) {
      uint64_t v9 = [v5 compare:v6];
    }
    else {
      uint64_t v9 = 1LL;
    }
  }

  else
  {
    uint64_t v9 = -1LL;
  }

  return v9;
}

void sub_186106C28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_186106E08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1861071F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_186107314(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL CompareRangeAndString(void *a1, void *a2)
{
  return *a1 < *a2;
}

void sub_1861074A0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

void sub_186107640( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_18610787C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_186107A08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_186107AA8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_186107C40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAndString>>( uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

void std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*,false>( uint64_t a1, __int128 *a2, uint64_t (**a3)(__int128 *, __int128 *), uint64_t a4, char a5, __n128 a6)
{
LABEL_1:
  uint64_t v10 = (__int128 *)((char *)a2 - 24);
  uint64_t v11 = (__int128 *)a1;
LABEL_2:
  uint64_t v12 = 1 - a4;
  while (2)
  {
    a1 = (uint64_t)v11;
    uint64_t v13 = v12;
    uint64_t v14 = (char *)a2 - (char *)v11;
    unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)v11) >> 3);
    switch(v15)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        if ((*a3)((__int128 *)((char *)a2 - 24), v11))
        {
          uint64_t v30 = *((void *)v11 + 2);
          __int128 v28 = *v11;
          __int128 v26 = *v10;
          *((void *)v11 + 2) = *((void *)a2 - 1);
          *uint64_t v11 = v26;
          *uint64_t v10 = v28;
          *((void *)a2 - 1) = v30;
        }

        return;
      case 3uLL:
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>( v11,  (__int128 *)((char *)v11 + 24),  (__int128 *)((char *)a2 - 24),  a3);
        return;
      case 4uLL:
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>( (uint64_t)v11,  (uint64_t)v11 + 24,  (uint64_t)(v11 + 3),  (uint64_t)a2 - 24,  a3);
        return;
      case 5uLL:
        std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>( (__n128 *)v11,  (uint64_t)v11 + 24,  (uint64_t)(v11 + 3),  (uint64_t)v11 + 72,  (uint64_t)a2 - 24,  a3);
        return;
      default:
        if (v14 <= 575)
        {
          if ((a5 & 1) != 0) {
            std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>( (uint64_t)v11,  (uint64_t)a2,  (uint64_t (**)(uint64_t, uint64_t))a3);
          }
          else {
            std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>( (uint64_t)v11,  (uint64_t)a2,  (uint64_t (**)(uint64_t, uint64_t))a3);
          }
          return;
        }

        if (v13 != 1)
        {
          unint64_t v16 = v15 >> 1;
          uint64_t v17 = (__int128 *)((char *)v11 + 24 * (v15 >> 1));
          if ((unint64_t)v14 < 0xC01)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>( (__int128 *)((char *)v11 + 24 * v16),  v11,  (__int128 *)((char *)a2 - 24),  a3);
            if ((a5 & 1) != 0) {
              goto LABEL_11;
            }
          }

          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>( v11,  (__int128 *)((char *)v11 + 24 * v16),  (__int128 *)((char *)a2 - 24),  a3);
            uint64_t v18 = 3 * v16;
            uint64_t v19 = (__int128 *)((char *)v11 + 24 * v16 - 24);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>( (__int128 *)((char *)v11 + 24),  v19,  a2 - 3,  a3);
            unint64_t v20 = v11 + 3;
            id v21 = (__int128 *)((char *)v11 + 8 * v18 + 24);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>( v20,  v21,  (__int128 *)((char *)a2 - 72),  a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>( v19,  v17,  v21,  a3);
            uint64_t v29 = *(void *)(a1 + 16);
            __int128 v27 = *(_OWORD *)a1;
            __int128 v22 = *v17;
            *(void *)(a1 + 16) = *((void *)v17 + 2);
            *(_OWORD *)a1 = v22;
            *((void *)v17 + 2) = v29;
            *uint64_t v17 = v27;
            if ((a5 & 1) != 0) {
              goto LABEL_11;
            }
          }

          if (((*a3)((__int128 *)(a1 - 24), (__int128 *)a1) & 1) == 0)
          {
            uint64_t v11 = std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,RangeAndString *,BOOL (*&)(RangeAndString const&,RangeAndString const&)>( (__int128 *)a1,  a2,  a3);
            goto LABEL_16;
          }

uint64_t std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>( uint64_t result, uint64_t a2, uint64_t (**a3)(uint64_t, uint64_t))
{
  if (result != a2)
  {
    uint64_t v17 = v3;
    uint64_t v18 = v4;
    uint64_t v6 = result;
    uint64_t v7 = result + 24;
    if (result + 24 != a2)
    {
      uint64_t v9 = 0LL;
      uint64_t v10 = result;
      do
      {
        uint64_t v11 = v10;
        uint64_t v10 = v7;
        mach_vm_address_t result = (*a3)(v7, v11);
        if ((_DWORD)result)
        {
          __int128 v15 = *(_OWORD *)v10;
          uint64_t v16 = *(void *)(v10 + 16);
          uint64_t v12 = v9;
          while (1)
          {
            uint64_t v13 = v6 + v12;
            *(_OWORD *)(v13 + 24) = *(_OWORD *)(v6 + v12);
            *(void *)(v13 + 40) = *(void *)(v6 + v12 + 16);
            if (!v12) {
              break;
            }
            v12 -= 24LL;
            mach_vm_address_t result = (*a3)((uint64_t)&v15, v12 + v6);
            if ((result & 1) == 0)
            {
              uint64_t v14 = v6 + v12 + 24;
              goto LABEL_10;
            }
          }

          uint64_t v14 = v6;
LABEL_10:
          *(_OWORD *)uint64_t v14 = v15;
          *(void *)(v14 + 16) = v16;
        }

        uint64_t v7 = v10 + 24;
        v9 += 24LL;
      }

      while (v10 + 24 != a2);
    }
  }

  return result;
}

uint64_t std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>( uint64_t result, uint64_t a2, uint64_t (**a3)(uint64_t, uint64_t))
{
  if (result != a2)
  {
    uint64_t v14 = v3;
    uint64_t v15 = v4;
    uint64_t v6 = result;
    uint64_t v7 = result + 24;
    if (result + 24 != a2)
    {
      uint64_t v9 = result - 24;
      do
      {
        uint64_t v10 = v6;
        uint64_t v6 = v7;
        mach_vm_address_t result = (*a3)(v7, v10);
        if ((_DWORD)result)
        {
          __int128 v12 = *(_OWORD *)v6;
          uint64_t v13 = *(void *)(v6 + 16);
          uint64_t v11 = v9;
          do
          {
            *(_OWORD *)(v11 + 4_Block_object_dispose(va, 8) = *(_OWORD *)(v11 + 24);
            *(void *)(v11 + 64) = *(void *)(v11 + 40);
            mach_vm_address_t result = (*a3)((uint64_t)&v12, v11);
            v11 -= 24LL;
          }

          while ((result & 1) != 0);
          *(_OWORD *)(v11 + 4_Block_object_dispose(va, 8) = v12;
          *(void *)(v11 + 64) = v13;
        }

        uint64_t v7 = v6 + 24;
        v9 += 24LL;
      }

      while (v6 + 24 != a2);
    }
  }

  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>( __int128 *a1, __int128 *a2, __int128 *a3, uint64_t (**a4)(__int128 *, __int128 *))
{
  char v8 = (*a4)(a2, a1);
  uint64_t result = (*a4)(a3, a2);
  if ((v8 & 1) == 0)
  {
    if (!(_DWORD)result) {
      return result;
    }
    uint64_t v13 = *((void *)a2 + 2);
    __int128 v14 = *a2;
    uint64_t v15 = *((void *)a3 + 2);
    *a2 = *a3;
    *((void *)a2 + 2) = v15;
    *a3 = v14;
    *((void *)a3 + 2) = v13;
    uint64_t v16 = *((void *)a1 + 2);
    __int128 v17 = *a1;
    uint64_t v18 = *((void *)a2 + 2);
    *a1 = *a2;
    *((void *)a1 + 2) = v18;
    *a2 = v17;
    *((void *)a2 + 2) = v16;
    return 2LL;
  }

  if (!(_DWORD)result)
  {
    uint64_t v19 = *((void *)a1 + 2);
    __int128 v20 = *a1;
    uint64_t v21 = *((void *)a2 + 2);
    *a1 = *a2;
    *((void *)a1 + 2) = v21;
    *a2 = v20;
    *((void *)a2 + 2) = v19;
    uint64_t v22 = *((void *)a2 + 2);
    __int128 v23 = *a2;
    uint64_t v24 = *((void *)a3 + 2);
    *a2 = *a3;
    *((void *)a2 + 2) = v24;
    *a3 = v23;
    *((void *)a3 + 2) = v22;
    return 2LL;
  }

  uint64_t v10 = *((void *)a1 + 2);
  __int128 v11 = *a1;
  uint64_t v12 = *((void *)a3 + 2);
  *a1 = *a3;
  *((void *)a1 + 2) = v12;
  *a3 = v11;
  *((void *)a3 + 2) = v10;
  return 1LL;
}

__int128 *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,RangeAndString *,BOOL (*&)(RangeAndString const&,RangeAndString const&)>( __int128 *a1, __int128 *a2, uint64_t (**a3)(__int128 *, __int128 *))
{
  uint64_t v4 = a2;
  __int128 v16 = *a1;
  uint64_t v17 = *((void *)a1 + 2);
  if (((*a3)(&v16, (__int128 *)((char *)a2 - 24)) & 1) != 0)
  {
    uint64_t v6 = a1;
    do
      uint64_t v6 = (__int128 *)((char *)v6 + 24);
    while (((*a3)(&v16, v6) & 1) == 0);
  }

  else
  {
    uint64_t v7 = (__int128 *)((char *)a1 + 24);
    do
    {
      uint64_t v6 = v7;
      if (v7 >= v4) {
        break;
      }
      int v8 = (*a3)(&v16, v7);
      uint64_t v7 = (__int128 *)((char *)v6 + 24);
    }

    while (!v8);
  }

  if (v6 < v4)
  {
    do
      uint64_t v4 = (__int128 *)((char *)v4 - 24);
    while (((*a3)(&v16, v4) & 1) != 0);
  }

  while (v6 < v4)
  {
    __int128 v9 = *v6;
    uint64_t v19 = *((void *)v6 + 2);
    __int128 v18 = v9;
    __int128 v10 = *v4;
    *((void *)v6 + 2) = *((void *)v4 + 2);
    *uint64_t v6 = v10;
    __int128 v11 = v18;
    *((void *)v4 + 2) = v19;
    *uint64_t v4 = v11;
    do
      uint64_t v6 = (__int128 *)((char *)v6 + 24);
    while (!(*a3)(&v16, v6));
    do
      uint64_t v4 = (__int128 *)((char *)v4 - 24);
    while (((*a3)(&v16, v4) & 1) != 0);
  }

  uint64_t v12 = (__int128 *)((char *)v6 - 24);
  if ((__int128 *)((char *)v6 - 24) != a1)
  {
    __int128 v13 = *v12;
    *((void *)a1 + 2) = *((void *)v6 - 1);
    *a1 = v13;
  }

  __int128 v14 = v16;
  *((void *)v6 - 1) = v17;
  __int128 *v12 = v14;
  return v6;
}

uint64_t std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,RangeAndString *,BOOL (*&)(RangeAndString const&,RangeAndString const&)>( __int128 *a1, unint64_t a2, uint64_t (**a3)(char *, __int128 *))
{
  uint64_t v6 = 0LL;
  __int128 v17 = *a1;
  uint64_t v18 = *((void *)a1 + 2);
  do
    v6 += 24LL;
  while (((*a3)((char *)a1 + v6, &v17) & 1) != 0);
  unint64_t v7 = (unint64_t)a1 + v6;
  uint64_t v8 = (uint64_t)a1 + v6 - 24;
  if (v6 == 24)
  {
    do
    {
      if (v7 >= a2) {
        break;
      }
      a2 -= 24LL;
    }

    while (((*a3)((char *)a2, &v17) & 1) == 0);
  }

  else
  {
    do
      a2 -= 24LL;
    while (!(*a3)((char *)a2, &v17));
  }

  if (v7 < a2)
  {
    __int128 v9 = (__int128 *)((char *)a1 + v6);
    unint64_t v10 = a2;
    do
    {
      __int128 v19 = *v9;
      __int128 v11 = v19;
      uint64_t v20 = *((void *)v9 + 2);
      uint64_t v12 = v20;
      uint64_t v13 = *(void *)(v10 + 16);
      *__int128 v9 = *(_OWORD *)v10;
      *((void *)v9 + 2) = v13;
      *(void *)(v10 + 16) = v12;
      *(_OWORD *)unint64_t v10 = v11;
      do
        __int128 v9 = (__int128 *)((char *)v9 + 24);
      while (((*a3)((char *)v9, &v17) & 1) != 0);
      do
        v10 -= 24LL;
      while (!(*a3)((char *)v10, &v17));
    }

    while ((unint64_t)v9 < v10);
    uint64_t v8 = (uint64_t)v9 - 24;
  }

  if ((__int128 *)v8 != a1)
  {
    __int128 v14 = *(_OWORD *)v8;
    *((void *)a1 + 2) = *(void *)(v8 + 16);
    *a1 = v14;
  }

  __int128 v15 = v17;
  *(void *)(v8 + 16) = v18;
  *(_OWORD *)uint64_t v8 = v15;
  return v8;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>( uint64_t a1, uint64_t a2, uint64_t (**a3)(__int128 *, __int128 *))
{
  unint64_t v6 = 0xAAAAAAAAAAAAAAABLL * ((a2 - a1) >> 3);
  BOOL result = 1LL;
  switch(v6)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      uint64_t v8 = (__int128 *)(a2 - 24);
      if ((*a3)((__int128 *)(a2 - 24), (__int128 *)a1))
      {
        uint64_t v9 = *(void *)(a1 + 16);
        __int128 v10 = *(_OWORD *)a1;
        uint64_t v11 = *(void *)(a2 - 8);
        *(_OWORD *)a1 = *v8;
        *(void *)(a1 + 16) = v11;
        __int128 *v8 = v10;
        *(void *)(a2 - _Block_object_dispose(va, 8) = v9;
      }

      return 1LL;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>( (__int128 *)a1,  (__int128 *)(a1 + 24),  (__int128 *)(a2 - 24),  a3);
      return 1LL;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>( a1,  a1 + 24,  a1 + 48,  a2 - 24,  a3);
      return 1LL;
    case 5uLL:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>( (__n128 *)a1,  a1 + 24,  a1 + 48,  a1 + 72,  a2 - 24,  a3);
      return 1LL;
    default:
      uint64_t v12 = (__int128 *)(a1 + 48);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>( (__int128 *)a1,  (__int128 *)(a1 + 24),  (__int128 *)(a1 + 48),  a3);
      uint64_t v13 = a1 + 72;
      if (a1 + 72 == a2) {
        return 1LL;
      }
      uint64_t v14 = 0LL;
      int v15 = 0;
      break;
  }

  while (1)
  {
    if ((*a3)((__int128 *)v13, v12))
    {
      __int128 v19 = *(_OWORD *)v13;
      uint64_t v20 = *(void *)(v13 + 16);
      uint64_t v16 = v14;
      while (1)
      {
        uint64_t v17 = a1 + v16;
        *(_OWORD *)(v17 + 72) = *(_OWORD *)(a1 + v16 + 48);
        *(void *)(v17 + 8_Block_object_dispose(va, 8) = *(void *)(a1 + v16 + 64);
        if (v16 == -48) {
          break;
        }
        v16 -= 24LL;
        if (((*a3)(&v19, (__int128 *)(v17 + 24)) & 1) == 0)
        {
          uint64_t v18 = a1 + v16 + 72;
          goto LABEL_12;
        }
      }

      uint64_t v18 = a1;
LABEL_12:
      *(_OWORD *)uint64_t v18 = v19;
      *(void *)(v18 + 16) = v20;
      if (++v15 == 8) {
        return v13 + 24 == a2;
      }
    }

    uint64_t v12 = (__int128 *)v13;
    v14 += 24LL;
    v13 += 24LL;
    if (v13 == a2) {
      return 1LL;
    }
  }

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (**a5)(__int128 *, __int128 *))
{
  if ((*a5)((__int128 *)a4, (__int128 *)a3))
  {
    uint64_t v11 = *(void *)(a3 + 16);
    __int128 v12 = *(_OWORD *)a3;
    uint64_t v13 = *(void *)(a4 + 16);
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *(void *)(a3 + 16) = v13;
    *(_OWORD *)a4 = v12;
    *(void *)(a4 + 16) = v11;
    if ((*a5)((__int128 *)a3, (__int128 *)a2))
    {
      uint64_t v14 = *(void *)(a2 + 16);
      __int128 v15 = *(_OWORD *)a2;
      uint64_t v16 = *(void *)(a3 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(void *)(a2 + 16) = v16;
      *(_OWORD *)a3 = v15;
      *(void *)(a3 + 16) = v14;
      if ((*a5)((__int128 *)a2, (__int128 *)a1))
      {
        uint64_t v17 = *(void *)(a1 + 16);
        __n128 result = *(__n128 *)a1;
        uint64_t v18 = *(void *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(void *)(a1 + 16) = v18;
        *(__n128 *)a2 = result;
        *(void *)(a2 + 16) = v17;
      }
    }
  }

  return result;
}

__n128 std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>( __n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (**a6)(__int128 *, __int128 *))
{
  __n128 v12 = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>( (uint64_t)a1,  a2,  a3,  a4,  a6);
  if (((unsigned int (*)(uint64_t, uint64_t, __n128))*a6)(a5, a4, v12))
  {
    uint64_t v14 = *(void *)(a4 + 16);
    __int128 v15 = *(_OWORD *)a4;
    uint64_t v16 = *(void *)(a5 + 16);
    *(_OWORD *)a4 = *(_OWORD *)a5;
    *(void *)(a4 + 16) = v16;
    *(_OWORD *)a5 = v15;
    *(void *)(a5 + 16) = v14;
    if ((*a6)((__int128 *)a4, (__int128 *)a3))
    {
      uint64_t v17 = *(void *)(a3 + 16);
      __int128 v18 = *(_OWORD *)a3;
      uint64_t v19 = *(void *)(a4 + 16);
      *(_OWORD *)a3 = *(_OWORD *)a4;
      *(void *)(a3 + 16) = v19;
      *(_OWORD *)a4 = v18;
      *(void *)(a4 + 16) = v17;
      if ((*a6)((__int128 *)a3, (__int128 *)a2))
      {
        uint64_t v20 = *(void *)(a2 + 16);
        __n128 v21 = *(__n128 *)a2;
        uint64_t v22 = *(void *)(a3 + 16);
        *(_OWORD *)a2 = *(_OWORD *)a3;
        *(void *)(a2 + 16) = v22;
        *(__n128 *)a3 = v21;
        *(void *)(a3 + 16) = v20;
        if ((*a6)((__int128 *)a2, (__int128 *)a1))
        {
          unint64_t v23 = a1[1].n128_u64[0];
          __n128 result = *a1;
          unint64_t v24 = *(void *)(a2 + 16);
          *a1 = *(__n128 *)a2;
          a1[1].n128_u64[0] = v24;
          *(__n128 *)a2 = result;
          *(void *)(a2 + 16) = v23;
        }
      }
    }
  }

  return result;
}

__n128 *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*,RangeAndString*>( __n128 *a1, __n128 *a2, __n128 *a3, unsigned int (**a4)(uint64_t, __int8 *), __n128 a5)
{
  if (a1 != a2)
  {
    unint64_t v7 = a2;
    uint64_t v9 = (char *)a2 - (char *)a1;
    uint64_t v10 = ((char *)a2 - (char *)a1) / 24;
    if ((char *)a2 - (char *)a1 >= 25)
    {
      unint64_t v11 = (unint64_t)(v10 - 2) >> 1;
      unint64_t v12 = v11 + 1;
      uint64_t v13 = (__n128 *)((char *)a1 + 24 * v11);
      do
      {
        a5 = std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>( (uint64_t)a1,  a4,  v10,  v13);
        uint64_t v13 = (__n128 *)((char *)v13 - 24);
        --v12;
      }

      while (v12);
    }

    uint64_t v14 = v7;
    if (v7 != a3)
    {
      __int128 v15 = v7;
      do
      {
        if (((unsigned int (*)(__n128 *, __n128 *, __n128))*a4)(v15, a1, a5))
        {
          unint64_t v16 = v15[1].n128_u64[0];
          __n128 v17 = *v15;
          unint64_t v18 = a1[1].n128_u64[0];
          *__int128 v15 = *a1;
          v15[1].n128_u64[0] = v18;
          *a1 = v17;
          a1[1].n128_u64[0] = v16;
          a5 = std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>( (uint64_t)a1,  a4,  v10,  a1);
        }

        __int128 v15 = (__n128 *)((char *)v15 + 24);
      }

      while (v15 != a3);
      uint64_t v14 = a3;
    }

    if (v9 < 25)
    {
      return v14;
    }

    else
    {
      uint64_t v29 = v14;
      int64_t v19 = v9 / 0x18uLL;
      do
      {
        uint64_t v30 = v7;
        uint64_t v20 = 0LL;
        __n128 v31 = *a1;
        unint64_t v32 = a1[1].n128_u64[0];
        uint64_t v21 = (uint64_t)a1;
        do
        {
          uint64_t v22 = v21 + 24 * v20 + 24;
          uint64_t v23 = (2 * v20) | 1;
          uint64_t v24 = 2 * v20 + 2;
          if (v24 < v19 && (*a4)(v21 + 24 * v20 + 24, (__int8 *)(v21 + 24 * v20 + 48)))
          {
            v22 += 24LL;
            uint64_t v23 = v24;
          }

          __int128 v25 = *(_OWORD *)v22;
          *(void *)(v21 + 16) = *(void *)(v22 + 16);
          *(_OWORD *)uint64_t v21 = v25;
          uint64_t v21 = v22;
          uint64_t v20 = v23;
        }

        while (v23 <= (uint64_t)((unint64_t)(v19 - 2) >> 1));
        unint64_t v7 = (__n128 *)((char *)v30 - 24);
        if ((__int8 *)v22 == &v30[-2].n128_i8[8])
        {
          *(void *)(v22 + 16) = v32;
          *(__n128 *)uint64_t v22 = v31;
        }

        else
        {
          __n128 v26 = *v7;
          *(void *)(v22 + 16) = v30[-1].n128_u64[1];
          *(__n128 *)uint64_t v22 = v26;
          __n128 *v7 = v31;
          v30[-1].n128_u64[1] = v32;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>( (uint64_t)a1,  v22 + 24,  (uint64_t (**)(__int128 *, __int128 *))a4,  0xAAAAAAAAAAAAAAABLL * ((v22 + 24 - (uint64_t)a1) >> 3));
        }
      }

      while (v19-- > 2);
      return v29;
    }
  }

  return a3;
}

__n128 std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>( uint64_t a1, unsigned int (**a2)(uint64_t, __int8 *), uint64_t a3, __n128 *a4)
{
  unint64_t v6 = a3 - 2;
  if (a3 >= 2)
  {
    uint64_t v22 = v4;
    uint64_t v23 = v5;
    unint64_t v7 = a4;
    uint64_t v9 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) >= (uint64_t)(0xAAAAAAAAAAAAAAABLL * (((uint64_t)a4 - a1) >> 3)))
    {
      uint64_t v12 = (0x5555555555555556LL * (((uint64_t)a4 - a1) >> 3)) | 1;
      uint64_t v13 = (__n128 *)(a1 + 24 * v12);
      uint64_t v14 = 0x5555555555555556LL * (((uint64_t)a4 - a1) >> 3) + 2;
      if (v14 < a3 && (*a2)(a1 + 24 * v12, &v13[1].n128_i8[8]))
      {
        uint64_t v13 = (__n128 *)((char *)v13 + 24);
        uint64_t v12 = v14;
      }

      if ((((uint64_t (*)(__n128 *, __n128 *))*a2)(v13, v7) & 1) == 0)
      {
        __n128 v20 = *v7;
        unint64_t v21 = v7[1].n128_u64[0];
        do
        {
          unint64_t v16 = v13;
          __n128 v17 = *v13;
          v7[1].n128_u64[0] = v13[1].n128_u64[0];
          __n128 *v7 = v17;
          if (v9 < v12) {
            break;
          }
          uint64_t v18 = (2 * v12) | 1;
          uint64_t v13 = (__n128 *)(a1 + 24 * v18);
          uint64_t v19 = 2 * v12 + 2;
          if (v19 < a3)
          {
            if ((*a2)(a1 + 24 * v18, &v13[1].n128_i8[8]))
            {
              uint64_t v13 = (__n128 *)((char *)v13 + 24);
              uint64_t v18 = v19;
            }
          }

          unint64_t v7 = v16;
          uint64_t v12 = v18;
        }

        while (!(*a2)((uint64_t)v13, (__int8 *)&v20));
        __n128 result = v20;
        v16[1].n128_u64[0] = v21;
        *unint64_t v16 = result;
      }
    }
  }

  return result;
}

double std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*>( uint64_t a1, uint64_t a2, uint64_t (**a3)(__int128 *, __int128 *), uint64_t a4)
{
  unint64_t v6 = a4 - 2;
  if (a4 >= 2)
  {
    uint64_t v17 = v4;
    uint64_t v18 = v5;
    unint64_t v9 = v6 >> 1;
    uint64_t v10 = (__int128 *)(a1 + 24 * (v6 >> 1));
    unint64_t v11 = (__int128 *)(a2 - 24);
    if ((*a3)(v10, (__int128 *)(a2 - 24)))
    {
      __int128 v15 = *v11;
      uint64_t v16 = *((void *)v11 + 2);
      do
      {
        uint64_t v13 = v10;
        __int128 v14 = *v10;
        *((void *)v11 + 2) = *((void *)v10 + 2);
        *unint64_t v11 = v14;
        if (!v9) {
          break;
        }
        unint64_t v9 = (v9 - 1) >> 1;
        uint64_t v10 = (__int128 *)(a1 + 24 * v9);
        unint64_t v11 = v13;
      }

      while (((*a3)(v10, &v15) & 1) != 0);
      double result = *(double *)&v15;
      __int128 *v13 = v15;
      *((void *)v13 + 2) = v16;
    }
  }

  return result;
}

void sub_18610959C(_Unwind_Exception *a1)
{
}

void sub_18610A7B0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_18610AE40( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31, uint64_t a32, uint64_t a33, uint64_t a34, char a35)
{
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

LABEL_28:
  return v14;
}

    if (!v7)
    {
      unint64_t v7 = malloc(0x10uLL);
      NSMapInsert(*(NSMapTable **)(a1 + 24), key, v7);
    }

    uint64_t v8 = v25;
    __n128 *v7 = v25;
    v7[1] = v24;
    return v8;
  }

  VMUClearCrashReporterInfo();
  uint64_t v8 = *v7;
  if (*v7)
  {
    uint64_t v9 = v7[1];
    uint64_t v24 = v9;
    __int128 v25 = v8;
    uint64_t v10 = *(_DWORD *)(a1 + 44);
    if (v9 < a3)
    {
      if ((v10 - 1) <= 2) {
        fprintf( (FILE *)*MEMORY[0x1895F89D0],  "%#llx[%llu] --> %#llx[%llu]  FAIL! READ_BYTES CACHE HIT, BUT NEED TO MAP MORE\n",  key,  a3,  v8,  v9);
      }
      goto LABEL_8;
    }

    if (v10 == 3) {
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%#llx[%llu] --> %#llx[%llu]  READ_BYTES CACHE HIT\n", key, a3, v8, v9);
    }
  }

  else
  {
    return 0LL;
  }

  return v8;
}

    __int128 v25 = (_DWORD *)a1[6];
    goto LABEL_32;
  }

  [v7 nodeDetails:a4];
  if ((v29 >> 60) - 3 > 1) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v8 = (_DWORD *)a1[6];
}

        if (var0 == v28 && ((v30 ^ v23) & 0xFFFFFFFFFFFFFFFLL) == 0)
        {
          unint64_t v32 = v23 >> 60 == v30 >> 60;
          goto LABEL_25;
        }

        if ((v4 & 1) == 0) {
          goto LABEL_31;
        }
LABEL_33:
        uint64_t v16 = (v16 + 1);
        __int128 v25 = v17 < [v12 nodeCount] - 1;
LABEL_34:
        __int128 v15 = v17 + v25;
        goto LABEL_2;
      }

      if ((v4 & 1) == 0) {
        goto LABEL_10;
      }
    }

    else
    {
      if ((_DWORD)v17 != [v12 nodeCount] - 1)
      {
        uint64_t v16 = v16;
        __int128 v25 = 1;
        goto LABEL_34;
      }

      if ((v4 & 1) == 0)
      {
        LODWORD(v19) = v8[v16];
LABEL_10:
      }
    }

    ++v16;
  }

  free(v8);
  free(v10);

  _Block_object_dispose(&__pattern4, 8);
  return v14;
}

LABEL_22:
  objc_autoreleasePoolPop(v7);
}

  [v3 appendString:@"  EXTERNAL"];
  if ((a1 & 0x100) == 0)
  {
LABEL_10:
    if ((a1 & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }

      BOOL v36 = v14;
      if (v16 != v11)
      {
        [v11 className];
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
        __n128 v20 = v19;
        if (v19
          && (([v19 hasSuffix:@" (malloc)"] & 1) != 0
           || ([v20 hasSuffix:@" (char[])"] & 1) != 0
           || ([v11 isDerivedFromStackBacktrace] & 1) != 0))
        {

          if (v16)
          {
            unint64_t v11 = 0LL;
            goto LABEL_38;
          }

    return v12;
  }

  if (a5 || !strstr(v11, "_Class"))
  {
LABEL_4:
    uint64_t v12 = 0LL;
    return v12;
  }

  if (a4 < 0x28) {
    -[VMUObjectIdentifierDriverKitSupport classInfoForDriverKitOSClassScan](self, "classInfoForDriverKitOSClassScan");
  }
  else {
    -[VMUObjectIdentifierDriverKitSupport classInfoForDriverKitOSMetaClassPrivate]( self,  "classInfoForDriverKitOSMetaClassPrivate");
  }
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  return v12;
}

  return v8;
}

void OUTLINED_FUNCTION_0_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

  ;
}

id vmuTaskMemoryCacheInitializationError(void *a1)
{
  v8[1] = *MEMORY[0x1895F89C0];
  uint64_t v1 = (void *)MEMORY[0x189607870];
  uint64_t v7 = *MEMORY[0x1896075E0];
  v8[0] = a1;
  uint64_t v2 = (void *)MEMORY[0x189603F68];
  id v3 = a1;
  [v2 dictionaryWithObjects:v8 forKeys:&v7 count:1];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 errorWithDomain:@"VMUTaskMemoryCache initialization" code:0 userInfo:v4];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_18610DED4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

void sub_18610E3CC(_Unwind_Exception *exc_buf, int a2)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    JUMPOUT(0x18610E30CLL);
  }

  _Unwind_Resume(exc_buf);
}

unsigned __int8 *_appendToBuffer( unsigned __int8 *__ptr, unsigned int *a2, unsigned int *a3, void *__src, size_t __n)
{
  unsigned int v5 = __n;
  uint64_t v8 = __ptr;
  int v9 = *a3;
  int v10 = *a2;
  if (*a3 + __n > *a2)
  {
    LODWORD(v11) = 2 * v10;
    unsigned int v12 = v10 + __n;
    else {
      size_t v11 = v11;
    }
    *a2 = v11;
    uint64_t v8 = (unsigned __int8 *)realloc(__ptr, v11);
    int v9 = *a3;
  }

  memcpy(&v8[v9], __src, v5);
  *a3 += v5;
  return v8;
}

void sub_18610EFB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18610F1E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18610F2F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _nextField(uint64_t a1, unsigned int a2, _DWORD *a3, void *a4)
{
  v19[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = *a3;
  if (v4 + 4 <= (unint64_t)a2)
  {
    uint64_t result = *(unsigned int *)(a1 + v4);
    *a3 = v4 + 4;
  }

  else
  {
    serializerLogHandle();
    unint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      _nextField(v6, v7, v8, v9, v10, v11, v12, v13);
    }

    if (a4)
    {
      __int128 v14 = (void *)MEMORY[0x189607870];
      uint64_t v15 = OOBDOMAIN;
      uint64_t v18 = *MEMORY[0x1896075E0];
      v19[0] = @"Out-of-bound access.";
      [MEMORY[0x189603F68] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 errorWithDomain:v15 code:1 userInfo:v16];
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  return result;
}

void sub_18610F434(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18610F698( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

id serializerLogHandle(void)
{
  return (id)serializerLogHandle(void)::log;
}

void sub_18610F8E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL19serializerLogHandlev_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.Symbolication", "VMUSimpleSerializer");
  uint64_t v1 = (void *)serializerLogHandle(void)::log;
  serializerLogHandle(void)::log = (uint64_t)v0;
}

void *std::__hash_table<std::__hash_value_type<char const*,unsigned int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,unsigned int>,cstring_callbacks,cstring_callbacks,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,unsigned int>,cstring_callbacks,cstring_callbacks,true>,std::allocator<std::__hash_value_type<char const*,unsigned int>>>::__emplace_unique_key_args<char const*,char const*,unsigned int &>( uint64_t a1, const char **a2, void *a3, _DWORD *a4)
{
  uint64_t v8 = *a2;
  char v9 = **a2;
  if (v9)
  {
    unint64_t v10 = 0LL;
    uint64_t v11 = (unsigned __int8 *)(v8 + 1);
    do
    {
      unint64_t v10 = 5 * v10 + v9;
      int v12 = *v11++;
      char v9 = v12;
    }

    while (v12);
  }

  else
  {
    unint64_t v10 = 0LL;
  }

  unint64_t v13 = *(void *)(a1 + 8);
  if (v13)
  {
    uint8x8_t v14 = (uint8x8_t)vcnt_s8((int8x8_t)v13);
    v14.i16[0] = vaddlv_u8(v14);
    unint64_t v15 = v14.u32[0];
    if (v14.u32[0] > 1uLL)
    {
      unint64_t v4 = v10;
      if (v10 >= v13) {
        unint64_t v4 = v10 % v13;
      }
    }

    else
    {
      unint64_t v4 = (v13 - 1) & v10;
    }

    uint64_t v16 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v16)
    {
      for (uint64_t i = *v16; i; uint64_t i = *(void **)i)
      {
        unint64_t v18 = *((void *)i + 1);
        if (v18 == v10)
        {
        }

        else
        {
          if (v15 > 1)
          {
            if (v18 >= v13) {
              v18 %= v13;
            }
          }

          else
          {
            v18 &= v13 - 1;
          }

          if (v18 != v4) {
            break;
          }
        }
      }
    }
  }

  uint64_t i = operator new(0x20uLL);
  *(void *)uint64_t i = 0LL;
  *((void *)i + 1) = v10;
  *((void *)i + 2) = *a3;
  *((_DWORD *)i + 6) = *a4;
  float v19 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v20 = *(float *)(a1 + 32);
  if (!v13 || (float)(v20 * (float)v13) < v19)
  {
    BOOL v21 = 1LL;
    if (v13 >= 3) {
      BOOL v21 = (v13 & (v13 - 1)) != 0;
    }
    unint64_t v22 = v21 | (2 * v13);
    unint64_t v23 = vcvtps_u32_f32(v19 / v20);
    if (v22 <= v23) {
      size_t v24 = v23;
    }
    else {
      size_t v24 = v22;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( a1,  v24);
    unint64_t v13 = *(void *)(a1 + 8);
    if ((v13 & (v13 - 1)) != 0)
    {
      if (v10 >= v13) {
        unint64_t v4 = v10 % v13;
      }
      else {
        unint64_t v4 = v10;
      }
    }

    else
    {
      unint64_t v4 = (v13 - 1) & v10;
    }
  }

  uint64_t v25 = *(void *)a1;
  __n128 v26 = *(void **)(*(void *)a1 + 8 * v4);
  if (v26)
  {
    *(void *)uint64_t i = *v26;
LABEL_43:
    void *v26 = i;
    goto LABEL_44;
  }

  *(void *)uint64_t i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v25 + 8 * v4) = a1 + 16;
  if (*(void *)i)
  {
    unint64_t v27 = *(void *)(*(void *)i + 8LL);
    if ((v13 & (v13 - 1)) != 0)
    {
      if (v27 >= v13) {
        v27 %= v13;
      }
    }

    else
    {
      v27 &= v13 - 1;
    }

    __n128 v26 = (void *)(*(void *)a1 + 8 * v27);
    goto LABEL_43;
  }

LABEL_44:
  ++*(void *)(a1 + 24);
  return i;
}

        if ((a3 & 0xFFFFFFFE) == 2 || v18 >= v16)
        {
          __int128 v28 = v5;
LABEL_71:
          free(v8);
          unint64_t v13 = v28;
          goto LABEL_14;
        }

        if (a3 == 4)
        {
          do
          {
            if (*((_BYTE *)v8 + v18))
            {
              [NSString stringWithUTF8String:(char *)v8 + v18];
              size_t v24 = (void *)objc_claimAutoreleasedReturnValue();
              if ([v24 length]
                && [v24 rangeOfString:@"="] != 0x7FFFFFFFFFFFFFFFLL)
              {
                -[__CFString addObject:](v5, "addObject:", v24);
                uint64_t v25 = [v24 length];
              }

              else
              {
                uint64_t v25 = strlen((const char *)v8 + v18);
              }

              v18 += v25;

              uint64_t v16 = __size;
            }

            ++v18;
          }

          while (v18 < v16);
        }
      }
    }

    goto LABEL_10;
  }

    uint64_t v16 = 0LL;
    goto LABEL_45;
  }

  uint64_t v16 = (Bytef *)malloc(v11);
  uint64_t v17 = HIWORD(v15);
  if (!HIWORD(v15))
  {
    size_t v24 = [v9 length];
    if (v24 >= v14 && (_DWORD)v12 == (_DWORD)v11 && v24 - v14 >= v11)
    {
      memcpy(v16, (const void *)([v9 bytes] + v14), v11);
      unint64_t v18 = (Bytef *)v11;
      goto LABEL_34;
    }

    NSLog(@"Malformed non-compressed header");
    goto LABEL_33;
  }

  if (v17 != 2)
  {
    unint64_t v18 = (Bytef *)v11;
    if (v17 != 1) {
      goto LABEL_34;
    }
    float v19 = v9;
    float v20 = [v19 bytes];
    BOOL v21 = [v19 length];
    memset(&strm.avail_in, 0, 104);
    strm.next_in = (Bytef *)(v20 + v14);
    unint64_t v22 = v21 - v14;
    strm.avail_in = v22;
    unint64_t v23 = inflateInit2_(&strm, 31, "1.2.12", 112);
    if ((_DWORD)v23)
    {
      NSLog(@"Unable to initialize inflate: %d (%s)", v23, strm.msg);
    }

    else
    {
      strm.next_out = v16;
      strm.avail_out = v11;
      unint64_t v27 = inflate(&strm, 4);
      inflateEnd(&strm);
      unint64_t v18 = (Bytef *)v11;
      if ((_DWORD)v27 == 1) {
        goto LABEL_34;
      }
      NSLog(@"Unable to decompress data: %d (%s)", v27, strm.msg);
    }

    goto LABEL_33;
  }

  uint64_t v25 = [v9 bytes];
  if (compression_stream_init((compression_stream *)&strm, COMPRESSION_STREAM_DECODE, COMPRESSION_LZFSE) == COMPRESSION_STATUS_ERROR)
  {
    NSLog(@"Unable to initialize compression stream.");
LABEL_33:
    unint64_t v18 = 0LL;
    goto LABEL_34;
  }

  strm.total_in = v25 + v14;
  strm.next_out = v12;
  strm.next_in = v16;
  *(void *)&strm.avail_in = v11;
  __n128 v26 = compression_stream_process((compression_stream *)&strm, 0);
  if (v26 == COMPRESSION_STATUS_ERROR)
  {
    NSLog(@"Error. Compression failed.");
    goto LABEL_33;
  }

  if (v26 == COMPRESSION_STATUS_OK)
  {
    NSLog(@"Error. Compression output buffer full.");
    goto LABEL_33;
  }

  if (v26 != COMPRESSION_STATUS_END || (unint64_t v18 = (Bytef *)(strm.next_in - v16), strm.next_in <= v16)) {
    unint64_t v18 = 0LL;
  }
  compression_stream_destroy((compression_stream *)&strm);
LABEL_34:
  if (kVMUPrintArchivingTiming)
  {
    __int128 v28 = (void *)MEMORY[0x189603F50];
    uint64_t v29 = v9;
    [v28 timeIntervalSinceReferenceDate];
    __n128 v31 = v30;
    unint64_t v32 = [v29 length];

    if (v32 <= v11) {
      uint64_t v33 = v11;
    }
    else {
      uint64_t v33 = v32;
    }
    BOOL v34 = 100.0 - (double)v32 * 100.0 / (double)v33;
    uint64_t v35 = (FILE *)*MEMORY[0x1895F89D0];
    BOOL v36 = (const char *)VMUMemorySizeString(v32);
    uint64_t v37 = (const char *)VMUMemorySizeString(v11);
    fprintf(v35, "Decompressed %s to %s (reversed %2.1f%% reduction) in %3.6fs\n", v36, v37, v34, v31 - v8);
  }

  if (a4) {
    *a4 = (unint64_t)v18;
  }
  if (v18 != (Bytef *)v11 || !v18)
  {
    free(v16);
    goto LABEL_44;
  }

void sub_18610FBD8(_Unwind_Exception *a1)
{
}

void *std::__hash_table<std::__hash_value_type<unsigned int,NSString * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,NSString * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,NSString * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,NSString * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int,NSString * {__strong}>>( uint64_t a1, unsigned int *a2, uint64_t a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
    }

    else
    {
      unint64_t v3 = ((_DWORD)v7 - 1) & v6;
    }

    char v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      unint64_t v10 = *v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == v6)
          {
            if (*((_DWORD *)v10 + 4) == (_DWORD)v6) {
              return v10;
            }
          }

          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7) {
                v11 %= v7;
              }
            }

            else
            {
              v11 &= v7 - 1;
            }

            if (v11 != v3) {
              break;
            }
          }

          unint64_t v10 = (void *)*v10;
        }

        while (v10);
      }
    }
  }

  int v12 = (void *)(a1 + 16);
  unint64_t v10 = operator new(0x20uLL);
  *unint64_t v10 = 0LL;
  v10[1] = v6;
  *((_DWORD *)v10 + 4) = *(_DWORD *)a3;
  uint64_t v13 = *(void *)(a3 + 8);
  *(void *)(a3 + _Block_object_dispose(va, 8) = 0LL;
  v10[3] = v13;
  float v14 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v15 = *(float *)(a1 + 32);
  if (!v7 || (float)(v15 * (float)v7) < v14)
  {
    BOOL v16 = 1LL;
    if (v7 >= 3) {
      BOOL v16 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v17 = v16 | (2 * v7);
    unint64_t v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18) {
      size_t v19 = v18;
    }
    else {
      size_t v19 = v17;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( a1,  v19);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }

    else
    {
      unint64_t v3 = ((_DWORD)v7 - 1) & v6;
    }
  }

  uint64_t v20 = *(void *)a1;
  BOOL v21 = *(void **)(*(void *)a1 + 8 * v3);
  if (v21)
  {
    *unint64_t v10 = *v21;
LABEL_38:
    void *v21 = v10;
    goto LABEL_39;
  }

  *unint64_t v10 = *v12;
  void *v12 = v10;
  *(void *)(v20 + 8 * v3) = v12;
  if (*v10)
  {
    unint64_t v22 = *(void *)(*v10 + 8LL);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v22 >= v7) {
        v22 %= v7;
      }
    }

    else
    {
      v22 &= v7 - 1;
    }

    BOOL v21 = (void *)(*(void *)a1 + 8 * v22);
    goto LABEL_38;
  }

void sub_18610FE24(_Unwind_Exception *a1)
{
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned int,NSString * {__strong}>,void *>>>::operator()[abi:ne180100]( uint64_t a1, id *a2)
{
  if (*(_BYTE *)(a1 + 8))
  {
  }

  else if (!a2)
  {
    return;
  }

  operator delete(a2);
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned int,NSString * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,NSString * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,NSString * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,NSString * {__strong}>>>::~__hash_table( uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<unsigned int,NSString * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,NSString * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,NSString * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,NSString * {__strong}>>>::__deallocate_node( uint64_t a1, id *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      unint64_t v3 = (id *)*v2;

      operator delete(v2);
      uint64_t v2 = v3;
    }

    while (v3);
  }

uint64_t compareRange(void *a1, void *a2)
{
  if (*a1 >= *a2) {
    unsigned int v2 = 0;
  }
  else {
    unsigned int v2 = -1;
  }
  if (*a1 > *a2) {
    return 1LL;
  }
  else {
    return v2;
  }
}

void RangeArrayInsertRangeAtIndex(void *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  unint64_t v7 = a1;
  unsigned int v8 = v7[2];
  float v14 = v7;
  if (v8 >= v7[6])
  {
    unsigned int v9 = (3 * v8 + 3) >> 1;
    v7[6] = v9;
    *((void *)v7 + 2) = realloc(*((void **)v7 + 2), 16LL * v9);
    unint64_t v7 = v14;
    unsigned int v8 = v14[2];
  }

  unsigned int v10 = v8 - a4;
  uint64_t v11 = a4;
  if (v10)
  {
    uint64_t v12 = *((void *)v7 + 2) + 16LL * a4;
    memmove((void *)(v12 + 16), (const void *)v12, 16LL * v10);
    unint64_t v7 = v14;
    a4 = v14[2];
  }

  uint64_t v13 = (void *)(*((void *)v7 + 2) + 16 * v11);
  void *v13 = a2;
  v13[1] = a3;
  v7[2] = a4 + 1;
}

void RangeArrayRemoveRangeAtIndex(void *a1, unsigned int a2)
{
  unint64_t v3 = a1;
  unsigned int v4 = v3[2];
  if (v4 > a2)
  {
    int v5 = v4 - 1;
    if (v4 - 1 > a2)
    {
      unint64_t v7 = v3;
      uint64_t v6 = *((void *)v3 + 2) + 16LL * a2;
      memmove((void *)v6, (const void *)(v6 + 16), 16LL * (v4 + ~a2));
      unint64_t v3 = v7;
      int v5 = v7[2] - 1;
    }

    v3[2] = v5;
  }
}

uint64_t VMUIsMetaclass(void *a1, void *a2, int a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  if (a3)
  {
    unsigned int v9 = (_BYTE *)_classDataRWV1ofClass(v7, v8, a4);
  }

  else
  {
    uint64_t v10 = _classDataRWV0ofClass(v7, v8, a4);
    if (!v10)
    {
LABEL_7:
      uint64_t v11 = 0LL;
      goto LABEL_8;
    }

    unsigned int v9 = (_BYTE *)(*((uint64_t (**)(id, void, uint64_t))v8 + 2))(v8, *(void *)(v10 + 8), 4LL);
  }

  if (!v9) {
    goto LABEL_7;
  }
  uint64_t v11 = *v9 & 1;
LABEL_8:

  return v11;
}

void sub_186110E38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _classDataRWV0ofClass(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v6 = a2;
  uint64_t v7 = _classDataRWAddressofClass(v5, (uint64_t)v6, a3);
  if (v7) {
    uint64_t v8 = v6[2](v6, v7, 64LL);
  }
  else {
    uint64_t v8 = 0LL;
  }

  return v8;
}

void sub_186110ECC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _classDataRWV1ofClass(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v6 = a2;
  uint64_t v7 = _classDataRWAddressofClass(v5, (uint64_t)v6, a3);
  if (v7) {
    uint64_t v8 = v6[2](v6, v7, 32LL);
  }
  else {
    uint64_t v8 = 0LL;
  }

  return v8;
}

void sub_186110F58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t VMUGetNextSiblingOfClass(void *a1, void *a2, int a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  if (!a3)
  {
    uint64_t v11 = _classDataRWV0ofClass(v7, v8, a4);
    if (v11)
    {
      uint64_t v10 = (uint64_t *)(v11 + 48);
      goto LABEL_6;
    }

void sub_186110FF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t VMUGetFirstSubclassOfClass(void *a1, void *a2, int a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  if (!a3)
  {
    uint64_t v11 = _classDataRWV0ofClass(v7, v8, a4);
    if (v11)
    {
      uint64_t v10 = (uint64_t *)(v11 + 40);
      goto LABEL_6;
    }

void sub_18611109C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id VMUGetClassNameFromClassDataRO(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v6 = a2;
  uint64_t v7 = v6[2](v6, a3, 72LL);
  if (v7
    && ([v5 memoryCache],
        id v8 = (void *)objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = (const char *)[v8 peekStringAtAddress:*(void *)(v7 + 24)],
        v8,
        v9))
  {
    if (!strncmp(v9, "_Tt", 3uLL)) {
      demangleSwiftClassName(v9);
    }
    else {
      [NSString stringWithUTF8String:v9];
    }
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)v7 & 1) != 0)
    {
      uint64_t v11 = [NSString stringWithFormat:@"metaclass for %@", v10];

      uint64_t v10 = (void *)v11;
    }
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  return v10;
}

void sub_1861111C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id demangleSwiftClassName(const char *a1)
{
  uint64_t v1 = CSDemangleSymbolName();
  if (v1)
  {
    unsigned int v2 = (void *)v1;
    unint64_t v3 = (void *)[objc_alloc(NSString) initWithUTF8String:v1];
    free(v2);
    id v4 = v3;
    id v5 = v4;
    if (objc_msgSend( (id)demangleSwiftClassName(char const*)::s_removeUUIDRegex,  "numberOfMatchesInString:options:range:",  v4,  0,  0,  objc_msgSend(v4, "length")))
    {
      uint64_t v6 = [demangleSwiftClassName(char const*)::s_removeUUIDRegex stringByReplacingMatchesInString:v4 options:0 range:[v4 length] withTemplate:@"$1"];

      id v5 = (id)v6;
    }

    if (objc_msgSend( (id)demangleSwiftClassName(char const*)::s_unsuffixRegex,  "numberOfMatchesInString:options:range:",  v5,  0,  0,  objc_msgSend(v5, "length")))
    {
      uint64_t v7 = [demangleSwiftClassName(char const*)::s_unsuffixRegex stringByReplacingMatchesInString:v5 options:0 range:[v5 length] withTemplate:@"$1"];

      id v5 = (id)v7;
    }

    if (objc_msgSend( (id)demangleSwiftClassName(char const*)::s_demodularRegex,  "numberOfMatchesInString:options:range:",  v5,  0,  0,  objc_msgSend(v5, "length")))
    {
      uint64_t v8 = [::s_demodularRegex stringByReplacingMatchesInString:v5 options:0 range:[v5 length] withTemplate:@"$2"];

      id v5 = (id)v8;
    }

    if (v5 != v4)
    {
      id v9 = v5;

      id v4 = v9;
    }
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

void sub_1861113D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id VMUGetClassNameFromClassDataExtRW(void *a1, void *a2, int a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = v8;
  if (a3
    && (uint64_t v10 = (uint64_t *)(*((uint64_t (**)(id, unint64_t, uint64_t))v8 + 2))( v8,  a4 & 0xFFFFFFFFFFFFFFFELL,  48LL)) != 0LL)
  {
    uint64_t v11 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v7, *v10);
    VMUGetClassNameFromClassDataRO(v7, v9, v11);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  return v12;
}

void sub_186111478(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id VMUGetClassNameFromClassDataRW(void *a1, void *a2, int a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = v8;
  uint64_t v10 = v8[2];
  if (!a3)
  {
    uint64_t v14 = v10(v8, a4, 64LL);
    if (!v14) {
      goto LABEL_10;
    }
    uint64_t v12 = *(void *)(v14 + 8);
    goto LABEL_7;
  }

  uint64_t v11 = v10(v8, a4, 32LL);
  if (!v11) {
    goto LABEL_10;
  }
  uint64_t v12 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v7, *(void *)(v11 + 8));
  if ((v12 & 1) == 0)
  {
LABEL_7:
    if (v12)
    {
      uint64_t v13 = VMUGetClassNameFromClassDataRO(v7, v9, v12);
      goto LABEL_9;
    }

void sub_18611155C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id VMUGetClassNameFromClassStructure(void *a1, void *a2, int a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  uint64_t v9 = _classDataRWAddressofClass(v7, (uint64_t)v8, a4);
  if (v9)
  {
    VMUGetClassNameFromClassDataRW(v7, v8, a3, v9);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  return v10;
}

void sub_1861115FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _classDataRWAddressofClass(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v6 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 16))(a2, a3 + 32, 8LL);
  if (v6) {
    uint64_t v7 = *v6;
  }
  else {
    uint64_t v7 = 0LL;
  }
  uint64_t v8 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v5, v7) & 0x7FFFFFFFFFF8LL;

  return v8;
}

void sub_186111678(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18611195C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1861119E4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_186111A58( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_186111AE0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

uint64_t debugSwiftSubfieldIsEnabled()
{
  if (debugSwiftSubfieldIsEnabled::dispatchToken != -1) {
    dispatch_once(&debugSwiftSubfieldIsEnabled::dispatchToken, &__block_literal_global_25);
  }
  return debugSwiftSubfieldIsEnabled::isEnabled;
}

void __debugSwiftSubfieldIsEnabled_block_invoke()
{
  if ((_debugSwiftSubfieldEnvironmentVariableIsEnabled("SYMBOLICATION_DEBUG_SWIFT_SUBFIELDS") & 1) != 0)
  {
    BOOL v0 = 1;
  }

  else
  {
    if (_debugRemoteMirrorOutputForSwiftSubfieldIsEnabled(void)::dispatchToken != -1) {
      dispatch_once( &_debugRemoteMirrorOutputForSwiftSubfieldIsEnabled(void)::dispatchToken,  &__block_literal_global_412);
    }
    BOOL v0 = _debugRemoteMirrorOutputForSwiftSubfieldIsEnabled(void)::isEnabled != 0;
  }

  debugSwiftSubfieldIsEnabled::isEnabled = v0;
}

char *_debugSwiftSubfieldEnvironmentVariableIsEnabled(const char *a1)
{
  uint64_t result = getenv(a1);
  if (result)
  {
    unsigned int v2 = result;
    if (!strcmp(result, "YES")) {
      return (char *)1;
    }
    else {
      return (char *)(strcmp(v2, "1") == 0);
    }
  }

  return result;
}

void sub_186111D7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_186111E50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18611219C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void _debugSwiftSubfieldDumpSwiftChildInfo(int a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (*(void *)a3) {
    uint64_t v8 = *(const char **)a3;
  }
  else {
    uint64_t v8 = "NULL";
  }
  int v9 = *(_DWORD *)(a3 + 8);
  uint64_t v10 = nameOfSwiftLayoutKind(*(_DWORD *)(a3 + 12));
  uint64_t v11 = v10;
  uint64_t v12 = *(const void **)(a3 + 16);
  if (v12)
  {
    id v13 = vmu_swift_reflection_interop_copyDemangledNameForTypeRef(a4, *(void *)(a3 + 16), *(void *)(a3 + 24));
    _debugSwiftAsyncPrintf( a1,  "%s gave { .name = %s, .Offset = %u, .Kind = %s, .TR = { .Typeref = %p (type %s), .Library = %d } }\n",  a2,  v8,  v9,  v11,  v12,  (const char *)[v13 UTF8String],  *(_DWORD *)(a3 + 24));
  }

  else
  {
    _debugSwiftAsyncPrintf( a1,  "%s gave { .name = %s, .Offset = %u, .Kind = %s, .TR = { .Typeref = %p (type %s), .Library = %d } }\n",  a2,  v8,  v9,  v10,  0LL,  "?",  *(_DWORD *)(a3 + 24));
  }

void sub_1861122E8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16)
{
}

VMUMutableFieldInfo *_createFieldInfoFromChild( uint64_t *a1, const char *a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8, _BYTE *a9, int a10)
{
  int v11 = a6;
  id v17 = a9;
  uint64_t v77 = a5;
  uint64_t v78 = a6;
  id v18 = a7;
  id v19 = a8;
  if (!(_DWORD)a4 || (int)a4 >= 19)
  {
    if ((_DWORD)a4)
    {
      unint64_t v23 = "has invalid kind";
    }

    else
    {
      *a9 = 1;
      unint64_t v23 = "has kind SWIFT_UNKNOWN";
    }

    if (debugSwiftSubfieldIsEnabled::dispatchToken != -1) {
      dispatch_once(&debugSwiftSubfieldIsEnabled::dispatchToken, &__block_literal_global_25);
    }
    if (debugSwiftSubfieldIsEnabled::isEnabled)
    {
      if (!a5)
      {
        _debugSwiftAsyncPrintf(a10, "Bailing because field %s (type %s) %s\n", a2, "?", v23);
        if ((_DWORD)a4) {
          goto LABEL_22;
        }
        goto LABEL_27;
      }

      id v17 = vmu_swift_reflection_interop_copyDemangledNameForTypeRef(*a1, a5, v11);
      _debugSwiftAsyncPrintf( a10,  "Bailing because field %s (type %s) %s\n",  a2,  (const char *)[v17 UTF8String],  v23);
    }

    if ((_DWORD)a4)
    {
LABEL_22:
      unint64_t v22 = 0LL;
      goto LABEL_23;
    }

void sub_186112B7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_186112CFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_186112D78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_45:
    goto LABEL_46;
  }

  uint64_t v27 = v18;
  if (a4 != 8 && a4 != 1)
  {
    v106 = 0LL;
    goto LABEL_94;
  }

  [v14 vmuTask];
  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v29 = [v28 isExclaveCore];

  v105 = v29;
  if (v29)
  {
    if (a4 != 8) {
      goto LABEL_45;
    }
    v16[8] = -2147483520;
    v16[11] = 8;
    uint64_t v30 = vmu_swift_reflection_interop_lookupMetadata(*(void *)[v14 swiftMirror], (const void *)a3);
    vmu_swift_reflection_infoForMetadata(*(void *)[v14 swiftMirror], (uint64_t)v30, v31);
    if (v108 != 17) {
      goto LABEL_45;
    }
    v100 = 0LL;
    unint64_t v32 = 0LL;
    v104 = 0LL;
    v106 = 0LL;
    v16[7] = v109;
  }

  else
  {
    uint64_t v33 = v15[2](v15, a3, 40LL);
    if (!v33) {
      goto LABEL_45;
    }
    v104 = v33;
    unint64_t v34 = *(void *)(v33 + 32);
    [v14 vmuTask];
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v36 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v35, v34);

    if (v17) {
      int v37 = v17->var1 | 1;
    }
    else {
      int v37 = 1LL;
    }
    if ((v37 & v36) != 0) {
      v16[11] = 8;
    }
    [v14 vmuTask];
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v39 = VMUGetClassDataROofClass(v38, v15, v27, a3);

    if (!v39) {
      goto LABEL_45;
    }
    BOOL v40 = v15[2](v15, v39, 72LL);
    if (!v40) {
      goto LABEL_45;
    }
    int v41 = *(void *)(v40 + 24);
    unint64_t v32 = *(void *)(v40 + 48);
    v16[8] = *(_DWORD *)v40;
    v16[6] = *(_DWORD *)(v40 + 4);
    v100 = v40;
    v16[7] = *(_DWORD *)(v40 + 8);
    v106 = v41;
    if (v41)
    {
      [v14 vmuTask];
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 _setClassNameWithAddress:v106 targetTask:v42];
    }
  }

  if (v16[11] == 8)
  {
    int v43 = v15[2](v15, a3, 72LL);
    if (!v43) {
      goto LABEL_45;
    }
    if (!*((void *)v16 + 7))
    {
      if (v17->var0)
      {
        uint64_t v78 = vmu_swift_reflection_interop_lookupMetadata((uint64_t)v17->var0, (const void *)a3);
        if (v78)
        {
          v80 = vmu_swift_reflection_interop_typeRefForMetadata((uint64_t)v17->var0, (uint64_t)v78, v77);
          if (v80)
          {
            v103 = v32;
            vmu_swift_reflection_interop_copyDemangledNameForTypeRef((uint64_t)v17->var0, v80, v79);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            if (v81) {
              objc_storeStrong((id *)v16 + 7, v81);
            }

            unint64_t v32 = v103;
          }
        }
      }
    }

    *((_BYTE *)v16 + 146) = (*(_BYTE *)(v43 + 40) & 2) != 0;
  }

  if (!*((void *)v16 + 7))
  {
    int v44 = (void *)NSString;
    uint64_t v45 = [v16 typeName];
    uint64_t v46 = [v44 stringWithFormat:@"<UNNAMED_%s_class_%#llx>", [v45 UTF8String], a3];
    int v47 = (void *)*((void *)v16 + 7);
    *((void *)v16 + 7) = v46;
  }

  v16[5] = 0;
  if (v16[11] == 8)
  {
    if (v17 && v17->var0)
    {
      _swiftFieldsForClass(*((const void **)v16 + 1), *((NSString **)v16 + 7), v17, v13);
      int64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
      int v49 = [v48 count];
      v16[5] = v49;
      if (v49)
      {
        *((void *)v16 + 6) = calloc(v49 + 1, 8uLL);
        if (v16[5])
        {
          id v50 = 0LL;
          do
          {
            uint64_t v51 = [v48 objectAtIndexedSubscript:v50];
            char v52 = *((void *)v16 + 6);
            char v53 = *(void **)(v52 + 8 * v50);
            *(void *)(v52 + 8 * v50) = v51;

            ++v50;
          }

          while (v50 < v16[5]);
        }
      }
    }

    else if ((-[VMUClassInfo _initWithClass:type:realizedOnly:infoMap:objectIdentifier:reader:]::swiftMirrorMissing & 1) == 0)
    {
      [v14 scanner];
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (v55)
      {
        NSLog(@"Swift reflection is unavailable. All Swift content will be scanned conservatively.");
        NSLog(@"Weak references in Swift content may be misidentified as retaining references.");
        -[VMUClassInfo _initWithClass:type:realizedOnly:infoMap:objectIdentifier:reader:]::swiftMirrorMissing = 1;
      }
    }
  }

  [v14 vmuTask];
  uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v32 || v16[5]) {
    goto LABEL_83;
  }
  v57 = (int *)v15[2](v15, v32, 48LL);
  if (!v57) {
    goto LABEL_100;
  }
  uint64_t v58 = v57[1];
  v16[5] = v58;
  v96 = *v57;
  v99 = v56;
  *((void *)v16 + 6) = calloc(v58 + 1, 8uLL);
  if (!v16[5])
  {
    v98 = 0;
    goto LABEL_82;
  }

  unsigned int v59 = 0;
  v102 = 0LL;
  v98 = 0;
  v97 = v32 + 8;
  while (1)
  {
    v101 = v59;
    int v60 = v97 + v59;
    v61 = v15;
    id v62 = v99;
    int v63 = v15[2](v61, v60, 40LL);
    if (!v63) {
      break;
    }
    BOOL v64 = v62;
    [v62 memoryCache];
    unsigned int v65 = (void *)objc_claimAutoreleasedReturnValue();
    int v66 = (const char *)[v65 peekStringAtAddress:*(void *)(v63 + 8)];

    unsigned int v67 = (int *)v15[2](v61, *(void *)v63, 4LL);
    if (v67) {
      v68 = *v67;
    }
    else {
      v68 = 0;
    }
    uint64_t v69 = *(const char **)(v63 + 16);
    if (v69) {
      uint64_t v69 = (const char *)v15[2](v61, (unint64_t)v69, 1LL);
    }
    LocalIvar = (unsigned int *)_createLocalIvar(v66, v69, v68, *(_DWORD *)(v63 + 28), 0);

    if (!LocalIvar) {
      goto LABEL_81;
    }
    __int128 v71 = LocalIvar[7];
    if ((_DWORD)v71 || v16[11] != 8)
    {
      uint64_t Name = ivar_getName((Ivar)LocalIvar);
      if (!*(void *)LocalIvar || (Offset = ivar_getOffset((Ivar)LocalIvar), !(_DWORD)Offset))
      {
        if (!Name || strcmp(Name, "isa")) {
          goto LABEL_71;
        }
        Offset = 0LL;
      }

      int v74 = -[VMUFieldInfo initWithObjcIvar:size:offset:ivarName:isARC:is64Bit:]( [VMUMutableFieldInfo alloc],  "initWithObjcIvar:size:offset:ivarName:isARC:is64Bit:",  LocalIvar,  v71,  Offset,  Name,  [v16 isARR],  1);
      int v75 = *((void *)v16 + 6);
      unsigned int v76 = *(void **)(v75 + 8LL * v98);
      *(void *)(v75 + 8LL * v9_Block_object_dispose(va, 8) = v74;

      ++v98;
    }

  return v16;
}

LABEL_71:
    _destroyLocalIvar((objc_ivar *)LocalIvar);
    unsigned int v59 = v101 + v96;
  }

LABEL_81:
  [v16 className];
  uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(@"missing ivar at index: %d in class: %@", v102, v82);

LABEL_82:
  v16[5] = v98;
  uint64_t v56 = v99;
  *((void *)v16 + 17) = copy_remote_layout_at(*(void *)(v100 + 16), v15);
  *((void *)v16 + 16) = copy_remote_layout_at(*(void *)(v100 + 56), v15);
  [v16 _parseIvarsAndLayouts];
LABEL_83:
  if (!v105)
  {
    if (([v16 isRootClass] & 1) == 0)
    {
      v88 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v56, *(void *)(v104 + 8));
      if (v88)
      {
        v89 = -[VMUClassInfoMap classInfoForAddress:](v13, "classInfoForAddress:", v88);
        v90 = (void *)*((void *)v16 + 10);
        *((void *)v16 + 10) = v89;

        if (!*((void *)v16 + 10))
        {
          v87 = [objc_alloc((Class)objc_opt_class()) _initWithClass:v88 type:1 realizedOnly:v107 infoMap:v13 objectIdentifier:v14 reader:v15];
LABEL_92:
          v91 = (void *)*((void *)v16 + 10);
          *((void *)v16 + 10) = v87;
        }
      }
    }

      __n128 v31 = *++a1;
      uint64_t v6 = v31;
      if (!v31)
      {
        for (; v7; --v7)
        {
          if (a2) {
            [v5 appendString:@"*"];
          }
        }

        goto LABEL_126;
      }
    }
  }

  uint64_t v8 = 0LL;
LABEL_126:
  unint64_t v32 = (void (*)(void))v35[2];
LABEL_127:
  v32();

LABEL_128:
}

LABEL_93:
    goto LABEL_94;
  }

  v83 = v15[2](v15, a3, 8LL);
  if (v83)
  {
    v84 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v56, *(void *)(v83 + 8));
    if (v84)
    {
      v85 = -[VMUClassInfoMap classInfoForAddress:](v13, "classInfoForAddress:", v84);
      v86 = (void *)*((void *)v16 + 10);
      *((void *)v16 + 10) = v85;

      if (!*((void *)v16 + 10))
      {
        v87 = [objc_alloc((Class)objc_opt_class()) _initWithClass:v84 type:8 realizedOnly:v107 infoMap:v13 objectIdentifier:v14 reader:v15];
        goto LABEL_92;
      }
    }

    goto LABEL_93;
  }

LABEL_100:
LABEL_46:
  BOOL v16 = 0LL;
LABEL_47:

  return v16;
}

void sub_1861136E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t VMUGetClassDataROofClass(void *a1, void *a2, int a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  if (!a3)
  {
    uint64_t v14 = _classDataRWV0ofClass(v7, v8, a4);
    if (v14)
    {
      if ((*(_WORD *)(v14 + 2) & 0xC008) != 0)
      {
        uint64_t v11 = *(void *)(v14 + 8);
        goto LABEL_13;
      }

void sub_1861138FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _swiftFieldsForClass(const void *a1, NSString *a2, libSwiftRemoteMirrorWrapper *a3, VMUClassInfoMap *a4)
{
  BOOL v16 = a2;
  float v15 = a4;
  id v7 = (id)objc_opt_new();
  uint64_t v9 = vmu_swift_reflection_interop_lookupMetadata((uint64_t)a3->var0, a1);
  if (v9)
  {
    int v10 = v8;
    vmu_swift_reflection_infoForMetadata((uint64_t)a3->var0, (uint64_t)v9, v8);
    if (v21 == 17)
    {
      if (debugSwiftSubfieldIsEnabled::dispatchToken != -1) {
        dispatch_once(&debugSwiftSubfieldIsEnabled::dispatchToken, &__block_literal_global_25);
      }
      if (debugSwiftSubfieldIsEnabled::isEnabled) {
        _debugSwiftAsyncPrintf( 0, "Getting fields for class %s\n", -[NSString UTF8String](v16, "UTF8String"));
      }
      if (v22)
      {
        uint64_t v11 = 0LL;
        do
        {
          vmu_swift_reflection_childOfMetadata((uint64_t)a3->var0, (uint64_t)v9, v10, v11, (uint64_t)&v19);
          if (_debugRemoteMirrorOutputForSwiftSubfieldIsEnabled(void)::dispatchToken != -1) {
            dispatch_once( &_debugRemoteMirrorOutputForSwiftSubfieldIsEnabled(void)::dispatchToken,  &__block_literal_global_412);
          }
          if (_debugRemoteMirrorOutputForSwiftSubfieldIsEnabled(void)::isEnabled)
          {
            v18[0] = v19;
            v18[1] = v20;
            _debugSwiftSubfieldDumpSwiftChildInfo(1, "childOfMetadata()", (uint64_t)v18, (uint64_t)a3->var0);
          }

          char v17 = 0;
          _createFieldInfoFromChild( (uint64_t *)a3,  (const char *)v19,  DWORD2(v19),  HIDWORD(v19),  v20,  *((uint64_t *)&v20 + 1),  v15,  v16,  &v17,  1);
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            [v7 addObject:v12];
          }

          else if (v17)
          {

            id v7 = 0LL;
            break;
          }

          uint64_t v11 = (v11 + 1);
        }

        while (v11 < v22);
      }

      if (debugSwiftSubfieldIsEnabled::dispatchToken != -1) {
        dispatch_once(&debugSwiftSubfieldIsEnabled::dispatchToken, &__block_literal_global_25);
      }
      if (debugSwiftSubfieldIsEnabled::isEnabled) {
        _debugSwiftAsyncPrintf(0, "\n");
      }
    }

    else
    {
      if (debugSwiftSubfieldIsEnabled::dispatchToken != -1) {
        dispatch_once(&debugSwiftSubfieldIsEnabled::dispatchToken, &__block_literal_global_25);
      }
      if (debugSwiftSubfieldIsEnabled::isEnabled)
      {
        -[NSString UTF8String](v16, "UTF8String");
        _debugSwiftAsyncPrintf(0, "Failed to get info for metadata of class %s\n\n");
      }
    }

    id v7 = v7;
    uint64_t v13 = v7;
  }

  else
  {
    if (debugSwiftSubfieldIsEnabled::dispatchToken != -1) {
      dispatch_once(&debugSwiftSubfieldIsEnabled::dispatchToken, &__block_literal_global_25);
    }
    if (debugSwiftSubfieldIsEnabled::isEnabled) {
      _debugSwiftAsyncPrintf( 0, "Failed to look up metadata for class %s\n\n", -[NSString UTF8String](v16, "UTF8String"));
    }
    uint64_t v13 = 0LL;
  }

  return v13;
}

void sub_186113C1C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void _destroyLocalIvar(objc_ivar *a1)
{
  if (a1)
  {
    if (*((_BYTE *)a1 + 32))
    {
      unsigned int v2 = (void *)*((void *)a1 + 1);
      if (v2)
      {
        free(v2);
        *((void *)a1 + 1) = 0LL;
      }

      unint64_t v3 = (void *)*((void *)a1 + 2);
      if (v3)
      {
        free(v3);
        *((void *)a1 + 2) = 0LL;
      }
    }

    if (*(void *)a1) {
      free(*(void **)a1);
    }
    free(a1);
  }

unint64_t copy_remote_layout_at(unint64_t a1, void *a2)
{
  unint64_t v3 = a2;
  if (a1)
  {
    unsigned int v4 = 0;
    LODWORD(v5) = 0;
    uint64_t v6 = 0LL;
    id v7 = (_DWORD *)MEMORY[0x1895FD590];
    uint64_t v8 = *MEMORY[0x1895FD590] - ((*MEMORY[0x1895FD590] + 0xFFFFFFFFLL) & a1);
    while (1)
    {
      uint64_t v9 = v8;
      int v10 = (const char *)v3[2](v3, (void *)a1, v8);
      if (!v10)
      {
        if (v6) {
          free(v6);
        }
LABEL_9:
        a1 = 0LL;
        goto LABEL_11;
      }

      size_t v5 = (v5 + v8);
      uint64_t v11 = reallocf(v6, v5);
      if (!v11) {
        goto LABEL_9;
      }
      uint64_t v6 = v11;
      strncpy((char *)v11 + v4, v10, v8);
      uint64_t v12 = (v5 - 1);
      v4 += v8;
      LODWORD(v_Block_object_dispose(va, 8) = *v7;
      a1 += v9;
    }

    *((_BYTE *)v6 + v12) = 0;
    size_t v13 = strlen((const char *)v6);
    a1 = (unint64_t)reallocf(v6, v13 + 1);
  }

void sub_186113DCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_186114148( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_186114320( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)&OBJC_CLASS___VMUClassInfo;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

LABEL_37:
}

void sub_186114838( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, void *a20, void *a21, void *a22, void *a23)
{
  _Unwind_Resume(a1);
}

unint64_t VMUGetClassDataExtOfClass(void *a1, void *a2, int a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  if (a3 && (uint64_t v9 = _classDataRWV1ofClass(v7, v8, a4)) != 0)
  {
    uint64_t v10 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v7, *(void *)(v9 + 8));
    unint64_t v11 = v10 & (v10 << 63 >> 63) & 0xFFFFFFFFFFFFFFFELL;
  }

  else
  {
    unint64_t v11 = 0LL;
  }

  return v11;
}

void sub_1861149C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_186114B4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unint64_t maskPointerToMethodList(uint64_t a1, unint64_t a2, VMUTaskMemoryScanner *a3)
{
  size_t v5 = a3;
  uint64_t v6 = v5;
  if (HIBYTE(a2))
  {
    a2 &= 0xFFFFFFFFFFFFFFuLL;
    -[VMUTaskMemoryScanner setClassStructureFieldScanValueAtSourceAddress:toCorrectedAddress:]( v5,  "setClassStructureFieldScanValueAtSourceAddress:toCorrectedAddress:",  a1,  a2);
  }

  return a2;
}

void sub_186114BB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_186114CEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_186115168(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *_createLocalIvar(const char *a1, const char *a2, int a3, int a4, char a5)
{
  uint64_t v10 = malloc(0x28uLL);
  v10[1] = a1;
  v10[2] = a2;
  unint64_t v11 = malloc(4uLL);
  *uint64_t v10 = v11;
  *unint64_t v11 = a3;
  *((_DWORD *)v10 + 7) = a4;
  *((_BYTE *)v10 + 32) = a5;
  return v10;
}

void sub_186115258(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_186115560(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *_decodeNullTerminatedBytes(NSCoder *a1)
{
  uint64_t v1 = a1;
  -[NSCoder decodeValueOfObjCType:at:size:](v1, "decodeValueOfObjCType:at:size:", "I", &v4, 4LL);
  if (v4)
  {
    unsigned int v2 = calloc(v4 + 1, 1uLL);
    -[NSCoder decodeArrayOfObjCType:count:at:](v1, "decodeArrayOfObjCType:count:at:", "c", v4, v2);
  }

  else
  {
    unsigned int v2 = 0LL;
  }

  return v2;
}

void sub_18611560C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1861157C0(_Unwind_Exception *a1)
{
  if (v9 != v3) {
  _Unwind_Resume(a1);
  }
}

void sub_186115B7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _formatIvar(VMUFieldInfo *a1, uint64_t a2)
{
  uint64_t v3 = a1;
  unsigned int v4 = VMUScanTypeKeywordDescription(-[VMUFieldInfo scanType](v3, "scanType"));
  if (*v4) {
    size_t v5 = " ";
  }
  else {
    size_t v5 = "";
  }
  BOOL v6 = -[VMUFieldInfo isCapture](v3, "isCapture");
  id v7 = (void *)NSString;
  if (v6)
  {
    uint64_t v8 = -[VMUFieldInfo offset](v3, "offset");
    BOOL v9 = -[VMUFieldInfo isByref](v3, "isByref");
    uint64_t v10 = "__block ";
    if (!v9) {
      uint64_t v10 = "";
    }
    [v7 stringWithFormat:@"%+*d: %s%s%s[capture];", a2, v8, v10, v4, v5];
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v12 = -[VMUFieldInfo offset](v3, "offset");
    id v21 = -[VMUFieldInfo typeName](v3, "typeName");
    size_t v13 = (unsigned __int8 *)[v21 UTF8String];
    id v20 = -[VMUFieldInfo ivarName](v3, "ivarName");
    descriptionForTypeEncoding(v13, [v20 UTF8String]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMUFieldInfo destinationLayout](v3, "destinationLayout");
    float v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      BOOL v16 = (void *)NSString;
      -[VMUFieldInfo destinationLayout](v3, "destinationLayout");
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 className];
      size_t v13 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      [v16 stringWithFormat:@"  [->%@]", v13];
      char v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      char v17 = &stru_189E010C8;
    }

    [v7 stringWithFormat:@"%*u: %s%s%@;%@", a2, v12, v4, v5, v14, v17];
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
    }
  }

  return v11;
}

void sub_186115DC8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_186116050(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_186116258( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

void _processExtendedLayout(unint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  BOOL v9 = v3;
  if (a1 >= 0x1000)
  {
    unsigned int v4 = *(unsigned __int8 *)a1;
    if (*(_BYTE *)a1)
    {
      size_t v5 = (unsigned __int8 *)(a1 + 1);
      do
      {
        uint64_t v6 = 0LL;
        uint64_t v7 = 1LL;
        switch(v4 >> 4)
        {
          case 2u:
            goto LABEL_10;
          case 3u:
            uint64_t v6 = 0LL;
            uint64_t v7 = 2LL;
            goto LABEL_10;
          case 4u:
            uint64_t v6 = 1LL;
            goto LABEL_10;
          case 5u:
            uint64_t v6 = 0LL;
            uint64_t v7 = 4LL;
            goto LABEL_10;
          case 6u:
            uint64_t v6 = 0LL;
            uint64_t v7 = 8LL;
LABEL_10:
            v9[2](v9, v7, v6, (v4 & 0xF) + 1);
            break;
          default:
            break;
        }

        unsigned int v8 = *v5++;
        unsigned int v4 = v8;
      }

      while (v8);
    }
  }

  else
  {
    v3[2](v3, 2LL, 0LL, (a1 >> 8) & 0xF);
    v9[2](v9, 1LL, 1LL, a1 >> 4);
    v9[2](v9, 4LL, 0LL, a1 & 0xF);
  }
}

void sub_186116394( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_1861164BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *VMUClassInfoComplexVariantEvaluatorCombineHashes(void *result, uint64_t a2)
{
  char *result = a2 + 37LL * *result;
  return result;
}

void sub_186116DBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_186116FB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_186117250(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1861172B8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_186117324( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

LABEL_48:
    _Block_object_dispose(&v52, 8);
    _Block_object_dispose(&v58, 8);
    _Block_object_dispose(&v62, 8);
    uint64_t v10 = v42;
  }
}

  unint64_t v34 = &stru_189E010C8;
  if (v47) {
    unint64_t v34 = @"  RECURSION COLLAPSED";
  }
  uint64_t v35 = v34;
  BOOL v36 = self->_options;
  CSSymbolOwnerGetSourceInfoWithAddress();
  if ((CSIsNull() & 1) != 0)
  {
    int v37 = self->_stackLogReader;
    if (v37)
    {
      if ((v36 & 2) != 0) {
        -[VMUStackLogReader sourcePathForPCaddress:](v37, "sourcePathForPCaddress:", a3);
      }
      else {
        -[VMUStackLogReader sourceFileNameForPCaddress:](v37, "sourceFileNameForPCaddress:", a3);
      }
      int v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (v43)
      {
        [NSString stringWithFormat:@"%@  %@:%u", v35, v43, -[VMUStackLogReader sourceLineNumberForPCaddress:](self->_stackLogReader, "sourceLineNumberForPCaddress:", a3)];
        uint64_t v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v39 = 0LL;
      }

      if (v39) {
        goto LABEL_59;
      }
    }
  }

  else
  {
    if ((v36 & 2) != 0) {
      Filename = CSSourceInfoGetPath();
    }
    else {
      Filename = CSSourceInfoGetFilename();
    }
    [NSString stringWithFormat:@"%@  %s:%u", v35, Filename, CSSourceInfoGetLineNumber()];
    uint64_t v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v39) {
      goto LABEL_59;
    }
  }

  uint64_t v39 = v35;
LABEL_59:
  -[VMUCallTreeNode nameWithStringsForSymbol:library:loadAddress:offset:address:suffix:]( self,  "nameWithStringsForSymbol:library:loadAddress:offset:address:suffix:",  v28,  v48,  v49,  v30,  Range,  v39);
  float v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    BOOL v40 = self->_uniqueNodeNames;
    int v41 = v15;
    -[NSMutableSet member:](v40, "member:", v41);
    float v15 = (id)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      -[NSMutableSet addObject:](v40, "addObject:", v41);
      float v15 = v41;
    }
  }

  uint64_t v10 = v50;
LABEL_64:

  return v15;
}

void sub_186117880( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, char a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, id a40, char a41)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose((const void *)(v42 - 256), 8);

  _Unwind_Resume(a1);
}

void sub_186117A40( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_186117BF4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_186117D70( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_186117E38( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

void sub_186117F3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_186117F9C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_186117FF8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_186118094(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_186118528(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18611862C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Unwind_Resume(a1);
}

void sub_1861186CC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_1861187AC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_18611885C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1861188F4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_1861189D0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_186118B78( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_186118CDC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_186118D9C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_186118E78( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_186118F6C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_186119194( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_186119264( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1861193F4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Block_object_dispose((const void *)(v18 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1861194BC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18611956C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1861196F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_186119A90( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
}

void sub_186119B30( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
}

void sub_186119BB8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_186119CC8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_186119DC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_186119EE0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_186119FB8(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_18611A0B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18611A148(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL22demangleSwiftClassNamePKc_block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607A00] regularExpressionWithPattern:@"\\((.+) in _([0-9A-Z]+)\\)" options:0 error:0];
  uint64_t v1 = (void *)demangleSwiftClassName(char const*)::s_removeUUIDRegex;
  demangleSwiftClassName(char const*)::s_removeUUIDRegex = v0;

  uint64_t v2 = [MEMORY[0x189607A00] regularExpressionWithPattern:@"^([0-9a-zA-Z]+)\\.([0-9a-zA-Z].+)" options:0 error:0];
  uint64_t v3 = (void *)demangleSwiftClassName(char const*)::s_demodularRegex;
  demangleSwiftClassName(char const*)::s_demodularRegex = v2;

  uint64_t v4 = [MEMORY[0x189607A00] regularExpressionWithPattern:@"^(.+) with unmangled suffix (.+)" options:0 error:0];
  size_t v5 = (void *)demangleSwiftClassName(char const*)::s_unsuffixRegex;
  demangleSwiftClassName(char const*)::s_unsuffixRegex = v4;
}

char *___ZL49_debugRemoteMirrorOutputForSwiftSubfieldIsEnabledv_block_invoke()
{
  uint64_t result = _debugSwiftSubfieldEnvironmentVariableIsEnabled("SYMBOLICATION_DEBUG_REMOTE_MIRROR_OUTPUT_FOR_SWIFT_SUBFIELDS");
  _debugRemoteMirrorOutputForSwiftSubfieldIsEnabled(void)::isEnabled = (char)result;
  return result;
}

const char *nameOfSwiftLayoutKind(int a1)
{
  else {
    return off_189DFEAF8[a1 - 1];
  }
}

void ___ZL25_createFieldInfoFromChildP27libSwiftRemoteMirrorWrapperPKcj17swift_layout_kind21swift_typeref_interopP15VMUClassInfoMapjP8NSStringPbj_block_invoke()
{
  _createFieldInfoFromChild(libSwiftRemoteMirrorWrapper *,char const*,unsigned int,swift_layout_kind,swift_typeref_interop,VMUClassInfoMap *,unsigned int,NSString *,BOOL *,unsigned int)::preciselyScanSinglePayloadEnums = getenv("DT_PRECISELY_SCAN_SWIFT_SINGLE_PAYLOAD_ENUMS") != 0LL;
  _createFieldInfoFromChild(libSwiftRemoteMirrorWrapper *,char const*,unsigned int,swift_layout_kind,swift_typeref_interop,VMUClassInfoMap *,unsigned int,NSString *,BOOL *,unsigned int)::preciselyScanMultiPayloadEnums = getenv("DT_DO_NOT_PRECISELY_SCAN_SWIFT_MULTI_PAYLOAD_ENUMS") == 0LL;
  uint64_t v0 = -[VMUFieldInfo initWithName:type:scan:offset:size:]( objc_alloc(&OBJC_CLASS___VMUMutableFieldInfo),  "initWithName:type:scan:offset:size:",  @"Dummy no payload field",  0LL,  0LL,  0LL,  0LL);
  uint64_t v1 = (void *)swiftEnumDummyNoPayloadSubField;
  swiftEnumDummyNoPayloadSubField = (uint64_t)v0;
}

char *___ZL31_logSwiftUnknownFieldsIsEnabledv_block_invoke()
{
  uint64_t result = _debugSwiftSubfieldEnvironmentVariableIsEnabled("SYMBOLICATION_LOG_SWIFT_UNKNOWN_FIELDS");
  _logSwiftUnknownFieldsIsEnabled(void)::isEnabled = (char)result;
  return result;
}

uint64_t _classDataExtV1ofClass(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  unint64_t v7 = VMUGetClassDataExtOfClass(v5, v6, 1, a3);
  if (v7) {
    uint64_t v8 = (*((uint64_t (**)(id, unint64_t, uint64_t))v6 + 2))(v6, v7 & 0xFFFFFFFFFFFFFFFELL, 48LL);
  }
  else {
    uint64_t v8 = 0LL;
  }

  return v8;
}

void sub_18611A378(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18611BB2C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void VMUMarkObject(void *a1)
{
  unint64_t v1 = a1;
  uint64_t v2 = (void *)v1;
  if (v1 && (s_markingDisabled & 1) == 0 && (*MEMORY[0x189616650] & v1) == 0)
  {
    id v3 = (id)v1;
    if (_retainCount_onceToken != -1) {
      dispatch_once(&_retainCount_onceToken, &__block_literal_global_11);
    }
    if (objc_msgSend(v3, (SEL)_retainCount_retainCountSelector) == (id)-1)
    {

      goto LABEL_4;
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      NSClassFromString(@"__NSMallocBlock__");
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_4;
      }
    }

    else
    {
    }

    objc_getAssociatedObject(v3, "__VMUAssociatedObjectsObjcAbandonedMarkerKey");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      id v6 = (void *)objc_opt_new();
      uint64_t v8 = 0LL;
      uint64_t v10 = 0LL;
      unint64_t v11 = &v10;
      uint64_t v12 = 0x2020000000LL;
      int v13 = 0;
      v9[0] = MEMORY[0x1895F87A8];
      v9[1] = 3221225472LL;
      v9[2] = ___addEntryToMarkingRegion_block_invoke;
      v9[3] = &unk_189DFECE0;
      v9[4] = &v10;
      v9[5] = v2;
      v9[6] = &v8;
      _singleThreadedMarking(v9);
      uint64_t v7 = *((unsigned int *)v11 + 6);
      _Block_object_dispose(&v10, 8);
      [v6 setEntryIndex:v7];
      [v6 setRegion:v8];
      objc_setAssociatedObject(v3, "__VMUAssociatedObjectsObjcAbandonedMarkerKey", v6, (void *)0x301);
    }
  }

void sub_18611C2E8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t _VMUEnumerateMarkedObjects(void *a1)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  uint64_t v2 = (void (**)(void, void))v1;
  if ((s_markingDisabled & 1) != 0)
  {
    uint64_t v3 = 0LL;
  }

  else
  {
    uint64_t v18 = 0LL;
    __int128 v19 = &v18;
    uint64_t v20 = 0x2020000000LL;
    int v21 = 0;
    if (v1) {
      uint64_t v4 = (void *)objc_opt_new();
    }
    else {
      uint64_t v4 = 0LL;
    }
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = ___VMUEnumerateMarkedObjects_block_invoke;
    v15[3] = &unk_189DFEC78;
    char v17 = &v18;
    id v5 = v4;
    id v16 = v5;
    _singleThreadedMarking(v15);
    if (v2)
    {
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      __int128 v11 = 0u;
      __int128 v12 = 0u;
      id v6 = v5;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v22 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v12;
        do
        {
          for (uint64_t i = 0LL; i != v7; ++i)
          {
            if (*(void *)v12 != v8) {
              objc_enumerationMutation(v6);
            }
            v2[2](v2, *(void *)(*((void *)&v11 + 1) + 8 * i));
          }

          uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v22 count:16];
        }

        while (v7);
      }
    }

    uint64_t v3 = *((unsigned int *)v19 + 6);

    _Block_object_dispose(&v18, 8);
  }

  return v3;
}

void sub_18611C4B0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
}

void _singleThreadedMarking(void *a1)
{
  id v1 = a1;
  if (_singleThreadedMarking_onceToken != -1)
  {
    uint64_t v8 = v1;
    dispatch_once(&_singleThreadedMarking_onceToken, &__block_literal_global_29);
    id v1 = v8;
  }

  if ((s_markingDisabled & 1) == 0)
  {
    uint64_t v7 = v1;
    uint64_t v2 = (dispatch_semaphore_s *)_singleThreadedMarking_s_markingLock;
    dispatch_time_t v3 = dispatch_time(0LL, 1000000000LL);
    if (dispatch_semaphore_wait(v2, v3))
    {
      uint64_t v4 = (FILE *)*MEMORY[0x1895F89D0];
      id v5 = getprogname();
      pid_t v6 = getpid();
      fprintf( v4,  "%s[%d]: warning: memory marking timeout encountered - marked objects may be incorrect from this point forward\n",  v5,  v6);
      s_markingDisabled = 1;
    }

    else if ((s_markingDisabled & 1) == 0)
    {
      v7[2]();
    }

    dispatch_semaphore_signal((dispatch_semaphore_t)_singleThreadedMarking_s_markingLock);
    id v1 = v7;
  }
}

uint64_t ___removeEntryFromMarkingRegion_block_invoke(uint64_t result)
{
  uint64_t v1 = *(unsigned int *)(result + 40);
  mach_vm_address_t v2 = *(void *)(result + 32);
  *(void *)(v2 + *(unsigned int *)(v2 + 12) + 8 * std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned int,NSString * {__strong}>,void *>>>::operator()[abi:ne180100]( v2, v1) = 0LL;
  int v3 = *(_DWORD *)(v2 + 28) - 1;
  *(_DWORD *)(v2 + 2_Block_object_dispose(va, 8) = v3;
  if (!v3)
  {
    uint64_t v4 = s_currentMarkingContext;
    if (s_currentMarkingContext == v2)
    {
      if (!*(void *)(v2 + 32)) {
        return result;
      }
      s_currentMarkingContext = *(void *)(v2 + 32);
    }

    else
    {
      for (uint64_t i = *(void *)(s_currentMarkingContext + 32); i != v2; uint64_t i = *(void *)(i + 32))
        uint64_t v4 = i;
      *(void *)(v4 + 32) = *(void *)(v2 + 32);
    }

    return mach_vm_deallocate(*MEMORY[0x1895FBBE0], v2, *MEMORY[0x1895FD590]);
  }

  return result;
}

SEL ___retainCount_block_invoke()
{
  SEL result = NSSelectorFromString(@"retainCount");
  _retainCount_retainCountSelector = (uint64_t)result;
  return result;
}

void *___addEntryToMarkingRegion_block_invoke(void *result)
{
  uint64_t v1 = result;
  mach_vm_address_t v2 = (unsigned int *)s_currentMarkingContext;
  if (!s_currentMarkingContext
    || *(_DWORD *)(s_currentMarkingContext + 28) == *(_DWORD *)(s_currentMarkingContext + 20))
  {
    vm_address_t address = 0LL;
    int v3 = (void *)MEMORY[0x1895FD590];
    SEL result = (void *)vm_allocate(*MEMORY[0x1895FBBE0], &address, *MEMORY[0x1895FD590], 167772161);
    if ((_DWORD)result)
    {
      s_currentMarkingContext = 0LL;
      uint64_t v4 = (FILE *)*MEMORY[0x1895F89D0];
      id v5 = getprogname();
      pid_t v6 = getpid();
      SEL result = (void *)fprintf(v4, "%s[%d]: error: memory marking region could not be allocated\n", v5, v6);
      s_markingDisabled = 1;
      return result;
    }

    vm_address_t v7 = address;
    unint64_t v8 = (unint64_t)(*v3 + 0x7FFFFFFD8LL) >> 3;
    *(void *)vm_address_t address = 0x1DE67829AD1A2FBBLL;
    *(void *)(v7 + _Block_object_dispose(va, 8) = 0x2800000001LL;
    *(_DWORD *)(v7 + 16) = 8;
    *(_DWORD *)(v7 + 20) = v8;
    *(void *)(v7 + 24) = 0LL;
    *(void *)(v7 + 32) = v2;
    s_currentMarkingContext = v7;
    mach_vm_address_t v2 = (unsigned int *)v7;
  }

  BOOL v9 = (char *)v2 + v2[3];
  *(_DWORD *)(*(void *)(v1[4] + 8LL) + 24LL) = v2[6];
  unsigned int v10 = v2[5];
  if (v10)
  {
    for (unsigned int i = 0; i < v10; ++i)
    {
      uint64_t v12 = *(void *)(v1[4] + 8LL);
      uint64_t v13 = *(unsigned int *)(v12 + 24);
      if (!*(void *)&v9[8 * v13]) {
        break;
      }
      int v14 = (_DWORD)v13 + 1 == v10 ? 0 : v13 + 1;
      *(_DWORD *)(v12 + 24) = v14;
      unsigned int v10 = v2[5];
    }
  }

  v2[6] = *(_DWORD *)(*(void *)(v1[4] + 8LL) + 24LL);
  uint64_t v15 = *(unsigned int *)(*(void *)(v1[4] + 8LL) + 24LL);
  if (*(void *)&v9[8 * v15]) {
    ___addEntryToMarkingRegion_block_invoke_cold_1();
  }
  id v16 = (unsigned int **)v1[6];
  *(void *)&v9[8 * v15] = v1[5];
  ++v2[7];
  if (v16) {
    *id v16 = v2;
  }
  return result;
}

char *___singleThreadedMarking_block_invoke()
{
  dispatch_semaphore_t v0 = dispatch_semaphore_create(1LL);
  uint64_t v1 = (void *)_singleThreadedMarking_s_markingLock;
  _singleThreadedMarking_s_markingLock = (uint64_t)v0;

  SEL result = getenv("NSZombieEnabled");
  if (result)
  {
    int v3 = result;
    if ((*result | 0x20) == 0x79)
    {
      uint64_t v4 = (FILE *)*MEMORY[0x1895F89D0];
      id v5 = getprogname();
      pid_t v6 = getpid();
      SEL result = (char *)fprintf( v4,  "%s[%d]: notice: memory marking disabled due to presence of NSZombieEnabled=%s environment variable\n",  v5,  v6,  v3);
      s_markingDisabled = 1;
    }
  }

  return result;
}

__CFString *VMURegionTypeDescriptionForTagShareProtAndPager(uint64_t a1, int a2, int a3, int a4)
{
  if ((_DWORD)a1 == 30)
  {
    if (!a3) {
      return @"Stack Guard";
    }
    pid_t v6 = @"Stack";
  }

  else
  {
    if ((_DWORD)a1 == 1)
    {
      unint64_t v8 = @"MALLOC metadata";
      if (a2 == 3) {
        unint64_t v8 = @"MALLOC";
      }
      if (a3) {
        pid_t v6 = (__CFString *)v8;
      }
      else {
        pid_t v6 = @"MALLOC guard page";
      }
      return v6;
    }

    if ((_DWORD)a1)
    {
      pid_t v6 = vmRegionLabels[a1];
      if (!v6)
      {
        [MEMORY[0x189NSStringormat:@"Memory Tag %d", a1];
        pid_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

      return v6;
    }

    if (a4 == 1)
    {
      id v5 = VMUmappedFileLabel[0];
LABEL_21:
      pid_t v6 = v5;
      return v6;
    }

    if (a2 != 5)
    {
      id v5 = (__CFString *)VMUuntaggedRegionLabel;
      goto LABEL_21;
    }

    pid_t v6 = @"shared memory";
  }

  return v6;
}

id VMUExclaveOrDarwinRegionTypeDescriptionForTagShareProtAndPager( int a1, uint64_t a2, int a3, int a4, int a5)
{
  if (a1) {
    VMUExclaveRegionTypeDescriptionForTagShareProtAndPager(a2);
  }
  else {
    VMURegionTypeDescriptionForTagShareProtAndPager(a2, a3, a4, a5);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

id VMUExclaveRegionTypeDescriptionForTagShareProtAndPager(unsigned int a1)
{
  char v1 = a1 + 5;
  if ((a1 + 5) <= 0x18u && ((0x1FFFEFFu >> v1) & 1) != 0)
  {
    [NSString stringWithUTF8String:off_189DFF110[v1]];
    mach_vm_address_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [MEMORY[0x189NSStringormat:@"Exclave memory tag %hhu" a1];
    mach_vm_address_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v2;
}

id dispositionDescription(__int16 a1)
{
  mach_vm_address_t v2 = (void *)objc_opt_new();
  int v3 = v2;
  if ((a1 & 1) != 0)
  {
    [v2 appendString:@"  PRESENT"];
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }

  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }

  [v3 appendString:@"  FICTITIOUS"];
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }

BOOL collectPhysFootprint()
{
  int v2 = 0;
  size_t v1 = 4LL;
  return (!sysctlbyname("vm.self_region_footprint", &v2, &v1, 0LL, 0LL) || *__error() == 2) && v2 != 0;
}

id ownedPhysFootprintAdjustmentForMemgraph(void *a1, _DWORD *a2, unint64_t a3, uint64_t a4)
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  id v7 = a1;
  if ([v7 count] != *a2) {
    ownedPhysFootprintAdjustmentForMemgraph_cold_1();
  }
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  [v7 reverseObjectEnumerator];
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (!v9)
  {
LABEL_10:

    int v14 = 0LL;
    goto LABEL_35;
  }

  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v49;
LABEL_4:
  uint64_t v12 = 0LL;
  while (1)
  {
    if (*(void *)v49 != v11) {
      objc_enumerationMutation(v8);
    }
    uint64_t v13 = *(void **)(*((void *)&v48 + 1) + 8 * v12);
    if ([v13 isOwnedUnmappedMemory]) {
      break;
    }
    if (v10 == ++v12)
    {
      uint64_t v10 = [v8 countByEnumeratingWithState:&v48 objects:v53 count:16];
      if (!v10) {
        goto LABEL_10;
      }
      goto LABEL_4;
    }
  }

  int v14 = v13;

  if (!v14)
  {
LABEL_35:
    int v37 = 0LL;
    goto LABEL_41;
  }

  uint64_t v39 = a2;
  BOOL v40 = v14;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id v41 = v7;
  id v15 = v7;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (!v16)
  {
    unint64_t v42 = 0LL;
    goto LABEL_37;
  }

  uint64_t v17 = v16;
  unint64_t v42 = 0LL;
  uint64_t v18 = *(void *)v45;
  __int128 v19 = &OBJC_IVAR___VMUVMRegion_range;
  uint64_t v20 = &OBJC_IVAR___VMUVMRegion_user_tag;
  int v21 = &OBJC_IVAR___VMUVMRegion_purgeable;
  unint64_t v43 = a3;
  do
  {
    for (uint64_t i = 0LL; i != v17; ++i)
    {
      if (*(void *)v45 != v18) {
        objc_enumerationMutation(v15);
      }
      uint64_t v23 = *(char **)(*((void *)&v44 + 1) + 8 * i);
      if (!VMURangeContainsRange(a3, a4, *(void *)&v23[*v19], *(void *)&v23[*v19 + 8]))
      {
        size_t v24 = v23;
        int v25 = v24;
        if (*(_DWORD *)&v24[*v20] == 87 || *(_DWORD *)&v24[*v21] == 3)
        {

          continue;
        }

        uint64_t v26 = a4;
        uint64_t v27 = v19;
        id v28 = v15;
        uint64_t v29 = v20;
        uint64_t v30 = v21;
        uint64_t v31 = *((void *)v24 + 20);

        if (v31)
        {
          int v21 = v30;
          if (!*(_DWORD *)((char *)v25 + *v30))
          {
            uint64_t v20 = v29;
            if (!*((_BYTE *)v25 + 49))
            {
              id v15 = v28;
              if ((*((_BYTE *)v25 + 132) & 2) == 0)
              {
                uint64_t v32 = v25[20] - v25[27];
                v25[23] = v32;
                unint64_t v33 = v25[20];
                uint64_t v34 = v25[23];
                uint64_t v35 = v25[27];
                uint64_t v36 = v33 - v35 - v32;
                if (v33 < v35 + v34) {
                  uint64_t v36 = 0LL;
                }
                v42 += v34 + v36;
              }

              goto LABEL_31;
            }

void adjustOwnedMemoryRegionFootprint(void *a1, unint64_t a2)
{
  int v3 = a1;
  uint64_t v4 = v3;
  unint64_t v5 = v3[23];
  if (v5 >= a2)
  {
    v3[23] = v5 - a2;
  }

  else
  {
    unint64_t v6 = a2 - v5;
    v3[23] = 0LL;
    unint64_t v7 = v3[22];
    if (v7 >= v6)
    {
      v3[22] = v7 - v6;
    }

    else
    {
      v3[22] = 0LL;
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        adjustOwnedMemoryRegionFootprint_cold_1(v6, v7);
      }
    }
  }
}

void withPeekFunctionForVMUTask(void *a1, void *a2)
{
  id v3 = a2;
  [a1 memoryCache];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __withPeekFunctionForVMUTask_block_invoke;
  v7[3] = &unk_189DFED50;
  id v8 = v4;
  id v5 = v4;
  unint64_t v6 = (void *)MEMORY[0x186E33044](v7);
  _withPeekTransformerFunctionForMemoryReader(v6, v3);
}

uint64_t __withPeekFunctionForVMUTask_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = 0LL;
  else {
    return v4;
  }
}

char *VMUMallocRangeTypeString(int a1)
{
  return off_189DFF1D8[a1 - 1];
}

void sub_18611F554( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void addMallocRegionPageStatistics(void *a1, void *a2)
{
  id v3 = a1;
  if (v3 && a2 && *((_BYTE *)v3 + 50) != 3)
  {
    uint64_t v4 = a2[3];
    a2[2] += v3[2];
    a2[3] = v4 + v3[20];
    uint64_t v5 = a2[5];
    a2[4] += v3[21];
    a2[5] = v5 + v3[22];
    a2[6] += v3[23];
  }
}

void setTypeIfMallocRegion(void *a1)
{
  size_t v1 = a1;
  if (!v1[6]) {
    goto LABEL_26;
  }
  if (*((void *)v1 + 17)) {
    goto LABEL_3;
  }
  if (*((_BYTE *)v1 + 232))
  {
    if ((*((_BYTE *)v1 + 238) & 1) != 0) {
      int v2 = @"MALLOC (empty)";
    }
    else {
      int v2 = 0LL;
    }
  }

  else
  {
    unsigned int v3 = v1[26] - 2;
    if (v3 > 0xB)
    {
LABEL_3:
      int v2 = 0LL;
      goto LABEL_10;
    }

    int v2 = off_189DFF210[v3];
  }

void coalesceIdenticalRegions(void *a1, char a2)
{
  id v8 = a1;
  if ((a2 & 0x80) == 0)
  {
    unint64_t v3 = [v8 count];
    if (v3 >= 2)
    {
      unint64_t v4 = v3;
      unint64_t v5 = 1LL;
      do
      {
        [v8 objectAtIndex:v5 - 1];
        unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 objectAtIndex:v5];
        int v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (shouldProbablyCoalesceRegions(v6, v7) && ([v6 hasSameInfoAsRegion:v7] & 1) != 0)
        {
          [v6 addInfoFromRegion:v7];
          [v8 removeObjectAtIndex:v5];
          --v4;
        }

        else
        {
          ++v5;
        }
      }

      while (v5 < v4);
    }
  }
}

uint64_t recordRegions(void *a1, unint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  uint64_t v304 = *MEMORY[0x1895F89C0];
  id v11 = a1;
  id v256 = a3;
  id v249 = a4;
  id v250 = a5;
  id v247 = a6;
  v257 = v11;
  [v11 memoryCache];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  mach_error_t v13 = [v12 startPeeking];

  if (v13)
  {
    mach_error_t v14 = v13;
    id v15 = (FILE *)*MEMORY[0x1895F89D0];
    int v16 = [v11 pid];
    unsigned int v265 = v14;
    uint64_t v17 = mach_error_string(v14);
    fprintf(v15, "*** Can't suspend task %d: %s\n", v16, v17);
    goto LABEL_384;
  }
  v260 = +[VMUDebugTimer sharedTimerIfCreated](&OBJC_CLASS___VMUDebugTimer, "sharedTimerIfCreated");
  if ([v11 isCore])
  {
    uint64_t v18 = [v11 createSymbolicatorWithFlags:0 andNotification:0];
    uint64_t v20 = v19;
  }

  else
  {
    id v21 = v11;
    uint64_t v18 = [v21 createSymbolicatorWithFlags:CSSymbolicatorGetFlagsForNoSymbolOrSourceInfoData() | 0x20100000 andNotification:0];
    uint64_t v20 = v22;

    uint64_t v23 = getprogname();
    if (!strcmp(v23, "ReportCrash"))
    {
      CSSymbolicatorGetSymbolOwnerWithNameAtTime();
      if ((CSIsNull() & 1) == 0)
      {
        CSRelease();
        uint64_t v18 = 0LL;
        uint64_t v20 = 0LL;
      }
    }
  }

  size_t v24 = v260;
  if ((a7 & 0x10000) != 0)
  {
    BOOL v240 = collectPhysFootprint();
    setCollectPhysFootprint(1);
  }

  else
  {
    BOOL v240 = 0;
  }

  id v269 = v20;
  obuint64_t j = (id)v18;
  if (v260)
  {
    if ([v260 signpostID])
    {
      [v260 logHandle];
      int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v26 = [v260 signpostID];
      if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v27 = v26;
        if (os_signpost_enabled(v25))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v25,  OS_SIGNPOST_INTERVAL_END,  v27,  "recordRegions",  "",  buf,  2u);
        }
      }

      size_t v24 = v260;
    }

    [v24 endEvent:"recordRegions"];
    [v260 startWithCategory:"recordRegions" message:"gather VM region data"];
    [v260 logHandle];
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v29 = [v260 signpostID];
    if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( &dword_1860C5000,  v28,  OS_SIGNPOST_INTERVAL_BEGIN,  v29,  "recordRegions",  "gather VM region data",  buf,  2u);
    }
  }

  else
  {
    [0 endEvent:"recordRegions"];
    [0 startWithCategory:"recordRegions" message:"gather VM region data"];
  }

  if ([v11 taskType] == 2)
  {
    [v11 memoryCache];
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    id v31 = v256;
    id v32 = v30;
    [v32 memoryRegions];
    uint64_t v33 = MEMORY[0x1895F87A8];
    *(void *)buf = MEMORY[0x1895F87A8];
    uint64_t v292 = 3221225472LL;
    v293 = __listKernelCoreRegions_block_invoke;
    v294 = &unk_189DFEEC0;
    uint64_t v34 = (__int128 *)v31;
    v295 = v34;
    enumerate_mapped_memory_core_file_dumped_regions();
    *(void *)&__int128 v300 = v33;
    *((void *)&v300 + 1) = 3221225472LL;
    *(void *)&__int128 v301 = __listKernelCoreRegions_block_invoke_2;
    *((void *)&v301 + 1) = &unk_189DFE6D0;
    uint64_t v35 = v34;
    *(void *)&__int128 v302 = v35;
    CSSymbolicatorForeachSegmentAtTime();
    *(void *)&__int128 v287 = 0LL;
    CSSymbolicatorGetAOutSymbolOwner();
    CSSymbolOwnerGetSymbolWithName();
    uint64_t Range = CSSymbolGetRange();
    [v32 peekAtAddress:Range size:v37 returnsBuf:&v287];

    *(void *)&__int128 v296 = v33;
    *((void *)&v296 + 1) = 3221225472LL;
    *(void *)&__int128 v297 = __listKernelCoreRegions_block_invoke_3;
    *((void *)&v297 + 1) = &unk_189DFEEE8;
    uint64_t v38 = v35;
    *(void *)&__int128 v298 = v38;
    uint64_t v39 = MEMORY[0x186E33044](&v296);
    BOOL v40 = (void *)v39;
    if ((void)v287)
    {
      id v41 = (void (**)(void *, const __CFString *, void, void, uint64_t, uint64_t))(v39 + 16);
      (*(void (**)(uint64_t, const __CFString *, void, void, void, void))(v39 + 16))( v39,  @"MALLOC",  *(void *)v287,  *(void *)(v287 + 8),  0LL,  0LL);
      (*v41)(v40, @"Zalloc read-only", *(void *)(v287 + 16), *(void *)(v287 + 24), 0LL, 1LL);
      (*v41)(v40, @"MALLOC metadata", *(void *)(v287 + 32), *(void *)(v287 + 40), 4LL, 0LL);
      (*v41)(v40, @"Zalloc bits", *(void *)(v287 + 48), *(void *)(v287 + 56), 4LL, 0LL);
      (*v41)(v40, @"PGZ", *(void *)(v287 + 80), *(void *)(v287 + 88), 0LL, 0LL);
    }
  }

  else if (a2)
  {
    id v42 = v11;
    id v261 = v256;
    if (*MEMORY[0x1895FD560] >= *MEMORY[0x1895FD578]) {
      uint64_t v43 = *MEMORY[0x1895FD578];
    }
    else {
      uint64_t v43 = *MEMORY[0x1895FD560];
    }
    else {
      uint64_t v44 = ~v43;
    }
    if ((v44 & a2) != 0) {
      unint64_t v45 = (v44 & a2) - 1;
    }
    else {
      unint64_t v45 = 0LL;
    }
    *(void *)buf = a2;
    getRegionData(v42, buf, &v300, 0LL);
    __int128 v46 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v47 = v46;
    if (v46)
    {
      __int128 v48 = *(uint64_t **)buf;
      id v266 = v46;
      if ((unint64_t)v48 <= a2)
      {
        char v53 = *(uint64_t **)buf;
        *(void *)buf += v300;
        getRegionData(v42, buf, &v300, 0LL);
        unint64_t v45 = (unint64_t)v53 - 1;
        v253 = v266;
        id v266 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        v253 = 0LL;
      }
    }

    else
    {
      v253 = 0LL;
      id v266 = 0LL;
    }

    *(void *)buf = v45;
    getRegionData(v42, buf, &v300, 0LL);
    uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(void *)buf > v45 || (v55 = v54, (uint64_t v56 = v55) == 0LL))
    {
      uint64_t v57 = 0LL;
      id v55 = 0LL;
      unint64_t v58 = 0LL;
      int v59 = 50;
      unint64_t v60 = v45;
      while (1)
      {
        *(void *)buf = v58;
        getRegionData(v42, buf, &v300, 0LL);
        uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();

        if (v56 && *(void *)buf < v45)
        {
          id v61 = v56;

          id v55 = v61;
        }

        if (!v56 || (uint64_t v62 = v300 + *(void *)buf, (void)v300 + *(void *)buf >= v45))
        {
          uint64_t v62 = v57;
          unint64_t v60 = v58;
        }

        if (!v59)
        {

          id v55 = 0LL;
          goto LABEL_60;
        }

        unint64_t v58 = v62 + ((v60 - v62) >> 1);
        --v59;
        uint64_t v54 = v56;
        uint64_t v57 = v62;
      }

      if (!v55) {
        goto LABEL_60;
      }
    }

    [v261 addObject:v55];
LABEL_60:
    int v63 = v266;
    if (v253)
    {
      [v261 addObject:v253];
      int v63 = v266;
    }

    if (v63)
    {
      [v261 addObject:];
      int v63 = v266;
    }
  }

  else
  {
    id v49 = v11;
    id v50 = v256;
    *(void *)&__int128 v300 = 0LL;
    *((void *)&v300 + 1) = &v300;
    *(void *)&__int128 v301 = 0x2020000000LL;
    BYTE8(v301) = 0;
    if ((a7 & 0x400) != 0)
    {
      dispatch_get_global_queue(2LL, 0LL);
      BOOL v64 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      __int128 v51 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, v64);
      dispatch_time_t v65 = dispatch_time(0LL, 10000000000LL);
      dispatch_source_set_timer(v51, v65, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
      *(void *)buf = MEMORY[0x1895F87A8];
      uint64_t v292 = 3221225472LL;
      v293 = __listAllRegions_block_invoke;
      v294 = &unk_189DFEF10;
      v295 = &v300;
      dispatch_source_set_event_handler(v51, buf);
      dispatch_resume(v51);

      char v52 = (__int128 *)*((void *)&v300 + 1);
    }

    else
    {
      __int128 v51 = 0LL;
      char v52 = &v300;
    }

    recursivelyListAllRegions(v49, v50, a7, 0LL, -1LL, 0, (_BYTE *)v52 + 24);
    if (*(_BYTE *)(*((void *)&v300 + 1) + 24LL)) {
      [v50 removeAllObjects];
    }
    if (v51) {
      dispatch_source_cancel(v51);
    }
    _Block_object_dispose(&v300, 8);
  }

  if (![v256 count])
  {
    CSRelease();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_1860C5000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "VMURegionIdentifier did not detect any regions in the target task",  buf,  2u);
    }

    goto LABEL_331;
  }

  context = (void *)MEMORY[0x186E32E40]();
  if (v260)
  {
    if ([v260 signpostID])
    {
      [v260 logHandle];
      int v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v67 = [v260 signpostID];
      if (v67 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v66))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v66,  OS_SIGNPOST_INTERVAL_END,  v67,  "recordRegions",  "",  buf,  2u);
      }
    }

    [v260 endEvent:"recordRegions"];
    [v260 startWithCategory:"recordRegions" message:"markMachOLibraries"];
    [v260 logHandle];
    v68 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v69 = [v260 signpostID];
    if (v69 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v68))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( &dword_1860C5000,  v68,  OS_SIGNPOST_INTERVAL_BEGIN,  v69,  "recordRegions",  "markMachOLibraries",  buf,  2u);
    }
  }

  else
  {
    [0 endEvent:"recordRegions"];
    [0 startWithCategory:"recordRegions" message:"markMachOLibraries"];
  }

  markMachOLibraries(v257, (uint64_t)obj, (uint64_t)v269, v256, a2, a7);
  CSRelease();
  if (v260)
  {
    if ([v260 signpostID])
    {
      [v260 logHandle];
      __int128 v70 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v71 = [v260 signpostID];
      if (v71 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v70))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v70,  OS_SIGNPOST_INTERVAL_END,  v71,  "recordRegions",  "",  buf,  2u);
      }
    }

    [v260 endEvent:"recordRegions"];
    [v260 startWithCategory:"recordRegions" message:"markMallocAreas"];
    [v260 logHandle];
    int v72 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v73 = [v260 signpostID];
    if (v73 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v72))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( &dword_1860C5000,  v72,  OS_SIGNPOST_INTERVAL_BEGIN,  v73,  "recordRegions",  "markMallocAreas",  buf,  2u);
    }

    markMallocAreas(v257, v256, v250, (void *)a2, a7, v260);
    if ([v260 signpostID])
    {
      [v260 logHandle];
      int v74 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v75 = [v260 signpostID];
      if (v75 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v74))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v74,  OS_SIGNPOST_INTERVAL_END,  v75,  "recordRegions",  "",  buf,  2u);
      }
    }

    [v260 endEvent:"recordRegions"];
    [v260 startWithCategory:"recordRegions" message:"markStacks"];
    [v260 logHandle];
    unsigned int v76 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v77 = [v260 signpostID];
    if (v77 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v76))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( &dword_1860C5000,  v76,  OS_SIGNPOST_INTERVAL_BEGIN,  v77,  "recordRegions",  "markStacks",  buf,  2u);
    }

    markStacks(v256, v249);
    if ([v260 signpostID])
    {
      [v260 logHandle];
      uint64_t v78 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v79 = [v260 signpostID];
      if (v79 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v78))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v78,  OS_SIGNPOST_INTERVAL_END,  v79,  "recordRegions",  "",  buf,  2u);
      }
    }

    [v260 endEvent:"recordRegions"];
    [v260 startWithCategory:"recordRegions" message:"markIOSurfaces"];
    [v260 logHandle];
    v80 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v81 = [v260 signpostID];
    if (v81 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v80))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( &dword_1860C5000,  v80,  OS_SIGNPOST_INTERVAL_BEGIN,  v81,  "recordRegions",  "markIOSurfaces",  buf,  2u);
    }

    markIOSurfaces(v257, v256, a7);
    if ([v260 signpostID])
    {
      [v260 logHandle];
      uint64_t v82 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v83 = [v260 signpostID];
      if (v83 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v82))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v82,  OS_SIGNPOST_INTERVAL_END,  v83,  "recordRegions",  "",  buf,  2u);
      }
    }

    [v260 endEvent:"recordRegions"];
    [v260 startWithCategory:"recordRegions" message:"markOthers"];
    [v260 logHandle];
    v84 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v85 = [v260 signpostID];
    if (v85 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v84))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( &dword_1860C5000,  v84,  OS_SIGNPOST_INTERVAL_BEGIN,  v85,  "recordRegions",  "markOthers",  buf,  2u);
    }
  }

  else
  {
    [0 endEvent:"recordRegions"];
    [0 startWithCategory:"recordRegions" message:"markMallocAreas"];
    markMallocAreas(v257, v256, v250, (void *)a2, a7, 0LL);
    [0 endEvent:"recordRegions"];
    [0 startWithCategory:"recordRegions" message:"markStacks"];
    markStacks(v256, v249);
    [0 endEvent:"recordRegions"];
    [0 startWithCategory:"recordRegions" message:"markIOSurfaces"];
    markIOSurfaces(v257, v256, a7);
    [0 endEvent:"recordRegions"];
    [0 startWithCategory:"recordRegions" message:"markOthers"];
  }

  id v86 = v257;
  id v87 = v256;
  v267 = v86;
  [v86 memoryCache];
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMUTaskMemoryCache createSymbolicatorWithFlags:andNotification:]((uint64_t)v88, 0LL, 0LL);

  if ((CSIsNull() & 1) == 0)
  {
    CSSymbolicatorGetSymbolOwnerWithNameAtTime();
    if ((CSIsNull() & 1) != 0) {
      goto LABEL_127;
    }
    CSSymbolOwnerGetSymbolWithMangledName();
    if ((CSIsNull() & 1) != 0) {
      goto LABEL_127;
    }
    uint64_t v91 = CSSymbolGetRange();
    uint64_t v89 = 0LL;
    if (!v91 || v90 < 8) {
      goto LABEL_128;
    }
    *(void *)buf = 0LL;
    [v86 memoryCache];
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v93 = [v92 peekAtAddress:v91 size:8 returnsBuf:buf] == 0;

    if (!v93) {
LABEL_127:
    }
      uint64_t v89 = 0LL;
    else {
      uint64_t v89 = **(void **)buf;
    }
LABEL_128:
    CSRelease();
    goto LABEL_129;
  }

  uint64_t v89 = 0LL;
LABEL_129:
  __int128 v299 = 0u;
  __int128 v298 = 0u;
  __int128 v297 = 0u;
  __int128 v296 = 0u;
  id obja = v87;
  uint64_t v94 = [obja countByEnumeratingWithState:&v296 objects:&v300 count:16];
  if (v94)
  {
    char v270 = 0;
    uint64_t v95 = *(void *)v297;
    do
    {
      uint64_t v96 = 0LL;
      do
      {
        if (*(void *)v297 != v95) {
          objc_enumerationMutation(obja);
        }
        uint64_t v97 = *(void *)(*((void *)&v296 + 1) + 8 * v96);
        if (!*(void *)(v97 + 32))
        {
          v98 = (void *)MEMORY[0x186E32E40]();
          if ((*(_BYTE *)(v97 + 132) & 1) != 0)
          {
            v101 = *(void **)(v97 + 32);
            *(void *)(v97 + 32) = @"Submap";

            if (*(_BYTE *)(v97 + 50) == 5) {
              v102 = @"machine-wide VM submap";
            }
            else {
              v102 = @"process-only VM submap";
            }
            objc_storeStrong((id *)(v97 + 40), v102);
          }

          else if ([(id)v97 isSanitizer])
          {
            uint64_t v99 = VMUidentifyRegionTypeFromUserTag( *(unsigned __int8 *)(v97 + 232),  *(_DWORD *)(v97 + 104),  *(unsigned __int8 *)(v97 + 50),  *(_DWORD *)(v97 + 24));
            v100 = *(void **)(v97 + 32);
            *(void *)(v97 + 32) = v99;
          }

          else if (objc_msgSend( v267,  "rangeIsInSharedCache:",  *(void *)(v97 + 8),  *(void *)(v97 + 16)))
          {
            if (([(id)v97 isUnsharedPmap] & 1) != 0 || (int v105 = *(_DWORD *)(v97 + 24), (v105 & 2) != 0))
            {
              objc_storeStrong((id *)(v97 + 32), (id)VMUunusedSharedLibDataLabel);
              if (!*(void *)(v97 + 40)) {
                objc_storeStrong((id *)(v97 + 40), (id)VMUunusedSharedLibDataPath);
              }
              *(_BYTE *)(v97 + 132) |= 4u;
            }

            else
            {
              int v106 = *(_DWORD *)(v97 + 104);
              if (v106)
              {
                uint64_t v107 = VMUidentifyRegionTypeFromUserTag( *(unsigned __int8 *)(v97 + 232),  v106,  *(unsigned __int8 *)(v97 + 50),  v105);
                v108 = *(void **)(v97 + 32);
                *(void *)(v97 + 32) = v107;
              }

              else
              {
                objc_storeStrong((id *)(v97 + 32), VMUunusedSharedLibTextLabel[0]);
                if (!*(void *)(v97 + 40)) {
                  objc_storeStrong((id *)(v97 + 40), (id)VMUunusedSharedLibTextPath);
                }
              }
            }
          }

          else if (*(_BYTE *)(v97 + 49) == 1)
          {
            v109 = *(void **)(v97 + 32);
            *(void *)(v97 + 32) = @"mapped file";

            v110 = *(void **)(v97 + 40);
            *(void *)(v97 + 40) = 0LL;

            if ((a7 & 0x40000) == 0)
            {
              [v267 memoryCache];
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              int v112 = [v111 procRegionFileNameForAddress:*(void *)(v97 + 8) buffer:buf bufferSize:1024];

              if (v112 >= 1)
              {
                buf[v112] = 0;
                [NSString stringWithUTF8String:buf];
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v114 = VMUSanitizePath(v113);
                v115 = *(void **)(v97 + 40);
                *(void *)(v97 + 40) = v114;
              }
            }

            if (!*(void *)(v97 + 40))
            {
              uint64_t v116 = -[__CFString stringByAppendingFormat:]( kVMUUnknownMappedFileNamePrefix[0],  "stringByAppendingFormat:",  @"%lx",  *(void *)(v97 + 112));
              v117 = *(void **)(v97 + 40);
              *(void *)(v97 + 40) = v116;
            }
          }

          else if ([(id)v97 isNullRegion])
          {
            v118 = (id *)(v97 + 32);
            if ((v270 & 1) != 0) {
              objc_storeStrong(v118, (id)VMUGPUCarveoutRegionLabel);
            }
            else {
              objc_storeStrong(v118, (id)VMUcommpageRegionLabel);
            }
            objc_storeStrong((id *)(v97 + 40), (id)VMUreservedVMaddressSpaceString);
            char v270 = 1;
          }

          else if ([(id)v97 isOwnedUnmappedMemory])
          {
            objc_storeStrong((id *)(v97 + 32), (id)VMUOwnedUnmappedMemoryRegionLabel);
            v119 = *(void **)(v97 + 40);
            *(void *)(v97 + 40) = @"owned physical footprint (unmapped)";
          }

          else
          {
            int v120 = *(_DWORD *)(v97 + 104);
            if (!v120 && v89 && *(void *)(v97 + 8) == v89)
            {
              v121 = *(void **)(v97 + 32);
              *(void *)(v97 + 32) = @"AttributeGraph Data";
            }

            else
            {
              uint64_t v122 = VMUidentifyRegionTypeFromUserTag( *(unsigned __int8 *)(v97 + 232),  v120,  *(unsigned __int8 *)(v97 + 50),  *(_DWORD *)(v97 + 24));
              v123 = *(void **)(v97 + 32);
              *(void *)(v97 + 32) = v122;
            }
          }

          if (!*(void *)(v97 + 40))
          {
            if (*(_DWORD *)(v97 + 24) && *(_BYTE *)(v97 + 50) == 3)
            {
              v103 = (const __CFString *)(id)VMUreservedVMaddressSpaceString;
              v104 = *(void **)(v97 + 40);
            }

            else
            {
              v104 = 0LL;
              v103 = &stru_189E010C8;
            }

            *(void *)(v97 + 40) = v103;
          }

          objc_autoreleasePoolPop(v98);
        }

        ++v96;
      }

      while (v94 != v96);
      uint64_t v124 = [obja countByEnumeratingWithState:&v296 objects:&v300 count:16];
      uint64_t v94 = v124;
    }

    while (v124);
  }

  if ([v267 taskType] == 2)
  {
    if (v260)
    {
      if ([v260 signpostID])
      {
        [v260 logHandle];
        v125 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_signpost_id_t v126 = [v260 signpostID];
        if (v126 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v125))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v125,  OS_SIGNPOST_INTERVAL_END,  v126,  "recordRegions",  "",  buf,  2u);
        }
      }

      [v260 endEvent:"recordRegions"];
      [v260 startWithCategory:"recordRegions" message:"fixupCoreRegions"];
      [v260 logHandle];
      v127 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v128 = [v260 signpostID];
      if (v128 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v127))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v127,  OS_SIGNPOST_INTERVAL_BEGIN,  v128,  "recordRegions",  "fixupCoreRegions",  buf,  2u);
      }
    }

    else
    {
      [0 endEvent:"recordRegions"];
      [0 startWithCategory:"recordRegions" message:"fixupCoreRegions"];
    }

    id v129 = obja;
    __int128 v300 = 0u;
    __int128 v301 = 0u;
    __int128 v302 = 0u;
    __int128 v303 = 0u;
    uint64_t v130 = [v129 countByEnumeratingWithState:&v300 objects:buf count:16];
    if (v130)
    {
      v131 = 0LL;
      v132 = &OBJC_IVAR___VMUVMRegion_user_tag;
      id v271 = *(id *)v301;
      while (1)
      {
        uint64_t v133 = 0LL;
        v134 = v131;
        id v262 = (id)v130;
        do
        {
          if (*(id *)v301 != v271) {
            objc_enumerationMutation(v129);
          }
          uint64_t v135 = *(void *)(*((void *)&v300 + 1) + 8 * v133);
          id v136 = *(id *)(v135 + 32);
          v137 = v136;
          char v138 = *(_BYTE *)(v135 + 132);
          if ((v138 & 2) != 0)
          {
            if ([v136 hasSuffix:@"DATA"]) {
              goto LABEL_202;
            }
            char v138 = *(_BYTE *)(v135 + 132);
          }

          if ((v138 & 2) == 0)
          {
            if (*(_DWORD *)(v135 + *v132)) {
              goto LABEL_205;
            }
LABEL_202:
            *(_DWORD *)(v135 + 24) |= 2u;
            *(_DWORD *)(v135 + 28) |= 2u;
            if ((*(_BYTE *)(v135 + 132) & 2) == 0) {
              goto LABEL_205;
            }
          }

LABEL_205:
          if ((*(_BYTE *)(v135 + 132) & 2) != 0 && [v137 hasSuffix:@"TEXT_EXEC"])
          {
            *(_DWORD *)(v135 + 24) |= 4u;
            *(_DWORD *)(v135 + 28) |= 4u;
          }

          if ([*(id *)(v135 + 40) isEqualToString:VMUunusedButDirtySharedLibDataPath])
          {
            if (v134 && (*((_BYTE *)v134 + 132) & 2) != 0)
            {
              v140 = v132;
              id v141 = v129;
              v142 = (void *)NSString;
              uint64_t v143 = VMUunusedSharedLibLabelOrPathPrefix;
              id v144 = v134[4];
              v145 = v142;
              id v129 = v141;
              v132 = v140;
              uint64_t v130 = (uint64_t)v262;
              uint64_t v146 = [v145 stringWithFormat:@"%@%@", v143, v144, context];
              v147 = *(void **)(v135 + 32);
              *(void *)(v135 + 32) = v146;

              uint64_t v148 = [NSString stringWithFormat:@"%@%@", VMUunusedButDirtySharedLibPrefix, v144];
              v149 = *(void **)(v135 + 40);
              *(void *)(v135 + 40) = v148;

              *(_BYTE *)(v135 + 132) |= 4u;
              *(_DWORD *)(v135 + 24) = *((_DWORD *)v134 + 6);
              *(_DWORD *)(v135 + 2_Block_object_dispose(va, 8) = *((_DWORD *)v134 + 7);
            }

            else
            {
              v139 = *(void **)(v135 + 40);
              *(void *)(v135 + 40) = 0LL;

              *(_BYTE *)(v135 + 132) &= ~2u;
            }
          }

          if ([(id)v135 isUntaggedRegion])
          {
            v150 = *(void **)(v135 + 32);
            *(void *)(v135 + 32) = @"Unknown core region";
          }

          v131 = (id *)(id)v135;

          ++v133;
          v134 = v131;
        }

        while (v130 != v133);
        uint64_t v130 = [v129 countByEnumeratingWithState:&v300 objects:buf count:16];
        if (!v130)
        {

          break;
        }
      }
    }
  }

  if (v260)
  {
    if ([v260 signpostID])
    {
      [v260 logHandle];
      v151 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v152 = [v260 signpostID];
      if (v152 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v151))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v151,  OS_SIGNPOST_INTERVAL_END,  v152,  "recordRegions",  "",  buf,  2u);
      }
    }

    [v260 endEvent:"recordRegions"];
    [v260 startWithCategory:"recordRegions" message:"coalesceIdenticalRegions"];
    [v260 logHandle];
    v153 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v154 = [v260 signpostID];
    if (v154 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v153))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( &dword_1860C5000,  v153,  OS_SIGNPOST_INTERVAL_BEGIN,  v154,  "recordRegions",  "coalesceIdenticalRegions",  buf,  2u);
    }

    coalesceIdenticalRegions(obja, a7);
    if ([v260 signpostID])
    {
      [v260 logHandle];
      v155 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v156 = [v260 signpostID];
      if (v156 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v155))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( &dword_1860C5000,  v155,  OS_SIGNPOST_INTERVAL_END,  v156,  "recordRegions",  "",  buf,  2u);
      }
    }

    [v260 endEvent:"recordRegions"];
    [v260 startWithCategory:"recordRegions" message:"collectVMpageStatistics"];
    [v260 logHandle];
    v157 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v158 = [v260 signpostID];
    if (v158 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v157))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( &dword_1860C5000,  v157,  OS_SIGNPOST_INTERVAL_BEGIN,  v158,  "recordRegions",  "collectVMpageStatistics",  buf,  2u);
    }
  }

  else
  {
    [0 endEvent:"recordRegions"];
    [0 startWithCategory:"recordRegions" message:"coalesceIdenticalRegions"];
    coalesceIdenticalRegions(obja, a7);
    [0 endEvent:"recordRegions"];
    [0 startWithCategory:"recordRegions" message:"collectVMpageStatistics"];
  }

  id v246 = v267;
  id v159 = obja;
  table = (NSMapTable *)v250;
  id objb = v159;
  unint64_t v268 = [v159 count];
  uint64_t v245 = VMUGetFlagsForAllVMRegionStatistics() & a7;
  if (v245)
  {
    v251 = calloc(0x400uLL, 4uLL);
    v241 = (void *)objc_opt_new();
  }

  else
  {
    v241 = 0LL;
    v251 = 0LL;
  }

  if (v268)
  {
    int v238 = 0;
    int v242 = 0;
    uint64_t v160 = 0LL;
    unint64_t v243 = 1024LL;
    v244 = 0LL;
    while (1)
    {
      uint64_t v161 = [objb objectAtIndex:v160];
      v162 = (char *)v161;
      if ((*(_BYTE *)(v161 + 132) & 1) != 0 || *(_BYTE *)(v161 + 50) == 3) {
        goto LABEL_327;
      }
      if ((a7 & 0x10000) != 0)
      {
        int v163 = [v246 rangeIsInSharedCache:*(void *)(v161 + 8), *(void *)(v161 + 16)] ^ 1;
        if ((v242 & 1) == v163)
        {
          int v164 = v163 | v242;
          setCollectPhysFootprint((v163 | v242) & 1);
          int v242 = v164 ^ 1;
        }
      }

      *((void *)v162 + 20) = 0LL;
      *((void *)v162 + 21) = 0LL;
      *((void *)v162 + 22) = 0LL;
      *((void *)v162 + 23) = 0LL;
      *((void *)v162 + 12) = 0LL;
      *((void *)v162 + _Block_object_dispose(va, 8) = 0LL;
      *((void *)v162 + 9) = 0LL;
      *((void *)v162 + 10) = 0LL;
      *((void *)v162 + 11) = 0LL;
      if (!v245) {
        goto LABEL_323;
      }
      if (*MEMORY[0x1895FD568] >= *MEMORY[0x1895FD590]) {
        unint64_t v165 = *MEMORY[0x1895FD590];
      }
      else {
        unint64_t v165 = *MEMORY[0x1895FD568];
      }
      if (*MEMORY[0x1895FD560] >= *MEMORY[0x1895FD578]) {
        uint64_t v166 = *MEMORY[0x1895FD578];
      }
      else {
        uint64_t v166 = *MEMORY[0x1895FD560];
      }
      uint64_t v254 = v166;
      uint64_t v167 = *((void *)v162 + 1);
      v168 = (char *)(v167 & ~v166);
      unint64_t v169 = (v167 + v166 + *((void *)v162 + 2)) & ~v166;
      unint64_t v272 = v165;
      unint64_t v170 = (v169 - (unint64_t)v168) / v165;
      unint64_t v171 = v170;
      if (v170 <= v243)
      {
        v172 = v251;
      }

      else
      {
        free(v251);
        v172 = malloc(4 * v170);
        unint64_t v243 = v170;
      }

      *(void *)buf = v170;
      v173 = v168;
      v251 = v172;
      if (v168 == v244)
      {
        *v172++ = v238;
        v173 = &v244[v272];
        unint64_t v171 = v170 - 1;
        *(void *)buf = v170 - 1;
      }

      if (!v171) {
        goto LABEL_265;
      }
      [v246 memoryCache];
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      mach_error_t v175 = [v174 machVMPageRangeQueryWithAddress:v173 size:v169 - (void)v173 dispositions:v172 dispositionsCount:buf];

      if (!v175) {
        break;
      }
      mach_error("collectVMpageStatistics: error in mach_vm_page_range_query", v175);
LABEL_327:

      if (++v160 >= v268) {
        goto LABEL_328;
      }
    }

    if (*((void *)v162 + 2) + *((void *)v162 + 1) < v169)
    {
      v244 = (char *)(v169 - v272);
      int v238 = v251[v170 - 1];
    }

LABEL_301:
LABEL_302:
        unint64_t v193 = v182 - v181;
        if ((v183 & 1) != 0)
        {
          *((void *)v162 + 20) += v193;
          ++*((void *)v162 + 8);
          if ((v183 & 8) != 0)
          {
            v194 = &OBJC_IVAR___VMUVMRegion_dirty_size;
            v195 = &OBJC_IVAR___VMUVMRegion_pages_dirtied;
            goto LABEL_307;
          }
        }

        else if ((v183 & 0x10) != 0)
        {
          v194 = &OBJC_IVAR___VMUVMRegion_swapped_out_size;
          v195 = &OBJC_IVAR___VMUVMRegion_pages_swapped_out;
LABEL_307:
          *(void *)&v162[*v194] += v193;
          ++*(void *)&v162[*v195];
        }

        if ((v183 & 0x20) != 0)
        {
          *((void *)v162 + 21) += v193;
          ++*((void *)v162 + 9);
        }

        if ((v183 & 0x800) != 0) {
          *((void *)v162 + 27) += v193;
        }
        ++v178;
        --v177;
      }

      while (v177);
    }

    if ((a7 & 0x10) != 0)
    {
      unint64_t v196 = *((void *)v162 + 20);
      if (*((void *)v162 + 2) < v196) {
        unint64_t v196 = *((void *)v162 + 2);
      }
      int v197 = *((_DWORD *)v162 + 13);
      switch(v197)
      {
        case 2:
          v198 = &OBJC_IVAR___VMUVMRegion_purgable_empty_size;
          unint64_t v196 = *((void *)v162 + 2);
          goto LABEL_322;
        case 1:
          v198 = &OBJC_IVAR___VMUVMRegion_purgable_vol_size;
          goto LABEL_322;
        case 0:
          v198 = &OBJC_IVAR___VMUVMRegion_purgable_non_vol_size;
LABEL_322:
          *(void *)&v162[*v198] += v196;
          break;
      }
    }

LABEL_323:
    if ((a7 & 0x100) == 0 && *((_DWORD *)v162 + 37) != -1)
    {
      v199 = NSMapGet(table, *((const void **)v162 + 5));
      if (v199)
      {
        addMallocRegionPageStatistics(v162, v199);
        ++v199[7];
      }
    }

    goto LABEL_327;
  }

LABEL_328:
  if (v251) {
    free(v251);
  }

  objc_autoreleasePoolPop(context);
LABEL_331:
  [v257 memoryCache];
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v265 = [v200 stopPeeking];

  if (!a2)
  {
    id v255 = v257;
    id v201 = v256;
    id v264 = v247;
    v259 = v201;
    if ([v201 count])
    {
      id v202 = v201;
      if (v264)
      {
        [v264 objectForKeyedSubscript:@"page_table"];
        v203 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          uint64_t v204 = [v203 unsignedLongLongValue];
          if (v204)
          {
            uint64_t v205 = [v202 lastObject];
            v206 = (void *)v205;
            if (v205)
            {
              unint64_t v207 = *(void *)(v205 + 16) + *(void *)(v205 + 8);
              if (!__CFADD__(v207, v204))
              {
                v208 = objc_alloc_init(&OBJC_CLASS___VMUVMRegion);
                v208->range.location = v207;
                v208->range.length = v204;
                v208->resident_mach_vm_size_t size = v204;
                v208->dirty_mach_vm_size_t size = v204;
                v208->user_tag = -2;
                type = v208->type;
                v208->type = (NSString *)@"page table in kernel";

                path = v208->path;
                v208->path = (NSString *)@"charged to process physical footprint";

                v208->prot = 3;
                v208->maxProt = 3;
                v208->share_mode = 2;
                v208->purgeable = 3;
                [v202 addObject:v208];
              }
            }
          }
        }
      }

      VMUGatherOwnedVmObjects(v255);
      objCC_SHA256_CTX c = (id)objc_claimAutoreleasedReturnValue();
      if (objc && [objc count])
      {
        __int128 v289 = 0u;
        __int128 v290 = 0u;
        __int128 v287 = 0u;
        __int128 v288 = 0u;
        [v202 reverseObjectEnumerator];
        v211 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v212 = [v211 countByEnumeratingWithState:&v287 objects:buf count:16];
        if (v212)
        {
          uint64_t v213 = *(void *)v288;
LABEL_345:
          uint64_t v214 = 0LL;
          while (1)
          {
            if (*(void *)v288 != v213) {
              objc_enumerationMutation(v211);
            }
            v215 = *(void **)(*((void *)&v287 + 1) + 8 * v214);
            if ([v215 isOwnedUnmappedMemory]) {
              break;
            }
            if (v212 == ++v214)
            {
              uint64_t v212 = [v211 countByEnumeratingWithState:&v287 objects:buf count:16];
              if (v212) {
                goto LABEL_345;
              }
              goto LABEL_374;
            }
          }

          v252 = v215;

          if (!v252) {
            goto LABEL_375;
          }
          __int128 v285 = 0u;
          __int128 v286 = 0u;
          __int128 v284 = 0u;
          __int128 v283 = 0u;
          id v273 = v202;
          unint64_t v216 = 0LL;
          uint64_t v217 = [v273 countByEnumeratingWithState:&v283 objects:&v300 count:16];
          if (v217)
          {
            uint64_t v218 = *(void *)v284;
            do
            {
              for (uint64_t i = 0LL; i != v217; ++i)
              {
                if (*(void *)v284 != v218) {
                  objc_enumerationMutation(v273);
                }
                v220 = *(void **)(*((void *)&v283 + 1) + 8 * i);
                [MEMORY[0x189607968] numberWithUnsignedLongLong:v220[28]];
                v221 = (void *)objc_claimAutoreleasedReturnValue();
                [objc objectForKeyedSubscript:v221];
                v222 = (void *)objc_claimAutoreleasedReturnValue();
                v223 = v222;
                if (v222)
                {
                  [v222 getBytes:&v296 length:56];
                  [objc removeObjectForKey:v221];
                  VMUFootprintForVmObject((uint64_t)&v296, &v279, v278);
                  v220[23] = v279;
                  v220[22] = v278[0];
                  uint64_t v224 = v279;
                  uint64_t v225 = v278[0];
                  VMUVMLedgerNameForTag(((unint64_t)v299 >> 1) & 7);
                  v226 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v226)
                  {
                    uint64_t v227 = [objc_alloc(NSString) initWithFormat:@"%@ (%@)", v220[4], v226];
                    v228 = (void *)v220[4];
                    v220[4] = v227;
                  }

                  v216 += v224 + v225;
                }
              }

              uint64_t v217 = [v273 countByEnumeratingWithState:&v283 objects:&v300 count:16];
            }

            while (v217);
          }

          adjustOwnedMemoryRegionFootprint(v252, v216);
          if (v252[23] + v252[22])
          {
            __int128 v281 = 0u;
            __int128 v282 = 0u;
            __int128 v279 = 0u;
            __int128 v280 = 0u;
            [objc objectEnumerator];
            v229 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v230 = 0LL;
            uint64_t v231 = [v229 countByEnumeratingWithState:&v279 objects:&v296 count:16];
            if (v231)
            {
              uint64_t v232 = *(void *)v280;
              do
              {
                for (uint64_t j = 0LL; j != v231; ++j)
                {
                  if (*(void *)v280 != v232) {
                    objc_enumerationMutation(v229);
                  }
                  [*(id *)(*((void *)&v279 + 1) + 8 * j) getBytes:v278 length:56];
                  v230 += v278[1];
                }

                uint64_t v231 = [v229 countByEnumeratingWithState:&v279 objects:&v296 count:16];
              }

              while (v231);
            }

            v211 = v252;
            v252[2] = v230;
            v252[20] = 0LL;
          }

          else
          {
            [v273 removeObject:v252];
            v211 = v252;
          }
        }

LABEL_374:
      }

LABEL_375:
    }
  }

  setCollectPhysFootprint(v240);
  if (v260 && [v260 signpostID])
  {
    [v260 logHandle];
    v234 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v235 = [v260 signpostID];
    if (v235 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v234))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( &dword_1860C5000,  v234,  OS_SIGNPOST_INTERVAL_END,  v235,  "recordRegions",  "",  buf,  2u);
    }
  }

  [v260 endEvent:"recordRegions"];

LABEL_384:
  return v265;
}

void sub_186122C8C(_Unwind_Exception *a1)
{
}

void appendMallocZoneTextLine( void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  id v25 = a1;
  [v25 appendFormat:@"%-*s", a3, a4];
  [v25 appendFormat:@" %10s" a5];
  if ((a2 & 4) != 0) {
    [v25 appendFormat:@" %10s" a6];
  }
  if ((a2 & 8) != 0) {
    [v25 appendFormat:@" %10s" a7];
  }
  uint64_t v20 = v25;
  if ((a2 & 0x800) != 0)
  {
    [v25 appendFormat:@" %10s" a8];
    uint64_t v20 = v25;
  }

  if ((a2 & 0x400000) != 0)
  {
    [v20 appendFormat:@" %10s" a9];
    [v25 appendFormat:@" %10s %10s %10s %7s" a10, a11, a12, a13];
  }

  else
  {
    [v20 appendFormat:@" %10s %10s %10s %7s", a10, a11, a12, a13];
    [v25 appendFormat:@" %7s" a14, v21, v22, v23];
  }

  [v25 appendString:@"\n"];
}

void appendMallocZoneStatsLine( void *a1, int a2, unsigned int a3, char a4, unsigned int a5, uint64_t a6, unint64_t *a7)
{
  id v26 = a1;
  context = (void *)MEMORY[0x186E32E40]();
  uint64_t v21 = pageCountString(a7[2], a3, a4);
  uint64_t v20 = pageCountString(a7[3], a3, a4);
  uint64_t v19 = pageCountString(a7[6], a3, a4);
  uint64_t v10 = pageCountString(a7[5], a3, a4);
  uint64_t v11 = pageCountString(a7[5] + a7[6], a3, a4);
  id v12 = [MEMORY[0x189NSStringormat:@"%10qu" a7[1]];
  uint64_t v13 = [v12 UTF8String];
  uint64_t v14 = memorySizeString(*a7);
  uint64_t v15 = memorySizeString(a7[9]);
  id v16 = [MEMORY[0x189NSStringormat:@"%3llu%%" a7[8]];
  uint64_t v17 = [v16 UTF8String];
  id v18 = [MEMORY[0x189NSStringormat:@"%7llu" a7[7]];
  appendMallocZoneTextLine( v26,  a2,  a5,  a6,  v21,  v20,  v19,  v10,  v11,  v13,  v14,  v15,  v17,  [v18 UTF8String]);

  objc_autoreleasePoolPop(context);
}

void cumulateLibraries(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v8 = a1;
  id v9 = a2;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0LL; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (!*(_BYTE *)(v14 + 48)
          && [*(id *)(v14 + 32) isEqual:v9]
          && *(_BYTE *)(v14 + 50) == 1)
        {
          *a3 += *(void *)(v14 + 16);
          *a4 += *(void *)(v14 + 160);
          *a5 += *(void *)(v14 + 16) - *(void *)(v14 + 160);
          *(_BYTE *)(v14 + 4_Block_object_dispose((const void *)(v1 - 256), 8) = 1;
        }
      }

      uint64_t v11 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v11);
  }
}

void appendTextLine( void *a1, __int16 a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  id v23 = a1;
  [v23 appendFormat:@"%-*s", a4, a5];
  uint64_t v21 = 8LL;
  if (a3) {
    uint64_t v22 = 10LL;
  }
  else {
    uint64_t v22 = 8LL;
  }
  if (a3) {
    uint64_t v21 = 10LL;
  }
  [v23 appendFormat:@" %*s", v21, a6];
  if ((a2 & 4) != 0)
  {
    [v23 appendFormat:@" %*s", v22, a7];
    if ((a2 & 8) == 0)
    {
LABEL_8:
      if ((a2 & 0x800) == 0) {
        goto LABEL_9;
      }
LABEL_14:
      [v23 appendFormat:@" %*s", v22, a9];
      if ((a2 & 0x10) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }

  else if ((a2 & 8) == 0)
  {
    goto LABEL_8;
  }

  [v23 appendFormat:@" %*s", v22, a8];
  if ((a2 & 0x800) != 0) {
    goto LABEL_14;
  }
LABEL_9:
  if ((a2 & 0x10) != 0) {
LABEL_10:
  }
    [v23 appendFormat:@" %*s %*s %*s", v22, a10, v22, a11, v22, a12];
LABEL_11:
  [v23 appendFormat:@" %8s" a13];
  [v23 appendFormat:@" %s", a14];
  [v23 appendString:@"\n"];
}

void appendStatsLine( void *a1, __int16 a2, unsigned int a3, char a4, unsigned int a5, uint64_t a6, unint64_t a7, unint64_t a8, unint64_t a9, unint64_t a10, unint64_t a11, unint64_t a12, unint64_t a13, unsigned int a14, uint64_t a15)
{
  id v31 = a1;
  context = (void *)MEMORY[0x186E32E40]();
  uint64_t v19 = pageCountString(a7, a3, a4);
  uint64_t v20 = pageCountString(a8, a3, a4);
  uint64_t v21 = pageCountString(a9, a3, a4);
  uint64_t v22 = pageCountString(a10, a3, a4);
  uint64_t v23 = pageCountString(a11, a3, a4);
  uint64_t v24 = pageCountString(a12, a3, a4);
  uint64_t v25 = pageCountString(a13, a3, a4);
  id v26 = [MEMORY[0x189NSStringormat:@"%8u" a14];
  appendTextLine(v31, a2, a3 > 1, a5, a6, v19, v20, v21, v22, v23, v24, v25, [v26 UTF8String], a15);

  objc_autoreleasePoolPop(context);
}

BOOL shouldProbablyCoalesceRegions(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  BOOL v5 = *((void *)v3 + 2) + *((void *)v3 + 1) == *((void *)v4 + 1)
    && sameString(*((void **)v3 + 4), *((void **)v4 + 4))
    && (!*((void *)v3 + 4) && !*((void *)v4 + 4)
     || (sameString(*((void **)v3 + 5), *((void **)v4 + 5)) & 1) != 0
     || (sameString(0LL, *((void **)v4 + 5)) & 1) != 0);

  return v5;
}

id VMUidentifyRegionTypeFromUserTag(int a1, unsigned __int8 a2, int a3, int a4)
{
  if (a1) {
    VMUExclaveRegionTypeDescriptionForTagShareProtAndPager(a2);
  }
  else {
    VMURegionTypeDescriptionForTagShareProtAndPager(a2, a3, a4, 0);
  }
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 3 && a4)
  {
    uint64_t v7 = [NSString stringWithFormat:@"%@%@", v6, VMUreservedLabelSuffix];

    unint64_t v6 = (void *)v7;
  }

  return v6;
}

int *setCollectPhysFootprint(int a1)
{
  int v4 = a1;
  SEL result = (int *)sysctlbyname("vm.self_region_footprint", 0LL, 0LL, &v4, 4uLL);
  if ((_DWORD)result)
  {
    SEL result = __error();
    if (*result != 2)
    {
      int v2 = (FILE *)*MEMORY[0x1895F89D0];
      id v3 = __error();
      return (int *)fprintf(v2, "Error setting sysctl: %s. %d.\n", "vm.self_region_footprint", *v3);
    }
  }

  return result;
}

void markMachOLibraries(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, __int16 a6)
{
  id v9 = a1;
  id v10 = a4;
  [v10 objectAtIndexedSubscript:0];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 range];

  [v10 lastObject];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 range];

  os_signpost_id_t v27 = (void *)objc_opt_new();
  uint64_t v25 = (void *)objc_opt_new();
  v34[0] = 0LL;
  v34[1] = v34;
  v34[2] = 0x2020000000LL;
  char v35 = 0;
  CSSymbolicatorIsKernelSymbolicator();
  CSIsNull();
  id v30 = v27;
  id v31 = v25;
  id v32 = v9;
  id v33 = v10;
  CSSymbolicatorForeachSymbolOwnerAtTime();
  id v29 = v30;
  id v26 = v31;
  id v28 = v32;
  id v13 = v33;
  CSSymbolicatorForeachSymbolOwnerAtTime();
  CSRelease();
  unint64_t v14 = [v13 count];
  if (v14)
  {
    for (unint64_t i = 0LL; i < v14; ++i)
    {
      [v13 objectAtIndexedSubscript:i];
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = v16[1];
      if ((v17 & 0xFFF) == 0)
      {
        uint64_t v18 = v16[2];
        unint64_t v19 = v18 + v17;
        uint64_t v20 = (v18 + v17) & 0xFFF;
        if (v20)
        {
          if (i == v14 - 1)
          {
            v16[2] = v18 - v20 + 4096;
          }

          else
          {
            [v13 objectAtIndexedSubscript:i + 1];
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v22 = v21;
            uint64_t v23 = v21[1];
            if ((v23 ^ v19) >= 0x1000)
            {
              v16[2] = v16[2] - v20 + 4096;
            }

            else if (!v21[4])
            {
              if (v21[2] + v23 <= (unint64_t)(v16[1] + v16[2] + 4096 - v20))
              {
                [v16 addInfoFromRegion:v21];
                [v13 removeObjectAtIndex:i + 1];
                --v14;
              }

              else
              {
                [v21 breakAtLength:];
                uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
                if (v24)
                {
                  [v16 addInfoFromRegion:v22];
                  [v13 replaceObjectAtIndex:i + 1 withObject:v24];
                }
              }
            }
          }
        }
      }
    }
  }

  _Block_object_dispose(v34, 8);
}

void sub_186125870(_Unwind_Exception *a1)
{
}

void markMallocAreas(void *a1, void *a2, void *a3, void *a4, int a5, void *a6)
{
  uint64_t v71 = *MEMORY[0x1895F89C0];
  id v11 = a1;
  id v12 = a2;
  id v13 = a3;
  id v14 = a6;
  if ((a5 & 0x400) == 0)
  {
    if ([v11 taskType] == 2)
    {
      uint64_t v15 = calloc(1uLL, 0x50uLL);
      NSMapInsertKnownAbsent(v13, @"zalloc (no zone)", v15);
    }

    else
    {
      [v12 objectAtIndexedSubscript:0];
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = (void *)[v16 range];

      [v12 lastObject];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      __int128 v46 = v13;
      uint64_t v19 = [v18 range];
      uint64_t v21 = v20;

      uint64_t v22 = (void *)(v21 - (void)v17 + v19);
      uint64_t v23 = " Aborting";
      if ([v11 isCore])
      {
        BOOL v24 = 0;
      }

      else
      {
        int v25 = [v11 taskPort];
        BOOL v24 = v25 == *MEMORY[0x1895FBBE0];
        if (v25 == *MEMORY[0x1895FBBE0]) {
          uint64_t v23 = "";
        }
      }

      v54[0] = v12;
      v54[1] = v17;
      v54[2] = v22;
      v54[3] = a4;
      BOOL v55 = v24;
      BOOL v56 = (a5 & 0x800000) != 0;
      uint64_t v57 = v23;
      uint64_t v58 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v60 = 0LL;
      uint64_t v61 = 0LL;
      uint64_t v59 = 0LL;
      uint64_t v26 = MEMORY[0x1895F87A8];
      v51[0] = MEMORY[0x1895F87A8];
      v51[1] = 3221225472LL;
      v51[2] = __markMallocAreas_block_invoke;
      v51[3] = &unk_189DFEFD8;
      id v27 = v54[0];
      id v52 = v27;
      BOOL v53 = v56;
      VMUTask_foreach_malloc_zone(v11, v51);
      id v13 = v46;
      if (v14 && [v14 signpostID])
      {
        [v14 logHandle];
        id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_signpost_id_t v29 = [v14 signpostID];
        if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v28,  OS_SIGNPOST_INTERVAL_END,  v29,  "recordRegions",  "",  buf,  2u);
        }
      }

      [v14 endEvent:"recordRegions"];
      [v14 startWithCategory:"recordRegions" message:"marking malloc VM regions"];
      if (v14)
      {
        [v14 logHandle];
        id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_signpost_id_t v31 = [v14 signpostID];
        if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl( &dword_1860C5000,  v30,  OS_SIGNPOST_INTERVAL_BEGIN,  v31,  "recordRegions",  "marking malloc VM regions",  buf,  2u);
        }
      }

      id v32 = v11;
      *(void *)buf = v26;
      uint64_t v63 = 3221225472LL;
      BOOL v64 = ___markRegionsForMallocZones_block_invoke;
      dispatch_time_t v65 = &unk_189DFF078;
      id v66 = v32;
      os_signpost_id_t v67 = v54;
      LOBYTE(v6_Block_object_dispose((const void *)(v1 - 136), 8) = v56;
      id v33 = v32;
      withPeekFunctionForVMUTask(v33, buf);

      if ((a5 & 0x100) == 0)
      {
        if (v14 && [v14 signpostID])
        {
          [v14 logHandle];
          uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          os_signpost_id_t v35 = [v14 signpostID];
          if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl( &dword_1860C5000,  v34,  OS_SIGNPOST_INTERVAL_END,  v35,  "recordRegions",  "",  buf,  2u);
          }
        }

        [v14 endEvent:"recordRegions"];
        [v14 startWithCategory:"recordRegions" message:"marking malloc allocations in VM regions"];
        if (v14)
        {
          [v14 logHandle];
          uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          os_signpost_id_t v37 = [v14 signpostID];
          if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl( &dword_1860C5000,  v36,  OS_SIGNPOST_INTERVAL_BEGIN,  v37,  "recordRegions",  "marking malloc allocations in VM regions",  buf,  2u);
          }
        }

        id v38 = v33;
        uint64_t v39 = v46;
        *(void *)buf = v26;
        uint64_t v63 = 3221225472LL;
        BOOL v64 = ___getRegionMallocStatistics_block_invoke;
        dispatch_time_t v65 = &unk_189DFF0F0;
        id v66 = v38;
        os_signpost_id_t v67 = v39;
        v68 = v54;
        BOOL v69 = v56;
        BOOL v40 = v39;
        id v41 = v38;
        withPeekFunctionForVMUTask(v41, buf);
      }

      __int128 v49 = 0u;
      __int128 v50 = 0u;
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      id v42 = v27;
      uint64_t v43 = [v42 countByEnumeratingWithState:&v47 objects:v70 count:16];
      if (v43)
      {
        uint64_t v44 = *(void *)v48;
        do
        {
          for (uint64_t i = 0LL; i != v43; ++i)
          {
            if (*(void *)v48 != v44) {
              objc_enumerationMutation(v42);
            }
            setTypeIfMallocRegion(*(void **)(*((void *)&v47 + 1) + 8 * i));
          }

          uint64_t v43 = [v42 countByEnumeratingWithState:&v47 objects:v70 count:16];
        }

        while (v43);
      }

      __destructor_8_s0_s56_s64_sb72(v54);
    }
  }
}

void sub_186125E1C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

void markStacks(void *a1, void *a2)
{
  id v25 = a1;
  id v3 = a2;
  unint64_t v4 = [v25 count];
  int v5 = [v3 threadCount];
  if (v5)
  {
    LODWORD(v6) = v5;
    do
    {
      uint64_t v6 = (v6 - 1);
      unint64_t v7 = [v3 stackPointerForThreadNum:v6];
      uint64_t v26 = 0LL;
      unint64_t RegionForAddress = findRegionForAddress(v25, v7, (void **)&v26);
      uint64_t v9 = v26;
      if (v26)
      {
        unint64_t v10 = RegionForAddress;
        while (!*(void *)(v9 + 32))
        {
          if (*(_DWORD *)(v9 + 24)) {
            break;
          }
          if (*(_BYTE *)(v9 + 50) != 3) {
            break;
          }
          if (++v10 >= v4) {
            break;
          }
          uint64_t v11 = [v25 objectAtIndex:v10];

          uint64_t v9 = v11;
          if (!v11) {
            goto LABEL_13;
          }
        }

        if (!*(void *)(v9 + 32) && *(_DWORD *)(v9 + 24) && [(id)v9 isStack])
        {
          id v12 = *(void **)(v9 + 32);
          *(void *)(v9 + 32) = @"Stack";

          uint64_t v13 = [MEMORY[0x189NSStringormat:@"thread %d" v6];
          id v14 = *(void **)(v9 + 40);
          *(void *)(v9 + 40) = v13;

          if (v10 + 1 < v4)
          {
            uint64_t v15 = [v25 objectAtIndex:];
            if (!*(void *)(v15 + 32)
              && [(id)v9 isStack]
              && *(void *)(v9 + 16) + *(void *)(v9 + 8) == *(void *)(v15 + 8)
              && [(id)v9 hasSameInfoAsRegion:v15])
            {
              objc_storeStrong((id *)(v15 + 32), *(id *)(v9 + 32));
              objc_storeStrong((id *)(v15 + 40), *(id *)(v9 + 40));
            }
          }

          if (v10 >= 2)
          {
            unint64_t v16 = v10 - 1;
            while (1)
            {
              uint64_t v17 = [v25 objectAtIndex:v16];
              unint64_t v18 = v16 + 1;
              uint64_t v19 = [v25 objectAtIndex:v16 + 1];
              uint64_t v20 = (void *)v19;
              if (*(void *)(v17 + 32)
                || *(void *)(v17 + 16) + *(void *)(v17 + 8) != *(void *)(v19 + 8)
                || ![(id)v17 isStack])
              {
                break;
              }

              int v21 = *(_DWORD *)(v17 + 24);
              if (v21 == 3)
              {
                objc_storeStrong((id *)(v17 + 32), *(id *)(v9 + 32));
                objc_storeStrong((id *)(v17 + 40), *(id *)(v9 + 40));
              }

              else if (!v21)
              {
                uint64_t v22 = *(void **)(v17 + 32);
                *(void *)(v17 + 32) = @"STACK GUARD";

                uint64_t v23 = [MEMORY[0x189NSStringormat:@"stack guard for thread %d" v6];
                BOOL v24 = *(void **)(v17 + 40);
                *(void *)(v17 + 40) = v23;

                break;
              }

              unint64_t v16 = v18 - 2;
              if (v18 == 2) {
                goto LABEL_13;
              }
            }
          }
        }
      }

void markIOSurfaces(void *a1, void *a2, __int16 a3)
{
  uint64_t v117 = *MEMORY[0x1895F89C0];
  id v81 = a1;
  id v5 = a2;
  if ((a3 & 0x400) != 0) {
    goto LABEL_69;
  }
  __int128 v110 = 0u;
  __int128 v111 = 0u;
  __int128 v108 = 0u;
  __int128 v109 = 0u;
  id v72 = v5;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v108 objects:v116 count:16];
  if (!v7)
  {
LABEL_10:

    goto LABEL_68;
  }

  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v109;
LABEL_4:
  uint64_t v10 = 0LL;
  while (1)
  {
    if (*(void *)v109 != v9) {
      objc_enumerationMutation(v6);
    }
    if ([*(id *)(*((void *)&v108 + 1) + 8 * v10) isIOSurface]) {
      break;
    }
    if (v8 == ++v10)
    {
      uint64_t v8 = [v6 countByEnumeratingWithState:&v108 objects:v116 count:16];
      if (!v8) {
        goto LABEL_10;
      }
      goto LABEL_4;
    }
  }

  context = (void *)MEMORY[0x186E32E40]();
  [v81 ioSurfaceDescriptions];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11) {
    goto LABEL_67;
  }
  BOOL v69 = v6;
  id v12 = v11;
  uint64_t v13 = (void *)objc_opt_new();
  os_signpost_id_t v83 = (void *)objc_opt_new();
  uint64_t v82 = (void *)objc_opt_new();
  v80 = (void *)objc_opt_new();
  __int128 v104 = 0u;
  __int128 v105 = 0u;
  __int128 v106 = 0u;
  __int128 v107 = 0u;
  id v70 = v12;
  obuint64_t j = v12;
  unint64_t v14 = 0x189607000uLL;
  v84 = v13;
  uint64_t v74 = [obj countByEnumeratingWithState:&v104 objects:v115 count:16];
  if (!v74) {
    goto LABEL_37;
  }
  uint64_t v73 = *(void *)v105;
  do
  {
    uint64_t v15 = 0LL;
    do
    {
      if (*(void *)v105 != v73) {
        objc_enumerationMutation(obj);
      }
      uint64_t v78 = v15;
      unint64_t v16 = *(void **)(*((void *)&v104 + 1) + 8 * v15);
      int v89 = [v81 pid];
      int v87 = [v16 integerValue];
      uint64_t v17 = v16;
      [obj objectForKeyedSubscript:v16];
      unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      __int128 v100 = 0u;
      __int128 v101 = 0u;
      __int128 v102 = 0u;
      __int128 v103 = 0u;
      id v85 = v18;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v100 objects:v114 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v101;
        do
        {
          for (uint64_t i = 0LL; i != v20; ++i)
          {
            if (*(void *)v101 != v21) {
              objc_enumerationMutation(v85);
            }
            uint64_t v23 = *(void **)(*((void *)&v100 + 1) + 8 * i);
            uint64_t v24 = [v23 surfaceID];
            [MEMORY[0x189607968] numberWithUnsignedInt:v24];
            id v25 = (void *)objc_claimAutoreleasedReturnValue();
            [v13 objectForKeyedSubscript:v25];
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v26)
            {
              uint64_t v26 = (void *)objc_opt_new();
              [MEMORY[0x189607968] numberWithUnsignedInt:v24];
              id v27 = (void *)objc_claimAutoreleasedReturnValue();
              [v13 setObject:v26 forKeyedSubscript:v27];
            }

            [v26 addObject:v17];
            if (v89 == v87)
            {
              unsigned int v28 = [v23 pixelFormat];
              int v29 = v28;
              unsigned int v30 = HIBYTE(v28);
              if ((v28 & 0x80000000) != 0)
              {
                if (!__maskrune(HIBYTE(v28), 0x800uLL)) {
                  goto LABEL_29;
                }
LABEL_27:
                __str[0] = v30;
                __str[1] = BYTE2(v29);
                __str[2] = BYTE1(v29);
                __str[3] = v29;
                __str[4] = 0;
              }

              else
              {
                if ((*(_DWORD *)(MEMORY[0x1895F8770] + 4LL * v30 + 60) & 0x800) != 0) {
                  goto LABEL_27;
                }
LABEL_29:
                snprintf(__str, 5uLL, "%4d", v29);
              }

              [MEMORY[0x189607968] numberWithUnsignedInt:v24];
              os_signpost_id_t v31 = (void *)objc_claimAutoreleasedReturnValue();
              [MEMORY[0x189607968] numberWithUnsignedLongLong:[v23 virtualAddress]];
              id v32 = (void *)objc_claimAutoreleasedReturnValue();
              [v82 setObject:v31 forKeyedSubscript:v32];

              id v33 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189607940]),  "initWithFormat:",  @"SurfaceID: %#x  %llux%llu (%s) %s",  v24,  objc_msgSend(v23, "width"),  objc_msgSend(v23, "height"),  __str,  VMUMemorySizeString(objc_msgSend(v23, "allocationSize")));
              [v23 name];
              uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v35 = [v34 length];

              if (v35)
              {
                [v23 name];
                uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
                [v33 appendFormat:@"  '%@'", v36];
              }

              unint64_t v14 = 0x189607000uLL;
              [MEMORY[0x189607968] numberWithUnsignedLongLong:[v23 virtualAddress]];
              os_signpost_id_t v37 = (void *)objc_claimAutoreleasedReturnValue();
              [v83 setObject:v33 forKeyedSubscript:v37];

              uint64_t v13 = v84;
            }
          }

          uint64_t v20 = [v85 countByEnumeratingWithState:&v100 objects:v114 count:16];
        }

        while (v20);
      }

      uint64_t v15 = v78 + 1;
    }

    while (v78 + 1 != v74);
    uint64_t v74 = [obj countByEnumeratingWithState:&v104 objects:v115 count:16];
  }

  while (v74);
LABEL_37:

  __int128 v97 = 0u;
  __int128 v98 = 0u;
  __int128 v95 = 0u;
  __int128 v96 = 0u;
  id v38 = v69;
  uint64_t v39 = [v38 countByEnumeratingWithState:&v95 objects:v113 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v96;
    uint64_t v75 = *(void *)v96;
    id obja = v38;
    do
    {
      uint64_t v42 = 0LL;
      uint64_t v79 = v40;
      do
      {
        if (*(void *)v96 != v41) {
          objc_enumerationMutation(v38);
        }
        uint64_t v43 = *(void **)(*((void *)&v95 + 1) + 8 * v42);
        if ([v43 isIOSurface])
        {
          uint64_t v90 = v42;
          [*(id *)(v14 + 2408) numberWithUnsignedLongLong:v43[1]];
          uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
          [v83 objectForKeyedSubscript:v44];
          unint64_t v45 = v43;
          __int128 v46 = (void *)objc_claimAutoreleasedReturnValue();

          v88 = v45;
          [*(id *)(v14 + 2408) numberWithUnsignedLongLong:v45[1]];
          __int128 v47 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v48 = [v82 objectForKeyedSubscript:v47];

          __int128 v49 = (void *)v48;
          [v84 objectForKeyedSubscript:v48];
          __int128 v50 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)[v50 count] >= 2)
          {
            id v86 = (id)v48;
            __int128 v93 = 0u;
            __int128 v94 = 0u;
            __int128 v91 = 0u;
            __int128 v92 = 0u;
            id v51 = v50;
            uint64_t v52 = [v51 countByEnumeratingWithState:&v91 objects:v112 count:16];
            if (v52)
            {
              uint64_t v53 = v52;
              char v54 = 0;
              uint64_t v55 = *(void *)v92;
              do
              {
                for (uint64_t j = 0LL; j != v53; ++j)
                {
                  if (*(void *)v92 != v55) {
                    objc_enumerationMutation(v51);
                  }
                  uint64_t v57 = [*(id *)(*((void *)&v91 + 1) + 8 * j) intValue];
                  int v58 = [v81 pid];
                  if ((_DWORD)v57) {
                    BOOL v59 = (_DWORD)v57 == v58;
                  }
                  else {
                    BOOL v59 = 1;
                  }
                  if (!v59)
                  {
                    if ((v54 & 1) == 0) {
                      [v46 appendString:@", shared with"];
                    }
                    [*(id *)(v14 + 2408) numberWithInt:v57];
                    uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue();
                    [v80 objectForKeyedSubscript:v60];
                    uint64_t v61 = (__CFString *)objc_claimAutoreleasedReturnValue();

                    if (!v61)
                    {
                      uint64_t v62 = -[VMUProcInfo initWithPid:](objc_alloc(&OBJC_CLASS___VMUProcInfo), "initWithPid:", v57);
                      uint64_t v63 = -[VMUProcInfo name](v62, "name");
                      BOOL v64 = (void *)v63;
                      dispatch_time_t v65 = @"<unknown>";
                      if (v63) {
                        dispatch_time_t v65 = (__CFString *)v63;
                      }
                      uint64_t v61 = v65;

                      [MEMORY[0x189607968] numberWithInt:v57];
                      id v66 = (void *)objc_claimAutoreleasedReturnValue();
                      [v80 setObject:v61 forKeyedSubscript:v66];
                    }

                    os_signpost_id_t v67 = v61;
                    [v46 appendFormat:@" %s[%u]" v67, v57];

                    char v54 = 1;
                    unint64_t v14 = 0x189607000LL;
                  }
                }

                uint64_t v53 = [v51 countByEnumeratingWithState:&v91 objects:v112 count:16];
              }

              while (v53);
            }

            uint64_t v41 = v75;
            id v38 = obja;
            uint64_t v40 = v79;
            __int128 v49 = v86;
          }

          v68 = (void *)v88[5];
          v88[5] = v46;

          uint64_t v42 = v90;
        }

        ++v42;
      }

      while (v42 != v40);
      uint64_t v40 = [v38 countByEnumeratingWithState:&v95 objects:v113 count:16];
    }

    while (v40);
  }

  uint64_t v11 = v70;
LABEL_67:

  objc_autoreleasePoolPop(context);
LABEL_68:
  id v5 = v72;
LABEL_69:
}

void __listKernelCoreRegions_block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (char *)objc_opt_new();
  *(_OWORD *)(v4 + _Block_object_dispose((const void *)(v1 - 136), 8) = *(_OWORD *)a2;
  *((_DWORD *)v4 + 6) = *(_DWORD *)(a2 + 32);
  *((_DWORD *)v4 + 7) = *(_DWORD *)(a2 + 36);
  v4[50] = 2;
  *((_DWORD *)v4 + 13) = 3;
  [*(id *)(a1 + 32) addObject:v4];
}

void __listKernelCoreRegions_block_invoke_2(uint64_t a1)
{
  unint64_t Range = CSRegionGetRange();
  id v5 = 0LL;
  findRegionForAddress(*(void **)(a1 + 32), Range, (void **)&v5);
  id v3 = v5;
  if (v5)
  {
    *((_BYTE *)v5 + 132) |= 2u;
    if (!v3[4])
    {
      unint64_t v4 = v3;
      objc_storeStrong(v3 + 5, (id)VMUunusedButDirtySharedLibDataPath);
      id v3 = v4;
    }
  }
}

unint64_t findRegionForAddress(void *a1, unint64_t a2, void **a3)
{
  id v5 = a1;
  id v6 = 0LL;
  unint64_t v7 = 0LL;
  unint64_t v8 = [v5 count] - 1;
  while (1)
  {
    uint64_t v9 = v6;
    unint64_t v10 = v7 + ((v8 - v7) >> 1);
    [v5 objectAtIndex:v10];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6[1] > a2)
    {
      if (!v10) {
        goto LABEL_9;
      }
      unint64_t v8 = v10 - 1;
      goto LABEL_8;
    }

    if (v6[2] + v6[1] > a2) {
      break;
    }
    if (v10 >= v8) {
      goto LABEL_9;
    }
    unint64_t v7 = v10 + 1;
LABEL_8:
    if (v7 > v8)
    {
LABEL_9:
      uint64_t v11 = 0LL;
      unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_10;
    }
  }

  uint64_t v11 = v6;
LABEL_10:
  id v12 = *a3;
  *a3 = v11;

  return v10;
}

void __listKernelCoreRegions_block_invoke_3( uint64_t a1, void *a2, unint64_t a3, uint64_t a4, int a5, int a6)
{
  unint64_t v10 = a2;
  id v27 = a2;
  if ([*(id *)(a1 + 32) count])
  {
    unint64_t v12 = 0LL;
    uint64_t v13 = a4 - a3;
    if (a6) {
      int v14 = 1;
    }
    else {
      int v14 = 3;
    }
    uint64_t v15 = (void *)MEMORY[0x1895FD590];
    int v32 = a5;
    unsigned int v30 = v10;
    unint64_t v31 = a3;
    uint64_t v29 = v13;
    int v28 = v14;
    do
    {
      uint64_t v16 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v12];
      if (VMURangeIntersectsRange(a3, v13, *(void *)(v16 + 8), *(void *)(v16 + 16)))
      {
        *(_DWORD *)(v16 + 104) = 1;
        objc_storeStrong((id *)(v16 + 32), v10);
        *(_DWORD *)(v16 + 2_Block_object_dispose((const void *)(v1 - 136), 8) = 3;
        *(_DWORD *)(v16 + 24) = v14;
        if (a5)
        {
          *(_DWORD *)(v16 + 144) = a5;
          uint64_t v17 = *(void **)(v16 + 40);
          *(void *)(v16 + 40) = @"zalloc (no zone)";
        }

        unint64_t v18 = *(void *)(v16 + 16) >> *MEMORY[0x1895FD580];
        if (v18 >= 2)
        {
          unint64_t v19 = v18 - 1;
          [MEMORY[0x189603FA8] arrayWithCapacity:v18 - 1];
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
          id v21 = (id)v16;
          unint64_t v22 = v19;
          do
          {
            [v21 breakAtLength:*v15];
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
            {
              [v20 addObject:v23];
              id v24 = v23;

              id v21 = v24;
            }

            --v22;
          }

          while (v22);
          id v25 = *(void **)(a1 + 32);
          [MEMORY[0x1896078D0] indexSetWithIndexesInRange:v12 + 1, v19];
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
          [v25 insertObjects:v20 atIndexes:v26];

          v12 += v19;
          a5 = v32;
          unint64_t v10 = v30;
          a3 = v31;
          uint64_t v13 = v29;
          int v14 = v28;
        }
      }

      ++v12;
    }

    while (v12 < [*(id *)(a1 + 32) count]);
  }
}

id getRegionData(void *a1, void *a2, void *a3, uint64_t *a4)
{
  id v7 = a1;
  unint64_t v8 = v7;
  LODWORD(v17) = 9999;
  if (a4) {
    uint64_t v9 = a4;
  }
  else {
    uint64_t v9 = &v17;
  }
  [v7 memoryCache:v17];
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  mach_error_t v11 = [v10 machVMRegionRecurseSubmapInfo64onAddress:a2 size:a3 nestingDepth:v9 info:(char *)&v17 + 4];

  if (v11)
  {
    if (v11 != 1) {
      mach_error("vm_region", v11);
    }
    uint64_t v12 = 0LL;
  }

  else
  {
    uint64_t v12 = objc_opt_new();
    *(void *)(v12 + _Block_object_dispose((const void *)(v1 - 136), 8) = *a2;
    *(void *)(v12 + 16) = *a3;
    *(_DWORD *)(v12 + 24) = HIDWORD(v17);
    *(_DWORD *)(v12 + 2_Block_object_dispose((const void *)(v1 - 136), 8) = v18;
    *(_BYTE *)(v12 + 49) = v22;
    *(_DWORD *)(v12 + 12_Block_object_dispose((const void *)(v1 - 136), 8) = *(_DWORD *)v9;
    *(_BYTE *)(v12 + 132) = *(_BYTE *)(v12 + 132) & 0xFE | (v24 != 0);
    *(_BYTE *)(v12 + 132) = *(_BYTE *)(v12 + 132) & 0xEF | (16 * (v26 != 0));
    *(_BYTE *)(v12 + 50) = v23;
    *(void *)(v12 + 56) = 0LL;
    *(void *)(v12 + 96) = v21;
    *(_DWORD *)(v12 + 104) = v20;
    *(void *)(v12 + 112) = v25;
    *(void *)(v12 + 120) = v19;
    *(void *)(v12 + 224) = v27;
    [v8 memoryCache];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    int v14 = [v13 machVMPurgableControlWithAddress:*a2 control:1 state:v12 + 52];

    if (v14) {
      *(_DWORD *)(v12 + 52) = 3;
    }
    *(_BYTE *)(v12 + 232) = [v8 isExclave];
    if (*(_BYTE *)(v12 + 232))
    {
      [v8 memoryCache];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[VMUTaskMemoryCache getExclaveVMFlagsForAddress:exclaveVMFlags:]((uint64_t)v15);
    }
  }

  return (id)v12;
}

uint64_t __listAllRegions_block_invoke(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 1;
  return result;
}

void recursivelyListAllRegions( void *a1, void *a2, uint64_t a3, unint64_t a4, uint64_t a5, int a6, _BYTE *a7)
{
  id v13 = a1;
  id v14 = a2;
  unint64_t v22 = a4;
  if (!*a7)
  {
    while (1)
    {
      uint64_t v21 = 0LL;
      int v20 = a6;
      uint64_t v15 = getRegionData(v13, &v22, &v21, (uint64_t *)&v20);
      uint64_t v16 = (void *)v15;
      if (!v15) {
        break;
      }
      if (!VMURangeContainsRange(a4, a5, *(void *)(v15 + 8), *(void *)(v15 + 16)) || v20 != a6) {
        break;
      }
      char v18 = [v16 isNullRegion];
      if ((a3 & 0x20) != 0 || (v18 & 1) == 0)
      {
        if (![v13 isCore]
          || (char v19 = [v16 isOwnedUnmappedMemory], (a3 & 0x10000) != 0)
          || (v19 & 1) == 0)
        {
          [v14 addObject:v16];
        }
      }

      v22 += v21;

      if (*a7) {
        goto LABEL_19;
      }
    }
  }

void __markMachOLibraries_block_invoke(id *a1)
{
  v6[0] = 0LL;
  v6[1] = v6;
  v6[2] = 0x3032000000LL;
  v6[3] = __Block_byref_object_copy__7;
  v6[4] = __Block_byref_object_dispose__7;
  id v7 = 0LL;
  id v2 = a1[4];
  id v3 = a1[5];
  id v4 = a1[6];
  id v5 = a1[7];
  CSSymbolOwnerForeachSegment();

  _Block_object_dispose(v6, 8);
}

void sub_1861273DC(_Unwind_Exception *a1)
{
}

void __markMachOLibraries_block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x186E32E40]();
  unint64_t Range = CSRegionGetRange();
  uint64_t v5 = v4;
  if (VMURangeIntersectsRange(Range, v4, *(void *)(a1 + 80), *(void *)(a1 + 88)))
  {
    getBinarySegmentName();
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v7 = v6;
    if (*(_BYTE *)(a1 + 112) || *(_BYTE *)(a1 + 113))
    {
      if ([v6 isEqualToString:@"__LINKEDIT"])
      {
        uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8LL);
        if (*(_BYTE *)(v8 + 24))
        {
LABEL_17:

          goto LABEL_18;
        }

        *(_BYTE *)(v8 + 24) = 1;
        if (*(_BYTE *)(a1 + 113)) {
          uint64_t v9 = @"kernelcache combined __LINKEDIT";
        }
        else {
          uint64_t v9 = @"dyld shared cache combined __LINKEDIT";
        }
        goto LABEL_13;
      }

      if (*(_BYTE *)(a1 + 114))
      {
        unint64_t v10 = *(void **)(a1 + 32);
        [MEMORY[0x189607968] numberWithUnsignedLong:Range];
        mach_error_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        [v10 addObject:v11];
LABEL_16:

        goto LABEL_17;
      }
    }

    uint64_t v9 = *(__CFString **)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
    if (!v9)
    {
      [NSString stringWithUTF8String:CSSymbolOwnerGetPath()];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = [v12 stringByResolvingSymlinksInPath];
      uint64_t v14 = *(void *)(*(void *)(a1 + 72) + 8LL);
      uint64_t v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;

      uint64_t v9 = *(__CFString **)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
    }

__CFString *getBinarySegmentName()
{
  uint64_t Name = CSRegionGetName();
  else {
    uint64_t v1 = (__CFString *)[objc_alloc(MEMORY[0x1896NSStringes:Name length:&strchr((const char *)Name, 32)[-Name] encoding:4];
  }
  return v1;
}

void setTypeAndPath( void *a1, void *a2, unint64_t a3, uint64_t a4, void *a5, void *a6, int a7, uint64_t a8)
{
  id v35 = a1;
  id v15 = a2;
  id v36 = a5;
  VMUSanitizePath(a6);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v40 = 0LL;
  unint64_t RegionForAddress = findRegionForAddress(v15, a3, &v40);
  unint64_t v17 = [v15 count];
  char v18 = v40;
  if (RegionForAddress < v17)
  {
    unint64_t v19 = v17;
    if (a7) {
      char v20 = 2;
    }
    else {
      char v20 = 0;
    }
    char v37 = v20;
    uint64_t v21 = v36;
    while (1)
    {
      uint64_t v22 = [v15 objectAtIndex:RegionForAddress];

      if ((*(_BYTE *)(v22 + 132) & 1) == 0) {
        break;
      }
LABEL_32:
      ++RegionForAddress;
      char v18 = (void *)v22;
      if (RegionForAddress >= v19) {
        goto LABEL_35;
      }
    }

    if (*(void *)(v22 + 8) > *MEMORY[0x1895FD590] + a4 + a3) {
      goto LABEL_35;
    }
    context = (void *)MEMORY[0x186E32E40]();
    if (!VMURangeIntersectsRange(*(void *)(v22 + 8), *(void *)(v22 + 16), a3, a4))
    {
LABEL_31:
      objc_autoreleasePoolPop(context);
      goto LABEL_32;
    }

    unint64_t v23 = *(void *)(v22 + 8);
    if (a3 > v23)
    {
      [(id)v22 breakAtLength:a3 - v23];
      int v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        [v15 insertObject:v24 atIndex:++RegionForAddress];
        uint64_t v25 = a8;
        id v26 = v24;

        ++v19;
        uint64_t v22 = (uint64_t)v26;
        a8 = v25;
        uint64_t v21 = v36;
      }

      unint64_t v23 = *(void *)(v22 + 8);
    }

    uint64_t v27 = *(void *)(v22 + 16);
    if (a4 + a3 >= v27 + v23)
    {
      a3 += v27;
      a4 -= v27;
    }

    else if (*MEMORY[0x1895FD590] <= 0x1000uLL {
           || (objc_msgSend(v35, "rangeIsInSharedCache:", a3, a4) & 1) != 0
    }
           || !*(_BYTE *)(v22 + 49)
           || ([v21 isEqualToString:@"__LINKEDIT"] & 1) == 0)
    {
      [(id)v22 breakAtLength:a4];
      int v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        [v15 insertObject:v28 atIndex:RegionForAddress + 1];
        ++v19;
      }
    }

    *(_BYTE *)(v22 + 132) = *(_BYTE *)(v22 + 132) & 0xFD | v37;
    if ((a8 & 1) == 0 && (*(_BYTE *)(v22 + 24) & 2) != 0) {
      *(_BYTE *)(v22 + 132) |= 4u;
    }
    uint64_t v29 = *(void **)(v22 + 32);
    if (v29)
    {
      [v29 rangeOfString:v21];
      if (v30)
      {
LABEL_30:
        objc_storeStrong((id *)(v22 + 40), obj);
        goto LABEL_31;
      }

      id v31 = *(id *)(v22 + 32);
      uint64_t v32 = [v31 stringByAppendingPathComponent:v21];
      id v33 = *(void **)(v22 + 32);
      *(void *)(v22 + 32) = v32;
    }

    else
    {
      id v34 = v21;
      id v31 = *(id *)(v22 + 32);
      *(void *)(v22 + 32) = v34;
    }

    goto LABEL_30;
  }

  uint64_t v22 = (uint64_t)v40;
  uint64_t v21 = v36;
LABEL_35:
}

void __markMachOLibraries_block_invoke_3(id *a1)
{
  v6[0] = 0LL;
  v6[1] = v6;
  v6[2] = 0x3032000000LL;
  v6[3] = __Block_byref_object_copy__7;
  v6[4] = __Block_byref_object_dispose__7;
  id v7 = 0LL;
  id v2 = a1[4];
  id v3 = a1[5];
  id v4 = a1[6];
  id v5 = a1[7];
  CSSymbolOwnerForeachSegment();

  _Block_object_dispose(v6, 8);
}

void sub_186127A9C(_Unwind_Exception *a1)
{
}

void __markMachOLibraries_block_invoke_4(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x186E32E40]();
  unint64_t Range = CSRegionGetRange();
  uint64_t v5 = v4;
  if (VMURangeIntersectsRange(Range, v4, *(void *)(a1 + 72), *(void *)(a1 + 80)))
  {
    getBinarySegmentName();
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (([v6 isEqualToString:@"__LINKEDIT"] & 1) == 0)
    {
      id v7 = *(void **)(a1 + 32);
      [MEMORY[0x189607968] numberWithUnsignedLong:Range];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = [v7 containsObject:v8];

      if ((v9 & 1) == 0)
      {
        uint64_t v10 = [(id)VMUunusedSharedLibLabelOrPathPrefix stringByAppendingString:v6];

        id v6 = (void *)v10;
      }

      [*(id *)(a1 + 40) member:v6];
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        [*(id *)(a1 + 40) addObject:v6];
        id v11 = v6;
      }

      uint64_t v12 = *(void *)(a1 + 64);
      if (!*(void *)(*(void *)(v12 + 8) + 40LL))
      {
        [NSString stringWithUTF8String:CSSymbolOwnerGetPath()];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v14 = [v13 stringByResolvingSymlinksInPath];
        uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8LL);
        id v16 = *(void **)(v15 + 40);
        *(void *)(v15 + 40) = v14;

        uint64_t v12 = *(void *)(a1 + 64);
        if ((v9 & 1) == 0)
        {
          uint64_t v17 = [(id)VMUunusedSharedLibLabelOrPathPrefix stringByAppendingString:*(void *)(*(void *)(v12 + 8) + 40)];
          uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8LL);
          unint64_t v19 = *(void **)(v18 + 40);
          *(void *)(v18 + 40) = v17;

          uint64_t v12 = *(void *)(a1 + 64);
        }
      }

      setTypeAndPath( *(void **)(a1 + 48),  *(void **)(a1 + 56),  Range,  v5,  v11,  *(void **)(*(void *)(v12 + 8) + 40LL),  v9,  v9);
    }
  }

  objc_autoreleasePoolPop(v2);
}

uint64_t __markMallocAreas_block_invoke(uint64_t a1, unint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  uint64_t v12 = 0LL;
  findRegionForAddress(*(void **)(a1 + 32), a2, (void **)&v12);
  id v7 = v12;
  if (v12)
  {
    if (!v12[5])
    {
      uint64_t v8 = [v6 stringByAppendingString:@" zone structure"];
      uint64_t v9 = (void *)v7[5];
      v7[5] = v8;

      if (*(_BYTE *)(a1 + 40))
      {
        id v10 = [v7 description];
        printf( "Setting region name in %s based on malloc zone structure address for  %s\n",  "markMallocAreas_block_invoke",  (const char *)[v10 UTF8String]);
      }
    }
  }

  return 0LL;
}

void __destructor_8_s0_s56_s64_sb72(id *a1)
{
}

void ___markRegionsForMallocZones_block_invoke(uint64_t a1, uint64_t a2)
{
  v11[0] = 0LL;
  v11[1] = v11;
  v11[2] = 0x2020000000LL;
  int v12 = 0;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = ___markRegionsForMallocZones_block_invoke_2;
  v5[3] = &unk_189DFF050;
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v7 = v11;
  uint64_t v8 = v4;
  char v10 = *(_BYTE *)(a1 + 48);
  id v6 = v3;
  uint64_t v9 = a2;
  VMUTask_foreach_malloc_zone(v6, v5);

  _Block_object_dispose(v11, 8);
}

void sub_186127E24(_Unwind_Exception *a1)
{
}

uint64_t ___markRegionsForMallocZones_block_invoke_2( uint64_t a1, uint64_t a2, uint64_t (**a3)(uint64_t, void, uint64_t, uint64_t, void, void (*)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)), void *a4)
{
  id v8 = a4;
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  uint64_t v38 = 0LL;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x3010000000LL;
  uint64_t v41 = &unk_1861837AD;
  __int128 v42 = xmmword_18616BD30;
  uint64_t v9 = *(void *)(a1 + 48);
  char v10 = *(void **)(v9 + 56);
  *(void *)(v9 + 4_Block_object_dispose((const void *)(v1 - 48), 8) = 0x7FFFFFFFFFFFFFFFLL;
  *(void *)(v9 + 56) = 0LL;

  objc_storeStrong((id *)(*(void *)(a1 + 48) + 64LL), a4);
  uint64_t v11 = MEMORY[0x1895F87A8];
  v33[0] = MEMORY[0x1895F87A8];
  v33[1] = 3221225472LL;
  v33[2] = ___markRegionsForMallocZones_block_invoke_3;
  v33[3] = &unk_189DFF000;
  uint64_t v37 = *(void *)(a1 + 48);
  id v35 = &v38;
  id v12 = v8;
  uint64_t v13 = *(void *)(a1 + 40);
  id v34 = v12;
  uint64_t v36 = v13;
  uint64_t v14 = (void *)MEMORY[0x186E33044](v33);
  uint64_t v23 = v11;
  uint64_t v24 = 3221225472LL;
  uint64_t v25 = ___markRegionsForMallocZones_block_invoke_4;
  id v26 = &unk_189DFF028;
  uint64_t v31 = *(void *)(a1 + 48);
  uint64_t v29 = &v38;
  id v15 = v14;
  id v28 = v15;
  id v16 = v12;
  uint64_t v17 = *(void *)(a1 + 40);
  id v27 = v16;
  uint64_t v30 = v17;
  char v32 = *(_BYTE *)(a1 + 64);
  uint64_t v18 = MEMORY[0x186E33044](&v23);
  uint64_t v19 = *(void *)(a1 + 48);
  char v20 = *(void **)(v19 + 72);
  *(void *)(v19 + 72) = v18;

  uint64_t v21 = (*a3)( objc_msgSend(*(id *)(a1 + 32), "taskPort", v23, v24, v25, v26),  *(void *)(a1 + 48),  6,  a2,  *(void *)(a1 + 56),  _mallocEnumerationHandler);
  if (v39[4] != 0x7FFFFFFFFFFFFFFFLL) {
    (*((void (**)(id, const __CFString *))v15 + 2))(v15, @"Range remaining after enumeration");
  }

  _Block_object_dispose(&v38, 8);
  return v21;
}

void sub_186128034(_Unwind_Exception *a1)
{
}

void ___markRegionsForMallocZones_block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3 = (id *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    uint64_t v4 = v3;
    objc_storeStrong(v3 + 5, *(id *)(a1 + 32));
    id v3 = v4;
    *((_DWORD *)v4 + 37) = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
  }

  *(_OWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 32LL) = xmmword_18616BD30;
}

void ___markRegionsForMallocZones_block_invoke_4(uint64_t a1, id a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v9 = (id *)*(id *)(*(void *)(a1 + 64) + 56LL);
  char v10 = v9;
  if (a5 != 1)
  {
    if (a5) {
      ___markRegionsForMallocZones_block_invoke_4_cold_1();
    }
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v12 = *(void *)(v11 + 40);
    if (v12 && (id)(*(void *)(v11 + 32) + v12) != a2)
    {
      uint64_t v13 = *(void (**)(void))(*(void *)(a1 + 40) + 16LL);
      uint64_t v25 = v9;
LABEL_28:
      v13();
LABEL_29:
      char v10 = v25;
      goto LABEL_30;
    }

    goto LABEL_30;
  }

  id v14 = v9[5];
  uint64_t v25 = v10;
  if (!v14)
  {
    id v16 = 0LL;
LABEL_14:
    id v22 = v16;
    objc_storeStrong(v25 + 5, *(id *)(a1 + 32));
    *((_DWORD *)v25 + 37) = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
    *(_OWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 32LL) = xmmword_18616BD30;
    if ([v25 isUntaggedRegion])
    {
      [v25 setAsMallocRegion];
      objc_storeStrong(v25 + 4, (id)VMUmallocOtherRegionLabel);
      if (*(_BYTE *)(a1 + 72))
      {
        id v23 = [v25 description];
        printf( "ISSUE:  Region user_tag should already be set; setting to VM_MEMORY_MALLOC in %s based on enumeration range for  %s\n",
          "_markRegionsForMallocZones_block_invoke_4",
          (const char *)[v23 UTF8String]);
      }
    }

    if (*(_BYTE *)(a1 + 72))
    {
      if (([v22 isEqualToString:v25[5]] & 1) == 0)
      {
        id v24 = [v25 description];
        printf( "Setting region name in %s based on enumeration range for  %s\n",  "_markRegionsForMallocZones_block_invoke_4",  (const char *)[v24 UTF8String]);

        if (v22) {
          printf(" Old region name was %s\n", (const char *)[v22 UTF8String]);
        }
      }
    }

    goto LABEL_29;
  }

  int v15 = [v14 hasSuffix:@" zone structure"];
  char v10 = v25;
  id v16 = v25[5];
  if (v15) {
    goto LABEL_14;
  }
  if (v16 != *(id *)(a1 + 32))
  {
    id v17 = v25[1];
    unint64_t v18 = (unint64_t)v17 + (void)v25[2];
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v20 = *(void *)(v19 + 32);
    if (v20 == 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v21 = v18 - (void)a2;
      *(void *)(v19 + 32) = a2;
    }

    else
    {
      if (a2 > v17) {
        id v17 = a2;
      }
      if ((id)(*(void *)(v19 + 40) + v20) != v17) {
        ___markRegionsForMallocZones_block_invoke_4_cold_2();
      }
      unint64_t v21 = v18 - v20;
    }

    *(void *)(v19 + 40) = v21;
    if ((char *)(*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL)
                + *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 32LL)) == (char *)v25[1] + (void)v25[2])
    {
      uint64_t v13 = *(void (**)(void))(*(void *)(a1 + 40) + 16LL);
      goto LABEL_28;
    }
  }

void _mallocEnumerationHandler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  if (a5)
  {
    uint64_t v6 = 0LL;
    uint64_t v18 = a5;
    id v7 = (void **)(a2 + 56);
    do
    {
      id v8 = (unint64_t *)(a4 + 16 * v6);
      unint64_t v9 = *v8;
      uint64_t v10 = v8[1];
      unint64_t v11 = *v8 + v10;
      if (__CFADD__(*v8, v10))
      {
        NSLog( @"Error in enumerating malloc zone %@ - allocation is excessively large: %#llx-%#llx[%llu].%s\n",  *(void *)(a2 + 64),  v9,  v11,  v10,  *(void *)(a2 + 40));
        if (!*(_BYTE *)(a2 + 32)) {
LABEL_23:
        }
          abort();
      }

      unint64_t v12 = v9;
      if (*(void *)(a2 + 24))
      {
        if (!VMURangeIntersectsRange(v9, v10, *(void *)(a2 + 8), *(void *)(a2 + 16))) {
          goto LABEL_21;
        }
        if (v9 <= *(void *)(a2 + 8)) {
          unint64_t v12 = *(void *)(a2 + 8);
        }
        else {
          unint64_t v12 = v9;
        }
      }

      (*(void (**)(void))(*(void *)(a2 + 72) + 16LL))();
      if (v12 < v11)
      {
        while (1)
        {
          if (!*v7 || v12 - *((void *)*v7 + 1) >= *((void *)*v7 + 2))
          {
            *(void *)(a2 + 4_Block_object_dispose((const void *)(v1 - 128), 8) = findRegionForAddress(*(void **)a2, v12, v7);
            if (!*(void *)(a2 + 56)) {
              break;
            }
          }

          (*(void (**)(void))(*(void *)(a2 + 72) + 16LL))();
          unint64_t v12 = *(void *)(*(void *)(a2 + 56) + 16LL) + *(void *)(*(void *)(a2 + 56) + 8LL);
          if (v12 >= v11) {
            goto LABEL_21;
          }
          unint64_t v13 = *(void *)(a2 + 48) + 1LL;
          *(void *)(a2 + 4_Block_object_dispose((const void *)(v1 - 128), 8) = v13;
          if (v13 >= [*(id *)a2 count])
          {
            uint64_t v14 = 0LL;
          }

          else
          {
            uint64_t v14 = [*(id *)a2 objectAtIndexedSubscript:*(void *)(a2 + 48)];
          }

          int v15 = *v7;
          void *v7 = (void *)v14;
        }

        uint64_t v16 = *(void *)(a2 + 64);
        VMURangeDescription(v9, v10);
        id v17 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog( @"Error in enumerating malloc zone %@ - allocation is not in a VM region: %@ %s\n",  v16,  v17,  *(void *)(a2 + 40));

        if (!*(_BYTE *)(a2 + 32)) {
          goto LABEL_23;
        }
      }

void ___getRegionMallocStatistics_block_invoke(uint64_t a1, uint64_t a2)
{
  v14[0] = 0LL;
  v14[1] = v14;
  v14[2] = 0x2020000000LL;
  int v15 = 0;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = ___getRegionMallocStatistics_block_invoke_2;
  v7[3] = &unk_189DFF0C8;
  uint64_t v10 = v14;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v11 = v6;
  char v13 = *(_BYTE *)(a1 + 56);
  id v9 = *(id *)(a1 + 32);
  uint64_t v12 = a2;
  VMUTask_foreach_malloc_zone(v4, v7);

  _Block_object_dispose(v14, 8);
}

void sub_186128660(_Unwind_Exception *a1)
{
}

uint64_t ___getRegionMallocStatistics_block_invoke_2( uint64_t a1, uint64_t a2, uint64_t (**a3)(uint64_t, void, uint64_t, uint64_t, void, void (*)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)), void *a4)
{
  id v8 = a4;
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
  id v9 = calloc(1uLL, 0x50uLL);
  NSMapInsertKnownAbsent(*(NSMapTable **)(a1 + 32), v8, v9);
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v11 = *(void **)(v10 + 56);
  *(void *)(v10 + 4_Block_object_dispose((const void *)(v1 - 64), 8) = 0x7FFFFFFFFFFFFFFFLL;
  *(void *)(v10 + 56) = 0LL;

  objc_storeStrong((id *)(*(void *)(a1 + 56) + 64LL), a4);
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = ___getRegionMallocStatistics_block_invoke_3;
  v20[3] = &unk_189DFF0A0;
  uint64_t v13 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  id v23 = v9;
  uint64_t v24 = v12;
  id v21 = v8;
  uint64_t v22 = v13;
  char v25 = *(_BYTE *)(a1 + 72);
  id v14 = v8;
  uint64_t v15 = MEMORY[0x186E33044](v20);
  uint64_t v16 = *(void *)(a1 + 56);
  id v17 = *(void **)(v16 + 72);
  *(void *)(v16 + 72) = v15;

  uint64_t v18 = (*a3)( [*(id *)(a1 + 40) taskPort],  *(void *)(a1 + 56),  7,  a2,  *(void *)(a1 + 64),  _mallocEnumerationHandler);
  return v18;
}

void ___getRegionMallocStatistics_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  if (a5 == 1)
  {
    id v8 = *(id *)(*(void *)(a1 + 56) + 56LL);
    if (*((_DWORD *)v8 + 37) == -1 || !*((void *)v8 + 5))
    {
      *((_DWORD *)v8 + 37) = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
      id v10 = v8;
      objc_storeStrong((id *)v8 + 5, *(id *)(a1 + 32));
      id v8 = v10;
      if (*(_BYTE *)(a1 + 64))
      {
        id v9 = [v10 description];
        printf( "Setting region name in %s based on enumeration for  %s\n",  "_getRegionMallocStatistics_block_invoke_3",  (const char *)[v9 UTF8String]);

        id v8 = v10;
      }
    }

    if (*((_DWORD *)v8 + 37) == *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
    {
      if ((a4 & 1) != 0) {
        ++*((void *)v8 + 17);
      }
      *((_DWORD *)v8 + 36) |= a4;
    }
  }

  else
  {
    if (a5) {
      ___getRegionMallocStatistics_block_invoke_3_cold_1();
    }
    if ((a4 & 1) != 0)
    {
      int64x2_t v7 = vdupq_n_s64(1uLL);
      v7.i64[0] = a3;
      *(int64x2_t *)*(void *)(a1 + 4_Block_object_dispose((const void *)(v1 - 64), 8) = vaddq_s64(*(int64x2_t *)*(void *)(a1 + 48), v7);
    }
  }

BOOL _copy_remote_mangled_symbol_value(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, size_t a5, void *a6)
{
  id v8 = (const void *)_map_remote_mangled_symbol_value(a1, a2, a3, a4, a5);
  if (v8) {
    memcpy(a6, v8, a5);
  }
  else {
    bzero(a6, a5);
  }
  return v8 != 0LL;
}

uint64_t _map_remote_mangled_symbol_value(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = a1;
  CSSymbolOwnerGetSymbolWithMangledName();
  uint64_t Range = CSSymbolGetRange();
  if (Range) {
    uint64_t v8 = v6[2](v6, Range, a5);
  }
  else {
    uint64_t v8 = 0LL;
  }

  return v8;
}

void printFigSubclassInfo(void *a1, void *a2, void *a3)
{
  id v8 = a1;
  id v5 = a2;
  id v6 = a3;
  if ((printFigSubclassInfo_printedHeader & 1) == 0)
  {
    if (getenv("DT_PRINT_FIG_SUBCLASSES"))
    {
      printFigSubclassInfo_printIt = 1;
      int64x2_t v7 = (FILE **)MEMORY[0x1895F89D0];
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%-36s  %-60s  %s\n", "CFType", "Fig Subclass", "FigBaseClass symbol name");
      fprintf(*v7, "%-36s  %-60s  %s\n", "======", "============", "========================");
    }

    printFigSubclassInfo_printedHeader = 1;
  }

  if (printFigSubclassInfo_printIt == 1) {
    fprintf( (FILE *)*MEMORY[0x1895F89D0], "%-36s %-60s %s\n", (const char *)[v8 UTF8String], (const char *)[v5 UTF8String], (const char *)[objc_retainAutorelease(v6) UTF8String]);
  }
}

LABEL_58:
    if (v16) {
      goto LABEL_61;
    }
    goto LABEL_59;
  }

  -[VMUObjectIdentifier classInfoForCFTypeInstance:length:remoteAddress:]( self,  "classInfoForCFTypeInstance:length:remoteAddress:",  a3,  a4,  a6);
  uint64_t v16 = (VMUClassInfo *)objc_claimAutoreleasedReturnValue();
LABEL_11:
  if (!a5 && !v16)
  {
    -[VMUObjectIdentifier classInfoForNonobjectMemory:length:](self, "classInfoForNonobjectMemory:length:", a3, a4);
    uint64_t v16 = (VMUClassInfo *)objc_claimAutoreleasedReturnValue();
  }

  if (v16) {
    goto LABEL_18;
  }
  return v16;
}

uint64_t closureContextMayHaveGenericCaptures(uint64_t a1, void *a2)
{
  v6[0] = 0LL;
  v6[1] = 0LL;
  uint64_t v7 = 0LL;
  uint64_t result = [a2 copyRange:a1 to:24 v6];
  if ((_DWORD)result)
  {
    LODWORD(v5[1]) = 0;
    v5[0] = 0LL;
    int v4 = [a2 copyRange:v7 to:12 v5];
    uint64_t result = 0LL;
    if (v4) {
      return *(void *)((char *)v5 + 4) != 0LL;
    }
  }

  return result;
}

void sub_18612B840( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

LABEL_32:
    id v21 = 0LL;
    goto LABEL_33;
  }

  uint64_t v20 = 0;
  id v21 = 0LL;
  if ((unint64_t)v18 <= v19 && (unint64_t)v18 + a4 > v19)
  {
    uint64_t v20 = 0;
    if (self->_objectContentLevel == 3) {
      id v21 = v17;
    }
    else {
      id v21 = 0LL;
    }
  }

#error "18612F5F4: call analysis failed (funcsize=52)"
void sub_18612F630(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_18612FB94( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_1861300D4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1861304D8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

void __copy_assignment_8_8_t0w16_sb16_s24_s32_t40w16_w56_w64(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = MEMORY[0x186E33044](*(void *)(a2 + 16));
  id v5 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v4;

  objc_storeStrong((id *)(a1 + 24), *(id *)(a2 + 24));
  objc_storeStrong((id *)(a1 + 32), *(id *)(a2 + 32));
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a2 + 56));
  objc_storeWeak((id *)(a1 + 56), WeakRetained);
  id v6 = objc_loadWeakRetained((id *)(a2 + 64));
  objc_storeWeak((id *)(a1 + 64), v6);
}

uint64_t _query_data_layout_function(uint64_t a1, int a2, uint64_t a3, _BYTE *a4)
{
  switch(a2)
  {
    case 0:
    case 1:
      *a4 = 8;
      goto LABEL_10;
    case 2:
      uint64_t v6 = -1LL;
      goto LABEL_8;
    case 3:
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      [WeakRetained vmuTask];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 isExclaveCore];

      *a4 = 0;
      goto LABEL_10;
    case 4:
      id v9 = objc_loadWeakRetained((id *)(a1 + 56));
      [v9 vmuTask];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      int v11 = [v10 isExclaveCore];

      uint64_t v6 = 4096LL;
      if (!v11) {
        uint64_t v6 = 0x100000000LL;
      }
LABEL_8:
      *(void *)a4 = v6;
      goto LABEL_10;
    case 5:
      id v12 = objc_loadWeakRetained((id *)(a1 + 56));
      [v12 vmuTask];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = [v13 isExclaveCore] ^ 1;

LABEL_10:
      uint64_t result = 1LL;
      break;
    default:
      uint64_t result = 0LL;
      break;
  }

  return result;
}

uint64_t _read_bytes_function(uint64_t a1, void *key, unint64_t a3, void *a4)
{
  unint64_t v24 = 0LL;
  uint64_t v25 = 0LL;
  ++*(_DWORD *)(a1 + 48);
  if (a4) {
    *a4 = 0LL;
  }
  uint64_t v7 = NSMapGet(*(NSMapTable **)(a1 + 24), key);
  if (!v7)
  {
LABEL_8:
    int v11 = *(unsigned __int8 *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    uint64_t v13 = WeakRetained;
    if (!v11)
    {
      [WeakRetained memoryCache];
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 mapAddress:key size:a3 returnedAddress:&v25 returnedSize:&v24];

      int v21 = *(_DWORD *)(a1 + 44);
      if (v25)
      {
        if ((v21 & 0xFFFFFFFE) == 2) {
          fprintf((FILE *)*MEMORY[0x1895F89D0], "%#llx[%llu] --> %#llx[%llu]  READ_BYTES CACHE MISS (UNVALIDATED)\n");
        }
      }

      else if ((v21 - 1) <= 2)
      {
        fprintf((FILE *)*MEMORY[0x1895F89D0], "%#llx[%llu] FAIL! READ_BYTES (UNVALIDATED) COULD NOT MAP\n");
      }

      goto LABEL_28;
    }

    id v14 = [WeakRetained validateAddressRangeForSwiftRemoteMirror:key allowUnusedSplitLibs:a3];

    if (!v14)
    {
      goto LABEL_28;
    }

    [*v14 range];
    id v15 = objc_loadWeakRetained((id *)(a1 + 64));
    [v15 memoryCache];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 mapAddress:key size:a3 returnedAddress:&v25 returnedSize:&v24];

    int v17 = *(_DWORD *)(a1 + 44);
    if (v25)
    {
      if ((v17 & 0xFFFFFFFE) == 2)
      {
        uint64_t v18 = (FILE *)*MEMORY[0x1895F89D0];
        id v19 = [*v14 description];
        [v19 UTF8String];
        fprintf(v18, "%#llx[%llu] --> %#llx[%llu] in %s  READ_BYTES CACHE MISS (VALIDATED)  -------------\n");
LABEL_25:
      }
    }

    else if ((v17 - 1) <= 2)
    {
      uint64_t v22 = (FILE *)*MEMORY[0x1895F89D0];
      id v19 = [*v14 description];
      [v19 UTF8String];
      fprintf(v22, "%#llx[%llu] FAIL! READ_BYTES COULD NOT MAP, ALTHOUGH FOUND REGION %s\n");
      goto LABEL_25;
    }

size_t _get_string_length(uint64_t a1, const void *a2)
{
  size_t __n = 0LL;
  __s1 = 0LL;
  ++*(_DWORD *)(a1 + 52);
  uint64_t v4 = NSMapGet(*(NSMapTable **)(a1 + 32), a2);
  if (v4)
  {
    else {
      size_t v5 = (size_t)v4;
    }
    if (*(_DWORD *)(a1 + 44) == 3) {
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%#llx --> %llu  STRING_LENGTH CACHE HIT\n", a2, v5);
    }
    return v5;
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v7 = [WeakRetained validateAddressRangeForSwiftRemoteMirror:a2 allowUnusedSplitLibs:0];

  if (v7)
  {
    uint64_t v8 = [*v7 range];
    uint64_t v10 = v9 - (void)a2 + v8;
    id v11 = objc_loadWeakRetained((id *)(a1 + 64));
    [v11 memoryCache];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 mapAddress:a2 size:v10 returnedAddress:&__s1 returnedSize:&__n];

    uint64_t v13 = __s1;
    if (__s1)
    {
      size_t v5 = __n;
      size_t v14 = strnlen(__s1, __n);
      int v15 = *(_DWORD *)(a1 + 44);
      if (v14 == v5)
      {
        if ((v15 - 1) <= 2) {
          fprintf( (FILE *)*MEMORY[0x1895F89D0],  "%#llx  FAIL! STRING_LENGTH DID NOT FIND NULL TERMINATOR IN %llu BYTES FOR STRING LENGTH OF %.*s\n",  a2,  v5,  v5,  v13);
        }
      }

      else
      {
        size_t v18 = v14;
        if ((v15 & 0xFFFFFFFE) == 2) {
          fprintf((FILE *)*MEMORY[0x1895F89D0], "%#llx --> %llu  STRING_LENGTH CACHE MISS OF %s\n", a2, v14, v13);
        }
        size_t v5 = v18;
      }

      goto LABEL_20;
    }

    if ((*(_DWORD *)(a1 + 44) - 1) <= 2)
    {
      uint64_t v16 = (FILE *)*MEMORY[0x1895F89D0];
      id v17 = [*v7 description];
      fprintf( v16,  "%#llx FAIL! STRING_LENGTH COULD NOT MAP, ALTHOUGH FOUND REGION %s\n",  a2,  (const char *)[v17 UTF8String]);
    }
  }

  else if ((*(_DWORD *)(a1 + 44) - 1) <= 2)
  {
    fprintf((FILE *)*MEMORY[0x1895F89D0], "%#llx  FAIL! NO VM REGION FOR STRING LENGTH\n", a2);
  }

  size_t v5 = 0LL;
LABEL_20:
  if (!NSMapGet(*(NSMapTable **)(a1 + 24), a2))
  {
    id v19 = malloc(0x10uLL);
    size_t v20 = __n;
    void *v19 = __s1;
    v19[1] = v20;
    NSMapInsert(*(NSMapTable **)(a1 + 24), a2, v19);
  }

  if (v5) {
    uint64_t v21 = v5;
  }
  else {
    uint64_t v21 = 0xFFFFFFFFLL;
  }
  NSMapInsert(*(NSMapTable **)(a1 + 32), a2, (const void *)v21);
  return v5;
}

uint64_t _get_symbol_address(uint64_t a1, const char *a2)
{
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3010000000LL;
  uint64_t v20 = 0LL;
  uint64_t v21 = 0LL;
  id v19 = &unk_1861837AD;
  if (isatty(0)) {
    BOOL v4 = isatty(2) != 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (!strncmp(a2, "objc", 4uLL))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained libobjcSymbolOwner];
LABEL_14:

    goto LABEL_15;
  }

  if (!strncmp(a2, "swift", 5uLL) || !strncmp(a2, "_swift_debug", 0xCuLL))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained vmuTask];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (![v6 isExclaveCore])
    {
LABEL_12:
      CSSymbolicatorGetSymbolOwnerWithNameAtTime();
      goto LABEL_13;
    }

void sub_186130F44( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void __destructor_8_sb16_s24_s32_w56_w64(id *a1)
{
}

uint64_t ___get_symbol_address_block_invoke(uint64_t a1)
{
  uint64_t result = CSIsNull();
  if ((_DWORD)result)
  {
    uint64_t Name = (const char *)CSSymbolOwnerGetName();
    uint64_t result = strncmp(Name, "libswift", 8uLL);
    if (!(_DWORD)result)
    {
      SymbolWithuint64_t Name = CSSymbolOwnerGetSymbolWithName();
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
      *(void *)(v5 + 32) = SymbolWithName;
      *(void *)(v5 + 40) = v6;
      uint64_t result = CSIsNull();
      if ((result & 1) == 0)
      {
        if (*(_BYTE *)(a1 + 48)) {
          return fprintf( (FILE *)*MEMORY[0x1895F89D0],  "Symbolication.framework _get_symbol_owner found requested symbol %s in unexpected Swift library %s\n",  *(const char **)(a1 + 40),  Name);
        }
      }
    }
  }

  return result;
}

LABEL_52:
  v5->super._coldestFrameIsNotThreadId = [v4 decodeBoolForKey:@"coldestFrameIsNotThreadId"];
  v5->_maxTimestampDelta = [v4 decodeInt64ForKey:@"maxTimestampDelta"];
  v5->_mslRecordsCount = [v4 decodeInt64ForKey:@"mslRecordsCount"];

LABEL_53:
  __int128 v50 = v5;
LABEL_57:

  return v50;
}

uint64_t btref_decode_unslide(void *a1, unsigned int a2, void *a3, uint64_t a4, uint64_t a5)
{
  if ((a2 & 0xC000003E) != 0) {
    return 0LL;
  }
  uint64_t v16 = v5;
  uint64_t v17 = v6;
  unsigned int v10 = 12 - __clz(a2);
  if (!(a2 >> 20)) {
    unsigned int v10 = 0;
  }
  uint64_t v15 = *(void *)(a4 + 8LL * v10 + 88) + a2;
  [a1 peekAtAddress:size:returnsBuf:];
  int v11 = *(_DWORD *)(v15 + 4);
  uint64_t result = v11 & 0xF;
  if ((v11 & 0xF) != 0)
  {
    uint64_t v12 = (int *)(v15 + 12);
    uint64_t v13 = v11 & 0xF;
    do
    {
      uint64_t v14 = *v12++;
      *a3++ = v14 + a5;
      --v13;
    }

    while (v13);
  }

  return result;
}

void sub_186135C28( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

_DWORD *copySamplingResultToCallstack( _DWORD *result, int a2, const void *a3, const void *a4, unsigned int a5, int a6)
{
  uint64_t v7 = result;
  result[10] = a5;
  if (a5)
  {
    size_t v11 = 8LL * a5;
    uint64_t v12 = malloc(v11);
    *((void *)v7 + 3) = v12;
    uint64_t result = memcpy(v12, a3, v11);
    if (a6)
    {
      uint64_t v13 = malloc(v11);
      *((void *)v7 + 4) = v13;
      uint64_t result = memcpy(v13, a4, v11);
    }
  }

  v7[1] = a2;
  return result;
}

id descriptionForCallstackFrames(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = (void *)objc_opt_new();
  uint64_t v5 = v4;
  uint64_t v17 = v3;
  if (*(void *)(a1 + 24))
  {
    [v4 stringByAppendingString:v3];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

    [v6 stringByAppendingString:@"\n"];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(_DWORD *)(a1 + 40))
    {
      unint64_t v8 = 0LL;
      do
      {
        CSSymbolicatorGetSymbolWithAddressAtTime();
        CSSymbolGetSymbolOwner();
        CSSymbolicatorGetSectionWithAddressAtTime();
        uint64_t Name = CSSymbolGetName();
        if (Name) {
          unsigned int v10 = (const char *)Name;
        }
        else {
          unsigned int v10 = "symbol name not found";
        }
        uint64_t v11 = *(void *)(*(void *)(a1 + 24) + 8 * v8);
        uint64_t v12 = CSSymbolOwnerGetName();
        uint64_t v13 = CSRegionGetName();
        [v7 stringByAppendingFormat:@"\t[%3d] %#08.8qx  {%s.%s + %#qx} %s\n",  v8,  v11,  v12,  v13,  *(void *)(*(void *)(a1 + 24) + 8 * v8) - CSRegionGetRange(),  v10];
        uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

        uint64_t v14 = *(void *)(a1 + 32);
        if (v14)
        {
          uint64_t v15 = [v5 stringByAppendingFormat:@"\t\tframe pointer %#llx\n" v14 + 8 * v8];

          uint64_t v5 = (void *)v15;
        }

        ++v8;
        uint64_t v7 = v5;
      }

      while (v8 < *(unsigned int *)(a1 + 40));
    }

    else
    {
      uint64_t v5 = v7;
    }
  }

  return v5;
}

__CFString *VMUPlatformNameForPlatform(uint64_t a1)
{
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *VMUPlatformNameForTask()
{
  uint64_t v0 = CSPlatformForTask();
  return VMUPlatformNameForPlatform(v0);
}

BOOL VMUProcessIsAnalyzable(BOOL result)
{
  if (result)
  {
    pid_t v1 = result;
    return !kill(result, 0) || !getuid() && getpgid(v1) > 0;
  }

  return result;
}

uint64_t pidFromHint(void *a1)
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  id v2 = v1;
  if (!v1 || ![v1 length])
  {
    uint64_t v5 = 0LL;
    goto LABEL_41;
  }

  [MEMORY[0x189607810] decimalDigitCharacterSet];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 invertedSet];
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ([v2 rangeOfCharacterFromSet:v4] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = [v2 integerValue];
    goto LABEL_40;
  }

  id v36 = v2;
  uint64_t v32 = MEMORY[0x186E32E40]();
  pid_t v6 = getpid();
  id v34 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v33 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  +[VMUProcInfo getProcessIds](&OBJC_CLASS___VMUProcInfo, "getProcessIds");
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (!v7)
  {
    uint64_t v9 = 0LL;
    goto LABEL_26;
  }

  uint64_t v8 = v7;
  uint64_t v9 = 0LL;
  uint64_t v10 = *(void *)v38;
  do
  {
    uint64_t v11 = 0LL;
    uint64_t v12 = v9;
    do
    {
      if (*(void *)v38 != v10) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void **)(*((void *)&v37 + 1) + 8 * v11);
      uint64_t v14 = (void *)MEMORY[0x186E32E40]();
      uint64_t v15 = [v13 integerValue];
      if (v6 == (_DWORD)v15)
      {
        uint64_t v9 = v12;
        goto LABEL_22;
      }

      uint64_t v9 = -[VMUProcInfo initWithPid:](objc_alloc(&OBJC_CLASS___VMUProcInfo), "initWithPid:", v15);

      -[VMUProcInfo procTableName](v9, "procTableName");
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[VMUProcInfo name](v9, "name");
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (([v17 isEqualToString:v36] & 1) != 0
        || [v16 isEqualToString:v36])
      {
        BOOL haveSufficientAccessToProcess = _haveSufficientAccessToProcess(v15);
        id v19 = v34;
        if (!haveSufficientAccessToProcess) {
          goto LABEL_21;
        }
      }

      else
      {
        [v17 rangeOfString:v36];
        if (!v20)
        {
          [v16 rangeOfString:v36];
          if (!v21) {
            goto LABEL_21;
          }
        }

        BOOL v22 = _haveSufficientAccessToProcess(v15);
        id v19 = v33;
        if (!v22) {
          goto LABEL_21;
        }
      }

      [v19 addObject:v9];
LABEL_21:

      uint64_t v12 = v9;
LABEL_22:
      objc_autoreleasePoolPop(v14);
      ++v11;
    }

    while (v8 != v11);
    uint64_t v8 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  }

  while (v8);
LABEL_26:

  uint64_t v23 = [v34 count];
  if (!v23)
  {
    uint64_t v26 = [v33 count];
    id v2 = v36;
    unint64_t v24 = (void *)v32;
    if (v26)
    {
      if (v26 == 1)
      {
        [v33 lastObject];
        uint64_t v25 = (VMUProcInfo *)objc_claimAutoreleasedReturnValue();

        uint64_t v5 = -[VMUProcInfo pid](v25, "pid");
        id v27 = (FILE *)*MEMORY[0x1895F89D0];
        id v28 = -[VMUProcInfo name](v25, "name");
        fprintf( v27, "Found process %d (%s) from partial name %s\n", v5, (const char *)[v28 UTF8String], (const char *)[v36 UTF8String]);

LABEL_32:
        uint64_t v9 = v25;
        goto LABEL_39;
      }

      if (isatty(0) && isatty(2))
      {
        uint64_t v29 = (FILE **)MEMORY[0x1895F89D0];
        fprintf( (FILE *)*MEMORY[0x1895F89D0], "You have access to multiple processes that match the partial name %s:\n", (const char *)[v36 UTF8String]);
        uint64_t v30 = v33;
        goto LABEL_34;
      }
    }

    uint64_t v5 = 0LL;
    goto LABEL_39;
  }

  id v2 = v36;
  unint64_t v24 = (void *)v32;
  if (v23 == 1)
  {
    [v34 lastObject];
    uint64_t v25 = (VMUProcInfo *)objc_claimAutoreleasedReturnValue();

    uint64_t v5 = -[VMUProcInfo pid](v25, "pid");
    goto LABEL_32;
  }

  uint64_t v29 = (FILE **)MEMORY[0x1895F89D0];
  fprintf( (FILE *)*MEMORY[0x1895F89D0], "You have access to multiple processes named %s:\n", (const char *)[v36 UTF8String]);
  uint64_t v30 = v34;
LABEL_34:
  uint64_t v5 = choosePid(v30);
  fputc(10, *v29);
LABEL_39:

  objc_autoreleasePoolPop(v24);
LABEL_40:

LABEL_41:
  return v5;
}

BOOL _haveSufficientAccessToProcess(BOOL a1)
{
  if (!VMUProcessIsAnalyzable(a1)) {
    return 0LL;
  }
  id v1 = (ipc_space_t *)MEMORY[0x1895FBBE0];
  int v2 = task_read_for_pid();
  BOOL v3 = v2 == 0;
  if (!v2) {
    mach_port_deallocate(*v1, 0);
  }
  return v3;
}

uint64_t choosePid(void *a1)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  unint64_t v25 = [v1 count];
  if (v25)
  {
    uint64_t v2 = 0LL;
    BOOL v3 = 0LL;
    for (i = 0; i < v25; uint64_t v2 = ++i)
    {
      [v1 objectAtIndexedSubscript:v2];
      id v5 = (id)objc_claimAutoreleasedReturnValue();

      if (i > 0x19) {
        __strlcpy_chk();
      }
      else {
        snprintf(__str, 3uLL, "%c)", i + 97);
      }
      pid_t v6 = (FILE *)*MEMORY[0x1895F89D0];
      int v7 = [v5 pid];
      id v8 = [v5 userAppName];
      fprintf(v6, "    %s %5d %s\n", __str, v7, (const char *)[v8 UTF8String]);

      BOOL v3 = v5;
    }
  }

  else
  {
    id v5 = 0LL;
  }

  if (isatty(0) && isatty(2))
  {
    uint64_t v9 = "Which process? (letter or PID) ";
    uint64_t v10 = (FILE **)MEMORY[0x1895F89D8];
    while (1)
    {
      fwrite(v9, 0x1FuLL, 1uLL, (FILE *)*MEMORY[0x1895F89D0]);
      for (uint64_t j = *v10; !fgets(__str, 8, j); clearerr(j))
      {
        if (!ferror(j) || *__error() != 4) {
          exit(0);
        }
      }

      if (__str[0] >= 97 && __str[1] == 10 && __str[0] - 97 < v25)
      {
        [v1 objectAtIndexedSubscript:];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v14 = [v13 pid];

        if ((_DWORD)v14) {
          break;
        }
      }

      unsigned int v30 = 0;
      if (sscanf(__str, "%d", &v30) == 1)
      {
        uint64_t v15 = v10;
        uint64_t v16 = v9;
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        id v17 = v1;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v31 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          LODWORD(v14) = 0;
          uint64_t v20 = *(void *)v27;
          do
          {
            uint64_t v21 = 0LL;
            BOOL v22 = v5;
            do
            {
              if (*(void *)v27 != v20) {
                objc_enumerationMutation(v17);
              }
              id v5 = *(id *)(*((void *)&v26 + 1) + 8 * v21);

              int v23 = [v5 pid];
              if (v23 == v30) {
                uint64_t v14 = v30;
              }
              else {
                uint64_t v14 = v14;
              }
              ++v21;
              BOOL v22 = v5;
            }

            while (v19 != v21);
            uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v31 count:16];
          }

          while (v19);
        }

        else
        {
          uint64_t v14 = 0LL;
        }

        id v5 = 0LL;
        uint64_t v9 = v16;
        uint64_t v10 = v15;
        if ((_DWORD)v14) {
          break;
        }
      }
    }
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  return v14;
}

id psName(uint64_t a1)
{
  id v1 = -[VMUProcInfo initWithPid:](objc_alloc(&OBJC_CLASS___VMUProcInfo), "initWithPid:", a1);
  -[VMUProcInfo userAppName](v1, "userAppName");
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2;
  if (v2)
  {
    [v2 lastPathComponent];
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v4 = 0LL;
  }

  return v4;
}

uint64_t _CRGetOSVersionDictionary()
{
  if (_CRGetOSVersionDictionary_onceToken != -1) {
    dispatch_once(&_CRGetOSVersionDictionary_onceToken, &__block_literal_global_16);
  }
  return _CRGetOSVersionDictionary__osVersionDict;
}

CFStringRef _CRCopyProcessNameForPID(int a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v2 = buffer;
  bzero(buffer, 0x401uLL);
  int v3 = proc_name(a1, buffer, 0x400u);
  if (v3 < 0 || (buffer[v3] = 0, (v3 - 15) <= 0xFFFFFFF1))
  {
    uint64_t v2 = buffer;
    int v4 = proc_pidpath(a1, buffer, 0x400u);
    if ((v4 & 0x80000000) == 0)
    {
      buffer[v4] = 0;
      id v5 = strrchr(buffer, 47);
      if (v5) {
        uint64_t v2 = v5 + 1;
      }
    }
  }

  return CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x189604DB0], v2, 0x8000100u);
}

CFStringRef _CRCopyExecutablePathForPID(int a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  bzero(buffer, 0x401uLL);
  int v2 = proc_pidpath(a1, buffer, 0x400u);
  if ((v2 & 0x80000000) == 0) {
    buffer[v2] = 0;
  }
  return CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x189604DB0], buffer, 0x8000100u);
}

CFStringRef _CRCopyExecutablePathAndNameForPIDDetectingInconsistencies( int a1, CFStringRef *a2, _BYTE *a3, CFStringRef *a4, _BYTE *a5)
{
  uint64_t v5 = a5;
  uint64_t v19 = *MEMORY[0x1895F89C0];
  *a3 = 0;
  *a5 = 0;
  uint64_t v10 = buffer;
  bzero(buffer, 0x401uLL);
  int v11 = proc_pidpath(a1, buffer, 0x400u);
  if ((v11 & 0x80000000) == 0) {
    buffer[v11] = 0;
  }
  uint64_t v12 = strrchr(buffer, 47);
  if (v12) {
    uint64_t v10 = v12 + 1;
  }
  bzero(__s1, 0x401uLL);
  int v13 = proc_name(a1, __s1, 0x400u);
  if (v13 < 0) {
    goto LABEL_9;
  }
  __s1[v13] = 0;
  if ((v13 - 15) > 0xFFFFFFF1)
  {
    int v14 = strcmp(__s1, v10);
    uint64_t v5 = a3;
    uint64_t v10 = __s1;
    if (!v14)
    {
      uint64_t v10 = __s1;
      goto LABEL_12;
    }

    goto LABEL_11;
  }

  if (!v13 || strncmp(__s1, v10, 0xFuLL))
  {
LABEL_9:
    *a3 = 1;
LABEL_11:
    *uint64_t v5 = 1;
  }

_DWORD *VMUCreateRootNodeMarkingMap(void *a1)
{
  id v1 = a1;
  int v2 = [v1 nodeNamespaceSize];
  int v3 = calloc(1uLL, ((v2 + 7) >> 3) + 4);
  uint64_t v4 = MEMORY[0x1895F87A8];
  _DWORD *v3 = v2;
  v6[0] = v4;
  v6[1] = 3221225472LL;
  void v6[2] = __VMUCreateRootNodeMarkingMap_block_invoke;
  v6[3] = &__block_descriptor_40_e25_v44__0I8___Qb60b4__12_B36l;
  v6[4] = v3;
  [v1 enumerateObjectsWithBlock:v6];

  return v3;
}

BOOL __VMUCreateRootNodeMarkingMap_block_invoke(uint64_t a1, unsigned int a2, uint64_t a3)
{
  BOOL result = VMUGraphNodeType_IsRoot(*(void *)(a3 + 8) >> 60);
  if (result)
  {
    pid_t v6 = *(unsigned int **)(a1 + 32);
    if (*v6 > a2) {
      *((_BYTE *)v6 + (a2 >> 3) + 4) |= 1 << (a2 & 7);
    }
  }

  return result;
}

void VMUWithRootNodeMarkingMap(void *a1, void *a2)
{
  id v5 = a1;
  int v3 = a2;
  if (v3)
  {
    uint64_t v4 = VMUCreateRootNodeMarkingMap(v5);
    v3[2](v3, v4);
    if (v4) {
      free(v4);
    }
  }
}

uint64_t VMULiteZoneIndex(void *a1)
{
  id v1 = a1;
  if ([v1 zoneCount])
  {
    uint64_t v2 = 0LL;
    LODWORD(v3) = -1;
    do
    {
      [v1 zoneNameForIndex:v2];
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      else {
        int v5 = 0;
      }

      if (v5) {
        uint64_t v3 = v2;
      }
      else {
        uint64_t v3 = v3;
      }
      uint64_t v2 = (v2 + 1);
    }

    while (v2 < [v1 zoneCount]);
  }

  else
  {
    uint64_t v3 = 0xFFFFFFFFLL;
  }

  return v3;
}

void VMUEnumerateVMAnnotatedMallocObjectsWithBlock(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  int v5 = v4;
  if (v3 && v4)
  {
    v12[0] = 0LL;
    v12[1] = v12;
    v12[2] = 0x2020000000LL;
    int v13 = 0;
    int v6 = [v3 nodeCount];
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __VMUEnumerateVMAnnotatedMallocObjectsWithBlock_block_invoke;
    v7[3] = &unk_189DFF968;
    uint64_t v10 = v12;
    int v11 = v6;
    id v8 = v3;
    id v9 = v5;
    [v8 enumerateRegionsWithBlock:v7];

    _Block_object_dispose(v12, 8);
  }
}

void sub_186139660( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void __VMUEnumerateVMAnnotatedMallocObjectsWithBlock_block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  for (unsigned int i = a2;
        *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) < *(_DWORD *)(a1 + 56);
        ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    int v6 = *(void **)(a1 + 32);
    if (v6)
    {
      [v6 nodeDetails:];
      if (((*((void *)&v13 + 1) >> 60) | 4) == 5 && *((void *)&v13 + 1) != 0x1000000000000000LL)
      {
        if ((void)v13 - i[1] >= i[2]) {
          break;
        }
        uint64_t v8 = *(void *)(a1 + 40);
        uint64_t v9 = *(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
        uint64_t v10 = *(void (**)(uint64_t, uint64_t, __int128 *))(v8 + 16);
        __int128 v11 = v13;
        uint64_t v12 = v14;
        v10(v8, v9, &v11);
        if (*a3) {
          break;
        }
      }
    }
  }
}

LABEL_54:
  v88 = 0LL;
LABEL_55:
  __int128 v13 = v149;
LABEL_92:

  return v88;
}

void sub_18613CD08( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_18613CFE4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_18613EC40( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

void sub_18613F308(_Unwind_Exception *a1)
{
}

void sub_18613F9E4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

const char *VMUScanTypeScanDescription(unsigned int a1)
{
  if (a1 > 8) {
    return "";
  }
  else {
    return off_189DFFC00[a1];
  }
}

const char *VMUScanTypeKeywordDescription(int a1)
{
  else {
    return off_189DFFC48[a1 - 2];
  }
}

const char *VMUScanTypeAsString(unsigned int a1)
{
  if (a1 > 8) {
    return "Unknown";
  }
  else {
    return off_189DFFC80[a1];
  }
}

uint64_t VMUScanningMaskForAllReferences()
{
  return 318LL;
}

uint64_t VMUScanningMaskForOwningReferences()
{
  return 46LL;
}

BOOL VMUIsOwningReference(char a1)
{
  return ((1 << a1) & 0x26) != 0;
}

BOOL task_get_malloc_zones_array_address_and_count( void *a1, uint64_t a2, uint64_t a3, void *a4, _DWORD *a5, void *a6)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v9 = a1;
  *a4 = 0LL;
  *a5 = 0;
  if ([v9 isExclaveCore])
  {
    CSSymbolicatorGetSymbolOwner();
    if (CSIsNull())
    {
      [MEMORY[0x1896NSStringrmat:@"expected 1 binary in ExclaveCore target, but found %zu", CSSymbolicatorGetSymbolOwnerCountAtTime()];
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      if (a6)
      {
        BOOL v11 = 0LL;
        goto LABEL_13;
      }

uint64_t get_local_zone_count()
{
  return 0LL;
}

void unregister_new_local_zones()
{
}

void task_foreach_malloc_zone(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = -[VMUTask initWithTask:](objc_alloc(&OBJC_CLASS___VMUTask), "initWithTask:", a1);
  VMUTask_foreach_malloc_zone(v4, v3);
}

void VMUTask_foreach_malloc_zone(void *a1, void *a2)
{
  id v3 = a1;
  __int128 v97 = a2;
  id v4 = getenv("SYMBOLICATION_LOG_ZONE_INTROSPECTION_LOOKUP");
  if (v4 && !strcmp(v4, "YES")) {
    logZoneIntrospectionLookup = 1;
  }
  id v5 = v3;
  unsigned int v107 = 0;
  char v6 = [v5 isExclave];
  uint64_t FlagsForNListOnlyData = 0LL;
  if ((v6 & 1) == 0) {
    uint64_t FlagsForNListOnlyData = CSSymbolicatorGetFlagsForNListOnlyData();
  }
  uint64_t v8 = [v5 createSymbolicatorWithFlags:FlagsForNListOnlyData andNotification:0];
  uint64_t v10 = v9;
  if (!CSIsNull())
  {
    v108[0] = 0LL;
    v117[0] = 0LL;
    BOOL malloc_zones_array_address_and_count = task_get_malloc_zones_array_address_and_count(v5, v8, v10, v108, &v107, v117);
    id v14 = v117[0];
    if (malloc_zones_array_address_and_count)
    {
      unint64_t v11 = v107;
      if (v107)
      {
        v115[0] = 0LL;
        [v5 memoryCache];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v16 = v108[0];
        uint64_t v17 = [v15 peekAtAddress:v108[0] size:8 * v11 returnsBuf:v115];

        if (!(_DWORD)v17)
        {
          uint64_t v18 = (char *)malloc(8 * v11);
          uint64_t v12 = v18;
          uint64_t v19 = 0LL;
          uint64_t v20 = v115[0];
          do
          {
            *(void *)&v18[v19] = *(void *)(v20 + v19);
            v19 += 8LL;
          }

          while (8 * v11 != v19);
          goto LABEL_17;
        }

        NSLog(@"*** task_malloc_get_all_zones: error %d reading zones at %qx\n", v17, v16);
        CSRelease();
      }

      else
      {
        CSRelease();
        NSLog(@"*** task_malloc_get_all_zones: target has no active zones\n");
        unint64_t v11 = 0LL;
      }

      uint64_t v12 = 0LL;
    }

    else
    {
      CSRelease();
      NSLog(@"*** task_malloc_get_all_zones: %@\n", v14);
      uint64_t v12 = 0LL;
      unint64_t v11 = v107;
    }

LABEL_127:
      uint64_t v46 = *v45;
      goto LABEL_128;
    }

    uint64_t v47 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v38, *(void *)(v34 + 96));
    CSSymbolicatorGetSymbolOwnerWithAddressAtTime();
    uint64_t CFUUIDBytes = (CFUUIDBytes *)CSSymbolOwnerGetCFUUIDBytes();
    if (CFUUIDBytes) {
      CFUUIDRef cf2 = CFUUIDCreateFromUUIDBytes(0LL, *CFUUIDBytes);
    }
    else {
      CFUUIDRef cf2 = 0LL;
    }
    uint64_t v49 = remoteZoneIntrospection_analysisProcessLibmallocAddr;
    if (v49 == CSSymbolOwnerGetBaseAddress()
      && remoteZoneIntrospection_analysisProcessLibmallocUUID
      && cf2
      && CFEqual((CFTypeRef)remoteZoneIntrospection_analysisProcessLibmallocUUID, cf2)
      && *MEMORY[0x1895FBCC8])
    {
      uint64_t v50 = 0LL;
      while (-[VMUTask ptrauthStripDataPointer:]( (uint64_t)v38,  *(void *)(*(void *)(*MEMORY[0x1895FBD60] + 8 * v50) + 96LL)) != v47)
      {
      }

      int v58 = 0;
      v125[3] = v47;
      goto LABEL_108;
    }

LABEL_79:
      if ((CSIsNull() & 1) != 0)
      {
        int v58 = 0;
        goto LABEL_108;
      }

      BOOL v64 = (const char *)CSSymbolOwnerGetPath();
      id v93 = 0LL;
      if (__s1)
      {
        dispatch_time_t v65 = v64;
        if (v64)
        {
          if (!strcmp(__s1, v64))
          {
            id v93 = 0LL;
          }

          else
          {
            id v93 = [MEMORY[0x1896NSStringrmat:@"%s in analysis process, for %s in target process", v65, __s1];
            __s1 = (char *)[v93 UTF8String];
          }
        }
      }

      CSSymbolOwnerGetSymbolWithAddress();
      if (!CSSymbolGetMangledName())
      {
        ((void (**)(void, const __CFString *))v104)[2]( v104,  @"couldn't get introspect structure symbol name from %s");
        goto LABEL_106;
      }

      CSSymbolOwnerGetSymbolWithMangledName();
      if (CSIsNull())
      {
        uint64_t v89 = (uint64_t)__s1;
        ((void (**)(void, const __CFString *))v104)[2]( v104,  @"couldn't find introspect structure symbol %s in %s");
LABEL_106:
        int v58 = 0;
LABEL_107:

LABEL_108:
        uint64_t v44 = v105;
        if (!v125[3]) {
          goto LABEL_147;
        }
        CSSymbolOwnerGetSymbolWithAddress();
        uint64_t Name = CSSymbolGetName();
        if (Name)
        {
          [NSString stringWithUTF8String:Name];
          unsigned int v76 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          unsigned int v76 = @"<no symbol>";
        }

        [NSString stringWithUTF8String:CSSymbolOwnerGetPath()];
        os_signpost_id_t v77 = (void *)objc_claimAutoreleasedReturnValue();
        VMUSanitizePath(v77);
        uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();

        uint64_t v79 = -[__CFString rangeOfString:](v76, "rangeOfString:", @"(");
        if (v80)
        {
          uint64_t v81 = -[__CFString substringToIndex:](v76, "substringToIndex:", v79);

          unsigned int v76 = (__CFString *)v81;
        }

        uint64_t v82 = [v43 rangeOfString:@"_0x"];
        if (v82 == 0x7FFFFFFFFFFFFFFFLL)
        {
          id v83 = v43;
        }

        else
        {
          [v43 substringToIndex:v82];
          id v83 = (id)objc_claimAutoreleasedReturnValue();
        }

        v84 = v83;
        id v85 = "";
        if (v58) {
          id v85 = " -- loaded from target process";
        }
        id v86 = [NSString stringWithFormat:@"enumerating %@ by calling %@ in %@%s\n", v83, v76, v78, v85];
        uint64_t v44 = v86;
        if (logZoneIntrospectionLookup == 1) {
          NSLog(@"%@", v86);
        }

        if (!v125[3])
        {
LABEL_147:
          if (!*((_BYTE *)v121 + 24)) {
            ((void (**)(void, const __CFString *))v104)[2](v104, @"unknown");
          }
        }

        CSRelease();
        if (cf2) {
          CFRelease(cf2);
        }
        unint64_t v45 = v125 + 3;
        id v5 = v94;
        goto LABEL_127;
      }

      uint64_t Range = (uint64_t *)CSSymbolGetRange();
      if (Range)
      {
        __biga = (char *)Range;
        if (*Range)
        {
          uint64_t v67 = -[VMUTask ptrauthStripDataPointer:]((uint64_t)v38, *Range);
          CSSymbolOwnerGetSymbolWithAddress();
          if (!CSSymbolIsFunction() || CSSymbolGetRange() != v67)
          {
            uint64_t v89 = v67;
            ((void (**)(void, const __CFString *))v104)[2]( v104,  @"introspect structure %s for the malloc zone has invalid enumerator function address %#llx in %s");
            goto LABEL_106;
          }

          if (!v102[2]())
          {
LABEL_139:
            v125[3] = (uint64_t)__biga;
            int v58 = 1;
            goto LABEL_107;
          }

          id v68 = v38;
          if ((CSIsNull() & 1) == 0)
          {
            BOOL v69 = (CFUUIDBytes *)CSSymbolOwnerGetCFUUIDBytes();
            if (v69)
            {
              CFUUIDRef v70 = CFUUIDCreateFromUUIDBytes(0LL, *v69);
              CFUUIDRef v71 = v70;
              if (cf2 && v70)
              {
                if (!CFEqual(v70, cf2))
                {
                  __s1a = (char *)CSSymbolOwnerGetName();
                  [v68 memoryCache];
                  id v72 = (void *)objc_claimAutoreleasedReturnValue();
                  char v73 = [v72 isDriverKit];

                  if ((v73 & 1) == 0) {
                    NSLog( @"%s in target process is different than in analysis process, which can cause problems analyzing me mory.  You may need to relaunch the target process and analysis process to get the new vers ion of the framework.  The dyld shared cache may also be out of date, which could affect sy stem performance.  To update the dyld shared cache, run 'sudo update_dyld_shared_cache' and reboot.\n\n",  __s1a);
                  }
                }

                goto LABEL_137;
              }

              if (v70) {
LABEL_137:
              }
                CFRelease(v71);
            }
          }

          goto LABEL_139;
        }

        uint64_t v74 = @"introspect structure %s for the malloc zone has no enumerator function in %s";
      }

      else
      {
        uint64_t v74 = @"couldn't get address of introspect structure symbol %s in %s";
      }

      uint64_t v89 = (uint64_t)__s1;
      ((void (**)(void, const __CFString *))v104)[2](v104, v74);
      goto LABEL_106;
    }

    if ((v103[2]() & 1) == 0)
    {
      *((_BYTE *)v121 + 24) = 1;
      goto LABEL_79;
    }

    id v51 = v43;
    __big = (char *)CSSymbolOwnerGetPath();
    CSSymbolOwnerGetName();
    id v92 = v51;
    uint64_t v52 = __big;
    uint64_t v53 = strstr(__big, "libclang_rt.asan");
    char v54 = @"for security, cannot load non-system library %s";
    if (v53) {
      goto LABEL_51;
    }
    uint64_t v55 = strstr(__big, "libclang_rt.tsan");
    char v54 = @"for security, cannot load non-system library %s";
    if (v55) {
      goto LABEL_51;
    }
    if (strncmp(__big, "/System/", 8uLL) && strncmp(__big, "/usr/", 5uLL))
    {
      uint64_t v61 = getprogname();
      if (!strcmp(v61, "ReportCrash"))
      {
        char v54 = @"for security, cannot load non-system library %s from unsafe path into ReportCrash";
        uint64_t v52 = __big;
LABEL_51:
        [MEMORY[0x189NSStringormat:v54, v52];
        BOOL v56 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_52;
      }

      if ((dyld_process_is_restricted() & 1) != 0 || !getuid())
      {
        int v128 = 0;
        getpid();
        if (csops() || (v128 & 0x2000) == 0)
        {
          [MEMORY[0x1896NSStringrmat:@"for security, cannot load non-system library %s" __big];
          BOOL v56 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_52:
          id v57 = v56;

          if (v57) {
            goto LABEL_76;
          }
LABEL_68:
          if (dlopen(__big, 389))
          {
            if (logZoneIntrospectionLookup == 1) {
              NSLog(@"loaded %s for %@ introspection\n", __big, v92);
            }
            CSRelease();
            CSSymbolicatorGetFlagsForNListOnlyData();
            CSSymbolicatorCreateWithTaskFlagsAndNotification();
            CSSymbolicatorGetSymbolOwnerWithNameAtTime();
            if (!CSIsNull())
            {
              id v57 = 0LL;
              goto LABEL_76;
            }

            [MEMORY[0x189NSStringormat:@"couldn't create symbolicator for %s", __big];
            uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            [MEMORY[0x189NSStringormat:@"%s" dlerror()];
            uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue();
          }

          id v57 = v62;
LABEL_76:

          id v63 = v57;
          goto LABEL_79;
        }
      }
    }

    goto LABEL_68;
  }

void sub_186141938(_Unwind_Exception *a1)
{
}

void task_enumerate_malloc_blocks(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __task_enumerate_malloc_blocks_block_invoke;
  v4[3] = &__block_descriptor_56_e82_i32__0Q8__malloc_introspection_t_________________________________I_16__NSString_24l;
  int v5 = a1;
  int v6 = a3;
  v4[4] = a2;
  v4[5] = a4;
  task_foreach_malloc_zone(a1, v4);
}

uint64_t __task_enumerate_malloc_blocks_block_invoke( uint64_t a1, uint64_t a2, uint64_t (**a3)(void, void, void, uint64_t, uint64_t (*)(vm_map_read_t a1, mach_vm_address_t a2, mach_vm_size_t a3, mach_vm_address_t *a4), void))
{
  return (*a3)( *(unsigned int *)(a1 + 48),  *(void *)(a1 + 32),  *(unsigned int *)(a1 + 52),  a2,  task_peek_natural_size,  *(void *)(a1 + 40));
}

id task_get_malloc_ptrs_by_zone(uint64_t a1, void *a2)
{
  id v3 = a2;
  [MEMORY[0x189603FC8] dictionary];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __task_get_malloc_ptrs_by_zone_block_invoke;
  v10[3] = &unk_189DFFCF0;
  id v11 = v3;
  int v13 = a1;
  id v5 = v4;
  id v12 = v5;
  id v6 = v3;
  task_foreach_malloc_zone(a1, v10);
  int v7 = v12;
  id v8 = v5;

  return v8;
}

uint64_t __task_get_malloc_ptrs_by_zone_block_invoke( uint64_t a1, uint64_t a2, uint64_t (**a3)(void, VMURangeArray *, uint64_t, uint64_t, uint64_t (*)(vm_map_read_t a1, mach_vm_address_t a2, mach_vm_size_t a3, mach_vm_address_t *a4), uint64_t (*)(uint64_t a1, void *a2, uint64_t a3, uint64_t *a4, int a5)), void *a4)
{
  id v7 = a4;
  if (!*(void *)(a1 + 32)
    || (id v8 = objc_alloc_init(&OBJC_CLASS___VMUNonOverlappingRangeArray),
        uint64_t v9 = (*a3)(*(unsigned int *)(a1 + 48), &v8->super, 6LL, a2, task_peek_natural_size, nonOverlappingRecorder),
        -[VMUNonOverlappingRangeArray sortAndMergeRanges](v8, "sortAndMergeRanges"),
        [*(id *)(a1 + 32) setObject:v8 forKey:v7],
        v8,
        !(_DWORD)v9))
  {
    uint64_t v10 = objc_alloc_init(&OBJC_CLASS___VMURangeArray);
    uint64_t v9 = (*a3)(*(unsigned int *)(a1 + 48), v10, 1LL, a2, task_peek_natural_size, ptrsRecorder);
    [*(id *)(a1 + 40) setObject:v10 forKey:v7];
  }

  return v9;
}

uint64_t nonOverlappingRecorder(uint64_t a1, void *a2, uint64_t a3, uint64_t *a4, int a5)
{
  if (a5)
  {
    int v5 = a5;
    do
    {
      --v5;
      uint64_t v8 = *a4;
      uint64_t v9 = a4[1];
      a4 += 2;
      uint64_t result = [a2 addOrExtendRange:v8, v9];
    }

    while (v5);
  }

  return result;
}

uint64_t ptrsRecorder(uint64_t a1, void *a2, uint64_t a3, uint64_t *a4, int a5)
{
  if (a5)
  {
    int v5 = a5;
    do
    {
      --v5;
      uint64_t v8 = *a4;
      uint64_t v9 = a4[1];
      a4 += 2;
      uint64_t result = [a2 addRange:v8, v9];
    }

    while (v5);
  }

  return result;
}

id task_get_malloc_ptrs(uint64_t a1)
{
  uint64_t v2 = (void *)objc_opt_new();
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __task_enumerate_malloc_blocks_block_invoke;
  v4[3] = &__block_descriptor_56_e82_i32__0Q8__malloc_introspection_t_________________________________I_16__NSString_24l;
  int v5 = a1;
  int v6 = 1;
  v4[4] = v2;
  v4[5] = ptrsRecorder;
  task_foreach_malloc_zone(a1, v4);
  return v2;
}

id task_find_all_malloc_regions(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)objc_opt_new();
  uint64_t v5 = MEMORY[0x1895F87A8];
  uint64_t v6 = 3221225472LL;
  id v7 = __VMUTask_enumerate_malloc_blocks_block_invoke;
  uint64_t v8 = &unk_189DFFDF8;
  id v9 = v1;
  uint64_t v10 = v2;
  int v12 = 6;
  id v11 = nonOverlappingRecorder;
  id v3 = v1;
  withPeekFunctionForVMUTask(v3, &v5);

  [v2 sortAndMergeRanges:v5, v6, v7, v8];
  return v2;
}

void __remoteZoneIntrospection_block_invoke()
{
  uint64_t CFUUIDBytes = (CFUUIDBytes *)CSSymbolOwnerGetCFUUIDBytes();
  if (CFUUIDBytes) {
    remoteZoneIntrospection_analysisProcessLibmallocUUID = (uint64_t)CFUUIDCreateFromUUIDBytes(0LL, *CFUUIDBytes);
  }
  remoteZoneIntrospection_analysisProcessLibmallocAddr = CSSymbolOwnerGetBaseAddress();
  CSRelease();
  uint64_t v1 = objc_opt_new();
  uint64_t v2 = (void *)remoteZoneIntrospection_previouslySeenTasksAndZones;
  remoteZoneIntrospection_previouslySeenTasksAndZones = v1;

  uint64_t v3 = objc_opt_new();
  id v4 = (void *)remoteZoneIntrospection_previouslySeenTasksAndZonesLock;
  remoteZoneIntrospection_previouslySeenTasksAndZonesLock = v3;
}

uint64_t __remoteZoneIntrospection_block_invoke_2(uint64_t a1, int a2)
{
  if ([*(id *)(a1 + 32) isCore]) {
    [*(id *)(a1 + 32) coreFilePath];
  }
  else {
    [MEMORY[0x189NSStringormat:@"%d", [*(id *)(a1 + 32) taskPort]];
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [NSString stringWithFormat:@"%@ %@", v4, *(void *)(a1 + 40)];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = [(id)remoteZoneIntrospection_previouslySeenTasksAndZones containsObject:v5];
  if ((v6 & 1) == 0 && a2) {
    [(id)remoteZoneIntrospection_previouslySeenTasksAndZones addObject:v5];
  }
  [(id)remoteZoneIntrospection_previouslySeenTasksAndZonesLock unlock];

  return v6 ^ 1u;
}

uint64_t __remoteZoneIntrospection_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __remoteZoneIntrospection_block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __remoteZoneIntrospection_block_invoke_5( void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a2;
  if ((*(unsigned int (**)(void))(a1[5] + 16LL))())
  {
    id v11 = (void *)[objc_alloc(NSString) initWithFormat:v10 arguments:&a9];
    int v12 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithFormat:@"Can't examine target process's malloc zone %@, so memory analysis will be incomplete or incorrect.\n", a1[4]];
    [v12 appendFormat:@"Reason: %@\n\n", v11];
    int v13 = (FILE *)*MEMORY[0x1895F89D0];
    id v14 = v12;
    fputs((const char *)[v14 UTF8String], v13);
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      __remoteZoneIntrospection_block_invoke_5_cold_1((uint64_t)v14);
    }
  }

  *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
  *(void *)(*(void *)(a1[7] + 8LL) + 24LL) = 0LL;
}

void *__remoteZoneIntrospection_block_invoke_56()
{
  uint64_t v0 = "/System/Library/PrivateFrameworks/libmalloc_exclaves_introspector.framework/libmalloc_exclaves_introspector";
  if (os_variant_has_internal_content())
  {
    uint64_t v1 = getenv("SYMBOLICATION_EXCLAVES_INTROSPECTOR_FRAMEWORK_PATH");
    if (v1) {
      uint64_t v0 = v1;
    }
  }

  uint64_t result = dlopen(v0, 133);
  if (result)
  {
    uint64_t result = dlsym(result, "xzm_malloc_zone_introspect");
    remoteZoneIntrospection_exclaveIntrospectionDetails = (uint64_t)result;
    if (result) {
      remoteZoneIntrospection_getExclaveIntrospectionSucceeded = 1;
    }
  }

  return result;
}

id VMURegisterNameForIndex(uint64_t a1)
{
  else {
    [NSString stringWithUTF8String:VMURegisterNameForIndex_regNames[a1]];
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

LABEL_62:
        unint64_t v45 = *(float *)&v79;
        if (![v23 scanCharactersFromSet:v70 intoString:0]
          || ![v23 scanCharactersFromSet:v75 intoString:0])
        {
          goto LABEL_87;
        }

        id v39 = (unint64_t)v45;

LABEL_65:
        uint64_t v46 = [v23 scanLocation];
        uint64_t v80 = 0LL;
        [v23 scanUpToCharactersFromSet:v73 intoString:&v80];
        uint64_t v47 = v80;
        uint64_t v48 = [v47 length];
        if (v48)
        {
          if (!v39)
          {
            id v57 = v46;
            uint64_t v49 = p_isa[14];
            uint64_t v50 = v47;
            [v49 member:v50];
            uint64_t v47 = (id)objc_claimAutoreleasedReturnValue();
            if (!v47)
            {
              [v49 addObject:v50];
              uint64_t v47 = v50;
            }

            uint64_t v46 = v57;
            id v39 = 0LL;
LABEL_75:
            id v51 = -[VMUCallTreeNode findOrAddChildWithName:address:nodeSearchType:isLeafNode:]( v24,  "findOrAddChildWithName:address:nodeSearchType:isLeafNode:",  v47,  0LL,  0LL,  0LL);
            uint64_t v52 = (void *)v51;
            if (v51)
            {
              *(_DWORD *)(v51 + 40) = v82;
              *(void *)(v51 + 32) = v39;
              if ((v61 & 1) != 0
                && ([(id)v51 parseNameIntoSymbol:0 library:0 loadAddress:0 offset:0 address:&v79 suffix:0],  (uint64_t v53 = v79) != 0))
              {
                uint64_t v61 = 1;
              }

              else
              {
                [v23 setScanLocation:v46];
                [v23 scanUpToString:@"0x" intoString:0];
                [v23 scanHexLongLong:&v79];
                uint64_t v53 = v79;
                uint64_t v61 = 0;
                if (!v79)
                {
                  uint64_t v79 = v59;
                  uint64_t v53 = v59++;
                }
              }

              v52[3] = v53;
              [v71 addObject:v52];
              int v58 = v52;
              char v54 = v52;

              [v72 addObject:v62];
              uint64_t v55 = v62;

              if ((id *)v54->super._parent == p_isa)
              {
                *((_DWORD *)p_isa + 10) += v82;
                p_isa[4] = (char *)p_isa[4] + v39;
              }

              uint64_t v22 = v55;
              unint64_t v24 = v54;
              uint64_t v52 = v58;
            }

            unsigned int v30 = 1;
            uint64_t v31 = v22;
            uint64_t v32 = v24;
            id v29 = v23;
            uint64_t v34 = context;
            goto LABEL_45;
          }

          if (([v47 isEqualToString:kVMURootNodeNameForMallocCallTrees[0]] & 1) == 0) {
            goto LABEL_75;
          }
        }

        else
        {
          dispatch_time_t v65 = 1;
        }

        objc_autoreleasePoolPop(context);
        unsigned int v30 = 1;
        uint64_t v19 = v78;
        if (!v48) {
          goto LABEL_90;
        }
        break;
      case 2:
        goto LABEL_36;
      case 3:
        goto LABEL_44;
      default:
        goto LABEL_45;
    }

uint64_t _compareSizeCount(int a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a4;
  id v10 = a5;
  if (a1) {
    uint64_t v11 = a3;
  }
  else {
    uint64_t v11 = a2;
  }
  if (v11 <= 0)
  {
    if ((v11 & 0x8000000000000000LL) == 0)
    {
      if (a1) {
        uint64_t v14 = a2;
      }
      else {
        uint64_t v14 = a3;
      }
      if (v14 > 0) {
        goto LABEL_5;
      }
      if ((v14 & 0x8000000000000000LL) == 0)
      {
        uint64_t v12 = [v9 compare:v10];
        goto LABEL_6;
      }
    }

    uint64_t v12 = 1LL;
    goto LABEL_6;
  }

void sub_186147254(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1861475B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_186147B34( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, void *a25)
{
  _Unwind_Resume(a1);
}

void sub_186147CA4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_186147D40( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_186147F54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_186147FF8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_186148098( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

void sub_186148304(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_186148464(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1861485E0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_186148668( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

void sub_1861487B4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  if (a15 < 0) {
    operator delete(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_1861488EC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1861489C8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_186148B74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_186148C10( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_186148F14( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUFieldInfo * {__strong},std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::hash<VMUFieldInfo * {__strong}>,std::equal_to<VMUFieldInfo * {__strong}>,true>,std::__unordered_map_equal<VMUFieldInfo * {__strong},std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::equal_to<VMUFieldInfo * {__strong}>,std::hash<VMUFieldInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>>>::__emplace_unique_key_args<VMUFieldInfo * {__strong},std::pair<VMUFieldInfo * {__strong},unsigned int>>( uint64_t a1, id *a2, uint64_t *a3)
{
  unint64_t v7 = [*a2 hash];
  unint64_t v8 = v7;
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    unint64_t v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v3 = v7;
      if (v7 >= v9) {
        unint64_t v3 = v7 % v9;
      }
    }

    else
    {
      unint64_t v3 = (v9 - 1) & v7;
    }

    uint64_t v12 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v12)
    {
      int v13 = *v12;
      if (*v12)
      {
        do
        {
          unint64_t v14 = v13[1];
          if (v14 == v8)
          {
            id v15 = (id)v13[2];
            if (v15 == *a2 || (objc_msgSend(v15, "isEqual:") & 1) != 0) {
              return v13;
            }
          }

          else
          {
            if (v11 > 1)
            {
              if (v14 >= v9) {
                v14 %= v9;
              }
            }

            else
            {
              v14 &= v9 - 1;
            }

            if (v14 != v3) {
              break;
            }
          }

          int v13 = (void *)*v13;
        }

        while (v13);
      }
    }
  }

  uint64_t v16 = (void *)(a1 + 16);
  int v13 = operator new(0x20uLL);
  void *v13 = 0LL;
  v13[1] = v8;
  uint64_t v17 = *a3;
  *a3 = 0LL;
  void v13[2] = v17;
  *((_DWORD *)v13 + 6) = *((_DWORD *)a3 + 2);
  float v18 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v19 = *(float *)(a1 + 32);
  if (!v9 || (float)(v19 * (float)v9) < v18)
  {
    BOOL v20 = 1LL;
    if (v9 >= 3) {
      BOOL v20 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v21 = v20 | (2 * v9);
    unint64_t v22 = vcvtps_u32_f32(v18 / v19);
    if (v21 <= v22) {
      size_t v23 = v22;
    }
    else {
      size_t v23 = v21;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( a1,  v23);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
      else {
        unint64_t v3 = v8;
      }
    }

    else
    {
      unint64_t v3 = (v9 - 1) & v8;
    }
  }

  uint64_t v24 = *(void *)a1;
  uint64_t v25 = *(void **)(*(void *)a1 + 8 * v3);
  if (v25)
  {
    void *v13 = *v25;
LABEL_39:
    void *v25 = v13;
    goto LABEL_40;
  }

  void *v13 = *v16;
  *uint64_t v16 = v13;
  *(void *)(v24 + 8 * v3) = v16;
  if (*v13)
  {
    unint64_t v26 = *(void *)(*v13 + 8LL);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v26 >= v9) {
        v26 %= v9;
      }
    }

    else
    {
      v26 &= v9 - 1;
    }

    uint64_t v25 = (void *)(*(void *)a1 + 8 * v26);
    goto LABEL_39;
  }

void sub_186149274(_Unwind_Exception *a1)
{
}

void *std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::__emplace_unique_key_args<VMUClassInfo * {__strong},std::pair<VMUClassInfo * {__strong},unsigned int>>( uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
    }

    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }

    unint64_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      uint8x8_t v10 = *v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == v6)
          {
            if (v10[2] == v6) {
              return v10;
            }
          }

          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7) {
                v11 %= v7;
              }
            }

            else
            {
              v11 &= v7 - 1;
            }

            if (v11 != v3) {
              break;
            }
          }

          uint8x8_t v10 = (void *)*v10;
        }

        while (v10);
      }
    }
  }

  uint64_t v12 = (void *)(a1 + 16);
  uint8x8_t v10 = operator new(0x20uLL);
  *uint8x8_t v10 = 0LL;
  v10[1] = v6;
  uint64_t v13 = *a3;
  *a3 = 0LL;
  v10[2] = v13;
  *((_DWORD *)v10 + 6) = *((_DWORD *)a3 + 2);
  float v14 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v15 = *(float *)(a1 + 32);
  if (!v7 || (float)(v15 * (float)v7) < v14)
  {
    BOOL v16 = 1LL;
    if (v7 >= 3) {
      BOOL v16 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v17 = v16 | (2 * v7);
    unint64_t v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18) {
      size_t v19 = v18;
    }
    else {
      size_t v19 = v17;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( a1,  v19);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }

    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }

  uint64_t v20 = *(void *)a1;
  unint64_t v21 = *(void **)(*(void *)a1 + 8 * v3);
  if (v21)
  {
    *uint8x8_t v10 = *v21;
LABEL_38:
    void *v21 = v10;
    goto LABEL_39;
  }

  *uint8x8_t v10 = *v12;
  void *v12 = v10;
  *(void *)(v20 + 8 * v3) = v12;
  if (*v10)
  {
    unint64_t v22 = *(void *)(*v10 + 8LL);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v22 >= v7) {
        v22 %= v7;
      }
    }

    else
    {
      v22 &= v7 - 1;
    }

    unint64_t v21 = (void *)(*(void *)a1 + 8 * v22);
    goto LABEL_38;
  }

void sub_1861494C4(_Unwind_Exception *a1)
{
}

void *std::__hash_table<std::__hash_value_type<unsigned long long,unsigned int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned int>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long,unsigned int>>( uint64_t a1, unint64_t *a2, uint64_t a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
    }

    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }

    unint64_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      uint8x8_t v10 = *v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == v6)
          {
            if (v10[2] == v6) {
              return v10;
            }
          }

          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7) {
                v11 %= v7;
              }
            }

            else
            {
              v11 &= v7 - 1;
            }

            if (v11 != v3) {
              break;
            }
          }

          uint8x8_t v10 = (void *)*v10;
        }

        while (v10);
      }
    }
  }

  uint8x8_t v10 = operator new(0x20uLL);
  *uint8x8_t v10 = 0LL;
  v10[1] = v6;
  v10[2] = *(void *)a3;
  *((_DWORD *)v10 + 6) = *(_DWORD *)(a3 + 8);
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1LL;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( a1,  v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }

    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }

  uint64_t v18 = *(void *)a1;
  size_t v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    *uint8x8_t v10 = *v19;
LABEL_38:
    void *v19 = v10;
    goto LABEL_39;
  }

  *uint8x8_t v10 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    unint64_t v20 = *(void *)(*v10 + 8LL);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }

    else
    {
      v20 &= v7 - 1;
    }

    size_t v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }

void sub_1861496EC(_Unwind_Exception *a1)
{
}

void *std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::find<VMUClassInfo * {__strong}>( void *a1, unint64_t *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0LL;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL) {
    uint64_t v5 = *(void *)&v2 <= v3 ? v3 % *(void *)&v2 : *a2;
  }
  else {
    uint64_t v5 = (*(void *)&v2 - 1LL) & v3;
  }
  unint64_t v6 = *(void **)(*a1 + 8 * v5);
  if (!v6) {
    return 0LL;
  }
  uint64_t result = (void *)*v6;
  if (*v6)
  {
    do
    {
      unint64_t v8 = result[1];
      if (v8 == v3)
      {
        if (result[2] == v3) {
          return result;
        }
      }

      else
      {
        if (v4.u32[0] > 1uLL)
        {
          if (v8 >= *(void *)&v2) {
            v8 %= *(void *)&v2;
          }
        }

        else
        {
          v8 &= *(void *)&v2 - 1LL;
        }

        if (v8 != v5) {
          return 0LL;
        }
      }

      uint64_t result = (void *)*result;
    }

    while (result);
  }

  return result;
}

void *std::__hash_table<std::__hash_value_type<unsigned long long,unsigned int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned int>>>::__emplace_unique_key_args<unsigned long long,unsigned long long &,unsigned int &>( uint64_t a1, unint64_t *a2, void *a3, _DWORD *a4)
{
  unint64_t v8 = *a2;
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v8 >= v9) {
        unint64_t v4 = v8 % v9;
      }
    }

    else
    {
      unint64_t v4 = (v9 - 1) & v8;
    }

    unint64_t v11 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v11)
    {
      float v12 = *v11;
      if (*v11)
      {
        do
        {
          unint64_t v13 = v12[1];
          if (v13 == v8)
          {
            if (v12[2] == v8) {
              return v12;
            }
          }

          else
          {
            if (v10.u32[0] > 1uLL)
            {
              if (v13 >= v9) {
                v13 %= v9;
              }
            }

            else
            {
              v13 &= v9 - 1;
            }

            if (v13 != v4) {
              break;
            }
          }

          float v12 = (void *)*v12;
        }

        while (v12);
      }
    }
  }

  float v12 = operator new(0x20uLL);
  void *v12 = 0LL;
  v12[1] = v8;
  v12[2] = *a3;
  *((_DWORD *)v12 + 6) = *a4;
  float v14 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v15 = *(float *)(a1 + 32);
  if (!v9 || (float)(v15 * (float)v9) < v14)
  {
    BOOL v16 = 1LL;
    if (v9 >= 3) {
      BOOL v16 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v17 = v16 | (2 * v9);
    unint64_t v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18) {
      size_t v19 = v18;
    }
    else {
      size_t v19 = v17;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( a1,  v19);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v4 = v8 % v9;
      }
      else {
        unint64_t v4 = v8;
      }
    }

    else
    {
      unint64_t v4 = (v9 - 1) & v8;
    }
  }

  uint64_t v20 = *(void *)a1;
  unint64_t v21 = *(void **)(*(void *)a1 + 8 * v4);
  if (v21)
  {
    void *v12 = *v21;
LABEL_38:
    void *v21 = v12;
    goto LABEL_39;
  }

  void *v12 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v12;
  *(void *)(v20 + 8 * v4) = a1 + 16;
  if (*v12)
  {
    unint64_t v22 = *(void *)(*v12 + 8LL);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v22 >= v9) {
        v22 %= v9;
      }
    }

    else
    {
      v22 &= v9 - 1;
    }

    unint64_t v21 = (void *)(*(void *)a1 + 8 * v22);
    goto LABEL_38;
  }

void sub_1861499D0(_Unwind_Exception *a1)
{
}

void *std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::__emplace_unique_key_args<VMUClassInfo * {__strong},VMUClassInfo * {__strong}&,unsigned int &>( uint64_t a1, unint64_t *a2, id *a3, _DWORD *a4)
{
  unint64_t v8 = *a2;
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v9 <= v8) {
        unint64_t v4 = v8 % v9;
      }
    }

    else
    {
      unint64_t v4 = (v9 - 1) & v8;
    }

    unint64_t v11 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v11)
    {
      float v12 = *v11;
      if (*v11)
      {
        do
        {
          unint64_t v13 = v12[1];
          if (v13 == v8)
          {
            if (v12[2] == v8) {
              return v12;
            }
          }

          else
          {
            if (v10.u32[0] > 1uLL)
            {
              if (v13 >= v9) {
                v13 %= v9;
              }
            }

            else
            {
              v13 &= v9 - 1;
            }

            if (v13 != v4) {
              break;
            }
          }

          float v12 = (void *)*v12;
        }

        while (v12);
      }
    }
  }

  float v14 = (void *)(a1 + 16);
  float v12 = operator new(0x20uLL);
  void *v12 = 0LL;
  v12[1] = v8;
  v12[2] = *a3;
  *((_DWORD *)v12 + 6) = *a4;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v16 = *(float *)(a1 + 32);
  if (!v9 || (float)(v16 * (float)v9) < v15)
  {
    BOOL v17 = 1LL;
    if (v9 >= 3) {
      BOOL v17 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v9);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( a1,  v20);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v9 <= v8) {
        unint64_t v4 = v8 % v9;
      }
      else {
        unint64_t v4 = v8;
      }
    }

    else
    {
      unint64_t v4 = (v9 - 1) & v8;
    }
  }

  uint64_t v21 = *(void *)a1;
  unint64_t v22 = *(void **)(*(void *)a1 + 8 * v4);
  if (v22)
  {
    void *v12 = *v22;
LABEL_38:
    void *v22 = v12;
    goto LABEL_39;
  }

  void *v12 = *v14;
  void *v14 = v12;
  *(void *)(v21 + 8 * v4) = v14;
  if (*v12)
  {
    unint64_t v23 = *(void *)(*v12 + 8LL);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v23 >= v9) {
        v23 %= v9;
      }
    }

    else
    {
      v23 &= v9 - 1;
    }

    unint64_t v22 = (void *)(*(void *)a1 + 8 * v23);
    goto LABEL_38;
  }

void sub_186149C1C(_Unwind_Exception *a1)
{
}

void *std::__hash_table<std::__hash_value_type<unsigned long long,unsigned int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned int>>>::find<unsigned long long>( void *a1, unint64_t *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0LL;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (v3 >= *(void *)&v2) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }

  else
  {
    unint64_t v5 = (*(void *)&v2 - 1LL) & v3;
  }

  unint64_t v6 = *(void **)(*a1 + 8 * v5);
  if (!v6) {
    return 0LL;
  }
  uint64_t result = (void *)*v6;
  if (*v6)
  {
    do
    {
      unint64_t v8 = result[1];
      if (v8 == v3)
      {
        if (result[2] == v3) {
          return result;
        }
      }

      else
      {
        if (v4.u32[0] > 1uLL)
        {
          if (v8 >= *(void *)&v2) {
            v8 %= *(void *)&v2;
          }
        }

        else
        {
          v8 &= *(void *)&v2 - 1LL;
        }

        if (v8 != v5) {
          return 0LL;
        }
      }

      uint64_t result = (void *)*result;
    }

    while (result);
  }

  return result;
}

void *std::__hash_table<std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUFieldInfo * {__strong},std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::hash<VMUFieldInfo * {__strong}>,std::equal_to<VMUFieldInfo * {__strong}>,true>,std::__unordered_map_equal<VMUFieldInfo * {__strong},std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::equal_to<VMUFieldInfo * {__strong}>,std::hash<VMUFieldInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>>>::__emplace_unique_key_args<VMUFieldInfo * {__strong},std::piecewise_construct_t const&,std::tuple<VMUFieldInfo * const {__strong}&>,std::tuple<>>( uint64_t a1, id *a2, uint64_t a3, id **a4)
{
  unint64_t v8 = [*a2 hash];
  unint64_t v9 = v8;
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    unint64_t v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v4 = v8;
      if (v8 >= v10) {
        unint64_t v4 = v8 % v10;
      }
    }

    else
    {
      unint64_t v4 = (v10 - 1) & v8;
    }

    unint64_t v13 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v13)
    {
      float v14 = *v13;
      if (*v13)
      {
        do
        {
          unint64_t v15 = v14[1];
          if (v15 == v9)
          {
            id v16 = (id)v14[2];
            if (v16 == *a2 || (objc_msgSend(v16, "isEqual:") & 1) != 0) {
              return v14;
            }
          }

          else
          {
            if (v12 > 1)
            {
              if (v15 >= v10) {
                v15 %= v10;
              }
            }

            else
            {
              v15 &= v10 - 1;
            }

            if (v15 != v4) {
              break;
            }
          }

          float v14 = (void *)*v14;
        }

        while (v14);
      }
    }
  }

  BOOL v17 = (void *)(a1 + 16);
  float v14 = operator new(0x20uLL);
  void *v14 = 0LL;
  v14[1] = v9;
  v14[2] = **a4;
  *((_DWORD *)v14 + 6) = 0;
  float v18 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v19 = *(float *)(a1 + 32);
  if (!v10 || (float)(v19 * (float)v10) < v18)
  {
    BOOL v20 = 1LL;
    if (v10 >= 3) {
      BOOL v20 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v21 = v20 | (2 * v10);
    unint64_t v22 = vcvtps_u32_f32(v18 / v19);
    if (v21 <= v22) {
      size_t v23 = v22;
    }
    else {
      size_t v23 = v21;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( a1,  v23);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10) {
        unint64_t v4 = v9 % v10;
      }
      else {
        unint64_t v4 = v9;
      }
    }

    else
    {
      unint64_t v4 = (v10 - 1) & v9;
    }
  }

  uint64_t v24 = *(void *)a1;
  uint64_t v25 = *(void **)(*(void *)a1 + 8 * v4);
  if (v25)
  {
    void *v14 = *v25;
LABEL_39:
    void *v25 = v14;
    goto LABEL_40;
  }

  void *v14 = *v17;
  *BOOL v17 = v14;
  *(void *)(v24 + 8 * v4) = v17;
  if (*v14)
  {
    unint64_t v26 = *(void *)(*v14 + 8LL);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v26 >= v10) {
        v26 %= v10;
      }
    }

    else
    {
      v26 &= v10 - 1;
    }

    uint64_t v25 = (void *)(*(void *)a1 + 8 * v26);
    goto LABEL_39;
  }

void sub_186149F40(_Unwind_Exception *a1)
{
}

void *std::__hash_table<std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUFieldInfo * {__strong},std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::hash<VMUFieldInfo * {__strong}>,std::equal_to<VMUFieldInfo * {__strong}>,true>,std::__unordered_map_equal<VMUFieldInfo * {__strong},std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::equal_to<VMUFieldInfo * {__strong}>,std::hash<VMUFieldInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>>>::find<VMUFieldInfo * {__strong}>( void *a1, id *a2)
{
  unint64_t v4 = [*a2 hash];
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0LL;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }

  else
  {
    unint64_t v9 = (*(void *)&v5 - 1LL) & v4;
  }

  unint64_t v10 = *(void **)(*a1 + 8 * v9);
  if (!v10) {
    return 0LL;
  }
  uint8x8_t v11 = (void *)*v10;
  if (*v10)
  {
    do
    {
      unint64_t v12 = v11[1];
      if (v12 == v6)
      {
        id v13 = (id)v11[2];
        if (v13 == *a2 || (objc_msgSend(v13, "isEqual:") & 1) != 0) {
          return v11;
        }
      }

      else
      {
        if (v8 > 1)
        {
          if (v12 >= *(void *)&v5) {
            v12 %= *(void *)&v5;
          }
        }

        else
        {
          v12 &= *(void *)&v5 - 1LL;
        }

        if (v12 != v9) {
          return 0LL;
        }
      }

      uint8x8_t v11 = (void *)*v11;
    }

    while (v11);
  }

  return v11;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<SwiftFieldKey,unsigned int>,std::__unordered_map_hasher<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::hash<SwiftFieldKey>,std::equal_to<SwiftFieldKey>,true>,std::__unordered_map_equal<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::equal_to<SwiftFieldKey>,std::hash<SwiftFieldKey>,true>,std::allocator<std::__hash_value_type<SwiftFieldKey,unsigned int>>>::find<SwiftFieldKey>( void *a1, uint64_t a2)
{
  unint64_t v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)&v14, a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0LL;
  }
  unint64_t v6 = v4 ^ *(unsigned int *)(a2 + 24) ^ *(unsigned int *)(a2 + 28) ^ *(void *)(a2 + 32) ^ *(int *)(a2 + 40);
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4 ^ *(unsigned int *)(a2 + 24) ^ *(unsigned int *)(a2 + 28) ^ *(void *)(a2 + 32) ^ *(int *)(a2 + 40);
    if (v6 >= *(void *)&v5) {
      unint64_t v9 = v6 % *(void *)&v5;
    }
  }

  else
  {
    unint64_t v9 = (*(void *)&v5 - 1LL) & v6;
  }

  unint64_t v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10) {
    return 0LL;
  }
  for (unsigned int i = *v10; i; unsigned int i = *(unsigned __int8 **)i)
  {
    unint64_t v12 = *((void *)i + 1);
    if (v12 == v6)
    {
    }

    else
    {
      if (v8 > 1)
      {
        if (v12 >= *(void *)&v5) {
          v12 %= *(void *)&v5;
        }
      }

      else
      {
        v12 &= *(void *)&v5 - 1LL;
      }

      if (v12 != v9) {
        return 0LL;
      }
    }
  }

  return i;
}

BOOL SwiftFieldKey::operator==(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v2 = a1[23];
  if ((v2 & 0x80u) == 0LL) {
    uint64_t v3 = a1[23];
  }
  else {
    uint64_t v3 = *((void *)a1 + 1);
  }
  uint64_t v4 = a2[23];
  int v5 = (char)v4;
  if ((v4 & 0x80u) != 0LL) {
    uint64_t v4 = *((void *)a2 + 1);
  }
  if (v3 != v4) {
    return 0LL;
  }
  unint64_t v6 = a2;
  if (v5 < 0) {
    a2 = *(unsigned __int8 **)a2;
  }
  if ((v2 & 0x80) != 0)
  {
  }

  else if (a1[23])
  {
    unint64_t v8 = a1;
    while (*v8 == *a2)
    {
      ++v8;
      ++a2;
      if (!--v2) {
        goto LABEL_16;
      }
    }

    return 0LL;
  }

unsigned __int8 *std::__hash_table<std::__hash_value_type<SwiftFieldKey,unsigned int>,std::__unordered_map_hasher<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::hash<SwiftFieldKey>,std::equal_to<SwiftFieldKey>,true>,std::__unordered_map_equal<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::equal_to<SwiftFieldKey>,std::hash<SwiftFieldKey>,true>,std::allocator<std::__hash_value_type<SwiftFieldKey,unsigned int>>>::__emplace_unique_key_args<SwiftFieldKey,std::piecewise_construct_t const&,std::tuple<SwiftFieldKey const&>,std::tuple<>>( uint64_t a1, uint64_t a2, uint64_t a3, __int128 **a4)
{
  unint64_t v8 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)v26, a2) ^ *(unsigned int *)(a2 + 24) ^ *(unsigned int *)(a2 + 28) ^ *(void *)(a2 + 32);
  uint64_t v9 = *(int *)(a2 + 40);
  unint64_t v10 = v8 ^ v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    unint64_t v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v4 = v8 ^ v9;
      if (v10 >= v11) {
        unint64_t v4 = v10 % v11;
      }
    }

    else
    {
      unint64_t v4 = (v11 - 1) & v10;
    }

    char v14 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      for (unsigned int i = *v14; i; unsigned int i = *(unsigned __int8 **)i)
      {
        unint64_t v16 = *((void *)i + 1);
        if (v16 == v10)
        {
        }

        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11) {
              v16 %= v11;
            }
          }

          else
          {
            v16 &= v11 - 1;
          }

          if (v16 != v4) {
            break;
          }
        }
      }
    }
  }

  std::__hash_table<std::__hash_value_type<SwiftFieldKey,unsigned int>,std::__unordered_map_hasher<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::hash<SwiftFieldKey>,std::equal_to<SwiftFieldKey>,true>,std::__unordered_map_equal<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::equal_to<SwiftFieldKey>,std::hash<SwiftFieldKey>,true>,std::allocator<std::__hash_value_type<SwiftFieldKey,unsigned int>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<SwiftFieldKey const&>,std::tuple<>>( a1,  v10,  a4,  (uint64_t)v26);
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v18 = *(float *)(a1 + 32);
  if (!v11 || (float)(v18 * (float)v11) < v17)
  {
    BOOL v19 = 1LL;
    if (v11 >= 3) {
      BOOL v19 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v11);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( a1,  v22);
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11) {
        unint64_t v4 = v10 % v11;
      }
      else {
        unint64_t v4 = v10;
      }
    }

    else
    {
      unint64_t v4 = (v11 - 1) & v10;
    }
  }

  size_t v23 = *(void **)(*(void *)a1 + 8 * v4);
  if (v23)
  {
    *(void *)v26[0] = *v23;
    *size_t v23 = v26[0];
  }

  else
  {
    *(void *)v26[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v26[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v26[0])
    {
      unint64_t v24 = *(void *)(*(void *)v26[0] + 8LL);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v24 >= v11) {
          v24 %= v11;
        }
      }

      else
      {
        v24 &= v11 - 1;
      }

      *(void *)(*(void *)a1 + 8 * v24) = v26[0];
    }
  }

  unsigned int i = (unsigned __int8 *)v26[0];
  ++*(void *)(a1 + 24);
  return i;
}

void sub_18614A4C8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<SwiftFieldKey,unsigned int>,void *>>>::operator()[abi:ne180100]( (uint64_t)&a11,  __p);
  }
  _Unwind_Resume(exception_object);
}

__n128 std::__hash_table<std::__hash_value_type<SwiftFieldKey,unsigned int>,std::__unordered_map_hasher<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::hash<SwiftFieldKey>,std::equal_to<SwiftFieldKey>,true>,std::__unordered_map_equal<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::equal_to<SwiftFieldKey>,std::hash<SwiftFieldKey>,true>,std::allocator<std::__hash_value_type<SwiftFieldKey,unsigned int>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<SwiftFieldKey const&>,std::tuple<>>@<Q0>( uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unint64_t v8 = (char *)operator new(0x48uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + _Block_object_dispose(va, 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  *(void *)unint64_t v8 = 0LL;
  *((void *)v8 + 1) = a2;
  uint64_t v9 = (std::string *)(v8 + 16);
  unint64_t v10 = *a3;
  if (*((char *)v10 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)v10, *((void *)v10 + 1));
  }

  else
  {
    __int128 v11 = *v10;
    *((void *)v8 + 4) = *((void *)v10 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v11;
  }

  __n128 result = *(__n128 *)((char *)v10 + 24);
  *((_DWORD *)v8 + 14) = *((_DWORD *)v10 + 10);
  *(__n128 *)(v8 + 40) = result;
  *((_DWORD *)v8 + 16) = 0;
  *(_BYTE *)(a4 + 16) = 1;
  return result;
}

void sub_18614A588(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0LL;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<SwiftFieldKey,unsigned int>,void *>>>::operator()[abi:ne180100]( v3,  v2);
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<SwiftFieldKey,unsigned int>,void *>>>::operator()[abi:ne180100]( uint64_t a1, void **__p)
{
  if (*(_BYTE *)(a1 + 8))
  {
  }

  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

void std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::clear( uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::__deallocate_node( a1,  *(id **)(a1 + 16));
    *(void *)(a1 + 16) = 0LL;
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      for (uint64_t i = 0LL; i != v2; ++i)
        *(void *)(*(void *)a1 + 8 * i) = 0LL;
    }

    *(void *)(a1 + 24) = 0LL;
  }

void *std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::__emplace_unique_impl<std::pair<VMUMutableClassInfo * {__strong},unsigned int>>( void *a1, uint64_t *a2)
{
  unint64_t v4 = operator new(0x20uLL);
  uint64_t v5 = *a2;
  *a2 = 0LL;
  v4[1] = v5;
  v4[2] = v5;
  *((_DWORD *)v4 + 6) = *((_DWORD *)a2 + 2);
  *unint64_t v4 = 0LL;
  inserted = std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::__node_insert_unique( a1,  v4);
  if ((v7 & 1) == 0)
  {

    operator delete(v4);
  }

  return inserted;
}

void sub_18614A6E8(_Unwind_Exception *a1)
{
}

void *std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::__node_insert_unique( void *a1, void *a2)
{
  uint64_t v2 = a2;
  uint64_t v5 = a2 + 2;
  unint64_t v4 = a2[2];
  *(v5 - 1) = v4;
  unint64_t v6 = std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::__node_insert_unique_prepare[abi:ne180100]( (uint64_t)a1,  v4,  v5);
  if (v6) {
    return v6;
  }
  std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::__node_insert_unique_perform[abi:ne180100]( a1,  v2);
  return v2;
}

void *std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::__node_insert_unique_prepare[abi:ne180100]( uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3)
  {
    uint8x8_t v4 = (uint8x8_t)vcnt_s8((int8x8_t)v3);
    v4.i16[0] = vaddlv_u8(v4);
    if (v4.u32[0] > 1uLL) {
      uint64_t v5 = v3 <= a2 ? a2 % v3 : a2;
    }
    else {
      uint64_t v5 = (v3 - 1) & a2;
    }
    unint64_t v6 = *(void **)(*(void *)a1 + 8 * v5);
    if (v6)
    {
      for (uint64_t i = (void *)*v6; i; uint64_t i = (void *)*i)
      {
        unint64_t v8 = i[1];
        if (v8 == a2)
        {
          if (i[2] == *a3) {
            return i;
          }
        }

        else
        {
          if (v4.u32[0] > 1uLL)
          {
            if (v8 >= v3) {
              v8 %= v3;
            }
          }

          else
          {
            v8 &= v3 - 1;
          }

          if (v8 != v5) {
            break;
          }
        }
      }
    }
  }

  float v9 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v10 = *(float *)(a1 + 32);
  if (!v3 || (float)(v10 * (float)v3) < v9)
  {
    uint64_t v11 = 2 * v3;
    BOOL v12 = v3 < 3 || (v3 & (v3 - 1)) != 0;
    size_t v13 = v12 | v11;
    unint64_t v14 = vcvtps_u32_f32(v9 / v10);
    if (v13 <= v14) {
      size_t v15 = v14;
    }
    else {
      size_t v15 = v13;
    }
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( a1,  v15);
  }

  return 0LL;
}

void *std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::__node_insert_unique_perform[abi:ne180100]( void *result, void *a2)
{
  int8x8_t v2 = (int8x8_t)result[1];
  unint64_t v3 = a2[1];
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    if (v3 >= *(void *)&v2) {
      v3 %= *(void *)&v2;
    }
  }

  else
  {
    v3 &= *(void *)&v2 - 1LL;
  }

  uint64_t v5 = *(void **)(*result + 8 * v3);
  if (v5)
  {
    *a2 = *v5;
LABEL_13:
    *uint64_t v5 = a2;
    goto LABEL_14;
  }

  *a2 = result[2];
  result[2] = a2;
  *(void *)(*result + 8 * v3) = result + 2;
  if (*a2)
  {
    unint64_t v6 = *(void *)(*a2 + 8LL);
    if (v4.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v2) {
        v6 %= *(void *)&v2;
      }
    }

    else
    {
      v6 &= *(void *)&v2 - 1LL;
    }

    uint64_t v5 = (void *)(*result + 8 * v6);
    goto LABEL_13;
  }

uint64_t std::__hash_table<std::__hash_value_type<SwiftFieldKey,unsigned int>,std::__unordered_map_hasher<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::hash<SwiftFieldKey>,std::equal_to<SwiftFieldKey>,true>,std::__unordered_map_equal<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::equal_to<SwiftFieldKey>,std::hash<SwiftFieldKey>,true>,std::allocator<std::__hash_value_type<SwiftFieldKey,unsigned int>>>::~__hash_table( uint64_t a1)
{
  int8x8_t v2 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<SwiftFieldKey,unsigned int>,std::__unordered_map_hasher<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::hash<SwiftFieldKey>,std::equal_to<SwiftFieldKey>,true>,std::__unordered_map_equal<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::equal_to<SwiftFieldKey>,std::hash<SwiftFieldKey>,true>,std::allocator<std::__hash_value_type<SwiftFieldKey,unsigned int>>>::__deallocate_node( int a1, void **__p)
{
  if (__p)
  {
    int8x8_t v2 = __p;
    do
    {
      unint64_t v3 = (void **)*v2;
      operator delete(v2);
      int8x8_t v2 = v3;
    }

    while (v3);
  }

id descriptionForTypeEncoding(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v5 = 0LL;
  unint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  unint64_t v8 = __Block_byref_object_copy__8;
  float v9 = __Block_byref_object_dispose__8;
  id v10 = 0LL;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __descriptionForTypeEncoding_block_invoke;
  v4[3] = &unk_189E001E0;
  v4[4] = &v5;
  v4[5] = a2;
  _parse_type(a1, 1, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void sub_18614AA50( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void _parse_type(unsigned __int8 *a1, int a2, void *a3)
{
  id v35 = a3;
  if (a2)
  {
    [MEMORY[0x189607940] string];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a1) {
      goto LABEL_128;
    }
  }

  else
  {
    uint64_t v5 = 0LL;
    if (!a1) {
      goto LABEL_128;
    }
  }

  unsigned __int8 v6 = *a1;
  if (*a1)
  {
    int v7 = 0;
    unint64_t v8 = 0LL;
    int v9 = 1;
    while (1)
    {
      if (v6 > 0x5Au)
      {
        if (v6 == 91)
        {
          if (!v8 && a2)
          {
            [MEMORY[0x189607940] string];
            unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
          }

          unint64_t v16 = a1 + 1;
          int v17 = a1[1];
          if ((v17 - 48) > 9)
          {
            int v18 = 0;
            BOOL v19 = a1 + 1;
            if (a2) {
              goto LABEL_40;
            }
          }

          else
          {
            int v18 = 0;
            BOOL v19 = a1 + 1;
            do
            {
              int v18 = v17 + 10 * v18 - 48;
              int v20 = *++v19;
              int v17 = v20;
            }

            while ((v20 - 48) < 0xA);
            if (a2) {
LABEL_40:
            }
              [v8 appendFormat:@"[%.*s]", v19 - v16, v16];
          }

          a1 = v19 - 1;
          v9 *= v18;
          goto LABEL_71;
        }

        if (v6 != 123) {
          goto LABEL_42;
        }
      }

      else if (v6 != 40)
      {
        if (v6 == 64)
        {
          int v10 = a1[1];
          if (v10 == 34)
          {
            uint64_t v24 = 0LL;
            uint64_t v25 = a1 + 2;
            int v26 = a1[2];
            int v27 = v26;
            if (a1[2])
            {
              do
              {
                if (v27 == 34) {
                  break;
                }
                int v27 = a1[v24++ + 3];
              }

              while (v27);
            }

            a1 += v24 + 2;
            if (a2)
            {
              BOOL v28 = v26 == 60;
              id v29 = "";
              unsigned int v30 = "id ";
              if (!v28)
              {
                unsigned int v30 = "";
                id v29 = "*";
              }

              [v5 appendFormat:@"%s%.*s%s", v30, v24, v25, v29];
            }
          }

          else if (v10 == 63)
          {
            if (a2) {
              [v5 appendString:@"id?"];
            }
            ++a1;
          }

          else if (a2)
          {
            [v5 appendString:@"id"];
          }

          goto LABEL_71;
        }

void __descriptionForTypeEncoding_block_invoke( uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6)
{
  id v15 = a4;
  int v9 = a5;
  if (a6)
  {
    NSLog(@"error: '%@' for ivar: %s", a6, *(void *)(a1 + 40));
  }

  else
  {
    id v10 = objc_alloc(NSString);
    uint64_t v11 = &stru_189E010C8;
    if (v9) {
      uint64_t v11 = v9;
    }
    uint64_t v12 = [v10 initWithFormat:@"%@ %s%@", v15, *(void *)(a1 + 40), v11];
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8LL);
    int v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
}

uint64_t typeEncodingDescribesReferencedAllocation(uint64_t result)
{
  if (result)
  {
    int v1 = *(unsigned __int8 *)result;
    if (!*(_BYTE *)result) {
      return 0LL;
    }
    if ((v1 == 114 || v1 == 65) && (int v1 = *(unsigned __int8 *)(result + 1), !*(_BYTE *)(result + 1)))
    {
      return 0LL;
    }

    else
    {
      unsigned int v2 = v1 - 64;
      BOOL v3 = v2 > 0x31;
      unint64_t v4 = (0x1EFFFFFFFFFFEuLL >> v2) & 1;
      if (v3) {
        return 1LL;
      }
      else {
        return v4;
      }
    }
  }

  return result;
}

id descriptionForTypeOfReferencedAllocation(const char *a1, _DWORD *a2)
{
  if (a1)
  {
    unsigned int v2 = a1;
    int v3 = *(unsigned __int8 *)a1;
    if (*a1)
    {
      if (v3 != 114 && (int v5 = *(unsigned __int8 *)a1, v3 != 65) || (int v5 = *((unsigned __int8 *)a1 + 1), a1[1]))
      {
        unsigned int v6 = v5 - 64;
        BOOL v7 = v6 > 0x31;
        uint64_t v8 = (1LL << v6) & 0x2100000000001LL;
        if (v7 || v8 == 0)
        {
          if (v3 == 114 || v3 == 65) {
            unsigned int v2 = a1 + 1;
          }
          uint64_t v12 = (void *)objc_opt_new();
          *a2 = 16;
          if (*v2 == 94)
          {
            do
            {
              uint64_t v13 = v2;
              int v14 = *(unsigned __int8 *)++v2;
              if (v14 != 94) {
                break;
              }
              [v12 appendString:@"[]"];
              uint64_t v13 = v2;
            }

            while (*v2 == 94);
          }

          else
          {
            uint64_t v13 = v2;
          }

          id v15 = (void *)[objc_alloc(NSString) initWithBytesNoCopy:v13 length:strlen(v13) encoding:4 freeWhenDone:0];
          unsigned int v16 = *(unsigned __int8 *)v13;
          if (v16 <= 0x50)
          {
            if (*(unsigned __int8 *)v13 <= 0x29u)
            {
              if (v16 != 35)
              {
                if (v16 != 40) {
                  goto LABEL_81;
                }
LABEL_28:
                [v12 setString:&stru_189E010C8];
LABEL_29:
                int v17 = @"malloc";
                goto LABEL_82;
              }

              int v17 = @"Class";
LABEL_82:
              -[__CFString stringByAppendingString:](v17, "stringByAppendingString:", v12);
              id v10 = (void *)objc_claimAutoreleasedReturnValue();

              return v10;
            }

            if (v16 == 42)
            {
LABEL_65:
              int v17 = @"char[]";
              goto LABEL_82;
            }

            if (v16 == 58)
            {
              int v17 = @"SEL";
              goto LABEL_82;
            }

            goto LABEL_81;
          }

          if (*(unsigned __int8 *)v13 <= 0x5Du)
          {
            if (v16 != 81 && v16 != 91) {
              goto LABEL_81;
            }
            goto LABEL_28;
          }

          if (v16 == 123)
          {
            if (!strncmp(v13, "{vector<", 8uLL)
              || !strncmp(v13, "{shared_ptr<", 0xCuLL)
              || !strncmp(v13, "{unique_ptr<", 0xCuLL))
            {
              unint64_t v21 = strchr(v13, 44);
              if (v21 || (unint64_t v21 = strchr(v13, 62)) != 0LL)
              {
                [v15 substringWithRange:1, &v21[~(unint64_t)v13]];
                size_t v22 = (void *)objc_claimAutoreleasedReturnValue();
                [v22 stringByAppendingString:@">"];
                int v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }

              else
              {
                [v15 substringWithRange:1, &strchr(v13, 60)[~(unint64_t)v13]];
                int v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }

              *a2 = 2;
              goto LABEL_82;
            }

            if (!strncmp(v13, "{unordered_map<", 0x10uLL))
            {
              uint64_t v25 = (void *)[objc_alloc(MEMORY[0x189607A08]) initWithString:v15];
              [v25 setScanLocation:1];
              id v34 = 0LL;
              int v26 = [v25 scanUpToString:@"," intoString:&v34];
              id v27 = v34;
              id v28 = 0LL;
              id v29 = 0LL;
              if (v26)
              {
                [v25 setScanLocation:[v25 scanLocation] + 1];
                id v33 = 0LL;
                int v30 = [v25 scanUpToString:@"," intoString:&v33];
                id v28 = v33;
                if (v30)
                {
                  [NSString stringWithFormat:@"%@,%@>", v27, v28];
                  id v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
                }

                else
                {
                  id v29 = 0LL;
                }
              }

              int v31 = @"unordered_map";
              if (v29) {
                int v31 = v29;
              }
              int v17 = v31;
              *a2 = 2;

              goto LABEL_82;
            }
          }

          else
          {
            if (v16 != 94) {
              goto LABEL_81;
            }
            int v18 = v13[1];
            if (!v13[1]) {
              goto LABEL_81;
            }
            int v19 = *((unsigned __int8 *)v13 + 2);
            if (!v13[2])
            {
              if (v18 > 80)
              {
                switch(v13[1])
                {
                  case 'c':
                    goto LABEL_65;
                  case 'd':
                    int v17 = @"double[]";
                    goto LABEL_82;
                  case 'e':
                  case 'g':
                  case 'h':
                  case 'j':
                  case 'k':
                  case 'm':
                  case 'n':
                  case 'o':
                  case 'p':
                  case 'r':
                  case 't':
                  case 'u':
                    goto LABEL_81;
                  case 'f':
                    int v17 = @"float[]";
                    goto LABEL_82;
                  case 'i':
                    int v17 = @"int32_t[]";
                    goto LABEL_82;
                  case 'l':
                    int v17 = @"long[]";
                    goto LABEL_82;
                  case 'q':
                    int v17 = @"int64_t[]";
                    goto LABEL_82;
                  case 's':
                    int v17 = @"short[]";
                    goto LABEL_82;
                  case 'v':
                    goto LABEL_29;
                  default:
                    if (v18 == 81)
                    {
                      int v17 = @"uint64_t[]";
                    }

                    else
                    {
                      if (v18 != 83) {
                        goto LABEL_81;
                      }
                      int v17 = @"ushort[]";
                    }

                    break;
                }

                goto LABEL_82;
              }

              if (v18 > 57)
              {
                int v17 = @"id[]";
                switch(v18)
                {
                  case ':':
                    int v17 = @"SEL[]";
                    goto LABEL_82;
                  case ';':
                  case '<':
                  case '=':
                  case '>':
                  case '?':
                  case 'A':
                    goto LABEL_81;
                  case '@':
                    goto LABEL_82;
                  case 'B':
                    int v17 = @"BOOL[]";
                    goto LABEL_82;
                  case 'C':
                    int v17 = @"uchar[]";
                    goto LABEL_82;
                  default:
                    if (v18 == 73)
                    {
                      int v17 = @"uint32_t[]";
                    }

                    else
                    {
                      if (v18 != 76) {
                        goto LABEL_81;
                      }
                      int v17 = @"ulong[]";
                    }

                    break;
                }

                goto LABEL_82;
              }

              if (v18 == 35)
              {
                int v17 = @"Class[]";
                goto LABEL_82;
              }

              if (v18 != 42) {
                goto LABEL_81;
              }
              int v17 = @"char*[]";
              goto LABEL_82;
            }

            if (v18 == 64)
            {
              if (v19 == 34)
              {
                [NSString stringWithUTF8String:v13 + 3];
                size_t v23 = (void *)objc_claimAutoreleasedReturnValue();
                if ([v23 hasSuffix:@""])
                {
                  uint64_t v24 = [v23 substringToIndex:[v23 length] - 1];

                  size_t v23 = (void *)v24;
                }

                if ([v23 length])
                {
                  [v23 stringByAppendingString:@"*[]"];
                  int v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
                }

                else
                {
                  int v17 = 0LL;
                }

                goto LABEL_82;
              }

              goto LABEL_81;
            }

            if (v13[1] != 123)
            {
LABEL_81:
              int v17 = 0LL;
              goto LABEL_82;
            }

            if (v19 != 63)
            {
              int v20 = strchr(v13, 61);
              if (v20 || (int v20 = strchr(v13, 125)) != 0LL)
              {
                [v15 substringWithRange:2, v20 - v13 - 2];
                int v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
                if (-[__CFString length](v17, "length"))
                {
                  if (-[__CFString isEqualToString:](v17, "isEqualToString:", @"__CFString"))
                  {

                    int v17 = @"CFString";
                    goto LABEL_82;
                  }

                  uint64_t v32 = [NSString stringWithFormat:@"struct %@", v17];

                  int v17 = (__CFString *)v32;
                }

                if (v17) {
                  goto LABEL_82;
                }
              }
            }
          }

          [v12 setString:&stru_189E010C8];
          int v17 = @"struct";
          goto LABEL_82;
        }
      }
    }
  }

  id v10 = 0LL;
  return v10;
}

id descriptionOfValueAtAddressWithTypeEncoding(uint64_t a1, unsigned __int8 *a2, int a3, void *a4)
{
  id v7 = a4;
  uint64_t v8 = v7;
  id v9 = 0LL;
  if (a1 && a2)
  {
    uint64_t v17 = 0LL;
    int v18 = &v17;
    uint64_t v19 = 0x3032000000LL;
    int v20 = __Block_byref_object_copy__8;
    unint64_t v21 = __Block_byref_object_dispose__8;
    id v22 = 0LL;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __descriptionOfValueAtAddressWithTypeEncoding_block_invoke;
    void v11[3] = &unk_189E00208;
    uint64_t v13 = &v17;
    uint64_t v14 = a1;
    id v12 = v7;
    id v15 = a2;
    int v16 = a3;
    _parse_type(a2, 0, v11);
    id v9 = (id)v18[5];

    _Block_object_dispose(&v17, 8);
  }

  return v9;
}

void sub_18614B92C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void __descriptionOfValueAtAddressWithTypeEncoding_block_invoke( uint64_t a1, int a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12) {
    goto LABEL_96;
  }
  if (a2 <= 82)
  {
    if (a2 > 57)
    {
      switch(a2)
      {
        case '?':
        case '@':
          goto LABEL_15;
        case 'A':
        case 'D':
        case 'E':
        case 'F':
        case 'G':
        case 'H':
        case 'J':
        case 'K':
          goto LABEL_35;
        case 'B':
          if (**(_BYTE **)(a1 + 48)) {
            uint64_t v13 = "YES";
          }
          else {
            uint64_t v13 = "NO";
          }
          [MEMORY[0x189NSStringormat:@"%s", v13, v80, v81, v82];
          goto LABEL_93;
        case 'C':
          [MEMORY[0x1896NSStringrmat:@"%u %c" v81, v82];
          goto LABEL_93;
        case 'I':
          BOOL v64 = (void *)NSString;
          uint64_t v65 = **(unsigned int **)(a1 + 48);
          goto LABEL_88;
        case 'L':
          [MEMORY[0x189NSStringormat:@"%lu", **(void **)(a1 + 48), v80, v81, v82];
          goto LABEL_93;
        default:
          if (a2 == 58)
          {
            mach_vm_address_t v66 = task_peek_string([*(id *)(a1 + 32) task], **(void **)(a1 + 48));
            if (!v66) {
              goto LABEL_96;
            }
            [MEMORY[0x189NSStringormat:@"@selector(%s)" v66, v80, v81, v82];
          }

          else
          {
            if (a2 != 81) {
              goto LABEL_35;
            }
            [MEMORY[0x189NSStringormat:@"%llu", **(void **)(a1 + 48), v80, v81, v82];
          }

          break;
      }

      goto LABEL_93;
    }

    if (a2 != 35)
    {
      if (a2 == 40)
      {
        printf("    UNION TYPE ENCODING: %s\n", *(const char **)(a1 + 56));
      }

      else if (a2 == 42)
      {
LABEL_15:
        uint64_t v14 = **(void **)(a1 + 48);
        if (v14)
        {
          [*(id *)(a1 + 32) objectIdentifier];
          id v15 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v16 = [v15 taggedPointerMask];

          if ((v16 & v14) != 0)
          {
            [*(id *)(a1 + 32) objectIdentifier];
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v18 = [v17 labelForTaggedPointer:v14];
            uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8LL);
            int v20 = *(void **)(v19 + 40);
            *(void *)(v19 + 40) = v18;

            if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
            {
              uint64_t v21 = [NSString stringWithFormat:@"tagged pointer %@", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
              uint64_t v22 = *(void *)(*(void *)(a1 + 40) + 8LL);
              size_t v23 = *(void **)(v22 + 40);
              *(void *)(v22 + 40) = v21;
            }
          }

          if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
          {
            [*(id *)(a1 + 32) objectIdentifier];
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
            [v24 classInfoForObjectWithRange:v14];
            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();

            [v25 className];
            int v26 = (void *)objc_claimAutoreleasedReturnValue();

            id v27 = (void *)NSString;
            if (v26)
            {
              [v25 className];
              id v28 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v29 = [v27 stringWithFormat:@"<%@ %p>", v28, v14];
              uint64_t v30 = *(void *)(*(void *)(a1 + 40) + 8LL);
              int v31 = *(void **)(v30 + 40);
              *(void *)(v30 + 40) = v29;
            }

            else
            {
              uint64_t v68 = [MEMORY[0x189NSStringormat:@"%p" v14];
              uint64_t v69 = *(void *)(*(void *)(a1 + 40) + 8LL);
              id v28 = *(void **)(v69 + 40);
              *(void *)(v69 + 40) = v68;
            }

            [*(id *)(a1 + 32) objectIdentifier];
            CFUUIDRef v70 = (void *)objc_claimAutoreleasedReturnValue();
            [v70 labelForMallocBlock:v14, 1024];
            CFUUIDRef v71 = (void *)objc_claimAutoreleasedReturnValue();

            if (v71)
            {
              uint64_t v72 = [NSString stringWithFormat:@"%@ %@", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v71];
              uint64_t v73 = *(void *)(*(void *)(a1 + 40) + 8LL);
              uint64_t v74 = *(void **)(v73 + 40);
              *(void *)(v73 + 40) = v72;
            }
          }

          goto LABEL_96;
        }

        goto LABEL_31;
      }

LABEL_96:
}

uint64_t pointerScanSizeForTypeEncoding(unsigned __int8 *a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4 = a2;
  if (a1)
  {
    uint64_t v11 = 0LL;
    id v12 = &v11;
    uint64_t v13 = 0x2020000000LL;
    int v14 = a2;
    if ((a2 & 0x80000000) != 0
      || ((uint64_t v5 = 0LL, a2 < 8) ? (v6 = a3) : (v6 = 0), a2 >= 4 && (v6 & 1) == 0))
    {
      v9[0] = MEMORY[0x1895F87A8];
      v9[1] = 3221225472LL;
      v9[2] = __pointerScanSizeForTypeEncoding_block_invoke;
      v9[3] = &unk_189E00230;
      v9[4] = &v11;
      v9[5] = a4;
      char v10 = a3;
      _parse_type(a1, 0, v9);
      int v7 = *((_DWORD *)v12 + 6);
      else {
        uint64_t v5 = v7;
      }
    }

    _Block_object_dispose(&v11, 8);
    return v5;
  }

  return v4;
}

void sub_18614C3B4(_Unwind_Exception *a1)
{
}

uint64_t __pointerScanSizeForTypeEncoding_block_invoke( uint64_t result, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a6) {
    return result;
  }
  char v6 = *(_BYTE **)(result + 40);
  if (v6) {
    *char v6 = a2;
  }
  int v7 = 0;
  if (a2 <= 80)
  {
    if (a2 <= 65)
    {
      if (a2 > 57)
      {
        if (a2 != 58 && a2 != 64) {
          return result;
        }
      }

      else if (a2 != 35 && a2 != 42)
      {
        return result;
      }

      goto LABEL_22;
    }

    if ((a2 - 66) >= 2)
    {
      if (a2 != 73)
      {
        if (a2 != 76) {
          return result;
        }
LABEL_22:
        if (*(_BYTE *)(result + 48)) {
          char v9 = 3;
        }
        else {
          char v9 = 2;
        }
        int v7 = a3 << v9;
        goto LABEL_35;
      }

uint64_t getStructureLayoutDescription(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4 = a4;
  CSSymbolOwnerGetSymbolWithName();
  if ((CSIsNull() & 1) != 0)
  {
    uint64_t v5 = 0LL;
  }

  else
  {
    uint64_t Range = CSSymbolGetRange();
    uint64_t v5 = v4[2](v4, Range, v7);
  }

  return v5;
}

uint64_t VMUGetFlagsForAllVMRegionStatistics()
{
  return 2076LL;
}

uint64_t memorySizeString(unint64_t a1)
{
  if (a1)
  {
    double v1 = (double)a1 * 0.0009765625;
    if (v1 >= 4.0)
    {
      if (v1 >= 10000.0)
      {
        double v3 = v1 * 0.0009765625;
        if (v3 >= 1000.0)
        {
          double v4 = v3 * 0.0009765625;
          if (v4 >= 1000.0) {
            [MEMORY[0x189NSStringormat:@"%.1fT" v4 * 0.0009765625];
          }
          else {
            [MEMORY[0x189NSStringormat:@"%.1fG" v4];
          }
        }

        else
        {
          [MEMORY[0x189NSStringormat:@"%.1fM" v3];
        }
      }

      else
      {
        [MEMORY[0x189NSStringormat:@"%.0fK" v1];
      }
    }

    else
    {
      [MEMORY[0x189NSStringormat:@"%lu" a1];
    }

    unsigned int v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    unsigned int v2 = @"0K";
  }

  uint64_t v5 = v2;
  uint64_t v6 = -[__CFString UTF8String](v5, "UTF8String");

  return v6;
}

uint64_t pageCountString(unint64_t a1, unsigned int a2, char a3)
{
  if (a2 < 2) {
    return memorySizeString(a1);
  }
  if ((a3 & 1) != 0)
  {
    if (a1 % a2) {
      [NSString stringWithFormat:@"%.2f", (double)a1 / (double)a2];
    }
    else {
      [MEMORY[0x189NSStringormat:@"%llu   "];
    }
  }

  else
  {
    [MEMORY[0x189NSStringormat:@"%llu" a1 / a2];
  }
  id v4 = ;
  uint64_t v5 = [v4 UTF8String];

  return v5;
}

uint64_t sameString(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  if (v3 == v4)
  {
    uint64_t v6 = 1LL;
  }

  else
  {
    uint64_t v6 = 0LL;
    if (v3 && v4) {
      uint64_t v6 = [v3 isEqualToString:v4];
    }
  }

  return v6;
}

const char *VMUVMRegionShareModeName(int a1)
{
  else {
    return off_189E00290[(char)(a1 - 1)];
  }
}

uint64_t VMUPurgeableDisplayCharacter(unsigned int a1)
{
  unsigned int v1 = 0x5845564Eu >> (8 * a1);
  if (a1 >= 4) {
    LOBYTE(std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<NSString * {__strong},unsigned int>,void *>>>::operator()[abi:ne180100]( v2, v1) = 63;
  }
  return v1 & 0x7F;
}

uint64_t VMUSortIndexForLibraryPath(void *a1)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  if ([v1 length])
  {
    unsigned int v2 = (void *)MEMORY[0x186E32E40]();
    id v3 = v1;
    id v4 = (char *)[v3 UTF8String];
    if ((_isApplicationUI__tried & 1) == 0)
    {
      if (!regcomp(&_isApplicationUI__localPreg, "/(AppKit|UIKit(Core))\\.framework|/libswiftAppKit.dylib", 5)) {
        _isApplicationUI__createdSuccessfully = 1;
      }
      _isApplicationUI__tried = 1;
    }

    if (_isApplicationUI__createdSuccessfully == 1 && !regexec(&_isApplicationUI__localPreg, v4, 0LL, 0LL, 0))
    {
      uint64_t v5 = 1LL;
    }

    else
    {
      if ((_isFoundation__tried & 1) == 0)
      {
        if (!regcomp(&_isFoundation__localPreg, "/Foundation.framework|/libswiftFoundation.dylib", 5)) {
          _isFoundation__createdSuccessfully = 1;
        }
        _isFoundation__tried = 1;
      }

      if (_isFoundation__createdSuccessfully == 1 && !regexec(&_isFoundation__localPreg, v4, 0LL, 0LL, 0))
      {
        uint64_t v5 = 2LL;
      }

      else
      {
        if ((_isCoreFoundation__tried & 1) == 0)
        {
          if (!regcomp(&_isCoreFoundation__localPreg, "/CoreFoundation.framework", 5)) {
            _isCoreFoundation__createdSuccessfully = 1;
          }
          _isCoreFoundation__tried = 1;
        }

        if (_isCoreFoundation__createdSuccessfully == 1 && !regexec(&_isCoreFoundation__localPreg, v4, 0LL, 0LL, 0))
        {
          uint64_t v5 = 3LL;
        }

        else
        {
          if ((_isDatabase__tried & 1) == 0)
          {
            if (!regcomp( &_isDatabase__localPreg,  "/CoreData\\.framework/|/libsql[^/]*\\.dylib|/libswiftCoreData.dylib",  5)) {
              _isDatabase__createdSuccessfully = 1;
            }
            _isDatabase__tried = 1;
          }

          if (_isDatabase__createdSuccessfully == 1 && !regexec(&_isDatabase__localPreg, v4, 0LL, 0LL, 0))
          {
            uint64_t v5 = 4LL;
          }

          else if (_isWeb(v4))
          {
            uint64_t v5 = 5LL;
          }

          else if (_isNetworkIO(v4))
          {
            uint64_t v5 = 6LL;
          }

          else if (_isGraphics(v4))
          {
            uint64_t v5 = 7LL;
          }

          else if (_isAudio(v4))
          {
            uint64_t v5 = 8LL;
          }

          else if (_isSecurity(v4))
          {
            uint64_t v5 = 9LL;
          }

          else if (_isLanguage(v4))
          {
            uint64_t v5 = 10LL;
          }

          else if (_isSystem(v4))
          {
            uint64_t v5 = 11LL;
          }

          else if (_isFramework(v4))
          {
            uint64_t v5 = 12LL;
          }

          else
          {
            __int128 v15 = 0u;
            __int128 v16 = 0u;
            __int128 v13 = 0u;
            __int128 v14 = 0u;
            uint64_t v6 = [&unk_189E1D108 countByEnumeratingWithState:&v13 objects:v17 count:16];
            if (v6)
            {
              uint64_t v7 = v6;
              uint64_t v8 = *(void *)v14;
              int v9 = 12;
              while (2)
              {
                uint64_t v10 = 0LL;
                int v11 = v9;
                v9 += v7;
                do
                {
                  if (*(void *)v14 != v8) {
                    objc_enumerationMutation(&unk_189E1D108);
                  }
                  if ([v3 hasPrefix:*(void *)(*((void *)&v13 + 1) + 8 * v10)])
                  {
                    uint64_t v5 = (v11 + v10 + 1);
                    goto LABEL_57;
                  }

                  ++v10;
                }

                while (v7 != v10);
                uint64_t v7 = [&unk_189E1D108 countByEnumeratingWithState:&v13 objects:v17 count:16];
                if (v7) {
                  continue;
                }
                break;
              }
            }

            uint64_t v5 = 0LL;
          }
        }
      }
    }

BOOL _isWeb(char *a1)
{
  if ((_isWeb__tried & 1) == 0)
  {
    if (!regcomp(&_isWeb__localPreg, "/(Web(Kit|Core)|JavaScriptCore)\\.framework/", 5)) {
      _isWeb__createdSuccessfully = 1;
    }
    _isWeb__tried = 1;
  }

  return _isWeb__createdSuccessfully == 1 && regexec(&_isWeb__localPreg, a1, 0LL, 0LL, 0) == 0;
}

BOOL _isNetworkIO(char *a1)
{
  if ((_isNetworkIO__tried & 1) == 0)
  {
    if (!regcomp(&_isNetworkIO__localPreg, "/(CFNetwork|IO)\\.framework/", 5)) {
      _isNetworkIO__createdSuccessfully = 1;
    }
    _isNetworkIO__tried = 1;
  }

  return _isNetworkIO__createdSuccessfully == 1 && regexec(&_isNetworkIO__localPreg, a1, 0LL, 0LL, 0) == 0;
}

BOOL _isGraphics(char *a1)
{
  if ((_isGraphics__tried & 1) == 0)
  {
    if (!regcomp( &_isGraphics__localPreg,  "/(Core(Text|UI|Graphics|Video|Image|Media(IOServices)?|PDF)|ATS|ColorSync|ImageIO|Metal(Kit)?|OpenGL|Quartz( Core)?|QTKit|VideoToolbox|OpenCL|QD|IOSurface)\\.framework|/libswiftCore(Graphics|Image).dylib",  5)) {
      _isGraphics__createdSuccessfully = 1;
    }
    _isGraphics__tried = 1;
  }

  return _isGraphics__createdSuccessfully == 1 && regexec(&_isGraphics__localPreg, a1, 0LL, 0LL, 0) == 0;
}

BOOL _isAudio(char *a1)
{
  if ((_isAudio__tried & 1) == 0)
  {
    if (!regcomp( &_isAudio__localPreg,  "/(Speech[^/]*\\.framework|[^/]*(A|a)udio[^/]*\\.(framework|component|bundle|kext)|AppleHDA.kext)/",  5)) {
      _isAudio__createdSuccessfully = 1;
    }
    _isAudio__tried = 1;
  }

  return _isAudio__createdSuccessfully == 1 && regexec(&_isAudio__localPreg, a1, 0LL, 0LL, 0) == 0;
}

BOOL _isSecurity(char *a1)
{
  if ((_isSecurity__tried & 1) == 0)
  {
    if (!regcomp( &_isSecurity__localPreg,  "/(Security(Foundation|Interface|HI)?|Kerberos(Helper)?|TrustEvaluationAgent)\\.framework/|/lib(crypto|ssl|sa sl2)[^/]*\\.dylib|/sasl2/",  5)) {
      _isSecurity__createdSuccessfully = 1;
    }
    _isSecurity__tried = 1;
  }

  return _isSecurity__createdSuccessfully == 1 && regexec(&_isSecurity__localPreg, a1, 0LL, 0LL, 0) == 0;
}

BOOL _isLanguage(char *a1)
{
  if ((_isLanguage__tried & 1) == 0)
  {
    if (!regcomp( &_isLanguage__localPreg,  "/(JavaVM|Ruby|Python|Tcl|Tk)\\.framework/|/ruby/|/lib(tcl|tk|python|perl|swiftCore|swiftObjectiveC|c\\+\\+abi)[^/]*\\.dylib",  5)) {
      _isLanguage__createdSuccessfully = 1;
    }
    _isLanguage__tried = 1;
  }

  return _isLanguage__createdSuccessfully == 1 && regexec(&_isLanguage__localPreg, a1, 0LL, 0LL, 0) == 0;
}

BOOL _isSystem(char *a1)
{
  if ((_isSystem__tried & 1) == 0)
  {
    if (!regcomp( &_isSystem__localPreg,  "/usr/lib/((lib[^/]*\\.dylib)|dyld|system)|/libswift(Darwin|Dispatch).dylib",  5)) {
      _isSystem__createdSuccessfully = 1;
    }
    _isSystem__tried = 1;
  }

  return _isSystem__createdSuccessfully == 1 && regexec(&_isSystem__localPreg, a1, 0LL, 0LL, 0) == 0;
}

BOOL _isFramework(char *a1)
{
  if ((_isFramework__tried & 1) == 0)
  {
    if (!regcomp(&_isFramework__localPreg, "/System/Library/(Private)?Frameworks/[^/]*\\.framework/", 5)) {
      _isFramework__createdSuccessfully = 1;
    }
    _isFramework__tried = 1;
  }

  return _isFramework__createdSuccessfully == 1 && regexec(&_isFramework__localPreg, a1, 0LL, 0LL, 0) == 0;
}

void sub_186150D44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

id visit(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)a1) {
    id v4 = objc_alloc_init(MEMORY[0x189603FA8]);
  }
  else {
    id v4 = 0LL;
  }
  for (uint64_t i = *(unsigned int *)(*(void *)(a1 + 32) + 4LL * a2);
        (_DWORD)i != -1;
        uint64_t i = *(unsigned int *)(*(void *)(a1 + 40) + 4LL * i))
  {
    uint64_t v6 = visit(a1, i);
    if (!v6)
    {
      int v11 = 0LL;
      goto LABEL_19;
    }

    uint64_t v7 = (void *)v6;
    if (v4) {
      [v4 addObject:v6];
    }
  }

  (*(void (**)(uint64_t *__return_ptr, void, char *, uint64_t))(a1 + 56))( &v14,  *(void *)(a1 + 16),  sel_nodeDetails_,  a2);
  if (v15 >> 60 == 5 || v15 >> 60 == 2)
  {
    int v9 = *(void **)(a1 + 8);
    [MEMORY[0x189607968] numberWithUnsignedLongLong:v14];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 objectForKey:v10];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      [*(id *)(a1 + 24) nonSubmapRegionContainingAddress:v14];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    id v12 = 0LL;
  }

  (*(void (**)(void, char *, uint64_t))(a1 + 64))(*(void *)(a1 + 16), sel_stackIDForNode_, a2);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))(*(void *)(a1 + 48));
  int v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
  return v11;
}

void __destructor_8_s8_s16_s24_sb48(id *a1)
{
}

void sub_186151498(_Unwind_Exception *a1)
{
}

void sub_186151CEC(_Unwind_Exception *a1)
{
}

void sub_186153FB0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
}

void sub_186154774( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
}

id VMUDirectedGraphErrorWithExtraUserInfo( unsigned int a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11 = a2;
  id v12 = a3;
  if (v12) {
    __int128 v13 = (void *)[objc_alloc(NSString) initWithFormat:v12 arguments:&a9];
  }
  else {
    __int128 v13 = 0LL;
  }
  uint64_t v14 = (void *)objc_opt_new();
  [v14 setObject:v13 forKeyedSubscript:*MEMORY[0x1896075E0]];
  if (v11) {
    [v14 addEntriesFromDictionary:v11];
  }
  [MEMORY[0x189607870] errorWithDomain:@"VMUDirectedGraphDomain" code:a1 userInfo:v14];
  unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void sub_1861555C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t nsfilehandle_write(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = (void *)MEMORY[0x189603F48];
  id v8 = a1;
  [v7 dataWithBytesNoCopy:a2 length:a3 freeWhenDone:0];
  int v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v8 writeData:v9 error:a4];

  return v10;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void sub_18615783C(_Unwind_Exception *a1)
{
}

void __VMUCompressedBuffer_block_invoke(void *a1, uint64_t a2, int a3, void *a4)
{
  uint64_t v6 = (void *)MEMORY[0x189603FB8];
  uint64_t v7 = a2 + 16;
  id v8 = a4;
  id v14 = [v6 dataWithLength:v7];
  uint64_t v9 = v8[2](v8, [v14 mutableBytes] + 16);

  if (v9)
  {
    [v14 setLength:v9 + 16];
    id v10 = v14;
    id v11 = (_DWORD *)[v10 mutableBytes];
    uint64_t v12 = a1[6];
    int v13 = a3 | (*(_DWORD *)(*(void *)(a1[4] + 8LL) + 24LL) << 16);
    *id v11 = 16;
    v11[1] = v9;
    v11[2] = v12;
    void v11[3] = v13;
    objc_storeStrong((id *)(*(void *)(a1[5] + 8LL) + 40LL), v10);
  }

  else
  {
    [v14 setLength:0];
  }
}

uint64_t __VMUCompressedBuffer_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 56LL) = a2;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 64LL) = v3;
  uint64_t v4 = deflate((z_streamp)(*(void *)(*(void *)(a1 + 32) + 8LL) + 32LL), 4);
  deflateEnd((z_streamp)(*(void *)(*(void *)(a1 + 32) + 8LL) + 32LL));
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if ((_DWORD)v4 == 1) {
    return *(void *)(v5 + 72);
  }
  NSLog(@"Unable to compress data: %d (%s)", v4, *(void *)(v5 + 80));
  return 0LL;
}

uint8_t *__VMUCompressedBuffer_block_invoke_3(void *a1, uint8_t *a2)
{
  uint64_t v3 = (const uint8_t *)a1[4];
  size_t v4 = a1[5];
  size_t v5 = a1[6];
  if (compression_stream_init(&stream, COMPRESSION_STREAM_ENCODE, COMPRESSION_LZFSE) == COMPRESSION_STATUS_ERROR)
  {
    NSLog(@"Unable to initialize compression stream.");
    return 0LL;
  }

  stream.src_ptr = v3;
  stream.src_mach_vm_size_t size = v4;
  stream.dst_ptr = a2;
  stream.dst_mach_vm_size_t size = v5;
  compression_status v6 = compression_stream_process(&stream, 1);
  switch(v6)
  {
    case COMPRESSION_STATUS_ERROR:
      NSLog(@"Error. Compression failed.");
      return 0LL;
    case COMPRESSION_STATUS_OK:
      NSLog(@"Error. Compression output buffer full.");
      return 0LL;
    case COMPRESSION_STATUS_END:
      if (stream.dst_ptr > a2) {
        uint64_t v7 = (uint8_t *)(stream.dst_ptr - a2);
      }
      else {
        uint64_t v7 = 0LL;
      }
      break;
    default:
      uint64_t v7 = 0LL;
      break;
  }

  compression_stream_destroy(&stream);
  return v7;
}

uint64_t __VMUCompressedBuffer_block_invoke_4(uint64_t a1, void *__dst)
{
  return *(void *)(a1 + 40);
}

void OUTLINED_FUNCTION_0_1(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
}

const char *VMUGraphNodeTypeDescription(unsigned int a1)
{
  if (a1 > 5) {
    return "";
  }
  else {
    return off_189E009D0[a1];
  }
}

BOOL VMUGraphNodeType_IsVMRegion(int a1)
{
  return a1 == 2 || a1 == 5;
}

BOOL VMUGraphNodeType_IsRoot(int a1)
{
  return (a1 - 2) < 3;
}

uint64_t VMUGraphNodeType_IsAddressValid(unsigned int a1)
{
  return (a1 > 4) | (6u >> a1) & 1;
}

void sub_18615AC2C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26, uint64_t a27, uint64_t a28, uint64_t a29, char a30)
{
}

void sub_18615B5C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20, uint64_t a21, char a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
}

void sub_18615CBCC(_Unwind_Exception *a1)
{
}

void sub_18615CD90( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void sub_18615DBE4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
}

unint64_t *sortNodesInMap(unint64_t *result, void *__base, size_t __nel)
{
  if (__nel >= 2)
  {
    __compar[5] = v3;
    __compar[6] = v4;
    unint64_t v5 = result[2];
    if (v5 < *result) {
      goto LABEL_7;
    }
    compression_status v6 = result + 4;
    uint64_t v7 = 2LL;
    do
    {
      unint64_t v8 = v7;
      unint64_t v9 = *v6;
      v6 += 2;
      ++v7;
      BOOL v10 = v9 >= v5;
      unint64_t v5 = v9;
    }

    while (v10);
    if (v8 < __nel)
    {
LABEL_7:
      __compar[0] = MEMORY[0x1895F87A8];
      __compar[1] = 3221225472LL;
      __compar[2] = __sortNodesInMap_block_invoke;
      __compar[3] = &__block_descriptor_40_e15_i24__0r_v8r_v16l;
      __compar[4] = result;
      return (unint64_t *)mergesort_b(__base, __nel, 4uLL, __compar);
    }
  }

  return result;
}

void sub_18615E01C(_Unwind_Exception *a1)
{
}

id _subgraphWithPaths(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  id v7 = a1;
  unint64_t v8 = (void *)[v7 copy];
  int v9 = [v7 edgeNamespaceSize];
  BOOL v10 = calloc(1uLL, ((v9 + 7) >> 3) + 4);
  *BOOL v10 = v9;
  size_t v11 = 4 * [v7 nodeNamespaceSize];
  uint64_t v12 = malloc(v11);
  int __pattern4 = -1;
  memset_pattern4(v12, &__pattern4, v11);
  size_t v13 = 4 * [v7 nodeNamespaceSize];
  id v14 = malloc(v13);
  int __pattern4 = -1;
  memset_pattern4(v14, &__pattern4, v13);
  uint64_t v22 = MEMORY[0x1895F87A8];
  uint64_t v23 = 3221225472LL;
  uint64_t v24 = ___subgraphWithPaths_block_invoke_2;
  uint64_t v25 = &unk_189E009B0;
  id v15 = v7;
  id v26 = v15;
  id v27 = v12;
  id v28 = v14;
  uint64_t v29 = a3;
  uint64_t v30 = v10;
  char v31 = a4;
  [v15 breadthFirstSearch:a2 nodeVisitBlock:&__block_literal_global_172 edgeVisitBlock:&v22];
  int v16 = *v10;
  unint64_t v17 = (*v10 + 7);
  if (v17 >= 8)
  {
    uint64_t v18 = v10 + 1;
    uint64_t v19 = v17 >> 3;
    if (v17 >> 3 <= 1) {
      uint64_t v19 = 1LL;
    }
    do
    {
      *uint64_t v18 = ~*v18;
      ++v18;
      --v19;
    }

    while (v19);
  }

  int v20 = v16 & 7;
  if (v20) {
    *((_BYTE *)v10 + (v17 >> 3) + 3) ^= -1 << v20;
  }
  [v8 removeMarkedEdges:v10, v22, v23, v24, v25];
  if (v12) {
    free(v12);
  }
  if (v14) {
    free(v14);
  }
  free(v10);

  return v8;
}

void sub_18615E4CC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __sortNodesInMap_block_invoke(uint64_t a1, unsigned int *a2, unsigned int *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  unint64_t v4 = *(void *)(v3 + 16LL * *a2);
  unint64_t v5 = *(void *)(v3 + 16LL * *a3);
  BOOL v6 = v4 >= v5;
  BOOL v7 = v4 > v5;
  if (v6) {
    return v7;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t ___subgraphWithPaths_block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  if (((a3 + 1) & 0xFE) != 0) {
    return 2LL;
  }
  else {
    return (a3 + 1);
  }
}

BOOL ___subgraphWithPaths_block_invoke_2(uint64_t a1, uint64_t a2, int a3, unsigned int a4, _BYTE *a5)
{
  if (*a5) {
    return 0LL;
  }
  int v8 = a2;
  BOOL v10 = *(void **)(a1 + 32);
  if (v10)
  {
    [v10 referenceInfoWithName:a2];
    LOBYTE(v10) = v20;
  }

  BOOL result = VMUIsOwningReference((char)v10);
  if (result)
  {
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    *(_DWORD *)(v11 + 4LL * a4) = a3;
    uint64_t v13 = a4;
    *(_DWORD *)(v12 + 4LL * a4) = v8;
    id v14 = *(unsigned int **)(a1 + 56);
    if (*v14 <= (unint64_t)a4)
    {
      return 1LL;
    }

    else
    {
      BOOL result = 1LL;
      if ((((unint64_t)*((unsigned __int8 *)v14 + ((unint64_t)a4 >> 3) + 4) >> (a4 & 7)) & 1) != 0)
      {
        do
        {
          id v15 = *(_DWORD **)(a1 + 64);
          unint64_t v16 = *(unsigned int *)(*(void *)(a1 + 48) + 4 * v13);
          if (*v15 > v16)
          {
            uint64_t v17 = (v16 >> 3) + 4;
            int v18 = *((unsigned __int8 *)v15 + v17);
            int v19 = 1 << (v16 & 7);
            if ((v19 & v18) != 0) {
              return *(_BYTE *)(a1 + 72) == 0;
            }
            *((_BYTE *)v15 + v17) = v18 | v19;
            uint64_t v11 = *(void *)(a1 + 40);
          }

          uint64_t v13 = *(unsigned int *)(v11 + 4 * v13);
        }

        while ((_DWORD)v13 != -1);
        return *(_BYTE *)(a1 + 72) == 0;
      }
    }
  }

  return result;
}

uint64_t shouldGetLabelForObject(void *a1, int a2)
{
  id v3 = a1;
  unint64_t v4 = v3;
  uint64_t v5 = 1LL;
  if (v3 && a2)
  {
    [v3 className];
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = 1LL;
    [v6 rangeOfString:@"String" options:1];
    if (!v7)
    {
      if ([v6 isEqualToString:@"NSPathStore2"]) {
        uint64_t v5 = 1LL;
      }
      else {
        uint64_t v5 = [v4 isDerivedFromStackBacktrace];
      }
    }
  }

  return v5;
}

uint64_t totalSizeOfRanges(NSMapTable *a1)
{
  value = 0LL;
  key = 0LL;
  uint64_t v1 = 0LL;
  if (NSNextMapEnumeratorPair(&enumerator, &key, &value))
  {
    uint64_t v1 = 0LL;
    do
      v1 += (uint64_t)value;
    while (NSNextMapEnumeratorPair(&enumerator, &key, &value));
  }

  NSEndMapTableEnumeration(&enumerator);
  return v1;
}

void sub_18615FB9C(_Unwind_Exception *a1)
{
}

void sub_1861623B4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, char a50)
{
}

_DWORD *vmu_create_backtrace_uniquing_table(unsigned int a1, int a2)
{
  unint64_t v4 = calloc(1uLL, 0x108uLL);
  uint64_t v5 = v4;
  if ((a2 & 2) != 0) {
    unint64_t v6 = 24LL;
  }
  else {
    unint64_t v6 = 16LL;
  }
  v4[10] = v6;
  if (a1)
  {
    if (a1 <= 0x400) {
      int v7 = 1024;
    }
    else {
      int v7 = a1;
    }
    uint64_t v8 = (v6 * v7);
    uint64_t v9 = *MEMORY[0x1895FD590];
  }

  else
  {
    uint64_t v9 = *MEMORY[0x1895FD590];
    uint64_t v10 = 512LL;
  }

  unint64_t v11 = (v9 * v10 / v6) & 0xFFFFFFFFFFFFFFELL;
  *((void *)v4 + 1) = v10;
  *((void *)v4 + 2) = v11;
  *((void *)v4 + 3) = v9 * v10;
  if (v11 >= 0xFFFFFFFF) {
    vmu_create_backtrace_uniquing_table_cold_1();
  }
  if (mach_vm_allocate(*MEMORY[0x1895FBBE0], &address, v9 * v10, 167772161)) {
    vmu_create_backtrace_uniquing_table_cold_2();
  }
  *(void *)uint64_t v5 = address;
  *((void *)v5 + 4) = 0LL;
  v5[14] = ((a2 & 6) == 0) | a2;
  v5[11] = 10;
  unint64_t v12 = *((void *)v5 + 2);
  if (v12 >= 0x401)
  {
    int v13 = 10;
    do
    {
      v12 >>= 2;
      v13 += 3;
    }

    while (v12 > 0x400);
    v5[11] = v13;
  }

  pthread_rwlock_init((pthread_rwlock_t *)(v5 + 16), 0LL);
  return v5;
}

char *vmu_create_backtrace_uniquing_table_from_archive(unint64_t a1, int a2, uint64_t a3)
{
  unint64_t v6 = (char *)calloc(1uLL, 0x108uLL);
  *((_DWORD *)v6 + 14) = a2;
  if ((a2 & 2) != 0) {
    unint64_t v7 = 24LL;
  }
  else {
    unint64_t v7 = 16LL;
  }
  *((_DWORD *)v6 + 10) = v7;
  *(void *)unint64_t v6 = a3;
  unint64_t v8 = (a1 / v7) & 0xFFFFFFFFFFFFFFELL;
  *((void *)v6 + 2) = v8;
  *((void *)v6 + 3) = a1;
  if (v8 >= 0xFFFFFFFF) {
    vmu_create_backtrace_uniquing_table_from_archive_cold_1();
  }
  uint64_t v9 = v6;
  *((void *)v6 + 1) = 0LL;
  *((void *)v6 + 4) = 0LL;
  *((_DWORD *)v6 + 11) = 0;
  pthread_rwlock_init((pthread_rwlock_t *)(v6 + 64), 0LL);
  return v9;
}

void vmu_destroy_backtrace_uniquing_table(uint64_t a1)
{
  if (*(void *)(a1 + 8)) {
    mach_vm_deallocate(*MEMORY[0x1895FBBE0], *(void *)a1, *(void *)(a1 + 24));
  }
  else {
    free(*(void **)a1);
  }
  pthread_rwlock_destroy((pthread_rwlock_t *)(a1 + 64));
  free((void *)a1);
}

uint64_t vmu_context_for_uniqued_stack(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(a1 + 56) & 2) != 0) {
    return *(void *)a1 + *(unsigned int *)(a1 + 40) * a2 + 16;
  }
  else {
    return 0LL;
  }
}

uint64_t vmu_enter_stack_in_backtrace_uniquing_table( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = MEMORY[0x1895F8858](a1, a2, a3, a4, a5);
  address[512] = *MEMORY[0x1895F89C0];
  if (!*(void *)(v5 + 8)) {
    return 0LL;
  }
  unsigned int v9 = v8;
  uint64_t v10 = v7;
  unint64_t v11 = v6;
  uint64_t v12 = v5;
  int v13 = (pthread_rwlock_t *)(v5 + 64);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(v5 + 64));
  int v14 = _enter_frames_in_table_while_locked(v12, &v37, v10, v9);
  pthread_rwlock_unlock(v13);
  if (v14)
  {
    uint64_t result = 1LL;
  }

  else
  {
    uint64_t v35 = v10;
    unsigned int v36 = v9;
    while (1)
    {
      uint64_t v16 = 4LL * *(void *)(v12 + 8);
      int v17 = *(_DWORD *)(v12 + 44);
      pthread_rwlock_wrlock(v13);
      uint64_t v18 = *(void *)(v12 + 16);
      unint64_t v19 = *MEMORY[0x1895FD590] * v16;
      unint64_t v20 = v19 / *(unsigned int *)(v12 + 40);
      unint64_t v21 = v20 & 0xFFFFFFFFFFFFFFFELL;
      if (HIDWORD(v20))
      {
        fprintf( (FILE *)*MEMORY[0x1895F89D0],  "can't expand backtrace uniquing table from %llu nodes to %llu nodes (exceeds maximum %u)\n",  v18,  v21,  -1);
        goto LABEL_34;
      }

      uint64_t v22 = v13;
      mach_vm_address_t v23 = *(void *)v12;
      mach_vm_size_t v24 = *(void *)(v12 + 24);
      if (mach_vm_allocate(*MEMORY[0x1895FBBE0], address, *MEMORY[0x1895FD590] * v16, 167772161)) {
        vmu_create_backtrace_uniquing_table_cold_2();
      }
      mach_vm_address_t v25 = address[0];
      if (!address[0]) {
        break;
      }
      *(void *)uint64_t v12 = address[0];
      *(void *)(v12 + _Block_object_dispose(&STACK[0x220], 8) = v16;
      *(void *)(v12 + 16) = v21;
      *(void *)(v12 + 24) = v19;
      *(void *)(v12 + 32) = v18;
      *(_DWORD *)(v12 + 44) = v17 + 3;
      int v26 = *(_DWORD *)(v12 + 56);
      if ((v26 & 1) != 0)
      {
        *(void *)(v12 + 4_Block_object_dispose(&STACK[0x220], 8) = 0LL;
      }

      else if ((v26 & 4) != 0)
      {
        if (mach_vm_copy(*MEMORY[0x1895FBBE0], v23, v24, v25)) {
          printf("(VMUBacktraceUniquing) expandUniquingTable(): VMCopyFailed");
        }
      }

      else if ((v26 & 2) != 0)
      {
        *(void *)(v12 + 4_Block_object_dispose(&STACK[0x220], 8) = 0LL;
        if (v18)
        {
          for (uint64_t i = 0LL; i != v18; ++i)
          {
            uint64_t v28 = *(unsigned int *)(v12 + 40);
            mach_vm_address_t v29 = v23 + i * v28;
            uint64_t v30 = *(void *)(v29 + 16);
            if (v30)
            {
              int v31 = *(_DWORD *)(v29 + 8);
              if (v31 == -1)
              {
                int v33 = 0;
              }

              else
              {
                int v32 = 0;
                do
                {
                  address[v32] = *(void *)v29;
                  int v33 = v32 + 1;
                  mach_vm_address_t v29 = v23 + (v31 * v28);
                  int v31 = *(_DWORD *)(v29 + 8);
                  ++v32;
                }

                while (v31 != -1);
              }

              address[v33] = *(void *)v29;
              uint64_t v38 = 0LL;
              else {
                fwrite( "unable to reinsert node when expanding backtrace uniquing table - bad hashing function?\n",  0x58uLL,  1uLL,  (FILE *)*MEMORY[0x1895F89D0]);
              }
            }
          }
        }
      }

      if (mach_vm_deallocate(*MEMORY[0x1895FBBE0], v23, v24)) {
        printf("(VMUBacktraceUniquing) expandUniquingTable(): mach_vm_deallocate failed. [%p]\n", *(const void **)v12);
      }
      int v13 = v22;
      pthread_rwlock_unlock(v22);
      pthread_rwlock_wrlock(v22);
      int v34 = _enter_frames_in_table_while_locked(v12, &v37, v35, v36);
      pthread_rwlock_unlock(v22);
      if (v34)
      {
        uint64_t result = 1LL;
        goto LABEL_35;
      }
    }

    fprintf((FILE *)*MEMORY[0x1895F89D0], "failed to expand uniquing table to %llu bytes\n", v19);
    int v13 = v22;
LABEL_34:
    pthread_rwlock_unlock(v13);
    uint64_t result = 0LL;
    uint64_t v37 = -1LL;
  }

uint64_t vmu_remove_stack_from_backtrace_uniquing_table(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xFFFFFFFF) {
    vmu_remove_stack_from_backtrace_uniquing_table_cold_1();
  }
  unint64_t v4 = (pthread_rwlock_t *)(a1 + 64);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 64));
  int v5 = *(_DWORD *)(a1 + 52);
  int v6 = a2;
  while (1)
  {
    size_t v7 = *(unsigned int *)(a1 + 40);
    unsigned int v8 = (_DWORD *)(*(void *)a1 + (v7 * v6));
    int v10 = v8[2];
    int v9 = v8[3];
    if (!*(void *)v8 && v10 == 0) {
      break;
    }
    if (v9 != -1)
    {
      int v12 = v9 - 1;
      v8[3] = v12;
      if (!v12)
      {
        bzero(v8, v7);
        --*(_DWORD *)(a1 + 48);
        if (v6 == a2) {
          --*(_DWORD *)(a1 + 52);
        }
      }
    }

    int v6 = v10;
    if (v10 == -1) {
      goto LABEL_14;
    }
  }

  if (v9) {
    vmu_remove_stack_from_backtrace_uniquing_table_cold_3();
  }
LABEL_14:
  return pthread_rwlock_unlock(v4);
}

uint64_t vmu_stack_frames_for_uniqued_stack(uint64_t a1, unint64_t a2, uint64_t a3, int a4)
{
  if (a2 >= 0xFFFFFFFF) {
    vmu_stack_frames_for_uniqued_stack_cold_1();
  }
  int v6 = a2;
  unsigned int v8 = (pthread_rwlock_t *)(a1 + 64);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 64));
  if (a4)
  {
    uint64_t v9 = 0LL;
    int v10 = *(_DWORD *)(a1 + 40);
    int v11 = v6;
    while (1)
    {
      if (*(void *)(a1 + 24) <= (unint64_t)(v10 + v10 * v11))
      {
        fprintf((FILE *)*MEMORY[0x1895F89D0], "(VMUBacktraceUniquing): Invalid parent node %#x\n");
        goto LABEL_15;
      }

      int v12 = (uint64_t *)(*(void *)a1 + (v10 * v11));
      uint64_t v13 = *v12;
      int v11 = *((_DWORD *)v12 + 2);
      if (!v13 && v11 == 0) {
        break;
      }
      *(void *)(a3 + 8 * v9) = v13;
      int v15 = v9++;
      if (a4 - 1 == v15 || v11 == -1) {
        goto LABEL_15;
      }
    }

    fprintf((FILE *)*MEMORY[0x1895F89D0], "(VMUBacktraceUniquing): Invalid PC 0x%llx at frame %u for stackID %llu\n");
  }

  else
  {
    uint64_t v9 = 0LL;
  }

void *vmu_enumerate_backtrace_uniquing_table(void *result, uint64_t a2)
{
  unint64_t v2 = result[2];
  if (v2)
  {
    unint64_t v4 = result;
    unint64_t v5 = 0LL;
    uint64_t v6 = *result;
    do
    {
      uint64_t v7 = v6 + v5 * *((unsigned int *)v4 + 10);
      if (*(void *)v7 || *(_DWORD *)(v7 + 8))
      {
        uint64_t result = (void *)(*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
        unint64_t v2 = v4[2];
      }

      ++v5;
    }

    while (v5 < v2);
  }

  return result;
}

uint64_t vmu_print_backtrace_uniquing_table(uint64_t result)
{
  unint64_t v1 = *(void *)(result + 16);
  if (v1)
  {
    uint64_t v2 = result;
    unint64_t v3 = 0LL;
    uint64_t v4 = *(void *)result;
    int v5 = *(_DWORD *)(result + 56);
    uint64_t v6 = (FILE **)MEMORY[0x1895F89D0];
    do
    {
      uint64_t v7 = v4 + v3 * *(unsigned int *)(v2 + 40);
      int v8 = *(_DWORD *)(v7 + 8);
      if (*(void *)v7) {
        BOOL v9 = 0;
      }
      else {
        BOOL v9 = v8 == 0;
      }
      if (!v9)
      {
        fprintf(*v6, "%8llu  address %#llx  parent %u", v3, *(void *)v7, v8);
        if ((v5 & 2) != 0) {
          fprintf(*v6, "  context %#llx", *(void *)(v7 + 16));
        }
        uint64_t result = fputc(10, *v6);
        unint64_t v1 = *(void *)(v2 + 16);
      }

      ++v3;
    }

    while (v3 < v1);
  }

  return result;
}

uint64_t _enter_frames_in_table_while_locked(uint64_t a1, void *a2, uint64_t a3, unsigned int a4)
{
  unint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(int *)(a1 + 44);
  unint64_t v7 = (v4 - v5) / ((2 * v6) | 1uLL);
  uint64_t v8 = a4;
  unsigned int v9 = -1;
  while (1)
  {
    unsigned int v10 = v9;
    if ((_DWORD)v6)
    {
      --v8;
      unint64_t v11 = *(void *)(a3 + 8 * v8);
      unsigned int v9 = ((16 * v9) ^ (v11 >> 2)) % (v4 - v5 - 1) + v5;
      int v12 = (v6 - 1) * v7 + 1;
      int v13 = v6;
      while (1)
      {
        uint64_t v14 = *(void *)a1 + *(_DWORD *)(a1 + 40) * v9;
        if (!*(void *)v14 && !*(_DWORD *)(v14 + 8)) {
          break;
        }
        if (*(void *)v14 == v11 && *(_DWORD *)(v14 + 8) == v10)
        {
          int v19 = *(_DWORD *)(v14 + 12);
          uint64_t v18 = (_DWORD *)(v14 + 12);
          int v17 = v19;
          if (v19 == -1) {
            goto LABEL_19;
          }
          goto LABEL_18;
        }

        unint64_t v15 = v9 + v12;
        if (v4 <= v15) {
          int v16 = v5 - v4;
        }
        else {
          int v16 = 0;
        }
        v12 -= v7;
        unsigned int v9 = v15 + v16;
        if (!--v13) {
          return 0LL;
        }
      }

      *(void *)uint64_t v14 = v11;
      *(_DWORD *)(v14 + _Block_object_dispose(&STACK[0x220], 8) = v10;
      *(_DWORD *)(v14 + 12) = 1;
      ++*(_DWORD *)(a1 + 48);
      if (v8) {
        goto LABEL_19;
      }
      int v17 = *(_DWORD *)(a1 + 52);
      uint64_t v18 = (_DWORD *)(a1 + 52);
LABEL_18:
      *uint64_t v18 = v17 + 1;
LABEL_19:
      if (v13 >= 1) {
        continue;
      }
    }

    return 0LL;
  }

  *a2 = v9;
  return 1LL;
}

void VMUGatherOwnedVmObjects_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0( &dword_1860C5000,  MEMORY[0x1895F8DA0],  a3,  "VMUGatherOwnedVmObjects returned buffer should be large enough to describe its own length.\n",  a5,  a6,  a7,  a8,  0);
}

void VMUGatherOwnedVmObjects_cold_2( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0( &dword_1860C5000,  MEMORY[0x1895F8DA0],  a3,  "VMUGatherOwnedVmObjects returned buffer should be large enough to have the data for all the entries.\n",  a5,  a6,  a7,  a8,  0);
}

void _nextField( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___removeEntryFromMarkingRegion_block_invoke_cold_1()
{
}

void ___addEntryToMarkingRegion_block_invoke_cold_1()
{
  __assert_rtn("_addEntryToMarkingRegion_block_invoke", "VMUMemoryMarking.m", 95, "entries[entryIndex] == 0");
}

void ownedPhysFootprintAdjustmentForMemgraph_cold_1()
{
  __assert_rtn( "ownedPhysFootprintAdjustmentForMemgraph",  "VMUVMRegionIdentifier.m",  709,  "regions.count == *regionCountInOut");
}

void adjustOwnedMemoryRegionFootprint_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 134217984;
  uint64_t v3 = a1 - a2;
  _os_log_error_impl( &dword_1860C5000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Footprint changed while analyzing – attempting to adjust more owned unmapped physical footprint than is present in t he process by %llu bytes",  (uint8_t *)&v2,  0xCu);
}

void VMUMallocRangeTypeString_cold_1(int a1)
{
}

void ___markRegionsForMallocZones_block_invoke_4_cold_1()
{
}

void ___markRegionsForMallocZones_block_invoke_4_cold_2()
{
  __assert_rtn( "_markRegionsForMallocZones_block_invoke_4",  "VMUVMRegionIdentifier.m",  1466,  "VMUMaxRange(newVMRangeForZone) == rangeStartInRegion");
}

void ___getRegionMallocStatistics_block_invoke_3_cold_1()
{
}

void __remoteZoneIntrospection_block_invoke_5_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1860C5000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v1, 0xCu);
}

void vmu_create_backtrace_uniquing_table_cold_1()
{
}

void vmu_create_backtrace_uniquing_table_cold_2()
{
}

void vmu_create_backtrace_uniquing_table_from_archive_cold_1()
{
}

void vmu_remove_stack_from_backtrace_uniquing_table_cold_1()
{
}

void vmu_remove_stack_from_backtrace_uniquing_table_cold_2()
{
  __assert_rtn( "vmu_remove_stack_from_backtrace_uniquing_table",  "VMUBacktraceUniquing.c",  424,  "old_backtraces_contained - uniquing_table->backtraces_contained <= 1");
}

void vmu_remove_stack_from_backtrace_uniquing_table_cold_3()
{
  __assert_rtn("vmu_remove_stack_from_backtrace_uniquing_table", "VMUBacktraceUniquing.c", 408, "node->refcount == 0");
}

void vmu_stack_frames_for_uniqued_stack_cold_1()
{
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82D8](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82E0](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F82E8](c, data, *(void *)&len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x189602648](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x189602660](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x189602698](theArray, idx);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1896028D0](bundle);
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x189602908](bundle, key);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x189602A58](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x189602A98](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x189602AB0](theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BB8](allocator, capacity, keyCallBacks, valueCallBacks);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x189602C08](theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x189602C38](cf1, cf2);
}

uint64_t CFLog()
{
  return MEMORY[0x189602DA8]();
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x189602EF8](number);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603468](alloc, cStr, *(void *)&encoding);
}

CFURLRef CFURLCreateWithFileSystemPath( CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1896037C0](allocator, filePath, pathStyle, isDirectory);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x189603880](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

uint64_t CSArchitectureGetCurrent()
{
  return MEMORY[0x18960E080]();
}

uint64_t CSArchitectureIs64Bit()
{
  return MEMORY[0x18960E0A8]();
}

uint64_t CSArchitectureIsArm()
{
  return MEMORY[0x18960E0B8]();
}

uint64_t CSArchitectureIsArm64()
{
  return MEMORY[0x18960E0C8]();
}

uint64_t CSArchitectureIsX86_64()
{
  return MEMORY[0x18960E0D0]();
}

uint64_t CSDemangleSymbolName()
{
  return MEMORY[0x18960E0E8]();
}

uint64_t CSIsNull()
{
  return MEMORY[0x18960E0F8]();
}

uint64_t CSPlatformForTask()
{
  return MEMORY[0x18960E100]();
}

uint64_t CSRegionGetName()
{
  return MEMORY[0x18960E120]();
}

uint64_t CSRegionGetRange()
{
  return MEMORY[0x18960E138]();
}

uint64_t CSRelease()
{
  return MEMORY[0x18960E150]();
}

uint64_t CSRetain()
{
  return MEMORY[0x18960E158]();
}

uint64_t CSSourceInfoGetFilename()
{
  return MEMORY[0x18960E178]();
}

uint64_t CSSourceInfoGetLineNumber()
{
  return MEMORY[0x18960E188]();
}

uint64_t CSSourceInfoGetPath()
{
  return MEMORY[0x18960E198]();
}

uint64_t CSSourceInfoGetRange()
{
  return MEMORY[0x18960E1A0]();
}

uint64_t CSSymbolGetMangledName()
{
  return MEMORY[0x18960E1C8]();
}

uint64_t CSSymbolGetName()
{
  return MEMORY[0x18960E1D0]();
}

uint64_t CSSymbolGetRange()
{
  return MEMORY[0x18960E1E0]();
}

uint64_t CSSymbolGetSymbolOwner()
{
  return MEMORY[0x18960E1E8]();
}

uint64_t CSSymbolIsFunction()
{
  return MEMORY[0x18960E1F0]();
}

uint64_t CSSymbolIsUnnamed()
{
  return MEMORY[0x18960E1F8]();
}

uint64_t CSSymbolOwnerCreateSparseDataWithBlock()
{
  return MEMORY[0x18960E208]();
}

uint64_t CSSymbolOwnerForeachSection()
{
  return MEMORY[0x18960E228]();
}

uint64_t CSSymbolOwnerForeachSegment()
{
  return MEMORY[0x18960E230]();
}

uint64_t CSSymbolOwnerForeachSymbol()
{
  return MEMORY[0x18960E240]();
}

uint64_t CSSymbolOwnerGetArchitecture()
{
  return MEMORY[0x18960E250]();
}

uint64_t CSSymbolOwnerGetBaseAddress()
{
  return MEMORY[0x18960E258]();
}

uint64_t CSSymbolOwnerGetCFUUIDBytes()
{
  return MEMORY[0x18960E270]();
}

uint64_t CSSymbolOwnerGetContentForRange()
{
  return MEMORY[0x18960E278]();
}

uint64_t CSSymbolOwnerGetName()
{
  return MEMORY[0x18960E288]();
}

uint64_t CSSymbolOwnerGetPath()
{
  return MEMORY[0x18960E2A0]();
}

uint64_t CSSymbolOwnerGetRegionWithName()
{
  return MEMORY[0x18960E2A8]();
}

uint64_t CSSymbolOwnerGetSegmentWithAddress()
{
  return MEMORY[0x18960E2B0]();
}

uint64_t CSSymbolOwnerGetSourceInfoWithAddress()
{
  return MEMORY[0x18960E2C0]();
}

uint64_t CSSymbolOwnerGetSymbolCount()
{
  return MEMORY[0x18960E2C8]();
}

uint64_t CSSymbolOwnerGetSymbolWithAddress()
{
  return MEMORY[0x18960E2D0]();
}

uint64_t CSSymbolOwnerGetSymbolWithMangledName()
{
  return MEMORY[0x18960E2D8]();
}

uint64_t CSSymbolOwnerGetSymbolWithName()
{
  return MEMORY[0x18960E2E0]();
}

uint64_t CSSymbolOwnerGetVersion()
{
  return MEMORY[0x18960E2F8]();
}

uint64_t CSSymbolOwnerIsDyldSharedCache()
{
  return MEMORY[0x18960E320]();
}

uint64_t CSSymbolOwnerSetPathForSymbolication()
{
  return MEMORY[0x18960E338]();
}

uint64_t CSSymbolOwnerUsesCPlusPlus()
{
  return MEMORY[0x18960E340]();
}

uint64_t CSSymbolicatorCreateForTaskSharedCache()
{
  return MEMORY[0x18960E350]();
}

uint64_t CSSymbolicatorCreateNonFaultingWithSignatureAndGroupKey()
{
  return MEMORY[0x18960E358]();
}

uint64_t CSSymbolicatorCreateSignature()
{
  return MEMORY[0x18960E360]();
}

uint64_t CSSymbolicatorCreateWithBinaryImageListCountPidFlagsAndNotification()
{
  return MEMORY[0x18960E368]();
}

uint64_t CSSymbolicatorCreateWithCoreFilePathAndFlags()
{
  return MEMORY[0x18960E380]();
}

uint64_t CSSymbolicatorCreateWithMachKernel()
{
  return MEMORY[0x18960E398]();
}

uint64_t CSSymbolicatorCreateWithPathAndArchitecture()
{
  return MEMORY[0x18960E3A8]();
}

uint64_t CSSymbolicatorCreateWithPid()
{
  return MEMORY[0x18960E3C0]();
}

uint64_t CSSymbolicatorCreateWithSymbolOwners()
{
  return MEMORY[0x18960E3E8]();
}

uint64_t CSSymbolicatorCreateWithTask()
{
  return MEMORY[0x18960E3F0]();
}

uint64_t CSSymbolicatorCreateWithTaskFlagsAndNotification()
{
  return MEMORY[0x18960E3F8]();
}

uint64_t CSSymbolicatorFixupFrames()
{
  return MEMORY[0x18960E408]();
}

uint64_t CSSymbolicatorForceFullSymbolExtraction()
{
  return MEMORY[0x18960E410]();
}

uint64_t CSSymbolicatorForeachSegmentAtTime()
{
  return MEMORY[0x18960E420]();
}

uint64_t CSSymbolicatorForeachSymbolOwnerAtTime()
{
  return MEMORY[0x18960E430]();
}

uint64_t CSSymbolicatorForeachSymbolOwnerWithNameAtTime()
{
  return MEMORY[0x18960E440]();
}

uint64_t CSSymbolicatorForeachSymbolicatorWithPath()
{
  return MEMORY[0x18960E448]();
}

uint64_t CSSymbolicatorGetAOutSymbolOwner()
{
  return MEMORY[0x18960E468]();
}

uint64_t CSSymbolicatorGetArchitecture()
{
  return MEMORY[0x18960E478]();
}

uint64_t CSSymbolicatorGetFlagsForNListOnlyData()
{
  return MEMORY[0x18960E480]();
}

uint64_t CSSymbolicatorGetFlagsForNoSymbolOrSourceInfoData()
{
  return MEMORY[0x18960E488]();
}

uint64_t CSSymbolicatorGetSectionWithAddressAtTime()
{
  return MEMORY[0x18960E4A0]();
}

uint64_t CSSymbolicatorGetSourceInfoWithAddressAtTime()
{
  return MEMORY[0x18960E4C0]();
}

uint64_t CSSymbolicatorGetSymbolOwner()
{
  return MEMORY[0x18960E4D0]();
}

uint64_t CSSymbolicatorGetSymbolOwnerCountAtTime()
{
  return MEMORY[0x18960E4D8]();
}

uint64_t CSSymbolicatorGetSymbolOwnerWithAddressAtTime()
{
  return MEMORY[0x18960E4E8]();
}

uint64_t CSSymbolicatorGetSymbolOwnerWithNameAtTime()
{
  return MEMORY[0x18960E4F8]();
}

uint64_t CSSymbolicatorGetSymbolWithAddressAtTime()
{
  return MEMORY[0x18960E508]();
}

uint64_t CSSymbolicatorGetSymbolWithMangledNameFromSymbolOwnerWithNameAtTime()
{
  return MEMORY[0x18960E510]();
}

uint64_t CSSymbolicatorGetSymbolWithNameAtTime()
{
  return MEMORY[0x18960E518]();
}

uint64_t CSSymbolicatorGetTaskIsTranslated()
{
  return MEMORY[0x18960E520]();
}

uint64_t CSSymbolicatorIsKernelSymbolicator()
{
  return MEMORY[0x18960E528]();
}

uint64_t CSTaskHasStarted()
{
  return MEMORY[0x18960E538]();
}

uint64_t CSTaskIs64Bit()
{
  return MEMORY[0x18960E540]();
}

uint64_t CSTaskIsTranslated()
{
  return MEMORY[0x18960E548]();
}

uint64_t CSUUIDCFUUIDBytesToString()
{
  return MEMORY[0x18960E550]();
}

uint64_t CSUUIDStringToCFUUIDBytes()
{
  return MEMORY[0x18960E558]();
}

NSArray *__cdecl NSAllMapTableKeys(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x189607440](table);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x189607458](aClassName);
}

void NSEndMapTableEnumeration(NSMapEnumerator *enumerator)
{
}

NSMapEnumerator *__cdecl NSEnumerateMapTable(NSMapEnumerator *__return_ptr retstr, NSMapTable *table)
{
  return (NSMapEnumerator *)MEMORY[0x1896074A8](retstr, table);
}

void *__cdecl NSHashGet(NSHashTable *table, const void *pointer)
{
  return (void *)MEMORY[0x189607568](table, pointer);
}

void NSHashInsert(NSHashTable *table, const void *pointer)
{
}

void NSLog(NSString *format, ...)
{
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x189607638](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
}

void NSMapInsertKnownAbsent(NSMapTable *table, const void *key, const void *value)
{
}

void NSMapRemove(NSMapTable *table, const void *key)
{
}

BOOL NSNextMapEnumeratorPair(NSMapEnumerator *enumerator, void **key, void **value)
{
  return MEMORY[0x189607660](enumerator, key, value);
}

void NSResetMapTable(NSMapTable *table)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1896076F0](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x189607700](aClass);
}

uint64_t OSKextCopyLoadedKextInfo()
{
  return MEMORY[0x1896085D8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCreateWithExecutableURLIfLooksLikeBundle()
{
  return MEMORY[0x189604170]();
}

uint64_t _CFCopyServerVersionDictionary()
{
  return MEMORY[0x189604228]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x189604238]();
}

uint64_t _CFStringGetLength2()
{
  return MEMORY[0x1896045D0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1896141E0](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x189614268](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1896142A0](__n);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_189DFC0D8(__sz);
}

uint64_t __CFGenericTypeID()
{
  return MEMORY[0x189604978]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1896147A0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1896147B8](a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1895F8918](*(void *)&a1, a2);
}

uint64_t __strcpy_chk()
{
  return MEMORY[0x1895F89F8]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895F8A08]();
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl( void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1895F9328](a1, *(void *)&a2);
}

int atoi(const char *a1)
{
  return MEMORY[0x1895F95A0](a1);
}

void *__cdecl bsearch_b(const void *__key, const void *__base, size_t __nel, size_t __width, void *__compar)
{
  return (void *)MEMORY[0x1895F9658](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FA538](a1, a2);
}

size_t class_getInstanceSize(Class cls)
{
  return MEMORY[0x1896164B8](cls);
}

Ivar class_getInstanceVariable(Class cls, const char *name)
{
  return (Ivar)MEMORY[0x1896164C0](cls, name);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1896164D0](cls);
}

uint64_t clear_mapped_memory()
{
  return MEMORY[0x18960E560]();
}

void clearerr(FILE *a1)
{
}

int closedir(DIR *a1)
{
  return MEMORY[0x1895FA5A8](a1);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x1896149B8](stream);
}

compression_status compression_stream_init( compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x1896149D0](stream, *(void *)&operation, *(void *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x1896149E0](stream, *(void *)&flags);
}

uint64_t create_mapped_memory_cache_for_core_file_with_label()
{
  return MEMORY[0x18960E568]();
}

uint64_t create_sampling_context_for_task_pid_symbolicator()
{
  return MEMORY[0x18960E570]();
}

uint64_t csops()
{
  return MEMORY[0x1895FAAA0]();
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x189617580](strm, *(void *)&flush);
}

uLong deflateBound(z_streamp strm, uLong sourceLen)
{
  return MEMORY[0x189617588](strm, sourceLen);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x189617590](strm);
}

int deflateInit2_( z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x189617598]( strm,  *(void *)&level,  *(void *)&method,  *(void *)&windowBits,  *(void *)&memLevel,  *(void *)&strategy,  version,  *(void *)&stream_size);
}

uint64_t destroy_sampling_context()
{
  return MEMORY[0x18960E578]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1895FAD98](queue);
}

dispatch_qos_class_t dispatch_queue_get_qos_class(dispatch_queue_t queue, int *relative_priority_ptr)
{
  return MEMORY[0x1895FADA0](queue, relative_priority_ptr);
}

uint64_t dispatch_queue_name_for_serial_number()
{
  return MEMORY[0x18960E580]();
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(uint64_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1895FADF0](value);
}

uint64_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1895FAE00](dsema);
}

uint64_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAE08](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FAE50](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer( dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

int dlclose(void *__handle)
{
  return MEMORY[0x1895FAF50](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1895FAF58]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1895FAF60](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1895FAF78](__handle, __symbol);
}

uint64_t dyld_is_simulator_platform()
{
  return MEMORY[0x1895FB038]();
}

uint64_t dyld_process_create_for_task()
{
  return MEMORY[0x1895FB048]();
}

uint64_t dyld_process_dispose()
{
  return MEMORY[0x1895FB050]();
}

uint64_t dyld_process_is_restricted()
{
  return MEMORY[0x1895FB058]();
}

uint64_t dyld_process_snapshot_create_for_process()
{
  return MEMORY[0x1895FB060]();
}

uint64_t dyld_process_snapshot_dispose()
{
  return MEMORY[0x1895FB068]();
}

uint64_t dyld_process_snapshot_get_shared_cache()
{
  return MEMORY[0x1895FB078]();
}

uint64_t dyld_shared_cache_get_base_address()
{
  return MEMORY[0x1895FB0B8]();
}

uint64_t dyld_shared_cache_get_mapped_size()
{
  return MEMORY[0x1895FB0C0]();
}

uint64_t dyld_shared_cache_is_mapped_private()
{
  return MEMORY[0x1895FB0C8]();
}

uint64_t enumerate_mapped_memory_cache()
{
  return MEMORY[0x18960E588]();
}

uint64_t enumerate_mapped_memory_core_file_dumped_regions()
{
  return MEMORY[0x18960E590]();
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return MEMORY[0x1895FB208](a1);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x1895FB228](*(void *)&a1, a2);
}

int feof(FILE *a1)
{
  return MEMORY[0x1895FB248](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1895FB250](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1895FB268](a1);
}

char *__cdecl fgetln(FILE *a1, size_t *a2)
{
  return (char *)MEMORY[0x1895FB288](a1, a2);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x1895FB290](a1, *(void *)&a2, a3);
}

tree *__cdecl find_node(const char *a1, tree *a2)
{
  return (tree *)MEMORY[0x18960E598](a1, a2);
}

int flsll(uint64_t a1)
{
  return MEMORY[0x1895FB310](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1895FB348](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1895FB370](*(void *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1895FB378](a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB4C8](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FB538](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1895FB540]();
}

int getopt_long_only(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return MEMORY[0x1895FB600](*(void *)&a1, a2, a3, a4, a5);
}

pid_t getpgid(pid_t a1)
{
  return MEMORY[0x1895FB618](*(void *)&a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1895FB638]();
}

uint8_t *__cdecl getsectiondata( const mach_header_64 *mhp, const char *segname, const char *sectname, unint64_t *size)
{
  return (uint8_t *)MEMORY[0x1895FB6A0](mhp, segname, sectname, size);
}

uint8_t *__cdecl getsegmentdata(const mach_header_64 *mhp, const char *segname, unint64_t *size)
{
  return (uint8_t *)MEMORY[0x1895FB6B0](mhp, segname, size);
}

uid_t getuid(void)
{
  return MEMORY[0x1895FB6E8]();
}

kern_return_t host_info( host_t host, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return MEMORY[0x1895FB780](*(void *)&host, *(void *)&flavor, host_info_out, host_info_outCnt);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x189617608](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x189617610](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x189617618](strm, *(void *)&windowBits, version, *(void *)&stream_size);
}

int isatty(int a1)
{
  return MEMORY[0x1895FB868](*(void *)&a1);
}

const char *__cdecl ivar_getName(Ivar v)
{
  return (const char *)MEMORY[0x189616530](v);
}

ptrdiff_t ivar_getOffset(Ivar v)
{
  return MEMORY[0x189616538](v);
}

const char *__cdecl ivar_getTypeEncoding(Ivar v)
{
  return (const char *)MEMORY[0x189616540](v);
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x1895FB8E8](*(void *)&a1, *(void *)&a2);
}

uint64_t ledger()
{
  return MEMORY[0x1895FB9D0]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1895FBA98]();
}

uint64_t mach_continuous_approximate_time(void)
{
  return MEMORY[0x1895FBAA8]();
}

void mach_error(const char *str, mach_error_t error_value)
{
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1895FBAC0](*(void *)&error_value);
}

uint64_t mach_get_times()
{
  return MEMORY[0x1895FBAC8]();
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1895FBAD0]();
}

kern_return_t mach_memory_info( host_priv_t host, mach_zone_name_array_t *names, mach_msg_type_number_t *namesCnt, mach_zone_info_array_t *info, mach_msg_type_number_t *infoCnt, mach_memory_info_array_t *memory_info, mach_msg_type_number_t *memory_infoCnt)
{
  return MEMORY[0x1895FBAE0](*(void *)&host, names, namesCnt, info, infoCnt, memory_info, memory_infoCnt);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1895FBB28](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_mod_refs( ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1895FBB78](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

BOOLean_t mach_task_is_self(task_name_t task)
{
  return MEMORY[0x1895FBBD8](*(void *)&task);
}

mach_port_t mach_thread_self(void)
{
  return MEMORY[0x1895FBBF0]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1895FBBF8](info);
}

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags)
{
  return MEMORY[0x1895FBC00](*(void *)&target, address, size, *(void *)&flags);
}

kern_return_t mach_vm_copy( vm_map_t target_task, mach_vm_address_t source_address, mach_vm_size_t size, mach_vm_address_t dest_address)
{
  return MEMORY[0x1895FBC08](*(void *)&target_task, source_address, size, dest_address);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x1895FBC10](*(void *)&target, address, size);
}

kern_return_t mach_vm_page_range_query( vm_map_read_t target_map, mach_vm_offset_t address, mach_vm_size_t size, mach_vm_address_t dispositions, mach_vm_size_t *dispositions_count)
{
  return MEMORY[0x1895FBC20](*(void *)&target_map, address, size, dispositions, dispositions_count);
}

kern_return_t mach_vm_purgable_control( vm_map_t target_task, mach_vm_address_t address, vm_purgable_t control, int *state)
{
  return MEMORY[0x1895FBC30](*(void *)&target_task, address, *(void *)&control, state);
}

kern_return_t mach_vm_region_recurse( vm_map_read_t target_task, mach_vm_address_t *address, mach_vm_size_t *size, natural_t *nesting_depth, vm_region_recurse_info_t info, mach_msg_type_number_t *infoCnt)
{
  return MEMORY[0x1895FBC48](*(void *)&target_task, address, size, nesting_depth, info, infoCnt);
}

kern_return_t mach_wait_until(uint64_t deadline)
{
  return MEMORY[0x1895FBC68](deadline);
}

const char *__cdecl macho_arch_name_for_cpu_type(cpu_type_t type, cpu_subtype_t subtype)
{
  return (const char *)MEMORY[0x1895FBC70](*(void *)&type, *(void *)&subtype);
}

BOOL macho_cpu_type_for_arch_name(const char *archName, cpu_type_t *type, cpu_subtype_t *subtype)
{
  return MEMORY[0x1895FBC78](archName, type, subtype);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

uint64_t malloc_get_all_zones()
{
  return MEMORY[0x1895FBCB0]();
}

size_t malloc_good_size(size_t size)
{
  return MEMORY[0x1895FBCC0](size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1895FBCE0](ptr);
}

void malloc_zone_unregister(malloc_zone_t *zone)
{
}

uint64_t map_new_node()
{
  return MEMORY[0x18960E5A8]();
}

uint64_t mapped_memory_core_file_get_addressing_mask()
{
  return MEMORY[0x18960E5B0]();
}

uint64_t mapped_memory_core_file_get_architecture()
{
  return MEMORY[0x18960E5B8]();
}

uint64_t mapped_memory_core_file_get_argslen()
{
  return MEMORY[0x18960E5C0]();
}

uint64_t mapped_memory_core_file_get_dirty_flags()
{
  return MEMORY[0x18960E5C8]();
}

uint64_t mapped_memory_core_file_get_dyld_shared_cache_range()
{
  return MEMORY[0x18960E5D0]();
}

uint64_t mapped_memory_core_file_get_exclave_vm_flags_for_address()
{
  return MEMORY[0x18960E5D8]();
}

uint64_t mapped_memory_core_file_get_ledger_alternate_accounting()
{
  return MEMORY[0x18960E5E0]();
}

uint64_t mapped_memory_core_file_get_ledger_alternate_compressed()
{
  return MEMORY[0x18960E5E8]();
}

uint64_t mapped_memory_core_file_get_ledger_graphics_footprint()
{
  return MEMORY[0x18960E5F0]();
}

uint64_t mapped_memory_core_file_get_ledger_graphics_footprint_compressed()
{
  return MEMORY[0x18960E5F8]();
}

uint64_t mapped_memory_core_file_get_ledger_internal()
{
  return MEMORY[0x18960E600]();
}

uint64_t mapped_memory_core_file_get_ledger_internal_compressed()
{
  return MEMORY[0x18960E608]();
}

uint64_t mapped_memory_core_file_get_ledger_iokit_mapped()
{
  return MEMORY[0x18960E610]();
}

uint64_t mapped_memory_core_file_get_ledger_media_footprint()
{
  return MEMORY[0x18960E618]();
}

uint64_t mapped_memory_core_file_get_ledger_media_footprint_compressed()
{
  return MEMORY[0x18960E620]();
}

uint64_t mapped_memory_core_file_get_ledger_network_nonvolatile()
{
  return MEMORY[0x18960E628]();
}

uint64_t mapped_memory_core_file_get_ledger_network_nonvolatile_compressed()
{
  return MEMORY[0x18960E630]();
}

uint64_t mapped_memory_core_file_get_ledger_neural_footprint()
{
  return MEMORY[0x18960E638]();
}

uint64_t mapped_memory_core_file_get_ledger_neural_footprint_compressed()
{
  return MEMORY[0x18960E640]();
}

uint64_t mapped_memory_core_file_get_ledger_page_table()
{
  return MEMORY[0x18960E648]();
}

uint64_t mapped_memory_core_file_get_ledger_phys_footprint()
{
  return MEMORY[0x18960E650]();
}

uint64_t mapped_memory_core_file_get_ledger_phys_footprint_lifetime_max()
{
  return MEMORY[0x18960E658]();
}

uint64_t mapped_memory_core_file_get_ledger_purgable_nonvolatile()
{
  return MEMORY[0x18960E660]();
}

uint64_t mapped_memory_core_file_get_ledger_purgable_nonvolatile_compressed()
{
  return MEMORY[0x18960E668]();
}

uint64_t mapped_memory_core_file_get_ledger_tagged_footprint()
{
  return MEMORY[0x18960E670]();
}

uint64_t mapped_memory_core_file_get_ledger_tagged_footprint_compressed()
{
  return MEMORY[0x18960E678]();
}

uint64_t mapped_memory_core_file_get_ledger_wired_mem()
{
  return MEMORY[0x18960E680]();
}

uint64_t mapped_memory_core_file_get_owned_vm_objects()
{
  return MEMORY[0x18960E688]();
}

uint64_t mapped_memory_core_file_get_parent_proc_name()
{
  return MEMORY[0x18960E690]();
}

uint64_t mapped_memory_core_file_get_parent_proc_path()
{
  return MEMORY[0x18960E698]();
}

uint64_t mapped_memory_core_file_get_pid()
{
  return MEMORY[0x18960E6A0]();
}

uint64_t mapped_memory_core_file_get_ppid()
{
  return MEMORY[0x18960E6A8]();
}

uint64_t mapped_memory_core_file_get_proc_argc()
{
  return MEMORY[0x18960E6B0]();
}

uint64_t mapped_memory_core_file_get_proc_flags()
{
  return MEMORY[0x18960E6B8]();
}

uint64_t mapped_memory_core_file_get_proc_name()
{
  return MEMORY[0x18960E6C0]();
}

uint64_t mapped_memory_core_file_get_proc_path()
{
  return MEMORY[0x18960E6C8]();
}

uint64_t mapped_memory_core_file_get_proc_starttime_sec()
{
  return MEMORY[0x18960E6D0]();
}

uint64_t mapped_memory_core_file_get_proc_starttime_usec()
{
  return MEMORY[0x18960E6D8]();
}

uint64_t mapped_memory_core_file_get_udata_ptrs()
{
  return MEMORY[0x18960E6E0]();
}

uint64_t mapped_memory_core_file_get_userstack()
{
  return MEMORY[0x18960E6E8]();
}

uint64_t mapped_memory_core_file_has_info_for_memory_analysis()
{
  return MEMORY[0x18960E6F0]();
}

uint64_t mapped_memory_core_file_is_exclave()
{
  return MEMORY[0x18960E6F8]();
}

uint64_t mapped_memory_core_file_is_exclavecore()
{
  return MEMORY[0x18960E700]();
}

uint64_t mapped_memory_core_file_mach_vm_page_range_query()
{
  return MEMORY[0x18960E708]();
}

uint64_t mapped_memory_core_file_mach_vm_purgable_control()
{
  return MEMORY[0x18960E710]();
}

uint64_t mapped_memory_core_file_mach_vm_region_recurse_submap_64()
{
  return MEMORY[0x18960E718]();
}

uint64_t mapped_memory_core_file_mach_vm_region_recurse_submap_short_64()
{
  return MEMORY[0x18960E720]();
}

uint64_t mapped_memory_core_file_region_filename()
{
  return MEMORY[0x18960E728]();
}

uint64_t mapped_memory_is_64_bit()
{
  return MEMORY[0x18960E730]();
}

uint64_t mapped_memory_resume_target()
{
  return MEMORY[0x18960E738]();
}

uint64_t mapped_memory_suspend_target()
{
  return MEMORY[0x18960E740]();
}

uint64_t mapped_memory_task_threads()
{
  return MEMORY[0x18960E748]();
}

uint64_t mapped_memory_thread_get_state()
{
  return MEMORY[0x18960E750]();
}

void *__cdecl memchr(const void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1895FBE00](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1895FBE08](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FBE48](__b, *(void *)&__c, __len);
}

void memset_pattern4(void *__b, const void *__pattern4, size_t __len)
{
}

int mergesort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return MEMORY[0x1895FBE70](__base, __nel, __width, __compar);
}

int mergesort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  return MEMORY[0x1895FBE78](__base, __nel, __width, __compar);
}

int mkstemps(char *a1, int a2)
{
  return MEMORY[0x1895FBF48](a1, *(void *)&a2);
}

uint64_t msl_coldest_frame_is_threadid()
{
  return MEMORY[0x189610B88]();
}

uint64_t msl_copy_disk_stack_logs()
{
  return MEMORY[0x189610B90]();
}

uint64_t msl_disk_stack_logs_enumerate_from_buffer()
{
  return MEMORY[0x189610B98]();
}

uint64_t msl_disk_stack_logs_enumerate_from_task_with_block()
{
  return MEMORY[0x189610BA0]();
}

uint64_t msl_get_frames_for_address()
{
  return MEMORY[0x189610BA8]();
}

uint64_t msl_payload_create_from_index()
{
  return MEMORY[0x189610BB0]();
}

uint64_t msl_payload_for_vm_region_in_task()
{
  return MEMORY[0x189610BB8]();
}

uint64_t msl_payload_from_lite_zone_ptr()
{
  return MEMORY[0x189610BC0]();
}

uint64_t msl_payload_get_allocation_timestamp()
{
  return MEMORY[0x189610BC8]();
}

uint64_t msl_payload_get_invalid()
{
  return MEMORY[0x189610BD0]();
}

uint64_t msl_payload_get_uniquing_table_index()
{
  return MEMORY[0x189610BD8]();
}

uint64_t msl_payload_is_invalid()
{
  return MEMORY[0x189610BE0]();
}

uint64_t msl_payload_version_from_task()
{
  return MEMORY[0x189610BE8]();
}

uint64_t msl_start_reading()
{
  return MEMORY[0x189610BF0]();
}

uint64_t msl_stop_reading()
{
  return MEMORY[0x189610BF8]();
}

uint64_t msl_uniquing_table_copy_from_serialized()
{
  return MEMORY[0x189610C00]();
}

uint64_t msl_uniquing_table_copy_from_task()
{
  return MEMORY[0x189610C08]();
}

uint64_t msl_uniquing_table_enumerate()
{
  return MEMORY[0x189610C10]();
}

uint64_t msl_uniquing_table_get_frames_from_table()
{
  return MEMORY[0x189610C18]();
}

uint64_t msl_uniquing_table_get_frames_from_task()
{
  return MEMORY[0x189610C20]();
}

uint64_t msl_uniquing_table_release()
{
  return MEMORY[0x189610C28]();
}

uint64_t msl_uniquing_table_serialize()
{
  return MEMORY[0x189610C30]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1896165E8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1896165F8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1896166A8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1896166B8](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1896166C8](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1896166D8](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x189616700](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616718](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x189616740]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x189616748]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616830](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x189616968](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x189616978](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x189616980](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616990](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1896169A8](a1);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1895FC278](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1895FC600](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1895FC608](log);
}

uint64_t os_transaction_copy_description()
{
  return MEMORY[0x1895FC638]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1895FC6C0]();
}

void perror(const char *a1)
{
}

kern_return_t pid_for_task(mach_port_name_t t, int *x)
{
  return MEMORY[0x1895FC788](*(void *)&t, x);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1895FC890](a1);
}

int proc_get_dirty(pid_t pid, uint32_t *flags)
{
  return MEMORY[0x1895FC8A0](*(void *)&pid, flags);
}

uint64_t proc_list_uptrs()
{
  return MEMORY[0x1895FC8A8]();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1895FC8C8](*(void *)&pid, buffer, *(void *)&buffersize);
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return MEMORY[0x1895FC8D0](*(void *)&pid, *(void *)&flavor, buffer);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1895FC8E0](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1895FC8E8](*(void *)&pid, buffer, *(void *)&buffersize);
}

int proc_regionfilename(int pid, uint64_t address, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1895FC8F8](*(void *)&pid, address, buffer, *(void *)&buffersize);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1895FC9D8](a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x1895FCA58](a1, a2);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x1895FCAE8](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x1895FCAF0](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1895FCAF8](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1895FCB10](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1895FCB18](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1895FCB20]();
}

int putchar(int a1)
{
  return MEMORY[0x1895FCB88](*(void *)&a1);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1895FCC40](a1);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC68](__ptr, __size);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC70](__ptr, __size);
}

int regcomp(regex_t *a1, const char *a2, int a3)
{
  return MEMORY[0x1895FCCC8](a1, a2, *(void *)&a3);
}

size_t regerror(int a1, const regex_t *a2, char *a3, size_t a4)
{
  return MEMORY[0x1895FCCD0](*(void *)&a1, a2, a3, a4);
}

int regexec(const regex_t *a1, const char *a2, size_t a3, regmatch_t __pmatch[], int a5)
{
  return MEMORY[0x1895FCCD8](a1, a2, a3, __pmatch, *(void *)&a5);
}

void regfree(regex_t *a1)
{
}

uint64_t release_core_file_mapped_memory_cache()
{
  return MEMORY[0x18960E758]();
}

uint64_t sample_remote_thread_with_dispatch_queue_regular_and_swift_async()
{
  return MEMORY[0x18960E760]();
}

uint64_t sampling_context_clear_cache()
{
  return MEMORY[0x18960E768]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x189616A48](sel);
}

uint64_t set_mapped_memory_cache_region_info_block()
{
  return MEMORY[0x18960E770]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1895FCFD0](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FD010](a1, a2);
}

char *__cdecl strchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD048](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1895FD070](__s, __charset);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FD0B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FD0E8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1895FD0F0](__dst, __src, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1895FD0F8](__s1, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1895FD100](__s1, __n);
}

char *__cdecl strrchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD120](__s, *(void *)&__c);
}

char *__cdecl strstr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1895FD148](__big, __little);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD180](__str, __endptr, *(void *)&__base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD1A0](__str, __endptr, *(void *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1895FD2B0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}

int sysctlnametomib(const char *a1, int *a2, size_t *a3)
{
  return MEMORY[0x1895FD2C0](a1, a2, a3);
}

uint64_t task_get_mapped_memory_cache_with_label()
{
  return MEMORY[0x18960E778]();
}

kern_return_t task_info( task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1895FD320](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

uint64_t task_lookup_mapped_memory_cache()
{
  return MEMORY[0x18960E780]();
}

kern_return_t task_map_corpse_info_64( task_t task, task_t corspe_task, mach_vm_address_t *kcd_addr_begin, mach_vm_size_t *kcd_size)
{
  return MEMORY[0x1895FD328](*(void *)&task, *(void *)&corspe_task, kcd_addr_begin, kcd_size);
}

uint64_t task_read_for_pid()
{
  return MEMORY[0x1895FD340]();
}

uint64_t task_release_mapped_memory_cache()
{
  return MEMORY[0x18960E788]();
}

kern_return_t task_resume2(task_suspension_token_t suspend_token)
{
  return MEMORY[0x1895FD360](*(void *)&suspend_token);
}

kern_return_t task_suspend2(task_t target_task, task_suspension_token_t *suspend_token)
{
  return MEMORY[0x1895FD368](*(void *)&target_task, suspend_token);
}

kern_return_t task_threads( task_inspect_t target_task, thread_act_array_t *act_list, mach_msg_type_number_t *act_listCnt)
{
  return MEMORY[0x1895FD370](*(void *)&target_task, act_list, act_listCnt);
}

kern_return_t thread_get_state( thread_act_t target_act, thread_state_flavor_t flavor, thread_state_t old_state, mach_msg_type_number_t *old_stateCnt)
{
  return MEMORY[0x1895FD3A8](*(void *)&target_act, *(void *)&flavor, old_state, old_stateCnt);
}

kern_return_t thread_info( thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x1895FD3B0](*(void *)&target_act, *(void *)&flavor, thread_info_out, thread_info_outCnt);
}

uint64_t thread_name_for_thread_port()
{
  return MEMORY[0x18960E790]();
}

kern_return_t thread_policy_set( thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x1895FD3C0](*(void *)&thread, *(void *)&flavor, policy_info, *(void *)&policy_infoCnt);
}

kern_return_t thread_resume(thread_act_t target_act)
{
  return MEMORY[0x1895FD3C8](*(void *)&target_act);
}

kern_return_t thread_suspend(thread_act_t target_act)
{
  return MEMORY[0x1895FD3F0](*(void *)&target_act);
}

uint64_t unmap_node()
{
  return MEMORY[0x18960E798]();
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1895FD510](a1, a2, a3);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x1895FD528](a1, a2, a3);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1895FD548](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1895FD558](*(void *)&target_task, address, size);
}

uint64_t vm_tag_is_malloc()
{
  return MEMORY[0x18960E7A0]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1895FD9A8](connection);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1895FDC38](xdict);
}

uint64_t xpc_inspect_copy_description()
{
  return MEMORY[0x1895FDEA0]();
}

uint64_t objc_msgSend__addNodeWithNodeName_nodeInfo_callTreeParentNode_parentNodeName_parentNodeType_reference_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__addNodeWithNodeName_nodeInfo_callTreeParentNode_parentNodeName_parentNodeType_reference_);
}

uint64_t objc_msgSend__detailedNodeOffsetDescription_withSourceNode_destinationNode_alignmentSpacing_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__detailedNodeOffsetDescription_withSourceNode_destinationNode_alignmentSpacing_);
}

uint64_t objc_msgSend__identifyObjCClassStructureBlocksForIsa_isMetaclass_withScanner_addressIdentifierBlock_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__identifyObjCClassStructureBlocksForIsa_isMetaclass_withScanner_addressIdentifierBlock_);
}

uint64_t objc_msgSend__kernelCorePageRangeQueryWithAddress_size_dispositions_dispositionsCount_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__kernelCorePageRangeQueryWithAddress_size_dispositions_dispositionsCount_);
}

uint64_t objc_msgSend__printCallTreeToFile_cumulativeOutput_indentString_branchPointCount_topFunctions_options_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__printCallTreeToFile_cumulativeOutput_indentString_branchPointCount_topFunctions_options_);
}

uint64_t objc_msgSend__recursivelyIdentifySwiftAsyncTaskSlabs_containerRange_remoteBlock_mappedBlock_asyncTaskSlabMetadataIsa_nestingLevel_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__recursivelyIdentifySwiftAsyncTaskSlabs_containerRange_remoteBlock_mappedBlock_asyncTaskSlabMetadataIsa_nestingLevel_);
}

uint64_t objc_msgSend_buildCallTreeWithNodeName_callTreeParentNode_parentNodeName_parentNodeType_reference_rootNodeFilter_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_buildCallTreeWithNodeName_callTreeParentNode_parentNodeName_parentNodeType_reference_rootNodeFilter_);
}

uint64_t objc_msgSend_columnHeadersWithOptions_maximumLength_memorySizeDivisor_hasFractionalPageSizes_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_columnHeadersWithOptions_maximumLength_memorySizeDivisor_hasFractionalPageSizes_);
}

uint64_t objc_msgSend_descriptionOfRegionsAroundAddress_options_maximumLength_memorySizeDivisor_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_descriptionOfRegionsAroundAddress_options_maximumLength_memorySizeDivisor_);
}

uint64_t objc_msgSend_descriptionWithOptions_maximumLength_memorySizeDivisor_hasFractionalPageSizes_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_descriptionWithOptions_maximumLength_memorySizeDivisor_hasFractionalPageSizes_);
}

uint64_t objc_msgSend_dispatchQueueNameForSerialNumber_returnedConcurrentFlag_returnedThreadId_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_dispatchQueueNameForSerialNumber_returnedConcurrentFlag_returnedThreadId_);
}

uint64_t objc_msgSend_identifyNonObjectsUsingStackBacktraces_classInfoMap_classInfoSetterBlock_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_identifyNonObjectsUsingStackBacktraces_classInfoMap_classInfoSetterBlock_);
}

uint64_t objc_msgSend_initSwiftEnumPayloadFieldWithName_type_kind_scan_offset_size_stride_possibleEnumSubFieldArray_swiftTyperef_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initSwiftEnumPayloadFieldWithName_type_kind_scan_offset_size_stride_possibleEnumSubFieldArray_swiftTyperef_);
}

uint64_t objc_msgSend_initWithName_type_kind_scan_offset_size_stride_subFieldArray_swiftTyperef_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithName_type_kind_scan_offset_size_stride_subFieldArray_swiftTyperef_);
}

uint64_t objc_msgSend_initWithPid_nodes_nodeCount_zoneNames_classInfoMap_regions_pthreadOffsets_userMarked_autoreleasePoolOffsets_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithPid_nodes_nodeCount_zoneNames_classInfoMap_regions_pthreadOffsets_userMarked_autoreleasePoolOffsets_);
}

uint64_t objc_msgSend_initWithSerializer_classMap_version_returnedDestinationLayoutClassInfoIndex_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithSerializer_classMap_version_returnedDestinationLayoutClassInfoIndex_error_);
}

uint64_t objc_msgSend_initWithVirtualAddress_allocationSize_surfaceID_pixelFormat_pixelFormatString_width_height_dirtySize_residentSize_name_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithVirtualAddress_allocationSize_surfaceID_pixelFormat_pixelFormatString_width_height_dirtySize_residentSize_name_);
}

uint64_t objc_msgSend_machVMPageRangeQueryWithAddress_size_dispositions_dispositionsCount_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_machVMPageRangeQueryWithAddress_size_dispositions_dispositionsCount_);
}

uint64_t objc_msgSend_machVMRegionRecurseSubmapShortInfo64onAddress_size_nestingDepth_info_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_machVMRegionRecurseSubmapShortInfo64onAddress_size_nestingDepth_info_);
}

uint64_t objc_msgSend_recordSampleTo_timestamp_thread_recordFramePointers_clearMemoryCache_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_recordSampleTo_timestamp_thread_recordFramePointers_clearMemoryCache_);
}

uint64_t objc_msgSend_registerOptionWithLongName_shortName_argumentKind_argumentName_optionDescription_flags_handler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_registerOptionWithLongName_shortName_argumentKind_argumentName_optionDescription_flags_handler_);
}

uint64_t objc_msgSend_registerOptionWithLongName_shortName_argumentKind_argumentName_optionDescription_handler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_registerOptionWithLongName_shortName_argumentKind_argumentName_optionDescription_handler_);
}

uint64_t objc_msgSend_resymbolicateWithDsymPath_libraryNames_all_progress_showDebugInfo_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_resymbolicateWithDsymPath_libraryNames_all_progress_showDebugInfo_error_);
}

uint64_t objc_msgSend_threadNameForThread_returnedThreadId_returnedDispatchQueueSerialNum_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_threadNameForThread_returnedThreadId_returnedDispatchQueueSerialNum_);
}
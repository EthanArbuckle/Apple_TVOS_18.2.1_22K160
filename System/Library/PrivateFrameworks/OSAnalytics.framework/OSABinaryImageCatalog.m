@interface OSABinaryImageCatalog
+ (BOOL)isApplePath:(id)a3 orBundle:(id)a4;
- (BOOL)isAddressInTargetedCache:(unint64_t)a3;
- (OSABinaryImageCatalog)init;
- (id)reportUsedImages;
- (id)reportUsedImagesFullInfoUsingBlock:(id)a3;
- (id)searchFrame:(unint64_t)a3 in:(id)a4 regions:(id)a5 result:(id *)a6;
- (id)searchFrame:(unint64_t)a3 in:(id)a4 result:(id *)a5;
- (unint64_t)markImageAsUsed:(id)a3 from:(int)a4;
- (void)appendNotesTo:(id)a3;
- (void)setKernelCache:(unsigned __int8)a3[16] address:(unint64_t)a4 size:(unint64_t)a5;
- (void)setKernelImages:(id)a3;
- (void)setKernelTextExecImages:(id)a3;
- (void)setRootedCacheLibs:(dyld_uuid_info_64 *)a3 count:(unsigned int)a4;
- (void)targetSharedCache:(unsigned __int8)a3[16] withSlide:(unint64_t)a4 atBaseAddress:(unint64_t)a5;
@end

@implementation OSABinaryImageCatalog

- (OSABinaryImageCatalog)init
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___OSABinaryImageCatalog;
  v2 = -[OSABinaryImageCatalog init](&v16, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    used_segments = v2->_used_segments;
    v2->_used_segments = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    kernel_segments = v2->_kernel_segments;
    v2->_kernel_segments = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    kernel_text_exec_segments = v2->_kernel_text_exec_segments;
    v2->_kernel_text_exec_segments = v7;

    uint64_t v9 = objc_opt_new();
    shared_segments = v2->_shared_segments;
    v2->_shared_segments = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x189603FA8] array];
    notes = v2->_notes;
    v2->_notes = (NSMutableArray *)v11;

    uuid_clear(uu);
    v13 = -[OSABinaryImageSegment initWithAddress:size:for:]( objc_alloc(&OBJC_CLASS___OSABinaryImageSegment),  "initWithAddress:size:for:",  0LL,  0LL,  uu);
    absolute_segment = v2->_absolute_segment;
    v2->_absolute_segment = v13;

    if (init_onceToken != -1) {
      dispatch_once(&init_onceToken, &__block_literal_global_106);
    }
  }

  return v2;
}

void __29__OSABinaryImageCatalog_init__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.ReportCrash.stackshot.sharedCacheLoader", 0LL);
  v1 = (void *)_sharedCacheLoaderQueue;
  _sharedCacheLoaderQueue = (uint64_t)v0;

  uint64_t v2 = [MEMORY[0x189603FC8] dictionary];
  v3 = (void *)_shared_caches;
  _shared_caches = v2;
}

- (void)setKernelImages:(id)a3
{
}

- (void)setKernelTextExecImages:(id)a3
{
}

- (void)setKernelCache:(unsigned __int8)a3[16] address:(unint64_t)a4 size:(unint64_t)a5
{
  v6 = -[OSABinaryImageSegment initWithAddress:size:for:]( objc_alloc(&OBJC_CLASS___OSABinaryImageSegment),  "initWithAddress:size:for:",  a4,  0x40000000LL,  a3);
  kernel_cache_segment = self->_kernel_cache_segment;
  self->_kernel_cache_segment = v6;
}

- (void)setRootedCacheLibs:(dyld_uuid_info_64 *)a3 count:(unsigned int)a4
{
  LODWORD(v4) = a4;
  [MEMORY[0x189603FA8] array];
  v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  rootedCacheLibs = self->_rootedCacheLibs;
  self->_rootedCacheLibs = v7;

  if ((_DWORD)v4)
  {
    uint64_t v4 = v4;
    imageUUID = a3->imageUUID;
    do
    {
      if (!uuid_is_null(imageUUID)) {
        -[NSMutableArray addImage:address:size:]( self->_rootedCacheLibs,  "addImage:address:size:",  imageUUID,  *((void *)imageUUID - 1),  0LL);
      }
      imageUUID += 24;
      --v4;
    }

    while (v4);
  }

  -[NSMutableArray sortByAddressAndSetInferredSizes](self->_rootedCacheLibs, "sortByAddressAndSetInferredSizes");
}

- (unint64_t)markImageAsUsed:(id)a3 from:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if ([v6 source])
  {
    unint64_t v7 = objc_msgSend(v6, "used_index");
  }

  else
  {
    [v6 setSource:v4];
    unint64_t v7 = -[NSMutableArray count](self->_used_segments, "count");
    objc_msgSend(v6, "setUsed_index:", v7);
    -[NSMutableArray addObject:](self->_used_segments, "addObject:", v6);
  }

  return v7;
}

- (void)targetSharedCache:(unsigned __int8)a3[16] withSlide:(unint64_t)a4 atBaseAddress:(unint64_t)a5
{
  id v12 = (id)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:a3];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_shared_segments, "objectForKeyedSubscript:");
  uint64_t v9 = (OSABinaryImageSegment *)objc_claimAutoreleasedReturnValue();
  targeted_cache = self->_targeted_cache;
  self->_targeted_cache = v9;

  self->_targeted_slide = a4;
  if (!self->_targeted_cache)
  {
    uint64_t v11 = (dispatch_queue_s *)_sharedCacheLoaderQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __67__OSABinaryImageCatalog_targetSharedCache_withSlide_atBaseAddress___block_invoke;
    block[3] = &unk_189E21040;
    unsigned __int8 *__attribute__((__org_arrdim(0,16))) v16 = a3;
    unint64_t v17 = a5;
    unint64_t v18 = a4;
    id v14 = v12;
    v15 = self;
    dispatch_sync(v11, block);
  }
}

void __67__OSABinaryImageCatalog_targetSharedCache_withSlide_atBaseAddress___block_invoke(uint64_t a1)
{
  uint64_t v2 = [(id)_shared_caches objectForKeyedSubscript:*(void *)(a1 + 32)];
  if (!v2)
  {
    if (!uuid_is_null(*(const unsigned __int8 **)(a1 + 48)))
    {
      uint64_t v9 = -[OSASymbolInfo initWithSharedCache:atBaseAddress:]( objc_alloc(&OBJC_CLASS___OSASymbolInfo),  "initWithSharedCache:atBaseAddress:",  *(void *)(a1 + 48),  *(void *)(a1 + 56) - *(void *)(a1 + 64));
      if (v9)
      {
        v15 = v9;
        [(id)_shared_caches setObject:v9 forKeyedSubscript:*(void *)(a1 + 32)];
        uint64_t v2 = (uint64_t)v15;
        goto LABEL_2;
      }

      v10 = *(void **)(*(void *)(a1 + 40) + 80LL);
      uint64_t v11 = (void *)NSString;
      [*(id *)(a1 + 32) UUIDString];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 stringWithFormat:@"unable to instantiate shared cache %@", v12];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 addObject:v13];
    }

    id v14 = 0LL;
    goto LABEL_6;
  }

- (BOOL)isAddressInTargetedCache:(unint64_t)a3
{
  unint64_t targeted_slide = self->_targeted_slide;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  unint64_t v6 = a3 - targeted_slide;
  -[OSABinaryImageSegment symbolInfo](self->_targeted_cache, "symbolInfo");
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 >= [v7 start])
  {
    -[OSABinaryImageSegment symbolInfo](self->_targeted_cache, "symbolInfo");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 start];
    -[OSABinaryImageSegment symbolInfo](self->_targeted_cache, "symbolInfo");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v8 = v6 < [v11 size] + v10;
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)appendNotesTo:(id)a3
{
}

- (id)searchFrame:(unint64_t)a3 in:(id)a4 result:(id *)a5
{
  return -[OSABinaryImageCatalog searchFrame:in:regions:result:]( self,  "searchFrame:in:regions:result:",  a3,  a4,  0LL,  a5);
}

- (id)searchFrame:(unint64_t)a3 in:(id)a4 regions:(id)a5 result:(id *)a6
{
  v69[2] = *MEMORY[0x1895F89C0];
  id v10 = a4;
  id v11 = a5;
  uint64_t v61 = 0LL;
  v62 = &v61;
  uint64_t v63 = 0x3032000000LL;
  v64 = __Block_byref_object_copy__5;
  v65 = __Block_byref_object_dispose__5;
  id v66 = 0LL;
  uint64_t v55 = 0LL;
  v56 = (id *)&v55;
  uint64_t v57 = 0x3032000000LL;
  v58 = __Block_byref_object_copy__5;
  v59 = __Block_byref_object_dispose__5;
  id v60 = 0LL;
  kernel_cache_segment = self->_kernel_cache_segment;
  if (kernel_cache_segment)
  {
    v13 = -[OSABinaryImageSegment symbolInfo](kernel_cache_segment, "symbolInfo");
    BOOL v14 = [v13 start] > a3;

    if (!v14)
    {
      objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[OSABinaryImageCatalog markImageAsUsed:from:](self, "markImageAsUsed:from:", self->_kernel_cache_segment, 85));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v69[0] = v15;
      unsigned __int8 *__attribute__((__org_arrdim(0,16))) v16 = (void *)MEMORY[0x189607968];
      -[OSABinaryImageSegment symbolInfo](self->_kernel_cache_segment, "symbolInfo");
      unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "numberWithUnsignedLongLong:", a3 - objc_msgSend(v17, "start"));
      unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      v69[1] = v18;
      [MEMORY[0x189603F18] arrayWithObjects:v69 count:2];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = [v19 copy];
      v21 = (void *)v62[5];
      v62[5] = v20;

      objc_storeStrong(v56 + 5, self->_kernel_cache_segment);
    }
  }

  v22 = (void *)v62[5];
  if (!v22)
  {
    v23 = self->_kernel_segments;
    if (-[NSMutableArray count](self->_kernel_text_exec_segments, "count"))
    {
      v24 = self->_kernel_text_exec_segments;

      int v25 = 84;
      v23 = v24;
    }

    else
    {
      int v25 = 75;
    }

    uint64_t v26 = -[NSMutableArray count](v23, "count");
    uint64_t v27 = MEMORY[0x1895F87A8];
    v53[0] = MEMORY[0x1895F87A8];
    v53[1] = 3221225472LL;
    v53[2] = __55__OSABinaryImageCatalog_searchFrame_in_regions_result___block_invoke;
    v53[3] = &unk_189E21068;
    v53[4] = self;
    v53[5] = &v61;
    int v54 = v25;
    v53[6] = &v55;
    v53[7] = a3;
    -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:]( v23,  "indexOfObject:inSortedRange:options:usingComparator:",  &unk_189E30AE8,  0LL,  v26,  256LL,  v53);
    if (v62[5]) {
      goto LABEL_21;
    }
    unint64_t v28 = a3 - self->_targeted_slide;
    if (-[NSMutableArray count](self->_rootedCacheLibs, "count"))
    {
      rootedCacheLibs = self->_rootedCacheLibs;
      uint64_t v30 = -[NSMutableArray count](rootedCacheLibs, "count");
      v52[0] = v27;
      v52[1] = 3221225472LL;
      v52[2] = __55__OSABinaryImageCatalog_searchFrame_in_regions_result___block_invoke_2;
      v52[3] = &unk_189E21090;
      v52[4] = self;
      v52[5] = &v61;
      v52[6] = &v55;
      v52[7] = v28;
      -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:]( rootedCacheLibs,  "indexOfObject:inSortedRange:options:usingComparator:",  &unk_189E30AE8,  0LL,  v30,  256LL,  v52);
    }

    if (v62[5]) {
      goto LABEL_21;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[OSABinaryImageSegment symbolInfo](self->_targeted_cache, "symbolInfo");
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      if (v28 < [v31 start])
      {
LABEL_16:

        goto LABEL_17;
      }
      v48 = -[OSABinaryImageSegment symbolInfo](self->_targeted_cache, "symbolInfo");
      uint64_t v46 = [v48 start];
      v32 = -[OSABinaryImageSegment symbolInfo](self->_targeted_cache, "symbolInfo");
      LODWORD(v46) = v28 < [v32 size] + v46;

      if ((_DWORD)v46)
      {
        objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[OSABinaryImageCatalog markImageAsUsed:from:](self, "markImageAsUsed:from:", self->_targeted_cache, 83));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v68[0] = v47;
        v33 = (void *)MEMORY[0x189607968];
        v49 = -[OSABinaryImageSegment symbolInfo](self->_targeted_cache, "symbolInfo");
        objc_msgSend(v33, "numberWithUnsignedLongLong:", v28 - objc_msgSend(v49, "start"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v68[1] = v34;
        [MEMORY[0x189603F18] arrayWithObjects:v68 count:2];
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v36 = [v35 copy];
        v37 = (void *)v62[5];
        v62[5] = v36;

        v38 = v56;
        v39 = self->_targeted_cache;
        id v31 = v38[5];
        v38[5] = v39;
        goto LABEL_16;
      }
    }

uint64_t __55__OSABinaryImageCatalog_searchFrame_in_regions_result___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  v29[2] = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0) {
    unint64_t v7 = v5;
  }
  else {
    unint64_t v7 = v6;
  }
  id v8 = v7;
  unint64_t v9 = *(void *)(a1 + 56);
  [v8 symbolInfo];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 >= [v10 start])
  {
    unint64_t v11 = *(void *)(a1 + 56);
    [v8 symbolInfo];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 start];
    [v8 symbolInfo];
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v15 = [v14 size] + v13;

    if (v11 < v15)
    {
      objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  objc_msgSend(*(id *)(a1 + 32), "markImageAsUsed:from:", v8, *(unsigned int *)(a1 + 64)));
      unsigned __int8 *__attribute__((__org_arrdim(0,16))) v16 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v16;
      unint64_t v17 = (void *)MEMORY[0x189607968];
      uint64_t v18 = *(void *)(a1 + 56);
      [v8 symbolInfo];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "numberWithUnsignedLongLong:", v18 - objc_msgSend(v19, "start"));
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      v29[1] = v20;
      [MEMORY[0x189603F18] arrayWithObjects:v29 count:2];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v22 = [v21 copy];
      uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8LL);
      v24 = *(void **)(v23 + 40);
      *(void *)(v23 + 40) = v22;

      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), v7);
    }
  }

  else
  {
  }

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
  {
    uint64_t v25 = 0LL;
  }

  else
  {
    [v8 symbolInfo];
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    else {
      uint64_t v25 = 1LL;
    }
  }

  return v25;
}

uint64_t __55__OSABinaryImageCatalog_searchFrame_in_regions_result___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  v29[2] = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0) {
    unint64_t v7 = v5;
  }
  else {
    unint64_t v7 = v6;
  }
  id v8 = v7;
  unint64_t v9 = *(void *)(a1 + 56);
  [v8 symbolInfo];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 >= [v10 start])
  {
    unint64_t v11 = *(void *)(a1 + 56);
    [v8 symbolInfo];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 start];
    [v8 symbolInfo];
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v15 = [v14 size] + v13;

    if (v11 < v15)
    {
      objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  objc_msgSend(*(id *)(a1 + 32), "markImageAsUsed:from:", v8, 67));
      unsigned __int8 *__attribute__((__org_arrdim(0,16))) v16 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v16;
      unint64_t v17 = (void *)MEMORY[0x189607968];
      uint64_t v18 = *(void *)(a1 + 56);
      [v8 symbolInfo];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "numberWithUnsignedLongLong:", v18 - objc_msgSend(v19, "start"));
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      v29[1] = v20;
      [MEMORY[0x189603F18] arrayWithObjects:v29 count:2];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v22 = [v21 copy];
      uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8LL);
      v24 = *(void **)(v23 + 40);
      *(void *)(v23 + 40) = v22;

      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), v7);
    }
  }

  else
  {
  }

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
  {
    uint64_t v25 = 0LL;
  }

  else
  {
    [v8 symbolInfo];
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    else {
      uint64_t v25 = 1LL;
    }
  }

  return v25;
}

BOOL __55__OSABinaryImageCatalog_searchFrame_in_regions_result___block_invoke_3( uint64_t a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  v26[2] = *MEMORY[0x1895F89C0];
  id v7 = a2;
  unint64_t v8 = *(void *)(a1 + 56);
  [v7 symbolInfo];
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 >= [v9 start])
  {
    unint64_t v10 = *(void *)(a1 + 56);
    [v7 symbolInfo];
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 start];
    [v7 symbolInfo];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v14 = [v13 size] + v12;

    if (v10 < v14)
    {
      objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  objc_msgSend(*(id *)(a1 + 32), "markImageAsUsed:from:", v7, 80));
      unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v15;
      unsigned __int8 *__attribute__((__org_arrdim(0,16))) v16 = (void *)MEMORY[0x189607968];
      uint64_t v17 = *(void *)(a1 + 56);
      [v7 symbolInfo];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "numberWithUnsignedLongLong:", v17 - objc_msgSend(v18, "start"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = v19;
      [MEMORY[0x189603F18] arrayWithObjects:v26 count:2];
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v21 = [v20 copy];
      uint64_t v22 = *(void *)(*(void *)(a1 + 40) + 8LL);
      uint64_t v23 = *(void **)(v22 + 40);
      *(void *)(v22 + 40) = v21;

      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), a2);
      *a4 = 1;
    }
  }

  else
  {
  }

  BOOL v24 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) != 0LL;

  return v24;
}

BOOL __55__OSABinaryImageCatalog_searchFrame_in_regions_result___block_invoke_4( uint64_t a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  id v7 = a2;
  unint64_t v8 = *(void *)(a1 + 40);
  [v7 symbolInfo];
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 >= [v9 start])
  {
    unint64_t v10 = *(void *)(a1 + 40);
    [v7 symbolInfo];
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 start];
    [v7 symbolInfo];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v14 = [v13 size] + v12;

    if (v10 < v14)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
      *a4 = 1;
    }
  }

  else
  {
  }

  BOOL v15 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) != 0LL;

  return v15;
}

- (id)reportUsedImages
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", -[NSMutableArray count](self->_used_segments, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  char v4 = self->_used_segments;
  uint64_t v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v8), "details", (void)v11);
        unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v3 addObject:v9];

        ++v8;
      }

      while (v6 != v8);
      uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v6);
  }

  return v3;
}

- (id)reportUsedImagesFullInfoUsingBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  char v4 = (void (**)(id, void *))a3;
  objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", -[NSMutableArray count](self->_used_segments, "count"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v6 = self->_used_segments;
  uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "full_details", (void)v13);
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4) {
          v4[2](v4, v11);
        }
        [v5 addObject:v11];

        ++v10;
      }

      while (v8 != v10);
      uint64_t v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v8);
  }

  return v5;
}

+ (BOOL)isApplePath:(id)a3 orBundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 hasPrefix:@"/System"] & 1) != 0
    || ([v5 hasPrefix:@"/usr/lib"] & 1) != 0
    || ([v5 hasPrefix:@"/usr/bin"] & 1) != 0
    || ([v5 hasPrefix:@"/usr/sbin"] & 1) != 0
    || ([v5 hasPrefix:@"/bin"] & 1) != 0
    || ([v5 hasPrefix:@"/sbin"] & 1) != 0
    || ([v6 hasPrefix:@"com.apple."] & 1) != 0
    || ([v6 hasPrefix:@"commpage"] & 1) != 0
    || ([v6 isEqualToString:@"Ozone"] & 1) != 0)
  {
    char v7 = 1;
  }

  else
  {
    char v7 = [v6 isEqualToString:@"Motion"];
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end
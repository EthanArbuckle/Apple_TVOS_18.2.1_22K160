@interface LPPartitionMedia
+ (id)contentTypesForPartitionMedia;
+ (id)primaryMedia;
+ (id)supportedContentTypes;
- (id)children;
@end

@implementation LPPartitionMedia

+ (id)supportedContentTypes
{
  id v5 = a1;
  SEL v4 = a2;
  if (a1 == (id)objc_opt_class())
  {
    id v6 = (id)[v5 contentTypesForPartitionMedia];
  }

  else
  {
    v3.receiver = v5;
    v3.super_class = (Class)&OBJC_METACLASS___LPPartitionMedia;
    id v6 = objc_msgSendSuper2(&v3, sel_supportedContentTypes);
  }

  return v6;
}

+ (id)contentTypesForPartitionMedia
{
  return &unk_189E350E0;
}

+ (id)primaryMedia
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  v13[2] = a1;
  v13[1] = (id)a2;
  v13[0] = +[LPMedia allMedia](&OBJC_CLASS___LPMedia, "allMedia");
  id location = 0LL;
  memset(__b, 0, sizeof(__b));
  id obj = v13[0];
  uint64_t v9 = [obj countByEnumeratingWithState:__b objects:v14 count:16];
  if (v9)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0LL;
    unint64_t v7 = v9;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(obj);
      }
      id v11 = 0LL;
      id v11 = *(id *)(__b[1] + 8 * v6);
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && ([v11 isPrimaryMedia]) {
        break;
      }
      ++v6;
      if (v4 + 1 >= v7)
      {
        uint64_t v6 = 0LL;
        unint64_t v7 = [obj countByEnumeratingWithState:__b objects:v14 count:16];
        if (!v7) {
          goto LABEL_10;
        }
      }
    }

    objc_storeStrong(&location, v11);
  }

- (id)children
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  v34 = self;
  location[1] = (id)a2;
  location[0] = (id)[MEMORY[0x189603FA8] arrayWithCapacity:16];
  v12 = &v32;
  io_object_t v32 = 0;
  if (MEMORY[0x186E34AE0](-[LPMedia ioMedia](v34, "ioMedia"), "IOService", 1LL, &v32))
  {
    uint64_t v31 = _os_log_pack_size();
    v30 = v3;
    uint64_t v29 = v31;
    v28 = &v3[-((v31 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
    v27 = (_BYTE *)_os_log_pack_fill();
    __os_log_helper_1_0_0(v27);
    _LPLogPack(1);
    id v35 = MEMORY[0x189604A58];
    int v26 = 1;
  }

  else
  {
    io_iterator_t v8 = v32;
    uint64_t v6 = &v19;
    uint64_t v4 = MEMORY[0x1895F87A8];
    uint64_t v19 = MEMORY[0x1895F87A8];
    int v5 = -1040187392;
    int v20 = -1040187392;
    int v21 = 0;
    v22 = __28__LPPartitionMedia_children__block_invoke;
    v23 = &__block_descriptor_44_e8_32s_e8_v12__0I8l;
    io_object_t v25 = v32;
    v10 = &v24;
    id v24 = location[0];
    unint64_t v7 = &v13;
    uint64_t v13 = v4;
    int v14 = -1040187392;
    int v15 = 0;
    v16 = __28__LPPartitionMedia_children__block_invoke_10;
    v17 = &__block_descriptor_40_e8_32s_e5_v8__0l;
    uint64_t v9 = &v18;
    id v18 = location[0];
    iterateSafely(v8, 3, &v19, &v13);
    IOObjectRelease(v32);
    id v35 = (id)[MEMORY[0x189603F18] arrayWithArray:location[0]];
    int v26 = 1;
    uint64_t v11 = 0LL;
    objc_storeStrong(&v18, 0LL);
    objc_storeStrong(&v24, 0LL);
  }

  objc_storeStrong(location, 0LL);
  return v35;
}

void __28__LPPartitionMedia_children__block_invoke(uint64_t a1, io_object_t a2)
{
  uint64_t v5 = a1;
  io_object_t v4 = a2;
  location[1] = (id)a1;
  if (IOObjectConformsTo(a2, "IOMedia"))
  {
    MEMORY[0x186E34B10](*(unsigned int *)(a1 + 40));
    location[0] =  +[LPMedia mediaOfCorrectTypeGivenIOMedia:]( &OBJC_CLASS___LPMedia,  "mediaOfCorrectTypeGivenIOMedia:",  v4);
    if (location[0]) {
      [*(id *)(a1 + 32) addObject:location[0]];
    }
    objc_storeStrong(location, 0LL);
  }

uint64_t __28__LPPartitionMedia_children__block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeAllObjects", a1, a1);
}

@end
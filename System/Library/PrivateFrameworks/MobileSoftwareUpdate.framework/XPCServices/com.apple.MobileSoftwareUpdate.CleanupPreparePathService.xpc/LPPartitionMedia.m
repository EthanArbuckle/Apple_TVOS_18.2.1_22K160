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
  if (a1 == (id)objc_opt_class(&OBJC_CLASS___LPPartitionMedia))
  {
    id v6 = [v5 contentTypesForPartitionMedia];
  }

  else
  {
    v3.receiver = v5;
    v3.super_class = (Class)&OBJC_METACLASS___LPPartitionMedia;
    id v6 = objc_msgSendSuper2(&v3, "supportedContentTypes");
  }

  return v6;
}

+ (id)contentTypesForPartitionMedia
{
  v3[0] = @"GUID_partition_scheme";
  v3[1] = @"FDisk_partition_scheme";
  v3[2] = @"Apple_partition_scheme";
  return +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v3, 3LL);
}

+ (id)primaryMedia
{
  v15[2] = a1;
  v15[1] = (id)a2;
  v15[0] = +[LPMedia allMedia](&OBJC_CLASS___LPMedia, "allMedia");
  id location = 0LL;
  memset(__b, 0, sizeof(__b));
  id obj = v15[0];
  id v11 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
  if (v11)
  {
    uint64_t v7 = *(void *)__b[2];
    uint64_t v8 = 0LL;
    id v9 = v11;
    while (1)
    {
      uint64_t v6 = v8;
      if (*(void *)__b[2] != v7) {
        objc_enumerationMutation(obj);
      }
      id v13 = 0LL;
      id v13 = *(id *)(__b[1] + 8 * v8);
      id v5 = v13;
      uint64_t v2 = objc_opt_class(&OBJC_CLASS___LPPartitionMedia);
      ++v8;
      if (v6 + 1 >= (unint64_t)v9)
      {
        uint64_t v8 = 0LL;
        id v9 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
        if (!v9) {
          goto LABEL_10;
        }
      }
    }

    objc_storeStrong(&location, v13);
  }

- (id)children
{
  v33 = self;
  location[1] = (id)a2;
  location[0] = +[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 16LL);
  id v11 = &v31;
  io_iterator_t v31 = 0;
  if (IORegistryEntryCreateIterator(-[LPMedia ioMedia](v33, "ioMedia"), "IOService", 1u, &v31))
  {
    uint64_t v30 = _os_log_pack_size(2LL);
    v29 = v3;
    uint64_t v28 = v30;
    uint64_t v27 = (uint64_t)v3 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    v26 = (_BYTE *)_os_log_pack_fill(v27, v30, 0LL, &_mh_execute_header, "Failed to create partition media iterator.");
    __os_log_helper_1_0_0(v26);
    _LPLogPack(1, v27);
    v34 = (NSArray *)__NSArray0__;
    int v25 = 1;
  }

  else
  {
    io_iterator_t v7 = v31;
    id v5 = &v18;
    v3[2] = _NSConcreteStackBlock;
    v18 = _NSConcreteStackBlock;
    int v4 = -1040187392;
    int v19 = -1040187392;
    int v20 = 0;
    v21 = __28__LPPartitionMedia_children__block_invoke;
    v22 = &__block_descriptor_44_e8_32s_e8_v12__0I8l;
    io_iterator_t v24 = v31;
    id v9 = &v23;
    id v23 = location[0];
    uint64_t v6 = &v12;
    v12 = _NSConcreteStackBlock;
    int v13 = -1040187392;
    int v14 = 0;
    v15 = __28__LPPartitionMedia_children__block_invoke_11;
    v16 = &__block_descriptor_40_e8_32s_e5_v8__0l;
    uint64_t v8 = &v17;
    id v17 = location[0];
    iterateSafely(v7, 3, &v18, &v12);
    IOObjectRelease(v31);
    v34 = +[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", location[0]);
    int v25 = 1;
    uint64_t v10 = 0LL;
    objc_storeStrong(&v17, 0LL);
    objc_storeStrong(&v23, 0LL);
  }

  objc_storeStrong(location, 0LL);
  return v34;
}

void __28__LPPartitionMedia_children__block_invoke(uint64_t a1, io_object_t a2)
{
  uint64_t v5 = a1;
  io_object_t v4 = a2;
  location[1] = (id)a1;
  if (IOObjectConformsTo(a2, "IOMedia"))
  {
    IORegistryIteratorExitEntry(*(_DWORD *)(a1 + 40));
    location[0] =  +[LPMedia mediaOfCorrectTypeGivenIOMedia:]( &OBJC_CLASS___LPMedia,  "mediaOfCorrectTypeGivenIOMedia:",  v4);
    if (location[0]) {
      [*(id *)(a1 + 32) addObject:location[0]];
    }
    objc_storeStrong(location, 0LL);
  }

id __28__LPPartitionMedia_children__block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeAllObjects", a1, a1);
}

@end
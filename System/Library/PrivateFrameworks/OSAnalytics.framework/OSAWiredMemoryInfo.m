@interface OSAWiredMemoryInfo
- (OSAWiredMemoryInfo)initWithZoneNames:(mach_zone_name *)a3 nameCount:(unsigned int)a4 zoneInfo:(mach_zone_info_data *)a5 zoneInfoCount:(unsigned int)a6 wiredInfo:(mach_memory_info *)a7 wiredInfoCount:(unsigned int)a8;
- (id)getCounterNameForSite:(unint64_t)a3;
- (id)getTagNameForSite:(unint64_t)a3;
- (id)vmRegionInfo;
- (id)zoneInfo;
- (void)dealloc;
@end

@implementation OSAWiredMemoryInfo

- (OSAWiredMemoryInfo)initWithZoneNames:(mach_zone_name *)a3 nameCount:(unsigned int)a4 zoneInfo:(mach_zone_info_data *)a5 zoneInfoCount:(unsigned int)a6 wiredInfo:(mach_memory_info *)a7 wiredInfoCount:(unsigned int)a8
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___OSAWiredMemoryInfo;
  result = -[OSAWiredMemoryInfo init](&v15, sel_init);
  if (result)
  {
    result->zone_names = a3;
    result->zone_names_count = a4;
    result->zone_info = a5;
    result->zone_info_count = a6;
    result->wired_info = a7;
    result->wired_info_count = a8;
  }

  return result;
}

- (void)dealloc
{
  self->zone_names = 0LL;
  self->zone_names_count = 0;
  self->zone_info = 0LL;
  self->zone_info_count = 0;
  self->wired_info = 0LL;
  self->wired_info_count = 0;
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___OSAWiredMemoryInfo;
  -[OSAWiredMemoryInfo dealloc](&v2, sel_dealloc);
}

- (id)zoneInfo
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->zone_names_count)
  {
    uint64_t v4 = 0LL;
    uint64_t v5 = 0LL;
    unint64_t v6 = 0LL;
    do
    {
      [MEMORY[0x189603FC8] dictionaryWithCapacity:9];
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      [NSString stringWithUTF8String:&self->zone_names[v5]];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setObject:v8 forKeyedSubscript:@"name"];

      [MEMORY[0x189607968] numberWithUnsignedLongLong:self->zone_info[v4].mzi_count];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setObject:v9 forKeyedSubscript:@"count"];

      [MEMORY[0x189607968] numberWithUnsignedLongLong:self->zone_info[v4].mzi_max_size];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setObject:v10 forKeyedSubscript:@"max_size"];

      [MEMORY[0x189607968] numberWithUnsignedLongLong:self->zone_info[v4].mzi_elem_size];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setObject:v11 forKeyedSubscript:@"elem_size"];

      [MEMORY[0x189607968] numberWithUnsignedLongLong:self->zone_info[v4].mzi_alloc_size];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setObject:v12 forKeyedSubscript:@"alloc_size"];

      [MEMORY[0x189607968] numberWithUnsignedLongLong:self->zone_info[v4].mzi_sum_size];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setObject:v13 forKeyedSubscript:@"sum_size"];

      [MEMORY[0x189607968] numberWithUnsignedLongLong:self->zone_info[v4].mzi_exhaustible];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setObject:v14 forKeyedSubscript:@"exhaustible"];

      [MEMORY[0x189607968] numberWithUnsignedLongLong:self->zone_info[v4].mzi_collectable];
      objc_super v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setObject:v15 forKeyedSubscript:@"collectable"];

      v16 = &self->zone_info[v4];
      uint64_t mzi_cur_size = v16->mzi_cur_size;
      if (!mzi_cur_size) {
        uint64_t mzi_cur_size = v16->mzi_elem_size * v16->mzi_count;
      }
      [MEMORY[0x189607968] numberWithUnsignedLongLong:mzi_cur_size];
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setObject:v18 forKeyedSubscript:@"size"];

      [v3 addObject:v7];
      ++v6;
      ++v5;
      ++v4;
    }

    while (v6 < self->zone_names_count);
  }

  return v3;
}

- (id)vmRegionInfo
{
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)OSKextCopyLoadedKextInfo();
  objc_msgSend(MEMORY[0x189603FC8], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1895F87A8];
  v29[1] = 3221225472LL;
  v29[2] = __34__OSAWiredMemoryInfo_vmRegionInfo__block_invoke;
  v29[3] = &unk_189E212C0;
  v26 = v3;
  id v27 = v4;
  id v30 = v27;
  [v3 enumerateKeysAndObjectsUsingBlock:v29];
  CSSymbolicatorCreateWithMachKernel();
  if (self->wired_info_count)
  {
    uint64_t v5 = 0LL;
    unint64_t v6 = 0LL;
    do
    {
      [MEMORY[0x189603FC8] dictionaryWithCapacity:11];
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189607968] numberWithUnsignedLongLong:self->wired_info[v5].flags];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setObject:v8 forKeyedSubscript:@"flags"];

      [MEMORY[0x189607968] numberWithUnsignedLongLong:self->wired_info[v5].site];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setObject:v9 forKeyedSubscript:@"site"];

      [MEMORY[0x189607968] numberWithUnsignedLongLong:self->wired_info[v5].size];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setObject:v10 forKeyedSubscript:@"size"];

      [MEMORY[0x189607968] numberWithUnsignedLongLong:self->wired_info[v5].free];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setObject:v11 forKeyedSubscript:@"free"];

      [MEMORY[0x189607968] numberWithUnsignedLongLong:self->wired_info[v5].largest];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setObject:v12 forKeyedSubscript:@"largest"];

      [MEMORY[0x189607968] numberWithUnsignedLongLong:self->wired_info[v5].collectable_bytes];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setObject:v13 forKeyedSubscript:@"collectable_bytes"];

      [MEMORY[0x189607968] numberWithUnsignedLongLong:self->wired_info[v5].mapped];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setObject:v14 forKeyedSubscript:@"mapped"];

      [MEMORY[0x189607968] numberWithUnsignedLongLong:self->wired_info[v5].peak];
      objc_super v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setObject:v15 forKeyedSubscript:@"peak"];

      [MEMORY[0x189607968] numberWithUnsignedShort:self->wired_info[v5].tag];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setObject:v16 forKeyedSubscript:@"tag"];

      [MEMORY[0x189607968] numberWithUnsignedShort:self->wired_info[v5].zone];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setObject:v17 forKeyedSubscript:@"zone"];

      wired_info = self->wired_info;
      if ((wired_info[v5].flags & 0x400) != 0)
      {
        v20 = (void *)NSString;
        uint64_t name = (uint64_t)wired_info[v5].name;
      }

      else
      {
        switch(wired_info[v5].flags)
        {
          case 0u:
            uint64_t v19 = -[OSAWiredMemoryInfo getTagNameForSite:](self, "getTagNameForSite:", wired_info[v5].site);
            goto LABEL_8;
          case 1u:
            [MEMORY[0x189607968] numberWithUnsignedLongLong:wired_info[v5].site];
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            [v27 objectForKeyedSubscript:v23];
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22) {
              goto LABEL_9;
            }
            goto LABEL_10;
          case 2u:
            if ((CSIsNull() & 1) != 0) {
              goto LABEL_10;
            }
            CSSymbolicatorGetSymbolWithAddressAtTime();
            if ((CSIsNull() & 1) != 0) {
              goto LABEL_10;
            }
            uint64_t v24 = CSSymbolGetName();
            if (!v24) {
              goto LABEL_10;
            }
            uint64_t name = v24;
            v20 = (void *)NSString;
            break;
          case 3u:
            uint64_t v19 = -[OSAWiredMemoryInfo getCounterNameForSite:](self, "getCounterNameForSite:", wired_info[v5].site);
            goto LABEL_8;
          default:
            goto LABEL_10;
        }
      }

      uint64_t v19 = [v20 stringWithUTF8String:name];
LABEL_8:
      v22 = (void *)v19;
      if (v19)
      {
LABEL_9:
        [v7 setObject:v22 forKeyedSubscript:@"name"];
        [v28 addObject:v7];
      }

void __34__OSAWiredMemoryInfo_vmRegionInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  [a3 objectForKeyedSubscript:@"OSBundleLoadTag"];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
}

- (id)getTagNameForSite:(unint64_t)a3
{
  if ([&unk_189E31E20 count] <= a3)
  {
    if (a3 == 255)
    {
      uint64_t v4 = @"VM_KERN_MEMORY_ANY";
    }

    else if (a3 == 256)
    {
      uint64_t v4 = @"VM_KERN_MEMORY_COUNT";
    }

    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"VM_KERN_MEMORY_%lld", a3);
      uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    [&unk_189E31E38 objectAtIndexedSubscript:a3];
    uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)getCounterNameForSite:(unint64_t)a3
{
  if ([&unk_189E31E50 count] <= a3) {
    objc_msgSend(NSString, "stringWithFormat:", @"VM_KERN_COUNT_%lld", a3);
  }
  else {
    [&unk_189E31E68 objectAtIndexedSubscript:a3];
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
@interface CLPCReportingClient
- (BOOL)enableStats:(id)a3 error:(id *)a4;
- (BOOL)enableStats:error:;
- (__n128)buildSchemas:error:;
- (__n128)convertSampleList:error:;
- (__n128)enableStats:error:;
- (id).cxx_construct;
- (id)convertSampleList:(uint64_t)a1 error:;
- (id)enabledStats;
- (id)init:(id *)a3;
- (id)readDeltaStats:(id *)a3;
- (id)readStats:(id *)a3;
- (id)supportedStats;
- (uint64_t)buildSchemas:(void *)a3 error:;
- (uint64_t)buildSchemas:error:;
- (uint64_t)convertSampleList:error:;
- (uint64_t)enableStats:error:;
- (uint64_t)ensureStatsEnabled:(uint64_t)result;
- (uint64_t)init:;
- (uint64_t)obfuscate:(uint64_t)a3 context:(void *)a4 data:(void *)a5 bundle:;
- (unint64_t)schemaIDForStatID:(unint64_t)a3 error:(id *)a4;
- (void)buildSchemas:error:;
- (void)clearSchemas;
- (void)convertSampleList:error:;
- (void)enableStats:error:;
- (void)init:;
@end

@implementation CLPCReportingClient

- (id)init:(id *)a3
{
  v54[1] = *MEMORY[0x1895F89C0];
  v49.receiver = self;
  v49.super_class = (Class)&OBJC_CLASS___CLPCReportingClient;
  v50 = 0LL;
  v4 = -[CLPCUserClient init:](&v49, sel_init_);
  v5 = v4;
  v50 = (char *)v4;
  if (v4)
  {
    v6 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFProperty = (void *)IORegistryEntryCreateCFProperty( v4[4],  @"CFBundleIdentifierKernel",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
    if (!CFProperty || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v12 = 0LL;
LABEL_61:

      return v12;
    }

    [CFProperty dataUsingEncoding:4];
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v42)
    {
      v12 = 0LL;
LABEL_60:

      goto LABEL_61;
    }

    v41 = (void *)IORegistryEntryCreateCFProperty(v5[4], @"#cpu-num-clusters", v6, 0);
    if (!v41 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v12 = 0LL;
LABEL_59:

      goto LABEL_60;
    }

    v5[10] = [v41 unsignedIntValue];
    v39 = (void *)IORegistryEntryCreateCFProperty(v5[4], @"#cpu-num-cores", v6, 0);
    if (!v39 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v12 = 0LL;
LABEL_58:

      goto LABEL_59;
    }

    v5[13] = [v39 unsignedIntValue];
    clpc::user::iokit::RegistryEntry::createProperty( (clpc::user::iokit::RegistryEntry *)(v5 + 2),  @"#ane-num-clusters");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v35 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v12 = 0LL;
LABEL_57:

      goto LABEL_58;
    }

    v5[11] = [v35 unsignedIntValue];
    for (uint64_t i = 1LL; ; uint64_t i = v5[12] + 1)
    {
      v5[12] = i;
      objc_msgSend(NSString, "stringWithFormat:", @"#pkg-power-zone-target-%u", i);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)IORegistryEntryCreateCFProperty(v5[4], v9, v6, 0);
      BOOL v11 = v10 == 0LL;

      if (v11) {
        break;
      }
    }

    memcpy(__dst, "emit", sizeof(__dst));
    std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__assign_unique<std::pair<unsigned int const,CLPCReportingStatID> const*>( (void *)v5 + 7,  (uint64_t)__dst,  (uint64_t)v54);
    if (v5[10])
    {
      unint64_t v13 = 0LL;
      v36 = a3;
      v37 = CFProperty;
      do
      {
        int v14 = 48;
        if (v13 > 9) {
          int v14 = 87;
        }
        int v15 = v14 + v13;
        v16 = (_DWORD *)((v14 + v13) | 0x7F0400004C506300LL);
        __dst[0] = v16;
        LODWORD(__dst[1]) = 2;
        *(void *)&__int128 v46 = __dst;
        std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>( (uint64_t)(v5 + 14),  (unsigned int *)__dst,  (uint64_t)&std::piecewise_construct,  (_DWORD **)&v46)[3] = 0x400000001LL;
        v5 = (io_registry_entry_t *)v50;
        v17 = v50 + 96;
        __dst[0] = v16;
        LODWORD(__dst[1]) = 2;
        *(void *)&__int128 v46 = __dst;
        *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>( (uint64_t)(v50 + 96),  (unsigned int *)__dst,  (uint64_t)&std::piecewise_construct,  (_DWORD **)&v46)
        + 5) = v13;
        LODWORD(__dst[0]) = 1128489776;
        WORD2(__dst[0]) = 0;
        BYTE6(__dst[0]) = 6;
        *(_WORD *)((char *)__dst + 7) = 639;
        uint64_t v18 = v15 & 0xFFFF9CFF;
        *(void *)&__int128 v46 = v18 | 0x6300 | (unint64_t)__dst[0] & 0xFFFFFFFFFFFF0000LL;
        DWORD2(v46) = __dst[1];
        __dst[0] = &v46;
        std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>( (uint64_t)(v5 + 14),  (unsigned int *)&v46,  (uint64_t)&std::piecewise_construct,  __dst)[3] = 0x600000000LL;
        LODWORD(__dst[0]) = 1128489776;
        WORD2(__dst[0]) = 0;
        BYTE6(__dst[0]) = 6;
        *(_WORD *)((char *)__dst + 7) = 639;
        *(void *)&__int128 v46 = v18 | 0x6300 | (unint64_t)__dst[0] & 0xFFFFFFFFFFFF0000LL;
        DWORD2(v46) = __dst[1];
        __dst[0] = &v46;
        *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>( (uint64_t)v17,  (unsigned int *)&v46,  (uint64_t)&std::piecewise_construct,  __dst)
        + 5) = v13++;
        a3 = v36;
        CFProperty = v37;
      }

      while (v13 < v5[10]);
    }

    if (v5[11])
    {
      unint64_t v19 = 0LL;
      do
      {
        if (v19 <= 9) {
          int v20 = 48;
        }
        else {
          int v20 = 87;
        }
        v21 = (_DWORD *)((v20 + v19) | 0x7F040000414C6300LL);
        __dst[0] = v21;
        LODWORD(__dst[1]) = 2;
        *(void *)&__int128 v46 = __dst;
        std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>( (uint64_t)(v5 + 14),  (unsigned int *)__dst,  (uint64_t)&std::piecewise_construct,  (_DWORD **)&v46)[3] = 0x400000003LL;
        v5 = (io_registry_entry_t *)v50;
        __dst[0] = v21;
        LODWORD(__dst[1]) = 2;
        *(void *)&__int128 v46 = __dst;
        *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>( (uint64_t)(v50 + 96),  (unsigned int *)__dst,  (uint64_t)&std::piecewise_construct,  (_DWORD **)&v46)
        + 5) = v19++;
      }

      while (v19 < v5[11]);
    }

    uint64_t v38 = CCDigestCreate();
    v40 = -[io_registry_entry_t reportingObfuscationData:](v5, "reportingObfuscationData:", a3);
    if (!v38 || !v40 || (unint64_t)[v40 length] <= 0x1F)
    {
      v12 = 0LL;
LABEL_56:

      goto LABEL_57;
    }

    memset(__dst, 0, 32);
    LODWORD(__dst[4]) = 1065353216;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    float v48 = 1.0;
    v22 = (unint64_t *)v50;
    v23 = v50 + 56;
    std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__rehash<true>( (uint64_t)__dst,  (unint64_t)(float)*((unint64_t *)v50 + 10));
    std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__rehash<true>( (uint64_t)&v46,  vcvtps_u32_f32((float)v22[15] / v48));
    v24 = (unsigned int *)*((void *)v23 + 2);
    if (v24)
    {
      do
      {
        v25 = v50;
        unsigned int v45 = -[CLPCReportingClient obfuscate:context:data:bundle:]((uint64_t)v50, v24[4], v38, v40, v42);
        uint64_t v26 = *((void *)v24 + 3);
        v43 = &v45;
        std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>( (uint64_t)__dst,  &v45,  (uint64_t)&std::piecewise_construct,  &v43)[3] = v26;
        v27 = std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::find<unsigned int>( (void *)v25 + 12,  v24 + 4);
        if (v27)
        {
          int v28 = *((_DWORD *)v27 + 5);
          v43 = &v45;
          *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>( (uint64_t)&v46,  &v45,  (uint64_t)&std::piecewise_construct,  &v43)
          + 5) = v28;
        }

        v24 = *(unsigned int **)v24;
      }

      while (v24);
      v22 = (unint64_t *)v50;
    }

    if (v22 + 7 != (unint64_t *)__dst)
    {
      *((_DWORD *)v22 + 22) = __dst[4];
      std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<unsigned int,CLPCReportingStatID>,void *> *>>( v22 + 7,  (uint64_t *)__dst[2],  0LL);
      v22 = (unint64_t *)v50;
    }

    if (v22 + 12 != (unint64_t *)&v46)
    {
      *((float *)v22 + 32) = v48;
      std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<unsigned int,unsigned int>,void *> *>>( v22 + 12,  (uint64_t *)v47,  0LL);
    }

    CCDigestDestroy();
    v29 = (float *)v50;
    clpc::user::ioreport::ChannelList::fromProvider((uint64_t)&v43);
    if (!v44)
    {
      v12 = 0LL;
LABEL_55:
      std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v46);
      std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)__dst);
      goto LABEL_56;
    }

    int ChannelCount = IOReportGetChannelCount();
    unsigned int v31 = ChannelCount & ~(ChannelCount >> 31);
    if (ChannelCount < 0) {
      unsigned int v31 = 2;
    }
    std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__rehash<true>( (uint64_t)(v29 + 34),  vcvtps_u32_f32((float)v31 / v29[42]));
    v51[0] = off_18A2C4250;
    v51[1] = &v50;
    v52 = v51;
    clpc::user::ioreport::ChannelList::iterate((uint64_t)&v43, (uint64_t)v51);
    v32 = v52;
    if (v52 == v51)
    {
      uint64_t v33 = 4LL;
      v32 = v51;
    }

    else
    {
      if (!v52) {
        goto LABEL_53;
      }
      uint64_t v33 = 5LL;
    }

    (*(void (**)(void))(*v32 + 8 * v33))();
LABEL_53:
    *((void *)v50 + 23) = *((void *)v50 + 22);
    v12 = v50;
    if (v44) {

    }
    goto LABEL_55;
  }

  return 0LL;
}

- (uint64_t)obfuscate:(uint64_t)a3 context:(void *)a4 data:(void *)a5 bundle:
{
  id v7 = a4;
  id v8 = a5;
  if (a1)
  {
    id v9 = v7;
    [v9 bytes];
    CCDigestUpdate();
    id v10 = v8;
    [v10 bytes];
    [v10 length];
    CCDigestUpdate();
    CCDigestUpdate();
    [v9 bytes];
    CCDigestUpdate();
    CCDigestFinal();
    CCDigestReset();
  }

  return 0LL;
}

- (unint64_t)schemaIDForStatID:(unint64_t)a3 error:(id *)a4
{
  if (!(a3 >> 35)) {
    return BYTE4(a3);
  }
  return 0LL;
}

- (id)supportedStats
{
  v3 = (_BYTE *)objc_opt_new();
  for (uint64_t i = self->available_stat_ids.__table_.__p1_.__value_.__next_; i; uint64_t i = (void *)*i)
  {
    if (v3)
    {
      uint64_t v5 = 0LL;
      {
        if (++v5 == 25) {
          goto LABEL_8;
        }
      }

      v3[v5 + 8] = 1;
    }

- (id)enabledStats
{
  v3 = (_BYTE *)objc_opt_new();
  begin = self->configured_stat_ids.__begin_;
  for (uint64_t i = self->configured_stat_ids.__end_; begin != i; ++begin)
  {
    if (v3)
    {
      uint64_t v6 = 0LL;
      {
        if (++v6 == 25) {
          goto LABEL_8;
        }
      }

      v3[v6 + 8] = 1;
    }

- (BOOL)enableStats:(id)a3 error:(id *)a4
{
  uint64_t v72 = *MEMORY[0x1895F89C0];
  uint64_t v6 = a3;
  p_configured_stat_ids = &self->configured_stat_ids;
  self->configured_stat_ids.__end_ = self->configured_stat_ids.__begin_;
  channels = self->reporting_channels.channels;
  self->reporting_channels.channels = 0LL;

  unint64_t v65 = (unint64_t)off_18A2C3FB8;
  v67 = 0LL;
  subscribed_channels = self->reporting_subscription.subscribed_channels;
  p_subscribed_channels = &self->reporting_subscription.subscribed_channels;
  p_reporting_subscription = &self->reporting_subscription;
  self->reporting_subscription.subscription = 0LL;
  self->reporting_subscription.subscribed_channels = 0LL;

  uint64_t v66 = 0LL;
  clpc::user::ioreport::Subscription::~Subscription((clpc::user::ioreport::Subscription *)&v65);
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  int v52 = 1065353216;
  v43 = v6;
  -[CLPCReportingStatSelection selectedStats]((uint64_t)v6, (uint64_t)&v65);
  for (uint64_t i = v67; i; uint64_t i = *(uint64_t (**)(uint64_t, CFTypeRef))i)
  {
    *(void *)&__int128 v47 = *((void *)i + 2);
    if (std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::find<CLPCReportingStatID>( &self->available_stat_ids.__table_.__bucket_list_.__ptr_.__value_,  (unint64_t *)&v47))
    {
      std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__emplace_unique_key_args<CLPCReportingStatID,CLPCReportingStatID const&>( (uint64_t)&v50,  (unint64_t *)&v47,  &v47);
    }
  }

  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&v65);
  unint64_t v65 = 1LL;
  if (std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::find<CLPCReportingStatID>( &self->available_stat_ids.__table_.__bucket_list_.__ptr_.__value_,  &v65))
  {
    unint64_t v65 = 1LL;
    std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__emplace_unique_key_args<CLPCReportingStatID,CLPCReportingStatID const&>( (uint64_t)&v50,  &v65,  &v65);
  }

  [v6 deselectAll];
  location = &self->reporting_channels;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  int v49 = 1065353216;
  std::__hash_table<CLPCReportingStatID,std::hash<CLPCReportingStatID>,std::equal_to<CLPCReportingStatID>,std::allocator<CLPCReportingStatID>>::__rehash<true>( (uint64_t)&v47,  (unint64_t)(float)(*((void *)&v51 + 1) + (unint64_t)(4 * self->num_cpu_clusters)));
  BOOL v11 = (void *)v51;
  if ((void)v51)
  {
    while (1)
    {
      next = (unsigned int *)self->channel_to_stat_map.__table_.__p1_.__value_.__next_;
      if (!next) {
        break;
      }
      int v13 = 0;
      uint64_t v14 = v11[2];
      do
      {
        if (*((void *)next + 3) == v14)
        {
          std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int const&>( (uint64_t)&v47,  next + 4,  next + 4);
          ++v13;
        }

        next = *(unsigned int **)next;
      }

      while (next);
      if (!v13) {
        break;
      }
      BOOL v11 = (void *)*v11;
      if (!v11) {
        goto LABEL_15;
      }
    }

    goto LABEL_20;
  }

- (uint64_t)ensureStatsEnabled:(uint64_t)result
{
  v5[1] = *MEMORY[0x1895F89C0];
  if (result)
  {
    if (*(void *)(result + 184) == *(void *)(result + 176))
    {
      if (a2)
      {
        uint64_t v4 = *MEMORY[0x189607490];
        v5[0] = @"No stats enabled.";
        [MEMORY[0x189603F68] dictionaryWithObjects:v5 forKeys:&v4 count:1];
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        [MEMORY[0x189607870] errorWithDomain:@"CLPCErrorDomain" code:-536870206 userInfo:v3];
        *a2 = (id)objc_claimAutoreleasedReturnValue();
      }

      return 0LL;
    }

    else
    {
      return 1LL;
    }
  }

  return result;
}

- (void)clearSchemas
{
  if (result)
  {
    v1 = result;
    id v6 = 0LL;
    std::array<CLPCReportingRows * {__strong},8ul>::fill[abi:ne180100]((uint64_t)(result + 25), &v6);

    uint64_t v2 = [MEMORY[0x189603F18] array];
    v3 = (void *)v1[33];
    v1[33] = v2;

    uint64_t v4 = 0LL;
    uint64_t v5 = v1 + 34;
    do
    {
      result = std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::clear(&v5[v4]);
      v4 += 5LL;
    }

    while (v4 != 40);
  }

  return result;
}

- (uint64_t)buildSchemas:(void *)a3 error:
{
  uint64_t v62 = *MEMORY[0x1895F89C0];
  uint64_t v46 = a1;
  if (!a1) {
    return 0LL;
  }
  if (![*(id *)(a1 + 264) count])
  {
    -[CLPCReportingClient clearSchemas]((void *)a1);
    unsigned int v45 = &v46;
    uint64_t v52 = 0LL;
    uint64_t v53 = 0LL;
    id v6 = *(unint64_t **)(a1 + 176);
    for (uint64_t i = *(unint64_t **)(a1 + 184); v6 != i; ++v6)
    {
      unint64_t v7 = *v6;
      if (*v6 >> 35)
      {
LABEL_39:
        return 0LL;
      }

      if (!BYTE4(v7)) {
        continue;
      }
      *((_BYTE *)&v52 + BYTE4(v7)) = 1;
      if (BYTE4(v7) > 7u || ((1 << SBYTE4(v7)) & 0x8E) == 0) {
        continue;
      }
      __int128 v48 = 0LL;
      unint64_t v49 = v7;
      __int128 v47 = 0LL;
      id v55 = 0LL;
      id v9 = operator new(0x28uLL);
      void *v9 = off_18A2C4190;
      v9[1] = &v46;
      id v10 = v9 + 1;
      v9[2] = &v49;
      v9[3] = &v48;
      v9[4] = &v47;
      id v55 = v9;
      uint64_t v56 = MEMORY[0x1895F87A8];
      uint64_t v57 = 3321888768LL;
      uint64_t v58 = ___ZN4clpc4user8ioreport10SampleList7iterateENSt3__18functionIFvNS1_6SampleEEEE_block_invoke;
      v59 = &__block_descriptor_64_ea8_32c54_ZTSNSt3__18functionIFvN4clpc4user8ioreport6SampleEEEE_e25_i16__0____CFDictionary__8l;
      BOOL v11 = (char *)operator new(0x28uLL);
      *(void *)BOOL v11 = off_18A2C4190;
      __int128 v12 = v10[1];
      *(_OWORD *)(v11 + 8) = *v10;
      *(_OWORD *)(v11 + 24) = v12;
      __int128 v61 = v11;
      IOReportIterate();
      uint64_t v14 = v61;
      if (v61 == v60)
      {
        uint64_t v14 = v60;
        uint64_t v15 = 4LL;
      }

      else
      {
        if (!v61) {
          goto LABEL_16;
        }
        uint64_t v15 = 5LL;
      }

      (*(void (**)(void *, uint64_t))(*v14 + 8 * v15))(v14, v13);
LABEL_16:
      v16 = v55;
      if (v55 == v54)
      {
        v16 = v54;
        uint64_t v17 = 4LL;
        goto LABEL_20;
      }

      if (v55)
      {
        uint64_t v17 = 5LL;
LABEL_20:
        (*(void (**)(void *, uint64_t))(*v16 + 8 * v17))(v16, v13);
      }

      BOOL v19 = v47;
      uint64_t v18 = v48;
      if ((-[CLPCReportingClient buildSchemas:error:]::$_7::operator()(&v45, BYTE4(v7), 1LL, v7, 0LL, v47, v48) & 1) == 0)
      {

        return 0LL;
      }
    }

    for (uint64_t j = 0LL; j != 4; ++j)
    {
      uint64_t v21 = qword_18897BB28[j];
      if (*((_BYTE *)&v52 + v21)
        && (-[CLPCReportingClient buildSchemas:error:]::$_7::operator()(&v45, v21, 1LL, 1uLL, 0LL, 0LL, @"Time") & 1) == 0)
      {
        goto LABEL_39;
      }
    }

    for (uint64_t k = 0LL; k != 3; ++k)
    {
      uint64_t v23 = qword_18897BB10[k];
      if (*((_BYTE *)&v52 + v23)
        && (-[CLPCReportingClient buildSchemas:error:]::$_7::operator()(&v45, v23, 2LL, 0LL, 1LL, 0LL, @"ID") & 1) == 0)
      {
        goto LABEL_39;
      }
    }

    for (uint64_t m = 0LL; m != 4; ++m)
    {
      uint64_t v25 = qword_18897BB28[m];
      if (*((_BYTE *)&v52 + v25)) {
        -[CLPCReportingSchema finalizeColumns](*(void *)(v46 + 200 + 8 * v25));
      }
      v54[v25 - 8] = 1;
    }

    v54[0] = 1;
    uint64_t v26 = operator new(0x40uLL);
    *uint64_t v26 = off_18A2C4370;
    v26[1] = &v46;
    v27 = v26 + 1;
    v26[2] = v54;
    v26[3] = &v53;
    v26[4] = &v52;
    v26[5] = &v44;
    v26[6] = &v45;
    v26[7] = &v43;
    __int128 v51 = v26;
    uint64_t v56 = MEMORY[0x1895F87A8];
    uint64_t v57 = 3321888768LL;
    uint64_t v58 = ___ZN4clpc4user8ioreport10SampleList7iterateENSt3__18functionIFvNS1_6SampleEEEE_block_invoke;
    v59 = &__block_descriptor_64_ea8_32c54_ZTSNSt3__18functionIFvN4clpc4user8ioreport6SampleEEEE_e25_i16__0____CFDictionary__8l;
    int v28 = (char *)operator new(0x40uLL);
    uint64_t v29 = v60;
    *(void *)int v28 = off_18A2C4370;
    __int128 v30 = *((_OWORD *)v27 + 1);
    *(_OWORD *)(v28 + 8) = *(_OWORD *)v27;
    *(_OWORD *)(v28 + 24) = v30;
    *(_OWORD *)(v28 + 40) = *((_OWORD *)v27 + 2);
    *((void *)v28 + 7) = v27[6];
    __int128 v61 = v28;
    IOReportIterate();
    if (v61 == v60)
    {
      uint64_t v32 = 4LL;
    }

    else
    {
      if (!v61) {
        goto LABEL_45;
      }
      uint64_t v32 = 5LL;
      uint64_t v29 = v61;
    }

    (*(void (**)(void *))(*v29 + 8 * v32))(v29);
LABEL_45:
    v34 = v51;
    if (v51 == v50)
    {
      uint64_t v35 = 4LL;
      v34 = v50;
    }

    else
    {
      if (!v51) {
        goto LABEL_50;
      }
      uint64_t v35 = 5LL;
    }

    (*(void (**)(void *, uint64_t))(*v34 + 8 * v35))(v34, v31);
LABEL_50:
    BOOL v4 = v54[0] != 0;
    if (v54[0])
    {
      objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", 8, a3, a2);
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
      for (uint64_t n = 0LL; n != 64; n += 8LL)
      {
        uint64_t v38 = *(void *)(v46 + 200 + n);
        if (v38 && [*(id *)(v38 + 24) count]) {
          [v36 addObject:*(void *)(v46 + 200 + n)];
        }
      }

      uint64_t v39 = [MEMORY[0x189603F18] arrayWithArray:v36];
      v40 = *(void **)(v46 + 264);
      *(void *)(v46 + 264) = v39;
    }

    else
    {
    }

    return v4;
  }

  return 1LL;
}

- (uint64_t)buildSchemas:error:
{
  {
    return a1 + 8;
  }

  else
  {
    return 0LL;
  }

- (id)convertSampleList:(uint64_t)a1 error:
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  uint64_t v33 = a1;
  if (!a1) {
    return 0LL;
  }
  uint64_t v1 = 0LL;
  uint64_t v32 = 0LL;
  memset(v31, 0, sizeof(v31));
  do
  {
    uint64_t v2 = *(void *)(v33 + 200 + v1);
    if (v2 && [*(id *)(v2 + 24) count])
    {
      uint64_t v3 = [MEMORY[0x189603FA8] array];
      BOOL v4 = *(void **)((char *)v31 + v1);
      *(void *)((char *)v31 + v1) = v3;
    }

    v1 += 8LL;
  }

  while (v1 != 64);
  v30[0] = &v33;
  v30[1] = v31;
  uint64_t v36 = 0LL;
  uint64_t v5 = operator new(0x28uLL);
  void *v5 = off_18A2C43F0;
  v5[1] = &v33;
  id v6 = v5 + 1;
  void v5[2] = &v32;
  v5[3] = v30;
  v5[4] = v31;
  uint64_t v36 = v5;
  v37[0] = (void *)MEMORY[0x1895F87A8];
  v37[1] = (void *)3321888768LL;
  v37[2] = ___ZN4clpc4user8ioreport10SampleList7iterateENSt3__18functionIFvNS1_6SampleEEEE_block_invoke;
  v37[3] = &__block_descriptor_64_ea8_32c54_ZTSNSt3__18functionIFvN4clpc4user8ioreport6SampleEEEE_e25_i16__0____CFDictionary__8l;
  unint64_t v7 = (char *)operator new(0x28uLL);
  id v8 = v38;
  *(void *)unint64_t v7 = off_18A2C43F0;
  __int128 v9 = v6[1];
  *(_OWORD *)(v7 + 8) = *v6;
  *(_OWORD *)(v7 + 24) = v9;
  uint64_t v39 = v7;
  IOReportIterate();
  if (v39 == v38)
  {
    uint64_t v10 = 4LL;
  }

  else
  {
    if (!v39) {
      goto LABEL_12;
    }
    uint64_t v10 = 5LL;
    id v8 = v39;
  }

  (*(void (**)(void *))(*v8 + 8 * v10))(v8);
LABEL_12:
  BOOL v11 = v36;
  if (v36 == v35)
  {
    uint64_t v12 = 4LL;
    BOOL v11 = v35;
  }

  else
  {
    if (!v36) {
      goto LABEL_17;
    }
    uint64_t v12 = 5LL;
  }

  (*(void (**)(void))(*v11 + 8 * v12))();
LABEL_17:
  uint64_t v13 = (void *)objc_opt_new();
  [MEMORY[0x189607968] numberWithLongLong:v32];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  for (uint64_t i = 0LL; i != 8; ++i)
  {
    uint64_t v16 = *(void *)(v33 + 200 + 8 * i);
    if (v16 && [*(id *)(v16 + 24) count])
    {
      unint64_t v29 = 1LL;
      v37[0] = &v29;
      uint64_t v17 = std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>( v33 + 272 + 40 * i,  &v29,  (uint64_t)&std::piecewise_construct,  v37)[3];
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      id v18 = *((id *)v31 + i);
      uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v34 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v26;
        do
        {
          for (uint64_t j = 0LL; j != v19; ++j)
          {
            if (*(void *)v26 != v20) {
              objc_enumerationMutation(v18);
            }
            [*(id *)(*((void *)&v25 + 1) + 8 * j) setObject:v14 atIndexedSubscript:v17];
          }

          uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v34 count:16];
        }

        while (v19);
      }

      v22 = (void *)objc_opt_new();
      [v22 setSchema:*(void *)(v33 + 200 + 8 * i)];
      [v22 setRows:*((void *)v31 + i)];
      -[CLPCReportingReadResult setStatRows:forIndex:]((uint64_t)v13, v22, i);
    }
  }

  for (uint64_t k = 56LL; k != -8; k -= 8LL)
  return v13;
}

- (id)readStats:(id *)a3
{
  v11[1] = 0LL;
  Samples = (void *)IOReportCreateSamples();
  if (!Samples) {
    return 0LL;
  }
  id v6 = Samples;
  v11[0] = v6;
  char v7 = -[CLPCReportingClient buildSchemas:error:]((uint64_t)self, (uint64_t)v11, a3);

  if ((v7 & 1) != 0)
  {
    id v10 = v6;
    -[CLPCReportingClient convertSampleList:error:]((uint64_t)self);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (id)readDeltaStats:(id *)a3
{
  id v18 = 0LL;
  Samples = (void *)IOReportCreateSamples();
  if (!Samples) {
    return 0LL;
  }
  id v6 = Samples;
  id v17 = v6;
  char v7 = -[CLPCReportingClient buildSchemas:error:]((uint64_t)self, (uint64_t)&v17, a3);

  if ((v7 & 1) != 0)
  {
    p_prev_sample_list = &self->prev_sample_list;
    __int128 v9 = self->prev_sample_list.samples;
    if (v9)
    {
      id v10 = v9;
      id v18 = 0LL;
      SamplesDelta = (void *)IOReportCreateSamplesDelta();
      if (v18) {
        *a3 = v18;
      }

      if (SamplesDelta)
      {
        objc_storeStrong((id *)&self->prev_sample_list.samples, Samples);
        uint64_t v12 = SamplesDelta;
        -[CLPCReportingClient convertSampleList:error:]((uint64_t)self);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v15 = (NSMutableDictionary *)v6;
        uint64_t v13 = 0LL;
        uint64_t v12 = p_prev_sample_list->samples;
        p_prev_sample_list->samples = v15;
      }
    }

    else
    {
      objc_storeStrong((id *)&self->prev_sample_list.samples, Samples);
      uint64_t v16 = (NSMutableDictionary *)v6;
      -[CLPCReportingClient convertSampleList:error:]((uint64_t)self);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = v16;
    }
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  return v13;
}

- (void).cxx_destruct
{
  clpc::user::ioreport::Subscription::~Subscription((clpc::user::ioreport::Subscription *)&self->reporting_subscription);
  for (uint64_t i = 280LL; i != -40; i -= 40LL)
    std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&self->schema_column_maps + i);
  objc_storeStrong((id *)&self->compactedSchemas, 0LL);
  for (uint64_t j = 7LL; j != -1; --j)

  begiuint64_t n = self->configured_stat_ids.__begin_;
  if (begin)
  {
    self->configured_stat_ids.__end_ = begin;
    operator delete(begin);
  }

  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&self->available_stat_ids);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&self->channel_to_cluster_map);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)&self->channel_to_stat_map);
}

- (id).cxx_construct
{
  uint64_t v2 = 0LL;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *((_DWORD *)self + 22) = 1065353216;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_DWORD *)self + 32) = 1065353216;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *((_DWORD *)self + 42) = 1065353216;
  *((void *)self + 23) = 0LL;
  *((void *)self + 24) = 0LL;
  *((void *)self + 22) = 0LL;
  *(_OWORD *)((char *)self + 232) = 0u;
  *(_OWORD *)((char *)self + 248) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 216) = 0u;
  do
  {
    uint64_t v3 = (char *)self + v2 + 272;
    *(_OWORD *)uint64_t v3 = 0uLL;
    *((_OWORD *)v3 + 1) = 0uLL;
    *((_DWORD *)v3 + 8) = 1065353216;
    v2 += 40LL;
  }

  while (v2 != 320);
  *((void *)self + 74) = 0LL;
  *((void *)self + 75) = off_18A2C3FB8;
  *((void *)self + 76) = 0LL;
  *((void *)self + 77) = 0LL;
  *((void *)self + 78) = 0LL;
  return self;
}

- (__n128)buildSchemas:error:
{
  *(void *)a2 = off_18A2C4370;
  __n128 result = *(__n128 *)(a1 + 8);
  __int128 v3 = *(_OWORD *)(a1 + 24);
  __int128 v4 = *(_OWORD *)(a1 + 40);
  *(void *)(a2 + 56) = *(void *)(a1 + 56);
  *(_OWORD *)(a2 + 40) = v4;
  *(_OWORD *)(a2 + 24) = v3;
  *(__n128 *)(a2 + 8) = result;
  return result;
}

- (void)buildSchemas:error:
{
}

- (void)init:
{
}

- (uint64_t)init:
{
  else {
    return 0LL;
  }
}

- (__n128)enableStats:error:
{
  *(void *)a2 = off_18A2C42E0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

- (BOOL)enableStats:error:
{
  __int128 v3 = *(void **)(a2 + 8);
  *(void *)(a2 + 8) = 0LL;
  v7[0] = &unk_18A2C4050;
  v7[1] = v3;
  unsigned int ChannelID = IOReportChannelGetChannelID();
  __int128 v4 = std::__hash_table<std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,CLPCReportingStatID>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,CLPCReportingStatID>>>::find<unsigned int>( *(void **)(a1 + 8),  &ChannelID);
  if (v4) {
    ++**(_DWORD **)(a1 + 16);
  }
  BOOL v5 = v4 != 0LL;
  clpc::user::ioreport::Channel::~Channel(v7);
  return v5;
}

- (uint64_t)enableStats:error:
{
  {
    return a1 + 8;
  }

  else
  {
    return 0LL;
  }

- (void)enableStats:error:
{
}

- (__n128)convertSampleList:error:
{
  *(void *)a2 = off_18A2C43F0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

- (void)convertSampleList:error:
{
  id v16 = a5;
  [*(id *)(**(void **)a1 + 200 + 8 * a2) columns];
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v10 = [v9 count];

  if (v10 > a4)
  {
    uint64_t v11 = *(void *)(a1 + 8);
    while ([*(id *)(v11 + 8 * a2) count] <= a3)
    {
      [MEMORY[0x189603FA8] arrayWithCapacity:v10];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      unsigned int v13 = 1;
      do
        [v12 addObject:&unk_18A2C5A78];
      while (v10 > v13++);
      [*(id *)(v11 + 8 * a2) addObject:v12];
    }

    [*(id *)(v11 + 8 * a2) objectAtIndexedSubscript:a3];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 setObject:v16 atIndexedSubscript:a4];
  }
}

- (uint64_t)convertSampleList:error:
{
  {
    return a1 + 8;
  }

  else
  {
    return 0LL;
  }

@end
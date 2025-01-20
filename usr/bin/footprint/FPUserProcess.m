@interface FPUserProcess
+ (unsigned)_dirtyFlagsFromEntryState:(unsigned int)a3;
- (BOOL)_configurePageSize;
- (BOOL)_isAlive;
- (BOOL)_populateMemoryRegionWithPageQueries:(id)a3 regionInfo:(vm_region_submap_info_64 *)a4;
- (BOOL)_populateTask;
- (FPUserProcess)initWithBsdInfo:(proc_bsdinfo *)a3;
- (id)_gatherOwnedVmObjects;
- (id)auxData;
- (id)extendedInfoForRegionType:(int)a3 at:(unint64_t)a4 extendedInfoProvider:(id)a5;
- (unint64_t)physFootprint;
- (unsigned)task;
- (void)_addSubrangesForRegion:(id)a3 purgeState:(int)a4;
- (void)_gatherImageData;
- (void)_gatherLedgers;
- (void)_gatherPhysFootprint;
- (void)_gatherProcessState;
- (void)_gatherSharedCacheFromDyldSnapshot:(dyld_process_snapshot_s *)a3;
- (void)_setIdleExitStatusFromDirtyFlags:(unsigned int)a3;
- (void)_setPriority:(int)a3;
- (void)addLedgerData:(unint64_t *)a3 count:(unint64_t)a4;
- (void)dealloc;
- (void)enumerateRegions:(id)a3;
- (void)gatherData:(unint64_t)a3 extendedInfoProvider:(id)a4;
@end

@implementation FPUserProcess

- (FPUserProcess)initWithBsdInfo:(proc_bsdinfo *)a3
{
  self->super._pid = a3->pbi_pid;
  -[FPUserProcess _gatherIsTranslated](self, "_gatherIsTranslated");
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___FPUserProcess;
  v5 = -[FPProcess initWithBsdInfo:](&v9, "initWithBsdInfo:", a3);
  if (v5)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    images = v5->_images;
    v5->_images = v6;

    -[FPUserProcess _gatherPhysFootprint](v5, "_gatherPhysFootprint");
    -[FPUserProcess _gatherLedgers](v5, "_gatherLedgers");
    -[FPUserProcess _gatherProcessState](v5, "_gatherProcessState");
  }

  return v5;
}

- (void)dealloc
{
  mach_port_name_t task = self->_task;
  if (task) {
    mach_port_deallocate(mach_task_self_, task);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___FPUserProcess;
  -[FPUserProcess dealloc](&v4, "dealloc");
}

- (void)gatherData:(unint64_t)a3 extendedInfoProvider:(id)a4
{
  unsigned int v4 = a3;
  id v63 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FPProcess memoryRegions](self, "memoryRegions"));

  if (!v5)
  {
    v6 = self;
    if (!-[FPUserProcess _configurePageSize](self, "_configurePageSize"))
    {
      self->_bailedOut = 1;
      v8 = __stderrp;
      images = (NSMutableArray *) objc_claimAutoreleasedReturnValue(-[FPProcess displayString](self, "displayString"));
      fprintf( v8,  "%s: skipping due to an error configuring page size for analysis\n",  (const char *)-[NSMutableArray UTF8String](images, "UTF8String"));
LABEL_62:

      goto LABEL_63;
    }

    if (-[FPProcess hiddenFromDisplay](self, "hiddenFromDisplay"))
    {
      id v7 = v63;
      if (!self)
      {
LABEL_61:

        images = self->_images;
        self->_images = 0LL;
        goto LABEL_62;
      }
    }

    else
    {
      v10 = objc_autoreleasePoolPush();
      -[FPUserProcess _gatherImageData](self, "_gatherImageData");
      objc_autoreleasePoolPop(v10);
      -[FPUserProcess _gatherPhysFootprint](self, "_gatherPhysFootprint");
      v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[FPUserProcess _gatherOwnedVmObjects](self, "_gatherOwnedVmObjects"));
      v6 = self;
      ownedVmObjects = self->_ownedVmObjects;
      self->_ownedVmObjects = v11;

      id v13 = v63;
    }

    int v14 = (v4 >> 1) & 1;
    int v15 = (v4 >> 2) & 1;
    v16 = sub_10000DE28((id *)objc_alloc(&OBJC_CLASS___FPImageEnumerator), v6->_images);
    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    unsigned __int8 v18 = -[FPProcess hiddenFromDisplay](v6, "hiddenFromDisplay");
    unsigned int v61 = -[FPProcess breakDownPhysFootprint](v6, "breakDownPhysFootprint");
    objc_opt_self(&OBJC_CLASS___FPFootprint);
    char v19 = byte_100038A50;
    unsigned int v60 = -[FPUserProcess doOwnedAccountingAdjustments](v6, "doOwnedAccountingAdjustments");
    uint64_t v96 = 0LL;
    v97 = &v96;
    uint64_t v98 = 0x2020000000LL;
    uint64_t v99 = 0LL;
    uint64_t v90 = 0LL;
    v91 = &v90;
    uint64_t v92 = 0x3032000000LL;
    v93 = sub_10000A7C8;
    v94 = sub_10000A7D8;
    id v95 = 0LL;
    sharedCache = v6->super._sharedCache;
    if (sharedCache) {
      __int128 v21 = *(_OWORD *)&sharedCache->_baseAddress;
    }
    else {
      __int128 v21 = 0uLL;
    }
    v77[0] = _NSConcreteStackBlock;
    v77[1] = 3221225472LL;
    v77[2] = sub_10000A7E0;
    v77[3] = &unk_1000291A0;
    __int128 v83 = v21;
    unsigned __int8 v84 = v18;
    v77[4] = self;
    v64 = v17;
    v78 = v64;
    char v85 = v61;
    v59 = v16;
    v79 = v59;
    v81 = &v90;
    char v86 = v14;
    char v87 = v15;
    char v88 = v60;
    id v80 = v63;
    v82 = &v96;
    char v89 = v19;
    -[FPUserProcess enumerateRegions:](self, "enumerateRegions:", v77);
    __int128 v75 = 0u;
    __int128 v76 = 0u;
    __int128 v73 = 0u;
    __int128 v74 = 0u;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectEnumerator](self->_ownedVmObjects, "objectEnumerator"));
    id v23 = [v22 countByEnumeratingWithState:&v73 objects:v100 count:16];
    if (!v23)
    {
LABEL_32:

      v39 = self->_ownedVmObjects;
      self->_ownedVmObjects = 0LL;

      v40 = (void *)v91[5];
      v41 = self;
      if (v40)
      {
        if (v60)
        {
          id v42 = [v40 dirtySize];
          if ((unint64_t)v42 >= v97[3])
          {
            [v91[5] setDirtySize:(char *)[v91[5] dirtySize] - v97[3]];
          }

          else
          {
            id v43 = [(id)v91[5] dirtySize];
            v97[3] -= (uint64_t)v43;
            [(id)v91[5] setDirtySize:0];
            id v44 = [(id)v91[5] swappedSize];
            v45 = v97;
            v46 = (void *)v91[5];
            if ((unint64_t)v44 >= v97[3])
            {
              v51 = (char *)[(id)v91[5] swappedSize] - v45[3];
            }

            else
            {
              id v47 = [(id)v91[5] swappedSize];
              uint64_t v48 = v97[3] - (void)v47;
              v97[3] = v48;
              warnings = self->super._warnings;
              v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Footprint changed while analyzing – unmapped owned physical footprint may be over-counted by %llu bytes",  v48));
              -[NSMutableArray addObject:](warnings, "addObject:", v50);

              v51 = 0LL;
              v46 = (void *)v91[5];
              v41 = self;
            }

            [v46 setSwappedSize:v51];
          }
        }

        id v52 = [(id)v91[5] dirtySize];
        if ((char *)[(id)v91[5] swappedSize] + (void)v52)
        {
          v53 = v91;
          uint64_t v54 = v91[5];
          if (v54)
          {
            *(void *)(v54 + 80) = -1LL;
            uint64_t v55 = v53[5];
          }

          else
          {
            uint64_t v55 = 0LL;
          }

          -[NSMutableArray addObject:](v64, "addObject:", v55);
        }
      }

      if (v61 && v41->_ledgers[0])
      {
        v56 = objc_alloc_init(&OBJC_CLASS___FPMemoryRegion);
        v57 = v56;
        if (v56) {
          v56->_size = v41->_ledgers[0];
        }
        -[FPMemoryRegion setDirtySize:](v56, "setDirtySize:", v41->_ledgers[0]);
        if (v57) {
          v57->_start = -1LL;
        }
        -[FPMemoryRegion setName:](v57, "setName:", @"page table");
        if (v57)
        {
          v57->_object_id = -1LL;
          v57->_share_mode = 2;
        }

        -[NSMutableArray addObject:](v64, "addObject:", v57);

        v41 = self;
      }

      if ((os_variant_has_internal_content("com.apple.footprint") & v61) == 1 && v41->_ledgers[3])
      {
        v58 = objc_alloc_init(&OBJC_CLASS___FPMemoryRegion);
        -[FPMemoryRegion setCleanSize:](v58, "setCleanSize:", v41->_ledgers[3]);
        if (v58) {
          v58->_start = -1LL;
        }
        -[FPMemoryRegion setName:](v58, "setName:", @"Conclave");
        if (v58)
        {
          v58->_object_id = -1LL;
          v58->_share_mode = 2;
        }

        -[NSMutableArray addObject:](v64, "addObject:", v58);

        v41 = self;
      }

      -[FPProcess setMemoryRegions:](v41, "setMemoryRegions:", v64);

      _Block_object_dispose(&v90, 8);
      _Block_object_dispose(&v96, 8);

      goto LABEL_61;
    }

    uint64_t v24 = *(void *)v74;
LABEL_12:
    uint64_t v25 = 0LL;
    while (1)
    {
      if (*(void *)v74 != v24) {
        objc_enumerationMutation(v22);
      }
      [*(id *)(*((void *)&v73 + 1) + 8 * v25) getBytes:v67 length:56];
      v26 = objc_alloc_init(&OBJC_CLASS___FPMemoryRegion);
      v27 = v26;
      if (v26)
      {
        v26->_object_id = v67[0];
        *((_BYTE *)v26 + 8) |= 8u;
        v26->_user_tag = -1;
      }

      v28 = sub_100005E10((uint64_t)&OBJC_CLASS___FPMemoryRegion, ((unint64_t)v72 >> 1) & 7);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      v30 = sub_100005C6C((uint64_t)&OBJC_CLASS___FPMemoryRegion, 0xFFFFFFFFLL);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      if (v29)
      {
        v32 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@ (%@)",  v31,  v29,  v59);
        -[FPMemoryRegion setName:](v27, "setName:", v32);
      }

      else
      {
        -[FPMemoryRegion setName:](v27, "setName:", v31);
      }

      if (v27)
      {
        unint64_t v33 = v67[1];
        v27->_start = -1LL;
        v27->_size = v33;
        v27->_share_mode = 4;
      }

      uint64_t v65 = 0LL;
      int v34 = (v72 >> 4) & 3;
      if (v34 != 3 && v34)
      {
        uint64_t v37 = 0LL;
        uint64_t v66 = 0LL;
        uint64_t v36 = v69;
        uint64_t v35 = v68 - v69;
        if ((v72 & 1) != 0)
        {
LABEL_27:
          uint64_t v65 = v36 + v37;
          v38 = &v66;
          uint64_t v36 = 0LL;
          goto LABEL_28;
        }
      }

      else
      {
        uint64_t v35 = v70;
        uint64_t v36 = v68 - v70;
        uint64_t v37 = v71;
        uint64_t v66 = v71;
        if ((v72 & 1) != 0) {
          goto LABEL_27;
        }
      }

      v38 = &v65;
LABEL_28:
      uint64_t *v38 = 0LL;
      -[FPMemoryRegion setSwappedSize:](v27, "setSwappedSize:", v66);
      -[FPMemoryRegion setDirtySize:](v27, "setDirtySize:", v36);
      -[FPMemoryRegion setCleanSize:](v27, "setCleanSize:", v65);
      -[FPMemoryRegion setReclaimableSize:](v27, "setReclaimableSize:", v35);
      if (v27) {
        *((_BYTE *)v27 + 8) = *((_BYTE *)v27 + 8) & 0xFE | (v69 != 0);
      }
      -[NSMutableArray addObject:](v64, "addObject:", v27);

      if (v23 == (id)++v25)
      {
        id v23 = [v22 countByEnumeratingWithState:&v73 objects:v100 count:16];
        if (!v23) {
          goto LABEL_32;
        }
        goto LABEL_12;
      }
    }
  }

- (BOOL)_configurePageSize
{
  return 1;
}

- (id)_gatherOwnedVmObjects
{
  if (-[FPUserProcess doOwnedAccountingAdjustments](self, "doOwnedAccountingAdjustments"))
  {
    size_t v17 = 0LL;
    if (!sysctlbyname("vm.get_owned_vmobjects", 0LL, &v17, &self->_task, 4uLL))
    {
      size_t v3 = v17;
      if (v17)
      {
        unsigned int v4 = 0LL;
        do
        {
          v3 += 896LL;
          unsigned int v4 = (unint64_t *)realloc(v4, v3);
          size_t v16 = v3;
          if (sysctlbyname("vm.get_owned_vmobjects", v4, &v16, &self->_task, 4uLL))
          {
            sub_1000095C0((id *)&self->super.super.isa, @"vm.get_owned_vmobjects");
            free(v4);
            goto LABEL_17;
          }
        }

        while (v3 == v16);
        if (v16)
        {
          if (v16 <= 7)
          {
            uint64_t v14 = _os_assert_log(0LL, v5, v6);
            _os_crash(v14);
            __break(1u);
          }

          else if (v16 - 8 >= 56 * *v4)
          {
            id v7 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  *v4);
            if (*v4)
            {
              unint64_t v8 = 0LL;
              objc_super v9 = (uint64_t *)(v4 + 1);
              do
              {
                v10 = -[NSData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytes:length:",  v9,  56LL);
                uint64_t v11 = *v9;
                v9 += 7;
                v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v11));
                -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v10, v12);

                ++v8;
              }

              while (v8 < *v4);
            }

            free(v4);
            return v7;
          }

          uint64_t v15 = _os_assert_log(0LL, v5, v6);
          id result = (id)_os_crash(v15);
          __break(1u);
          return result;
        }

        free(v4);
      }

      return  -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  0LL);
    }

    if (*__error() != 2) {
      sub_1000095C0((id *)&self->super.super.isa, @"vm.get_owned_vmobjects");
    }
  }

- (BOOL)_populateMemoryRegionWithPageQueries:(id)a3 regionInfo:(vm_region_submap_info_64 *)a4
{
  uint64_t v5 = a3;
  unint64_t v6 = -[FPProcess pageSize](self, "pageSize");
  unint64_t v7 = v6;
  if (!v5) {
    goto LABEL_29;
  }
  uint64_t v8 = v5[10];
  uint64_t v9 = -(uint64_t)v6;
  mach_vm_offset_t v10 = v8 & -(uint64_t)v6;
  if (v8 == -1)
  {
    uint64_t v12 = (v6 - 2) & v9;
    BOOL v13 = v10 != -1LL;
    uint64_t v11 = -1LL;
  }

  else
  {
    uint64_t v11 = v5[11] + v8;
    uint64_t v12 = (v6 + v11 - 1) & v9;
    BOOL v13 = v10 != v8;
  }

  while (1)
  {
    uint64_t v52 = 0LL;
    v53 = &v52;
    uint64_t v54 = 0x2020000000LL;
    uint64_t v55 = 0LL;
    uint64_t v48 = 0LL;
    v49 = &v48;
    uint64_t v50 = 0x2020000000LL;
    uint64_t v51 = 0LL;
    if ([v5 dirtySize])
    {
      uint64_t v31 = _os_assert_log(0LL, v14, v15);
      _os_crash(v31);
      __break(1u);
      goto LABEL_28;
    }

    if (![v5 swappedSize]) {
      break;
    }
LABEL_28:
    uint64_t v32 = _os_assert_log(0LL, v16, v17);
    _os_crash(v32);
    __break(1u);
LABEL_29:
    BOOL v13 = 0;
    mach_vm_offset_t v10 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v9 = -(uint64_t)v7;
  }

  BOOL v36 = v12 != v11;
  BOOL v37 = v13;
  unint64_t cachedDispositionAddress = self->_cachedDispositionAddress;
  mach_vm_offset_t v19 = v10;
  unint64_t v20 = (v12 - v10) / v7;
  BOOL v21 = v10 == cachedDispositionAddress;
  if (v10 == cachedDispositionAddress)
  {
    uint64_t v34 = v11;
    uint64_t v35 = v12;
    int cachedDisposition = self->_cachedDisposition;
    id v23 = v53 + 3;
    unint64_t v33 = v49;
    uint64_t v24 = v5;
    if (v5)
    {
      unint64_t v25 = v7 - v24[10] + (v24[10] & v9);
      if (v24[11] < v25) {
        unint64_t v25 = v24[11];
      }
    }

    else
    {
      unint64_t v25 = 0LL;
    }

    mach_vm_offset_t v19 = v10 + v7;
    --v20;
    if ((cachedDisposition & 8) != 0 || (cachedDisposition & 0x81) == 1)
    {
LABEL_15:
      *v23 += v25;
    }

    else if ((cachedDisposition & 0x10) != 0)
    {
      id v23 = v33 + 3;
      goto LABEL_15;
    }

    uint64_t v11 = v34;
    uint64_t v12 = v35;
    BOOL v21 = v10 == cachedDispositionAddress;
  }

  if (!v5 || (v5[1] & 4) == 0)
  {
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_1000099F4;
    v38[3] = &unk_100029150;
    BOOL v45 = v21;
    BOOL v46 = v37;
    BOOL v47 = v36;
    v26 = v5;
    v41 = &v52;
    id v42 = &v48;
    v39 = v26;
    v40 = self;
    unint64_t v43 = v7;
    uint64_t v44 = v12;
    char v27 = sub_100009CD0(self, v19, v20, v38);
    -[FPMemoryRegion setSwappedSize:](v26, "setSwappedSize:", v49[3]);
    -[FPMemoryRegion setDirtySize:](v26, "setDirtySize:", v53[3]);
    pendingUnusedSharedRegion = v39;
    goto LABEL_25;
  }

  if (v10 == cachedDispositionAddress)
  {
    [v5 setDirtySize:v53[3]];
    [v5 setSwappedSize:v49[3]];
  }

  char v27 = 1;
  if (v12 != v11 && v20)
  {
    v29 = v5;
    pendingUnusedSharedRegion = self->_pendingUnusedSharedRegion;
    self->_pendingUnusedSharedRegion = v29;
    char v27 = 1;
LABEL_25:
  }

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v52, 8);

  return v27;
}

- (void)enumerateRegions:(id)a3
{
  kern_return_t v18;
  mach_vm_address_t v19;
  BOOL v20;
  kern_return_t v21;
  mach_error_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  NSString *v27;
  __CFString *v28;
  uint64_t v29;
  unint64_t mappedSize;
  unint64_t slide;
  mach_port_t v32;
  int state;
  mach_vm_size_t v34;
  mach_vm_address_t v35;
  mach_vm_size_t size;
  int v37;
  int v38;
  uint64_t v39;
  int v40;
  __int16 v41;
  mach_vm_address_t address;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int16 v48;
  __int16 v49;
  int v50;
  int v51;
  unsigned int v52;
  __int16 v53;
  int v54;
  uint64_t v55;
  mach_port_t object_name;
  mach_msg_type_number_t infoCnt;
  int info[257];
  id v4 = a3;
  uint64_t v34 = 0LL;
  uint64_t v35 = 0LL;
  sharedCache = self->super._sharedCache;
  if (sharedCache)
  {
    mappedSize = sharedCache->_mappedSize;
    slide = sharedCache->_slide;
    mach_vm_size_t v6 = sharedCache->_baseAddress - slide;
  }

  else
  {
LABEL_55:
    mappedSize = 0LL;
    slide = 0LL;
    mach_vm_size_t v6 = 0LL;
  }

  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_images, "firstObject"));
  if (v7) {
    mach_vm_address_t v8 = v7[3] + v7[2];
  }
  else {
    mach_vm_address_t v8 = 0LL;
  }

  size = 0LL;
  unint64_t v9 = -[FPProcess pageSize](self, "pageSize");
  if (v6)
  {
    unint64_t v10 = v9;
    mach_vm_size_t v11 = v6;
    mach_vm_size_t v12 = v8;
    do
    {
      address = (v12 >> 1) + (v11 >> 1);
      infoCnt = 9;
      if (mach_vm_region(self->_task, &address, &size, 9, info, &infoCnt, &object_name)) {
        break;
      }
      if (size + address <= v6)
      {
        mach_vm_address_t v8 = address;
        mach_vm_size_t v12 = size + address;
      }

      else
      {
        if (v12 == address) {
          break;
        }
        mach_vm_size_t v11 = (v12 >> 1) + (v11 >> 1) - v10;
      }
    }

    while (v11 > v12 && v11 - v12 > 0x1000000);
  }

  else
  {
    mach_vm_address_t v8 = 0LL;
  }

  unsigned __int8 v13 = 0;
  mach_vm_address_t v14 = v6 + slide + mappedSize;
  while (1)
  {
    uint64_t v15 = objc_autoreleasePoolPush();
    object_name = -1;
    infoCnt = 9;
    mach_vm_address_t v16 = v35;
    if (v8 - 1 >= v35 || v14 <= v35) {
      goto LABEL_25;
    }
    unsigned __int8 v18 = mach_vm_region(self->_task, &v35, &v34, 9, (vm_region_info_t)&size, &infoCnt, &v32);
    if (v18) {
      break;
    }
    mach_vm_offset_t v19 = v35;
    if (v35 < v16)
    {
      uint64_t v35 = v16;
LABEL_25:
      mach_vm_offset_t v19 = v16;
    }

    if (v19 < v8 || (v6 < v34 + v19 ? (unint64_t v20 = v19 >= v14) : (unint64_t v20 = 1), v20))
    {
      infoCnt = 19;
      BOOL v21 = mach_vm_region_recurse(self->_task, &v35, &v34, &object_name, (vm_region_recurse_info_t)&address, &infoCnt);
      v22 = v21;
      if (infoCnt <= 0x12) {
        uint64_t v55 = v52;
      }
      if (v21 == 1 || (v13 & ((_DWORD)v45 != -1)) != 0) {
        goto LABEL_48;
      }
      if (v21)
      {
        v28 = @"mach_vm_region_recurse";
        goto LABEL_52;
      }

      id v23 = (_DWORD)v45 == -1;
      if (mach_vm_purgable_control(self->_task, v35, 1, &state)) {
        state = 3;
      }
      if (v50)
      {
        v29 = _os_assert_log(0LL, v24, v25);
        _os_crash(v29);
        __break(1u);
        goto LABEL_55;
      }

      v13 |= v23;
      if ((_BYTE)v49
        && -[FPUserProcess _isAlive](self, "_isAlive")
        && (v26 = proc_regionfilename(self->super._pid, v35, info, 0x400u)) != 0)
      {
        *((_BYTE *)info + v26) = 0;
        char v27 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", info);
      }

      else
      {
        char v27 = 0LL;
      }
    }

    else
    {
      char v27 = 0LL;
      unint64_t v43 = v37;
      address = size;
      uint64_t v44 = v39;
      BOOL v46 = 0LL;
      BOOL v47 = 0LL;
      BOOL v45 = 0LL;
      uint64_t v48 = 0;
      v49 = 257;
      uint64_t v50 = v38;
      uint64_t v51 = v40;
      uint64_t v52 = 1;
      v53 = v41;
      uint64_t v54 = 0;
      uint64_t v55 = 1LL;
      state = 3;
    }

    if (((*((uint64_t (**)(id, mach_vm_address_t, mach_vm_size_t, mach_vm_address_t *, void, NSString *, void, void))v4
           + 2))( v4,  v35,  v34,  &address,  state,  v27,  0LL,  0LL) & 1) != 0)
      goto LABEL_49;
    v35 += v34;
    objc_autoreleasePoolPop(v15);
  }

  v22 = v18;
  if (v18 == 1)
  {
LABEL_48:
    char v27 = 0LL;
LABEL_49:

    goto LABEL_53;
  }

  v28 = @"mach_vm_region";
LABEL_52:
  sub_10000A258(self, v22, v28);
LABEL_53:
  objc_autoreleasePoolPop(v15);
}

- (void)_addSubrangesForRegion:(id)a3 purgeState:(int)a4
{
  mach_vm_size_t v6 = a3;
  unint64_t v9 = -[FPProcess pageSize](self, "pageSize");
  if (v6)
  {
    if ((v6[8] & 8) == 0)
    {
      char v10 = v6[8] & 1;
      uint64_t v11 = *((void *)v6 + 10);
      if (v11 == -1) {
        uint64_t v12 = -1LL;
      }
      else {
        uint64_t v12 = *((void *)v6 + 11) + v11;
      }
      goto LABEL_6;
    }

    uint64_t v19 = _os_assert_log(0LL, v7, v8);
    _os_crash(v19);
    __break(1u);
  }

  uint64_t v12 = 0LL;
  char v10 = 0;
  uint64_t v11 = 0LL;
LABEL_6:
  uint64_t v13 = (v9 + v12 - 1) & -(uint64_t)v9;
  mach_vm_offset_t v14 = v11 & -(uint64_t)v9;
  if (a4 == 1) {
    int v15 = 1;
  }
  else {
    int v15 = 2048;
  }
  v29[0] = 0LL;
  v29[1] = v29;
  v29[2] = 0x3010000000LL;
  v29[3] = &unk_100026C91;
  unint64_t v16 = (v13 - v14) / v9;
  if (v6) {
    uint64_t v17 = *((void *)v6 + 9);
  }
  else {
    uint64_t v17 = 0LL;
  }
  v29[4] = v17;
  v29[5] = 0LL;
  v28[0] = 0LL;
  v28[1] = v28;
  v28[2] = 0x2020000000LL;
  v28[3] = 0LL;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10000A5D4;
  v20[3] = &unk_100029178;
  int v25 = 8;
  int v26 = v15;
  v22 = v28;
  id v23 = v29;
  char v27 = v10;
  unsigned __int8 v18 = v6;
  id v21 = v18;
  unint64_t v24 = v9;
  sub_100009CD0(self, v14, v16, v20);

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v29, 8);
}

- (BOOL)_populateTask
{
  mach_error_t v2 = task_read_for_pid(mach_task_self_, -[FPProcess pid](self, "pid"), &self->_task);
  if (v2) {
    mach_error("task_read_for_pid", v2);
  }
  return v2 == 0;
}

- (void)_setIdleExitStatusFromDirtyFlags:(unsigned int)a3
{
  if ((a3 & 4) != 0) {
    int v3 = 3;
  }
  else {
    int v3 = 2;
  }
  if ((a3 & 1) == 0) {
    int v3 = 1;
  }
  self->super._idleExitStatus = v3;
}

- (void)_setPriority:(int)a3
{
  self->super._priority = a3;
}

- (void)_gatherProcessState
{
  if (-[FPUserProcess _isAlive](self, "_isAlive"))
  {
    uint32_t flags = 0;
    uint64_t v3 = -[FPProcess pid](self, "pid");
    objc_opt_self(&OBJC_CLASS___FPUserProcess);
    if ((memorystatus_control(1LL, v3, 0LL, buf, 24LL) & 0x80000000) != 0)
    {
      int dirty = proc_get_dirty(v3, &flags);
      if (os_variant_has_internal_content("com.apple.footprint")
        && dirty
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v8 = dirty;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to fetch process info: %d",  buf,  8u);
      }
    }

    else
    {
      uint64_t v4 = v9;
      -[FPUserProcess _setPriority:](self, "_setPriority:", v8);
      uint32_t flags = +[FPUserProcess _dirtyFlagsFromEntryState:](&OBJC_CLASS___FPUserProcess, "_dirtyFlagsFromEntryState:", v4);
    }

    -[FPUserProcess _setIdleExitStatusFromDirtyFlags:](self, "_setIdleExitStatusFromDirtyFlags:", flags);
  }

+ (unsigned)_dirtyFlagsFromEntryState:(unsigned int)a3
{
  if ((a3 & 0x20) != 0) {
    int v3 = 5;
  }
  else {
    int v3 = 1;
  }
  unsigned int v4 = v3 | (a3 >> 3) & 2;
  if ((a3 & 8) != 0) {
    return v4;
  }
  else {
    return 0;
  }
}

- (void)_gatherPhysFootprint
{
  if (-[FPUserProcess _isAlive](self, "_isAlive"))
  {
    if (!proc_pid_rusage(self->super._pid, 6, buffer))
    {
      rusage_info_t v3 = buffer[30];
      self->_ledgers[1] = (unint64_t)buffer[9];
      self->_ledgers[2] = (unint64_t)v3;
    }
  }

- (unint64_t)physFootprint
{
  return self->_ledgers[1];
}

- (void)_gatherLedgers
{
  mach_error_t v2 = self;
  if (-[FPProcess breakDownPhysFootprint](self, "breakDownPhysFootprint") && -[FPUserProcess _isAlive](v2, "_isAlive"))
  {
    if (qword_100038A80 != -1) {
      dispatch_once(&qword_100038A80, &stru_100029EE0);
    }
    uint64_t v8 = qword_100038A78;
    if ((qword_100038A78 & 0x8000000000000000LL) == 0)
    {
      uint64_t v3 = xmmword_100038A58;
      if ((xmmword_100038A58 & 0x8000000000000000LL) == 0)
      {
        unsigned int v4 = malloc(48 * qword_100038A78);
        if ((ledger(1LL, -[FPProcess pid](v2, "pid"), v4, &v8) & 0x80000000) != 0)
        {
          sub_1000095C0((id *)&v2->super.super.isa, @"Unable to retrieve ledger entry info");
LABEL_14:
          free(v4);
          return;
        }

        if (v3 >= v8)
        {
          uint64_t v7 = _os_assert_log(0LL, v5, v6);
          _os_crash(v7);
          __break(1u);
        }

        else
        {
          mach_error_t v2 = (FPUserProcess *)((char *)v2 + 104);
          v2->super.super.isa = (Class)(*((void *)v4 + 6 * v3) & ~(*((uint64_t *)v4 + 6 * v3) >> 63));
          if (qword_100038A80 == -1) {
            goto LABEL_10;
          }
        }

        dispatch_once(&qword_100038A80, &stru_100029EE0);
LABEL_10:
        if ((qword_100038A78 & 0x8000000000000000LL) == 0 && qword_100038A70 >= 1) {
          v2->super._sharedCache = (FPSharedCache *)(*((void *)v4 + 6 * qword_100038A70) & ~(*((uint64_t *)v4
        }
                                                                                               + 6 * qword_100038A70) >> 63));
        goto LABEL_14;
      }
    }
  }

- (void)_gatherSharedCacheFromDyldSnapshot:(dyld_process_snapshot_s *)a3
{
  unsigned int v4 = sub_10000635C((uint64_t)&OBJC_CLASS___FPSharedCache, (uint64_t)a3);
  uint64_t v5 = (FPSharedCache *)objc_claimAutoreleasedReturnValue(v4);
  sharedCache = self->super._sharedCache;
  self->super._sharedCache = v5;
}

- (void)_gatherImageData
{
  mach_error_t v13 = 0;
  uint64_t v3 = dyld_process_create_for_task(self->_task, &v13);
  if (!v3)
  {
    mach_error_t v6 = v13;
    uint64_t v7 = @"dyld_process_create_for_task";
LABEL_7:
    sub_10000A258(self, v6, v7);
    return;
  }

  uint64_t v4 = v3;
  mach_error_t v13 = 0;
  uint64_t v5 = dyld_process_snapshot_create_for_process(v3, &v13);
  dyld_process_dispose(v4);
  if (v5)
  {
    -[FPUserProcess _gatherSharedCacheFromDyldSnapshot:](self, "_gatherSharedCacheFromDyldSnapshot:", v5);
    v11[0] = 0LL;
    v11[1] = v11;
    v11[2] = 0x2020000000LL;
    char v12 = 0;
    v9[0] = 0LL;
    v9[1] = v9;
    v9[2] = 0x3032000000LL;
    v9[3] = sub_10000A7C8;
    v9[4] = sub_10000A7D8;
    char v10 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10000B960;
    v8[3] = &unk_1000291F0;
    v8[4] = self;
    v8[5] = v9;
    v8[6] = v11;
    dyld_process_snapshot_for_each_image(v5, v8);
    dyld_process_snapshot_dispose(v5);
    -[NSMutableArray sortUsingComparator:](self->_images, "sortUsingComparator:", &stru_100029230);
    _Block_object_dispose(v9, 8);

    _Block_object_dispose(v11, 8);
    return;
  }

  mach_error_t v6 = v13;
  if (v13)
  {
    uint64_t v7 = @"dyld_process_snapshot_create_for_process";
    goto LABEL_7;
  }

- (BOOL)_isAlive
{
  return 1;
}

- (id)auxData
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  unsigned int v4 = -[FPProcess priority](self, "priority");
  if (os_variant_has_internal_content("com.apple.footprint") && (v4 & 0x80000000) == 0)
  {
    uint64_t v5 = -[FPAuxData initWithValue:shouldAggregate:]( objc_alloc(&OBJC_CLASS___FPAuxData),  "initWithValue:shouldAggregate:",  v4,  0LL);
    -[FPAuxData setFormatter:](v5, "setFormatter:", &stru_100029270);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v5,  @"jetsam priority");
  }

  unsigned int v6 = -[FPProcess idleExitStatus](self, "idleExitStatus");
  if (os_variant_has_internal_content("com.apple.footprint") && v6)
  {
    uint64_t v7 = -[FPAuxData initWithValue:shouldAggregate:]( objc_alloc(&OBJC_CLASS___FPAuxData),  "initWithValue:shouldAggregate:",  v6,  0LL);
    -[FPAuxData setFormatter:](v7, "setFormatter:", &stru_100029290);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, @"dirty");
  }

  ledgers = self->_ledgers;
  if (self->_ledgers[1])
  {
    unsigned int v9 = -[FPAuxData initWithValue:shouldAggregate:]( objc_alloc(&OBJC_CLASS___FPAuxData),  "initWithValue:shouldAggregate:",  self->_ledgers[1],  0LL);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, @"phys_footprint");

    char v10 = -[FPAuxData initWithValue:shouldAggregate:]( objc_alloc(&OBJC_CLASS___FPAuxData),  "initWithValue:shouldAggregate:",  ledgers[2],  0LL);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v10,  @"phys_footprint_peak");
  }

  if (-[NSMutableDictionary count](v3, "count")) {
    uint64_t v11 = v3;
  }
  else {
    uint64_t v11 = 0LL;
  }

  return v11;
}

- (id)extendedInfoForRegionType:(int)a3 at:(unint64_t)a4 extendedInfoProvider:(id)a5
{
  id v8 = a5;
  unsigned int v9 = v8;
  if (a3 == 100)
  {
    id v17 = v8;
    if (self)
    {
      id v71 = 0LL;
      unsigned __int8 v18 = (void *)[v17 ioAccelMemoryInfoDetailsAtAddress:a4 for:[self pid] error:&v71];
      id v19 = v71;
      unint64_t v20 = v19;
      if (v19)
      {
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v19 localizedDescription]);
        -[FPProcess _addGlobalError:](self, "_addGlobalError:", v21);
      }

      if (v18)
      {
        v64 = v9;
        v22 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"Size"]);
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"ResidentSize"]);
        uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"DirtySize"]);
        unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"SurfaceID"]);
        int v25 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"IsWired"]);
        uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"IsPurgeable"]);
        int v26 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"Descriptions"]);
        if ([v24 unsignedLongLongValue]) {
          v58 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%llu",  [v24 unsignedLongLongValue]));
        }
        else {
          v58 = @"-";
        }
        unsigned int v60 = v25;
        unsigned int v61 = v24;
        if ([v25 BOOLValue])
        {
          uint64_t v32 = @"Wired";
        }

        else
        {
          unsigned int v33 = [v65 BOOLValue];
          uint64_t v32 = @"Normal";
          if (v33) {
            uint64_t v32 = @"Purgeable";
          }
        }

        v56 = (__CFString *)v32;
        v62 = v20;
        id v63 = v17;
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
        __int128 v67 = 0u;
        __int128 v68 = 0u;
        __int128 v69 = 0u;
        __int128 v70 = 0u;
        id v35 = v26;
        id v36 = [v35 countByEnumeratingWithState:&v67 objects:__str count:16];
        if (v36)
        {
          id v37 = v36;
          uint64_t v38 = *(void *)v68;
          do
          {
            for (i = 0LL; i != v37; i = (char *)i + 1)
            {
              if (*(void *)v68 != v38) {
                objc_enumerationMutation(v35);
              }
              [v34 appendString:*(void *)(*((void *)&v67 + 1) + 8 * (void)i)];
            }

            id v37 = [v35 countByEnumeratingWithState:&v67 objects:__str count:16];
          }

          while (v37);
        }

        uint64_t v40 = NSLocalizedFileSizeDescription([v22 unsignedLongLongValue], 0, 22020096);
        id v55 = objc_claimAutoreleasedReturnValue(v40);
        id v54 = [v55 UTF8String];
        uint64_t v41 = NSLocalizedFileSizeDescription([v23 unsignedLongLongValue], 0, 22020096);
        id v42 = objc_claimAutoreleasedReturnValue(v41);
        id v43 = [v42 UTF8String];
        uint64_t v44 = NSLocalizedFileSizeDescription([v66 unsignedLongLongValue], 0, 22020096);
        id v45 = objc_claimAutoreleasedReturnValue(v44);
        id v46 = [v45 UTF8String];
        BOOL v47 = v58;
        id v59 = v22;
        uint64_t v48 = v47;
        id v49 = -[__CFString UTF8String](v47, "UTF8String");
        id v50 = -[__CFString UTF8String](v56, "UTF8String");
        v57 = v23;
        id v51 = v50;
        id v52 = v34;
        unint64_t v16 = (NSMutableString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Size:%s Resident:%s Dirty:%s IOSurfaceID:%s State:%s %s",  v54,  v43,  v46,  v49,  v51,  [v52 UTF8String]));

        id v17 = v63;
        unsigned int v9 = v64;
        unint64_t v20 = v62;
      }

      else
      {
        unint64_t v16 = 0LL;
      }
    }

    else
    {
      unint64_t v16 = 0LL;
    }
  }

  else
  {
    if (a3 == 88 && self)
    {
      id v10 = v8;
      uint64_t v11 = (void *)[v10 ioSurfaceExtendedInfoDetailsAtAddress:a4 for:[self pid]];

      if (!v11)
      {
        unint64_t v16 = 0LL;
LABEL_22:

        goto LABEL_38;
      }

      char v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"surfaceID"]);
      id v13 = [v12 unsignedIntValue];

      mach_vm_offset_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"PixelFormat"]);
      unsigned int v15 = [v14 unsignedIntValue];

      if ((v15 & 0x80000000) != 0)
      {
        if (__maskrune(HIBYTE(v15), 0x800uLL)) {
          goto LABEL_7;
        }
      }

      else if ((_DefaultRuneLocale.__runetype[HIBYTE(v15)] & 0x800) != 0)
      {
LABEL_7:
        __str[0] = HIBYTE(v15);
        __str[1] = BYTE2(v15);
        __str[2] = BYTE1(v15);
        __str[3] = v15;
        __str[4] = 0;
LABEL_19:
        char v27 = objc_alloc(&OBJC_CLASS___NSMutableString);
        v28 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"Width"]);
        id v29 = [v28 unsignedIntValue];
        v30 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"Height"]);
        unint64_t v16 = -[NSMutableString initWithFormat:]( v27,  "initWithFormat:",  @"SID: %#x  %ux%u (%s)",  v13,  v29,  [v30 unsignedIntValue],  __str);

        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"Name"]);
        if ([v31 length]) {
          -[NSMutableString appendFormat:](v16, "appendFormat:", @"  '%@'", v31);
        }

        goto LABEL_22;
      }

      snprintf(__str, 5uLL, "%4d", v15);
      goto LABEL_19;
    }

    unint64_t v16 = 0LL;
  }

- (void)addLedgerData:(unint64_t *)a3 count:(unint64_t)a4
{
  ledgers = self->_ledgers;
  unint64_t v5 = 4LL;
  if (a4 < 4) {
    unint64_t v5 = a4;
  }
  memcpy(ledgers, a3, 8 * v5);
}

- (unsigned)task
{
  return self->_task;
}

- (void).cxx_destruct
{
}

@end
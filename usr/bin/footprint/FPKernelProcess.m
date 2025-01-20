@interface FPKernelProcess
- (BOOL)_isAlive;
- (BOOL)_populateTask;
- (FPKernelProcess)initWithBsdInfo:(proc_bsdinfo *)a3;
- (id)auxData;
- (unint64_t)_gatherPageSize;
- (void)gatherData:(unint64_t)a3 extendedInfoProvider:(id)a4;
@end

@implementation FPKernelProcess

- (FPKernelProcess)initWithBsdInfo:(proc_bsdinfo *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___FPKernelProcess;
  v3 = -[FPProcess initWithBsdInfo:](&v10, "initWithBsdInfo:", a3);
  v4 = v3;
  if (v3)
  {
    v3->super._idleExitStatus = 1;
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    mapsAuxData = v4->_mapsAuxData;
    v4->_mapsAuxData = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    otherAuxData = v4->_otherAuxData;
    v4->_otherAuxData = (NSMutableDictionary *)v7;
  }

  return v4;
}

- (unint64_t)_gatherPageSize
{
  return vm_kernel_page_size;
}

- (void)gatherData:(unint64_t)a3 extendedInfoProvider:(id)a4
{
  kern_return_t v6;
  mach_error_t v7;
  FILE *v8;
  id v9;
  FPKernelProcess *v10;
  const char *v11;
  char *v12;
  void *v13;
  NSString *v14;
  void *v15;
  void *v16;
  mach_zone_name_array_t v17;
  mach_zone_info_array_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t *p_mzi_collectable;
  FPMemoryMultiRegion *v23;
  char *v24;
  NSString *v25;
  NSString *v26;
  NSString *v27;
  void *v28;
  unint64_t v29;
  uint64_t v30;
  kern_return_t v31;
  mach_error_t v32;
  FILE *v33;
  id v34;
  const char *v35;
  char *v36;
  mach_memory_info_array_t v37;
  uint64_t v38;
  id v39;
  FPKernelProcess *v40;
  uint64_t v41;
  int FlagsForNListOnlyData;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  uint64_t v52;
  void *i;
  void *v54;
  void *v55;
  void **p_vtable;
  uint64_t v57;
  uint64_t flags;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  __CFString *v62;
  FPMemoryRegion *v63;
  FPAuxData *v64;
  FPMemoryRegion *v65;
  FPMemoryRegion *v66;
  FPMemoryRegion *v67;
  CFStringRef v68;
  id v69;
  uint64_t flags_low;
  __CFString *v71;
  void *v72;
  uint64_t SourceInfoWithAddressAtTime;
  uint64_t v74;
  uint64_t v75;
  uint64_t Path;
  NSString *v77;
  void *v78;
  kern_return_t v79;
  mach_error_t v80;
  FILE *v81;
  id v82;
  const char *v83;
  char *v84;
  kern_return_t v85;
  mach_error_t v86;
  FILE *v87;
  id v88;
  const char *v89;
  char *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  FPAuxData *v95;
  FPAuxData *v96;
  FPAuxData *v97;
  uint64_t v98;
  void *v99;
  unsigned int v100;
  mach_zone_name_array_t v101;
  void *v102;
  FPKernelProcess *v103;
  uint64_t v104;
  uint64_t v105;
  mach_msg_type_number_t memory_infoCnt;
  mach_memory_info_array_t memory_info;
  mach_msg_type_number_t infoCnt[2];
  mach_zone_name_array_t names;
  mach_zone_info_array_t info;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  rusage_info_t buffer[58];
  names = 0LL;
  info = 0LL;
  memory_info = 0LL;
  *(void *)infoCnt = 0LL;
  memory_infoCnt = 0;
  mach_port_t v5 = mach_host_self();
  v6 = mach_memory_info(v5, &names, &infoCnt[1], &info, infoCnt, &memory_info, &memory_infoCnt);
  if (v6)
  {
    uint64_t v7 = v6;
    v8 = __stderrp;
    v9 = objc_claimAutoreleasedReturnValue(-[FPProcess displayString](self, "displayString"));
    objc_super v10 = self;
    v11 = (const char *)[v9 UTF8String];
    v12 = mach_error_string(v7);
    fprintf(v8, "%s: mach_memory_info: %s\n", v11, v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FPProcess displayString](v10, "displayString"));
    v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: %s",  v13,  mach_error_string(v7));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    -[NSMutableArray addObject:](v10->super._errors, "addObject:", v15);
    goto LABEL_3;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v17 = names;
  v18 = info;
  v19 = infoCnt[1];
  v20 = v16;
  v103 = self;
  if (self && (_DWORD)v19)
  {
    v21 = 0LL;
    p_mzi_collectable = &v18->mzi_collectable;
    do
    {
      v23 = objc_alloc_init(&OBJC_CLASS___FPMemoryMultiRegion);
      v24 = strnstr(v17->mzn_name, "kalloc", 0x50uLL);
      v25 = objc_alloc(&OBJC_CLASS___NSString);
      if (v24)
      {
        v26 = -[NSString initWithFormat:](v25, "initWithFormat:", @"kalloc.%llu", *(p_mzi_collectable - 4));
        -[FPMemoryRegion setName:](v23, "setName:", v26);

        -[FPMemoryMultiRegion setAuxDataName:](v23, "setAuxDataName:", @"kalloc");
      }

      else
      {
        v27 = -[NSString initWithFormat:](v25, "initWithFormat:", @"%.*s", 80LL, v17);
        -[FPMemoryRegion setName:](v23, "setName:", v27);
      }

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[FPMemoryRegion name](v23, "name"));

      if (!v28) {
        -[FPMemoryRegion setName:](v23, "setName:", @"unknown");
      }
      v29 = *(p_mzi_collectable - 6);
      v30 = *p_mzi_collectable >> 1;
      -[FPMemoryRegion setDirtySize:](v23, "setDirtySize:", v29 - v30);
      -[FPMemoryRegion setReclaimableSize:](v23, "setReclaimableSize:", v30);
      if (v23)
      {
        v23->super._size = v29;
        v23->super._object_id = v21 | 0x200000000LL;
      }

      -[FPMemoryMultiRegion setTotalRegions:](v23, "setTotalRegions:", v29 / *(p_mzi_collectable - 4));
      -[FPMemoryMultiRegion setRegionSize:](v23, "setRegionSize:", *(p_mzi_collectable - 4));
      [v20 addObject:v23];

      ++v21;
      p_mzi_collectable += 8;
      ++v17;
    }

    while (v19 != v21);
  }

  v31 = vm_deallocate(mach_task_self_, (vm_address_t)info, (unint64_t)infoCnt[0] << 6);
  if (v31)
  {
    v32 = v31;
    v33 = __stderrp;
    v34 = objc_claimAutoreleasedReturnValue(-[FPProcess displayString](v103, "displayString"));
    v35 = (const char *)[v34 UTF8String];
    v36 = mach_error_string(v32);
    fprintf(v33, "%s: vm_deallocate: %s\n", v35, v36);
  }

  v37 = memory_info;
  v38 = memory_infoCnt;
  v101 = names;
  v100 = infoCnt[1];
  v39 = v20;
  v15 = v39;
  v40 = v103;
  if (v103)
  {
    v102 = v39;
    v41 = objc_opt_self(&OBJC_CLASS___FPKernelProcess);
    FlagsForNListOnlyData = CSSymbolicatorGetFlagsForNListOnlyData(v41);
    v43 = CSSymbolicatorCreateWithMachKernelFlagsAndNotification(FlagsForNListOnlyData | 0x100002u, 0LL);
    v104 = v44;
    v105 = v43;
    v45 = objc_opt_self(&OBJC_CLASS___FPKernelProcess);
    v46 = (id)OSKextCopyLoadedKextInfo(0LL, 0LL);
    objc_opt_self(v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v46 count]));
    v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "OSBundleLoadTag"));
    v111 = 0u;
    v112 = 0u;
    v113 = 0u;
    v114 = 0u;
    v99 = v46;
    v49 = (void *)objc_claimAutoreleasedReturnValue([v46 objectEnumerator]);
    v50 = [v49 countByEnumeratingWithState:&v111 objects:buffer count:16];
    if (v50)
    {
      v51 = v50;
      v52 = *(void *)v112;
      do
      {
        for (i = 0LL; i != v51; i = (char *)i + 1)
        {
          if (*(void *)v112 != v52) {
            objc_enumerationMutation(v49);
          }
          v54 = *(void **)(*((void *)&v111 + 1) + 8LL * (void)i);
          v55 = (void *)objc_claimAutoreleasedReturnValue([v54 objectForKeyedSubscript:v48]);
          [v47 setObject:v54 forKeyedSubscript:v55];
        }

        v51 = [v49 countByEnumeratingWithState:&v111 objects:buffer count:16];
      }

      while (v51);
    }

    v40 = v103;
    p_vtable = &OBJC_METACLASS___FPMemoryRegion.vtable;
    if ((_DWORD)v38)
    {
      v57 = 0LL;
      while (1)
      {
        flags = v37->flags;
        v59 = v37->flags & 0x9FF;
        if (v59 == 3) {
          v60 = 48LL;
        }
        else {
          v60 = 16LL;
        }
        v61 = *(uint64_t *)((char *)&v37->flags + v60);
        if (!(v37->site | v61)) {
          goto LABEL_53;
        }
        if (v59 == 3) {
          break;
        }
        if ((flags & 0x1000) == 0)
        {
          v65 = objc_alloc_init(&OBJC_CLASS___FPMemoryRegion);
          v66 = v65;
          if ((flags & 0x900) != 0x100 || (v37->flags & 0x200) != 0 || v37->site == 24)
          {
            -[FPMemoryRegion setCleanSize:](v65, "setCleanSize:", v61);
            -[FPMemoryRegion setDirtySize:](v66, "setDirtySize:", 0LL);
            if ((v37->flags & 0x200) != 0)
            {
              v67 = v66;
              v68 = @"(hidden)";
LABEL_41:
              -[FPMemoryRegion setDetailedName:](v67, "setDetailedName:", v68);
            }

            else if (v37->site == 24)
            {
              v67 = v66;
              v68 = @"(user wired)";
              goto LABEL_41;
            }

            if (v66)
            {
LABEL_43:
              *((_BYTE *)v66 + 8) = *((_BYTE *)v66 + 8) & 0xFE | BYTE1(flags) & 1;
              -[FPMemoryRegion setSwappedSize:](v66, "setSwappedSize:", 0LL);
              -[FPMemoryRegion setReclaimableSize:](v66, "setReclaimableSize:", 0LL);
              v66->_user_tag = v57;
              v66->_size = v61;
              v66->_object_id = v57 | (unint64_t)&_mh_execute_header;
              goto LABEL_44;
            }
          }

          else
          {
            -[FPMemoryRegion setDirtySize:](v65, "setDirtySize:", v61);
            -[FPMemoryRegion setCleanSize:](v66, "setCleanSize:", 0LL);
            if (v66) {
              goto LABEL_43;
            }
          }

          [0 setSwappedSize:0];
          [0 setReclaimableSize:0];
LABEL_44:
          v63 = v66;
          v69 = v47;
          objc_opt_self(p_vtable + 62);
          flags_low = LOBYTE(v37->flags);
          v71 = sub_10000D364((uint64_t)(p_vtable + 62), (uint64_t *)v37, v69, v105, v104, (uint64_t)v101, v100);
          v72 = (void *)objc_claimAutoreleasedReturnValue(v71);

          if (v72)
          {
            -[FPMemoryRegion setName:](v63, "setName:", v72);
            if (flags_low == 2)
            {
              SourceInfoWithAddressAtTime = CSSymbolicatorGetSourceInfoWithAddressAtTime( v105,  v104,  v37->site,  0x8000000000000000LL);
              v75 = v74;
              if ((CSIsNull() & 1) == 0)
              {
                Path = CSSourceInfoGetPath(SourceInfoWithAddressAtTime, v75);
                if (Path)
                {
                  v77 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(%s:%d)",  Path,  CSSourceInfoGetLineNumber(SourceInfoWithAddressAtTime, v75));
                  v78 = (void *)objc_claimAutoreleasedReturnValue(v77);
                  -[FPMemoryRegion setDetailedName:](v63, "setDetailedName:", v78);
                }
              }
            }

            [v102 addObject:v63];
            v40 = v103;
          }

          else
          {
          }

          p_vtable = (void **)(&OBJC_METACLASS___FPMemoryRegion + 24);
LABEL_52:
        }

- (BOOL)_populateTask
{
  return 1;
}

- (BOOL)_isAlive
{
  return 1;
}

- (id)auxData
{
  mapsAuxData = self->_mapsAuxData;
  uint64_t v7 = @"Maps";
  v8 = mapsAuxData;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  if (-[NSMutableDictionary count](self->_otherAuxData, "count"))
  {
    uint64_t v5 = [v4 fp_mergeWithData:self->_otherAuxData forceAggregate:1];

    v4 = (void *)v5;
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end
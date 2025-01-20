@interface VMUProcessLedger
+ (id)_getProcessLedgerDictFromCrashInfo:(unint64_t)a3 DataSize:(unint64_t)a4;
+ (id)_getProcessLedgerDictFromKernelLedger:(int)a3;
+ (id)_getProcessLedgerForCore:(id)a3;
+ (id)ledgerForVMUTask:(id)a3;
@end

@implementation VMUProcessLedger

+ (id)ledgerForVMUTask:(id)a3
{
  kern_return_t v6;
  void *v7;
  mach_vm_size_t v9;
  mach_vm_address_t kcd_addr_begin;
  id v4 = a3;
  if ([v4 isCore])
  {
    uint64_t v5 = +[VMUProcessLedger _getProcessLedgerForCore:](&OBJC_CLASS___VMUProcessLedger, "_getProcessLedgerForCore:", v4);
LABEL_7:
    v7 = (void *)v5;
    goto LABEL_8;
  }

  v9 = 0LL;
  kcd_addr_begin = 0LL;
  v6 = task_map_corpse_info_64(*MEMORY[0x1895FBBE0], [v4 taskPort], &kcd_addr_begin, &v9);
  if (!v6)
  {
    uint64_t v5 = [a1 _getProcessLedgerDictFromCrashInfo:kcd_addr_begin DataSize:v9];
    goto LABEL_7;
  }

  v7 = 0LL;
  if (v6 == 4)
  {
    uint64_t v5 = [a1 _getProcessLedgerDictFromKernelLedger:[v4 pid]];
    goto LABEL_7;
  }

+ (id)_getProcessLedgerForCore:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v3 memoryCache];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = -[VMUTaskMemoryCache getCoreFileLedgerInternal:]((uint64_t)v5);

  if (!v6)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:0];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v7 forKeyedSubscript:@"internal"];
  }

  [v3 memoryCache];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  int v9 = -[VMUTaskMemoryCache getCoreFileLedgerInternalCompressed:]((uint64_t)v8);

  if (!v9)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:0];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v10 forKeyedSubscript:@"internal_compressed"];
  }

  [v3 memoryCache];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  int v12 = -[VMUTaskMemoryCache getCoreFileLedgerIokitMapped:]((uint64_t)v11);

  if (!v12)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:0];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v13 forKeyedSubscript:@"iokit_mapped"];
  }

  [v3 memoryCache];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  int v15 = -[VMUTaskMemoryCache getCoreFileLedgerAlternateAccounting:]((uint64_t)v14);

  if (!v15)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:0];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v16 forKeyedSubscript:@"alternate_accounting"];
  }

  [v3 memoryCache];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  int v18 = -[VMUTaskMemoryCache getCoreFileLedgerAlternateAccountingCompressed:]((uint64_t)v17);

  if (!v18)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:0];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v19 forKeyedSubscript:@"alternate_accounting_compressed"];
  }

  [v3 memoryCache];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  int v21 = -[VMUTaskMemoryCache getCoreFileLedgerPurgeableNonvolatile:]((uint64_t)v20);

  if (!v21)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:0];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v22 forKeyedSubscript:@"purgeable_nonvolatile"];
  }

  [v3 memoryCache];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  int v24 = -[VMUTaskMemoryCache getCoreFileLedgerPurgeableNonvolatileCompressed:]((uint64_t)v23);

  if (!v24)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:0];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v25 forKeyedSubscript:@"purgeable_nonvolatile_compressed"];
  }

  [v3 memoryCache];
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  int v27 = -[VMUTaskMemoryCache getCoreFileLedgerPhysFootprint:]((uint64_t)v26);

  if (!v27)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:0];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v28 forKeyedSubscript:@"phys_footprint"];
  }

  [v3 memoryCache];
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  int v30 = -[VMUTaskMemoryCache getCoreFileLedgerPhysFootprintLifetimeMax:]((uint64_t)v29);

  if (!v30)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:0];
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v31 forKeyedSubscript:@"phys_footprint_lifetime_max"];
  }

  [v3 memoryCache];
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  int v33 = -[VMUTaskMemoryCache getCoreFileLedgerPageTable:]((uint64_t)v32);

  if (!v33)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:0];
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v34 forKeyedSubscript:@"page_table"];
  }

  [v3 memoryCache];
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  int v36 = -[VMUTaskMemoryCache getCoreFileLedgerNetworkNonvolatile:]((uint64_t)v35);

  if (!v36)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:0];
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v37 forKeyedSubscript:@"network_nonvolatile"];
  }

  [v3 memoryCache];
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  int v39 = -[VMUTaskMemoryCache getCoreFileLedgerNetworkNonvolatileCompressed:]((uint64_t)v38);

  if (!v39)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:0];
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v40 forKeyedSubscript:@"network_nonvolatile_compressed"];
  }

  [v3 memoryCache];
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  int v42 = -[VMUTaskMemoryCache getCoreFileLedgerWiredMem:]((uint64_t)v41);

  if (!v42)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:0];
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v43 forKeyedSubscript:@"wired_mem"];
  }

  [v3 memoryCache];
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  int v45 = -[VMUTaskMemoryCache getCoreFileLedgerTaggedFootprint:]((uint64_t)v44);

  if (!v45)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:0];
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v46 forKeyedSubscript:@"tagged_footprint"];
  }

  [v3 memoryCache];
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  int v48 = -[VMUTaskMemoryCache getCoreFileLedgerTaggedFootprintCompressed:]((uint64_t)v47);

  if (!v48)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:0];
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v49 forKeyedSubscript:@"tagged_footprint_compressed"];
  }

  [v3 memoryCache];
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  int v51 = -[VMUTaskMemoryCache getCoreFileLedgerMediaFootprint:]((uint64_t)v50);

  if (!v51)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:0];
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v52 forKeyedSubscript:@"media_footprint"];
  }

  [v3 memoryCache];
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  int v54 = -[VMUTaskMemoryCache getCoreFileLedgerMediaFootprintCompressed:]((uint64_t)v53);

  if (!v54)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:0];
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v55 forKeyedSubscript:@"media_footprint_compressed"];
  }

  [v3 memoryCache];
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  int v57 = -[VMUTaskMemoryCache getCoreFileLedgerGraphicsFootprint:]((uint64_t)v56);

  if (!v57)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:0];
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v58 forKeyedSubscript:@"graphics_footprint"];
  }

  [v3 memoryCache];
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  int v60 = -[VMUTaskMemoryCache getCoreFileLedgerGraphicsFootprintCompressed:]((uint64_t)v59);

  if (!v60)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:0];
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v61 forKeyedSubscript:@"graphics_footprint_compressed"];
  }

  [v3 memoryCache];
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  int v63 = -[VMUTaskMemoryCache getCoreFileLedgerNeuralFootprint:]((uint64_t)v62);

  if (!v63)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:0];
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v64 forKeyedSubscript:@"neural_footprint"];
  }

  [v3 memoryCache];
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  int v66 = -[VMUTaskMemoryCache getCoreFileLedgerNeuralFootprintCompressed:]((uint64_t)v65);

  if (!v66)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:0];
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v67 forKeyedSubscript:@"neural_footprint_compressed"];
  }

  v68 = (void *)[v4 copy];

  return v68;
}

+ (id)_getProcessLedgerDictFromCrashInfo:(unint64_t)a3 DataSize:(unint64_t)a4
{
  id v6 = objc_alloc_init(MEMORY[0x189603FC8]);
  if (a3 && a4)
  {
    unint64_t v7 = a4 + a3;
    unint64_t v8 = a3 + 16;
    if (a3 + 16 <= a4 + a3 && v8 + *(unsigned int *)(a3 + 4) <= v7 && *(_DWORD *)a3 == -559025833)
    {
      unint64_t v9 = a3;
      do
      {
        int v10 = *(_DWORD *)v9;
        if (*(_DWORD *)v9 == -242132755) {
          break;
        }
        if ((v10 & 0xFFFFFFF0) == 0x20) {
          int v10 = 17;
        }
        switch(v10)
        {
          case 2078:
            [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            int v12 = v6;
            v13 = v11;
            v14 = @"internal";
            goto LABEL_33;
          case 2079:
            [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            int v12 = v6;
            v13 = v11;
            v14 = @"internal_compressed";
            goto LABEL_33;
          case 2080:
            [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            int v12 = v6;
            v13 = v11;
            v14 = @"iokit_mapped";
            goto LABEL_33;
          case 2081:
            [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            int v12 = v6;
            v13 = v11;
            v14 = @"alternate_accounting";
            goto LABEL_33;
          case 2082:
            [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            int v12 = v6;
            v13 = v11;
            v14 = @"alternate_accounting_compressed";
            goto LABEL_33;
          case 2083:
            [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            int v12 = v6;
            v13 = v11;
            v14 = @"purgeable_nonvolatile";
            goto LABEL_33;
          case 2084:
            [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            int v12 = v6;
            v13 = v11;
            v14 = @"purgeable_nonvolatile_compressed";
            goto LABEL_33;
          case 2085:
            [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            int v12 = v6;
            v13 = v11;
            v14 = @"page_table";
            goto LABEL_33;
          case 2086:
            [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            int v12 = v6;
            v13 = v11;
            v14 = @"phys_footprint";
            goto LABEL_33;
          case 2087:
            [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            int v12 = v6;
            v13 = v11;
            v14 = @"phys_footprint_lifetime_max";
            goto LABEL_33;
          case 2088:
            [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            int v12 = v6;
            v13 = v11;
            v14 = @"network_nonvolatile";
            goto LABEL_33;
          case 2089:
            [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            int v12 = v6;
            v13 = v11;
            v14 = @"network_nonvolatile_compressed";
            goto LABEL_33;
          case 2090:
            [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            int v12 = v6;
            v13 = v11;
            v14 = @"wired_mem";
            goto LABEL_33;
          case 2093:
            [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            int v12 = v6;
            v13 = v11;
            v14 = @"tagged_footprint";
            goto LABEL_33;
          case 2094:
            [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            int v12 = v6;
            v13 = v11;
            v14 = @"tagged_footprint_compressed";
            goto LABEL_33;
          case 2095:
            [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            int v12 = v6;
            v13 = v11;
            v14 = @"media_footprint";
            goto LABEL_33;
          case 2096:
            [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            int v12 = v6;
            v13 = v11;
            v14 = @"media_footprint_compressed";
            goto LABEL_33;
          case 2097:
            [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            int v12 = v6;
            v13 = v11;
            v14 = @"graphics_footprint";
            goto LABEL_33;
          case 2098:
            [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            int v12 = v6;
            v13 = v11;
            v14 = @"graphics_footprint_compressed";
            goto LABEL_33;
          case 2099:
            [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            int v12 = v6;
            v13 = v11;
            v14 = @"neural_footprint";
            goto LABEL_33;
          case 2100:
            [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(v9 + 16)];
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            int v12 = v6;
            v13 = v11;
            v14 = @"neural_footprint_compressed";
LABEL_33:
            [v12 setObject:v13 forKeyedSubscript:v14];

            break;
          default:
            break;
        }

        unint64_t v9 = v8 + *(unsigned int *)(v9 + 4);
        unint64_t v8 = v9 + 16;
      }

      while (v9 + 16 <= v7);
    }

    else
    {
      NSLog(@"invalid task corpse info provided to VMUProcessLedger");
    }

    mach_vm_deallocate(*MEMORY[0x1895FBBE0], a3, a4);
  }

  int v15 = (void *)[v6 copy];

  return v15;
}

+ (id)_getProcessLedgerDictFromKernelLedger:(int)a3
{
  buffer[58] = *(rusage_info_t *)MEMORY[0x1895F89C0];
  id v18 = objc_alloc_init(MEMORY[0x189603FC8]);
  if (!proc_pid_rusage(a3, 6, buffer))
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:buffer[30]];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 setObject:v4 forKeyedSubscript:@"phys_footprint_lifetime_max"];
  }

  uint64_t v5 = 0LL;
  uint64_t v6 = 40LL;
  do
  {
    uint64_t v7 = 2 * v6;
    uint64_t v19 = 2 * v6;
    uint64_t v5 = (char *)realloc(v5, 192 * v6);
    if ((ledger() & 0x80000000) != 0)
    {
      free(v5);
      NSLog(@"Unable to retrieve ledger template info in VMUProcessLedger");
LABEL_20:
      int v15 = 0LL;
      goto LABEL_21;
    }

    uint64_t v6 = v7;
  }

  while (v7 == v19);
  unint64_t v8 = (char *)malloc(48 * v19);
  if ((ledger() & 0x80000000) != 0)
  {
    free(v8);
    free(v5);
    NSLog(@"Unable to retrieve ledger entry info in VMUProcessLedger");
    goto LABEL_20;
  }

  if (v19 >= 1)
  {
    uint64_t v9 = 0LL;
    v17 = v8;
    do
    {
      uint64_t v10 = 0LL;
      v11 = &v8[48 * v9];
      do
      {
        if (!strcmp(ledgerNameDict[v10], &v5[96 * v9]))
        {
          if (!strcmp(&v5[96 * v9], "purgeable_nonvolatile_compress")) {
            int v12 = "purgeable_nonvolatile_compressed";
          }
          else {
            int v12 = &v5[96 * v9];
          }
          [MEMORY[0x189607968] numberWithLongLong:*(void *)v11, v17];
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          [NSString stringWithUTF8String:v12];
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          [v18 setObject:v13 forKeyedSubscript:v14];
        }

        ++v10;
      }

      while (v10 != 22);
      ++v9;
      unint64_t v8 = v17;
    }

    while (v9 < v19);
  }

  free(v5);
  free(v8);
  int v15 = (void *)[v18 copy];
LABEL_21:

  return v15;
}

@end
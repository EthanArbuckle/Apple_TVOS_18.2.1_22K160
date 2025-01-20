@interface NSMutableDictionary(OSAStackshotKCDataExtension)
- (void)addTurnstileInfoDesc:()OSAStackshotKCDataExtension count:elSize:;
- (void)addWaitInfoDesc:()OSAStackshotKCDataExtension count:elSize:;
- (void)parsePortLabelContainer:()OSAStackshotKCDataExtension;
@end

@implementation NSMutableDictionary(OSAStackshotKCDataExtension)

- (void)addTurnstileInfoDesc:()OSAStackshotKCDataExtension count:elSize:
{
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    unsigned int v10 = 0;
    uint64_t v11 = 0LL;
    uint64_t v12 = MEMORY[0x1895F87A8];
    do
    {
      v13[0] = v12;
      v13[1] = 3221225472LL;
      v14 = __86__NSMutableDictionary_OSAStackshotKCDataExtension__addTurnstileInfoDesc_count_elSize___block_invoke;
      v15 = &unk_189E201D8;
      v16 = a1;
      id v17 = v9;
      v14((uint64_t)v13, v11, a3 + v10);

      ++v11;
      v10 += a5;
    }

    while (a4 != v11);
  }

  if ([v9 count]) {
    [a1 setObject:v9 forKeyedSubscript:@"turnstileInfo"];
  }
}

- (void)addWaitInfoDesc:()OSAStackshotKCDataExtension count:elSize:
{
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    unsigned int v10 = 0;
    uint64_t v11 = 0LL;
    uint64_t v12 = MEMORY[0x1895F87A8];
    do
    {
      v13[0] = v12;
      v13[1] = 3221225472LL;
      v14 = __81__NSMutableDictionary_OSAStackshotKCDataExtension__addWaitInfoDesc_count_elSize___block_invoke;
      v15 = &unk_189E20200;
      v16 = a1;
      id v17 = v9;
      v14((uint64_t)v13, v11, (uint64_t *)(a3 + v10));

      ++v11;
      v10 += a5;
    }

    while (a4 != v11);
  }

  if ([v9 count]) {
    [a1 setObject:v9 forKeyedSubscript:@"waitInfo"];
  }
}

- (void)parsePortLabelContainer:()OSAStackshotKCDataExtension
{
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = (void *)objc_opt_new();
    [a1 setObject:v8 forKeyedSubscript:@"portlabels"];
  }

  uint64_t v9 = a3 + 16;
  if (a3 + 16 <= a4)
  {
    uint64_t v10 = 0xFFFFFFFFLL;
    id v17 = @"(unknown)";
    do
    {
      int v11 = *(_DWORD *)a3;
      if (*(_DWORD *)a3 == -242132755) {
        break;
      }
      if ((v11 & 0xFFFFFFF0) == 0x20) {
        int v11 = 17;
      }
      switch(v11)
      {
        case 19:
          if (*(_DWORD *)(a3 + 16) != 2356) {
            -[NSMutableDictionary(OSAStackshotKCDataExtension) parsePortLabelContainer:].cold.2();
          }
          uint64_t v10 = *(unsigned int *)(a3 + 8);
          break;
        case 2357:
          v13 = (*(_WORD *)(a3 + 18) & 2) != 0 ? " (service throttled by launchd)" : "";
          objc_msgSend(NSString, "stringWithFormat:", @"%d", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          [NSString stringWithFormat:@"%@%s", v17, v13];
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          [a1 objectForKeyedSubscript:@"portlabels"];
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          [v16 setObject:v15 forKeyedSubscript:v14];

          break;
        case 2358:
          uint64_t v12 = [NSString stringWithUTF8String:a3 + 16];

          id v17 = (__CFString *)v12;
          break;
        default:
          goto LABEL_22;
      }

      a3 = v9 + *(unsigned int *)(a3 + 4);
      uint64_t v9 = a3 + 16;
    }

    while (a3 + 16 <= a4);
  }

  else
  {
    id v17 = @"(unknown)";
  }

- (void)parsePortLabelContainer:()OSAStackshotKCDataExtension .cold.1()
{
  __assert_rtn( "-[NSMutableDictionary(OSAStackshotKCDataExtension) parsePortLabelContainer:]",  "OSAStackShotReport.m",  318,  "portlabel_info->portlabel_id == portlabel_id");
}

- (void)parsePortLabelContainer:()OSAStackshotKCDataExtension .cold.2()
{
  __assert_rtn( "-[NSMutableDictionary(OSAStackshotKCDataExtension) parsePortLabelContainer:]",  "OSAStackShotReport.m",  330,  "kcdata_iter_container_type(iter) == STACKSHOT_KCCONTAINER_PORTLABEL");
}

@end
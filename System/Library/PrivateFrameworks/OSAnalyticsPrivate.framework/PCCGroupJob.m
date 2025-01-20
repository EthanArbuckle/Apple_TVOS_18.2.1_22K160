@interface PCCGroupJob
- (PCCGroupJob)initWithID:(id)a3 forTarget:(id)a4 options:(id)a5;
- (id)description;
- (id)result;
- (id)type;
- (void)prepareNext;
- (void)registerResult:(BOOL)a3 error:(id)a4;
@end

@implementation PCCGroupJob

- (id)result
{
  errObj = self->super._errObj;
  if (!errObj) {
    errObj = self->_content;
  }
  return errObj;
}

- (id)type
{
  return self->_group_type;
}

- (PCCGroupJob)initWithID:(id)a3 forTarget:(id)a4 options:(id)a5
{
  v40[5] = *MEMORY[0x1895F89C0];
  id v8 = a5;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___PCCGroupJob;
  v9 = -[PCCJob initWithID:forTarget:options:](&v33, sel_initWithID_forTarget_options_, a3, a4, v8);
  if (v9)
  {
    uint64_t v10 = objc_opt_new();
    log_sets = v9->_log_sets;
    v9->_log_sets = (NSMutableArray *)v10;

    [v8 objectForKeyedSubscript:@"allFiles"];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 BOOLValue];

    if ((_DWORD)v13) {
      v14 = @"xfer-all";
    }
    else {
      v14 = @"xfer-group";
    }
    objc_storeStrong((id *)&v9->_group_type, v14);
    v15 = v9->_log_sets;
    v39[0] = @"routing";
    v39[1] = @"extensions";
    v40[0] = @"<sync>";
    v40[1] = &unk_18A166C70;
    v40[2] = @"log-aggregated";
    v39[2] = @"<sort>";
    v39[3] = @"<exempt>";
    [MEMORY[0x189607968] numberWithBool:v13];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v39[4] = @"<cleanup>";
    uint64_t v17 = MEMORY[0x189604A88];
    v40[3] = v16;
    v40[4] = MEMORY[0x189604A88];
    [MEMORY[0x189603F68] dictionaryWithObjects:v40 forKeys:v39 count:5];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)[v18 mutableCopy];
    -[NSMutableArray addObject:](v15, "addObject:", v19);

    v20 = v9->_log_sets;
    v37[0] = @"routing";
    v37[1] = @"extensions";
    v38[0] = @"<sync>";
    v38[1] = &unk_18A166C88;
    v38[2] = MEMORY[0x189604A80];
    v37[2] = @"<metadata>";
    v37[3] = @"<exempt>";
    [MEMORY[0x189607968] numberWithBool:v13];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v37[4] = @"<cleanup>";
    v38[3] = v21;
    v38[4] = v17;
    [MEMORY[0x189603F68] dictionaryWithObjects:v38 forKeys:v37 count:5];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)[v22 mutableCopy];
    -[NSMutableArray addObject:](v20, "addObject:", v23);

    if ((_DWORD)v13)
    {
      v24 = v9->_log_sets;
      v25 = (void *)[&unk_18A166B78 mutableCopy];
      -[NSMutableArray addObject:](v24, "addObject:", v25);
    }

    v26 = (void *)MEMORY[0x189611AF0];
    v27 = v9->_log_sets;
    [MEMORY[0x189611B08] sharedInstance];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v28 pathSubmission];
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v29;
    [MEMORY[0x189603F18] arrayWithObjects:&v36 count:1];
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_unsigned int total_count = [v26 scanLogs:v27 from:v30];

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int total_count = v9->_total_count;
      *(_DWORD *)buf = 67109120;
      unsigned int v35 = total_count;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "gathered %u files for transfer",  buf,  8u);
    }

    -[PCCGroupJob prepareNext](v9, "prepareNext");
  }

  return v9;
}

- (id)description
{
  v3 = (void *)NSString;
  v4 = -[PCCJob jid](self, "jid");
  uint64_t success_count = self->_success_count;
  uint64_t total_count = self->_total_count;
  v7 = -[OSALog filepath](self->super._package, "filepath");
  [v3 stringWithFormat:@"group %@ %d/%d %@", v4, success_count, total_count, v7];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)prepareNext
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  package = self->super._package;
  self->super._package = 0LL;

  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  obj = self->_log_sets;
  uint64_t v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v38,  v54,  16LL);
  if (v35)
  {
    uint64_t v34 = *(void *)v39;
LABEL_3:
    uint64_t v4 = 0LL;
    while (1)
    {
      if (*(void *)v39 != v34) {
        objc_enumerationMutation(obj);
      }
      uint64_t v36 = v4;
      v5 = *(void **)(*((void *)&v38 + 1) + 8 * v4);
      [v5 objectForKeyedSubscript:@"routing"];
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 objectForKeyedSubscript:@"logs"];
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 objectForKeyedSubscript:@"<metadata>"];
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        [v5 objectForKeyedSubscript:@"<metadata>"];
        id v8 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v9 = [v8 BOOLValue];
      }

      else
      {
        uint64_t v9 = 1LL;
      }

      v52[0] = @"<metadata>";
      [MEMORY[0x189607968] numberWithBool:v9];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = v10;
      v52[1] = @"<exempt>";
      v11 = (void *)MEMORY[0x189607968];
      objc_msgSend(v5, "objectForKeyedSubscript:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "numberWithBool:", objc_msgSend(v12, "BOOLValue"));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      v53[1] = v13;
      v52[2] = @"<cleanup>";
      v14 = (void *)MEMORY[0x189607968];
      objc_msgSend(v5, "objectForKeyedSubscript:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "numberWithBool:", objc_msgSend(v15, "BOOLValue"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v53[2] = v16;
      [MEMORY[0x189603F68] dictionaryWithObjects:v53 forKeys:v52 count:3];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

      while (1)
      {

        if (![v6 count]) {
          break;
        }
        [v6 firstObject];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 removeObjectAtIndex:0];
        v50[0] = @"current";
        [MEMORY[0x189607968] numberWithUnsignedInt:self->_success_count + 1];
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v51[0] = v18;
        v50[1] = @"rejects";
        [MEMORY[0x189607968] numberWithUnsignedInt:self->_rejected_count];
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v51[1] = v19;
        v50[2] = @"errors";
        [MEMORY[0x189607968] numberWithUnsignedInt:self->_error_count];
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v51[2] = v20;
        v50[3] = @"total";
        [MEMORY[0x189607968] numberWithUnsignedInt:self->_total_count];
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v51[3] = v21;
        [MEMORY[0x189603F68] dictionaryWithObjects:v51 forKeys:v50 count:4];
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[PCCJob packageLog:forRouting:info:options:](self, "packageLog:forRouting:info:options:", v10, v37, v12, v17);
        if (self->super._package)
        {

          break;
        }

        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v45 = v10;
          _os_log_impl(&dword_187E6F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "unable to package %@", buf, 0xCu);
        }

        ++self->_rejected_count;
      }

      v22 = self->super._package;

      if (v22) {
        break;
      }
      uint64_t v4 = v36 + 1;
      if (v36 + 1 == v35)
      {
        uint64_t v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v38,  v54,  16LL);
        if (v35) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if (!self->super._package)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int success_count = self->_success_count;
      unsigned int rejected_count = self->_rejected_count;
      unsigned int error_count = self->_error_count;
      v26 = -[PCCJob jid](self, "jid");
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v45 = success_count;
      *(_WORD *)&v45[4] = 1024;
      *(_DWORD *)&v45[6] = rejected_count;
      __int16 v46 = 1024;
      unsigned int v47 = error_count;
      __int16 v48 = 2112;
      v49 = v26;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "finished transferring %u logs successfully (%u rejected, %u errors) for job %@",  buf,  0x1Eu);
    }

    v42[0] = @"current";
    [MEMORY[0x189607968] numberWithUnsignedInt:self->_success_count];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v27;
    v42[1] = @"rejects";
    [MEMORY[0x189607968] numberWithUnsignedInt:self->_rejected_count];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v28;
    v42[2] = @"errors";
    [MEMORY[0x189607968] numberWithUnsignedInt:self->_error_count];
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v43[2] = v29;
    v42[3] = @"total";
    [MEMORY[0x189607968] numberWithUnsignedInt:self->_total_count];
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v43[3] = v30;
    [MEMORY[0x189603F68] dictionaryWithObjects:v43 forKeys:v42 count:4];
    v31 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    content = self->_content;
    self->_content = v31;

    CFPreferencesSetAppValue( @"LastSuccess",  (CFPropertyListRef)[MEMORY[0x189603F50] date],  @"com.apple.ProxiedCrashCopier");
  }

- (void)registerResult:(BOOL)a3 error:(id)a4
{
  BOOL v5 = a3;
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v7 = a4;
  package = self->super._package;
  if (!package) {
    -[PCCGroupJob registerResult:error:].cold.1();
  }
  if (v5)
  {
    -[OSALog retire:](package, "retire:", "transferred");
    self->_consecutive_unsigned int error_count = 0;
    ++self->_success_count;
LABEL_7:
    -[PCCGroupJob prepareNext](self, "prepareNext");
    goto LABEL_8;
  }

  ++self->_error_count;
  unsigned int v9 = self->_consecutive_error_count + 1;
  self->_consecutive_unsigned int error_count = v9;
  if (v9 <= 2)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      consecutive_unsigned int error_count = self->_consecutive_error_count;
      v12[0] = 67109120;
      v12[1] = consecutive_error_count;
      _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "consecutive file send failure #%u",  (uint8_t *)v12,  8u);
    }

    goto LABEL_7;
  }

  objc_storeStrong((id *)&self->super._errObj, a4);
  v11 = self->super._package;
  self->super._package = 0LL;

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12[0]) = 0;
    _os_log_impl( &dword_187E6F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "file send failure limit, abandoning job",  (uint8_t *)v12,  2u);
  }

- (void).cxx_destruct
{
}

- (void)registerResult:error:.cold.1()
{
}

@end
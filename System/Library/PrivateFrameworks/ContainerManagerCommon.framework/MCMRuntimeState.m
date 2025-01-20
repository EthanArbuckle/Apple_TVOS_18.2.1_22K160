@interface MCMRuntimeState
- (MCMRuntimeState)init;
- (MCMTestLocks)testLocks;
- (NSURL)url;
- (id)_accumulateAsPlist;
- (id)_accumulateTestLocksAsPlistArray;
- (id)_urlForDirectory;
- (void)_accumulateAndPersist;
- (void)_loadAndRestore;
- (void)_restoreFromPlist:(id)a3;
- (void)_restoreTestLock:(unint64_t)a3 count:(unint64_t)a4;
- (void)_restoreTestLocksWithPlistArray:(id)a3;
- (void)persist;
- (void)reset;
- (void)restore;
@end

@implementation MCMRuntimeState

- (MCMRuntimeState)init
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MCMRuntimeState;
  v2 = -[MCMRuntimeState init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = -[MCMRuntimeState _urlForDirectory](v2, "_urlForDirectory");
    [v4 URLByAppendingPathComponent:@"runtime_state" isDirectory:0];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 URLByAppendingPathExtension:@"plist"];
    url = v3->_url;
    v3->_url = (NSURL *)v6;

    uint64_t v8 = +[MCMTestLocks sharedInstance](&OBJC_CLASS___MCMTestLocks, "sharedInstance");
    testLocks = v3->_testLocks;
    v3->_testLocks = (MCMTestLocks *)v8;
  }

  return v3;
}

- (void)reset
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[MCMRuntimeState url](self, "url");
  [v4 removeItemAtURL:v3 error:0];
}

- (void)persist
{
}

- (void)restore
{
}

- (id)_urlForDirectory
{
  else {
    v2 = @"mobile";
  }
  v3 = +[MCMPOSIXUser posixUserWithName:](&OBJC_CLASS___MCMPOSIXUser, "posixUserWithName:", v2);
  [v3 homeDirectoryURL];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 URLByAppendingPathComponent:@"Library/MobileContainerManager" isDirectory:1];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_accumulateAndPersist
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x1895CE3A8](self, a2);
  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MCMRuntimeState _accumulateAsPlist](self, "_accumulateAsPlist");
  -[MCMRuntimeState url](self, "url");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = 0LL;
  char v7 = objc_msgSend(v5, "MCM_writeToURL:withOptions:fileManager:error:", v6, 0x10000000, v4, &v10);
  id v8 = v10;

  if ((v7 & 1) == 0)
  {
    container_log_handle_for_category();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v8;
      _os_log_error_impl( &dword_188846000,  v9,  OS_LOG_TYPE_ERROR,  "Failed to write runtime state data; error = %@",
        buf,
        0xCu);
    }
  }

  objc_autoreleasePoolPop(v3);
}

- (id)_accumulateAsPlist
{
  v10[2] = *MEMORY[0x1895F89C0];
  v9[0] = @"MCMRuntimeStateTestLocksEnabled";
  v3 = (void *)MEMORY[0x189607968];
  -[MCMRuntimeState testLocks](self, "testLocks");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "enabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = @"MCMRuntimeStateTestLocks";
  v10[0] = v5;
  -[MCMRuntimeState _accumulateTestLocksAsPlistArray](self, "_accumulateTestLocksAsPlistArray");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v10 forKeys:v9 count:2];
  char v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_accumulateTestLocksAsPlistArray
{
  v13[2] = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FA8] array];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (uint64_t i = 0LL; i != 15; ++i)
  {
    v5 = -[MCMRuntimeState testLocks](self, "testLocks");
    uint64_t v6 = [v5 countOfLock:i];

    if (v6 >= 1)
    {
      v12[0] = @"MCMRuntimeStateTestLocksNum";
      [MEMORY[0x189607968] numberWithUnsignedLongLong:i];
      char v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12[1] = @"MCMRuntimeStateTestLocksCount";
      v13[0] = v7;
      [MEMORY[0x189607968] numberWithInteger:v6];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13[1] = v8;
      [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:v12 count:2];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 addObject:v9];
    }
  }

  id v10 = (void *)[v3 copy];

  return v10;
}

- (void)_loadAndRestore
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x1895CE3A8](self, a2);
  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x189603F68];
  -[MCMRuntimeState url](self, "url");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = 0LL;
  objc_msgSend(v5, "MCM_dictionaryWithContentsOfURL:options:fileManager:fsNode:error:", v6, 0, v4, 0, &v12);
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v12;

  if (!v7)
  {
    [v8 domain];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v9 isEqualToString:*MEMORY[0x189607688]])
    {
      uint64_t v10 = [v8 code];

      if (v10 == 2)
      {
        container_log_handle_for_category();
        objc_super v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl( &dword_188846000,  v11,  OS_LOG_TYPE_DEBUG,  "Did not find runtime state to restore, so skipping",  buf,  2u);
        }

- (void)_restoreFromPlist:(id)a3
{
  id v12 = a3;
  [v12 objectForKeyedSubscript:@"MCMRuntimeStateTestLocksEnabled"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0LL;
  }

  if (v6)
  {
    uint64_t v7 = [v6 BOOLValue];
    -[MCMRuntimeState testLocks](self, "testLocks");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setEnabled:v7];
  }

  [v12 objectForKeyedSubscript:@"MCMRuntimeStateTestLocks"];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v10 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0LL;
  }

  if (v11) {
    -[MCMRuntimeState _restoreTestLocksWithPlistArray:](self, "_restoreTestLocksWithPlistArray:", v11);
  }
}

- (void)_restoreTestLocksWithPlistArray:(id)a3
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v23 + 1) + 8 * v7);
        objc_opt_class();
        id v9 = v8;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

LABEL_11:
          id v12 = 0LL;
          id v13 = 0LL;
          id v14 = 0LL;
          goto LABEL_12;
        }

        if (!v9) {
          goto LABEL_11;
        }
        [v9 objectForKeyedSubscript:@"MCMRuntimeStateTestLocksNum"];
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        id v11 = v10;
        if ((objc_opt_isKindOfClass() & 1) != 0) {
          id v12 = v11;
        }
        else {
          id v12 = 0LL;
        }

        [v9 objectForKeyedSubscript:@"MCMRuntimeStateTestLocksCount"];
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        id v17 = v16;
        if ((objc_opt_isKindOfClass() & 1) != 0) {
          id v13 = v17;
        }
        else {
          id v13 = 0LL;
        }

        if (v12 && v13)
        {
          -[MCMRuntimeState _restoreTestLock:count:]( self,  "_restoreTestLock:count:",  [v12 unsignedLongLongValue],  objc_msgSend(v13, "unsignedLongValue"));
          id v14 = v9;
          goto LABEL_15;
        }

        id v14 = v9;
LABEL_12:
        container_log_handle_for_category();
        uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v21 = v9;
          _os_log_error_impl( &dword_188846000,  v15,  OS_LOG_TYPE_ERROR,  "Malformed test locks dict when restoring state; testLockValue = %@",
            buf,
            0xCu);
        }

LABEL_15:
        ++v7;
      }

      while (v5 != v7);
      uint64_t v18 = [v3 countByEnumeratingWithState:&v23 objects:v22 count:16];
      uint64_t v5 = v18;
    }

    while (v18);
  }
}

- (void)_restoreTestLock:(unint64_t)a3 count:(unint64_t)a4
{
  if (a4)
  {
    unint64_t v4 = a4;
    do
    {
      -[MCMRuntimeState testLocks](self, "testLocks");
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 acquireLock:a3];

      --v4;
    }

    while (v4);
  }

- (MCMTestLocks)testLocks
{
  return self->_testLocks;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
}

@end
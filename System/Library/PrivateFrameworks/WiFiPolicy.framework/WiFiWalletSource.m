@interface WiFiWalletSource
- (NSMutableDictionary)networks;
- (NSMutableSet)relevantPassIdentifiers;
- (OS_dispatch_queue)queue;
- (PKPassLibrary)passLibrary;
- (WiFiWalletSource)init;
- (WiFiWalletSource)initWithChangeHandler:(id)a3;
- (id)_createWiFiWalletPassFromPass:(id)a3;
- (id)_networksWithIdentifier:(id)a3;
- (id)candidateNetworks;
- (id)changeHandler;
- (id)expiredWalletIDs;
- (id)relevancyHandler;
- (id)relevantNetworks;
- (void)_addPass:(id)a3;
- (void)_handlePassLibraryChange:(id)a3;
- (void)_handleRelevantPassUpdate:(id)a3;
- (void)_initializeWiFiPasses;
- (void)_issueRelevancyCallbackWithRelevantNetworks:(id)a3 notRelevantNetworks:(id)a4;
- (void)_passDidBecomeRelevant:(id)a3;
- (void)_passLibraryDidBecomeRelevantNotification:(id)a3;
- (void)_passLibraryDidChange:(id)a3;
- (void)_removeRelevantPasses;
- (void)dealloc;
- (void)setChangeHandler:(id)a3;
- (void)setNetworks:(id)a3;
- (void)setPassLibrary:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRelevancyHandler:(id)a3;
- (void)setRelevantPassIdentifiers:(id)a3;
@end

@implementation WiFiWalletSource

- (WiFiWalletSource)init
{
  return -[WiFiWalletSource initWithChangeHandler:](self, "initWithChangeHandler:", 0LL);
}

- (WiFiWalletSource)initWithChangeHandler:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___WiFiWalletSource;
  v5 = -[WiFiWalletSource init](&v19, sel_init);
  if (!v5)
  {
    v17 = 0LL;
    goto LABEL_9;
  }

  if (v4)
  {
    uint64_t v6 = MEMORY[0x1895BA9F4](v4);
    id changeHandler = v5->changeHandler;
    v5->id changeHandler = (id)v6;
  }

  dispatch_queue_t v8 = dispatch_queue_create("com.apple.wifi.wallet-source", 0LL);
  queue = v5->_queue;
  v5->_queue = (OS_dispatch_queue *)v8;

  if (!v5->_queue) {
    goto LABEL_12;
  }
  v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  networks = v5->_networks;
  v5->_networks = v10;

  if (!v5->_networks
    || (v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]),
        relevantPassIdentifiers = v5->_relevantPassIdentifiers,
        v5->_relevantPassIdentifiers = v12,
        relevantPassIdentifiers,
        !v5->_relevantPassIdentifiers))
  {
LABEL_12:
    v17 = v5;
    v5 = 0LL;
    goto LABEL_9;
  }

  if (([MEMORY[0x189611C68] isPassLibraryAvailable] & 1) == 0)
  {
    NSLog(@"PKPassLibrary is not available");
    goto LABEL_12;
  }

  v14 = (PKPassLibrary *)objc_alloc_init(MEMORY[0x189611C68]);
  passLibrary = v5->_passLibrary;
  v5->_passLibrary = v14;

  -[WiFiWalletSource _initializeWiFiPasses](v5, "_initializeWiFiPasses");
  [MEMORY[0x189607958] defaultCenter];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 addObserver:v5 selector:sel__passLibraryDidChange_ name:*MEMORY[0x189611C78] object:v5->_passLibrary];

  [MEMORY[0x189607860] defaultCenter];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 addObserver:v5 selector:sel__passLibraryDidBecomeRelevantNotification_ name:*MEMORY[0x189611C88] object:0 suspensionBehavior:2];
LABEL_9:

  return v5;
}

- (void)dealloc
{
  if (self->_passLibrary)
  {
    [MEMORY[0x189607958] defaultCenter];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 removeObserver:self name:*MEMORY[0x189611C78] object:0];
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___WiFiWalletSource;
  -[WiFiWalletSource dealloc](&v4, sel_dealloc);
}

- (void)_initializeWiFiPasses
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __41__WiFiWalletSource__initializeWiFiPasses__block_invoke;
  block[3] = &unk_18A16E160;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __41__WiFiWalletSource__initializeWiFiPasses__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained passLibrary];
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 passesOfType:0];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
        id v12 = objc_loadWeakRetained(v2);
        [v12 _addPass:v11];

        ++v10;
      }

      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v8);
  }

  [*(id *)(a1 + 32) passLibrary];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __41__WiFiWalletSource__initializeWiFiPasses__block_invoke_2;
  v14[3] = &unk_18A16E778;
  v14[4] = *(void *)(a1 + 32);
  [v13 fetchCurrentRelevantPassInfo:v14];
}

void __41__WiFiWalletSource__initializeWiFiPasses__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  NSLog(@"relevant passes: %@", v3);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(a1 + 32) _handleRelevantPassUpdate:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }

      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }
}

- (void)_addPass:(id)a3
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 semantics];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      [v5 semantics];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v23;
        uint64_t v11 = *MEMORY[0x189611C98];
        while (2)
        {
          for (uint64_t i = 0LL; i != v9; ++i)
          {
            if (*(void *)v23 != v10) {
              objc_enumerationMutation(v7);
            }
            if ([*(id *)(*((void *)&v22 + 1) + 8 * i) isEqualToString:v11])
            {

              [v5 uniqueID];
              __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
              [v5 serialNumber];
              __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
              NSLog( @"%s: adding pass %@ (uniqueID: %@, serialNumber: %@)",  "-[WiFiWalletSource _addPass:]",  v5,  v15,  v16);

              -[WiFiWalletSource _createWiFiWalletPassFromPass:](self, "_createWiFiWalletPassFromPass:", v5);
              id v14 = (id)objc_claimAutoreleasedReturnValue();
              if (v14)
              {
                -[WiFiWalletSource networks](self, "networks");
                __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
                [v5 uniqueID];
                __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
                [v17 setObject:v14 forKey:v18];

                -[WiFiWalletSource changeHandler](self, "changeHandler");
                objc_super v19 = (void *)objc_claimAutoreleasedReturnValue();

                if (v19)
                {
                  block[0] = MEMORY[0x1895F87A8];
                  block[1] = 3221225472LL;
                  block[2] = __29__WiFiWalletSource__addPass___block_invoke;
                  block[3] = &unk_18A16C748;
                  block[4] = self;
                  id v14 = v14;
                  id v21 = v14;
                  dispatch_async(MEMORY[0x1895F8AE0], block);
                }
              }

              else
              {
                NSLog( @"%s: Failed to create wifi wallet pass from pass %@",  "-[WiFiWalletSource _addPass:]",  v5);
              }

              goto LABEL_16;
            }
          }

          uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
    }
  }

  [v5 localizedDescription];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(@"%s: pass (%@ - %@) doesn't contain wifi semantics", "-[WiFiWalletSource _addPass:]", v5, v13);

  id v14 = 0LL;
LABEL_16:
}

void __29__WiFiWalletSource__addPass___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, void))v2 + 2))(v2, *(void *)(a1 + 40), 0LL);
}

- (void)_passLibraryDidBecomeRelevantNotification:(id)a3
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __62__WiFiWalletSource__passLibraryDidBecomeRelevantNotification___block_invoke;
  block[3] = &unk_18A16C770;
  block[4] = self;
  dispatch_async(v4, block);
}

void __62__WiFiWalletSource__passLibraryDidBecomeRelevantNotification___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __62__WiFiWalletSource__passLibraryDidBecomeRelevantNotification___block_invoke_2;
  v3[3] = &unk_18A16E778;
  v3[4] = *(void *)(a1 + 32);
  [v2 fetchCurrentRelevantPassInfo:v3];
}

void __62__WiFiWalletSource__passLibraryDidBecomeRelevantNotification___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    NSLog(@"relevant passes: %@", v3);
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(a1 + 32) _handleRelevantPassUpdate:*(void *)(*((void *)&v10 + 1) + 8 * i)];
        }

        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }

      while (v7);
    }
  }

  else
  {
    NSLog( @"%s: no relevant passes",  "-[WiFiWalletSource _passLibraryDidBecomeRelevantNotification:]_block_invoke_2");
    [*(id *)(a1 + 32) _removeRelevantPasses];
  }
}

- (void)_passLibraryDidChange:(id)a3
{
  id v4 = a3;
  NSLog(@"library changed: %@", v4);
  -[WiFiWalletSource queue](self, "queue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __42__WiFiWalletSource__passLibraryDidChange___block_invoke;
  block[3] = &unk_18A16C748;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

void __42__WiFiWalletSource__passLibraryDidChange___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) userInfo];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 _handlePassLibraryChange:v2];
}

- (void)_handlePassLibraryChange:(id)a3
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    [v4 objectForKeyedSubscript:*MEMORY[0x189611C70]];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          -[WiFiWalletSource _addPass:](self, "_addPass:", *(void *)(*((void *)&v20 + 1) + 8 * v10++));
        }

        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }

      while (v8);
    }

    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x189611C90], 0);
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        uint64_t v15 = 0LL;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          -[WiFiWalletSource _addPass:](self, "_addPass:", *(void *)(*((void *)&v16 + 1) + 8 * v15++));
        }

        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }

      while (v13);
    }
  }
}

- (void)_handleRelevantPassUpdate:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (v4)
  {
    uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x189611C80]];
    if (v5)
    {
      id v6 = (void *)v5;
      -[WiFiWalletSource passLibrary](self, "passLibrary");
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 passWithUniqueID:v6];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[WiFiWalletSource _passDidBecomeRelevant:](self, "_passDidBecomeRelevant:", v8);
      }

      else
      {
        NSLog( @"%s: unable to find pass with uniqueID %@",  "-[WiFiWalletSource _handleRelevantPassUpdate:]",  v6);
      }
    }

    else
    {
      NSLog(@"%s: missing uniqueID for passInfo %@", "-[WiFiWalletSource _handleRelevantPassUpdate:]", v9);
    }
  }

  else
  {
    NSLog(@"%s: passInfo is nil", "-[WiFiWalletSource _handleRelevantPassUpdate:]");
  }
}

- (void)_passDidBecomeRelevant:(id)a3
{
  id v10 = a3;
  if (v10)
  {
    -[WiFiWalletSource relevantPassIdentifiers](self, "relevantPassIdentifiers");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 uniqueID];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 addObject:v5];

    [v10 uniqueID];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog( @"%s: pass is now relevant (%@, identifier %@"),  "-[WiFiWalletSource _passDidBecomeRelevant:]",  v10,  v6;

    [v10 uniqueID];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiWalletSource _networksWithIdentifier:](self, "_networksWithIdentifier:", v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[WiFiWalletSource _issueRelevancyCallbackWithRelevantNetworks:notRelevantNetworks:]( self,  "_issueRelevancyCallbackWithRelevantNetworks:notRelevantNetworks:",  v8,  0LL);
    }

    else
    {
      [v10 uniqueID];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog( @"%s: no relevant networks found for pass %@ (identifier %@)",  "-[WiFiWalletSource _passDidBecomeRelevant:]",  v10,  v9);
    }
  }

  else
  {
    NSLog(@"%s: no pass given for relevancy", "-[WiFiWalletSource _passDidBecomeRelevant:]");
  }
}

- (void)_removeRelevantPasses
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  -[WiFiWalletSource relevantPassIdentifiers](self, "relevantPassIdentifiers");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 count];

  if (v4)
  {
    -[WiFiWalletSource relevantPassIdentifiers](self, "relevantPassIdentifiers");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(@"%s: relevant pass idenitfiers %@", "-[WiFiWalletSource _removeRelevantPasses]", v5);

    [MEMORY[0x189603FE0] set];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    -[WiFiWalletSource relevantPassIdentifiers](self, "relevantPassIdentifiers");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          -[WiFiWalletSource _networksWithIdentifier:](self, "_networksWithIdentifier:", v12);
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v14 = v13;
          if (v13)
          {
            [v13 allObjects];
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
            [v6 addObjectsFromArray:v15];
          }

          else
          {
            NSLog( @"%s: no networks found for identifier %@",  "-[WiFiWalletSource _removeRelevantPasses]",  v12);
          }
        }

        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }

      while (v9);
    }

    -[WiFiWalletSource _issueRelevancyCallbackWithRelevantNetworks:notRelevantNetworks:]( self,  "_issueRelevancyCallbackWithRelevantNetworks:notRelevantNetworks:",  0LL,  v6);
    -[WiFiWalletSource relevantPassIdentifiers](self, "relevantPassIdentifiers");
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 removeAllObjects];
  }

  else
  {
    NSLog(@"%s: no relevant passes", "-[WiFiWalletSource _removeRelevantPasses]");
  }

- (void)_issueRelevancyCallbackWithRelevantNetworks:(id)a3 notRelevantNetworks:(id)a4
{
  unint64_t v9 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  -[WiFiWalletSource relevancyHandler](self, "relevancyHandler");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v9 | v6)
    {
      -[WiFiWalletSource relevancyHandler](self, "relevancyHandler");
      uint64_t v8 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      v8[2](v8, v9, v6);
    }

    else
    {
      NSLog( @"%s: tried to isssue callback without relevant or non-relevant networks",  "-[WiFiWalletSource _issueRelevancyCallbackWithRelevantNetworks:notRelevantNetworks:]");
    }
  }
}

- (id)_createWiFiWalletPassFromPass:(id)a3
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  [v3 semantics];
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0LL;
    uint64_t v7 = *(void *)v49;
    uint64_t v8 = *MEMORY[0x189611C98];
    uint64_t v9 = *MEMORY[0x189611CA8];
    uint64_t v10 = *MEMORY[0x189611CA0];
    uint64_t v37 = *MEMORY[0x189611C98];
    uint64_t v38 = *(void *)v49;
    while (2)
    {
      uint64_t v11 = 0LL;
      uint64_t v39 = v5;
      do
      {
        if (*(void *)v49 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v48 + 1) + 8 * v11);
        if ([v12 isEqualToString:v8])
        {
          uint64_t v42 = v11;
          [v3 localizedName];
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v3 localizedDescription];
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(@"pass has WiFi %@ : %@", v13, v14);

          [v3 semantics];
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
          [v15 objectForKey:v12];
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();

          [v16 dictionariesValue];
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v18 = [v17 count];

          if (!v18)
          {
            NSLog( @"%s: pass (%@) has a wifiAccess key but no entries",  "-[WiFiWalletSource _createWiFiWalletPassFromPass:]",  v3);

            v35 = 0LL;
            goto LABEL_25;
          }

          [MEMORY[0x189603FE0] set];
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          __int128 v46 = 0u;
          __int128 v47 = 0u;
          __int128 v44 = 0u;
          __int128 v45 = 0u;
          v41 = v16;
          [v16 dictionariesValue];
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v20 = [v19 countByEnumeratingWithState:&v44 objects:v52 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v45;
            do
            {
              for (uint64_t i = 0LL; i != v21; ++i)
              {
                if (*(void *)v45 != v22) {
                  objc_enumerationMutation(v19);
                }
                __int128 v24 = *(void **)(*((void *)&v44 + 1) + 8 * i);
                __int128 v25 = objc_alloc_init(&OBJC_CLASS___WiFiWalletPass);
                [v3 uniqueID];
                uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
                -[WiFiWalletPass setUniqueIdentifier:](v25, "setUniqueIdentifier:", v26);

                [v24 objectForKey:v9];
                uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
                -[WiFiWalletPass setSSID:](v25, "setSSID:", v27);

                [v24 objectForKey:v10];
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                -[WiFiWalletPass setPassword:](v25, "setPassword:", v28);

                [v3 serialNumber];
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                -[WiFiWalletPass setSerialNumber:](v25, "setSerialNumber:", v29);

                [v3 relevantDate];
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                -[WiFiWalletPass setRelevantDate:](v25, "setRelevantDate:", v30);

                [v3 localizedDescription];
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                -[WiFiWalletPass setLocalizedDescription:](v25, "setLocalizedDescription:", v31);
                v32 = -[WiFiWalletPass SSID](v25, "SSID");
                if (v32)
                {
                  v33 = -[WiFiWalletPass SSID](v25, "SSID");
                  uint64_t v34 = [v33 length];

                  if (v34)
                  {
                    [v43 addObject:v25];
                    NSLog( @"%s: added wifiInfo: %@",  "-[WiFiWalletSource _createWiFiWalletPassFromPass:]",  v25);
                  }
                }
              }

              uint64_t v21 = [v19 countByEnumeratingWithState:&v44 objects:v52 count:16];
            }

            while (v21);
          }

          uint64_t v11 = v42;
          id v6 = v43;
          uint64_t v8 = v37;
          uint64_t v7 = v38;
          uint64_t v5 = v39;
        }

        ++v11;
      }

      while (v11 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  else
  {
    id v6 = 0LL;
  }

  id v6 = v6;
  v35 = v6;
LABEL_25:

  return v35;
}

- (id)_networksWithIdentifier:(id)a3
{
  id v4 = a3;
  -[WiFiWalletSource networks](self, "networks");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKey:v4];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6) {
    NSLog( @"%s: relevant networks are nil for identifier %@",  "-[WiFiWalletSource _networksWithIdentifier:]",  v4);
  }

  return v6;
}

- (id)candidateNetworks
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FE0] set];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  -[WiFiWalletSource networks](self, "networks", 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 allValues];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v9) allObjects];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v3 addObjectsFromArray:v10];

        ++v9;
      }

      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  if ([v3 count]) {
    uint64_t v11 = v3;
  }
  else {
    uint64_t v11 = 0LL;
  }
  id v12 = v11;

  return v12;
}

- (id)relevantNetworks
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FE0] set];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v4 = (void *)MEMORY[0x189604010];
  -[WiFiWalletSource relevantPassIdentifiers](self, "relevantPassIdentifiers");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setWithSet:v5];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * v10);
        -[WiFiWalletSource networks](self, "networks");
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 objectForKey:v11];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          [v13 allObjects];
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
          [v3 addObjectsFromArray:v14];
        }

        else
        {
          NSLog( @"%s: no relevant networks found for identifier %@",  "-[WiFiWalletSource relevantNetworks]",  v11);
        }

        ++v10;
      }

      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v8);
  }

  return v3;
}

- (id)expiredWalletIDs
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  -[WiFiWalletSource passLibrary](self, "passLibrary");
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 passes];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189603FE0] set];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "isExpired", (void)v13))
        {
          [v10 serialNumber];
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
          [v4 addObject:v11];
        }
      }

      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  return v4;
}

- (id)changeHandler
{
  return self->changeHandler;
}

- (void)setChangeHandler:(id)a3
{
}

- (id)relevancyHandler
{
  return self->relevancyHandler;
}

- (void)setRelevancyHandler:(id)a3
{
}

- (PKPassLibrary)passLibrary
{
  return self->_passLibrary;
}

- (void)setPassLibrary:(id)a3
{
}

- (NSMutableDictionary)networks
{
  return self->_networks;
}

- (void)setNetworks:(id)a3
{
}

- (NSMutableSet)relevantPassIdentifiers
{
  return self->_relevantPassIdentifiers;
}

- (void)setRelevantPassIdentifiers:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
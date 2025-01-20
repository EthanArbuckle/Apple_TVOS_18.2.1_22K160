@interface CUHomeKitManager
- (BOOL)_isOwnerOfHome:(id)a3;
- (BOOL)selfAccessorySiriEnabled;
- (CUHomeKitManager)init;
- (HMAccessory)selfAccessory;
- (HMAccessory)selfAccessoryMediaSystemCounterpart;
- (HMMediaSystem)selfAccessoryMediaSystem;
- (HMMediaSystemRole)selfAccessoryMediaSystemRole;
- (NSArray)resolvableAccessories;
- (NSDictionary)selfAccessoryAppData;
- (NSString)label;
- (NSString)selfAccessoryMediaAccessPassword;
- (NSString)selfAccessoryMediaSystemName;
- (OS_dispatch_queue)dispatchQueue;
- (id)_bestUserAndLabel:(id *)a3;
- (id)_cuPairingIdentityWithHMFPairingIdentity:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)_selfAccessoryMediaSystemUncached:(id *)a3;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)resolvableAccessoriesChangedHandler;
- (id)selfAccessoryAppDataChangedHandler;
- (id)selfAccessoryMediaAccessUpdatedHandler;
- (id)selfAccessoryMediaSystemUpdatedHandler;
- (id)selfAccessorySiriAccessUpdatedHandler;
- (id)selfAccessoryUpdatedHandler;
- (id)stateChangedHandler;
- (unsigned)flags;
- (unsigned)selfAccessoryMediaAccessFlags;
- (unsigned)state;
- (void)_activateIfNeeded;
- (void)_clearHomeKitState;
- (void)_findPairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)_findPairedPeerWithContext:(id)a3;
- (void)_findPairedPeerWithContext:(id)a3 label:(id)a4 pairingIdentity:(id)a5 error:(id)a6;
- (void)_getPairingIdentityCompleted:(id)a3 options:(unint64_t)a4 error:(id)a5 label:(id)a6 completion:(id)a7;
- (void)_getPairingIdentityForAccessoryWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)_getPairingIdentityForLegacyWithOptions:(unint64_t)a3 user:(id)a4 nonLegacyIdentity:(id)a5 label:(id)a6 completion:(id)a7;
- (void)_getPairingIdentityForUserWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)_interrupted;
- (void)_invalidated;
- (void)_updateAccessories;
- (void)_updateHomes;
- (void)_updateSelfAccessoryIfNeeded;
- (void)_updateSelfAccessoryMediaAccess;
- (void)_updateSelfAccessoryMediaSystem;
- (void)_updateSelfAccessorySiriAccess;
- (void)_updateState;
- (void)_updateUsers;
- (void)accessory:(id)a3 didUpdateDevice:(id)a4;
- (void)accessoryDidUpdateApplicationData:(id)a3;
- (void)accessoryDidUpdatePairingIdentity:(id)a3;
- (void)activate;
- (void)dealloc;
- (void)findPairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)getHomeKitLocalPairingIdentityWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)getPairingIdentityWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)home:(id)a3 didAddAccessory:(id)a4;
- (void)home:(id)a3 didAddMediaSystem:(id)a4;
- (void)home:(id)a3 didAddUser:(id)a4;
- (void)home:(id)a3 didRemoveAccessory:(id)a4;
- (void)home:(id)a3 didRemoveMediaSystem:(id)a4;
- (void)home:(id)a3 didRemoveUser:(id)a4;
- (void)home:(id)a3 didUpdateMediaPassword:(id)a4;
- (void)home:(id)a3 didUpdateMediaPeerToPeerEnabled:(BOOL)a4;
- (void)home:(id)a3 didUpdateMinimumMediaUserPrivilege:(int64_t)a4;
- (void)home:(id)a3 didUpdateRoom:(id)a4 forAccessory:(id)a5;
- (void)homeManager:(id)a3 didAddHome:(id)a4;
- (void)homeManager:(id)a3 didRemoveHome:(id)a4;
- (void)homeManager:(id)a3 didUpdateStatus:(unint64_t)a4;
- (void)homeManagerDidUpdateDataSyncState:(id)a3;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)invalidate;
- (void)mediaSystem:(id)a3 didUpdateComponents:(id)a4;
- (void)mediaSystem:(id)a3 didUpdateName:(id)a4;
- (void)setDispatchQueue:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setResolvableAccessoriesChangedHandler:(id)a3;
- (void)setSelfAccessoryAppDataChangedHandler:(id)a3;
- (void)setSelfAccessoryMediaAccessUpdatedHandler:(id)a3;
- (void)setSelfAccessoryMediaSystemName:(id)a3;
- (void)setSelfAccessoryMediaSystemUpdatedHandler:(id)a3;
- (void)setSelfAccessorySiriAccessUpdatedHandler:(id)a3;
- (void)setSelfAccessoryUpdatedHandler:(id)a3;
- (void)setStateChangedHandler:(id)a3;
- (void)user:(id)a3 didUpdateAssistantAccessControl:(id)a4 forHome:(id)a5;
- (void)user:(id)a3 didUpdatePairingIdentity:(id)a4;
@end

@implementation CUHomeKitManager

- (CUHomeKitManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CUHomeKitManager;
  v2 = -[CUHomeKitManager init](&v4, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_homeKitPrefsNotifyToken = -1;
    v2->_ucat = (LogCategory *)&gLogCategory_CUHomeKitManager;
  }

  return v2;
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CUHomeKitManager;
  -[CUHomeKitManager dealloc](&v4, sel_dealloc);
}

- (void)setLabel:(id)a3
{
  id v5 = a3;
  [v5 UTF8String];
  LogCategoryReplaceF((uint64_t *)&self->_ucat);
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __28__CUHomeKitManager_activate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activateIfNeeded
{
  if ([(Class)getHMClientConnectionClass[0]() areHomesConfigured])
  {
    int homeKitPrefsNotifyToken = self->_homeKitPrefsNotifyToken;
    if (homeKitPrefsNotifyToken != -1)
    {
      notify_cancel(homeKitPrefsNotifyToken);
      self->_int homeKitPrefsNotifyToken = -1;
    }

    unsigned int flags = self->_flags;
    if ((flags & 2) != 0 || self->_selfAccessoryAppDataChangedHandler || self->_selfAccessoryUpdatedHandler) {
      self->_selfAccessoryEnabled = 1;
    }
    if (self->_selfAccessoryMediaAccessUpdatedHandler) {
      self->_selfAccessoryMediaAccessEnabled = 1;
    }
    if (self->_selfAccessoryMediaSystemUpdatedHandler) {
      self->_selfAccessoryMediaSystemEnabled = 1;
    }
    if ((flags & 0x10) != 0 || self->_selfAccessorySiriAccessUpdatedHandler) {
      self->_selfAccessorySiriAccessEnabled = 1;
    }
    if (self->_homeManager) {
      goto LABEL_41;
    }
    if ((flags & 0x21) != 0)
    {
      uint64_t v9 = -1LL;
    }

    else
    {
      if (self->_selfAccessoryEnabled) {
        unint64_t v11 = ((unint64_t)(self->_resolvableAccessoriesChangedHandler != 0LL) << 6) | 0x10;
      }
      else {
        unint64_t v11 = (unint64_t)(self->_resolvableAccessoriesChangedHandler != 0LL) << 6;
      }
      if (self->_selfAccessoryMediaSystemEnabled || self->_selfAccessoryMediaAccessEnabled) {
        v11 |= 0x80uLL;
      }
      if (self->_selfAccessorySiriAccessEnabled) {
        v11 |= 8uLL;
      }
      if ((flags & 4) != 0) {
        v11 |= 0xAuLL;
      }
      uint64_t v9 = v11 | (flags >> 2) & 0x20 | (flags >> 1) & 4 | (flags >> 3) & 8 | (((flags >> 10) & 1) << 11);
    }

    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUHomeKitManager _activateIfNeeded]",  0x1Eu,  (uint64_t)"Create HMHomeManager %#ll{flags} %s\n",  v3,  v4,  v5,  v6,  v9);
    }

- (void)_interrupted
{
  interruptionHandler = (void (**)(void))self->_interruptionHandler;
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __30__CUHomeKitManager_invalidate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidated
{
  if (self->_invalidateDone) {
    return;
  }
  if (!self->_invalidateCalled)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 50)
    {
      if (ucat->var0 != -1)
      {
LABEL_5:
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUHomeKitManager _invalidated]",  0x32u,  (uint64_t)"### Unexpectedly invalidated\n",  v3,  v4,  v5,  v6,  v22);
        goto LABEL_7;
      }

      if (_LogCategory_Initialize((uint64_t)ucat, 0x32u))
      {
        ucat = self->_ucat;
        goto LABEL_5;
      }
    }
  }

- (void)_clearHomeKitState
{
  homes = self->_homes;
  v99[0] = MEMORY[0x1895F87A8];
  v99[1] = 3221225472LL;
  v99[2] = __38__CUHomeKitManager__clearHomeKitState__block_invoke;
  v99[3] = &unk_189F310A0;
  v99[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](homes, "enumerateKeysAndObjectsUsingBlock:", v99);
  -[NSMutableDictionary removeAllObjects](self->_homes, "removeAllObjects");
  uint64_t v4 = self->_homes;
  self->_homes = 0LL;

  -[NSMutableDictionary removeAllObjects](self->_users, "removeAllObjects");
  users = self->_users;
  self->_users = 0LL;

  uint64_t v6 = self->_selfAccessory;
  BOOL v7 = v6 != 0LL;
  if (v6)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      -[HMAccessory uniqueIdentifier](v6, "uniqueIdentifier");
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = -[HMAccessory name](v6, "name");
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUHomeKitManager _clearHomeKitState]",  0x1Eu,  (uint64_t)"LostSelfAccessory: %@ (%@), HK clear",  v10,  v11,  v12,  v13,  (char)v9);
    }

- (void)_updateAccessories
{
  v2 = self;
  uint64_t v112 = *MEMORY[0x1895F89C0];
  __int128 v103 = 0u;
  __int128 v104 = 0u;
  __int128 v105 = 0u;
  __int128 v106 = 0u;
  -[NSMutableDictionary allKeys](self->_resolvableAccessoriesMap, "allKeys");
  id obj = (id)objc_claimAutoreleasedReturnValue();
  v83 = v2;
  uint64_t v78 = [obj countByEnumeratingWithState:&v103 objects:v111 count:16];
  if (!v78)
  {
    char v77 = 0;
    goto LABEL_38;
  }

  char v77 = 0;
  uint64_t v75 = *(void *)v104;
  do
  {
    uint64_t v3 = 0LL;
    do
    {
      if (*(void *)v104 != v75) {
        objc_enumerationMutation(obj);
      }
      uint64_t v80 = v3;
      uint64_t v4 = *(void *)(*((void *)&v103 + 1) + 8 * v3);
      __int128 v99 = 0u;
      __int128 v100 = 0u;
      __int128 v101 = 0u;
      __int128 v102 = 0u;
      -[HMHomeManager homes](v2->_homeManager, "homes");
      id v82 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v5 = [v82 countByEnumeratingWithState:&v99 objects:v110 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v84 = *(void *)v100;
        while (2)
        {
          for (uint64_t i = 0LL; i != v6; ++i)
          {
            if (*(void *)v100 != v84) {
              objc_enumerationMutation(v82);
            }
            v8 = *(void **)(*((void *)&v99 + 1) + 8 * i);
            __int128 v95 = 0u;
            __int128 v96 = 0u;
            __int128 v97 = 0u;
            __int128 v98 = 0u;
            [v8 accessories];
            uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v10 = [v9 countByEnumeratingWithState:&v95 objects:v109 count:16];
            if (v10)
            {
              uint64_t v11 = v10;
              uint64_t v12 = *(void *)v96;
LABEL_13:
              uint64_t v13 = 0LL;
              while (1)
              {
                if (*(void *)v96 != v12) {
                  objc_enumerationMutation(v9);
                }
                v14 = *(void **)(*((void *)&v95 + 1) + 8 * v13);
                [v14 uniqueIdentifier];
                id v15 = (void *)objc_claimAutoreleasedReturnValue();
                char v16 = [v15 isEqual:v4];

                if ((v16 & 1) != 0) {
                  break;
                }
                if (v11 == ++v13)
                {
                  uint64_t v11 = [v9 countByEnumeratingWithState:&v95 objects:v109 count:16];
                  if (v11) {
                    goto LABEL_13;
                  }
                  goto LABEL_19;
                }
              }

              id v17 = v14;

              if (!v17) {
                goto LABEL_21;
              }
              v2 = v83;
              goto LABEL_29;
            }

- (void)_updateHomes
{
  uint64_t v61 = *MEMORY[0x1895F89C0];
  if (self->_homeManagerDidUpdateHomes)
  {
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    -[HMHomeManager homes](self->_homeManager, "homes");
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v54 objects:v60 count:16];
    if (!v8) {
      goto LABEL_19;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v55;
    while (1)
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v55 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v54 + 1) + 8 * v11);
        [v12 uniqueIdentifier];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[NSMutableDictionary objectForKeyedSubscript:](self->_homes, "objectForKeyedSubscript:", v13);
        if (!v14)
        {
          ucat = self->_ucat;
          if (ucat->var0 <= 30)
          {
            if (ucat->var0 != -1) {
              goto LABEL_10;
            }
            if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
            {
              ucat = self->_ucat;
LABEL_10:
              [v12 name];
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUHomeKitManager _updateHomes]",  0x1Eu,  (uint64_t)"FoundHome: %@ (%@)\n",  v16,  v17,  v18,  v19,  (char)v13);
            }
          }

          [v12 setDelegate:self];
          homes = self->_homes;
          if (!homes)
          {
            uint64_t v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
            uint64_t v22 = self->_homes;
            self->_homes = v21;

            homes = self->_homes;
          }

          -[NSMutableDictionary setObject:forKeyedSubscript:](homes, "setObject:forKeyedSubscript:", v12, v13);
        }

        ++v11;
      }

      while (v9 != v11);
      uint64_t v23 = [v7 countByEnumeratingWithState:&v54 objects:v60 count:16];
      uint64_t v9 = v23;
      if (!v23)
      {
LABEL_19:

        __int128 v52 = 0u;
        __int128 v53 = 0u;
        __int128 v50 = 0u;
        __int128 v51 = 0u;
        -[NSMutableDictionary allKeys](self->_homes, "allKeys");
        id obj = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v24 = [obj countByEnumeratingWithState:&v50 objects:v59 count:16];
        if (!v24) {
          goto LABEL_41;
        }
        uint64_t v25 = v24;
        uint64_t v45 = *(void *)v51;
        while (1)
        {
          uint64_t v26 = 0LL;
          do
          {
            if (*(void *)v51 != v45) {
              objc_enumerationMutation(obj);
            }
            uint64_t v27 = *(void *)(*((void *)&v50 + 1) + 8 * v26);
            __int128 v46 = 0u;
            __int128 v47 = 0u;
            __int128 v48 = 0u;
            __int128 v49 = 0u;
            v28 = -[HMHomeManager homes](self->_homeManager, "homes");
            uint64_t v29 = [v28 countByEnumeratingWithState:&v46 objects:v58 count:16];
            if (!v29)
            {
LABEL_32:
              v28 = -[NSMutableDictionary objectForKeyedSubscript:](self->_homes, "objectForKeyedSubscript:", v27);
              v35 = self->_ucat;
              if (v35->var0 <= 30)
              {
                if (v35->var0 != -1) {
                  goto LABEL_34;
                }
                if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
                {
                  v35 = self->_ucat;
LABEL_34:
                  [v28 name];
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  LogPrintF( (uint64_t)v35,  (uint64_t)"-[CUHomeKitManager _updateHomes]",  0x1Eu,  (uint64_t)"LostHome: %@ (%@)\n",  v36,  v37,  v38,  v39,  v27);
                }
              }

              [v28 setDelegate:0];
              -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_homes,  "setObject:forKeyedSubscript:",  0LL,  v27);
              goto LABEL_37;
            }

            uint64_t v30 = v29;
            uint64_t v31 = *(void *)v47;
LABEL_26:
            uint64_t v32 = 0LL;
            while (1)
            {
              if (*(void *)v47 != v31) {
                objc_enumerationMutation(v28);
              }
              [*(id *)(*((void *)&v46 + 1) + 8 * v32) uniqueIdentifier];
              uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
              char v34 = [v33 isEqual:v27];

              if ((v34 & 1) != 0) {
                break;
              }
              if (v30 == ++v32)
              {
                uint64_t v30 = [v28 countByEnumeratingWithState:&v46 objects:v58 count:16];
                if (v30) {
                  goto LABEL_26;
                }
                goto LABEL_32;
              }
            }

- (void)_updateSelfAccessoryIfNeeded
{
  if (self->_selfAccessoryEnabled)
  {
    -[HMHomeManager currentAccessory](self->_homeManager, "currentAccessory");
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    id obj = v3;
    if (v3)
    {
      [v3 uniqueIdentifier];
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessory uniqueIdentifier](self->_selfAccessory, "uniqueIdentifier");
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      id v6 = v4;
      id v7 = v5;
      if (v6 == v7)
      {
      }

      else
      {
        uint64_t v8 = v7;
        if ((v6 == 0LL) == (v7 != 0LL))
        {

          goto LABEL_18;
        }

        char v9 = [v6 isEqual:v7];

        if ((v9 & 1) == 0)
        {
LABEL_18:
          ucat = self->_ucat;
          if (ucat->var0 <= 30)
          {
            if (ucat->var0 == -1)
            {
              ucat = self->_ucat;
            }

            [obj name];
            unint64_t v66 = (void *)objc_claimAutoreleasedReturnValue();
            LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUHomeKitManager _updateSelfAccessoryIfNeeded]",  0x1Eu,  (uint64_t)"FoundSelfAccessory: %@ (%@)\n",  v27,  v28,  v29,  v30,  (char)v6);
          }

- (void)_updateSelfAccessoryMediaAccess
{
  if (self->_selfAccessoryMediaAccessEnabled)
  {
    -[HMAccessory home](self->_selfAccessory, "home");
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
LABEL_44:

      return;
    }

    selfAccessoryMediaAccessFlags = self->_selfAccessoryMediaAccessFlags;
    id v40 = v3;
    int v5 = [v3 isMediaPeerToPeerEnabled];
    int v10 = (selfAccessoryMediaAccessFlags >> 1) & 1;
    BOOL v11 = v10 != v5;
    if (v10 == v5)
    {
      unsigned int v15 = self->_selfAccessoryMediaAccessFlags;
      goto LABEL_17;
    }

    int v12 = v5;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_6:
        if ((selfAccessoryMediaAccessFlags & 2) != 0) {
          uint64_t v14 = "yes";
        }
        else {
          uint64_t v14 = "no";
        }
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUHomeKitManager _updateSelfAccessoryMediaAccess]",  0x1Eu,  (uint64_t)"SelfAccessory MediaAccess P2PAllowed updated: %s -> %s\n",  v6,  v7,  v8,  v9,  (char)v14);
        goto LABEL_13;
      }

      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_6;
      }
    }

- (void)_updateSelfAccessoryMediaSystem
{
  uint64_t v94 = *MEMORY[0x1895F89C0];
  if (self->_selfAccessoryMediaSystemEnabled)
  {
    id v92 = 0LL;
    -[CUHomeKitManager _selfAccessoryMediaSystemUncached:](self, "_selfAccessoryMediaSystemUncached:", &v92);
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    id v4 = v92;
    int v5 = v4;
    if (v3 && v4)
    {
      [v3 uniqueIdentifier];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMediaSystem uniqueIdentifier](self->_selfAccessoryMediaSystem, "uniqueIdentifier");
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      id v8 = v6;
      id v9 = v7;
      BOOL v10 = v8 != v9;
      if (v8 == v9)
      {

        selfAccessoryMediaSystem = (HMMediaSystem *)v8;
LABEL_22:

LABEL_23:
        char v31 = self->_selfAccessoryMediaSystemName;
        [v3 name];
        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v33 = v31;
        uint64_t v34 = v32;
        uint64_t v35 = v34;
        if (v33 == v34)
        {

          selfAccessoryMediaSystemName = v33;
LABEL_34:

          goto LABEL_35;
        }

        if ((v33 == 0LL) != (v34 != 0LL))
        {
          char v36 = -[NSString isEqual:](v33, "isEqual:", v34);

          if ((v36 & 1) != 0)
          {
LABEL_35:
            int v83 = v10;
            uint64_t v84 = v35;
            v85 = v33;
            v86 = v8;
            __int128 v87 = v5;
            [v5 role];
            uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
            unint64_t v45 = [v44 type];
            selfAccessoryMediaSystemRole = self->_selfAccessoryMediaSystemRole;
            uint64_t v47 = v44;
            uint64_t v48 = selfAccessoryMediaSystemRole;
            if (v47 == v48)
            {

              __int128 v55 = v47;
LABEL_50:

              goto LABEL_51;
            }

            __int128 v49 = v48;
            if ((v47 == 0LL) != (v48 != 0LL))
            {
              char v50 = -[HMMediaSystemRole isEqual:](v47, "isEqual:", v48);

              if ((v50 & 1) != 0)
              {
LABEL_51:
                if (v45 == 1) {
                  uint64_t v59 = 2LL;
                }
                else {
                  uint64_t v59 = v45 == 2;
                }
                if (v59)
                {
                  __int128 v90 = 0u;
                  __int128 v91 = 0u;
                  __int128 v88 = 0u;
                  __int128 v89 = 0u;
                  [v3 components];
                  uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue();
                  uint64_t v61 = (void *)[v60 countByEnumeratingWithState:&v88 objects:v93 count:16];
                  if (v61)
                  {
                    id v82 = v3;
                    uint64_t v62 = *(void *)v89;
                    while (2)
                    {
                      for (uint64_t i = 0LL; i != v61; uint64_t i = (char *)i + 1)
                      {
                        if (*(void *)v89 != v62) {
                          objc_enumerationMutation(v60);
                        }
                        v64 = *(void **)(*((void *)&v88 + 1) + 8LL * (void)i);
                        [v64 role];
                        v65 = (void *)objc_claimAutoreleasedReturnValue();
                        uint64_t v66 = [v65 type];

                        if (v66 == v59)
                        {
                          [v64 mediaProfile];
                          uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue();
                          [v67 accessory];
                          uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();

                          goto LABEL_65;
                        }
                      }

                      uint64_t v61 = (void *)[v60 countByEnumeratingWithState:&v88 objects:v93 count:16];
                      if (v61) {
                        continue;
                      }
                      break;
                    }

- (void)_updateSelfAccessorySiriAccess
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  if (self->_selfAccessorySiriAccessEnabled)
  {
    -[HMAccessory home](self->_selfAccessory, "home");
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    id v4 = v3;
    if (!v3)
    {
LABEL_30:

      return;
    }

    [v3 currentUser];
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = v5;
    if (!v5)
    {
LABEL_29:

      goto LABEL_30;
    }

    [v5 assistantAccessControlForHome:v4];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    selfAccessorySiriEnabled = self->_selfAccessorySiriEnabled;
    if ([v7 isEnabled])
    {
      -[HMAccessory uniqueIdentifier](self->_selfAccessory, "uniqueIdentifier");
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      [v7 accessories];
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v11)
      {
        int v23 = selfAccessorySiriEnabled;
        char v24 = v7;
        uint64_t v12 = *(void *)v26;
        while (2)
        {
          for (uint64_t i = 0LL; i != v11; ++i)
          {
            if (*(void *)v26 != v12) {
              objc_enumerationMutation(v10);
            }
            [*(id *)(*((void *)&v25 + 1) + 8 * i) uniqueIdentifier];
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
            char v15 = [v14 isEqual:v9];

            if ((v15 & 1) != 0)
            {
              LODWORD(v11) = 1;
              goto LABEL_16;
            }
          }

          uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v11) {
            continue;
          }
          break;
        }

- (void)_updateState
{
  if (self->_homeManagerDidUpdateHomes
    && (unint64_t v7 = -[HMHomeManager dataSyncState](self->_homeManager, "dataSyncState"), v7 <= 5))
  {
    uint64_t v8 = dword_186B4AA24[v7];
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  unsigned int state = self->_state;
  if ((_DWORD)v8 != state)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_8:
        if (state > 5) {
          uint64_t v11 = "?";
        }
        else {
          uint64_t v11 = off_189F31280[state];
        }
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUHomeKitManager _updateState]",  0x1Eu,  (uint64_t)"HomeKit state updated: %s -> %s\n",  v2,  v3,  v4,  v5,  (char)v11);
        goto LABEL_14;
      }

      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        unsigned int state = self->_state;
        goto LABEL_8;
      }
    }

- (void)_updateUsers
{
  uint64_t v71 = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  -[HMHomeManager homes](self->_homeManager, "homes");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v63 objects:v70 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v64;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v64 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v63 + 1) + 8 * i) currentUser];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9) {
          [v3 addObject:v9];
        }
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v63 objects:v70 count:16];
    }

    while (v6);
  }

  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  id obj = v3;
  uint64_t v10 = [obj countByEnumeratingWithState:&v59 objects:v69 count:16];
  if (!v10)
  {
    char v48 = 0;
    goto LABEL_31;
  }

  uint64_t v11 = v10;
  char v48 = 0;
  uint64_t v12 = *(void *)v60;
  do
  {
    uint64_t v13 = 0LL;
    do
    {
      if (*(void *)v60 != v12) {
        objc_enumerationMutation(obj);
      }
      uint64_t v14 = *(void **)(*((void *)&v59 + 1) + 8 * v13);
      [v14 uniqueIdentifier];
      char v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_users, "objectForKeyedSubscript:", v15);
        unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          ucat = self->_ucat;
          if (ucat->var0 <= 30)
          {
            if (ucat->var0 != -1) {
              goto LABEL_19;
            }
            if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
            {
              ucat = self->_ucat;
LABEL_19:
              [v14 userID];
              unint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
              LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUHomeKitManager _updateUsers]",  0x1Eu,  (uint64_t)"FoundCurrentUser: %@, %{mask}",  v18,  v19,  v20,  v21,  (char)v15);
            }
          }

          [v14 setDelegate:self];
          users = self->_users;
          if (!users)
          {
            int v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
            char v24 = self->_users;
            self->_users = v23;

            users = self->_users;
          }

          -[NSMutableDictionary setObject:forKeyedSubscript:](users, "setObject:forKeyedSubscript:", v14, v15);
          char v48 = 1;
        }
      }

      ++v13;
    }

    while (v11 != v13);
    uint64_t v25 = [obj countByEnumeratingWithState:&v59 objects:v69 count:16];
    uint64_t v11 = v25;
  }

  while (v25);
LABEL_31:

  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  -[NSMutableDictionary allKeys](self->_users, "allKeys");
  id v47 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v26 = [v47 countByEnumeratingWithState:&v55 objects:v68 count:16];
  if (!v26) {
    goto LABEL_53;
  }
  uint64_t v27 = v26;
  uint64_t v49 = *(void *)v56;
  while (2)
  {
    uint64_t v28 = 0LL;
    while (2)
    {
      if (*(void *)v56 != v49) {
        objc_enumerationMutation(v47);
      }
      uint64_t v29 = *(void *)(*((void *)&v55 + 1) + 8 * v28);
      __int128 v51 = 0u;
      __int128 v52 = 0u;
      __int128 v53 = 0u;
      __int128 v54 = 0u;
      id v30 = obj;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v51 objects:v67 count:16];
      if (!v31)
      {
LABEL_44:

        -[NSMutableDictionary objectForKeyedSubscript:](self->_users, "objectForKeyedSubscript:", v29);
        id v30 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v37 = self->_ucat;
        if (v37->var0 <= 30)
        {
          if (v37->var0 == -1)
          {
            uint64_t v37 = self->_ucat;
          }

          [v30 uniqueIdentifier];
          uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
          [v30 userID];
          uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF( (uint64_t)v37,  (uint64_t)"-[CUHomeKitManager _updateUsers]",  0x1Eu,  (uint64_t)"LostCurrentUser: %@, %{mask}",  v39,  v40,  v41,  v42,  (char)v38);
        }

- (void)getPairingIdentityWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __61__CUHomeKitManager_getPairingIdentityWithOptions_completion___block_invoke;
  block[3] = &unk_189F316E0;
  id v10 = v6;
  unint64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)getHomeKitLocalPairingIdentityWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void, id))a4;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 90)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUHomeKitManager getHomeKitLocalPairingIdentityWithOptions:completion:]",  0x5Au,  (uint64_t)"### getHomeKitLocalPairingIdentityWithOptions: no identities for repair flow SPI\n",  v7,  v8,  v9,  v10,  v18[0]);
    }

- (void)_getPairingIdentityForAccessoryWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  -[HMHomeManager currentAccessory](self->_homeManager, "currentAccessory");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __74__CUHomeKitManager__getPairingIdentityForAccessoryWithOptions_completion___block_invoke;
    v9[3] = &unk_189F310F0;
    v9[4] = self;
    unint64_t v11 = a3;
    id v10 = v6;
    [v7 pairingIdentityWithPrivateKey:(a3 >> 1) & 1 completionHandler:v9];
  }

  else
  {
    NSErrorWithOSStatusF((const char *)0xFFFFE5B9LL);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUHomeKitManager _getPairingIdentityCompleted:options:error:label:completion:]( self,  "_getPairingIdentityCompleted:options:error:label:completion:",  0LL,  a3,  v8,  @"SelfAccessory",  v6);
  }
}

- (void)_getPairingIdentityForUserWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v22 = 0LL;
  -[CUHomeKitManager _bestUserAndLabel:](self, "_bestUserAndLabel:", &v22);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v22;
  if (v7)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      ucat = self->_ucat;
      if (ucat->var0 <= 30)
      {
        if (ucat->var0 == -1)
        {
          ucat = self->_ucat;
        }

        [v7 name];
        int v17 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUHomeKitManager _getPairingIdentityForUserWithOptions:completion:]",  0x1Eu,  (uint64_t)"GetPairingIdentity %#{flags} via SPI '%{mask}",  v10,  v11,  v12,  v13,  a3);
      }

- (void)_getPairingIdentityForLegacyWithOptions:(unint64_t)a3 user:(id)a4 nonLegacyIdentity:(id)a5 label:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      [v12 name];
      id v23 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUHomeKitManager _getPairingIdentityForLegacyWithOptions:user:nonLegacyIdentity:label:completion:]",  0x1Eu,  (uint64_t)"GetPairingIdentity %#{flags} via fetch all SPI '%{mask}",  v17,  v18,  v19,  v20,  a3);
    }

- (void)_getPairingIdentityCompleted:(id)a3 options:(unint64_t)a4 error:(id)a5 label:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = (void (**)(id, void *, void))a7;
  id v20 = v12;
  if (v20 && !v13)
  {
    id v37 = 0LL;
    -[CUHomeKitManager _cuPairingIdentityWithHMFPairingIdentity:options:error:]( self,  "_cuPairingIdentityWithHMFPairingIdentity:options:error:",  v20,  a4,  &v37);
    unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    id v26 = v37;
    ucat = self->_ucat;
    int var0 = ucat->var0;
    if (v21)
    {
      if (var0 <= 30)
      {
        if (var0 == -1)
        {
          ucat = self->_ucat;
        }

        [v21 identifier];
        char v36 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUHomeKitManager _getPairingIdentityCompleted:options:error:label:completion:]",  0x1Eu,  (uint64_t)"GetPairingIdentity finish: %#{flags}, %@ (%@)\n",  v29,  v30,  v31,  v32,  a4);
      }

- (void)findPairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __54__CUHomeKitManager_findPairedPeer_options_completion___block_invoke;
  v13[3] = &unk_189F31780;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

- (void)_findPairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  uint64_t v52 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = (void (**)(id, void, void *))a5;
  uint64_t v14 = [v8 identifierStr];
  if (!v14)
  {
    [v8 identifier];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v15 UUIDString];

    if (!v14)
    {
      NSErrorWithOSStatusF((const char *)0xFFFFE5CFLL);
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
      ucat = self->_ucat;
      if (ucat->var0 <= 90)
      {
        if (ucat->var0 == -1)
        {
          ucat = self->_ucat;
        }

        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUHomeKitManager _findPairedPeer:options:completion:]",  0x5Au,  (uint64_t)"### FindPairedPeer failed: %{error}\n",  v31,  v32,  v33,  v34,  (char)v35);
      }

- (void)_findPairedPeerWithContext:(id)a3
{
  id v4 = a3;
  if ([v4 triedHomeRepairFlow])
  {
    if ([v4 triedHAP])
    {
LABEL_16:
      if (([v4 triedAccessory] & 1) == 0)
      {
        [v4 setTriedAccessory:1];
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          homeManager = self->_homeManager;
          [v4 identifier];
          char v36 = (void *)objc_claimAutoreleasedReturnValue();
          v69[0] = MEMORY[0x1895F87A8];
          v69[1] = 3221225472LL;
          v69[2] = __47__CUHomeKitManager__findPairedPeerWithContext___block_invoke_2;
          v69[3] = &unk_189F311B8;
          v69[4] = self;
          id v70 = v4;
          -[HMHomeManager pairingIdentityForAccessoryWithIdentifier:completionHandler:]( homeManager,  "pairingIdentityForAccessoryWithIdentifier:completionHandler:",  v36,  v69);

          goto LABEL_39;
        }

        ucat = self->_ucat;
        if (ucat->var0 <= 90)
        {
          if (ucat->var0 != -1)
          {
LABEL_21:
            [v4 identifier];
            uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
            LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUHomeKitManager _findPairedPeerWithContext:]",  0x5Au,  (uint64_t)"### FindPairedPeer: '%@', no accessory identity SPI\n",  v39,  v40,  v41,  v42,  (char)v38);

            goto LABEL_23;
          }

          if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x5Au))
          {
            ucat = self->_ucat;
            goto LABEL_21;
          }
        }
      }

- (void)_findPairedPeerWithContext:(id)a3 label:(id)a4 pairingIdentity:(id)a5 error:(id)a6
{
  id v60 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v11)
  {
    [v11 identifier];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      [v60 identifier];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = [v13 caseInsensitiveCompare:v14];

      if (v15)
      {
        ucat = self->_ucat;
        if (ucat->var0 <= 20)
        {
          uint64_t v17 = v60;
          if (ucat->var0 == -1)
          {
            ucat = self->_ucat;
            uint64_t v17 = v60;
          }

          [v17 identifier];
          id v18 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUHomeKitManager _findPairedPeerWithContext:label:pairingIdentity:error:]",  0x14u,  (uint64_t)"FindPairedPeer: '%@', %@, mismatch '%@'\n",  v19,  v20,  v21,  v22,  (char)v18);
        }

- (id)_bestUserAndLabel:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  -[HMHomeManager currentHome](self->_homeManager, "currentHome");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 currentUser];
  if (v6)
  {
    id v7 = (id)v6;
    if (a3)
    {
      id v8 = objc_alloc(NSString);
      [v5 name];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      *a3 = (id)[v8 initWithFormat:@"CurrentHome '%@'", v9];
    }
  }

  else
  {
    -[HMHomeManager primaryHome](self->_homeManager, "primaryHome");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v11 = [v10 currentUser];
    if (v11)
    {
      id v7 = (id)v11;
      if (a3)
      {
        id v12 = objc_alloc(NSString);
        [v10 name];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        *a3 = (id)[v12 initWithFormat:@"PrimaryHome '%@'", v13];
      }

      id v5 = v10;
    }

    else
    {
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      -[HMHomeManager homes](self->_homeManager, "homes");
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v26;
        id v5 = v10;
        while (2)
        {
          uint64_t v18 = 0LL;
          uint64_t v19 = v5;
          do
          {
            if (*(void *)v26 != v17) {
              objc_enumerationMutation(v14);
            }
            id v5 = *(id *)(*((void *)&v25 + 1) + 8 * v18);

            uint64_t v20 = [v5 currentUser];
            if (v20)
            {
              uint64_t v21 = (void *)v20;
              if (a3)
              {
                id v22 = objc_alloc(NSString);
                [v5 name];
                uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
                *a3 = (id)[v22 initWithFormat:@"Home '%@'", v23];
              }

              id v7 = v21;

              goto LABEL_22;
            }

            ++v18;
            uint64_t v19 = v5;
          }

          while (v16 != v18);
          uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }

      else
      {
        id v5 = v10;
      }

      id v7 = 0LL;
      id v5 = v14;
    }
  }

- (id)_cuPairingIdentityWithHMFPairingIdentity:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  char v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(&OBJC_CLASS___CUPairingIdentity);
  [v7 identifier];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDString:v9];
    if (!v10)
    {
      if (a5)
      {
        NSErrorWithOSStatusF((const char *)0xFFFFE5C3LL);
        uint64_t v15 = 0LL;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v15 = 0LL;
      }

      goto LABEL_21;
    }

    -[CUPairingIdentity setIdentifier:](v8, "setIdentifier:", v10);
    [v7 publicKey];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 data];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[CUPairingIdentity setPublicKey:](v8, "setPublicKey:", v12);
      if ((v6 & 2) == 0)
      {
LABEL_7:
        uint64_t v15 = v8;
LABEL_20:

LABEL_21:
        goto LABEL_22;
      }

      [v7 privateKey];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 data];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        -[CUPairingIdentity setSecretKey:](v8, "setSecretKey:", v14);

        goto LABEL_7;
      }

      if (a5)
      {
        uint64_t v16 = 4294896142LL;
        goto LABEL_18;
      }
    }

    else if (a5)
    {
      uint64_t v16 = 4294896141LL;
LABEL_18:
      NSErrorWithOSStatusF((const char *)v16);
      uint64_t v15 = 0LL;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }

    uint64_t v15 = 0LL;
    goto LABEL_20;
  }

  if (a5)
  {
    NSErrorWithOSStatusF((const char *)0xFFFFE5CCLL);
    uint64_t v15 = 0LL;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v15 = 0LL;
  }

- (BOOL)_isOwnerOfHome:(id)a3
{
  id v3 = a3;
  [v3 currentUser];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    [v3 homeAccessControlForUser:v4];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    char v6 = [v5 isOwner];
  }

  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)_selfAccessoryMediaSystemUncached:(id *)a3
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  -[HMAccessory uniqueIdentifier](self->_selfAccessory, "uniqueIdentifier");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessory home](self->_selfAccessory, "home");
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  [v6 mediaSystems];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v25 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v25)
  {
    uint64_t v23 = a3;
    uint64_t v24 = v6;
    uint64_t v8 = *(void *)v33;
    __int128 v27 = v7;
    uint64_t v22 = *(void *)v33;
    do
    {
      for (uint64_t i = 0LL; i != v25; ++i)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v7);
        }
        id v10 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        __int128 v26 = v10;
        objc_msgSend(v10, "components", v22);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v29;
          while (2)
          {
            for (uint64_t j = 0LL; j != v13; ++j)
            {
              if (*(void *)v29 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void **)(*((void *)&v28 + 1) + 8 * j);
              [v16 mediaProfile];
              uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
              [v17 accessory];
              uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
              [v18 uniqueIdentifier];
              uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

              if ([v19 isEqual:v5])
              {
                if (v23) {
                  *uint64_t v23 = v16;
                }
                id v20 = v26;

                char v6 = v24;
                id v7 = v27;
                goto LABEL_21;
              }
            }

            uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }

        id v7 = v27;
        uint64_t v8 = v22;
      }

      id v20 = 0LL;
      char v6 = v24;
      uint64_t v25 = [v27 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }

    while (v25);
  }

  else
  {
    id v20 = 0LL;
  }

- (void)homeManagerDidUpdateDataSyncState:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __54__CUHomeKitManager_homeManagerDidUpdateDataSyncState___block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __46__CUHomeKitManager_homeManagerDidUpdateHomes___block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)homeManager:(id)a3 didUpdateStatus:(unint64_t)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __48__CUHomeKitManager_homeManager_didUpdateStatus___block_invoke;
  v5[3] = &unk_189F317F8;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(dispatchQueue, v5);
}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  id v5 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __43__CUHomeKitManager_homeManager_didAddHome___block_invoke;
  v8[3] = &unk_189F33088;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(dispatchQueue, v8);
}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  id v5 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __46__CUHomeKitManager_homeManager_didRemoveHome___block_invoke;
  v8[3] = &unk_189F33088;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(dispatchQueue, v8);
}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __41__CUHomeKitManager_home_didAddAccessory___block_invoke;
  block[3] = &unk_189F31578;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __44__CUHomeKitManager_home_didRemoveAccessory___block_invoke;
  block[3] = &unk_189F31578;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

- (void)home:(id)a3 didUpdateRoom:(id)a4 forAccessory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __52__CUHomeKitManager_home_didUpdateRoom_forAccessory___block_invoke;
  v15[3] = &unk_189F32D00;
  v15[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(dispatchQueue, v15);
}

- (void)home:(id)a3 didAddUser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __36__CUHomeKitManager_home_didAddUser___block_invoke;
  block[3] = &unk_189F31578;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

- (void)home:(id)a3 didRemoveUser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __39__CUHomeKitManager_home_didRemoveUser___block_invoke;
  block[3] = &unk_189F31578;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

- (void)home:(id)a3 didUpdateMinimumMediaUserPrivilege:(int64_t)a4
{
  id v6 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __60__CUHomeKitManager_home_didUpdateMinimumMediaUserPrivilege___block_invoke;
  block[3] = &unk_189F32C60;
  id v10 = v6;
  int64_t v11 = a4;
  block[4] = self;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)home:(id)a3 didUpdateMediaPeerToPeerEnabled:(BOOL)a4
{
  id v6 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __57__CUHomeKitManager_home_didUpdateMediaPeerToPeerEnabled___block_invoke;
  block[3] = &unk_189F320C8;
  BOOL v11 = a4;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)home:(id)a3 didUpdateMediaPassword:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __48__CUHomeKitManager_home_didUpdateMediaPassword___block_invoke;
  block[3] = &unk_189F31578;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

- (void)home:(id)a3 didAddMediaSystem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __43__CUHomeKitManager_home_didAddMediaSystem___block_invoke;
  block[3] = &unk_189F31578;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

- (void)home:(id)a3 didRemoveMediaSystem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __46__CUHomeKitManager_home_didRemoveMediaSystem___block_invoke;
  block[3] = &unk_189F31578;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

- (void)mediaSystem:(id)a3 didUpdateComponents:(id)a4
{
  id v5 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __52__CUHomeKitManager_mediaSystem_didUpdateComponents___block_invoke;
  v8[3] = &unk_189F33088;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(dispatchQueue, v8);
}

- (void)mediaSystem:(id)a3 didUpdateName:(id)a4
{
  id v5 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __46__CUHomeKitManager_mediaSystem_didUpdateName___block_invoke;
  v8[3] = &unk_189F33088;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(dispatchQueue, v8);
}

- (void)accessoryDidUpdateApplicationData:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __54__CUHomeKitManager_accessoryDidUpdateApplicationData___block_invoke;
  v7[3] = &unk_189F33088;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)accessoryDidUpdatePairingIdentity:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __54__CUHomeKitManager_accessoryDidUpdatePairingIdentity___block_invoke;
  v7[3] = &unk_189F33088;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)accessory:(id)a3 didUpdateDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __46__CUHomeKitManager_accessory_didUpdateDevice___block_invoke;
  block[3] = &unk_189F31578;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)user:(id)a3 didUpdateAssistantAccessControl:(id)a4 forHome:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __65__CUHomeKitManager_user_didUpdateAssistantAccessControl_forHome___block_invoke;
  block[3] = &unk_189F31578;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(dispatchQueue, block);
}

- (void)user:(id)a3 didUpdatePairingIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __50__CUHomeKitManager_user_didUpdatePairingIdentity___block_invoke;
  block[3] = &unk_189F31578;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_unsigned int flags = a3;
}

- (NSString)label
{
  return self->_label;
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (unsigned)state
{
  return self->_state;
}

- (id)stateChangedHandler
{
  return self->_stateChangedHandler;
}

- (void)setStateChangedHandler:(id)a3
{
}

- (NSArray)resolvableAccessories
{
  return self->_resolvableAccessories;
}

- (id)resolvableAccessoriesChangedHandler
{
  return self->_resolvableAccessoriesChangedHandler;
}

- (void)setResolvableAccessoriesChangedHandler:(id)a3
{
}

- (HMAccessory)selfAccessory
{
  return self->_selfAccessory;
}

- (NSDictionary)selfAccessoryAppData
{
  return self->_selfAccessoryAppData;
}

- (id)selfAccessoryAppDataChangedHandler
{
  return self->_selfAccessoryAppDataChangedHandler;
}

- (void)setSelfAccessoryAppDataChangedHandler:(id)a3
{
}

- (id)selfAccessoryUpdatedHandler
{
  return self->_selfAccessoryUpdatedHandler;
}

- (void)setSelfAccessoryUpdatedHandler:(id)a3
{
}

- (unsigned)selfAccessoryMediaAccessFlags
{
  return self->_selfAccessoryMediaAccessFlags;
}

- (NSString)selfAccessoryMediaAccessPassword
{
  return self->_selfAccessoryMediaAccessPassword;
}

- (id)selfAccessoryMediaAccessUpdatedHandler
{
  return self->_selfAccessoryMediaAccessUpdatedHandler;
}

- (void)setSelfAccessoryMediaAccessUpdatedHandler:(id)a3
{
}

- (HMMediaSystem)selfAccessoryMediaSystem
{
  return self->_selfAccessoryMediaSystem;
}

- (HMAccessory)selfAccessoryMediaSystemCounterpart
{
  return self->_selfAccessoryMediaSystemCounterpart;
}

- (NSString)selfAccessoryMediaSystemName
{
  return self->_selfAccessoryMediaSystemName;
}

- (void)setSelfAccessoryMediaSystemName:(id)a3
{
}

- (HMMediaSystemRole)selfAccessoryMediaSystemRole
{
  return self->_selfAccessoryMediaSystemRole;
}

- (id)selfAccessoryMediaSystemUpdatedHandler
{
  return self->_selfAccessoryMediaSystemUpdatedHandler;
}

- (void)setSelfAccessoryMediaSystemUpdatedHandler:(id)a3
{
}

- (BOOL)selfAccessorySiriEnabled
{
  return self->_selfAccessorySiriEnabled;
}

- (id)selfAccessorySiriAccessUpdatedHandler
{
  return self->_selfAccessorySiriAccessUpdatedHandler;
}

- (void)setSelfAccessorySiriAccessUpdatedHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

void __50__CUHomeKitManager_user_didUpdatePairingIdentity___block_invoke(id *a1)
{
  uint64_t v2 = a1[4];
  if (!v2[2]) {
    return;
  }
  id v3 = (int *)v2[12];
  if (*v3 <= 30)
  {
    if (*v3 == -1)
    {
      BOOL v9 = _LogCategory_Initialize(v2[12], 0x1Eu);
      uint64_t v2 = a1[4];
      if (!v9) {
        goto LABEL_7;
      }
      id v3 = (int *)v2[12];
    }

    [a1[5] userID];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [a1[6] identifier];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF( (uint64_t)v3,  (uint64_t)"-[CUHomeKitManager user:didUpdatePairingIdentity:]_block_invoke",  0x1Eu,  (uint64_t)"DidUpdatePairingIdentity: user %{mask}, PairingIdentity %@",  v5,  v6,  v7,  v8,  (char)v4);

    uint64_t v2 = a1[4];
  }

void *__65__CUHomeKitManager_user_didUpdateAssistantAccessControl_forHome___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[2])
  {
    id v3 = (int *)result[12];
    if (*v3 <= 30)
    {
      if (*v3 == -1)
      {
        BOOL v9 = _LogCategory_Initialize(result[12], 0x1Eu);
        result = *(void **)(a1 + 32);
        if (!v9) {
          return (void *)[result _updateHomes];
        }
        id v3 = (int *)result[12];
      }

      [*(id *)(a1 + 40) userID];
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 48) name];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF( (uint64_t)v3,  (uint64_t)"-[CUHomeKitManager user:didUpdateAssistantAccessControl:forHome:]_block_invoke",  0x1Eu,  (uint64_t)"DidUpdateAssistantAccessControl: user %{mask}, home '%@'",  v5,  v6,  v7,  v8,  (char)v4);

      result = *(void **)(a1 + 32);
    }

    return (void *)[result _updateHomes];
  }

  return result;
}

void *__46__CUHomeKitManager_accessory_didUpdateDevice___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[2])
  {
    id v3 = (int *)result[12];
    if (*v3 <= 30)
    {
      if (*v3 == -1)
      {
        BOOL v9 = _LogCategory_Initialize(result[12], 0x1Eu);
        result = *(void **)(a1 + 32);
        if (!v9) {
          return (void *)[result _updateHomes];
        }
        id v3 = (int *)result[12];
      }

      [*(id *)(a1 + 40) name];
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 48) uniqueIdentifier];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF( (uint64_t)v3,  (uint64_t)"-[CUHomeKitManager accessory:didUpdateDevice:]_block_invoke",  0x1Eu,  (uint64_t)"DidUpdateDevice: accessory '%@', device %@\n",  v5,  v6,  v7,  v8,  (char)v4);

      result = *(void **)(a1 + 32);
    }

    return (void *)[result _updateHomes];
  }

  return result;
}

void __54__CUHomeKitManager_accessoryDidUpdatePairingIdentity___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2[2]) {
    return;
  }
  id v3 = (int *)v2[12];
  if (*v3 <= 30)
  {
    if (*v3 == -1)
    {
      BOOL v9 = _LogCategory_Initialize(v2[12], 0x1Eu);
      uint64_t v2 = *(void **)(a1 + 32);
      if (!v9) {
        goto LABEL_7;
      }
      id v3 = (int *)v2[12];
    }

    [*(id *)(a1 + 40) name];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF( (uint64_t)v3,  (uint64_t)"-[CUHomeKitManager accessoryDidUpdatePairingIdentity:]_block_invoke",  0x1Eu,  (uint64_t)"DidUpdatePairingIdentity: accessory '%@'",  v5,  v6,  v7,  v8,  (char)v4);

    uint64_t v2 = *(void **)(a1 + 32);
  }

void *__54__CUHomeKitManager_accessoryDidUpdateApplicationData___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[2])
  {
    id v3 = (int *)result[12];
    if (*v3 <= 30)
    {
      if (*v3 == -1)
      {
        BOOL v9 = _LogCategory_Initialize(result[12], 0x1Eu);
        result = *(void **)(a1 + 32);
        if (!v9) {
          return (void *)[result _updateHomes];
        }
        id v3 = (int *)result[12];
      }

      [*(id *)(a1 + 40) name];
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF( (uint64_t)v3,  (uint64_t)"-[CUHomeKitManager accessoryDidUpdateApplicationData:]_block_invoke",  0x1Eu,  (uint64_t)"DidUpdateApplicationData: accessory '%@'\n",  v5,  v6,  v7,  v8,  (char)v4);

      result = *(void **)(a1 + 32);
    }

    return (void *)[result _updateHomes];
  }

  return result;
}

uint64_t __46__CUHomeKitManager_mediaSystem_didUpdateName___block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void **)(result + 32);
  if (v8[2])
  {
    uint64_t v9 = result;
    id v10 = (int *)v8[12];
    if (*v10 <= 30)
    {
      if (*v10 == -1)
      {
        BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
        uint64_t v8 = *(void **)(v9 + 32);
        if (!v11) {
          return [v8 _updateHomes];
        }
        id v10 = (int *)v8[12];
      }

      LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUHomeKitManager mediaSystem:didUpdateName:]_block_invoke",  0x1Eu,  (uint64_t)"MediaSystemDidUpdateName: '%@'\n",  a5,  a6,  a7,  a8,  *(void *)(v9 + 40));
      uint64_t v8 = *(void **)(v9 + 32);
    }

    return [v8 _updateHomes];
  }

  return result;
}

void *__52__CUHomeKitManager_mediaSystem_didUpdateComponents___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[2])
  {
    id v3 = (int *)result[12];
    if (*v3 <= 30)
    {
      if (*v3 == -1)
      {
        BOOL v9 = _LogCategory_Initialize(result[12], 0x1Eu);
        result = *(void **)(a1 + 32);
        if (!v9) {
          return (void *)[result _updateHomes];
        }
        id v3 = (int *)result[12];
      }

      [*(id *)(a1 + 40) name];
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF( (uint64_t)v3,  (uint64_t)"-[CUHomeKitManager mediaSystem:didUpdateComponents:]_block_invoke",  0x1Eu,  (uint64_t)"MediaSystemDidUpdateComponents: '%@'\n",  v5,  v6,  v7,  v8,  (char)v4);

      result = *(void **)(a1 + 32);
    }

    return (void *)[result _updateHomes];
  }

  return result;
}

void *__46__CUHomeKitManager_home_didRemoveMediaSystem___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[2])
  {
    id v3 = (int *)result[12];
    if (*v3 <= 30)
    {
      if (*v3 == -1)
      {
        BOOL v9 = _LogCategory_Initialize(result[12], 0x1Eu);
        result = *(void **)(a1 + 32);
        if (!v9) {
          return (void *)[result _updateHomes];
        }
        id v3 = (int *)result[12];
      }

      [*(id *)(a1 + 40) name];
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 48) name];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF( (uint64_t)v3,  (uint64_t)"-[CUHomeKitManager home:didRemoveMediaSystem:]_block_invoke",  0x1Eu,  (uint64_t)"DidRemoveMediaSystem: '%@', home '%@'\n",  v5,  v6,  v7,  v8,  (char)v4);

      result = *(void **)(a1 + 32);
    }

    return (void *)[result _updateHomes];
  }

  return result;
}

void *__43__CUHomeKitManager_home_didAddMediaSystem___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[2])
  {
    id v3 = (int *)result[12];
    if (*v3 <= 30)
    {
      if (*v3 == -1)
      {
        BOOL v9 = _LogCategory_Initialize(result[12], 0x1Eu);
        result = *(void **)(a1 + 32);
        if (!v9) {
          return (void *)[result _updateHomes];
        }
        id v3 = (int *)result[12];
      }

      [*(id *)(a1 + 40) name];
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 48) name];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF( (uint64_t)v3,  (uint64_t)"-[CUHomeKitManager home:didAddMediaSystem:]_block_invoke",  0x1Eu,  (uint64_t)"DidAddMediaSystem: '%@', home '%@'\n",  v5,  v6,  v7,  v8,  (char)v4);

      result = *(void **)(a1 + 32);
    }

    return (void *)[result _updateHomes];
  }

  return result;
}

void *__48__CUHomeKitManager_home_didUpdateMediaPassword___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[2])
  {
    id v3 = (int *)result[12];
    if (*v3 <= 30)
    {
      if (*v3 != -1)
      {
LABEL_4:
        if ([*(id *)(a1 + 40) length]) {
          id v4 = "set";
        }
        else {
          id v4 = "not set";
        }
        [*(id *)(a1 + 48) name];
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF( (uint64_t)v3,  (uint64_t)"-[CUHomeKitManager home:didUpdateMediaPassword:]_block_invoke",  0x1Eu,  (uint64_t)"DidAddMediaPassword: %s, home '%@'\n",  v5,  v6,  v7,  v8,  (char)v4);

        result = *(void **)(a1 + 32);
        return (void *)[result _updateHomes];
      }

      BOOL v9 = _LogCategory_Initialize(result[12], 0x1Eu);
      result = *(void **)(a1 + 32);
      if (v9)
      {
        id v3 = (int *)result[12];
        goto LABEL_4;
      }
    }

    return (void *)[result _updateHomes];
  }

  return result;
}

void *__57__CUHomeKitManager_home_didUpdateMediaPeerToPeerEnabled___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[2])
  {
    id v3 = (int *)result[12];
    if (*v3 <= 30)
    {
      if (*v3 != -1)
      {
LABEL_4:
        if (*(_BYTE *)(a1 + 48)) {
          id v4 = "yes";
        }
        else {
          id v4 = "no";
        }
        [*(id *)(a1 + 40) name];
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF( (uint64_t)v3,  (uint64_t)"-[CUHomeKitManager home:didUpdateMediaPeerToPeerEnabled:]_block_invoke",  0x1Eu,  (uint64_t)"DidAddMediaPeerToPeerEnabled: %s, home '%@'\n",  v5,  v6,  v7,  v8,  (char)v4);

        result = *(void **)(a1 + 32);
        return (void *)[result _updateHomes];
      }

      BOOL v9 = _LogCategory_Initialize(result[12], 0x1Eu);
      result = *(void **)(a1 + 32);
      if (v9)
      {
        id v3 = (int *)result[12];
        goto LABEL_4;
      }
    }

    return (void *)[result _updateHomes];
  }

  return result;
}

void *__60__CUHomeKitManager_home_didUpdateMinimumMediaUserPrivilege___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[2])
  {
    id v3 = (int *)result[12];
    if (*v3 <= 30)
    {
      if (*v3 != -1)
      {
LABEL_4:
        unint64_t v4 = *(void *)(a1 + 48);
        if (v4 > 2) {
          uint64_t v5 = "?";
        }
        else {
          uint64_t v5 = off_189F312B0[v4];
        }
        [*(id *)(a1 + 40) name];
        BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF( (uint64_t)v3,  (uint64_t)"-[CUHomeKitManager home:didUpdateMinimumMediaUserPrivilege:]_block_invoke",  0x1Eu,  (uint64_t)"DidAddMediaUserLevel: %s, home '%@'\n",  v7,  v8,  v9,  v10,  (char)v5);

        result = *(void **)(a1 + 32);
        return (void *)[result _updateHomes];
      }

      BOOL v6 = _LogCategory_Initialize(result[12], 0x1Eu);
      result = *(void **)(a1 + 32);
      if (v6)
      {
        id v3 = (int *)result[12];
        goto LABEL_4;
      }
    }

    return (void *)[result _updateHomes];
  }

  return result;
}

void *__39__CUHomeKitManager_home_didRemoveUser___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[2])
  {
    id v3 = (int *)result[12];
    if (*v3 <= 30)
    {
      if (*v3 == -1)
      {
        BOOL v10 = _LogCategory_Initialize(result[12], 0x1Eu);
        result = *(void **)(a1 + 32);
        if (!v10) {
          return (void *)[result _updateHomes];
        }
        id v3 = (int *)result[12];
      }

      [*(id *)(a1 + 40) uniqueIdentifier];
      unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 40) userID];
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 48) name];
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF( (uint64_t)v3,  (uint64_t)"-[CUHomeKitManager home:didRemoveUser:]_block_invoke",  0x1Eu,  (uint64_t)"DidRemoveUser: %@, %{mask}, home '%@'",  v6,  v7,  v8,  v9,  (char)v4);

      result = *(void **)(a1 + 32);
    }

    return (void *)[result _updateHomes];
  }

  return result;
}

void *__36__CUHomeKitManager_home_didAddUser___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[2])
  {
    id v3 = (int *)result[12];
    if (*v3 <= 30)
    {
      if (*v3 == -1)
      {
        BOOL v10 = _LogCategory_Initialize(result[12], 0x1Eu);
        result = *(void **)(a1 + 32);
        if (!v10) {
          return (void *)[result _updateHomes];
        }
        id v3 = (int *)result[12];
      }

      [*(id *)(a1 + 40) uniqueIdentifier];
      unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 40) userID];
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 48) name];
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF( (uint64_t)v3,  (uint64_t)"-[CUHomeKitManager home:didAddUser:]_block_invoke",  0x1Eu,  (uint64_t)"DidAddUser: %@, %{mask}, home '%@'",  v6,  v7,  v8,  v9,  (char)v4);

      result = *(void **)(a1 + 32);
    }

    return (void *)[result _updateHomes];
  }

  return result;
}

void *__52__CUHomeKitManager_home_didUpdateRoom_forAccessory___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[2])
  {
    id v3 = (int *)result[12];
    if (*v3 <= 30)
    {
      if (*v3 == -1)
      {
        BOOL v10 = _LogCategory_Initialize(result[12], 0x1Eu);
        result = *(void **)(a1 + 32);
        if (!v10) {
          return (void *)[result _updateHomes];
        }
        id v3 = (int *)result[12];
      }

      [*(id *)(a1 + 40) name];
      unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 48) name];
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 56) name];
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF( (uint64_t)v3,  (uint64_t)"-[CUHomeKitManager home:didUpdateRoom:forAccessory:]_block_invoke",  0x1Eu,  (uint64_t)"DidUpdateRoom: '%@', accessory '%@', home '%@'\n",  v6,  v7,  v8,  v9,  (char)v4);

      result = *(void **)(a1 + 32);
    }

    return (void *)[result _updateHomes];
  }

  return result;
}

void *__44__CUHomeKitManager_home_didRemoveAccessory___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[2])
  {
    id v3 = (int *)result[12];
    if (*v3 <= 30)
    {
      if (*v3 == -1)
      {
        BOOL v9 = _LogCategory_Initialize(result[12], 0x1Eu);
        result = *(void **)(a1 + 32);
        if (!v9) {
          return (void *)[result _updateHomes];
        }
        id v3 = (int *)result[12];
      }

      [*(id *)(a1 + 40) name];
      unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 48) name];
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF( (uint64_t)v3,  (uint64_t)"-[CUHomeKitManager home:didRemoveAccessory:]_block_invoke",  0x1Eu,  (uint64_t)"DidRemoveAccessory: '%@', home '%@'\n",  v5,  v6,  v7,  v8,  (char)v4);

      result = *(void **)(a1 + 32);
    }

    return (void *)[result _updateHomes];
  }

  return result;
}

void *__41__CUHomeKitManager_home_didAddAccessory___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[2])
  {
    id v3 = (int *)result[12];
    if (*v3 <= 30)
    {
      if (*v3 == -1)
      {
        BOOL v9 = _LogCategory_Initialize(result[12], 0x1Eu);
        result = *(void **)(a1 + 32);
        if (!v9) {
          return (void *)[result _updateHomes];
        }
        id v3 = (int *)result[12];
      }

      [*(id *)(a1 + 40) name];
      unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 48) name];
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF( (uint64_t)v3,  (uint64_t)"-[CUHomeKitManager home:didAddAccessory:]_block_invoke",  0x1Eu,  (uint64_t)"DidAddAccessory: '%@', home '%@'\n",  v5,  v6,  v7,  v8,  (char)v4);

      result = *(void **)(a1 + 32);
    }

    return (void *)[result _updateHomes];
  }

  return result;
}

void *__46__CUHomeKitManager_homeManager_didRemoveHome___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[2])
  {
    id v3 = (int *)result[12];
    if (*v3 <= 30)
    {
      if (*v3 == -1)
      {
        BOOL v9 = _LogCategory_Initialize(result[12], 0x1Eu);
        result = *(void **)(a1 + 32);
        if (!v9) {
          return (void *)[result _updateHomes];
        }
        id v3 = (int *)result[12];
      }

      [*(id *)(a1 + 40) name];
      unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF( (uint64_t)v3,  (uint64_t)"-[CUHomeKitManager homeManager:didRemoveHome:]_block_invoke",  0x1Eu,  (uint64_t)"DidRemoveHome: '%@'\n",  v5,  v6,  v7,  v8,  (char)v4);

      result = *(void **)(a1 + 32);
    }

    return (void *)[result _updateHomes];
  }

  return result;
}

void *__43__CUHomeKitManager_homeManager_didAddHome___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[2])
  {
    id v3 = (int *)result[12];
    if (*v3 <= 30)
    {
      if (*v3 == -1)
      {
        BOOL v9 = _LogCategory_Initialize(result[12], 0x1Eu);
        result = *(void **)(a1 + 32);
        if (!v9) {
          return (void *)[result _updateHomes];
        }
        id v3 = (int *)result[12];
      }

      [*(id *)(a1 + 40) name];
      unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF( (uint64_t)v3,  (uint64_t)"-[CUHomeKitManager homeManager:didAddHome:]_block_invoke",  0x1Eu,  (uint64_t)"DidAddHome: '%@'\n",  v5,  v6,  v7,  v8,  (char)v4);

      result = *(void **)(a1 + 32);
    }

    return (void *)[result _updateHomes];
  }

  return result;
}

uint64_t __48__CUHomeKitManager_homeManager_didUpdateStatus___block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void **)(result + 32);
  if (v8[2])
  {
    uint64_t v9 = result;
    BOOL v10 = (int *)v8[12];
    if (*v10 <= 30)
    {
      if (*v10 == -1)
      {
        BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
        uint64_t v8 = *(void **)(v9 + 32);
        if (!v11) {
          goto LABEL_7;
        }
        BOOL v10 = (int *)v8[12];
      }

      LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUHomeKitManager homeManager:didUpdateStatus:]_block_invoke",  0x1Eu,  (uint64_t)"HomeManagerDidUpdateStatus: %d",  a5,  a6,  a7,  a8,  *(void *)(v9 + 40));
      uint64_t v8 = *(void **)(v9 + 32);
    }

uint64_t __46__CUHomeKitManager_homeManagerDidUpdateHomes___block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 32);
  if (*(void *)(v8 + 16))
  {
    uint64_t v9 = result;
    BOOL v10 = *(int **)(v8 + 96);
    if (*v10 <= 30)
    {
      if (*v10 == -1)
      {
        BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
        uint64_t v8 = *(void *)(v9 + 32);
        if (!v11) {
          goto LABEL_7;
        }
        BOOL v10 = *(int **)(v8 + 96);
      }

      LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUHomeKitManager homeManagerDidUpdateHomes:]_block_invoke",  0x1Eu,  (uint64_t)"HomeManagerDidUpdateHomes\n",  a5,  a6,  a7,  a8,  v12);
      uint64_t v8 = *(void *)(v9 + 32);
    }

uint64_t __54__CUHomeKitManager_homeManagerDidUpdateDataSyncState___block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void **)(result + 32);
  if (v8[2])
  {
    uint64_t v9 = result;
    BOOL v10 = (int *)v8[12];
    if (*v10 <= 30)
    {
      if (*v10 == -1)
      {
        BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
        uint64_t v8 = *(void **)(v9 + 32);
        if (!v11) {
          goto LABEL_7;
        }
        BOOL v10 = (int *)v8[12];
      }

      LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUHomeKitManager homeManagerDidUpdateDataSyncState:]_block_invoke",  0x1Eu,  (uint64_t)"HomeKit DataSync changed\n",  a5,  a6,  a7,  a8,  v12);
      uint64_t v8 = *(void **)(v9 + 32);
    }

void __47__CUHomeKitManager__findPairedPeerWithContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  [*(id *)(a1 + 48) firstObject];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v2 _findPairedPeerWithContext:v3 label:@"allIdentities" pairingIdentity:v4 error:*(void *)(a1 + 56)];
}

void __47__CUHomeKitManager__findPairedPeerWithContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(a1 + 40);
  uint64_t v9 = *(dispatch_queue_s **)(v7 + 120);
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __47__CUHomeKitManager__findPairedPeerWithContext___block_invoke_3;
  v12[3] = &unk_189F32D00;
  v12[4] = v7;
  id v13 = v8;
  id v14 = v5;
  id v15 = v6;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v9, v12);
}

void __47__CUHomeKitManager__findPairedPeerWithContext___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[1] = 3221225472LL;
  int8x16_t v7 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  uint64_t v8 = *(void *)(a1 + 32);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __47__CUHomeKitManager__findPairedPeerWithContext___block_invoke_5;
  block[3] = &unk_189F311E0;
  uint64_t v9 = *(dispatch_queue_s **)(v8 + 120);
  int8x16_t v13 = v7;
  id v14 = *(id *)(a1 + 48);
  id v15 = v5;
  id v16 = v6;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v9, block);
}

void __47__CUHomeKitManager__findPairedPeerWithContext___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSPrintF();
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend( *(id *)(a1 + 40),  "_findPairedPeerWithContext:label:pairingIdentity:error:",  *(void *)(a1 + 48),  v3,  *(void *)(a1 + 56),  *(void *)(a1 + 64),  v2);
}

uint64_t __47__CUHomeKitManager__findPairedPeerWithContext___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _findPairedPeerWithContext:*(void *)(a1 + 40) label:@"accessory" pairingIdentity:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

uint64_t __54__CUHomeKitManager_findPairedPeer_options_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _findPairedPeer:*(void *)(a1 + 40) options:*(void *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

void __100__CUHomeKitManager__getPairingIdentityForLegacyWithOptions_user_nonLegacyIdentity_label_completion___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int8x16_t v7 = *(void **)(a1 + 40);
  uint64_t v8 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 120LL);
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __100__CUHomeKitManager__getPairingIdentityForLegacyWithOptions_user_nonLegacyIdentity_label_completion___block_invoke_2;
  v12[3] = &unk_189F31168;
  id v13 = v5;
  id v14 = v7;
  id v15 = *(id *)(a1 + 48);
  id v16 = v6;
  uint64_t v9 = *(void *)(a1 + 72);
  uint64_t v17 = *(void *)(a1 + 32);
  uint64_t v20 = v9;
  id v18 = *(id *)(a1 + 56);
  id v19 = *(id *)(a1 + 64);
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v8, v12);
}

void __100__CUHomeKitManager__getPairingIdentityForLegacyWithOptions_user_nonLegacyIdentity_label_completion___block_invoke_2( uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v27;
LABEL_3:
    uint64_t v7 = 0LL;
    while (1)
    {
      if (*(void *)v27 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = *(void **)(*((void *)&v26 + 1) + 8 * v7);
      [v8 identifier];
      uint64_t v9 = (const __CFString *)objc_claimAutoreleasedReturnValue();
      id v10 = (__CFString *)v9;
      id v11 = v9 ? (__CFString *)v9 : @"?";
      [v2 addObject:v11];

      [v8 identifier];
      char v12 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 40) identifier];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      int v14 = [v12 isEqual:v13];

      if (!v14) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }

    id v15 = v8;

    if (!v15) {
      goto LABEL_15;
    }
    uint64_t v17 = *(void *)(a1 + 80);
    uint64_t v16 = *(void *)(a1 + 88);
    id v19 = *(id *)(a1 + 56);
    id v18 = *(void **)(a1 + 64);
    uint64_t v20 = *(void *)(a1 + 72);
    id v21 = v15;
  }

  else
  {
LABEL_12:

LABEL_15:
    [*(id *)(a1 + 48) name];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    id v24 = v2;
    uint64_t v25 = *(void *)(a1 + 56);
    uint64_t v23 = v22;
    NSErrorWithOSStatusF((const char *)0xFFFFE5B9LL);
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    id v18 = *(void **)(a1 + 64);
    uint64_t v20 = *(void *)(a1 + 72);
    uint64_t v17 = *(void *)(a1 + 80);
    uint64_t v16 = *(void *)(a1 + 88);
    id v21 = 0LL;
    id v19 = v15;
  }

  objc_msgSend( v18,  "_getPairingIdentityCompleted:options:error:label:completion:",  v21,  v16,  v19,  v20,  v17,  v23,  v24,  v25);
}

void __69__CUHomeKitManager__getPairingIdentityForUserWithOptions_completion___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 120LL);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __69__CUHomeKitManager__getPairingIdentityForUserWithOptions_completion___block_invoke_2;
  block[3] = &unk_189F31118;
  id v12 = v5;
  uint64_t v17 = *(void *)(a1 + 64);
  __int128 v13 = *(_OWORD *)(a1 + 32);
  id v14 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  id v15 = v6;
  id v16 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __69__CUHomeKitManager__getPairingIdentityForUserWithOptions_completion___block_invoke_2(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 80);
  uint64_t v4 = *(void **)(a1 + 40);
  if (v2) {
    BOOL v5 = (*(void *)(a1 + 80) & 0x100LL) == 0;
  }
  else {
    BOOL v5 = 1;
  }
  id v6 = v2;
  if (v5) {
    [v4 _getPairingIdentityCompleted:*(void *)(a1 + 32) options:v3 error:*(void *)(a1 + 64) label:*(void *)(a1 + 56) completion:*(void *)(a1 + 72)];
  }
  else {
    [v4 _getPairingIdentityForLegacyWithOptions:v3 user:*(void *)(a1 + 48) nonLegacyIdentity:v2 label:*(void *)(a1 + 56) completion:*(void *)(a1 + 72)];
  }
}

void __74__CUHomeKitManager__getPairingIdentityForAccessoryWithOptions_completion___block_invoke( void *a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __74__CUHomeKitManager__getPairingIdentityForAccessoryWithOptions_completion___block_invoke_2;
  block[3] = &unk_189F31528;
  uint64_t v7 = a1[4];
  id v8 = (void *)a1[5];
  id v9 = *(dispatch_queue_s **)(v7 + 120);
  block[1] = 3221225472LL;
  void block[4] = v7;
  id v13 = v5;
  uint64_t v16 = a1[6];
  id v14 = v6;
  id v15 = v8;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v9, block);
}

uint64_t __74__CUHomeKitManager__getPairingIdentityForAccessoryWithOptions_completion___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 32) _getPairingIdentityCompleted:*(void *)(a1 + 40) options:*(void *)(a1 + 64) error:*(void *)(a1 + 48) label:@"SelfAccessory" completion:*(void *)(a1 + 56)];
}

void __73__CUHomeKitManager_getHomeKitLocalPairingIdentityWithOptions_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) firstObject];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 _getPairingIdentityCompleted:v3 options:*(void *)(a1 + 64) error:*(void *)(a1 + 48) label:@"HomeKitLocalKey" completion:*(void *)(a1 + 56)];
}

uint64_t __61__CUHomeKitManager_getPairingIdentityWithOptions_completion___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  id v9 = *(void **)(a1 + 32);
  id v10 = (int *)v9[12];
  if (*v10 > 30) {
    goto LABEL_5;
  }
  if (*v10 != -1) {
    goto LABEL_3;
  }
  BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
  id v9 = *(void **)(a1 + 32);
  if (v11)
  {
    id v10 = (int *)v9[12];
LABEL_3:
    LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUHomeKitManager getPairingIdentityWithOptions:completion:]_block_invoke",  0x1Eu,  (uint64_t)"GetPairingIdentity start: %#{flags}\n",  a5,  a6,  a7,  a8,  *(void *)(a1 + 48));
    id v9 = *(void **)(a1 + 32);
  }

void __38__CUHomeKitManager__updateAccessories__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  [v8 irkData];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 length];

  if (v5)
  {
    id v6 = *(void **)(a1 + 32);
    [v8 accessory];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 addObject:v7];
  }
}

void __38__CUHomeKitManager__clearHomeKitState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id v6 = *(int **)(*(void *)(a1 + 32) + 96LL);
  if (*v6 <= 30)
  {
    if (*v6 == -1)
    {
      if (!_LogCategory_Initialize(*(void *)(*(void *)(a1 + 32) + 96LL), 0x1Eu)) {
        goto LABEL_5;
      }
      id v6 = *(int **)(*(void *)(a1 + 32) + 96LL);
    }

    [v5 name];
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF( (uint64_t)v6,  (uint64_t)"-[CUHomeKitManager _clearHomeKitState]_block_invoke",  0x1Eu,  (uint64_t)"LostHome: %@ (%@), HK clear",  v7,  v8,  v9,  v10,  (char)v12);
  }

uint64_t __30__CUHomeKitManager_invalidate__block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 32);
  if (*(_BYTE *)(v8 + 88)) {
    return result;
  }
  uint64_t v9 = result;
  *(_BYTE *)(v8 + 88) = 1;
  uint64_t v10 = *(void *)(result + 32);
  BOOL v11 = *(int **)(v10 + 96);
  if (*v11 <= 30)
  {
    if (*v11 == -1)
    {
      BOOL v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
      uint64_t v10 = *(void *)(v9 + 32);
      if (!v12) {
        goto LABEL_6;
      }
      BOOL v11 = *(int **)(v10 + 96);
    }

    LogPrintF( (uint64_t)v11,  (uint64_t)"-[CUHomeKitManager invalidate]_block_invoke",  0x1Eu,  (uint64_t)"Invalidating\n",  a5,  a6,  a7,  a8,  v32);
    uint64_t v10 = *(void *)(v9 + 32);
  }

uint64_t __30__CUHomeKitManager_invalidate__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setDelegate:0];
}

uint64_t __30__CUHomeKitManager_invalidate__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setDelegate:0];
}

uint64_t __28__CUHomeKitManager_activate__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(int **)(v9 + 96);
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      uint64_t v9 = *(void *)(a1 + 32);
      if (!v11) {
        goto LABEL_5;
      }
      uint64_t v10 = *(int **)(v9 + 96);
    }

    LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUHomeKitManager activate]_block_invoke",  0x1Eu,  (uint64_t)"Activate %#{flags}\n",  a5,  a6,  a7,  a8,  *(_DWORD *)(v9 + 108));
    uint64_t v9 = *(void *)(a1 + 32);
  }

uint64_t __28__CUHomeKitManager_activate__block_invoke_2( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 32);
  if (*(_DWORD *)(v8 + 8) != -1)
  {
    uint64_t v9 = result;
    uint64_t v10 = *(int **)(v8 + 96);
    if (*v10 <= 30)
    {
      if (*v10 == -1)
      {
        BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
        uint64_t v8 = *(void *)(v9 + 32);
        if (!v11) {
          return [(id)v8 _activateIfNeeded];
        }
        uint64_t v10 = *(int **)(v8 + 96);
      }

      LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUHomeKitManager activate]_block_invoke_2",  0x1Eu,  (uint64_t)"HomeKit prefs changed\n",  a5,  a6,  a7,  a8,  v12);
      uint64_t v8 = *(void *)(v9 + 32);
    }

    return [(id)v8 _activateIfNeeded];
  }

  return result;
}

@end
@interface LSBundleRecordUpdater
- (BOOL)checkNeedsUpdateForiTunesMetadata:(id)a3 SINFo:(id)a4 placeholderMetadata:(id)a5;
- (BOOL)parsePersonas:(id)a3 error:(id *)a4;
- (BOOL)updateBundleRecord:(id *)a3;
- (LSBundleRecordUpdater)initWithBundleIdentifier:(id)a3;
- (LSBundleRecordUpdater)initWithBundleIdentifier:(id)a3 preferPlaceholder:(BOOL)a4;
- (LSBundleRecordUpdater)initWithDatabase:(id)a3 bundleUnit:(unsigned int)a4 bundleData:(const LSBundleData *)a5;
- (id).cxx_construct;
- (void)dealloc;
- (void)parsePlaceholderMetadata:(id)a3;
- (void)parseSINFDictionary:(id)a3;
- (void)parseiTunesMetadata:(id)a3;
@end

@implementation LSBundleRecordUpdater

- (LSBundleRecordUpdater)initWithDatabase:(id)a3 bundleUnit:(unsigned int)a4 bundleData:(const LSBundleData *)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___LSBundleRecordUpdater;
  v9 = -[LSBundleRecordUpdater init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    -[LSRecordBuilder setDatabase:](v9, "setDatabase:", v8);
    v10->_bundleID = a4;
    memcpy(&v10->_bundleData, a5, 0x214uLL);
    v10->_hasContext = 0;
  }

  return v10;
}

- (LSBundleRecordUpdater)initWithBundleIdentifier:(id)a3 preferPlaceholder:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x1895F89C0];
  unsigned int v21 = 0;
  id obj = 0LL;
  uint64_t v20 = 0LL;
  id v6 = a3;
  id v22 = 0LL;
  int inited = _LSContextInitReturningError((uint64_t)&obj, (uint64_t)&v22);
  id v8 = v22;
  if (inited)
  {
    if (v4) {
      int v9 = 1152;
    }
    else {
      int v9 = 128;
    }
    memset(buf, 0, 32);
    if (_LSBundleFindWithInfoAndNo_IOFilter((LSContext *)&obj, 0LL, v6, 0, buf, 2, v9, 0LL, 0LL, &v21, &v20, 0LL))
    {
      v10 = 0LL;
      int v11 = 1;
      goto LABEL_9;
    }

    uint64_t v12 = _LSMakeNSErrorImpl((void *)*MEMORY[0x189607670], -10814LL, (uint64_t)"initContextAndLookupBundle", 59LL, 0LL);

    id v8 = (id)v12;
    _LSContextDestroy(&obj);
  }

  id v8 = v8;
  int v11 = 0;
  v10 = v8;
LABEL_9:

  id v13 = v10;
  if (v11)
  {
    v14 = -[LSBundleRecordUpdater initWithDatabase:bundleUnit:bundleData:]( self,  "initWithDatabase:bundleUnit:bundleData:",  obj,  v21,  v20);
    v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_context.db, obj);
      v15->_hasContext = 1;
      _LSDefaultLog();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = *(void *)(v20 + 164);
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v6;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v17;
        _os_log_impl( &dword_183E58000,  v16,  OS_LOG_TYPE_DEFAULT,  "Created bundleRecordUpdater for app %@. flags=%llx",  buf,  0x16u);
      }

      goto LABEL_18;
    }

    _LSContextDestroy(&obj);
  }

  else
  {
  }

  _LSDefaultLog();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[LSBundleRecordUpdater initWithBundleIdentifier:preferPlaceholder:].cold.1((uint64_t)v6, (uint64_t)v13, v16);
  }
  v15 = 0LL;
LABEL_18:

  return v15;
}

- (LSBundleRecordUpdater)initWithBundleIdentifier:(id)a3
{
  return -[LSBundleRecordUpdater initWithBundleIdentifier:preferPlaceholder:]( self,  "initWithBundleIdentifier:preferPlaceholder:",  a3,  0LL);
}

- (void)dealloc
{
  if (self->_hasContext) {
    _LSContextDestroy((void **)&self->_context.db);
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LSBundleRecordUpdater;
  -[LSBundleRecordUpdater dealloc](&v3, sel_dealloc);
}

- (void)parseiTunesMetadata:(id)a3
{
  id v4 = a3;
  if (v4 && self->_bundleID)
  {
    id v55 = v4;
    uint64_t v5 = *(void *)(&self->_bundleData._clas + 1);
    int bundleFlags_high = HIDWORD(self->_bundleData._bundleFlags);
    _LSPlistGet((uint64_t)self->super._db, self->_bundleData.base.infoDictionary);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    _LSPlistDataGetDictionary(v6, 0LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = (void *)[v7 mutableCopy];
    LODWORD(v7) = objc_msgSend(v55, "_LS_BoolForKey:", @"initialODRSize");
    int v8 = objc_msgSend(v55, "_LS_BoolForKey:", @"is-purchased-redownload");
    int v9 = objc_msgSend(v55, "_LS_BoolForKey:", @"DeviceBasedVPP");
    uint64_t v10 = v5 | 0x80000000000LL;
    if (!(_DWORD)v7) {
      uint64_t v10 = v5;
    }
    if (v8) {
      v10 |= 0x400000uLL;
    }
    if (v9) {
      v10 |= 0x8000000000000uLL;
    }
    uint64_t v49 = v10;
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = [v55 objectForKey:@"artistName"];
    id v13 = (const __CFString *)v12;
    if (v11 && v12)
    {
      v14 = (__CFString *)v12;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        id v13 = v14;
      }

      else
      {

        id v13 = 0LL;
      }
    }

    v52 = (__CFString *)v13;
    LODWORD(self->_bundleData.installFailureReason) = _LSDatabaseCreateStringForCFString(self->super._db, v13, 0);
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = [v55 objectForKey:@"itemName"];
    uint64_t v17 = (const __CFString *)v16;
    if (v15 && v16)
    {
      v18 = (__CFString *)v16;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v17 = v18;
      }

      else
      {

        uint64_t v17 = 0LL;
      }
    }

    v51 = (__CFString *)v17;
    LODWORD(self->_bundleData.familyID) = _LSDatabaseCreateStringForCFString(self->super._db, v17, 0);
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = [v55 objectForKey:@"sourceApp"];
    unsigned int v21 = (const __CFString *)v20;
    if (v19 && v20)
    {
      id v22 = (__CFString *)v20;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        unsigned int v21 = v22;
      }

      else
      {

        unsigned int v21 = 0LL;
      }
    }

    v50 = (__CFString *)v21;
    HIDWORD(self->_bundleData.storefront) = _LSDatabaseCreateStringForCFString(self->super._db, v21, 0);
    *(unint64_t *)((char *)&self->_bundleData.familyID + 4) = objc_msgSend(v55, "_LS_integerForKey:", @"s");
    uint64_t v23 = objc_msgSend(v55, "_LS_integerForKey:", @"softwareVersionExternalIdentifier");
    if (!v23) {
      uint64_t v23 = objc_msgSend(v55, "_LS_integerForKey:", @"betaExternalVersionIdentifier");
    }
    *(void *)(&self->_bundleData.itemName + 1) = v23;
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = [v55 objectForKey:@"com.apple.iTunesStore.downloadInfo"];
    v26 = (void *)v25;
    if (v24 && v25)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v27 = v26;
        v26 = 0LL;
LABEL_39:

        goto LABEL_40;
      }
    }

    else if (!v25)
    {
      goto LABEL_40;
    }

    uint64_t v28 = objc_opt_class();
    uint64_t v29 = [v26 objectForKey:@"accountInfo"];
    v27 = (void *)v29;
    if (v28 && v29)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_39;
      }
LABEL_36:
      unint64_t v30 = objc_msgSend(v27, "_LS_integerForKey:", @"PurchaserID");
      if (!v30) {
        unint64_t v30 = objc_msgSend(v27, "_LS_integerForKey:", @"DSPersonID");
      }
      self->_bundleData.staticDiskUsage = v30;
      goto LABEL_39;
    }

    if (v29) {
      goto LABEL_36;
    }
LABEL_40:
    uint64_t v31 = objc_opt_class();
    uint64_t v32 = [v55 objectForKey:@"variantID"];
    v33 = (__CFString *)v32;
    if (v31 && v32 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      v33 = 0LL;
    }

    LODWORD(self->_bundleData.versionIdentifier) = _LSDatabaseCreateStringForCFString(self->super._db, v33, 0);
    uint64_t v34 = objc_opt_class();
    uint64_t v35 = [v55 objectForKey:@"managementDeclarationIdentifier"];
    v36 = (__CFString *)v35;
    if (v34 && v35 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      v36 = 0LL;
    }

    HIDWORD(self->_bundleData.versionIdentifier) = _LSDatabaseCreateStringForCFString(self->super._db, v36, 0);
    uint64_t v37 = objc_opt_class();
    uint64_t v38 = [v55 objectForKey:@"storeCohort"];
    v39 = (void *)v38;
    if (v37 && v38)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v39 = 0LL;
LABEL_54:
        self->_bundleData.compatibilityState = objc_msgSend(v55, "_LS_integerForKey:", @"itemId");
        uint64_t v40 = objc_opt_class();
        uint64_t v41 = [v55 objectForKey:@"rating"];
        v42 = (__CFString *)v41;
        if (v40 && v41)
        {
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v43 = v42;
            v42 = 0LL;
LABEL_64:

            goto LABEL_65;
          }
        }

        else if (!v41)
        {
LABEL_65:
          _LSPlistRemove((uint64_t)self->super._db, self->_bundleData.ratingLabel);
          self->_bundleData.ratingLabel = 0;
          uint64_t v46 = objc_opt_class();
          uint64_t v47 = [v55 objectForKey:@"distributorInfo"];
          v48 = (void *)v47;
          if (v46 && v47)
          {
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_71;
            }
          }

          else if (!v47)
          {
LABEL_72:
            _LSPlistRemove((uint64_t)self->super._db, self->_bundleData.base.infoDictionary);
            self->_bundleData.base.infoDictionary = _LSPlistAdd((uint64_t)self->super._db, v54);
            HIDWORD(self->_bundleData._bundleFlags) = bundleFlags_high;
            *(void *)(&self->_bundleData._clas + 1) = v49;

            id v4 = v55;
            goto LABEL_73;
          }

          self->_bundleData.ratingLabel = _LSPlistAdd((uint64_t)self->super._db, v48);
LABEL_71:

          goto LABEL_72;
        }

        *(void *)&self->_bundleData.sourceAppBundleID = -[__CFString _LS_integerForKey:]( v42,  "_LS_integerForKey:",  @"rank");
        uint64_t v44 = objc_opt_class();
        uint64_t v45 = -[__CFString objectForKey:](v42, "objectForKey:", @"label");
        v43 = (__CFString *)v45;
        if (v44 && v45 && (objc_opt_isKindOfClass() & 1) == 0)
        {

          v43 = 0LL;
        }

        self->_bundleData.managementDeclarationIdentifier = _LSDatabaseCreateStringForCFString(self->super._db, v43, 0);
        goto LABEL_64;
      }
    }

    else if (!v38)
    {
      goto LABEL_54;
    }

    [v54 setObject:v39 forKeyedSubscript:@"storeCohort"];
    bundleFlags_high |= 0x4000u;
    goto LABEL_54;
  }

- (void)parseSINFDictionary:(id)a3
{
  id v4 = a3;
  if (v4 && self->_bundleID)
  {
    id v11 = v4;
    p_bundleData = &self->_bundleData;
    self->_bundleData.purchaserDSID = objc_msgSend(v4, "_LS_integerForKey:", @"DownloaderDSID");
    self->_bundleData.staticDiskUsage = objc_msgSend(v11, "_LS_integerForKey:", @"ApplicationDSID");
    self->_bundleData.downloaderDSID = objc_msgSend(v11, "_LS_integerForKey:", @"FamilyID");
    uint64_t v6 = *(void *)(&self->_bundleData._clas + 1);
    int v7 = objc_msgSend(v11, "_LS_BoolForKey:", @"MissingSINF");
    int v8 = objc_msgSend(v11, "_LS_BoolForKey:", @"HasMIDBasedSINF");
    uint64_t v9 = 0x2000000LL;
    if (!v7) {
      uint64_t v9 = 0LL;
    }
    uint64_t v10 = 0x1000000LL;
    if (!v8) {
      uint64_t v10 = 0LL;
    }
    *(void *)(&p_bundleData->_clas + 1) = v9 | v10 | v6 & 0xFFFFFFFFFCFFFFFFLL;
    id v4 = v11;
  }
}

- (void)parsePlaceholderMetadata:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && self->_bundleID)
  {
    int v8 = v4;
    uint64_t v6 = objc_msgSend(v4, "_LS_integerForKey:", @"LSInstallType");
    if (v6) {
      self->_bundleData.bundleVersion = v6;
    }
    uint64_t v7 = objc_msgSend(v8, "_LS_integerForKey:", @"PlaceholderFailureReason");
    uint64_t v5 = v8;
    if (v7) {
      *(void *)&self->_bundleData.shortVersionString = v7;
    }
  }
}

- (BOOL)parsePersonas:(id)a3 error:(id *)a4
{
  uint64_t v61 = *MEMORY[0x1895F89C0];
  id v45 = a3;
  uint64_t v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v45, "count"));
  memset(&v51, 0, sizeof(v51));
  std::vector<unsigned int>::reserve(&v51, [v45 count]);
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id obj = v45;
  uint64_t v6 = [obj countByEnumeratingWithState:&v47 objects:v60 count:16];
  uint64_t v44 = self;
  if (v6)
  {
    char v7 = 0;
    uint64_t v8 = *(void *)v48;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v48 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v47 + 1) + 8 * i);
        BOOL v11 = -[_LSPersonaWithAttributes personaType](v10) == 3;
        -[_LSDatabase store](v10);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 addObject:v12];

        unsigned int v13 = -[_LSPersonaWithAttributes personaType](v10);
        unsigned int v14 = v13;
        std::vector<unsigned int>::pointer end = v51.__end_;
        if (v51.__end_ >= v51.__end_cap_.__value_)
        {
          std::vector<unsigned int>::pointer begin = v51.__begin_;
          int64_t v18 = v51.__end_ - v51.__begin_;
          unint64_t v19 = v18 + 1;
          int64_t v20 = (char *)v51.__end_cap_.__value_ - (char *)v51.__begin_;
          else {
            unint64_t v21 = v19;
          }
          if (v21)
          {
            id v22 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>( (uint64_t)&v51.__end_cap_,  v21);
            std::vector<unsigned int>::pointer begin = v51.__begin_;
            std::vector<unsigned int>::pointer end = v51.__end_;
          }

          else
          {
            id v22 = 0LL;
          }

          uint64_t v23 = (unsigned int *)&v22[4 * v18];
          *uint64_t v23 = v14;
          uint64_t v16 = v23 + 1;
          while (end != begin)
          {
            unsigned int v24 = *--end;
            *--uint64_t v23 = v24;
          }

          v51.__begin_ = v23;
          v51.__end_ = v16;
          v51.__end_cap_.__value_ = (unsigned int *)&v22[4 * v21];
          if (begin) {
            operator delete(begin);
          }
        }

        else
        {
          *v51.__end_ = v13;
          uint64_t v16 = end + 1;
        }

        v7 |= v11;
        v51.__end_ = v16;
      }

      uint64_t v6 = [obj countByEnumeratingWithState:&v47 objects:v60 count:16];
    }

    while (v6);

    uint64_t v25 = v44;
    p_bundleData = &v44->_bundleData;
    uint64_t v27 = 0x100000000000000LL;
    if ((v7 & 1) == 0) {
      uint64_t v27 = 0LL;
    }
    unint64_t v28 = *(void *)(&v44->_bundleData._clas + 1) & 0xFEFFFFFFFFFFFFFFLL | v27;
  }

  else
  {

    uint64_t v25 = self;
    p_bundleData = &self->_bundleData;
    unint64_t v28 = *(void *)(&v44->_bundleData._clas + 1) & 0xFEFFFFFFFFFFFFFFLL;
  }

  *(void *)(&p_bundleData->_clas + 1) = v28;
  int queriableSchemes = p_bundleData->queriableSchemes;
  uint64_t v30 = objc_msgSend(v5, "count", a4);
  if (v30) {
    LODWORD(v30) = _LSDatabaseCreateStringArray(v25->super._db, v5, 0, 0LL);
  }
  p_int queriableSchemes = &p_bundleData->queriableSchemes;
  p_bundleData->int queriableSchemes = v30;
  _LSDatabaseDisposeStringArray(v25->super._db, queriableSchemes);
  if (v51.__end_ == v51.__begin_) {
    unsigned int v32 = 0;
  }
  else {
    unsigned int v32 = _CSArrayCreate();
  }
  p_bundleData->bgPermittedIDs = v32;
  _CSArrayDispose();
  if (![obj count] || *p_queriableSchemes && p_bundleData->bgPermittedIDs)
  {
    _LSRegistrationLog();
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t bundleID = v25->_bundleID;
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = bundleID;
      _os_log_impl( &dword_183E58000,  v33,  OS_LOG_TYPE_DEFAULT,  "Unsetting redactible for unit %llx",  (uint8_t *)&buf,  0xCu);
    }

    *(_BYTE *)&p_bundleData->base.flags &= ~0x20u;
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v53 = 0x4812000000LL;
    v54 = __Block_byref_object_copy__9;
    id v55 = __Block_byref_object_dispose__9;
    v56 = "";
    __p = 0LL;
    v58 = 0LL;
    uint64_t v59 = 0LL;
    _CSArrayEnumerateAllValues();
    uint64_t v35 = *(void *)(*((void *)&buf + 1) + 48LL);
    uint64_t v36 = *(void *)(*((void *)&buf + 1) + 56LL);
    while (v35 != v36)
    {
      _CSStringRelease();
      v35 += 4LL;
    }

    _Block_object_dispose(&buf, 8);
    if (__p)
    {
      v58 = __p;
      operator delete(__p);
    }

    id v37 = 0LL;
    BOOL v38 = 1;
  }

  else
  {
    _LSDefaultLog();
    v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      -[LSBundleRecordUpdater parsePersonas:error:].cold.1( &p_bundleData->queriableSchemes,  &p_bundleData->bgPermittedIDs,  v39);
    }

    *(void *)p_int queriableSchemes = 0LL;
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -41LL,  (uint64_t)"-[LSBundleRecordUpdater parsePersonas:error:]",  305LL,  0LL);
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
    id v37 = v40;
    if (v43)
    {
      id v37 = v40;
      BOOL v38 = 0;
      void *v43 = v37;
    }

    else
    {
      BOOL v38 = 0;
    }
  }

  if (v51.__begin_)
  {
    v51.__end_ = v51.__begin_;
    operator delete(v51.__begin_);
  }

  return v38;
}

void __45__LSBundleRecordUpdater_parsePersonas_error___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  int v35 = a3;
  id v4 = std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::find<unsigned int>( (void *)(*(void *)(a1 + 32) + 568LL),  (unsigned int *)&v35);
  if (!v4)
  {
    uint64_t v5 = (__int128 *)_LSGetPlugin(*(void *)(*(void *)(a1 + 32) + 8LL), v35);
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32) + 568LL;
      *(_DWORD *)__int128 buf = v35;
      __int128 v7 = v5[10];
      __int128 v8 = v5[11];
      __int128 v9 = v5[12];
      __int128 v50 = v5[13];
      __int128 v49 = v9;
      __int128 v48 = v8;
      __int128 v47 = v7;
      __int128 v10 = v5[6];
      __int128 v11 = v5[7];
      __int128 v12 = v5[8];
      __int128 v46 = v5[9];
      __int128 v45 = v12;
      __int128 v44 = v11;
      __int128 v43 = v10;
      __int128 v13 = v5[2];
      __int128 v14 = v5[3];
      __int128 v15 = v5[4];
      __int128 v42 = v5[5];
      __int128 v41 = v15;
      __int128 v40 = v14;
      __int128 v39 = v13;
      __int128 v16 = *v5;
      __int128 v38 = v5[1];
      __int128 v37 = v16;
      id v4 = std::__hash_table<std::__hash_value_type<unsigned int,LSPluginData>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSPluginData>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSPluginData>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSPluginData>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int,LSPluginData>>( v6,  (unsigned int *)buf,  (uint64_t)buf);
    }

    else
    {
      id v4 = 0LL;
    }
  }

  _LSRegistrationLog();
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v18 = (void *)_CSStringCopyCFString();
    *(_DWORD *)__int128 buf = 138412290;
    *(void *)&__int128 v37 = v18;
    _os_log_impl( &dword_183E58000,  v17,  OS_LOG_TYPE_DEFAULT,  "Rolling UUID on %@ and marking not eligible for redaction",  buf,  0xCu);
  }

  _LSBindableDeactivate(*(void **)(*(void *)(a1 + 32) + 8LL), v35);
  unint64_t v19 = *(void **)(*(void *)(a1 + 40) + 8LL);
  int64_t v20 = (char *)v19[7];
  unint64_t v21 = v19[8];
  if ((unint64_t)v20 >= v21)
  {
    uint64_t v23 = (char *)v19[6];
    uint64_t v24 = (v20 - v23) >> 2;
    unint64_t v25 = v24 + 1;
    uint64_t v26 = v21 - (void)v23;
    if (v26 >> 1 > v25) {
      unint64_t v25 = v26 >> 1;
    }
    else {
      unint64_t v27 = v25;
    }
    if (v27)
    {
      unint64_t v28 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)(v19 + 8), v27);
      uint64_t v23 = (char *)v19[6];
      int64_t v20 = (char *)v19[7];
    }

    else
    {
      unint64_t v28 = 0LL;
    }

    uint64_t v29 = &v28[4 * v24];
    uint64_t v30 = &v28[4 * v27];
    *(_DWORD *)uint64_t v29 = v4[58];
    id v22 = v29 + 4;
    while (v20 != v23)
    {
      int v31 = *((_DWORD *)v20 - 1);
      v20 -= 4;
      *((_DWORD *)v29 - 1) = v31;
      v29 -= 4;
    }

    v19[6] = v29;
    v19[7] = v22;
    v19[8] = v30;
    if (v23) {
      operator delete(v23);
    }
  }

  else
  {
    *(_DWORD *)int64_t v20 = v4[58];
    id v22 = v20 + 4;
  }

  v19[7] = v22;
  unsigned int v32 = *(void **)(*(void *)(a1 + 32) + 8LL);
  [MEMORY[0x189607AB8] UUID];
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v33 UUIDString];
  uint64_t v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4[58] = _LSDatabaseCreateStringForCFString(v32, v34, 0);

  *((_BYTE *)v4 + 176) &= ~0x20u;
}

- (BOOL)updateBundleRecord:(id *)a3
{
  uint64_t v5 = _LSDatabaseGetSequenceNumber() + 1;
  *(void *)&self->_bundleData._maxSystemVersion._opaque[28] = v5;
  self->_bundleData.appContainerAlias = (int)CFAbsoluteTimeGetCurrent();
  _LSDatabaseSetSequenceNumber((uint64_t)self->super._db, v5);
  int v6 = _CSStoreWriteToUnit();
  for (uint64_t i = &self->_modifiedPlugins; ; _LSBindableActivate(self->super._db, (int)i->__table_.__p1_.__value_.__next_))
  {
    uint64_t i = (unordered_map<unsigned int, LSPluginData, std::hash<unsigned int>, std::equal_to<unsigned int>, std::allocator<std::pair<const unsigned int, LSPluginData>>> *)i->__table_.__bucket_list_.__ptr_.__value_;
    if (!i) {
      break;
    }
    _CSStoreWriteToUnit();
  }

  if (v6)
  {
    _LSDatabaseCommit((uint64_t)self->super._db);
  }

  else if (a3)
  {
    *a3 = 0LL;
  }

  return v6 != 0;
}

- (BOOL)checkNeedsUpdateForiTunesMetadata:(id)a3 SINFo:(id)a4 placeholderMetadata:(id)a5
{
  unint64_t v8 = (unint64_t)a3;
  unint64_t v9 = (unint64_t)a4;
  id v10 = a5;
  __int128 v11 = v10;
  BOOL v12 = (v8 | v9) != 0;
  if (v10)
  {
    uint64_t v13 = objc_msgSend(v10, "_LS_integerForKey:", @"LSInstallType");
    uint64_t v14 = objc_msgSend(v11, "_LS_integerForKey:", @"PlaceholderFailureReason");
    if (v13 && v13 != self->_bundleData.bundleVersion) {
      BOOL v12 = 1;
    }
    if (v14 && v14 != *(void *)&self->_bundleData.shortVersionString) {
      BOOL v12 = 1;
    }
  }

  return v12;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0LL;
  *(_OWORD *)((char *)self + 568) = 0u;
  *(_OWORD *)((char *)self + 584) = 0u;
  *((_DWORD *)self + 150) = 1065353216;
  return self;
}

- (void)initWithBundleIdentifier:(os_log_s *)a3 preferPlaceholder:.cold.1( uint64_t a1,  uint64_t a2,  os_log_s *a3)
{
  *(_DWORD *)objc_super v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_2_0( &dword_183E58000,  a2,  a3,  "could not make bundle record updater for %@: %@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16],  *MEMORY[0x1895F89C0]);
}

- (void)parsePersonas:(os_log_s *)a3 error:.cold.1(unsigned int *a1, _DWORD *a2, os_log_s *a3)
{
  *(_DWORD *)objc_super v3 = 134218240;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2048;
  *(_DWORD *)&v3[14] = *a2;
  OUTLINED_FUNCTION_2_0( &dword_183E58000,  (uint64_t)a2,  a3,  "failed to allocate personas (%llx) or persona types (%llx) CSArray",  *(void *)v3,  *(void *)&v3[8]);
}

@end
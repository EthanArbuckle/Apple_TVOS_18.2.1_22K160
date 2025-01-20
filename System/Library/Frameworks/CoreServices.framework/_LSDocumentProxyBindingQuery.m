@interface _LSDocumentProxyBindingQuery
+ (BOOL)supportsSecureCoding;
- (BOOL)_requiresDatabaseMappingEntitlement;
- (BOOL)isEqual:(id)a3;
- (BOOL)yieldClaimBindings;
- (LSDocumentProxy)documentProxy;
- (NSString)handlerRank;
- (_LSDocumentProxyBindingQuery)initWithCoder:(id)a3;
- (_LSDocumentProxyBindingQuery)initWithDocumentProxy:(id)a3 style:(unsigned __int8)a4 handlerRank:(id)a5;
- (unint64_t)hash;
- (unsigned)style;
- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)filterOpenRestrictedBindings:(void *)a3 connection:(id)a4 context:(LSContext *)a5 earlyYield:(id)a6;
- (void)setYieldClaimBindings:(BOOL)a3;
@end

@implementation _LSDocumentProxyBindingQuery

- (_LSDocumentProxyBindingQuery)initWithDocumentProxy:(id)a3 style:(unsigned __int8)a4 handlerRank:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS____LSDocumentProxyBindingQuery;
  v11 = -[_LSQuery _init](&v16, sel__init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(v11 + 2, a3);
    *((_BYTE *)v12 + 10) = a4;
    uint64_t v13 = [v10 copy];
    id v14 = v12[3];
    v12[3] = (id)v13;
  }

  return (_LSDocumentProxyBindingQuery *)v12;
}

- (void)filterOpenRestrictedBindings:(void *)a3 connection:(id)a4 context:(LSContext *)a5 earlyYield:(id)a6
{
  v36[1] = *MEMORY[0x1895F89C0];
  id v10 = a4;
  v30 = (void (**)(id, void, void *))a6;
  id v11 = -[_LSDocumentProxyBindingQuery documentProxy](self, "documentProxy");
  v12 = (_OWORD *)[v11 sourceAuditToken];

  if (v10
    && ([v10 auditToken], !_LSAuditTokensAreEqual(v12, v34))
    && ([v10 _xpcConnection],
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(),
        BOOL v14 = _LSCheckEntitlementForXPCConnection( v13,  @"com.apple.private.launchservices.canspecifymanageddocumentsource") == 0,  v13,  v14))
  {
    std::vector<LSBinding>::__base_destruct_at_end[abi:nn180100]((uint64_t)a3, *(void *)a3);
    uint64_t v35 = *MEMORY[0x189607490];
    v36[0] = @"missing entitlement";
    [MEMORY[0x189603F68] dictionaryWithObjects:v36 forKeys:&v35 count:1];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[_LSDocumentProxyBindingQuery filterOpenRestrictedBindings:connection:context:earlyYield:]",  754LL,  v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2](v30, 0LL, v29);
  }

  else
  {
    v15 = (void *)_LSCopyBundleIdentifierForAuditToken(v12, 1);
    if (v15)
    {
      objc_super v16 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 4)];
      uint64_t v17 = *(void *)a3;
      uint64_t v18 = *((void *)a3 + 1);
      if (*(void *)a3 != v18)
      {
        do
        {
          v19 = (void *)_CSStringCopyCFString();
          if (v19) {
            [v16 addObject:v19];
          }

          v17 += 48LL;
        }

        while (v17 != v18);
      }
      v20 = +[LSApplicationRestrictionsManager sharedInstance]();
      v21 = -[_LSDocumentProxyBindingQuery documentProxy](self, "documentProxy");
      v22 = -[LSApplicationRestrictionsManager allowedOpenInAppBundleIDsAfterApplyingFilterToAppBundleIDs:originatingAppBundleID:originatingAccountIsManaged:]( v20,  v16,  v15,  [v21 isContentManaged]);
      uint64_t v23 = *(void *)a3;
      uint64_t v24 = *((void *)a3 + 1);
      v31[0] = MEMORY[0x1895F87A8];
      v31[1] = 3221225472LL;
      v31[2] = __91___LSDocumentProxyBindingQuery_filterOpenRestrictedBindings_connection_context_earlyYield___block_invoke;
      v31[3] = &unk_189D76768;
      v33 = a5;
      id v25 = v22;
      id v32 = v25;
      uint64_t v26 = std::remove_if[abi:nn180100]<std::__wrap_iter<LSBinding *>,BOOL({block_pointer} {__strong})(LSBinding const&)>( v23,  v24,  v31);
      std::vector<LSBinding>::erase((uint64_t)a3, v26, *((void *)a3 + 1));
    }

    else
    {
      _LSDefaultLog();
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[_LSDocumentProxyBindingQuery filterOpenRestrictedBindings:connection:context:earlyYield:].cold.1(v27);
      }
    }
  }
}

- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4
{
  v61[1] = *MEMORY[0x1895F89C0];
  id v42 = a3;
  v7 = (void (**)(id, void, id))a4;
  -[_LSDocumentProxyBindingQuery handlerRank](self, "handlerRank");
  v8 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  id v9 = (__CFString *)v8;
  if (v8)
  {
    __int16 v10 = _LSNumericHandlerRankFromHandlerRankString(v8);
    unsigned __int8 v11 = v10;
    __int16 v4 = HIBYTE(v10);
    int v12 = 0x10000;
  }

  else
  {
    int v12 = 0;
    unsigned __int8 v11 = 0;
  }
  v41 = -[_LSDocumentProxyBindingQuery documentProxy](self, "documentProxy");
  if (v41)
  {
    int v13 = -[_LSDocumentProxyBindingQuery style](self, "style");
    BOOL v14 = -[_LSDocumentProxyBindingQuery yieldClaimBindings](self, "yieldClaimBindings");
    id v57 = 0LL;
    v54 = 0LL;
    id v55 = 0LL;
    char v56 = 0;
    if (LaunchServices::Database::Context::status((id *)&v54))
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v15 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v54, v15, 0LL);

      if (v16) {
        id v17 = 0LL;
      }
      else {
        id v17 = v57;
      }
      v7[2](v7, 0LL, v17);
    }

    else
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v20 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      v21 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v54, v20, 0LL);

      __int128 v52 = 0u;
      __int128 v53 = 0u;
      if (v42)
      {
        [v42 auditToken];
        __int128 v52 = v58[0];
        __int128 v53 = v58[1];
        v22 = &v52;
      }

      else
      {
        v22 = 0LL;
      }

      objc_msgSend(v41, "_bindingEvaluatorWithAuditToken:", v22, v41);
      if (v13 == 1) {
        int v23 = 320;
      }
      else {
        int v23 = 0;
      }
      if (v13 == 2) {
        int v23 = 12320;
      }
      unsigned __int16 v24 = v11 | (unsigned __int16)(v4 << 8);
      if (v24) {
        BOOL v25 = 1;
      }
      else {
        BOOL v25 = v9 == 0LL;
      }
      if (!v25) {
        v23 |= 0x1000u;
      }
      int v26 = v23 | 0x2020;
      if (v23 | 0x2020)
      {
        int Options = LaunchServices::BindingEvaluator::getOptions((LaunchServices::BindingEvaluator *)v58);
        LaunchServices::BindingEvaluator::setOptions((uint64_t)v58, Options | v26);
      }

      if (v9)
      {
        v50[0] = MEMORY[0x1895F87A8];
        v50[1] = 3221225472LL;
        v50[2] = __66___LSDocumentProxyBindingQuery__enumerateWithXPCConnection_block___block_invoke;
        v50[3] = &__block_descriptor_36_e60_B24__0__LSContext___8r__LSBinding_I__LSBundleData_I_______16l;
        int v51 = v12 | v24;
        LaunchServices::BindingEvaluator::setFilter_NoIO((uint64_t)v58, @"handler rank", v50);
      }

      id v49 = 0LL;
      if (v14) {
        v28 = &v49;
      }
      else {
        v28 = 0LL;
      }
      id v46 = 0LL;
      LaunchServices::BindingEvaluator::evaluateBindings( (LaunchServices::BindingEvaluator *)v58,  v21,  v28,  &v46,  (uint64_t *)&v47);
      id v29 = v46;
      v30 = v29;
      if (v47 == v48 && _LSGetOSStatusFromNSError(v29) != -10814)
      {
        v7[2](v7, 0LL, v30);
      }

      else
      {
        v31 = +[LSApplicationRestrictionsManager sharedInstance]();
        int v32 = -[LSApplicationRestrictionsManager isOpenInRestrictionInEffect](v31);

        if (v32) {
          -[_LSDocumentProxyBindingQuery filterOpenRestrictedBindings:connection:context:earlyYield:]( self,  "filterOpenRestrictedBindings:connection:context:earlyYield:",  &v47,  v42,  v21,  v7);
        }
        id v45 = 0LL;
        memset(v43, 0, sizeof(v43));
        int v44 = 1065353216;
        v34 = v47;
        for (i = v48; v34 != i; v34 += 12)
        {
          if (!std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::find<unsigned int>( v43,  v34))
          {
            uint64_t v35 = (void *)MEMORY[0x186E2A59C]();
            if (v14)
            {
              v36 = objc_alloc(&OBJC_CLASS___LSClaimBinding);
              uint64_t v37 = -[LSClaimBinding _initWithContext:binding:coreTypesBundleRecord:typeRecord:error:]( v36,  "_initWithContext:binding:coreTypesBundleRecord:typeRecord:error:",  v21,  v34,  &v45,  v49,  0LL);
            }

            else
            {
              uint64_t v37 = +[LSApplicationProxy applicationProxyWithBundleUnitID:withContext:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyWithBundleUnitID:withContext:",  *v34,  v21);
            }

            v38 = (void *)v37;
            objc_autoreleasePoolPop(v35);
            std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int &>( (uint64_t)v43,  v34,  v34);
            if (v38 && !((unsigned int (*)(id, void *, void))v7[2])(v7, v38, 0LL))
            {

              break;
            }
          }
        }

        std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>>>::~__hash_table((uint64_t)v43);
      }

      *(void *)&v43[0] = &v47;
      std::vector<LSBinding>::__destroy_vector::operator()[abi:nn180100]((void ***)v43);

      if (v59) {
        LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v58);
      }
    }

    if (v54 && v56) {
      _LSContextDestroy(v54);
    }
    id v39 = v55;
    v54 = 0LL;
    id v55 = 0LL;

    char v56 = 0;
    id v40 = v57;
    id v57 = 0LL;
  }

  else
  {
    uint64_t v60 = *MEMORY[0x189607490];
    v61[0] = @"documentProxy";
    [MEMORY[0x189603F68] dictionaryWithObjects:v61 forKeys:&v60 count:1];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[_LSDocumentProxyBindingQuery _enumerateWithXPCConnection:block:]",  810LL,  v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0LL, v19);
  }
}

- (BOOL)_requiresDatabaseMappingEntitlement
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS____LSDocumentProxyBindingQuery;
  if (-[_LSQuery isEqual:](&v13, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [v4 documentProxy];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[_LSDocumentProxyBindingQuery documentProxy](self, "documentProxy");
    if ([v5 isEqual:v6]
      && (int v7 = [v4 style], v7 == -[_LSDocumentProxyBindingQuery style](self, "style")))
    {
      [v4 handlerRank];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_LSDocumentProxyBindingQuery handlerRank](self, "handlerRank");
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v8 isEqual:v9])
      {
        int v10 = [v4 yieldClaimBindings];
        int v11 = v10 ^ -[_LSDocumentProxyBindingQuery yieldClaimBindings](self, "yieldClaimBindings") ^ 1;
      }

      else
      {
        LOBYTE(v11) = 0;
      }
    }

    else
    {
      LOBYTE(v11) = 0;
    }
  }

  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 hash];
  unsigned int v5 = -[_LSDocumentProxyBindingQuery style](self, "style");
  v6 = -[_LSDocumentProxyBindingQuery handlerRank](self, "handlerRank");
  uint64_t v7 = v4 ^ [v6 hash] ^ v5;

  uint64_t v8 = v7 ^ (-[_LSDocumentProxyBindingQuery yieldClaimBindings](self, "yieldClaimBindings") << 63 >> 63);
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS____LSDocumentProxyBindingQuery;
  return v8 ^ -[_LSQuery hash](&v10, sel_hash);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  -[_LSDocumentProxyBindingQuery documentProxy](self, "documentProxy");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 encodeObject:v4 forKey:@"documentProxy"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[_LSDocumentProxyBindingQuery style](self, "style"), @"style");
  -[_LSDocumentProxyBindingQuery handlerRank](self, "handlerRank");
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 encodeObject:v5 forKey:@"handlerRank"];

  objc_msgSend( v6,  "encodeBool:forKey:",  -[_LSDocumentProxyBindingQuery yieldClaimBindings](self, "yieldClaimBindings"),  @"yieldClaimBindings");
}

- (_LSDocumentProxyBindingQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"documentProxy");
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned __int8 v6 = [v4 decodeIntegerForKey:@"style"];
  objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"handlerRank");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = -[_LSDocumentProxyBindingQuery initWithDocumentProxy:style:handlerRank:]( self,  "initWithDocumentProxy:style:handlerRank:",  v5,  v6,  v7);
  if (v8) {
    -[_LSDocumentProxyBindingQuery setYieldClaimBindings:]( v8,  "setYieldClaimBindings:",  [v4 decodeBoolForKey:@"yieldClaimBindings"]);
  }

  return v8;
}

- (BOOL)yieldClaimBindings
{
  return *(&self->super._legacy + 1);
}

- (void)setYieldClaimBindings:(BOOL)a3
{
  *(&self->super._legacy + 1) = a3;
}

- (LSDocumentProxy)documentProxy
{
  return *(LSDocumentProxy **)&self->_yieldClaimBindings;
}

- (unsigned)style
{
  return *(&self->super._legacy + 2);
}

- (NSString)handlerRank
{
  return (NSString *)&self->_documentProxy->super.super.super.isa;
}

- (void).cxx_destruct
{
}

- (void)filterOpenRestrictedBindings:(os_log_t)log connection:context:earlyYield:.cold.1( os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl( &dword_183E58000,  log,  OS_LOG_TYPE_ERROR,  "Open restriction in effect, but caller has no bundle ID.",  v1,  2u);
}

@end
@interface _LSAvailableApplicationsForURLQuery
+ (BOOL)supportsSecureCoding;
- (BOOL)_requiresDatabaseMappingEntitlement;
- (NSURL)URL;
- (_LSAvailableApplicationsForURLQuery)initWithCoder:(id)a3;
- (_LSAvailableApplicationsForURLQuery)initWithURL:(id)a3;
- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)yieldBundles:(const void *)a3 context:(LSContext *)a4 block:(id)a5;
@end

@implementation _LSAvailableApplicationsForURLQuery

- (_LSAvailableApplicationsForURLQuery)initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____LSAvailableApplicationsForURLQuery;
  v6 = -[_LSQuery _init](&v9, sel__init);
  v7 = (_LSAvailableApplicationsForURLQuery *)v6;
  if (v6) {
    objc_storeStrong(v6 + 2, a3);
  }

  return v7;
}

- (void)yieldBundles:(const void *)a3 context:(LSContext *)a4 block:(id)a5
{
  v12 = (uint64_t (**)(id, void *, void))a5;
  v7 = *(unsigned int **)a3;
  v8 = (unsigned int *)*((void *)a3 + 1);
  if (*(unsigned int **)a3 != v8)
  {
    while (1)
    {
      uint64_t v9 = *v7;
      v10 = (void *)MEMORY[0x186E2A59C]();
      v11 = +[LSApplicationProxy applicationProxyWithBundleUnitID:withContext:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyWithBundleUnitID:withContext:",  v9,  a4);
      objc_autoreleasePoolPop(v10);
      if (v11)
      {
        if ((v12[2](v12, v11, 0LL) & 1) == 0) {
          break;
        }
      }

      if (++v7 == v8) {
        goto LABEL_7;
      }
    }
  }

- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4
{
  uint64_t v77 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  v7 = (void (**)(id, void *, void))a4;
  v8 = -[_LSAvailableApplicationsForURLQuery URL](self, "URL");
  [v8 scheme];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if ([v9 isEqualToString:@"com-apple-audiounit"])
    {
      v10 = +[LSApplicationProxy applicationProxyForIdentifier:placeholder:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:placeholder:",  @"com.apple.audioUnit.temp",  1LL);
      v7[2](v7, v10, 0LL);
    }

    else
    {
      id v73 = 0LL;
      v70 = 0LL;
      id v71 = 0LL;
      char v72 = 0;
      +[_LSDServiceDomain defaultServiceDomain]();
      v13 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      v14 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v70, v13, 0LL);

      if (v14)
      {
        +[_LSCanOpenURLManager bindingEvaluatorForScheme:]( &OBJC_CLASS____LSCanOpenURLManager,  "bindingEvaluatorForScheme:",  v9);
        id v67 = 0LL;
        LaunchServices::BindingEvaluator::evaluateBindings((LaunchServices::BindingEvaluator *)v76, v14, &v67, &v68);
        id v15 = v67;
        v16 = v15;
        uint64_t v18 = v68;
        uint64_t v17 = v69;
        if (v68 == v69)
        {
          if (_LSGetOSStatusFromNSError(v15) == -10814)
          {
            _LSDefaultLog();
            v54 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
              -[_LSAvailableApplicationsForURLQuery _enumerateWithXPCConnection:block:].cold.1((uint64_t)v9, v54);
            }
          }

          else
          {
            ((void (**)(id, void *, void *))v7)[2](v7, 0LL, v16);
          }
        }

        else
        {
          v64 = 0LL;
          v65 = 0LL;
          v66 = 0LL;
          id v57 = v15;
          __p = 0LL;
          v62 = 0LL;
          v63 = 0LL;
          v58 = 0LL;
          v59 = 0LL;
          v60 = 0LL;
          do
          {
            if (*(_DWORD *)(*(void *)(v18 + 8) + 160LL) == 14)
            {
              v19 = v62;
              if (v62 >= v63)
              {
                v23 = (char *)__p;
                uint64_t v24 = (v62 - (_BYTE *)__p) >> 2;
                unint64_t v25 = v24 + 1;
                uint64_t v26 = v63 - (_BYTE *)__p;
                if ((v63 - (_BYTE *)__p) >> 1 > v25) {
                  unint64_t v25 = v26 >> 1;
                }
                else {
                  unint64_t v27 = v25;
                }
                if (v27)
                {
                  v28 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)&v63, v27);
                  v23 = (char *)__p;
                  v19 = v62;
                }

                else
                {
                  v28 = 0LL;
                }

                v43 = &v28[4 * v24];
                *(_DWORD *)v43 = *(_DWORD *)v18;
                v20 = v43 + 4;
                while (v19 != v23)
                {
                  int v44 = *((_DWORD *)v19 - 1);
                  v19 -= 4;
                  *((_DWORD *)v43 - 1) = v44;
                  v43 -= 4;
                }

                __p = v43;
                v62 = v20;
                v63 = &v28[4 * v27];
                if (v23) {
                  operator delete(v23);
                }
              }

              else
              {
                *(_DWORD *)v62 = *(_DWORD *)v18;
                v20 = v19 + 4;
              }

              v62 = v20;
            }

            else if (__p == v62)
            {
              v29 = v65;
              if (v65 >= v66)
              {
                v37 = (char *)v64;
                uint64_t v38 = (v65 - (_BYTE *)v64) >> 2;
                unint64_t v39 = v38 + 1;
                if ((unint64_t)(v38 + 1) >> 62) {
LABEL_88:
                }
                  abort();
                uint64_t v40 = v66 - (_BYTE *)v64;
                if ((v66 - (_BYTE *)v64) >> 1 > v39) {
                  unint64_t v39 = v40 >> 1;
                }
                else {
                  unint64_t v41 = v39;
                }
                if (v41)
                {
                  v42 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)&v66, v41);
                  v37 = (char *)v64;
                  v29 = v65;
                }

                else
                {
                  v42 = 0LL;
                }

                v47 = &v42[4 * v38];
                *(_DWORD *)v47 = *(_DWORD *)v18;
                v30 = v47 + 4;
                while (v29 != v37)
                {
                  int v48 = *((_DWORD *)v29 - 1);
                  v29 -= 4;
                  *((_DWORD *)v47 - 1) = v48;
                  v47 -= 4;
                }

                v64 = v47;
                v65 = v30;
                v66 = &v42[4 * v41];
                if (v37) {
                  operator delete(v37);
                }
              }

              else
              {
                *(_DWORD *)v65 = *(_DWORD *)v18;
                v30 = v29 + 4;
              }

              v65 = v30;
            }

            else
            {
              v21 = v59;
              if (v59 >= v60)
              {
                v31 = (char *)v58;
                uint64_t v32 = (v59 - (_BYTE *)v58) >> 2;
                unint64_t v33 = v32 + 1;
                uint64_t v34 = v60 - (_BYTE *)v58;
                if ((v60 - (_BYTE *)v58) >> 1 > v33) {
                  unint64_t v33 = v34 >> 1;
                }
                else {
                  unint64_t v35 = v33;
                }
                if (v35)
                {
                  v36 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)&v60, v35);
                  v31 = (char *)v58;
                  v21 = v59;
                }

                else
                {
                  v36 = 0LL;
                }

                v45 = &v36[4 * v32];
                *(_DWORD *)v45 = *(_DWORD *)v18;
                v22 = v45 + 4;
                while (v21 != v31)
                {
                  int v46 = *((_DWORD *)v21 - 1);
                  v21 -= 4;
                  *((_DWORD *)v45 - 1) = v46;
                  v45 -= 4;
                }

                v58 = v45;
                v59 = v22;
                v60 = &v36[4 * v35];
                if (v31) {
                  operator delete(v31);
                }
              }

              else
              {
                *(_DWORD *)v59 = *(_DWORD *)v18;
                v22 = v21 + 4;
              }

              v59 = v22;
            }

            v18 += 48LL;
          }

          while (v18 != v17);
          p_p = &__p;
          if (__p == v62) {
            p_p = &v58;
          }
          if (v64 == v65) {
            v50 = p_p;
          }
          else {
            v50 = &v64;
          }
          -[_LSAvailableApplicationsForURLQuery yieldBundles:context:block:]( self,  "yieldBundles:context:block:",  v50,  v14,  v7);
          v16 = v57;
          if (v58)
          {
            v59 = (char *)v58;
            operator delete(v58);
          }

          if (__p)
          {
            v62 = (char *)__p;
            operator delete(__p);
          }

          if (v64)
          {
            v65 = (char *)v64;
            operator delete(v64);
          }
        }

        v64 = &v68;
        std::vector<LSBinding>::__destroy_vector::operator()[abi:nn180100]((void ***)&v64);

        LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v76);
      }

      else
      {
        +[_LSDServiceDomain defaultServiceDomain]();
        v51 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
        uint64_t v52 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v70, v51, 0LL);

        if (v52) {
          id v53 = 0LL;
        }
        else {
          id v53 = v73;
        }
        ((void (**)(id, void *, id))v7)[2](v7, 0LL, v53);
      }

      if (v70 && v72) {
        _LSContextDestroy(v70);
      }
      id v55 = v71;
      v70 = 0LL;
      id v71 = 0LL;

      char v72 = 0;
      id v56 = v73;
      id v73 = 0LL;
    }
  }

  else
  {
    uint64_t v74 = *MEMORY[0x189607490];
    v75 = @"invalid URL or scheme";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[_LSAvailableApplicationsForURLQuery _enumerateWithXPCConnection:block:]",  666LL,  v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v7)[2](v7, 0LL, v12);
  }
}

- (BOOL)_requiresDatabaseMappingEntitlement
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____LSAvailableApplicationsForURLQuery;
  -[_LSQuery encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  [v4 encodeObject:self->_URL forKey:@"URL"];
}

- (_LSAvailableApplicationsForURLQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____LSAvailableApplicationsForURLQuery;
  objc_super v5 = -[_LSQuery initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"URL");
    URL = v5->_URL;
    v5->_URL = (NSURL *)v6;
  }

  return v5;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
}

- (void)_enumerateWithXPCConnection:(uint64_t)a1 block:(os_log_s *)a2 .cold.1( uint64_t a1,  os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_debug_impl( &dword_183E58000,  a2,  OS_LOG_TYPE_DEBUG,  "No bindings found for scheme %{private}@",  (uint8_t *)&v2,  0xCu);
  OUTLINED_FUNCTION_1();
}

@end
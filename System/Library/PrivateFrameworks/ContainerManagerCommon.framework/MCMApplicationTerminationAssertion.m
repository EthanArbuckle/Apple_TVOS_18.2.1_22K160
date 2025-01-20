@interface MCMApplicationTerminationAssertion
- (MCMApplicationTerminationAssertion)initWithBundleIdentifier:(id)a3 reason:(id)a4;
- (RBSTerminationAssertion)termAssertion;
- (void)dealloc;
- (void)invalidate;
- (void)setTermAssertion:(id)a3;
@end

@implementation MCMApplicationTerminationAssertion

- (MCMApplicationTerminationAssertion)initWithBundleIdentifier:(id)a3 reason:(id)a4
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___MCMApplicationTerminationAssertion;
  v8 = -[MCMApplicationTerminationAssertion init](&v30, sel_init);
  if (!v8) {
    goto LABEL_31;
  }
  if (!RunningBoardServicesLibraryCore_frameworkLibrary)
  {
    *(_OWORD *)buf = xmmword_18A29E008;
    *(void *)&buf[16] = 0LL;
    RunningBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }

  if (!RunningBoardServicesLibraryCore_frameworkLibrary) {
    goto LABEL_31;
  }
  uint64_t v31 = 0LL;
  v32 = &v31;
  uint64_t v33 = 0x2050000000LL;
  v9 = (void *)getRBSProcessPredicateClass_softClass;
  uint64_t v34 = getRBSProcessPredicateClass_softClass;
  if (!getRBSProcessPredicateClass_softClass)
  {
    *(void *)buf = MEMORY[0x1895F87A8];
    *(void *)&buf[8] = 3221225472LL;
    *(void *)&buf[16] = __getRBSProcessPredicateClass_block_invoke;
    v36 = &unk_18A29E028;
    v37 = &v31;
    __getRBSProcessPredicateClass_block_invoke((uint64_t)buf);
    v9 = (void *)v32[3];
  }

  id v10 = v9;
  _Block_object_dispose(&v31, 8);
  [v10 predicateMatchingBundleIdentifier:v6];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    container_log_handle_for_category();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v6;
      _os_log_error_impl( &dword_188846000,  v25,  OS_LOG_TYPE_ERROR,  "Failed to generate predicate for termination assertion for [%@]",  buf,  0xCu);
    }

    goto LABEL_30;
  }

  uint64_t v31 = 0LL;
  v32 = &v31;
  uint64_t v33 = 0x2050000000LL;
  v12 = (void *)getRBSTerminateContextClass_softClass;
  uint64_t v34 = getRBSTerminateContextClass_softClass;
  if (!getRBSTerminateContextClass_softClass)
  {
    *(void *)buf = MEMORY[0x1895F87A8];
    *(void *)&buf[8] = 3221225472LL;
    *(void *)&buf[16] = __getRBSTerminateContextClass_block_invoke;
    v36 = &unk_18A29E028;
    v37 = &v31;
    __getRBSTerminateContextClass_block_invoke((uint64_t)buf);
    v12 = (void *)v32[3];
  }

  v13 = v12;
  _Block_object_dispose(&v31, 8);
  v14 = (void *)[[v13 alloc] initWithExplanation:v7];
  v15 = v14;
  if (!v14)
  {
    container_log_handle_for_category();
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v6;
      _os_log_error_impl( &dword_188846000,  v26,  OS_LOG_TYPE_ERROR,  "Failed to generate context for termination assertion for [%@]",  buf,  0xCu);
    }

    goto LABEL_30;
  }

  [v14 setExceptionCode:3735933956];
  uint64_t v31 = 0LL;
  v32 = &v31;
  uint64_t v33 = 0x2050000000LL;
  v16 = (void *)getRBSTerminationAssertionClass_softClass;
  uint64_t v34 = getRBSTerminationAssertionClass_softClass;
  if (!getRBSTerminationAssertionClass_softClass)
  {
    *(void *)buf = MEMORY[0x1895F87A8];
    *(void *)&buf[8] = 3221225472LL;
    *(void *)&buf[16] = __getRBSTerminationAssertionClass_block_invoke;
    v36 = &unk_18A29E028;
    v37 = &v31;
    __getRBSTerminationAssertionClass_block_invoke((uint64_t)buf);
    v16 = (void *)v32[3];
  }

  v17 = v16;
  _Block_object_dispose(&v31, 8);
  v18 = (void *)[[v17 alloc] initWithPredicate:v11 context:v15];
  v19 = v18;
  if (v18)
  {
    id v29 = 0LL;
    char v20 = [v18 acquireWithError:&v29];
    v21 = (os_log_s *)v29;
    if ((v20 & 1) != 0)
    {
      v22 = v19;
      int v23 = 0;
      termAssertion = v8->_termAssertion;
      v8->_termAssertion = v22;
    }

    else
    {
      container_log_handle_for_category();
      termAssertion = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(termAssertion, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v6;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v21;
        _os_log_error_impl( &dword_188846000,  termAssertion,  OS_LOG_TYPE_ERROR,  "Failed to acquire termination assertion for [%@]: %@",  buf,  0x16u);
      }

      int v23 = 1;
    }
  }

  else
  {
    container_log_handle_for_category();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v6;
      _os_log_error_impl( &dword_188846000,  v21,  OS_LOG_TYPE_ERROR,  "Failed to init termination assertion for [%@]",  buf,  0xCu);
    }

    int v23 = 1;
  }

  if (!v23)
  {
LABEL_31:
    v27 = v8;
    goto LABEL_32;
  }

- (void)invalidate
{
  if (!RunningBoardServicesLibraryCore_frameworkLibrary) {
    RunningBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (RunningBoardServicesLibraryCore_frameworkLibrary)
  {
    v3 = -[MCMApplicationTerminationAssertion termAssertion](self, "termAssertion");
    v4 = v3;
    if (v3)
    {
      [v3 invalidate];
      -[MCMApplicationTerminationAssertion setTermAssertion:](self, "setTermAssertion:", 0LL);
    }
  }

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  -[MCMApplicationTerminationAssertion termAssertion](self, "termAssertion");
  if (objc_claimAutoreleasedReturnValue()) {
    __assert_rtn( "-[MCMApplicationTerminationAssertion dealloc]",  "MCMApplicationTerminationAssertion.m",  95,  "nil == self.termAssertion");
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCMApplicationTerminationAssertion;
  -[MCMApplicationTerminationAssertion dealloc](&v3, sel_dealloc);
}

- (RBSTerminationAssertion)termAssertion
{
  return self->_termAssertion;
}

- (void)setTermAssertion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
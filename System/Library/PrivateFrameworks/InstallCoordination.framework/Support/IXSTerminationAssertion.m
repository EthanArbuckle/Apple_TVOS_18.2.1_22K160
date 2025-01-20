@interface IXSTerminationAssertion
- (BOOL)acquireAssertion:(id *)a3;
- (OS_dispatch_semaphore)waitForAssertionSemaphore;
- (RBSTerminationAssertion)termAssertion;
- (id)_terminationAssertionForBundleIDs:(id)a3 description:(id)a4 terminationResistance:(unsigned __int8)a5 error:(id *)a6;
- (id)initForBundleIDs:(id)a3 description:(id)a4 terminationResistance:(unsigned __int8)a5 error:(id *)a6;
- (void)assertionTargetProcessDidExit:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setTermAssertion:(id)a3;
@end

@implementation IXSTerminationAssertion

- (void)setTermAssertion:(id)a3
{
  v5 = (RBSTerminationAssertion *)a3;
  termAssertion = self->_termAssertion;
  if (v5 && termAssertion == v5)
  {
    v7 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_10007D078();
    }
  }

  else
  {
    if (termAssertion) {
      -[RBSTerminationAssertion invalidate](termAssertion, "invalidate");
    }
    objc_storeStrong((id *)&self->_termAssertion, a3);
  }
}

- (id)_terminationAssertionForBundleIDs:(id)a3 description:(id)a4 terminationResistance:(unsigned __int8)a5 error:(id *)a6
{
  uint64_t v7 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [[RBSTerminateContext alloc] initWithExplanation:v10];

  [v12 setMaximumTerminationResistance:v7];
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessPredicate predicateMatchingBundleIdentifiers:]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingBundleIdentifiers:",  v11));

  v14 = -[RBSTerminationAssertion initWithPredicate:context:]( objc_alloc(&OBJC_CLASS___RBSTerminationAssertion),  "initWithPredicate:context:",  v13,  v12);
  v15 = v14;
  if (v14)
  {
    -[RBSTerminationAssertion addObserver:](v14, "addObserver:", self);
    id v16 = 0LL;
  }

  else
  {
    v17 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10007D0F4();
    }

    id v20 = sub_10003556C( (uint64_t)"-[IXSTerminationAssertion _terminationAssertionForBundleIDs:description:terminationResistance:error:]",  52LL,  @"IXErrorDomain",  0x13uLL,  0LL,  0LL,  @"Failed to create termination assertion for predicate %@",  v19,  (uint64_t)v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    id v16 = v21;
    if (a6)
    {
      id v16 = v21;
      *a6 = v16;
    }
  }

  return v15;
}

- (id)initForBundleIDs:(id)a3 description:(id)a4 terminationResistance:(unsigned __int8)a5 error:(id *)a6
{
  uint64_t v7 = a5;
  id v10 = a3;
  id v11 = a4;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___IXSTerminationAssertion;
  id v12 = -[IXSTerminationAssertion init](&v28, "init");
  v13 = v12;
  if (v12)
  {
    id v27 = 0LL;
    uint64_t v14 = objc_claimAutoreleasedReturnValue( -[IXSTerminationAssertion _terminationAssertionForBundleIDs:description:terminationResistance:error:]( v12,  "_terminationAssertionForBundleIDs:description:terminationResistance:error:",  v10,  v11,  v7,  &v27));
    id v15 = v27;
    termAssertion = v13->_termAssertion;
    v13->_termAssertion = (RBSTerminationAssertion *)v14;

    if (v13->_termAssertion)
    {
      dispatch_semaphore_t v17 = dispatch_semaphore_create(0LL);
      waitForAssertionSemaphore = v13->_waitForAssertionSemaphore;
      v13->_waitForAssertionSemaphore = (OS_dispatch_semaphore *)v17;

      if (v13->_termAssertion)
      {
        uint64_t v19 = v13;
        goto LABEL_11;
      }
    }
  }

  else
  {
    id v20 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10007D16C(v21, v22, v23);
    }

    id v25 = sub_10003556C( (uint64_t)"-[IXSTerminationAssertion initForBundleIDs:description:terminationResistance:error:]",  76LL,  @"IXErrorDomain",  1uLL,  0LL,  0LL,  @"%s failed in init",  v24,  (uint64_t)"-[IXSTerminationAssertion initForBundleIDs:description:terminationResistance:error:]");
    id v15 = (id)objc_claimAutoreleasedReturnValue(v25);
  }

  if (a6)
  {
    id v15 = v15;
    uint64_t v19 = 0LL;
    *a6 = v15;
  }

  else
  {
    uint64_t v19 = 0LL;
  }

- (BOOL)acquireAssertion:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSTerminationAssertion termAssertion](self, "termAssertion"));
  id v16 = 0LL;
  unsigned __int8 v6 = [v5 acquireWithError:&v16];
  id v7 = v16;

  if ((v6 & 1) != 0)
  {
    v8 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue( -[IXSTerminationAssertion waitForAssertionSemaphore]( self,  "waitForAssertionSemaphore"));
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  }

  else
  {
    v9 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10007D1FC(self, (uint64_t)v7, v10);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXSTerminationAssertion termAssertion](self, "termAssertion"));
    id v13 = sub_10003556C( (uint64_t)"-[IXSTerminationAssertion acquireAssertion:]",  94LL,  @"IXErrorDomain",  0x13uLL,  v7,  0LL,  @"Failed to acquire termination assertion %@",  v12,  (uint64_t)v11);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

    if (a3)
    {
      id v7 = v14;
      *a3 = v7;
    }

    else
    {
      id v7 = v14;
    }
  }

  return v6;
}

- (void)invalidate
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IXSTerminationAssertion;
  -[IXSTerminationAssertion dealloc](&v3, "dealloc");
}

- (void)assertionTargetProcessDidExit:(id)a3
{
  v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10007D2A0();
  }

  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSTerminationAssertion termAssertion](self, "termAssertion"));
  if (v6)
  {
    id v7 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue( -[IXSTerminationAssertion waitForAssertionSemaphore]( self,  "waitForAssertionSemaphore"));
    dispatch_semaphore_signal(v7);
  }

  else
  {
    v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v7 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      id v10 = "-[IXSTerminationAssertion assertionTargetProcessDidExit:]";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_DEFAULT,  "%s: We didn't have a termination assertion that we're tracking, so not acting on the callback from RBS",  (uint8_t *)&v9,  0xCu);
    }
  }
}

- (OS_dispatch_semaphore)waitForAssertionSemaphore
{
  return self->_waitForAssertionSemaphore;
}

- (RBSTerminationAssertion)termAssertion
{
  return self->_termAssertion;
}

- (void).cxx_destruct
{
}

  ;
}

@end
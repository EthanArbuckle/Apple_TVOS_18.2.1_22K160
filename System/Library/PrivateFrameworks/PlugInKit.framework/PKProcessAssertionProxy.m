@interface PKProcessAssertionProxy
- (BKSProcessAssertion)_bksObject;
- (BOOL)acquire;
- (PKProcessAssertionProxy)initWithPID:(int)a3 flags:(unsigned int)a4 reason:(unsigned int)a5 name:(id)a6;
- (id)invalidationHandler;
- (void)invalidate;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation PKProcessAssertionProxy

- (PKProcessAssertionProxy)initWithPID:(int)a3 flags:(unsigned int)a4 reason:(unsigned int)a5 name:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  id v10 = a6;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PKProcessAssertionProxy;
  v11 = -[PKProcessAssertionProxy init](&v17, sel_init);
  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x18960D500]);
    uint64_t v14 = objc_msgSend_initWithPID_flags_reason_name_(v12, v13, v8, v7, v6, v10);
    bksObject = v11->__bksObject;
    v11->__bksObject = (BKSProcessAssertion *)v14;
  }

  return v11;
}

- (id)invalidationHandler
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invalidationHandler(v5, v6, v7, v8, v9);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setInvalidationHandler:(id)a3
{
  id v4 = a3;
  objc_msgSend__bksObject(self, v5, v6, v7, v8);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInvalidationHandler_(v12, v9, (uint64_t)v4, v10, v11);
}

- (BOOL)acquire
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v10 = objc_msgSend_acquire(v5, v6, v7, v8, v9);

  return v10;
}

- (void)invalidate
{
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invalidate(v9, v5, v6, v7, v8);
}

- (BKSProcessAssertion)_bksObject
{
  return (BKSProcessAssertion *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end
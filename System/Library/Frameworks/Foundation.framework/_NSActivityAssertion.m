@interface _NSActivityAssertion
+ (id)_expirationHandlerExecutionQueue;
+ (id)_expiringActivities;
+ (id)_expiringAssertionManagementQueue;
+ (id)_expiringTaskExecutionQueue;
+ (void)_dumpExpiringActivitives;
+ (void)_expireAllActivies;
+ (void)_performActivityWithOptions:(unint64_t)a3 reason:(id)a4 usingBlock:(id)a5;
+ (void)_performExpiringActivityWithReason:(id)a3 usingBlock:(id)a4;
- (BOOL)_isEnded;
- (id)_initWithActivityOptions:(unint64_t)a3 reason:(id)a4 expirationHandler:(id)a5;
- (id)debugDescription;
- (void)_endFromDealloc:(BOOL)a3;
- (void)_fireExpirationHandler;
- (void)_reactivate;
- (void)dealloc;
@end

@implementation _NSActivityAssertion

+ (id)_expiringAssertionManagementQueue
{
  if (qword_18C496710 != -1) {
    dispatch_once(&qword_18C496710, &__block_literal_global_20);
  }
  return (id)qword_18C496718;
}

+ (id)_expiringTaskExecutionQueue
{
  if (qword_18C496720 != -1) {
    dispatch_once(&qword_18C496720, &__block_literal_global_2_0);
  }
  return (id)qword_18C496728;
}

+ (id)_expirationHandlerExecutionQueue
{
  if (qword_18C496730 != -1) {
    dispatch_once(&qword_18C496730, &__block_literal_global_4_0);
  }
  return (id)qword_18C496738;
}

+ (id)_expiringActivities
{
  if (qword_18C496740 != -1) {
    dispatch_once(&qword_18C496740, &__block_literal_global_6);
  }
  return (id)qword_18C496748;
}

+ (void)_dumpExpiringActivitives
{
}

+ (void)_expireAllActivies
{
}

- (id)_initWithActivityOptions:(unint64_t)a3 reason:(id)a4 expirationHandler:(id)a5
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS____NSActivityAssertion;
  v30.receiver = -[_NSActivityAssertion init](&v31, sel_init);
  v30.super_class = (Class)&OBJC_CLASS____NSActivityAssertion;
  v10 = -[_NSActivityAssertion init](&v30, sel_init);
  if (!v10) {
    return v10;
  }
  v10->_unint64_t options = a3;
  atomic_store(0, (unsigned __int8 *)&v10->_ended);
  if (a4) {
    v11 = (__CFString *)a4;
  }
  else {
    v11 = @"No Reason Specified (via NSActivityOptions)";
  }
  v12 = (const __CFString *)-[__CFString copy](v11, "copy", v9);
  v10->_reason = (NSString *)v12;
  atomic_store(0LL, &v10->_signpostID);
  unint64_t options = v10->_options;
  if ((options & 0x100000) != 0)
  {
    uint64_t v14 = IOPMAssertionCreateWithName(@"PreventUserIdleSystemSleep", 0xFFu, v12, &v10->_systemSleepAssertionID);
    if ((_DWORD)v14)
    {
      uint64_t v15 = v14;
      v16 = _NSMethodExceptionProem((objc_class *)v10, a2);
      NSLog((NSString *)@"%@: Warning: Could not create system idle sleep assertion (%d)", v16, v15);
      unint64_t options = v10->_options & 0xFFFFFFFFFFEFFFFFLL;
      v10->_unint64_t options = options;
      if ((options & 0x20000000000LL) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      unint64_t options = v10->_options;
      if ((options & 0x20000000000LL) != 0) {
        goto LABEL_15;
      }
    }

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  if (!self->_ended) {
    -[_NSActivityAssertion _endFromDealloc:](self, "_endFromDealloc:", 1LL);
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSActivityAssertion;
  -[_NSActivityAssertion dealloc](&v3, sel_dealloc);
}

- (id)debugDescription
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSActivityAssertion;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ 0x%16llx %@ %@",  -[_NSActivityAssertion debugDescription](&v3, sel_debugDescription),  self->_options,  self->_reason,  self->_processAssertion);
}

- (void)_endFromDealloc:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1895F89C0];
  p_ended = &self->_ended;
  do
  {
    if (__ldaxr((unsigned __int8 *)p_ended))
    {
      __clrex();
      NSLog((NSString *)@"Warning: NSActivity %@ was ended multiple times", a2, self);
      return;
    }
  }

  while (__stlxr(1u, (unsigned __int8 *)p_ended));
  unint64_t options = self->_options;
  if ((options & 0x100000) != 0)
  {
    IOPMAssertionRelease(self->_systemSleepAssertionID);
    unint64_t options = self->_options;
  }

  if ((options & 0x600000000000LL) != 0)
  {
    os_signpost_id_t v8 = atomic_load(&self->_signpostID);
    if (v8)
    {
      if (qword_18C496768 != -1) {
        dispatch_once(&qword_18C496768, &__block_literal_global_96);
      }
      if (v8 != -1LL)
      {
        uint64_t v9 = (os_log_s *)qword_18C496770;
        if (os_signpost_enabled((os_log_t)qword_18C496770))
        {
          *(_DWORD *)buf = 67240192;
          BOOL v16 = v3;
          _os_signpost_emit_with_name_impl( &dword_182EB1000,  v9,  OS_SIGNPOST_INTERVAL_END,  v8,  "interaction_tracking",  " abandoned=%{signpost.telemetry:number1,public}d ",  buf,  8u);
        }
      }

      atomic_store(0LL, &self->_signpostID);
    }

    unint64_t options = self->_options;
  }

  if ((options & 0x20000000000LL) != 0)
  {

    self->_transaction = 0LL;
    unint64_t options = self->_options;
  }

  if ((options & 0x40000000000LL) != 0)
  {
    if (self->_adoptPreviousVoucher)
    {

      self->_previousVoucher = 0LL;
    }

    voucher = self->_voucher;
    if (voucher)
    {

      self->_voucher = 0LL;
    }
  }

  unint64_t v11 = self->_options;
  if ((v11 & 0x80000000000LL) != 0)
  {

    self->_xpcBoost = 0LL;
    unint64_t v11 = self->_options;
  }

  if ((v11 & 0x100000000000LL) != 0)
  {
    v12 = +[_NSActivityAssertion _expiringAssertionManagementQueue]( &OBJC_CLASS____NSActivityAssertion,  "_expiringAssertionManagementQueue");
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __40___NSActivityAssertion__endFromDealloc___block_invoke;
    block[3] = &unk_189C9A030;
    block[4] = self;
    dispatch_async(v12, block);
  }

  os_unfair_lock_lock(&self->_lock);
  id expirationHandler = self->_expirationHandler;
  self->_id expirationHandler = 0LL;
  os_unfair_lock_unlock(&self->_lock);
  if (expirationHandler) {
    _Block_release(expirationHandler);
  }
}

- (void)_reactivate
{
  if ((self->_options & 0x40000000000LL) != 0)
  {
    if (self->_voucher)
    {
      BOOL v3 = (OS_voucher *)voucher_adopt();
      self->_adoptPreviousVoucher = 1;
      self->_voucher = 0LL;
      self->_previousVoucher = v3;
    }
  }

- (void)_fireExpirationHandler
{
  v4[5] = *MEMORY[0x1895F89C0];
  BOOL v3 = +[_NSActivityAssertion _expiringAssertionManagementQueue]( &OBJC_CLASS____NSActivityAssertion,  "_expiringAssertionManagementQueue");
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __46___NSActivityAssertion__fireExpirationHandler__block_invoke;
  v4[3] = &unk_189C9A030;
  v4[4] = self;
  dispatch_async(v3, v4);
}

+ (void)_performActivityWithOptions:(unint64_t)a3 reason:(id)a4 usingBlock:(id)a5
{
  if (a4 && _NSIsNSString() && [a4 length])
  {
    id v12 = -[_NSActivityAssertion _initWithActivityOptions:reason:expirationHandler:]( objc_alloc(&OBJC_CLASS____NSActivityAssertion),  "_initWithActivityOptions:reason:expirationHandler:",  a3,  a4,  0LL);
    _CFSetTSD();
    (*((void (**)(id))a5 + 2))(a5);
    _CFSetTSD();
    [v12 _endFromDealloc:0];
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Cannot begin activity without reason string or empty reason string" userInfo:0]);
    +[_NSActivityAssertion _performExpiringActivityWithReason:usingBlock:](v8, v9, v10, v11);
  }

+ (void)_performExpiringActivityWithReason:(id)a3 usingBlock:(id)a4
{
  v8[5] = *MEMORY[0x1895F89C0];
  if (!a3 || !_NSIsNSString() || ![a3 length]) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Cannot begin activity without reason string or empty reason string" userInfo:0]);
  }
  v6 = objc_alloc(&OBJC_CLASS____NSActivityAssertion);
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __70___NSActivityAssertion__performExpiringActivityWithReason_usingBlock___block_invoke;
  v8[3] = &unk_189C9DCE8;
  v8[4] = a4;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __70___NSActivityAssertion__performExpiringActivityWithReason_usingBlock___block_invoke_2;
  v7[3] = &unk_189C9E898;
  v7[4] =  -[_NSActivityAssertion _initWithActivityOptions:reason:expirationHandler:]( v6,  "_initWithActivityOptions:reason:expirationHandler:",  0x1000000000FFLL,  a3,  v8);
  v7[5] = a4;
  dispatch_async( (dispatch_queue_t)+[_NSActivityAssertion _expiringTaskExecutionQueue]( &OBJC_CLASS____NSActivityAssertion,  "_expiringTaskExecutionQueue"),  v7);
}

- (BOOL)_isEnded
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_ended);
  return v2 & 1;
}

@end
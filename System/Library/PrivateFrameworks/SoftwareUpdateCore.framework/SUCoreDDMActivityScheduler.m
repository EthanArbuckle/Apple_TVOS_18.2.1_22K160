@interface SUCoreDDMActivityScheduler
- (BOOL)armActivitySchedulerWithDate:(id)a3;
- (BOOL)armActivitySchedulerWithDate:(id)a3 options:(id)a4;
- (BOOL)isArmed;
- (BOOL)usePCSimpleTimer;
- (BOOL)useXPC;
- (NSDate)fireDate;
- (NSDictionary)options;
- (NSTimer)timer;
- (SUCoreDDMActivityScheduler)initWithDelegate:(id)a3 options:(id)a4;
- (SUCoreDDMActivitySchedulerDelegate)delegate;
- (id)pcTimer;
- (void)_handleTimerFired:(id)a3;
- (void)disarmActivityScheduler;
- (void)setDelegate:(id)a3;
- (void)setFireDate:(id)a3;
- (void)setIsArmed:(BOOL)a3;
- (void)setOptions:(id)a3;
- (void)setPcTimer:(id)a3;
- (void)setTimer:(id)a3;
- (void)setUsePCSimpleTimer:(BOOL)a3;
- (void)setUseXPC:(BOOL)a3;
@end

@implementation SUCoreDDMActivityScheduler

- (SUCoreDDMActivityScheduler)initWithDelegate:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    v15.receiver = self;
    v15.super_class = (Class)&OBJC_CLASS___SUCoreDDMActivityScheduler;
    v9 = -[SUCoreDDMActivityScheduler init](&v15, sel_init);
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_options, a4);
      objc_storeStrong(p_isa + 2, a3);
    }

    self = p_isa;
    v11 = self;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 oslog];
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDDMActivityScheduler initWithDelegate:options:].cold.1();
    }

    v11 = 0LL;
  }

  return v11;
}

- (BOOL)armActivitySchedulerWithDate:(id)a3 options:(id)a4
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x1896127A0] sharedLogger];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 oslog];
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v43 = (const char *)objc_opt_class();
    _os_log_impl(&dword_187A54000, v9, OS_LOG_TYPE_DEFAULT, "[DDM] %@: Arming", buf, 0xCu);
  }

  if (!v6)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 oslog];
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDDMActivityScheduler armActivitySchedulerWithDate:options:].cold.1();
    }
    goto LABEL_9;
  }

  [v6 timeIntervalSinceNow];
  if (v10 < 0.0)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 oslog];
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SUCoreDDMActivityScheduler armActivitySchedulerWithDate:options:].cold.2();
    }
LABEL_9:

    BOOL v14 = 0;
    goto LABEL_28;
  }

  if (v7) {
    -[SUCoreDDMActivityScheduler setOptions:](self, "setOptions:", v7);
  }
  -[SUCoreDDMActivityScheduler setIsArmed:](self, "setIsArmed:", 1LL);
  -[SUCoreDDMActivityScheduler setFireDate:](self, "setFireDate:", v6);
  [MEMORY[0x1896127A0] sharedLogger];
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 oslog];
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = objc_opt_class();
    v18 = -[SUCoreDDMActivityScheduler fireDate](self, "fireDate");
    v19 = -[SUCoreDDMActivityScheduler options](self, "options");
    *(_DWORD *)buf = 138412802;
    v43 = (const char *)v17;
    __int16 v44 = 2112;
    v45 = v18;
    __int16 v46 = 2112;
    v47 = v19;
    _os_log_impl(&dword_187A54000, v16, OS_LOG_TYPE_DEFAULT, "[DDM] %@: Fire date: %@, options: %@", buf, 0x20u);
  }

  if (-[SUCoreDDMActivityScheduler useXPC](self, "useXPC"))
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 oslog];
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "-[SUCoreDDMActivityScheduler armActivitySchedulerWithDate:options:]";
      _os_log_impl(&dword_187A54000, v21, OS_LOG_TYPE_DEFAULT, "[DDM] %s: Using XPC alarm stream", buf, 0xCu);
    }
    v22 = -[SUCoreDDMActivityScheduler fireDate](self, "fireDate");
    [v22 timeIntervalSinceNow];
    double v24 = v23;

    xpc_object_t v25 = xpc_dictionary_create(0LL, 0LL, 0LL);
    time_t v26 = time(0LL);
    xpc_dictionary_set_date(v25, "Date", (unint64_t)((v24 + (double)v26) * 1000000000.0));
    xpc_set_event();
  }

  if (-[SUCoreDDMActivityScheduler usePCSimpleTimer](self, "usePCSimpleTimer")
    && objc_opt_class()
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v27 oslog];
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "-[SUCoreDDMActivityScheduler armActivitySchedulerWithDate:options:]";
      _os_log_impl(&dword_187A54000, v28, OS_LOG_TYPE_DEFAULT, "[DDM] %s: Using PCSimpleTimer", buf, 0xCu);
    }

    id v29 = objc_alloc(MEMORY[0x189611CB0]);
    v30 = -[SUCoreDDMActivityScheduler fireDate](self, "fireDate");
    v31 = (void *)[v29 initWithFireDate:v30 serviceIdentifier:@"com.apple.MobileSoftwareUpdate.DDMActivityScheduler" target:self selector:sel__handleTimerFired_ userInfo:0];
    -[SUCoreDDMActivityScheduler setPcTimer:](self, "setPcTimer:", v31);
    v32 = -[SUCoreDDMActivityScheduler pcTimer](self, "pcTimer");
    [MEMORY[0x189604008] mainRunLoop];
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    [v32 scheduleInRunLoop:v33];
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    [v34 oslog];
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "-[SUCoreDDMActivityScheduler armActivitySchedulerWithDate:options:]";
      _os_log_impl(&dword_187A54000, v35, OS_LOG_TYPE_DEFAULT, "[DDM] %s: Using NSTimer", buf, 0xCu);
    }

    id v36 = objc_alloc(MEMORY[0x189604028]);
    v41[0] = MEMORY[0x1895F87A8];
    v41[1] = 3221225472LL;
    v41[2] = __67__SUCoreDDMActivityScheduler_armActivitySchedulerWithDate_options___block_invoke;
    v41[3] = &unk_18A0EFB50;
    v41[4] = self;
    v37 = (void *)[v36 initWithFireDate:v6 interval:0 repeats:v41 block:0.0];
    -[SUCoreDDMActivityScheduler setTimer:](self, "setTimer:", v37);

    [MEMORY[0x189604008] mainRunLoop];
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[SUCoreDDMActivityScheduler timer](self, "timer");
    [v38 addTimer:v39 forMode:*MEMORY[0x189603A40]];
  }

  BOOL v14 = 1;
LABEL_28:

  return v14;
}

uint64_t __67__SUCoreDDMActivityScheduler_armActivitySchedulerWithDate_options___block_invoke( uint64_t a1,  uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleTimerFired:a2];
}

- (BOOL)armActivitySchedulerWithDate:(id)a3
{
  return -[SUCoreDDMActivityScheduler armActivitySchedulerWithDate:options:]( self,  "armActivitySchedulerWithDate:options:",  a3,  0LL);
}

- (void)_handleTimerFired:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  objc_msgSend(MEMORY[0x1896127A0], "sharedLogger", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 oslog];
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    -[SUCoreDDMActivityScheduler options](self, "options");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDDMActivityScheduler fireDate](self, "fireDate");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    int v11 = 138412802;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    BOOL v14 = v7;
    __int16 v15 = 2112;
    v16 = v8;
    _os_log_impl( &dword_187A54000,  v5,  OS_LOG_TYPE_DEFAULT,  "[DDM] %@: Fired with options: %@, fireDate: %@",  (uint8_t *)&v11,  0x20u);
  }

  -[SUCoreDDMActivityScheduler setIsArmed:](self, "setIsArmed:", 0LL);
  v9 = -[SUCoreDDMActivityScheduler delegate](self, "delegate");
  -[SUCoreDDMActivityScheduler options](self, "options");
  double v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 timeFiredForScheduler:self withOptions:v10 replyBlock:&__block_literal_global];
}

- (void)disarmActivityScheduler
{
  if (-[SUCoreDDMActivityScheduler useXPC](self, "useXPC")) {
    xpc_set_event();
  }
  v3 = -[SUCoreDDMActivityScheduler timer](self, "timer");
  if (v3)
  {
    v4 = -[SUCoreDDMActivityScheduler timer](self, "timer");
    [v4 invalidate];

    -[SUCoreDDMActivityScheduler setTimer:](self, "setTimer:", 0LL);
  }
  v5 = -[SUCoreDDMActivityScheduler pcTimer](self, "pcTimer");
  if (v5 && objc_opt_class())
  {
    char v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[SUCoreDDMActivityScheduler pcTimer](self, "pcTimer");
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 invalidate];

      -[SUCoreDDMActivityScheduler setPcTimer:](self, "setPcTimer:", 0LL);
    }
  }

  else
  {
  }

  -[SUCoreDDMActivityScheduler setIsArmed:](self, "setIsArmed:", 0LL);
  -[SUCoreDDMActivityScheduler setFireDate:](self, "setFireDate:", 0LL);
}

- (SUCoreDDMActivitySchedulerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (void)setFireDate:(id)a3
{
}

- (BOOL)isArmed
{
  return self->_isArmed;
}

- (void)setIsArmed:(BOOL)a3
{
  self->_isArmed = a3;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (BOOL)usePCSimpleTimer
{
  return self->_usePCSimpleTimer;
}

- (void)setUsePCSimpleTimer:(BOOL)a3
{
  self->_usePCSimpleTimer = a3;
}

- (BOOL)useXPC
{
  return self->_useXPC;
}

- (void)setUseXPC:(BOOL)a3
{
  self->_useXPC = a3;
}

- (NSTimer)timer
{
  return (NSTimer *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setTimer:(id)a3
{
}

- (id)pcTimer
{
  return objc_getProperty(self, a2, 48LL, 1);
}

- (void)setPcTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithDelegate:options:.cold.1()
{
}

- (void)armActivitySchedulerWithDate:options:.cold.1()
{
}

- (void)armActivitySchedulerWithDate:options:.cold.2()
{
}

@end
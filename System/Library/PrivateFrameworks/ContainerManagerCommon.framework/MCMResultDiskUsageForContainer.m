@interface MCMResultDiskUsageForContainer
+ (id)_reportingWorkloop;
- (BOOL)encodeResultOntoReply:(id)a3;
- (MCMResultDiskUsageForContainer)initWithDiskUsageBytes:(unint64_t)a3 descendants:(unint64_t)a4 containerClass:(unint64_t)a5 personaType:(int)a6;
- (int)personaType;
- (unint64_t)_roundToTwoSignificantDigitsWithNumber:(unint64_t)a3;
- (unint64_t)containerClass;
- (unint64_t)descendants;
- (unint64_t)diskUsageBytes;
- (void)_report;
- (void)setContainerClass:(unint64_t)a3;
- (void)setDescendants:(unint64_t)a3;
- (void)setDiskUsageBytes:(unint64_t)a3;
- (void)setPersonaType:(int)a3;
@end

@implementation MCMResultDiskUsageForContainer

- (MCMResultDiskUsageForContainer)initWithDiskUsageBytes:(unint64_t)a3 descendants:(unint64_t)a4 containerClass:(unint64_t)a5 personaType:(int)a6
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MCMResultDiskUsageForContainer;
  result = -[MCMResultBase init](&v11, sel_init);
  if (result)
  {
    result->_diskUsageBytes = a3;
    result->_descendants = a4;
    result->_containerClass = a5;
    result->_personaType = a6;
  }

  return result;
}

- (BOOL)encodeResultOntoReply:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MCMResultDiskUsageForContainer;
  BOOL v5 = -[MCMResultBase encodeResultOntoReply:](&v8, sel_encodeResultOntoReply_, v4);
  if (v5)
  {
    v6 = -[MCMResultBase error](self, "error");
    if (!v6) {
      xpc_dictionary_set_uint64( v4,  "ReplyDiskUsage",  -[MCMResultDiskUsageForContainer diskUsageBytes](self, "diskUsageBytes"));
    }
  }

  return v5;
}

- (void)_report
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  unint64_t v3 = -[MCMResultDiskUsageForContainer _roundToTwoSignificantDigitsWithNumber:]( self,  "_roundToTwoSignificantDigitsWithNumber:",  self->_descendants);
  unint64_t v4 = -[MCMResultDiskUsageForContainer _roundToTwoSignificantDigitsWithNumber:]( self,  "_roundToTwoSignificantDigitsWithNumber:",  self->_diskUsageBytes);
  int personaType = self->_personaType;
  unint64_t containerClass = self->_containerClass;
  container_log_handle_for_category();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, self);

  [(id)objc_opt_class() _reportingWorkloop];
  uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __41__MCMResultDiskUsageForContainer__report__block_invoke;
  v10[3] = &__block_descriptor_68_e5_v8__0l;
  int v11 = personaType;
  v10[4] = containerClass;
  v10[5] = v8;
  v10[6] = v3;
  v10[7] = v4;
  dispatch_async(v9, v10);
}

- (unint64_t)_roundToTwoSignificantDigitsWithNumber:(unint64_t)a3
{
  double v3 = (double)a3;
  double v4 = log10((double)a3);
  double v5 = __exp10(ceil(v4) + -2.0);
  return (unint64_t)(v5 * floor(v3 / v5 + 0.5));
}

- (unint64_t)diskUsageBytes
{
  return self->_diskUsageBytes;
}

- (void)setDiskUsageBytes:(unint64_t)a3
{
  self->_diskUsageBytes = a3;
}

- (unint64_t)descendants
{
  return self->_descendants;
}

- (void)setDescendants:(unint64_t)a3
{
  self->_descendants = a3;
}

- (unint64_t)containerClass
{
  return self->_containerClass;
}

- (void)setContainerClass:(unint64_t)a3
{
  self->_unint64_t containerClass = a3;
}

- (int)personaType
{
  return self->_personaType;
}

- (void)setPersonaType:(int)a3
{
  self->_int personaType = a3;
}

void __41__MCMResultDiskUsageForContainer__report__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 == 7)
  {
    int v10 = *(_DWORD *)(a1 + 64);
    if (v10 == 1)
    {
      container_log_handle_for_category();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      double v5 = v21;
      os_signpost_id_t v6 = *(void *)(a1 + 40);
      if (v6 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v21)) {
        goto LABEL_29;
      }
      uint64_t v22 = *(void *)(a1 + 48);
      uint64_t v23 = *(void *)(a1 + 56);
      int v27 = 134349312;
      uint64_t v28 = v22;
      __int16 v29 = 2050;
      uint64_t v30 = v23;
      uint64_t v9 = "DiskUsage_Managed_appGroup";
    }

    else
    {
      if (v10) {
        return;
      }
      container_log_handle_for_category();
      int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      double v5 = v11;
      os_signpost_id_t v6 = *(void *)(a1 + 40);
      if (v6 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v11)) {
        goto LABEL_29;
      }
      uint64_t v12 = *(void *)(a1 + 48);
      uint64_t v13 = *(void *)(a1 + 56);
      int v27 = 134349312;
      uint64_t v28 = v12;
      __int16 v29 = 2050;
      uint64_t v30 = v13;
      uint64_t v9 = "DiskUsage_appGroup";
    }

    goto LABEL_28;
  }

  if (v2 != 4)
  {
    if (v2 != 2) {
      return;
    }
    int v3 = *(_DWORD *)(a1 + 64);
    if (v3 == 1)
    {
      container_log_handle_for_category();
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      double v5 = v18;
      os_signpost_id_t v6 = *(void *)(a1 + 40);
      if (v6 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v18)) {
        goto LABEL_29;
      }
      uint64_t v19 = *(void *)(a1 + 48);
      uint64_t v20 = *(void *)(a1 + 56);
      int v27 = 134349312;
      uint64_t v28 = v19;
      __int16 v29 = 2050;
      uint64_t v30 = v20;
      uint64_t v9 = "DiskUsage_Managed_appData";
    }

    else
    {
      if (v3) {
        return;
      }
      container_log_handle_for_category();
      double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      double v5 = v4;
      os_signpost_id_t v6 = *(void *)(a1 + 40);
      if (v6 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v4)) {
        goto LABEL_29;
      }
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 56);
      int v27 = 134349312;
      uint64_t v28 = v7;
      __int16 v29 = 2050;
      uint64_t v30 = v8;
      uint64_t v9 = "DiskUsage_appData";
    }

    goto LABEL_28;
  }

  int v14 = *(_DWORD *)(a1 + 64);
  if (v14 == 1)
  {
    container_log_handle_for_category();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    double v5 = v24;
    os_signpost_id_t v6 = *(void *)(a1 + 40);
    if (v6 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v24)) {
      goto LABEL_29;
    }
    uint64_t v25 = *(void *)(a1 + 48);
    uint64_t v26 = *(void *)(a1 + 56);
    int v27 = 134349312;
    uint64_t v28 = v25;
    __int16 v29 = 2050;
    uint64_t v30 = v26;
    uint64_t v9 = "DiskUsage_Managed_pluginData";
    goto LABEL_28;
  }

  if (v14) {
    return;
  }
  container_log_handle_for_category();
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  double v5 = v15;
  os_signpost_id_t v6 = *(void *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    uint64_t v16 = *(void *)(a1 + 48);
    uint64_t v17 = *(void *)(a1 + 56);
    int v27 = 134349312;
    uint64_t v28 = v16;
    __int16 v29 = 2050;
    uint64_t v30 = v17;
    uint64_t v9 = "DiskUsage_pluginData";
LABEL_28:
    _os_signpost_emit_with_name_impl( &dword_188846000,  v5,  OS_SIGNPOST_EVENT,  v6,  v9,  " enableTelemetry=YES  descendants=%{public, signpost.telemetry:number1}llu bytes=%{public, signpost.telemetry:number2}llu",  (uint8_t *)&v27,  0x16u);
  }

+ (id)_reportingWorkloop
{
  if (_reportingWorkloop_onceToken != -1) {
    dispatch_once(&_reportingWorkloop_onceToken, &__block_literal_global_12910);
  }
  return (id)_reportingWorkloop_workloop;
}

void __52__MCMResultDiskUsageForContainer__reportingWorkloop__block_invoke()
{
  dispatch_workloop_t v0 = dispatch_workloop_create("com.apple.containermanagerd.disk-usage-reporting");
  v1 = (void *)_reportingWorkloop_workloop;
  _reportingWorkloop_workloop = (uint64_t)v0;
}

@end
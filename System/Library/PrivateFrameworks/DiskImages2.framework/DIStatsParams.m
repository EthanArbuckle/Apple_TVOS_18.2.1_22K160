@interface DIStatsParams
+ (BOOL)supportsSecureCoding;
- (DIStatsParams)initWithCoder:(id)a3;
- (DIStatsParams)initWithURL:(id)a3 instanceId:(id)a4 error:(id *)a5;
- (NSUUID)instanceID;
- (NSUUID)statInstanceID;
- (id)statsWithError:(id *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DIStatsParams

- (DIStatsParams)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DIStatsParams;
  v5 = -[DIBaseParams initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"statInstanceID"];
    statInstanceID = v5->_statInstanceID;
    v5->_statInstanceID = (NSUUID *)v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DIStatsParams;
  id v4 = a3;
  -[DIBaseParams encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_statInstanceID, @"statInstanceID", v5.receiver, v5.super_class);
}

- (DIStatsParams)initWithURL:(id)a3 instanceId:(id)a4 error:(id *)a5
{
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___DIStatsParams;
  v10 = -[DIBaseParams initWithURL:error:](&v14, sel_initWithURL_error_, a3, a5);
  p_isa = (id *)&v10->super.super.isa;
  if (v10)
  {
    if (!-[DIBaseParams openExistingImageWithFlags:error:](v10, "openExistingImageWithFlags:error:", 0LL, a5))
    {
      v12 = 0LL;
      goto LABEL_6;
    }

    objc_storeStrong(p_isa + 7, a4);
  }

  v12 = p_isa;
LABEL_6:

  return v12;
}

- (id)statsWithError:(id *)a3
{
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  v20 = objc_alloc_init(&OBJC_CLASS___DIClient2Controller_XPCHandler);
  if ([(id)v16[5] connectWithError:a3])
  {
    uint64_t v9 = 0LL;
    v10 = &v9;
    uint64_t v11 = 0x3032000000LL;
    v12 = __Block_byref_object_copy__2;
    v13 = __Block_byref_object_dispose__2;
    id v14 = 0LL;
    [(id)v16[5] remoteProxy];
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __32__DIStatsParams_statsWithError___block_invoke;
    v8[3] = &unk_18A1CA360;
    v8[4] = &v9;
    v8[5] = &v15;
    [v5 retrieveStatsWithParams:self reply:v8];

    if ([(id)v16[5] completeCommandWithError:a3]) {
      id v6 = (id)v10[5];
    }
    else {
      id v6 = 0LL;
    }
    _Block_object_dispose(&v9, 8);
  }

  else
  {
    id v6 = 0LL;
  }

  _Block_object_dispose(&v15, 8);

  return v6;
}

void __32__DIStatsParams_statsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  if (!v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) signalCommandCompletedWithXpcError:v6];
}

- (NSUUID)instanceID
{
  statInstanceID = self->_statInstanceID;
  if (statInstanceID) {
    return statInstanceID;
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DIStatsParams;
  -[DIBaseParams instanceID](&v4, sel_instanceID);
  return (NSUUID *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSUUID)statInstanceID
{
  return self->_statInstanceID;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
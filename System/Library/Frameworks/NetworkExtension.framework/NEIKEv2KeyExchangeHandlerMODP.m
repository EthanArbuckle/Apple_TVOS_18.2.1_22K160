@interface NEIKEv2KeyExchangeHandlerMODP
- (BOOL)processPeerPayload:(id)a3;
- (void)dealloc;
@end

@implementation NEIKEv2KeyExchangeHandlerMODP

- (BOOL)processPeerPayload:(id)a3
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  ne_log_obj();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    if (self) {
      unint64_t method = self->super._method;
    }
    else {
      unint64_t method = 0LL;
    }
    *(_DWORD *)buf = 134217984;
    v26 = (const char *)method;
    _os_log_debug_impl(&dword_1876B1000, v5, OS_LOG_TYPE_DEBUG, "Compute MODP DH %zu result", buf, 0xCu);
  }

  if (!self || !self->_context)
  {
    ne_log_obj();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136315138;
    v26 = "-[NEIKEv2KeyExchangeHandlerMODP processPeerPayload:]";
    v18 = "%s called with null self.context";
    goto LABEL_23;
  }

  if (!v4)
  {
    ne_log_obj();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136315138;
    v26 = "-[NEIKEv2KeyExchangeHandlerMODP processPeerPayload:]";
    v18 = "%s called with null peerPayload";
LABEL_23:
    v19 = v9;
    uint32_t v20 = 12;
    goto LABEL_18;
  }

  uint64_t v6 = [v4 length];
  if (v6 != -[NSData length](self->_prime, "length"))
  {
    ne_log_obj();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
LABEL_12:
      BOOL v11 = 0;
      goto LABEL_13;
    }

    unint64_t v15 = self->super._method;
    uint64_t v16 = [v4 length];
    NSUInteger v17 = -[NSData length](self->_prime, "length");
    *(_DWORD *)buf = 134218496;
    v26 = (const char *)v15;
    __int16 v27 = 2048;
    uint64_t v28 = v16;
    __int16 v29 = 2048;
    NSUInteger v30 = v17;
    v18 = "Peer MODP DH %zu key length (%zu) is not equal to prime length (%zu)";
    v19 = v9;
    uint32_t v20 = 32;
LABEL_18:
    _os_log_fault_impl(&dword_1876B1000, v19, OS_LOG_TYPE_FAULT, v18, buf, v20);
    goto LABEL_12;
  }

  CFIndex v7 = -[NSData length](self->_prime, "length");
  v8 = +[NSMutableData mutableSensitiveDataPrefilledWithMaxCapacity:](MEMORY[0x189603FB8], v7);
  if (!v8)
  {
    ne_log_obj();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      v26 = (const char *)v7;
      _os_log_fault_impl( &dword_1876B1000,  v22,  OS_LOG_TYPE_FAULT,  "[NEMutableSensitiveData mutableSensitiveDataPrefilledWithMaxCapacity:%zu] failed",  buf,  0xCu);
    }

    v9 = 0LL;
    goto LABEL_12;
  }

  v9 = v8;
  [v4 bytes];
  [v4 length];
  -[os_log_s mutableBytes](v9, "mutableBytes");
  int v10 = SecDHComputeKey();
  BOOL v11 = v10 == 0;
  if (v10)
  {
    int v23 = v10;
    ne_log_obj();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      unint64_t v24 = self->super._method;
      *(_DWORD *)buf = 134218240;
      v26 = (const char *)v24;
      __int16 v27 = 1024;
      LODWORD(v28) = v23;
      _os_log_error_impl( &dword_1876B1000,  v12,  OS_LOG_TYPE_ERROR,  "Failed to compute MODP DH %zu value: %d",  buf,  0x12u);
    }
  }

  else
  {
    objc_storeStrong((id *)&self->super._sharedSecret, v9);
    ne_log_obj();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v21 = self->super._method;
      *(_DWORD *)buf = 134217984;
      v26 = (const char *)v21;
      _os_log_debug_impl(&dword_1876B1000, v12, OS_LOG_TYPE_DEBUG, "Computed MODP DH %zu result", buf, 0xCu);
    }
  }

LABEL_13:
  return v11;
}

- (void)dealloc
{
  if (self && self->_context)
  {
    SecDHDestroy();
    self->_context = 0LL;
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NEIKEv2KeyExchangeHandlerMODP;
  -[NEIKEv2KeyExchangeHandlerMODP dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
}

@end
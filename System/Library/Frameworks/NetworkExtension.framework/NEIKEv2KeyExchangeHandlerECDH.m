@interface NEIKEv2KeyExchangeHandlerECDH
- (BOOL)processPeerPayload:(id)a3;
@end

@implementation NEIKEv2KeyExchangeHandlerECDH

- (BOOL)processPeerPayload:(id)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
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
    v20 = (const char *)method;
    _os_log_debug_impl(&dword_1876B1000, v5, OS_LOG_TYPE_DEBUG, "Compute ECDH %zu shared secret", buf, 0xCu);
  }

  if (v4)
  {
    if (self) {
      ecdhHandler = self->_ecdhHandler;
    }
    else {
      ecdhHandler = 0LL;
    }
    id v18 = 0LL;
    v7 = ecdhHandler;
    BOOL v8 = -[NEIKEv2CryptoKitECDH processPeerPayload:error:](v7, "processPeerPayload:error:", v4, &v18);
    v9 = (os_log_s *)v18;

    if (v8)
    {
      if (self) {
        v10 = self->_ecdhHandler;
      }
      else {
        v10 = 0LL;
      }
      v11 = v10;
      v12 = -[NEIKEv2CryptoKitECDH sharedSecret](v11, "sharedSecret");
      -[NEIKEv2KeyExchangeHandler setSharedSecret:]((uint64_t)self, v12);

      ne_log_obj();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        if (self) {
          unint64_t v14 = self->super._method;
        }
        else {
          unint64_t v14 = 0LL;
        }
        *(_DWORD *)buf = 134217984;
        v20 = (const char *)v14;
        _os_log_debug_impl(&dword_1876B1000, v13, OS_LOG_TYPE_DEBUG, "Computed ECDH %zu shared secret", buf, 0xCu);
      }
    }

    else
    {
      ne_log_obj();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        if (self) {
          unint64_t v17 = self->super._method;
        }
        else {
          unint64_t v17 = 0LL;
        }
        *(_DWORD *)buf = 134218242;
        v20 = (const char *)v17;
        __int16 v21 = 2112;
        v22 = v9;
        _os_log_fault_impl( &dword_1876B1000,  v13,  OS_LOG_TYPE_FAULT,  "Failed to compute ECDH %zu shared secret: %@",  buf,  0x16u);
      }
    }
  }

  else
  {
    ne_log_obj();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[NEIKEv2KeyExchangeHandlerECDH processPeerPayload:]";
      _os_log_fault_impl(&dword_1876B1000, v9, OS_LOG_TYPE_FAULT, "%s called with null peerPayload", buf, 0xCu);
    }

    BOOL v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end
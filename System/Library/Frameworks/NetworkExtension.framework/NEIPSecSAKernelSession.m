@interface NEIPSecSAKernelSession
- (BOOL)addLarvalSA:(id)a3;
- (BOOL)addSA:(id)a3;
- (BOOL)migrateSA:(id)a3;
- (BOOL)removeSA:(id)a3;
- (BOOL)updateSA:(id)a3;
- (NEIPSecSAKernelSession)initWithName:(id)a3 delegate:(id)a4;
- (NEIPSecSAKernelSession)initWithName:(id)a3 delegate:(id)a4 pfkeySocket:(int)a5;
- (id)description;
- (void)dealloc;
- (void)invalidate;
- (void)removeAllSAs;
- (void)setDelegateQueue:(id)a3;
- (void)startBlackholeDetection:(unsigned int)a3 incomingSA:(id)a4 outgoingSA:(id)a5;
- (void)startIdleTimeout:(unsigned int)a3 incomingSA:(id)a4 outgoingSA:(id)a5;
@end

@implementation NEIPSecSAKernelSession

- (NEIPSecSAKernelSession)initWithName:(id)a3 delegate:(id)a4 pfkeySocket:(int)a5
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___NEIPSecSAKernelSession;
  v9 = -[NEIPSecSASession initWithName:delegate:](&v15, sel_initWithName_delegate_, v8, a4);
  if (!v9)
  {
    ne_log_obj();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1876B1000, v14, OS_LOG_TYPE_FAULT, "[super initWithName:delegate] failed", buf, 2u);
    }

    goto LABEL_7;
  }

  v10 = (NEIPSecDB_s *)NEIPSecDBCreateSessionWithSocket( *MEMORY[0x189604DB0],  v8,  (uint64_t)NEIPSecSAKernelSessionReceiveMessage,  (uint64_t)v9,  a5);
  v9->_internalSession = v10;
  if (!v10)
  {
    ne_log_obj();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v8;
      __int16 v18 = 1024;
      int v19 = a5;
      _os_log_fault_impl( &dword_1876B1000,  v12,  OS_LOG_TYPE_FAULT,  "NEIPSecDBCreateSessionWithSocket(%@, %d) failed",  buf,  0x12u);
    }

LABEL_7:
    v11 = 0LL;
    goto LABEL_8;
  }

  v11 = v9;
LABEL_8:

  return v11;
}

- (NEIPSecSAKernelSession)initWithName:(id)a3 delegate:(id)a4
{
  return -[NEIPSecSAKernelSession initWithName:delegate:pfkeySocket:]( self,  "initWithName:delegate:pfkeySocket:",  a3,  a4,  0xFFFFFFFFLL);
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  if (self) {
    unint64_t uniqueIndex = self->super._uniqueIndex;
  }
  else {
    unint64_t uniqueIndex = 0LL;
  }
  v5 = -[NEIPSecSASession name](self, "name");
  v6 = (void *)[v3 initWithFormat:@"KernelSASession[%llu, %@]", uniqueIndex, v5];

  return v6;
}

- (void)setDelegateQueue:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NEIPSecSAKernelSession;
  v4 = (dispatch_object_s *)a3;
  -[NEIPSecSASession setDelegateQueue:](&v5, sel_setDelegateQueue_, v4);
  NEIPSecDBSetDispatchQueue((uint64_t)self->_internalSession, v4);
}

- (void)removeAllSAs
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NEIPSecSAKernelSession;
  -[NEIPSecSASession removeAllSAs](&v4, sel_removeAllSAs);
  internalSession = self->_internalSession;
}

- (void)invalidate
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NEIPSecSAKernelSession;
  -[NEIPSecSASession invalidate](&v5, sel_invalidate);
  internalSession = self->_internalSession;
  if (internalSession)
  {
    NEIPSecDBInvalidateSession((uint64_t)internalSession);
    objc_super v4 = self->_internalSession;
    if (v4)
    {
      CFRelease(v4);
      self->_internalSession = 0LL;
    }
  }

- (BOOL)addLarvalSA:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  objc_super v4 = a3;
  if ([v4 direction] != 2)
  {
    ne_log_obj();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = (NEIPSecSAKernelSession *)"-[NEIPSecSAKernelSession addLarvalSA:]";
      _os_log_fault_impl( &dword_1876B1000,  v13,  OS_LOG_TYPE_FAULT,  "%s called with null (securityAssociation.direction == NEIPSecSADirectionInbound)",  buf,  0xCu);
    }

    goto LABEL_10;
  }

  unsigned int v14 = 0;
  internalSession = self->_internalSession;
  id v6 = -[NEIPSecSA createDictionary](v4);
  int v7 = NEIPSecDBAddLarvalSA((uint64_t)internalSession, v6, &v14);
  if (!v4 || (v4[12] = v7, v4[5] = bswap32(v14), !v7))
  {
    ne_log_large_obj();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v16 = self;
      __int16 v17 = 2112;
      __int16 v18 = v4;
      _os_log_error_impl(&dword_1876B1000, v11, OS_LOG_TYPE_ERROR, "%@ Failed to add larval SA %@", buf, 0x16u);
    }

LABEL_10:
    BOOL v9 = 0;
    goto LABEL_11;
  }

  ne_log_large_obj();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v16 = self;
    __int16 v17 = 2112;
    __int16 v18 = v4;
    _os_log_impl(&dword_1876B1000, v8, OS_LOG_TYPE_INFO, "%@ Added larval SA %@", buf, 0x16u);
  }

  BOOL v9 = 1;
  objc_msgSend(objc_getProperty(self, v10, 32, 1), "addObject:", v4);
LABEL_11:

  return v9;
}

- (BOOL)updateSA:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  objc_super v4 = a3;
  if ([v4 direction] != 2)
  {
    ne_log_obj();
    SEL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v17 = (NEIPSecSAKernelSession *)"-[NEIPSecSAKernelSession updateSA:]";
      _os_log_fault_impl( &dword_1876B1000,  v10,  OS_LOG_TYPE_FAULT,  "%s called with null (securityAssociation.direction == NEIPSecSADirectionInbound)",  buf,  0xCu);
    }

    goto LABEL_11;
  }

  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___NEIPSecSAKernelSession;
  if (!-[NEIPSecSASession updateSA:](&v15, sel_updateSA_, v4))
  {
    ne_log_large_obj();
    SEL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_11:
      BOOL v11 = 0;
      goto LABEL_12;
    }

    *(_DWORD *)buf = 138412546;
    __int16 v17 = self;
    __int16 v18 = 2112;
    uint64_t v19 = v4;
    v12 = "%@ Super failed to update SA %@";
LABEL_14:
    _os_log_error_impl(&dword_1876B1000, v10, OS_LOG_TYPE_ERROR, v12, buf, 0x16u);
    goto LABEL_11;
  }

  internalSession = self->_internalSession;
  if (v4)
  {
    int v6 = v4[12];
    id v7 = -[NEIPSecSA createDictionary](v4);
  }

  else
  {
    id v14 = 0LL;
    id v7 = 0LL;
    int v6 = 0;
  }

  int v8 = NEIPSecDBUpdateSA((uint64_t)internalSession, v6, v7);
  ne_log_large_obj();
  BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  SEL v10 = v9;
  if (!v8)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 138412546;
    __int16 v17 = self;
    __int16 v18 = 2112;
    uint64_t v19 = v4;
    v12 = "%@ Failed to update SA %@";
    goto LABEL_14;
  }

  BOOL v11 = 1;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    __int16 v17 = self;
    __int16 v18 = 2112;
    uint64_t v19 = v4;
    _os_log_impl(&dword_1876B1000, v10, OS_LOG_TYPE_INFO, "%@ Updated SA %@", buf, 0x16u);
  }

- (BOOL)addSA:(id)a3
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  objc_super v4 = a3;
  if ([v4 direction] != 1)
  {
    if ([v4 direction] != 2)
    {
      ne_log_large_obj();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
      {
LABEL_27:

        goto LABEL_28;
      }

      *(_DWORD *)buf = 138412546;
      v34 = self;
      __int16 v35 = 2112;
      *(void *)v36 = v4;
      v23 = "%@ Invalid SA direction for %@";
LABEL_38:
      _os_log_error_impl(&dword_1876B1000, (os_log_t)v22, OS_LOG_TYPE_ERROR, v23, buf, 0x16u);
      goto LABEL_27;
    }

    v31.receiver = self;
    v31.super_class = (Class)&OBJC_CLASS___NEIPSecSAKernelSession;
    if (!-[NEIPSecSASession addSA:](&v31, sel_addSA_, v4))
    {
      ne_log_large_obj();
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v34 = self;
        __int16 v35 = 2112;
        *(void *)v36 = v4;
        _os_log_error_impl(&dword_1876B1000, v24, OS_LOG_TYPE_ERROR, "%@ Super failed to add SA %@", buf, 0x16u);
      }

      ne_log_obj();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        goto LABEL_25;
      }
      *(_WORD *)buf = 0;
      goto LABEL_36;
    }

    unsigned int v30 = 0;
    internalSession = self->_internalSession;
    id v11 = -[NEIPSecSA createDictionary](v4);
    int v12 = NEIPSecDBAddLarvalSA((uint64_t)internalSession, v11, &v30);
    if (v4 && (v4[12] = v12) != 0 && (int v13 = [v4 spi], v13 == bswap32(v30)))
    {
      id v14 = self->_internalSession;
      int v15 = v4[12];
      id v16 = -[NEIPSecSA createDictionary](v4);
      int v17 = NEIPSecDBUpdateSA((uint64_t)v14, v15, v16);
      ne_log_large_obj();
      __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = v18;
      if (v17)
      {
        BOOL v9 = 1;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v34 = self;
          __int16 v35 = 2112;
          *(void *)v36 = v4;
          _os_log_impl(&dword_1876B1000, v19, OS_LOG_TYPE_INFO, "%@ Updated SA %@", buf, 0x16u);
        }

        goto LABEL_32;
      }

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v34 = self;
        __int16 v35 = 2112;
        *(void *)v36 = v4;
        v26 = "%@ Failed to update SA %@";
        v27 = v19;
        uint32_t v28 = 22;
LABEL_40:
        _os_log_error_impl(&dword_1876B1000, v27, OS_LOG_TYPE_ERROR, v26, buf, v28);
      }
    }

    else
    {
      ne_log_large_obj();
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        int v29 = [v4 spi];
        *(_DWORD *)buf = 138413058;
        v34 = self;
        __int16 v35 = 1024;
        *(_DWORD *)v36 = v29;
        *(_WORD *)&v36[4] = 1024;
        *(_DWORD *)&v36[6] = bswap32(v30);
        __int16 v37 = 2112;
        v38 = v4;
        v26 = "%@ Failed to allocate requested SPI %u (got %u) fo SA %@";
        v27 = v19;
        uint32_t v28 = 34;
        goto LABEL_40;
      }
    }

    BOOL v9 = 0;
LABEL_32:

    goto LABEL_29;
  }

  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___NEIPSecSAKernelSession;
  if (!-[NEIPSecSASession addSA:](&v32, sel_addSA_, v4))
  {
    ne_log_large_obj();
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v34 = self;
      __int16 v35 = 2112;
      *(void *)v36 = v4;
      _os_log_error_impl(&dword_1876B1000, v20, OS_LOG_TYPE_ERROR, "%@ Super failed to add SA %@", buf, 0x16u);
    }

    ne_log_obj();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      goto LABEL_25;
    }
    *(_WORD *)buf = 0;
LABEL_36:
    _os_log_fault_impl(&dword_1876B1000, v21, OS_LOG_TYPE_FAULT, "Super failed to add SA", buf, 2u);
LABEL_25:

LABEL_28:
    BOOL v9 = 0;
    goto LABEL_29;
  }

  objc_super v5 = self->_internalSession;
  id v6 = -[NEIPSecSA createDictionary](v4);
  int v7 = NEIPSecDBAddSA((uint64_t)v5, v6);
  if (!v4 || (v4[12] = v7) == 0)
  {
    ne_log_large_obj();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_DWORD *)buf = 138412546;
    v34 = self;
    __int16 v35 = 2112;
    *(void *)v36 = v4;
    v23 = "%@ Failed to add SA %@";
    goto LABEL_38;
  }

  ne_log_large_obj();
  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v34 = self;
    __int16 v35 = 2112;
    *(void *)v36 = v4;
    _os_log_impl(&dword_1876B1000, v8, OS_LOG_TYPE_INFO, "%@ Added SA %@", buf, 0x16u);
  }

  BOOL v9 = 1;
LABEL_29:

  return v9;
}

- (BOOL)removeSA:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  objc_super v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NEIPSecSAKernelSession;
  if (!-[NEIPSecSASession removeSA:](&v12, sel_removeSA_, v4))
  {
    ne_log_large_obj();
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
LABEL_10:
      BOOL v9 = 0;
      goto LABEL_11;
    }

    *(_DWORD *)buf = 138412546;
    id v14 = self;
    __int16 v15 = 2112;
    id v16 = v4;
    SEL v10 = "%@ Super failed to remove SA %@";
LABEL_13:
    _os_log_error_impl(&dword_1876B1000, v8, OS_LOG_TYPE_ERROR, v10, buf, 0x16u);
    goto LABEL_10;
  }

  if (v4) {
    int v5 = v4[12];
  }
  else {
    int v5 = 0;
  }
  int v6 = NEIPSecDBDeleteSA((uint64_t)self->_internalSession, v5);
  ne_log_large_obj();
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  int v8 = v7;
  if (!v6)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 138412546;
    id v14 = self;
    __int16 v15 = 2112;
    id v16 = v4;
    SEL v10 = "%@ Failed to remove SA %@";
    goto LABEL_13;
  }

  BOOL v9 = 1;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = self;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_1876B1000, v8, OS_LOG_TYPE_INFO, "%@ Removed SA %@", buf, 0x16u);
  }

- (BOOL)migrateSA:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  objc_super v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___NEIPSecSAKernelSession;
  if (!-[NEIPSecSASession migrateSA:](&v15, sel_migrateSA_, v4))
  {
    ne_log_large_obj();
    objc_super v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v17 = self;
      __int16 v18 = 2112;
      uint64_t v19 = v4;
      _os_log_error_impl(&dword_1876B1000, v12, OS_LOG_TYPE_ERROR, "%@ Super failed to migrate SA %@", buf, 0x16u);
    }

    ne_log_obj();
    SEL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1876B1000, v10, OS_LOG_TYPE_FAULT, "Super failed to migrate SA", buf, 2u);
    }

    goto LABEL_13;
  }

  internalSession = self->_internalSession;
  if (v4)
  {
    int v6 = v4[12];
    id v7 = -[NEIPSecSA createDictionary](v4);
  }

  else
  {
    id v14 = 0LL;
    id v7 = 0LL;
    int v6 = 0;
  }

  int v8 = NEIPSecDBMigrateSA((uint64_t)internalSession, v6, v7);
  ne_log_large_obj();
  BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  SEL v10 = v9;
  if (!v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v17 = self;
      __int16 v18 = 2112;
      uint64_t v19 = v4;
      _os_log_error_impl(&dword_1876B1000, v10, OS_LOG_TYPE_ERROR, "%@ Failed to migrate SA %@", buf, 0x16u);
    }

- (void)startIdleTimeout:(unsigned int)a3 incomingSA:(id)a4 outgoingSA:(id)a5
{
  int v8 = (int *)a5;
  if (a4) {
    int v9 = *((_DWORD *)a4 + 12);
  }
  else {
    int v9 = 0;
  }
  BOOL v11 = v8;
  if (v8) {
    int v10 = v8[12];
  }
  else {
    int v10 = 0;
  }
  NEIPSecDBCreateStatsTimer((uint64_t)self->_internalSession, 0, a3, v9, v10);
}

- (void)startBlackholeDetection:(unsigned int)a3 incomingSA:(id)a4 outgoingSA:(id)a5
{
  int v8 = (int *)a5;
  if (a4) {
    int v9 = *((_DWORD *)a4 + 12);
  }
  else {
    int v9 = 0;
  }
  BOOL v11 = v8;
  if (v8) {
    int v10 = v8[12];
  }
  else {
    int v10 = 0;
  }
  NEIPSecDBCreateStatsTimer((uint64_t)self->_internalSession, 1, a3, v9, v10);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NEIPSecSAKernelSession;
  -[NEIPSecSASession dealloc](&v3, sel_dealloc);
}

@end
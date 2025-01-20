@interface NEIPSecSASession
- (BOOL)addLarvalSA:(id)a3;
- (BOOL)addSA:(id)a3;
- (BOOL)migrateSA:(id)a3;
- (BOOL)removeSA:(id)a3;
- (BOOL)updateSA:(id)a3;
- (NEIPSecSASession)initWithName:(id)a3 delegate:(id)a4;
- (NEIPSecSASessionDelegate)delegate;
- (NSArray)securityAssociations;
- (NSString)name;
- (OS_dispatch_queue)delegateQueue;
- (id)copyEmptySASession;
- (id)description;
- (void)dealloc;
- (void)removeAllSAs;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
@end

@implementation NEIPSecSASession

- (NEIPSecSASession)initWithName:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___NEIPSecSASession;
  v8 = -[NEIPSecSASession init](&v20, sel_init);
  v10 = v8;
  if (v8)
  {
    do
      unint64_t v11 = __ldxr(&sNEIPSecSASessionIndex);
    while (__stxr(v11 + 1, &sNEIPSecSASessionIndex));
    v8->_uniqueIndex = v11;
    objc_setProperty_atomic(v8, v9, v6, 8LL);
    -[NEIPSecSASession setDelegate:](v10, "setDelegate:", v7);
    id v12 = objc_alloc_init(MEMORY[0x189603FA8]);
    objc_setProperty_atomic(v10, v13, v12, 24LL);

    id v14 = objc_alloc_init(MEMORY[0x189603FA8]);
    objc_setProperty_atomic(v10, v15, v14, 32LL);

    v16 = v10;
  }

  else
  {
    ne_log_obj();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_fault_impl(&dword_1876B1000, v18, OS_LOG_TYPE_FAULT, "[super init] failed", v19, 2u);
    }
  }

  return v10;
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  if (self) {
    unint64_t uniqueIndex = self->_uniqueIndex;
  }
  else {
    unint64_t uniqueIndex = 0LL;
  }
  v5 = -[NEIPSecSASession name](self, "name");
  id v6 = (void *)[v3 initWithFormat:@"SASession[%llu, %@]", uniqueIndex, v5];

  return v6;
}

- (NSArray)securityAssociations
{
  if (self) {
    self = (NEIPSecSASession *)objc_getProperty(self, a2, 24LL, 1);
  }
  return (NSArray *)self;
}

- (id)copyEmptySASession
{
  id v3 = objc_alloc((Class)objc_opt_class());
  v4 = -[NEIPSecSASession name](self, "name");
  v5 = -[NEIPSecSASession delegate](self, "delegate");
  id v6 = (void *)[v3 initWithName:v4 delegate:v5];

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NEIPSecSASession;
  -[NEIPSecSASession dealloc](&v3, sel_dealloc);
}

- (void)setDelegateQueue:(id)a3
{
  if (self) {
    objc_setProperty_atomic(self, a2, a3, 48LL);
  }
}

- (OS_dispatch_queue)delegateQueue
{
  if (self) {
    self = (NEIPSecSASession *)objc_getProperty(self, a2, 48LL, 1);
  }
  return (OS_dispatch_queue *)self;
}

- (void)removeAllSAs
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  objc_super v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v32 = self;
    _os_log_impl(&dword_1876B1000, v3, OS_LOG_TYPE_INFO, "%@ Removing all SAs", buf, 0xCu);
  }

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  if (self) {
    id Property = objc_getProperty(self, v4, 32LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v6 = Property;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * v10++) invalidate];
      }

      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }

    while (v8);
  }

  if (self)
  {
    objc_msgSend(objc_getProperty(self, v11, 32, 1), "removeAllObjects");
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v13 = objc_getProperty(self, v12, 24LL, 1);
  }

  else
  {
    [0 removeAllObjects];
    id v13 = 0LL;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
  }

  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      uint64_t v18 = 0LL;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v18++), "invalidate", (void)v21);
      }

      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }

    while (v16);
  }

  if (self) {
    id v20 = objc_getProperty(self, v19, 24LL, 1);
  }
  else {
    id v20 = 0LL;
  }
  objc_msgSend(v20, "removeAllObjects", (void)v21);
}

- (BOOL)addLarvalSA:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NEIPSecSASession;
  -[NEIPSecSASession doesNotRecognizeSelector:](&v4, sel_doesNotRecognizeSelector_, a2);
  return 0;
}

- (BOOL)updateSA:(id)a3
{
  id v5 = a3;
  if (!self)
  {
    if ([0 containsObject:v5])
    {
      [0 addObject:v5];
      id Property = 0LL;
      goto LABEL_4;
    }

- (BOOL)addSA:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    if (self) {
      id Property = objc_getProperty(self, v4, 24LL, 1);
    }
    else {
      id Property = 0LL;
    }
    [Property addObject:v5];
  }

  return v5 != 0LL;
}

- (BOOL)removeSA:(id)a3
{
  id v5 = a3;
  if (self)
  {
    if (objc_msgSend(objc_getProperty(self, v4, 24, 1), "containsObject:", v5))
    {
      BOOL v7 = 1;
      objc_msgSend(objc_getProperty(self, v6, 24, 1), "removeObject:", v5);
    }

    else
    {
      BOOL v7 = 0;
    }

    if (objc_msgSend(objc_getProperty(self, v6, 32, 1), "containsObject:", v5))
    {
      id Property = objc_getProperty(self, v8, 32LL, 1);
LABEL_7:
      [Property removeObject:v5];
      BOOL v7 = 1;
    }
  }

  else
  {
    if ([0 containsObject:v5])
    {
      [0 removeObject:v5];
      BOOL v7 = 1;
    }

    else
    {
      BOOL v7 = 0;
    }

    char v11 = [0 containsObject:v5];
    id Property = 0LL;
    if ((v11 & 1) != 0) {
      goto LABEL_7;
    }
  }

  [v5 invalidate];

  return v7;
}

- (BOOL)migrateSA:(id)a3
{
  id v5 = a3;
  if (!self)
  {
    if ([0 containsObject:v5])
    {
      [0 removeObject:v5];
      id Property = 0LL;
      goto LABEL_4;
    }

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (NEIPSecSASessionDelegate)delegate
{
  return (NEIPSecSASessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
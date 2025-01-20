@interface NEIKEv2PrivateNotify
- (BOOL)isEqual:(id)a3;
- (NEIKEv2PrivateNotify)initWithNotifyStatus:(unsigned __int16)a3 notifyData:(id)a4;
- (NSData)notifyData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unsigned)notifyStatus;
@end

@implementation NEIKEv2PrivateNotify

- (NEIKEv2PrivateNotify)initWithNotifyStatus:(unsigned __int16)a3 notifyData:(id)a4
{
  unsigned int v4 = a3;
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  if (v4 >> 13 <= 4)
  {
    ne_log_obj();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v14 = v4;
      _os_log_error_impl(&dword_1876B1000, v10, OS_LOG_TYPE_ERROR, "Invalid private notify status %u", buf, 8u);
    }

    goto LABEL_7;
  }

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NEIKEv2PrivateNotify;
  v7 = -[NEIKEv2PrivateNotify init](&v12, sel_init);
  if (!v7)
  {
    ne_log_obj();
    self = (NEIKEv2PrivateNotify *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)self, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1876B1000, (os_log_t)self, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }

- (id)copyWithZone:(_NSZone *)a3
{
  unsigned int v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = -[NEIKEv2PrivateNotify notifyStatus](self, "notifyStatus");
  -[NEIKEv2PrivateNotify notifyData](self, "notifyData");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)[v6 copy];
  v8 = (void *)[v4 initWithNotifyStatus:v5 notifyData:v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    int v6 = [v5 notifyStatus];
    if (self) {
      self->_notifyStatus = v6;
    }
    if (v6)
    {
      v7 = -[NEIKEv2PrivateNotify notifyData](self, "notifyData");
      [v5 notifyData];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == v8)
      {
        char v11 = 1;
      }

      else
      {
        v9 = -[NEIKEv2PrivateNotify notifyData](self, "notifyData");
        [v5 notifyData];
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        char v11 = [v9 isEqual:v10];
      }
    }

    else
    {
      char v11 = 0;
    }
  }

  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  unsigned int v4 = -[NEIKEv2PrivateNotify notifyStatus](self, "notifyStatus");
  -[NEIKEv2PrivateNotify notifyData](self, "notifyData");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = (void *)[v3 initWithFormat:@"[Private Notify %u %@]", v4, v5];

  return v6;
}

- (unsigned)notifyStatus
{
  return self->_notifyStatus;
}

- (NSData)notifyData
{
  return self->_notifyData;
}

- (void).cxx_destruct
{
}

@end
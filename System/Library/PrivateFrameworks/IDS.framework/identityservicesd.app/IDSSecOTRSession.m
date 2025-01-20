@interface IDSSecOTRSession
- (IDSSecOTRSession)initWithSecOTRSessionRef:(_SecOTRSession *)a3;
- (_SecOTRSession)backingOTRSessionRef;
- (id)signAndProtectMessage:(id)a3 withError:(id *)a4;
- (id)verifyAndExposeMessage:(id)a3 withError:(id *)a4;
- (void)dealloc;
- (void)setBackingOTRSessionRef:(_SecOTRSession *)a3;
@end

@implementation IDSSecOTRSession

- (IDSSecOTRSession)initWithSecOTRSessionRef:(_SecOTRSession *)a3
{
  v3 = (IDSSecOTRSession *)a3;
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___IDSSecOTRSession;
    v4 = -[IDSSecOTRSession init](&v6, "init");
    if (v4) {
      v4->_backingOTRSessionRef = (_SecOTRSession *)CFRetain(v3);
    }
    self = v4;
    v3 = self;
  }

  return v3;
}

- (void)dealloc
{
  backingOTRSessionRef = self->_backingOTRSessionRef;
  if (backingOTRSessionRef)
  {
    CFRelease(backingOTRSessionRef);
    self->_backingOTRSessionRef = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IDSSecOTRSession;
  -[IDSSecOTRSession dealloc](&v4, "dealloc");
}

- (id)signAndProtectMessage:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
  backingOTRSessionRef = self->_backingOTRSessionRef;
  if (qword_1009BE8B0 != -1) {
    dispatch_once(&qword_1009BE8B0, &stru_1008F8168);
  }
  if (off_1009BE8A8)
  {
    int v9 = off_1009BE8A8(backingOTRSessionRef, v6, v7);
    if (!v9)
    {
      v10 = v7;
      goto LABEL_15;
    }
  }

  else
  {
    int v9 = -26276;
  }

  uint64_t v11 = OSLogHandleForIDSCategory("Encryption");
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v17 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "   OTR encryption failed with error: %d",  buf,  8u);
  }

  if (a4)
  {
    id v14 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v9,  0LL));
    v10 = 0LL;
    *a4 = v14;
  }

  else
  {
    v10 = 0LL;
  }

- (id)verifyAndExposeMessage:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
  backingOTRSessionRef = self->_backingOTRSessionRef;
  if (qword_1009BE8C0 != -1) {
    dispatch_once(&qword_1009BE8C0, &stru_1008F8188);
  }
  if (off_1009BE8B8)
  {
    int v9 = off_1009BE8B8(backingOTRSessionRef, v6, v7);
    if (!v9)
    {
      v10 = v7;
      goto LABEL_15;
    }
  }

  else
  {
    int v9 = -26276;
  }

  uint64_t v11 = OSLogHandleForIDSCategory("Encryption");
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v17 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "   OTR decryption failed with error: %d",  buf,  8u);
  }

  if (a4)
  {
    id v14 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v9,  0LL));
    v10 = 0LL;
    *a4 = v14;
  }

  else
  {
    v10 = 0LL;
  }

- (_SecOTRSession)backingOTRSessionRef
{
  return self->_backingOTRSessionRef;
}

- (void)setBackingOTRSessionRef:(_SecOTRSession *)a3
{
  self->_backingOTRSessionRef = a3;
}

@end
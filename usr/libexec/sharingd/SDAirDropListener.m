@interface SDAirDropListener
- (BOOL)contactsOnly;
- (NSString)description;
- (SDAirDropListener)init;
- (SDAirDropListenerDelegate)delegate;
- (void)dealloc;
- (void)networkOperation:(id)a3 event:(int64_t)a4 withResults:(id)a5;
- (void)setContactsOnly:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation SDAirDropListener

- (SDAirDropListener)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SDAirDropListener;
  v2 = -[SDAirDropListener init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    listener = v2->_listener;
    v2->_listener = 0LL;
  }

  return v3;
}

- (void)networkOperation:(id)a3 event:(int64_t)a4 withResults:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = v9;
  if (a4 == 12)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained listener:self informationDidChange:v10];
LABEL_9:

    goto LABEL_16;
  }

  if (a4 == 10)
  {
    uint64_t v21 = airdrop_log(v9);
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v27[0] = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "kSFOperationEventErrorOccurred",  (uint8_t *)v27,  2u);
    }

    id v23 = objc_loadWeakRetained((id *)&self->_delegate);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:kSFOperationErrorKey]);
    [v23 listener:self didReceiveError:v24];

    goto LABEL_13;
  }

  if (a4 != 1)
  {
LABEL_13:
    uint64_t v25 = airdrop_log(v9);
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1000824EC(a4, (uint64_t)v10, v26);
    }

    goto LABEL_16;
  }

  uint64_t v11 = kSFOperationHTTPServerConnectionKey;
  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:kSFOperationHTTPServerConnectionKey]);

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id WeakRetained = (id)objc_claimAutoreleasedReturnValue([v13 UUIDString]);

    uint64_t v15 = kSFOperationContactsOnlyKey;
    v16 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:kSFOperationContactsOnlyKey]);
    v17 = objc_alloc(&OBJC_CLASS___SDNetworkOperation);
    v18 = -[SDNetworkOperation initWithKind:](v17, "initWithKind:", kSFOperationKindReceiver);
    v19 = v18;
    if (v16) {
      -[SDNetworkOperation setProperty:forKey:](v18, "setProperty:forKey:", v16, v15);
    }
    -[SDNetworkOperation setProperty:forKey:](v19, "setProperty:forKey:", v12, v11);
    -[SDNetworkOperation setProperty:forKey:](v19, "setProperty:forKey:", WeakRetained, kSFOperationSessionIDKey);
    -[SDNetworkOperation setObjectKey:](v19, "setObjectKey:", WeakRetained);
    -[SDNetworkOperation resume](v19, "resume");
    id v20 = objc_loadWeakRetained((id *)&self->_delegate);
    [v20 listener:self didReceiveNewRequest:v19];

    goto LABEL_9;
  }

- (void)start
{
  if (!self->_listener)
  {
    v3 = objc_alloc(&OBJC_CLASS___SDNetworkOperation);
    v4 = -[SDNetworkOperation initWithKind:](v3, "initWithKind:", kSFOperationKindListener);
    listener = self->_listener;
    self->_listener = v4;

    -[SDNetworkOperation setDelegate:](self->_listener, "setDelegate:", self);
    -[SDNetworkOperation resume](self->_listener, "resume");
  }

- (void)stop
{
  listener = self->_listener;
  if (listener)
  {
    -[SDNetworkOperation setDelegate:](listener, "setDelegate:", 0LL);
    -[SDNetworkOperation invalidate](self->_listener, "invalidate");
    v4 = self->_listener;
    self->_listener = 0LL;
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDAirDropListener;
  -[SDAirDropListener dealloc](&v3, "dealloc");
}

- (NSString)description
{
  listener = self->_listener;
  if (!listener) {
    return (NSString *)0LL;
  }
  id v6 = 0LL;
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDNetworkOperation description](listener, "description"));
  NSAppendPrintF(&v6, "%@\n", v3);
  id v4 = v6;

  return (NSString *)v4;
}

- (BOOL)contactsOnly
{
  return self->_contactsOnly;
}

- (void)setContactsOnly:(BOOL)a3
{
  self->_contactsOnly = a3;
}

- (SDAirDropListenerDelegate)delegate
{
  return (SDAirDropListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
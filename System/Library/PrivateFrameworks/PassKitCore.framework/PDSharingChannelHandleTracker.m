@interface PDSharingChannelHandleTracker
- (BOOL)isServerForRemoteHandle;
- (NSString)transferToken;
- (PDSharingChannelHandle)handle;
- (PDSharingChannelHandleTracker)initWithHandle:(id)a3;
- (void)setIsServerForRemoteHandle:(BOOL)a3;
- (void)setTransferToken:(id)a3;
@end

@implementation PDSharingChannelHandleTracker

- (PDSharingChannelHandleTracker)initWithHandle:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PDSharingChannelHandleTracker;
  v5 = -[PDSharingChannelHandleTracker init](&v8, "init");
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_handle, v4);
  }

  return v6;
}

- (PDSharingChannelHandle)handle
{
  return (PDSharingChannelHandle *)objc_loadWeakRetained((id *)&self->_handle);
}

- (BOOL)isServerForRemoteHandle
{
  return self->_isServerForRemoteHandle;
}

- (void)setIsServerForRemoteHandle:(BOOL)a3
{
  self->_isServerForRemoteHandle = a3;
}

- (NSString)transferToken
{
  return self->_transferToken;
}

- (void)setTransferToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
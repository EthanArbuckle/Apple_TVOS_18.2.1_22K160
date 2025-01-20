@interface VSKeepAliveClient
- (BOOL)_shouldChangeAudioSession;
- (void)cancel;
- (void)dealloc;
- (void)maintainWithAudioType:(int64_t)a3 keepAudioSessionActive:(BOOL)a4;
- (void)setManager:(id)a3;
@end

@implementation VSKeepAliveClient

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  [WeakRetained cancelKeepAlive:self];

  registryRunLoopSource = self->_registryRunLoopSource;
  if (registryRunLoopSource)
  {
    sub_1000E234C(registryRunLoopSource, 0);
    CFRelease(self->_registryRunLoopSource);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___VSKeepAliveClient;
  -[VSKeepAliveClient dealloc](&v5, "dealloc");
}

- (void)setManager:(id)a3
{
}

- (BOOL)_shouldChangeAudioSession
{
  return self->_activity && self->_keepSessionActive;
}

- (void)maintainWithAudioType:(int64_t)a3 keepAudioSessionActive:(BOOL)a4
{
  if (!self->_isActive)
  {
    self->_isActive = 1;
    self->_activity = a3 & 3;
    self->_keepSessionActive = a4;
    if (-[VSKeepAliveClient _shouldChangeAudioSession](self, "_shouldChangeAudioSession")) {
      sub_1000EB6E0(1, self->_activity);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
    [WeakRetained maintainKeepAlive:self];

    v9.version = 0LL;
    memset(&v9.retain, 0, 56);
    v9.info = self;
    v9.perform = (void (__cdecl *)(void *))nullsub_17;
    v6 = (OS_os_transaction *)os_transaction_create("com.apple.voiceservices.keepalive");
    transaction = self->_transaction;
    self->_transaction = v6;

    v8 = CFRunLoopSourceCreate(0LL, 0LL, &v9);
    self->_registryRunLoopSource = v8;
    sub_1000E234C(v8, 1);
  }

- (void)cancel
{
  if (self->_isActive)
  {
    self->_isActive = 0;
    transaction = self->_transaction;
    self->_transaction = 0LL;

    if (-[VSKeepAliveClient _shouldChangeAudioSession](self, "_shouldChangeAudioSession")) {
      sub_1000EB6E0(0, self->_activity);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
    [WeakRetained cancelKeepAlive:self];

    registryRunLoopSource = self->_registryRunLoopSource;
    if (registryRunLoopSource) {
      sub_1000E234C(registryRunLoopSource, 0);
    }
  }

- (void).cxx_destruct
{
}

@end
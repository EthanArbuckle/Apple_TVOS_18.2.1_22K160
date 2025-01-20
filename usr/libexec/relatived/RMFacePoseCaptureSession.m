@interface RMFacePoseCaptureSession
- (BOOL)isCameraPaused;
- (RMFacePoseCaptureSession)init;
- (RMFacePoseCaptureSessionDelegate)delegate;
- (unint64_t)numberOfCameras;
- (void)setCameraPaused:(BOOL)a3;
- (void)setDelegate:(id)a3;
@end

@implementation RMFacePoseCaptureSession

- (RMFacePoseCaptureSession)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RMFacePoseCaptureSession;
  return -[RMFacePoseCaptureSession init](&v3, "init");
}

- (void)setCameraPaused:(BOOL)a3
{
  self->_cameraPaused = a3;
}

- (unint64_t)numberOfCameras
{
  return 0LL;
}

- (RMFacePoseCaptureSessionDelegate)delegate
{
  return (RMFacePoseCaptureSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isCameraPaused
{
  return self->_cameraPaused;
}

- (void).cxx_destruct
{
}

@end
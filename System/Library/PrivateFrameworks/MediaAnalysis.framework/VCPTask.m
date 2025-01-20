@interface VCPTask
- (BOOL)isCancelled;
- (PHPhotoLibrary)photoLibrary;
- (VCPTask)init;
- (VCPTask)initWithPhotoLibrary:(id)a3;
- (id)cancel;
- (id)progressHandler;
- (int)error;
- (int)mainInternal;
- (void)main;
- (void)setCancel:(id)a3;
- (void)setProgressHandler:(id)a3;
@end

@implementation VCPTask

- (VCPTask)init
{
  return 0LL;
}

- (VCPTask)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___VCPTask;
  v6 = -[VCPTask init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    v8 = *(void **)&v6->super._private1;
    *(void *)&v6->super._private1 = &stru_1001BE148;

    LODWORD(v7->super._private) = 0;
    objc_storeStrong(&v7->_cancel, a3);
  }

  return v7;
}

- (BOOL)isCancelled
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___VCPTask;
  if (-[VCPTask isCancelled](&v5, "isCancelled"))
  {
    LOBYTE(v3) = 1;
  }

  else
  {
    uint64_t v3 = *(void *)&self->super._private1;
    if (v3) {
      LOBYTE(v3) = (*(uint64_t (**)(void))(v3 + 16))();
    }
  }

  return v3;
}

- (int)mainInternal
{
  return -4;
}

- (void)main
{
  uint64_t v3 = objc_autoreleasePoolPush();
  LODWORD(self->super._private) = -[VCPTask mainInternal](self, "mainInternal");
  objc_autoreleasePoolPop(v3);
}

- (id)cancel
{
  return *(id *)&self->super._private1;
}

- (void)setCancel:(id)a3
{
}

- (int)error
{
  return (int)self->super._private;
}

- (id)progressHandler
{
  return *(id *)&self->_error;
}

- (void)setProgressHandler:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  return (PHPhotoLibrary *)self->_cancel;
}

- (void).cxx_destruct
{
}

@end
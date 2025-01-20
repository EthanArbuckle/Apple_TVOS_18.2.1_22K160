@interface QuarantineFileHandler
- (BOOL)applyMountPointsWithBSDName:(id)a3 error:(id *)a4;
- (BOOL)isQuarantined;
- (QuarantineFileHandler)initWithFD:(int)a3 error:(id *)a4;
- (QuarantineFileHandler)initWithURL:(id)a3 error:(id *)a4;
- (id)getFileInfoWithError:(id *)a3;
@end

@implementation QuarantineFileHandler

- (QuarantineFileHandler)initWithFD:(int)a3 error:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___QuarantineFileHandler;
  return -[QuarantineFileHandler init](&v5, sel_init, *(void *)&a3, a4);
}

- (QuarantineFileHandler)initWithURL:(id)a3 error:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___QuarantineFileHandler;
  return -[QuarantineFileHandler init](&v5, sel_init, a3, a4);
}

- (BOOL)applyMountPointsWithBSDName:(id)a3 error:(id *)a4
{
  return 1;
}

- (id)getFileInfoWithError:(id *)a3
{
  return 0LL;
}

- (BOOL)isQuarantined
{
  return self->_isQuarantined;
}

@end
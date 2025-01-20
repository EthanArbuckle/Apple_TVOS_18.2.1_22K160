@interface DiskImageParamsLocked_XPC
- (DiskImageParamsLocked_XPC)initWithBackendXPC:(id)a3;
- (id)newWithPassphrase:(const char *)a3 error:(id *)a4;
- (unique_ptr<const)getImageInfoWithExtra:(BOOL)a3 error:(id *)a4;
@end

@implementation DiskImageParamsLocked_XPC

- (DiskImageParamsLocked_XPC)initWithBackendXPC:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DiskImageParamsLocked_XPC;
  return -[DiskImageParamsXPC initWithBackendXPC:](&v4, "initWithBackendXPC:", a3);
}

- (id)newWithPassphrase:(const char *)a3 error:(id *)a4
{
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
  id v8 = [v7 newUnlockedBackendXPCWithPassphrase:a3 certificate:0 isNewImage:0 error:a4];

  if (!v8) {
    return 0LL;
  }
  id v9 = +[DiskImageParamsXPC newWithUnlockedBackendXPC:error:]( &OBJC_CLASS___DiskImageParamsXPC,  "newWithUnlockedBackendXPC:error:",  v8,  a4);
  if (v9) {
    objc_msgSend(v9, "setBlockSize:", -[DiskImageParamsXPC blockSize](self, "blockSize"));
  }

  return v9;
}

- (unique_ptr<const)getImageInfoWithExtra:(BOOL)a3 error:(id *)a4
{
  v5 = v4;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC", a3, a4));
  v6 = (uint64_t *)[v9 cryptoHeader];
  v7 = operator new(0x58uLL);
  sub_10008E864((uint64_t)v7, v6);
  void *v5 = (char *)v7 + *(void *)(*v7 - 104LL);

  return v8;
}

@end
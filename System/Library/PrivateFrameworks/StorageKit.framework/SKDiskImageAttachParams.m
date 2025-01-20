@interface SKDiskImageAttachParams
- (BOOL)emulateExternalDisk;
- (BOOL)is4KBlockSize;
- (BOOL)isManagedAttach;
- (BOOL)readOnly;
- (BOOL)stdinPassPhrase;
- (SKDiskImageAttachParams)init;
- (SKDiskImageAttachParams)initWithParams:(id)a3;
- (SKMountParams)mountParams;
- (id)description;
- (id)diAttachParamsWithExistingParams:(id)a3 error:(id *)a4;
- (id)diAttachParamsWithURL:(id)a3 error:(id *)a4;
- (int64_t)policy;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setEmulateExternalDisk:(BOOL)a3;
- (void)setIs4KBlockSize:(BOOL)a3;
- (void)setIsManagedAttach:(BOOL)a3;
- (void)setMountParams:(id)a3;
- (void)setPolicy:(int64_t)a3;
- (void)setReadOnly:(BOOL)a3;
- (void)setStdinPassPhrase:(BOOL)a3;
- (void)setupDIAttachParams:(id)a3;
@end

@implementation SKDiskImageAttachParams

- (SKDiskImageAttachParams)initWithParams:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SKDiskImageAttachParams;
  v6 = -[SKDiskImageAttachParams init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mountParams, a3);
    -[SKMountParams setForce:](v7->_mountParams, "setForce:", 1LL);
    -[SKMountParams setRecursive:](v7->_mountParams, "setRecursive:", 1LL);
    v7->_policy = 2LL;
    v7->_readOnly = -[SKMountParams readOnly](v7->_mountParams, "readOnly");
    *(_WORD *)&v7->_isManagedAttach = 0;
    -[SKMountParams addObserver:forKeyPath:options:context:]( v7->_mountParams,  "addObserver:forKeyPath:options:context:",  v7,  @"readOnly",  1LL,  0LL);
  }

  return v7;
}

- (void)setReadOnly:(BOOL)a3
{
  BOOL v3 = a3;
  self->_readOnly = a3;
  -[SKDiskImageAttachParams mountParams](self, "mountParams");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setReadOnly:v3];
}

- (void)setMountParams:(id)a3
{
  id v4 = (SKMountParams *)a3;
  -[SKMountParams removeObserver:forKeyPath:](self->_mountParams, "removeObserver:forKeyPath:", self, @"readOnly");
  mountParams = self->_mountParams;
  self->_mountParams = v4;
  v6 = v4;

  -[SKMountParams setForce:](self->_mountParams, "setForce:", 1LL);
  -[SKMountParams setRecursive:](self->_mountParams, "setRecursive:", 1LL);
  self->_readOnly = -[SKMountParams readOnly](self->_mountParams, "readOnly");
  -[SKMountParams addObserver:forKeyPath:options:context:]( self->_mountParams,  "addObserver:forKeyPath:options:context:",  self,  @"readOnly",  1LL,  0LL);
}

- (void)setPolicy:(int64_t)a3
{
  -[SKMountParams setForce:](self->_mountParams, "setForce:", a3 == 2);
  self->_policy = a3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a4;
  if ([a3 isEqualToString:@"readOnly"])
  {
    id v8 = v10;
    if (v8)
    {
      objc_super v9 = v8;
      self->_readOnly = [v8 readOnly];
    }
  }
}

- (SKDiskImageAttachParams)init
{
  BOOL v3 = (void *)objc_opt_new();
  id v4 = -[SKDiskImageAttachParams initWithParams:](self, "initWithParams:", v3);

  return v4;
}

- (id)description
{
  BOOL v3 = (void *)NSString;
  id v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@: { mountParams: %@, readOnly: %d, policy: %ld }>", v5, self->_mountParams, self->_readOnly, self->_policy];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)diAttachParamsWithURL:(id)a3 error:(id *)a4
{
  v6 = (objc_class *)MEMORY[0x18960F1F8];
  id v7 = a3;
  id v8 = (void *)[[v6 alloc] initWithURL:v7 error:a4];

  if (v8)
  {
    -[SKDiskImageAttachParams setupDIAttachParams:](self, "setupDIAttachParams:", v8);
    id v9 = v8;
  }

  return v8;
}

- (id)diAttachParamsWithExistingParams:(id)a3 error:(id *)a4
{
  v6 = (objc_class *)MEMORY[0x18960F1F8];
  id v7 = a3;
  id v8 = (void *)[[v6 alloc] initWithExistingParams:v7 error:a4];

  if (v8)
  {
    -[SKDiskImageAttachParams setupDIAttachParams:](self, "setupDIAttachParams:", v8);
    id v9 = v8;
  }

  return v8;
}

- (void)setupDIAttachParams:(id)a3
{
  id v9 = a3;
  [v9 setAutoMount:0];
  if (-[SKDiskImageAttachParams readOnly](self, "readOnly")) {
    uint64_t v4 = 2LL;
  }
  else {
    uint64_t v4 = 1LL;
  }
  [v9 setFileMode:v4];
  if (-[SKDiskImageAttachParams is4KBlockSize](self, "is4KBlockSize")) {
    uint64_t v5 = 4096LL;
  }
  else {
    uint64_t v5 = 512LL;
  }
  [v9 setRawBlockSize:v5];
  BOOL v6 = -[SKDiskImageAttachParams stdinPassPhrase](self, "stdinPassPhrase");
  uint64_t v7 = [v9 readPassphraseFlags];
  if (v6) {
    uint64_t v8 = v7 | 8;
  }
  else {
    uint64_t v8 = v7;
  }
  [v9 setReadPassphraseFlags:v8];
  if (os_variant_has_internal_content()) {
    objc_msgSend( v9,  "setEmulateExternalDisk:",  -[SKDiskImageAttachParams emulateExternalDisk](self, "emulateExternalDisk"));
  }
}

- (int64_t)policy
{
  return self->_policy;
}

- (SKMountParams)mountParams
{
  return self->_mountParams;
}

- (BOOL)readOnly
{
  return self->_readOnly;
}

- (BOOL)stdinPassPhrase
{
  return self->_stdinPassPhrase;
}

- (void)setStdinPassPhrase:(BOOL)a3
{
  self->_stdinPassPhrase = a3;
}

- (BOOL)isManagedAttach
{
  return self->_isManagedAttach;
}

- (void)setIsManagedAttach:(BOOL)a3
{
  self->_isManagedAttach = a3;
}

- (BOOL)is4KBlockSize
{
  return self->_is4KBlockSize;
}

- (void)setIs4KBlockSize:(BOOL)a3
{
  self->_is4KBlockSize = a3;
}

- (BOOL)emulateExternalDisk
{
  return self->_emulateExternalDisk;
}

- (void)setEmulateExternalDisk:(BOOL)a3
{
  self->_emulateExternalDisk = a3;
}

- (void).cxx_destruct
{
}

@end
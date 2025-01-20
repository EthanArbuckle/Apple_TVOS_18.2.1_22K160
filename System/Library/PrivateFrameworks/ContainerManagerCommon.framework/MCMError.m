@interface MCMError
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMCMError:(id)a3;
- (MCMError)init;
- (MCMError)initWithErrorType:(unint64_t)a3;
- (MCMError)initWithErrorType:(unint64_t)a3 category:(unint64_t)a4;
- (MCMError)initWithErrorType:(unint64_t)a3 category:(unint64_t)a4 path:(id)a5 POSIXerrno:(int)a6;
- (MCMError)initWithLibsystemError:(container_error_extended_s *)a3;
- (MCMError)initWithNSError:(id)a3 url:(id)a4 defaultErrorType:(unint64_t)a5;
- (NSString)path;
- (container_error_extended_s)libsystemError;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)fullDescription;
- (int)POSIXerrno;
- (unint64_t)category;
- (unint64_t)hash;
- (unint64_t)type;
@end

@implementation MCMError

- (MCMError)initWithLibsystemError:(container_error_extended_s *)a3
{
  if (a3)
  {
    uint64_t type = container_error_get_type();
    uint64_t category = container_error_get_category();
    uint64_t posix_errno = container_error_get_posix_errno();
    uint64_t path = container_error_get_path();
    if (path)
    {
      [NSString stringWithUTF8String:path];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v8 = 0LL;
    }

    self =  -[MCMError initWithErrorType:category:path:POSIXerrno:]( self,  "initWithErrorType:category:path:POSIXerrno:",  type,  category,  v8,  posix_errno);

    v9 = self;
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

- (MCMError)init
{
  return -[MCMError initWithErrorType:category:path:POSIXerrno:]( self,  "initWithErrorType:category:path:POSIXerrno:",  1LL,  0LL,  0LL,  0LL);
}

- (MCMError)initWithErrorType:(unint64_t)a3
{
  return -[MCMError initWithErrorType:category:path:POSIXerrno:]( self,  "initWithErrorType:category:path:POSIXerrno:",  a3,  0LL,  0LL,  0LL);
}

- (MCMError)initWithErrorType:(unint64_t)a3 category:(unint64_t)a4
{
  return -[MCMError initWithErrorType:category:path:POSIXerrno:]( self,  "initWithErrorType:category:path:POSIXerrno:",  a3,  a4,  0LL,  0LL);
}

- (MCMError)initWithErrorType:(unint64_t)a3 category:(unint64_t)a4 path:(id)a5 POSIXerrno:(int)a6
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v11 = a5;
  if (a3 == 1)
  {
    v12 = 0LL;
  }

  else
  {
    v16.receiver = self;
    v16.super_class = (Class)&OBJC_CLASS___MCMError;
    v13 = -[MCMError init](&v16, sel_init);
    v14 = v13;
    if (v13)
    {
      v13->_uint64_t type = a3;
      v13->_uint64_t category = a4;
      objc_storeStrong((id *)&v13->_path, a5);
      v14->_POSIXerrno = a6;
    }

    self = v14;
    v12 = self;
  }

  return v12;
}

- (MCMError)initWithNSError:(id)a3 url:(id)a4 defaultErrorType:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v18 = 0LL;
    goto LABEL_14;
  }

  [v8 domain];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  int v11 = [v10 isEqual:*MEMORY[0x189607688]];

  if (v11)
  {
    [v9 path];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v8 code];
    v14 = self;
    unint64_t v15 = a5;
    uint64_t v16 = 1LL;
    uint64_t v17 = v12;
LABEL_4:
    self =  -[MCMError initWithErrorType:category:path:POSIXerrno:]( v14,  "initWithErrorType:category:path:POSIXerrno:",  v15,  v16,  v17,  v13);

    v18 = self;
    goto LABEL_14;
  }

  [v8 domain];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v19 isEqual:*MEMORY[0x189607460]])
  {
    uint64_t v20 = [v8 code];

    if (v20 == 2048)
    {
      [v9 path];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = self;
      unint64_t v15 = a5;
      uint64_t v16 = 5LL;
      uint64_t v17 = v12;
      uint64_t v13 = 100LL;
      goto LABEL_4;
    }
  }

  else
  {
  }

  [v8 domain];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  int v22 = [v21 isEqual:@"MCMErrorDomain"];

  if (v22)
  {
    unint64_t v23 = [v8 code];
    v24 = self;
  }

  else
  {
    v24 = self;
    unint64_t v23 = a5;
  }

  self = -[MCMError initWithErrorType:](v24, "initWithErrorType:", v23);
  v18 = self;
LABEL_14:

  return v18;
}

- (container_error_extended_s)libsystemError
{
  id v3 = -[MCMError path](self, "path");
  [v3 fileSystemRepresentation];
  -[MCMError POSIXerrno](self, "POSIXerrno");
  v4 = (container_error_extended_s *)container_error_create();

  return v4;
}

- (id)description
{
  v5[5] = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc(&OBJC_CLASS___MCMLazyDescription);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __23__MCMError_description__block_invoke;
  v5[3] = &unk_18A29E720;
  v5[4] = self;
  return -[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (id)fullDescription
{
  v5[5] = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc(&OBJC_CLASS___MCMLazyDescription);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __27__MCMError_fullDescription__block_invoke;
  v5[3] = &unk_18A29E720;
  v5[4] = self;
  return -[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (unint64_t)hash
{
  unint64_t type = self->_type;
  unint64_t category = self->_category;
  return category ^ type ^ -[NSString hash](self->_path, "hash");
}

- (BOOL)isEqualToMCMError:(id)a3
{
  v4 = a3;
  uint64_t path = self->_path;
  if (!path) {
    goto LABEL_4;
  }
  if (!v4[4])
  {
    LOBYTE(path) = 0;
    goto LABEL_6;
  }

  LOBYTE(path) = -[NSString isEqualToString:](path, "isEqualToString:");
  if (self->_path)
  {
LABEL_6:
    BOOL v6 = 0;
    goto LABEL_7;
  }

- (BOOL)isEqual:(id)a3
{
  v4 = (MCMError *)a3;
  BOOL v5 = self == v4;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      BOOL v5 = -[MCMError isEqualToMCMError:](self, "isEqualToMCMError:", v4);
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (v5)
  {
    *(void *)(v5 + 16) = self->_type;
    *(void *)(v5 + 24) = self->_category;
    uint64_t v7 = -[NSString copyWithZone:](self->_path, "copyWithZone:", a3);
    BOOL v8 = *(void **)(v6 + 32);
    *(void *)(v6 + 32) = v7;

    *(_DWORD *)(v6 + 8) = self->_POSIXerrno;
  }

  return (id)v6;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)category
{
  return self->_category;
}

- (NSString)path
{
  return self->_path;
}

- (int)POSIXerrno
{
  return self->_POSIXerrno;
}

- (void).cxx_destruct
{
}

id __27__MCMError_fullDescription__block_invoke(uint64_t a1, char a2)
{
  v4 = (void *)NSString;
  uint64_t v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v7 type];
  uint64_t v9 = [*(id *)(a1 + 32) category];
  uint64_t v10 = [*(id *)(a1 + 32) POSIXerrno];
  uint64_t v11 = v10;
  if ((a2 & 1) != 0)
  {
    [*(id *)(a1 + 32) path];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v4,  "stringWithFormat:",  @"<%@: %p; unint64_t type = %llu, category = %llu, POSIX errno = %d, path = [%@]>",
      v6,
      v7,
      v8,
      v9,
      v11,
      v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    objc_msgSend( v4,  "stringWithFormat:",  @"<%@: %p; unint64_t type = %llu, category = %llu, POSIX errno = %d, path = [%@]>",
      v6,
      v7,
      v8,
      v9,
      v10,
      @"~~");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

id __23__MCMError_description__block_invoke(uint64_t a1, char a2)
{
  v4 = (void *)NSString;
  uint64_t v5 = [*(id *)(a1 + 32) type];
  uint64_t v6 = [*(id *)(a1 + 32) category];
  uint64_t v7 = [*(id *)(a1 + 32) POSIXerrno];
  uint64_t v8 = v7;
  if ((a2 & 1) != 0)
  {
    [*(id *)(a1 + 32) path];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 stringWithFormat:@"(%llu|%llu|%d|[%@])", v5, v6, v8, v9];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [v4 stringWithFormat:@"(%llu|%llu|%d|[%@])", v5, v6, v7, @"~~"];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

@end
@interface NEFileHandle
- (BOOL)launchOwnerWhenReadable;
- (NEFileHandle)initWithFileDescriptor:(int)a3 launchOwnerWhenReadable:(BOOL)a4;
- (NSFileHandle)handle;
- (OS_xpc_object)dictionary;
- (id)initFromDictionary:(id)a3;
- (unint64_t)type;
@end

@implementation NEFileHandle

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = xpc_dictionary_dup_fd(v4, "file-descriptor");
  BOOL v6 = xpc_dictionary_get_BOOL(v4, "launch-owner-when-readable");

  if ((v5 & 0x80000000) != 0)
  {
    v7 = 0LL;
  }

  else
  {
    self =  -[NEFileHandle initWithFileDescriptor:launchOwnerWhenReadable:]( self,  "initWithFileDescriptor:launchOwnerWhenReadable:",  v5,  v6);
    v7 = self;
  }

  return v7;
}

- (NEFileHandle)initWithFileDescriptor:(int)a3 launchOwnerWhenReadable:(BOOL)a4
{
  uint64_t v5 = *(void *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NEFileHandle;
  BOOL v6 = -[NEFileHandle init](&v10, sel_init);
  if (v6)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x189607898]) initWithFileDescriptor:v5 closeOnDealloc:1];
    handle = v6->_handle;
    v6->_handle = (NSFileHandle *)v7;

    v6->_launchOwnerWhenReadable = a4;
  }

  return v6;
}

- (OS_xpc_object)dictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = [v3 fileDescriptor];

  if (v4 < 0)
  {
    xpc_object_t v5 = 0LL;
  }

  else
  {
    xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v5, "type", -[NEFileHandle type](self, "type"));
    -[NEFileHandle handle](self, "handle");
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_fd(v5, "file-descriptor", [v6 fileDescriptor]);

    xpc_dictionary_set_BOOL( v5,  "launch-owner-when-readable",  -[NEFileHandle launchOwnerWhenReadable](self, "launchOwnerWhenReadable"));
  }

  return (OS_xpc_object *)v5;
}

- (unint64_t)type
{
  return 0LL;
}

- (BOOL)launchOwnerWhenReadable
{
  return self->_launchOwnerWhenReadable;
}

- (NSFileHandle)handle
{
  return (NSFileHandle *)objc_getProperty(self, a2, 16LL, 1);
}

- (void).cxx_destruct
{
}

@end
@interface NSMachBootstrapServer
+ (id)sharedInstance;
- (BOOL)registerPort:(NSPort *)port name:(NSString *)name;
- (BOOL)removePortForName:(id)a3;
- (NSPort)portForName:(NSString *)name;
- (NSPort)portForName:(NSString *)name host:(NSString *)host;
- (NSPort)servicePortWithName:(NSString *)name;
- (id)portForName:(id)a3 options:(unint64_t)a4;
@end

@implementation NSMachBootstrapServer

+ (id)sharedInstance
{
  id result = (id)sharedInstance___NSMachBootstrapServerShared;
  if (!sharedInstance___NSMachBootstrapServerShared)
  {
    id result = (id)[objc_allocWithZone((Class)a1) init];
    sharedInstance___NSMachBootstrapServerShared = (uint64_t)result;
  }

  return result;
}

- (id)portForName:(id)a3 options:(unint64_t)a4
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (task_get_special_port(*MEMORY[0x1895FBBE0], 4, &special_port)) {
    return 0LL;
  }
  id result = -[NSFileManager fileSystemRepresentationWithPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileSystemRepresentationWithPath:",  a3);
  if (result)
  {
    if (!bootstrap_look_up2()) {
      return (id)[objc_allocWithZone(MEMORY[0x189603F98]) initWithMachPort:v6 options:1];
    }
    return 0LL;
  }

  return result;
}

- (NSPort)portForName:(NSString *)name
{
  return (NSPort *)-[NSMachBootstrapServer portForName:options:](self, "portForName:options:", name, 0LL);
}

- (BOOL)registerPort:(NSPort *)port name:(NSString *)name
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (task_get_special_port(*MEMORY[0x1895FBBE0], 4, &special_port)
    || (objc_opt_self(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    LOBYTE(v6) = 0;
  }

  else
  {
    unsigned int v6 = -[NSString UTF8String](name, "UTF8String");
    if (v6)
    {
      -[NSPort machPort](port, "machPort");
      LOBYTE(v6) = bootstrap_register2() == 0;
    }
  }

  return (char)v6;
}

- (NSPort)servicePortWithName:(NSString *)name
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v4 = (ipc_space_t *)MEMORY[0x1895FBBE0];
  if (!task_get_special_port(*MEMORY[0x1895FBBE0], 4, &special_port))
  {
    v7 = -[NSString UTF8String](name, "UTF8String");
    if (v7)
    {
      if (!bootstrap_check_in(special_port, v7, &poly))
      {
        mach_port_insert_right(*v4, poly, poly, 0x14u);
        id v8 = objc_allocWithZone(MEMORY[0x189603F98]);
        return (NSPort *)(id)[v8 initWithMachPort:poly];
      }

      v5 = (NSPort *)[MEMORY[0x189603F98] port];
      -[NSPort machPort](v5, "machPort");
    }
  }

  return 0LL;
}

- (NSPort)portForName:(NSString *)name host:(NSString *)host
{
  else {
    return -[NSMachBootstrapServer portForName:](self, "portForName:", name);
  }
}

- (BOOL)removePortForName:(id)a3
{
  return 0;
}

@end
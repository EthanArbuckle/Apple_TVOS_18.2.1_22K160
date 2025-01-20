@interface PS190Instance
- (BOOL)enable;
- (BOOL)enabled;
- (PS190Instance)initWithIICDevice:(id)a3;
- (PS190Instance)initWithRootPath:(id)a3;
- (id)description;
- (id)findDevice;
- (id)findHandle;
- (unint64_t)type;
@end

@implementation PS190Instance

- (PS190Instance)initWithRootPath:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PS190Instance;
  v5 = -[PS190Instance init](&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    rootPath = v5->_rootPath;
    v5->_rootPath = (NSString *)v6;

    v5->_type = 2LL;
    v5->_enabled = 1;
  }

  return v5;
}

- (PS190Instance)initWithIICDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PS190Instance;
  uint64_t v6 = -[PS190Instance init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_iicDevice, a3);
    v7->_enabled = 1;
    v7->_type = 1LL;
  }

  return v7;
}

- (BOOL)enable
{
  if (self->_enabled) {
    return 1;
  }
  if (!-[PCONUserClient enablePCON](self->_pconUserClient, "enablePCON")) {
    return 0;
  }
  BOOL v2 = 1;
  self->_enabled = 1;
  sleep(1u);
  return v2;
}

- (id)findHandle
{
  if (self->_type == 1) {
    return self->_iicDevice;
  }
  id v3 = -[PS190Instance findDevice](self, "findDevice");
  return v3;
}

- (id)findDevice
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v3 = +[PS190IODPDevice allDevices](&OBJC_CLASS___PS190IODPDevice, "allDevices", 0LL);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v9 = (id)[v8 rootPath];
        char v10 = [v9 isEqualToString:self->_rootPath];

        if ((v10 & 1) != 0)
        {
          id v11 = v8;
          goto LABEL_11;
        }
      }

      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  id v11 = 0LL;
LABEL_11:

  return v11;
}

- (id)description
{
  unint64_t type = self->_type;
  uint64_t v4 = (void *)NSString;
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  v7 = v6;
  if (type == 1)
  {
    v8 = -[PS190IICDevice serviceName](self->_iicDevice, "serviceName");
    id v9 = (id)[v4 stringWithFormat:@"<%@ %@>", v7, v8];
  }

  else
  {
    id v9 = (id)[v4 stringWithFormat:@"<%@ %@>", v6, self->_rootPath];
  }

  return v9;
}

- (unint64_t)type
{
  return self->_type;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
}

@end
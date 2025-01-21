@interface CBWHBAggregateDevice
- (CBDevice)latestDevice;
- (NSMutableDictionary)deviceControllerMap;
- (id)description;
- (void)setDeviceControllerMap:(id)a3;
- (void)setLatestDevice:(id)a3;
@end

@implementation CBWHBAggregateDevice

- (id)description
{
  v3 = self->_deviceControllerMap;
  v4 = self->_latestDevice;
  id v24 = 0LL;
  id v5 = [(id)objc_opt_class(self) description];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  NSAppendPrintF_safe(&v24, "%@: %@, Hosts %d", v6, v4, -[NSMutableDictionary count](v3, "count"));
  id v7 = v24;

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  v8 = -[NSMutableDictionary allKeys];
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
    v12 = " [";
    do
    {
      v13 = 0LL;
      v14 = v7;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)v13);
        id v19 = v14;
        NSAppendPrintF_safe(&v19, "%s%@", v12, v15);
        id v7 = v19;

        v13 = (char *)v13 + 1;
        v12 = ", ";
        v14 = v7;
      }

      while (v10 != v13);
      id v10 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
      v12 = ", ";
    }

    while (v10);

    id v18 = v7;
    NSAppendPrintF_safe(&v18, "]");
    v8 = v7;
    id v7 = v18;
  }

  id v16 = v7;
  return v16;
}

- (NSMutableDictionary)deviceControllerMap
{
  return self->_deviceControllerMap;
}

- (void)setDeviceControllerMap:(id)a3
{
}

- (CBDevice)latestDevice
{
  return self->_latestDevice;
}

- (void)setLatestDevice:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface CBPeripheral
- (BOOL)isSupportingService:(id)a3;
- (HKDevice)hkDevice;
- (void)setHkDevice:(id)a3;
@end

@implementation CBPeripheral

- (HKDevice)hkDevice
{
  return (HKDevice *)objc_getAssociatedObject(self, off_100070870);
}

- (void)setHkDevice:(id)a3
{
}

- (BOOL)isSupportingService:(id)a3
{
  id v4 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v5 = -[CBPeripheral services];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = (void *)[*(id *)(*((void *)&v12 + 1) + 8 * (void)i) UUID];
        unsigned __int8 v10 = [v4 isEqual:v9];

        if ((v10 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

@end
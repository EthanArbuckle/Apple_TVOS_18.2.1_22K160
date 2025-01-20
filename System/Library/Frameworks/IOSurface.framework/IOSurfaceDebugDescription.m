@interface IOSurfaceDebugDescription
+ (id)surfaceDescriptions;
@end

@implementation IOSurfaceDebugDescription

+ (id)surfaceDescriptions
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  outputStruct = 0LL;
  uint64_t input = 1LL;
  size_t v19 = -3LL;
  mach_port_t v2 = _ioSurfaceConnect();
  if (IOConnectCallMethod(v2, 0x1Eu, &input, 1u, 0LL, 0LL, 0LL, 0LL, &outputStruct, &v19)) {
    return 0LL;
  }
  CFTypeRef v4 = IOCFUnserializeBinary(outputStruct, v19, 0LL, 0LL, &errorString);
  if (!v4)
  {
    if (errorString)
    {
      NSLog(@"Failed to unserialize data from kernel: %@", errorString);
      CFRelease(errorString);
    }

    else
    {
      NSLog(@"Failed to unserialize data from kernel.");
    }

    mach_vm_deallocate(*MEMORY[0x1895FBBE0], (mach_vm_address_t)outputStruct, v19);
    return 0LL;
  }

  v5 = (void *)v4;
  mach_vm_deallocate(*MEMORY[0x1895FBBE0], (mach_vm_address_t)outputStruct, v19);
  id v6 = objc_alloc_init(MEMORY[0x189603FC8]);
  v7 = (void *)[v5 objectForKey:@"Kernel Surfaces"];
  if (v7)
  {
    id v8 = _copyDescriptions(v7);
    [v6 setObject:v8 forKey:&unk_189B60D40];
  }

  v9 = (void *)[v5 objectForKey:@"User Clients"];
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0LL; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v15 = [v14 objectForKey:@"pid"];
        if (v15)
        {
          uint64_t v16 = v15;
          id v17 = _copyDescriptions((void *)[v14 objectForKey:@"Client Surfaces"]);
          [v6 setObject:v17 forKey:v16];
        }
      }

      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v22 count:16];
    }

    while (v11);
  }

  return v6;
}

@end
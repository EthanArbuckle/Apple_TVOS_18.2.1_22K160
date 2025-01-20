uint64_t sub_1160(void *a1, io_iterator_t iterator)
{
  uint64_t result;
  io_registry_entry_t v5;
  uint64_t v6;
  io_object_t v7;
  UEIRemoteIRInterface *v8;
  result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    v5 = result;
    do
    {
      v6 = sub_14BC(v5);
      if ((_DWORD)v6)
      {
        v7 = v6;
        v8 = -[UEIRemoteIRInterface initWithDeviceRef:]( objc_alloc(&OBJC_CLASS___UEIRemoteIRInterface),  "initWithDeviceRef:",  v6);
        if (v8) {
          [a1 addInterface:v8];
        }
        IOObjectRelease(v7);
      }

      IOObjectRelease(v5);
      result = IOIteratorNext(iterator);
      v5 = result;
    }

    while ((_DWORD)result);
  }

  return result;
}

uint64_t sub_11FC(void *a1, io_iterator_t iterator)
{
  v17 = a1;
  uint64_t result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    io_registry_entry_t v3 = result;
    do
    {
      uint64_t v4 = sub_14BC(v3);
      if ((_DWORD)v4)
      {
        io_object_t v5 = v4;
        v6 = (void *)objc_claimAutoreleasedReturnValue( +[UEIRemoteIRInterface getPropertyFromService:withKey:]( &OBJC_CLASS___UEIRemoteIRInterface,  "getPropertyFromService:withKey:",  v4,  @"LocationID"));
        unsigned int v7 = [v6 unsignedIntValue];
        id v8 = v17;
        v9 = (void *)objc_claimAutoreleasedReturnValue([v8 interfaces]);
        id v10 = [v9 copy];

        __int128 v21 = 0u;
        __int128 v22 = 0u;
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        id v11 = v10;
        id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v20;
          do
          {
            for (i = 0LL; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v20 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
            }

            id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
          }

          while (v13);
        }

        IOObjectRelease(v5);
      }

      IOObjectRelease(v3);
      uint64_t result = IOIteratorNext(iterator);
      io_registry_entry_t v3 = result;
    }

    while ((_DWORD)result);
  }

  return result;
}

uint64_t sub_14BC(io_registry_entry_t a1)
{
  kern_return_t ParentEntry;
  uint64_t v2;
  BOOL v3;
  io_registry_entry_t parent;
  io_registry_entry_t v6;
  v6 = 0;
  parent = 0;
  ParentEntry = IORegistryEntryGetParentEntry(a1, "IOService", &parent);
  v2 = 0LL;
  if (ParentEntry) {
    io_registry_entry_t v3 = 1;
  }
  else {
    io_registry_entry_t v3 = parent == 0;
  }
  if (!v3)
  {
    IORegistryEntryGetParentEntry(parent, "IOService", &v6);
    IOObjectRelease(parent);
    return v6;
  }

  return v2;
}

LABEL_20:
  return v14;
}

id objc_msgSend_vendorID(void *a1, const char *a2, ...)
{
  return [a1 vendorID];
}
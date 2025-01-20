id MergePersonalityDictionaryFromPathWithName(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  const char *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  id v28;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  id obj;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = v9;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue([v30 contentsOfDirectoryAtPath:v7 error:0]);
  v12 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  v31 = v11;
  v35 = v11;
  if (v12)
  {
    v13 = v12;
    v14 = *(void *)v37;
    v35 = v11;
    v32 = *(void *)v37;
    do
    {
      v15 = 0LL;
      v33 = v13;
      do
      {
        if (*(void *)v37 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue( [v7 stringByAppendingPathComponent:*(void *)(*((void *)&v36 + 1) + 8 * (void)v15)]);
        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 pathExtension]);
        v18 = [v17 isEqualToString:v8];

        if (v18)
        {
          v19 = objc_autoreleasePoolPush();
          v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v16));
          v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:v10]);
          if (v21)
          {
            v22 = (const char *)[v10 UTF8String];
            v23 = v10;
            v24 = v8;
            v25 = v7;
            printf("found %s in %s\n", v22, (const char *)[v16 UTF8String]);
            v26 = recursiveMerge(v35, v21, 3LL);
            v27 = objc_claimAutoreleasedReturnValue(v26);

            v35 = (id)v27;
            v7 = v25;
            v8 = v24;
            v10 = v23;
            v14 = v32;
            v13 = v33;
          }

          objc_autoreleasePoolPop(v19);
        }

        v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      v13 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }

    while (v13);
  }

  v28 = v35;
  return v28;
}

id recursiveMerge(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  v7 = v6;
  if (!v5)
  {
    id v12 = v6;
LABEL_6:
    id v11 = v12;
    goto LABEL_7;
  }

  if (!v6)
  {
    id v12 = v5;
    goto LABEL_6;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v5));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = __recursiveMerge_block_invoke;
  v14[3] = &unk_1000042B0;
  id v15 = v5;
  uint64_t v17 = a3;
  id v9 = v8;
  id v16 = v9;
  [v7 enumerateKeysAndObjectsUsingBlock:v14];
  v10 = v16;
  id v11 = v9;

LABEL_7:
  return v11;
}

id GetMergePersonalityNameForDriver(io_registry_entry_t a1)
{
  CFProperty = (void *)IORegistryEntryCreateCFProperty(a1, @"mt-merge-personality", kCFAllocatorDefault, 0);
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(CFProperty, v2) & 1) != 0) {
    id v3 = CFProperty;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

uint64_t CreateIteratorForDriverOfType(IONotificationPort *a1, CFAbsoluteTime *a2)
{
  io_iterator_t notification = 0;
  Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  id v5 = CFDictionaryCreateMutable( kCFAllocatorDefault,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(v5, @"HID Bootloadable", kCFBooleanTrue);
  CFDictionarySetValue(Mutable, @"IOPropertyMatch", v5);
  if (a2) {
    *a2 = CFAbsoluteTimeGetCurrent();
  }
  if (!IOServiceAddMatchingNotification( a1,  "IOServiceMatched",  Mutable,  (IOServiceMatchingCallback)DriverAppeared,  a2,  &notification)) {
    return notification;
  }
  syslog(3, "Failed to create matching iterator\n");
  return 0LL;
}

void DriverAppeared(double *a1, uint64_t a2)
{
  if (a1) {
    double v3 = CFAbsoluteTimeGetCurrent() - *a1;
  }
  else {
    double v3 = 0.0;
  }
  if (MergePropertiesWithIterator(a2))
  {
    syslog(5, "Found the mt driver after %f seconds. Exiting.\n", v3);
    Main = CFRunLoopGetMain();
    CFRunLoopStop(Main);
  }
}

void MergePropertiesForDriver(void *a1, io_service_t a2, void *a3)
{
  kern_return_t v7;
  __int128 v8;
  size_t outputStructCnt;
  io_connect_t connect;
  _BYTE __b[516];
  int inputStruct;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  id v5 = a1;
  id v6 = a3;
  if (v5)
  {
    connect = 0;
    if (!IOServiceOpen(a2, mach_task_self_, 0, &connect))
    {
      v7 = IOConnectSetCFProperties(connect, v5);
      if (v7) {
        syslog( 3, "Merge properties for %s returned error 0x%08x\n", (const char *)[v6 UTF8String], v7);
      }
      *(void *)&v8 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v43 = v8;
      v44 = v8;
      v41 = v8;
      v42 = v8;
      v39 = v8;
      v40 = v8;
      v37 = v8;
      v38 = v8;
      v35 = v8;
      v36 = v8;
      v33 = v8;
      v34 = v8;
      v31 = v8;
      v32 = v8;
      v29 = v8;
      v30 = v8;
      v28 = v8;
      v27 = v8;
      v26 = v8;
      v25 = v8;
      v24 = v8;
      v23 = v8;
      v22 = v8;
      v21 = v8;
      v20 = v8;
      v19 = v8;
      v18 = v8;
      uint64_t v17 = v8;
      id v16 = v8;
      id v15 = v8;
      v14 = v8;
      v13 = v8;
      memset(__b, 170, sizeof(__b));
      inputStruct = 1;
      outputStructCnt = 516LL;
      IOConnectCallStructMethod(connect, 4u, &inputStruct, 0x204uLL, __b, &outputStructCnt);
      IOServiceClose(connect);
    }
  }
}

uint64_t MergePropertiesWithIterator(uint64_t result)
{
  if ((_DWORD)result)
  {
    io_iterator_t v1 = result;
    io_object_t v2 = IOIteratorNext(result);
    if (v2)
    {
      io_registry_entry_t v3 = v2;
      char v4 = 0;
      do
      {
        id MergePersonalityNameForDriver = GetMergePersonalityNameForDriver(v3);
        id v6 = (void *)objc_claimAutoreleasedReturnValue(MergePersonalityNameForDriver);
        if (v6)
        {
          v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
          id v8 = MergePersonalityDictionaryFromPathWithName( @"/usr/share/firmware/multitouch/",  @"mtprops",  v7,  v6);
          id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

          id v10 = MergePersonalityDictionaryFromPathWithName( @"/var/mobile/Library/Application Support/Multitouch/",  @"dycal",  v9,  v6);
          id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

          MergePropertiesForDriver(v11, v3, v6);
          char v4 = 1;
        }

        IOObjectRelease(v3);

        io_registry_entry_t v3 = IOIteratorNext(v1);
      }

      while (v3);
    }

    else
    {
      char v4 = 0;
    }

    return v4 & 1;
  }

  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  io_registry_entry_t v3 = (CFAbsoluteTime *)malloc(8uLL);
  IONotificationPortRef v4 = IONotificationPortCreate(0);
  if (v4)
  {
    id v5 = v4;
    id v6 = (void *)os_transaction_create("com.apple.mtmergeprops.transaction");
    Current = CFRunLoopGetCurrent();
    RunLoopSource = IONotificationPortGetRunLoopSource(v5);
    CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
    uint64_t IteratorForDriverOfType = CreateIteratorForDriverOfType(v5, v3);
    io_object_t v10 = IteratorForDriverOfType;
    if ((MergePropertiesWithIterator(IteratorForDriverOfType) & 1) != 0)
    {
      syslog(5, "Successfully merged properties. Exiting.\n");
      id v11 = 0LL;
    }

    else
    {
      id v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, &_dispatch_main_q);
      if (v11)
      {
        dispatch_time_t v13 = dispatch_time(0LL, 60000000000LL);
        dispatch_source_set_timer(v11, v13, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        dispatch_source_set_event_handler(v11, &__block_literal_global);
        dispatch_resume(v11);
        CFRunLoopRun();
      }

      else
      {
        syslog(3, "Failed to create dispatch timer. Exiting.\n");
      }
    }

    IONotificationPortDestroy(v5);
    if (v10) {
      IOObjectRelease(v10);
    }
    if (v11) {

    }
    if (v3) {
      free(v3);
    }

    return 0;
  }

  else
  {
    free(v3);
    syslog(3, "Failed to create IONotificationPort\n");
    return -1;
  }

void __main_block_invoke(id a1)
{
  Main = CFRunLoopGetMain();
  CFRunLoopStop(Main);
}

void __recursiveMerge_block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v15 = a2;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKey:v15]);
  if (!v8) {
    goto LABEL_6;
  }
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
  {
    uint64_t v10 = recursiveMerge(v8, v7, *(void *)(a1 + 48));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    [*(id *)(a1 + 40) setObject:v11 forKey:v15];

    goto LABEL_7;
  }

  uint64_t v12 = objc_opt_class(v7);
  char isKindOfClass = objc_opt_isKindOfClass(v8, v12);
  uint64_t v14 = *(void *)(a1 + 48);
  if ((isKindOfClass & 1) != 0)
  {
    if ((v14 & 1) == 0) {
      goto LABEL_7;
    }
LABEL_6:
    [*(id *)(a1 + 40) setObject:v7 forKey:v15];
    goto LABEL_7;
  }

  if ((v14 & 2) != 0)
  {
    [*(id *)(a1 + 40) removeAllObjects];
    *a4 = 1;
  }

LABEL_7:
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}
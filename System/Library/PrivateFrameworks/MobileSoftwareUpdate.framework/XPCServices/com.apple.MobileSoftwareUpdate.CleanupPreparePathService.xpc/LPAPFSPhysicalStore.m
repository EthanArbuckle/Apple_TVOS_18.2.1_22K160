@interface LPAPFSPhysicalStore
+ (id)supportedContentTypes;
- (id)container;
- (id)parent;
- (int)role;
@end

@implementation LPAPFSPhysicalStore

+ (id)supportedContentTypes
{
  id v5 = a1;
  SEL v4 = a2;
  if (a1 == (id)objc_opt_class(&OBJC_CLASS___LPAPFSPhysicalStore))
  {
    v7[0] = LPAPFSPhysicalStoreMediaUUID[0];
    v7[1] = LPAPFSPhysicalStoreDiagsMediaUUID[0];
    v7[2] = LPAPFSPhysicalStoreRecoveryMediaUUID[0];
    v6 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 3LL);
  }

  else
  {
    v3.receiver = v5;
    v3.super_class = (Class)&OBJC_METACLASS___LPAPFSPhysicalStore;
    v6 = (NSArray *)objc_msgSendSuper2(&v3, "supportedContentTypes");
  }

  return v6;
}

- (int)role
{
  SEL v4 = "-[LPAPFSPhysicalStore role]";
  location[2] = self;
  location[1] = (id)a2;
  location[0] = -[LPMedia content](self, "content");
  if (!location[0])
  {
    uint64_t v9 = _os_log_pack_size(12LL);
    v8 = &v3;
    uint64_t v7 = v9;
    uint64_t v6 = (uint64_t)&v3 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v5 = _os_log_pack_fill(v6, v9, 0LL, &_mh_execute_header, "%s : Failed to get content type.", v3);
    __os_log_helper_1_2_1_8_32(v5, (uint64_t)v4);
    _LPLogPack(1, v6);
    goto LABEL_8;
  }

  if (([location[0] isEqualToString:LPAPFSPhysicalStoreDiagsMediaUUID[0]] & 1) == 0)
  {
    if ([location[0] isEqualToString:LPAPFSPhysicalStoreRecoveryMediaUUID[0]])
    {
      int v12 = 2;
      int v10 = 1;
      goto LABEL_9;
    }

- (id)parent
{
  uint64_t v17 = 0LL;
  v18 = "-[LPAPFSPhysicalStore parent]";
  v33 = self;
  SEL v32 = a2;
  iterator = &v31;
  io_iterator_t v31 = 0;
  if (IORegistryEntryCreateIterator(-[LPMedia ioMedia](self, "ioMedia"), "IOService", 3u, &v31))
  {
    uint64_t v30 = _os_log_pack_size(12LL);
    v29 = v6;
    uint64_t v28 = v30;
    uint64_t v27 = (uint64_t)v6 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v26 = _os_log_pack_fill(v27, v30, 0LL, &_mh_execute_header, "%s : Unable to get the iterator for entry.", v6[0]);
    __os_log_helper_1_2_1_8_32(v26, (uint64_t)v18);
    _LPLogPack(1, v27);
    v34 = 0LL;
  }

  else
  {
    io_object_t v25 = 0;
    unsigned __int8 v24 = 0;
    v23 = 0LL;
    while (1)
    {
      io_object_t v25 = IOIteratorNext(v31);
      int v16 = 0;
      if (v25) {
        int v16 = v24 ^ 1;
      }
      if ((v16 & 1) == 0) {
        break;
      }
      if (IOObjectConformsTo(v25, "IOMedia"))
      {
        CFStringRef CFProperty = 0LL;
        CFStringRef CFProperty = (CFStringRef)IORegistryEntryCreateCFProperty(v25, @"Content", 0LL, 0);
        if (CFProperty)
        {
          CFTypeID v15 = CFGetTypeID(CFProperty);
          if (v15 == CFStringGetTypeID())
          {
            int v12 = v20;
            memset(v20, 0, sizeof(v20));
            id v13 =  +[LPPartitionMedia contentTypesForPartitionMedia]( &OBJC_CLASS___LPPartitionMedia,  "contentTypesForPartitionMedia");
            id v14 = [v13 countByEnumeratingWithState:v20 objects:v35 count:16];
            if (v14)
            {
              uint64_t v9 = *(void *)v20[2];
              uint64_t v10 = v17;
              id v11 = v14;
              while (1)
              {
                unint64_t v7 = (unint64_t)v11;
                uint64_t v8 = v10;
                if (*(void *)v20[2] != v9) {
                  objc_enumerationMutation(v13);
                }
                CFStringRef v21 = 0LL;
                CFStringRef v21 = *(CFStringRef *)(v20[1] + 8 * v8);
                if (CFStringCompare(v21, CFProperty, 0LL) == kCFCompareEqualTo)
                {
                  v2 = objc_alloc(&OBJC_CLASS___LPPartitionMedia);
                  objc_super v3 = -[LPMedia initWithIOMediaObject:](v2, "initWithIOMediaObject:", v25);
                  SEL v4 = v23;
                  v23 = v3;

                  unsigned __int8 v24 = 1;
                }

                uint64_t v10 = v8 + 1;
                id v11 = (id)v7;
                if (v8 + 1 >= v7)
                {
                  uint64_t v10 = v17;
                  id v11 = [v13 countByEnumeratingWithState:v20 objects:v35 count:16];
                  if (!v11) {
                    break;
                  }
                }
              }
            }
          }

          CFRelease(CFProperty);
        }
      }
    }

    v6[1] = (const char *)&v23;
    v34 = v23;
    objc_storeStrong((id *)&v23, 0LL);
  }

  return v34;
}

- (id)container
{
  uint64_t v8 = "-[LPAPFSPhysicalStore container]";
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  uint64_t v9 = &v19;
  io_iterator_t v19 = 0;
  if (IORegistryEntryCreateIterator(-[LPMedia ioMedia](self, "ioMedia"), "IOService", 1u, &v19))
  {
    uint64_t v18 = _os_log_pack_size(12LL);
    uint64_t v17 = &v5;
    uint64_t v16 = v18;
    uint64_t v15 = (uint64_t)&v5 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v14 = _os_log_pack_fill(v15, v18, 0LL, &_mh_execute_header, "%s : Unable to get the iterator for entry.", v5);
    __os_log_helper_1_2_1_8_32(v14, (uint64_t)v8);
    _LPLogPack(1, v15);
    id v21 = 0LL;
    int v13 = 1;
  }

  else
  {
    io_object_t v12 = 0;
    unsigned __int8 v11 = 0;
    while (1)
    {
      io_object_t v12 = IOIteratorNext(v19);
      int v7 = 0;
      if (v12) {
        int v7 = v11 ^ 1;
      }
      if ((v7 & 1) == 0) {
        break;
      }
      if (IOObjectConformsTo(v12, "IOMedia"))
      {
        id CFProperty = (id)IORegistryEntryCreateCFProperty(v12, @"Content", 0LL, 0);
        if (CFProperty)
        {
          CFTypeID v6 = CFGetTypeID(CFProperty);
          if (v6 == CFStringGetTypeID()
            && ([CFProperty isEqualToString:LPAPFSContainerMediaTypeUUID[0]] & 1) != 0)
          {
            v2 = -[LPMedia initWithIOMediaObject:]( objc_alloc(&OBJC_CLASS___LPAPFSContainer),  "initWithIOMediaObject:",  v12);
            id v3 = location[0];
            location[0] = v2;

            unsigned __int8 v11 = 1;
          }

          CFRelease(CFProperty);
        }
      }

      IOObjectRelease(v12);
    }

    IOObjectRelease(v19);
    id v21 = location[0];
    int v13 = 1;
  }

  objc_storeStrong(location, 0LL);
  return v21;
}

@end
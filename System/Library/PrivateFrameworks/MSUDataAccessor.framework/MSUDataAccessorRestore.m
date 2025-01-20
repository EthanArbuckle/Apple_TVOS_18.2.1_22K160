@interface MSUDataAccessorRestore
- (id)copyMountPointForVolumeType:(int)a3 error:(id *)a4;
- (id)copyPathForPersonalizedData:(int)a3 error:(id *)a4;
- (id)findVolumesWithRole:(int)a3;
- (id)getVolumeWithUUID:(id)a3;
- (id)specialCaseAPTicketForRamdiskWithError:(id *)a3;
@end

@implementation MSUDataAccessorRestore

- (id)copyMountPointForVolumeType:(int)a3 error:(id *)a4
{
  v15 = self;
  SEL v14 = a2;
  int v13 = a3;
  v12 = a4;
  unsigned int v11 = 0;
  if (a3)
  {
    if (a3 != 1)
    {
      +[MSUDataAccessor buildErrorForRef:code:description:]( &OBJC_CLASS___MSUDataAccessor,  "buildErrorForRef:code:description:",  v12,  6000LL,  @"Unknown volume type");
      return 0LL;
    }

    unsigned int v11 = 13;
  }

  else
  {
    unsigned int v11 = 6;
  }

  id v10 = -[MSUDataAccessorRestore findVolumesWithRole:](v15, "findVolumesWithRole:", v11);
  id v9 = 0LL;
  if ([v10 count] == 1)
  {
    id v4 = (id)[v10 objectAtIndex:0];
    id v5 = v9;
    id v9 = v4;

    id location = (id)[v9 mountPoint];
    if (location)
    {
      id v16 = location;
    }

    else
    {
      +[MSUDataAccessor buildErrorForRef:code:description:]( &OBJC_CLASS___MSUDataAccessor,  "buildErrorForRef:code:description:",  v12,  6003LL,  @"Volume not mounted");
      id v16 = 0LL;
    }

    int v8 = 1;
    objc_storeStrong(&location, 0LL);
  }

  else
  {
    if ((unint64_t)[v10 count] <= 1) {
      +[MSUDataAccessor buildErrorForRef:code:description:]( &OBJC_CLASS___MSUDataAccessor,  "buildErrorForRef:code:description:",  v12,  6003LL,  @"Missing volume");
    }
    else {
      +[MSUDataAccessor buildErrorForRef:code:description:]( &OBJC_CLASS___MSUDataAccessor,  "buildErrorForRef:code:description:",  v12,  6003LL,  @"Too many volumes");
    }
    id v16 = 0LL;
    int v8 = 1;
  }

  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(&v10, 0LL);
  return v16;
}

- (id)specialCaseAPTicketForRamdiskWithError:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  v27 = self;
  SEL v26 = a2;
  v25 = a3;
  id v24 = @"/private/var/Keychains/apticket.der";
  id v13 = (id)[MEMORY[0x1896078A8] defaultManager];
  char v14 = [v13 fileExistsAtPath:v24];

  if ((v14 & 1) != 0)
  {
    if (v25) {
      id *v25 = 0LL;
    }
    id v22 = (id)[MEMORY[0x189603F48] dataWithContentsOfFile:v24 options:0 error:v25];
    if (!v22)
    {
      id v28 = 0LL;
      int v23 = 1;
LABEL_27:
      objc_storeStrong(&v22, 0LL);
      goto LABEL_28;
    }

    id v20 = @"sha1";
    id v19 = @"sha2-384";
    v21 = (void *)MGCopyAnswer();
    if (!v21)
    {
      +[MSUDataAccessor buildErrorForRef:code:description:]( &OBJC_CLASS___MSUDataAccessor,  "buildErrorForRef:code:description:",  v25,  6005LL,  @"Failed to boot manifest hash");
      id v28 = 0LL;
      int v23 = 1;
LABEL_26:
      objc_storeStrong(&v19, 0LL);
      objc_storeStrong(&v20, 0LL);
      goto LABEL_27;
    }

    CFTypeID v12 = CFGetTypeID(v21);
    if (v12 != CFDataGetTypeID())
    {
      CFRelease(v21);
      +[MSUDataAccessor buildErrorForRef:code:description:]( &OBJC_CLASS___MSUDataAccessor,  "buildErrorForRef:code:description:",  v25,  6005LL,  @"Bad type in response to boot manifest hash query");
      id v28 = 0LL;
      int v23 = 1;
      goto LABEL_26;
    }

    id v18 = v21;
    v21 = (void *)MGCopyAnswer();
    id location = 0LL;
    if (v21)
    {
      CFTypeID v11 = CFGetTypeID(v21);
      if (v11 != CFStringGetTypeID())
      {
        CFRelease(v21);
        +[MSUDataAccessor buildErrorForRef:code:description:]( &OBJC_CLASS___MSUDataAccessor,  "buildErrorForRef:code:description:",  v25,  6005LL,  @"Bad type in response to crypto hash method query");
        id v28 = 0LL;
        int v23 = 1;
        goto LABEL_25;
      }

      id v3 = location;
      id location = v21;
    }

    else
    {
      objc_storeStrong(&location, v20);
    }

    memset(__b, 0, sizeof(__b));
    uint64_t v16 = 0LL;
    if ([location isEqualToString:v20])
    {
      data = (void *)[v22 bytes];
      CC_SHA1(data, [v22 length], __b);
      uint64_t v16 = 20LL;
LABEL_21:
      id v15 = (id)[MEMORY[0x189603F48] dataWithBytesNoCopy:__b length:v16 freeWhenDone:0];
      if ([v15 isEqualToData:v18])
      {
        id v28 = v24;
      }

      else
      {
        id v5 = v25;
        id v6 = (id)[NSString stringWithFormat:@"Found apticket at %@ but it does not match the boot manifest hash", v24];
        +[MSUDataAccessor buildErrorForRef:code:description:]( &OBJC_CLASS___MSUDataAccessor,  "buildErrorForRef:code:description:",  v5,  6006LL);

        id v28 = 0LL;
      }

      int v23 = 1;
      objc_storeStrong(&v15, 0LL);
      goto LABEL_25;
    }

    if ([location isEqualToString:v19])
    {
      id v9 = (void *)[v22 bytes];
      CC_SHA384(v9, [v22 length], __b);
      uint64_t v16 = 48LL;
      goto LABEL_21;
    }

    v7 = v25;
    id v8 = (id)[NSString stringWithFormat:@"Unsupported crypto hash method %@", location];
    +[MSUDataAccessor buildErrorForRef:code:description:]( &OBJC_CLASS___MSUDataAccessor,  "buildErrorForRef:code:description:",  v7,  6005LL);

    id v28 = 0LL;
    int v23 = 1;
LABEL_25:
    objc_storeStrong(&location, 0LL);
    objc_storeStrong(&v18, 0LL);
    goto LABEL_26;
  }

  id v28 = 0LL;
  int v23 = 1;
LABEL_28:
  objc_storeStrong(&v24, 0LL);
  return v28;
}

- (id)copyPathForPersonalizedData:(int)a3 error:(id *)a4
{
  id v15 = self;
  SEL v14 = a2;
  unsigned int v13 = a3;
  CFTypeID v12 = a4;
  id v11 = 0LL;
  if (a3 == 2)
  {
    id v4 =  -[MSUDataAccessorRestore specialCaseAPTicketForRamdiskWithError:]( v15,  "specialCaseAPTicketForRamdiskWithError:",  v12);
    id v5 = v11;
    id v11 = v4;
  }

  if (!v11)
  {
    v10.receiver = v15;
    v10.super_class = (Class)&OBJC_CLASS___MSUDataAccessorRestore;
    id v6 = -[MSUDataAccessor copyPathForPersonalizedData:error:](&v10, sel_copyPathForPersonalizedData_error_, v13, v12);
    id v7 = v11;
    id v11 = v6;
  }

  id v9 = v11;
  objc_storeStrong(&v11, 0LL);
  return v9;
}

- (id)getVolumeWithUUID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v16 = (id)[MEMORY[0x189616A78] allMedia];
  memset(__b, 0, sizeof(__b));
  id obj = v16;
  uint64_t v11 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
  if (v11)
  {
    uint64_t v7 = *(void *)__b[2];
    uint64_t v8 = 0LL;
    unint64_t v9 = v11;
    while (1)
    {
      uint64_t v6 = v8;
      if (*(void *)__b[2] != v7) {
        objc_enumerationMutation(obj);
      }
      id v15 = 0LL;
      id v15 = *(id *)(__b[1] + 8 * v8);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        id v13 = 0LL;
        id v13 = v15;
        id v4 = (id)[v13 mediaUUID];
        char v5 = [v4 isEqualToString:location[0]];

        if ((v5 & 1) != 0)
        {
          id v18 = v13;
          int v12 = 1;
        }

        else
        {
          int v12 = 0;
        }

        objc_storeStrong(&v13, 0LL);
        if (v12) {
          break;
        }
      }

      ++v8;
      if (v6 + 1 >= v9)
      {
        uint64_t v8 = 0LL;
        unint64_t v9 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
        if (!v9) {
          goto LABEL_12;
        }
      }
    }
  }

  else
  {
LABEL_12:
    int v12 = 0;
  }

  if (!v12) {
    id v18 = 0LL;
  }
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(location, 0LL);
  return v18;
}

- (id)findVolumesWithRole:(int)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v18 = self;
  SEL v17 = a2;
  int v16 = a3;
  id v15 = (id)[MEMORY[0x189603FA8] array];
  memset(__b, 0, sizeof(__b));
  id obj = (id)[MEMORY[0x189616A78] allMedia];
  uint64_t v11 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
  if (v11)
  {
    uint64_t v7 = *(void *)__b[2];
    uint64_t v8 = 0LL;
    unint64_t v9 = v11;
    while (1)
    {
      uint64_t v6 = v8;
      if (*(void *)__b[2] != v7) {
        objc_enumerationMutation(obj);
      }
      id v14 = 0LL;
      id v14 = *(id *)(__b[1] + 8 * v8);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        id location = 0LL;
        id location = v14;
        int v3 = [location role];
        if (v3 == v16) {
          [v15 addObject:location];
        }
        objc_storeStrong(&location, 0LL);
      }

      ++v8;
      if (v6 + 1 >= v9)
      {
        uint64_t v8 = 0LL;
        unint64_t v9 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
        if (!v9) {
          break;
        }
      }
    }
  }

  id v5 = v15;
  objc_storeStrong(&v15, 0LL);
  return v5;
}

@end
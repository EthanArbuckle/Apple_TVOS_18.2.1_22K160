uint64_t sub_100002660(int a1, char **a2)
{
  char *i;
  int v5;
  uint64_t v6;
  uint64_t v7;
  __IOHIDEventSystemClient *v8;
  IOHIDManagerRef v9;
  IOHIDManagerRef v10;
  CFArrayRef v11;
  CFArrayRef v12;
  NSMutableArray *v13;
  CFArrayRef v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSMutableDictionary *v21;
  int v22;
  CFSetRef v23;
  NSMutableArray *v24;
  CFSetRef v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSMutableDictionary *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  for (i = 0LL; ; i = optarg)
  {
    while (1)
    {
      v5 = getopt_long(a1, a2, "hnm:", (const option *)&off_1000082B8, 0LL);
      if (v5 != 110) {
        break;
      }
      byte_10000C290 = 1;
    }

    if (v5 == -1) {
      break;
    }
    if (v5 != 109)
    {
      if (v5 == 104)
      {
        puts( "\n List HID Event System services and devices\n \n Usage:\n \n hidutil list [--ndjson] [ --matching <matching> ]\n \n Flags:\n \n -n  --ndjson................print service/device information in ndjson format\n -m  --matching..............Set matching services/devices\n Input can be either json style dictionary or common\n device string e.g. keyboard, mouse, digitizer.\n Supported properties:\n ProductID        - numeric value (decimal or hex)\n VendorID         - numeric value (decimal or hex)\n LocationID       - numeric value (decimal or hex)\n PrimaryUsagePage - numeric value (decimal or hex)\n PrimaryUsage     - numeric value (decimal or hex)\n Transport        - string value\n Product          - string value\n For matching against generic properties, you will need to include\n the IOPropertyMatch key (see example below).\n Example strings:\n 'keyboard'\n 'digi'\n '{ProductID:0x8600,VendorID:0x5ac}'\n '[{ProductID:0x8600},{PrimaryUsagePage:1,PrimaryUsage:6}]'\n '{IOPropertyMatch:{ReportInterval:1000}}'\n \n Examples:\n \n hidutil list\n hidutil list --matching '{ProductID:0x54c}'\n hidutil list --matching '{ProductID:0x54c,VendorID:746}'");
        return 0LL;
      }

      return 1LL;
    }
  }

  v7 = IOHIDEventSystemClientCreateWithType(kCFAllocatorDefault, 4LL, 0LL);
  if (v7)
  {
    v8 = (__IOHIDEventSystemClient *)v7;
    v9 = IOHIDManagerCreate(kCFAllocatorDefault, 0);
    if (v9)
    {
      v10 = v9;
      if (i)
      {
      }

      else
      {
        IOHIDEventSystemClientSetMatching(v8, 0LL);
      }

      v11 = IOHIDEventSystemClientCopyServices(v8);
      if (v11)
      {
        v12 = v11;
        v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v14 = v12;
        v15 = -[__CFArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v34,  v38,  16LL);
        if (v15)
        {
          v16 = v15;
          v17 = 0LL;
          v18 = *(void *)v35;
          do
          {
            v19 = 0LL;
            v20 = v17;
            do
            {
              if (*(void *)v35 != v18) {
                objc_enumerationMutation(v14);
              }
              v21 = sub_100003D94(*(__IOHIDServiceClient **)(*((void *)&v34 + 1) + 8LL * (void)v19));
              v17 = (void *)objc_claimAutoreleasedReturnValue(v21);

              if (v17) {
                -[NSMutableArray addObject:](v13, "addObject:", v17);
              }
              v19 = (char *)v19 + 1;
              v20 = v17;
            }

            while (v16 != v19);
            v16 = -[__CFArray countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v34,  v38,  16LL);
          }

          while (v16);
        }

        v22 = sub_1000029E8(v13, 0);
        if (v22) {
          goto LABEL_30;
        }
      }

      if (i)
      {
        if ((sub_1000045DC(v10, (uint64_t)i) & 1) == 0)
        {
LABEL_29:
          printf("bad matching string: %s\n", i);
LABEL_30:
          v6 = 1LL;
LABEL_46:
          CFRelease(v8);
          CFRelease(v10);
          return v6;
        }
      }

      else
      {
        IOHIDManagerSetDeviceMatching(v10, 0LL);
      }

      v23 = IOHIDManagerCopyDevices(v10);
      if (v23)
      {
        v24 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v25 = v23;
        v26 = -[__CFSet countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v34,  v38,  16LL);
        if (v26)
        {
          v27 = v26;
          v28 = 0LL;
          v29 = *(void *)v35;
          do
          {
            v30 = 0LL;
            v31 = v28;
            do
            {
              if (*(void *)v35 != v29) {
                objc_enumerationMutation(v25);
              }
              v32 = sub_100003EEC(*(__IOHIDDevice **)(*((void *)&v34 + 1) + 8LL * (void)v30));
              v28 = (void *)objc_claimAutoreleasedReturnValue(v32);

              if (v28) {
                -[NSMutableArray addObject:](v24, "addObject:", v28);
              }
              v30 = (char *)v30 + 1;
              v31 = v28;
            }

            while (v27 != v30);
            v27 = -[__CFSet countByEnumeratingWithState:objects:count:]( v25,  "countByEnumeratingWithState:objects:count:",  &v34,  v38,  16LL);
          }

          while (v27);
        }

        v6 = sub_1000029E8(v24, 1);
      }

      else
      {
        v6 = 0LL;
      }

      goto LABEL_46;
    }

    CFRelease(v8);
  }

  return 1LL;
}

uint64_t sub_1000029E8(void *a1, int a2)
{
  id v3 = a1;
  v4 = v3;
  if ((byte_10000C290 & 1) == 0)
  {
    for (uint64_t i = 0LL; i != 44; i += 4LL)
      *(&off_10000C128 + i + 2) = (__CFString *)-[__CFString length](*(&off_10000C128 + i + 3), "length");
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    id obja = v4;
    id v20 = [obja countByEnumeratingWithState:&v54 objects:v64 count:16];
    v44 = v4;
    if (v20)
    {
      id v21 = v20;
      id v22 = 0LL;
      uint64_t v23 = *(void *)v55;
      do
      {
        v24 = 0LL;
        v25 = v22;
        do
        {
          if (*(void *)v55 != v23) {
            objc_enumerationMutation(obja);
          }
          id v22 = *(id *)(*((void *)&v54 + 1) + 8LL * (void)v24);

          for (uint64_t j = 0LL; j != 44; j += 4LL)
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:(&off_10000C128)[j]]);
            id v28 = sub_100004768(v27, (uint64_t)*(&off_10000C128 + j + 1));
            v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
            v30 = (__CFString *)[v29 length];

            if (v30 > *(&off_10000C128 + j + 2)) {
              *(&off_10000C128 + j + 2) = v30;
            }
          }

          v24 = (char *)v24 + 1;
          v25 = v22;
        }

        while (v24 != v21);
        id v21 = [obja countByEnumeratingWithState:&v54 objects:v64 count:16];
      }

      while (v21);

      v4 = v44;
    }

    if (a2) {
      v31 = "Devices:";
    }
    else {
      v31 = "Services:";
    }
    puts(v31);
    for (uint64_t k = 0LL; k != 44; k += 4LL)
      printf( "%-*s",  *((_DWORD *)&off_10000C128 + 2 * k + 4) + 1,  (const char *)-[__CFString cStringUsingEncoding:](*(&off_10000C128 + k + 3), "cStringUsingEncoding:", 4LL));
    putchar(10);
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    id v45 = obja;
    id objb = [v45 countByEnumeratingWithState:&v50 objects:v63 count:16];
    if (objb)
    {
      id v33 = 0LL;
      uint64_t v46 = *(void *)v51;
      do
      {
        v34 = 0LL;
        v35 = v33;
        do
        {
          if (*(void *)v51 != v46) {
            objc_enumerationMutation(v45);
          }
          id v33 = *(id *)(*((void *)&v50 + 1) + 8LL * (void)v34);

          for (uint64_t m = 0LL; m != 44; m += 4LL)
          {
            if (-[__CFString isEqualToString:]( (&off_10000C128)[m],  "isEqualToString:",  @"Built-In")
              && (v37 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:(&off_10000C128)[m]]),
                  v37,
                  !v37))
            {
              v40 = @"0";
            }

            else
            {
              v38 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:(&off_10000C128)[m]]);
              id v39 = sub_100004768(v38, (uint64_t)*(&off_10000C128 + m + 1));
              v40 = (__CFString *)objc_claimAutoreleasedReturnValue(v39);
            }

            int v41 = *((_DWORD *)&off_10000C128 + 2 * m + 4) + 1;
            v42 = v40;
            printf("%-*s", v41, (const char *)-[__CFString UTF8String](v42, "UTF8String"));
          }

          putchar(10);
          v34 = (char *)v34 + 1;
          v35 = v33;
        }

        while (v34 != objb);
        id objb = [v45 countByEnumeratingWithState:&v50 objects:v63 count:16];
      }

      while (objb);

      v4 = v44;
    }

    putchar(10);
    goto LABEL_50;
  }

  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  id v5 = [v3 countByEnumeratingWithState:&v59 objects:v65 count:16];
  if (!v5)
  {
LABEL_50:
    uint64_t v18 = 0LL;
    goto LABEL_51;
  }

  id v6 = v5;
  id v7 = 0LL;
  obuint64_t j = 0;
  uint64_t v8 = *(void *)v60;
  if (a2) {
    v9 = @"device";
  }
  else {
    v9 = @"service";
  }
  do
  {
    v10 = v4;
    v11 = 0LL;
    v12 = v7;
    do
    {
      if (*(void *)v60 != v8) {
        objc_enumerationMutation(v10);
      }
      id v7 = *(id *)(*((void *)&v59 + 1) + 8LL * (void)v11);

      v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v7));
      [v13 setObject:v9 forKeyedSubscript:@"type"];
      id v58 = 0LL;
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v13,  8LL,  &v58));
      id v15 = v58;
      v16 = v15;
      if (v15)
      {
        NSLog(@"NSJSONSerialization %@", v15);
        obuint64_t j = 1;
      }

      else
      {
        v17 = -[NSString initWithData:encoding:]( objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v14, 4LL);
        puts(-[NSString UTF8String](v17, "UTF8String"));
      }

      v11 = (char *)v11 + 1;
      v12 = v7;
    }

    while (v6 != v11);
    v4 = v10;
    id v6 = [v10 countByEnumeratingWithState:&v59 objects:v65 count:16];
  }

  while (v6);

  uint64_t v18 = obj;
LABEL_51:

  return v18;
}

uint64_t start(int a1, char **a2)
{
  if (a1 <= 1) {
    goto LABEL_2;
  }
  id v5 = a2[optind];
  if (!strcmp(v5, "help") || !strcmp(v5, "-h") || !strcmp(v5, "--help"))
  {
    puts( "\n Usage:\n \n hidutil [command]\n \n Available commands:\n help       - print this help message\n dump       - dump HID Event System state\n property   - read/write HID Event System property\n list       - list HID Event System services and devices\n \n Use hidutil [command] --help for more information about a command.");
    return 0LL;
  }

  else if (!strcmp(v5, "dump"))
  {
    return sub_10000391C(a1, a2);
  }

  else if (!strcmp(v5, "list"))
  {
    return sub_100002660(a1, a2);
  }

  else
  {
    if (strcmp(v5, "property"))
    {
      printf("Unknown command: %s\n", v5);
LABEL_2:
      puts( "\n Usage:\n \n hidutil [command]\n \n Available commands:\n help       - print this help message\n dump       - dump HID Event System state\n property   - read/write HID Event System property\n list       - list HID Event System services and devices\n \n Use hidutil [command] --help for more information about a command.");
      return 1LL;
    }

    return sub_1000035C0(a1, a2);
  }
}

void sub_10000304C(void *a1)
{
  id v1 = a1;
  if ([v1 UTF8String]) {
    printf("%s", (const char *)[v1 UTF8String]);
  }
}

uint64_t sub_100003098(uint64_t a1, void *a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000030F0;
  v3[3] = &unk_100008338;
  v3[4] = a1;
  [a2 enumerateKeysAndObjectsUsingBlock:v3];
  return 0LL;
}

void sub_1000030F0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  key = a2;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@:%@\n", key, v5));
  sub_10000304C(v6);

  IOHIDEventSystemClientSetProperty(*(IOHIDEventSystemClientRef *)(a1 + 32), key, v5);
}

uint64_t sub_100003174(__IOHIDEventSystemClient *a1, void *a2)
{
  id v3 = a2;
  CFArrayRef v4 = IOHIDEventSystemClientCopyServices(a1);
  if (v4)
  {
    printf("%-8s  %-20s  %s\n", "RegistryID", "Key", "Value");
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v5 = v4;
    id v6 = -[__CFArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(__IOHIDServiceClient **)(*((void *)&v18 + 1) + 8LL * (void)i);
          CFTypeRef RegistryID = IOHIDServiceClientGetRegistryID(v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue(RegistryID);
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472LL;
          v15[2] = sub_10000331C;
          v15[3] = &unk_100008360;
          id v16 = v12;
          v17 = v10;
          id v13 = v12;
          [v3 enumerateKeysAndObjectsUsingBlock:v15];
        }

        id v7 = -[__CFArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
      }

      while (v7);
    }
  }

  return 0LL;
}

void sub_10000331C(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  key = a2;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%-8lx   %-20@   %@\n",  [v5 unsignedLongValue],  key,  v6));
  sub_10000304C(v7);

  IOHIDServiceClientSetProperty(*(IOHIDServiceClientRef *)(a1 + 40), key, v6);
}

uint64_t sub_1000033BC(__IOHIDEventSystemClient *a1, const __CFString *a2)
{
  v2 = (void *)IOHIDEventSystemClientCopyProperty(a1, a2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@\n", v2));
  sub_10000304C(v3);

  return 0LL;
}

uint64_t sub_100003414(__IOHIDEventSystemClient *a1, void *a2)
{
  id v3 = a2;
  CFArrayRef v4 = IOHIDEventSystemClientCopyServices(a1);
  if (v4)
  {
    printf("%-8s  %-20s  %s\n", "RegistryID", "Key", "Value");
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v16 = v4;
    id v5 = v4;
    id v6 = -[__CFArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(__IOHIDServiceClient **)(*((void *)&v17 + 1) + 8LL * (void)i);
          v11 = (void *)IOHIDServiceClientCopyProperty(v10, v3);
          CFTypeRef RegistryID = IOHIDServiceClientGetRegistryID(v10);
          id v13 = (void *)objc_claimAutoreleasedReturnValue(RegistryID);
          v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%-8lx   %-20@   %@\n",  [v13 unsignedLongValue],  v3,  v11));
          sub_10000304C(v14);
        }

        id v7 = -[__CFArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
      }

      while (v7);
    }

    CFArrayRef v4 = v16;
  }

  return 0LL;
}

uint64_t sub_1000035C0(int a1, char *const *a2)
{
  uint64_t v4 = IOHIDEventSystemClientCreateWithType(kCFAllocatorDefault, 4LL, 0LL);
  if (v4)
  {
    id v5 = (__IOHIDEventSystemClient *)v4;
    uint64_t v20 = 0LL;
    uint64_t v6 = 0LL;
    char v7 = 0;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          int v8 = getopt_long(a1, a2, "hm:g:s:", (const option *)&off_100008380, 0LL);
          if (v8 != 109) {
            break;
          }
          char v7 = sub_100004544((uint64_t)v5, (uint64_t)optarg);
          if ((v7 & 1) == 0) {
            printf("bad matching string: %s\n", optarg);
          }
        }

        if (v8 <= 103) {
          break;
        }
        if (v8 != 115)
        {
          if (v8 == 104)
          {
            puts( "\n Read/Write HID Event System property\n \n Usage:\n \n hidutil property [ --matching <matching> ][ --get <key> ][ --set <key> ]\n \n Flags:\n \n -g  --get...................Get property with key (where key is string value)\n -s  --set...................Set property (key/value pair JSON style dictionary)\n -m  --matching..............Set matching services/devices\n Input can be either json style dictionary or common\n device string e.g. keyboard, mouse, digitizer.\n Supported properties:\n ProductID        - numeric value (decimal or hex)\n VendorID         - numeric value (decimal or hex)\n LocationID       - numeric value (decimal or hex)\n PrimaryUsagePage - numeric value (decimal or hex)\n PrimaryUsage     - numeric value (decimal or hex)\n Transport        - string value\n Product          - string value\n For matching against generic properties, you will need to include\n the IOPropertyMatch key (see example below).\n Example strings:\n 'keyboard'\n 'digi'\n '{ProductID:0x8600,VendorID:0x5ac}'\n '[{ProductID:0x8600},{PrimaryUsagePage:1,PrimaryUsage:6} ]'\n '{IOPropertyMatch:{ReportInterval:1000}}'\n \n Examples:\n \n hidutil property --matching '{ProductID:0x54c}' --get HIDPointerAcceleration\n hidutil property --matching '{ProductID:0x54c,VendorID:746}' --set '{HIDPointerAcceleration: 0}'\n hidutil property --get HIDPointerAcceleration");
            uint64_t v16 = 0LL;
          }

          else
          {
LABEL_23:
            uint64_t v16 = 1LL;
          }

          __int128 v17 = (void *)v20;
          goto LABEL_27;
        }

        uint64_t v11 = sub_100004060(optarg);
        __int128 v19 = (__CFString *)v6;
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        id v13 = sub_100004200(v12);
        uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);

        uint64_t v6 = (uint64_t)v19;
        if (v14)
        {
          uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          uint64_t v20 = v14;
          if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0) {
            continue;
          }
        }

        printf("\nERROR!!!! Unable to create property object for '%s'\n", optarg);
        uint64_t v20 = v14;
      }

      if (v8 == -1) {
        break;
      }
      if (v8 != 103) {
        goto LABEL_23;
      }
      uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", optarg));
      v10 = (void *)v6;
      uint64_t v6 = v9;
    }

    __int128 v17 = (void *)v20;
    if (v6 | v20)
    {
      if (!v6 || !v20)
      {
        if (v20)
        {
          [(id)v20 enumerateKeysAndObjectsUsingBlock:&stru_100008440];
          if ((v7 & 1) != 0)
          {
            sub_100003174(v5, (void *)v20);
          }

          else
          {
            v21[0] = _NSConcreteStackBlock;
            v21[1] = 3221225472LL;
            v21[2] = sub_1000030F0;
            v21[3] = &unk_100008338;
            v21[4] = v5;
            [(id)v20 enumerateKeysAndObjectsUsingBlock:v21];
          }

          uint64_t v16 = 0LL;
        }

        else
        {
          if ((v7 & 1) != 0) {
            sub_100003414(v5, (void *)v6);
          }
          else {
            sub_1000033BC(v5, (const __CFString *)v6);
          }
          uint64_t v16 = 0LL;
          __int128 v17 = 0LL;
        }

        goto LABEL_27;
      }
    }

    else
    {
      __int128 v17 = 0LL;
      uint64_t v6 = 0LL;
    }

    uint64_t v16 = 1LL;
LABEL_27:
    CFRelease(v5);

    return v16;
  }

  return 1LL;
}

id sub_100003844(void *a1, const char *a2)
{
  return [a1 enumerateKeysAndObjectsUsingBlock:&stru_100008440];
}

void sub_100003850(id a1, NSString *a2, id a3, BOOL *a4)
{
  char v7 = a2;
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      if (-[NSString isEqualToString:](v7, "isEqualToString:", @"UserKeyMapping")
        || -[NSString isEqualToString:](v7, "isEqualToString:", @"HIDKeyboardModifierMappingPairs"))
      {
        if ((_IOHIDIsRestrictedRemappingProperty(v5) & 1) == 0) {
          goto LABEL_10;
        }
      }

      else if (!-[NSString isEqualToString:](v7, "isEqualToString:", @"CtrlKeyboardUsageMap") {
             || !_IOHIDIsRestrictedRemappingProperty(v5))
      }
      {
        goto LABEL_10;
      }

      if (IOHIDCheckAccess(kIOHIDRequestTypeListenEvent)) {
        puts( "Attempt to remap alphanumerics / special characters. If setting fails, ensure Terminal has input monitoring permissions. ");
      }
    }
  }

LABEL_10:
}

uint64_t sub_10000391C(int a1, char **a2)
{
  uint64_t v4 = sub_100003BA8;
LABEL_2:
  id v5 = v4;
  while (1)
  {
    while (1)
    {
      int v6 = getopt_long(a1, a2, "o:f:h", (const option *)&off_100008460, 0LL);
      if (v6 <= 110) {
        break;
      }
      if (v6 == 111)
      {
        if (dword_10000C288 >= 3) {
          close(dword_10000C288);
        }
        dword_10000C288 = open(optarg, 513, 420LL);
        if (dword_10000C288 == -1)
        {
          puts("Error opening output file");
          return 1LL;
        }
      }
    }

    if (v6 == -1) {
      break;
    }
    if (v6 == 102)
    {
      char v7 = optarg;
      int v8 = strcmp(optarg, "xml");
      uint64_t v4 = sub_100003BA8;
      if (v8)
      {
        int v9 = strcmp(v7, "text");
        uint64_t v4 = sub_100003C50;
        if (v9) {
          uint64_t v4 = v5;
        }
      }

      goto LABEL_2;
    }

    if (v6 == 104)
    {
      puts( "\n Dump HID Event System state\n \n Usage:\n \n hidutil dump [object] [flags]\n \n Examples:\n \n hidutil dump system -f xml\n hidutil dump system -o /tmp/state_dump.txt -f text\n \n Object:\n \n system.....................HID Event System\n clients....................HID Event System Clients\n services...................HID Event System services\n \n Flags:\n \n -f  --format ..............Format type (xml, text)\n -o  --output...............Output file (or stdout if not specified)");
      return 0LL;
    }
  }

  uint64_t v10 = optind + 1LL;
  if ((_DWORD)v10 == a1 || (uint64_t v11 = a2[v10], !strcmp(v11, "system")))
  {
    id v13 = sub_100003CE8;
  }

  else if (!strcmp(v11, "clients"))
  {
    id v13 = sub_100003D7C;
  }

  else
  {
    if (strcmp(v11, "services"))
    {
      printf("unrecognized object: %s\n", v11);
      goto LABEL_29;
    }

    id v13 = sub_100003D88;
  }

  uint64_t v14 = IOHIDEventSystemClientCreateWithType(kCFAllocatorDefault, 4LL, 0LL);
  qword_10000C298 = v14;
  if (v14)
  {
    IOHIDEventSystemClientSetMatching(v14, &off_100008C28);
    qword_10000C2A0 = (uint64_t)CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    if (qword_10000C2A0)
    {
      v13();
      if (v5) {
        v5();
      }
      uint64_t v12 = 0LL;
      goto LABEL_30;
    }
  }

  else
  {
    puts("Unable to create client");
  }

LABEL_29:
  uint64_t v12 = 1LL;
LABEL_30:
  if (qword_10000C298) {
    CFRelease((CFTypeRef)qword_10000C298);
  }
  if (qword_10000C2A0) {
    CFRelease((CFTypeRef)qword_10000C2A0);
  }
  if (dword_10000C288 >= 3) {
    close(dword_10000C288);
  }
  return v12;
}

void sub_100003BA8()
{
  Data = CFPropertyListCreateData( kCFAllocatorDefault,  (CFPropertyListRef)qword_10000C2A0,  kCFPropertyListXMLFormat_v1_0,  0LL,  0LL);
  if (Data)
  {
    id v1 = Data;
    int v2 = dword_10000C288;
    BytePtr = CFDataGetBytePtr(Data);
    size_t Length = CFDataGetLength(v1);
    ssize_t v5 = write(v2, BytePtr, Length);
    if (v5 != CFDataGetLength(v1)) {
      puts("Error writing to output.");
    }
    CFRelease(v1);
  }

void sub_100003C50()
{
  v0 = CFCopyDescription((CFTypeRef)qword_10000C2A0);
  if (v0)
  {
    id v1 = v0;
    int v2 = dword_10000C288;
    CStringPtr = CFStringGetCStringPtr(v0, 0x8000100u);
    size_t Length = CFStringGetLength(v1);
    ssize_t v5 = write(v2, CStringPtr, Length);
    if (v5 != CFStringGetLength(v1)) {
      puts("Error writing to output.");
    }
    CFRelease(v1);
  }

void sub_100003CE8()
{
}

void sub_100003D18(CFStringRef key)
{
  CFTypeRef v2 = IOHIDEventSystemClientCopyProperty((IOHIDEventSystemClientRef)qword_10000C298, key);
  if (v2)
  {
    CFDictionaryAddValue((CFMutableDictionaryRef)qword_10000C2A0, key, v2);
    CFRelease(v2);
  }

  else
  {
    CFDictionaryAddValue((CFMutableDictionaryRef)qword_10000C2A0, key, @"Unavailable");
  }

void sub_100003D7C()
{
}

void sub_100003D88()
{
}

NSMutableDictionary *sub_100003D94(__IOHIDServiceClient *a1)
{
  CFTypeRef v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (v2)
  {
    -[NSMutableDictionary setValue:forKey:]( v2,  "setValue:forKey:",  IOHIDServiceClientGetRegistryID(a1),  @"IORegistryEntryID");
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id v3 = [&off_100008CC8 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v12;
      do
      {
        for (uint64_t i = 0LL; i != v4; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v12 != v5) {
            objc_enumerationMutation(&off_100008CC8);
          }
          char v7 = *(const __CFString **)(*((void *)&v11 + 1) + 8LL * (void)i);
          int v8 = (void *)IOHIDServiceClientCopyProperty(a1, v7);
          -[NSMutableDictionary setValue:forKey:](v2, "setValue:forKey:", v8, v7);
        }

        id v4 = [&off_100008CC8 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v4);
    }

    int v9 = v2;
  }

  return v2;
}

NSMutableDictionary *sub_100003EEC(__IOHIDDevice *a1)
{
  CFTypeRef v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t entryID = 0xAAAAAAAAAAAAAAAALL;
  if (v2)
  {
    io_service_t Service = IOHIDDeviceGetService(a1);
    IORegistryEntryGetRegistryEntryID(Service, &entryID);
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  entryID));
    -[NSMutableDictionary setValue:forKey:](v2, "setValue:forKey:", v4, @"IORegistryEntryID");

    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id v5 = [&off_100008CC8 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        int v8 = 0LL;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(&off_100008CC8);
          }
          -[NSMutableDictionary setValue:forKey:]( v2,  "setValue:forKey:",  IOHIDDeviceGetProperty(a1, *(CFStringRef *)(*((void *)&v11 + 1) + 8LL * (void)v8)),  *(void *)(*((void *)&v11 + 1) + 8LL * (void)v8));
          int v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = [&off_100008CC8 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }

      while (v6);
    }

    int v9 = v2;
  }

  return v2;
}

id sub_100004064(uint64_t a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithUTF8String:](&OBJC_CLASS___NSMutableString, "stringWithUTF8String:", a1));
  uint64_t v17 = 0LL;
  CFTypeRef v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"0[xX][0-9a-f]+",  1LL,  &v17));
  uint64_t v3 = [v2 firstMatchInString:v1 options:0 range:[v1 length]];
  if (v3)
  {
    id v4 = (void *)v3;
    do
    {
      id v5 = [v4 range];
      uint64_t v7 = (void *)[v1 substringWithRange:v5, v6];
      int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](&OBJC_CLASS___NSScanner, "scannerWithString:", v7));

      uint64_t v16 = 0LL;
      [v8 scanHexLongLong:&v16];
      int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llu", v16));
      id v10 = [v4 range];
      [v1 replaceCharactersInRange:v10 withString:v11];
      id v12 = [v4 range];
      __int128 v13 = (char *)[v9 length] + (void)v12;

      uint64_t v14 = [v2 firstMatchInString:v1 options:0 range:(_BYTE *)[v1 length] - v13];
      id v4 = (void *)v14;
    }

    while (v14);
  }

  return v1;
}

id sub_100004200(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 dataUsingEncoding:4]);
  id v5 = 0LL;
  CFTypeRef v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v1,  1LL,  &v5));
  id v3 = v5;

  if (v3) {
    NSLog(@"NSJSONSerialization %@", v3);
  }

  return v2;
}

id sub_10000428C(uint64_t a1)
{
  id v1 = sub_100004064(a1);
  CFTypeRef v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  id v3 = v2;
  if (v2 && [v2 length])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 substringToIndex:1]);
    if ([v4 isEqual:@"["])
    {
    }

    else
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 substringToIndex:1]);
      unsigned int v7 = [v6 isEqual:@"{"];

      if (!v7)
      {
        id v10 = sub_1000043A0(v3);
        id v5 = (void *)objc_claimAutoreleasedReturnValue(v10);
        goto LABEL_9;
      }
    }

    int v8 = (void *)objc_claimAutoreleasedReturnValue([v3 dataUsingEncoding:4]);
    id v12 = 0LL;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v8,  1LL,  &v12));
    id v9 = v12;
  }

  else
  {
    id v5 = 0LL;
  }

LABEL_9:
  return v5;
}

id sub_1000043A0(void *a1)
{
  id v1 = a1;
  CFTypeRef v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "keyboard"));
  unsigned int v3 = [v2 containsString:v1];

  if (v3)
  {
    v17[0] = @"PrimaryUsagePage";
    v17[1] = @"PrimaryUsage";
    v18[0] = &off_100008C68;
    v18[1] = &off_100008C80;
    id v4 = (_UNKNOWN ***)v18;
    id v5 = (const __CFString **)v17;
LABEL_5:
    uint64_t v8 = 2LL;
    goto LABEL_6;
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "mouse"));
  unsigned int v7 = [v6 containsString:v1];

  if (v7)
  {
    v15[0] = @"PrimaryUsagePage";
    v15[1] = @"PrimaryUsage";
    v16[0] = &off_100008C68;
    v16[1] = &off_100008C98;
    id v4 = (_UNKNOWN ***)v16;
    id v5 = (const __CFString **)v15;
    goto LABEL_5;
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "digitizer"));
  unsigned int v12 = [v11 containsString:v1];

  if (!v12)
  {
    id v9 = 0LL;
    goto LABEL_7;
  }

  __int128 v13 = @"PrimaryUsagePage";
  uint64_t v14 = &off_100008CB0;
  id v4 = &v14;
  id v5 = &v13;
  uint64_t v8 = 1LL;
LABEL_6:
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v5,  v8));
LABEL_7:

  return v9;
}

uint64_t sub_100004544(uint64_t a1, uint64_t a2)
{
  id v3 = sub_10000428C(a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (!v4) {
    goto LABEL_7;
  }
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
    {
      IOHIDEventSystemClientSetMatchingMultiple(a1, v4);
      goto LABEL_6;
    }

LABEL_7:
    uint64_t v7 = 0LL;
    goto LABEL_8;
  }

  IOHIDEventSystemClientSetMatching(a1, v4);
LABEL_6:
  uint64_t v7 = 1LL;
LABEL_8:

  return v7;
}

  unsigned int v12 = 0LL;
  if (a1 && v9)
  {
    __int128 v13 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v9, v13) & 1) != 0)
    {
      IOHIDManagerSetDeviceMatching(a1, v9);
    }

    else
    {
      uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSArray);
      if ((objc_opt_isKindOfClass(v9, v14) & 1) == 0) {
        goto LABEL_14;
      }
      IOHIDManagerSetDeviceMatchingMultiple(a1, v9);
    }

    unsigned int v12 = 1LL;
  }

uint64_t sub_1000045DC(__IOHIDManager *a1, uint64_t a2)
{
  id v3 = sub_100004064(a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 substringToIndex:1]);
  if ([v5 isEqual:@"["])
  {
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 substringToIndex:1]);
    unsigned __int8 v7 = [v6 isEqual:@"{"];

    if ((v7 & 1) == 0)
    {
      id v11 = sub_1000043A0(v4);
      id v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(v11);
      goto LABEL_7;
    }
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 dataUsingEncoding:4]);
  id v16 = 0LL;
  id v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v8,  1LL,  &v16));
  id v10 = v16;

  if (v10)
  {
    NSLog(@"Serialization error: %@", v10);

LABEL_14:
    uint64_t v12 = 0LL;
    goto LABEL_15;
  }

LABEL_15:
  return v12;
}

id sub_100004768(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (a2) {
    BOOL v4 = v3 == 0LL;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4) {
    uint64_t v5 = &off_100008C50;
  }
  else {
    uint64_t v5 = v3;
  }
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    if (a2 == 16)
    {
      id v11 = [v5 longLongValue];
      unsigned __int8 v7 = @"0x%llx";
    }

    else
    {
      id v11 = [v5 unsignedLongValue];
      unsigned __int8 v7 = @"%lu";
    }

    uint64_t v8 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v7, v11);
  }

  else
  {
    uint64_t v8 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v5);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

BOOL sub_10000482C(void *a1, _DWORD *a2)
{
  id v3 = a1;
  unint64_t v4 = 0LL;
  __int128 v11 = unk_100008500;
  __int128 v12 = unk_100008510;
  __int128 v13 = unk_100008520;
  __int128 v9 = unk_1000084E0;
  __int128 v10 = unk_1000084F0;
  uint64_t v5 = (id *)&v9 + 1;
  BOOL v6 = 1;
  while (!objc_msgSend(*v5, "containsString:", v3, v9, v10, v11, v12, v13))
  {
    BOOL v6 = v4 < 4;
    v5 += 2;
    if (++v4 == 5)
    {
      BOOL v6 = 0;
      goto LABEL_6;
    }
  }

  *a2 = *((_DWORD *)v5 - 2);
LABEL_6:
  for (uint64_t i = 72LL; i != -8; i -= 16LL)

  return v6;
}

void sub_100004924( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  for (uint64_t i = 72LL; i != -8; i -= 16LL)

  _Unwind_Resume(a1);
}

NSMutableString *sub_100004954(void *a1)
{
  id v1 = a1;
  CFTypeRef v2 = objc_opt_new(&OBJC_CLASS___NSMutableString);
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v1, v3) & 1) != 0)
  {
    id v4 = v1;
    -[NSMutableString appendString:](v2, "appendString:", @"(");
    if ([v4 count])
    {
      uint64_t v5 = 0LL;
      do
      {
        BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:v5]);
        uint64_t v7 = sub_100004954();
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
        -[NSMutableString appendString:](v2, "appendString:", v8);

        ++v5;
      }

      while (v5 < [v4 count]);
    }

    -[NSMutableString appendString:](v2, "appendString:", @""));
  }

  else
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v1, v9) & 1) != 0)
    {
      -[NSMutableString appendString:](v2, "appendString:", @"{");
      id v22 = v1;
      id v10 = v1;
      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allKeys]);
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      id v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v24;
        do
        {
          for (uint64_t i = 0LL; i != v13; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v24 != v14) {
              objc_enumerationMutation(v11);
            }
            id v16 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
            -[NSMutableString appendFormat:](v2, "appendFormat:", @"%@:", v16);
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v16]);
            uint64_t v18 = sub_100004954();
            __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
            -[NSMutableString appendString:](v2, "appendString:", v19);

            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v11 lastObject]);
            if (v16 != v20) {
              -[NSMutableString appendString:](v2, "appendString:", @", ");
            }
          }

          id v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }

        while (v13);
      }

      -[NSMutableString appendString:](v2, "appendString:", @"}");

      id v1 = v22;
    }

    else
    {
      -[NSMutableString appendFormat:](v2, "appendFormat:", @"%@", v1);
    }
  }

  return v2;
}

BOOL sub_100004C14()
{
  return geteuid() == 0;
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}
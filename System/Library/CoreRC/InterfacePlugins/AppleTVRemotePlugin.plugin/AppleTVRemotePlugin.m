uint64_t sub_4730(void *a1, io_iterator_t iterator)
{
  uint64_t result;
  io_registry_entry_t v5;
  uint64_t v6;
  io_object_t v7;
  AppleTVRemoteIRInterface *v8;
  result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    v5 = result;
    do
    {
      v6 = sub_4A8C(v5);
      if ((_DWORD)v6)
      {
        v7 = v6;
        v8 = -[AppleTVRemoteIRInterface initWithDeviceRef:]( objc_alloc(&OBJC_CLASS___AppleTVRemoteIRInterface),  "initWithDeviceRef:",  v6);
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

uint64_t sub_47CC(void *a1, io_iterator_t iterator)
{
  v17 = a1;
  uint64_t result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    io_registry_entry_t v3 = result;
    do
    {
      uint64_t v4 = sub_4A8C(v3);
      if ((_DWORD)v4)
      {
        io_object_t v5 = v4;
        v6 = (void *)objc_claimAutoreleasedReturnValue( +[AppleTVRemoteIRInterface getPropertyFromService:withKey:]( &OBJC_CLASS___AppleTVRemoteIRInterface,  "getPropertyFromService:withKey:",  v4,  @"LocationID"));
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

uint64_t sub_4A8C(io_registry_entry_t a1)
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

LABEL_26:
      id v11 = 0;
      if (a5) {
        *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSMachErrorDomain,  -536870206LL,  0LL));
      }
LABEL_28:
      id v12 = (char *)v12 + 1;
    }

    while (v9 != v12);
    v16 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    v9 = v16;
  }

  while (v16);
LABEL_41:

  return v11 & 1;
}

LABEL_15:
    v23 = 0;
    goto LABEL_29;
  }

  if (!-[AppleTVRemoteIRInterface getButtonMaskV2:forCoreIRButtonCombo:error:]( self,  "getButtonMaskV2:forCoreIRButtonCombo:error:",  &v36,  v11,  a6)) {
    goto LABEL_15;
  }
LABEL_8:
  if (a5 < 0.0 || a5 > 25.5)
  {
    if (!a6)
    {
LABEL_35:
      v23 = 0;
      goto LABEL_36;
    }

    v24 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSMachErrorDomain,  -536870206LL,  0LL));
    v23 = 0;
    goto LABEL_28;
  }

  id v12 = vcvtmd_s64_f64((a5 + 0.05) / 0.1);
  if (v10)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 protocol]);
    uint64_t v14 = [v13 protocolID];

    v15 = (void *)objc_claimAutoreleasedReturnValue([v10 protocol]);
    v16 = [v15 options];

    v17 = bswap64((unint64_t)[v10 payload]);
    memset(v37, 0, 13);
    if (-[AppleTVRemoteIRInterface productID](self, "productID") == 614
      || -[AppleTVRemoteIRInterface productID](self, "productID") == 621)
    {
      v18 = 12LL;
      LOBYTE(v37[0]) = v36;
      __int128 v19 = 4LL;
      __int128 v20 = 3LL;
      __int128 v21 = 2LL;
      __int128 v22 = 1LL;
    }

    else
    {
      v18 = 13LL;
      LOWORD(v37[0]) = v36;
      __int128 v19 = 5LL;
      __int128 v20 = 4LL;
      __int128 v21 = 3LL;
      __int128 v22 = 2LL;
    }

    *(_BYTE *)((unint64_t)v37 | v22) = v12;
    *(_BYTE *)((unint64_t)v37 | v21) = v14;
    *(_BYTE *)((unint64_t)v37 | v20) = v16;
    *(void *)((unint64_t)v37 | v19) = v17;
    v26 = self;
    v27 = 1LL;
  }

  else
  {
    BYTE2(v37[0]) = 0;
    LOWORD(v37[0]) = 0;
    if (-[AppleTVRemoteIRInterface productID](self, "productID") == 614
      || -[AppleTVRemoteIRInterface productID](self, "productID") == 621)
    {
      LOBYTE(v37[0]) = v36;
      v18 = 2LL;
      v25 = 1LL;
    }

    else
    {
      LOWORD(v37[0]) = v36;
      v18 = 3LL;
      v25 = 2LL;
    }

    *((_BYTE *)v37 + v25) = v12;
    v26 = self;
    v27 = 2LL;
  }

  v28 = -[AppleTVRemoteIRInterface setReportID:buffer:length:](v26, "setReportID:buffer:length:", v27, v37, v18);
  v23 = v28 == 0;
  if (a6 && v28)
  {
    v24 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSMachErrorDomain,  v28,  0LL));
LABEL_28:
    *a6 = v24;
  }

LABEL_29:
  if (a6 && !v23)
  {
    if (gLogCategory_CoreRCInterface <= 90
      && (gLogCategory_CoreRCInterface != -1
       || _LogCategory_Initialize(&gLogCategory_CoreRCInterface, 90LL)))
    {
      LogPrintF(&gLogCategory_CoreRCInterface);
    }

    goto LABEL_35;
  }

LABEL_36:
  return v23;
}

LABEL_20:
  return v14;
}

LABEL_13:
    uint64_t v14 = 0;
    goto LABEL_19;
  }

  id v11 = vcvtmd_s64_f64((a4 + 0.05) / 0.1);
  v17 = 0;
  if (-[AppleTVRemoteIRInterface productID](self, "productID") == 614
    || -[AppleTVRemoteIRInterface productID](self, "productID") == 621)
  {
    LOBYTE(v17) = v18;
    BYTE1(v17) = v11;
    BYTE2(v17) = a5;
    id v12 = 3LL;
  }

  else
  {
    LOWORD(v17) = v18;
    BYTE2(v17) = v11;
    HIBYTE(v17) = a5;
    id v12 = 4LL;
  }

  v15 = -[AppleTVRemoteIRInterface setReportID:buffer:length:](self, "setReportID:buffer:length:", 3LL, &v17, v12);
  uint64_t v14 = v15 == 0;
  if (a6 && v15)
  {
    id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSMachErrorDomain,  v15,  0LL));
    goto LABEL_18;
  }

LABEL_19:
  return v14;
}

LABEL_6:
    unsigned int v7 = 0LL;
    return v7;
  }

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[AppleTVRemoteIRInterface uniqueID](self, "uniqueID"));
  return v7;
}

id objc_msgSend_vendorID(void *a1, const char *a2, ...)
{
  return [a1 vendorID];
}
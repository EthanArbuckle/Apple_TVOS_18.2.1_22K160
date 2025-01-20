BOOL sub_2FF0(void *a1, uint64_t a2, __IOHIDServiceClient *a3, uint64_t a4)
{
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  BOOL v11;
  v6 = a1;
  v7 = (void *)IOHIDServiceClientCopyProperty(a3, @"VendorID");
  v8 = (void *)IOHIDServiceClientCopyProperty(a3, @"ProductID");
  v9 = [v7 intValue];
  if (v9 == [v6 vendorId])
  {
    v10 = [v8 intValue];
    v11 = v10 == [v6 productId];
  }

  else
  {
    v11 = 0LL;
  }

  return v11;
}

LABEL_11:
  return ReportCount;
}

LABEL_36:
    v38 = 1;
    goto LABEL_42;
  }

  if (self->_isDriverLoaded) {
    -[SCROGenericHIDDriver unloadDriver](self, "unloadDriver");
  }
  v9 = (__IOHIDDevice *)[v4 hidDevice];
  if (!v9)
  {
    v41 = _SCROD_LOG(0LL, v10);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v40 = "Failed to load GenericHID braille driver because there is no hidDevice";
      goto LABEL_35;
    }

    goto LABEL_36;
  }

  self->_hidDevice = v9;
  device = v9;
  Property = IOHIDDeviceGetProperty(v9, @"DeviceUsagePairs");
  v12 = (void *)objc_claimAutoreleasedReturnValue(Property);
  -[SCROGenericHIDDriver setVendorId:](self, "setVendorId:", [v4 vendorId]);
  v13 = -[SCROGenericHIDDriver setProductId:](self, "setProductId:", [v4 productId]);
  v15 = _SCROD_LOG(v13, v14);
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (__IOHIDValue *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[SCROGenericHIDDriver vendorId](self, "vendorId")));
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[SCROGenericHIDDriver productId](self, "productId")));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v4 manufacturerName]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v4 productName]);
    *(_DWORD *)buf = 138413058;
    v78 = v17;
    v79 = 2112;
    v80 = v18;
    v81 = 2112;
    v82 = v19;
    v83 = 2112;
    v84 = v20;
    _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_DEFAULT,  "HID braille display: VendorID %@ and product id: %@, maker %@, product %@",  buf,  0x2Au);
  }

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v21 = v12;
  v22 = -[os_log_s countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v71,  v76,  16LL);
  if (!v22)
  {

    goto LABEL_38;
  }

  v23 = v22;
  v66 = self;
  v63 = v8;
  v64 = v4;
  v24 = 0;
  v25 = *(void *)v72;
  do
  {
    for (i = 0LL; i != v23; i = (char *)i + 1)
    {
      if (*(void *)v72 != v25) {
        objc_enumerationMutation(v21);
      }
      v27 = *(void **)(*((void *)&v71 + 1) + 8LL * (void)i);
      v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"DeviceUsagePage"]);
      v29 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"DeviceUsage"]);
      if ([v28 isEqual:&off_8530]
        && [v29 isEqual:&off_8590])
      {
        v66->_isLegacy = 1;
      }

      if ([v29 isEqual:&off_8590]
        && ([v28 isEqual:&off_8530] & 1) != 0
        || [v29 isEqual:&off_85A8]
        && ([v28 isEqual:&off_8530] & 1) != 0)
      {
        v30 = 1;
LABEL_23:
        v66->_keyboardInputSupported = v30;
        v24 = 1;
        goto LABEL_24;
      }

      if ([v29 isEqual:&off_85A8]
        && [v28 isEqual:&off_8530])
      {
        v30 = 0;
        goto LABEL_23;
      }

LABEL_24:
    }

    v23 = -[os_log_s countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v71,  v76,  16LL);
  }

  while (v23);

  v4 = v64;
  if ((v24 & 1) != 0)
  {
    v33 = IOHIDDeviceOpen(device, 0);
    if ((_DWORD)v33)
    {
      v35 = v33;
      v36 = _SCROD_LOG(v33, v34);
      v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v78) = v35 & 0x3FFF;
        _os_log_impl( &dword_0,  v37,  OS_LOG_TYPE_DEFAULT,  "Failed to load GenericHID braille driver because we failed to open the HIDDevice: %d",  buf,  8u);
      }

      v38 = 1;
    }

    else
    {
      -[SCROGenericHIDDriver _buildRankingTable](v66, "_buildRankingTable");
      Current = CFRunLoopGetCurrent();
      IOHIDDeviceScheduleWithRunLoop(device, Current, kCFRunLoopDefaultMode);
      IOHIDDeviceRegisterRemovalCallback(device, (IOHIDCallback)sub_3C00, v66);
      IOHIDDeviceRegisterInputValueCallback(v66->_hidDevice, (IOHIDValueCallback)sub_3CE4, v66);
      v66->_hidDevice = device;
      CFRetain(device);
      v66->_isDriverLoaded = 1;
      v45 = IOHIDDeviceCopyMatchingElements(v66->_hidDevice, (CFDictionaryRef)&off_8B78, 0);
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      v37 = v45;
      v46 = -[os_log_s countByEnumeratingWithState:objects:count:]( v37,  "countByEnumeratingWithState:objects:count:",  &v67,  v75,  16LL);
      if (v46)
      {
        v47 = v46;
        v48 = *(void *)v68;
        do
        {
          for (j = 0LL; j != v47; j = (char *)j + 1)
          {
            if (*(void *)v68 != v48) {
              objc_enumerationMutation(v37);
            }
            v50 = *(__IOHIDElement **)(*((void *)&v67 + 1) + 8LL * (void)j);
            if (IOHIDElementGetReportSize(v50) == 128)
            {
              v51 = mach_absolute_time();
              v52 = IOHIDValueCreateWithBytes(0LL, v50, v51, byte_D180, 16LL);
              if (v52)
              {
                v54 = v52;
                v55 = _SCROD_LOG(v52, v53);
                v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
                if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v78 = v54;
                  _os_log_impl(&dword_0, v56, OS_LOG_TYPE_DEFAULT, "Reported back screen reader: %@", buf, 0xCu);
                }

                IOHIDDeviceSetValue(v66->_hidDevice, v50, v54);
                CFRelease(v54);
              }
            }
          }

          v47 = -[os_log_s countByEnumeratingWithState:objects:count:]( v37,  "countByEnumeratingWithState:objects:count:",  &v67,  v75,  16LL);
        }

        while (v47);
      }

      v57 = IOHIDEventSystemClientCreate(kCFAllocatorDefault);
      v66->_ioSystemFilterClient = (__IOHIDEventSystemClient *)v57;
      v58 = CFRunLoopGetCurrent();
      IOHIDEventSystemClientScheduleWithRunLoop(v57, v58, kCFRunLoopDefaultMode);
      v59 = IOHIDEventSystemClientRegisterEventFilterCallbackWithPriority( v66->_ioSystemFilterClient,  1000LL,  sub_2FF0,  v66,  0LL);
      v61 = _SCROD_LOG(v59, v60);
      v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v78 = v21;
        _os_log_impl(&dword_0, v62, OS_LOG_TYPE_DEFAULT, "Successful load generic hid: %@", buf, 0xCu);
      }

      v38 = 0;
      v4 = v64;
      v8 = v63;
    }

    goto LABEL_41;
  }

LABEL_38:
  v42 = _SCROD_LOG(v31, v32);
  v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v78 = v21;
    _os_log_impl(&dword_0, v37, OS_LOG_TYPE_DEFAULT, "Could not match usage for generic hid: %@", buf, 0xCu);
  }

  v38 = 3;
LABEL_41:

LABEL_42:
  return v38;
}

void sub_3C00(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  uint64_t v4 = _SCROD_LOG(v2, v3);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    uint64_t v8 = a1;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Device removed: %@", (uint8_t *)&v7, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 postNotificationName:@"SCROBrailleDriverProtocolUnloadNotification" object:a1 userInfo:0];

  objc_autoreleasePoolPop(v2);
}

void sub_3CE4(void *a1, uint64_t a2, uint64_t a3, __IOHIDValue *a4)
{
  id v5 = a1;
  Element = IOHIDValueGetElement(a4);
  uint32_t Usage = IOHIDElementGetUsage(Element);
  uint64_t UsagePage = IOHIDElementGetUsagePage(Element);
  int v9 = UsagePage;
  uint64_t v11 = _SCROD_LOG(UsagePage, v10);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v44 = Usage;
    *(_WORD *)&v44[4] = 1024;
    *(_DWORD *)&v44[6] = v9;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "value callback: %d %d", buf, 0xEu);
  }

  if (*((_BYTE *)v5 + 89) && v9 == 65)
  {
    if ((Usage & 0xFFFFFF00) == 0x100)
    {
      uint64_t v13 = ((Usage << 8) - 0x10000) & 0xFFFEFFFF | ((IOHIDValueGetIntegerValue(a4) > 0) << 16);
      goto LABEL_7;
    }

    goto LABEL_22;
  }

  if (!*((_BYTE *)v5 + 89) && v9 == 65)
  {
    if (Usage - 513 <= 7)
    {
      int v14 = (Usage << 8) - 131328;
LABEL_19:
      uint64_t v13 = v14 & 0xFFFEFFFF | ((IOHIDValueGetIntegerValue(a4) > 0) << 16) | 2;
LABEL_31:
      objc_msgSend(*((id *)v5 + 10), "lock", (void)v38);
      v16 = (void *)*((void *)v5 + 9);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v13));
      [v16 addObject:v17];

      [*((id *)v5 + 10) unlock];
      goto LABEL_32;
    }

    if (Usage - 521 > 2)
    {
      if ((Usage & 0xFFFFFFFE) == 0x21A)
      {
LABEL_22:
        if (IOHIDValueGetIntegerValue(a4) <= 0) {
          int v15 = 6;
        }
        else {
          int v15 = 65542;
        }
        uint64_t v13 = v15 | (16 * Usage);
        goto LABEL_31;
      }

      if (Usage - 528 <= 0xE) {
        goto LABEL_42;
      }
      if (Usage != 5)
      {
        if (Usage != 256) {
          goto LABEL_32;
        }
        Parent = IOHIDElementGetParent(Element);
        CFArrayRef Children = IOHIDElementGetChildren(Parent);
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        id v22 = (id)objc_claimAutoreleasedReturnValue(Children);
        id v23 = [v22 countByEnumeratingWithState:&v38 objects:v42 count:16];
        if (v23)
        {
          id v24 = v23;
          uint64_t v25 = *(void *)v39;
          while (2)
          {
            for (i = 0LL; i != v24; i = (char *)i + 1)
            {
              if (*(void *)v39 != v25) {
                objc_enumerationMutation(v22);
              }
              v27 = *(__IOHIDElement **)(*((void *)&v38 + 1) + 8LL * (void)i);
              IOHIDElementCookie Cookie = IOHIDElementGetCookie(v27);
              if (Cookie == IOHIDElementGetCookie(Element))
              {
                unsigned int v37 = (objc_msgSend(v22, "indexOfObject:", v27, (void)v38) << 8) & 0xFFFEFFFF;
                uint64_t v13 = v37 | ((IOHIDValueGetIntegerValue(a4) > 0) << 16);
                goto LABEL_60;
              }
            }

            id v24 = [v22 countByEnumeratingWithState:&v38 objects:v42 count:16];
            if (v24) {
              continue;
            }
            break;
          }
        }

        uint64_t v13 = 0LL;
LABEL_60:

        goto LABEL_7;
      }

      CFIndex IntegerValue = IOHIDValueGetIntegerValue(a4);
      CFIndex v31 = IntegerValue;
      uint64_t v32 = 255LL;
      if (IntegerValue < 255) {
        uint64_t v32 = IntegerValue;
      }
      *((void *)v5 + 13) = v32 & ~(v32 >> 63);
      uint64_t v33 = _SCROD_LOG(IntegerValue, v30);
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v31));
        *(_DWORD *)buf = 138412290;
        *(void *)v44 = v35;
        _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEFAULT, "Number of Braille cells set to %@", buf, 0xCu);
      }

      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v36 postNotificationName:@"SCROBrailleDriverProtocolConfigurationChangeNotification" object:v5 userInfo:0];

      goto LABEL_32;
    }

LABEL_28:
    if (IOHIDValueGetIntegerValue(a4) <= 0) {
      uint64_t v13 = 2050LL;
    }
    else {
      uint64_t v13 = 67586LL;
    }
    goto LABEL_31;
  }

  if (v9 == 7)
  {
    if (!*((_BYTE *)v5 + 89) || Usage != 44) {
      goto LABEL_32;
    }
    goto LABEL_28;
  }

  if (v9 == 9)
  {
    if (*((_BYTE *)v5 + 89) && Usage && Usage <= 8)
    {
      int v14 = (Usage << 8) - 256;
      goto LABEL_19;
    }

    if (*((_BYTE *)v5 + 89)) {
      goto LABEL_32;
    }
    IOHIDElementRef v18 = IOHIDElementGetParent(Element);
    if (v18)
    {
      v19 = v18;
      while (IOHIDElementGetType(v19) != kIOHIDElementTypeCollection
           || IOHIDElementGetUsagePage(v19) != 65
           || IOHIDElementGetUsage(v19) != 6)
      {
        v19 = IOHIDElementGetParent(v19);
        if (!v19) {
          goto LABEL_42;
        }
      }

      uint64_t v13 = (uint64_t)[v5 _eventForScreenReaderControl:a4];
      if ((_DWORD)v13) {
        goto LABEL_31;
      }
    }

LABEL_42:
    uint64_t v13 = (uint64_t)[v5 _eventForGenericControl:a4];
LABEL_7:
    if (!(_DWORD)v13) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }

LABEL_32:
}

void sub_4A7C(id a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableIndexSet indexSetWithIndexesInRange:]( &OBJC_CLASS___NSMutableIndexSet,  "indexSetWithIndexesInRange:",  768LL,  113LL));
  [v4 removeIndex:768];
  [v4 removeIndex:784];
  [v4 removeIndex:800];
  [v4 removeIndex:816];
  [v4 removeIndex:832];
  objc_msgSend(v4, "removeIndexesInRange:", 779, 5);
  objc_msgSend(v4, "removeIndexesInRange:", 796, 4);
  objc_msgSend(v4, "removeIndexesInRange:", 808, 8);
  objc_msgSend(v4, "removeIndexesInRange:", 822, 10);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_4BAC;
  v5[3] = &unk_82B8;
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v6 = v1;
  [v4 enumerateIndexesUsingBlock:v5];
  v2 = (void *)qword_D1F0;
  qword_D1F0 = (uint64_t)v1;
  id v3 = v1;
}

void sub_4BAC(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a2));
  [v2 addObject:v3];
}

id sub_4BF8(uint64_t a1, unint64_t a2, void *a3)
{
  id v4 = a3;
  if ((unint64_t)[v4 count] <= a2)
  {
    id v5 = [(id)qword_D1F0 mutableCopy];
    [v5 removeObjectsInArray:v4];
    int v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", a2 % (unint64_t)objc_msgSend(v5, "count")));
    id v6 = [v7 unsignedIntegerValue];
  }

  else
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:a2]);
    id v6 = [v5 unsignedIntegerValue];
  }

  return v6;
}
}

BOOL sub_5424(id a1, SCROGenericHIDControlInfo *a2, unint64_t a3, BOOL *a4)
{
  return -[SCROGenericHIDControlInfo controlType](a2, "controlType", a3, a4) == 0;
}

BOOL sub_5444(id a1, SCROGenericHIDControlInfo *a2, unint64_t a3, BOOL *a4)
{
  return (char *)-[SCROGenericHIDControlInfo controlType](a2, "controlType", a3, a4) == (char *)&dword_0 + 1;
}

BOOL sub_5464(id a1, SCROGenericHIDControlInfo *a2, unint64_t a3, BOOL *a4)
{
  return (char *)-[SCROGenericHIDControlInfo controlType](a2, "controlType", a3, a4) == (char *)&dword_0 + 2;
}

uint64_t sub_57EC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v5 collectionUsage]));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [&off_8C68 indexOfObject:v7] != (id)0x7FFFFFFFFFFFFFFFLL));

  int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v6 collectionUsage]));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [&off_8C68 indexOfObject:v9] != (id)0x7FFFFFFFFFFFFFFFLL));

  uint64_t v11 = (uint64_t)[v8 compare:v10];
  if (v11) {
    goto LABEL_2;
  }
  unsigned int v13 = [v5 usagePage];
  if (v13 == [v6 usagePage])
  {
    if (objc_msgSend( *(id *)(a1 + 32),  "usage:isSameClassAsUsage:forUsagePage:",  objc_msgSend(v5, "usage"),  objc_msgSend(v6, "usage"),  objc_msgSend(v5, "usagePage")))
    {
      int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v6 instanceNumber]));
      int v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v5 instanceNumber]));
      uint64_t v11 = (uint64_t)[v14 compare:v15];

      if (v11) {
        goto LABEL_2;
      }
    }
  }

  if ([v5 controlType] != (char *)&dword_0 + 1)
  {
    if ([v5 controlType] != (char *)&dword_0 + 2)
    {
      if ([v5 controlType])
      {
LABEL_25:
        uint64_t v11 = 0LL;
        goto LABEL_2;
      }

      unsigned int v23 = [v5 usagePage];
      if (v23 != [v6 usagePage])
      {
        if ([v5 usagePage] == 65)
        {
          uint64_t v11 = 1LL;
          goto LABEL_2;
        }

        if ([v6 usagePage] == 65)
        {
          uint64_t v11 = -1LL;
          goto LABEL_2;
        }
      }

      v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v5 usage]));
      if ([&off_8CB0 indexOfObject:v26] == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  0LL));
      }

      else
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v5 usage]));
        v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [&off_8CB0 indexOfObject:v28]));
      }

      v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v6 usage]));
      if ([&off_8CB0 indexOfObject:v29] == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  0LL));
      }

      else
      {
        CFIndex v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v6 usage]));
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [&off_8CB0 indexOfObject:v31]));
      }

      uint64_t v11 = (uint64_t)[v27 compare:v30];
      if (v11
        || [v5 usagePage] == 9
        && [v6 usagePage] == 9
        && (v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v6 usage])),  v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  objc_msgSend(v5, "usage"))),  uint64_t v11 = (uint64_t)objc_msgSend(v32, "compare:", v33),  v33,  v32,  v11))
      {

        goto LABEL_2;
      }

      goto LABEL_25;
    }

    IOHIDElementRef v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v5 usage]));
    if ([&off_8C98 indexOfObject:v18] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", 0LL));
    }

    else
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v5 usage]));
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [&off_8C98 indexOfObject:v24]));
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v6 usage]));
    if ([&off_8C98 indexOfObject:v20] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v6 usage]));
      id v22 = &off_8C98;
      goto LABEL_23;
    }

LABEL_21:
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", 0LL));
    goto LABEL_24;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v5 usage]));
  if ([&off_8C80 indexOfObject:v16] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", 0LL));
  }

  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v5 usage]));
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [&off_8C80 indexOfObject:v19]));
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v6 usage]));
  if ([&off_8C80 indexOfObject:v20] == (id)0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_21;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v6 usage]));
  id v22 = &off_8C80;
LABEL_23:
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v22 indexOfObject:v21]));

LABEL_24:
  uint64_t v11 = (uint64_t)[v17 compare:v25];

  if (!v11) {
    goto LABEL_25;
  }
LABEL_2:

  return v11;
}

id objc_msgSend_vendorId(void *a1, const char *a2, ...)
{
  return [a1 vendorId];
}
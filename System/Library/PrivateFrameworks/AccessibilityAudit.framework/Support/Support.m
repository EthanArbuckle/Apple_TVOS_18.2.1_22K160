void sub_100001BD0(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  v1 = objc_opt_new(*(void *)(a1 + 32));
  v2 = (void *)qword_10001A2A0;
  qword_10001A2A0 = v1;
}

id sub_100001C88(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerForNotifications:1];
}
}

void sub_10000240C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100002424(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100002434(uint64_t a1)
{
}

id sub_10000243C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _atvEventFilter:a2];
}

void sub_100002560(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8 = a5;
  id v10 = v8;
  if ((_DWORD)a3 == 1028)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[AXEventRepresentation representationWithData:]( &OBJC_CLASS___AXEventRepresentation,  "representationWithData:",  a4));
  }

  else if ((_DWORD)a3 == 1053)
  {
    if ([v8 snarfingEvents])
    {
      [v10 _handleAccessibilityNotification:1053 forElement:a4];
      [v10 _handleNativeFocusItemChangedNotification:a4];
    }
  }

  else
  {
    [v8 _handleAccessibilityNotification:a3 forElement:a2];
  }
}

void sub_100002B28(uint64_t a1)
{
  uint64_t v1 = objc_opt_new(*(void *)(a1 + 32));
  v2 = (void *)qword_10001A2B0;
  qword_10001A2B0 = v1;
}

void sub_100002DAC(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[XADDisplayManager sharedManager](&OBJC_CLASS___XADDisplayManager, "sharedManager"));
  [v1 setCursorFrameForElement:0];
}

void sub_100002DE4(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[XADDisplayManager sharedManager](&OBJC_CLASS___XADDisplayManager, "sharedManager"));
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _currentElement]);
  [v3 setCursorFrameForElement:v2];
}

void sub_100002FA8(id a1)
{
  id v1 = (void *)qword_10001A2C8;
  qword_10001A2C8 = (uint64_t)&__NSArray0__struct;
}

void sub_10000382C(uint64_t a1, uint64_t a2)
{
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%i",  @"AXAction-",  a2));
  v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _humanReadableStringForAction:a2]);
  id v5 =  [*(id *)(a1 + 32) addAttribute:v6 toSection:*(void *)(a1 + 40) withPrefix:@"Action" performsAction:1 settable:0 humanReadable:v4 valueType:1 overrideIsInternalWithValue:&__kCFBooleanFalse];
}

void sub_100003F04(_Unwind_Exception *a1)
{
}

void sub_100003F48(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateElementHighlight];
}

void sub_100003F74(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateElementHighlight];
}

void sub_100003FA0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateElementHighlight];
}

id sub_100003FCC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerForNotificationsIfNecessary:1];
}

void sub_100004180(void *a1, uint64_t a2)
{
  v8[0] = @"focused";
  id v3 = a1;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a2));
  v8[1] = @"assistiveTech";
  v9[0] = v4;
  v9[1] = @"AXAudit";
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  2LL));

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 uiElement]);
  [v6 setAXAttribute:2018 withObject:v5 synchronous:0];

  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 elementForAttribute:2092]);
  if (v7) {
    sub_100004180(v7, a2);
  }
}

id sub_1000047E8(void *a1)
{
  id v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue([v1 uiElement]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectWithAXAttribute:5019]);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[AXAuditElement auditElementWithElement:identifier:]( &OBJC_CLASS___AXAuditElement,  "auditElementWithElement:identifier:",  v1,  v3));
  id v5 = sub_1000048F8(v1);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (const __AXUIElement *)[v1 elementRef];

  id v8 = sub_100006390(v7, (const __CFString *)0x836);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSArray, v10);
  if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0) {
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
  }
  else {
    v12 = &stru_100015310;
  }
  id v13 = [[AXAuditNode alloc] initWithAuditElement:v4 description:v6 roleDescription:v12];

  return v13;
}

id sub_1000048F8(void *a1)
{
  id v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  id v3 = sub_100006390((const __AXUIElement *)[v1 elementRef], (const __CFString *)0x836);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSArray, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v8)
    {
      id v10 = v8;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v7);
          }
          id v13 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
          uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString, v9);
          if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0 && [v13 length])
          {
            if ([v2 length]) {
              [v2 appendFormat:@", %@", v13];
            }
            else {
              [v2 appendString:v13];
            }
          }
        }

        id v10 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }

      while (v10);
    }
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue([v1 label]);
  if (![v15 length])
  {
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v1 value]);

    v15 = (void *)v16;
  }

  if ([v15 length])
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v15, v2));
    [v2 setString:v17];
LABEL_19:

    goto LABEL_20;
  }

  pid_t pid = 0;
  if (AXUIElementGetPid((AXUIElementRef)[v1 elementRef], &pid) == kAXErrorSuccess && pid >= 1)
  {
    mach_port_name_t v27 = 0;
    if (!task_for_pid(mach_task_self_, pid, &v27))
    {
      id v19 = sub_100006390((const __AXUIElement *)[v1 elementRef], (const __CFString *)0x13B5);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v19);
      uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSString, v20);
      if ((objc_opt_isKindOfClass(v17, v21) & 1) != 0) {
        [v2 appendFormat:@"<%@>", v17];
      }
      goto LABEL_19;
    }
  }

LABEL_20:
  return v2;
}

NSMutableArray *sub_100004B9C(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 children]);
  v2 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v3 = v1;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0LL;
    uint64_t v7 = *(void *)v13;
LABEL_3:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(v3);
      }
      id v9 = sub_1000047E8(*(void **)(*((void *)&v12 + 1) + 8 * v8));
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      -[NSMutableArray addObject:](v2, "addObject:", v10, (void)v12);

      if (v5 == (id)++v8)
      {
        id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
        v6 += v8;
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v2;
}

id sub_100004CE4(void *a1, int a2, int a3)
{
  id v4 = a1;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = 0LL;
    uint64_t v7 = 0LL;
    uint64_t v8 = v4;
    while (1)
    {
      id v9 = v6;

      id v10 = sub_1000047E8(v8);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

      if (a2 && !v7 && v6)
      {
        __int128 v12 = sub_100004B9C(v8);
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        if ([v13 count])
        {
          __int128 v14 = -[NSMutableArray initWithArray:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithArray:", v13);
          -[NSMutableArray removeObject:](v14, "removeObject:", v9);
          -[NSMutableArray insertObject:atIndex:](v14, "insertObject:atIndex:", v9, 0LL);
          [v11 setChildren:v14];
        }
      }

      else if (!v9)
      {
        if (!a3) {
          goto LABEL_14;
        }
        uint64_t v21 = sub_100004B9C(v8);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v21);
        if ([v17 count]) {
LABEL_12:
        }
          [v11 setChildren:v17];

        goto LABEL_14;
      }

      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v11 children]);
      id v16 = [v15 count];

      if (!v16)
      {
        id v27 = v9;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 1LL));
        goto LABEL_12;
      }

LABEL_14:
      pid_t pid = 0;
      if (AXUIElementGetPid((AXUIElementRef)[v8 elementRef], &pid)) {
        goto LABEL_25;
      }
      if (pid < 1) {
        goto LABEL_25;
      }
      mach_port_name_t v26 = 0;
      if (task_for_pid(mach_task_self_, pid, &v26)) {
        goto LABEL_25;
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue([v8 parent]);
      uint64_t v20 = objc_opt_class(&OBJC_CLASS___AXElement, v19);
      if ((objc_opt_isKindOfClass(v18, v20) & 1) == 0)
      {

        goto LABEL_25;
      }

      uint64_t v8 = v18;
      uint64_t v6 = v11;
      uint64_t v7 = v9;
      if (!v18) {
        goto LABEL_25;
      }
    }
  }

  uint64_t v8 = 0LL;
  id v9 = 0LL;
  uint64_t v11 = 0LL;
LABEL_25:
  id v22 = v11;

  return v22;
}

LABEL_23:
      v9[2](v9, v22);
LABEL_24:

      goto LABEL_25;
    }

    if ([v17 isEqualToString:@"Hint"])
    {
      __int128 v23 = objc_claimAutoreleasedReturnValue([v10 hint]);
      goto LABEL_14;
    }

    if ([v17 isEqualToString:@"UserInputLabels"])
    {
      __int128 v23 = objc_claimAutoreleasedReturnValue([v10 userInputLabels]);
      goto LABEL_14;
    }

    if ([v17 isEqualToString:@"Traits"])
    {
      __int128 v23 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v10 traits]));
      goto LABEL_14;
    }

    if ([v17 isEqualToString:@"ElementClassName"])
    {
      v33 = v15;
      v34 = 5045LL;
    }

    else if ([v17 isEqualToString:@"ElementMemoryAddress"])
    {
      v33 = v15;
      v34 = 5046LL;
    }

    else
    {
      if (![v17 isEqualToString:@"ElementViewControllerClassName"])
      {
        if ([v17 isEqualToString:@"Identifier"])
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue([v10 uiElement]);
          v39 = (id)objc_claimAutoreleasedReturnValue([v36 objectWithAXAttribute:5019]);
          goto LABEL_45;
        }

        if (![v17 isEqualToString:@"TraitsHumanReadable"])
        {
          if ([v17 isEqualToString:@"Value"])
          {
            __int128 v23 = objc_claimAutoreleasedReturnValue([v10 value]);
            goto LABEL_14;
          }

          if ([v17 isEqualToString:_AXHumanReadableClassNameAttribute])
          {
            v50 = 0;
            v43 = AXUIElementGetPid((AXUIElementRef)[v10 elementRef], &v50);
            __int128 v23 = 0LL;
            if (v43 == kAXErrorSuccess)
            {
              uint64_t v21 = v50;
              if (v50 >= 1)
              {
                v52 = 0;
                if (task_for_pid(mach_task_self_, v50, &v52))
                {
                  __int128 v23 = 0LL;
                }

                else
                {
                  v49 = sub_100006390(v15, (const __CFString *)0x13B5);
                  __int128 v23 = objc_claimAutoreleasedReturnValue(v49);
                }
              }
            }

            goto LABEL_14;
          }

          if ([v17 isEqualToString:_AXHumanReadableDescriptionAttribute])
          {
            v44 = sub_1000048F8(v10);
            __int128 v23 = objc_claimAutoreleasedReturnValue(v44);
            goto LABEL_14;
          }

          if (![v17 isEqualToString:_AXHumanReadableRoleDescriptionAttribute])
          {
            if (![v17 isEqualToString:_AXHierarchyElementsAttribute])
            {
LABEL_11:
              id v22 = 0LL;
              goto LABEL_15;
            }

            v48 = sub_100004CE4(v10, 1, 1);
            __int128 v23 = objc_claimAutoreleasedReturnValue(v48);
            goto LABEL_14;
          }

          v45 = sub_100006390(v15, (const __CFString *)0x836);
          id v22 = (void *)objc_claimAutoreleasedReturnValue(v45);
          v47 = objc_opt_class(&OBJC_CLASS___NSArray, v46);
          if ((objc_opt_isKindOfClass(v22, v47) & 1) == 0)
          {
            v32 = 0LL;
            goto LABEL_30;
          }

LABEL_29:
          v32 = objc_claimAutoreleasedReturnValue([v22 firstObject]);
LABEL_30:

          id v22 = (void *)v32;
          goto LABEL_15;
        }

        v40 = sub_100006390(v15, (const __CFString *)0x836);
        v36 = (void *)objc_claimAutoreleasedReturnValue(v40);
        v42 = objc_opt_class(&OBJC_CLASS___NSArray, v41);
        if ((objc_opt_isKindOfClass(v36, v42) & 1) == 0 || ![v36 count])
        {
          v39 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
          goto LABEL_45;
        }

LABEL_44:
        v39 = v36;
LABEL_45:
        id v22 = v39;
LABEL_47:

        goto LABEL_15;
      }

      v33 = v15;
      v34 = 5042LL;
    }

    v35 = sub_100006390(v33, (const __CFString *)v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    v38 = objc_opt_class(&OBJC_CLASS___NSString, v37);
    if ((objc_opt_isKindOfClass(v36, v38) & 1) == 0)
    {
      id v22 = 0LL;
      goto LABEL_47;
    }

    goto LABEL_44;
  }

  v9[2](v9, 0LL);
LABEL_25:
}

LABEL_12:
  }
}

id sub_100005968(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = v3;
  if (([v3 isAccessibilityOpaqueElementProvider] & 1) == 0)
  {
    id v5 = sub_100005AE0(v3);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }

  if (v4)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", a2));
    v15[0] = v6;
    v15[1] = &off_100015948;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRange:](&OBJC_CLASS___NSValue, "valueWithRange:", 0x7FFFFFFFLL, 0LL));
    v15[2] = v7;
    v15[3] = @"AXAudit";
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 4LL));

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 elementForAttribute:95225 parameter:v8]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 uiElement]);
    unsigned int v11 = [v10 BOOLWithAXAttribute:2046];

    if (v11)
    {
      uint64_t v12 = sub_100005968(v9, a2);
      uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);

      id v9 = (void *)v13;
    }
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

id sub_100005AE0(void *a1)
{
  id v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue([v1 elementForAttribute:2066]);
  if (!v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue([v1 elementForAttribute:2092]);
    id v4 = (void *)v3;
    if (v3)
    {
      uint64_t v5 = sub_100005AE0(v3);
      v2 = (void *)objc_claimAutoreleasedReturnValue(v5);
    }

    else
    {
      v2 = 0LL;
    }
  }

  return v2;
}

LABEL_24:
  return v8;
}

void sub_1000060C0(uint64_t a1, uint64_t a2, int a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  uint64_t v7 = v6;
  if (a3 == 1044)
  {
    uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 dispatchQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100006360;
    block[3] = &unk_100014890;
    id v10 = v7;
    dispatch_async(v8, block);
  }
}

void sub_100006360(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _elementVisualsCoalescer]);
  [v1 notifyUpdateElementVisualsEventDidOccur];
}

id sub_100006390(const __AXUIElement *a1, const __CFString *a2)
{
  CFTypeRef value = 0LL;
  AXError v2 = AXUIElementCopyAttributeValue(a1, a2, &value);
  uint64_t v3 = 0LL;
  if (v2 == kAXErrorSuccess && value)
  {
    CFTypeID v4 = CFGetTypeID(value);
    if (v4 != CFArrayGetTypeID()
      && v4 != CFStringGetTypeID()
      && v4 != CFDictionaryGetTypeID()
      && v4 != CFNumberGetTypeID()
      && v4 != CFURLGetTypeID())
    {
      CFRelease(value);
      return 0LL;
    }

    uint64_t v3 = (void *)value;
  }

  return v3;
}

void sub_100006AF8(uint64_t a1, void *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([a2 anyObject]);
  [v2 _settingDidChange:AXAuditDeviceSettingIdentifierInvertColors];
}

void sub_100006B34(uint64_t a1, void *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([a2 anyObject]);
  [v2 _settingDidChange:AXAuditDeviceSettingIdentifierIncreaseContrast];
}

void sub_100006B70(uint64_t a1, void *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([a2 anyObject]);
  [v2 _settingDidChange:AXAuditDeviceSettingIdentifierReduceMotion];
}

void sub_100006BAC(uint64_t a1, void *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([a2 anyObject]);
  [v2 _settingDidChange:AXAuditDeviceSettingIdentifierReduceTransparency];
}

void sub_100006BE8(uint64_t a1, void *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([a2 anyObject]);
  [v2 _settingDidChange:AXAuditDeviceSettingIdentifierBoldFonts];
}

void sub_100006C24(uint64_t a1, void *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([a2 anyObject]);
  [v2 _settingDidChange:AXAuditDeviceSettingIdentifierOnOffLabels];
}

void sub_100006C60(uint64_t a1, void *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([a2 anyObject]);
  [v2 _settingDidChange:AXAuditDeviceSettingIdentifierButtonShapes];
}

void sub_100006C9C(uint64_t a1, void *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([a2 anyObject]);
  [v2 _settingDidChange:AXAuditDeviceSettingIdentifierGrayscale];
}

void sub_100006CD8(uint64_t a1, void *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([a2 anyObject]);
  [v2 _settingDidChange:AXAuditDeviceSettingIdentifierDifferentiateWithoutColor];
}

void sub_100006D14(uint64_t a1, void *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([a2 anyObject]);
  [v2 _settingDidChange:AXAuditDeviceSettingIdentifierFontsSize];
}

LABEL_33:
}

void sub_100007774(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v1 postNotificationName:@"DidPostContentSizeChanged" object:0];
}

void sub_1000077B4(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v1 postNotificationName:@"DidPostContentSizeChanged" object:0];
}

void sub_1000078A0(uint64_t a1)
{
  uint64_t v1 = objc_opt_new(*(void *)(a1 + 32));
  id v2 = (void *)qword_10001A2D0;
  qword_10001A2D0 = v1;
}

uint64_t sub_100007F30(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000083EC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100008408(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _checkFrontmostAppPidChanged];
}

void sub_100008870(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 40))
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v2 addObserver:*(void *)(a1 + 32) selector:"_appStateChanged:" name:SBApplicationNotificationStateChanged object:0];

    SBApplicationStateBeginGeneratingChangeNotifications();
  }

  else
  {
    SBApplicationStateEndGeneratingChangeNotifications();
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 removeObserver:*(void *)(a1 + 32) name:SBApplicationNotificationStateChanged object:0];
  }

void sub_1000089B0(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _deviceCaptureScreenshot]);
  [v1 invokeCompletionWithReturnValue:v2 error:0];
}

void sub_100008D70(uint64_t a1)
{
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[AXAuditObjectTransportManager sharedManager]( &OBJC_CLASS___AXAuditObjectTransportManager,  "sharedManager"));
  id v3 = objc_msgSend( v6,  "objectForTransportDictionary:expectedClass:",  *(void *)(a1 + 32),  objc_opt_class(AXAuditElement, v2));
  CFTypeID v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[XADInspectorManager sharedManager](&OBJC_CLASS___XADInspectorManager, "sharedManager"));
  [v5 setDelegate:*(void *)(a1 + 40)];
  [v5 focusOnElement:v4];
}

id sub_100008F88(uint64_t a1)
{
  return [*(id *)(a1 + 32) moveInDirection:*(void *)(a1 + 40) allowMovingToContainers:*(unsigned __int8 *)(a1 + 48) allowMoveToNonAXElements:*(unsigned __int8 *)(a1 + 49)];
}

void sub_10000903C(uint64_t a1)
{
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[AXAuditObjectTransportManager sharedManager]( &OBJC_CLASS___AXAuditObjectTransportManager,  "sharedManager"));
  id v3 = objc_msgSend( v6,  "objectForTransportDictionary:expectedClass:",  *(void *)(a1 + 32),  objc_opt_class(AXAuditElement, v2));
  CFTypeID v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[XADInspectorManager sharedManager](&OBJC_CLASS___XADInspectorManager, "sharedManager"));
  [v5 setDelegate:*(void *)(a1 + 40)];
  [v5 previewOnElement:v4];
}

void sub_100009164(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[XADInspectorManager sharedManager](&OBJC_CLASS___XADInspectorManager, "sharedManager"));
  [v2 setDelegate:*(void *)(a1 + 32)];
  [v2 setMonitoredEventType:*(void *)(a1 + 40)];
}

id sub_100009294(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShowVisuals:", objc_msgSend(*(id *)(a1 + 48), "BOOLValue"));
}

void sub_100009348(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[XADInspectorManager sharedManager](&OBJC_CLASS___XADInspectorManager, "sharedManager"));
  [v2 setDelegate:*(void *)(a1 + 32)];
  [v2 lockOnCurrentElement];
}

void sub_100009768(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[AXAuditObjectTransportManager sharedManager]( &OBJC_CLASS___AXAuditObjectTransportManager,  "sharedManager"));
  id v4 = objc_msgSend( v2,  "objectForTransportDictionary:expectedClass:",  *(void *)(a1 + 32),  objc_opt_class(AXAuditElement, v3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v7 = objc_msgSend( v2,  "objectForTransportDictionary:expectedClass:",  *(void *)(a1 + 40),  objc_opt_class(AXAuditElementAttribute, v6));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100009864;
  v10[3] = &unk_100014890;
  id v9 = *(void **)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  [v9 element:v5 performAction:v8 withValue:0 completion:v10];
}

id sub_100009864(uint64_t a1)
{
  return [*(id *)(a1 + 32) invokeCompletionWithReturnValue:0 error:0];
}

void sub_1000099A0(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[AXAuditObjectTransportManager sharedManager]( &OBJC_CLASS___AXAuditObjectTransportManager,  "sharedManager"));
  id v4 = objc_msgSend( v2,  "objectForTransportDictionary:expectedClass:",  *(void *)(a1 + 32),  objc_opt_class(AXAuditElement, v3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v7 = objc_msgSend( v2,  "objectForTransportDictionary:expectedClass:",  *(void *)(a1 + 40),  objc_opt_class(AXAuditElementAttribute, v6));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100009A98;
  v10[3] = &unk_100014BC8;
  id v9 = *(void **)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  [v9 element:v5 valueForAttribute:v8 completion:v10];
}

void sub_100009A98(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[AXAuditObjectTransportManager sharedManager]( &OBJC_CLASS___AXAuditObjectTransportManager,  "sharedManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 transportDictionaryForObject:v3]);

  [*(id *)(a1 + 32) invokeCompletionWithReturnValue:v4 error:0];
}

void sub_100009C64(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[AXAuditObjectTransportManager sharedManager]( &OBJC_CLASS___AXAuditObjectTransportManager,  "sharedManager"));
  id v4 = objc_msgSend( v2,  "objectForTransportDictionary:expectedClass:",  *(void *)(a1 + 32),  objc_opt_class(AXAuditElement, v3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v7 = objc_msgSend( v2,  "objectForTransportDictionary:expectedClass:",  *(void *)(a1 + 40),  objc_opt_class(AXAuditElementAttribute, v6));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = *(void **)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100009D64;
  v11[3] = &unk_100014BC8;
  id v12 = *(id *)(a1 + 64);
  [v9 element:v5 valueForParameterizedAttribute:v8 withObject:v10 completion:v11];
}

void sub_100009D64(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[AXAuditObjectTransportManager sharedManager]( &OBJC_CLASS___AXAuditObjectTransportManager,  "sharedManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 transportDictionaryForObject:v3]);

  [*(id *)(a1 + 32) invokeCompletionWithReturnValue:v4 error:0];
}

id sub_100009EA0(uint64_t a1)
{
  return [*(id *)(a1 + 32) focusOnAXElement:*(void *)(a1 + 48)];
}

void sub_100009FE0(uint64_t a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) fetchSpecialElement:*(void *)(a1 + 48)]);
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[AXAuditObjectTransportManager sharedManager]( &OBJC_CLASS___AXAuditObjectTransportManager,  "sharedManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 transportDictionaryForObject:v4]);
  [*(id *)(a1 + 40) invokeCompletionWithReturnValue:v3 error:0];
}

void sub_10000A120(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = +[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", _AXSMossdeepEnabled());
  id v3 = (id)objc_claimAutoreleasedReturnValue(v2);
  [v1 invokeCompletionWithReturnValue:v3 error:0];
}

void sub_10000A288(uint64_t a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(a1 + 32),  "fetchElementAtNormalizedDeviceCoordinate:",  *(double *)(a1 + 48),  *(double *)(a1 + 56)));
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[AXAuditObjectTransportManager sharedManager]( &OBJC_CLASS___AXAuditObjectTransportManager,  "sharedManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 transportDictionaryForObject:v4]);
  [*(id *)(a1 + 40) invokeCompletionWithReturnValue:v3 error:0];
}

id sub_10000A3E8(uint64_t a1)
{
  return [*(id *)(a1 + 32) deviceDidGetTargeted];
}

id sub_10000A4B0(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMonitoredEventType:0];
}

void sub_10000A5A0(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXElement elementWithUIElement:](&OBJC_CLASS___AXElement, "elementWithUIElement:", *(void *)(a1 + 48)));
  [v2 focusOnAXElement:v3];
}

id sub_10000A6B0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "focusOnElementAtPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
}

LABEL_28:
      v29 = 1;
      id v5 = v32;
      id v2 = v33;
      uint64_t v6 = v31;
    }

    else
    {
      v29 = 0;
    }

LABEL_30:
  }

  else
  {
    v29 = 1;
  }

  -[XADAuditServer setRunningApplications:](v2, "setRunningApplications:", v5, v31, v32, v33);

  return v29;
}

void sub_10000ADD8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

uint64_t sub_10000AE18(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000AE28(uint64_t a1)
{
}

void sub_10000AE30(uint64_t a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[AXAuditObjectTransportManager sharedManager]( &OBJC_CLASS___AXAuditObjectTransportManager,  "sharedManager"));
  id v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) copy];
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v4 transportArrayForArray:v2]);

  [*(id *)(a1 + 32) invokeCompletionWithReturnValue:v3 error:0];
}

BOOL sub_10000AF0C(id a1, AXElement *a2, unint64_t a3, BOOL *a4)
{
  id v4 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXElement bundleId](v4, "bundleId"));
  unsigned __int8 v6 = [v5 isEqualToString:@"com.apple.PineBoard"];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXElement bundleId](v4, "bundleId"));
  LOBYTE(v4) = [v7 isEqualToString:AX_SpotlightBundleName];

  return (v6 | v4) ^ 1;
}

id sub_10000B080(void *a1)
{
  id v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[XADInspectorManager sharedManager](&OBJC_CLASS___XADInspectorManager, "sharedManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 firstElementInHierarchy:v1]);

  return v3;
}

id sub_10000B294(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateAttributesIfElementIsValid];
}

id sub_10000B3C8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleScreenChangedNotification];
}

id sub_10000B4EC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleScreenChangedNotification];
}

uint64_t start()
{
  if ((DTHostInDeveloperMode() & 1) != 0)
  {
    int v0 = _AXSApplicationAccessibilityEnabled();
    _AXSApplicationAccessibilitySetEnabled(1LL);
    _AXSSetAuditInspectionModeEnabled(1LL);
    SystemWide = AXUIElementCreateSystemWide();
    uint64_t v2 = AXUIElementSetMessagingTimeout(SystemWide, 10000.0);
    if (!v0) {
      AXDisableAccessibilityOnTermination(v2);
    }
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXAuditPluginManager sharedManager](&OBJC_CLASS___AXAuditPluginManager, "sharedManager"));
    [v3 loadAuditBundles];

    mach_service = xpc_connection_create_mach_service( "com.apple.accessibility.axAuditDaemon.deviceservice.xpc",  0LL,  1uLL);
    xpc_connection_set_event_handler(mach_service, &stru_100014CE8);
    xpc_connection_resume(mach_service);
    int v5 = lockdown_checkin_xpc("com.apple.accessibility.axAuditDaemon.deviceservice.lockdown", 0LL, 0LL, &stru_100014D50);
    if (v5)
    {
      int v8 = v5;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315650;
        uint64_t v10 = getprogname();
        __int16 v11 = 1024;
        pid_t v12 = getpid();
        __int16 v13 = 1024;
        int v14 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s(%d) xpc-based lockdown checkin failure: %d\n",  (uint8_t *)&v9,  0x18u);
      }

      exit(1);
    }

    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
    [v6 run];

    return 0LL;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000BF10();
    }
    return 1LL;
  }

void sub_10000B9D0(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_connection)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10000BAF4;
    handler[3] = &unk_100014D10;
    id v3 = v2;
    int v5 = v3;
    xpc_connection_set_event_handler(v3, handler);
    xpc_connection_resume(v3);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v7 = getprogname();
    __int16 v8 = 1024;
    pid_t v9 = getpid();
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s(%d): Invalid connection\n",  buf,  0x12u);
  }
}

void sub_10000BAF4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    region = 0LL;
    xpc_object_t value = xpc_dictionary_get_value(v3, "dtx_shared_memory");
    int v5 = (void *)objc_claimAutoreleasedReturnValue(value);
    unsigned __int8 v6 = v5;
    if (v5 && xpc_shmem_map(v5, &region))
    {
      id v7 = objc_alloc(&OBJC_CLASS___DTXSharedMemoryTransport);
      id v8 = [v7 initWithMappedMemory:region];
      pid_t v9 = v8;
      if (v8)
      {
        sub_10000BDAC(v8);
        xpc_object_t reply = xpc_dictionary_create_reply(v3);
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), reply);
        __int16 v11 = *(void **)(a1 + 32);
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472LL;
        v18[2] = sub_10000BE00;
        v18[3] = &unk_100014890;
        uint64_t v19 = v11;
        xpc_connection_send_barrier(v19, v18);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          __int128 v15 = getprogname();
          pid_t v16 = getpid();
          pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
          *(_DWORD *)buf = 136315650;
          id v22 = v15;
          __int16 v23 = 1024;
          pid_t v24 = v16;
          __int16 v25 = 1024;
          pid_t v26 = pid;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s(%d): failed to create transport; xpc peer: %d\n",
            buf,
            0x18u);
        }

        xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
      }
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        pid_t v12 = getprogname();
        pid_t v13 = getpid();
        pid_t v14 = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
        *(_DWORD *)buf = 136315650;
        id v22 = v12;
        __int16 v23 = 1024;
        pid_t v24 = v13;
        __int16 v25 = 1024;
        pid_t v26 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s(%d): shared memory mapping failed; xpc peer: %d\n",
          buf,
          0x18u);
      }

      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
    }
  }

  else
  {
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v22 = getprogname();
      __int16 v23 = 1024;
      pid_t v24 = getpid();
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s(%d): Invalid event type\n",  buf,  0x12u);
    }
  }
}

void sub_10000BDAC(void *a1)
{
  id v1 = a1;
  uint64_t v2 = -[XADAuditServer initWithTransport:](objc_alloc(&OBJC_CLASS___XADAuditServer), "initWithTransport:", v1);

  -[XADAuditServer resume](v2, "resume");
}

void sub_10000BE00(uint64_t a1)
{
}

void sub_10000BE08(id a1, _lockdown_connection *a2, __CFDictionary *a3)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000BE90;
  v4[3] = &unk_100014868;
  v4[4] = a2;
  id v3 = [[DTXSocketTransport alloc] initWithConnectedSocket:lockdown_get_socket(a2) disconnectAction:v4];
  sub_10000BDAC(v3);
}

uint64_t sub_10000BE90(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[XADDisplayManager sharedManager](&OBJC_CLASS___XADDisplayManager, "sharedManager"));
  [v2 hideVisualsSynchronously];

  return lockdown_disconnect(*(void *)(a1 + 32));
}

void sub_10000BECC()
{
  *(_WORD *)int v0 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Device got targeted!",  v0,  2u);
}

void sub_10000BF10()
{
  *(_WORD *)int v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "audit daemon failed to start: developer mode NOT ENABLED!",  v0,  2u);
}

id objc_msgSend_addAttribute_toSection_withPrefix_performsAction_settable_humanReadable_valueType_overrideIsInternalWithValue_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "addAttribute:toSection:withPrefix:performsAction:settable:humanReadable:valueType:overrideIsInternalWithValue:");
}

id objc_msgSend_eventManager_notificationReceived_notification_traits_label_value_hint_identifier_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventManager:notificationReceived:notification:traits:label:value:hint:identifier:");
}

id objc_msgSend_initWithHIDTapIdentifier_HIDEventTapPriority_systemEventTapIdentifier_systemEventTapPriority_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithHIDTapIdentifier:HIDEventTapPriority:systemEventTapIdentifier:systemEventTapPriority:");
}

id objc_msgSend_valueWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithRange:");
}
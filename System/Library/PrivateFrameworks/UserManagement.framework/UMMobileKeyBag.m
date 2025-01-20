@interface UMMobileKeyBag
+ (BOOL)clearSyncBubblesWithOutError:(id *)a3;
+ (BOOL)startSyncBubbleForUser:(id)a3 outError:(id *)a4;
+ (BOOL)stopSyncBubbleForUser:(id)a3 outError:(id *)a4;
+ (UMUser)lastLoggedInUser;
+ (id)allSyncBubbleUsers;
+ (id)currentSyncBubbleUser;
+ (id)queuedSyncBubbleUsers;
+ (id)syncBubbleMachServiceNamesForUser:(id)a3;
+ (void)initialize;
@end

@implementation UMMobileKeyBag

+ (void)initialize
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  if (DarwinNotifyCenter) {
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  0LL,  (CFNotificationCallback)sub_185F3893C,  @"com.apple.mobile.keybagd.user_changed",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  v14 = UMUserTypeDeviceMode(0LL, 0LL);
  objc_msgSend_objectForKeyedSubscript_(v14, v3, kUMDeviceModeKey, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  int isEqualToString = objc_msgSend_isEqualToString_(v5, v6, kUMDeviceModeSharedIPad, v7);
  byte_18C49E258 = isEqualToString;
  if (isEqualToString)
  {
    objc_msgSend_objectForKeyedSubscript_(v14, v9, kUMUserTypeKey, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
}

+ (UMUser)lastLoggedInUser
{
  uint64_t v37 = 0LL;
  v38 = &v37;
  uint64_t v39 = 0x3032000000LL;
  v40 = sub_185F38B70;
  v41 = sub_185F38B80;
  id v42 = 0LL;
  uint64_t v31 = 0LL;
  v32 = &v31;
  uint64_t v33 = 0x3032000000LL;
  v34 = sub_185F38B70;
  v35 = sub_185F38B80;
  id v36 = 0LL;
  sub_185F4773C();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F4D830(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v4 = MEMORY[0x1895F87A8];
  v30[0] = MEMORY[0x1895F87A8];
  v30[1] = 3221225472LL;
  v30[2] = sub_185F398AC;
  v30[3] = &unk_189DD46E0;
  v30[4] = &v37;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, v5, (uint64_t)v30, v6);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v4;
  v29[1] = 3221225472LL;
  v29[2] = sub_185F39938;
  v29[3] = &unk_189DD4750;
  v29[4] = &v31;
  v29[5] = &v37;
  objc_msgSend_userSessionLRUInfoWithReply_(v7, v8, (uint64_t)v29, v9);

  uint64_t v10 = (void *)v32[5];
  if (v10)
  {
    id v11 = v10;
    objc_msgSend_lastObject(v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v15;
    if (v15)
    {
      uint64_t v20 = objc_msgSend_unsignedIntValue(v15, v16, v17, v18);
      sub_185F54870((uint64_t)&OBJC_CLASS___UMUser, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v21 = 0LL;
    }
  }

  else
  {
    if (!v38[5])
    {
      v21 = 0LL;
      goto LABEL_9;
    }

    sub_185F436A0();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    sub_185F43C5C((uint64_t)v11, @"Could not get LRU UIDs, error: %@", v22, v23, v24, v25, v26, v27, v38[5]);
    v21 = 0LL;
  }

LABEL_9:
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  return (UMUser *)v21;
}

+ (id)currentSyncBubbleUser
{
  uint64_t v13 = 0LL;
  uint64_t v2 = UMCurrentSyncBubbleSessionID(&v13);
  if ((_DWORD)v2 == -1)
  {
    if (v13)
    {
      sub_185F436A0();
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v13;
      sub_185F43C5C( (uint64_t)v4,  @"Could not get current sync bubble uid, error: %@",  v6,  v7,  v8,  v9,  v10,  v11,  (uint64_t)v13);
    }

    v3 = 0LL;
  }

  else
  {
    sub_185F54870((uint64_t)&OBJC_CLASS___UMUser, v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

+ (id)queuedSyncBubbleUsers
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = (void *)MEMORY[0x1896079C8];
  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = sub_185F3EAC0;
  v19[3] = &unk_189DD48B8;
  id v20 = v5;
  id v7 = v5;
  objc_msgSend_predicateWithBlock_(v6, v8, (uint64_t)v19, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allSyncBubbleUsers(a1, v11, v12, v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_filteredArrayUsingPredicate_(v14, v15, (uint64_t)v10, v16);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)allSyncBubbleUsers
{
  uint64_t v61 = *MEMORY[0x1895F89C0];
  uint64_t v54 = 0LL;
  v55 = &v54;
  uint64_t v56 = 0x3032000000LL;
  v57 = sub_185F38B70;
  v58 = sub_185F38B80;
  id v59 = 0LL;
  uint64_t v48 = 0LL;
  v49 = &v48;
  uint64_t v50 = 0x3032000000LL;
  v51 = sub_185F38B70;
  v52 = sub_185F38B80;
  id v53 = 0LL;
  sub_185F4773C();
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F4D830(v2);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v4 = MEMORY[0x1895F87A8];
  v47[0] = MEMORY[0x1895F87A8];
  v47[1] = 3221225472LL;
  v47[2] = sub_185F3EDF0;
  v47[3] = &unk_189DD46E0;
  v47[4] = &v54;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, v5, (uint64_t)v47, v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v4;
  v46[1] = 3221225472LL;
  v46[2] = sub_185F3EE7C;
  v46[3] = &unk_189DD4750;
  v46[4] = &v48;
  v46[5] = &v54;
  objc_msgSend_listSyncBubbleUserswithReply_(v7, v8, (uint64_t)v46, v9);

  uint64_t v10 = (void *)v49[5];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = (void *)MEMORY[0x189603FA8];
    uint64_t v16 = objc_msgSend_count(v11, v13, v14, v15);
    objc_msgSend_arrayWithCapacity_(v12, v17, v16, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    id v20 = v11;
    uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v42, (uint64_t)v60, 16);
    if (v25)
    {
      uint64_t v26 = *(void *)v43;
      do
      {
        uint64_t v27 = 0LL;
        do
        {
          if (*(void *)v43 != v26) {
            objc_enumerationMutation(v20);
          }
          uint64_t v22 = (const char *)objc_msgSend_unsignedIntValue(*(void **)(*((void *)&v42 + 1) + 8 * v27), v22, v23, v24);
          if ((_DWORD)v22 != 502)
          {
            sub_185F54870((uint64_t)&OBJC_CLASS___UMUser, (uint64_t)v22);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (v30) {
              objc_msgSend_addObject_(v19, v28, (uint64_t)v30, v29);
            }
          }

          ++v27;
        }

        while (v25 != v27);
        uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v22, (uint64_t)&v42, (uint64_t)v60, 16);
      }

      while (v25);
    }

    v34 = (void *)objc_msgSend_copy(v19, v31, v32, v33);
  }

  else
  {
    if (!v55[5])
    {
      v34 = 0LL;
      goto LABEL_17;
    }

    sub_185F436A0();
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    sub_185F43C5C( (uint64_t)v20,  @"Could not get sync bubble uids, error: %@",  v35,  v36,  v37,  v38,  v39,  v40,  v55[5]);
    v34 = 0LL;
  }

LABEL_17:
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v54, 8);
  return v34;
}

+ (id)syncBubbleMachServiceNamesForUser:(id)a3
{
  id v4 = a3;
  sub_185F3D96C((uint64_t)a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v32 = 0LL;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  uint64_t v35 = sub_185F38B70;
  uint64_t v36 = sub_185F38B80;
  id v37 = 0LL;
  uint64_t v26 = 0LL;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  uint64_t v29 = sub_185F38B70;
  v30 = sub_185F38B80;
  id v31 = 0LL;
  sub_185F4773C();
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F4D830(v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = MEMORY[0x1895F87A8];
  v25[0] = MEMORY[0x1895F87A8];
  v25[1] = 3221225472LL;
  v25[2] = sub_185F3F13C;
  v25[3] = &unk_189DD46E0;
  v25[4] = &v32;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v7, v9, (uint64_t)v25, v10);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v8;
  v24[1] = 3221225472LL;
  v24[2] = sub_185F3F1C8;
  v24[3] = &unk_189DD4750;
  v24[4] = &v26;
  v24[5] = &v32;
  objc_msgSend_listSyncServiceSourcesForUserSession_withReply_(v11, v12, (uint64_t)v5, (uint64_t)v24);

  uint64_t v13 = (void *)v27[5];
  if (v13)
  {
    id v14 = v13;
  }

  else if (v33[5])
  {
    sub_185F436A0();
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43C5C( (uint64_t)v15,  @"Could not get mach service names, error: %@",  v16,  v17,  v18,  v19,  v20,  v21,  v33[5]);
  }

  id v22 = v13;

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v22;
}

+ (BOOL)startSyncBubbleForUser:(id)a3 outError:(id *)a4
{
  return sub_185F3F298((uint64_t)a1, 1, a3, a4);
}

+ (BOOL)stopSyncBubbleForUser:(id)a3 outError:(id *)a4
{
  return sub_185F3F298((uint64_t)a1, 0, a3, a4);
}

+ (BOOL)clearSyncBubblesWithOutError:(id *)a3
{
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  uint64_t v25 = sub_185F38B70;
  uint64_t v26 = sub_185F38B80;
  id v27 = 0LL;
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = 0;
  sub_185F4773C();
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F4D830(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = MEMORY[0x1895F87A8];
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = sub_185F3F6A0;
  v17[3] = &unk_189DD46E0;
  v17[4] = &v22;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v5, v7, (uint64_t)v17, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  v16[1] = 3221225472LL;
  v16[2] = sub_185F3F72C;
  v16[3] = &unk_189DD4840;
  v16[4] = &v22;
  v16[5] = &v18;
  objc_msgSend_clearSyncBubbleUserswithReply_(v9, v10, (uint64_t)v16, v11);

  uint64_t v12 = (void *)v23[5];
  int v13 = *((unsigned __int8 *)v19 + 24);
  if (a3) {
    *a3 = v12;
  }
  id v14 = v12;

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v13 != 0;
}

@end
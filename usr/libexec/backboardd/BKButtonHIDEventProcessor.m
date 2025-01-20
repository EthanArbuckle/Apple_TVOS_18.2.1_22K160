@interface BKButtonHIDEventProcessor
- (BKButtonHIDEventProcessor)initWithContext:(id)a3;
- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5;
- (unint64_t)ringerState;
- (void)_postEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5 destination:(id)a6 cancelled:(BOOL)a7;
- (void)_processRingerSwitchEvent:(__IOHIDEvent *)a3 down:(BOOL)a4 sender:(id)a5 dispatcher:(id)a6;
- (void)cancelButtonForSenderID:(unint64_t)a3 uagePage:(unsigned __int16)a4 usage:(unsigned __int16)a5;
- (void)setRingerState:(unint64_t)a3;
@end

@implementation BKButtonHIDEventProcessor

- (BKButtonHIDEventProcessor)initWithContext:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___BKButtonHIDEventProcessor;
  v5 = -[BKButtonHIDEventProcessor init](&v17, "init");
  v6 = v5;
  if (v5)
  {
    v5->_eventRecordsLock._os_unfair_lock_opaque = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 systemInterface]);
    uint64_t KeyboardEvent = IOHIDEventCreateKeyboardEvent(0LL, 0LL, 11LL, 46LL, 0LL, 0LL);
    if (KeyboardEvent)
    {
      v9 = (const void *)KeyboardEvent;
      id v10 = [v7 systemEventOfType:3 matchingEvent:KeyboardEvent options:0];
      if (v10)
      {
        v11 = v10;
        v6->_ringerState = IOHIDEventGetIntegerValue(v10, 196610LL) != 0;
        id v12 = sub_10003F124();
        v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = sub_100015B70(v6->_ringerState);
          v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          *(_DWORD *)buf = 138543362;
          v19 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "initial ringer state:%{public}@",  buf,  0xCu);
        }

        CFRelease(v11);
      }

      CFRelease(v9);
    }
  }

  return v6;
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  id v9 = a4;
  id obj = a5;
  id v10 = a5;
  if (!self->_keyboardEventProcessor)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[BKHIDEventProcessorRegistry sharedInstance]( &OBJC_CLASS___BKHIDEventProcessorRegistry,  "sharedInstance"));
    id v13 = objc_msgSend(v11, "eventProcessorOfClass:", objc_opt_class(BKKeyboardHIDEventProcessor, v12));
    v14 = (BKKeyboardHIDEventProcessor *)objc_claimAutoreleasedReturnValue(v13);
    keyboardEventProcessor = self->_keyboardEventProcessor;
    self->_keyboardEventProcessor = v14;
  }

  v16 = *a3;
  uint64_t SenderID = IOHIDEventGetSenderID(v16);
  int IntegerValue = IOHIDEventGetIntegerValue(v16, 196608LL);
  unsigned __int16 v19 = IOHIDEventGetIntegerValue(v16, 196609LL);
  uint64_t v20 = IOHIDEventGetIntegerValue(v16, 196610LL);
  int Phase = IOHIDEventGetPhase(v16);
  if ((unsigned __int16)IntegerValue == 11 && v19 == 46)
  {
    -[BKButtonHIDEventProcessor _processRingerSwitchEvent:down:sender:dispatcher:]( self,  "_processRingerSwitchEvent:down:sender:dispatcher:",  v16,  v20 != 0,  v9,  v10);
    goto LABEL_59;
  }

  id v68 = a4;
  LODWORD(v67) = (unsigned __int16)IntegerValue;
  os_unfair_lock_lock(&self->_eventRecordsLock);
  eventRecords = self->_eventRecords;
  HIDWORD(v67) = v19;
  uint64_t v23 = v19 | (IntegerValue << 16);
  uint64_t v70 = SenderID;
  unsigned int v69 = v19 | (IntegerValue << 16);
  if (eventRecords)
  {
    usagePairsPeruint64_t SenderID = eventRecords->_usagePairsPerSenderID;
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  SenderID));
    v26 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( usagePairsPerSenderID,  "objectForKeyedSubscript:",  v25));

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v23));
    uint64_t v28 = objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v27]);
  }

  else
  {
    uint64_t v28 = 0LL;
  }

  if (!v20 || v28)
  {
    if (v20)
    {
      if (v28)
      {
        *(_BYTE *)(v28 + 10) = 0;
        int v40 = IOHIDEventGetPhase(v16);
        if (v40)
        {
          if (!*(_BYTE *)(v28 + 8)) {
            *(_BYTE *)(v28 + 8) = v40 & 1;
          }
          if (!*(_BYTE *)(v28 + 9)) {
            *(_BYTE *)(v28 + 9) = (v40 & 4) != 0;
          }
        }
      }

      else
      {
        IOHIDEventGetPhase(v16);
      }
    }

    else
    {
      int v50 = IOHIDEventGetPhase(v16);
      if (!v28) {
        goto LABEL_44;
      }
      *(_BYTE *)(v28 + 10) = 1;
      int v51 = *(unsigned __int8 *)(v28 + 8);
      if (v50)
      {
        if (!*(_BYTE *)(v28 + 8))
        {
          int v51 = v50 & 1;
          *(_BYTE *)(v28 + 8) = v50 & 1;
        }

        if (!*(_BYTE *)(v28 + 9)) {
          *(_BYTE *)(v28 + 9) = (v50 & 4) != 0;
        }
      }

      if (!v51 || *(_BYTE *)(v28 + 9))
      {
LABEL_44:
        v52 = self->_eventRecords;
        if (v52)
        {
          v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v70));
          v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v69));
          v55 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v52->_usagePairsPerSenderID,  "objectForKeyedSubscript:",  v53));
          sub_1000092B8((uint64_t)v52, v55, v53, v54);
        }

        id v56 = sub_10003F124();
        v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          v58 = sub_10001B23C((id *)v28);
          v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
          *(_DWORD *)buf = 67109890;
          int v79 = v67;
          __int16 v80 = 1024;
          int v81 = HIDWORD(v67);
          __int16 v82 = 2048;
          uint64_t v83 = v70;
          __int16 v84 = 2114;
          v85 = v59;
          _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  " 0x%X/0x%X/%llX finished: %{public}@",  buf,  0x22u);
        }
      }
    }

    goto LABEL_49;
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue([v10 destinationsForEvent:v16 fromSender:v9]);
  if (!v29) {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  }
  v30 = objc_alloc_init(&OBJC_CLASS____BKButtonEventRecord);
  uint64_t v28 = (uint64_t)v30;
  if (v30)
  {
    objc_storeStrong((id *)&v30->_eventDispatcher, obj);
    objc_storeStrong((id *)(v28 + 16), v68);
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    *(void *)(v28 + 40) = v31;
    objc_storeStrong((id *)(v28 + 32), v29);
    int v32 = IOHIDEventGetPhase(v16);
    if (v32)
    {
      if (!*(_BYTE *)(v28 + 8)) {
        *(_BYTE *)(v28 + 8) = v32 & 1;
      }
      if (!*(_BYTE *)(v28 + 9)) {
        *(_BYTE *)(v28 + 9) = (v32 & 4) != 0;
      }
    }
  }

  else
  {
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    IOHIDEventGetPhase(v16);
  }

  id obja = v29;
  id v33 = sub_10003F124();
  v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    v35 = sub_10001B23C((id *)v28);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    *(_DWORD *)buf = 67109890;
    int v79 = v67;
    __int16 v80 = 1024;
    int v81 = HIDWORD(v67);
    __int16 v82 = 2048;
    uint64_t v83 = v70;
    __int16 v84 = 2114;
    v85 = v36;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, " 0x%X/0x%X/%llX began: %{public}@", buf, 0x22u);
  }

  v37 = self->_eventRecords;
  if (v37)
  {
    id v38 = (id)v28;
    uint64_t v39 = v70;
LABEL_30:
    v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v39,  v67));
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v69));
    v46 = v37->_usagePairsPerSenderID;
    if (!v46)
    {
      v47 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v48 = v37->_usagePairsPerSenderID;
      v37->_usagePairsPeruint64_t SenderID = v47;

      v46 = v37->_usagePairsPerSenderID;
    }

    v49 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v46, "objectForKeyedSubscript:", v44));
    if (!v49)
    {
      v49 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v37->_usagePairsPerSenderID,  "setObject:forKeyedSubscript:",  v49,  v44);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](v49, "setObject:forKeyedSubscript:", v28, v45);

    goto LABEL_35;
  }

  v41 = objc_alloc_init(&OBJC_CLASS___BKEventSenderUsagePairDictionary);
  v42 = self->_eventRecords;
  self->_eventRecords = v41;

  v37 = self->_eventRecords;
  id v43 = (id)v28;
  uint64_t v39 = v70;
  if (v37) {
    goto LABEL_30;
  }
LABEL_35:

LABEL_49:
  os_unfair_lock_unlock(&self->_eventRecordsLock);
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  if (v28) {
    v60 = *(void **)(v28 + 32);
  }
  else {
    v60 = 0LL;
  }
  id v61 = v60;
  id v62 = [v61 countByEnumeratingWithState:&v73 objects:v77 count:16];
  if (v62)
  {
    id v63 = v62;
    uint64_t v64 = *(void *)v74;
    do
    {
      for (i = 0LL; i != v63; i = (char *)i + 1)
      {
        if (*(void *)v74 != v64) {
          objc_enumerationMutation(v61);
        }
        -[BKButtonHIDEventProcessor _postEvent:sender:dispatcher:destination:cancelled:]( self,  "_postEvent:sender:dispatcher:destination:cancelled:",  v16,  v9,  v10,  *(void *)(*((void *)&v73 + 1) + 8LL * (void)i),  Phase == 8);
      }

      id v63 = [v61 countByEnumeratingWithState:&v73 objects:v77 count:16];
    }

    while (v63);
  }

LABEL_59:
  return 1LL;
}

- (void)cancelButtonForSenderID:(unint64_t)a3 uagePage:(unsigned __int16)a4 usage:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  p_eventRecordsLock = &self->_eventRecordsLock;
  os_unfair_lock_lock(&self->_eventRecordsLock);
  eventRecords = self->_eventRecords;
  if (eventRecords)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  v5 | ((_DWORD)v6 << 16)));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( eventRecords->_usagePairsPerSenderID,  "objectForKeyedSubscript:",  v11));
    v14 = (id *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v12]);
    sub_1000092B8((uint64_t)eventRecords, v13, v11, v12);
  }

  else
  {
    v14 = 0LL;
  }

  os_unfair_lock_unlock(p_eventRecordsLock);
  id v15 = sub_10003F124();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  objc_super v17 = v16;
  if (v14)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v18 = sub_10001B23C(v14);
      unsigned __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      *(_DWORD *)buf = 67109890;
      int v33 = v6;
      __int16 v34 = 1024;
      int v35 = v5;
      __int16 v36 = 2048;
      unint64_t v37 = a3;
      __int16 v38 = 2114;
      uint64_t v39 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  " 0x%X/0x%X/%llX soft cancel: %{public}@",  buf,  0x22u);
    }

    uint64_t KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent(0LL, 0LL, v6, v5, 0LL, 0LL);
    IOHIDEventSetSenderID(KeyboardEvent, a3);
    objc_super v17 = (os_log_s *)v14[2];
    id v21 = v14[3];
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v22 = v14[4];
    id v23 = [v22 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v28;
      do
      {
        v26 = 0LL;
        do
        {
          if (*(void *)v28 != v25) {
            objc_enumerationMutation(v22);
          }
          -[BKButtonHIDEventProcessor _postEvent:sender:dispatcher:destination:cancelled:]( self,  "_postEvent:sender:dispatcher:destination:cancelled:",  KeyboardEvent,  v17,  v21,  *(void *)(*((void *)&v27 + 1) + 8LL * (void)v26),  1LL,  (void)v27);
          v26 = (char *)v26 + 1;
        }

        while (v24 != v26);
        id v24 = [v22 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }

      while (v24);
    }

    CFRelease(KeyboardEvent);
  }

  else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109632;
    int v33 = v6;
    __int16 v34 = 1024;
    int v35 = v5;
    __int16 v36 = 2048;
    unint64_t v37 = a3;
    _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "0x%X/0x%X/%llX soft cancel: no event found, ignoring request",  buf,  0x18u);
  }
}

- (void)_postEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5 destination:(id)a6 cancelled:(BOOL)a7
{
  BOOL v7 = a7;
  id v22 = a6;
  id v12 = a5;
  id v13 = a4;
  Copy = (const void *)IOHIDEventCreateCopy(0LL, a3);
  keyboardEventProcessor = self->_keyboardEventProcessor;
  if (keyboardEventProcessor) {
    id v16 = (id)-[BKKeyboardHIDEventProcessor eventSourceForSender:](keyboardEventProcessor, "eventSourceForSender:", v13);
  }
  else {
    id v16 = [v13 eventSource];
  }
  id v17 = v16;

  BKSHIDEventSetSimpleDeliveryInfo(Copy, v17, v7, v22);
  if (Copy)
  {
    uint64_t TimeStamp = IOHIDEventGetTimeStamp(Copy);
    uint64_t IntegerValue = IOHIDEventGetIntegerValue(Copy, 196608LL);
    uint64_t v20 = IOHIDEventGetIntegerValue(Copy, 196609LL);
    uint64_t v21 = IOHIDEventGetIntegerValue(Copy, 196610LL);
  }

  else
  {
    uint64_t v20 = 0LL;
    uint64_t TimeStamp = 0LL;
    uint64_t IntegerValue = 0LL;
    uint64_t v21 = 0LL;
  }

  kdebug_trace(730465058LL, TimeStamp, IntegerValue, v20, v21);
  [v12 postEvent:Copy toDestination:v22];

  CFRelease(Copy);
}

- (void)_processRingerSwitchEvent:(__IOHIDEvent *)a3 down:(BOOL)a4 sender:(id)a5 dispatcher:(id)a6
{
  BOOL v7 = a4;
  id v10 = a5;
  id v11 = a6;
  self->_ringerState = v7;
  id v12 = sub_10003F124();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = sub_100015B70(self->_ringerState);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    *(_DWORD *)buf = 138543362;
    __int128 v27 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "ringer state changed to:%{public}@", buf, 0xCu);
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 destinationsForEvent:a3 fromSender:v10]);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v17 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      uint64_t v20 = 0LL;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        -[BKButtonHIDEventProcessor _postEvent:sender:dispatcher:destination:cancelled:]( self,  "_postEvent:sender:dispatcher:destination:cancelled:",  a3,  v10,  v11,  *(void *)(*((void *)&v21 + 1) + 8LL * (void)v20),  0LL);
        uint64_t v20 = (char *)v20 + 1;
      }

      while (v18 != v20);
      id v18 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v18);
  }
}

- (unint64_t)ringerState
{
  return self->_ringerState;
}

- (void)setRingerState:(unint64_t)a3
{
  self->_ringerState = a3;
}

- (void).cxx_destruct
{
}

@end
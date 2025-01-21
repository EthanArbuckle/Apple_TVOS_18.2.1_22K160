@interface BKHIDTouchSensitiveButtonEventProcessor
- (BKHIDTouchSensitiveButtonEventProcessor)initWithContext:(id)a3;
- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5;
- (void)setScanningActive:(BOOL)a3 buttonIdentifier:(int64_t)a4 forPID:(int)a5;
@end

@implementation BKHIDTouchSensitiveButtonEventProcessor

- (BKHIDTouchSensitiveButtonEventProcessor)initWithContext:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = [BKHIDTouchSensitiveButtonEventProcessor class];
  BKHIDTouchSensitiveButtonEventProcessor *v5 = [[BKHIDTouchSensitiveButtonEventProcessor alloc] init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    BKHIDTouchSensitiveButtonScanningController *v7 = [[BKHIDTouchSensitiveButtonScanningController alloc] initWithContext:v4];
    buttonScanningController = v6->_buttonScanningController;
    v6->_buttonScanningController = v7;
  }

  return v6;
}

- (void)setScanningActive:(BOOL)a3 buttonIdentifier:(int64_t)a4 forPID:(int)a5
{
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  objc_super v10 = *a3;
  if (IOHIDEventGetType(*a3, v11) == 42)
  {
    os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    id v65 = v8;
    id v68 = v8;
    id v66 = v9;
    if (!self)
    {
LABEL_42:

      os_unfair_lock_unlock(lock);
      int64_t v39 = 1LL;
      id v8 = v65;
      goto LABEL_43;
    }

    os_unfair_lock_assert_owner(lock);
    id v12 = [v68 senderID];
    __int16 IntegerValue = IOHIDEventGetIntegerValue(v10, 2752513LL);
    __int16 v14 = IOHIDEventGetIntegerValue(v10, 2752512LL);
    uint64_t v15 = sub_1000185C0((uint64_t)v10);
    if (!v15)
    {
      id v40 = sub_10003F124();
      v23 = [v40 autorelease];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v42 = sub_1000186BC((uint64_t)v10, v41);
        v43 = v42;
        LODWORD(v69.receiver) = 138543362;
        v69.receiver = v43;
        _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "missing force stage event -- dropping event: %{public}@",  (uint8_t *)&v69,  0xCu);
      }

      goto LABEL_41;
    }

    uint64_t v16 = v15;
    unsigned int v17 = IOHIDEventGetIntegerValue(v15, 2686976LL);
    int v18 = IOHIDEventGetIntegerValue(v16, 2686977LL);
    BKTouchSensitiveButtonKey *v19 = [[BKTouchSensitiveButtonKey alloc] init];
    if (v19)
    {
      v69.id receiver = v19;
      v69.super_class = [BKTouchSensitiveButtonKey class];
      BKHIDTouchSensitiveButtonEventProcessor *v20 = [[BKHIDTouchSensitiveButtonEventProcessor alloc] init];
      v21 = v20;
      if (v20)
      {
        *(void *)&v20->_lock._os_unfair_lock_opaque = v12;
        LOWORD(v20->_buttonScanningController) = IntegerValue;
        WORD1(v20->_buttonScanningController) = v14;
      }
    }

    else
    {
      v21 = 0LL;
    }

    v22 = [self->_lock_eventRecords objectForKey:v21];
    v23 = v21;
    v69.id receiver = v23;
    v64 = v22;
    v69.Class super_class = v64;
    unsigned int v70 = v17;
    int v71 = v18;
    v72 = v10;
    uint64_t v73 = v16;
    id v74 = v68;
    id v75 = v66;
    os_log_type_t v24 = 2 * (v18 == 0);
    id v25 = sub_10003F124();
    v26 = v25;
    if (os_log_type_enabled(v26, v24))
    {
      uint64_t TimeStamp = IOHIDEventGetTimeStamp(v10);
      v29 = sub_1000186BC((uint64_t)v10, v28);
      v30 = (void *)[v29 autorelease];
      *(_DWORD *)buf = 134218242;
      uint64_t v77 = TimeStamp;
      __int16 v78 = 2114;
      v79 = v30;
      _os_log_impl((void *)&_mh_execute_header, v26, v24, "in %llX %{public}@", buf, 0x16u);
    }

    if (!v70)
    {
      id v44 = sub_10003F124();
      p_isa = (id *)v44;
      if (os_log_type_enabled((os_log_t)p_isa, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)p_isa,  OS_LOG_TYPE_ERROR,  "TouchSensitiveButton: got event for idle stage, bailing",  buf,  2u);
      }

      goto LABEL_39;
    }

    if (!v71)
    {
      if (!v69.super_class)
      {
        id v53 = sub_10003F124();
        p_isa = [v53 retain];
        if (os_log_type_enabled((os_log_t)p_isa, OS_LOG_TYPE_ERROR))
        {
          id receiver = v69.receiver;
          v55 = sub_100017EB4(v70);
          v56 = v55;
          *(_DWORD *)buf = 138543618;
          uint64_t v77 = (uint64_t)receiver;
          __int16 v78 = 2114;
          v79 = v56;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)p_isa,  OS_LOG_TYPE_ERROR,  "[TouchSensitiveButton %{public}@]: did not see an enter transition to stage %{public}@, ignoring change event",  buf,  0x16u);
        }

        goto LABEL_39;
      }

      sub_100026DC0(self, (uint64_t)v10, (uint64_t)&v69);
      sub_100026A9C((uint64_t)&v69);
      int v36 = v71;
      Class super_class = v69.super_class;
      if (v69.super_class) {
        Class super_class = v69.super_class[3].isa;
      }
      goto LABEL_19;
    }

    if (v71 != 2)
    {
      if (v71 != 1)
      {
LABEL_40:
        sub_100026A64(&v69.receiver);

LABEL_41:
        goto LABEL_42;
      }

      id v31 = v69.receiver;
      v32 = v69.super_class;
      if (!v32)
      {
        BKTouchSensitiveButtonEventRecord *v32 = [[BKTouchSensitiveButtonEventRecord alloc] init];
        [v69 super_class] = v32;
        lock_eventRecords = self->_lock_eventRecords;
        if (!lock_eventRecords)
        {
          NSMutableDictionary *v34 = [[NSMutableDictionary alloc] init];
          v35 = self->_lock_eventRecords;
          self->_lock_eventRecords = v34;

          lock_eventRecords = self->_lock_eventRecords;
        }

        [lock_eventRecords setObject:v32 forKey:v31];
      }

      sub_100026DC0(self, (uint64_t)v10, (uint64_t)&v69);
      sub_100026A9C((uint64_t)&v69);
      int v36 = v71;
      Class super_class = v69.super_class;
      if (v69.super_class) {
        Class super_class = v69.super_class[3].isa;
      }
LABEL_19:
      p_isa = super_class;
      sub_100026B30((uint64_t)self, (uint64_t)v10, 0LL, v36, p_isa, v75);
LABEL_39:

      goto LABEL_40;
    }

    Class v45 = v69.super_class;
    p_isa = (id *)&v45->isa;
    if (v45)
    {
      uint64_t v46 = v70;
      v47 = v45[2].isa;
      BOOL v48 = [v47 containsIndex:v46];

      if ((v48 & 1) != 0)
      {
        sub_100026A9C((uint64_t)&v69);
        int v49 = v71;
        id v50 = p_isa[3];
        sub_100026B30((uint64_t)self, (uint64_t)v10, 0LL, v49, v50, v75);

        id v51 = p_isa[2];
        BOOL v52 = [v51 count] == 0;

        if (v52) {
          [self->_lock_eventRecords removeObjectForKey:v69.receiver];
        }
        goto LABEL_39;
      }

      id v62 = sub_10003F124();
      os_log_s *v58 = [os_log_s class];
      if (!os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
        goto LABEL_38;
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v77 = (uint64_t)v69.receiver;
      __int16 v78 = 1024;
      LODWORD(v79) = v46;
      v59 = "[TouchSensitiveButton %{public}@]: did not see an enter transition to stage %d, ignoring exit event";
      v60 = v58;
      uint32_t v61 = 18;
    }

    else
    {
      id v57 = sub_10003F124();
      v58 = [os_log logWithCategory:v57];
      if (!os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
LABEL_38:

        goto LABEL_39;
      }

      *(_DWORD *)buf = 138543362;
      uint64_t v77 = (uint64_t)v69.receiver;
      v59 = "[TouchSensitiveButton %{public}@]: did not see an enter transition for this button, ignoring exit event";
      v60 = v58;
      uint32_t v61 = 12;
    }

    _os_log_error_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, v59, buf, v61);
    goto LABEL_38;
  }

  int64_t v39 = 0LL;
LABEL_43:

  return v39;
}

- (void).cxx_destruct
{
}

@end
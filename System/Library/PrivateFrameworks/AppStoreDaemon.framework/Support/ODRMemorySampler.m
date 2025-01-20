@interface ODRMemorySampler
- (id)currentStatsString;
- (id)takeSample;
@end

@implementation ODRMemorySampler

- (id)takeSample
{
  kern_return_t v3;
  mach_error_t v4;
  uint64_t v5;
  os_log_s *v6;
  char *v8;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out;
  uint64_t v11;
  uint8_t buf[4];
  char *v13;
  task_info_outCnt = 48;
  v3 = task_info(mach_task_self_, 0x14u, &task_info_out, &task_info_outCnt);
  if (!v3) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v11));
  }
  v4 = v3;
  sub_10027D4B4(self);
  v5 = ASDLogHandleForCategory(19LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v8 = mach_error_string(v4);
    *(_DWORD *)buf = 136446210;
    v13 = v8;
    _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "ODRMemorySampler failed to take sample with error %{public}s.  Sampler stopped.",  buf,  0xCu);
  }

  return 0LL;
}

- (id)currentStatsString
{
  v2 = self;
  objc_sync_enter(v2);
  bytesFormatter = v2->_bytesFormatter;
  if (!bytesFormatter)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___NSByteCountFormatter);
    v5 = v2->_bytesFormatter;
    v2->_bytesFormatter = v4;

    bytesFormatter = v2->_bytesFormatter;
  }

  id v6 = sub_10027D574(v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSByteCountFormatter stringFromByteCount:]( bytesFormatter,  "stringFromByteCount:",  [v7 integerValue]));
  v9 = v2->_bytesFormatter;
  id v10 = sub_10027D5E0(v2);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSByteCountFormatter stringFromByteCount:]( v9,  "stringFromByteCount:",  [v11 integerValue]));
  v13 = v2->_bytesFormatter;
  id v14 = sub_10027D508(v2);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  [v15 floatValue];
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSByteCountFormatter stringFromByteCount:](v13, "stringFromByteCount:", (unint64_t)v16));
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Min:%@, Max:%@, Avg:%@",  v8,  v12,  v17));

  objc_sync_exit(v2);
  return v18;
}

- (void).cxx_destruct
{
}

@end
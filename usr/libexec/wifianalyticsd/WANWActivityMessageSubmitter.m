@interface WANWActivityMessageSubmitter
- (WANWActivityMessageSubmitter)initWithMessageGroupType:(int64_t)a3;
- (id)submitMessage:(id)a3;
- (int64_t)groupTypeForThisSubmitter;
- (void)setGroupTypeForThisSubmitter:(int64_t)a3;
@end

@implementation WANWActivityMessageSubmitter

- (WANWActivityMessageSubmitter)initWithMessageGroupType:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___WANWActivityMessageSubmitter;
  v4 = -[WANWActivityMessageSubmitter init](&v10, "init");
  v4->_groupTypeForThisSubmitter = a3;
  if (!qword_1000ED058)
  {
    qword_1000ED058 = symptom_framework_init(108LL, "com.apple.wifi.analytics");
    if (!qword_1000ED058)
    {
      id v6 = WALogCategoryDefaultHandle();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v12 = "-[WANWActivityMessageSubmitter initWithMessageGroupType:]";
        __int16 v13 = 1024;
        int v14 = 73;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Error creating reporter",  buf,  0x12u);
      }

      id v8 = WALogCategoryDefaultHandle();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v12 = "-[WANWActivityMessageSubmitter initWithMessageGroupType:]";
        __int16 v13 = 1024;
        int v14 = 78;
        __int16 v15 = 2048;
        int64_t v16 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Error configuring groupType: %ld",  buf,  0x1Cu);
      }

      return 0LL;
    }
  }

  return v4;
}

- (id)submitMessage:(id)a3
{
  id v4 = a3;
  id v5 = WALogCategoryDefaultHandle();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 key]);
    *(_DWORD *)buf = 136446722;
    v60 = "-[WANWActivityMessageSubmitter submitMessage:]";
    __int16 v61 = 1024;
    int v62 = 87;
    __int16 v63 = 2112;
    v64 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Attempting to submit: %@",  buf,  0x1Cu);
  }

  id v8 = WALogCategoryDefaultHandle();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "WANWActivityMessageSubmitter submitMessage",  (const char *)&unk_1000B76E7,  buf,  2u);
  }

  objc_super v10 = objc_autoreleasePoolPush();
  uint64_t v11 = symptom_new(qword_1000ED058, 421896LL);
  if (!v11)
  {
    id v42 = WALogCategoryDefaultHandle();
    v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v60 = "-[WANWActivityMessageSubmitter submitMessage:]";
      __int16 v61 = 1024;
      int v62 = 92;
      _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Error creating symptom",  buf,  0x12u);
    }

    NSErrorUserInfoKey v73 = NSLocalizedFailureReasonErrorKey;
    v74 = @"WAErrorCodeSubmissionModelFailure";
    v44 = &v74;
    v45 = &v73;
    goto LABEL_32;
  }

  uint64_t v12 = v11;
  int v13 = symptom_set_qualifier(v11, 5LL, 0LL);
  if (v13)
  {
    int v46 = v13;
    id v47 = WALogCategoryDefaultHandle();
    v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v60 = "-[WANWActivityMessageSubmitter submitMessage:]";
      __int16 v61 = 1024;
      int v62 = 94;
      __int16 v63 = 1024;
      LODWORD(v64) = v46;
      _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Error setting symptom qualifier kNWActivityQualifierWiFiFragment %d",  buf,  0x18u);
    }

    NSErrorUserInfoKey v71 = NSLocalizedFailureReasonErrorKey;
    v72 = @"WAErrorCodeSubmissionModelFailure";
    v44 = &v72;
    v45 = &v71;
    goto LABEL_32;
  }

  uint64_t v14 = objc_claimAutoreleasedReturnValue( -[WAProtobufMessageSubmitter instantiateAWDProtobufAndPopulateValues:]( self,  "instantiateAWDProtobufAndPopulateValues:",  v4));
  if (!v14)
  {
    id v49 = WALogCategoryDefaultHandle();
    v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v60 = "-[WANWActivityMessageSubmitter submitMessage:]";
      __int16 v61 = 1024;
      int v62 = 98;
      _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Error creating data to send to symptom_send",  buf,  0x12u);
    }

    NSErrorUserInfoKey v69 = NSLocalizedFailureReasonErrorKey;
    v70 = @"WAErrorCodeSubmissionModelFailure";
    v44 = &v70;
    v45 = &v69;
LABEL_32:
    v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v44,  v45,  1LL));
    id v17 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifi.analytics.errordomain",  9007LL,  v51));

    objc_autoreleasePoolPop(v10);
    goto LABEL_20;
  }

  __int16 v15 = (void *)v14;
  id v56 = 0LL;
  int64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v14,  1LL,  &v56));
  id v17 = v56;
  id v18 = WALogCategoryDefaultHandle();
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v20 = (objc_class *)objc_opt_class(v15);
    v21 = NSStringFromClass(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    id v23 = [v16 length];
    *(_DWORD *)buf = 136447234;
    v60 = "-[WANWActivityMessageSubmitter submitMessage:]";
    __int16 v61 = 1024;
    int v62 = 101;
    __int16 v63 = 2112;
    v64 = v22;
    __int16 v65 = 2048;
    id v66 = v23;
    __int16 v67 = 2112;
    id v68 = v17;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Size of %@: %zd %@", buf, 0x30u);
  }

  id v24 = [v16 length];
  id v25 = v16;
  int v26 = symptom_set_additional_qualifier(v12, 5, v24, [v25 bytes]);
  id v27 = WALogCategoryDefaultHandle();
  v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446722;
    v60 = "-[WANWActivityMessageSubmitter submitMessage:]";
    __int16 v61 = 1024;
    int v62 = 117;
    __int16 v63 = 1024;
    LODWORD(v64) = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:symptom_set_additional_qualifier: %d",  buf,  0x18u);
  }

  id v29 = WALogCategoryDefaultHandle();
  v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
  if (os_signpost_enabled(v30))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v30,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "WANWActivityMessageSubmitter symptom_send",  (const char *)&unk_1000B76E7,  buf,  2u);
  }

  int v31 = symptom_send(v12);
  id v32 = WALogCategoryDefaultHandle();
  v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  if (os_signpost_enabled(v33))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v33,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "WANWActivityMessageSubmitter symptom_send",  (const char *)&unk_1000B76E7,  buf,  2u);
  }

  if (v31)
  {
    id v52 = WALogCategoryDefaultHandle();
    v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v60 = "-[WANWActivityMessageSubmitter submitMessage:]";
      __int16 v61 = 1024;
      int v62 = 123;
      __int16 v63 = 1024;
      LODWORD(v64) = v31;
      _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Error symptom_send() %d",  buf,  0x18u);
    }

    NSErrorUserInfoKey v57 = NSLocalizedFailureReasonErrorKey;
    v58 = @"WAErrorCodeSubmissionModelFailure";
    v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v58,  &v57,  1LL));
    uint64_t v55 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifi.analytics.errordomain",  9007LL,  v54));

    objc_autoreleasePoolPop(v10);
    id v17 = (id)v55;
  }

  else
  {

    objc_autoreleasePoolPop(v10);
    id v34 = WALogCategoryDefaultHandle();
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue([v4 key]);
      *(_DWORD *)buf = 136446722;
      v60 = "-[WANWActivityMessageSubmitter submitMessage:]";
      __int16 v61 = 1024;
      int v62 = 127;
      __int16 v63 = 2112;
      v64 = v36;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEBUG,  "%{public}s::%d:Submit complete: %@",  buf,  0x1Cu);
    }
  }

- (int64_t)groupTypeForThisSubmitter
{
  return self->_groupTypeForThisSubmitter;
}

- (void)setGroupTypeForThisSubmitter:(int64_t)a3
{
  self->_groupTypeForThisSubmitter = a3;
}

@end
@interface MADPreWarmOCRTask
- (BOOL)run:(id *)a3;
- (MADPreWarmOCRTask)initWithCompletionHandler:(id)a3 cancelOrExtendTimeoutBlock:(id)a4;
@end

@implementation MADPreWarmOCRTask

- (MADPreWarmOCRTask)initWithCompletionHandler:(id)a3 cancelOrExtendTimeoutBlock:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MADPreWarmOCRTask;
  v7 = -[MADPreWarmOCRTask initWithCompletionHandler:](&v11, "initWithCompletionHandler:", a3);
  if (v7)
  {
    id v8 = objc_retainBlock(v6);
    id cancelOrExtendTimeoutBlock = v7->_cancelOrExtendTimeoutBlock;
    v7->_id cancelOrExtendTimeoutBlock = v8;
  }

  return v7;
}

- (BOOL)run:(id *)a3
{
  uint64_t v5 = MediaAnalysisLogLevel(self, a2);
  if ((int)v5 >= 5)
  {
    uint64_t v7 = VCPLogInstance(v5, v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    os_log_type_t v9 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v8, v9))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Pre-warming OCR models", buf, 2u);
    }
  }

  id v10 = +[CRImageReader defaultRevisionNumber](&OBJC_CLASS___CRImageReader, "defaultRevisionNumber");
  id cancelOrExtendTimeoutBlock = self->_cancelOrExtendTimeoutBlock;
  id v30 = 0LL;
  unsigned __int8 v12 = +[CRImageReader preheatModelsForOptions:revision:extendedTimeoutBlock:error:]( &OBJC_CLASS___CRImageReader,  "preheatModelsForOptions:revision:extendedTimeoutBlock:error:",  &__NSDictionary0__struct,  v10,  cancelOrExtendTimeoutBlock,  &v30);
  id v13 = v30;
  v15 = v13;
  if ((v12 & 1) != 0)
  {
    uint64_t v16 = MediaAnalysisLogLevel(v13, v14);
    if ((int)v16 >= 5)
    {
      uint64_t v18 = VCPLogInstance(v16, v17);
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      os_log_type_t v20 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v19, v20))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "Successfully pre-warmed OCR models", buf, 2u);
      }
    }

    id v21 = (id)objc_claimAutoreleasedReturnValue(-[MADPreWarmOCRTask completionHandler](self, "completionHandler"));
    (*((void (**)(id, void, void))v21 + 2))(v21, 0LL, 0LL);
    goto LABEL_17;
  }

  uint64_t v22 = MediaAnalysisLogLevel(v13, v14);
  if ((int)v22 >= 3)
  {
    uint64_t v24 = VCPLogInstance(v22, v23);
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    os_log_type_t v26 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue([v15 description]);
      *(_DWORD *)buf = 138412290;
      v32 = v27;
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "Failed to pre-warm OCR models (%@)", buf, 0xCu);
    }
  }

  if (a3)
  {
    id v28 = [v15 copy];
    id v21 = *a3;
    *a3 = v28;
LABEL_17:
  }

  return v12;
}

- (void).cxx_destruct
{
}

@end
@interface GTMTLReplayActivityLog
- (GTMTLReplayActivityLog)initWithLog:(id)a3;
- (NSString)gputracePath;
- (id)description;
- (id)getBreadcrumbSummary;
- (id)getBreadcrumbsAsJSON;
- (id)init:(BOOL)a3;
- (void)enterActivity:(id)a3;
- (void)enterArgumentBufferDownload;
- (void)enterArgumentBufferUpload;
- (void)enterCollectCounters:(id)a3 statLocations:(unint64_t)a4 withIndex:(unint64_t)a5;
- (void)enterDebugFuncStopFromIndex:(id)a3 toIndex:(id)a4;
- (void)enterDisplayAttachmentAtIndex:(id)a3;
- (void)enterHarvestResourceObjectWithAttributes:(id)a3;
- (void)enterLoadArchiveWithPath:(id)a3;
- (void)enterMessage:(id)a3;
- (void)enterOptimizeRestores;
- (void)enterPerformFrameTimingForIndex:(int)a3;
- (void)enterRestoreCommandBufferAtIndex:(unsigned int)a3;
- (void)enterRestoreResources:(const GTResourceDownloaderRequest *)a3 count:(int)a4;
- (void)enterRewind;
- (void)leaveActivity;
- (void)logActivitiesToFile:(id)a3;
- (void)logCommandBuffer:(id)a3 atIndex:(unsigned int)a4;
- (void)logCommandBuffer:(id)a3 withKey:(unint64_t)a4;
- (void)logSharedCommandBuffer:(id)a3;
@end

@implementation GTMTLReplayActivityLog

- (id)init:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___GTMTLReplayActivityLog;
  v4 = -[GTMTLReplayActivityLog init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_log, &_os_log_default);
    v5->_lock._os_unfair_lock_opaque = 0;
    v5->_retainActivityLog = a3;
  }

  return v5;
}

- (GTMTLReplayActivityLog)initWithLog:(id)a3
{
  v4 = (id *)a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___GTMTLReplayActivityLog;
  v5 = -[GTMTLReplayActivityLog init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    if (!v4)
    {
      objc_super v7 = 0LL;
      goto LABEL_6;
    }

    objc_storeStrong((id *)&v5->_log, v4[1]);
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_gputracePath, v4[2]);
    objc_storeStrong((id *)&v6->_lastBreadcrumb, v4[3]);
    objc_storeStrong((id *)&v6->_lastActivity, v4[4]);
    v6->_retainActivityLog = *((_BYTE *)v4 + 40);
  }

  objc_super v7 = v6;
LABEL_6:

  return v7;
}

- (id)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = ArrayFromActivities(self->_lastBreadcrumb, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 description]);

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)logActivitiesToFile:(id)a3
{
  id v4 = ArrayFromActivities(a3, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v5,  3LL,  0LL));

  objc_super v7 = objc_alloc(&OBJC_CLASS___NSURL);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 temporaryDirectory]);
  v10 = -[NSURL initFileURLWithPath:relativeToURL:]( v7,  "initFileURLWithPath:relativeToURL:",  @"GTMTLReplayActivityLog.json",  v9);

  [v6 writeToURL:v10 atomically:0];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v12 = log;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](v10, "path"));
    int v14 = 138543362;
    v15 = v13;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "logPath:\t%{public}@", (uint8_t *)&v14, 0xCu);
  }
}

- (void)logCommandBuffer:(id)a3 atIndex:(unsigned int)a4
{
  if (a3)
  {
    p_lock = &self->_lock;
    id v7 = a3;
    os_unfair_lock_lock(p_lock);
    v8 = self->_gputracePath;
    objc_super v9 = self->_lastBreadcrumb;
    v10 = self->_lastActivity;
    -[GTMTLReplayActivity signpostIntervalBegin:]( v9,  "signpostIntervalBegin:",  os_signpost_id_make_with_pointer((os_log_t)g_signpostLog, v7));
    os_unfair_lock_unlock(p_lock);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = __51__GTMTLReplayActivityLog_logCommandBuffer_atIndex___block_invoke;
    v14[3] = &unk_58E6E8;
    unsigned int v19 = a4;
    v15 = v9;
    v16 = v8;
    v17 = self;
    v18 = v10;
    v11 = v10;
    v12 = v8;
    v13 = v9;
    [v7 addCompletedHandler:v14];
  }

- (void)logCommandBuffer:(id)a3 withKey:(unint64_t)a4
{
  if (a3)
  {
    p_lock = &self->_lock;
    id v7 = a3;
    os_unfair_lock_lock(p_lock);
    v8 = self->_gputracePath;
    objc_super v9 = self->_lastBreadcrumb;
    v10 = self->_lastActivity;
    -[GTMTLReplayActivity signpostIntervalBegin:]( v9,  "signpostIntervalBegin:",  os_signpost_id_make_with_pointer((os_log_t)g_signpostLog, v7));
    os_unfair_lock_unlock(p_lock);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = __51__GTMTLReplayActivityLog_logCommandBuffer_withKey___block_invoke;
    v14[3] = &unk_58E710;
    v18 = v10;
    unint64_t v19 = a4;
    v15 = v9;
    v16 = v8;
    v17 = self;
    v11 = v10;
    v12 = v8;
    v13 = v9;
    [v7 addCompletedHandler:v14];
  }

- (void)logSharedCommandBuffer:(id)a3
{
}

- (id)getBreadcrumbSummary
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = BreadcrumbSummary(self->_lastBreadcrumb);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (id)getBreadcrumbsAsJSON
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = ArrayFromActivities(self->_lastBreadcrumb, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v5,  3LL,  0LL));

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)enterActivity:(id)a3
{
  id v4 = (GTMTLReplayActivity *)a3;
  os_unfair_lock_lock(&self->_lock);
  -[GTMTLReplayActivity setPreviousActivity:](v4, "setPreviousActivity:", self->_lastBreadcrumb);
  lastBreadcrumb = self->_lastBreadcrumb;
  self->_lastBreadcrumb = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)leaveActivity
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v7 = self->_lastBreadcrumb;
  id v4 = (GTMTLReplayActivity *)objc_claimAutoreleasedReturnValue(-[GTMTLReplayActivity previousActivity](v7, "previousActivity"));
  lastBreadcrumb = self->_lastBreadcrumb;
  self->_lastBreadcrumb = v4;

  if (!self->_lastBreadcrumb && self->_retainActivityLog)
  {
    v6 = (GTMTLReplayActivity *)-[GTMTLReplayActivity copy](v7, "copy");

    -[GTMTLReplayActivity setEndTime:](v6, "setEndTime:", mach_absolute_time());
    -[GTMTLReplayActivity setPreviousActivity:](v6, "setPreviousActivity:", self->_lastActivity);
    objc_storeStrong((id *)&self->_lastActivity, v6);
    id v7 = v6;
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)enterMessage:(id)a3
{
  id v4 = a3;
  v5 = -[GTMTLReplayActivityMessage initWithMessage:]( objc_alloc(&OBJC_CLASS___GTMTLReplayActivityMessage),  "initWithMessage:",  v4);

  -[GTMTLReplayActivityLog enterActivity:](self, "enterActivity:", v5);
}

- (void)enterLoadArchiveWithPath:(id)a3
{
  id v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  gputracePath = self->_gputracePath;
  self->_gputracePath = v4;
  v6 = v4;

  os_unfair_lock_unlock(&self->_lock);
  id v7 = -[GTMTLReplayActivityLoadArchive initWithPath:]( objc_alloc(&OBJC_CLASS___GTMTLReplayActivityLoadArchive),  "initWithPath:",  v6);

  -[GTMTLReplayActivityLog enterActivity:](self, "enterActivity:", v7);
}

- (void)enterHarvestResourceObjectWithAttributes:(id)a3
{
  id v4 = a3;
  v5 = -[GTMTLReplayActivityHarvestResourceObject initWithAttributes:]( objc_alloc(&OBJC_CLASS___GTMTLReplayActivityHarvestResourceObject),  "initWithAttributes:",  v4);

  -[GTMTLReplayActivityLog enterActivity:](self, "enterActivity:", v5);
}

- (void)enterRestoreCommandBufferAtIndex:(unsigned int)a3
{
  id v4 = -[GTMTLReplayActivityRestoreCommandBuffer initWithIndex:]( objc_alloc(&OBJC_CLASS___GTMTLReplayActivityRestoreCommandBuffer),  "initWithIndex:",  *(void *)&a3);
  -[GTMTLReplayActivityLog enterActivity:](self, "enterActivity:", v4);
}

- (void)enterRestoreResources:(const GTResourceDownloaderRequest *)a3 count:(int)a4
{
  v5 = -[GTMTLReplayActivityRestoreResources initWithRequests:count:]( objc_alloc(&OBJC_CLASS___GTMTLReplayActivityRestoreResources),  "initWithRequests:count:",  a3,  *(void *)&a4);
  -[GTMTLReplayActivityLog enterActivity:](self, "enterActivity:", v5);
}

- (void)enterRewind
{
  v3 = -[GTMTLReplayActivity initWithType:]( objc_alloc(&OBJC_CLASS___GTMTLReplayActivity),  "initWithType:",  @"rewind");
  -[GTMTLReplayActivityLog enterActivity:](self, "enterActivity:", v3);
}

- (void)enterArgumentBufferUpload
{
  v3 = -[GTMTLReplayActivity initWithType:]( objc_alloc(&OBJC_CLASS___GTMTLReplayActivity),  "initWithType:",  @"argumentBufferUpload");
  -[GTMTLReplayActivityLog enterActivity:](self, "enterActivity:", v3);
}

- (void)enterArgumentBufferDownload
{
  v3 = -[GTMTLReplayActivity initWithType:]( objc_alloc(&OBJC_CLASS___GTMTLReplayActivity),  "initWithType:",  @"argumentBufferDownload");
  -[GTMTLReplayActivityLog enterActivity:](self, "enterActivity:", v3);
}

- (void)enterDebugFuncStopFromIndex:(id)a3 toIndex:(id)a4
{
  v5 = -[GTMTLReplayActivityDebugFuncStop initWithCurrentIndex:targetIndex:]( objc_alloc(&OBJC_CLASS___GTMTLReplayActivityDebugFuncStop),  "initWithCurrentIndex:targetIndex:",  a3,  a4);
  -[GTMTLReplayActivityLog enterActivity:](self, "enterActivity:", v5);
}

- (void)enterCollectCounters:(id)a3 statLocations:(unint64_t)a4 withIndex:(unint64_t)a5
{
  id v8 = a3;
  objc_super v9 = -[GTMTLReplayActivityCollectCounters initWithCounters:statLocations:index:]( objc_alloc(&OBJC_CLASS___GTMTLReplayActivityCollectCounters),  "initWithCounters:statLocations:index:",  v8,  a4,  a5);

  -[GTMTLReplayActivityLog enterActivity:](self, "enterActivity:", v9);
}

- (void)enterPerformFrameTimingForIndex:(int)a3
{
  id v4 = -[GTMTLReplayActivityPerformFrameTiming initWithIndex:]( objc_alloc(&OBJC_CLASS___GTMTLReplayActivityPerformFrameTiming),  "initWithIndex:",  *(void *)&a3);
  -[GTMTLReplayActivityLog enterActivity:](self, "enterActivity:", v4);
}

- (void)enterDisplayAttachmentAtIndex:(id)a3
{
  id v4 = -[GTMTLReplayActivityDisplayAttachment initWithIndex:]( objc_alloc(&OBJC_CLASS___GTMTLReplayActivityDisplayAttachment),  "initWithIndex:",  a3);
  -[GTMTLReplayActivityLog enterActivity:](self, "enterActivity:", v4);
}

- (void)enterOptimizeRestores
{
  v3 = -[GTMTLReplayActivity initWithType:]( objc_alloc(&OBJC_CLASS___GTMTLReplayActivity),  "initWithType:",  @"optimizeRestores");
  -[GTMTLReplayActivityLog enterActivity:](self, "enterActivity:", v3);
}

- (NSString)gputracePath
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void).cxx_destruct
{
}

void __51__GTMTLReplayActivityLog_logCommandBuffer_withKey___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = g_signpostLog;
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer((os_log_t)g_signpostLog, v3);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v6 = v5;
    if (os_signpost_enabled((os_log_t)v4))
    {
      *(_DWORD *)buf = 134217984;
      id v21 = [v3 status];
      _os_signpost_emit_with_name_impl( &dword_0,  (os_log_t)v4,  OS_SIGNPOST_INTERVAL_END,  v6,  "Replayer-3-commandQueue",  "%lu",  buf,  0xCu);
    }
  }

  if ([v3 status] == (char *)&dword_4 + 1)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)(a1 + 64),  @"GTErrorKeyTraceStreamID"));
    v19[0] = v7;
    v18[1] = @"GTErrorKeyMTLCommandBuffer";
    id v8 = GTMTLReplay_dictionaryFromCommandBuffer(v3);
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v19[1] = v9;
    v18[2] = @"GTErrorKeyReplayerContext";
    v10 = BreadcrumbSummary(*(void **)(a1 + 32));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v19[2] = v11;
    v18[3] = @"GTErrorKeyReplayerBreadcrumbs";
    id v12 = ArrayFromActivities(*(void **)(a1 + 32), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v13,  3LL,  0LL));
    v19[3] = v14;
    v18[4] = @"GTErrorKeyGputracePath";
    v15 = *(void **)(a1 + 40);
    v16 = v15;
    if (!v15) {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }
    v19[4] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  5LL));
    if (!v15) {

    }
    [*(id *)(a1 + 48) logActivitiesToFile:*(void *)(a1 + 56)];
    GTMTLReplay_handleCommandBufferError((uint64_t)v17);
  }
}

void __51__GTMTLReplayActivityLog_logCommandBuffer_atIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = g_signpostLog;
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer((os_log_t)g_signpostLog, v3);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v6 = v5;
    if (os_signpost_enabled((os_log_t)v4))
    {
      *(_DWORD *)buf = 134217984;
      id v21 = [v3 status];
      _os_signpost_emit_with_name_impl( &dword_0,  (os_log_t)v4,  OS_SIGNPOST_INTERVAL_END,  v6,  "Replayer-3-commandQueue",  "%lu",  buf,  0xCu);
    }
  }

  if ([v3 status] == (char *)&dword_4 + 1)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(a1 + 64),  @"GTErrorKeyFunctionIndex"));
    v19[0] = v7;
    v18[1] = @"GTErrorKeyMTLCommandBuffer";
    id v8 = GTMTLReplay_dictionaryFromCommandBuffer(v3);
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v19[1] = v9;
    v18[2] = @"GTErrorKeyReplayerContext";
    v10 = BreadcrumbSummary(*(void **)(a1 + 32));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v19[2] = v11;
    v18[3] = @"GTErrorKeyReplayerBreadcrumbs";
    id v12 = ArrayFromActivities(*(void **)(a1 + 32), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v13,  3LL,  0LL));
    v19[3] = v14;
    v18[4] = @"GTErrorKeyGputracePath";
    v15 = *(void **)(a1 + 40);
    v16 = v15;
    if (!v15) {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }
    v19[4] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  5LL));
    if (!v15) {

    }
    [*(id *)(a1 + 48) logActivitiesToFile:*(void *)(a1 + 56)];
    GTMTLReplay_handleCommandBufferError((uint64_t)v17);
  }
}

@end
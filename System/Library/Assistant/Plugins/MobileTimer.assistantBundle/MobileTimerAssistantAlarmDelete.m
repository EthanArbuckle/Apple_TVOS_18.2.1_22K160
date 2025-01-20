@interface MobileTimerAssistantAlarmDelete
- (void)_performWithCompletion:(id)a3;
- (void)performWithCompletion:(id)a3;
@end

@implementation MobileTimerAssistantAlarmDelete

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MTLogForCategory(3LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_11598(v6, v7, v8, v9, v10, v11, v12, v13);
  }

  -[MobileTimerAssistantAlarmDelete _performWithCompletion:](self, "_performWithCompletion:", v4);
  uint64_t v14 = MTLogForCategory(3LL);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_11528(v15, v16, v17, v18, v19, v20, v21, v22);
  }
}

- (void)_performWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  uint64_t v5 = MTLogForCategory(3LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[MobileTimerAssistantAlarmDelete _performWithCompletion:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = self;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%s %{public}@ fetching alarms", buf, 0x16u);
  }

  uint64_t v7 = objc_opt_new(&OBJC_CLASS___MTAlarmManager);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAlarmManager alarms](v7, "alarms"));
  objc_initWeak(&location, self);
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  v35 = sub_C154;
  v36 = sub_C164;
  id v37 = 0LL;
  v28[0] = _NSConcreteStackBlock;
  v28[2] = sub_C16C;
  v28[3] = &unk_18790;
  v28[1] = 3221225472LL;
  objc_copyWeak(&v30, &location);
  uint64_t v10 = v7;
  v29 = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 flatMap:v28]);
  uint64_t v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472LL;
  v23 = sub_C8C4;
  v24 = &unk_186A0;
  objc_copyWeak(&v27, &location);
  v26 = buf;
  uint64_t v12 = v9;
  v25 = v12;
  id v13 = [v11 addSuccessBlock:&v21];
  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v14 = MTLogForCategory(3LL);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(void *)&buf[8] + 40), "dictionary", v21, v22, v23, v24));
    sub_1165C((uint64_t)self, v16, v33);
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)&buf[8] + 40) dictionary]);
  v4[2](v4, v17);

  uint64_t v18 = MTLogForCategory(3LL);
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)&buf[8] + 40) dictionary]);
    sub_11608((uint64_t)self, v20, v32);
  }

  objc_destroyWeak(&v27);
  objc_destroyWeak(&v30);
  _Block_object_dispose(buf, 8);

  objc_destroyWeak(&location);
}

@end
@interface MobileTimerAssistantTimerCancel
- (void)_performWithCompletion:(id)a3;
- (void)performWithCompletion:(id)a3;
@end

@implementation MobileTimerAssistantTimerCancel

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MTLogForCategory(4LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_11A50(v6, v7, v8, v9, v10, v11, v12, v13);
  }

  -[MobileTimerAssistantTimerCancel _performWithCompletion:](self, "_performWithCompletion:", v4);
  uint64_t v14 = MTLogForCategory(4LL);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_119E0(v15, v16, v17, v18, v19, v20, v21, v22);
  }
}

- (void)_performWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  uint64_t v5 = MTLogForCategory(4LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ fetching timer", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v7 = (void *)objc_opt_new(&OBJC_CLASS___MTTimerManager);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentTimer]);
  objc_initWeak(&location, self);
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v38 = 0x3032000000LL;
  v39 = sub_DC18;
  v40 = sub_DC28;
  id v41 = 0LL;
  v31[0] = _NSConcreteStackBlock;
  v31[2] = sub_DC30;
  v31[3] = &unk_18610;
  v31[1] = 3221225472LL;
  objc_copyWeak(&v33, &location);
  id v10 = v7;
  id v32 = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 flatMap:v31]);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_DE4C;
  v27[3] = &unk_18638;
  objc_copyWeak(&v30, &location);
  p___int128 buf = &buf;
  uint64_t v12 = v9;
  v28 = v12;
  id v13 = [v11 addSuccessBlock:v27];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_DF30;
  v23[3] = &unk_185C0;
  objc_copyWeak(&v26, &location);
  v25 = &buf;
  uint64_t v14 = v12;
  v24 = v14;
  id v15 = [v11 addFailureBlock:v23];
  dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v16 = MTLogForCategory(4LL);
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&buf + 1) + 40) dictionary]);
    sub_11B14((uint64_t)self, v18, v36);
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&buf + 1) + 40) dictionary]);
  v4[2](v4, v19);

  uint64_t v20 = MTLogForCategory(4LL);
  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&buf + 1) + 40) dictionary]);
    sub_11AC0((uint64_t)self, v22, v35);
  }

  +[MTAnalytics incrementEventCount:](&OBJC_CLASS___MTAnalytics, "incrementEventCount:", kMTCASiriTimerCancels);
  objc_destroyWeak(&v26);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v33);
  _Block_object_dispose(&buf, 8);

  objc_destroyWeak(&location);
}

@end
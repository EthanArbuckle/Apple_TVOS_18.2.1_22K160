@interface MobileTimerAssistantTimerGet
- (void)_performWithCompletion:(id)a3;
- (void)performWithCompletion:(id)a3;
@end

@implementation MobileTimerAssistantTimerGet

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MTLogForCategory(4LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_11390(v6, v7, v8, v9, v10, v11, v12, v13);
  }

  -[MobileTimerAssistantTimerGet _performWithCompletion:](self, "_performWithCompletion:", v4);
  uint64_t v14 = MTLogForCategory(4LL);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_11320(v15, v16, v17, v18, v19, v20, v21, v22);
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
  uint64_t v33 = 0x3032000000LL;
  v34 = sub_B210;
  v35 = sub_B220;
  id v36 = 0LL;
  v25[0] = _NSConcreteStackBlock;
  v25[2] = sub_B228;
  v25[3] = &unk_18848;
  v25[1] = 3221225472LL;
  objc_copyWeak(&v28, &location);
  p___int128 buf = &buf;
  uint64_t v10 = v9;
  v26 = v10;
  id v11 = [v8 addSuccessBlock:v25];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_B358;
  v21[3] = &unk_185C0;
  objc_copyWeak(&v24, &location);
  v23 = &buf;
  uint64_t v12 = v10;
  uint64_t v22 = v12;
  id v13 = [v8 addFailureBlock:v21];
  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v14 = MTLogForCategory(4LL);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&buf + 1) + 40) dictionary]);
    sub_11454((uint64_t)self, v16, v31);
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&buf + 1) + 40) dictionary]);
  v4[2](v4, v17);

  uint64_t v18 = MTLogForCategory(4LL);
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&buf + 1) + 40) dictionary]);
    sub_11400((uint64_t)self, v20, v30);
  }

  +[MTAnalytics incrementEventCount:](&OBJC_CLASS___MTAnalytics, "incrementEventCount:", kMTCASiriTimerSearches);
  objc_destroyWeak(&v24);

  objc_destroyWeak(&v28);
  _Block_object_dispose(&buf, 8);

  objc_destroyWeak(&location);
}

@end
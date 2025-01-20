void sub_1000032E0(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void v7[5];
  id v8;
  v3 = (void *)objc_claimAutoreleasedReturnValue([a2 asDictionary]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) results]);
  [v4 setObject:v3 forKeyedSubscript:@"download"];

  v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pass]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000033A8;
  v7[3] = &unk_100004120;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  v8 = v6;
  [v5 startUploadWithCompletion:v7];
}

uint64_t sub_1000033A8(uint64_t a1, void *a2)
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a2 asDictionary]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) results]);
  [v4 setObject:v3 forKeyedSubscript:@"upload"];

  [*(id *)(a1 + 32) saveResults];
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

id objc_msgSend_temporaryDirectory(void *a1, const char *a2, ...)
{
  return [a1 temporaryDirectory];
}
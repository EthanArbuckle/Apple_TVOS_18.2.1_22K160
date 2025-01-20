uint64_t sub_36FC(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = *(_BYTE *)(*(void *)(result + 32) + 24LL);
  return result;
}

void *sub_3710(void *result)
{
  uint64_t v1 = result[4];
  if (!*(_BYTE *)(v1 + 24))
  {
    v2 = result;
    v3 = (os_log_s *)qword_8688;
    if (os_log_type_enabled((os_log_t)qword_8688, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "GlobalNNLM: Invalidating", v4, 2u);
      uint64_t v1 = v2[4];
    }

    *(_BYTE *)(v1 + 24) = 1;
    return [*(id *)(v2[4] + 16) invalidate];
  }

  return result;
}
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}
ue)
    __assert_rtn("-[GlobalNNLMFidesPlugin _invalidated]", "GlobalNNLMFidesPlugin.m", 54, "_queue");
  dispatch_assert_queue_not_V2((dispatch_queue_t)queue);
  v8 = 0LL;
  v9 = &v8;
  v10 = 0x2020000000LL;
  v4 = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_36FC;
  v7[3] = &unk_4098;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync((dispatch_queue_t)v4, v7);
  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (BOOL)shouldDownloadAttachmentWithURL:(id)a3 recipe:(id)a4 recordInfo:(id)a5
{
  return 0;
}

- (void).cxx_destruct
{
}

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___GlobalNNLMFidesPlugin, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.speech.fides", "GlobalNNLMFidesPlugin");
    v3 = (void *)qword_8688;
    qword_8688 = (uint64_t)v2;
  }

@end
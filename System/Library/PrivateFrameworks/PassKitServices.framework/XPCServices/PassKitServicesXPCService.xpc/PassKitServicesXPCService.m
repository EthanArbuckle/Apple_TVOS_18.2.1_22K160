int main(int argc, const char **argv, const char **envp)
{
  ServiceDelegate *v3;
  void *v4;
  v3 = objc_alloc_init(&OBJC_CLASS___ServiceDelegate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}
);
}

- (void)imageDataForPassUniqueIdentifier:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  id v7 = a3;
  v6 = (void (**)(id, void))a5;
  if (v6)
  {
    [v7 length];
    v6[2](v6, 0LL);
  }
}

- (void)imageDataForRecurringPaymentMemo:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  if (a5) {
    (*((void (**)(id, void, CGSize, __n128))a5 + 2))(a5, 0LL, a4, *(__n128 *)&a4.height);
  }
}

@end
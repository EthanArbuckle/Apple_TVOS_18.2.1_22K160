double sub_100001D20(uint64_t a1, double a2, double a3, double a4)
{
  double v4;
  double result;
  v4 = a2 + a4 + 4.0;
  result = fmax(a2, a4);
  if (!*(_BYTE *)(a1 + 32)) {
    return v4;
  }
  return result;
}

uint64_t start()
{
  v0 = objc_alloc_init(&OBJC_CLASS____UISecureControlService);
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v1 setDelegate:v0];
  [v1 resume];

  return 0LL;
}

id objc_msgSend_initWithDrawingPlan_cornerStyle_cornerRadius_foregroundColor_backgroundColor_imagePlacement_leftToRight_size_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithDrawingPlan:cornerStyle:cornerRadius:foregroundColor:backgroundColor:imagePlacement:leftToRight:size:");
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return [a1 tintColor];
}
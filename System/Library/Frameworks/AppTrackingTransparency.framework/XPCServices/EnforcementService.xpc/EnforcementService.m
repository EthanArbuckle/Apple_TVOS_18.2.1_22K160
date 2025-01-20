void sub_100001A5C(_Unwind_Exception *a1)
{
  void *v1;
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

int main(int argc, const char **argv, const char **envp)
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, v4);
  dispatch_source_set_event_handler(v5, &stru_100004298);
  dispatch_activate(v5);
  v6 = objc_opt_new(&OBJC_CLASS___ServiceDelegate);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v7 setDelegate:v6];
  [v7 resume];

  return 0;
}

void sub_1000020C4(id a1)
{
}

void sub_100002120(id a1)
{
  v1 = (void *)qword_100008DF8;
  qword_100008DF8 = (uint64_t)@"AppTrackingTransparency";
}

void sub_100002178(id a1)
{
  v1 = (void *)qword_100008E08;
  qword_100008E08 = (uint64_t)@"1";
}

void sub_10000229C(id a1)
{
}

id objc_msgSend_valueWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithError:");
}
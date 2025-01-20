void sub_2B14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2D34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2E58(_Unwind_Exception *a1)
{
  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_2F3C(uint64_t a1)
{
  v1 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(*(void *)(a1 + 32)));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_3368;
  block[3] = &unk_4160;
  id v11 = (id)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v2 = qword_88F8;
  id v3 = v11;
  v4 = v3;
  if (v2 == -1)
  {
    id v5 = v3;
  }

  else
  {
    dispatch_once(&qword_88F8, block);
    id v5 = v11;
  }

  id v9 = (id)qword_88F0;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](&OBJC_CLASS___NSData, "dataWithContentsOfURL:", v9));
  uint64_t v7 = objc_claimAutoreleasedReturnValue( +[CIWarpKernel kernelWithString:fromMetalLibraryData:]( &OBJC_CLASS___CIWarpKernel,  "kernelWithString:fromMetalLibraryData:",  @"kernel vec2 CIPT_Warp() { return destCoord(); }",
           v6));
  v8 = (void *)qword_88E8;
  qword_88E8 = v7;
}

void sub_3044( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  _Unwind_Resume(a1);
}

void sub_30E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_3200(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_3330(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_3368(uint64_t a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) URLForResource:@"CIPassThrough.ci" withExtension:@"metallib"]);
  uint64_t v2 = (void *)qword_88F0;
  qword_88F0 = v1;
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}
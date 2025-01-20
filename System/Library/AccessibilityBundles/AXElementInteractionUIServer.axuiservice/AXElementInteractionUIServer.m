}

id sub_191C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

id sub_1998(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(*(void *)(a1 + 32) + 8)];
}

void sub_1DF4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7 = a2;
  v8 = *(void **)(*(void *)(a1 + 32) + 32LL);
  id v13 = v7;
  if (v8)
  {
    [v8 set];
    [v13 fill];
    id v7 = v13;
  }

  double v9 = 2.0;
  if (!*(_BYTE *)(a1 + 56)) {
    double v9 = 0.0;
  }
  [v7 setLineWidth:*(double *)(a1 + 48) + v9];
  [v13 setLineCapStyle:1];
  [v13 setLineJoinStyle:1];
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  [v10 set];

  [v13 stroke];
  v11 = v13;
  if (!*(_BYTE *)(a1 + 56))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectAtIndex:a3 + 1]);
  }

  [v11 setLineWidth:*(double *)(a1 + 48)];
  [v11 setLineCapStyle:1];
  [v11 setLineJoinStyle:1];
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  [v12 set];

  [v11 stroke];
  if (!*(_BYTE *)(a1 + 56)) {
    *a4 = 1;
  }
}

void sub_1FE8(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___AXElementInteractionUIServer);
  v2 = (void *)qword_8C50;
  qword_8C50 = (uint64_t)v1;
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}
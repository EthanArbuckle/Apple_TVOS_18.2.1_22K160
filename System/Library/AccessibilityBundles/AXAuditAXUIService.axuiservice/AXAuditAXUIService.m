void sub_4698( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_46B0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_46C0(uint64_t a1)
{
}

id sub_46C8(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setNeedsDisplay];
}
}

id sub_4904(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

id sub_4980(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  [v1 _cachedAlpha];
  return objc_msgSend(v1, "setAlpha:");
}

void sub_4F80(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v10 = a2;
  [*(id *)(a1 + 32) set];
  [v10 fill];
  double v7 = 2.0;
  if (!*(_BYTE *)(a1 + 72)) {
    double v7 = 0.0;
  }
  [v10 setLineWidth:*(double *)(a1 + 64) + v7];
  [v10 setLineCapStyle:1];
  [v10 setLineJoinStyle:1];
  v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _outlineColor]);
  [v8 set];

  [v10 stroke];
  v9 = v10;
  if (!*(_BYTE *)(a1 + 72))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) objectAtIndex:a3 + 1]);
  }

  [v9 setLineWidth:*(double *)(a1 + 64)];
  [v9 setLineCapStyle:1];
  [v9 setLineJoinStyle:1];
  [*(id *)(a1 + 56) set];
  [v9 stroke];
  if (!*(_BYTE *)(a1 + 72)) {
    *a4 = 1;
  }
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}
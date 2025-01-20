void _call_copy_helpers_excp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  v6 = a1;
  v7 = a3;
  if (a3)
  {
    v5 = 1;
    _call_generic_copy_helper(a1, a2, a3);
  }

  _call_custom_copy_helper(a1, a2);
  v5 = 0;
  _cleanup_generic_captures((uint64_t)&v5);
}

void sub_18027DE6C(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t _call_dispose_helpers_excp(uint64_t a1, uint64_t a2)
{
  int v5 = 4;
  uint64_t v6 = a1;
  uint64_t v7 = a2;
  _call_custom_dispose_helper(a1);
  if (a2)
  {
    int v5 = 3;
    _call_generic_destroy_helper(a1, a2);
  }

  int v5 = 0;
  return _cleanup_generic_captures(&v5);
}

void sub_18027DEE0(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void _Block_use_RR2(const Block_callbacks_RR *callbacks)
{
  release = callbacks->release;
  _Block_retain_object = (uint64_t (*)(const void *))callbacks->retain;
  _Block_release_object = (uint64_t (*)(const void *))release;
  _Block_destructInstance = (uint64_t (*)(const void *))callbacks->destructInstance;
}

uint64_t _call_custom_copy_helper(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(a2 + 8) & 0x2000000) != 0)
  {
    v2 = *(uint64_t (**)(void))(*(void *)(a2 + 24) + 16LL);
    if (v2) {
      return v2();
    }
  }

  return result;
}

uint64_t _call_custom_dispose_helper(uint64_t result)
{
  if ((*(_DWORD *)(result + 8) & 0x2000000) != 0)
  {
    v1 = *(uint64_t (**)(void))(*(void *)(result + 24) + 24LL);
    if (v1) {
      return v1();
    }
  }

  return result;
}

void _call_generic_copy_helper(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    __asm { BR              X12 }
  }

  _call_generic_copy_helper_cold_1();
}

unint64_t HelperBase<ExtendedOutOfLine>::copyBlock(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 16) = a3 + 32;
  while (1)
  {
    unint64_t result = ExtendedOutOfLine::getNextOpcodeAndCount((ExtendedOutOfLine *)a1);
    uint64_t v7 = HIDWORD(result);
    switch((int)result)
    {
      case 0:
        return result;
      case 1:
        uint64_t v8 = *(void *)(a1 + 16) + v7;
        *(void *)(a1 + 8) += v7;
        *(void *)(a1 + 16) = v8;
        break;
      case 2:
        uint64_t v9 = (8 * HIDWORD(result));
        uint64_t v10 = *(void *)(a1 + 8) + v9;
        uint64_t v11 = *(void *)(a1 + 16) + v9;
        *(void *)(a1 + 8) = v10;
        *(void *)(a1 + 16) = v11;
        break;
      case 3:
        HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>((id)a1, v7, v6);
        break;
      case 4:
        HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)4>( (void *)a1,  v7,  v6);
        break;
      case 5:
        HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)5>(a1, v7, v6);
        break;
      case 6:
        HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)6>(a1, v7, v6);
        break;
      default:
        HelperBase<ExtendedOutOfLine>::copyBlock(result, v7, v6);
    }

    ++*(void *)(a1 + 32);
    *(_DWORD *)(a1 + 24) = 0;
  }
}

unint64_t HelperBase<ExtendedInline>::copyBlock(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 16) = a3 + 32;
  while (1)
  {
    unint64_t result = ExtendedInline::getNextOpcodeAndCount((ExtendedInline *)a1);
    uint64_t v7 = HIDWORD(result);
    switch((int)result)
    {
      case 0:
        return result;
      case 1:
        uint64_t v8 = *(void *)(a1 + 16) + v7;
        *(void *)(a1 + 8) += v7;
        *(void *)(a1 + 16) = v8;
        break;
      case 2:
        uint64_t v9 = (8 * HIDWORD(result));
        uint64_t v10 = *(void *)(a1 + 8) + v9;
        uint64_t v11 = *(void *)(a1 + 16) + v9;
        *(void *)(a1 + 8) = v10;
        *(void *)(a1 + 16) = v11;
        break;
      case 3:
        HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>((id)a1, v7, v6);
        break;
      case 4:
        HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)4>( (void *)a1,  v7,  v6);
        break;
      case 5:
        HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)5>(a1, v7, v6);
        break;
      case 6:
        HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)6>(a1, v7, v6);
        break;
      default:
        HelperBase<ExtendedOutOfLine>::copyBlock(result, v7, v6);
    }

    *(_DWORD *)(a1 + 32) -= 4;
    *(_DWORD *)(a1 + 24) = 0;
  }

unint64_t HelperBase<GenericInline>::copyBlock(GenericInline *this, uint64_t a2, uint64_t a3)
{
  *((_DWORD *)this + 7) = *(void *)(*(void *)(a2 + 24) - 8LL);
  *((_DWORD *)this + 8) = 8;
  *((_DWORD *)this + 6) = 0;
  *((void *)this + 1) = a2 + 32;
  *((void *)this + 2) = a3 + 32;
  while (1)
  {
    unint64_t result = GenericInline::getNextOpcodeAndCount(this);
    unint64_t v6 = HIDWORD(result);
    switch((int)result)
    {
      case 0:
        return result;
      case 1:
        unint64_t v7 = *((void *)this + 2) + v6;
        *((void *)this + 1) += v6;
        *((void *)this + 2) = v7;
        break;
      case 2:
        uint64_t v8 = (8 * HIDWORD(result));
        uint64_t v9 = *((void *)this + 1) + v8;
        uint64_t v10 = *((void *)this + 2) + v8;
        *((void *)this + 1) = v9;
        *((void *)this + 2) = v10;
        break;
      case 3:
        HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>(this, v6, v5);
        break;
      case 4:
        HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)4>(this, v6, v5);
        break;
      case 5:
        HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)5>( (uint64_t)this,  v6,  v5);
        break;
      case 6:
        HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)6>( (uint64_t)this,  v6,  v5);
        break;
      default:
        HelperBase<ExtendedOutOfLine>::copyBlock(result, v6, v5);
    }

    *((_DWORD *)this + 8) += 4;
    *((_DWORD *)this + 6) = 0;
  }

uint64_t HelperBase<GenericOutOfLine>::copyBlock(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = result;
  v4 = (unsigned __int8 *)(*(void *)(*(void *)(a2 + 24) - 8LL) + 1LL);
  *(void *)(result + 32) = v4;
  *(_DWORD *)(result + 24) = 0;
  *(void *)(result + 8) = a2 + 32;
  *(void *)(result + 16) = a3 + 32;
  while (1)
  {
    unsigned int v5 = *v4;
    uint64_t v6 = (v5 & 0xF) + 1LL;
    switch(v5 >> 4)
    {
      case 0u:
        return result;
      case 1u:
        uint64_t v7 = *(void *)(v3 + 16) + v6;
        *(void *)(v3 + 8) += v6;
        *(void *)(v3 + 16) = v7;
        break;
      case 2u:
        uint64_t v8 = (8 * v6);
        uint64_t v9 = *(void *)(v3 + 8) + v8;
        uint64_t v10 = *(void *)(v3 + 16) + v8;
        *(void *)(v3 + 8) = v9;
        *(void *)(v3 + 16) = v10;
        break;
      case 3u:
        unint64_t result = (uint64_t)HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>( (id)v3,  v6,  a3);
        break;
      case 4u:
        unint64_t result = (uint64_t)HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)4>( (void *)v3,  v6,  a3);
        break;
      case 5u:
        unint64_t result = HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)5>( v3,  v6,  a3);
        break;
      case 6u:
        unint64_t result = HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)6>( v3,  v6,  a3);
        break;
      default:
        HelperBase<ExtendedOutOfLine>::copyBlock(result, v6, a3);
    }

    v4 = (unsigned __int8 *)(*(void *)(v3 + 32) + 1LL);
    *(void *)(v3 + 32) = v4;
    *(_DWORD *)(v3 + 24) = 0;
  }

void _call_generic_destroy_helper(uint64_t a1, uint64_t a2)
{
  if (a2) {
    __asm { BR              X12 }
  }

  _call_generic_destroy_helper_cold_1();
}

unint64_t HelperBase<ExtendedOutOfLine>::destroyBlock( ExtendedOutOfLine *this, uint64_t a2, int a3, id *a4)
{
  if (a3) {
    HelperBase<ExtendedOutOfLine>::initState((uint64_t)this, a2);
  }
  while (2)
  {
    unint64_t result = ExtendedOutOfLine::getNextOpcodeAndCount(this);
    unint64_t v8 = HIDWORD(result);
    switch((int)result)
    {
      case 0:
        return result;
      case 1:
        unint64_t v9 = *((void *)this + 1) + v8;
        goto LABEL_6;
      case 2:
        unint64_t v9 = *((void *)this + 1) + (8 * HIDWORD(result));
LABEL_6:
        *((void *)this + 1) = v9;
        goto LABEL_14;
      case 3:
        unint64_t result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>( (uint64_t)this,  HIDWORD(result),  a4);
        if ((_DWORD)result) {
          goto LABEL_15;
        }
        goto LABEL_14;
      case 4:
        unint64_t result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)4>( (uint64_t)this,  HIDWORD(result),  (const void **)a4);
        if ((result & 1) != 0) {
          goto LABEL_15;
        }
        goto LABEL_14;
      case 5:
        unint64_t result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)5>( (uint64_t)this,  HIDWORD(result),  (const void **)a4);
        if ((result & 1) != 0) {
          goto LABEL_15;
        }
        goto LABEL_14;
      case 6:
        unint64_t result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)6>( (uint64_t)this,  HIDWORD(result),  a4);
        if ((result & 1) == 0)
        {
LABEL_14:
          ++*((void *)this + 4);
          *((_DWORD *)this + 6) = 0;
          continue;
        }

LABEL_15:
        if (!a4) {
          HelperBase<ExtendedOutOfLine>::destroyBlock(result, v10, v11);
        }
        return result;
      default:
        HelperBase<ExtendedOutOfLine>::destroyBlock(result, v8, v7);
    }
  }

        if (!a4) {
          HelperBase<ExtendedOutOfLine>::destroyBlock(result, v10, v11);
        }
        return result;
      default:
        HelperBase<ExtendedOutOfLine>::destroyBlock(result, v8, v7);
    }
  }

        if (!a4) {
          HelperBase<ExtendedOutOfLine>::destroyBlock(result, v10, v11);
        }
        return result;
      default:
        HelperBase<ExtendedOutOfLine>::destroyBlock(result, v8, v7);
    }
  }

unint64_t HelperBase<ExtendedInline>::destroyBlock(ExtendedInline *this, uint64_t a2, int a3, id *a4)
{
  if (a3) {
    HelperBase<ExtendedInline>::initState((uint64_t)this, a2);
  }
  while (2)
  {
    unint64_t result = ExtendedInline::getNextOpcodeAndCount(this);
    unint64_t v8 = HIDWORD(result);
    switch((int)result)
    {
      case 0:
        return result;
      case 1:
        unint64_t v9 = *((void *)this + 1) + v8;
        goto LABEL_6;
      case 2:
        unint64_t v9 = *((void *)this + 1) + (8 * HIDWORD(result));
LABEL_6:
        *((void *)this + 1) = v9;
        goto LABEL_14;
      case 3:
        unint64_t result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>( (uint64_t)this,  HIDWORD(result),  a4);
        if ((_DWORD)result) {
          goto LABEL_15;
        }
        goto LABEL_14;
      case 4:
        unint64_t result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)4>( (uint64_t)this,  HIDWORD(result),  (const void **)a4);
        if ((result & 1) != 0) {
          goto LABEL_15;
        }
        goto LABEL_14;
      case 5:
        unint64_t result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)5>( this,  v8,  a4);
        if ((result & 1) != 0) {
          goto LABEL_15;
        }
        goto LABEL_14;
      case 6:
        unint64_t result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)6>( (uint64_t)this,  HIDWORD(result),  a4);
        if ((result & 1) == 0)
        {
LABEL_14:
          *((_DWORD *)this + 8) -= 4;
          *((_DWORD *)this + 6) = 0;
          continue;
        }

unint64_t HelperBase<GenericInline>::destroyBlock(GenericInline *this, uint64_t a2, int a3, id *a4)
{
  if (a3)
  {
    *((_DWORD *)this + 7) = *(void *)(*(void *)(a2 + 24) - 8LL);
    *((_DWORD *)this + 8) = 8;
    *((_DWORD *)this + 6) = 0;
    *((void *)this + 1) = a2 + 32;
  }

  while (2)
  {
    unint64_t result = GenericInline::getNextOpcodeAndCount(this);
    unint64_t v8 = HIDWORD(result);
    switch((int)result)
    {
      case 0:
        return result;
      case 1:
        unint64_t v9 = *((void *)this + 1) + v8;
        goto LABEL_6;
      case 2:
        unint64_t v9 = *((void *)this + 1) + (8 * HIDWORD(result));
LABEL_6:
        *((void *)this + 1) = v9;
        goto LABEL_14;
      case 3:
        unint64_t result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>( (uint64_t)this,  HIDWORD(result),  a4);
        if ((_DWORD)result) {
          goto LABEL_15;
        }
        goto LABEL_14;
      case 4:
        unint64_t result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)4>( (uint64_t)this,  HIDWORD(result),  (const void **)a4);
        if ((result & 1) != 0) {
          goto LABEL_15;
        }
        goto LABEL_14;
      case 5:
        unint64_t result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)5>( this,  v8,  a4);
        if ((result & 1) != 0) {
          goto LABEL_15;
        }
        goto LABEL_14;
      case 6:
        unint64_t result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)6>( (uint64_t)this,  HIDWORD(result),  a4);
        if ((result & 1) == 0)
        {
LABEL_14:
          *((_DWORD *)this + 8) += 4;
          *((_DWORD *)this + 6) = 0;
          continue;
        }

uint64_t HelperBase<GenericOutOfLine>::destroyBlock(uint64_t result, uint64_t a2, uint64_t a3, id *a4)
{
  uint64_t v5 = result;
  if ((a3 & 1) != 0)
  {
    uint64_t v6 = (unsigned __int8 *)(*(void *)(*(void *)(a2 + 24) - 8LL) + 1LL);
    *(void *)(result + 32) = v6;
    *(_DWORD *)(result + 24) = 0;
    *(void *)(result + 8) = a2 + 32;
  }

  else
  {
    uint64_t v6 = *(unsigned __int8 **)(result + 32);
  }

  while (2)
  {
    unsigned int v7 = *v6;
    uint64_t v8 = (v7 & 0xF) + 1LL;
    switch(v7 >> 4)
    {
      case 0u:
        return result;
      case 1u:
        uint64_t v9 = *(void *)(v5 + 8) + v8;
        goto LABEL_7;
      case 2u:
        uint64_t v9 = *(void *)(v5 + 8) + (8 * v8);
LABEL_7:
        *(void *)(v5 + 8) = v9;
        goto LABEL_15;
      case 3u:
        unint64_t result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>( v5,  v8,  a4);
        if ((_DWORD)result) {
          goto LABEL_16;
        }
        goto LABEL_15;
      case 4u:
        unint64_t result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)4>( v5,  v8,  (const void **)a4);
        if ((result & 1) != 0) {
          goto LABEL_16;
        }
        goto LABEL_15;
      case 5u:
        unint64_t result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)5>( v5,  v8,  a4);
        if ((result & 1) != 0) {
          goto LABEL_16;
        }
        goto LABEL_15;
      case 6u:
        unint64_t result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)6>( v5,  v8,  a4);
        if ((result & 1) == 0)
        {
LABEL_15:
          uint64_t v6 = (unsigned __int8 *)(*(void *)(v5 + 32) + 1LL);
          *(void *)(v5 + 32) = v6;
          *(_DWORD *)(v5 + 24) = 0;
          continue;
        }

LABEL_16:
        if (!a4) {
          HelperBase<ExtendedOutOfLine>::destroyBlock(result, v10, a3);
        }
        return result;
      default:
        HelperBase<ExtendedOutOfLine>::destroyBlock(result, v8, a3);
    }
  }

void _cleanup_generic_captures(uint64_t a1)
{
  if (*(_DWORD *)a1)
  {
    if (*(void *)(a1 + 16)) {
      __asm { BR              X11 }
    }

    free(*(void **)(a1 + 8));
  }

unint64_t HelperBase<ExtendedOutOfLine>::cleanup_captures(uint64_t a1, uint64_t a2, uint64_t a3)
{
  switch(*(_DWORD *)a2)
  {
    case 1:
      uint64_t v3 = *(void *)(a2 + 8);
      uint64_t v5 = *(id **)(a1 + 8);
      int v4 = 1;
      return HelperBase<ExtendedOutOfLine>::destroyBlock((ExtendedOutOfLine *)a1, v3, v4, v5);
    case 2:
    case 4:
      uint64_t v3 = *(void *)(a2 + 8);
      int v4 = 1;
      goto LABEL_5;
    case 3:
      *(void *)(a1 + 8) += 8LL;
      ++*(_DWORD *)(a1 + 24);
      uint64_t v3 = *(void *)(a2 + 8);
      int v4 = 0;
LABEL_5:
      uint64_t v5 = 0LL;
      return HelperBase<ExtendedOutOfLine>::destroyBlock((ExtendedOutOfLine *)a1, v3, v4, v5);
    default:
      HelperBase<ExtendedOutOfLine>::cleanup_captures(a1, a2, a3);
  }

unint64_t HelperBase<ExtendedInline>::cleanup_captures(uint64_t a1, uint64_t a2, uint64_t a3)
{
  switch(*(_DWORD *)a2)
  {
    case 1:
      uint64_t v3 = *(void *)(a2 + 8);
      uint64_t v5 = *(id **)(a1 + 8);
      int v4 = 1;
      return HelperBase<ExtendedInline>::destroyBlock((ExtendedInline *)a1, v3, v4, v5);
    case 2:
    case 4:
      uint64_t v3 = *(void *)(a2 + 8);
      int v4 = 1;
      goto LABEL_5;
    case 3:
      *(void *)(a1 + 8) += 8LL;
      ++*(_DWORD *)(a1 + 24);
      uint64_t v3 = *(void *)(a2 + 8);
      int v4 = 0;
LABEL_5:
      uint64_t v5 = 0LL;
      return HelperBase<ExtendedInline>::destroyBlock((ExtendedInline *)a1, v3, v4, v5);
    default:
      HelperBase<ExtendedOutOfLine>::cleanup_captures(a1, a2, a3);
  }

unint64_t HelperBase<GenericInline>::cleanup_captures(uint64_t a1, uint64_t a2, uint64_t a3)
{
  switch(*(_DWORD *)a2)
  {
    case 1:
      uint64_t v3 = *(void *)(a2 + 8);
      uint64_t v5 = *(id **)(a1 + 8);
      int v4 = 1;
      return HelperBase<GenericInline>::destroyBlock((GenericInline *)a1, v3, v4, v5);
    case 2:
    case 4:
      uint64_t v3 = *(void *)(a2 + 8);
      int v4 = 1;
      goto LABEL_5;
    case 3:
      *(void *)(a1 + 8) += 8LL;
      ++*(_DWORD *)(a1 + 24);
      uint64_t v3 = *(void *)(a2 + 8);
      int v4 = 0;
LABEL_5:
      uint64_t v5 = 0LL;
      return HelperBase<GenericInline>::destroyBlock((GenericInline *)a1, v3, v4, v5);
    default:
      HelperBase<ExtendedOutOfLine>::cleanup_captures(a1, a2, a3);
  }

uint64_t HelperBase<GenericOutOfLine>::cleanup_captures(uint64_t a1, uint64_t a2, uint64_t a3)
{
  switch(*(_DWORD *)a2)
  {
    case 1:
      uint64_t v3 = *(void *)(a2 + 8);
      uint64_t v5 = *(id **)(a1 + 8);
      uint64_t v4 = 1LL;
      return HelperBase<GenericOutOfLine>::destroyBlock(a1, v3, v4, v5);
    case 2:
    case 4:
      uint64_t v3 = *(void *)(a2 + 8);
      uint64_t v4 = 1LL;
      goto LABEL_5;
    case 3:
      *(void *)(a1 + 8) += 8LL;
      ++*(_DWORD *)(a1 + 24);
      uint64_t v3 = *(void *)(a2 + 8);
      uint64_t v4 = 0LL;
LABEL_5:
      uint64_t v5 = 0LL;
      return HelperBase<GenericOutOfLine>::destroyBlock(a1, v3, v4, v5);
    default:
      HelperBase<ExtendedOutOfLine>::cleanup_captures(a1, a2, a3);
  }

void *__cdecl _Block_copy(const void *aBlock)
{
  if (!aBlock) {
    return 0LL;
  }
  v2 = (unsigned int *)((char *)aBlock + 8);
  if ((*((_DWORD *)aBlock + 2) & 0x1000000) != 0)
  {
    while (1)
    {
      unsigned int v5 = *v2;
      if ((~*v2 & 0xFFFE) == 0) {
        break;
      }
      while (1)
      {
        unsigned int v6 = __ldaxr(v2);
        if (v6 != v5) {
          break;
        }
        if (!__stlxr(v5 + 2, v2)) {
          return (void *)aBlock;
        }
      }

      __clrex();
    }

    return (void *)aBlock;
  }

  if ((*v2 & 0x10000000) != 0) {
    return (void *)aBlock;
  }
  uint64_t v3 = malloc(*(void *)(*((void *)aBlock + 3) + 8LL));
  if (v3)
  {
    if (!*((void *)aBlock + 2)) {
      _Block_copy_cold_1();
    }
    _platform_memmove();
    v3[2] &= 0xFFFF0000;
    v3[2] |= 0x1000002u;
    if (**((void **)aBlock + 3)) {
      __asm { BR              X11 }
    }

    _call_copy_helpers_excp((uint64_t)v3, (uint64_t)aBlock, 0LL);
    *(void *)uint64_t v3 = OBJC_CLASS_____NSMallocBlock__;
  }

  return v3;
}

size_t Block_size(void *aBlock)
{
  return *(void *)(*((void *)aBlock + 3) + 8LL);
}

void _Block_release(const void *aBlock)
{
  if (aBlock)
  {
    v2 = (unsigned int *)((char *)aBlock + 8);
    if ((*((_DWORD *)aBlock + 2) & 0x10000000) == 0 && (*v2 & 0x1000000) != 0)
    {
LABEL_4:
      unsigned int v3 = *v2;
      int v4 = *v2 & 0xFFFE;
      if (v4) {
        BOOL v5 = v4 == 65534;
      }
      else {
        BOOL v5 = 1;
      }
      if (!v5)
      {
        else {
          int v6 = -2;
        }
        unsigned int v7 = v6 + v3;
        do
        {
          unsigned int v8 = __ldaxr(v2);
          if (v8 != v3)
          {
            __clrex();
            goto LABEL_4;
          }
        }

        while (__stlxr(v7, v2));
        if ((unsigned __int16)v3 == 2)
        {
          if (**((void **)aBlock + 3)) {
            __asm { BR              X12 }
          }

          _call_dispose_helpers_excp((uint64_t)aBlock, 0LL);
          _Block_destructInstance(aBlock);
          free((void *)aBlock);
        }
      }
    }
  }

BOOL _Block_tryRetain(const void *aBlock)
{
  v1 = (unsigned int *)((char *)aBlock + 8);
  while (1)
  {
    unsigned int v2 = *v1;
    BOOL result = (*v1 & 1) == 0;
    if ((~*v1 & 0xFFFE) == 0 || (*v1 & 1) != 0) {
      break;
    }
    while (1)
    {
      unsigned int v5 = __ldaxr(v1);
      if (v5 != v2) {
        break;
      }
      if (!__stlxr(v2 + 2, v1)) {
        return 1;
      }
    }

    __clrex();
  }

  return result;
}

BOOL _Block_isDeallocating(const void *aBlock)
{
  return *((_DWORD *)aBlock + 2) & 1;
}

BOOL _Block_use_stret(void *aBlock)
{
  return (~*((_DWORD *)aBlock + 2) & 0x60000000) == 0;
}

BOOL _Block_has_signature(void *aBlock)
{
  if ((*((_DWORD *)aBlock + 2) & 0x40000000) == 0) {
    return 0;
  }
  uint64_t v2 = 32LL;
  if ((*((_DWORD *)aBlock + 2) & 0x2000000) == 0) {
    uint64_t v2 = 16LL;
  }
  return *(void *)(*((void *)aBlock + 3) + v2) != 0LL;
}

const char *__cdecl _Block_signature(void *aBlock)
{
  if ((*((_DWORD *)aBlock + 2) & 0x40000000) == 0) {
    return 0LL;
  }
  uint64_t v2 = 32LL;
  if ((*((_DWORD *)aBlock + 2) & 0x2000000) == 0) {
    uint64_t v2 = 16LL;
  }
  return *(const char **)(*((void *)aBlock + 3) + v2);
}

const char *__cdecl _Block_layout(void *aBlock)
{
  if ((*((_DWORD *)aBlock + 2) & 0x80000000) != 0 || (*((_DWORD *)aBlock + 2) & 0x40000000) == 0) {
    return 0LL;
  }
  uint64_t v2 = 32LL;
  if ((*((_DWORD *)aBlock + 2) & 0x2000000) == 0) {
    uint64_t v2 = 16LL;
  }
  return *(const char **)(*((void *)aBlock + 3) + v2 + 8);
}

const char *__cdecl _Block_extended_layout(void *aBlock)
{
  if ((*((_DWORD *)aBlock + 2) & 0x80000000) == 0 || (*((_DWORD *)aBlock + 2) & 0x40000000) == 0) {
    return 0LL;
  }
  uint64_t v2 = 32LL;
  if ((*((_DWORD *)aBlock + 2) & 0x2000000) == 0) {
    uint64_t v2 = 16LL;
  }
  if (*(void *)(*((void *)aBlock + 3) + v2 + 8)) {
    return *(const char **)(*((void *)aBlock + 3) + v2 + 8);
  }
  else {
    return (const char *)&unk_18027FC23;
  }
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  unsigned int v3 = (char *)a2;
  unsigned int v5 = a3 & 0x9F;
  if (v5 > 0x17)
  {
    if (v5 - 131 > 0x14 || ((1 << (v5 + 125)) & 0x110011) == 0)
    {
      if (v5 != 24) {
        return;
      }
      goto LABEL_12;
    }

LABEL_27:
    *(void *)a1 = v3;
    return;
  }

  switch(v5)
  {
    case 3u:
      _Block_retain_object(a2);
      goto LABEL_27;
    case 7u:
      unsigned int v3 = (char *)_Block_copy(a2);
      goto LABEL_27;
    case 8u:
LABEL_12:
      uint64_t v7 = *((void *)a2 + 1);
      int v9 = *(_DWORD *)(v7 + 16);
      unsigned int v8 = (unsigned int *)(v7 + 16);
      if ((v9 & 0xFFFE) != 0)
      {
        if ((*v8 & 0x1000000) != 0)
        {
          while (1)
          {
            unsigned int v10 = *v8;
            if ((~*v8 & 0xFFFE) == 0) {
              break;
            }
            while (1)
            {
              unsigned int v11 = __ldaxr(v8);
              if (v11 != v10) {
                break;
              }
              if (!__stlxr(v10 + 2, v8)) {
                goto LABEL_26;
              }
            }

            __clrex();
          }
        }
      }

      else
      {
        unsigned int v12 = *((_DWORD *)a2 + 5);
        v13 = (char *)malloc(v12);
        *(void *)v13 = 0LL;
        *((void *)v13 + 1) = v13;
        *((_DWORD *)v13 + 4) = *((_DWORD *)v3 + 4) | 0x1000004;
        *((void *)v3 + 1) = v13;
        *((_DWORD *)v13 + 5) = v12;
        if ((*((_DWORD *)v3 + 4) & 0x2000000) != 0)
        {
          __int128 v14 = *(_OWORD *)(v3 + 24);
          *(_OWORD *)(v13 + 24) = v14;
          if (*((_DWORD *)v3 + 4) >> 28 == 1) {
            *((void *)v13 + 5) = *((void *)v3 + 5);
          }
          ((void (*)(void))v14)();
        }

        else
        {
          _platform_memmove();
        }
      }

LABEL_26:
      unsigned int v3 = (char *)*((void *)v3 + 1);
      goto LABEL_27;
  }

void _Block_object_dispose(const void *a1, const int a2)
{
  unsigned int v2 = a2 & 0x9F;
  if (v2 > 7)
  {
    if (v2 == 24 || v2 == 8)
    {
      uint64_t v4 = *((void *)a1 + 1);
      unsigned int v5 = (unsigned int *)(v4 + 16);
      if ((*(_DWORD *)(v4 + 16) & 0x1000000) != 0)
      {
        if ((*v5 & 0xFFFE) == 0) {
          _Block_object_dispose_cold_1();
        }
LABEL_12:
        unsigned int v6 = *v5;
        int v7 = *v5 & 0xFFFE;
        if (v7 && v7 != 65534)
        {
          else {
            int v9 = -2;
          }
          unsigned int v10 = v9 + v6;
          do
          {
            unsigned int v11 = __ldaxr(v5);
            if (v11 != v6)
            {
              __clrex();
              goto LABEL_12;
            }
          }

          while (__stlxr(v10, v5));
          if ((unsigned __int16)v6 == 2)
          {
            if ((*v5 & 0x2000000) != 0) {
              (*(void (**)(uint64_t))(v4 + 32))(v4);
            }
            free((void *)v4);
          }
        }
      }
    }
  }

  else if (v2 == 3)
  {
    _Block_release_object(a1);
  }

  else if (v2 == 7)
  {
    _Block_release(a1);
  }

unint64_t ExtendedOutOfLine::getNextOpcodeAndCount(ExtendedOutOfLine *this)
{
  unint64_t v1 = **((unsigned __int8 **)this + 4);
  if (v1 >= 0x70) {
    ExtendedOutOfLine::getNextOpcodeAndCount();
  }
  return *(void *)((char *)&unk_18027FAD8 + ((v1 >> 1) & 0x78)) | ((unint64_t)((v1 & 0xF) + 1) << 32);
}

id HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>( id result, uint64_t a2, uint64_t a3)
{
  if (*((_DWORD *)result + 6)) {
    HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>( (uint64_t)result,  a2,  a3);
  }
  unsigned int v3 = a2;
  if ((_DWORD)a2)
  {
    uint64_t v4 = result;
    unsigned int v5 = (id *)*((void *)result + 2);
    do
    {
      BOOL result = *v5;
      unsigned int v5 = (id *)(v4[2] + 8LL);
      v4[1] += 8LL;
      v4[2] = v5;
      unsigned int v6 = *((_DWORD *)v4 + 6) + 1;
      *((_DWORD *)v4 + 6) = v6;
    }

    while (v6 < v3);
  }

  return result;
}

uint64_t HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)5>( uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(result + 24)) {
    HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>(result, a2, a3);
  }
  unsigned int v3 = a2;
  if ((_DWORD)a2)
  {
    uint64_t v4 = result;
    BOOL result = *(void *)(result + 8);
    unsigned int v5 = *(const void ***)(v4 + 16);
    do
    {
      _Block_object_assign((void *)result, *v5, 8);
      BOOL result = *(void *)(v4 + 8) + 8LL;
      unsigned int v5 = (const void **)(*(void *)(v4 + 16) + 8LL);
      *(void *)(v4 + 8) = result;
      *(void *)(v4 + 16) = v5;
      unsigned int v6 = *(_DWORD *)(v4 + 24) + 1;
      *(_DWORD *)(v4 + 24) = v6;
    }

    while (v6 < v3);
  }

  return result;
}

void *HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)4>( void *result, uint64_t a2, uint64_t a3)
{
  if (*((_DWORD *)result + 6)) {
    HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>( (uint64_t)result,  a2,  a3);
  }
  unsigned int v3 = a2;
  if ((_DWORD)a2)
  {
    uint64_t v4 = result;
    unsigned int v6 = (void *)*((void *)result + 1);
    unsigned int v5 = (const void **)*((void *)result + 2);
    do
    {
      BOOL result = _Block_copy(*v5);
      *unsigned int v6 = result;
      unsigned int v6 = (void *)(v4[1] + 8LL);
      unsigned int v5 = (const void **)(v4[2] + 8LL);
      v4[1] = v6;
      v4[2] = v5;
      unsigned int v7 = *((_DWORD *)v4 + 6) + 1;
      *((_DWORD *)v4 + 6) = v7;
    }

    while (v7 < v3);
  }

  return result;
}

uint64_t HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)6>( uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(result + 24)) {
    HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>(result, a2, a3);
  }
  unsigned int v3 = a2;
  if ((_DWORD)a2)
  {
    uint64_t v4 = result;
    BOOL result = *(void *)(result + 8);
    unsigned int v5 = *(id **)(v4 + 16);
    do
    {
      objc_copyWeak((id *)result, v5);
      BOOL result = *(void *)(v4 + 8) + 8LL;
      unsigned int v5 = (id *)(*(void *)(v4 + 16) + 8LL);
      *(void *)(v4 + 8) = result;
      *(void *)(v4 + 16) = v5;
      unsigned int v6 = *(_DWORD *)(v4 + 24) + 1;
      *(_DWORD *)(v4 + 24) = v6;
    }

    while (v6 < v3);
  }

  return result;
}

uint64_t HelperBase<ExtendedOutOfLine>::initState(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)(a2 + 8) & 0x80000000) != 0 && (*(_DWORD *)(a2 + 8) & 0x40000000) != 0)
  {
    uint64_t v3 = 32LL;
    if ((*(_DWORD *)(a2 + 8) & 0x2000000) == 0) {
      uint64_t v3 = 16LL;
    }
    unsigned int v2 = *(void **)(*(void *)(a2 + 24) + v3 + 8);
    if (!v2) {
      unsigned int v2 = &unk_18027FC23;
    }
  }

  else
  {
    unsigned int v2 = 0LL;
  }

  *(void *)(result + 32) = v2;
  *(_DWORD *)(result + 24) = 0;
  *(void *)(result + 8) = a2 + 32;
  return result;
}

uint64_t ExtendedInline::getNextOpcodeAndCount(ExtendedInline *this)
{
  int v2 = *((_DWORD *)this + 8);
  HIDWORD(v4) = v2;
  LODWORD(v4) = v2 + 4;
  uint64_t result = (v4 >> 2);
  switch((int)result)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = 6LL;
      return result | ((unint64_t)((*((unsigned __int16 *)this + 14) >> v2) & 0xF) << 32);
    case 2:
      uint64_t result = 5LL;
      return result | ((unint64_t)((*((unsigned __int16 *)this + 14) >> v2) & 0xF) << 32);
    case 3:
      return result | ((unint64_t)((*((unsigned __int16 *)this + 14) >> v2) & 0xF) << 32);
    default:
      ExtendedInline::getNextOpcodeAndCount();
  }

uint64_t HelperBase<ExtendedInline>::initState(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)(a2 + 8) & 0x80000000) != 0 && (*(_DWORD *)(a2 + 8) & 0x40000000) != 0)
  {
    uint64_t v3 = 32LL;
    if ((*(_DWORD *)(a2 + 8) & 0x2000000) == 0) {
      uint64_t v3 = 16LL;
    }
    uint64_t v2 = *(void *)(*(void *)(a2 + 24) + v3 + 8);
    if (!v2) {
      LOWORD(v2) = (unsigned __int16)&unk_18027FC23;
    }
  }

  else
  {
    LOWORD(v2) = 0;
  }

  *(_WORD *)(result + 28) = v2;
  *(_DWORD *)(result + 32) = 8;
  *(_DWORD *)(result + 24) = 0;
  *(void *)(result + 8) = a2 + 32;
  return result;
}

unint64_t GenericInline::getNextOpcodeAndCount(GenericInline *this)
{
  int v1 = *((_DWORD *)this + 8);
  HIDWORD(v2) = v1;
  LODWORD(v2) = v1 - 8;
  unint64_t v3 = 0LL;
  uint64_t v4 = 3LL;
  switch((v2 >> 2))
  {
    case 0u:
      goto LABEL_5;
    case 1u:
      uint64_t v4 = 4LL;
      goto LABEL_5;
    case 2u:
      uint64_t v4 = 5LL;
      goto LABEL_5;
    case 3u:
      uint64_t v4 = 6LL;
LABEL_5:
      unint64_t v3 = v4 | ((unint64_t)((*((_DWORD *)this + 7) >> v1) & 0xF) << 32);
      break;
    case 4u:
      return v3;
    default:
      GenericInline::getNextOpcodeAndCount();
  }

  return v3;
}

BOOL HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>( uint64_t a1, unsigned int a2, id *a3)
{
  if (*(_DWORD *)(a1 + 24) >= a2) {
    return 0LL;
  }
  unsigned int v6 = *(id **)(a1 + 8);
  do
  {
    BOOL v7 = v6 == a3;
    if (v6 == a3) {
      break;
    }

    unsigned int v6 = (id *)(*(void *)(a1 + 8) + 8LL);
    *(void *)(a1 + 8) = v6;
    unsigned int v8 = *(_DWORD *)(a1 + 24) + 1;
    *(_DWORD *)(a1 + 24) = v8;
  }

  while (v8 < a2);
  return v7;
}

BOOL HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)5>( uint64_t a1, unsigned int a2, const void **a3)
{
  if (*(_DWORD *)(a1 + 24) >= a2) {
    return 0LL;
  }
  unsigned int v6 = *(const void ***)(a1 + 8);
  do
  {
    BOOL v7 = v6 == a3;
    if (v6 == a3) {
      break;
    }
    _Block_object_dispose(*v6, 8);
    unsigned int v6 = (const void **)(*(void *)(a1 + 8) + 8LL);
    *(void *)(a1 + 8) = v6;
    unsigned int v8 = *(_DWORD *)(a1 + 24) + 1;
    *(_DWORD *)(a1 + 24) = v8;
  }

  while (v8 < a2);
  return v7;
}

BOOL HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)4>( uint64_t a1, unsigned int a2, const void **a3)
{
  if (*(_DWORD *)(a1 + 24) >= a2) {
    return 0LL;
  }
  unsigned int v6 = *(const void ***)(a1 + 8);
  do
  {
    BOOL v7 = v6 == a3;
    if (v6 == a3) {
      break;
    }
    _Block_release(*v6);
    unsigned int v6 = (const void **)(*(void *)(a1 + 8) + 8LL);
    *(void *)(a1 + 8) = v6;
    unsigned int v8 = *(_DWORD *)(a1 + 24) + 1;
    *(_DWORD *)(a1 + 24) = v8;
  }

  while (v8 < a2);
  return v7;
}

BOOL HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)6>( uint64_t a1, unsigned int a2, id *a3)
{
  if (*(_DWORD *)(a1 + 24) >= a2) {
    return 0LL;
  }
  unsigned int v6 = *(id **)(a1 + 8);
  do
  {
    BOOL v7 = v6 == a3;
    if (v6 == a3) {
      break;
    }
    objc_destroyWeak(v6);
    unsigned int v6 = (id *)(*(void *)(a1 + 8) + 8LL);
    *(void *)(a1 + 8) = v6;
    unsigned int v8 = *(_DWORD *)(a1 + 24) + 1;
    *(_DWORD *)(a1 + 24) = v8;
  }

  while (v8 < a2);
  return v7;
}

void OUTLINED_FUNCTION_0(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
}

void OUTLINED_FUNCTION_1(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
}

void OUTLINED_FUNCTION_2(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
}

void OUTLINED_FUNCTION_3(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
}

void OUTLINED_FUNCTION_4(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
}

void _call_generic_copy_helper_cold_1()
{
}

void _call_generic_copy_helper_cold_2()
{
}

void HelperBase<ExtendedOutOfLine>::copyBlock(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void _call_generic_destroy_helper_cold_1()
{
}

void _call_generic_destroy_helper_cold_2()
{
}

void HelperBase<ExtendedOutOfLine>::destroyBlock(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

{
  OUTLINED_FUNCTION_2("destroyBlock", "runtime.cpp", a3, "endptr && endptr isn't expected to be null");
}

void _cleanup_generic_captures_cold_1()
{
}

void HelperBase<ExtendedOutOfLine>::cleanup_captures(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_1("cleanup_captures", "runtime.cpp", a3, "info->state == EXCP_DESTROY_GENERIC");
}

void _Block_object_dispose_cold_1()
{
}

void ExtendedOutOfLine::getNextOpcodeAndCount()
{
}

void HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>( uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0("copyCapture", "runtime.cpp", a3, "capcounter == 0 && capcounter expected to be zero");
}

void ExtendedInline::getNextOpcodeAndCount()
{
}

void GenericInline::getNextOpcodeAndCount()
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1895FEE58]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1895FEE78]();
}

uint64_t _platform_memmove()
{
  return MEMORY[0x189600460]();
}

void abort(void)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x189600268](__size);
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}
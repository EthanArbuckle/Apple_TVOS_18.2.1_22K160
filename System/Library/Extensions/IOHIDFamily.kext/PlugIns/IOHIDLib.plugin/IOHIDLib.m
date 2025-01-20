uint64_t sub_1890899B8(void ***a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_queryInterface_outInterface_(**a1, a2, (uint64_t)a2, a3, a4);
}

uint64_t sub_1890899D0(id **a1)
{
  id v1 = **a1;
  int v2 = CFGetRetainCount(v1);
  CFRetain(v1);

  return (v2 + 1);
}

uint64_t sub_189089A10(id **a1)
{
  id v1 = **a1;
  int v2 = CFGetRetainCount(v1);
  CFRelease(v1);

  return (v2 - 1);
}

uint64_t sub_189089BA4(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x189616718](**a1, sel_probe_service_outScore_, a2, a3, a4);
}

uint64_t sub_189089BBC(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x189616718](**a1, sel_start_service_, a2, a3, a5);
}

uint64_t sub_189089BD0(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_stop(**a1, a2, a3, a4, a5);
}

LABEL_53:
  Value_value_timeout_callback_context_options = 0;
  v31 = v151;
LABEL_54:

  free(v97);
  v26 = v169;
LABEL_55:
  v118 = v54;
LABEL_56:
  free(v118);
LABEL_57:
  if (v26 && Value_value_timeout_callback_context_options)
  {
    v160 = (void *)v26[4];
    v26[4] = 0LL;

    free(v26);
  }

LABEL_60:
  return Value_value_timeout_callback_context_options;
}

void sub_18908A98C(void *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    v5 = *(void (**)(void, uint64_t, void))a1;
    if (*(void *)a1)
    {
      id v8 = 0LL;
      if (a3)
      {
        if (a4)
        {
          v9 = (void *)*((void *)a1 + 4);
          if (v9)
          {
            __int128 v51 = 0u;
            __int128 v52 = 0u;
            __int128 v49 = 0u;
            __int128 v50 = 0u;
            id obj = v9;
            uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v49, (uint64_t)v53, 16);
            if (v11)
            {
              uint64_t v12 = v11;
              id v8 = 0LL;
              unint64_t v13 = 0LL;
              uint64_t v14 = *(void *)v50;
              while (2)
              {
                uint64_t v15 = 0LL;
                v16 = v8;
                do
                {
                  if (*(void *)v50 != v14) {
                    objc_enumerationMutation(obj);
                  }
                  id v8 = *(id *)(*((void *)&v49 + 1) + 8 * v15);

                  v21 = (int *)(a4 + v13);
                  unint64_t v22 = *(unsigned int *)(a4 + v13 + 4);
                  v13 += v22 >> 8;
                  if (v22 >> 10 < 5 || v13 > a3)
                  {
                    _IOHIDLogCategory();
                    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
                      sub_1890961E4((uint64_t)(v21 + 1), v34, v35, v36, v37, v38, v39, v40);
                    }
                    goto LABEL_26;
                  }

                  int v24 = *v21;
                  if (v24 != objc_msgSend_elementCookie(v8, v17, v18, v19, v20))
                  {
                    _IOHIDLogCategory();
                    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
                      sub_189096254((uint64_t)v21, v8, v34, v41, v42);
                    }
                    goto LABEL_26;
                  }

                  objc_msgSend_elementRef(v8, v25, v26, v27, v28);
                  v29 = (const void *)_IOHIDValueCreateWithElementValuePtr();
                  objc_msgSend_setValueRef_(v8, v30, (uint64_t)v29, v31, v32);
                  if (v29) {
                    CFRelease(v29);
                  }
                  ++v15;
                  v16 = v8;
                }

                while (v12 != v15);
                uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_( obj,  v33,  (uint64_t)&v49,  (uint64_t)v53,  16);
                if (v12) {
                  continue;
                }
                break;
              }

              v34 = (os_log_s *)v8;
              id v8 = 0LL;
LABEL_26:
              a2 = a2;
            }

            else
            {
              id v8 = 0LL;
            }

            objc_msgSend_releaseReport_(*((void **)a1 + 2), v43, a4, v44, v45);
            v5 = *(void (**)(void, uint64_t, void))a1;
          }
        }
      }

      v5(*((void *)a1 + 1), a2, *((void *)a1 + 3));
      v46 = (void *)*((void *)a1 + 4);
      *((void *)a1 + 4) = 0LL;

      free(a1);
    }
  }
}

uint64_t sub_18908AD50(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x189616718](**a1, sel_getAsyncEventSource_, a2, a4, a5);
}

uint64_t sub_18908AD60(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x189616718](**a1, sel_setDirection_, a2, a4, a5);
}

uint64_t sub_18908AD70(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x189616718](**a1, sel_getDirection_, a2, a4, a5);
}

uint64_t sub_18908AD80(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_addElement_(**a1, a2, (uint64_t)a2, a4, a5);
}

uint64_t sub_18908AD90(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_removeElement_(**a1, a2, (uint64_t)a2, a4, a5);
}

uint64_t sub_18908ADA0(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_containsElement_value_(**a1, a2, (uint64_t)a2, a3, a5);
}

uint64_t sub_18908ADB4(void ***a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_setValue_value_options_(**a1, a2, (uint64_t)a2, a3, a4);
}

uint64_t sub_18908ADCC(void ***a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_getValue_value_options_(**a1, a2, (uint64_t)a2, a3, a4);
}

uint64_t sub_18908ADE4(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x189616718](**a1, sel_commit_timeout_callback_options_, a4, a2, a3);
}

uint64_t sub_18908AE00(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x189616718](**a1, sel_clear, a3, a4, a5);
}

uint64_t sub_18908B2D8(void ***a1, CFTypeRef *a2)
{
  if (!a2) {
    return 3758097090LL;
  }
  v3 = (id *)**a1;
  v4 = v3 + 5;
  v5 = v3;
  id WeakRetained = objc_loadWeakRetained(v4);
  *a2 = (CFTypeRef)objc_msgSend_runLoopSource(WeakRetained, v7, v8, v9, v10);

  CFRetain(*a2);
  return 0LL;
}

uint64_t sub_18908B350(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(**(void **)a1 + 40LL));
  uint64_t v6 = objc_msgSend_runLoopSource(WeakRetained, v2, v3, v4, v5);

  return v6;
}

uint64_t sub_18908B394(uint64_t a1, _DWORD *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(**(void **)a1 + 40LL));
  *a2 = objc_msgSend_port(WeakRetained, v4, v5, v6, v7);

  return 0LL;
}

uint64_t sub_18908B3DC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(**(void **)a1 + 40LL));
  uint64_t v6 = objc_msgSend_port(WeakRetained, v2, v3, v4, v5);

  return v6;
}

uint64_t sub_18908B420()
{
  return 0LL;
}

uint64_t sub_18908B428()
{
  return 0LL;
}

uint64_t sub_18908B430(void ***a1, uint64_t a2)
{
  uint64_t v3 = (id *)**a1;
  uint64_t v4 = v3 + 5;
  uint64_t v5 = v3;
  id WeakRetained = objc_loadWeakRetained(v4);
  uint64_t Element = objc_msgSend_getElement_(WeakRetained, v7, a2, v8, v9);
  uint64_t v14 = objc_msgSend_addElement_(v5, v11, Element, v12, v13);

  return v14;
}

uint64_t sub_18908B4A0(void ***a1, uint64_t a2)
{
  uint64_t v3 = (id *)**a1;
  uint64_t v4 = v3 + 5;
  uint64_t v5 = v3;
  id WeakRetained = objc_loadWeakRetained(v4);
  uint64_t Element = objc_msgSend_getElement_(WeakRetained, v7, a2, v8, v9);
  uint64_t v14 = objc_msgSend_removeElement_(v5, v11, Element, v12, v13);

  return v14;
}

uint64_t sub_18908B510(void ***a1, uint64_t a2)
{
  uint64_t v3 = (id *)**a1;
  unsigned __int8 v14 = 0;
  uint64_t v4 = v3 + 5;
  uint64_t v5 = v3;
  id WeakRetained = objc_loadWeakRetained(v4);
  uint64_t Element = objc_msgSend_getElement_(WeakRetained, v7, a2, v8, v9);
  objc_msgSend_containsElement_value_(v5, v11, Element, (uint64_t)&v14, v12);

  return v14;
}

uint64_t sub_18908B58C(void **a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x189616718](**a1, sel_setElementValue_value_options_, a2, a3, 1LL);
}

uint64_t sub_18908B5A4(void **a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x189616718](**a1, sel_getElementValue_value_options_, a2, a3, 1LL);
}

uint64_t sub_18908B5BC(void **a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x189616718](**a1, sel_setElementValue_value_options_, a2, a3, 0LL);
}

uint64_t sub_18908B5D4(void **a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x189616718](**a1, sel_getElementValue_value_options_, a2, a3, 0LL);
}

uint64_t sub_18908B5EC(void **a1)
{
  return MEMORY[0x189616718](**a1, sel_commit_timeout_callback_options_, 0LL, 0LL, 0LL);
}

uint64_t sub_18908B608(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x189616718](**a1, sel_clear, a3, a4, a5);
}

void sub_18908B664(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

void sub_18908B690(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void sub_18908B6A4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_18908B6B4(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t sub_18908B6C0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_elementCookie(a2, (const char *)a2, a3, a4, a5);
}

  ;
}

  ;
}

void IOHIDIUnknown::factoryAddRef(IOHIDIUnknown *this)
{
  uint64_t v1 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x13u,  0xAAu,  0x9Cu,  0x44u,  0x6Fu,  0x1Bu,  0x11u,  0xD4u,  0x90u,  0x7Cu,  0,  5u,  2u,  0x8Fu,  0x18u,  0xD5u);
  CFPlugInAddInstanceForFactory(v1);
}

void IOHIDIUnknown::factoryRelease(IOHIDIUnknown *this)
{
  uint64_t v1 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x13u,  0xAAu,  0x9Cu,  0x44u,  0x6Fu,  0x1Bu,  0x11u,  0xD4u,  0x90u,  0x7Cu,  0,  5u,  2u,  0x8Fu,  0x18u,  0xD5u);
  CFPlugInRemoveInstanceForFactory(v1);
}

void IOHIDIUnknown::IOHIDIUnknown(IOHIDIUnknown *this, void *a2)
{
  *(void *)this = off_18A33F068;
  *((_DWORD *)this + 2) = 1;
  *((void *)this + 2) = a2;
  *((void *)this + 3) = this;
  IOHIDIUnknown::factoryAddRef(this);
}

void IOHIDIUnknown::~IOHIDIUnknown(IOHIDIUnknown *this)
{
  *(void *)this = off_18A33F068;
  IOHIDIUnknown::factoryRelease(this);
}

uint64_t IOHIDIUnknown::addRef(IOHIDIUnknown *this)
{
  uint64_t v1 = (unsigned int *)((char *)this + 8);
  do
  {
    unsigned int v2 = __ldaxr(v1);
    uint64_t result = v2 + 1;
  }

  while (__stlxr(result, v1));
  return result;
}

uint64_t IOHIDIUnknown::release(IOHIDIUnknown *this)
{
  uint64_t v1 = (unsigned int *)((char *)this + 8);
  do
  {
    unsigned int v2 = __ldaxr(v1);
    uint64_t v3 = v2 - 1;
  }

  while (__stlxr(v3, v1));
  if (v2)
  {
    if (this && v2 == 1) {
      (*(void (**)(IOHIDIUnknown *))(*(void *)this + 8LL))(this);
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT))
  {
    sub_189096384();
  }

  return v3;
}

uint64_t IOHIDIUnknown::genericQueryInterface(IOHIDIUnknown *this, void *a2, CFUUIDBytes a3, void **a4)
{
  return (*(uint64_t (**)(void, void *, void, void))(**((void **)this + 1) + 16LL))( *((void *)this + 1),  a2,  *(void *)&a3.byte0,  *(void *)&a3.byte8);
}

uint64_t IOHIDIUnknown::genericAddRef(IOHIDIUnknown *this, void *a2)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 24LL))(*((void *)this + 1));
}

uint64_t IOHIDIUnknown::genericRelease(IOHIDIUnknown *this, void *a2)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 32LL))(*((void *)this + 1));
}

void sub_18908C268(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18908C370(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18908C464(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18908C530(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18908C5A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18908C74C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18908C8AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18908C968(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_11:
    _IOHIDLogCategory();
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      uint64_t v40 = v22;
      _os_log_impl( &dword_189088000,  v32,  OS_LOG_TYPE_INFO,  "Failed to create IOHIDQueue plugin result: 0x%x\n",  buf,  8u);
    }
  }

  v33 = 0LL;
LABEL_16:

  return v33;
}

void sub_18908CCE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_18908CD20(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x189616718](**a1, sel_getAsyncEventSource_, a2, a4, a5);
}

uint64_t sub_18908CD30(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x189616718](**a1, sel_setDepth_, a2, a4, a5);
}

uint64_t sub_18908CD40(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x189616718](**a1, sel_getDepth_, a2, a4, a5);
}

uint64_t sub_18908CD50(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_addElement_(**a1, a2, (uint64_t)a2, a4, a5);
}

uint64_t sub_18908CD60(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_removeElement_(**a1, a2, (uint64_t)a2, a4, a5);
}

uint64_t sub_18908CD70(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_containsElement_pValue_(**a1, a2, (uint64_t)a2, a3, a5);
}

uint64_t sub_18908CD84(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_start(**a1, a2, a3, a4, a5);
}

uint64_t sub_18908CD90(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_stop(**a1, a2, a3, a4, a5);
}

uint64_t sub_18908CD9C(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_setValueAvailableCallback_context_(**a1, a2, (uint64_t)a2, a3, a5);
}

uint64_t sub_18908CDB0(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_copyNextValue_(**a1, a2, (uint64_t)a2, a4, a5);
}

uint64_t sub_18908CDC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x189616718](a4, sel_queueCallback_msg_size_info_, a1, a2, a3);
}

void sub_18908CED0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  a9.super_class = (Class)&OBJC_CLASS___IOHIDQueueClass;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18908CF08(void *a1)
{
}

void sub_18908D11C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18908D314(_Unwind_Exception *exception_object)
{
}

void sub_18908D534(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18908D578(void *a1, uint64_t a2)
{
  uint64_t v4 = a1;
  uint64_t v3 = (void (*)(void, uint64_t, void, void *))v4[17];
  if (v3) {
    v3(v4[18], a2, v4[19], v4 + 16);
  }
}

void sub_18908D5E8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_18908D724(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_18908D734(id **a1, void *a2)
{
  id v3 = **a1;
  uint64_t v4 = v3;
  if (a2)
  {
    CFRetain(*((CFTypeRef *)v3 + 6));
    uint64_t v5 = 0LL;
    *a2 = v4[6];
  }

  else
  {
    uint64_t v5 = 3758097090LL;
  }

  return v5;
}

void sub_18908D7A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_18908D7B0(uint64_t a1)
{
  return *(void *)(**(void **)a1 + 48LL);
}

uint64_t sub_18908D7C8(uint64_t a1, _DWORD *a2)
{
  *a2 = *(_DWORD *)(**(void **)a1 + 36LL);
  return 0LL;
}

uint64_t sub_18908D7E8(uint64_t a1)
{
  return *(unsigned int *)(**(void **)a1 + 36LL);
}

uint64_t sub_18908D800()
{
  return 0LL;
}

uint64_t sub_18908D808()
{
  return 0LL;
}

uint64_t sub_18908D810(id **a1, uint64_t a2)
{
  id v3 = (id *)**a1;
  id WeakRetained = objc_loadWeakRetained(v3 + 3);
  uint64_t Element = objc_msgSend_getElement_(WeakRetained, v5, a2, v6, v7);
  uint64_t v12 = objc_msgSend_addElement_(v3, v9, Element, v10, v11);

  return v12;
}

void sub_18908D87C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_18908D890(id **a1, uint64_t a2)
{
  id v3 = (id *)**a1;
  id WeakRetained = objc_loadWeakRetained(v3 + 3);
  uint64_t Element = objc_msgSend_getElement_(WeakRetained, v5, a2, v6, v7);
  uint64_t v12 = objc_msgSend_removeElement_(v3, v9, Element, v10, v11);

  return v12;
}

void sub_18908D8FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_18908D910(id **a1, uint64_t a2)
{
  id v3 = (id *)**a1;
  unsigned __int8 v13 = 0;
  id WeakRetained = objc_loadWeakRetained(v3 + 3);
  uint64_t Element = objc_msgSend_getElement_(WeakRetained, v5, a2, v6, v7);
  objc_msgSend_containsElement_pValue_(v3, v9, Element, (uint64_t)&v13, v10);

  uint64_t v11 = v13;
  return v11;
}

void sub_18908D98C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_18908D9A0(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_start(**a1, a2, a3, a4, a5);
}

uint64_t sub_18908D9AC(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_stop(**a1, a2, a3, a4, a5);
}

uint64_t sub_18908D9B8(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x189616718](**a1, sel_getNextEvent_, a2, a4, a5);
}

uint64_t sub_18908D9C8(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x189616718](**a1, sel_setEventCallout_callbackTarget_callbackRefcon_, a2, a3, a4);
}

uint64_t sub_18908D9E0()
{
  return 3758097095LL;
}

uint64_t IOHIDEventServiceFastPathClass::_probe( IOHIDEventServiceFastPathClass *this, void *a2, io_object_t object, unsigned int a4, int *a5)
{
  uint64_t v5 = 3758097090LL;
  if (object)
  {
    if (IOObjectConformsTo(object, "IOHIDEventService")) {
      return 0LL;
    }
    else {
      return 3758097090LL;
    }
  }

  return v5;
}

uint64_t IOHIDEventServiceFastPathClass::_start( IOHIDEventServiceFastPathClass **this, const __CFDictionary *a2, const __CFDictionary *a3)
{
  return IOHIDEventServiceFastPathClass::start(this[1], a2, (io_object_t)a3);
}

uint64_t IOHIDEventServiceFastPathClass::_stop(IOHIDEventServiceFastPathClass *this, void *a2)
{
  return 1LL;
}

uint64_t IOHIDEventServiceFastPathClass::_open( IOHIDEventServiceFastPathClass **this, void *a2, const void *a3, const __CFDictionary *a4)
{
  return IOHIDEventServiceFastPathClass::open(this[1], a2, a3);
}

void IOHIDEventServiceFastPathClass::_close(IOHIDEventServiceFastPathClass **this, void *a2)
{
}

CFTypeRef IOHIDEventServiceFastPathClass::_copyProperty( IOHIDEventServiceFastPathClass *this, const __CFString *a2, const __CFString *a3)
{
  return IORegistryEntryCreateCFProperty( *(_DWORD *)(*((void *)this + 1) + 56LL),  a2,  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
}

BOOL IOHIDEventServiceFastPathClass::_setProperty( IOHIDEventServiceFastPathClass **this, const __CFString *a2, const __CFString *a3, const void *a4)
{
  return IOHIDEventServiceFastPathClass::setProperty(this[1], a2, a3);
}

uint64_t IOHIDEventServiceFastPathClass::_copyEvent(uint64_t a1, const void *a2, unsigned int a3, uint64_t *a4)
{
  return IOHIDEventServiceFastPathClass::copyEvent(*(void *)(a1 + 8), a2, a3, a4);
}

void IOHIDEventServiceFastPathClass::IOHIDEventServiceFastPathClass(IOHIDEventServiceFastPathClass *this)
{
  *(void *)uint64_t v1 = off_18A33F0B0;
  *(void *)(v1 + 32) = 0LL;
  *(void *)(v1 + 40) = v1;
  *(void *)(v1 + 48) = 0LL;
  *(_DWORD *)(v1 + 56) = 0;
  *(void *)(v1 + 64) = 0LL;
  *(void *)(v1 + 72) = 0LL;
}

{
  uint64_t v1;
  IOHIDIUnknown::IOHIDIUnknown(this, &IOHIDEventServiceFastPathClass::sIOCFPlugInInterfaceV1);
  *(void *)uint64_t v1 = off_18A33F0B0;
  *(void *)(v1 + 32) = 0LL;
  *(void *)(v1 + 40) = v1;
  *(void *)(v1 + 48) = 0LL;
  *(_DWORD *)(v1 + 56) = 0;
  *(void *)(v1 + 64) = 0LL;
  *(void *)(v1 + 72) = 0LL;
}

void IOHIDEventServiceFastPathClass::~IOHIDEventServiceFastPathClass(IOHIDEventServiceFastPathClass *this)
{
  *(void *)this = off_18A33F0B0;
  unsigned int v2 = (void *)((char *)this + 64);
  if (*((void *)this + 8))
  {
    MEMORY[0x1895DDD80](*((unsigned int *)this + 13), 0LL, *MEMORY[0x1895FBBE0], *((void *)this + 9));
    *unsigned int v2 = 0LL;
    v2[1] = 0LL;
  }

  io_object_t v3 = *((_DWORD *)this + 12);
  if (v3)
  {
    IOObjectRelease(v3);
    *((_DWORD *)this + 12) = 0;
  }

  io_object_t v4 = *((_DWORD *)this + 14);
  if (v4)
  {
    IOObjectRelease(v4);
    *((_DWORD *)this + 14) = 0;
  }

  io_connect_t v5 = *((_DWORD *)this + 13);
  if (v5)
  {
    IOServiceClose(v5);
    *((_DWORD *)this + 13) = 0;
  }

  IOHIDIUnknown::~IOHIDIUnknown(this);
}

{
  IOHIDEventServiceFastPathClass::~IOHIDEventServiceFastPathClass(this);
  operator delete(this);
}

void sub_18908DBC0(_Unwind_Exception *a1)
{
}

void sub_18908DC04(_Unwind_Exception *a1)
{
}

uint64_t IOHIDEventServiceFastPathClass::probe( IOHIDEventServiceFastPathClass *this, const __CFDictionary *a2, io_object_t object, int *a4)
{
  uint64_t v4 = 3758097090LL;
  if (object)
  {
    if (IOObjectConformsTo(object, "IOHIDEventService")) {
      return 0LL;
    }
    else {
      return 3758097090LL;
    }
  }

  return v4;
}

uint64_t IOHIDEventServiceFastPathClass::start( IOHIDEventServiceFastPathClass *this, const __CFDictionary *a2, io_object_t object)
{
  uint64_t v5 = IOObjectRetain(object);
  if ((_DWORD)v5)
  {
    uint64_t v7 = v5;
    uint64_t v10 = (os_log_s *)_IOHIDLogCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1890964C8();
    }
  }

  else
  {
    *((_DWORD *)this + 12) = object;
    if (IOServiceOpen(object, *MEMORY[0x1895FBBE0], 2u, (io_connect_t *)this + 13))
    {
      uint64_t v6 = (os_log_s *)_IOHIDLogCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_189096468();
      }
    }

    uint64_t v7 = MEMORY[0x1895DDD5C](*((unsigned int *)this + 13), (char *)this + 56);
    if ((_DWORD)v7)
    {
      uint64_t v8 = (os_log_s *)_IOHIDLogCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_189096408();
      }
    }
  }

  return v7;
}

uint64_t IOHIDEventServiceFastPathClass::stop(IOHIDEventServiceFastPathClass *this)
{
  return 1LL;
}

uint64_t IOHIDEventServiceFastPathClass::open( IOHIDEventServiceFastPathClass *this, unsigned int a2, CFTypeRef object)
{
  kern_return_t v9;
  os_log_s *v10;
  BOOL v11;
  uint64_t result;
  CFNumberRef CFProperty;
  CFNumberRef v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  os_log_s *v18;
  uint64_t v19;
  uint64_t v20;
  int valuePtr;
  uint64_t input;
  uint64_t v5 = IOCFSerialize(object, 1uLL);
  if (v5)
  {
    uint64_t v6 = v5;
    BytePtr = CFDataGetBytePtr(v5);
    CFIndex Length = CFDataGetLength(v6);
    input = a2;
    uint64_t v9 = IOConnectCallMethod(*((_DWORD *)this + 13), 0, &input, 1u, BytePtr, Length, 0LL, 0LL, 0LL, 0LL);
    CFRelease(v6);
    if (v9)
    {
LABEL_3:
      uint64_t v10 = (os_log_s *)_IOHIDLogCategory();
      uint64_t v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
      uint64_t result = 0LL;
      if (!v11) {
        return result;
      }
      sub_1890965B0();
      return 0LL;
    }
  }

  else
  {
    input = a2;
    if (IOConnectCallMethod(*((_DWORD *)this + 13), 0, &input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL)) {
      goto LABEL_3;
    }
  }

  valuePtr = 0;
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty( *((_DWORD *)this + 14),  @"QueueSize",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  if (CFProperty)
  {
    unsigned __int8 v14 = CFProperty;
    CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v14);
    if (valuePtr)
    {
      uint64_t v19 = 0LL;
      uint64_t v20 = 0LL;
      uint64_t v15 = MEMORY[0x1895DDD68](*((unsigned int *)this + 13), 0LL, *MEMORY[0x1895FBBE0], &v20, &v19, 1LL);
      v16 = v19;
      v17 = v20;
      *((void *)this + 8) = v20;
      *((void *)this + 9) = v16;
      if (v15 || !v17 || !v16)
      {
        uint64_t v18 = (os_log_s *)_IOHIDLogCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_189096528(&valuePtr, v15, v18);
        }
        return 0LL;
      }
    }
  }

  return 1LL;
}

void IOHIDEventServiceFastPathClass::close(IOHIDEventServiceFastPathClass *this, unsigned int a2)
{
  uint64_t input = a2;
  if (IOConnectCallScalarMethod(*((_DWORD *)this + 13), 1u, &input, 1u, 0LL, 0LL))
  {
    unsigned int v2 = (os_log_s *)_IOHIDLogCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_189096610();
    }
  }

CFTypeRef IOHIDEventServiceFastPathClass::copyProperty( IOHIDEventServiceFastPathClass *this, const __CFString *a2)
{
  return IORegistryEntryCreateCFProperty(*((_DWORD *)this + 14), a2, (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
}

BOOL IOHIDEventServiceFastPathClass::setProperty( IOHIDEventServiceFastPathClass *this, const __CFString *a2, const void *a3)
{
  kern_return_t v3;
  os_log_s *v4;
  io_object_t v3 = IOConnectSetCFProperty(*((_DWORD *)this + 13), a2, a3);
  if (v3)
  {
    uint64_t v4 = (os_log_s *)_IOHIDLogCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_189096670();
    }
  }

  return v3 == 0;
}

uint64_t IOHIDEventServiceFastPathClass::copyEvent(uint64_t a1, CFTypeRef cf, unsigned int a3, uint64_t *a4)
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  uint64_t input = a3;
  uint64_t v35 = 0LL;
  if (cf)
  {
    CFTypeID v7 = CFGetTypeID(cf);
    if (v7 == CFDataGetTypeID())
    {
      uint64_t v8 = (const __CFData *)CFRetain(cf);
      uint64_t v35 = 1LL;
      if (v8)
      {
LABEL_4:
        BytePtr = CFDataGetBytePtr(v8);
        CFIndex Length = CFDataGetLength(v8);
        goto LABEL_8;
      }
    }

    else
    {
      uint64_t v8 = IOCFSerialize(cf, 1uLL);
      if (v8) {
        goto LABEL_4;
      }
    }

    BytePtr = 0LL;
    CFIndex Length = 0LL;
  }

  else
  {
    BytePtr = 0LL;
    CFIndex Length = 0LL;
    uint64_t v8 = 0LL;
  }

LABEL_8:
  uint64_t v11 = *(_DWORD **)(a1 + 64);
  if (v11)
  {
    if (a4)
    {
      *uint64_t v11 = 0;
      uint64_t v12 = IOConnectCallMethod(*(_DWORD *)(a1 + 52), 2u, &input, 2u, BytePtr, Length, 0LL, 0LL, 0LL, 0LL);
      if ((_DWORD)v12)
      {
        uint64_t v13 = v12;
        unsigned __int8 v14 = (os_log_s *)_IOHIDLogCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_189096730((uint64_t)cf, v13, v14);
        }
      }

      else
      {
        uint64_t v31 = *(_DWORD **)(a1 + 64);
        if (*v31)
        {
          uint64_t v32 = MEMORY[0x1895DDE58](*MEMORY[0x189604DB0], v31 + 1);
          *a4 = v32;
        }

        else
        {
          uint64_t v32 = *a4;
        }

        if (v32) {
          uint64_t v13 = 0LL;
        }
        else {
          uint64_t v13 = 3758097084LL;
        }
      }
    }

    else
    {
      v23 = (os_log_s *)_IOHIDLogCategory();
      uint64_t v13 = 3758097090LL;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_189096700(v23, v24, v25, v26, v27, v28, v29, v30);
      }
    }
  }

  else
  {
    uint64_t v13 = 3758097084LL;
    uint64_t v15 = (os_log_s *)_IOHIDLogCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1890966D0(v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }

  if (v8) {
    CFRelease(v8);
  }
  return v13;
}

uint64_t IOHIDEventServiceFastPathClass::alloc(IOHIDEventServiceFastPathClass *this)
{
  uint64_t v1 = (IOHIDIUnknown *)operator new(0x50uLL);
  IOHIDIUnknown::IOHIDIUnknown(v1, &IOHIDEventServiceFastPathClass::sIOCFPlugInInterfaceV1);
  *(void *)uint64_t v1 = off_18A33F0B0;
  *((void *)v1 + 4) = 0LL;
  *((void *)v1 + 5) = v1;
  *((void *)v1 + 6) = 0LL;
  *((_DWORD *)v1 + 14) = 0;
  uint64_t result = (uint64_t)v1 + 16;
  *((void *)v1 + 8) = 0LL;
  *((void *)v1 + 9) = 0LL;
  return result;
}

void sub_18908E23C(_Unwind_Exception *a1)
{
}

uint64_t IOHIDEventServiceFastPathClass::queryInterface( IOHIDEventServiceFastPathClass *this, CFUUIDBytes a2, void **a3)
{
  CFUUIDRef v5 = CFUUIDCreateFromUUIDBytes(0LL, a2);
  uint64_t v6 = (const __CFAllocator *)*MEMORY[0x189604DD0];
  CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes( (CFAllocatorRef)*MEMORY[0x189604DD0],  0,  0,  0,  0,  0,  0,  0,  0,  0xC0u,  0,  0,  0,  0,  0,  0,  0x46u);
  if (CFEqual(v5, v7)
    || (CFUUIDRef v8 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xC2u,  0x44u,  0xE8u,  0x58u,  0x10u,  0x9Cu,  0x11u,  0xD4u,  0x91u,  0xD4u,  0,  0x50u,  0xE4u,  0xC6u,  0x42u,  0x6Fu),  CFEqual(v5, v8)))
  {
    uint64_t v9 = *(void *)this;
    *a3 = (char *)this + 16;
    (*(void (**)(IOHIDEventServiceFastPathClass *))(v9 + 24))(this);
  }

  else
  {
    CFUUIDRef v12 = CFUUIDGetConstantUUIDWithBytes( v6,  0x27u,  0xBAu,  0xAEu,  0x90u,  0x2Fu,  0xE5u,  0x40u,  0x2Au,  0xBFu,  0x7Fu,  0x4Eu,  0xFAu,  0x27u,  0x7Du,  0x37u,  8u);
    if (CFEqual(v5, v12))
    {
      *((void *)this + 4) = &IOHIDEventServiceFastPathClass::sIOHIDServiceFastPathInterface;
      *((void *)this + 5) = this;
      *a3 = (char *)this + 32;
      (*(void (**)(IOHIDEventServiceFastPathClass *))(*(void *)this + 24LL))(this);
    }

    else
    {
      *a3 = 0LL;
    }
  }

  if (*a3) {
    uint64_t v10 = 0LL;
  }
  else {
    uint64_t v10 = 2147483652LL;
  }
  CFRelease(v5);
  return v10;
}

  ;
}

  ;
}

void sub_18908E3F4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

uint64_t IOHIDAnalyticsGetConsoleModeStatus(void *a1)
{
  id v1 = a1;
  if (qword_18C767868 != -1) {
    dispatch_once(&qword_18C767868, &unk_18A33F138);
  }
  uint64_t v2 = 3758097084LL;
  if (qword_18C767860)
  {
    Class v3 = NSClassFromString(@"GPProcessMonitor");
    if (v3)
    {
      Class v4 = v3;
      SEL Uid = sel_getUid("monitorForCurrentProcess");
      uint64_t v9 = objc_msgSend_performSelector_(v4, v6, (uint64_t)Uid, v7, v8);
      if (v9)
      {
        uint64_t v10 = (void *)v9;
        v15[0] = MEMORY[0x1895F87A8];
        v15[1] = 3221225472LL;
        v15[2] = sub_18908E500;
        v15[3] = &unk_18A33F0F8;
        id v16 = v1;
        objc_msgSend_setUpdateHandler_(v10, v11, (uint64_t)v15, v12, v13);

        uint64_t v2 = 0LL;
      }
    }
  }

  return v2;
}

uint64_t sub_18908E500(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  SEL Uid = sel_getUid("isIdentifiedGame");
  objc_msgSend_performSelector_(v4, v6, (uint64_t)Uid, v7, v8);

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void *sub_18908E55C()
{
  uint64_t result = dlopen("/System/Library/PrivateFrameworks/GamePolicy.framework/GamePolicy", 1);
  qword_18C767860 = (uint64_t)result;
  return result;
}

LABEL_114:
        objc_msgSend_psKey(v15, v32, v33, v34, v35, v135);
        uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v44)
        {
          v65 = 0LL;
          goto LABEL_138;
        }

        v137 = v26;
        v48 = v21;
        p_elements = &self->_elements;
        objc_msgSend_addObjectsFromArray_(v16, v45, (uint64_t)self->_elements.input, v46, v47);
        objc_msgSend_addObjectsFromArray_(v16, v50, (uint64_t)self->_elements.output, v51, v52);
        objc_msgSend_addObjectsFromArray_(v16, v53, (uint64_t)self->_elements.feature, v54, v55);
        objc_msgSend_psKey(v15, v56, v57, v58, v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = self;
        v140 = v16;
        v64 = (void *)objc_msgSend_copyElements_psKey_(self, v62, (uint64_t)v16, (uint64_t)v60, v63);

        v145 = 0u;
        v146 = 0u;
        v143 = 0u;
        v144 = 0u;
        v65 = v64;
        v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v66, (uint64_t)&v143, (uint64_t)v153, 16);
        if (v67)
        {
          v72 = v67;
          v73 = *(void *)v144;
          do
          {
            for (j = 0LL; j != v72; ++j)
            {
              if (*(void *)v144 != v73) {
                objc_enumerationMutation(v65);
              }
              v75 = *(void **)(*((void *)&v143 + 1) + 8 * j);
              v76 = objc_msgSend_usagePage(v75, v68, v69, v70, v71);
              if (v76 == objc_msgSend_usagePage(v15, v77, v78, v79, v80))
              {
                v81 = objc_msgSend_usage(v75, v68, v69, v70, v71);
                if (v81 == objc_msgSend_usage(v15, v82, v83, v84, v85))
                {
                  objc_msgSend_type(v75, v68, v69, v70, v71);
                  objc_msgSend_type(v15, v86, v87, v88, v89);
                }
              }
            }

            v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v68, (uint64_t)&v143, (uint64_t)v153, 16);
          }

          while (v72);
        }

        self = v61;
        capabilities = v61->_capabilities;
        objc_msgSend_psKey(v15, v91, v92, v93, v94);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(capabilities, v96, (uint64_t)v95, v97, v98);

        if (v48 <= 4)
        {
          objc_msgSend_addObject_(p_elements->input, v99, (uint64_t)v15, v100, v101);
LABEL_130:
          id v16 = v140;
          i = v141;
          goto LABEL_138;
        }

        if (v137 == 129)
        {
          objc_msgSend_addObject_(p_elements->output, v99, (uint64_t)v15, v100, v101);
          goto LABEL_130;
        }

        objc_msgSend_addObject_(p_elements->feature, v99, (uint64_t)v15, v100, v101);
        _IOHIDLogCategory();
        v102 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
        {
          v107 = objc_msgSend_usagePage(v15, v103, v104, v105, v106);
          v112 = objc_msgSend_usage(v15, v108, v109, v110, v111);
          *(_DWORD *)buf = v135;
          *(_DWORD *)v152 = v107;
          *(_WORD *)&v152[4] = 1024;
          *(_DWORD *)&v152[6] = v112;
          _os_log_impl( &dword_189088000,  v102,  OS_LOG_TYPE_DEFAULT,  "Feature element (UP : %x, U : %x) added for polling",  buf,  0xEu);
        }

        i = v141;
        if (!v61->_timer)
        {
          _IOHIDLogCategory();
          v113 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( &dword_189088000,  v113,  OS_LOG_TYPE_DEFAULT,  "Create time for polling feature reports",  buf,  2u);
          }

          v114 = objc_alloc(MEMORY[0x189604028]);
          objc_msgSend_date(MEMORY[0x189603F50], v115, v116, v117, v118);
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          v142[0] = MEMORY[0x1895F87A8];
          v142[1] = 3221225472LL;
          v142[2] = sub_18908F558;
          v142[3] = &unk_18A33F160;
          v142[4] = v61;
          v121 = objc_msgSend_initWithFireDate_interval_repeats_block_( v114,  v120,  (uint64_t)v119,  1,  (uint64_t)v142,  5.0);
          timer = v61->_timer;
          v61->_timer = (NSTimer *)v121;
        }

        id v16 = v140;
LABEL_138:
      }

      v139 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v123, (uint64_t)&v147, (uint64_t)v154, 16);
    }

    while (v139);
  }

  objc_msgSend_addObjectsFromArray_(self->_commandElements, v5, (uint64_t)self->_elements.output, v6, v7);
  objc_msgSend_addObjectsFromArray_(self->_commandElements, v124, (uint64_t)self->_elements.feature, v125, v126);
  objc_msgSend_addObjectsFromArray_(self->_eventElements, v127, (uint64_t)self->_elements.input, v128, v129);
  objc_msgSend_addObjectsFromArray_(self->_eventElements, v130, (uint64_t)self->_elements.feature, v131, v132);
  _IOHIDLogCategory();
  v133 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
  {
    v134 = self->_capabilities;
    *(_DWORD *)buf = 138412290;
    *(void *)v152 = v134;
    _os_log_impl(&dword_189088000, v133, OS_LOG_TYPE_DEFAULT, "capabilities: %@", buf, 0xCu);
  }
}

void sub_18908F558(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 112LL);
  uint64_t v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v30, (uint64_t)v34, 16);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v31;
    while (2)
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v31 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(id *)(*((void *)&v30 + 1) + 8 * v7);
        if ((objc_msgSend_isConstant(v8, v9, v10, v11, v12, (void)v30) & 1) == 0)
        {

LABEL_12:
          if (objc_msgSend_pollEventUpdate(*(void **)(a1 + 32), v25, v26, v27, v28))
          {
            uint64_t v29 = *(void *)(a1 + 32);
            if (*(void *)(v29 + 136))
            {
              sub_18908F71C(*(void **)(v29 + 80), @"timer dispatchEvent");
              (*(void (**)(void, void, void, uint64_t, void))(*(void *)(a1 + 32) + 136LL))( *(void *)(*(void *)(a1 + 32) + 144LL),  0LL,  *(void *)(*(void *)(a1 + 32) + 152LL),  *(void *)(a1 + 32) + 24LL,  *(void *)(*(void *)(a1 + 32) + 80LL));
            }
          }

          return;
        }

        int isUpdated = objc_msgSend_isUpdated(v8, v13, v14, v15, v16);

        if (!isUpdated) {
          goto LABEL_12;
        }
        ++v7;
      }

      while (v5 != v7);
      uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v18, (uint64_t)&v30, (uint64_t)v34, 16);
      if (v5) {
        continue;
      }
      break;
    }
  }

  objc_msgSend_invalidate(*(void **)(*(void *)(a1 + 32) + 160), v19, v20, v21, v22);
  uint64_t v23 = *(void *)(a1 + 32);
  uint64_t v24 = *(void **)(v23 + 160);
  *(void *)(v23 + 160) = 0LL;
}

void sub_18908F71C(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = a1;
  objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)@"Debug Information", v6, v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = (void *)objc_msgSend_mutableCopy(v4, v9, v10, v11, v12);

  objc_msgSend_removeObjectForKey_(v13, v14, (uint64_t)@"Debug Information", v15, v16);
  _IOHIDLogCategory();
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412546;
    id v20 = v3;
    __int16 v21 = 2112;
    uint64_t v22 = v13;
    _os_log_impl(&dword_189088000, v17, OS_LOG_TYPE_DEFAULT, "%@: %@", (uint8_t *)&v19, 0x16u);
  }

  if (v8)
  {
    _IOHIDLogCategory();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_1890967B4((uint64_t)v3, (uint64_t)v8, v18);
    }
  }
}

LABEL_42:
            uint64_t v37 = (1000 * v37);
            v137 = v52 + -7.0;
LABEL_46:
            v138 = __exp10(v137) * (double)(int)v37;
          }

          else
          {
            if (v58 != 54)
            {
              if (v58 != 65)
              {
                if (v58 == 98)
                {
                  v60 = objc_msgSend_integerValue(v12, v54, v59, v56, v57);
                  v61 = &unk_18A341A78;
                  if (v60) {
                    v61 = &unk_18A341A60;
                  }
                  v62 = v61;
                  goto LABEL_59;
                }

LABEL_57:
                objc_msgSend_numberWithInt_(MEMORY[0x189607968], v54, v37, v56, v57);
LABEL_58:
                v62 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
LABEL_59:
                v136 = v62;
LABEL_60:
                v148 = objc_msgSend_isEqual_(v136, v54, (uint64_t)v27, v56, v57);
                if (objc_msgSend_timestamp(v12, v149, v150, v151, v152) && (v148 & 1) == 0) {
                  objc_msgSend_setObject_forKeyedSubscript_( self->_upsUpdatedEvent,  v153,  (uint64_t)v136,  (uint64_t)v32,  v154);
                }
                v256 |= v148 ^ 1;

                goto LABEL_64;
              }

LABEL_44:
              uint64_t v37 = (1000 * v37);
              v137 = v52;
              goto LABEL_46;
            }

            v138 = (double)(int)(__exp10(v52) * (double)(int)v37) + -273.15;
          }

LABEL_56:
          uint64_t v37 = (int)v138;
          goto LABEL_57;
        }

        v121 = objc_msgSend_usage(v12, v54, v55, v56, v57);
        if ((v121 - 16) >= 0x1E)
        {
          if (v121 <= 4095)
          {
            switch(v121)
            {
              case 1:
              case 2:
LABEL_54:
                v138 = (double)(int)v37 / 3.6;
                break;
              case 3:
              case 12:
                goto LABEL_44;
              case 5:
                objc_msgSend_dataValue(v12, v54, v59, v56, v57);
                v136 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
                goto LABEL_35;
              case 6:
              case 11:
              case 13:
              case 14:
                goto LABEL_42;
              case 7:
                uint64_t v37 = (1000 * v37);
                objc_msgSend_numberWithInt_(MEMORY[0x189607968], v216, v37, v217, v218);
                v193 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setObject_forKeyedSubscript_( self->_debugInformation,  v219,  (uint64_t)v193,  (uint64_t)@"Battery Case Average Charging Current",  v220);
                goto LABEL_94;
              default:
                goto LABEL_57;
            }

            goto LABEL_56;
          }

          switch(v121)
          {
            case 4096:
              v221 = (void *)MEMORY[0x189607968];
              v222 = objc_msgSend_integerValue(v12, v54, v59, v56, v57);
              objc_msgSend_numberWithInteger_(v221, v223, v222, v224, v225);
              v193 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_( self->_debugInformation,  v226,  (uint64_t)v193,  (uint64_t)@"PowerStatus",  v227);
              break;
            case 4097:
              v228 = (void *)MEMORY[0x189607968];
              v229 = objc_msgSend_integerValue(v12, v54, v59, v56, v57);
              objc_msgSend_numberWithInteger_(v228, v230, v229, v231, v232);
              v193 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_( self->_debugInformation,  v233,  (uint64_t)v193,  (uint64_t)@"ChargingStatus",  v234);
              break;
            case 4098:
              v188 = (void *)MEMORY[0x189607968];
              v189 = objc_msgSend_integerValue(v12, v54, v59, v56, v57);
              objc_msgSend_numberWithInteger_(v188, v190, v189, v191, v192);
              v193 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_( self->_debugInformation,  v194,  (uint64_t)v193,  (uint64_t)@"InductiveStatus",  v195);
              break;
            default:
              goto LABEL_57;
          }

LABEL_94:
          v136 = self->_debugInformation;
        }

        else
        {
          v122 = (void *)MEMORY[0x189607968];
          v123 = objc_msgSend_integerValue(v12, v54, v59, v56, v57);
          objc_msgSend_numberWithInteger_(v122, v124, v123, v125, v126);
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          debugInformation = self->_debugInformation;
          objc_msgSend_psKey(v12, v129, v130, v131, v132);
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(debugInformation, v134, (uint64_t)v127, (uint64_t)v133, v135);

          v136 = self->_debugInformation;
        }

        __int128 v32 = @"Debug Information";
LABEL_35:
        if (!v136) {
          goto LABEL_57;
        }
        goto LABEL_60;
      }

      _IOHIDLogCategory();
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEFAULT))
      {
        v67 = objc_msgSend_usagePage(v12, v63, v64, v65, v66);
        v72 = objc_msgSend_usage(v12, v68, v69, v70, v71);
        v77 = objc_msgSend_type(v12, v73, v74, v75, v76);
        v82 = objc_msgSend_integerValue(v12, v78, v79, v80, v81);
        objc_msgSend_psKey(v12, v83, v84, v85, v86);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)v262 = v67;
        *(_WORD *)&v262[4] = 1024;
        *(_DWORD *)&v262[6] = v72;
        LOWORD(v263) = 1024;
        *(_DWORD *)((char *)&v263 + 2) = v77;
        HIWORD(v263) = 2048;
        *(void *)v264 = v82;
        *(_WORD *)&v264[8] = 2112;
        v265 = v87;
        _os_log_impl( &dword_189088000,  (os_log_t)v27,  OS_LOG_TYPE_DEFAULT,  "Skipping duplicate element (UP : %x U : %x Type : %u IV: %ld) with key %@\n",  buf,  0x28u);
      }

LABEL_64:
      ++v11;
    }

    while (v255 != v11);
    v235 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v257, (uint64_t)v266, 16);
    v255 = v235;
  }

  while (v235);
LABEL_99:

  _IOHIDLogCategory();
  v236 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v236, OS_LOG_TYPE_DEFAULT))
  {
    v237 = "No";
    if ((v249 & 0x100000000LL) != 0) {
      v238 = "Yes";
    }
    else {
      v238 = "No";
    }
    if ((v250 & 0x100000000LL) != 0) {
      v239 = "Yes";
    }
    else {
      v239 = "No";
    }
    *(_DWORD *)buf = 136315650;
    *(void *)v262 = v238;
    *(_WORD *)&v262[8] = 2080;
    v263 = v239;
    if ((v250 & 1) != 0) {
      v237 = "Yes";
    }
    *(_WORD *)v264 = 2080;
    *(void *)&v264[2] = v237;
    _os_log_impl( &dword_189088000,  v236,  OS_LOG_TYPE_DEFAULT,  "Power Source status isACSource : %s , isCharging : %s , isDischarging : %s",  buf,  0x20u);
  }

  if (((HIDWORD(v249) ^ v248) & 1) != 0
    || ((HIDWORD(v250) ^ v249) & 1) != 0
    || ((v250 ^ HIDWORD(v248)) & 1) != 0)
  {
    upsUpdatedEvent = self->_upsUpdatedEvent;
    if (((v250 | ~BYTE4(v250)) & ~BYTE4(v249) & 1) != 0) {
      objc_msgSend_setObject_forKeyedSubscript_( upsUpdatedEvent,  v240,  (uint64_t)@"Battery Power",  (uint64_t)@"Power Source State",  v242);
    }
    else {
      objc_msgSend_setObject_forKeyedSubscript_( upsUpdatedEvent,  v240,  (uint64_t)@"AC Power",  (uint64_t)@"Power Source State",  v242);
    }
  }

  objc_msgSend_addEntriesFromDictionary_(self->_upsEvent, v240, (uint64_t)self->_upsUpdatedEvent, v241, v242);
  return v256 & 1;
}

uint64_t sub_18909159C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x189616718](a1, sel_valueAvailableCallback_, a2, a4, a5);
}

void sub_189091868(uint64_t a1, void *a2, void *a3)
{
  uint64_t v60 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  uint64_t v9 = (void *)objc_msgSend_copyElements_psKey_( *(void **)(a1 + 32),  v7,  *(void *)(*(void *)(a1 + 32) + 120),  (uint64_t)v5,  v8);
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  id obj = v9;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v55, (uint64_t)v59, 16);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v56;
    do
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v56 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v55 + 1) + 8 * v14);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          uint64_t v20 = objc_msgSend_integerValue(v6, v16, v17, v18, v19);
          if ((objc_msgSend_isEqualToString_(v5, v21, (uint64_t)@"Delayed Remove Power", v22, v23) & 1) != 0
            || objc_msgSend_isEqualToString_(v5, v24, (uint64_t)@"Startup Delay", v25, v26))
          {
            objc_msgSend_setIntegerValue_(v15, v24, 60 * v20, v25, v26);
          }

          else
          {
            int isEqualToString = objc_msgSend_isEqualToString_(v5, v24, (uint64_t)@"Enable Audible Alarm", v25, v26);
            uint64_t v38 = 1LL;
            if (v20) {
              uint64_t v38 = 2LL;
            }
            if (isEqualToString) {
              objc_msgSend_setIntegerValue_(v15, v35, v38, v36, v37);
            }
            else {
              objc_msgSend_setIntegerValue_(v15, v35, v20, v36, v37);
            }
          }
        }

        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_18;
          }
          objc_msgSend_setDataValue_(v15, v31, (uint64_t)v6, v32, v33);
        }

        uint64_t v39 = *(void *)(*(void *)(a1 + 32) + 48LL);
        uint64_t v40 = *(void (**)(uint64_t, uint64_t, void))(*(void *)v39 + 56LL);
        uint64_t v41 = objc_msgSend_elementRef(v15, v27, v28, v29, v30);
        v40(v39, v41, 0LL);
        uint64_t v42 = *(void *)(*(void *)(a1 + 32) + 48LL);
        v43 = *(void (**)(uint64_t, uint64_t, uint64_t, void))(*(void *)v42 + 80LL);
        uint64_t v48 = objc_msgSend_elementRef(v15, v44, v45, v46, v47);
        uint64_t v53 = objc_msgSend_valueRef(v15, v49, v50, v51, v52);
        v43(v42, v48, v53, 0LL);
LABEL_18:
        ++v14;
      }

      while (v12 != v14);
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v31, (uint64_t)&v55, (uint64_t)v59, 16);
    }

    while (v12);
  }
}

uint64_t sub_189091D18(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x189616718](**a1, sel_getProperties_, a2, a4, a5);
}

uint64_t sub_189091D28(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x189616718](**a1, sel_getCapabilities_, a2, a4, a5);
}

uint64_t sub_189091D38(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x189616718](**a1, sel_getEvent_, a2, a4, a5);
}

uint64_t sub_189091D48(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x189616718](**a1, sel_setEventCallback_target_refcon_, a2, a3, a4);
}

uint64_t sub_189091D60(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x189616718](**a1, sel_sendCommand_, a2, a4, a5);
}

uint64_t sub_189091D70(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x189616718](**a1, sel_createAsyncEventSource_, a2, a4, a5);
}

void sub_189091EEC(id *a1)
{
}

  ;
}

uint64_t IOHIDLibFactory(uint64_t a1, const void *a2)
{
  uint64_t v16 = 0LL;
  CFUUIDRef v3 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xFAu,  0x12u,  0xFAu,  0x38u,  0x6Fu,  0x1Au,  0x11u,  0xD4u,  0xBAu,  0xCu,  0,  5u,  2u,  0x8Fu,  0x18u,  0xD5u);
  if (CFEqual(a2, v3))
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___IOHIDObsoleteDeviceClass);
    id v5 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x78u,  0xBDu,  0x42u,  0xCu,  0x6Fu,  0x14u,  0x11u,  0xD4u,  0x94u,  0x74u,  0,  5u,  2u,  0x8Fu,  0x18u,  0xD5u);
    CFUUIDBytes v6 = CFUUIDGetUUIDBytes(v5);
    objc_msgSend_queryInterface_outInterface_( v4,  *(const char **)&v6.byte8,  *(uint64_t *)&v6.byte0,  *(uint64_t *)&v6.byte8,  (uint64_t)&v16);
LABEL_7:

    return v16;
  }

  CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x7Du,  0xDEu,  0xECu,  0xA8u,  0xA7u,  0xB4u,  0x11u,  0xDAu,  0x8Au,  0xEu,  0,  0x14u,  0x51u,  0x97u,  0x58u,  0xEFu);
  if (CFEqual(a2, v7))
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___IOHIDDeviceClass);
    uint64_t v8 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x47u,  0x4Bu,  0xDCu,  0x8Eu,  0x9Fu,  0x4Au,  0x11u,  0xDAu,  0xB3u,  0x66u,  0,  0xDu,  0x93u,  0x6Du,  6u,  0xD2u);
    CFUUIDBytes v9 = CFUUIDGetUUIDBytes(v8);
    objc_msgSend_queryInterface_outInterface_( v4,  *(const char **)&v9.byte8,  *(uint64_t *)&v9.byte0,  *(uint64_t *)&v9.byte8,  (uint64_t)&v16);
    goto LABEL_7;
  }

  CFUUIDRef v10 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x40u,  0xA5u,  0x7Au,  0x4Eu,  0x26u,  0xA0u,  0x11u,  0xD8u,  0x92u,  0x95u,  0,  0xAu,  0x95u,  0x8Au,  0x2Cu,  0x78u);
  if (CFEqual(a2, v10))
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___IOHIDUPSClass);
    uint64_t v11 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xC2u,  0x44u,  0xE8u,  0x58u,  0x10u,  0x9Cu,  0x11u,  0xD4u,  0x91u,  0xD4u,  0,  0x50u,  0xE4u,  0xC6u,  0x42u,  0x6Fu);
    CFUUIDBytes v12 = CFUUIDGetUUIDBytes(v11);
    objc_msgSend_queryInterface_outInterface_( v4,  *(const char **)&v12.byte8,  *(uint64_t *)&v12.byte0,  *(uint64_t *)&v12.byte8,  (uint64_t)&v16);
    goto LABEL_7;
  }

  CFUUIDRef v14 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xBu,  0x84u,  0x2Au,  0xDDu,  0xC3u,  0x95u,  0x43u,  0x52u,  0x95u,  0xF6u,  0x65u,  0x85u,  0xEBu,  0x51u,  0x56u,  0x23u);
  uint64_t v15 = (IOHIDEventServiceFastPathClass *)CFEqual(a2, v14);
  if ((_DWORD)v15) {
    return IOHIDEventServiceFastPathClass::alloc(v15);
  }
  return v16;
}

void sub_1890921E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_31:
          uint64_t v27 = (v27 + 96);
          if (v27 >= v170) {
            goto LABEL_34;
          }
        }

        v156 = v27;
        uint64_t v53 = objc_alloc(*(Class *)(v28 + 3240));
        __int128 v55 = (void *)objc_msgSend_initWithElementStruct_parent_index_(v53, v54, (uint64_t)v34, v46, 0);
        objc_msgSend_elementRef(v55, v56, v57, v58, v59);
        _IOHIDElementSetDeviceInterface();
        objc_msgSend_addObject_(*(void **)((char *)&self->super.super.super.isa + v3), v60, (uint64_t)v55, v61, v62);
        uint64_t v27 = v3;
LABEL_30:

        CFUUIDRef v3 = v27;
        uint64_t v18 = v154;
        LODWORD(v27) = v156;
        goto LABEL_31;
      }

      v157 = 0;
LABEL_34:
      os_unfair_recursive_lock_unlock();
      uint64_t input = 1LL;
      v170 = 96 * v152;
      v75 = objc_alloc(MEMORY[0x189603FB8]);
      v79 = (void *)objc_msgSend_initWithLength_(v75, v76, v170, v77, v78);

      v80 = self->_connect;
      uint64_t v18 = v79;
      v85 = (void *)objc_msgSend_mutableBytes(v18, v81, v82, v83, v84);
      LODWORD(v79) = IOConnectCallMethod(v80, 0xFu, &input, 1u, 0LL, 0LL, 0LL, 0LL, v85, &v170);
      os_unfair_recursive_lock_lock_with_options();
      if (!(_DWORD)v79)
      {
        v86 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
        reportElements = self->_reportElements;
        self->_reportElements = v86;

        if (v170)
        {
          for (j = 0LL; j < v170; j = (j + 96))
          {
            v89 = v18;
            v94 = objc_msgSend_mutableBytes(v89, v90, v91, v92, v93) + j;
            v95 = objc_alloc(&OBJC_CLASS___HIDLibElement);
            v97 = (void *)objc_msgSend_initWithElementStruct_parent_index_(v95, v96, v94, 0, 0);
            objc_msgSend_addObject_(self->_reportElements, v98, (uint64_t)v97, v99, v100);
          }
        }
      }

      v109 = objc_alloc(MEMORY[0x189603FA8]);
      v113 = (NSMutableArray *)objc_msgSend_initWithCapacity_(v109, v110, v157 + 1, v111, v112);
      sortedElements = self->_sortedElements;
      self->_sortedElements = v113;

      if (v157 != -1)
      {
        v117 = 0LL;
        v118 = MEMORY[0x189604A80];
        do
          objc_msgSend_setObject_atIndexedSubscript_(self->_sortedElements, v115, v118, v117++, v116);
        while (v157 + 1 != v117);
      }

      v164 = 0u;
      v165 = 0u;
      v162 = 0u;
      v163 = 0u;
      v119 = *(id *)((char *)&self->super.super.super.isa + v3);
      v121 = objc_msgSend_countByEnumeratingWithState_objects_count_(v119, v120, (uint64_t)&v162, (uint64_t)v174, 16);
      if (v121)
      {
        v126 = v121;
        v127 = *(void *)v163;
        do
        {
          for (k = 0LL; k != v126; ++k)
          {
            if (*(void *)v163 != v127) {
              objc_enumerationMutation(v119);
            }
            v129 = *(void **)(*((void *)&v162 + 1) + 8 * k);
            v130 = self->_sortedElements;
            v131 = objc_msgSend_elementCookie(v129, v122, v123, v124, v125);
            objc_msgSend_replaceObjectAtIndex_withObject_(v130, v132, v131, (uint64_t)v129, v133);
          }

          v126 = objc_msgSend_countByEnumeratingWithState_objects_count_( v119,  v122,  (uint64_t)&v162,  (uint64_t)v174,  16);
        }

        while (v126);
      }

      v160 = 0u;
      v161 = 0u;
      v158 = 0u;
      v159 = 0u;
      v134 = self->_reportElements;
      v136 = objc_msgSend_countByEnumeratingWithState_objects_count_(v134, v135, (uint64_t)&v158, (uint64_t)v173, 16);
      if (v136)
      {
        v141 = v136;
        v142 = *(void *)v159;
        do
        {
          for (m = 0LL; m != v141; ++m)
          {
            if (*(void *)v159 != v142) {
              objc_enumerationMutation(v134);
            }
            v144 = *(void **)(*((void *)&v158 + 1) + 8 * m);
            v145 = self->_sortedElements;
            v146 = objc_msgSend_elementCookie(v144, v137, v138, v139, v140);
            objc_msgSend_replaceObjectAtIndex_withObject_(v145, v147, v146, (uint64_t)v144, v148);
          }

          v141 = objc_msgSend_countByEnumeratingWithState_objects_count_( v134,  v137,  (uint64_t)&v158,  (uint64_t)v173,  16);
        }

        while (v141);
      }

      os_unfair_recursive_lock_unlock();
      v149 = 0;
    }
  }

  return v149;
}

uint64_t sub_189092D64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(_DWORD *)(a2 + 20) == 53) {
    JUMPOUT(0x1895DDDBCLL);
  }
  return MEMORY[0x189616718](*(void *)(a4 + 80), sel_queueCallback_msg_size_info_, a1, a2, a3);
}

uint64_t sub_189092F94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x189616718](a1, sel_valueAvailableCallback_, a2, a4, a5);
}

void sub_189093F64(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  CFUUIDRef v7 = (void *)MEMORY[0x1895DE0EC]();
  if (!objc_msgSend_isEqualToString_(v5, v8, (uint64_t)@"UsageMin", v9, v10))
  {
    if (objc_msgSend_isEqualToString_(v5, v11, (uint64_t)@"UsageMax", v12, v13))
    {
      objc_msgSend_propertyForElementKey_(*(void **)(a1 + 32), v19, (uint64_t)@"Usage", v20, v21);
    }

    else
    {
      if (objc_msgSend_isEqualToString_(v5, v19, (uint64_t)@"ElementCookieMin", v20, v21))
      {
        objc_msgSend_propertyForElementKey_(*(void **)(a1 + 32), v35, (uint64_t)@"ElementCookie", v36, v37);
        goto LABEL_3;
      }

      int isEqualToString = objc_msgSend_isEqualToString_(v5, v35, (uint64_t)@"ElementCookieMax", v36, v37);
      uint64_t v42 = *(void **)(a1 + 32);
      if (!isEqualToString)
      {
        objc_msgSend_propertyForElementKey_(v42, v38, (uint64_t)v5, v39, v40);
        CFUUIDRef v14 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v15 = 4LL;
        objc_msgSend_expressionForKeyPath_(MEMORY[0x189607878], v43, (uint64_t)v14, v44, v45);
        goto LABEL_7;
      }

      objc_msgSend_propertyForElementKey_(v42, v38, (uint64_t)@"ElementCookie", v39, v40);
    }

    CFUUIDRef v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = 1LL;
    objc_msgSend_expressionForKeyPath_(MEMORY[0x189607878], v22, (uint64_t)v14, v23, v24);
    goto LABEL_7;
  }

  objc_msgSend_propertyForElementKey_(*(void **)(a1 + 32), v11, (uint64_t)@"Usage", v12, v13);
LABEL_3:
  CFUUIDRef v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = 3LL;
  objc_msgSend_expressionForKeyPath_(MEMORY[0x189607878], v16, (uint64_t)v14, v17, v18);
LABEL_7:
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_expressionForConstantValue_(MEMORY[0x189607878], v26, (uint64_t)v6, v27, v28);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_predicateWithLeftExpression_rightExpression_modifier_type_options_( MEMORY[0x189607818],  v30,  (uint64_t)v25,  (uint64_t)v29,  0,  v15,  0);
  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_filterUsingPredicate_(*(void **)(a1 + 40), v32, (uint64_t)v31, v33, v34);

  objc_autoreleasePoolPop(v7);
}

LABEL_17:
  os_unfair_recursive_lock_unlock();
  return v12;
}

void sub_189094B80(unsigned int *a1, uint64_t a2, size_t __len, void *__src)
{
  if (a1)
  {
    id v5 = (void (*)(void, uint64_t, void, void, void, void, void))*((void *)a1 + 3);
    if (v5)
    {
      unsigned int v7 = __len;
      if (__src)
      {
        if (*((void *)a1 + 5))
        {
          memmove(*((void **)a1 + 1), __src, __len);
          objc_msgSend_releaseReport_(*((void **)a1 + 5), v9, (uint64_t)__src, v10, v11);
          id v5 = (void (*)(void, uint64_t, void, void, void, void, void))*((void *)a1 + 3);
        }
      }

      v5(*((void *)a1 + 4), a2, *((void *)a1 + 6), *a1, a1[4], *((void *)a1 + 1), v7);
      free(a1);
    }
  }

uint64_t sub_18909507C(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x189616718](**a1, sel_open_, a2, a4, a5);
}

uint64_t sub_18909508C(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x189616718](**a1, sel_close_, a2, a4, a5);
}

uint64_t sub_18909509C(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x189616718](**a1, sel_getProperty_property_, a2, a3, a5);
}

uint64_t sub_1890950B0(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x189616718](**a1, sel_setProperty_property_, a2, a3, a5);
}

uint64_t sub_1890950C4(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x189616718](**a1, sel_getAsyncEventSource_, a2, a4, a5);
}

uint64_t sub_1890950D4(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x189616718](**a1, sel_copyMatchingElements_elements_options_, a2, a3, a4);
}

uint64_t sub_1890950EC( void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return objc_msgSend_setValue_value_timeout_callback_context_options_(**a1, a2, (uint64_t)a2, a3, a4, a5, a6, a7);
}

uint64_t sub_189095110( void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return objc_msgSend_getValue_value_timeout_callback_context_options_(**a1, a2, (uint64_t)a2, a3, a4, a5, a6, a7);
}

uint64_t sub_189095134(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x189616718](**a1, sel_setInputReportCallback_reportLength_callback_context_options_, a2, a3, a4);
}

uint64_t sub_189095154( void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  return objc_msgSend_setReport_reportID_report_reportLength_timeout_callback_context_options_( **a1,  a2,  (uint64_t)a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9);
}

uint64_t sub_1890951A0( void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  return objc_msgSend_getReport_reportID_report_reportLength_timeout_callback_context_options_( **a1,  a2,  (uint64_t)a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9);
}

uint64_t sub_1890951EC(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x189616718]( **a1,  sel_setInputReportWithTimeStampCallback_reportLength_callback_context_options_,  a2,  a3,  a4);
}

uint64_t (*sub_1890953AC())()
{
  v0 = (void *)qword_18C767870;
  if (!qword_18C767870)
  {
    v0 = dlopen("/usr/lib/libRosetta.dylib", 2);
    qword_18C767870 = (uint64_t)v0;
  }

  uint64_t result = (uint64_t (*)())dlsym(v0, "rosetta_is_current_process_translated");
  off_18C767848 = result;
  if (result) {
    return (uint64_t (*)())result();
  }
  return result;
}

uint64_t sub_189095408(uint64_t a1)
{
  id v2 = (void *)qword_18C767870;
  if (!qword_18C767870)
  {
    id v2 = dlopen("/usr/lib/libRosetta.dylib", 2);
    qword_18C767870 = (uint64_t)v2;
  }

  CFUUIDRef v3 = (uint64_t (*)())dlsym(v2, "rosetta_convert_to_rosetta_absolute_time");
  off_18C767850 = v3;
  if (v3) {
    return ((uint64_t (*)(uint64_t))v3)(a1);
  }
  else {
    return a1;
  }
}

void sub_1890957A4(void *a1, uint64_t a2, int a3)
{
  id v4 = a1;
  id v5 = v4;
  if (v4)
  {
    if (a3 == -536870896)
    {
      id v6 = (void (*)(void, void, void, void *))v4[25];
      if (v6)
      {
        unsigned int v7 = v4;
        v6(v4[26], 0LL, v4[27], v4 + 22);
        id v5 = v7;
      }
    }
  }
}

void *sub_189095BE4( void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  unsigned int v7 = (uint64_t (*)(void, uint64_t, void, uint64_t, uint64_t))result[28];
  if (v7) {
    return (void *)v7(result[29], a2, result[30], a3, a7);
  }
  return result;
}

uint64_t sub_189095DD0(void ***a1, void *a2)
{
  if (!a2) {
    return 3758097090LL;
  }
  CFUUIDRef v3 = **a1;
  id v4 = (const void *)v3[8];
  id v5 = v3;
  CFRetain(v4);
  uint64_t v6 = v5[8];

  uint64_t result = 0LL;
  *a2 = v6;
  return result;
}

uint64_t sub_189095E40(uint64_t a1)
{
  return *(void *)(**(void **)a1 + 64LL);
}

uint64_t sub_189095E5C(uint64_t a1, _DWORD *a2)
{
  *a2 = *(_DWORD *)(**(void **)a1 + 48LL);
  return 0LL;
}

uint64_t sub_189095E80(uint64_t a1)
{
  return *(unsigned int *)(**(void **)a1 + 48LL);
}

uint64_t sub_189095E9C(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x189616718](**a1, sel_open_, a2, a4, a5);
}

uint64_t sub_189095EAC(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x189616718](**a1, sel_close_, 0LL, a4, a5);
}

uint64_t sub_189095EBC(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x189616718](**a1, sel_setRemovalCallback_removalTarget_removalRefcon_, a2, a3, a4);
}

uint64_t sub_189095ED4(void **a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x189616718](**a1, sel_getElementValue_value_options_, a2, a3, 0LL);
}

uint64_t sub_189095EEC(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x189616718](**a1, sel_setElementValue_value_, a2, a3, a5);
}

uint64_t sub_189095F00(void **a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x189616718](**a1, sel_getElementValue_value_options_, a2, a3, 0x20000LL);
}

uint64_t sub_189095F18(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_start(*(void **)(**(void **)a1 + 80), a2, a3, a4, a5);
}

uint64_t sub_189095F34(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_stop(*(void **)(**(void **)a1 + 80), a2, a3, a4, a5);
}

uint64_t sub_189095F50(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x189616718](**a1, sel_allocQueue, a3, a4, a5);
}

uint64_t sub_189095F5C(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x189616718](**a1, sel_allocOutputTransaction, a3, a4, a5);
}

uint64_t sub_189095F68(void ***a1, const char *a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6)
{
  int v7 = 0;
  return objc_msgSend_setReport_reportID_report_reportLength_timeout_callback_context_options_( **a1,  a2,  (uint64_t)a2,  a3,  a4,  a5,  a6,  0,  0,  v7);
}

uint64_t sub_189095FB0(void ***a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5, uint64_t a6)
{
  uint64_t v10 = **a1;
  if (a5)
  {
    uint64_t v20 = *a5;
    id v12 = v10;
    int v18 = 0;
    uint64_t Report_reportID_report_reportLength_timeout_callback_context_options = objc_msgSend_getReport_reportID_report_reportLength_timeout_callback_context_options_( v12,  v13,  a2,  a3,  a4,  &v20,  a6,  0,  0,  v18);
    *a5 = v20;
  }

  else
  {
    uint64_t v20 = 0LL;
    id v15 = v10;
    int v19 = 0;
    uint64_t Report_reportID_report_reportLength_timeout_callback_context_options = objc_msgSend_getReport_reportID_report_reportLength_timeout_callback_context_options_( v15,  v16,  a2,  a3,  a4,  &v20,  a6,  0,  0,  v19);
  }

  return Report_reportID_report_reportLength_timeout_callback_context_options;
}

uint64_t sub_189096078(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x189616718](**a1, sel_copyMatchingElements_element_, a2, a3, a5);
}

uint64_t sub_18909608C(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x189616718]( **a1,  sel_setInterruptReportHandlerCallback_reportBufferSize_callback_callbackTarget_callbackRefcon_,  a2,  a3,  a4);
}

void sub_189096124()
{
}

void sub_189096184()
{
}

void sub_1890961E4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_189096254(uint64_t a1, void *a2, os_log_s *a3, uint64_t a4, uint64_t a5)
{
}

void sub_1890962C4()
{
}

void sub_189096324()
{
}

void sub_189096384()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_fault_impl( &dword_189088000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_FAULT,  "Over Release IOHIDIUnknown Reference",  v0,  2u);
}

void sub_1890963C8(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_189088000, log, OS_LOG_TYPE_ERROR, "Unable to create queue analytics\n", v1, 2u);
}

void sub_189096408()
{
}

void sub_189096468()
{
}

void sub_1890964C8()
{
}

void sub_189096528(int *a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = *a1;
  v4[0] = 67109376;
  v4[1] = v3;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl( &dword_189088000,  log,  OS_LOG_TYPE_ERROR,  "IOConnectMapMemory (sharedMemorySize:%d): 0x%x\n",  (uint8_t *)v4,  0xEu);
}

void sub_1890965B0()
{
}

void sub_189096610()
{
}

void sub_189096670()
{
}

void sub_1890966D0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_189096700( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_18908E3F4(&dword_189088000, a1, a3, "Invalid argument (pEvent = null)\n", a5, a6, a7, a8, 0);
  sub_18908E3E0();
}

void sub_189096730(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl( &dword_189088000,  log,  OS_LOG_TYPE_ERROR,  "IOConnectCallMethod (kIOHIDEventServiceFastPathUserClientCopyEvent): 0x%x (copySpec = %@)\n",  (uint8_t *)v3,  0x12u);
}

void sub_1890967B4(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_189088000, log, OS_LOG_TYPE_DEBUG, "%@: %@", (uint8_t *)&v3, 0x16u);
}

void sub_189096838()
{
}

void sub_189096864()
{
}

void sub_1890968C4()
{
}

void sub_189096924()
{
}

void sub_189096950()
{
}

void sub_18909697C()
{
}

void sub_1890969A8()
{
}

void sub_1890969D4()
{
}

void sub_189096A00()
{
}

void sub_189096A2C()
{
}

void sub_189096A8C()
{
}

void sub_189096AEC()
{
}

void sub_189096B4C()
{
}

void sub_189096BAC()
{
}

void sub_189096C0C()
{
}

void sub_189096C6C()
{
}

void sub_189096CCC()
{
}

void sub_189096D2C()
{
}

void sub_189096D8C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_189088000, log, OS_LOG_TYPE_ERROR, "Failed to create queue\n", v1, 2u);
  sub_18908E3E0();
}

void sub_189096DC8()
{
}

void sub_189096E28()
{
}

void sub_189096E88()
{
}

void sub_189096EE8(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl( &dword_189088000,  log,  OS_LOG_TYPE_ERROR,  "Unsupported matching criteria: %@ %@\n",  (uint8_t *)&v3,  0x16u);
}

void sub_189096F6C(uint64_t *a1, int a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *a1;
  int v4 = 134218240;
  uint64_t v5 = v3;
  __int16 v6 = 1024;
  int v7 = a2;
  _os_log_error_impl( &dword_189088000,  log,  OS_LOG_TYPE_ERROR,  "kIOHIDLibUserClientPostElementValues(%llx):%x\n",  (uint8_t *)&v4,  0x12u);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x189602A68](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x189602A98](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x189602AB0](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x189602AC8]();
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x189602C38](cf1, cf2);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x189602D20](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x189602DB8](allocator, port, order);
}

CFMachPortRef CFMachPortCreateWithPort( CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x189602DC0](allocator, *(void *)&portNum, callout, context, shouldFreeInfo);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x189602EA0](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x189602F10](number, theType, valuePtr);
}

void CFPlugInAddInstanceForFactory(CFUUIDRef factoryID)
{
}

void CFPlugInRemoveInstanceForFactory(CFUUIDRef factoryID)
{
}

CFPropertyListRef CFPropertyListCreateDeepCopy( CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x189602FD8](allocator, propertyList, mutabilityOption);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x189603880](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes( CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x189603898](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x1896038B0](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

CFDataRef IOCFSerialize(CFTypeRef object, CFOptionFlags options)
{
  return (CFDataRef)MEMORY[0x189607C88](object, options);
}

kern_return_t IOConnectCallAsyncMethod( mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x189607CA8]( *(void *)&connection,  *(void *)&selector,  *(void *)&wake_port,  reference,  *(void *)&referenceCnt,  input,  *(void *)&inputCnt,  inputStruct);
}

kern_return_t IOConnectCallAsyncScalarMethod( mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x189607CB0]( *(void *)&connection,  *(void *)&selector,  *(void *)&wake_port,  reference,  *(void *)&referenceCnt,  input,  *(void *)&inputCnt,  output);
}

kern_return_t IOConnectCallMethod( mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x189607CB8]( *(void *)&connection,  *(void *)&selector,  input,  *(void *)&inputCnt,  inputStruct,  inputStructCnt,  output,  outputCnt);
}

kern_return_t IOConnectCallScalarMethod( mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x189607CC0]( *(void *)&connection,  *(void *)&selector,  input,  *(void *)&inputCnt,  output,  outputCnt);
}

kern_return_t IOConnectGetService(io_connect_t connect, io_service_t *service)
{
  return MEMORY[0x189607CD0](*(void *)&connect, service);
}

kern_return_t IOConnectMapMemory( io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x189607CD8]( *(void *)&connect,  *(void *)&memoryType,  *(void *)&intoTask,  atAddress,  ofSize,  *(void *)&options);
}

kern_return_t IOConnectSetCFProperty(io_connect_t connect, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x189607CF0](*(void *)&connect, propertyName, property);
}

kern_return_t IOConnectUnmapMemory( io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return MEMORY[0x189607D18](*(void *)&connect, *(void *)&memoryType, *(void *)&fromTask, atAddress);
}

kern_return_t IOCreatePlugInInterfaceForService( io_service_t service, CFUUIDRef pluginType, CFUUIDRef interfaceType, IOCFPlugInInterface ***theInterface, SInt32 *theScore)
{
  return MEMORY[0x189607D30](*(void *)&service, pluginType, interfaceType, theInterface, theScore);
}

mach_port_t IODataQueueAllocateNotificationPort(void)
{
  return MEMORY[0x189607D68]();
}

IOReturn IODataQueueDequeue(IODataQueueMemory *dataQueue, void *data, uint32_t *dataSize)
{
  return MEMORY[0x189607D78](dataQueue, data, dataSize);
}

IODataQueueEntry *__cdecl IODataQueuePeek(IODataQueueMemory *dataQueue)
{
  return (IODataQueueEntry *)MEMORY[0x189607D80](dataQueue);
}

void IODispatchCalloutFromMessage(void *unused, mach_msg_header_t *msg, void *reference)
{
}

uint64_t IOHIDAnalyticsEventActivate()
{
  return MEMORY[0x189607DB0]();
}

uint64_t IOHIDAnalyticsEventCancel()
{
  return MEMORY[0x189607DB8]();
}

uint64_t IOHIDAnalyticsHistogramEventCreate()
{
  return MEMORY[0x189607DC0]();
}

uint64_t IOHIDAnalyticsHistogramEventSetIntegerValue()
{
  return MEMORY[0x189607DC8]();
}

IOHIDElementCollectionType IOHIDElementGetCollectionType(IOHIDElementRef element)
{
  return MEMORY[0x189607EB0](element);
}

IOHIDElementCookie IOHIDElementGetCookie(IOHIDElementRef element)
{
  return MEMORY[0x189607EB8](element);
}

uint32_t IOHIDElementGetReportID(IOHIDElementRef element)
{
  return MEMORY[0x189607EF0](element);
}

IOHIDElementType IOHIDElementGetType(IOHIDElementRef element)
{
  return MEMORY[0x189607F00](element);
}

uint32_t IOHIDElementGetUnit(IOHIDElementRef element)
{
  return MEMORY[0x189607F08](element);
}

uint32_t IOHIDElementGetUnitExponent(IOHIDElementRef element)
{
  return MEMORY[0x189607F10](element);
}

uint32_t IOHIDElementGetUsage(IOHIDElementRef element)
{
  return MEMORY[0x189607F18](element);
}

uint32_t IOHIDElementGetUsagePage(IOHIDElementRef element)
{
  return MEMORY[0x189607F20](element);
}

uint64_t IOHIDEventCreateWithBytesInternal()
{
  return MEMORY[0x189607F80]();
}

IOHIDValueRef IOHIDValueCreateWithBytes( CFAllocatorRef allocator, IOHIDElementRef element, uint64_t timeStamp, const uint8_t *bytes, CFIndex length)
{
  return (IOHIDValueRef)MEMORY[0x189608298](allocator, element, timeStamp, bytes, length);
}

IOHIDValueRef IOHIDValueCreateWithIntegerValue( CFAllocatorRef allocator, IOHIDElementRef element, uint64_t timeStamp, CFIndex value)
{
  return (IOHIDValueRef)MEMORY[0x1896082A0](allocator, element, timeStamp, value);
}

const uint8_t *__cdecl IOHIDValueGetBytePtr(IOHIDValueRef value)
{
  return (const uint8_t *)MEMORY[0x1896082A8](value);
}

IOHIDElementRef IOHIDValueGetElement(IOHIDValueRef value)
{
  return (IOHIDElementRef)MEMORY[0x1896082B0](value);
}

CFIndex IOHIDValueGetIntegerValue(IOHIDValueRef value)
{
  return MEMORY[0x1896082B8](value);
}

CFIndex IOHIDValueGetLength(IOHIDValueRef value)
{
  return MEMORY[0x1896082C0](value);
}

uint64_t IOHIDValueGetTimeStamp(IOHIDValueRef value)
{
  return MEMORY[0x1896082D0](value);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x189608330](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x189608360](*(void *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x189608398](*(void *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x1896083A0](*(void *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties( io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x189608458](*(void *)&entry, properties, allocator, *(void *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty( io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x189608470](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x189608500](*(void *)&entry, entryID);
}

CFTypeRef IORegistryEntrySearchCFProperty( io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x189608520](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

kern_return_t IOServiceAddInterestNotification( IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x189608540](notifyPort, *(void *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x189608550](*(void *)&connect);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x189608598](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x189607458](aClassName);
}

uint64_t _IOHIDElementCreateWithParentAndData()
{
  return MEMORY[0x1896085E0]();
}

uint64_t _IOHIDElementGetLength()
{
  return MEMORY[0x1896085E8]();
}

uint64_t _IOHIDElementGetValue()
{
  return MEMORY[0x1896085F0]();
}

uint64_t _IOHIDElementSetDeviceInterface()
{
  return MEMORY[0x1896085F8]();
}

uint64_t _IOHIDElementSetValue()
{
  return MEMORY[0x189608600]();
}

uint64_t _IOHIDLogCategory()
{
  return MEMORY[0x189608638]();
}

uint64_t _IOHIDValueCopyToElementValueHeader()
{
  return MEMORY[0x189608648]();
}

uint64_t _IOHIDValueCreateWithElementValuePtr()
{
  return MEMORY[0x189608650]();
}

uint64_t _IOHIDValueCreateWithStruct()
{
  return MEMORY[0x189608658]();
}

uint64_t _IOHIDValueGetFlags()
{
  return MEMORY[0x189608660]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_18A33EDC8(__sz);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1896147B8](a1);
}

double __exp10(double a1)
{
  return result;
}

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1895FAF60](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1895FAF78](__handle, __symbol);
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1895FBA98]();
}

kern_return_t mach_port_mod_refs( ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1895FBB78](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

void objc_autoreleasePoolPop(void *context)
{
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1896165E8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1896165F8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1896166C8](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x189616700](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616830](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x189616968](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1895FC688]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1895FC6A0]();
}

SEL sel_getUid(const char *str)
{
  return (SEL)MEMORY[0x189616A50](str);
}

uint64_t objc_msgSend_countByEnumeratingWithState_objects_count_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_countByEnumeratingWithState_objects_count_, a3, a4, a5);
}

uint64_t objc_msgSend_dictionaryWithObjects_forKeys_count_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_dictionaryWithObjects_forKeys_count_, a3, a4, a5);
}

uint64_t objc_msgSend_enumerateKeysAndObjectsUsingBlock_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_enumerateKeysAndObjectsUsingBlock_, a3, a4, a5);
}

uint64_t objc_msgSend_getReport_reportID_report_reportLength_timeout_callback_context_options_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718]( a1,  sel_getReport_reportID_report_reportLength_timeout_callback_context_options_,  a3,  a4,  a5);
}

uint64_t objc_msgSend_getValue_value_timeout_callback_context_options_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_getValue_value_timeout_callback_context_options_, a3, a4, a5);
}

uint64_t objc_msgSend_initWithElementStruct_parent_index_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithElementStruct_parent_index_, a3, a4, a5);
}

uint64_t objc_msgSend_initWithFireDate_interval_repeats_block_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithFireDate_interval_repeats_block_, a3, a4, a5);
}

uint64_t objc_msgSend_predicateWithLeftExpression_rightExpression_modifier_type_options_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_predicateWithLeftExpression_rightExpression_modifier_type_options_, a3, a4, a5);
}

uint64_t objc_msgSend_replaceObjectAtIndex_withObject_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_replaceObjectAtIndex_withObject_, a3, a4, a5);
}

uint64_t objc_msgSend_setReport_reportID_report_reportLength_timeout_callback_context_options_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718]( a1,  sel_setReport_reportID_report_reportLength_timeout_callback_context_options_,  a3,  a4,  a5);
}

uint64_t objc_msgSend_setValue_value_timeout_callback_context_options_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_setValue_value_timeout_callback_context_options_, a3, a4, a5);
}

uint64_t objc_msgSend_setValueAvailableCallback_context_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_setValueAvailableCallback_context_, a3, a4, a5);
}

uint64_t objc_msgSend_stringByReplacingCharactersInRange_withString_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_stringByReplacingCharactersInRange_withString_, a3, a4, a5);
}
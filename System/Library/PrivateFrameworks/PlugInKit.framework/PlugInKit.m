void sub_186A0667C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_186A066A0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v14, v6, (uint64_t)@"election", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend_integerValue(v9, v10, v11, v12, v13);
}

void sub_186A06890(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5 = *(void **)(a1 + 32);
  objc_msgSend_numberWithInteger_(MEMORY[0x189607968], a2, *(void *)(a1 + 40), a4, a5);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAnnotation_value_(v5, v6, (uint64_t)@"election", (uint64_t)v8, v7);
}

void sub_186A069C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_186A069DC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_186A069EC(uint64_t a1)
{
}

void sub_186A069F4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v12, v6, (uint64_t)@"extension", v7, v8);
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

uint64_t sub_186A06B04(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_setAnnotation_value_( *(void **)(a1 + 32),  a2,  (uint64_t)@"extension",  *(void *)(a1 + 40),  a5);
}

uint64_t sub_186A06D4C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_invoke(*(void **)(a1 + 32), a2, a3, a4, a5);
}

void sub_186A06EF4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_186A06F10(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_copy(v13, v6, v7, v8, v9);
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

void sub_186A07238(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  pklog_handle_for_category(7);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7[0] = 67240192;
    v7[1] = v3 == 0LL;
    _os_signpost_emit_with_name_impl( &dword_186A04000,  v5,  OS_SIGNPOST_INTERVAL_END,  v6,  "HostBeginUsing",  " success=%{public, signpost.description:attribute}d ",  (uint8_t *)v7,  8u);
  }

  __PLUGINKIT_HANDING_CONTROL_TO_CLIENT__((uint64_t)v3, *(void *)(a1 + 32));
}

uint64_t sub_186A0731C(uint64_t a1, const char *a2)
{
  return objc_msgSend_startPlugInRequest_synchronously_subsystemOptions_completion_( *(void **)(a1 + 32),  a2,  *(void *)(a1 + 40),  0,  *(void *)(a1 + 48),  *(void *)(a1 + 56));
}

void sub_186A0763C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t sub_186A0765C(void *a1, const char *a2)
{
  id v3 = (void *)a1[4];
  uint64_t v2 = a1[5];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = sub_186A076B4;
  v6[3] = &unk_189F206A8;
  uint64_t v4 = a1[6];
  v6[4] = a1[7];
  return objc_msgSend_startPlugInRequest_synchronously_subsystemOptions_completion_(v3, a2, v2, 1, v4, v6);
}

void sub_186A076B4(uint64_t a1, void *a2)
{
}

void sub_186A08430( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id *location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, id a47, char a48)
{
}

void sub_186A084B8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v68 = *MEMORY[0x1895F89C0];
  switch(objc_msgSend_state(*(void **)(a1 + 32), a2, a3, a4, a5))
  {
    case 1LL:
      uint64_t isData = objc_msgSend_isData(*(void **)(a1 + 32), v6, v7, v8, v9);
      char v15 = isData;
      if ((isData & 1) != 0)
      {
        BOOL v16 = 0;
      }

      else
      {
        uint64_t isData = objc_msgSend_plugInPrincipal(*(void **)(a1 + 32), v11, v12, v13, v14);
        BOOL v16 = isData == 0;
      }

      if (v16) {
        sub_186A23B50();
      }
      if ((v15 & 1) == 0) {

      }
      v24 = *(void **)(a1 + 32);
      int v25 = objc_msgSend_useCount(v24, v11, v12, v13, v14);
      objc_msgSend_setUseCount_(v24, v26, (v25 + 1), v27, v28);
      pklog_handle_for_category(7);
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_uuid(*(void **)(a1 + 32), v30, v31, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_multipleInstanceUUID(*(void **)(a1 + 32), v35, v36, v37, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(*(void **)(a1 + 32), v40, v41, v42, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_version(*(void **)(a1 + 32), v45, v46, v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        int v54 = objc_msgSend_useCount(*(void **)(a1 + 32), v50, v51, v52, v53);
        int v58 = 138544386;
        v59 = v34;
        __int16 v60 = 2114;
        v61 = v39;
        __int16 v62 = 2112;
        v63 = v44;
        __int16 v64 = 2112;
        v65 = v49;
        __int16 v66 = 1024;
        int v67 = v54;
        _os_log_impl( &dword_186A04000,  v29,  OS_LOG_TYPE_DEFAULT,  "[u %{public}@:m %{public}@] [%@(%@)] plugin reference count incremented to %d, and ready for host.",  (uint8_t *)&v58,  0x30u);
      }

      objc_msgSend_addRequestUUID_(*(void **)(a1 + 32), v55, *(void *)(a1 + 40), v56, v57);
      (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
      goto LABEL_21;
    case 2LL:
      pklog_handle_for_category(7);
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_186A23B78(a1 + 32, v17);
      }

      uint64_t v18 = *(void *)(a1 + 48);
      v19 = @"plugin has died and must be rediscovered";
      uint64_t v20 = 5LL;
      goto LABEL_13;
    case 3LL:
      pklog_handle_for_category(7);
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_186A23CD0(a1 + 32, v21);
      }

      return;
    case 4LL:
      pklog_handle_for_category(7);
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_186A23C24(a1 + 32, v22);
      }

      uint64_t v18 = *(void *)(a1 + 48);
      v19 = @"plugin is spent and cannot be used anymore";
      uint64_t v20 = 17LL;
LABEL_13:
      pkError(v20, v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v23);

LABEL_21:
      *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
      break;
    default:
      return;
  }
}

void sub_186A08774(uint64_t a1, void *a2, int a3)
{
  uint64_t v76 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v5)
    {
      if (!a3)
      {
LABEL_5:
        pklog_handle_for_category(7);
        uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          sub_186A23DBC( (uint64_t)WeakRetained,  (uint64_t)v10,  v11,  v12,  v13,  v14,  v15,  v16,  v71,  *(uint64_t *)&v72[4],  *(uint64_t *)&v72[12],  v73,  v74,  *((uint64_t *)&v74 + 1),  v75,  v76,  v77,  v78,  v79,  v80,  v81,  v82,  v83,  v84);
        }

        objc_msgSend__startQueue(WeakRetained, v17, v18, v19, v20);
        v21 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue();
        dispatch_resume(v21);

        (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
        goto LABEL_11;
      }
    }

    else
    {
      pklog_handle_for_category(7);
      v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_uuid(WeakRetained, v51, v52, v53, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_multipleInstanceUUID(WeakRetained, v56, v57, v58, v59);
        __int16 v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(WeakRetained, v61, v62, v63, v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_version(WeakRetained, v66, v67, v68, v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        int v71 = 138544130;
        *(void *)v72 = v55;
        *(_WORD *)&v72[8] = 2114;
        *(void *)&v72[10] = v60;
        *(_WORD *)&v72[18] = 2112;
        uint64_t v73 = (uint64_t)v65;
        LOWORD(v74) = 2112;
        *(void *)((char *)&v74 + 2) = v70;
        _os_log_impl( &dword_186A04000,  v50,  OS_LOG_TYPE_DEFAULT,  "[u %{public}@:m %{public}@] [%@(%@)] plugin loaded and ready for host",  (uint8_t *)&v71,  0x2Au);
      }

      if (!a3) {
        goto LABEL_5;
      }
    }

    objc_msgSend_deactivatePlugIn_(*(void **)(a1 + 32), v6, (uint64_t)WeakRetained, v7, v8);
    goto LABEL_5;
  }

  pklog_handle_for_category(7);
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    sub_186A23D7C(v22);
  }

LABEL_11:
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL))
  {
    pklog_handle_for_category(7);
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_uuid(WeakRetained, v24, v25, v26, v27);
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_multipleInstanceUUID(WeakRetained, v29, v30, v31, v32);
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(WeakRetained, v34, v35, v36, v37);
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_version(WeakRetained, v39, v40, v41, v42);
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
      int v71 = 138544130;
      *(void *)v72 = v28;
      *(_WORD *)&v72[8] = 2114;
      *(void *)&v72[10] = v33;
      *(_WORD *)&v72[18] = 2112;
      uint64_t v73 = (uint64_t)v38;
      LOWORD(v74) = 2112;
      *(void *)((char *)&v74 + 2) = v43;
      _os_log_impl( &dword_186A04000,  v23,  OS_LOG_TYPE_DEFAULT,  "[u %{public}@:m %{public}@] [%@(%@)] invalidating startup assertion",  (uint8_t *)&v71,  0x2Au);
    }

    objc_msgSend_invalidate(*(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v44, v45, v46, v47);
    uint64_t v48 = *(void *)(*(void *)(a1 + 48) + 8LL);
    v49 = *(void **)(v48 + 40);
    *(void *)(v48 + 40) = 0LL;
  }
}

uint64_t sub_186A08A68(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_changeState_(*(void **)(a1 + 32), a2, 3, a4, a5);
}

void sub_186A08A74(uint64_t a1, void *a2, void *a3, void *a4)
{
  v415[1] = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  pklog_handle_for_category(7);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = v10;
  os_signpost_id_t v12 = *(void *)(a1 + 88);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( &dword_186A04000,  v11,  OS_SIGNPOST_INTERVAL_END,  v12,  "HostToDaemonReadyPlugIns",  (const char *)&unk_186A2C58B,  buf,  2u);
  }

  if (!v7)
  {
    objc_msgSend_objectAtIndexedSubscript_(v8, v13, 0, v14, v15);
    v379 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v24 = objc_msgSend_count(v9, v17, v18, v19, v20);
    if (v24)
    {
      objc_msgSend_objectAtIndexedSubscript_(v9, v21, 0, v22, v23);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v25 = 0LL;
    }

    id v380 = v25;
    if (v24) {

    }
    pklog_handle_for_category(7);
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_uuid(*(void **)(a1 + 32), v27, v28, v29, v30);
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_multipleInstanceUUID(*(void **)(a1 + 32), v32, v33, v34, v35);
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(*(void **)(a1 + 32), v37, v38, v39, v40);
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_version(*(void **)(a1 + 32), v42, v43, v44, v45);
      uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v406 = v31;
      __int16 v407 = 2114;
      v408 = v36;
      __int16 v409 = 2112;
      v410 = v41;
      __int16 v411 = 2112;
      v412 = v46;
      __int16 v413 = 2112;
      *(void *)v414 = v379;
      _os_log_impl( &dword_186A04000,  v26,  OS_LOG_TYPE_DEFAULT,  "[u %{public}@:m %{public}@] [%@(%@)] got pid from ready request: %@",  buf,  0x34u);
    }

    if (v380)
    {
      objc_msgSend_uuid(*(void **)(a1 + 32), v47, v48, v49, v50);
      uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
      int v55 = objc_msgSend_isEqual_(v51, v52, (uint64_t)v380, v53, v54) ^ 1;
    }

    else
    {
      int v55 = 0;
    }

    if (v55)
    {
      objc_msgSend_discoveryMap(*(void **)(a1 + 40), v47, v48, v49, v50);
      uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v56, v57, (uint64_t)v380, v58, v59);
      __int16 v60 = (void *)objc_claimAutoreleasedReturnValue();

      if (v60)
      {
        pklog_handle_for_category(7);
        v61 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG)) {
          sub_186A24550( a1,  (uint64_t)v60,  (uint64_t)v61,  v62,  v63,  v64,  v65,  v66,  v368,  (uint64_t)v371,  (uint64_t)v373,  (uint64_t)v375,  v377,  (uint64_t)v379,  (uint64_t)v380,  v381,  v382,  (uint64_t)v383,  (uint64_t)v384,  v385,  (uint64_t)v386,  (uint64_t)v387,  (uint64_t)v388,  v389);
        }

        uint64_t v67 = @"stale";
      }

      else
      {
        uint64_t v67 = @"invalid";
      }

      pklog_handle_for_category(15);
      uint64_t v68 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT)) {
        sub_186A244A0( a1,  (uint64_t)v67,  (uint64_t)v68,  v69,  v70,  v71,  v72,  v73,  v368,  (uint64_t)v371,  (uint64_t)v373,  (uint64_t)v375,  v377,  (uint64_t)v379,  (uint64_t)v380,  v381,  v382,  (uint64_t)v383,  (uint64_t)v384,  v385,  (uint64_t)v386,  (uint64_t)v387,  (uint64_t)v388,  v389);
      }
    }

    if (!v379 || !objc_opt_class())
    {
LABEL_69:
      if (!objc_msgSend_isData(*(void **)(a1 + 32), v47, v48, v49, v50))
      {
        objc_msgSend_serviceExtension(*(void **)(a1 + 32), v232, v233, v234, v235);
        v240 = (void *)objc_claimAutoreleasedReturnValue();

        if (v240)
        {
          v245 = *(void **)(a1 + 32);
          objc_msgSend_serviceExtension(v245, v241, v242, v243, v244);
          v246 = (void *)objc_claimAutoreleasedReturnValue();
          v415[0] = v246;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x189603F18], v247, (uint64_t)v415, 1, v248);
          v249 = (void *)objc_claimAutoreleasedReturnValue();
          id v398 = 0LL;
          char Extensions_error = objc_msgSend_loadExtensions_error_(v245, v250, (uint64_t)v249, (uint64_t)&v398, v251);
          id v7 = v398;

          if ((Extensions_error & 1) == 0)
          {
            pklog_handle_for_category(7);
            v253 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v253, OS_LOG_TYPE_ERROR)) {
              sub_186A23E70(a1 + 32, v7, v253);
            }

            (*(void (**)(void))(*(void *)(a1 + 72) + 16LL))();
            goto LABEL_89;
          }
        }

        else
        {
          id v7 = 0LL;
        }

        objc_msgSend_setDelegate_(*(void **)(a1 + 48), v241, *(void *)(a1 + 32), v243, v244);
        objc_msgSend_interfaceWithProtocol_(MEMORY[0x189607B48], v254, (uint64_t)&unk_18C69B430, v255, v256);
        v257 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setRemoteObjectInterface_(*(void **)(a1 + 48), v258, (uint64_t)v257, v259, v260);

        objc_msgSend_setExportedObject_(*(void **)(a1 + 48), v261, *(void *)(a1 + 40), v262, v263);
        objc_msgSend_interfaceWithProtocol_(MEMORY[0x189607B48], v264, (uint64_t)&unk_18C6A1518, v265, v266);
        v267 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setExportedInterface_(*(void **)(a1 + 48), v268, (uint64_t)v267, v269, v270);

        objc_initWeak(&location, *(id *)(a1 + 32));
        v394[0] = MEMORY[0x1895F87A8];
        v394[1] = 3221225472LL;
        v394[2] = sub_186A09BC8;
        v394[3] = &unk_189F20770;
        v376 = &v396;
        objc_copyWeak(&v396, &location);
        id v395 = *(id *)(a1 + 72);
        v378 = (void *)MEMORY[0x186E4154C](v394);
        objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(*(void **)(a1 + 48), v271, (uint64_t)v378, v272, v273);
        v274 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setSyncService_(*(void **)(a1 + 32), v275, (uint64_t)v274, v276, v277);

        objc_msgSend_syncService(*(void **)(a1 + 32), v278, v279, v280, v281);
        v282 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_set_userInfo_(v282, v283, (uint64_t)&unk_189F2DF18, v284, v285);

        objc_msgSend_remoteObjectProxyWithErrorHandler_(*(void **)(a1 + 48), v286, (uint64_t)v378, v287, v288);
        v289 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setService_(*(void **)(a1 + 32), v290, (uint64_t)v289, v291, v292);

        v297 = *(void **)(a1 + 32);
        if (*(_BYTE *)(a1 + 96)) {
          objc_msgSend_syncService(v297, v293, v294, v295, v296);
        }
        else {
          objc_msgSend_service(v297, v293, v294, v295, v296);
        }
        v298 = (void *)objc_claimAutoreleasedReturnValue();
        id v369 = v298;

        v392[0] = MEMORY[0x1895F87A8];
        v392[1] = 3221225472LL;
        v392[2] = sub_186A09C50;
        v392[3] = &unk_189F207C0;
        v372 = &v393;
        objc_copyWeak(&v393, &location);
        objc_msgSend_setInterruptionHandler_(*(void **)(a1 + 48), v299, (uint64_t)v392, v300, v301);
        v390[0] = MEMORY[0x1895F87A8];
        v390[1] = 3221225472LL;
        v390[2] = sub_186A09F8C;
        v390[3] = &unk_189F207C0;
        v374 = &v391;
        objc_copyWeak(&v391, &location);
        objc_msgSend_setInvalidationHandler_(*(void **)(a1 + 48), v302, (uint64_t)v390, v303, v304);
        objc_msgSend_multipleInstanceUUID(*(void **)(a1 + 32), v305, v306, v307, v308);
        v309 = (void *)objc_claimAutoreleasedReturnValue();

        if (v309)
        {
          objc_msgSend_multipleInstanceUUID(*(void **)(a1 + 32), v310, v311, v312, v313, v369, &v393, &v391, &v396);
          v314 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_getUUIDBytes_(v314, v315, (uint64_t)buf, v316, v317);

          objc_msgSend_pluginConnection(*(void **)(a1 + 32), v318, v319, v320, v321);
          v322 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend__xpcConnection(v322, v323, v324, v325, v326);
          v327 = (void *)objc_claimAutoreleasedReturnValue();
          xpc_connection_set_oneshot_instance();
        }

        objc_msgSend_resume(*(void **)(a1 + 32), v310, v311, v312, v313, v369);
        pklog_handle_for_category(7);
        v328 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v328, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_uuid(*(void **)(a1 + 32), v329, v330, v331, v332);
          v333 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_multipleInstanceUUID(*(void **)(a1 + 32), v334, v335, v336, v337);
          v338 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_identifier(*(void **)(a1 + 32), v339, v340, v341, v342);
          v343 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_version(*(void **)(a1 + 32), v344, v345, v346, v347);
          v348 = (void *)objc_claimAutoreleasedReturnValue();
          uid_t v349 = geteuid();
          uid_t v350 = getuid();
          *(_DWORD *)buf = 138544642;
          v406 = v333;
          __int16 v407 = 2114;
          v408 = v338;
          __int16 v409 = 2112;
          v410 = v343;
          __int16 v411 = 2112;
          v412 = v348;
          __int16 v413 = 1024;
          *(_DWORD *)v414 = v349;
          *(_WORD *)&v414[4] = 1024;
          *(_DWORD *)&v414[6] = v350;
          _os_log_impl( &dword_186A04000,  v328,  OS_LOG_TYPE_DEFAULT,  "[u %{public}@:m %{public}@] [%@(%@)] Prepare using sent as euid = %d, uid = %d, (persona not available)",  buf,  0x36u);
        }

        pklog_handle_for_category(7);
        v351 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        v352 = v351;
        os_signpost_id_t v353 = *(void *)(a1 + 88);
        if (v353 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v351))
        {
          objc_msgSend_identifier(*(void **)(a1 + 32), v354, v355, v356, v357);
          v358 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_uuid(*(void **)(a1 + 32), v359, v360, v361, v362);
          v363 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138478083;
          v406 = v358;
          __int16 v407 = 2114;
          v408 = v363;
          _os_signpost_emit_with_name_impl( &dword_186A04000,  v352,  OS_SIGNPOST_INTERVAL_BEGIN,  v353,  "HostToExtensionPrepareUsing",  " identifier=%{private, signpost.description:attribute}@  uuid=%{public, signpost.description:attribute}@ ",  buf,  0x16u);
        }

        v364 = *(void **)(a1 + 32);
        uint64_t v381 = MEMORY[0x1895F87A8];
        uint64_t v382 = 3221225472LL;
        v383 = sub_186A0A1D8;
        v384 = &unk_189F20810;
        uint64_t v389 = *(void *)(a1 + 88);
        uint64_t v385 = (uint64_t)v364;
        id v388 = *(id *)(a1 + 72);
        id v365 = v370;
        id v386 = v365;
        id v387 = *(id *)(a1 + 64);
        objc_msgSend_preparePlugInUsingService_completion_(v364, v366, (uint64_t)v365, (uint64_t)&v381, v367);

        objc_destroyWeak(v374);
        objc_destroyWeak(v372);

        objc_destroyWeak(v376);
        objc_destroyWeak(&location);
        goto LABEL_89;
      }

      uint64_t v236 = *(void *)(a1 + 56);
      uint64_t v237 = *(unsigned __int8 *)(a1 + 96);
      v399[0] = MEMORY[0x1895F87A8];
      v399[1] = 3221225472LL;
      v399[2] = sub_186A09A88;
      v399[3] = &unk_189F20748;
      v238 = *(void **)(a1 + 40);
      v399[4] = *(void *)(a1 + 32);
      id v401 = *(id *)(a1 + 72);
      id v400 = *(id *)(a1 + 64);
      objc_msgSend_accessPlugIns_synchronously_flags_extensions_(v238, v239, v236, v237, 0, v399);

LABEL_71:
      id v7 = 0LL;
LABEL_89:

      goto LABEL_90;
    }

    uint64_t v74 = objc_msgSend_intValue(v379, v47, v48, v49, v50);
    uint64_t v79 = objc_msgSend_external(*(void **)(a1 + 32), v75, v76, v77, v78);
    objc_msgSend_runningboard((void *)v79, v80, v81, v82, v83);
    uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v86 = objc_msgSend_processAssertionWithPID_flags_reason_name_( v84,  v85,  v74,  7,  9,  @"com.apple.extension.session");
    uint64_t v87 = *(void *)(*(void *)(a1 + 80) + 8LL);
    v88 = *(void **)(v87 + 40);
    *(void *)(v87 + 40) = v86;

    v403[0] = MEMORY[0x1895F87A8];
    v403[1] = 3221225472LL;
    v403[2] = sub_186A09A34;
    v403[3] = &unk_189F20608;
    v403[4] = *(void *)(a1 + 32);
    id v404 = *(id *)(a1 + 48);
    objc_msgSend_setInvalidationHandler_( *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40),  v89,  (uint64_t)v403,  v90,  v91);
    LOBYTE(v79) = objc_msgSend_acquire(*(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40), v92, v93, v94, v95);
    pklog_handle_for_category(7);
    v96 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v97 = v96;
    if ((v79 & 1) == 0)
    {
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR)) {
        sub_186A243F4( a1 + 32,  (uint64_t)v97,  v181,  v182,  v183,  v184,  v185,  v186,  v368,  (uint64_t)v371,  (uint64_t)v373,  (uint64_t)v375,  v377,  (uint64_t)v379,  (uint64_t)v380,  v381,  v382,  (uint64_t)v383,  (uint64_t)v384,  v385,  (uint64_t)v386,  (uint64_t)v387,  (uint64_t)v388,  v389);
      }

      objc_msgSend_invalidate(*(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40), v187, v188, v189, v190);
      uint64_t v191 = *(void *)(*(void *)(a1 + 80) + 8LL);
      v192 = *(void **)(v191 + 40);
      *(void *)(v191 + 40) = 0LL;

      pkError(4LL, @"could not acquire startup assertion");
      id v155 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(void *)(a1 + 72) + 16LL))();
      int v193 = 1;
LABEL_68:

      if (v193) {
        goto LABEL_71;
      }
      goto LABEL_69;
    }

    if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_uuid(*(void **)(a1 + 32), v98, v99, v100, v101);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_multipleInstanceUUID(*(void **)(a1 + 32), v103, v104, v105, v106);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(*(void **)(a1 + 32), v108, v109, v110, v111);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_version(*(void **)(a1 + 32), v113, v114, v115, v116);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v406 = v102;
      __int16 v407 = 2114;
      v408 = v107;
      __int16 v409 = 2112;
      v410 = v112;
      __int16 v411 = 2112;
      v412 = v117;
      _os_log_impl( &dword_186A04000,  v97,  OS_LOG_TYPE_DEFAULT,  "[u %{public}@:m %{public}@] [%@(%@)] acquired startup assertion",  buf,  0x2Au);
    }

    pklog_handle_for_category(7);
    v118 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v119 = os_signpost_id_make_with_pointer(v118, *(const void **)(a1 + 32));

    pklog_handle_for_category(7);
    v120 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v121 = v120;
    if (v119 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v120))
    {
      objc_msgSend_identifier(*(void **)(a1 + 32), v122, v123, v124, v125);
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_uuid(*(void **)(a1 + 32), v127, v128, v129, v130);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478083;
      v406 = v126;
      __int16 v407 = 2114;
      v408 = v131;
      _os_signpost_emit_with_name_impl( &dword_186A04000,  v121,  OS_SIGNPOST_INTERVAL_BEGIN,  v119,  "HostRBExtensionCheck",  " identifier=%{private, signpost.description:attribute}@  uuid=%{public, signpost.description:attribute}@ ",  buf,  0x16u);
    }

    objc_msgSend_external(*(void **)(a1 + 32), v132, v133, v134, v135);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_runningboard(v136, v137, v138, v139, v140);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = (void *)MEMORY[0x189607968];
    uint64_t v147 = objc_msgSend_intValue(v379, v143, v144, v145, v146);
    objc_msgSend_numberWithInt_(v142, v148, v147, v149, v150);
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    id v402 = 0LL;
    objc_msgSend_taskStatesForPID_error_(v141, v152, (uint64_t)v151, (uint64_t)&v402, v153);
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    id v155 = v402;

    pklog_handle_for_category(7);
    v156 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v157 = v156;
    if (v119 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v156))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( &dword_186A04000,  v157,  OS_SIGNPOST_INTERVAL_END,  v119,  "HostRBExtensionCheck",  (const char *)&unk_186A2C58B,  buf,  2u);
    }

    if (v154)
    {
      uint64_t v162 = objc_msgSend_count(v154, v158, v159, v160, v161);
      uint64_t v166 = v162;
      if (v162)
      {
        if (v162 != 1)
        {
          pklog_handle_for_category(7);
          v174 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v174, OS_LOG_TYPE_ERROR)) {
            sub_186A24110(a1 + 32, v166, v174);
          }
          goto LABEL_65;
        }

        objc_msgSend_objectAtIndexedSubscript_(v154, v163, 0, v164, v165);
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        int isRunning = objc_msgSend_isRunning(v167, v168, v169, v170, v171);

        pklog_handle_for_category(7);
        v173 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        v174 = v173;
        if (isRunning)
        {
          if (os_log_type_enabled(v173, OS_LOG_TYPE_DEBUG)) {
            sub_186A241F0( a1 + 32,  (uint64_t)v174,  v175,  v176,  v177,  v178,  v179,  v180,  v368,  (uint64_t)v371,  (uint64_t)v373,  (uint64_t)v375,  v377,  (uint64_t)v379,  (uint64_t)v380,  v381,  v382,  (uint64_t)v383,  (uint64_t)v384,  v385,  (uint64_t)v386,  (uint64_t)v387,  (uint64_t)v388,  v389);
          }
LABEL_65:
          int v193 = 0;
LABEL_66:

          goto LABEL_67;
        }

        if (os_log_type_enabled(v173, OS_LOG_TYPE_ERROR)) {
          sub_186A2429C( a1 + 32,  (uint64_t)v174,  v206,  v207,  v208,  v209,  v210,  v211,  v368,  (uint64_t)v371,  (uint64_t)v373,  (uint64_t)v375,  v377,  (uint64_t)v379,  (uint64_t)v380,  v381,  v382,  (uint64_t)v383,  (uint64_t)v384,  v385,  (uint64_t)v386,  (uint64_t)v387,  (uint64_t)v388,  v389);
        }
      }

      else
      {
        pklog_handle_for_category(7);
        v174 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v174, OS_LOG_TYPE_ERROR)) {
          sub_186A24348( a1 + 32,  (uint64_t)v174,  v200,  v201,  v202,  v203,  v204,  v205,  v368,  (uint64_t)v371,  (uint64_t)v373,  (uint64_t)v375,  v377,  (uint64_t)v379,  (uint64_t)v380,  v381,  v382,  (uint64_t)v383,  (uint64_t)v384,  v385,  (uint64_t)v386,  (uint64_t)v387,  (uint64_t)v388,  v389);
        }
      }

LABEL_60:
      pklog_handle_for_category(7);
      v219 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v219, OS_LOG_TYPE_ERROR)) {
        sub_186A23F14( a1 + 32,  (uint64_t)v219,  v220,  v221,  v222,  v223,  v224,  v225,  v368,  (uint64_t)v371,  (uint64_t)v373,  (uint64_t)v375,  v377,  (uint64_t)v379,  (uint64_t)v380,  v381,  v382,  (uint64_t)v383,  (uint64_t)v384,  v385,  (uint64_t)v386,  (uint64_t)v387,  (uint64_t)v388,  v389);
      }

      objc_msgSend_invalidate(*(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40), v226, v227, v228, v229);
      uint64_t v230 = *(void *)(*(void *)(a1 + 80) + 8LL);
      v231 = *(void **)(v230 + 40);
      *(void *)(v230 + 40) = 0LL;

      pkError(4LL, @"Extension process exited while/after acquiring startup assertion");
      v174 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(void *)(a1 + 72) + 16LL))();
      int v193 = 1;
      goto LABEL_66;
    }

    if (!v155)
    {
      int v193 = 0;
LABEL_67:

      goto LABEL_68;
    }

    objc_msgSend_domain(v155, v158, v159, v160, v161);
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    v199 = v194;
    if (v194 == (void *)*MEMORY[0x1896124C8])
    {
      BOOL v212 = objc_msgSend_code(v155, v195, v196, v197, v198) == 1;

      if (v212)
      {
        pklog_handle_for_category(7);
        v174 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v174, OS_LOG_TYPE_ERROR)) {
          sub_186A23FC0( a1 + 32,  (uint64_t)v174,  v213,  v214,  v215,  v216,  v217,  v218,  v368,  (uint64_t)v371,  (uint64_t)v373,  (uint64_t)v375,  v377,  (uint64_t)v379,  (uint64_t)v380,  v381,  v382,  (uint64_t)v383,  (uint64_t)v384,  v385,  (uint64_t)v386,  (uint64_t)v387,  (uint64_t)v388,  v389);
        }
        goto LABEL_60;
      }
    }

    else
    {
    }

    pklog_handle_for_category(7);
    v174 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v174, OS_LOG_TYPE_ERROR)) {
      sub_186A2406C(a1 + 32, v155, v174);
    }
    goto LABEL_65;
  }

  pklog_handle_for_category(7);
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_186A24600(a1, v7, v16);
  }

  (*(void (**)(void))(*(void *)(a1 + 72) + 16LL))();
LABEL_90:
}

void sub_186A099CC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *location, id *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, id a41)
{
}

uint64_t sub_186A09A34(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_186A246A8(a1, v2);
  }

  return objc_msgSend_invalidate(*(void **)(a1 + 40), v3, v4, v5, v6);
}

void sub_186A09A88(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void **)(a1 + 32);
  id v25 = 0LL;
  char Extensions_error = objc_msgSend_loadExtensions_error_(v6, a2, (uint64_t)a2, (uint64_t)&v25, a5);
  id v12 = v25;
  if ((Extensions_error & 1) != 0)
  {
    objc_msgSend__syncQueue(*(void **)(a1 + 32), v8, v9, v10, v11);
    uint64_t v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_186A09B8C;
    block[3] = &unk_189F20608;
    uint64_t v14 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v24 = v14;
    dispatch_sync(v13, block);

    objc_msgSend_date(MEMORY[0x189603F50], v15, v16, v17, v18);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBeganUsingAt_(*(void **)(a1 + 32), v20, (uint64_t)v19, v21, v22);

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
}

uint64_t sub_186A09B8C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_setUseCount_(*(void **)(a1 + 32), v9, 1, v10, v11);
}

#error "186A09C48: call analysis failed (funcsize=34)"
void sub_186A09C50(uint64_t a1)
{
  id WeakRetained;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  os_log_s *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  os_log_s *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  dispatch_queue_s *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void v58[4];
  id v59;
  void *v60;
  void v61[5];
  id v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  uint64_t v71;
  uint64_t v71 = *MEMORY[0x1895F89C0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    v61[0] = 0LL;
    v61[1] = v61;
    v61[2] = 0x3032000000LL;
    v61[3] = sub_186A069DC;
    v61[4] = sub_186A069EC;
    objc_msgSend_service(WeakRetained, v2, v3, v4, v5);
    uint64_t v62 = (id)objc_claimAutoreleasedReturnValue();
    pklog_handle_for_category(7);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_uuid(v6, v8, v9, v10, v11);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_multipleInstanceUUID(v6, v27, v28, v29, v30);
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v6, v32, v33, v34, v35);
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_version(v6, v37, v38, v39, v40);
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      uint64_t v64 = v26;
      uint64_t v65 = 2114;
      uint64_t v66 = v31;
      uint64_t v67 = 2112;
      uint64_t v68 = v36;
      uint64_t v69 = 2112;
      uint64_t v70 = v41;
      _os_log_debug_impl( &dword_186A04000,  v7,  OS_LOG_TYPE_DEBUG,  "[u %{public}@:m %{public}@] [%@(%@)] interrupted",  buf,  0x2Au);
    }

    if ((objc_msgSend_terminating(v6, v12, v13, v14, v15) & 1) == 0)
    {
      pklog_handle_for_category(7);
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend_uuid(v6, v21, v22, v23, v24);
        uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_multipleInstanceUUID(v6, v43, v44, v45, v46);
        uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(v6, v48, v49, v50, v51);
        uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_version(v6, v53, v54, v55, v56);
        uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        uint64_t v64 = v42;
        uint64_t v65 = 2114;
        uint64_t v66 = v47;
        uint64_t v67 = 2112;
        uint64_t v68 = v52;
        uint64_t v69 = 2112;
        uint64_t v70 = v57;
        _os_log_error_impl( &dword_186A04000,  v20,  OS_LOG_TYPE_ERROR,  "[u %{public}@:m %{public}@] [%@(%@)] Connection to plugin interrupted while in use.",  buf,  0x2Au);
      }
    }

    objc_msgSend__syncQueue(v6, v16, v17, v18, v19);
    id v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v58[0] = MEMORY[0x1895F87A8];
    v58[1] = 3221225472LL;
    v58[2] = sub_186A09F44;
    v58[3] = &unk_189F20798;
    uint64_t v59 = v6;
    __int16 v60 = v61;
    dispatch_async(v25, v58);

    _Block_object_dispose(v61, 8);
  }
}

void sub_186A09F18( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_186A09F44(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0LL;
}

#error "186A0A068: call analysis failed (funcsize=59)"
uint64_t sub_186A0A080(uint64_t a1)
{
  os_log_s *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t result;
  const char *v37;
  uint64_t v38;
  int v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;
  uint64_t v47 = *MEMORY[0x1895F89C0];
  pklog_handle_for_category(7);
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_uuid(*(void **)(a1 + 32), v3, v4, v5, v6);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_multipleInstanceUUID(*(void **)(a1 + 32), v8, v9, v10, v11);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(*(void **)(a1 + 32), v13, v14, v15, v16);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_version(*(void **)(a1 + 32), v18, v19, v20, v21);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v39 = 138544130;
    uint64_t v40 = v7;
    uint64_t v41 = 2114;
    uint64_t v42 = v12;
    uint64_t v43 = 2112;
    uint64_t v44 = v17;
    uint64_t v45 = 2112;
    uint64_t v46 = v22;
    _os_log_impl( &dword_186A04000,  v2,  OS_LOG_TYPE_DEFAULT,  "[u %{public}@:m %{public}@] [%@(%@)] Emptying requests set",  (uint8_t *)&v39,  0x2Au);
  }

  objc_msgSend_requests(*(void **)(a1 + 32), v23, v24, v25, v26);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v27, v28, v29, v30, v31);

  result = objc_msgSend_state(*(void **)(a1 + 32), v32, v33, v34, v35);
  if (result) {
    return objc_msgSend_unwind_force_(*(void **)(a1 + 32), v37, 2, 0, v38);
  }
  return result;
}

void sub_186A0A1D8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v153 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  pklog_handle_for_category(7);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 64);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( &dword_186A04000,  v8,  OS_SIGNPOST_INTERVAL_END,  v9,  "HostToExtensionPrepareUsing",  (const char *)&unk_186A2C58B,  buf,  2u);
  }

  if (v5)
  {
    pklog_handle_for_category(7);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_uuid(*(void **)(a1 + 32), v14, v15, v16, v17);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_multipleInstanceUUID(*(void **)(a1 + 32), v19, v20, v21, v22);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(*(void **)(a1 + 32), v24, v25, v26, v27);
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_version(*(void **)(a1 + 32), v29, v30, v31, v32);
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      *(void *)&uint8_t buf[4] = v18;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v23;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v147 = (uint64_t)v28;
      __int16 v148 = 2112;
      uint64_t v149 = v33;
      __int16 v150 = 2114;
      *(void *)v151 = v5;
      *(_WORD *)&v151[8] = 2114;
      id v152 = v6;
      uint64_t v34 = "[u %{public}@:m %{public}@] [%@(%@)] Failed to start plugin; prepareUsing returned error: %{public}@, response: %{public}@";
LABEL_15:
      _os_log_error_impl(&dword_186A04000, v13, OS_LOG_TYPE_ERROR, v34, buf, 0x3Eu);

      goto LABEL_16;
    }

    goto LABEL_16;
  }

  uint64_t v35 = *(void **)(a1 + 32);
  objc_msgSend_objectForKeyedSubscript_(v6, v10, (uint64_t)@"sandboxExtensions", v11, v12);
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
  id v145 = 0LL;
  LOBYTE(v35) = objc_msgSend_loadExtensions_error_(v35, v37, (uint64_t)v36, (uint64_t)&v145, v38);
  id v5 = v145;

  if ((v35 & 1) == 0)
  {
    pklog_handle_for_category(7);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_uuid(*(void **)(a1 + 32), v72, v73, v74, v75);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_multipleInstanceUUID(*(void **)(a1 + 32), v76, v77, v78, v79);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(*(void **)(a1 + 32), v80, v81, v82, v83);
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_version(*(void **)(a1 + 32), v84, v85, v86, v87);
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      *(void *)&uint8_t buf[4] = v18;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v23;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v147 = (uint64_t)v28;
      __int16 v148 = 2112;
      uint64_t v149 = v33;
      __int16 v150 = 2114;
      *(void *)v151 = v5;
      *(_WORD *)&v151[8] = 2114;
      id v152 = v6;
      uint64_t v34 = "[u %{public}@:m %{public}@] [%@(%@)] Failed to start plugin; could not consume sandbox file extensions: %{pu"
            "blic}@, response: %{public}@";
      goto LABEL_15;
    }

LABEL_16:
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
    goto LABEL_17;
  }

  objc_msgSend_protocolSpec(*(void **)(a1 + 32), v39, v40, v41, v42);
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
  id v144 = v5;
  sub_186A131B8(v43, &v144);
  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
  id v45 = v144;

  if (v44)
  {
    objc_msgSend_interfaceWithProtocol_(MEMORY[0x189607B48], v46, (uint64_t)v44, v47, v48);
    uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pluginConnection(*(void **)(a1 + 32), v50, v51, v52, v53);
    uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_remoteObjectInterface(v54, v55, v56, v57, v58);
    uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_( v59,  v60,  (uint64_t)v49,  (uint64_t)sel_beginUsingPlugIn_ready_,  1,  1);

    uint64_t v64 = objc_msgSend_augmentInterface_(*(void **)(a1 + 32), v61, (uint64_t)v49, v62, v63);

    pklog_handle_for_category(7);
    uint64_t v65 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v66 = v65;
    if (v64)
    {
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
        sub_186A24A68( a1 + 32,  v64,  (uint64_t)v66,  v67,  v68,  v69,  v70,  v71,  v132,  v134,  v136,  v137,  (uint64_t)v138,  (uint64_t)v139,  v140,  (uint64_t)v141,  (uint64_t)v142,  v143,  (uint64_t)v144,  (uint64_t)v145,  *(uint64_t *)buf,  *(uint64_t *)&buf[8],  *(uint64_t *)&buf[16],  v147);
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
    }

    else
    {
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_uuid(*(void **)(a1 + 32), v89, v90, v91, v92);
        uint64_t v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_multipleInstanceUUID(*(void **)(a1 + 32), v93, v94, v95, v96);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(*(void **)(a1 + 32), v98, v99, v100, v101);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_version(*(void **)(a1 + 32), v103, v104, v105, v106);
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        uid_t v133 = geteuid();
        uid_t v108 = getuid();
        *(_DWORD *)buf = 138544642;
        *(void *)&uint8_t buf[4] = v135;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v97;
        *(_WORD *)&buf[22] = 2112;
        uint64_t v147 = (uint64_t)v102;
        __int16 v148 = 2112;
        uint64_t v149 = v107;
        __int16 v150 = 1024;
        *(_DWORD *)v151 = v133;
        *(_WORD *)&v151[4] = 1024;
        *(_DWORD *)&v151[6] = v108;
        _os_log_impl( &dword_186A04000,  v66,  OS_LOG_TYPE_DEFAULT,  "[u %{public}@:m %{public}@] [%@(%@)] Begin using sent as euid = %d, uid = %d, (persona not available)",  buf,  0x36u);
      }

      pklog_handle_for_category(7);
      uint64_t v109 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v110 = v109;
      os_signpost_id_t v111 = *(void *)(a1 + 64);
      if (v111 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v109))
      {
        objc_msgSend_identifier(*(void **)(a1 + 32), v112, v113, v114, v115);
        uint64_t v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_uuid(*(void **)(a1 + 32), v117, v118, v119, v120);
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138478083;
        *(void *)&uint8_t buf[4] = v116;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v121;
        _os_signpost_emit_with_name_impl( &dword_186A04000,  v110,  OS_SIGNPOST_INTERVAL_BEGIN,  v111,  "HostToExtensionBeginUsing",  " identifier=%{private, signpost.description:attribute}@  uuid=%{public, signpost.description:attribute}@ ",  buf,  0x16u);
      }

      v122 = *(void **)(a1 + 40);
      objc_msgSend_queuedHostPrincipal(*(void **)(a1 + 32), v123, v124, v125, v126);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v136 = MEMORY[0x1895F87A8];
      uint64_t v137 = 3221225472LL;
      uint64_t v138 = sub_186A0A808;
      uint64_t v139 = &unk_189F207E8;
      uint64_t v128 = *(void *)(a1 + 32);
      uint64_t v129 = *(void **)(a1 + 56);
      uint64_t v143 = *(void *)(a1 + 64);
      uint64_t v140 = v128;
      id v142 = v129;
      id v141 = *(id *)(a1 + 48);
      objc_msgSend_beginUsingPlugIn_ready_(v122, v130, (uint64_t)v127, (uint64_t)&v136, v131);
    }

    id v45 = (id)v64;
  }

  else
  {
    pklog_handle_for_category(7);
    v88 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
      sub_186A2496C(a1 + 32, v88);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }

  id v5 = v45;
LABEL_17:
}

void sub_186A0A808(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v88 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  pklog_handle_for_category(7);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 56);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( &dword_186A04000,  v6,  OS_SIGNPOST_INTERVAL_END,  v7,  "HostToExtensionBeginUsing",  (const char *)&unk_186A2C58B,  buf,  2u);
  }

  if (v4)
  {
    objc_msgSend_protocolSpec(*(void **)(a1 + 32), v8, v9, v10, v11);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    int isEqual = objc_msgSend_isEqual_(v12, v13, (uint64_t)@"NSObject", v14, v15);

    if (isEqual)
    {
      uint64_t v21 = objc_msgSend_null(MEMORY[0x189603FE8], v17, v18, v19, v20);

      id v4 = (id)v21;
    }

    objc_msgSend_setUseCount_(*(void **)(a1 + 32), v17, 1, v19, v20);
    objc_msgSend_setPlugInPrincipal_(*(void **)(a1 + 32), v22, (uint64_t)v4, v23, v24);
    objc_msgSend_setEmbeddedPrincipal_(*(void **)(a1 + 32), v25, 0, v26, v27);
    objc_msgSend__syncQueue(*(void **)(a1 + 32), v28, v29, v30, v31);
    uint64_t v32 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v74 = MEMORY[0x1895F87A8];
    uint64_t v75 = 3221225472LL;
    uint64_t v76 = sub_186A0AB20;
    uint64_t v77 = &unk_189F20608;
    uint64_t v33 = *(void **)(a1 + 40);
    uint64_t v78 = *(void *)(a1 + 32);
    id v79 = v33;
    dispatch_sync(v32, &v74);

    objc_msgSend_date(MEMORY[0x189603F50], v34, v35, v36, v37, v74, v75, v76, v77, v78);
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBeganUsingAt_(*(void **)(a1 + 32), v39, (uint64_t)v38, v40, v41);

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    pklog_handle_for_category(7);
    uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_uuid(*(void **)(a1 + 32), v43, v44, v45, v46);
      uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_multipleInstanceUUID(*(void **)(a1 + 32), v48, v49, v50, v51);
      uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(*(void **)(a1 + 32), v53, v54, v55, v56);
      uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_version(*(void **)(a1 + 32), v58, v59, v60, v61);
      uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      uint64_t v81 = v47;
      __int16 v82 = 2114;
      uint64_t v83 = v52;
      __int16 v84 = 2112;
      uint64_t v85 = v57;
      __int16 v86 = 2112;
      uint64_t v87 = v62;
      _os_log_impl( &dword_186A04000,  v42,  OS_LOG_TYPE_INFO,  "[u %{public}@:m %{public}@] [%@(%@)] telling plugin that host has control",  buf,  0x2Au);
    }

    objc_msgSend_service(*(void **)(a1 + 32), v63, v64, v65, v66);
    uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_hostHasControl(v67, v68, v69, v70, v71);
  }

  else
  {
    pklog_handle_for_category(7);
    uint64_t v72 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
      sub_186A24B1C(a1, v72);
    }

    uint64_t v73 = *(void *)(a1 + 48);
    pkError(5LL, @"plug-in failed to initialize");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, uint64_t))(v73 + 16))(v73, v4, 1LL);
  }
}

uint64_t sub_186A0AB20(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_changeState_(*(void **)(a1 + 32), v6, 1, v7, v8);
}

void sub_186A0B074(uint64_t a1, void *a2)
{
  id v10 = a2;
  objc_msgSend_dictionary(MEMORY[0x189603FC8], v3, v4, v5, v6);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10) {
    objc_msgSend_setObject_forKeyedSubscript_(v9, v7, (uint64_t)v10, (uint64_t)@"sandboxExtensions", v8);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_186A0B0F0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_186A0B410()
{
  uint64_t result = sandbox_check();
  byte_18C697318 = (_DWORD)result != 0;
  return result;
}

void sub_186A0B778( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_186A0B790(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v111 = *MEMORY[0x1895F89C0];
  if (!*(void *)(a1 + 32))
  {
LABEL_8:
    objc_msgSend_unwind_force_(*(void **)(a1 + 40), v49, 0, 0, v51);
    return;
  }

  objc_msgSend_requests(*(void **)(a1 + 40), a2, a3, a4, a5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  char v10 = objc_msgSend_containsObject_(v6, v7, *(void *)(a1 + 32), v8, v9);

  pklog_handle_for_category(7);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = v11;
  if ((v10 & 1) != 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_uuid(*(void **)(a1 + 40), v13, v14, v15, v16);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_multipleInstanceUUID(*(void **)(a1 + 40), v18, v19, v20, v21);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(*(void **)(a1 + 40), v23, v24, v25, v26);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_version(*(void **)(a1 + 40), v28, v29, v30, v31);
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v33 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138544386;
      *(void *)&uint8_t buf[4] = v17;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v22;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v109 = (uint64_t)v27;
      *(_WORD *)uint64_t v110 = 2112;
      *(void *)&v110[2] = v32;
      *(_WORD *)&v110[10] = 2112;
      *(void *)&v110[12] = v33;
      _os_log_impl( &dword_186A04000,  v12,  OS_LOG_TYPE_INFO,  "[u %{public}@:m %{public}@] [%@(%@)] ending request: %@",  buf,  0x34u);
    }

    objc_msgSend_requests(*(void **)(a1 + 40), v34, v35, v36, v37);
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObject_(v38, v39, *(void *)(a1 + 32), v40, v41);

    pklog_handle_for_category(7);
    uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
      sub_186A24C80( a1 + 40,  (uint64_t)v42,  v43,  v44,  v45,  v46,  v47,  v48,  v101,  v102,  v103,  v104,  v106,  v107,  *(uint64_t *)buf,  *(uint64_t *)&buf[8],  *(uint64_t *)&buf[16],  v109,  *(uint64_t *)v110,  *(uint64_t *)&v110[8],  *(uint64_t *)&v110[16],  v111,  v112,  v113);
    }

    goto LABEL_8;
  }

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_uuid(*(void **)(a1 + 40), v52, v53, v54, v55);
    uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_multipleInstanceUUID(*(void **)(a1 + 40), v57, v58, v59, v60);
    uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(*(void **)(a1 + 40), v62, v63, v64, v65);
    uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_version(*(void **)(a1 + 40), v67, v68, v69, v70);
    uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v72 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138544386;
    *(void *)&uint8_t buf[4] = v56;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v61;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v109 = (uint64_t)v66;
    *(_WORD *)uint64_t v110 = 2112;
    *(void *)&v110[2] = v71;
    *(_WORD *)&v110[10] = 2112;
    *(void *)&v110[12] = v72;
    _os_log_impl( &dword_186A04000,  v12,  OS_LOG_TYPE_DEFAULT,  "[u %{public}@:m %{public}@] [%@(%@)] ignoring expired end request: [%@]",  buf,  0x34u);
  }

  objc_msgSend_uuid(*(void **)(a1 + 40), v73, v74, v75, v76);
  uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_multipleInstanceUUID(*(void **)(a1 + 40), v78, v79, v80, v81);
  __int16 v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(*(void **)(a1 + 40), v83, v84, v85, v86);
  uint64_t v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_version(*(void **)(a1 + 40), v88, v89, v90, v91);
  uint64_t v105 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v98 = pkErrorf( 15LL,  @"[u %@:m %@] [%@(%@)] endUsingRequest: called with unknown/expired request [%@]",  v92,  v93,  v94,  v95,  v96,  v97,  (uint64_t)v77);
  uint64_t v99 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v100 = *(void **)(v99 + 40);
  *(void *)(v99 + 40) = v98;
}

void sub_186A0BB94( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_186A0BBAC(uint64_t a1, void *a2)
{
}

uint64_t sub_186A0C2E4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  0LL);
}

void sub_186A0C918( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_186A0C92C(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_186A0C938( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t sub_186A0C98C(uint64_t a1)
{
  return *(void *)a1;
}

  ;
}

  ;
}

void sub_186A0CA18(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

  ;
}

void sub_186A0CA68(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

uint64_t sub_186A0CA74()
{
  return *(void *)v0;
}

uint64_t sub_186A0CA80()
{
  return *(void *)v0;
}

  ;
}

  ;
}

uint64_t sub_186A0CAA8()
{
  return *(void *)v0;
}

uint64_t sub_186A0CAB4()
{
  return *(void *)v0;
}

uint64_t sub_186A0CAC0()
{
  return *(void *)v0;
}

void sub_186A0CACC(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

uint64_t sub_186A0CAD8()
{
  return *(void *)v0;
}

  ;
}

void sub_186A0CAFC(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

uint64_t sub_186A0CFF4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_186A0D004(uint64_t a1)
{
}

void sub_186A0D00C(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  v34.receiver = *(id *)(a1 + 32);
  v34.super_class = (Class)&OBJC_CLASS___PKDiscoveryDriver;
  id v6 = objc_msgSendSuper2(&v34, sel_init);
  if (v6)
  {
    objc_msgSend_frameworkQueueAttr(PKCapabilities, v2, v3, v4, v5);
    uint64_t v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v8 = dispatch_queue_create("discovery driver", v7);
    objc_msgSend_setQueue_(v6, v9, (uint64_t)v8, v10, v11);

    dispatch_queue_t v12 = dispatch_queue_create("discovery sync", v7);
    objc_msgSend_setSync_(v6, v13, (uint64_t)v12, v14, v15);

    objc_msgSend_setAttributes_(v6, v16, *(void *)(a1 + 40), v17, v18);
    objc_msgSend_setFlags_(v6, v19, *(void *)(a1 + 80), v20, v21);
    objc_msgSend_setReport_(v6, v22, *(void *)(a1 + 64), v23, v24);
    objc_msgSend_setRelatedActivity_(v6, v25, *(void *)(a1 + 48), v26, v27);
    objc_msgSend_setHost_(v6, v28, *(void *)(a1 + 56), v29, v30);
    pklog_handle_for_category(6);
    uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v36 = v6;
      _os_log_impl( &dword_186A04000,  v31,  OS_LOG_TYPE_DEFAULT,  "<PKDiscoveryDriver:%p> created discovery driver",  buf,  0xCu);
    }
  }

  uint64_t v32 = *(void *)(*(void *)(a1 + 72) + 8LL);
  uint64_t v33 = *(void **)(v32 + 40);
  *(void *)(v32 + 40) = v6;
}

uint64_t sub_186A0D214(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  pklog_handle_for_category(6);
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v9 = 134217984;
    uint64_t v10 = v3;
    _os_log_impl( &dword_186A04000,  v2,  OS_LOG_TYPE_DEFAULT,  "<PKDiscoveryDriver:%p> destroying discovery driver",  (uint8_t *)&v9,  0xCu);
  }

  return objc_msgSend_removeWatchers(*(void **)(a1 + 32), v4, v5, v6, v7);
}

void sub_186A0D35C(uint64_t a1)
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_attributes(*(void **)(a1 + 32), v7, v8, v9, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = objc_msgSend_flags(*(void **)(a1 + 32), v12, v13, v14, v15);
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = sub_186A0D46C;
  v18[3] = &unk_189F20990;
  objc_copyWeak(&v20, &location);
  id v19 = *(id *)(a1 + 40);
  char v21 = *(_BYTE *)(a1 + 48);
  objc_msgSend_discoverPlugInsForAttributes_flags_found_(v6, v17, (uint64_t)v11, v16, (uint64_t)v18);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void sub_186A0D448( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_186A0D46C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  dispatch_queue_t v12 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend_report(WeakRetained, v8, v9, v10, v11);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v14 = v13 != 0LL;
  }

  else
  {
    BOOL v14 = 0;
  }

  if (v14)
  {
    objc_msgSend_queue(v12, v8, v9, v10, v11);
    uint64_t v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_186A0D5A4;
    block[3] = &unk_189F20968;
    objc_copyWeak(&v20, (id *)(a1 + 40));
    id v17 = v5;
    id v18 = v6;
    id v19 = *(id *)(a1 + 32);
    char v21 = *(_BYTE *)(a1 + 48);
    dispatch_async(v15, block);

    objc_destroyWeak(&v20);
  }
}

void sub_186A0D5A4(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend_report(WeakRetained, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    dispatch_queue_t v12 = *(void **)(a1 + 32);
    if (v12)
    {
      if (objc_msgSend_isEqual_(v12, v9, *(void *)(a1 + 48), v10, v11) && !*(_BYTE *)(a1 + 64))
      {
        pklog_handle_for_category(6);
        uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          id v42 = WeakRetained;
          _os_log_impl( &dword_186A04000,  v38,  OS_LOG_TYPE_INFO,  "<PKDiscoveryDriver:%p> no visible outcome changes",  buf,  0xCu);
        }
      }

      else
      {
        objc_msgSend_setLastResults_(WeakRetained, v13, *(void *)(a1 + 32), v14, v15);
        pklog_handle_for_category(6);
        uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v21 = objc_msgSend_count(*(void **)(a1 + 32), v17, v18, v19, v20);
          *(_DWORD *)buf = 134218240;
          id v42 = WeakRetained;
          __int16 v43 = 1024;
          int v44 = v21;
          _os_log_impl( &dword_186A04000,  v16,  OS_LOG_TYPE_DEFAULT,  "<PKDiscoveryDriver:%p> delivering update to host (%u plugins)",  buf,  0x12u);
        }

        objc_msgSend_report(WeakRetained, v22, v23, v24, v25);
        uint64_t v26 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
        v26[2](v26, *(void *)(a1 + 32), 0LL);

        objc_msgSend_sync(WeakRetained, v27, v28, v29, v30);
        uint64_t v31 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 3221225472LL;
        block[2] = sub_186A0D7EC;
        block[3] = &unk_189F207C0;
        objc_copyWeak(&v40, v2);
        dispatch_async(v31, block);

        objc_destroyWeak(&v40);
      }
    }

    else
    {
      pklog_handle_for_category(6);
      uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_186A24F3C((uint64_t)WeakRetained, a1, v32);
      }

      objc_msgSend_report(WeakRetained, v33, v34, v35, v36);
      uint64_t v37 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      v37[2](v37, 0LL, *(void *)(a1 + 40));
    }
  }
}

void sub_186A0D7EC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v10 = WeakRetained;
    int v6 = objc_msgSend_annotationNotifyToken(WeakRetained, (const char *)WeakRetained, v2, v3, v4);
    uint64_t v5 = v10;
    if (!v6)
    {
      objc_msgSend_installWatchers(v10, (const char *)v10, v7, v8, v9);
      uint64_t v5 = v10;
    }
  }
}

void sub_186A0D904(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v74 = *MEMORY[0x1895F89C0];
  if (objc_msgSend_count(*(void **)(a1 + 32), a2, a3, a4, a5)
    && objc_msgSend_count(*(void **)(a1 + 40), v6, v7, v8, v9))
  {
    uint64_t v10 = (void *)MEMORY[0x186E413A8]();
    id v11 = objc_alloc(MEMORY[0x189603FE0]);
    uint64_t v16 = objc_msgSend_count(*(void **)(a1 + 32), v12, v13, v14, v15);
    uint64_t v20 = (void *)objc_msgSend_initWithCapacity_(v11, v17, v16, v18, v19);
    int v21 = *(void **)(a1 + 32);
    uint64_t v22 = MEMORY[0x1895F87A8];
    v68[0] = MEMORY[0x1895F87A8];
    v68[1] = 3221225472LL;
    v68[2] = sub_186A0DB78;
    v68[3] = &unk_189F209E0;
    id v23 = v20;
    id v69 = v23;
    objc_msgSend_enumerateObjectsUsingBlock_(v21, v24, (uint64_t)v68, v25, v26);
    uint64_t v27 = *(void **)(a1 + 40);
    uint64_t v63 = v22;
    uint64_t v64 = 3221225472LL;
    uint64_t v65 = sub_186A0DBBC;
    uint64_t v66 = &unk_189F20A08;
    id v28 = v23;
    id v67 = v28;
    objc_msgSend_objectsPassingTest_(v27, v29, (uint64_t)&v63, v30, v31);
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v37 = objc_msgSend_count(v32, v33, v34, v35, v36, v63, v64, v65, v66);
    if (v37 == objc_msgSend_count(*(void **)(a1 + 40), v38, v39, v40, v41) && !*(_BYTE *)(a1 + 56))
    {
      pklog_handle_for_category(6);
      uint64_t v61 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
      {
        uint64_t v62 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 134217984;
        uint64_t v71 = v62;
        _os_log_impl( &dword_186A04000,  v61,  OS_LOG_TYPE_INFO,  "<PKDiscoveryDriver:%p> no relevant uninstalled plugins",  buf,  0xCu);
      }
    }

    else
    {
      objc_msgSend_queue(*(void **)(a1 + 48), v42, v43, v44, v45);
      uint64_t v46 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      dispatch_assert_queue_V2(v46);

      objc_msgSend_setLastResults_(*(void **)(a1 + 48), v47, (uint64_t)v32, v48, v49);
      pklog_handle_for_category(6);
      uint64_t v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v55 = *(void *)(a1 + 48);
        int v56 = objc_msgSend_count(v32, v51, v52, v53, v54);
        *(_DWORD *)buf = 134218240;
        uint64_t v71 = v55;
        __int16 v72 = 1024;
        int v73 = v56;
        _os_log_impl( &dword_186A04000,  v50,  OS_LOG_TYPE_DEFAULT,  "<PKDiscoveryDriver:%p> delivering update to host (%u plugins)",  buf,  0x12u);
      }

      objc_msgSend_report(*(void **)(a1 + 48), v57, v58, v59, v60);
      uint64_t v61 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(os_log_s *, void *, void))v61 + 2))(v61, v32, 0LL);
    }

    objc_autoreleasePoolPop(v10);
  }

void sub_186A0DB78(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *(void **)(a1 + 32);
  objc_msgSend_pluginUUID(a2, (const char *)a2, a3, a4, a5);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v5, v6, (uint64_t)v9, v7, v8);
}

uint64_t sub_186A0DBBC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  objc_msgSend_effectiveUUID(a2, (const char *)a2, a3, a4, a5);
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v10 = objc_msgSend_containsObject_(*(void **)(a1 + 32), v7, (uint64_t)v6, v8, v9);
  if (v10)
  {
    pklog_handle_for_category(6);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      uint64_t v14 = v6;
      _os_log_impl(&dword_186A04000, v11, OS_LOG_TYPE_DEFAULT, "removing uninstalled plugin %@", (uint8_t *)&v13, 0xCu);
    }
  }

  return v10 ^ 1u;
}

uint64_t sub_186A0DE24(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_removeWatchers(*(void **)(a1 + 32), a2, a3, a4, a5);
}

void sub_186A0DE2C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 40);

    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      pkError(13LL, @"query cancelled");
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0LL, v9);
    }
  }

void sub_186A0E118(_Unwind_Exception *a1)
{
}

void sub_186A0E178(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_report(WeakRetained, v2, v3, v4, v5);
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  pklog_handle_for_category(6);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)MEMORY[0x186E4154C](v6);
    int v16 = 134217984;
    id v17 = v8;
    _os_log_impl( &dword_186A04000,  v7,  OS_LOG_TYPE_DEFAULT,  "Annotations changed, re-performing query for continuous discovery, report block = <%p>.",  (uint8_t *)&v16,  0xCu);
  }

  if (v6)
  {
    objc_msgSend_lastResults(WeakRetained, v9, v10, v11, v12);
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_performWithPreviousResults_forceNotify_(WeakRetained, v14, (uint64_t)v13, 1, v15);
  }
}

void sub_186A0E278(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_report(WeakRetained, v2, v3, v4, v5);
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  pklog_handle_for_category(6);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)MEMORY[0x186E4154C](v6);
    int v16 = 134217984;
    id v17 = v8;
    _os_log_impl( &dword_186A04000,  v7,  OS_LOG_TYPE_DEFAULT,  "ManagedConfiguration effective settings changed, re-performing query for continuous discovery, report block = <%p>.",  (uint8_t *)&v16,  0xCu);
  }

  if (v6)
  {
    objc_msgSend_lastResults(WeakRetained, v9, v10, v11, v12);
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_performWithPreviousResults_forceNotify_(WeakRetained, v14, (uint64_t)v13, 1, v15);
  }
}

void sub_186A0E378(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend_queue(WeakRetained, v5, v6, v7, v8);
    uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = sub_186A0E42C;
    v11[3] = &unk_189F20918;
    id v13 = *(id *)(a1 + 32);
    id v12 = v3;
    dispatch_async(v10, v11);
  }
}

uint64_t sub_186A0E42C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void sub_186A0EA64(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    id v19 = v6;
    uint64_t v11 = objc_msgSend_count(*(void **)(a1 + 40), v7, v8, v9, v10);
    objc_msgSend_lastResults(v19, v12, v13, v14, v15);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11) {
      objc_msgSend__performWithPreviousResults_forceNotify_uninstalledProxies_( v19,  v16,  (uint64_t)v18,  0,  *(void *)(a1 + 40));
    }
    else {
      objc_msgSend_performWithPreviousResults_forceNotify_(v19, v16, (uint64_t)v18, 0, v17);
    }

    uint64_t v6 = v19;
  }
}

void sub_186A0ED50()
{
  uint64_t v0 = objc_alloc_init(&OBJC_CLASS___PKHost);
  v1 = (void *)qword_18C4AE1F8;
  qword_18C4AE1F8 = (uint64_t)v0;
}

void sub_186A0EE2C(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend_daemon(*(void **)(a1 + 32), v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorInReply_(v8, v9, (uint64_t)v3, v10, v11);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    objc_msgSend_daemon(*(void **)(a1 + 32), v13, v14, v15, v16);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_get_value(v3, "matches");
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_convertFromXPC_(v17, v19, (uint64_t)v18, v20, v21);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

    id v23 = objc_alloc(MEMORY[0x189607AB8]);
    objc_msgSend_objectForKeyedSubscript_(v22, v24, (uint64_t)@"uuid", v25, v26);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v31 = (void *)objc_msgSend_initWithUUIDString_(v23, v28, (uint64_t)v27, v29, v30);

    uint64_t v61 = 0LL;
    uint64_t v62 = &v61;
    uint64_t v63 = 0x3032000000LL;
    uint64_t v64 = sub_186A0F0CC;
    uint64_t v65 = sub_186A0F0DC;
    id v66 = 0LL;
    uint64_t v57 = 0LL;
    uint64_t v58 = &v57;
    uint64_t v59 = 0x2020000000LL;
    char v60 = 0;
    objc_msgSend_hostQueue(*(void **)(a1 + 32), v32, v33, v34, v35);
    uint64_t v36 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v37 = MEMORY[0x1895F87A8];
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_186A0F0E4;
    block[3] = &unk_189F20B18;
    uint64_t v38 = *(void *)(a1 + 32);
    uint64_t v55 = &v61;
    void block[4] = v38;
    id v39 = v31;
    id v53 = v39;
    int v56 = &v57;
    id v40 = v22;
    id v54 = v40;
    dispatch_sync(v36, block);

    if (*((_BYTE *)v58 + 24))
    {
      objc_msgSend__syncQueue((void *)v62[5], v41, v42, v43, v44);
      uint64_t v45 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      v48[0] = v37;
      v48[1] = 3221225472LL;
      v48[2] = sub_186A0F1DC;
      v48[3] = &unk_189F20B40;
      uint64_t v51 = &v61;
      id v46 = v40;
      uint64_t v47 = *(void *)(a1 + 32);
      id v49 = v46;
      uint64_t v50 = v47;
      dispatch_sync(v45, v48);
    }

    (*(void (**)(void, uint64_t, void, uint64_t))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  v62[5],  0LL,  v43);

    _Block_object_dispose(&v57, 8);
    _Block_object_dispose(&v61, 8);
  }
}

void sub_186A0F0A8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

uint64_t sub_186A0F0CC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_186A0F0DC(uint64_t a1)
{
}

void sub_186A0F0E4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_objectForKey_(v6, v7, *(void *)(a1 + 40), v8, v9);
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;
  }

  else
  {
    uint64_t v13 = objc_alloc(&OBJC_CLASS___PKHostPlugIn);
    uint64_t v16 = objc_msgSend_initWithForm_host_(v13, v14, *(void *)(a1 + 48), *(void *)(a1 + 32), v15);
    uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8LL);
    uint64_t v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    objc_msgSend_discoveryMap(*(void **)(a1 + 32), v19, v20, v21, v22);
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    id v23 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
    objc_msgSend_uuid(v23, v24, v25, v26, v27);
    id v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v31, v29, (uint64_t)v23, (uint64_t)v28, v30);
  }

uint64_t sub_186A0F1DC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x189616718](*(void *)(*(void *)(a1[6] + 8LL) + 40LL), sel_updateFromForm_host_, a1[4], a1[5], a5);
}

void sub_186A0F300( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_186A0F324(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    uint64_t v8 = v5;
  }

  else
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    uint64_t v8 = v11;
  }

  id v9 = v8;
  uint64_t v10 = *v7;
  *uint64_t v7 = v9;
}

void sub_186A0F440(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend_daemon(*(void **)(a1 + 32), v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorInReply_(v8, v9, (uint64_t)v3, v10, v11);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    objc_msgSend_daemon(*(void **)(a1 + 32), v13, v14, v15, v16);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_get_value(v3, "matches");
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_convertFromXPC_(v17, v19, (uint64_t)v18, v20, v21);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

    id v23 = objc_alloc(MEMORY[0x189607AB8]);
    objc_msgSend_objectForKeyedSubscript_(v22, v24, (uint64_t)@"uuid", v25, v26);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    id v31 = (void *)objc_msgSend_initWithUUIDString_(v23, v28, (uint64_t)v27, v29, v30);

    uint64_t v61 = 0LL;
    uint64_t v62 = &v61;
    uint64_t v63 = 0x3032000000LL;
    uint64_t v64 = sub_186A0F0CC;
    uint64_t v65 = sub_186A0F0DC;
    id v66 = 0LL;
    uint64_t v57 = 0LL;
    uint64_t v58 = &v57;
    uint64_t v59 = 0x2020000000LL;
    char v60 = 0;
    objc_msgSend_hostQueue(*(void **)(a1 + 32), v32, v33, v34, v35);
    uint64_t v36 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v37 = MEMORY[0x1895F87A8];
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = sub_186A0F6E0;
    block[3] = &unk_189F20B18;
    uint64_t v38 = *(void *)(a1 + 32);
    uint64_t v55 = &v61;
    void block[4] = v38;
    id v39 = v31;
    id v53 = v39;
    int v56 = &v57;
    id v40 = v22;
    id v54 = v40;
    dispatch_sync(v36, block);

    if (*((_BYTE *)v58 + 24))
    {
      objc_msgSend__syncQueue((void *)v62[5], v41, v42, v43, v44);
      uint64_t v45 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      v48[0] = v37;
      v48[1] = 3221225472LL;
      v48[2] = sub_186A0F7D8;
      v48[3] = &unk_189F20B40;
      uint64_t v51 = &v61;
      id v46 = v40;
      uint64_t v47 = *(void *)(a1 + 32);
      id v49 = v46;
      uint64_t v50 = v47;
      dispatch_sync(v45, v48);
    }

    (*(void (**)(void, uint64_t, void, uint64_t))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  v62[5],  0LL,  v43);

    _Block_object_dispose(&v57, 8);
    _Block_object_dispose(&v61, 8);
  }
}

void sub_186A0F6BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

void sub_186A0F6E0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_objectForKey_(v6, v7, *(void *)(a1 + 40), v8, v9);
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;
  }

  else
  {
    uint64_t v13 = objc_alloc(&OBJC_CLASS___PKHostPlugIn);
    uint64_t v16 = objc_msgSend_initWithForm_host_(v13, v14, *(void *)(a1 + 48), *(void *)(a1 + 32), v15);
    uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8LL);
    uint64_t v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    objc_msgSend_discoveryMap(*(void **)(a1 + 32), v19, v20, v21, v22);
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    id v23 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
    objc_msgSend_uuid(v23, v24, v25, v26, v27);
    id v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v31, v29, (uint64_t)v23, (uint64_t)v28, v30);
  }

uint64_t sub_186A0F7D8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x189616718](*(void *)(*(void *)(a1[6] + 8LL) + 40LL), sel_updateFromForm_host_, a1[4], a1[5], a5);
}

void sub_186A0F8F0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v56 = *MEMORY[0x1895F89C0];
  objc_msgSend_rewriteDiscoveryAttributes_flags_( *(void **)(a1 + 40),  a2,  *(void *)(a1 + 32),  *(void *)(a1 + 64),  a5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v6, v7, (uint64_t)@"NSExtensionPointName", v8, v9);
  uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      uint64_t v10 = @"multiple";
    }
  }

  int v11 = PKGetThreadPriority();
  unsigned int v12 = *(_DWORD *)(a1 + 64);
  v48[0] = 0LL;
  v48[1] = v48;
  v48[2] = 0x2020000000LL;
  v48[3] = 0LL;
  pklog_handle_for_category(6);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v13, *(const void **)(a1 + 48));

  pklog_handle_for_category(6);
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    uint64_t v17 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138478595;
    uint64_t v50 = v10;
    __int16 v51 = 2114;
    uint64_t v52 = v17;
    __int16 v53 = 1026;
    *(_DWORD *)id v54 = (v12 >> 10) & 1;
    *(_WORD *)&v54[4] = 1026;
    *(_DWORD *)&v54[6] = v11;
    _os_signpost_emit_with_name_impl( &dword_186A04000,  v16,  OS_SIGNPOST_INTERVAL_BEGIN,  v14,  "HostDiscovery",  " identifier=%{private, signpost.description:attribute}@  discoveryUUID=%{public, signpost.description:attribute}@ sync=%{public, signpost.description:attribute}d  priority=%{public, signpost.description:attribute}d ",  buf,  0x22u);
  }

  uint64_t v18 = MEMORY[0x1895F87A8];
  v44[0] = MEMORY[0x1895F87A8];
  v44[1] = 3221225472LL;
  v44[2] = sub_186A0FD74;
  v44[3] = &unk_189F20BB8;
  id v46 = v48;
  os_signpost_id_t v47 = v14;
  id v45 = *(id *)(a1 + 56);
  id v19 = (void (**)(void, void, void))MEMORY[0x186E4154C](v44);
  pklog_handle_for_category(6);
  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = *(void *)(a1 + 40);
    uint64_t v21 = *(__CFString **)(a1 + 48);
    uint64_t v23 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 138413058;
    uint64_t v50 = v21;
    __int16 v51 = 2048;
    uint64_t v52 = v22;
    __int16 v53 = 2048;
    *(void *)id v54 = v23;
    *(_WORD *)&v54[8] = 2114;
    uint64_t v55 = v10;
    _os_log_impl( &dword_186A04000,  v20,  OS_LOG_TYPE_DEFAULT,  "[d %@] <PKHost:%p> Beginning discovery for flags: %lu, point: %{public}@",  buf,  0x2Au);
  }

  pklog_handle_for_category(6);
  uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    uint64_t v26 = *(void *)(a1 + 40);
    uint64_t v25 = *(__CFString **)(a1 + 48);
    uint64_t v27 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    uint64_t v50 = v25;
    __int16 v51 = 2048;
    uint64_t v52 = v26;
    __int16 v53 = 2114;
    *(void *)id v54 = v27;
    _os_log_impl(&dword_186A04000, v24, OS_LOG_TYPE_INFO, "[d %@] <PKHost:%p> Query: %{public}@", buf, 0x20u);
  }

  if ((*(void *)(a1 + 64) & 0x100) != 0)
  {
    pklog_handle_for_category(6);
    uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_186A2501C();
    }

    pkError(3LL, @"cannot request embedded plug-ins without using the UsesEmbeddedCode key");
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void, void *))v19)[2](v19, 0LL, v35);
  }

  else if ((~*(_WORD *)(a1 + 64) & 0x480) != 0)
  {
    objc_msgSend_daemon(*(void **)(a1 + 40), v28, v29, v30, v31);
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v37 = *(void *)(a1 + 64);
    v40[0] = v18;
    v40[1] = 3221225472LL;
    v40[2] = sub_186A0FE84;
    v40[3] = &unk_189F20BE0;
    uint64_t v38 = *(void **)(a1 + 48);
    v40[4] = *(void *)(a1 + 40);
    id v41 = v38;
    uint64_t v42 = v19;
    uint64_t v43 = v48;
    objc_msgSend_matchPlugIns_flags_uuid_reply_(v36, v39, (uint64_t)v6, v37, (uint64_t)v41, v40);
  }

  else
  {
    pklog_handle_for_category(6);
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_186A24FC4();
    }

    pkError(18LL, @"PKDiscoverContinuous and PKDiscoverSynchronous incompatible");
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void, void *))v19)[2](v19, 0LL, v33);
  }

  _Block_object_dispose(v48, 8);
}

void sub_186A0FD40( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

void sub_186A0FD74(void *a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  pklog_handle_for_category(6);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = v7;
  os_signpost_id_t v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    uint64_t v10 = *(void *)(*(void *)(a1[5] + 8LL) + 24LL);
    int v12 = 134349056;
    uint64_t v13 = v10;
    _os_signpost_emit_with_name_impl( &dword_186A04000,  v8,  OS_SIGNPOST_INTERVAL_END,  v9,  "HostDiscovery",  " count=%{public, signpost.description:attribute}lu ",  (uint8_t *)&v12,  0xCu);
  }

  uint64_t v11 = a1[4];
  if (v11) {
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v5, v6);
  }
}

void sub_186A0FE84(uint64_t a1, void *a2)
{
  uint64_t v136 = *MEMORY[0x1895F89C0];
  xpc_object_t xdict = a2;
  uint64_t v106 = a1;
  objc_msgSend_daemon(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorInReply_(v7, v8, (uint64_t)xdict, v9, v10);
  uint64_t v100 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();

  if (v100)
  {
    pklog_handle_for_category(6);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v98 = *(void *)(a1 + 32);
      uint64_t v97 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v97;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v98;
      *(_WORD *)&buf[22] = 2112;
      uint8_t v132 = v100;
      _os_log_error_impl( &dword_186A04000,  v15,  OS_LOG_TYPE_ERROR,  "[d %@] <PKHost:%p> Failed discovery: %@.",  buf,  0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  else
  {
    objc_msgSend_daemon(*(void **)(a1 + 32), v11, v12, v13, v14);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_get_value(xdict, "matches");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_convertFromXPC_(v16, v18, (uint64_t)v17, v19, v20);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_set(MEMORY[0x189603FE0], v22, v23, v24, v25);
    id v104 = (id)objc_claimAutoreleasedReturnValue();
    __int128 v127 = 0u;
    __int128 v128 = 0u;
    __int128 v125 = 0u;
    __int128 v126 = 0u;
    id obj = v21;
    unint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v26, (uint64_t)&v125, (uint64_t)v135, 16);
    if (v27)
    {
      uint64_t v28 = *(void *)v126;
      do
      {
        uint64_t v29 = 0LL;
        if (v27 <= 1) {
          uint64_t v30 = 1LL;
        }
        else {
          uint64_t v30 = v27;
        }
        do
        {
          if (*(void *)v126 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v31 = *(void **)(*((void *)&v125 + 1) + 8 * v29);
          id v32 = objc_alloc(MEMORY[0x189607AB8]);
          objc_msgSend_objectForKeyedSubscript_(v31, v33, (uint64_t)@"uuid", v34, v35);
          uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
          id v40 = (void *)objc_msgSend_initWithUUIDString_(v32, v37, (uint64_t)v36, v38, v39);

          *(void *)buf = 0LL;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000LL;
          uint8_t v132 = sub_186A0F0CC;
          uid_t v133 = sub_186A0F0DC;
          id v134 = 0LL;
          uint64_t v121 = 0LL;
          v122 = &v121;
          uint64_t v123 = 0x2020000000LL;
          char v124 = 0;
          objc_msgSend_hostQueue(*(void **)(v106 + 32), v41, v42, v43, v44);
          id v45 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1895F87A8];
          block[1] = 3221225472LL;
          block[2] = sub_186A104D4;
          block[3] = &unk_189F20B18;
          uint64_t v46 = *(void *)(v106 + 32);
          uint64_t v119 = buf;
          void block[4] = v46;
          id v47 = v40;
          uint64_t v120 = &v121;
          id v117 = v47;
          uint64_t v118 = v31;
          dispatch_sync(v45, block);

          if (*((_BYTE *)v122 + 24))
          {
            objc_msgSend__syncQueue(*(void **)(*(void *)&buf[8] + 40), v48, v49, v50, v51);
            uint64_t v52 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
            v115[0] = MEMORY[0x1895F87A8];
            v115[1] = 3221225472LL;
            v115[2] = sub_186A105CC;
            v115[3] = &unk_189F20B40;
            uint64_t v53 = *(void *)(v106 + 32);
            v115[4] = v31;
            v115[5] = v53;
            v115[6] = buf;
            dispatch_sync(v52, v115);
          }

          objc_msgSend_addObject_(v104, v48, *(void *)(*(void *)&buf[8] + 40), v50, v51);

          _Block_object_dispose(&v121, 8);
          _Block_object_dispose(buf, 8);

          ++v29;
        }

        while (v30 != v29);
        unint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v54, (uint64_t)&v125, (uint64_t)v135, 16);
      }

      while (v27);
    }

    __int128 v113 = 0u;
    __int128 v114 = 0u;
    __int128 v111 = 0u;
    __int128 v112 = 0u;
    id v105 = v104;
    unint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(v105, v55, (uint64_t)&v111, (uint64_t)v130, 16);
    if (v56)
    {
      uint64_t v101 = *(void *)v112;
      do
      {
        uint64_t v61 = 0LL;
        if (v56 <= 1) {
          uint64_t v62 = 1LL;
        }
        else {
          uint64_t v62 = v56;
        }
        uint64_t v102 = v62;
        do
        {
          if (*(void *)v112 != v101) {
            objc_enumerationMutation(v105);
          }
          uint64_t v63 = *(void **)(*((void *)&v111 + 1) + 8 * v61);
          objc_msgSend_supersedingUUID(v63, v57, v58, v59, v60);
          uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue();

          if (v64)
          {
            __int128 v109 = 0u;
            __int128 v110 = 0u;
            __int128 v107 = 0u;
            __int128 v108 = 0u;
            id v68 = v105;
            unint64_t v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v68, v69, (uint64_t)&v107, (uint64_t)v129, 16);
            if (v70)
            {
              uint64_t v75 = *(void *)v108;
              do
              {
                uint64_t v76 = 0LL;
                if (v70 <= 1) {
                  uint64_t v77 = 1LL;
                }
                else {
                  uint64_t v77 = v70;
                }
                do
                {
                  if (*(void *)v108 != v75) {
                    objc_enumerationMutation(v68);
                  }
                  uint64_t v78 = *(void **)(*((void *)&v107 + 1) + 8 * v76);
                  objc_msgSend_uuid(v78, v71, v72, v73, v74);
                  uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_supersedingUUID(v63, v80, v81, v82, v83);
                  uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue();
                  int isEqual = objc_msgSend_isEqual_(v79, v85, (uint64_t)v84, v86, v87);

                  if (isEqual) {
                    objc_msgSend_setSupersededBy_(v63, v71, (uint64_t)v78, v73, v74);
                  }
                  ++v76;
                }

                while (v77 != v76);
                unint64_t v70 = objc_msgSend_countByEnumeratingWithState_objects_count_( v68,  v71,  (uint64_t)&v107,  (uint64_t)v129,  16);
              }

              while (v70);
            }
          }

          else
          {
            objc_msgSend_setSupersededBy_(v63, v65, 0, v66, v67);
          }

          ++v61;
        }

        while (v61 != v102);
        unint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(v105, v57, (uint64_t)&v111, (uint64_t)v130, 16);
      }

      while (v56);
    }

    *(void *)(*(void *)(*(void *)(v106 + 56) + 8) + 24) = objc_msgSend_count(obj, v89, v90, v91, v92);
    pklog_handle_for_category(6);
    uint64_t v93 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v95 = *(void *)(v106 + 32);
      uint64_t v94 = *(void *)(v106 + 40);
      uint64_t v96 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v106 + 56) + 8LL) + 24LL);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v94;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v95;
      *(_WORD *)&buf[22] = 2048;
      uint8_t v132 = v96;
      _os_log_impl( &dword_186A04000,  v93,  OS_LOG_TYPE_DEFAULT,  "[d %@] <PKHost:%p> Completed discovery. Final # of matches: %lu",  buf,  0x20u);
    }

    (*(void (**)(void))(*(void *)(v106 + 48) + 16LL))();
  }
}

void sub_186A104AC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, char a49)
{
}

void sub_186A104D4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_objectForKey_(v6, v7, *(void *)(a1 + 40), v8, v9);
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8LL);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;
  }

  else
  {
    uint64_t v13 = objc_alloc(&OBJC_CLASS___PKHostPlugIn);
    uint64_t v16 = objc_msgSend_initWithForm_host_(v13, v14, *(void *)(a1 + 48), *(void *)(a1 + 32), v15);
    uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8LL);
    uint64_t v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    objc_msgSend_discoveryMap(*(void **)(a1 + 32), v19, v20, v21, v22);
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
    objc_msgSend_uuid(v23, v24, v25, v26, v27);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v31, v29, (uint64_t)v23, (uint64_t)v28, v30);
  }

uint64_t sub_186A105CC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x189616718](*(void *)(*(void *)(a1[6] + 8LL) + 40LL), sel_updateFromForm_host_, a1[4], a1[5], a5);
}

void sub_186A109A4(uint64_t a1, xpc_object_t xdict)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    id v3 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

void sub_186A10B38(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  xpc_dictionary_get_array(xdict, "pidarray");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = xpc_dictionary_get_array(xdict, "uuids");
  uint64_t v9 = (void *)v4;
  if (v3)
  {
    uint64_t v10 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    if (v9) {
      goto LABEL_3;
    }
LABEL_8:
    uint64_t v11 = 0LL;
    goto LABEL_9;
  }

  uint64_t v10 = 0LL;
  if (!v4) {
    goto LABEL_8;
  }
LABEL_3:
  uint64_t v11 = (void *)objc_opt_new();
  if (xpc_array_get_count(v9))
  {
    size_t v12 = 0LL;
    do
    {
      id v13 = objc_alloc(MEMORY[0x189607AB8]);
      uuid = xpc_array_get_uuid(v9, v12);
      uint64_t v18 = (void *)objc_msgSend_initWithUUIDBytes_(v13, v15, (uint64_t)uuid, v16, v17);
      objc_msgSend_addObject_(v11, v19, (uint64_t)v18, v20, v21);

      ++v12;
    }

    while (v12 < xpc_array_get_count(v9));
  }

LABEL_9:
  uint64_t v22 = *(void *)(a1 + 40);
  objc_msgSend_daemon(*(void **)(a1 + 32), v5, v6, v7, v8);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorInReply_(v23, v24, (uint64_t)xdict, v25, v26);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *, void *))(v22 + 16))(v22, v27, v10, v11);
}

void sub_186A110B0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_186A110C8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v6, v7, *(void *)(a1 + 40), v8, v9);
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8LL);
  size_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  uint64_t v17 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  if (v17)
  {
    if (objc_msgSend_state(v17, v13, v14, v15, v16) != 1)
    {
      uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8LL);
      uint64_t v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = 0LL;
    }
  }

void sub_186A11240( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_186A11258(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v147 = *MEMORY[0x1895F89C0];
  objc_msgSend_discoveryMap(*(void **)(a1 + 32), a2, a3, a4, a5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uuid(*(void **)(a1 + 40), v7, v8, v9, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v6, v12, (uint64_t)v11, v13, v14);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_multipleInstanceUUID(*(void **)(a1 + 40), v16, v17, v18, v19);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20) {
    goto LABEL_2;
  }
  uint64_t v25 = *(void **)(a1 + 40);

  if (v15 != v25)
  {
    objc_msgSend_currentHandler(MEMORY[0x1896077D8], v21, v22, v23, v24);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_( v20,  v138,  *(void *)(a1 + 56),  *(void *)(a1 + 32),  (uint64_t)@"PKHost.m",  408,  @"plugin %@ activating but discovery map contains %@",  *(void *)(a1 + 40),  v15);
LABEL_2:
  }

  objc_msgSend_activePlugIns(*(void **)(a1 + 32), v21, v22, v23, v24);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(*(void **)(a1 + 40), v27, v28, v29, v30);
  id v31 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v35 = objc_msgSend_objectForKeyedSubscript_(v26, v32, (uint64_t)v31, v33, v34);
  uint64_t v36 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v37 = *(void **)(v36 + 40);
  *(void *)(v36 + 40) = v35;

  uint64_t v42 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  if (v42)
  {
    if (objc_msgSend_state(v42, v38, v39, v40, v41)) {
      goto LABEL_16;
    }
    pklog_handle_for_category(7);
    uint64_t v43 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_ERROR)) {
      sub_186A25074(a1 + 48, v43, v44, v45, v46);
    }

    objc_msgSend_activePlugIns(*(void **)(a1 + 32), v47, v48, v49, v50);
    uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(*(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v52, v53, v54, v55);
    unint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObjectForKey_(v51, v57, (uint64_t)v56, v58, v59);

    uint64_t v60 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v61 = *(void **)(v60 + 40);
    *(void *)(v60 + 40) = 0LL;
  }

  pklog_handle_for_category(7);
  uint64_t v62 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_uuid(*(void **)(a1 + 40), v63, v64, v65, v66);
    uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_multipleInstanceUUID(*(void **)(a1 + 40), v68, v69, v70, v71);
    uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(*(void **)(a1 + 40), v73, v74, v75, v76);
    uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_version(*(void **)(a1 + 40), v78, v79, v80, v81);
    uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    uint64_t v140 = v67;
    __int16 v141 = 2114;
    id v142 = v72;
    __int16 v143 = 2112;
    id v144 = v77;
    __int16 v145 = 2112;
    uint64_t v146 = v82;
    _os_log_impl( &dword_186A04000,  v62,  OS_LOG_TYPE_INFO,  "[u %{public}@:m %{public}@] [%@(%@)] activating plugin",  buf,  0x2Au);
  }

  objc_msgSend_multipleInstanceUUID(*(void **)(a1 + 40), v83, v84, v85, v86);
  uint64_t v87 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v87)
  {
    uint64_t v92 = *(void *)(a1 + 40);
    objc_msgSend_activePlugIns(*(void **)(a1 + 32), v88, v89, v90, v91);
    uint64_t v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(*(void **)(a1 + 40), v94, v95, v96, v97);
    uint64_t v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v93, v99, v92, (uint64_t)v98, v100);
  }

  objc_msgSend_activeOneShots(*(void **)(a1 + 32), v88, v89, v90, v91);
  uint64_t v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_effectiveUUID(*(void **)(a1 + 40), v102, v103, v104, v105);
  uint64_t v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v101, v107, (uint64_t)v106, v108, v109);
  __int128 v110 = (void *)objc_claimAutoreleasedReturnValue();

  if (v110)
  {
    objc_msgSend_currentHandler(MEMORY[0x1896077D8], v111, v112, v113, v114);
    char v124 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v125 = *(void *)(a1 + 56);
    uint64_t v126 = *(void *)(a1 + 32);
    objc_msgSend_effectiveUUID(*(void **)(a1 + 40), v127, v128, v129, v130);
    uint64_t v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v131, v132, v133, v134, v135);
    uint64_t v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_( v124,  v137,  v125,  v126,  (uint64_t)@"PKHost.m",  423,  @"superseding active UUID: %@",  v136);
  }

  uint64_t v115 = *(void *)(a1 + 40);
  objc_msgSend_activeOneShots(*(void **)(a1 + 32), v111, v112, v113, v114);
  uint64_t v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_effectiveUUID(*(void **)(a1 + 40), v117, v118, v119, v120);
  uint64_t v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v116, v122, v115, (uint64_t)v121, v123);

LABEL_16:
}

void sub_186A116E0(uint64_t a1)
{
  uint64_t v112 = *MEMORY[0x1895F89C0];
  pklog_handle_for_category(7);
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_uuid(*(void **)(a1 + 32), v3, v4, v5, v6);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_multipleInstanceUUID(*(void **)(a1 + 32), v8, v9, v10, v11);
    size_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(*(void **)(a1 + 32), v13, v14, v15, v16);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_version(*(void **)(a1 + 32), v18, v19, v20, v21);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    uint64_t v105 = v7;
    __int16 v106 = 2114;
    __int128 v107 = v12;
    __int16 v108 = 2112;
    uint64_t v109 = v17;
    __int16 v110 = 2112;
    __int128 v111 = v22;
    _os_log_impl( &dword_186A04000,  v2,  OS_LOG_TYPE_INFO,  "[u %{public}@:m %{public}@] [%@(%@)] deactivating plugin",  buf,  0x2Au);
  }

  objc_msgSend_multipleInstanceUUID(*(void **)(a1 + 32), v23, v24, v25, v26);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27)
  {
    objc_msgSend_activePlugIns(*(void **)(a1 + 40), v28, v29, v30, v31);
    id v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(*(void **)(a1 + 32), v33, v34, v35, v36);
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v32, v38, (uint64_t)v37, v39, v40);
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      objc_msgSend_identifier(v41, v42, v43, v44, v45);
      uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(*(void **)(a1 + 32), v47, v48, v49, v50);
      uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
      int v55 = objc_msgSend_isEqualToString_(v46, v52, (uint64_t)v51, v53, v54) ^ 1;
    }

    else
    {
      int v55 = 0;
    }

    if (v55)
    {
      objc_msgSend_currentHandler(MEMORY[0x1896077D8], v42, v43, v44, v45);
      unint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_( v56,  v57,  *(void *)(a1 + 48),  *(void *)(a1 + 40),  (uint64_t)@"PKHost.m",  435,  @"deactivating plugin %@ but encountered %@",  *(void *)(a1 + 32),  v41);
    }

    objc_msgSend_activePlugIns(*(void **)(a1 + 40), v42, v43, v44, v45);
    uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(*(void **)(a1 + 32), v59, v60, v61, v62);
    uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObjectForKey_(v58, v64, (uint64_t)v63, v65, v66);
  }

  objc_msgSend_activeOneShots(*(void **)(a1 + 40), v28, v29, v30, v31);
  uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_effectiveUUID(*(void **)(a1 + 32), v68, v69, v70, v71);
  uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v67, v73, (uint64_t)v72, v74, v75);
  uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v76)
  {
    objc_msgSend_currentHandler(MEMORY[0x1896077D8], v77, v78, v79, v80);
    uint64_t v90 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v92 = *(void *)(a1 + 40);
    uint64_t v91 = *(void *)(a1 + 48);
    objc_msgSend_effectiveUUID(*(void **)(a1 + 32), v93, v94, v95, v96);
    uint64_t v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v97, v98, v99, v100, v101);
    uint64_t v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_( v90,  v103,  v91,  v92,  (uint64_t)@"PKHost.m",  438,  @"deactivating inactive UUID: %@",  v102);
  }

  objc_msgSend_activeOneShots(*(void **)(a1 + 40), v77, v78, v79, v80);
  uint64_t v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_effectiveUUID(*(void **)(a1 + 32), v82, v83, v84, v85);
  uint64_t v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectForKey_(v81, v87, (uint64_t)v86, v88, v89);
}

void sub_186A11A78(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_infoDictionary(v13, v6, v7, v8, v9);
  uint64_t v11 = *(void *)(a1 + 32);
  size_t v12 = *(void **)(v11 + 8);
  *(void *)(v11 + _Block_object_dispose(va, 8) = v10;
}

void sub_186A11BA8(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

uint64_t sub_186A11BD4()
{
  return *(void *)(*(void *)(*(void *)v0 + 8LL) + 40LL);
}

void sub_186A11BE4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void sub_186A11BF8(void *a1, uint64_t a2, void *a3, unsigned int a4, void *a5, void *a6)
{
  uint64_t v81 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a5;
  id v69 = a6;
  objc_msgSend_dictionary(MEMORY[0x189603FC8], v10, v11, v12, v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v67 = v8;
  objc_msgSend_setObject_forKeyedSubscript_(v14, v15, (uint64_t)v8, MEMORY[0x189604A58], v16);
  for (uint64_t i = objc_msgSend_count(v14, v17, v18, v19, v20); i; uint64_t i = objc_msgSend_count(v40, v22, v23, v24, v25))
  {
    context = (void *)MEMORY[0x186E413A8]();
    objc_msgSend_allKeys(v14, v26, v27, v28, v29);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v30, v31, v32, v33, v34);
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_objectForKeyedSubscript_(v14, v36, (uint64_t)v35, v37, v38);
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v40 = v14;
    objc_msgSend_removeObjectForKey_(v14, v41, (uint64_t)v35, v42, v43);
    objc_msgSend__mutableDictionaryAtKeyPath_(a1, v44, (uint64_t)v35, v45, v46);
    id v47 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v76 = 0u;
    __int128 v77 = 0u;
    __int128 v78 = 0u;
    __int128 v79 = 0u;
    objc_msgSend_allKeys(v39, v48, v49, v50, v51);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    unint64_t v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v52, (uint64_t)&v76, (uint64_t)v80, 16);
    if (v53)
    {
      uint64_t v57 = *(void *)v77;
      do
      {
        uint64_t v58 = 0LL;
        if (v53 <= 1) {
          uint64_t v59 = 1LL;
        }
        else {
          uint64_t v59 = v53;
        }
        do
        {
          if (*(void *)v77 != v57) {
            objc_enumerationMutation(obj);
          }
          uint64_t v61 = *(void *)(*((void *)&v76 + 1) + 8 * v58);
          objc_msgSend_arrayByAddingObject_(v35, v54, v61, v55, v56);
          uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9 && objc_msgSend_containsObject_(v9, v62, (uint64_t)v65, v63, v64))
          {
            objc_msgSend__overlayCustomValueAtKeyPath_intoTargetDictionary_fromSourceDictionary_handler_( a1,  v66,  (uint64_t)v65,  (uint64_t)v47,  (uint64_t)v39,  v69);
          }

          else
          {
            v73[0] = MEMORY[0x1895F87A8];
            v73[1] = 3221225472LL;
            v73[2] = sub_186A11E98;
            v73[3] = &unk_189F20D30;
            id v74 = v40;
            id v75 = v65;
            objc_msgSend__overlayValueAtKey_intoTargetDictionary_fromSourceDictionary_targetTakePrecedent_nestedDictionaryHandler_( a1,  v60,  v61,  (uint64_t)v47,  (uint64_t)v39,  a4,  v73);
          }

          ++v58;
        }

        while (v59 != v58);
        unint64_t v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v54, (uint64_t)&v76, (uint64_t)v80, 16);
      }

      while (v53);
    }

    objc_autoreleasePoolPop(context);
    uint64_t v14 = v40;
  }
}

uint64_t sub_186A11E98(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 32), a2, (uint64_t)a2, *(void *)(a1 + 40), a5);
}

void sub_186A11EA8(void *a1, uint64_t a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  unint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v31, (uint64_t)v35, 16);
  if (v6)
  {
    uint64_t v11 = *(void *)v32;
    do
    {
      uint64_t v12 = 0LL;
      if (v6 <= 1) {
        uint64_t v13 = 1LL;
      }
      else {
        uint64_t v13 = v6;
      }
      do
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v4);
        }
        uint64_t v14 = (void *)objc_msgSend_mutableCopy(*(void **)(*((void *)&v31 + 1) + 8 * v12), v7, v8, v9, v10);
        objc_msgSend_lastObject(v14, v15, v16, v17, v18);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removeLastObject(v14, v20, v21, v22, v23);
        objc_msgSend__mutableDictionaryAtKeyPath_(a1, v24, (uint64_t)v14, v25, v26);
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removeObjectForKey_(v27, v28, (uint64_t)v19, v29, v30);

        ++v12;
      }

      while (v13 != v12);
      unint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v31, (uint64_t)v35, 16);
    }

    while (v6);
  }
}

void sub_186A11FEC(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, int a6, void *a7)
{
  id v22 = a3;
  id v11 = a4;
  uint64_t v12 = a7;
  objc_msgSend_objectForKeyedSubscript_(a5, v13, (uint64_t)v22, v14, v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12[2](v12, v16);
  }

  else
  {
    if (a6)
    {
      objc_msgSend_objectForKeyedSubscript_(v11, v17, (uint64_t)v22, v18, v19);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v21 = v20 == 0LL;
    }

    else
    {
      BOOL v21 = 1;
    }

    if (v21) {
      objc_msgSend_setObject_forKeyedSubscript_(v11, v17, (uint64_t)v16, (uint64_t)v22, v19);
    }
  }
}

void sub_186A120DC(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  id v30 = a3;
  id v9 = a4;
  uint64_t v10 = a6;
  id v11 = a5;
  objc_msgSend_lastObject(v30, v12, v13, v14, v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v17, (uint64_t)v16, v18, v19);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v11, v21, (uint64_t)v16, v22, v23);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    uint64_t v28 = 0LL;
    uint64_t v29 = v9;
    goto LABEL_5;
  }

  v10[2](v10, v30, v20, v24);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v29 = v9;
  if (!v28)
  {
LABEL_5:
    objc_msgSend_removeObjectForKey_(v29, v25, (uint64_t)v16, v26, v27);
    goto LABEL_6;
  }

  objc_msgSend_setObject_forKeyedSubscript_(v9, v25, (uint64_t)v28, (uint64_t)v16, v27);
LABEL_6:
}

id sub_186A121E0(void *a1, uint64_t a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = a1;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  unint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v24, (uint64_t)v28, 16);
  if (v7)
  {
    uint64_t v11 = *(void *)v25;
    uint64_t v12 = v5;
    do
    {
      uint64_t v13 = 0LL;
      if (v7 <= 1) {
        uint64_t v14 = 1LL;
      }
      else {
        uint64_t v14 = v7;
      }
      uint64_t v15 = v12;
      do
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v4);
        }
        uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * v13);
        objc_msgSend_objectForKeyedSubscript_(v15, v8, v16, v9, v10);
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__createOrConvertToMutableDictionaryFromDictionary_(v5, v18, (uint64_t)v17, v19, v20);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v15, v21, (uint64_t)v12, v16, v22);

        ++v13;
        uint64_t v15 = v12;
      }

      while (v14 != v13);
      unint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v8, (uint64_t)&v24, (uint64_t)v28, 16);
    }

    while (v7);
  }

  else
  {
    uint64_t v12 = v5;
  }

  return v12;
}

id sub_186A12340(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  uint64_t v8 = v3;
  if (!v3 || (uint64_t v9 = (void *)objc_msgSend_mutableCopy(v3, v4, v5, v6, v7)) == 0)
  {
    objc_msgSend_dictionary(MEMORY[0x189603FC8], v4, v5, v6, v7);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

uint64_t sub_186A12558()
{
  return NSRequestConcreteImplementation();
}

id __PLUGINKIT_CALLING_OUT_TO_CLIENT_SUBSYSTEM_FOR_INIT__(void *a1, void *a2)
{
  id v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    objc_msgSend_initForPlugInKitWithOptions_(a1, v4, (uint64_t)v3, v6, v7);
  }
  else {
    objc_msgSend_initForPlugInKit(a1, v4, v5, v6, v7);
  }
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __PLUGINKIT_HANDING_CONTROL_TO_CLIENT__(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
  }

  else
  {
    pklog_handle_for_category(7);
    uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
      sub_186A25200(v2);
    }
  }

uint64_t __PLUGINKIT_CALLING_OUT_TO_CLIENT_SUBSYSTEM_FOR_BEGINUSING__( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x189616718](a1, sel_beginUsing_withBundle_, a2, a3, a5);
}

uint64_t pkUseInternalDiagnostics()
{
  if (qword_18C697310 != -1) {
    dispatch_once(&qword_18C697310, &unk_189F20D50);
  }
  return byte_18C697308;
}

uint64_t sub_186A12680()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  byte_18C697308 = result;
  return result;
}

uint64_t pkRunningboardManaged()
{
  return 1LL;
}

id pkIssueSandboxExtensionForURL(void *a1, __int128 *a2)
{
  id v3 = a1;
  objc_msgSend_fileSystemRepresentation(v3, v4, v5, v6, v7);
  __int128 v19 = *a2;
  __int128 v20 = a2[1];
  uint64_t v8 = sandbox_extension_issue_file_to_process();
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    pklog_handle_for_category(4);
    uint64_t v10 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEBUG)) {
      sub_186A25240(v3, v10, v11, v12, v13);
    }

    objc_msgSend_stringWithUTF8String_(NSString, v14, (uint64_t)v9, v15, v16, v19, v20);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    free(v9);
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  return v17;
}

id pkIssueSandboxExtensionForMachService(void *a1, __int128 *a2)
{
  id v3 = a1;
  objc_msgSend_UTF8String(v3, v4, v5, v6, v7);
  __int128 v16 = *a2;
  __int128 v17 = a2[1];
  uint64_t v8 = sandbox_extension_issue_mach_to_process();
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    pklog_handle_for_category(4);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_186A252B8(v3);
    }

    objc_msgSend_stringWithUTF8String_(NSString, v11, (uint64_t)v9, v12, v13, v16, v17);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    free(v9);
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  return v14;
}

uint64_t PKAnnotationNotificationSetName(uint64_t result)
{
  qword_18C696D00 = result;
  return result;
}

BOOL PKAnnotationNotificationPost()
{
  uint32_t v0 = notify_post((const char *)qword_18C696D00);
  if (v0)
  {
    pklog_handle_for_category(10);
    uint64_t v1 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      sub_186A25320();
    }
  }

  return v0 == 0;
}

BOOL sub_186A128D4(int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  uint32_t v3 = notify_register_dispatch((const char *)qword_18C696D00, out_token, queue, handler);
  if (v3)
  {
    pklog_handle_for_category(10);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_186A25374();
    }
  }

  return v3 == 0;
}

BOOL sub_186A12944(int a1)
{
  uint32_t v1 = notify_cancel(a1);
  if (v1)
  {
    pklog_handle_for_category(10);
    uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_186A253C8();
    }
  }

  return v1 == 0;
}

uint64_t PKGetThreadPriority()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  mach_msg_type_number_t thread_info_outCnt = 28;
  thread_inspect_t v0 = MEMORY[0x186E41330]();
  if (thread_info(v0, 5u, thread_info_out, &thread_info_outCnt)) {
    uint64_t v1 = 4294966296LL;
  }
  else {
    uint64_t v1 = thread_info_out[9];
  }
  mach_port_deallocate(*MEMORY[0x1895FBBE0], v0);
  return v1;
}

id sub_186A12A34(void *a1)
{
  return a1;
}

id pkError(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1895F89C0];
  uint32_t v3 = (void *)MEMORY[0x189607870];
  if (a2)
  {
    uint64_t v12 = *MEMORY[0x1896075E0];
    v13[0] = a2;
    id v4 = (void *)MEMORY[0x189603F68];
    id v5 = a2;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v4, v6, (uint64_t)v13, (uint64_t)&v12, 1);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v3, v8, (uint64_t)@"PlugInKit", a1, (uint64_t)v7);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v7 = 0LL;
    objc_msgSend_errorWithDomain_code_userInfo_(v3, v10, (uint64_t)@"PlugInKit", a1, 0);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

id pkErrorf( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v23[1] = *MEMORY[0x1895F89C0];
  id v11 = a2;
  if (v11)
  {
    id v12 = objc_alloc(NSString);
    uint64_t v15 = (void *)objc_msgSend_initWithFormat_arguments_(v12, v13, (uint64_t)v11, (uint64_t)&a9, v14);
    __int128 v16 = (void *)MEMORY[0x189607870];
    uint64_t v22 = *MEMORY[0x1896075E0];
    v23[0] = v15;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v17, (uint64_t)v23, (uint64_t)&v22, 1);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v16, v19, (uint64_t)@"PlugInKit", a1, (uint64_t)v18);
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x189607870], v10, (uint64_t)@"PlugInKit", a1, 0);
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

id sub_186A12C78(void *a1, uint64_t a2, void *a3)
{
  uint64_t v120 = *MEMORY[0x1895F89C0];
  id v4 = a1;
  id v5 = a3;
  __int128 v114 = 0u;
  __int128 v115 = 0u;
  __int128 v116 = 0u;
  __int128 v117 = 0u;
  objc_msgSend_componentsSeparatedByString_(v5, v6, (uint64_t)@",", v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v114, (uint64_t)v119, 16);
  if (v11)
  {
    uint64_t v15 = *(void *)v115;
    id v100 = v5;
    id v101 = v4;
    uint64_t v103 = v9;
    uint64_t v106 = *(void *)v115;
LABEL_3:
    uint64_t v16 = 0LL;
    if (v11 <= 1) {
      uint64_t v17 = 1LL;
    }
    else {
      uint64_t v17 = v11;
    }
    uint64_t v107 = v17;
    while (1)
    {
      if (*(void *)v115 != v15) {
        objc_enumerationMutation(v9);
      }
      objc_msgSend_componentsSeparatedByString_( *(void **)(*((void *)&v114 + 1) + 8 * v16),  v12,  (uint64_t)@":",  v13,  v14,  v100,  v101);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_count(v18, v19, v20, v21, v22) != 3)
      {
        uint64_t v109 = pkError(6LL, v5);

LABEL_45:
        uint64_t v98 = (void *)v109;
        goto LABEL_46;
      }

      objc_msgSend_objectAtIndexedSubscript_(v18, v23, 0, v24, v25);
      __int128 v26 = (void *)objc_claimAutoreleasedReturnValue();
      int isEqualToString = objc_msgSend_isEqualToString_(v26, v27, (uint64_t)@"request", v28, v29);
      __int16 v108 = v26;
      if ((isEqualToString & 1) != 0
        || (objc_msgSend_isEqualToString_(v26, v30, (uint64_t)@"reply", v31, v32) & 1) != 0)
      {
        break;
      }

      uint64_t v109 = pkError(6LL, v26);
      int v96 = 1;
LABEL_41:

      if (v96) {
        goto LABEL_45;
      }
      if (++v16 == v17)
      {
        unint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v114, (uint64_t)v119, 16);
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_44;
      }
    }

    uint64_t v34 = isEqualToString ^ 1u;
    objc_msgSend_objectAtIndexedSubscript_(v18, v30, 1, v31, v32);
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v40 = objc_msgSend_integerValue(v35, v36, v37, v38, v39);

    objc_msgSend_objectAtIndexedSubscript_(v18, v41, 2, v42, v43);
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_characterAtIndex_(v44, v45, 0, v46, v47) == 123)
    {
      uint64_t v52 = objc_msgSend_length(v44, v48, v49, v50, v51);
      if (objc_msgSend_characterAtIndex_(v44, v53, v52 - 1, v54, v55) == 125)
      {
        uint64_t v104 = v40;
        objc_msgSend_set(MEMORY[0x189603FE0], v56, v57, v58, v59);
        uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v110 = 0u;
        __int128 v111 = 0u;
        __int128 v112 = 0u;
        __int128 v113 = 0u;
        uint64_t v65 = objc_msgSend_length(v44, v61, v62, v63, v64);
        int v66 = 1;
        objc_msgSend_substringWithRange_(v44, v67, 1, v65 - 2, v68);
        id v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_componentsSeparatedByString_(v69, v70, (uint64_t)@"+", v71, v72);
        uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue();

        unint64_t v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(v73, v74, (uint64_t)&v110, (uint64_t)v118, 16);
        if (v75)
        {
          unsigned int v102 = v34;
          uint64_t v76 = *(void *)v111;
          do
          {
            uint64_t v77 = 0LL;
            if (v75 <= 1) {
              uint64_t v78 = 1LL;
            }
            else {
              uint64_t v78 = v75;
            }
            do
            {
              if (*(void *)v111 != v76) {
                objc_enumerationMutation(v73);
              }
              id v79 = *(id *)(*((void *)&v110 + 1) + 8 * v77);
              uint64_t v84 = (const char *)objc_msgSend_UTF8String(v79, v80, v81, v82, v83);
              Class v88 = objc_lookUpClass(v84);
              if (!v88)
              {
                uint64_t v109 = pkError(6LL, v79);
                int v66 = 0;
                goto LABEL_35;
              }

              objc_msgSend_addObject_(v60, v85, (uint64_t)v88, v86, v87);
              ++v77;
            }

            while (v78 != v77);
            unint64_t v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(v73, v89, (uint64_t)&v110, (uint64_t)v118, 16);
          }

          while (v75);
          int v66 = 1;
LABEL_35:
          id v5 = v100;
          id v4 = v101;
          uint64_t v34 = v102;
        }

        uint64_t v15 = v106;
        if (!v66)
        {

          int v96 = 1;
          uint64_t v9 = v103;
          goto LABEL_40;
        }

        objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v97, (uint64_t)v60, a2, v104, v34);

        uint64_t v9 = v103;
        goto LABEL_38;
      }

      uint64_t v109 = pkError(6LL, v44);
      int v96 = 1;
      uint64_t v15 = v106;
    }

    else
    {
      sub_186A130E4(v44, 0LL);
      uint64_t v93 = (void *)objc_claimAutoreleasedReturnValue();
      if (v93)
      {
        objc_msgSend_interfaceWithProtocol_(MEMORY[0x189607B48], v90, (uint64_t)v93, v91, v92);
        uint64_t v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(v4, v95, (uint64_t)v94, a2, v40, v34);
      }

      else
      {
        uint64_t v109 = pkError(6LL, v44);
      }

      uint64_t v15 = v106;

      if (v93)
      {
LABEL_38:
        int v96 = 0;
        goto LABEL_40;
      }

      int v96 = 1;
    }

LABEL_40:
    uint64_t v17 = v107;
    goto LABEL_41;
  }

LABEL_44:
  uint64_t v98 = 0LL;
LABEL_46:

  return v98;
}

id sub_186A130E4(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v8 = (const char *)objc_msgSend_UTF8String(v3, v4, v5, v6, v7);
  objc_getProtocol(v8);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend_stringWithFormat_( NSString,  v9,  (uint64_t)@"unable to locate protocol [%@] - check that it is defined and not inadvertently optimized away",  v10,  v11,  v3);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    pklog_handle_for_category(0);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      sub_186A2541C((uint64_t)v13, v14);

      if (!a2) {
        goto LABEL_5;
      }
    }

    else
    {

      if (!a2)
      {
LABEL_5:

        goto LABEL_6;
      }
    }

    pkError(12LL, v13);
    *a2 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }

LABEL_6:
  return v12;
}

Protocol *sub_186A131B8(void *a1, void *a2)
{
  v58[1] = *MEMORY[0x1895F89C0];
  id v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    sub_186A130E4(v3, a2);
    id v4 = (Protocol *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      __int128 v53 = 0u;
      __int128 v54 = 0u;
      __int128 v51 = 0u;
      __int128 v52 = 0u;
      id v5 = v3;
      unint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v51, (uint64_t)v56, 16);
      if (v7)
      {
        uint64_t v11 = *(void *)v52;
        id v12 = @"__XX_COMPOUND";
        do
        {
          uint64_t v13 = 0LL;
          if (v7 <= 1) {
            uint64_t v14 = 1LL;
          }
          else {
            uint64_t v14 = v7;
          }
          uint64_t v15 = v12;
          do
          {
            if (*(void *)v52 != v11) {
              objc_enumerationMutation(v5);
            }
            objc_msgSend_stringByAppendingFormat_( v15,  v8,  (uint64_t)@"__%@",  v9,  v10,  *(void *)(*((void *)&v51 + 1) + 8 * v13));
            id v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

            ++v13;
            uint64_t v15 = v12;
          }

          while (v14 != v13);
          unint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v51, (uint64_t)v56, 16);
        }

        while (v7);
      }

      else
      {
        id v12 = @"__XX_COMPOUND";
      }

      uint64_t v16 = v12;
      uint64_t v21 = (const char *)objc_msgSend_UTF8String(v16, v17, v18, v19, v20);
      uint64_t v22 = objc_allocateProtocol(v21);
      if (v22)
      {
        id v4 = (Protocol *)v22;
        __int128 v49 = 0u;
        __int128 v50 = 0u;
        __int128 v47 = 0u;
        __int128 v48 = 0u;
        id v23 = v5;
        unint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v47, (uint64_t)v55, 16);
        if (v25)
        {
          uint64_t v26 = *(void *)v48;
          while (2)
          {
            uint64_t v27 = 0LL;
            if (v25 <= 1) {
              uint64_t v28 = 1LL;
            }
            else {
              uint64_t v28 = v25;
            }
            do
            {
              if (*(void *)v48 != v26) {
                objc_enumerationMutation(v23);
              }
              sub_186A130E4(*(void **)(*((void *)&v47 + 1) + 8 * v27), a2);
              uint64_t v29 = (Protocol *)objc_claimAutoreleasedReturnValue();
              if (!v29)
              {

                int v31 = 0;
                goto LABEL_32;
              }

              protocol_addProtocol(v4, v29);

              ++v27;
            }

            while (v28 != v27);
            unint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v30, (uint64_t)&v47, (uint64_t)v55, 16);
            if (v25) {
              continue;
            }
            break;
          }
        }

        objc_registerProtocol(v4);
        int v31 = 1;
      }

      else
      {
        uint64_t v32 = v16;
        uint64_t v37 = (const char *)objc_msgSend_UTF8String(v32, v33, v34, v35, v36);
        uint64_t v38 = objc_getProtocol(v37);
        id v4 = (Protocol *)v38;
        int v31 = 1;
        if (a2 && !v38)
        {
          uint64_t v40 = (void *)MEMORY[0x189607870];
          uint64_t v57 = *MEMORY[0x1896075E0];
          v58[0] = @"unable to create compound protocol";
          int v31 = 1;
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x189603F68], v39, (uint64_t)v58, (uint64_t)&v57, 1);
          uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_userInfo_(v40, v42, (uint64_t)@"PlugInKit", 12, (uint64_t)v41);
          uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();

          id v44 = v43;
          id v4 = 0LL;
          *a2 = v44;
        }
      }

LABEL_32:
      if (!v31)
      {
        uint64_t v45 = 0LL;
        goto LABEL_34;
      }
    }

    else
    {
      id v4 = 0LL;
    }
  }

  id v4 = v4;
  uint64_t v45 = v4;
LABEL_34:

  return v45;
}

uint64_t pkIsInSpecialSession()
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  pklog_handle_for_category(0);
  thread_inspect_t v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    int v2 = 136315394;
    uint64_t v3 = 0LL;
    __int16 v4 = 1024;
    int v5 = 0;
    _os_log_impl( &dword_186A04000,  v0,  OS_LOG_TYPE_INFO,  "vproc manager: [%s], in special session: %d",  (uint8_t *)&v2,  0x12u);
  }

  return 0LL;
}

uint64_t pkIsServiceAccount()
{
  return 0LL;
}

uint64_t sub_186A135C4()
{
  return 0LL;
}

id sub_186A135CC(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  uint64_t v6 = a4;
  objc_msgSend_arrayWithCapacity_(MEMORY[0x189603FA8], v7, 0, v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v11 = v5;
  unint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v23, (uint64_t)v27, 16);
  if (v13)
  {
    uint64_t v14 = *(void *)v24;
    do
    {
      uint64_t v15 = 0LL;
      if (v13 <= 1) {
        uint64_t v16 = 1LL;
      }
      else {
        uint64_t v16 = v13;
      }
      do
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        v6[2](v6, *(void *)(*((void *)&v23 + 1) + 8 * v15));
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21) {
          objc_msgSend_addObject_(v10, v18, (uint64_t)v21, v19, v20, (void)v23);
        }

        ++v15;
      }

      while (v16 != v15);
      unint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v17, (uint64_t)&v23, (uint64_t)v27, 16);
    }

    while (v13);
  }

  return v10;
}

id sub_186A13720(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  id v12 = (void *)objc_msgSend_mutableCopy(a1, v8, v9, v10, v11);
  objc_msgSend_setObject_forKeyedSubscript_(v12, v13, (uint64_t)v6, (uint64_t)v7, v14);

  uint64_t v19 = (void *)objc_msgSend_copy(v12, v15, v16, v17, v18);
  return v19;
}

uint64_t sub_186A1378C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x189616718](a1, sel_compare_options_, a3, 64LL, a5);
}

id sub_186A13794(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (id)objc_claimAutoreleasedReturnValue();
}

__CFString *sub_186A137D0(void *a1)
{
  id v1 = a1;
  int v2 = (const _xpc_type_s *)MEMORY[0x186E41954]();
  id v3 = objc_alloc(MEMORY[0x189607940]);
  name = xpc_type_get_name(v2);
  uint64_t v8 = (void *)objc_msgSend_initWithFormat_(v3, v5, (uint64_t)@"(%s)", v6, v7, name);
  if (v2 == (const _xpc_type_s *)MEMORY[0x1895F9228])
  {
    if (v1 == (id)MEMORY[0x1895F9178]) {
      uint64_t v10 = @"true";
    }
    else {
      uint64_t v10 = @"false";
    }
    uint64_t v11 = v10;
  }

  else if (v2 == (const _xpc_type_s *)MEMORY[0x1895F9280])
  {
    id v12 = objc_alloc(MEMORY[0x189607968]);
    int64_t value = xpc_int64_get_value(v1);
    uint64_t v11 = (__CFString *)objc_msgSend_initWithLongLong_(v12, v14, value, v15, v16);
  }

  else if (v2 == (const _xpc_type_s *)MEMORY[0x1895F92F0])
  {
    id v17 = objc_alloc(MEMORY[0x189607968]);
    uint64_t v18 = xpc_uint64_get_value(v1);
    uint64_t v11 = (__CFString *)objc_msgSend_initWithUnsignedLongLong_(v17, v19, v18, v20, v21);
  }

  else if (v2 == (const _xpc_type_s *)MEMORY[0x1895F9258])
  {
    id v22 = objc_alloc(MEMORY[0x189607968]);
    double v23 = xpc_double_get_value(v1);
    uint64_t v11 = (__CFString *)objc_msgSend_initWithDouble_(v22, v24, v25, v26, v27, v23);
  }

  else if (v2 == (const _xpc_type_s *)MEMORY[0x1895F9248])
  {
    id v28 = objc_alloc(MEMORY[0x189603F50]);
    int64_t v29 = xpc_date_get_value(v1);
    uint64_t v11 = (__CFString *)objc_msgSend_initWithTimeIntervalSince1970_(v28, v30, v31, v32, v33, (double)v29 / 1000000000.0);
  }

  else if (v2 == (const _xpc_type_s *)MEMORY[0x1895F9240])
  {
    id v34 = objc_alloc(MEMORY[0x189603F48]);
    bytes_ptr = xpc_data_get_bytes_ptr(v1);
    size_t length = xpc_data_get_length(v1);
    uint64_t v11 = (__CFString *)objc_msgSend_initWithBytes_length_(v34, v37, (uint64_t)bytes_ptr, length, v38);
  }

  else if (v2 == (const _xpc_type_s *)MEMORY[0x1895F92E8])
  {
    id v39 = objc_alloc(NSString);
    string_ptr = xpc_string_get_string_ptr(v1);
    uint64_t v11 = (__CFString *)objc_msgSend_initWithCString_encoding_(v39, v41, (uint64_t)string_ptr, 4, v42);
  }

  else if (v2 == (const _xpc_type_s *)MEMORY[0x1895F92F8])
  {
    id v43 = objc_alloc(MEMORY[0x189607AB8]);
    bytes = xpc_uuid_get_bytes(v1);
    uint64_t v11 = (__CFString *)objc_msgSend_initWithUUIDBytes_(v43, v45, (uint64_t)bytes, v46, v47);
  }

  else if (v2 == (const _xpc_type_s *)MEMORY[0x1895F9250])
  {
    sub_186A13B34(v1);
    uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else if (v2 == (const _xpc_type_s *)MEMORY[0x1895F9220])
  {
    sub_186A13BB8(v1);
    uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    if (v2 != (const _xpc_type_s *)MEMORY[0x1895F9268])
    {
      uint64_t v9 = 0LL;
      goto LABEL_28;
    }

    id v48 = objc_alloc(NSString);
    string = xpc_dictionary_get_string(v1, (const char *)*MEMORY[0x1895F91B0]);
    uint64_t v11 = (__CFString *)objc_msgSend_initWithFormat_(v48, v50, (uint64_t)@"%s", v51, v52, string);
  }

  uint64_t v9 = v11;
LABEL_28:
  if (v9)
  {
    if (v2 == (const _xpc_type_s *)MEMORY[0x1895F9250] || v2 == (const _xpc_type_s *)MEMORY[0x1895F9220])
    {
      uint64_t v57 = v9;
    }

    else
    {
      id v53 = objc_alloc(NSString);
      uint64_t v57 = (__CFString *)objc_msgSend_initWithFormat_(v53, v54, (uint64_t)@"%@: %@", v55, v56, v8, v9);
    }
  }

  else
  {
    uint64_t v57 = v8;
  }

  uint64_t v58 = v57;

  return v58;
}

id sub_186A13B1C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (id)objc_msgSend_copy(0, a2, a3, a4, a5);
}

id sub_186A13B34(void *a1)
{
  id v1 = a1;
  int v2 = (void *)objc_opt_new();
  applier[0] = MEMORY[0x1895F87A8];
  applier[1] = 3221225472LL;
  applier[2] = sub_186A13C3C;
  applier[3] = &unk_189F20D78;
  id v3 = v2;
  id v6 = v3;
  xpc_dictionary_apply(v1, applier);

  return v3;
}

id sub_186A13BB8(void *a1)
{
  id v1 = a1;
  int v2 = (void *)objc_opt_new();
  applier[0] = MEMORY[0x1895F87A8];
  applier[1] = 3221225472LL;
  applier[2] = sub_186A13CAC;
  applier[3] = &unk_189F20DA0;
  id v3 = v2;
  id v6 = v3;
  xpc_array_apply(v1, applier);

  return v3;
}

uint64_t sub_186A13C3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = *(void **)(a1 + 32);
  objc_msgSend_stringWithUTF8String_(NSString, v7, a2, v8, v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v11, (uint64_t)v5, (uint64_t)v10, v12);

  return 1LL;
}

uint64_t sub_186A13CAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_atIndexedSubscript_(*(void **)(a1 + 32), v6, (uint64_t)v5, a2, v7);

  return 1LL;
}

void sub_186A13CFC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_186A13D20( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

#error "186A15458: call analysis failed (funcsize=106)"
void sub_186A15460(_Unwind_Exception *a1)
{
  void *v1;
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_186A15780(uint64_t a1, void *a2, void *a3, void *a4)
{
  v22[2] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  v22[0] = @"NSExtension";
  v22[1] = @"Shared";
  uint64_t v9 = (void *)MEMORY[0x189603F18];
  id v10 = a2;
  objc_msgSend_arrayWithObjects_count_(v9, v11, (uint64_t)v22, 2, v12);
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  int isEqual = objc_msgSend_isEqual_(v10, v14, (uint64_t)v13, v15, v16);

  uint64_t v20 = v8;
  if (isEqual)
  {
    objc_msgSend_mergeSharedResources_into_(*(void **)(a1 + 32), v18, (uint64_t)v8, (uint64_t)v7, v19);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

void sub_186A158C8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v16[2] = *MEMORY[0x1895F89C0];
  id v5 = (void *)MEMORY[0x189604010];
  v16[0] = @"NSExtension";
  v16[1] = @"CleanTimeout";
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x189603F18], a2, (uint64_t)v16, 2, a5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = @"NSExtension";
  v15[1] = @"NSExtensionSandboxProfile";
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x189603F18], v7, (uint64_t)v15, 2, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = objc_msgSend_setWithObjects_(v5, v10, (uint64_t)v6, v11, v12, v9, 0);
  uint64_t v14 = (void *)qword_18C4AE1E8;
  qword_18C4AE1E8 = v13;
}

LABEL_19:
  objc_msgSend_pluginKey_(self, v25, (uint64_t)@"PassProxy", v27, v28);
  id v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    uint64_t v52 = @"PassProxy";
    uint64_t v37 = @"the %@ key is not supported on this platform";
    goto LABEL_21;
  }

  if (objc_msgSend_isHybrid(self, v49, v9, v10, v11))
  {
    pkError(12LL, @"hybrid plug-ins are not supported on this platform");
    __int128 v50 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    __int128 v50 = 0LL;
  }

  return v50;
}
}

void sub_186A16154()
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  size_t v6 = 37LL;
  if (sysctlbyname("kern.bootsessionuuid", &unk_18C697340, &v6, 0LL, 0LL) < 0)
  {
    pklog_handle_for_category(10);
    thread_inspect_t v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
      sub_186A25710(v0);
    }
  }

  id v1 = objc_alloc(NSString);
  uint64_t v3 = objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(v1, v2, (uint64_t)&unk_18C697340, v6 - 1, 4, 0);
  __int16 v4 = (void *)qword_18C697338;
  qword_18C697338 = v3;

  pklog_handle_for_category(10);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v8 = qword_18C697338;
    _os_log_impl(&dword_186A04000, v5, OS_LOG_TYPE_INFO, "Got boot session uuid: %@", buf, 0xCu);
  }
}

LABEL_25:
  pklog_handle_for_category(3);
  __int128 v54 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
    sub_186A258E0(self, v13, v54);
  }

  v7[2](v7, v13, v45);
}

void sub_186A17384(_Unwind_Exception *a1)
{
}

void sub_186A174D4(_Unwind_Exception *a1)
{
}

void sub_186A17530(_Unwind_Exception *a1)
{
}

void sub_186A17B88(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend_localizedStringForKey_value_table_(*(void **)(a1 + 40), v6, (uint64_t)v7, (uint64_t)v7, 0);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 32), v9, (uint64_t)v8, (uint64_t)v7, v10);
  }

  else
  {
    pklog_handle_for_category(3);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_186A25CA0();
    }
  }
}

void sub_186A18154( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_186A18168( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

uint64_t sub_186A181B8()
{
  return v0;
}

uint64_t sub_186A181C4()
{
  return v0;
}

void sub_186A1844C(_Unwind_Exception *a1)
{
}

void sub_186A18494(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  pklog_handle_for_category(1);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_uuid(WeakRetained, v4, v5, v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(WeakRetained, v9, v10, v11, v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_version(WeakRetained, v14, v15, v16, v17);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    id v19 = objc_loadWeakRetained((id *)(a1 + 40));
    int v24 = 138544130;
    uint64_t v25 = v8;
    __int16 v26 = 2112;
    uint64_t v27 = v13;
    __int16 v28 = 2112;
    int64_t v29 = v18;
    __int16 v30 = 1024;
    int v31 = objc_msgSend_processIdentifier(v19, v20, v21, v22, v23);
    _os_log_impl( &dword_186A04000,  v3,  OS_LOG_TYPE_DEFAULT,  "[u %{public}@] [%@(%@)] host connection from pid %d interrupted",  (uint8_t *)&v24,  0x26u);
  }
}

void sub_186A185C8(void **a1)
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  int v2 = a1 + 5;
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  pklog_handle_for_category(1);
  __int16 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_uuid(WeakRetained, v5, v6, v7, v8);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(WeakRetained, v10, v11, v12, v13);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_version(WeakRetained, v15, v16, v17, v18);
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    id v20 = objc_loadWeakRetained(a1 + 6);
    *(_DWORD *)buf = 138544130;
    uint64_t v47 = v9;
    __int16 v48 = 2112;
    __int128 v49 = v14;
    __int16 v50 = 2112;
    uint64_t v51 = v19;
    __int16 v52 = 1024;
    int v53 = objc_msgSend_processIdentifier(v20, v21, v22, v23, v24);
    _os_log_impl( &dword_186A04000,  v4,  OS_LOG_TYPE_DEFAULT,  "[u %{public}@] [%@(%@)] host connection from pid %d invalidated",  buf,  0x26u);
  }

  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  objc_msgSend_subsystems(a1[4], v25, v26, v27, v28, 0);
  int64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v41, (uint64_t)v45, 16);
  if (v31)
  {
    uint64_t v32 = *(void *)v42;
    do
    {
      uint64_t v33 = 0LL;
      if (v31 <= 1) {
        uint64_t v34 = 1LL;
      }
      else {
        uint64_t v34 = v31;
      }
      do
      {
        if (*(void *)v42 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v35 = *(void **)(*((void *)&v41 + 1) + 8 * v33);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          id v37 = objc_loadWeakRetained(v2);
          objc_msgSend_communicationsFailed_(v35, v38, (uint64_t)v37, v39, v40);
        }

        ++v33;
      }

      while (v34 != v33);
      unint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v36, (uint64_t)&v41, (uint64_t)v45, 16);
    }

    while (v31);
  }
}

void sub_186A19274(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v9 = a3;
  if (v5)
  {
    pklog_handle_for_category(7);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_186A25E08();
    }
  }

  objc_msgSend_objectForKeyedSubscript_(v9, v6, (uint64_t)@"sandboxExtensions", v7, v8);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

LABEL_12:
  return v15;
}

void sub_186A1A0A4( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_186A1A100( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

uint64_t sub_186A1A134()
{
  return v0;
}

uint64_t sub_186A1A140()
{
  return v0;
}

void sub_186A1A2E0(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  if (objc_opt_class() && (objc_opt_respondsToSelector() & 1) == 0)
  {
    pklog_handle_for_category(5);
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_uuid(*(void **)(a1 + 32), v7, v8, v9, v10);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(*(void **)(a1 + 32), v12, v13, v14, v15);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_version(*(void **)(a1 + 32), v17, v18, v19, v20);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      uint64_t v40 = v11;
      __int16 v41 = 2112;
      __int128 v42 = v16;
      __int16 v43 = 2112;
      __int128 v44 = v21;
      _os_log_impl( &dword_186A04000,  v6,  OS_LOG_TYPE_INFO,  "[u %{public}@] [%@(%@)] invalidating checkin assertion",  buf,  0x20u);
    }

    objc_msgSend_external(*(void **)(a1 + 40), v22, v23, v24, v25);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_runningboard(v26, v27, v28, v29, v30);
    unint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_plugInHandshakeComplete(v31, v32, v33, v34, v35);
  }

  objc_msgSend_timerQueue(*(void **)(a1 + 40), v2, v3, v4, v5);
  uint64_t v36 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_186A1A4D0;
  block[3] = &unk_189F20630;
  void block[4] = *(void *)(a1 + 40);
  dispatch_sync(v36, block);

  pklog_handle_for_category(7);
  id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v37))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( &dword_186A04000,  v37,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "ExtensionStartup",  (const char *)&unk_186A2C58B,  buf,  2u);
  }
}

void sub_186A1A4D0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend_firstHostRequestTimer(*(void **)(a1 + 32), v7, v8, v9, v10);
    uint64_t v11 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v11);

    objc_msgSend_setFirstHostRequestTimer_(*(void **)(a1 + 32), v12, 0, v13, v14);
  }

void sub_186A1A8B4()
{
  Class v0 = NSClassFromString(@"EXPKService");
  else {
    BOOL v1 = 1;
  }
  if (v1)
  {
    int v2 = objc_alloc_init(&OBJC_CLASS___PKService);
  }

  else
  {
    pklog_handle_for_category(7);
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_186A04000, v3, OS_LOG_TYPE_DEFAULT, "Bootstrapping; Using EXPKService", v10, 2u);
    }

    objc_msgSend_defaultService(v0, v5, v6, v7, v8);
    int v2 = (PKService *)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v9 = (void *)qword_18C4AE1D8;
  qword_18C4AE1D8 = (uint64_t)v2;
}

void sub_186A1AAF8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_source_t v7 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, v6);
  objc_msgSend_setFirstHostRequestTimer_(*(void **)(a1 + 32), v8, (uint64_t)v7, v9, v10);

  objc_msgSend_firstHostRequestTimer(*(void **)(a1 + 32), v11, v12, v13, v14);
  uint64_t v15 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
  dispatch_source_set_event_handler(v15, &unk_189F20F10);

  dispatch_time_t v16 = dispatch_time(0LL, 2000000000LL);
  objc_msgSend_firstHostRequestTimer(*(void **)(a1 + 32), v17, v18, v19, v20);
  uint64_t v21 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
  dispatch_source_set_timer(v21, v16, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

  objc_msgSend_firstHostRequestTimer(*(void **)(a1 + 32), v22, v23, v24, v25);
  uint64_t v26 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue();
  dispatch_resume(v26);
}

void sub_186A1ABD8()
{
  Class v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_186A26238(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

LABEL_15:
    pklog_handle_for_category(7);
    uint64_t v68 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
      sub_186A262A4();
    }

    goto LABEL_18;
  }

void sub_186A1C2B8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    dispatch_time_t v11 = dispatch_time(0LL, (uint64_t)(*(double *)(a1 + 40) * 1000000000.0));
    objc_msgSend_terminationTimer(*(void **)(a1 + 32), v12, v13, v14, v15);
    dispatch_time_t v16 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
    dispatch_source_set_timer(v16, v11, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  }

  else
  {
    objc_msgSend_timerQueue(*(void **)(a1 + 32), v7, v8, v9, v10);
    uint64_t v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    dispatch_source_t v18 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, v17);
    objc_msgSend_setTerminationTimer_(*(void **)(a1 + 32), v19, (uint64_t)v18, v20, v21);

    objc_msgSend_terminationTimer(*(void **)(a1 + 32), v22, v23, v24, v25);
    uint64_t v26 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = sub_186A1C434;
    handler[3] = &unk_189F20630;
    handler[4] = *(void *)(a1 + 32);
    dispatch_source_set_event_handler(v26, handler);

    dispatch_time_t v27 = dispatch_time(0LL, (uint64_t)(*(double *)(a1 + 40) * 1000000000.0));
    objc_msgSend_terminationTimer(*(void **)(a1 + 32), v28, v29, v30, v31);
    uint64_t v32 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
    dispatch_source_set_timer(v32, v27, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

    objc_msgSend_terminationTimer(*(void **)(a1 + 32), v33, v34, v35, v36);
    dispatch_time_t v16 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
    dispatch_resume(v16);
  }
}

void sub_186A1C434(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_186A04000, v2, OS_LOG_TYPE_DEFAULT, "Exiting when clean", v17, 2u);
  }

  objc_msgSend_external(*(void **)(a1 + 32), v3, v4, v5, v6);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sys(v7, v8, v9, v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_xpc_transaction_exit_clean(v12, v13, v14, v15, v16);
}

void sub_186A1C52C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sys(v6, v7, v8, v9, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_xpc_transaction_interrupt_clean_exit(v11, v12, v13, v14, v15);

  objc_msgSend_terminationTimer(*(void **)(a1 + 32), v16, v17, v18, v19);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_terminationTimer(*(void **)(a1 + 32), v21, v22, v23, v24);
    uint64_t v25 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v25);

    objc_msgSend_setTerminationTimer_(*(void **)(a1 + 32), v26, 0, v27, v28);
  }

void sub_186A1C710( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_186A1C720(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

  ;
}

  ;
}

void sub_186A1C8D0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_186A1C8E8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_186A1C8F8(uint64_t a1)
{
}

void sub_186A1C900(uint64_t a1, void *a2)
{
}

void sub_186A1CDC4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_186A1CDE4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (MEMORY[0x186E41954]() == MEMORY[0x1895F9268])
  {
    xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1895F91B0]);
    pklog_handle_for_category(1);
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_186A2677C(a1);
    }
  }
}

void sub_186A1DE68( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, id location)
{
}

void sub_186A1DEA8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (MEMORY[0x186E41954]() == MEMORY[0x1895F9268])
  {
    xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1895F91B0]);
    pklog_handle_for_category(1);
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_186A26848(a1);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_186A1DF48(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = WeakRetained;
  if (v3 != (id)MEMORY[0x1895F9198] || (*(_BYTE *)(a1 + 56) ? (BOOL v6 = WeakRetained == 0LL) : (BOOL v6 = 1), v6))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    pklog_handle_for_category(1);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_186A268BC();
    }

    uint64_t uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "flags");
    xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "flags", uint64 & 0xFFFFFFFFFFFF7FFFLL);
    objc_initWeak(&location, v5);
    uint64_t v10 = (dispatch_queue_s *)v5[3];
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = sub_186A1E0AC;
    v11[3] = &unk_189F20FE8;
    objc_copyWeak(&v14, &location);
    id v12 = *(id *)(a1 + 32);
    id v13 = *(id *)(a1 + 40);
    dispatch_async(v10, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void sub_186A1E0AC(xpc_object_t *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    xpc_connection_send_message_with_reply( *((xpc_connection_t *)WeakRetained + 2),  a1[4],  *((dispatch_queue_t *)WeakRetained + 3),  a1[5]);
    id v3 = v4;
  }
}

void sub_186A1E21C(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  objc_msgSend_uuid(v3, v4, v5, v6, v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getUUIDBytes_(v8, v9, (uint64_t)uuid, v10, v11);

  xpc_array_set_uuid(*(xpc_object_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL, uuid);
  id v12 = *(void **)(a1 + 40);
  id v17 = objc_msgSend_path(v3, v13, v14, v15, v16);
  uint64_t v22 = (const char *)objc_msgSend_UTF8String(v17, v18, v19, v20, v21);
  xpc_array_set_string(v12, 0xFFFFFFFFFFFFFFFFLL, v22);

  objc_msgSend_multipleInstanceUUID(v3, v23, v24, v25, v26);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend_multipleInstanceUUID(v3, v28, v29, v30, v31);
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v33 = uuid;
    objc_msgSend_getUUIDBytes_(v32, v34, (uint64_t)uuid, v35, v36);
  }

  else
  {
    uint64_t v33 = (unsigned __int8 *)&unk_186A2A548;
  }

  xpc_array_set_uuid(*(xpc_object_t *)(a1 + 48), 0xFFFFFFFFFFFFFFFFLL, v33);
}

void sub_186A1E580( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_186A1E594( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_186A1E5A4(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

  ;
}

void sub_186A1ECA8( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

id pklog_handle_for_category(int a1)
{
  if (qword_18C4AE288 != -1) {
    dispatch_once(&qword_18C4AE288, &unk_189F21058);
  }
  return (id)qword_18C4AE208[a1];
}

void sub_186A1ED20()
{
  os_log_t v0 = os_log_create("com.apple.PlugInKit", "unspecified");
  uint64_t v1 = (void *)qword_18C4AE208[0];
  qword_18C4AE208[0] = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.PlugInKit", "xpc");
  id v3 = (void *)qword_18C4AE210;
  qword_18C4AE210 = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.PlugInKit", "nsextension");
  uint64_t v5 = (void *)qword_18C4AE218;
  qword_18C4AE218 = (uint64_t)v4;

  os_log_t v6 = os_log_create("com.apple.PlugInKit", "ls");
  uint64_t v7 = (void *)qword_18C4AE220;
  qword_18C4AE220 = (uint64_t)v6;

  os_log_t v8 = os_log_create("com.apple.PlugInKit", "sandbox");
  uint64_t v9 = (void *)qword_18C4AE228;
  qword_18C4AE228 = (uint64_t)v8;

  os_log_t v10 = os_log_create("com.apple.PlugInKit", "assertions");
  uint64_t v11 = (void *)qword_18C4AE230;
  qword_18C4AE230 = (uint64_t)v10;

  os_log_t v12 = os_log_create("com.apple.PlugInKit", "discovery");
  id v13 = (void *)qword_18C4AE238;
  qword_18C4AE238 = (uint64_t)v12;

  os_log_t v14 = os_log_create("com.apple.PlugInKit", "lifecycle");
  uint64_t v15 = (void *)qword_18C4AE240;
  qword_18C4AE240 = (uint64_t)v14;

  os_log_t v16 = os_log_create("com.apple.PlugInKit", "subsystems");
  id v17 = (void *)qword_18C4AE248;
  qword_18C4AE248 = (uint64_t)v16;

  os_log_t v18 = os_log_create("com.apple.PlugInKit", "cache");
  uint64_t v19 = (void *)qword_18C4AE250;
  qword_18C4AE250 = (uint64_t)v18;

  os_log_t v20 = os_log_create("com.apple.PlugInKit", "annotations");
  uint64_t v21 = (void *)qword_18C4AE258;
  qword_18C4AE258 = (uint64_t)v20;

  os_log_t v22 = os_log_create("com.apple.PlugInKit", "holds");
  uint64_t v23 = (void *)qword_18C4AE260;
  qword_18C4AE260 = (uint64_t)v22;

  os_log_t v24 = os_log_create("com.apple.PlugInKit", "manager");
  uint64_t v25 = (void *)qword_18C4AE268;
  qword_18C4AE268 = (uint64_t)v24;

  os_log_t v26 = os_log_create("com.apple.PlugInKit", "persona");
  uint64_t v27 = (void *)qword_18C4AE270;
  qword_18C4AE270 = (uint64_t)v26;

  os_log_t v28 = os_log_create("com.apple.PlugInKit", "capture");
  uint64_t v29 = (void *)qword_18C4AE278;
  qword_18C4AE278 = (uint64_t)v28;

  os_log_t v30 = os_log_create("com.apple.PlugInKit", "api_misuse");
  uint64_t v31 = (void *)qword_18C4AE280;
  qword_18C4AE280 = (uint64_t)v30;
}

void sub_186A1EFA8()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)qword_18C4AE1C0;
  qword_18C4AE1C0 = v0;
}

void sub_186A1F7C0( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

uint64_t sub_186A1F7D4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_handle(a1, a2, a3, a4, a5);
}

  ;
}

uint64_t sub_186A1FA98()
{
  return 1LL;
}

void sub_186A20184()
{
  uint64_t v0 = objc_alloc(&OBJC_CLASS___PKManager);
  uint64_t v4 = objc_msgSend_initForService_(v0, v1, 0, v2, v3);
  uint64_t v5 = (void *)qword_18C4AE1B0;
  qword_18C4AE1B0 = v4;
}

void sub_186A2027C()
{
  id v0 = objc_alloc_init(MEMORY[0x189603FC8]);
  uint64_t v1 = (void *)qword_18C697368;
  qword_18C697368 = (uint64_t)v0;

  dword_18C697370 = 0;
}

void sub_186A206B0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
}

void sub_186A206F4(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  uint64_t v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend_errorInReply_(WeakRetained, v6, (uint64_t)v4, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  pklog_handle_for_category(12);
  os_log_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend_path(*(void **)(a1 + 32), v12, v13, v14, v15);
    os_log_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    int v17 = 134218498;
    id v18 = v11;
    __int16 v19 = 2112;
    os_log_t v20 = v16;
    __int16 v21 = 2112;
    os_log_t v22 = v9;
    _os_log_impl( &dword_186A04000,  v10,  OS_LOG_TYPE_DEFAULT,  "<PKManager:%p> register plugin at [%@] completed, error = %@",  (uint8_t *)&v17,  0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_186A20A30( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
}

void sub_186A20A74(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  uint64_t v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend_errorInReply_(WeakRetained, v6, (uint64_t)v4, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  pklog_handle_for_category(12);
  os_log_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend_path(*(void **)(a1 + 32), v12, v13, v14, v15);
    os_log_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    int v17 = 134218498;
    id v18 = v11;
    __int16 v19 = 2112;
    os_log_t v20 = v16;
    __int16 v21 = 2112;
    os_log_t v22 = v9;
    _os_log_impl( &dword_186A04000,  v10,  OS_LOG_TYPE_DEFAULT,  "<PKManager:%p> unregister plugin at [%@] completed, error = %@",  (uint8_t *)&v17,  0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_186A21040( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_186A2107C(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  uint64_t v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend_errorInReply_(WeakRetained, v6, (uint64_t)v4, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  pklog_handle_for_category(12);
  os_log_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend_bundlePath(*(void **)(a1 + 32), v12, v13, v14, v15);
    os_log_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    int v17 = 134218498;
    id v18 = v11;
    __int16 v19 = 2112;
    os_log_t v20 = v16;
    __int16 v21 = 2112;
    uint64_t v22 = v9;
    _os_log_impl( &dword_186A04000,  v10,  OS_LOG_TYPE_DEFAULT,  "<PKManager:%p> register plugins in bundle at [%@] completed, error = %@",  (uint8_t *)&v17,  0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_186A21570( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_186A215AC(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  uint64_t v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend_errorInReply_(WeakRetained, v6, (uint64_t)v4, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  pklog_handle_for_category(12);
  os_log_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend_path(*(void **)(a1 + 32), v12, v13, v14, v15);
    os_log_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    int v17 = 134218498;
    id v18 = v11;
    __int16 v19 = 2112;
    uint64_t v20 = v16;
    __int16 v21 = 2112;
    uint64_t v22 = v9;
    _os_log_impl( &dword_186A04000,  v10,  OS_LOG_TYPE_DEFAULT,  "<PKManager:%p> unregister plugins in bundle at [%@] completed, error = %@",  (uint8_t *)&v17,  0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_186A21DAC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_186A21DD0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_186A21DE0(uint64_t a1)
{
}

void sub_186A21DE8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  os_log_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_186A21F9C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_186A21FC0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_186A2216C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_186A22190(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

LABEL_10:
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v13;
}

void sub_186A2236C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_186A22390(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_186A22544( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_186A22568(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

LABEL_22:
  objc_destroyWeak(&location);
}

void sub_186A2290C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

void sub_186A22940(void *a1, void *a2)
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  uint64_t v3 = (id *)(a1 + 7);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend_errorInReply_(WeakRetained, v6, (uint64_t)v4, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    xpc_dictionary_get_value(v4, "conflicts");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      id v11 = (void *)_CFXPCCreateCFObjectFromXPCObject();
      objc_msgSend_userInfo(v9, v12, v13, v14, v15);
      os_log_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      __int16 v21 = (void *)objc_msgSend_mutableCopy(v16, v17, v18, v19, v20);

      objc_msgSend_setObject_forKeyedSubscript_(v21, v22, (uint64_t)v11, (uint64_t)@"busyPlugInUUIDs", v23);
      os_log_t v24 = (void *)MEMORY[0x189607870];
      objc_msgSend_domain(v9, v25, v26, v27, v28);
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v34 = objc_msgSend_code(v9, v30, v31, v32, v33);
      uint64_t v36 = objc_msgSend_errorWithDomain_code_userInfo_(v24, v35, (uint64_t)v29, v34, (uint64_t)v21);

      uint64_t v9 = (void *)v36;
    }

    pklog_handle_for_category(11);
    id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_186A26DBC();
    }

    (*(void (**)(void))(a1[6] + 16LL))();
  }

  else
  {
    uuid = xpc_dictionary_get_uuid(v4, "uuids");

    if (uuid)
    {
      id v39 = objc_alloc(MEMORY[0x189607AB8]);
      uint64_t v9 = (void *)objc_msgSend_initWithUUIDBytes_(v39, v40, (uint64_t)uuid, v41, v42);
      pklog_handle_for_category(11);
      __int16 v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v44 = a1[4];
        uint64_t v45 = a1[5];
        uint64_t v46 = a1[8];
        int v49 = 134218754;
        uint64_t v50 = v44;
        __int16 v51 = 2112;
        uint64_t v52 = v45;
        __int16 v53 = 2048;
        uint64_t v54 = v46;
        __int16 v55 = 2114;
        uint64_t v56 = v9;
        _os_log_impl( &dword_186A04000,  v43,  OS_LOG_TYPE_DEFAULT,  "<PKManager:%p> hold request for [%@] with flags: 0x%llx completed with hold token: [%{public}@]",  (uint8_t *)&v49,  0x2Au);
      }

      (*(void (**)(void, void *, void))(a1[6] + 16LL))(a1[6], v9, 0LL);
    }

    else
    {
      pklog_handle_for_category(11);
      uint64_t v47 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT)) {
        sub_186A26D40();
      }

      uint64_t v48 = a1[6];
      pkError(4LL, @"missing hold UUID in apparently successful hold request");
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, void *))(v48 + 16))(v48, 0LL, v9);
    }
  }
}

void sub_186A22D40(_Unwind_Exception *a1)
{
}

void sub_186A22D64(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend_errorInReply_(WeakRetained, v6, (uint64_t)v4, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  pklog_handle_for_category(11);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_186A26E48();
    }
  }

  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    int v14 = 134218242;
    uint64_t v15 = v12;
    __int16 v16 = 2114;
    uint64_t v17 = v13;
    _os_log_impl( &dword_186A04000,  v11,  OS_LOG_TYPE_DEFAULT,  "<PKManager:%p> released hold [%{public}@]",  (uint8_t *)&v14,  0x16u);
  }
}

void sub_186A22FE4(_Unwind_Exception *a1)
{
}

void sub_186A23008(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v3 = (id *)(a1 + 7);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend_errorInReply_(WeakRetained, v6, (uint64_t)v4, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  pklog_handle_for_category(11);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_186A26E9C();
    }
  }

  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = a1[4];
    uint64_t v13 = a1[5];
    int v14 = 134218242;
    uint64_t v15 = v12;
    __int16 v16 = 2114;
    uint64_t v17 = v13;
    _os_log_impl( &dword_186A04000,  v11,  OS_LOG_TYPE_DEFAULT,  "<PKManager:%p> released hold [%{public}@]",  (uint8_t *)&v14,  0x16u);
  }

  (*(void (**)(void))(a1[6] + 16LL))();
}

void sub_186A232E8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
}

void sub_186A23318(void *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  uint64_t v3 = (id *)(a1 + 7);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v9 = objc_msgSend_errorInReply_(WeakRetained, v6, (uint64_t)v4, v7, v8);

  uint64_t v10 = *(void *)(a1[6] + 8LL);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  uint64_t v12 = *(void *)(*(void *)(a1[6] + 8LL) + 40LL);
  pklog_handle_for_category(11);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  int v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_186A26EF0((uint64_t)a1, (uint64_t)(a1 + 6), v14);
    }
  }

  else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = a1[4];
    uint64_t v16 = a1[5];
    int v17 = 134218242;
    uint64_t v18 = v15;
    __int16 v19 = 2114;
    uint64_t v20 = v16;
    _os_log_impl( &dword_186A04000,  v14,  OS_LOG_TYPE_DEFAULT,  "<PKManager:%p> released hold [%{public}@]",  (uint8_t *)&v17,  0x16u);
  }
}

void sub_186A235E8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_186A23614(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v3 = (id *)(a1 + 7);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend_errorInReply_(WeakRetained, v6, (uint64_t)v4, v7, v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  pklog_handle_for_category(10);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = a1[4];
    uint64_t v12 = a1[5];
    int v13 = 134218498;
    uint64_t v14 = v11;
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    uint64_t v18 = v12;
    _os_log_impl( &dword_186A04000,  v10,  OS_LOG_TYPE_DEFAULT,  "<PKManager:%p> bulk update extension states completed with error: %@ for %@",  (uint8_t *)&v13,  0x20u);
  }

  (*(void (**)(void))(a1[6] + 16LL))();
}

void sub_186A2376C(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose((const void *)(v7 - 80), 8) = a1;
}

void sub_186A237A0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

  ;
}

uint64_t sub_186A237F8()
{
  return NSRequestConcreteImplementation();
}

void sub_186A2394C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24)
{
  a23 = v26;
  a24 = v27;
  sub_186A0CA98();
  a16 = *MEMORY[0x1895F89C0];
  objc_msgSend_uuid(v28, v29, v30, v31, v32);
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_multipleInstanceUUID(v25, v34, v35, v36, v37);
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v25, v39, v40, v41, v42);
  __int16 v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_version(v25, v44, v45, v46, v47);
  objc_claimAutoreleasedReturnValue();
  sub_186A0C998();
  sub_186A0CAFC( &dword_186A04000,  v24,  v48,  "[u %{public}@:m %{public}@] [%@(%@)] Failed to encode subsystem options: %@.",  &a9);

  sub_186A0C840();
}

void sub_186A23A00(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl( &dword_186A04000,  a2,  OS_LOG_TYPE_FAULT,  "Failed to encode subsystem options: %@.",  (uint8_t *)&v2,  0xCu);
}

void sub_186A23A74( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24)
{
  a23 = v24;
  a24 = v25;
  uint64_t v27 = (os_log_s *)v26;
  uint64_t v29 = v28;
  a16 = *MEMORY[0x1895F89C0];
  objc_msgSend_uuid(v28, v26, v25, v30, v31);
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_multipleInstanceUUID(v29, v33, v34, v35, v36);
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v29, v38, v39, v40, v41);
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_version(v29, v43, v44, v45, v46);
  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requests(v29, v48, v49, v50, v51);
  uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_count(v52, v53, v54, v55, v56);
  sub_186A0CA34();
  a12 = v42;
  sub_186A0CAE4();
  sub_186A0CA68(&dword_186A04000, v27, v57, "[u %{public}@:m %{public}@] [%@(%@)] %lu current requests", &a9);

  sub_186A0C840();
}

void sub_186A23B50()
{
}

#error "186A23BEC: call analysis failed (funcsize=41)"
#error "186A23C98: call analysis failed (funcsize=41)"
#error "186A23D44: call analysis failed (funcsize=41)"
void sub_186A23D7C(os_log_t log)
{
  uint8_t v1[16];
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( &dword_186A04000,  log,  OS_LOG_TYPE_ERROR,  "Could not report plugin ready to client because the id<PKPlugIn> object went away!",  v1,  2u);
}

void sub_186A23DBC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24)
{
  a23 = v26;
  a24 = v27;
  sub_186A0CA5C();
  a16 = *MEMORY[0x1895F89C0];
  objc_msgSend_uuid(v28, v29, v30, v31, v32);
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_multipleInstanceUUID(v25, v34, v35, v36, v37);
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v25, v39, v40, v41, v42);
  __int16 v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_version(v25, v44, v45, v46, v47);
  objc_claimAutoreleasedReturnValue();
  sub_186A0C854();
  sub_186A0CACC(&dword_186A04000, v24, v48, "[u %{public}@:m %{public}@] [%@(%@)] resuming startQueue", &a9);

  sub_186A0C840();
}

#error "186A23ED8: call analysis failed (funcsize=38)"
void sub_186A23F14( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  uint8_t a9,  uint64_t a10,  uint64_t a11,  uint64_t a12,  uint64_t a13,  uint64_t a14,  uint64_t a15,  uint64_t a16,  uint64_t a17,  uint64_t a18,  uint64_t a19,  uint64_t a20,  uint64_t a21,  uint64_t a22,  uint64_t a23,  uint64_t a24)
{
  void *v24;
  void *v25;
  os_log_s *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  sub_186A0C904();
  a23 = v29;
  a24 = v30;
  sub_186A0CA8C();
  uint64_t v32 = (void *)sub_186A0C98C(v31);
  objc_msgSend_uuid(v32, v33, v34, v35, v36);
  objc_claimAutoreleasedReturnValue();
  uint64_t v37 = (void *)sub_186A0CA74();
  objc_msgSend_multipleInstanceUUID(v37, v38, v39, v40, v41);
  objc_claimAutoreleasedReturnValue();
  uint64_t v42 = (void *)sub_186A0CAA8();
  objc_msgSend_identifier(v42, v43, v44, v45, v46);
  objc_claimAutoreleasedReturnValue();
  uint64_t v47 = (void *)sub_186A0CA80();
  objc_msgSend_version(v47, v48, v49, v50, v51);
  objc_claimAutoreleasedReturnValue();
  sub_186A0C88C();
  sub_186A0C92C( &dword_186A04000,  v26,  v52,  "[u %{public}@:m %{public}@] [%@(%@)] Extension process exited while/after acquiring startup assertion",  &a9);

  sub_186A0C840();
}

void sub_186A23FC0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24)
{
  a23 = v29;
  a24 = v30;
  sub_186A0CA8C();
  uint64_t v32 = (void *)sub_186A0C98C(v31);
  objc_msgSend_uuid(v32, v33, v34, v35, v36);
  objc_claimAutoreleasedReturnValue();
  uint64_t v37 = (void *)sub_186A0CA74();
  objc_msgSend_multipleInstanceUUID(v37, v38, v39, v40, v41);
  objc_claimAutoreleasedReturnValue();
  uint64_t v42 = (void *)sub_186A0CAA8();
  objc_msgSend_identifier(v42, v43, v44, v45, v46);
  objc_claimAutoreleasedReturnValue();
  uint64_t v47 = (void *)sub_186A0CA80();
  objc_msgSend_version(v47, v48, v49, v50, v51);
  objc_claimAutoreleasedReturnValue();
  sub_186A0C88C();
  sub_186A0C92C( &dword_186A04000,  v26,  v52,  "[u %{public}@:m %{public}@] [%@(%@)] Extension process exited prematurely",  &a9);

  sub_186A0C840();
}

#error "186A240D4: call analysis failed (funcsize=38)"
#error "186A241B4: call analysis failed (funcsize=52)"
void sub_186A241F0( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  uint8_t a9,  uint64_t a10,  uint64_t a11,  uint64_t a12,  uint64_t a13,  uint64_t a14,  uint64_t a15,  uint64_t a16,  uint64_t a17,  uint64_t a18,  uint64_t a19,  uint64_t a20,  uint64_t a21,  uint64_t a22,  uint64_t a23,  uint64_t a24)
{
  void *v24;
  void *v25;
  os_log_s *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  sub_186A0C904();
  a23 = v29;
  a24 = v30;
  sub_186A0CA8C();
  uint64_t v32 = (void *)sub_186A0C98C(v31);
  objc_msgSend_uuid(v32, v33, v34, v35, v36);
  objc_claimAutoreleasedReturnValue();
  uint64_t v37 = (void *)sub_186A0CA74();
  objc_msgSend_multipleInstanceUUID(v37, v38, v39, v40, v41);
  objc_claimAutoreleasedReturnValue();
  uint64_t v42 = (void *)sub_186A0CAA8();
  objc_msgSend_identifier(v42, v43, v44, v45, v46);
  objc_claimAutoreleasedReturnValue();
  uint64_t v47 = (void *)sub_186A0CA80();
  objc_msgSend_version(v47, v48, v49, v50, v51);
  objc_claimAutoreleasedReturnValue();
  sub_186A0C88C();
  sub_186A0CACC(&dword_186A04000, v26, v52, "[u %{public}@:m %{public}@] [%@(%@)] Extension process is running", &a9);

  sub_186A0C840();
}

void sub_186A2429C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24)
{
  a23 = v29;
  a24 = v30;
  sub_186A0CA8C();
  uint64_t v32 = (void *)sub_186A0C98C(v31);
  objc_msgSend_uuid(v32, v33, v34, v35, v36);
  objc_claimAutoreleasedReturnValue();
  uint64_t v37 = (void *)sub_186A0CA74();
  objc_msgSend_multipleInstanceUUID(v37, v38, v39, v40, v41);
  objc_claimAutoreleasedReturnValue();
  uint64_t v42 = (void *)sub_186A0CAA8();
  objc_msgSend_identifier(v42, v43, v44, v45, v46);
  objc_claimAutoreleasedReturnValue();
  uint64_t v47 = (void *)sub_186A0CA80();
  objc_msgSend_version(v47, v48, v49, v50, v51);
  objc_claimAutoreleasedReturnValue();
  sub_186A0C88C();
  sub_186A0C92C( &dword_186A04000,  v26,  v52,  "[u %{public}@:m %{public}@] [%@(%@)] Extension process is not running, exited prematurely",  &a9);

  sub_186A0C840();
}

void sub_186A24348( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24)
{
  a23 = v29;
  a24 = v30;
  sub_186A0CA8C();
  uint64_t v32 = (void *)sub_186A0C98C(v31);
  objc_msgSend_uuid(v32, v33, v34, v35, v36);
  objc_claimAutoreleasedReturnValue();
  uint64_t v37 = (void *)sub_186A0CA74();
  objc_msgSend_multipleInstanceUUID(v37, v38, v39, v40, v41);
  objc_claimAutoreleasedReturnValue();
  uint64_t v42 = (void *)sub_186A0CAA8();
  objc_msgSend_identifier(v42, v43, v44, v45, v46);
  objc_claimAutoreleasedReturnValue();
  uint64_t v47 = (void *)sub_186A0CA80();
  objc_msgSend_version(v47, v48, v49, v50, v51);
  objc_claimAutoreleasedReturnValue();
  sub_186A0C88C();
  sub_186A0C92C( &dword_186A04000,  v26,  v52,  "[u %{public}@:m %{public}@] [%@(%@)] No extension state returned, extension process exited prematurely",  &a9);

  sub_186A0C840();
}

void sub_186A243F4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24)
{
  a23 = v29;
  a24 = v30;
  sub_186A0CA8C();
  uint64_t v32 = (void *)sub_186A0C98C(v31);
  objc_msgSend_uuid(v32, v33, v34, v35, v36);
  objc_claimAutoreleasedReturnValue();
  uint64_t v37 = (void *)sub_186A0CA74();
  objc_msgSend_multipleInstanceUUID(v37, v38, v39, v40, v41);
  objc_claimAutoreleasedReturnValue();
  uint64_t v42 = (void *)sub_186A0CAA8();
  objc_msgSend_identifier(v42, v43, v44, v45, v46);
  objc_claimAutoreleasedReturnValue();
  uint64_t v47 = (void *)sub_186A0CA80();
  objc_msgSend_version(v47, v48, v49, v50, v51);
  objc_claimAutoreleasedReturnValue();
  sub_186A0C88C();
  sub_186A0C92C( &dword_186A04000,  v26,  v52,  "[u %{public}@:m %{public}@] [%@(%@)] could not acquire startup assertion",  &a9);

  sub_186A0C840();
}

void sub_186A244A0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24)
{
  a23 = v29;
  a24 = v30;
  sub_186A0CA24();
  a16 = *MEMORY[0x1895F89C0];
  objc_msgSend_uuid(*(void **)(v28 + 32), v31, v32, v33, v34);
  objc_claimAutoreleasedReturnValue();
  uint64_t v35 = (void *)sub_186A0CAC0();
  objc_msgSend_multipleInstanceUUID(v35, v36, v37, v38, v39);
  objc_claimAutoreleasedReturnValue();
  uint64_t v40 = (void *)sub_186A0CAD8();
  objc_msgSend_identifier(v40, v41, v42, v43, v44);
  objc_claimAutoreleasedReturnValue();
  uint64_t v45 = (void *)sub_186A0CAB4();
  objc_msgSend_version(v45, v46, v47, v48, v49);
  objc_claimAutoreleasedReturnValue();
  sub_186A0C8C4();
  sub_186A0CAFC( &dword_186A04000,  v26,  v50,  "[u %{public}@:m %{public}@] [%@(%@)] %@ plugin object used for launch; launched plugin UUID differs from the UUID in"
    " the plugin object used for the request (most likely due to path-based fallback)",
    &a9);

  sub_186A0C840();
}

void sub_186A24550( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24)
{
  a23 = v29;
  a24 = v30;
  sub_186A0CA24();
  a16 = *MEMORY[0x1895F89C0];
  objc_msgSend_uuid(*(void **)(v28 + 32), v31, v32, v33, v34);
  objc_claimAutoreleasedReturnValue();
  uint64_t v35 = (void *)sub_186A0CAC0();
  objc_msgSend_multipleInstanceUUID(v35, v36, v37, v38, v39);
  objc_claimAutoreleasedReturnValue();
  uint64_t v40 = (void *)sub_186A0CAD8();
  objc_msgSend_identifier(v40, v41, v42, v43, v44);
  objc_claimAutoreleasedReturnValue();
  uint64_t v45 = (void *)sub_186A0CAB4();
  objc_msgSend_version(v45, v46, v47, v48, v49);
  objc_claimAutoreleasedReturnValue();
  sub_186A0C8C4();
  sub_186A0CA68( &dword_186A04000,  v26,  v50,  "[u %{public}@:m %{public}@] [%@(%@)] stale plugin object used for launch, but launched plugin found in discovery map: %@",  &a9);

  sub_186A0C840();
}

#error "186A2466C: call analysis failed (funcsize=39)"
#error "186A24720: call analysis failed (funcsize=42)"
void sub_186A24758( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  uint8_t a9,  uint64_t a10,  uint64_t a11,  uint64_t a12,  uint64_t a13,  uint64_t a14,  uint64_t a15,  uint64_t a16,  uint64_t a17,  uint64_t a18,  uint64_t a19,  uint64_t a20,  uint64_t a21,  uint64_t a22,  uint64_t a23,  uint64_t a24)
{
  os_log_s *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  sub_186A0C904();
  a23 = v26;
  a24 = v27;
  sub_186A0CA98();
  a16 = *MEMORY[0x1895F89C0];
  objc_msgSend_uuid(v28, v29, v30, v31, v32);
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_multipleInstanceUUID(v25, v34, v35, v36, v37);
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v25, v39, v40, v41, v42);
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_version(v25, v44, v45, v46, v47);
  objc_claimAutoreleasedReturnValue();
  sub_186A0C9D8();
  sub_186A0CA18( &dword_186A04000,  v24,  v48,  "[u %{public}@:m %{public}@] [%@(%@)] Hub connection error: %{public}@",  &a9);

  sub_186A0C840();
}

#error "186A24880: call analysis failed (funcsize=41)"
void sub_186A248B8( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  uint8_t a9,  uint64_t a10,  uint64_t a11,  uint64_t a12,  uint64_t a13,  uint64_t a14,  uint64_t a15,  uint64_t a16,  uint64_t a17,  uint64_t a18,  uint64_t a19,  uint64_t a20,  uint64_t a21,  uint64_t a22,  uint64_t a23,  uint64_t a24)
{
  os_log_s *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  sub_186A0C904();
  a23 = v26;
  a24 = v27;
  sub_186A0CA5C();
  a16 = *MEMORY[0x1895F89C0];
  objc_msgSend_uuid(v28, v29, v30, v31, v32);
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_multipleInstanceUUID(v25, v34, v35, v36, v37);
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v25, v39, v40, v41, v42);
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_version(v25, v44, v45, v46, v47);
  objc_claimAutoreleasedReturnValue();
  sub_186A0C854();
  sub_186A0CACC(&dword_186A04000, v24, v48, "[u %{public}@:m %{public}@] [%@(%@)] invalidated", &a9);

  sub_186A0C840();
}

#error "186A24A2C: call analysis failed (funcsize=60)"
void sub_186A24A68( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  uint8_t a9,  uint64_t a10,  uint64_t a11,  uint64_t a12,  uint64_t a13,  uint64_t a14,  uint64_t a15,  uint64_t a16,  uint64_t a17,  uint64_t a18,  uint64_t a19,  uint64_t a20,  uint64_t a21,  uint64_t a22,  uint64_t a23,  uint64_t a24)
{
  os_log_s *v24;
  void **v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  sub_186A0C904();
  a23 = v26;
  a24 = v27;
  sub_186A0CA98();
  uint64_t v29 = (void *)sub_186A0C98C(v28);
  objc_msgSend_uuid(v29, v30, v31, v32, v33);
  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_multipleInstanceUUID(*v25, v35, v36, v37, v38);
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(*v25, v40, v41, v42, v43);
  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_version(*v25, v45, v46, v47, v48);
  objc_claimAutoreleasedReturnValue();
  sub_186A0C9D8();
  sub_186A0CA18( &dword_186A04000,  v24,  v49,  "[u %{public}@:m %{public}@] [%@(%@)] Failed to start plugin; could not augment primary interface: %{public}@",
    &a9);

  sub_186A0C840();
}

#error "186A24B94: call analysis failed (funcsize=42)"
void sub_186A24BCC( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  uint8_t a9,  uint64_t a10,  uint64_t a11,  uint64_t a12,  uint64_t a13,  uint64_t a14,  uint64_t a15,  uint64_t a16,  uint64_t a17,  uint64_t a18,  uint64_t a19,  uint64_t a20,  uint64_t a21,  uint64_t a22,  uint64_t a23,  uint64_t a24)
{
  os_log_s *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  sub_186A0C904();
  a23 = v26;
  a24 = v27;
  sub_186A0CA98();
  a16 = *MEMORY[0x1895F89C0];
  objc_msgSend_uuid(v28, v29, v30, v31, v32);
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_multipleInstanceUUID(v25, v34, v35, v36, v37);
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v25, v39, v40, v41, v42);
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_version(v25, v44, v45, v46, v47);
  objc_claimAutoreleasedReturnValue();
  sub_186A0C998();
  sub_186A0CA68(&dword_186A04000, v24, v48, "[u %{public}@:m %{public}@] [%@(%@)] useBundle: [%@]", &a9);

  sub_186A0C840();
}

void sub_186A24C80( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24)
{
  a23 = v29;
  a24 = v30;
  sub_186A0CA8C();
  uint64_t v32 = (void *)sub_186A0C98C(v31);
  objc_msgSend_uuid(v32, v33, v34, v35, v36);
  objc_claimAutoreleasedReturnValue();
  uint64_t v37 = (void *)sub_186A0CA74();
  objc_msgSend_multipleInstanceUUID(v37, v38, v39, v40, v41);
  objc_claimAutoreleasedReturnValue();
  uint64_t v42 = (void *)sub_186A0CAA8();
  objc_msgSend_identifier(v42, v43, v44, v45, v46);
  objc_claimAutoreleasedReturnValue();
  uint64_t v47 = (void *)sub_186A0CA80();
  objc_msgSend_version(v47, v48, v49, v50, v51);
  uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requests(*v28, v53, v54, v55, v56);
  uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_count(v57, v58, v59, v60, v61);
  sub_186A0CA34();
  a12 = v27;
  sub_186A0CAE4();
  sub_186A0CA68(&dword_186A04000, v26, v62, "[u %{public}@:m %{public}@] [%@(%@)] %lu current requests", &a9);

  sub_186A0C840();
}

void sub_186A24D4C(void *a1, const char *a2, os_log_s *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  objc_msgSend_url(a1, a2, (uint64_t)a3, a4, a5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  int v8 = 138412546;
  uint64_t v9 = v7;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_error_impl( &dword_186A04000,  a3,  OS_LOG_TYPE_ERROR,  "unable to terminate plugin at %@: %@",  (uint8_t *)&v8,  0x16u);
}

void sub_186A24DF8()
{
}

void sub_186A24E20(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl( &dword_186A04000,  log,  OS_LOG_TYPE_ERROR,  "could not create extension point record for %@: %@",  (uint8_t *)&v3,  0x16u);
}

void sub_186A24EA4(uint64_t a1, os_log_s *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl( &dword_186A04000,  a2,  OS_LOG_TYPE_ERROR,  "Unexpected class for extension point record: %@",  (uint8_t *)&v5,  0xCu);
}

void sub_186A24F3C(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(a2 + 40);
  int v4 = 134218242;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl( &dword_186A04000,  log,  OS_LOG_TYPE_ERROR,  "<PKDiscoveryDriver:%p> error: %@",  (uint8_t *)&v4,  0x16u);
}

void sub_186A24FC4()
{
}

void sub_186A2501C()
{
}

void sub_186A25074(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  objc_msgSend_uuid(*(void **)(*(void *)(*(void *)a1 + 8) + 40), a2, a3, a4, a5);
  __int16 v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = (void *)sub_186A11BD4();
  objc_msgSend_multipleInstanceUUID(v7, v8, v9, v10, v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  int v13 = (void *)sub_186A11BD4();
  objc_msgSend_identifier(v13, v14, v15, v16, v17);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = (void *)sub_186A11BD4();
  objc_msgSend_version(v19, v20, v21, v22, v23);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v25 = (void *)sub_186A11BD4();
  int v30 = 138544386;
  uint64_t v31 = v6;
  __int16 v32 = 2114;
  uint64_t v33 = v12;
  __int16 v34 = 2112;
  uint64_t v35 = v18;
  __int16 v36 = 2112;
  uint64_t v37 = v24;
  __int16 v38 = 2048;
  uint64_t v39 = objc_msgSend_state(v25, v26, v27, v28, v29);
  _os_log_error_impl( &dword_186A04000,  (os_log_t)a2,  OS_LOG_TYPE_ERROR,  "[u %{public}@:m %{public}@] [%@(%@)] purging stale active plugin from state: %lu",  (uint8_t *)&v30,  0x34u);
}

void sub_186A25200(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl( &dword_186A04000,  log,  OS_LOG_TYPE_FAULT,  "Attempt to call back to client with nil completion block.",  v1,  2u);
}

void sub_186A25240(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v5 = objc_msgSend_path(a1, a2, a3, a4, a5);
  objc_msgSend_UTF8String(v5, v6, v7, v8, v9);
  sub_186A13D34();
  sub_186A13D20(&dword_186A04000, v10, v11, "issued file extension for [%s]", v12, v13, v14, v15, v16);

  sub_186A13D50();
}

void sub_186A252B8(void *a1)
{
  id v1 = a1;
  objc_msgSend_UTF8String(v1, v2, v3, v4, v5);
  sub_186A13D34();
  sub_186A13D20(&dword_186A04000, v6, v7, "issued mach extension for [%s]", v8, v9, v10, v11, v12);
  sub_186A13D50();
}

void sub_186A25320()
{
}

void sub_186A25374()
{
}

void sub_186A253C8()
{
}

void sub_186A2541C(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_186A04000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

void sub_186A25490()
{
}

void sub_186A254A8()
{
}

void sub_186A254D0()
{
}

void sub_186A254F8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  sub_186A18144();
  _os_log_error_impl(v5, v6, v7, v8, v9, 0x16u);
}

void sub_186A255A0(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl( &dword_186A04000,  log,  OS_LOG_TYPE_ERROR,  "plugin sdk [%{public}@] not registered for platform %u",  (uint8_t *)&v3,  0x12u);
}

void sub_186A25624( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, __int128 a10, void *a11, __int128 a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22)
{
  a21 = v22;
  a22 = v23;
  uint64_t v25 = (os_log_s *)v24;
  uint64_t v27 = v26;
  a14 = *MEMORY[0x1895F89C0];
  objc_msgSend_uuid(v26, v28, v24, v23, v29);
  int v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v27, v31, v32, v33, v34);
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_version(v27, v36, v37, v38, v39);
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v41 = (objc_class *)objc_opt_class();
  NSStringFromClass(v41);
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
  sub_186A181A0();
  *(void *)((char *)&a10 + 6) = v35;
  HIWORD(a10) = v43;
  a11 = v40;
  LOWORD(a12) = 2114;
  *(void *)((char *)&a12 + 2) = v44;
  _os_log_error_impl( &dword_186A04000,  v25,  OS_LOG_TYPE_ERROR,  "[u %{public}@] [%@(%@)] invalid NSExtensionPointIdentifier: [%{public}@]",  &a9,  0x2Au);

  sub_186A180C0();
}

void sub_186A25710(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_186A04000, log, OS_LOG_TYPE_ERROR, "could not get kern.bootsessionuuid", v1, 2u);
}

void sub_186A25750( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, __int128 a10, void *a11, __int128 a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22)
{
  a21 = v22;
  a22 = v23;
  uint64_t v25 = (os_log_s *)v24;
  uint64_t v27 = (char *)v26;
  uint64_t v29 = v28;
  a14 = *MEMORY[0x1895F89C0];
  objc_msgSend_uuid(v28, v26, v24, v23, v30);
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v29, v32, v33, v34, v35);
  __int16 v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_version(v29, v37, v38, v39, v40);
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v27, v42, (uint64_t)@"annotations", v43, v44);
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
  sub_186A181A0();
  *(void *)((char *)&a10 + 6) = v36;
  HIWORD(a10) = v46;
  a11 = v41;
  LOWORD(a12) = 2080;
  *(void *)((char *)&a12 + 2) = "-[PKPlugInCore updateFromForm:]";
  WORD5(a12) = v46;
  *(void *)((char *)&a12 + 12) = v47;
  _os_log_debug_impl( &dword_186A04000,  v25,  OS_LOG_TYPE_DEBUG,  "[u %{public}@] [%@(%@)] %s got annotation from form: %@",  &a9,  0x34u);

  sub_186A180C0();
}

void sub_186A25850()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_186A18144();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0xCu);
}

#error "186A2593C: call analysis failed (funcsize=34)"
#error "186A259CC: call analysis failed (funcsize=34)"
void sub_186A25A00(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  os_log_t v17;
  os_log_type_t v18;
  const char *v19;
  uint8_t *v20;
  objc_msgSend_uuid(a1, a2, a3, a4, a5);
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(a1, v7, v8, v9, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_version(a1, v12, v13, v14, v15);
  objc_claimAutoreleasedReturnValue();
  sub_186A18108();
  sub_186A18144();
  _os_log_error_impl(v16, v17, v18, v19, v20, 0x20u);

  sub_186A18190();
}

#error "186A25B30: call analysis failed (funcsize=45)"
#error "186A25BC0: call analysis failed (funcsize=34)"
void sub_186A25BF4(void *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t v17[40];
  uint64_t v18;
  uint64_t v18 = *MEMORY[0x1895F89C0];
  objc_msgSend_uuid(a1, a2, a3, a4, a5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(a1, v8, v9, v10, v11);
  uint8_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_version(a1, v13, v14, v15, v16);
  objc_claimAutoreleasedReturnValue();
  sub_186A18108();
  _os_log_debug_impl( &dword_186A04000,  (os_log_t)a2,  OS_LOG_TYPE_DEBUG,  "[u %{public}@] [%@(%@)] no actions found in pkdict",  v17,  0x20u);

  sub_186A18190();
}

void sub_186A25CA0()
{
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(*(void **)(v0 + 48), v7, v8, v9, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_version(*(void **)(v0 + 48), v12, v13, v14, v15);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  sub_186A18144();
  _os_log_error_impl(v16, v17, v18, v19, v20, 0x2Au);

  sub_186A180C0();
}

void sub_186A25D74()
{
  uint64_t v8 = (void *)sub_186A1A140();
  objc_msgSend_identifier(v8, v9, v10, v11, v12);
  objc_claimAutoreleasedReturnValue();
  uint64_t v13 = (void *)sub_186A1A134();
  objc_msgSend_version(v13, v14, v15, v16, v17);
  objc_claimAutoreleasedReturnValue();
  sub_186A1A040();
  sub_186A1A0A4( &dword_186A04000,  v18,  v19,  "[u %{public}@] [%@(%@)] failed to construct service personality: %{public}@",  v20,  v21,  v22,  v23,  v24);

  sub_186A1A0B8();
}

void sub_186A25E08()
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v0[4], v7, v8, v9, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_version(v0[4], v12, v13, v14, v15);
  objc_claimAutoreleasedReturnValue();
  sub_186A1A0CC();
  sub_186A1A0A4( &dword_186A04000,  v16,  v17,  "[u %{public}@] [%@(%@)] failed to prepare plug-in, unable to tell legacy client: %@",  v18,  v19,  v20,  v21,  v22);

  sub_186A1A0B8();
}

void sub_186A25EA8(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(a1, v7, v8, v9, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_version(a1, v12, v13, v14, v15);
  objc_claimAutoreleasedReturnValue();
  sub_186A1A078();
  sub_186A1A100( &dword_186A04000,  v16,  v17,  "[u %{public}@] [%@(%@)] unable to create service principal",  v18,  v19,  v20,  v21,  v22);

  sub_186A1A124();
}

void sub_186A25F44()
{
  uint64_t v8 = (void *)sub_186A1A140();
  objc_msgSend_identifier(v8, v9, v10, v11, v12);
  objc_claimAutoreleasedReturnValue();
  uint64_t v13 = (void *)sub_186A1A134();
  objc_msgSend_version(v13, v14, v15, v16, v17);
  objc_claimAutoreleasedReturnValue();
  sub_186A1A0CC();
  sub_186A1A0A4( &dword_186A04000,  v18,  v19,  "[u %{public}@] [%@(%@)] augmentInterface failed: %@",  v20,  v21,  v22,  v23,  v24);

  sub_186A1A0B8();
}

void sub_186A25FD8(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(a1, v7, v8, v9, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_version(a1, v12, v13, v14, v15);
  objc_claimAutoreleasedReturnValue();
  sub_186A1A078();
  sub_186A1A100( &dword_186A04000,  v16,  v17,  "[u %{public}@] [%@(%@)] missing protocol specification in Info.plist",  v18,  v19,  v20,  v21,  v22);

  sub_186A1A124();
}

void sub_186A26074(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(a1, v7, v8, v9, v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_version(a1, v12, v13, v14, v15);
  objc_claimAutoreleasedReturnValue();
  sub_186A1A078();
  sub_186A1A100( &dword_186A04000,  v16,  v17,  "[u %{public}@] [%@(%@)] principal class not specified in Info.plist",  v18,  v19,  v20,  v21,  v22);

  sub_186A1A124();
}

void sub_186A26110()
{
  uint64_t v8 = (void *)sub_186A1A140();
  objc_msgSend_identifier(v8, v9, v10, v11, v12);
  objc_claimAutoreleasedReturnValue();
  uint64_t v13 = (void *)sub_186A1A134();
  objc_msgSend_version(v13, v14, v15, v16, v17);
  objc_claimAutoreleasedReturnValue();
  sub_186A1A040();
  sub_186A1A0A4( &dword_186A04000,  v18,  v19,  "[u %{public}@] [%@(%@)] principal class %{public}@ not found",  v20,  v21,  v22,  v23,  v24);

  sub_186A1A0B8();
}

void sub_186A261A4()
{
  uint64_t v8 = (void *)sub_186A1A140();
  objc_msgSend_identifier(v8, v9, v10, v11, v12);
  objc_claimAutoreleasedReturnValue();
  uint64_t v13 = (void *)sub_186A1A134();
  objc_msgSend_version(v13, v14, v15, v16, v17);
  objc_claimAutoreleasedReturnValue();
  sub_186A1A040();
  sub_186A1A0A4( &dword_186A04000,  v18,  v19,  "[u %{public}@] [%@(%@)] principal class %{public}@ failed to instantiate",  v20,  v21,  v22,  v23,  v24);

  sub_186A1A0B8();
}

void sub_186A26238( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_186A262A4()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_186A1C738();
}

void sub_186A262F8()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_186A1C738();
}

void sub_186A2634C()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_186A1C738();
}

void sub_186A263A0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl( &dword_186A04000,  log,  OS_LOG_TYPE_FAULT,  "Bootstrapping; Error: Unexpected class for bootstrap for key 'SUBSYSTEM_OPTIONS'. This value must be an NSDictionary.",
    v1,
    2u);
}

void sub_186A263E0()
{
    v1,
    0xCu);
  sub_186A1C738();
}

void sub_186A26440()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_186A1C738();
}

void sub_186A26494()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_186A1C738();
}

void sub_186A264E8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_186A26558(void *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  objc_msgSend_personalities(a1, a2, a3, a4, a5);
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_186A1C740();
  _os_log_error_impl( &dword_186A04000,  (os_log_t)a2,  OS_LOG_TYPE_ERROR,  "WARNING! Sole personality requested when nil; THIS MAY BE A SPURIOUS LAUNCH OF THE PLUGIN due to a message to an XPC"
    " endpoint other than the main service endpoint; personalities: %@",
    v7,
    0xCu);
}

void sub_186A265E0(void *a1, char *a2, os_log_s *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  objc_msgSend_uuid(a1, a2, (uint64_t)a3, a4, a5);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(a1, v9, v10, v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_version(a1, v14, v15, v16, v17);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_personalities(a2, v19, v20, v21, v22);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  int v24 = 138544130;
  uint64_t v25 = v8;
  __int16 v26 = 2112;
  uint64_t v27 = v13;
  __int16 v28 = 2112;
  uint64_t v29 = v18;
  __int16 v30 = 2112;
  uint64_t v31 = v23;
  _os_log_error_impl( &dword_186A04000,  a3,  OS_LOG_TYPE_ERROR,  "[u %{public}@] [%@(%@)] WARNING! Sole personality is ambiguous; this may lead to erratic behavior; personalities: %@",
    (uint8_t *)&v24,
    0x2Au);
}

void sub_186A266E4()
{
}

void sub_186A2673C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( &dword_186A04000,  log,  OS_LOG_TYPE_ERROR,  "Bootstrapping; failed to get my own sandbox container",
    v1,
    2u);
}

void sub_186A2677C(uint64_t a1)
{
  sub_186A1E5BC();
}

void sub_186A267F0()
{
}

void sub_186A26848(uint64_t a1)
{
  sub_186A1E5BC();
}

void sub_186A268BC()
{
}

void sub_186A26914(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_186A1ECA8( &dword_186A04000,  v6,  v7,  "unexpectedly succeeded in getting LSApplicationExtensionRecord : %{public}@ when initializing appex bundle at %{public}@ failed",  v8,  v9,  v10,  v11,  2u);

  sub_186A1ECBC();
}

void sub_186A269A4()
{
}

void sub_186A26A30(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_186A1ECA8( &dword_186A04000,  v6,  v7,  "failed to convert Info.plist to dictionary: %@ source=%@",  v8,  v9,  v10,  v11,  2u);

  sub_186A1ECBC();
}

void sub_186A26AC0(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__bundle(a1, v7, v8, v9, v10);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  sub_186A1ECA8(&dword_186A04000, v11, v12, "failed to retrieve Info.plist for %@ through %@", v13, v14, v15, v16, 2u);

  sub_186A1ECBC();
}

void sub_186A26B64(os_log_s *a1)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl( &dword_186A04000,  a1,  OS_LOG_TYPE_ERROR,  "failed to consume extension, errno=%{darwin.errno}d",  (uint8_t *)v3,  8u);
}

void sub_186A26BEC(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

void sub_186A26C4C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

void sub_186A26CAC(void *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = sub_186A1F7D4(a1, a2, a3, a4, a5);
  int v7 = *__error();
  int v8 = 134218240;
  uint64_t v9 = v6;
  __int16 v10 = 1024;
  int v11 = v7;
  _os_log_error_impl( &dword_186A04000,  (os_log_t)a2,  OS_LOG_TYPE_ERROR,  "failed to release extension %ld - errno=%{darwin.errno}d",  (uint8_t *)&v8,  0x12u);
  sub_186A1F7B4();
}

void sub_186A26D40()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  sub_186A237B4();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_fault_impl( &dword_186A04000,  v1,  OS_LOG_TYPE_FAULT,  "<PKManager:%p> hold request for [%@] with flags: 0x%llx returned no hold token",  v2,  0x20u);
  sub_186A237D0();
}

void sub_186A26DBC()
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  sub_186A237B4();
  __int16 v5 = 2048;
  uint64_t v6 = v0;
  __int16 v7 = v1;
  uint64_t v8 = v2;
  _os_log_error_impl( &dword_186A04000,  v3,  OS_LOG_TYPE_ERROR,  "<PKManager:%p> hold request for [%@] with flags: 0x%llx completed with error: %@",  v4,  0x2Au);
}

void sub_186A26E48()
{
}

void sub_186A26E9C()
{
}

void sub_186A26EF0(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)os_log_t v3 = 134218498;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = *(void *)(a1 + 40);
  *(_WORD *)&v3[22] = 2112;
  sub_186A237A0( &dword_186A04000,  a2,  a3,  "<PKManager:%p> failed to release hold [%{public}@] with error: %@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16],  *(void *)(*(void *)(*(void *)a2 + 8LL) + 40LL));
  sub_186A237D0();
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1896027F0](bundle);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1896028D0](bundle);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x189602F58](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x189602F68](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopRun(void)
{
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x189607458](aClassName);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1896076C8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x189607700](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCreateWithExecutableURLIfLooksLikeBundle()
{
  return MEMORY[0x189604170]();
}

uint64_t _CFXPCCreateCFObjectFromXPCMessage()
{
  return MEMORY[0x189604820]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x189604828]();
}

uint64_t _CFXPCCreateXPCMessageWithCFObject()
{
  return MEMORY[0x189604830]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x189604838]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

os_activity_t _os_activity_create( void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1895F8D40](dso, description, activity, *(void *)&flags);
}

uint64_t _os_crash()
{
  return MEMORY[0x1895F8D78]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1895F8D88]();
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

void _os_signpost_emit_with_name_impl( void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1895F9328](a1, *(void *)&a2);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return (dispatch_queue_t)MEMORY[0x1895FAC38]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency( dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD68](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FAE50](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer( dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

uint64_t dyld_get_active_platform()
{
  return MEMORY[0x1895FAFD8]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1895FB088]();
}

void exit(int a1)
{
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FB538](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1895FB540]();
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1895FB670](*(void *)&a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1895FB6E8]();
}

uint64_t launch_add_external_service()
{
  return MEMORY[0x1895FB920]();
}

uint64_t launch_copy_busy_extension_instances()
{
  return MEMORY[0x1895FB928]();
}

uint64_t launch_copy_extension_properties()
{
  return MEMORY[0x1895FB930]();
}

uint64_t launch_copy_extension_properties_for_pid()
{
  return MEMORY[0x1895FB938]();
}

uint64_t launch_remove_external_service()
{
  return MEMORY[0x1895FB9A0]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1895FBAB0]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1895FBB28](*(void *)&task, *(void *)&name);
}

mach_port_t mach_thread_self(void)
{
  return MEMORY[0x1895FBBF0]();
}

uint64_t memorystatus_control()
{
  return MEMORY[0x1895FBE40]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1895FC188](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1895FC1B0](name);
}

uint32_t notify_register_dispatch( const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1895FC1C0](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

Protocol *__cdecl objc_allocateProtocol(const char *name)
{
  return (Protocol *)MEMORY[0x1896165D0](name);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1896166B8](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1896166C8](self, _cmd, offset, atomic);
}

Protocol *__cdecl objc_getProtocol(const char *name)
{
  return (Protocol *)MEMORY[0x1896166D0](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1896166D8](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x189616700](location);
}

Class objc_lookUpClass(const char *name)
{
  return (Class)MEMORY[0x189616708](name);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x189616740]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x189616748]();
}

void objc_registerProtocol(Protocol *proto)
{
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x189616978](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x189616980](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616990](a1);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1895FC600](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1895FC608](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1895FC610](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1895FC6C8]();
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1895FC8E8](*(void *)&pid, buffer, *(void *)&buffersize);
}

void protocol_addProtocol(Protocol *proto, Protocol *addition)
{
}

const char *__cdecl protocol_getName(Protocol *p)
{
  return (const char *)MEMORY[0x189616A40](p);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1895FCD90]();
}

uint64_t sandbox_container_path_for_pid()
{
  return MEMORY[0x1895FCDA8]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1895FCDB0]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1895FCDB8]();
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x1895FCDC0]();
}

uint64_t sandbox_extension_issue_mach_to_process()
{
  return MEMORY[0x1895FCDC8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1895FCDD0]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}

kern_return_t thread_info( thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x1895FD3B0](*(void *)&target_act, *(void *)&flavor, thread_info_out, thread_info_outCnt);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1895FD7C8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FD7D8](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1895FD808](xarray);
}

const uint8_t *__cdecl xpc_array_get_uuid(xpc_object_t xarray, size_t index)
{
  return (const uint8_t *)MEMORY[0x1895FD850](xarray, index);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

void xpc_array_set_uint64(xpc_object_t xarray, size_t index, uint64_t value)
{
}

void xpc_array_set_uuid(xpc_object_t xarray, size_t index, const unsigned __int8 *uuid)
{
}

uint64_t xpc_bundle_create()
{
  return MEMORY[0x1895FD8D0]();
}

uint64_t xpc_bundle_create_main()
{
  return MEMORY[0x1895FD8D8]();
}

uint64_t xpc_bundle_get_error()
{
  return MEMORY[0x1895FD8E0]();
}

uint64_t xpc_bundle_get_info_dictionary()
{
  return MEMORY[0x1895FD8F0]();
}

uint64_t xpc_bundle_get_property()
{
  return MEMORY[0x1895FD8F8]();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1895FD968](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message_with_reply( xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1895FD9F0](connection, message);
}

uint64_t xpc_connection_set_bootstrap()
{
  return MEMORY[0x1895FDA00]();
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

uint64_t xpc_connection_set_oneshot_instance()
{
  return MEMORY[0x1895FDA38]();
}

uint64_t xpc_connection_set_target_uid()
{
  return MEMORY[0x1895FDA58]();
}

uint64_t xpc_copy_bootstrap()
{
  return MEMORY[0x1895FDA78]();
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1895FDB20](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1895FDB30](xdata);
}

int64_t xpc_date_get_value(xpc_object_t xdate)
{
  return MEMORY[0x1895FDB58](xdate);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1895FDB78](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FDB98](keys, values, count);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1895FDBD0](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1895FDBF8](xdict);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDC20](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1895FDC48](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDC50](xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return (const uint8_t *)MEMORY[0x1895FDC58](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1895FDC68](xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  return result;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}

uint64_t xpc_init_services()
{
  return MEMORY[0x1895FDE98]();
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1895FDEC8](xint);
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1895FE040]();
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1895FE080](xstring);
}

uint64_t xpc_transaction_exit_clean()
{
  return MEMORY[0x1895FE0A8]();
}

uint64_t xpc_transaction_interrupt_clean_exit()
{
  return MEMORY[0x1895FE0B0]();
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return (const char *)MEMORY[0x1895FE0C0](type);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1895FE0E0](xuint);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x1895FE110](xuuid);
}

uint64_t objc_msgSend__createOrConvertToMutableDictionaryFromDictionary_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel__createOrConvertToMutableDictionaryFromDictionary_, a3, a4, a5);
}

uint64_t objc_msgSend__findPlugInByUUID_synchronously_reply_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel__findPlugInByUUID_synchronously_reply_, a3, a4, a5);
}

uint64_t objc_msgSend__loadLocalizedFileProviderActionNames( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel__loadLocalizedFileProviderActionNames, a3, a4, a5);
}

uint64_t objc_msgSend__localizedFileProviderActionNamesForPKDict_fromBundle_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel__localizedFileProviderActionNamesForPKDict_fromBundle_, a3, a4, a5);
}

uint64_t objc_msgSend__overlayCustomValueAtKeyPath_intoTargetDictionary_fromSourceDictionary_handler_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718]( a1,  sel__overlayCustomValueAtKeyPath_intoTargetDictionary_fromSourceDictionary_handler_,  a3,  a4,  a5);
}

uint64_t objc_msgSend__overlayValueAtKey_intoTargetDictionary_fromSourceDictionary_targetTakePrecedent_nestedDictionaryHandler_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718]( a1,  sel__overlayValueAtKey_intoTargetDictionary_fromSourceDictionary_targetTakePrecedent_nestedDictionaryHandler_,  a3,  a4,  a5);
}

uint64_t objc_msgSend__performWithPreviousResults_forceNotify_uninstalledProxies_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel__performWithPreviousResults_forceNotify_uninstalledProxies_, a3, a4, a5);
}

uint64_t objc_msgSend__prepareToRunUsingServiceListener_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel__prepareToRunUsingServiceListener_, a3, a4, a5);
}

uint64_t objc_msgSend_accessPlugIns_synchronously_flags_extensions_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_accessPlugIns_synchronously_flags_extensions_, a3, a4, a5);
}

uint64_t objc_msgSend_accessPlugIns_synchronously_flags_reply_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_accessPlugIns_synchronously_flags_reply_, a3, a4, a5);
}

uint64_t objc_msgSend_addObserverForName_object_queue_usingBlock_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_addObserverForName_object_queue_usingBlock_, a3, a4, a5);
}

uint64_t objc_msgSend_containingAppForExtensionProperties_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_containingAppForExtensionProperties_, a3, a4, a5);
}

uint64_t objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, a3, a4, a5);
}

uint64_t objc_msgSend_copy_extension_properties_for_pid_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_copy_extension_properties_for_pid_, a3, a4, a5);
}

uint64_t objc_msgSend_countByEnumeratingWithState_objects_count_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_countByEnumeratingWithState_objects_count_, a3, a4, a5);
}

uint64_t objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, a3, a4, a5);
}

uint64_t objc_msgSend_dictionaryWithObjects_forKeys_count_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_dictionaryWithObjects_forKeys_count_, a3, a4, a5);
}

uint64_t objc_msgSend_discoverPlugInsForAttributes_flags_found_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_discoverPlugInsForAttributes_flags_found_, a3, a4, a5);
}

uint64_t objc_msgSend_discoverSubsystemNamed_options_required_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_discoverSubsystemNamed_options_required_, a3, a4, a5);
}

uint64_t objc_msgSend_enumeratorForExtensionPointIdentifier_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_enumeratorForExtensionPointIdentifier_, a3, a4, a5);
}

uint64_t objc_msgSend_enumeratorWithExtensionPointRecord_options_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_enumeratorWithExtensionPointRecord_options_, a3, a4, a5);
}

uint64_t objc_msgSend_extensionPointForIdentifier_platform_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_extensionPointForIdentifier_platform_, a3, a4, a5);
}

uint64_t objc_msgSend_findPlugInByUUID_synchronously_reply_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_findPlugInByUUID_synchronously_reply_, a3, a4, a5);
}

uint64_t objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_handleFailureInMethod_object_file_lineNumber_description_, a3, a4, a5);
}

uint64_t objc_msgSend_holdPlugInsWithExtensionPointName_platforms_terminate_error_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_holdPlugInsWithExtensionPointName_platforms_terminate_error_, a3, a4, a5);
}

uint64_t objc_msgSend_holdPlugins_extensionPointName_platforms_flags_reply_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_holdPlugins_extensionPointName_platforms_flags_reply_, a3, a4, a5);
}

uint64_t objc_msgSend_holdRequest_extensionPointName_platforms_flags_result_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_holdRequest_extensionPointName_platforms_flags_result_, a3, a4, a5);
}

uint64_t objc_msgSend_initFileURLWithFileSystemRepresentation_isDirectory_relativeToURL_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_initFileURLWithFileSystemRepresentation_isDirectory_relativeToURL_, a3, a4, a5);
}

uint64_t objc_msgSend_initWithAttributes_flags_host_report_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithAttributes_flags_host_report_, a3, a4, a5);
}

uint64_t objc_msgSend_initWithBundleIdentifier_requireValid_error_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithBundleIdentifier_requireValid_error_, a3, a4, a5);
}

uint64_t objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithBytesNoCopy_length_encoding_freeWhenDone_, a3, a4, a5);
}

uint64_t objc_msgSend_initWithContentsOfURL_options_error_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithContentsOfURL_options_error_, a3, a4, a5);
}

uint64_t objc_msgSend_initWithDaemon_externalProviders_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithDaemon_externalProviders_, a3, a4, a5);
}

uint64_t objc_msgSend_initWithIdentifier_platform_error_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithIdentifier_platform_error_, a3, a4, a5);
}

uint64_t objc_msgSend_localizedStringForKey_value_table_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_localizedStringForKey_value_table_, a3, a4, a5);
}

uint64_t objc_msgSend_mergeSDKDictionary_intoExtensionDictionary_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_mergeSDKDictionary_intoExtensionDictionary_, a3, a4, a5);
}

uint64_t objc_msgSend_objectForInfoDictionaryKey_ofClass_inScope_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_objectForInfoDictionaryKey_ofClass_inScope_, a3, a4, a5);
}

uint64_t objc_msgSend_performWithPreviousResults_forceNotify_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_performWithPreviousResults_forceNotify_, a3, a4, a5);
}

uint64_t objc_msgSend_pk_overlayDictionary_existingValuesTakePrecedent_exceptKeyPaths_exemptionHandler_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718]( a1,  sel_pk_overlayDictionary_existingValuesTakePrecedent_exceptKeyPaths_exemptionHandler_,  a3,  a4,  a5);
}

uint64_t objc_msgSend_pluginsMatchingQuery_applyFilter_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_pluginsMatchingQuery_applyFilter_, a3, a4, a5);
}

uint64_t objc_msgSend_prefsObjectForKey_inPlugIn_result_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_prefsObjectForKey_inPlugIn_result_, a3, a4, a5);
}

uint64_t objc_msgSend_prefsSetObject_forKey_inPlugIn_result_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_prefsSetObject_forKey_inPlugIn_result_, a3, a4, a5);
}

uint64_t objc_msgSend_preparePlugInUsingService_completion_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_preparePlugInUsingService_completion_, a3, a4, a5);
}

uint64_t objc_msgSend_prepareUsingPlugIn_hostProtocol_reply_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_prepareUsingPlugIn_hostProtocol_reply_, a3, a4, a5);
}

uint64_t objc_msgSend_processAssertionWithPID_flags_reason_name_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_processAssertionWithPID_flags_reason_name_, a3, a4, a5);
}

uint64_t objc_msgSend_readSDKDictionary_forPlatform_externalProviders_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_readSDKDictionary_forPlatform_externalProviders_, a3, a4, a5);
}

uint64_t objc_msgSend_readyPlugIns_synchronously_environment_languages_persona_sandbox_ready_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718]( a1,  sel_readyPlugIns_synchronously_environment_languages_persona_sandbox_ready_,  a3,  a4,  a5);
}

uint64_t objc_msgSend_readyPlugIns_synchronously_flags_environment_languages_persona_sandbox_reply_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718]( a1,  sel_readyPlugIns_synchronously_flags_environment_languages_persona_sandbox_reply_,  a3,  a4,  a5);
}

uint64_t objc_msgSend_remoteObjectProxyWithErrorHandler_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_remoteObjectProxyWithErrorHandler_, a3, a4, a5);
}

uint64_t objc_msgSend_resolveSDKWithInfoPlist_extensionPointCache_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_resolveSDKWithInfoPlist_extensionPointCache_, a3, a4, a5);
}

uint64_t objc_msgSend_rewriteDiscoveryAttributes_flags_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_rewriteDiscoveryAttributes_flags_, a3, a4, a5);
}

uint64_t objc_msgSend_sandbox_container_path_for_pid_buffer_bufsize_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_sandbox_container_path_for_pid_buffer_bufsize_, a3, a4, a5);
}

uint64_t objc_msgSend_sdkDictionaryWithInfoPlist_extensionPointCache_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_sdkDictionaryWithInfoPlist_extensionPointCache_, a3, a4, a5);
}

uint64_t objc_msgSend_sendSynchronously_request_reply_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_sendSynchronously_request_reply_, a3, a4, a5);
}

uint64_t objc_msgSend_sendSynchronously_request_retry_reply_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_sendSynchronously_request_retry_reply_, a3, a4, a5);
}

uint64_t objc_msgSend_setBootstrapWithSubsystemOptions_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_setBootstrapWithSubsystemOptions_, a3, a4, a5);
}

uint64_t objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_setClasses_forSelector_argumentIndex_ofReply_, a3, a4, a5);
}

uint64_t objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_setInterface_forSelector_argumentIndex_ofReply_, a3, a4, a5);
}

uint64_t objc_msgSend_setPluginAnnotations_annotations_reply_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_setPluginAnnotations_annotations_reply_, a3, a4, a5);
}

uint64_t objc_msgSend_setupWithIdentifier_extensionPointPlatform_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_setupWithIdentifier_extensionPointPlatform_, a3, a4, a5);
}

uint64_t objc_msgSend_setupWithName_extensionPointPlatform_url_bundleInfo_uuid_discoveryInstanceUUID_extensionPointCache_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718]( a1,  sel_setupWithName_extensionPointPlatform_url_bundleInfo_uuid_discoveryInstanceUUID_extensionPointCache_,  a3,  a4,  a5);
}

uint64_t objc_msgSend_startPlugInRequest_synchronously_subsystemOptions_completion_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_startPlugInRequest_synchronously_subsystemOptions_completion_, a3, a4, a5);
}

uint64_t objc_msgSend_statesForPredicate_withDescriptor_error_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_statesForPredicate_withDescriptor_error_, a3, a4, a5);
}

uint64_t objc_msgSend_supportsAutoreleasePoolDuringPlugInLaunch( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_supportsAutoreleasePoolDuringPlugInLaunch, a3, a4, a5);
}

uint64_t objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_synchronousRemoteObjectProxyWithErrorHandler_, a3, a4, a5);
}

uint64_t objc_msgSend_xpc_transaction_interrupt_clean_exit( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return MEMORY[0x189616718](a1, sel_xpc_transaction_interrupt_clean_exit, a3, a4, a5);
}
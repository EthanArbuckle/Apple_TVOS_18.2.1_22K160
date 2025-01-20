uint64_t AppleHPMLibRT13Interface::forceATCRTUpdateModeCIO(AppleHPMLibRT13Interface *this, unsigned int a2)
{
  uint64_t v4;
  int v5;
  uint64_t updated;
  uint64_t v7;
  int v8;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  if (*((_BYTE *)this + 25) && (*((_BYTE *)this + 32) & 2) != 0)
  {
    printf( "AppleHPMLibRT13Interface::%s@0x%llx RID%u - entry. enable = 0x%X\n\n",  "forceATCRTUpdateModeCIO",  *((void *)this + 2),  *((_DWORD *)this + 10),  a2);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *((void *)this + 2);
    v5 = *((_DWORD *)this + 10);
    *(_DWORD *)buf = 136315906;
    v11 = "forceATCRTUpdateModeCIO";
    v12 = 2048;
    v13 = v4;
    v14 = 1024;
    v15 = v5;
    v16 = 1024;
    v17 = a2;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "AppleHPMLibRT13Interface::%s@0x%llx RID%u - entry. enable = 0x%X\n\n",  buf,  0x22u);
  }

  updated = AppleHPMLibPriv::forceUpdateMode(*((AppleHPMLibPriv **)this + 1), *((void *)this + 2), a2);
  if ((_DWORD)updated)
  {
    if (*((_BYTE *)this + 25))
    {
      printf( "AppleHPMLibRT13Interface::%s@0x%llx RID%u - Forcing CIO + USB2 failed\n\n",  "forceATCRTUpdateModeCIO",  *((void *)this + 2),  *((_DWORD *)this + 10));
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_6AD0();
    }

    if (*((_BYTE *)this + 24)) {
      AppleHPMLibRTInterface::triggerSystemPanic(this, "AppleHPMLibRTUpdaterInterface - forcing CIO + USB2 failed\n");
    }
  }

  if (*((_BYTE *)this + 25) && (*((_BYTE *)this + 32) & 2) != 0)
  {
    printf( "AppleHPMLibRT13Interface::%s@0x%llx RID%u - exit status=0x%X\n\n",  "forceATCRTUpdateModeCIO",  *((void *)this + 2),  *((_DWORD *)this + 10),  updated);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *((void *)this + 2);
    v8 = *((_DWORD *)this + 10);
    *(_DWORD *)buf = 136315906;
    v11 = "forceATCRTUpdateModeCIO";
    v12 = 2048;
    v13 = v7;
    v14 = 1024;
    v15 = v8;
    v16 = 1024;
    v17 = updated;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "AppleHPMLibRT13Interface::%s@0x%llx RID%u - exit status=0x%X\n\n",  buf,  0x22u);
  }

  return updated;
}

uint64_t AppleHPMLibRT13Interface::forceATCRTPower(AppleHPMLibRT13Interface *this, int a2)
{
  if (*((_BYTE *)this + 25) && (*((_BYTE *)this + 32) & 2) != 0)
  {
    printf( "AppleHPMLibRT13Interface::%s@0x%llx RID%u - entry. enable = 0x%X\n\n",  "forceATCRTPower",  *((void *)this + 2),  *((_DWORD *)this + 10),  a2);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *((void *)this + 2);
    int v5 = *((_DWORD *)this + 10);
    *(_DWORD *)buf = 136315906;
    v11 = "forceATCRTPower";
    __int16 v12 = 2048;
    uint64_t v13 = v4;
    __int16 v14 = 1024;
    int v15 = v5;
    __int16 v16 = 1024;
    int v17 = a2;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "AppleHPMLibRT13Interface::%s@0x%llx RID%u - entry. enable = 0x%X\n\n",  buf,  0x22u);
  }

  else {
    uint64_t v6 = 0LL;
  }
  if (*((_BYTE *)this + 25) && (*((_BYTE *)this + 32) & 2) != 0)
  {
    printf( "AppleHPMLibRT13Interface::%s@0x%llx RID%u - exit status=0x%X\n\n",  "forceATCRTPower",  *((void *)this + 2),  *((_DWORD *)this + 10),  v6);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *((void *)this + 2);
    int v8 = *((_DWORD *)this + 10);
    *(_DWORD *)buf = 136315906;
    v11 = "forceATCRTPower";
    __int16 v12 = 2048;
    uint64_t v13 = v7;
    __int16 v14 = 1024;
    int v15 = v8;
    __int16 v16 = 1024;
    int v17 = v6;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "AppleHPMLibRT13Interface::%s@0x%llx RID%u - exit status=0x%X\n\n",  buf,  0x22u);
  }

  return v6;
}

uint64_t AppleHPMLibRT13Interface::forceATCRTUpdateMode( AppleHPMLibRT13Interface *this, uint64_t a2, uint64_t a3)
{
  if (*((_BYTE *)this + 25) && (*((_BYTE *)this + 32) & 2) != 0)
  {
    printf( "AppleHPMLibRT13Interface::%s@0x%llx RID%u - entry. enable = 0x%X\n\n",  "forceATCRTUpdateMode",  *((void *)this + 2),  *((_DWORD *)this + 10),  a2);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *((void *)this + 2);
    int v7 = *((_DWORD *)this + 10);
    *(_DWORD *)buf = 136315906;
    int v15 = "forceATCRTUpdateMode";
    __int16 v16 = 2048;
    uint64_t v17 = v6;
    __int16 v18 = 1024;
    int v19 = v7;
    __int16 v20 = 1024;
    int v21 = a2;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "AppleHPMLibRT13Interface::%s@0x%llx RID%u - entry. enable = 0x%X\n\n",  buf,  0x22u);
  }

  int v8 = (*(uint64_t (**)(AppleHPMLibRT13Interface *, uint64_t, uint64_t))(*(void *)this + 32LL))(this, a2, a3);
  if (!v8)
  {
    v9 = *(uint64_t (**)(AppleHPMLibRT13Interface *, uint64_t))(*(void *)this + 40LL);
    if ((_DWORD)a2)
    {
      int v8 = v9(this, 65LL);
      if (!v8)
      {
        usleep(0x186A0u);
        int v8 = (*(uint64_t (**)(AppleHPMLibRT13Interface *, uint64_t))(*(void *)this + 40LL))(this, 1LL);
      }
    }

    else
    {
      int v8 = v9(this, 0LL);
    }
  }

  if (v8) {
    uint64_t v10 = 3758097129LL;
  }
  else {
    uint64_t v10 = 0LL;
  }
  if (*((_BYTE *)this + 25) && (*((_BYTE *)this + 32) & 2) != 0)
  {
    printf( "AppleHPMLibRT13Interface::%s@0x%llx RID%u - exit status=0x%X\n\n",  "forceATCRTUpdateMode",  *((void *)this + 2),  *((_DWORD *)this + 10),  v10);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *((void *)this + 2);
    int v12 = *((_DWORD *)this + 10);
    *(_DWORD *)buf = 136315906;
    int v15 = "forceATCRTUpdateMode";
    __int16 v16 = 2048;
    uint64_t v17 = v11;
    __int16 v18 = 1024;
    int v19 = v12;
    __int16 v20 = 1024;
    int v21 = v10;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "AppleHPMLibRT13Interface::%s@0x%llx RID%u - exit status=0x%X\n\n",  buf,  0x22u);
  }

  return v10;
}

uint64_t AppleHPMLibRT13Interface::execVOUT(AppleHPMLibRT13Interface *this, int a2)
{
  unsigned __int8 v34 = a2;
  if (*((_BYTE *)this + 25) && (*((_BYTE *)this + 32) & 2) != 0)
  {
    printf( "AppleHPMLibRT13Interface::%s@0x%llx RID%u - entry. value = 0x%X\n\n",  "execVOUT",  *((void *)this + 2),  *((_DWORD *)this + 10),  a2);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *((void *)this + 2);
    int v5 = *((_DWORD *)this + 10);
    *(_DWORD *)buf = 136315906;
    v36 = "execVOUT";
    __int16 v37 = 2048;
    uint64_t v38 = v4;
    __int16 v39 = 1024;
    int v40 = v5;
    __int16 v41 = 1024;
    int v42 = a2;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "AppleHPMLibRT13Interface::%s@0x%llx RID%u - entry. value = 0x%X\n\n",  buf,  0x22u);
  }

  int v33 = 1448039764;
  unsigned __int8 v32 = 0;
  int v6 = AppleHPMLibPriv::IECSAtomicCommand( *((AppleHPMLibPriv **)this + 1),  (char *)&dword_0 + 1,  &v33,  &v34,  0LL,  &v32,  0LL,  1u,  1u,  v25,  1uLL,  *((void *)this + 2),  0);
  int v7 = v6;
  if (!v6 && (v32 & 0xF) == 0) {
    goto LABEL_51;
  }
  if (*((_BYTE *)this + 25))
  {
    printf( "AppleHPMLibRT13Interface::%s@0x%llx RID%u - first VOUT failed, check if HPM is in DFUf [0x%X], taskRetCode=0x%X\n \n",  "execVOUT",  *((void *)this + 2),  *((_DWORD *)this + 10),  v6,  v32);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    uint64_t v17 = *((void *)this + 2);
    int v18 = *((_DWORD *)this + 10);
    *(_DWORD *)buf = 136316162;
    v36 = "execVOUT";
    __int16 v37 = 2048;
    uint64_t v38 = v17;
    __int16 v39 = 1024;
    int v40 = v18;
    __int16 v41 = 1024;
    int v42 = v7;
    __int16 v43 = 1024;
    int v44 = v32;
    _os_log_error_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "AppleHPMLibRT13Interface::%s@0x%llx RID%u - first VOUT failed, check if HPM is in DFUf [0x%X], taskRetCode=0x%X\n \n",  buf,  0x28u);
  }

  uint64_t v30 = 4LL;
  int v9 = AppleHPMLibPriv::iecsRead(*((AppleHPMLibPriv **)this + 1), *((void *)this + 2), 3u, &v31, 4uLL, 0, &v30, v8);
  if (v9)
  {
    if (*((_BYTE *)this + 25))
    {
      printf( "AppleHPMLibRT13Interface::%s@0x%llx RID%u - Read mode failed [0x%X]\n\n",  "execVOUT",  *((void *)this + 2),  *((_DWORD *)this + 10),  v9);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_6CB4();
    }

    uint64_t v10 = 3758097129LL;
    uint64_t v11 = "AppleHPMLibRTUpdaterInterface - Read mode failed\n";
    goto LABEL_36;
  }

  if (v31 != 1716864580)
  {
    if (*((_BYTE *)this + 25))
    {
      printf( "AppleHPMLibRT13Interface::%s@0x%llx RID%u - Not in DFUf but still failed VOUT, modeData=0x%x\n\n",  "execVOUT",  *((void *)this + 2),  *((_DWORD *)this + 10),  v31);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_6C40();
    }

    uint64_t v10 = 3758097129LL;
    uint64_t v11 = "AppleHPMLibRTUpdaterInterface - Not in DFUf but still failed VOUT\n";
    goto LABEL_36;
  }

  if (*((_BYTE *)this + 25))
  {
    printf( "AppleHPMLibRT13Interface::%s@0x%llx RID%u - pulling HPM out of DFUf...\n\n",  "execVOUT",  *((void *)this + 2),  *((_DWORD *)this + 10));
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_6BCC();
  }

  int v29 = 1145460070;
  char v28 = 0;
  int v12 = AppleHPMLibPriv::IECSAtomicCommand( *((AppleHPMLibPriv **)this + 1),  (char *)&dword_0 + 1,  &v29,  &v28,  0LL,  &v32,  0LL,  1u,  1u,  v26,  1uLL,  *((void *)this + 2),  0);
  int v13 = v12;
  if (!v12 && (v32 & 0xF) == 0)
  {
    if (*((_BYTE *)this + 25))
    {
      printf( "AppleHPMLibRT13Interface::%s@0x%llx RID%u - trying VOUT after cancelling DFUf, value = 0x%X\n\n",  "execVOUT",  *((void *)this + 2),  *((_DWORD *)this + 10),  v34);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_6B44();
    }

    int v19 = AppleHPMLibPriv::IECSAtomicCommand( *((AppleHPMLibPriv **)this + 1),  (char *)&dword_0 + 1,  &v33,  &v34,  0LL,  &v32,  0LL,  1u,  1u,  v27,  1uLL,  *((void *)this + 2),  0);
    int v20 = v19;
    if (v19 || (v32 & 0xF) != 0)
    {
      if (*((_BYTE *)this + 25))
      {
        printf( "AppleHPMLibRT13Interface::%s@0x%llx RID%u - second VOUT failed, status = [0x%X], taskRetCode=0x%X, modeData=0x%x\n\n",  "execVOUT",  *((void *)this + 2),  *((_DWORD *)this + 10),  v19,  v32,  v31);
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = *((void *)this + 2);
        int v24 = *((_DWORD *)this + 10);
        *(_DWORD *)buf = 136316418;
        v36 = "execVOUT";
        __int16 v37 = 2048;
        uint64_t v38 = v23;
        __int16 v39 = 1024;
        int v40 = v24;
        __int16 v41 = 1024;
        int v42 = v20;
        __int16 v43 = 1024;
        int v44 = v32;
        __int16 v45 = 1024;
        int v46 = v31;
        _os_log_error_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "AppleHPMLibRT13Interface::%s@0x%llx RID%u - second VOUT failed, status = [0x%X], taskRetCode=0x%X, modeData=0x%x\n\n",  buf,  0x2Eu);
      }

      uint64_t v11 = "AppleHPMLibRTUpdaterInterface - Second VOUT failed\n";
      goto LABEL_35;
    }

LABEL_51:
    uint64_t v10 = 0LL;
    goto LABEL_37;
  }

  if (*((_BYTE *)this + 25))
  {
    printf( "AppleHPMLibRT13Interface::%s@0x%llx RID%u - cancelling DFUf failed [0x%X], taskRetCode=0x%X, modeData=0x%x\n\n",  "execVOUT",  *((void *)this + 2),  *((_DWORD *)this + 10),  v12,  v32,  v31);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    uint64_t v21 = *((void *)this + 2);
    int v22 = *((_DWORD *)this + 10);
    *(_DWORD *)buf = 136316418;
    v36 = "execVOUT";
    __int16 v37 = 2048;
    uint64_t v38 = v21;
    __int16 v39 = 1024;
    int v40 = v22;
    __int16 v41 = 1024;
    int v42 = v13;
    __int16 v43 = 1024;
    int v44 = v32;
    __int16 v45 = 1024;
    int v46 = v31;
    _os_log_error_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "AppleHPMLibRT13Interface::%s@0x%llx RID%u - cancelling DFUf failed [0x%X], taskRetCode=0x%X, modeData=0x%x\n\n",  buf,  0x2Eu);
  }

  uint64_t v11 = "AppleHPMLibRTUpdaterInterface - First VOUT failed and cancelling DFUf failed\n";
LABEL_35:
  uint64_t v10 = 3758097129LL;
LABEL_36:
  AppleHPMLibRTInterface::triggerSystemPanic(this, v11);
LABEL_37:
  if (*((_BYTE *)this + 25) && (*((_BYTE *)this + 32) & 2) != 0)
  {
    printf( "AppleHPMLibRT13Interface::%s@0x%llx RID%u - exit status=0x%X\n\n",  "execVOUT",  *((void *)this + 2),  *((_DWORD *)this + 10),  v10);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *((void *)this + 2);
    int v15 = *((_DWORD *)this + 10);
    *(_DWORD *)buf = 136315906;
    v36 = "execVOUT";
    __int16 v37 = 2048;
    uint64_t v38 = v14;
    __int16 v39 = 1024;
    int v40 = v15;
    __int16 v41 = 1024;
    int v42 = v10;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "AppleHPMLibRT13Interface::%s@0x%llx RID%u - exit status=0x%X\n\n",  buf,  0x22u);
  }

  return v10;
}

uint64_t AppleHPMLibRT13InterfaceA3::forceATCRTUpdateMode( AppleHPMLibRT13InterfaceA3 *this, uint64_t a2, uint64_t a3)
{
  if (*((_BYTE *)this + 25) && (*((_BYTE *)this + 32) & 2) != 0)
  {
    printf( "AppleHPMLibRT13Interface::%s@0x%llx RID%u - entry. enable = 0x%X\n\n",  "forceATCRTUpdateMode",  *((void *)this + 2),  *((_DWORD *)this + 10),  a2);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *((void *)this + 2);
    int v7 = *((_DWORD *)this + 10);
    *(_DWORD *)buf = 136315906;
    int v15 = "forceATCRTUpdateMode";
    __int16 v16 = 2048;
    uint64_t v17 = v6;
    __int16 v18 = 1024;
    int v19 = v7;
    __int16 v20 = 1024;
    int v21 = a2;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "AppleHPMLibRT13Interface::%s@0x%llx RID%u - entry. enable = 0x%X\n\n",  buf,  0x22u);
  }

  unsigned int v8 = AppleHPMLibRT13InterfaceA3::inADFU(this, (BOOL *)buf);
  if (buf[0]) {
    unsigned int v9 = -536870184;
  }
  else {
    unsigned int v9 = 0;
  }
  if (v8) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = v9;
  }
  if (!v8 && !buf[0]) {
    uint64_t v10 = AppleHPMLibRT13Interface::forceATCRTUpdateMode(this, a2, a3);
  }
  if (*((_BYTE *)this + 25) && (*((_BYTE *)this + 32) & 2) != 0)
  {
    printf( "AppleHPMLibRT13Interface::%s@0x%llx RID%u - exit status=0x%X\n\n",  "forceATCRTUpdateMode",  *((void *)this + 2),  *((_DWORD *)this + 10),  v10);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *((void *)this + 2);
    int v12 = *((_DWORD *)this + 10);
    *(_DWORD *)buf = 136315906;
    int v15 = "forceATCRTUpdateMode";
    __int16 v16 = 2048;
    uint64_t v17 = v11;
    __int16 v18 = 1024;
    int v19 = v12;
    __int16 v20 = 1024;
    int v21 = v10;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "AppleHPMLibRT13Interface::%s@0x%llx RID%u - exit status=0x%X\n\n",  buf,  0x22u);
  }

  return v10;
}

uint64_t AppleHPMLibRT13InterfaceA3::inADFU(AppleHPMLibRT13InterfaceA3 *this, BOOL *a2)
{
  if (*((_BYTE *)this + 25) && (*((_BYTE *)this + 32) & 2) != 0)
  {
    printf( "AppleHPMLibRT13Interface::%s@0x%llx RID%u - entry\n\n",  "inADFU",  *((void *)this + 2),  *((_DWORD *)this + 10));
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *((void *)this + 2);
    int v6 = *((_DWORD *)this + 10);
    *(_DWORD *)buf = 136315650;
    uint64_t v14 = "inADFU";
    __int16 v15 = 2048;
    uint64_t v16 = v5;
    __int16 v17 = 1024;
    int v18 = v6;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "AppleHPMLibRT13Interface::%s@0x%llx RID%u - entry\n\n",  buf,  0x1Cu);
  }

  uint64_t v11 = 4LL;
  if (a2)
  {
    uint64_t v7 = AppleHPMLibPriv::iecsRead(*((AppleHPMLibPriv **)this + 1), *((void *)this + 2), 3u, &v12, 4uLL, 0, &v11, v4);
    if (!(_DWORD)v7)
    {
      if (v12 == 1430668353)
      {
        if (*((_BYTE *)this + 25))
        {
          printf( "AppleHPMLibRT13Interface::%s@0x%llx RID%u - HPM in ADFU\n\n",  "inADFU",  *((void *)this + 2),  *((_DWORD *)this + 10));
        }

        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_6DB4();
        }

        uint64_t v7 = 0LL;
        *a2 = 1;
      }

      else
      {
        if (*((_BYTE *)this + 25))
        {
          printf( "AppleHPMLibRT13Interface::%s@0x%llx RID%u - HPM is NOT in ADFU, modeData=0x%x\n\n",  "inADFU",  *((void *)this + 2),  *((_DWORD *)this + 10),  v12);
        }

        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_6E28();
        }

        uint64_t v7 = 0LL;
        *a2 = 0;
      }

      goto LABEL_17;
    }
  }

  else
  {
    uint64_t v7 = 3758097090LL;
  }

  if (*((_BYTE *)this + 25))
  {
    printf( "AppleHPMLibRT13Interface::%s@0x%llx RID%u - check for in ADFU failed [0x%X]\n\n",  "inADFU",  *((void *)this + 2),  *((_DWORD *)this + 10),  v7);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_6D28();
  }

  AppleHPMLibRTInterface::triggerSystemPanic(this, "AppleHPMLibRTUpdaterInterface - Check for in ADFU failed\n");
LABEL_17:
  if (*((_BYTE *)this + 25) && (*((_BYTE *)this + 32) & 2) != 0)
  {
    printf( "AppleHPMLibRT13Interface::%s@0x%llx RID%u - exit status=0x%X\n\n",  "inADFU",  *((void *)this + 2),  *((_DWORD *)this + 10),  v7);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *((void *)this + 2);
    int v9 = *((_DWORD *)this + 10);
    *(_DWORD *)buf = 136315906;
    uint64_t v14 = "inADFU";
    __int16 v15 = 2048;
    uint64_t v16 = v8;
    __int16 v17 = 1024;
    int v18 = v9;
    __int16 v19 = 1024;
    int v20 = v7;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "AppleHPMLibRT13Interface::%s@0x%llx RID%u - exit status=0x%X\n\n",  buf,  0x22u);
  }

  return v7;
}

uint64_t AppleHPMLibRT13InterfaceA3::forceATCRTPower(AppleHPMLibRT13InterfaceA3 *this, int a2)
{
  if (*((_BYTE *)this + 25) && (*((_BYTE *)this + 32) & 2) != 0)
  {
    printf( "AppleHPMLibRT13Interface::%s@0x%llx RID%u - entry. enable = 0x%X\n\n",  "forceATCRTPower",  *((void *)this + 2),  *((_DWORD *)this + 10),  a2);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *((void *)this + 2);
    int v5 = *((_DWORD *)this + 10);
    *(_DWORD *)buf = 136315906;
    uint64_t v14 = "forceATCRTPower";
    __int16 v15 = 2048;
    uint64_t v16 = v4;
    __int16 v17 = 1024;
    int v18 = v5;
    __int16 v19 = 1024;
    int v20 = a2;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "AppleHPMLibRT13Interface::%s@0x%llx RID%u - entry. enable = 0x%X\n\n",  buf,  0x22u);
  }

  unsigned int v6 = AppleHPMLibRT13InterfaceA3::inADFU(this, &v12);
  if (v12) {
    unsigned int v7 = -536870184;
  }
  else {
    unsigned int v7 = 0;
  }
  if (v6) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = v7;
  }
  if (!v6 && !v12) {
    uint64_t v8 = AppleHPMLibRT13Interface::forceATCRTPower(this, a2);
  }
  if (*((_BYTE *)this + 25) && (*((_BYTE *)this + 32) & 2) != 0)
  {
    printf( "AppleHPMLibRT13Interface::%s@0x%llx RID%u - exit status=0x%X\n\n",  "forceATCRTPower",  *((void *)this + 2),  *((_DWORD *)this + 10),  v8);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *((void *)this + 2);
    int v10 = *((_DWORD *)this + 10);
    *(_DWORD *)buf = 136315906;
    uint64_t v14 = "forceATCRTPower";
    __int16 v15 = 2048;
    uint64_t v16 = v9;
    __int16 v17 = 1024;
    int v18 = v10;
    __int16 v19 = 1024;
    int v20 = v8;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "AppleHPMLibRT13Interface::%s@0x%llx RID%u - exit status=0x%X\n\n",  buf,  0x22u);
  }

  return v8;
}

  ;
}

void sub_54AC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_54BC(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

  ;
}

  ;
}

void sub_54F4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void AppleHPMLibRTInterface::AppleHPMLibRTInterface( AppleHPMLibRTInterface *this, void **a2, uint64_t a3, int a4)
{
  *((_DWORD *)this + 10) = a4;
  int v5 = (_DWORD *)((char *)this + 40);
  *((_BYTE *)this + 24) = 0;
  unsigned int v6 = (unsigned __int8 *)this + 24;
  uint64_t v7 = (uint64_t)*a2;
  *(void *)this = &off_8208;
  *((void *)this + 1) = v7;
  *((void *)this + 2) = a3;
  uint64_t v8 = (void *)((char *)this + 16);
  *((_BYTE *)this + 25) = os_parse_boot_arg_string("-restore", 0LL, 0LL);
  uint64_t v9 = 0LL;
  if (*((_BYTE *)this + 25))
  {
    printf( "AppleHPMLibRTInterface::%s@0x%llx RID%u - AppleHPMLibRTUpdater - panic debug enabled:%u\n\n",  "AppleHPMLibRTInterface",  *v8,  *v5,  *v6);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_6EA4();
  }
}

void AppleHPMLibRTInterface::triggerSystemPanic(AppleHPMLibRTInterface *this, const char *a2)
{
  if (*((_BYTE *)this + 24))
  {
    int v3 = reboot_np(3072, a2);
    if (v3)
    {
      if (*((_BYTE *)this + 25))
      {
        printf( "AppleHPMLibRTInterface::%s@0x%llx RID%u - Failed to trigger system panic: %u\n",  "triggerSystemPanic",  *((void *)this + 2),  *((_DWORD *)this + 10),  v3);
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_6F38();
      }
    }
  }

uint64_t AppleHPMLibPriv::queryInterfaceStatic(AppleHPMLibPriv *this, void *a2, CFUUIDBytes a3, void **a4)
{
  uint64_t v4 = *(void **)&a3.byte8;
  uint64_t v5 = *((void *)this + 1);
  CFUUIDRef v6 = CFUUIDCreateFromUUIDBytes(0LL, *(CFUUIDBytes *)&a2);
  CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u);
  if (CFEqual(v6, v7)
    || (CFUUIDRef v8 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xC2u,  0x44u,  0xE8u,  0x58u,  0x10u,  0x9Cu,  0x11u,  0xD4u,  0x91u,  0xD4u,  0,  0x50u,  0xE4u,  0xC6u,  0x42u,  0x6Fu),  CFEqual(v6, v8)))
  {
    uint64_t v9 = 0LL;
    *uint64_t v4 = v5 + 8;
    uint64_t v10 = *(void *)(v5 + 16);
  }

  else
  {
    CFUUIDRef v12 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xC1u,  0x3Au,  0xCDu,  0xD9u,  0x20u,  0x9Eu,  0x4Bu,  1u,  0xB7u,  0xBEu,  0xE0u,  0x5Cu,  0xD8u,  0x83u,  0xC7u,  0xB1u);
    if (!CFEqual(v6, v12))
    {
      CFUUIDRef v13 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xACu,  0xE8u,  0x66u,  0xD8u,  0xAu,  0xE1u,  0x47u,  0x9Eu,  0xBAu,  0xEEu,  0x22u,  0xB7u,  0x69u,  9u,  0xAu,  0xA3u);
      if (!CFEqual(v6, v13))
      {
        CFUUIDRef v14 = CFUUIDGetConstantUUIDWithBytes( kCFAllocatorSystemDefault,  0xCFu,  0xCAu,  0x49u,  0xA5u,  0xEFu,  0xB5u,  0x47u,  0x6Bu,  0xA2u,  0xF0u,  0x21u,  9u,  0x86u,  0x1Cu,  0xAAu,  4u);
        if (!CFEqual(v6, v14))
        {
          CFUUIDRef v15 = CFUUIDGetConstantUUIDWithBytes( kCFAllocatorSystemDefault,  0xCFu,  0x8Bu,  0xE9u,  0xB3u,  9u,  0x9Au,  0x43u,  0x5Au,  0xAAu,  0x49u,  0x56u,  0x35u,  0x12u,  0x21u,  0xFAu,  0x78u);
          if (!CFEqual(v6, v15))
          {
            *uint64_t v4 = 0LL;
            uint64_t v9 = 2147483652LL;
            goto LABEL_5;
          }
        }
      }
    }

    uint64_t v9 = 0LL;
    *uint64_t v4 = v5 + 24;
    uint64_t v10 = *(void *)(v5 + 32);
  }

  ++*(_DWORD *)(v10 + 48);
LABEL_5:
  CFRelease(v6);
  return v9;
}

uint64_t AppleHPMLibPriv::addRefStatic(AppleHPMLibPriv *this, void *a2)
{
  uint64_t v2 = *((void *)this + 1);
  uint64_t result = (*(_DWORD *)(v2 + 48) + 1);
  *(_DWORD *)(v2 + 48) = result;
  return result;
}

uint64_t AppleHPMLibPriv::releaseStatic(AppleHPMLibPriv *this, void *a2)
{
  uint64_t v2 = (unsigned int *)*((void *)this + 1);
  uint64_t v3 = v2[12];
  v2[12] = v3 - 1;
  if (v2) {
    BOOL v4 = (_DWORD)v3 == 1;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4) {
    (*(void (**)(unsigned int *, void *))(*(void *)v2 + 8LL))(v2, a2);
  }
  return v3;
}

uint64_t AppleHPMLibPriv::probeStatic( AppleHPMLibPriv *this, void *a2, io_object_t object, unsigned int a4, int *a5)
{
  if (object && IOObjectConformsTo(object, "AppleHPM")) {
    return 0LL;
  }
  else {
    return 3758097090LL;
  }
}

uint64_t AppleHPMLibPriv::startStatic(AppleHPMLibPriv *this, void *a2, io_service_t service)
{
  uint64_t v3 = (io_connect_t *)*((void *)this + 1);
  v3[13] = service;
  unsigned int v4 = IOServiceOpen(service, mach_task_self_, 0x2Au, v3 + 14);
  if (v3[14]) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 3758097088LL;
  }
  if (!(_DWORD)v5) {
    AppleHPMLibPriv::getRID((AppleHPMLibPriv *)v3);
  }
  return v5;
}

uint64_t AppleHPMLibPriv::stopStatic(AppleHPMLibPriv *this, void *a2)
{
  uint64_t v2 = *((void *)this + 1);
  io_connect_t v3 = *(_DWORD *)(v2 + 56);
  if (v3)
  {
    IOServiceClose(v3);
    *(_DWORD *)(v2 + 56) = 0;
  }

  return 0LL;
}

uint64_t AppleHPMLibPriv::iecsRead( AppleHPMLibPriv *this, uint64_t a2, unsigned int a3, void *a4, vm_size_t size, unsigned int a6, void *a7, unint64_t *a8)
{
  uint64_t v8 = 3758097084LL;
  uint64_t v9 = *((void *)this + 1);
  int v10 = *(_DWORD *)(v9 + 56);
  vm_address_t address = 0LL;
  if (!v10) {
    return v8;
  }
  uint64_t v17 = vm_allocate(mach_task_self_, &address, size, 1);
  if (!address) {
    return 3758097086LL;
  }
  input[0] = a2;
  input[1] = a3;
  input[2] = size;
  input[3] = address;
  input[4] = a6;
  uint32_t outputCnt = 1;
  __chkstk_darwin(v17);
  uint64_t v20 = 0LL;
  uint64_t v18 = IOConnectCallScalarMethod(*(_DWORD *)(v9 + 56), 0, input, 5u, &v20, &outputCnt);
  uint64_t v8 = v18;
  if (!a7 || (_DWORD)v18)
  {
    if ((_DWORD)v18) {
      goto LABEL_9;
    }
  }

  else
  {
    *a7 = v20;
  }

  memmove(a4, (const void *)address, size);
LABEL_9:
  if (address) {
    vm_deallocate(mach_task_self_, address, size);
  }
  return v8;
}

uint64_t AppleHPMLibPriv::iecsWrite( AppleHPMLibPriv *this, uint64_t a2, unsigned int a3, const void *a4, vm_size_t size, unsigned int a6)
{
  uint64_t v6 = 3758097084LL;
  uint64_t v7 = *((void *)this + 1);
  int v8 = *(_DWORD *)(v7 + 56);
  vm_address_t address = 0LL;
  if (v8)
  {
    vm_allocate(mach_task_self_, &address, size, 1);
    if (address)
    {
      memmove((void *)address, a4, size);
      input[0] = a2;
      input[1] = a3;
      input[2] = size;
      input[3] = address;
      input[4] = a6;
      uint32_t outputCnt = 0;
      uint64_t v6 = IOConnectCallScalarMethod(*(_DWORD *)(v7 + 56), 1u, input, 5u, 0LL, &outputCnt);
      if (address) {
        vm_deallocate(mach_task_self_, address, size);
      }
    }

    else
    {
      return 3758097086LL;
    }
  }

  return v6;
}

uint64_t AppleHPMLibPriv::iecsCommand(AppleHPMLibPriv *this, uint64_t a2, unsigned int a3, unsigned int a4)
{
  mach_port_t v4 = *(_DWORD *)(*((void *)this + 1) + 56LL);
  if (!v4) {
    return 3758097084LL;
  }
  input[0] = a2;
  input[1] = a3;
  input[2] = a4;
  uint32_t outputCnt = 0;
  return IOConnectCallScalarMethod(v4, 2u, input, 3u, 0LL, &outputCnt);
}

uint64_t AppleHPMLibPriv::sendVDM( uint64_t a1, uint64_t a2, unsigned int a3, const void *a4, vm_size_t size, unsigned int a6)
{
  uint64_t v6 = 3758097084LL;
  uint64_t v7 = *(void *)(a1 + 8);
  int v8 = *(_DWORD *)(v7 + 56);
  vm_address_t address = 0LL;
  if (v8)
  {
    vm_allocate(mach_task_self_, &address, size, 1);
    if (address)
    {
      memmove((void *)address, a4, size);
      input[0] = a2;
      input[1] = a3;
      input[2] = size;
      uint64_t input[3] = address;
      input[4] = a6;
      uint32_t outputCnt = 0;
      uint64_t v6 = IOConnectCallScalarMethod(*(_DWORD *)(v7 + 56), 3u, input, 5u, 0LL, &outputCnt);
      if (address) {
        vm_deallocate(mach_task_self_, address, size);
      }
    }

    else
    {
      return 3758097086LL;
    }
  }

  return v6;
}

uint64_t AppleHPMLibPriv::receiveVDM( uint64_t a1, uint64_t a2, void *a3, vm_size_t size, unsigned int a5, _DWORD *a6, _BYTE *a7, void *a8)
{
  uint64_t v8 = 3758097084LL;
  uint64_t v9 = *(void *)(a1 + 8);
  int v10 = *(_DWORD *)(v9 + 56);
  vm_address_t address = 0LL;
  if (v10)
  {
    uint64_t v18 = vm_allocate(mach_task_self_, &address, size, 1);
    if (address)
    {
      input[0] = a2;
      input[1] = size;
      input[2] = address;
      uint64_t input[3] = a5;
      uint32_t outputCnt = 3;
      __chkstk_darwin(v18);
      uint64_t v20 = 0LL;
      uint64_t v21 = 0LL;
      uint64_t v22 = 0LL;
      uint64_t v8 = IOConnectCallScalarMethod(*(_DWORD *)(v9 + 56), 4u, input, 4u, &v20, &outputCnt);
      if (!(_DWORD)v8)
      {
        if (a8) {
          *a8 = v20;
        }
        if (a7) {
          *a7 = v21;
        }
        if (a6) {
          *a6 = v22;
        }
        memmove(a3, (const void *)address, size);
      }

      if (address) {
        vm_deallocate(mach_task_self_, address, size);
      }
    }

    else
    {
      return 3758097086LL;
    }
  }

  return v8;
}

uint64_t AppleHPMLibPriv::receiveVDMAttention( uint64_t a1, uint64_t a2, void *a3, vm_size_t size, unsigned int a5, _DWORD *a6, _BYTE *a7, void *a8)
{
  uint64_t v8 = 3758097084LL;
  uint64_t v9 = *(void *)(a1 + 8);
  int v10 = *(_DWORD *)(v9 + 56);
  vm_address_t address = 0LL;
  if (v10)
  {
    uint64_t v18 = vm_allocate(mach_task_self_, &address, size, 1);
    if (address)
    {
      input[0] = a2;
      input[1] = size;
      input[2] = address;
      uint64_t input[3] = a5;
      uint32_t outputCnt = 3;
      __chkstk_darwin(v18);
      uint64_t v20 = 0LL;
      uint64_t v21 = 0LL;
      uint64_t v22 = 0LL;
      uint64_t v8 = IOConnectCallScalarMethod(*(_DWORD *)(v9 + 56), 5u, input, 4u, &v20, &outputCnt);
      if (!(_DWORD)v8)
      {
        if (a8) {
          *a8 = v20;
        }
        if (a7) {
          *a7 = v21;
        }
        if (a6) {
          *a6 = v22;
        }
        memmove(a3, (const void *)address, size);
      }

      if (address) {
        vm_deallocate(mach_task_self_, address, size);
      }
    }

    else
    {
      return 3758097086LL;
    }
  }

  return v8;
}

uint64_t AppleHPMLibPriv::forceMode( AppleHPMLibPriv *this, uint64_t a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  uint64_t v5 = *((void *)this + 1);
  if (!*(_DWORD *)(v5 + 56)) {
    return 3758097084LL;
  }
  v7[0] = a2;
  v7[1] = a3;
  v7[2] = a4;
  v7[3] = a5;
  uint32_t outputCnt = 0;
  return IOConnectCallScalarMethod(*(_DWORD *)(v5 + 56), 7u, v7, 4u, 0LL, &outputCnt);
}

uint64_t AppleHPMLibPriv::forceUpdateMode(AppleHPMLibPriv *this, uint64_t a2, unsigned int a3)
{
  uint64_t v3 = *((void *)this + 1);
  if (!*(_DWORD *)(v3 + 56)) {
    return 3758097084LL;
  }
  v5[0] = a2;
  v5[1] = a3;
  uint32_t outputCnt = 0;
  return IOConnectCallScalarMethod(*(_DWORD *)(v3 + 56), 8u, v5, 2u, 0LL, &outputCnt);
}

uint64_t AppleHPMLibPriv::IECSAtomicCommand( AppleHPMLibPriv *this, void *a2, _DWORD *a3, const void *a4, _DWORD *a5, void *a6, _DWORD *a7, unsigned int a8, unsigned __int16 a9, unsigned __int16 a10, unint64_t a11, unint64_t a12, unsigned int a13)
{
  uint64_t v13 = *((void *)this + 1);
  int v14 = *(_DWORD *)(v13 + 56);
  vm_address_t address = 0LL;
  if (!v14)
  {
    size_t v19 = 0LL;
    vm_address_t v32 = 0LL;
    vm_address_t v33 = 0LL;
    vm_address_t v30 = 0LL;
    vm_address_t v31 = 0LL;
    uint64_t v20 = 3758097084LL;
    goto LABEL_37;
  }

  unsigned int v28 = a2;
  vm_allocate(mach_task_self_, &address, 4uLL, 1);
  size_t v19 = 0LL;
  if (address) {
    uint64_t v20 = 0LL;
  }
  else {
    uint64_t v20 = 3758097086LL;
  }
  vm_address_t v33 = 0LL;
  if (a8 && address)
  {
    size_t v19 = a8;
    vm_allocate(mach_task_self_, &v33, a8, 1);
    if (v33) {
      uint64_t v20 = 0LL;
    }
    else {
      uint64_t v20 = 3758097086LL;
    }
  }

  vm_address_t v32 = 0LL;
  if (a5 && !(_DWORD)v20)
  {
    vm_allocate(mach_task_self_, &v32, 4uLL, 1);
    if (v32) {
      uint64_t v20 = 0LL;
    }
    else {
      uint64_t v20 = 3758097086LL;
    }
  }

  size_t v21 = 0LL;
  vm_address_t v31 = 0LL;
  if (a9 && !(_DWORD)v20)
  {
    vm_allocate(mach_task_self_, &v31, a9, 1);
    if (v31) {
      uint64_t v20 = 0LL;
    }
    else {
      uint64_t v20 = 3758097086LL;
    }
    size_t v21 = a9;
  }

  vm_address_t v30 = 0LL;
  if (!a7 || (_DWORD)v20)
  {
    size_t v22 = v21;
    if ((_DWORD)v20) {
      goto LABEL_37;
    }
  }

  else
  {
    size_t v22 = v21;
    vm_allocate(mach_task_self_, &v30, 4uLL, 1);
    if (!v30)
    {
      uint64_t v20 = 3758097086LL;
      goto LABEL_37;
    }
  }

  *(_DWORD *)vm_address_t address = *a3;
  if (v33) {
    memmove((void *)v33, a4, v19);
  }
  vm_address_t v23 = v32;
  if (v32)
  {
    *(_DWORD *)vm_address_t v32 = *a5;
    vm_address_t v23 = v32;
  }

  input[0] = v28;
  input[1] = address;
  input[2] = v33;
  uint64_t input[3] = v23;
  uint64_t input[4] = v31;
  uint64_t input[5] = v30;
  input[6] = a8;
  input[7] = a9;
  input[8] = a11;
  input[9] = a12;
  input[10] = a13;
  uint32_t outputCnt = 0;
  uint64_t v20 = IOConnectCallScalarMethod(*(_DWORD *)(v13 + 56), 9u, input, 0xBu, 0LL, &outputCnt);
  BOOL v24 = v20 == 0;
  if (!(_DWORD)v20 && v30)
  {
    *a7 = *(_DWORD *)v30;
    BOOL v24 = 1;
  }

  if (v24 && v31) {
    memmove(a6, (const void *)v31, v22);
  }
LABEL_37:
  if (address)
  {
    vm_deallocate(mach_task_self_, address, 4uLL);
    vm_address_t address = 0LL;
  }

  if (v33)
  {
    vm_deallocate(mach_task_self_, v33, v19);
    vm_address_t v33 = 0LL;
  }

  if (v32)
  {
    vm_deallocate(mach_task_self_, v32, 4uLL);
    vm_address_t v32 = 0LL;
  }

  if (v31)
  {
    vm_deallocate(mach_task_self_, v31, 4uLL);
    vm_address_t v31 = 0LL;
  }

  if (v30) {
    vm_deallocate(mach_task_self_, v30, 4uLL);
  }
  return v20;
}

uint64_t AppleHPMLibPriv::EnableOptions(AppleHPMLibPriv *this, uint64_t a2, unsigned int a3)
{
  uint64_t v3 = *((void *)this + 1);
  if (!*(_DWORD *)(v3 + 56)) {
    return 3758097084LL;
  }
  v5[0] = a2;
  v5[1] = a3;
  uint32_t outputCnt = 0;
  return IOConnectCallScalarMethod(*(_DWORD *)(v3 + 56), 0xAu, v5, 2u, 0LL, &outputCnt);
}

uint64_t AppleHPMLibPriv::forceATCRTUpdateMode(AppleHPMLibPriv *this, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = this;
  uint64_t v4 = *((void *)this + 1);
  if (!*(_DWORD *)(v4 + 56)) {
    return 3758097084LL;
  }
  uint64_t v8 = (AppleHPMLibRTInterface *)operator new(0x30uLL);
  AppleHPMLibRTInterface::AppleHPMLibRTInterface(v8, &v11, a2, *(_DWORD *)(v4 + 60));
  *(void *)uint64_t v8 = off_81B0;
  uint64_t v9 = AppleHPMLibRT13InterfaceA3::forceATCRTUpdateMode(v8, a3, a4);
  (*(void (**)(AppleHPMLibRTInterface *))(*(void *)v8 + 24LL))(v8);
  return v9;
}

void sub_6758(_Unwind_Exception *a1)
{
}

uint64_t AppleHPMLibPriv::forceATCRTPower(AppleHPMLibPriv *this, uint64_t a2, int a3)
{
  uint64_t v9 = this;
  uint64_t v3 = *((void *)this + 1);
  if (!*(_DWORD *)(v3 + 56)) {
    return 3758097084LL;
  }
  uint64_t v6 = (AppleHPMLibRTInterface *)operator new(0x30uLL);
  AppleHPMLibRTInterface::AppleHPMLibRTInterface(v6, &v9, a2, *(_DWORD *)(v3 + 60));
  *(void *)uint64_t v6 = off_81B0;
  uint64_t v7 = AppleHPMLibRT13InterfaceA3::forceATCRTPower(v6, a3);
  (*(void (**)(AppleHPMLibRTInterface *))(*(void *)v6 + 24LL))(v6);
  return v7;
}

void sub_681C(_Unwind_Exception *a1)
{
}

void *AppleHPMLibFactory(uint64_t a1, const void *a2)
{
  CFUUIDRef v3 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x12u,  0xA1u,  0xDCu,  0xCFu,  0xCFu,  0x7Au,  0x47u,  0x75u,  0xBEu,  0xE5u,  0x9Cu,  0x43u,  0x19u,  0xF4u,  0xCDu,  0x2Bu);
  uint64_t v4 = (AppleHPMLibPriv *)CFEqual(a2, v3);
  if ((_DWORD)v4) {
    return AppleHPMLibPriv::alloc(v4);
  }
  else {
    return 0LL;
  }
}

void *AppleHPMLibPriv::alloc(AppleHPMLibPriv *this)
{
  uint64_t v1 = (AppleHPMLibPriv *)operator new(0x40uLL);
  AppleHPMLibPriv::AppleHPMLibPriv(v1);
  uint64_t result = (void *)((char *)v1 + 8);
  ++*(_DWORD *)(*((void *)v1 + 2) + 48LL);
  return result;
}

void sub_68F4(_Unwind_Exception *a1)
{
}

void AppleHPMLibPriv::AppleHPMLibPriv(AppleHPMLibPriv *this)
{
  *((_DWORD *)this + 15) = 0xFFFF;
  *((_DWORD *)this + 12) = 0;
  *(void *)this = off_8238;
  *((void *)this + 1) = &AppleHPMLibPriv::sIOCFPlugInVTable;
  *((void *)this + 2) = this;
  *((void *)this + 3) = &AppleHPMLibPriv::sAppleHPMLibVTable;
  *((void *)this + 4) = this;
  CFUUIDRef v2 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x70u,  0xFFu,  0x44u,  0x3Eu,  0x8Au,  0xCFu,  0x43u,  0xACu,  0xB7u,  0x93u,  0xE7u,  0x91u,  0x1Cu,  0x1Cu,  0xCu,  0xD5u);
  *((void *)this + 5) = v2;
  CFRetain(v2);
  CFPlugInAddInstanceForFactory(*((CFUUIDRef *)this + 5));
}

void AppleHPMLibPriv::~AppleHPMLibPriv(CFUUIDRef *this)
{
  *this = (CFUUIDRef)off_8238;
  CFPlugInRemoveInstanceForFactory(this[5]);
  CFRelease(this[5]);
}

{
  void *v1;
  AppleHPMLibPriv::~AppleHPMLibPriv(this);
  operator delete(v1);
}

void sub_69F4(void *a1)
{
}

uint64_t AppleHPMLibPriv::getRID(AppleHPMLibPriv *this)
{
  uint64_t v2 = 3758097136LL;
  io_registry_entry_t v3 = *((_DWORD *)this + 13);
  if (v3)
  {
    io_registry_entry_t parent = 0;
    if (!IORegistryEntryGetParentEntry(v3, "IOService", &parent))
    {
      CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(parent, @"rid", kCFAllocatorDefault, 0);
      if (CFProperty)
      {
        uint64_t v5 = CFProperty;
        if (CFDataGetLength(CFProperty) <= 4)
        {
          v8.location = 0LL;
          v8.length = 4LL;
          CFDataGetBytes(v5, v8, (UInt8 *)this + 60);
          uint64_t v2 = 0LL;
        }

        else
        {
          uint64_t v2 = 3758097084LL;
        }

        CFRelease(v5);
      }
    }
  }

  return v2;
}

void sub_6AD0()
{
}

void sub_6B44()
{
  sub_54AC( &dword_0,  (os_log_s *)&_os_log_default,  v0,  "AppleHPMLibRT13Interface::%s@0x%llx RID%u - trying VOUT after cancelling DFUf, value = 0x%X\n\n",  v1,  v2,  v3,  v4,  2u);
  sub_54EC();
}

void sub_6BCC()
{
}

void sub_6C40()
{
  sub_54AC( &dword_0,  (os_log_s *)&_os_log_default,  v0,  "AppleHPMLibRT13Interface::%s@0x%llx RID%u - Not in DFUf but still failed VOUT, modeData=0x%x\n\n",  v1,  v2,  v3,  v4,  2u);
  sub_54EC();
}

void sub_6CB4()
{
}

void sub_6D28()
{
}

void sub_6DB4()
{
}

void sub_6E28()
{
  sub_54AC( &dword_0,  (os_log_s *)&_os_log_default,  v0,  "AppleHPMLibRT13Interface::%s@0x%llx RID%u - HPM is NOT in ADFU, modeData=0x%x\n\n",  v1,  v2,  v3,  v4,  2u);
  sub_54EC();
}

void sub_6EA4()
{
}

void sub_6F38()
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}
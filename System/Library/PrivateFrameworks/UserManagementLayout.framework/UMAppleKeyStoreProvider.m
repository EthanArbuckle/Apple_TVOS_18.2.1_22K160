@interface UMAppleKeyStoreProvider
- (BOOL)addPersonaWithUUID:(id)a3 toSession:(unsigned int)a4 passcode:(id)a5 error:(id *)a6;
- (BOOL)bootstrapVolumeWithMountPoint:(id)a3 user:(unsigned int)a4 error:(id *)a5;
- (BOOL)createIdentityWithUUID:(id)a3 passcode:(id)a4 existingSession:(unsigned int)a5 existingSessionPasscode:(id)a6 error:(id *)a7;
- (BOOL)deleteIdentity:(id)a3 error:(id *)a4;
- (BOOL)deletePersonaWithUUID:(id)a3 fromSession:(unsigned int)a4 error:(id *)a5;
- (BOOL)ignoreIdentityMethods;
- (BOOL)isIdentityLoadedIntoSession:(unsigned int)a3;
- (BOOL)loadIdentity:(id)a3 intoSession:(unsigned int)a4 error:(id *)a5;
- (BOOL)loginIdentity:(id)a3 intoSession:(unsigned int)a4 passcode:(id)a5 error:(id *)a6;
- (BOOL)mapVolume:(id)a3 toSession:(unsigned int)a4 withPersona:(id)a5 error:(id *)a6;
- (BOOL)unloadIdentityFromSession:(unsigned int)a3 error:(id *)a4;
- (BOOL)unlockIdentityInSession:(unsigned int)a3 passcode:(id)a4 error:(id *)a5;
- (BOOL)unmapVolume:(id)a3 error:(id *)a4;
- (id)dataUnwrappingDataWithDeviceClassF:(id)a3 error:(id *)a4;
- (id)dataWrappingDataWithDeviceClassF:(id)a3 error:(id *)a4;
- (void)setIgnoreIdentityMethods:(BOOL)a3;
@end

@implementation UMAppleKeyStoreProvider

- (BOOL)bootstrapVolumeWithMountPoint:(id)a3 user:(unsigned int)a4 error:(id *)a5
{
  id v7 = a3;
  if (a5) {
    *a5 = 0LL;
  }
  if (-[UMAppleKeyStoreProvider ignoreIdentityMethods](self, "ignoreIdentityMethods"))
  {
    if (qword_18C4EC2A8 != -1) {
      dispatch_once(&qword_18C4EC2A8, &unk_18A27E138);
    }
    v8 = (os_log_s *)(id)qword_18C4EC298;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v9 = sub_18878BC68();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v10 = v9;
      }
      else {
        unsigned int v10 = v9 & 0xFFFFFFFE;
      }
      if (v10)
      {
        uint64_t v11 = _os_log_send_and_compose_impl();
        v12 = (void *)v11;
        if (v11) {
          sub_18878BC90(v11);
        }
      }

      else
      {
        v12 = 0LL;
      }

      free(v12);
    }

    char v13 = 1;
  }

  else
  {
    char v13 = AKSVolumeBootstrapFS();
    if ((v13 & 1) == 0)
    {
      if (qword_18C4EC2A8 != -1) {
        dispatch_once(&qword_18C4EC2A8, &unk_18A27E138);
      }
      v14 = (os_log_s *)(id)qword_18C4EC298;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        unsigned int v15 = sub_18878BC68();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          unsigned int v16 = v15;
        }
        else {
          unsigned int v16 = v15 & 0xFFFFFFFE;
        }
        if (v16)
        {
          uint64_t v17 = _os_log_send_and_compose_impl();
          v18 = (void *)v17;
          if (v17) {
            sub_18878BC90(v17);
          }
        }

        else
        {
          v18 = 0LL;
        }

        free(v18);
      }

      if (a5) {
        *a5 = 0LL;
      }
      CFRelease(0LL);
    }
  }

  return v13;
}

- (id)dataWrappingDataWithDeviceClassF:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v6 = v5;
  if (a4) {
    *a4 = 0LL;
  }
  if ((unint64_t)[v5 length] >= 0x21)
  {
    if (qword_18C4EC2A8 != -1) {
      dispatch_once(&qword_18C4EC2A8, &unk_18A27E138);
    }
    id v7 = (os_log_s *)(id)qword_18C4EC298;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = sub_18878BC68();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        v8 &= ~1u;
      }
      if (v8)
      {
        unsigned int v9 = v7;
        LODWORD(v27[0]) = 134217984;
        *(void *)((char *)v27 + 4) = [v6 length];
        LODWORD(v25) = 12;
        v24 = v27;
        unsigned int v10 = (void *)_os_log_send_and_compose_impl();

        if (v10) {
          sub_18878BC90((uint64_t)v10);
        }
      }

      else
      {
        unsigned int v10 = 0LL;
      }

      free(v10);
    }

    if (a4)
    {
      v20 = (void *)MEMORY[0x189607870];
      uint64_t v21 = *MEMORY[0x189607688];
      uint64_t v22 = 22LL;
LABEL_31:
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, v22, 0, v24, v25);
      v19 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    }

    goto LABEL_32;
  }

  memset(v27, 0, sizeof(v27));
  id v11 = v6;
  [v11 bytes];
  [v11 length];
  int v12 = aks_wrap_key();
  if (v12)
  {
    int v13 = v12;
    if (qword_18C4EC2A8 != -1) {
      dispatch_once(&qword_18C4EC2A8, &unk_18A27E138);
    }
    v14 = (os_log_s *)(id)qword_18C4EC298;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      unsigned int v15 = sub_18878BC68();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        unsigned int v16 = v15;
      }
      else {
        unsigned int v16 = v15 & 0xFFFFFFFE;
      }
      if (v16)
      {
        v26[0] = 67109120;
        v26[1] = v13;
        LODWORD(v25) = 8;
        v24 = v26;
        uint64_t v17 = _os_log_send_and_compose_impl();
        v18 = (void *)v17;
        if (v17) {
          sub_18878BC90(v17);
        }
      }

      else
      {
        v18 = 0LL;
      }

      free(v18);
    }

    if (a4)
    {
      v20 = (void *)MEMORY[0x189607870];
      uint64_t v21 = *MEMORY[0x189607630];
      uint64_t v22 = v13;
      goto LABEL_31;
    }

- (id)dataUnwrappingDataWithDeviceClassF:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v6 = v5;
  if (a4) {
    *a4 = 0LL;
  }
  if ((unint64_t)[v5 length] >= 0x29)
  {
    if (qword_18C4EC2A8 != -1) {
      dispatch_once(&qword_18C4EC2A8, &unk_18A27E138);
    }
    id v7 = (os_log_s *)(id)qword_18C4EC298;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = sub_18878BC68();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        v8 &= ~1u;
      }
      if (v8)
      {
        unsigned int v9 = v7;
        LODWORD(v29[0]) = 134217984;
        *(void *)((char *)v29 + 4) = [v6 length];
        LODWORD(v27) = 12;
        v26 = v29;
        unsigned int v10 = (void *)_os_log_send_and_compose_impl();

        if (v10) {
          sub_18878BC90((uint64_t)v10);
        }
      }

      else
      {
        unsigned int v10 = 0LL;
      }

      free(v10);
    }

    if (a4)
    {
      uint64_t v22 = (void *)MEMORY[0x189607870];
      uint64_t v23 = *MEMORY[0x189607688];
      uint64_t v24 = 22LL;
LABEL_41:
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, v24, 0, v26, v27);
      uint64_t v17 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_43;
    }

    goto LABEL_42;
  }

  memset(v29, 0, sizeof(v29));
  id v11 = v6;
  [v11 bytes];
  [v11 length];
  int v12 = aks_unwrap_key();
  if (v12)
  {
    int v13 = v12;
    if (v12 == -536362989)
    {
      if (qword_18C4EC2A8 != -1) {
        dispatch_once(&qword_18C4EC2A8, &unk_18A27E138);
      }
      v14 = (os_log_s *)(id)qword_18C4EC298;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        unsigned int v15 = sub_18878BC68();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
          unsigned int v16 = v15;
        }
        else {
          unsigned int v16 = v15 & 0xFFFFFFFE;
        }
        if (v16)
        {
          LOWORD(v28[0]) = 0;
          LODWORD(v27) = 2;
          v26 = v28;
          goto LABEL_31;
        }

        goto LABEL_37;
      }
    }

    else
    {
      if (qword_18C4EC2A8 != -1) {
        dispatch_once(&qword_18C4EC2A8, &unk_18A27E138);
      }
      v14 = (os_log_s *)(id)qword_18C4EC298;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        unsigned int v18 = sub_18878BC68();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          unsigned int v19 = v18;
        }
        else {
          unsigned int v19 = v18 & 0xFFFFFFFE;
        }
        if (v19)
        {
          v28[0] = 67109120;
          v28[1] = v13;
          LODWORD(v27) = 8;
          v26 = v28;
LABEL_31:
          uint64_t v20 = _os_log_send_and_compose_impl();
          uint64_t v21 = (void *)v20;
          if (v20) {
            sub_18878BC90(v20);
          }
          goto LABEL_38;
        }

- (BOOL)createIdentityWithUUID:(id)a3 passcode:(id)a4 existingSession:(unsigned int)a5 existingSessionPasscode:(id)a6 error:(id *)a7
{
  id v11 = a3;
  if (a7) {
    *a7 = 0LL;
  }
  id v12 = a6;
  id v13 = a4;
  CFUUIDRef v14 = sub_188787C54(v11);
  sub_1887851D4(self, v13);

  sub_1887851D4(self, v12);
  char v15 = AKSIdentityCreate();
  if ((v15 & 1) != 0)
  {
    if (qword_18C4EC2A8 != -1) {
      dispatch_once(&qword_18C4EC2A8, &unk_18A27E138);
    }
    unsigned int v16 = (os_log_s *)(id)qword_18C4EC298;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v17 = sub_18878BC68();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v18 = v17;
      }
      else {
        unsigned int v18 = v17 & 0xFFFFFFFE;
      }
      if (v18)
      {
        uint64_t v19 = _os_log_send_and_compose_impl();
        uint64_t v20 = (void *)v19;
        if (v19) {
          sub_18878BC90(v19);
        }
      }

      else
      {
        uint64_t v20 = 0LL;
      }

      free(v20);
    }
  }

  else
  {
    if (qword_18C4EC2A8 != -1) {
      dispatch_once(&qword_18C4EC2A8, &unk_18A27E138);
    }
    uint64_t v21 = (os_log_s *)(id)qword_18C4EC298;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      unsigned int v22 = sub_18878BC68();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        unsigned int v23 = v22;
      }
      else {
        unsigned int v23 = v22 & 0xFFFFFFFE;
      }
      if (v23)
      {
        uint64_t v24 = _os_log_send_and_compose_impl();
        uint64_t v25 = (void *)v24;
        if (v24) {
          sub_18878BC90(v24);
        }
      }

      else
      {
        uint64_t v25 = 0LL;
      }

      free(v25);
    }

    if (a7) {
      *a7 = 0LL;
    }
    else {
      CFRelease(0LL);
    }
  }

  CFRelease(v14);

  return v15;
}

- (BOOL)deleteIdentity:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4) {
    *a4 = 0LL;
  }
  CFUUIDRef v7 = sub_188787C54(v5);
  char v8 = AKSIdentityDelete();
  if ((v8 & 1) != 0)
  {
    if (qword_18C4EC2A8 != -1) {
      dispatch_once(&qword_18C4EC2A8, &unk_18A27E138);
    }
    unsigned int v9 = (os_log_s *)(id)qword_18C4EC298;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v10 = sub_18878BC68();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v11 = v10;
      }
      else {
        unsigned int v11 = v10 & 0xFFFFFFFE;
      }
      if (v11)
      {
        uint64_t v12 = _os_log_send_and_compose_impl();
        id v13 = (void *)v12;
        if (v12) {
          sub_18878BC90(v12);
        }
      }

      else
      {
        id v13 = 0LL;
      }

      free(v13);
    }
  }

  else
  {
    if (qword_18C4EC2A8 != -1) {
      dispatch_once(&qword_18C4EC2A8, &unk_18A27E138);
    }
    CFUUIDRef v14 = (os_log_s *)(id)qword_18C4EC298;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      unsigned int v15 = sub_18878BC68();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        unsigned int v16 = v15;
      }
      else {
        unsigned int v16 = v15 & 0xFFFFFFFE;
      }
      if (v16)
      {
        uint64_t v17 = _os_log_send_and_compose_impl();
        unsigned int v18 = (void *)v17;
        if (v17) {
          sub_18878BC90(v17);
        }
      }

      else
      {
        unsigned int v18 = 0LL;
      }

      free(v18);
    }

    if (a4) {
      *a4 = 0LL;
    }
    else {
      CFRelease(0LL);
    }
  }

  CFRelease(v7);

  return v8;
}

- (BOOL)isIdentityLoadedIntoSession:(unsigned int)a3
{
  int system = aks_get_system();
  int v4 = system;
  if (system)
  {
    if (system == -536870160)
    {
      if (qword_18C4EC2A8 != -1) {
        dispatch_once(&qword_18C4EC2A8, &unk_18A27E138);
      }
      id v5 = (os_log_s *)(id)qword_18C4EC298;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v6 = sub_18878BC68();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
          unsigned int v7 = v6;
        }
        else {
          unsigned int v7 = v6 & 0xFFFFFFFE;
        }
        if (v7)
        {
LABEL_26:
          uint64_t v12 = _os_log_send_and_compose_impl();
          id v13 = (void *)v12;
          if (v12) {
            sub_18878BC90(v12);
          }
          goto LABEL_29;
        }

- (BOOL)loadIdentity:(id)a3 intoSession:(unsigned int)a4 error:(id *)a5
{
  id v6 = a3;
  unsigned int v7 = v6;
  if (a5) {
    *a5 = 0LL;
  }
  CFUUIDRef v8 = sub_188787C54(v6);
  char v9 = AKSIdentityLoad();
  if ((v9 & 1) != 0)
  {
    if (qword_18C4EC2A8 != -1) {
      dispatch_once(&qword_18C4EC2A8, &unk_18A27E138);
    }
    unsigned int v10 = (os_log_s *)(id)qword_18C4EC298;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v11 = sub_18878BC68();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v12 = v11;
      }
      else {
        unsigned int v12 = v11 & 0xFFFFFFFE;
      }
      if (v12)
      {
        uint64_t v13 = _os_log_send_and_compose_impl();
        CFUUIDRef v14 = (void *)v13;
        if (v13) {
          sub_18878BC90(v13);
        }
      }

      else
      {
        CFUUIDRef v14 = 0LL;
      }

      free(v14);
    }
  }

  else
  {
    if (qword_18C4EC2A8 != -1) {
      dispatch_once(&qword_18C4EC2A8, &unk_18A27E138);
    }
    unsigned int v15 = (os_log_s *)(id)qword_18C4EC298;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      unsigned int v16 = sub_18878BC68();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        unsigned int v17 = v16;
      }
      else {
        unsigned int v17 = v16 & 0xFFFFFFFE;
      }
      if (v17)
      {
        uint64_t v18 = _os_log_send_and_compose_impl();
        uint64_t v19 = (void *)v18;
        if (v18) {
          sub_18878BC90(v18);
        }
      }

      else
      {
        uint64_t v19 = 0LL;
      }

      free(v19);
    }

    if (a5) {
      *a5 = 0LL;
    }
    else {
      CFRelease(0LL);
    }
  }

  CFRelease(v8);

  return v9;
}

- (BOOL)unloadIdentityFromSession:(unsigned int)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0LL;
  }
  char v5 = AKSIdentityUnload();
  if ((v5 & 1) != 0)
  {
    if (qword_18C4EC2A8 != -1) {
      dispatch_once(&qword_18C4EC2A8, &unk_18A27E138);
    }
    id v6 = (os_log_s *)(id)qword_18C4EC298;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v7 = sub_18878BC68();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v8 = v7;
      }
      else {
        unsigned int v8 = v7 & 0xFFFFFFFE;
      }
      if (v8)
      {
        uint64_t v9 = _os_log_send_and_compose_impl();
        unsigned int v10 = (void *)v9;
        if (v9) {
          sub_18878BC90(v9);
        }
      }

      else
      {
        unsigned int v10 = 0LL;
      }

      free(v10);
    }
  }

  else
  {
    if (qword_18C4EC2A8 != -1) {
      dispatch_once(&qword_18C4EC2A8, &unk_18A27E138);
    }
    unsigned int v11 = (os_log_s *)(id)qword_18C4EC298;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      unsigned int v12 = sub_18878BC68();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        unsigned int v13 = v12;
      }
      else {
        unsigned int v13 = v12 & 0xFFFFFFFE;
      }
      if (v13)
      {
        uint64_t v14 = _os_log_send_and_compose_impl();
        unsigned int v15 = (void *)v14;
        if (v14) {
          sub_18878BC90(v14);
        }
      }

      else
      {
        unsigned int v15 = 0LL;
      }

      free(v15);
    }

    if (a4) {
      *a4 = 0LL;
    }
    else {
      CFRelease(0LL);
    }
  }

  return v5;
}

- (BOOL)unlockIdentityInSession:(unsigned int)a3 passcode:(id)a4 error:(id *)a5
{
  if (a5) {
    *a5 = 0LL;
  }
  id v6 = sub_1887851D4(self, a4);
  [v6 bytes];
  [v6 length];
  int v7 = aks_unlock_device();
  if (v7)
  {
    if (qword_18C4EC2A8 != -1) {
      dispatch_once(&qword_18C4EC2A8, &unk_18A27E138);
    }
    unsigned int v8 = (os_log_s *)(id)qword_18C4EC298;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      unsigned int v9 = sub_18878BC68();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        unsigned int v10 = v9;
      }
      else {
        unsigned int v10 = v9 & 0xFFFFFFFE;
      }
      if (v10)
      {
        uint64_t v11 = _os_log_send_and_compose_impl();
        unsigned int v12 = (void *)v11;
        if (v11) {
          sub_18878BC90(v11);
        }
      }

      else
      {
        unsigned int v12 = 0LL;
      }

      free(v12);
    }

    if (a5)
    {
      [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607670] code:v7 userInfo:0];
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    if (qword_18C4EC2A8 != -1) {
      dispatch_once(&qword_18C4EC2A8, &unk_18A27E138);
    }
    unsigned int v13 = (os_log_s *)(id)qword_18C4EC298;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v14 = sub_18878BC68();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v15 = v14;
      }
      else {
        unsigned int v15 = v14 & 0xFFFFFFFE;
      }
      if (v15)
      {
        uint64_t v16 = _os_log_send_and_compose_impl();
        unsigned int v17 = (void *)v16;
        if (v16) {
          sub_18878BC90(v16);
        }
      }

      else
      {
        unsigned int v17 = 0LL;
      }

      free(v17);
    }
  }

  return v7 == 0;
}

- (BOOL)loginIdentity:(id)a3 intoSession:(unsigned int)a4 passcode:(id)a5 error:(id *)a6
{
  id v9 = a3;
  if (a6) {
    *a6 = 0LL;
  }
  id v10 = a5;
  CFUUIDRef v11 = sub_188787C54(v9);
  sub_1887851D4(self, v10);

  char v12 = AKSIdentityLogin();
  if ((v12 & 1) != 0)
  {
    if (qword_18C4EC2A8 != -1) {
      dispatch_once(&qword_18C4EC2A8, &unk_18A27E138);
    }
    unsigned int v13 = (os_log_s *)(id)qword_18C4EC298;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v14 = sub_18878BC68();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v15 = v14;
      }
      else {
        unsigned int v15 = v14 & 0xFFFFFFFE;
      }
      if (v15)
      {
        uint64_t v16 = _os_log_send_and_compose_impl();
        unsigned int v17 = (void *)v16;
        if (v16) {
          sub_18878BC90(v16);
        }
      }

      else
      {
        unsigned int v17 = 0LL;
      }

      free(v17);
    }
  }

  else
  {
    if (qword_18C4EC2A8 != -1) {
      dispatch_once(&qword_18C4EC2A8, &unk_18A27E138);
    }
    uint64_t v18 = (os_log_s *)(id)qword_18C4EC298;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      unsigned int v19 = sub_18878BC68();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        unsigned int v20 = v19;
      }
      else {
        unsigned int v20 = v19 & 0xFFFFFFFE;
      }
      if (v20)
      {
        uint64_t v21 = _os_log_send_and_compose_impl();
        unsigned int v22 = (void *)v21;
        if (v21) {
          sub_18878BC90(v21);
        }
      }

      else
      {
        unsigned int v22 = 0LL;
      }

      free(v22);
    }

    if (a6) {
      *a6 = 0LL;
    }
    else {
      CFRelease(0LL);
    }
  }

  CFRelease(v11);

  return v12;
}

- (BOOL)addPersonaWithUUID:(id)a3 toSession:(unsigned int)a4 passcode:(id)a5 error:(id *)a6
{
  id v9 = a3;
  if (a6) {
    *a6 = 0LL;
  }
  id v10 = a5;
  CFUUIDRef v11 = sub_188787C54(v9);
  sub_1887851D4(self, v10);

  char v12 = AKSIdentityAddPersona();
  if ((v12 & 1) != 0)
  {
    if (qword_18C4EC2A8 != -1) {
      dispatch_once(&qword_18C4EC2A8, &unk_18A27E138);
    }
    unsigned int v13 = (os_log_s *)(id)qword_18C4EC298;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v14 = sub_18878BC68();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v15 = v14;
      }
      else {
        unsigned int v15 = v14 & 0xFFFFFFFE;
      }
      if (v15)
      {
        uint64_t v16 = _os_log_send_and_compose_impl();
        unsigned int v17 = (void *)v16;
        if (v16) {
          sub_18878BC90(v16);
        }
      }

      else
      {
        unsigned int v17 = 0LL;
      }

      free(v17);
    }
  }

  else
  {
    if (qword_18C4EC2A8 != -1) {
      dispatch_once(&qword_18C4EC2A8, &unk_18A27E138);
    }
    uint64_t v18 = (os_log_s *)(id)qword_18C4EC298;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      unsigned int v19 = sub_18878BC68();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        unsigned int v20 = v19;
      }
      else {
        unsigned int v20 = v19 & 0xFFFFFFFE;
      }
      if (v20)
      {
        uint64_t v21 = _os_log_send_and_compose_impl();
        unsigned int v22 = (void *)v21;
        if (v21) {
          sub_18878BC90(v21);
        }
      }

      else
      {
        unsigned int v22 = 0LL;
      }

      free(v22);
    }

    if (a6) {
      *a6 = 0LL;
    }
    else {
      CFRelease(0LL);
    }
  }

  CFRelease(v11);

  return v12;
}

- (BOOL)deletePersonaWithUUID:(id)a3 fromSession:(unsigned int)a4 error:(id *)a5
{
  id v6 = a3;
  int v7 = v6;
  if (a5) {
    *a5 = 0LL;
  }
  CFUUIDRef v8 = sub_188787C54(v6);
  char v9 = AKSIdentityDeletePersona();
  if ((v9 & 1) != 0)
  {
    if (qword_18C4EC2A8 != -1) {
      dispatch_once(&qword_18C4EC2A8, &unk_18A27E138);
    }
    id v10 = (os_log_s *)(id)qword_18C4EC298;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v11 = sub_18878BC68();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v12 = v11;
      }
      else {
        unsigned int v12 = v11 & 0xFFFFFFFE;
      }
      if (v12)
      {
        uint64_t v13 = _os_log_send_and_compose_impl();
        unsigned int v14 = (void *)v13;
        if (v13) {
          sub_18878BC90(v13);
        }
      }

      else
      {
        unsigned int v14 = 0LL;
      }

      free(v14);
    }
  }

  else
  {
    if (qword_18C4EC2A8 != -1) {
      dispatch_once(&qword_18C4EC2A8, &unk_18A27E138);
    }
    unsigned int v15 = (os_log_s *)(id)qword_18C4EC298;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      unsigned int v16 = sub_18878BC68();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        unsigned int v17 = v16;
      }
      else {
        unsigned int v17 = v16 & 0xFFFFFFFE;
      }
      if (v17)
      {
        uint64_t v18 = _os_log_send_and_compose_impl();
        unsigned int v19 = (void *)v18;
        if (v18) {
          sub_18878BC90(v18);
        }
      }

      else
      {
        unsigned int v19 = 0LL;
      }

      free(v19);
    }

    if (a5) {
      *a5 = 0LL;
    }
    else {
      CFRelease(0LL);
    }
  }

  CFRelease(v8);

  return v9;
}

- (BOOL)mapVolume:(id)a3 toSession:(unsigned int)a4 withPersona:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  if (a6) {
    *a6 = 0LL;
  }
  if (-[UMAppleKeyStoreProvider ignoreIdentityMethods](self, "ignoreIdentityMethods"))
  {
    if (qword_18C4EC2A8 != -1) {
      dispatch_once(&qword_18C4EC2A8, &unk_18A27E138);
    }
    unsigned int v11 = (os_log_s *)(id)qword_18C4EC298;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v12 = sub_18878BC68();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v13 = v12;
      }
      else {
        unsigned int v13 = v12 & 0xFFFFFFFE;
      }
      if (v13)
      {
        uint64_t v14 = _os_log_send_and_compose_impl();
        unsigned int v15 = (void *)v14;
        if (v14) {
          sub_18878BC90(v14);
        }
      }

      else
      {
        unsigned int v15 = 0LL;
      }

      free(v15);
    }

    char v17 = 1;
    goto LABEL_44;
  }

  CFUUIDRef v16 = sub_188787C54(v10);
  char v17 = AKSVolumeMap();
  if ((v17 & 1) == 0)
  {
    if (qword_18C4EC2A8 != -1) {
      dispatch_once(&qword_18C4EC2A8, &unk_18A27E138);
    }
    unsigned int v23 = (os_log_s *)(id)qword_18C4EC298;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      unsigned int v24 = sub_18878BC68();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        unsigned int v25 = v24;
      }
      else {
        unsigned int v25 = v24 & 0xFFFFFFFE;
      }
      if (v25)
      {
        uint64_t v26 = _os_log_send_and_compose_impl();
        uint64_t v27 = (void *)v26;
        if (v26) {
          sub_18878BC90(v26);
        }
      }

      else
      {
        uint64_t v27 = 0LL;
      }

      free(v27);
    }

    if (a6)
    {
      *a6 = 0LL;
      if (!v10) {
        goto LABEL_44;
      }
    }

    else
    {
      CFRelease(0LL);
      if (!v10) {
        goto LABEL_44;
      }
    }

- (BOOL)unmapVolume:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (a4) {
    *a4 = 0LL;
  }
  if (-[UMAppleKeyStoreProvider ignoreIdentityMethods](self, "ignoreIdentityMethods"))
  {
    if (qword_18C4EC2A8 != -1) {
      dispatch_once(&qword_18C4EC2A8, &unk_18A27E138);
    }
    int v7 = (os_log_s *)(id)qword_18C4EC298;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v8 = sub_18878BC68();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v9 = v8;
      }
      else {
        unsigned int v9 = v8 & 0xFFFFFFFE;
      }
      if (v9)
      {
        uint64_t v10 = _os_log_send_and_compose_impl();
        unsigned int v11 = (void *)v10;
        if (v10) {
          sub_18878BC90(v10);
        }
      }

      else
      {
        unsigned int v11 = 0LL;
      }

      free(v11);
    }

    char v12 = 1;
  }

  else
  {
    char v12 = AKSVolumeUnmap();
    if ((v12 & 1) != 0)
    {
      if (qword_18C4EC2A8 != -1) {
        dispatch_once(&qword_18C4EC2A8, &unk_18A27E138);
      }
      unsigned int v13 = (os_log_s *)(id)qword_18C4EC298;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v14 = sub_18878BC68();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
          unsigned int v15 = v14;
        }
        else {
          unsigned int v15 = v14 & 0xFFFFFFFE;
        }
        if (v15)
        {
          uint64_t v16 = _os_log_send_and_compose_impl();
          char v17 = (void *)v16;
          if (v16) {
            sub_18878BC90(v16);
          }
        }

        else
        {
          char v17 = 0LL;
        }

        free(v17);
      }
    }

    else
    {
      if (qword_18C4EC2A8 != -1) {
        dispatch_once(&qword_18C4EC2A8, &unk_18A27E138);
      }
      uint64_t v18 = (os_log_s *)(id)qword_18C4EC298;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        unsigned int v19 = sub_18878BC68();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          unsigned int v20 = v19;
        }
        else {
          unsigned int v20 = v19 & 0xFFFFFFFE;
        }
        if (v20)
        {
          uint64_t v21 = _os_log_send_and_compose_impl();
          unsigned int v22 = (void *)v21;
          if (v21) {
            sub_18878BC90(v21);
          }
        }

        else
        {
          unsigned int v22 = 0LL;
        }

        free(v22);
      }

      if (a4) {
        *a4 = 0LL;
      }
      else {
        CFRelease(0LL);
      }
    }
  }

  return v12;
}

- (BOOL)ignoreIdentityMethods
{
  return self->_ignoreIdentityMethods;
}

- (void)setIgnoreIdentityMethods:(BOOL)a3
{
  self->_ignoreIdentityMethods = a3;
}

@end
@interface CKKeyParameter
- (BOOL)SOSTransportKeyParameterHandleKeyParameterChanges:(id)a3 data:(__CFData *)a4 err:(__CFError *)a5;
- (BOOL)SOSTransportKeyParameterKVSAppendKeyInterests:(id)a3 ak:(__CFArray *)a4 firstUnLock:(__CFArray *)a5 unlocked:(__CFArray *)a6 err:(__CFError *)a7;
- (BOOL)SOSTransportKeyParameterPublishCloudParameters:(id)a3 data:(__CFData *)a4 err:(__CFError *)a5;
- (CKKeyParameter)initWithAccount:(id)a3;
- (SOSAccount)account;
- (id)SOSTransportKeyParameterGetAccount:(id)a3;
- (int64_t)SOSTransportKeyParameterGetTransportType:(id)a3 err:(__CFError *)a4;
- (void)setAccount:(id)a3;
@end

@implementation CKKeyParameter

- (BOOL)SOSTransportKeyParameterHandleKeyParameterChanges:(id)a3 data:(__CFData *)a4 err:(__CFError *)a5
{
  v43 = a5;
  v6 = self->account;
  v7 = v6;
  if (v6)
  {
    if (-[SOSAccount accountIsChanging](v6, "accountIsChanging"))
    {
      v8 = sub_10001267C("circleOps");
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "SOSAccountHandleParametersChange called before signing in to new account",  buf,  2u);
      }

      BOOL v10 = 1;
      goto LABEL_62;
    }

    CFTypeRef cf = 0LL;
    CFTypeRef cf2 = 0LL;
LABEL_7:
    sub_1001965A8((uint64_t)@"SOSAccountHandleParametersChange got new user key parameters:", (CFDataRef)cf);
    v11 = (__SecKey *)SOSCopyIDOfKeyWithLength(cf2, 8LL, 0LL);
    v12 = sub_10001267C("circleOps");
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v47 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "SOSAccountHandleParametersChange got new public key: %@",  buf,  0xCu);
    }

    if (v11) {
      CFRelease(v11);
    }
    v14 = -[SOSAccount accountKey](v7, "accountKey");
    if (v14 && cf2)
    {
      if (CFEqual(v14, cf2)) {
        goto LABEL_14;
      }
    }

    else if (v14 == cf2)
    {
LABEL_14:
      v15 = sub_10001267C("circleOps");
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v17 = "Got same public key sent our way. Ignoring.";
LABEL_45:
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 2u);
        goto LABEL_46;
      }

      goto LABEL_46;
    }

    v18 = -[SOSAccount previousAccountKey](v7, "previousAccountKey");
    CFTypeRef v19 = cf2;
    if (v18 && cf2)
    {
      if (!CFEqual(v18, cf2))
      {
        CFTypeRef v19 = cf2;
        goto LABEL_24;
      }
    }

    else if (v18 != cf2)
    {
LABEL_24:
      v20 = v7;
      if (-[SOSAccount accountKeyIsTrusted](v20, "accountKeyIsTrusted") && -[SOSAccount accountKey](v20, "accountKey"))
      {
        v21 = sub_10001267C("circleOps");
        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = -[SOSAccount accountKey](v20, "accountKey");
          *(_DWORD *)buf = 138412290;
          v47 = v23;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Moving : %@ to previousAccountKey",  buf,  0xCu);
        }

        -[SOSAccount setPreviousAccountKey:](v20, "setPreviousAccountKey:", -[SOSAccount accountKey](v20, "accountKey"));
      }

      -[SOSAccount setAccountKey:](v20, "setAccountKey:", v19);
      -[SOSAccount setAccountKeyIsTrusted:](v20, "setAccountKeyIsTrusted:", 0LL);
      if (!-[SOSAccount previousAccountKey](v20, "previousAccountKey")) {
        -[SOSAccount setPreviousAccountKey:](v20, "setPreviousAccountKey:", -[SOSAccount accountKey](v20, "accountKey"));
      }
      v24 = (__SecKey *)SOSCopyIDOfKeyWithLength(-[SOSAccount accountKey](v20, "accountKey"), 8LL, 0LL);
      v25 = sub_10001267C("circleOps");
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v47 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "not trusting new public key: %@",  buf,  0xCu);
      }

      if (v24) {
        CFRelease(v24);
      }

      CFTypeRef v27 = cf2;
      if (cf2)
      {
        CFTypeRef cf2 = 0LL;
        CFRelease(v27);
      }

      -[SOSAccount setAccountKeyDerivationParameters:](v20, "setAccountKeyDerivationParameters:", cf);
      v28 = v20;
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount _password_tmp](v28, "_password_tmp"));

      if (!v29)
      {
        v30 = sub_10001267C("circleOps");
        v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Password cache expired", buf, 2u);
        }
      }

      v32 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount _password_tmp](v28, "_password_tmp"));

      if (v32)
      {
        CFRetain(v32);
        int v33 = sub_10019AAC0(v28, 0LL, (const __CFData *)v32, 0LL);
        CFRelease(v32);
      }

      else
      {
        int v33 = 0;
      }

      v35 = sub_10001267C("circleOps");
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
      if (v33)
      {
        if (v37)
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Successfully used cached password with new parameters",  buf,  2u);
        }

        sub_10019969C(v28, (uint64_t)&v43);
      }

      else
      {
        if (v37)
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Got new parameters for public key - could not find or use cached password",  buf,  2u);
        }

        sub_100199760(v28);
      }

      v38 = sub_10001267C("circleop");
      v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "Setting account.key_interests_need_updating to true in SOSAccountHandleParametersChange",  buf,  2u);
      }

      BOOL v10 = 1;
      -[SOSAccount setCircle_rings_retirements_need_attention:](v28, "setCircle_rings_retirements_need_attention:", 1LL);
      -[SOSAccount setKey_interests_need_updating:](v28, "setKey_interests_need_updating:", 1LL);
      goto LABEL_58;
    }

    v34 = sub_10001267C("circleOps");
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v17 = "Got previous public key repeated. Ignoring.";
      goto LABEL_45;
    }

- (id)SOSTransportKeyParameterGetAccount:(id)a3
{
  return self->account;
}

- (int64_t)SOSTransportKeyParameterGetTransportType:(id)a3 err:(__CFError *)a4
{
  return 1LL;
}

- (CKKeyParameter)initWithAccount:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CKKeyParameter;
  v5 = -[CKKeyParameter init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    -[CKKeyParameter setAccount:](v5, "setAccount:", v4);
    v7 = v6;
    v8 = (__CFArray *)sub_1001B4DA4();
    CFArrayAppendValue(v8, v7);
  }

  return v6;
}

- (BOOL)SOSTransportKeyParameterKVSAppendKeyInterests:(id)a3 ak:(__CFArray *)a4 firstUnLock:(__CFArray *)a5 unlocked:(__CFArray *)a6 err:(__CFError *)a7
{
  return 1;
}

- (BOOL)SOSTransportKeyParameterPublishCloudParameters:(id)a3 data:(__CFData *)a4 err:(__CFError *)a5
{
  v8 = sub_10001267C("circleOps");
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (a4)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Publishing Cloud Parameters", buf, 2u);
    }

    CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(kCFAllocatorDefault, 0LL, @"[");
    double Current = CFAbsoluteTimeGetCurrent();
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_1001BCF88;
    v36[3] = &unk_1002931B8;
    v36[4] = MutableCopy;
    sub_100013840((uint64_t)v36, Current);
    CFStringAppend(MutableCopy, @"]");
    ExternalRepresentation = CFStringCreateExternalRepresentation(0LL, MutableCopy, 0x8000100u, 0x3Fu);
    CFIndex Length = CFDataGetLength(ExternalRepresentation);
    CFIndex v15 = CFDataGetLength(a4);
    Mutable = CFDataCreateMutable(kCFAllocatorDefault, v15 + Length);
    BytePtr = CFDataGetBytePtr(ExternalRepresentation);
    CFIndex v18 = CFDataGetLength(ExternalRepresentation);
    CFDataAppendBytes(Mutable, BytePtr, v18);
    CFTypeRef v19 = CFDataGetBytePtr(a4);
    CFIndex v20 = CFDataGetLength(a4);
    CFDataAppendBytes(Mutable, v19, v20);
    CFDataRef Copy = CFDataCreateCopy(kCFAllocatorDefault, Mutable);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SOSAccount peerID](self->account, "peerID"));

    if (v22) {
      uint64_t v23 = SOSLastKeyParametersPushedKeyCreateWithPeerID(v22);
    }
    else {
      uint64_t v23 = SOSLastKeyParametersPushedKeyCreateWithAccountGestalt(self->account);
    }
    v31 = (const void *)v23;
    CFDictionaryRef v32 = sub_100107FA8(kCFAllocatorDefault, v24, v25, v26, v27, v28, v29, v30, kSOSKVSKeyParametersKey, (uint64_t)a4);
    if (v31) {
      CFRelease(v31);
    }
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(-2LL, 0LL);
    v34 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    SOSCloudKeychainPutObjectsInCloud(v32, v34, &stru_100293010);

    sub_1001C4B5C(1LL);
    if (v32) {
      CFRelease(v32);
    }
    if (ExternalRepresentation) {
      CFRelease(ExternalRepresentation);
    }
    if (Copy) {
      CFRelease(Copy);
    }
    if (Mutable) {
      CFRelease(Mutable);
    }
    if (MutableCopy) {
      CFRelease(MutableCopy);
    }
  }

  else
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Tried to publish nil Cloud Parameters",  buf,  2u);
    }

    sub_100019570(0LL, (CFTypeRef *)a5, @"Tried to publish nil Cloud Parameters");
  }

  return a4 != 0LL;
}

- (SOSAccount)account
{
  return (SOSAccount *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
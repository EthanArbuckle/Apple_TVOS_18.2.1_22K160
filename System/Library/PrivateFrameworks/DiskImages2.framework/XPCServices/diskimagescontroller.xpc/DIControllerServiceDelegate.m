@interface DIControllerServiceDelegate
+ (BOOL)sendHandleToClient:(id)a3 clientConnection:(id)a4 outError:(id *)a5;
+ (BOOL)tryAttachWithParams:(id)a3 clientConnection:(id)a4 outError:(id *)a5;
- (BOOL)checkAttachEntitlementWithError:(id *)a3;
- (BOOL)setupNewConnection:(id)a3;
- (id)serviceName;
- (void)GUIAskForPassphraseWithEncryptionFrontend:(id)a3 reply:(id)a4;
- (void)attachWithParams:(id)a3 reply:(id)a4;
- (void)convertWithParams:(id)a3 reply:(id)a4;
- (void)createAndStoreInSystemKeychainWithCreator:(id)a3 account:(id)a4 reply:(id)a5;
- (void)dupWithStderrHandle:(id)a3 reply:(id)a4;
- (void)embedUserDataWithParams:(id)a3 reply:(id)a4;
- (void)enterSandbox;
- (void)keychainUnlockWithEncryptionUnlocker:(id)a3 reply:(id)a4;
- (void)retrieveStatsWithParams:(id)a3 reply:(id)a4;
- (void)retrieveUserDataWithParams:(id)a3 reply:(id)a4;
- (void)verifyWithParams:(id)a3 reply:(id)a4;
@end

@implementation DIControllerServiceDelegate

- (id)serviceName
{
  return @"com.apple.diskimagescontroller";
}

+ (BOOL)sendHandleToClient:(id)a3 clientConnection:(id)a4 outError:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = sub_10002D874;
  v19 = sub_10002D884;
  id v20 = 0LL;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10002D88C;
  v14[3] = &unk_100175B88;
  v14[4] = &v15;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 synchronousRemoteObjectProxyWithErrorHandler:v14]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10002DA58;
  v13[3] = &unk_100175B88;
  v13[4] = &v15;
  [v9 attachCompletedWithHandle:v7 reply:v13];
  v10 = (void *)v16[5];
  if (a5 && v10)
  {
    *a5 = v10;
    v10 = (void *)v16[5];
  }

  BOOL v11 = v10 == 0LL;

  _Block_object_dispose(&v15, 8);
  return v11;
}

+ (BOOL)tryAttachWithParams:(id)a3 clientConnection:(id)a4 outError:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  while (1)
  {
    v10 = -[DIController2IO_XPCHandlerAttach initWithParams:]( objc_alloc(&OBJC_CLASS___DIController2IO_XPCHandlerAttach),  "initWithParams:",  v6);
    id v52 = 0LL;
    id v11 = -[DIController2IO_XPCHandlerAttach runWithError:](v10, "runWithError:", &v52);
    id v12 = v52;
    if (v11)
    {
      id v51 = v12;
      unsigned __int8 v13 = +[DIControllerServiceDelegate sendHandleToClient:clientConnection:outError:]( &OBJC_CLASS___DIControllerServiceDelegate,  "sendHandleToClient:clientConnection:outError:",  v11,  v7,  &v51);
      id v14 = v51;

      id v12 = v14;
      if ((v13 & 1) == 0) {
        break;
      }
    }

    -[DIBaseXPCHandler closeConnection](v10, "closeConnection");
    if (!v12)
    {

      id v14 = 0LL;
      BOOL v43 = 1;
      goto LABEL_51;
    }

    if ([v12 code] == (id)155
      || [v12 code] == (id)151
      || [v12 code] == (id)4097
      || [v12 code] == (id)4099)
    {
      uint64_t v15 = v9 + 1;
      if (v9 == 5) {
        goto LABEL_47;
      }
      if (v9)
      {
        int v16 = *__error();
        if (sub_1000BE2F0())
        {
          uint64_t v50 = 0LL;
          uint64_t v17 = sub_1000BE278();
          v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
          *(_DWORD *)buf = 68158210;
          if (v19) {
            uint64_t v20 = 3LL;
          }
          else {
            uint64_t v20 = 2LL;
          }
          int v54 = 77;
          __int16 v55 = 2080;
          v56 = "+[DIControllerServiceDelegate tryAttachWithParams:clientConnection:outError:]";
          __int16 v57 = 2114;
          id v58 = v12;
          LODWORD(v45) = 28;
          v21 = (char *)_os_log_send_and_compose_impl( v20,  &v50,  0LL,  0LL,  &_mh_execute_header,  v18,  16LL,  "%.*s: Connection attempt failed: %{public}@, retrying",  buf,  v45);

          if (v21)
          {
            fprintf(__stderrp, "%s\n", v21);
            free(v21);
          }
        }

        else
        {
          uint64_t v28 = sub_1000BE278();
          v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 68158210;
            int v54 = 77;
            __int16 v55 = 2080;
            v56 = "+[DIControllerServiceDelegate tryAttachWithParams:clientConnection:outError:]";
            __int16 v57 = 2114;
            id v58 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "%.*s: Connection attempt failed: %{public}@, retrying",  buf,  0x1Cu);
          }
        }

        *__error() = v16;
        usleep(0x7A120u);
        uint64_t v8 = 0LL;
        uint64_t v9 = v15;
      }

      else
      {
        int v22 = *__error();
        if (sub_1000BE2F0())
        {
          uint64_t v50 = 0LL;
          uint64_t v23 = sub_1000BE278();
          v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
          BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
          *(_DWORD *)buf = 68158210;
          if (v25) {
            uint64_t v26 = 3LL;
          }
          else {
            uint64_t v26 = 2LL;
          }
          int v54 = 77;
          __int16 v55 = 2080;
          v56 = "+[DIControllerServiceDelegate tryAttachWithParams:clientConnection:outError:]";
          __int16 v57 = 2114;
          id v58 = v12;
          LODWORD(v45) = 28;
          v27 = (char *)_os_log_send_and_compose_impl( v26,  &v50,  0LL,  0LL,  &_mh_execute_header,  v24,  0LL,  "%.*s: First connection attempt failed: %{public}@, retrying",  buf,  v45);

          if (v27)
          {
            fprintf(__stderrp, "%s\n", v27);
            free(v27);
          }
        }

        else
        {
          uint64_t v30 = sub_1000BE278();
          v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 68158210;
            int v54 = 77;
            __int16 v55 = 2080;
            v56 = "+[DIControllerServiceDelegate tryAttachWithParams:clientConnection:outError:]";
            __int16 v57 = 2114;
            id v58 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "%.*s: First connection attempt failed: %{public}@, retrying",  buf,  0x1Cu);
          }
        }

        *__error() = v22;
        usleep(0x186A0u);
        uint64_t v8 = 0LL;
        uint64_t v9 = 1LL;
      }
    }

    else
    {
      if ([v12 code] != (id)168)
      {
LABEL_47:
        id v14 = v12;
        break;
      }

      uint64_t v32 = v8 + 1;
      if (v8 == 34)
      {
        id v14 = (id)objc_claimAutoreleasedReturnValue( +[DIError errorWithEnumValue:verboseInfo:]( &OBJC_CLASS___DIError,  "errorWithEnumValue:verboseInfo:",  159LL,  @"Timeout waiting for a completion of an ongoing eject"));

        break;
      }

      if (!v8)
      {
        int v33 = *__error();
        if (sub_1000BE2F0())
        {
          int v47 = v33;
          uint64_t v50 = 0LL;
          uint64_t v34 = sub_1000BE278();
          v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
            uint64_t v35 = 3LL;
          }
          else {
            uint64_t v35 = 2LL;
          }
          v36 = (void *)objc_claimAutoreleasedReturnValue([v6 inputURL]);
          v37 = (void *)objc_claimAutoreleasedReturnValue([v36 path]);
          *(_DWORD *)buf = 68158211;
          int v54 = 77;
          __int16 v55 = 2080;
          v56 = "+[DIControllerServiceDelegate tryAttachWithParams:clientConnection:outError:]";
          __int16 v57 = 2113;
          id v58 = v37;
          LODWORD(v45) = 28;
          v38 = (char *)_os_log_send_and_compose_impl( v35,  &v50,  0LL,  0LL,  &_mh_execute_header,  v46,  16LL,  "%.*s: Waiting for completion of an ongoing eject of %{private}@",  buf,  v45);

          int v33 = v47;
          if (v38)
          {
            fprintf(__stderrp, "%s\n", v38);
            free(v38);
          }
        }

        else
        {
          uint64_t v39 = sub_1000BE278();
          v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            int v48 = v33;
            v41 = (void *)objc_claimAutoreleasedReturnValue([v6 inputURL]);
            v42 = (void *)objc_claimAutoreleasedReturnValue([v41 path]);
            *(_DWORD *)buf = 68158211;
            int v54 = 77;
            __int16 v55 = 2080;
            v56 = "+[DIControllerServiceDelegate tryAttachWithParams:clientConnection:outError:]";
            __int16 v57 = 2113;
            id v58 = v42;
            _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "%.*s: Waiting for completion of an ongoing eject of %{private}@",  buf,  0x1Cu);

            int v33 = v48;
          }
        }

        *__error() = v33;
      }

      sleep(1u);
      uint64_t v8 = v32;
    }
  }

  if (a5)
  {
    id v14 = v14;
    BOOL v43 = 0;
    *a5 = v14;
  }

  else
  {
    BOOL v43 = 0;
  }

- (BOOL)checkAttachEntitlementWithError:(id *)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForEntitlement:@"com.apple.diskimages.attach"]);

  if (v5
    && (objc_opt_respondsToSelector(v5, "BOOLValue") & 1) != 0
    && ([v5 BOOLValue] & 1) != 0)
  {
    int v6 = *__error();
    if (sub_1000BE2F0())
    {
      uint64_t v17 = 0LL;
      uint64_t v7 = sub_1000BE278();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v9 = 3LL;
      }
      else {
        uint64_t v9 = 2LL;
      }
      *(_DWORD *)buf = 68157954;
      int v19 = 63;
      __int16 v20 = 2080;
      v21 = "-[DIControllerServiceDelegate checkAttachEntitlementWithError:]";
      LODWORD(v16) = 18;
      v10 = (char *)_os_log_send_and_compose_impl( v9,  &v17,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "%.*s: Client is entitled to attach disk images",  (int)buf,  v16);

      if (v10)
      {
        fprintf(__stderrp, "%s\n", v10);
        free(v10);
      }
    }

    else
    {
      uint64_t v14 = sub_1000BE278();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v19 = 63;
        __int16 v20 = 2080;
        v21 = "-[DIControllerServiceDelegate checkAttachEntitlementWithError:]";
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%.*s: Client is entitled to attach disk images",  buf,  0x12u);
      }
    }

    *__error() = v6;
    BOOL v12 = 1;
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Missing entitlement: %@",  @"com.apple.diskimages.attach"));
    BOOL v12 = +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  158LL,  v11,  a3);
  }

  return v12;
}

- (void)attachWithParams:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v17 = 0LL;
  unsigned __int8 v8 = -[DIControllerServiceDelegate checkAttachEntitlementWithError:](self, "checkAttachEntitlementWithError:", &v17);
  id v9 = v17;
  if ((v8 & 1) != 0)
  {
    v15[0] = 0LL;
    v15[1] = v15;
    v15[2] = 0x3032000000LL;
    v15[3] = sub_10002D874;
    v15[4] = sub_10002D884;
    id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DIBaseServiceDelegate dispatchQueue](self, "dispatchQueue"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10002E810;
    v11[3] = &unk_100175BB0;
    id v12 = v6;
    uint64_t v14 = v15;
    id v13 = v7;
    dispatch_async(v10, v11);

    _Block_object_dispose(v15, 8);
  }

  else
  {
    (*((void (**)(id, id))v7 + 2))(v7, v9);
  }
}

- (void)dupWithStderrHandle:(id)a3 reply:(id)a4
{
  v5 = (void (**)(id, void *))a4;
  LODWORD(a3) = [a3 fileDescriptor];
  int v6 = fileno(__stderrp);
  if (dup2((int)a3, v6) < 0)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[DIError errorWithEnumValue:verboseInfo:]( &OBJC_CLASS___DIError,  "errorWithEnumValue:verboseInfo:",  154LL,  @"Error duplicating stderr"));
  }

  else
  {
    int v7 = *__error();
    if (sub_1000BE2F0())
    {
      uint64_t v16 = 0LL;
      uint64_t v8 = sub_1000BE278();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v10 = 3LL;
      }
      else {
        uint64_t v10 = 2LL;
      }
      *(_DWORD *)buf = 68157954;
      int v18 = 57;
      __int16 v19 = 2080;
      __int16 v20 = "-[DIControllerServiceDelegate dupWithStderrHandle:reply:]";
      LODWORD(v15) = 18;
      id v11 = (char *)_os_log_send_and_compose_impl( v10,  &v16,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "%.*s: stderr duplicated",  (int)buf,  v15);

      if (v11)
      {
        fprintf(__stderrp, "%s\n", v11);
        free(v11);
      }
    }

    else
    {
      uint64_t v13 = sub_1000BE278();
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v18 = 57;
        __int16 v19 = 2080;
        __int16 v20 = "-[DIControllerServiceDelegate dupWithStderrHandle:reply:]";
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%.*s: stderr duplicated", buf, 0x12u);
      }
    }

    id v12 = 0LL;
    *__error() = v7;
  }

  v5[2](v5, v12);
}

- (void)convertWithParams:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DIBaseServiceDelegate dispatchQueue](self, "dispatchQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10002EB70;
  v11[3] = &unk_100175BD8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

- (void)verifyWithParams:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DIBaseServiceDelegate dispatchQueue](self, "dispatchQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10002ED4C;
  v11[3] = &unk_100175BD8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

- (void)embedUserDataWithParams:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DIBaseServiceDelegate dispatchQueue](self, "dispatchQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10002EF20;
  v11[3] = &unk_100175BD8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

- (void)retrieveUserDataWithParams:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DIBaseServiceDelegate dispatchQueue](self, "dispatchQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10002F0F4;
  v11[3] = &unk_100175BD8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

- (void)keychainUnlockWithEncryptionUnlocker:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DIBaseServiceDelegate dispatchQueue](self, "dispatchQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10002F2F0;
  v11[3] = &unk_100175BD8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

- (void)GUIAskForPassphraseWithEncryptionFrontend:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DIBaseServiceDelegate dispatchQueue](self, "dispatchQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10002F4D4;
  v11[3] = &unk_100175BD8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

- (void)createAndStoreInSystemKeychainWithCreator:(id)a3 account:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DIBaseServiceDelegate dispatchQueue](self, "dispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002F6DC;
  block[3] = &unk_100175C00;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, block);
}

- (void)retrieveStatsWithParams:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DIBaseServiceDelegate dispatchQueue](self, "dispatchQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10002F8C4;
  v11[3] = &unk_100175BD8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

- (BOOL)setupNewConnection:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___DIControllerProtocol));
  [v4 setExportedInterface:v5];

  [v4 setExportedObject:self];
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___DIController2ClientProtocol));
  [v4 setRemoteObjectInterface:v6];

  [v4 setInterruptionHandler:&stru_100175C68];
  [v4 setInvalidationHandler:&stru_100175C88];

  return 1;
}

- (void)enterSandbox
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DIControllerServiceDelegate;
  -[DIBaseServiceDelegate enterSandbox](&v3, "enterSandbox");
}

@end
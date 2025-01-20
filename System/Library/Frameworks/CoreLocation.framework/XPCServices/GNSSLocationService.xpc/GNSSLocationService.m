void sub_1000028DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000298C(_Unwind_Exception *a1)
{
  v4 = v3;

  _Unwind_Resume(a1);
}

LABEL_8:
    [v5 invalidate];
    v8 = 0;
    goto LABEL_9;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___GNSSLocationServiceProtocol));
  [v5 setExportedInterface:v6];

  v7 = objc_opt_new(&OBJC_CLASS___GNSSLocationService);
  -[GNSSLocationService setEntitlementsForRaven:](v7, "setEntitlementsForRaven:", self->hasEntitlementToRunRaven);
  [v5 setExportedObject:v7];
  [v5 resume];

  v8 = 1;
LABEL_9:

  return v8;
}

void sub_100002B80(_Unwind_Exception *a1)
{
  v3 = v2;

  _Unwind_Resume(a1);
}

int main(int argc, const char **argv, const char **envp)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "CLGLS,GNSSLocationService,Start GNSSLocationService",  buf,  2u);
  }

  v3 = objc_opt_new(&OBJC_CLASS___GNSSLocationServiceDelegate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v4 setDelegate:v3];
  [v4 resume];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "CLGLS,GNSSLocationService,listener resume GNSSLocationService",  v6,  2u);
  }

  return 0;
}

void sub_100002CA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100002DC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100002E98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100002F10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100002F80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100002FC8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100002FD8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100003010( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}
d, void))a3 + 2))(a3, 0LL);
}

- (void)raiseRavenEventsFromData:(id)a3
{
}

- (void)setEntitlementsForRaven:(BOOL)a3
{
  self->hasEntitlementToRunRaven = a3;
}

- (void).cxx_destruct
{
}

@end
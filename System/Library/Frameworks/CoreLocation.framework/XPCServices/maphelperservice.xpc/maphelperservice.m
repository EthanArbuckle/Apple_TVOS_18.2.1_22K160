LABEL_8:
    [v5 invalidate];
    v8 = 0;
    goto LABEL_9;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___CLMapHelperServiceProtocol));
  [v5 setExportedInterface:v6];

  v7 = objc_opt_new(&OBJC_CLASS___CLMapHelperService);
  -[CLMapHelperService setEntitlementsForRoad:](v7, "setEntitlementsForRoad:", self->hasEntitlementForRoadData);
  -[CLMapHelperService setEntitlementsForBuilding:]( v7,  "setEntitlementsForBuilding:",  self->hasEntitlementForBuildingData);
  [v5 setExportedObject:v7];
  [v5 resume];

  v8 = 1;
LABEL_9:

  return v8;
}

int main(int argc, const char **argv, const char **envp)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "CLTSP,MapHelperService,Start maphelperservice",  buf,  2u);
  }

  v3 = objc_opt_new(&OBJC_CLASS___CLMapHelperServiceDelegate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v4 setDelegate:v3];
  [v4 resume];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "CLTSP,MapHelperService,listener resume maphelperservice",  v6,  2u);
  }

  return 0;
}
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}
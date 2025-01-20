@interface EscrowGenericResponse
- (EscrowGenericResponse)initWithURLResponse:(id)a3 data:(id)a4;
- (NSString)message;
- (id)errorMessage;
- (int64_t)errorCode;
- (int64_t)status;
- (int64_t)version;
@end

@implementation EscrowGenericResponse

- (EscrowGenericResponse)initWithURLResponse:(id)a3 data:(id)a4
{
  id v6 = a3;
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___EscrowGenericResponse;
  v7 = -[LakituResponse initWithURLResponse:data:](&v36, "initWithURLResponse:data:", v6, a4);
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[LakituResponse requestUUID](v7, "requestUUID"));
    uint64_t v10 = CloudServicesLog();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v6 URL]);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 host]);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v6 URL]);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 path]);
      *(_DWORD *)buf = 138412802;
      v38 = v13;
      __int16 v39 = 2112;
      v40 = v15;
      __int16 v41 = 2112;
      v42 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "got response from host %@ path %@ uuid %@",  buf,  0x20u);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[LakituResponse error](v8, "error"));
    if (v16 || -[EscrowGenericResponse status](v8, "status"))
    {
    }

    else if (!-[EscrowGenericResponse errorCode](v8, "errorCode"))
    {
LABEL_24:

      goto LABEL_25;
    }

    uint64_t v17 = CloudServicesLog();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100043348(v8);
    }

    uint64_t v19 = CloudServicesLog();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1000432CC(v8);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[LakituResponse error](v8, "error"));
    id v22 = [v21 code];

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[LakituResponse error](v8, "error"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 localizedDescription]);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericResponse message](v8, "message"));
    if (v25)
    {
      uint64_t v26 = objc_claimAutoreleasedReturnValue(-[EscrowGenericResponse message](v8, "message"));
    }

    else
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowGenericResponse errorMessage](v8, "errorMessage"));

      if (!v27) {
        goto LABEL_16;
      }
      uint64_t v26 = objc_claimAutoreleasedReturnValue(-[EscrowGenericResponse errorMessage](v8, "errorMessage"));
    }

    v28 = (void *)v26;

    v24 = v28;
LABEL_16:
    if (-[EscrowGenericResponse status](v8, "status"))
    {
      id v29 = -[EscrowGenericResponse status](v8, "status");
    }

    else
    {
      if (!-[EscrowGenericResponse errorCode](v8, "errorCode"))
      {
LABEL_21:
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[LakituResponse error](v8, "error"));
        v31 = (void *)objc_claimAutoreleasedReturnValue([v30 userInfo]);
        v32 = (NSMutableDictionary *)[v31 mutableCopy];

        if (!v32) {
          v32 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        }
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[LakituResponse error](v8, "error"));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v32,  "setObject:forKeyedSubscript:",  v33,  NSUnderlyingErrorKey);

        -[NSMutableDictionary setObject:forKeyedSubscript:]( v32,  "setObject:forKeyedSubscript:",  v24,  NSLocalizedDescriptionKey);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v9, @"uuid");
        v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kEscrowServiceErrorDomain,  v22,  v32));
        -[LakituResponse setError:](v8, "setError:", v34);

        goto LABEL_24;
      }

      id v29 = -[EscrowGenericResponse errorCode](v8, "errorCode");
    }

    id v22 = v29;
    goto LABEL_21;
  }

- (int64_t)version
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LakituResponse responseDictionary](self, "responseDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"version"]);
  id v4 = [v3 integerValue];

  return (int64_t)v4;
}

- (int64_t)status
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LakituResponse responseDictionary](self, "responseDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"status"]);
  id v4 = [v3 integerValue];

  return (int64_t)v4;
}

- (NSString)message
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LakituResponse responseDictionary](self, "responseDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"message"]);

  return (NSString *)v3;
}

- (id)errorMessage
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LakituResponse responseDictionary](self, "responseDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"errorMessage"]);

  return v3;
}

- (int64_t)errorCode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LakituResponse responseDictionary](self, "responseDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"errorCode"]);
  id v4 = [v3 integerValue];

  return (int64_t)v4;
}

@end
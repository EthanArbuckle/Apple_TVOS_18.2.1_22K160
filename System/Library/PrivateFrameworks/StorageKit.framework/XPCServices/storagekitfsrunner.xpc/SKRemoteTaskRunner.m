@interface SKRemoteTaskRunner
- (NSXPCConnection)connection;
- (SKRemoteTaskRunner)initWithConnection:(id)a3;
- (void)formatAPFSWithName:(id)a3 diskIdentifier:(id)a4 caseSensitive:(BOOL)a5 password:(id)a6 withReply:(id)a7;
- (void)runTask:(id)a3 arguments:(id)a4 withReply:(id)a5;
@end

@implementation SKRemoteTaskRunner

- (SKRemoteTaskRunner)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SKRemoteTaskRunner;
  v6 = -[SKRemoteTaskRunner init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (void)runTask:(id)a3 arguments:(id)a4 withReply:(id)a5
{
  v8 = (void (**)(id, void *, id))a5;
  id v9 = a4;
  id v10 = a3;
  v11 = -[SKTask initWithExecutable:arguments:]( objc_alloc(&OBJC_CLASS___SKTask),  "initWithExecutable:arguments:",  v10,  v9);

  dispatch_queue_t v12 = dispatch_queue_create("com.apple.storagekitfsrunner.queue", &_dispatch_queue_attr_concurrent);
  v35 = self;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SKRemoteTaskRunner connection](self, "connection"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 remoteObjectProxy]);

  v15 = objc_alloc(&OBJC_CLASS___SKTaskRawParser);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_1000050F4;
  v40[3] = &unk_1000084F0;
  v16 = v12;
  v41 = v16;
  id v17 = v14;
  id v42 = v17;
  v18 = -[SKTaskRawParser initWithCallback:](v15, "initWithCallback:", v40);
  -[SKTask setStdoutParser:](v11, "setStdoutParser:", v18);

  v19 = objc_alloc(&OBJC_CLASS___SKTaskRawParser);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_1000051C4;
  v37[3] = &unk_1000084F0;
  v20 = v16;
  v38 = v20;
  id v21 = v17;
  id v39 = v21;
  v22 = -[SKTaskRawParser initWithCallback:](v19, "initWithCallback:", v37);
  -[SKTask setStderrParser:](v11, "setStderrParser:", v22);

  v23 = objc_alloc(&OBJC_CLASS___SKTaskExecuter);
  v47 = v11;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v47, 1LL));
  v25 = -[SKTaskExecuter initWithTasks:](v23, "initWithTasks:", v24);

  id v36 = 0LL;
  unsigned int v26 = -[SKTaskExecuter waitWithError:](v25, "waitWithError:", &v36);
  id v27 = v36;
  -[SKTask setStderrParser:](v11, "setStderrParser:", 0LL);
  -[SKTask setStdoutParser:](v11, "setStdoutParser:", 0LL);
  dispatch_barrier_sync(v20, &stru_100008510);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask stdoutHandle](v11, "stdoutHandle"));
  v29 = (void *)objc_claimAutoreleasedReturnValue([v28 readDataToEndOfFile]);

  if (v29 && [v29 length]) {
    [v21 sendStdout:v29];
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask stderrHandle](v11, "stderrHandle"));
  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 readDataToEndOfFile]);

  if (v31 && [v31 length]) {
    [v21 sendStderr:v31];
  }
  id v32 = SKGetOSLog();
  v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v44 = "-[SKRemoteTaskRunner runTask:arguments:withReply:]";
    __int16 v45 = 1024;
    unsigned int v46 = v26;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%s: Replying with %d", buf, 0x12u);
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v26 ^ 1));
  v8[2](v8, v34, v27);

  -[NSXPCConnection invalidate](v35->_connection, "invalidate");
}

- (void)formatAPFSWithName:(id)a3 diskIdentifier:(id)a4 caseSensitive:(BOOL)a5 password:(id)a6 withReply:(id)a7
{
  BOOL v9 = a5;
  id v12 = a4;
  id v13 = a6;
  if (v9) {
    v14 = @"-e";
  }
  else {
    v14 = @"-i";
  }
  id v15 = a7;
  id v16 = a3;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"/dev/%@", v12));
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  v14,  @"-v",  v16,  @"-w",  v17,  0LL));

  if (v13)
  {
    v32[0] = @"-E";
    v32[1] = @"-S";
    v32[2] = v13;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 3LL));
    uint64_t v20 = objc_claimAutoreleasedReturnValue([v19 arrayByAddingObjectsFromArray:v18]);

    v18 = (void *)v20;
  }

  id v21 = SKGetOSLog();
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v25 = "-[SKRemoteTaskRunner formatAPFSWithName:diskIdentifier:caseSensitive:password:withReply:]";
    __int16 v26 = 2112;
    id v27 = apfsFormatterPath;
    __int16 v28 = 2112;
    id v29 = v12;
    __int16 v30 = 2112;
    v31 = v18;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s: Running %@ on %@, %@", buf, 0x2Au);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", apfsFormatterPath));
  -[SKRemoteTaskRunner runTask:arguments:withReply:](self, "runTask:arguments:withReply:", v23, v18, v15);
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end
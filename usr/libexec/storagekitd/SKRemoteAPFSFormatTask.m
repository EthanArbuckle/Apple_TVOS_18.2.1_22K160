@interface SKRemoteAPFSFormatTask
- (BOOL)caseSensitive;
- (BOOL)waitWithError:(id *)a3;
- (NSNumber)terminationStatus;
- (NSString)name;
- (NSString)password;
- (NSXPCConnection)connectionToService;
- (SKDisk)disk;
- (SKProgress)progress;
- (SKRemoteAPFSFormatTask)initWithName:(id)a3 disk:(id)a4 caseSensitive:(BOOL)a5 password:(id)a6;
- (SKTaskDataParser)stderrParser;
- (SKTaskDataParser)stdoutParser;
- (void)sendStderr:(id)a3;
- (void)sendStdout:(id)a3;
- (void)setProgress:(id)a3;
- (void)setStderrParser:(id)a3;
- (void)setStdoutParser:(id)a3;
- (void)setTerminationStatus:(id)a3;
@end

@implementation SKRemoteAPFSFormatTask

- (SKRemoteAPFSFormatTask)initWithName:(id)a3 disk:(id)a4 caseSensitive:(BOOL)a5 password:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___SKRemoteAPFSFormatTask;
  v14 = -[SKRemoteAPFSFormatTask init](&v22, "init");
  if (v14)
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue(+[SKProgress progressWithTotalUnitCount:](&OBJC_CLASS___SKProgress, "progressWithTotalUnitCount:", 100LL));
    progress = v14->_progress;
    v14->_progress = (SKProgress *)v15;

    objc_storeStrong((id *)&v14->_name, a3);
    objc_storeStrong((id *)&v14->_disk, a4);
    v14->_caseSensitive = a5;
    objc_storeStrong((id *)&v14->_password, a6);
    v17 = -[NSXPCConnection initWithServiceName:options:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithServiceName:options:",  @"com.apple.storagekitfsrunner",  4096LL);
    connectionToService = v14->_connectionToService;
    v14->_connectionToService = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___SKRemoteTaskRunnerProtocol));
    -[NSXPCConnection setRemoteObjectInterface:](v14->_connectionToService, "setRemoteObjectInterface:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___SKRemoteTaskDataProtocol));
    -[NSXPCConnection setExportedInterface:](v14->_connectionToService, "setExportedInterface:", v20);

    -[NSXPCConnection setExportedObject:](v14->_connectionToService, "setExportedObject:", v14);
    -[NSXPCConnection setInterruptionHandler:](v14->_connectionToService, "setInterruptionHandler:", &stru_100045630);
    -[NSXPCConnection setInvalidationHandler:](v14->_connectionToService, "setInvalidationHandler:", &stru_100045650);
    -[NSXPCConnection resume](v14->_connectionToService, "resume");
  }

  return v14;
}

- (BOOL)waitWithError:(id *)a3
{
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  v26 = sub_10002593C;
  v27 = sub_10002594C;
  id v28 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0xFFFFFFFFLL));
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  v20 = sub_10002593C;
  v21 = sub_10002594C;
  id v22 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKRemoteAPFSFormatTask connectionToService](self, "connectionToService"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100025954;
  v16[3] = &unk_100045678;
  v16[4] = &v17;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 synchronousRemoteObjectProxyWithErrorHandler:v16]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKRemoteAPFSFormatTask name](self, "name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKRemoteAPFSFormatTask disk](self, "disk"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 diskIdentifier]);
  BOOL v10 = -[SKRemoteAPFSFormatTask caseSensitive](self, "caseSensitive");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKRemoteAPFSFormatTask password](self, "password"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100025964;
  v15[3] = &unk_1000456A0;
  v15[4] = &v23;
  v15[5] = &v17;
  [v6 formatAPFSWithName:v7 diskIdentifier:v9 caseSensitive:v10 password:v11 withReply:v15];

  id v12 = (void *)v18[5];
  if (v12)
  {
    unsigned __int8 v13 = 0;
    if (a3) {
      *a3 = v12;
    }
  }

  else
  {
    -[NSXPCConnection invalidate](self->_connectionToService, "invalidate");
    if ([(id)v24[5] integerValue]) {
      unsigned __int8 v13 = +[SKError failWithPOSIXCode:error:]( SKError,  "failWithPOSIXCode:error:",  [(id)v24[5] integerValue],  a3);
    }
    else {
      unsigned __int8 v13 = 1;
    }
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v13;
}

- (void)sendStdout:(id)a3
{
  id v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKRemoteAPFSFormatTask stdoutParser](self, "stdoutParser"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKRemoteAPFSFormatTask stdoutParser](self, "stdoutParser"));
    [v5 parseData:v6];
  }
}

- (void)sendStderr:(id)a3
{
  id v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKRemoteAPFSFormatTask stderrParser](self, "stderrParser"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKRemoteAPFSFormatTask stderrParser](self, "stderrParser"));
    [v5 parseData:v6];
  }
}

- (SKTaskDataParser)stdoutParser
{
  return self->_stdoutParser;
}

- (void)setStdoutParser:(id)a3
{
}

- (SKTaskDataParser)stderrParser
{
  return self->_stderrParser;
}

- (void)setStderrParser:(id)a3
{
}

- (NSXPCConnection)connectionToService
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (SKDisk)disk
{
  return (SKDisk *)objc_getProperty(self, a2, 48LL, 1);
}

- (BOOL)caseSensitive
{
  return self->_caseSensitive;
}

- (NSString)password
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (SKProgress)progress
{
  return (SKProgress *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setProgress:(id)a3
{
}

- (NSNumber)terminationStatus
{
  return (NSNumber *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setTerminationStatus:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
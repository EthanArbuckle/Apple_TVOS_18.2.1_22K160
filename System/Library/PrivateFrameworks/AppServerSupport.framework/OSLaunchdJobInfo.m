@interface OSLaunchdJobInfo
- (BOOL)removing;
- (NSUUID)instance;
- (OSLaunchdJobExitStatus)lastExitStatus;
- (OSLaunchdJobInfo)initWithState:(int64_t)a3 pid:(int)a4 lastSpawnError:(int)a5 lastExitStatus:(id)a6 additionalPropertiesDict:(id)a7 removing:(BOOL)a8 instance:(id)a9;
- (OS_xpc_object)additionalPropertiesDictionary;
- (id)description;
- (int)lastSpawnError;
- (int)pid;
- (int64_t)state;
@end

@implementation OSLaunchdJobInfo

- (OSLaunchdJobInfo)initWithState:(int64_t)a3 pid:(int)a4 lastSpawnError:(int)a5 lastExitStatus:(id)a6 additionalPropertiesDict:(id)a7 removing:(BOOL)a8 instance:(id)a9
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v15 = a6;
  id v16 = a7;
  id v17 = a9;
  switch(a3)
  {
    case 1LL:
      if (a4) {
        -[OSLaunchdJobInfo initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:].cold.3( &v24,  v25);
      }
      if (a5) {
        -[OSLaunchdJobInfo initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:].cold.2( &v24,  v25);
      }
      if (v15) {
        -[OSLaunchdJobInfo initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:].cold.1( &v24,  v25);
      }
      return result;
    case 2LL:
      if (!a4) {
        -[OSLaunchdJobInfo initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:].cold.4( &v24,  v25);
      }
      if (a5) {
        -[OSLaunchdJobInfo initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:].cold.2( &v24,  v25);
      }
      return result;
    case 3LL:
      if (a4) {
        -[OSLaunchdJobInfo initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:].cold.3( &v24,  v25);
      }
      if (!a5) {
        -[OSLaunchdJobInfo initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:].cold.6( &v24,  v25);
      }
      if (v15) {
        -[OSLaunchdJobInfo initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:].cold.1( &v24,  v25);
      }
      return result;
    case 4LL:
      if (a4) {
        -[OSLaunchdJobInfo initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:].cold.3( &v24,  v25);
      }
      if (a5) {
        -[OSLaunchdJobInfo initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:].cold.2( &v24,  v25);
      }
      if (!v15) {
        -[OSLaunchdJobInfo initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:].cold.9( &v24,  v25);
      }
      return result;
    default:
      break;
  }

  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___OSLaunchdJobInfo;
  v18 = -[OSLaunchdJobInfo init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_state = a3;
    v18->_pid = a4;
    v18->_lastSpawnError = a5;
    objc_storeStrong((id *)&v18->_lastExitStatus, a6);
    objc_storeStrong((id *)&v19->_additionalPropertiesDictionary, a7);
    v19->_removing = a8;
    objc_storeStrong((id *)&v19->_instance, a9);
    v20 = v19;
  }

  return v19;
}

- (id)description
{
  int64_t state = self->_state;
  switch(state)
  {
    case 4LL:
      v3 = (void *)NSString;
      unint64_t lastExitStatus = (unint64_t)self->_lastExitStatus;
      v5 = @"exited, %@";
      break;
    case 3LL:
      v7 = (void *)NSString;
      unint64_t lastExitStatus = self->_lastSpawnError;
      uint64_t pid = xpc_strerror();
      v5 = @"spawn failed, error=%d: %s";
      v6 = v7;
      goto LABEL_10;
    case 2LL:
      v3 = (void *)NSString;
      v4 = "removing";
      if (!self->_removing) {
        v4 = "running";
      }
      unint64_t lastExitStatus = (unint64_t)v4;
      uint64_t pid = self->_pid;
      v5 = @"%s, pid=%d";
      break;
    default:
      v8 = @"never ran";
      return v8;
  }

  v6 = v3;
LABEL_10:
  objc_msgSend(v6, "stringWithFormat:", v5, lastExitStatus, pid);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  return v8;
}

- (int64_t)state
{
  return self->_state;
}

- (int)pid
{
  return self->_pid;
}

- (int)lastSpawnError
{
  return self->_lastSpawnError;
}

- (OSLaunchdJobExitStatus)lastExitStatus
{
  return self->_lastExitStatus;
}

- (OS_xpc_object)additionalPropertiesDictionary
{
  return self->_additionalPropertiesDictionary;
}

- (BOOL)removing
{
  return self->_removing;
}

- (NSUUID)instance
{
  return self->_instance;
}

- (void).cxx_destruct
{
}

- (void)initWithState:(void *)a1 pid:(_OWORD *)a2 lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:.cold.1( void *a1,  _OWORD *a2)
{
}

- (void)initWithState:(void *)a1 pid:(_OWORD *)a2 lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:.cold.2( void *a1,  _OWORD *a2)
{
}

- (void)initWithState:(void *)a1 pid:(_OWORD *)a2 lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:.cold.3( void *a1,  _OWORD *a2)
{
}

- (void)initWithState:(void *)a1 pid:(_OWORD *)a2 lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:.cold.4( void *a1,  _OWORD *a2)
{
}

- (void)initWithState:(void *)a1 pid:(_OWORD *)a2 lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:.cold.6( void *a1,  _OWORD *a2)
{
}

- (void)initWithState:(void *)a1 pid:(_OWORD *)a2 lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:.cold.9( void *a1,  _OWORD *a2)
{
}

@end
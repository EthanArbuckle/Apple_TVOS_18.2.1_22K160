@interface CPLPagerOutput
- (CPLPagerOutput)initWithInputFromOutput:(id)a3 interruptionHandler:(id)a4;
- (id)interruptionHandler;
- (void)_fdIsInvalid;
- (void)_taskHasFinished;
- (void)closeOutput;
- (void)cplInterrupt;
@end

@implementation CPLPagerOutput

- (CPLPagerOutput)initWithInputFromOutput:(id)a3 interruptionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  *(void *)v28 = 0LL;
  if (pipe(v28)) {
    sub_10001CA14();
  }
  int v8 = v28[0];
  int v9 = v28[1];
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___CPLPagerOutput;
  id v10 = -[CPLOutput initWithFileDescriptor:isATTY:supportsEscapeSequences:usesColor:]( &v26,  "initWithFileDescriptor:isATTY:supportsEscapeSequences:usesColor:",  v28[1],  [v6 isATTY],  objc_msgSend(v6, "supportsEscapeSequences"),  objc_msgSend(v6, "usesColor"));
  if (!v10) {
    goto LABEL_16;
  }
  dispatch_queue_t v11 = dispatch_queue_create("com.apple.cplctl.pipe", 0LL);
  v12 = (void *)*((void *)v10 + 7);
  *((void *)v10 + 7) = v11;

  id v13 = [v7 copy];
  v14 = (void *)*((void *)v10 + 11);
  *((void *)v10 + 11) = v13;

  *((_DWORD *)v10 + 20) = -1;
  if (posix_spawn_file_actions_init(&v25)) {
    sub_10001C9EC();
  }
  if (posix_spawn_file_actions_addclose(&v25, v9)) {
    sub_10001C9C4();
  }
  if (posix_spawn_file_actions_adddup2(&v25, v8, 0)) {
    sub_10001C99C();
  }
  if (posix_spawn_file_actions_addclose(&v25, v8)) {
    sub_10001C974();
  }
  pid_t v24 = -1;
  if (qword_10003D370 != -1) {
    dispatch_once(&qword_10003D370, &stru_100030CD8);
  }
  *(_OWORD *)__argv = off_100030CF8;
  os_unfair_lock_lock((os_unfair_lock_t)v10 + 13);
  int v15 = posix_spawn(&v24, "/usr/bin/less", &v25, 0LL, __argv, environ);
  if (v15)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)v10 + 13);
  }

  else
  {
    *((_DWORD *)v10 + 20) = v24;
    os_unfair_lock_unlock((os_unfair_lock_t)v10 + 13);
    dispatch_source_t v16 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_proc,  v24,  0x80000000uLL,  *((dispatch_queue_t *)v10 + 7));
    v17 = (void *)*((void *)v10 + 9);
    *((void *)v10 + 9) = v16;

    v18 = (dispatch_source_s *)*((void *)v10 + 9);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100008784;
    handler[3] = &unk_100030B88;
    id v23 = v10;
    dispatch_source_set_event_handler(v18, handler);
  }

  posix_spawn_file_actions_destroy(&v25);
  close(v8);
  if (!v15)
  {
    v20 = (dispatch_object_s *)*((void *)v10 + 9);
    if (v20)
    {
      dispatch_resume(v20);
LABEL_16:
      v19 = (CPLPagerOutput *)v10;
      goto LABEL_17;
    }
  }

  v19 = 0LL;
LABEL_17:

  return v19;
}

- (void)closeOutput
{
  v3 = (os_unfair_lock_s *)(&self->super._usesColor + 4);
  os_unfair_lock_lock((os_unfair_lock_t)&self->super._usesColor + 1);
  v4 = *(void **)&self->_pid;
  if (v4)
  {
    *(void *)&self->_pid = 0LL;
  }

  pid_t source = (pid_t)self->_source;
  os_unfair_lock_unlock(v3);
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CPLPagerOutput;
  -[CPLOutput closeOutput](&v8, "closeOutput");
  dispatch_source_cancel(*(dispatch_source_t *)&self->_finished);
  if (source != -1) {
    waitpid(source, &v7, 0);
  }
  id v6 = *(void **)&self->_finished;
  *(void *)&self->_finished = 0LL;
}

- (void)cplInterrupt
{
  v3 = (os_unfair_lock_s *)(&self->super._usesColor + 4);
  os_unfair_lock_lock((os_unfair_lock_t)&self->super._usesColor + 1);
  pid_t source = (pid_t)self->_source;
  if (source != -1) {
    kill(source, 9);
  }
  os_unfair_lock_unlock(v3);
}

- (void)_taskHasFinished
{
  v3 = (os_unfair_lock_s *)(&self->super._usesColor + 4);
  os_unfair_lock_lock((os_unfair_lock_t)&self->super._usesColor + 1);
  uint64_t v4 = *(void *)&self->_pid;
  if (v4)
  {
    (*(void (**)(void))(v4 + 16))();
    v5 = *(void **)&self->_pid;
    *(void *)&self->_pid = 0LL;
  }

  pid_t source = (pid_t)self->_source;
  os_unfair_lock_unlock(v3);
  if (source != -1) {
    waitpid(source, &v7, 0);
  }
}

- (void)_fdIsInvalid
{
  v3 = (os_unfair_lock_s *)(&self->super._usesColor + 4);
  os_unfair_lock_lock((os_unfair_lock_t)&self->super._usesColor + 1);
  uint64_t v4 = *(void *)&self->_pid;
  if (v4)
  {
    (*(void (**)(void))(v4 + 16))();
    v5 = *(void **)&self->_pid;
    *(void *)&self->_pid = 0LL;
  }

  os_unfair_lock_unlock(v3);
}

- (id)interruptionHandler
{
  return *(id *)&self->_pid;
}

- (void).cxx_destruct
{
}

@end
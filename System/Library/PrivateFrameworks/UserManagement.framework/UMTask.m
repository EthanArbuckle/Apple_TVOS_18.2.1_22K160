@interface UMTask
+ (id)taskWithName:(id)a3 reason:(id)a4;
+ (id)taskWithName:(id)a3 reason:(id)a4 forBundleID:(id)a5;
- (BOOL)isFinished;
- (NSString)bundleID;
- (NSString)name;
- (NSString)reason;
- (UMTask)init;
- (id)description;
- (int)pid;
- (void)begin;
- (void)end;
- (void)setBundleID:(id)a3;
- (void)setIsFinished:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setPid:(int)a3;
- (void)setReason:(id)a3;
@end

@implementation UMTask

+ (id)taskWithName:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_msgSend_mainBundle(MEMORY[0x1896077F8], v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bundleIdentifier(v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend_processInfo(MEMORY[0x1896079D8], v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_processName(v19, v20, v21, v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend_taskWithName_reason_forBundleID_(a1, v16, (uint64_t)v6, (uint64_t)v7, v15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)taskWithName:(id)a3 reason:(id)a4 forBundleID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)objc_opt_new();
  uint64_t v13 = v10;
  if (v10)
  {
    objc_msgSend_setName_(v10, v11, (uint64_t)v7, v12);
    objc_msgSend_setReason_(v13, v14, (uint64_t)v8, v15);
    objc_msgSend_setBundleID_(v13, v16, (uint64_t)v9, v17);
  }

  return v13;
}

- (UMTask)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UMTask;
  v2 = -[UMTask init](&v6, sel_init);
  if (v2)
  {
    if (qword_18C682BF8 != -1) {
      dispatch_once(&qword_18C682BF8, &unk_189DD5468);
    }
    v2->_pid = dword_18C682BF0;
    uint64_t v3 = objc_opt_new();
    uuid = v2->_uuid;
    v2->_uuid = (NSUUID *)v3;

    v2->_isFinished = 0;
  }

  return v2;
}

- (void)begin
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F48AF0(v3, self);
}

- (void)end
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F49AD8(v4, self);
}

- (id)description
{
  id v3 = (void *)NSString;
  sub_185F3E7CC((uint64_t)&OBJC_CLASS___UMMobileKeyBag, self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(v4, v5, v6, v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)@"%p%@", v10, self, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)setIsFinished:(BOOL)a3
{
  self->_isFinished = a3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (void).cxx_destruct
{
}

@end
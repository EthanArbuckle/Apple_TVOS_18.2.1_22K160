@interface CryptexSessionList
+ (id)createCryptexSessionList;
+ (id)sharedList;
- (NSMutableArray)list;
- (OS_os_log)log_handle;
- (id)findCryptexSession:(char *)a3;
- (void)addCryptexSession:(id)a3;
- (void)removeCryptexSession:(id)a3;
- (void)setList:(id)a3;
- (void)setLog_handle:(id)a3;
@end

@implementation CryptexSessionList

+ (id)createCryptexSessionList
{
  v2 = (char *)objc_alloc_init((Class)a1);
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.libcryptex", "usermanager");
    v4 = (void *)*((void *)v2 + 27);
    *((void *)v2 + 27) = v3;

    v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    v6 = (void *)*((void *)v2 + 26);
    *((void *)v2 + 26) = v5;

    pthread_rwlock_init((pthread_rwlock_t *)(v2 + 8), 0LL);
  }

  return v2;
}

+ (id)sharedList
{
  if (qword_10005A408 != -1) {
    dispatch_once(&qword_10005A408, &stru_1000555A0);
  }
  return (id)qword_10005A410;
}

- (void)addCryptexSession:(id)a3
{
  p_rw_lock = &self->rw_lock;
  id v5 = a3;
  pthread_rwlock_wrlock(p_rw_lock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSessionList list](self, "list"));
  [v6 addObject:v5];

  pthread_rwlock_unlock(p_rw_lock);
}

- (void)removeCryptexSession:(id)a3
{
  p_rw_lock = &self->rw_lock;
  id v5 = a3;
  pthread_rwlock_wrlock(p_rw_lock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSessionList list](self, "list"));
  [v6 removeObject:v5];

  pthread_rwlock_unlock(p_rw_lock);
}

- (id)findCryptexSession:(char *)a3
{
  p_rw_lock = &self->rw_lock;
  pthread_rwlock_rdlock(&self->rw_lock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSessionList list](self, "list"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000D340;
  v12[3] = &unk_1000555C0;
  v12[4] = a3;
  id v7 = [v6 indexOfObjectPassingTest:v12];

  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Error: couldn't find session for cryptex that exited.",  v11,  2u);
    }

    v8 = 0LL;
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CryptexSessionList list](self, "list"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:v7]);
  }

  pthread_rwlock_unlock(p_rw_lock);
  return v8;
}

- (NSMutableArray)list
{
  return (NSMutableArray *)objc_getProperty(self, a2, 208LL, 1);
}

- (void)setList:(id)a3
{
}

- (OS_os_log)log_handle
{
  return self->_log_handle;
}

- (void)setLog_handle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
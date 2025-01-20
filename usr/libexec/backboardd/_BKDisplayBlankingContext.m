@interface _BKDisplayBlankingContext
- (id)initForDisplay:(id)a3;
- (void)_updateBounds;
- (void)_wrapInCATransaction:(id)a3;
- (void)blank;
- (void)clear;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation _BKDisplayBlankingContext

- (id)initForDisplay:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____BKDisplayBlankingContext;
  v6 = -[_BKDisplayBlankingContext init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_display, a3);
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____BKDisplayBlankingContext;
  -[_BKDisplayBlankingContext dealloc](&v3, "dealloc");
}

- (void)blank
{
  if (self->_blankingContext)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Already have a context"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v8 = NSStringFromSelector(a2);
      objc_super v9 = (_BKDisplayBlankingContext *)objc_claimAutoreleasedReturnValue(v8);
      v11 = (objc_class *)objc_opt_class(self, v10);
      v12 = NSStringFromClass(v11);
      v13 = (CAWindowServerDisplay *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 138544642;
      v16 = v9;
      __int16 v17 = 2114;
      v18 = v13;
      __int16 v19 = 2048;
      v20 = self;
      __int16 v21 = 2114;
      v22 = @"_BKDisplayBlankingContext.m";
      __int16 v23 = 1024;
      int v24 = 33;
      __int16 v25 = 2114;
      v26 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v7 UTF8String]);
    __break(0);
    JUMPOUT(0x100015FECLL);
  }

  uint64_t v3 = BKLogCommon(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    display = self->_display;
    *(_DWORD *)buf = 138412546;
    v16 = self;
    __int16 v17 = 2112;
    v18 = display;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ - blanking display: %@", buf, 0x16u);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100016250;
  v14[3] = &unk_1000B8058;
  v14[4] = self;
  -[_BKDisplayBlankingContext _wrapInCATransaction:](self, "_wrapInCATransaction:", v14);
}

- (void)clear
{
  if (self->_blankingContext)
  {
    uint64_t v3 = BKLogCommon(self);
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      display = self->_display;
      *(_DWORD *)buf = 138412546;
      v8 = self;
      __int16 v9 = 2112;
      uint64_t v10 = display;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%@ - clearing blanked display: %@",  buf,  0x16u);
    }

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000161F8;
    v6[3] = &unk_1000B8058;
    v6[4] = self;
    -[_BKDisplayBlankingContext _wrapInCATransaction:](self, "_wrapInCATransaction:", v6);
  }

- (void)_updateBounds
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[CAContext layer](self->_blankingContext, "layer"));
  -[CAWindowServerDisplay bounds](self->_display, "bounds");
  objc_msgSend(v3, "setBounds:");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
}

- (void)_wrapInCATransaction:(id)a3
{
  if (a3)
  {
    id v3 = (void (**)(void))a3;
    +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
    v3[2](v3);

    +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
  }

- (void).cxx_destruct
{
}

@end
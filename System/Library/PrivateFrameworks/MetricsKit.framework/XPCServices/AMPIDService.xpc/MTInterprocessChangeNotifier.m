@interface MTInterprocessChangeNotifier
+ (id)fullIdentifier:(id)a3;
+ (void)notify:(id)a3;
- (MTInterprocessChangeNotifier)initWithIdentifier:(id)a3 onChange:(id)a4;
- (void)dealloc;
- (void)notify;
- (void)stop;
@end

@implementation MTInterprocessChangeNotifier

- (MTInterprocessChangeNotifier)initWithIdentifier:(id)a3 onChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MTInterprocessChangeNotifier;
  v8 = -[MTInterprocessChangeNotifier init](&v18, "init");
  if (!v8) {
    goto LABEL_6;
  }
  uint64_t v9 = objc_claimAutoreleasedReturnValue( +[MTInterprocessChangeNotifier fullIdentifier:]( &OBJC_CLASS___MTInterprocessChangeNotifier,  "fullIdentifier:",  v6));
  identifier = v8->_identifier;
  v8->_identifier = (NSString *)v9;

  v8->_token = -1;
  v11 = -[NSString UTF8String](v8->_identifier, "UTF8String");
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100006810;
  handler[3] = &unk_100020588;
  id v17 = v7;
  LODWORD(v11) = notify_register_dispatch(v11, &v8->_token, v13, handler);

  if (!(_DWORD)v11 && v8->_token != -1)
  {

LABEL_6:
    v14 = v8;
    goto LABEL_7;
  }

  v14 = 0LL;
LABEL_7:

  return v14;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTInterprocessChangeNotifier;
  -[MTInterprocessChangeNotifier dealloc](&v3, "dealloc");
}

- (void)notify
{
  if ((self->_token & 0x80000000) == 0) {
    notify_post(-[NSString UTF8String](self->_identifier, "UTF8String"));
  }
}

- (void)stop
{
  int token = self->_token;
  if ((token & 0x80000000) == 0 && notify_is_valid_token(token))
  {
    notify_cancel(self->_token);
    self->_int token = -1;
  }

+ (id)fullIdentifier:(id)a3
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"MTMetricsKit:%@", a3);
}

+ (void)notify:(id)a3
{
  id v3 = objc_claimAutoreleasedReturnValue([a1 fullIdentifier:a3]);
  notify_post((const char *)[v3 UTF8String]);
}

- (void).cxx_destruct
{
}

@end
@interface NSXPCConnection
- (void)rejectInvocation:(id)a3 withError:(id)a4 replyTypes:(id)a5;
@end

@implementation NSXPCConnection

- (void)rejectInvocation:(id)a3 withError:(id)a4 replyTypes:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v18 = v8;
  id v9 = a5;
  if (!v7)
  {
    id v14 = sub_10000B294(&qword_10002D0A0);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    LOWORD(v17) = 0;
    v15 = "Invalid parameter not satisfying: invocation";
LABEL_11:
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v17, 2u);
    goto LABEL_9;
  }

  if (!v8)
  {
    id v16 = sub_10000B294(&qword_10002D0A0);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    LOWORD(v17) = 0;
    v15 = "Invalid parameter not satisfying: error";
    goto LABEL_11;
  }

  uint64_t v17 = 0LL;
  objc_msgSend(v7, "getArgument:atIndex:", &v17, objc_msgSend(v7, "blockArgumentIndex"));
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSMethodSignature signatureWithObjCTypes:]( NSMethodSignature, "signatureWithObjCTypes:", [v9 UTF8String]));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSInvocation invocationWithMethodSignature:]( &OBJC_CLASS___NSInvocation,  "invocationWithMethodSignature:",  v10));
  id v12 = -[os_log_s argumentIndexForClass:](v10, "argumentIndexForClass:", objc_opt_class(&OBJC_CLASS___NSError));
  if (v12 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v13 = v12;
    [v11 retainArguments];
    [v11 setArgument:&v18 atIndex:v13];
  }

  [v11 setTarget:v17];
  [v11 invoke];

LABEL_9:
}

@end
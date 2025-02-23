@interface IDSGroupSendAheadObserver
- (IDSGroupSendAheadObserver)initWithProtectionSpace:(int64_t)a3;
- (NSString)topic;
- (void)_sendAheadGroup:(id)a3 withContext:(id)a4;
- (void)groupContext:(id)a3 didUpdateGroup:(id)a4 withNewGroup:(id)a5;
- (void)setTopic:(id)a3;
@end

@implementation IDSGroupSendAheadObserver

- (IDSGroupSendAheadObserver)initWithProtectionSpace:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IDSGroupSendAheadObserver;
  v4 = -[IDSGroupSendAheadObserver init](&v8, "init");
  v5 = v4;
  if (v4)
  {
    if (a3) {
      v6 = 0LL;
    }
    else {
      v6 = @"com.apple.madrid";
    }
    objc_storeStrong((id *)&v4->_topic, v6);
  }

  return v5;
}

- (void)_sendAheadGroup:(id)a3 withContext:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10026D3FC;
  v6[3] = &unk_1008FF198;
  v6[4] = self;
  id v7 = a3;
  id v5 = v7;
  [a4 _publicDataRepresentationForGroup:v5 completion:v6];
}

- (void)groupContext:(id)a3 didUpdateGroup:(id)a4 withNewGroup:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = OSLogHandleForIDSCategory("IDSGroupSendAheadObserver");
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupSendAheadObserver topic](self, "topic"));
    *(_DWORD *)buf = 138412290;
    v17 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Group updated, sending ahead to members { topic : %@ }",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v14)
    && _IDSShouldLog(0LL, @"IDSGroupSendAheadObserver"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSGroupSendAheadObserver topic](self, "topic"));
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSGroupSendAheadObserver",  @"Group updated, sending ahead to members { topic : %@ }");
  }

  -[IDSGroupSendAheadObserver _sendAheadGroup:withContext:](self, "_sendAheadGroup:withContext:", v10, v8, v15);
}

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
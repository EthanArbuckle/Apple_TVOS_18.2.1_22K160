@interface PTParameterRecords
- (NSMutableDictionary)recordDictionary;
- (PTParameterRecords)initWithDictionary:(id)a3;
- (void)addRecordWithKeyPath:(id)a3 domainID:(id)a4 recordClassName:(id)a5 value:(id)a6;
- (void)removeRecordWithKeyPath:(id)a3 domainID:(id)a4;
- (void)setRecordDictionary:(id)a3;
@end

@implementation PTParameterRecords

- (PTParameterRecords)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PTParameterRecords;
  v5 = -[PTParameterRecords init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    -[PTParameterRecords setRecordDictionary:](v5, "setRecordDictionary:", v4);
    if (!qword_10001BE90)
    {
      dispatch_queue_t v7 = dispatch_queue_create("com.apple.PrototypeTools.PTParameterRecords", 0LL);
      v8 = (void *)qword_10001BE90;
      qword_10001BE90 = (uint64_t)v7;
    }
  }

  return v6;
}

- (void)addRecordWithKeyPath:(id)a3 domainID:(id)a4 recordClassName:(id)a5 value:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (dispatch_queue_s *)qword_10001BE90;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004F08;
  block[3] = &unk_1000146D8;
  block[4] = self;
  id v20 = v11;
  id v21 = v10;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v10;
  id v18 = v11;
  dispatch_async(v14, block);
}

- (void)removeRecordWithKeyPath:(id)a3 domainID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (dispatch_queue_s *)qword_10001BE90;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000522C;
  block[3] = &unk_100014700;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (NSMutableDictionary)recordDictionary
{
  return self->_recordDictionary;
}

- (void)setRecordDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
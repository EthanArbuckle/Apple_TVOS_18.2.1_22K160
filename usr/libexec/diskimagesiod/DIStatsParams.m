@interface DIStatsParams
+ (BOOL)supportsSecureCoding;
- (DIStatsParams)initWithCoder:(id)a3;
- (DIStatsParams)initWithURL:(id)a3 instanceId:(id)a4 error:(id *)a5;
- (NSUUID)instanceID;
- (NSUUID)statInstanceID;
- (id)statsWithError:(id *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DIStatsParams

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIStatsParams)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___DIStatsParams;
  v6 = -[DIBaseParams initWithCoder:](&v11, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSUUID, v5),  @"statInstanceID");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    statInstanceID = v6->_statInstanceID;
    v6->_statInstanceID = (NSUUID *)v8;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DIStatsParams;
  id v4 = a3;
  -[DIBaseParams encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_statInstanceID, @"statInstanceID", v5.receiver, v5.super_class);
}

- (DIStatsParams)initWithURL:(id)a3 instanceId:(id)a4 error:(id *)a5
{
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___DIStatsParams;
  v10 = -[DIBaseParams initWithURL:error:](&v14, "initWithURL:error:", a3, a5);
  p_isa = (id *)&v10->super.super.isa;
  if (v10)
  {
    if (!-[DIBaseParams openExistingImageWithFlags:error:](v10, "openExistingImageWithFlags:error:", 0LL, a5))
    {
      v12 = 0LL;
      goto LABEL_6;
    }

    objc_storeStrong(p_isa + 7, a4);
  }

  v12 = p_isa;
LABEL_6:

  return v12;
}

- (id)statsWithError:(id *)a3
{
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = sub_1000941BC;
  v19 = sub_1000941CC;
  v20 = objc_alloc_init(&OBJC_CLASS___DIClient2Controller_XPCHandler);
  if ([(id)v16[5] connectWithError:a3])
  {
    uint64_t v9 = 0LL;
    v10 = &v9;
    uint64_t v11 = 0x3032000000LL;
    v12 = sub_1000941BC;
    v13 = sub_1000941CC;
    id v14 = 0LL;
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([(id)v16[5] remoteProxy]);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000941D4;
    v8[3] = &unk_100177F20;
    v8[4] = &v9;
    v8[5] = &v15;
    [v5 retrieveStatsWithParams:self reply:v8];

    else {
      id v6 = 0LL;
    }
    _Block_object_dispose(&v9, 8);
  }

  else
  {
    id v6 = 0LL;
  }

  _Block_object_dispose(&v15, 8);

  return v6;
}

- (NSUUID)instanceID
{
  statInstanceID = self->_statInstanceID;
  if (statInstanceID) {
    return statInstanceID;
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DIStatsParams;
  id v4 = -[DIBaseParams instanceID](&v5, "instanceID");
  return (NSUUID *)(id)objc_claimAutoreleasedReturnValue(v4);
}

- (NSUUID)statInstanceID
{
  return self->_statInstanceID;
}

- (void).cxx_destruct
{
}

@end
@interface Bulletin
- (BOOL)isEqual:(id)a3;
- (Bulletin)init;
- (unint64_t)hash;
@end

@implementation Bulletin

- (Bulletin)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___Bulletin;
  v2 = -[Bulletin init](&v9, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSDate);
    creationDate = v2->_creationDate;
    v2->_creationDate = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 UUIDString]);
    recordID = v2->_recordID;
    v2->_recordID = (NSString *)v6;
  }

  return v2;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_recordID, "hash");
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if (v6 == objc_opt_class(v4, v7))
  {
    if (self)
    {
      recordID = self->_recordID;
      if (v4)
      {
LABEL_5:
        uint64_t v10 = v4[7];
LABEL_6:
        v11 = recordID;
        unsigned __int8 v8 = -[NSString isEqualToString:](v11, "isEqualToString:", v10);

        goto LABEL_7;
      }
    }

    else
    {
      recordID = 0LL;
      if (v4) {
        goto LABEL_5;
      }
    }

    uint64_t v10 = 0LL;
    goto LABEL_6;
  }

  unsigned __int8 v8 = 0;
LABEL_7:

  return v8;
}

- (void).cxx_destruct
{
}

@end
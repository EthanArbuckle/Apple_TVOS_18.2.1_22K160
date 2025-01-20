@interface CPLCKQueryCursor
+ (BOOL)supportsSecureCoding;
- (CKQueryCursor)queryCursor;
- (CPLCKQueryCursor)initWithCoder:(id)a3;
- (CPLCKQueryCursor)initWithCursorData:(id)a3;
- (CPLCKQueryCursor)initWithQueryCursor:(id)a3 additionalInfo:(id)a4;
- (NSData)cursorData;
- (NSData)data;
- (NSString)additionalInfo;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPLCKQueryCursor

- (CPLCKQueryCursor)initWithQueryCursor:(id)a3 additionalInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CPLCKQueryCursor;
  v9 = -[CPLCKQueryCursor init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queryCursor, a3);
    v11 = (NSString *)[v8 copy];
    additionalInfo = v10->_additionalInfo;
    v10->_additionalInfo = v11;
  }

  return v10;
}

- (CPLCKQueryCursor)initWithCursorData:(id)a3
{
  id v5 = a3;
  if (qword_1002960A0 != -1) {
    dispatch_once(&qword_1002960A0, &stru_10023FCD0);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver cpl_safeUnarchiveObjectWithData:classes:]( &OBJC_CLASS___NSKeyedUnarchiver,  "cpl_safeUnarchiveObjectWithData:classes:",  v5,  qword_100296098));
  if (v6)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___CKQueryCursor);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      id v8 =  -[CPLCKQueryCursor initWithQueryCursor:additionalInfo:]( self,  "initWithQueryCursor:additionalInfo:",  v6,  0LL);
      self = v8;
    }

    else
    {
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___CPLCKQueryCursor);
      if ((objc_opt_isKindOfClass(v6, v10) & 1) == 0) {
        sub_100191598((uint64_t)v6, (uint64_t)a2, (uint64_t)self);
      }
      id v8 = v6;
    }

    v9 = v8;
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

- (NSData)cursorData
{
  queryCursor = self;
  if (!self->_additionalInfo) {
    queryCursor = self->_queryCursor;
  }
  return (NSData *)(id)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver cpl_archivedDataWithRootObject:]( &OBJC_CLASS___NSKeyedArchiver,  "cpl_archivedDataWithRootObject:",  queryCursor));
}

- (NSData)data
{
  return (NSData *)-[CKQueryCursor data](self->_queryCursor, "data");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  queryCursor = self->_queryCursor;
  id v5 = a3;
  [v5 encodeObject:queryCursor forKey:@"queryCursor"];
  [v5 encodeObject:self->_additionalInfo forKey:@"additionalInfo"];
}

- (CPLCKQueryCursor)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(CKQueryCursor) forKey:@"queryCursor"];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"additionalInfo"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v6)
  {
    self =  -[CPLCKQueryCursor initWithQueryCursor:additionalInfo:]( self,  "initWithQueryCursor:additionalInfo:",  v6,  v8);
    v9 = self;
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

- (CKQueryCursor)queryCursor
{
  return self->_queryCursor;
}

- (NSString)additionalInfo
{
  return self->_additionalInfo;
}

- (void).cxx_destruct
{
}

@end
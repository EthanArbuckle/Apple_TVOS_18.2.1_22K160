@interface OptInOut
+ (id)parseFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)optIn;
- (IdsMutation)idsMutation;
- (OptInOut)init;
- (id)data;
- (id)debugDescription;
- (id)description;
- (id)diagnosticsJsonDictionary;
- (unint64_t)parsedLength;
- (unint64_t)timestampMs;
- (void)setIdsMutation:(id)a3;
- (void)setOptIn:(BOOL)a3;
- (void)setParsedLength:(unint64_t)a3;
- (void)setTimestampMs:(unint64_t)a3;
@end

@implementation OptInOut

- (OptInOut)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OptInOut;
  return -[OptInOut init](&v3, "init");
}

- (id)data
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
  if (-[TLSMessageClass encodeBool:buffer:](self, "encodeBool:buffer:", -[OptInOut optIn](self, "optIn"), v3)
    && -[TLSMessageClass encodeUint64:buffer:]( self,  "encodeUint64:buffer:",  -[OptInOut timestampMs](self, "timestampMs"),  v3))
  {
    id v4 = v3;
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 bytes];
  id v8 = v6;
  id v9 = [v8 bytes];
  v10 = (char *)[v8 length] + (void)v9;
  id v12 = objc_alloc_init((Class)objc_opt_class(a1, v11));
  unsigned __int8 v23 = 0;
  id v13 = [v12 parseBool:v7 end:v10 result:&v23];
  if (!v13)
  {
    if (a4)
    {
      uint64_t v18 = kTransparencyErrorDecode;
      v19 = @"failed to parse optIn BOOLean from OptInOut";
      uint64_t v20 = -274LL;
LABEL_8:
      id v17 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  v18,  v20,  v19));
      goto LABEL_10;
    }

- (id)debugDescription
{
  if (-[OptInOut optIn](self, "optIn")) {
    objc_super v3 = @"YES";
  }
  else {
    objc_super v3 = @"NO";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{\t\toptIn:%@\n\t\ttimestampMs:%llu\n}",  v3,  -[OptInOut timestampMs](self, "timestampMs"));
}

- (id)description
{
  if (-[OptInOut optIn](self, "optIn")) {
    objc_super v3 = @"YES";
  }
  else {
    objc_super v3 = @"NO";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"optIn:%@; timestampMs:%llu",
           v3,
           -[OptInOut timestampMs](self, "timestampMs"));
}

- (BOOL)isEqual:(id)a3
{
  v5 = (OptInOut *)a3;
  if (self == v5)
  {
    unsigned __int8 v10 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___OptInOut, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      id v7 = v5;
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OptInOut data](self, "data"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[OptInOut data](v7, "data"));

      unsigned __int8 v10 = [v8 isEqualToData:v9];
    }

    else
    {
      unsigned __int8 v10 = 0;
    }
  }

  return v10;
}

- (IdsMutation)idsMutation
{
  return (IdsMutation *)objc_loadWeakRetained((id *)&self->_idsMutation);
}

- (void)setIdsMutation:(id)a3
{
}

- (BOOL)optIn
{
  return self->_optIn;
}

- (void)setOptIn:(BOOL)a3
{
  self->_optIn = a3;
}

- (unint64_t)timestampMs
{
  return self->_timestampMs;
}

- (void)setTimestampMs:(unint64_t)a3
{
  self->_timestampMs = a3;
}

- (unint64_t)parsedLength
{
  return self->_parsedLength;
}

- (void)setParsedLength:(unint64_t)a3
{
  self->_parsedLength = a3;
}

- (void).cxx_destruct
{
}

- (id)diagnosticsJsonDictionary
{
  v10[0] = @"optIn";
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[OptInOut optIn](self, "optIn")));
  v11[0] = v3;
  v10[1] = @"timestamp";
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)(-[OptInOut timestampMs](self, "timestampMs") / 0x3E8)));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "kt_dateToString"));
  v11[1] = v5;
  v10[2] = @"timestampReadable";
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)(-[OptInOut timestampMs](self, "timestampMs") / 0x3E8)));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "kt_toISO_8601_UTCString"));
  v11[2] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  3LL));

  return v8;
}

@end
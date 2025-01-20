@interface NEDNSQuery
- (NEDNSQuery)initWithName:(id)a3 recordType:(int64_t)a4 recordClass:(int64_t)a5;
- (NSData)answerData;
- (NSString)name;
- (int64_t)recordClass;
- (int64_t)recordType;
- (unsigned)answerTTL;
- (void)setAnswerData:(id)a3;
- (void)setAnswerTTL:(unsigned int)a3;
@end

@implementation NEDNSQuery

- (NEDNSQuery)initWithName:(id)a3 recordType:(int64_t)a4 recordClass:(int64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NEDNSQuery;
  v10 = -[NEDNSQuery init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_name, a3);
    v11->_recordType = a4;
    v11->_recordClass = a5;
  }

  return v11;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (int64_t)recordType
{
  return self->_recordType;
}

- (int64_t)recordClass
{
  return self->_recordClass;
}

- (NSData)answerData
{
  return (NSData *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setAnswerData:(id)a3
{
}

- (unsigned)answerTTL
{
  return self->_answerTTL;
}

- (void)setAnswerTTL:(unsigned int)a3
{
  self->_answerTTL = a3;
}

- (void).cxx_destruct
{
}

@end
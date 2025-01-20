@interface SDAHistogramElement
+ (id)newElement;
+ (id)newWithAge:(unint64_t)a3 andSize:(unint64_t)a4;
- (NSMutableArray)ageGroupCount;
- (NSMutableArray)sizeGroupCount;
- (NSMutableArray)sizeOfAgeGroupCount;
- (void)adjAge:(unint64_t)a3 andSize:(unint64_t)a4;
- (void)setAgeGroupCount:(id)a3;
- (void)setSizeGroupCount:(id)a3;
- (void)setSizeOfAgeGroupCount:(id)a3;
@end

@implementation SDAHistogramElement

+ (id)newElement
{
  if (qword_10005AAB0 != -1) {
    dispatch_once(&qword_10005AAB0, &stru_10004CF68);
  }
  v2 = objc_opt_new(&OBJC_CLASS___SDAHistogramElement);
  int v3 = 8;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 8LL));
  -[SDAHistogramElement setAgeGroupCount:](v2, "setAgeGroupCount:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 8LL));
  -[SDAHistogramElement setSizeGroupCount:](v2, "setSizeGroupCount:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 8LL));
  -[SDAHistogramElement setSizeOfAgeGroupCount:](v2, "setSizeOfAgeGroupCount:", v6);

  do
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAHistogramElement ageGroupCount](v2, "ageGroupCount"));
    [v7 addObject:&off_10004FD80];

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAHistogramElement sizeGroupCount](v2, "sizeGroupCount"));
    [v8 addObject:&off_10004FD80];

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAHistogramElement sizeOfAgeGroupCount](v2, "sizeOfAgeGroupCount"));
    [v9 addObject:&off_10004FD80];

    --v3;
  }

  while (v3);
  return v2;
}

+ (id)newWithAge:(unint64_t)a3 andSize:(unint64_t)a4
{
  id v6 = +[SDAHistogramElement newElement](&OBJC_CLASS___SDAHistogramElement, "newElement");
  [v6 adjAge:a3 andSize:a4];
  return v6;
}

- (void)adjAge:(unint64_t)a3 andSize:(unint64_t)a4
{
  unint64_t v6 = a3 / 0x3B9ACA00;
  uint64_t v7 = 7LL;
  do
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10005AAC0 objectAtIndexedSubscript:v7]);
    id v9 = [v8 unsignedLongLongValue];

    --v7;
  }

  while (v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_ageGroupCount,  "objectAtIndexedSubscript:",  v7));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  (char *)[v10 unsignedLongLongValue] + 1));
  -[NSMutableArray setObject:atIndexedSubscript:]( self->_ageGroupCount,  "setObject:atIndexedSubscript:",  v11,  v7);

  v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_sizeOfAgeGroupCount,  "objectAtIndexedSubscript:",  v7));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  (char *)[v12 unsignedLongLongValue] + a4));
  -[NSMutableArray setObject:atIndexedSubscript:]( self->_sizeOfAgeGroupCount,  "setObject:atIndexedSubscript:",  v13,  v7);

  uint64_t v14 = 7LL;
  do
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10005AAB8 objectAtIndexedSubscript:v14]);
    id v16 = [v15 unsignedLongLongValue];

    --v14;
  }

  while (v14);
  id v18 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_sizeGroupCount,  "objectAtIndexedSubscript:",  v14));
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  (char *)[v18 unsignedLongLongValue] + 1));
  -[NSMutableArray setObject:atIndexedSubscript:]( self->_sizeGroupCount,  "setObject:atIndexedSubscript:",  v17,  v14);
}

- (NSMutableArray)ageGroupCount
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setAgeGroupCount:(id)a3
{
}

- (NSMutableArray)sizeGroupCount
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setSizeGroupCount:(id)a3
{
}

- (NSMutableArray)sizeOfAgeGroupCount
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setSizeOfAgeGroupCount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
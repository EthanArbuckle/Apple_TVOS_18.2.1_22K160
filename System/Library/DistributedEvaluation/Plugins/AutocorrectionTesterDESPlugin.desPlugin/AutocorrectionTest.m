@interface AutocorrectionTest
+ (id)testWithInput:(id)a3;
+ (id)testWithInput:(id)a3 andCorpusId:(id)a4;
+ (id)testWithInput:(id)a3 expectedOutput:(id)a4;
+ (id)testWithInput:(id)a3 expectedOutput:(id)a4 sourceMetadata:(id)a5 withTouches:(id)a6 andCorpusId:(id)a7;
+ (id)testWithTouches:(id)a3 expectedOutput:(id)a4;
- (AutocorrectionTest)initWithCoder:(id)a3;
- (NSArray)expectedOutput;
- (NSArray)touches;
- (NSDictionary)sourceMetadata;
- (NSNumber)corpusId;
- (NSString)input;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AutocorrectionTest

+ (id)testWithInput:(id)a3 expectedOutput:(id)a4 sourceMetadata:(id)a5 withTouches:(id)a6 andCorpusId:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = objc_alloc_init(&OBJC_CLASS___AutocorrectionTest);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_input, a3);
    v19 = (NSArray *)[v13 copy];
    expectedOutput = v18->_expectedOutput;
    v18->_expectedOutput = v19;

    objc_storeStrong((id *)&v18->_sourceMetadata, a5);
    objc_storeStrong((id *)&v18->_touches, a6);
    objc_storeStrong((id *)&v18->_corpusId, a7);
  }

  return v18;
}

+ (id)testWithTouches:(id)a3 expectedOutput:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 componentsJoinedByString:@" "]);
  v9 = (void *)objc_claimAutoreleasedReturnValue( [a1 testWithInput:v8 expectedOutput:v6 sourceMetadata:0 withTouches:v7 andCorpusId:0]);

  return v9;
}

+ (id)testWithInput:(id)a3 expectedOutput:(id)a4
{
  return [a1 testWithInput:a3 expectedOutput:a4 sourceMetadata:0 withTouches:0 andCorpusId:0];
}

+ (id)testWithInput:(id)a3
{
  id v4 = a3;
  id v5 = TITestTyperTokensForString(v4, 0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a1 testWithInput:v4 expectedOutput:v6]);

  return v7;
}

+ (id)testWithInput:(id)a3 andCorpusId:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = TITestTyperTokensForString(v7, 0LL);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue( [a1 testWithInput:v7 expectedOutput:v9 sourceMetadata:0 withTouches:0 andCorpusId:v6]);

  return v10;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  [v3 appendFormat:@"input: %@\n", self->_input];
  if (self->_touches) {
    [v3 appendFormat:@"touch: %@", self->_touches];
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray componentsJoinedByString:](self->_expectedOutput, "componentsJoinedByString:", @" "));
  unsigned __int8 v5 = [v4 isEqualToString:self->_input];

  if ((v5 & 1) == 0) {
    [v3 appendFormat:@"; expected: %@", self->_expectedOutput];
  }
  return v3;
}

- (AutocorrectionTest)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___AutocorrectionTest;
  unsigned __int8 v5 = -[AutocorrectionTest init](&v13, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"ATInput"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    input = v5->_input;
    v5->_input = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"ATExpectedOutput"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    expectedOutput = v5->_expectedOutput;
    v5->_expectedOutput = (NSArray *)v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  input = self->_input;
  id v5 = a3;
  [v5 encodeObject:input forKey:@"ATInput"];
  [v5 encodeObject:self->_expectedOutput forKey:@"ATExpectedOutput"];
}

- (NSString)input
{
  return self->_input;
}

- (NSArray)expectedOutput
{
  return self->_expectedOutput;
}

- (NSDictionary)sourceMetadata
{
  return self->_sourceMetadata;
}

- (NSArray)touches
{
  return self->_touches;
}

- (NSNumber)corpusId
{
  return self->_corpusId;
}

- (void).cxx_destruct
{
}

@end
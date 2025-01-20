@interface LACProcessingConfiguration
+ (id)defaultConfiguration;
- (LACEvaluationRequestProcessor)nextProcessor;
- (LACProcessingConfiguration)initWithNextProcessor:(id)a3;
@end

@implementation LACProcessingConfiguration

- (LACProcessingConfiguration)initWithNextProcessor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LACProcessingConfiguration;
  v6 = -[LACProcessingConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_nextProcessor, a3);
  }

  return v7;
}

+ (id)defaultConfiguration
{
  v2 = objc_alloc(&OBJC_CLASS___LACProcessingConfiguration);
  v3 = (void *)objc_opt_new();
  v4 = -[LACProcessingConfiguration initWithNextProcessor:](v2, "initWithNextProcessor:", v3);

  return v4;
}

- (LACEvaluationRequestProcessor)nextProcessor
{
  return self->_nextProcessor;
}

- (void).cxx_destruct
{
}

@end
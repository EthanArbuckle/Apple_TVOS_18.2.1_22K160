@interface _EARSpeechRecognizer
- (NSString)modelRoot;
- (NSString)modelType;
- (void)setModelRoot:(id)a3;
- (void)setModelType:(id)a3;
@end

@implementation _EARSpeechRecognizer

- (void)setModelType:(id)a3
{
}

- (NSString)modelType
{
  return (NSString *)objc_getAssociatedObject(self, &unk_10002E850);
}

- (void)setModelRoot:(id)a3
{
}

- (NSString)modelRoot
{
  return (NSString *)objc_getAssociatedObject(self, &unk_10002E858);
}

@end
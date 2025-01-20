@interface RDASRWrapper
- (RDASRWDelegate)recognitionDelegate;
- (RDASRWrapper)init;
- (void)mapDelegate:(RDASRWDelegate *)a3;
- (void)recognitionBuffer;
- (void)recognizer;
- (void)setRecognitionBuffer:(void *)a3;
- (void)setRecognitionDelegate:(RDASRWDelegate *)a3;
- (void)setRecognizer:(void *)a3;
@end

@implementation RDASRWrapper

- (RDASRWrapper)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RDASRWrapper;
  v2 = -[RDASRWrapper init](&v5, "init");
  else {
    size_t v3 = 56LL;
  }
  v2->_recognitionDelegate = (RDASRWDelegate *)malloc(v3);
  return v2;
}

- (void)mapDelegate:(RDASRWDelegate *)a3
{
  var0 = a3->var0;
  *(void *)-[RDASRWrapper recognitionDelegate](self, "recognitionDelegate") = var0;
  var7 = a3->var7;
  *((void *)-[RDASRWrapper recognitionDelegate](self, "recognitionDelegate") + 7) = var7;
  var3 = a3->var3;
  *((void *)-[RDASRWrapper recognitionDelegate](self, "recognitionDelegate") + 3) = var3;
  var2 = a3->var2;
  *((void *)-[RDASRWrapper recognitionDelegate](self, "recognitionDelegate") + 2) = var2;
  var4 = a3->var4;
  *((void *)-[RDASRWrapper recognitionDelegate](self, "recognitionDelegate") + 4) = var4;
  var6 = a3->var6;
  *((void *)-[RDASRWrapper recognitionDelegate](self, "recognitionDelegate") + 6) = var6;
  var5 = a3->var5;
  *((void *)-[RDASRWrapper recognitionDelegate](self, "recognitionDelegate") + 5) = var5;
  var1 = a3->var1;
  *((void *)-[RDASRWrapper recognitionDelegate](self, "recognitionDelegate") + 1) = var1;
}

- (void)recognizer
{
  return self->_recognizer;
}

- (void)setRecognizer:(void *)a3
{
  self->_recognizer = a3;
}

- (void)recognitionBuffer
{
  return self->_recognitionBuffer;
}

- (void)setRecognitionBuffer:(void *)a3
{
  self->_recognitionBuffer = a3;
}

- (RDASRWDelegate)recognitionDelegate
{
  return self->_recognitionDelegate;
}

- (void)setRecognitionDelegate:(RDASRWDelegate *)a3
{
  self->_recognitionDelegate = a3;
}

@end
@interface TIKeystrokeRecord
+ (id)keystrokeRecord;
- (NSArray)inlineCompletionBarState;
- (NSArray)predictionBarState;
- (NSString)documentState;
- (NSString)insertedKey;
- (NSString)intendedKey;
- (NSString)touchedKey;
- (TIKeyboardTouchEvent)touch;
- (TIKeystrokeRecord)init;
- (TIPointError)touchError;
- (void)setDocumentState:(id)a3;
- (void)setInlineCompletionBarState:(id)a3;
- (void)setInsertedKey:(id)a3;
- (void)setIntendedKey:(id)a3;
- (void)setPredictionBarState:(id)a3;
- (void)setTouch:(id)a3;
- (void)setTouchError:(id)a3;
- (void)setTouchedKey:(id)a3;
@end

@implementation TIKeystrokeRecord

+ (id)keystrokeRecord
{
  return objc_alloc_init(&OBJC_CLASS___TIKeystrokeRecord);
}

- (TIKeystrokeRecord)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TIKeystrokeRecord;
  return -[TIKeystrokeRecord init](&v3, "init");
}

- (NSString)intendedKey
{
  return self->_intendedKey;
}

- (void)setIntendedKey:(id)a3
{
}

- (TIPointError)touchError
{
  return self->_touchError;
}

- (void)setTouchError:(id)a3
{
}

- (TIKeyboardTouchEvent)touch
{
  return self->_touch;
}

- (void)setTouch:(id)a3
{
}

- (NSString)touchedKey
{
  return self->_touchedKey;
}

- (void)setTouchedKey:(id)a3
{
}

- (NSString)insertedKey
{
  return self->_insertedKey;
}

- (void)setInsertedKey:(id)a3
{
}

- (NSString)documentState
{
  return self->_documentState;
}

- (void)setDocumentState:(id)a3
{
}

- (NSArray)predictionBarState
{
  return self->_predictionBarState;
}

- (void)setPredictionBarState:(id)a3
{
}

- (NSArray)inlineCompletionBarState
{
  return self->_inlineCompletionBarState;
}

- (void)setInlineCompletionBarState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
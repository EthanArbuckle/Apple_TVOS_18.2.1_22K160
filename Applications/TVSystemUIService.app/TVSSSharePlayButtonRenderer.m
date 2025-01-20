@interface TVSSSharePlayButtonRenderer
+ (id)rendererWithIdentifier:(id)a3 format:(int64_t)a4 content:(id)a5 backingStore:(id)a6;
- (BOOL)isDisabled;
- (BOOL)isFocusable;
- (TVSSFaceTimePlatterBackingStore)backingStore;
- (void)setBackingStore:(id)a3;
@end

@implementation TVSSSharePlayButtonRenderer

+ (id)rendererWithIdentifier:(id)a3 format:(int64_t)a4 content:(id)a5 backingStore:(id)a6
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  int64_t v14 = a4;
  id v13 = 0LL;
  objc_storeStrong(&v13, a5);
  id v12 = 0LL;
  objc_storeStrong(&v12, a6);
  v11 =  +[TVSSSharePlayButtonRenderer rendererWithIdentifier:format:content:]( &OBJC_CLASS___TVSSSharePlayButtonRenderer,  "rendererWithIdentifier:format:content:",  location[0],  v14,  v13);
  -[TVSSSharePlayButtonRenderer setBackingStore:](v11, "setBackingStore:", v12);
  v10 = v11;
  objc_storeStrong((id *)&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
  return v10;
}

- (BOOL)isFocusable
{
  id v3 = -[TVSSFaceTimePlatterBackingStore platterState](self->_backingStore, "platterState");
  unsigned int v4 = [v3 isEqual:@"FaceTimeOnly"] ^ 1;

  return v4 & 1;
}

- (BOOL)isDisabled
{
  id v3 = -[TVSSFaceTimePlatterBackingStore platterState](self->_backingStore, "platterState");
  unsigned __int8 v4 = [v3 isEqual:@"FaceTimeOnly"];

  return v4 & 1;
}

- (TVSSFaceTimePlatterBackingStore)backingStore
{
  return self->_backingStore;
}

- (void)setBackingStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
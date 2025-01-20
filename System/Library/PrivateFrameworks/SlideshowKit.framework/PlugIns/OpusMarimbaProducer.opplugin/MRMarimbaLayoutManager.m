@interface MRMarimbaLayoutManager
- (CGPoint)shadowOffset;
- (CGRect)currentRectForEditedText;
- (MPText)text;
- (MRMarimbaLayer)marimbaLayer;
- (MRMarimbaLayoutManager)init;
- (id)_renderer;
- (id)textRenderer;
- (int64_t)lineCount;
- (void)dealloc;
- (void)setMarimbaLayer:(id)a3;
- (void)setText:(id)a3;
- (void)updateWithString:(id)a3;
@end

@implementation MRMarimbaLayoutManager

- (MRMarimbaLayoutManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MRMarimbaLayoutManager;
  v2 = -[MRMarimbaLayoutManager init](&v4, "init");
  if (v2) {
    v2->_textRenderer = objc_alloc_init(&OBJC_CLASS___MRTextRenderer);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRMarimbaLayoutManager;
  -[MRMarimbaLayoutManager dealloc](&v3, "dealloc");
}

- (id)textRenderer
{
  return self->_textRenderer;
}

- (int64_t)lineCount
{
  return -[MRTextRenderer numberOfLines](self->_textRenderer, "numberOfLines");
}

- (void)updateWithString:(id)a3
{
  marimbaLayer = self->_marimbaLayer;
  if (marimbaLayer)
  {
    -[MRMarimbaLayer bounds](marimbaLayer, "bounds");
    -[MRTextRenderer setResolution:](self->_textRenderer, "setResolution:", v6, v7);
  }

  -[MRTextRenderer setTruncate:](self->_textRenderer, "setTruncate:", 0LL);
  id v8 = objc_msgSend(-[MRMarimbaLayoutManager _renderer](self, "_renderer"), "_maxLinesForCurrentEditingTextElement");
  if (v8) {
    uint64_t v9 = (uint64_t)(double)(uint64_t)v8;
  }
  else {
    uint64_t v9 = 100000LL;
  }
  -[MRTextRenderer setMaxNumberOfLines:](self->_textRenderer, "setMaxNumberOfLines:", v9);
  objc_msgSend(-[MRMarimbaLayoutManager _renderer](self, "_renderer"), "_maxSizeForCurrentEditingTextElement");
  -[MRTextRenderer setDefinedSize:](self->_textRenderer, "setDefinedSize:");
  -[MRTextRenderer setText:](self->_textRenderer, "setText:", a3);
}

- (id)_renderer
{
  return -[MRMarimbaLayer renderer](self->_marimbaLayer, "renderer");
}

- (CGRect)currentRectForEditedText
{
  double v4 = v25;
  double v3 = v26;
  double v6 = v27;
  double v5 = v28;
  double v8 = v31;
  double v7 = v32;
  if (v27 >= v29) {
    double v9 = v27;
  }
  else {
    double v9 = v29;
  }
  if (v25 >= v31) {
    double v10 = v31;
  }
  else {
    double v10 = v25;
  }
  if (v30 >= v32) {
    double v11 = v30;
  }
  else {
    double v11 = v32;
  }
  double v23 = v11;
  double v24 = v9;
  if (v26 >= v28) {
    double v12 = v28;
  }
  else {
    double v12 = v26;
  }
  -[MRMarimbaLayoutManager shadowOffset](self, "shadowOffset");
  if (v13 < 0.0) {
    double v13 = -v13;
  }
  float v15 = v6 - v4;
  float v16 = v5 - v3;
  double v17 = sqrt((float)((float)(v15 * v15) + (float)(v16 * v16)));
  float v18 = v8 - v4;
  float v19 = v7 - v3;
  double v20 = sqrt((float)((float)(v18 * v18) + (float)(v19 * v19)));
  double v21 = v10 + (v24 - v10 - v17) * 0.5 + v13;
  double v22 = v12 + (v23 - v12 - v20) * 0.5 - v14;
  result.size.height = v20;
  result.size.width = v17;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGPoint)shadowOffset
{
  result.y = v3;
  result.x = v2;
  return result;
}

- (MRMarimbaLayer)marimbaLayer
{
  return self->_marimbaLayer;
}

- (void)setMarimbaLayer:(id)a3
{
}

- (MPText)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

@end
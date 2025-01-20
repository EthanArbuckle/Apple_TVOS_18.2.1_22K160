@interface SZExtractorInternalDelegate
- (void)extractionCompleteAtArchivePath:(id)a3;
- (void)extractionEnteredPassThroughMode;
- (void)setExtractionProgress:(double)a3;
@end

@implementation SZExtractorInternalDelegate

- (void)setExtractionProgress:(double)a3
{
  if (self)
  {
    self = (SZExtractorInternalDelegate *)objc_loadWeakRetained((id *)&self->delegate);
    if (self)
    {
      v4 = self;
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        -[SZExtractorInternalDelegate setExtractionProgress:](v4, "setExtractionProgress:", a3);
      }
      self = v4;
    }
  }
}

- (void)extractionCompleteAtArchivePath:(id)a3
{
  id v4 = a3;
  if (self)
  {
    self = (SZExtractorInternalDelegate *)objc_loadWeakRetained((id *)&self->delegate);
    if (self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        -[SZExtractorInternalDelegate extractionCompleteAtArchivePath:](self, "extractionCompleteAtArchivePath:", v4);
      }
    }
  }
}

- (void)extractionEnteredPassThroughMode
{
  if (self)
  {
    self = (SZExtractorInternalDelegate *)objc_loadWeakRetained((id *)&self->delegate);
    if (self)
    {
      v2 = self;
      if ((objc_opt_respondsToSelector() & 1) != 0) {
        -[SZExtractorInternalDelegate extractionEnteredPassThroughMode](v2, "extractionEnteredPassThroughMode");
      }
      self = v2;
    }
  }
}

- (void).cxx_destruct
{
}

@end
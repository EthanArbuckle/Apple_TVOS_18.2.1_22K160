@interface ICMusicLibraryRecommendationsResponse
- (AMPMusicArtistNewContentResponse)responseModel;
- (ICMusicLibraryRecommendationsResponse)initWithNewArtistContentResponseModel:(id)a3 andMLModel:(id)a4;
- (MLModel)mlModel;
@end

@implementation ICMusicLibraryRecommendationsResponse

- (ICMusicLibraryRecommendationsResponse)initWithNewArtistContentResponseModel:(id)a3 andMLModel:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ICMusicLibraryRecommendationsResponse;
  v9 = -[ICMusicLibraryRecommendationsResponse init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_responseModel, a3);
    objc_storeStrong((id *)&v10->_mlModel, a4);
  }

  return v10;
}

- (AMPMusicArtistNewContentResponse)responseModel
{
  return self->_responseModel;
}

- (MLModel)mlModel
{
  return self->_mlModel;
}

- (void).cxx_destruct
{
}

@end
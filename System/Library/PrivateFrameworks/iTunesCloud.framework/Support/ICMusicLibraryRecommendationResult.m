@interface ICMusicLibraryRecommendationResult
- (ICMusicLibraryRecommendationResult)initWithAdamID:(id)a3 date:(id)a4 score:(id)a5;
- (NSDate)date;
- (NSNumber)adamID;
- (NSNumber)score;
@end

@implementation ICMusicLibraryRecommendationResult

- (ICMusicLibraryRecommendationResult)initWithAdamID:(id)a3 date:(id)a4 score:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___ICMusicLibraryRecommendationResult;
  v12 = -[ICMusicLibraryRecommendationResult init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_adamID, a3);
    objc_storeStrong((id *)&v13->_date, a4);
    objc_storeStrong((id *)&v13->_score, a5);
  }

  return v13;
}

- (NSNumber)adamID
{
  return self->_adamID;
}

- (NSDate)date
{
  return self->_date;
}

- (NSNumber)score
{
  return self->_score;
}

- (void).cxx_destruct
{
}

@end
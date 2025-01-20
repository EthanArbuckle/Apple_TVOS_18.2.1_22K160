@interface WLASearchUtilities
+ (void)populateSearchImage:(id)a3 withMetadata:(id)a4 artworkType:(int64_t)a5;
+ (void)populateSearchResult:(id)a3 withMetadata:(id)a4;
@end

@implementation WLASearchUtilities

+ (void)populateSearchResult:(id)a3 withMetadata:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 canonicalID]);
  [v13 setCanonicalId:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
  [v13 setTitle:v8];

  if ([v6 contentType] == (char *)&dword_0 + 1)
  {
    [v13 setContentType:SAVCSContentTypeMovieValue];
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 studio]);
    [v13 setStudio:v9];
LABEL_5:

    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 releaseDate]);
    [v13 setReleaseDate:v10];

    goto LABEL_6;
  }

  if ([v6 contentType] == (char *)&dword_0 + 2)
  {
    [v13 setContentType:SAVCSContentTypeShowValue];
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 network]);
    [v13 setNetwork:v9];
    goto LABEL_5;
  }

+ (void)populateSearchImage:(id)a3 withMetadata:(id)a4 artworkType:(int64_t)a5
{
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue([a4 images]);
  id v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bestArtworkVariantOfType:forSize:", a5, 3000.0, 3000.0));

  [v12 artworkSize];
  objc_msgSend(v7, "setPixelWidth:");
  [v12 artworkSize];
  [v7 setPixelHeight:v9];
  v10 = (void *)objc_claimAutoreleasedReturnValue([v12 artworkSizeTemplateURL]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 absoluteString]);
  [v7 setUrlFormatString:v11];
}

@end
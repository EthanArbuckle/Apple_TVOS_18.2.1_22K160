LABEL_12:
}
}
}
}

LABEL_10:
}
}

void sub_30B8(_Unwind_Exception *a1)
{
}

void sub_3ECC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, id location)
{
}

LABEL_26:
        v10 = v13;
        goto LABEL_27;
      }

      goto LABEL_27;
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) contentType]);
    if (([v18 isEqualToString:SAVCSContentTypeEpisodeValue] & 1) == 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) contentType]);
      if (![v19 isEqualToString:SAVCSContentTypeShowValue])
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) contentType]);
        v31 = [v30 isEqualToString:SAVCSContentTypeSeasonValue];

        if ((v31 & 1) == 0)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained response]);
          v32 = (void *)objc_claimAutoreleasedReturnValue([v9 items]);
          v10 = (id)objc_claimAutoreleasedReturnValue([v32 firstObject]);

          goto LABEL_27;
        }

LABEL_17:
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v20 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained response]);
        v9 = (void *)objc_claimAutoreleasedReturnValue([v20 items]);

        v10 = [v9 countByEnumeratingWithState:&v33 objects:v42 count:16];
        if (v10)
        {
          v21 = *(void *)v34;
LABEL_19:
          v22 = 0LL;
          while (1)
          {
            if (*(void *)v34 != v21) {
              objc_enumerationMutation(v9);
            }
            v13 = *(void **)(*((void *)&v33 + 1) + 8 * v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue([v13 movieOrShowContent]);
            v24 = (int *)[v23 contentType];

            if (v24 == &dword_4) {
              goto LABEL_26;
            }
            if (v10 == (id)++v22)
            {
              v10 = [v9 countByEnumeratingWithState:&v33 objects:v42 count:16];
              if (v10) {
                goto LABEL_19;
              }
              break;
            }
          }
        }

LABEL_27:
        v25 = (void *)objc_claimAutoreleasedReturnValue([v10 movieOrShowContent]);
        v26 = objc_alloc_init(&OBJC_CLASS___SAWLWatchListSearchResult);
        +[WLASearchUtilities populateSearchResult:withMetadata:]( &OBJC_CLASS___WLASearchUtilities,  "populateSearchResult:withMetadata:",  v26,  v25);
        v41 = v26;
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v41, 1LL));
        [v5 setMatchedResults:v27];

        NSLog(@"WLASearchPlayableContentFromWatchList: Returning results: %@", v5);
        v28 = *(void *)(a1 + 40);
        v29 = (void *)objc_claimAutoreleasedReturnValue([v5 dictionary]);
        (*(void (**)(uint64_t, void *))(v28 + 16))(v28, v29);

        goto LABEL_28;
      }
    }

    goto LABEL_17;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained error]);
  NSLog(@"WLASearchPlayableContentFromWatchList: Continue watching request operation failed: %@", v16);

  v17 = *(void *)(a1 + 40);
  v5 = objc_alloc_init(&OBJC_CLASS___SACommandFailed);
  v10 = (id)objc_claimAutoreleasedReturnValue([v5 dictionary]);
  (*(void (**)(uint64_t, id))(v17 + 16))(v17, v10);
LABEL_28:
}

LABEL_6:
  v11 = objc_alloc_init(&OBJC_CLASS___SAUIImageResource);
  [a1 populateSearchImage:v11 withMetadata:v6 artworkType:2];
  [v13 setImage:v11];
  objc_msgSend(v13, "setIsEvod:", objc_msgSend(v6, "isEvod"));
  v12 = objc_alloc_init(&OBJC_CLASS___SAUIImageResource);
  [a1 populateSearchImage:v12 withMetadata:v6 artworkType:13];
  [v13 setEvodFeaturingImage:v12];
}

LABEL_24:
}

id objc_msgSend_openPlayable_forContentType_canonicalID_showCanonicalID_seasonCanonicalID_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openPlayable:forContentType:canonicalID:showCanonicalID:seasonCanonicalID:");
}

id objc_msgSend_wlkDefaultQueue(void *a1, const char *a2, ...)
{
  return [a1 wlkDefaultQueue];
}
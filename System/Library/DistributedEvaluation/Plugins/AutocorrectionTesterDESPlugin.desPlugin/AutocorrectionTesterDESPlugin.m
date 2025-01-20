id sub_53C8()
{
  if (qword_AA2E0 != -1) {
    dispatch_once(&qword_AA2E0, &stru_88C88);
  }
  return (id)qword_AA2D8;
}

void sub_5408(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TextInput", "TTKLog");
  v2 = (void *)qword_AA2D8;
  qword_AA2D8 = (uint64_t)v1;
}

void sub_5C5C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_5C74(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_5C84(uint64_t a1)
{
}

void sub_5C8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  v10 = (char *)[*(id *)(a1 + 32) length];
  if (a3)
  {
    if ((unint64_t)&v10[-a3] >= 0x21)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) substringFromIndex:a3]);
      uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"...%@", v11));
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8LL);
      v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;

      *a7 = 1;
    }
  }
}

void sub_6218(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 16) objectForKey:v7]);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

BOOL sub_62EC(UTF32Char a1)
{
  Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespace);
  return CFCharacterSetIsLongCharacterMember(Predefined, a1) != 0;
}

uint64_t sub_65E0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_6668()
{
  v0 = objc_alloc_init(&OBJC_CLASS___TIAppAutofillManagerMock);
  if ((objc_opt_respondsToSelector(&OBJC_CLASS___TIAppAutofillManager, "setSharedAppAutofillManager:") & 1) != 0) {
    +[TIAppAutofillManager performSelector:withObject:]( &OBJC_CLASS___TIAppAutofillManager,  "performSelector:withObject:",  "setSharedAppAutofillManager:",  v0);
  }
}

uint64_t sub_66C8()
{
  uint64_t result = objc_opt_respondsToSelector(&OBJC_CLASS___TIAppAutofillManager, "setSharedAppAutofillManager:");
  if ((result & 1) != 0) {
    return (uint64_t)+[TIAppAutofillManager performSelector:withObject:]( &OBJC_CLASS___TIAppAutofillManager,  "performSelector:withObject:",  "setSharedAppAutofillManager:",  0LL);
  }
  return result;
}

LABEL_11:
}

  v26 = (void *)objc_claimAutoreleasedReturnValue( +[TIPointError errorWithErrorVector:]( &OBJC_CLASS___TIPointError,  "errorWithErrorVector:",  v11 + 0.0 + v17 + v21,  v13 + 0.0 + v19 + v23));

  return v26;
}

  v22 = sqrtf((float)(v21 * v21) + (float)(v13 * v13));

  return v22;
}

          v23 = sub_39B88((__int128 *)a1, (unint64_t)a2, a3);
          if ((v24 & 1) == 0) {
            goto LABEL_14;
          }
          v25 = sub_39D58(a1, v23, a3);
          v11 = (__int128 *)(v23 + 24);
          if (!sub_39D58(v23 + 24, (uint64_t)a2, a3))
          {
            uint64_t v12 = v13 + 1;
            if (v25) {
              continue;
            }
LABEL_14:
            sub_3923C(a1, v23, a3, -v13, a5 & 1);
            v11 = (__int128 *)(v23 + 24);
LABEL_16:
            a5 = 0;
            a4 = -v13;
            goto LABEL_2;
          }

          a4 = -v13;
          a2 = (__int128 *)v23;
          if (v25) {
            return;
          }
          goto LABEL_1;
        }

        if (v11 != a2) {
          sub_3A1D4((uint64_t)v11, a2, a2, a3, a6);
        }
        return;
    }
  }

  return v5;
}

LABEL_35:
    id v7 = v48;
    v8 = 0LL;
    id v5 = v47;
  }

  objc_autoreleasePoolPop(v5);
}

void sub_84C4( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_9310( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_9344(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v35 = a3;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id obj = v5;
  id v9 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v41;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 touchedKey]);
        [v39 addObject:v14];

        v15 = (void *)objc_claimAutoreleasedReturnValue([v13 insertedKey]);
        [v7 addObject:v15];

        v16 = (void *)objc_claimAutoreleasedReturnValue([v13 predictionBarState]);
        [v37 addObject:v16];

        v17 = (void *)objc_claimAutoreleasedReturnValue([v13 inlineCompletionBarState]);
        [v6 addObject:v17];

        uint64_t v18 = objc_claimAutoreleasedReturnValue([v13 documentState]);
        v19 = (void *)v18;
        if (v18) {
          v20 = (const __CFString *)v18;
        }
        else {
          v20 = &stru_89E80;
        }
        [v8 addObject:v20];

        v21 = (void *)objc_claimAutoreleasedReturnValue([v13 touch]);
        [v38 addObject:v21];

        ++*(void *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL);
      }

      id v10 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    }

    while (v10);
  }

  v22 = *(void **)(a1 + 32);
  id v23 = [v39 copy];
  [v22 addObject:v23];

  v24 = *(void **)(a1 + 40);
  id v25 = [v7 copy];
  [v24 addObject:v25];

  v26 = *(void **)(a1 + 48);
  id v27 = [v37 copy];
  [v26 addObject:v27];

  v28 = *(void **)(a1 + 56);
  id v29 = [v6 copy];
  [v28 addObject:v29];

  v30 = *(void **)(a1 + 64);
  id v31 = [v8 copy];
  [v30 addObject:v31];

  v32 = *(void **)(a1 + 72);
  id v33 = [v38 copy];
  [v32 addObject:v33];

  v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  (char *)[*(id *)(a1 + 40) count] - 1));
  if (v35) {
    [*(id *)(a1 + 80) setObject:v35 forKeyedSubscript:v34];
  }
}

LABEL_28:
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v15, v10));
    v39 = __stderrp;
    v21 = v38;
    fprintf(v39, "Attempting to load keyboard named: %s\n", (const char *)[v21 UTF8String]);
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[TUIKeyboardLayoutFactory sharedKeyboardFactory]( &OBJC_CLASS___TUIKeyboardLayoutFactory,  "sharedKeyboardFactory"));
    v30 = (void *)objc_claimAutoreleasedReturnValue([v22 keyboardWithName:v21 inCache:0]);
    goto LABEL_29;
  }

  uint64_t v12 = [v9 isEqualToString:@"Portrait"];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  if (v12) {
    v14 = 1LL;
  }
  else {
    v14 = 4LL;
  }
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue( +[UIKBScreenTraits traitsWithScreen:orientation:]( &OBJC_CLASS___UIKBScreenTraits,  "traitsWithScreen:orientation:",  v13,  v14));

  -[__CFString keyboardScreenReferenceSize](v15, "keyboardScreenReferenceSize");
  v17 = v16;
  v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[TUIKeyboardLayoutFactory sharedKeyboardFactory]( &OBJC_CLASS___TUIKeyboardLayoutFactory,  "sharedKeyboardFactory"));
  v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "keyboardSuffixForScreenDimensions:", v17, v19));

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v10, v21));
  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  @"Dynamic",  v22));
  +[TUIKeyplaneView keyplaneSizeForLayout:screenTraits:keyboardType:]( &OBJC_CLASS___TUIKeyplaneView,  "keyplaneSizeForLayout:screenTraits:keyboardType:",  v23,  v15,  0LL);
  id v25 = v24;
  id v27 = v26;
  v28 = __stderrp;
  id v29 = v23;
  fprintf(v28, "Attempting to load dynamic keyboard layout named: %s\n", (const char *)[v29 UTF8String]);
  v30 = (void *)objc_claimAutoreleasedReturnValue( +[TUIKeyplaneView dynamicKeyboardForName:size:isLandscape:]( TUIKeyplaneView,  "dynamicKeyboardForName:size:isLandscape:",  v22,  [v9 isEqualToString:@"Landscape"],  v25,  v27));

LABEL_29:
  return v30;
}

void sub_9D64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_B138( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_B544(_Unwind_Exception *a1)
{
  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_B8EC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_BAFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_BBE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_BEA0(_Unwind_Exception *a1)
{
  id v7 = v4;

  _Unwind_Resume(a1);
}

void sub_BFF4(_Unwind_Exception *a1)
{
  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_C0B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_C1B8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v14 = v11;

  _Unwind_Resume(a1);
}

void sub_C2D0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

LABEL_14:
        v16 = (char *)v16 + 1;
      }

      while (v13 != v16);
      uint64_t v13 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
      v14 = v38 + (_DWORD)v16;
    }

    while (v13);
  }

  -[AutocorrectionTestHarness nullifyConversationHistory](self, "nullifyConversationHistory");
}

      uint64_t v12 = v24;
      v6 = v25;
    }
  }

  return v16;
}

    if (-[_ACTUserActionStream isRetyping](self, "isRetyping")
      || -[_ACTUserActionStream lastActionSuppressesError](self, "lastActionSuppressesError")
      || -[_ACTUserActionStream lastActionUseSecondaryString](self, "lastActionUseSecondaryString"))
    {
      uint64_t v18 = v17;
    }

    else
    {
      -[_ACTUserActionStream probabilityOfSkippedKey](self, "probabilityOfSkippedKey");
      uint64_t v18 = v17 + v27;
      if (v17 <= v16 && v18 > v16)
      {
        v22 = objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream trySkipKeyTap](self, "trySkipKeyTap"));
        if (v22) {
          goto LABEL_53;
        }
      }
    }

    if (-[_ACTUserActionStream isRetyping](self, "isRetyping")
      || -[_ACTUserActionStream lastActionSuppressesError](self, "lastActionSuppressesError"))
    {
      v19 = v18;
    }

    else
    {
      -[_ACTUserActionStream probabilityOfSubstituteKey](self, "probabilityOfSubstituteKey");
      v19 = v18 + v23;
      if (v18 <= v16 && v19 > v16)
      {
        v22 = objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream trySubstituteKeyTap](self, "trySubstituteKeyTap"));
        if (v22) {
          goto LABEL_53;
        }
      }
    }

    if (-[_ACTUserActionStream isRetyping](self, "isRetyping")
      || -[_ACTUserActionStream lastActionSuppressesError](self, "lastActionSuppressesError")
      || -[_ACTUserActionStream lastActionUseSecondaryString](self, "lastActionUseSecondaryString"))
    {
      v20 = v19;
    }

    else
    {
      -[_ACTUserActionStream probabilityOfExtraneousKey](self, "probabilityOfExtraneousKey");
      v20 = v19 + v28;
      if (v19 <= v16 && v20 > v16)
      {
        v22 = objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream tryExtraKeyTap](self, "tryExtraKeyTap"));
        if (v22) {
          goto LABEL_53;
        }
      }
    }

    if (-[_ACTUserActionStream isRetyping](self, "isRetyping")
      || -[_ACTUserActionStream lastActionSuppressesError](self, "lastActionSuppressesError")
      || -[_ACTUserActionStream lastActionUseSecondaryString](self, "lastActionUseSecondaryString")
      || (-[_ACTUserActionStream probabilityOfDoubledKey](self, "probabilityOfDoubledKey"), v20 > v16)
      || (float)(v20 + v21) <= v16
      || (v22 = objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream tryDoubleKeyTap](self, "tryDoubleKeyTap"))) == 0)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream tryKeyTap](self, "tryKeyTap"));
      if (v9) {
        return v9;
      }
      v22 = objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream tryChangeKeyplane](self, "tryChangeKeyplane"));
      if (!v22)
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream trySelectPopupVariant](self, "trySelectPopupVariant"));
        return v9;
      }
    }

          v22 = (void *)objc_claimAutoreleasedReturnValue([v46 intendedText]);
          id v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "substringWithRange:", 0, v12));

          [v49 addObject:v23];
          v24 = v16 + v18;
          while (1)
          {
            id v25 = v24;
            v26 = (void *)objc_claimAutoreleasedReturnValue([v46 intendedText]);
            id v27 = [v13 characterAtIndex:v25] == 32;

            v24 = v25 + 1;
            if (!v27) {
              goto LABEL_19;
            }
          }

LABEL_19:
          v8 = (char *)v8 + 1;
          id v7 = v12 + v25;
          v3 = v46;
        }

        while (v8 != v52);
        v6 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
        id v7 = v25 + v50;
        id v5 = obj;
        if (v6) {
          continue;
        }
        break;
      }
    }

    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v47 = (id)objc_claimAutoreleasedReturnValue([v46 records]);
    v28 = [v47 countByEnumeratingWithState:&v58 objects:v66 count:16];
    if (v28)
    {
      id v29 = 0;
      v53 = *(void *)v59;
      do
      {
        v30 = 0LL;
        v51 = v29;
        v55 = v28;
        do
        {
          if (*(void *)v59 != v53) {
            objc_enumerationMutation(v47);
          }
          id v31 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue([v31 touchData]);
          id v33 = v32 == 0LL;

          if (!v33)
          {
            v34 = objc_alloc(&OBJC_CLASS___TTKTestCaseRecord);
            v57 = (void *)objc_claimAutoreleasedReturnValue([v31 primaryIntendedText]);
            id v35 = (void *)objc_claimAutoreleasedReturnValue([v31 additionalIntendedTexts]);
            v36 = (void *)objc_claimAutoreleasedReturnValue([v31 touchDataCollection]);
            v37 = (void *)objc_claimAutoreleasedReturnValue([v31 recordID]);
            v38 = (void *)objc_claimAutoreleasedReturnValue([v31 layoutName]);
            v39 = (void *)objc_claimAutoreleasedReturnValue([v31 inputText]);
            __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([v31 transliteration]);
            __int128 v41 = (void *)objc_claimAutoreleasedReturnValue([v49 objectAtIndex:(char *)v30 + v51]);
            __int128 v42 = (void *)objc_claimAutoreleasedReturnValue([v31 annotations]);
            __int128 v43 = -[TTKTestCaseRecord initWithIntendedText:additionalIntendedTexts:touchDataCollection:recordID:layoutName:inputText:transliteration:context:annotations:]( v34,  "initWithIntendedText:additionalIntendedTexts:touchDataCollection:recordID:layoutName:inputText:trans literation:context:annotations:",  v57,  v35,  v36,  v37,  v38,  v39,  v40,  v41,  v42);
            [obj addObject:v43];
          }

          v30 = (char *)v30 + 1;
        }

        while (v55 != v30);
        v28 = [v47 countByEnumeratingWithState:&v58 objects:v66 count:16];
        id v29 = v51 + (_DWORD)v30;
      }

      while (v28);
    }

    v44 = objc_alloc(&OBJC_CLASS___TTKTestCase);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v46 metadata]);
    v56 = (void *)objc_claimAutoreleasedReturnValue([v46 intendedText]);
    v4 = -[TTKTestCase initWithMetadata:records:intendedText:](v44, "initWithMetadata:records:intendedText:", v13, obj);
LABEL_32:

    v3 = v46;
  }

  return v4;
}

void sub_C658( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
}

void sub_C9A0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

LABEL_21:
    v36 = v25;
LABEL_22:

    id v25 = v36;
  }

  [v11 extractDataFromTypingLog:v16];
  [v11 setCorrected:v25];
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%lu", v43));
  [v11 setSeed:v39];

  __int128 v40 = (void *)objc_claimAutoreleasedReturnValue(-[AutocorrectionTestHarness resultClassifiers](self, "resultClassifiers"));
  [v11 setTagsFromClassifiers:v40];

  return v11;
}

void sub_CE2C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_D05C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_D118(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_D188(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_DAA4()
{
  if ((byte_AA2F8 & 1) == 0)
  {
    Class v0 = NSClassFromString(@"TIAnalyticsService");
    if (v0)
    {
      Class v1 = v0;
      id v2 = objc_alloc(&OBJC_CLASS___TIAnalyticsService);
      v3 = objc_opt_new(&OBJC_CLASS___TIAnalyticsServiceProviderMock);
      id v4 = [v2 initWithProvider:v3];
      id v5 = (void *)qword_AA2F0;
      qword_AA2F0 = (uint64_t)v4;

      -[objc_class setMockInstance:](v1, "setMockInstance:", qword_AA2F0);
    }

    else
    {
      byte_AA2F8 = 1;
    }
  }

void sub_DB44()
{
  if ((byte_AA2F8 & 1) == 0)
  {
    -[objc_class setMockInstance:](NSClassFromString(@"TIAnalyticsService"), "setMockInstance:", 0LL);
    Class v0 = (void *)qword_AA2F0;
    qword_AA2F0 = 0LL;
  }

id sub_DB88()
{
  Class v0 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_AA2F0 provider]);
  Class v1 = (void *)objc_claimAutoreleasedReturnValue([v0 allEvents]);

  return v1;
}

id sub_DBC8(void *a1)
{
  Class v1 = (void *)qword_AA2F0;
  id v2 = a1;
  v3 = (void *)objc_claimAutoreleasedReturnValue([v1 provider]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([TIAnalyticsKeyboardDomain stringByAppendingFormat:@".%@", v2]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 eventsWithName:v4]);
  return v5;
}

id sub_DC58(void *a1)
{
  Class v1 = (void *)qword_AA2F0;
  id v2 = a1;
  v3 = (void *)objc_claimAutoreleasedReturnValue([v1 provider]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([TIAnalyticsInputAnalyticsDomain stringByAppendingFormat:@".%@", v2]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 eventsWithName:v4]);
  return v5;
}

id _TIGetMockingAnalyticsServiceEventsForMultipleEventNames(void *a1)
{
  id v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id obj = v1;
  id v3 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v24;
    v6 = (void *)TIAnalyticsKeyboardDomain;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)v7);
        id v9 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_AA2F0 provider]);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingFormat:@".%@", v8]);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 eventsWithName:v10]);

        __int128 v21 = 0u;
        __int128 v22 = 0u;
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        id v12 = v11;
        id v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v20;
          do
          {
            v16 = 0LL;
            do
            {
              if (*(void *)v20 != v15) {
                objc_enumerationMutation(v12);
              }
              [v2 addObject:*(void *)(*((void *)&v19 + 1) + 8 * (void)v16)];
              v16 = (char *)v16 + 1;
            }

            while (v14 != v16);
            id v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }

          while (v14);
        }

        id v7 = (char *)v7 + 1;
      }

      while (v7 != v4);
      id v4 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }

    while (v4);
  }

  return v2;
}

id sub_DEEC(void *a1)
{
  id v1 = (void *)qword_AA2F0;
  id v2 = a1;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v1 provider]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([TIAnalyticsKeyboardDomain stringByAppendingFormat:@".%@", v2]);

  id v5 = [v3 countEvent:v4];
  return v5;
}

id sub_DF78(void *a1, void *a2)
{
  id v3 = (void *)qword_AA2F0;
  id v4 = a2;
  id v5 = a1;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 provider]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([TIAnalyticsKeyboardDomain stringByAppendingFormat:@".%@", v5]);

  id v8 = [v6 countEvent:v7 filteredWithPredicate:v4];
  return v8;
}

id sub_E018(void *a1, void *a2)
{
  id v3 = (void *)qword_AA2F0;
  id v4 = a2;
  id v5 = a1;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 provider]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([TIAnalyticsKeyboardDomain stringByAppendingFormat:@".%@", v5]);

  id v8 = [v6 sumIntegerField:v4 forEvent:v7];
  return v8;
}

id sub_E0B8(void *a1, void *a2, void *a3)
{
  id v5 = (void *)qword_AA2F0;
  id v6 = a3;
  id v7 = a2;
  id v8 = a1;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 provider]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([TIAnalyticsKeyboardDomain stringByAppendingFormat:@".%@", v8]);

  id v11 = [v9 sumIntegerField:v7 forEvent:v10 filteredWithPredicate:v6];
  return v11;
}

double sub_E174(void *a1, void *a2)
{
  id v3 = (void *)qword_AA2F0;
  id v4 = a2;
  id v5 = a1;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 provider]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([TIAnalyticsKeyboardDomain stringByAppendingFormat:@".%@", v5]);

  [v6 sumFloatField:v4 forEvent:v7];
  double v9 = v8;

  return v9;
}

double sub_E21C(void *a1, void *a2, void *a3)
{
  id v5 = (void *)qword_AA2F0;
  id v6 = a3;
  id v7 = a2;
  id v8 = a1;
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v5 provider]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([TIAnalyticsKeyboardDomain stringByAppendingFormat:@".%@", v8]);

  [v9 sumFloatField:v7 forEvent:v10 filteredWithPredicate:v6];
  double v12 = v11;

  return v12;
}

void sub_E2E0()
{
  id v0 = (id)objc_claimAutoreleasedReturnValue([(id)qword_AA2F0 provider]);
  [v0 clear];
}

void _TIBeginMockingAssetManager()
{
  byte_AA2F9 = 1;
  id v0 = objc_alloc_init(&OBJC_CLASS___TIAssetManagerMock);
  if ((objc_opt_respondsToSelector(&OBJC_CLASS___TIAssetManager, "setSharedAssetManager:") & 1) != 0) {
    +[TIAssetManager performSelector:withObject:]( &OBJC_CLASS___TIAssetManager,  "performSelector:withObject:",  "setSharedAssetManager:",  v0);
  }
}

void _TIEndMockingAssetManager()
{
  if (byte_AA2F9 == 1)
  {
    byte_AA2F9 = 0;
    if ((objc_opt_respondsToSelector(&OBJC_CLASS___TIAssetManager, "setSharedAssetManager:") & 1) != 0) {
      +[TIAssetManager performSelector:withObject:]( &OBJC_CLASS___TIAssetManager,  "performSelector:withObject:",  "setSharedAssetManager:",  0LL);
    }
  }

void sub_101AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10228( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_102F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10588(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

double sub_10684(double *a1, uint64_t a2)
{
  double v4 = a1[1] - *a1;
  double v5 = (double)sub_11770(a2);
  return *a1 + v4 * ((v5 + (double)sub_11770(a2) * 4294967300.0) * 5.42101086e-20);
}

void sub_109CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10B3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_10B58(void *a1)
{
  id v1 = a1;
  id v2 = (char *)[v1 _rangeOfLongCharacterAtIndex:0];
  if (&v2[v3] == [v1 length])
  {
    UChar32 v4 = [v1 _firstLongCharacter];
    if (u_ispunct(v4)) {
      BOOL v5 = 1LL;
    }
    else {
      BOOL v5 = u_isdigit(v4) != 0;
    }
  }

  else
  {
    BOOL v5 = 0LL;
  }

  return v5;
}

void sub_10BE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10BF4(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:@"Shift"] & 1) != 0
    || ([v1 isEqualToString:@"More"] & 1) != 0
    || ([v1 isEqualToString:@"Delete"] & 1) != 0)
  {
    id v2 = &dword_0 + 1;
  }

  else
  {
    id v2 = [v1 isEqualToString:@"\n"];
  }

  return v2;
}

void sub_10C70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10F64(_Unwind_Exception *a1)
{
  UChar32 v4 = v3;

  _Unwind_Resume(a1);
}

void sub_112C8(_Unwind_Exception *a1)
{
  UChar32 v4 = v3;

  _Unwind_Resume(a1);
}

void sub_116E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_11770(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2496);
  unint64_t v2 = (v1 + 1) % 0x270uLL;
  unsigned int v3 = *(_DWORD *)(a1 + 4 * ((v1 + 397) % 0x270uLL)) ^ ((*(_DWORD *)(a1 + 4 * v2) & 0x7FFFFFFE | *(_DWORD *)(a1 + 4 * v1) & 0x80000000) >> 1) ^ ((int)(*(_DWORD *)(a1 + 4 * v2) << 31) >> 31) & 0x9908B0DF;
  *(_DWORD *)(a1 + 4 * v1) = v3;
  *(void *)(a1 + 2496) = v2;
  LODWORD(v1) = ((v3 ^ (v3 >> 11)) << 7) & 0x9D2C5680 ^ v3 ^ (v3 >> 11);
  return ((_DWORD)v1 << 15) & 0xEFC60000 ^ v1 ^ ((((_DWORD)v1 << 15) & 0xEFC60000 ^ v1) >> 18);
}

void sub_11A2C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_11A44(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_11A54(uint64_t a1)
{
}

void sub_11A5C(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  UChar32 v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_11BB0(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) partfileArchivePathsMutable]);
  [v2 addObject:*(void *)(a1 + 40)];
}

uint64_t sub_11DC0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_120B4(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_121AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_12360(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_125B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_12B9C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, char a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, id a41, char a42)
{
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose(&a42, 8);

  _Unwind_Resume(a1);
}

__n128 sub_12CB0(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 48);
  __int128 v3 = *(_OWORD *)(a2 + 64);
  *(__n128 *)(a1 + 4_Block_object_dispose(va, 8) = result;
  *(_OWORD *)(a1 + 64) = v3;
  return result;
}

uint64_t sub_12CC0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_12CD0(uint64_t a1)
{
}

void sub_12CD8(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v7 = *(void *)(v5 + 40);
  id v6 = (id *)(v5 + 40);
  id v18 = v4;
  if (!v7)
  {
    objc_storeStrong(v6, a2);
    id v4 = v18;
  }

  [v4 frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  BOOL IsNull = CGRectIsNull(*(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 48LL));
  uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8LL);
  if (IsNull)
  {
    *(CGFloat *)(v17 + 4_Block_object_dispose(va, 8) = v9;
    *(CGFloat *)(v17 + 56) = v11;
    *(CGFloat *)(v17 + 64) = v13;
    *(CGFloat *)(v17 + 72) = v15;
  }

  else
  {
    v19.origin.x = v9;
    v19.origin.y = v11;
    v19.size.width = v13;
    v19.size.height = v15;
    *(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 48LL) = CGRectUnion(*(CGRect *)(v17 + 48), v19);
  }
}

void sub_12DAC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_13188( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13)
{
}

void sub_135A8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void _TIBeginMockingKeyboardActivityController()
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___TIKeyboardAssertionManagerMock);
  if ((objc_opt_respondsToSelector(&OBJC_CLASS___TIKeyboardAssertionManager, "setSharedAssertionManager:") & 1) != 0) {
    +[TIKeyboardAssertionManager performSelector:withObject:]( &OBJC_CLASS___TIKeyboardAssertionManager,  "performSelector:withObject:",  "setSharedAssertionManager:",  v1);
  }
  id v0 = objc_alloc_init(&OBJC_CLASS___TIKeyboardActivityControllerMock);
  if ((objc_opt_respondsToSelector(&OBJC_CLASS___TIKeyboardActivityController, "setSharedController:") & 1) != 0) {
    +[TIKeyboardActivityController performSelector:withObject:]( &OBJC_CLASS___TIKeyboardActivityController,  "performSelector:withObject:",  "setSharedController:",  v0);
  }
}

uint64_t _TIEndMockingKeyboardActivityController()
{
  if ((objc_opt_respondsToSelector(&OBJC_CLASS___TIKeyboardActivityController, "setSharedController:") & 1) != 0) {
    +[TIKeyboardActivityController performSelector:withObject:]( &OBJC_CLASS___TIKeyboardActivityController,  "performSelector:withObject:",  "setSharedController:",  0LL);
  }
  uint64_t result = objc_opt_respondsToSelector(&OBJC_CLASS___TIKeyboardAssertionManager, "setSharedAssertionManager:");
  if ((result & 1) != 0) {
    return (uint64_t)+[TIKeyboardAssertionManager performSelector:withObject:]( &OBJC_CLASS___TIKeyboardAssertionManager,  "performSelector:withObject:",  "setSharedAssertionManager:",  0LL);
  }
  return result;
}

void sub_14190(_Unwind_Exception *a1)
{
}

void sub_14214(_Unwind_Exception *a1)
{
}

void _TIBeginMockingContactManagerWithContactCollection(void *a1)
{
  id v1 = a1;
  id v2 = -[TIContactManagerMock initWithContactCollection:]( objc_alloc(&OBJC_CLASS___TIContactManagerMock),  "initWithContactCollection:",  v1);

  if ((objc_opt_respondsToSelector(&OBJC_CLASS___TIContactManager, "setSharedTIContactManager:") & 1) != 0) {
    +[TIContactManager performSelector:withObject:]( &OBJC_CLASS___TIContactManager,  "performSelector:withObject:",  "setSharedTIContactManager:",  v2);
  }
}

void _TIEndMockingContactManager()
{
  if ((objc_opt_respondsToSelector(&OBJC_CLASS___TIContactManager, "setSharedTIContactManager:") & 1) != 0)
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue(+[TIContactManager sharedTIContactManager](&OBJC_CLASS___TIContactManager, "sharedTIContactManager"));
    id v0 = (void *)objc_claimAutoreleasedReturnValue([v11 observers]);
    id v1 = [v0 count];

    if (v1)
    {
      uint64_t v2 = TIBundleForInputMode(@"ja_JP-Kana");
      __int128 v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
      id v4 = [v3 classNamed:@"TIWordSearchKana"];
      if ((objc_opt_respondsToSelector(v4, "clearCachedContactObserver") & 1) != 0) {
        [v4 performSelector:"clearCachedContactObserver"];
      }
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  10.0));
      while (1)
      {
        id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  0.1));
        [v6 runMode:NSDefaultRunLoopMode beforeDate:v7];

        double v8 = (void *)objc_claimAutoreleasedReturnValue([v11 observers]);
        if (![v8 count]) {
          break;
        }
        CGFloat v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 laterDate:v5]);

        if (v10 != v5) {
          goto LABEL_11;
        }
      }

LABEL_11:
    }

    if ((objc_opt_respondsToSelector(&OBJC_CLASS___TIContactManager, "setSharedTIContactManager:") & 1) != 0) {
      +[TIContactManager performSelector:withObject:]( &OBJC_CLASS___TIContactManager,  "performSelector:withObject:",  "setSharedTIContactManager:",  0LL);
    }
  }

LABEL_13:
      v16 = 1;
      goto LABEL_14;
    }
  }

LABEL_9:
  v16 = 0;
LABEL_14:

  return v16;
}

  return v35;
}
}

  *a2 = v7;
  return v5;
}

id sub_15168(void *a1)
{
  id v1 = a1;
  if ([v1 length]
    && (uint64_t v2 = (char *)[v1 _rangeOfLongCharacterAtIndex:0], &v2[v3] == objc_msgSend(v1, "length")))
  {
    id v4 = [v1 _firstLongCharacter];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet letterCharacterSet](&OBJC_CLASS___NSCharacterSet, "letterCharacterSet"));
    id v6 = [v5 longCharacterIsMember:v4];
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

BOOL sub_151F8(void *a1)
{
  id v1 = a1;
  else {
    UChar32 v2 = 0;
  }
  BOOL v3 = u_isspace(v2) != 0;

  return v3;
}

BOOL sub_15248(void *a1)
{
  id v1 = a1;
  else {
    UChar32 v2 = 0;
  }
  if (u_isdigit(v2)) {
    BOOL v3 = 1LL;
  }
  else {
    BOOL v3 = u_ispunct(v2) != 0;
  }

  return v3;
}

BOOL sub_152B4(void *a1)
{
  id v1 = a1;
  else {
    UChar32 v2 = 0;
  }
  if (u_ispunct(v2)) {
    BOOL v3 = 1LL;
  }
  else {
    BOOL v3 = u_isWhitespace(v2) != 0;
  }

  return v3;
}

LABEL_26:
  __int128 v25 = 0LL;
LABEL_27:

  return v25;
}

  return v11;
}

LABEL_32:
          id v27 = objc_claimAutoreleasedReturnValue([v4 firstObject]);
          goto LABEL_33;
        }
      }

      goto LABEL_32;
    }

    v37 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue([v38 internalSegments]);
    __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([v39 objectAtIndex:v13]);

    __int128 v41 = (void *)objc_claimAutoreleasedReturnValue([v37 input]);
    if ([v41 length])
    {
      __int128 v42 = [v40 length];
      __int128 v43 = (void *)objc_claimAutoreleasedReturnValue([v37 input]);
      if (v42 > [v43 length])
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue([v40 lowercaseString]);
        v45 = (void *)objc_claimAutoreleasedReturnValue([v37 input]);
        v46 = (void *)objc_claimAutoreleasedReturnValue([v45 lowercaseString]);
        v54 = [v44 hasSuffix:v46];

        if ((v54 & 1) != 0)
        {
          v47 = (id)objc_claimAutoreleasedReturnValue([v37 input]);
          v48 = 0;
LABEL_26:
          v49 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
          v50 = (void *)objc_claimAutoreleasedReturnValue([v49 externalSegments]);
          v51 = (void *)objc_claimAutoreleasedReturnValue([v50 objectAtIndex:v13]);

          if (v48) {
            v52 = v51;
          }
          else {
            v52 = (id)objc_claimAutoreleasedReturnValue( objc_msgSend( v51,  "substringFromIndex:",  (_BYTE *)objc_msgSend(v51, "length") - (_BYTE *)objc_msgSend(v47, "length")));
          }
          v53 = v52;
          CGFloat v9 = (void *)objc_claimAutoreleasedReturnValue( +[TIKeyboardCandidateSingle candidateWithCandidate:forInput:]( &OBJC_CLASS___TIKeyboardCandidateSingle,  "candidateWithCandidate:forInput:",  v52,  v47));

          goto LABEL_34;
        }

LABEL_25:
        v47 = v40;
        v48 = 1;
        goto LABEL_26;
      }
    }

    goto LABEL_25;
  }

LABEL_3:
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
  CGFloat v9 = (void *)objc_claimAutoreleasedReturnValue( -[_ACTUserActionStream matchTransliterationCandidateToSegment:withCursorAt:]( self,  "matchTransliterationCandidateToSegment:withCursorAt:",  v4,  [v8 segmentCursor]));

  if (v9)
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
    -[_ACTUserActionStream setLastCursorPositionForTransliteratedCandidate:]( self,  "setLastCursorPositionForTransliteratedCandidate:",  [v10 segmentCursor]);
  }

  id v6 = 0LL;
LABEL_4:

LABEL_15:
  return v6;
}

LABEL_5:
  return v9;
}

uint64_t sub_16A24(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cursor]);
  id v5 = [v4 rangeOfInputSegmentsForCandidate:v3];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 input]);
  if ([v6 length])
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 document]);
    CGFloat v9 = (void *)objc_claimAutoreleasedReturnValue([v3 input]);
    unsigned int v10 = [v8 hasSuffix:v9];
  }

  else
  {
    unsigned int v10 = 1;
  }

  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v11 = 0LL;
  }
  else {
    uint64_t v11 = v10;
  }

  return v11;
}

int64_t sub_16B00(id a1, TIKeyboardCandidate *a2, TIKeyboardCandidate *a3)
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardCandidate candidate](a2, "candidate"));
  id v6 = [v5 length];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardCandidate candidate](v4, "candidate"));
  id v8 = [v7 length];

  if (v6 > v8) {
    return -1LL;
  }
  else {
    return v6 < v8;
  }
}

LABEL_10:
  return v18;
}

  [*(id *)(a1 + 56) setObject:v7 forKey:v5];
}

LABEL_16:
    if (![v12 length])
    {
      CGRect v19 = (unint64_t)[v6 length] < 0x15;
      goto LABEL_18;
    }

LABEL_26:
    id v8 = v26 - 1;
    if (v26 > 0) {
      continue;
    }
    break;
  }
        }

LABEL_15:
        goto LABEL_16;
      }

LABEL_27:
  CGFloat v9 = 0LL;
  id v8 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_29:

  __int128 v24 = v8;
  __int128 v25 = v9;
  result.length = v25;
  result.location = v24;
  return result;
}

LABEL_53:
    CGFloat v9 = (void *)v22;
    *a3 = 1;
    return v9;
  }

  CGFloat v9 = 0LL;
  return v9;
}

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v48 = self->_optionalFieldValues;
  v49 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v48,  "countByEnumeratingWithState:objects:count:",  &v68,  v88,  16LL);
  if (v49)
  {
    v50 = v49;
    v51 = *(void *)v69;
    do
    {
      for (j = 0LL; j != v50; j = (char *)j + 1)
      {
        if (*(void *)v69 != v51) {
          objc_enumerationMutation(v48);
        }
        v53 = *(void *)(*((void *)&v68 + 1) + 8LL * (void)j);
        v54 = (void *)objc_claimAutoreleasedReturnValue([v67 objectForKey:v53]);
        if (v54)
        {
          v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));

          if (v54 != v55)
          {
            v56 = (void *)objc_claimAutoreleasedReturnValue([obj objectForKey:v53]);
            v57 = v56;
            if (v56) {
              v58 = v56;
            }
            else {
              v58 = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_optionalFieldValues, "objectForKey:", v53));
            }
            v59 = v58;

            v60 = objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
            v61 = v59;
            if (v59 == (void *)v60)
            {
LABEL_66:
            }

            else
            {
              v62 = (void *)v60;
              v63 = [v54 isEqual:v59];

              if ((v63 & 1) == 0)
              {
                v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Field '%@' expected: %@ actual: %@",  v53,  v59,  v54));
                -[TIAnalyticsValidationResult addError:](v66, "addError:", v61);
                goto LABEL_66;
              }
            }
          }
        }
      }

      v50 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v48,  "countByEnumeratingWithState:objects:count:",  &v68,  v88,  16LL);
    }

    while (v50);
  }

  return v66;
}

LABEL_7:
  v36 = v9 + v11;
  id v35 = -[ACTSubstituteKeyTap initWithIntendedKey:touchedKey:error:location:timestamp:]( objc_alloc(&OBJC_CLASS___ACTSubstituteKeyTap),  "initWithIntendedKey:touchedKey:error:location:timestamp:",  v7,  v30,  0LL,  v24,  v26,  v36);
  if (v35)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
    -[ACTUserAction setInputSegment:](v35, "setInputSegment:", [v37 segmentCursor]);

    -[_ACTUserActionStream advancePositionByString:](self, "advancePositionByString:", v4);
    -[_ACTUserActionStream setLastTimestamp:](self, "setLastTimestamp:", v36);
  }

  CGFloat v9 = 1;
LABEL_8:

  return v9;
}

LABEL_4:
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
        id v29 = (char *)[v28 segmentCursor];
LABEL_5:
        -[ACTUserAction setInputSegment:](v26, "setInputSegment:", v29);

        -[_ACTUserActionStream setLastTimestamp:](self, "setLastTimestamp:", v6);
        goto LABEL_6;
      }
    }

    goto LABEL_4;
  }

  -[_ACTUserActionStream lastTimestamp](self, "lastTimestamp");
  CGFloat v9 = v8;
  -[_ACTUserActionStream randomActionInterval](self, "randomActionInterval");
  uint64_t v11 = v9 + v10;
  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream errorGenerator](self, "errorGenerator"));
  CGFloat v13 = (void *)objc_claimAutoreleasedReturnValue([v6 representedString]);
  [v6 paddedFrame];
  double v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "errorForKeyString:rect:", v13));

  CGFloat v15 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
  [v15 pointForAttemptedTapOnKey:v6 withError:v14];
  uint64_t v17 = v16;
  CGRect v19 = v18;

  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream delegate](self, "delegate"));
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 keyplane]);
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "keyContainingPoint:inKeyplane:", v22, v17, v19));

  if (v23) {
    __int128 v24 = -[ACTKeyTap initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:]( objc_alloc(&OBJC_CLASS___ACTKeyTap),  "initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:",  v6,  v23,  v14,  0LL,  v17,  v19,  v11);
  }
  else {
    __int128 v24 = -[ACTSkipKeyTap initWithIntendedKey:timestamp:]( objc_alloc(&OBJC_CLASS___ACTSkipKeyTap),  "initWithIntendedKey:timestamp:",  v6,  v11);
  }
  __int128 v25 = v24;
  if (v24)
  {
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[_ACTUserActionStream cursor](self, "cursor"));
    -[ACTUserAction setInputSegment:](v25, "setInputSegment:", [v26 segmentCursor]);

    -[_ACTUserActionStream setLastTimestamp:](self, "setLastTimestamp:", v11);
  }

LABEL_10:
  return v25;
}

LABEL_6:
  return v26;
}

  -[ACTKeyboardController updateDocumentState](self, "updateDocumentState");
}

  return v10;
}

    if (v16)
    {
      uint64_t v11 = sub_45514(v16);
      double v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      if (!v4)
      {
LABEL_9:
        double v14 = &__NSArray0__struct;
        unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v12 arrayByAddingObjectsFromArray:&__NSArray0__struct]);

        if (v5)
        {
          CGFloat v15 = sub_4593C((uint64_t)v5);
          double v14 = (void *)objc_claimAutoreleasedReturnValue(v15);
        }

        _TIBeginMockingSingletonsWithMockData(v14, v10, &__NSArray0__struct, 0LL, 0, v7);

        goto LABEL_12;
      }
    }

    else
    {
      double v12 = &__NSArray0__struct;
      if (!v4) {
        goto LABEL_9;
      }
    }

    CGFloat v13 = sub_45658((void *)v4);
    objc_claimAutoreleasedReturnValue(v13);
    goto LABEL_9;
  }

  if (v8) {
    goto LABEL_6;
  }
  CGFloat v9 = sub_45748((uint64_t)v5);
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  _TIBeginMockingSingletonsWithResources(v10, &__NSArray0__struct, 0LL, 1, v7);
LABEL_12:

LABEL_16:
}

    id v8 = 0LL;
    goto LABEL_7;
  }

  id v8 = 0LL;
LABEL_8:

  return v8;
}

LABEL_15:
  return v8;
}

  return v11;
}
  }

  uint64_t v17 = -[ACTUserMentalCursor segmentCursor](self, "segmentCursor");
  if (v17 == -1LL) {
    goto LABEL_15;
  }
  CGFloat v9 = i - v17;
  while (1)
  {
    id v8 = v17;
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[ACTUserMentalCursor externalSegments](self, "externalSegments"));
    CGRect v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "subarrayWithRange:", v8, v9));
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([(id)v19 componentsJoinedByString:&stru_89E80]);

    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v4 candidate]);
    LOBYTE(v19) = [v21 isEqualToString:v20];

    if ((v19 & 1) != 0) {
      break;
    }
    __int128 v22 = [v20 length];
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v4 candidate]);
    __int128 v24 = [v23 length];

    if (v22 < v24)
    {
      uint64_t v17 = v8 - 1;
      ++v9;
      if (v8) {
        continue;
      }
    }

    goto LABEL_15;
  }

LABEL_18:
LABEL_19:

  v30 = v8;
  id v31 = v9;
  result.length = v31;
  result.location = v30;
  return result;
}

    CGFloat v15 = 0;
    goto LABEL_44;
  }

  if (!a5) {
    goto LABEL_15;
  }
  v16 = &off_905C0;
LABEL_14:
  CGFloat v15 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.TIDESPlugin",  1LL,  v16));
LABEL_44:

  return v15;
}

void sub_19CFC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37)
{
}

uint64_t sub_19D58(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_19D68(uint64_t a1)
{
}

void sub_19D70(uint64_t a1, void *a2, _BYTE *a3)
{
  id v17 = a2;
  if ([*(id *)(a1 + 32) length])
  {
    uint64_t v5 = 0LL;
    while (1)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v5, 1));
      unsigned __int8 v7 = [v17 isEqualToString:v6];

      if ((v7 & 1) != 0) {
        break;
      }
    }
  }

  else
  {
LABEL_5:
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) delegate]);
    CGFloat v9 = (void *)objc_claimAutoreleasedReturnValue([v8 keyplane]);

    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(a1 + 40),  "anyKeyForString:keyplane:wantSecondaryString:substituteUpperCaseForLowerCase:",  v17,  v9,  objc_msgSend(*(id *)(a1 + 40), "lastActionUseSecondaryString"),  1));
    if (v10
      || (uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) delegate]),
          unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v11 mapShiftedKeyToUnShiftedKeyExcludeCapitalization:v17]),
          v11,
          v10))
    {
      [*(id *)(a1 + 48) addObject:v10];
      if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL))
      {
        uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 representedString]);
        uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8LL);
        double v14 = *(void **)(v13 + 40);
        *(void *)(v13 + 40) = v12;
      }

      CGFloat v15 = (void *)objc_claimAutoreleasedReturnValue([v10 representedString]);
      id v16 = [v15 caseInsensitiveCompare:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

      if (v16) {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;
      }
    }

    else
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 1;
      *a3 = 1;
    }
  }
}

NSMutableArray *sub_1A67C(void *a1)
{
  id v1 = a1;
  UChar32 v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v3 = v1;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      unsigned __int8 v7 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TTKConversationMessage fromJsonDict:]( &OBJC_CLASS___TTKConversationMessage,  "fromJsonDict:",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)v7),  (void)v10));
        -[NSMutableArray addObject:](v2, "addObject:", v8);

        unsigned __int8 v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v5);
  }

  return v2;
}

NSMutableArray *sub_1A7A8(void *a1)
{
  id v1 = a1;
  UChar32 v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v3 = v1;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      unsigned __int8 v7 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v7), "toJsonDict", (void)v10));
        -[NSMutableArray addObject:](v2, "addObject:", v8);

        unsigned __int8 v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v5);
  }

  return v2;
}

NSMutableArray *sub_1ACDC(void *a1)
{
  id v1 = a1;
  UChar32 v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v3 = v1;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      unsigned __int8 v7 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TTKConversationTest fromJsonDict:]( &OBJC_CLASS___TTKConversationTest,  "fromJsonDict:",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)v7),  (void)v10));
        -[NSMutableArray addObject:](v2, "addObject:", v8);

        unsigned __int8 v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v5);
  }

  return v2;
}

id _TIQueueBackground()
{
  if (qword_AA308 != -1) {
    dispatch_once(&qword_AA308, &stru_88EA0);
  }
  return (id)qword_AA300;
}

void sub_1AE48(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_qos_class(&_dispatch_queue_attr_concurrent, QOS_CLASS_BACKGROUND, 0);
  id v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create(0LL, v4);
  id v3 = (void *)qword_AA300;
  qword_AA300 = (uint64_t)v2;
}

id _TIQueueLow()
{
  if (qword_AA318 != -1) {
    dispatch_once(&qword_AA318, &stru_88EC0);
  }
  return (id)qword_AA310;
}

void sub_1AEDC(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_qos_class(&_dispatch_queue_attr_concurrent, QOS_CLASS_UTILITY, 0);
  id v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create(0LL, v4);
  id v3 = (void *)qword_AA310;
  qword_AA310 = (uint64_t)v2;
}

id _TIQueueUserInitiated()
{
  if (qword_AA328 != -1) {
    dispatch_once(&qword_AA328, &stru_88EE0);
  }
  return (id)qword_AA320;
}

void sub_1AF70(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_qos_class(&_dispatch_queue_attr_concurrent, QOS_CLASS_USER_INITIATED, 0);
  id v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create(0LL, v4);
  id v3 = (void *)qword_AA320;
  qword_AA320 = (uint64_t)v2;
}

void TIDispatchSync(void *a1, void *a2)
{
  queue = a1;
  id v3 = a2;
  if (qword_AA338 != -1) {
    dispatch_once(&qword_AA338, &stru_88F28);
  }
  do
    unint64_t v4 = __ldaxr(&qword_AA330);
  while (__stlxr(v4 + 1, &qword_AA330));
  dispatch_sync(queue, v3);
  if (qword_AA338 != -1) {
    dispatch_once(&qword_AA338, &stru_88F28);
  }
  do
    unint64_t v5 = __ldaxr(&qword_AA330);
  while (__stlxr(v5 - 1, &qword_AA330));
}

void TIDispatchAsync(void *a1, void *a2)
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1B164;
  v7[3] = &unk_88F08;
  id v8 = a2;
  id v3 = v8;
  unint64_t v4 = a1;
  unint64_t v5 = objc_retainBlock(v7);
  if (qword_AA338 != -1) {
    dispatch_once(&qword_AA338, &stru_88F28);
  }
  do
    unint64_t v6 = __ldaxr(&qword_AA330);
  while (__stlxr(v6 + 1, &qword_AA330));
  dispatch_async(v4, v5);
}

void sub_1B164(uint64_t a1)
{
  if (qword_AA338 != -1) {
    dispatch_once(&qword_AA338, &stru_88F28);
  }
  do
    unint64_t v1 = __ldaxr(&qword_AA330);
  while (__stlxr(v1 - 1, &qword_AA330));
}

unint64_t TIDispatchCount()
{
  if (qword_AA338 != -1) {
    dispatch_once(&qword_AA338, &stru_88F28);
  }
  return atomic_load(&qword_AA330);
}

void TIDispatchWaitForAllBlocks()
{
  id v0 = objc_autoreleasePoolPush();
  while (1)
  {
    if (qword_AA338 != -1) {
      dispatch_once(&qword_AA338, &stru_88F28);
    }
    uint64_t v1 = atomic_load(&qword_AA330);
    if (v1 < 1) {
      break;
    }
    dispatch_queue_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 0.01));
    [v2 acceptInputForMode:NSDefaultRunLoopMode beforeDate:v3];
  }

  objc_autoreleasePoolPop(v0);
}

void sub_1B2F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B30C(id a1)
{
}

void sub_1B3F4(id a1)
{
  uint64_t v1 = (objc_class *)objc_opt_class(&OBJC_CLASS___TIKeyboardInputManager);
  InstanceMethod = class_getInstanceMethod(v1, "testingParameters");
  id v3 = class_getInstanceMethod(v1, "mockTestingParameters");
  if (InstanceMethod) {
    BOOL v4 = v3 == 0LL;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    unint64_t v5 = v3;
    Implementation = method_getImplementation(v3);
    TypeEncoding = method_getTypeEncoding(v5);
    if (class_addMethod(v1, "testingParameters", Implementation, TypeEncoding))
    {
      CGFloat v9 = method_getImplementation(InstanceMethod);
      __int128 v10 = method_getTypeEncoding(InstanceMethod);
      class_replaceMethod(v1, "mockTestingParameters", v9, v10);
    }

    else
    {
      method_exchangeImplementations(InstanceMethod, v5);
    }
  }

void sub_1BCFC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

void sub_1BD2C(uint64_t a1, void *a2)
{
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  BOOL IsNull = CGRectIsNull(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 32LL));
  __int128 v12 = *(CGRect **)(*(void *)(a1 + 32) + 8LL);
  if (IsNull)
  {
    v12[1].origin.x = v4;
    v12[1].origin.y = v6;
    v12[1].size.width = v8;
    v12[1].size.height = v10;
    __int128 v13 = *(CGFloat **)(*(void *)(a1 + 40) + 8LL);
    v13[4] = v4;
    v13[5] = v6;
    v13[6] = v8;
    v13[7] = v10;
  }

  else
  {
    v14.origin.x = v4;
    v14.origin.y = v6;
    v14.size.width = v8;
    v14.size.height = v10;
    *(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 32LL) = CGRectUnion(v12[1], v14);
  }

void sub_1BDD8(uint64_t a1, void *a2)
{
  id v17 = a2;
  [v17 frame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  v22.origin.x = v3;
  v22.origin.y = v5;
  v22.size.width = v7;
  v22.size.height = v9;
  if (CGRectIntersectsRect(*(CGRect *)(a1 + 56), v22)) {
    goto LABEL_4;
  }
  v23.origin.x = v4;
  v23.origin.y = v6;
  v23.size.width = v8;
  v23.size.height = v10;
  if (CGRectIntersectsRect(*(CGRect *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 32LL), v23))
  {
    double MaxX = CGRectGetMaxX(*(CGRect *)(a1 + 56));
    v18.origin.x = v4;
    v18.origin.y = v6;
    v18.size.width = v8;
    v18.size.height = v10;
    double v12 = MaxX - CGRectGetMinX(v18);
    v19.origin.x = v4;
    v19.origin.y = v6;
    v19.size.width = v8;
    v19.size.height = v10;
    double v13 = CGRectGetMaxX(v19);
    if (v12 > v13 - CGRectGetMaxX(*(CGRect *)(a1 + 56))) {
LABEL_4:
    }
      [*(id *)(a1 + 32) addObject:v17];
  }

  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  if (CGRectIntersectsRect(*(CGRect *)(a1 + 88), v24)) {
    goto LABEL_8;
  }
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  if (CGRectIntersectsRect(*(CGRect *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 32LL), v25))
  {
    v20.origin.x = v4;
    v20.origin.y = v6;
    v20.size.width = v8;
    v20.size.height = v10;
    double v14 = CGRectGetMaxX(v20);
    double v15 = v14 - CGRectGetMinX(*(CGRect *)(a1 + 88));
    double MinX = CGRectGetMinX(*(CGRect *)(a1 + 88));
    v21.origin.x = v4;
    v21.origin.y = v6;
    v21.size.width = v8;
    v21.size.height = v10;
    if (v15 > MinX - CGRectGetMinX(v21)) {
LABEL_8:
    }
      [*(id *)(a1 + 40) addObject:v17];
  }
}

void sub_1C1B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

uint64_t sub_1C1E0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1C1F0(uint64_t a1)
{
}

void sub_1C1F8(uint64_t a1, void *a2)
{
  id v16 = a2;
  [v16 frame];
  CGFloat x = v17.origin.x;
  CGFloat y = v17.origin.y;
  CGFloat width = v17.size.width;
  CGFloat height = v17.size.height;
  double MinX = CGRectGetMinX(v17);
  double MaxX = CGRectGetMaxX(*(CGRect *)(a1 + 56));
  [v16 frame];
  double v11 = v10;
  [*(id *)(a1 + 32) frame];
  if (v11 >= v12)
  {
    double v14 = MinX - MaxX;
  }

  else
  {
    double v13 = CGRectGetMinX(*(CGRect *)(a1 + 56));
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.CGFloat width = width;
    v18.size.CGFloat height = height;
    double v14 = v13 - CGRectGetMaxX(v18);
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8LL);
  if (v14 < *(double *)(v15 + 24))
  {
    *(double *)(v15 + 24) = v14;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), a2);
  }
}

LABEL_8:
    -[ACTKeyboardController acceptAutocorrection](self, "acceptAutocorrection");
    goto LABEL_16;
  }
}

      sub_5505C("out of dynamic memory in yyensure_buffer_stack()");
    }
  }

  else
  {
    uint64_t result = malloc(8uLL);
    qword_AA3E8 = (uint64_t)result;
    if (!result) {
      goto LABEL_8;
    }
    *uint64_t result = 0LL;
    qword_AA420 = 1LL;
    qword_AA3F0 = 0LL;
  }

  return result;
}

id sub_1E0D0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setKeyboardConfiguration:a2];
}

id sub_1E0DC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setKeyboardConfiguration:a2];
}

void sub_1E2A0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_1E2C0(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  return [*(id *)(a1 + 32) setKeyboardConfiguration:a2];
}

id sub_1E824(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateAutoshift];
}

id sub_1E8F8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setKeyboardConfiguration:a2];
}

void sub_1ECC8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_1ECEC(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = a2;
  return result;
}

void sub_1F0B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_1F0D8(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = a2;
  return result;
}

LABEL_33:
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState"));
    [v55 skipHitTestForTouchEvent:v28 keyboardState:v56];

    -[ACTKeyboardController generateAutocorrectionsOrCandidates](self, "generateAutocorrectionsOrCandidates");
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController autocorrection](self, "autocorrection"));
    v44 = (void *)objc_claimAutoreleasedReturnValue([v57 candidate]);

    if (-[ACTKeyboardController usesTransliteration](self, "usesTransliteration")
      || -[ACTKeyboardController generatesCandidates](self, "generatesCandidates"))
    {
      __int128 v43 = 0LL;
      v58 = &CFAbsoluteTimeGetCurrent_ptr;
LABEL_48:
      -[ACTKeyboardController updateAutoshift](self, "updateAutoshift");
      v77 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController activeTouchState](self, "activeTouchState"));
      v78 = (void *)objc_claimAutoreleasedReturnValue([v58[65] numberWithUnsignedInteger:a6]);
      [v77 removeObjectForKey:v78];

      goto LABEL_49;
    }

    v85 = v28;
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController autocorrectionList](self, "autocorrectionList"));
    v60 = (void *)objc_claimAutoreleasedReturnValue([v59 predictions]);
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController autocorrectionList](self, "autocorrectionList"));
    v62 = (void *)objc_claimAutoreleasedReturnValue([v61 emojiList]);
    v63 = (void *)objc_claimAutoreleasedReturnValue( +[TIAutocorrectionList listWithCorrections:predictions:emojiList:]( &OBJC_CLASS___TIAutocorrectionList,  "listWithCorrections:predictions:emojiList:",  0LL,  v60,  v62));

    if (![v44 length])
    {
      __int128 v43 = 0LL;
      goto LABEL_40;
    }

    if (-[ACTKeyboardController insertsSpaceAfterPredictiveInput](self, "insertsSpaceAfterPredictiveInput"))
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerState](self, "inputManagerState"));
      __int128 v43 = (__CFString *)objc_claimAutoreleasedReturnValue([v64 wordSeparator]);

      v65 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerState](self, "inputManagerState"));
      v66 = (void *)objc_claimAutoreleasedReturnValue([v65 wordSeparator]);
      v67 = objc_claimAutoreleasedReturnValue([v44 stringByAppendingString:v66]);

      v68 = -[ACTKeyboardController adjustContinuousPathCandidate:](self, "adjustContinuousPathCandidate:", v67);
      -[ACTKeyboardController addInput:fromVariantKey:touchEvent:]( self,  "addInput:fromVariantKey:touchEvent:",  v43,  0LL,  0LL);
      v44 = (void *)v67;
LABEL_40:
      v58 = &CFAbsoluteTimeGetCurrent_ptr;
LABEL_47:
      v28 = v85;
      -[ACTKeyboardController setAutocorrectionList:](self, "setAutocorrectionList:", v63);

      goto LABEL_48;
    }

    v69 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController autocorrection](self, "autocorrection"));
    v70 = (void *)objc_claimAutoreleasedReturnValue([v69 candidate]);
    if ([v70 hasPrefix:@" "])
    {
      v71 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController text](self, "text"));
      v72 = [v71 hasSuffix:@"..."];

      if (!v72)
      {
        v58 = &CFAbsoluteTimeGetCurrent_ptr;
        goto LABEL_46;
      }

      v80 = objc_alloc(&OBJC_CLASS___TIZephyrCandidate);
      v83 = (void *)objc_claimAutoreleasedReturnValue([v69 candidate]);
      v73 = (void *)objc_claimAutoreleasedReturnValue([v83 substringFromIndex:1]);
      v74 = (void *)objc_claimAutoreleasedReturnValue([v69 input]);
      v75 = (void *)objc_claimAutoreleasedReturnValue([v69 rawInput]);
      v81 = objc_msgSend( v80,  "initWithCandidate:forInput:rawInput:wordOriginFeedbackID:usageTrackingMask:sourceMask:",  v73,  v74,  v75,  objc_msgSend(v69, "wordOriginFeedbackID"),  objc_msgSend(v69, "usageTrackingMask"),  objc_msgSend(v69, "sourceMask"));

      [v81 setContinuousPathConversion:1];
      v70 = v69;
      v69 = v81;
    }

    v58 = &CFAbsoluteTimeGetCurrent_ptr;

LABEL_46:
    v76 = objc_claimAutoreleasedReturnValue([v69 candidate]);

    -[ACTKeyboardController acceptCandidate:](self, "acceptCandidate:", v69);
    __int128 v43 = 0LL;
    v44 = (void *)v76;
    goto LABEL_47;
  }

  id v35 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keys](self, "keys"));
  v36 = (void *)objc_claimAutoreleasedReturnValue([v35 objectAtIndex:v26]);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController layoutUtils](self, "layoutUtils"));
  v38 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v37,  "representedStringForKey:shifted:includeSecondaryStrings:",  v36,  -[ACTKeyboardController isShifted](self, "isShifted"),  v8));

  v39 = 0LL;
  __int128 v40 = &stru_89E80;
  switch([v36 interactionType])
  {
    case 1u:
    case 2u:
    case 0xDu:
    case 0x10u:
      -[ACTKeyboardController addInput:fromVariantKey:touchEvent:]( self,  "addInput:fromVariantKey:touchEvent:",  v38,  0LL,  v28);
      v39 = v38;
      goto LABEL_17;
    case 4u:
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState"));
      [v45 skipHitTestForTouchEvent:v28 keyboardState:v46];

      -[ACTKeyboardController deleteInput:](self, "deleteInput:", v28);
      v39 = @"\\b";
      goto LABEL_17;
    case 0xBu:
      goto LABEL_18;
    case 0xEu:
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerWrapper](self, "inputManagerWrapper"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController clonedKeyboardState](self, "clonedKeyboardState"));
      [v47 skipHitTestForTouchEvent:v28 keyboardState:v48];

      -[ACTKeyboardController shiftKeyplane](self, "shiftKeyplane");
      v39 = &stru_89E80;
      goto LABEL_17;
    case 0xFu:
      v84 = v28;
      -[ACTKeyboardController addInput:fromVariantKey:touchEvent:]( self,  "addInput:fromVariantKey:touchEvent:",  v38,  0LL,  v28);
      v39 = v38;
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyplane](self, "keyplane"));
      v50 = (void *)objc_claimAutoreleasedReturnValue([v49 name]);
      v51 = [v50 containsString:@"Wildcat"];

      if ((v51 & 1) != 0)
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keyplane](self, "keyplane"));
        v53 = (void *)objc_claimAutoreleasedReturnValue([v52 name]);
        v54 = (void *)objc_claimAutoreleasedReturnValue([v53 uppercaseString]);
        v82 = [v54 containsString:@"-ALTERNATE"];

        CGRect v17 = &CFAbsoluteTimeGetCurrent_ptr;
        v28 = v84;
        if (!v82) {
          goto LABEL_19;
        }
      }

      else
      {
        CGRect v17 = &CFAbsoluteTimeGetCurrent_ptr;
        v28 = v84;
      }

LABEL_17:
      __int128 v40 = v39;
      if ([v36 BOOLForProperty:@"more-after"])
      {
LABEL_18:
        -[ACTKeyboardController alternateKeyplane](self, "alternateKeyplane");
        v39 = (__CFString *)v40;
      }

        ++v28;
      }

      while (v28 < (unint64_t)[v11 count]);
    }

    if (a4)
    {
      __int128 v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      __int128 v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      if ([v11 count])
      {
        v44 = 0LL;
        v45 = 0;
        do
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndex:v44]);
          v47 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndex:v44]);
          v48 = [v46 caseInsensitiveCompare:v47];
          v49 = v48 != 0LL;
          if (v48)
          {
            if (v45)
            {
              v50 = (void *)objc_claimAutoreleasedReturnValue([v42 lastObject]);
              [v50 appendString:v46];

              v51 = (void *)objc_claimAutoreleasedReturnValue([v43 lastObject]);
              [v51 appendString:v47];
            }

            else
            {
              v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithString:]( &OBJC_CLASS___NSMutableString,  "stringWithString:",  v46));
              [v42 addObject:v52];

              v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithString:]( &OBJC_CLASS___NSMutableString,  "stringWithString:",  v47));
              [v43 addObject:v51];
            }
          }

          else
          {
            [v42 addObject:v46];
            [v43 addObject:v47];
          }

          ++v44;
          v45 = v49;
        }

        while (v44 < (unint64_t)[v11 count]);
      }

      double v13 = v43;
      double v11 = v42;
    }

    else
    {
      __int128 v43 = v13;
      __int128 v42 = v11;
    }

    CGFloat v7 = v56;
    CGFloat v6 = v57;
    CGFloat v8 = v55;
    v53 = (void *)objc_claimAutoreleasedReturnValue( +[PlaybackTest testsWithIntendedOutput:expectedOutput:]( &OBJC_CLASS___PlaybackTest,  "testsWithIntendedOutput:expectedOutput:",  v43,  v42));

    CGFloat v9 = v60;
  }

  else
  {
    NSLog(@"transliteration and native text differ - unable to align: %@", v6);
    v53 = 0LL;
  }

  return v53;
}

      if (-[NSMutableDictionary count](v36, "count")) {
        -[TIKeyboardTyper setShiftedKeyToUnShiftedKeyExcludeCapitalizationMap:]( self,  "setShiftedKeyToUnShiftedKeyExcludeCapitalizationMap:",  v36);
      }
    }
  }

LABEL_19:
      -[ACTKeyboardController generateAutocorrectionsOrCandidates](self, "generateAutocorrectionsOrCandidates");
      __int128 v41 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController activeTouchState](self, "activeTouchState"));
      __int128 v42 = (void *)objc_claimAutoreleasedReturnValue([v17[65] numberWithUnsignedInteger:a6]);
      [v41 removeObjectForKey:v42];

      __int128 v43 = v39;
      v44 = v43;
      break;
    default:
      goto LABEL_17;
  }

  ++result[3];
  return result;
}

LABEL_49:
  return v44;
}

void sub_20254( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_2026C(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  CGFloat v7 = *(void **)(a1 + 32);
  id v8 = a2;
  CGFloat v9 = (void *)objc_claimAutoreleasedReturnValue([v7 layoutUtils]);
  id v10 = (id)objc_claimAutoreleasedReturnValue( objc_msgSend( v9,  "representedStringForKey:shifted:",  v8,  objc_msgSend(*(id *)(a1 + 40), "isShiftKeyplane")));

  if ([*(id *)(a1 + 48) isEqualToString:v10])
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = a3;
    *a4 = 1;
  }
}

void sub_20FE8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v11 = a2;
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 textToCommit]);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 208);
  *(void *)(v7 + 20_Block_object_dispose(va, 8) = v6;

  CGFloat v9 = *(void **)(a1 + 32);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 textToCommit]);

  [v9 insertText:v10];
  [*(id *)(a1 + 32) setKeyboardConfiguration:v11];
}

id sub_214C4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setKeyboardConfiguration:a2];
}

void sub_21B64( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_21B84(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  id v13 = a2;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a3, a4));
  unsigned __int8 v12 = [v13 isEqualToString:v11];

  if ((v12 & 1) != 0)
  {
    if (a4 == 1
      && objc_msgSend(*(id *)(a1 + 40), "characterIsMember:", objc_msgSend(v13, "characterAtIndex:", 0)))
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = a3 + 1;
    }
  }

  else
  {
    *a7 = 1;
  }
}

id sub_21DC0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setAutocorrectionList:a2];
}

id sub_21E68(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setAutocorrectionList:a2];
}

void sub_22464(uint64_t a1, void *a2)
{
  CGFloat v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setAutocorrectionList:v4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 corrections]);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 autocorrection]);
  unsigned int v7 = [v6 isContinuousPathConversion];

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cpRequestTokenLock]);
    [v8 lock];

    [*(id *)(a1 + 32) setLastCPRequestToken:*(void *)(a1 + 40)];
    CGFloat v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cpRequestTokenLock]);
    [v9 unlock];

    [*(id *)(a1 + 32) closeRequestToken:*(void *)(a1 + 40)];
  }

void sub_22524(uint64_t a1, void *a2)
{
  CGFloat v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setAutocorrectionList:v4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 corrections]);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 autocorrection]);
  unsigned int v7 = [v6 isContinuousPathConversion];

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cpRequestTokenLock]);
    [v8 lock];

    [*(id *)(a1 + 32) setLastCPRequestToken:0];
    id v9 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cpRequestTokenLock]);
    [v9 unlock];
  }

void sub_22934( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id *sub_22954(id *result, uint64_t a2)
{
  if (a2)
  {
    dispatch_queue_t v2 = result;
    uint64_t result = (id *)[result[4] setCandidateResultSet:a2];
    *(_BYTE *)(*((void *)v2[5] + 1) + 24LL) = 1;
  }

  return result;
}

void sub_22A9C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_22AB4(uint64_t a1, void *a2)
{
}

LABEL_12:
}

  -[ACTKeyboardController setInputIsPunctuationFollowingContinuousPath:]( self,  "setInputIsPunctuationFollowingContinuousPath:",  0LL,  v13);
  if (-[ACTKeyboardController lastInputWasContinuousPath](self, "lastInputWasContinuousPath"))
  {
    CGRect v21 = -[NSMutableString length](self->_text, "length");
    CGRect v22 = [v41 length] == (char *)&dword_0 + 1 ? objc_msgSend(v41, "_firstLongCharacter") : 0;
    if (-[ACTKeyboardController isContinuousPathNonSpacePunctuation:]( self,  "isContinuousPathNonSpacePunctuation:",  v22)
      && ((v21 - 1) & 0x80000000) == 0
      && -[NSMutableString characterAtIndex:](self->_text, "characterAtIndex:") == 32)
    {
      -[ACTKeyboardController setInputIsPunctuationFollowingContinuousPath:]( self,  "setInputIsPunctuationFollowingContinuousPath:",  1LL);
    }
  }

  -[ACTKeyboardController setLastInputWasContinuousPath:](self, "setLastInputWasContinuousPath:", 0LL);
  if (v19)
  {
    if ((objc_opt_respondsToSelector(v19, "isContinuousPathConversion") & 1) != 0
      && [v19 performSelector:"isContinuousPathConversion"])
    {
      CGRect v23 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController autocorrectionList](self, "autocorrectionList"));
      CGRect v24 = (void *)objc_claimAutoreleasedReturnValue([v23 predictions]);
      CGRect v25 = (void *)objc_claimAutoreleasedReturnValue( +[TIAutocorrectionList listWithCorrections:predictions:]( &OBJC_CLASS___TIAutocorrectionList,  "listWithCorrections:predictions:",  0LL,  v24));
      -[ACTKeyboardController setAutocorrectionList:](self, "setAutocorrectionList:", v25);

      -[ACTKeyboardController setLastInputWasContinuousPath:](self, "setLastInputWasContinuousPath:", 1LL);
    }

    else
    {
      -[ACTKeyboardController setAutocorrectionList:](self, "setAutocorrectionList:", 0LL);
    }

    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerState](self, "inputManagerState"));
    id v27 = [v26 usesCandidateSelection];

    if (v27)
    {
      -[ACTKeyboardController acceptCandidate:](self, "acceptCandidate:", v19);
      goto LABEL_46;
    }
  }

  else
  {
    -[ACTKeyboardController setAutocorrectionList:](self, "setAutocorrectionList:", 0LL);
  }

  v28 = objc_alloc_init(&OBJC_CLASS___TIKeyboardInput);
  [v28 setString:v41];
  objc_msgSend(v28, "setUppercase:", -[ACTKeyboardController isShifted](self, "isShifted"));
  objc_msgSend(v28, "setAutoshifted:", -[ACTKeyboardController isAutoshifted](self, "isAutoshifted"));
  [v28 setPopupVariant:v8];
  if ((objc_opt_respondsToSelector(v28, "setGesture:") & 1) != 0) {
    [v28 setGesture:v7];
  }
  [v28 setTouchEvent:v10];
  [v28 setAcceptedCandidate:v19];
  if (-[ACTKeyboardController nextKeyIsMultitap](self, "nextKeyIsMultitap"))
  {
    [v28 setMultitap:1];
    -[ACTKeyboardController setNextKeyIsMultitap:](self, "setNextKeyIsMultitap:", 0LL);
  }

  if (-[ACTKeyboardController nextKeyIsFlick](self, "nextKeyIsFlick"))
  {
    [v28 setFlick:1];
    -[ACTKeyboardController setNextKeyIsFlick:](self, "setNextKeyIsFlick:", 0LL);
  }

  if (v10)
  {
    id v29 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController keys](self, "keys"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectAtIndex:", objc_msgSend(v10, "forcedKeyCode")));

    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 stringForProperty:UIKBTreePropertyHint]);
    [v28 setInputManagerHint:v31];
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue([v28 acceptedCandidate]);
  id v33 = objc_opt_respondsToSelector(v32, "isContinuousPathConversion");

  if ((v33 & 1) != 0)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue([v28 acceptedCandidate]);
    id v35 = [v34 isContinuousPathConversion];
  }

  else
  {
    id v35 = 0;
  }

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyboardController inputManagerState](self, "inputManagerState"));
  v37 = (void *)objc_claimAutoreleasedReturnValue([v36 wordSeparator]);
  v38 = [v41 isEqualToString:v37];

  if (v38)
  {
    v39 = -[ACTKeyboardController lastInputWasSelection](self, "lastInputWasSelection");
    if (v10) {
      __int128 v40 = 0;
    }
    else {
      __int128 v40 = v39;
    }
    if ((v40 | v35) == 1) {
      [v28 setSynthesizedByAcceptingCandidate:1];
    }
  }

  -[ACTKeyboardController handleKeyboardInput:](self, "handleKeyboardInput:", v28);

LABEL_46:
  -[ACTKeyboardController setLastInputWasSelection:](self, "setLastInputWasSelection:", 0LL);
}
}

  id v27 = v40;
  v28 = (void *)objc_claimAutoreleasedReturnValue([v8 samples]);
  id v29 = v28;
  if (v27) {
    v30 = objc_claimAutoreleasedReturnValue([v28 objectAtIndexedSubscript:v25]);
  }
  else {
    v30 = objc_claimAutoreleasedReturnValue([v28 lastObject]);
  }
  uint64_t v31 = (void *)v30;

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[TIKeyboardTyper keyboardController](self, "keyboardController"));
  [v31 point];
  v34 = v33;
  v36 = v35;
  [v31 timeStamp];
  LODWORD(v37) = 5.0;
  v39 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v32,  "performTouchUpAtLocation:radius:timestamp:pathIndex:fingerID:secondaryString:",  0,  0,  0,  v34,  v36,  v37,  v38));

  [v9 registerPathStringAsKeyStrokes:v39 path:v8 predictionBarState:0];
}

void sub_22E58(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) updateKeyboardOutput:v15 withInputForSmartPunctuation:*(void *)(a1 + 40)];
  if ([v15 deletionCount])
  {
    unint64_t v6 = 0LL;
    do
    {
      [*(id *)(a1 + 32) deleteBackwards];
      ++v6;
    }

    while (v6 < (unint64_t)[v15 deletionCount]);
  }

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v15 insertionText]);

  if (v7)
  {
    id v8 = *(void **)(a1 + 32);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v15 insertionText]);
    [v8 insertText:v9];
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v15 shortcutConversion]);

  if (v10)
  {
    id v11 = objc_alloc(&OBJC_CLASS___TICorrectionCandidates);
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v15 shortcutConversion]);
    id v13 = [v11 initWithAutocorrection:v12 alternateCorrections:0];

    double v14 = (void *)objc_claimAutoreleasedReturnValue( +[TIAutocorrectionList listWithCorrections:predictions:]( &OBJC_CLASS___TIAutocorrectionList,  "listWithCorrections:predictions:",  v13,  0LL));
    [*(id *)(a1 + 32) setAutocorrectionList:v14];
  }

  [*(id *)(a1 + 32) setKeyboardConfiguration:v5];
}

void sub_252FC(_Unwind_Exception *a1)
{
}

void sub_25380(_Unwind_Exception *a1)
{
}

void _TIBeginMockingUserDictionaryServer()
{
}

void _TIBeginMockingUserDictionaryServerWithPairs(void *a1)
{
  id v1 = a1;
  dispatch_queue_t v2 = objc_alloc_init(&OBJC_CLASS___TIUserDictionaryServerMock);
  -[TIUserDictionaryServerMock setPairs:](v2, "setPairs:", v1);

  if ((objc_opt_respondsToSelector(&OBJC_CLASS___TIUserDictionaryServer, "setSharedInstance:") & 1) != 0) {
    +[TIUserDictionaryServer performSelector:withObject:]( &OBJC_CLASS___TIUserDictionaryServer,  "performSelector:withObject:",  "setSharedInstance:",  v2);
  }
}

uint64_t _TIEndMockingUserDictionaryServer()
{
  uint64_t result = objc_opt_respondsToSelector(&OBJC_CLASS___TIUserDictionaryServer, "setSharedInstance:");
  if ((result & 1) != 0) {
    return (uint64_t)+[TIUserDictionaryServer performSelector:withObject:]( &OBJC_CLASS___TIUserDictionaryServer,  "performSelector:withObject:",  "setSharedInstance:",  0LL);
  }
  return result;
}

double sub_262B8(double a1)
{
  double v1 = 1.0;
  if (a1 <= 1.0) {
    double v1 = a1;
  }
  BOOL v2 = a1 < 0.0;
  double result = 0.0;
  if (!v2) {
    return v1;
  }
  return result;
}

void sub_2717C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_272A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  _Unwind_Resume(a1);
}

void sub_2747C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_274E0(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if ((a4 - 500) <= 0xFFFFFE0C)
  {
    id v5 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a2,  a3,  4LL);
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[NSString stringByTrimmingCharactersInSet:](v5, "stringByTrimmingCharactersInSet:", v6));

    objc_msgSend(*(id *)(a1 + 32), "addObject:");
  }

void sub_27598(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_279F0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

id sub_27A70()
{
  uint64_t v4 = 0LL;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  id v0 = (id *)qword_AA370;
  uint64_t v7 = qword_AA370;
  if (!qword_AA370)
  {
    double v1 = (void *)sub_28F2C();
    id v0 = (id *)dlsym(v1, "kLXLexiconNameKey");
    v5[3] = (uint64_t)v0;
    qword_AA370 = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    uint64_t v3 = (_Unwind_Exception *)sub_55900();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *v0;
}

id sub_27B04()
{
  uint64_t v4 = 0LL;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  id v0 = (id *)qword_AA378;
  uint64_t v7 = qword_AA378;
  if (!qword_AA378)
  {
    double v1 = (void *)sub_28F2C();
    id v0 = (id *)dlsym(v1, "kLXLexiconLocaleKey");
    v5[3] = (uint64_t)v0;
    qword_AA378 = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    uint64_t v3 = (_Unwind_Exception *)sub_55900();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *v0;
}

uint64_t sub_27B98(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  uint64_t v4 = off_AA380;
  id v11 = off_AA380;
  if (!off_AA380)
  {
    id v5 = (void *)sub_28F2C();
    uint64_t v4 = dlsym(v5, "LXLexiconCreateTransient");
    v9[3] = (uint64_t)v4;
    off_AA380 = v4;
  }

  _Block_object_dispose(&v8, 8);
  if (!v4)
  {
    uint64_t v7 = (_Unwind_Exception *)sub_55900();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }

  return ((uint64_t (*)(uint64_t, uint64_t))v4)(a1, a2);
}

void sub_27CBC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)&OBJC_CLASS___TITransientLexiconManagerMock;
  -[_Unwind_Exception dealloc](&a9, "dealloc");
  _Unwind_Resume(a1);
}

void sub_27CE8(void *a1)
{
}

void sub_27D84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_27EC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_27F5C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_280D8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va1, 8);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_28108(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  uint64_t v6 = off_AA390;
  uint64_t v13 = off_AA390;
  if (!off_AA390)
  {
    uint64_t v7 = (void *)sub_28F2C();
    uint64_t v6 = dlsym(v7, "LXEntryCopyString");
    v11[3] = (uint64_t)v6;
    off_AA390 = v6;
  }

  _Block_object_dispose(&v10, 8);
  if (!v6)
  {
    id v9 = (_Unwind_Exception *)sub_55900();
    _Block_object_dispose(&v10, 8);
    _Unwind_Resume(v9);
  }

  uint64_t v8 = (const __CFString *)((uint64_t (*)(uint64_t))v6)(a2);
  if (CFStringCompare(v8, *(CFStringRef *)(a1 + 40), *(_BYTE *)(a1 + 48) == 0) == kCFCompareEqualTo)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    *a3 = 1;
  }

  CFRelease(v8);
}

void sub_28240(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2829C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_28568(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v6 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  sub_29178(v3);
  KB::String::~String((KB::String *)va1);
  sub_29178((uint64_t)va);
  KB::String::~String((KB::String *)(v4 - 152));
  KB::String::~String((KB::String *)(v4 - 120));

  KB::String::~String((KB::String *)(v4 - 88));
  _Unwind_Resume(a1);
}

void sub_288D0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v6 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  sub_29178(v3);
  KB::String::~String((KB::String *)va1);
  sub_29178((uint64_t)va);
  KB::String::~String((KB::String *)(v4 - 152));
  KB::String::~String((KB::String *)(v4 - 120));

  KB::String::~String((KB::String *)(v4 - 88));
  _Unwind_Resume(a1);
}

void sub_28AC0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void _TIBeginMockingTransientLexiconManagerWithData(void *a1, void *a2)
{
  id v7 = a1;
  id v3 = a2;
  if ((byte_AA350 & 1) == 0)
  {
    Class v4 = NSClassFromString(@"TITransientLexiconManager");
    if (v4)
    {
      id v5 = -[TITransientLexiconManagerMock initWithTransientData:namedEntities:]( objc_alloc(&OBJC_CLASS___TITransientLexiconManagerMock),  "initWithTransientData:namedEntities:",  v7,  v3);
      uint64_t v6 = (void *)qword_AA348;
      qword_AA348 = (uint64_t)v5;

      -[objc_class setSharedTITransientLexiconManager:](v4, "setSharedTITransientLexiconManager:", qword_AA348);
    }

    else
    {
      byte_AA350 = 1;
    }
  }
}

void sub_28C18( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id _TISetNewContactCollectionForMockingTransientLexiconManager(uint64_t a1)
{
  return _[(id)qword_AA348 setNewContactCollection:a1];
}

void _TIEndMockingTransientLexiconManager()
{
  if ((byte_AA350 & 1) == 0)
  {
    -[objc_class setSharedTITransientLexiconManager:]( NSClassFromString(@"TITransientLexiconManager"),  "setSharedTITransientLexiconManager:",  0LL);
    id v0 = (void *)qword_AA348;
    qword_AA348 = 0LL;
  }

id _TIConvertTIMockContactCollection(void *a1)
{
  id v16 = a1;
  double v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id obj = v16;
  id v2 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v19;
    do
    {
      Class v4 = 0LL;
      do
      {
        if (*(void *)v19 != v3) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)v4);
        id v6 = objc_alloc(&OBJC_CLASS____ICContact);
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 firstName]);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 middleName]);
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 lastName]);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 nickName]);
        [v5 relevancyScore];
        id v12 = [v6 initWithFirstName:v7 phoneticFirstName:0 middleName:v8 phoneticMiddleName:0 lastName:v9 phoneticLastName:0 organization Name:v11 jobTitle:0 nickname:0 relations:v10 streets:0 cities:0 score:0];

        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);
        [v1 setObject:v12 forKey:v14];

        Class v4 = (char *)v4 + 1;
      }

      while (v2 != v4);
      id v2 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v2);
  }

  return v1;
}

void sub_28E84( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

id _TIMockingTransientLexiconManagerOfferedCount()
{
  return _[(id)qword_AA348 offeredCount];
}

id _TIMockingTransientLexiconManagerAcceptedCount()
{
  return _[(id)qword_AA348 acceptedCount];
}

uint64_t sub_28F2C()
{
  uint64_t v3 = 0LL;
  if (!qword_AA360)
  {
    __int128 v4 = off_89268;
    uint64_t v5 = 0LL;
    qword_AA360 = _sl_dlopen(&v4, &v3);
  }

  uint64_t v0 = qword_AA360;
  double v1 = v3;
  if (!qword_AA360)
  {
    double v1 = (char *)abort_report_np("%s", v3);
    goto LABEL_7;
  }

  if (v3) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t sub_28FDC(uint64_t a1)
{
  id v2 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_29014(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = a2;
    do
    {
      uint64_t v3 = (void *)*v2;
      sub_29178((uint64_t)(v2 + 6));
      KB::String::~String((KB::String *)(v2 + 2));
      operator delete(v2);
      id v2 = v3;
    }

    while (v3);
  }

void *sub_29064(void *a1, void *a2, unsigned int a3)
{
  if (a2[1]) {
    uint64_t v5 = (KB::String *)a2[1];
  }
  else {
    uint64_t v5 = (KB::String *)(a2 + 2);
  }
  unsigned int v6 = KB::String::hash(v5, (const char *)*(unsigned __int16 *)a2, a3);
  unint64_t v7 = a1[1];
  if (!v7) {
    return 0LL;
  }
  uint64_t v8 = v6;
  uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
  v9.i16[0] = vaddlv_u8(v9);
  unint64_t v10 = v9.u32[0];
  if (v9.u32[0] > 1uLL)
  {
    unint64_t v11 = v6;
    if (v7 <= v6) {
      unint64_t v11 = v6 % v7;
    }
  }

  else
  {
    unint64_t v11 = ((_DWORD)v7 - 1) & v6;
  }

  id v12 = *(void **)(*a1 + 8 * v11);
  if (!v12) {
    return 0LL;
  }
  uint64_t v13 = (void *)*v12;
  if (*v12)
  {
    do
    {
      unint64_t v14 = v13[1];
      if (v14 == v8)
      {
        if (v13 + 2 == a2 || (KB::String::equal((KB::String *)(v13 + 2), (const KB::String *)a2, 1) & 1) != 0) {
          return v13;
        }
      }

      else
      {
        if (v10 > 1)
        {
          if (v14 >= v7) {
            v14 %= v7;
          }
        }

        else
        {
          v14 &= v7 - 1;
        }

        if (v14 != v11) {
          return 0LL;
        }
      }

      uint64_t v13 = (void *)*v13;
    }

    while (v13);
  }

  return v13;
}

uint64_t sub_29178(uint64_t a1)
{
  id v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      unint64_t v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }

  return a1;
}

void *sub_291D0(uint64_t a1, void *a2, __n128 *a3)
{
  if (a2[1]) {
    unint64_t v7 = (KB::String *)a2[1];
  }
  else {
    unint64_t v7 = (KB::String *)(a2 + 2);
  }
  unsigned int v8 = KB::String::hash(v7, (const char *)*(unsigned __int16 *)a2, a3);
  unint64_t v9 = v8;
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    unint64_t v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v3 = v8;
      if (v10 <= v8) {
        unint64_t v3 = v8 % v10;
      }
    }

    else
    {
      unint64_t v3 = ((_DWORD)v10 - 1) & v8;
    }

    uint64_t v13 = *(void **)(*(void *)a1 + 8 * v3);
    if (v13)
    {
      unint64_t v14 = (void *)*v13;
      if (*v13)
      {
        do
        {
          unint64_t v15 = v14[1];
          if (v15 == v9)
          {
            if (v14 + 2 == a2 || (KB::String::equal((KB::String *)(v14 + 2), (const KB::String *)a2, 1) & 1) != 0) {
              return v14;
            }
          }

          else
          {
            if (v12 > 1)
            {
              if (v15 >= v10) {
                v15 %= v10;
              }
            }

            else
            {
              v15 &= v10 - 1;
            }

            if (v15 != v3) {
              break;
            }
          }

          unint64_t v14 = (void *)*v14;
        }

        while (v14);
      }
    }
  }

  sub_29458(a1, v9, a3, (uint64_t)&v25);
  float v16 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    BOOL v18 = 1LL;
    if (v10 >= 3) {
      BOOL v18 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v19 = v18 | (2 * v10);
    unint64_t v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20) {
      size_t v21 = v20;
    }
    else {
      size_t v21 = v19;
    }
    sub_294F8(a1, v21);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v10 <= v9) {
        unint64_t v3 = v9 % v10;
      }
      else {
        unint64_t v3 = v9;
      }
    }

    else
    {
      unint64_t v3 = ((_DWORD)v10 - 1) & v9;
    }
  }

  CGRect v22 = *(void **)(*(void *)a1 + 8 * v3);
  if (v22)
  {
    *CGRect v25 = *v22;
    void *v22 = v25;
  }

  else
  {
    *CGRect v25 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v25;
    *(void *)(*(void *)a1 + 8 * v3) = a1 + 16;
    if (*v25)
    {
      unint64_t v23 = *(void *)(*v25 + 8LL);
      if ((v10 & (v10 - 1)) != 0)
      {
        if (v23 >= v10) {
          v23 %= v10;
        }
      }

      else
      {
        v23 &= v10 - 1;
      }

      *(void *)(*(void *)a1 + 8 * v23) = v25;
    }
  }

  unint64_t v14 = v25;
  ++*(void *)(a1 + 24);
  return v14;
}

void sub_29434( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char *__p, uint64_t a11)
{
  if (__p) {
    sub_2972C((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

__n128 sub_29458@<Q0>(uint64_t a1@<X0>, unint64_t a2@<X1>, __n128 *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unsigned int v8 = (__n128 *)operator new(0x40uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + _Block_object_dispose(va, 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  v8->n128_u64[0] = 0LL;
  v8->n128_u64[1] = a2;
  KB::String::String((KB::String *)&v8[1], (const KB::String *)a3);
  __n128 result = a3[2];
  v8[3] = result;
  a3[2].n128_u64[0] = 0LL;
  a3[2].n128_u64[1] = 0LL;
  *(_BYTE *)(a4 + 16) = 1;
  return result;
}

void sub_294D0(_Unwind_Exception *a1)
{
  *double v1 = 0LL;
  sub_2972C(v3, v2);
  _Unwind_Resume(a1);
}

void sub_294EC()
{
}

void sub_294F8(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2LL;
  }

  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }

  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }

    else
    {
      uint64_t v7 = 1LL << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }

    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4) {
LABEL_16:
    }
      sub_295D4(a1, prime);
  }

void sub_295D4(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_294EC();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0LL;
    *(void *)(a1 + _Block_object_dispose(va, 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0LL;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }

      else
      {
        v8 &= a2 - 1;
      }

      *(void *)(*(void *)a1 + 8 * v_Block_object_dispose(va, 8) = a1 + 16;
      uint8x8_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }

          else
          {
            v12 &= a2 - 1;
          }

          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }

            *uint64_t v7 = *v11;
            void *v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            uint8x8_t v11 = v7;
          }

          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          uint8x8_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }

        while (v11);
      }
    }
  }

  else
  {
    unint64_t v10 = *(void **)a1;
    *(void *)a1 = 0LL;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + _Block_object_dispose(va, 8) = 0LL;
  }

void sub_2972C(uint64_t a1, char *__p)
{
  if (*(_BYTE *)(a1 + 8))
  {
    sub_29178((uint64_t)(__p + 48));
    KB::String::~String((KB::String *)(__p + 16));
  }

  if (__p) {
    operator delete(__p);
  }
}

void *sub_29778(uint64_t a1, void *a2, __n128 *a3)
{
  if (a2[1]) {
    uint64_t v7 = (KB::String *)a2[1];
  }
  else {
    uint64_t v7 = (KB::String *)(a2 + 2);
  }
  unsigned int v8 = KB::String::hash(v7, (const char *)*(unsigned __int16 *)a2, a3);
  unint64_t v9 = v8;
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    unint64_t v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v3 = v8;
      if (v10 <= v8) {
        unint64_t v3 = v8 % v10;
      }
    }

    else
    {
      unint64_t v3 = ((_DWORD)v10 - 1) & v8;
    }

    uint64_t v13 = *(void **)(*(void *)a1 + 8 * v3);
    if (v13)
    {
      unint64_t v14 = (void *)*v13;
      if (*v13)
      {
        do
        {
          unint64_t v15 = v14[1];
          if (v15 == v9)
          {
            if (v14 + 2 == a2 || (KB::String::equal((KB::String *)(v14 + 2), (const KB::String *)a2, 1) & 1) != 0) {
              return v14;
            }
          }

          else
          {
            if (v12 > 1)
            {
              if (v15 >= v10) {
                v15 %= v10;
              }
            }

            else
            {
              v15 &= v10 - 1;
            }

            if (v15 != v3) {
              break;
            }
          }

          unint64_t v14 = (void *)*v14;
        }

        while (v14);
      }
    }
  }

  sub_29A00(a1, v9, a3, (uint64_t)&v25);
  float v16 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    BOOL v18 = 1LL;
    if (v10 >= 3) {
      BOOL v18 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v19 = v18 | (2 * v10);
    unint64_t v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20) {
      size_t v21 = v20;
    }
    else {
      size_t v21 = v19;
    }
    sub_294F8(a1, v21);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v10 <= v9) {
        unint64_t v3 = v9 % v10;
      }
      else {
        unint64_t v3 = v9;
      }
    }

    else
    {
      unint64_t v3 = ((_DWORD)v10 - 1) & v9;
    }
  }

  CGRect v22 = *(void **)(*(void *)a1 + 8 * v3);
  if (v22)
  {
    *CGRect v25 = *v22;
    void *v22 = v25;
  }

  else
  {
    *CGRect v25 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v25;
    *(void *)(*(void *)a1 + 8 * v3) = a1 + 16;
    if (*v25)
    {
      unint64_t v23 = *(void *)(*v25 + 8LL);
      if ((v10 & (v10 - 1)) != 0)
      {
        if (v23 >= v10) {
          v23 %= v10;
        }
      }

      else
      {
        v23 &= v10 - 1;
      }

      *(void *)(*(void *)a1 + 8 * v23) = v25;
    }
  }

  unint64_t v14 = v25;
  ++*(void *)(a1 + 24);
  return v14;
}

void sub_299DC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char *__p, uint64_t a11)
{
  if (__p) {
    sub_2972C((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

__n128 sub_29A00@<Q0>(uint64_t a1@<X0>, unint64_t a2@<X1>, __n128 *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unsigned int v8 = (__n128 *)operator new(0x40uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + _Block_object_dispose(va, 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  v8->n128_u64[0] = 0LL;
  v8->n128_u64[1] = a2;
  KB::String::String((KB::String *)&v8[1], (const KB::String *)a3);
  __n128 result = a3[2];
  v8[3] = result;
  a3[2].n128_u64[0] = 0LL;
  a3[2].n128_u64[1] = 0LL;
  *(_BYTE *)(a4 + 16) = 1;
  return result;
}

void sub_29A78(_Unwind_Exception *a1)
{
  *double v1 = 0LL;
  sub_2972C(v3, v2);
  _Unwind_Resume(a1);
}

void sub_2A000( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t sub_2A018(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_2A028(uint64_t a1)
{
}

void sub_2A030(uint64_t a1, uint64_t a2, __int16 a3, double a4, double a5, double a6, double a7)
{
  if (a2)
  {
    id v14 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2));
    uint64_t v13 = -[TTKSimpleKey initWithString:frame:keyCode:]( objc_alloc(&OBJC_CLASS___TTKSimpleKey),  "initWithString:frame:keyCode:",  v14,  a3,  a4,  a5,  a6,  a7);
    if (v13) {
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v13];
    }
  }

id _TIGetMockLanguageLikelihoodModel()
{
  return +[_TILanguageLikelihoodModel sharedLanguageLikelihoodModel]( &OBJC_CLASS____TILanguageLikelihoodModel,  "sharedLanguageLikelihoodModel");
}

void _TIBeginMockingLanguageLikelihoodModel()
{
  uint64_t v0 = objc_alloc_init(&OBJC_CLASS___TILanguageLikelihoodModelStub);
  _TIBeginMockingLanguageLikelihoodModelWithModel(v0);
}

void _TIBeginMockingLanguageLikelihoodModelWithModel(void *a1)
{
  id v1 = a1;
  if ((objc_opt_respondsToSelector(&OBJC_CLASS____TILanguageLikelihoodModel, "setSharedLanguageLikelihoodModel:") & 1) != 0) {
    +[_TILanguageLikelihoodModel performSelector:withObject:]( &OBJC_CLASS____TILanguageLikelihoodModel,  "performSelector:withObject:",  "setSharedLanguageLikelihoodModel:",  v1);
  }
}

uint64_t _TIEndMockingLanguageLikelihoodModel()
{
  uint64_t result = objc_opt_respondsToSelector(&OBJC_CLASS____TILanguageLikelihoodModel, "setSharedLanguageLikelihoodModel:");
  if ((result & 1) != 0) {
    return (uint64_t)+[_TILanguageLikelihoodModel performSelector:withObject:]( &OBJC_CLASS____TILanguageLikelihoodModel,  "performSelector:withObject:",  "setSharedLanguageLikelihoodModel:",  0LL);
  }
  return result;
}

void sub_2B4A0(_Unwind_Exception *a1)
{
}

uint64_t sub_2B4B8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_2B4C8(uint64_t a1)
{
}

void sub_2B4D0(uint64_t a1, void *a2)
{
}

void _TIBeginMockingProactiveQuickTypeManager()
{
  uint64_t v0 = objc_alloc_init(&OBJC_CLASS___TIProactiveQuickTypeManagerMock);
  if ((objc_opt_respondsToSelector(&OBJC_CLASS___TIProactiveQuickTypeManager, "setSharedTIProactiveQuickTypeManager:") & 1) != 0) {
    +[TIProactiveQuickTypeManager performSelector:withObject:]( &OBJC_CLASS___TIProactiveQuickTypeManager,  "performSelector:withObject:",  "setSharedTIProactiveQuickTypeManager:",  v0);
  }
}

uint64_t _TIEndMockingProactiveQuickTypeManager()
{
  uint64_t result = objc_opt_respondsToSelector( &OBJC_CLASS___TIProactiveQuickTypeManager,  "setSharedTIProactiveQuickTypeManager:");
  if ((result & 1) != 0) {
    return (uint64_t)+[TIProactiveQuickTypeManager performSelector:withObject:]( &OBJC_CLASS___TIProactiveQuickTypeManager,  "performSelector:withObject:",  "setSharedTIProactiveQuickTypeManager:",  0LL);
  }
  return result;
}

uint64_t sub_2B834(uint64_t a1)
{
  return a1;
}

uint64_t sub_2B864()
{
  return 0LL;
}

id sub_2B86C()
{
  uint64_t v0 = TINgramModelPathForInputMode();
  return (id)objc_claimAutoreleasedReturnValue(v0);
}

uint64_t sub_2B884()
{
  return unigramsFilePathForInputMode(@"en_US");
}

void sub_2B890()
{
  id v0 = (id)qword_AA398;
  if (v0) {
    [v0 invalidate];
  }
}

void sub_2B8D0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

NSXPCConnection *sub_2B8E4()
{
  if (qword_AA398)
  {
    id v0 = (NSXPCConnection *)(id)qword_AA398;
  }

  else
  {
    id v0 = -[NSXPCConnection initWithServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithServiceName:",  @"com.apple.TextInput.TextInputTestService");
    uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___TextInputTestServiceProtocol));
    -[NSXPCConnection setRemoteObjectInterface:](v0, "setRemoteObjectInterface:", v1);

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3321888768LL;
    v7[2] = sub_2E410;
    v7[3] = &unk_893C8;
    id v2 = objc_retainBlock(v7);
    -[NSXPCConnection setInvalidationHandler:](v0, "setInvalidationHandler:", v2);

    -[NSXPCConnection resume](v0, "resume");
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3321888768LL;
    v6[2] = sub_2BA5C;
    v6[3] = &unk_892A8;
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( v0,  "synchronousRemoteObjectProxyWithErrorHandler:",  v6));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3321888768LL;
    v5[2] = nullsub_6;
    v5[3] = &unk_892D8;
    [v3 ackWithReply:v5];
    objc_storeStrong((id *)&qword_AA398, v0);
  }

  return v0;
}

void sub_2BA30(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_2BA5C(uint64_t a1, void *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([a2 description]);
  NSLog(@"Could not message test service: %@", v2);

  __break(1u);
}

void sub_2BAA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2BAD0(KB::StaticDictionary *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = *a2;
  sub_2E4C0((uint64_t)v5, (uint64_t)a1);
  KB::StaticDictionary::load(v4, v5);
  KB::String::~String((KB::String *)&v9);
  KB::String::~String((KB::String *)&v8);
  KB::String::~String((KB::String *)&v7);
  KB::String::~String((KB::String *)&v6);
  KB::String::~String((KB::String *)v5);
}

void sub_2BB7C(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void sub_2BBA4(uint64_t a1)
{
}

void sub_2BBE4(KB::DynamicDictionary *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = *a2;
  sub_2E4C0((uint64_t)v9, (uint64_t)a1);
  unint64_t v5 = (char *)operator new(0xB0uLL);
  uint64_t v6 = v5 + 176;
  v7[0] = v5;
  v7[2] = v5 + 176;
  sub_2E4C0((uint64_t)v5, (uint64_t)v9);
  v7[1] = v6;
  (*(void (**)(uint64_t, void *, void))(*(void *)v4 + 40LL))(v4, v7, 0LL);
  uint64_t v8 = (void **)v7;
  sub_2E588(&v8);
  KB::String::~String((KB::String *)&v13);
  KB::String::~String((KB::String *)&v12);
  KB::String::~String((KB::String *)&v11);
  KB::String::~String((KB::String *)&v10);
  KB::String::~String((KB::String *)v9);
}

void sub_2BCE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  uint64_t v8 = va_arg(va1, void **);
  sub_2E588((void ***)va);
  sub_2BBA4((uint64_t)va1);
  uint64_t v7 = *v5;
  *unint64_t v5 = 0LL;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8LL))(v7);
  }
  _Unwind_Resume(a1);
}

void sub_2BD34(void *a1, void *a2)
{
  uint64_t v3 = a1;
  id v5 = a2;
  if (v5)
  {
    uint64_t v6 = UIKeyboardDynamicDictionaryFile(v3, v5);
    uint64_t v7 = (KB *)objc_claimAutoreleasedReturnValue(v6);
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  KB::utf8_string(v11, v3, v4);
  KB::utf8_string(v10, v7, v8);
  KB::MutableLexiconWrapper::create((KB::MutableLexiconWrapper *)v11, (const KB::String *)v10, v9);
  KB::String::~String((KB::String *)v10);
  KB::String::~String((KB::String *)v11);
}

void sub_2BE04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2BE4C(void *a1@<X0>, void *a2@<X1>, void *a3@<X2>, void ***a4@<X8>, float a5@<S0>)
{
  uint64_t v9 = a1;
  uint64_t v10 = a2;
  id v11 = a3;
  if (v11)
  {
    uint64_t v12 = UIKeyboardDynamicDictionaryFile(v9, v11);
    uint64_t v13 = (NSString *)objc_claimAutoreleasedReturnValue(v12);
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  __getLexiconInfo(v28, v9, v13, 1.0 - a5);
  if (v11)
  {
    uint64_t v14 = UIKeyboardDynamicDictionaryFile(v10, v11);
    unint64_t v15 = (NSString *)objc_claimAutoreleasedReturnValue(v14);
  }

  else
  {
    unint64_t v15 = 0LL;
  }

  __getLexiconInfo(v23, v10, v15, a5);
  sub_2E4C0((uint64_t)v21, (uint64_t)v28);
  sub_2E4C0((uint64_t)&v22, (uint64_t)v23);
  unint64_t v19 = 0LL;
  float v16 = (char *)operator new(0x160uLL);
  uint64_t v17 = 0LL;
  BOOL v18 = v16;
  unint64_t v20 = v16 + 352;
  do
  {
    sub_2E4C0((uint64_t)&v16[v17 * 8], (uint64_t)&v21[v17]);
    v17 += 22LL;
  }

  while (v17 != 44);
  unint64_t v19 = v16 + 352;
  do
  {
    KB::String::~String((KB::String *)&v21[v17 - 6]);
    KB::String::~String((KB::String *)&v21[v17 - 10]);
    KB::String::~String((KB::String *)&v21[v17 - 14]);
    KB::String::~String((KB::String *)&v21[v17 - 18]);
    KB::String::~String((KB::String *)&v21[v17 - 22]);
    v17 -= 22LL;
  }

  while (v17 * 8);
  KB::DictionaryContainer::create_multilexicon(v21, &v18, 1LL, 1LL);
  *a4 = v21[0];
  v21[0] = (void **)&v18;
  sub_2E588(v21);
  KB::String::~String((KB::String *)&v27);
  KB::String::~String((KB::String *)&v26);
  KB::String::~String((KB::String *)&v25);
  KB::String::~String((KB::String *)&v24);
  KB::String::~String((KB::String *)v23);

  KB::String::~String((KB::String *)&v32);
  KB::String::~String((KB::String *)&v31);
  KB::String::~String((KB::String *)&v30);
  KB::String::~String((KB::String *)&v29);
  KB::String::~String((KB::String *)v28);
}

void sub_2C08C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2C138(void *a1@<X0>, void *a2@<X1>, int a3@<W2>, void *a4@<X8>)
{
  id v7 = a1;
  id v8 = a2;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale localeWithLocaleIdentifier:](&OBJC_CLASS___NSLocale, "localeWithLocaleIdentifier:", v7));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[TIInputMode inputModeWithIdentifier:](&OBJC_CLASS___TIInputMode, "inputModeWithIdentifier:", v7));
  v36 = v9;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v36, 1LL));
  BYTE4(v19) = [v10 doesSupportInlineCompletion];
  LODWORD(v19) = 90;
  BYTE4(v1_Block_object_dispose((const void *)(v1 - 136), 8) = 0;
  LODWORD(v1_Block_object_dispose((const void *)(v1 - 136), 8) = a3 ^ 1;
  KB::LanguageModelConfig::LanguageModelConfig(&cf, v9, 0LL, v11, 0LL, v8, 0LL, 0LL, 0LL, v18, 0x100000000LL, v19);
  uint64_t v12 = operator new(0x120uLL);
  CFTypeRef v13 = cf;
  CFTypeRef v20 = cf;
  if (cf)
  {
    CFRetain(cf);
    CFTypeRef v20 = v13;
  }

  CFTypeRef v14 = v29;
  CFTypeRef v21 = v29;
  if (v29)
  {
    CFRetain(v29);
    CFTypeRef v21 = v14;
  }

  CFTypeRef v15 = v30;
  CFTypeRef v22 = v30;
  if (v30)
  {
    CFRetain(v30);
    CFTypeRef v22 = v15;
  }

  __int128 v16 = *(_OWORD *)v31;
  *(_OWORD *)uint64_t v31 = 0u;
  *(_OWORD *)unint64_t v23 = v16;
  __int128 v17 = v32;
  __int128 v32 = 0u;
  *(_OWORD *)uint64_t v24 = v17;
  __int128 v25 = v33;
  __int128 v26 = v34;
  int v27 = v35;
  KB::LanguageModelImplStub::LanguageModelImplStub(v12, &v20);
  sub_2F5E0(a4, (uint64_t)v12);
  if (v24[1]) {
    CFRelease(v24[1]);
  }
  v24[1] = 0LL;
  if (v24[0]) {
    CFRelease(v24[0]);
  }
  v24[0] = 0LL;
  if (v23[1]) {
    CFRelease(v23[1]);
  }
  v23[1] = 0LL;
  if (v23[0]) {
    CFRelease(v23[0]);
  }
  v23[0] = 0LL;
  if (v22) {
    CFRelease(v22);
  }
  CFTypeRef v22 = 0LL;
  if (v21) {
    CFRelease(v21);
  }
  CFTypeRef v21 = 0LL;
  if (v20) {
    CFRelease(v20);
  }
  CFTypeRef v20 = 0LL;
  (*(void (**)(void, uint64_t))(*(void *)*a4 + 72LL))(*a4, 1LL);
  if (*((void *)&v32 + 1)) {
    CFRelease(*((CFTypeRef *)&v32 + 1));
  }
  *((void *)&v32 + 1) = 0LL;
  if ((void)v32) {
    CFRelease((CFTypeRef)v32);
  }
  *(void *)&__int128 v32 = 0LL;
  if (v31[1]) {
    CFRelease(v31[1]);
  }
  v31[1] = 0LL;
  if (v31[0]) {
    CFRelease(v31[0]);
  }
  v31[0] = 0LL;
  if (v30) {
    CFRelease(v30);
  }
  CFTypeRef v30 = 0LL;
  if (v29) {
    CFRelease(v29);
  }
  CFTypeRef v29 = 0LL;
  if (cf) {
    CFRelease(cf);
  }
}

void sub_2C408( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, CFTypeRef a13, CFTypeRef cf, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25)
{
  if (cf) {
    CFRelease(cf);
  }
  if (a13) {
    CFRelease(a13);
  }
  operator delete(v30);
  sub_2E5F8((uint64_t)&a25);

  _Unwind_Resume(a1);
}

void sub_2C4C8(NSString *a1@<X0>, void *a2@<X1>, void *a3@<X2>, _OWORD *a4@<X8>, float a5@<S0>)
{
  uint64_t v9 = a2;
  uint64_t v10 = a3;
  __createAndLoadLanguageModel(&v54, a1, v10, 1);
  __createAndLoadLanguageModel(&v52, v9, v10, 1);
  uint64_t v47 = v54;
  v48 = v55;
  if (v55)
  {
    p_shared_owners = (unint64_t *)&v55->__shared_owners_;
    do
      unint64_t v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
  }

  KB::LanguageModelLexiconGroup::LanguageModelLexiconGroup(&v49, &v47);
  CFTypeRef v13 = v48;
  if (v48)
  {
    CFTypeRef v14 = (unint64_t *)&v48->__shared_owners_;
    do
      unint64_t v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }

  uint64_t v42 = v52;
  __int128 v43 = v53;
  if (v53)
  {
    __int128 v16 = (unint64_t *)&v53->__shared_owners_;
    do
      unint64_t v17 = __ldxr(v16);
    while (__stxr(v17 + 1, v16));
  }

  KB::LanguageModelLexiconGroup::LanguageModelLexiconGroup(&v44, &v42);
  uint64_t v18 = v43;
  if (v43)
  {
    uint64_t v19 = (unint64_t *)&v43->__shared_owners_;
    do
      unint64_t v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }

  (*(void (**)(void **__return_ptr))(*(void *)v54 + 48LL))(__p);
  KB::LanguageModelLexiconGroup::set_lexicon_weight((KB::LanguageModelLexiconGroup *)&v49, *(_DWORD *)__p[0], 1.0 - a5);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  (*(void (**)(void **__return_ptr))(*(void *)v52 + 48LL))(__p);
  KB::LanguageModelLexiconGroup::set_lexicon_weight((KB::LanguageModelLexiconGroup *)&v44, *(_DWORD *)__p[0], a5);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  __p[0] = v49;
  __p[1] = v50;
  if (v50)
  {
    CFTypeRef v21 = (unint64_t *)&v50->__shared_owners_;
    do
      unint64_t v22 = __ldxr(v21);
    while (__stxr(v22 + 1, v21));
  }

  sub_2E688((uint64_t)v57, (uint64_t)v51);
  v57[5] = v44;
  v57[6] = v45;
  if (v45)
  {
    unint64_t v23 = (unint64_t *)&v45->__shared_owners_;
    do
      unint64_t v24 = __ldxr(v23);
    while (__stxr(v24 + 1, v23));
  }

  sub_2E688((uint64_t)&v58, (uint64_t)v46);
  __int128 v40 = 0LL;
  __int128 v25 = (char *)operator new(0x70uLL);
  uint64_t v26 = 0LL;
  v39 = v25;
  __int128 v41 = v25 + 112;
  do
  {
    sub_2E960(&v25[v26 * 8], &__p[v26]);
    v26 += 7LL;
  }

  while (v26 != 14);
  __int128 v40 = v25 + 112;
  do
  {
    sub_2E918((uint64_t)&v51[v26 * 8 + 32]);
    sub_29178((uint64_t)&v51[v26 * 8 + 16]);
    v26 -= 7LL;
  }

  while (v26 * 8);
  sub_2C9D4((uint64_t)&v39, (uint64_t *)__p);
  *a4 = *(_OWORD *)__p;
  __p[0] = &v39;
  sub_2EB20((void ***)__p);
  sub_2E918((uint64_t)v46);
  int v27 = v45;
  if (v45)
  {
    v28 = (unint64_t *)&v45->__shared_owners_;
    do
      unint64_t v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }

  sub_2E918((uint64_t)v51);
  CFTypeRef v30 = v50;
  if (v50)
  {
    uint64_t v31 = (unint64_t *)&v50->__shared_owners_;
    do
      unint64_t v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }

  __int128 v33 = v53;
  if (v53)
  {
    __int128 v34 = (unint64_t *)&v53->__shared_owners_;
    do
      unint64_t v35 = __ldaxr(v34);
    while (__stlxr(v35 - 1, v34));
    if (!v35)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }

  v36 = v55;
  if (v55)
  {
    v37 = (unint64_t *)&v55->__shared_owners_;
    do
      unint64_t v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }
}

void sub_2C8C0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, char a22, uint64_t a23, char a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31, uint64_t a32, char a33, uint64_t a34, void *__p, uint64_t a36)
{
  _Unwind_Resume(a1);
}

uint64_t *sub_2C9D4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = operator new(0x58uLL);
  KB::LanguageModelContainer::LanguageModelContainer(v4, a1);
  return sub_2E9C0(a2, (uint64_t)v4);
}

void sub_2CA18(_Unwind_Exception *a1)
{
}

void sub_2CA2C(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  id v8 = operator new(8uLL);
  void *v8 = 0x100000000LL;
  sub_2EBB8(__p, "");
  v13[0] = operator new(0x18uLL);
  CFTypeRef v14 = (char *)v13[0] + 24;
  v13[1] = sub_2EC64((int)&v14, (__int128 *)__p, &v18, (char *)v13[0]);
  KB::LanguageModelContext::LanguageModelContext(a4, v8, 1LL);
  unint64_t v15 = v13;
  sub_2ED5C(&v15);
  if (v17 < 0) {
    operator delete(__p[0]);
  }
  operator delete(v8);
  uint64_t v9 = *a1;
  uint64_t v10 = a1[1];
  if (*a1 != v10)
  {
    do
    {
      uint64_t v11 = KB::LanguageModel::id_for_static_word(*a2, v9, a3, a4, 0LL);
      if (*(_WORD *)v9)
      {
        if (*(void *)(v9 + 8)) {
          unint64_t v12 = *(char **)(v9 + 8);
        }
        else {
          unint64_t v12 = (char *)(v9 + 16);
        }
      }

      else
      {
        unint64_t v12 = "";
      }

      sub_2EBB8(v13, v12);
      KB::LanguageModelContext::append(a4, v11, v13, 0LL);
      if (SHIBYTE(v14) < 0) {
        operator delete(v13[0]);
      }
      v9 += 32LL;
    }

    while (v9 != v10);
  }

void sub_2CBDC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void **a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  a15 = &a9;
  sub_2ED5C(&a15);
  if (a21 < 0) {
    operator delete(__p);
  }
  operator delete(v21);
  _Unwind_Resume(a1);
}

uint64_t sub_2CC58(uint64_t a1)
{
  uint64_t v4 = (void **)(a1 + 80);
  sub_2ED5C(&v4);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)(a1 + 72));
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)(a1 + 64));
  id v2 = *(void **)(a1 + 16);
  if (v2)
  {
    *(void *)(a1 + 24) = v2;
    operator delete(v2);
  }

  return sub_29178(a1);
}

void sub_2CCB4(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
}

void sub_2CCBC(uint64_t a1@<X0>, void *a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v19 = 0LL;
  uint64_t v20 = 0LL;
  uint64_t v21 = 0LL;
  KB::DictionaryContainer::derive_static_words(*a2, &v19, a1);
  sub_2EDE8(a4);
  uint64_t v7 = v19;
  uint64_t v8 = v20;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  unint64_t v15 = sub_2CE58;
  __int128 v16 = &unk_89308;
  uint64_t v17 = a1;
  int v18 = a3;
  uint64_t v9 = v14;
  if (v7 != v8)
  {
    while ((((uint64_t (*)(void *, uint64_t))v15)(v9, v7) & 1) == 0)
    {
      v7 += 240LL;
      if (v7 == v8)
      {
        uint64_t v7 = v8;
        break;
      }
    }
  }

  if (v7 != v20)
  {
    KB::String::operator=(a4, v7);
    KB::ByteString::operator=(a4 + 32, v7 + 32);
    uint64_t v10 = *(void *)(v7 + 48);
    *(_DWORD *)(a4 + 56) = *(_DWORD *)(v7 + 56);
    *(void *)(a4 + 4_Block_object_dispose((const void *)(v1 - 136), 8) = v10;
    KB::String::operator=(a4 + 64, v7 + 64);
    __int128 v11 = *(_OWORD *)(v7 + 96);
    __int128 v12 = *(_OWORD *)(v7 + 112);
    __int128 v13 = *(_OWORD *)(v7 + 144);
    *(_OWORD *)(a4 + 12_Block_object_dispose((const void *)(v1 - 136), 8) = *(_OWORD *)(v7 + 128);
    *(_OWORD *)(a4 + 144) = v13;
    *(_OWORD *)(a4 + 96) = v11;
    *(_OWORD *)(a4 + 112) = v12;
    KB::String::operator=(a4 + 160, v7 + 160);
    *(_BYTE *)(a4 + 192) = *(_BYTE *)(v7 + 192);
    if (v7 != a4)
    {
      *(_DWORD *)(a4 + 232) = *(_DWORD *)(v7 + 232);
      sub_2EEB0((void *)(a4 + 200), *(void **)(v7 + 216), 0LL);
    }
  }

  unint64_t v22 = (void **)&v19;
  sub_2F4D0(&v22);
}

void sub_2CE20( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  *(void *)(v15 - 56) = &a15;
  sub_2F4D0((void ***)(v15 - 56));
  _Unwind_Resume(a1);
}

BOOL sub_2CE58(uint64_t a1, KB::Word *this)
{
  if (KB::String::equal((KB::String *)v7, *(const KB::String **)(a1 + 32), 1))
  {
    int v4 = *(_DWORD *)(a1 + 40);
    if (v4) {
      BOOL v5 = v4 == *((_DWORD *)this + 34);
    }
    else {
      BOOL v5 = 1LL;
    }
  }

  else
  {
    BOOL v5 = 0LL;
  }

  KB::String::~String((KB::String *)v7);
  return v5;
}

void sub_2CEFC(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

id sub_2CF18()
{
  id v0 = sub_2CFD0();
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 UUIDString]);
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v1 stringByAppendingPathComponent:v3]);

  else {
    BOOL v5 = 0LL;
  }
  id v6 = v5;

  return v6;
}

void sub_2CFA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_2CFD0()
{
  if (qword_AA3B8 != -1) {
    dispatch_once(&qword_AA3B8, &stru_89460);
  }
  return (id)qword_AA3B0;
}

id sub_2D010(void *a1)
{
  id v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  NSFileAttributeKey v9 = NSFilePosixPermissions;
  uint64_t v10 = &off_8FF18;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  id v8 = 0LL;
  id v4 = [v2 createDirectoryAtPath:v1 withIntermediateDirectories:1 attributes:v3 error:&v8];
  id v5 = v8;

  if (v5) {
    char v6 = (char)v4;
  }
  else {
    char v6 = 1;
  }
  if ((v6 & 1) == 0) {
    NSLog(@"Failed to create temporary directory: %@", v5);
  }

  return v4;
}

void sub_2D120(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_2D154(void *a1, void *a2)
{
  id v24 = a1;
  id v21 = a2;
  uint64_t v3 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  NSClassFromString(@"TILanguageSpecificTests"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 bundleURL]);

  uint64_t v20 = (void *)v5;
  unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:relativeToURL:](&OBJC_CLASS___NSURL, "URLWithString:relativeToURL:", v21, v5));
  char v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( [v6 contentsOfDirectoryAtURL:v22 includingPropertiesForKeys:0 options:1 error:0]);

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id obj = v7;
  id v8 = 0LL;
  id v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v27;
    LOBYTE(v11) = 1;
    while (1)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(obj);
        }
        __int128 v13 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        CFTypeRef v14 = (void *)objc_claimAutoreleasedReturnValue([v13 lastPathComponent]);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v24 stringByAppendingPathComponent:v14]);

        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v15));
        if ((v11 & 1) != 0)
        {
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          id v25 = v8;
          uint64_t v11 = (uint64_t)[v17 copyItemAtURL:v13 toURL:v16 error:&v25];
          id v18 = v25;

          id v8 = v18;
          if ((v11 & 1) != 0) {
            goto LABEL_12;
          }
        }

        else
        {
          uint64_t v11 = 0LL;
        }

        if (v8) {
          NSLog(@"Problem installing test resources: %@", v8);
        }
LABEL_12:
      }

      id v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (!v9) {
        goto LABEL_16;
      }
    }
  }

  uint64_t v11 = 1LL;
LABEL_16:

  return v11;
}

void sub_2D3D8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15)
{
}

id sub_2D498()
{
  id v0 = sub_2CFD0();
  id v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 stringByAppendingPathComponent:@"PretrainedDynamicModels"]);

  return v2;
}

void sub_2D4D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2D4E8(void *a1)
{
  id v1 = a1;
  if (qword_AA3A8 != -1) {
    dispatch_once(&qword_AA3A8, &stru_89328);
  }
  id v2 = (id)qword_AA3A0;
  objc_sync_enter(v2);
  if (([(id)qword_AA3A0 containsObject:v1] & 1) == 0)
  {
    uint64_t v3 = objc_autoreleasePoolPush();
    v12[0] = @"INPUT_MODE";
    v12[1] = @"USE_AUTOCORRECTION";
    v13[0] = v1;
    v13[1] = &__kCFBooleanFalse;
    v12[2] = @"USE_RETROCORRECTION";
    v12[3] = @"USE_AUTOCAPITALIZATION";
    v13[2] = &__kCFBooleanFalse;
    v13[3] = &__kCFBooleanTrue;
    v12[4] = @"WORD_LEARNING_ENABLED";
    v12[5] = @"KEYBOARD_WIDTH";
    v13[4] = &__kCFBooleanTrue;
    v13[5] = &off_8FF30;
    v13[6] = @"Portrait";
    v12[6] = @"KEYBOARD_ORIENTATION";
    v12[7] = @"CUSTOM_DYNAMIC_RESOURCE_PATH";
    id v4 = sub_2D498();
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v13[7] = v5;
    char v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  8LL));

    uint64_t v7 = -[AutocorrectionTestHarness initWithAttributes:]( objc_alloc(&OBJC_CLASS___AutocorrectionTestHarness),  "initWithAttributes:",  v6);
    uint64_t v8 = objc_claimAutoreleasedReturnValue([&off_90598 objectForKey:v1]);
    id v9 = (void *)v8;
    uint64_t v10 = &__NSArray0__struct;
    if (v8) {
      uint64_t v10 = (void *)v8;
    }
    id v11 = v10;

    LMLanguageModelPerformMaintenance(-[AutocorrectionTestHarness trainWithCorpus:](v7, "trainWithCorpus:", v11));
    objc_autoreleasePoolPop(v3);
    [(id)qword_AA3A0 addObject:v1];
  }

  objc_sync_exit(v2);
}

void sub_2D6E8(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_2D740(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v2 = (void *)qword_AA3A0;
  qword_AA3A0 = v1;
}

uint64_t sub_2D76C(void *a1)
{
  id v1 = a1;
  id v2 = sub_2D498();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v3));

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 contentsOfDirectoryAtURL:v18 includingPropertiesForKeys:0 options:1 error:0]);

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id obj = v5;
  char v6 = 0LL;
  id v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v22;
    LOBYTE(v9) = 1;
    while (1)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 lastPathComponent]);
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v1 stringByAppendingPathComponent:v12]);

        CFTypeRef v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v13));
        if ((v9 & 1) != 0)
        {
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          id v20 = v6;
          uint64_t v9 = (uint64_t)[v15 copyItemAtURL:v11 toURL:v14 error:&v20];
          id v16 = v20;

          char v6 = v16;
          if ((v9 & 1) != 0) {
            goto LABEL_12;
          }
        }

        else
        {
          uint64_t v9 = 0LL;
        }

        if (v6) {
          NSLog(@"Problem installing pretrained dynamic assets: %@", v6);
        }
LABEL_12:
      }

      id v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (!v7) {
        goto LABEL_16;
      }
    }
  }

  uint64_t v9 = 1LL;
LABEL_16:

  return v9;
}

void sub_2D9A8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

id sub_2DA48(void *a1)
{
  id v1 = a1;
  sub_2DA90(v1);
  id v2 = sub_2D010(v1);

  return v2;
}

void sub_2DA80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_2DA90(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v7 = 0LL;
    id v3 = [v2 removeItemAtPath:v1 error:&v7];
    id v4 = v7;

    if (v4) {
      char v5 = (char)v3;
    }
    else {
      char v5 = 1;
    }
    if ((v5 & 1) == 0) {
      NSLog(@"Failed to remove temporary directory: %@", v4);
    }
  }

  else
  {
    id v3 = &dword_0 + 1;
  }

  return v3;
}

void sub_2DB34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2DB5C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 length])
  {
    uint64_t v5 = dynamicFilePathForInputMode(v3, v4);
    char v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned __int8 v8 = [v7 fileExistsAtPath:v6];

    if ((v8 & 1) != 0)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v12 = 0LL;
      unsigned __int8 v10 = [v9 removeItemAtPath:v6 error:&v12];
      id v11 = v12;

      if ((v10 & 1) == 0) {
        NSLog(@"Failed to remove temporary dynamic dictionary: %@", v11);
      }
    }
  }
}

void sub_2DC44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2DC80(void *a1)
{
  id v1 = a1;
  KB::LanguageModel::clear_dynamic_learning_bundles( +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:"),  &stru_89368);
}

void sub_2DCC8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_2DCDC(id a1, BOOL a2)
{
  if (!a2) {
    NSLog(@"Failed to remove temproary dynamic learning bundles!");
  }
}

id sub_2DCFC(void *a1)
{
  id v1 = a1;
  id v2 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  NSClassFromString(@"TILanguageSpecificTests"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleURL]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-corpus.txt", v1));
  char v6 = (void *)objc_claimAutoreleasedReturnValue([@"TestCorpus" stringByAppendingPathComponent:v5]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:relativeToURL:](&OBJC_CLASS___NSURL, "URLWithString:relativeToURL:", v6, v4));

  return v7;
}

void sub_2DDD4(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

id sub_2DE1C(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v3 = [&off_90460 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v13;
LABEL_3:
    uint64_t v5 = 0LL;
    while (1)
    {
      if (*(void *)v13 != v4) {
        objc_enumerationMutation(&off_90460);
      }
      uint64_t v6 = *(void *)(*((void *)&v12 + 1) + 8 * v5);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 URLForResource:v1 withExtension:v6 subdirectory:@"TestPersonas"]);

      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
      unsigned __int8 v10 = -[NSFileManager fileExistsAtPath:](v2, "fileExistsAtPath:", v9);

      if ((v10 & 1) != 0) {
        break;
      }

      if (v3 == (id)++v5)
      {
        id v3 = [&off_90460 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v3) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }

  else
  {
LABEL_9:
    unsigned __int8 v8 = 0LL;
  }

  return v8;
}

void sub_2DF9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_2DFF0(void *a1)
{
  id v1 = a1;
  id v8 = 0LL;
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithContentsOfURL:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfURL:encoding:error:",  v1,  4LL,  &v8));
  id v3 = v8;
  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v1 path]);
    NSLog(@"Problem opening file with URL %@ : %@", v4, v3);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v2 componentsSeparatedByString:@"\n"]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 filterWithBlock:&stru_893A8]);

  return v6;
}

void sub_2E0C0(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

BOOL sub_2E0FC(id a1, NSString *a2)
{
  return !-[NSString isEqualToString:](a2, "isEqualToString:", &stru_89E80);
}

id sub_2E120(void *a1)
{
  id v14 = a1;
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-corpus.txt",  v14));
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v2 bundleURL]);

  id v3 = (void *)objc_claimAutoreleasedReturnValue([@"TestCorpus" stringByAppendingPathComponent:v15]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:relativeToURL:](&OBJC_CLASS___NSURL, "URLWithString:relativeToURL:", v3, v16));

  id v21 = 0LL;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithContentsOfURL:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfURL:encoding:error:",  v4,  4LL,  &v21));
  id v6 = v21;
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
    NSLog(@"Problem opening file with URL %@ : %@", v7, v6);
  }

  if (v5)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue([v5 componentsSeparatedByString:@"\n"]);
    id v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v18;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v8);
          }
          __int128 v12 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        }

        id v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }

      while (v9);
    }
  }

  return v1;
}

void sub_2E36C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_2E410()
{
  if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    id v0 = (void *)qword_AA398;
    qword_AA398 = 0LL;
  }

  else
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3321888768LL;
    v2[2] = sub_2E4AC;
    v2[3] = &unk_893F8;
    id v1 = objc_retainBlock(v2);
    TIDispatchSync(&_dispatch_main_q, v1);
  }

void sub_2E4AC()
{
  id v0 = (void *)qword_AA398;
  qword_AA398 = 0LL;
}

uint64_t sub_2E4C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = KB::String::String((KB::String *)a1, (const KB::String *)a2);
  KB::String::String((KB::String *)(v4 + 32), (const KB::String *)(a2 + 32));
  KB::String::String((KB::String *)(a1 + 64), (const KB::String *)(a2 + 64));
  KB::String::String((KB::String *)(a1 + 96), (const KB::String *)(a2 + 96));
  KB::String::String((KB::String *)(a1 + 128), (const KB::String *)(a2 + 128));
  uint64_t v5 = *(void *)(a2 + 160);
  *(_DWORD *)(a1 + 16_Block_object_dispose((const void *)(v1 - 136), 8) = *(_DWORD *)(a2 + 168);
  *(void *)(a1 + 160) = v5;
  return a1;
}

void sub_2E544(_Unwind_Exception *a1)
{
}

void sub_2E588(void ***a1)
{
  id v1 = *a1;
  id v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    uint64_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 176LL;
        sub_2BBA4(v4);
      }

      while ((void *)v4 != v2);
      uint64_t v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
  }

uint64_t sub_2E5F8(uint64_t a1)
{
  id v2 = *(const void **)(a1 + 48);
  if (v2) {
    CFRelease(v2);
  }
  *(void *)(a1 + 4_Block_object_dispose((const void *)(v1 - 136), 8) = 0LL;
  id v3 = *(const void **)(a1 + 40);
  if (v3) {
    CFRelease(v3);
  }
  *(void *)(a1 + 40) = 0LL;
  uint64_t v4 = *(const void **)(a1 + 32);
  if (v4) {
    CFRelease(v4);
  }
  *(void *)(a1 + 32) = 0LL;
  uint64_t v5 = *(const void **)(a1 + 24);
  if (v5) {
    CFRelease(v5);
  }
  *(void *)(a1 + 24) = 0LL;
  id v6 = *(const void **)(a1 + 16);
  if (v6) {
    CFRelease(v6);
  }
  *(void *)(a1 + 16) = 0LL;
  id v7 = *(const void **)(a1 + 8);
  if (v7) {
    CFRelease(v7);
  }
  *(void *)(a1 + _Block_object_dispose((const void *)(v1 - 136), 8) = 0LL;
  if (*(void *)a1) {
    CFRelease(*(CFTypeRef *)a1);
  }
  *(void *)a1 = 0LL;
  return a1;
}

uint64_t sub_2E688(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  sub_294F8(a1, *(void *)(a2 + 8));
  return a1;
}

void sub_2E6E4(_Unwind_Exception *a1)
{
}

void *sub_2E6FC(uint64_t a1, unsigned int *a2, void *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
    }

    else
    {
      unint64_t v3 = ((_DWORD)v7 - 1) & v6;
    }

    id v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      uint64_t v10 = *v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == v6)
          {
            if (*((_DWORD *)v10 + 4) == (_DWORD)v6) {
              return v10;
            }
          }

          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7) {
                v11 %= v7;
              }
            }

            else
            {
              v11 &= v7 - 1;
            }

            if (v11 != v3) {
              break;
            }
          }

          uint64_t v10 = (void *)*v10;
        }

        while (v10);
      }
    }
  }

  uint64_t v10 = operator new(0x18uLL);
  void *v10 = 0LL;
  v10[1] = v6;
  v10[2] = *a3;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1LL;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    sub_294F8(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }

    else
    {
      unint64_t v3 = ((_DWORD)v7 - 1) & v6;
    }
  }

  uint64_t v18 = *(void *)a1;
  __int128 v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    void *v10 = *v19;
LABEL_38:
    void *v19 = v10;
    goto LABEL_39;
  }

  void *v10 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    unint64_t v20 = *(void *)(*v10 + 8LL);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }

    else
    {
      v20 &= v7 - 1;
    }

    __int128 v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }

LABEL_39:
  ++*(void *)(a1 + 24);
  return v10;
}

void sub_2E904(_Unwind_Exception *a1)
{
}

uint64_t sub_2E918(uint64_t a1)
{
  id v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      unint64_t v3 = (void *)*v2;
      operator delete(v2);
      id v2 = v3;
    }

    while (v3);
  }

  uint64_t v4 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void *sub_2E960(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  if (v3)
  {
    uint64_t v4 = (unint64_t *)(v3 + 8);
    do
      unint64_t v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }

  sub_2E688((uint64_t)(a1 + 2), (uint64_t)(a2 + 2));
  return a1;
}

void sub_2E9AC(_Unwind_Exception *a1)
{
}

uint64_t *sub_2E9C0(uint64_t *a1, uint64_t a2)
{
  *a1 = a2;
  uint64_t v4 = operator new(0x20uLL);
  void *v4 = &off_89438;
  v4[1] = 0LL;
  v4[2] = 0LL;
  v4[3] = a2;
  a1[1] = (uint64_t)v4;
  if (a2) {
    unint64_t v5 = (void *)(a2 + 8);
  }
  else {
    unint64_t v5 = 0LL;
  }
  sub_2EA3C((uint64_t)a1, v5, a2);
  return a1;
}

void sub_2EA1C(_Unwind_Exception *exception_object)
{
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8LL))(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2EA3C(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v4 = (std::__shared_weak_count *)a2[1];
    if (!v4 || v4->__shared_owners_ == -1)
    {
      unint64_t v5 = *(std::__shared_weak_count **)(a1 + 8);
      if (v5)
      {
        p_shared_owners = (unint64_t *)&v5->__shared_owners_;
        do
          unint64_t v7 = __ldxr(p_shared_owners);
        while (__stxr(v7 + 1, p_shared_owners));
        p_shared_weak_owners = (unint64_t *)&v5->__shared_weak_owners_;
        do
          unint64_t v9 = __ldxr(p_shared_weak_owners);
        while (__stxr(v9 + 1, p_shared_weak_owners));
        uint64_t v4 = (std::__shared_weak_count *)a2[1];
      }

      *a2 = a3;
      a2[1] = v5;
      if (v4) {
        std::__shared_weak_count::__release_weak(v4);
      }
      if (v5)
      {
        uint64_t v10 = (unint64_t *)&v5->__shared_owners_;
        do
          unint64_t v11 = __ldaxr(v10);
        while (__stlxr(v11 - 1, v10));
        if (!v11)
        {
          ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
          std::__shared_weak_count::__release_weak(v5);
        }
      }
    }
  }

void sub_2EAF0(std::__shared_weak_count *a1)
{
}

uint64_t sub_2EB04(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 8LL))(result);
  }
  return result;
}

void sub_2EB20(void ***a1)
{
  id v2 = *a1;
  if (*v2)
  {
    sub_2EB60((uint64_t)v2, (uint64_t)*v2);
    operator delete(**a1);
  }

uint64_t sub_2EB60(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  uint64_t v4 = *(void *)(result + 8);
  if (v4 != a2)
  {
    do
    {
      uint64_t v5 = v4 - 56;
      sub_2E918(v4 - 40);
      uint64_t result = sub_29178(v5);
      uint64_t v4 = v5;
    }

    while (v5 != a2);
  }

  *(void *)(v3 + _Block_object_dispose((const void *)(v1 - 136), 8) = a2;
  return result;
}

void *sub_2EBB8(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8LL) {
    abort();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    unint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000LL;
    *a1 = v6;
  }

  else
  {
    *((_BYTE *)a1 + 23) = v4;
    unint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }

  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

char *sub_2EC64(int a1, __int128 *a2, __int128 *a3, char *__dst)
{
  if (a2 != a3)
  {
    unint64_t v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        sub_2ECD4(__dst, *(void **)v6, *((void *)v6 + 1));
      }

      else
      {
        __int128 v7 = *v6;
        *((void *)__dst + 2) = *((void *)v6 + 2);
        *(_OWORD *)__dst = v7;
      }

      unint64_t v6 = (__int128 *)((char *)v6 + 24);
      __dst += 24;
    }

    while (v6 != a3);
  }

  return __dst;
}

void *sub_2ECD4(_BYTE *__dst, void *__src, unint64_t a3)
{
  size_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8LL) {
      abort();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    uint64_t v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000LL;
    *size_t v5 = v8;
    size_t v5 = v8;
  }

  else
  {
    __dst[23] = a3;
  }

  return memmove(v5, __src, a3 + 1);
}

void sub_2ED5C(void ***a1)
{
  id v2 = *a1;
  if (*v2)
  {
    sub_2ED9C((uint64_t *)v2);
    operator delete(**a1);
  }

void sub_2ED9C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24LL)
  {
  }

  a1[1] = v2;
}

uint64_t sub_2EDE8(uint64_t a1)
{
  uint64_t v2 = KB::String::String((KB::String *)a1);
  *(_WORD *)(v2 + 32) = 0;
  *(void *)(v2 + 4_Block_object_dispose((const void *)(v1 - 136), 8) = 0x3F80000000000000LL;
  *(_DWORD *)(v2 + 56) = 1065353216;
  KB::String::String((KB::String *)(v2 + 64));
  __asm { FMOV            V0.2S, #1.0 }

  *(void *)(a1 + 96) = _D0;
  *(_DWORD *)(a1 + 104) = 0;
  *(void *)(a1 + 152) = 0LL;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 12_Block_object_dispose((const void *)(v1 - 136), 8) = 0u;
  *(_DWORD *)(a1 + 144) = 0;
  KB::String::String((KB::String *)(a1 + 160));
  *(_BYTE *)(a1 + 192) = 0;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_DWORD *)(a1 + 232) = 1065353216;
  return a1;
}

void sub_2EE74(_Unwind_Exception *a1)
{
  if (*(unsigned __int16 *)(v1 + 32) >= 0xFu)
  {
    size_t v4 = *(void **)(v1 + 40);
    if (v4) {
      operator delete[](v4);
    }
  }

  KB::String::~String((KB::String *)v1);
  _Unwind_Resume(a1);
}

void sub_2EEB0(void *a1, void *a2, void *a3)
{
  uint64_t v6 = a1[1];
  if (!v6) {
    goto LABEL_9;
  }
  for (uint64_t i = 0LL; i != v6; *(void *)(*a1 + 8 * i++) = 0LL)
    ;
  uint64_t v8 = (void *)a1[2];
  a1[2] = 0LL;
  a1[3] = 0LL;
  if (v8)
  {
    while (a2 != a3)
    {
      unint64_t v9 = a2[2];
      v8[2] = v9;
      uint64_t v10 = (void *)*v8;
      v8[1] = v9;
      unint64_t v11 = sub_2EF84((uint64_t)a1, v9, v8 + 2);
      sub_2F0D8(a1, v8, v11);
      a2 = (void *)*a2;
      uint64_t v8 = v10;
      if (!v10) {
        goto LABEL_9;
      }
    }

    do
    {
      float v12 = (void *)*v8;
      operator delete(v8);
      uint64_t v8 = v12;
    }

    while (v12);
  }

  else
  {
LABEL_9:
    while (a2 != a3)
    {
      sub_2F40C(a1, a2 + 2);
      a2 = (void *)*a2;
    }
  }

void *sub_2EF84(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v6 = *(void *)(a1 + 8);
  float v7 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v8 = *(float *)(a1 + 32);
  if (!v6 || (float)(v8 * (float)v6) < v7)
  {
    uint64_t v9 = 2 * v6;
    BOOL v10 = v6 < 3 || (v6 & (v6 - 1)) != 0;
    size_t v11 = v10 | v9;
    unint64_t v12 = vcvtps_u32_f32(v7 / v8);
    if (v11 <= v12) {
      size_t v13 = v12;
    }
    else {
      size_t v13 = v11;
    }
    sub_2F1C0(a1, v13);
    unint64_t v6 = *(void *)(a1 + 8);
  }

  uint8x8_t v14 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v14.i16[0] = vaddlv_u8(v14);
  if (v14.u32[0] > 1uLL)
  {
    unint64_t v15 = a2;
    if (v6 <= a2) {
      unint64_t v15 = a2 % v6;
    }
  }

  else
  {
    unint64_t v15 = (v6 - 1) & a2;
  }

  unint64_t v16 = *(void **)(*(void *)a1 + 8 * v15);
  if (!v16) {
    return 0LL;
  }
  int v17 = 0;
  do
  {
    uint64_t result = v16;
    unint64_t v16 = (void *)*v16;
    if (!v16) {
      break;
    }
    unint64_t v19 = v16[1];
    if (v14.u32[0] > 1uLL)
    {
      unint64_t v20 = v16[1];
      if (v19 >= v6) {
        unint64_t v20 = v19 % v6;
      }
    }

    else
    {
      unint64_t v20 = v19 & (v6 - 1);
    }

    if (v20 != v15) {
      break;
    }
    BOOL v21 = v19 == a2 && v16[2] == *a3;
    int v22 = v17 & !v21;
    v17 |= v21;
  }

  while (v22 != 1);
  return result;
}

void *sub_2F0D8(void *result, void *a2, void *a3)
{
  int8x8_t v3 = (int8x8_t)result[1];
  unint64_t v4 = a2[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(void *)&v3) {
      v4 %= *(void *)&v3;
    }
  }

  else
  {
    v4 &= *(void *)&v3 - 1LL;
  }

  if (!a3)
  {
    *a2 = result[2];
    result[2] = a2;
    *(void *)(*result + 8 * v4) = result + 2;
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v6 = *(void *)(*a2 + 8LL);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v3) {
        v6 %= *(void *)&v3;
      }
    }

    else
    {
      v6 &= *(void *)&v3 - 1LL;
    }

LABEL_18:
    *(void *)(*result + 8 * v6) = a2;
    goto LABEL_19;
  }

  *a2 = *a3;
  *a3 = a2;
  if (*a2)
  {
    unint64_t v6 = *(void *)(*a2 + 8LL);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v3) {
        v6 %= *(void *)&v3;
      }
    }

    else
    {
      v6 &= *(void *)&v3 - 1LL;
    }

    if (v6 != v4) {
      goto LABEL_18;
    }
  }

void sub_2F1C0(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2LL;
  }

  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }

  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }

    else
    {
      uint64_t v7 = 1LL << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }

    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4) {
LABEL_16:
    }
      sub_2F29C(a1, prime);
  }

void sub_2F29C(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_294EC();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0LL;
    *(void *)(a1 + _Block_object_dispose((const void *)(v1 - 136), 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0LL;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }

      else
      {
        v8 &= a2 - 1;
      }

      *(void *)(*(void *)a1 + 8 * v_Block_object_dispose((const void *)(v1 - 136), 8) = a1 + 16;
      for (uint64_t i = (void *)*v7; *v7; uint64_t i = (void *)*v7)
      {
        unint64_t v12 = i[1];
        if (v9.u32[0] > 1uLL)
        {
          if (v12 >= a2) {
            v12 %= a2;
          }
        }

        else
        {
          v12 &= a2 - 1;
        }

        if (v12 == v8)
        {
          uint64_t v7 = i;
        }

        else
        {
          size_t v13 = i;
          if (*(void *)(*(void *)a1 + 8 * v12))
          {
            do
            {
              uint8x8_t v14 = v13;
              size_t v13 = (void *)*v13;
            }

            while (v13 && i[2] == v13[2]);
            *uint64_t v7 = v13;
            void *v14 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = i;
          }

          else
          {
            *(void *)(*(void *)a1 + 8 * v12) = v7;
            uint64_t v7 = i;
            unint64_t v8 = v12;
          }
        }
      }
    }
  }

  else
  {
    BOOL v10 = *(void **)a1;
    *(void *)a1 = 0LL;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + _Block_object_dispose((const void *)(v1 - 136), 8) = 0LL;
  }

void *sub_2F40C(void *a1, unint64_t *a2)
{
  int8x8_t v4 = operator new(0x18uLL);
  unint64_t v5 = *a2;
  v4[2] = *a2;
  void *v4 = 0LL;
  v4[1] = v5;
  uint64_t v6 = sub_2EF84((uint64_t)a1, v5, v4 + 2);
  sub_2F0D8(a1, v4, v6);
  return v4;
}

void sub_2F46C(_Unwind_Exception *a1)
{
}

void sub_2F480(uint64_t a1)
{
  if (*(unsigned __int16 *)(a1 + 32) >= 0xFu)
  {
    uint64_t v2 = *(void **)(a1 + 40);
    if (v2) {
      operator delete[](v2);
    }
  }

  KB::String::~String((KB::String *)a1);
}

void sub_2F4D0(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    int8x8_t v4 = v1[1];
    unint64_t v5 = v2;
    if (v4 != v2)
    {
      do
        sub_2F480((uint64_t)v4 - 240);
      while (v4 != v2);
      unint64_t v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
  }

void sub_2F540(id a1)
{
  uint64_t v1 = NSTemporaryDirectory();
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:@"TextInputTests"]);
  int8x8_t v4 = (void *)qword_AA3B0;
  qword_AA3B0 = v3;

  else {
    unint64_t v5 = 0LL;
  }
  objc_storeStrong((id *)&qword_AA3B0, v5);
}

void sub_2F5A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2F5B4(KB::StaticDictionary **a1, KB::StaticDictionary *a2)
{
  uint64_t v3 = *a1;
  *a1 = a2;
  if (v3)
  {
    KB::StaticDictionary::~StaticDictionary(v3);
    operator delete(v4);
  }

void *sub_2F5E0(void *a1, uint64_t a2)
{
  *a1 = a2;
  int8x8_t v4 = operator new(0x20uLL);
  void *v4 = &off_89490;
  v4[1] = 0LL;
  v4[2] = 0LL;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_2F624(_Unwind_Exception *exception_object)
{
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8LL))(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2F648(std::__shared_weak_count *a1)
{
}

uint64_t sub_2F65C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 8LL))(result);
  }
  return result;
}

void sub_2F678()
{
  id v0 = objc_autoreleasePoolPush();
  __cxa_atexit((void (*)(void *))sub_2B834, &unk_A9B80, &dword_0);
  objc_autoreleasePoolPop(v0);
}

id sub_2FDA4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) hasPrefix:a2];
}

BOOL sub_3069C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = objc_msgSend( v6,  "compare:options:range:locale:",  v5,  129,  0,  objc_msgSend(v6, "length"),  *(void *)(a1 + 32));

  return v7 == 0LL;
}

LABEL_68:
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[TIReporter localeIdentifierForLanguage](self, "localeIdentifierForLanguage"));
    if ([v76 isEqualToString:@"ko_KR"])
    {
      v77 = (void *)objc_claimAutoreleasedReturnValue([v234 intended]);
      v78 = (id)objc_claimAutoreleasedReturnValue([v77 componentsJoinedByString:&stru_89E80]);
      v79 = (id)objc_claimAutoreleasedReturnValue( +[TITesterUtils decomposeHangulSequence:]( &OBJC_CLASS___TITesterUtils,  "decomposeHangulSequence:",  v78));
    }

    else
    {
      v77 = (void *)objc_claimAutoreleasedReturnValue([v234 intended]);
      v78 = (id)objc_claimAutoreleasedReturnValue([v77 componentsJoinedByString:&stru_89E80]);
      v79 = v78;
    }

    v214 = [v79 length];
    v80 = (void *)objc_claimAutoreleasedReturnValue([v79 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"]);

    if (v236)
    {
      v81 = v80;
      v82 = v234;
      v83 = (void *)objc_claimAutoreleasedReturnValue([v234 intendedTransliteration]);
      v223 = v81;
      v224 = (void *)objc_claimAutoreleasedReturnValue([v83 componentsJoinedByString:&stru_89E80]);
    }

    else
    {
      v223 = &stru_89E80;
      v224 = v80;
      v82 = v234;
    }

    v84 = (void *)objc_claimAutoreleasedReturnValue([v82 input]);
    v85 = (void *)objc_claimAutoreleasedReturnValue([v84 componentsJoinedByString:&stru_89E80]);

    v222 = (void *)objc_claimAutoreleasedReturnValue([v85 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"]);
    v259 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
    v295 = 0u;
    v296 = 0u;
    v297 = 0u;
    v298 = 0u;
    v273 = (id)objc_claimAutoreleasedReturnValue([v82 touched]);
    v86 = [v273 countByEnumeratingWithState:&v295 objects:v319 count:16];
    if (v86)
    {
      v87 = v86;
      v88 = 0LL;
      v89 = *(void *)v296;
      do
      {
        for (j = 0LL; j != v87; j = (char *)j + 1)
        {
          if (*(void *)v296 != v89) {
            objc_enumerationMutation(v273);
          }
          v91 = *(void **)(*((void *)&v295 + 1) + 8LL * (void)j);
          v92 = (void *)objc_claimAutoreleasedReturnValue([v91 componentsJoinedByString:&stru_89E80]);
          [v259 appendString:v92];

          v293 = 0u;
          v294 = 0u;
          v291 = 0u;
          v292 = 0u;
          v93 = v91;
          v94 = [v93 countByEnumeratingWithState:&v291 objects:v318 count:16];
          if (v94)
          {
            v95 = v94;
            v96 = *(void *)v292;
            do
            {
              for (k = 0LL; k != v95; k = (char *)k + 1)
              {
                if (*(void *)v292 != v96) {
                  objc_enumerationMutation(v93);
                }
                v98 = [*(id *)(*((void *)&v291 + 1) + 8 * (void)k) isEqualToString:@"<Delete>"];
                v88 += v98;
                v31 += v98;
              }

              v95 = [v93 countByEnumeratingWithState:&v291 objects:v318 count:16];
            }

            while (v95);
          }
        }

        v87 = [v273 countByEnumeratingWithState:&v295 objects:v319 count:16];
      }

      while (v87);
    }

    else
    {
      v88 = 0LL;
    }

    v221 = (void *)objc_claimAutoreleasedReturnValue([v259 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"]);
    v274 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
    v99 = v234;
    v100 = (void *)objc_claimAutoreleasedReturnValue([v234 touchEvents]);
    v101 = [v100 count];

    if (v101)
    {
      v102 = 0LL;
      do
      {
        v103 = (void *)objc_claimAutoreleasedReturnValue([v99 touchEvents]);
        v104 = (void *)objc_claimAutoreleasedReturnValue([v103 objectAtIndexedSubscript:v102]);

        v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v102));
        v106 = (void *)objc_claimAutoreleasedReturnValue([v99 pathsForWords]);
        v107 = (void *)objc_claimAutoreleasedReturnValue([v106 objectForKey:v105]);

        v237 = v104;
        if (v107)
        {
          v108 = (void *)objc_claimAutoreleasedReturnValue([v99 pathsForWords]);
          v109 = (id)objc_claimAutoreleasedReturnValue([v108 objectForKeyedSubscript:v105]);

          v110 = (void *)objc_claimAutoreleasedReturnValue([v109 toJsonDictionary]);
          [v274 appendFormat:@"<CP; %@ >", v110];
        }

        else
        {
          v289 = 0u;
          v290 = 0u;
          v287 = 0u;
          v288 = 0u;
          v109 = v104;
          v111 = [v109 countByEnumeratingWithState:&v287 objects:v317 count:16];
          if (v111)
          {
            v112 = v111;
            v113 = *(void *)v288;
            do
            {
              for (m = 0LL; m != v112; m = (char *)m + 1)
              {
                if (*(void *)v288 != v113) {
                  objc_enumerationMutation(v109);
                }
                [v274 appendString:v115];
              }

              v112 = [v109 countByEnumeratingWithState:&v287 objects:v317 count:16];
            }

            while (v112);
            v99 = v234;
          }
        }

        ++v102;
        v116 = (void *)objc_claimAutoreleasedReturnValue([v99 touchEvents]);
        v117 = [v116 count];
      }

      while ((unint64_t)v117 > v102);
    }

    v118 = (void *)objc_claimAutoreleasedReturnValue(+[NSString string](&OBJC_CLASS___NSString, "string"));
    v283 = 0u;
    v284 = 0u;
    v285 = 0u;
    v286 = 0u;
    v119 = (void *)objc_claimAutoreleasedReturnValue([v99 inserted]);
    v120 = [v119 countByEnumeratingWithState:&v283 objects:v316 count:16];
    if (v120)
    {
      v121 = v120;
      v122 = *(void *)v284;
      do
      {
        v123 = 0LL;
        v124 = v118;
        do
        {
          if (*(void *)v284 != v122) {
            objc_enumerationMutation(v119);
          }
          v125 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v283 + 1) + 8 * (void)v123) componentsJoinedByString:&stru_89E80]);
          v118 = (void *)objc_claimAutoreleasedReturnValue([v124 stringByAppendingString:v125]);

          v123 = (char *)v123 + 1;
          v124 = v118;
        }

        while (v121 != v123);
        v121 = [v119 countByEnumeratingWithState:&v283 objects:v316 count:16];
      }

      while (v121);
    }

    v126 = (void *)objc_claimAutoreleasedReturnValue([v118 stringByReplacingOccurrencesOfString:@"\\b" withString:@"\b"]);
    v127 = (void *)objc_claimAutoreleasedReturnValue([v126 stringByReplacingOccurrencesOfString:@"\\B" withString:@"\b"]);
    v128 = [v127 length];

    v238 = (void *)objc_claimAutoreleasedReturnValue([v118 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"]);
    v129 = (void *)objc_claimAutoreleasedReturnValue([v234 corrected]);
    v130 = (void *)objc_claimAutoreleasedReturnValue([v129 componentsJoinedByString:&stru_89E80]);

    v220 = (void *)objc_claimAutoreleasedReturnValue([v130 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"]);
    v131 = TIPlistFormattedAlignedTypingSequence(v251, v202 > 0, v199, v201 > 0);
    v132 = (void *)objc_claimAutoreleasedReturnValue(v131);
    v279 = 0u;
    v280 = 0u;
    v281 = 0u;
    v282 = 0u;
    v252 = v132;
    v133 = [v252 countByEnumeratingWithState:&v279 objects:v315 count:16];
    v212 = v128;
    if (v133)
    {
      v134 = v133;
      v135 = 0LL;
      v136 = 0LL;
      v137 = 0LL;
      v138 = *(void *)v280;
      do
      {
        for (n = 0LL; n != v134; n = (char *)n + 1)
        {
          if (*(void *)v280 != v138) {
            objc_enumerationMutation(v252);
          }
          v140 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v279 + 1) + 8 * (void)n) objectForKeyedSubscript:@"autocorrectionType"]);
          v135 += TIAutoCorrectionTypeCorrectedIsNotIntended(v140);
          v136 += TIAutoCorrectionTypeCorrectedIsNotIntendedAndInserted(v140);
          v137 += TIAutoCorrectionTypeCorrectedIsNotInserted(v140);
          -[NSCountedSet addObject:](v256, "addObject:", v140);
        }

        v134 = [v252 countByEnumeratingWithState:&v279 objects:v315 count:16];
      }

      while (v134);
    }

    else
    {
      v135 = 0LL;
      v136 = 0LL;
      v137 = 0LL;
    }

    v313[0] = @"Seed";
    v211 = (void *)objc_claimAutoreleasedReturnValue([v234 seed]);
    v314[0] = v211;
    v313[1] = @"CorpusId";
    v141 = objc_claimAutoreleasedReturnValue([v234 corpusId]);
    v210 = (void *)v141;
    if (v141) {
      v142 = (const __CFString *)v141;
    }
    else {
      v142 = &stru_89E80;
    }
    v314[1] = v142;
    v313[2] = @"Metadata";
    v143 = objc_claimAutoreleasedReturnValue([v234 sourceMetadata]);
    v209 = (void *)v143;
    v144 = &__NSDictionary0__struct;
    if (v143) {
      v144 = (void *)v143;
    }
    v314[2] = v144;
    v314[3] = v224;
    v313[3] = @"Intended";
    v313[4] = @"Input";
    v314[4] = v222;
    v314[5] = v221;
    v313[5] = @"Touched";
    v313[6] = @"TouchPoints";
    v314[6] = v274;
    v314[7] = v238;
    v313[7] = @"Inserted";
    v313[8] = @"Corrected";
    v314[8] = v220;
    v314[9] = v223;
    v313[9] = @"IntendedTransliteration";
    v313[10] = @"WordCount";
    v208 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v263));
    v314[10] = v208;
    v313[11] = @"WordErrorCount";
    v264 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v263 - v244));
    v314[11] = v264;
    v313[12] = @"SeparatorCount";
    v245 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v268));
    v314[12] = v245;
    v313[13] = @"SeparatorErrorCount";
    v269 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v268 - v248));
    v314[13] = v269;
    v313[14] = @"KeystrokeCount";
    v249 = (void *)objc_claimAutoreleasedReturnValue([v234 numberOfTouches]);
    v314[14] = v249;
    v313[15] = @"CharacterCount";
    v215 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v214));
    v314[15] = v215;
    v313[16] = @"DeleteCount";
    v207 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v88));
    v314[16] = v207;
    v313[17] = @"InsertedCharacterCount";
    v213 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v212));
    v314[17] = v213;
    v314[18] = v252;
    v313[18] = @"Alignment";
    v313[19] = @"incorrectCount";
    v206 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v135));
    v314[19] = v206;
    v313[20] = @"badAutocorrectionCount";
    v145 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v136));
    v314[20] = v145;
    v313[21] = @"autocorrectionCount";
    v146 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v137));
    v314[21] = v146;
    v147 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v314,  v313,  22LL));
    v148 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v147));

    v149 = (void *)objc_claimAutoreleasedReturnValue([v234 debugData]);
    if (v149)
    {
      v150 = (void *)objc_claimAutoreleasedReturnValue([v234 debugData]);
      [v148 setObject:v150 forKey:@"DebugData"];
    }

    if (v200)
    {
      v151 = (void *)objc_claimAutoreleasedReturnValue([v234 aggdStatistics]);

      if (v151)
      {
        v152 = (void *)objc_claimAutoreleasedReturnValue([v234 aggdStatistics]);
        [v148 setObject:v152 forKey:@"AggdStatistics"];
      }
    }

    v153 = (void *)objc_claimAutoreleasedReturnValue([v234 typologyLogURL]);

    if (v153)
    {
      v154 = (void *)objc_claimAutoreleasedReturnValue([v234 typologyLogURL]);
      v155 = (void *)objc_claimAutoreleasedReturnValue([v154 path]);
      [v148 setObject:v155 forKey:@"typologyLogPath"];
    }

    v156 = (void *)objc_claimAutoreleasedReturnValue([v234 typologyTraceLogURL]);

    if (v156)
    {
      v157 = (void *)objc_claimAutoreleasedReturnValue([v234 typologyTraceLogURL]);
      v158 = (void *)objc_claimAutoreleasedReturnValue([v157 path]);
      [v148 setObject:v158 forKey:@"typologyTraceLogPath"];
    }

    v217 += v135;
    v218 += v136;
    v219 += v137;
    [v203 addObject:v148];

    v62 = v232;
    v61 = v233;
    v63 = v216;
LABEL_134:
    v233 = &v61[(void)v227];
    v230 += (uint64_t)v226;
    v231 += (uint64_t)v225;

    objc_autoreleasePoolPop(context);
    unint64_t v32 = v229;
    CFTypeRef v30 = v204;
  }

  while (v229 != v204);
  fputc(10, __stderrp);
  v159 = 1.0;
  CFTypeRef v30 = (char *)v266;
  if (v230 > v266)
  {
    v159 = 0.0;
    if (v230 > v231) {
      v159 = (float)(v230 - v231) / (float)(v230 - v266);
    }
  }

  v160 = (float)v261;
  if (v261 < 1) {
    v161 = 0.0;
  }
  else {
    v161 = (float)v242 / v160;
  }
  if (v266 >= 1) {
    v166 = (float)v247 / (float)v266;
  }
  else {
    v166 = 1.0;
  }
  if (v230 < 1)
  {
    v168 = 0.0;
    v167 = 0.0;
    if (v261 >= 1) {
      goto LABEL_149;
    }
  }

  else
  {
    v168 = (float)v31 / (float)v230;
    if (v261 <= 0)
    {
      v167 = 0.0;
      goto LABEL_150;
    }

LABEL_149:
    v167 = (float)v217 / v160;
  }

LABEL_150:
  if (v219 >= 1) {
    v169 = (float)v218 / (float)v219;
  }
  else {
    v169 = 0.0;
  }
  v165 = v261;
  v162 = v231;
  v163 = v230;
  v164 = v233;
LABEL_154:
  v170 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v276[0] = _NSConcreteStackBlock;
  v276[1] = 3221225472LL;
  v276[2] = sub_326E4;
  v276[3] = &unk_896F8;
  v277 = v256;
  v275 = v277;
  v171 = v170;
  v278 = v171;
  v239 = v171;
  -[NSCountedSet enumerateObjectsUsingBlock:](v277, "enumerateObjectsUsingBlock:", v276);
  v311[0] = @"Language";
  v172 = objc_claimAutoreleasedReturnValue(-[TIReporter language](self, "language"));
  v270 = (void *)v172;
  if (v172) {
    v173 = (const __CFString *)v172;
  }
  else {
    v173 = &stru_89E80;
  }
  v312[0] = v173;
  v311[1] = @"TextCorpus";
  v174 = objc_claimAutoreleasedReturnValue(-[TIReporter textCorpus](self, "textCorpus"));
  v267 = (void *)v174;
  if (v174) {
    v175 = (const __CFString *)v174;
  }
  else {
    v175 = &stru_89E80;
  }
  v312[1] = v175;
  v311[2] = @"BuildVersion";
  v176 = objc_claimAutoreleasedReturnValue(-[TIReporter buildVersion](self, "buildVersion"));
  v265 = (void *)v176;
  if (v176) {
    v177 = (const __CFString *)v176;
  }
  else {
    v177 = &stru_89E80;
  }
  v312[2] = v177;
  v311[3] = @"Options";
  v178 = objc_claimAutoreleasedReturnValue(-[TIReporter options](self, "options"));
  v262 = (void *)v178;
  v179 = &__NSDictionary0__struct;
  if (v178) {
    v179 = (void *)v178;
  }
  v312[3] = v179;
  v311[4] = @"KeystrokeCount";
  v260 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v164));
  v312[4] = v260;
  v311[5] = @"CharacterCount";
  v257 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v163));
  v312[5] = v257;
  v311[6] = @"DeleteCount";
  obja = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v31));
  v312[6] = obja;
  v311[7] = @"DeleteRatio";
  *(float *)&v180 = v168;
  v253 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v180));
  v312[7] = v253;
  v311[8] = @"InsertedCharacterCount";
  v250 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v162));
  v312[8] = v250;
  v312[9] = v203;
  v311[9] = @"Results";
  v311[10] = @"KeystrokeSavingsRatio";
  *(float *)&v181 = v159;
  v246 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v181));
  v312[10] = v246;
  v311[11] = @"WordCount";
  v241 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v165));
  v312[11] = v241;
  v311[12] = @"WordErrorCount";
  v243 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v165 - v242));
  v312[12] = v243;
  v311[13] = @"WordAccuracy";
  *(float *)&v182 = v161;
  v235 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v182));
  v312[13] = v235;
  v311[14] = @"SeparatorCount";
  v183 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v30));
  v312[14] = v183;
  v311[15] = @"SeparatorErrorCount";
  v184 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", &v30[-v247]));
  v312[15] = v184;
  v311[16] = @"SeparatorAccuracy";
  *(float *)&v185 = v166;
  v186 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v185));
  v312[16] = v186;
  v312[17] = @"1.14";
  v311[17] = @"ActVersion";
  v311[18] = @"TotalRevisionCount";
  v187 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v217));
  v312[18] = v187;
  v311[19] = @"TotalRevisionRate";
  *(float *)&v188 = v167;
  v189 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v188));
  v312[19] = v189;
  v311[20] = @"TotalBadAutocorrectionCount";
  v190 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v218));
  v312[20] = v190;
  v312[21] = v171;
  v311[21] = @"AutocorrectionTypeCounts";
  v311[22] = @"TotalAutocorrectionCount";
  v191 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v219));
  v312[22] = v191;
  v311[23] = @"AutoCorrectionRevisionRate";
  *(float *)&v192 = v169;
  v193 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v192));
  v312[23] = v193;
  v194 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v312,  v311,  24LL));
  [v197 addEntriesFromDictionary:v194];

  v195 = v197;
  return v195;
}

void sub_326E4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 countForObject:v4]));
  [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v4];
}

void _TIBeginMockingUserModelDataStore()
{
  id v0 = objc_alloc_init(&OBJC_CLASS___TIUserModelDataStoreMock);
  if ((objc_opt_respondsToSelector(&OBJC_CLASS___TIUserModelDataStore, "setSharedTIUserModelDataStore:") & 1) != 0) {
    +[TIUserModelDataStore performSelector:withObject:]( &OBJC_CLASS___TIUserModelDataStore,  "performSelector:withObject:",  "setSharedTIUserModelDataStore:",  v0);
  }
}

uint64_t _TIEndMockingUserModelDataStore()
{
  uint64_t result = objc_opt_respondsToSelector(&OBJC_CLASS___TIUserModelDataStore, "setSharedUserModelDataStore:");
  if ((result & 1) != 0) {
    return (uint64_t)+[TIUserModelDataStore performSelector:withObject:]( &OBJC_CLASS___TIUserModelDataStore,  "performSelector:withObject:",  "setSharedUserModelDataStore:",  0LL);
  }
  return result;
}

void _TIMockingUserModelDataStoreClear()
{
  id v0 = (id)objc_claimAutoreleasedReturnValue( +[TIUserModelDataStore sharedUserModelDataStore]( &OBJC_CLASS___TIUserModelDataStore,  "sharedUserModelDataStore"));
  if ((objc_opt_respondsToSelector(v0, "clear") & 1) != 0) {
    [v0 performSelector:"clear" withObject:0];
  }
}

void sub_330DC(_Unwind_Exception *a1)
{
}

void sub_332B8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_334A8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_3375C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_33A20( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_33BE0(_Unwind_Exception *a1)
{
}

void sub_33D9C(_Unwind_Exception *a1)
{
}

void sub_33EAC(_Unwind_Exception *a1)
{
}

void sub_34000(_Unwind_Exception *a1)
{
}

void sub_34194(_Unwind_Exception *a1)
{
}

void sub_34438( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_3473C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void _TIBeginMockingTrialManager()
{
  id v0 = objc_alloc_init(&OBJC_CLASS___MockTITrialManager);
  +[TITrialManagerProxy setSharedManager:](&OBJC_CLASS___TITrialManagerProxy, "setSharedManager:", v0);
}

id _TIEndMockingTrialManager()
{
  return +[TITrialManagerProxy setSharedManager:](&OBJC_CLASS___TITrialManagerProxy, "setSharedManager:", 0LL);
}

LABEL_20:
  return v9;
}

void sub_38078(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_3815C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  _Unwind_Resume(a1);
}

void sub_38184(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    if (([v3 isEqualToString:@"und"] & 1) == 0)
    {
      sub_2EBB8(__p, (char *)[v4 UTF8String]);
      id v5 = (uint64_t **)(*(void *)(a1 + 32) + 8LL);
      uint8x8_t v9 = __p;
      id v6 = sub_3A7E0(v5, __p, (uint64_t)&unk_82284, (__int128 **)&v9);
      ++v6[7];
      ++*(void *)(*(void *)(a1 + 32) + 32LL);
      if (v8 < 0) {
        operator delete(__p[0]);
      }
    }
  }
}

void sub_38240( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_38328( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  _Unwind_Resume(a1);
}

void sub_38350(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    if (([v3 isEqualToString:@"und"] & 1) == 0)
    {
      sub_2EBB8(__p, (char *)[v4 UTF8String]);
      id v5 = (uint64_t **)(*(void *)(a1 + 32) + 8LL);
      uint8x8_t v9 = __p;
      id v6 = sub_3A7E0(v5, __p, (uint64_t)&unk_82284, (__int128 **)&v9);
      ++v6[7];
      ++*(void *)(*(void *)(a1 + 32) + 32LL);
      if (v8 < 0) {
        operator delete(__p[0]);
      }
    }
  }
}

void sub_3840C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_38660( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, id a19)
{
  *(void *)(v21 - 72) = &a15;
  sub_2ED5C((void ***)(v21 - 72));

  _Unwind_Resume(a1);
}

BOOL sub_386BC(uint64_t a1, __int128 *a2, __int128 *a3)
{
  id v5 = (uint64_t **)(*(void *)(a1 + 32) + 8LL);
  uint8x8_t v9 = a2;
  uint64_t v6 = sub_3A7E0(v5, (void **)a2, (uint64_t)&unk_82284, &v9)[7];
  id v7 = (uint64_t **)(*(void *)(a1 + 32) + 8LL);
  uint8x8_t v9 = a3;
  return v6 > sub_3A7E0(v7, (void **)a3, (uint64_t)&unk_82284, &v9)[7];
}

void sub_388FC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void sub_38A44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_38B30(_Unwind_Exception *a1)
{
  uint64_t v6 = v5;

  _Unwind_Resume(a1);
}

void sub_38C80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_38E2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_38F88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

char *sub_39008(char **a1, __int128 *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v4 = v3 + 1;
  if (v3 + 1 > 0xAAAAAAAAAAAAAAALL) {
    abort();
  }
  char v8 = a1[2];
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * ((v8 - v2) >> 3);
  if (2 * v9 > v4) {
    unint64_t v4 = 2 * v9;
  }
  if (v9 >= 0x555555555555555LL) {
    unint64_t v10 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v10 = v4;
  }
  uint64_t v25 = v7;
  if (v10) {
    size_t v11 = (char *)sub_39170(v7, v10);
  }
  else {
    size_t v11 = 0LL;
  }
  unint64_t v12 = &v11[24 * v3];
  int v22 = v11;
  v23.i64[0] = (uint64_t)v12;
  v23.i64[1] = (uint64_t)v12;
  __int128 v24 = &v11[24 * v10];
  if (*((char *)a2 + 23) < 0)
  {
    sub_2ECD4(v12, *(void **)a2, *((void *)a2 + 1));
    uint8x8_t v14 = (char *)v23.i64[1];
    unint64_t v12 = (char *)v23.i64[0];
  }

  else
  {
    __int128 v13 = *a2;
    *((void *)v12 + 2) = *((void *)a2 + 2);
    *(_OWORD *)unint64_t v12 = v13;
    uint8x8_t v14 = &v11[24 * v3];
  }

  unint64_t v16 = *a1;
  unint64_t v15 = (unint64_t)a1[1];
  if ((char *)v15 == *a1)
  {
    int64x2_t v18 = vdupq_n_s64(v15);
  }

  else
  {
    do
    {
      __int128 v17 = *(_OWORD *)(v15 - 24);
      *((void *)v12 - 1) = *(void *)(v15 - 8);
      *(_OWORD *)(v12 - 24) = v17;
      v12 -= 24;
      *(void *)(v15 - 16) = 0LL;
      *(void *)(v15 - _Block_object_dispose((const void *)(v1 - 136), 8) = 0LL;
      *(void *)(v15 - 24) = 0LL;
      v15 -= 24LL;
    }

    while ((char *)v15 != v16);
    int64x2_t v18 = *(int64x2_t *)a1;
  }

  unint64_t v19 = v14 + 24;
  *a1 = v12;
  a1[1] = v14 + 24;
  int64x2_t v23 = v18;
  unint64_t v20 = a1[2];
  a1[2] = v24;
  __int128 v24 = v20;
  int v22 = (char *)v18.i64[0];
  sub_391B4((uint64_t)&v22);
  return v19;
}

void sub_3915C(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void *sub_39170(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_294EC();
  }
  return operator new(24 * a2);
}

uint64_t sub_391B4(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_391E8(uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      id v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        id v5 = *(void ***)(a1 + 16);
      }

      uint64_t v2 = v5;
    }

    while (v5 != a2);
  }

void sub_3923C(uint64_t a1, __int128 *a2, uint64_t a3, uint64_t a4, char a5, __n128 a6)
{
LABEL_1:
  unint64_t v10 = (__int128 *)((char *)a2 - 24);
  size_t v11 = (__int128 *)a1;
LABEL_2:
  uint64_t v12 = 1 - a4;
  while (2)
  {
    a1 = (uint64_t)v11;
    uint64_t v13 = v12;
    uint64_t v14 = (char *)a2 - (char *)v11;
    unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)v11) >> 3);
    switch(v15)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        if ((*(unsigned int (**)(void))(*(void *)a3 + 16LL))())
        {
          uint64_t v30 = *((void *)v11 + 2);
          __int128 v28 = *v11;
          __int128 v26 = *v10;
          *((void *)v11 + 2) = *((void *)a2 - 1);
          __int128 *v11 = v26;
          __int128 *v10 = v28;
          *((void *)a2 - 1) = v30;
        }

        return;
      case 3uLL:
        sub_39858(v11, (__int128 *)((char *)v11 + 24), (__int128 *)((char *)a2 - 24), a3);
        return;
      case 4uLL:
        sub_39FB0((uint64_t)v11, (uint64_t)v11 + 24, (uint64_t)(v11 + 3), (uint64_t)a2 - 24, a3);
        return;
      case 5uLL:
        sub_3A0A4((__n128 *)v11, (uint64_t)v11 + 24, (uint64_t)(v11 + 3), (uint64_t)v11 + 72, (uint64_t)a2 - 24, a3);
        return;
      default:
        if (v14 <= 575)
        {
          if ((a5 & 1) != 0) {
            sub_395E8((uint64_t)v11, a2, a3);
          }
          else {
            sub_39730(v11, a2, a3);
          }
          return;
        }

        if (v13 != 1)
        {
          unint64_t v16 = v15 >> 1;
          __int128 v17 = (__int128 *)((char *)v11 + 24 * (v15 >> 1));
          if ((unint64_t)v14 < 0xC01)
          {
            sub_39858((__int128 *)((char *)v11 + 24 * v16), v11, (__int128 *)((char *)a2 - 24), a3);
            if ((a5 & 1) != 0) {
              goto LABEL_11;
            }
          }

          else
          {
            sub_39858(v11, (__int128 *)((char *)v11 + 24 * v16), (__int128 *)((char *)a2 - 24), a3);
            uint64_t v18 = 3 * v16;
            unint64_t v19 = (__int128 *)((char *)v11 + 24 * v16 - 24);
            sub_39858((__int128 *)((char *)v11 + 24), v19, a2 - 3, a3);
            unint64_t v20 = v11 + 3;
            uint64_t v21 = (__int128 *)((char *)v11 + 8 * v18 + 24);
            sub_39858(v20, v21, (__int128 *)((char *)a2 - 72), a3);
            sub_39858(v19, v17, v21, a3);
            uint64_t v29 = *(void *)(a1 + 16);
            __int128 v27 = *(_OWORD *)a1;
            __int128 v22 = *v17;
            *(void *)(a1 + 16) = *((void *)v17 + 2);
            *(_OWORD *)a1 = v22;
            *((void *)v17 + 2) = v29;
            __int128 *v17 = v27;
            if ((a5 & 1) != 0) {
              goto LABEL_11;
            }
          }

          if (((*(uint64_t (**)(void))(*(void *)a3 + 16LL))() & 1) == 0)
          {
            size_t v11 = sub_399B0((__int128 *)a1, a2, a3);
            goto LABEL_16;
          }

void sub_395E8(uint64_t a1, __int128 *a2, uint64_t a3)
{
  if ((__int128 *)a1 != a2)
  {
    uint64_t v5 = a1 + 24;
    if ((__int128 *)(a1 + 24) != a2)
    {
      uint64_t v7 = 0LL;
      do
      {
        char v8 = (__int128 *)v5;
        if ((*(unsigned int (**)(void))(*(void *)a3 + 16LL))())
        {
          __int128 v14 = *v8;
          uint64_t v15 = *((void *)v8 + 2);
          *((void *)v8 + 1) = 0LL;
          *((void *)v8 + 2) = 0LL;
          *(void *)char v8 = 0LL;
          uint64_t v9 = v7;
          do
          {
            uint64_t v10 = a1 + v9;
            size_t v11 = (void **)(a1 + v9 + 24);
            *(_OWORD *)size_t v11 = *(_OWORD *)v10;
            *(void *)(a1 + v9 + 40) = *(void *)(v10 + 16);
            *(_BYTE *)(v10 + 23) = 0;
            *(_BYTE *)uint64_t v10 = 0;
            if (!v9)
            {
              uint64_t v13 = a1;
              goto LABEL_13;
            }

            v9 -= 24LL;
          }

          while (((*(uint64_t (**)(void))(*(void *)a3 + 16LL))() & 1) != 0);
          int v12 = *(char *)(a1 + v9 + 47);
          uint64_t v13 = a1 + v9 + 24;
          if (v12 < 0) {
            operator delete(*(void **)v13);
          }
LABEL_13:
          *(_OWORD *)uint64_t v13 = v14;
          *(void *)(v13 + 16) = v15;
        }

        uint64_t v5 = (uint64_t)v8 + 24;
        v7 += 24LL;
      }

      while ((__int128 *)((char *)v8 + 24) != a2);
    }
  }

void sub_39714( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_39730(__int128 *a1, __int128 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    unint64_t v4 = (__int128 *)((char *)a1 + 24);
    if ((__int128 *)((char *)a1 + 24) != a2)
    {
      uint64_t v6 = (uint64_t)a1 - 24;
      do
      {
        uint64_t v7 = v4;
        if ((*(unsigned int (**)(void))(*(void *)a3 + 16LL))())
        {
          __int128 v12 = *v7;
          uint64_t v13 = *((void *)v7 + 2);
          *((void *)v7 + 1) = 0LL;
          *((void *)v7 + 2) = 0LL;
          *(void *)uint64_t v7 = 0LL;
          uint64_t v8 = v6;
          do
          {
            uint64_t v9 = (void **)(v8 + 48);
            *(_OWORD *)uint64_t v9 = *(_OWORD *)(v8 + 24);
            *(void *)(v8 + 64) = *(void *)(v8 + 40);
            *(_BYTE *)(v8 + 47) = 0;
            *(_BYTE *)(v8 + 24) = 0;
            v8 -= 24LL;
          }

          while (((*(uint64_t (**)(void))(*(void *)a3 + 16LL))() & 1) != 0);
          int v10 = *(char *)(v8 + 71);
          uint64_t v11 = v8 + 48;
          if (v10 < 0) {
            operator delete(*(void **)v11);
          }
          *(_OWORD *)uint64_t v11 = v12;
          *(void *)(v11 + 16) = v13;
        }

        unint64_t v4 = (__int128 *)((char *)v7 + 24);
        v6 += 24LL;
      }

      while ((__int128 *)((char *)v7 + 24) != a2);
    }
  }

void sub_3983C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_39858(__int128 *a1, __int128 *a2, __int128 *a3, uint64_t a4)
{
  char v8 = (*(uint64_t (**)(void))(*(void *)a4 + 16LL))();
  uint64_t result = (*(uint64_t (**)(void))(*(void *)a4 + 16LL))();
  if ((v8 & 1) == 0)
  {
    if (!(_DWORD)result) {
      return result;
    }
    uint64_t v13 = *((void *)a2 + 2);
    __int128 v14 = *a2;
    uint64_t v15 = *((void *)a3 + 2);
    *a2 = *a3;
    *((void *)a2 + 2) = v15;
    *a3 = v14;
    *((void *)a3 + 2) = v13;
    uint64_t v16 = *((void *)a1 + 2);
    __int128 v17 = *a1;
    uint64_t v18 = *((void *)a2 + 2);
    *a1 = *a2;
    *((void *)a1 + 2) = v18;
    *a2 = v17;
    *((void *)a2 + 2) = v16;
    return 2LL;
  }

  if (!(_DWORD)result)
  {
    uint64_t v19 = *((void *)a1 + 2);
    __int128 v20 = *a1;
    uint64_t v21 = *((void *)a2 + 2);
    *a1 = *a2;
    *((void *)a1 + 2) = v21;
    *a2 = v20;
    *((void *)a2 + 2) = v19;
    uint64_t v22 = *((void *)a2 + 2);
    __int128 v23 = *a2;
    uint64_t v24 = *((void *)a3 + 2);
    *a2 = *a3;
    *((void *)a2 + 2) = v24;
    *a3 = v23;
    *((void *)a3 + 2) = v22;
    return 2LL;
  }

  uint64_t v10 = *((void *)a1 + 2);
  __int128 v11 = *a1;
  uint64_t v12 = *((void *)a3 + 2);
  *a1 = *a3;
  *((void *)a1 + 2) = v12;
  *a3 = v11;
  *((void *)a3 + 2) = v10;
  return 1LL;
}

__int128 *sub_399B0(__int128 *a1, __int128 *a2, uint64_t a3)
{
  uint64_t v14 = *((void *)a1 + 2);
  __int128 v13 = *a1;
  *((void *)a1 + 1) = 0LL;
  *((void *)a1 + 2) = 0LL;
  *(void *)a1 = 0LL;
  if (((*(uint64_t (**)(void))(*(void *)a3 + 16LL))() & 1) != 0)
  {
    uint64_t v6 = a1;
    do
      uint64_t v6 = (__int128 *)((char *)v6 + 24);
    while (((*(uint64_t (**)(void))(*(void *)a3 + 16LL))() & 1) == 0);
  }

  else
  {
    uint64_t v7 = (__int128 *)((char *)a1 + 24);
    do
    {
      uint64_t v6 = v7;
      if (v7 >= a2) {
        break;
      }
      int v8 = (*(uint64_t (**)(void))(*(void *)a3 + 16LL))();
      uint64_t v7 = (__int128 *)((char *)v6 + 24);
    }

    while (!v8);
  }

  if (v6 < a2)
  {
    do
      a2 = (__int128 *)((char *)a2 - 24);
    while (((*(uint64_t (**)(void))(*(void *)a3 + 16LL))() & 1) != 0);
  }

  while (v6 < a2)
  {
    uint64_t v16 = *((void *)v6 + 2);
    __int128 v15 = *v6;
    __int128 v9 = *a2;
    *((void *)v6 + 2) = *((void *)a2 + 2);
    __int128 *v6 = v9;
    *((void *)a2 + 2) = v16;
    *a2 = v15;
    do
      uint64_t v6 = (__int128 *)((char *)v6 + 24);
    while (!(*(unsigned int (**)(void))(*(void *)a3 + 16LL))());
    do
      a2 = (__int128 *)((char *)a2 - 24);
    while (((*(uint64_t (**)(void))(*(void *)a3 + 16LL))() & 1) != 0);
  }

  uint64_t v10 = (void **)v6 - 3;
  if ((__int128 *)((char *)v6 - 24) == a1)
  {
  }

  else
  {
    __int128 v11 = *(_OWORD *)v10;
    *((void *)a1 + 2) = *((void *)v6 - 1);
    *a1 = v11;
    *((_BYTE *)v6 - 1) = 0;
    *((_BYTE *)v6 - 24) = 0;
  }

  *((void *)v6 - 1) = v14;
  *(_OWORD *)uint64_t v10 = v13;
  return v6;
}

void sub_39B58( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_39B88(__int128 *a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6 = 0LL;
  __int128 v16 = *a1;
  uint64_t v17 = *((void *)a1 + 2);
  *((void *)a1 + 1) = 0LL;
  *((void *)a1 + 2) = 0LL;
  *(void *)a1 = 0LL;
  do
    v6 += 24LL;
  while (((*(uint64_t (**)(void))(*(void *)a3 + 16LL))() & 1) != 0);
  unint64_t v7 = (unint64_t)a1 + v6;
  if (v6 == 24)
  {
    do
    {
      if (v7 >= a2) {
        break;
      }
      a2 -= 24LL;
    }

    while (((*(uint64_t (**)(void))(*(void *)a3 + 16LL))() & 1) == 0);
  }

  else
  {
    do
      a2 -= 24LL;
    while (!(*(unsigned int (**)(void))(*(void *)a3 + 16LL))());
  }

  int v8 = (__int128 *)((char *)a1 + v6);
  if (v7 < a2)
  {
    unint64_t v9 = a2;
    do
    {
      __int128 v10 = *v8;
      uint64_t v11 = *((void *)v8 + 2);
      uint64_t v12 = *(void *)(v9 + 16);
      __int128 *v8 = *(_OWORD *)v9;
      *((void *)v8 + 2) = v12;
      *(void *)(v9 + 16) = v11;
      *(_OWORD *)unint64_t v9 = v10;
      do
        int v8 = (__int128 *)((char *)v8 + 24);
      while (((*(uint64_t (**)(void))(*(void *)a3 + 16LL))() & 1) != 0);
      do
        v9 -= 24LL;
      while (!(*(unsigned int (**)(void))(*(void *)a3 + 16LL))());
    }

    while ((unint64_t)v8 < v9);
  }

  __int128 v13 = (void **)v8 - 3;
  if ((__int128 *)((char *)v8 - 24) == a1)
  {
  }

  else
  {
    __int128 v14 = *(_OWORD *)v13;
    *((void *)a1 + 2) = *((void *)v8 - 1);
    *a1 = v14;
    *((_BYTE *)v8 - 1) = 0;
    *((_BYTE *)v8 - 24) = 0;
  }

  *((void *)v8 - 1) = v17;
  *(_OWORD *)__int128 v13 = v16;
  return (uint64_t)v8 - 24;
}

void sub_39D2C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_39D58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = 0xAAAAAAAAAAAAAAABLL * ((a2 - a1) >> 3);
  BOOL result = 1LL;
  switch(v6)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      int v8 = (__int128 *)(a2 - 24);
      if ((*(unsigned int (**)(void))(*(void *)a3 + 16LL))())
      {
        uint64_t v9 = *(void *)(a1 + 16);
        __int128 v10 = *(_OWORD *)a1;
        uint64_t v11 = *(void *)(a2 - 8);
        *(_OWORD *)a1 = *v8;
        *(void *)(a1 + 16) = v11;
        __int128 *v8 = v10;
        *(void *)(a2 - _Block_object_dispose((const void *)(v1 - 136), 8) = v9;
      }

      return 1LL;
    case 3uLL:
      sub_39858((__int128 *)a1, (__int128 *)(a1 + 24), (__int128 *)(a2 - 24), a3);
      return 1LL;
    case 4uLL:
      sub_39FB0(a1, a1 + 24, a1 + 48, a2 - 24, a3);
      return 1LL;
    case 5uLL:
      sub_3A0A4((__n128 *)a1, a1 + 24, a1 + 48, a1 + 72, a2 - 24, a3);
      return 1LL;
    default:
      sub_39858((__int128 *)a1, (__int128 *)(a1 + 24), (__int128 *)(a1 + 48), a3);
      uint64_t v12 = a1 + 72;
      if (a1 + 72 == a2) {
        return 1LL;
      }
      uint64_t v13 = 0LL;
      int v14 = 0;
      break;
  }

  while (1)
  {
    if ((*(unsigned int (**)(void))(*(void *)a3 + 16LL))())
    {
      __int128 v20 = *(_OWORD *)v12;
      uint64_t v21 = *(void *)(v12 + 16);
      *(void *)(v12 + _Block_object_dispose((const void *)(v1 - 136), 8) = 0LL;
      *(void *)(v12 + 16) = 0LL;
      *(void *)uint64_t v12 = 0LL;
      uint64_t v15 = v13;
      do
      {
        uint64_t v16 = a1 + v15;
        uint64_t v17 = (void **)(a1 + v15 + 72);
        *(_OWORD *)uint64_t v17 = *(_OWORD *)(v16 + 48);
        *(void *)(a1 + v15 + 8_Block_object_dispose((const void *)(v1 - 136), 8) = *(void *)(v16 + 64);
        *(_BYTE *)(v16 + 71) = 0;
        *(_BYTE *)(v16 + 4_Block_object_dispose((const void *)(v1 - 136), 8) = 0;
        if (v15 == -48)
        {
          uint64_t v19 = a1;
          goto LABEL_15;
        }

        v15 -= 24LL;
      }

      while (((*(uint64_t (**)(void))(*(void *)a3 + 16LL))() & 1) != 0);
      int v18 = *(char *)(a1 + v15 + 95);
      uint64_t v19 = a1 + v15 + 72;
      if (v18 < 0) {
        operator delete(*(void **)v19);
      }
LABEL_15:
      *(_OWORD *)uint64_t v19 = v20;
      *(void *)(v19 + 16) = v21;
      if (++v14 == 8) {
        return v12 + 24 == a2;
      }
    }

    v13 += 24LL;
    v12 += 24LL;
    if (v12 == a2) {
      return 1LL;
    }
  }

void sub_39F94( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

__n128 sub_39FB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if ((*(unsigned int (**)(void))(*(void *)a5 + 16LL))())
  {
    uint64_t v11 = *(void *)(a3 + 16);
    __int128 v12 = *(_OWORD *)a3;
    uint64_t v13 = *(void *)(a4 + 16);
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *(void *)(a3 + 16) = v13;
    *(_OWORD *)a4 = v12;
    *(void *)(a4 + 16) = v11;
    if ((*(unsigned int (**)(void))(*(void *)a5 + 16LL))())
    {
      uint64_t v14 = *(void *)(a2 + 16);
      __int128 v15 = *(_OWORD *)a2;
      uint64_t v16 = *(void *)(a3 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(void *)(a2 + 16) = v16;
      *(_OWORD *)a3 = v15;
      *(void *)(a3 + 16) = v14;
      if ((*(unsigned int (**)(void))(*(void *)a5 + 16LL))())
      {
        uint64_t v17 = *(void *)(a1 + 16);
        __n128 result = *(__n128 *)a1;
        uint64_t v18 = *(void *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(void *)(a1 + 16) = v18;
        *(__n128 *)a2 = result;
        *(void *)(a2 + 16) = v17;
      }
    }
  }

  return result;
}

__n128 sub_3A0A4(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  __n128 v12 = sub_39FB0((uint64_t)a1, a2, a3, a4, a6);
  if ((*(unsigned int (**)(__n128))(*(void *)a6 + 16LL))(v12))
  {
    uint64_t v14 = *(void *)(a4 + 16);
    __int128 v15 = *(_OWORD *)a4;
    uint64_t v16 = *(void *)(a5 + 16);
    *(_OWORD *)a4 = *(_OWORD *)a5;
    *(void *)(a4 + 16) = v16;
    *(_OWORD *)a5 = v15;
    *(void *)(a5 + 16) = v14;
    if ((*(unsigned int (**)(void))(*(void *)a6 + 16LL))())
    {
      uint64_t v17 = *(void *)(a3 + 16);
      __int128 v18 = *(_OWORD *)a3;
      uint64_t v19 = *(void *)(a4 + 16);
      *(_OWORD *)a3 = *(_OWORD *)a4;
      *(void *)(a3 + 16) = v19;
      *(_OWORD *)a4 = v18;
      *(void *)(a4 + 16) = v17;
      if ((*(unsigned int (**)(void))(*(void *)a6 + 16LL))())
      {
        uint64_t v20 = *(void *)(a2 + 16);
        __n128 v21 = *(__n128 *)a2;
        uint64_t v22 = *(void *)(a3 + 16);
        *(_OWORD *)a2 = *(_OWORD *)a3;
        *(void *)(a2 + 16) = v22;
        *(__n128 *)a3 = v21;
        *(void *)(a3 + 16) = v20;
        if ((*(unsigned int (**)(void))(*(void *)a6 + 16LL))())
        {
          unint64_t v23 = a1[1].n128_u64[0];
          __n128 result = *a1;
          unint64_t v24 = *(void *)(a2 + 16);
          *a1 = *(__n128 *)a2;
          a1[1].n128_u64[0] = v24;
          *(__n128 *)a2 = result;
          *(void *)(a2 + 16) = v23;
        }
      }
    }
  }

  return result;
}

__int128 *sub_3A1D4(uint64_t a1, __int128 *a2, __int128 *a3, uint64_t a4, __n128 a5)
{
  if ((__int128 *)a1 != a2)
  {
    uint64_t v9 = (uint64_t)a2 - a1;
    uint64_t v10 = ((uint64_t)a2 - a1) / 24;
    if ((uint64_t)a2 - a1 >= 25)
    {
      unint64_t v11 = (unint64_t)(v10 - 2) >> 1;
      unint64_t v12 = v11 + 1;
      uint64_t v13 = (__n128 *)(a1 + 24 * v11);
      do
      {
        a5 = sub_3A420(a1, a4, v10, v13);
        uint64_t v13 = (__n128 *)((char *)v13 - 24);
        --v12;
      }

      while (v12);
    }

    uint64_t v14 = a2;
    if (a2 != a3)
    {
      __int128 v15 = a2;
      do
      {
        if ((*(unsigned int (**)(__n128))(*(void *)a4 + 16LL))(a5))
        {
          uint64_t v16 = *((void *)v15 + 2);
          __int128 v17 = *v15;
          uint64_t v18 = *(void *)(a1 + 16);
          __int128 *v15 = *(_OWORD *)a1;
          *((void *)v15 + 2) = v18;
          *(_OWORD *)a1 = v17;
          *(void *)(a1 + 16) = v16;
          a5 = sub_3A420(a1, a4, v10, (__n128 *)a1);
        }

        __int128 v15 = (__int128 *)((char *)v15 + 24);
      }

      while (v15 != a3);
      uint64_t v14 = a3;
    }

    if (v9 >= 25)
    {
      int64_t v19 = v9 / 0x18uLL;
      uint64_t v20 = (__int128 *)((char *)a2 - 24);
      do
      {
        uint64_t v21 = *(void *)a1;
        *(void *)uint64_t v29 = *(void *)(a1 + 8);
        *(void *)&v29[7] = *(void *)(a1 + 15);
        char v22 = *(_BYTE *)(a1 + 23);
        *(void *)(a1 + _Block_object_dispose((const void *)(v1 - 136), 8) = 0LL;
        *(void *)(a1 + 16) = 0LL;
        *(void *)a1 = 0LL;
        uint64_t v23 = sub_3A5E4(a1, a4, v19);
        uint64_t v24 = v23;
        int v25 = *(char *)(v23 + 23);
        if (v20 == (__int128 *)v23)
        {
          if (v25 < 0) {
            operator delete(*(void **)v23);
          }
          *(void *)uint64_t v24 = v21;
          *(void *)(v24 + _Block_object_dispose((const void *)(v1 - 136), 8) = *(void *)v29;
          *(void *)(v24 + 15) = *(void *)&v29[7];
          *(_BYTE *)(v24 + 23) = v22;
        }

        else
        {
          if (v25 < 0) {
            operator delete(*(void **)v23);
          }
          __int128 v26 = *v20;
          *(void *)(v24 + 16) = *((void *)v20 + 2);
          *(_OWORD *)uint64_t v24 = v26;
          *(void *)uint64_t v20 = v21;
          *((void *)v20 + 1) = *(void *)v29;
          *(void *)((char *)v20 + 15) = *(void *)&v29[7];
          *((_BYTE *)v20 + 23) = v22;
          sub_3A6C0(a1, v24 + 24, a4, 0xAAAAAAAAAAAAAAABLL * ((v24 + 24 - a1) >> 3));
        }

        uint64_t v20 = (__int128 *)((char *)v20 - 24);
      }

      while (v19-- > 2);
    }

    return v14;
  }

  return a3;
}

void sub_3A408(_Unwind_Exception *exception_object)
{
  if (v2 < 0) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

__n128 sub_3A420(uint64_t a1, uint64_t a2, uint64_t a3, __n128 *a4)
{
  unint64_t v4 = a3 - 2;
  if (a3 >= 2)
  {
    uint64_t v5 = a4;
    uint64_t v7 = v4 >> 1;
    if ((uint64_t)(v4 >> 1) >= (uint64_t)(0xAAAAAAAAAAAAAAABLL * (((uint64_t)a4 - a1) >> 3)))
    {
      uint64_t v10 = (0x5555555555555556LL * (((uint64_t)a4 - a1) >> 3)) | 1;
      unint64_t v11 = (__n128 *)(a1 + 24 * v10);
      uint64_t v12 = 0x5555555555555556LL * (((uint64_t)a4 - a1) >> 3) + 2;
      if (v12 < a3 && (*(unsigned int (**)(void))(*(void *)a2 + 16LL))())
      {
        unint64_t v11 = (__n128 *)((char *)v11 + 24);
        uint64_t v10 = v12;
      }

      if (((*(uint64_t (**)(void))(*(void *)a2 + 16LL))() & 1) == 0)
      {
        __n128 v17 = *v5;
        unint64_t v18 = v5[1].n128_u64[0];
        v5->n128_u64[1] = 0LL;
        v5[1].n128_u64[0] = 0LL;
        v5->n128_u64[0] = 0LL;
        while (1)
        {
          uint64_t v14 = v11;
          if (v5[1].n128_i8[7] < 0) {
            operator delete((void *)v5->n128_u64[0]);
          }
          __n128 v15 = *v11;
          v5[1].n128_u64[0] = v11[1].n128_u64[0];
          *uint64_t v5 = v15;
          v11[1].n128_u8[7] = 0;
          v11->n128_u8[0] = 0;
          if (v7 < v10) {
            break;
          }
          uint64_t v16 = (2 * v10) | 1;
          unint64_t v11 = (__n128 *)(a1 + 24 * v16);
          uint64_t v10 = 2 * v10 + 2;
          if (v10 >= a3)
          {
            uint64_t v10 = v16;
          }

          else if ((*(unsigned int (**)(void))(*(void *)a2 + 16LL))())
          {
            unint64_t v11 = (__n128 *)((char *)v11 + 24);
          }

          else
          {
            uint64_t v10 = v16;
          }

          uint64_t v5 = v14;
          if ((*(unsigned int (**)(void))(*(void *)a2 + 16LL))())
          {
            if (v14[1].n128_i8[7] < 0) {
              operator delete((void *)v14->n128_u64[0]);
            }
            break;
          }
        }

        __n128 result = v17;
        v14[1].n128_u64[0] = v18;
        __n128 *v14 = v17;
      }
    }
  }

  return result;
}

void sub_3A5C8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_3A5E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = 0LL;
  uint64_t v7 = a3 - 2;
  if (a3 < 2) {
    uint64_t v7 = a3 - 1;
  }
  uint64_t v8 = v7 >> 1;
  do
  {
    uint64_t v9 = a1 + 24 * v6 + 24;
    uint64_t v10 = 2 * v6;
    uint64_t v6 = (2 * v6) | 1;
    uint64_t v11 = v10 + 2;
    if (v10 + 2 < a3 && (*(unsigned int (**)(void))(*(void *)a2 + 16LL))())
    {
      v9 += 24LL;
      uint64_t v6 = v11;
    }

    __int128 v12 = *(_OWORD *)v9;
    *(void *)(a1 + 16) = *(void *)(v9 + 16);
    *(_OWORD *)a1 = v12;
    *(_BYTE *)(v9 + 23) = 0;
    *(_BYTE *)uint64_t v9 = 0;
    a1 = v9;
  }

  while (v6 <= v8);
  return v9;
}

double sub_3A6C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 >= 2)
  {
    unint64_t v7 = v4 >> 1;
    uint64_t v8 = (__int128 *)(a1 + 24 * (v4 >> 1));
    uint64_t v9 = (__int128 *)(a2 - 24);
    if ((*(unsigned int (**)(void))(*(void *)a3 + 16LL))())
    {
      __int128 v13 = *v9;
      uint64_t v14 = *((void *)v9 + 2);
      *((void *)v9 + 1) = 0LL;
      *((void *)v9 + 2) = 0LL;
      *(void *)uint64_t v9 = 0LL;
      while (1)
      {
        uint64_t v11 = v8;
        __int128 v12 = *v8;
        *((void *)v9 + 2) = *((void *)v8 + 2);
        __int128 *v9 = v12;
        *((_BYTE *)v8 + 23) = 0;
        *(_BYTE *)uint64_t v8 = 0;
        if (!v7) {
          break;
        }
        unint64_t v7 = (v7 - 1) >> 1;
        uint64_t v8 = (__int128 *)(a1 + 24 * v7);
        uint64_t v9 = v11;
        if (((*(uint64_t (**)(void))(*(void *)a3 + 16LL))() & 1) == 0)
        {
          break;
        }
      }

      double result = *(double *)&v13;
      __int128 *v11 = v13;
      *((void *)v11 + 2) = v14;
    }
  }

  return result;
}

void sub_3A7C4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_3A7E0(uint64_t **a1, void **a2, uint64_t a3, __int128 **a4)
{
  uint64_t v6 = (uint64_t **)sub_3A874((uint64_t)a1, &v9, a2);
  double result = *v6;
  if (!*v6)
  {
    sub_3A904((uint64_t)a1, a4, (uint64_t)&v8);
    sub_3A9A8(a1, v9, v6, v8);
    return v8;
  }

  return result;
}

void *sub_3A874(uint64_t a1, void *a2, void **a3)
{
  uint64_t v5 = (void *)(a1 + 8);
  unint64_t v4 = *(void **)(a1 + 8);
  if (v4)
  {
    do
    {
      while (1)
      {
        unint64_t v7 = v4;
        uint64_t v8 = v4 + 4;
        unint64_t v4 = (void *)*v7;
        uint64_t v5 = v7;
        if (!*v7) {
          goto LABEL_9;
        }
      }

      if ((sub_3A9FC(v8, a3) & 0x80) == 0) {
        break;
      }
      uint64_t v5 = v7 + 1;
      unint64_t v4 = (void *)v7[1];
    }

    while (v4);
  }

  else
  {
    unint64_t v7 = (void *)(a1 + 8);
  }

_BYTE *sub_3A904@<X0>(uint64_t a1@<X0>, __int128 **a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  uint64_t v6 = (char *)operator new(0x40uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + _Block_object_dispose((const void *)(v1 - 136), 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  double result = v6 + 32;
  uint64_t v8 = *a2;
  if (*((char *)*a2 + 23) < 0)
  {
    double result = sub_2ECD4(result, *(void **)v8, *((void *)v8 + 1));
  }

  else
  {
    __int128 v9 = *v8;
    *((void *)v6 + 6) = *((void *)v8 + 2);
    *(_OWORD *)double result = v9;
  }

  *((void *)v6 + 7) = 0LL;
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

void sub_3A98C(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0LL;
  sub_3AC28(v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *sub_3A9A8(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0LL;
  a4[1] = 0LL;
  a4[2] = a2;
  *a3 = a4;
  uint64_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }

  double result = sub_3AA90(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t sub_3A9FC(void *a1, void **a2)
{
  size_t v2 = *((unsigned __int8 *)a1 + 23);
  size_t v3 = a1[1];
  if ((v2 & 0x80u) != 0LL)
  {
    a1 = (void *)*a1;
    size_t v2 = v3;
  }

  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = *a2;
  }
  if (v4 >= 0) {
    size_t v6 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v6 = (size_t)a2[1];
  }
  return sub_3AA34(a1, v2, v5, v6);
}

uint64_t sub_3AA34(const void *a1, size_t a2, void *__s2, size_t a4)
{
  if (a4 >= a2) {
    size_t v7 = a2;
  }
  else {
    size_t v7 = a4;
  }
  int v8 = memcmp(a1, __s2, v7);
  if (v8)
  {
    if ((v8 & 0x80000000) == 0) {
      return 1LL;
    }
  }

  else
  {
    if (a2 == a4) {
      return 0LL;
    }
    if (a2 >= a4) {
      return 1LL;
    }
  }

  return 255LL;
}

uint64_t *sub_3AA90(uint64_t *result, uint64_t *a2)
{
  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      size_t v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24)) {
        return result;
      }
      size_t v3 = (uint64_t *)v2[2];
      int v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), uint64_t v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            __int128 v9 = (uint64_t **)a2[2];
          }

          else
          {
            __int128 v9 = (uint64_t **)v2[1];
            uint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              size_t v3 = (uint64_t *)v2[2];
            }

            v9[2] = v3;
            *(void *)(v2[2] + 8LL * (*(void *)v2[2] != (void)v2)) = v9;
            __int128 *v9 = v2;
            v2[2] = (uint64_t)v9;
            size_t v3 = v9[2];
            size_t v2 = (uint64_t *)*v3;
          }

          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8LL * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }

      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), uint64_t v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            size_t v3 = (uint64_t *)v2[2];
          }

          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8LL * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          size_t v3 = (uint64_t *)a2[2];
        }

        else
        {
          a2 = (uint64_t *)a2[2];
        }

        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        size_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8LL * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }

      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *uint64_t v5 = 1;
    }

    while (v3 != result);
  }

  return result;
}

void sub_3AC28(uint64_t a1, void **__p)
{
  if (*(_BYTE *)(a1 + 8))
  {
  }

  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

void **sub_3AC74(uint64_t a1, void **a2)
{
  size_t v2 = (void **)(a1 + 8);
  size_t v3 = *(void **)(a1 + 8);
  if (!v3) {
    return v2;
  }
  uint64_t v5 = (void **)(a1 + 8);
  do
  {
    char v6 = sub_3A9FC(v3 + 4, a2);
    if (v6 >= 0) {
      uint64_t v7 = v3;
    }
    else {
      uint64_t v7 = v3 + 1;
    }
    if (v6 >= 0) {
      uint64_t v5 = (void **)v3;
    }
    size_t v3 = (void *)*v7;
  }

  while (*v7);
  if (v5 == v2 || (sub_3A9FC(a2, v5 + 4) & 0x80) != 0) {
    return v2;
  }
  return v5;
}

void sub_3ACF0(uint64_t a1, char *a2)
{
  if (a2)
  {
    sub_3ACF0(a1, *(void *)a2);
    sub_3ACF0(a1, *((void *)a2 + 1));
    if (a2[55] < 0) {
      operator delete(*((void **)a2 + 4));
    }
    operator delete(a2);
  }

void sub_3AE1C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_3AF04(_Unwind_Exception *exception_object)
{
}

void sub_3B004(_Unwind_Exception *a1)
{
}

void sub_3B110(_Unwind_Exception *a1)
{
}

void sub_3B210(_Unwind_Exception *a1)
{
}

void sub_3B280(_Unwind_Exception *a1)
{
}

void sub_3B2FC(_Unwind_Exception *a1)
{
}

void sub_3B378(_Unwind_Exception *a1)
{
}

void sub_3B3F0(_Unwind_Exception *a1)
{
}

void sub_3B468(_Unwind_Exception *a1)
{
}

void sub_3B4E4(_Unwind_Exception *a1)
{
}

void sub_3B610(_Unwind_Exception *a1)
{
}

void sub_3B71C(_Unwind_Exception *a1)
{
}

void sub_3B7A0(_Unwind_Exception *a1)
{
}

void _TIBeginMockingAggdReporter()
{
  if ((byte_AA3C8 & 1) == 0)
  {
    Class v0 = NSClassFromString(@"TIAggdReporter");
    if (v0)
    {
      Class v1 = v0;
      size_t v2 = objc_alloc_init(&OBJC_CLASS___TIAggdReporterMock);
      size_t v3 = (void *)qword_AA3C0;
      qword_AA3C0 = (uint64_t)v2;

      -[objc_class setSharedAggdReporter:](v1, "setSharedAggdReporter:", qword_AA3C0);
    }

    else
    {
      byte_AA3C8 = 1;
    }
  }

void _TIEndMockingAggdReporter()
{
  if ((byte_AA3C8 & 1) == 0)
  {
    -[objc_class setSharedAggdReporter:](NSClassFromString(@"TIAggdReporter"), "setSharedAggdReporter:", 0LL);
    Class v0 = (void *)qword_AA3C0;
    qword_AA3C0 = 0LL;
  }

id _TIGetMockingAggdReporterScalar(uint64_t a1)
{
  if ((byte_AA3C8 & 1) != 0) {
    return 0LL;
  }
  else {
    return [(id)qword_AA3C0 getScalar:a1];
  }
}

id _TIGetMockingAggdReporterDistribution(uint64_t a1)
{
  if ((byte_AA3C8 & 1) != 0) {
    return &__NSArray0__struct;
  }
  else {
    return (id)objc_claimAutoreleasedReturnValue([(id)qword_AA3C0 getDistributionObject:a1]);
  }
}

id _TIMockingAggdReporterDictionaryToJSON()
{
  return _[(id)qword_AA3C0 toJsonString];
}

id _TIMockingAggdReporterDictionary()
{
  return [(id)qword_AA3C0 toDictionary];
}

id _TIMockingAggdReporterClear()
{
  return [(id)qword_AA3C0 clear];
}

void sub_3D124(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
  int v8 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByTrimmingCharactersInSet:v4]);

  id v5 = [v8 length];
  char v6 = v8;
  if (v5)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[PlaybackTest sentenceToTransliteratedPlaybackTest:withCatenation:addWordSpacing:]( &OBJC_CLASS___PlaybackTest,  "sentenceToTransliteratedPlaybackTest:withCatenation:addWordSpacing:",  v8,  *(unsigned __int8 *)(a1 + 40),  *(unsigned __int8 *)(a1 + 41)));
    if (v7) {
      [*(id *)(a1 + 32) addObject:v7];
    }

    char v6 = v8;
  }
}

LABEL_41:
      __n128 v15 = 0;
      goto LABEL_42;
    }

    if (a5)
    {
      uint64_t v16 = &off_905E8;
      goto LABEL_14;
    }

void sub_3DD98( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, char a39)
{
}

uint64_t sub_3DDCC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_3DDDC(uint64_t a1)
{
}

void sub_3DDE4(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"perLineResults"]);
  unsigned int v6 = [v5 BOOLValue];

  uint64_t v7 = *(void **)(*(void *)(a1[6] + 8LL) + 40LL);
  if (v6) {
    id v8 = sub_3DE84(v4);
  }
  else {
    id v8 = sub_3E194(v4);
  }
  id v9 = (id)objc_claimAutoreleasedReturnValue(v8);

  [v7 setObject:v9 forKey:a1[5]];
}

id sub_3DE84(void *a1)
{
  id v1 = a1;
  id v17 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t v14 = v1;
  id obj = (id)objc_claimAutoreleasedReturnValue([v1 objectForKey:@"Results"]);
  id v18 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v18)
  {
    uint64_t v16 = *(void *)v20;
    do
    {
      for (uint64_t i = 0LL; i != v18; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(obj);
        }
        id v3 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"CorpusId"]);
        -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v5, @"CorpusId");

        unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"WordCount"]);
        -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v6, @"WordCount");

        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"WordErrorCount"]);
        -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v7, @"WordErrorCount");

        id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"CharacterCount"]);
        -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v8, @"CharacterCount");

        id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"KeystrokeCount"]);
        -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v9, @"KeystrokeCount");

        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"SeparatorErrorCount"]);
        -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v10, @"SeparatorErrorCount");

        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"SeparatorCount"]);
        -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v11, @"SeparatorCount");

        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"InsertedCharacterCount"]);
        -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v12, @"InsertedCharacterCount");

        [v17 addObject:v4];
      }

      id v18 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v18);
  }

  return v17;
}

id sub_3E194(void *a1)
{
  id v1 = a1;
  size_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKey:@"KeystrokeSavingsRatio"]);
  [v2 setObject:v3 forKey:@"ksr"];

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKey:@"WordAccuracy"]);
  [v2 setObject:v4 forKey:@"accuracy"];

  return v2;
}

void sub_3E244(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v10 = (id)objc_claimAutoreleasedReturnValue([v3 stringByAppendingString:@"_customLM"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:@"perLineResults"]);
  unsigned int v6 = [v5 BOOLValue];

  uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  if (v6) {
    id v8 = sub_3DE84(v4);
  }
  else {
    id v8 = sub_3E194(v4);
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  [v7 setObject:v9 forKey:v10];
}

void _TIBeginMockingCryptographer()
{
  Class v0 = objc_alloc_init(&OBJC_CLASS___TICryptographerMock);
  if ((objc_opt_respondsToSelector(&OBJC_CLASS___TICryptographer, "setSharedCryptographer:") & 1) != 0) {
    +[TICryptographer performSelector:withObject:]( &OBJC_CLASS___TICryptographer,  "performSelector:withObject:",  "setSharedCryptographer:",  v0);
  }
}

uint64_t _TIEndMockingCryptographer()
{
  uint64_t result = objc_opt_respondsToSelector(&OBJC_CLASS___TICryptographer, "setSharedCryptographer:");
  if ((result & 1) != 0) {
    return (uint64_t)+[TICryptographer performSelector:withObject:]( &OBJC_CLASS___TICryptographer,  "performSelector:withObject:",  "setSharedCryptographer:",  0LL);
  }
  return result;
}

void _TIBeginMockingSingletons()
{
}

void _TIBeginMockingSingletonsWithData(void *a1, void *a2, void *a3, void *a4, int a5, char a6)
{
  id v15 = a4;
  id v11 = a3;
  id v12 = a2;
  id v13 = a1;
  if ((objc_opt_respondsToSelector(&OBJC_CLASS___TILaunchServicesLookup, "disableForTesting:") & 1) != 0) {
    +[TILaunchServicesLookup disableForTesting:](&OBJC_CLASS___TILaunchServicesLookup, "disableForTesting:", 1LL);
  }
  _TIBeginMockingKeyboardActivityController();
  _TIBeginMockingTransientLexiconManagerWithData(v13, v12);

  if (v11) {
    uint64_t v14 = v11;
  }
  else {
    uint64_t v14 = &__NSArray0__struct;
  }
  _TIBeginMockingUserDictionaryServerWithPairs(v14);

  if (v15)
  {
    _TIBeginMockingLanguageLikelihoodModelWithModel(v15);
    if (!a5) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }

  _TIBeginMockingLanguageLikelihoodModel();
  if (a5) {
LABEL_8:
  }
    _TIBeginMockingAssetManager();
LABEL_9:
  _TIBeginMockingAggdReporter();
  sub_DAA4();
  _TIBeginMockingCryptographer();
  _TIBeginMockingUserModelDataStore();
  _TIBeginMockingTrialManager();
  if ((a6 & 1) == 0)
  {
    _TIBeginMockingProactiveQuickTypeManager();
    sub_6668();
  }
}

void _TIBeginMockingSingletonsWithResources(void *a1, void *a2, void *a3, int a4, char a5)
{
  id v12 = a3;
  id v9 = a2;
  id v10 = a1;
  _TIBeginMockingKeyboardActivityController();
  _TIBeginMockingContactManagerWithContactCollection(v10);

  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = &__NSArray0__struct;
  }
  _TIBeginMockingUserDictionaryServerWithPairs(v11);

  if (v12)
  {
    _TIBeginMockingLanguageLikelihoodModelWithModel(v12);
    if (!a4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  _TIBeginMockingLanguageLikelihoodModel();
  if (a4) {
LABEL_6:
  }
    _TIBeginMockingAssetManager();
LABEL_7:
  _TIBeginMockingAggdReporter();
  sub_DAA4();
  _TIBeginMockingCryptographer();
  _TIBeginMockingUserModelDataStore();
  _TIBeginMockingTrialManager();
  sub_6668();
  if ((a5 & 1) == 0)
  {
    _TIBeginMockingProactiveQuickTypeManager();
    sub_6668();
  }
}

void _TIBeginMockingSingletonsWithMockData(void *a1, void *a2, void *a3, void *a4, int a5, char a6)
{
  id v11 = a4;
  id v12 = a3;
  id v13 = a2;
  id v14 = _TIConvertTIMockContactCollection(a1);
  id v15 = (id)objc_claimAutoreleasedReturnValue(v14);
  _TIBeginMockingSingletonsWithData(v15, v13, v12, v11, a5, a6);
}

uint64_t _TIEndMockingSingletons()
{
  return _TIEndMockingSingletonsWithData(0);
}

uint64_t _TIEndMockingSingletonsWithData(char a1)
{
  uint64_t result = objc_opt_respondsToSelector(&OBJC_CLASS___TILaunchServicesLookup, "disableForTesting:");
  if ((result & 1) != 0) {
    uint64_t result = (uint64_t)+[TILaunchServicesLookup disableForTesting:]( &OBJC_CLASS___TILaunchServicesLookup,  "disableForTesting:",  0LL);
  }
  if ((a1 & 1) == 0)
  {
    _TIEndMockingProactiveQuickTypeManager();
    return sub_66C8();
  }

  return result;
}

uint64_t sub_3E98C(int a1, int a2, int a3)
{
  return (a2 + a3 * a1);
}

id TIOptimalSequenceAlignment(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = a3;
  v49 = v5;
  if ((unint64_t)[v5 count] > 0xFFFE
    || (unint64_t)[v6 count] > 0xFFFE
    || (unsigned __int16 v8 = (unsigned __int16)[v5 count] + 1,
        uint64_t v9 = (unsigned __int16)((unsigned __int16)[v6 count] + 1),
        uint64_t v45 = v8,
        v8 <= 1u)
    && v9 < 2)
  {
    id v10 = &__NSArray0__struct;
    goto LABEL_6;
  }

  id v10 = &__NSArray0__struct;
  if (v8 && (_DWORD)v9)
  {
    v46 = malloc(8LL * v9 * v8);
    void *v46 = 0LL;
    if (v8 >= 2u)
    {
      uint64_t v12 = 0LL;
      id v13 = v46;
      do
      {
        if ((_DWORD)v12) {
          float v14 = 0.8;
        }
        else {
          float v14 = 1.0;
        }
        float v15 = v14 + *(float *)v13;
        v13 += v9;
        *(float *)id v13 = v15;
        *((_WORD *)v13 + 2) = v12 + 1;
        *((_WORD *)v13 + 3) = 1;
        ++v12;
      }

      while (v8 - 1LL != v12);
    }

    if (v9 >= 2)
    {
      uint64_t v16 = (_WORD *)v46 + 7;
      float v17 = *(float *)v46;
      for (uint64_t i = 1LL; i != v9; ++i)
      {
        if (i == 1) {
          float v19 = 1.0;
        }
        else {
          float v19 = 0.8;
        }
        float v17 = v19 + v17;
        *(float *)(v16 - 3) = v17;
        *(v16 - 1) = i;
        _WORD *v16 = 2;
        v16 += 4;
      }

      uint64_t v20 = 2 * v9;
      uint64_t v47 = 1LL;
      v48 = (float *)(v46 + 1);
      for (uint64_t j = v9; j != v47; LODWORD(v9) = j)
      {
        if (v45 >= 2)
        {
          uint64_t v21 = 0LL;
          __int128 v22 = v48;
          do
          {
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v49 objectAtIndex:v21]);
            id v24 = v6;
            int v25 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndex:v47 - 1]);
            int v26 = v7[2](v7, v23, v25);

            if (v26) {
              float v27 = 0.0;
            }
            else {
              float v27 = 1.0;
            }
            float v28 = v27 + *(v22 - 2);
            if (*((_WORD *)v22 + 3) == 1) {
              float v29 = 0.8;
            }
            else {
              float v29 = 1.0;
            }
            float v30 = *v22 + v29;
            uint64_t v31 = &v22[v20];
            if (HIWORD(v22[v20 - 1]) == 2) {
              float v32 = 0.8;
            }
            else {
              float v32 = 1.0;
            }
            float v33 = v22[v20 - 2] + v32;
            if (v28 > v30 || v28 > v33)
            {
              if (v30 <= v33)
              {
                *uint64_t v31 = v30;
                *((_WORD *)v31 + 2) = *((_WORD *)v22 + 2) + 1;
                *((_WORD *)v31 + 3) = 1;
              }

              else
              {
                v22[v20] = v33;
                *((_WORD *)v31 + 2) = LOWORD(v22[v20 - 1]) + 1;
                *((_WORD *)v31 + 3) = 2;
              }
            }

            else
            {
              *uint64_t v31 = v28;
              *((_WORD *)v31 + 2) = *((_WORD *)v22 - 2) + 1;
              *((_WORD *)v31 + 3) = 0;
            }

            id v6 = v24;
            ++v21;
            __int128 v22 = (float *)((char *)v22 + v20 * 4);
          }

          while (v45 - 1 != v21);
        }

        ++v47;
        v48 += 2;
      }
    }

    unsigned __int16 v35 = v9 - 1;
    int v36 = v45 - 1;
    uint64_t v37 = WORD2(v46[(v9 - 1 + v9 * (v45 - 1))]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", v37));
    if (!(_DWORD)v37)
    {
LABEL_55:
      free(v46);
      goto LABEL_6;
    }

    unsigned int v38 = 0;
    do
    {
      v39 = objc_alloc_init(&OBJC_CLASS___TIAlignedIndexes);
      [v10 addObject:v39];

      ++v38;
    }

    while (v38 < v37);
    uint64_t v40 = v37 + 1;
    while (1)
    {
      __int128 v41 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndex:v40 - 2]);
      uint64_t v42 = v41;
      int v43 = HIWORD(v46[(_DWORD)v9 * (unsigned __int16)v36 + v35]);
      if (v43 == 2) {
        break;
      }
      if (v43 == 1)
      {
        [v41 setIndex1:(unsigned __int16)v36 - 1];
        [v42 setIndex2:0xFFFFLL];
        --v36;
      }

      else if (!HIWORD(v46[(_DWORD)v9 * (unsigned __int16)v36 + v35]))
      {
        [v41 setIndex1:(unsigned __int16)v36 - 1];
        [v42 setIndex2:v35 - 1];
        --v36;
LABEL_53:
        --v35;
      }

      if (--v40 <= 1) {
        goto LABEL_55;
      }
    }

    [v41 setIndex1:0xFFFFLL];
    [v42 setIndex2:v35 - 1];
    goto LABEL_53;
  }

uint64_t sub_3EDDC(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a4 < 1) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v4 = a3 + 16 * a4;
  while (*(void *)a3 < a1)
  {
    a3 += 16LL;
    if (a3 >= v4) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  if (*(void *)a3 <= a1 + a2) {
    return *(void *)a3;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

void sub_3EE1C(void *a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v31 = a1;
  id v7 = a2;
  id v8 = a4;
  if ([v8 count])
  {
    uint64_t v9 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    float v28 = v8;
    do
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", v11, v28));
      float v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
      id v15 = [v14 length];
      id v16 = [v13 length];
      while (v15 < v16)
      {
        float v17 = v12 + 1;
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:v12]);
        [v14 appendString:v18];

        id v15 = [v14 length];
        id v16 = [v13 length];
        uint64_t v12 = v17;
      }

      uint64_t v30 = v11;
      uint64_t v19 = 0LL;
      unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
      if (v9 < v12)
      {
        do
        {
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v31 objectAtIndex:v10]);
          if ([v21 index1] == v9)
          {
            __int128 v22 = v21;
          }

          else
          {
            do
            {
              __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v31 objectAtIndex:++v10]);

              uint64_t v21 = v22;
            }

            while ([v22 index1] != v9);
          }

          uint64_t v23 = (char *)[v22 index2];
          uint64_t v24 = v20 + v19 - (void)v23;
          else {
            uint64_t v25 = v19;
          }
          if ((unint64_t)v23 < v20)
          {
            unint64_t v26 = (unint64_t)v23;
          }

          else
          {
            uint64_t v24 = v25;
            unint64_t v26 = v20;
          }

          if (v20 == 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v24 = 1LL;
            unint64_t v26 = (unint64_t)v23;
          }

          if (v23 != (_BYTE *)-[TIKeyboardTyperUserModel probExtraneousFinalKey] + 3)
          {
            uint64_t v19 = v24;
            unint64_t v20 = v26;
          }

          ++v9;
        }

        while (v9 != v12);
      }

      float v27 = (unint64_t *)(a5 + 16 * v30);
      *float v27 = v20;
      v27[1] = v19;

      uint64_t v11 = v30 + 1;
      id v8 = v28;
      uint64_t v9 = v12;
    }

    while (v30 + 1 < (unint64_t)[v28 count]);
  }
}

void sub_3F020(void *a1, void *a2, uint64_t a3)
{
  id v17 = a1;
  id v5 = a2;
  if ([v5 count])
  {
    uint64_t v6 = 0LL;
    unint64_t v7 = 0LL;
    uint64_t v8 = 0LL;
    do
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:v7]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
      id v11 = [v10 length];
      if (v11 < [v9 length])
      {
        uint64_t v12 = v6;
        do
        {
          uint64_t v8 = v12 + 1;
          id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndex:"));
          [v10 appendString:v13];

          id v14 = [v10 length];
          id v15 = [v9 length];
          uint64_t v12 = v8;
        }

        while (v14 < v15);
      }

      id v16 = (void *)(a3 + 16 * v7);
      void *v16 = v6;
      v16[1] = v8 - v6;

      ++v7;
      uint64_t v6 = v8;
    }

    while (v7 < (unint64_t)[v5 count]);
  }
}

uint64_t sub_3F148(uint64_t result, unint64_t a2, unint64_t *a3, uint64_t a4)
{
  unint64_t v4 = (unint64_t)&a3[2 * a4];
  unint64_t v5 = *(void *)(v4 - 8) + *(void *)(v4 - 16);
  unint64_t v6 = 0LL;
  if (a2)
  {
    uint64_t v7 = 0LL;
    unint64_t v8 = a2 - 1;
    uint64_t v9 = (unint64_t *)(result + 16);
    do
    {
      uint64_t v10 = (unint64_t *)(result + 16 * v7);
      unint64_t v11 = *v10;
      if (*v10 == 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v12 = 0LL;
        unint64_t *v10 = v6;
        v10[1] = 0LL;
        unint64_t v11 = v6;
      }

      else
      {
        unint64_t v12 = v10[1];
      }

      uint64_t v13 = v7 + 1;
      id v14 = v9;
      unint64_t v15 = v8;
      unint64_t v16 = v5;
      if (v7 + 1 < a2)
      {
        while (1)
        {
          unint64_t v17 = *v14;
          v14 += 2;
          unint64_t v16 = v17;
          if (v17 != 0x7FFFFFFFFFFFFFFFLL) {
            break;
          }
          if (!--v15)
          {
            unint64_t v16 = v5;
            break;
          }
        }
      }

      unint64_t v18 = v12 + v11;
      if (v11 != v6)
      {
        unint64_t *v10 = v6;
        unint64_t v12 = v18 - v6;
        *(void *)(result + 16 * v7 + _Block_object_dispose((const void *)(v1 - 136), 8) = v18 - v6;
      }

      if (v16 != v18)
      {
        uint64_t v19 = a3;
        if (a4 < 1) {
          goto LABEL_22;
        }
        while (1)
        {
          unint64_t v20 = *v19;
          if (*v19 >= v18) {
            break;
          }
          v19 += 2;
        }

        if (v20 > v16 || v20 == 0x7FFFFFFFFFFFFFFFLL) {
LABEL_22:
        }
          unint64_t v20 = v16;
        unint64_t v12 = v20 - v6;
        *(void *)(result + 16 * v7 + _Block_object_dispose((const void *)(v1 - 136), 8) = v20 - v6;
      }

      v6 += v12;
      --v8;
      v9 += 2;
      ++v7;
    }

    while (v13 != a2);
  }

  if (v6 < v5) {
    *(void *)(result + 16 * a2 - _Block_object_dispose((const void *)(v1 - 136), 8) = v5 - *(void *)(result + 16 * a2 - 16);
  }
  return result;
}

void TITargetKeyRangesForSourceTokens(void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  id v11 = a1;
  id v12 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if ([v14 count])
  {
    unint64_t v16 = 0LL;
    __int128 v20 = xmmword_821C0;
    do
      *(_OWORD *)(a6 + 16 * v16++) = v20;
    while (v16 < (unint64_t)objc_msgSend(v14, "count", v20));
  }

  if ([v14 count] && objc_msgSend(v15, "count"))
  {
    if ([v14 count])
    {
      unint64_t v18 = 0LL;
      __int128 v20 = xmmword_821C0;
      do
        *(_OWORD *)(a6 + 16 * v18++) = v20;
      while (v18 < (unint64_t)objc_msgSend(v14, "count", v20));
    }

    sub_3EE1C(v11, v12, v17, v14, a6);
    [v15 count];
    uint64_t v19 = (unint64_t *)(&v20 - __chkstk_darwin());
    sub_3F020(v13, v15, (uint64_t)v19);
    sub_3F148(a6, (unint64_t)[v14 count], v19, (uint64_t)objc_msgSend(v15, "count"));
  }
}

uint64_t sub_3F414(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 length]) {
    id v5 = objc_msgSend(v3, "characterAtIndex:", (char *)objc_msgSend(v3, "length") - 1);
  }
  else {
    id v5 = 0LL;
  }
  if ([v4 length]) {
    id v6 = [v4 characterAtIndex:0];
  }
  else {
    id v6 = 0LL;
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
  if ([v7 characterIsMember:v5])
  {
    unsigned int v8 = 0;
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet punctuationCharacterSet](&OBJC_CLASS___NSCharacterSet, "punctuationCharacterSet"));
    unsigned int v8 = [v9 characterIsMember:v5] ^ 1;
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
  if ([v10 characterIsMember:v6])
  {
    unsigned int v11 = 0;
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet punctuationCharacterSet](&OBJC_CLASS___NSCharacterSet, "punctuationCharacterSet"));
    unsigned int v11 = [v12 characterIsMember:v6] ^ 1;
  }

  return v8 & v11;
}

id sub_3F54C(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v25 = a2;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if ([v5 count])
  {
    unint64_t v7 = 0LL;
    uint64_t v24 = (void *)(a3 + 8);
    do
    {
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:v7]);
      id v9 = [v8 copy];

      uint64_t v10 = (unint64_t *)(a3 + 16 * v7);
      unint64_t v11 = *v10;
      id v12 = &stru_89E80;
      if (*v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v13 = v6;
        uint64_t v14 = a3;
        id v15 = (char *)v10[1];
        unint64_t v16 = v25;
        if (&v15[v11] > [v25 count])
        {
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
          [v17 appendFormat:@"WARNING! targetKeyRange [%lu, %lu] for token '%@' is out of bounds.", v11, &v15[v11], v9];
          [v17 appendFormat:@"\nsourceTokens:\n%@", v5];
          [v17 appendFormat:@"\ntargetKeys:\n%@", v25];
          [v17 appendFormat:@"\ntargetKeyRangeForSourceTokens = "];
          if ([v5 count])
          {
            unint64_t v18 = 0LL;
            uint64_t v19 = v24;
            do
            {
              objc_msgSend(v17, "appendFormat:", @"[%lu, %lu]", *(v19 - 1), *v19 + *(v19 - 1));
              ++v18;
              v19 += 2;
            }

            while (v18 < (unint64_t)[v5 count]);
          }

          NSLog(@"%@", v17);
          id v20 = [v25 count];
          id v15 = (char *)[v25 count] - v11;

          unint64_t v16 = v25;
        }

        a3 = v14;
        id v6 = v13;
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "subarrayWithRange:", v11, v15));
        id v12 = (__CFString *)objc_claimAutoreleasedReturnValue([v21 componentsJoinedByString:&stru_89E80]);
      }

      __int128 v22 = objc_alloc_init(&OBJC_CLASS___TIAlignedTokens);
      -[TIAlignedTokens setSource:](v22, "setSource:", v9);
      -[TIAlignedTokens setTarget:](v22, "setTarget:", v12);
      [v6 addObject:v22];

      ++v7;
    }

    while (v7 < (unint64_t)[v5 count]);
  }

  return v6;
}

id TITokenAlignmentForKeyAlignment(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (![v12 count])
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v11 componentsJoinedByString:&stru_89E80]);
    unint64_t v18 = objc_alloc_init(&OBJC_CLASS___TIAlignedTokens);
    -[TIAlignedTokens setSource:](v18, "setSource:", &stru_89E80);
    -[TIAlignedTokens setTarget:](v18, "setTarget:", v17);
    uint64_t v23 = v18;
    uint64_t v19 = &v23;
LABEL_6:
    unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 1LL));

    goto LABEL_7;
  }

  if (![v13 count])
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v10 componentsJoinedByString:&stru_89E80]);
    unint64_t v18 = objc_alloc_init(&OBJC_CLASS___TIAlignedTokens);
    -[TIAlignedTokens setSource:](v18, "setSource:", v17);
    -[TIAlignedTokens setTarget:](v18, "setTarget:", &stru_89E80);
    __int128 v22 = v18;
    uint64_t v19 = &v22;
    goto LABEL_6;
  }

  [v12 count];
  uint64_t v14 = &v21 - 2 * __chkstk_darwin();
  TITargetKeyRangesForSourceTokens(v9, v10, v11, v12, v13, (uint64_t)v14);
  id v15 = sub_3F54C(v12, v11, (uint64_t)v14);
  unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
LABEL_7:

  return v16;
}

id TICharSequenceForTokenSequence(void *a1)
{
  id v1 = a1;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_3FA30;
  v4[3] = &unk_89880;
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v5 = v2;
  [v1 enumerateObjectsUsingBlock:v4];

  return v2;
}

void sub_3FA30(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 length];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_3FAC8;
  v5[3] = &unk_89858;
  id v6 = *(id *)(a1 + 32);
  objc_msgSend(v3, "enumerateSubstringsInRange:options:usingBlock:", 0, v4, 2, v5);
}

id sub_3FAC8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

id TIAlignedTypingSequenceForAlignedTokenSequence( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a1;
  id v12 = a2;
  id v40 = a3;
  id v39 = a4;
  id v38 = a5;
  id v37 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if ([v11 count])
  {
    uint64_t v14 = 0LL;
    id v15 = 0LL;
    while (1)
    {
      unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndex:v14]);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 source]);
      if (![v17 length]) {
        break;
      }
      unint64_t v18 = (char *)[v12 count];

      if (v15 >= v18) {
        goto LABEL_7;
      }
      uint64_t v19 = objc_alloc_init(&OBJC_CLASS___TIAlignedTyping);
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v16 source]);
      -[TIAlignedTokens setSource:](v19, "setSource:", v20);

      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v40 objectAtIndex:v15]);
      -[TIAlignedTyping setTouched:](v19, "setTouched:", v21);

      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v39 objectAtIndex:v15]);
      -[TIAlignedTyping setPredicted:](v19, "setPredicted:", v22);

      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v38 objectAtIndex:v15]);
      -[TIAlignedTyping setInlineCompletions:](v19, "setInlineCompletions:", v23);

      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v37 objectAtIndex:v15]);
      -[TIAlignedTyping setDocumentStates:](v19, "setDocumentStates:", v24);

      id v25 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndex:v15]);
      -[TIAlignedTyping setInserted:](v19, "setInserted:", v25);

      unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v16 target]);
      -[TIAlignedTokens setTarget:](v19, "setTarget:", v26);

      [v13 addObject:v19];
      ++v15;
LABEL_8:
    }

LABEL_7:
    uint64_t v19 = objc_alloc_init(&OBJC_CLASS___TIAlignedTyping);
    float v27 = (void *)objc_claimAutoreleasedReturnValue([v16 source]);
    -[TIAlignedTokens setSource:](v19, "setSource:", v27);

    float v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    -[TIAlignedTyping setTouched:](v19, "setTouched:", v28);

    float v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    -[TIAlignedTyping setDocumentStates:](v19, "setDocumentStates:", v29);

    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    -[TIAlignedTyping setInserted:](v19, "setInserted:", v30);

    id v31 = (void *)objc_claimAutoreleasedReturnValue([v16 target]);
    -[TIAlignedTokens setTarget:](v19, "setTarget:", v31);

    [v13 addObject:v19];
    goto LABEL_8;
  }

  id v15 = 0LL;
LABEL_11:
  if (v15 == [v12 count]
    || v15 == (char *)[v12 count] - 1
    && (float v32 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndex:v15]),
        float v33 = (void *)objc_claimAutoreleasedReturnValue([v32 componentsJoinedByString:&stru_89E80]),
        unsigned int v34 = [v33 isEqualToString:&stru_89E80],
        v33,
        v32,
        v34))
  {
    id v35 = v13;
  }

  else
  {
    id v35 = 0LL;
  }

  return v35;
}

id TIConcatenateAlignedTypingAtBoundaryErrors(void *a1)
{
  id v1 = a1;
  id v29 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  float v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id obj = v1;
  id v32 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v32)
  {
    uint64_t v31 = *(void *)v35;
    do
    {
      for (uint64_t i = 0LL; i != v32; uint64_t i = (char *)i + 1)
      {
        id v9 = v2;
        if (*(void *)v35 != v31) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 target]);
        int v12 = sub_3F414(v7, v11);

        if (v12)
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 source]);
          id v2 = v9;
          [v9 appendString:v13];

          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 touched]);
          [v33 addObjectsFromArray:v14];

          id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 predicted]);
          [v3 addObjectsFromArray:v15];

          unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 inlineCompletions]);
          [v4 addObjectsFromArray:v16];

          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v10 documentStates]);
          [v5 addObjectsFromArray:v17];

          unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v10 inserted]);
          [v6 addObjectsFromArray:v18];

          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v10 target]);
          [v7 appendString:v19];
        }

        else
        {
          id v2 = v9;
          if ([v9 length] || objc_msgSend(v6, "count") || objc_msgSend(v7, "length"))
          {
            id v20 = objc_alloc_init(&OBJC_CLASS___TIAlignedTyping);
            -[TIAlignedTokens setSource:](v20, "setSource:", v9);
            -[TIAlignedTyping setTouched:](v20, "setTouched:", v33);
            -[TIAlignedTyping setPredicted:](v20, "setPredicted:", v3);
            -[TIAlignedTyping setInlineCompletions:](v20, "setInlineCompletions:", v4);
            -[TIAlignedTyping setDocumentStates:](v20, "setDocumentStates:", v5);
            -[TIAlignedTyping setInserted:](v20, "setInserted:", v6);
            -[TIAlignedTokens setTarget:](v20, "setTarget:", v7);
            [v29 addObject:v20];
          }

          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v10 source]);
          [v9 setString:v21];

          [v33 removeAllObjects];
          __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v10 touched]);
          [v33 addObjectsFromArray:v22];

          [v3 removeAllObjects];
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v10 predicted]);
          [v3 addObjectsFromArray:v23];

          [v4 removeAllObjects];
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v10 inlineCompletions]);
          [v4 addObjectsFromArray:v24];

          [v5 removeAllObjects];
          id v25 = (void *)objc_claimAutoreleasedReturnValue([v10 documentStates]);
          [v5 addObjectsFromArray:v25];

          [v6 removeAllObjects];
          unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v10 inserted]);
          [v6 addObjectsFromArray:v26];

          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v10 target]);
          [v7 setString:v19];
        }
      }

      id v32 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }

    while (v32);
  }

  if ([v2 length] || objc_msgSend(v6, "count") || objc_msgSend(v7, "length"))
  {
    float v27 = objc_alloc_init(&OBJC_CLASS___TIAlignedTyping);
    -[TIAlignedTokens setSource:](v27, "setSource:", v2);
    -[TIAlignedTyping setTouched:](v27, "setTouched:", v33);
    -[TIAlignedTyping setPredicted:](v27, "setPredicted:", v3);
    -[TIAlignedTyping setInlineCompletions:](v27, "setInlineCompletions:", v4);
    -[TIAlignedTyping setDocumentStates:](v27, "setDocumentStates:", v5);
    -[TIAlignedTyping setInserted:](v27, "setInserted:", v6);
    -[TIAlignedTokens setTarget:](v27, "setTarget:", v7);
    [v29 addObject:v27];
  }

  return v29;
}

id sub_40368(void *a1, const char *a2)
{
  return [a1 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
}

id sub_4037C(void *a1)
{
  id v1 = a1;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_4040C;
  v4[3] = &unk_89880;
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v5 = v2;
  [v1 enumerateObjectsUsingBlock:v4];

  return v2;
}

void sub_4040C(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue([a2 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"]);
  [v2 addObject:v3];
}

id sub_40460(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1) {
    id v3 = v1;
  }
  else {
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  }
  id v4 = v3;

  return v4;
}

CFStringRef sub_404A8(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  unsigned int v8 = [v6 isEqualToString:v7];
  unsigned int v9 = [v5 isEqualToString:v7];

  unsigned int v10 = [v5 isEqualToString:v6];
  unsigned int v11 = [v6 containsString:@"\\b"];

  int v12 = v9 ^ 1;
  if (((v8 ^ 1) & 1) == 0 && !v12) {
    return @"RightInput_NoAutocorrection";
  }
  if (((v8 | v12) & 1) != 0)
  {
    uint64_t v14 = @"WrongInput_NoAutocorrection_NoManualCorrection";
    if (v11) {
      uint64_t v14 = @"WrongInput_NoAutocorrection_WrongManualCorrection";
    }
    if (v8 | v9) {
      id v15 = @"UnknownType";
    }
    else {
      id v15 = v14;
    }
    unint64_t v16 = @"RightInput_NoAutocorrection_WrongManualCorrection";
    if (v10) {
      unint64_t v16 = @"UnknownType";
    }
    if (v11) {
      unint64_t v16 = @"RightInput_NoAutocorrection_But_WrongResult";
    }
    else {
      return v16;
    }
  }

  else if (v11)
  {
    return @"WrongInput_NoAutocorrection_RightManualCorrection";
  }

  else
  {
    return @"WrongInput_NoAutocorrection_NoManualCorrection";
  }

CFStringRef sub_405D8(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  unsigned int v8 = [v6 isEqualToString:v7];
  unsigned int v9 = [v5 isEqualToString:v7];

  unsigned int v10 = [v5 isEqualToString:v6];
  unsigned int v11 = [v6 containsString:@"\\b"];

  int v12 = v9 ^ 1;
  if (((v8 ^ 1) & 1) == 0 && !v12) {
    return @"RightInput_NoAutocorrection";
  }
  if (((v8 | v12) & 1) != 0)
  {
    uint64_t v14 = @"UnknownType";
    id v15 = @"WrongInput_WrongAutocorrection";
    if (v10) {
      id v15 = @"WrongInput_NoAutocorrection";
    }
    if (v11) {
      id v15 = @"WrongInput_WrongManualCorrection";
    }
    else {
      unint64_t v16 = v15;
    }
    if (!v10) {
      uint64_t v14 = @"RightInput_WrongAutocorrection";
    }
    if (v11) {
      uint64_t v14 = @"RightInput_WrongAutocorrection_WrongManualCorrection";
    }
    else {
      return v14;
    }
  }

  else if (v11)
  {
    return @"WrongInput_WrongAutocorrection_RightManualCorrection";
  }

  else
  {
    return @"WrongInput_RightAutocorrection";
  }

id TIAutoCorrectionTypeCorrectedIsNotIntended(void *a1)
{
  v5[0] = @"RightInput_WrongAutocorrection";
  v5[1] = @"RightInput_WrongAutocorrection_WrongManualCorrection";
  v5[2] = @"WrongInput_NoAutocorrection";
  v5[3] = @"WrongInput_WrongAutocorrection";
  void v5[4] = @"WrongInput_WrongManualCorrection";
  void v5[5] = @"WrongInput_WrongAutocorrection_RightManualCorrection";
  id v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, 6LL));
  id v3 = [v2 containsObject:v1];

  return v3;
}

id TIAutoCorrectionTypeCorrectedIsNotIntendedAndInserted(void *a1)
{
  v5[0] = @"RightInput_WrongAutocorrection";
  v5[1] = @"WrongInput_WrongAutocorrection";
  v5[2] = @"RightInput_WrongAutocorrection_WrongManualCorrection";
  v5[3] = @"WrongInput_WrongAutocorrection_RightManualCorrection";
  id v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, 4LL));
  id v3 = [v2 containsObject:v1];

  return v3;
}

id TIAutoCorrectionTypeCorrectedIsNotInserted(void *a1)
{
  id v5 = @"WrongInput_RightAutocorrection";
  id v6 = @"RightInput_WrongAutocorrection";
  id v7 = @"WrongInput_WrongAutocorrection";
  unsigned int v8 = @"RightInput_WrongAutocorrection_WrongManualCorrection";
  unsigned int v9 = @"WrongInput_WrongAutocorrection_RightManualCorrection";
  id v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 5LL));
  id v3 = objc_msgSend(v2, "containsObject:", v1, v5, v6, v7, v8, v9);

  return v3;
}

id TIPlistFormattedAlignedTypingSequence(void *a1, char a2, char a3, char a4)
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_40A3C;
  v12[3] = &unk_898A8;
  id v13 = a1;
  char v15 = a3;
  char v16 = a2;
  char v17 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v14 = v7;
  id v8 = v13;
  [v8 enumerateObjectsUsingBlock:v12];
  unsigned int v9 = v14;
  id v10 = v7;

  return v10;
}

void sub_40A3C(uint64_t a1, void *a2, char *a3)
{
  id v5 = a2;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 source]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 inserted]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 componentsJoinedByString:&stru_89E80]);

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v5 target]);
  else {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectAtIndexedSubscript:a3 + 1]);
  }
  __int128 v37 = v10;
  uint64_t v40 = a1;
  __int128 v41 = v6;
  id v38 = v9;
  if (([v10 isAutocompleteTriggerForPreviousEntry] & 1) != 0
    || ([v5 isRevisedAutocompleteEntry] & 1) != 0)
  {
    unsigned int v11 = sub_405D8(v6, v8, v9);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
  }

  else
  {
    id v13 = sub_404A8(v6, v8, v9);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v13);
  }

  id v14 = (void *)v12;
  v42[0] = @"intended";
  char v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "source", NSMutableDictionary));
  char v16 = (void *)objc_claimAutoreleasedReturnValue([v15 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"]);
  v43[0] = v16;
  v42[1] = @"touched";
  char v17 = (void *)objc_claimAutoreleasedReturnValue([v5 touched]);
  id v18 = sub_4037C(v17);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v43[1] = v19;
  v42[2] = @"inserted";
  id v39 = v8;
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"]);
  v43[2] = v20;
  v42[3] = @"corrected";
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v5 target]);
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"]);
  v42[4] = @"autocorrectionType";
  v43[3] = v22;
  v43[4] = v14;
  __int128 v36 = v14;
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v43,  v42,  5LL));
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v35 dictionaryWithDictionary:v23]);

  if (*(_BYTE *)(v40 + 48))
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v5 documentStates]);
    [v24 setObject:v25 forKeyedSubscript:@"documentStates"];
  }

  unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v5 sourceTransliteration]);

  if (v26)
  {
    float v27 = (void *)objc_claimAutoreleasedReturnValue([v5 sourceTransliteration]);
    float v28 = (void *)objc_claimAutoreleasedReturnValue([v27 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"]);
    [v24 setObject:v28 forKeyedSubscript:@"intendedTransliteration"];
  }

  if (*(_BYTE *)(v40 + 49))
  {
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v5 predicted]);
    id v30 = sub_40460(v29);
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    [v24 setObject:v31 forKeyedSubscript:@"predicted"];
  }

  if (*(_BYTE *)(v40 + 50))
  {
    id v32 = (void *)objc_claimAutoreleasedReturnValue([v5 inlineCompletions]);
    id v33 = sub_40460(v32);
    __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    [v24 setObject:v34 forKeyedSubscript:@"inlineCompletions"];
  }

  [*(id *)(v40 + 40) addObject:v24];
}

void sub_40EC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_41438(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_417B4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_41960(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_41B20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_30:
  return v5;
}

      switch(v16)
      {
        case 0:
          *(_BYTE *)id v10 = v2[1024];
          id v10 = v8[129];
          LODWORD(v11) = v9[257];
          continue;
        case 1:
        case 7:
        case 20:
          if (qword_AA468) {
            *(_DWORD *)(*(void *)(v3[125] + 8LL * v4[126]) + 48LL) = *(unsigned __int8 *)(qword_AA468 + qword_AA460 - 1) == 10;
          }
          goto LABEL_13;
        case 2:
          if (qword_AA468) {
            *(_DWORD *)(*(void *)(v3[125] + 8LL * v4[126]) + 48LL) = *(unsigned __int8 *)(qword_AA468 + qword_AA460 - 1) == 10;
          }
          sub_54DC4(1);
          return 262LL;
        case 3:
          v78 = (const char *)qword_AA460;
          if (qword_AA468) {
            *(_DWORD *)(*(void *)(v3[125] + 8LL * v4[126]) + 48LL) = *(unsigned __int8 *)(qword_AA468 + qword_AA460 - 1) == 10;
          }
          if (!strcasecmp(v78, "set")) {
            return 263LL;
          }
          if (!strcasecmp(v78, "yes")) {
            return 260LL;
          }
          if (!strcasecmp(v78, "no")) {
            return 261LL;
          }
          v79 = v78;
LABEL_177:
          qword_AA440 = (uint64_t)strdup(v79);
          return 272LL;
        case 4:
          v80 = (const char *)qword_AA460;
          if (qword_AA468) {
            *(_DWORD *)(*(void *)(v3[125] + 8LL * v4[126]) + 48LL) = *(unsigned __int8 *)(qword_AA468 + qword_AA460 - 1) == 10;
          }
          LODWORD(qword_AA44_TIBeginMockingSingletonsWithData(0LL, 0LL, 0LL, 0LL, 1, 0) = atoi(v80);
          return 266LL;
        case 5:
        case 6:
          if (qword_AA468) {
            *(_DWORD *)(*(void *)(v3[125] + 8LL * v4[126]) + 48LL) = *(unsigned __int8 *)(qword_AA468 + qword_AA460 - 1) == 10;
          }
          sub_54E68();
          return 264LL;
        case 8:
          if (qword_AA468) {
            *(_DWORD *)(*(void *)(v3[125] + 8LL * v4[126]) + 48LL) = *(unsigned __int8 *)(qword_AA468 + qword_AA460 - 1) == 10;
          }
          v64 = 4;
          goto LABEL_133;
        case 9:
          if (qword_AA468) {
            *(_DWORD *)(*(void *)(v3[125] + 8LL * v4[126]) + 48LL) = *(unsigned __int8 *)(qword_AA468 + qword_AA460 - 1) == 10;
          }
          sub_54E68();
          qword_AA440 = (uint64_t)strndup(byte_AA470, dword_AA45C);
          dword_AA45C = 0;
          return 269LL;
        case 10:
          if (qword_AA468) {
            *(_DWORD *)(*(void *)(v3[125] + 8LL * v4[126]) + 48LL) = *(unsigned __int8 *)(qword_AA468 + qword_AA460 - 1) == 10;
          }
          v64 = 3;
          goto LABEL_133;
        case 11:
          if (qword_AA468) {
            *(_DWORD *)(*(void *)(v3[125] + 8LL * v4[126]) + 48LL) = *(unsigned __int8 *)(qword_AA468 + qword_AA460 - 1) == 10;
          }
          sub_54E68();
          qword_AA440 = (uint64_t)strndup(byte_AA470, dword_AA45C);
          dword_AA45C = 0;
          return 270LL;
        case 12:
          if (qword_AA468) {
            *(_DWORD *)(*(void *)(v3[125] + 8LL * v4[126]) + 48LL) = *(unsigned __int8 *)(qword_AA468 + qword_AA460 - 1) == 10;
          }
          v64 = 5;
          goto LABEL_133;
        case 13:
          if (qword_AA468) {
            *(_DWORD *)(*(void *)(v3[125] + 8LL * v4[126]) + 48LL) = *(unsigned __int8 *)(qword_AA468 + qword_AA460 - 1) == 10;
          }
          sub_54E68();
          qword_AA440 = (uint64_t)strndup(byte_AA470, dword_AA45C);
          dword_AA45C = 0;
          return 271LL;
        case 14:
        case 15:
          if (qword_AA468) {
            *(_DWORD *)(*(void *)(v3[125] + 8LL * v4[126]) + 48LL) = *(unsigned __int8 *)(qword_AA468 + qword_AA460 - 1) == 10;
          }
          sub_54E68();
          qword_AA440 = (uint64_t)strndup(byte_AA470, dword_AA45C);
          dword_AA45C = 0;
          return 268LL;
        case 16:
          if (qword_AA468) {
            *(_DWORD *)(*(void *)(v3[125] + 8LL * v4[126]) + 48LL) = *(unsigned __int8 *)(qword_AA468 + qword_AA460 - 1) == 10;
          }
          v65 = dword_AA3E4;
          if (dword_AA3E4 >= 1) {
            v65 = dword_AA3E4 - 1;
          }
          v66 = ((uint64_t)v65 >> 1) - 2;
          sub_54E68();
          dword_AA45C = 0;
          goto LABEL_140;
        case 17:
          v67 = qword_AA468;
          v68 = (const char *)qword_AA460;
          if (qword_AA468) {
            *(_DWORD *)(*(void *)(v3[125] + 8LL * v4[126]) + 48LL) = *(unsigned __int8 *)(qword_AA468 + qword_AA460 - 1) == 10;
          }
          if (!strcmp(v68, "\\n"))
          {
            v76 = dword_AA45C++;
            byte_AA470[v76] = 10;
          }

          else
          {
            v69 = strcmp(v68, "\\t");
            v70 = dword_AA45C;
            if (v69)
            {
              memcpy(&byte_AA470[dword_AA45C], v68 + 1, v67 - 1);
              dword_AA45C = v67 + v70 - 1;
            }

            else
            {
              ++dword_AA45C;
              byte_AA470[v70] = 9;
            }
          }

          goto LABEL_139;
        case 18:
          v71 = qword_AA468;
          v72 = (const void *)qword_AA460;
          if (qword_AA468) {
            *(_DWORD *)(*(void *)(v3[125] + 8LL * v4[126]) + 48LL) = *(unsigned __int8 *)(qword_AA468 + qword_AA460 - 1) == 10;
          }
          v73 = dword_AA45C;
          memcpy(&byte_AA470[dword_AA45C], v72, v71);
          dword_AA45C = v73 + v71;
LABEL_139:
          id v1 = (void *)&unk_AA000;
          id v2 = (_BYTE *)&unk_AA000;
          goto LABEL_140;
        case 19:
          if (qword_AA468) {
            *(_DWORD *)(*(void *)(v3[125] + 8LL * v4[126]) + 48LL) = *(unsigned __int8 *)(qword_AA468 + qword_AA460 - 1) == 10;
          }
          sub_54DC4(2);
          return 258LL;
        case 21:
          if (qword_AA468) {
            *(_DWORD *)(*(void *)(v3[125] + 8LL * v4[126]) + 48LL) = *(unsigned __int8 *)(qword_AA468 + qword_AA460 - 1) == 10;
          }
          return 265LL;
        case 22:
          v79 = (const char *)qword_AA460;
          if (qword_AA468) {
            *(_DWORD *)(*(void *)(v3[125] + 8LL * v4[126]) + 48LL) = *(unsigned __int8 *)(qword_AA468 + qword_AA460 - 1) == 10;
          }
          goto LABEL_177;
        case 23:
          if (qword_AA468) {
            *(_DWORD *)(*(void *)(v3[125] + 8LL * v4[126]) + 48LL) = *(unsigned __int8 *)(qword_AA468 + qword_AA460 - 1) == 10;
          }
          sub_54E68();
          return 259LL;
        case 24:
          if (qword_AA468) {
            *(_DWORD *)(*(void *)(v3[125] + 8LL * v4[126]) + 48LL) = *(unsigned __int8 *)(qword_AA468 + qword_AA460 - 1) == 10;
          }
          return 264LL;
        case 25:
          v81 = (const char *)qword_AA460;
          if (qword_AA468) {
            *(_DWORD *)(*(void *)(v3[125] + 8LL * v4[126]) + 48LL) = *(unsigned __int8 *)(qword_AA468 + qword_AA460 - 1) == 10;
          }
          qword_AA440 = (uint64_t)strdup(v81);
          return 267LL;
        case 26:
          if (qword_AA468) {
            *(_DWORD *)(*(void *)(v3[125] + 8LL * v4[126]) + 48LL) = *(unsigned __int8 *)(qword_AA468 + qword_AA460 - 1) == 10;
          }
          v64 = 7;
          goto LABEL_133;
        case 27:
          if (qword_AA468) {
            *(_DWORD *)(*(void *)(v3[125] + 8LL * v4[126]) + 48LL) = *(unsigned __int8 *)(qword_AA468 + qword_AA460 - 1) == 10;
          }
          v64 = 6;
LABEL_133:
          sub_54DC4(v64);
          goto LABEL_140;
        case 28:
          v74 = qword_AA468;
          v75 = (const void *)qword_AA460;
          if (qword_AA468) {
            *(_DWORD *)(*(void *)(v3[125] + 8LL * v4[126]) + 48LL) = *(unsigned __int8 *)(qword_AA468 + qword_AA460 - 1) == 10;
          }
          fwrite(v75, v74, 1uLL, (FILE *)qword_AA450);
LABEL_140:
          id v8 = (void *)&unk_AA000;
          unsigned int v9 = (_DWORD *)&unk_AA000;
          goto LABEL_13;
        case 29:
          uint64_t v21 = qword_AA460;
          *(_BYTE *)id v10 = v2[1024];
          __int128 v22 = v3[125];
          uint64_t v23 = v4[126];
          uint64_t v24 = *(void *)(v22 + 8 * v23);
          if (*(_DWORD *)(v24 + 64))
          {
            id v25 = qword_AA410;
          }

          else
          {
            id v25 = *(void *)(v24 + 32);
            qword_AA410 = v25;
            *(void *)uint64_t v24 = qword_AA448;
            uint64_t v24 = *(void *)(v22 + 8 * v23);
            *(_DWORD *)(v24 + 64) = 1;
          }

          unint64_t v26 = v1[127];
          float v27 = *(_BYTE **)(v24 + 8);
          if (v26 <= (unint64_t)&v27[v25])
          {
            id v10 = qword_AA460 + ~v21 + (int)v10;
            v1[127] = v10;
            LODWORD(v11) = sub_54EB8();
            unsigned int v9 = (int *)&unk_AA000;
            id v8 = &unk_AA000;
            if (word_8276C[(int)v11])
            {
              dword_AA404 = v11;
              qword_AA408 = v10;
            }

            v60 = (int)v11;
            v61 = word_8295A[(int)v11] + 1LL;
            id v4 = (void *)&unk_AA000;
            id v3 = (void *)&unk_AA000;
            id v2 = (_BYTE *)&unk_AA000;
            if ((_DWORD)v11 != (__int16)word_82810[v61])
            {
              do
              {
                v62 = (unsigned __int16)word_82A08[v60];
                v60 = (__int16)v62;
                v61 = word_8295A[(__int16)v62] + 1LL;
              }

              while (v62 != word_82810[v61]);
            }

            v85 = qword_AA460;
            if (v61)
            {
              v63 = (unsigned __int16)word_82AD0[v61];
              if (v63 != 81)
              {
                LODWORD(v11) = (__int16)v63;
                v1[127] = ++v10;
                goto LABEL_14;
              }
            }

            continue;
          }

          v84 = v21;
          float v28 = (char *)qword_AA460;
          if (!*(_DWORD *)(v24 + 60))
          {
            id v4 = (void *)&unk_AA000;
            id v3 = (void *)&unk_AA000;
            if (v26 - qword_AA460 != 1) {
              goto LABEL_91;
            }
            goto LABEL_83;
          }

          id v29 = ~(_DWORD)qword_AA460 + v26;
          if (v29 >= 1)
          {
            id v30 = ~(_DWORD)qword_AA460 + v26;
            do
            {
              uint64_t v31 = *v28++;
              *v27++ = v31;
              --v30;
            }

            while (v30);
            uint64_t v24 = *(void *)(v22 + 8 * v23);
          }

          if (*(_DWORD *)(v24 + 64) == 2)
          {
            qword_AA410 = 0LL;
            goto LABEL_43;
          }

          __int128 v34 = ~v29;
          id v35 = *(_DWORD *)(v24 + 24);
          __int128 v36 = v35 + ~v29;
          v82 = v29;
          if (!v36)
          {
            do
            {
              if (!*(_DWORD *)(v24 + 40))
              {
                *(void *)(v24 + _Block_object_dispose((const void *)(v1 - 136), 8) = 0LL;
LABEL_192:
                sub_5505C("fatal error - scanner input buffer overflow");
              }

              __int128 v37 = v23;
              id v38 = v22;
              id v39 = *(void **)(v24 + 8);
              uint64_t v40 = 2 * v35;
              *(_DWORD *)(v24 + 24) = v40;
              __int128 v41 = realloc(v39, v40 + 2);
              *(void *)(v24 + _Block_object_dispose((const void *)(v1 - 136), 8) = v41;
              if (!v41) {
                goto LABEL_192;
              }
              unint64_t v26 = (unint64_t)v41 + (int)v26 - (int)v39;
              qword_AA3F8 = v26;
              __int128 v22 = v38;
              uint64_t v23 = v37;
              uint64_t v24 = *(void *)(v22 + 8 * v37);
              id v35 = *(_DWORD *)(v24 + 24);
              __int128 v36 = v35 + v34;
            }

            while (!(v35 + v34));
            id v29 = v82;
          }

          if (v36 >= 0x2000) {
            uint64_t v42 = 0x2000LL;
          }
          else {
            uint64_t v42 = v36;
          }
          int v43 = *(_DWORD *)(v24 + 44);
          uint64_t v44 = v29;
          if (!v43)
          {
            v48 = v29;
            *__error() = 0;
            v49 = fread( (void *)(*(void *)(*(void *)(qword_AA3E8 + 8 * qword_AA3F0) + 8LL) + v48),  1uLL,  v42,  (FILE *)qword_AA448);
            id v32 = (int)v49;
            qword_AA410 = (int)v49;
            id v8 = (void *)&unk_AA000;
            unsigned int v9 = (_DWORD *)&unk_AA000;
            uint64_t v45 = (void *)&unk_AA000;
            if (v49 << 32) {
              goto LABEL_74;
            }
            while (ferror((FILE *)qword_AA448))
            {
              if (*__error() != 4) {
                goto LABEL_195;
              }
              *__error() = 0;
              clearerr((FILE *)qword_AA448);
              v50 = fread( (void *)(*(void *)(*(void *)(qword_AA3E8 + 8 * qword_AA3F0) + 8LL) + v44),  1uLL,  v42,  (FILE *)qword_AA448);
              id v32 = (int)v50;
              qword_AA410 = (int)v50;
              if (v50 << 32)
              {
                id v8 = (void *)&unk_AA000;
                unsigned int v9 = (_DWORD *)&unk_AA000;
                uint64_t v45 = (void *)&unk_AA000;
                goto LABEL_74;
              }
            }

            __int128 v22 = qword_AA3E8;
            uint64_t v23 = qword_AA3F0;
            uint64_t v24 = *(void *)(qword_AA3E8 + 8 * qword_AA3F0);
            id v8 = (void *)&unk_AA000;
            unsigned int v9 = (_DWORD *)&unk_AA000;
            id v29 = v82;
LABEL_43:
            *(void *)(v24 + 32) = 0LL;
            if (!v29) {
              goto LABEL_77;
            }
LABEL_44:
            id v32 = 0LL;
            id v33 = 2;
            *(_DWORD *)(v24 + 64) = 2;
            goto LABEL_78;
          }

          id v32 = 0LL;
          uint64_t v45 = &unk_AA000;
          while (1)
          {
            v46 = getc((FILE *)qword_AA448);
            uint64_t v47 = v46 == -1 || v46 == 10;
            if (v47) {
              break;
            }
            *(_BYTE *)(*(void *)(*(void *)(qword_AA3E8 + 8 * qword_AA3F0) + 8LL) + v44 + v32++) = v46;
            if (v42 == v32)
            {
              id v32 = v42;
              break;
            }
          }

          if (v46 == -1)
          {
            v51 = ferror((FILE *)qword_AA448);
            id v8 = (void *)&unk_AA000;
            unsigned int v9 = (_DWORD *)&unk_AA000;
            if (v51) {
LABEL_195:
            }
              sub_5505C("input in flex scanner failed");
          }

          else
          {
            if (v46 == 10) {
              *(_BYTE *)(*(void *)(*(void *)(qword_AA3E8 + 8 * qword_AA3F0) + 8LL) + v44 + v32++) = 10;
            }
            id v8 = (void *)&unk_AA000;
            unsigned int v9 = (_DWORD *)&unk_AA000;
          }

          qword_AA410 = v32;
LABEL_74:
          __int128 v22 = qword_AA3E8;
          uint64_t v23 = v45[126];
          uint64_t v24 = *(void *)(qword_AA3E8 + 8 * v23);
          *(void *)(v24 + 32) = v32;
          if (v32)
          {
            id v33 = 0;
            id v29 = v82;
            goto LABEL_78;
          }

          id v29 = v82;
          if (v82) {
            goto LABEL_44;
          }
LABEL_77:
          uint64_t v52 = v29;
          sub_54FB0((FILE *)qword_AA448);
          id v29 = v52;
          unsigned int v9 = (_DWORD *)&unk_AA000;
          id v8 = (void *)&unk_AA000;
          id v32 = qword_AA410;
          __int128 v22 = qword_AA3E8;
          uint64_t v23 = qword_AA3F0;
          uint64_t v24 = *(void *)(qword_AA3E8 + 8 * qword_AA3F0);
          id v33 = 1;
LABEL_78:
          v53 = v32 + v29;
          if (v53 <= *(int *)(v24 + 24))
          {
            uint64_t v58 = *(void *)(v24 + 8);
          }

          else
          {
            uint64_t v54 = v53 + (v32 >> 1);
            v55 = *(void **)(v24 + 8);
            v56 = v22;
            *(void *)(*(void *)(v22 + 8 * v23) + 8LL) = realloc(v55, v54);
            v57 = *(void *)(v56 + 8 * v23);
            uint64_t v58 = *(void *)(v57 + 8);
            if (!v58) {
              sub_5505C("out of dynamic memory in yy_get_next_buffer()");
            }
            __int128 v22 = v56;
            *(_DWORD *)(v57 + 24) = v54 - 2;
            id v8 = (void *)&unk_AA000;
            unsigned int v9 = (_DWORD *)&unk_AA000;
          }

          qword_AA410 = v53;
          *(_BYTE *)(v58 + v53) = 0;
          *(_BYTE *)(v53 + *(void *)(*(void *)(v22 + 8 * v23) + 8LL) + 1) = 0;
          float v28 = *(char **)(*(void *)(v22 + 8 * v23) + 8LL);
          qword_AA460 = (uint64_t)v28;
          id v4 = &unk_AA000;
          id v3 = &unk_AA000;
          id v1 = &unk_AA000;
          if (v33 == 1)
          {
LABEL_83:
            v1[127] = v28;
            v59 = dword_AA3E4;
            if (dword_AA3E4 >= 1) {
              v59 = dword_AA3E4 - 1;
            }
            char v16 = (v59 >> 1) + 30;
            id v2 = (_BYTE *)&unk_AA000;
            goto LABEL_30;
          }

          if (v33)
          {
            uint64_t v47 = v33 == 2;
            id v2 = (_BYTE *)&unk_AA000;
            if (!v47) {
              goto LABEL_13;
            }
            float v27 = *(_BYTE **)(*(void *)(qword_AA3E8 + 8 * qword_AA3F0) + 8LL);
            id v25 = qword_AA410;
LABEL_91:
            id v10 = (uint64_t)&v27[v25];
            v1[127] = &v27[v25];
            LODWORD(v11) = sub_54EB8();
            unsigned int v9 = (_DWORD *)&unk_AA000;
            id v8 = (void *)&unk_AA000;
            v85 = qword_AA460;
            id v2 = (_BYTE *)&unk_AA000;
            continue;
          }

          id v10 = (uint64_t)&v28[~v84 + (int)v10];
          qword_AA3F8 = v10;
          LODWORD(v11) = sub_54EB8();
          unsigned int v9 = (_DWORD *)&unk_AA000;
          id v8 = (void *)&unk_AA000;
          v85 = qword_AA460;
          id v2 = (_BYTE *)&unk_AA000;
          break;
        case 30:
        case 31:
        case 32:
        case 33:
        case 34:
        case 35:
        case 36:
        case 37:
          return 0LL;
        default:
          sub_5505C("fatal flex scanner internal error--no action found");
      }

      break;
    }
  }

void sub_41F48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_42054(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_42494(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double sub_42508(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double v5 = a5;
  double v6 = a2 / (*(double *)(*(void *)(a1 + 32) + 112LL) * a3);
  double v7 = 0.0;
  if (v6 > 1.0)
  {
    double v8 = a4 + 1.0;
    double v9 = (1.0 - pow(a5, a4 + 1.0)) / (1.0 - a5);
    double v10 = v5;
    if (v9 > v6)
    {
      double v10 = v5;
      do
        double v10 = v10 * 0.5;
      while ((1.0 - pow(v10, v8)) / (1.0 - v10) > v6);
    }

    if (v9 < v6)
    {
      do
        double v5 = v5 + v5;
      while ((1.0 - pow(v5, v8)) / (1.0 - v5) < v6);
    }

    while (1)
    {
      double v7 = (v10 + v5) * 0.5;
      double v11 = (1.0 - pow(v7, v8)) / (1.0 - v7);
      if (vabdd_f64(v6, v11) <= 0.0001) {
        break;
      }
      if (v11 > v6) {
        double v5 = (v10 + v5) * 0.5;
      }
      else {
        double v10 = (v10 + v5) * 0.5;
      }
    }
  }

  return v7;
}

void sub_42818(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double sub_428AC(uint64_t a1, uint64_t a2, double *a3)
{
  double v5 = *a3;
  if (*a3 == 1.0)
  {
    double v6 = (double)sub_11770(a2);
    unsigned int v7 = sub_11770(a2);
    double v8 = -log((v6 + (double)v7 * 4294967300.0) * -5.42101086e-20 + 1.0);
  }

  else if (*a3 <= 1.0)
  {
    double v22 = 1.0 - v5;
    do
    {
      while (1)
      {
        double v23 = (double)sub_11770(a2);
        double v24 = (v23 + (double)sub_11770(a2) * 4294967300.0) * 5.42101086e-20 + 0.0;
        double v25 = (double)sub_11770(a2);
        unsigned int v26 = sub_11770(a2);
        double v27 = -log(1.0 - (v25 + (double)v26 * 4294967300.0) * 5.42101086e-20);
        if (v24 <= v22) {
          break;
        }
        double v28 = log((1.0 - v24) / v5);
        double v8 = pow(v22 - v5 * v28, 1.0 / v5);
        if (v8 <= v27 - v28) {
          return v8 * a3[1];
        }
      }

      double v29 = pow(v24, 1.0 / v5);
    }

    while (v29 > v27);
    double v8 = v29;
  }

  else
  {
    double v10 = v5 + -1.0;
    double v11 = v5 * 3.0 + -0.75;
    while (1)
    {
      do
      {
        double v12 = (double)sub_11770(a2);
        double v13 = (v12 + (double)sub_11770(a2) * 4294967300.0) * 5.42101086e-20 + 0.0;
        unsigned int v14 = sub_11770(a2);
        unsigned int v15 = sub_11770(a2);
        double v16 = v13 * (1.0 - v13);
      }

      while (v16 == 0.0);
      double v17 = (v13 + -0.5) * sqrt(v11 / v16);
      double v8 = v10 + v17;
      if (v10 + v17 >= 0.0)
      {
        double v18 = ((double)v14 + (double)v15 * 4294967300.0) * 5.42101086e-20 + 0.0;
        double v19 = v18 * (v18 * (v16 * (v16 * (v16 * 64.0))));
        if (v19 <= 1.0 - v17 * (v17 + v17) / v8) {
          break;
        }
        double v20 = log(v19);
        double v21 = log(v8 / v10);
        if (v20 <= -(v17 - v10 * v21) - (v17 - v10 * v21)) {
          break;
        }
      }
    }
  }

  return v8 * a3[1];
}

double sub_42B18(uint64_t a1, uint64_t a2, double *a3)
{
  if (*(_BYTE *)(a1 + 24))
  {
    *(_BYTE *)(a1 + 24) = 0;
    double v5 = *(double *)(a1 + 16);
  }

  else
  {
    do
    {
      do
      {
        double v7 = (double)sub_11770(a2);
        double v8 = (v7 + (double)sub_11770(a2) * 4294967300.0) * 5.42101086e-20 * 2.0 + -1.0;
        double v9 = (double)sub_11770(a2);
        double v10 = (v9 + (double)sub_11770(a2) * 4294967300.0) * 5.42101086e-20 * 2.0 + -1.0;
        double v11 = v10 * v10 + v8 * v8;
      }

      while (v11 > 1.0);
    }

    while (v11 == 0.0);
    double v12 = sqrt(log(v10 * v10 + v8 * v8) * -2.0 / v11);
    *(double *)(a1 + 16) = v10 * v12;
    *(_BYTE *)(a1 + 24) = 1;
    double v5 = v8 * v12;
  }

  return *a3 + v5 * a3[1];
}

uint64_t sub_42C30()
{
  fwrite( "\tKEYBOARD_WIDTH --\n\t\tKeyboard width (iPhone5 portrait = 320).  Default is 320.\n\n",  0x50uLL,  1uLL,  __stdoutp);
  fwrite("-O orientation\t", 0xFuLL, 1uLL, __stdoutp);
  fwrite( "\tKEYBOARD_ORIENTATION --\n\t\tKeyboard orientation: 'Portrait' or 'Landscape'.  Default is 'Portrait'.\n\n",  0x65uLL,  1uLL,  __stdoutp);
  fwrite("-o\t", 3uLL, 1uLL, __stdoutp);
  fwrite("\tOUTPATH: Output directory\n\n", 0x1CuLL, 1uLL, __stdoutp);
  fwrite("-i\t", 3uLL, 1uLL, __stdoutp);
  fwrite("\tSTART_INDEX: Index of first test case to run. Default is 1 (all test cases).\n\n", 0x4FuLL, 1uLL, __stdoutp);
  fwrite("-N\t", 3uLL, 1uLL, __stdoutp);
  fwrite("\tEND_INDEX: Index of last test case to run. Default is NIL (all test cases).\n\n", 0x4EuLL, 1uLL, __stdoutp);
  fwrite("-f\t", 3uLL, 1uLL, __stdoutp);
  fwrite( "\tPRINT_TYPING_TRANSCRIPT: Print each steps action/keytap and resulting text state to stdout.\n\n",  0x5EuLL,  1uLL,  __stdoutp);
  fwrite("-C\t", 3uLL, 1uLL, __stdoutp);
  fwrite("\tSHOW_CANDIDATE_BAR: Print the candidate bar before each step to stdout.\n\n", 0x4AuLL, 1uLL, __stdoutp);
  fwrite("-x\t", 3uLL, 1uLL, __stdoutp);
  fwrite( "\tTRANSLITERATION_SUMMARIES: For transliteration modes, at the end of each test case, print the Latin stdout, the in tended native script text, and the actual native script text to stdout.\n \n",  0xBCuLL,  1uLL,  __stdoutp);
  fwrite("-b\t", 3uLL, 1uLL, __stdoutp);
  fwrite("\tPLAYBACK: Path to playback JSON file in keyboardanalytics testcase format.\n\n", 0x4DuLL, 1uLL, __stdoutp);
  fwrite("Conversation Config Options (provide via -j):\n", 0x2EuLL, 1uLL, __stdoutp);
  fwrite("\tCONVERSATIONS_TEST_FILE: Path to conversations file (json format).\n\n", 0x45uLL, 1uLL, __stdoutp);
  fwrite( "\tCONVERSATION_SENDERS_TO_TEST: List of senders to test typing for. Only messages from these senders will generate r esults in the output. Messages from other senders will only influence adaptation.\n \n",  0xC6uLL,  1uLL,  __stdoutp);
  fwrite( "\tCONVERSATION_ADAPT_TO_SENT_MESSAGES: Adapt to sent messages in conversations. Requires USES_ADAPTATION set to true.\n\n",  0x76uLL,  1uLL,  __stdoutp);
  fwrite( "\tCONVERSATION_ADAPT_TO_RECEIVED_MESSAGES: Adapt to received messages in conversations. Requires USES_ADAPTATION set to true.\n\n",  0x7EuLL,  1uLL,  __stdoutp);
  fwrite("Rest of Config Options:\n", 0x18uLL, 1uLL, __stdoutp);
  fwrite("\t\tNUM_TRIALS --\n\t\tThe number of independent trials to run.  Default is 1.\n\n", 0x4BuLL, 1uLL, __stdoutp);
  fwrite( "\t\tSPACE_HORIZONTAL_ERROR_BIAS --\n \t\tIf 0, use the horizontal space key center for touch error calculation. If 1, distribute the horizontal origin al ong the width of the space bar (with margins equal to 1/2 key height; If 2, bias the horizontal origin to the right "
    "side of the space bar. If 3, bias the horizontal origin to the left side of the space bar. \x13Default is 1.\n"
    "\n",
    0x172uLL,
    1uLL,
    __stdoutp);
  fwrite( "\t\tSPACE_VERTICAL_ERROR_BIAS --\n \t\tA bias to be applied to the space bar touch error calculation to simulate suspected user behavior. Expressed as a fraction of the key height (e.g., .5 would bias to the top of the space bar).\n \n",  0xE2uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tPROB_SPACE_INSTEAD_OF_BOTTOM_ROW --\n \t\tProbability of half-key height added to a bottom key tap in the spacebar direction. Limited by MAX_SPACE_ERRORS_PER_TEST\n\n",  0xA2uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tPROB_SPACE_REPLACED_BY_BOTTOM_ROW --\n \t\tProbability of half-key height subtracted from a space bar tap in the direction of the bottom key row. Limited b y MAX_SPACE_ERRORS_PER_TEST. Use SPACE_HORIZONTAL_ERROR_BIAS=1 to get realistic substitutions.\n \n",  0xF9uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tMAX_SPACE_ERRORS_PER_TEST --\n \t\t Max count of cumulative errors using PROB_SPACE_INSTEAD_OF_BOTTOM_ROW and PROB_SPACE_REPLACED_BY_BOTTOM_ROW settings. \n\n",  0x9AuLL,  1uLL,  __stdoutp);
  fwrite( "\t\tWORD_LEARNING_ENABLED --\n \t\tIf nonzero, the keyboard performs online adaptation to typing.  Default is 0.\n \n",  0x6CuLL,  1uLL,  __stdoutp);
  fwrite( "\t\tNEGATIVE_LEARNING_ENABLED --\n \t\tIf nonzero, the keyboard performs negative learning in response to rejected autocorrections.  Default is 0.\n \n",  0x8EuLL,  1uLL,  __stdoutp);
  fwrite( "\t\tUSES_ADAPTATION --\n \t\tReplaces deprecated 'USE_WORD_NGRAM_MODEL_ADAPTATION'. If nonzero, adaptation resources are loaded and used in b eam search and to compute probabilities. If 'WORD_LEARNING_ENABLED' switch is on, it implies that 'USES_ADAPTATION' switch is on too. Otherwise, default is 0.\n \n",  0x127uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tUSE_LANGUAGE_MODEL --\n \t\tUse this flag to override UIKeyboardHasWordNgramModel value from InputMode_xx.plist.\n \n",  0x70uLL,  1uLL,  __stdoutp);
  fwrite("\t\tUSE_WORD_NGRAM_MODEL --\n\t\tDeprecated, see USE_LANGUAGE_MODEL instead.\n\n", 0x49uLL, 1uLL, __stdoutp);
  fwrite( "\t\tTOUCAN_LM_MODE --\n \t\tControls to which extent new generation neural lm with open vocabulary is enabled (requires presence of respecti ve LM assets on the system or passed via custom path). If 0, 'Toucan' lm is disabled. If 1, 'Toucan' lm is enabled f or completions/predictions. If 2, 'Toucan' lm is enabled for autocorrections.\n \n",  0x149uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tMAX_WORDS_PER_PREDICTION --\n \t\tMaximum words predidicted when autocorrection lists enabled.  Default is 1.\n \n",  0x6DuLL,  1uLL,  __stdoutp);
  fwrite( "\t\tMAX_PREDICTIONS_REPORTED --\n \t\tMaximum prediction to report for every key stroke.  Default is 0, in  which case nothing is reported\n \n",  0x86uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tMAX_INLINE_COMPLETIONS_REPORTED --\n \t\tMaximum inline completions to report for every key stroke.  Default is 0, in  which case nothing is reported\n \n",  0x95uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tLOG_DOCUMENT_CONTEXT --\n \t\tInclude document context before each input in the output report.  Default is NO.\n \n",  0x6EuLL,  1uLL,  __stdoutp);
  fwrite( "\t\tKEYSTROKE_SEGMENTATION_MODE --\n \t\tSpecify mode for segmenting keystrokes according to intended tokens: 'none', 'typinglog', 'alignment'. Default i s 'typinglog'.\n \n",  0xA3uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tWARN_IF_SELECTING_POPUP_VARIANT --\n \t\tIf nonzero, warn when typer selects a popup variant (may indicate keyboard layout mis-configuration).  Default is 0.\n\n",  0x9DuLL,  1uLL,  __stdoutp);
  fwrite( "\t\tSIRI_MODE --\n\t\tIf nonzero, run in SIRI MODE (aka as if invoked from type-to-siri).  Default is 0.\n\n",  0x65uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tUSE_AUTOCORRECTION --\n\t\tIf nonzero, enable autocorrection.  Default is 1.\n\n",  0x4DuLL,  1uLL,  __stdoutp);
  fwrite( "\t\tUSE_RETROCORRECTION --\n\t\tIf nonzero, enable retrocorrection.  Default is 0.\n\n",  0x4FuLL,  1uLL,  __stdoutp);
  fwrite( "\t\tUSE_AUTOCAPITALIZATION --\n\t\tIf nonzero, use autocapitalization.  Default is 1.\n\n",  0x52uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tUSE_PREDICTION --\n\t\tIf nonzero, enabled predictions and completions.  Default is 0.\n\n",  0x57uLL,  1uLL,  __stdoutp);
  fwrite("\t\tAUTOCORRECTION_LISTS --\n\t\tDEPRECATED in favor of USE_PREDICTION.\n\n", 0x44uLL, 1uLL, __stdoutp);
  fwrite( "\t\tMAX_PREDICTIONS --\n\t\tMaximum number of predictions displayed in UI.  Default is 3.\n\n",  0x56uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tMULTILINGUAL_ENABLED --\n\t\tIf nonzero, enable multilingual keyboards.  Default is 0.\n\n",  0x57uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tKEYBOARD_SECOND_LANGUAGE --\n \t\t.If multilingual enabled, manually configure second langauge, i.e. 'fr_FR', 'de_DE'. Default is None.\n \n",  0x87uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tBASE_KEY_FOR_VARIANTS --\n \t\tIf nonzero, type base letter if diacritic variant is not available.  Default is 1.\n \n",  0x71uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tPREFERS_TRANSLITERATION--\n \t\tIf nonzero, typing model user types transliteration and chooses native words from prediction bar. The input is e xpected in playback or tansliterated formats. Default is 0.\n \n",  0xCBuLL,  1uLL,  __stdoutp);
  fwrite( "\t\tUSE_PARTIAL_CANDIDATES --\n \t\tIf nonzero, the transliteration model will attempt to select partial candidates if the intended string is not vi sible. Only valid when transliteration is enabled. Default is 0.\n \n",  0xD0uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tTEST_SENTENCE_TRANSLITERATION--\n \t\tIf nonzero, the expected input and its transliteration will be combined into a single word with no spaces, so th e sentence is just the catentation of its words. Default is 0.\n \n",  0xD4uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tTRANSLITERATE_WITH_SPACES--\n \t\tSet to 1 when transliterating a language that uses spaces to separate words/syllables (languages other than Chin ese/Japanese/Thai).\n \n",  0xA5uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tPREFERS_CONTINUOUS_PATH--\n \t\tIf nonzero, typing model user prefers to enter text using continuous path.  Default is 0.\n \n",  0x79uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tCONTINUOUS_PATH_ENABLED--\n\t\tIf YES, enable continuous path playback. Default is YES.",  0x56uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tCONTINUOUS_PATH_GENERATOR--\n \t\tString representing the preferred path generator. Valid values are TYPIST or SIMPLE. Used only if PREFER S_CONTINUOUS_PATH is non-zero. If not set, then the default SIMPLE generator is used.\n \n",  0xE3uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tCONTINUOUS_PATH_APPEND_SPACE--\n \t\tIf nonzero, a space is automatically appended to each continuous path conversion. Otherwise, space is prepended prior to conversion, if necessary. Default is 0.\n \n",  0xC5uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tCONTINUOUS_PATH_ALGORITHMS--\n \t\tA number describing the bitmask of enabled algorithms for continuous path. Fav=1, ML=2, ShapeMatch=4, StoreShape s=8, ChineseML=16. Default is Favonius only.\n \n",  0xBFuLL,  1uLL,  __stdoutp);
  fwrite( "\t\tENABLE_CONTINUOUS_PATH_RETROCORRECTION--\n \t\tEnable retrocorrection for continuous path input. Default=YES.\n \n",  0x6DuLL,  1uLL,  __stdoutp);
  fwrite( "\t\tALPHA--\n \t\tfloat value [0.0, 1.0]. The knot parameterization used in TTKTypistContinuousPathGenerator. Used only if CONTINU OUS_PATH_GENERATOR is TYPIST. If not set, then the default centripetal value (0.5) is used.\n \n",  0xDBuLL,  1uLL,  __stdoutp);
  fwrite( "\t\tPREFERS_PREDICTION_SELECTION --\n \t\tIf nonzero, typing model user prefers to select candidates from prediction bar UI.  Default is 0.\n \n",  0x87uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tPREFERS_AUTOCORRECTION_LISTS --\n\t\tDEPRECATED in favor of PREFERS_PREDICTION_SELECTION.\n\n",  0x5AuLL,  1uLL,  __stdoutp);
  fwrite( "\t\tPREFERS_SPACEBAR_DOUBLETAP --\n \t\tIf nonzero, typing model prefers spacebar double-tap to end sentence (TODO: Not yet implemented!).  Default is 0.\n\n",  0x95uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tPREFERS_TO_CORRECT_ERRORS --\n \t\tIf nonzero, typer prefers to correct errors by backspacing or rejecting autocorrections.  Default is YES.\n \n",  0x8CuLL,  1uLL,  __stdoutp);
  fwrite( "\t\tPREFERS_AUTOCORRECT_WITH_REVISION --\n \t\tIf YES, will prefer to use autocorrection but will revise manually if autocorrection is bad. Equivalent to PREFE RS_TO_CORRECT_ERRORS=YES, PROB_BEGIN_CORRECTING_AFTER_WORD_TERMINATOR=1.0, PROB_REJECT_BAD_AUTOCORRECTION=1 and over rides other values.\n \n",  0x122uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tPREFERS_AUTOCORRECT_FOR_CAPS --\n \t\tIf nonzero, typer prefers to rely on autocorrect for capitalizing words.  Default is 0.\n \n",  0x7DuLL,  1uLL,  __stdoutp);
  fwrite( "\t\tPREFERS_AUTOCORRECT_FOR_APOSTROPHES --\n \t\tIf nonzero, typer prefers to rely on autocorrect for inserting word-medial apostrophes.  Default is 0.\n \n",  0x93uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tAVERAGE_KEY_TAPS_PER_SECOND --\n\t\tThe average number of key taps per second.  Default is 5/sec (~60wpm).\n\n",  0x6BuLL,  1uLL,  __stdoutp);
  fwrite( "\t\tMAX_PRIOR_SEGMENTS_CHECKED_FOR_ERRORS --\n \t\tIf PREFERS_TO_CORRECT_ERRORS=YES, the maximum input segments prior to current segment checked by typist for erro rs.  Default is 2.\n \n",  0xB1uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tPROB_BEGIN_CORRECTING_AFTER_WORD --\n \t\tIf PREFERS_TO_CORRECT_ERRORS=YES, the probability of starting to correct a typo before typing a word terminator. Default is 0.0.\n \n",  0xABuLL,  1uLL,  __stdoutp);
  fwrite( "\t\tPROB_BEGIN_CORRECTING_AFTER_WORD_TERMINATOR --\n \t\tIf PREFERS_TO_CORRECT_ERRORS=YES, the probability of starting to correct typos after a word terminator.  Default is 0.0.\n\n",  0xADuLL,  1uLL,  __stdoutp);
  fwrite( "\t\tPROB_REJECT_BAD_AUTOCORRECTION --\n \t\tIf PREFERS_TO_CORRECT_ERRORS=YES, the probability of rejecting a bad autocorrection if the typed string is the i ntended text.  Default is 0.0\n \n",  0xB5uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tPROB_TRANSPOSE_LETTERS --\n\t\tProbability that keystrokes for two letters are transposed.  Default is 0.\n\n",  0x6AuLL,  1uLL,  __stdoutp);
  fwrite( "\t\tPROB_TRANSPOSE_LETTER_AND_SPACE --\n \t\tProbability that keystrokes for letter and space are transposed.  Default is 0.\n \n",  0x78uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tPROB_SKIP_LETTER --\n\t\tProbability that non-word-initial letter is skipped.  Default is 0.\n\n",  0x5DuLL,  1uLL,  __stdoutp);
  fwrite( "\t\tPROB_SKIP_REPEAT_LETTER --\n\t\tProbability that repeated letter is skipped.  Default is 0.\n\n",  0x5CuLL,  1uLL,  __stdoutp);
  fwrite( "\t\tPROB_SKIP_INITIAL_LETTER --\n\t\tProbability that word-initial letter is skipped.  Default is 0.\n\n",  0x61uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tPROB_SKIP_SPACE --\n\t\tProbability that space key is skipped.  Default is 0.\n\n",  0x4EuLL,  1uLL,  __stdoutp);
  fwrite( "\t\tPROB_DOUBLE_TAP_LETTER --\n\t\tProbability that non-word-initial letter is doubled.  Default is 0.\n\n",  0x63uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tPROB_DOUBLE_TAP_INITIAL_LETTER --\n\t\tProbability that word-initial letter is doubled.  Default is 0.\n\n",  0x67uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tPROB_SUBSTITUTE_LETTER --\n \t\tProbability that some arbitrary key substitutes for non-word-initial letter.  Default is 0.\n \n",  0x7BuLL,  1uLL,  __stdoutp);
  fwrite( "\t\tPROB_SUBSTITUTE_INITIAL_LETTER --\n \t\tProbability that some arbitrary key substitutes for word-initial letter.  Default is 0.\n \n",  0x7FuLL,  1uLL,  __stdoutp);
  fwrite( "\t\tPROB_SUBSTITUTE_SPACE --\n\t\tProbability that some arbitrary key substitutes for space.  Default is 0.\n\n",  0x68uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tPROB_EXTRANEOUS_KEY --\n \t\tProbability that extraneous keystoke is inserted before non-word-initial letter.  Default is 0.\n \n",  0x7CuLL,  1uLL,  __stdoutp);
  fwrite( "\t\tPROB_EXTRANEOUS_INITIAL_KEY --\n \t\tProbability that extraneous keystroke is inserted before a word-initial letter.  Default is 0.\n \n",  0x83uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tPROB_EXTRANEOUS_FINAL_KEY --\n \t\tProbability that extraneous keystroke is inserted after a word-final letter.  Default is 0.\n \n",  0x7EuLL,  1uLL,  __stdoutp);
  fwrite( "\t\tDECOMPOSE_INPUT_STRING --\n\t\tIf nonzero, input text is decomposed prior to typing keys.  Default is 0.\n\n",  0x69uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tERROR_GENERATOR --\n \t\tThe subclass of TIErrorGenerator that produces errors for the touch inputs.  Each class has its own parameters, as follows.\n\n",  0x94uLL,  1uLL,  __stdoutp);
  fwrite("\t\t\tCommon parameters --\n", 0x18uLL, 1uLL, __stdoutp);
  fwrite( "\t\t\t\tRNG_SEED_SALT --\n\t\t\t\tA salt for seeding the random number generator seed. Default is 0.\n\n",  0x5DuLL,  1uLL,  __stdoutp);
  fwrite( "\t\t\t\tREL_ERROR_NUMBERS_PUNCTATION --\n\t\t\t\tRelative error for typing numbers and punctuation (Default=1)\n\n",  0x67uLL,  1uLL,  __stdoutp);
  fwrite( "\t\t\t\tREL_ERROR_CONTROL_KEYS --\n\t\t\t\tRelative error for typing control keys (Default=1)\n\n",  0x56uLL,  1uLL,  __stdoutp);
  fwrite( "\t\t\tTIRadialErrorGenerator --\n \t\t\tEach touch is offset at a random angle and distance, selected from one of two ranges.\n \n",  0x77uLL,  1uLL,  __stdoutp);
  fwrite( "\t\t\t\tDEFAULT_ERROR_RADIAL_MIN_DISTANCE --\n \t\t\t\tThe minimum radial distance around a key centroid to select an error point. Default is 0.\n \n",  0x88uLL,  1uLL,  __stdoutp);
  fwrite( "\t\t\t\tDEFAULT_ERROR_RADIAL_MAX_DISTANCE --\n \t\t\t\tThe maximum radial distance around a key centroid to select an error point. Within-keyframe max value is 15.\n\n",  0x9BuLL,  1uLL,  __stdoutp);
  fwrite( "\t\t\t\tLETTER_ERROR_COUNT --\n\t\t\t\tThe number of randomly selected characters to add geometry errors.\n\n",  0x62uLL,  1uLL,  __stdoutp);
  fwrite( "\t\t\t\tLETTER_ERROR_RADIAL_MIN_DISTANCE --\n \t\t\t\tThe minimum radial distance around a key centroid to select an error point. Default is 0.\n \n",  0x87uLL,  1uLL,  __stdoutp);
  fwrite( "\t\t\t\tLETTER_ERROR_RADIAL_MAX_DISTANCE --\n \t\t\t\tThe maximum radial distance around a key centroid to select an error point. Recommended value between 15-25.\n\n",  0x9AuLL,  1uLL,  __stdoutp);
  fwrite( "\t\t\tTIGaussianErrorGenerator --\n \t\t\t(Default) Each touch is offset using independently generated Gaussian noise.\n \n",  0x70uLL,  1uLL,  __stdoutp);
  fwrite( "\t\t\t\tGAUSSIAN_ERROR_STDDEV_X --\n \t\t\t\tThe standard deviation (in mm) of the Gaussian noise in the X dimension\n \n",  0x6CuLL,  1uLL,  __stdoutp);
  fwrite( "\t\t\t\tGAUSSIAN_ERROR_STDDEV_Y --\n \t\t\t\tThe standard deviation (in mm) of the Gaussian noise in the Y dimension\n \n",  0x6CuLL,  1uLL,  __stdoutp);
  fwrite( "\t\t\t\tSKEW_STDDEV_X --\n \t\t\t\tThe standard deviation (in mm) of the Gaussian noise for the skew in the X dimension\n \n",  0x6FuLL,  1uLL,  __stdoutp);
  fwrite( "\t\t\t\tSKEW_STDDEV_Y --\n \t\t\t\tThe standard deviation (in mm) of the Gaussian noise for the skew in the Y dimension\n \n",  0x6FuLL,  1uLL,  __stdoutp);
  fwrite( "\t\t\t\tSCALE_ERROR_UNITS_TO_POINTS --\n \t\t\t\tOptional multiplier to use to convert from the standard deviation values to points\n \n",  0x7BuLL,  1uLL,  __stdoutp);
  fwrite( "\t\tSTEP_COUNT --\n\t\tThe number of steps each variable's sweep range is broken into.\n\n",  0x53uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tUSER_DIRECTORY --\n \t\tDirectory to store dynamic data like user dictionary and LMs.  KB user dirtectory is the default\n \n",  0x78uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tCLEAN_USER_DIRECTORY --\n\t\tIf nonzero, USER_DIRECTORY will be recreated upon startup\n\n",  0x57uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tSAVE_DEBUG_DATA --\n\t\tIf nonzero debug information will be saved with each run\n\n",  0x51uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tREPORT_AGGD_STATISTICS --\n\t\tCollect Aggd Statistics for each line of input text\n\n",  0x53uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tTYPOLOGY_OUTPATH --\n\t\tOutput Typology log for each line of input text to this directory\n\n",  0x5BuLL,  1uLL,  __stdoutp);
  fwrite("\t\tPATH SIMULATION --\n\t\tContinious Path simulation parameters:\n\n", 0x3FuLL, 1uLL, __stdoutp);
  fwrite( "\t\t\t\tCONTINUOUS_PATH_GENERATOR - 'TYPIST' for generating splines and 'SIMPLE' for generating line segment paths. default 'SIMPLE'\n \n",  0x82uLL,  1uLL,  __stdoutp);
  fwrite( "\t\t\t\tFINGER_KEY_WIDTH_MULTIPLE - defines thinkness of a finger in multiple of key widths. This option affects ove rshoot - user is assumed to move his finger until he sees a frame of the key he intends to reach. Default is 0, sett ig it 1 will make for half key width overshoot\n \n",  0x114uLL,  1uLL,  __stdoutp);
  fwrite( "\t\t\t\tGENERATE_MIDDLE_POINT - If true will make path generator to wonder to deviate from the line segments that co nnect target points\n \n",  0x85uLL,  1uLL,  __stdoutp);
  fwrite( "\t\t\t\tMID_POINT_DEV_KEY_HEIGHT_MULTIPLE - how far a middle point is allowed deviate from line segment in key heigh t multiples. default 2.\n \n",  0x89uLL,  1uLL,  __stdoutp);
  fwrite( "\t\t\t\tPATH_BETA_PARAMETER - controls simmetrical beta distribution for choosing middle points. default 4. Reducing it to 1 results in uniform distribution, increasing it makes distribution center heavy.\n \n",  0xCAuLL,  1uLL,  __stdoutp);
  fwrite( "\t\t\t\tPATH_NORMAL_KEY_WIDTH_MULTIPLE - controls how far a user misses intended target. By default it's set to 0. R ecommended setting 0.4\n \n",  0x88uLL,  1uLL,  __stdoutp);
  fwrite( "\t\t\t\tCPPATHGEN_TIMING_ALGORITHM - controls how points are placed on the path. EQUIDISTANT will spread point equal ly. ANGULAR attempts to mimic user by slowing on sharp turns and gaining speed on longer segments\n \n",  0xD3uLL,  1uLL,  __stdoutp);
  fwrite("\t\t\t\tCPPATHGEN_ACCELERATION - used for ANGULAR, defaults to 1.6\n\n", 0x40uLL, 1uLL, __stdoutp);
  fwrite( "\t\tCUSTOM_STATIC_DICTIONARY_PATH --\n\t\tProvide a path to a custom Unigrams file.\n\n",  0x50uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tCUSTOM_LANGUAGE_MODEL_PATH --\n \t\tProvide a path to a custom language model bundle. It will be combined with other lm bundles on the system. To ov erride system resources bump 'priority' field in the bundle's info.plist.\n \n",  0xDDuLL,  1uLL,  __stdoutp);
  fwrite( "\t\tCUSTOM_DYNAMIC_RESOURCE_PATH --\n\t\tProvide a path to a custom language model bundle.\n\n",  0x57uLL,  1uLL,  __stdoutp);
  fwrite( "\t\t\t\tUSER_PATH_FILE - if given will process and use user paths found in the file\n\n",  0x51uLL,  1uLL,  __stdoutp);
  fwrite( "\t\tFAVONIUS_LANGUAGE_MODEL_WEIGHT-\n \t\tfloat value [0.0, 1.0]. Weight of language model, used for rescoring candidates. If not set, then the default k_ linguistic_context_power value (0.24) is used.\n \n",  0xC4uLL,  1uLL,  __stdoutp);
  return fputc(10, __stdoutp);
}

id sub_43B58(int a1, char *const *a2)
{
  if (a1 <= 1)
  {
    sub_42C30();
    return 0LL;
  }

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_442D0;
  v30[3] = &unk_898F8;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v31 = v5;
  double v6 = objc_retainBlock(v30);
  double v27 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  @"ADDRESSBOOK",  @"a",  @"NAMEDENTITIES",  @"n",  @"PORTRAIT_NAMEDENTITIES",  @"n",  @"DICTS",  @"d",  @"WORDS",  @"w",  @"TEXT",  @"t",  @"TESTCASE",  @"T",  @"TYPOLOGY",  @"u",  @"CANDIDATE_SENTENCES",  @"s",  @"PLAYBACK",  @"b",  @"PARAMS",  @"p",  @"JSON_CONFIG",  @"j",  @"BAD_SENTENCES_FILE_PATH",  @"B",  0LL);
  v32[0] = getopt_long(a1, a2, "Vz:d:w:t:T:r:s:l:o:p:u:c:a:n:j:P:S:W:O:i:N:b:B:fCx", (const option *)&off_A9F08, 0LL);
  if (v32[0] == -1)
  {
LABEL_39:
    id v26 = v5;
    goto LABEL_44;
  }

  while (2)
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCharacters:length:]( &OBJC_CLASS___NSString,  "stringWithCharacters:length:",  v32,  1LL));
    switch(v32[0])
    {
      case ':':
        if (optopt != 122) {
          goto LABEL_8;
        }
        goto LABEL_31;
      case 'B':
        double v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  optarg,  4LL));
        double v12 = v5;
        double v13 = v11;
        unsigned int v14 = @"BAD_SENTENCES_FILE_PATH";
        goto LABEL_25;
      case 'C':
        unsigned int v15 = v5;
        double v16 = @"SHOW_CANDIDATE_BAR";
        goto LABEL_32;
      case 'N':
        int v17 = strtol(optarg, &__endptr, 10);
        if (!*__endptr)
        {
          double v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v17));
          double v12 = v5;
          double v13 = v11;
          unsigned int v14 = @"END_INDEX";
LABEL_25:
          [v12 setValue:v13 forKey:v14];

LABEL_38:
          v32[0] = getopt_long( a1,  a2,  "Vz:d:w:t:T:r:s:l:o:p:u:c:a:n:j:P:S:W:O:i:N:b:B:fCx",  (const option *)&off_A9F08,  0LL);
          if (v32[0] == -1) {
            goto LABEL_39;
          }
          continue;
        }

        fprintf(__stderrp, "Error: invalid end index: %s\n");
LABEL_43:

        id v26 = 0LL;
LABEL_44:

        return v26;
      case 'O':
        double v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  optarg,  4LL));
        double v12 = v5;
        double v13 = v11;
        unsigned int v14 = @"KEYBOARD_ORIENTATION";
        goto LABEL_25;
      case 'P':
        if (optarg) {
          double v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  optarg,  4LL));
        }
        else {
          double v18 = 0LL;
        }
        id v24 = sub_2DE1C(v18);
        double v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

        if (!v25)
        {
          fprintf(__stderrp, "Error: persona does not exist: %s\n");
          goto LABEL_48;
        }

        double v21 = v5;
        double v22 = v18;
        double v23 = @"PERSONA";
        goto LABEL_36;
      case 'S':
        double v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  optarg,  4LL));
        double v12 = v5;
        double v13 = v11;
        unsigned int v14 = @"SENTENCE";
        goto LABEL_25;
      case 'T':
      case 'a':
      case 'b':
      case 'd':
      case 'j':
      case 'n':
      case 'p':
      case 'r':
      case 's':
      case 't':
      case 'u':
      case 'w':
        double v8 = optarg;
        double v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v27, "objectForKey:", v7));
        LOBYTE(v_Block_object_dispose((const void *)(v1 - 136), 8) = ((uint64_t (*)(void *, char *, void *))v6[2])(v6, v8, v9);

        goto LABEL_38;
      case 'V':
        puts((const char *)[@"1.14" UTF8String]);
        exit(0);
      case 'W':
        double v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  optarg,  4LL));
        double v12 = v5;
        double v13 = v11;
        unsigned int v14 = @"KEYBOARD_WIDTH";
        goto LABEL_25;
      case 'c':
        double v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  optarg,  4LL));
        [v5 setValue:&__kCFBooleanTrue forKey:@"USE_PARTFILE"];
        if (!v18) {
          goto LABEL_38;
        }
        double v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v18 integerValue]));
        [v5 setValue:v19 forKey:@"PARTFILE_FLUSH_THRESHOLD"];

        goto LABEL_37;
      case 'f':
        unsigned int v15 = v5;
        double v16 = @"PRINT_TYPING_TRANSCRIPT";
        goto LABEL_32;
      case 'i':
LABEL_8:
        int v10 = strtol(optarg, &__endptr, 10);
        if (*__endptr)
        {
          fprintf(__stderrp, "Error: invalid start index: %s\n");
          goto LABEL_43;
        }

        double v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v10));
        double v12 = v5;
        double v13 = v11;
        unsigned int v14 = @"START_INDEX";
        goto LABEL_25;
      case 'l':
        uint64_t v20 = objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  optarg,  4LL));
        if (!v20) {
          goto LABEL_38;
        }
        double v18 = (void *)v20;
        double v21 = v5;
        double v22 = v18;
        double v23 = @"KEYBOARD_LANGUAGE";
        goto LABEL_36;
      case 'o':
        double v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  optarg,  4LL));
        double v12 = v5;
        double v13 = v11;
        unsigned int v14 = @"OUTPATH";
        goto LABEL_25;
      case 'x':
        unsigned int v15 = v5;
        double v16 = @"TRANSLITERATION_SUMMARIES";
        goto LABEL_32;
      case 'z':
        if (optarg)
        {
          double v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  optarg,  4LL));
          [v5 setValue:&__kCFBooleanTrue forKey:@"RUN_DSL_TEST"];
          if (v18)
          {
            if (stat(optarg, &v29))
            {
              fprintf(__stderrp, "Error: data driven test file does not exist: %s\n");
LABEL_48:
              exit(1);
            }

            fprintf(__stderrp, "data driven test file path: %s\n", optarg);
            double v21 = v5;
            double v22 = v18;
            double v23 = @"DSL_TEST_FILE";
LABEL_36:
            [v21 setValue:v22 forKey:v23];
LABEL_37:
          }
        }

        else
        {
LABEL_31:
          unsigned int v15 = v5;
          double v16 = @"RUN_DSL_TEST";
LABEL_32:
          [v15 setValue:&__kCFBooleanTrue forKey:v16];
        }

        goto LABEL_38;
      default:
        fwrite("Error: invalid paramter.\n", 0x19uLL, 1uLL, __stderrp);
        goto LABEL_43;
    }
  }

BOOL sub_442D0(uint64_t a1, const char *a2, void *a3)
{
  id v5 = a3;
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", a2, 4LL));
  int v7 = stat(a2, &v12);
  double v8 = __stderrp;
  id v9 = v5;
  int v10 = (const char *)[v9 cStringUsingEncoding:4];
  if (v7)
  {
    fprintf(v8, "Error: %s path does not exist: %s\n", v10, a2);
  }

  else
  {
    fprintf(v8, "%s path: %s\n", v10, a2);
    [*(id *)(a1 + 32) setValue:v6 forKey:v9];
  }

  return v7 == 0;
}

id sub_443B0(void *a1)
{
  id v1 = a1;
  id v29 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (v1)
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v1));
    if (v2)
    {
      id v3 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v2, 4LL);
      if (v3)
      {
        double v27 = v2;
        id v28 = v1;
        id v26 = v3;
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue(-[NSString componentsSeparatedByString:](v3, "componentsSeparatedByString:", @"\n"));
        id v4 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v4)
        {
          id v5 = v4;
          double v6 = @"#";
          uint64_t v7 = *(void *)v34;
          double v8 = &CFAbsoluteTimeGetCurrent_ptr;
          uint64_t v30 = *(void *)v34;
          do
          {
            id v9 = 0LL;
            id v31 = v5;
            do
            {
              if (*(void *)v34 != v7) {
                objc_enumerationMutation(obj);
              }
              id v10 = *(id *)(*((void *)&v33 + 1) + 8LL * (void)v9);
              id v11 = [v10 rangeOfString:v6];
              if (v11 != (id)0x7FFFFFFFFFFFFFFFLL)
              {
                uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 substringToIndex:v11]);

                id v10 = (id)v12;
              }

              double v13 = (void *)objc_claimAutoreleasedReturnValue([v8[43] whitespaceCharacterSet]);
              unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByTrimmingCharactersInSet:v13]);

              if (([v14 isEqualToString:&stru_89E80] & 1) == 0)
              {
                unsigned int v15 = v6;
                double v16 = (void *)objc_claimAutoreleasedReturnValue([v14 componentsSeparatedByString:@"="]);
                int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectAtIndex:0]);
                double v18 = (void *)objc_claimAutoreleasedReturnValue([v16 objectAtIndex:1]);
                double v19 = v8;
                uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v8[43] whitespaceCharacterSet]);
                double v21 = (void *)objc_claimAutoreleasedReturnValue([v17 stringByTrimmingCharactersInSet:v20]);

                double v22 = (void *)objc_claimAutoreleasedReturnValue([v19[43] whitespaceCharacterSet]);
                double v23 = (__CFString *)objc_claimAutoreleasedReturnValue([v18 stringByTrimmingCharactersInSet:v22]);

                if (v21)
                {
                  if (v23) {
                    id v24 = v23;
                  }
                  else {
                    id v24 = @"0";
                  }
                  [v29 setObject:v24 forKey:v21];
                }

                double v6 = v15;
                double v8 = v19;
                uint64_t v7 = v30;
                id v5 = v31;
              }

              id v9 = (char *)v9 + 1;
            }

            while (v5 != v9);
            id v5 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
          }

          while (v5);
        }

        id v2 = v27;
        id v1 = v28;
      }
    }
  }

  return v29;
}

NSMutableDictionary *sub_446A0(void *a1)
{
  id v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKey:@"PARAMS"]);
  if (v2)
  {
    id v3 = v2;
    id v4 = sub_443B0(v2);
    uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
LABEL_3:
    double v6 = (NSMutableDictionary *)v5;
    goto LABEL_7;
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKey:@"JSON_CONFIG"]);
  if (!v3)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    goto LABEL_3;
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v3));
  id v41 = 0LL;
  double v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v7,  4LL,  &v41));
  id v9 = v41;
  if (!v8)
  {
    uint64_t v30 = __stderrp;
    id v31 = (const char *)[v3 cStringUsingEncoding:4];
    id v32 = objc_claimAutoreleasedReturnValue([v9 localizedDescription]);
    fprintf( v30,  "Error: Unable to parse JSON config file '%s': %s\n\n",  v31,  (const char *)[v32 cStringUsingEncoding:4]);

LABEL_35:
    exit(1);
  }

  double v6 = -[NSMutableDictionary initWithDictionary:copyItems:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:copyItems:",  v8,  1LL);

LABEL_7:
  -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v1, @"COMMAND_LINE_ARGS");
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v10 = [&off_904D8 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v38;
    do
    {
      for (uint64_t i = 0LL; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(&off_904D8);
        }
        uint64_t v14 = *(void *)(*((void *)&v37 + 1) + 8LL * (void)i);
        unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v1 valueForKey:v14]);
        if (v15) {
          -[NSMutableDictionary setValue:forKey:](v6, "setValue:forKey:", v15, v14);
        }
      }

      id v11 = [&off_904D8 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }

    while (v11);
  }

  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v16 = [&off_904F0 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (!v16)
  {
LABEL_24:
    double v21 = __stderrp;
    double v22 = "Error: You must provide a source of test input!\n\n";
    size_t v23 = 49LL;
LABEL_34:
    fwrite(v22, v23, 1uLL, v21);
    sub_42C30();
    goto LABEL_35;
  }

  id v17 = v16;
  uint64_t v18 = *(void *)v34;
LABEL_18:
  uint64_t v19 = 0LL;
  while (1)
  {
    if (*(void *)v34 != v18) {
      objc_enumerationMutation(&off_904F0);
    }
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( v6,  "objectForKey:",  *(void *)(*((void *)&v33 + 1) + 8 * v19)));

    if (v20) {
      break;
    }
    if (v17 == (id)++v19)
    {
      id v17 = [&off_904F0 countByEnumeratingWithState:&v33 objects:v42 count:16];
      if (!v17) {
        goto LABEL_24;
      }
      goto LABEL_18;
    }
  }

  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v6, "objectForKey:", @"DICT"));
  if (v24)
  {
  }

  else
  {
    double v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v6, "objectForKey:", @"KEYBOARD_LANGUAGE"));

    if (!v25)
    {
      double v21 = __stderrp;
      double v22 = "Error: You must provide an input language.";
      size_t v23 = 42LL;
      goto LABEL_34;
    }
  }

  uint64_t v26 = objc_claimAutoreleasedReturnValue([v1 objectForKey:@"PARAMS"]);
  if (v26)
  {
    double v27 = (void *)v26;
    id v28 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKey:@"JSON_CONFIG"]);

    if (v28)
    {
      double v21 = __stderrp;
      double v22 = "Error: Use only Text or JSON parameter file but not both.";
      size_t v23 = 57LL;
      goto LABEL_34;
    }
  }

  return v6;
}

id sub_44A90(uint64_t a1)
{
  id v17 = 0LL;
  id v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithContentsOfFile:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfFile:encoding:error:",  a1,  4LL,  &v17));
  id v2 = v17;
  if (v1)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v1 componentsSeparatedByString:@"\n"]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
          if ((objc_msgSend(v10, "isEqualToString:", &stru_89E80, (void)v13) & 1) == 0)
          {
            id v11 = (void *)objc_claimAutoreleasedReturnValue( +[AutocorrectionTest testWithInput:]( &OBJC_CLASS___AutocorrectionTest,  "testWithInput:",  v10));
            [v4 addObject:v11];
          }
        }

        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }

      while (v7);
    }
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

id sub_44C44(uint64_t a1)
{
  id v33 = 0LL;
  id v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithContentsOfFile:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfFile:encoding:error:",  a1,  4LL,  &v33));
  id v2 = v33;
  id v3 = v2;
  if (!v1)
  {
    id v28 = 0LL;
    goto LABEL_18;
  }

  id v24 = v2;
  double v25 = v1;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v1 componentsSeparatedByString:@"\n"]);
  id v28 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (!v6) {
    goto LABEL_16;
  }
  id v7 = v6;
  uint64_t v8 = &stru_89E80;
  uint64_t v9 = *(void *)v30;
  id v10 = @"|";
  id v11 = &CFAbsoluteTimeGetCurrent_ptr;
  uint64_t v26 = *(void *)v30;
  do
  {
    uint64_t v12 = 0LL;
    id v27 = v7;
    do
    {
      if (*(void *)v30 != v9) {
        objc_enumerationMutation(v5);
      }
      __int128 v13 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)v12);
      if (([v13 isEqualToString:v8] & 1) == 0)
      {
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v11[43] characterSetWithCharactersInString:v10]);
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v13 componentsSeparatedByCharactersInSet:v14]);

        if ([v15 count] == (char *)&dword_0 + 2)
        {
          __int128 v16 = v8;
          id v17 = v5;
          uint64_t v18 = v10;
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndex:0]);
          uint64_t v20 = v11;
          double v21 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndex:1]);
          double v22 = (void *)objc_claimAutoreleasedReturnValue( +[AutocorrectionTest testWithInput:expectedOutput:]( &OBJC_CLASS___AutocorrectionTest,  "testWithInput:expectedOutput:",  v19,  v21));

          id v11 = v20;
          id v10 = v18;
          id v5 = v17;
          uint64_t v8 = v16;
          uint64_t v9 = v26;
          id v7 = v27;
          goto LABEL_12;
        }

        if ([v15 count] == (char *)&dword_0 + 1)
        {
          double v22 = (void *)objc_claimAutoreleasedReturnValue( +[AutocorrectionTest testWithInput:expectedOutput:]( &OBJC_CLASS___AutocorrectionTest,  "testWithInput:expectedOutput:",  @"\n",  &off_90508));
LABEL_12:
          [v28 addObject:v22];
        }
      }

      uint64_t v12 = (char *)v12 + 1;
    }

    while (v7 != v12);
    id v7 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
  }

  while (v7);
LABEL_16:

  id v3 = v24;
  id v1 = v25;
LABEL_18:

  return v28;
}

__CFString *sub_44EE8(int a1)
{
  else {
    return off_899B0[a1 - 1];
  }
}

id sub_44F0C(void *a1, void *a2)
{
  id v3 = a1;
  id v19 = a2;
  uint64_t ComponentsFromIdentifier = UIKeyboardInputModeGetComponentsFromIdentifier();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(ComponentsFromIdentifier);
  uint64_t NormalizedLevelsFromComponents = UIKeyboardInputModeGetNormalizedLevelsFromComponents();
  id v7 = (void *)objc_claimAutoreleasedReturnValue(NormalizedLevelsFromComponents);

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    id v10 = 0LL;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0LL; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(obj);
        }
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unigrams-%@.words",  *(void *)(*((void *)&v21 + 1) + 8LL * (void)i)));
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:v13]);
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        unsigned int v16 = [v15 fileExistsAtPath:v14];

        if (v16)
        {
          id v17 = v14;

          id v10 = v17;
        }
      }

      id v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v9);
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

id sub_450C8(void *a1, void *a2)
{
  id v2 = sub_44F0C(a1, a2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v22 = 0LL;
    id v19 = v3;
    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSString stringWithContentsOfFile:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfFile:encoding:error:",  v3,  4LL,  &v22));
    id v17 = v22;
    uint64_t v18 = (void *)v5;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](&OBJC_CLASS___NSScanner, "scannerWithString:", v5));
    if (([v6 isAtEnd] & 1) == 0)
    {
      do
      {
        id v21 = 0LL;
        [v6 scanUpToString:@" : " intoString:&v21];
        id v7 = v21;
        id v20 = 0LL;
        [v6 scanUpToString:@"\n" intoString:&v20];
        id v8 = v20;
        id v9 = v7;
        id v10 = [v8 rangeOfString:@"s="];
        uint64_t v12 = v9;
        if (v10 != (_BYTE *)0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v8,  "substringWithRange:",  v10 + 2,  (_BYTE *)objc_msgSend(v8, "length") - &v10[v11]));
        }

        __int128 v23 = v12;
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( +[AutocorrectionTest testWithInput:expectedOutput:]( &OBJC_CLASS___AutocorrectionTest,  "testWithInput:expectedOutput:",  v9,  v13));

        [v4 addObject:v14];
      }

      while (![v6 isAtEnd]);
    }

    __int128 v15 = v18;
    id v3 = v19;
  }

  else
  {
    id v4 = 0LL;
    __int128 v15 = 0LL;
  }

  return v4;
}

id sub_452E8(uint64_t a1, uint64_t a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithContentsOfFile:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfFile:encoding:error:",  a1,  4LL,  a2));
  if (v2)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_45398;
    v5[3] = &unk_89920;
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v6 = v3;
    [v2 enumerateLinesUsingBlock:v5];
  }

  else
  {
    id v3 = 0LL;
  }

  return v3;
}

void sub_45398(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
  id v13 = (id)objc_claimAutoreleasedReturnValue([v3 stringByTrimmingCharactersInSet:v4]);

  if ([v13 length])
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v13 componentsSeparatedByString:@"\t"]);
    id v6 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
    -[NSNumberFormatter setNumberStyle:](v6, "setNumberStyle:", 1LL);
    if ((unint64_t)[v5 count] < 2)
    {
      id v8 = 0LL;
    }

    else
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:0]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumberFormatter numberFromString:](v6, "numberFromString:", v7));

      if (v8)
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subarrayWithRange:", 1, (char *)objc_msgSend(v5, "count") - 1));
        uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 componentsJoinedByString:@"\t"]);

        id v11 = (id)v10;
LABEL_7:
        id v13 = v11;
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[AutocorrectionTest testWithInput:andCorpusId:]( &OBJC_CLASS___AutocorrectionTest,  "testWithInput:andCorpusId:",  v11,  v8));
        [*(id *)(a1 + 32) addObject:v12];

        goto LABEL_8;
      }
    }

    id v11 = v13;
    goto LABEL_7;
  }

id sub_45514(uint64_t a1)
{
  id v7 = 0LL;
  id v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithContentsOfFile:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfFile:encoding:error:",  a1,  4LL,  &v7));
  id v2 = v7;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_455D4;
  v5[3] = &unk_89920;
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v6 = v3;
  [v1 enumerateLinesUsingBlock:v5];

  return v3;
}

void sub_455D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 stringByTrimmingCharactersInSet:v4]);

  if ([v5 length]) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

void *sub_45658(void *a1)
{
  id v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v1));
  id v9 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v2,  4LL,  &v9));
  id v4 = v9;
  if (!v3)
  {
    id v6 = __stderrp;
    id v7 = (const char *)[v1 cStringUsingEncoding:4];
    id v8 = objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
    fprintf( v6,  "Error: Unable to parse JSON config file '%s': %s\n\n",  v7,  (const char *)[v8 cStringUsingEncoding:4]);

    exit(1);
  }

  return &__NSArray0__struct;
}

TIContactCollection *sub_45748(uint64_t a1)
{
  id v7 = 0LL;
  id v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithContentsOfFile:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfFile:encoding:error:",  a1,  4LL,  &v7));
  id v2 = v7;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_4580C;
  v5[3] = &unk_89920;
  id v3 =  -[TIContactCollection initWithRelevanceScoreType:]( objc_alloc(&OBJC_CLASS___TIContactCollection),  "initWithRelevanceScoreType:",  1LL);
  id v6 = v3;
  [v1 enumerateLinesUsingBlock:v5];

  return v3;
}

void sub_4580C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
  id v11 = (id)objc_claimAutoreleasedReturnValue([v3 stringByTrimmingCharactersInSet:v4]);

  if ([v11 length])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v11 componentsSeparatedByString:@","]);
    id v6 = objc_alloc_init(&OBJC_CLASS___TIContact);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:0]);
    [v6 setGivenName:v7];

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:1]);
    [v6 setFamilyName:v8];

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:2]);
    [v9 doubleValue];
    *(float *)&double v10 = v10;
    [v6 setRelevancyScore:v10];

    [v6 setHasRelevancyScore:1];
    [*(id *)(a1 + 32) addContact:v6];
  }
}

id sub_4593C(uint64_t a1)
{
  id v7 = 0LL;
  id v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithContentsOfFile:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfFile:encoding:error:",  a1,  4LL,  &v7));
  id v2 = v7;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_459FC;
  v5[3] = &unk_89920;
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v6 = v3;
  [v1 enumerateLinesUsingBlock:v5];

  return v3;
}

void sub_459FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
  id v11 = (id)objc_claimAutoreleasedReturnValue([v3 stringByTrimmingCharactersInSet:v4]);

  if ([v11 length])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v11 componentsSeparatedByString:@","]);
    id v6 = objc_alloc_init(&OBJC_CLASS___TIMockContact);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:0]);
    -[TIMockContact setFirstName:](v6, "setFirstName:", v7);

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:1]);
    -[TIMockContact setLastName:](v6, "setLastName:", v8);

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:2]);
    [v9 doubleValue];
    *(float *)&double v10 = v10;
    -[TIMockContact setRelevancyScore:](v6, "setRelevancyScore:", v10);

    [*(id *)(a1 + 32) addObject:v6];
  }
}

id sub_45B20(uint64_t a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  a1));
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = (void *)v3;
  id v30 = (id)v2;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 0LL));
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    id v7 = v1;
    id v8 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v8)
    {
      id v9 = v8;
      __int128 v29 = v1;
      double v10 = 0LL;
      uint64_t v31 = *(void *)v33;
      do
      {
        id v11 = 0LL;
        uint64_t v12 = v10;
        do
        {
          if (*(void *)v33 != v31) {
            objc_enumerationMutation(v7);
          }
          double v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:*(void *)(*((void *)&v32 + 1) + 8 * (void)v11)]);

          id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"TouchKey"]);
          if ([v13 isEqual:@" "])
          {
            id v14 = [v4 copy];
            id v15 = [v6 copy];
            unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue( +[AutocorrectionTest testWithTouches:expectedOutput:]( &OBJC_CLASS___AutocorrectionTest,  "testWithTouches:expectedOutput:",  v14,  v15));

            [v30 addObject:v16];
            [v6 setString:&stru_89E80];
            [v4 removeAllObjects];
          }

          else
          {
            [v6 appendString:v13];
            id v17 = (void *)objc_claimAutoreleasedReturnValue([v10 valueForKeyPath:@"TouchPoint.X"]);
            [v17 floatValue];
            double v19 = v18;
            id v20 = v7;
            id v21 = v9;
            id v22 = v6;
            __int128 v23 = v4;
            __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v10 valueForKeyPath:@"TouchPoint.Y"]);
            [v24 floatValue];
            unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue( +[TIPointError errorWithErrorVector:]( &OBJC_CLASS___TIPointError,  "errorWithErrorVector:",  v19,  v25));

            id v4 = v23;
            id v6 = v22;
            id v9 = v21;
            id v7 = v20;

            [v4 addObject:v16];
          }

          id v11 = (char *)v11 + 1;
          uint64_t v12 = v10;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }

      while (v9);

      id v1 = v29;
    }

    if ([v4 count])
    {
      __int128 v36 = v6;
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v36, 1LL));
      id v27 = (void *)objc_claimAutoreleasedReturnValue( +[AutocorrectionTest testWithTouches:expectedOutput:]( &OBJC_CLASS___AutocorrectionTest,  "testWithTouches:expectedOutput:",  v4,  v26));

      [v30 addObject:v27];
    }
  }

  return v30;
}

id sub_45E54()
{
  if (qword_AA3D8 != -1) {
    dispatch_once(&qword_AA3D8, &stru_89940);
  }
  return (id)qword_AA3D0;
}

void sub_45E94(id a1)
{
  id v1 = -[NSSet initWithObjects:]( objc_alloc(&OBJC_CLASS___NSSet),  "initWithObjects:",  @"ja_JP-50On",  @"ja_JP",  @"zh_Hant-HWR",  @"zh_Hans-HWR",  @"zh_CN",  @"zh_Hant-Cangjie",  @"zh_Hans-Wubihua",  @"zh_Hant-Wubihua",  @"zh_TW",  0LL);
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  uint64_t v3 = (void *)qword_AA3D0;
  qword_AA3D0 = (uint64_t)v2;

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[TIInputModeController sharedInputModeController]( &OBJC_CLASS___TIInputModeController,  "sharedInputModeController"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 supportedInputModeIdentifiers]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_45FC0;
  void v7[3] = &unk_89968;
  id v8 = v1;
  id v6 = v1;
  [v5 enumerateObjectsUsingBlock:v7];
}

void sub_45FC0(uint64_t a1, void *a2)
{
  id v3 = a2;
}

id sub_46010()
{
  uint64_t ComponentsFromIdentifier = UIKeyboardInputModeGetComponentsFromIdentifier();
  id v1 = (void *)objc_claimAutoreleasedReturnValue(ComponentsFromIdentifier);
  uint64_t NormalizedLevelsFromComponents = UIKeyboardInputModeGetNormalizedLevelsFromComponents();
  id v3 = (void *)objc_claimAutoreleasedReturnValue(NormalizedLevelsFromComponents);

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0LL; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)i);
        id v9 = sub_45E54();
        double v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        LOBYTE(v_Block_object_dispose((const void *)(v1 - 136), 8) = objc_msgSend(v10, "containsObject:", v8, (void)v12);

        if ((v8 & 1) != 0)
        {
          id v5 = &dword_0 + 1;
          goto LABEL_11;
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

LABEL_37:
    __int128 v24 = 0;
    goto LABEL_38;
  }

  if (v120)
  {
    v141 = 0LL;
    v66 = sub_452E8((uint64_t)v120, (uint64_t)&v141);
    v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
    if (v67)
    {
      __int128 v24 = -[AutocorrectionTesterAppDelegate runTests:withHarnessClass:forLanguage:errorMessage:reportObserver:]( self,  "runTests:withHarnessClass:forLanguage:errorMessage:reportObserver:",  v67,  v28,  v16,  0LL,  v125);
    }

    else
    {
      NSLog(@"Could not open: %@", v120);
      __int128 v24 = 0;
    }

    v49 = 0LL;

    goto LABEL_47;
  }

  if (v118)
  {
    v139[0] = _NSConcreteStackBlock;
    v139[1] = 3221225472LL;
    v139[2] = sub_47AB4;
    v139[3] = &unk_89968;
    v140 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v30 = v140;
    [v118 enumerateObjectsUsingBlock:v139];
    __int128 v24 = -[AutocorrectionTesterAppDelegate runTests:withHarnessClass:forLanguage:errorMessage:reportObserver:]( self,  "runTests:withHarnessClass:forLanguage:errorMessage:reportObserver:",  v30,  v28,  v16,  0LL,  v125);

    goto LABEL_26;
  }

  v111 = v6;
  v109 = v7;
  if (v117)
  {
    v68 = v9;
    v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:"));
    v138 = 0LL;
    v70 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v69,  4LL,  &v138));
    v71 = v138;
    if (!v70)
    {
      v102 = __stderrp;
      v103 = (const char *)[v117 cStringUsingEncoding:4];
      v104 = objc_claimAutoreleasedReturnValue([v71 localizedDescription]);
      fprintf( v102,  "Error: Unable to parse JSON config file '%s': %s\n\n",  v103,  (const char *)[v104 cStringUsingEncoding:4]);

      exit(1);
    }

    v72 = (void *)objc_claimAutoreleasedReturnValue([v70 objectForKeyedSubscript:@"conversationTests"]);
    v73 = sub_1ACDC(v72);
    v74 = objc_claimAutoreleasedReturnValue(v73);

    id v9 = (id)v74;
    float v25 = (void *)v122;
    uint64_t v6 = v111;
    id v7 = v109;
  }

  if (!v9)
  {
    if (v119)
    {
      v94 = v7;
      v95 = (void *)objc_claimAutoreleasedReturnValue(+[AutocorrectionTest testWithInput:](&OBJC_CLASS___AutocorrectionTest, "testWithInput:"));
      v143 = v95;
      v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v143, 1LL));

      __int128 v24 = -[AutocorrectionTesterAppDelegate runTests:withHarnessClass:forLanguage:errorMessage:reportObserver:]( self,  "runTests:withHarnessClass:forLanguage:errorMessage:reportObserver:",  v96,  v105,  v16,  0LL,  v125);
      id v9 = 0LL;
      v50 = v117;
      id v7 = v94;
      id v4 = 0LL;
      goto LABEL_39;
    }

    v97 = self;
    v49 = 0LL;
    if (v25)
    {
      float v25 = (void *)v122;
      v98 = sub_45B20(v122);
      v99 = (void *)objc_claimAutoreleasedReturnValue(v98);
      __int128 v24 = -[AutocorrectionTesterAppDelegate runTests:withHarnessClass:forLanguage:errorMessage:reportObserver:]( v97,  "runTests:withHarnessClass:forLanguage:errorMessage:reportObserver:",  v99,  v105,  v16,  0LL,  v125);

      id v9 = 0LL;
      id v4 = 0LL;
    }

    else
    {
      if (v116)
      {
        v100 = sub_44C44((uint64_t)v116);
        v101 = (void *)objc_claimAutoreleasedReturnValue(v100);
        __int128 v24 = -[AutocorrectionTesterAppDelegate runTests:withHarnessClass:forLanguage:errorMessage:reportObserver:]( v97,  "runTests:withHarnessClass:forLanguage:errorMessage:reportObserver:",  v101,  v105,  v16,  @"Unable to read candidates\n",  v125);

        id v9 = 0LL;
      }

      else
      {
        id v9 = 0LL;
        __int128 v24 = 0;
      }

      id v4 = 0LL;
      float v25 = (void *)v122;
    }

    id v7 = v109;
    goto LABEL_47;
  }

  v107 = v16;
  v75 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v146[0] = @"CONVERSATION_SENDERS_TO_TEST";
  v146[1] = @"CONVERSATION_ADAPT_TO_SENT_MESSAGES";
  v147[0] = @"sendersToTest";
  v147[1] = @"adaptToSentMessages";
  v146[2] = @"CONVERSATION_ADAPT_TO_RECEIVED_MESSAGES";
  v147[2] = @"adaptToReceivedMessages";
  v134 = 0u;
  v135 = 0u;
  v136 = 0u;
  v137 = 0u;
  v76 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v147,  v146,  3LL));
  v77 = [v76 countByEnumeratingWithState:&v134 objects:v145 count:16];
  if (v77)
  {
    v78 = v77;
    v79 = *(void *)v135;
    do
    {
      for (uint64_t i = 0LL; i != v78; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v135 != v79) {
          objc_enumerationMutation(v76);
        }
        v81 = *(void *)(*((void *)&v134 + 1) + 8LL * (void)i);
        v82 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_options, "objectForKeyedSubscript:", v81));

        if (v82)
        {
          v83 = (void *)objc_claimAutoreleasedReturnValue([v76 objectForKeyedSubscript:v81]);
          v84 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_options,  "objectForKeyedSubscript:",  v81));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v75, "setObject:forKeyedSubscript:", v84, v83);
        }
      }

      v78 = [v76 countByEnumeratingWithState:&v134 objects:v145 count:16];
    }

    while (v78);
  }

  v85 = v76;
  v86 = self;
  v87 = v85;

  v88 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v130 = 0u;
  v131 = 0u;
  v132 = 0u;
  v133 = 0u;
  id v9 = v9;
  v89 = [v9 countByEnumeratingWithState:&v130 objects:v144 count:16];
  if (v89)
  {
    v90 = v89;
    v91 = *(void *)v131;
    do
    {
      for (uint64_t j = 0LL; j != v90; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v131 != v91) {
          objc_enumerationMutation(v9);
        }
        v93 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v130 + 1) + 8 * (void)j) overridingJsonKeys:v75]);
        -[NSMutableArray addObject:](v88, "addObject:", v93);
      }

      v90 = [v9 countByEnumeratingWithState:&v130 objects:v144 count:16];
    }

    while (v90);
  }

  __int128 v24 = -[AutocorrectionTesterAppDelegate runTests:withHarnessClass:forLanguage:errorMessage:reportObserver:]( v86,  "runTests:withHarnessClass:forLanguage:errorMessage:reportObserver:",  v88,  v105,  v107,  0LL,  v125);
  id v4 = 0LL;
  uint64_t v6 = v111;
  float v25 = (void *)v122;
  v49 = 0LL;
  unsigned int v16 = v107;
  id v5 = v113;
  v50 = v117;
  id v7 = v109;
LABEL_40:

  return v24;
}

void sub_47AB4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v9 = a2;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v9, v6) & 1) != 0)
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[AutocorrectionTest testWithInput:](&OBJC_CLASS___AutocorrectionTest, "testWithInput:", v9));
    [v7 addObject:v8];
  }

  else
  {
    NSLog(@"Error: Unable to parse inputTextSamples");
    *a4 = 1;
  }
}

void sub_481AC(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v5 = a2;
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[TIReporter fileURLForTrial:withOptions:]( &OBJC_CLASS___TIReporter,  "fileURLForTrial:withOptions:",  a3,  v4));
  TITestTyperWritePropertyListToFile(v5, v10);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"KeystrokeSavingsRatio"]);
  [v6 floatValue];

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"WordAccuracy"]);
  [v7 floatValue];
  float v9 = 1.0 - v8;

  fprintf(__stderrp, "KSR:\t %.3f\n", v9);
  fprintf(__stderrp, "Error Rate: %.2f%%\n", (float)(v9 * 100.0));
}

id TITestTyperTokensForString(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (-[__CFString length](v3, "length"))
  {
    v20.length = (CFIndex)-[__CFString length](v3, "length");
    v20.location = 0LL;
    uint64_t v6 = CFStringTokenizerCreate(kCFAllocatorDefault, v3, v20, 4uLL, v4);
    unint64_t v7 = 0LL;
    while (CFStringTokenizerAdvanceToNextToken(v6))
    {
      CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v6);
      while (v7 < CurrentTokenRange.location)
      {
        id v9 = -[__CFString rangeOfComposedCharacterSequenceAtIndex:](v3, "rangeOfComposedCharacterSequenceAtIndex:", v7);
        id v11 = v9;
        else {
          CFIndex v12 = CurrentTokenRange.location - (void)v9;
        }
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v3, "substringWithRange:", v9, v12));
        [v5 addObject:v13];
        unint64_t v7 = (unint64_t)v11 + v12;
      }

      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( -[__CFString substringWithRange:]( v3,  "substringWithRange:",  CurrentTokenRange.location,  CurrentTokenRange.length));
      [v5 addObject:v14];
      unint64_t v7 = CurrentTokenRange.location + CurrentTokenRange.length;
    }

    while (v7 < (unint64_t)-[__CFString length](v3, "length"))
    {
      id v15 = -[__CFString rangeOfComposedCharacterSequenceAtIndex:](v3, "rangeOfComposedCharacterSequenceAtIndex:", v7);
      uint64_t v17 = v16;
      float v18 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v3, "substringWithRange:", v15, v16));
      [v5 addObject:v18];
      unint64_t v7 = (unint64_t)v15 + v17;
    }

    CFRelease(v6);
  }

  return v5;
}

uint64_t TITestTyperWritePropertyListToFile(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 URLByDeletingLastPathComponent]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v22 = 0LL;
  unsigned int v7 = [v6 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v22];
  id v8 = v22;

  if (!v7) {
    goto LABEL_9;
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  CFIndex v10 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
  NSFileAttributeKey v23 = NSFileProtectionKey;
  NSFileProtectionType v24 = NSFileProtectionNone;
  CFIndex v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
  unsigned int v13 = [v9 createFileAtPath:v10 contents:v11 attributes:v12];

  if (!v13) {
    goto LABEL_9;
  }
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSOutputStream outputStreamWithURL:append:]( &OBJC_CLASS___NSOutputStream,  "outputStreamWithURL:append:",  v4,  1LL));
  [v14 open];
  uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 streamError]);

  if (v15)
  {
    BOOL v16 = 0;
    id v8 = (id)v15;
  }

  else
  {
    id v21 = 0LL;
    NSInteger v17 = +[NSJSONSerialization writeJSONObject:toStream:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "writeJSONObject:toStream:options:error:",  v3,  v14,  0LL,  &v21);
    id v8 = v21;
    BOOL v16 = v17 != 0;
  }

  [v14 close];

  if (v16 && !v8)
  {
    uint64_t v18 = 1LL;
  }

  else
  {
LABEL_9:
    double v19 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
    NSLog(@"Error serializing and writing property list %@, error: %@", v19, v8);

    uint64_t v18 = 0LL;
  }

  return v18;
}

void sub_4B598(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "valueForKey:"));

  if (!v3)
  {
    [*(id *)(a1 + 32) setValue:*(void *)(a1 + 40) forKey:v4];
    [*(id *)(a1 + 48) addObject:v4];
  }
}

id sub_4D23C(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) learnWordContextIndex];
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectAtIndexedSubscript:v2]);
  unint64_t v4 = v2 + 1;
  else {
    unint64_t v5 = v4;
  }
  [*(id *)(a1 + 32) setLearnWordContextIndex:v5];
  return v3;
}

void sub_4EC48(_Unwind_Exception *a1)
{
  id v3 = v2;
  operator delete(v3);

  _Unwind_Resume(a1);
}

void sub_4EDA4(_Unwind_Exception *a1)
{
}

void sub_4EE84(_Unwind_Exception *a1)
{
}

void sub_4EF70(_Unwind_Exception *a1)
{
}

void sub_4F064(_Unwind_Exception *a1)
{
}

void sub_4F13C(_Unwind_Exception *a1)
{
}

void sub_4F34C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, void *a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, void *a32)
{
}

void sub_4F50C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
}

void sub_4F6B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4FD20( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20, void *a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, void *a26, void *a27, void *a28, void *a29, void *a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, void *a35, void *a36, void *a37, void *a38, void *a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, void *a44, void *a45, void *a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,void *a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,void *a56,void *a57,void *a58,void *a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a67, 8);
  _Block_object_dispose((const void *)(v73 - 184), 8);

  _Unwind_Resume(a1);
}

void sub_4FF14()
{
}

void sub_4FF1C()
{
}

void sub_4FF28()
{
  JUMPOUT(0x4FF04LL);
}

void sub_4FF38()
{
}

__n128 sub_4FF44(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 48);
  __int128 v3 = *(_OWORD *)(a2 + 64);
  *(__n128 *)(a1 + 4_Block_object_dispose((const void *)(v1 - 136), 8) = result;
  *(_OWORD *)(a1 + 64) = v3;
  return result;
}

void sub_4FF54(void *a1, void *a2, uint64_t a3)
{
  id v16 = a2;
  unint64_t v5 = objc_alloc_init(&OBJC_CLASS___TITestUserPersonaKeyInfo);
  [v16 frame];
  CGFloat x = v17.origin.x;
  CGFloat y = v17.origin.y;
  CGFloat width = v17.size.width;
  CGFloat height = v17.size.height;
  double MidX = CGRectGetMidX(v17);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  -[TITestUserPersonaKeyInfo setCenter:](v5, "setCenter:", MidX, CGRectGetMidY(v18));
  id v11 = (void *)a1[4];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v16 name]);
  [v11 setObject:v5 forKey:v12];

  unsigned int v13 = (void *)a1[5];
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v16 name]);
  [v13 setObject:v16 forKey:v14];

  uint64_t v15 = *(void *)(a1[6] + 8LL);
  if (a3)
  {
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    *(CGRect *)(*(void *)(a1[6] + 8LL) + 48LL) = CGRectUnion(*(CGRect *)(v15 + 48), v19);
  }

  else
  {
    *(CGFloat *)(v15 + 4_Block_object_dispose((const void *)(v1 - 136), 8) = x;
    *(CGFloat *)(v15 + 56) = y;
    *(CGFloat *)(v15 + 64) = width;
    *(CGFloat *)(v15 + 72) = height;
  }
}

void sub_5009C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_500D0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4_TIBeginMockingSingletonsWithData(0LL, 0LL, 0LL, 0LL, 1, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4_TIBeginMockingSingletonsWithData(0LL, 0LL, 0LL, 0LL, 1, 0) = 0LL;
  return result;
}

void sub_500E0(uint64_t a1)
{
}

void sub_500E8(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
  unsigned int v9 = [v8 containsString:v10];

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a3);
    *a4 = 1;
  }
}

void sub_5017C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_501A0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 isEqualToString:@"OTHERS"])
  {
    fwrite( "Invalid key group 'OTHERS' -- keys remaining after grouping is complete will automatically go into the 'OTHERS' group\n",  0x76uLL,  1uLL,  __stderrp);
    abort();
  }

  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"AREA"]);

  if (v8)
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"AREA"]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"RECT"]);
    v59 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"OVAL"]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"REFKEYRECT"]);
    if (!v11)
    {
      fprintf( __stderrp, "Missing REFKEYRECT in area key group '%s'\n", (const char *)[v5 UTF8String]);
      abort();
    }

    if (v10 && v59)
    {
      v57 = __stderrp;
      [v5 UTF8String];
      fprintf(v57, "Invalid area key group '%s' - both RECT and OVAL specified.\n");
    }

    else
    {
      if (v10)
      {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"TOPPCT"]);
        [v12 doubleValue];
        double v14 = v13;

        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"LEFTPCT"]);
        [v15 doubleValue];
        double v17 = v16;

        CGRect v18 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"HEIGHTPCT"]);
        [v18 doubleValue];
        double v20 = v19;

        id v21 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"WIDTHPCT"]);
        [v21 doubleValue];
        double v23 = v22 / 100.0;

        NSFileProtectionType v24 = *(double **)(*(void *)(a1 + 64) + 8LL);
        double v25 = v24[8];
        double v26 = v24[9];
        double v27 = v24[6] + v25 * (v17 / 100.0);
        double v28 = v24[7] + v26 * (v14 / 100.0);
        double v29 = v23 * v25;
        double v30 = v20 / 100.0 * v26;
        v77[0] = _NSConcreteStackBlock;
        v77[1] = 3221225472LL;
        v77[2] = sub_50854;
        v77[3] = &unk_89AE0;
        double v58 = v27;
        double v80 = v27;
        double v81 = v28;
        double v82 = v29;
        double v83 = v30;
        uint64_t v31 = *(void **)(a1 + 32);
        id v78 = *(id *)(a1 + 40);
        uint64_t v32 = v7;
        v79 = v32;
        [v31 enumerateKeysAndObjectsUsingBlock:v77];

        __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"TOPPCT"]);
        [v33 doubleValue];
        double v35 = v34;

        __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"LEFTPCT"]);
        [v36 doubleValue];
        double v38 = v37;

        __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"HEIGHTPCT"]);
        [v39 doubleValue];
        double v41 = v40;

        uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"WIDTHPCT"]);
        [v42 doubleValue];
        double v43 = v35 / 100.0;
        double v44 = v41 / 100.0;
        double v46 = v45 / 100.0;

        CGFloat v47 = v58 + v29 * (v38 / 100.0);
        CGFloat v48 = v28 + v30 * v43;
        CGFloat v49 = v29 * v46;
        CGFloat v50 = v30 * v44;
        v84.origin.CGFloat x = v47;
        v84.origin.CGFloat y = v48;
        v84.size.CGFloat width = v49;
        v84.size.CGFloat height = v50;
        CGFloat MidX = CGRectGetMidX(v84);
        v85.origin.CGFloat x = v47;
        v85.origin.CGFloat y = v48;
        v85.size.CGFloat width = v49;
        v85.size.CGFloat height = v50;
        CGFloat MidY = CGRectGetMidY(v85);
        v76[0] = 0LL;
        v76[1] = v76;
        v76[2] = 0x2020000000LL;
        v76[3] = 0x7FF0000000000000LL;
        uint64_t v70 = 0LL;
        v71 = &v70;
        uint64_t v72 = 0x3032000000LL;
        uint64_t v73 = sub_500D0;
        v74 = sub_500E0;
        id v75 = 0LL;
        v60[0] = _NSConcreteStackBlock;
        v60[1] = 3221225472LL;
        v60[2] = sub_50910;
        v60[3] = &unk_89B08;
        id v53 = *(id *)(a1 + 32);
        CGFloat v64 = v47;
        CGFloat v65 = v48;
        CGFloat v66 = v49;
        CGFloat v67 = v50;
        CGFloat v68 = MidX;
        CGFloat v69 = MidY;
        id v61 = v53;
        v62 = v76;
        v63 = &v70;
        -[NSMutableSet enumerateObjectsUsingBlock:](v32, "enumerateObjectsUsingBlock:", v60);
        uint64_t v54 = v71[5];
        if (!v54)
        {
          fprintf( __stderrp, "No reference key found in area for key group '%s'\n", (const char *)[v5 UTF8String]);
          abort();
        }

        [*(id *)(a1 + 48) setObject:v54 forKey:v5];

        _Block_object_dispose(&v70, 8);
        _Block_object_dispose(v76, 8);

        goto LABEL_10;
      }

      v56 = __stderrp;
      if (v59)
      {
        sub_55920(__stderrp);
      }

      else
      {
        [v5 UTF8String];
        fprintf(v56, "Invalid area key group '%s' - no RECT or OVAL specified.\n");
      }
    }

    abort();
  }

  v55 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"NAMES"]);

  if (v55)
  {
    fwrite("NYI", 3uLL, 1uLL, __stderrp);
    abort();
  }

void sub_50744( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, char a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, id a33, char a34)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a34, 8);

  _Unwind_Resume(a1);
}

void sub_50854(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  CGFloat v6 = *(double *)(a1 + 48);
  CGFloat v7 = *(double *)(a1 + 56);
  CGFloat v8 = *(double *)(a1 + 64);
  CGFloat v9 = *(double *)(a1 + 72);
  [v5 center];
  v13.CGFloat x = v10;
  v13.CGFloat y = v11;
  v14.origin.CGFloat x = v6;
  v14.origin.CGFloat y = v7;
  v14.size.CGFloat width = v8;
  v14.size.CGFloat height = v9;
  if (CGRectContainsPoint(v14, v13) && [*(id *)(a1 + 32) containsObject:v12])
  {
    [*(id *)(a1 + 40) addObject:v12];
    [*(id *)(a1 + 32) removeObject:v12];
  }
}

void sub_508F8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_50910(uint64_t a1, void *a2)
{
  id v11 = a2;
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKey:"));
  [v4 center];
  double v6 = v5;
  double v8 = v7;

  v12.CGFloat x = v6;
  v12.CGFloat y = v8;
  if (CGRectContainsPoint(*(CGRect *)(a1 + 56), v12))
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8LL);
    if (v9 < *(double *)(v10 + 24))
    {
      *(double *)(v10 + 24) = v9;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), a2);
    }
  }
}

void sub_509D0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_509F0(uint64_t a1, void *a2)
{
  id v4 = a2;
  __int128 v3 = objc_alloc_init(&OBJC_CLASS___TIFitAffineMLLMatrixWrapper);
  [*(id *)(a1 + 32) setObject:v3 forKey:v4];
}

void sub_50A44( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_50A64(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKey:v5]);
  if (!v7)
  {
    fprintf( __stderrp, "Invalid AFFINES entry %s: Must match an ASSIGNMENT group.\n", (const char *)[v5 UTF8String]);
    abort();
  }

  double v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"VALUES"]);

  if (v8)
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"VALUES"]);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0 || [v9 count] != (char *)&dword_4 + 2)
    {
      fprintf( __stderrp, "VALUES should be an array of 6 numbers in AFFINES entry %s.\n", (const char *)[v5 UTF8String]);
      abort();
    }

    uint64_t v64 = 0LL;
    CGFloat v65 = &v64;
    uint64_t v66 = 0x5812000000LL;
    CGFloat v67 = sub_511E0;
    CGFloat v68 = sub_511EC;
    CGFloat v69 = &unk_7EC7A;
    TIFitAffineMLLMatrix::TIFitAffineMLLMatrix((TIFitAffineMLLMatrix *)&v70, 2uLL, 3uLL);
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472LL;
    v61[2] = sub_511FC;
    v61[3] = &unk_89B80;
    id v11 = v5;
    id v62 = v11;
    v63 = &v64;
    [v9 enumerateObjectsUsingBlock:v61];
    CGPoint v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKey:v11]);
    [v12 setMatrix:v65 + 6];

    _Block_object_dispose(&v64, 8);
    sub_519E4((uint64_t)v71, v71[1]);
  }

  else
  {
    CGPoint v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"TRANS"]);
    v59 = v13;
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v6 objectForKey:@"ROTRAD"]);
    if (!v14)
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"ROTDEG"]);
      double v16 = v15;
      if (!v15
        || ([v15 doubleValue],
            uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v17 * 3.14159265 / 180.0)),
            v16,
            !v14))
      {
        CGRect v18 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"ROTGRA"]);
        double v19 = v18;
        if (v18)
        {
          [v18 doubleValue];
          uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v20 * 3.14159265 / 200.0));
        }

        else
        {
          uint64_t v14 = 0LL;
        }
      }
    }

    id v21 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"SKEWROTRAD"]);
    v60 = (void *)v14;
    if (!v21)
    {
      double v22 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"SKEWROTDEG"]);
      double v23 = v22;
      if (!v22
        || ([v22 doubleValue],
            id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  v24 * 3.14159265 / 180.0)),  v23,  !v21))
      {
        double v25 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"SKEWROTGRA"]);
        double v26 = v25;
        if (v25)
        {
          [v25 doubleValue];
          id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  v27 * 3.14159265 / 200.0));
        }

        else
        {
          id v21 = 0LL;
        }
      }
    }

    double v28 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"SCALE"]);
    double v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKey:v5]);
    [v60 doubleValue];
    objc_msgSend(v29, "setRotation:");
    [v21 doubleValue];
    objc_msgSend(v29, "setSkewRotation:");
    if (v13)
    {
      double v30 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"XPCT"]);
      uint64_t v31 = v30;
      if (v30) {
        id v32 = v30;
      }
      else {
        id v32 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 0.0));
      }
      __int128 v33 = v32;

      double v34 = (void *)objc_claimAutoreleasedReturnValue([v59 objectForKey:@"YPCT"]);
      double v35 = v34;
      if (v34) {
        id v36 = v34;
      }
      else {
        id v36 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 0.0));
      }
      double v37 = v36;

      double v38 = *(void **)(a1 + 40);
      __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) objectForKey:v5]);
      double v40 = (void *)objc_claimAutoreleasedReturnValue([v38 objectForKey:v39]);
      [v40 frame];
      double v42 = v41;
      double v44 = v43;

      [v33 doubleValue];
      double v46 = v45;
      [v37 doubleValue];
      [v29 setXTrans:v42 * (v46 / 100.0) yTrans:v44 * (v47 / 100.0)];

      CGPoint v13 = v59;
    }

    if (v28)
    {
      CGFloat v48 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKey:@"XPCT"]);
      CGFloat v49 = v48;
      if (v48) {
        id v50 = v48;
      }
      else {
        id v50 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 100.0));
      }
      v51 = v50;

      uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKey:@"YPCT"]);
      id v53 = v52;
      if (v52) {
        id v54 = v52;
      }
      else {
        id v54 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 100.0));
      }
      v55 = v54;

      [v51 doubleValue];
      double v57 = v56;
      [v55 doubleValue];
      [v29 setXScale:v57 / 100.0 yScale:v58 / 100.0];

      CGPoint v13 = v59;
    }
  }
}

void sub_51090( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28)
{
  _Unwind_Resume(a1);
}

TIFitAffineMLLMatrix *sub_511E0(uint64_t a1, uint64_t a2)
{
  return TIFitAffineMLLMatrix::TIFitAffineMLLMatrix( (TIFitAffineMLLMatrix *)(a1 + 48),  (const TIFitAffineMLLMatrix *)(a2 + 48));
}

void sub_511EC(uint64_t a1)
{
}

void sub_511FC(uint64_t a1, void *a2, unint64_t a3)
{
  id v6 = a2;
  if ((objc_opt_respondsToSelector(v6, "doubleValue") & 1) == 0)
  {
    fprintf( __stderrp, "VALUES entry %ld in AFFINES entry %s is not a number or string.\n", a3, (const char *)[*(id *)(a1 + 32) UTF8String]);
    abort();
  }

  [v6 doubleValue];
  *(void *)TIFitAffineMLLMatrix::operator()(*(void *)(*(void *)(a1 + 40) + 8LL) + 48LL, a3 / 3, a3 % 3) = v5;
}

void sub_512C0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
}

void sub_512D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:v3]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v5]);

  [v6 frame];
  double v8 = v7;
  double v10 = v9;
  v17[0] = @"GAUSSIAN_ERROR_STDDEV_X";
  id v11 = *(void **)(a1 + 48);
  [*(id *)(a1 + 56) doubleValue];
  CGPoint v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v8 * (v12 / 100.0)));
  v18[0] = v13;
  v17[1] = @"GAUSSIAN_ERROR_STDDEV_Y";
  [*(id *)(a1 + 64) doubleValue];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v10 * (v14 / 100.0)));
  v17[2] = @"SCALE_ERROR_UNITS_TO_POINTS";
  v18[1] = v15;
  v18[2] = &off_8FFD8;
  double v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  3LL));
  [v11 setObject:v16 forKey:v3];
}

void sub_51454(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_514A8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = *(void **)(a1 + 32);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_5171C;
  v29[3] = &unk_89BF8;
  id v28 = v5;
  id v30 = v28;
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 keysOfEntriesPassingTest:v29]);
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 anyObject]);
  double v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:v9]);
  id v11 = *(void **)(a1 + 48);
  double v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) objectForKey:v9]);
  CGPoint v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v12]);

  [v13 frame];
  CGFloat x = v31.origin.x;
  CGFloat y = v31.origin.y;
  CGFloat width = v31.size.width;
  CGFloat height = v31.size.height;
  double MidX = CGRectGetMidX(v31);
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v32);
  [v6 center];
  double v21 = v20;
  [v6 center];
  objc_msgSend(v10, "transformedPoint:", v21 - MidX, v22 - MidY);
  objc_msgSend(v6, "setCenter:", MidX + v23, MidY + v24);
  double v25 = objc_alloc(&OBJC_CLASS___TIGaussianErrorGenerator);
  double v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) objectForKey:v9]);
  double v27 = -[TIGaussianErrorGenerator initWithAttributes:](v25, "initWithAttributes:", v26);

  [v6 setErrorGenerator:v27];
  [v6 setRotationMatrix:v10];
}

void sub_5168C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_5171C(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id result = [a3 containsObject:*(void *)(a1 + 32)];
  *a4 = (_BYTE)result;
  return result;
}

void sub_51828(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_5196C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_519E4(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_519E4(a1, *a2);
    sub_519E4(a1, a2[1]);
    operator delete(a2);
  }

void sub_51A24()
{
  Class v0 = objc_autoreleasePoolPush();
  __cxa_atexit((void (*)(void *))sub_2B834, &unk_AA2A8, &dword_0);
  objc_autoreleasePoolPop(v0);
}

void sub_51B1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_51D34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_51F30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_31:
            id v4 = 0LL;
            goto LABEL_32;
          }

void sub_524CC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15, void *a16)
{
}

uint64_t sub_526CC(void *a1)
{
  id v1 = &unk_AA000;
  unsigned int v2 = &__stderrp;
  if (dword_AA430) {
    fwrite("Starting parse\n", 0xFuLL, 1uLL, __stderrp);
  }
  int v73 = 0;
  int v69 = 0;
  int v3 = 0;
  dword_AA434 = 0;
  id v4 = &unk_AA000;
  dword_AA438 = -2;
  __src = v76;
  unint64_t v5 = 200LL;
  v71 = v78;
  unint64_t v66 = 128LL;
  id v6 = (__int16 *)v77;
  double v7 = v77;
  double v8 = (uint64_t *)v76;
  while (1)
  {
    *(_WORD *)double v7 = v3;
    if (v5 >> 4 > 0x270) {
      break;
    }
    double v9 = v2;
    uint64_t v10 = 2 * v5 >= 0x2710 ? 10000LL : 2 * v5;
    id v11 = (__int16 *)malloc(10 * v10 + 7);
    if (!v11) {
      break;
    }
    double v12 = v11;
    uint64_t v13 = (v7 - (char *)v6) >> 1;
    uint64_t v14 = v13 + 1;
    memcpy(v11, v6, 2 * (v13 + 1));
    int64_t v15 = v10;
    double v16 = (char *)v12 + ((2 * v10 + 7) & 0xFFFFFFFFFFFFFFF8LL);
    memcpy(v16, __src, 8 * (v13 + 1));
    if (v1[268]) {
      fprintf(*v9, "Stack size increased to %lu\n", v15);
    }
    double v7 = (char *)&v12[v13];
    double v8 = (uint64_t *)&v16[8 * v14 - 8];
    if (v15 <= v14)
    {
      uint64_t v60 = 1LL;
      id v4 = (_DWORD *)&unk_AA000;
      goto LABEL_134;
    }

    id v6 = v12;
    __src = v16;
    id v4 = (_DWORD *)&unk_AA000;
    unint64_t v5 = v15;
    unsigned int v2 = v9;
LABEL_16:
    if (v1[268])
    {
      fprintf(*v2, "Entering state %d\n", v3);
      id v4 = &unk_AA000;
    }

    unint64_t v75 = v5;
    if (((0x2FF8FA79F0uLL >> v3) & 1) != 0) {
      goto LABEL_49;
    }
    int v17 = byte_8237F[v3];
    int v18 = v4[270];
    if (v18 == -2)
    {
      if (v1[268]) {
        fwrite("Reading a token: ", 0x11uLL, 1uLL, *v2);
      }
      int v18 = sub_53BC0(a1);
      id v4 = &unk_AA000;
      dword_AA438 = v18;
    }

    if (v18 <= 0)
    {
      v4[270] = 0;
      if (v1[268])
      {
        fwrite("Now at end of input.\n", 0x15uLL, 1uLL, *v2);
        id v4 = (_DWORD *)&unk_AA000;
      }

      unsigned int v19 = 0;
    }

    else
    {
      else {
        unsigned int v19 = byte_823A5[v18];
      }
      if (v1[268])
      {
        fprintf(*v2, "%s ", "Next token is");
        double v20 = __stderrp;
        if (v19 >= 0x12) {
          fprintf(__stderrp, "nterm %s (");
        }
        else {
          fprintf(__stderrp, "token %s (");
        }
        double v21 = v20;
        unsigned int v2 = &__stderrp;
        fputc(41, v21);
        fputc(10, __stderrp);
        id v4 = &unk_AA000;
      }
    }

    uint64_t v22 = v19 + v17;
    int v73 = v19;
    if (v22 > 0x27 || v19 != byte_824B6[v22])
    {
LABEL_49:
      if (((0x100705060FuLL >> v3) & 1) == 0)
      {
        CGFloat v67 = v7;
        unsigned int v27 = byte_82506[v3];
        goto LABEL_51;
      }
    }

    else
    {
      int v23 = byte_824DE[v22];
      if (((0x7400000001uLL >> v22) & 1) == 0)
      {
        if ((_DWORD)v22 == 23)
        {
          uint64_t v60 = 0LL;
          double v12 = v6;
          goto LABEL_134;
        }

        int v24 = v69 - 1;
        if (!v69) {
          int v24 = 0;
        }
        int v69 = v24;
        if (v1[268])
        {
          fprintf(*v2, "%s ", "Shifting");
          double v25 = __stderrp;
          if (v19 >= 0x12) {
            fprintf(__stderrp, "nterm %s (");
          }
          else {
            fprintf(__stderrp, "token %s (");
          }
          double v26 = v25;
          unsigned int v2 = &__stderrp;
          fputc(41, v26);
          fputc(10, __stderrp);
          id v4 = &unk_AA000;
        }

        if (v4[270]) {
          v4[270] = -2;
        }
        v8[1] = qword_AA440;
        ++v8;
        goto LABEL_131;
      }

      if (((0x7400000000uLL >> v22) & 1) == 0)
      {
        CGFloat v67 = v7;
        unsigned int v27 = -v23;
LABEL_51:
        uint64_t v28 = v27;
        unint64_t v70 = byte_8252C[v27];
        uint64_t v68 = v8[1 - v70];
        if (v1[268])
        {
          fprintf(*v2, "Reducing stack by rule %d (line %lu):\n", v27 - 1, byte_825A0[v27]);
          if ((_DWORD)v28)
          {
            uint64_t v29 = 0LL;
            if (v70 <= 1) {
              int v30 = 1;
            }
            else {
              int v30 = v70;
            }
            do
            {
              int v31 = v29 + 1;
              fprintf(*v2, "   $%d = ", v29 + 1);
              CGRect v32 = __stderrp;
              if (byte_825BC[byte_82604[v28] + v29] < 18) {
                fprintf(__stderrp, "token %s (");
              }
              else {
                fprintf(__stderrp, "nterm %s (");
              }
              __int128 v33 = v32;
              unsigned int v2 = &__stderrp;
              fputc(41, v33);
              fputc(10, __stderrp);
              ++v29;
            }

            while (v30 != v31);
            goto LABEL_60;
          }

          id v1 = (_DWORD *)&unk_AA000;
          double v34 = v67;
          unsigned int v35 = v68;
        }

        else
        {
LABEL_60:
          double v34 = v67;
          id v1 = (_DWORD *)&unk_AA000;
          unsigned int v35 = v68;
          switch((int)v28)
          {
            case 5:
              sub_532B4(a1, *v8);
              break;
            case 6:
              sub_53318(a1, *v8);
              break;
            case 7:
              sub_53384(a1, *v8);
              break;
            case 8:
              sub_533F0(a1, *v8);
              break;
            case 9:
            case 10:
            case 13:
            case 14:
            case 15:
            case 20:
            case 21:
            case 22:
              break;
            case 11:
              [a1 handleNewLine];
              break;
            case 12:
              sub_556BC();
              break;
            case 16:
              sub_53460(a1, *(v8 - 1), *(_DWORD *)v8);
              break;
            case 17:
              sub_534DC(a1, *(v8 - 1), *(unsigned int *)v8);
              break;
            case 18:
            case 19:
              sub_53550(a1, *(v8 - 1), *v8);
              break;
            case 23:
            case 24:
              uint64_t v51 = *(v8 - 1);
              uint64_t v52 = *v8;
              id v53 = a1;
              goto LABEL_115;
            case 25:
              uint64_t v51 = *v8;
              id v53 = a1;
              uint64_t v52 = 0LL;
LABEL_115:
              sub_535E4(v53, v51, v52);
              break;
            case 26:
              unsigned int v35 = 1;
              break;
            case 27:
              unsigned int v35 = 0;
              break;
            default:
              id v1 = &unk_AA000;
              unsigned int v35 = v68;
              break;
          }
        }

        if (v1[268])
        {
          fprintf(*v2, "%s ", "-> $$ =");
          id v54 = __stderrp;
          int v55 = v28;
          uint64_t v56 = byte_82548[v28];
          if (v55) {
            fprintf(__stderrp, "nterm %s (");
          }
          else {
            fprintf(__stderrp, "token %s (");
          }
          double v57 = v54;
          unsigned int v2 = &__stderrp;
          fputc(41, v57);
          fputc(10, __stderrp);
          double v58 = &v8[-v70];
          double v7 = &v34[-2 * v70];
          if (v1[268]) {
            sub_53688(v6, (unint64_t)v7);
          }
        }

        else
        {
          double v58 = &v8[-v70];
          uint64_t v56 = byte_82548[v28];
          double v7 = &v34[-2 * v70];
        }

        v58[1] = v35 | v68 & 0xFFFFFFFF00000000LL;
        double v8 = v58 + 1;
        uint64_t v59 = (*(__int16 *)v7 + byte_82564[v56 - 18]);
        else {
          int v23 = byte_8256F[v56 - 18];
        }
        id v4 = (_DWORD *)&unk_AA000;
        goto LABEL_131;
      }
    }

    if (v69 == 3)
    {
      int v43 = v4[270];
      if (v43 <= 0)
      {
        if (!v43)
        {
          uint64_t v60 = 1LL;
          goto LABEL_140;
        }
      }

      else
      {
        double v44 = v4;
        sub_539BC("Error: discarding", v73, (void **)&qword_AA440);
        v44[270] = -2;
      }
    }

    else if (!v69)
    {
      ++dword_AA434;
      uint64_t v36 = sub_5370C(0LL, v3, v4[270]);
      uint64_t v37 = v36;
      unint64_t v38 = v66;
      if (v66 < v36)
      {
        if (v36 < 0) {
          size_t v39 = -1LL;
        }
        else {
          size_t v39 = 2 * v36;
        }
        if (v71 != v78) {
          free(v71);
        }
        double v40 = malloc(v39);
        double v41 = v78;
        if (v40) {
          double v41 = v40;
        }
        v71 = v41;
        if (v40) {
          unint64_t v38 = v39;
        }
        else {
          unint64_t v38 = 128LL;
        }
      }

      unint64_t v66 = v38;
      if (v37 - 1 >= v38)
      {
        uint64_t v45 = sub_55578();
        sub_53AA0(a1, (uint64_t)"syntax error", v45);
        if (v37) {
          break;
        }
      }

      else
      {
        sub_5370C(v71, v3, dword_AA438);
        uint64_t v42 = sub_55578();
        sub_53AA0(a1, (uint64_t)v71, v42);
      }
    }

    double v46 = (__int16 *)(v7 - 2);
    ++v8;
    while (1)
    {
      if (((0x2FF8FA79F0uLL >> v3) & 1) == 0 && ((0x100304060FuLL >> v3) & 1) != 0)
      {
        int v47 = byte_8237F[v3] + 1;
        BOOL v48 = byte_8237F[v3] == 10 || v47 == 1;
        if (v48 && ((0x8BFFFFFFFEuLL >> v47) & 1) != 0) {
          break;
        }
      }

      --v8;
      if (v46 + 1 == v6)
      {
        uint64_t v60 = 1LL;
        double v12 = v6;
        double v7 = (char *)v6;
        goto LABEL_133;
      }

      sub_539BC("Error: popping", byte_8257A[v3], (void **)v8);
      int v3 = *v46;
      if (v1[268]) {
        sub_53688(v6, (unint64_t)v46);
      }
      --v46;
    }

    int v23 = byte_824DE[byte_8237F[v3] + 1];
    uint64_t *v8 = qword_AA440;
    double v7 = (char *)(v46 + 1);
    if (v1[268])
    {
      fprintf(__stderrp, "%s ", "Shifting");
      CGFloat v49 = __stderrp;
      if (((0x1BE3ECC1FFuLL >> v23) & 1) != 0) {
        fprintf(__stderrp, "token %s (");
      }
      else {
        fprintf(__stderrp, "nterm %s (");
      }
      id v50 = v49;
      unsigned int v2 = &__stderrp;
      fputc(41, v50);
      fputc(10, __stderrp);
      int v69 = 3;
    }

    else
    {
      int v69 = 3;
      unsigned int v2 = &__stderrp;
    }

    id v4 = (_DWORD *)&unk_AA000;
LABEL_131:
    v7 += 2;
    int v3 = v23;
    unint64_t v5 = v75;
  }

  uint64_t v65 = sub_55578();
  sub_53AA0(a1, (uint64_t)"memory exhausted", v65);
  uint64_t v60 = 2LL;
  double v12 = v6;
LABEL_133:
  id v4 = &unk_AA000;
LABEL_134:
  int v61 = v4[270];
  if (v61 != -2 && v61 != 0) {
    sub_539BC("Cleanup: discarding lookahead", v73, (void **)&qword_AA440);
  }
  id v6 = v12;
LABEL_140:
  if (v1[268]) {
    sub_53688(v6, (unint64_t)v7);
  }
  for (; v7 != (char *)v6; --v8)
  {
    uint64_t v63 = *(__int16 *)v7;
    v7 -= 2;
    sub_539BC("Cleanup: popping", byte_8257A[v63], (void **)v8);
  }

  if (v71 != v78) {
    free(v71);
  }
  return v60;
}

void sub_532B4(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2));
  [v3 handleTyping:v4];
}

void sub_53318(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2));
  [v3 handleCorrectionMatch:v4 lineNumber:sub_55578()];
}

void sub_53384(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2));
  [v3 handlePredictionMatch:v4 lineNumber:sub_55578()];
}

void sub_533F0(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2));
  [v3 handleDocumentMatch:v4 lineNumber:sub_55578()];
}

void sub_53460(void *a1, uint64_t a2, int a3)
{
  id v5 = a1;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2));
  [v5 handleBoolConfig:v6 withValue:a3 != 0 lineNumber:sub_55578()];
}

void sub_534DC(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2));
  [v5 handleIntConfig:v6 withValue:a3 lineNumber:sub_55578()];
}

void sub_53550(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a3));
  [v5 handleStringConfig:v7 withValue:v6 lineNumber:sub_55578()];
}

void sub_535E4(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2));
  if (a3) {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a3));
  }
  else {
    id v6 = 0LL;
  }
  [v5 handleCommand:v7 withValue:v6 lineNumber:sub_55578()];

  if (a3) {
}
  }

uint64_t sub_53688(__int16 *a1, unint64_t a2)
{
  while ((unint64_t)a1 <= a2)
  {
    int v4 = *a1++;
    fprintf(__stderrp, " %d", v4);
  }

  return fputc(10, __stderrp);
}

uint64_t sub_5370C(_BYTE *a1, int a2, unsigned int a3)
{
  if (((0x100705860FuLL >> a2) & 1) != 0)
  {
    char v5 = a2;
    int v6 = byte_8237F[a2];
    if (a3 > 0x110) {
      uint64_t v7 = 2LL;
    }
    else {
      uint64_t v7 = byte_823A5[a3];
    }
    double v8 = off_89C40[v7];
    uint64_t v9 = sub_53B0C(0LL, v8);
    v37[0] = v8;
    strcpy(v36, "syntax error, unexpected %s");
    if (((0x2FFCFBF9F0uLL >> v5) & 1) != 0) {
      int v10 = -v6;
    }
    else {
      int v10 = 0;
    }
    if (40 - v6 >= 18) {
      int v11 = 18;
    }
    else {
      int v11 = 40 - v6;
    }
    if (v10 < v11)
    {
      int v12 = 0;
      uint64_t v13 = &v36[27];
      uint64_t v14 = v10;
      uint64_t v15 = v6;
      uint64_t v16 = v11;
      int v17 = ", expecting %s";
      int v18 = 1;
      uint64_t v35 = v9;
      unint64_t v19 = v9;
      while (1)
      {
        if (v14 != 1 && (_DWORD)v14 == byte_824B6[v14 + v15])
        {
          if (v18 == 5)
          {
            v36[27] = 0;
            int v18 = 1;
            unint64_t v19 = v35;
            goto LABEL_27;
          }

          double v20 = off_89C40[v14];
          v37[v18] = v20;
          uint64_t v21 = sub_53B0C(0LL, v20);
          BOOL v22 = __CFADD__(v21, v19);
          v19 += v21;
          int v23 = v22;
          --v13;
          do
          {
            int v24 = *(unsigned __int8 *)v17++;
            *++uint64_t v13 = v24;
          }

          while (v24);
          ++v18;
          v12 |= v23;
          int v17 = " or %s";
        }

        if (++v14 == v16) {
          goto LABEL_27;
        }
      }
    }

    int v12 = 0;
    int v18 = 1;
    unint64_t v19 = v9;
LABEL_27:
    uint64_t v25 = 0LL;
    while (v36[v25++])
      ;
    unint64_t v3 = v19 + v25 - 1;
    if (v12 | (v3 < v19)) {
      return -1LL;
    }
    if (!a1) {
      return v3;
    }
    int v28 = 0;
    for (uint64_t i = v36; ; i += v33)
    {
      int v30 = *i;
      *a1 = v30;
      if (v30 != 37) {
        break;
      }
      if (i[1] != 115 || v28 >= v18) {
        goto LABEL_41;
      }
      int v34 = v28 + 1;
      uint64_t v32 = sub_53B0C((uint64_t)a1, (_BYTE *)v37[v28]);
      uint64_t v33 = 2LL;
      int v28 = v34;
LABEL_43:
      a1 += v32;
    }

    if (!v30) {
      return v3;
    }
LABEL_41:
    uint64_t v32 = 1LL;
    uint64_t v33 = 1LL;
    goto LABEL_43;
  }

  return 0LL;
}

void sub_5398C(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_55578();
  sub_53AA0(a1, a2, v4);
}

void sub_539BC(const char *a1, int a2, void **a3)
{
  if (dword_AA430)
  {
    char v5 = "Deleting";
    if (a1) {
      char v5 = a1;
    }
    fprintf(__stderrp, "%s ", v5);
    int v6 = __stderrp;
    if (a2 >= 18) {
      fprintf(__stderrp, "nterm %s (");
    }
    else {
      fprintf(__stderrp, "token %s (");
    }
    fputc(41, v6);
    fputc(10, __stderrp);
  }

void sub_53AA0(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2));
  [v5 reportSyntaxErrors:v6 lineNumber:a3];
}

uint64_t sub_53B0C(uint64_t a1, _BYTE *a2)
{
  if (*a2 != 34)
  {
LABEL_13:
    uint64_t v10 = 0LL;
    if (a1)
    {
      do
      {
        int v11 = a2[v10];
        *(_BYTE *)(a1 + v10++) = v11;
      }

      while (v11);
    }

    else
    {
      while (a2[v10++])
        ;
    }

    return v10 - 1;
  }

  uint64_t v2 = 0LL;
  unint64_t v3 = a2;
  for (i = a2; ; unint64_t v3 = i)
  {
    int v6 = (char)*++i;
    int v5 = v6;
    char v7 = v6;
    if (v6 > 91)
    {
      if (v5 == 92)
      {
        int v9 = v3[2];
        double v8 = v3 + 2;
        if (v9 != 92) {
          goto LABEL_13;
        }
        char v7 = 92;
        uint64_t i = v8;
      }

      goto LABEL_10;
    }

    if (v5 == 34) {
      break;
    }
    if (v5 == 39 || v5 == 44) {
      goto LABEL_13;
    }
LABEL_10:
    if (a1) {
      *(_BYTE *)(a1 + v2) = v7;
    }
    ++v2;
  }

  if (a1) {
    *(_BYTE *)(a1 + v2) = 0;
  }
  return v2;
}

uint64_t sub_53BC0(void *a1)
{
  id v1 = &unk_AA000;
  uint64_t v2 = &unk_AA000;
  unint64_t v3 = &unk_AA000;
  uint64_t v4 = &unk_AA000;
  if ((byte_AA3E0 & 1) == 0)
  {
    byte_AA3E0 = 1;
    if (!dword_AA3E4) {
      dword_AA3E4 = 1;
    }
    if (!qword_AA448) {
      qword_AA448 = (uint64_t)__stdinp;
    }
    if (!qword_AA450) {
      qword_AA450 = (uint64_t)__stdoutp;
    }
    uint64_t v5 = qword_AA3E8;
    if (!qword_AA3E8 || (v6 = qword_AA3F0, (uint64_t v7 = *(void *)(qword_AA3E8 + 8 * qword_AA3F0)) == 0))
    {
      sub_54CA8();
      uint64_t v7 = sub_54D50((FILE *)qword_AA448, 0x4000);
      uint64_t v5 = qword_AA3E8;
      uint64_t v6 = qword_AA3F0;
      *(void *)(qword_AA3E8 + 8 * qword_AA3F_TIBeginMockingSingletonsWithData(0LL, 0LL, 0LL, 0LL, 1, 0) = v7;
    }

    qword_AA410 = *(void *)(v7 + 32);
    qword_AA3F8 = *(void *)(v7 + 16);
    qword_AA460 = qword_AA3F8;
    qword_AA448 = **(void **)(v5 + 8 * v6);
    byte_AA400 = *(_BYTE *)qword_AA3F8;
  }

  double v8 = &unk_AA000;
  int v9 = (int *)&unk_AA000;
LABEL_13:
  uint64_t v10 = v1[127];
  *(_BYTE *)uint64_t v10 = v2[1024];
  LODWORD(v11) = *(_DWORD *)(*(void *)(v3[125] + 8LL * v4[126]) + 48LL) + dword_AA3E4;
  uint64_t v85 = v10;
  while (1)
  {
    do
    {
LABEL_14:
      uint64_t v12 = byte_8266C[*(unsigned __int8 *)v10];
      if (word_8276C[(int)v11])
      {
        v9[257] = v11;
        v8[129] = v10;
      }

      uint64_t v13 = (int)v11;
      uint64_t v14 = word_8295A[(int)v11] + v12;
      if ((_DWORD)v11 != (__int16)word_82810[v14])
      {
        do
        {
          uint64_t v13 = word_82A08[v13];
          if (v13 >= 82) {
            uint64_t v12 = *((unsigned __int8 *)&unk_82AB6 + v12);
          }
          uint64_t v14 = word_8295A[v13] + v12;
        }

        while (word_82810[v14] != (unsigned __int16)v13);
      }

      uint64_t v11 = word_82AD0[v14];
      ++v10;
    }

    while (word_8295A[v11] != 139);
    while (2)
    {
      int v15 = (unsigned __int16)word_8276C[(int)v11];
      if (!word_8276C[(int)v11])
      {
        uint64_t v10 = v8[129];
        int v15 = (unsigned __int16)word_8276C[v9[257]];
      }

      int v16 = (__int16)v15;
      qword_AA460 = v85;
      qword_AA468 = v10 - v85;
      v2[1024] = *(_BYTE *)v10;
      *(_BYTE *)uint64_t v10 = 0;
      v1[127] = v10;
      if (v15 != 29 && ((0x1EFEFF9DuLL >> v15) & 1) == 0)
      {
        uint64_t v17 = qword_AA468;
        if (qword_AA468)
        {
          int v18 = dword_AA2D0;
          unint64_t v19 = (unsigned __int8 *)qword_AA460;
          do
          {
            int v20 = *v19++;
            if (v20 == 10) {
              dword_AA2D0 = ++v18;
            }
            --v17;
          }

          while (v17);
        }
      }

void *sub_54CA8()
{
  id result = (void *)qword_AA3E8;
  if (qword_AA3E8)
  {
    uint64_t v1 = qword_AA420;
    if (qword_AA3F0 >= (unint64_t)(qword_AA420 - 1))
    {
      id result = realloc((void *)qword_AA3E8, 8 * (qword_AA420 + 8));
      qword_AA3E8 = (uint64_t)result;
      if (result)
      {
        uint64_t v2 = &result[v1];
        v2[2] = 0u;
        v2[3] = 0u;
        _OWORD *v2 = 0u;
        v2[1] = 0u;
        qword_AA420 = v1 + 8;
        return result;
      }

uint64_t sub_54D50(FILE *a1, int a2)
{
  uint64_t v4 = malloc(0x48uLL);
  *(_DWORD *)(v5 + 4_TIBeginMockingSingletonsWithData(0LL, 0LL, 0LL, 0LL, 1, 0) = 1;
  sub_55090(v5, a1);
  return v5;
}

_DWORD *sub_54DC4(int a1)
{
  uint64_t v2 = dword_AA428;
  id result = (_DWORD *)qword_AA418;
  if (dword_AA428 >= dword_AA42C)
  {
    int v4 = dword_AA42C + 25;
    dword_AA42C += 25;
    id result = qword_AA418 ? realloc((void *)qword_AA418, 4LL * v4) : malloc(4LL * v4);
    qword_AA418 = (uint64_t)result;
    if (!result) {
      sub_5505C("out of memory expanding start-condition stack");
    }
  }

  int v5 = dword_AA3E4;
  if (dword_AA3E4 >= 1) {
    int v5 = dword_AA3E4 - 1;
  }
  dword_AA428 = v2 + 1;
  result[v2] = v5 >> 1;
  dword_AA3E4 = (2 * a1) | 1;
  return result;
}

void sub_54E68()
{
  int v0 = dword_AA428;
  unsigned int v1 = --dword_AA428;
  if (v0 <= 0) {
    sub_5505C("start-condition stack underflow");
  }
  dword_AA3E4 = (2 * *(_DWORD *)(qword_AA418 + 4LL * v1)) | 1;
}

uint64_t sub_54EB8()
{
  uint64_t result = (*(_DWORD *)(*(void *)(qword_AA3E8 + 8 * qword_AA3F0) + 48LL) + dword_AA3E4);
  unsigned int v1 = (_BYTE *)qword_AA460;
  if (qword_AA460 < (unint64_t)qword_AA3F8)
  {
    do
    {
      if (*v1) {
        uint64_t v2 = byte_8266C[*v1];
      }
      else {
        uint64_t v2 = &dword_0 + 1;
      }
      if (word_8276C[(int)result])
      {
        dword_AA404 = result;
        qword_AA408 = (uint64_t)v1;
      }

      uint64_t v3 = (int)result;
      uint64_t v4 = word_8295A[(int)result] + v2;
      if ((_DWORD)result != (__int16)word_82810[v4])
      {
        do
        {
          uint64_t v3 = word_82A08[v3];
          if (v3 >= 82) {
            uint64_t v2 = *((unsigned __int8 *)&unk_82AB6 + v2);
          }
          uint64_t v4 = word_8295A[v3] + v2;
        }

        while (word_82810[v4] != (unsigned __int16)v3);
      }

      uint64_t result = word_82AD0[v4];
      ++v1;
    }

    while (v1 != (_BYTE *)qword_AA3F8);
  }

  return result;
}

uint64_t sub_54FA8()
{
  return 1LL;
}

int *sub_54FB0(FILE *a1)
{
  if (!qword_AA3E8 || (uint64_t v2 = *(void *)(qword_AA3E8 + 8 * qword_AA3F0)) == 0)
  {
    sub_54CA8();
    uint64_t v2 = sub_54D50((FILE *)qword_AA448, 0x4000);
    *(void *)(qword_AA3E8 + 8 * qword_AA3F_TIBeginMockingSingletonsWithData(0LL, 0LL, 0LL, 0LL, 1, 0) = v2;
  }

  uint64_t result = sub_55090(v2, a1);
  uint64_t v4 = *(void *)(qword_AA3E8 + 8 * qword_AA3F0);
  uint64_t v5 = *(void *)(v4 + 32);
  qword_AA3F8 = *(void *)(v4 + 16);
  qword_AA460 = qword_AA3F8;
  uint64_t v6 = *(uint64_t **)(qword_AA3E8 + 8 * qword_AA3F0);
  qword_AA410 = v5;
  qword_AA448 = *v6;
  byte_AA400 = *(_BYTE *)qword_AA3F8;
  return result;
}

void sub_5505C(const char *a1)
{
}

int *sub_55090(uint64_t a1, FILE *a2)
{
  int v4 = *__error();
  sub_5525C(a1);
  *(void *)a1 = a2;
  *(_DWORD *)(a1 + 6_TIBeginMockingSingletonsWithData(0LL, 0LL, 0LL, 0LL, 1, 0) = 1;
  uint64_t v5 = qword_AA3E8;
  if (qword_AA3E8) {
    uint64_t v5 = *(void *)(qword_AA3E8 + 8 * qword_AA3F0);
  }
  if (v5 != a1) {
    *(void *)(a1 + 52) = 1LL;
  }
  if (a2)
  {
    int v6 = fileno(a2);
    BOOL v7 = isatty(v6) > 0;
  }

  else
  {
    BOOL v7 = 0;
  }

  *(_DWORD *)(a1 + 44) = v7;
  uint64_t result = __error();
  *uint64_t result = v4;
  return result;
}

void *sub_5512C(uint64_t a1)
{
  uint64_t result = sub_54CA8();
  uint64_t v3 = qword_AA3E8;
  if (qword_AA3E8)
  {
    uint64_t v4 = qword_AA3F0;
    uint64_t v5 = *(void *)(qword_AA3E8 + 8 * qword_AA3F0);
    if (v5 == a1) {
      return result;
    }
    if (v5)
    {
      uint64_t v6 = qword_AA3F8;
      *(_BYTE *)qword_AA3F8 = byte_AA400;
      *(void *)(*(void *)(v3 + 8 * v4) + 16LL) = v6;
      *(void *)(*(void *)(v3 + 8 * v4) + 32LL) = qword_AA410;
    }
  }

  else
  {
    if (!a1) {
      return result;
    }
    uint64_t v4 = qword_AA3F0;
  }

  *(void *)(v3 + 8 * v4) = a1;
  qword_AA410 = *(void *)(a1 + 32);
  qword_AA3F8 = *(void *)(a1 + 16);
  qword_AA460 = qword_AA3F8;
  qword_AA448 = **(void **)(v3 + 8 * v4);
  byte_AA400 = *(_BYTE *)qword_AA3F8;
  return result;
}

void sub_551F0(void **a1)
{
  if (a1)
  {
    if (qword_AA3E8) {
      uint64_t v2 = *(void ***)(qword_AA3E8 + 8 * qword_AA3F0);
    }
    else {
      uint64_t v2 = 0LL;
    }
    if (v2 == a1) {
      *(void *)(qword_AA3E8 + 8 * qword_AA3F_TIBeginMockingSingletonsWithData(0LL, 0LL, 0LL, 0LL, 1, 0) = 0LL;
    }
    if (*((_DWORD *)a1 + 10)) {
      free(a1[1]);
    }
    free(a1);
  }

uint64_t sub_5525C(uint64_t result)
{
  if (result)
  {
    *(void *)(result + 32) = 0LL;
    **(_BYTE **)(result + _Block_object_dispose((const void *)(v1 - 136), 8) = 0;
    *(_BYTE *)(*(void *)(result + 8) + 1LL) = 0;
    *(void *)(result + 16) = *(void *)(result + 8);
    *(_DWORD *)(result + 4_Block_object_dispose((const void *)(v1 - 136), 8) = 1;
    *(_DWORD *)(result + 64) = 0;
    if (qword_AA3E8) {
      uint64_t v1 = *(void *)(qword_AA3E8 + 8 * qword_AA3F0);
    }
    else {
      uint64_t v1 = 0LL;
    }
    if (v1 == result)
    {
      uint64_t v2 = *(void *)(qword_AA3E8 + 8 * qword_AA3F0);
      qword_AA410 = *(void *)(v2 + 32);
      qword_AA3F8 = *(void *)(v2 + 16);
      qword_AA460 = qword_AA3F8;
      qword_AA448 = **(void **)(qword_AA3E8 + 8 * qword_AA3F0);
      byte_AA400 = *(_BYTE *)qword_AA3F8;
    }
  }

  return result;
}

void *sub_552FC(void *result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = sub_54CA8();
    uint64_t v2 = qword_AA3E8;
    uint64_t v3 = qword_AA3F0;
    if (qword_AA3E8)
    {
      if (*(void *)(qword_AA3E8 + 8 * qword_AA3F0))
      {
        uint64_t v4 = qword_AA3F8;
        *(_BYTE *)qword_AA3F8 = byte_AA400;
        *(void *)(*(void *)(v2 + 8 * v3) + 16LL) = v4;
        *(void *)(*(void *)(v2 + 8 * v3++) + 32LL) = qword_AA410;
        qword_AA3F0 = v3;
      }
    }

    *(void *)(v2 + 8 * v3) = v1;
    uint64_t v5 = v1[4];
    qword_AA3F8 = v1[2];
    qword_AA460 = qword_AA3F8;
    uint64_t v6 = *(uint64_t **)(v2 + 8 * v3);
    qword_AA410 = v5;
    qword_AA448 = *v6;
    byte_AA400 = *(_BYTE *)qword_AA3F8;
  }

  return result;
}

void sub_553A4()
{
  if (qword_AA3E8)
  {
    int v0 = *(void ***)(qword_AA3E8 + 8 * qword_AA3F0);
    if (v0)
    {
      sub_551F0(v0);
      uint64_t v1 = qword_AA3E8;
      uint64_t v2 = qword_AA3F0;
      *(void *)(qword_AA3E8 + 8 * qword_AA3F_TIBeginMockingSingletonsWithData(0LL, 0LL, 0LL, 0LL, 1, 0) = 0LL;
      if (v2)
      {
        uint64_t v3 = v2 - 1;
        qword_AA3F0 = v3;
        uint64_t v4 = *(void *)(v1 + 8 * v3);
        if (v4)
        {
          qword_AA410 = *(void *)(v4 + 32);
          qword_AA3F8 = *(void *)(v4 + 16);
          qword_AA460 = qword_AA3F8;
          qword_AA448 = **(void **)(v1 + 8 * v3);
          byte_AA400 = *(_BYTE *)qword_AA3F8;
        }
      }
    }
  }

char *sub_55438(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2 - 2;
  if (a2 < 2 || *(_BYTE *)(a1 + v2) || *(_BYTE *)(a2 + a1 - 1)) {
    return 0LL;
  }
  uint64_t v6 = (char *)malloc(0x48uLL);
  if (!v6) {
    sub_5505C("out of dynamic memory in yy_scan_buffer()");
  }
  uint64_t v4 = v6;
  *((_DWORD *)v6 + 6) = v2;
  *((void *)v6 + 1) = a1;
  *((void *)v6 + 2) = a1;
  *(void *)uint64_t v6 = 0LL;
  *((void *)v6 + 4) = (int)v2;
  *((void *)v6 + 5) = 0LL;
  *((_DWORD *)v6 + 12) = 1;
  *(void *)(v6 + 6_TIBeginMockingSingletonsWithData(0LL, 0LL, 0LL, 0LL, 1, 0) = 0LL;
  sub_5512C((uint64_t)v6);
  return v4;
}

char *sub_554CC(const char *a1)
{
  size_t v2 = (int)strlen(a1);
  return sub_554F4(a1, v2);
}

char *sub_554F4(const void *a1, size_t a2)
{
  unint64_t v4 = a2 + 2;
  uint64_t v5 = malloc(a2 + 2);
  if (!v5) {
    sub_5505C("out of dynamic memory in yy_scan_bytes()");
  }
  uint64_t v6 = (uint64_t)v5;
  if (a2) {
    memcpy(v5, a1, a2);
  }
  *(_WORD *)(v6 + a2) = 0;
  uint64_t result = sub_55438(v6, v4);
  if (!result) {
    sub_5505C("bad buffer in yy_scan_bytes()");
  }
  *((_DWORD *)result + 1_TIBeginMockingSingletonsWithData(0LL, 0LL, 0LL, 0LL, 1, 0) = 1;
  return result;
}

uint64_t sub_55578()
{
  return dword_AA2D0;
}

uint64_t sub_55584()
{
  return qword_AA448;
}

uint64_t sub_55590()
{
  return qword_AA450;
}

uint64_t sub_5559C()
{
  return qword_AA468;
}

uint64_t sub_555A8()
{
  return qword_AA460;
}

uint64_t sub_555B4(uint64_t result)
{
  dword_AA2D0 = result;
  return result;
}

uint64_t sub_555C0(uint64_t result)
{
  qword_AA448 = result;
  return result;
}

uint64_t sub_555CC(uint64_t result)
{
  qword_AA450 = result;
  return result;
}

uint64_t sub_555D8()
{
  return dword_AA458;
}

uint64_t sub_555E4(uint64_t result)
{
  dword_AA458 = result;
  return result;
}

uint64_t sub_555F0()
{
  for (uint64_t i = (void *)qword_AA3E8; qword_AA3E8; uint64_t i = (void *)qword_AA3E8)
  {
    if (!i[qword_AA3F0]) {
      break;
    }
    sub_551F0((void **)i[qword_AA3F0]);
    *(void *)(qword_AA3E8 + 8 * qword_AA3F_TIBeginMockingSingletonsWithData(0LL, 0LL, 0LL, 0LL, 1, 0) = 0LL;
    sub_553A4();
  }

  free(i);
  free((void *)qword_AA418);
  dword_AA2D0 = 1;
  qword_AA3E8 = 0LL;
  qword_AA3F0 = 0LL;
  qword_AA420 = 0LL;
  qword_AA3F8 = 0LL;
  byte_AA3E0 = 0;
  dword_AA3E4 = 0;
  dword_AA428 = 0;
  dword_AA42C = 0;
  qword_AA418 = 0LL;
  qword_AA448 = 0LL;
  qword_AA450 = 0LL;
  return 0LL;
}

void sub_556BC()
{
  dword_AA3E4 = 1;
  dword_AA45C = 0;
}

void sub_556D4(int *a1, os_log_s *a2)
{
  int v2 = *a1;
  v3[0] = 67109376;
  v3[1] = v2;
  __int16 v4 = 1024;
  int v5 = 2;
  _os_log_error_impl( &dword_0,  a2,  OS_LOG_TYPE_ERROR,  "Error: file major version %d incompatible with CURRENT_MAJOR_VERSION_NUMBER %d",  (uint8_t *)v3,  0xEu);
}

void sub_5575C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Unable to parse data from input file", v1, 2u);
}

void sub_5579C(void *a1)
{
}

void sub_55814(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Error loading JSON from a file : %@", (uint8_t *)&v2, 0xCu);
}

void sub_55888(void *a1)
{
}

uint64_t sub_55900()
{
  int v0 = dlerror();
  uint64_t v1 = (FILE *)abort_report_np("%s", v0);
  return sub_55920(v1);
}

size_t sub_55920(FILE *__stream)
{
  return fwrite("NYI", 3uLL, 1uLL, __stream);
}

void operator delete[](void *__p)
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

id objc_msgSend_CGPointValue(void *a1, const char *a2, ...)
{
  return _[a1 CGPointValue];
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_JSONObjectWithStream_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectWithStream:options:error:");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathExtension:");
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_URLForResource_withExtension_subdirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForResource:withExtension:subdirectory:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_URLWithString_relativeToURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:relativeToURL:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__bumpTouchPathID(void *a1, const char *a2, ...)
{
  return _[a1 _bumpTouchPathID];
}

id objc_msgSend__finishKeystrokeAndRecordPredictionsInTypingLog_touchedKey_insertedKey_typingLog_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_finishKeystrokeAndRecordPredictionsInTypingLog:touchedKey:insertedKey:typingLog:");
}

id objc_msgSend__firstLongCharacter(void *a1, const char *a2, ...)
{
  return _[a1 _firstLongCharacter];
}

id objc_msgSend__generateControlPoints_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_generateControlPoints:alpha:");
}

id objc_msgSend__generateTouchPointsOnPath_withSegmentTiming_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_generateTouchPointsOnPath:withSegmentTiming:");
}

id objc_msgSend__getScalar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getScalar:");
}

id objc_msgSend__keyplaneCloserToKeyWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_keyplaneCloserToKeyWithString:");
}

id objc_msgSend__lastLongCharacter(void *a1, const char *a2, ...)
{
  return _[a1 _lastLongCharacter];
}

id objc_msgSend__logStringForTouchedKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_logStringForTouchedKey:");
}

id objc_msgSend__performAcceptCandidate_timestamp_typingLog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performAcceptCandidate:timestamp:typingLog:");
}

id objc_msgSend__performAcceptCandidate_timestamp_typingLog_predictiveCandidate_intendedTransliteration_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performAcceptCandidate:timestamp:typingLog:predictiveCandidate:intendedTransliteration:");
}

id objc_msgSend__performAcceptPredictiveCandidate_timestamp_typingLog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performAcceptPredictiveCandidate:timestamp:typingLog:");
}

id objc_msgSend__performGestureKeyInput_timestamp_typingLog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performGestureKeyInput:timestamp:typingLog:");
}

id objc_msgSend__performRejectCandidate_timestamp_typingLog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performRejectCandidate:timestamp:typingLog:");
}

id objc_msgSend__performTapAtLocation_timestamp_fingerID_secondaryString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performTapAtLocation:timestamp:fingerID:secondaryString:");
}

id objc_msgSend__performTapAtLocation_timestamp_intendedKey_touchedKey_secondaryString_touchError_typingLog_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_performTapAtLocation:timestamp:intendedKey:touchedKey:secondaryString:touchError:typingLog:");
}

id objc_msgSend__performTouchEvent_typingLog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performTouchEvent:typingLog:");
}

id objc_msgSend__performVariantKey_timestamp_typingLog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performVariantKey:timestamp:typingLog:");
}

id objc_msgSend__pointOnCurve_atTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pointOnCurve:atTime:");
}

id objc_msgSend__priorProbabilityForLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_priorProbabilityForLanguage:");
}

id objc_msgSend__priorProbabilityForLanguage_recipient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_priorProbabilityForLanguage:recipient:");
}

id objc_msgSend__rangeOfBackwardDeletionClusterAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rangeOfBackwardDeletionClusterAtIndex:");
}

id objc_msgSend__rangeOfLongCharacterAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rangeOfLongCharacterAtIndex:");
}

id objc_msgSend__setScalar_withValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setScalar:withValue:");
}

id objc_msgSend__skipTapTimestamp_intendedKey_typingLog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_skipTapTimestamp:intendedKey:typingLog:");
}

id objc_msgSend__stringWithUnichar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stringWithUnichar:");
}

id objc_msgSend_abbreviatedDescription(void *a1, const char *a2, ...)
{
  return _[a1 abbreviatedDescription];
}

id objc_msgSend_accentKeyString(void *a1, const char *a2, ...)
{
  return _[a1 accentKeyString];
}

id objc_msgSend_acceptAutocorrection(void *a1, const char *a2, ...)
{
  return _[a1 acceptAutocorrection];
}

id objc_msgSend_acceptCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptCandidate:");
}

id objc_msgSend_acceptCandidate_predictiveCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptCandidate:predictiveCandidate:");
}

id objc_msgSend_acceptCandidateFromPredictionBar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptCandidateFromPredictionBar:");
}

id objc_msgSend_acceptCandidateInputEvent_fromCandidateBar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptCandidateInputEvent:fromCandidateBar:");
}

id objc_msgSend_acceptInputForMode_beforeDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptInputForMode:beforeDate:");
}

id objc_msgSend_acceptPredictiveCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptPredictiveCandidate:");
}

id objc_msgSend_acceptedCandidate(void *a1, const char *a2, ...)
{
  return _[a1 acceptedCandidate];
}

id objc_msgSend_ackWithReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ackWithReply:");
}

id objc_msgSend_activeTouchState(void *a1, const char *a2, ...)
{
  return _[a1 activeTouchState];
}

id objc_msgSend_adaptToReceivedMessages(void *a1, const char *a2, ...)
{
  return _[a1 adaptToReceivedMessages];
}

id objc_msgSend_adaptToSentMessages(void *a1, const char *a2, ...)
{
  return _[a1 adaptToSentMessages];
}

id objc_msgSend_addCharactersInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCharactersInString:");
}

id objc_msgSend_addContact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addContact:");
}

id objc_msgSend_addCurveToPoint_controlPoint1_controlPoint2_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCurveToPoint:controlPoint1:controlPoint2:");
}

id objc_msgSend_addDebugObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDebugObject:forKey:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addEntry_toLexicon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntry:toLexicon:");
}

id objc_msgSend_addError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addError:");
}

id objc_msgSend_addInput_fromVariantKey_fromGestureKey_touchEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addInput:fromVariantKey:fromGestureKey:touchEvent:");
}

id objc_msgSend_addInput_fromVariantKey_touchEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addInput:fromVariantKey:touchEvent:");
}

id objc_msgSend_addKeyWithExactString_frame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addKeyWithExactString:frame:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addPoint_andPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPoint:andPoint:");
}

id objc_msgSend_addResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addResult:");
}

id objc_msgSend_addSample_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSample:");
}

id objc_msgSend_addStringFromGestureKeyInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addStringFromGestureKeyInput:");
}

id objc_msgSend_addStringFromVariantKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addStringFromVariantKey:");
}

id objc_msgSend_addTextEntry_timestamp_senderIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTextEntry:timestamp:senderIdentifier:");
}

id objc_msgSend_addValue_withMin_withMax_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addValue:withMin:withMax:");
}

id objc_msgSend_addValue_withValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addValue:withValue:");
}

id objc_msgSend_additionalIntendedTexts(void *a1, const char *a2, ...)
{
  return _[a1 additionalIntendedTexts];
}

id objc_msgSend_adjustContinuousPathCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adjustContinuousPathCandidate:");
}

id objc_msgSend_adjustCursorByOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adjustCursorByOffset:");
}

id objc_msgSend_adjustForContinuousPath(void *a1, const char *a2, ...)
{
  return _[a1 adjustForContinuousPath];
}

id objc_msgSend_adjustKeyplaneEmulatingKBStar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adjustKeyplaneEmulatingKBStar:");
}

id objc_msgSend_adjustPhraseBoundaryInForwardDirection_granularity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adjustPhraseBoundaryInForwardDirection:granularity:");
}

id objc_msgSend_adjustPhraseBoundaryInForwardDirection_granularity_keyboardState_completionHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adjustPhraseBoundaryInForwardDirection:granularity:keyboardState:completionHandler:");
}

id objc_msgSend_advancePositionByAcceptingCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "advancePositionByAcceptingCandidate:");
}

id objc_msgSend_advancePositionByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "advancePositionByString:");
}

id objc_msgSend_advancePositionForAutospace(void *a1, const char *a2, ...)
{
  return _[a1 advancePositionForAutospace];
}

id objc_msgSend_advanceSegmentCursor(void *a1, const char *a2, ...)
{
  return _[a1 advanceSegmentCursor];
}

id objc_msgSend_advanceSweep(void *a1, const char *a2, ...)
{
  return _[a1 advanceSweep];
}

id objc_msgSend_aggdStatistics(void *a1, const char *a2, ...)
{
  return _[a1 aggdStatistics];
}

id objc_msgSend_alignedTypingSequenceForResult_keystrokeSegmentationMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alignedTypingSequenceForResult:keystrokeSegmentationMode:");
}

id objc_msgSend_alignedTypingSequenceForTransliteratedResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alignedTypingSequenceForTransliteratedResult:");
}

id objc_msgSend_allEvents(void *a1, const char *a2, ...)
{
  return _[a1 allEvents];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allResults(void *a1, const char *a2, ...)
{
  return _[a1 allResults];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return _[a1 alpha];
}

id objc_msgSend_alternateKeyplane(void *a1, const char *a2, ...)
{
  return _[a1 alternateKeyplane];
}

id objc_msgSend_alternateKeyplaneName(void *a1, const char *a2, ...)
{
  return _[a1 alternateKeyplaneName];
}

id objc_msgSend_alternativeKeyForString_keyplane_preferBaseKeyVariants_preferManualShift_substituteUpperCaseForLowerCase_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "alternativeKeyForString:keyplane:preferBaseKeyVariants:preferManualShift:substituteUpperCaseForLowerCase:");
}

id objc_msgSend_annotations(void *a1, const char *a2, ...)
{
  return _[a1 annotations];
}

id objc_msgSend_anyKeyForString_keyplane_wantSecondaryString_isRetyping_preferBaseKeyVariants_preferManualShift_substituteUpperCaseForLowerCase_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "anyKeyForString:keyplane:wantSecondaryString:isRetyping:preferBaseKeyVariants:preferManualShift:substituteUpp erCaseForLowerCase:");
}

id objc_msgSend_anyKeyForString_keyplane_wantSecondaryString_substituteUpperCaseForLowerCase_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "anyKeyForString:keyplane:wantSecondaryString:substituteUpperCaseForLowerCase:");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _[a1 anyObject];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_appendStringToFile_atFilePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendStringToFile:atFilePath:");
}

id objc_msgSend_applyToPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyToPoint:");
}

id objc_msgSend_applyWithTyper_log_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyWithTyper:log:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayInterspersingSpaceStringsBetweenObjects(void *a1, const char *a2, ...)
{
  return _[a1 arrayInterspersingSpaceStringsBetweenObjects];
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_asyncPredictions(void *a1, const char *a2, ...)
{
  return _[a1 asyncPredictions];
}

id objc_msgSend_atBeginningOfText(void *a1, const char *a2, ...)
{
  return _[a1 atBeginningOfText];
}

id objc_msgSend_atEndOfText(void *a1, const char *a2, ...)
{
  return _[a1 atEndOfText];
}

id objc_msgSend_attemptTapOnKeyWithString_withErrorGenerator_typingLog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attemptTapOnKeyWithString:withErrorGenerator:typingLog:");
}

id objc_msgSend_attemptToDelete(void *a1, const char *a2, ...)
{
  return _[a1 attemptToDelete];
}

id objc_msgSend_attemptToShift(void *a1, const char *a2, ...)
{
  return _[a1 attemptToShift];
}

id objc_msgSend_attemptToTapMoreKey(void *a1, const char *a2, ...)
{
  return _[a1 attemptToTapMoreKey];
}

id objc_msgSend_attemptToTypeIntended_expected_typingLog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attemptToTypeIntended:expected:typingLog:");
}

id objc_msgSend_attemptToTypeText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attemptToTypeText:");
}

id objc_msgSend_attemptToTypeText_typingLog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attemptToTypeText:typingLog:");
}

id objc_msgSend_attemptToTypeWithLog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attemptToTypeWithLog:");
}

id objc_msgSend_autocapitalizationType(void *a1, const char *a2, ...)
{
  return _[a1 autocapitalizationType];
}

id objc_msgSend_autocorrection(void *a1, const char *a2, ...)
{
  return _[a1 autocorrection];
}

id objc_msgSend_autocorrectionList(void *a1, const char *a2, ...)
{
  return _[a1 autocorrectionList];
}

id objc_msgSend_autocorrectionType(void *a1, const char *a2, ...)
{
  return _[a1 autocorrectionType];
}

id objc_msgSend_averageActionInterval(void *a1, const char *a2, ...)
{
  return _[a1 averageActionInterval];
}

id objc_msgSend_averageKeyTapsPerSecond(void *a1, const char *a2, ...)
{
  return _[a1 averageKeyTapsPerSecond];
}

id objc_msgSend_badSentenceFilePath(void *a1, const char *a2, ...)
{
  return _[a1 badSentenceFilePath];
}

id objc_msgSend_badSentenceLogFilePath(void *a1, const char *a2, ...)
{
  return _[a1 badSentenceLogFilePath];
}

id objc_msgSend_badSentenceTranscriptFilePath(void *a1, const char *a2, ...)
{
  return _[a1 badSentenceTranscriptFilePath];
}

id objc_msgSend_baseKeyForString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "baseKeyForString:");
}

id objc_msgSend_baseKeyForVariants(void *a1, const char *a2, ...)
{
  return _[a1 baseKeyForVariants];
}

id objc_msgSend_beginKeystrokeWithIntendedKey_touchEvent_touchError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginKeystrokeWithIntendedKey:touchEvent:touchError:");
}

id objc_msgSend_beginKeystrokeWithIntendedKey_touchEvent_touchError_documentBefore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginKeystrokeWithIntendedKey:touchEvent:touchError:documentBefore:");
}

id objc_msgSend_beginLogTrial(void *a1, const char *a2, ...)
{
  return _[a1 beginLogTrial];
}

id objc_msgSend_beginToken(void *a1, const char *a2, ...)
{
  return _[a1 beginToken];
}

id objc_msgSend_bezierPath(void *a1, const char *a2, ...)
{
  return _[a1 bezierPath];
}

id objc_msgSend_BOOLForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForProperty:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_boxPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "boxPoint:");
}

id objc_msgSend_bufferEmpty(void *a1, const char *a2, ...)
{
  return _[a1 bufferEmpty];
}

id objc_msgSend_bufferFull(void *a1, const char *a2, ...)
{
  return _[a1 bufferFull];
}

id objc_msgSend_buildLookupTree(void *a1, const char *a2, ...)
{
  return _[a1 buildLookupTree];
}

id objc_msgSend_buildVersion(void *a1, const char *a2, ...)
{
  return _[a1 buildVersion];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return _[a1 bundleURL];
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_cachedCandidateForSecureCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachedCandidateForSecureCandidate:");
}

id objc_msgSend_cachedKeysByKeyName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachedKeysByKeyName:");
}

id objc_msgSend_calcMatrix(void *a1, const char *a2, ...)
{
  return _[a1 calcMatrix];
}

id objc_msgSend_callback(void *a1, const char *a2, ...)
{
  return _[a1 callback];
}

id objc_msgSend_canBeginBackspacing(void *a1, const char *a2, ...)
{
  return _[a1 canBeginBackspacing];
}

id objc_msgSend_canContinueBackspacing(void *a1, const char *a2, ...)
{
  return _[a1 canContinueBackspacing];
}

id objc_msgSend_canHandleDoubleLetter(void *a1, const char *a2, ...)
{
  return _[a1 canHandleDoubleLetter];
}

id objc_msgSend_canSuggestSupplementalItemsForCurrentSelection(void *a1, const char *a2, ...)
{
  return _[a1 canSuggestSupplementalItemsForCurrentSelection];
}

id objc_msgSend_candidate(void *a1, const char *a2, ...)
{
  return _[a1 candidate];
}

id objc_msgSend_candidateBarCandidates(void *a1, const char *a2, ...)
{
  return _[a1 candidateBarCandidates];
}

id objc_msgSend_candidateByApplyingSmartPunctuationToCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "candidateByApplyingSmartPunctuationToCandidate:");
}

id objc_msgSend_candidateByReplacingWithCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "candidateByReplacingWithCandidate:");
}

id objc_msgSend_candidateByReplacingWithCandidate_input_rawInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "candidateByReplacingWithCandidate:input:rawInput:");
}

id objc_msgSend_candidateRejected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "candidateRejected:");
}

id objc_msgSend_candidateResultSet(void *a1, const char *a2, ...)
{
  return _[a1 candidateResultSet];
}

id objc_msgSend_candidateToConfirmInputString(void *a1, const char *a2, ...)
{
  return _[a1 candidateToConfirmInputString];
}

id objc_msgSend_candidateToSelectFromCandidates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "candidateToSelectFromCandidates:");
}

id objc_msgSend_candidateWithCandidate_forInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "candidateWithCandidate:forInput:");
}

id objc_msgSend_candidateWithUnchangedInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "candidateWithUnchangedInput:");
}

id objc_msgSend_candidates(void *a1, const char *a2, ...)
{
  return _[a1 candidates];
}

id objc_msgSend_candidatesForString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "candidatesForString:");
}

id objc_msgSend_capitalizedStringWithLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "capitalizedStringWithLocale:");
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return _[a1 center];
}

id objc_msgSend_changeToNearestKeyplaneWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeToNearestKeyplaneWithString:");
}

id objc_msgSend_changingContextWithTrigger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changingContextWithTrigger:");
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_characterIsMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterIsMember:");
}

id objc_msgSend_characterSet(void *a1, const char *a2, ...)
{
  return _[a1 characterSet];
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterSetWithCharactersInString:");
}

id objc_msgSend_classNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "classNamed:");
}

id objc_msgSend_clear(void *a1, const char *a2, ...)
{
  return _[a1 clear];
}

id objc_msgSend_clearDynamicLearningCaches(void *a1, const char *a2, ...)
{
  return _[a1 clearDynamicLearningCaches];
}

id objc_msgSend_clearSoftLearning(void *a1, const char *a2, ...)
{
  return _[a1 clearSoftLearning];
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return _[a1 client];
}

id objc_msgSend_clientIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 clientIdentifier];
}

id objc_msgSend_clonedKeyboardState(void *a1, const char *a2, ...)
{
  return _[a1 clonedKeyboardState];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return _[a1 close];
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return _[a1 closeFile];
}

id objc_msgSend_closeRequestToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "closeRequestToken:");
}

id objc_msgSend_collectAggdStatisticsForResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectAggdStatisticsForResult:");
}

id objc_msgSend_commitText(void *a1, const char *a2, ...)
{
  return _[a1 commitText];
}

id objc_msgSend_commitsAcceptedCandidate(void *a1, const char *a2, ...)
{
  return _[a1 commitsAcceptedCandidate];
}

id objc_msgSend_committedText(void *a1, const char *a2, ...)
{
  return _[a1 committedText];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_compare_options_range_locale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:options:range:locale:");
}

id objc_msgSend_compareExpectedValue_withResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compareExpectedValue:withResult:");
}

id objc_msgSend_componentName(void *a1, const char *a2, ...)
{
  return _[a1 componentName];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByCharactersInSet:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_computeTranslations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "computeTranslations:");
}

id objc_msgSend_config(void *a1, const char *a2, ...)
{
  return _[a1 config];
}

id objc_msgSend_configurationPropertyList(void *a1, const char *a2, ...)
{
  return _[a1 configurationPropertyList];
}

id objc_msgSend_configureAutofillAndGetAutocorrectionsOrCandidatesBeforeTyping_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureAutofillAndGetAutocorrectionsOrCandidatesBeforeTyping:");
}

id objc_msgSend_configureWithParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureWithParameters:");
}

id objc_msgSend_consumeTestFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "consumeTestFile:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentsOfDirectoryAtPath:error:");
}

id objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _[a1 context];
}

id objc_msgSend_contextAfterInput(void *a1, const char *a2, ...)
{
  return _[a1 contextAfterInput];
}

id objc_msgSend_contextBeforeInput(void *a1, const char *a2, ...)
{
  return _[a1 contextBeforeInput];
}

id objc_msgSend_continuousPathState(void *a1, const char *a2, ...)
{
  return _[a1 continuousPathState];
}

id objc_msgSend_conversation(void *a1, const char *a2, ...)
{
  return _[a1 conversation];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyItemAtURL:toURL:error:");
}

id objc_msgSend_corpusId(void *a1, const char *a2, ...)
{
  return _[a1 corpusId];
}

id objc_msgSend_corrected(void *a1, const char *a2, ...)
{
  return _[a1 corrected];
}

id objc_msgSend_correctedTransliterationSequence(void *a1, const char *a2, ...)
{
  return _[a1 correctedTransliterationSequence];
}

id objc_msgSend_corrections(void *a1, const char *a2, ...)
{
  return _[a1 corrections];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countEvent:");
}

id objc_msgSend_countEvent_filteredWithPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countEvent:filteredWithPredicate:");
}

id objc_msgSend_countForObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countForObject:");
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return _[a1 countryCode];
}

id objc_msgSend_cpRequestTokenLock(void *a1, const char *a2, ...)
{
  return _[a1 cpRequestTokenLock];
}

id objc_msgSend_createAutofillTestHarnessInstance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createAutofillTestHarnessInstance:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createFileAtPath_contents_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createFileAtPath:contents:attributes:");
}

id objc_msgSend_createKeyboardInputManagerWrapper(void *a1, const char *a2, ...)
{
  return _[a1 createKeyboardInputManagerWrapper];
}

id objc_msgSend_createTTKPlane_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createTTKPlane:");
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return _[a1 creationDate];
}

id objc_msgSend_currentAndNextKeysAreTransposable(void *a1, const char *a2, ...)
{
  return _[a1 currentAndNextKeysAreTransposable];
}

id objc_msgSend_currentComposedCharacter(void *a1, const char *a2, ...)
{
  return _[a1 currentComposedCharacter];
}

id objc_msgSend_currentExternalSegment(void *a1, const char *a2, ...)
{
  return _[a1 currentExternalSegment];
}

id objc_msgSend_currentInternalSegment(void *a1, const char *a2, ...)
{
  return _[a1 currentInternalSegment];
}

id objc_msgSend_currentKeystroke(void *a1, const char *a2, ...)
{
  return _[a1 currentKeystroke];
}

id objc_msgSend_currentKeystrokeSequence(void *a1, const char *a2, ...)
{
  return _[a1 currentKeystrokeSequence];
}

id objc_msgSend_currentLongCharacter(void *a1, const char *a2, ...)
{
  return _[a1 currentLongCharacter];
}

id objc_msgSend_currentPartfileArchivePath(void *a1, const char *a2, ...)
{
  return _[a1 currentPartfileArchivePath];
}

id objc_msgSend_currentRequestToken(void *a1, const char *a2, ...)
{
  return _[a1 currentRequestToken];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_cursor(void *a1, const char *a2, ...)
{
  return _[a1 cursor];
}

id objc_msgSend_customInfoType(void *a1, const char *a2, ...)
{
  return _[a1 customInfoType];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfFile:");
}

id objc_msgSend_dataWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfURL:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateWithTimeInterval_sinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeInterval:sinceDate:");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_debugData(void *a1, const char *a2, ...)
{
  return _[a1 debugData];
}

id objc_msgSend_debugValues(void *a1, const char *a2, ...)
{
  return _[a1 debugValues];
}

id objc_msgSend_decimalDigitCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 decimalDigitCharacterSet];
}

id objc_msgSend_decodeDoubleForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeDoubleForKey:");
}

id objc_msgSend_decodeFloatForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeFloatForKey:");
}

id objc_msgSend_decodeIntegerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeIntegerForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_decomposeDiphthong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decomposeDiphthong:");
}

id objc_msgSend_decomposeDoublePatchim_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decomposeDoublePatchim:");
}

id objc_msgSend_decomposeHangul_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decomposeHangul:");
}

id objc_msgSend_decomposeHangulSequence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decomposeHangulSequence:");
}

id objc_msgSend_decomposeInputString(void *a1, const char *a2, ...)
{
  return _[a1 decomposeInputString];
}

id objc_msgSend_decomposedStringWithCanonicalMapping(void *a1, const char *a2, ...)
{
  return _[a1 decomposedStringWithCanonicalMapping];
}

id objc_msgSend_defaultCandidate(void *a1, const char *a2, ...)
{
  return _[a1 defaultCandidate];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_deleteBackwards(void *a1, const char *a2, ...)
{
  return _[a1 deleteBackwards];
}

id objc_msgSend_deleteCharactersInRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteCharactersInRange:");
}

id objc_msgSend_deleteInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteInput:");
}

id objc_msgSend_deleteText_rawText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteText:rawText:");
}

id objc_msgSend_deletionCount(void *a1, const char *a2, ...)
{
  return _[a1 deletionCount];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithContentsOfURL:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_disableForTesting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disableForTesting:");
}

id objc_msgSend_displayString(void *a1, const char *a2, ...)
{
  return _[a1 displayString];
}

id objc_msgSend_displayStringOverrideForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayStringOverrideForKey:");
}

id objc_msgSend_displayType(void *a1, const char *a2, ...)
{
  return _[a1 displayType];
}

id objc_msgSend_distanceBetween_andPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distanceBetween:andPoint:");
}

id objc_msgSend_distanceFromKey_toPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distanceFromKey:toPoint:");
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return _[a1 distantPast];
}

id objc_msgSend_distributions(void *a1, const char *a2, ...)
{
  return _[a1 distributions];
}

id objc_msgSend_divideKeyplane_intoLeft_right_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "divideKeyplane:intoLeft:right:");
}

id objc_msgSend_document(void *a1, const char *a2, ...)
{
  return _[a1 document];
}

id objc_msgSend_documentEditRangeWithSegmentRangePtr_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "documentEditRangeWithSegmentRangePtr:");
}

id objc_msgSend_documentIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 documentIdentifier];
}

id objc_msgSend_documentIsEmpty(void *a1, const char *a2, ...)
{
  return _[a1 documentIsEmpty];
}

id objc_msgSend_documentState(void *a1, const char *a2, ...)
{
  return _[a1 documentState];
}

id objc_msgSend_documentStateAfterCursorAdjustment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "documentStateAfterCursorAdjustment:");
}

id objc_msgSend_documentStateAfterSettingMarkedText_selectedRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "documentStateAfterSettingMarkedText:selectedRange:");
}

id objc_msgSend_documentStateWithContextBefore_selectedText_contextAfter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "documentStateWithContextBefore:selectedText:contextAfter:");
}

id objc_msgSend_documentStates(void *a1, const char *a2, ...)
{
  return _[a1 documentStates];
}

id objc_msgSend_doesMatchResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doesMatchResult:");
}

id objc_msgSend_doesSupportInlineCompletion(void *a1, const char *a2, ...)
{
  return _[a1 doesSupportInlineCompletion];
}

id objc_msgSend_dotProduct_andPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dotProduct:andPoint:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_dragged(void *a1, const char *a2, ...)
{
  return _[a1 dragged];
}

id objc_msgSend_dropInput(void *a1, const char *a2, ...)
{
  return _[a1 dropInput];
}

id objc_msgSend_dslTestDriver(void *a1, const char *a2, ...)
{
  return _[a1 dslTestDriver];
}

id objc_msgSend_dynamicKeyboardForName_size_isLandscape_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dynamicKeyboardForName:size:isLandscape:");
}

id objc_msgSend_dynamicResourcePath(void *a1, const char *a2, ...)
{
  return _[a1 dynamicResourcePath];
}

id objc_msgSend_emojiLastUsageTime(void *a1, const char *a2, ...)
{
  return _[a1 emojiLastUsageTime];
}

id objc_msgSend_emojiList(void *a1, const char *a2, ...)
{
  return _[a1 emojiList];
}

id objc_msgSend_emptyResultForPlayback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emptyResultForPlayback:");
}

id objc_msgSend_emptyResultForTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emptyResultForTest:");
}

id objc_msgSend_emptyTouchEventForLogging(void *a1, const char *a2, ...)
{
  return _[a1 emptyTouchEventForLogging];
}

id objc_msgSend_encodeDouble_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeDouble:forKey:");
}

id objc_msgSend_encodeFloat_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeFloat:forKey:");
}

id objc_msgSend_encodeInteger_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInteger:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_endLogTrial(void *a1, const char *a2, ...)
{
  return _[a1 endLogTrial];
}

id objc_msgSend_enumerateKeyplaneNamesAdjacentToKeyplane_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeyplaneNamesAdjacentToKeyplane:usingBlock:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateKeysUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysUsingBlock:");
}

id objc_msgSend_enumerateKeystrokesAndPathsForTokensWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeystrokesAndPathsForTokensWithBlock:");
}

id objc_msgSend_enumerateLinesUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateLinesUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumerateRemainingLongCharactersForCurrentSegment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateRemainingLongCharactersForCurrentSegment:");
}

id objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:");
}

id objc_msgSend_enumerateTagsInRange_scheme_options_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateTagsInRange:scheme:options:usingBlock:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _[a1 error];
}

id objc_msgSend_errorForKeyString_rect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorForKeyString:rect:");
}

id objc_msgSend_errorGenerator(void *a1, const char *a2, ...)
{
  return _[a1 errorGenerator];
}

id objc_msgSend_errorGeneratorWithAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorGeneratorWithAttributes:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_errorWithErrorVector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithErrorVector:");
}

id objc_msgSend_eventsWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventsWithName:");
}

id objc_msgSend_exactKeyForString_keyplane_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exactKeyForString:keyplane:");
}

id objc_msgSend_exactKeyForString_keyplane_includeSecondaryStrings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exactKeyForString:keyplane:includeSecondaryStrings:");
}

id objc_msgSend_expected(void *a1, const char *a2, ...)
{
  return _[a1 expected];
}

id objc_msgSend_expectedOutput(void *a1, const char *a2, ...)
{
  return _[a1 expectedOutput];
}

id objc_msgSend_expectsAppendedSpaceToContinuousPath(void *a1, const char *a2, ...)
{
  return _[a1 expectsAppendedSpaceToContinuousPath];
}

id objc_msgSend_externalSegments(void *a1, const char *a2, ...)
{
  return _[a1 externalSegments];
}

id objc_msgSend_externalStringToInternal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "externalStringToInternal:");
}

id objc_msgSend_extractDataFromTypingLog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractDataFromTypingLog:");
}

id objc_msgSend_failedTests(void *a1, const char *a2, ...)
{
  return _[a1 failedTests];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileHandleForWritingAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileHandleForWritingAtPath:");
}

id objc_msgSend_fileHandleWithStandardOutput(void *a1, const char *a2, ...)
{
  return _[a1 fileHandleWithStandardOutput];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 fileSystemRepresentation];
}

id objc_msgSend_fileURLForTrial_withOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLForTrial:withOptions:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileVersion(void *a1, const char *a2, ...)
{
  return _[a1 fileVersion];
}

id objc_msgSend_filterWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterWithBlock:");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_findKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findKey:");
}

id objc_msgSend_findPartialCandidate(void *a1, const char *a2, ...)
{
  return _[a1 findPartialCandidate];
}

id objc_msgSend_fingerID(void *a1, const char *a2, ...)
{
  return _[a1 fingerID];
}

id objc_msgSend_finishKeystrokeWithTouchedKey_touchEvent_insertedKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishKeystrokeWithTouchedKey:touchEvent:insertedKey:");
}

id objc_msgSend_finishKeystrokeWithTouchedKey_touchEvent_insertedKey_predictionBarState_inlineCompletionBarState_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "finishKeystrokeWithTouchedKey:touchEvent:insertedKey:predictionBarState:inlineCompletionBarState:");
}

id objc_msgSend_finished(void *a1, const char *a2, ...)
{
  return _[a1 finished];
}

id objc_msgSend_firstCachedKeyWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstCachedKeyWithName:");
}

id objc_msgSend_firstCandidate(void *a1, const char *a2, ...)
{
  return _[a1 firstCandidate];
}

id objc_msgSend_firstName(void *a1, const char *a2, ...)
{
  return _[a1 firstName];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_firstTap(void *a1, const char *a2, ...)
{
  return _[a1 firstTap];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_flushBufferWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flushBufferWithCompletionHandler:");
}

id objc_msgSend_flushDynamicLearningCaches(void *a1, const char *a2, ...)
{
  return _[a1 flushDynamicLearningCaches];
}

id objc_msgSend_flushThreshold(void *a1, const char *a2, ...)
{
  return _[a1 flushThreshold];
}

id objc_msgSend_force(void *a1, const char *a2, ...)
{
  return _[a1 force];
}

id objc_msgSend_forcedKeyCode(void *a1, const char *a2, ...)
{
  return _[a1 forcedKeyCode];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_friendId(void *a1, const char *a2, ...)
{
  return _[a1 friendId];
}

id objc_msgSend_fromJsonDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fromJsonDict:");
}

id objc_msgSend_fromUserData(void *a1, const char *a2, ...)
{
  return _[a1 fromUserData];
}

id objc_msgSend_generateAndRenderProactiveSuggestionsWithTriggers_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_isContinuousPath_withAvailableApps_logBlock_async_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "generateAndRenderProactiveSuggestionsWithTriggers:withKeyboardState:withAdditionalPredictions:withSecureCandi dateRenderer:withRenderTraits:withInput:withRecipient:withApplication:withLocale:isContinuousPath:withAvailab leApps:logBlock:async:completion:");
}

id objc_msgSend_generateAngularTiming_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateAngularTiming:");
}

id objc_msgSend_generateAutocorrectionsOrCandidates(void *a1, const char *a2, ...)
{
  return _[a1 generateAutocorrectionsOrCandidates];
}

id objc_msgSend_generateAutocorrectionsWithKeyboardState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateAutocorrectionsWithKeyboardState:");
}

id objc_msgSend_generateAutocorrectionsWithKeyboardState_candidateRange_completionHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateAutocorrectionsWithKeyboardState:candidateRange:completionHandler:");
}

id objc_msgSend_generateAutocorrectionsWithKeyboardState_candidateRange_requestToken_completionHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateAutocorrectionsWithKeyboardState:candidateRange:requestToken:completionHandler:");
}

id objc_msgSend_generateAutocorrectionsWithKeyboardState_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateAutocorrectionsWithKeyboardState:completionHandler:");
}

id objc_msgSend_generateAutocorrectionsWithShiftState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateAutocorrectionsWithShiftState:");
}

id objc_msgSend_generateCandidatesWithKeyboardState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateCandidatesWithKeyboardState:");
}

id objc_msgSend_generateCandidatesWithKeyboardState_candidateRange_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateCandidatesWithKeyboardState:candidateRange:completionHandler:");
}

id objc_msgSend_generateEquidistantTiming_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateEquidistantTiming:");
}

id objc_msgSend_generateInflections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateInflections:");
}

id objc_msgSend_generateKeyCentersFromKeys_string_layout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateKeyCentersFromKeys:string:layout:");
}

id objc_msgSend_generateKeysFromString_layout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateKeysFromString:layout:");
}

id objc_msgSend_generatePathFromInflectionPoints_timestamp_duration_segmentTiming_keys_string_layout_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generatePathFromInflectionPoints:timestamp:duration:segmentTiming:keys:string:layout:");
}

id objc_msgSend_generatePathFromInflectionPoints_timestamp_segmentTiming_keys_string_layout_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generatePathFromInflectionPoints:timestamp:segmentTiming:keys:string:layout:");
}

id objc_msgSend_generatePathFromString_layout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generatePathFromString:layout:");
}

id objc_msgSend_generatePathFromString_timestamp_duration_layout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generatePathFromString:timestamp:duration:layout:");
}

id objc_msgSend_generatePathFromString_timestamp_layout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generatePathFromString:timestamp:layout:");
}

id objc_msgSend_generateReplacementsForString_keyLayout_continuation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateReplacementsForString:keyLayout:continuation:");
}

id objc_msgSend_generateTimingArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateTimingArray:");
}

id objc_msgSend_generatesCandidates(void *a1, const char *a2, ...)
{
  return _[a1 generatesCandidates];
}

id objc_msgSend_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:");
}

id objc_msgSend_getDebugData(void *a1, const char *a2, ...)
{
  return _[a1 getDebugData];
}

id objc_msgSend_getDebugObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getDebugObject:");
}

id objc_msgSend_getDistributionObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getDistributionObject:");
}

id objc_msgSend_getEntries_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getEntries:");
}

id objc_msgSend_getNextTestCase(void *a1, const char *a2, ...)
{
  return _[a1 getNextTestCase];
}

id objc_msgSend_getScalar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getScalar:");
}

id objc_msgSend_getValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getValue:");
}

id objc_msgSend_getValue_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getValue:size:");
}

id objc_msgSend_globalBias(void *a1, const char *a2, ...)
{
  return _[a1 globalBias];
}

id objc_msgSend_handleAcceptedCandidate_keyboardState_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleAcceptedCandidate:keyboardState:completionHandler:");
}

id objc_msgSend_handleBoolConfig_withValue_lineNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleBoolConfig:withValue:lineNumber:");
}

id objc_msgSend_handleCommand_withValue_lineNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleCommand:withValue:lineNumber:");
}

id objc_msgSend_handleCorrectionMatch_lineNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleCorrectionMatch:lineNumber:");
}

id objc_msgSend_handleDocumentMatch_lineNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDocumentMatch:lineNumber:");
}

id objc_msgSend_handleIntConfig_withValue_lineNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleIntConfig:withValue:lineNumber:");
}

id objc_msgSend_handleKeyboardInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleKeyboardInput:");
}

id objc_msgSend_handleKeyboardInput_keyboardState_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleKeyboardInput:keyboardState:completionHandler:");
}

id objc_msgSend_handleNewLine(void *a1, const char *a2, ...)
{
  return _[a1 handleNewLine];
}

id objc_msgSend_handlePredictionMatch_lineNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlePredictionMatch:lineNumber:");
}

id objc_msgSend_handleStringConfig_withValue_lineNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleStringConfig:withValue:lineNumber:");
}

id objc_msgSend_handleTyping_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleTyping:");
}

id objc_msgSend_hardwareKeyboardMode(void *a1, const char *a2, ...)
{
  return _[a1 hardwareKeyboardMode];
}

id objc_msgSend_hasDesiredAutocorrection(void *a1, const char *a2, ...)
{
  return _[a1 hasDesiredAutocorrection];
}

id objc_msgSend_hasPrediction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrediction:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_inPartialCandidateSelection(void *a1, const char *a2, ...)
{
  return _[a1 inPartialCandidateSelection];
}

id objc_msgSend_index1(void *a1, const char *a2, ...)
{
  return _[a1 index1];
}

id objc_msgSend_index2(void *a1, const char *a2, ...)
{
  return _[a1 index2];
}

id objc_msgSend_indexesOfObjectsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexesOfObjectsPassingTest:");
}

id objc_msgSend_init_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "init:");
}

id objc_msgSend_init_inputMode_layouts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "init:inputMode:layouts:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAttributes:");
}

id objc_msgSend_initWithAutocorrection_alternateCorrections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAutocorrection:alternateCorrections:");
}

id objc_msgSend_initWithBuildVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBuildVersion:");
}

id objc_msgSend_initWithBytes_length_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytes:length:encoding:");
}

id objc_msgSend_initWithCandidate_forInput_rawInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCandidate:forInput:rawInput:");
}

id objc_msgSend_initWithCandidate_forInput_rawInput_wordOriginFeedbackID_usageTrackingMask_sourceMask_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCandidate:forInput:rawInput:wordOriginFeedbackID:usageTrackingMask:sourceMask:");
}

id objc_msgSend_initWithCandidate_timestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCandidate:timestamp:");
}

id objc_msgSend_initWithCandidate_timestamp_intendedCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCandidate:timestamp:intendedCandidate:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClient:");
}

id objc_msgSend_initWithConfig_keyboardState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfig:keyboardState:");
}

id objc_msgSend_initWithConfig_keyboardState_languageSelectionController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfig:keyboardState:languageSelectionController:");
}

id objc_msgSend_initWithContactCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContactCollection:");
}

id objc_msgSend_initWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfFile:");
}

id objc_msgSend_initWithContextBefore_markedText_selectedText_contextAfter_selectedRangeInMarkedText_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:");
}

id objc_msgSend_initWithCreationDate_withLastUpdateDate_withKey_withValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCreationDate:withLastUpdateDate:withKey:withValue:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDebug_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDebug:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithDictionary_copyItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:copyItems:");
}

id objc_msgSend_initWithErrorVector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithErrorVector:");
}

id objc_msgSend_initWithFirstName_phoneticFirstName_middleName_phoneticMiddleName_lastName_phoneticLastName_organizationName_jobTitle_nickname_relations_streets_cities_score_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithFirstName:phoneticFirstName:middleName:phoneticMiddleName:lastName:phoneticLastName:organizationName: jobTitle:nickname:relations:streets:cities:score:");
}

id objc_msgSend_initWithFirstTap_secondTap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFirstTap:secondTap:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithInputMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInputMode:");
}

id objc_msgSend_initWithInputMode_keyboardState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInputMode:keyboardState:");
}

id objc_msgSend_initWithIntendedKey_timestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIntendedKey:timestamp:");
}

id objc_msgSend_initWithIntendedKey_touchedKey_error_location_timestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIntendedKey:touchedKey:error:location:timestamp:");
}

id objc_msgSend_initWithIntendedKey_touchedKey_error_location_timestamp_secondaryString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:");
}

id objc_msgSend_initWithIntendedString_repeatLimit_timeout_badSentencePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIntendedString:repeatLimit:timeout:badSentencePath:");
}

id objc_msgSend_initWithIntendedText_additionalIntendedTexts_touchDataCollection_recordID_layoutName_inputText_transliteration_context_annotations_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithIntendedText:additionalIntendedTexts:touchDataCollection:recordID:layoutName:inputText:transliteratio n:context:annotations:");
}

id objc_msgSend_initWithInternalSegments_externalSegments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInternalSegments:externalSegments:");
}

id objc_msgSend_initWithJsonDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithJsonDictionary:");
}

id objc_msgSend_initWithKey_inputMode_value_secondaryValue_realValue_properties_creationDate_lastUpdateDate_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithKey:inputMode:value:secondaryValue:realValue:properties:creationDate:lastUpdateDate:");
}

id objc_msgSend_initWithLanguageLikelihoodModel_preferenceProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLanguageLikelihoodModel:preferenceProvider:");
}

id objc_msgSend_initWithLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLayout:");
}

id objc_msgSend_initWithLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLocale:");
}

id objc_msgSend_initWithMetadata_records_intendedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMetadata:records:intendedText:");
}

id objc_msgSend_initWithModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithModel:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjectsAndKeys:");
}

id objc_msgSend_initWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOptions:");
}

id objc_msgSend_initWithOptionsAndTestTyper_testTyper_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOptionsAndTestTyper:testTyper:");
}

id objc_msgSend_initWithOutputPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOutputPath:");
}

id objc_msgSend_initWithOutputURL_flushThreshold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOutputURL:flushThreshold:");
}

id objc_msgSend_initWithParameters_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithParameters:delegate:");
}

id objc_msgSend_initWithParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithParams:");
}

id objc_msgSend_initWithPath_intendedString_keyplane_fromUserData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPath:intendedString:keyplane:fromUserData:");
}

id objc_msgSend_initWithPathFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPathFile:");
}

id objc_msgSend_initWithPersonaName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPersonaName:");
}

id objc_msgSend_initWithPoint_timeStamp_force_radius_stage_pathIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPoint:timeStamp:force:radius:stage:pathIndex:");
}

id objc_msgSend_initWithPreferredSecondaryInputMode_userEnabledInputModes_userPreferredLanguages_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPreferredSecondaryInputMode:userEnabledInputModes:userPreferredLanguages:");
}

id objc_msgSend_initWithProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProvider:");
}

id objc_msgSend_initWithRecipientIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecipientIdentifiers:");
}

id objc_msgSend_initWithRecipientIdentifiers_senderIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecipientIdentifiers:senderIdentifiers:");
}

id objc_msgSend_initWithRelevanceScoreType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRelevanceScoreType:");
}

id objc_msgSend_initWithServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithServiceName:");
}

id objc_msgSend_initWithString_frame_keyCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:frame:keyCode:");
}

id objc_msgSend_initWithTagSchemes_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTagSchemes:options:");
}

id objc_msgSend_initWithTestTyper_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTestTyper:");
}

id objc_msgSend_initWithTests_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTests:");
}

id objc_msgSend_initWithTimestamp_withKey_withInputMode_withValue_withSecondaryValue_withRealValue_withProperties_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithTimestamp:withKey:withInputMode:withValue:withSecondaryValue:withRealValue:withProperties:");
}

id objc_msgSend_initWithTouchedKey_location_timestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTouchedKey:location:timestamp:");
}

id objc_msgSend_initWithTransientData_namedEntities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTransientData:namedEntities:");
}

id objc_msgSend_initWithTypologyPreferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTypologyPreferences:");
}

id objc_msgSend_initWithUIKBTree_layoutUtils_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUIKBTree:layoutUtils:");
}

id objc_msgSend_initialDragPoint(void *a1, const char *a2, ...)
{
  return _[a1 initialDragPoint];
}

id objc_msgSend_initializeConversationHistory(void *a1, const char *a2, ...)
{
  return _[a1 initializeConversationHistory];
}

id objc_msgSend_inlineCompletion(void *a1, const char *a2, ...)
{
  return _[a1 inlineCompletion];
}

id objc_msgSend_inlineCompletionBarState(void *a1, const char *a2, ...)
{
  return _[a1 inlineCompletionBarState];
}

id objc_msgSend_inlineCompletionCandidates(void *a1, const char *a2, ...)
{
  return _[a1 inlineCompletionCandidates];
}

id objc_msgSend_inlineCompletionEnabled(void *a1, const char *a2, ...)
{
  return _[a1 inlineCompletionEnabled];
}

id objc_msgSend_inlineCompletions(void *a1, const char *a2, ...)
{
  return _[a1 inlineCompletions];
}

id objc_msgSend_input(void *a1, const char *a2, ...)
{
  return _[a1 input];
}

id objc_msgSend_inputContextHistory(void *a1, const char *a2, ...)
{
  return _[a1 inputContextHistory];
}

id objc_msgSend_inputIsPunctuationFollowingContinuousPath(void *a1, const char *a2, ...)
{
  return _[a1 inputIsPunctuationFollowingContinuousPath];
}

id objc_msgSend_inputManager(void *a1, const char *a2, ...)
{
  return _[a1 inputManager];
}

id objc_msgSend_inputManagerClass(void *a1, const char *a2, ...)
{
  return _[a1 inputManagerClass];
}

id objc_msgSend_inputManagerLogger(void *a1, const char *a2, ...)
{
  return _[a1 inputManagerLogger];
}

id objc_msgSend_inputManagerState(void *a1, const char *a2, ...)
{
  return _[a1 inputManagerState];
}

id objc_msgSend_inputManagerWrapper(void *a1, const char *a2, ...)
{
  return _[a1 inputManagerWrapper];
}

id objc_msgSend_inputMode(void *a1, const char *a2, ...)
{
  return _[a1 inputMode];
}

id objc_msgSend_inputModeIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 inputModeIdentifier];
}

id objc_msgSend_inputModeWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inputModeWithIdentifier:");
}

id objc_msgSend_inputModeWithIdentifier_isSiriMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inputModeWithIdentifier:isSiriMode:");
}

id objc_msgSend_inputSegment(void *a1, const char *a2, ...)
{
  return _[a1 inputSegment];
}

id objc_msgSend_inputSegmentsForContinuousPathString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inputSegmentsForContinuousPathString:");
}

id objc_msgSend_inputSegmentsForString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inputSegmentsForString:");
}

id objc_msgSend_inputStreamWithFileAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inputStreamWithFileAtPath:");
}

id objc_msgSend_inputString(void *a1, const char *a2, ...)
{
  return _[a1 inputString];
}

id objc_msgSend_inputText(void *a1, const char *a2, ...)
{
  return _[a1 inputText];
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_insertText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertText:");
}

id objc_msgSend_insertTextAfterSelection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertTextAfterSelection:");
}

id objc_msgSend_inserted(void *a1, const char *a2, ...)
{
  return _[a1 inserted];
}

id objc_msgSend_insertedKey(void *a1, const char *a2, ...)
{
  return _[a1 insertedKey];
}

id objc_msgSend_insertionText(void *a1, const char *a2, ...)
{
  return _[a1 insertionText];
}

id objc_msgSend_insertsSpaceAfterPredictiveInput(void *a1, const char *a2, ...)
{
  return _[a1 insertsSpaceAfterPredictiveInput];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_intended(void *a1, const char *a2, ...)
{
  return _[a1 intended];
}

id objc_msgSend_intendedKey(void *a1, const char *a2, ...)
{
  return _[a1 intendedKey];
}

id objc_msgSend_intendedString(void *a1, const char *a2, ...)
{
  return _[a1 intendedString];
}

id objc_msgSend_intendedText(void *a1, const char *a2, ...)
{
  return _[a1 intendedText];
}

id objc_msgSend_intendedTransliteration(void *a1, const char *a2, ...)
{
  return _[a1 intendedTransliteration];
}

id objc_msgSend_intendedTransliterationSequence(void *a1, const char *a2, ...)
{
  return _[a1 intendedTransliterationSequence];
}

id objc_msgSend_interTouchTimestampInterval(void *a1, const char *a2, ...)
{
  return _[a1 interTouchTimestampInterval];
}

id objc_msgSend_interactionType(void *a1, const char *a2, ...)
{
  return _[a1 interactionType];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_intermediateText(void *a1, const char *a2, ...)
{
  return _[a1 intermediateText];
}

id objc_msgSend_intermediateTextWithInputString_displayString_selectionLocation_lastInputString_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intermediateTextWithInputString:displayString:selectionLocation:lastInputString:");
}

id objc_msgSend_internalSegments(void *a1, const char *a2, ...)
{
  return _[a1 internalSegments];
}

id objc_msgSend_internalStringToExternal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "internalStringToExternal:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_isAlphabeticPlane(void *a1, const char *a2, ...)
{
  return _[a1 isAlphabeticPlane];
}

id objc_msgSend_isAtEnd(void *a1, const char *a2, ...)
{
  return _[a1 isAtEnd];
}

id objc_msgSend_isAutocompleteTriggerForPreviousEntry(void *a1, const char *a2, ...)
{
  return _[a1 isAutocompleteTriggerForPreviousEntry];
}

id objc_msgSend_isAutocorrection(void *a1, const char *a2, ...)
{
  return _[a1 isAutocorrection];
}

id objc_msgSend_isAutoshifted(void *a1, const char *a2, ...)
{
  return _[a1 isAutoshifted];
}

id objc_msgSend_isBackspacing(void *a1, const char *a2, ...)
{
  return _[a1 isBackspacing];
}

id objc_msgSend_isContinuousPathConversion(void *a1, const char *a2, ...)
{
  return _[a1 isContinuousPathConversion];
}

id objc_msgSend_isContinuousPathNonSpacePunctuation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isContinuousPathNonSpacePunctuation:");
}

id objc_msgSend_isDebugEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isDebugEnabled];
}

id objc_msgSend_isDoubleSpace(void *a1, const char *a2, ...)
{
  return _[a1 isDoubleSpace];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFlick(void *a1, const char *a2, ...)
{
  return _[a1 isFlick];
}

id objc_msgSend_isForShortcutConversion(void *a1, const char *a2, ...)
{
  return _[a1 isForShortcutConversion];
}

id objc_msgSend_isKanaPlane(void *a1, const char *a2, ...)
{
  return _[a1 isKanaPlane];
}

id objc_msgSend_isKeyStringAboveSpaceBar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isKeyStringAboveSpaceBar:");
}

id objc_msgSend_isKeyplane_alternateOfKeyplane_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isKeyplane:alternateOfKeyplane:");
}

id objc_msgSend_isKeyplane_shiftAlternateOfKeyplane_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isKeyplane:shiftAlternateOfKeyplane:");
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return _[a1 isMainThread];
}

id objc_msgSend_isMatchForKey_forInputMode_sinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMatchForKey:forInputMode:sinceDate:");
}

id objc_msgSend_isMatchForKeyPrefix_forInputMode_sinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMatchForKeyPrefix:forInputMode:sinceDate:");
}

id objc_msgSend_isMatchForKeyPrefix_forInputMode_weeklyKeySuffixes_endDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMatchForKeyPrefix:forInputMode:weeklyKeySuffixes:endDate:");
}

id objc_msgSend_isMatchSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMatchSinceDate:");
}

id objc_msgSend_isPathableWord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPathableWord:");
}

id objc_msgSend_isPopupVariant(void *a1, const char *a2, ...)
{
  return _[a1 isPopupVariant];
}

id objc_msgSend_isRetyping(void *a1, const char *a2, ...)
{
  return _[a1 isRetyping];
}

id objc_msgSend_isRevisedAutocompleteEntry(void *a1, const char *a2, ...)
{
  return _[a1 isRevisedAutocompleteEntry];
}

id objc_msgSend_isSameRequestAs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSameRequestAs:");
}

id objc_msgSend_isScreenLocked(void *a1, const char *a2, ...)
{
  return _[a1 isScreenLocked];
}

id objc_msgSend_isSecureContentCandidate(void *a1, const char *a2, ...)
{
  return _[a1 isSecureContentCandidate];
}

id objc_msgSend_isShiftKeyplane(void *a1, const char *a2, ...)
{
  return _[a1 isShiftKeyplane];
}

id objc_msgSend_isShifted(void *a1, const char *a2, ...)
{
  return _[a1 isShifted];
}

id objc_msgSend_isSiriMode(void *a1, const char *a2, ...)
{
  return _[a1 isSiriMode];
}

id objc_msgSend_jsonFrameArrayForWord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "jsonFrameArrayForWord:");
}

id objc_msgSend_justAcceptedAutocorrection(void *a1, const char *a2, ...)
{
  return _[a1 justAcceptedAutocorrection];
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return _[a1 key];
}

id objc_msgSend_keyCodeWithString_inKeyplane_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyCodeWithString:inKeyplane:");
}

id objc_msgSend_keyContainingPoint_inKeyplane_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyContainingPoint:inKeyplane:");
}

id objc_msgSend_keyLayout(void *a1, const char *a2, ...)
{
  return _[a1 keyLayout];
}

id objc_msgSend_keyOverrides(void *a1, const char *a2, ...)
{
  return _[a1 keyOverrides];
}

id objc_msgSend_keyToAccessKeyplane_fromKeyplane_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyToAccessKeyplane:fromKeyplane:");
}

id objc_msgSend_keyToAccessKeyplaneCloserToKeyString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyToAccessKeyplaneCloserToKeyString:");
}

id objc_msgSend_keyWithString_inKeyplane_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyWithString:inKeyplane:");
}

id objc_msgSend_keyboard(void *a1, const char *a2, ...)
{
  return _[a1 keyboard];
}

id objc_msgSend_keyboardController(void *a1, const char *a2, ...)
{
  return _[a1 keyboardController];
}

id objc_msgSend_keyboardFeatureSpecializationClassFromInputModeProperties(void *a1, const char *a2, ...)
{
  return _[a1 keyboardFeatureSpecializationClassFromInputModeProperties];
}

id objc_msgSend_keyboardFromWidth_useDynamicLayout_orientation_keyboardLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyboardFromWidth:useDynamicLayout:orientation:keyboardLayout:");
}

id objc_msgSend_keyboardInfoDelgate(void *a1, const char *a2, ...)
{
  return _[a1 keyboardInfoDelgate];
}

id objc_msgSend_keyboardInputManagerFactory(void *a1, const char *a2, ...)
{
  return _[a1 keyboardInputManagerFactory];
}

id objc_msgSend_keyboardOrientation(void *a1, const char *a2, ...)
{
  return _[a1 keyboardOrientation];
}

id objc_msgSend_keyboardPrefixForWidth_andEdge_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyboardPrefixForWidth:andEdge:");
}

id objc_msgSend_keyboardScreenReferenceSize(void *a1, const char *a2, ...)
{
  return _[a1 keyboardScreenReferenceSize];
}

id objc_msgSend_keyboardState(void *a1, const char *a2, ...)
{
  return _[a1 keyboardState];
}

id objc_msgSend_keyboardSuffixForScreenDimensions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyboardSuffixForScreenDimensions:");
}

id objc_msgSend_keyboardWidth(void *a1, const char *a2, ...)
{
  return _[a1 keyboardWidth];
}

id objc_msgSend_keyboardWithName_inCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyboardWithName:inCache:");
}

id objc_msgSend_keyplane(void *a1, const char *a2, ...)
{
  return _[a1 keyplane];
}

id objc_msgSend_keyplaneHeightForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyplaneHeightForKeys:");
}

id objc_msgSend_keyplaneSizeForLayout_screenTraits_keyboardType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyplaneSizeForLayout:screenTraits:keyboardType:");
}

id objc_msgSend_keyplaneWidthForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyplaneWidthForKeys:");
}

id objc_msgSend_keys(void *a1, const char *a2, ...)
{
  return _[a1 keys];
}

id objc_msgSend_keysOfEntriesPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keysOfEntriesPassingTest:");
}

id objc_msgSend_keystrokeRecord(void *a1, const char *a2, ...)
{
  return _[a1 keystrokeRecord];
}

id objc_msgSend_keystrokesForTokens(void *a1, const char *a2, ...)
{
  return _[a1 keystrokesForTokens];
}

id objc_msgSend_language(void *a1, const char *a2, ...)
{
  return _[a1 language];
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return _[a1 languageCode];
}

id objc_msgSend_languageForOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "languageForOptions:");
}

id objc_msgSend_languageWithRegion(void *a1, const char *a2, ...)
{
  return _[a1 languageWithRegion];
}

id objc_msgSend_lastActionSuppressesError(void *a1, const char *a2, ...)
{
  return _[a1 lastActionSuppressesError];
}

id objc_msgSend_lastActionUseSecondaryString(void *a1, const char *a2, ...)
{
  return _[a1 lastActionUseSecondaryString];
}

id objc_msgSend_lastAndCurrentKeysAreSame(void *a1, const char *a2, ...)
{
  return _[a1 lastAndCurrentKeysAreSame];
}

id objc_msgSend_lastCPRequestToken(void *a1, const char *a2, ...)
{
  return _[a1 lastCPRequestToken];
}

id objc_msgSend_lastCursorPositionForTransliteratedCandidate(void *a1, const char *a2, ...)
{
  return _[a1 lastCursorPositionForTransliteratedCandidate];
}

id objc_msgSend_lastInputWasContinuousPath(void *a1, const char *a2, ...)
{
  return _[a1 lastInputWasContinuousPath];
}

id objc_msgSend_lastInputWasSelection(void *a1, const char *a2, ...)
{
  return _[a1 lastInputWasSelection];
}

id objc_msgSend_lastName(void *a1, const char *a2, ...)
{
  return _[a1 lastName];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_lastTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 lastTimestamp];
}

id objc_msgSend_lastTouchEvent(void *a1, const char *a2, ...)
{
  return _[a1 lastTouchEvent];
}

id objc_msgSend_lastUpdateDate(void *a1, const char *a2, ...)
{
  return _[a1 lastUpdateDate];
}

id objc_msgSend_laterDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "laterDate:");
}

id objc_msgSend_layout(void *a1, const char *a2, ...)
{
  return _[a1 layout];
}

id objc_msgSend_layoutName(void *a1, const char *a2, ...)
{
  return _[a1 layoutName];
}

id objc_msgSend_layoutState(void *a1, const char *a2, ...)
{
  return _[a1 layoutState];
}

id objc_msgSend_layoutUtils(void *a1, const char *a2, ...)
{
  return _[a1 layoutUtils];
}

id objc_msgSend_layouts(void *a1, const char *a2, ...)
{
  return _[a1 layouts];
}

id objc_msgSend_learnWordContextIndex(void *a1, const char *a2, ...)
{
  return _[a1 learnWordContextIndex];
}

id objc_msgSend_leftKeys(void *a1, const char *a2, ...)
{
  return _[a1 leftKeys];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_letterCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 letterCharacterSet];
}

id objc_msgSend_lexiconLocale(void *a1, const char *a2, ...)
{
  return _[a1 lexiconLocale];
}

id objc_msgSend_linguisticTagger(void *a1, const char *a2, ...)
{
  return _[a1 linguisticTagger];
}

id objc_msgSend_linkWithUserActionStream_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "linkWithUserActionStream:");
}

id objc_msgSend_listWithCorrections_predictions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "listWithCorrections:predictions:");
}

id objc_msgSend_listWithCorrections_predictions_emojiList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "listWithCorrections:predictions:emojiList:");
}

id objc_msgSend_loadFromDir_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadFromDir:");
}

id objc_msgSend_loadFromFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadFromFile:");
}

id objc_msgSend_loadFromFile_inputMode_layouts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadFromFile:inputMode:layouts:");
}

id objc_msgSend_loadFromPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadFromPath:");
}

id objc_msgSend_loadFromPath_fileManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadFromPath:fileManager:");
}

id objc_msgSend_loadFromPlaybackFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadFromPlaybackFile:");
}

id objc_msgSend_loadFromSentence_withCatenation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadFromSentence:withCatenation:");
}

id objc_msgSend_loadFromTextInputFile_withCatenation_addWordSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadFromTextInputFile:withCatenation:addWordSpacing:");
}

id objc_msgSend_loadLayouts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadLayouts:");
}

id objc_msgSend_locale(void *a1, const char *a2, ...)
{
  return _[a1 locale];
}

id objc_msgSend_localeIdentifierForLanguage(void *a1, const char *a2, ...)
{
  return _[a1 localeIdentifierForLanguage];
}

id objc_msgSend_localeWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localeWithLocaleIdentifier:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return _[a1 location];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _[a1 lock];
}

id objc_msgSend_logAcceptedCandidate_intendedTransliterationCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logAcceptedCandidate:intendedTransliterationCandidate:");
}

id objc_msgSend_logAutocorrectionInserted(void *a1, const char *a2, ...)
{
  return _[a1 logAutocorrectionInserted];
}

id objc_msgSend_logRejectedAutocorrection(void *a1, const char *a2, ...)
{
  return _[a1 logRejectedAutocorrection];
}

id objc_msgSend_logResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logResult:");
}

id objc_msgSend_logSerializationQueue(void *a1, const char *a2, ...)
{
  return _[a1 logSerializationQueue];
}

id objc_msgSend_longCharacterAtSegment_position_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "longCharacterAtSegment:position:");
}

id objc_msgSend_longCharacterIsMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "longCharacterIsMember:");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_longPredictionListEnabled(void *a1, const char *a2, ...)
{
  return _[a1 longPredictionListEnabled];
}

id objc_msgSend_lookup_keyboardController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lookup:keyboardController:");
}

id objc_msgSend_lowercaseLetterCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseLetterCharacterSet];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_lowercaseStringWithLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lowercaseStringWithLocale:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_majorVersion(void *a1, const char *a2, ...)
{
  return _[a1 majorVersion];
}

id objc_msgSend_mapShiftedKeyToUnShiftedKeyExcludeCapitalization_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mapShiftedKeyToUnShiftedKeyExcludeCapitalization:");
}

id objc_msgSend_markedText(void *a1, const char *a2, ...)
{
  return _[a1 markedText];
}

id objc_msgSend_matchTransliterationCandidateToSegment_withCursorAt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "matchTransliterationCandidateToSegment:withCursorAt:");
}

id objc_msgSend_maxPredictions(void *a1, const char *a2, ...)
{
  return _[a1 maxPredictions];
}

id objc_msgSend_maxPredictionsReported(void *a1, const char *a2, ...)
{
  return _[a1 maxPredictionsReported];
}

id objc_msgSend_maxPriorSegmentsCheckedForErrors(void *a1, const char *a2, ...)
{
  return _[a1 maxPriorSegmentsCheckedForErrors];
}

id objc_msgSend_mergeFrameFromKey_intoKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeFrameFromKey:intoKey:");
}

id objc_msgSend_mergeHyphenatedWord_string_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeHyphenatedWord:string:");
}

id objc_msgSend_messageWithText_senderId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageWithText:senderId:");
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return _[a1 metadata];
}

id objc_msgSend_middleName(void *a1, const char *a2, ...)
{
  return _[a1 middleName];
}

id objc_msgSend_minorVersion(void *a1, const char *a2, ...)
{
  return _[a1 minorVersion];
}

id objc_msgSend_moveToPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveToPoint:");
}

id objc_msgSend_multilingualEnabled(void *a1, const char *a2, ...)
{
  return _[a1 multilingualEnabled];
}

id objc_msgSend_multilingualInputManagerClass(void *a1, const char *a2, ...)
{
  return _[a1 multilingualInputManagerClass];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_namedEntityLexicon(void *a1, const char *a2, ...)
{
  return _[a1 namedEntityLexicon];
}

id objc_msgSend_needAutofill(void *a1, const char *a2, ...)
{
  return _[a1 needAutofill];
}

id objc_msgSend_newKeyboardInputManager(void *a1, const char *a2, ...)
{
  return _[a1 newKeyboardInputManager];
}

id objc_msgSend_newlineCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 newlineCharacterSet];
}

id objc_msgSend_nextInputWouldStartSentence(void *a1, const char *a2, ...)
{
  return _[a1 nextInputWouldStartSentence];
}

id objc_msgSend_nextKeyIsFlick(void *a1, const char *a2, ...)
{
  return _[a1 nextKeyIsFlick];
}

id objc_msgSend_nextKeyIsMultitap(void *a1, const char *a2, ...)
{
  return _[a1 nextKeyIsMultitap];
}

id objc_msgSend_nextLongCharacter(void *a1, const char *a2, ...)
{
  return _[a1 nextLongCharacter];
}

id objc_msgSend_nextLongCharacterEndsSegment(void *a1, const char *a2, ...)
{
  return _[a1 nextLongCharacterEndsSegment];
}

id objc_msgSend_nextUserAction(void *a1, const char *a2, ...)
{
  return _[a1 nextUserAction];
}

id objc_msgSend_nickName(void *a1, const char *a2, ...)
{
  return _[a1 nickName];
}

id objc_msgSend_normalizedIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 normalizedIdentifier];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_nullifyConversationHistory(void *a1, const char *a2, ...)
{
  return _[a1 nullifyConversationHistory];
}

id objc_msgSend_numberFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberFromString:");
}

id objc_msgSend_numberOfTouches(void *a1, const char *a2, ...)
{
  return _[a1 numberOfTouches];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectsAtIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsAtIndexes:");
}

id objc_msgSend_observers(void *a1, const char *a2, ...)
{
  return _[a1 observers];
}

id objc_msgSend_onNewLayoutsFound(void *a1, const char *a2, ...)
{
  return _[a1 onNewLayoutsFound];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return _[a1 open];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _[a1 options];
}

id objc_msgSend_outputStreamWithURL_append_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "outputStreamWithURL:append:");
}

id objc_msgSend_overrideInputMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "overrideInputMode:");
}

id objc_msgSend_overridingJsonKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "overridingJsonKeys:");
}

id objc_msgSend_paddedFrame(void *a1, const char *a2, ...)
{
  return _[a1 paddedFrame];
}

id objc_msgSend_parseData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parseData:");
}

id objc_msgSend_parseLayouts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parseLayouts:");
}

id objc_msgSend_partfileArchivePaths(void *a1, const char *a2, ...)
{
  return _[a1 partfileArchivePaths];
}

id objc_msgSend_partfileArchivePathsMutable(void *a1, const char *a2, ...)
{
  return _[a1 partfileArchivePathsMutable];
}

id objc_msgSend_partfileArchivePathsQueue(void *a1, const char *a2, ...)
{
  return _[a1 partfileArchivePathsQueue];
}

id objc_msgSend_partfileCount(void *a1, const char *a2, ...)
{
  return _[a1 partfileCount];
}

id objc_msgSend_partfileURL(void *a1, const char *a2, ...)
{
  return _[a1 partfileURL];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return _[a1 pathExtension];
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathForResource:ofType:");
}

id objc_msgSend_pathGenerator(void *a1, const char *a2, ...)
{
  return _[a1 pathGenerator];
}

id objc_msgSend_pathGeneratorWithAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathGeneratorWithAttributes:");
}

id objc_msgSend_pathIndex(void *a1, const char *a2, ...)
{
  return _[a1 pathIndex];
}

id objc_msgSend_pathWithComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathWithComponents:");
}

id objc_msgSend_pathsForWords(void *a1, const char *a2, ...)
{
  return _[a1 pathsForWords];
}

id objc_msgSend_performHitTestForTouchEvent_keyboardState_continuation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performHitTestForTouchEvent:keyboardState:continuation:");
}

id objc_msgSend_performMaintenance(void *a1, const char *a2, ...)
{
  return _[a1 performMaintenance];
}

id objc_msgSend_performSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:");
}

id objc_msgSend_performSelector_withObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:withObject:");
}

id objc_msgSend_performSkipTapAtLocation_radius_timestamp_pathIndex_fingerID_forcedKeyCode_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSkipTapAtLocation:radius:timestamp:pathIndex:fingerID:forcedKeyCode:");
}

id objc_msgSend_performStrokeForPath_typingLog_callback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performStrokeForPath:typingLog:callback:");
}

id objc_msgSend_performTouchCancelAtLocation_radius_timestamp_pathIndex_fingerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performTouchCancelAtLocation:radius:timestamp:pathIndex:fingerID:");
}

id objc_msgSend_performTouchDownAtLocation_radius_timestamp_pathIndex_fingerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performTouchDownAtLocation:radius:timestamp:pathIndex:fingerID:");
}

id objc_msgSend_performTouchDragAtLocation_radius_timestamp_pathIndex_fingerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performTouchDragAtLocation:radius:timestamp:pathIndex:fingerID:");
}

id objc_msgSend_performTouchEndRestAtLocation_radius_timestamp_pathIndex_fingerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performTouchEndRestAtLocation:radius:timestamp:pathIndex:fingerID:");
}

id objc_msgSend_performTouchRestAtLocation_radius_timestamp_pathIndex_fingerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performTouchRestAtLocation:radius:timestamp:pathIndex:fingerID:");
}

id objc_msgSend_performTouchUpAtLocation_radius_timestamp_pathIndex_fingerID_secondaryString_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performTouchUpAtLocation:radius:timestamp:pathIndex:fingerID:secondaryString:");
}

id objc_msgSend_persistentBiasForBottomRow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistentBiasForBottomRow:");
}

id objc_msgSend_persistentBiasForKeyString_rect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistentBiasForKeyString:rect:");
}

id objc_msgSend_persistentBiasForSpaceBarRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistentBiasForSpaceBarRect:");
}

id objc_msgSend_point(void *a1, const char *a2, ...)
{
  return _[a1 point];
}

id objc_msgSend_pointForAttemptedTapOnKey_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pointForAttemptedTapOnKey:withError:");
}

id objc_msgSend_positionInCurrentInternalSegment(void *a1, const char *a2, ...)
{
  return _[a1 positionInCurrentInternalSegment];
}

id objc_msgSend_postTokenisString_i_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postTokenisString:i:");
}

id objc_msgSend_predictationBarDebugString(void *a1, const char *a2, ...)
{
  return _[a1 predictationBarDebugString];
}

id objc_msgSend_predicted(void *a1, const char *a2, ...)
{
  return _[a1 predicted];
}

id objc_msgSend_predictionBarCandidates(void *a1, const char *a2, ...)
{
  return _[a1 predictionBarCandidates];
}

id objc_msgSend_predictionBarState(void *a1, const char *a2, ...)
{
  return _[a1 predictionBarState];
}

id objc_msgSend_predictions(void *a1, const char *a2, ...)
{
  return _[a1 predictions];
}

id objc_msgSend_preferBaseKeyForVariants(void *a1, const char *a2, ...)
{
  return _[a1 preferBaseKeyForVariants];
}

id objc_msgSend_preferInlineSelection(void *a1, const char *a2, ...)
{
  return _[a1 preferInlineSelection];
}

id objc_msgSend_preferManualCorrection(void *a1, const char *a2, ...)
{
  return _[a1 preferManualCorrection];
}

id objc_msgSend_preferManualShift(void *a1, const char *a2, ...)
{
  return _[a1 preferManualShift];
}

id objc_msgSend_preferPredictionSelection(void *a1, const char *a2, ...)
{
  return _[a1 preferPredictionSelection];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return _[a1 preferredLanguages];
}

id objc_msgSend_prefersAutocorrectForApostrophes(void *a1, const char *a2, ...)
{
  return _[a1 prefersAutocorrectForApostrophes];
}

id objc_msgSend_prefersAutocorrectForCaps(void *a1, const char *a2, ...)
{
  return _[a1 prefersAutocorrectForCaps];
}

id objc_msgSend_prefersContinuousPath(void *a1, const char *a2, ...)
{
  return _[a1 prefersContinuousPath];
}

id objc_msgSend_prefersInlineSelection(void *a1, const char *a2, ...)
{
  return _[a1 prefersInlineSelection];
}

id objc_msgSend_prefersPredictionSelection(void *a1, const char *a2, ...)
{
  return _[a1 prefersPredictionSelection];
}

id objc_msgSend_prefersSpaceBarDoubleTap(void *a1, const char *a2, ...)
{
  return _[a1 prefersSpaceBarDoubleTap];
}

id objc_msgSend_prefersToCorrectErrors(void *a1, const char *a2, ...)
{
  return _[a1 prefersToCorrectErrors];
}

id objc_msgSend_prefersTransliteration(void *a1, const char *a2, ...)
{
  return _[a1 prefersTransliteration];
}

id objc_msgSend_previousLongCharacter(void *a1, const char *a2, ...)
{
  return _[a1 previousLongCharacter];
}

id objc_msgSend_primaryInputMode(void *a1, const char *a2, ...)
{
  return _[a1 primaryInputMode];
}

id objc_msgSend_primaryIntendedText(void *a1, const char *a2, ...)
{
  return _[a1 primaryIntendedText];
}

id objc_msgSend_primaryLanguageWeight(void *a1, const char *a2, ...)
{
  return _[a1 primaryLanguageWeight];
}

id objc_msgSend_printDebugInfo_lineNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "printDebugInfo:lineNumber:");
}

id objc_msgSend_printTranslitSummaries(void *a1, const char *a2, ...)
{
  return _[a1 printTranslitSummaries];
}

id objc_msgSend_printTypingTranscript(void *a1, const char *a2, ...)
{
  return _[a1 printTypingTranscript];
}

id objc_msgSend_priorStates(void *a1, const char *a2, ...)
{
  return _[a1 priorStates];
}

id objc_msgSend_priorTokenisString_i_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "priorTokenisString:i:");
}

id objc_msgSend_probBeginCorrectingAfterWord(void *a1, const char *a2, ...)
{
  return _[a1 probBeginCorrectingAfterWord];
}

id objc_msgSend_probBeginCorrectingAfterWordTerminator(void *a1, const char *a2, ...)
{
  return _[a1 probBeginCorrectingAfterWordTerminator];
}

id objc_msgSend_probDoubleTapInitialLetter(void *a1, const char *a2, ...)
{
  return _[a1 probDoubleTapInitialLetter];
}

id objc_msgSend_probDoubleTapLetter(void *a1, const char *a2, ...)
{
  return _[a1 probDoubleTapLetter];
}

id objc_msgSend_probExtraneousFinalKey(void *a1, const char *a2, ...)
{
  return _[a1 probExtraneousFinalKey];
}

id objc_msgSend_probExtraneousInitialKey(void *a1, const char *a2, ...)
{
  return _[a1 probExtraneousInitialKey];
}

id objc_msgSend_probExtraneousKey(void *a1, const char *a2, ...)
{
  return _[a1 probExtraneousKey];
}

id objc_msgSend_probRejectBadAutocorrection(void *a1, const char *a2, ...)
{
  return _[a1 probRejectBadAutocorrection];
}

id objc_msgSend_probSkipInitialLetter(void *a1, const char *a2, ...)
{
  return _[a1 probSkipInitialLetter];
}

id objc_msgSend_probSkipLetter(void *a1, const char *a2, ...)
{
  return _[a1 probSkipLetter];
}

id objc_msgSend_probSkipRepeatLetter(void *a1, const char *a2, ...)
{
  return _[a1 probSkipRepeatLetter];
}

id objc_msgSend_probSkipSpace(void *a1, const char *a2, ...)
{
  return _[a1 probSkipSpace];
}

id objc_msgSend_probSubstituteInitialLetter(void *a1, const char *a2, ...)
{
  return _[a1 probSubstituteInitialLetter];
}

id objc_msgSend_probSubstituteLetter(void *a1, const char *a2, ...)
{
  return _[a1 probSubstituteLetter];
}

id objc_msgSend_probSubstituteSpace(void *a1, const char *a2, ...)
{
  return _[a1 probSubstituteSpace];
}

id objc_msgSend_probTappingSpaceInsteadOfBottomRow(void *a1, const char *a2, ...)
{
  return _[a1 probTappingSpaceInsteadOfBottomRow];
}

id objc_msgSend_probTappingSpaceReplacedByBottomRow(void *a1, const char *a2, ...)
{
  return _[a1 probTappingSpaceReplacedByBottomRow];
}

id objc_msgSend_probTransposeLetterAndSpace(void *a1, const char *a2, ...)
{
  return _[a1 probTransposeLetterAndSpace];
}

id objc_msgSend_probTransposeLetters(void *a1, const char *a2, ...)
{
  return _[a1 probTransposeLetters];
}

id objc_msgSend_probabilityOfDoubledKey(void *a1, const char *a2, ...)
{
  return _[a1 probabilityOfDoubledKey];
}

id objc_msgSend_probabilityOfExtraneousKey(void *a1, const char *a2, ...)
{
  return _[a1 probabilityOfExtraneousKey];
}

id objc_msgSend_probabilityOfSkippedKey(void *a1, const char *a2, ...)
{
  return _[a1 probabilityOfSkippedKey];
}

id objc_msgSend_probabilityOfSubstituteKey(void *a1, const char *a2, ...)
{
  return _[a1 probabilityOfSubstituteKey];
}

id objc_msgSend_probabilityOfTransposition(void *a1, const char *a2, ...)
{
  return _[a1 probabilityOfTransposition];
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return _[a1 properties];
}

id objc_msgSend_provider(void *a1, const char *a2, ...)
{
  return _[a1 provider];
}

id objc_msgSend_punctuationCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 punctuationCharacterSet];
}

id objc_msgSend_pushAutocorrections_requestToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushAutocorrections:requestToken:");
}

id objc_msgSend_pushCandidateResultSet_requestToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushCandidateResultSet:requestToken:");
}

id objc_msgSend_radius(void *a1, const char *a2, ...)
{
  return _[a1 radius];
}

id objc_msgSend_randomActionInterval(void *a1, const char *a2, ...)
{
  return _[a1 randomActionInterval];
}

id objc_msgSend_randomErrorForKeyString_rect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "randomErrorForKeyString:rect:");
}

id objc_msgSend_randomNumberFromBetaDistribution(void *a1, const char *a2, ...)
{
  return _[a1 randomNumberFromBetaDistribution];
}

id objc_msgSend_randomNumberFromNormalDistribution(void *a1, const char *a2, ...)
{
  return _[a1 randomNumberFromNormalDistribution];
}

id objc_msgSend_randomPointInDistribution(void *a1, const char *a2, ...)
{
  return _[a1 randomPointInDistribution];
}

id objc_msgSend_randomPointWithStandardDeviationX_Y_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "randomPointWithStandardDeviationX:Y:");
}

id objc_msgSend_range(void *a1, const char *a2, ...)
{
  return _[a1 range];
}

id objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfComposedCharacterSequenceAtIndex:");
}

id objc_msgSend_rangeOfInputSegmentsForCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfInputSegmentsForCandidate:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:options:");
}

id objc_msgSend_rank(void *a1, const char *a2, ...)
{
  return _[a1 rank];
}

id objc_msgSend_rawInput(void *a1, const char *a2, ...)
{
  return _[a1 rawInput];
}

id objc_msgSend_realValue(void *a1, const char *a2, ...)
{
  return _[a1 realValue];
}

id objc_msgSend_recipientIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 recipientIdentifier];
}

id objc_msgSend_recordID(void *a1, const char *a2, ...)
{
  return _[a1 recordID];
}

id objc_msgSend_records(void *a1, const char *a2, ...)
{
  return _[a1 records];
}

id objc_msgSend_registerLayoutWithFavonius(void *a1, const char *a2, ...)
{
  return _[a1 registerLayoutWithFavonius];
}

id objc_msgSend_registerLearning_fullCandidate_keyboardState_mode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerLearning:fullCandidate:keyboardState:mode:");
}

id objc_msgSend_registerPathStringAsKeyStrokes_path_predictionBarState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerPathStringAsKeyStrokes:path:predictionBarState:");
}

id objc_msgSend_rejectAutocorrection(void *a1, const char *a2, ...)
{
  return _[a1 rejectAutocorrection];
}

id objc_msgSend_rejectCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rejectCandidate:");
}

id objc_msgSend_relevancyScore(void *a1, const char *a2, ...)
{
  return _[a1 relevancyScore];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeCharactersInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeCharactersInString:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return _[a1 removeLastObject];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectIdenticalTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectIdenticalTo:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_repeatLimit(void *a1, const char *a2, ...)
{
  return _[a1 repeatLimit];
}

id objc_msgSend_replaceCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceCharactersInRange:withString:");
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceObjectAtIndex:withObject:");
}

id objc_msgSend_replacementString(void *a1, const char *a2, ...)
{
  return _[a1 replacementString];
}

id objc_msgSend_replayTest_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replayTest:withError:");
}

id objc_msgSend_reportFailedTest_lineNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportFailedTest:lineNumber:");
}

id objc_msgSend_reportForAutocorrectionResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportForAutocorrectionResults:");
}

id objc_msgSend_reportForTrial_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportForTrial:");
}

id objc_msgSend_reportSyntaxErrors_lineNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportSyntaxErrors:lineNumber:");
}

id objc_msgSend_reporter(void *a1, const char *a2, ...)
{
  return _[a1 reporter];
}

id objc_msgSend_reporterWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reporterWithOptions:");
}

id objc_msgSend_representedString(void *a1, const char *a2, ...)
{
  return _[a1 representedString];
}

id objc_msgSend_representedStringForKey_shifted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "representedStringForKey:shifted:");
}

id objc_msgSend_representedStringForKey_shifted_includeSecondaryStrings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "representedStringForKey:shifted:includeSecondaryStrings:");
}

id objc_msgSend_requestCondition(void *a1, const char *a2, ...)
{
  return _[a1 requestCondition];
}

id objc_msgSend_requiresMaintenance(void *a1, const char *a2, ...)
{
  return _[a1 requiresMaintenance];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return _[a1 reset];
}

id objc_msgSend_resetForIntendedSegments_expectedSegments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetForIntendedSegments:expectedSegments:");
}

id objc_msgSend_resetOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetOptions:");
}

id objc_msgSend_resultClassifiers(void *a1, const char *a2, ...)
{
  return _[a1 resultClassifiers];
}

id objc_msgSend_resultLoggers(void *a1, const char *a2, ...)
{
  return _[a1 resultLoggers];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return _[a1 results];
}

id objc_msgSend_resultsBuffer(void *a1, const char *a2, ...)
{
  return _[a1 resultsBuffer];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_retestTouchAtLocation_radius_timestamp_pathIndex_fingerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retestTouchAtLocation:radius:timestamp:pathIndex:fingerID:");
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 reverseObjectEnumerator];
}

id objc_msgSend_revisitPreviousToken(void *a1, const char *a2, ...)
{
  return _[a1 revisitPreviousToken];
}

id objc_msgSend_rewindPositionByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rewindPositionByString:");
}

id objc_msgSend_rewindSegmentCursor(void *a1, const char *a2, ...)
{
  return _[a1 rewindSegmentCursor];
}

id objc_msgSend_rightKeys(void *a1, const char *a2, ...)
{
  return _[a1 rightKeys];
}

id objc_msgSend_rotationMatrix(void *a1, const char *a2, ...)
{
  return _[a1 rotationMatrix];
}

id objc_msgSend_runAutocorrectionTester_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runAutocorrectionTester:");
}

id objc_msgSend_runAutofillTestWithoutTyping_testHarness_trialID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runAutofillTestWithoutTyping:testHarness:trialID:");
}

id objc_msgSend_runConversationTest_trialID_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runConversationTest:trialID:withError:");
}

id objc_msgSend_runDslTest_withHarnessClass_forLanguage_errorMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runDslTest:withHarnessClass:forLanguage:errorMessage:");
}

id objc_msgSend_runMode_beforeDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runMode:beforeDate:");
}

id objc_msgSend_runTest_trialID_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runTest:trialID:withError:");
}

id objc_msgSend_runTestBasedOnTestType_options_trialID_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runTestBasedOnTestType:options:trialID:withError:");
}

id objc_msgSend_runTestCasesForSource_errorMessage_reportObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runTestCasesForSource:errorMessage:reportObserver:");
}

id objc_msgSend_runTestCasesForSource_options_reporter_reportObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runTestCasesForSource:options:reporter:reportObserver:");
}

id objc_msgSend_runTests_withHarnessClass_forLanguage_errorMessage_reportObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runTests:withHarnessClass:forLanguage:errorMessage:reportObserver:");
}

id objc_msgSend_runTestsInRange_options_trialID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runTestsInRange:options:trialID:");
}

id objc_msgSend_runUntilDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runUntilDate:");
}

id objc_msgSend_runWithObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runWithObserver:");
}

id objc_msgSend_runWithTests_inRange_testHarness_options_reporter_numTrials_reportObserver_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runWithTests:inRange:testHarness:options:reporter:numTrials:reportObserver:");
}

id objc_msgSend_samples(void *a1, const char *a2, ...)
{
  return _[a1 samples];
}

id objc_msgSend_saveBadSentenceAndTranscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveBadSentenceAndTranscript:");
}

id objc_msgSend_scalarMultiplyPoint_by_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scalarMultiplyPoint:by:");
}

id objc_msgSend_scalars(void *a1, const char *a2, ...)
{
  return _[a1 scalars];
}

id objc_msgSend_scanUpToString_intoString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanUpToString:intoString:");
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scannerWithString:");
}

id objc_msgSend_searchHelper_forWord_caseSensitive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "searchHelper:forWord:caseSensitive:");
}

id objc_msgSend_searchString(void *a1, const char *a2, ...)
{
  return _[a1 searchString];
}

id objc_msgSend_secondTap(void *a1, const char *a2, ...)
{
  return _[a1 secondTap];
}

id objc_msgSend_secondaryInputMode(void *a1, const char *a2, ...)
{
  return _[a1 secondaryInputMode];
}

id objc_msgSend_secondaryLanguageWeight(void *a1, const char *a2, ...)
{
  return _[a1 secondaryLanguageWeight];
}

id objc_msgSend_secondaryRepresentedStrings(void *a1, const char *a2, ...)
{
  return _[a1 secondaryRepresentedStrings];
}

id objc_msgSend_secondaryString(void *a1, const char *a2, ...)
{
  return _[a1 secondaryString];
}

id objc_msgSend_secondaryValue(void *a1, const char *a2, ...)
{
  return _[a1 secondaryValue];
}

id objc_msgSend_secureCandidateForInput_slotID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secureCandidateForInput:slotID:");
}

id objc_msgSend_secureCandidateRenderer(void *a1, const char *a2, ...)
{
  return _[a1 secureCandidateRenderer];
}

id objc_msgSend_secureTextEntry(void *a1, const char *a2, ...)
{
  return _[a1 secureTextEntry];
}

id objc_msgSend_seed(void *a1, const char *a2, ...)
{
  return _[a1 seed];
}

id objc_msgSend_seedForTest_trialID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "seedForTest:trialID:");
}

id objc_msgSend_seekToEndOfFile(void *a1, const char *a2, ...)
{
  return _[a1 seekToEndOfFile];
}

id objc_msgSend_segmentAnchorRangeForCursor_withDocumentBefore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "segmentAnchorRangeForCursor:withDocumentBefore:");
}

id objc_msgSend_segmentCursor(void *a1, const char *a2, ...)
{
  return _[a1 segmentCursor];
}

id objc_msgSend_segmentCursorBeforeBackspacing(void *a1, const char *a2, ...)
{
  return _[a1 segmentCursorBeforeBackspacing];
}

id objc_msgSend_segmentEditHorizon(void *a1, const char *a2, ...)
{
  return _[a1 segmentEditHorizon];
}

id objc_msgSend_selectFromPredictionBar_lineNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectFromPredictionBar:lineNumber:");
}

id objc_msgSend_selectedRange(void *a1, const char *a2, ...)
{
  return _[a1 selectedRange];
}

id objc_msgSend_selectedRangeForText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectedRangeForText:");
}

id objc_msgSend_selectedRangeInMarkedText(void *a1, const char *a2, ...)
{
  return _[a1 selectedRangeInMarkedText];
}

id objc_msgSend_selectedText(void *a1, const char *a2, ...)
{
  return _[a1 selectedText];
}

id objc_msgSend_selfId(void *a1, const char *a2, ...)
{
  return _[a1 selfId];
}

id objc_msgSend_senderId(void *a1, const char *a2, ...)
{
  return _[a1 senderId];
}

id objc_msgSend_sendersToTest(void *a1, const char *a2, ...)
{
  return _[a1 sendersToTest];
}

id objc_msgSend_sentenceToTransliteratedPlaybackTest_withCatenation_addWordSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sentenceToTransliteratedPlaybackTest:withCatenation:addWordSpacing:");
}

id objc_msgSend_serializeResultsArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serializeResultsArray:");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAcceptedCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAcceptedCandidate:");
}

id objc_msgSend_setAggdStatistics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAggdStatistics:");
}

id objc_msgSend_setAllowsSpaceCorrections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsSpaceCorrections:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAsyncPredictions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAsyncPredictions:");
}

id objc_msgSend_setAutocapitalizationEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutocapitalizationEnabled:");
}

id objc_msgSend_setAutocapitalizationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutocapitalizationType:");
}

id objc_msgSend_setAutocorrectionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutocorrectionEnabled:");
}

id objc_msgSend_setAutocorrectionList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutocorrectionList:");
}

id objc_msgSend_setAutocorrectionListUIDisplayed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutocorrectionListUIDisplayed:");
}

id objc_msgSend_setAutocorrectionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutocorrectionType:");
}

id objc_msgSend_setAutoshifted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoshifted:");
}

id objc_msgSend_setBackspace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackspace:");
}

id objc_msgSend_setBadSentenceLogFilePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBadSentenceLogFilePath:");
}

id objc_msgSend_setCanMultitap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCanMultitap:");
}

id objc_msgSend_setCanSuggestSupplementalItemsForCurrentSelection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCanSuggestSupplementalItemsForCurrentSelection:");
}

id objc_msgSend_setCandidateResultSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCandidateResultSet:");
}

id objc_msgSend_setCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCenter:");
}

id objc_msgSend_setClientIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientIdentifier:");
}

id objc_msgSend_setClientProxy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientProxy:");
}

id objc_msgSend_setConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfig:");
}

id objc_msgSend_setContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContext:");
}

id objc_msgSend_setContinuousPathConversion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContinuousPathConversion:");
}

id objc_msgSend_setContinuousPathEnabledAlgorithms_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContinuousPathEnabledAlgorithms:");
}

id objc_msgSend_setContinuousPathEnsembleSourceScales_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContinuousPathEnsembleSourceScales:");
}

id objc_msgSend_setContinuousPathEnsembleSourceWeights_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContinuousPathEnsembleSourceWeights:");
}

id objc_msgSend_setContinuousPathParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContinuousPathParams:");
}

id objc_msgSend_setCorpusId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCorpusId:");
}

id objc_msgSend_setCorrected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCorrected:");
}

id objc_msgSend_setCpCandidatesCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCpCandidatesCount:");
}

id objc_msgSend_setCurrentKeystroke_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentKeystroke:");
}

id objc_msgSend_setCurrentKeystrokeSequence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentKeystrokeSequence:");
}

id objc_msgSend_setCurrentRequestToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentRequestToken:");
}

id objc_msgSend_setCursor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCursor:");
}

id objc_msgSend_setDebugData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDebugData:");
}

id objc_msgSend_setDefaultValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultValue:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDeletionCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeletionCount:");
}

id objc_msgSend_setDisableAnalytics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisableAnalytics:");
}

id objc_msgSend_setDocumentIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDocumentIdentifier:");
}

id objc_msgSend_setDocumentState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDocumentState:");
}

id objc_msgSend_setDocumentStates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDocumentStates:");
}

id objc_msgSend_setDragged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDragged:");
}

id objc_msgSend_setDynamicResourcePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDynamicResourcePath:");
}

id objc_msgSend_setErrorGenerator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setErrorGenerator:");
}

id objc_msgSend_setFamilyName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFamilyName:");
}

id objc_msgSend_setFavoniusLanguageModelWeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFavoniusLanguageModelWeight:");
}

id objc_msgSend_setFirstName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirstName:");
}

id objc_msgSend_setFlick_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFlick:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGesture:");
}

id objc_msgSend_setGivenName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGivenName:");
}

id objc_msgSend_setHardwareKeyboardMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHardwareKeyboardMode:");
}

id objc_msgSend_setHasAccentKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasAccentKey:");
}

id objc_msgSend_setHasCandidateKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasCandidateKey:");
}

id objc_msgSend_setHasRelevancyScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasRelevancyScore:");
}

id objc_msgSend_setIndex1_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIndex1:");
}

id objc_msgSend_setIndex2_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIndex2:");
}

id objc_msgSend_setInitialDragPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitialDragPoint:");
}

id objc_msgSend_setInitialKeyplane(void *a1, const char *a2, ...)
{
  return _[a1 setInitialKeyplane];
}

id objc_msgSend_setInlineCompletionBarState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInlineCompletionBarState:");
}

id objc_msgSend_setInlineCompletionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInlineCompletionEnabled:");
}

id objc_msgSend_setInlineCompletions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInlineCompletions:");
}

id objc_msgSend_setInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInput:");
}

id objc_msgSend_setInputContextHistory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputContextHistory:");
}

id objc_msgSend_setInputForMarkedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputForMarkedText:");
}

id objc_msgSend_setInputIsPunctuationFollowingContinuousPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputIsPunctuationFollowingContinuousPath:");
}

id objc_msgSend_setInputManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputManager:");
}

id objc_msgSend_setInputManagerHint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputManagerHint:");
}

id objc_msgSend_setInputManagerLogger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputManagerLogger:");
}

id objc_msgSend_setInputManagerState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputManagerState:");
}

id objc_msgSend_setInputManagerWrapper_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputManagerWrapper:");
}

id objc_msgSend_setInputMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputMode:");
}

id objc_msgSend_setInputModeIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputModeIdentifier:");
}

id objc_msgSend_setInputSegment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputSegment:");
}

id objc_msgSend_setInserted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInserted:");
}

id objc_msgSend_setInsertedKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInsertedKey:");
}

id objc_msgSend_setInsertionText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInsertionText:");
}

id objc_msgSend_setInsertsSpaceAfterPredictiveInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInsertsSpaceAfterPredictiveInput:");
}

id objc_msgSend_setIntended_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIntended:");
}

id objc_msgSend_setIntendedKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIntendedKey:");
}

id objc_msgSend_setIntendedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIntendedText:");
}

id objc_msgSend_setIntendedTransliteration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIntendedTransliteration:");
}

id objc_msgSend_setIntermediateText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIntermediateText:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIsAlphabeticPlane_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsAlphabeticPlane:");
}

id objc_msgSend_setIsBackspacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsBackspacing:");
}

id objc_msgSend_setIsKanaPlane_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsKanaPlane:");
}

id objc_msgSend_setIsScreenLocked_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsScreenLocked:");
}

id objc_msgSend_setJustAcceptedAutocorrection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setJustAcceptedAutocorrection:");
}

id objc_msgSend_setKeyLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyLayout:");
}

id objc_msgSend_setKeyboard_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyboard:");
}

id objc_msgSend_setKeyboardConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyboardConfiguration:");
}

id objc_msgSend_setKeyboardInfoDelgate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyboardInfoDelgate:");
}

id objc_msgSend_setKeyboardInputManagerFactory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyboardInputManagerFactory:");
}

id objc_msgSend_setKeyplane_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyplane:");
}

id objc_msgSend_setKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeys:");
}

id objc_msgSend_setLastActionSuppressesError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastActionSuppressesError:");
}

id objc_msgSend_setLastActionUseSecondaryString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastActionUseSecondaryString:");
}

id objc_msgSend_setLastCPRequestToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastCPRequestToken:");
}

id objc_msgSend_setLastCursorPositionForTransliteratedCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastCursorPositionForTransliteratedCandidate:");
}

id objc_msgSend_setLastInputWasContinuousPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastInputWasContinuousPath:");
}

id objc_msgSend_setLastInputWasSelection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastInputWasSelection:");
}

id objc_msgSend_setLastName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastName:");
}

id objc_msgSend_setLastTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastTimestamp:");
}

id objc_msgSend_setLastTouchEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastTouchEvent:");
}

id objc_msgSend_setLastUpdateDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastUpdateDate:");
}

id objc_msgSend_setLayoutKeyOverride_forKey_uiKeyboardStringNothing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLayoutKeyOverride:forKey:uiKeyboardStringNothing:");
}

id objc_msgSend_setLayoutState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLayoutState:");
}

id objc_msgSend_setLearnWordContextIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLearnWordContextIndex:");
}

id objc_msgSend_setLogDocumentContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLogDocumentContext:");
}

id objc_msgSend_setLongPredictionListEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLongPredictionListEnabled:");
}

id objc_msgSend_setMarkedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMarkedText:");
}

id objc_msgSend_setMatrix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMatrix:");
}

id objc_msgSend_setMaxPredictions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxPredictions:");
}

id objc_msgSend_setMaxPredictionsReported_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxPredictionsReported:");
}

id objc_msgSend_setMaxWordsPerPrediction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxWordsPerPrediction:");
}

id objc_msgSend_setMlttBundleURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMlttBundleURL:");
}

id objc_msgSend_setMockInstance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMockInstance:");
}

id objc_msgSend_setMultitap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMultitap:");
}

id objc_msgSend_setNegativeLearningDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNegativeLearningDisabled:");
}

id objc_msgSend_setNextKeyIsFlick_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNextKeyIsFlick:");
}

id objc_msgSend_setNextKeyIsMultitap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNextKeyIsMultitap:");
}

id objc_msgSend_setNgramModelPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNgramModelPath:");
}

id objc_msgSend_setNumberOfTouches_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfTouches:");
}

id objc_msgSend_setNumberStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberStyle:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOptions:");
}

id objc_msgSend_setPaddedFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPaddedFrame:");
}

id objc_msgSend_setPairs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPairs:");
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPath:");
}

id objc_msgSend_setPathGenerator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPathGenerator:");
}

id objc_msgSend_setPathsForWords_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPathsForWords:");
}

id objc_msgSend_setPopupVariant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPopupVariant:");
}

id objc_msgSend_setPositionInCurrentInternalSegment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPositionInCurrentInternalSegment:");
}

id objc_msgSend_setPredicted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPredicted:");
}

id objc_msgSend_setPredictionBarState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPredictionBarState:");
}

id objc_msgSend_setPrintTranslitSummaries_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrintTranslitSummaries:");
}

id objc_msgSend_setPrintTypingTranscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrintTypingTranscript:");
}

id objc_msgSend_setQuickTypeKeyboardFeatureSpecializationClass(void *a1, const char *a2, ...)
{
  return _[a1 setQuickTypeKeyboardFeatureSpecializationClass];
}

id objc_msgSend_setRandomNumberSeed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRandomNumberSeed:");
}

id objc_msgSend_setRank_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRank:");
}

id objc_msgSend_setRecipientIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecipientIdentifier:");
}

id objc_msgSend_setRelevancyScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelevancyScore:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setReporter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReporter:");
}

id objc_msgSend_setResultClassifiers(void *a1, const char *a2, ...)
{
  return _[a1 setResultClassifiers];
}

id objc_msgSend_setRotation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRotation:");
}

id objc_msgSend_setRotationMatrix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRotationMatrix:");
}

id objc_msgSend_setSearchStringForMarkedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSearchStringForMarkedText:");
}

id objc_msgSend_setSecureTextEntry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecureTextEntry:");
}

id objc_msgSend_setSeed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSeed:");
}

id objc_msgSend_setSegmentCursor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSegmentCursor:");
}

id objc_msgSend_setSegmentCursorBeforeBackspacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSegmentCursorBeforeBackspacing:");
}

id objc_msgSend_setSegmentEditHorizon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSegmentEditHorizon:");
}

id objc_msgSend_setSelectedRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedRange:");
}

id objc_msgSend_setShapeStoreResourceDir_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShapeStoreResourceDir:");
}

id objc_msgSend_setSharedAggdReporter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSharedAggdReporter:");
}

id objc_msgSend_setSharedManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSharedManager:");
}

id objc_msgSend_setSharedTITransientLexiconManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSharedTITransientLexiconManager:");
}

id objc_msgSend_setShiftState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShiftState:");
}

id objc_msgSend_setShiftedKeyToUnShiftedKeyExcludeCapitalizationMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShiftedKeyToUnShiftedKeyExcludeCapitalizationMap:");
}

id objc_msgSend_setShortcutConversionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShortcutConversionEnabled:");
}

id objc_msgSend_setShouldSkipCandidateSelection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldSkipCandidateSelection:");
}

id objc_msgSend_setShowsCandidateBar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsCandidateBar:");
}

id objc_msgSend_setSkewRotation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSkewRotation:");
}

id objc_msgSend_setSmartDashesEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSmartDashesEnabled:");
}

id objc_msgSend_setSmartPunctuationOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSmartPunctuationOptions:");
}

id objc_msgSend_setSmartQuotesEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSmartQuotesEnabled:");
}

id objc_msgSend_setSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSource:");
}

id objc_msgSend_setSourceMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceMetadata:");
}

id objc_msgSend_setSourceTransliteration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceTransliteration:");
}

id objc_msgSend_setSpacingErrorsApplied_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpacingErrorsApplied:");
}

id objc_msgSend_setStaticDictionaryPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStaticDictionaryPath:");
}

id objc_msgSend_setStepCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStepCount:");
}

id objc_msgSend_setStepSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStepSize:");
}

id objc_msgSend_setStickerSuggestionsEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStickerSuggestionsEnabled:");
}

id objc_msgSend_setString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setString:");
}

id objc_msgSend_setSupplementalLexiconIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupplementalLexiconIdentifier:");
}

id objc_msgSend_setSweepMax_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSweepMax:");
}

id objc_msgSend_setSweepMin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSweepMin:");
}

id objc_msgSend_setSweepValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSweepValue:");
}

id objc_msgSend_setSynthesizedByAcceptingCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSynthesizedByAcceptingCandidate:");
}

id objc_msgSend_setTags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTags:");
}

id objc_msgSend_setTagsFromClassifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTagsFromClassifiers:");
}

id objc_msgSend_setTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTarget:");
}

id objc_msgSend_setTestHarness_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTestHarness:");
}

id objc_msgSend_setTesting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTesting:");
}

id objc_msgSend_setTestingStateObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTestingStateObject:");
}

id objc_msgSend_setTextInputTraits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextInputTraits:");
}

id objc_msgSend_setTokenIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTokenIndex:");
}

id objc_msgSend_setTouch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTouch:");
}

id objc_msgSend_setTouchError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTouchError:");
}

id objc_msgSend_setTouchEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTouchEvent:");
}

id objc_msgSend_setTouchEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTouchEvents:");
}

id objc_msgSend_setTouched_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTouched:");
}

id objc_msgSend_setTouchedKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTouchedKey:");
}

id objc_msgSend_setTtkLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTtkLayout:");
}

id objc_msgSend_setTypingEngine_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTypingEngine:");
}

id objc_msgSend_setTypologyLogURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTypologyLogURL:");
}

id objc_msgSend_setTypologyPreferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTypologyPreferences:");
}

id objc_msgSend_setTypologyTraceLogURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTypologyTraceLogURL:");
}

id objc_msgSend_setUppercase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUppercase:");
}

id objc_msgSend_setUserInterfaceIdiom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInterfaceIdiom:");
}

id objc_msgSend_setUserModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserModel:");
}

id objc_msgSend_setUserPathManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserPathManager:");
}

id objc_msgSend_setUserPersona_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserPersona:");
}

id objc_msgSend_setUsesAdaptation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesAdaptation:");
}

id objc_msgSend_setUsesAutocapitalization_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesAutocapitalization:");
}

id objc_msgSend_setUsesAutocorrection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesAutocorrection:");
}

id objc_msgSend_setUsesCJContinuousPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesCJContinuousPath:");
}

id objc_msgSend_setUsesContinuousPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesContinuousPath:");
}

id objc_msgSend_setUsesContinuousPathRetrocorrection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesContinuousPathRetrocorrection:");
}

id objc_msgSend_setUsesCustomNgramModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesCustomNgramModel:");
}

id objc_msgSend_setUsesCustomStaticDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesCustomStaticDictionary:");
}

id objc_msgSend_setUsesETSRescoring_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesETSRescoring:");
}

id objc_msgSend_setUsesPrediction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesPrediction:");
}

id objc_msgSend_setUsesRetrocorrection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesRetrocorrection:");
}

id objc_msgSend_setUsesStemSuffixCorrectionFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesStemSuffixCorrectionFactor:");
}

id objc_msgSend_setUsesTextChecker_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesTextChecker:");
}

id objc_msgSend_setUsesTransliteration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesTransliteration:");
}

id objc_msgSend_setUsesTwoHands_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesTwoHands:");
}

id objc_msgSend_setUsesUserModelLogging_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesUserModelLogging:");
}

id objc_msgSend_setUsesWordNgramModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesWordNgramModel:");
}

id objc_msgSend_setUsesWordNgramModelAdaptation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesWordNgramModelAdaptation:");
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVisible:");
}

id objc_msgSend_setWarnIfSelectingPopupVariant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWarnIfSelectingPopupVariant:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setWordLearningEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWordLearningEnabled:");
}

id objc_msgSend_setXScale_yScale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setXScale:yScale:");
}

id objc_msgSend_setXTrans_yTrans_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setXTrans:yTrans:");
}

id objc_msgSend_setupSingletonMocksWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupSingletonMocksWithOptions:");
}

id objc_msgSend_sharedInputModeController(void *a1, const char *a2, ...)
{
  return _[a1 sharedInputModeController];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedKeyboardFactory(void *a1, const char *a2, ...)
{
  return _[a1 sharedKeyboardFactory];
}

id objc_msgSend_sharedTIContactManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedTIContactManager];
}

id objc_msgSend_sharedUserModelDataStore(void *a1, const char *a2, ...)
{
  return _[a1 sharedUserModelDataStore];
}

id objc_msgSend_shiftAlternateKeyplaneName(void *a1, const char *a2, ...)
{
  return _[a1 shiftAlternateKeyplaneName];
}

id objc_msgSend_shiftKeyToAccessKeyplaneCloserToKeyString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shiftKeyToAccessKeyplaneCloserToKeyString:");
}

id objc_msgSend_shiftKeyplane(void *a1, const char *a2, ...)
{
  return _[a1 shiftKeyplane];
}

id objc_msgSend_shiftState(void *a1, const char *a2, ...)
{
  return _[a1 shiftState];
}

id objc_msgSend_shiftedKeyToUnShiftedKeyExcludeCapitalizationMap(void *a1, const char *a2, ...)
{
  return _[a1 shiftedKeyToUnShiftedKeyExcludeCapitalizationMap];
}

id objc_msgSend_shortDescription(void *a1, const char *a2, ...)
{
  return _[a1 shortDescription];
}

id objc_msgSend_shortcutConversion(void *a1, const char *a2, ...)
{
  return _[a1 shortcutConversion];
}

id objc_msgSend_shouldAcceptCandidate_beforeInputString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldAcceptCandidate:beforeInputString:");
}

id objc_msgSend_shouldAcceptInlineCompletion(void *a1, const char *a2, ...)
{
  return _[a1 shouldAcceptInlineCompletion];
}

id objc_msgSend_shouldAcceptTopCandidate(void *a1, const char *a2, ...)
{
  return _[a1 shouldAcceptTopCandidate];
}

id objc_msgSend_shouldBeginCorrectingAfterWord(void *a1, const char *a2, ...)
{
  return _[a1 shouldBeginCorrectingAfterWord];
}

id objc_msgSend_shouldBeginCorrectingAfterWordTerminator(void *a1, const char *a2, ...)
{
  return _[a1 shouldBeginCorrectingAfterWordTerminator];
}

id objc_msgSend_shouldConcatenateTokensAtBoundaryError(void *a1, const char *a2, ...)
{
  return _[a1 shouldConcatenateTokensAtBoundaryError];
}

id objc_msgSend_shouldIgnoreCurrentCharacter(void *a1, const char *a2, ...)
{
  return _[a1 shouldIgnoreCurrentCharacter];
}

id objc_msgSend_shouldInsertSpaceAfterSelection(void *a1, const char *a2, ...)
{
  return _[a1 shouldInsertSpaceAfterSelection];
}

id objc_msgSend_shouldRejectBadAutocorrection(void *a1, const char *a2, ...)
{
  return _[a1 shouldRejectBadAutocorrection];
}

id objc_msgSend_shouldSkipCandidateSelection(void *a1, const char *a2, ...)
{
  return _[a1 shouldSkipCandidateSelection];
}

id objc_msgSend_shouldStopAfterAddingStateString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldStopAfterAddingStateString:");
}

id objc_msgSend_shouldSuppressAutocorrectionWithTerminator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldSuppressAutocorrectionWithTerminator:");
}

id objc_msgSend_shouldTypeInternalString(void *a1, const char *a2, ...)
{
  return _[a1 shouldTypeInternalString];
}

id objc_msgSend_showsCandidateBar(void *a1, const char *a2, ...)
{
  return _[a1 showsCandidateBar];
}

id objc_msgSend_signal(void *a1, const char *a2, ...)
{
  return _[a1 signal];
}

id objc_msgSend_skipHitTestForTouchEvent_keyboardState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "skipHitTestForTouchEvent:keyboardState:");
}

id objc_msgSend_slotID(void *a1, const char *a2, ...)
{
  return _[a1 slotID];
}

id objc_msgSend_smartPunctuationController(void *a1, const char *a2, ...)
{
  return _[a1 smartPunctuationController];
}

id objc_msgSend_smartPunctuationOptionsForLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "smartPunctuationOptionsForLocale:");
}

id objc_msgSend_smartPunctuationOutputForInput_isLockedInput_documentState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "smartPunctuationOutputForInput:isLockedInput:documentState:");
}

id objc_msgSend_smartPunctuationResultsForString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "smartPunctuationResultsForString:");
}

id objc_msgSend_solveSystemOfEquations_withBMatrix_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "solveSystemOfEquations:withBMatrix:size:");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return _[a1 source];
}

id objc_msgSend_sourceMask(void *a1, const char *a2, ...)
{
  return _[a1 sourceMask];
}

id objc_msgSend_sourceMetadata(void *a1, const char *a2, ...)
{
  return _[a1 sourceMetadata];
}

id objc_msgSend_sourceTransliteration(void *a1, const char *a2, ...)
{
  return _[a1 sourceTransliteration];
}

id objc_msgSend_spaceAutocorrectionEnabled(void *a1, const char *a2, ...)
{
  return _[a1 spaceAutocorrectionEnabled];
}

id objc_msgSend_spaceHorizontalErrorMode(void *a1, const char *a2, ...)
{
  return _[a1 spaceHorizontalErrorMode];
}

id objc_msgSend_spaceVerticalBias(void *a1, const char *a2, ...)
{
  return _[a1 spaceVerticalBias];
}

id objc_msgSend_spacesBetweenTransliterations(void *a1, const char *a2, ...)
{
  return _[a1 spacesBetweenTransliterations];
}

id objc_msgSend_spacingErrorMaxCount(void *a1, const char *a2, ...)
{
  return _[a1 spacingErrorMaxCount];
}

id objc_msgSend_spacingErrorsApplied(void *a1, const char *a2, ...)
{
  return _[a1 spacingErrorsApplied];
}

id objc_msgSend_splitDigraphsInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "splitDigraphsInString:");
}

id objc_msgSend_stage(void *a1, const char *a2, ...)
{
  return _[a1 stage];
}

id objc_msgSend_startTime(void *a1, const char *a2, ...)
{
  return _[a1 startTime];
}

id objc_msgSend_stateTranscript(void *a1, const char *a2, ...)
{
  return _[a1 stateTranscript];
}

id objc_msgSend_stepSize(void *a1, const char *a2, ...)
{
  return _[a1 stepSize];
}

id objc_msgSend_stoppageReason(void *a1, const char *a2, ...)
{
  return _[a1 stoppageReason];
}

id objc_msgSend_streamError(void *a1, const char *a2, ...)
{
  return _[a1 streamError];
}

id objc_msgSend_streamStatus(void *a1, const char *a2, ...)
{
  return _[a1 streamStatus];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return _[a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringByPaddingToLength_withString_startingAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByPaddingToLength:withString:startingAtIndex:");
}

id objc_msgSend_stringByReplacingCurlyQuotesWithStraightQuotes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingCurlyQuotesWithStraightQuotes:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_options_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:options:range:");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringEndsWord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringEndsWord:");
}

id objc_msgSend_stringForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForProperty:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCapacity:");
}

id objc_msgSend_stringWithCharacters_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCharacters:length:");
}

id objc_msgSend_stringWithContentsOfFile_encoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithContentsOfFile:encoding:error:");
}

id objc_msgSend_stringWithContentsOfURL_encoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithContentsOfURL:encoding:error:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_substitutesForKey_preferBaseKeyVariants_preferManualShift_substituteUpperCaseForLowerCase_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substitutesForKey:preferBaseKeyVariants:preferManualShift:substituteUpperCaseForLowerCase:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_subtractPoint_byPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subtractPoint:byPoint:");
}

id objc_msgSend_subtreeWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subtreeWithName:");
}

id objc_msgSend_subtrees(void *a1, const char *a2, ...)
{
  return _[a1 subtrees];
}

id objc_msgSend_sumFloatField_forEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sumFloatField:forEvent:");
}

id objc_msgSend_sumFloatField_forEvent_filteredWithPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sumFloatField:forEvent:filteredWithPredicate:");
}

id objc_msgSend_sumFloatField_forEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sumFloatField:forEvents:");
}

id objc_msgSend_sumIntegerField_forEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sumIntegerField:forEvent:");
}

id objc_msgSend_sumIntegerField_forEvent_filteredWithPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sumIntegerField:forEvent:filteredWithPredicate:");
}

id objc_msgSend_sumIntegerField_forEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sumIntegerField:forEvents:");
}

id objc_msgSend_supplementalLexiconIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 supplementalLexiconIdentifier];
}

id objc_msgSend_supportedInputModeIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 supportedInputModeIdentifiers];
}

id objc_msgSend_suspend(void *a1, const char *a2, ...)
{
  return _[a1 suspend];
}

id objc_msgSend_sweepMax(void *a1, const char *a2, ...)
{
  return _[a1 sweepMax];
}

id objc_msgSend_sweepMin(void *a1, const char *a2, ...)
{
  return _[a1 sweepMin];
}

id objc_msgSend_sweepStateHeader(void *a1, const char *a2, ...)
{
  return _[a1 sweepStateHeader];
}

id objc_msgSend_sweepStateValues(void *a1, const char *a2, ...)
{
  return _[a1 sweepStateValues];
}

id objc_msgSend_sweepValue(void *a1, const char *a2, ...)
{
  return _[a1 sweepValue];
}

id objc_msgSend_swizzleTestingParameters(void *a1, const char *a2, ...)
{
  return _[a1 swizzleTestingParameters];
}

id objc_msgSend_syncToDocumentState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncToDocumentState:");
}

id objc_msgSend_syncToEmptyDocument(void *a1, const char *a2, ...)
{
  return _[a1 syncToEmptyDocument];
}

id objc_msgSend_syncToKeyboardState_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncToKeyboardState:completionHandler:");
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronousRemoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_syntaxErrors(void *a1, const char *a2, ...)
{
  return _[a1 syntaxErrors];
}

id objc_msgSend_tags(void *a1, const char *a2, ...)
{
  return _[a1 tags];
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return _[a1 target];
}

id objc_msgSend_targetDeviatedNormallyFromPoint_withKeyWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "targetDeviatedNormallyFromPoint:withKeyWidth:");
}

id objc_msgSend_tearDown(void *a1, const char *a2, ...)
{
  return _[a1 tearDown];
}

id objc_msgSend_teardownSingletonMocks_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "teardownSingletonMocks:");
}

id objc_msgSend_terminatorsDeletingAutospace(void *a1, const char *a2, ...)
{
  return _[a1 terminatorsDeletingAutospace];
}

id objc_msgSend_testConversation_testingSender_warmupMessages_adaptToSentMessages_adaptToReceivedMessages_trialID_withError_writingResults_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "testConversation:testingSender:warmupMessages:adaptToSentMessages:adaptToReceivedMessages:trialID:withError:writingResults:");
}

id objc_msgSend_testHarness(void *a1, const char *a2, ...)
{
  return _[a1 testHarness];
}

id objc_msgSend_testTyper(void *a1, const char *a2, ...)
{
  return _[a1 testTyper];
}

id objc_msgSend_testWithConversation_sendersToTest_warmupMessages_adaptToSentMessages_adaptToReceivedMessages_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "testWithConversation:sendersToTest:warmupMessages:adaptToSentMessages:adaptToReceivedMessages:");
}

id objc_msgSend_testWithInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "testWithInput:");
}

id objc_msgSend_testWithInput_andCorpusId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "testWithInput:andCorpusId:");
}

id objc_msgSend_testWithInput_expectedOutput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "testWithInput:expectedOutput:");
}

id objc_msgSend_testWithInput_expectedOutput_sourceMetadata_withTouches_andCorpusId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "testWithInput:expectedOutput:sourceMetadata:withTouches:andCorpusId:");
}

id objc_msgSend_testWithTouches_expectedOutput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "testWithTouches:expectedOutput:");
}

id objc_msgSend_testsWithIntendedOutput_expectedOutput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "testsWithIntendedOutput:expectedOutput:");
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_textAccepted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textAccepted:");
}

id objc_msgSend_textAccepted_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textAccepted:completionHandler:");
}

id objc_msgSend_textAccepted_predictiveCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textAccepted:predictiveCandidate:");
}

id objc_msgSend_textCorpus(void *a1, const char *a2, ...)
{
  return _[a1 textCorpus];
}

id objc_msgSend_textCorpusForOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textCorpusForOptions:");
}

id objc_msgSend_textInputTraits(void *a1, const char *a2, ...)
{
  return _[a1 textInputTraits];
}

id objc_msgSend_textToCommit(void *a1, const char *a2, ...)
{
  return _[a1 textToCommit];
}

id objc_msgSend_timeDelta(void *a1, const char *a2, ...)
{
  return _[a1 timeDelta];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_timeStamp(void *a1, const char *a2, ...)
{
  return _[a1 timeStamp];
}

id objc_msgSend_timeout(void *a1, const char *a2, ...)
{
  return _[a1 timeout];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return _[a1 timestamp];
}

id objc_msgSend_toDictionary(void *a1, const char *a2, ...)
{
  return _[a1 toDictionary];
}

id objc_msgSend_toJsonDict(void *a1, const char *a2, ...)
{
  return _[a1 toJsonDict];
}

id objc_msgSend_toJsonDictionary(void *a1, const char *a2, ...)
{
  return _[a1 toJsonDictionary];
}

id objc_msgSend_tokenForKeyboardState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tokenForKeyboardState:");
}

id objc_msgSend_tokenizeEntity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tokenizeEntity:");
}

id objc_msgSend_tokensForString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tokensForString:");
}

id objc_msgSend_touch(void *a1, const char *a2, ...)
{
  return _[a1 touch];
}

id objc_msgSend_touchData(void *a1, const char *a2, ...)
{
  return _[a1 touchData];
}

id objc_msgSend_touchDataCollection(void *a1, const char *a2, ...)
{
  return _[a1 touchDataCollection];
}

id objc_msgSend_touchEvent(void *a1, const char *a2, ...)
{
  return _[a1 touchEvent];
}

id objc_msgSend_touchEventWithStage_location_radius_timestamp_pathIndex_fingerID_forcedKeyCode_continuousPathState_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:");
}

id objc_msgSend_touchEventWithStage_location_radius_timestamp_pathIndex_forcedKeyCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "touchEventWithStage:location:radius:timestamp:pathIndex:forcedKeyCode:");
}

id objc_msgSend_touchEvents(void *a1, const char *a2, ...)
{
  return _[a1 touchEvents];
}

id objc_msgSend_touchPassesDragThresholdAtPoint_pathIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "touchPassesDragThresholdAtPoint:pathIndex:");
}

id objc_msgSend_touched(void *a1, const char *a2, ...)
{
  return _[a1 touched];
}

id objc_msgSend_touchedKey(void *a1, const char *a2, ...)
{
  return _[a1 touchedKey];
}

id objc_msgSend_touches(void *a1, const char *a2, ...)
{
  return _[a1 touches];
}

id objc_msgSend_trainWithCorpus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trainWithCorpus:");
}

id objc_msgSend_traitsWithScreen_orientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "traitsWithScreen:orientation:");
}

id objc_msgSend_transformedPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transformedPoint:");
}

id objc_msgSend_translateLayoutForKeys_keyboardController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "translateLayoutForKeys:keyboardController:");
}

id objc_msgSend_transliteration(void *a1, const char *a2, ...)
{
  return _[a1 transliteration];
}

id objc_msgSend_transliterationCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transliterationCandidate:");
}

id objc_msgSend_trimmedCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trimmedCandidate:");
}

id objc_msgSend_tryAcceptCandidate(void *a1, const char *a2, ...)
{
  return _[a1 tryAcceptCandidate];
}

id objc_msgSend_tryAcceptingCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tryAcceptingCandidate:");
}

id objc_msgSend_tryBackspacing(void *a1, const char *a2, ...)
{
  return _[a1 tryBackspacing];
}

id objc_msgSend_tryChangeKeyplane(void *a1, const char *a2, ...)
{
  return _[a1 tryChangeKeyplane];
}

id objc_msgSend_tryContinuousPath(void *a1, const char *a2, ...)
{
  return _[a1 tryContinuousPath];
}

id objc_msgSend_tryDoubleKeyTap(void *a1, const char *a2, ...)
{
  return _[a1 tryDoubleKeyTap];
}

id objc_msgSend_tryExtraKeyTap(void *a1, const char *a2, ...)
{
  return _[a1 tryExtraKeyTap];
}

id objc_msgSend_tryKeyTap(void *a1, const char *a2, ...)
{
  return _[a1 tryKeyTap];
}

id objc_msgSend_tryPeriodShortcut(void *a1, const char *a2, ...)
{
  return _[a1 tryPeriodShortcut];
}

id objc_msgSend_tryRejectCandidate(void *a1, const char *a2, ...)
{
  return _[a1 tryRejectCandidate];
}

id objc_msgSend_trySelectPopupVariant(void *a1, const char *a2, ...)
{
  return _[a1 trySelectPopupVariant];
}

id objc_msgSend_trySkipKeyTap(void *a1, const char *a2, ...)
{
  return _[a1 trySkipKeyTap];
}

id objc_msgSend_trySubstituteKeyTap(void *a1, const char *a2, ...)
{
  return _[a1 trySubstituteKeyTap];
}

id objc_msgSend_tryTransposedKeyTaps(void *a1, const char *a2, ...)
{
  return _[a1 tryTransposedKeyTaps];
}

id objc_msgSend_tryTypingWillSuppressError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tryTypingWillSuppressError:");
}

id objc_msgSend_twoKeyTapShortDescription(void *a1, const char *a2, ...)
{
  return _[a1 twoKeyTapShortDescription];
}

id objc_msgSend_typeTest_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "typeTest:withError:");
}

id objc_msgSend_typedStringLMRankingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 typedStringLMRankingEnabled];
}

id objc_msgSend_typingEngine(void *a1, const char *a2, ...)
{
  return _[a1 typingEngine];
}

id objc_msgSend_typingLogWithDebug_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "typingLogWithDebug:");
}

id objc_msgSend_typologyLogURL(void *a1, const char *a2, ...)
{
  return _[a1 typologyLogURL];
}

id objc_msgSend_typologyOutpath(void *a1, const char *a2, ...)
{
  return _[a1 typologyOutpath];
}

id objc_msgSend_typologyPreferences(void *a1, const char *a2, ...)
{
  return _[a1 typologyPreferences];
}

id objc_msgSend_typologyTraceLogURL(void *a1, const char *a2, ...)
{
  return _[a1 typologyTraceLogURL];
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_uncommittedText(void *a1, const char *a2, ...)
{
  return _[a1 uncommittedText];
}

id objc_msgSend_uniformRandomNumber(void *a1, const char *a2, ...)
{
  return _[a1 uniformRandomNumber];
}

id objc_msgSend_uniformRandomPointInRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uniformRandomPointInRect:");
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _[a1 unlock];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_updateAutoshift(void *a1, const char *a2, ...)
{
  return _[a1 updateAutoshift];
}

id objc_msgSend_updateDocumentState(void *a1, const char *a2, ...)
{
  return _[a1 updateDocumentState];
}

id objc_msgSend_updateFromKeyplane_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateFromKeyplane:");
}

id objc_msgSend_updateGlobalBias(void *a1, const char *a2, ...)
{
  return _[a1 updateGlobalBias];
}

id objc_msgSend_updateKeyboardOutput_withInputForSmartPunctuation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateKeyboardOutput:withInputForSmartPunctuation:");
}

id objc_msgSend_updateResultForAutoFill_predictionCandidatesWithoutTyping_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateResultForAutoFill:predictionCandidatesWithoutTyping:");
}

id objc_msgSend_uppercaseLetterCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 uppercaseLetterCharacterSet];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _[a1 uppercaseString];
}

id objc_msgSend_uppercaseStringWithLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uppercaseStringWithLocale:");
}

id objc_msgSend_usageTrackingMask(void *a1, const char *a2, ...)
{
  return _[a1 usageTrackingMask];
}

id objc_msgSend_usePartialCandidates(void *a1, const char *a2, ...)
{
  return _[a1 usePartialCandidates];
}

id objc_msgSend_userActionStream(void *a1, const char *a2, ...)
{
  return _[a1 userActionStream];
}

id objc_msgSend_userActionStreamWithParameters_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userActionStreamWithParameters:delegate:");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceIdiom];
}

id objc_msgSend_userModel(void *a1, const char *a2, ...)
{
  return _[a1 userModel];
}

id objc_msgSend_userPathManager(void *a1, const char *a2, ...)
{
  return _[a1 userPathManager];
}

id objc_msgSend_userPersona(void *a1, const char *a2, ...)
{
  return _[a1 userPersona];
}

id objc_msgSend_userPointForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userPointForKey:");
}

id objc_msgSend_usesAutoShift(void *a1, const char *a2, ...)
{
  return _[a1 usesAutoShift];
}

id objc_msgSend_usesAutocapitalization(void *a1, const char *a2, ...)
{
  return _[a1 usesAutocapitalization];
}

id objc_msgSend_usesAutocorrection(void *a1, const char *a2, ...)
{
  return _[a1 usesAutocorrection];
}

id objc_msgSend_usesCandidateSelection(void *a1, const char *a2, ...)
{
  return _[a1 usesCandidateSelection];
}

id objc_msgSend_usesContinuousPath(void *a1, const char *a2, ...)
{
  return _[a1 usesContinuousPath];
}

id objc_msgSend_usesPrediction(void *a1, const char *a2, ...)
{
  return _[a1 usesPrediction];
}

id objc_msgSend_usesTransliteration(void *a1, const char *a2, ...)
{
  return _[a1 usesTransliteration];
}

id objc_msgSend_usesWordNgramModel(void *a1, const char *a2, ...)
{
  return _[a1 usesWordNgramModel];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_value_withObjCType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "value:withObjCType:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueForKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKeyPath:");
}

id objc_msgSend_valueWithBytes_objCType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithBytes:objCType:");
}

id objc_msgSend_valueWithCGPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithCGPoint:");
}

id objc_msgSend_velocity(void *a1, const char *a2, ...)
{
  return _[a1 velocity];
}

id objc_msgSend_visible(void *a1, const char *a2, ...)
{
  return _[a1 visible];
}

id objc_msgSend_wait(void *a1, const char *a2, ...)
{
  return _[a1 wait];
}

id objc_msgSend_waitUntilDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waitUntilDate:");
}

id objc_msgSend_warmupMessages(void *a1, const char *a2, ...)
{
  return _[a1 warmupMessages];
}

id objc_msgSend_warnIfSelectingPopupVariant(void *a1, const char *a2, ...)
{
  return _[a1 warnIfSelectingPopupVariant];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 whitespaceCharacterSet];
}

id objc_msgSend_wordLearningEnabled(void *a1, const char *a2, ...)
{
  return _[a1 wordLearningEnabled];
}

id objc_msgSend_wordOriginFeedbackID(void *a1, const char *a2, ...)
{
  return _[a1 wordOriginFeedbackID];
}

id objc_msgSend_wordSeparator(void *a1, const char *a2, ...)
{
  return _[a1 wordSeparator];
}

id objc_msgSend_writeData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeData:");
}

id objc_msgSend_writeJSONObject_toStream_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeJSONObject:toStream:options:error:");
}

id objc_msgSend_writeToFile(void *a1, const char *a2, ...)
{
  return _[a1 writeToFile];
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:atomically:");
}

id objc_msgSend_writeToFile_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:atomically:encoding:error:");
}

id objc_msgSend_zipGeometrySet(void *a1, const char *a2, ...)
{
  return _[a1 zipGeometrySet];
}
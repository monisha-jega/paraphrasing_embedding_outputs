


# DATA (data/)

## kumarvon2018-data/fren/
**train.tok.true.en**, **train.tok.true.fr** <br>
Preprocessed IWSLT'16 train files

**tst201314.tok.true.en**, **tst201314.tok.true.fr** <br>
Preprocessed IWSLT'16 validation files

**tst201516.tok.true.en**, **tst201516.tok.true.fr** <br>
Preprocessed IWSLT'16 test files

	All other files are intermediates.

### gen/1/
>**train.src**, **train.lang**, **train.tgt** <br>
Training data consisting of 1% autoencoding data, constructed from the train.tok.true.* files above. 

>**train.shuffled.src**, **train.shuffled.lang**, **train.shuffled.tgt** <br>
Same as above, but shuffled.

>**trans/**
>>**train.shuffled.src**, **train.shuffled.tgt** <br>
Same as above, but language token prepended - ready to be fed to transformer.

### gen/1fr/
>**train.src**, **train.lang**, **train.tgt** <br>
Training data consisting of 1% autoencoding data, constructed from the train.tok.true.* files above, BUT the autoencoding data is French and not English.

>**train.shuffled.src**, **train.shuffled.lang**, **train.shuffled.tgt** <br>
Same as above, but shuffled.

>**trans/**
>>**train.shuffled.src**, **train.shuffled.tgt** <br>
Same as above, but language token prepended - ready to be fed to transformer.

### gen/5/
>**train.src**, **train.lang**, **train.tgt** <br>
Training data consisting of 5% autoencoding data, constructed from the train.tok.true.* files above. 

>**train.shuffled.src**, **train.shuffled.lang**, **train.shuffled.tgt** <br>
Same as above, but shuffled.

>**trans/**
>>**train.shuffled.src**, **train.shuffled.tgt** <br>
Same as above, but language token prepended - ready to be fed to transformer.

### gen/trans/

>**en_val.en**, **fr_val.fr** <br>
Same as the tst201314.tok.true.* files above, but with English/French start tokens prepended - to be fed as validation data to transformer models for paraphrasing.

>**fr_test.en**, **en_test.fr** <br>
Same as the tst201516.tok.true.* files above, but with English/French start tokens prepended - to be fed as test data to transformer models for translation.

>**en_val.en**, **fr_val.fr** <br>
Same as the tst201314.tok.true.* files above, but with English/French start tokens prepended - to be fed as test data to transformer models for paraphrasing.



### gen/twoway/
>**train.src**, **train.lang**, **train.tgt** <br>
Training data consisting of 0% autoencoding data, constructed from the train.tok.true.* files above. 

>**train.shuffled.src**, **train.shuffled.lang**, **train.shuffled.tgt** <br>
Same as above, but shuffled.

>**trans/**
>>**train.shuffled.src**, **train.shuffled.tgt** <br>
Same as above, but language token prepended - ready to be fed to transformer.

## ruen_unused/

**train.ru**
Monolingual Russian corpus

**train.tags.en-ru-en, train.tags.en-ru.ru**
Training parallel data in XML format.

**IWSLT14.TED.dev2010.en-ru.en.xml, IWSLT14.TED.dev2010.en-ru.ru.xml**
Dev set of parallel data in XML format.

**IWSLT14.TED.test201\*.en-ru.en.xml, IWSLT14.TED.test201\*.en-ru.ru.xml**
Tests sets of parallel data in XML format.

**make\_train\_data.py** <br>
Create train data by combining all the parallel data.

**full\_train.en, ful\_train.ru**
The output of the above code, complete parallel data.

## ru-en_sachin/

**split/**
The actual data provided by Sachin in two parts which I combined.

**train.en, rain.ru**
Training data

**train.en.tok.true.en, rain.ru.tok.true.ru**
Training datam tokenized and truecased.


## paranmt/
**filtered_paranmt\_0.7\_0.5** <br>
The complete dataset provided by John

**sample\_data.py** <br>
Create train, test and validation data from the above dataset.

**train.src**, **train.tgt** <br>
Training set sampled from the above <br>
**train.tok.true.en**, **train.tok.true.en** <br>
Preprocessed train files

**val.src**, **val.tgt** <br>
Validation set sampled from the above <br>
**val.tok.true.en**, **val.tok.true.en** <br>
Preprocessed validaiton files

**test.src**, **test.tgt** <br>
Test set sampled from the above <br>
**test.tok.true.en**, **ttest.tok.true.en** <br>
Preprocessed test files



## onepara/

**train.src**, **train.lang**, **train.tgt** <br>
Training data consisting of 1% autoencoding data, where the autoencoding data is from ParaNMT, wherease the translation data is from IWSLT. 

**trans/** <br>
>**train.src**, **train.lang**, **train.tgt** <br>
Same as above, but shuffled and language token prepended - ready to be fed to transformer.


## en-fr-paraphrase-john/

**en.txt**, **fr.txt** <br>
The complete dataset provided by John

**sample\_data.py** <br>
Create train, test and validation data from the above dataset.

**eng-train.txt**, **fren-train.txt** <br>
Training set sampled from the above <br>
**eng-train.tok.true.en**, **fren-train.tok.true.en** <br>
Preprocessed train files

**eng-val.txt**, **fren-val.txt** <br>
Validation set sampled from the above <br>
**eng-val.tok.true.en**, **fren-val.tok.true.en** <br>
Preprocessed validaiton files

**eng-test.txt**, **fren-test.txt** <br>
Test set sampled from the above <br>
**eng-test.tok.true.en**, **fren-ttest.tok.true.en** <br>
Preprocessed test files

###1/
>**train.src**, **train.lang**, **train.tgt** <br>
Training data consisting of 1% autoencoding data, constructed from the *-train.txt files above. 

>**train.shuffled.src**, **train.shuffled.lang**, **train.shuffled.tgt** <br>
Same as above, but shuffled.

>**trans/**
>>**train.shuffled.src**, **train.shuffled.tgt** <br>
Same as above, but language token prepended - ready to be fed to transformer.

*All other files are intermediates.*

## johnpara/

**train.src**, **train.lang**, **train.tgt** <br>
Training data consisting of 4000-size autoencoding data, where the autoencoding data is from ParaNMT, wherease the translation data is from en-fr-paraphrase-john. 

**trans/** <br>
>**train.src**, **train.lang**, **train.tgt** <br>
Same as above, but shuffled and language token prepended - ready to be fed to transformer.

____
____

# orig_seq2seq-con-trans/
Sachin's original translation with OpenNMT-py transformer code. The actual transformer code is inside OpenNMT-py/.
____
____

# seq2seq-con-trans/
Copy of the above folder, but modified to accept a language specific start tokens while decoding.
____
____

# seq2seq-con-trans-mv/
Copy of the above folder, but modified to handle a maximum of three validation sets instead of one.

____
____

# UTILITY CODE (util-code/)

**add_noise** <br>
Adds noise to data by shuffling words within a given window size and by dropping out some words.

**create_test_file** <br>
Create a test file out of a large dataset.

**vecmap/** <br>
The cross-lingual embedding vector mapping tool that was used to map the French and English fasttext embeddings into the same space, using a seed dictionary.

**moses/** <br>
The Moses preprocessing library, modified a little to handle UTF-8.

**bert-score/** <br> 
The BERTScore python library, modified a little to handle UTF-8. Although it can be installed from pip, the modified version is needed in some cases.

**combine\_emb\_files.py** <br>
Combined two embedding files into one - used to combine the French and English embeddings for bilingual models.

**create\_lang\_file.py** <br>
Creates a .lang file with the target language for each data point where we have autoencoding data in one language.

**create\_double\_lang\_file.py** <br>
Creates a .lang file with the target language for each data point where we have autoencoding data in two languages.

**shuffle.py** <br>
Shuffle data along with the language descriptors in the .lang file.

**prepend\_lang\_tokens.py** <br>
Prepends the language specific start tokens to the data based on the langauge descriptors in the .lang file.

**val\_plotter** <br>
Plot validation losses of a model against number of training steps

**postprocess\_preds.py** <br>
Post-process test predictions by replacing French words with English equivalents using a dictionary.

____
____

## EVALUATION CODE (eval-code/)

**stanford/** <br>
The downloaded unzipped Stanford CoreNLP library.

**bleu.sh** <br>
BLEU Score calculator.

**bert_per_line.py** <br>
BERTScore Calculator that outputs the score for each line into a file.

**diversity_analysis.py** <br>
Computes a set of diversity metrics for a sample of the original test set and its predictions by a baseline and a model. This sample is selected as the set of sentences for which the both the predictions have a higher BertScore than a manually set threshold.

**bleu1.py** <br>
BLEU1 Score calculator.

**iou.py** <br>
IOU Score calculator.

**wer.py** <br>
WER Score calculator.

**iou_per_line.py** <br>
IOU Score calculator - that outputs the IOU of each line into a file.

**wer_per_line.py** <br>
WER Score calculator - that outputs the WER of each line into a file.

**meteor.py** <br>
METEOR Score calculator

**sari.py** <br>
SARI Score calculator.

**parse.py** <br>
Sentence Parser <br>
**tree_utils.py** <br>
Utility Functions. <br>
**ted.py** <br>
TED Score calculator.
**ted_per_line.py** <br>
TED Score calculator - that outputs the TED of each line into a file.

**paraphrase_perc.py** <br>
Paraphrasing Percentage calculator.

____
____

# EMBEDDINGS (embeddings/)

**corpus.fasttext.txt**, **corpus.fasttext.fr** <br>
Fasttext embeddings on a big IWSLT corpus, used in the original VMF paper, provided by Sachin. 
**corpus.fasttext.both** <br>
Both the language embeddings concatenated.

**original.fasttext.txt**, **original.fasttext.fr** <br>
Pre-trained fasttext embeddings obtained directly from the Fasttext website.

**mapped.fasttext.txt**, **mapped.fasttext.fr** <br>
The above embeddings mapped into the same space using a cross-lingual vector mapping tool.
**mapped.fasttext.both** <br>
Both the language embeddings concatenated.

**en-fr.seed**, **fr-en.seed** <br>
Seed dictionaries in both the directions, used by the cross-lingual mapping tool

**eng.txt** <br>
List of all English words.

____
____

# DUMP (dump/)

	In all the folders, files of the form vmf.vocab.pt, vmf.train\*.pt and vmf.valid\*.pt correspond to preprocessed data for the model.

**vmf** <br>
ParaVMF model with IWSLT autoencoding data

**vmfpara** <br>
ParaVMF model with ParaNMT autoencoding data

**ce** <br>
ParaCE model with IWSLT autoencoding data

**frenvmf** <br>
French to English translation model with VMF loss

**frence** <br>
French to English translation model with CE loss

**enfrvmf** <br>
English to French translation model with VMF loss

**enfrce** <br>
English to French translation model with CE loss

**vmffr** <br>
ParaVMF model with IWSLT French autoencoding data

**cefr** <br>
ParaCE model with IWSLT French autoencoding data

**big** <br>
ParaVMF model with big dataset - (40K) 1% autoencoding data

**big\_4k\_vmf** <br>
ParaVMF model with big dataset - 4K autoencoding data

**bigpara\_4k\_vmf** <br>
ParaVMF model with big dataset - 4K ParaNMT autoencoding data

**superpara\_vmf** <br>
Supervised paraphrasing model on ParaNMT with VMF loss

**superpara\_ce** <br>
Supervised paraphrasing model on ParaNMT with CE loss

____
____

# SCRIPTS (scripts/)


**data_creation.sh** <br>
Create data with two-way translation and auto-encoding in one language.

**noisy_data_creation.sh** <br>
Create data with two-way translation and noisy auto-encoding in one language.

**noisy_double_lang_data_creation.sh** <br>
Create data with two-way translation and noisy auto-encoding in two languages.

**tokenize.sh** <br>
Using Moses to tokenize files, train a truecaser model and use that to truecase files.

**vmf.sh** <br>
ParaVMF Model with two sources of autoencoding data: IWSLT and ParaNMT. Translation data is always IWSLT, of course.

**vmf_joint.sh** <br>
ParaVMF Model with IWSLT autoencoding data in both English and French.

**ce.sh** <br>
ParaCE Model with IWSLT autoencoding data in both English and French

**translation_vmf.sh** <br>
Translation models, both ways - VMF loss.

**translation_ce.sh** <br>
Translation models, both ways - CE loss.

**bilingual_pivoting.sh** <br>
Bilingual Pivoting using the already trained translation models - both VMF and CE losses.

**french_paraphrasing.sh** <br>
ParaVMF, ParaCE, Bilingual Pivoting with VMF and Bilingual Pivoting with CE models - to paraphrase in French. The ParaVMF and ParaCE have the autoencoding data in French, whereas the bilingual pivoting models use the existing translation models.

**backtranslation.sh** <br>
Backtranslation using the already trained translation models - both VMF and CE losses.

**big_vmf.sh** <br>
Models using John's dataset with 4000 autoencoding data points rather than 1% in the ParaVMF model with two types of autoencoding data: with and without noising. 

**big_ce.sh** <br>
Models using John's dataset with 4000 autoencoding data points rather than 1% in the ParaCE model with two types of autoencoding data: with and without noising. 

**big_vmf_french.sh** <br>
Models using John's dataset with 4000 denoising data points, but for paraphrasing in French with the vMF loss.

**big_ce_french.sh** <br>
Models using John's dataset with 4000 denoising data points, but for paraphrasing in French with the CE loss.

**ablation.sh** <br>
Ablation models for ParaVMF: <br>
- No language start token at source/encoder <br>
- No autoencoding data at all

**evaluation.sh** <br>
Post-processing and Evaluation with different metrics

**evaluation_per_line.sh** <br>
Post-processing and Evaluation with different metrics for each individual sentence

**evaluation_util.sh** <br>
Utility script to assign variables helpful for evaluation. 
Add lines here for each new model.

**multiple\_validation\_sets.sh** <br>
Preprocess data when feeding multiple validation sets.

**supervision.sh** <br>
Supervised training on ParanMT dataset - VMF and CE losses



____
____



